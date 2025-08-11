Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48460B217C7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 23:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6367210E561;
	Mon, 11 Aug 2025 21:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HgzQnRt9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D040010E561;
 Mon, 11 Aug 2025 21:57:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3VRfJ5N/Ucr3XCxzhvqWQKN+T65L002j/fgadejPrjebOC8ZrtytIP8k8dOHDRzFeM/HKHA1ArbkXxJj11fX8oJdIk+mIUvJSds0KoqH1GZpk45FxM4BqL86t7s+iGwhs24g1NWFU88VTkUlLy2YRVcbfpAyldvZWduvY840rLiWJfXw5ZhoUBcuzIz4H0c8jJzp03LQZFWx6d4hnLHLV+5BjsBMfdAVVAX9jq84agP2G9XqVUjMMR75hC0kFiOi8cnaMYq8qVFZj+3xR/nFOgTVPANbeZ0A1GhaEacemZ4V5i29lDojdYqCx1rgxhAlApiXkHCHC6/fWWWbjpN4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0KnV2xp1HsfYq54AuIE4WEprUYaKC6a3xpsR4ZhJSs=;
 b=sBxI1XgjOc1ztfMTSkbtpkKJthEQlkf3GGQFPCt+srWmasAotHb3hgi7f1LS2AKd0bEaZezQiBBdIh+08vj2JVgsB68PpJ+p/Sd+sQN1LAgHAlV4jkvvNgnh74rST1qNV4Targso34GSJVXeBprKtjIk9UWa6XDc2Y4mxnEnw4W77ph7ApfflBzzutP2xhGQ7QJo/fwxAomCWALYJnLYh17JzqdoYorSOL57HowtduCQ6FZfkx37okjTaWoUkVabNnwCNfGgbahl4l9nrZbQQur069FHr0s/JfFn5GPNjxzlbj3PPhpYBWUTaluBzSfoHPVr2Aq0eBbWN691t9qW/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0KnV2xp1HsfYq54AuIE4WEprUYaKC6a3xpsR4ZhJSs=;
 b=HgzQnRt99i+2uzpLHCfzDraUcg4FQjeIxm8DMcEu3pLgSPm3qaKLGWMzncjb3e+yk0UGCZRN8A1uZveLelq4zRYaY/WIPaNENq9tS28gMxCFZIST1UAqqEWMgLnNfAATCz2aPe1sqSscx3JkrpLf1YQ8izoJOlYr6vyUq5od3YoRlKR+j9s4+FjIyYtnGFWH4JtP9htoWXRcuWkPqd3NSZSF6x/cZDFGaHKawXEkv0RX7ZsnjLiquHoGqZqrrHgGe+41aDaCWqO1J4b8T/l354zXqbCO6+ayjxGfD/VElfzFrhCsoS37x8Z0wnQypjCBQMqVZTeAB7sX7F1hvWBrZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB6691.namprd12.prod.outlook.com (2603:10b6:806:271::9)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 21:57:18 +0000
