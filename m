Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEA1986C3F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 08:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111BB10EA90;
	Thu, 26 Sep 2024 06:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z50eOPRj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D27E10EA95
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 06:06:02 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53567b4c3f4so626020e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 23:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727330761; x=1727935561; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dv3MfhlzekToYiiGQvI+mFiz5vJ2MaGQXv1NU3UKSRY=;
 b=z50eOPRjx6hAwDU9fcYw6z5DYMYVcJOJkGtefuA9OXgdcwwDI9ePQDvT52n/+NEQ3d
 eS5WzpZGhem1sN+Yy3qA8zKBaxT+M0GuPTCoy89g1kg5hl1wbPzd6ieTZTwuhSNaNT8s
 G+lMw9LTkQNXKA29ddIHdrC5bb1vjO3lW9joYmFCrvaTfm4nqklAn8uwAG0z+mn+gUyQ
 7RiMrh8GuAOIqG/ANN5e7imAwHX/baOP2CaK+xzYuADtO+xbaEjaAqRyVWhryE8/m9Gc
 Yo+HkI9Iw1J4YdkG9WMtY2LGAxnyutZT/lR/+k0Y/ZJ3bElnRYZW1MPuMOS+YPYjBBeQ
 BxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727330761; x=1727935561;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dv3MfhlzekToYiiGQvI+mFiz5vJ2MaGQXv1NU3UKSRY=;
 b=WYXQBu0MzAZUikVsTjxw7lF5GLNqsEBnuJAityviQVL5caz6c1AOabQkQ3vrK9I5wf
 wRxfsTcXr45CiZJ9OybEWcACOkSArRfGdecCDlbfcsGZDsr8p4AKVpOsgDhhG5xSOMPH
 f8IqbN4U6KfPv/xWEKAagl0L/i8ay6z/k+fByPmewKgPuPxHLJj7ssen//55eZkJt2pr
 LLFzrCx0+SKujDbK2TTqrmRDUIRwVFmymb0W5oHguAgXTgRebhfXkx4pL8cQtPafKXiO
 wI6VAi+IvSZI9O1FygrCoCqrI5Ah4AcaYdYr4E4B13jDVYy5xYy9VfAli5T4Zv6Z4Ops
 Hq3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2tCJLhntd3SU7glshT4h2B6h+nMuYs1GVw55IMOYuEI6zu9rLMhwytB0lL5yt4ll+LMIosTVqQlE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNPS8tKnAX5ckUFrVPI85sl4yZQeE00XdDY9XsnXTqdciC574w
 JYbVlw4YEFNuqEgilHOvmkj3kCUz/dY+bYNAUQ1IU3oLst40t6TrQpmbvK8SiQk=
X-Google-Smtp-Source: AGHT+IECc/KpvpaVQ+jOo1BF+Y3mHrWstzLO1HtustfrT7Cxj/8Uuoh9wKeKKpiS7XYHYKzTVV+puw==
X-Received: by 2002:a05:6512:1094:b0:536:53c2:817d with SMTP id
 2adb3069b0e04-5387c1be662mr3339826e87.45.1727330760584; 
 Wed, 25 Sep 2024 23:06:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a86407acsm714862e87.130.2024.09.25.23.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 23:05:59 -0700 (PDT)
Date: Thu, 26 Sep 2024 09:05:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Schiffer <matthias.schiffer@tq-group.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: fsl-dcu: enable PIXCLK on LS1021A
Message-ID: <tosilxaxfg6hejtqs2fslf6ez5pdg5yxj776pohmodja3bn5jp@4jbdprx52fqx>
References: <20240926055552.1632448-1-alexander.stein@ew.tq-group.com>
 <20240926055552.1632448-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926055552.1632448-2-alexander.stein@ew.tq-group.com>
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

On Thu, Sep 26, 2024 at 07:55:51AM GMT, Alexander Stein wrote:
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> 
> The PIXCLK needs to be enabled in SCFG before accessing certain DCU
> registers, or the access will hang. For simplicity, the PIXCLK is enabled
> unconditionally, resulting in increased power consumption.

By this description it looks like a fix. What is the first broken
commit? It needs to be mentioned in the Fixes: tag. Or is it hat
existing devices have been enabling SCFG in some other way?

> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Add note about power consumption in commit message
> * Add note about power consumption in comment
> * Fix alignment
> 

-- 
With best wishes
Dmitry
