Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DF539DE73
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 16:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620AE6E8DE;
	Mon,  7 Jun 2021 14:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8CB6E8DC
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 14:15:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id h3so10165044wmq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 07:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=IW8ZoegfOZWEQlU2rNIVkkosxMjtt1cTaff6c7yLfxg=;
 b=UJuzqgoQe7hbA/+UnbLPhQlr9lVzAVSIdBSGxALR/PA22iKhYpx9p6RpmpJUfs3dMj
 9uwITNzG91YjMyN82nYJ6abJA/vbeRxEzrS+WQtHU+fXPXhLbm4zvYcUYUbEm6601nfc
 G43E2dcNibsG+ZOChCDQ4/jN50mnJvWoAGzSxoLvITjkKO/FjfCTaFvh6HRrF/VY0frw
 AqFl62rUnh4ANZZp3ockQ3IRa4uK807R2IxIV5PdpS35PNxrxClSFACSgYMN3QZXudDA
 sZsiYacC8XPC3+FWFDCW/yQETqr8vlkeyYE5m0ZKWzGuX3wAjxShiz8D7FoHDqNSvILt
 WhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=IW8ZoegfOZWEQlU2rNIVkkosxMjtt1cTaff6c7yLfxg=;
 b=cjxGsgLcfgdtzvHzDk3ucAwHY8CasSok6VP6AoYXdcXfl/bAeEpdb5gouFb7tlvQFr
 D4K8LQaB95MMf5n8c5XxCCuCBnQDHdxq+6gW6RPWRuRqgFc0ZxokMGMubL30WtmD2r9V
 yjGoGdzZTDueI/1u1BcC4eiEyBD63uPM0Btvz2XhZXNjHXai2lWhA8bLtwApMwfQgRrl
 8uHi6YZ+91lVpyU9WpBN8kmbpcd7p3JYqNGHcGov3/Qu2KGWwMQs2VUol8oChn8ZmpS+
 Aok26HYI3e0xqhRcbUmUC/SU02wfPod1gwH9adxZC4knqkNB85MZveAMnqBVyCT+0cz8
 Rj8g==
X-Gm-Message-State: AOAM530roMYUhPGuwp2vUz133N1tPsXfwzXrMmAOnysuwI4/rVjiqIsl
 1qGKIZYcoGJvmlzhBpZACGI=
X-Google-Smtp-Source: ABdhPJz+GIpltMWT3dNjpCgkWAmnKGhVOvgCTIFVBXXHeMifDBm+Caa86clJiNYjeJEH27TnaGsYYA==
X-Received: by 2002:a05:600c:3586:: with SMTP id
 p6mr8534568wmq.28.1623075335266; 
 Mon, 07 Jun 2021 07:15:35 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ce67:4e4d:875d:ffeb?
 ([2a02:908:1252:fb60:ce67:4e4d:875d:ffeb])
 by smtp.gmail.com with ESMTPSA id p12sm16421128wme.43.2021.06.07.07.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 07:15:34 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: fix deref of bo->ttm without holding the lock v2
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Das, Nirmoy" <Nirmoy.Das@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
References: <20210528130041.1683-1-christian.koenig@amd.com>
 <aa17b7d5-1c44-4d2b-431f-5f361481f039@linux.intel.com>
 <279b72f6-cf27-c1bb-370e-a04348387105@gmail.com>
 <DM4PR12MB5165EDA10869E4A37D94CED387389@DM4PR12MB5165.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d21cf211-614f-5746-7a22-faf33c31b78b@gmail.com>
Date: Mon, 7 Jun 2021 16:15:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <DM4PR12MB5165EDA10869E4A37D94CED387389@DM4PR12MB5165.namprd12.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------7BE0B58E488B6F4ACD2D5AB0"
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------7BE0B58E488B6F4ACD2D5AB0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

I take that as an reviewed-by :)

Thanks,
Christian.

