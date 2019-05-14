Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B55D1C991
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 15:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF73892BF;
	Tue, 14 May 2019 13:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEC5892BE;
 Tue, 14 May 2019 13:47:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h4so19317086wre.7;
 Tue, 14 May 2019 06:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language;
 bh=HONvf/3qcMXBVhPxIIpTF3InUt1a3Ob6BnaeKGB/2/A=;
 b=TLXtGxHXv62SIqJ1/cZMS5I8b8wTSxAfWzJDgfhiAI+mSe5Cz1dKSpCpM2O+GyI9ek
 Zr5o9cSXGfI/yhOU8hIrltI1XnrBF4/qgYF99RNu2SZbeodPol/Mpv9x5q5Up6z2KQvT
 F9hTGY1RyNVpLQpMRklDOPasnlyawdnRE0W27mYgHD6VotNFdv9XdqjqHPiwHONfwOOG
 I5o11/CinEMqTGhxIDZ4X2Dp7U+zVbOGqASAuIC41clulHsto7NMjP1iymrbJh93tloX
 bhxs36ij5VqDFa17/4ofN5jNDmOTAGYBXfpDmwGKAQcsqH1jggkKcqAV4pVB+73wpEWk
 9mhA==
X-Gm-Message-State: APjAAAWXI+c/9NzNs6sDnW2h5DpX9Nvd86k+v5qkdRTeOyVMYA4LgQdk
 GYYLOdPX15k2spzTVTSlfnHljrbZ
X-Google-Smtp-Source: APXvYqxHezK99GNufuecKZZeMyp0Ldj3nZfXQrxn+xAMfOKrMjX8jqvrgYSCKrC4TrJrvFwBRSFAmA==
X-Received: by 2002:a5d:4411:: with SMTP id z17mr11848094wrq.168.1557841628494; 
 Tue, 14 May 2019 06:47:08 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id n14sm11281727wrt.79.2019.05.14.06.47.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 06:47:07 -0700 (PDT)
