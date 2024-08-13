Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5C3950051
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 10:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90C310E060;
	Tue, 13 Aug 2024 08:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ai3aMaEe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BCC10E060
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 08:50:38 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-70eb0ae23e4so3834017b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 01:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723539038; x=1724143838; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Rts6zB0WN8mMRj2VryIEa8o9z99JeetoeSk17QbpEU=;
 b=Ai3aMaEebOpVO5RGQ21aj1Cuf0uLAYxmFYHAk/r2TxZs658mJnkfSIbXFe0Vr0PqMi
 FgBZQBsZIsaX5ocT7LBOB0tntSAZfdQYLupDDLwMrSZYCgARLgbHredBRCi6X5Xtudff
 4X0r2pUkdPFuTId4Rqc3+HMCcsnj6s4hR5GNCwCZCEubMkRrLrq5O5dc1zDSfyi/zAXZ
 jRHPhz8yYhmEts76951Al8X2FrmugFeX4srzTCxLlkWlBLgpcX2sJxeTZmhLNmFFJJcT
 J6xBqYP0+mRF9VHwPvCOrRkZMt6DA9Ajsu2+ln705xgMuDkXT+29lPsWt2dfLzPLmb5K
 IXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723539038; x=1724143838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Rts6zB0WN8mMRj2VryIEa8o9z99JeetoeSk17QbpEU=;
 b=QgrB/unl79UXu86lv14txEQhdB7KrGPDe7MwoJ/2lvvFrbYJgB6auFDa1Z8yuQkr/J
 X0OfcR6Pvyq80YGIv/i+qxiHXtaiqbsgmmfj3TYoJ3MpjK5mQoDt4ZIfQzpSYyn/z5SK
 Mx9oEYK3+ufQ/UwssPxqZRHb2Tip1eHQMm+5a/qEjTLRpL+vTiNmOzhP1BOtGDSrRTGd
 fNY69I16MlwBw1uKcrAj5mlUViZ4NczsC/bm+Jj5dhlaGPkZWqzrrFvtpspp2gnlHx/D
 oCoS2c9qfqxq+4lfnjpia+l0h9K2EqM/0FsKVFClZej/22LMm8Yv71T1ZWt6sDSJusAa
 c/6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXByPDfCOy0PLVYpQOoHLKwc0qDHp5lvXykWnS1+jPg9SY4LGd6oadOzEjl6GECrGaWuDYNGUMgDQ6xm2rTaw19laOHlCY2+4U39C7jalEp
X-Gm-Message-State: AOJu0YyZMbHZ7puzpY+S6J7tL4mTSxvCTfSq3o91kHLA3o/OG61vj/xU
 O91zKIeaMQ7N9YhcBgvijkequ1wX+Xl58dEY+cDVHMYg5rBZQJmLksBHH6VI
X-Google-Smtp-Source: AGHT+IEsIqbIirAGl7TPh/KDv0TOehaMxpmSPAbGOBplieWhUuKxu1EkWXJmILPBHPmyG8lIOvab5w==
X-Received: by 2002:a05:6a20:9f99:b0:1c4:214c:d885 with SMTP id
 adf61e73a8af0-1c8d7594063mr3775722637.36.1723539038153; 
 Tue, 13 Aug 2024 01:50:38 -0700 (PDT)
Received: from dev0.. ([2405:201:6803:30b3:c766:226f:440c:9eab])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201cd1a9403sm8888895ad.151.2024.08.13.01.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 01:50:37 -0700 (PDT)
From: Abhinav Jain <jain.abhinav177@gmail.com>
To: skhan@linuxfoundation.org
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 jain.abhinav177@gmail.com, javier.carrasco.cruz@gmail.com,
 julia.lawall@inria.fr, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de
Subject: Re: [PATCH v2] gpu: ipu-v3: Add cleanup attribute for prg_node for
 auto cleanup
Date: Tue, 13 Aug 2024 14:20:31 +0530
Message-Id: <20240813085031.1097134-1-jain.abhinav177@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2aabc166-bf34-49b3-b938-bbfb0f85e8bb@linuxfoundation.org>
References: <2aabc166-bf34-49b3-b938-bbfb0f85e8bb@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 13 Aug 2024 02:30:54 -0600, Shuah Khan wrote:
> On 8/12/24 13:37, Abhinav Jain wrote:
> > Hello,
> > Can this be kindly reviewed? Thanks.
>
> You removed all the relevant information for people to be able to review the
> patch :)
>
> thanks,
> -- Shuah

Sorry, here is the patch link and I am attaching inlined as well:
https://lore.kernel.org/all/20240704132142.1003887-1-jain.abhinav177@gmail.com/

> Add cleanup attribute for device node prg_node.
> Remove of_node_put for device node prg_node as it is unnecessary now.
>
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Abhinav Jain <jain.abhinav177@gmail.com>
> ---
> - PATCH v1:
> https://lore.kernel.org/all/20240702150109.1002065-1-jain.abhinav177@gmail.com/
>
> - Changes since v1:
>  Enhanced the commit description to better suit the work being done
>  as per the feedback in v1
> ---
> drivers/gpu/ipu-v3/ipu-prg.c | 7 ++-----
> 1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/ipu-v3/ipu-prg.c b/drivers/gpu/ipu-v3/ipu-prg.c
> index 729605709955..d1f46bc761ec 100644
> --- a/drivers/gpu/ipu-v3/ipu-prg.c
> +++ b/drivers/gpu/ipu-v3/ipu-prg.c
> @@ -84,8 +84,8 @@ static LIST_HEAD(ipu_prg_list);
>  struct ipu_prg *
>  ipu_prg_lookup_by_phandle(struct device *dev, const char *name, int ipu_id)
>  {
> -	struct device_node *prg_node = of_parse_phandle(dev->of_node,
> -							name, 0);
> +	struct device_node *prg_node __free(device_node) =
> +		of_parse_phandle(dev->of_node, name, 0);
> 	struct ipu_prg *prg;
> 
> 	mutex_lock(&ipu_prg_list_mutex);
> @@ -95,14 +95,11 @@ ipu_prg_lookup_by_phandle(struct device *dev, const char *name, int ipu_id)
> 			device_link_add(dev, prg->dev,
> 					DL_FLAG_AUTOREMOVE_CONSUMER);
> 			prg->id = ipu_id;
> -			of_node_put(prg_node);
> 			return prg;
> 		}
> 	}
> 	mutex_unlock(&ipu_prg_list_mutex);
> 
> -	of_node_put(prg_node);
> -
>      	return NULL;
>  }
> 
> -- 
> 2.34.1
