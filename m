Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F16536E23F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 01:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9ADB6ECAA;
	Wed, 28 Apr 2021 23:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10546ECA4;
 Wed, 28 Apr 2021 23:44:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/ZOTFf4u5EsTWXkiAAKFNs0pUB9Hu0GIvBkxUf09GziEuTwIZNToY63yAUMy3bVL7A1rQV8ZUXVHfjUXz/aQKt6xhrak7/oOwynKHymt9xi+bLKOZqoge4FBqqFbjnT0d4MR5qc6WROM+GZNnDO7/M173cc8XmIxFJzg+w6YxBewL25XwY/uATr0DKEW3YKUFm8A8XAJRenZTKpnKBK86CDN8b5oeFHUb3c0n/bWvGf/Vs0aTGEGceZcxqfVXmeyRfbD0dtIfqLEj2+lsN0PxHVkirlD/7cOWjnhYoCHQ+dYxtTXPEZJSYQJacv+M3goLcqIrh5YyLWO/qzzQbl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdbKIpAIjvFl4eNOCtaFNMWHGgco59K/tNYwqMKAGgs=;
 b=FYbZ5vRLoTbATX/XAAo7u5F6TA2WkMvMNiM/2vR+4cBxzWMKnWCvl6BEp53FhHjUc1sJeJwbPnoV5ifwAEM23vKubJojwQTGU2Qx/F3jKi/6PvO35cpL0Ejgm6QfhgykpL0UptZKbeFQgXBL79QJ6G+kYBwC2GWFcMIIFS2XNJ1UFGtNCEvcv01kQpORnyIM2tLzod2mNi5/OvwXEXP5tg5xNtB5LAQcXEALLRMjHwNjJ/p8VeM6bJWxnhGrimio7mEKMVFwOXmyQ3hV+D5ThD21gPobiGWrj3SyNOfVX90IkN+/n4+HUG9aQs7FfqDebM4MaZPRMq8ZK8BvyaT8KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdbKIpAIjvFl4eNOCtaFNMWHGgco59K/tNYwqMKAGgs=;
 b=l9UAZrg1MiT88qAGUbtMbaATXCX/Uhcpx0ETCAfMsAVTWQq4TGMayNUfyL958s/H2eRhOVu2X/rAwr/aBNz8AltBZRSSQao9wG4McdJ991NzvQ9xqVo2ySev1Hk8K1qVG89pROpQc6+7FkJAy7Xx2s+Lqn+YV3m5eMgcodGcMpQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM6PR12MB4220.namprd12.prod.outlook.com (2603:10b6:5:21d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20; Wed, 28 Apr 2021 23:44:02 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5%5]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 23:44:02 +0000
From: Nikola Cornij <nikola.cornij@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v8 0/1] drm/drm_mst: Use Extended Base Receiver Capability
Date: Wed, 28 Apr 2021 19:43:45 -0400
Message-Id: <20210428234346.1085977-1-nikola.cornij@amd.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::14)
 To DM5PR12MB4679.namprd12.prod.outlook.com
 (2603:10b6:4:a2::37)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (165.204.55.250) by
 YT1PR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.24 via Frontend Transport; Wed, 28 Apr 2021 23:44:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dac85ace-cd41-4d01-91db-08d90a9f80b6
