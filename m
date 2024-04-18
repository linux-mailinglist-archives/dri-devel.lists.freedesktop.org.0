Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8726E8A99B8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 14:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE11113C27;
	Thu, 18 Apr 2024 12:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BvT4Vmom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C649F113C23
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 12:26:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxuk+tF3h9T6bA220Qkv5kvHHxuWJ8wg7FANnP9xjIwl5rniD6G+4E48Ng7+46fKdjWB5VxhMBnfO851/kq9VAobCbV9cwQRmAyOCYW2fkv+7fFWoUAriLShTAEN+2zmurHbNpviM3hr90Yr5QkT1Tb1enY/qG9+1CZbupuIcmiDxuw809Mui6h6YCulppbCfJf+A3xWObjAgPOKDpHkOV44QQ7KrRDjNkPKAn2TpXr0woCJpBDuNGd3qN8U9rrOCGeOIH1tlbUbkPa5diTfwcYvw9q2YCFTLHzHKjwVrUgtzEeztoaL/94KAVh2n/L8dynqmTmMhEiynZsRbxCerA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXLDPl91cv0iGuZ1wPRgtFiv3oA+pJ1K+BzzwoI9lyo=;
 b=OyQImkHm56+0i/PEWfzk8bg2pFDvyjxikzDW7OXz8RrueSRtYI5zw/nDFQPz050GjfPU0EnHi4m1C9kdF9lnQ82T/mphXGX6cgId5lXA+R/KGL+YCgGwCLPkLcU3Sy0lSW12wBTNmMDQKPGphYwBWfebQIv6jhRewhC4anggFCz6eS+PHZ+fqMLWXCz0Ok/q4grIaqKW9XnjatRxhkVT9t2s+fyUyWz/5+ynVK4MW/KbhdNyEXRjaS7qIeMiQ6WP+DImcgDmqYuS6RvQ8VeFTi+aIpFibF2YDKNMnMi/LzD9C+xRiIuQgbwhG8wqOq3HozjDW/db4b3MMpM8mJ7Bug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXLDPl91cv0iGuZ1wPRgtFiv3oA+pJ1K+BzzwoI9lyo=;
 b=BvT4Vmom7pgriogaEiEgKhCVKvqjPdCQ4C4pOp18yjTLdlWfjiZTKu68LmSSvSgZMItgM7MLbQBJFx22RBegaiwg5lgpf19lx/7GjcA0dkYRaA27jRE9tUoYHwgaDfoNKAokJ9lpS1lMkQ7JwTc2BNhYzD40ynHXz0Qgi7bUM/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6911.namprd12.prod.outlook.com (2603:10b6:806:261::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Thu, 18 Apr
 2024 12:26:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 12:26:07 +0000
Message-ID: <23c8a80d-a816-455b-b5ab-d65b159fd90f@amd.com>
Date: Thu, 18 Apr 2024 14:25:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Print the memory decryption status just once
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ian Forbes
 <ian.forbes@broadcom.com>, Martin Krastev <martin.krastev@broadcom.com>,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240408155605.1398631-1-zack.rusin@broadcom.com>
 <843fdfa2-348b-410e-8ff1-84ab86cac17d@amd.com>
 <CABQX2QMtTB9iiQuce36dnk6eO1Xcsm+Xt3vc1Nk93TGD+TtV9w@mail.gmail.com>
 <5ca415e9-fb3e-4d81-b385-71e8780a1399@amd.com>
 <CABQX2QMaF6e6o4Ewg6sExfaEZMXRaUrNHNYUCAYG3+44P=7epQ@mail.gmail.com>
 <CABQX2QNbbM-frtkVwYWZytUAqP0t0gyyd_tZc_s0bDxu+MaFUg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABQX2QNbbM-frtkVwYWZytUAqP0t0gyyd_tZc_s0bDxu+MaFUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0013.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::26) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a05cb77-3240-42e8-5be7-08dc5fa2b8fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9nlzjgp2twrMJ6d4a0Xqj6zYTDkX7ug/9qPiz8ApahPzrD6pKPFkJY89HwNRZli5bWJfBN961PRW6W3Z86DKvlK9vsBzjEfxuudEFE82oSeo6XaZdeRiXafuGPKLqrzkh5aLxpUVeB4TUxNCa3HeKdtfZe9eTpYomno82F6aUOopSg5DTd9hn7iaqDDitGNta1kzD3haVbnkRgHnGYGYbiwvd4EekdbtFLACgfn4k/HHW5AkA191wHlKvEPsuHv2v9Y3icpgKlZA3DHEPP862T4LYwzQUW6XSPXmz3am03Q5pCaIZ0BAwVDfmpTu1NB+OWBci6X8Hihg8vcEjKpB+AfiCFh62FCP0gW3FlGMz3/CFHCcPoLaF0gy6UvNkPwQ1jKVE6B2pNVSZv8oZQ0b50XyquaqS+jRTzIlQd3YunxAqP+1zv1/Q18pEzB3Ta9iW9Dzxq+RZq4c9spOUCW13d0g/E+5mEae0UBTPD+RE/Tgwa4a/VhLb3zzgXHBxD0rLQBdzhf7cTmKllhhe9Ri0G/fQODViz/iD4J13pr8XT46pgwsn9RpeOHPBMtk7zs3tYY/18ALgoFRgxQQ3c6TF5NXUXQ5Zl+wPCkNTsDNgTTl00+AOQpR7DOsrZGNN1JwCchZxI5snqB+aBt7gLReXzTCDLrpqPop2fTgC5GpUOI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWV1RlhWWEJUbkpIYTQzaW1NN1N0SXVEZW9PL2FLM0dKaWw2dlVsaUQ2T0Ez?=
 =?utf-8?B?MldBRVpKNFBjMEVmbm1NVVFoN3FITVMveEk1eXY3b0dxYS9vTFFYU2dBV3B2?=
 =?utf-8?B?bVZMclQ3N2IrZW9qeXE5SlJURGF2Uld3bXNaYkY3OWdTeEliZXUrVFJlYnZH?=
 =?utf-8?B?eXQrbWNpa1ZYUWNFaEw2NzlJZVdUa29QclBXbmM1ZFprRGFlVC81NUZRak1O?=
 =?utf-8?B?VnJYckNFOEVVS09pZXdMRGpwQlVoYk1zR01LVzkxRWlpcUQ4L2UxRXJxL01L?=
 =?utf-8?B?VWwvQUY3MUhKSStBVEkrSzNOWm9rUXlsNE4xWHFFRGsxdzV6T0o5cWtvT2FT?=
 =?utf-8?B?SjUyc2Z3K3hjd0xGMFpQc2thQzlhcjBZTTMvQjBNU2dDNXRGMEcxZEYzd0FW?=
 =?utf-8?B?OGVncXRUODlKQ3dZSGJ6YjE5Y3Q3MHZLdjliV2s2ZjBtQWJtM1grS3hOSzha?=
 =?utf-8?B?RnhHbHRicHIzdXYwUzI0WDlXcWpibFp4UG0zUVFjbTVSRDh5SS95bXNaWFZl?=
 =?utf-8?B?RGxjWEY5WUpVRmFCQys5a3NLVWZzME9obXg1ckVEK3A2QWZtc052L09RU0Rr?=
 =?utf-8?B?R2JkYmJ5bEU4OHJoTmFhNC9rRllpUHA0VXZxMTRjRlJ3bTUrczZmUXlUYjEw?=
 =?utf-8?B?WjdPVVI4Mitmc3NzU1Bvb1VQOVJCSCt0L0NDbWlVOHVYemxGVXdQUHh0Z2I5?=
 =?utf-8?B?MVZzNGpCQURZN081SUVuOHpMa0VpTmpjTTUrUlNZUHFvdmVqWCsxNk0zbUUv?=
 =?utf-8?B?bU1neVVuRnV4YTRIbE44TGdyaEtWb2JJbHdIalN3M0dFYW1iTzUxSU5mb2Jz?=
 =?utf-8?B?VlZuMGZIaXBlRytlRTgxZVFqVW00ZnFZViszblRxSlNjTGdtSFEzckp5bGpz?=
 =?utf-8?B?b3lXeG1jUXdSWFR0S2VhSU9ET2hFRFFWaVNZS0NJZjBNNkErRkNVellSVHQv?=
 =?utf-8?B?TXpwOGFZMi9lTGh5ZDN4d3VsbVllR0p0Wlg1YUFTcS9rc2tZSnhuVlBTSHRD?=
 =?utf-8?B?NzAydks0eXIvNmlwZ1hWRGhhU3dncGp2bEMzTWJnV05udUpVcDFXRC90eEto?=
 =?utf-8?B?eTgyYTVBNXM3ZlBjMVg5RXV2b2xLVFNmUDlPaXhIcmZQYUJZL2FkYk90akhi?=
 =?utf-8?B?RG82djJjODN2NWtrUTlRWDVraWVQTUEzN1lpM1pKc002L1dHblMrdG1NWk10?=
 =?utf-8?B?Z3ZnTk8vb3gwaUNCODFjZGpTUnNHaG9icm1sUlhtLzFHaFUvazdYOXNvSnNU?=
 =?utf-8?B?ck5OMy9JSW1nTk1kbi94WlArWHZxS0tkeU1VcmFHNXY5Rmt1NTNUaTNHL0dp?=
 =?utf-8?B?RVczMVJaRy9hcmFUTGRGU0dJNWZuVWxUb21zQkJPWVJMdlFVVVJrY21iS2R3?=
 =?utf-8?B?d3ErZDJEVkdtUnRSbEZoWWthWnRZcGVoUFF1SGorbkJGMmhoRHdYSUkxbE5x?=
 =?utf-8?B?WFVqUnpwZ2orNGIzSmNLYzhhV2UvdU1BRHdQd1JQcE10QVYvQlUrVEZadi9O?=
 =?utf-8?B?ZXJGczVBUGZ4WUQ0L0ZJdGs0aFJCZFVKb1lCY3Nxby9nc3JVUU1uTVRxM1JF?=
 =?utf-8?B?SDhXUkZ0NThBTmFONVQ5dEMvN0laNzhJcGo2Vlhya2xmalV3ZVRpV0llNGZJ?=
 =?utf-8?B?R2VLSVRSWVphY08zeENLb01yU0VyTlc1VFFoQmt1dWFtMEJpajcyK0ViZzhY?=
 =?utf-8?B?QUl1d0lxejl2b1ovOCsrbkZBUU9BMCsvYWNwY0F4Z3BWOEQ3d1MxWlBLeDAr?=
 =?utf-8?B?cGtyQmhMVHlEalI5S2ozSG9vWnAzWFRQdVBjSlNoS0owZlpKb1BqOEtCd0Zy?=
 =?utf-8?B?QnVOQUYyU1VTRXVjYVhYaEVBdm9nM0UxTG9RNHF4c21WSVcvM3FZNjFZc01W?=
 =?utf-8?B?b09peWlRSkp2azA3dndJQm5vMUtGaHRHbUllMHRRK2syTUxQWUdpRFpHcWlw?=
 =?utf-8?B?WEkvVkcwMWNzVWE4R1hidXRVdU54MmgzcXcrMzdRbVlxbVJXdnlObnFhSTA5?=
 =?utf-8?B?WDlIcWo3YjFreG1vKzRjQTBYRGNWQi9zdElnaG9xWkZxUllQdzl0RzVBaGVD?=
 =?utf-8?B?bmZOQXhLZFBHNHN2cTJlMjNVWmpsTk13MHhPUWZGeldsbTU5bmtLKzJzYUVF?=
 =?utf-8?Q?d3Pg7c5ypCCn+WITH8a7fk5nM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a05cb77-3240-42e8-5be7-08dc5fa2b8fb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 12:26:07.3930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/kj2P5dIPmg6zod/XyBncx/Or3NWmUmCj/WiShX7e8n91Q54FpgUsHMUp6AfI1I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6911
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

