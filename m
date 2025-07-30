Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D657BB15AFE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 10:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE1810E1A4;
	Wed, 30 Jul 2025 08:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ML0/5032";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2E910E1A4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 08:57:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0ED844461D;
 Wed, 30 Jul 2025 08:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94109C4CEE7;
 Wed, 30 Jul 2025 08:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753865832;
 bh=hsajDzu0lfxjqv88Cmk4ofktu32ybt7F20xywXJFamg=;
 h=From:Subject:Date:To:Cc:From;
 b=ML0/50321P4ekFv1c5FFA7LNjnsZKzik+mgq59u6o6CasVr6KRrawnu1+RvFfWN7I
 Ddl1vF6OsEBHki2b1uB06xeV0xtN7kmi8rG69Kof+bT8M+JW9HRfGXzQu0O7WkhDf8
 ZT2hV8mwKqwahw6hqUuDIM+F00Mr1GeUn9nITHid5dFtRa72uwlGFyNu4hnxSEff3i
 6oFls6xPEmiNgelP98CLE3J3OV14mYbAHAeKTwuM3L+mq7rlSXRVN5Tn3AXrpJ98jW
 q6wlVXfoVP5kQx+r17FQQxkgtl302FwP9wgN27A+x8LyEHWFmycgpEp0ckRUYIZFxe
 xMcuIWFVVJ3tQ==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 00/14] drm/tidss: dispc: Convert to FIELD_* API
Date: Wed, 30 Jul 2025 10:57:00 +0200
Message-Id: <20250730-drm-tidss-field-api-v1-0-a71ae8dd2782@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFzeiWgC/x3MQQqEMAxA0atI1hPQ2EHrVQYXZRI1oFUaGYTi3
 S2zfIv/M5gkFYOhypDkp6Z7LGheFXyXEGdB5WKgmt51Rx45bXgqm+GksjKGQ7HtybsueGLnoJR
 Hkkmv//Uz3vcD0IOS4WUAAAA=
X-Change-ID: 20250729-drm-tidss-field-api-382947a92d44
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hsajDzu0lfxjqv88Cmk4ofktu32ybt7F20xywXJFamg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmd9+Jjip81z36e/4U3taZ+7l7dX2FL6qxypFOupacwe
 k56Im3aMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACayjZGx4dC5GM7CJ+K77exv
 yHfwTzm5jsOscN7DSkXDqwq/PB8H/Ew6Ev23/NjUdA+V9ZpqhbuTGOsLp9YvuWNUGb1aW+6ix40
 Lejc4v9S6BIvPideSehEpv7Dwi9y7tccuaXxu+qyx7MvflUkA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Hi,

The tidss driver rolls its own API equivalent to the FIELD_* API already
provided the kernel.

Since it's an ad-hoc implementation, it also is less convenient and
doesn't provide some useful features like being able to share the field
definitions that will come handy in the future.

Thus, this series converts the driver to that API and drops its own
version.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (14):
      drm/tidss: dispc: Remove unused OVR_REG_GET
      drm/tidss: dispc: Switch to GENMASK instead of FLD_MASK
      drm/tidss: dispc: Switch to FIELD_PREP for FLD_VAL
      drm/tidss: dispc: Get rid of FLD_GET
      drm/tidss: dispc: Get rid of FLD_VAL
      drm/tidss: dispc: Switch FLD_MOD to using a mask
      drm/tidss: dispc: Switch REG_GET to using a mask
      drm/tidss: dispc: Switch REG_FLD_MOD to using a mask
      drm/tidss: dispc: Switch VID_REG_GET to using a mask
      drm/tidss: dispc: Switch VID_REG_FLD_MOD to using a mask
      drm/tidss: dispc: Switch VP_REG_GET to using a mask
      drm/tidss: dispc: Switch VP_REG_FLD_MOD to using a mask
      drm/tidss: dispc: Switch OVR_REG_FLD_MOD to using a mask
      drm/tidss: dispc: Define field masks being used

 drivers/gpu/drm/tidss/tidss_dispc.c      | 249 +++++++++++++++----------------
 drivers/gpu/drm/tidss/tidss_dispc_regs.h |  76 ++++++++++
 2 files changed, 200 insertions(+), 125 deletions(-)
---
base-commit: fbb0210d25fde20027f86a6ca9eee75630b5ac2b
change-id: 20250729-drm-tidss-field-api-382947a92d44

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

