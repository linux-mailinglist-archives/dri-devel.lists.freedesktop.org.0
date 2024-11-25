Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF689D81F5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B3F10E3A6;
	Mon, 25 Nov 2024 09:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Njuiiomy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01B410E3A6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:14:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 99AD4A41392;
 Mon, 25 Nov 2024 09:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC643C4CECE;
 Mon, 25 Nov 2024 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732526042;
 bh=1XQUPazAG20tbs4O/Rn/xERWfHbxiKgQ/YgDItpVwZA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=NjuiiomyOxo9MIeolvgNU5/PdZ8uJVY3aZYnHAiMjOY/fWRhiffon/RO4gq9Xt/eh
 o/9UwTIymkTPJKSxnPeIqr/+Pqxtgw2rxUE1VyYMbAzCXL/0f2wRU6JGYcnbllv1F4
 tbl9/GZcHjMnpXarIsNYN1dcA4u6dQRB2tU0DHeGhcKvmUn+x/D4Zcc9JA2EapnbdR
 TD+8rzRSex7h1JL9U6oGwEYRbPIu6LM7Vje1mwpRlkjRai0F52GdF43nTpTQCyZdy3
 e3vuamCeaJTGU17s23RDnxasS5vzQ/GEXJDnTM12bovr7VKE6u0kk8CnXAgoUoZNK6
 2b+pOjVmoTZTA==
Message-ID: <b83f53e7bffcc7de692c2e478e083928@kernel.org>
Date: Mon, 25 Nov 2024 09:13:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 01/10] drm/tests: hdmi: handle empty modes in
 find_preferred_mode()
In-Reply-To: <20241122-hdmi-mode-valid-v4-1-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-1-2fee4a83ab79@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Chen-Yu Tsai" <wens@csie.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Fri, 22 Nov 2024 11:12:57 +0200, Dmitry Baryshkov wrote:
> If the connector->modes list is empty, then list_first_entry() returns a
> bogus entry. Change that to use list_first_entry_or_null().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
