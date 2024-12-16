Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6153E9F35BF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 17:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F27610E6EF;
	Mon, 16 Dec 2024 16:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="r+jtExEr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E973B10E6ED;
 Mon, 16 Dec 2024 16:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d+JP80yY2ejhHz2zS7Yuk5s/MWjeaoDnan31mNEE+80=; b=r+jtExErY2ND1+SkJDifOlgX15
 NEJnW9KsCR2Uc0PagL2XHowN/S2bYBxmLFOtcBobLWVHZR1OHC+3awLNIWByWl6PyioEcj67W7sMd
 sA6G3Espq3q9OUTB+Q1GvHaczqcbiQS5uI8HuRVeincDaCSs8qN5xvLCcrnaml+FcVR1VocMUejqD
 ddb+tz2ySZaritScEaIZMTFt2boVlYqoOaG4NQmAnTbEwW3WT5e9twGASoXC54EEqoBp3Broew/wE
 cy0QoEnVRVxPG9mIpefn68ltzRwDKwRHr9tZIwQAPTbN3mW9V9xxDCCtQMImowu3z/pTGA1efUv+l
 QugVAgVQ==;
Received: from [179.193.1.214] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tNDqK-003qch-Op; Mon, 16 Dec 2024 17:21:13 +0100
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
Subject: [PATCH v3 0/1] drm/amdgpu: Use device wedged event
Date: Mon, 16 Dec 2024 13:21:03 -0300
Message-ID: <20241216162104.58241-1-andrealmeid@igalia.com>
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
v3: fix if condition
v2: only report if reset succeeded, make it depend on `r` value. 

André Almeida (1):
  drm/amdgpu: Use device wedged event

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.47.1

