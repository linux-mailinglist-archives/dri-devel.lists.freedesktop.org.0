Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E5E49DD07
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 09:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACA610E283;
	Thu, 27 Jan 2022 08:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0834F10E283;
 Thu, 27 Jan 2022 08:55:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YALz3mS87bxHMRxYAUrtpFJLJKV1JYnPv4E4wmsDRTn/xCJvHxUe9vy4fKVnJJoL/WfiK/n8PHT9EpT8EsuIKcchRS75Hb6uwBdF/2vJgzJGsQCK7vjnKjSQf9e3ojozPfQ2llYrxjWzAH6n65hJVJ12xbreCWJO7llgAZ85U+VtwPM6mqa1HQHH7dnq+0tXZTN7OgxfE0MRwAm0YkVih4kuXc40IAkTTo2WHdeGS9CHk9KGEdo0LuQWA5XfX2ASGV62ENN5KFH1a6f6H4we1kZlE67zPEf8MhdQA4XyCu6hiGmnG8Xv5UkgsbzOrX6wu7ywQ1oHl0FOZ5aCkWICHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcKO6xsaAtEgaAb/kGt7KGKjafucaxfU7sexzWq4h6k=;
 b=nVNrIZwT4S5GFoYnqb50jNSbGzbC+E/fAJh+9RDf6mRRv3TEEyiJLKHjT7UAisBAaR/4RTC+Ct4r6LfQKY5jYJm2nktQoggaPW8mW+wif7+h0Zb3QXc3yWkeWemZzjxYd4oC2n0t7fkKfew5tBFcPKAdYjX+jQ2fpmFugR0TNNG2+jR8Xg+6kEiQJ7xG58TTg9/gds92uL1hdfNtCDNOCnzPZJVEl/cOEOc68Ab/QUvgYmYDhSG2+QRV6tVj1ecIt8PAQL151kWcevDRd1XZ//GvatnZ4TL+Kc2nWZ22YO3cZXgYreS1J1vftBFDN3V9SCRkSLczDCP63T+spB40KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcKO6xsaAtEgaAb/kGt7KGKjafucaxfU7sexzWq4h6k=;
 b=rnwbFTP46+Gl7o0vi+7Mskpapsnnu97Gh9WTx8YL3TbPr+8yiXyhkZ0XLAFa9eNW2OQvoXjfA4unLcmdFk9rClgTwg6mInAxDm2yQr5/xv/c3pwH4nCxoECY9ynMnV5VPzYBElrOQ9Du9GFTuanvEiPzPKXFAMsy8fI4qcafQ3I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 08:55:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21%5]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 08:55:11 +0000
