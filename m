Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF0pE/Kfb2kbKAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:32:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40534618D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A43510E180;
	Tue, 20 Jan 2026 15:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXL/2e/8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83A610E180;
 Tue, 20 Jan 2026 15:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768922460; x=1800458460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rly6cCw+0ig+tDNja4gVnOtmNvKTz1Q7pv11bHQAkZ0=;
 b=WXL/2e/8CWTdHItkk8jgoHDvfcjSfwgeMgq0dVOHF4ITreLT9MN6g391
 feV6LL5bAvKh54HcGCueBNZDvot4f8H8Utj6wbpsN1rWT6ItOuaEfWGJr
 Q7BFouP/WxkS7cRcaSZfr+cO2BAa4cDlH4e2ztPNiKAqdsxhbX9+FQ8o3
 pnFeg5frUWoMTVk0bkehYkITQiTXddvcGWgoj6mFljQIZfvdl6RYikVq5
 xhdtA139UH50K3QXo0xNSKKWRv8O0R9XKIs5ycS7yd90lTlGav22Nn10D
 qy9Kvm/CB5s/tbusnCuhmrG0E5HoKg2ZgBQzxvVqmyDlF/ndYcNhPFSNh w==;
X-CSE-ConnectionGUID: XzfFvjc1RDq0ca7X19cEwA==
X-CSE-MsgGUID: golm/qI4QwK+VWqahrea5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70225899"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70225899"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 07:21:00 -0800
X-CSE-ConnectionGUID: RiswWX6rQAednUhnLUet7g==
X-CSE-MsgGUID: taWkR410Qtac8KDCqrgyuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="236826238"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP; 20 Jan 2026 07:20:58 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id 502FB98; Tue, 20 Jan 2026 16:20:56 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] drm/nouveau/gsp: simplify code with
 acpi_get_local_u64_address()
Date: Tue, 20 Jan 2026 16:20:49 +0100
Message-ID: <20260120152049.1763055-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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
X-Rspamd-Queue-Id: A40534618D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[131.252.210.177:from,192.198.163.15:received,10.64.159.142:received,10.91.253.5:received];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[131.252.210.177:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[192.198.163.15:received,10.64.159.142:received];
	DWL_DNSWL_BLOCKED(0.00)[intel.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]

Now we have a helper so there's no need to open-code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 2a7e80c6d70f..c675324693af 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -796,7 +796,8 @@ r535_gsp_acpi_mux_id(acpi_handle handle, u32 id, MUX_METHOD_DATA_ELEMENT *mode,
 	struct acpi_object_list input = { 1, &mux_arg };
 	acpi_handle iter = NULL, handle_mux = NULL;
 	acpi_status status;
-	unsigned long long value;
+	u64 value;
+	int ret;
 
 	mode->status = 0xffff;
 	part->status = 0xffff;
@@ -806,8 +807,8 @@ r535_gsp_acpi_mux_id(acpi_handle handle, u32 id, MUX_METHOD_DATA_ELEMENT *mode,
 		if (ACPI_FAILURE(status) || !iter)
 			return;
 
-		status = acpi_evaluate_integer(iter, "_ADR", NULL, &value);
-		if (ACPI_FAILURE(status) || value != id)
+		ret = acpi_get_local_u64_address(iter, &value);
+		if (ret || value != id)
 			continue;
 
 		handle_mux = iter;
-- 
2.50.1

