Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BFCB7E99A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59BA10E194;
	Wed, 17 Sep 2025 09:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="KQIUngJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C974E10E194
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 09:17:09 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-45f29dd8490so34113015e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 02:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1758100628; x=1758705428;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j6k6+iaKshdFxFD/QLgHulhbPMnnzSRsNw8DKr/cshE=;
 b=KQIUngJMDViRnho1nNducaeivT5sWeQg/BHAvUtPYVlGNoadwK8D8yIKQyPhkwJN2z
 orRRAdkjQqhl2LU6YtmOVZtyPczd/pi4jTKyvXmfws8wmmsu76lqNA5ZXghF1HohuHzy
 pjcA4VV/qw46mbMJ4eZ3TiQ5r5KJzG9QWqC/r1p1v+y/dporLRwN51fbK2rWw6ESZt8x
 rujli9kFB7GpSQ7oV4Fztv0/JqbZ3A3diqCiOsob38vRy7s0LyCR4bG40YmhOqAWEqFT
 WY5bxxkWPKmiObwQ/pEknY4yU5wJGEr35hcLH/KMUeLwaBmslKyC+KkU8a96YAQXUevV
 0UWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758100628; x=1758705428;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j6k6+iaKshdFxFD/QLgHulhbPMnnzSRsNw8DKr/cshE=;
 b=H97gtFJdNrb6IhpdY5o6JBO4HNjBoUeZnR8Rc1o3DL8n+Q088X6qXHhbEwMMZf6xwA
 D+uw35iTfqjrSJoEvMttt6JJV4TturiGGInAr0uahKz72fusMeSUZv+MPe6e/r/Blnl1
 Xph6jRG5b/kaPIgYcTFgyrwThi/4R1EWw3MK7jS4rotqyECQaja/01dwPHPvblHvxQ37
 hXAkd+AR4hxbZJodrnmmkK/FPbCo8nqc1WEqtW6k9s88W+3rhoVQgNa3MtPeSoQCfwea
 tRC02hApfJ2NezSOEPmXVjISerG6eX3yTuvfLT9JmOJGgvBFpojyPPoOsM2uPrTyOGjP
 yVEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsGdXo7eLmMVHn/XrDiVltFdPDIcpml90RQTZJz9MhQRmam84uKDhust2LawOFNXFu4oaFvOAiC+g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5cl333ZnoK6xKSuf5OCLoykTfKNHE1Io0ombViWH7CUSTdd1r
 nKr9QeT3Cr7whd3UgJA8zDtZkxRXsDnhTLRhrjKh5zcestehFsK6iqI6nerP2bT7PPU=
X-Gm-Gg: ASbGncvZUL61DeAaxaWPvcRUEtMUzBqjv3GHAI2SyRdbhuIH5wGUGpSLV+r0y86Mim5
 HxDSmyH4bbf1LBLn/GPFh5It1rJrEH9erq4qxg5iLbfBcM9CLexdeDYLTKpil36ZOZzNVxLtYaB
 toKT3M7URI8qeUYid2uIRBYtAQSz0i7UrBLOOuBGkpY5nrSjbjjpdRMjy5CTtfXQ04KoQYflHWZ
 3mXjOLSWCKczonHmZeN7ffjiY2BHDTS8B16jIYFt7EWOF7AoIltq5TcnLM34ftK94qe3j2vudbr
 i17EWbG0l8ecizLxvd+k2GDHqonH5HWSclQFxuPYCAOoeOgW1EikD74Ife8KBMcVHiwWmK1s/0d
 Yg9mVutwRrJyMZBZssIPPvHbMsQDsuDRerps=
X-Google-Smtp-Source: AGHT+IH65ZLg5FtP17OJWLSad0rqn19TFXfKKEOPrG/Cgx5KEGjTbmUMKlfkuYN9OzfYjqUtTuONcQ==
X-Received: by 2002:a05:600c:4f86:b0:458:bf0a:6061 with SMTP id
 5b1f17b1804b1-46205eb145amr13677825e9.24.1758100627984; 
 Wed, 17 Sep 2025 02:17:07 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613902db8bsm28622895e9.17.2025.09.17.02.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 02:17:07 -0700 (PDT)
Message-ID: <37619915-ff50-4a62-a43e-a0b2fcdb4596@ursulin.net>
Date: Wed, 17 Sep 2025 10:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm: Add GPU frequency tracepoint at DRM level
To: S Sebinraj <s.sebinraj@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com
References: <20250917084135.2049550-1-s.sebinraj@intel.com>
 <20250917084135.2049550-2-s.sebinraj@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250917084135.2049550-2-s.sebinraj@intel.com>
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


