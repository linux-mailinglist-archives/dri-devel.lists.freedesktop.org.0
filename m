Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5FA2A5CF7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 04:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C6C6E928;
	Wed,  4 Nov 2020 03:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822246E926;
 Wed,  4 Nov 2020 03:11:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRyb3vabPe2MzNEgK9taLTOoDEj00GRRsnRd304IP8uDlYc1VlBAme+QGp2cIDKDUmcL9w7pmg40iyy667l5Uru0UXBK/x/egnetABygc/qVsn2WeRTgqiQegxnjxWxxCbriw8daLgTVM/E95UrwprJDHwXcUGoltKCkgIwZ4xMGdykwq10MBwSJ54qhp4D7Il8E9avOQ9culF0Zi63+aInQH3EgAquvSq0qfqjvliK6aq8kdK81VugsAIyL6FXXQkf0KTERFwVsDqjdD+7C3fUIvlhNglPMzXdeP8GRXiC4GuwyoBzXESJPviMJfpOGS1jBrLypZ/9eklbeuKl/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bbmmpdk9GSGXwlEcK7Dr+GhIhQI8nJUHFaQ7EyRbRo=;
 b=PGgEesfsC2UCbUIhuiZ0BJksQI5H86Ownt85dce+Hf0k4sL1+5+p4TUDOCU7zMJ9XcVb6Q9h7nwp9wHAcpMWxv2F9Vx8chNs5nI6/p10VX1n139+2GMitZ/nWD1v3pESiABOQV1nvW4tqIhk+qLeJh1kDrjZpkWz5q63k3RMdvqQ8Us6lMFZlOJWr7r5clFkYm8xHY5wSIeoOoBQ69cFHfOPymPg7nRnTIgur0Ask+GXVKkKVOIEoftz+BgzlCOmJfGZgqVxDs6E4hIvZuOUy4nLs+5qYSZk739qDKsdSKeB8B/aLQ/hrbkjq2uEVkpkCIdhPmI0e+/OdxIKEZ/Ssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bbmmpdk9GSGXwlEcK7Dr+GhIhQI8nJUHFaQ7EyRbRo=;
 b=ClgVOMur49uuJl7G+EQ6PIafZTmYmECRVeDqmnhr6so+EKUpB7C4DmCr7brl5VOqhftkV+AELZ43EekO3HQy2LptKdpjQw+keYjm/Pszpe/pi17xEiFV/Dw/KZv86fZFiDPMoN20CO21ZzNKQt04SQ7s+nz7OHJKbCuJtj5XtGA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR12MB1770.namprd12.prod.outlook.com (2603:10b6:3:108::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 03:11:46 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::935:a67:59f8:7067]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::935:a67:59f8:7067%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 03:11:46 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] amdgpu's drm_driver becomes const
Date: Tue,  3 Nov 2020 22:11:27 -0500
Message-Id: <20201104031129.361178-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.29.2.154.g7f7ebe054a
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::21) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 YT1PR01CA0082.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19 via Frontend Transport; Wed, 4 Nov 2020 03:11:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f213242b-dfbc-4915-b31c-08d8806f5caf
X-MS-TrafficTypeDiagnostic: DM5PR12MB1770:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1770A0AB5D1644F63F7CC6B199EF0@DM5PR12MB1770.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yQ4kAB5q4RjVEy9r7MrIPSmosOLt73LFsF2gch5sGcGHF0oTOL11LuhF/SgOBhpUWGNR55V4UR3a7w77G572SILqzBHpiBg9SSlFKf3e7fQ4PZz00rHYQEJibG3uoAOitQl8V85SS9uJkMUh65Zw+PuzMo20weOPwnoCLj2hwABkfSFKfG77ou6vkOSQfbihbAUIAcbefCnkzhHU2kpJ4EZTxn6eP+MYhO4tm3eyIEs8PctcfakF34dwJQPjkMXBj7WorBUlMLUdm8rO6ttRmUWtratB+Bu2HXhFlyGXs6TFZf3xROmcanGYMY14dmVR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(5660300002)(36756003)(186003)(7696005)(2906002)(44832011)(6486002)(16526019)(6666004)(26005)(478600001)(52116002)(2616005)(66946007)(8676002)(86362001)(66556008)(8936002)(54906003)(4326008)(956004)(83380400001)(4744005)(1076003)(316002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: RdHqY88wI1Wq4iGWUebsCe2hcDIOQKPQj5f3p3/PBqKvkcyYJWsLRIV2vmR6RmDgZR7FECiaPRAyvHKtCHQ8jyL9DpGct8MtK9ewLNs5qMEEA3obDQo99E/6ySFawgnBolQ8NT3OvYdjRQEPflJDq2Z7NQMvYYV2qQ3GkodDOllRj4gkJTisM9120hgOWQqO6lTGJL3MGF3oNz+DzO3Phtq1Z38inTAnu894CNabVzsEzfu79wjCuSkRlFD5typACrUtjOTJ6HkwsK1SDvpw7GSzsK4Ee+0kDrU+U20YIx6cHugQ1pvB8bLVLlFs7rFwRofpxUmHfwVgdRNrc3PxhFpjum2IimE5Gh3ucj6/WW7DQA1TLUoI72/Ai4xq+Mh1aqtU8yL8Vb4rtO94m3DN2YY/c3h0q0tftn02iVVIKWWjnZjjYJQ084Cw5KZH8vz49SatONPbi2uiZVJR+rb8Wd2ZE6TSvCjMAICgRLWap1yBaGyrGf3KIOpwhtyvnu0KGle1d8kjVBXIme89VDIYUuRuf/cC3NGhz0PvO1/8mHWOfsiuv00md0xuCb8TAfnMDOOebH4CxaNPl61Z/Smvjtwp/xoaQLio39x2HLrkUeFpy7aHocoDxH2X1aHKtttt0rn2Ol61CowV7bbNzs2rTA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f213242b-dfbc-4915-b31c-08d8806f5caf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 03:11:46.2086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfVFoXfDdfdG94pZwc8MJu/3U2qVPIn289ZZKUDWX88Eml0FKY6WIQOQenFjkyo0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1770
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Luben Tuikov <luben.tuikov@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

These two patches follow up your latest
DRM work to make definitions of struct drm_driver
in DRM low-level drivers, constant, in amdgpu.

This set doesn't descend from my previous patch
"drm/amdgpu: Convert to using devm_drm_dev_alloc() (v2)",
since our branch doesn't have it, and I can see
that your const patches aren't in drm-next yet,
but they are based on my conversion patch.
Perhaps you can graft these two patches locally
and dispatch them via drm-next. (There'll be
a one-line conflict, namely the devm_drm_dev_alloc().)

Thanks and Regards,
Luben

Alex Deucher (1):
  drm/amdgpu/virt: fix handling of the atomic flag

Luben Tuikov (1):
  drm/amdgpu: Make struct drm_driver const

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 32 +++++++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c  | 25 +-----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c |  4 ++-
 3 files changed, 32 insertions(+), 29 deletions(-)

-- 
2.29.2.154.g7f7ebe054a

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
