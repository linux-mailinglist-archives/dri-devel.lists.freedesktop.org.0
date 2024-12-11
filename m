Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EB19EDAC7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6DA10EC61;
	Wed, 11 Dec 2024 23:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XQciWQ7n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE0B10EC4D;
 Wed, 11 Dec 2024 23:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733958183; x=1765494183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mzF0myakAockPX22Kdl2I/kjMADTSmWhi7MTXNkVNnc=;
 b=XQciWQ7nCFfMPQqCzbJwE2MMUn23THPrMEFSPretR8M8rtufQnOjVpFc
 wHNTPDsKPV6GCWizuMsWLhhFmsHLfch+Z71UcMwuPZctjJE0+a1TRs9P4
 apFcSdZk0SME1ggjOHr46qSe5pr2ZZ6m/NXOZUJ6IIimwz5/vvpaDyrvi
 cs8uf/7VpezEncQOcjxG7gGNdEJg+vKDNswYpodYK5Tlc+JDtRxc4vGi2
 Ms6NpbruxSSRXe86pnZ6szGTHJCt0EZ63ftmfKxkA7GkaeAV3BJr+MVte
 taS4d7aBrSqCPOqKXlxxTRjqreoYc3Fg3NNSc1pbBx7dwnbwcxzzDPAj9 g==;
X-CSE-ConnectionGUID: HFbgCcFfRiyRXNCWzOFoog==
X-CSE-MsgGUID: jeUrFkTaShihYhnUWYFrbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34401498"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34401498"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:03:03 -0800
X-CSE-ConnectionGUID: LTEyMNeRRWyb8wt1Z30aiA==
X-CSE-MsgGUID: 8jD81YrLSyKz8Ij6p+wQhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126962521"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:03:01 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 07/11] drm/nouveau/dp_mst: Expose a connector to kernel
 users after it's properly initialized
Date: Thu, 12 Dec 2024 01:03:24 +0200
Message-ID: <20241211230328.4012496-8-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20241211230328.4012496-1-imre.deak@intel.com>
References: <20241211230328.4012496-1-imre.deak@intel.com>
MIME-Version: 1.0
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

After a connector is added to the drm_mode_config::connector_list, it's
visible to any in-kernel users looking up connectors via the above list.
Make sure that the connector is properly initialized before such
look-ups, by initializing the connector with
drm_connector_dynamic_register() - which doesn't add the connector to
the list - and registering it with drm_connector_dynamic_register() -
which adds the connector to the list - after the initialization is
complete.

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index eed579a6c858b..8097249612bc7 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1265,8 +1265,8 @@ nv50_mstc_new(struct nv50_mstm *mstm, struct drm_dp_mst_port *port,
 	mstc->mstm = mstm;
 	mstc->port = port;
 
-	ret = drm_connector_init(dev, &mstc->connector, &nv50_mstc,
-				 DRM_MODE_CONNECTOR_DisplayPort);
+	ret = drm_connector_dynamic_init(dev, &mstc->connector, &nv50_mstc,
+					 DRM_MODE_CONNECTOR_DisplayPort, NULL);
 	if (ret) {
 		kfree(*pmstc);
 		*pmstc = NULL;
-- 
2.44.2

