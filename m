Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65751E8BC
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1948951B;
	Wed, 15 May 2019 07:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CB8894FE;
 Wed, 15 May 2019 07:04:56 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s17so1342766wru.3;
 Wed, 15 May 2019 00:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=YzlDmsNlj8KUBBL6wgvc1eL7D5W+zHBWka1c/BROLhw=;
 b=su5DGTh6KPzDtz+bvvj8VongSO1r2PmIGwirQ8JUTmGRoDP81zZo9MOypuF4dXgenZ
 MXXkuPMlnReLS2+2YTPHC1no0gkQ9J8oGp4hcqIQCzFSHN8p2zTu6hlSrWV4ldDtVoq2
 3yOg94JHTgI1BCX1+JtX+MSxHVuhBiTbk4hsxUthq/2yO/pNKbMC6hQ/AGq7lG8OZHCB
 B6UUP9waHTuS1jZQgvqrWZO3S3wfuorAdrBz2d1+Lfv8PnI1fJmsYAibGRXcEDommpfE
 HzM6Gr9N2OglDayg2QpUTjkJuBpFexEcDBcfcDbAtg/dE2eELLh5aZ7p/m4Ki4gigypv
 zKKw==
X-Gm-Message-State: APjAAAXb2rgUkheV6MRIAhfsDx7RpZfhG5g39poLzPsbwvvPqHFwD9+D
 8nJ6NuojjFfSUtjuhT+4kXpLMKbC
X-Google-Smtp-Source: APXvYqzHY/EX6RYbo6zheoR9zNOXLChFedWj0pO8ILaCFGO8wU28bzk3LlkB5pYARNZjZ4nTEB9Stw==
X-Received: by 2002:adf:f488:: with SMTP id l8mr22021717wro.287.1557903894727; 
 Wed, 15 May 2019 00:04:54 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id n63sm1227964wmn.38.2019.05.15.00.04.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 00:04:54 -0700 (PDT)
