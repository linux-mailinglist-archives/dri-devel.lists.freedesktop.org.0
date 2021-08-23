Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0713F5320
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 00:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2366689C13;
	Mon, 23 Aug 2021 22:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20F289CF1;
 Mon, 23 Aug 2021 11:44:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3RuLLbkdZn50BP3gMt3iRFb8t90nuZrpBN1NqKul3lqFwaaT4YFsld4iljyNHrItL+mARPe0LOw9MzYKSp0xFS9g7DyDH7bVK/1rQLXu351uZlbRiviTz6KEl2Mq57Yhv/3Y9g4CpXd3RBb2QzQ49LwvIElsw+58ZosOf7NEFYJKq1jshKtTFkcRIuBLjPpasX9YrzZzCsuzOnbMTF2cOZexz4dCJTcwsVzULiKiH2cNhWJmxoKNKrBb0mc9Cfax8iAdLq1hLkOB8VLNT4Kn7+x5wHx3fG6HXO+/A1FVmG1CRZ3cAH3zEkddyEjGAO3RIRmIg4FupY/nb83M6VDAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkgNmXwZ9Yz+ZvPah6y/HEAx8Qx8vRSF6j08o2JdW7A=;
 b=V5hvFa+Whr1aRXgAyqPO7pijVfYMsGxgQpicAiXBZsoSVkKC1rgHnUReAYQ6ZYezyfwVDuqApsHVE9mp+eG9LBTfRolAMZI9R9E1+epzAN3wVD8R/CqcTO2rawU6DTx8UPfVPfP+4+JqH1Fo6J274uFiOpRT2LR1pdkvRFNUZybmA1M9FkDnpNU8n/S5SjsAGxnREEtgShqk6jOpp8K61v2x9e/Ni7lnhrl8ytJy+zzxODvAm7rLlEllixKnwNxe0VMnxn/g5PDi7kedNAMVX1pnMl14JTiV1uQvywN32NNcToaOYZjojOsKBPh0vYFE2hirVLc5uys07S1RQ310Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkgNmXwZ9Yz+ZvPah6y/HEAx8Qx8vRSF6j08o2JdW7A=;
 b=Z1/IPlVGY7pRaXINZ0MrnYnhlScXhA4jDD3oXjcYUSUBnW4idyCGUne9BEtpwcvYU04zqDdXUs6JSEIeBmSIUeewaQLNBx5VmKEJRovNQqXQTh7TSohww+K9bYPXgi6Qj5SCVclygpXPCTA3+x1x1MGZt1/NmcppxfLpPGyhKgfTOFfeKPsfOhqVIVubB0BMcrVxxUtsfVRf1ABk8SlNmiDoXHH+A4UA3tmnIrVdj00jo+2yg8spyDXGwnqkPLA/ygI5uU0OSy/n1boCf+mCNjll3l+M+yI4JvrQFHMPp5KxMwDkmoO/jCuU1FHJHiBdOEge4ejj9sAIH9MFgoHz4g==
