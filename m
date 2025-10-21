Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D282BF81A2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 20:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536C889E1D;
	Tue, 21 Oct 2025 18:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="wR+U3AmI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BCC89E1D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 18:36:47 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-471193a9d9eso53789425e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 11:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761071806; x=1761676606;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u/31NMDpjYxX79hD0m9CWPcEz0sXm9H/7kszN6l94dI=;
 b=wR+U3AmIrXcNQvovhkRMlRajRRunpQUO3UgHNbGWJDWQc1Q3NkbIzt6BNKOF7V7/Q+
 NwSaGLZkKy4Cmsg1uho5FtPhHf94Z3tsxP6Mw8k5bxWBz/C0IBIkkbhxTVafXdp2n1hZ
 EJx0rbWvOphCWDNKaP7EYVhkg/n+oQsB/oX4gfXEfQ9AH8ippI0oDjCeVnN1rydqLieG
 csQNdibRozMFs4TYf/BixkIP7Av16F5tHdHFF1dnWAT1pzmjlKGqsnbVSm8f09gFSPVX
 jlB5fiZnKUpH7yNwYQT64+59fIW6iSuSQRF4YtJ/8v0lpNEgQAhyZQoCUADyAwj6vk5X
 Reeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761071806; x=1761676606;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u/31NMDpjYxX79hD0m9CWPcEz0sXm9H/7kszN6l94dI=;
 b=wiT8mbgFDM/qBXtwC9nBSlbD1IrNzxQzkbnKayWW81w5ZSGmG5iELHOHCkXrWbGEV2
 0rcHGpFOnl5ilqKvXalMunJ3sxaPrAY/1zOOr1mRjFUKsyJTPOrquW1YrOcLAv3+X5r/
 bVrVkhwbtbh7b0cUoG6oAEjpJ9XyNscJiLeL5hb6p2jSc8hmysHB7HGHerFThxDQgqyN
 E469n7sFYnVM9E4VUBcxVF8CB/kLS+dTQ+COgZjtJRfpIzDtjYhAOiUvqPqafVY3Q4r+
 BtQh6T2v3QKL+MPBDSqjh7TEs5aUl5XqgTBwBxGqva4vb0SUk/XwWLSCimrCpXVXV5fE
 podA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4t8utzt4shb3m9n7sqPzCYPyxbWYk1TqB0UCC4yKb06HPF9yoCL6GFW3CnzX89S24zSDkoMN6ceo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySF832OgqKnfAUzB1o0lHRVWgBLV40x0TzxtCKWsQpDeySG8dE
 KE971RrVzTgTsxkFVW0+wX056JmsdRzBed7M99XVyW4S6wDMow8akyW79zOVnHhnou0=
X-Gm-Gg: ASbGncutSWsu3qNtkeG/HJHDFu/QSiECznWGetBlKrvQaKDXqPpyNHPrKWQekkERZ67
 x3qfwmemn6zrDELFQonmKeSnvdbOGTcq/a2g3yO0CJdG0EZNPEoOCgxB+Jsek+ceVCfUyFDLx9m
 NIow3SszVzWScREPO1+WIHrx+816CVOs9CCKmA22WLeKEP3OgY2jiIHBL5aNn75f3j6lMvBp8d9
 3yHZvji9XnTUaHSL3rw4dDZ7zqPEGw1pEcGiPDe/jl7GAcnpKIiiBkkOyGqCOrrCfSCp9io0Epz
 M7zBhiq/Uau25D5uUuokoavkEJ4Ubj5Bdl/HdhvQvTKxUoNw/Jiclk9qCkgfHne6guPF1wdqxPh
 HU/g0S96xXhbWGTSwpIC08BVu2Gv6Q+tvsBkBQa3X4wEywebb0Jk9gw7FNG0kldz9moX+TdCpAm
 oeRDvzzNsjovCL1YI=
X-Google-Smtp-Source: AGHT+IHuD5mgeD886pEcOy41CAh/C4EmnxTay38r/3oLMR6ZOooN7HM0ZxHB9uqLJmXa6KYTzdPWRw==
X-Received: by 2002:a05:600c:811b:b0:471:13fa:1b84 with SMTP id
 5b1f17b1804b1-4711787c803mr131576495e9.12.1761071805713; 
 Tue, 21 Oct 2025 11:36:45 -0700 (PDT)
Received: from [192.168.0.101] ([90.242.12.242])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c427ed3fsm6714205e9.1.2025.10.21.11.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 11:36:45 -0700 (PDT)
Message-ID: <d9c16e9e-8321-41fe-9112-e754445d8bb0@ursulin.net>
Date: Tue, 21 Oct 2025 19:36:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Fix safe access wrapper to call timeline name
 method
To: Akash Goel <akash.goel@arm.com>, sumit.semwal@linaro.org,
 gustavo@padovan.org, christian.koenig@amd.com
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, nd@arm.com,
 stable@vger.kernel.org
References: <20251021160951.1415603-1-akash.goel@arm.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251021160951.1415603-1-akash.goel@arm.com>
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


On 21/10/2025 17:09, Akash Goel wrote:
> This commit fixes the wrapper function dma_fence_timeline_name(), that
> was added for safe access, to actually call the timeline name method of
> dma_fence_ops.
> 
> Cc: <stable@vger.kernel.org> # v6.17+
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Fixes: 506aa8b02a8d ("dma-fence: Add safe access helpers and document 
the rules")

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Apologies for the copy and paste snafu.

Regards,

Tvrtko

> ---
>   drivers/dma-buf/dma-fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 3f78c56b58dc..39e6f93dc310 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -1141,7 +1141,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>   			 "RCU protection is required for safe access to returned string");
>   
>   	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> -		return fence->ops->get_driver_name(fence);
> +		return fence->ops->get_timeline_name(fence);
>   	else
>   		return "signaled-timeline";
>   }