Subject: Re: [PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU during CS
To: "Liang, Prike" <Prike.Liang@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <maraeo@gmail.com>
References: <20190514123127.1650-1-christian.koenig@amd.com>
 <20190514123127.1650-11-christian.koenig@amd.com>
 <CAAxE2A6Z45NCy7v5fPqmo5o5ZEnmvv_f=qax0uoDS9amMFEB7w@mail.gmail.com>
 <BYAPR12MB35256D8A0583B5DD019C2925FB090@BYAPR12MB3525.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5d6b76f9-5402-989d-1fa8-d807cea1bfe3@gmail.com>
Date: Wed, 15 May 2019 09:04:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <BYAPR12MB35256D8A0583B5DD019C2925FB090@BYAPR12MB3525.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=YzlDmsNlj8KUBBL6wgvc1eL7D5W+zHBWka1c/BROLhw=;
 b=ZiDgFvtZwDlHPoH3HM4dXs/0a6TDDsHxGYzSbFzMon5iauRoqZbsL77jMWjzA/YQu8
 pFP3YNp+r4SXYHvJngzXjysxVmXsPlD748PN8MNSdqNnmsisIlGGIBU3VFzd2cCTxM9e
 WTlGhi3pi4H4GZ/hBIP+McvRe+cTiyL/2ZmySvnK2uojTLhgaIghjsxGul/H1fKOz5KI
 F0kYwY006VVrb1JDdRH3kgZ4B2FpTzBECZKffz0Qt7D8QvHWe/hc3tN2MErv73NoOkQa
 98TeDV0dyUFJ2AZ6VtZVp2UzQXIAjjFn9ijNlrNP+HAWze2QNhmeDJfZ5Imz/FWMJ8P0
 xHVw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Reply-To: christian.koenig@amd.com
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0301583228=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0301583228==
Content-Type: multipart/alternative;
 boundary="------------00764539B5BAA9568D6C6EDA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------00764539B5BAA9568D6C6EDA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Prike,

no, that can lead to massive problems in a real OOM situation and is not 
something we can do here.

Christian.

Am 15.05.19 um 04:00 schrieb Liang, Prike:
>
> Hi Christian ,
>
> I just wonder when encounter ENOMEM error during pin amdgpu BOs can we 
> retry validate again as below.
>
> With the following simply patch the Abaqus pinned issue not observed.
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c 
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>
> index 11cbf63..72a32f5 100644
>
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>
> @@ -902,11 +902,15 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo 
> *bo, u32 domain,
>
> bo->placements[i].lpfn = lpfn;
>
>                 bo->placements[i].flags |= TTM_PL_FLAG_NO_EVICT;
>
>         }
>
> -
>
> +retry:
>
>         r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>
>         if (unlikely(r)) {
>
> -               dev_err(adev->dev, "%p pin failed\n", bo);
>
> -               goto error;
>
> +                if (r == -ENOMEM){
>
> +                        goto retry;
>
> +                } else {
>
> + dev_err(adev->dev, "%p pin failed\n", bo);
>
> +                       goto error;
>
> +                }
>
>         }
>
>         bo->pin_count = 1;
>
> Thanks,
>
> Prike
>
> *From:* Marek Olšák <maraeo@gmail.com>
> *Sent:* Wednesday, May 15, 2019 3:33 AM
> *To:* Christian König <ckoenig.leichtzumerken@gmail.com>
> *Cc:* Zhou, David(ChunMing) <David1.Zhou@amd.com>; Liang, Prike 
> <Prike.Liang@amd.com>; dri-devel <dri-devel@lists.freedesktop.org>; 
> amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
> *Subject:* Re: [PATCH 11/11] drm/amdgpu: stop removing BOs from the 
> LRU during CS
>
> [CAUTION: External Email]
>
> This series fixes the OOM errors. However, if I torture the kernel 
> driver more, I can get it to deadlock and end up with unkillable 
> processes. I can also get an OOM error. I just ran the test 5 times:
>
> AMD_DEBUG=testgdsmm glxgears & AMD_DEBUG=testgdsmm glxgears & 
> AMD_DEBUG=testgdsmm glxgears & AMD_DEBUG=testgdsmm glxgears & 
> AMD_DEBUG=testgdsmm glxgears
>
> Marek
>
> On Tue, May 14, 2019 at 8:31 AM Christian König 
> <ckoenig.leichtzumerken@gmail.com 
> <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
>
>     This avoids OOM situations when we have lots of threads
>     submitting at the same time.
>
>     Signed-off-by: Christian König <christian.koenig@amd.com
>     <mailto:christian.koenig@amd.com>>
>     ---
>      drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>     b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>     index fff558cf385b..f9240a94217b 100644
>     --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>     +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>     @@ -648,7 +648,7 @@ static int amdgpu_cs_parser_bos(struct
>     amdgpu_cs_parser *p,
>             }
>
>             r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
>     -                                  &duplicates, true);
>     +                                  &duplicates, false);
>             if (unlikely(r != 0)) {
>                     if (r != -ERESTARTSYS)
>     DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
>     -- 
>     2.17.1
>
>     _______________________________________________
>     amd-gfx mailing list
>     amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org>
>     https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>


--------------00764539B5BAA9568D6C6EDA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Hi Prike,<br>
      <br>
      no, that can lead to massive problems in a real OOM situation and
      is not something we can do here.<br>
      <br>
      Christian.<br>
      <br>
      Am 15.05.19 um 04:00 schrieb Liang, Prike:<br>
    </div>
    <blockquote type="cite"
cite="mid:BYAPR12MB35256D8A0583B5DD019C2925FB090@BYAPR12MB3525.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@等线";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Hi Christian ,<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">I just wonder when encounter ENOMEM error
          during pin amdgpu BOs can we retry validate again as below.<o:p></o:p></p>
        <p class="MsoNormal">With the following simply patch the Abaqus
          pinned issue not observed.
          <o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">diff --git
          a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
          b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c<o:p></o:p></p>
        <p class="MsoNormal">index 11cbf63..72a32f5 100644<o:p></o:p></p>
        <p class="MsoNormal">---
          a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c<o:p></o:p></p>
        <p class="MsoNormal">+++
          b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c<o:p></o:p></p>
        <p class="MsoNormal">@@ -902,11 +902,15 @@ int
          amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u32 domain,<o:p></o:p></p>
        <p class="MsoNormal">                       
          bo-&gt;placements[i].lpfn = lpfn;<o:p></o:p></p>
        <p class="MsoNormal">                bo-&gt;placements[i].flags
          |= TTM_PL_FLAG_NO_EVICT;<o:p></o:p></p>
        <p class="MsoNormal">        }<o:p></o:p></p>
        <p class="MsoNormal">-<o:p></o:p></p>
        <p class="MsoNormal">+retry:<o:p></o:p></p>
        <p class="MsoNormal">        r =
          ttm_bo_validate(&amp;bo-&gt;tbo, &amp;bo-&gt;placement,
          &amp;ctx);<o:p></o:p></p>
        <p class="MsoNormal">        if (unlikely(r)) {<o:p></o:p></p>
        <p class="MsoNormal">-               dev_err(adev-&gt;dev, "%p
          pin failed\n", bo);<o:p></o:p></p>
        <p class="MsoNormal">-               goto error;<o:p></o:p></p>
        <p class="MsoNormal">+                if (r == -ENOMEM){<o:p></o:p></p>
        <p class="MsoNormal">+                        goto retry;<o:p></o:p></p>
        <p class="MsoNormal">+                } else {<o:p></o:p></p>
        <p class="MsoNormal">+                      
          dev_err(adev-&gt;dev, "%p pin failed\n", bo);<o:p></o:p></p>
        <p class="MsoNormal">+                       goto error;<o:p></o:p></p>
        <p class="MsoNormal">+                }<o:p></o:p></p>
        <p class="MsoNormal">        }<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">        bo-&gt;pin_count = 1;<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Thanks,<o:p></o:p></p>
        <p class="MsoNormal">Prike<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <div>
          <div style="border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0in 0in 0in">
            <p class="MsoNormal"><b>From:</b> Marek Olšák
              <a class="moz-txt-link-rfc2396E" href="mailto:maraeo@gmail.com">&lt;maraeo@gmail.com&gt;</a> <br>
              <b>Sent:</b> Wednesday, May 15, 2019 3:33 AM<br>
              <b>To:</b> Christian König
              <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a><br>
              <b>Cc:</b> Zhou, David(ChunMing)
              <a class="moz-txt-link-rfc2396E" href="mailto:David1.Zhou@amd.com">&lt;David1.Zhou@amd.com&gt;</a>; Liang, Prike
              <a class="moz-txt-link-rfc2396E" href="mailto:Prike.Liang@amd.com">&lt;Prike.Liang@amd.com&gt;</a>; dri-devel
              <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>; amd-gfx mailing
              list <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
              <b>Subject:</b> Re: [PATCH 11/11] drm/amdgpu: stop
              removing BOs from the LRU during CS<o:p></o:p></p>
          </div>
        </div>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">[CAUTION: External Email] <o:p></o:p></p>
        <div>
          <div>
            <div>
              <div>
                <p class="MsoNormal">This series fixes the OOM errors.
                  However, if I torture the kernel driver more, I can
                  get it to deadlock and end up with unkillable
                  processes. I can also get an OOM error. I just ran the
                  test 5 times:<o:p></o:p></p>
              </div>
              <div>
                <p class="MsoNormal"><o:p> </o:p></p>
              </div>
              <div>
                <p class="MsoNormal">AMD_DEBUG=testgdsmm glxgears &amp;
                  AMD_DEBUG=testgdsmm glxgears &amp; AMD_DEBUG=testgdsmm
                  glxgears &amp; AMD_DEBUG=testgdsmm glxgears &amp;
                  AMD_DEBUG=testgdsmm glxgears<o:p></o:p></p>
              </div>
              <p class="MsoNormal"><o:p> </o:p></p>
              <div>
                <p class="MsoNormal">Marek<o:p></o:p></p>
              </div>
            </div>
          </div>
          <p class="MsoNormal"><o:p> </o:p></p>
          <div>
            <div>
              <p class="MsoNormal">On Tue, May 14, 2019 at 8:31 AM
                Christian König &lt;<a
                  href="mailto:ckoenig.leichtzumerken@gmail.com"
                  moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;
                wrote:<o:p></o:p></p>
            </div>
            <blockquote style="border:none;border-left:solid #CCCCCC
              1.0pt;padding:0in 0in 0in
              6.0pt;margin-left:4.8pt;margin-right:0in">
              <p class="MsoNormal">This avoids OOM situations when we
                have lots of threads<br>
                submitting at the same time.<br>
                <br>
                Signed-off-by: Christian König &lt;<a
                  href="mailto:christian.koenig@amd.com" target="_blank"
                  moz-do-not-send="true">christian.koenig@amd.com</a>&gt;<br>
                ---<br>
                 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-<br>
                 1 file changed, 1 insertion(+), 1 deletion(-)<br>
                <br>
                diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
                b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
                index fff558cf385b..f9240a94217b 100644<br>
                --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
                +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
                @@ -648,7 +648,7 @@ static int
                amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,<br>
                        }<br>
                <br>
                        r = ttm_eu_reserve_buffers(&amp;p-&gt;ticket,
                &amp;p-&gt;validated, true,<br>
                -                                  &amp;duplicates,
                true);<br>
                +                                  &amp;duplicates,
                false);<br>
                        if (unlikely(r != 0)) {<br>
                                if (r != -ERESTARTSYS)<br>
                                       
                DRM_ERROR("ttm_eu_reserve_buffers failed.\n");<br>
                -- <br>
                2.17.1<br>
                <br>
                _______________________________________________<br>
                amd-gfx mailing list<br>
                <a href="mailto:amd-gfx@lists.freedesktop.org"
                  target="_blank" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
                <a
                  href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx"
                  target="_blank" moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></p>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------00764539B5BAA9568D6C6EDA--

--===============0301583228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0301583228==--
