Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F01057B116
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 08:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBFA14B5E4;
	Wed, 20 Jul 2022 06:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A701014B5E3;
 Wed, 20 Jul 2022 06:28:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2xn20AWXrH9ETRak62cLh35uHtCl+LQSmMFOJyOMHHUIvP7160xVYAbZBRIv76RZNreeCzt4BvHgyVQLv87FEJtC1tWuPFs7/NHU1P0OSkhJfXDVL1FrnG6yWj/Gw0qAEfLlQoBhk7ldWN/t2KPGkg4dm6PMPvQFu10FxVLQqj12aL/m5ns45lYFFy6MfAY//6DYVX4VPGGx9nTg1SOCXy5tj01Q7bhbAd7CmyEnZ+LY2C7jzjrQvOtJ91ifbFZDBQvaYfw2+3pkh/pql3VOE9lvqQKK+mQMR/7hw5QyKvf7G97NLZKto9CaUbjU1z2qzWKcTEKqpHW5/duMIfQnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1LmgiealGYwNmxDY0ba9KJZOV7BhQ7yJvUDAgepQog=;
 b=HNmCIGNz1K2N7NN6kyyTt66ZzMHcwKbj+XyMiIOZh8DlZQocsu0kxrXOB4Hvntf801qCv8YgvuholmQwvmNoSfraftuOxBe54wB0S5/JResRkeyPYFP4mcU6GLXs0FpLuAlF1ASxxDFojDRz1HOczEggti8smUuQ4ImiZP+TV0HaOWVtahpb07xcv0IO2pScloP2e0nrqxTm9NJ1jXlFWh+zFUqyUGtKBJ0H0ANKz0VerVNyjJN20+R7m/cBUQj/lbp/2rk7W/g9FbAWQbKa0l2EpSGREV1ARnRNo3zwzlYZPrclLZUY16pGnMNBuNOaqGJdNdcqrupCD7YiOFHKcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1LmgiealGYwNmxDY0ba9KJZOV7BhQ7yJvUDAgepQog=;
 b=JnHgspnto8brEU5d194Bkz9ANSi1tYajMLBtD5TVmUksVXcJWxOj0hlwpVuPS7z0q9ePrvYwVUg0Ip5HWakDJyytnpEFxE9Yg8zlr1h2kB81ItlVqcVdoniBKEdJOrlOtjo24aYv3zqA/YzmR9PwQsPP180XAC0fac52cnrS/Zj3uuryMwO/PfxG6YNw/dCS/ORed5a9O2ReQlYBW84flod4L1/wybDSbEAPrvTIf5ETATPKkJKqUuXLZTZ+n/OEerFpm/CySv70XaoG8knlSQHRm7yI+ZYEU5sBn4xTrxpRQOWDnvmLgVIcdvBbyAmEKLoA2rTmcaFVIa6vQX/Ttw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by BL0PR12MB4753.namprd12.prod.outlook.com (2603:10b6:208:89::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13; Wed, 20 Jul
 2022 06:28:04 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7%5]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 06:28:04 +0000
From: Alistair Popple <apopple@nvidia.com>
To: bskeggs@redhat.com,
	rcampbell@nvidia.com
Subject: [PATCH] nouveau/svm: Fix to migrate all requested pages
Date: Wed, 20 Jul 2022 16:27:45 +1000
Message-Id: <20220720062745.960701-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0171.namprd05.prod.outlook.com
 (2603:10b6:a03:339::26) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56d01757-4cae-4745-ef24-08da6a1900a8
