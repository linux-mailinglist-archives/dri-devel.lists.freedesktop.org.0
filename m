Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DE9747177
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 14:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5C810E156;
	Tue,  4 Jul 2023 12:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8349310E13A;
 Tue,  4 Jul 2023 12:34:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbL7lfsuX7iGGHkCNA8xP65UJe/IeX13o4DLqSRoWK6fH0dF2kAziiFxlLyMgpKwEl0uLGhYGQFBGcz2FjJ7/cNj1tSdyjnLWOZbSLgPJoih31sjHXoPZyrrIBCjOKpBcL9QQ0JBzns/hMOBOy2uRKdaYZLg6Dg2L1vOdkrfcDTFxEJHkIsOL8r67aM10ew1xy/1+cIcak30cnlxQq6DSRbzG2B7qoEv2p+iSA93RYXKOswzuGODyLfGYq3soS5M8ATekEIGbBJc1uNakbzlCtnXbLtwbCU9jznyk0/JCEcdo0lf+QiRjqfgP1y2abwwlaroWfaqNHv+rF70PZOPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QANYLM1LgXxuJcfCmiYCT3FTy/GGfdRhSgso4xlOxB0=;
 b=FwAO7TzSnm9XBi2YIU/I4STuqVwHhBI9/rNZ0nO2o4PKDgdgAPWzwGWW6E91QFXm2oB8Q/8X0F1SYS+hB9JBCvieVLWcum1N/Stu9Hz0EmN3k0U+IJwmfdVNXXKw6IB/ldmEUJmfrNJaEfJtYfTAXyA4en84BkyvNyB7PT7CdQUEqYQ/5suOdua22mLlKYS6E7SrbTQJBwKUf8o3lc5cWiHZhdoAhOpBhDFGqXS7HY7GmEW0LX4bm5PWvJnfnhDCXly6J+qA4gV/VGxaJIRQ4Bgf2r709wIActBZh/Y3eaj7uA+DlYzGuIb0lr70OgxjPT/uj9VQ/rgDIsChtjciFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QANYLM1LgXxuJcfCmiYCT3FTy/GGfdRhSgso4xlOxB0=;
 b=BwIELXNI82NEtIU8FyDYSJDgnn88iJIl0kryr8ACz+BN2VQ0aIA6xmU6s3nbMCO2EV1y+fA/uCms2BRtQKIdiezpR3yVtwY6aC70uE0KHHdWrus+4+JO61E9463o8fmeh5eA9ybvj+uO8MI8hgNjAKQvXWClvpeyl6a1jNGr9/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB5735.namprd12.prod.outlook.com (2603:10b6:510:1e2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 12:34:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6565.016; Tue, 4 Jul 2023
 12:34:04 +0000
Message-ID: <f1b190cb-3af7-178b-baeb-b59363868779@amd.com>
Date: Tue, 4 Jul 2023 14:33:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amdgpu: avoid integer overflow warning in
 amdgpu_device_resize_fb_bar()
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230703123557.3355657-1-arnd@kernel.org>
 <f4bc3739-3ff1-6fa7-5d7d-890f451315bf@amd.com>
 <788147c6-defd-496a-8174-1571b73d1a71@app.fastmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <788147c6-defd-496a-8174-1571b73d1a71@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB5735:EE_
X-MS-Office365-Filtering-Correlation-Id: c2672766-70b0-4028-9f6d-08db7c8af3b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sVvkdTB5s/QssHlTl2xZ8UOusZtWm/gTjXdUbTBz1xk3H1WlIt5b6WdqjMhmazq3/aQSy92LXVlTEVzwMmK1xP+shQFERa3zVP4Vx2tkrk5u5TRVLL81xDPXH09QkUn59ZX/n2/qd4wLz62DpwXBIpiYtKCURSFLKrKV8YzfzRI3wo034KqfQFTwREoZQ8WFX2k8UK4G8R56RP0WHx9Y1O4oOjFhtCnMN2z8tdtvQCL3xO8Sx5KSVhhbZJxOLrMCQWlK0Yr/2WO66XONzr/H1H+4g17nIb9g5AUZtcXuJ1Eb+h0heYkbILjlRMYjC56xqVs7cDodoQGAJVmWYXkIrTDYqjBfwfNaLR7Z5T9cxMQJzY2BkZyE+GQwdy8MhHzrLbZOuPda8282XHWZAKrnqGVqjOgIGmXND1vpJtklIMx6Jfn2hJg/xOGcWemrSJ5Rl/a/XfqtnXs6sQl/xmjX9LtRU3Cavo9TJD2xEbmszO/oF/1xcz5d6FB4IpJzyRH3rsM18KoFN7ioHxDBr0OCW7N9DLR+vquiu/SQSSXgA4p9iFFRqX/zrR3AIqbHYODm3iQLU3lRqS5l3POjDKs0fj9XEOUlA3VxxuhyyRp6i7E4bfIwdYmelaCDBcCVxZg/XbYInc4ThmX+6OdLnk1twA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199021)(4326008)(66574015)(31686004)(316002)(66946007)(66556008)(86362001)(186003)(6512007)(66476007)(6506007)(83380400001)(2616005)(31696002)(2906002)(6486002)(38100700002)(6666004)(5660300002)(478600001)(8676002)(110136005)(54906003)(8936002)(41300700001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEpjUlJPUGx1MTJFTklGeFNGUHZFOVBZODBtZFc1QjU2VnQwL2lMM1p6YzZr?=
 =?utf-8?B?WG9tSUV3Wm4rOUZUZWIzNFF3ckdjbW8wTjRnckFYS0ErT29LWktVa2dTN2py?=
 =?utf-8?B?MmNmcS8zaGVHYUJ4cGc0elFDSFkxRElUTDR1YzF0Z0FOaUJXLzdUVmpzWDhl?=
 =?utf-8?B?OXluVVVrcUNMMTBLUkJQQ24xZzN5Z0VDL1N2OVVIY0hiaUN3bXd1dWQ5TkxP?=
 =?utf-8?B?UXRRNWtpMmhIQXNLb1VMeFhXQ2pvWGJzM3hmazhQL2NtamVvaHBoQVZQZU4r?=
 =?utf-8?B?cGZibVhheTRDN3IrUXB1TnJlUE9XTEZ2UytLV3FpaEI2cWhINlQ4VUJodElF?=
 =?utf-8?B?Tmp1NTA3ZjVSOEV5WGRkSnRabHZHcDByU3RINWZCUjJoa1k5Z2Vla1pwakJm?=
 =?utf-8?B?dHMrdUl3c1FzdXRoVWR3cnBacVIweStKbnJSUlcrdjlpVXJHT25CVC9kd3hY?=
 =?utf-8?B?ejhINUduU1djV2hMNG1tNjFLNENLSjkwOGt0bm83YmNDeCt5cFJ3bzFWaktF?=
 =?utf-8?B?UTRPYi9BRUtRcjUrMTJGQzlVeTJabkhIL3F3azg3QVBEMVUvcWFUNnhpaFha?=
 =?utf-8?B?R21XN1k3TjdqaXRjY0hSNGpVZUpkOEVtZU41cTFMUXdUSzQ1d1JYT2JleUNY?=
 =?utf-8?B?RGd1aFY2eVJydTRyZEo4Q3MzTzZoZStNRmNFY1JXZ242WTdQdytJKzVHOHl5?=
 =?utf-8?B?R0t3Y1I4YzVsVTN0bTAvVllSMEk0SDA5U0c3eDFjT1llaGxjZmxCSFhlVlAv?=
 =?utf-8?B?MWRVUDhrNFl4Q0VYWitrV2kvcHBldXZyOHEzY1VhS1ZFcXJIbmQwU1pJMVVN?=
 =?utf-8?B?b1dZS1ZDYkEwaStjR1BYWXVGQkJvcDd0Sk9LZVA1dXhaUENwTHJpTTBvOUVW?=
 =?utf-8?B?cDVMY3hBVUZrZjNKL2Q1UTlzV0dzVGdsWjdNcFJHaC9QQ2s0TytEQkZjQ0pQ?=
 =?utf-8?B?Nkl6MHV2SnViRW9OeWwzNkxWVk1MVzFwM0J3bE1ZZ3BsL0JyLytsUGZra3hJ?=
 =?utf-8?B?TldCbGwvSngrRDI0TGVuTWdROUNPM3lyVTRhZVN1V3dCSzdRNU5uTllodXVJ?=
 =?utf-8?B?cXpGcU5tS1JsdXREa0hEeDI5UUFzbGZxNGpTbEJqcnFySzFPNHBDWGV4VUJ2?=
 =?utf-8?B?a3k2c1l0bmVrdGxYNWFwL09pOFNZU2VKN25xMkR3NGJZKzNod3MwUGhvVy9J?=
 =?utf-8?B?empkKzh0alEvdTBLRDJmUDBQQ01zMnJadHRUcS82aWwzeklHNXMxWVZWRC93?=
 =?utf-8?B?ekJpdDZLcGZuellDY3BOOU1oWEZLSWc3TW4vZGpiRjVZL01yaXhNWGpVOXRs?=
 =?utf-8?B?YjI4WVAyUktYY2dBdEVjTWtUczRPQXExMC9Uc3NBKzY2a0ZyaWhIRExCY2R2?=
 =?utf-8?B?R2tUaFFndkMzZFBZZllvUk9scUtkTFBjYVJBL3hNZ2RFZm1VN3NSNW5JMzZ0?=
 =?utf-8?B?Ykc0NXNPT0dSTVZZQUpBQ1RNVjFqMmtZLzZQWHZ1RE96SHZjVTl6YWRsZitT?=
 =?utf-8?B?cnRFeUdyMVJVUDgzek1VSGd3bmdTVmJMZ2J1Zjc0VlhYeUpjRWZXWjdMbUFP?=
 =?utf-8?B?dVdiZ2lyL29QKzd2SXNkd29kTlJXUHRRM0wrSCttNUpMRmNiVGZ3Q0VrdlJR?=
 =?utf-8?B?SmgwTmx1aVZrQkMrRDVRcEYwU09SWEZVcElmYW9HZWlDSVdybndqUWZPcjMv?=
 =?utf-8?B?MkFDdFpQd1NPRWJHRWZJSjk3OTBQWU8yb3NiajNHYk5vTDZRa1Y2akVSN3h5?=
 =?utf-8?B?amc2YlljYjhWYTBnTENjenRqcWJwbVdXRFl2VzZZZ3UyUHF0VjgwYWRBZGQv?=
 =?utf-8?B?eHFkdzU2ODFFWFcvWVZZT3RZYjFaZWgvRlAvSlZXaEFrczV5MmkyNGVMbWdi?=
 =?utf-8?B?SUtjZVZJcWdIeEVFN2pNWnA1TEh5cG5ZeXJ0V1VQYlB1dzVCZEx6WjNsd3VM?=
 =?utf-8?B?K043MHhEVFpHaXpENVNTbEJBTjVsam80aEd2NVBXZ0pEZDdLT2ZlL3BxVWNX?=
 =?utf-8?B?UElTK3NjU3l5MVZKSGJNUXQrK0VmNE9OK05HVkY1d1puSWRKcDRxeUc1ZGZk?=
 =?utf-8?B?L21FaUl2SVN0SVNvWVhDZDdDMFM5NmViWTRLbGhXdFg1VHNCMmRuTEk4V2Fl?=
 =?utf-8?B?VFhjb0pKd1lveUZWK2pTRU14WEliT3FmZjJ2UGtiMlpwMGxLK1NUZDI4clRS?=
 =?utf-8?Q?uLp3BMXLk68aj3R8u7egiVH69HAeGAwT7aGmV0yywtzn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2672766-70b0-4028-9f6d-08db7c8af3b5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 12:34:04.1375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsijI8iz5/aQflP/FJJWtPQs4/xUZ0yY2g9WA4GvlowNRmHzSf9rVs4EJE99gNhk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5735
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
Cc: amd-gfx@lists.freedesktop.org,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, dri-devel@lists.freedesktop.org,
 Lijo Lazar <lijo.lazar@amd.com>, linux-kernel@vger.kernel.org,
 Shiwu Zhang <shiwu.zhang@amd.com>, Le Ma <le.ma@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.07.23 um 14:24 schrieb Arnd Bergmann:
> On Tue, Jul 4, 2023, at 08:54, Christian König wrote:
>> Am 03.07.23 um 14:35 schrieb Arnd Bergmann:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> On 32-bit architectures comparing a resource against a value larger than
>>> U32_MAX can cause a warning:
>>>
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1344:18: error: result of comparison of constant 4294967296 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>>>                       res->start > 0x100000000ull)
>>>                       ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
>>>
>>> The compiler is right that this cannot happen in this configuration, which
>>> is ok, so just add a cast to shut up the warning.
>> Well it doesn't make sense to compile that driver on systems with only
>> 32bit phys_addr_t in the first place.
> Not sure I understand the specific requirement. Do you mean the entire
> amdgpu driver requires 64-bit BAR addressing, or just the bits that
> resize the BARs?

Well a bit of both.

Modern AMD GPUs have 16GiB of local memory (VRAM), making those 
accessible to a CPU which can only handle 32bit addresses by resizing 
the BAR is impossible to begin with.

But going a step further even without resizing it is pretty hard to get 
that hardware working on such an architecture.

>> It might be cleaner to just not build the whole driver on such systems
>> or at least leave out this function.
> How about this version? This also addresses the build failure, but
> I don't know if this makes any sense:
>
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1325,6 +1325,9 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
>          u16 cmd;
>          int r;
>   
> +       if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
> +               return 0;
> +

Yes, if that suppresses the warning as well then that makes perfect 
sense to me.

Regards,
Christian.

>          /* Bypass for VF */
>          if (amdgpu_sriov_vf(adev))
>                  return 0;
>
>       Arnd

