Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5332B4C3AEE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 02:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A1C10E1D0;
	Fri, 25 Feb 2022 01:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A4610E14A;
 Fri, 25 Feb 2022 01:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645752635; x=1677288635;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LhMXHECP8VjSeyLSOaUahnS9eB7Fq2oF4pATO9AKlo4=;
 b=LnxlOErPD402U/OKc9iUOJa4KTMg5JJlPAHpPcWO1r8YZBaVy5v9eUxz
 Avmknswy+ULA/tE7h2j/UwDOfhypm0+bR1M77rthlXXX7tvvPz7JmcZ5o
 hENAgbPEbk2ajegxDKOrEW16RrESPNgZs8YnMLA/HoYvbruELU3yDFB2e
 etKUZnxVkYtWo5CNBhWPIpUynn02hhxOaM2EbCpf63bNMyIKk/a8nN6TR
 mtfILffjE9gD4Pn2s6K8FLXq6lmg+ThD0UpSgsgQLINuoyospOW6zwaEc
 eJsOSKVr//5zhggCm6GPt+je7ovrhCZUDgDZd6Bf5wVOSRALGxSPGJTs3 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="232366323"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="232366323"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 17:30:34 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="639948931"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 24 Feb 2022 17:30:34 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 1/2] drm/vrr: Set VRR capable prop only if it is attached
 to connector
Date: Thu, 24 Feb 2022 17:30:54 -0800
Message-Id: <20220225013055.9282-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VRR capable property is not attached by default to the connector
It is attached only if VRR is supported.
So if the driver tries to call drm core set prop function without
it being attached that causes NULL dereference.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
---
 drivers/gpu/drm/drm_connector.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index a50c82bc2b2f..76a8c707c34b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2330,6 +2330,9 @@ EXPORT_SYMBOL(drm_connector_atomic_hdr_metadata_equal);
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
2.19.1

