Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6278A46CA3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 21:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E17882AF;
	Wed, 26 Feb 2025 20:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="EpnFP73D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Wed, 26 Feb 2025 20:44:02 UTC
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A352110E23A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 20:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1740601729; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GVF/BSCub2+zBPrelX6QxOCzA6j14zubYhJusOy8/L3BcUmI1dHU7V2o5KH68vuMPc1c4u4DnZAlo1cqcrtoGPu8EcmwgGlqCr83q5q3Mg4fVWk06nppeDgSr48o/ussH5jrk3uHheyQ/kuaWrjWE1D8aQvl6N9rDTZqLKFZBZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1740601729;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=nv1QFAqtfqaqDbLhbRbCHva2+HnRXTxPb+vZqOfAZjA=; 
 b=mWnTSCQnaR75mR9PSqKhB7CWvDuHAnr7MUd0tT8N1UrxrKKCZVLFzBgQkTS1+gBVq/2v9dGREbIrPjOSarhbzXujGyfTpqBD7MEhDMd7bwlpVNyq3dxtyKjuFHi5fz85sIqrweiuqXB8cOIjVuTO1C7WSSXbk+e7wAKb6F/Vrng=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740601729; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=nv1QFAqtfqaqDbLhbRbCHva2+HnRXTxPb+vZqOfAZjA=;
 b=EpnFP73DnbDwgqaUK9s87UEyOsRDqapehD3/cFxf7CIe2QSghghMO49MwLQHJf4+
 XC1uf0zhA00Ux2q5mlnu6UPlEGNCidbk8fGEUtSwPhCU0ldqwFu/i4aRtErmwNmUGUT
 9/rvVlzbtgYn16dLZWvNX4llR6VPIlq8nopcjqbQ=
Received: by mx.zohomail.com with SMTPS id 1740601727996641.1431143933187;
 Wed, 26 Feb 2025 12:28:47 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: gregkh@linuxfoundation.org, heiko@sntech.de,
 Heiko Stuebner <heiko@sntech.de>
Cc: rafael@kernel.org, dakr@kernel.org, hjc@rock-chips.com,
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de
Subject: Re: [PATCH 2/2] drm/rockchip: Fix shutdown when no drm-device is set
 up
Date: Wed, 26 Feb 2025 21:28:42 +0100
Message-ID: <5271432.LvFx2qVVIh@workhorse>
In-Reply-To: <20250220234141.2788785-3-heiko@sntech.de>
References: <20250220234141.2788785-1-heiko@sntech.de>
 <20250220234141.2788785-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Friday, 21 February 2025 00:41:41 Central European Standard Time Heiko 
Stuebner wrote:
> When the drm-driver probes, it mainly creates the component device, where
> all the sub-drivers (vops, hdmi, etc) hook into.
> 
> This will cause the shutdown handler to get called on shutdown, even
> though the drm-device might not have been set up, or the component bind
> might have failed.
> 
> So use the new component helper to check whether the drm-device is up
> and only then call the drm-atomic helper to release all the drm magic.
> 
> This prevents failures when the drm-device is never set, or has been
> freed up already for example by a probe-defer during the component bind.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Tested on a RK3588 ROCK5B by adding a `return -EPROBE_DEFER` into the middle 
of `rockchip_drm_bind` after `component_bind_all` already ran. Without the 
patch, I get a stacktrace in `drm_atomic_helper_shutdown`. With the patch, I 
don't get one.


