Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167F5875EC9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 08:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE240113158;
	Fri,  8 Mar 2024 07:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jIGjOGma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1F010F8A8;
 Fri,  8 Mar 2024 07:44:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2iDaK7xpkLE/afHhNfW+5YrVmcL3YscAv7jh5iAjJEs1gH5AIHe6YP08zqw6Trep8uSy/EC8V9M+xmVrrjw7YpDcLOsyxjGWF2WExt2fSrd4H/C52V44keCWF71tAgRbTqKoEo5w4FMLtKhzC5jk9uDBfIMZHWYA8r3htpE2KDysGAjiiLFDMo0dVeyRy3mS8JPxNSqDr2sNePmsWVwoNROJbbN2JfqG6On0i8srCQYgnpR0vqDGSCJi6RPNIVEhj+p+wwNyskRK/4qecOUtZ7ryLfP8AHR6OLPZ5U27vYuPOGYXD3O97FbPlfo99vqAHNnf8f/BYoA4sUj01kFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24QTyxWu3WLexZF4AXas7rTC32JGgqcIVG/eirn8wY4=;
 b=lao9G6p0DR3wI0r4J1f1Kr2SWSyY01RwUTfnr2MQHha95TvQeER6j5EaXIVRZvnQPXiWSv8jb5C+CUSfSqpJPqE9y79lE+vSbfp4tzK0Lcy1sLygnMapDSHx8EGk2vWEFUG5ftlwZKf5VwdEoJUDt0fZigJcKUXy4r5wQlrga+DaQdTb0aVnhB3/aBbHXX68U7tSx5Wy1/srrYit9cQNwedi8+qqXWFJgyEpvVezO5ZFQRn3jN45w0qdEt6jmSg//MR40CWHHG22frkOY3m2kSrW8oXbtNkl90+S6L/uHb18EQuUVsRD/tErvGInQiMuXyS3ljqrnAY1pICfPr1QxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24QTyxWu3WLexZF4AXas7rTC32JGgqcIVG/eirn8wY4=;
 b=jIGjOGmaTfOWPU8mNQ3uH4NwUAhXD0gK1/3FTqCW9EBVg2w+ucanGeqZSTnFEaFoM7ngeSC+V8o9Px3ee6hgK/rs6efNoQaz2SzDdmJN/zuIwX8P0JtduUGsY/36gqi3ya38QH2o+SUqIYCnXx2uiYRr+OFyMBXWD7D3PzIEONA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by IA1PR12MB6459.namprd12.prod.outlook.com (2603:10b6:208:3a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.28; Fri, 8 Mar
 2024 07:44:04 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df%7]) with mapi id 15.20.7362.030; Fri, 8 Mar 2024
 07:44:04 +0000
