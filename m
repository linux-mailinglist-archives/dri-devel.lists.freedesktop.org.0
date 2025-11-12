Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2858CC516F8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 10:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0835A10E34A;
	Wed, 12 Nov 2025 09:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="nSGCm5nU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3AE10E34A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 09:47:01 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-429ce7e79f8so391397f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 01:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762940820; x=1763545620; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zH4o3q1L44X/0peS5m4xN21r8Fva++k7ZzB8YahQa/0=;
 b=nSGCm5nU3OBfq4bA63VaxmoQ3yt9sYcKLPv+rJbs5gSWsJWKC3jsp7LQW9C7pkqzJ6
 Q16VAmTxoRqzrcFDW8Y4ctDcsRpYHfviiE6gAshUAI6eGlvs1anNSkZd1n2Y8EvYKPSf
 VvG9aCPsfLvNWGl8PLjDagYI+sY5GAX1CcyCkl8bZJgXgmPXZvO1k81fUpTHRMpOkgSp
 DHzwYP68Gg7tFwE1QxlR2zl+mszTm3d9diwJt8bHxIoA6d+RKvhKxgTSLg9KSR2rClXW
 VQaQ3Cnr6wgB0T24iSUa+v/KM6XrmP5fU5ncN1bDtwP5o3gscXShTQiJkc8bLI8OyPAS
 kNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762940820; x=1763545620;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zH4o3q1L44X/0peS5m4xN21r8Fva++k7ZzB8YahQa/0=;
 b=V6y7qPrknc0HUHDgMWmCOhlcA+vGsZUAhy5A2/09GiOfblCQPy+MfgC1BqOdUHVM2k
 XsVEji2Zut7GUEuxME0WW4Einwe3WZD2vus5eYnuTnrMKyAH7zsvdJ1K8IQzmiSblKUk
 W7sb1jqsSLP5fIYgnBUdUaQonteNtTFjoqoTu3OOy2Ub1b5b1lsizyUYj7xRyxamD08M
 0+2pbnGZo8DPZuZcvGUxmNsONFKFZmpjSgWJFVK9P/eSup/NM0ql3MdkhK8pi5NUWmfJ
 qU2d0aEMlpQSX0NCbYEInD+mmKLbmr7z4V3/3ielzldRt8+JsO8x5r4+bZBHW3YPFrW9
 nktw==
X-Gm-Message-State: AOJu0YyBndu2ywD9EG+jOcKl0BhLUa+cBw3GE0yvoa8xACciiPzeA6S4
 c8L/o0zZU5K2ZTMubxrskttj5qaMCHf62Xh64XHI2PtySlxoCUlXfi0p6vRENwKclPRHoXLXTci
 U0bJN
X-Gm-Gg: ASbGncuV4FMJM2YOGcDFqLeMLK0/g/bkW+3kbO/zt88CzD/528nyV7zwHFfT3bjljr9
 EATDka7tWR8BTdFqxz6lF5jO+iYSgOtmxQ9bxpAIbmLiYcfdtzCUiOrWlanCcf6q2PZZvQwLhOv
 x7YTN4c5cPHwn5dWiEJQvGRNajjHOpcB02zwJvHSmnLGCtx+vtKq48uN5f78J6U+8PPe3e5Nm7G
 HIRWtahBzTbaX7b4xMwmsZbKtJ4CsdiR3jKCgXvNn+WfQdPep9n7mOP6GbVp58zRylWAEtNBDOK
 v3DHvMVumM9G84pAxqSfLNajtTs9yYNNwEYuf1kE+VBo/Nwss5AvcL+yfXdK9XlBI2H7Hc0xnso
 OrF37rt5AaVCD4cK6isaEzeN4bEj8cjD2XHvKJWxGzKzqOfh0xwjFIrGK1Dr8j/LrIDSZo3Zuxm
 Bl8U5nSxq8N1QL0obCcxl0rQ==
X-Google-Smtp-Source: AGHT+IHpBCwExuuhQRu+JrqnaJ14VJBUuNzDyQ7kpmml24vqKQH0DF8Jy1NpPafZMFNAmZMwbTbYfw==
X-Received: by 2002:a05:6000:4008:b0:42b:394a:9e0 with SMTP id
 ffacd0b85a97d-42b4bdb2becmr2036730f8f.32.1762940820435; 
 Wed, 12 Nov 2025 01:47:00 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac6794f6esm37288938f8f.41.2025.11.12.01.46.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 01:47:00 -0800 (PST)
Message-ID: <1e71b41d-38ba-425a-a370-1bb92a772014@ursulin.net>
Date: Wed, 12 Nov 2025 09:46:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Don't crash kernel on wrong params
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251112091851.104443-3-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251112091851.104443-3-phasta@kernel.org>
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


On 12/11/2025 09:18, Philipp Stanner wrote:
> drm_sched_job_arm() just panics the kernel with BUG_ON() in case of an
> entity being NULL. If the entity is NULL, subsequent accesses will crash
> the particular CPU anyways with a NULL pointer exception backtrace.
> 
> Remove the BUG_ON().
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v2:
>    - Drop BUG_ON() instead of replacing it. (Tvrtko)

The option of removing the BUG_ON was conditional on brainstorming a bit 
whether we think the null pointer dereference is the worst that can 
happen or not.

Other option was "WARN_ON_ONCE() return" in arm and push.

Problem being, if we allow it to continue, are we opening up the 
possibly to mess up the kernel in a worse way.

For example push job writes to the entity. Okay offsets are low so is 
the zero page always safe to write? I don't know but sounds scary. From 
that point of view BUG_ON or WARN_ON_ONCE with exit are safer options.

Regards,

Tvrtko

> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 1d4f1b822e7b..05eb50d4cf08 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -857,7 +857,6 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>   	struct drm_gpu_scheduler *sched;
>   	struct drm_sched_entity *entity = job->entity;
>   
> -	BUG_ON(!entity);
>   	drm_sched_entity_select_rq(entity);
>   	sched = entity->rq->sched;
>   

