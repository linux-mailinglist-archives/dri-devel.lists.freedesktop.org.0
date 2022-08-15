Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97635592B5F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 12:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC608AE22;
	Mon, 15 Aug 2022 10:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2079.outbound.protection.outlook.com [40.107.102.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D3995B83
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 10:14:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsjBvl848kme8gj8jduA+PFxtnlEJwf2Hd9CsUvooR/LCAMIf3kpG0ithAl55JUVUnofEUdkdlhPQ2fcq/g3TmIjqJdVGaJ1jV8uPIt03lLpvIQnyPzyC1d37rpDkJepaIemCqSzzV7lI8MLIjlqBSSoSaVq0BnRC+L2sbBfS1uUMynn1qCgsfTFkjATnZE2vMt6J0O+WDsFVcXqDAvjhaP/oqc6teN6wjyWr3nwi4oTbb6h/l1gEO8S7nhBwrXk0pxQiWrgviST8hcJrUanXwnhtlCr9utd+xE/rEvdfJsDj9uQ9u82xvGzuqm7abxWbA10B64mdbgCIM5sN0egsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sg19G/aAdqHb1FlMKsip2ZDky1akZ7nl+m2qPdzVSm8=;
 b=OYCrIxc5piyXzM4c3oNCNo5d65lb1yYpRLfv3CbldarpE2lXhq2w6qbLnZO1AYxj+K22SwA90RRCPpHR3A/Bh1RrQy9dhYze8ljailYDb0gMgBi4TuogFRNZ2xju4SJOoblf+OhBIEW0HUHFYwLymq0RFNX7bYJRJCJwfVM9Xg0Ihoa6XP9Xpf97p+fBxDMdzDSDgpWuaeXp7wm5LLRBBnStQOAIRtgU2eBdZ0c9pOZB4L9q1zK37e9Iu6K9ucwEoQlsSbuhJXnjPV5sA+0ERryE1zzGblGOtpUloqSMyL2ou2Hx7IFfXO56dM7nJ1KDZxguuPANGnglcKL6F8fcag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sg19G/aAdqHb1FlMKsip2ZDky1akZ7nl+m2qPdzVSm8=;
 b=BO6sYth7Swn6HyS8otGBuIsqN1TM823Cnf782QgyoI8NFTnN61kDsubMeO7wyAeOndaihZfExKu3SflXBHLalFc2xBSh5rMiRDoMTZ+X317zJL4vfl+CWiU2n+RsbTUVeHWLAxjLfa7MfzO1GQBKp5FrXqmzlnP0h6Q+uqX8WNM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4251.namprd12.prod.outlook.com (2603:10b6:5:21e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 10:14:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 15 Aug 2022
 10:14:06 +0000
Message-ID: <4fcc4739-2da9-1b89-209c-876129604d7d@amd.com>
Date: Mon, 15 Aug 2022 12:14:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] drm/ttm: Refcount allocated tail pages
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Trigger Huang <Trigger.Huang@gmail.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20220815095423.11131-1-dmitry.osipenko@collabora.com>
 <8230a356-be38-f228-4a8e-95124e8e8db6@amd.com>
 <134bce02-58d6-8553-bb73-42dfda18a595@collabora.com>
 <8caf3008-dcf3-985a-631e-e019b277c6f0@amd.com>
In-Reply-To: <8caf3008-dcf3-985a-631e-e019b277c6f0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0024.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::29) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dec1f74c-2fea-40cb-efdd-08da7ea6e322
X-MS-TrafficTypeDiagnostic: DM6PR12MB4251:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ntT5Nm+DVq21Iht7tUEmozUIUba3bhwDl2F/TGzuVGaaMIUf6xynoOGYvaa/W3XNm0JoNE+mTv/OrP8at2bGOVdngHNzoGk9gCVd7pVKT7c3ooOsSnhmDMhxW9GGqVrIXO6DXuSunwZf6bIklXjisg0/hcurFvhwvbq8hV0HemVIsTezEUUmpgkEDirGmTY8wyA3HdTH7P/S3INt0VjwBX5I5l3aFc0IywCgbNCI8M5uaZ14o23HqpGFwRhkFA9AhFVxGsXdRUoW2z3gU5QhZIwpsX1of+EOWpSi8Xua8QxTOvG75p+sLZuKRyLf4jIp08kmSTED0ORXQiRTHJRdWsYcZRb6xxQ9rPxwndIIqJp7uwcu42J6/WzV0S4t/oMHaQXQAarH+aq+nOzfIjJxxDwwhsoQe++Ya/JPia43IF8xFbnh2tFlmvWe9f7MDQBzlZ2IIoel8NrRCZI6cO0wqBLW1R+uTXd91G6rYHJt65HThp9mCC11yoAINmLqLauxQM0W1ffGHdHkIGlepNxviBaVwWeWmlis6XBeLL5zZ+i+KfLBXInnNLmdBR4KkAkhadyMNKPXyv0c5+yJ7aFEiCkX7EE8WJqnCjmQhUyMQs1GpB+0ISCPUnczRPO1QyhwWIp8r8Pt7WIHJXD1UFHlG4ctqf7/SUhU4wtvTTgbv9nFvKCaorfz/md0uwwgt1mHGZzkjlhOn4NuU/k0SacidqaVIl52e0QZ8RVxNmV9hYgR95bbOD9XO7g8Zs9Eil7SLXYFsXQ99l9/oNZtcx6xS2ebHmM+pOG8OzvNFDrqp4z3tf3lwT9ODlr/r66YA2YBYUO7pPq9ufw6XPfhXXyBdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(7416002)(8936002)(5660300002)(31696002)(2906002)(86362001)(41300700001)(66476007)(66574015)(186003)(6666004)(2616005)(6506007)(6512007)(83380400001)(478600001)(53546011)(38100700002)(66556008)(4326008)(8676002)(316002)(110136005)(6486002)(36756003)(66946007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFFjMnRYVll1ZkRJWHBLYkNhSjE4LzYzYkZlT1hMYnR4eVpoQXB2SUcwUzR6?=
 =?utf-8?B?VEFDL1ExeVhsLyszZTRkaEUyMTB1YkFYZ2ZHWXhrbXZaWkFUKzNLSnhoa3F5?=
 =?utf-8?B?eFljcUxlSUtPclFTbmgwUTlwWWNTZGx1dFZRSlQ1NnhmMk9HOUM1VGtJU1Uz?=
 =?utf-8?B?endvUldLTWQ0SktpVG54anI0ZGtSb0ZUMkkvRXpZTmhjM1JraWdaRnNhZDlG?=
 =?utf-8?B?eHAvaWxTSUZqcGxlVGpkdXZhSFg1SzNtTzMyaVdYRVV2L0pvUm45VTVNUmQ0?=
 =?utf-8?B?aENlTjB3bnNSRWFKUGNjdlg5TnN6VENDMlNDOE1OMFEzVk1YZ0VLazRlL05y?=
 =?utf-8?B?MHBiOU1LRHViZWVid2t4Um1zSHpBdEtZOGYwRTZ5d0JBK0xFay9GZGFFbHpP?=
 =?utf-8?B?VGYxQi9DNm1aN3FjN1g4TE8wZ1NEeXpsOWNDMzZ6dGJNajZWTGhBNmJTMEUv?=
 =?utf-8?B?RzdOVWo4b2NTdFVqb1FqdFNjcVpZWmg3MEpvMWZRWk9qeU5neGNzcFFYcDd2?=
 =?utf-8?B?Zzh1SFRpMHB3a0NkcW5peStFR2F1UG1BMTgyM2lQZnh3ZWtDb3BvdkN2RlV1?=
 =?utf-8?B?ZlNybnlwRlI3cWEwSFVHdHlzWDZoTkRGVDBEbmExbWVJQ09OSEhVTVlMWG5Q?=
 =?utf-8?B?d3JaN21zcndyQXJGdWpRYWZScmEvSGhxSnRqaG1rVTc3NDlXM0lsdHRrblR5?=
 =?utf-8?B?ZUc3dVFBSDJDVXk4c3hNUVZVQlRBWEdZejYzNFY0blQvR0UvOWZPbHNoOHdl?=
 =?utf-8?B?eHREWVNLWGJBajRVeDE4ZnVuaG5COE5NOUFhaVBLVDl2RFRpMHJ4M1FYMVoz?=
 =?utf-8?B?ZERSbnJ6UGJab2VFNlRyZFg4eEhRZTFid29CeXRZZUE5N0U2cVBjRDdDQTEr?=
 =?utf-8?B?TDhBRWNBUUZzd3dWS0RGaDk5Wm5PbHdQNDhoc3RpamJVTkdXVEZWRVJyb3kz?=
 =?utf-8?B?d3VmV0pZZkNBdERsV0IvK3haNnp3amw1VUJuZVd5MVBleGs0OVhvSHRrc0pM?=
 =?utf-8?B?bG44RVFodHozcTNhZm15elZaMVIzMlNMcDVXRmVvN0s4MTRrZU9ieEphOG5P?=
 =?utf-8?B?aFpIZUsreXNMeW1UUkhTYzY3Y3pLc3BjTHFBVy9CRmtNQjZWanpiWEp5OE9i?=
 =?utf-8?B?MVlVd0oycWZnbUFsN1hWK2cyM1NpMkI5RGRMR2dvRFRVNVEwMm44TjRuNzZs?=
 =?utf-8?B?d08wcG1iZ3BBdCtTK3hCWk5BNWZHVEMyTGE2VXNCYjRJVFFxUmIrTWh5N1ll?=
 =?utf-8?B?a3c0WmxDeFp5R3ZhZ2UvR1laK2plZktZYlovOFBQY3RGd2twZS9RS2ZReWpo?=
 =?utf-8?B?ZUlMYWhjNFFMbmh3a1dxQ0krOEIrVDNPcHJyek1HZU42Ynk5RjV1bHcrbEhm?=
 =?utf-8?B?Ny9ZaVkySnpyTXZyWXZxVVIxNy9tL255NXpSN0FwK241STJBNDNwZ2Y2cHZF?=
 =?utf-8?B?WEg1QkdqaENTMHJsUkdZV3pzSjVldkdDUXYrRWdwbzI4MVlWaWp5emFyVTc4?=
 =?utf-8?B?eGhCeXAvOW12b3B5YVRXWWZNSjI0K0IrU2k5NGh2UmFLWXY0TDA5cXd6b1NC?=
 =?utf-8?B?cStRMzMzRGx1ZGpOWTdiekllOUpnOEdoYXZuV3dNN1hKaklSd2swcmJ1UnZM?=
 =?utf-8?B?TnNhYTFqTVlqWDlNWEtpcUU1Wk05THpNbnRFbEM0dEI2dWVVUkxxUE5aa2d6?=
 =?utf-8?B?WXpJQ1ZtNVhVQWxDRUtTNVVabTRMMjNnaUNreWZqUkFPcFVyMlgxaGFkaWdY?=
 =?utf-8?B?c2FpcmJwQ2hPcjlQdWdUYXJYZjlQR1hjWG81RkMzMWlPaC9KcVRpeHBiZUJr?=
 =?utf-8?B?ZEFmbk1HbTk5UGNLZlptaDE1M1c4VkZYRjBMVjQrRnIwYndpN2pETVVUS092?=
 =?utf-8?B?YW5pOTVLM2psS3hBQUZ1S216NlM5bVZ2SU1yTGI1TVQxcCsxeTI3cUFuNE0v?=
 =?utf-8?B?MUZQVzVZZnFkNTZXaUJZajRXbVZ3UDUyWFl1dE5Td1k4azFreVoyN2ZlaVA0?=
 =?utf-8?B?RDh1Mk1uMDFsMmt6cVRJVFd0RkNrbE42Rzd2cDI4R3dWWjM3M093NTRMVlN0?=
 =?utf-8?B?dy9TeGtrS1NNaTNNUWpDN1pWMWFNb1RiMnk1SVN0NmQvYnN0ZGNJOC9wZjJ6?=
 =?utf-8?B?VTFaZ0lvZXBxVHI5VU52empBTVZLWEhUbmpZRzZUR1ArYjBLMGszcitkSGJX?=
 =?utf-8?Q?kXSt3iVvHDCTf5x96uNRYJL8N57zmwhCe6rAN0Gjmp1a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec1f74c-2fea-40cb-efdd-08da7ea6e322
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 10:14:06.8297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xoNbRTWAH1dqOCNGdTtNe36eb9I9jxOtK1VoX/9t7kCVBBEr2GbRqme58ln/tFGY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4251
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.08.22 um 12:11 schrieb Christian König:
> Am 15.08.22 um 12:09 schrieb Dmitry Osipenko:
>> On 8/15/22 13:05, Christian König wrote:
>>> Am 15.08.22 um 11:54 schrieb Dmitry Osipenko:
>>>> Higher order pages allocated using alloc_pages() aren't refcounted and
>>>> they
>>>> need to be refcounted, otherwise it's impossible to map them by 
>>>> KVM. This
>>>> patch sets the refcount of the tail pages and fixes the KVM memory
>>>> mapping
>>>> faults.
>>>>
>>>> Without this change guest virgl driver can't map host buffers into 
>>>> guest
>>>> and can't provide OpenGL 4.5 profile support to the guest. The host
>>>> mappings are also needed for enabling the Venus driver using host GPU
>>>> drivers that are utilizing TTM.
>>>>
>>>> Based on a patch proposed by Trigger Huang.
>>> Well I can't count how often I have repeated this: This is an 
>>> absolutely
>>> clear NAK!
>>>
>>> TTM pages are not reference counted in the first place and because of
>>> this giving them to virgl is illegal.
>> A? The first page is refcounted when allocated, the tail pages are not.
>
> No they aren't. The first page is just by coincident initialized with 
> a refcount of 1. This refcount is completely ignored and not used at all.
>
> Incrementing the reference count and by this mapping the page into 
> some other address space is illegal and corrupts the internal state 
> tracking of TTM.

See this comment in the source code as well:

         /* Don't set the __GFP_COMP flag for higher order allocations.
          * Mapping pages directly into an userspace process and calling
          * put_page() on a TTM allocated page is illegal.
          */

I have absolutely no idea how somebody had the idea he could do this.

Regards,
Christian.

>
>>> Please immediately stop this completely broken approach. We have
>>> discussed this multiple times now.
>> Could you please give me a link to these discussions?
>
> Not of hand, please search the dri-devel list for similar patches. 
> This was brought up multiple times now.
>
> Regards,
> Christian.

