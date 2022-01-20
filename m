Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F028494759
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 07:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3607C10E64C;
	Thu, 20 Jan 2022 06:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2066.outbound.protection.outlook.com [40.107.100.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397AA10E64B;
 Thu, 20 Jan 2022 06:33:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQFA53/EW11ow6+6Xrlf0lX+H1kLAhummldqFRb4pFSpyuXNhwzxEMSr5z8s66IKBZYB8Xc1SLE7mkRoTAYYf6S+GZ49Z18bPHvmcowczqV0b6LMDa2m5eCxnW16cKt3yfim8uat9N6ZH9vBMf9tkFfItdKOx62wVuX9Q/faPVwcndDGbyxA2QAZd12Rze8aqpupAe2wiPLWFG/pxL5HXayBbcybznkpz+IDRbHZE1fyvOJShLzbVc40eAl2titqvoH6s7ZuGtteDbYmarNmnhRhOr0QnwOi8jbq72kfukb3p1VIfweDyWpayB/egEKb4GaNHeBUoM832fnzTzJR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3almGbydkQgDFjE+PHW+drZMheuGVfqmCV6AIA190A=;
 b=kJu1z3daIrPh7AEUU5gqIfQ1wHQuVqGCQzP67l88DzNfQ6NKgjbOX4whN/5C72HDDG7DMIY4D5mEJqy4hG+pFiZnIgSh6I6/FzLsEyR54fjgAN95Moq13m2SZYe9Q5SsIvjPEbQbJN6YPqsNcYBsMz8bzQfR8Q4a6eoqJSODK8qIsTGExfbaNp1+wVUbUZeIj7tG7uNDOcSi9mGdGqlecSQIIGmlyHAXMFQKDje/+4NIKG/pTbjUlR0yH+/b4hc30H/GG0zWKokw5kxsHZy/JzgRgCuxl0ityN2wRUYAQFlFB9/DyHECob+aSCMOJq4ESAMh8tItN+PUjqAlXDw6GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3almGbydkQgDFjE+PHW+drZMheuGVfqmCV6AIA190A=;
 b=TfdJh3zYzU4db6neoLuzMtIS7CKn6aX3EwNsGk5GvYmLY9dLW+vfj8kbscgkxrEqxKGkoVFFJlcf+8ju94hA1Qti4NtdpwaIVrCyx4iNaLSobpVtVlYwqEDhC4dDcxtNxmEX3JZNajiAPlpw7i++k4ozV9y3SlyCyBJph5dtIWXhCRpfI7aIno8tz/JQHWc86wAwm7rHVdNxD/Alp/tQXLZJ4L8A2qeYPP2Pg+mGvOw3AcuNYnqMVwx2yuSlvS+Xd9tuQmdyUnEz9PCTbahO9E8UI8jqKQmvNc5CGF5+9oTRDXiE3asrswBW0n2jZV0uzPDoekgx081aoV3/l5ILdg==
Received: from MW4PR04CA0290.namprd04.prod.outlook.com (2603:10b6:303:89::25)
 by BL0PR12MB4931.namprd12.prod.outlook.com (2603:10b6:208:17e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 06:33:36 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::9b) by MW4PR04CA0290.outlook.office365.com
 (2603:10b6:303:89::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11 via Frontend
 Transport; Thu, 20 Jan 2022 06:33:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Thu, 20 Jan 2022 06:33:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 20 Jan 2022 06:33:31 +0000
Received: from nvdebian.localnet (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9; Wed, 19 Jan 2022
 22:33:20 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v3 00/10] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Date: Thu, 20 Jan 2022 17:33:18 +1100
Message-ID: <3719261.HnWzZch5t3@nvdebian>
In-Reply-To: <2389959.omVpu533ic@nvdebian>
References: <20220110223201.31024-1-alex.sierra@amd.com>
 <2389959.omVpu533ic@nvdebian>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3724f01-50ec-47af-c570-08d9dbdec937
X-MS-TrafficTypeDiagnostic: BL0PR12MB4931:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB49314856B961F9ED46EB4534DF5A9@BL0PR12MB4931.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FoWqP5MoWxhayBBysnblWcZKFquYC/R75dWjD4wOL27f18Zrhhnyk/sD6WoWFDPqPpFKkHTTvFj4VlK1cdLoeAujjsqaA0Ipqbs70dUzkIW8S1Qprvv/ndfEPfJqD/7IetzWB0MViFaoImNGIA1/QWSiuKvCj8anwSAie7ps21FCLH1s376Z+HJpxCMYPQ9HZWF4rGmP7AtmRilxAHKfdmuL8oEYvonE8YqComx9yIsiwYYNrY8yBuKQ6kL24JKjJ+1wB12XiGrjeZDfbDJyEn0hwGI56Pq9f/VYDacC8BnfKqA1NgKEEpJHtAriGxborTmAu4CpfnX+oHPmdYoEC/6MHaNpC/ndtIAnZDL++zfOI3EIUPFjCuR6zZrXU34ooCgBLI3O8vPJERs9TgL3o5JpkbfJHyUVcG4/s3dZSOijmTTUw8X+s5l1YWA3Mks1wInx09aUfZ2YWCQjMpXxXLr93ABgvFq6eTR0JqlksasJjaULEPgfEogyvAAO5qr5ZhIJqGV7UDLuORWPvqe7IBOknEwFfCPJ9/auxQLkqq8DAitPUei908IUHpjQ5LadNiSxEHzac9Z7i9BSS7QVfxR/dCqrSLsLlDDbzNdk5xF6zgckvzYBW3+2u5GzmliJ2DUVlM7P6vOnOyF9m/XTpA0fgsX+tScNDtVMGXnV/qIToYGQdKjaFKTlAQJiQ4lVIQ4lPJ+xkKYoMUywBSDxm80wc9i1OE4H5LFDO/YBnNwnb9fCZ21PqpRyKeTB48QLITdXuMWs+2KP7TgG5GXPv4FnXnoIRKc0uj50VoQY5G/NR9D2cOFiu1CBHHIRlk8kzeN4xldPXHbl3Npjaqmwzg==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(5660300002)(26005)(356005)(8676002)(70206006)(82310400004)(316002)(40460700001)(186003)(16526019)(47076005)(9576002)(83380400001)(33716001)(7416002)(110136005)(70586007)(81166007)(426003)(9686003)(54906003)(336012)(508600001)(2906002)(8936002)(36860700001)(4326008)(86362001)(39026012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 06:33:35.3952 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3724f01-50ec-47af-c570-08d9dbdec937
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4931
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
Cc: amd-gfx@lists.freedesktop.org, willy@infradead.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 12 January 2022 10:06:03 PM AEDT Alistair Popple wrote:
> I have been looking at this in relation to the migration code and noticed we
> have the following in try_to_migrate():
> 
>         if (is_zone_device_page(page) && !is_device_private_page(page))
>                 return;
> 
> Which if I'm understanding correctly means that migration of device coherent
> pages will always fail. Given that I do wonder how hmm-tests are passing, but
> I assume you must always be hitting this fast path in
> migrate_vma_collect_pmd():
> 
>                 /*
>                  * Optimize for the common case where page is only mapped once
>                  * in one process. If we can lock the page, then we can safely
>                  * set up a special migration page table entry now.
>                  */
> 
> Meaning that try_to_migrate() never gets called from migrate_vma_unmap(). So
> you will also need some changes to try_to_migrate() and possibly
> try_to_migrate_one() to make this reliable.

I have been running the hmm tests with the changes below. I'm pretty sure these
are correct because the only zone device pages try_to_migrate_one() should be
called on are device coherent/private, and coherent pages can be treated just
the same as a normal pages for migration. However it would be worth checking I
haven't missed anything.

 - Alistair

---

diff --git a/mm/rmap.c b/mm/rmap.c
index 163ac4e6bcee..15f56c27daab 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1806,7 +1806,7 @@ static bool try_to_migrate_one(struct page *page, struct vm_area_struct *vma,
 		/* Update high watermark before we lower rss */
 		update_hiwater_rss(mm);
 
-		if (is_zone_device_page(page)) {
+		if (is_device_private_page(page)) {
 			unsigned long pfn = page_to_pfn(page);
 			swp_entry_t entry;
 			pte_t swp_pte;
@@ -1947,7 +1947,7 @@ void try_to_migrate(struct page *page, enum ttu_flags flags)
 					TTU_SYNC)))
 		return;
 
-	if (is_zone_device_page(page) && !is_device_private_page(page))
+	if (is_zone_device_page(page) && !is_device_page(page))
 		return;
 
 	/*



