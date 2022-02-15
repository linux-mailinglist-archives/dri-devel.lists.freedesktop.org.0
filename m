Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7E14B6476
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 08:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7677E10E3C0;
	Tue, 15 Feb 2022 07:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2047.outbound.protection.outlook.com [40.107.102.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8371A10E3BC;
 Tue, 15 Feb 2022 07:37:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpLT9ymveIrsqVkbGq8cxZnCgiF2ebGMjQxmMKHpMcfIN4WBPCHu76iNb0dxBpTSPSREAJqM4VIITlus3YhvxyIAqu7xm1HPZGRbPR0ho0kzyckNklu0bDR4ShNhMeZ5Dbrp+6Wyh0ah+j+Mm5Tm+cng6yQZU/fJyT+W5fBgE4u6rkqrqDdZrgwBqVMAHEmgSLiXcmlljNAOeQ53/2WecrDoNQy0xLutUAEToqUJ2mGnPqliUk+DQoBYF0QlM3Hdk7taZ8lZPnPuOc4SFj+tdTplRzq2LAKs6DPgm4+/D1yTSCtmEGY1EviQG5nec9iQtbP7+ZOcUSE9BCZAlMpa8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMd9iBPyJpOX9rkPdDCkv2tqthskvClXZD1mTYQrZFU=;
 b=Hkc0ZB5kVeZXDmHIeW1SuXarRrxx4hlFSvXCvD+FUnnk+dRdE+DIuEskxRPH0/zDA/9/a1tulMXAxbKDrDy7SvONkyMwQlxkrrTI9kg4jx979urOcHnNHYWmXQ1ZEL/1tBNq/o5sl/e66vBLU4ZrezUiwS39KUacgAX1mlqMB9vtD0cEBj6BZ9/L+rgilQL8Cnyt7ESjgAcrf1zWajo142l2QZKf4+uYxhUIkZM73WQN7dJwTb6066+7o+ojBFEcO6QjfRMdzHdwj6UVcDDTbtjW9P2kOhKSmS/d3N/YOoafjEVNY5rg431LiB36ByUcXrmrnVAhqYzzmgT0258qeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMd9iBPyJpOX9rkPdDCkv2tqthskvClXZD1mTYQrZFU=;
 b=dMaZYT8zouVF92IBDblAb/DIhpTrWfyV13o9Vx1wqPxNyc/mmB8IrkOk6vGN9tmNJ/CPKXB7skadQFGCqUg8HW3qZWIlDUp3UFGFf9QjnaVNXfnbhFkyTs9TP5thOnuDWGhueTG+U9sWJrAeIq3cCzTAzhqvJzpaxYui0PDBq+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB3591.namprd12.prod.outlook.com (2603:10b6:a03:dd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Tue, 15 Feb
 2022 07:37:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 07:37:43 +0000
Message-ID: <30de1989-6fee-d94a-7d99-6a3a8c59659d@amd.com>
Date: Tue, 15 Feb 2022 08:37:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/2] drm/mm: Add an iterator to optimally walk over holes
 suitable for an allocation
Content-Language: en-US
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220214235625.864939-1-vivek.kasireddy@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220214235625.864939-1-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P250CA0029.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::34) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7b3257b-8f5b-469a-6e64-08d9f0560d7c
X-MS-TrafficTypeDiagnostic: BYAPR12MB3591:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3591B909C79BB843887DFDA283349@BYAPR12MB3591.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gT4jI9kpcY7ubc4sdRUQ6awfSPWcPyaLnaRO9YH0BOGgl8j5kWb/BuiASsitoHUCGqW+NZvbaj+4NR9wOzsU+1Yrb9WlXnlgI5MLgnc/s23HeWsiDrzV8Tt86Jxs+mOGXqi5akbC9Biml/bELCsLBAI7MwTSr3CkWguqtK3hzRglBSoJ/cGUVt/yy11VxM5/u93XW2EqAdfR07Bt258mszZb5tl1fCr111szu7QrxARe46ljteF+uMquhYCX1D6cCp7w+0e9QBrkcsG4mFRFlKYJtZTM66GD7qg5v1Dcz1Dw1TH6jC8TuXfwcLubno9HBKGrv5hznOGTuB/H7vK9p0OZrt77JuvYLO9IgrnwQbygUS4/fbSAbKJFhTxEpYKgXjjt/kfZJTq5G7L23AO6iCXmVa1jnr/hEcTXDiY1djaexm0ML88wPye/8HPXyqOv6Fi+aG+jI7u97tlPYy/cXGdEfB/csDawdRAYi/m4vv4nmJ/Ao9D8CXec8bE9v/GC4p+VSLadk/YRU9nNNIQltuzHYSCAtK/EyNwttu1TIOZnq3jue7G/IYizkq0/H3iy3GuwG4ucnmFhbr20/C/nq3R2lXopWqu9ZnZoIpqeh9xA5lGW3lUqZ9a3+pD5Cv/wSaye8h6CQ7fs5sqwv8i3bkJsPhpf/En/hekAH0x25gOFC0V6CAV6iSgxm5StpICxFGgjq7YPwqNCecLnACnt2pom3j89HtbEBZzzdd3La4McjGkkTO8K+waiRrUBBVXB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6512007)(66556008)(316002)(8676002)(5660300002)(66946007)(6486002)(508600001)(4326008)(83380400001)(186003)(66476007)(6506007)(31686004)(31696002)(38100700002)(36756003)(8936002)(86362001)(2616005)(6666004)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnFCMFQ0aDFUN2s5THoyeEVYYm94U09kNFpqTHEvZXBCaERsd2tPclFuQ0lU?=
 =?utf-8?B?QmJGU0dCQ0Jxb1VzMzJybll5MVYySmlFVHFNMnhZcGdUYmNpZlpvK0lrUTZG?=
 =?utf-8?B?eDdmcjd4UTlzazlsN21BYi8rMjlyOS80RndyMkJ5RzZjQ1o2WnFGS1RMSi9i?=
 =?utf-8?B?L0p6elZvTzlJZ3ZzRVFaTkg5alljZVoyYUZmRnNXdTU4ZThvNWRZTTBxTi9j?=
 =?utf-8?B?SXA1L0swajdxbW1XdFFuTnc5aWNiRGlHY3d2Qk1UcDE1b0xabU05MVNYRFZr?=
 =?utf-8?B?a3pkc2NwcTJrM1g5ajVianQvcGFTbUpTUzZVUktQNTQxaU81c1FLZVBIVWMz?=
 =?utf-8?B?RHA5WCtZZ20yTmp1NDBCaGFTSnRwQVY1VHBUMWNuN2lBQnZsK1R2ODV6Ty9F?=
 =?utf-8?B?bjd4S29vMjdtZXdwYXV4ZzIxR0ZKTDBGQm9pR3Q1TC84cUd3T3ZvTDd4RW1j?=
 =?utf-8?B?VnJlcTZXYjJNRWVVSE1rRmZUM05XamZYb3hsZGJTM2Urc3E2a0FUb2pPN01n?=
 =?utf-8?B?RkI1ZHRTRWw4THFZUkxMcFA4bFNTcnVBRGNsZmswR1hyeTlSSTFIWWtGV1Z1?=
 =?utf-8?B?eEFvb3d0dFlQZ2RPNTQ4M2Y0bFFIQWExMnBUOWU2YlpQcTJCL2l3U2VzeG1G?=
 =?utf-8?B?c3YzNU1hb3pCam9JUE5WZGI2cnFITkJwN3BIT0V4QllreG9pSXgwQXpZbVNv?=
 =?utf-8?B?U0h4L0pqQkoraUVOaEErMUI5WWVaVVN2SHJjalJGbS9UNDdxOWVqNXpYVEVX?=
 =?utf-8?B?bFZCQmhYcXpadmo1K2pYMVhuR1hBcTJmSVNiQ05aYTdISVBnSTFaa2RkMlgz?=
 =?utf-8?B?RHlRZC9RQ2pza2pqVjdzbHE2N0dLZHN2aXFhZ3VPMlA4R3MwY0RZR0VzaWFY?=
 =?utf-8?B?WTNVc3FFcHV1V0JIOXUrN28rUGhiWjYreXVwOS9rK24zR05pank5bzI5RkFX?=
 =?utf-8?B?QlJtSjBrLys4MUhPZVlNZEkxMGRIclpMQVAzb0I4QTdGOGhLSUdqNXgxeEth?=
 =?utf-8?B?WHBVOTE1Q0ZTTEl3Tk03YmV5bkRFMVdoaUFGb1RETFRXb1MwVzFBUmJ2RWRr?=
 =?utf-8?B?VEhpUlFkaW1tTTFnMzBKZFFWTVV3K1hOVlhZWW5CNjFtV3VMUGJNVklhbnZB?=
 =?utf-8?B?cHp6MCtVcUl1VlorZ3BZQUdiLyswZk1LRHVtQWg4dk95NDFxUWJHSThRRkZT?=
 =?utf-8?B?Y1JzN0VhSVJyTCtlOTFpanBFc1FMVEszQ1F5TU0zZUhJRk1kUXBSQ1hlbkhO?=
 =?utf-8?B?MlhBUk1SMjRIcVFkdUlUeUlzaXVOd3RudjZYTUVaakg2a3lhQUE5WFFCOHVK?=
 =?utf-8?B?Y3hhQkUrSGxZYkRsNUtxdDlBYTFDSTdnT05wcUZJd2tjd1ZIZFN0Zzg4d09r?=
 =?utf-8?B?V3hLUlYvcWxTNnJNZlFjelJaRUxjYTRTUU1GKzZDT0kxby91K2I0a2xTUUs2?=
 =?utf-8?B?dE80Yk5BVXlFSVg4TVlJMEl2MktiUTdvci95Y1EwT2N1R21kSjh0bWhtRnlW?=
 =?utf-8?B?Rys0aWdqZVA1TTdIMm16SzRTNlNRSDJ5OC9Wc2pTNkRlRVVUT2E2dHlpRzhn?=
 =?utf-8?B?OWhzYXNLN1VqZ0xQVWhXZ3ZFSE9GT3phNWVOaFJnR2xXVG5kcFdiU1IrZGQx?=
 =?utf-8?B?RjNyUUZWWGtoeG02MmtoZEhxaDlMbjNsUDJEa3l0eDFUUzdTSDhVczhmVnN6?=
 =?utf-8?B?bTArY3FmNE1EMnpxVWRZWWtUQ3RqWW55ak1odHVwVmZneXVSRURWT0ZzSllY?=
 =?utf-8?B?Um5BU1BJRlltR0J6aDZWNFJnU09pRW9WSXJmbzB6ek1uTGdBRDYwZjhHUW5H?=
 =?utf-8?B?OGtVTTlHTmtSTUpMeWhVNkgrMmRzaDhuQlJpME1wdHRhQWd3Qm0vT1pnQXFK?=
 =?utf-8?B?Z0czYnBGSXlyZmI4b2hMYXMzcWJqSGI5ZmxtVkwrRGoyWm1iNk1vNjZyQnJ4?=
 =?utf-8?B?ZUprVE9rd2I5d1NBeC9KSGZjQ2h2akdJUzlYcmJlbjJDWXh0eTBaZENoWFpB?=
 =?utf-8?B?R2tjS0ZmVk1JR3JiZHg0b2FCMHRrekNrTkFmYjRDMlMwYlJDQTB2ZnZrQ0xs?=
 =?utf-8?B?UGRUMHJJOEtMMnRZVmNvQzZ4aVIyWEtoOEd1ZTljdFBRSFNhL0k5OXQ2ckY4?=
 =?utf-8?B?eHFDMWRZdkcvWkdHRUxXMHZEQjk3TGk4NWYwT2tCMFczSlNtM3F6S0FBYStx?=
 =?utf-8?Q?O3uEgQXf6ZO3LLQLVov31NM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b3257b-8f5b-469a-6e64-08d9f0560d7c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 07:37:43.5935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbi9+qRuOVBhygnLNGfHzZAKxliRoivZJK9XnJzQZySy1Mjc0twm1CoWi9grZqO2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3591
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.02.22 um 00:56 schrieb Vivek Kasireddy:
> The first patch is a drm core patch that replaces the for loop in
> drm_mm_insert_node_in_range() with the iterator and would not
> cause any functional changes. The second patch is a i915 driver
> specific patch that also uses the iterator but solves a different
> problem.

Sounds like a good idea to me, but I somehow only see the cover letter 
and none of the patches.

Please double check your mail setup, looks like you CCed me only on the 
first mail and I don't see the rest on dri-devel for some reason.

Regards,
Christian.

>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
>
> Vivek Kasireddy (2):
>    drm/mm: Add an iterator to optimally walk over holes for an allocation
>      (v3)
>    drm/i915/gem: Don't try to map and fence large scanout buffers (v7)
>
>   drivers/gpu/drm/drm_mm.c        |  32 ++++-----
>   drivers/gpu/drm/i915/i915_gem.c | 120 +++++++++++++++++++++++---------
>   include/drm/drm_mm.h            |  36 ++++++++++
>   3 files changed, 137 insertions(+), 51 deletions(-)
>

