Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9E032B6B5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 11:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA4489B3C;
	Wed,  3 Mar 2021 10:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A735389B3C;
 Wed,  3 Mar 2021 10:37:26 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id mj10so21117581ejb.5;
 Wed, 03 Mar 2021 02:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=FBTX+XnqunpZRURaos2Wq+e0yOnSvyBwRWIyAu4wSdc=;
 b=PWnsSSQO0I+T0GEnwNT40y88GuZgNKSXM8v3TntHQO3awwVGV3ACtHRdsMJLSbL78G
 04lgzg8mi7Ug7wrBhftLZfJtukR/Rln4QB++EeNKS1anRzAQoydyKnW2mzeHxGL2yZyE
 jUcV+YmP5pmlIdqrElE18Hdt6FYw/m4GBXecdI2RXCQTs3RXaRyVlziBmHcWaakpOMvQ
 ZcrAYFpx3qsvfpbYzZ2PfO0jK7ummf0q0V8/u71LMzXbzo6eNd+wuxGFotK3qpGqC1ll
 IJCvWVyI+Ls0xc12wc0UFb/Ux5Hxz7CyurCESyACHHX+wDJCddud4hGdi88EtcgCG/Vz
 sZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=FBTX+XnqunpZRURaos2Wq+e0yOnSvyBwRWIyAu4wSdc=;
 b=pYTIOiQvcseLQ03bk0aSMvGj64CAu2Lv0sH7J9wneupqw4PCLSp2cCi25ERjAQ3pyX
 1JwCko/aVDjkdFfOC6iL9Qbio2EcEx1V1lzEih6pcQhERenlljLNWqz0eK6lzq1s3+Gs
 vWBNgQGUE74G8j9Oar4LbjW1e/G75KAUqSGTgKzJPYqq7AE5CyFasa3LzBsyqu2UTmbV
 mgZu6gQ1fa0VRziyv9qLdy6V1Ijvixx6Z1uQCTyJYkRHP2DujySwXylRISi8OdJxotyz
 EbjAa8ZvnNBRyJnAXmfwTlpkA+Png0Uz5J3ayyzuYwdGkutomIcxREIEzeNQuk/TWwwX
 bqOA==
X-Gm-Message-State: AOAM531hnZAD5PwleGM6hZ3q9u3TMx/LNRu0VHVlU1/BDw2Zn3B/jfcy
 eQDXt18kgi2JhHZARAO1Kiw=
X-Google-Smtp-Source: ABdhPJygHxPhY6fKGaxW7MhOy6oDLSgWU5ivsp7w4zuTTOxk5LgjZBZ1Lk6AfbzW8A05ekBjZGpvag==
X-Received: by 2002:a17:906:26c9:: with SMTP id
 u9mr26211212ejc.166.1614767845362; 
 Wed, 03 Mar 2021 02:37:25 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:c1c9:255f:21eb:6396?
 ([2a02:908:1252:fb60:c1c9:255f:21eb:6396])
 by smtp.gmail.com with ESMTPSA id t11sm21226275edd.1.2021.03.03.02.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 02:37:24 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching
 setting
To: Thomas Zimmermann <tzimmermann@suse.de>, Oak Zeng <Oak.Zeng@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1614638628-10508-1-git-send-email-Oak.Zeng@amd.com>
 <cff35ce0-3ad1-cc4a-f6ec-d423a913d0bc@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e5e46c63-7dcf-44b0-6df9-4c88b9904fa1@gmail.com>
Date: Wed, 3 Mar 2021 11:37:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cff35ce0-3ad1-cc4a-f6ec-d423a913d0bc@suse.de>
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
Cc: jinhuieric.huang@amd.com, Alexander.Deucher@amd.com, Felix.Kuehling@amd.com,
 harish.kasiviswanathan@amd.com, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============0597658075=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0597658075==
Content-Type: multipart/alternative;
 boundary="------------236F69DFE7C6FD9C41A5F923"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------236F69DFE7C6FD9C41A5F923
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

Am 03.03.21 um 09:49 schrieb Thomas Zimmermann:
> Hi
>
> Am 01.03.21 um 23:43 schrieb Oak Zeng:
>> If tbo.mem.bus.caching is cached, buffer is intended to be mapped
>> as cached from CPU. Map it with ioremap_cache.
>
> Just a question for my understanding: This is on-device memory? 
> Accessing device memory is usually slow. If that memory can be mapped 
> with CPU caching enabled, access will roughly be as fast as for system 
> memory?

There is still a penalty associated with accessing it from the CPU, but 
it is much faster (both lower latency as well as throughput) as 
traditional device memory accessed over PCIe.

Regards,
Christian.

