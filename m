Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF8F4679E4
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 16:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF55D72C3E;
	Fri,  3 Dec 2021 15:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68E56FFB2;
 Fri,  3 Dec 2021 15:00:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7VOqfEP4bWkA/ZcLThAXC3y09IsgzOcKugo+NNQAZ3FQVX75rMuFcOa+1S6XY9M7gPaGQtuLZhf7fWo4rOOVBFeeGaVGYOr6gSmtb0KdQerEpUVSwkhFYwXI5AtTNGXF9LtaFtExpPiEhdS91Ub6mM+rFKaCPeRzADcpkg4wGZ0NKHWSQL5OUiVFEAKSCPs2c94PZyskMJtgGQdXcn7Eo5iP32iANy0rRX4LTEG8RPxN3ZAraKaTUxBF4amE1EkuM1K+vDIDDpdrCh+lhynnfuY5Kt4r/R6HVuxIv5zqJMDtCG8bWBXSnXXC/xp9l//nsLSMFV0z0oSP1In+Pdt9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4y58UkD+S9gbK/BlC4+sQ5vKWpZPB4VdHih/3gYXbA=;
 b=ZJQz2MYFdf8onyAsoh0TDP4AxC1KUhNXuEu4A0Xk+VasIobkbgV8wjfBOKE4jOMoEVA4gCIz5ozun3lFQck8I3GHiBNEHvQjBZr2OZ63Mt/AQeJzucuJ80x0GX11tkNDWlTXvf2bCaXxGMXDOeZ4CFMvfujEhTau9uTFkxSpIKda9gbhwmq3izZ17KR7HXPAwhqqfASPawuRxYu8u/Zqz9lC6tlsL3RwbZRFoCch9rneMRKYEqPCnM+UK0bS9L7weGd07QkkllwuE53AwLcgi3afdSqQrtNkIKzALMRt4aWPMeCmoIJ5btSBSK/17YJJUNPt+VJ0464X5x8UP4gzBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4y58UkD+S9gbK/BlC4+sQ5vKWpZPB4VdHih/3gYXbA=;
 b=AIvAcBk53f0SWfCNeDMuxuQzpKdOc0BuHZL2vbKJnB7jRc3IZnViko8LHaWvSXUdIhvl2TRwfYnd4c75EXRgJKC4YWlYJbYiFYR4Isk0ATpaSAh+Ag6n/Xixd6UaOTk7g163qX12iqAr7H46/NVp4kBBWp8qOsSdTNoP5onpGN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1773.namprd12.prod.outlook.com
 (2603:10b6:300:10d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 15:00:18 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 15:00:18 +0000
Subject: Re: [Linaro-mm-sig] [RFC PATCH 1/2] dma-fence: Avoid establishing a
 locking order between fence classes
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
References: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
 <2551da4d-2e51-cc24-7d4a-84ae00a1547c@amd.com>
 <29d096c91d720fbe5d410124580a02b663155b56.camel@linux.intel.com>
 <250a8e47-2093-1a98-3859-0204ec4e60e6@amd.com>
 <712b54fa1c09ae5cc1d75739ad8a7286f1dae8db.camel@linux.intel.com>
 <49cf2d43-9a8a-7738-0889-7e16b0256249@linux.intel.com>
 <193e36bd-ba64-1358-8178-73ee3afc3c41@amd.com>
 <c9109ec6-4265-ba8f-238f-4c793d076825@shipmail.org>
 <d1ada94c-88d3-d34d-9c51-0d427c3aca06@amd.com>
 <7ef3db03-8ae2-d886-2c39-36f661cac9a6@shipmail.org>
 <4805074d-7039-3eaf-eb5d-5797278b7f31@amd.com>
 <94435e0e-01db-5ae4-e424-64f73a09199f@shipmail.org>
 <a4df4d5f-ea74-8725-aca9-d0edae986e5c@amd.com>
 <fb9f50e2-aeba-6138-0cc0-aed252dc876d@shipmail.org>
 <8a7dbf22-727d-c1ec-1d3f-75e23394fee8@amd.com>
 <d4a9cb5a554ffc3af3d30ecacad6e57533eb7f3b.camel@linux.intel.com>
 <f8f1500c-170d-ccf9-ac2d-1484bbdc587e@amd.com>
 <96eca78d-2b92-cce0-0aee-2d5f72c26bdf@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4d3c9eb5-f093-84c9-47da-ee27630ee646@amd.com>
Date: Fri, 3 Dec 2021 16:00:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <96eca78d-2b92-cce0-0aee-2d5f72c26bdf@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:4e4f:2719:8872:ca0c]
 (2a02:908:1252:fb60:4e4f:2719:8872:ca0c) by
 FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 3 Dec 2021 15:00:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4281a39-0da4-468b-70ce-08d9b66d9e8b
