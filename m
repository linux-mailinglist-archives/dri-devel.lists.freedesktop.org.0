Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E0E2D50B1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 03:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5874E89B11;
	Thu, 10 Dec 2020 02:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700072.outbound.protection.outlook.com [40.107.70.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C94D89A08;
 Thu, 10 Dec 2020 02:14:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CN4YobxiuJpV+z5MrYctzXcLRcwTXhlxqVWCzDsssBLYmlP7+RAdR7RNFve/N+o+ZQgueD75rrbqIxALSq4n9HXCVksd3vRS6Np/o6wx/eKxqsKUQ0RPg+2DV8hx91TSzLBB4RjubGHjKsI3YBm3sqALM/JnWAYBbUL31sMJwuIFtvr5La27Zgx+dii8ddH6VD0C8kXEQlhvRWXTWT/gQkeB0dZn5QgEd32cPg1iZjKX820RlcaL6GiF4yeSX85kVfBbjnRDrk3xlGZXuFM+ylbhugZ3zQ3kmn6a7EFzhITtQ65Qhs5fMK6mec3sDE7J1eeD/e8/zMemIdy2rmjqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7+A+G+w7VJKtZhSl1xZodym/Tku10zV2CRkjB9BzEQ=;
 b=PphzNTvFeMleKgMyqsYrTyDtAWBjrNfF/hvj6B/+uS7P3zqPGvhxLLk2PD4dIKFoZQYfxM6hpCzQTA4dTvC6r/9M7VahEndnG38cszsrbMEyO0frT2UALtEY4sJdIheEhYWlubdRdhJc7KaTpd2Y+rZltr2doqJvUEqNtoDNv6Kb/mX7v+6O1OK30xzjDesz4OjJlEyvGgG5Zk41zlmau/wzGr1nVJ1ZGTmcopUfw9yA/9sXXlc97jwxd/lJGn9AwalrUjMi+6CdmNefWiLbzxD+uohDNuPGyy15JYA1GxbEPyZSNcyO5Mp4qxmcyrnSAO4EryhuZEuIVZ+6pLAjDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7+A+G+w7VJKtZhSl1xZodym/Tku10zV2CRkjB9BzEQ=;
 b=KJmlww5pMhcXiAtNrehC4DZLfcJyWwy9qCYT9EVNUB1xaZoeFRW4Dlfz5T1h1hqfwaThLrQX9/inA2zG+tmgl0GKZQH9B4szomedLW9502UGo+uvsr9UskRO7OlyCdlET4FXYZLPwe9btACrLabgLm6fo7xhetbzn9IMzwfL/7Y=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR1201MB0217.namprd12.prod.outlook.com (2603:10b6:4:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 10 Dec
 2020 02:14:52 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3654.012; Thu, 10 Dec 2020
 02:14:52 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/1] Timeout handler now returns a value
Date: Wed,  9 Dec 2020 21:14:37 -0500
Message-Id: <20201210021438.9190-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.29.2.404.ge67fbf927d
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::15) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 YT1PR01CA0136.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 02:14:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b219ada4-ea9d-4dca-fc00-08d89cb160d1
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0217:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0217F66C863ED3EF4AAC66E799CB0@DM5PR1201MB0217.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2sDLup11V8gktvXVxYAzWDfd08cDCjJjyX6Hg7R1dlaReAMRcaCP0m3Vtgpr9HfO7i7A24UFVSC4q6/E4QLpkFt/X3rtBM0GzE0mMEeCc614ri3K2I28WlmPcOozF7tH50+BBEn9loQ0MV+lc6b7kQ3dyDqz2wQE3K6mHQIJQuUuwTqLDGxRhxdkL3g7DUbcHArGLO+Xn648jooNy2/a+KxRlM6WYHgHxYnLZjWssXNha7g7NbOfpodqWMr+1uu0uc1p1k07pZt1lzOigrkrVg8kBNlho0xFiegB/pBWkapQwQ9GgDpxOX98hiNYzWIVK49UFhjnD7YwMFodaPmBNo+kewKsHuylr3cPCKbp9dQm274QA7DcqjeBXDbBriJT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(7416002)(26005)(8676002)(52116002)(66556008)(66946007)(956004)(8936002)(83380400001)(7696005)(2616005)(36756003)(86362001)(4744005)(16526019)(6666004)(4326008)(1076003)(508600001)(54906003)(6486002)(186003)(44832011)(34490700003)(5660300002)(2906002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TEhMOERNdkVIYXhvV3J5UDN4YXJDOU5ZMHBKVHhzR0dYeG9QTUdDbms3QnpT?=
 =?utf-8?B?V1hBSnN0VjlNRTllRVdLS1VpT1ZrZkZ6SFdjeUF2NHVENkEvSy9sQ0s0M05B?=
 =?utf-8?B?V0pBdDFXc1NOSC9SS2JFRDF6cDJsQSswbGMraU9YcGxHQUJ2cnJySmk4eWhw?=
 =?utf-8?B?NTBEdmtlcHVMTU11SldqYWx2MjZucEZLdFJGTXpPdE5tbzdIV3QxM1VNa1lF?=
 =?utf-8?B?M0JHTVhBZTEyQzdyeGwyT2hFVFRGSERweGRuV1hYSnBZaHNpV1lTMS9FM0tP?=
 =?utf-8?B?bHdBNW9Velp2c0lwVmJTdGtPNi9sd2VXbVNrUjJ2N3ZoS3Y3UjdTZCtVT2hK?=
 =?utf-8?B?eGltdDhVdDJZaldCdGhYeTR0UlhSY2s4R3d1bmJ1U1RKUFJwVkRZbzdiTWRq?=
 =?utf-8?B?VWs1a3A1YXBPWGdLVnZYNVcrOFIrRkZmMVZQdUVjdndRQ1hYVDEzdlVaZ2Vy?=
 =?utf-8?B?SUVVTVNlY1oxNHFNeXN6RGJ4aWFBSDZ4dVJGN2NJVFV0TDhxVFFkMG5YZ0hR?=
 =?utf-8?B?bXQ4Q1krVG05dkJDVldnbmdEdTY2QjlqeFFaQW1XM1A2NmJRaVlSaWdpbnJ0?=
 =?utf-8?B?dXExTEZ1aFdNSmxBNVBJMGI5S2tpTGYrdFRFVlIxN2ppTytkeDFmU3lSNU16?=
 =?utf-8?B?Sml6TXphUXlyQzkxdE5VUWdMT1V5YzVscENhUE9rN2d1L00zdkk0QU5weFVi?=
 =?utf-8?B?cThXSXRnMWtISjRPMzZ6Zk5oNXdGbmV2TlVFUkFEcWNQazFUdG8zMlZMTjVj?=
 =?utf-8?B?NWJZRzJtN1lzajdqUkJ3U0xEdlNRMXpZZDZzK0V1bGhpVjRBVHBsRXZLd2hp?=
 =?utf-8?B?MWNlc0VtNzdUbGpzOGtHay9XSHpwb0puQWVJQmFENUx2NEhoeFF3QUVNOUZX?=
 =?utf-8?B?UUhTQlA1aG1GM2VtUEN3cVRtb3QrNXhyajdoNUNPS05wZjdma2JUTnZpV3JW?=
 =?utf-8?B?R3NSSHJiMjNwSWxBUWsxMStDZGxpcmZtd1pjeXZnYjkzQ0l0RmRuNFBBK3d6?=
 =?utf-8?B?bXFiNkVSSTFndCtJdlU4anZFOVYydVhnYW43UkEvSnE0SzVRdFRBMzExencr?=
 =?utf-8?B?N3hMcmNjbEdQZ3JZNy9YNkdpZCtQejR5NGRIeFU4TmpjZ0FxZXdJckhpRVJp?=
 =?utf-8?B?eFVaenhXWEwyTW1PTXUrTm5KL0RuRVRhTXNiYXcrejhGWmZxcHFneThmc2lW?=
 =?utf-8?B?VkIwVzkwdXBMd1pjRGNKQzJLMXRlVmlMMWZkaFdUOGw5K3dXdmYzVzVNV2Vq?=
 =?utf-8?B?RDFaNWh0R00rbUNGWHMvbTFVdjU2ZDhiVVV6RFZxL2NVa3FTU0JHZUNkcExK?=
 =?utf-8?Q?2ZZFQlaqh77Zcb15yUSymWPAMSLcnBFXVG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 02:14:51.9664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: b219ada4-ea9d-4dca-fc00-08d89cb160d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDA41J5BtvK2Lgm2jetKEYuBAMKoCXyKJWDE8ykQayUCrTd0AgDJniJzv6quCW8R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0217
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver's timeout handler now returns a value back up to DRM.

This patch doesn't change current behaviour. I request it'd be applied
so that Andrey G. can take advantage of the value sent back up to DRM
from the GPU driver.

I'm still working on the last patch which takes advantage of this
patch, and as such they are separate works.

This patch can be applied safely without changing the current DRM
behaviour.

Luben Tuikov (1):
  drm/scheduler: Job timeout handler returns status (v2)

 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  6 +++--
 drivers/gpu/drm/etnaviv/etnaviv_sched.c | 10 +++++++-
 drivers/gpu/drm/lima/lima_sched.c       |  4 +++-
 drivers/gpu/drm/panfrost/panfrost_job.c |  9 ++++---
 drivers/gpu/drm/scheduler/sched_main.c  |  4 +---
 drivers/gpu/drm/v3d/v3d_sched.c         | 32 +++++++++++++------------
 include/drm/gpu_scheduler.h             | 20 +++++++++++++---
 7 files changed, 57 insertions(+), 28 deletions(-)

-- 
2.29.2.404.ge67fbf927d

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
