Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9D09C2B00
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 08:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E884010E33C;
	Sat,  9 Nov 2024 07:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kXLg46EX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5225510E23B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 07:27:42 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53c779ef19cso3640261e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 23:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731137260; x=1731742060; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B9fI080awPbonlrkWrLsFoWwGLZIeSfif4j0EfQsirw=;
 b=kXLg46EXoZXskpX0i/kZpLMDeXTZwBWu4TvPERyASEUV3UEItFyhVzsakwTCYQey1a
 HNGhMjJuw9/4zAZgfg/Foo4puDjZCXwFNpaPWhad0E6jqMewlmRxVWp8/4vFvMewy+rc
 HJJo0zHwS19xc+KDnS0pDxhOJkXSe031b+x7Ucb/vdukfdbLmnX6MjWLFhuMf8/HgGYK
 XpUhSRzmNibXYMtKXxUYW+jiyklKpqr+62TUdIWX9hWMLZQt+DD+ygi6lfGbOi6tOcrO
 ymuKLDE97d+kF37JJ8ybimPAOf9fGHlg26qLkRVnf4r3IhiGqSVJnK+4rQXZQe1IbTWm
 ASHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731137260; x=1731742060;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B9fI080awPbonlrkWrLsFoWwGLZIeSfif4j0EfQsirw=;
 b=TsvGHS5Jx/hRBWDLkeevAyYE0ZpncTnQcVE7fDgMsl3rZsmUPNCRuZkRZFj9+OvAqG
 8Jn9fSqHH1vTAwQXBBNFDPdCWldLPzF5PLV/ZQZjd2lUhGFLFoCXDKyQlP3ves3xFYKP
 u3OLiVYmQILOFeL4frzhxPJpZjv6nCJtUzJJnLXPcHeoNrKl29u6hfA+OfKO/O4cbwWe
 PXBIdEV/q1HO8D4zz4XG2cYlAaXlrv4YtChwMOZpqYrh1G9J3cNtKgLa7ldTpGs5+4FC
 QZ2VoEB9lkdNpkRedKOh1dk9GCoE3dwzp43EoopsbyNEuc8K9FoWcVEz0qvM4qFaIiID
 J39Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqESr87OFeVyWjG4mKURQ+eq5Ln7EMTMTVR9l/xqDh+4/j68PkQdvZnFcuUioy/KENhfsJbZ/IqlU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwG521HwJcHg0FZooLSmRP9AMeLbQNLZMdjzhrIjhDfVW+SxfEa
 AoMa7gBySG+VWsIFDaFv3c+oGsxylsOHUTKjYje5L+vHjrkeGSaQcoUiaLyv9rE=
X-Google-Smtp-Source: AGHT+IFyOhoQ+rfgLRCoNb7gQKLETRW95YFlZMv2VhExQEiHrCZG8nl7kXlwjl3ffuIpfwgnFGpLoQ==
X-Received: by 2002:a05:6512:b93:b0:539:f689:3c30 with SMTP id
 2adb3069b0e04-53d86289e48mr3033987e87.20.1731137260094; 
 Fri, 08 Nov 2024 23:27:40 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826787c7sm859897e87.6.2024.11.08.23.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 23:27:38 -0800 (PST)
Date: Sat, 9 Nov 2024 09:27:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Karan Sanghavi <karansanghvi98@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] drm:sprd: Correct left shift operator evaluating
 constant expression
Message-ID: <exeho44dd45ujgha6jmnvt2idbq4twfm3d7lxmhbfgfeujyhmn@tohr2hoytwhl>
References: <20241108-coverity1511468wrongoperator-v2-1-72bc73d8691f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-coverity1511468wrongoperator-v2-1-72bc73d8691f@gmail.com>
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

On Fri, Nov 08, 2024 at 05:11:25PM +0000, Karan Sanghavi wrote:
> The left shift operation followed by a mask with 0xf will
> always result in 0. To correctly evaluate the expression for
> the bitwise OR operation, use a right shift instead.
> 
> Reported by Coverity Scan CID: 1511468
> 
> Fixes: 1c66496b1391 ("drm/sprd: add Unisoc's drm mipi dsi&dphy driver")
> 
> Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>

Please drop the empty line between tags.

Also see Documentation/process/stable-kernel-rules.rst

> ---
> Coverity Scan Message:
> CID 1511468: (#1 of 1): Wrong operator used (CONSTANT_EXPRESSION_RESULT)
> operator_confusion: (pll->kint << 4) & 15 is always 0 regardless of the 
> values of its operands. This occurs as the bitwise second operand of "|"

Is there any kind of a public link for the report? Should there be a Closes: tag?

> ---
> Changes in v2:
> - Added the fixes tag
> - Link to v1: https://lore.kernel.org/r/20241105-coverity1511468wrongoperator-v1-1-06c7513c3efc@gmail.com
> ---
>  drivers/gpu/drm/sprd/megacores_pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sprd/megacores_pll.c b/drivers/gpu/drm/sprd/megacores_pll.c
> index 3091dfdc11e3..43c10a5fc441 100644
> --- a/drivers/gpu/drm/sprd/megacores_pll.c
> +++ b/drivers/gpu/drm/sprd/megacores_pll.c
> @@ -94,7 +94,7 @@ static void dphy_set_pll_reg(struct dphy_pll *pll, struct regmap *regmap)
>  	reg_val[3] = pll->vco_band | (pll->sdm_en << 1) | (pll->refin << 2);
>  	reg_val[4] = pll->kint >> 12;
>  	reg_val[5] = pll->kint >> 4;
> -	reg_val[6] = pll->out_sel | ((pll->kint << 4) & 0xf);
> +	reg_val[6] = pll->out_sel | ((pll->kint >> 4) & 0xf);
>  	reg_val[7] = 1 << 4;
>  	reg_val[8] = pll->det_delay;
>  
> 
> ---
> base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
> change-id: 20241105-coverity1511468wrongoperator-20130bcd4240
> 
> Best regards,
> -- 
> Karan Sanghavi <karansanghvi98@gmail.com>
> 

-- 
With best wishes
Dmitry