X-MS-TrafficTypeDiagnostic: MWHPR12MB1773:
X-Microsoft-Antispam-PRVS: <MWHPR12MB17738D7965DBBF0B3CFA8DA0836A9@MWHPR12MB1773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zZdND2TRBoKAMTh8vRuuY8Eao97rDIJErZovXaijwPzzuTXNX9uW6N0j+wzEX4aEYSuDSOp9YQUWsoaz6IcNsnFN9Jmg+toLfvKCgFfCa5jVxXDj2UH35dXgkoCmoF5FI0Dvg/RO0CkE3WHzOmPw6bbFWdNz86ZIqJaJaz7OUU431GH6u6ZZ5YvdzyvA27pkcOZEWeTqBjjaj4jt67RpxdUkvMWdfeUyq9hVydL822dHnDwdoaAeajv2CWx+txVpE+tcwxpACK2QcXLA7VC+QfSbjW0Uui4r7dVvwk/hvmbAHX3S5hZ2qL6+cB0XKct+iCsUxDWa7z3vs/LAesRscny+57pBezgLxel6xB48qc+SEGpjsRJqbXlw4Ehf5ZGrSdbgz/trZHxTb0vn5iaaz5esf9gPwhSr1O6jlG4wVrCUAlBzGFG1b7JZ3MPnUATI2w5hgHh1kddcNYZCV0bJrHIva0Cw448kSbWbKDWwK1gx8si9BodQHCbBrTyYfCV39Zwuq638xjAGHIslx/eVYCnryjqAscpViGvuhQ61OpEm4zr1wZfic7bqCm4XHdaX6UyIV2+hGEq4H1Wl6nhd2gSwDkdsev5ZuclOhtSI62qkP/HXxiiTK/xsDmV5rkROEyEfoPqnvR1frQUv2L2BS7zWn/6URoomCKiFwckrYh49E1nXLEU8alAKUx3140IVhNmRMVYr5Hlr2wTqa34g+VFX5SLm2vgV1Potw+D3ik9+cEd33TPsuqL8/LX98xrC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(86362001)(6486002)(36756003)(110136005)(2616005)(66556008)(4326008)(66574015)(66476007)(8936002)(508600001)(38100700002)(8676002)(31696002)(53546011)(316002)(5660300002)(6666004)(66946007)(31686004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVdIN3l3Mmo4TnZLTG5DeDRlQ08zTTF5VXJ4V0kxTU9DV1dGOHdjY0hqNWRp?=
 =?utf-8?B?R1ZoWEgyclU5UXZ3V2Zqa1JVNndnNEQwbDRVQmt2OGRwMnZVYktPR3V4eE5C?=
 =?utf-8?B?UjU5SGdnaEdlS1ZzdXhubEZIL2RmY1ZYbXc3QnVKejR1UmFveGYrNE1RVVRZ?=
 =?utf-8?B?NG96dEV1c3pGRTZjR2ZkM3Q3NEFyUXBLQllzS0crR2ViRHVZYkVWK2UwOHB6?=
 =?utf-8?B?c1FFa0hqYkhnQ0J5QUNCRU5SNThHL01XeVZ3RzV4V0FsQW1yVzAva0FxNGNU?=
 =?utf-8?B?YUt0a3ArUjZBTXR3TlFGVVlZNWxuSngxd0tPU2lsdGdUYm9nV1FtR2traVdT?=
 =?utf-8?B?aEg5MXZiakgxV01yTE0veTFORTNURG5Ba0l6WEE2RE11TGpkWHY2V29YN2JL?=
 =?utf-8?B?MVdqY2lDNkVuV2Z4Rzl2bzF1dFB2bHhlYlc2M2MxZ1dqN0N0SkN0YXIxb2VO?=
 =?utf-8?B?UHNwcTQrRXJBWmlRQ1lqbDNXZEc0UkRVVHlIZElhZjJCWTlyUndxQjljbXRU?=
 =?utf-8?B?SDdXeDZIT1ExdXNCaXAwS2ZML3diNVdZSCtKYko1MUU5b3ZKY2dKY0IrK0dP?=
 =?utf-8?B?U1AzY3JQNnZoWktuZWdDZm5PYnJjVDhNRk8zV1MxeUpDbFg3bi9LZWtZaS9T?=
 =?utf-8?B?eDBpcWF2K2pQS3NrRlhoRXB4TVMwYjM4eklEVXZ2RkRNeUNTRVhSNFFWUmU5?=
 =?utf-8?B?NG9LT2lsU1VGcSt4OHVkWnowVkpMRUJMbFFYOEpudnEyZGxQNEhKaW1iWThn?=
 =?utf-8?B?M1VpTXdzdU9sWDFsSUlFNEhQNjdXajZIbzRGUENWMFhOd2JtdGR2dUdPWndh?=
 =?utf-8?B?R1czd29rTkoxSFF6QXZUNzhFbm9Cc2JBQlZ3WUc3UHF0YXlhN3ZxaTk4Vkt2?=
 =?utf-8?B?L0h6eDR1M1NrUGVyb0o2NmlHRHg4bEhDMFRXUGxtUEtxa0hBVUtsMThKN0ZH?=
 =?utf-8?B?K3d5bnlBZXE5WkY0YzcwL25ieG9SVjVPMC8zT3pvakxzck02Q2oyUlVRRmpH?=
 =?utf-8?B?M2Y4ZmFheG9pd20wdGdLa2RabkNscUhrMkN0N0VhWGJQc25ld29kU2RkNXQ2?=
 =?utf-8?B?L21sVlRsZmxYTmZTM21RMmRVd2VQaEw5TnF6RkwxN3hTcE1uUm92YjZzemFl?=
 =?utf-8?B?T24zOFdPWTRuNHBoYTcwcllvQ2xIelNUbXl3T3lJNTFrUmxkTVVWRXJtTWtU?=
 =?utf-8?B?c0cvRjhqV1VrMXFJQVh4U04zTFhUZkFaUUxTVUs5a2VSU28xeDZwTmt1aVN2?=
 =?utf-8?B?SEJZaS9iUml2ZktUUVRFcGc5cHlMMzNNa28xbWRhcnZZSEJmQ1pIVG53V3gv?=
 =?utf-8?B?Z2JQOUVrOVJ0am9BbCtta0VkRkIvai83a0dMSDIvbnlCeUdRaG5UbzBBK1lr?=
 =?utf-8?B?OE95dWduUXpMSDNsVHVPWWV4NXF2MGlFMUJ2Ui9vWUJGa2pjbGU4eENKeUxH?=
 =?utf-8?B?ejJ4Y0xBMHE4T1RGakxWcG5YT2RyZVVOcUg5NlhXQjl6V3JHcjNiUkprekpE?=
 =?utf-8?B?N1JXSTljcUIyVzVHT3JRbC9XQ0YxdG9SL2FzVEtoRUZ0RXdkU2orbGwrcWg2?=
 =?utf-8?B?NkdhUThEWkRqQ2MwekxETkhvTmx0ck1VdnFqd2tBemx6dFoweDViQjlBcmxp?=
 =?utf-8?B?RS9RSU9HNlVrUUtYTHplQmNiQzNOWmZkY0RaQ0FDTHhyU2g3UjhMTjR2M2tZ?=
 =?utf-8?B?d1NnZ2QvQ05OelVJaldDeTRhc1lqRkxvbVhvdGpCbFNIYms1eTlUNmRRMmRP?=
 =?utf-8?B?QkQxYmhQOE1ydURKNmgzNGRxZDBOaXNHY0lxQzF4cUNjZ1lTaGI0VXdPK0VR?=
 =?utf-8?B?VThFcGdGNWZ3elZIbFh6Ylh0ekszcnUxUlU0aHUxL2xiakg4ZzdnWm1DU2dW?=
 =?utf-8?B?ak1OVVFOc25NblBrdWxGb0d0Vk5OcXkvcFVuaUNvZjVId0c1K3VteFYzZC9D?=
 =?utf-8?B?UzNjYjNaM3B5c0pPS210aENNaXVUZHY1ZzNXZHZySC9ZWmVHc1pWbDhFNkYx?=
 =?utf-8?B?Z2xGZEtYbE9VY2xRK3lCT3gxcHhRLzdDSHE2bzhoQWhDWmUrMXQrRnlnQUl3?=
 =?utf-8?B?bTJZVi9RK3JaSXEyeW5DZWNxNU1yYWU1bHBsSDNpL1A0RERhbkRrbzB3T0g5?=
 =?utf-8?B?S20yVkVHa0tsMUN4VzMxVlZPdXREZ1JyYU5FOHJMQ1JsY3JKaHpXUlNMMkFS?=
 =?utf-8?Q?rL+b4TOFmL8lAgMVz5Sxlps=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4281a39-0da4-468b-70ce-08d9b66d9e8b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 15:00:17.8624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSeHGz27xaq2cYlI+twCKCnFLzYNgbx7xaXll3mBJVQ9QGR93B3xyYSHnRrtQfxA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1773
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
Cc: linaro-mm-sig@lists.linaro.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.12.21 um 15:50 schrieb Thomas Hellström:
>
> On 12/3/21 15:26, Christian König wrote:
>> [Adding Daniel here as well]
>>
>> Am 03.12.21 um 15:18 schrieb Thomas Hellström:
>>> [SNIP]
>>>> Well that's ok as well. My question is why does this single dma_fence
>>>> then shows up in the dma_fence_chain representing the whole
>>>> migration?
>>> What we'd like to happen during eviction is that we
>>>
>>> 1) await any exclusive- or moving fences, then schedule the migration
>>> blit. The blit manages its own GPU ptes. Results in a single fence.
>>> 2) Schedule unbind of any gpu vmas, resulting possibly in multiple
>>> fences.
>>> 3) Most but not all of the remaining resv shared fences will have been
>>> finished in 2) We can't easily tell which so we have a couple of shared
>>> fences left.
>>
>> Stop, wait a second here. We are going a bit in circles.
>>
>> Before you migrate a buffer, you *MUST* wait for all shared fences to 
>> complete. This is documented mandatory DMA-buf behavior.
>>
>> Daniel and I have discussed that quite extensively in the last few 
>> month.
>>
>> So how does it come that you do the blit before all shared fences are 
>> completed?
>
> Well we don't currently but wanted to... (I haven't consulted Daniel 
> in the matter, tbh).
>
> I was under the impression that all writes would add an exclusive 
> fence to the dma_resv.

Yes that's correct. I'm working on to have more than one write fence, 
but that is currently under review.

> If that's not the case or this is otherwise against the mandatory 
> DMA-buf bevhavior, we can certainly keep that part as is and that 
> would eliminate 3).

Ah, now that somewhat starts to make sense.

So your blit only waits for the writes to finish before starting the 
blit. Yes that's legal as long as you don't change the original content 
with the blit.

But don't you then need to wait for both reads and writes before you 
unmap the VMAs?

Anyway the good news is your problem totally goes away with the DMA-resv 
rework I've already send out. Basically it is now possible to have more 
than one fence in the DMA-resv object for migrations and all existing 
fences are kept around until they are finished.

Regards,
Christian.

>
> /Thomas
>