On 17/09/2025 09:41, S Sebinraj wrote:
> Add a GPU frequency tracepoint at the DRM subsystem level
> 
> The implementation includes:
> - DRM-level tracepoint exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency/
> - CONFIG_DRM_GPU_FREQUENCY_TRACE Kconfig option (default=n)
> 
> The tracepoint follows kernel tracing and provides kHz frequency
> values with GPU identification for power analysis and
> performance monitoring tools.
> 
> The tracepoint is only active when CONFIG_DRM_GPU_FREQUENCY_TRACE=y
> and can be integrated by GPU drivers for frequency reporting.
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>   drivers/gpu/drm/Kconfig                   | 11 ++++++
>   drivers/gpu/drm/Makefile                  |  1 +
>   drivers/gpu/drm/drm_gpu_frequency_trace.c | 16 ++++++++
>   drivers/gpu/drm/drm_gpu_frequency_trace.h | 47 +++++++++++++++++++++++
>   4 files changed, 75 insertions(+)
>   create mode 100644 drivers/gpu/drm/drm_gpu_frequency_trace.c
>   create mode 100644 drivers/gpu/drm/drm_gpu_frequency_trace.h
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index f7ea8e895c0c..975cc7b2581d 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -53,6 +53,17 @@ config DRM_DRAW
>   	bool
>   	depends on DRM
>   
> +config DRM_GPU_FREQUENCY_TRACE
> +	bool "Enable GPU frequency tracepoints"
> +	depends on DRM && TRACEPOINTS
> +	default n
> +	help
> +	  Enable GPU frequency tracepoints in the power trace subsystem.
> +	  This provides kernel tracing support for GPU frequency changes
> +	  that will be exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency/.
> +
> +	  If unsure, say N.
> +
>   config DRM_PANIC
>   	bool "Display a user-friendly message when a kernel panic occurs"
>   	depends on DRM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 4dafbdc8f86a..12c81b6a750d 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -77,6 +77,7 @@ drm-$(CONFIG_DRM_CLIENT) += \
>   	drm_client.o \
>   	drm_client_event.o \
>   	drm_client_modeset.o
> +drm-$(CONFIG_DRM_GPU_FREQUENCY_TRACE) += drm_gpu_frequency_trace.o
>   drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
>   drm-$(CONFIG_COMPAT) += drm_ioc32.o
>   drm-$(CONFIG_DRM_PANEL) += drm_panel.o
> diff --git a/drivers/gpu/drm/drm_gpu_frequency_trace.c b/drivers/gpu/drm/drm_gpu_frequency_trace.c
> new file mode 100644
> index 000000000000..b5fa5134226d
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_gpu_frequency_trace.c
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * GPU frequency trace points for DRM subsystem
> + *
> + * This provides GPU frequency tracing support that will be exposed at:
> + * /sys/kernel/debug/tracing/events/power/gpu_frequency/
> + */
> +
> +#ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
> +
> +#define CREATE_TRACE_POINTS
> +#include "drm_gpu_frequency_trace.h"
> +
> +EXPORT_TRACEPOINT_SYMBOL_GPL(gpu_frequency);
> +
> +#endif /* CONFIG_DRM_GPU_FREQUENCY_TRACE */
> diff --git a/drivers/gpu/drm/drm_gpu_frequency_trace.h b/drivers/gpu/drm/drm_gpu_frequency_trace.h
> new file mode 100644
> index 000000000000..cf6337847b3a
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_gpu_frequency_trace.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#if !defined(_GPU_FREQUENCY_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _GPU_FREQUENCY_TRACE_H
> +
> +#include <linux/tracepoint.h>
> +
> +#ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM power

Not sure masquerading as a different subsystem will fly.

> +#define TRACE_INCLUDE_FILE drm_gpu_frequency_trace
> +
> +/*
> + * Tracepoint for GPU frequency changes
> + * This tracepoint is exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency
> + *
> + * location: /sys/kernel/debug/tracing/events/power/gpu_frequency
> + * format: {unsigned int state, unsigned int gpu_id}
> + * where state holds the frequency(in KHz) and the gpu_id holds the GPU clock domain.
> + */
> +TRACE_EVENT(gpu_frequency,
> +	    TP_PROTO(unsigned int state, unsigned int gpu_id),
> +	    TP_ARGS(state, gpu_id),
> +	    TP_STRUCT__entry(
> +		    __field(unsigned int, state)

Why is the frequency field not called frequency?

> +		    __field(unsigned int, gpu_id)

It is required to be able to identify which GPU in muti-GPU systems. See 
how gpu_id is defined in gpu_mem.h.

Regards,

Tvrtko

> +		    ),
> +	    TP_fast_assign(
> +		    __entry->state = state;
> +		    __entry->gpu_id = gpu_id;
> +		    ),
> +	    TP_printk("state=%u gpu_id=%u", __entry->state, __entry->gpu_id)
> +);
> +
> +#else /* !CONFIG_DRM_GPU_FREQUENCY_TRACE */
> +
> +static inline void trace_gpu_frequency(unsigned int state, unsigned int gpu_id) { }
> +
> +#endif /* CONFIG_DRM_GPU_FREQUENCY_TRACE */
> +
> +#endif /* _GPU_FREQUENCY_TRACE_H */
> +
> +#ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm
> +#include <trace/define_trace.h>
> +#endif

