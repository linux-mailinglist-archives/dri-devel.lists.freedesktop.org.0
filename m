Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434B1AECE27
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246C510E35C;
	Sun, 29 Jun 2025 14:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E/d37Q7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C2B10E0A7
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751208856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQhAjIZaqrzSin/ILh/jdA9Kl28mycO6RSVocvPjupU=;
 b=E/d37Q7JhFzLTtHM49KPoqxnmJgy1UmOhMMsajlQS1dgbL2/GVmHuFzA1mD4m6rh8jBeSg
 rSBUy7bmF7zt2dM1/LhAEzPcoW1Hdy9L7On6NoymC6kXd2J8cEjy0eP+yNyq+LKA5498h4
 XnqC0wYXLrXfZqpK6KFiFRdlwaJusjs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-vQrSAh1dPByFgOVm-OtsKA-1; Sun, 29 Jun 2025 10:54:14 -0400
X-MC-Unique: vQrSAh1dPByFgOVm-OtsKA-1
X-Mimecast-MFC-AGG-ID: vQrSAh1dPByFgOVm-OtsKA_1751208854
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4f858bc5eso976066f8f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751208853; x=1751813653;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OQhAjIZaqrzSin/ILh/jdA9Kl28mycO6RSVocvPjupU=;
 b=LpbN0FXzmo4llmgbbm1AlzJfJuEEJ0iU7yIS9Wf8NlvHP9VMRDN2El3KJ7tvehOZMQ
 opqLDcpWG2K2+i7PrMpCtkzE9oKIS0jkpDKgi3isCCPoWwUxIPKnRTCd7qTuVP57uUa6
 +jhDkznCUarDfWJwYc/M4+miOE72akJE6Xa1/UBsN0NYHmiK7V+6jXjkbZkZvb+3dO2Q
 yGLrkd1zJYKDtI7BSBkCxaiD9v0/LrWyjbB9w1RpSLTqXthrKkn6N5pGszo+vNJURhAr
 Ksl8IpTf+PK0SRg7m1cRrERfS++CZG9xDDlF/F9A0uJ5wAkapO/x94SK2l0UMMpeJbLA
 33bA==
X-Gm-Message-State: AOJu0YwRutehzODW5+CJxLSEb47G+M6PKTG0IFvjfPQ6G5nmo+eDAif8
 UMH7VU3jkjB3sg0NVdFqGFjtoyjUWXgDfisAY3xN/Rebqg1smmunAlHWNsSGaCcs0cw6ClTEe8r
 3vxn+6jNr6gkEtYK+6Y9Klj8A1DpkZDSmkiBjUHhhckI2EaiC/SqBdCwzN/sVNUihYT1PhQ==
X-Gm-Gg: ASbGncvy/neM8CdDcFcad+y2NlluLyO667FhA6UokmG/SE4aq2IFWKZ57cE2rJcs6ul
 6Qzf3nFhN6lw9fAqpQGVxuKS/hksHjCaBW2rqoLq/++ERQzuaUj1+h6FoQczXiUW+Mc7WL2ozRb
 64KIX8lyb176uid19zGWa76Q8bfpdzdJJiJ45HtKatUD1mnBAxzdnQiwW9IfBFwsksIev3bAdEN
 58AzkYAMF3JZQYrx16SgLnAzguRflbayrDTYkafryxwiTNwp5TTwr4aadzFA21IFEFks7vcS0CB
 frJ6kVmGf1Hc2HYgwE6zCjMA83cv/OApbK4IQxHG9ALIV+d8c7uP68n4IOwkwg==
X-Received: by 2002:a05:6000:4186:b0:3a5:57b7:cd7b with SMTP id
 ffacd0b85a97d-3a8f482cf28mr7316068f8f.22.1751208853595; 
 Sun, 29 Jun 2025 07:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBMBWkMBcKHvlqeEC2011OKDiMy1e9qvKMcbYXf7maBrJLSJvn0jG6UetsmvOQwcivB7Qgog==
X-Received: by 2002:a05:6000:4186:b0:3a5:57b7:cd7b with SMTP id
 ffacd0b85a97d-3a8f482cf28mr7316054f8f.22.1751208853166; 
 Sun, 29 Jun 2025 07:54:13 -0700 (PDT)
Received: from ?IPV6:2a00:79c0:638:3500:abf:b8ff:feee:998b?
 ([2a00:79c0:638:3500:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e52af3sm8072162f8f.50.2025.06.29.07.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jun 2025 07:54:12 -0700 (PDT)
Message-ID: <20f0c6fa-fb23-4159-b742-58994f2af30d@redhat.com>
Date: Sun, 29 Jun 2025 16:54:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 42/42] drm/msm: Add VM_BIND throttling
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
 <20250629140537.30850-43-robin.clark@oss.qualcomm.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20250629140537.30850-43-robin.clark@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b21OiS-obTRE-298iahLrwxwPqwbgG4bWtcw04oKw6I_1751208854
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 6/29/25 4:03 PM, Rob Clark wrote:

> @@ -1121,6 +1124,20 @@ vm_bind_prealloc_count(struct msm_vm_bind_job *job)
>   
>   	/* Flush the remaining range: */
>   	prealloc_count(job, first, last);
> +
> +	/*
> +	 * Now that we know the needed amount to pre-alloc, throttle on pending
> +	 * VM_BIND jobs if we already have too much pre-alloc memory in flight
> +	 */
> +	ret = wait_event_interruptible(
> +			to_msm_vm(job->vm)->sched.job_scheduled,

Ick! Please don't peek internal fields of the GPU scheduler (or any other API).
If you solve this within your driver for now, please use your own waitqueue
instead.

However, I think it would be even better to move this to a new generic
drm_throttle component as discussed in previous patches. We can also do this
subsequently though.

> +			atomic_read(&job->queue->in_flight_prealloc) <= 1024);
> +	if (ret)
> +		return ret;
> +
> +	atomic_add(job->prealloc.count, &job->queue->in_flight_prealloc);
> +
> +	return 0;
>   }

