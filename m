Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E4137BFF4
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3736E1D5;
	Wed, 12 May 2021 14:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2083.outbound.protection.outlook.com [40.107.102.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B083C6E210;
 Wed, 12 May 2021 14:27:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iml+pX7Rmj+BMTRh3EsLGG+hWP1uo+N3rifDXZOB8gwwP8y1IJDWpOLliJP+kVrx2Qy8lgNRrWh1oYTi1keeeHBF75HVRCF2GmSRi+nypEVqD3cZtcbOyIrmgbkIRL+ikpCRjDSbpGJpmlZ/mnUSzeO4KTnpmsGEq/nRrEltPezvvL2nPwx/XjJukLXsep2nTgFzfh7rgMcfDDXvXMIKv7gVtRIrbTH6UAgEavNiE8MWCoF19TJWuH5Xt3MEliWFZ5nLukFq4VVAmEwp9PkOQE7gwRisg2iLfzOWGemXRDbmUJwor3bWnAxwFTyawu91bypE3hkczgCDjQ3d6jSaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8ub1TT4Why1wfUTgqnHi8urBMdsD729TcqEvDbve44=;
 b=OZYnez1Eoaqwya0ydUJKWiGOD4565pWqCsprFCeukbJW6Lwjy0NlreQuC240jT2jUjkYt7vDDBCM6nBaTrg2gI8fckng3CdQVhNKnTVsjPeD/JOAugAJHBkCVm/WXnahuyqPN7zpJd4OdyLX/RbOnNFQbJJnd0ELn0dt/snP1wO/xYqchL+cAtdtEBNOm1x9cM8Iw4hHV5Cn7SbeV2rVNl1xmL5lINq9nO7dYb9OGsdAW+ywc3sZ6Ii2QTm0ZCWuWY7Otsz20jOYY3Ur/pcyw8ZROBgeufvak4Rv6KPNqpAto8u+BtIAX9hzWlExWuO7qAEfCVZGpmjxJj6/0ePNvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8ub1TT4Why1wfUTgqnHi8urBMdsD729TcqEvDbve44=;
 b=deKB3rPt/WzsM/zddxXQn1kg9wGvvNemZt3P+EcZRU38onurmhQcCal73LmIoe5VvKLl8nO0kafQb4OGIXvEhE8JM9T+dZCmZNK5HmQCcM/p8I95OoEfQHJZDHqO5eBAyM8r4fSKfJ/N3Mg0X731StvZL/99JHLfbtap8Rgc+w0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Wed, 12 May
 2021 14:27:11 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 14:27:11 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v7 03/16] drm/amdkfd: Split kfd suspend from device exit
Date: Wed, 12 May 2021 10:26:35 -0400
Message-Id: <20210512142648.666476-4-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:7576:4f76:97d8:1487]
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7576:4f76:97d8:1487) by
 YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Wed, 12 May 2021 14:27:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e13d4333-6ddc-428a-54ee-08d9155207bc
