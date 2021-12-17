Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CA147899C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 12:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7078710FF63;
	Fri, 17 Dec 2021 11:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2056.outbound.protection.outlook.com [40.107.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183E610FF6B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 11:16:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqRMr0b8pS/XeuqGwuqsUeBsB0Df/6Z7MD0PvetGK5t5MA8oR7IpwNN2+T+NGsxzenPl6spKMVAP0nv2HIRSJR52ydE6mCsKkcs5jl1bIkbkAjEOVFLCgYTN+jtlU+73fTxnJMRNRdvnjGJbgOqm/uA7hQsPy8nmZuPE309hzuGeSq6jDUZrE5VTIMpOcWwiiMZRGLsij+kJaqLtvW0G8uZS+v3Q80fHJPkHVAD7D3/S8d9NRMgYSv54MTL6ehH8p6zVKXfa01IcaRbBRF3jo3S2I7Z0tIf6o/m2SYlqQTycqBS2TpUloU6ExaUSGD8f5peQFE9Jf4UzMp2/OsafGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wb1ccurExW31KxcS5Soe4zfKG3G5PNtC59W1vElhu0=;
 b=miF8/MiOguPjsdB/tyYGeVDIWjX85Hv5qROO2Oelq5rda2q5f4YBX9TdlrEBej4JqR37ng+t3gou5Ril6XeglBNlzd3+yXlWMzllSBIfKrb1UxR20tY++YEek/gP5I62km9b9JotXxXSg2E8B581vjHCV5t2iAN2qz0pIRJf+0a6W/yopGhG1N9Hropb/ZtBsrZXREQlCUiu2DpdtiV/K4A0u4KpPrvJNuFzs9CyW7QpuRkETdgOetjnWQperS/wopaaoLSEuIO0+6PFF+2HGaqLUiyIjqmmUjau5/MNpPNzAvRMuu7dY7A6dzm3y7rXfETrjQIgxozGtCbkzCWbKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wb1ccurExW31KxcS5Soe4zfKG3G5PNtC59W1vElhu0=;
 b=P12VbJzZI1+uuKG0t32MtpktXp8rzuKZrF6KHhOB4/Plp1CZH0z0GLthrDDwgTLYa1GAxy5siWSKmBEE1QoyyRvDd9ay6V3Os3wKsAroCMzR0ys4G45PfqbFkCLmz8NMPqyN7nK5a7dYnAgdgReYIDPwJDxRZY0Lpu1iPjHQfpxVCzo/lc5KsKujfqqTqimXjM/6gYnOZ67FQ0pZqsf2ArYpyIERizc8qbKrsQztY+spy+/HuY3+fnih2zgdimj94yYTSp0lM4Gr0rayZd5AwBWh2LKryrcIMXGhmpp7onD7Ch3PcMbDWsU+TXRx+6TYziTnpt2ZqLXAru8AhC7qdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CO6PR12MB5396.namprd12.prod.outlook.com (2603:10b6:303:139::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Fri, 17 Dec 2021 11:16:18 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0%5]) with mapi id 15.20.4801.015; Fri, 17 Dec 2021
 11:16:18 +0000
Subject: Re: [PATCH v2 0/8] Host1x context isolation support
To: Robin Murphy <robin.murphy@arm.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 joro@8bytes.org, will@kernel.org, robh+dt@kernel.org
References: <20210916143302.2024933-1-mperttunen@nvidia.com>
 <10de82cf-27a5-8890-93a5-0e58c74e5bcc@kapsi.fi>
 <a1c8c438-72e6-0938-1b05-09694983164d@arm.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <6d03afa9-f809-f32f-8baf-4348da0dc80e@nvidia.com>
