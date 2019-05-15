Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E43C81F64E
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 16:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35D28929B;
	Wed, 15 May 2019 14:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6A889291;
 Wed, 15 May 2019 14:16:33 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h4so2879459wre.7;
 Wed, 15 May 2019 07:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language;
 bh=JvQOj1ySzjd0CHZAgN1fmsxONR3q1ok01JZFOcz9x8s=;
 b=sGN/plK45slBH0VEYDEQXRppZxvnHdf6FRoXAujC5lHYMjqa5N3rbpFOeYnZJlNCRw
 Nz+RgeRpmUV1QWkZN+ER4YYBvHXH2JcU6PrCg9UdKHaaWTsJvtM1J+SkeklU6h6/ZjG8
 n1RddXS9T4JRkdog/hi63TTIJOTegwuAFNPWTZ547zoxP5CT/W4jAx/951ubP/A7ky+v
 1JN7w/P1Oz5J5TFNY/P05zZccg4gLa+Nj91XPa3zzZmsnaYVrhE6ywXR4PvEp6VPLjLj
 UcNQL8M+tH3TPyUhllDwNzr//XtK0tdXqNvei6t05Uf79G4Z9UdyQT0t04SlaBXHCuxg
 0yGw==
X-Gm-Message-State: APjAAAWOwyq1lj1Wa/otPHel6LReuF99hyYozpulCvfTeERlC2VRyNfk
 pm34hdQLbuSeHWMAxkKl/17LxLzF
X-Google-Smtp-Source: APXvYqzZeoglhc/fC4BpBf0RxPWTN5Grf7y18IQrzJLRxgCnOOyZyMaIB8fe1AzAgLFwlLMawffYhg==
X-Received: by 2002:adf:dbcc:: with SMTP id e12mr1775273wrj.134.1557929791893; 
 Wed, 15 May 2019 07:16:31 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id k17sm2174955wrm.73.2019.05.15.07.16.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 07:16:30 -0700 (PDT)
