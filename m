Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF999F33F2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 16:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B663110E6BF;
	Mon, 16 Dec 2024 15:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LSMVH21l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBA810E6BE;
 Mon, 16 Dec 2024 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xsg+oZ24DRiMAs3gEIvJTo0rl1d4cXNVQpoNQRr62Z4=; b=LSMVH21lzbNa/WrZcHTKjxQB+j
 w738hpBnWMWaGcDCxoEXQlVitvkCqG4Ozq/GHEVi+VIHfSFvwC71FItBFZC0dkhUIKZ7MARhgnHka
 uE0o/K/ekVSqgyzZfXJx7RDnARi+c0M5Qo4yqIFK0Ekj5AV2ope5E5We/dCooWjlUYW9n3Y3MiZZ2
 8Q+MCYMjBTL7LOsSdmzNvI4v/f3Ytdr/eJQisoGtt6933WM+BxEXlEtuodSvL9SrqQCoJ+UNUFX12
 0m3ag2WtgGoI8MUPFa95ANWUp3UjCF0jbDUPmAOrYqk7BQ7/opYQy74/UyMUGFOQnhvAADK8MzWhn
 TqUwP47Q==;
Received: from [179.193.1.214] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tNCcc-003p0Z-9S; Mon, 16 Dec 2024 16:02:58 +0100
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
Subject: [PATCH v2 0/1] drm/amdgpu: Use device wedged event
Date: Mon, 16 Dec 2024 12:02:49 -0300
Message-ID: <20241216150250.38242-1-andrealmeid@igalia.com>
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

Changelog
v2: only report if reset succeeded, make it depend on `r` value. 


André Almeida (1):
  drm/amdgpu: Use device wedged event

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.47.1