Date: Fri, 17 Dec 2021 11:16:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <a1c8c438-72e6-0938-1b05-09694983164d@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0096.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::37) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ad797a5-d633-48bf-5b08-08d9c14ea57c
X-MS-TrafficTypeDiagnostic: CO6PR12MB5396:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB539667B9CFFC05040C1FEF6ED9789@CO6PR12MB5396.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ecxq9PM41548glOXYSxa9dN1G7IXdBsG047qKrOTQw3APu+zNZ6abe2DUZAhrWX+rw/wQCmo8BxZA2vNgdHD8+ot/mWmWpcE3wlpUhufSLkMTolSwyFISb0kySMknIINSSYxxyNsItu3+TokNeQjuAl62rNrysSWVwMC9H2j5nYwKmhywYaH0tDSB7T/7CdliYUel/qUQ+RWctis6gYudW8JoaDHhI/1UJNlwGcKGr3r8mfvttwhSWiqVW1CPi+2Pys51jnbPxynSLXrPO7sD6s6DbptOcGtWWLDd1Rkry88DW0qhPvoz46gODUEuB90F/x1eJxZwuBM7ZlDiclq66/rvqX/iXDvW3Cu5BS5kp9XnYUZNldVMzXw9jXIJ7jWtM77SzQuhMAs9SiElhLEe7bUbujBuhI9+Hh5CbVYCUWXFJpr1vNAnxp7jTABxIoGRBaXwUR0tHb7/kCHtCoOvELIbKX48HBuZ3Yr+KqXHuJE/39gkGDuzTx99f7MM2lePfMeYi+ukiij63bPAAKzmN4wntmpetYiCeAggBOYV0HfiLfq0Cgk91UyitHuEELtT7ywkOOxEBP+Jg78DGCWqcvDHO9cImiVsM0I8Lp2Dh7DMeCruoW2Jt1gpdghy0zDIxxR63Z3O7En29S9M5P8lfnV60NhaWIb7tXxJzwAAM5cOnkyUDo4GLyuPF23b0ikmuGmoPh+qRvd6kD1G3tkFq/nOF+zl8HqAP2qB5QQ87kNPxtm3FlrnBLGdfonIw4W8Aa+VIX7TVtYCWUh8yhT68Rz9L3ZLLrVxM97uXo6Tzg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(86362001)(5660300002)(53546011)(8936002)(110136005)(8676002)(4744005)(4326008)(6506007)(55236004)(31696002)(31686004)(6486002)(7416002)(26005)(38100700002)(508600001)(2616005)(316002)(2906002)(36756003)(66476007)(66946007)(186003)(6512007)(66556008)(32563001)(45980500001)(43740500002)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFN0aElMZWI3R1R2VEQ1L0lUWkVlU3RvNzdLWC9UMFhwdHd1TWNsSkU5cERy?=
 =?utf-8?B?ODFhRWpWTWpPcWVoZ2RxY1NlRWlEc0hrUThIa0tyb0UwN29ZcEF0eVJyb1FD?=
 =?utf-8?B?UUZmZ3B6bFY5aHdnMVV4S1ZXNklSdDFmL29YaUFjUVBKWlY5dlc4U2VhWDV5?=
 =?utf-8?B?b3p2UkZpdTlJblJGbGhsT0JrWGJJL3h1bk1nQ3NsVllCSTNMdzNWTFhHTUJw?=
 =?utf-8?B?TWFyeUdlM0NZb3dFQ2xXL1ZjYXJCd3NxUkdib2pJbkFpWnU1bUFlVVZrU0N2?=
 =?utf-8?B?SDZQZ3d1Si9LeThYT1NLVUxoU1VCTCsxMXdsOC9WdDRGM1hkQnM5eC9QMzdC?=
 =?utf-8?B?S2x4aWkxc1gxL2NnVE5vUjZCRkdhRkdOc1lYb1I2RCtFeXg0NTZZU1QzSW5V?=
 =?utf-8?B?b2orbW1XNVFRWHBpU2xnWmRLblA3WHMvNVRlNXM2LzZreVZDYTUxdnlob3hr?=
 =?utf-8?B?NXRnZHgwamtLRWozMkNSWFhzSHJUSTZlcnBYbVFRMG8yc1RiTzhYWTl6YTh1?=
 =?utf-8?B?OUY2eDVwVjRkWGFGNXF6M0YvR1FCMFpuUTY5RXhCTUltYkVScGtYK3ZTQkN3?=
 =?utf-8?B?NUY3RmlTUWlCNWdWZWJHclR1V0UwVXdyclpVSFpxQk9ZNm9LNXY1UHplTjds?=
 =?utf-8?B?YjZ1U0NMTGlETm1VaDFDLzlKUUZvT2dVenpjbWhtaDA5V2dKUkQ4Q0YwNUto?=
 =?utf-8?B?VmluVW1WWXgrUGlZOWQ1elkyNzMxcDBHTnkyc0lhKzdYRVRmNWlCM3M5NWFO?=
 =?utf-8?B?UDRWVEhQdnY4amFCdUUwU0c5ZnpGZ1FhbkMyVU1KU1czNjI0czE3ZlZrcEhR?=
 =?utf-8?B?a1RXZGF6akY3a2RReGwvOFRYZmg4OEpNeFNacGNEMVlXT0g0ekVXbWxlYkRj?=
 =?utf-8?B?b1RYRGpQYXdxOWtMQmtzWFlPRGJXbVhmVjMzSlVQTnBHYkY3NWFTb29La1BR?=
 =?utf-8?B?QmVxUXJpV081cVNmdVRjSk1BRFJNSGNGOURvcFhjWmZmZVVpempPQUZTWDFn?=
 =?utf-8?B?VUkxQXJSbFJWY3NyZHVuMHBEMmlFcnYxYmppRUt6WEpRRXhVNjdJRm9lOWJt?=
 =?utf-8?B?UUI4YUdzTUVaNFhXU1crMlYvamQxUXRIR3FCaFFBbTJIVkhYM1Y2ZHc0LzRT?=
 =?utf-8?B?ZDAyRE5KUFdIYlVqUXNQTjFrek80RnR1cWpRN0htUy8rUzJYZWVlbzIwdm5K?=
 =?utf-8?B?RzJIOWU1TWMzZjJCSnpYeUxLMTVqZHBWcFl3UnhTbjFnVnhrOXJacitvaTEy?=
 =?utf-8?B?T3ZZV002L1dkT0x3c2Jkekd0TmtVdmJYTWJlVHJieGNYMFFSTDdPS0RzcWtJ?=
 =?utf-8?B?cExSeDdwZ0UxVjhQUFpHSzZEa3BoaE9RN2c3Zm9EQ0ZjWXh6ZmtJY1UxTlVj?=
 =?utf-8?B?MnNQWWtoMEluYmE5VXk1K1BLaDZMKy8yQkRjbVU1NjlWVnJBM3JnS0t0alNi?=
 =?utf-8?B?WEhjSDc2NE5HaVFJZW1YWTZXRUQxYkVzcmNKMWVzbERYT0hhMjIyUU04RGg0?=
 =?utf-8?B?VkU2THlwVmplQlVPY04wWGxKVHVRSFpPcGtSR2hFNkNhTzM0QjBKU3h4cDVn?=
 =?utf-8?B?dy9IRTVBMEtzU2ViQ0pMTkFyOE5Yek1CTThJaDNyblpQQThVUm9nU0o2ZndZ?=
 =?utf-8?B?dFI3S1VLYTk1U2oydFRpdGlGRENLckthV2JkeUp4UWNyaVJlWEpVMnovKzRy?=
 =?utf-8?B?MzVzZFZsaTh1d2VmUXliYXppYlpiZllFQktDcEdJQyt2dHZ4MDhUM0J1ODgr?=
 =?utf-8?B?SytTR0dVclBpVFBYaXVUYVZ4SURwRjRma1JaZFE2MHpUZHNQbFRDamIzSVV6?=
 =?utf-8?B?NDJxYmZxLzBtSjJtYkRlelVsbm8xd25ZdTBhamVrRDJjU0ZOZWN6ZGY1SmlG?=
 =?utf-8?B?RkxEbVlmYU8rSU5zTU1nWFY4Q2FaQTV2ZzJzRU1HM3ZHY2I1ZnVxazZrZWRz?=
 =?utf-8?B?ZXd2VHl1T2ZOZXFtNWhtVmFhenpiZUJvMlJZOXkvR241TFlxTE9KMk80dGZm?=
 =?utf-8?B?c3YwanlRMzUzejlYUHRNZTNIM0JRM0l5ZTByQkFUanhzSkVac0FnMU1STldN?=
 =?utf-8?B?NWFSNmhOeUp1dnFWRll3SnM5MXhDWjJZSFEvUGFoVDdvWDdpYUxiVVJLN1pW?=
 =?utf-8?B?aDVjN1QzM1IyTzdxQ1NYNTQ2aDZ4U0U5Y25QNldGb2wrSk8yQzVaUzlnVzhl?=
 =?utf-8?Q?nIfQR5aNbVIXFGQzwQ7vdI0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad797a5-d633-48bf-5b08-08d9c14ea57c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 11:16:17.9647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oywGVI3aKItKbjFv+l6Au3RHAytCKzKh0j+0ounDscHyruR8lgWQtvayUy/Ba1l1ekWnBgtlhPp2ajBVyMz+ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5396
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/12/2021 15:38, Robin Murphy wrote:

...

>> IOMMU/DT folks, any thoughts about this approach? The patches that are 
>> of interest outside of Host1x/TegraDRM specifics are patches 1, 2, 4, 
>> and 5.
> 
> FWIW it looks fairly innocuous to me. I don't understand host1x - 
> neither hardware nor driver abstractions - well enough to meaningfully 
> review it all (e.g. maybe it's deliberate that the bus .dma_configure 
> method isn't used?), but the SMMU patch seems fine given the Kconfig 
> solution to avoid module linkage problems.


Thanks Robin! Will, Joerg, is OK with you?

Mikko, I believe we are missing a dt-binding change to document the 
'memory-contexts' node which I assume you will add if everyone is OK 
with this?

Cheers
Jon

-- 
nvpublic
