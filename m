Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95414857E59
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 15:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A752E10EB96;
	Fri, 16 Feb 2024 14:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OybV0Fih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB67310EB84;
 Fri, 16 Feb 2024 14:00:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuGCsXET4efEud9gxyon+rZD10XJ34JhF7JRwssTT/Ru96/sr8vsTyXQdSfR0SyUoEisfqkEEvj14xdqyhY/yJq9KTuLJfvQ/bJ4bHef5g9hBYloEu0NJLIvcp/3t8APCIUgT6eisvp9AT8SWRm91oh569bgzN6o+1lfPbSDw7vbFwbHiKlnL8ymyvbeyJHlZ3VZWOdELHCKgw62HmlNcZRwNjV/VEq+F5NqQMqqCKL2P+grpbQgVBbcL2OmAf4KEvMGBoExuI4ZqVdGslHOgKTes7KeyVPiU/KVPyKgBsu6YbGeD+A3MdNOljYcXrb2Y4c/64Bi0IjDvi7PrqY6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIlevAmxZYauIzpKe1ZFfdg4gqynkk2I0z9iv53Fkls=;
 b=czFIrKp9CQZXe+GLj6RK0iPSpZg+CklctF6HrDJkiHDMkzVttOcOSMxXQ1O0TipgH0umnBdfF1vroFo4VOPTTswrQDYO4CzgFh7mA/2nrNPfmVw5VZSX22yl3A5ssfjr8p9Xq8EloXLlJAcFzRpceAaOgNVEtbGJbFfk+5XwNlHJXT6tCgLgohlFOGn1wvKTBCRa+jbNx4WOWN6CaGOhRZuZBh1UWOzFML/I+t+dBFb7n8gA1gTbzph/HykZn93hmpWBFDlapu5iMjHqABgXMTa2V8D2J+42sAk/SO7Ungjr+7WU5blkb6qK63UCDDGh9LK131HWXF74roPwutt8gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIlevAmxZYauIzpKe1ZFfdg4gqynkk2I0z9iv53Fkls=;
 b=OybV0FihVHvb838Jy+n9T65DO8aeMd2nqAGGZqlrqv9daf9Pd0tsofeUps1ZxbFN4ZrfZ3sKBRYYr72E9AB9byK9XW5Kt1jSPQlUzt76PFM5pvkxY6vMn5VfDAc8okDspj2JqA2zknaIEORKZzkG+xQLvtv4HDYLlcJeCR5VDaE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8511.namprd12.prod.outlook.com (2603:10b6:610:15c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Fri, 16 Feb
 2024 14:00:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7292.022; Fri, 16 Feb 2024
 14:00:16 +0000
Message-ID: <29000a0d-19ce-4727-945b-d5734313c7f1@amd.com>
Date: Fri, 16 Feb 2024 15:00:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] TTM unlockable restartable LRU list iteration
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@list.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20240216131306.101932-1-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240216131306.101932-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: b5448219-3c0e-48fb-b6f2-08dc2ef79a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: amVEceJ/+ULdTMsmdFxFIB9v2pprsYIN0v7gC67yljdn8XUB2aAHn6IxPA5EcjJWBR17BaQCy3BuUwGjiD41mVNCaYSa5P3YXd09dnpH0fEHP5oeU6NoO9l9i350oAp7V5MdBdqY78YBAU0W4s1/S/fn06Fj6hQEoR8dvRsTSDpEs1NYTs4MOX8NxXFwRZmd+EWAl5ltH+jVrq5JtBV9F5jhGTc0URneJOZNYD4S756Ac/fzdSWS7Il1t346PvSMgnqJZ8Jo8ZgBe+VL52AojC3/YKrmvv1h0HcAsbdsU0PjTgFNot1U6xMY8ty3T0sznSMCg31gi6jkw2+Wzm2Na5FOun0m2t67Mdjr3eeJqOEW8GNApj4IfEeoUjSzljZT+lq+0PCy8rUfUyX2aCJm059FK4ArS9Xj0noxnbIEOHHcZKEOou52eHG1vxocWbtMcEOBa6yFjeRGDBujZdnSlx+GT042og6aMnDmvPr/RAMVRNkriJEsf1YPEI3uBtbd1s6vmjG62oZ65XMxI/U/UPhMHzrRfEYqVXb5Dc9fDv2HDixojCqF93FAYKlbKUDo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(136003)(396003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(36756003)(86362001)(31696002)(31686004)(4326008)(8936002)(8676002)(66476007)(66946007)(66556008)(5660300002)(2906002)(66574015)(38100700002)(83380400001)(66899024)(478600001)(26005)(316002)(6666004)(2616005)(41300700001)(6486002)(6506007)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cS9FZDJvc1VoS2pwVk1iWGtoZUJLMytPRVlpakNvZVlBVG0rc0pUajJhOGg5?=
 =?utf-8?B?V0x2YzlhUzg4MWYxcWdKM09lZ3MwbjRKV1dPTjdCaXE3endyWCt4TTVBVDFH?=
 =?utf-8?B?TlR0RzRvalc5N2p3ZURqTmljc2ZERXFGNDRpdHBBWjIrVXFYQXIyVlNoVkpR?=
 =?utf-8?B?SXR3TXNNUVJNTkJhWGlxdVVBYldreWR1QmhhR2ZKUGJEZFFXVE4rRzM2V2NS?=
 =?utf-8?B?azZLM3g1dks2ZkIvR0NzZ0pObDhiNlpxbEtEWXdIWm5Ra0EvZ09hWVFqaS9w?=
 =?utf-8?B?eFlOWW84QjIxRGM3cHlScG1wL3VvM1kwTFhCVjZhOXREYjVzMmVZSlI1STB4?=
 =?utf-8?B?eTJDYkQvRVJTaktrUHlXcGxFT1ExTXRrL09OOEVlNVFJKzJTSGpxRUpVQmN2?=
 =?utf-8?B?QWtldkdwbmJlMmhPRXBKRm9pd0F3WERpS3pmVVR5enlGM05WNVUrUDBmMlhj?=
 =?utf-8?B?VHVYWVNrZ0JhcHJ3eHJBUTlmV0RXNUpMbm4xZEJIV0o3MzYyMVdtWHZVY1c2?=
 =?utf-8?B?R285Um9sZWlYTFBEYUFMd0dCVjZjWFR2TisxbjlWUFZhZ0xSWEJLWE5QYUl0?=
 =?utf-8?B?UGVFSmV6NWZXdi9VZ0oxMGpXY3JuWDViZHBabHdLSnJiYzViay9GaEZ5UzZ6?=
 =?utf-8?B?bXZwMTFTN1Jza0xBeHJYQ0w2a3FKV2NUa0ErTncvcFIzZFJHV2pJbzg2V1Fp?=
 =?utf-8?B?QmR4Qzg3L01TRXRveHFtV0FpbTQ5NEtKNU83SFRuNDlkeVI1TnVRdHphZkFL?=
 =?utf-8?B?Nnc5WTVCRHhJY3cyTEd4ditKcHVReFJnNG5QNHZGZUt6SWxFU1JFdE9lMUdZ?=
 =?utf-8?B?bUNoRHVVSVNyYkErcVVwa1IvWXMxSk84dEZRM2RXakxHYmNoY0ltVlNxNGVj?=
 =?utf-8?B?S1RNa2NrWnVqd3BZMzlXYjJBTEZCZndreTN5N3ZEUmxHeVBHeWtRb3NhT1Yw?=
 =?utf-8?B?TUNGTkJmbzRPVnZwTDN2emVkRFdjQU4yTFlMcXVvOStmSlliRkh3YUxDR2lz?=
 =?utf-8?B?SnF3dkkxN2R3cWlJOE1NME1ibWo4cWZwemc3YW5haHJjYVVyVFpkeG0zZU9z?=
 =?utf-8?B?UlNBYkZEcmtsSUxzWGIrQWNIdlhYVWw2K0UrV2JkQTJLdXhpQ3UzRlk2bENP?=
 =?utf-8?B?dVRjV3BpT1hmUmhmcUNWaDFldlBGRzQ0R1BNeFVvUEZTUmFtbmEwV2RQV0d2?=
 =?utf-8?B?eWQzNzR2QklGWmRUZzI5WUdnN090ODhvVkJML0JWaFVtSkRCeCtJeWM3bDJG?=
 =?utf-8?B?TE45Zjk2L2NWejhqbVRhZ2t3S2g3K1c2RXNOUjM4amVXSzAxNDVkdG9FZkxO?=
 =?utf-8?B?RGFUWUw1OVZiUTBYcVBSd1hZdi9ER1c2TzJLQmRrR0xBeGZZaHh0b3kyRExr?=
 =?utf-8?B?eWdKM2Q3SWpXNzVVbyswSkQvNXVqcldrajU3N1kzcXpyNjZQQVFOay9PUWQ3?=
 =?utf-8?B?VmE0d1kvU3hTZndPTGxIWTQ0Z0wwRUc1dGJlUW9HY0RvaTFkRjI3RnY2UUZI?=
 =?utf-8?B?NWNCVmtSMVdSdTQvMHZLbWlpWnUvVnFkRWNDZzUrNVZJUXMyTGJnZWlXakZK?=
 =?utf-8?B?c0N5US91dk5TVzMzQnAyZWZSYUF4TkxLcjk0OFhkV3pocHBkZGI5Q09UZDlp?=
 =?utf-8?B?cVdVdkJTcDFCOTc0MURwMnV2dnNlbDRXOEhUNk91OStCUlBrbGpEVXcrNEJN?=
 =?utf-8?B?Y2xIM25VZGVEUHpwb0MxY05OM2lBanpyamU3WC9uTlc5Q1Z6b1dOZlhCZEU5?=
 =?utf-8?B?NlZXeVdLTTlodXJEb2lvTlhFWFlNaS90cXZHUklnOVp5RnZPSEpOVUkwSVdC?=
 =?utf-8?B?SC85amJUcGVpUms2VDMwZTRZeVlicXNDS1o5bUxKT2k1eXdaMVlYYStlMWhs?=
 =?utf-8?B?Vm41QmZUaWJXSitka09hSUlmZG5GUkFramZtdGpaeXgyRDFjMVYrbmt0TWlt?=
 =?utf-8?B?TEZVRjlGSTlxV2FOS09JVE5Mbm00MTVVR0tMUzI5cDdOLzNFV0hnVWNpK3V0?=
 =?utf-8?B?MUczb21UbnhOb1BENFl1QzgvdmkwYjNrN2gyUTNnY0N6R0c3RmwzdFBhY1Z1?=
 =?utf-8?B?VUlEeFZpTlJjRTRIUC9helF2a1JuR1FiekpqS0ozY3lSTlo2Y1JHRDI4S2dx?=
 =?utf-8?Q?16QMKFDf0qIUn9sejVarct+Fk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5448219-3c0e-48fb-b6f2-08dc2ef79a05
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 14:00:15.9505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAdHwTxJKQvBwEG4HrrVP5cIWyfotSQmIjAZBQz9bKxCbE2dBo50PkX8UNhJpkP3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8511
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

Am 16.02.24 um 14:13 schrieb Thomas Hellström:
> This patch-set is a prerequisite for a standalone TTM shrinker
> and for exhaustive TTM eviction using sleeping dma_resv locks,
> which is the motivation it.
>
> Currently when unlocking the TTM lru list lock, iteration needs
> to be restarted from the beginning, rather from the next LRU list
> node. This can potentially be a big problem, because if eviction
> or shrinking fails for whatever reason after unlock, restarting
> is likely to cause the same failure over and over again.

Oh, yes please. I have been working on that problem before as well, but 
wasn't able to come up with something working.

> There are various schemes to be able to continue the list
> iteration from where we left off. One such scheme used by the
> GEM LRU list traversal is to pull items already considered off
> the LRU list and reinsert them when iteration is done.
> This has the drawback that concurrent list iteration doesn't see
> the complete list (which is bad for exhaustive eviction) and also
> doesn't lend itself well to bulk-move sublists since these will
> be split in the process where items from those lists are
> temporarily pulled from the list and moved to the list tail.

Completely agree that this is not a desirable solution.

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
> traversing a sublist, it inserts a second restarting point just
> after the sublist and if the sublist is moved to the tail,
> it just uses the second restarting point instead.
>
> This is implemented in patch 3.

Interesting approach, that is probably even better than what I tried.

My approach was basically to not only lock the current BO, but also the 
next one. Since only a locked BO can move on the LRU we effectively 
created an anchor.

Before I dig into the code a couple of questions:
1. How do you distinct BOs and iteration anchors on the LRU?
2. How do you detect that a bulk list moved on the LRU?
3. How do you remove the iteration anchors from the bulk list?

Regards,
Christian.

>
> The restartable property is used in patch 4 to restart swapout if
> needed, but the main purpose is this paves the way for
> shrinker- and exhaustive eviction.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
>
> Thomas Hellström (4):
>    drm/ttm: Allow TTM LRU list nodes of different types
>    drm/ttm: Use LRU hitches
>    drm/ttm: Consider hitch moves within bulk sublist moves
>    drm/ttm: Allow continued swapout after -ENOSPC falure
>
>   drivers/gpu/drm/ttm/ttm_bo.c       |   1 +
>   drivers/gpu/drm/ttm/ttm_device.c   |  33 +++--
>   drivers/gpu/drm/ttm/ttm_resource.c | 202 +++++++++++++++++++++++------
>   include/drm/ttm/ttm_resource.h     |  91 +++++++++++--
>   4 files changed, 267 insertions(+), 60 deletions(-)
>