Received: from SN7PR12MB6691.namprd12.prod.outlook.com
 ([fe80::d15a:729a:9a36:4376]) by SN7PR12MB6691.namprd12.prod.outlook.com
 ([fe80::d15a:729a:9a36:4376%7]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 21:57:18 +0000
From: James Jones <jajones@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Joel Fernandes <joelagnelf@nvidia.com>,
 James Jones <jajones@nvidia.com>
Subject: [PATCH 3/3] drm/nouveau: Advertise correct modifiers on GB20x
Date: Mon, 11 Aug 2025 15:00:17 -0700
Message-ID: <20250811220017.1337-4-jajones@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811220017.1337-1-jajones@nvidia.com>
References: <20250811220017.1337-1-jajones@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a03:505::25) To SN7PR12MB6691.namprd12.prod.outlook.com
 (2603:10b6:806:271::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6691:EE_|MN2PR12MB4207:EE_
X-MS-Office365-Filtering-Correlation-Id: 58daf08b-2ff7-445a-ff3e-08ddd9220a40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z7RzuHOJydQhT2OX3j9aX08lcXhJZWt50bL3R03GM9aVks4jw6D3ZM7eflEZ?=
 =?us-ascii?Q?j/D8199EtI4e0u1JaIKBEy6ikxqybUX4Ap2VHBxHj34wZifsALLKXxX1KM4C?=
 =?us-ascii?Q?tF0RWs8Dm4E7NORNcaRdInYCGPL2xS4lr+m8caFgcxgkkL3KlIoaeGpSoCbx?=
 =?us-ascii?Q?fJClK4Uc71KAkAzHQECTQQU7TVRMwq3nbCHwEyqgqotjwT5mrWzzIKQHiK+X?=
 =?us-ascii?Q?MH1oHoQKScZVhN1yJUPly5407Ic77wuF5Z6K7cDEHnLTLHcUIw/XD3VS0Wmn?=
 =?us-ascii?Q?Hw1mhHi/1Ku1W7w8gVj+1SG0QdKS81J/Vi3DngGugF6dnEqGs017JHEchKt4?=
 =?us-ascii?Q?aKE4qPVJTfv9xvZsMPhAxRa5LuzlGcokToKjETIDckcuONyw2rgrJuj+XsUn?=
 =?us-ascii?Q?RpOYW1sp075/ltGL7r5frr5KxDGY5WlNGuw/vWqTciRPsATWTt/ii3V4W3Co?=
 =?us-ascii?Q?DyUUFzVmzkmbNDEbiO1Hl85s4/r5vTtreVVUxvv97kLQfv2uAJbUkwyqITgw?=
 =?us-ascii?Q?myyThqvuY5usxrDJWMrABdBvpRLiXJ1uckH5sk7GBpH59g9GFKeNAXv4Xy7A?=
 =?us-ascii?Q?Aa4oxOE+r1fqVBr/CinUOQd9MEHI8cliyeGLjSnkMQlke1bEW26W5q0mqpzK?=
 =?us-ascii?Q?QjnschzVj/rDB6rG5xNxJColJXI7ibKEOBS4wDTXw9Btqif6GKdgknJrftGa?=
 =?us-ascii?Q?sW8TnVB5fc4QQyTicEN0vgt+vnfmhgK3pBMROv1PWmzs3GkN2aJHDh/ynEMw?=
 =?us-ascii?Q?FNy/2ZSCaSQ26oHfGx3mp59MS+sQXXI+qV5aiMPdgBnjMbVYMEwMTpxu35tL?=
 =?us-ascii?Q?6N/oH34jtbcpj4gFp9fSXhQqNqcD2mQLzvy4qsv7dd6DvCbXLhPOb9fdqzaL?=
 =?us-ascii?Q?eyDAOrljSt6QkVd9aP6wsSY8AcZ5DCgUKlLHCurJ4N4lOuq0xaFwSSaPlAfI?=
 =?us-ascii?Q?TSp1L0tNpF/tWJK2CKNwnlELcRd6dGiqjJbhD5tek+PDGQhrnTfvLC0lNd7W?=
 =?us-ascii?Q?LVMSBNNohxK2jkPc+XX89ifYG5Gu0OUczdJH4DvkNdKmX7FVxK6NmPWqSqan?=
 =?us-ascii?Q?vt5Yz9im+RO2pkm1YXxyVlJrXSVPL2rk2FOCP6zZ/EB8VWwCACOhXxmDH6y9?=
 =?us-ascii?Q?Sl7AxfvnlaOljsDHskw6zJ9p72WF0iZNyeVSIm9YiDkGI8jq6qDrHI/Nv2As?=
 =?us-ascii?Q?lCZoTWqn7ZQ1z9F7yD5DQ1UuvZloRer92fItaOkTklj2nMitCZ9OXNYV4Kv0?=
 =?us-ascii?Q?HmcQ1S2Iwlf/rcu0eawAMktKvjYPn8FId7fPI7F8irVui6HlkUI3QTwD8kwx?=
 =?us-ascii?Q?wWWdo6VnRf524xdjxT0uVTZgSbBfeUwnFmxRybmPaZooGHYziPQVRulNXCm3?=
 =?us-ascii?Q?tTECHhj7IoP4wMdixqug6YzMyKD66SCycqEPgJnB70e6I1Y9SQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6691.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gsG5M3+4tF6J9Kzs7iJK5CYeKqD9GimQ9IIDYHl4y1aN7bKi8A799wRuadb/?=
 =?us-ascii?Q?+jHKKb2WLs0PLKknWOfb6UhkFQQeH4YuouSjhYmopHjFdHeJsXWisb5CLZ/r?=
 =?us-ascii?Q?LCvKvofhh3c4b+AdWfOewFblXFxpAE0l6Jtfv/45etrCCAac845s6X+XLuWJ?=
 =?us-ascii?Q?Bt1/WfKtLCAqUaKclFOCctn76zy9XJnTUOrusEiVCeLJBVvXVfjWViF03/Pv?=
 =?us-ascii?Q?iAmO+C2WvZowluRdp/tNEwr3Dtc587RsQEXrC6j+c3hpfiZtCp5mvqzuoDdl?=
 =?us-ascii?Q?pbHS8sb0dD6bT5Ruz66ElWRXQGh7iGY8HY9QxWklbtxS/MvMcpwn2IJD/T6C?=
 =?us-ascii?Q?YpnZNQJkatt1ie6WXMxp/rDr1O7PWkgMzwpVNuS792A5B+nkeOFu1lyEy8n5?=
 =?us-ascii?Q?HzyNZJRPVwOkasDAuEaSjc+ejvY+ILWB7bQXuePyAl1Ec7ytVaJkQaf21+jl?=
 =?us-ascii?Q?R3rIo34I+Hye1wvcxKYJ2Ai9ZUm5NW6E5hubAFOd8J4+8CRyzlHH642/Qn/8?=
 =?us-ascii?Q?BW7gLNPf7XxmKlH4X7ZTY6IPc7qEhqoVm+Ebbm3+NzQcxJHh4IY+pRDV2Q4z?=
 =?us-ascii?Q?FYBrrfOt34tL4XObh1Qe1seL+IiYKoUuHh+0gDam+BismKPGXwu30JwcuKXb?=
 =?us-ascii?Q?nEPDbnhCmi9AV32D7WVyIwbDeqQ+olYQVnOJdWSgupiYUCT2BdjSoa9t+dIF?=
 =?us-ascii?Q?jCleDVsHx38kD1s06tg2lJDlQxc4l7rzxrivVf4OTRuZz8qY+/WG2BWld8ml?=
 =?us-ascii?Q?cmJ/3WV7MaQUHcrZkN7bd25H+rD/hBWmVI3mM5WpAeahWSXl+iQeQqxyJtyS?=
 =?us-ascii?Q?iNpOT2S23TvuirsD0AmWGvoXwLkA2Op/IkAd/TefT5M9XV/HzBSYLxW2+BNK?=
 =?us-ascii?Q?E8+RHFCmmdx0+9nMKfsTl/4+BTL2OGDsGzkKuiL4oI8IOTxID4Eimdr/3qYB?=
 =?us-ascii?Q?C+qJ3gYUQy78IrGKAxZFjDTG8lTDINd14DhYrz2rz5t3LJHYmsMx+Tjpr6y7?=
 =?us-ascii?Q?Ebvy9mhxqp4N2RIGK/CHYep3Xl9AjLP74ns4QYg600l7uB1ABfKDxXaaNIqy?=
 =?us-ascii?Q?pUrOAUY+VTIytP6xNdKTjO8VWkVP+TFmpyblRG2TVoaNgDrQDQfNceTaW5wL?=
 =?us-ascii?Q?oIEJMa8VaNCmliRbTLtgY4Rt/i/nGOvSFuodok+bQs6cQdQ/poQKxrj/s9hI?=
 =?us-ascii?Q?Pe366H5gE9FJB7h4D37QFli8+q+JyqIk/jIe7P9GUzXq7B93hX2Ajk5G5g3Z?=
 =?us-ascii?Q?TMoDYXJvl+/6NweOWy01IQa2RoOfUR8qWfbkYNDGyP9dUsyr8ZJS5oCk2hFP?=
 =?us-ascii?Q?jEJb+m+VVUUejpBGdlegla4T1Tur725zaR1lX9WbW5T4TmWOLVaWrl33FzRK?=
 =?us-ascii?Q?cdqg7+9QttIwATsl+26sKgWYIjcisLcPeYzSpZI18TuCafssjxc6YvUHwjmc?=
 =?us-ascii?Q?PRbajrmapavokkKkshdHZWIxyfABRaaaXSZJFityak7s1RxXJK56B8IrJJvq?=
 =?us-ascii?Q?7JWiG1xTXjCl4PmNh1oTHm8Z3n1NMAhKcQ9e1J//qUNqMhrFmLGd1Od8XX18?=
 =?us-ascii?Q?sTnmK1yfAsavJPVK4Hc7gjXoftFpLflJw324XMKP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58daf08b-2ff7-445a-ff3e-08ddd9220a40
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6691.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 21:57:18.2127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqxMHwaPARKYun8mf2oCrOxi4/lcptzExWMuAUUs3bjEtLejVgWaDaHBJ725/ejGTAsWnF0mIbS/zDnHDdRB3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207
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

8 and 16 bit formats use a different layout on
GB20x than they did on prior chips. Add the
corresponding DRM format modifiers to the list of
modifiers supported by the display engine on such
chips, and filter the supported modifiers for each
format based on its bytes per pixel in
nv50_plane_format_mod_supported().

Note this logic will need to be updated when GB10
support is added, since it is a GB20x chip that
uses the pre-GB20x sector layout for all formats.

Signed-off-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  4 ++-
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     | 24 +++++++++++++--
 drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c | 33 +++++++++++++++++++++
 4 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e97e39abf3a2..12b1dba8e05d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2867,7 +2867,9 @@ nv50_display_create(struct drm_device *dev)
 	}
 
 	/* Assign the correct format modifiers */
