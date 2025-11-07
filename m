Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF43C41A0A
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 21:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6347610E035;
	Fri,  7 Nov 2025 20:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="rIcU70MQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EC510E035
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 20:48:54 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4711810948aso8412055e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 12:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762548533; x=1763153333; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JOrW5Q8xydcVXM43dd9aQAu40I7etAmkHTRU8lGajvI=;
 b=rIcU70MQ6PIcEj/pod8kvPx1EQzzUEDkfpJaykHFeRqtJbVFhBYEd2TbCUtjLYpsmk
 G8Inb2ourGynDGd8MsQVGRbrK8Tx8Bu2wF6XXJeRsWJOs6YuFbyRCkq4gSWCAXs7p1iP
 HfJRrlCaqCmAi3/3qq/VYOgLo7CwRPQsaMDxsn8HQFJsFVZEDXuUqUZU0S2yCoNtoyR6
 /B0jsAxh2ceoBIWSv1Tt8bx9XuVGtV5y4FRpwr8yBBNW8nPamTimCcro+Ac9ETEqsHz7
 1H7+fKxlEYEggxQH0N9m9oOJoctIkzJUlU3ssd8fQFFt9S+fGLUxf3BzyylRVNZFsECL
 IvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762548533; x=1763153333;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JOrW5Q8xydcVXM43dd9aQAu40I7etAmkHTRU8lGajvI=;
 b=J7TjUoobxrprHRv301oXj5+1+vUFpXvSJ0I3r8FYJ2+5PEoDNsYsYSnIWh/sLczxA1
 HGFRNuLkDXeqUHGL/zO5S+N9aNw2xEqS3ytpNZ7athJQTy5FPbpIYLFqjxHGee98GvAa
 sMuGVlCiK6p8lGPe9M+iFwkpW+V97cWBRQa/dWYfr7TWFxEz1BfZWvB/mCVQsocticIl
 gwq64ef33Pn3SL/Pv8vHFU9npW4+jLyPGYODT3uwjvHbWJYwJRn0C4GIKFSov3McLLwP
 2Qka+Zb82hmVpUl7ZSALt/6/nQwGfeEPWyqAS0pubiKev9arvQmErWcxUTp4R8LMdB98
 F4rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1mYUtRIVQPdp0kZf53mOhA8FX4AXTaJULa/sYbVYe4Qt0NKOeWFout+4ogpByA1kjPVOTMbOndb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD5HfVmTdtcDMPqQuLot+pEuORI5oy4RZvvyP/fsBAkMHwKLmc
 5x9orbL18a/leVbZ5Cl0NyTQQ2vFyCHsJ6QSYCgcf6fAy/IWHqYfRq7QL1sEe6FU3sM=
X-Gm-Gg: ASbGnctM8TrvSZAUWkk4ZnJzAOFeTlQR+LkCmvaHozZt7Hn1XsfoM/VGTNNzZXLVA1r
 9cQD9A8di4p9YmTkY/2tbJ4WHFi1E1TBf8WIup9ccphy/FTgnf5EYkRa6JgzaxzHWpOA0IHEnW8
 BuI407aes+JUWe+sR2JgnPfxoo2xGGJNiN24rK7nxY7g2vpti2aKdtYPVZRbqx/UNMrm7Esse8A
 /GlXtoL+pXpyJ9GtYXbQBpEvP+vhLSk/hvinOgh7UJzROOOuLWt6L5dsGmuFEKUmrB+ku9hVYM+
 EjPYk/UKOCnjtLsBHsY29w+s5llP+K+imvz6bCrrS4YAhxrMNof1qKWSEzVjz5v+/kQBmiNfhtX
 sp7giwom1jpVehH0k0O0ZhghN6AMFl6T6My8I36zX/gGGJz/kQRCH6zTQAw+hQknhbDWgUxVQe7
 xpRx6J62eGFu9rJeDh
X-Google-Smtp-Source: AGHT+IGa8NQ+H5fu5Ot6rFuuXBzldd5AfEsvjMI89lcmjBY68BYTS+xXWss+yNFMorFaomhESv3lIA==
X-Received: by 2002:a05:600c:8b4c:b0:46e:4a60:ea2c with SMTP id
 5b1f17b1804b1-47773293987mr2821745e9.37.1762548532683; 
 Fri, 07 Nov 2025 12:48:52 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47763b5359esm53398575e9.0.2025.11.07.12.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 12:48:52 -0800 (PST)
Message-ID: <14ca1b28-df1d-4065-ad7a-97a3ff81a5a4@ursulin.net>
Date: Fri, 7 Nov 2025 20:48:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i195: Fix format string truncation warning
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20251107164240.2023366-2-ardb+git@google.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251107164240.2023366-2-ardb+git@google.com>
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


On 07/11/2025 16:42, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> GCC notices that the 16-byte uabi_name field could theoretically be too
> small for the formatted string if the instance number exceeds 100.
> 
> Given that there are apparently ABI concerns here, this is the minimal
> fix that shuts up the compiler without changing the output or the
> maximum length for existing values < 100.

What would be those ABI concerns? I don't immediately see any.
> drivers/gpu/drm/i915/intel_memory_region.c: In function ‘intel_memory_region_create’:
> drivers/gpu/drm/i915/intel_memory_region.c:273:61: error: ‘%u’ directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 11 [-Werror=format-truncation=]
>    273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
>        |                                                             ^~
> drivers/gpu/drm/i915/intel_memory_region.c:273:58: note: directive argument in the range [0, 65535]
>    273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
>        |                                                          ^~~~~~
> drivers/gpu/drm/i915/intel_memory_region.c:273:9: note: ‘snprintf’ output between 7 and 19 bytes into a destination of size 16
>    273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    274 |                  intel_memory_type_str(type), instance);
>        |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> 
> This is unlikely to be the right fix, but sending a wrong patch is
> usually a better way to elicit a response than just sending a bug
> report.
> 
>   drivers/gpu/drm/i915/intel_memory_region.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
> index 59bd603e6deb..ad4afcf0c58a 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> @@ -271,7 +271,7 @@ intel_memory_region_create(struct drm_i915_private *i915,
>   	mem->instance = instance;
>   
>   	snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
> -		 intel_memory_type_str(type), instance);
> +		 intel_memory_type_str(type), instance % 100);
It's a theoretical issue only since there is no hardware with a double 
digit number of instances.

But I guess much prettier fix would be to simply grow the buffer.

Also, hm, how come gcc does not find the mem->name vsnprintf from 
intel_memory_region_set_name?

Regards,

Tvrtko

>   
>   	mutex_init(&mem->objects.lock);
>   	INIT_LIST_HEAD(&mem->objects.list);

