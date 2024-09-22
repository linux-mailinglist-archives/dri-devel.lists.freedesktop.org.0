Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116EE97E219
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 16:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B15310E20A;
	Sun, 22 Sep 2024 14:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lRjA10hW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7E410E20A
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 14:57:30 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5356bb5522bso4203936e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 07:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727017048; x=1727621848; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oorshgSIxNOMtGwAxFpP3QV/yD84Jf34ePNQbY8LIQI=;
 b=lRjA10hWasRpjTO0K6YSFRwK8G5/W7f9Jui6Tw/AeNeA+gCPLsimnN5pbiaybxgDbo
 OqUZ/cusFHvLME8wPGVdtFkr1v3LMf0pJyzdnhJ8QgOGefMO8ze8SrMMG0nyD9xcEpN5
 zLHI0XlH776LnlqD8uYgRRNIIA4IP6lnwVUW0RNtcaNppSwbtYRTV7u5+G2ayIYQM62x
 AmKqvb/gpf0YQAqu8NCHfCJgn9HIAIn7TqpVrOz0e41Q6i3nJfz7jlvATzlI8yi2Bw+E
 grrajb163QuPebQ0whgJ59IMAG+Onu+X+7v3ErLnsiPg5skL95CQdIJ0BfCWEtx2OxIL
 J0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727017048; x=1727621848;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oorshgSIxNOMtGwAxFpP3QV/yD84Jf34ePNQbY8LIQI=;
 b=ppWOHnqmQFxIADwTKLwAlEjITivigf7JPWD7aDpWmhR3NrO+bhhjWXKfbBrz8ynEXS
 YoyIxa0HFveMcf1Y/YAuemVCsPJx7LIPGHlj9c68IERKbT625bbcLKjqvMr0CQLN4G6n
 iM4R4UJproiF/nud3k2YWRiHWcB23YeFoQulxt1gAftSo+Wmltn0ziZgydd1gf0DFHBS
 wmf8Upwsb95q8MY9sWlomwUXikKvwD7zl46MRA8DXj2Uzi3Lkkn2XBbuCE99b8O6n868
 mRP6oH7bx6b4ydwFvb66sTJ5464Z3WKXyWYOYQacMqwxf4KQ6xE4Gyf4dtIiYJjihugU
 Cdvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUULGQaV9YkIh9HpqWNPuwNJZmPJn/AA1Dy3sjSrSWQyrO3JvAuJSVoTdtsgJWG81Q1mv6d7GVyT/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxACOr1ew9/xxegyXFHkke0aKPu2xEtb8XYH+Pnm60iy7Mj+5V1
 1fG8T1jyq67hADX51JpYcOIb4zKCkC8rriS8nv4FPel5fHSdsh7tzhABwHmMyLU=
X-Google-Smtp-Source: AGHT+IHsCDkoXpZdO4nCEC5FlDxPCNzx3mqCFyBYmPrXRtypXfu24xal13/6g3tZPUjxfmuWh0dBuA==
X-Received: by 2002:a05:6512:ea1:b0:536:54d6:e6e3 with SMTP id
 2adb3069b0e04-536ac34679dmr3396805e87.61.1727017048436; 
 Sun, 22 Sep 2024 07:57:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870a8680sm2940240e87.219.2024.09.22.07.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 07:57:26 -0700 (PDT)
Date: Sun, 22 Sep 2024 17:57:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>, 
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/6] drm/sysfs: Drop unused drm_class_device_(un)register
Message-ID: <uoxtcgjgk2am7pqror2j4sewuf3np3rdvxjn2erprygki66ezu@6prcnv5fq6dc>
References: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
 <82ec225b-8991-4111-9492-ad1a62ac2b0e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82ec225b-8991-4111-9492-ad1a62ac2b0e@gmail.com>
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

On Sun, Sep 08, 2024 at 02:09:39PM GMT, Heiner Kallweit wrote:
> These two functions have no user, so remove them.

If there is going to be next iteration please document that the only
user was TTM code which dropped sysfs interfaces in the commit
ed89fff97382 ("drm/ttm: drop sysfs directory")

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/gpu/drm/drm_sysfs.c | 32 --------------------------------
>  include/drm/drm_sysfs.h     |  3 ---
>  2 files changed, 35 deletions(-)
> 
-- 
With best wishes
Dmitry
