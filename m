Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E51965CFE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 11:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5064310E9CF;
	Fri, 30 Aug 2024 09:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="N15azCqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A0F10E9CF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 09:33:54 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5334879ba28so2179952e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 02:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725010433; x=1725615233; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uBi99OhODTsy2YN6E/2v+2p0d/VBJVM6cM05LOFNmCY=;
 b=N15azCqYacVskhByYZf4MVD9KbURk8XMhfoD8p+6NAp5p3KotrylaNWFxyk6Xg+JO+
 DU90OXRlKrA8hPJz5wHpEb7lvSfweo+v+95azsljZRRBzqf+40yYU4IE//xGmLDLHnEJ
 vwbxhLD5M1CdoWhxRwbmpFlAEjx7B+tjX4s3f8IpxZtW1nq7ekoHh7pKLoB7sNz7HmB9
 PG6wM9SsjMuorHpI8Z3p4Uf3hXrzfi1fNkei65S5ubBZ7oFrUBuZDQTzsieW4ngJYL0U
 dzv26mEwz1Ve+kYuAe3wujqrANWAuH7Wze30uOSWAMTTJyHmgZfMKAbauc9YbJ0nitA9
 QHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725010433; x=1725615233;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uBi99OhODTsy2YN6E/2v+2p0d/VBJVM6cM05LOFNmCY=;
 b=DJoJPmRZM1h3+F69Qq5Lru4KIFzUDsMAR35wEMY7ruiR6lOpveRQj35JHyUchyQ82X
 vktoPEoMv0qLRbgscTUeB0TawhtRAtYkAwD8U/0IRcgZRfudeEP45tvxx9oypmVedYz4
 PslKe7gUEhFoB83j7skJ9gEpaY3UfJo76AhYp9MzkL9dIZrBRVqvZJhBhC/hu48rbjVg
 oJ+tKRpkc+bi9EWWnkoTO2Gu3M2Cvid+BZ4d4xU+h4EmOJ7iYYwM7VaKCP/yBMhiecby
 v8vYsTlms/lOUBBwKAV2MiNf/34khAUXjXphxvLTC38n3NrsoVoiMa00DpHnQ8yK5yU+
 dWmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl492jXRsAmqRsd0GnmZ8TFXxQZq2F+CH8lS3eIdfcIJnRVGgG7B93IwLihB2jZ7YnB8xHR5EDWQA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyr3jt2AJOSi5n7Rs/8KlLKHvu4S0+w01RV2/kzRAPPX4EeGLTt
 J4xIOVZ2nk1pC2Fief7rU3GaDu3sfcrySfrdrY1yKdo3M2W0ChxSkkJ0Vz/bGBQ=
X-Google-Smtp-Source: AGHT+IGHbbYDZwkl7ZaorUFMYTjjoiX5UwxQALXcLi2GUsuuwZ69P46OC0UsVz+iINGN//licHQ0Kg==
X-Received: by 2002:a05:6512:3d8e:b0:52c:ebd0:609 with SMTP id
 2adb3069b0e04-53546afa09dmr1172184e87.7.1725010432349; 
 Fri, 30 Aug 2024 02:33:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354084e00asm511398e87.271.2024.08.30.02.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 02:33:51 -0700 (PDT)
Date: Fri, 30 Aug 2024 12:33:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 stable <stable@kernel.org>
Subject: Re: [PATCH v1 3/3] misc: fastrpc: Skip reference for DMA handles
Message-ID: <7q7rar7ssvzlkol46e5e4yecgt6n4b4oqueam4ywlxjeasx2dl@oydthy337t6i>
References: <20240822105933.2644945-1-quic_ekangupt@quicinc.com>
 <20240822105933.2644945-4-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822105933.2644945-4-quic_ekangupt@quicinc.com>
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

On Thu, Aug 22, 2024 at 04:29:33PM GMT, Ekansh Gupta wrote:
> If multiple dma handles are passed with same fd over a remote call
> the kernel driver takes a reference and expects that put for the
> map will be called as many times to free the map.

> But DSP only
> updates the fd one time in the fd list when the DSP refcount
> goes to zero

I'm sorry, I couldn't understand this phrase. Could you plese clarify
what do you mean here?

> and hence kernel make put call only once for the
> fd. This can cause SMMU fault issue as the same fd can be used
> in future for some other call.
> 
> Fixes: 35a82b87135d ("misc: fastrpc: Add dma handle implementation")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ebe828770a8d..ad56e918e1f8 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -755,7 +755,7 @@ static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>  
>  static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>  				u64 va, u64 len, u32 attr,
> -				struct fastrpc_map **ppmap)
> +				struct fastrpc_map **ppmap, bool take_ref)
>  {
>  	struct fastrpc_session_ctx *sess = fl->sctx;
>  	struct fastrpc_map *map = NULL;
> @@ -763,7 +763,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>  	struct scatterlist *sgl = NULL;
>  	int err = 0, sgl_index = 0;
>  
> -	if (!fastrpc_map_lookup(fl, fd, va, len, ppmap, true))
> +	if (!fastrpc_map_lookup(fl, fd, va, len, ppmap, take_ref))
>  		return 0;
>  
>  	map = kzalloc(sizeof(*map), GFP_KERNEL);
> @@ -917,14 +917,17 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
>  	int i, err;
>  
>  	for (i = 0; i < ctx->nscalars; ++i) {
> +		bool take_ref = true;
>  
>  		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1 ||
>  		    ctx->args[i].length == 0)
>  			continue;
>  
> +		if (i >= ctx->nbufs)
> +			take_ref = false;

Please clarify too.

>  		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
>  				(u64)ctx->args[i].ptr, ctx->args[i].length,
> -				ctx->args[i].attr, &ctx->maps[i]);
> +				ctx->args[i].attr, &ctx->maps[i], take_ref);
>  		if (err) {
>  			dev_err(dev, "Error Creating map %d\n", err);
>  			return -EINVAL;
> @@ -1417,7 +1420,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  
>  	if (init.filelen && init.filefd) {
>  		err = fastrpc_map_create(fl, init.filefd, init.file,
> -				init.filelen, 0, &map);
> +				init.filelen, 0, &map, true);
>  		if (err)
>  			goto err;
>  	}
> @@ -2040,7 +2043,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  
>  	/* create SMMU mapping */
>  	err = fastrpc_map_create(fl, req.fd, req.vaddrin, req.length,
> -			0, &map);
> +			0, &map, true);
>  	if (err) {
>  		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
>  		return err;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
