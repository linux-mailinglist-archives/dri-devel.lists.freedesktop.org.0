Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E561866F65
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 10:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB6F10F012;
	Mon, 26 Feb 2024 09:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AKOoR+ZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDF810F012
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 09:55:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E013560FD0;
 Mon, 26 Feb 2024 09:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A503C43390;
 Mon, 26 Feb 2024 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708941338;
 bh=4dRXifSdQjscvfLmqYmq24fqEGlLnuN4Zc0Ty+/Cqmc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AKOoR+ZBcLmKp+ldEEnw32sKLbEiPsihkWbr/DdXjQshwve9EmlZ69CX+EtAkkxn8
 sQyUpyavmYWBTPZNE/bkt+gnQ3uFPqH+u/QwATZ7pQo5CzC5/8+zZ/J1KqdQifIHps
 I26x1edA2wGFDQ4aU+Ki4WkTXZ2qkMSkmiOdmA1Pk1Ks/66+cM5AH1KxrUW8RIWSoP
 l+iFWriLMKYWviwdLxb+6q7mZOwty3yMCEPJlroxdpULY/+EFw7B0FUcvms7UrnF2f
 Q9/VRqle1CfyJD7lHbpkYzrh+6xjfUJR9+1Y9E2AxKz6+vSJzpJIqfuMtAMatoQwCp
 7z7aYRZ7g/25A==
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
 linux-sunxi@lists.linux.dev, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: (subset) [PATCH v7 35/36] drm/sun4i: hdmi: Consolidate
 atomic_check and mode_valid
Date: Mon, 26 Feb 2024 10:55:23 +0100
Message-ID: <170894131837.29486.11894124011939274293.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-35-8f4af575fce2@kernel.org>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-35-8f4af575fce2@kernel.org>
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

On Thu, 22 Feb 2024 19:14:21 +0100, Maxime Ripard wrote:
> atomic_check and mode_valid do not check for the same things which can
> lead to surprising result if the userspace commits a mode that didn't go
> through mode_valid. Let's merge the two implementations into a function
> called by both.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
