Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67310592E33
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 13:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDB7B898F;
	Mon, 15 Aug 2022 11:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCBEB8830
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 11:28:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKMSEzqMOK0B9DXTFIQr2yqpcdWBA7UB/Pw2QQpcuPDD2Q2X2uLLaSUNWTMZp4KQmE9a9PsMH41+vHlZVtU8gFNWZRIVobWDVW8WmkGU35FC01LhZOb+PhUE14mDwja1EwF8tXZycR2kaWNGW6tXJavWESZx1izSHpqAVIvttdoJsBQMSiCdlsm5cIkz2GFBCSxD2uO6ZjC/2rlN0lJJG1qlYobW3NLTkjOaOXCJtIXCXFVyPRk9Tmy7NvZCVWX//QZifHZlOtN5XmF010FhPvFW2hj81rPTv8/StpzvK/l/bBN1/ahQGwbhRLVOQez0tpLZRobFDA7hwcsy8YJZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oM6YTzPvEFv72OGkdeMo9uDD9nhyICWlOUixTGt4yKc=;
 b=HHRvt3QaTjV+zCAvnmIPYgxVI4DLACqdVQaRoIuvCNGyPyva/ZaI1yAM/36Rjd++Khf79gY57qJ6ArFJ9q4vBpcsSxZf/9aDMaTYf5np5K2pxd/3YCYJxq6uRwVgWRVedFNSb9/foR4y63vBAnIDmI2/asOFJ1UieNHunuVZq2Ecuyy3JActkvH/KL2U1D5qA1WQfsl/H3ydyu92UMjc9nxx0ys0R3nlLgNAzTNdu1XRllzwhRVpst2RHeDYVwdvGjWcnw+g1fHyPAk9+stIl0YwGz94LOo9Acew1Ut+nQMhUUcTACpmqn1OLdU/IHhwNupHPrpbOcLfNfgiM0iDWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oM6YTzPvEFv72OGkdeMo9uDD9nhyICWlOUixTGt4yKc=;
 b=lDgfQ/gKgDuGqG+1xtkTzKjAhfhzP6nwaJ2Jwsm/i0riEB21d/2ZZb8NwR+cRvz6GqoMLhfYDb1FJE6H1THTMXlh41gw0JB3L0zhaY0vTsTnyxqV9oGPY7yAKCrCIqmkdInCh1rxWwHZ5KXwMj/RXOZBqm7S7YeyWzIaIsEjL78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL0PR12MB2403.namprd12.prod.outlook.com (2603:10b6:207:40::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 15 Aug
 2022 11:28:17 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 15 Aug 2022
 11:28:17 +0000
Message-ID: <8f749cd0-9a04-7c72-6a4f-a42d501e1489@amd.com>
Date: Mon, 15 Aug 2022 13:28:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] drm/ttm: Refcount allocated tail pages
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Trigger Huang <Trigger.Huang@gmail.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20220815095423.11131-1-dmitry.osipenko@collabora.com>
 <8230a356-be38-f228-4a8e-95124e8e8db6@amd.com>
 <134bce02-58d6-8553-bb73-42dfda18a595@collabora.com>
 <8caf3008-dcf3-985a-631e-e019b277c6f0@amd.com>
 <4fcc4739-2da9-1b89-209c-876129604d7d@amd.com>
 <14be3b22-1d60-732b-c695-ddacc6b21055@collabora.com>
 <2df57a30-2afb-23dc-c7f5-f61c113dd5b4@collabora.com>
 <57562db8-bacf-e82d-8417-ab6343c1d2fa@amd.com>
 <86a87de8-24a9-3c53-3ac7-612ca97e41df@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <86a87de8-24a9-3c53-3ac7-612ca97e41df@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31cac634-54d0-4eac-f907-08da7eb13fa1