Subject: Re: [PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU during CS
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Olsak, Marek" <Marek.Olsak@amd.com>, "Liang, Prike" <Prike.Liang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190514123127.1650-1-christian.koenig@amd.com>
 <20190514123127.1650-11-christian.koenig@amd.com>
 <-vf7xt3-qgf5mz-veq8ih-okgxtz-9ehg3tx8dyemoidihe-fwj066fntvvx-x3y4nh-bn07hl-82anfo4oofx-4di7gg-3nkfhtbcgh58-yj9ws0-pthytc-oq9qcxd40s4g-249dv8-x6wbfujry6xi-mu2nvl.1557839540398@email.android.com>
 <f9017911-b08a-1f98-3fc9-98121bbde78a@gmail.com>
 <-wsx1tz-kxfbz1yns7x33sra134gl11xhlux4lx3izissqr2httt4mb1vleyxgj8i7k6-q6ze8ub3ff8c4o0fxmx7niu76yg4-ybakue-3v14jw-ed5ol8ybh6o9-1ze886-hbstfi448pvq3pwhkj.1557844282594@email.android.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <451e8757-b509-c0f7-eced-6ccedc45117b@gmail.com>
Date: Wed, 15 May 2019 16:16:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <-wsx1tz-kxfbz1yns7x33sra134gl11xhlux4lx3izissqr2httt4mb1vleyxgj8i7k6-q6ze8ub3ff8c4o0fxmx7niu76yg4-ybakue-3v14jw-ed5ol8ybh6o9-1ze886-hbstfi448pvq3pwhkj.1557844282594@email.android.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=JvQOj1ySzjd0CHZAgN1fmsxONR3q1ok01JZFOcz9x8s=;
 b=f4JdP3eW9gw6ltUeyiGnDcZpaHjdfpL3kF52YIRjadSTuEQzErAJfDcBlhC3SKG0lH
 zKaxXQrhjOva8TBPqmIIUAoLGZ58JVbwtMs2CZUlwR+KHs6FZTjIj8rEBJfwgKlK4cVO
 c3Mvx9K8nNElfT0ulHXFJbapHKS3BW+/RdIqowI81QO+GcF1jX4/I7YJhb+sv35ZdMai
 mMu07GiAD2IIK3y4Fqpc9HXyvVc4ryAkldCYAbHLqmVaI8EvgvTyF4/D1LKVmY25ZBJo
 CwN1tDxVbn6FFwLf82R1TeDxiu9ABG2aqZqt2QBTRR1/pcfvHSqxBi0liR26/9HB3r5t
 8Bxw==
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
Content-Type: multipart/mixed; boundary="===============1977393121=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1977393121==
Content-Type: multipart/alternative;
 boundary="------------561008C46C49D0E900F6669C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------561008C46C49D0E900F6669C
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

That is a good point, but actually not a problem in practice.

See the change to ttm_eu_fence_buffer_objects:
> -               ttm_bo_add_to_lru(bo);
> +               if (list_empty(&bo->lru))
> +                       ttm_bo_add_to_lru(bo);
> +               else
> +                       ttm_bo_move_to_lru_tail(bo, NULL);

We still move the BOs to the end of the LRU in the same order we have 
before, we just don't remove them when they are reserved.

Regards,
Christian.

Am 14.05.19 um 16:31 schrieb Zhou, David(ChunMing):
> how to refresh LRU to keep the order align with bo list passed from 
> user space?
>
> you can verify it by some games, performance could be different much 
> between multiple runnings.
>
> -David
>
> -------- Original Message --------
> Subject: Re: [PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU 
> during CS
> From: Christian König
> To: "Zhou, David(ChunMing)" ,"Olsak, Marek" ,"Liang, Prike" 
> ,dri-devel@lists.freedesktop.org,amd-gfx@lists.freedesktop.org
> CC:
>
> [CAUTION: External Email]
> Hui? What do you mean with that?
>
> Christian.
>
> Am 14.05.19 um 15:12 schrieb Zhou, David(ChunMing):
>> my only concern is how to fresh LRU when bo is from bo list.
>>
>> -David
>>
>> -------- Original Message --------
>> Subject: [PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU 
>> during CS
>> From: Christian König
>> To: "Olsak, Marek" ,"Zhou, David(ChunMing)" ,"Liang, Prike" 
>> ,dri-devel@lists.freedesktop.org,amd-gfx@lists.freedesktop.org
>> CC:
>>
>> [CAUTION: External Email]
>>
>> This avoids OOM situations when we have lots of threads
>> submitting at the same time.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index fff558cf385b..f9240a94217b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -648,7 +648,7 @@ static int amdgpu_cs_parser_bos(struct 
>> amdgpu_cs_parser *p,
>>         }
>>
>>         r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
>> -                                  &duplicates, true);
>> +                                  &duplicates, false);
>>         if (unlikely(r != 0)) {
>>                 if (r != -ERESTARTSYS)
>> DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
>> --
>> 2.17.1
>>
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------561008C46C49D0E900F6669C
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">That is a good point, but actually not
      a problem in practice.<br>
      <br>
      See the change to ttm_eu_fence_buffer_objects:<br>
      <blockquote type="cite">-               ttm_bo_add_to_lru(bo);<br>
        +               if (list_empty(&amp;bo-&gt;lru))<br>
        +                       ttm_bo_add_to_lru(bo);<br>
        +               else<br>
        +                       ttm_bo_move_to_lru_tail(bo, NULL);<br>
      </blockquote>
      <br>
      We still move the BOs to the end of the LRU in the same order we
      have before, we just don't remove them when they are reserved.<br>
      <br>
      Regards,<br>
      Christian.<br>
      <br>
      Am 14.05.19 um 16:31 schrieb Zhou, David(ChunMing):<br>
    </div>
    <blockquote type="cite"
cite="mid:-wsx1tz-kxfbz1yns7x33sra134gl11xhlux4lx3izissqr2httt4mb1vleyxgj8i7k6-q6ze8ub3ff8c4o0fxmx7niu76yg4-ybakue-3v14jw-ed5ol8ybh6o9-1ze886-hbstfi448pvq3pwhkj.1557844282594@email.android.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta content="text/html; charset=Windows-1252">
      how to refresh LRU to keep the order align with bo list passed
      from user space?<br>
      <br>
      you can verify it by some games, performance could be different
      much between multiple runnings.<br>
      <br>
      -David<br>
      <br>
      -------- Original Message --------<br>
      Subject: Re: [PATCH 11/11] drm/amdgpu: stop removing BOs from the
      LRU during CS<br>
      From: Christian König <br>
      To: "Zhou, David(ChunMing)" ,"Olsak, Marek" ,"Liang, Prike"
      ,<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org,amd-gfx@lists.freedesktop.org">dri-devel@lists.freedesktop.org,amd-gfx@lists.freedesktop.org</a><br>
      CC: <br>
      <br>
      <div>[CAUTION: External Email]
        <div>
          <div class="moz-cite-prefix">Hui? What do you mean with that?<br>
            <br>
            Christian.<br>
            <br>
            Am 14.05.19 um 15:12 schrieb Zhou, David(ChunMing):<br>
          </div>
          <blockquote type="cite">
            <meta name="Generator" content="Microsoft Exchange Server">
            <style>
<!--
.EmailQuote
	{margin-left:1pt;
	padding-left:4pt;
	border-left:#800000 2px solid}
-->
</style>
            <div>my only concern is how to fresh LRU when bo is from bo
              list.<br>
              <br>
              -David<br>
              <br>
              -------- Original Message --------<br>
              Subject: [PATCH 11/11] drm/amdgpu: stop removing BOs from
              the LRU during CS<br>
              From: Christian König <br>
              To: "Olsak, Marek" ,"Zhou, David(ChunMing)" ,"Liang,
              Prike" ,<a class="moz-txt-link-abbreviated"
href="mailto:dri-devel@lists.freedesktop.org,amd-gfx@lists.freedesktop.org"
                moz-do-not-send="true">dri-devel@lists.freedesktop.org,amd-gfx@lists.freedesktop.org</a><br>
              CC: <br>
              <br>
            </div>
            <font size="2"><span style="font-size:11pt">
                <div class="PlainText">[CAUTION: External Email]<br>
                  <br>
                  This avoids OOM situations when we have lots of
                  threads<br>
                  submitting at the same time.<br>
                  <br>
                  Signed-off-by: Christian König <a
                    class="moz-txt-link-rfc2396E"
                    href="mailto:christian.koenig@amd.com"
                    moz-do-not-send="true">
                    &lt;christian.koenig@amd.com&gt;</a><br>
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
                  -                                  &amp;duplicates,
                  true);<br>
                  +                                  &amp;duplicates,
                  false);<br>
                          if (unlikely(r != 0)) {<br>
                                  if (r != -ERESTARTSYS)<br>
                                         
                  DRM_ERROR("ttm_eu_reserve_buffers failed.\n");<br>
                  --<br>
                  2.17.1<br>
                  <br>
                </div>
              </span></font></blockquote>
          <br>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------561008C46C49D0E900F6669C--

--===============1977393121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1977393121==--
