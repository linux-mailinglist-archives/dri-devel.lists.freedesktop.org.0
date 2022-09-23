Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2395E8456
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 22:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C59410E1F1;
	Fri, 23 Sep 2022 20:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E6A10E1F1;
 Fri, 23 Sep 2022 20:52:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYISXiCXslb+QgM8KcKXVngvVgEO+clVNzaVXyd8xFuaawwnwdcRwACcEuCIjxlwwKigJFKsDAU8wnn72XQ5VXJ65pro0AlKB8H+tAOlpuSZm6td/pNT1s+2Af2GvtjKShRuK6yo/WTsffa8hYsQ9J6YhP8Gu5KKuaUzJ11w9SEyUkPHeYVDveXwXztexgHrpydBtKj4tT3TtVPCVblY2umoMtpIhe5krQKg/Y25vRgg3je/MhwZKCNID4SyorDnonqB18WZ4bM3RXl53oXDYBGY7cY9tBcRevefkm99vqfgJaJfPDGZ/sTDz68dbppx9E5yrW8ttXhN9FE5PyJksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIHfBcJrCmnBRxtjis+sCa2mamAhQ+etIHBFLKZQ1/w=;
 b=VWRD39Onxrb6/E/9OEiaqbN0oisxIeaQSi/ZuQfs2SIz0jfYX3FDjU/7NjUt050ngAfslABxlpO3L/RijKo5rmxdEqzSLlzwTsS3MORcu9z4Ee4Yi0LmLj3BxIHs0vtc+IbPHHKGZStHpU7dzxeSD+Gu1zABxwIXvTVhz92MzXuyBcmvFQ7WA8V8BXAYc34i41rZCTTyTwbMdD7ctqa0btyYItxIqpScVYX7ERdTK0j4VUvxcegI/MD0+rp3pxwWpAjhmUdaNoKInw7tQwTufSM3Ikx9ff7WFEtSwAlPtEJjR5O5FTTAEFOGcpeBd7WDaFk1i7r/xJvFSdGYskmI+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIHfBcJrCmnBRxtjis+sCa2mamAhQ+etIHBFLKZQ1/w=;
 b=E0udaQMgrKseJFuzs2huo1FNF9l80LoGWsAcGVInddN2pmGD55Qcxztw/x1Mjh/Pd0PLMdjOQe0RFL1MOhkuwygFaNbOHOaF+iaO6smqXvnuNa0wah1AjmcAVoeVSmkIuZwWvtLzhdWRqcT2Z3gA9asHyqNQizb+3cJC7N4Rrlo=
Received: from DM6PR06CA0088.namprd06.prod.outlook.com (2603:10b6:5:336::21)
 by IA1PR12MB6209.namprd12.prod.outlook.com (2603:10b6:208:3e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 20:52:41 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::8b) by DM6PR06CA0088.outlook.office365.com
 (2603:10b6:5:336::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20 via Frontend
 Transport; Fri, 23 Sep 2022 20:52:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Fri, 23 Sep 2022 20:52:41 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 23 Sep
 2022 15:52:38 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] drm/amd/display: fix HDCP drm prop update for MST
