Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC963704BF
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9AD6F61F;
	Sat,  1 May 2021 01:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3686F61E;
 Sat,  1 May 2021 01:58:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mW1f7TgUOBov/ZrJO+GRT43ASnA06uhJyxp/zIW8MLa2QV3cgD0Gl6XlUC0WRUtXz3z3qziAF29037MEw2Lmw6QSAbSSMqlWwPJPcwKHdMssHCfr6UjpI35P8Nxx3IRzPnne1LEHGLgubyjdHUXYVch+oieKq3dQ0s1vWz5pxPzAYwG3pdOu83nPL5EIKLLjOdhltwQZuSv2usSHurVvJ24YvtIltjPS5zlyDOa+d7I+Jn0XjRMYkDaO/0/ZSNTP1OG7+NzfCu3feimBU/w9v9/BcksqZXLQ9LksmPFWfpVNTBc8xC/0H3bDi2S/yC4GY9h2pAA42S0NdHEORn2p5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WD7VWQ3pj0w4KpbOcExTfBatHLSqycd4a2gs1m0R/c=;
 b=UQRO7p6CD8GrKcR6bgYlhKt2qIhjAgo4ezLfjfDHzOGfBDrs6ifuLLalyEGykYKYFeAlopI36ULxpjabvzzKfAP/TGgJE44gNcv+ysMwpzHhjyRCU9+p5ANWKLy6cKHrHp9HFZTKlkxjL8gYGCc69OlOWoNVrt3zk9Af8KJAyzMHY3U6ghSdUOwxRkM35C7kD5+w4ljI9fxSJAQG+VUM3jLRhY9pa2ucNRzhmyt30VMSj4ctdC/7IASCbR/bl66mhSf4GdvcBNTie1G+WsrmCPyhUxZ+8d1zZ334P319v28ysNeZ872qjiPXPj/NDrMtNJWuj/h9nJUdvhhSoDS/Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WD7VWQ3pj0w4KpbOcExTfBatHLSqycd4a2gs1m0R/c=;
 b=IClecwmQp1rDrRQJibkGkXsLBCuy+PDiIoBAOxKfL4aehqGKZKf9AK/+fozZJUf+37V3zXHqmbicp25RA7v5oWSiohHNK6PJ1RvCor0p8BFkM7eV5x6msP034+JW8kvTNUYF35rszG/OGn4Rj/WZzBP5fqOUf9konnisCcY4cy4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (52.135.46.212) by
 MN2PR12MB4142.namprd12.prod.outlook.com (52.135.51.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25; Sat, 1 May 2021 01:58:17 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:17 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 00/17] CRIU support for ROCm