Message-ID: <3c6a9126-bf88-0f29-425f-36748271c179@amd.com>
Date: Thu, 27 Jan 2022 09:55:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 02/19] dma-buf-map: Add helper to initialize
 second map
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <f0dbdcc0-13b5-c484-0bf3-a1f8c3e48954@amd.com>
 <20220127075728.ygwgorhnrwaocdqv@ldmartin-desk2>
 <3066c6a7-fc73-d34d-d209-a3ff6818dfb6@amd.com>
 <20220127081810.6zt6cyib4s7kpa6f@ldmartin-desk2>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220127081810.6zt6cyib4s7kpa6f@ldmartin-desk2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P189CA0005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a719322-61cc-43ff-cc7e-08d9e172b9a7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4223:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB42232C0EDF3B054F6512DCD383219@MN2PR12MB4223.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZpbjtRwz1QpQgdUQQ6xM8/TWyC9zvqZxEYONN7F6JVnoPqx15YnJikAr+S6Vm1/ISOgKKtqwIE1DUdsNu/9HAIeyvaFt6RuiY8Cgyr0Ze1drJuSi1y1nOzKbVE8Nr9QyHHmFk5AqfdIxs4z0lb9RsAN90qXFc1JAV28jmpeWFJux79WXmunqzQpcoKQid8uIA+4K3IBwhJXqesTF1vp5ovXmyVC0dvvxWMlBwVVc7YtLplRquu2kp5aQKGED8zLKrzcKBfeUFg6GIuQJI1JSMOfslIK47i90dYhY7q/99tZSTt0hKWTTjQsJ0hUGvXZqOG3NhI0MIkX05Rw/fxKd/IA794vDYhaMWP7iEV1rnGEWJdqtMJOkAmFBvY2jjmQ2q8yWHSsgdUkOICJMXaNoU2Uqcnv4GmdkdsOuMztSv2JUmcU2WI+b3gdZIxR7Tb+g8jgJsj+nF/o3rDliSlSH6Fgbww6x+vAcoIy7Jx73tg5YlgG5xMIzyBiZ6KlvgIuJ2NrcOMn510G9ozQk3fEFcE0xNUlZNZujz+8XFAYR8BsEOUc9O/1ODkT4jIxnSam36VLCYOQbcqr5YRWoqQiRhLJQZl5/dd0eovXuCBXKAmEUtW9ZkwNFoU5Ri2+t15v/uRf53yLNe0lwgdee9nps0d5YusSAX2ut9gdDGDYADV4bJfWuz1f91gM7aPNU24VUOzFgzmjyB4q9dT19LFXPAfKR/ShCTrXJEitChXg05PCQg+onXIL1z4ngV9NVgYXx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(6666004)(2906002)(31686004)(186003)(26005)(6486002)(6916009)(2616005)(316002)(6512007)(6506007)(508600001)(86362001)(66476007)(83380400001)(66946007)(66556008)(4326008)(8936002)(66574015)(8676002)(31696002)(5660300002)(38100700002)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXRpYXBrZWFoMFJoZW1DMUh3RjZmRVgxazgxR3YrYUlrZDV5eGpzbVN0NW9G?=
 =?utf-8?B?SDBWT3ZXV0x4VmxDaXJETGFTMmt4YW9CTHNVRHM4d3EycVIxL05Xc20xU21Y?=
 =?utf-8?B?Q05XMEtpeDVVdEdHT2dkRzZUckhrajZ5TE5jM1NtOHp5a2RmSnpLalQ5N3FP?=
 =?utf-8?B?aXJwTjRhVjV4Z1FKUVpWWEFhZDg0ZHdiZGI3ZTR6R2RMU2owVnU4S0VtSnY5?=
 =?utf-8?B?TWM2Uk00T01Lc1lBcEJNaWVMb1o1ZTBkZWlTdElEc2Z2dFVNT0gyTE1tTlNh?=
 =?utf-8?B?MmVabDBzQnBLNFJXR2xldHVFcTBiWFI2RUpSem5icnN1eXd1UVkvbnQ1dkZE?=
 =?utf-8?B?UGtiMzM2Wnhobk96QUx4amV2MEhmZmtHVU1oLzZkSEJXMDRkVklqaURaU3p2?=
 =?utf-8?B?cGRLRVB4ZmVPczdMMkFCekZLZFF2NmR5L3hJQlNiMVYvRjM1dklGdktDNUxi?=
 =?utf-8?B?ZERNQ2VQam5ZUnBEYm5iZUJaaXgySDk3TmFRL2ZDMkRONEhDWmx3VG80dElt?=
 =?utf-8?B?NlZUZXp5UC9tbjMwTzFVUCtMalBWdk50UEFQZytOZzFORENRN3dBS3Bpako4?=
 =?utf-8?B?RjNYY0tGUWJHZUc4aWxOaWdDclZaMlZ5RjQvbENIcHdPamI4NHRBeHhwMGVk?=
 =?utf-8?B?VlRuRDRpMnJ5NitZNWFmU2VEblBueFdFUmg0eVpuSHVEWXMrTzRkNEpCKzha?=
 =?utf-8?B?Y01zYUpJbDh2NnQ4WmFFamRqWlhUeUxQam5vU054K0NkUGZReDRxdjNjTUhv?=
 =?utf-8?B?UkxEOGl2VlpMcExVNFJkSDRObmk0RDRzTThaRVF1ZmhhN2Noa1JGM1BQYTdv?=
 =?utf-8?B?RG4xZUNZR0kyRXdySUc2eFNvRWZJbVdwSzVkT3dKdmhkVUxpbGNlQXJlNUJX?=
 =?utf-8?B?V0pLNGVMdW9qeFYzME4yczBlM3Y5WGxMOVRJRjNTMUNleEpNZ0hpR3JORHlq?=
 =?utf-8?B?bU0yenpnUG5IV1ExNzU5UmxEVTlFM3ovTHhaUVVNWnZSdjRDUlFWZmxkT2RK?=
 =?utf-8?B?aTlScERYWEI1dC9oWkV3QkRUbTlEMXpyZjlzTkxLczYrcXRNUFFJSTlFd1lz?=
 =?utf-8?B?dmtQTkZxcktXYzlnaUxvM3FlMWE0c1hhSVNQZDhLYTNyMU5YZHE3RUNLczVi?=
 =?utf-8?B?Y2xUcHZhNVMvOEsvS296MXRQU3pERWhacDRYSm5qa1pWbmE3U1FiYzZwSUto?=
 =?utf-8?B?UGdodmJUM3RnQ3lKbGZpNTlZTmlpTmh1MWJYOTJwQU5UNWNkYjJiRnplMzU4?=
 =?utf-8?B?Z1Z4UUI4M2QrVk8wTkFkTDlvRVRzUVgxYjZuOTB0ajhaRzhZd2ozUTRITVZm?=
 =?utf-8?B?U0lhTE1NM0hvUjUzK1YrTm5OaVFMZkRXWTgwOUlqNFBHekxkWlF2WmpLUEtC?=
 =?utf-8?B?cldhZUdieVNIcW03QzdIenQ3c3grZjJWeUo5Qy9NMHRRSXMwVFNVdWhqMmR2?=
 =?utf-8?B?N0FGSGowK1lYYmRtelR1RzFrVVJhb3pEeWRUQlNLc2ZsS29BR2xEbVlPNVFi?=
 =?utf-8?B?a1JURnhOU1IyRnBlWVhkM2d5bG1iWUZHeE90Tm1PRENQR0pDdzllZVhwQXda?=
 =?utf-8?B?OFFoaUpFSEtpRmFBYkloMlJ6NEUwZHNtSjViZHVIY05WZGYrU1pZWXJlUVVp?=
 =?utf-8?B?SUFGOGQwS1VMenFqMWw2RWZ2R3pIajFZZHNVektNakZJSEVnaXY4bzFORVg2?=
 =?utf-8?B?WWJOZFJDK3BVMGFYRmxMR2hTYk9RdnpRdmpSejJoZFdHZkgwVllqMDYrWEtD?=
 =?utf-8?B?eG9QOXFuYk5IV1pGMGc4S3FrQXd4alhpVTYvWTNubGtLNTRvUnA3TFNiTm5V?=
 =?utf-8?B?cUtuZmkyZExaOUQ4eWwxRS9pbFluVlpqcWRmOXlOTnNrUWR6RUgrMHJRMXBI?=
 =?utf-8?B?d0txeDFxTHVFenZFek9wMHlXNzB6eUk2UmRGcHo5MWV4R29pVFY4UW1YZ1VG?=
 =?utf-8?B?ZXI2NkNtcnA4S25xcFNMakpIRFV6OXk0Q3o3NDZBK0NCZkZ2Vys1KzEwbGR6?=
 =?utf-8?B?YWliT0FoRTFCYnZ1L1UrdlA3NTFnRlI4ZldEWUk5ZDA0alJlVXRSUDVYem1N?=
 =?utf-8?B?d3lPVytYcEMvSzVyaG1EaVdBS1hyVVlubEtOclpRMGthWFY2djJ1YTNyVW1y?=
 =?utf-8?Q?4Hno=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a719322-61cc-43ff-cc7e-08d9e172b9a7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:55:11.0220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7omnw3Ub/ny4RAV+XkynlCx2dhNScNEwiO0D73JJMgEJuv7gGDokZ8kNgETZhkH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223
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
Cc: linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.01.22 um 09:18 schrieb Lucas De Marchi:
> On Thu, Jan 27, 2022 at 09:02:54AM +0100, Christian König wrote:
>> Am 27.01.22 um 08:57 schrieb Lucas De Marchi:
>>> On Thu, Jan 27, 2022 at 08:27:11AM +0100, Christian König wrote:
>>>> Am 26.01.22 um 21:36 schrieb Lucas De Marchi:
>>>>> [SNIP]
>>> humn... not sure if I was  clear. There is no importer and exporter 
>>> here.
>>
>> Yeah, and exactly that's what I'm pointing out as problem here.
>>
>> You are using the inter driver framework for something internal to 
>> the driver. That is an absolutely clear NAK!
>>
>> We could discuss that, but you guys are just sending around patches 
>> to do this without any consensus that this is a good idea.
>
> s/you guys/you/ if you have to blame anyone - I'm the only s-o-b in
> these patches. I'm sending these to _build consensus_ on what may be a 
> good
> use for it showing a real problem it's helping to fix.

