Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6066B545DFB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 10:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDA0113B89;
	Fri, 10 Jun 2022 08:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2080.outbound.protection.outlook.com [40.107.95.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D78C112641
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 08:00:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6fr+IeA4R0JGT0maH6xahzHEvERRRC9f2/2nKoYfwjR2ZjbgsDh/K1Oef/07d4/TnhxQDY3TXg7L8QqyiczO+uiWVbm/i/SEYnye7khKGMBqVVrR7gFb6mjtj50B+2z7zsBfsnlF0ThHR2CPiS2smwI1sCg1DKUXQo4ImCnuloA86vrF8vvU69C9j+S4Vg5G8PxzR3K0+ZcRz1uyZZgmga+ulDeumL12B+fatosN9OGEDba2DPbEv8SYz+LUFWPwB79dKGD34c/CRLzQowvMk1nygqzCDw9Lq/ptSqMOLcy34iX6dbG053J7koeA25Yi7lvt0Uw1xjeu8YR928q1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQqB3hSmmvM/nSx0QFf6VMxeRm+PoWFfJTZAJ5R/mRw=;
 b=Zrka/HYipOtV3YKPujprhgbsDtoJhojrkylAEHS443tcDAsqMjS7GVhMNNEhrf4N8ynphslXMqGfG3B30P6DujVBxGXXHOBEHIcJr8tWfXohPZxmmzLkIf7P/qSMgSkmiuRWru/XRVusjIz+R2ZAr/UncVZv0rc+aibskJowTT9y2Bnb55N1rHGnLCAzipn4FWMbGDeaY0WVKpc3wvJXiuh3U6SUzDEd8ifNfZS17WkJNHDZEhpUEEyM1IPEobaQeMFWuC2icBCkJMjbd/w/NfM7SshSLyc5NlGt4gTautIOnF5NWE0VnMvs55sB0ZedUWBzW5FWzpv/kQbLfA/tdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQqB3hSmmvM/nSx0QFf6VMxeRm+PoWFfJTZAJ5R/mRw=;
 b=rhKgMR8h1bLD6+86bc3LyIdUbu3TZp+LzVnCbrh7O4u9tz/IGnf5xSuiBOwbq0CofJOAmfAlSEjstwFKCLrMh2ol7xV8rlKhxvwXeJJbODFCrxV17KAGxREAg1NFUSJYMCLdXua57VeDI4tOAKuFCzjJcU4x6UUE7Pu8MZdEvOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4433.namprd12.prod.outlook.com (2603:10b6:5:2a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 08:00:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 08:00:05 +0000
Message-ID: <9122ec2e-8729-0542-22e1-98a81fe3f3f2@amd.com>
Date: Fri, 10 Jun 2022 10:00:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dma-buf: Don't use typeof in va_arg
Content-Language: en-US
To: Jiabing Wan <wanjiabing@vivo.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220610072019.3075023-1-wanjiabing@vivo.com>
 <c079243c-9084-b565-2320-20453815c79a@amd.com>
 <7a689b6c-31b7-61d2-7bf4-6fdf49bb4ae4@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <7a689b6c-31b7-61d2-7bf4-6fdf49bb4ae4@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed65c17f-5a01-43ac-f174-08da4ab73ab5
X-MS-TrafficTypeDiagnostic: DM6PR12MB4433:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4433C16F8A718D0B2D3314D383A69@DM6PR12MB4433.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0s2vRWqYID4lslURdjbQAFtpFXCbRslHngPVC3XKkhQND9VCvktL0Fjk4gQ4++lGG9XTN7FIJrDNTVKIpa6k/ZmRHViTZQ44fwrTayvyX+9LiRLa62UsMO7vjYGirxqdLHLDceBYZoO/nzV8HMncIw1zxfv4ED3Pb0jNWYgv+Y2GU6m2OuBi3hAZXLq4UBKve9zqoftDgW7GMzVOUAYY1FcTzxbXSW1oCVdWuVZsRqqbBe1DbEks/Avvs/rFRQMyIebfK7TWjNUVGRBxp2otHbi2VS+XLTEwHHfMPOV9hw8/73Z6SYXFtXyGCUjT8UHDHuy23meFCgBdpJcNTU0ECkpVaABl13rw2WReQeCIW9dNrvVeDvDmLeIWc1qngGrYQO7tGC7jzg4x1Xhtv0GAIwIZbOqDr2kQobfNfaEufR4vJ02phIMlkK9okDgrS639Kgr3MZKFHnbAEtwBCZjH49drNqxcKDqLWPAAt3CBA7u5ILxazsLVtXqrq1jg2dx3qOtWytZZ7G1ew0I2MH6tUKV5VsStv0aK06r1b3bE83ybHbh9wQscw4M7NkSeNMafqjM1afmKhszCWh509vyCVDHSnOLfAbCn6av9LEJBhvK3+Gc9XPxHM6ZiqeznEM/WW/aCUEa/2zJRLuFTXgCsMzkKIzKQ3j+fqf8slxbbdvubgKJjq5pD4Hxyogg9GY3rOGIPdUndpmjCtGYUPzPgqPbgNelifvvaHpjxan0QntBQ+KiHMWvz2+KlSuyW2v/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(66574015)(53546011)(6506007)(5660300002)(66476007)(8676002)(31686004)(66946007)(66556008)(186003)(38100700002)(8936002)(36756003)(2616005)(2906002)(31696002)(83380400001)(6512007)(6486002)(6666004)(316002)(86362001)(110136005)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2tIbXh1a1gxeHhDOW9DMG1NVzc4N1BOcHdjd0p1RzRJTWJ3M09SMGxxSVlj?=
 =?utf-8?B?T3ZuVjJ4SzFPRGhTcStadEN0WGdoTjgyMFpvZHA4WU96ZzVmdnI2RC83Q0tG?=
 =?utf-8?B?NjRhVFRoR3BxTm12cGtxU1ZaMlUwd09lU29TNDRnU2FGZnhrUEtCVWFndjVD?=
 =?utf-8?B?VjI5L1laYjJHVlhQbVdrTjV3UDhTWGZQVU9ucnh6T2RkRGRKV1dTRXduY1BG?=
 =?utf-8?B?ZjN6VUYyTExIVlpta1A4bzFqZVNNWFlzNENZb2R1T0ZlOEV5TjhWbGY0a2dt?=
 =?utf-8?B?K2NST2lKczhxYmdVWDhxWUhrazlHUXkxT1M4d2xqakJoYXYrRnNhZVVkZlVp?=
 =?utf-8?B?UUVSWWtqdDBXdmluUVRSd3RnRStNdHlJdnh0emVMVXdpL3E4MmVaVFVrdTlG?=
 =?utf-8?B?V2xIU0E0MlFPbDlOVFFHSlFsRytwb0lYS1RFL3IvYitML0s0dExNdEJIWEo4?=
 =?utf-8?B?WCt3VXpobGF4T3VXdVlsOEtqMkdHT1NkVFMweFNvdWhGaUNndlU5ekZOOFdO?=
 =?utf-8?B?T2NMSHI2ZmRTRnM0UExnMGpDNTVhYzFyQkNOMWVXUTJlYnRBRFVRRG9HZFZP?=
 =?utf-8?B?RW9NL01VQkR3aWVHdVY5NmJBckVQRDMrZEw4VXpuNGRuRDNzeW9DQkxPT2dW?=
 =?utf-8?B?aVhodnhVbHdkZ1VnaHU3R05VNG9MekppZDJ6ZEZXVlF5alVlVGw4d0R2TkFJ?=
 =?utf-8?B?RDVXcUNCZ2wxZFFMT1l1UUN4Z1JuMENJNEQzMlBqdWVBYk9TV2F6UTVEdEZt?=
 =?utf-8?B?eXUrc2ZQbmZ3R0xEYnFIUFJqakg3NUkxcExNNmRLaTBubUpsdkMvNFpSTUVG?=
 =?utf-8?B?NFBkaE9vT0dWNENXOHczMzF1Z3ZCRmhtd1pMTHFJeTRlaVdvVUxjb1VNWElC?=
 =?utf-8?B?M0U3UVFzaTFZWkEzNkpFWDVYNzJ1OHBiNGZ4d3FaS3cvZHFaVzN6NktTVlh3?=
 =?utf-8?B?YWM1ZEZnQ1JoZ0g0SWlKTGZTdUljWU1CK3g1YWdCeTRxaVB1RTVESFNrRndm?=
 =?utf-8?B?K2J2bjFjZ3ZLN21ScG5PbWxjcEFaNFBMU29pTWlwQW9jenduWHRxRjRITEFn?=
 =?utf-8?B?RDlJc1dZMm5aK1ZnOXRmQzAwSHRRRS9rdGZjLzlGS2lBajByVFYyVDlDcXNB?=
 =?utf-8?B?blRraFZOL2YyaittekJ3U3N6VjIzTDlzMko4d1pUVXoxZzBmbzAzRUJiYm5t?=
 =?utf-8?B?L2I3YklPVFBVTFJqRHhLaE5RcVVpSmJkYUtMT1BvdXY1bXdJRXUrL1NWSkMr?=
 =?utf-8?B?UXVLTWhWZTYzZUIzdlh5VDk4bER6K3VsK0tJUTZ2M0lKQVhhNkF1cWdha2Qy?=
 =?utf-8?B?Zjg5UHVML0k2cVFOMXBqd0NvNUNFTGQxQ3AzN2IxRUxpZlVrZDlpVlRFajM5?=
 =?utf-8?B?eHpRM3VTU0ZrTFNId0hGSHF6U0hRL0lIRmp3M05iYWlhbjJyTEVFUjRlRVFh?=
 =?utf-8?B?R0E2c0VpR3JTRm5rZ3dIdWJUVVo5cDVSbzhVZmw2b29PQTVVcDQ5ak54eklE?=
 =?utf-8?B?WmErUXZXMndPQXBBdGlhVzVaTU93LzVZUkQ5dUxHaWtCTUw5cldRYmxpaVds?=
 =?utf-8?B?Z0tvRDUyc3JDM000N2s2Mk5RZGZseEtNUnc0a1AvNDFieE15c3pnMlhKODR6?=
 =?utf-8?B?eFI3UFdaQnFBYWUxejMycUUwRTlzR3BSUnMvUHVCSG9PdzlkN3VoUmh6QjF4?=
 =?utf-8?B?NnlHVEZONU9xT0lNTEg4VFd4RVF5bXFLSW9nUUJiclV1WGJzRkNzcXNyc3Nt?=
 =?utf-8?B?VlpsZEJrMDFFWG9BZVJiRjMyYnZSOGhwUUZGK3pTYk81dzEvU2swYkZHZjla?=
 =?utf-8?B?ZFNRc2dob2FIUTVxbCtvbW0yai94YUlyREt6Y1dqNENJQ2ZuV0FOSHhNR2xD?=
 =?utf-8?B?VkFHQUg0cS95bmZDaHlmZ2dzcTQyUlV0K3RJazJjanlEc2d2WjhSQk5uc1hh?=
 =?utf-8?B?dWZGMS96bEhMNk4vRWpYV3pSZ3d1ZFZDYW1ydURsSUZjemR6cDZKcDdqUjV5?=
 =?utf-8?B?OGJ5ZGI4TDdhS0dkTlBKb25saGo2MVEvZzVIWkdmTDY3a1FlQjBjbFBzcWVW?=
 =?utf-8?B?YmhkQ3hPeDh6VjdyUlVhTy9vcHBqL0ZhdkJzYy8yelNOam94MHY2ZXlTYzFu?=
 =?utf-8?B?N0xPMXRtRS8wdDNxWGlvMmVySGFEVk1Sb2ZhbjVMNWRtb1czVm9aajQxRFFs?=
 =?utf-8?B?VjQ2VkpqbDdKWEZXQzRIcjVvMDZOd2x6Ty9FTFliZ3lVUUo4WSsrMnVVeUtD?=
 =?utf-8?B?OFRBNHlKNFRHWVNEVnUzbVR0UWptMWtYVC9pRWE1NklWY28zVHZTU2liaWNB?=
 =?utf-8?B?cGkwYXB5VTRGbXVaaHRGWWJJR1R0UUtSaVVGejY4TVQ4UUgyUk44Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed65c17f-5a01-43ac-f174-08da4ab73ab5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 08:00:05.1913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neXRs6nsBLbccWu/zUGzDTCQXJjAfOX/4Wsmc3makQo+pnSt14Tghpd50QdOpxH+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4433
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

Am 10.06.22 um 09:52 schrieb Jiabing Wan:
>
>
> On 2022/6/10 15:24, Christian König wrote:
>> Am 10.06.22 um 09:20 schrieb Wan Jiabing:
>>> Fix following coccicheck warning:
>>> ./drivers/dma-buf/st-dma-fence-unwrap.c:75:39-45: ERROR: reference 
>>> preceded by free on line 70
>>>
>>> Use 'struct dma_fence *' instead of 'typeof(*fences)' to avoid this
>>> warning and also fix other 'typeof(*fences)' to make them consistent.
>>
>> Well that doesn't looks correct to me.
>>
>> *fence should be valid at this point, why does coccicheck things it 
>> is freed?
>
> *fence is valid. Coccicheck reports this because fence is freed.
> But use 'struct dma_fence *' can avoid this wrong report.

Well in this case that's just a clear NAK.

Using typeof(*var) is perfectly valid and preferred should the type 
change at some point.

As far as I can see your cocci script is somehow reporting a false warning.

Regards,
Christian.

>
> I also grep all code and find it's unusual to use 'typeof' in va_arg, 
> only two files.
>
> grep -R "va_arg("  . | grep 'typeof'
> ./drivers/dma-buf/st-dma-fence-unwrap.c:                fences[i] = 
> va_arg(valist, typeof(*fences));
> ./drivers/dma-buf/st-dma-fence-unwrap.c: dma_fence_put(va_arg(valist, 
> typeof(*fences)));
> ./lib/test_scanf.c:             typeof(*expect) got = *va_arg(ap, 
> typeof(expect));              \
>
> And other files all use declaration name directly.
> So I send this patch makes code clearer and fix the wrong warning by 
> the way.
>
> Thanks,
> Wan Jiabing
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Fixes: 0c5064fa8d5a ("dma-buf: cleanup dma_fence_unwrap selftest v2")
>>> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
>>> ---
>>>   drivers/dma-buf/st-dma-fence-unwrap.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c 
>>> b/drivers/dma-buf/st-dma-fence-unwrap.c
>>> index 4105d5ea8dde..1137a6d90b32 100644
>>> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
>>> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
>>> @@ -56,7 +56,7 @@ static struct dma_fence *mock_array(unsigned int 
>>> num_fences, ...)
>>>         va_start(valist, num_fences);
>>>       for (i = 0; i < num_fences; ++i)
>>> -        fences[i] = va_arg(valist, typeof(*fences));
>>> +        fences[i] = va_arg(valist, struct dma_fence *);
>>>       va_end(valist);
>>>         array = dma_fence_array_create(num_fences, fences,
>>> @@ -72,7 +72,7 @@ static struct dma_fence *mock_array(unsigned int 
>>> num_fences, ...)
>>>   error_put:
>>>       va_start(valist, num_fences);
>>>       for (i = 0; i < num_fences; ++i)
>>> -        dma_fence_put(va_arg(valist, typeof(*fences)));
>>> +        dma_fence_put(va_arg(valist, struct dma_fence *));
>>>       va_end(valist);
>>>       return NULL;
>>>   }
>>
>