Date: Fri, 23 Sep 2022 16:52:28 -0400
Message-ID: <20220923205234.207628-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT058:EE_|IA1PR12MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c17acfe-5c42-4a5f-eab3-08da9da58e88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mBw9PxeIwVtfkT/RzL691vsujth81IJOjAX4YKDFVNJC5IW2dIlsTblVrWqH3QhpCLK74gBQughowDr47yfXZ5Cx5dlA0gVex7pSaZo1/e9py1azhsg7Iblq27WWCgCB1ws0YSfqTs1UMjCJcDVuPhwy1ZW6vbCTLVUMj39VVgVISBzp7Mwq1n1SmpMjLGyMKkKRnedwBzOpMTIEjWQEq1hL6GBRRZAzKfmc1kHAp9H+dq/fPT9v1/bZkAAdPi4w4BJFVv08NHmFPWBnw+PiW4aErn5YVJtypYOQebEK9MfDQqqmcMj6INynTGDC5iS8hmap0Tv8HFqzeUuGMnKEJty34B2tiAo2PE4w9td0U3hbj8wT+4kRwKBkHUj5+11TEzQ9o3RZgstx1shmwBkfNSsMx2l7m8YA+hqz1fjO7D/qhW1eIXk/sjocR2TzomX+yM5yz6GgjdkS/w5Nqq0SOaxp3IzL5ZduFr+cX6VlIpnbpwMm/iEJEGVbzYTw7UiElOXNeWxDvpg62SadqZpkyfa+xaRn53zDqcMBvtHT9SDYg5J2/tF67DDObJlATmhMXtqHg7X8bENpQL4h6/XJin9KyxFBhK+bnJOIc91DUmj33SRdYYYVmWMNwxjalOr8Kg0xFgQWTeXqVM+AENY2WGGRkHYVj7fbYWGrLbnEJwKp2SeQ9QEUFOJ/Dsax3+EuxHuh6JkU+H3JX9cn6ualZSUAjf6QgPLr0jZQQlM3Fwg64b44310TCjo+NgfJh06WrY1ui/E9JzYEloTe+WcP+odna4txAFknif1Qe2BEGVlgxhMCYmz7znqx4zyB5A73RN+yRGtMF/YA0lIFFkQmHA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(426003)(36756003)(1076003)(2616005)(6666004)(15650500001)(41300700001)(16526019)(336012)(26005)(44832011)(2906002)(8936002)(7696005)(186003)(5660300002)(82740400003)(81166007)(82310400005)(47076005)(83380400001)(40480700001)(86362001)(40460700003)(356005)(36860700001)(478600001)(316002)(54906003)(6916009)(70586007)(4326008)(70206006)(8676002)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 20:52:41.1755 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c17acfe-5c42-4a5f-eab3-08da9da58e88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6209
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Leo Li <sunpeng.li@amd.com>, Jude Shih <shenshih@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne
 Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For MST topology with 1 physical link and multiple connectors (e.g. a
one-to-many MST hub), if userspace enables HDCP simultaneously on all
connected outputs, the commit tail iteratively calls
hdcp_update_display() for each display (connector). However, the HDCP
workqueue data structure for each link has only one DM connector and
encryption status member, which means the workqueue of
property_validate/update() would only be triggered for the last
connector within this physical link, and therefore the HDCP property
value of other connectors would stay on DESIRED instead of switching to
ENABLED. So, to ensure that all of the connectors switch from DESIRED to
ENABLED keep track of each connector's status in an array instead of
only keeping track of the status of the most recent connector that
userspace has interacted with.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.c    | 145 +++++++++++++-----
 .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.h    |   5 +-
 2 files changed, 113 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
index 6202e31c7e3a..922ec91940e4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
@@ -170,9 +170,10 @@ void hdcp_update_display(struct hdcp_workqueue *hdcp_work,
 	struct mod_hdcp_display *display = &hdcp_work[link_index].display;
 	struct mod_hdcp_link *link = &hdcp_work[link_index].link;
 	struct mod_hdcp_display_query query;
+	unsigned int conn_index = aconnector->base.index;
 
 	mutex_lock(&hdcp_w->mutex);
-	hdcp_w->aconnector = aconnector;
+	hdcp_w->aconnector[conn_index] = aconnector;
 
 	query.display = NULL;
 	mod_hdcp_query_display(&hdcp_w->hdcp, aconnector->base.index, &query);
@@ -204,7 +205,8 @@ void hdcp_update_display(struct hdcp_workqueue *hdcp_work,
 					      msecs_to_jiffies(DRM_HDCP_CHECK_PERIOD_MS));
 		} else {
 			display->adjust.disable = MOD_HDCP_DISPLAY_DISABLE_AUTHENTICATION;
-			hdcp_w->encryption_status = MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF;
+			hdcp_w->encryption_status[conn_index] =
+				MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF;
 			cancel_delayed_work(&hdcp_w->property_validate_dwork);
 		}
 
