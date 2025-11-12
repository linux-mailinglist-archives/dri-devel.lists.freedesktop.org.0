Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D91C51585
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 10:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3720310E1BE;
	Wed, 12 Nov 2025 09:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="wTnIp+X6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1B910E1D0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 09:26:45 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-42b379cd896so311815f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 01:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762939604; x=1763544404; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K6o4ShRZkHRUWNEA1Gxq8wchbZOAVId9k8T/+YEnweQ=;
 b=wTnIp+X6xV5hsOri4QOUunp9fABMjVU+EoDQoS9AdI3s99z2kcNVjcW8veRBLIHNmF
 BOdeS2qzggrrMgR6WgRdv6ahc3qNRe8dcnDNii0Pb//qxl2v/rVuNdhuMnCkVsxkKmst
 aU9Db+q5mARisPoe0rOcl1Tl2Y0drxQTKLDrQtcNCUPsYhXaYUuJ0FbzSwr4QeMfNcre
 91VNVcSNqCgzB+0XkbZrHUddNYO0LMjiFnvRJE5ymnUWnQP3wqyMwTDVid8m4DhpiCLw
 qL2IudmP1tNznwJbwwDXaJBpGIQcU4dVWpa1zaV4kfu/DuLw/TEPpGU0nY3kQAu7R41a
 jQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762939604; x=1763544404;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K6o4ShRZkHRUWNEA1Gxq8wchbZOAVId9k8T/+YEnweQ=;
 b=j9rFIFmWXM8RpFW4bNzyJyVf0wJKOQknc1cIFaGvyS9Eea7GENNy/gPOG4yDQCj+aq
 f2/LwwiwDwPdvpG/PqXOBNPVw7T/sNP6GN6rqogCAFiIPf0i7I7vm6eRZAGyEAM9f8+a
 5/3AFN2EWKg1UTS/GXdeLKwvymYmo1NX0SBBkFZtPy9jrqfiqsE2ElBJN3zFxlUNHwcD
 rfIscmUphv3qFoqR0FHPzdWPBFYbH9Z2v23rbG9BT7xr3iSW01H0ucoUkE5ctJG6vzBr
 CGnEr4eqAvGw2EnvGOMQzXBVd6dZUb4/+0eUUVOHoMF/lnJpmbADVQmvliAoCspx/RfS
 WDhA==
X-Gm-Message-State: AOJu0YwVc6kNkHQU/XIIBsX2xsYODDKo2xEPw7Oa1liov9ql5/3SLGw/
 6Jfrq3hJ2MOfGpcIMDaf49QaiI/hym5V1Xodh2MrJjzBj1zGwCtrNafTdFc05fytXbk=
X-Gm-Gg: ASbGnctp6g71zGHiplPbAj84s65sKloYNVzbSof7m3g1GYuz+6ASlEs5SkzcSaHBXVx
 fgKyhsGrtNyT88ySzUUSpfdoYIP5eQ4O39scjaBI9JvqINs8tqNAwEE+Nh5rwOvtgE3bRkjCt58
 B5Ixc2yz5tQe2TdOjr0IpYD6Kx3+RhQ2A1MErq6dT233iV6ZSwJQyn8ZiwKiAeVfocmwgxBypYH
 w0QRHAgB6VBi+ZdCA8uTG0rhaKx77WhFN2xBaRUJ41BCs8gnSQXBPj5DfyGEwPWk6Gw8PaICb7E
 m3jIICmUsrvBpF1fcy9bwcN5XNMHdXQ1Rz1Y3atSmumLzPN5XDzqO0Z/1lbFj87/LWMGSM6MFdh
 brLmExtwJ0jHjiyVju5Gxl76yuQXlKCSah+Us/ud29kgwEK2SK2cbQ72u52P7WDy54j6zA7GkZV
 szJRvulddU6JSvo4iFVkr0kQ==
X-Google-Smtp-Source: AGHT+IFY7UcjIa0YdZIgSPVahVRS/IE+hi9DKKHSOUoFypj2RLkC1gFWvUzqpprhzIE1XretNfh8CA==
X-Received: by 2002:a5d:5f87:0:b0:42b:41dc:1b58 with SMTP id
 ffacd0b85a97d-42b4bdb8247mr1934029f8f.45.1762939603510; 
 Wed, 12 Nov 2025 01:26:43 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42abe63df69sm32884187f8f.13.2025.11.12.01.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 01:26:43 -0800 (PST)
Message-ID: <04291a87-24c9-433b-9bb6-7e70ea19459f@ursulin.net>
Date: Wed, 12 Nov 2025 09:26:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix outdated sched_job docu
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251111161502.86180-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251111161502.86180-2-phasta@kernel.org>
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


On 11/11/2025 16:15, Philipp Stanner wrote:
> There is no such thing as a "done_list" anymore. Remove mention of it.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   include/drm/gpu_scheduler.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index fb88301b3c45..18d6210ce2d0 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -320,7 +320,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>    * struct drm_sched_job - A job to be run by an entity.
>    *
>    * @queue_node: used to append this struct to the queue of jobs in an entity.
> - * @list: a job participates in a "pending" and "done" lists.
> + * @list: for enqueueing the job into the list of pending jobs.
>    * @sched: the scheduler instance on which this job is scheduled.
>    * @s_fence: contains the fences for the scheduling of job.
>    * @finish_cb: the callback for the finished fence.

Interesting that I cannot see there was a done list at the time when 
that comment was added. Anyway, I did not dig much further back since 
for the current state the correction is obviously correct.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