Am 07.06.21 um 16:14 schrieb Pan, Xinhui:
>
> [AMD Official Use Only]
>
>
> Looks good to me.
> ------------------------------------------------------------------------
> *From:* Christian König <ckoenig.leichtzumerken@gmail.com>
> *Sent:* Monday, June 7, 2021 8:52:21 PM
> *To:* dri-devel@lists.freedesktop.org 
> <dri-devel@lists.freedesktop.org>; Pan, Xinhui <Xinhui.Pan@amd.com>; 
> Das, Nirmoy <Nirmoy.Das@amd.com>; Huang, Ray <Ray.Huang@amd.com>
> *Cc:* Thomas Hellström <thomas.hellstrom@linux.intel.com>
> *Subject:* Re: [PATCH] drm/ttm: fix deref of bo->ttm without holding 
> the lock v2
>
>
> Am 28.05.21 um 15:06 schrieb Thomas Hellström:
> >
> > On 5/28/21 3:00 PM, Christian König wrote:
> >> We need to grab the resv lock first before doing that check.
> >>
> >> v2 (chk): simplify the change for -fixes
> >>
> >> Signed-off-by: Christian König <christian.koenig@amd.com>
> >> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> >
> > Hmm, OK, but this doesn't fix the swapped-bo-not-on-lru and
> > unpopulating from swap_notify issues. Are you planning a follow up
> > patch for those?
>
> As discussed in a separate thread this needs to be applied as needed
> when the DG1 branch is merged.
>
> Xinhui, Nirmoy, Rui can anybody give be an rb/ab so that I can push this?
>
> Thanks,
> Christian.
>
> >
> > Thanks,
> >
> > Thomas
> >
> >> ---
> >>   drivers/gpu/drm/ttm/ttm_bo.c     | 5 ++++-
> >>   drivers/gpu/drm/ttm/ttm_device.c | 8 +-------
> >>   2 files changed, 5 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
> b/drivers/gpu/drm/ttm/ttm_bo.c
> >> index cfd0b9292397..ebcffe794adb 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> >> @@ -1172,7 +1172,10 @@ int ttm_bo_swapout(struct ttm_buffer_object
> >> *bo, struct ttm_operation_ctx *ctx,
> >>       if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked, NULL))
> >>           return -EBUSY;
> >>   -    if (!ttm_bo_get_unless_zero(bo)) {
> >> +    if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
> >> +        bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
> >> +        bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED ||
> >> +        !ttm_bo_get_unless_zero(bo)) {
> >>           if (locked)
> >> dma_resv_unlock(bo->base.resv);
> >>           return -EBUSY;
> >> diff --git a/drivers/gpu/drm/ttm/ttm_device.c
> >> b/drivers/gpu/drm/ttm/ttm_device.c
> >> index a1dcf7d55c90..3d9c62b93e29 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_device.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> >> @@ -143,14 +143,8 @@ int ttm_device_swapout(struct ttm_device *bdev,
> >> struct ttm_operation_ctx *ctx,
> >>             for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
> >>               list_for_each_entry(bo, &man->lru[j], lru) {
> >> -                uint32_t num_pages;
> >> +                uint32_t num_pages = PFN_UP(bo->base.size);
> >>   -                if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
> >> -                    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
> >> -                    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
> >> -                    continue;
> >> -
> >> -                num_pages = bo->ttm->num_pages;
> >>                   ret = ttm_bo_swapout(bo, ctx, gfp_flags);
> >>                   /* ttm_bo_swapout has dropped the lru_lock */
> >>                   if (!ret)
>


--------------7BE0B58E488B6F4ACD2D5AB0
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    I take that as an reviewed-by :)<br>
    <br>
    Thanks,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 07.06.21 um 16:14 schrieb Pan,
      Xinhui:<br>
    </div>
    <blockquote type="cite"
cite="mid:DM4PR12MB5165EDA10869E4A37D94CED387389@DM4PR12MB5165.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <p
        style="font-family:Arial;font-size:10pt;color:#0000FF;margin:15pt;"
        align="Left">
        [AMD Official Use Only]<br>
      </p>
      <br>
      <div>
        <div dir="auto" style="direction: ltr; margin: 0px; padding:
          0px; font-family: sans-serif; font-size: 11pt; color: black;
          text-align: left;">
          Looks good to me.</div>
        <hr style="display:inline-block;width:98%" tabindex="-1">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
            face="Calibri, sans-serif" color="#000000"><b>From:</b>
            Christian König <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a><br>
            <b>Sent:</b> Monday, June 7, 2021 8:52:21 PM<br>
            <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>; Pan, Xinhui
            <a class="moz-txt-link-rfc2396E" href="mailto:Xinhui.Pan@amd.com">&lt;Xinhui.Pan@amd.com&gt;</a>; Das, Nirmoy
            <a class="moz-txt-link-rfc2396E" href="mailto:Nirmoy.Das@amd.com">&lt;Nirmoy.Das@amd.com&gt;</a>; Huang, Ray
            <a class="moz-txt-link-rfc2396E" href="mailto:Ray.Huang@amd.com">&lt;Ray.Huang@amd.com&gt;</a><br>
            <b>Cc:</b> Thomas Hellström
            <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a><br>
            <b>Subject:</b> Re: [PATCH] drm/ttm: fix deref of bo-&gt;ttm
            without holding the lock v2</font>
          <div> </div>
        </div>
        <div class="BodyFragment"><font size="2"><span
              style="font-size:11pt;">
              <div class="PlainText"><br>
                <br>
                Am 28.05.21 um 15:06 schrieb Thomas Hellström:<br>
                &gt;<br>
                &gt; On 5/28/21 3:00 PM, Christian König wrote:<br>
                &gt;&gt; We need to grab the resv lock first before
                doing that check.<br>
                &gt;&gt;<br>
                &gt;&gt; v2 (chk): simplify the change for -fixes<br>
                &gt;&gt;<br>
                &gt;&gt; Signed-off-by: Christian König
                <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
                &gt;&gt; Signed-off-by: Thomas Hellström
                <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a><br>
                &gt;<br>
                &gt; Hmm, OK, but this doesn't fix the
                swapped-bo-not-on-lru and <br>
                &gt; unpopulating from swap_notify issues. Are you
                planning a follow up <br>
                &gt; patch for those?<br>
                <br>
                As discussed in a separate thread this needs to be
                applied as needed <br>
                when the DG1 branch is merged.<br>
                <br>
                Xinhui, Nirmoy, Rui can anybody give be an rb/ab so that
                I can push this?<br>
                <br>
                Thanks,<br>
                Christian.<br>
                <br>
                &gt;<br>
                &gt; Thanks,<br>
                &gt;<br>
                &gt; Thomas<br>
                &gt;<br>
                &gt;&gt; ---<br>
                &gt;&gt;   drivers/gpu/drm/ttm/ttm_bo.c     | 5 ++++-<br>
                &gt;&gt;   drivers/gpu/drm/ttm/ttm_device.c | 8 +-------<br>
                &gt;&gt;   2 files changed, 5 insertions(+), 8
                deletions(-)<br>
                &gt;&gt;<br>
                &gt;&gt; diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
                b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                &gt;&gt; index cfd0b9292397..ebcffe794adb 100644<br>
                &gt;&gt; --- a/drivers/gpu/drm/ttm/ttm_bo.c<br>
                &gt;&gt; +++ b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                &gt;&gt; @@ -1172,7 +1172,10 @@ int
                ttm_bo_swapout(struct ttm_buffer_object <br>
                &gt;&gt; *bo, struct ttm_operation_ctx *ctx,<br>
                &gt;&gt;       if (!ttm_bo_evict_swapout_allowable(bo,
                ctx, &amp;locked, NULL))<br>
                &gt;&gt;           return -EBUSY;<br>
                &gt;&gt;   -    if (!ttm_bo_get_unless_zero(bo)) {<br>
                &gt;&gt; +    if (!bo-&gt;ttm ||
                !ttm_tt_is_populated(bo-&gt;ttm) ||<br>
                &gt;&gt; +        bo-&gt;ttm-&gt;page_flags &amp;
                TTM_PAGE_FLAG_SG ||<br>
                &gt;&gt; +        bo-&gt;ttm-&gt;page_flags &amp;
                TTM_PAGE_FLAG_SWAPPED ||<br>
                &gt;&gt; +        !ttm_bo_get_unless_zero(bo)) {<br>
                &gt;&gt;           if (locked)<br>
                &gt;&gt;              
                dma_resv_unlock(bo-&gt;base.resv);<br>
                &gt;&gt;           return -EBUSY;<br>
                &gt;&gt; diff --git a/drivers/gpu/drm/ttm/ttm_device.c <br>
                &gt;&gt; b/drivers/gpu/drm/ttm/ttm_device.c<br>
                &gt;&gt; index a1dcf7d55c90..3d9c62b93e29 100644<br>
                &gt;&gt; --- a/drivers/gpu/drm/ttm/ttm_device.c<br>
                &gt;&gt; +++ b/drivers/gpu/drm/ttm/ttm_device.c<br>
                &gt;&gt; @@ -143,14 +143,8 @@ int
                ttm_device_swapout(struct ttm_device *bdev, <br>
                &gt;&gt; struct ttm_operation_ctx *ctx,<br>
                &gt;&gt;             for (j = 0; j &lt;
                TTM_MAX_BO_PRIORITY; ++j) {<br>
                &gt;&gt;               list_for_each_entry(bo,
                &amp;man-&gt;lru[j], lru) {<br>
                &gt;&gt; -                uint32_t num_pages;<br>
                &gt;&gt; +                uint32_t num_pages =
                PFN_UP(bo-&gt;base.size);<br>
                &gt;&gt;   -                if (!bo-&gt;ttm ||
                !ttm_tt_is_populated(bo-&gt;ttm) ||<br>
                &gt;&gt; -                    bo-&gt;ttm-&gt;page_flags
                &amp; TTM_PAGE_FLAG_SG ||<br>
                &gt;&gt; -                    bo-&gt;ttm-&gt;page_flags
                &amp; TTM_PAGE_FLAG_SWAPPED)<br>
                &gt;&gt; -                    continue;<br>
                &gt;&gt; -<br>
                &gt;&gt; -                num_pages =
                bo-&gt;ttm-&gt;num_pages;<br>
                &gt;&gt;                   ret = ttm_bo_swapout(bo, ctx,
                gfp_flags);<br>
                &gt;&gt;                   /* ttm_bo_swapout has dropped
                the lru_lock */<br>
                &gt;&gt;                   if (!ret)<br>
                <br>
              </div>
            </span></font></div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------7BE0B58E488B6F4ACD2D5AB0--
