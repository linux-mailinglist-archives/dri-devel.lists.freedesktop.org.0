Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFCB4DC679
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 13:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF61D10EB92;
	Thu, 17 Mar 2022 12:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D70910EB92
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 12:53:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C4762B81E5C;
 Thu, 17 Mar 2022 12:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75EDC340E9;
 Thu, 17 Mar 2022 12:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1647521606;
 bh=pnnLmjgrFj3YqWEw384JKVp/R+b1txHwuHbbSAYmroM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LbU6c0Cytrvfq9O9yyOsjUbGb0m4345e/GN8/XbJM/DSkm91k0rCJM/6Oi0B9rLz/
 hhQVpmFdkyIKmpVyFU8uklrKtLA+P8wO41pvZBRMMnf1OmtZ7eznEFx/ITNyrUf5jQ
 vpHc0NHu/CJzusZH+V+xle41xtYcTLYG9qFvu7GU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.16 22/28] drm/vrr: Set VRR capable prop only if it is
 attached to connector
Date: Thu, 17 Mar 2022 13:46:13 +0100
Message-Id: <20220317124527.396397346@linuxfoundation.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220317124526.768423926@linuxfoundation.org>
References: <20220317124526.768423926@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: Sasha Levin <sashal@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Manasi Navare <manasi.d.navare@intel.com>,
 stable@vger.kernel.org
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
index 52e20c68813b..6ae26e7d3dec 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2275,6 +2275,9 @@ EXPORT_SYMBOL(drm_connector_atomic_hdr_metadata_equal);
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



