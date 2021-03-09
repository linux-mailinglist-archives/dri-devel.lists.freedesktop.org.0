Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABBF331D75
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 04:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D046E44A;
	Tue,  9 Mar 2021 03:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E856E44A;
 Tue,  9 Mar 2021 03:25:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQBnxEQlX55WpXi/Pb/ckxfszqRqjdxajwTk5+zeigb2DxOaZ3AgCPF49je4JMNTr/ogWDNsMqnjzSnsL6tvKTD3sWk8R/yxtszrfRSklGlZqbciHQQPaHVWNdCZov1gtL+GbB8q9zgZEQKoOEl2NpbN1cSFaodaQee446QDdeMKYDY11Nh5NEWlyu89tC/8UQp97QUgQdAkWRRBCODshboZD1RHYs2w+oqiw7EsoklyGX56kigX4E2gujjjUCGFd1rIQiuaG74Mm/zQ0bKQcWd9EXy7OtMLaNuDs2n5VCoGBpM9Z0mbNj2EVKrjmfRN4VGwNKE53ZUk9s6M8vy9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGC7/CZYMPjhPXs6kQFuVmUy2RcOUM78tq4/cms5l50=;
 b=ZZdzvIHYXYpYDtkJJljf4Ph/n7RYnUi5FqkiioLSZXgKGZO9RxOgQE8h/DTYZ/qzNJajZpU6WoEfqpEcEVORyFmAXaovvRCo0jCal0bjEkyLlBjGGtYcxwSAKIM5ssq0nCCYZeMcTjqVOgNHYJsGWrrsnC7e8O9Y9OSVpS1SiTiQR0U3Aj+tnZVZ54UYqTXv1aI10SnHDt368qvWjHOMygzsLdcpbMW1C1pR6ObBjlAvz13/sTwnrZADWWFVZDP8OsmYNzSBksi7Jvd1PMs9yEf4+GORKwJzvbf9DJtbS3QQCkkSVYfa5m0HZPbAyvbo4GbmHwdYmVkz3aa13kKpqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGC7/CZYMPjhPXs6kQFuVmUy2RcOUM78tq4/cms5l50=;
 b=1+qt6VFOtWvEvqp68HBKPDS9ulpKKqNXfcOuqA3geWtctJbysP+v3V/FrPmO1HXrFEBCGFr9ZYFU0GZCKY129GYN3PG0X9v0ijZ+zgUo9fqIvdOXZUvUGgAuzYd6AUHHai9OQbOqsR5VxGUHOdJNtxkYsFzqSF2DvytET0hjGnw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Tue, 9 Mar
 2021 03:25:57 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%9]) with mapi id 15.20.3784.031; Tue, 9 Mar 2021
 03:25:57 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: arnd@kernel.org,
	alexander.deucher@amd.com,
	christian.koenig@amd.com