X-MS-TrafficTypeDiagnostic: DM6PR12MB4220:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4220B40946A9FD5919DC31E1EE409@DM6PR12MB4220.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bzGPo2FZmhKe9Az4mt/P85SzcDDFi/x1k7vLFiHa4TMowvkMqgYg2woUutd4Saa+llMivn9QZ9x8jhhRLkd6vBXSXNMjiDMSKKaybJhEWIU6uvzbdr9WluLxbKh3UgBGs0G71vGFy/gGF7E0KTNksX7MliuS9ccB04cJmOzkmHl1/PSrHiBvr1ai6KEaFt7x30kRMZ5Y9uI/mGxoB1MoTEBuU7JQqceysl54K9RNgPLYbXjHYO9WSmPKuohk/HqeET9ZSYsI9kUhhuQK3xPWeRO7Rnb9o58WXOU4154RQJE2XLm5OvXAZodXheE79QH2Hw0tTHk3BnDnqimGixmCI42maYlxlrP2KkaQxFbrUQ44ckquWB03gzOVAUHovheN67XItJH3uBFu8cZ5mT3IbMKTepHONcHF6i88QVRj86BSs0BMb6P9YN+BPjXl95N0ow0ZFDUOF8sMmKwDU5mUb08Jqd3RHhRB8YdQ/VNGXVBaC2r9JNedBJU6hIqMbcdj2a402FIAbxFLLbK/RYNEyOkhlWxeq0aICMIWnikIivYgW5RqUZ0M/QZ1LKttl62oEfe0wUFXPlhsiUJeAPsD7B4sCke7vRnX/NLHIQpGI8GL/fkTOiM5P4h/aaX23uODyCOJ5UAK3/tgkzfZ9WlvgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(38100700002)(6486002)(38350700002)(86362001)(8936002)(6666004)(66946007)(66556008)(66476007)(4744005)(316002)(2906002)(16526019)(6916009)(6512007)(83380400001)(478600001)(8676002)(186003)(5660300002)(956004)(2616005)(1076003)(26005)(36756003)(4326008)(6506007)(52116002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3o0cQoHG4Ly7aroEsDwsQ/A6hHHjXqjo5ldIYsiJd9cPpnUbAu8OM/my5a0O?=
 =?us-ascii?Q?1sB5/FpTApomdQrpUcK+gmnBj1NiugLiF6dGn+OBD95dQXkmswlP3fXNx5zD?=
 =?us-ascii?Q?dEEwtXRlWf2mjyuGy4gPuaKrqb43wnSrQ6s/PeYZgSDVdBTcAB8y3YBOkA/U?=
 =?us-ascii?Q?dqraI4fkKOsDmiw0qODEoDuSGWjd6PQpgLbgg3wXqEWKCUVS9mpimge6Ghgg?=
 =?us-ascii?Q?YKzR4SAa/Q0S8eFq/dsBzTALWRz3wRRDILzHRGMWTWUDxx2rMbyvkrfhv5fM?=
 =?us-ascii?Q?O1z7SEetetCOrwQBE38e9Nk2ront+p5CU1xDt1R8xuAQ+9f7uj4JUsAS5JVj?=
 =?us-ascii?Q?lARiDmNZRY0PUuoL/UIE/V5COJQyvi6HOkIzDgeOQN3GLqqK0wibnIJ4o8eT?=
 =?us-ascii?Q?wzRktn3m71bH2o5LXU9tYEdxfjoX0/D9finzgPol2VFIQUYt2fQlei1OPD0X?=
 =?us-ascii?Q?Ou923+PmDUTu3hs0foH6bnGxU43LTjmUFhOIo+BRmh1vMcafCuAre0lLx51P?=
 =?us-ascii?Q?v7jxGjcbE4Efji9ihhYIR9XW8KSKW5ESmnEGK0yjh5DioOXdUJIkOik9458/?=
 =?us-ascii?Q?WDfsSSpOKNsD+4Mk/MXKoZzaqOrbSOIcXeHUAmnvPeOQ3T9uLg9K7wFtbBnC?=
 =?us-ascii?Q?2MSYHgWu5wnCxGfePNstpRVKXX/M8e7zxEW5lJp8vYS63GC5BaDJqOPMWQLr?=
 =?us-ascii?Q?Z1o3k7WlAMurCL7SLuD2BwYy0lOh4AEwSKVsLb2ZA3WdRknhE6hpFcb7k0wX?=
 =?us-ascii?Q?LHgOQSx9XNgZAU3Y48aFO2ZDntE+GpHMfD6RWPjmTzMWPM0dmDoBL5++M+jL?=
 =?us-ascii?Q?gfLXxj/HOPoI9uePK2W1NBm00/MO1W7N1rXlUCaExIzPg6BqZVMigNANKrJ2?=
 =?us-ascii?Q?LPSqX5c0AKuudxAZucMgypGL++ibQA6DBQRzrusgO+60Of4fa080q5BW4usU?=
 =?us-ascii?Q?74C7p0C1G4gTEAg8RQAX4QRqhoGgey33GbgOqHDuUMQmp0Sn0ixoSacT1HnA?=
 =?us-ascii?Q?DEBEZeNA/gE2RQTq5VqJdxubvuERZOQr5fCQ7BAZMzzntu2ZQ0eWa0rHopiK?=
 =?us-ascii?Q?yn7vjsz+ZMb7dNcCbubsDxhXGqFpZvNFSWX7rI08GcDk0OuwodpObInhvmXf?=
 =?us-ascii?Q?0K9Vk+8hfrU5NdMRcl2Nd1BPpYBFfVinqE0kBaPVLnH/5Qh1w/5uwY57se/Q?=
 =?us-ascii?Q?4sRVrTgTYUymkkJ0K6kJfWxNMWheBqNcIvJTHUcFqIOzpxm7ZBXPyUyYYQpE?=
 =?us-ascii?Q?3FwFCDmO7yafkXRGy+Ou16r1p2N8DNCFKkUOWKhsi4i1+6RCcxBeZ8ypuex7?=
 =?us-ascii?Q?G5gWg6gpIpiZ5UJbY2Osh94Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac85ace-cd41-4d01-91db-08d90a9f80b6
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 23:44:02.6621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5tdPN6lVaoi3OWEkQBng5F7aGPCH4C+CKgoPDBxi/FjVMW8Xj++pef1fX9TeGW3ZTXQbTrdC5OrsK2UJTdAlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>, koba.ko@canonical.com,
 aurabindo.pillai@amd.com, mikita.lipski@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change history:

v8:
 - Chaged link lanes and rate parameters to u8
 
v7:
 - Fixed formatting
 - Fixed 'unused variable' compile warning
 - Fixed comment format
 
v6:
 - Submited from (hopefully) the correct repo to fix build error

v5:
 - Fixed min_t() macro arguments

v4:
 - Fixed drm/radeon/ lane count and rate

v3:
 - Fixed check-patch errors

v2:
 - No changes, this was my mistaken reply to my patch

v1:
 - Initial revision

Nikola Cornij (1):
  drm/drm_mst: Use Extended Base Receiver Capability DPCD space

 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  5 +++
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  | 18 ++++++++++
 drivers/gpu/drm/amd/display/dc/dc_link.h      |  2 ++
 drivers/gpu/drm/drm_dp_mst_topology.c         | 33 ++++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  6 +++-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  3 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c        |  7 ++++
 include/drm/drm_dp_mst_helper.h               | 12 ++++++-
 8 files changed, 71 insertions(+), 15 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
