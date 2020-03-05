Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C890517A787
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 15:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BA96EBCC;
	Thu,  5 Mar 2020 14:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB756EBCC;
 Thu,  5 Mar 2020 14:35:01 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g134so6566852wme.3;
 Thu, 05 Mar 2020 06:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=CJzdaLtX70ZcRb8oSvOdT6vUfFvl00uS2aAvWa0YdOQ=;
 b=X+PZ+bjMZalPYP02Une7HKayrrGSg3i5QKee0VfZmeukf4KIfj0u6GsdHq6MVyn9C4
 oVvs/BtB1r5BRgx2krGXoembBYzCjpJG7TAaceaRdEVslLTgSD3sGnxmVmUlaaGCGfnP
 +0n8vLq8dbMwtXgym8pdA+7kKHIhDmiVkeMlMLeyeGsZim6Rji92qiXpJJHmo0svH4Sg
 /NIuFvWrFIOkRtV+ldQBofupJSVCLzpaE/5XziW5ESTte5bwLBEn5bGcIcJ78qRHfusC
 JFXSAskLMN6UPWooMdJm3GXDU3td6XEZYdkzXNf/5Z94atO8nKFvCHcugWVNknlEJIni
 edCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=CJzdaLtX70ZcRb8oSvOdT6vUfFvl00uS2aAvWa0YdOQ=;
 b=OGDc2jAyzFF55wMsJCPg7koA/sLbdJ7b2bzPs+yViwX1jmdhk2ZkSOXg+3N64SYqpf
 9V8S0lxCnhFqz8Oib9CPfYnTXht6GBFCDczaoKSKsPfsOaf6DQkSf3H0TUT8xrWfLhOL
 TU4mrMTfY1zfaDxzXJ62jKDlMyod3C7G5ldtAl7EaYqrsAWMDBHF2NsggnGPBjUDjVx3
 g/7Z+kLkGp8KZxiO24HFen7XptAO0W2heIz1zGdRQ0afUtRbhyoosZ5ehfXTj06lMnBj
 hBq3T3Hnmmxso+bkyIDWM5+jipb1HkPwlDtcdDDoIxTB6cFxY0ufuedZhWwZNp3hBoLi
 kC5w==
X-Gm-Message-State: ANhLgQ2wFb+dlKCMCmwb9B8vl4DTj7gsOLteNGAwLYO9KN3YUN9n0j9O
 /5aF7Uw+3eE9VuEfVUSxCUY=
X-Google-Smtp-Source: ADFU+vvYZil+NaGKcjKPA3gQZirIivsW+AmNYHuP5Ws9fBdPQ4/V6YRCWF3iN+0bnbQafvJnw2XAAQ==
X-Received: by 2002:a1c:a746:: with SMTP id q67mr9531712wme.1.1583418900157;
 Thu, 05 Mar 2020 06:35:00 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id t9sm8742418wmi.45.2020.03.05.06.34.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Mar 2020 06:34:59 -0800 (PST)
Subject: Re: [PATCH 6/8] drm/vram-helper: don't use ttm bo->offset v3
To: Nirmoy <nirmodas@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>
References: <20200305132910.17515-1-nirmoy.das@amd.com>
 <20200305132910.17515-7-nirmoy.das@amd.com>
 <20200305140749.5oggp4gh6hozsh7j@sirius.home.kraxel.org>
 <3f6148c1-8357-0f18-3bda-bd989ac26393@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <066b63e1-ffa2-8973-088c-3c88387a63cb@gmail.com>
Date: Thu, 5 Mar 2020 15:34:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3f6148c1-8357-0f18-3bda-bd989ac26393@amd.com>
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
Reply-To: christian.koenig@amd.com
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, alexander.deucher@amd.com,
 sean@poorly.run, christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============1644712473=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1644712473==
Content-Type: multipart/alternative;
 boundary="------------2E554187EEEFD3E7494B8AF6"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2E554187EEEFD3E7494B8AF6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 05.03.20 um 15:35 schrieb Nirmoy:
>
>
> On 3/5/20 3:07 PM, Gerd Hoffmann wrote:
>> On Thu, Mar 05, 2020 at 02:29:08PM +0100, Nirmoy Das wrote:
>>> Calculate GEM VRAM bo's offset within vram-helper without depending on
>>> bo->offset.
>>>
>>> Signed-off-by: Nirmoy Das<nirmoy.das@amd.com>
>>> Reviewed-by: Daniel Vetter<daniel.vetter@ffwll.ch>
>>> ---
>>>   drivers/gpu/drm/drm_gem_vram_helper.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
>>> index 92a11bb42365..2749c2d25ac4 100644
>>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>>> @@ -198,6 +198,13 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo)
>>>   }
>>>   EXPORT_SYMBOL(drm_gem_vram_mmap_offset);
>>>
>>> +static s64 drm_gem_vram_pg_offset(struct drm_gem_vram_object *gbo)
>>> +{
>>> +	if (WARN_ON_ONCE(!gbo->bo.mem.mm_node))
>>> +		return 0;
>> returns 0 on error.
>
> I am not sure if we should call this an error. This patch series 
> removes below offset calculation from ttm_bo.c.
>
> -	if (bo->mem.mm_node)
> -		bo->offset = (bo->mem.start << PAGE_SHIFT) +
> -		    bdev->man[bo->mem.mem_type].gpu_offset;
> -	else
> -		bo->offset = 0;
> -
>
> Most of the driver sets "bo->mem.mm_node". Thomas suggested to use 
> this "return 0" in case some driver depends on bo->offset = 0.
>

We should probably add a code comment here to explain why we do this.

Something like "Keep TTM behavior for now, remove when drivers are audited".

Regards,
Christian.

>>> +	return gbo->bo.mem.start;
>>> +}
>>> +
>>>   /**
>>>    * drm_gem_vram_offset() - \
>>>   	Returns a GEM VRAM object's offset in video memory
>>> @@ -214,7 +221,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
>>>   {
>>>   	if (WARN_ON_ONCE(!gbo->pin_count))
>>>   		return (s64)-ENODEV;
>> returns -errno on error.
>>
>>> -	return gbo->bo.offset;
>>> +	return drm_gem_vram_pg_offset(gbo) << PAGE_SHIFT;
>> And given that one calls the other behavior on error should better be
>> consistent ...
>>
>> cheers,
>>    Gerd
>>
>
> Regards,
>
> Nirmoy
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------2E554187EEEFD3E7494B8AF6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Am 05.03.20 um 15:35 schrieb Nirmoy:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3f6148c1-8357-0f18-3bda-bd989ac26393@amd.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 3/5/20 3:07 PM, Gerd Hoffmann
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20200305140749.5oggp4gh6hozsh7j@sirius.home.kraxel.org">
        <pre class="moz-quote-pre" wrap="">On Thu, Mar 05, 2020 at 02:29:08PM +0100, Nirmoy Das wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Calculate GEM VRAM bo's offset within vram-helper without depending on
bo-&gt;offset.

Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@amd.com" moz-do-not-send="true">&lt;nirmoy.das@amd.com&gt;</a>
Reviewed-by: Daniel Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel.vetter@ffwll.ch" moz-do-not-send="true">&lt;daniel.vetter@ffwll.ch&gt;</a>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 92a11bb42365..2749c2d25ac4 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -198,6 +198,13 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_mmap_offset);

+static s64 drm_gem_vram_pg_offset(struct drm_gem_vram_object *gbo)
+{
+	if (WARN_ON_ONCE(!gbo-&gt;bo.mem.mm_node))
+		return 0;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">returns 0 on error.</pre>
      </blockquote>
      <p>I am not sure if we should call this an error. This patch
        series removes below offset calculation from ttm_bo.c. <br>
      </p>
      <pre class="moz-quote-pre" wrap="">-	if (bo-&gt;mem.mm_node)
-		bo-&gt;offset = (bo-&gt;mem.start &lt;&lt; PAGE_SHIFT) +
-		    bdev-&gt;man[bo-&gt;mem.mem_type].gpu_offset;
-	else
-		bo-&gt;offset = 0;
-

</pre>
      <p><font size="+1">Most of the driver sets "bo-&gt;mem.mm_node".
          Thomas suggested to use this "return 0" in case some driver
          depends on bo-&gt;offset = 0.</font></p>
    </blockquote>
    <br>
    We should probably add a code comment here to explain why we do
    this.<br>
    <br>
    Something like "Keep TTM behavior for now, remove when drivers are
    audited".<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
      cite="mid:3f6148c1-8357-0f18-3bda-bd989ac26393@amd.com">
      <blockquote type="cite"
        cite="mid:20200305140749.5oggp4gh6hozsh7j@sirius.home.kraxel.org">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+	return gbo-&gt;bo.mem.start;
+}
+
 /**
  * drm_gem_vram_offset() - \
 	Returns a GEM VRAM object's offset in video memory
@@ -214,7 +221,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
 {
 	if (WARN_ON_ONCE(!gbo-&gt;pin_count))
 		return (s64)-ENODEV;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">returns -errno on error.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">-	return gbo-&gt;bo.offset;
+	return drm_gem_vram_pg_offset(gbo) &lt;&lt; PAGE_SHIFT;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">And given that one calls the other behavior on error should better be
consistent ...

cheers,
  Gerd

</pre>
      </blockquote>
      <p><br>
      </p>
      <p>Regards,</p>
      <p>Nirmoy<br>
      </p>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------2E554187EEEFD3E7494B8AF6--

--===============1644712473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1644712473==--