Subject: [PATCH 1/1] drm/amdkfd: fix build error with AMD_IOMMU_V2=m
Date: Mon,  8 Mar 2021 22:23:56 -0500
Message-Id: <20210309032356.20800-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <4c692eff-9d57-278e-8da4-36bc2c293506@amd.com>
References: <4c692eff-9d57-278e-8da4-36bc2c293506@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT2PR01CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::15) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT2PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Tue, 9 Mar 2021 03:25:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 52b148f2-6c16-4146-d178-08d8e2ab0da5
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39359725D1CF5E10C24CFB4892929@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rJGT5rS0uaznne0Oaabtm732n8RGvSewUVvcoLYD3220pLHnDmbHW4pyD84LpyrSpylcJ9/sBsHBF0lqfrcc2z5QwAzNKtYeB3EjVI9H2jixNn2Ow18CZOljzFeSc2b7z3m+RlSJi+SYOO9Q5ApiDkEYpz965Ah/XHTCwZcNmB2G8aoMoDn5Z//kyeXXCTOHe9DgF9R/gDq+tYdas42QcuYH2g8KKNUl0xYxr/T/hWgiFMdyERqzwCHiYYCZBqHyYp54k/vaBvTDBSzncZNf45yXRGOvVQYajg9AgMvxuPHGSxJ9ubStUjW5SR+gI3fA/DN2emQy2uhgjrEMtc+/jM1HRVdX9a9Vcu4ex8g+7QnCx1LEcCgiykl+oL9ZDT1bFtubr6MqeYjEDyD2YLHV4nrmg1ZE/ixAcTYHLDEG/rumAgpEd2hOgXCJnZOhnmmq7rk6jYVvBsg9kHWbidPE+EE9FG23HJPZ0sAqwzhdBqknoY1+MMegxj5bDpHiw5XtMJ28jdbgZQXHsUPIloRPTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(66556008)(66476007)(66946007)(6636002)(86362001)(478600001)(6486002)(186003)(26005)(316002)(7696005)(5660300002)(52116002)(4326008)(1076003)(36756003)(8676002)(956004)(2616005)(8936002)(16526019)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LEO2+C9n4ukR1EHOIpPwBI66yQvLWTzBZTW0xVHqQD72Ck1kLow1TiVO2hd9?=
 =?us-ascii?Q?2HADWzmxQwxD31kESQKUdqDUMP0a6rpmwy9KZrK9u9CWu1jEynVfNDUyTWMJ?=
 =?us-ascii?Q?cGsN/v0ubKbTnDPZ2fQT1r9/MqzmpW78deAarjsRX6GSGpltnPiXZdymVlOY?=
 =?us-ascii?Q?apBIkRLtIKtrolRp74kyWgU4MJzCtS07ifu+sfG4hi4mXuCt3lMX4LQbOZGt?=
 =?us-ascii?Q?9iKXHqLTpd9SOesQKUXVwzan8FmfP1/t4Zr/hdMhN0D2YO6ybwJsPy/t8Fsk?=
 =?us-ascii?Q?eFmj3u2Div5f0Q7HQxmB5TQQ/NVgoDpwQY8ncEkzDZrwdSHRZA0GD1iN3daC?=
 =?us-ascii?Q?T6ur2S9TZcY+leIJb1CYc6cM5cgmi+Bggm3SOcLra0YSnYoFiRaJpW290XEg?=
 =?us-ascii?Q?W663gkzFX2LFRzmxTx3kaxX9vPH3PQwHQJjJZ2mxKEjVT2kEtseGE20nXfee?=
 =?us-ascii?Q?d6LEmXcdEubBBmquLWD6w6nkWAONGxbjVvc/ROJaYQYp8dSsE/FpzwuGlguW?=
 =?us-ascii?Q?lxp23apVTF50QTFcPFdvurLnw/ISknIzFr9u3eT88aFB7zsy6AXCBKVv9w4S?=
 =?us-ascii?Q?6YGV3FZODwdbVG3udoRABELFO2a6rb90QDaZEIHhadup6818Gcipku7fb5+7?=
 =?us-ascii?Q?hMtFYeS9lJsF3XxFvCt9CN04IPvpRglh9NtGpQ32eYAYL9IHjh8eigouHyQb?=
 =?us-ascii?Q?5xEBcvvjrcHcRV80vA2cwQlaTlFYPux/fas+vXyHA6MA+BqSg/sU89eeNGf+?=
 =?us-ascii?Q?wprs/C9iJI9vm9G8oEUk9yRxVRDFygyhWws1kGm1X9uQPyPLyDXgR2ktpGzi?=
 =?us-ascii?Q?ZoBBNpyr+2eliMDbUAIN+stjvUoD7G+jJignIncRBn/6Sz+LAaR8zhFdJlrh?=
 =?us-ascii?Q?YlBfjQX50b76d18arhNhjEqXy6+6CXZtQUPaN06DzuMXEMPp1ACDDyuC/i4Z?=
 =?us-ascii?Q?ujGJSP54TFKFvgqvZaTFqvAqpBZrIx1fpEVJWLQTGMZUYQryZuxetvryy+2J?=
 =?us-ascii?Q?NDXcyIzI7SUAWUeFa61U9Et6DOR8s0HV5F20iQ/0raBisfLXYVQ9ymkuur2l?=
 =?us-ascii?Q?oaqVtPXG/AWmqygrwJuwAyAj/MRoIhCwPZ2Wb+LWR54aE3ryHtYFzy8iaAvr?=
 =?us-ascii?Q?zuk4yAKGqDPQBtAJM4Vrf7xJfxJF8bpSdMIH1GMnR0awtFLgC1/fBlgypCt4?=
 =?us-ascii?Q?s65gc01x8f/789C3BpjsenomHdaamh+C5PJnDNR7218dYcvjLbcr0btz8a1W?=
 =?us-ascii?Q?uBb6FfcZ8MVlggK6HyxcfqK6baV66GTsR6vd4F+0kQzG8DrzKLi6BvaE07o+?=
 =?us-ascii?Q?u+NpKBJ6YDbK2mfkOe7ouU57?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b148f2-6c16-4146-d178-08d8e2ab0da5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 03:25:57.0813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbqdjy0fN8jsjC2snjomcPvqoPdoUSwbNsvrTCj5ATSsqzTq9ruEvEBteCZdVVps983VwOftuxCIldzanxmR1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using 'imply AMD_IOMMU_V2' does not guarantee that the driver can link
