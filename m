Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992B9D0BDBD
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAF410E924;
	Fri,  9 Jan 2026 18:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DCwHUf8e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70CD10E921
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 18:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5VE6xr1oOEHd+xvz86sHmcJE+TkTcDJzyPDUPe4TWuI=; b=DCwHUf8emBArs7N8+/HW2m0fld
 7LQCfufDfyqXEHWkpw7Sm899G1UcXeHOf+IF+8BILQmjieeMVTdw82kbiTg+QEXCYR6Xx+P4bxwRO
 tRjnq1APgIZ2xp/UWTCNqnj3i1rf77aZ2X0dQ6Fge0xEYjT5dnNhdrY9KXDyd4mDJaD64WdiRLKdD
 2ANArl4yJOoPX2CZQ8G5nEqKEo8X1YVqqMRtScwik1sY3JB5mdi6cxqTaWVNQohAAYl3SUr4w+PAH
 HAgusrAR8qKfzXX4r5uwNDhfpoGA273m4IOxSFyVHoWGTltRpt9enSoNCDU9Gt3TaMmopnZmjfSHF
 TWdwiaqw==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1veHLP-003Wwc-S7; Fri, 09 Jan 2026 19:36:20 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH 0/2] drm/v3d: Convert v3d logging to device-based DRM helpers
Date: Fri, 09 Jan 2026 15:35:50 -0300
Message-Id: <20260109-v3d-drm-debug-v1-0-02041c873e4d@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIZKYWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwNL3TLjFN2UolzdlNSk0nRdE0Oj5NRkA4NEk8RkJaCegqLUtMwKsHn
 RsbW1AMEhpXxfAAAA
X-Change-ID: 20260109-v3d-drm-debug-412cec00a4ac
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1003; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=oJbHepvgb4VfeKmRNgrfKwOU3X48I6z2v4dKV116Khc=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpYUqbJlE9dv52zTctbeO2WK2AXfEUgyO8AGByH
 6CDz5RKCMGJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaWFKmwAKCRA/8w6Kdoj6
 qjUWB/4qzM3yI8mukg8RwYAMhb9DwUUBKo2L3cH1K/ROAcuFPb8XnUQDHawf75/fx9n80HIyrAj
 PFSjM5cBg4xbusYQAu1i+QkBiaGH/Bt0GWgx0q4YCpum7+OKrnKa40dzz5KLIWW6fedSyibqoKp
 5tyQW+c1FoZfWKgOzA1P9G9CTm4OfMZ1MGYkMYDLtXbJil6NAprpU270g8TdbMXFssfOOT0W12n
 nU3W5Sy0PNx2NsPo6MCmMYK0hmEeI9FCbUX230arU576r83/vJ5flwTjloH2vxTvpFmM1VqIrEz
 eoY1BgnDkY0gMlC4A+kg6j7CDJ0iP1XjASCNGzPorKGJ8CWr
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

This small series intends to replace the legacy DRM_DEBUG/INFO/WARN/ERROR
logging with the corresponding device-based drm_dbg(), drm_info(), drm_warn()
and drm_err() helpers. I split the series in two patches to ease the
reviewing process as the first one has a minor code-refactor.

Thanks for the review!

Best regards,
- Maíra

---
Maíra Canal (2):
      drm/v3d: Consolidate CPU job validation in a function
      drm/v3d: Convert v3d logging to device-based DRM helpers

 drivers/gpu/drm/v3d/v3d_bo.c     |   8 +-
 drivers/gpu/drm/v3d/v3d_drv.c    |   6 +-
 drivers/gpu/drm/v3d/v3d_gem.c    |  16 ++--
 drivers/gpu/drm/v3d/v3d_irq.c    |   8 +-
 drivers/gpu/drm/v3d/v3d_mmu.c    |   6 +-
 drivers/gpu/drm/v3d/v3d_sched.c  |   6 +-
 drivers/gpu/drm/v3d/v3d_submit.c | 181 ++++++++++++++++++---------------------
 7 files changed, 108 insertions(+), 123 deletions(-)
---
base-commit: 44e4c88951fa9c73bfbde8269e443ea5343dd2af
change-id: 20260109-v3d-drm-debug-412cec00a4ac

