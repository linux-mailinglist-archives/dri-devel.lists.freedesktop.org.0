Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4109786B359
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 16:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4499A10EA0A;
	Wed, 28 Feb 2024 15:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZD8uj449";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3363310EA1D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 15:40:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8D7D3617D7;
 Wed, 28 Feb 2024 15:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39BCC433C7;
 Wed, 28 Feb 2024 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709134827;
 bh=5t9R4GtzeOAZ9GJytBGdPib9VNQ0Jmz73UKo6e5gukI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZD8uj449X4J1gYSLlSKMtjreRQLhQLSwXmf2Z+qXijTg0jaaDkCNBH4anBF2Chr7t
 y6bRPr2+3MTnaSblTZ0OIl6revijFTXsqtT8PTidiu8kLnRqT8VQgtph70j6v2xRS4
 FLFbkcz1NyImVF+dOFp3/ZdyUUoZgGaGMT0ElbFD0HXr9NTOmsLcMNhgXS8OKhOcCQ
 0RFdt48lbP268MuSWMHHcKx1meYic2MspV62WoQCOzWcRWfRWTzO2xClhQhPBmuZWH
 QHufrU0PyBpBOX+U0AUZ1063db5skQhgWlCLb66XlIA0TM19V4zR9JXcsQeQtHXtGB
 31scl2+OTAwgQ==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: (subset) [PATCH v7 02/36] drm/tests: helpers: Add atomic helpers
Date: Wed, 28 Feb 2024 16:40:15 +0100
Message-ID: <170913481315.384117.12389631392705299799.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-2-8f4af575fce2@kernel.org>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-2-8f4af575fce2@kernel.org>
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

On Thu, 22 Feb 2024 19:13:48 +0100, Maxime Ripard wrote:
> The mock device we were creating was missing any of the driver-wide
> helpers. That was fine before since we weren't testing the atomic state
> path, but we're going to start, so let's use the default
> implementations.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
