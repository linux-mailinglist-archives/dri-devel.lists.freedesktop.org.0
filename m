Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A4327E3D6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 10:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04606E584;
	Wed, 30 Sep 2020 08:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB5889D2F;
 Wed, 30 Sep 2020 08:34:36 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id n22so914143edt.4;
 Wed, 30 Sep 2020 01:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=rgypQCBAn3525K/jRf7mmZO03N9aDdSSsvBnGQOGVOI=;
 b=lpWaFdgkKz+fh3Dgq+GNwma+2it6eVU36SikbzRUlvkV4gBAt3uQXHIC5eq3m1haRs
 iyEm4qd37aIZIDxhE2o1q6XHca+Wf0Pxm5mQU3j9n+9ubW0/wx3MXzBPJNwlRSlz8K+p
 umPmWebjV7RXeeEx51vJNn8VLKkXRIMGTtm/hIC1tHe9br280c7VBCSJ4hJNSCUliRuR
 wOt7BwjFR/50MPzFqF7KEkdE8kca9OEo+C7+7+XRZ8hnKAYaN+HUiHVWIwHY8UCc0l7f
 Kj78dtYjGAtqvNL5kgB4/LA0y2Uv5SAuQwrOH2VJfshWsrodGEHf3uM2OlLzog/W6CCG
 XoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=rgypQCBAn3525K/jRf7mmZO03N9aDdSSsvBnGQOGVOI=;
 b=dMHVhSDnXyvfE+X1tjqQQFvX+IR3GD57pjl27tTQctEAW2VHxG9QwmzAR6KNnz24c9
 Mmn4pAbSw523lM3YyfUtql3XpU6VSKpkbZMLaKigT55cbreBdBHdBgGFtzM3T8j1V+MC
 Z8HBpuqiQdSPPMKl3EaTMlJsn+Y1CELquEc+eFrhWyQdLpw3c9XThlniIabARzTboPtx
 cs3hmUTAdogS8l+md29bF6EsbeNjcls/RkuaZ6ekBUez7d9Jxd7FPuWd+ySaLOpjmJIV
 ngF++n6TDeHF1NMjJpXGF9T0iY71igzMlPe+qFias2zZoc7ZfRPwV6vi3XuCa1+gikDq
 8DnQ==
X-Gm-Message-State: AOAM530PyU0DaYQEfto1IGsTKq3TZO7ByvRWJNWJ6UJn+RfOOnON+luu
 KYE7RHwCfwrBdLVyQfc0Mkw=
X-Google-Smtp-Source: ABdhPJySaCfmYkOwVbNAYa7cyeCPW2Ej0t4BX4rQi6V5ma2yHbunkygg2s8RL0vEz5qWhUxcrQTg5A==
X-Received: by 2002:aa7:d501:: with SMTP id y1mr1500965edq.29.1601454875615;
 Wed, 30 Sep 2020 01:34:35 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w19sm770728edt.22.2020.09.30.01.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 01:34:34 -0700 (PDT)
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To: Thomas Zimmermann <tzimmermann@suse.de>, christian.koenig@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 kraxel@redhat.com, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
 <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>
 <07972ada-9135-3743-a86b-487f610c509f@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com>
Date: Wed, 30 Sep 2020 10:34:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <07972ada-9135-3743-a86b-487f610c509f@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 spice-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0964754102=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0964754102==
Content-Type: multipart/alternative;
 boundary="------------8EC82C26098A028632FEB80B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8EC82C26098A028632FEB80B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 30.09.20 um 10:19 schrieb Thomas Zimmermann:
> Hi
>
> Am 30.09.20 um 10:05 schrieb Christian König:
>> Am 29.09.20 um 19:49 schrieb Thomas Zimmermann:
>>> Hi Christian
>>>
>>> Am 29.09.20 um 17:35 schrieb Christian König:
>>>> Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
>>>>> The new helper ttm_kmap_obj_to_dma_buf() extracts address and location
>>>>> from and instance of TTM's kmap_obj and initializes struct dma_buf_map
>>>>> with these values. Helpful for TTM-based drivers.
>>>> We could completely drop that if we use the same structure inside TTM as
>>>> well.
>>>>
>>>> Additional to that which driver is going to use this?
>>> As Daniel mentioned, it's in patch 3. The TTM-based drivers will
>>> retrieve the pointer via this function.
>>>
>>> I do want to see all that being more tightly integrated into TTM, but
>>> not in this series. This one is about fixing the bochs-on-sparc64
>>> problem for good. Patch 7 adds an update to TTM to the DRM TODO list.
>> I should have asked which driver you try to fix here :)
>>
>> In this case just keep the function inside bochs and only fix it there.
>>
>> All other drivers can be fixed when we generally pump this through TTM.
> Did you take a look at patch 3? This function will be used by VRAM
> helpers, nouveau, radeon, amdgpu and qxl. If we don't put it here, we
> have to duplicate the functionality in each if these drivers. Bochs
> itself uses VRAM helpers and doesn't touch the function directly.