Sorry haven't seen your reply. Feel free to add my rb to the patch.

Regards,
Christian.

Am 18.04.24 um 13:38 schrieb Zack Rusin:
> Ping on this one. If we don't want the "_once" then I can quickly
> prepare a patch that just removes the logging altogether, because
> while useful it's polluting up the kernel logs too much right now so
> getting a fix in for 6.9 for this would be great.
>
> z
>
> On Mon, Apr 8, 2024 at 1:46 PM Zack Rusin <zack.rusin@broadcom.com> wrote:
>> Sorry, apologies to everyone. By accident I replied off the list.
>> Redoing it now on the list. More below.
>>
>> On Mon, Apr 8, 2024 at 12:10 PM Christian König
>> <christian.koenig@amd.com> wrote:
>>> Am 08.04.24 um 18:04 schrieb Zack Rusin:
>>>> On Mon, Apr 8, 2024 at 11:59 AM Christian König
>>>> <christian.koenig@amd.com> wrote:
>>>>> Am 08.04.24 um 17:56 schrieb Zack Rusin:
>>>>>> Stop printing the TT memory decryption status info each time tt is created
>>>>>> and instead print it just once.
>>>>>>
>>>>>> Reduces the spam in the system logs when running guests with SEV enabled.
>>>>> Do we then really need this in the first place?
>>>> Thomas asked for it just to have an indication when those paths are
>>>> being used because they could potentially break things pretty bad. I
>>>> think it is useful knowing that those paths are hit (but only once).
>>>> It makes it pretty easy for me to tell whether bug reports with people
>>>> who report black screen can be answered with "the kernel needs to be
>>>> upgraded" ;)
>>> Sounds reasonable, but my expectation was rather that we would print
>>> something on the device level.
>>>
>>> If that's not feasible for whatever reason than printing it once works
>>> as well of course.
>> TBH, I think it's pretty convenient to have the drm_info in the TT
>> just to make sure that when drivers request use_dma_alloc on SEV
>> systems TT turns decryption on correctly, i.e. it's a nice sanity
>> check when reading the logs. But if you'd prefer it in the driver I
>> can move this logic there as well.
>>
>> z

