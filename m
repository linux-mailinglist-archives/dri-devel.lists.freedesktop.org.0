Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92F03EB028
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733876E503;
	Fri, 13 Aug 2021 06:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2080.outbound.protection.outlook.com [40.107.102.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AAD6E4E3;
 Fri, 13 Aug 2021 06:32:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AS+E4QPRx4PfBWQG0qMv/+tb3nLsmbSwJoFJeweilgB40Sm4LZNFsp3Yu3gxkh9ZdvVkgas2NaVqWFOGVmILX+EL1XNYK3FxbR6G7Lhr+0fYV3unSpbUyyC6Tb+RPLZQHjk0ZaUqZj1772q2bGflPFl3rj2I9Pw3JWfBtuXE+Qa6BE6RKoUCdiKRrB9qerbGrofc0fr3pYTLmyxMIQBcNoNqhJ9zDBHch7E3FTvHgy1S/82R+Ameho5jS2k8IQbOF5cvp3u1AvFNBpBeRWk0FRB5NMqJ6UbUkkvoQEVZqNHJKkH7QTdPfD0RIJjIGQUFr6ADcvruAXqxmpSbmclo+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4DDiFWynkpnJt1h94Bfq6HqdNu33C5iIfG/fWH4BAw=;
 b=oN/EgSGA6IHLL5b8qyKt5++pd7MzwkjTAqOsVwFuUeB1WH5PPUBmv2xrl4oQi4dNAFpRozg+cexr6lZ0Da7GXrkZiwatpBeXPdHNk3XWTBD86axth6qvA/FUdS6hMCTmtQZnfHn2339S2DIAsLSDvPTGen0ty3btXvT9RXAT1DqEl5TPIV5PxcAHJkYlPEUZ1vS/2XK10z6X9f9NiWJCxUKnWU/2yceuI7Gc7ZLxbSk66LX0l40lr4cRo/eUIBPMkQh4YePpec4jYg2ZML0wzOFQWyKX/iT0hkEDb1sbITAXKzZupzxY2arNO7k6s0K9qhqKnR5EozwoqMJwNpYUhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4DDiFWynkpnJt1h94Bfq6HqdNu33C5iIfG/fWH4BAw=;
 b=YR4YpLQp7jqrLJAFl07bOf577q/ns1MIcDzUSvorlitYhgFZEiWzlpiqQmRVCJER/4FrFvvFvC8hjYz9e+5R4wzdCKKCi6OJlOT6MRba7/jCbE/suZ5S5XY6sToX9tIisGL3x2tThMShzh5Gx3s1Dl8P+FphyLUW8IJF/ZiadB0=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 13 Aug
 2021 06:32:07 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:32:07 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v6 06/13] include/linux/mm.h: helpers to check zone device
 generic type
Date: Fri, 13 Aug 2021 01:31:43 -0500
Message-Id: <20210813063150.2938-7-alex.sierra@amd.com>
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
 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 06:32:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4b7c39e-3d25-4f17-8195-08d95e241260
