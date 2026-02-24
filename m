Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN86EVAinmnWTgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:12:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD75518D0E1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E564510E335;
	Tue, 24 Feb 2026 22:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/ibGkuh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90B210E335
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 22:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771971149; x=1803507149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0Dzwt6Ygxg4qUM0QWX8Q1obiDfrGYhMppzNo+x1fdA0=;
 b=E/ibGkuhs14MqaLOP6MXv9w3T34CbQY7r7sMcZLiBimpOZaGgKuKIMv1
 G4vqIKkEGda47wo9OXMKUscBX4LN1HNp4nj0udGbsWGBji7StcBf2Lwtx
 teT3YgDlaT5nGUxIUTxK8tXeRESeH3by84qQ80i53Nuf+vffI+fZGJfvY
 z/7bcume55CE62BYLoNzZnfKFVkZjJku9ufMhIf6xF0ooPlEnN62uWJoM
 NDYDYGItvzqE98j8+lBInzai9INxnpqYu9dFHYED211pAu973s8BZdl+J
 zSj2UGpjovFkhyrU84JSesgd1l82so78s0/H47in/5HwY862r8f9K+hrF A==;
X-CSE-ConnectionGUID: AjeECQqtTPeE6HN1WchpCw==
X-CSE-MsgGUID: 3SSkZuKrSpqF17URB8/3tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72209615"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="72209615"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 14:12:28 -0800
X-CSE-ConnectionGUID: db7I64N3RJWXnsdILGfx5Q==
X-CSE-MsgGUID: yWw7Hd5JTduUFHsNG/5XSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="220154162"
Received: from dut4420lnl.fm.intel.com ([10.105.10.30])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 14:12:28 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH] drm/client: Do not destroy NULL modes
Date: Tue, 24 Feb 2026 22:12:28 +0000
Message-ID: <20260224221227.69126-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cavitt@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: CD75518D0E1
X-Rspamd-Action: no action

'modes' in drm_client_modeset_probe may fail to kcalloc.  If this
occurs, we jump to 'out', calling modes_destroy on it, which
dereferences it.  This may result in a NULL pointer dereference in the
error case.  Prevent that.

Fixes: 3039cc0c0653 ("drm/client: Make copies of modes")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 262b1b8773c5..bb49b8361271 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -930,7 +930,8 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	mutex_unlock(&client->modeset_mutex);
 out:
 	kfree(crtcs);
-	modes_destroy(dev, modes, connector_count);
+	if (modes)
+		modes_destroy(dev, modes, connector_count);
 	kfree(modes);
 	kfree(offsets);
 	kfree(enabled);
-- 
2.43.0