X-MS-TrafficTypeDiagnostic: BL0PR12MB2403:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UV8J8YvXgwgJn8Wd9cyNjJwNtemsQ05Q0C/YSHdDqwqvQhWMzBcNgtYXH/tW5LLFJ9pNMZgq5irjQr/YYc29HKyfa2Y5lLdmONvYKLIAN41u+4Jdpe1JJvFOKZvtrBqZXEsftwI5jnXDG6gmttazXXpyIcXfcTiHbUIPW1VbKYMbLlsYV/g1NY5Od31tv2SEK4CbcLffrRDymrr45QkllxjY+XCU9oNTxPsbPcnbAZx19ZRm3RCU4FIQ1xvrXeDIZaHMh32XWkr+oNj2lYCiTFDU7GeyQj+OKkYHbqmUIOGBoMtu7wPHs/UaFfZGwqCr9Pf1WvgKajyAykPFt4a0RtEAymtP5jHJG85JFnGs8SICwBroEbgcdPpkTh6YThHNerybj/CnpHxvBzXqWzA3W7AJ/OUyoKQ5ZIRbvxKwsKKJhDW6qwyYnhslORi7XHNMTMvJ0+0MNXagtnN87SKu07jZtwipLihVLAseWfNR2z/eHINV3Sx/dkJLTfTSlughYX5lPvrJBeMrZ0KICYLx0AQvtxYjzXuygoJYy1zufP5smYcZZF+PQlbW1zdA63Nsz/URubbYMZcvb5kwXFHth9bUe8NbJLJzBfwIf1uASe5erLZucNf2iqaemNnGS2XqCipDWslEV+LngDU8DuFlst+FOa9FzWIRN5t6C9Xz4g5CDfAnYUjx2VWDfhkZB3uMu8t6AX6er8OcSpSIg73izU6bywz4oBZxYpgo+rdusB0Ua6LtV2E/TVK69aCcS0EfWJ4pfpK660SxAA52E22nG/NPDYxzpAPXk6bspSQq8deGOAm7YLgKXLp55dut2cFGTbnlegGRMU1hK9B2QRo0Gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(38100700002)(5660300002)(66556008)(66946007)(8676002)(66476007)(186003)(478600001)(2616005)(41300700001)(6506007)(6512007)(6666004)(316002)(6486002)(83380400001)(4326008)(110136005)(31686004)(36756003)(7416002)(8936002)(31696002)(86362001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDlqV2c5MGM2bTcwOXY0MXU5ZkRObzhoUDZxNWNMZklyMmdNMnA3TGNuaXdU?=
 =?utf-8?B?bnhXQXFlc2ZJYnk0SGVrY3BWdTZlbDZDWnR0TmZNU0hFSk84SlhtYS9BTTV0?=
 =?utf-8?B?cjdCTmN6K2d0UU1hYXB2MWluOHFUNTR4aTV3SVIzVS92aU02dHVoRjQwNXVJ?=
 =?utf-8?B?YkRiamtMNzZqYUNGMWtxZkJMdUp5TFFXSEFTRDFyV3kzSGUxakM0Y3BPNnJX?=
 =?utf-8?B?Q2d6b0d5NTB0d2VqZmV6bDFieDhnNzBsQ2VJbDR0N0xrZmxBTm5VLzZXQ1JL?=
 =?utf-8?B?Tm4zY0VjM1F3MElUSG1kWGsxNklhSFhGVTJUbjVmbkU2c0R0cmpQV1FTRW9x?=
 =?utf-8?B?d2pqQVV5UWEzZmpNcW9CMFhuZThuYmR2am51ZjI0bXIrZFlsQnRLclNnTTdu?=
 =?utf-8?B?OG1FSm1IN0hxd2pZM3E1dmxlV0YrLzBJQVpOSHErQjJlUmM3K0xYdkprYkh1?=
 =?utf-8?B?VmZCeE9YcTNUcWpoOGh2M0dDNWVpYkc5Ym9nYjFXdktGS0VVenV1ZGYxRExM?=
 =?utf-8?B?c2ZSTjcrUWVINWVDd2F5OUhjNDVIcVV5SUhqT1pqSzIrT0k5SkZaY2JBUGJ0?=
 =?utf-8?B?ZjRBclZRdWNqY2t6MURrOVJYaFNzY21COXNSdjljdVVqTWJCNWJFTkhLbjU5?=
 =?utf-8?B?TTdyMFFEQko4dE95SWJMdjNia2VzcTVkeTk1NEFUTmpjZ2dSR0Y5dWROV1pV?=
 =?utf-8?B?bm5UZEhISElaT2hpUHZIN1Z2SUx5Y20wNy8zTzUwSFBsYzVDcjhQVlRLYld2?=
 =?utf-8?B?VDhvV2FISjZlQ0RaSHdtd01mcTBuSndOL1NGNFJMcU1qZThRZ3lmOHJOY1Zt?=
 =?utf-8?B?NmdIUGVTRG5IWkNaTU11UUErY0JySzQzKy9vUnlUK2ZnTnNSNDNkd1FRei9n?=
 =?utf-8?B?YzVJN2k5Ly8xTk5SR3FBYzV3dExYcm5aWFZ2bTZRc01lbEd5T3pPTjJYM1pz?=
 =?utf-8?B?VHh1SDRXOXdGVkx3OFNhZTVPU2I3WjZWYk5MNWpZTkpUMlBYNGh5bUVwYlNy?=
 =?utf-8?B?eGlrMmoxT2diWGJzckNsc2N2VlduSXRpREdSOGlSNFUybVRmTEZwNDhQMWJn?=
 =?utf-8?B?dDBoVWJ0L1lWTFJNclhHODQvenZWVG50ajNBWGNQVDlZaE9ZdXgyODBhK1Za?=
 =?utf-8?B?WDRsbHRXd1Y3MjFjeEJCcVQ2czZIRlZ4b2dHZE9zUDFNck5kMTVqVFdMSTdk?=
 =?utf-8?B?SFQzVHg1WHdHQ1V3czlFVFJPVTlLWDNOZUg2dXQxRjZoMXUzSUdCZmo3WUNH?=
 =?utf-8?B?SFdNM0xVNEM2ZmwrcEliV3dBTnBNU1pHbzNvcjNBQWFhNnNtVW5iY2p4OUQy?=
 =?utf-8?B?WlNqbGQrQmRNekJWNldZWkJWSkt0NGdnendEWHlPMFJtZjZsa1JZdEFNSUVs?=
 =?utf-8?B?TXA2ZC9oY2xlVGV6Sjk1d2g3bitjMk5LNzAwMGc0azQxM3NlaUovd2NMVGJF?=
 =?utf-8?B?SUJQNis1SkFjcVZYUnlpTUJiQzQzN1pvQW9nT01BakpkUXZpUGpha3hzcFVP?=
 =?utf-8?B?WFBnK1F2Ri9Ka0s5cktTa1NyQk11L2hjMlBDa09XeFdTK05HUGxVRjBvNnRV?=
 =?utf-8?B?SUkzb3pXNEdKZVBHZS9WWEwyT1dlUDYvS1ZwcHVTWVNQTXQ2VDlmWk45clpM?=
 =?utf-8?B?SnhxZWFTTVF2UnVaWUlSL2pRSUlodVd6VmlNdEVCUmJ1dFFUNDNORk81Rkkx?=
 =?utf-8?B?ZTBpNzhHcGY5bEdPZ2F3dTFHc21rWnlZZnNXREROSmpXbUM5bmF4MkN0eUo4?=
 =?utf-8?B?ZG1YaWMydE9EaFhlZWh0ckdqaWltVjdCbjRUcGhMajIzVnpiWXZvTlY0RlF6?=
 =?utf-8?B?SGVHeTM5YWpDWHQ5emsxZEdPR2N4RllaWEE1WmFGM1puV0JaM3NTcTdwL2hX?=
 =?utf-8?B?M3JqRndnQnpWNEJoMVUvRUN1dkhBRzlIV2QxQ3pUMjZJZ0JoWmtWSmJEbCtU?=
 =?utf-8?B?ZHl6aGhmdUtlSm80NzRzSUxqOXc0WHFRc1d2bzd5ZzhCNVJ4ZUlZUG5HOTJO?=
 =?utf-8?B?SEk4SkZMN3hQbTEyeEZ6blcxSUtqSm9WRmYyYVJXS0w0NXdGMUF6dEEyQ0Fp?=
 =?utf-8?B?Si95K0ExUXlGZGhIR3VwdVpteWlSNm56aXZKdmtQT3hEUVIxMnhweGtVUDdI?=
 =?utf-8?B?THVWUGNnK203ZW91N0svYnU5VlUxNEMyQm5nTGZqK3E3b3FMWk9RdDU1VkJv?=
 =?utf-8?Q?/WbXiRbpN5u9OblBOWfpJa9WveEVoLpxgGImj0cVQl+N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31cac634-54d0-4eac-f907-08da7eb13fa1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 11:28:17.1205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5w3v60m2R264dzCYE5uiqiYEjXnVjXsOPQzB4rBWF4M4G/cHpK0zrFnoi5Bv0tb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2403
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

Am 15.08.22 um 13:19 schrieb Dmitry Osipenko:
> [SNIP]
>>>> I'll try to dig out the older discussions, thank you for the quick
>>>> reply!
>>> Are you sure it was really discussed in public previously? All I can
>>> find is yours two answers to a similar patches where you're saying that
>>> this it's a wrong solution without in-depth explanation and further
>>> discussions.
>> Yeah, that's my problem as well I can't find that of hand.
>>
>> But yes it certainly was discussed in public.
> If it was only CC'd to dri-devel, then could be that emails didn't pass
> the spam moderation :/

That might be possible.

>>> Maybe it was discussed privately? In this case I will be happy to get
>>> more info from you about the root of the problem so I could start to
>>> look at how to fix it properly. It's not apparent where the problem is
>>> to a TTM newbie like me.
>>>
>> Well this is completely unfixable. See the whole purpose of TTM is to
>> allow tracing where what is mapped of a buffer object.
>>
>> If you circumvent that and increase the page reference yourself than
>> that whole functionality can't work correctly any more.
> Are you suggesting that the problem is that TTM doesn't see the KVM page
> faults/mappings?

Yes, and no. It's one of the issues, but there is more behind that (e.g. 
what happens when TTM switches from pages to local memory for backing a BO).

Another question is why is KVM accessing the page structure in the first 
place? The VMA is mapped with VM_PFNMAP and VM_IO, KVM should never ever 
touch any of those pages.

Regards,
Christian.
