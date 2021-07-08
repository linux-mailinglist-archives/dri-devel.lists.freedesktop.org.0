Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872B63BF89B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 12:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83D36E1D3;
	Thu,  8 Jul 2021 10:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771746E1D3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 10:56:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9e/aW0UMTnZaqzGyZnpYOEpqZey0IYkbei5hGHvCcXjyhkfS39Dhnr/1nuumc3HyzMFMBbClcoChz4AEp9mx/nVS+IPKs0a3GhdbyXQ50xbfyg+IOEp6sVDEVcVhd14ep1QCdOS6eFniAxOGq/iJAPVgKD+MQYk+6tQs78pdYX5sU3kyaHMZI+WOCndfS2IuAhmc3RNsuaqwvq7gFdIEjbvirZ7BhwIGpzkLAt0pUWBPttv2BTTwfvepm3fJES2ZC0IKCmv5zr8lopgtseEJE8VmrtAFYN5s1HDbzR873agVfU3Iou8reKCoHX0pltuOtUJu1DTPdd1+oSfnBOzeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JipKiOhQfalwtSJDAOYoO0mXAOSUty2tWe1kIE0I7+8=;
 b=gp6VLPpVORecFP21lggVg0k+0IJA6i70x4MVWy9vAEj01lBpvLuSdUoq1l4NDwOIGbc3Fc6HczKTlTrzqlHjoUvUHI9ayUaQnRQsVfY9Rqx+Q2UjdAchJZbgjCrLnCwJtvu/HQpXWxUlZh49HjEt0xLv1P92eVSJ+6uW/TKz9guJl9q0Q1xTff/840PfJXLZQFAePHAX9aXfAJni4lwNM/T+nPASZPPASrIekXeePXik5cayp1n6LXWcDSD1LT6OG6LvO0IvyoC3MSChsO99mbX/v4IhqebR/jZWFlD/Wv/uCsbloIaPqzXMd395y00ne8oedKSjxLJs40IHjCoShw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JipKiOhQfalwtSJDAOYoO0mXAOSUty2tWe1kIE0I7+8=;
 b=tAdA8tAVcd7+G71UuNbsnBdTZ1o7JKotsgHvo1EH1GtuQ76GDyGUUeKKitTEESc9Fvi17ynY+/vFlNsezeM5zoMmDeCf4d24ktYfDXg4oqbgmblZHkY5kaBFiDaOrPTuEGH/VJ+AaG6eA/cPpA01+z8trfPsGMORGMuCszow+NE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4320.namprd12.prod.outlook.com (2603:10b6:208:15f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 10:56:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 10:56:24 +0000
Subject: Re: [PATCH] gpu: ttm: fix GPF in ttm_bo_release
To: Pavel Skripkin <paskripkin@gmail.com>, ray.huang@amd.com, airlied@linux.ie
References: <20210707185108.3798-1-paskripkin@gmail.com>
 <f4bb7b29-3abc-a056-fc24-4e91b5de8d74@amd.com>
 <20210708113701.4cea7989@gmail.com> <20210708130910.63a15c73@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <55aa8ece-1f1d-76d0-4f2f-951d39e79484@amd.com>
Date: Thu, 8 Jul 2021 12:56:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708130910.63a15c73@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:bc19:c1e3:6307:7e3e]
 (2a02:908:1252:fb60:bc19:c1e3:6307:7e3e) by
 FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.11 via Frontend Transport; Thu, 8 Jul 2021 10:56:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6999aa2d-6375-4577-0123-08d941ff06f0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4320:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43207F2CE75E1EC9980D19ED83199@MN2PR12MB4320.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SkwqpgxAHebK9OGjgMjo3XHGPCtm5BImi8TzwQfaUTN6Gi+4bHNURIOJj8J2oVVXzpub0FKf21i6I3Ppy4RrzYbH4y04dk348UY5diB0cFSiVUuOa8DbyaDYp6d1pgNXY42/QsNao5tPpv+8vC/2TdzwtciU9bHi6dhoY0ZP+P+HXenVRYtC0D9YlVDSPYvOrsK4FnjQ1rgpcwFx6NzqAlPo28qNii4GGpYXhnQ+v00ZMS09686PQ15bT+bEC5d1rAo9ZkjiCyRGzUVb4/ejhD5vpxMbZbDVVmmnfetNKCqJ27iQD3Zxqub7/shSrSng+vNi3VgYQAqazaAVu3REqs4XeHQ9BMPCNhA+miQhtPyBFwyKboEViE8XX0J4P58LqfG1pzUvdCrS4UgJ0ld+56OcRT0cxf27boPjmCePqrD2svSNFIB2NOjdgJhL0+kfwLZEYUTuVHN0qtLtB6ruup6eDiAM9dRCFF/O84zTWNQI0LZQF5qHTs2hcUyuTEw/ODHCnk8MUSi0ihuOfC6AFkq5m9+Lehoc33hVdkv5D1QTHjyPv204b9kqMx8X2rGLNF+9NNjOmYfKkDOpZutn59IfJGq254LUuUF2Ow+AQlQhoBqcBaSHrUjn1kFI4faDwk2fdDPscTTKOY5Obx39YMR37STym2rmfUlLNfCSPNkYQU3e/A1XpuozbQCTRlvBcxHT79BuK8X6HYGVmhawW9QpJxc1jvcF6S77pj35fJGKdGhnpNevGPHat9ex43WE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(346002)(136003)(366004)(376002)(478600001)(2906002)(38100700002)(86362001)(186003)(83380400001)(36756003)(2616005)(31686004)(6666004)(8676002)(66476007)(66946007)(31696002)(4326008)(316002)(66556008)(5660300002)(66574015)(6486002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzdNNlNuaFl0NUdkUTV2VXVpdjRTRysxVUVnbVRuL1pUcGhRYW9FSGp2VXNr?=
 =?utf-8?B?K1ZTcDZXZ2xVUkFDUUJaUkV6MHE3ZFVyVGZ6TmQ4THNBMi9Pc0NNREUrVCtm?=
 =?utf-8?B?OTdUbDZPUjhCMXl2Q0tMVWpPdEFDd0Q2QUdxcURjOTQ2elpLREthbXhqQlZh?=
 =?utf-8?B?bTlmOW0zNXBCQkZ2dHNrMVp2dnkwVFYrUDRmOHNhL1JPYVEzaEhuLzYzZWFN?=
 =?utf-8?B?TjAwaDNtZTQ0bXlyRjhiaEhUdVpiNTZ6bWZhQmlpWE5LVlhUL3VuS29ydUpl?=
 =?utf-8?B?ZFVmNWZPa3VsY3UvKzlJOHhqOXdUcmxkdDhWVkx0enJicThjdUREb1RYeG5h?=
 =?utf-8?B?QmVCakFaMURMQ0VkVnFmSDV0bFhJUUp0eHlvaWRWK0xMUVJXYktUd3B2MjJZ?=
 =?utf-8?B?OU9hZEFlYlkzT1dmTnNPZ3RKTXI2MmswSEJqT2JqN0cxOGVXQi9IcG04SEQw?=
 =?utf-8?B?SUovbFlndkwxaG5EcURJeDJpR3BYa2REeHZLNVMrU1ExMXR2ckZzSUlUYUps?=
 =?utf-8?B?d1N5K2xjcWhnT2RMSnlTYWlHUzdsQUp5a3ZMOXFxbFpWdVUvVGNvMTdjZERQ?=
 =?utf-8?B?anNKR2xJSTFoUUh0ME5ERnkxbUk2R3pybWE0dllSdmtqR3ZnV2JXRVI1ZUR1?=
 =?utf-8?B?RS9lWm10ZzRicE1na2RsNDNteGF1V01ONWx2d2hCNFNlOGUvVWJmZUJMRXps?=
 =?utf-8?B?eG4yb0N5SDFmZkI1NFFTTDRIVzd6azlCNHZZS0xZNzR1R0N3WVNocE5Db09D?=
 =?utf-8?B?Z1ZiK3dKQ1RUcEhNUjhucjViT3owdmg1dThKMzIyUGswUytLcXBZSW5HVDVM?=
 =?utf-8?B?WTFiYmFhNlZQeHUzUVFydlZHeS8ySGxzNEhnbWZyRVhkSDMyWUNPUUI4ZndI?=
 =?utf-8?B?MmJCVXRFZEF2MHlQVHF1RHpLRXdUSWJEU0x6SDRHYVIzdzhtMnZqcEZPSTVi?=
 =?utf-8?B?RGlYS1VZcHMrYk5hUmpnOElBMjdoeGFTdktDZWxoeTJaSjhTZDBOQmhkZ3k5?=
 =?utf-8?B?ZlpSa1NVVm5zMDlRMm9uaHd2VlBEcC9vdFpKNFdUMnI0UEt3Rk12Rlcwc3dJ?=
 =?utf-8?B?VnQzS0I5bEhYZFkzdDE1VlhCUDlHMmd0YVZPUFdwcTAzSWI0NzVrRVlKZlYv?=
 =?utf-8?B?WVo0Z1podnllbkhMQk5Vb0FEdnRWbzIzQ2wzemZuOFN3bmxpR1NoT2Q2bExE?=
 =?utf-8?B?d0ROaWxZM3BsWlBHU1V6ZWdabVk3N3hFejJEQytkVm4xcXBVTkFUNytSam5q?=
 =?utf-8?B?SlIzZnArVjdsbmdZK2lOT0x2QUsxd2NteDdla0h4SWJWRXdUd1laaENFY0Ra?=
 =?utf-8?B?STB2SG1ONHFqRkRNSEFaMSsyWEs2R2VuQU9XRVR5dmRzTytwT0F3bmhiR25S?=
 =?utf-8?B?OWJyalJoNXFncmNwUkQxWFQvSEtaNlp0bGo0end3Uy83TU9HQUEyWXpmTTlF?=
 =?utf-8?B?Z3hiY1p4WXc1Vk95ZVFFdDNydm9KZ1JydjJHTGlSQ1JmMEFDdWJiUTQwT3Jh?=
 =?utf-8?B?U2JUYUU3YndsdEJ6cEd1aXFLMVMwbmJRWGI1SThHMkxPUGtKMmw0UlMyL0Nw?=
 =?utf-8?B?OFoxa0E3R0IyTG41QTlyMzBpUXJ6SEU4VGpjK21XcjlyUG9BK2psWUNZZGk5?=
 =?utf-8?B?aVhjd1dSaTBHNmd3bjlRekQrQXFJUWcvU21XeGFtWURBVGZ3RXd5bER2N2lE?=
 =?utf-8?B?OXNBaWZ4ZlRheklDQ0JIb0NzY0gyNDVva3BhSkZCZDVCQ3BkQ1M1SGtXWVR0?=
 =?utf-8?B?L1ViRk5ZRW0yYlhVbXgrZ3hDZ3dJNGxaMU53blY3NWRGaEdlYVFJZGtoRDJo?=
 =?utf-8?B?RVh3RzFhemc1NldUdU5OdS9wL0ROejM2Zi9FMGRBVFQ2TG0yLzVVcTE5dmVD?=
 =?utf-8?Q?09rjNWWuEnc8e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6999aa2d-6375-4577-0123-08d941ff06f0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 10:56:24.0153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNTYJCdNTcrFwXQK/tutRgv1iKO6acTomEPfangjWddOrW8iF5iLfn1XQmDqHnur
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4320
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.07.21 um 12:09 schrieb Pavel Skripkin:
> On Thu, 8 Jul 2021 11:37:01 +0300
> Pavel Skripkin <paskripkin@gmail.com> wrote:
>
>> On Thu, 8 Jul 2021 08:49:48 +0200
>> Christian König <christian.koenig@amd.com> wrote:
>>
>>> Am 07.07.21 um 20:51 schrieb Pavel Skripkin:
>>>> My local syzbot instance hit GPF in ttm_bo_release().
>>>> Unfortunately, syzbot didn't produce a reproducer for this, but I
>>>> found out possible scenario:
>>>>
>>>> drm_gem_vram_create()            <-- drm_gem_vram_object kzalloced
>>>> 				     (bo embedded in this object)
>>>>     ttm_bo_init()
>>>>       ttm_bo_init_reserved()
>>>>         ttm_resource_alloc()
>>>>           man->func->alloc()       <-- allocation failure
>>>>         ttm_bo_put()
>>>> 	ttm_bo_release()
>>>> 	  ttm_mem_io_free()      <-- bo->resource == NULL passed
>>>> 				     as second argument
>>>> 	     *GPF*
>>>>
>>>> So, I've added check in ttm_bo_release() to avoid passing
>>>> NULL as second argument to ttm_mem_io_free().
>> Hi, Christian!
>>
>> Thank you for quick feedback :)
>>
>>> There is another ocassion of this a bit down before we call
>>> ttm_bo_move_to_lru_tail() apart from that good catch.
>>>
>> Did you mean, that ttm_bo_move_to_lru_tail() should have NULL check
>> too?

Yes, exactly that.

>>   I checked it's realization, and, I think, NULL check is necessary
>> there, since mem pointer is dereferenced w/o any checking
>>
>>> But I'm wondering if we should make the functions NULL save instead
>>> of the external check.
>>>
>> I tried to find more possible scenarios of GPF in ttm_bo_release(),
>> but I didn't find one. But, yes, moving NULL check inside
>> ttm_mem_io_free() is more general approach and it will defend this
>> function from GPFs in the future.
>>
>>
>>
>> With regards,
>> Pavel Skripkin
>>
> I misclicked and sent this email to Christian privately :(
>
> Added all thread participants back, sorry.

No problem.

Do you want to update your patch or should I take care of this?

Thanks,
Christian.

>
>
>
> With regards,
> Pavel Skripkin