@@ -223,9 +225,10 @@ static void hdcp_remove_display(struct hdcp_workqueue *hdcp_work,
 {
 	struct hdcp_workqueue *hdcp_w = &hdcp_work[link_index];
 	struct drm_connector_state *conn_state = aconnector->base.state;
+	unsigned int conn_index = aconnector->base.index;
 
 	mutex_lock(&hdcp_w->mutex);
-	hdcp_w->aconnector = aconnector;
+	hdcp_w->aconnector[conn_index] = aconnector;
 
 	/* the removal of display will invoke auth reset -> hdcp destroy and
 	 * we'd expect the Content Protection (CP) property changed back to
@@ -247,13 +250,18 @@ static void hdcp_remove_display(struct hdcp_workqueue *hdcp_work,
 void hdcp_reset_display(struct hdcp_workqueue *hdcp_work, unsigned int link_index)
 {
 	struct hdcp_workqueue *hdcp_w = &hdcp_work[link_index];
+	unsigned int conn_index;
 
 	mutex_lock(&hdcp_w->mutex);
 
 	mod_hdcp_reset_connection(&hdcp_w->hdcp,  &hdcp_w->output);
 
 	cancel_delayed_work(&hdcp_w->property_validate_dwork);
-	hdcp_w->encryption_status = MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF;
+
+	for (conn_index = 0; conn_index < AMDGPU_DM_MAX_DISPLAY_INDEX;
+	     conn_index++)
+		hdcp_w->encryption_status[conn_index] =
+			MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF;
 
 	process_output(hdcp_w);
 
@@ -290,45 +298,85 @@ static void event_callback(struct work_struct *work)
 
 
 }
-static void event_property_update(struct work_struct *work)
+
+static struct amdgpu_dm_connector *find_first_connected_output(struct hdcp_workqueue *hdcp_work)
 {
+	unsigned int conn_index;
 
+	for (conn_index = 0; conn_index < AMDGPU_DM_MAX_DISPLAY_INDEX;
+	     conn_index++)
+		if (hdcp_work->aconnector[conn_index])
+			return hdcp_work->aconnector[conn_index];
+
+	return NULL;
+}
+
+static void event_property_update(struct work_struct *work)
+{
 	struct hdcp_workqueue *hdcp_work = container_of(work, struct hdcp_workqueue, property_update_work);
-	struct amdgpu_dm_connector *aconnector = hdcp_work->aconnector;
-	struct drm_device *dev = hdcp_work->aconnector->base.dev;
+	struct amdgpu_dm_connector *aconnector =
+		find_first_connected_output(hdcp_work);
+	struct drm_device *dev;
 	long ret;
+	unsigned int conn_index;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+
+	if (!aconnector)
+		return;
+
+	dev = aconnector->base.dev;
 
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
 	mutex_lock(&hdcp_work->mutex);
 
+	for (conn_index = 0; conn_index < AMDGPU_DM_MAX_DISPLAY_INDEX;
+	     conn_index++) {
+		aconnector = hdcp_work->aconnector[conn_index];
+
+		if (!aconnector)
+			continue;
+
+		if (!aconnector->base.index)
+			continue;
+
+		connector = &aconnector->base;
+		conn_state = aconnector->base.state;
 
-	if (aconnector->base.state && aconnector->base.state->commit) {
-		ret = wait_for_completion_interruptible_timeout(&aconnector->base.state->commit->hw_done, 10 * HZ);
+		if (!conn_state)
+			continue;
 
-		if (ret == 0) {
-			DRM_ERROR("HDCP state unknown! Setting it to DESIRED");
-			hdcp_work->encryption_status = MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF;
+		if (conn_state->commit) {
+			ret = wait_for_completion_interruptible_timeout(&conn_state->commit->hw_done,
+									10 * HZ);
+			if (!ret) {
+				DRM_ERROR("HDCP state unknown! Setting it to DESIRED");
+				hdcp_work->encryption_status[conn_index] =
+					MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF;
+			}
 		}
-	}
 
-	if (aconnector->base.state) {
-		if (hdcp_work->encryption_status != MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF) {
-			if (aconnector->base.state->hdcp_content_type ==
-				DRM_MODE_HDCP_CONTENT_TYPE0 &&
-			hdcp_work->encryption_status <=
-				MOD_HDCP_ENCRYPTION_STATUS_HDCP2_TYPE0_ON)
-				drm_hdcp_update_content_protection(&aconnector->base,
+		if (hdcp_work->encryption_status[conn_index] !=
+		    MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF) {
+			if (conn_state->hdcp_content_type ==
+			    DRM_MODE_HDCP_CONTENT_TYPE0 &&
+			    hdcp_work->encryption_status[conn_index] <=
+			    MOD_HDCP_ENCRYPTION_STATUS_HDCP2_TYPE0_ON)
+
+				drm_hdcp_update_content_protection(connector,
 					DRM_MODE_CONTENT_PROTECTION_ENABLED);
-			else if (aconnector->base.state->hdcp_content_type ==
-					DRM_MODE_HDCP_CONTENT_TYPE1 &&
-				hdcp_work->encryption_status ==
-					MOD_HDCP_ENCRYPTION_STATUS_HDCP2_TYPE1_ON)
-				drm_hdcp_update_content_protection(&aconnector->base,
+			else if (conn_state->hdcp_content_type ==
+				 DRM_MODE_HDCP_CONTENT_TYPE1 &&
+				 hdcp_work->encryption_status[conn_index] ==
+				 MOD_HDCP_ENCRYPTION_STATUS_HDCP2_TYPE1_ON)
+
+				drm_hdcp_update_content_protection(connector,
 					DRM_MODE_CONTENT_PROTECTION_ENABLED);
 		} else {
-			drm_hdcp_update_content_protection(&aconnector->base,
+			drm_hdcp_update_content_protection(connector,
 				DRM_MODE_CONTENT_PROTECTION_DESIRED);
 		}
+
 	}
 
 	mutex_unlock(&hdcp_work->mutex);
@@ -340,19 +388,37 @@ static void event_property_validate(struct work_struct *work)
 	struct hdcp_workqueue *hdcp_work =
 		container_of(to_delayed_work(work), struct hdcp_workqueue, property_validate_dwork);
 	struct mod_hdcp_display_query query;
-	struct amdgpu_dm_connector *aconnector = hdcp_work->aconnector;
-
-	if (!aconnector)
-		return;
+	struct amdgpu_dm_connector *aconnector;
+	unsigned int conn_index;
 
 	mutex_lock(&hdcp_work->mutex);
 
-	query.encryption_status = MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF;
-	mod_hdcp_query_display(&hdcp_work->hdcp, aconnector->base.index, &query);
+	for (conn_index = 0; conn_index < AMDGPU_DM_MAX_DISPLAY_INDEX;
+	     conn_index++) {
+		aconnector = hdcp_work->aconnector[conn_index];
 
-	if (query.encryption_status != hdcp_work->encryption_status) {
-		hdcp_work->encryption_status = query.encryption_status;
-		schedule_work(&hdcp_work->property_update_work);
+		if (!aconnector)
+			continue;
+
+		if (!aconnector->base.index)
+			continue;
+
+		query.encryption_status = MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF;
+		mod_hdcp_query_display(&hdcp_work->hdcp, aconnector->base.index,
+				       &query);
+
+		DRM_DEBUG_DRIVER("[HDCP_DM] display %d, CP %u, (query->enc_st, work->enc_st): (%d, %d)\n",
+				 aconnector->base.index,
+				 aconnector->base.state->content_protection,
+				 query.encryption_status,
+				 hdcp_work->encryption_status[conn_index]);
+
+		if (query.encryption_status !=
+		    hdcp_work->encryption_status[conn_index]) {
+			hdcp_work->encryption_status[conn_index] =
+				query.encryption_status;
+			schedule_work(&hdcp_work->property_update_work);
+		}
 	}
 
 	mutex_unlock(&hdcp_work->mutex);
@@ -686,6 +752,15 @@ struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev, struct
 		hdcp_work[i].hdcp.config.ddc.funcs.read_i2c = lp_read_i2c;
 		hdcp_work[i].hdcp.config.ddc.funcs.write_dpcd = lp_write_dpcd;
 		hdcp_work[i].hdcp.config.ddc.funcs.read_dpcd = lp_read_dpcd;
+
+		memset(hdcp_work[i].aconnector, 0,
+		       sizeof(struct amdgpu_dm_connector *) *
+		       AMDGPU_DM_MAX_DISPLAY_INDEX);
+
+		memset(hdcp_work[i].encryption_status, 0,
+		       sizeof(enum mod_hdcp_encryption_status) *
+		       AMDGPU_DM_MAX_DISPLAY_INDEX);
+
 	}
 
 	cp_psp->funcs.update_stream_config = update_config;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h
index 09294ff122fe..b2dbc0719472 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h
@@ -43,7 +43,7 @@ struct hdcp_workqueue {
 	struct delayed_work callback_dwork;
 	struct delayed_work watchdog_timer_dwork;
 	struct delayed_work property_validate_dwork;
-	struct amdgpu_dm_connector *aconnector;
+	struct amdgpu_dm_connector *aconnector[AMDGPU_DM_MAX_DISPLAY_INDEX];
 	struct mutex mutex;
 
 	struct mod_hdcp hdcp;
@@ -51,7 +51,8 @@ struct hdcp_workqueue {
 	struct mod_hdcp_display display;
 	struct mod_hdcp_link link;
 
-	enum mod_hdcp_encryption_status encryption_status;
+	enum mod_hdcp_encryption_status encryption_status[
+		AMDGPU_DM_MAX_DISPLAY_INDEX];
 	uint8_t max_link;
 
 	uint8_t *srm;
-- 
2.37.2

