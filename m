Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7CE9A0DD6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 17:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAD010E72A;
	Wed, 16 Oct 2024 15:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JAujxf0J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2041.outbound.protection.outlook.com [40.107.101.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDE310E72F;
 Wed, 16 Oct 2024 15:16:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEyIMZ78rIkV6aZ4IpCpcQ7OnEKFL+W1bVlme0jDVNFLd8o++wF+1pF4dpTdpQ/4ECNkAYf3+VbPuI7W8mxIAJ4lx/ROqj8d4AEdzlZ0EQAZ4I3thWLJaVpqu7Ikf2IOX7g23xjiWxEPjFf0UYgEgOgi2h6vEWPkvSfbMgNFZUoMARjNwQxZryJtHGwtlY9zyOqoacbuRYbgeVCEm0ZHKMM1YUD9bLR9SUkpuU4uyzTkd2yV1fhUcrgcw/6rf83549bPSsQAMEMZV9PpZyyPdqVsloRSD3E0lZ21Og9oTBGkHiIqXnJEM3Y6Kwnxp2DG9nRApCqEILurnbg3YtGAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGDwgZxUF0hUviyyiK9unu5OqHtKdOxwcpBQrvL/G8I=;
 b=xLv1J1oQDex9U6r7B//WnTUuzGejG3pmr69tfkeg/g9weDQqxw2QOptGQWNq4M/AdBS6UaOJH11MeCTF8hBMLEGBlS17OAlLhH9yIHZwpzv3kz9znTn+U3xFeMTFLg+W6ifIUVSZ00i1Kg/kYiSa2VWikowqpmP/oP/gohkrkaG+hLUaY6p0muTZLhRBdmtwUValWMpinREQi+eSNyguyElDP225I8a4r8A27RMzbLdiMTOfzHH6iVtLNKYS21zQCQl78gjjzMgc4FMChiIrC0lCcOrlfs1NADx5pn0d3a67JuH2VM7XPAY1OndbRUw4K6TKKwgamPh7CnP3Jk4PJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGDwgZxUF0hUviyyiK9unu5OqHtKdOxwcpBQrvL/G8I=;
 b=JAujxf0JqH8rWeUGqoCEuxUjr+vWxQgTpB39XYXjExC2ml5unCK3m09Z1LqDvWeNaL1zeSiop+9FmgxmhgwCrC2eQtrQndWuIknZfxCyYesRlGuVU9b06081alU+Z5WznYUfZc0y/RbfmlP9rkZw4CwzfP0qUp+EFdulz1VJVKui0OT03h/Hf335O96qFTJWJLvjRpw4aB/MjDQ9HhgMehKHFAtewgYnNbbUWJxX+VgnFvHW61B/MT0L0+Irs6kkNwcPS8Gf+ZSnlSv7xhP1pU5rZOOxJmi6l5O1426eN8ubxstq/mXJtdnz9uLNnN2qxXVt5bH5xannmBBJziNq5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5851.namprd12.prod.outlook.com (2603:10b6:208:396::13)
 by MN0PR12MB6002.namprd12.prod.outlook.com (2603:10b6:208:37e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 15:16:35 +0000
Received: from BL1PR12MB5851.namprd12.prod.outlook.com
 ([fe80::d4a:9ce3:c92e:e938]) by BL1PR12MB5851.namprd12.prod.outlook.com
 ([fe80::d4a:9ce3:c92e:e938%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 15:16:35 +0000
Message-ID: <1a667504-72bd-445b-8bf8-a6604b7beb2b@nvidia.com>
Date: Wed, 16 Oct 2024 18:16:28 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] GPU Direct RDMA (P2P DMA) for Device Private Pages
To: Christoph Hellwig <hch@infradead.org>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-mm@kvack.org, herbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 jgg@ziepe.ca, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, dri-devel@lists.freedesktop.org,
 apopple@nvidia.com, bskeggs@nvidia.com
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <Zw8_x0Tvux9IMbly@infradead.org>
Content-Language: en-US
From: Yonatan Maman <ymaman@nvidia.com>
In-Reply-To: <Zw8_x0Tvux9IMbly@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::17) To BL1PR12MB5851.namprd12.prod.outlook.com
 (2603:10b6:208:396::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5851:EE_|MN0PR12MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: a4741652-2e00-4d5f-ea20-08dcedf585d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0ZWRktKem51amtJVW52OGd1MTRKdDdRekJVOWFxS2Jpck9hVGxBRjFtTlRo?=
 =?utf-8?B?TEVKZXlPczR6Nmo5ODFSbGVTQitDMWd2NFRqdnV5Y1Ruc3cvblZXM0dJdUlS?=
 =?utf-8?B?N1JwNFovL2ZGSGZyUGc4WGh4M0FINzBxVXk5blZrNFNTeDZWaWlidkQ2NjhV?=
 =?utf-8?B?YlRHNnluQVVXRUZVSjVIaFNVVnlSVUpVbEp3d2ZuVy9wSUpTb0pkMndlKzUv?=
 =?utf-8?B?YVp4STZuaEdwVEl3TFdwZ2gvcDE0NWRLNTFUcXBObkY0a1A0d3RIdHluT2py?=
 =?utf-8?B?clFiNDZ2MnFYMW5uWmVYWm5QNE4veGJkZlpveFdJRzBlRWs1ekZ1OFluUWp0?=
 =?utf-8?B?U0FoZkJGa2dKOFdlTU9uZDJieldUNHBCZ3oyM3NjcVR6aTRodDBiU0dBTU1B?=
 =?utf-8?B?N205VlE3TmV2RDZxOXNraVN5cWUrWVNLQTdtWlRLWDF2Qlc5cHQ3TDNhcHNJ?=
 =?utf-8?B?dXhEU1o3cFE0UFJERTNBR2tWVlVVMmUyY3FCOXMzYjFDZGFzRHhUZ0NTdW1G?=
 =?utf-8?B?VGxmYStxd2N1ZmlQYkFwSU1mOHhUMUI5SDAxYnZsUUM2MlZDSThCbklYd253?=
 =?utf-8?B?V3VTSE9kdTkxOHZYZGhtTGF6NkhDQUVCM2tFNTNWYnA5Z3NKSk1RVWFlUTlp?=
 =?utf-8?B?Nkc1c1g2S3F3RWRvdnBOUFJ0OWRhUlRYM01TT2h4VGNtQzZmNDVhUlZsMUxE?=
 =?utf-8?B?WUF5YUowR1FTL3JDNkU3dlhncWJUeDFaY25jb0VpQVFOUTJKd0M1ZlI3S0hB?=
 =?utf-8?B?Ym05bTBhZzI3bjJYZUFzbDhTV0kwZXcwTXByMnZsNk9FY0UrR0I4VElRZzBT?=
 =?utf-8?B?SzgvQUp1emxIaUtvc0VHR1FOd0dMYjluWGI3Vm9hVm1wSXN5S0VMeGlHeFNi?=
 =?utf-8?B?eEZQSGY3NkFZcHZpc2xyTXQxamZBbHJYVWJoZHhaZmVlV2gwV0lqeXZ6dlBx?=
 =?utf-8?B?YU9IOHlPcEQvQUhqbW5XZW9PMTZFbW1XSTlaMnpCS3Bvb2NQQlRqT2dFbUVZ?=
 =?utf-8?B?dUdlcGpwU3loWlBGWm9zUUtwOXBQa1ZsbXJBd0ZQN3V6VkNlV0tVTlk5dGIx?=
 =?utf-8?B?YVJmQUtFcmlsaUwzeFNxTFVvUWl4RDNlaGhlQ2VnTnlLcTdjY2Yyajl5Szky?=
 =?utf-8?B?WHBXc1ovZXcxVkhpUlVHRDF1OFNqY21tTFhZcUpLbUE5SlFuY0xVbzd2SUo5?=
 =?utf-8?B?V2xvT3NYMk1aRk52d3RaUHN5emowbUZHSkF2WmgzR0tXMGtpR3RJbEFWd1Vz?=
 =?utf-8?B?YlNacmNOZ3EzTHV5TTVXYlhUYnV1UUdpc2oyUDlNWkl5NFVsaVgyL25aTjJL?=
 =?utf-8?B?RVBlcXNnaWZLTG9mNDgzSkdHQjNzM2h2MzNOdERGNG9lejRibm5LZzlUWStJ?=
 =?utf-8?B?TDFObEpYOEFlQ0lzNkNySDZtNVBzc2xVR2tNOGZxZnY5cU4rM3hobVBmZk9N?=
 =?utf-8?B?cUNReVdtT3VkQVhKNldRTW8xVjN0ckk5ZDRuUnI3aSt2eWNsZDlSQVljZWVl?=
 =?utf-8?B?STVOQ1BjcFFnTGdPV2JsVyt3ZFVkU3hOczFUWFVGZDdka1A3SDUwZWVOZVFv?=
 =?utf-8?B?MjVJQWd2U0t2OVcra3lnNzNLWVh6TnZpTklHbzlZOU1Cb1YycWVQZjhUNUtS?=
 =?utf-8?B?cjR5dTJLRXVwZE12Qzl2czJ6dTBJQzNNeDBJQ0R6aytlWXRraE9CRkNXN0pK?=
 =?utf-8?B?RVM2ZklLdm9QMXFDRTNma2RKcmhjS1lUbHJaU1hObFR6andWZnoySDF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5851.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekZ2RTRCUWZZNXg5ZXIxQVcvTEsrN2lybGRaMUFxYmswTjRsRmJWYkxjQUtW?=
 =?utf-8?B?S3EvMHFKay9idUUzUW40TDdaZGJjcFpaaU1rZFczOHNlSnk0U0x0eDhlaEE1?=
 =?utf-8?B?WWRKaTdJWlorR3dvd2M0Y05BSEhOK2NKaGY4aHpmRFVkdCswNEsyK3BsclNq?=
 =?utf-8?B?a0JxbmZmeUZIc3dzY0dKOG5rR000TWZ6Ym1za0ZxSGo5VkxkOTBCSmxKZ3E0?=
 =?utf-8?B?K2JVVDJkRXYrTTRWb0dpOHUrb2xleFFITFg0MmFhSlRkK0NMSG1jQVNaLy9D?=
 =?utf-8?B?MDF1ZHVELzJqQWYxNWxaSHIxOVVLK0o2eGI5MGJleFlGYmpraFVNNEEzRlJI?=
 =?utf-8?B?cU9HSC83aWxyYWpNVDA3MGhMZkVPT25McUJKU2ZqZHVIbWZkMVg5MEV5Qmpk?=
 =?utf-8?B?QXVwYzFwYWFNTUZHSXBpZVg2RUJmRTQ0TVNlcmdHM0pMUURPeTNxNFozK2RI?=
 =?utf-8?B?MCsxRGl3MW1yWnVKcHFUTCtlTE9kWkVDeERTVDkxWnBNdFFlZS9QQ0JJbGpV?=
 =?utf-8?B?bU51cFptTEliRkVVVzBGZ3dKSUFFNFNtRnpYR01WUWc5WHlhbGp2QnJ2VFdG?=
 =?utf-8?B?dytEZzVvdE1yM0pNaFcycmtYb1VxYXljVmRPdlhyMlBUK1ZVaWNVN04zUFll?=
 =?utf-8?B?L2lQUGIyb3Q1VUlROHg4VEdUTlBOQlJoMmVranZIaVdoelhqbzA4VXVmejRo?=
 =?utf-8?B?SHBGVlhyTVRaakFSVUx5QUFDUzU3SCt0QVJXSHo4UE82YTlBVS80bGU1THMx?=
 =?utf-8?B?Q2tISUR6RTF6QzdPKzc3SUpqaDJZTXdVQkNLMnY2L1pEV1daOENsd2QvNkEv?=
 =?utf-8?B?blRtY0h0dUFoT2dCeTZEU0d6SUV4TGJaVGlqalg5THZOQnpPOXloVEJFMTM3?=
 =?utf-8?B?TlVGSFRUTzJRcGllTGNIYWlqL2MwYUM2akJIbmdpZlBRSkhEaWQyeFhmMGZF?=
 =?utf-8?B?dC9USlliaS9ORGR3K3BDSUhXR3FNQ0xwNkwybFJzaHVHZ0JyK3JOcXovZm5r?=
 =?utf-8?B?Tk5kWTF0YzVadktBNng2N1VtSkQyNi94dUlqOGxWTlVPampNeFNvRlpQU2VH?=
 =?utf-8?B?UUo4R3VxRGlZNTFTODZ0eUd2TlN6K2tmQ3l4dXRERHdoblBCdU5zMjd1Q1RX?=
 =?utf-8?B?NHhqOGNkV3ZIU0hkM0xzdzNvMjY1Mk9NajJydzlIMG0xYis5WkJkNjd4ZTZX?=
 =?utf-8?B?aXllcFN0OURVS1dGS1BYRW9BUExWV0ppN0FJUWR0ZVRTZlp6V2l4SzFVa3pG?=
 =?utf-8?B?bUE3bkZZWGFjZ2tCWVBLbHV0NzFOS0prcXMxRUZyRk1zV05BYXVWQzcyYWZN?=
 =?utf-8?B?aHN5MGNRMC81S1lnbGp6VzdWejFEa1dpR1Z1Z1R4TURVRXRLdndaOGJPdHdG?=
 =?utf-8?B?d1hxcUswaEZDL0J4ci94aDRNMHNOTGZZWUEwYTRWZ1FKUHRLRVoxaDNyUVdT?=
 =?utf-8?B?Ylg0UHNqbE5yMkxuOE1OTENEQzd6VGM5UU82VU5ZZ05YV2xxbXk0NG1YaENh?=
 =?utf-8?B?Zm50Q0Q2TDgxeVdFS3NtQ2g0UHFCVE1RSFVwbnhPbGE2YmJKVExNRExHaWxU?=
 =?utf-8?B?cVJTMVlPWlhJL25jdFMzcVhXQ202QU9nVXA4VE4rMHBhV045b3l3SXcxaU51?=
 =?utf-8?B?S0traXN5SDhuRHkwRzIyUkZ3VkNNZkR3a0s4dTlXMjh6cG1wNmRxRnFNNE5Z?=
 =?utf-8?B?ck9JTXF2K2dpRmxwbkVNdlhIQkRuU0d1V1NLM1FkNHEyT0pNcGR6MGVqb2VH?=
 =?utf-8?B?UzBybEhTQ0RmeDl0RW1USTdiWExwSnl2cmhLSlVVaDNzT3FqeHVXdUYyMnBJ?=
 =?utf-8?B?a2M0Wm5sOTRxakdZOUhqWGhwNWptTkV5QUVQOS9nNmFIUW9IT2Npd3YzOXhM?=
 =?utf-8?B?RjhiTVh1NGtQeVQzMm1DSGFEejZ4NTVKcVM4cUZIdmlMaVBaZzZWQTU3MnZZ?=
 =?utf-8?B?VEJuZzg5VHhGQmpzV1E0dlcrTHlkZzFXMkxxYnkvZjZkMWUyaTZ4Q210bWNW?=
 =?utf-8?B?cnBKNGhMUVhmY0NUWVZMaWNleTBNdUxQT2FRbVIybENuQTBQdWcrWDhTQXJQ?=
 =?utf-8?B?ZmlRSXNQOUl1NzFNWmpzRE5XL25zbjZlUkJ1cDZtL1ZKSHpHRGIzSlZoOUVn?=
 =?utf-8?Q?U77aKGGXXJjnosFWBHf8+bCLi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4741652-2e00-4d5f-ea20-08dcedf585d5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5851.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 15:16:35.0116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3iXYNIzDQ946eEJIYseuA3E24Q66vPxgQ9UUGYa/t+f2ChXV0oSNfZldBIE704GEGbHNIX0roEXkSGdYB8twFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6002
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



On 16/10/2024 7:23, Christoph Hellwig wrote:
> On Tue, Oct 15, 2024 at 06:23:44PM +0300, Yonatan Maman wrote:
>> From: Yonatan Maman <Ymaman@Nvidia.com>
>>
>> This patch series aims to enable Peer-to-Peer (P2P) DMA access in
>> GPU-centric applications that utilize RDMA and private device pages. This
>> enhancement is crucial for minimizing data transfer overhead by allowing
>> the GPU to directly expose device private page data to devices such as
>> NICs, eliminating the need to traverse system RAM, which is the native
>> method for exposing device private page data.
> 
> Please tone down your marketing language and explain your factual
> changes.  If you make performance claims back them by numbers.
> 

Got it, thanks! I'll fix that. Regarding performance, we’re achieving 
over 10x higher bandwidth and 10x lower latency using perftest-rdma, 
especially (with a high rate of GPU memory access).
