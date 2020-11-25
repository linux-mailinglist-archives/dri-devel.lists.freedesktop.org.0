Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A61C82C3781
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 04:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC676E7F5;
	Wed, 25 Nov 2020 03:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7236E7EC;
 Wed, 25 Nov 2020 03:17:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5PEY6O7mPLMokJqFA7wrYeN+KtTKg73plC5MvMqhIZ/Vn/gyLsjma6Xkm2llfqKuVFw19DncNZZeIYucxWTUpK1AoP2Ri9pF0krZm3DjahuxlyLCivcey3hmP+UYmAoyZMGm+OWQSp1hJclrjy62yuH26le2rbMsdZPuHeWRbhT1H8LAbut321FQ/ZnumB8MiK/nTK+zMTSG5BX2AvAHJBiOpqShDJtNTwyBuvOaOsupXq9A7rWGcEsAU0qBjFlbS8tEKYtiuNpaykosr1KkDSj2gTpqLeIhVcUbVGaALkxrLZ0/t8LrlGKRmbq3lzaCCeL5zAGLsCcQf607M1tmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJ3kwSnhRayyW4hJq+m02mqY0Qv1QeuKBK1PhPKFE18=;
 b=ceXWHVL+/6uSPT6VO8EqJVl+/pWSURpu7P/DQgc9mwze9aFiRwYviV7YKzhtYl6PP2My4p1gTgsOgy1e2D6QAo6JexDafvXgm/zrJUJHXpFm980N/P5rFLm++jQ/7B5998TBkBNf1d8lhSNyG97WdZk+RG2D+PRYnLYXxWNjUqpjRunkkpLUTa9mH4QzXQ+fx73OTOWCYgLaJLuvwOXHuzhnciojAVbgbmOrkkQwXyc+MHTGFHrbNHyxolwgNfUD/YHVsOAQW/fKmfrBOqssjD8abStHx/5PIQe5FX100ZQW5B8tBm2YlX7Pa+5qKeh7bdcc5OlMUeaZXTlO1TwDyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJ3kwSnhRayyW4hJq+m02mqY0Qv1QeuKBK1PhPKFE18=;
 b=PHCHpK0txVtWuD6EhT0Ji67ng71w48Az16y1+JqL36nbG4omq7AMMddvkW9unDw8ZcskHEnaROvJZkJrsWd5eah+/tVgEkhdG0x4dhG3wyBItIyqLRVhwHZsX/FrKvpY2Z3sbR5hGmdxB8ozWHjidx+GmlhlK0gX7OZrepcfZsg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR1201MB2507.namprd12.prod.outlook.com (2603:10b6:3:e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Wed, 25 Nov
 2020 03:17:21 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3589.031; Wed, 25 Nov 2020
 03:17:21 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alexander Deucher <Alexander.Deucher@amd.com>
Subject: [PATCH 0/6] Allow to extend the timeout without jobs disappearing
Date: Tue, 24 Nov 2020 22:17:02 -0500
Message-Id: <20201125031708.6433-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.29.2.154.g7f7ebe054a
In-Reply-To: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
References: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: CH2PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:610:59::36) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 CH2PR03CA0026.namprd03.prod.outlook.com (2603:10b6:610:59::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 03:17:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 02be6b1b-a52a-4b81-da23-08d890f09f5c
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2507:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB25074CE83D78D86B738E6A9399FA0@DM5PR1201MB2507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fDu2V47iUd1DcUgd1RvrMbG6QEdbvcam9+tJy7imurxPyuGNH+A2yVOP+6wWdMQ16tbO5eCs8cZzf68u3hCgLWGsuxR6LusLvDqpp8TgZ03ybyDRfqoxYK8rkuzfPkPg+bM0+0SQh67phQyoiLfpfx0eAdUxlDIrLPu2XogFLReRkll3bStvD5mbJuLClMpkfYYd6VhBlV6XXTnZzBb7HX3kvIFB+88VWx+zcvW60OOSfFTEp2RQio/Gei91PloocfUVax0vl/Bt3es7uGso3T19j0ZAu6TBLyYmHbAXHRUOmA0uwD63cURgPNHzUUnstDm4lCADoWd5C/1MZ9u3cQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(7696005)(6486002)(54906003)(478600001)(26005)(52116002)(8936002)(83380400001)(8676002)(86362001)(2616005)(6636002)(5660300002)(956004)(1076003)(4326008)(2906002)(44832011)(186003)(66946007)(110136005)(316002)(36756003)(66476007)(16526019)(6666004)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: DNdZvjVr4ERgTu5Z+iDMXsvKNkl1sr8AxMd9qcM5ninPjWKww7dV3rglYUxmSuCfLVx2bQDMPpXwq2t+jKsE0n5xVCjS7S1haOI8BC3ZZ6h7AmpVl8ttyAhL5ki2hN1cysA0iGP1JpApCL62lhRY0o0XzQYpCCiNuiDnKAdTIj1QglofH3OXT30D2kicxkyhljngy3TjGI7HYFb39ekl3b9Rp/Vj8yWyGQvzuKqldvKBJTHMbrSRtjdcbyVYuap1VEwBTxSCAPox616/fwOI88OcqjFIYyaeJNfd8Uox3qv+0S+C/3XIKzax5m738iKP5NSRUZ5JNJVXW/gAgM3RM6pqr5X2ATcYceotLEabv9+EHDOKEmcBfUR4nQndby52XJDecTKP8ITFXxpus7M/W3Ec+nU1xUb/X57bng1bm38iAEOFeJmGxJPaqV7pMVeVD0l0bXugoghQviD3riV/tFTGt93TNLl1X5tjE2QuJtpxdlp6eilz+3yL05ho+iYO/kfyLwjdwM7dMvoPmAInuP/rSFQ2/DMJ3dOn7aVCH+5PCHr7LlhBm+AzJ3j7fxI6Log2IPoGvfugsBxwMIkQrdQ25Lu5omPAKcXWjM9gLiyr9vtlYh7T3pYbEN8fiWRq2fLRdgHp8RCeVkn5ltFgnORUB0zKcc6x2nw3LX/3p5rI7yfAtq0dZBPr/ahynj64i+qweEIPJefx5wZpT4BU+aUkDgx3FWBGpGNnzoFHlvBDm3ZD7z8sq/9e3PxWlD/SZuvJwSUgqQFpGNPGGd9giUeYO9zV9FzjKwYX1GfMpmABLaXkST1Rvd350do+qazH6PGQSCjq8df40XxJp1J2PuPAb8LX7oFWrdYDE8vHTX39H55C5AEXoDp9UmPDp+4Cencsl1/eXnfvLbPToTjG8A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02be6b1b-a52a-4b81-da23-08d890f09f5c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 03:17:21.5417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpcClIXZleYq4/mXbYIViei1jG2yz83fH8IUF0FfzCagy5Np6Muig4gs9zuQ/fmy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2507
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
Cc: Emily Deng <Emily.Deng@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

This series of patches implements a pending list for
jobs which are in the hardware, and a done list for
tasks which are done and need to be freed.

It implements a second thread, dedicated to freeing
tasks from the done list. The main scheduler thread no
longer frees (cleans up) done tasks by polling the head
of the pending list (drm_sched_get_cleanup_task() is
now gone)--it only pushes tasks down to the GPU. As
tasks complete and call their DRM callback, their
fences are signalled and tasks are queued to the done
list and the done thread woken up to free them. This
can take place concurrently with the main scheduler
thread pushing tasks down to the GPU.

When a task times out, the timeout function prototype
now is made to return a value back to DRM. The reason
for this is that the GPU driver has intimate knowledge
of the hardware and can pass back information to DRM on
what to do. Whether to attempt to abort the task (by
say calling a driver abort function, etc., as the
implementation dictates), or whether the task needs
more time. Note that the task is not moved away from
the pending list, unless it is no longer in the GPU.
(The pending list holds tasks which are pending from
DRM's point of view, i.e. the GPU has control over
them--that could be things like DMA is active, CU's are
active, for the task, etc.)

The idea really is that what DRM wants to know is
whether the task is in the GPU or not. So now
drm_sched_backend_ops::timedout_job() returns
0 of the task is no longer with the GPU, or 1
if the task needs more time.

Tested up to patch 5. Running with patch 6 seems to
make X/GDM just sleep, and I'm looking into this now.

This series applies to drm-misc-next.

Luben Tuikov (6):
  drm/scheduler: "node" --> "list"
  gpu/drm: ring_mirror_list --> pending_list
  drm/scheduler: Job timeout handler returns status
  drm/scheduler: Essentialize the job done callback
  drm/amdgpu: Don't hardcode thread name length
  drm/sched: Make use of a "done" thread

 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h    |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c      | 275 ++++++++++----------
 include/drm/gpu_scheduler.h                 |  43 ++-
 6 files changed, 186 insertions(+), 152 deletions(-)

-- 
2.29.2.154.g7f7ebe054a

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
