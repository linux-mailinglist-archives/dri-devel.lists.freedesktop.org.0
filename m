Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87950C07544
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAAEB10EB12;
	Fri, 24 Oct 2025 16:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Mk6cyCag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DEB10EB12
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761323571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S5aWl/MBLylEhXBUZhgkZQKP5sJl+kq7ClFgBJOZJFc=;
 b=Mk6cyCagabDkH/YFQxSIEMQk3o+2Ht78UInhZJoHjUhAOry8GxgNHne76VyV4AklQM81mk
 oyUB1HSkU74/jR/P8+9/T0m1zKVIxguuFj7v2PkopjzANkfsR1sFS6eMpVNUSKlFYJheL6
 91uB5K/GgDnRWaZytpuJBF4N63yaqug=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-m6W-U5F4PIKUS-QTnkMoBA-1; Fri, 24 Oct 2025 12:32:47 -0400
X-MC-Unique: m6W-U5F4PIKUS-QTnkMoBA-1
X-Mimecast-MFC-AGG-ID: m6W-U5F4PIKUS-QTnkMoBA_1761323566
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-426d4f59cbcso2297149f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761323566; x=1761928366;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S5aWl/MBLylEhXBUZhgkZQKP5sJl+kq7ClFgBJOZJFc=;
 b=gXG/Pp+n6DLUhU1O57a4ssxrdseBiRCUpNfgk05BNdFkfzDrm5qL4RcC8ODXLZfiHN
 zfRGf7Ozoe7nCc3P/winBuhUaCJyNCdsC+4mBAi5YSi33KUeWGLjzP+ZMu08iAK1egCe
 v/z6xVN7Yn/mR+jqmD3E3idhs2f6OYST1uiytsCK9detSFW+tYec7MvO+an47zXkUFcY
 DTqlUaOmTmyqdCA1qym0TT9ToKfddqyNsvgCAMUi272BRBYlb4zHhaM16T0b3LM8o2vp
 kaCVyk4bSxYb6gQJn6wd4xCeP7mbpTj9mVjz/+cPyAY1MjiTJhMw95jMYkoaYUql6Y3c
 zPww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmGSrDhXn1TpAgTeOrCkfUVAoIyyWCxEch0Gkf2esPoqZnsSr8q+sKLBpRdX0Jog5PySvAq+JcoFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7uGCO9ExAFqTVug6G/+1hKy1Yd69OURYPruEpDDnJZ/rFuzko
 /mVNS7HdpAcycFe9ESo6Ua+DaPWS7RgmU0nAHmF8nAr9rKFrRmJ1qJcZTMo2ZQ54EmZ2uNbyqql
 zeQxZrvHyHaBImeNULxOqXq421DY0F24uO/EA+q2MKfLmpVzfNugXu+EFI/D2Bb9sg/K1IQ==
X-Gm-Gg: ASbGncsR+G5hcE66F+fi2qcwQomxlEtACze3gerXVhBM/rVFhskI38gIW0/bNcvuhn8
 Qnj/x1EBoPJPgHb1ahEHxAV+6eDcaArpRCOMxZXMPnJQNrXvxVGm9el2Kh7HPEispgnBJpiNwxt
 R3p1hLoafAM5axXGwomH6c7G69rQzS2dKrOGbjfMSmS9VRKUOWioKohgiEuhNP+SuzdwJ3o+BFY
 pm2ayJfV1j0KwUKBGbSzTe7EvhRHleT7UQkxWWN5oZlAs9CaBMReaBBoY+o+IkFWeZpoNbsiPw2
 okWrZEElqWsGhEp7YRwe0EsNUA9/pQnBqb/L7XnzbQX+53V+0lnv5amh/k2dA3uQyAufcNz6SpO
 OCQh3EmuG8JmURZGWrAt3B7dNll/6KPJn+3v3ou8=
X-Received: by 2002:a05:6000:2512:b0:428:56c5:b305 with SMTP id
 ffacd0b85a97d-4298f50e774mr3020199f8f.6.1761323566448; 
 Fri, 24 Oct 2025 09:32:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE0ecdjl893GPk2y6ktgkBsBRGHc41KuIqOoU0J/Daeu35YjMVrY7JI1HVEeCUDs3Kqrt+ow==
X-Received: by 2002:a05:6000:2512:b0:428:56c5:b305 with SMTP id
 ffacd0b85a97d-4298f50e774mr3020168f8f.6.1761323565993; 
 Fri, 24 Oct 2025 09:32:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898ee8a9sm10069463f8f.46.2025.10.24.09.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 09:32:45 -0700 (PDT)
Message-ID: <cea0b5a4-d980-49b9-9bda-981df538cd18@redhat.com>
Date: Fri, 24 Oct 2025 18:32:42 +0200
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
 <6757f62e-0b10-4fc5-a9cb-16006c723459@redhat.com>
 <d7115122-1054-4f2d-8f50-a356e87d198b@ursulin.net>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <d7115122-1054-4f2d-8f50-a356e87d198b@ursulin.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I35L1w_DdJIlDlX5waCyf2XhXibRRVaHlmS0MNW_xIM_1761323566
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

On 24/10/2025 17:18, Tvrtko Ursulin wrote:
> 
> On 24/10/2025 13:48, Jocelyn Falempe wrote:
>> On 24/10/2025 13:53, Tvrtko Ursulin wrote:
>>>
>>> On 24/10/2025 12:04, Jocelyn Falempe wrote:
>>>> On a lenovo se100 server, when using i915 GPU for rendering, and the
>>>> ast driver for display, the graphic output is corrupted, and almost
>>>> unusable.
>>>>
>>>> Adding a clflush call in the vmap function fixes this issue
>>>> completely.
>>>
>>> AST is importing i915 allocated buffer in this use case, or how 
>>> exactly is the relationship?
>>
>> I think it's mutter/gnome-shell who copy the buffer from i915 to ast, 
>> here is the logs:
>>
>> gnome-shell[2079]: Failed to initialize accelerated iGPU/dGPU 
>> framebuffer sharing: Do not want to use software renderer (llvmpipe 
>> (LLVM 19.1.7, 256 bits)), falling back to CPU copy path
>> gnome-shell[1533]: Created gbm renderer for '/dev/dri/card0'
>> gnome-shell[1533]: GPU /dev/dri/card1 selected as primary
>>
>> card0 is ast and card1 is i915
>>
>> Do you think there is something missing in mutter?
> 
> No idea. I only notice that the log message "falling back to CPU copy 
> path" has been removed from the codebase in:
> 
> commit d4e8cfa17a3a69965b9bd130ded46cf54a438908
> Author: Jonas Ådahl <jadahl@gmail.com>
> Date:   Wed May 5 15:53:59 2021 +0200
> 
>      renderer/native: Use MetaRenderDevice
> 
>      This replaces functionality that MetaRenderDevice and friends has
>      learned, e.g. buffer allocation, EGLDisplay creation, with the 
> usage of
>      those helper objects. The main objective is to shrink
>      meta-renderer-native.c and by extension meta-onscreen-native.c, moving
>      its functionality into more isolated objects.
> 
>      Part-of: <https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1854>
> 
> So long long time ago. Maybe worth trying with a newer version?

Yes, I've reproduced the issue on an old version, rhel9.6, but I'm being 
told it's still present in newer version as well.
I will test with the latest version of mutter, to see if it's still present.

Thanks,

-- 

Jocelyn

> 
> Regards,
> 
> Tvrtko
> 

