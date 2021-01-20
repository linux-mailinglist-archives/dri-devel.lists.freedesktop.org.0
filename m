Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C902FDA74
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 21:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FC589C59;
	Wed, 20 Jan 2021 20:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EA889B70;
 Wed, 20 Jan 2021 20:10:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPB6ZQk89UxdwkT5q7kRzUxIxRWmjNMVgeyV4t4/yCrQ4fJlxGOgPskf8kYfIVg7zvtQ2ipljUER4OhfuBEu+u6zbsg8FV7I0tosGJ6+NTF/IC2wHNf7CsayNuPuhrAMh7XAiSZenVvN6OK1nvxkXd4tBhIGXXdjfYjAbQzCrmDyGTaj7ShfyaV+iSST2y8QSyWZIwqx1IOUgkP47Th+s7qJD0Lr2Va9IHKVz+dvUpYPBtFolDvHmDWCaHg1mXXBp0pJt280f59abD8iVrTfIzZ56kHY1/opXyIo0noNmLS0Bm5w573MZ6m7dbzALOoRbC80FeWdLH/Pjv43Hjjmiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gA7PdZnBE7gItzjZ1aWYbnb9osekpZFdKfdx9YpTzeA=;
 b=ABBOaA7qn0d5gcW8zIGGEpbk1SNQIgubE9tdSOk0n2AfMDxcYD9AjC9d9VPYeZWDKShW1yWfABW0OvVfuQBIwOJdJxN3ZZmwsGhoh7ReHU3KcYc5idc9hxu3p0tpt9CpWBtv1H589DACtz+yMjRVqCujZLv6w9lcUC7yUMGkezLtmZSXPHWs8Vvgtxv96KWLALUKqqP+IvmBPOKm66Nzbnm/YM/OJCexK28o5qFDfWdMqJXDd5wWNuA+M+B/5eUCtwjzluCLYhoGmZWhQTBb5RUgHjBPD4tCLKBt3CKKeKGFFu7tjUJfydULoumnMnpPCfCGZ8orYGX4VVvxn92c3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gA7PdZnBE7gItzjZ1aWYbnb9osekpZFdKfdx9YpTzeA=;
 b=eq5amoSSKW/JUZVIrlnwoA5apN/YIWKAINlv/ExP+c4fW1iWUq2imwTKRhvlRJHg0gyI7Ayx1F/yLZ5VPyUoiLbgrLrSnZz9YfJ9GsgAjjWYZHYiyHEwzZcWIh2xbmVT+bvNHjyTeWx/CoSnmpSr7L4VsyxTF0GybaIE73eAsfw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR1201MB2506.namprd12.prod.outlook.com (2603:10b6:3:e7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 20:10:17 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::60b7:6bfc:44a0:269d]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::60b7:6bfc:44a0:269d%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 20:10:17 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/1] Timeout handler now returns a value
