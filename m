Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6DE3EF670
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 02:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAC56E245;
	Wed, 18 Aug 2021 00:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDDA89C28;
 Wed, 18 Aug 2021 00:01:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaTLhUtlbFhUitQOYzwzR6RCAWkqILoVQJ+wS13+Xa4+CcmUSSHoQFzOLwiwbRZb/4ZCAija5/PjMVfxvM1XkeF7PsEjkCIi5r5x+YKy0kvRst8cTPdhv+MGPIkGBwGEBFmiE0nrRwcrYzVW0u1PlQbrTjM1dDBrCODfzM/zJ2fuotebhSyDJIQlsQ+5NaqJ6yT1oB34OaL2EiYKGI32LMLoD4/HzrKLn4WjXaEdX8S9oK/Oeqo1ZUwBpYLao51Mx1VM6g5yoCBrY5lvvF6sT9M7GRwhzotkNBSmWT3pIjv1ylwsp5Rs88RlxpEbjLieh3YT5PsTDSju5KVxhrE6kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQrqjshl3TDhb0gF90eaA5dFabAR2Kiv++gmORsuswE=;
 b=kv30LowLmi4tkYYSh5slCRJ20rplURbw3PPZGuBf3K8VLAuhaIA7KBFHZvnXZ3k0TMs86C9f1sNCGseI+hooQfQS5a1btBNEHgVGABUSlGSr+SgvHFaB6H1+ZStTfVx+IQFIpejsWKSOGIAc5hBvvWhjUFEl7o5HpLe7EnS8q8jMOnKAWuQOGhtY/H5/n3FQgq0+Uf1+9L6VjDdPsm16nuGdDYdbaY1vnNktnxFyBt2P8o3Y2sZLba3ss84fczSyusKWBWfDElpY4pf2Vcmfxxyl4x3u0+Ci4XBESzWfez3OJvXNTn5mntHiiuiXWP76CxlHAyr+8X+a8qhUFQJYKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kvack.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQrqjshl3TDhb0gF90eaA5dFabAR2Kiv++gmORsuswE=;
 b=DH5avyc0tHzRTTmqhutMviAfQPEUFWwansuP5xHONbf0Epko8xthfDvMMlZXXTJ2DIBWYiPPrQDf+veCP2YcJDC3ugGq/QZaLbx8Nu9K6HPiFNuo/o64a3h9xQEatBLcTtyZfcst7/ulziQJzyLWZ2M+78l6aDGIVta81Qset7bjkGfbR3CZt9/sm+YngUTOF1sDgb45malfs9q0HwbrhvHeq6Z7whLQ/gW4I4Q37gSA46GMnwc2dyf7lyhhneGDxI+Xg3h+U5dLpTLjg6mdMG5jn1Mh+CmQZCbYP1f+VXj4LvqsBo7D5V9tSow0HWyKJsBGioyY6opDqsm/8TX8zg==
