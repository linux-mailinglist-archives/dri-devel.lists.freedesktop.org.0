Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41A3269419
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 19:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8185D6E52C;
	Mon, 14 Sep 2020 17:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B488F6E4E8;
 Mon, 14 Sep 2020 17:51:12 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id l17so399655edq.12;
 Mon, 14 Sep 2020 10:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=cinD4tchkxocHKviw5M6liz7E8UU7FD4XovFhsNsjyI=;
 b=tqZKHKN1V6C6oQElOwFS4+jyvbLS9BzylBSbwUbd02rQ76/lT49lrc+1lA+C8DN8Dd
 Nc0GbsJCPaCOHclSGk4/rG8fGqamsaUD5D+cmba9mrjnCmyMQa6mZgYbC5c/w9kZwhfb
 aJRkSAXMinRH/3gtwBaIiUmXBpTvWVTG5r/fSBBRDxoLah5xFDDjscX2kvgZr8AfeAC0
 gMFA6X+UeLkG9NLYtld2tfKKPMYvQC8wFwsgo6QeCj/1SP2gpRaBO+qK+7RqV2MPi/tn
 AYDtIiDOG7XJrasBS+cYJnkZhddVCOd5+jF87VvJuyV9OeppL+UABQ8WQSDYD79g3mPs
 ytfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=cinD4tchkxocHKviw5M6liz7E8UU7FD4XovFhsNsjyI=;
 b=XzUNwjExRpWcHkXwHWNfAsvRcXiuP4E7y4VV9owD+CyqdYI+pUkjNfgjiGv8u62Her
 HHXS8d4H8wB8rWXrApK8xB3yS2gw5f0dlU87YtCDK4Co5vevxYGPVOePdDuXwX/PDPd4
 gfYsGRcwBWDJS28ezMn4okCp3LEIb912iibK68v2Cmtz3JsbLAyMUcGZDNsMFqi7zjtw
 +UfZtIf3O5AdjnTftTCan4wn+1mgWjoV4wkZuej7KOxlt6HVgfFRZrw2v1nwO3O5K/YG
 B1NQT2Uj2T8Y/TRcSzOZidMNHboGfghlInya6/+RNmal7BRep2UVtidq95VVwIVf7Nio
 RG5Q==
X-Gm-Message-State: AOAM530GN4ze5YiijLF6SwdudN+PT6Iz+0syxbB0ys7l7qhOGW5nCTHp
 KcALNXAVnIXXZG5Zrb1cE4M=
X-Google-Smtp-Source: ABdhPJyHIadEQ0w95cMm+XKXdD2wy6DDt/xaqpuYqbeZucK6WVOqY6RobxWEhAYoVlCs20sURxiHJg==
X-Received: by 2002:a50:b046:: with SMTP id i64mr19248036edd.9.1600105871323; 
 Mon, 14 Sep 2020 10:51:11 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c22sm9791887edr.70.2020.09.14.10.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 10:51:10 -0700 (PDT)
Subject: Re: [PATCH 01/20] drm/amdgpu: Introduce GEM object functions
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
 tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com, heiko@sntech.de,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
 sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
 tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
 andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 aaron.liu@amd.com, nirmoy.das@amd.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, abdiel.janulgue@linux.intel.com,
 tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com, sam@ravnborg.org,
 miaoqinglang@huawei.com, emil.velikov@collabora.com
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-2-tzimmermann@suse.de>
 <5c1b3cab-1898-46df-2c5c-23ab6cbfbb7a@amd.com>
 <c445493b-9914-63f2-1cf2-c3c1de14e3e5@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ee7528ba-6775-53be-97fe-c8425178b491@gmail.com>
