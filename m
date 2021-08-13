Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC773EB020
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1D96E4E3;
	Fri, 13 Aug 2021 06:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219FA6E4E8;
 Fri, 13 Aug 2021 06:32:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJ/A7U6Njpn6UStzDYM/axYfiN020U0KKs5k+8tcuMNWT+kWWoEhrm9aQpnuedeVNozi7Byy0td0wmbJuCIbdkYMvfUZOEUeB90DHGpydhU8jCC6UbQP2eJdJ/b+4GI9/UWY6Z0vc8tsjDWOYf7P1qI90YTHiwN9UnolbqSc4XOJUG9YDcB7K31QbTB9bIBjTQ+NxUz0aeiQowCPQe7tM1lLCVkeYoiFK8EG5fuZ5AFasXovV1+Jc9+0Uh3iMFhilq8RpoWlL/RetfUJTAPHwCpdWAU/I5BVtEwkqgcpaYh/ZEx3dJ6zFtbtZh/z4bGBr98uk3sQrLWM/v65nPFt7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RE6mJgdreAqBJ7G9HDx0FYbyAtuQCQ+niVvrBBIWEFg=;
 b=OMWvxM/pD3/akRNGUfHhXIjeSd35En9SK1gQdzEGXajoYp/Q713RjwAR3+a11sSnlCInv7OKuaRuYMuICg4kJT0Frb9PBZfxZo9Rq2y4ttCLhinIDznIvuHtF1dfbGdCt4GnulidLu9Q4tM1J9rOvWfvqu0Ho/Q8s94I/hW5vvn6e5lbb8X6Ch7DwG8geNi/tgHIjeyrVtl/ZFO6PYrGJjuXOawmPBd3VC/kaRLLrI7iAKhwN6WqNmplBNmeTJk9GnrrE2BZGufAM2TGUvXaTICwefKq3jPofi42dTE1griigsaZAZAt3l6zKNmpItQ298DPqJj/Kj/OjWrTbp3pkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RE6mJgdreAqBJ7G9HDx0FYbyAtuQCQ+niVvrBBIWEFg=;
 b=Ir4hxU/ZA1P6x2D4o4q3YjCXZD2pG9lAqIRcPhTYob8JpdCyOhoC+pUQuPsXnwfEWdbkQhZcEYYgA0VTeMd+lYoKpK8V6rBAdOTb0w9mWsg/SsVNa95Ccb8/yIfMbnpKvoBa6FxhN8DtKSqp6eIZ9vmaWmCocpM6iduSyDwn2VI=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 13 Aug
 2021 06:32:08 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:32:08 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v6 08/13] mm: call pgmap->ops->page_free for DEVICE_GENERIC
 pages
