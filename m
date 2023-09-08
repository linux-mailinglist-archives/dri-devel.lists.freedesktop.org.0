Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD71798F6B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4A410E1C2;
	Fri,  8 Sep 2023 19:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38DB10E175
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 19:32:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57CD16156A;
 Fri,  8 Sep 2023 19:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F32C433AB;
 Fri,  8 Sep 2023 19:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694201527;
 bh=kZ+TCZCEVPZJ3fQjxLRlsufPXX3kxYU9r0aaJQ+jHnk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q7bn3mt0tVrbIyzXz3gTSBFlgLwZu50jmC8GhH7nCRhnPY0C+95qxHXpd0ZANkWBg
 /qqlNuPDnKRWyeL3qBkk+V5YP5497+T9uKSTbNFdvN/EXs9JKbeDh8cYjEWdc7JNez
 hLd2fvXo1CmZp6B6ZY4pP4RX2e7y/pJtS6CpELtPgSBqBxu/zkMK4WofJyklnHjekf
 sgN5nup8i705KYRspkzZ9z2gLVy6ak6JSJvD9A8I613rp45o0AejFU1p6GnNz2dmeb
 RXgw1uYecNaSLVdzHsmA17K6myA95VF9VlgdSZzwElfJ92rdKJ93krNkWd0OiGfNf+
 3HsFKUNUJbfIg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 02/31] drm/edid: Add quirk for OSVR HDK 2.0
Date: Fri,  8 Sep 2023 15:31:31 -0400
Message-Id: <20230908193201.3462957-2-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908193201.3462957-1-sashal@kernel.org>
References: <20230908193201.3462957-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.15
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
Cc: Sasha Levin <sashal@kernel.org>, Ralph Campbell <rcampbell@nvidia.com>,
 Jani Nikula <jani.nikula@intel.com>, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ralph Campbell <rcampbell@nvidia.com>

[ Upstream commit 98d4cb705bc00afd4a9a71cc1e84f7111682639a ]

The OSVR virtual reality headset HDK 2.0 uses a different EDID
vendor and device identifier than the HDK 1.1 - 1.4 headsets.
Add the HDK 2.0 vendor and device identifier to the quirks table so
that window managers do not try to display the desktop screen on the
headset display.

Closes: https://gitlab.freedesktop.org/drm/misc/-/issues/30
Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Tested-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230621061903.3422648-1-rcampbell@nvidia.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_edid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e1a04461ba884..dd88c9c821ae8 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -230,6 +230,7 @@ static const struct edid_quirk {
 
 	/* OSVR HDK and HDK2 VR Headsets */
 	EDID_QUIRK('S', 'V', 'R', 0x1019, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('A', 'U', 'O', 0x1111, EDID_QUIRK_NON_DESKTOP),
 };
 
 /*
-- 
2.40.1