Message-ID: <13884e7d-f18c-f7a6-97d7-eb57f2bd2100@amd.com>
Date: Fri, 8 Mar 2024 13:13:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 0/4] TTM unlockable restartable LRU list iteration
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20240306070125.27071-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <20240306070125.27071-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::25) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|IA1PR12MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb8f962-846c-4672-66ec-08dc3f4386e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6rT0qNO+fvsw6Pbn9Cz8O3vMyV4lgyw3lk1rxjr6UY9ImzVKkaxxr3FrRbn5jG3+VK/GocFDQMFVNQu3lfgAIQAT7Aw3gBr9EjXNT76lXU6pTv8cHfhgBCxeSuQV8J2sEffhWrAUwfCSqu2n26oll4st2ki/sdcipMWWmfkCtmxJoUB2/8e7oSQCuXPBCMIpau0ni0rvw3vsVUlS4ms4zsmt/VeqJYRf01AkUFz8JeI4CX+eIuooesrk+58W3bO4/ohInI0Atd+SZU6YiWccjmL4blI6jB7msNbqqqBWykURfCCcXo70P/L6NjnokHe+satOMMxT05xLdcYWLCIlVcYWvxodN+zBZ9/UrxTrnQ0EZnga4Z+ASYSI6FkP4WtMGPaglBl+GCzMbcoKCzSeGjqQsrkPpCCOWSeNpwmzX1Df40WNT118L8bELuHQRR3GXEGqzjZrWxbJVZjy3MTMTTd8ccULz+0fgwyIS1kRg3d5FfbJpZr2iEphAYW6OEN0jeve80CkrdTgVc95Yzn1wX2CNfzGjWFFEco5j4HnmaxDdAZvc5YGaxJIVDMfLu9U1f6v7uvqkHT8YNZpTa8mrc5uNryR5oxf8XHBisKnW+rdfw4mlnHeHN8O9bO4YVJObGn0kOSssu2iEjZe13QIsI6dvtkp+kAEJR8182zkmnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3hRT0ZnQ0NVaE5yM0kxcVRGcitXcWRFWE5VYlBRak1RbzRkOFVFamFDbXo2?=
 =?utf-8?B?Vk82ajFHbTBVYkhKM1hGYVFHSC9BakhnU0NPUGkvajdkTXRhdTdpR0tVbjAx?=
 =?utf-8?B?RjNkTy8vcGsyQ2JrK1JHL1p5T0FDNlFtZy8zb05QTi9DRTNUMUlrL2pQK1Ax?=
 =?utf-8?B?OFUwd3ZZbkhmblUwNEx1Y1JzbmJnUTA4c004LzN3RDRkY1VPODlaeHZZcE91?=
 =?utf-8?B?aldLNGt0aitNN3BMQzN3SWRwR2xQTUlaREp0Rzh6Z3ZHZUpoWFhhS1A0VzZF?=
 =?utf-8?B?bWd1T2ptNURwTkFwcnF4dTBEYWhsSE05VHdSa0RQV3RvRkFQYlRWemZIZ3Fa?=
 =?utf-8?B?S0lqVWx2dXlRNHFGWXhJbzRnTmJWYjFyN0ovVHA1SnQwSzh0dnJpTWoyK3Fo?=
 =?utf-8?B?bWNxWGlLcUF4YXJjSG5sOFFCeTRaTXBEeWZ3V0pqVm9BY2QzdzVjR3BRTTZa?=
 =?utf-8?B?czdUWC9XUXBRaFhCOWRnVVRXeW5LVkFmS2tFdkNwUEdJc1lrVlZmWU1UV1Js?=
 =?utf-8?B?Q3R4ckZNQjNRUXpITlg3YlJHWm02cTVEWFZyV0lWcHVRaWxpdXJGa2NWVkkz?=
 =?utf-8?B?cThieDhGZ09rN0V2UVN3N2JHRzlnK1RjYjlveEs1VWhWTTF1QzNpdll0NDVS?=
 =?utf-8?B?dzkwL3Y3N1lkQSttQitKbEdNTW5ySTRsMUZNcnhXKzRZYUVQdlduOXVrRlE1?=
 =?utf-8?B?aU1sUWtJdlR0UG9LVGlaL1RxbTlJYjhJMjI5SndyQ2J4SVQzZnprd2Vmd0hI?=
 =?utf-8?B?djI2ZlhtT0o0RWxrb0xKVGRlTnRkQkNnelNNZmErb0o1WGJtVTd0L29hV0d3?=
 =?utf-8?B?SHJic2s1bERPd0licGRJNHhiYWZsU0tuRmtvSzJReUdFbi9ycmNiZVpqL0Fk?=
 =?utf-8?B?T2tMVFpNa3RoT1J5YUFnb3d6bTV4Nk91dXVycUdiZCtDSitRTUNBWjhZelhY?=
 =?utf-8?B?TUYralMyS3gyejFHN2MxRlZrdlhSWS9zYit1U3lpcVdBd28yb0FTRFltcDlU?=
 =?utf-8?B?alR3eUZwSXZEMW01Z2NQRVh0VlhFSmFOcjlxNGl2YURpMzBVQzRZa1VldDd5?=
 =?utf-8?B?YmJNRjZJOFFncWprcTFaQVc1ZGlPZXRBSkdxVmpqSE5TQUR1R3lLN25pdWFS?=
 =?utf-8?B?T3RLa09sR0g1cEgycklkNjNVS1BRcjRxTXZuczNDV0lacFNTWis2Z0RSbmRJ?=
 =?utf-8?B?eDZEUjNoSDJCYUxNUmhSYUphR2h0azZxYUZFNWI4WitOc3RjY1RVb2NSaUZK?=
 =?utf-8?B?VGVUVkJwMkp2S1kzSHNFd3RmalJ0cFRNMlUvanlVQ2gvcTNTWjRsUTFFZ1Rl?=
 =?utf-8?B?ZHFrYk1CWDQzek9ZK0FsWURBZGd5L215RUEwWlJLZTc1b1VpWTIvMXlUWDNU?=
 =?utf-8?B?QnFVTEh3Y0xUelR2cnViNWM4UjNybE5TZms3Q0hJN0cveERGbHowNi9pVjVS?=
 =?utf-8?B?OGkrQm5VUVlRWVA3ODJ0aGNKdUZObU16b3FNY295alpHZy9ST2RSVHBPSEZs?=
 =?utf-8?B?ZW9aRjBML3dYelA5WmIzSXVjbSs5R3FXZkZEREhMUEc1dm1pYkhtZkY0YVoz?=
 =?utf-8?B?TUNvUmZkSHBHSWVEM0U4QkdGUHJLaFRDZXBUSXNLbytsOUZOTmJpSVpsTmFK?=
 =?utf-8?B?ZVNlV1oxV05PUlBqeWRVRGJ6TStBU0RYSzhoSHRkTTFSUWZlb1ZkTWRaVFZK?=
 =?utf-8?B?Qm9aVDIrWHFtVitnZFB2Y1A3VFE3eGY4bExZOGt0OXN5cjFDbWdsaFJ1RHRs?=
 =?utf-8?B?SWdpWGllNVJFYlBEY3N0WXUzcnFySVhzY3RXcU0wSDlYZm0zcTVTTDRUVE5h?=
 =?utf-8?B?MVF0b2FoQitCNDJiYmlzYWJLemRndW0vdDUwcnNaMmZlOG1hMkpTbk1laE4y?=
 =?utf-8?B?ZGZ0VVpYNWFSbDIvTm82NDJueVg4OTl6RTJ3ZEppQXRON1BBeFYxR0szeFdG?=
 =?utf-8?B?dWl2WDgvemZHNTJjczIwelc0elJQVmFKbHI1V0ozVFFlWVd4Rm1RdGhmaE5G?=
 =?utf-8?B?VXIvUGNhNks5OWZhdEdJNEx1bVBKQXErZDhVeHVLaHNmN1ZaQ1FqQnZBVGM0?=
 =?utf-8?B?UllzY3RQMkdnR1hFeHI0L0ZzcnI0eXpYR1oyQ0ZFd215bGdqOEYzL0E1VURN?=
 =?utf-8?Q?4LFzd6qRZ3xVoLi7B9cGBbxDA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb8f962-846c-4672-66ec-08dc3f4386e3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 07:44:04.1818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDKYxOGemSaTxiemcUDRlJR8OS4T72T9H2TMpp+1Syzn8VJR2LlhMI7dDqIIPyvOp9twUyYC/n0UhThm8zxHng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6459
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

