Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 500A76830CB
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 16:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111A710E37E;
	Tue, 31 Jan 2023 15:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AB210E377;
 Tue, 31 Jan 2023 15:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675177560; x=1706713560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9iONsZSO0H/piflOxLEnjnkoS6M6phYKofNGQ7BlAR4=;
 b=BUFSpkysHIEYLb6NHpYxhUprQ68ohvtCygZT9vNNsB7ff4h8aT1Iyv/g
 3FOegxKftcM15dcuLm2OO0BIkj0WFbnVXJV0hVQjXu8c79LpwfwmQ27pO
 BCn6Eo7OM11ZxeLUk0PVP7uOs5i9sXnbxbuB9/o0erR1j5XNNOoZr+k5s
 Pmc8zwAShYlrE2ZiXg+ovRaBX7yBZkkj9GSYqsnYBBeah0bAUmLZhIXL/
 AMYV+nWZ6slMBYoMgxw4nTGy8LJGRAZ3hP+RQ564e2l9rpgT3kq1rBDnY
 v0XdGAbWOvMfVgaDiuL+zry/FyJqmqhE93IQ5Hz1QHxRJHi+KH2G1gQlP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="308205536"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="308205536"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 07:06:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="807155296"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="807155296"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 07:05:59 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 05/17] drm/display/dp_mst: Fix the payload VCPI check in
 drm_dp_mst_dump_topology()
Date: Tue, 31 Jan 2023 17:05:36 +0200
Message-Id: <20230131150548.1614458-6-imre.deak@intel.com>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
In-Reply-To: <20230131150548.1614458-1-imre.deak@intel.com>
References: <20230131150548.1614458-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix an off-by-one error in the VCPI check in drm_dp_mst_dump_topology().

Cc: Lyude Paul <lyude@redhat.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 38dab76ae69ea..8787df19f428b 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4772,7 +4772,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 		list_for_each_entry(payload, &state->payloads, next) {
 			char name[14];
 
-			if (payload->vcpi != i || payload->delete)
+			if (payload->vcpi != i + 1 || payload->delete)
 				continue;
 
 			fetch_monitor_name(mgr, payload->port, name, sizeof(name));
-- 
2.37.1

