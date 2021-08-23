Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D78C03F531F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 00:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26A989C07;
	Mon, 23 Aug 2021 22:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2063.outbound.protection.outlook.com [40.107.95.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F33689C14;
 Mon, 23 Aug 2021 13:45:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzXM5b8HL3yYerT6cPLnRLAlhJq7GLlbMqmxBaQ67O54u4D+vavR8MhDmHgBLqgcsH+ud5iUec1Y0U3GKJ6mo63g0ThsaCdSDZDHfUOD3iB98VpasI+Jqg0teJ0edUKUeQgkjcXtVLysUdxjjvpGc9q6ypvv5Txkr+ImYUQv1TEVZqzIQQRihWoF1J5f/D/rGffH30qQIcbVEauefT4wQNvKHwbqwjvVWD6HeN+O9GCtJo0tjq1uY7uMlTwip/dM56WaYRciFak9hJJXcSajT2Ag9uUMjGDlUTa8j5f4rCBcbX5wh+Xv5vGGrZR1hZDlLqGxPg2QZCbF7GZSBhR8FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85yl4QGuSYORHQfUE63D3OWqQFAmYhFQolIA5iGTp9k=;
 b=Uc3tFjMDMJEEPA95RxDPP9pDX14Z9+TqP7TX2Q0Ly69WsMFREB32E3V7hAd5d89KIg0PSLjFJ5l5T3FsFtpmCkPQcx0tAgUNlTeY8038/2tzjzS9SEdNMvhHgqVesWy9SOEPWRDebJX+9gGxzuWJeYfJvn9QVUAI0vJSEjqNCt4CURFa67uOsZGC2gNMVWQAz0zBF20gHW8GSJQ2ucEKfQyWc1jTjIacKj+1stZ9ccq583t2QNH4ZkBWRhO8H9OXVc5j5xR4hHAdcoo5UJraU3gCpkMIUSp62crSW41bufvORGEnOL/2XMS98ugc+Ma3CqJa0Cw/GomchST3EYwpdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85yl4QGuSYORHQfUE63D3OWqQFAmYhFQolIA5iGTp9k=;
 b=TF13k0UGKJnwN0VF5gcOpfO0Qkn3sjg+NGHMWm5syFGSrMjjOGXF/90qLxvk5cQjgu1sl9tUcGU9sfcuEgS/KGF8rVvapjNGmTsKyDIWGRsXo0JDkcBNUbUO0YvIQcYuMTy9oD8wx/tuStCarJC/Dq8i8YIxi9oSPsJzeP/wE2w0+Z7A8dZpWk3+ijhMNW0SBEITKoKZYg95GZgNbDrnIxd3NGoFBCpbLT2OaZjbZP/oqBM5L0QDAeqR2+VCit2kyLjfAy1qlmJUVkMzucrZAwj/h4OmMDVIC7V8zH0YMSEXSJVDnU1rWaa8ew9kF+6I3LOlv2Ad4S7ee2j/Upvy5w==
Received: from DM5PR22CA0003.namprd22.prod.outlook.com (2603:10b6:3:101::13)
 by MWHPR12MB1742.namprd12.prod.outlook.com (2603:10b6:300:112::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 13:45:56 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::56) by DM5PR22CA0003.outlook.office365.com
 (2603:10b6:3:101::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 13:45:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 13:45:55 +0000
Received: from [172.27.12.76] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Aug
 2021 13:45:48 +0000
Subject: Re: [PATCH rdma-next v3 2/3] lib/scatterlist: Fix wrong update of
 orig_nents
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>,
 Christoph Hellwig <hch@infradead.org>, Ariel Elior <aelior@marvell.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, "Dennis
 Dalessandro" <dennis.dalessandro@cornelisnetworks.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Michal Kalderon <mkalderon@marvell.com>, Mike Marciniszyn
 <mike.marciniszyn@cornelisnetworks.com>, Mustafa Ismail
 <mustafa.ismail@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Roland
 Scheidegger" <sroland@vmware.com>, Shiraz Saleem <shiraz.saleem@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, VMware Graphics
 <linux-graphics-maintainer@vmware.com>, Weihang Li <liweihang@huawei.com>,
 Wenpeng Liang <liangwenpeng@huawei.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zack Rusin <zackr@vmware.com>, Zhu Yanjun <zyjzyj2000@gmail.com>
References: <cover.1627551226.git.leonro@nvidia.com>
 <460ae18dd1bbd6c1175e75f5d4e51ddb449acf8d.1627551226.git.leonro@nvidia.com>
 <20210820155425.GA530861@nvidia.com>
 <85542c97-c7e0-3db3-baa8-2413c00f75a4@nvidia.com>
 <20210823124541.GM1721383@nvidia.com>
From: Maor Gottlieb <maorg@nvidia.com>
Message-ID: <2aab4d71-c6d3-d24c-ed81-7ded355a1592@nvidia.com>
Date: Mon, 23 Aug 2021 16:45:45 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210823124541.GM1721383@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cecae26-0fff-47f0-7eec-08d9663c54e9
X-MS-TrafficTypeDiagnostic: MWHPR12MB1742:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1742AAB0F717166A1D62D391DEC49@MWHPR12MB1742.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D0oEQ0yPwZXf9KN4sZEukM0cGSvnlQ1YfH1RMwaloSIff6T7OXL9ZB5fhceBkbkTgwBcfCL5mz9yPkafkjsvzJNMIBwcp+lSaV6buE+4Ez7FpLXOfUmrc7MCajpKR1UIwN7wCNx6U/4NZXNijQjv4GKnw2xmNQuapOsFyg1hOqksGpdmv/ukr4CuD/8k51A0iPK9NWROxw0Cwm0HCQAkHPPp1v4i1ljr4FnjWpLVABX/72FTG/R68XzRmRPK/4KV+SYs+5Sf0NFBGNpzJnaAbi3CXchgbbDfKmZazSuwZhu2h9QDFfqY2lYvullx9SFwKsjCdi8pg7pEH6Q/1AGqrdvjxp7IWAsTeJAVVIKaKSN3AM4nZ10B5cPjg/Fj8hJbq64Ukb3YFchBF8fl0CCFYiK4YFHmJuED2huZeYc+eYkfIGWDYd/H23kD6wpMhtZ+aZGHroqHAtP/934eIHEYgp6aqiB5l9HngncYLvmBlPGhFT4V4g+6hdwK0CZGZdi/CsVyvGctjhu8eWd9vJCOs8T7QZ3fs3T8zZDbIgAmQawn9PhZQ14VbTUKDMPxajI9leZN1iPsd1UupkerTdZrArd429gp2ajMBzXK1eRC4kz5rH8/ihkj8mhLKdvh56fbViULvCCIZ8c5f/yHfM7RJn7i980/2zGElSZp3JsUqj7EsxwrLpQPGcE24oQYqK4f5MGEQUdr0XVKZkS8W8YbqEmwXNt+oN8vQNF9uPvkjMg=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(36840700001)(46966006)(6636002)(5660300002)(16576012)(336012)(426003)(6862004)(47076005)(36860700001)(36906005)(2906002)(8936002)(53546011)(2616005)(186003)(26005)(37006003)(4326008)(316002)(70586007)(70206006)(31686004)(478600001)(54906003)(16526019)(36756003)(356005)(82310400003)(7636003)(6666004)(82740400003)(86362001)(8676002)(7416002)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 13:45:55.7245 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cecae26-0fff-47f0-7eec-08d9663c54e9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1742
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


On 8/23/2021 3:45 PM, Jason Gunthorpe wrote:
> On Mon, Aug 23, 2021 at 02:09:37PM +0300, Maor Gottlieb wrote:
>> On 8/20/2021 6:54 PM, Jason Gunthorpe wrote:
>>> On Thu, Jul 29, 2021 at 12:39:12PM +0300, Leon Romanovsky wrote:
>>>
>>>> +/**
>>>> + * __sg_free_table - Free a previously mapped sg table
>>>> + * @table:	The sg table header to use
>>>> + * @max_ents:	The maximum number of entries per single scatterlist
>>>> + * @total_ents:	The total number of entries in the table
>>>> + * @nents_first_chunk: Number of entries int the (preallocated) first
>>>> + *                     scatterlist chunk, 0 means no such preallocated
>>>> + *                     first chunk
>>>> + * @free_fn:	Free function
>>>> + *
>>>> + *  Description:
>>>> + *    Free an sg table previously allocated and setup with
>>>> + *    __sg_alloc_table().  The @max_ents value must be identical to
>>>> + *    that previously used with __sg_alloc_table().
>>>> + *
>>>> + **/
>>>> +void __sg_free_table(struct sg_table *table, unsigned int max_ents,
>>>> +		     unsigned int nents_first_chunk, sg_free_fn *free_fn)
>>>> +{
>>>> +	sg_free_table_entries(table, max_ents, nents_first_chunk, free_fn,
>>>> +			      table->orig_nents);
>>>> +}
>>>>    EXPORT_SYMBOL(__sg_free_table);
>>> This is getting a bit indirect, there is only one caller of
>>> __sg_free_table() in sg_pool.c, so may as well just export
>>> sg_free_table_entries have have it use that directly.
>> So I can just extend __sg_free_table to get number of entries. What do you
>> think?
> Isn't the point here that different paths to __sg_free_table require
> different entries? What do you mean?

I mean that  __sg_free_table will get the number of entries. sg_pool 
will call it with table->orig_nents and sg_free_append_table will call 
it with with total_nents.

> Jason