X-MS-TrafficTypeDiagnostic: SN6PR12MB2782:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB278296EAE6456DB1AA07E024FDFA9@SN6PR12MB2782.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UEzkAzJX6FPrAXt38j0Y0RLoryVT8gLXoIbhYHYF2F9f6jhidRlaaptSu6GDtv/E3HGoZmHtx9+gFRgCna+nnDhrX5L2bmDbPEV/tsX/0/VfqxW8n1rWQSR3GWY7FWFi8XLs7Zl1DGjlJjNUX/4myDNPkZ3WROYz6GS0yryBmVm5DIOFlSiTWafiSyYPUGtTt5htUpDDmBfdruVmQgbVzgE9AixQ5edzzpfL+sVsNbHN1o+3lEGcK+tmShCObYdf7KGMCDy3zAIEuWOgssTdS7cIIaw44uQ/rsr7NqR4BsMEv6/OXC0cX8a8Fk8FiBzmhwqC1BVb2/rtefqLixfuJPaslMF6o2XVx54LDQoROjDWX0AUcaTb/hF/A9VDjwntmUwHCX08eCyg30jOyQWZF7GNBzcZJFilya8nZqf60OluthvRCpXfaJF81LWxbfSwYCIoki/L3AAET4mf6s0wGfcXJMxrHUbUocBDmTvFn4qbzEWhAOPuS/lSy1Ylj69LhrYXc/RPwsf0LtJzdF0vWNiZNYtXbbRjwddwAEQPQM4pgpEx8m8v9OXaSHVTy+dPv7WSTAtwXK4gqdbaoYoMrzn5E/22YLQLcFSHTttPggFNUOCXSKoi9BZfp6nBWhXyUkElqnvQDXlw0a7Vyo4r2pjM0r53C6ReB57Yvf1sEHAsuUBAbLt5LpNX+V/1d8KgT62ci23GcP6q3HvgqC+VjATTPk5xPqwHjWbBfKLdSYs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(316002)(2616005)(956004)(7416002)(38350700002)(7696005)(38100700002)(66946007)(66556008)(4326008)(52116002)(36756003)(6666004)(66476007)(1076003)(8936002)(5660300002)(44832011)(4744005)(2906002)(478600001)(26005)(6486002)(186003)(8676002)(86362001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H+4C2CEE3x21UsbFUkVhEAP9IE+U/3jMekzUcWVYF/1SAAqaql8j7bm1HMn5?=
 =?us-ascii?Q?bHyxAmowf/LnOaS9/YeIsxsEutLnRTdofSeltNeqyxZSaj5H6Lj+cM+Ucd1T?=
 =?us-ascii?Q?K/IByo1joyth7YrkXugUzLc2/dn+m22a25lrt0UOxclgyVh6R9Et/8nhiOIQ?=
 =?us-ascii?Q?ioX4VqGYabeybilIMXj8AfwGacWklSzsCBnWuMGsUsPM1W05VPfi3QcMObu9?=
 =?us-ascii?Q?NNzYmgqqwahTTTT626ZR1wp81BymmZ87+f49gSDogTA2JtZBi+T6vkXmHNjl?=
 =?us-ascii?Q?tAd3zXjhm08xmKO/j+pvRQv7BNlrW4Pkuty2FVHxrae0IiuC8jens19PI8kC?=
 =?us-ascii?Q?KVtHKVCWCl0gZ9JBYHQEgNMLl42fd6SlMZHYTvT8OslW1YVxcTXsoaOG/W0t?=
 =?us-ascii?Q?lavSJIhFXESZWf48rp+o+6M4F5n3q7bnwAtdINzCyiuL7Ai5w3QRBuHmXfz9?=
 =?us-ascii?Q?TQyeX8nyNXHWXOtX5m4fPNZkNxD6exZhd+sptXI6D/G2UV2ih8xtlPXNPjpR?=
 =?us-ascii?Q?+hgb8vHxjAxKI3LhjCuFcTe/uuNPgeV3GEGwsEdblJsBf/zPiwCSlpSFQ71d?=
 =?us-ascii?Q?eDYUYLSkoq5xlq2Bdmznjypc+mW79IaIouw8wUdXXLZYDiBLCQ8d9Xl+AoYu?=
 =?us-ascii?Q?0MYIFAhEqzfCyLlQg6RsN0rrhED8nYWSFmUcbE5tNeVoclHLukli1U7icYkA?=
 =?us-ascii?Q?39dZBTGrEXjpR4Sut0NtBrd74oYebHhDHzQYg3gor/a7EO8DqO5X8JBwNMQb?=
 =?us-ascii?Q?H55J1PmMTgtIIe93jsOs2aYq8KOxAAj6I2ekM8TyTm/WzZBH0/dVcH9TAA+2?=
 =?us-ascii?Q?gY056bmiVVFP4UvIfHqph065MWYxOn1IEiBXDaHmIF9lQb+lhT1vqMX4M67s?=
 =?us-ascii?Q?tm0zKwA3u8sKut5hgAiC6kAAYev8Cd9roTlIGPMuWv4wnRoQZHX0vDHkoD22?=
 =?us-ascii?Q?TdxGgbtDh6T34OX2JczUDEKRx4GlZY+iXVBA2M5rU9Y9uP14EW88a1CqRKxs?=
 =?us-ascii?Q?5J3RJvxIJT0tXKFodHXUCYPIn/EpGDtcen38WMeqNWWhRkD15C04qDFv29Cw?=
 =?us-ascii?Q?SACZkwlXA/qd0gOD1ARCCdeN+fGNNhpqC7l/XJLXmm+tCN75k8aU0wtCF4aM?=
 =?us-ascii?Q?ipLvbC2on9sf46ysYj75eYYx84b0nefJ6lVn2h/Xn4dkkCBrqyItZaup8r/Y?=
 =?us-ascii?Q?VVv+0t1kZQMDde+RZTFTcl8hisZj1/dpOan+argxfRE34p1wyK9Qf6JyDaTi?=
 =?us-ascii?Q?wPL3pOVe1fcn0xiZs4vj/AH0Pp/KB8uUAVLBZk8NtvvpQTaeY6+hefUX4rPZ?=
 =?us-ascii?Q?bg+BvUL8ZGTEZg+IzHyz4X/X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b7c39e-3d25-4f17-8195-08d95e241260
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:32:07.1073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12LE+rj580zneHsUum2R80wzrSe0oqOle553ibJ6g2bB3gYaBsDkkxH5H5f0nTbdVmekvkVUgR1YAjWK1kDjLQ==
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

Two helpers added. One checks if zone device page is generic
type. The other if page is either private or generic type.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 include/linux/mm.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d48a1f0889d1..c25cdb92038f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1187,6 +1187,14 @@ static inline bool is_device_private_page(const struct page *page)
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

