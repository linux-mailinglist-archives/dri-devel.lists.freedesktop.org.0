Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5A53F7BB1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 19:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48C76E3F5;
	Wed, 25 Aug 2021 17:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2049.outbound.protection.outlook.com [40.107.100.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC4D6E3F4;
 Wed, 25 Aug 2021 17:49:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L94HSvLZfRi6AQzrzB8rHeSlzSUiP86AbnjH1OOvgpKk65tUc6rs8QtBNDOdoZ62BnJyUPOzMdX67B0kV7y3kNKW/c6yICdKixeEEgHq1vDbjZjJzv0OiGIf1Q/nab+Od9Od5ZE1EmEBsFKBXO3Lx1RgsU9Mf2oqjzxjSCPDOuJrDaRiHo9FxTOKon4JcjkvS7Glm/BrcCdmHPM9Hzrtcq262vQ0bY4BbEuQSLTV4Q5AIzco1Ogi8f4Xa/XtjUeMjdWmfMjvcIeQrThHkXpu54ut+kytfMpNsuPCDs9e6JvK/zt/jprIa941O4286GFsqUdKGyS5JjRe1lgIB55izQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=836XBpZH3d+fdvKEqzLZQ9K3DZDuUGf5MVN4Xajae/U=;
 b=iQ3DEJe1rgZMRiobhuAx8RpzIQL5zb2yhwZtj0Enw9hmSzw0gag6v49qZX/ILzWTUuRdDN4erF9Qn1lS83507THQJo5y9oQyE02tVdrfabwLl9KthsX+hxCeYnrhJ4cOt7XCoSF2EBzgupQbUWpcKsbNhR2ehYpyPWOFGmsUZOTrz47LwiY1a2SsM7jLEDUvhhrOmVX3+ZbFP2TF4G2kWuug3fXilvylcgKIXDR7rIhqoSTL/dsT/4SE+XzU+rreANhEbSnwhJzVwa2pli6VXQFdEFqF5K/envRa6KZdGalb9APSjp5PcgB08QCKOyiKk6GVFzmvE3qlS/XVpr7efQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=836XBpZH3d+fdvKEqzLZQ9K3DZDuUGf5MVN4Xajae/U=;
 b=Uf5FX7oqFx5m4K3QumLMI8Sc6QROdZUFouqpra7HvUCKDSG3HEA+icbSISQTT9JSoS3A0ljBJDniydPv3njc/8IhDpOEI25e6kCB6N0cV1FdaJ5QyZ2Mw8w5kZRje4eXTGwT8Y7O9wwX6wT3g93MyLeKD2PiAHDgnrGv2z+COSSwilDNirsvPmZAzffaVTXyIdN4mPhVaVnVERyssXDGgsW2wZG4fof5SWvKU+Lr+a/A67I5WN0KwVEFjT8jDvdr/+UieNwRNy7HGoK2zN4VkwTrHV0hpH0QPrS0mRxk+pHpEEcU05SYv2BjV3aN+pNp1nbg0tapYNwDqkEZinaQSg==
Received: from DM5PR07CA0156.namprd07.prod.outlook.com (2603:10b6:3:ee::22) by
 DM8PR12MB5495.namprd12.prod.outlook.com (2603:10b6:8:33::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Wed, 25 Aug 2021 17:49:03 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ee:cafe::eb) by DM5PR07CA0156.outlook.office365.com
 (2603:10b6:3:ee::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 17:49:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 17:49:02 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 17:49:02 +0000
Received: from rcampbell-test.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Aug 2021 17:49:02 +0000
Subject: Re: [PATCH v1 02/14] mm: remove extra ZONE_DEVICE struct page refcount
To: Vlastimil Babka <vbabka@suse.cz>, Alex Sierra <alex.sierra@amd.com>,
 <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>, <linux-mm@kvack.org>,
 <linux-ext4@vger.kernel.org>, <linux-xfs@vger.kernel.org>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>
References: <20210825034828.12927-1-alex.sierra@amd.com>
 <20210825034828.12927-3-alex.sierra@amd.com>
 <dbd0f54a-ad6c-97a2-17d7-826247424c97@suse.cz>
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <505e4fe4-241a-8205-d2ef-f603e9cc46c6@nvidia.com>
Date: Wed, 25 Aug 2021 10:49:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dbd0f54a-ad6c-97a2-17d7-826247424c97@suse.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f60f875c-00f9-4d75-cfc8-08d967f0a062
X-MS-TrafficTypeDiagnostic: DM8PR12MB5495:
X-Microsoft-Antispam-PRVS: <DM8PR12MB5495C64B7D3FBA3447A5AAF3C2C69@DM8PR12MB5495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EUD9gLnj84NJTkTFCk9HSdNz/cRUsi1KSKwCAoDcNO3QWfBp6CawHcI3WLkRtFDJAzmZjFcCBSdCSgtPspHuPgtg4Q0Oo1g319KIjspMISuKp9sUN+7dzDIvVgDSuKQFlsCKAYniRMrzVYMj+UbC6e2q7vPakMS+wv+ok9XcAWzYdAa1q7pN1qN/sklbMADA/MzHzlpfZEoQ6M7JQwfJ3EsrUlhGJ9gLZN9ejit5ZqXb7EJKefpFCAwrJ3AMe2MoiNnXHdd/Dao6bJcR0P27rOf22wNRqGgCLCQn40dmk7+u4oi5V2bf2jmMW94PaueOvIu3d/EbmjKhDx/dIy6SU8YEm5r7Jv0YXgOkToTa2AhS8gBHocb0NPWYfl79egMkbeDVV5T5i6c1tUGWcsgadBwqOBJC78YIlwcibpas49utWk8k2c1Gtxh86wgMPid9qkepvhACzI79kUhjzhPHLvDKNEijoXn6D25j5tByC8z407BINNW5op+HKznbzSBQhbItHs+bu1V/lwDwbuGaqzWVbezMdpQ28JIn38YypNIe8OnTTb3gXZnH90LLs4oKDCkGh2hGpZWg5lI0ELZEiiVcAKoudZ+uCCJMll3cFAfUe+UusE4MD41BlNHIb5QKNQhor4a/c9hDGTR23lo5OQtBka6KjHlnzuIKLAE6X6OGdPqwcwupnTQlCkXah+aAqq9/Tjij1s/2SPQrjyE55sTMZmr3vamrxnSrOtBzV3jcRtewF1gZ7/s1PAUN3+ug
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(36840700001)(46966006)(7636003)(478600001)(316002)(26005)(54906003)(110136005)(36906005)(82740400003)(31686004)(2616005)(53546011)(36756003)(336012)(86362001)(426003)(31696002)(70206006)(47076005)(7416002)(36860700001)(5660300002)(186003)(4326008)(8676002)(82310400003)(356005)(70586007)(2906002)(7696005)(8936002)(43740500002)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 17:49:02.9178 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f60f875c-00f9-4d75-cfc8-08d967f0a062
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5495
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


On 8/25/21 4:15 AM, Vlastimil Babka wrote:
> On 8/25/21 05:48, Alex Sierra wrote:
>> From: Ralph Campbell <rcampbell@nvidia.com>
>>
>> ZONE_DEVICE struct pages have an extra reference count that complicates the
>> code for put_page() and several places in the kernel that need to check the
>> reference count to see that a page is not being used (gup, compaction,
>> migration, etc.). Clean up the code so the reference count doesn't need to
>> be treated specially for ZONE_DEVICE.
> That's certainly welcome. I just wonder what was the reason to use 1 in the
> first place and why it's no longer necessary?

I'm sure this is a long story that I don't know most of the history.
I'm guessing that ZONE_DEVICE started out with a reference count of
one since that is what most "normal" struct page pages start with.
Then put_page() is used to free newly initialized struct pages to the
slab/slob/slub page allocator.
This made it easy to call get_page()/put_page() on ZONE_DEVICE pages
since get_page() asserts that the caller has a reference.
However, most drivers that create ZONE_DEVICE struct pages just insert
a PTE into the user page tables and don't increment/decrement the
reference count. MEMORY_DEVICE_FS_DAX used the >1 to 1 reference count
transition to signal that a page was idle so that made put_page() a
bit more complex. Then MEMORY_DEVICE_PRIVATE pages were added and this
special casing of what "idle" meant got more complicated and more parts
of mm had to check for is_device_private_page().
My goal was to make ZONE_DEVICE struct pages reference counts be zero
based and allocated/freed similar to the page allocator so that more
of the mm code could be used, like THP ZONE_DEVICE pages, without special
casing ZONE_DEVICE.