X-MS-TrafficTypeDiagnostic: BL0PR12MB4753:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VfBJLKzg9jIYhZwkZeQHh5I3ET0R0uXDGrxZchFKfaDEDdgQGV/oYVWjT7+P3hBuNh6o2Kp+6WY3MQ9Bj29ZLsWBNzVevnSjR/4HTDNTnHqeSzwDNMwsVayZK/gGGQd/WLlhMGDe0xj8/GTIR2xFGBmvRhChXdwahyJDEs0108neHocEPdCXi+5OtXqv8FCSMcKbGq/bVjUfclzLET+SgUOxqzNPe5Jv6Blq0KHFvayMXLvBxQOC0BPTviw3JYUT22vmbXFUq+eh2T9fRJG287KVdms9PeA8GptVCdBh8F+zGqbUePyU++rFfSBUtXgGAC9BKXcyB7R5jBgzgwGdZlA683q3Haj0FAzKM+DviEtbrwcbT1grEnLDkyOTzvAdpSaZzcZaknUBWkkdiKkWPLh8DW4CpRH5ZXAbffyrnp0oFlocZfGVmqIByy73wjLeL/ukqeQufct8mvkB14jR0aQfhnBAg45cKN+R0iWNZLYOBGSbFuH/p0DaZnV4N0ijHrxV1Z5Kd1r1lwO8+R40JPMWUYwEYBfdUyZdRNkKj9xPxIuNqzeHdUUiwChMlPbNq0FLZQ/WiR7JsYDZvWGwH9d438+NzPszyg7kLlNjHRiY2jb8dJkxg9NiNVqJVDbEfJdCaj9RKo8qnomR5hRaz1rrbxfg8gEQwJBzWts7Bpgf+95bDCr7450TcRmx0wjnY3jfxD5VNWeFHl/1F5EJReG/pYY8HjNlhrkHYG6/YlWf7R1h3IbOiqMI6bJPIbBp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(186003)(6512007)(6636002)(66556008)(316002)(86362001)(2616005)(107886003)(1076003)(66946007)(66476007)(4326008)(478600001)(38100700002)(8676002)(6486002)(83380400001)(26005)(6666004)(6506007)(41300700001)(5660300002)(8936002)(36756003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8fSAOjDnphMfm2W/I0mF3qKzpuO6e07McDCeMpYXDwFctRJPFzfXZqCyiTdE?=
 =?us-ascii?Q?4oL+XSLyH0ceZRgArTLOMf+hXN7oTT+Rd5+jvOZMTLQbhU4HuViOAmpPRl3c?=
 =?us-ascii?Q?8SpoiJX3ax+Y7MVBR27p56jgHSPECphDLwG0HL6yQ5Ex6hHVaxV0k7i6zRja?=
 =?us-ascii?Q?oqVF4CtcuxWVyaC9uXHgdgENpcBBviP6dIqcI+fDDepEQn3MxHggcqtiUSWS?=
 =?us-ascii?Q?ir1MqYOs5zbEHiIUTu5/iYiTtBlSiOg0YBsot3KIBmC8R1Zpwb7hIYhTuMqc?=
 =?us-ascii?Q?yLkmh3Kj/WEPGBWw16w2Fk784Xz9UJVWLR7p5J4aWrNdBVzj9bgIfjnwwYMh?=
 =?us-ascii?Q?PyPHPFZET1uXBTR1bCB1YwPfIIY5k1dnpd//R7qx02zZHuM9E0arxckptgjO?=
 =?us-ascii?Q?/OlleyFZ/Lu/ecJUFrR45pX775H6NGFrl6D7QIaDp01laHy0ElVj7uOvn0Go?=
 =?us-ascii?Q?DOif5UCxHkOmRJWx6mM6vWyaRo2c0WU016VIa4CJQNjfKQXZfoGYreTpYCkF?=
 =?us-ascii?Q?lvbX2tEqcJIw1PNUhKpHe8+AgxRx+Qd3IFP3HNuSA13IYJxeoOi+Dhb7Llu5?=
 =?us-ascii?Q?zEzDDIkBp8vTkFyQbxGlqUXsh0dpX+zOA68llgJAcYXwyfDHAwLE3kseF4l0?=
 =?us-ascii?Q?/DFmcK7ili5+WacHPkwY/2toNHxWSJr+aQ7UMfxJHpvdVLqQcfFe9oiDqWlc?=
 =?us-ascii?Q?kdp54lQW5829YeJ8yN0XMR5yJedCWj83E0Fi8EfVMYXT05mxY8gOPZ+xGvV1?=
 =?us-ascii?Q?YUHuwm0BcqQDATkLsSgaAPWSXlkMKYG7cuT7WHe0ale8+eAh4heVyrwz2pMw?=
 =?us-ascii?Q?6gtSsrx7QknHKNOt0O3bv52OyAf5qaCwBhiCPCX4QBXb+nK/J7Xdp4RFx3Vk?=
 =?us-ascii?Q?kY2RJY22dhXeAMKEqRrzuupfOo9O+hrSqzF+sFHE3mCbmdSytKonWkP1qtGT?=
 =?us-ascii?Q?CLQnxJD9lo5iGF4mdJh1WOG8V4r7rtQQmJN4USoy8I2xMy/4GFJ7oB8UEfPx?=
 =?us-ascii?Q?BXNJw5FQLifHh2ySGOJsGZpm0rOaEFwAOBA22cmxDA7M75VcmEODdI+YViWp?=
 =?us-ascii?Q?C3yvSp7ILKv1Kjuu3aztdwioGiijn0k7C+um9WIw2VrtZJwRAAdKtPE1f4gq?=
 =?us-ascii?Q?ZHvKkLYaiLWm4JdWflC6LYjRNpiOb/c6s3dGKVRYrEKKedIdpLs7y534vkzr?=
 =?us-ascii?Q?33D14PIzDf+32U6xX45hQATHs7gOFJhZzW1GP6ZIeCUE9P6M4Wtb6rTQp0fW?=
 =?us-ascii?Q?Qp+4WeaWMlAxkIAmM2KVGWVRoTMqWzcjMIJRS+hEVVoXkc7pjaFktYmxyPoA?=
 =?us-ascii?Q?aPix/LnHe1Bl4ElZbSLMekMTgNQzppHs7gT+H0Z3UwJl4aN9k5BOWaCD0OVW?=
 =?us-ascii?Q?k58TkpW2Ku8RRgMgp+qAt6jtjk8YTvVtqzrVeB3OEmYDTFvC2FCmw/24Yyud?=
 =?us-ascii?Q?C1/SlM5u9YOKkWuFGxnfTWi9ABMeEDmlKyICO9KgfYB6WMuoFGxwAQZLe05v?=
 =?us-ascii?Q?I9pQ/o1UGKmJUtuQAF7IBTQsUotQLAUFbGFJkiZr+nZUpCEt+sNV/foIL9WU?=
 =?us-ascii?Q?EXV3NM6FW6/DXv7lXxP6CAlE06/qLUuxw60HFvxx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d01757-4cae-4745-ef24-08da6a1900a8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 06:28:04.5081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+LRQweV1wN+X5L3BJPbxZmmpngMaDtECHkXXyanXVLf3erN370CV2tWuYW9A8SObeMFjVKUoEiYY56DdGpJBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4753
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
Cc: kherbst@redhat.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jhubbard@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Users may request that pages from an OpenCL SVM allocation be migrated
to the GPU with clEnqueueSVMMigrateMem(). In Nouveau this will call into
nouveau_dmem_migrate_vma() to do the migration. If the total range to be
migrated exceeds SG_MAX_SINGLE_ALLOC the pages will be migrated in
chunks of size SG_MAX_SINGLE_ALLOC. However a typo in updating the
starting address means that only the first chunk will get migrated.

Fix the calculation so that the entire range will get migrated if
possible.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Fixes: e3d8b0890469 ("drm/nouveau/svm: map pages after migration")
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 7ba66ad68a8a..16356611b5b9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -680,7 +680,11 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 		goto out_free_dma;
 
 	for (i = 0; i < npages; i += max) {
-		args.end = start + (max << PAGE_SHIFT);
+		if (args.start + (max << PAGE_SHIFT) > end)
+			args.end = end;
+		else
+			args.end = args.start + (max << PAGE_SHIFT);
+
 		ret = migrate_vma_setup(&args);
 		if (ret)
 			goto out_free_pfns;
-- 
2.35.1