Date: Wed, 20 Jan 2021 15:09:58 -0500
Message-Id: <20210120200959.163533-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.30.0.81.g72c4083ddf
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: YT1PR01CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::12) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.84.11) by
 YT1PR01CA0043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 20:10:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5b8b483b-696a-4139-03a9-08d8bd7f6753
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2506:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB25069EB6F4FE14D3904028B099A20@DM5PR1201MB2506.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FfNB/gXkZIXsdMkwu3Sqx45jY2Joq10k2IcRRHMfd51fdWwvFh1QhfmiQwyThQOVXqLHs7RYA71mGI+oCKMDm+A6UFRctgdyDNRb4dOqhkzN3iS3m7TIqsn4l7vmYKcXZPG0fjlPQ85Eh6lSy0aNktmIYUN9UEKRUkNbL7e/feTjgxNbyEvYkwu4C/BTUqEFa1kPns2DkL3Rao1bwUxVy1+BumTf3qnsE7Y680DpSvWyYLIhab+xuc14KP6vwF+77t1SU48mc6rmDLiNpSTods/5CuD9rqp1DH1jXVlr6H5ia6GnvmRjY6X4PxfNR9V11WBcPtBeb4KJHiDfZkJqty2QGUyf8Z7CZB00CmRB9VXa42CLdFnK2wibbYsCsrmCyZEXPI9vZdoJaN7SZQDlZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(66556008)(478600001)(16526019)(8676002)(7696005)(7416002)(52116002)(8936002)(316002)(83380400001)(66476007)(4744005)(6666004)(4326008)(26005)(86362001)(1076003)(186003)(54906003)(956004)(66946007)(36756003)(6486002)(2616005)(2906002)(5660300002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VUt3VUxEMmU0R25jdlFodFYrUHV6RnRWWUp2Vk1NS2tRUHd2K24zaXRGZlVX?=
 =?utf-8?B?SXdRVmdram9NWEp0NDRnbjgydXNIQmpnblhxdVkveUdwRjU2dlE4ckRRNjg2?=
 =?utf-8?B?WlVzVWdXTjBzYkF4cTZEU3l0YlJ5NXg5cEtPTWRLdmkzVE1FU2R5U0N1b1B0?=
 =?utf-8?B?YS9GcHMzQnFsb3J2RXFoNnJaWU9ZOTlWNHRlK1VwU0I1dDN3eWZ3SXdQNWlU?=
 =?utf-8?B?V2kwekdMYnlGaGQwaEs4VWppalhXRW1PWWdSTENnMWV2VzlMRmFwSVFSeTZJ?=
 =?utf-8?B?Zk1UNlFLbnM4Z3hQWStkY3hNWC9lb3FPa2dVczRrQXlNdzZiTDNPTkNsNEFE?=
 =?utf-8?B?ZXBhSm9BcVBWcXVzRGRTcjdXNndtV00rS1NHL2wvRkZDclUyLzNZRHNjY3oz?=
 =?utf-8?B?SytMYWordnducFdIY0dwTHVsVnVPYjhxWElaeG5EMThXdis4czJ0bGZnMXpZ?=
 =?utf-8?B?YTVGeGdnNlFXbDI4Y3dvSzRub2graU5Lb3ZMd3crN01tZEQ5T1V3SXAzOTdz?=
 =?utf-8?B?MC9WSkh3MTNxbHNaWlphL1JmUFgrZWROc1lUN2hoVGt3bEE0OWFIcmVwWTdy?=
 =?utf-8?B?T25CVkF6bTQ0aTVDcitJRmlFc0ZMbWRNS2QyNG5oWWI3OUkzaTZQR3JHeGpl?=
 =?utf-8?B?SUhZVnJVK2NxSUMrV0JGUTFxNUkzUzh3UWFDYUVTV00rVUxsbUdySC94RVd0?=
 =?utf-8?B?VTZNS1h5dWFpbzh4aWhxUGRTSGY4UjBMRkVQb3E1WHp5V2xHamNhSW5seStr?=
 =?utf-8?B?REVnN2l5OE1ES29vZ05uYXZZcDdhaUtzVjNwZVgxTnl6VW9mZm9URDZWeDVQ?=
 =?utf-8?B?OXpyN29Uck8zZFVTemFVNWFwalBtM1FzM29zV3dSQWVnNEswMlliREYyYW5y?=
 =?utf-8?B?UGd2OEM3aXlkRHh5R3h2WFhKTW1TNFJmZVhWYVljK1lYODFjS0s5WG5ySXVF?=
 =?utf-8?B?a05IenRaOE5rYklYNWlrTWdOZjBUQW1oTGdoS3Z5b2owaVViZzRxbGtSK1Ix?=
 =?utf-8?B?VFIrTTNFVHV4MXp2cndWZ3FKQXd0RDE4SmtoNjF1TXFvZTdXZDYxbHVWRFl4?=
 =?utf-8?B?TG1COVhYWTNpVCtuTmpnbzlQSkhKaDVCVFAvdDlvUGRIRE8rcWhGZ2tSZUpv?=
 =?utf-8?B?SGlhdjdPZDAzM3c0a0dGZ1JidjhaWlZkODB6VVpnbEFEeEJMOTBjTzNtL3M2?=
 =?utf-8?B?V1hJS0xZSGFTR3hSQm05ZTAwZVRzaUd2VHNoS0x5RkdpbHpOaFp2YURqcFdy?=
 =?utf-8?B?V0RVTXNZZFJCTmYrR1JNRXpuRTQ1L0pQME1yc1ZuRnVyOUZLUmQweUZ2NUZy?=
 =?utf-8?Q?/T+MCRtE/rVauHoxHRzryMD0UMJdumpSJm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8b483b-696a-4139-03a9-08d8bd7f6753
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 20:10:17.1741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3SE9iDPqP5FklyD7N7X7aiqDEM44IiKOpe85wTfjYrI3izF/sf0SoJ4cFsakHS6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2506
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

This patch can be applied safely without changing the current DRM
behaviour.

Luben Tuikov (1):
  drm/scheduler: Job timeout handler returns status (v3)

 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  6 +++--
 drivers/gpu/drm/etnaviv/etnaviv_sched.c |  7 +++++-
 drivers/gpu/drm/lima/lima_sched.c       |  4 +++-
 drivers/gpu/drm/panfrost/panfrost_job.c |  9 ++++---
 drivers/gpu/drm/scheduler/sched_main.c  |  4 +---
 drivers/gpu/drm/v3d/v3d_sched.c         | 32 +++++++++++++------------
 include/drm/gpu_scheduler.h             | 18 +++++++++++---
 7 files changed, 52 insertions(+), 28 deletions(-)

-- 
2.30.0.81.g72c4083ddf

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
