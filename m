Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B812C06ED0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 17:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4281A10EABB;
	Fri, 24 Oct 2025 15:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="P+8PcSce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDFC10EAB9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 15:18:51 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-475c696ab72so17549485e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 08:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761319130; x=1761923930;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MkRTdZ2GEv0ZlkKAaEQ5zFizjOOe2ZScnJHP8Z7wHGE=;
 b=P+8PcSceWoWV/7USZ7c8Ubzr0XkT+8CjMaAxAoj9x4Toum+wA2i9jJ36YPL8gnUlkR
 +BBdxXbof09hKJl4/t91AymXi5cGr54y2UglldoVgSGKPH1S0JnHRENrZsyurBfzBFLu
 T51NQd7Q3cS6Y+vuomk8mu5vfTrQwbq2tUJJ5LH/uQSdQoCP0AnqGdIS/IY2sdtpnf85
 S20eYsaF7dcZTJA/bLShzWdE4N9AgsghVTJaOr+ajv+DkEPfKgx+pG4oiqr0OZwAsMiq
 OL+T/tIpawQ+DK5V5LnVgtJkkeNJKTKgaMYm+mzghf0+9lG+lVOP9zsboeATCofjEHv0
 7d2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761319130; x=1761923930;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MkRTdZ2GEv0ZlkKAaEQ5zFizjOOe2ZScnJHP8Z7wHGE=;
 b=HBNO0H4d/2pjZN3TKlKvHZPy1V2yZ9Ef/Fqcn5McP1iZXwML5ijhvt32HlrAza93hX
 LRaLu8nC1N+oKuAE1eIO1cnrNLWCM8UQZGlVubioGc7fIypswhR24+QuZkycJSDIBL+1
 xJ/sIOAw81hDd2awD6XhBwMSSizyeA+OWWO5kAKFIFts059W54EyiyI6apjFXgwxnj9C
 0P5bB5WJNOjOzGXbxmLGLak5ZLmlCPwlPqT2aVYmzItnvBRo3gK3oS4cQaTveXsBTyaH
 zgY23S+677vOm4u38rVqdsjNDrMFgzW7g1rkxk6cO2Sf2PDikRdJOWTCoAx2Y3QDdlbv
 Ygfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9D1oWJAlFMdaqSx3x+ffajJBk9vbNVIMk4D5VcaEfr1Q+HpaVGTuK98eK/pe2G1BLi22PW3MNxE4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJv/RR4nN2RfIo9k2AailekR8FxPc93otYMV6zrEoA1Gsar5y6
 +SC64irHi1J8aSR01MqtzHTDqzwPrLOycKcJJhZArLg4pEaPUOBJLagiD6MlBG+sZwU=
X-Gm-Gg: ASbGnctMOSWMXEZvzttn3+2Nz8sj6elAUb8Lk3zeokMMVAuPNkI3pbZIRmMzdTn3TXj
 6yDuG74p+1ImzsWh32BYZPahqWeStoLawT7AKRwpxb/Q9M7ewa+bTBpLYeprZ3y66rzfFrBmqhW
 tQlyOmgVuN514idwmh1u3w6/74RYpeZq+mfWNMrKAmCXJ13xDBkEr6TOWGq3mltD1L4ZU/EXuE/
 7UAoDJQbrell6Ap5LO3DDn4CGQjT3TLHbZlxp0cHt8FoE9QK+hI+4u+zmFYTikIdkCXhxwJNaxV
 8Pbu4l4oqLdxCdVL+cX7AMQcArXLoWZ4Tc2sw3NnIDFlZ8hesLnWLF9FnA7M7NuEMLxDX3++tTU
 5DcEDNolCQVouzSaHrxpvCZda40j8tFrmKJmWsXL59neh69F6PG483YzunL91sPNSWD5uFv7ZxP
 ND1zbMa/mRbf312dc=
X-Google-Smtp-Source: AGHT+IEPNA3Z+urJmbYTM1Gg//7eMp2xt/C5B/zXH8POZq5INB3NpCVxPvjzmA4XCZQv85HNhdX/qA==
X-Received: by 2002:a05:600c:4e0f:b0:46f:b42e:e397 with SMTP id
 5b1f17b1804b1-475d30d8ae1mr27338785e9.40.1761319129636; 
 Fri, 24 Oct 2025 08:18:49 -0700 (PDT)
Received: from [192.168.0.101] ([90.242.12.242])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4369b5esm180672045e9.15.2025.10.24.08.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 08:18:49 -0700 (PDT)
Message-ID: <d7115122-1054-4f2d-8f50-a356e87d198b@ursulin.net>
Date: Fri, 24 Oct 2025 16:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/dmabuf: Flush the cache in vmap
To: Jocelyn Falempe <jfalempe@redhat.com>,
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
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <6757f62e-0b10-4fc5-a9cb-16006c723459@redhat.com>
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


On 24/10/2025 13:48, Jocelyn Falempe wrote:
> On 24/10/2025 13:53, Tvrtko Ursulin wrote:
>>
>> On 24/10/2025 12:04, Jocelyn Falempe wrote:
>>> On a lenovo se100 server, when using i915 GPU for rendering, and the
>>> ast driver for display, the graphic output is corrupted, and almost
>>> unusable.
>>>
>>> Adding a clflush call in the vmap function fixes this issue
>>> completely.
>>
>> AST is importing i915 allocated buffer in this use case, or how 
>> exactly is the relationship?
> 
> I think it's mutter/gnome-shell who copy the buffer from i915 to ast, 
> here is the logs:
> 
> gnome-shell[2079]: Failed to initialize accelerated iGPU/dGPU 
> framebuffer sharing: Do not want to use software renderer (llvmpipe 
> (LLVM 19.1.7, 256 bits)), falling back to CPU copy path
> gnome-shell[1533]: Created gbm renderer for '/dev/dri/card0'
> gnome-shell[1533]: GPU /dev/dri/card1 selected as primary
> 
> card0 is ast and card1 is i915
> 
> Do you think there is something missing in mutter?

No idea. I only notice that the log message "falling back to CPU copy 
path" has been removed from the codebase in:

commit d4e8cfa17a3a69965b9bd130ded46cf54a438908
Author: Jonas Ådahl <jadahl@gmail.com>
Date:   Wed May 5 15:53:59 2021 +0200

     renderer/native: Use MetaRenderDevice

     This replaces functionality that MetaRenderDevice and friends has
     learned, e.g. buffer allocation, EGLDisplay creation, with the usage of
     those helper objects. The main objective is to shrink
     meta-renderer-native.c and by extension meta-onscreen-native.c, moving
     its functionality into more isolated objects.

     Part-of: <https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1854>

So long long time ago. Maybe worth trying with a newer version?

Regards,

Tvrtko

