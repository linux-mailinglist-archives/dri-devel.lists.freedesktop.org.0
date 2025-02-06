Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A36A2AA41
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 14:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E581810E835;
	Thu,  6 Feb 2025 13:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bt0NA3R8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E5E10E2F8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 13:43:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3072D5C5DEB;
 Thu,  6 Feb 2025 13:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E74C4CEE2;
 Thu,  6 Feb 2025 13:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738849394;
 bh=6RGLl2JFFYtY8IxplsnsOh9d1unB4VVvbOxH/mVO0R8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Bt0NA3R8+q+WQz7T6f7FWA9sRiHwT9uCtHOOngB1XMLJPNKMXnoKyk2fErja4tALZ
 kMnQrrcbebiYr7R389m84ljswY8MuKtLIo+0qvOQuO1Ra7pX0OIbgijWk8vk+cpLn+
 54RNgzRoxuPGiwstSIZfANyMNDMmmFND/gjqOKWE5FLVtYyum3sX3Uy3G2WkanV/c7
 KSnN9dTflR+CdT2pwGJUCl1p7SvF2ziTo1Tix7RdydwMng65ByrHwfETzpKxZZ3Or2
 NHT1DSHo6jrUdE3psZHOR1IFXh2+FnwUllXDhaNvdKNAAgxecPmCHkuoej2NSBZ5Cv
 CBqbVUNTs6tJg==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Hermes Wu <hermes.wu@ite.com.tw>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org
In-Reply-To: <20250121-fix-hdcp-v-comp-v4-1-185f45c728dc@ite.com.tw>
References: <20250121-fix-hdcp-v-comp-v4-1-185f45c728dc@ite.com.tw>
Subject: Re: [PATCH v4] drm/bridge: it6505: fix HDCP V match check is not
 performed correctly
Message-Id: <173884939065.2456165.14279070736754086408.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 14:43:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Tue, 21 Jan 2025 15:01:51 +0800, Hermes Wu wrote:
> Fix a typo where V compare incorrectly compares av[] with av[] itself,
> which can result in HDCP failure.
> 
> The loop of V compare is expected to iterate for 5 times
> which compare V array form av[0][] to av[4][].
> It should check loop counter reach the last statement "i == 5"
> before return true
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: it6505: fix HDCP V match check is not performed correctly
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a5072fc77fb9



Rob


