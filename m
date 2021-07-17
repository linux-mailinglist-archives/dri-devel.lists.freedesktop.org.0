Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E94F93CC5D0
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 21:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3DA6EABE;
	Sat, 17 Jul 2021 19:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAA16EA9D;
 Sat, 17 Jul 2021 19:21:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9quswX2DBRwiXDgu9rth8gN254M5xItIezkgfaCom42j+4Xsp+VCRM3qzUl3WtIMbac3TS3F+HVmtUslPPzHH/my00MAJnxx2NSBrk7+Ii9mvkBYP+6+34r6enWZ1fQ8lbKCQNYYbqLZVlIZltaZzgeYA+JVDw75+EVP3Lhd7HjvBSnmjwLHWOW65hva8+6VKkOa/ID1h/erRv5QGw8Sof1a95IUi2TflBnY/Ys7H8avwewPtrNYiMf9/Ih56fzpGnShLNI557O1gXtALLr5eNJx/fEvC2hfebKBGgFA2L7Nqm0rHDYinjtcQy9G2XdVyMWxo8oYiyZp1cIIuUL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+7nKyjfyLOZihYvp28L3Imk5sdJ3gBsKhRXrSh/IuI=;
 b=T5+Qx+8FCnVBL27ueApHrxDbzVRXxP7PuF1lpIMnm3ByXCZr3weoTuG29EvfmBS/xfZDEoPbo5MkDnIXoz0F2LbfexGW9h4hQ5xVvM43Ah8UOoM+0m41Z+Y/fDXiIiLdxpyJ8rZMnxAOcEhhNmLAj5TvZk64yB6ZKo7UXFH2cQ5suoLaUdj+SWIE9M3KDxMIFVBMc7Zr7TMAPNLHz5T7sXDMkXKl3QYo9593d7TcNz6DA6gHPlRLORy5N0rmtyeF9qAe1A5nior1oOW7INUU0V1MeIDDg+e3TqToxFrBfLs9UGKveBb/LVK38NMhLuDjY3p2X9dbAlhy90YBbq/NGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+7nKyjfyLOZihYvp28L3Imk5sdJ3gBsKhRXrSh/IuI=;
 b=IAYivu5vasuPFgW3f42ExlAvjIyQXs6eZ94zvAfpLWdtOhQKXdE4AAE5qZOsW6NUuyN3vW2SFgOM+pTCfKW1yYjsqouVxs8LXf/QrfAmPyLdBGBfC3/HLf3se3KMeX+occZGkGwe3GzzEFXXztXXtlhA5/jUldRwyu2Hi0ikVBY=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4670.namprd12.prod.outlook.com (2603:10b6:805:11::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Sat, 17 Jul
 2021 19:21:56 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%7]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 19:21:56 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v4 06/13] include/linux/mm.h: helpers to check zone device
 generic type
Date: Sat, 17 Jul 2021 14:21:28 -0500
Message-Id: <20210717192135.9030-7-alex.sierra@amd.com>
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
 Transport; Sat, 17 Jul 2021 19:21:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1613532-b24f-4ca6-8272-08d94958205c