against the exported functions. If the GPU driver is built-in but the
IOMMU driver is a loadable module, the kfd_iommu.c file is indeed
built but does not work:

x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `kfd_iommu_bind_process_to_device':
kfd_iommu.c:(.text+0x516): undefined reference to `amd_iommu_bind_pasid'
x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `kfd_iommu_unbind_process':
kfd_iommu.c:(.text+0x691): undefined reference to `amd_iommu_unbind_pasid'
x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `kfd_iommu_suspend':
kfd_iommu.c:(.text+0x966): undefined reference to `amd_iommu_set_invalidate_ctx_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0x97f): undefined reference to `amd_iommu_set_invalid_ppr_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0x9a4): undefined reference to `amd_iommu_free_device'
x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `kfd_iommu_resume':
kfd_iommu.c:(.text+0xa9a): undefined reference to `amd_iommu_init_device'
x86_64-linux-ld: kfd_iommu.c:(.text+0xadc): undefined reference to `amd_iommu_set_invalidate_ctx_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0xaff): undefined reference to `amd_iommu_set_invalid_ppr_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0xc72): undefined reference to `amd_iommu_bind_pasid'
x86_64-linux-ld: kfd_iommu.c:(.text+0xe08): undefined reference to `amd_iommu_set_invalidate_ctx_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0xe26): undefined reference to `amd_iommu_set_invalid_ppr_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0xe42): undefined reference to `amd_iommu_free_device'

Use IS_REACHABLE to only build IOMMU-V2 support if the amd_iommu symbols
are reachable by the amdkfd driver. Output a warning if they are not,
because that may not be what the user was expecting.

Fixes: 64d1c3a43a6f ("drm/amdkfd: Centralize IOMMUv2 code and make it conditional")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c | 10 ++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.h |  6 ++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
index 66bbca61e3ef..7199eb833f66 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
@@ -20,6 +20,10 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/kconfig.h>
+
+#if IS_REACHABLE(CONFIG_AMD_IOMMU_V2)
+
 #include <linux/printk.h>
 #include <linux/device.h>
 #include <linux/slab.h>
@@ -355,3 +359,9 @@ int kfd_iommu_add_perf_counters(struct kfd_topology_device *kdev)
 
 	return 0;
 }
+
+#else
+
+#warning "Moldular IOMMU-V2 is not usable by built-in KFD"
+
+#endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.h b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.h
index dd23d9fdf6a8..b25365fc2c4e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.h
@@ -23,7 +23,9 @@
 #ifndef __KFD_IOMMU_H__
 #define __KFD_IOMMU_H__
 
-#if defined(CONFIG_AMD_IOMMU_V2_MODULE) || defined(CONFIG_AMD_IOMMU_V2)
+#include <linux/kconfig.h>
+
+#if IS_REACHABLE(CONFIG_AMD_IOMMU_V2)
 
 #define KFD_SUPPORT_IOMMU_V2
 
@@ -73,6 +75,6 @@ static inline int kfd_iommu_add_perf_counters(struct kfd_topology_device *kdev)
 	return 0;
 }
 
-#endif /* defined(CONFIG_AMD_IOMMU_V2) */
+#endif /* IS_REACHABLE(CONFIG_AMD_IOMMU_V2) */
 
 #endif /* __KFD_IOMMU_H__ */
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
