Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CA09EFC0F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 20:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FB110E66C;
	Thu, 12 Dec 2024 19:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VMmoPram";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7F210E66C;
 Thu, 12 Dec 2024 19:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AqWQj/XS4WxEZRFm4+YGdBNXDYx65cvJRDNg70vX7Zc=; b=VMmoPramqrQ9xfS5K7XFEElR79
 4Sk908DH19E+R+kcpS6/xjYOCSGOQrvW/KBpd0haNuNYpgV52m7mFo92HGMB3bojALRx5wbdgs1qQ
 IgkpAGI1mkQbD5/SsimUwklh3zYnPgA8YfZ50AxYwWMZWWj5fkwQvrwYdzbhBoJ2ZsOf1axOMqTc3
 hTBMK5U4AFkorYd4RE+emoMeIWwzjQuRSFryP/y3c0gulHpJx0/Me8gxU2ubitY7MKKntHdQNdz+Z
 AkYRixaOVV0MUtUE7G6d1FpmDDl3Xw/gmrzJGzwcR4F7huqsePToVmWjxjPMCTfyX+MsEI8V9rRmv
 mfNOquWQ==;
Received: from [179.193.1.214] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tLoYo-002MeQ-8i; Thu, 12 Dec 2024 20:09:18 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com, christian.koenig@amd.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 andrealmeid@igalia.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH 0/1] drm/amdgpu: Use device wedged event
Date: Thu, 12 Dec 2024 16:09:08 -0300
Message-ID: <20241212190909.28559-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Raag Jadav is introducing a new DRM API for generating "device wedged events",
to notify userspace when the device needs userspace intervention after a GPU
reset[1]. I did a simple patch to add support for it for amdgpu for the
telemetry aspect of the event. Tested in Steam Deck. This patch requires [1] to
be applied.

Raag, if you are sending a v11 of your work you can carry this patch as well if
you think it makes sense.

[1] https://lore.kernel.org/dri-devel/20241128153707.1294347-1-raag.jadav@intel.com/

André Almeida (1):
  drm/amdgpu: Use device wedged event

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.47.1

