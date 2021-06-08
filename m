Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F139439FA0D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 17:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134606EC12;
	Tue,  8 Jun 2021 15:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED156EC12
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 15:09:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHJ8g7kWJzUu2diQ0DN2k3N8EfttuokNZB7hwX2gaY4GNNzy17nleBsSdkBB4sT5ow/66DDpZAi/UDy1yC/rC2uHQnfULRlb7BSmUNI1Nmgr6ZjbcQQVfax9dKcNoybn1nulBJP8im6ocqZx2VIBMEHJz9T3Oj2GglYosrzg4D4YtYBHxvAoEomX2j2pM8B7QunpYkQqO+UCRGD5gTeSD9GaBWbo1Sjcr5VY+DAbjupzcT236kjGdTV+Vg8D3wySwGNKR3gvfmb+hA71HAItWGLqTL1Gnqem06WPaEGeuZkxES7ypn8WAqEainPMF/Xbb2HOVeA71pFV6OJhXE8Pqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkB9Cupe1AQ4C4htq+uXhQAJhuOZwwSMucwg01fuPy0=;
 b=SyiKmSbJt5MoO5gVU3ovnIaCzrY6puT8IExWgCtmzSOhj0H/W6Rr3qImAy6qnHi2K1M0rUGjTAKupPMa4/yhUCAuaFxsHSXcS87UlI1wuakw9Eb/i1YXVgsYgyuTnigSNifmX8H0dtISWqK59T5NJY5+GwIdv36D0f8f47+JNel4d6unwfUjX88SKt+7DTfigXaIEaAUClAgIYI0/DCMTDgxkYc0l2JJYwr1zA4V5mrbyfWO4lsvbc4O8Wz+jyq8oSliK8xu6MVbydpMhPSon9WbzwfIycoaudc7EeFG74k3GG0o2DPV8JID/MoMKuVxy8jRBiO5u2734nnd0uePeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkB9Cupe1AQ4C4htq+uXhQAJhuOZwwSMucwg01fuPy0=;
 b=je4b3xN/1HjRiO1G/MyArA7kk/CUiGWIhjPomRuOWpdzJ4WiPbyfjrwrafFFehZa1mvmaoAq1TB9SPWhcXA4oBSRQxdJznfqtp+lYvJle+2DAfO2/dP6jCn8g6XUCbEsMoM+sp2K2FzPzHu9VjCx0f+chRuIUI1gB38w1q0WgDY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5085.namprd12.prod.outlook.com (2603:10b6:5:388::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Tue, 8 Jun
 2021 15:09:28 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa%6]) with mapi id 15.20.4173.037; Tue, 8 Jun 2021
 15:09:28 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/vmwgfx: free bo resource before assigning new one
