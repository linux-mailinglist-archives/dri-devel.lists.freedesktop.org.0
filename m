Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EE1B18B15
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 09:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E662110E0F5;
	Sat,  2 Aug 2025 07:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wnROhmYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF42C10E00C
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 07:35:39 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3b79bd3b1f7so1331080f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 00:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754120138; x=1754724938; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/Rq8yrsaANYeJXcIdVpkfDYBEqWUqNEPhGfDYm3Rks=;
 b=wnROhmYavZd36wwSzzmU2o+7mSDpdlpdWR1ATK41CZBTJUt5GgSXZ5bvuCubMcVKTY
 GkpMSlkd4mwX22Jp9dpMzG/bxsQQOgfvVgRk00my4jGJJyEE//UkxBT4gBkchHb682+l
 Gcng22oFK6ruD0l8/4hRN5DUqdUUdilgOYI3p8QL5NrMrsczHFNPS0iBZTGwsgjAI0uP
 NQpRQH4xiqABOwlbA1Fgv81yevs9JWykfA5ETLBucfUS4RfvUvR2BR8O+J+LqpOLhaam
 3ncIEwY/qRNluEdvnwFCfJnAnzrnNbKTpAdS6w4H7K0sQVthcN0fmEtM9T+cbj/8gV/0
 hVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754120138; x=1754724938;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y/Rq8yrsaANYeJXcIdVpkfDYBEqWUqNEPhGfDYm3Rks=;
 b=SmfKXUVaxDQft0zSeOrmozIv7I2n28umBb3EbAlAcTNKBuiSbxvr+S41ckRK/GxmXw
 EJnfbtDCrTAp3D1qHzGuRfdPEkO1kW5vee41CBcENKf48W473WofTL3zt+YbkIJR3hIV
 Ew1YF9XXk67cK/Z7jckuz90aW7JRlPLFuNEkNrne8GRiJUD5s3sTIAdGiv691x4G/4G2
 FEJQZKqE0glJBOZ35p+q96aysdA5rEUZF9gH48P3sCA3z1pRMA0MZjjSlKjZTFzz/5RE
 RibL7ZFbp+20vQWyEFUYPesAJ9AWvHqw1RDwySCT9RGD3ruDtIoQuEgCCf/3YYp7AjJO
 TNjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSPGu6X+BjbTWVwZr9DTA7i+S+Lhw66AV3aUeuSdvUMdBRrpdDPLcXSVSM7eGga49QBS+QLMRB0v8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVZgj1aK1svS872IdJI/YKgsASEDZ7VZCOPfyOq6ZNxqmDTgWG
 S1Uk7HFdhVWSfvCTZgdZe8tTj+ndhrlagJNS8T5ckZuTcaRCL6gY41Ron31V5ZmtCqg=
X-Gm-Gg: ASbGncvwDh2PzFOECdoh6KXij/xbbthgXnWn4elOmWCVjHN8LWMo/wzah5WyqTd4z9E
 LMTktIJj+7I2g8luqUcd/kZlcDLOD8wOk6zpUUsf7SEn7nJh8kFlMFn263M7sLq6drJ+qameRzb
 7J7yHAhs6NPMaZug48+VXyX1v4DvAZ3YAdj9zeWJqMx/k4TnWNGOSR19yChnDlEByu4BQuBvRcy
 6yVI2P7q6GytFHESg5mRSEVD7I/110doVlnyk5yv7L2PX/jQD4AS3coXpP0eXojljuVbtzJkT5h
 CQxk4iwUQaWY9MkJzVDY4lqhwg3Pkr6gsOYV4G5KBZoMVUsevvKC5WqCnUwsoqTiH8ptUtg3C4o
 fa2tBR5zx2PP5uJFKsBdR2Ih/n11qXNXftiXVKA==
X-Google-Smtp-Source: AGHT+IGzFox4oyjb5/WhDqdQVJopYxoMkjFPEJSXG+cagflCj14ks0y04aMJJDzRXsWdRJFhVzyzQg==
X-Received: by 2002:a05:6000:4011:b0:3b8:d32c:7740 with SMTP id
 ffacd0b85a97d-3b8d94c1372mr1661279f8f.43.1754120137907; 
 Sat, 02 Aug 2025 00:35:37 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453c80sm8299041f8f.43.2025.08.02.00.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 00:35:37 -0700 (PDT)
Date: Sat, 2 Aug 2025 10:35:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/nouveau/gsp: remove always true if check
Message-ID: <6a0dd96d-e98a-488e-87d1-a3e6cbce7b53@suswa.mountain>
References: <20250801-nouveau-fifo-v1-1-25b9db5283bc@ethancedwards.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-nouveau-fifo-v1-1-25b9db5283bc@ethancedwards.com>
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

On Fri, Aug 01, 2025 at 09:49:26PM -0400, Ethan Carter Edwards wrote:
> if (1) always evaluates to true. Remove the unneeded check.
> 
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c | 36 ++++++++++------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
> index 1ac5628c5140e66d306a1aadce10c810886afad3..104c72ec359a07a318ac99f5c217f0b07db2b784 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
> @@ -188,32 +188,28 @@ r535_chan_ramfc_write(struct nvkm_chan *chan, u64 offset, u64 length, u32 devm,
>  	if (ret)
>  		return ret;
>  
> -	if (1) {
> -		NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS *ctrl;
> +	NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS *ctrl;
>  
> -		if (1) {
> -			NVA06F_CTRL_BIND_PARAMS *ctrl;
> +	NVA06F_CTRL_BIND_PARAMS *ctrl;
>  

I really don't like this business of declaring variables randomly
throughout the code, unless it's required for __cleanup magic.  Anyway,
here it breaks the build.

regards,
dan carpenter


