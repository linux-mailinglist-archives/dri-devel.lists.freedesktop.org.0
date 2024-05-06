Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932C18BC857
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 09:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7141121E4;
	Mon,  6 May 2024 07:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TPi2B+bP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2AA1121E4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 07:27:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3CC65CE01C0;
 Mon,  6 May 2024 07:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E091CC4AF63;
 Mon,  6 May 2024 07:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714980464;
 bh=9Kw69BfKa5kkeDkJAAyST9I0D7UXthaocRM2ai6H6cA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=TPi2B+bPlbWrXR0vRrMi7OO7YfR/17oBUiIP3I0reFQOse+6mJiSXTFUDiYz9KNxR
 Xgovz8h0zqDVo38VqRUvYWa495nrfut4pabGPBCiTJyx8MjnJDLDH8Es1uxCDl+3hM
 UMzY/RS2j75++Trzbyg6e6aITMjsDP7A3+iToxB6REkWgd4QuQHWdTc7nCS3vwzbpc
 e0z72+4Ib9oZ/Smq22YUV4CnfxfAHkusWe39MT5oJnmX8+hSa589nJhtRd1NPj/zlH
 6O8cxnx+WZaWn5Rm9rYHzlX2ijHikOqIxGr1IQXAhHqQQIo4MkIs7LcwYYge1M3qSq
 cXp1IO+KNQZ2w==
Message-ID: <0aebaa438b4f2fd13b8a7ea5a92ca60d@kernel.org>
Date: Mon, 06 May 2024 07:27:41 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH v2 00/48] drm/panel: Remove most store/double-check
 of prepared/enabled state
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Chris Morgan" <macromorgan@hotmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>,
 =?utf-8?b?R3VpZG8gR8O8bnRoZXI=?= <agx@sigxcpu.org>,
 "Jerry Han" <hanxu5@huaqin.corp-partner.google.com>, "Jessica
 Zhang" <quic_jesszhan@quicinc.com>, "Jonathan Corbet" <corbet@lwn.net>, "Linus
 Walleij" <linus.walleij@linaro.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Ondrej Jirman" <megi@xff.cz>, "Purism
 Kernel Team" <kernel@puri.sm>, "Robert Chiras" <robert.chiras@nxp.com>, "Sam
 Ravnborg" <sam@ravnborg.org>, "Stefan Mavrodiev" <stefan@olimex.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Yuran Pereira" <yuran.pereira@hotmail.com>
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

On Fri, 3 May 2024 14:32:41 -0700, Douglas Anderson wrote:
> 
> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