-	if (disp->disp->object.oclass >= TU102_DISP)
+	if (disp->disp->object.oclass >= GB202_DISP)
+		nouveau_display(dev)->format_modifiers = wndwca7e_modifiers;
+	else if (disp->disp->object.oclass >= TU102_DISP)
 		nouveau_display(dev)->format_modifiers = wndwc57e_modifiers;
 	else
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_FERMI)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 15f9242b72ac..5d998f0319dc 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -104,4 +104,5 @@ struct nouveau_encoder *nv50_real_outp(struct drm_encoder *encoder);
 extern const u64 disp50xx_modifiers[];
 extern const u64 disp90xx_modifiers[];
 extern const u64 wndwc57e_modifiers[];
+extern const u64 wndwca7e_modifiers[];
 #endif
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index e2c55f4b9c5a..ef9e410babbf 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -786,13 +786,14 @@ nv50_wndw_destroy(struct drm_plane *plane)
 }
 
 /* This function assumes the format has already been validated against the plane
- * and the modifier was validated against the device-wides modifier list at FB
+ * and the modifier was validated against the device-wide modifier list at FB
  * creation time.
  */
 static bool nv50_plane_format_mod_supported(struct drm_plane *plane,
 					    u32 format, u64 modifier)
 {
 	struct nouveau_drm *drm = nouveau_drm(plane->dev);
+	const struct drm_format_info *info = drm_format_info(format);
 	uint8_t i;
 
 	/* All chipsets can display all formats in linear layout */
@@ -800,13 +801,32 @@ static bool nv50_plane_format_mod_supported(struct drm_plane *plane,
 		return true;
 
 	if (drm->client.device.info.chipset < 0xc0) {
-		const struct drm_format_info *info = drm_format_info(format);
 		const uint8_t kind = (modifier >> 12) & 0xff;
 
 		if (!format) return false;
 
 		for (i = 0; i < info->num_planes; i++)
 			if ((info->cpp[i] != 4) && kind != 0x70) return false;
+	} else if (drm->client.device.info.chipset >= 0x1b2) {
+		const uint8_t slayout = ((modifier >> 22) & 0x1) |
+			((modifier >> 25) & 0x6);
+
+		if (!format)
+			return false;
+
+		/*
+		 * Note in practice this implies only formats where cpp is equal
+		 * for each plane, or >= 4 for all planes, are supported.
+		 */
+		for (i = 0; i < info->num_planes; i++) {
+			if (((info->cpp[i] == 2) && slayout != 3) ||
+			    ((info->cpp[i] == 1) && slayout != 2) ||
+			    ((info->cpp[i] >= 4) && slayout != 1))
+				return false;
+
+			/* 24-bit not supported. It has yet another layout */
+			WARN_ON(info->cpp[i] == 3);
+		}
 	}
 
 	return true;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
index 0d8e9a9d1a57..2cec8cfbd546 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
@@ -179,6 +179,39 @@ wndwca7e_ntfy_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 	return 0;
 }
 
+/****************************************************************
+ *            Log2(block height) ----------------------------+  *
+ *            Page Kind ----------------------------------+  |  *
+ *            Gob Height/Page Kind Generation ------+     |  |  *
+ *                          Sector layout -------+  |     |  |  *
+ *                          Compression ------+  |  |     |  |  */
+const u64 wndwca7e_modifiers[] = { /*         |  |  |     |  |  */
+	/* 4cpp+ modifiers */
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 5),
+	/* 1cpp/8bpp modifiers */
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 5),
+	/* 2cpp/16bpp modifiers */
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 5),
+	/* All formats support linear */
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 static const struct nv50_wndw_func
 wndwca7e = {
 	.acquire = wndwc37e_acquire,
-- 
2.50.1