Date: Mon, 14 Sep 2020 19:51:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c445493b-9914-63f2-1cf2-c3c1de14e3e5@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1257912369=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1257912369==
Content-Type: multipart/alternative;
 boundary="------------29780EC5D45E17F55361B946"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------29780EC5D45E17F55361B946
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 14.09.20 um 17:05 schrieb Thomas Zimmermann:
> Hi
>
> Am 13.08.20 um 12:22 schrieb Christian König:
>> Am 13.08.20 um 10:36 schrieb Thomas Zimmermann:
>>> GEM object functions deprecate several similar callback interfaces in
>>> struct drm_driver. This patch replaces the per-driver callbacks with
>>> per-instance callbacks in amdgpu. The only exception is gem_prime_mmap,
>>> which is non-trivial to convert.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  6 ------
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 12 ++++++++++++
>>>    2 files changed, 12 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> index 81a79760ca61..51525b8774c9 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -1468,19 +1468,13 @@ static struct drm_driver kms_driver = {
>>>        .lastclose = amdgpu_driver_lastclose_kms,
>>>        .irq_handler = amdgpu_irq_handler,
>>>        .ioctls = amdgpu_ioctls_kms,
>>> -    .gem_free_object_unlocked = amdgpu_gem_object_free,
>>> -    .gem_open_object = amdgpu_gem_object_open,
>>> -    .gem_close_object = amdgpu_gem_object_close,
>>>        .dumb_create = amdgpu_mode_dumb_create,
>>>        .dumb_map_offset = amdgpu_mode_dumb_mmap,
>>>        .fops = &amdgpu_driver_kms_fops,
>>>          .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>>>        .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>>> -    .gem_prime_export = amdgpu_gem_prime_export,
>>>        .gem_prime_import = amdgpu_gem_prime_import,
>>> -    .gem_prime_vmap = amdgpu_gem_prime_vmap,
>>> -    .gem_prime_vunmap = amdgpu_gem_prime_vunmap,
>>>        .gem_prime_mmap = amdgpu_gem_prime_mmap,
>>>          .name = DRIVER_NAME,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> index 43f4966331dd..ca2b79f94e99 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> @@ -36,6 +36,7 @@
>>>    #include <drm/amdgpu_drm.h>
>>>    #include <drm/drm_cache.h>
>>>    #include "amdgpu.h"
>>> +#include "amdgpu_dma_buf.h"
>>>    #include "amdgpu_trace.h"
>>>    #include "amdgpu_amdkfd.h"
>>>    @@ -510,6 +511,15 @@ bool amdgpu_bo_support_uswc(u64 bo_flags)
>>>    #endif
>>>    }
>>>    +static const struct drm_gem_object_funcs amdgpu_gem_object_funcs = {
>>> +    .free = amdgpu_gem_object_free,
>>> +    .open = amdgpu_gem_object_open,
>>> +    .close = amdgpu_gem_object_close,
>>> +    .export = amdgpu_gem_prime_export,
>>> +    .vmap = amdgpu_gem_prime_vmap,
>>> +    .vunmap = amdgpu_gem_prime_vunmap,
>>> +};
>>> +
>> Wrong file, this belongs into amdgpu_gem.c
>>
>>>    static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>>>                       struct amdgpu_bo_param *bp,
>>>                       struct amdgpu_bo **bo_ptr)
>>> @@ -552,6 +562,8 @@ static int amdgpu_bo_do_create(struct
>>> amdgpu_device *adev,
>>>        bo = kzalloc(sizeof(struct amdgpu_bo), GFP_KERNEL);
>>>        if (bo == NULL)
>>>            return -ENOMEM;
>>> +
>>> +    bo->tbo.base.funcs = &amdgpu_gem_object_funcs;
>> And this should probably go into amdgpu_gem_object_create().
> I'm trying to understand what amdgpu does.  What about all the places
> where amdgpu calls amdgpu_bo_create() internally? Wouldn't these miss
> the free callback for the GEM object?

Those shouldn't have a GEM object in the first place.

Or otherwise we would have a reference counting issue.

Regards,
Christian.

>
> Best regards
> Thomas
>
>> Apart from that looks like a good idea to me.
>>
>> Christian.
>>
>>>        drm_gem_private_object_init(adev->ddev, &bo->tbo.base, size);
>>>        INIT_LIST_HEAD(&bo->shadow_list);
>>>        bo->vm_bo = NULL;
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------29780EC5D45E17F55361B946
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 14.09.20 um 17:05 schrieb Thomas
      Zimmermann:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c445493b-9914-63f2-1cf2-c3c1de14e3e5@suse.de">
      <pre class="moz-quote-pre" wrap="">Hi

Am 13.08.20 um 12:22 schrieb Christian König:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 13.08.20 um 10:36 schrieb Thomas Zimmermann:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces the per-driver callbacks with
per-instance callbacks in amdgpu. The only exception is gem_prime_mmap,
which is non-trivial to convert.

Signed-off-by: Thomas Zimmermann <a class="moz-txt-link-rfc2396E" href="mailto:tzimmermann@suse.de">&lt;tzimmermann@suse.de&gt;</a>
---
  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  6 ------
  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 12 ++++++++++++
  2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 81a79760ca61..51525b8774c9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1468,19 +1468,13 @@ static struct drm_driver kms_driver = {
      .lastclose = amdgpu_driver_lastclose_kms,
      .irq_handler = amdgpu_irq_handler,
      .ioctls = amdgpu_ioctls_kms,
-    .gem_free_object_unlocked = amdgpu_gem_object_free,
-    .gem_open_object = amdgpu_gem_object_open,
-    .gem_close_object = amdgpu_gem_object_close,
      .dumb_create = amdgpu_mode_dumb_create,
      .dumb_map_offset = amdgpu_mode_dumb_mmap,
      .fops = &amp;amdgpu_driver_kms_fops,
        .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
      .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-    .gem_prime_export = amdgpu_gem_prime_export,
      .gem_prime_import = amdgpu_gem_prime_import,
-    .gem_prime_vmap = amdgpu_gem_prime_vmap,
-    .gem_prime_vunmap = amdgpu_gem_prime_vunmap,
      .gem_prime_mmap = amdgpu_gem_prime_mmap,
        .name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 43f4966331dd..ca2b79f94e99 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -36,6 +36,7 @@
  #include &lt;drm/amdgpu_drm.h&gt;
  #include &lt;drm/drm_cache.h&gt;
  #include "amdgpu.h"
+#include "amdgpu_dma_buf.h"
  #include "amdgpu_trace.h"
  #include "amdgpu_amdkfd.h"
  @@ -510,6 +511,15 @@ bool amdgpu_bo_support_uswc(u64 bo_flags)
  #endif
  }
  +static const struct drm_gem_object_funcs amdgpu_gem_object_funcs = {
+    .free = amdgpu_gem_object_free,
+    .open = amdgpu_gem_object_open,
+    .close = amdgpu_gem_object_close,
+    .export = amdgpu_gem_prime_export,
+    .vmap = amdgpu_gem_prime_vmap,
+    .vunmap = amdgpu_gem_prime_vunmap,
+};
+
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Wrong file, this belongs into amdgpu_gem.c

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">  static int amdgpu_bo_do_create(struct amdgpu_device *adev,
                     struct amdgpu_bo_param *bp,
                     struct amdgpu_bo **bo_ptr)
