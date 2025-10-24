Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7ABC064FD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 14:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9748610EA2C;
	Fri, 24 Oct 2025 12:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LdeW+ldM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2D610EA2B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 12:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761310100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+6TGhV5IlQELsTrMZxBTKRG5Lt7ZLw1MZtzj8DxcxOE=;
 b=LdeW+ldMyyg1BmeQ9mDqzWwUgKQ1LjmjHbEObJMYer1P0xwoGdhG8Utpcy2hOhSs1iSqqM
 XDNcR0kZ5ZoYuQHkf3f+ZVdz0D9HMA/+DFRKNyq1Rp/M30Fr2Fv56hdXpCLpu14J6QZSjM
 cDJZt2DrjU1uSPEmVMqEcqjL95EjztE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-SFm6QxiQOEmBpciyLi_m6w-1; Fri, 24 Oct 2025 08:48:18 -0400
X-MC-Unique: SFm6QxiQOEmBpciyLi_m6w-1
X-Mimecast-MFC-AGG-ID: SFm6QxiQOEmBpciyLi_m6w_1761310097
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47114d373d5so15737795e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 05:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761310097; x=1761914897;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+6TGhV5IlQELsTrMZxBTKRG5Lt7ZLw1MZtzj8DxcxOE=;
 b=pR7jYhAkViZv9FyKbEPY0TTm0/632r+0myeiAICFsVG6csSrvGBgwoZ28Rhpv2xLUN
 3dCWt7hFlP2zIIObaOvn+VpyTsZLeVJsHreBs4La3o0dW/MYlYtY3pC5mqASBsDdf8yH
 5xe4uzTu5BAPu/kd60vEmRJ7X3oJW1AG4ePhEaJMzYo0hApRgOJ1H7bWLPrLvduXLKRh
 WBDGoMrPArIboHP+EDriGT418UtKilgSYXHmhOIoy8vL6otGkippBgud4nQvXICWkyUs
 Vqk7SvkPfbE98W/77M36UNh89mRstF142BGMFlZhH4+dJwivvzU07B2mqWgn4wz3WeRs
 wdtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS0E0dOOQKWfm/ILiMjSXGb5UzKA+DNSM0P6/VMjkKYI//73D0LTnCh1qJwkE+BfQGad60jS1VM8g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4fzpispLcC8lprZBii+HwRvfvcWM/StaVefSAukkMMJjgwkdT
 LXiDGQE1IsrEylcQRLbFHwkQmsA2F/liNGy4yzwk+qGv0AhbnO99hB6tvSsfZLBA+KBXev4yBcA
 3nKH++YmByI+F/RDXhvyhF9NvfyTHsMuFgP0CHUT5IUsQF0qPVshQr8SlqpcxXXJ40yLRVQ==
X-Gm-Gg: ASbGncuzD7O5SzpmgodEGvDE/Vv/n353n13S1uG036ftrbeJvXD+Zyf3i4SsPSUGpKS
 NO+OwzolKBdiTqZMvPVig0gPRQTSMG8/jKY+M1HVedRMOO50nYxiPitAMwNcB41HZO0u2rwdo41
 vfOVD0p/oDGojxvkZb12a9Du7oRomTMakIqMTeBubI5j1ra99aQG8LKwTXgu6vXW9awo65pteiz
 lcu1Nim66HX+LABa7pf4KhFaRX9623rda6e6bH4GAdq+Vi/tncTSO2ScqpJDzDl9768MVDncMLN
 PiVurqtueBN410h3Cx8XqNRAyIqdn6U0j8zT8d8eyafSkdKkzMLDZUN53XHbse+pWl6+FV/V40D
 3ndJ4kR/WENeJYMZ4vxrY7W6TFZu/+cjw2NM9AKk=
X-Received: by 2002:a05:600c:3b83:b0:46e:3d41:6001 with SMTP id
 5b1f17b1804b1-47117925171mr291334695e9.34.1761310097404; 
 Fri, 24 Oct 2025 05:48:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHma4ENcfhapm3NQDHuWp3ZmLE6iI4yMNu0GFFugQD+CGMylq7yIfZkYdcdg4YK2lzMVKW0KQ==
X-Received: by 2002:a05:600c:3b83:b0:46e:3d41:6001 with SMTP id
 5b1f17b1804b1-47117925171mr291334335e9.34.1761310096957; 
 Fri, 24 Oct 2025 05:48:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf4642fsm86047815e9.17.2025.10.24.05.48.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 05:48:16 -0700 (PDT)
Message-ID: <6757f62e-0b10-4fc5-a9cb-16006c723459@redhat.com>
Date: Fri, 24 Oct 2025 14:48:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/dmabuf: Flush the cache in vmap
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Christian Brauner <brauner@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>
References: <20251024110432.1313391-1-jfalempe@redhat.com>
 <a1d6cf1f-02b6-4c89-84e2-4b2af39829ef@ursulin.net>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <a1d6cf1f-02b6-4c89-84e2-4b2af39829ef@ursulin.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 39UB44hjwaJRTAfi-EYGqZ-2uk3OvWnGjCGXT118RgA_1761310097
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/10/2025 13:53, Tvrtko Ursulin wrote:
> 
> On 24/10/2025 12:04, Jocelyn Falempe wrote:
>> On a lenovo se100 server, when using i915 GPU for rendering, and the
>> ast driver for display, the graphic output is corrupted, and almost
>> unusable.
>>
>> Adding a clflush call in the vmap function fixes this issue
>> completely.
> 
> AST is importing i915 allocated buffer in this use case, or how exactly 
> is the relationship?

I think it's mutter/gnome-shell who copy the buffer from i915 to ast, 
here is the logs:

gnome-shell[2079]: Failed to initialize accelerated iGPU/dGPU 
framebuffer sharing: Do not want to use software renderer (llvmpipe 
(LLVM 19.1.7, 256 bits)), falling back to CPU copy path
gnome-shell[1533]: Created gbm renderer for '/dev/dri/card0'
gnome-shell[1533]: GPU /dev/dri/card1 selected as primary

card0 is ast and card1 is i915

Do you think there is something missing in mutter?

(Added Michel Dänzer that may know more about mutter).

-- 

Jocelyn


> 
> Wondering if some path is not calling dma_buf_begin/end_cpu_access().
> 
> Regards,
> 
> Tvrtko
> 
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/ 
>> drm/i915/gem/i915_gem_dmabuf.c
>> index f4f1c979d1b9..f6a8c1cbe4d1 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> @@ -77,6 +77,7 @@ static int i915_gem_dmabuf_vmap(struct dma_buf 
>> *dma_buf,
>>           return PTR_ERR(vaddr);
>>       iosys_map_set_vaddr(map, vaddr);
>> +    drm_clflush_virt_range(vaddr, dma_buf->size);
>>       return 0;
>>   }
>>
>> base-commit: 0790925dadad0997580df6e32cdccd54316807f2
> 

