Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828AB946221
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 18:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0372510E013;
	Fri,  2 Aug 2024 16:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="EmWeaQrH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD4610E013
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 16:54:35 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1fd65aaac27so25142945ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2024 09:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1722617674; x=1723222474; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mrAppcAAzagZXUnPObci2usi/RqmUcn+ruLZgDFl8+g=;
 b=EmWeaQrHQMsvj8gPY7ANeBPP+BGasp97may0wGvKOpGPTJ/DKQMVCDpCxR8svclI9E
 LtkEJ9p+Z6Q6ljcYk24XbXhdMLkp30fGxDW/aD+7qW3y0v4+RYalkrYXGoBglZxXWIKZ
 LXhXoeb3Cqkp0NZKmPDJaIAXvfvZP4uROUkh5w/TJDwQxzjCZsSstbRejvLOdI1Dqx4k
 bY0cO2U6VmCgiBLx7b68B/7oDOg0XjPgKJsoZOTDvIJPwyfsM/lnYhWBVa3rJdVzyGeB
 FDKY9jNh7aPDzCA6U3PK/YyhiSWZZWel5mGtC+3xXMDqYRCvf5ZpT3XOQZ1WZtL6BHSl
 tXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722617674; x=1723222474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mrAppcAAzagZXUnPObci2usi/RqmUcn+ruLZgDFl8+g=;
 b=Cjy8+LBie608hXEv3tzMQz/qU2pFq3A1lsh7BU7f7uYnH4fXsxaagPmHvexvgzPVV3
 0L2jzfqOqeFVZs+smZdDv/ovPAMIyGKxsuQ4BQGs0q1cHTWcn2MbqRKYNNufub4J74Ar
 odR1gTGRHeOOfzmYsN7+O6BCpCq0JaowvtcRuxy4HEcma4cvsn3w9A48k3IjxerZFECW
 zqtgtXw+U7bxpxRJFy0JmvyhTK5vuqP8avU2mR0ZiAjnDWPPGY3XEZMv278Bh++rtJSs
 iUjs9XkbDKG1B99nPoaJ0TUM4zzv2Li/tICber7fz0iqjLU1+in8Sr6EqneAUMBLxwVX
 elsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhBrpETDZWiV72qg3BDsivLwOwZuN27XP2j1jUXw3loiWQ5OiG4aGyocqUgVHxpk6hIA8QzughHf4Lvy4mIP24mkwGt/io+KYev5cMmKub
X-Gm-Message-State: AOJu0YyXyvCKf1ynV2/341ZdxbAyEDfmYRzqIq/lUcRhugILr5JunoqB
 YSaZCJXb3ekTG4aHJeFkc2tTnKgx1SspgHIrKjqcQfLo++HqszFDLXsYUsVenCc=
X-Google-Smtp-Source: AGHT+IEYt+XIwdpCJv+hJ1/4V8vHGn2ZEIPipNfIFiZFUexUC8izLQsYMLzSM2ChZaQeCXsqOEIZLw==
X-Received: by 2002:a17:902:e548:b0:1fb:8e29:621f with SMTP id
 d9443c01a7336-1ff57bc50demr60862605ad.16.1722617674449; 
 Fri, 02 Aug 2024 09:54:34 -0700 (PDT)
Received: from localhost.localdomain ([185.153.176.46])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff58f29cebsm19358205ad.35.2024.08.02.09.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 09:54:34 -0700 (PDT)
From: David Tadokoro <davidbtadokoro@usp.br>
To: jiapeng.chong@linux.alibaba.com
Cc: Rodrigo.Siqueira@amd.com, Xinhui.Pan@amd.com, abaci@linux.alibaba.com,
 airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, chaitanya.dhere@amd.com,
 christian.koenig@amd.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, jun.lei@amd.com, linux-kernel@vger.kernel.org,
 sunpeng.li@amd.com
Subject: Re: [PATCH] drm/amd/display: remove unneeded semicolon
Date: Fri,  2 Aug 2024 13:54:09 -0300
Message-ID: <20240802165409.93652-1-davidbtadokoro@usp.br>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240802025942.62734-1-jiapeng.chong@linux.alibaba.com>
References: <20240802025942.62734-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

> No functional modification involved.
> 
> ./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c:6463:166-167: Unneeded semicolon.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9633
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  .../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
> index c54c29711a65..8f3c1c0b1cc1 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
> @@ -6464,8 +6464,8 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
>  			p->SwathHeightC[k] = l->MaximumSwathHeightC[k] / 2;
>  			l->RoundedUpSwathSizeBytesY[k] = p->full_swath_bytes_l[k] / 2;
>  			l->RoundedUpSwathSizeBytesC[k] = p->full_swath_bytes_c[k] / 2;
> -			p->request_size_bytes_luma[k] = ((p->BytePerPixY[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;;
> -			p->request_size_bytes_chroma[k] = ((p->BytePerPixC[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;;
> +			p->request_size_bytes_luma[k] = ((p->BytePerPixY[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;
> +			p->request_size_bytes_chroma[k] = ((p->BytePerPixC[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;
>  		}
>  
>  		if (p->SwathHeightC[k] == 0)
> -- 
> 2.32.0.3.g01195cf9f

Reviewed-by: David Tadokoro <davidbtadokoro@usp.br>