Date: Fri, 13 Aug 2021 01:31:45 -0500
Message-Id: <20210813063150.2938-9-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813063150.2938-1-alex.sierra@amd.com>
References: <20210813063150.2938-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:806:f3::18) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR18CA0026.namprd18.prod.outlook.com (2603:10b6:806:f3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 06:32:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd334d1e-b834-4780-a3ff-08d95e24133c
X-MS-TrafficTypeDiagnostic: SN6PR12MB2782:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2782E96A21742F3367615406FDFA9@SN6PR12MB2782.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PKU0bvNWpJkLhsNkHyJmKznyMGnQ62vTJ0iroZLuLQD465s0MdCoobltvE4NrH6/l3fXBevUM6eEDbPH1DxRbs1APIwmk5YfI8C49NOvRQfP+TJpP+YNMiYJvfgP77rUniAFKdffV1DJpjlMf8OE37dlOfs2tjgiqD68oxkUL9HyW2VzN4E01jIZHRqgU4I4vLfwQVUP9GuP8f20a2kfsaMDRySxTjMImTuqg0SmYTmeVRlTHN/xSYMu56RguB4qLiIghWP8Wp5fzXAkOQnQ9zqkh7haPUluyHpqwDnzdBbVxdqIDx0BnuJuZjiVIFlhpAfx03FR3LM0APiJ5cAHt3wb5MX5rhuc81UepW+INEoQyNHNTjKPMp15ioLFe1yipRJ2gid7psZFTcuZLFr2yqm46h56MLZf853NYizJMDjcZAJfrDxz9AqXWXAR0Paf+NzzeVBV7VJVPBScSGOw3w0Vlhd8JNra6yvNBskIp8v2Ng/NvHNfkRkOMfEvMeozIVMH/NehSD87KTAiiFmAjpbkTJGshYaYiAM4bMSrbXK4fTHyyur2u+GGqYfFmll9ZUyefO7eFvjtFhqPTCCAOpx+BV2mPmc21GJ5T7mX85OsyrtqR4EwQvF8eKU90B9nHfBd6TxJy3vMJgyrmm41XefwtS0Ru9z29l77l2QXfDqqP3hDoKYIFfmrUKTgN/IciPVa1x3FtYMCWebPrGRvYYm0bBGtmlHRxVQdrxF/70Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(316002)(2616005)(956004)(7416002)(38350700002)(7696005)(38100700002)(66946007)(66556008)(4326008)(52116002)(36756003)(6666004)(66476007)(1076003)(8936002)(5660300002)(83380400001)(44832011)(4744005)(2906002)(478600001)(26005)(6486002)(186003)(8676002)(86362001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZP7Mx7e9/+1mig0T1gYlMuLmIj/K85kvZOWGa78QYuz2yFnBOnlZ+80LN78g?=
 =?us-ascii?Q?gjlak7mEWvlcG6jsNNbbciEjYk/1NUduwm/plJUEgK9r+plY2PrYAweoTDeC?=
 =?us-ascii?Q?KXPPwSWXEzrvmO8YPoDlkHXXle9QzkR1+CLQ52V/entSwUxJQywIC/mlVwDY?=
 =?us-ascii?Q?BPknODl7LFpoRa6Vt50U1pY6pcwcOzA/5sHFu9RE2g5Howh5xsvAGmFtjP1E?=
 =?us-ascii?Q?/rU5pcK/5ZfAXL8gbtd0X5OD+X3JM6N6jYCc6f4OzdYsJnzDPJnwpBS58j4Q?=
 =?us-ascii?Q?M9z9vESdrgsdtdcePFHZrvHU7sqkY8MTiJDcwREAnWsJ3aEyGimbhFyqk/1H?=
 =?us-ascii?Q?o5FZ953KCZNWDO7U9MXfSTm0sJZ4nHTE/yA+OgS1eE0h1HGY4yjXqqBGsRL4?=
 =?us-ascii?Q?cbkvZCoO/do8ItXsT0/At6UmqZv3G9C9TjsPG3BQx4akizAYtvJ9oCcixlg4?=
 =?us-ascii?Q?LDhzdJ3ACh191j4FiTHCHg5lqBCSrxkeily0WQyfZfx01dJpVtxCo7wRuQ7Z?=
 =?us-ascii?Q?aWGSfyeACCgkJVdBGp3NyRKpVjDB3zqZqf6lRGgQC7WHxefHEFWqq7bDp8v0?=
 =?us-ascii?Q?Sny8FJmHBKHO1xt5kQeGol1kZk4isYYmvYvP8i4P+gLSqz8GH7qQ3ltj6jaK?=
 =?us-ascii?Q?iltChafRuSAyu6wdG9b9ZA2quuwtI//B6d3AWLFmCw0IZJ0EY8wa+h2qL4fC?=
 =?us-ascii?Q?FlCFiquzbPwi+zwjBBzxB712UczmPUuXOn7osvsBgavt4FU0TSCUMQqjreRC?=
 =?us-ascii?Q?S+KjsIatSChpG6zwFDm/QFSvlxvD9wELe5AfKyRRVZTdMvGKGFWIOFHQMc8C?=
 =?us-ascii?Q?eEeLmnvQ9sN6P1z1zDN/htpvJkP6LraNS51Xc1kvgwn8DyxkhmxDDG1JPOCE?=
 =?us-ascii?Q?zYualH00Hn2j51vxzqLLB6s7gANRbL5hv5iac3prbU9kNDuQGyp15TNLFT28?=
 =?us-ascii?Q?w4pMiHUA16Q/OND0AYolPJPGKXGWw0qPT9MP//xav6R2FYL1KRfqyISLSGdb?=
 =?us-ascii?Q?h7sSrKEzDAOL2uWRrF+czpCmORq0BxvDePW7BwMN0Sq6YUnGBGNe7fDrmsQm?=
 =?us-ascii?Q?O6dwlC8T3tLNDS+uhxBI8v+EfD9pu6raNqSOqxBDnqyBtNfaiSIqGTC2aF3x?=
 =?us-ascii?Q?4vAecTR2pKeogG86/VRHZ6uESl82oeeYKXR46jA1mV3glp4s+P7l5IrBrHd0?=
 =?us-ascii?Q?NP27BHr8RAa8bYEi4ViGKUsaIkwSWJGcTl7oKTcmdQpx31SfiyvosMGMfoR+?=
 =?us-ascii?Q?3w4aRqW8A5G9g7B6A9vemZADQcZ9AyUxC4ZfcZvG0UEyVHBtyUjNh3ep8MKm?=
 =?us-ascii?Q?D5haJq7bx9YU4ijB4+uRoKih?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd334d1e-b834-4780-a3ff-08d95e24133c
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:32:08.5619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 35V4+9lyfgFCXmZcLDw5FEYU82/srf5qdcaPailVw++3HaqT2Q+uHWvF1P9Qf4bEQ9aGRvDzk3bOU/+lE5zvAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2782
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MEMORY_DEVICE_GENERIC case to free_zone_device_page callback.
Device generic type memory case is now able to free its pages properly.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 mm/memremap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/memremap.c b/mm/memremap.c
index 5aa8163fd948..5773e15b6ac9 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -459,7 +459,7 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
 EXPORT_SYMBOL_GPL(get_dev_pagemap);
 
 #ifdef CONFIG_DEV_PAGEMAP_OPS
-static void free_device_private_page(struct page *page)
+static void free_device_page(struct page *page)
 {
 
 	__ClearPageWaiters(page);
@@ -498,7 +498,8 @@ void free_zone_device_page(struct page *page)
 		wake_up_var(&page->_refcount);
 		return;
 	case MEMORY_DEVICE_PRIVATE:
-		free_device_private_page(page);
+	case MEMORY_DEVICE_GENERIC:
+		free_device_page(page);
 		return;
 	default:
 		return;
-- 
2.32.0