Date: Fri, 30 Apr 2021 21:57:35 -0400
Message-Id: <20210501015752.888-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::6) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.54.211) by
 YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8e57780-3e7c-41d7-4028-08d90c44969a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4142CF54F9C5ED051073F6A1925D9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R2/A2rheOFcCA6/Y0DPVDTWwsi+9vYHQEy8fc/9TuvYw42OvGXxm+8Qkm4Xne4kLvxjLBWhqom1TTSdH3NQESsUTPHCQO0cY9jcIpVsPHPLVjJV1TABhB46Mt7h+QBYwBRX1hZyQL5iQOWHaciD3YhYwola8DN56DppFO/ZT4RyHIopv1hwY9CeJ0qJz/RyVHpH7ZTacw17W1UpL5Rh3vtrl2lRJva74aFo20yRYJWpbxtwI846y5Ly9s2Gf7DFpttUFwwRmFcyRAbz7/8GF23JE/hp1XTh0WPS0oVXMlYQfp7LNcaP5txUkkW1VXhBwzUZj3iIZo52BwEH65oNpKZ1nMBPBuMJC19MgUrljJtDiS8rTGizh/euL8maX2kGeBi84Zzi/2vPHz+gD0t3Gk+dvaWS+ob4FMzrrxIOi05MEn4ipyukShqCyBPIG+9kiBAA0/77OfiexmWfx/wsD+Cq4kn+LY5BcqNAkEUTN/Zr8fU7t2DWRYRAvQo8tTO6p2Zl3fiEO0zehe1XC3VSlcfI1Cn50Vc0Xa2wE8C24yMI92Fewpdqt21yh8fb9/LiVKln/aikpz/5IKDd3864yi9fXsptGdGIJKHZ476Q+rYnv7qFL8MrhwTpbWh0OOT9zQNxpRzxEH8rIg3Ss2WBoiSi6iE2aMNyFzHm0gKhNBzUFyS5S8bWcjQpLXkpSrkGWR2NaavKACFgr7c2sDhtBtoGNtxv+h/ww6aUMCx8lqMu7iIA4heRTcVo3ZWaDT7OpRAKxfdUbm2E0sdrRQvqUSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(66556008)(6506007)(2616005)(66946007)(66476007)(52116002)(956004)(38100700002)(6512007)(450100002)(8676002)(8936002)(478600001)(2906002)(6486002)(86362001)(26005)(186003)(16526019)(83380400001)(5660300002)(1076003)(36756003)(966005)(6666004)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?r8pbuflNfR34cp6F5jgurXLNpGleMLuHvlU8Ath29paf1GlX27/nQw4z5pIh?=
 =?us-ascii?Q?JIlCc1mmlT2Pei/ttpRxQmagHbI4aHUY2i8RCvt8F6K/Ju4iu5YvKYoX4MxU?=
 =?us-ascii?Q?e+ZtaCroOucIRDUimvEeulZpTTBKBKUV0FoTxEnph+cIJ8O303FTJ1pkcvv5?=
 =?us-ascii?Q?VkNGQQ/6f2RPXoNHOTWMsCrUlwm9cmx14zzzrqB1jkXxH4EeTqeriVBvNmec?=
 =?us-ascii?Q?4odrzE9+DbuC3CqqNXDUMPoGpmaLOUyRtevYFMMHq1Kz1QBZfnULSzk2wdNT?=
 =?us-ascii?Q?mDnniGiSssoZpA3VKRzo7ZxSCFBK2HrMqA/pH2TEfbYtpk7DrnV7kqnAb5A1?=
 =?us-ascii?Q?Oxt7uDif+D+o3zuIdBhe08h1ZAmT8FJinWLXELRTgdyMNrbsroxRYwhjI4Kz?=
 =?us-ascii?Q?RY0TiRI0aqq0DWA8vlSkmCd41E4hzdfTLIdWKmzYj2m6rAHhoYkrRG/smP4D?=
 =?us-ascii?Q?KemXff0kRjkZ6IVeQHuqo0TIAHXsyuOXVEPvKDUYiROmZB8HdOSg7Ar/U8mK?=
 =?us-ascii?Q?HdNQUKO9a959JySiMGEAymTUzWEbZwPsP/Nm3qjCJeTfSi5heNx3qDLyFR9C?=
 =?us-ascii?Q?NfvLutR2nI7PYlpp62pi+t343puJjXB2BOB5lPZWmv6KkY7P2ribYd7X54rJ?=
 =?us-ascii?Q?cI9xIYFevoEYrOmw6gWzBWgBYT5VJUJhUAhOQzXpphcp105wpXa7F6+mzD9t?=
 =?us-ascii?Q?9gAFyAJ+aPoPhsVfk/ymtHI7bnxYQI29CxV0BIa7Zu/AxR6lPccy+EBA/1xv?=
 =?us-ascii?Q?2qY4IQc/TLEVliove3eokAeTFoHeIc5UcvjNKNQOLpxKT9r6sh1yGtZeMQ2I?=
 =?us-ascii?Q?GRiOOLgNiyCZQGkVNv4UowyAcr4TNXQB5IDWe7jqwydb+wj5ySyoKRM4cWxa?=
 =?us-ascii?Q?8QKmFZ93CuN8RFtirZt5hCWNV8402DRVeXaU0eptC7WRRHfJgUNfU5gIoNal?=
 =?us-ascii?Q?/69g75lDzjRKOC1TQUexX9ReWT/whtKw9MT1ikifH1AsMEMgbvb3B4BA/zlC?=
 =?us-ascii?Q?Og487EAGY104lN1lNsugkdVuMn+Cou6AOzApf+yqpnSj36ZpABZe9EbfjhxP?=
 =?us-ascii?Q?Jz+srovsN38Uof2ZKLsDkWyOj2H3auPsw0PYpjtggBEGxiSukclRo7O6fKiX?=
 =?us-ascii?Q?g9uLKLDcIssCMb8gE+6/wE3cm0J+3ALlc91o2qLoLdoUVJXThj5co+Duodhc?=
 =?us-ascii?Q?aQVUEmsWoN14Ig1MheVQL4N314IwInpFkvdEK3fDlySPHE9bqsfqbkPMwbTz?=
 =?us-ascii?Q?tk5hGPPXzmUqAy3ATe4cTnNedsg5OllZjiWSJH98HjxNeq6mOmfNx5eSZYyO?=
 =?us-ascii?Q?7jbt9rmaugOys0IciJwcKbyd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e57780-3e7c-41d7-4028-08d90c44969a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:17.5219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swAHU8zCH/lL1mRD/ZJu5t0ozyBZjQGf1p+VR5v1P5zvNB3lwOp5tnn7m07bYKnmeBeOB2MNl99N8oPJgI+O7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series is a prototype for supporting CRIU for ROCm
applications. More work is needed before this can be upstreamed and
released, including a new ioctl API that is extensible without breaking
the ABI.

The user mode code to go with this can be found at
https://github.com/RadeonOpenCompute/criu/tree/criu-dev/test/others/ext-kfd
It will be discussed with the CRIU community on criu@openvz.org and
evolve together with this patch series.

This patch series is also available on github:
https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver/commits/fxkamd/criu-wip

David Yat Sin (9):
  drm/amdkfd: CRIU add queues support
  drm/amdkfd: CRIU restore queue ids
  drm/amdkfd: CRIU restore sdma id for queues
  drm/amdkfd: CRIU restore queue doorbell id
  drm/amdkfd: CRIU restore CU mask for queues
  drm/amdkfd: CRIU dump and restore queue mqds
  drm/amdkfd: CRIU dump/restore queue control stack
  drm/amdkfd: CRIU dump and restore events
  drm/amdkfd: CRIU implement gpu_id remapping

Rajneesh Bhardwaj (8):
  x86/configs: CRIU update release defconfig
  x86/configs: CRIU update debug rock defconfig
  drm/amdkfd: CRIU Introduce Checkpoint-Restore APIs
  drm/amdkfd: CRIU Implement KFD helper ioctl
  drm/amdkfd: CRIU Implement KFD dumper ioctl
  drm/amdkfd: CRIU Implement KFD restore ioctl
  drm/amdkfd: CRIU Implement KFD resume ioctl
  Revert "drm/amdgpu: Remove verify_access shortcut for KFD BOs"

 arch/x86/configs/rock-dbg_defconfig           |   53 +-
 arch/x86/configs/rock-rel_defconfig           |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |    5 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   51 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   27 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |    2 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 1445 ++++++++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c       |    2 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |  178 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |   11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  163 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h  |   11 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  |   74 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |   75 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |   86 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   |   75 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   72 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |   68 +-
 .../amd/amdkfd/kfd_process_queue_manager.c    |   68 +-
 include/uapi/linux/kfd_ioctl.h                |  110 +-
 20 files changed, 2304 insertions(+), 285 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