Received: from BN6PR19CA0119.namprd19.prod.outlook.com (2603:10b6:404:a0::33)
 by MN2PR12MB4224.namprd12.prod.outlook.com (2603:10b6:208:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 11:09:47 +0000
Received: from BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:a0:cafe::8c) by BN6PR19CA0119.outlook.office365.com
 (2603:10b6:404:a0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 11:09:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT063.mail.protection.outlook.com (10.13.177.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 11:09:47 +0000
Received: from [172.27.12.76] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Aug
 2021 11:09:40 +0000
Subject: Re: [PATCH rdma-next v3 2/3] lib/scatterlist: Fix wrong update of
 orig_nents
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leon@kernel.org>
CC: Doug Ledford <dledford@redhat.com>, Christoph Hellwig <hch@infradead.org>, 
 Ariel Elior <aelior@marvell.com>, Daniel Vetter <daniel@ffwll.ch>, "David
 Airlie" <airlied@linux.ie>, Dennis Dalessandro
 <dennis.dalessandro@cornelisnetworks.com>, <dri-devel@lists.freedesktop.org>, 
 <intel-gfx@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Michal Kalderon <mkalderon@marvell.com>, "Mike
 Marciniszyn" <mike.marciniszyn@cornelisnetworks.com>, Mustafa Ismail
 <mustafa.ismail@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Roland
 Scheidegger" <sroland@vmware.com>, Shiraz Saleem <shiraz.saleem@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, VMware Graphics
 <linux-graphics-maintainer@vmware.com>, Weihang Li <liweihang@huawei.com>,
 Wenpeng Liang <liangwenpeng@huawei.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zack Rusin <zackr@vmware.com>, Zhu Yanjun <zyjzyj2000@gmail.com>
References: <cover.1627551226.git.leonro@nvidia.com>
 <460ae18dd1bbd6c1175e75f5d4e51ddb449acf8d.1627551226.git.leonro@nvidia.com>
 <20210820155425.GA530861@nvidia.com>
From: Maor Gottlieb <maorg@nvidia.com>
Message-ID: <85542c97-c7e0-3db3-baa8-2413c00f75a4@nvidia.com>
Date: Mon, 23 Aug 2021 14:09:37 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210820155425.GA530861@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fef27b1-3c4f-482c-3ebd-08d966268521
X-MS-TrafficTypeDiagnostic: MN2PR12MB4224:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42248D1921B89041E9F901CEDEC49@MN2PR12MB4224.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4n97vaUt2c7GzH4Q0q2Dmx/GZyB1jFnxbW1lEHN6n4UTuGNL20c1FsbKLD8xBUhVfQ/pEmmGwBBoZgqXV65E8NWhA6Sn46ZHTbdMeMkNKNggOHUzhCmM06EOW9e+lw6TDwJ6yOBBe7w3RzJA17ktHKLsQ0RGN07LducZag3k5Yiaz+BIIPKmG5+Stz2nTI0zFFSum4C9kyybE7LtmqNCXhSane9lMhxFst6khas8ctH0TFHRyDX1rj18s/JRMhAnzO0rbeJbmY3wsTOnVYMmnVwC6UX6x4YYpo8Rs3uuxJbXkIM/9lyY7fDTTcsh8XCnk66wKnHxM8kUGMdLJG4Y9xf0Spnyd5Ckl0ySfcy+8P1xa10TNEhr8cfvGyYUC5mbYnXNN2ePP3mf0LBO667A9GOaaBxxlZMIs5w3Opc8Bzhu7fBnZe6ie1QaCn2S48XcRPlJ2xmqSzOtcrXHu0nV6two24+BVJaNQ0g4hiBVXW9Kplo/ls4KVHCe/c+qNMIBoz/hoEZAbzDKiCGUmv1P1tp4uEUbQZrrMd3K6qHIvGutH2qPhJOFYGzmzxSelG3mqlEdwomDHt6KHVUKCe1GjNiwsYozLexhMalVoqbD3KMplw+zV6Ph8ftyrCYfZ7FrThA4cZW3AT0+DW4Cerfcbr4sAt5Ex0PxRtoz7nJbmx6WGkKZgo0wRgWK4/LzQn/s9mIoxtj0KHXGhTo9bNthao5cqHFM+aoUMJQrxzTPvRs=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(36840700001)(46966006)(82310400003)(110136005)(16576012)(53546011)(82740400003)(7416002)(54906003)(31696002)(478600001)(16526019)(7636003)(70206006)(36906005)(356005)(36860700001)(316002)(2906002)(2616005)(36756003)(4326008)(8676002)(86362001)(6666004)(336012)(5660300002)(31686004)(426003)(47076005)(186003)(26005)(70586007)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 11:09:47.6425 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fef27b1-3c4f-482c-3ebd-08d966268521
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
X-Mailman-Approved-At: Mon, 23 Aug 2021 22:00:13 +0000
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


On 8/20/2021 6:54 PM, Jason Gunthorpe wrote:
> On Thu, Jul 29, 2021 at 12:39:12PM +0300, Leon Romanovsky wrote:
>
>> +/**
>> + * __sg_free_table - Free a previously mapped sg table
>> + * @table:	The sg table header to use
>> + * @max_ents:	The maximum number of entries per single scatterlist
>> + * @total_ents:	The total number of entries in the table
>> + * @nents_first_chunk: Number of entries int the (preallocated) first
>> + *                     scatterlist chunk, 0 means no such preallocated
>> + *                     first chunk
>> + * @free_fn:	Free function
>> + *
>> + *  Description:
>> + *    Free an sg table previously allocated and setup with
>> + *    __sg_alloc_table().  The @max_ents value must be identical to
>> + *    that previously used with __sg_alloc_table().
>> + *
>> + **/
>> +void __sg_free_table(struct sg_table *table, unsigned int max_ents,
>> +		     unsigned int nents_first_chunk, sg_free_fn *free_fn)
>> +{
>> +	sg_free_table_entries(table, max_ents, nents_first_chunk, free_fn,
>> +			      table->orig_nents);
>> +}
>>   EXPORT_SYMBOL(__sg_free_table);
> This is getting a bit indirect, there is only one caller of
> __sg_free_table() in sg_pool.c, so may as well just export
> sg_free_table_entries have have it use that directly.
>
> Jason

So I can just extend __sg_free_table to get number of entries. What do 
you think?