Date: Tue,  8 Jun 2021 17:09:17 +0200
Message-Id: <20210608150917.89346-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [217.86.107.133]
X-ClientProxiedBy: PR3PR09CA0011.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::16) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (217.86.107.133) by
 PR3PR09CA0011.eurprd09.prod.outlook.com (2603:10a6:102:b7::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20 via Frontend Transport; Tue, 8 Jun 2021 15:09:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73443fb5-49e7-453f-dc72-08d92a8f6905
X-MS-TrafficTypeDiagnostic: DM4PR12MB5085:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB50851C39C5B4293F37E170B38B379@DM4PR12MB5085.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: edcwcKpTfivDhCuM6PWRC3f0dxVQH5domnSiZ8lyzkwB4/a5eTXFgX7DqGce8zBwkYzDe812KrvPfSOirdl0zjH5jYBo36rD2mm01uPX4osYiSaLt2Q2/YMZgT7DayD/1/YkT3/hEEzIzBBOlO+L1y7QnJs1wMUjiuagVLb7FF6+WR9RF/G/vtToquLxt9SU5x9p0SsmRkoAOhBy45a9h55ihhYSz8b/kPA0W/ISYSzmS0otAPvsjB3WK3YJz2z2CrL1slvxrVNfWoU+XaVv52tHPOPZd5SKDtDYvgXDVmmnAoSa5Sf03HrQN4G890qwP4iWYwkHbNRZEy3O/K77fH1kdnBnH+OZd1O6k/tu9R5S8b8Oe5iPDM3M/EZQY6g3EAvuitBIUcuvg7pGjZmNzfjIYdSymAIFDtfanBTJH47g0KD+DcrRUkeq9diKWEVuS3uZ8BMDBMjxPsyE3pr3iAm4E1XyxO3GCaWbOcOxXTWfIg7E9wuL8bw1ygRBrBfvHZSCU+sgIfY0/qAjSezxyn0bEk3notrX40RQvDg0AXp31dEwSb/vi47vsprNTxK6k1D/3+HzfejLGezSG39WriE03Dq/izlviSvI1lV/vlH9O/EwrznJ13zClzAakOAxV2Nl59gq0HJDPe913cPFBG/aWhjFG6umYXVcEpINTXM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(16526019)(6916009)(86362001)(66946007)(4744005)(2616005)(38100700002)(498600001)(38350700002)(6512007)(52116002)(8676002)(5660300002)(66476007)(186003)(36756003)(8936002)(26005)(4326008)(6486002)(1076003)(44832011)(956004)(6666004)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0hwX0ylPFpk7Os7JhDZby0dl7oAy5fMF4TBHbmEGrl8aGXigi6Y3GaKB3mhK?=
 =?us-ascii?Q?69x8Z/lv8Wy6IBWxRmleC85t69E3iUr/b5wHQhTMyutUDkaCWF5HvnrI99Lm?=
 =?us-ascii?Q?ox1i5gC2pdPjnUc85sFpGnn1PeWcZadPt5mY1b8boyeSwXiM2ymqaRb0uAEd?=
 =?us-ascii?Q?iJM6XdCdU0ktAefgPdkfoUmKY7BPxjqnPZyIPbR2dRWL7lqUinrmt41xVJCo?=
 =?us-ascii?Q?qw/Q2oUc9OKQ8EpAJ3ZL6YJvuLf8MDmZ5UzHfFlppYYu53ut0cN+3/3eKUKE?=
 =?us-ascii?Q?4ipT4PF8YCM5hdeVrPnGrbwF26V9XvdmUpLFs0XSyHeptF5QBdp8antPk3SL?=
 =?us-ascii?Q?UF/dK2djcNyiwIGyKNoZAe3V1jhdA3L0l9tYo0+Uh34bhOT4vyFWgbWGFhV0?=
 =?us-ascii?Q?/y/Ezt89KdZOxH1oWG5EpYCkB1RzsRTvzmZGI8Zn4lUhzCSqoiXHdNc96fz5?=
 =?us-ascii?Q?2gU4c4yny7qrnHZeESCYnI3twN2U45OYUyZPpSQilfqejMcqQiRmqhgqjg9e?=
 =?us-ascii?Q?xdgE+h0pYGTNPiS7R4IHufDD28Szz+aiij7+CrumHbQqKfeHzm0sREjsxNhI?=
 =?us-ascii?Q?zJt6w9/lmTARklZtDMTf1o5b/uJVTBTYZU2A3Voxn4ufZ1gx774F2XSM5xrN?=
 =?us-ascii?Q?mzN/a39QNBjTxZ+bntDh+utHMNlRjm+ETJeW5xZLOq9aAnU5zZLaa56cOlJJ?=
 =?us-ascii?Q?kj0r+VWAspwmV5ACXyciFU1pc6b+40RUPbDhKCitgYd1dkBnSMoiYp7PKBx4?=
 =?us-ascii?Q?Sjdus+JLLNg471iqtaDGpQvA0/blQcTrWIKH4rQVBnSWof6GqjNwzydccSWn?=
 =?us-ascii?Q?ixgqQcrqGtOXSHUWV4aZYol/kVXNn9fT6/mtQrY/8AN56qYLP4zkuMino8zA?=
 =?us-ascii?Q?j0MHvN7Vvhl1ltNlqaQt0U4xYR5inA+FOXK7sL5qu/FvumrcpHfQTbCdDBv5?=
 =?us-ascii?Q?7cHv3JiZiD7Dzy8zI5GsPqcONvPQdCf+/ECAkab4LMTEFoxaOOutFCwxWss9?=
 =?us-ascii?Q?FD43huJDI9qtp/7P55a7RKwRn3d9hUxOktoizFEyTeGR4nKAzww0xY2F0sIa?=
 =?us-ascii?Q?+RlqQh8nQ85rO151A9vq/zZ+rqPdRol4GnTzhN2tZVs58CH+jFv63t62HbMD?=
 =?us-ascii?Q?9bQ/E/fJGQmA0jjQi2fZ6w4qW4rERv/7+QvvyDHIUyB89KcDuIpVZtq756yZ?=
 =?us-ascii?Q?wCICX70u7z+hgJnVW/CxEj9FrtC8lU+7Km8dHbu9yGya6XqVzgjVO+1dKywH?=
 =?us-ascii?Q?/KaLmmSN7EV5RCIKMSUIzOE6J+810zFMlhVQEd9eR/n466UOzkTGyJqY+UJe?=
 =?us-ascii?Q?XvlwzlCu1cFcF43htB9VAZPu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73443fb5-49e7-453f-dc72-08d92a8f6905
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 15:09:28.3453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7UgAcOepOEhmml5P09BH+cBZSn9iz6C6VTooideQfkbHg/vbJxbwFgo7+9ROau15QJCSV+6Qfdo4mk3EgPS/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5085
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
Cc: thomas_os@shipmail.org, Nirmoy Das <nirmoy.das@amd.com>,
 linux-graphics-maintainer@vmware.com, Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ttm_bo_assign_mem() expects bo->resource to be free.
Fixes: bfa3357ef9abc ("drm/ttm: allocate resource object instead of embedding it v2")

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index bfcf31bf7e37..7281912436bb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -733,6 +733,7 @@ static int vmw_move(struct ttm_buffer_object *bo,
 
 	if (old_man->use_tt && new_man->use_tt) {
 		if (bo->resource->mem_type == TTM_PL_SYSTEM) {
+			ttm_resource_free(bo, &bo->resource);
 			ttm_bo_assign_mem(bo, new_mem);
 			return 0;
 		}
-- 
2.31.1

