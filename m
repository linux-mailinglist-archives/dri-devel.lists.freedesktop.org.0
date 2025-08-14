Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6E6B25C15
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 08:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9011A10E7F6;
	Thu, 14 Aug 2025 06:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="fVpwz3ku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3505510E7F6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 06:44:43 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45a1b05a59fso4009915e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 23:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1755153882; x=1755758682;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cc498I+j1YOWceGut+z2RkLYjN1WkXnttkUY56LCj5U=;
 b=fVpwz3kuAaQZuGPh+WT1jdzw0yhB9PHXbfn5XSVgz3fr8+/mID4s+Cy7fzFH7EVlcv
 0HNvIIxUwd7MkIXrWfOriCx23seUgDYWASF9JYZoNk9JvT9ybYE7gH7SEd9CunsCZzZb
 5VsqA7tT5ocBqO0RxF0Bk1CTVYOy8Y9EAwaX7zVOd3H5uXPv4273bHuaOV+lEzBO/Czb
 h4bxV2jKVRr1VbIbuWew/h64KdNEaX/tim5HBqpiZC0qZ0zO4jhEGaEwKmKwfkY3qgy4
 9hK7fYg3OXM8WHQ5y114Ws6jQq114h/2mf+58/rxcDxvR+ZKXfARiHVN91W9sLikvF4K
 EnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755153882; x=1755758682;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cc498I+j1YOWceGut+z2RkLYjN1WkXnttkUY56LCj5U=;
 b=GcGyHZ3rkFectYp4R9o4njQmbgKIJaNk0V1bzUF3iebLCjmdAhQ2e3h9WwmK8/cf0E
 zFgFznApwEmXQExwGRL/MMChEh2XzbwUR0OBCNIpBXGiU7A/AwNi8fF/eUX+q2aj5LPi
 GBtElVlXtID7XNNFvco04oYh4St0T5GSNeT5XbxiWT+iOA8+di4LUgoNUtmAvFkAWlX1
 24FQrUHN0G4/Wa90GIin3oaxATHztBixgEJ9PJEYxidEgKKP866unaOzw4NaWHPR9Y5Y
 uoF/jaQ+SLKZSI5cev7RJtyGUWDrcVcTcgNWGxn8vxuf0GnRMa4PIdcJpaK93wKzEpzf
 qjBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0fNkFmz8WpC5qazBJQvRYe+S8Zo0LeZ/79KkEJq43zt2nv01XH7wBL2Jq4lRmdXAXOKxckp5NoLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yydeuj+Ok6HKE6V30imZ/k6HYEsJTKo/A/VwIXTslZkiyMslTLf
 A/x5G+E+W2DWZD4DRmRxA24QxhelFWvGHCNhidTxvD60xh7OAdw6KTBtdtH8pODCjAM=
X-Gm-Gg: ASbGncuEeFZYl3zgKsMiML+y6tRTxf+Ij4Zabr7vGRFbWKOQJtnF1dMcJoLgUO6nnTF
 2UNJy7+Tbuvk1TR3FOen9OzHsNcpymUCmaKCWnJzYNMD+BYHQI4cibOh/QVVjt7JT+qvF50uW/K
 BxFiacVi0gTkCNNe3JuMdkSyfTZ7wOlNaygf91WIdiaYnQVVTpOSGy7WU0KNmRJ01hU6pjjM7ov
 4V8KJ/Si5swzr0Ez4ToO+xyfSfBQdj2fgyNasayPi+Vy+3duiwWHf1fQHmCtgMGRrYc+smHfrnZ
 XY9lzQST+UDx7336K1OHkpyv5Go5N2b6p9GrylSLG0N7RzPz9VGl6xp33AkFr8qEWleJdFzncj/
 Jb9RTjr/xKfVD+6RfKt5uuFU+ek2MQ5khXo5rOYoT9PFYRg==
X-Google-Smtp-Source: AGHT+IF8l0U9o5tnd3mzmSDQchRPhxwSlrS3PKFKAywoFUAe6DOgztRr7W+afUTUWc9q0QSWOk3RFg==
X-Received: by 2002:a05:6000:22c5:b0:3b6:b020:9956 with SMTP id
 ffacd0b85a97d-3b9edfe35dcmr1327501f8f.43.1755153881336; 
 Wed, 13 Aug 2025 23:44:41 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8ff860acbsm23593149f8f.51.2025.08.13.23.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 23:44:40 -0700 (PDT)
Message-ID: <ceb80fde-dae5-478e-840c-9b949396d904@ursulin.net>
Date: Thu, 14 Aug 2025 07:44:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/active: Use try_cmpxchg64() in __active_lookup()
To: Uros Bizjak <ubizjak@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20250725072727.68486-1-ubizjak@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250725072727.68486-1-ubizjak@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


Hi,

On 25/07/2025 08:26, Uros Bizjak wrote:
> Replace this pattern in __active_lookup():
> 
>      cmpxchg64(*ptr, old, new) == old
> 
> ... with the simpler and faster:
> 
>      try_cmpxchg64(*ptr, &old, new)
> 
> The x86 CMPXCHG instruction returns success in the ZF flag,
> so this change saves a compare after the CMPXCHG.
> 
> The patch also improves the explanation of what the code really
> does. cmpxchg64() will *succeed* for the winner of the race and
> try_cmpxchg64() nicely documents this fact.
> 
> No functional change intended.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> ---
>   drivers/gpu/drm/i915/i915_active.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> index 0dbc4e289300..6b0c1162505a 100644
> --- a/drivers/gpu/drm/i915/i915_active.c
> +++ b/drivers/gpu/drm/i915/i915_active.c
> @@ -257,10 +257,9 @@ static struct active_node *__active_lookup(struct i915_active *ref, u64 idx)
>   		 * claimed the cache and we know that is does not match our
>   		 * idx. If, and only if, the timeline is currently zero is it
>   		 * worth competing to claim it atomically for ourselves (for
> -		 * only the winner of that race will cmpxchg return the old
> -		 * value of 0).
> +		 * only the winner of that race will cmpxchg succeed).
>   		 */
> -		if (!cached && !cmpxchg64(&it->timeline, 0, idx))
> +		if (!cached && try_cmpxchg64(&it->timeline, &cached, idx))
>   			return it;
>   	}
>   

Patch looks fine, thank you!

I've sent it for a CI pass (see 
https://patchwork.freedesktop.org/series/152185/) before merging.

Regards,

Tvrtko