Subject: Re: [PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU during CS
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "Olsak, Marek" <Marek.Olsak@amd.com>, "Liang, Prike" <Prike.Liang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190514123127.1650-1-christian.koenig@amd.com>
 <20190514123127.1650-11-christian.koenig@amd.com>
 <-vf7xt3-qgf5mz-veq8ih-okgxtz-9ehg3tx8dyemoidihe-fwj066fntvvx-x3y4nh-bn07hl-82anfo4oofx-4di7gg-3nkfhtbcgh58-yj9ws0-pthytc-oq9qcxd40s4g-249dv8-x6wbfujry6xi-mu2nvl.1557839540398@email.android.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f9017911-b08a-1f98-3fc9-98121bbde78a@gmail.com>
Date: Tue, 14 May 2019 15:47:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <-vf7xt3-qgf5mz-veq8ih-okgxtz-9ehg3tx8dyemoidihe-fwj066fntvvx-x3y4nh-bn07hl-82anfo4oofx-4di7gg-3nkfhtbcgh58-yj9ws0-pthytc-oq9qcxd40s4g-249dv8-x6wbfujry6xi-mu2nvl.1557839540398@email.android.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=HONvf/3qcMXBVhPxIIpTF3InUt1a3Ob6BnaeKGB/2/A=;
 b=ldYwqjLcxjn14RaZmJnppSEQ3+GLOT8f5GT+zlIlA15nWIu2ImmNktAzTzUc4oCnVh
 x42uSlMhY4GzwG4V/yG413t8DqyHaZM3Yda28kotfIr13k+Q3wihUXPBqqjiNgehC3tM
 qPuw2MHDH9ymWJsjL/oR8essrHgLHcqe2CwYYNPFDJUjOVaa6PWTybBNWDfl7fnc/mSG
 8gueZH8pBGZTZY8XseUaZIN5we2Q/0vZO5XzA9OzXzWPssDXqhnApdPWTtvhKo/BhsWC
 z+Z6vYIE+qj1ExpELyHeU4ut5nTtOgXlupK4HEDw8HUtpf+6aI/X35BjHoSkhgSFdhL8
 rtlA==
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
Content-Type: multipart/mixed; boundary="===============0474673352=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0474673352==
Content-Type: multipart/alternative;
 boundary="------------84DE613EEAB1B4265261C3A5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------84DE613EEAB1B4265261C3A5
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hui? What do you mean with that?

Christian.

Am 14.05.19 um 15:12 schrieb Zhou, David(ChunMing):
> my only concern is how to fresh LRU when bo is from bo list.
>
> -David
>
> -------- Original Message --------
> Subject: [PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU 
> during CS
> From: Christian König
> To: "Olsak, Marek" ,"Zhou, David(ChunMing)" ,"Liang, Prike" 
> ,dri-devel@lists.freedesktop.org,amd-gfx@lists.freedesktop.org
> CC:
>
> [CAUTION: External Email]
>
> This avoids OOM situations when we have lots of threads
> submitting at the same time.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c 
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index fff558cf385b..f9240a94217b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -648,7 +648,7 @@ static int amdgpu_cs_parser_bos(struct 
> amdgpu_cs_parser *p,
>         }
>
>         r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
> -                                  &duplicates, true);
> +                                  &duplicates, false);
>         if (unlikely(r != 0)) {
>                 if (r != -ERESTARTSYS)
>                         DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
> --
> 2.17.1
>


--------------84DE613EEAB1B4265261C3A5
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Hui? What do you mean with that?<br>
      <br>
      Christian.<br>
      <br>
      Am 14.05.19 um 15:12 schrieb Zhou, David(ChunMing):<br>
    </div>
    <blockquote type="cite"
cite="mid:-vf7xt3-qgf5mz-veq8ih-okgxtz-9ehg3tx8dyemoidihe-fwj066fntvvx-x3y4nh-bn07hl-82anfo4oofx-4di7gg-3nkfhtbcgh58-yj9ws0-pthytc-oq9qcxd40s4g-249dv8-x6wbfujry6xi-mu2nvl.1557839540398@email.android.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Exchange Server">
      <!-- converted from text -->
      <style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left: #800000 2px solid; } --></style>
      <div>my only concern is how to fresh LRU when bo is from bo list.<br>
        <br>
        -David<br>
        <br>
        -------- Original Message --------<br>
        Subject: [PATCH 11/11] drm/amdgpu: stop removing BOs from the
        LRU during CS<br>
        From: Christian König <br>
        To: "Olsak, Marek" ,"Zhou, David(ChunMing)" ,"Liang, Prike"
        ,<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org,amd-gfx@lists.freedesktop.org">dri-devel@lists.freedesktop.org,amd-gfx@lists.freedesktop.org</a><br>
        CC: <br>
        <br>
      </div>
      <font size="2"><span style="font-size:11pt;">
          <div class="PlainText">[CAUTION: External Email]<br>
            <br>
            This avoids OOM situations when we have lots of threads<br>
            submitting at the same time.<br>
            <br>
            Signed-off-by: Christian König
            <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
            ---<br>
             drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-<br>
             1 file changed, 1 insertion(+), 1 deletion(-)<br>
            <br>
            diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
            b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
            index fff558cf385b..f9240a94217b 100644<br>
            --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
            +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
            @@ -648,7 +648,7 @@ static int amdgpu_cs_parser_bos(struct
            amdgpu_cs_parser *p,<br>
                    }<br>
            <br>
                    r = ttm_eu_reserve_buffers(&amp;p-&gt;ticket,
            &amp;p-&gt;validated, true,<br>
            -                                  &amp;duplicates, true);<br>
            +                                  &amp;duplicates, false);<br>
                    if (unlikely(r != 0)) {<br>
                            if (r != -ERESTARTSYS)<br>
                                    DRM_ERROR("ttm_eu_reserve_buffers
            failed.\n");<br>
            --<br>
            2.17.1<br>
            <br>
          </div>
        </span></font>
    </blockquote>
    <br>
  </body>
</html>

--------------84DE613EEAB1B4265261C3A5--

--===============0474673352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0474673352==--