>
> Best regards
> Thomas
>
>>
>> This wasn't necessary before as device memory was never mapped
>> as cached from CPU side. It becomes necessary for aldebaran as
>> device memory is mapped cached from CPU.
>>
>> Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
>> Reviewed-by: Christian Konig <Christian.Koenig@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index 031e581..8c65a13 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -91,6 +91,8 @@ static int ttm_resource_ioremap(struct ttm_device 
>> *bdev,
>>             if (mem->bus.caching == ttm_write_combined)
>>               addr = ioremap_wc(mem->bus.offset, bus_size);
>> +        else if (mem->bus.caching == ttm_cached)
>> +            addr = ioremap_cache(mem->bus.offset, bus_size);
>>           else
>>               addr = ioremap(mem->bus.offset, bus_size);
>>           if (!addr) {
>> @@ -372,6 +374,9 @@ static int ttm_bo_ioremap(struct 
>> ttm_buffer_object *bo,
>>           if (mem->bus.caching == ttm_write_combined)
>>               map->virtual = ioremap_wc(bo->mem.bus.offset + offset,
>>                             size);
>> +        else if (mem->bus.caching == ttm_cached)
>> +            map->virtual = ioremap_cache(bo->mem.bus.offset + offset,
>> +                          size);
>>           else
>>               map->virtual = ioremap(bo->mem.bus.offset + offset,
>>                              size);
>> @@ -490,6 +495,9 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, 
>> struct dma_buf_map *map)
>>           else if (mem->bus.caching == ttm_write_combined)
>>               vaddr_iomem = ioremap_wc(mem->bus.offset,
>>                            bo->base.size);
>> +        else if (mem->bus.caching == ttm_cached)
>> +            vaddr_iomem = ioremap_cache(mem->bus.offset,
>> +                          bo->base.size);
>>           else
>>               vaddr_iomem = ioremap(mem->bus.offset, bo->base.size);
>>
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------236F69DFE7C6FD9C41A5F923
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi Thomas,<br>
    <br>
    <div class="moz-cite-prefix">Am 03.03.21 um 09:49 schrieb Thomas
      Zimmermann:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cff35ce0-3ad1-cc4a-f6ec-d423a913d0bc@suse.de">Hi
      <br>
      <br>
      Am 01.03.21 um 23:43 schrieb Oak Zeng:
      <br>
      <blockquote type="cite">If tbo.mem.bus.caching is cached, buffer
        is intended to be mapped
        <br>
        as cached from CPU. Map it with ioremap_cache.
        <br>
      </blockquote>
      <br>
      Just a question for my understanding: This is on-device memory?
      Accessing device memory is usually slow. If that memory can be
      mapped with CPU caching enabled, access will roughly be as fast as
      for system memory?
      <br>
    </blockquote>
    <br>
    There is still a penalty associated with accessing it from the CPU,
    but it is much faster (both lower latency as well as throughput) as
    traditional device memory accessed over PCIe.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
      cite="mid:cff35ce0-3ad1-cc4a-f6ec-d423a913d0bc@suse.de">
      <br>
      Best regards
      <br>
      Thomas
      <br>
      <br>
      <blockquote type="cite">
        <br>
        This wasn't necessary before as device memory was never mapped
        <br>
        as cached from CPU side. It becomes necessary for aldebaran as
        <br>
        device memory is mapped cached from CPU.
        <br>
        <br>
        Signed-off-by: Oak Zeng <a class="moz-txt-link-rfc2396E" href="mailto:Oak.Zeng@amd.com">&lt;Oak.Zeng@amd.com&gt;</a>
        <br>
        Reviewed-by: Christian Konig <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>
        <br>
        ---
        <br>
          drivers/gpu/drm/ttm/ttm_bo_util.c | 8 ++++++++
        <br>
          1 file changed, 8 insertions(+)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
        b/drivers/gpu/drm/ttm/ttm_bo_util.c
        <br>
        index 031e581..8c65a13 100644
        <br>
        --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
        <br>
        +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
        <br>
        @@ -91,6 +91,8 @@ static int ttm_resource_ioremap(struct
        ttm_device *bdev,
        <br>
                    if (mem-&gt;bus.caching == ttm_write_combined)
        <br>
                      addr = ioremap_wc(mem-&gt;bus.offset, bus_size);
        <br>
        +        else if (mem-&gt;bus.caching == ttm_cached)
        <br>
        +            addr = ioremap_cache(mem-&gt;bus.offset, bus_size);
        <br>
                  else
        <br>
                      addr = ioremap(mem-&gt;bus.offset, bus_size);
        <br>
                  if (!addr) {
        <br>
        @@ -372,6 +374,9 @@ static int ttm_bo_ioremap(struct
        ttm_buffer_object *bo,
        <br>
                  if (mem-&gt;bus.caching == ttm_write_combined)
        <br>
                      map-&gt;virtual = ioremap_wc(bo-&gt;mem.bus.offset
        + offset,
        <br>
                                    size);
        <br>
        +        else if (mem-&gt;bus.caching == ttm_cached)
        <br>
        +            map-&gt;virtual =
        ioremap_cache(bo-&gt;mem.bus.offset + offset,
        <br>
        +                          size);
        <br>
                  else
        <br>
                      map-&gt;virtual = ioremap(bo-&gt;mem.bus.offset +
        offset,
        <br>
                                     size);
        <br>
        @@ -490,6 +495,9 @@ int ttm_bo_vmap(struct ttm_buffer_object
        *bo, struct dma_buf_map *map)
        <br>
                  else if (mem-&gt;bus.caching == ttm_write_combined)
        <br>
                      vaddr_iomem = ioremap_wc(mem-&gt;bus.offset,
        <br>
                                   bo-&gt;base.size);
        <br>
        +        else if (mem-&gt;bus.caching == ttm_cached)
        <br>
        +            vaddr_iomem = ioremap_cache(mem-&gt;bus.offset,
        <br>
        +                          bo-&gt;base.size);
        <br>
                  else
        <br>
                      vaddr_iomem = ioremap(mem-&gt;bus.offset,
        bo-&gt;base.size);
        <br>
          <br>
      </blockquote>
      <br>
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

--------------236F69DFE7C6FD9C41A5F923--

--===============0597658075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0597658075==--
