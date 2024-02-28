Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D1C86B356
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 16:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E07D10EA06;
	Wed, 28 Feb 2024 15:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eH+QFfnk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2255810EA06
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 15:40:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3C12361209;
 Wed, 28 Feb 2024 15:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2CBC433F1;
 Wed, 28 Feb 2024 15:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709134823;
 bh=hzQVSaBrZkCaB0MO/4h8xfo96VI0B7t/YSfR6AYVxVs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eH+QFfnkihZ1s1J9W0yFVWJmPH1URmdchPKpUzOsB5WpjpDPnQRRH3yikqF1XO67K
 AqVjII5+5FAJhEifgKvo1SERrFDsZkyWzmSTx799ksK2wTDTjy/B4l+dTL3ETAxiXE
 GvrrBAKzI2+elBWHjdkdu2/hMPJ0xfuimg2Vq8ioA4lCwWQQmHUtTF8m2Lcxkb0+bL
 S9Rns/1U3hLwOTLPPFLoUcGIpfZ9JvAfwwzyXL03FrI8jH312yHOUW1t3GFOYGFn5q
 2+w2yeiy9ZsVYzwyGVnRS4roW/nZMHDi5Bl406bfOLl496dmrero367vQ+P6TEvZU4
 qqAfWNCpWv51w==
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
Subject: Re: (subset) [PATCH v7 01/36] drm/tests: helpers: Include missing
 drm_drv header
Date: Wed, 28 Feb 2024 16:40:14 +0100
Message-ID: <170913481315.384117.18098119230444621224.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-1-8f4af575fce2@kernel.org>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-1-8f4af575fce2@kernel.org>
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

On Thu, 22 Feb 2024 19:13:47 +0100, Maxime Ripard wrote:
> We have a few functions declared in our kunit helpers header, some of
> them dereferencing the struct drm_driver.
> 
> However, we don't include the drm_drv.h header file defining that
> structure, leading to compilation errors if we don't include both
> headers.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
