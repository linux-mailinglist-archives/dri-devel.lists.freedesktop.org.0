Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CB5C5FB04
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF4E10EC6C;
	Sat, 15 Nov 2025 00:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a71i1gYr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013001.outbound.protection.outlook.com
 [40.93.201.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D143E10EC62;
 Sat, 15 Nov 2025 00:10:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AB6QtrTq2SxF0tfNAqALUZHtN8umKVjWzYrnphfxs8la8ZJu5Os+tcCTN08Y4AOOh5bVOT1tLxJkHNahAMBOuPlCke1BCudJR0IfDkfZKVMgFIFgthcIGeFR3qPYAaW9NenOQlrzEB3g6Vk2LEUZBGd/fj81ofzYAXM9BzdBhYHIygGdngt5JUvvy+JaVUnGBLqLdD2KUOxTN+dhkeDRkD0G6QBjZL/F3mVwR687gknmV4XUqjDXyQdcSyyNoGQXblv7hWeBQPE0dc5TJCdieocKZ/3HrAsmcKjdE3lGqW0D/bkUBSrh2Vj20W5tvmvIjK7ouNLzrQ1MFdxQLugU7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZU/wFT1mY057Pbn2oAXx4AvswRpp9suTFpkFVcVKag=;
 b=R1QTymxci1QQMEjJ6fKzAdxsZQTyoamZR0lQih3EfJ2X/LDNjS9YeI8eflQ/NNWfwjLQOIYoYsz6/pHkypzdV9Vv9OWo8Ez+D9qS3jjhsGauKf7zRqskrAcCvpeX8xSHMIVQv9z53QqB5DTSseAy6wQOjB3bxX5BGG9+Xa3maiyY772ZiJOhNgeWDWiVuMeL5Q4Nxu9EIjXJ9JJ+LUdYKm5rkd3SMXZ0NYl+I1NR78jfBsuVC5ib0NhLwXo4VpPtxXIpnWNwuNFAv2VL2chW8RZxC9aq5kfKi7Gr6yTlO7PHBQ/0ol7E+jQycnh1SQNOX2xvg3v0fE2Qjtibp01xtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZU/wFT1mY057Pbn2oAXx4AvswRpp9suTFpkFVcVKag=;
 b=a71i1gYrg5Rwg/hT9KflA3JN26Np0J/g8PTkqCr71Kv5NOBKCZ/+xqxmR0rVmj9RDScVFoItTS9iUyQHuqAlh7+3/x+IMj0AXYFICcsSJUH+2M15CStILsd7lQ+6m0ZpkRSY/VqytXu8YM+zVBUgQXE/tcE+t4Z2MIeI5RCc/Ak=
Received: from PH2PEPF00003857.namprd17.prod.outlook.com (2603:10b6:518:1::79)
 by LV8PR12MB9691.namprd12.prod.outlook.com (2603:10b6:408:295::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:10:14 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2a01:111:f403:f912::2) by PH2PEPF00003857.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:10:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:10:14 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:10:10 -0800
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V13 27/51] drm/amd/display: Skip color pipeline initialization
 for cursor plane