Received: from BN6PR16CA0019.namprd16.prod.outlook.com (2603:10b6:404:f5::29)
 by CH2PR12MB3749.namprd12.prod.outlook.com (2603:10b6:610:2a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Wed, 18 Aug
 2021 00:01:32 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::60) by BN6PR16CA0019.outlook.office365.com
 (2603:10b6:404:f5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 00:01:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kvack.org; dkim=none (message not signed)
 header.d=none;kvack.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 18 Aug 2021 00:01:30 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 18 Aug
 2021 00:01:10 +0000
Received: from rcampbell-test.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Aug 2021 00:01:10 +0000
Subject: Re: [PATCH v6 02/13] mm: remove extra ZONE_DEVICE struct page refcount
To: Alex Sierra <alex.sierra@amd.com>, <akpm@linux-foundation.org>,
 <Felix.Kuehling@amd.com>, <linux-mm@kvack.org>, <linux-ext4@vger.kernel.org>, 
 <linux-xfs@vger.kernel.org>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-3-alex.sierra@amd.com>
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <7b821150-af18-f786-e419-ec245b8cfb1e@nvidia.com>
Date: Tue, 17 Aug 2021 17:01:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813063150.2938-3-alex.sierra@amd.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f962c3bd-3e5c-4b7a-ced7-08d961db5599
X-MS-TrafficTypeDiagnostic: CH2PR12MB3749:
X-Microsoft-Antispam-PRVS: <CH2PR12MB374903EF1A56A6083C995D32C2FF9@CH2PR12MB3749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fwChlIYPpG0iK0obEr7ZB+dYf72S3W4MrVhaxObO8BCV7Cvb/iIB1K7yXzylBNUBWP7ESVSrJiOOjbj/i9Qb7O49mtmcMCka2dOUxnY+GGBz/WRGMOAXYZbSEnAXpVLtL2DnmezYL1Ol/OshvrOEU/5jBMVuJwQoHuk+Le/Xqo543zKox5Tcy9nsb5NI+uKNyYra7Pge8wCmjK7I5X3MdMzCFZkyI9w8iCrTj2I3dZH0yJMiXgqEhLmAuD37OflR4id5rbLvdaKrQxrvLa7G+U4cwJjtRgRvfrIBGX8Hua5dHfptqlqRPZnjikBRrqMq03cwLmXa69HbRQ/AORMkqMsb3jplZ5pw453QgW7SNJdjXTqyvIxPc4H3VcOEV9pRVWFi7CakdBRaUaGbzvWwzjYoMkPbX8CISf5uUC9t/Gbrfr5RKigkMpu+JVUGMn+34Ef3VCCjUgYNWSdFYrQhKu3AUa+9YrGbkun7ceq5NPorFCun+SfyGFNtmKKTuapwfJvq/QEAr8CveY8cAvI/mloXwD0aI/X5hwlY/vf55vzgDWqdxnfSWZKulms5KA0Jkj1bbGEGwwhLTCuex4UQB8x6vlvpZY0FA50rFQ1kpwp5aDYCt6ng8+MYyq34bqDAxBZh1TyHfuiVss9hlrO0rB8p0JfJLFdVqXYc+lwzVDylj7uPmTwaAD4sGDvurxqEyh9fdGlwsKh9lKqvlU2/M1GBDbqZP7+Sog6ZQvRAAhyAmmMxkSRpu+Dk4WyzB+zkv8rCs6HcBt7FnLXtgsVx44Iw785Wktp2V2LyLabsyBjMAIf94N6fzu2pXg1yM1+53ZNDqdR4YrVMeSTHIeqRIw==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(86362001)(54906003)(26005)(31686004)(36756003)(2906002)(31696002)(7416002)(426003)(83380400001)(336012)(186003)(70586007)(47076005)(70206006)(508600001)(5660300002)(36860700001)(8936002)(8676002)(316002)(36906005)(82310400003)(356005)(7636003)(2616005)(966005)(110136005)(4326008)(7696005)(53546011)(2101003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 00:01:30.9842 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f962c3bd-3e5c-4b7a-ced7-08d961db5599
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3749
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

On 8/12/21 11:31 PM, Alex Sierra wrote:
> From: Ralph Campbell <rcampbell@nvidia.com>
>
> ZONE_DEVICE struct pages have an extra reference count that complicates the
> code for put_page() and several places in the kernel that need to check the
> reference count to see that a page is not being used (gup, compaction,
> migration, etc.). Clean up the code so the reference count doesn't need to
> be treated specially for ZONE_DEVICE.
>
> v2:
> AS: merged this patch in linux 5.11 version
>
> v5:
> AS: add condition at try_grab_page to check for the zone device type, while
> page ref counter is checked less/equal to zero. In case of device zone, pages
> ref counter are initialized to zero.
>
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>   arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>   fs/dax.c                               |  4 +-
>   include/linux/dax.h                    |  2 +-
>   include/linux/memremap.h               |  7 +--
>   include/linux/mm.h                     | 13 +----
>   lib/test_hmm.c                         |  2 +-
>   mm/internal.h                          |  8 +++
>   mm/memremap.c                          | 68 +++++++-------------------
>   mm/migrate.c                           |  5 --
>   mm/page_alloc.c                        |  3 ++
>   mm/swap.c                              | 45 ++---------------
>   12 files changed, 46 insertions(+), 115 deletions(-)
>
I haven't seen a response to the issues I raised back at v3 of this series.
https://lore.kernel.org/linux-mm/4f6dd918-d79b-1aa7-3a4c-caa67ddc29bc@nvidia.com/

Did I miss something?

