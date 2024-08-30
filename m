Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FA7965CE6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 11:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C45C10E9F2;
	Fri, 30 Aug 2024 09:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZY/DQTGs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F2310E9EE
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 09:31:57 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-533488ffaebso1903782e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 02:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725010316; x=1725615116; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+CgpT6APH0hN/ofysbLtlPS9ANv4/uusy+KNHKn0Cos=;
 b=ZY/DQTGsdVGPgYV9x9xRmaBCgeK1Q4otrjg4d3D7yjkYv+xkEe4s5VoMu8R3Z1ay/F
 FEP9tO7jLWRYjjME2+hf3N+LTaPIktf1+J1CHBE8m0Yn/hXVKLdndaaMBwdZXhgFX4Xd
 iLLqpKBHNAIv5beVmH2q9uiubcTtptwCJr2ohHM3W4fNkd5+rM7D2bwMa3goY7DFl+7u
 d7m9WSZNut0hJ4rjclZNevoSSgqO1B/XxOv3I9yqReFRDekm/146EsqI4l6Z1qGcYmFb
 w+RBRDLQAzGAAywj4DNX1RS76xXJngbViFTYEFuRNp9jsdSFpPC1QGj8T+TqC4N4EhDh
 Cr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725010316; x=1725615116;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+CgpT6APH0hN/ofysbLtlPS9ANv4/uusy+KNHKn0Cos=;
 b=odV/J7L+tGkLLoldU0lYFMkNLpNXN48PSzujiZgrHrlqVcI5rzJSCrE/Vl5b9NO58h
 fAXdjOGa/VfCNUhK9sK8lJt0lj/5yNCNvSj4vlibCyrj7W9xGd92e/yzadNNHWq/WODq
 DGZuvx6tA2mdnltfMLpKIzctPJ3W/nbMeFLXyLHQHS9jWWWMR+VgaIvkzWCP57GdAOo+
 GF0j8oEftAdlZGZJn0JO1etyxQ3/HTHr1BegJ2uzz4B9dgz4ROFIHJEJq79PWzEDveat
 tDclAcTcNjfFS0GBBILT99Si3bqST5tWC8guFAip5VEvANh0OUEX2h5MSQg+AZ1wpeGf
 Xq4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWac3cPZBBSpb220SGPtzgdEQZ/rb9y2tMYmXtS20P71Tsi7jEOfrW8Ri7WFKrU4z+M3plyoxg9K0U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBDARGoUhl3CCMBPjnW6ZGWGynz9xhPra+6oPunZR9hHXAdN+W
 UC8LwC02CFzi5pVSdY62J346kTe1VwuKneIVbouNq5wiWnnijDbhBOnSD0eiFF4=
X-Google-Smtp-Source: AGHT+IHn7jhW8Fy9/pjCjl+mhkMw6ezrscYRK9gxg95hZfxlj7C/vtXMhfFrMLSxRdPvmXvhab6L6Q==
X-Received: by 2002:a05:6512:33d2:b0:52e:e3c3:643f with SMTP id
 2adb3069b0e04-53546af4288mr1110083e87.2.1725010314829; 
 Fri, 30 Aug 2024 02:31:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535407ac076sm510076e87.87.2024.08.30.02.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 02:31:54 -0700 (PDT)
Date: Fri, 30 Aug 2024 12:31:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 stable <stable@kernel.org>
Subject: Re: [PATCH v1 2/3] misc: fastrpc: Fix fastrpc_map_lookup operation
Message-ID: <qeoclfg7inqwdzbxl35wsu6z7xecbc77albmnbge3h3hfr5uph@wxl5vfjfs35u>
References: <20240822105933.2644945-1-quic_ekangupt@quicinc.com>
 <20240822105933.2644945-3-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822105933.2644945-3-quic_ekangupt@quicinc.com>
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

On Thu, Aug 22, 2024 at 04:29:32PM GMT, Ekansh Gupta wrote:
> Fastrpc driver creates maps for user allocated fd buffers. Before
> creating a new map, the map list is checked for any already existing
> maps using map fd. Checking with just map fd is not sufficient as the
> user can pass offsetted buffer with less size when the map is created
> and then a larger size the next time which could result in memory
> issues. Check for user passed VA and length also when looking up for
> the map.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index bcfb8ce1a0e3..ebe828770a8d 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -362,7 +362,8 @@ static int fastrpc_map_get(struct fastrpc_map *map)
>  
>  
>  static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
> -			    struct fastrpc_map **ppmap, bool take_ref)
> +			    u64 va, u64 len, struct fastrpc_map **ppmap,
> +				bool take_ref)

Please use consistent alignment between the lines.

>  {
>  	struct fastrpc_session_ctx *sess = fl->sctx;
>  	struct fastrpc_map *map = NULL;
> @@ -370,7 +371,8 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  
>  	spin_lock(&fl->lock);
>  	list_for_each_entry(map, &fl->maps, node) {
> -		if (map->fd != fd)
> +		if (map->fd != fd || va < (u64)map->va ||
> +			va + len > (u64)map->va + map->size)
>  			continue;
>  
>  		if (take_ref) {
> @@ -752,7 +754,8 @@ static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>  };
>  
>  static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
> -			      u64 len, u32 attr, struct fastrpc_map **ppmap)
> +				u64 va, u64 len, u32 attr,
> +				struct fastrpc_map **ppmap)
>  {
>  	struct fastrpc_session_ctx *sess = fl->sctx;
>  	struct fastrpc_map *map = NULL;
> @@ -760,7 +763,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>  	struct scatterlist *sgl = NULL;
>  	int err = 0, sgl_index = 0;
>  
> -	if (!fastrpc_map_lookup(fl, fd, ppmap, true))
> +	if (!fastrpc_map_lookup(fl, fd, va, len, ppmap, true))
>  		return 0;
>  
>  	map = kzalloc(sizeof(*map), GFP_KERNEL);
> @@ -807,7 +810,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>  		err = -EINVAL;
>  		goto map_err;
>  	}
> -	map->va = sg_virt(map->table->sgl);
> +	map->va = (void *)(uintptr_t)va;

This looks unrelated

>  	map->len = len;
>  
>  	if (attr & FASTRPC_ATTR_SECUREMAP) {
> @@ -920,7 +923,8 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
>  			continue;
>  
>  		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
> -			 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
> +				(u64)ctx->args[i].ptr, ctx->args[i].length,
> +				ctx->args[i].attr, &ctx->maps[i]);
>  		if (err) {
>  			dev_err(dev, "Error Creating map %d\n", err);
>  			return -EINVAL;
> @@ -1106,7 +1110,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>  	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
>  		if (!fdlist[i])
>  			break;
> -		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false))
> +		if (!fastrpc_map_lookup(fl, (int)fdlist[i], 0, 0, &mmap, false))

Isn't this going to always return false?

>  			fastrpc_map_put(mmap);
>  	}
>  
> @@ -1412,7 +1416,8 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  	fl->pd = USER_PD;
>  
>  	if (init.filelen && init.filefd) {
> -		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map);
> +		err = fastrpc_map_create(fl, init.filefd, init.file,
> +				init.filelen, 0, &map);
>  		if (err)
>  			goto err;
>  	}
> @@ -2034,7 +2039,8 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  		return -EFAULT;
>  
>  	/* create SMMU mapping */
> -	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map);
> +	err = fastrpc_map_create(fl, req.fd, req.vaddrin, req.length,
> +			0, &map);
>  	if (err) {
>  		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
>  		return err;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
