Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F616D5FF7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2D910E1E8;
	Tue,  4 Apr 2023 12:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7367F10E1E8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 12:14:58 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id cn12so129755978edb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 05:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680610497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+TX0vrbbGuVgPWbFCF2tws7sgSfUG0JY9P/OMV7TicM=;
 b=oIE47wApse4g0ML4MoxdfvClnIAAVVsDGv6fjkt50Hup415EsBgfZgGiU/jaKe73Fj
 WN16KxE+0uO+pTN6XRWnMyT43qlvg6EuKVVgWvO7hWkdW05M/aXUdWkbv2RzBzcs0DDX
 D6iQXsCJiYu5sl4MJ6CAFJ3ojz1DSyi91duE7Bwyefz1k9IsbwF814rjCgSx6B+Md/3j
 ZCc2mkKseXZFxAla7cxDhG2OcRQQAC6akaLsy/5263s8I/LDjbIxf2HNXFEwoPIDwP4J
 x7NZh/rl2LP5R9d5KKRuwANR56METmUjEpNp/tJNkixza/w50L/3OLXz0Zl5/BASOMmj
 O+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680610497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+TX0vrbbGuVgPWbFCF2tws7sgSfUG0JY9P/OMV7TicM=;
 b=vXwN7rhJ0ubFDyGBayCVjLoxI8qg5rvlEXQpoLV5byBl+lXyU9PnqwrN+9G+MU85Jf
 Dcjq9zDgTeEgtWl2t0uwdcA8oZdjUH7TVgZztFPjq+R1I8SHicCeNAIlEHAqdOIamUol
 4zxCBF96WQHDTmR/H/KwZ3OxP4Mu99JoN5NvcoYGU/hX1mAkmxt8RVoZsB0AuDrZfaYd
 MY+jluiQqIgMwi0G1it3b4NvMxOLW87xkdwlSqwFQzPR+s+0QTKXHQGPZ8f6q8oUBWwN
 i3TbpPAcrL/p/nBJuXKdhJ9scmkH25oFHN8Enh38PUhcazEuHQbZJBo3HhjNskMHinJB
 rYUQ==
X-Gm-Message-State: AAQBX9eOf0mZGEmtXnCni2RndNmfUWl8i4sS+kxMs97AIsX5v4t3v7y3
 xfyK3NkK4wzltKOxnMO8zGE=
X-Google-Smtp-Source: AKy350Z4QlEljHY4noZGA3p1ZbKjaeVPE9pGp+hS9ZXQE9y2r4uzogkhfU/P0ir0Pt5wKPmBOgBw7A==
X-Received: by 2002:a17:906:5847:b0:946:e68f:4032 with SMTP id
 h7-20020a170906584700b00946e68f4032mr2002801ejs.64.1680610496726; 
 Tue, 04 Apr 2023 05:14:56 -0700 (PDT)
Received: from localhost
 (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 rv27-20020a17090710db00b008d606b1bbb1sm5908611ejb.9.2023.04.04.05.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 05:14:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH 00/12] drm/tegra: Convert to platform remove callback
 returning void
Date: Tue,  4 Apr 2023 14:14:47 +0200
Message-Id: <168061024446.2054665.18194694686878067602.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
References: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
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
Cc: linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

On Wed, 22 Mar 2023 18:02:11 +0100, Uwe Kleine-König wrote:
> this series adapts the platform drivers below drivers/gpu/drm/tegra to
> use the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because
> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak.
> 
> [...]

Applied, thanks!

[01/12] gpu: host1x: Make host1x_client_unregister() return void
        commit: 1d83d1a2df0bfb6bd79400746c289e2c4edc5909
[02/12] drm/tegra: rgb: Make tegra_dc_rgb_remove() return void
        commit: bbf9c91c6efaabbd4be0b894d9b753a69a5e02b6
[03/12] drm/tegra: dc: Convert to platform remove callback returning void
        commit: 902a0ab485b6f2b37450635b82b91cd17e8aa608
[04/12] drm/tegra: dpaux: Convert to platform remove callback returning void
        commit: 1255aa402c5c8e07ef6d453474ef1bd25651b420
[05/12] drm/tegra: dsi: Convert to platform remove callback returning void
        commit: 6e470293da9d83569373f83655fdd851bd4dd1d2
[06/12] drm/tegra: gr2d: Convert to platform remove callback returning void
        commit: f7140bd214d5f55dbd2096673290c8bc2bb6121c
[07/12] drm/tegra: gr3d: Convert to platform remove callback returning void
        commit: d2c29d8095c82eae11af29f8857e854f40186f59
[08/12] drm/tegra: hdmi: Convert to platform remove callback returning void
        commit: a3365945203bc6c75f8323ce7df38f1a91600ce7
[09/12] drm/tegra: hub: Convert to platform remove callback returning void
        commit: a407ae48ac9f72f719c6598fe61d03e6b8687349
[10/12] drm/tegra: nvdec: Convert to platform remove callback returning void
        commit: 222ace4a40bf5b2beafe7e4a226fab673360d689
[11/12] drm/tegra: sor: Convert to platform remove callback returning void
        commit: b674031a7bbda964741e0fa961cca8ca6b5faae2
[12/12] drm/tegra: vic: Convert to platform remove callback returning void
        commit: ba0fe014a9ebd5e578d52b2f6521591d409b8f61

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
