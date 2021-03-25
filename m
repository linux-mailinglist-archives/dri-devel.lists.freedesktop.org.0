Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B47A43498F2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 19:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011756EDF4;
	Thu, 25 Mar 2021 18:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770040.outbound.protection.outlook.com [40.107.77.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E202B6EDF5;
 Thu, 25 Mar 2021 18:06:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAEhuzmL59S7R8Hc1vvwuKZiRyjVFXdcGiMmAAOPIlr5TtFBb6L2jH2heP7l6WZh/VRN0dSg9SZmbI4o2g4WwZWCce4O71eLZxF97yfK6tiVSLzNBjSHTDmKoG1itEy+esDBDVOMFQ6n2VtIYjFxYq5KKz9XvkEVg6p92peZIcXqyAGsUZFoAp6oE1wA+1GzifNe2hk1v1WiNKB0Rm7pttcblDNpODDWXb0f0TyLxOEYVItPHsnkgVUGfYyUkEhJLDnlNoGjIcWV6JSt0g/ErWRKyVMcDubJiikLG0LsqDFOA80JoMTt007gHF8yrlvN3i43ntJHMw+7kl/oqZI6pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujX256lOXoEPl7R8M9SjWf3s4cgCtGDzz3RGs9pzCGk=;
 b=XO11CelicL3XNPuQyzaKzbNR3oc68MT2IbQj2RPbNR6AH3RUDByxUl7KBoAB6Ixa+EBIUeYji6TYiPMA5MHef4wTGZDj52wjJmYabLOLmbl0Y0Wqt1X1nQU9W5cyQ5UnW3YsJ5xgLwzwZaMBVVqv36cxo6NWZXcOOmQFdvUnmIlZhI60MRTLif0rwWPH9KyzBPTURzWxhFfFZgNkaI5NaJyV7aJtFBMiB1T8DmorAyhoAOJaXU/PPJOWL4DU8RC5aS+bXlezkbFolUK5CXeLpVfRrYJXT0ZVPmskr6Z6R93xRfphU9Jb8uyO5b1D9WHa1nHIvkv+WNE6DIedBhDCUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=amd.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujX256lOXoEPl7R8M9SjWf3s4cgCtGDzz3RGs9pzCGk=;
 b=BUY5ehnsjSH8aQPeXeidtt+MpgLdbLQg2JDGRppQxabBgVAoFgDf995E2Y19V//Am/OLa4xlaRVTFe9ixqCgiUycyQukt8MBT6pd/HfkYFhcoxVJJr+D3ijVQR12IhXeog0vsO3uarqyIOrooJ+QIL6WHbVQQamUldh8HNm0wx8=
Received: from MW3PR06CA0016.namprd06.prod.outlook.com (2603:10b6:303:2a::21)
 by BN8PR12MB3410.namprd12.prod.outlook.com (2603:10b6:408:45::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 18:06:34 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::83) by MW3PR06CA0016.outlook.office365.com
 (2603:10b6:303:2a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Thu, 25 Mar 2021 18:06:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3955.18 via Frontend Transport; Thu, 25 Mar 2021 18:06:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 25 Mar
 2021 13:06:32 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Thu, 25 Mar 2021 13:06:32 -0500
From: Eryk Brol <eryk.brol@amd.com>
To: <lyude@redhat.com>, <manasi.d.navare@intel.com>, <daniel@ffwll.ch>,
 <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>,
 <nicholas.kazlauskas@amd.com>, <jerry.zuo@amd.com>, <wayne.lin@amd.com>,
 <eryk.brol@amd.com>
Subject: [PATCH v2] drm/mst: Enhance MST topology logging
Date: Thu, 25 Mar 2021 14:06:14 -0400
Message-ID: <20210325180614.37060-1-eryk.brol@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7aa20bf4-13ce-432d-98f9-08d8efb8b9af
X-MS-TrafficTypeDiagnostic: BN8PR12MB3410:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3410D56636A6959B35243289E5629@BN8PR12MB3410.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sNm6QwLMetARR79f01JpuuCRlK7VCXUCrhB0J35RI6xbrNuSbcc51OZEFNbB711Ojg6XA+DmHQSxv82fGz8One//syZhGEK57OLg1yKcBWfwV02qZtM0wkxUII/DLE+ixkhEpHYbqVAj2yRh6UxeZ7e9+VrZKy5SdkmPqPWW7CPwAKgjFUVyApLNv3LRGRgVb8fqQUlp4cW85Xc9hd+q3pEAOBryeTBDSmIkOWnVdvs7/G7JLk+cXIN37hLp3+m/md85Ge3cbM/AJnkfT/1Xjzo+u5UztQOcgSPWI6n3LQahkeqAsoVs4/nLbGlHM2fqqC5gUuoiVc2h7xK5AnDeF6DckNh9LXw//Cc0OTpf1cc4R1yC0ZuctAnrq2v1Pkv3F/MBgP0jupO6ZxAWZSKrXZeTr21b5KhiKqVAK6SKQhRtGcYPDKvRx3P5oEMrCScPEN0rGRecu+Ny3cWYBxOnSxCslHdPvMu1P6RhdtkH5BrznLXkZ5LGuDTUNwvFDgqJicDoXnfYWz1QHi4i/HulDknn7vhrLKRK4tzjoZFnzUuks4WgzeBKibR4ffvGNbvhDh6CLPuvNSTd8+1aJyAWO7KJ3lSlOvtTFGrxTQmEsfBM4y1QQJLkpkCCoGbkgWQuTyX8tDxlQFH1VfN6MzXv9IAiSQvEgtrJkHptikJNVjefmsJVBvraB6zwv7/4+BFU
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966006)(36840700001)(2616005)(26005)(4326008)(36756003)(54906003)(8676002)(110136005)(5660300002)(478600001)(186003)(316002)(8936002)(82740400003)(86362001)(83380400001)(426003)(81166007)(2906002)(6666004)(70206006)(47076005)(82310400003)(70586007)(44832011)(356005)(336012)(1076003)(36860700001)(7049001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 18:06:33.9649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa20bf4-13ce-432d-98f9-08d8efb8b9af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3410
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[why]
MST topology print was missing fec logging and pdt printed
as an int wasn't clear. vcpi and payload info was printed as an
arbitrary series of ints which requires user to know the ordering
of the prints, making the logs difficult to use.

[how]
-add fec logging
-add pdt parsing into strings
-format vcpi and payload info into tables with headings
-clean up topology prints

---

v2: Addressed Lyude's comments
-made helper function return const
-fixed indentation and spacing issues

Signed-off-by: Eryk Brol <eryk.brol@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 59 ++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 932c4641ec3e..de5124ce42cb 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4720,6 +4720,28 @@ static void drm_dp_mst_kick_tx(struct drm_dp_mst_topology_mgr *mgr)
 	queue_work(system_long_wq, &mgr->tx_work);
 }
 
+/*
+ * Helper function for parsing DP device types into convenient strings
+ * for use with dp_mst_topology
+ */
+static const char *pdt_to_string(u8 pdt)
+{
+	switch (pdt) {
+	case DP_PEER_DEVICE_NONE:
+		return "NONE";
+	case DP_PEER_DEVICE_SOURCE_OR_SST:
+		return "SOURCE OR SST";
+	case DP_PEER_DEVICE_MST_BRANCHING:
+		return "MST BRANCHING";
+	case DP_PEER_DEVICE_SST_SINK:
+		return "SST SINK";
+	case DP_PEER_DEVICE_DP_LEGACY_CONV:
+		return "DP LEGACY CONV";
+	default:
+		return "ERR";
+	}
+}
+
 static void drm_dp_mst_dump_mstb(struct seq_file *m,
 				 struct drm_dp_mst_branch *mstb)
 {
@@ -4732,9 +4754,20 @@ static void drm_dp_mst_dump_mstb(struct seq_file *m,
 		prefix[i] = '\t';
 	prefix[i] = '\0';
 
-	seq_printf(m, "%smst: %p, %d\n", prefix, mstb, mstb->num_ports);
+	seq_printf(m, "%smstb - [%p]: num_ports: %d\n", prefix, mstb, mstb->num_ports);
 	list_for_each_entry(port, &mstb->ports, next) {
-		seq_printf(m, "%sport: %d: input: %d: pdt: %d, ddps: %d ldps: %d, sdp: %d/%d, %p, conn: %p\n", prefix, port->port_num, port->input, port->pdt, port->ddps, port->ldps, port->num_sdp_streams, port->num_sdp_stream_sinks, port, port->connector);
+		seq_printf(m, "%sport %d - [%p] (%s - %s): ddps: %d, ldps: %d, sdp: %d/%d, fec: %s, conn: %p\n", 
+			   prefix,
+			   port->port_num,
+			   port,
+			   port->input ? "input" : "output",
+			   pdt_to_string(port->pdt),
+			   port->ddps,
+			   port->ldps,
+			   port->num_sdp_streams,
+			   port->num_sdp_stream_sinks,
+			   port->fec_capable ? "true" : "false",
+			   port->connector);
 		if (port->mstb)
 			drm_dp_mst_dump_mstb(m, port->mstb);
 	}
@@ -4787,33 +4820,37 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 	mutex_unlock(&mgr->lock);
 
 	mutex_lock(&mgr->payload_lock);
-	seq_printf(m, "vcpi: %lx %lx %d\n", mgr->payload_mask, mgr->vcpi_mask,
-		mgr->max_payloads);
+	seq_printf(m, "\n*** VCPI Info ***\n");
+	seq_printf(m, "payload_mask: %lx, vcpi_mask: %lx, max_payloads: %d\n", mgr->payload_mask, mgr->vcpi_mask, mgr->max_payloads);
 
+	seq_printf(m, "\n|   idx   |  port # |  vcp_id | # slots |     sink name     |\n");
 	for (i = 0; i < mgr->max_payloads; i++) {
 		if (mgr->proposed_vcpis[i]) {
 			char name[14];
 
 			port = container_of(mgr->proposed_vcpis[i], struct drm_dp_mst_port, vcpi);
 			fetch_monitor_name(mgr, port, name, sizeof(name));
-			seq_printf(m, "vcpi %d: %d %d %d sink name: %s\n", i,
-				   port->port_num, port->vcpi.vcpi,
+			seq_printf(m, "%10d%10d%10d%10d%20s\n",
+				   i,
+				   port->port_num,
+				   port->vcpi.vcpi,
 				   port->vcpi.num_slots,
-				   (*name != 0) ? name :  "Unknown");
+				   (*name != 0) ? name : "Unknown");
 		} else
-			seq_printf(m, "vcpi %d:unused\n", i);
+			seq_printf(m, "%6d - Unused\n", i);
 	}
+	seq_printf(m, "\n*** Payload Info ***\n");
+	seq_printf(m, "|   idx   |  state  |  start slot  | # slots |\n");
 	for (i = 0; i < mgr->max_payloads; i++) {
-		seq_printf(m, "payload %d: %d, %d, %d\n",
+		seq_printf(m, "%10d%10d%15d%10d\n",
 			   i,
 			   mgr->payloads[i].payload_state,
 			   mgr->payloads[i].start_slot,
 			   mgr->payloads[i].num_slots);
-
-
 	}
 	mutex_unlock(&mgr->payload_lock);
 
+	seq_printf(m, "\n*** DPCD Info ***\n");
 	mutex_lock(&mgr->lock);
 	if (mgr->mst_primary) {
 		u8 buf[DP_PAYLOAD_TABLE_SIZE];
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
