Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 598CB4D33D5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 17:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A0510E8D5;
	Wed,  9 Mar 2022 16:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0857410E8D8
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 16:23:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 814016196E;
 Wed,  9 Mar 2022 16:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876D1C36AE3;
 Wed,  9 Mar 2022 16:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646842995;
 bh=74fUNjecR8fdqL28kcqYW3B5dHuRd/wXLz1YjF6Q8wE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QSgeuGQjd3yJSpiHmgyoApfBNOzIxOm9i6kBXgWJvxDhw7EF7CTicGTzYuKFaTePQ
 5DKqV4rza+yPFgMdPibnQ1oqebJd4gczxOw9w9q2LXDCHhWZKy9abpDO0rJk2kp3Ke
 +6pNJS9Jb9oiqVq5Bk1ugJPSlIrPItxsejCso/IRpslUdfQq1vFKA1tSyE6DsIeAKs
 CzvWe+DXbEs4L4a55z4FMHyVNrxYmv2J30WkBIwJcfWOrcOcXG3ZFrLf7MPTeQpfkJ
 vSeDqJ80MyNLCGMEPjRLKdhm/pbq0ecSc4RYq1M7MGt8o8FYShPXkI2tWa8RURwG30
 VQZwxHe5ic1rA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 15/20] drm/vrr: Set VRR capable prop only if it
 is attached to connector
Date: Wed,  9 Mar 2022 11:21:53 -0500
Message-Id: <20220309162158.136467-15-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220309162158.136467-1-sashal@kernel.org>
References: <20220309162158.136467-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, Manasi Navare <manasi.d.navare@intel.com>,
 airlied@linux.ie, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Manasi Navare <manasi.d.navare@intel.com>

[ Upstream commit 62929726ef0ec72cbbe9440c5d125d4278b99894 ]

VRR capable property is not attached by default to the connector
It is attached only if VRR is supported.
So if the driver tries to call drm core set prop function without
it being attached that causes NULL dereference.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220225013055.9282-1-manasi.d.navare@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_connector.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 717c4e7271b0..5163433ac561 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2155,6 +2155,9 @@ EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
 void drm_connector_set_vrr_capable_property(
 		struct drm_connector *connector, bool capable)
 {
+	if (!connector->vrr_capable_property)
+		return;
+
 	drm_object_property_set_value(&connector->base,
 				      connector->vrr_capable_property,
 				      capable);
-- 
2.34.1

