Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5B9A214FB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 00:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82AE10E11F;
	Tue, 28 Jan 2025 23:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kVfAworg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BE610E11F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 23:30:11 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so7021334e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 15:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738107010; x=1738711810; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GCdIOQOZjxbNyTUQojW1cV2x9p0MTk8H+1DJVjLtCTw=;
 b=kVfAworgpBC7QYSnDKkpizKM37VxVifcMHJm3AZJ1ELD6hNr3k+GmLvk/HOO+xgZEy
 rnoM5EZFu0f9ayk3FaMOMCP3b0HfAAzrpaPatNACuCdyFS80Q4cLG0cwTxm1NbW3u63J
 Ml4a1mT7daM2gIZN6TYHZXujtGPUZNM+kkDiCYo5qTOp1jolx9ZH+dnEmt+JYBRc9Rtd
 F+M9vEEq9ITzSc725hs1b/RgQTu0cUbOlUZUD4/doAbXMAI4S0vjPojiFW+NwrjhyuEU
 bmLSFMJ7gwIIFgqBl2ws/t43mFQmha4meh0cNoZZjRdorlmlHx3UB16Y8hJTD9L8HGfo
 lfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738107010; x=1738711810;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GCdIOQOZjxbNyTUQojW1cV2x9p0MTk8H+1DJVjLtCTw=;
 b=RczOaMx3TGwxnr5lGSefzmhI1K5cPdMXeMZKWajCpmweS2KN4UYu6GMCz7hT+efRuD
 MXEeHg/XEIZfcor5rczYKvEzeo+aYYNuhVPXr6Mz/39Ltr41ghcNYTMTeJoIH6/XZ0ol
 UJEiFvVibFcqWx4exXbEGbkCa168BoSZwcjCXzBKi9s12BgJVfbied2UgZJOwE/wo+OJ
 AVhXC8B97+haKdHXxiwNmN21MxcjapRI1CzqnMOnqJeE7WHoTNuOjaEk5jB3+7UcnM99
 Q3jBWpENwjmTqspzgVzyqN9MBcR13Q8cr9fJvtaOfu2bdRLdJY96yjL2qNZmRBuixa0z
 uLxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqAF4h2xElq2vMKKB/RL5MXiqn0S35n3JIvCh9xS5nLXi+liTYbcG9AkfesMJBTLpXqf6hyFNdws8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4yJ5Mk7rT11g/oBl//FDxOs5dZf94vIKFtrK2p2xCD0HMEkxt
 9SgHU5CxD2aE2yCcKdoosIQp/yzuMnaRusE06QiUO1kn7rWHTGcjd+zYBWKVhPw=
X-Gm-Gg: ASbGnctnvgkkCVcxkieBibhDMlf5rmDOygbEBt0eqpPfdZlJcl18DqklVxGIik8aCwr
 qu/d8xoVLm9eiBXjeakeHABkr5pBLrJ0IDDXQmP1HS/KVG+iLNAonWMxZhn/Xsdk42jnoIpxKp2
 u3++5Je8UGVXWdEtJgqa+wN5nfHqpiHkZhcU9EPwKq7B7DUtAMkYVPDKQ0GcEHa4XqKAd05IVg3
 FnvTKkIP2QaVKbnR5hZ9vXrKLBrmOsppiCzXDjbTMcXpwWWXSBfftst+vgD+Llo+3wDcGsQNqh3
 dIoQ8DC/u1WEx9k8xcwbOzxPXz4uwcqkBIdFrD66QTeEE68i+o4AsQqI2MsD5btSN2sKFtyJvQm
 1SqUiTw==
X-Google-Smtp-Source: AGHT+IGsSzj2umsJFSiELH3hVwrmeoAzv74V1NRoAI/wxFSqdhTlVAp4+UKDIsFLwBpcMgZCU9U/bw==
X-Received: by 2002:ac2:4108:0:b0:53e:395c:688e with SMTP id
 2adb3069b0e04-543e4bd639fmr184709e87.10.1738107010100; 
 Tue, 28 Jan 2025 15:30:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8368425sm1779115e87.121.2025.01.28.15.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 15:30:08 -0800 (PST)
Date: Wed, 29 Jan 2025 01:30:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 5/5] misc: fastrpc: Modify context id mask to support
 polling mode
Message-ID: <im7gi5ib7wnihu3ff4a2erqctne2pm2zf3wl4qmuejz4dfhf7e@z5au6vnm5por>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-6-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127044239.578540-6-quic_ekangupt@quicinc.com>
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

On Mon, Jan 27, 2025 at 10:12:39AM +0530, Ekansh Gupta wrote:
> DSP needs last 4 bits of context id to be 0 for polling mode to be
> supported as setting of last 8 is intended for async mode(not yet
> supported on upstream driver) and setting these bits restrics
> writing to poll memory from DSP. Modify context id mask to ensure
> polling mode is supported.

Shouldn't this commit come before the previous one?

> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 257a741af115..ef56c793c564 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -40,7 +40,7 @@
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>  #define FASTRPC_MAX_STATIC_HANDLE (20)
> -#define FASTRPC_CTXID_MASK (0xFF0)
> +#define FASTRPC_CTXID_MASK (0xFF0000)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
> @@ -524,7 +524,7 @@ static void fastrpc_context_free(struct kref *ref)
>  		fastrpc_buf_free(ctx->buf);
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
> -	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
> +	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 16);
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  
>  	kfree(ctx->maps);
> @@ -664,7 +664,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  		spin_unlock_irqrestore(&cctx->lock, flags);
>  		goto err_idr;
>  	}
> -	ctx->ctxid = ret << 4;
> +	ctx->ctxid = ret << 16;
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  
>  	kref_init(&ctx->refcount);
> @@ -2675,7 +2675,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  	if (len < sizeof(*rsp))
>  		return -EINVAL;
>  
> -	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
> +	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 16);
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