@@ -552,6 +562,8 @@ static int amdgpu_bo_do_create(struct
amdgpu_device *adev,
      bo = kzalloc(sizeof(struct amdgpu_bo), GFP_KERNEL);
      if (bo == NULL)
          return -ENOMEM;
+
+    bo-&gt;tbo.base.funcs = &amp;amdgpu_gem_object_funcs;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
And this should probably go into amdgpu_gem_object_create().
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm trying to understand what amdgpu does.  What about all the places
where amdgpu calls amdgpu_bo_create() internally? Wouldn't these miss
the free callback for the GEM object?</pre>
    </blockquote>
    <br>
    Those shouldn't have a GEM object in the first place.<br>
    <br>
    Or otherwise we would have a reference counting issue.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
      cite="mid:c445493b-9914-63f2-1cf2-c3c1de14e3e5@suse.de">
      <pre class="moz-quote-pre" wrap="">

Best regards
Thomas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Apart from that looks like a good idea to me.

Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">      drm_gem_private_object_init(adev-&gt;ddev, &amp;bo-&gt;tbo.base, size);
      INIT_LIST_HEAD(&amp;bo-&gt;shadow_list);
      bo-&gt;vm_bo = NULL;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
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

--------------29780EC5D45E17F55361B946--

--===============1257912369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1257912369==--