Ah, ok can we have that then only in the VRAM helpers?

Alternative you could go ahead and use dma_buf_map in ttm_bo_kmap_obj 
directly and drop the hack with the TTM_BO_MAP_IOMEM_MASK.

What I want to avoid is to have another conversion function in TTM 
because what happens here is that we already convert from 
ttm_bus_placement to ttm_bo_kmap_obj and then to dma_buf_map.

Thanks,
Christian.

>
> Best regards
> Thomas
>
>> Regards,
>> Christian.
>>
>>> Best regards
>>> Thomas
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> ---
>>>>>    include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
>>>>>    include/linux/dma-buf-map.h  | 20 ++++++++++++++++++++
>>>>>    2 files changed, 44 insertions(+)
>>>>>
>>>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>>>>> index c96a25d571c8..62d89f05a801 100644
>>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>>> @@ -34,6 +34,7 @@
>>>>>    #include <drm/drm_gem.h>
>>>>>    #include <drm/drm_hashtab.h>
>>>>>    #include <drm/drm_vma_manager.h>
>>>>> +#include <linux/dma-buf-map.h>
>>>>>    #include <linux/kref.h>
>>>>>    #include <linux/list.h>
>>>>>    #include <linux/wait.h>
>>>>> @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(struct
>>>>> ttm_bo_kmap_obj *map,
>>>>>        return map->virtual;
>>>>>    }
>>>>>    +/**
>>>>> + * ttm_kmap_obj_to_dma_buf_map
>>>>> + *
>>>>> + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
>>>>> + * @map: Returns the mapping as struct dma_buf_map
>>>>> + *
>>>>> + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If the memory
>>>>> + * is not mapped, the returned mapping is initialized to NULL.
>>>>> + */
>>>>> +static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_kmap_obj
>>>>> *kmap,
>>>>> +                           struct dma_buf_map *map)
>>>>> +{
>>>>> +    bool is_iomem;
>>>>> +    void *vaddr = ttm_kmap_obj_virtual(kmap, &is_iomem);
>>>>> +
>>>>> +    if (!vaddr)
>>>>> +        dma_buf_map_clear(map);
>>>>> +    else if (is_iomem)
>>>>> +        dma_buf_map_set_vaddr_iomem(map, (void __force __iomem *)vaddr);
>>>>> +    else
>>>>> +        dma_buf_map_set_vaddr(map, vaddr);
>>>>> +}
>>>>> +
>>>>>    /**
>>>>>     * ttm_bo_kmap
>>>>>     *
>>>>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
>>>>> index fd1aba545fdf..2e8bbecb5091 100644
>>>>> --- a/include/linux/dma-buf-map.h
>>>>> +++ b/include/linux/dma-buf-map.h
>>>>> @@ -45,6 +45,12 @@
>>>>>     *
>>>>>     *    dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
>>>>>     *
>>>>> + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
>>>>> + *
>>>>> + * .. code-block:: c
>>>>> + *
>>>>> + *    dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
>>>>> + *
>>>>>     * Test if a mapping is valid with either dma_buf_map_is_set() or
>>>>>     * dma_buf_map_is_null().
>>>>>     *
>>>>> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct
>>>>> dma_buf_map *map, void *vaddr)
>>>>>        map->is_iomem = false;
>>>>>    }
>>>>>    +/**
>>>>> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to
>>>>> an address in I/O memory
>>>>> + * @map:        The dma-buf mapping structure
>>>>> + * @vaddr_iomem:    An I/O-memory address
>>>>> + *
>>>>> + * Sets the address and the I/O-memory flag.
>>>>> + */
>>>>> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
>>>>> +                           void __iomem *vaddr_iomem)
>>>>> +{
>>>>> +    map->vaddr_iomem = vaddr_iomem;
>>>>> +    map->is_iomem = true;
>>>>> +}
>>>>> +
>>>>>    /**
>>>>>     * dma_buf_map_is_equal - Compares two dma-buf mapping structures
>>>>> for equality
>>>>>     * @lhs:    The dma-buf mapping structure
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>> _______________________________________________
>>> amd-gfx mailing list
>>> amd-gfx@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------8EC82C26098A028632FEB80B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 30.09.20 um 10:19 schrieb Thomas
      Zimmermann:<br>
    </div>
    <blockquote type="cite"
      cite="mid:07972ada-9135-3743-a86b-487f610c509f@suse.de">
      <pre class="moz-quote-pre" wrap="">Hi

Am 30.09.20 um 10:05 schrieb Christian König:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 29.09.20 um 19:49 schrieb Thomas Zimmermann:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi Christian

Am 29.09.20 um 17:35 schrieb Christian König:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">The new helper ttm_kmap_obj_to_dma_buf() extracts address and location
from and instance of TTM's kmap_obj and initializes struct dma_buf_map
with these values. Helpful for TTM-based drivers.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">We could completely drop that if we use the same structure inside TTM as
well.

Additional to that which driver is going to use this?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">As Daniel mentioned, it's in patch 3. The TTM-based drivers will
retrieve the pointer via this function.

I do want to see all that being more tightly integrated into TTM, but
not in this series. This one is about fixing the bochs-on-sparc64
problem for good. Patch 7 adds an update to TTM to the DRM TODO list.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I should have asked which driver you try to fix here :)

In this case just keep the function inside bochs and only fix it there.

All other drivers can be fixed when we generally pump this through TTM.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Did you take a look at patch 3? This function will be used by VRAM
helpers, nouveau, radeon, amdgpu and qxl. If we don't put it here, we
have to duplicate the functionality in each if these drivers. Bochs
itself uses VRAM helpers and doesn't touch the function directly.</pre>
    </blockquote>
    <br>
    Ah, ok can we have that then only in the VRAM helpers?<br>
    <br>
    Alternative you could go ahead and use dma_buf_map in
    ttm_bo_kmap_obj directly and drop the hack with the
    TTM_BO_MAP_IOMEM_MASK.<br>
    <br>
    What I want to avoid is to have another conversion function in TTM
    because what happens here is that we already convert from
    ttm_bus_placement to ttm_bo_kmap_obj and then to dma_buf_map.<br>
    <br>
    Thanks,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
      cite="mid:07972ada-9135-3743-a86b-487f610c509f@suse.de">
      <pre class="moz-quote-pre" wrap="">

Best regards
Thomas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Best regards
Thomas

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Signed-off-by: Thomas Zimmermann <a class="moz-txt-link-rfc2396E" href="mailto:tzimmermann@suse.de">&lt;tzimmermann@suse.de&gt;</a>
---
  include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
  include/linux/dma-buf-map.h  | 20 ++++++++++++++++++++
  2 files changed, 44 insertions(+)

diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index c96a25d571c8..62d89f05a801 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -34,6 +34,7 @@
  #include &lt;drm/drm_gem.h&gt;
  #include &lt;drm/drm_hashtab.h&gt;
  #include &lt;drm/drm_vma_manager.h&gt;
+#include &lt;linux/dma-buf-map.h&gt;
  #include &lt;linux/kref.h&gt;
  #include &lt;linux/list.h&gt;
  #include &lt;linux/wait.h&gt;
@@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(struct
ttm_bo_kmap_obj *map,
      return map-&gt;virtual;
  }
  +/**
+ * ttm_kmap_obj_to_dma_buf_map
+ *
+ * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
+ * @map: Returns the mapping as struct dma_buf_map
+ *
+ * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If the memory
+ * is not mapped, the returned mapping is initialized to NULL.
+ */
+static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_kmap_obj
*kmap,
+                           struct dma_buf_map *map)
+{
+    bool is_iomem;
+    void *vaddr = ttm_kmap_obj_virtual(kmap, &amp;is_iomem);
+
+    if (!vaddr)
+        dma_buf_map_clear(map);
+    else if (is_iomem)
+        dma_buf_map_set_vaddr_iomem(map, (void __force __iomem *)vaddr);
+    else
+        dma_buf_map_set_vaddr(map, vaddr);
+}
+
  /**
   * ttm_bo_kmap
   *
diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
index fd1aba545fdf..2e8bbecb5091 100644
--- a/include/linux/dma-buf-map.h
+++ b/include/linux/dma-buf-map.h
@@ -45,6 +45,12 @@
   *
   *    dma_buf_map_set_vaddr(&amp;map. 0xdeadbeaf);
   *
+ * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
+ *
+ * .. code-block:: c
+ *
+ *    dma_buf_map_set_vaddr_iomem(&amp;map. 0xdeadbeaf);
+ *
   * Test if a mapping is valid with either dma_buf_map_is_set() or
   * dma_buf_map_is_null().
   *
@@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct
dma_buf_map *map, void *vaddr)
      map-&gt;is_iomem = false;
  }
  +/**
+ * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to
an address in I/O memory
+ * @map:        The dma-buf mapping structure
+ * @vaddr_iomem:    An I/O-memory address
+ *
+ * Sets the address and the I/O-memory flag.
+ */
+static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
+                           void __iomem *vaddr_iomem)
+{
+    map-&gt;vaddr_iomem = vaddr_iomem;
+    map-&gt;is_iomem = true;
+}
+
  /**
   * dma_buf_map_is_equal - Compares two dma-buf mapping structures
for equality
   * @lhs:    The dma-buf mapping structure
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a>
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a>

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

--------------8EC82C26098A028632FEB80B--

--===============0964754102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0964754102==--