Well a cover letter would have been helpful, my impression was that you 
have a larger set and just want to upstream some minor DMA-buf changes 
necessary for it.

Now I know why people are bugging me all the time to add cover letters 
to add more context to my sets.

>
> From its documentation:
>
>  * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpers 
> are
>  * actually independent from the dma-buf infrastructure. When sharing 
> buffers
>  * among devices, drivers have to know the location of the memory to 
> access
>  * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
>  * solves this problem for dma-buf and its users. If other drivers or
>  * sub-systems require similar functionality, the type could be 
> generalized
>  * and moved to a more prominent header file.
>
> if there is no consensus and a better alternative, I'm perfectly fine in
> throwing it out and using the better approach.

When Thomas Zimmermann upstreamed the dma_buf_map work we had a 
discussion if that shouldn't be independent of the DMA-buf framework.

The consensus was that as soon as we have more widely use for it this 
should be made independent. So basically that is what's happening now.

I suggest the following approach:
1. Find a funky name for this, something like iomem_, kiomap_ or similar.
2. Separate this from all you driver dependent work and move the 
dma_buf_map structure out of DMA-buf into this new whatever_ prefix.
3. Ping Thomas, LKML, me and probably a couple of other core people if 
this is the right idea or not.
4. Work on dropping the map parameter from dma_buf_vunmap(). This is 
basically why we can't modify the pointers returned from dma_buf_vmap() 
and has already cause a few problems with dma_buf_map_incr().

Regards,
Christian.

>
> Lucas De Marchi

