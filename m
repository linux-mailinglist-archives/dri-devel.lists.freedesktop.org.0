Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E66FF3CC5A6
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 21:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DE16EA9E;
	Sat, 17 Jul 2021 19:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDD66EA52;
 Sat, 17 Jul 2021 19:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAzu27loPkSlPJH3bEN3cFJWEFWLTJs29IHZ/QHMf/rCS+oy2ncLVeBMVLzAteB8yEaVJQZhH//eTSn/Q2d8/LphwI3ImIBAff42JUyzSduWD2eiulhdW8Qm60OBTqDxW/BrW0wbLlqGFWWgMdaiAqoLOiY6AcvKfbTBQ2se9g2Rx48s2Edawcaj2qqHwpAm5bichbmWwTcD573YV685PHfm+cs/E7oaqy5vl93QbkGvQd2sE8D6XgVuskVR1q5/46kxSHmKS7GWh+sTPfd1EYygM/bHmCPoOXhUgM9/AjNSO3Y2XYSHq5sJC6YqJmgex6OEDzdI1XRDw1KGTKd3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vr2ksBJta8l7uq6fRDppZyPAgRDq7rGlCaJ8JfjVcec=;
 b=Lxkmxsi23mdzlbDmyXd+M37sKul71ygni2BF+u6Bn2X7q24bogOD+2DLz385ZTBxtHWYQSngN5E0QuedU4N29rqwoXRvq4GgLYRk7bfTE16sdHNZvFJMYG5Ix/3oCQxKCGZmHApDHFOgKpVyuyxd+eADWChJjuGagI84y13O15C6wc1yMm6MO55qpYX+bMEMtmxzkRCoRDOs6q/W+8nBK25JCvLw0P1FYfN5Prbgg/qfJ6I26ZF9Zr4HfLGICuWtr339cZUOpNfnR9dYx5pBDZejmnBUoWfAq5NE1AVwTR+4RuCuWiLNSN4lFXkkp47pRvTXrdw1YDT8NbG2YCdm0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vr2ksBJta8l7uq6fRDppZyPAgRDq7rGlCaJ8JfjVcec=;
 b=cAJAVz3Yo4V+I+L7tKW0d6+Am7dyZtoidPembVrhqFNJb4FMq6iU8vg5SrKz+jMJj5ATSzZFhUKJAIrrdeZElcbKqqiGRrVTvLeGRaiJK3rkayWoDqcuntiTraFxhd5JIsT17jcEasVudicbExAGkhqKlrdBr7BaAatB8tu3gIY=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4670.namprd12.prod.outlook.com (2603:10b6:805:11::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Sat, 17 Jul
 2021 19:21:55 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%7]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 19:21:55 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v4 03/13] kernel: resource: lookup_resource as exported symbol
