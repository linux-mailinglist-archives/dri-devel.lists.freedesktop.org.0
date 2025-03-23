Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F4CA6CFC9
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 15:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBB010E048;
	Sun, 23 Mar 2025 14:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dlH2wyFN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AB910E048
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4c/0JfJqZsDrgnrmW86o9lGfPb20uB1PxBnL2vaKse4=; b=dlH2wyFNWO0t9GmXrHGcyS5cVG
 96of4WZicc97HnBBG2VY3oDe1/xWUXa0YDYdqhcG0gwc7LsgBRYdjTrMxXE3EZn8G+v21lPRsP/6k
 l8MAXeW99JdPWKI8WSlDpCJBE2WviR428ZAG0e2mS+zbYFC+CtR2Gql19AnGUd7IjNigDViD/119o
 6MgG3QYyVdAXVAUDmQDCzjg43TfyUgjPwhNIV8xFuiP1djFMrhmzS/miXPs6QvEzufWwb+6uNWoMH
 /Z/Iw9AVTkH9Gowt1W/gNLjLon9cu5BeuVoLfjxd4G4wtcQ93hu+7GGX0Yq8KBuUn+gvBTQX3k2o2
 +jFqCTLQ==;
Received: from [189.7.87.178] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1twMZk-005Gyo-F1; Sun, 23 Mar 2025 15:45:20 +0100
Message-ID: <f66fe250-8452-423f-aa0f-6f589e566e16@igalia.com>
Date: Sun, 23 Mar 2025 11:45:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] drm/v3d: Fix GPU reset issues on the Raspberry Pi 5
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Emma Anholt <emma@anholt.net>, "Rob Herring (Arm)" <robh@kernel.org>
References: <20250317-v3d-gpu-reset-fixes-v6-0-f3ee7717ed17@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250317-v3d-gpu-reset-fixes-v6-0-f3ee7717ed17@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 17/03/25 22:01, Maíra Canal wrote:
> This series addresses GPU reset issues reported in [1], where running a
> long compute job would trigger repeated GPU resets, leading to a UI
> freeze.
> 
> The patches that prevent the same faulty job from being resubmitted in a
> loop were merged in drm-misc/drm-misc-fixes in v4.
> 
> However, those patches don't solve the issue entirely. Even with a single
> GPU reset, the UI still freezes on the Raspberry Pi 5, indicating a GPU
> hang. Patches #1, #3, and #5 address this by properly configuring the
> V3D_SMS registers, which are required for power management and resets
> in V3D 7.1.
> 
> Patches #2 and #4 are associated changes related to the robustness
> of the DT bindings. Patch #3 added a new register bank to the DT binding
> and during the reviewing process, we identified points that could to be
> improved in the DT binding.
> 
> Patch #2 started by adding per-compatible register restrictions to ensure
> that the DTB accurately reflects the hardware design and #5 updates the DT
> maintainership, replacing Emma with the current v3d driver maintainer.
> 
> [1] https://github.com/raspberrypi/linux/issues/6660
> 
> Best Regards,
> - Maíra
> 

[...]

Applied to misc/kernel.git (drm-misc-next). Before applying PATCH 1/5, I
fixed the W=1 warning reported by the kernel test robot with the
following diff:

-       gen = (enum v3d_gen)of_device_get_match_data(dev);
+       gen = (uintptr_t)of_device_get_match_data(dev);

Thanks for all involved in the reviewing process!

Best Regards,
- Maíra

> ---
> Maíra Canal (5):
>        drm/v3d: Associate a V3D tech revision to all supported devices
>        dt-bindings: gpu: v3d: Add per-compatible register restrictions
>        dt-bindings: gpu: v3d: Add SMS register to BCM2712 compatible
>        dt-bindings: gpu: v3d: Add V3D driver maintainer as DT maintainer
>        drm/v3d: Use V3D_SMS registers for power on/off and reset on V3D 7.x
> 
>   .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      |  90 ++++++++++++---
>   drivers/gpu/drm/v3d/v3d_debugfs.c                  | 126 ++++++++++-----------
>   drivers/gpu/drm/v3d/v3d_drv.c                      |  62 +++++++++-
>   drivers/gpu/drm/v3d/v3d_drv.h                      |  22 +++-
>   drivers/gpu/drm/v3d/v3d_gem.c                      |  27 ++++-
>   drivers/gpu/drm/v3d/v3d_irq.c                      |   6 +-
>   drivers/gpu/drm/v3d/v3d_perfmon.c                  |   4 +-
>   drivers/gpu/drm/v3d/v3d_regs.h                     |  26 +++++
>   drivers/gpu/drm/v3d/v3d_sched.c                    |   6 +-
>   9 files changed, 271 insertions(+), 98 deletions(-)
> ---
> base-commit: 83a0237859bc5a9e0a716e1db8e7fd3cafd63259
> change-id: 20250224-v3d-gpu-reset-fixes-2d21fc70711d
> 