X-MS-TrafficTypeDiagnostic: SN6PR12MB4670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB467098F5950AB1B9426354A7FD109@SN6PR12MB4670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A7tpfG+MChFyNDi47Jsq+myyhH20SqoFgf2qXmPqlqqkOh8SPCOHoiltA8c13qLvqjve4ocTeNUcUhlYMid5Z/PIonLXTnV7iyh9zE02Tmzc2pXIzoPMZo+QhkX1Pfr0/HowHh2q7AqLMXJQ5T1wEUfSJM08v+pxcFeRleyN4lGuh1lNcdTC4JX02bWP1OllbAZF3SbOAcwKsMYiGcDzNkBBypTkPCawQxww9ZzVEp07wuQoLAjc0yfBSl4HFub2aFf+5e0VSvJFRKLb8+B1gVKX22mgfq8m+gwqvh3L2NBhUDR1K9LwC+rwEJcvy/2ECJHwn8ecAR8G0PK2kQRiBdaGVlLWFq/8Fm/T6MnA3QcMJZm0/A6xOFJ95vCPhPkoi5IbUlEoyqASZ0Ybq/QGm2F7kORDDfgoSvB3K8BBJw2ubrFryGRWKMA24kK5Gw9waZw8GXN3A5YMgR8vZdjhv1KIE0qu/j6qURq0HklJ+my+j2szkh9sxeBnP2Q0fPx1EFF9C6cAPlNJq9g02DGJMPmTtLIejqu0yWfcCRELVr0YKC2B1Zyg5DkffLDrqOrPjrgSz/6FrRqKuh5kY4/ft4m3crOapsXg2SqxMLvmYufeI28Qpfy6PH52/AA47ncBmYIylfVWiFdjyUPNXTCfjbIu2e0yTk3ZC+x/FXKh0e/KG5yQTQqAY6DlOKqNI+Fpj5CyzJ3OQKxejYvQLAivfKW82hoYIjcM9qhUmn5fJlU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2616005)(26005)(5660300002)(2906002)(7696005)(7416002)(1076003)(4326008)(6486002)(6666004)(186003)(8676002)(4744005)(956004)(66946007)(86362001)(316002)(36756003)(44832011)(8936002)(38350700002)(38100700002)(66476007)(508600001)(66556008)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cQaOdrR+sS5N7hv1ro6dshtCacNUIe1Y1h4lpyK6ix7rSqYjqqxRcvF54TiE?=
 =?us-ascii?Q?BIgGuW2yyLY6zKrEf0V60GLUXa56st+LXd4H6EsEyRypwyuA0fhivjpCV1ay?=
 =?us-ascii?Q?QFZXwrfuN4UJIipQUI/SrJdFFrGp1r1HDC2rCWuhIuOuouF81wgZQErAcj3K?=
 =?us-ascii?Q?GqvdbBnsamJ2y9bU7bEqYMcWpCoQKNnkY+5c6EeKuuzFX3nmWiythZbphrPg?=
 =?us-ascii?Q?QV1J8syi2WL6x9eSRqU6ROpIzhJIDrvQqh7rN3MnVvMSvu7I7QFx4lKSYdli?=
 =?us-ascii?Q?y017r3jU249xp4czE/rUMm143JI81R6gK0w5ItV5V2/dlxtnTfBJKZP0PHO1?=
 =?us-ascii?Q?z8BoF05ujJ5dcR0CChKLMZgSkxXWZ3s0nq7PcyTOvyZ7hIS+gOi6m8mHT3h8?=
 =?us-ascii?Q?ffpY+rtdfCfL1fCPS0ZbxjrMXSQbVmy/rz9arKYvuTKf6ERUkD82GXuC+zeB?=
 =?us-ascii?Q?3/7Zq0Ks30yTdaG6jcUA40dW3VvooQFoMCHZq+EJSi5Bw6sWyIzp802dX5F9?=
 =?us-ascii?Q?47QybqwiMLPEtUZ3VneH7HNWMGGNky6H3RQYWwsNlnytzYDgR3Ef0aaC1QhC?=
 =?us-ascii?Q?RkaTFPueUCzdcgaF7UyYWI4z506PT7wAehpVpzSMG2U3NxxfnoJpTRCFBR73?=
 =?us-ascii?Q?mIzuvR28vpVwybcAhIXGeocr8f7s2EfvSMN8V0jTR1Qji1pOPHRQp//kgzpL?=
 =?us-ascii?Q?QYtGHC83gZbRFQUoaHWN6+SDIJpR79acO5cylxt0LknwnfaQ1x/eZ+agLUdz?=
 =?us-ascii?Q?YWv9+ot6e8Nm2VfeplBmZvE2Yu0ZDolrtZLRLuAOPxfNjUaAbvatcUwtzJzk?=
 =?us-ascii?Q?kRVnGXjYCphWMRxsgvNwRHOTUHh/Vpdm3OLaHx5M0vZ9/QhTjx+s2g84Hb7O?=
 =?us-ascii?Q?6yDj5P5X0nioodj4gCdWtd9M8wOl0lVSvy5rh+Mj4jKZw9qXnyRi9pMkewQR?=
 =?us-ascii?Q?LD2fbI0LLXLjhf6N3iFfsvn9SRE4tLelWUAtUfcWnIEYhAyX30ENIcgVs9Oe?=
 =?us-ascii?Q?N49uLeYdqGN/vw8+VGk2mFl0yoIVoDg3UknesRvKoNF8HZpL1veU0kT4XBGI?=
 =?us-ascii?Q?HvSvbPc4+90LEuR5Yq9ONx8vgkKRIvXAJePXgenysVULcRVODud5FaVNqwed?=
 =?us-ascii?Q?V3NMFQASFu80wbSrI+5QDqqCZC29CxC5dvEfRbZazxNXjIscer0kTnRn0eJ6?=
 =?us-ascii?Q?xN/RRATLYXjBwrWinvFCsWrgLGxWSJkfilKJglYNMTNf8Bp9AVG7Rv4nRFh4?=
 =?us-ascii?Q?7vqR+gLr+G969wbtsGMsVyuRZVYHsq4prhnBxpbfDJNdPTp6tVdYYY0zHlkG?=
 =?us-ascii?Q?sbyQpbTfi7TjcDwqFsAPwtUR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1613532-b24f-4ca6-8272-08d94958205c
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 19:21:50.0181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZZUdmsY5ky2qdGqyGUWNKLYypvEIoLvILNTryIf9LrjIy8i0NKuN+b97K/Azx+1JC33d8VmLVgVaIAx74P5Aw==
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

Two helpers added. One checks if zone device page is generic
type. The other if page is either private or generic type.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 include/linux/mm.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d8d79bb94be8..f5b247a63044 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1125,6 +1125,14 @@ static inline bool is_device_private_page(const struct page *page)
 		page->pgmap->type == MEMORY_DEVICE_PRIVATE;
 }
 
+static inline bool is_device_page(const struct page *page)
+{
+	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
+		is_zone_device_page(page) &&
+		(page->pgmap->type == MEMORY_DEVICE_PRIVATE ||
+		 page->pgmap->type == MEMORY_DEVICE_GENERIC);
+}
+
 static inline bool is_pci_p2pdma_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
-- 
2.32.0