Date: Sat, 17 Jul 2021 14:21:25 -0500
Message-Id: <20210717192135.9030-4-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717192135.9030-1-alex.sierra@amd.com>
References: <20210717192135.9030-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0067.namprd02.prod.outlook.com
 (2603:10b6:803:20::29) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0201CA0067.namprd02.prod.outlook.com (2603:10b6:803:20::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Sat, 17 Jul 2021 19:21:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a55bbd7a-32e6-485a-a134-08d949581f29
X-MS-TrafficTypeDiagnostic: SN6PR12MB4670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB467094D1958A5B755ACFC0B6FD109@SN6PR12MB4670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ys50DDNocS/FyRk/bC/1wv7zu1EBEl9cqhKE8HpHm5HDO3dAmaEdqy2OQ33P1Qh3iHlAawQ27c+cAwmcMZzIPpmy18rNba74YYwDK9mqHOnSjllKxRcgCz4vzlKYUPs6DWbLRbsrM8iGA0EzQvAJDpWkQfRxhV4kUPNdt0MyeTS0MrlboyDCBoqNFt/NXoDNoKjfQqRRPCNmdk2dl4Ajkymogftu3CBIaJlQjDH1Xf2ksj6dc2SgrF43bX/iItytzmVKANhwfylFAJ1cD1SW7txwVMkEhMXwAGGPSlKsni8g8Lptxkp9hhJzeiQDgolmr7PiETAQH9DI13CBmZ4zGcOPYwSwhYzz9vyDW8yZ/3nO7blmBjt9fGv341GspVLNwjyYQTvb5aqHyjOKuEtoyWqodLBrbklQN29cRyuXLZebzOFWF6GhxE/g/NpQWUmIuvEijApuGdqkHgAGyI7Ea4Vrlwq4GznFvbQPNwA1g+BLjiZF2lzJ9ELHENkEaUBzrSmXThTsyfMn9Ahtg8b8EBzcIoQljEwe9RPDhusbYSCcdjw0fakuQkMt89+cVoWyFQjercLii8TLNRJQdNt6HkriPeg7hS/yIwHqxF0vcjGUlSrpailIEI/Y4gp8K0D6I1c75X8lxmSlS9OLIH70XlQL9kwOX9SeDgY38A7q5Q9PDkhtUlYlOix4HwuCvQ14yCCE9EINc5eiOTX3IOUBxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2616005)(26005)(5660300002)(2906002)(7696005)(7416002)(1076003)(4326008)(6486002)(6666004)(186003)(8676002)(4744005)(956004)(66946007)(86362001)(316002)(36756003)(44832011)(8936002)(38350700002)(38100700002)(66476007)(83380400001)(508600001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dKPxX61qhxBC2Z8tjRViJZWe/Nk8URmLMGKMgwu70S/grkbXyNByZzy2h2Vb?=
 =?us-ascii?Q?ng+eQO0gbisPQ09YBf/MLY4IoAcQEkbpL2LRTfPj64hbx0etBZ6Lve0yNen+?=
 =?us-ascii?Q?3AqJteL2UKJUKwx2w/GLHjNg7Uwi0JYSfPE6JG8ZgdNXEbgHlbA0Pg6EmXsa?=
 =?us-ascii?Q?0SMFmTnNx26fGYTtReoUu9t2ME4EF/SbfAWhm36VCmzZF+Hwi5GWx2SEoVR7?=
 =?us-ascii?Q?z+J+HpVF/rJS76kpRr+6fmfNGh0BTJgc+PXDSd4nStrZh6bgBxBfi+t7oCMW?=
 =?us-ascii?Q?jCufQcufm1zXduWsM1m91hzp7RGd4iYpN4Un4hr7AlhkcI5l1N9OafzXHZ2v?=
 =?us-ascii?Q?W2i/aQL2vP+t2gzuYgpLvqV3oHAZBlLmUSVbFWUrrM7RxQMMaVmUKnT924pf?=
 =?us-ascii?Q?ttsjcD1HkXrIS+IbpCoIbC8VwOtxwX403BADNcnq1MkL1hzAzM9OKQjDCqix?=
 =?us-ascii?Q?15C5HzidWWVn8gHFu8kFXcRm9i3UdsxP/2nl9lSZNDC5kFu3b6Zdw+iD+yX6?=
 =?us-ascii?Q?ZfAyUYjiexMbkEfnYlip9qzTIcIlDMkFsFFOQU2VDiLzCwcbrYHbh9h0g1om?=
 =?us-ascii?Q?NbHteamMYAoRFqIJTACzJN+ioZZOldaf4HXqbntYoYUZ1uMH93MuAspuVNNJ?=
 =?us-ascii?Q?3ON2Q0NeDTU5LjNzQojSFLjFFKZN8C4X9/4IHNOzTrF9vvfFQmHqJQNP9w03?=
 =?us-ascii?Q?IkJ2GSd4nzDsjp3mjI/Wb5DQzWBDyh0fKzMc7pA/ESHieJmi9jqdR/gwQl/V?=
 =?us-ascii?Q?J71JbED7VsDcA4A8wP40IBev7EAehoa1+dZsS+e+9S+SZALERLxQnGOoN7KV?=
 =?us-ascii?Q?GAO5ri8VqxxUGuTYCSM+/BPiJotbCYDSmmoYPk60hR1oNlclZnmMi7pLFK2w?=
 =?us-ascii?Q?xmBdFGZAMAkyZ68FJaHuMyMVOS/uQ9Sb0NnZHk5U611yWeeuQDrjDVQlZTt/?=
 =?us-ascii?Q?bIMG0Vi0uudhhmn8mYLxgUJxxpr4X1wP/sZiQCNFhuISlx+WULxq5wy05Mlh?=
 =?us-ascii?Q?fW4dnBKxYdtO1NMEc+96Befm5PHc0GQ/0OALLe+RTRuz3eqLMkl/6Z0PhH32?=
 =?us-ascii?Q?GFV2WLGNpm9F16C7fdDOMbCQ/0vgBCSgcc3zpYlQez5pjOP2Ja+dfIq7KqXK?=
 =?us-ascii?Q?BYLf+TBhsxsWcxU7e3kktvcojA+kQTtJtX7JR6CytIQvTAvvLO4VoI7bn0l+?=
 =?us-ascii?Q?dDidHO2aOP1ZYEtGj40AUaO/8+m6mFWnRFa/C6jrjvF3ZkI/uKRpEakIi4Wv?=
 =?us-ascii?Q?Cl9pWItIRLQI2NGYHfCE5piXRpP8BL/z/5RQPDHc1UK04cSChFLtqJ9P2unK?=
 =?us-ascii?Q?pJKU8uDFaSE8rErB1FLXFpY5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55bbd7a-32e6-485a-a134-08d949581f29
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 19:21:47.9801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIFs0G4bk6mMasObfMBbRMcmLW6P3+tOdhllSRBgnkCE18CiR4Lsabng9+svC8oV86mrlrg49f6NBVergYCZlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4670
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
Cc: jglisse@redhat.com, jgg@nvidia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The AMD architecture for the Frontier supercomputer will
have device memory which can be coherently accessed by
the CPU. The system BIOS advertises this memory as SPM
(special purpose memory) in the UEFI system address map.

The AMDGPU driver needs to be able to lookup this resource
in order to claim it as MEMORY_DEVICE_GENERIC using
devm_memremap_pages.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 kernel/resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/resource.c b/kernel/resource.c
index 627e61b0c124..269489bb7097 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -783,7 +783,7 @@ struct resource *lookup_resource(struct resource *root, resource_size_t start)
 
 	return res;
 }
-
+EXPORT_SYMBOL_GPL(lookup_resource);
 /*
  * Insert a resource into the resource tree. If successful, return NULL,
  * otherwise return the conflicting resource (compare to __request_resource())
-- 
2.32.0