Patches are tested on AMD platform.
Repeated stress test on Unigine Heaven, memory full (VRAM + GTT + system 
SWAP), then free.
No errors/warning in kernel log.
Any suggestion specific tests?

Regards,
S.Amarnath
On 3/6/2024 12:31 PM, Thomas Hellström wrote:
> This patch-set is a prerequisite for a standalone TTM shrinker
> and for exhaustive TTM eviction using sleeping dma_resv locks,
> which is the motivation for it.
>
> Currently when unlocking the TTM lru list lock, iteration needs
> to be restarted from the beginning, rather from the next LRU list
> node. This can potentially be a big problem, because if eviction
> or shrinking fails for whatever reason after unlock, restarting
> is likely to cause the same failure over and over again.
>
> There are various schemes to be able to continue the list
> iteration from where we left off. One such scheme used by the
> GEM LRU list traversal is to pull items already considered off
> the LRU list and reinsert them when iteration is done.
> This has the drawback that concurrent list iteration doesn't see
> the complete list (which is bad for exhaustive eviction) and also
> doesn't lend itself well to bulk-move sublists since these will
> be split in the process where items from those lists are
> temporarily pulled from the list and moved to the list tail.
>
> The approach taken here is that list iterators insert themselves
> into the list next position using a special list node. Iteration
> is then using that list node as starting point when restarting.
> Concurrent iterators just skip over the special list nodes.
>
> This is implemented in patch 1 and 2.
>
> For bulk move sublist the approach is the same, but when a bulk
> move sublist is moved to the tail, the iterator is also moved,
> causing us to skip parts of the list. That is undesirable.
> Patch 3 deals with that, and when iterator detects it is
> traversing a sublist, it registers with the ttm_lru_bulk_move
> struct using a linked list, and when that bulk move sublist
> is moved to the tail, any iterator registered with it will
> first be moved to the tail of the sublist.
> This is implemented in patch 3.
>
> The restartable property is used in patch 4 to restart swapout if
> needed, but the main purpose is this paves the way for
> shrinker- and exhaustive eviction.
>
> v2:
> - Rework patch 3 completely.
> v3:
> - Fix a NULL pointer dereference found by Xe CI.
> v4:
> - Remove some leftover code causing build problems.
>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
>
> Thomas Hellström (4):
>    drm/ttm: Allow TTM LRU list nodes of different types
>    drm/ttm: Use LRU hitches
>    drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist
>      moves
>    drm/ttm: Allow continued swapout after -ENOSPC falure
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |   4 +
>   drivers/gpu/drm/ttm/ttm_bo.c           |   1 +
>   drivers/gpu/drm/ttm/ttm_device.c       |  33 +++-
>   drivers/gpu/drm/ttm/ttm_resource.c     | 228 ++++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_vm.c             |   4 +
>   include/drm/ttm/ttm_device.h           |   2 +
>   include/drm/ttm/ttm_resource.h         |  96 +++++++++--
>   7 files changed, 308 insertions(+), 60 deletions(-)
>