Date: Fri, 14 Nov 2025 17:01:52 -0700
Message-ID: <20251115000237.3561250-28-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|LV8PR12MB9691:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a493f6-9fa1-4502-6ebf-08de23db59ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S1nb6kZ583sWdc+6r1XsfmVT2Wo3g8OnHnDU4I+d+FpDmnvKtbmf6rEo+z96?=
 =?us-ascii?Q?2jbncy/ibxBxfPDTVtLAz6sHOyokRDI/an19nCPTw1kvplPHcmKyYhzhWljj?=
 =?us-ascii?Q?4A1UrsYjz+MYokAoW0NQVin0jAZBPwgswdKIPjzP3nNR0+8ae5aj/P8X9Jiq?=
 =?us-ascii?Q?FU3JSGHn2ncZMBS9CSwYTP0h3Xi6NwHa+ce30xJfMlLtC4n6liTmqq/KT4DP?=
 =?us-ascii?Q?5MdT6FeAsg83/Fs6zC1A+XSDITqTG8ZWmVKeBhHUi0VdA4vvQsOnHRrG8bqZ?=
 =?us-ascii?Q?vm/LmZvn78WoKT21YyJO0WWg9q/KClhc/wKE7xLgU5YVKUXquNV3RVMwFu2v?=
 =?us-ascii?Q?ZidYbzW8Kn/2KACdg3rhQN/0s1DyoDmfd20l2LiDFKZdSFgp6PJOepsGMKw9?=
 =?us-ascii?Q?G2dmlDPFCRxYk7jEuJ027MDAYIJm3O8bb5/YU4XRk4niPafeIsMhTrmxx1bg?=
 =?us-ascii?Q?K2RMle5RoCNX41BPTPNGpvBw/Vj4tqJ6HM02eIeveedelC+n5MpHPsBXUTSJ?=
 =?us-ascii?Q?OrXCEFBJ+lT8yQcwem29bSCo18W/3Xp99VkcmEvmm3f7MnEBqoLCsgIVmYDV?=
 =?us-ascii?Q?m/5Nfe6/6FC5CWm5zZzfM2Kv5nf7yNddpZZKgTmAZAE+GaomSa8EbR0M6XlW?=
 =?us-ascii?Q?2Tm16olwttB8OBZ3E/7ws3mg6BqCihfhISMO53Y/E03P0G9wjCt8E4B8eOE3?=
 =?us-ascii?Q?VBYL5wmT3Jg442Uqex2FObK3FayicWONdyiRLYqBdS5Jo4IPBUp9M0Ap3k/Z?=
 =?us-ascii?Q?0EYtQ7w4eK1RUARM+aXhEPqMpRTgG53jJeWrrgaTcvjFdhLgTnIlinH3aIaq?=
 =?us-ascii?Q?pmVjSaklFgfKNZSKd77Eh9eVYlPGegZGVf8IpVnde09lOlttwUUXnFqOGqmB?=
 =?us-ascii?Q?8sKB4IeXpX0JNyEYaSepfnw+XDs+vrDR58i7nVzJsMQYLnYJYRm3QKc6PBYW?=
 =?us-ascii?Q?aOUdimFMQxDBP9nLVbWbZDYCDWagshsojc2ePK/LPhX1ewmuVbB+EnOuC+NM?=
 =?us-ascii?Q?mgeQXqEweFSY8RtIFkRBa/lNCMZvbezDavb3Tkki6DZM1kRjLf4NguTEdEIc?=
 =?us-ascii?Q?8OiIORXG7W1zH5WAd3uAMqUGZdjd6vJx6ZmDJm6BF/eGy2SE6n0SPCdybNIb?=
 =?us-ascii?Q?bK7uUlPAi9c3VgeBQDJwfb9D0P/596UdK7SMMxEfvEuP3QAlDr3/70Y+NRge?=
 =?us-ascii?Q?aw0Vpj6xKt7CC76uFlZCstfDHXM6yRW7N38m62oSQibgvEMOyxkR4vIwPYsH?=
 =?us-ascii?Q?zoR2PDRLsDmXQy49ClXCLzIN5h3Su05m6R910KcKYfJ1oBAm+R8l05acY8+R?=
 =?us-ascii?Q?eIYmSxsWc2QpsCfAOt0Q91fQI+QkPfjwPzVX4KgwY/+dP+/On3sefM0CuDXh?=
 =?us-ascii?Q?zTaAvERXpj/wQ1W+FZdFoM5UQMZ7NAUDoFDkAO9qiaT82r3h5L79ARivSHMR?=
 =?us-ascii?Q?5YtQ+w/KV4g9O/plH+c7gcPxnPRBNsafcsKhacNzfv28tUbcNH/gVzxmHW0D?=
 =?us-ascii?Q?yMHmfnQ7+TrQKQ9m2bTGkTePapbLKHIqR55s3OYzC5kKlFcYIzYaYNCJDo7Z?=
 =?us-ascii?Q?qGKFiqXy3TYAnIV+fjk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:10:14.1738 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a493f6-9fa1-4502-6ebf-08de23db59ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9691
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

cursor plane does not need to have color pipeline.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v7:
 - Add a commit messages

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 877fd221c81a..f3efaf55e099 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1792,6 +1792,9 @@ dm_plane_init_colorops(struct drm_plane *plane)
 	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
 	int len = 0;
 
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		return 0;
+
 	/* Create COLOR_PIPELINE property and attach */
 	drm_plane_create_color_pipeline_property(plane, pipelines, len);
 
-- 
2.43.0