X-MS-TrafficTypeDiagnostic: SA0PR12MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB457690A81AF82388C6F8AEC1EA529@SA0PR12MB4576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SxfFz1bzt9qxNw6BYhX3PyFfbY1sjd9jJoXdO7Q1561W0MYFQblFM53ISCAYDaKt5NvtOOzMRh+HMXSrXXx6xlYf6NRA1fpW1+gvKm/JMYO7taGQvM+GBM2zOJPsjC2R6L8wMvQ47EOdyz6VVRR/D8F/HHf1g0Sh+zoBtnua3Pbf0QvGumTepgOSOY93JBAl6a5nrfiII4RXjHVx4YLVpT1TWW26x9SfpXpIG8cdVDKgfW52on79of68pMRQDJ9AnKTw6pYcAfKTDMbqwZjKNDQX7zjWFG5VhoEcPG56yKZs/cyS0oR4cfQ8k4RuWLQG3ze2+Fr333rAPWzGi9OBLpdkoxrKwtFZvuxHXvmKRhGTm1VytuvOSZ64wg2cW6VkfrugEVMn1Pg2N0jBx7w7EK2SZ0l2IC4nmA6zDBzjsfn6Vn5kOqTOn1O6dR3CK430SErzfYqMtTAYuphjPB48o1Rgq6qJV6Ai4z9Y/prYXvjV/YGuDRbWi0zxReXtz/yVTowrbsOPpHww1JJkPsdm7FGkEqPIb9zeoNbC58m7CrX3YNUQEt8p7+HDH8bt4lrbw8zgklD6UQfktuNV5HmL2KSNJ8A3JdwKpR2wGVoySak=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(38100700002)(5660300002)(1076003)(6666004)(186003)(316002)(16526019)(8676002)(83380400001)(66476007)(2906002)(6636002)(86362001)(52116002)(36756003)(2616005)(66946007)(66556008)(8936002)(6512007)(6506007)(44832011)(478600001)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NuPcrtPD5jlyoDjH8rfNGPbXLj/bUs3hTUt/fdTH9GpdL9l9Fxnu50WR1lBk?=
 =?us-ascii?Q?vI1GcWAXlfXDkJ3yeiZkvARPKMwU5DRYkI/5GVvOETLaair8QAos0ilksSsh?=
 =?us-ascii?Q?Q1O1LR9g0aX7vaIkwOUz2aiQ1S8psClAjj091VpzmDjplkZfqu06x9VuT4xI?=
 =?us-ascii?Q?kaOxCpeD7/Y0iHW93l7IeVGD7GPpJ+sLMvzpI96JLNgjOMc8crsap5echWJ0?=
 =?us-ascii?Q?TC8/k+ETGORFezfUYlV1nNEqGdZzDLYVvQxSRyhpjExoYqHwHkKUfxWPAWQw?=
 =?us-ascii?Q?1rns1B+lwWmIKaFdmDF6pgzMTYaiZvsGLxQhkDq90fpdBcBE2xp94kfhMxbQ?=
 =?us-ascii?Q?kkt2VE528IT/7uMw+IXlAgxR4zfmkudNQOQdnfdmaG0gOAc2Qtxbr54M7Lpw?=
 =?us-ascii?Q?ipeXgokklbhctuNGmNm7Ns08FGqnVPH1Ek6nt+2PE1/EnNLQ4id25uVjcT2Q?=
 =?us-ascii?Q?k7XD8d7QogvcK9/IkAkqmlhGTirO5ZbPfePgK/u/8Gy36At0R1pXktOKDZzA?=
 =?us-ascii?Q?1miuRehYWZ9aXKPmr8Ab8qwEW1IdID/qZi2/XT1kNm+MLkAp9vs/yhHcoa93?=
 =?us-ascii?Q?qEX9DyywNejauU6qq+7O0SscVAQw/QkmOWJKvToJ8FsfxrX8YTVuvCNwztXA?=
 =?us-ascii?Q?pUasg2e8P0SX5X4DnwiVniA4BXL/GzgN3AAiGy2eK1XOEPd9ZixqJz2+LGXz?=
 =?us-ascii?Q?hhL2FYrK9Af9RKVVaigTO1rQP6ypmaOjYmQvlkWIWppN1isWINNm1nAkDji4?=
 =?us-ascii?Q?u5rLN5NwgC1M7PyKyI+rf7HXigkSJiwAMjaPDGHJUIr7NYNYZFS2UQRe7QGx?=
 =?us-ascii?Q?Kkrg9iV0D31nMBSwoLMEKzP4HEr2KWlzrte4d0FtzWFiRlYr3CkhW6sSwiue?=
 =?us-ascii?Q?3zsZ1F5iZ8yXEajvqySiilldu0CqiEK/deuEfuu9/3cWby1NdJiXwtc3az8d?=
 =?us-ascii?Q?UcwVOrhpIzMmS+U+UAtKMAAYIjx7oAQtrn2s75c+Y82w9MdO7Gc5MBcyVqxl?=
 =?us-ascii?Q?IkAWk+gD6MCKJThpnkM1JlEGSwkzYLwGnXwVybhxuhi8sDQMo4EQt5bHUlSR?=
 =?us-ascii?Q?y1WClPGdlZ7NqIVw4ofbyeVCf2p3DByLxvrTsC4cy9ieQEyAThMAmhL4hldW?=
 =?us-ascii?Q?6rDzITSsctESzFkFQL7VqPjN7EICsBnARxJBNqmYNEruDpG+TaHzDdQbeDAM?=
 =?us-ascii?Q?eIiiVqA2fcAV57kp7y3MXkzizd8whtBqvRy8MiR23t5Vrjr24hmVCVPbwreD?=
 =?us-ascii?Q?R6lTyXCFsR79ThDWBYTpiEOg8m2RGgGRXf4PtWfy6gWRuWyC1pAXKHRm1J84?=
 =?us-ascii?Q?Tu/lUXWDIbVFeInxUMIOrBLP9uswfUr/Ywy/htols8SIGh5h0hn83WN1W+dr?=
 =?us-ascii?Q?1jlh3pRMRKm0kbxEUuM49W2ENJC8+/77RzGy2DLtsBg3ScvnWA=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e13d4333-6ddc-428a-54ee-08d9155207bc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:27:11.3019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mo4G/7TvGFqkJIms5YkMNozgRFj7HQB1AP24bgHBpxyTrVm/0IROlt+xCWlABd5/nKwiAPO3NhRBsPCk5W1FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4576
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Helps to expdite HW related stuff to amdgpu_pci_remove

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c    | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 5f6696a3c778..2b06dee9a0ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -170,7 +170,7 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
 	}
 }
 
-void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev)
+void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev)
 {
 	if (adev->kfd.dev) {
 		kgd2kfd_device_exit(adev->kfd.dev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 14f68c028126..f8e10af99c28 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -127,7 +127,7 @@ void amdgpu_amdkfd_interrupt(struct amdgpu_device *adev,
 			const void *ih_ring_entry);
 void amdgpu_amdkfd_device_probe(struct amdgpu_device *adev);
 void amdgpu_amdkfd_device_init(struct amdgpu_device *adev);
-void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev);
+void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev);
 int amdgpu_amdkfd_submit_ib(struct kgd_dev *kgd, enum kgd_engine_type engine,
 				uint32_t vmid, uint64_t gpu_addr,
 				uint32_t *ib_cmd, uint32_t ib_len);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 357b9bf62a1c..ab6d2a43c9a3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -858,10 +858,11 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 	return kfd->init_complete;
 }
 
+
+
 void kgd2kfd_device_exit(struct kfd_dev *kfd)
 {
 	if (kfd->init_complete) {
-		kgd2kfd_suspend(kfd, false);
 		device_queue_manager_uninit(kfd->dqm);
 		kfd_interrupt_exit(kfd);
 		kfd_topology_remove_device(kfd);
-- 
2.25.1

