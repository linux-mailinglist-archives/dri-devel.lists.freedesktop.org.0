Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5378D4C84
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 15:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C566110FEC6;
	Thu, 30 May 2024 13:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xl8QsRfe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE1010FEC6;
 Thu, 30 May 2024 13:22:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZ685quThb+/NPGbgsnd+YZcUTrO7sq5colfygAyQMPJCveBV36u1yeI1wNF4u+yZPIw8kXKagBohA1qltPYe4xRsIPZX0e+caDq4gqPRaRemUIpMhWr4/q7nYIJQBNKpcpa+HdsYSnR73mBN3nGlTdomWHtVGx7mc+pDYBYwPxMc6W31az73nF2oK77DxWsecvQQqNpyPVQa00jqt8VN6vQsBWASAtZdsfuCzKhvrqMyBD5hc9LSyruiudIVsZ3xhAEVnoIzhcbx57f/gT4VvqoTGFFHL259LjrPwevjAkhtfHg/+8gqjy7hf1Dc50LHqCFFWZVL/XM4kDB1H3eYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vp+Q9W9pKixlVsnZ8vL6wY29gOQ4rvU4Q4rAhSV/Omk=;
 b=F2evHi+MHnL+jfHX3EVxKKjHTGXv649PBBuV0bAdEf6Q+MPGVK4zQTC9DiyMc0eLp8wlCoJJPBpQW/iMOQ/BucQnOfiarz3ff8MSXs8N/PzGcwXMRZ/XC/Nzs7Nl/YBMENiSGakE55VQnLuo6sOiP137eyoVpCXCzTU59eMnAr4CGYhv1v1vQI1f/HBGiG4BGfLbEpoe6RKvyTboSfiGnqWl03X/gZo1krWwSWQXk9q4+EqDgPzxZ7PzInWCZu9lxnr3Kl/m1tm7fSL1z/bUhGt/hu6Y5pr06pnFxVb0MsL1I3/Zjx/PHJAetiFuD+4VvFj8sPIcFDRBUhFi0GeoEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vp+Q9W9pKixlVsnZ8vL6wY29gOQ4rvU4Q4rAhSV/Omk=;
 b=Xl8QsRfePIemmb36SpEDChLno1oBWAifB+/xuBo25tgN9IukJEeEJyDaJpIuTxi2wDSZk9Cnr2cTwAWg0/6PfBj0HXFIKK0NuzcD4ECNDjWNJTsFJSqM5/ikAEC1KxzC1O8QCralXhNln7KfYTb+Zs+b8kb1MSds/uRGCz8Avp3NFYgWDy1eDMS96s9IEc6ft5xTMLbsv5vD7t/MJjGQoq8ZxjXXqW/w8jzB+60I6Ae2ASYqJ/Td+Ak0o68VstAEcz9BpPWXlZUXITUO9eTJjLtQRnQCEFNVApTwfLlL890wPSNKYpds7BTmqhXOgHheVM8fti3d+dMlGWV2BS/kYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA1PR12MB8644.namprd12.prod.outlook.com (2603:10b6:806:384::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 13:22:12 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%5]) with mapi id 15.20.7587.035; Thu, 30 May 2024
 13:22:12 +0000
Message-ID: <d0cc1f6b-1bd5-4557-90cd-6c77f8f1293e@nvidia.com>
Date: Thu, 30 May 2024 14:17:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix gen_header.py for python earlier than v3.9
From: Jon Hunter <jonathanh@nvidia.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20240508091751.336654-1-jonathanh@nvidia.com>
 <83b6e1aa-c8ec-0bd7-2c98-20705741b76a@quicinc.com>
 <780207c9-fcf1-460e-b16a-aad60c12ac71@nvidia.com>
Content-Language: en-US
In-Reply-To: <780207c9-fcf1-460e-b16a-aad60c12ac71@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0494.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::13) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SA1PR12MB8644:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b1dca15-96de-4365-3b01-08dc80ab8419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2ZFZXNqU0NGaHFZcC9jdlRmUUhLYXFhSlpUdTVISUpUcGt4cG5kQXFwUjJU?=
 =?utf-8?B?aXQwWEtaQS9xS0xXRXFYTnAzR3Q5MkJ1NDFINmQzVld2REJHRU5VVDM5Z1BM?=
 =?utf-8?B?dHJ3R1pnaDVuMVRCd2xlbkdYNTJzTjFyMUR0VU5DN2hXK0tjN3hvUTRvREhE?=
 =?utf-8?B?Q3hzSzlEcTh1OVVPS0dNSFI1NXFWdDBKQ1ZsNWVsQmxwQ08xS1R2UFNZc2FH?=
 =?utf-8?B?M3ZqUHpEdElXSTh2TmdoVjhiU2tiVHRNMTdHLzdjMmhLTmVrUFprOHJPOWht?=
 =?utf-8?B?OWVTa0JBRHZ5bm5RVWVJWGdiUGN1RzNiakJmTXMxMy8wWGNhcWtOVmM3cXhu?=
 =?utf-8?B?aVVDd0o5Q2hZL2cvd3RMRmxFUGdJWDA3dCtHUlR4MStlZDN6L3ZTVjVDY0lI?=
 =?utf-8?B?ZFZvZkFLdElWek5pMHpRZFlxZlpNKzlVVCs4VGhaN3o4VzV2bCs4b3lYZ21s?=
 =?utf-8?B?bFd4cUpYc3pqNmlHU05ibjlyS05KWjBNVjZVSjE3VnVscGVjOGR3bVVDMCtS?=
 =?utf-8?B?cGZ5UGQ2cmtxd3FXM1J4K1lScTBpZ2k4cC9mRW1YRktXVThOTEhaV3B0N1FD?=
 =?utf-8?B?U0JQWFl6MUQyS1RXR0xLNEVQQk1LaUhXMTdMNHgzY05sMmt4RkR2TkVZQkFt?=
 =?utf-8?B?bzQ4c2N6SWhpUU9mbEorUWg1TXNnb3NGbXVlVHNTMDFXbFBHZTRRbXB5ZXJk?=
 =?utf-8?B?THloazhKM2ZaWTgvWEJNMkwvK0t1MW8xQlhsd2xIS0s1NDh3SnZybklsNUhs?=
 =?utf-8?B?WW0xL0sxS3RodGhSamxlai9kcTlUUlBwYTYrSmF5TkhDNzRtS01KVDB5NUJo?=
 =?utf-8?B?RWpnd09JM2ppNlZ6RVV1em9abWlHa3QxT1NCZTdzVkRFVXI3U1RLR3pBdzRO?=
 =?utf-8?B?MDhlL29sdG90cmpyL1U2eS9Mc3JiM1FHNVNZQm5VdEFNdk5SZm9NR3kyUDVa?=
 =?utf-8?B?blBIRVdzalJzWmo3NEN6bVBaVkVZU0ZvNGV5U2xxTk5EUTRoSWxHa2lWL3hK?=
 =?utf-8?B?SjZQcU14QlRWQTNGQUx1UCtlZUFRTTBBVHNzRVpvb0tNM2c3cmJ6ZWtIejY5?=
 =?utf-8?B?akdIUkhIcHdxekY3TXpzR2Q2OTFqWElKcjN0ZE1jVDR4Z2ZoeUVBMTkwamVD?=
 =?utf-8?B?aDI2bFM4WlVxTUloVTZDQWhWSW5xWEVSaW5XS0plbStORVdsaHZKY3c4VHlT?=
 =?utf-8?B?d0tGTUU5aVdYTlpHUFNhNjRjS3A0Nk9NTzdjWmxPY2JFT2lTOGoyZjlXZ0dI?=
 =?utf-8?B?akVQTHZ4Nit4TGViK2RiMjlrdWF6dC9ENWtPVzJSZytVem42VUtxNEp1U3ZI?=
 =?utf-8?B?VUdGa1E1VElveStJZXc0eWt2SEdFbjRQYXdCL0FFZDVjZDgxQVRZRkh3YlQw?=
 =?utf-8?B?U3dBNXhtaVRkTVgyWTZUMVNuUHNWL0RLQlk2ZWFWaGdESHZ0TTNoMjcyZXI1?=
 =?utf-8?B?a1RrMkt4bHRCWlRBQjdZbXFBZVI4aW01SnRqWHlsYURaSElDWUtnN3JpUkNj?=
 =?utf-8?B?d0tmbHp1NlBiaTkwUEhMZEhmcng5cUZoSTBwS1Z0THgzelRpR2ZtVmtNWEU1?=
 =?utf-8?B?aWUxWU41dUpockJOdnFoclJ6aXpaZ2FSU0dLblA5T1pQOUZZMUh1eS9WaVF2?=
 =?utf-8?B?UU00MnduOVBGa2hJd1FTYTYrQzBCV2g2S0NTN3VJeXZETEhtTEZJa25xdmdZ?=
 =?utf-8?B?aXhQcnYrR1RPNEVvejEzdWtMVDRBSGZod0w5Vm1rMjBSSlErQWExNU1nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckNZMkxQdnJIS0ZEQnV2RXRrVjRiT1RuaGFFWTk4VHNJajBBaXc1TTE4R0xr?=
 =?utf-8?B?R2daNGwrMVhOZEdxL2h4Slg0cjdQcWIrYWI5VWdFaXRiUUR3Y1l3UUhCcVFU?=
 =?utf-8?B?NFhLRUwxKzl4c3lNNHZob0pBMTk4dzVmRmZZcVFxbzZiZVF1RjNOVXdCeXls?=
 =?utf-8?B?OWdsNFkzUnFoOHlyVnBrTVFFd1FmQ29GYnUvd0N2UDdOSzVFc3JHQjN3ZWVl?=
 =?utf-8?B?MmtPeW4yY3ViSkZVR253VnNzUVZnZk5LZER5b1d3Z2FpY0JHRTh1dm8wSWVI?=
 =?utf-8?B?VHlhcjFYa3UwandXTVNhbUowWGd0RFNWZytVY1hqZ0MvMnFvK1NsWUJWaUhx?=
 =?utf-8?B?aEtJWHltR2tTaFVFRVNOcXZNMTJaRlQ0Kys5a2tYQVY0dzAxWHd2RmdXNFd6?=
 =?utf-8?B?dXk3c0xtS1BpMnFEd1BsUVMyN1l2MUZpSVU5M1pmOEJUemRQOFA1dTFiWmxH?=
 =?utf-8?B?NFoxUElCVElENk5vaS9UeDZWWUM3bFIxM2VSNk9JYUFKKzFqK3M1MkhOR1pK?=
 =?utf-8?B?Nk1WaXBlS3lLeGdTMTJnWDFIRk5lRXpGdEJJOU9YbWwvc1NuNEpHYjc2WkF4?=
 =?utf-8?B?ZmZLZDRrZ1ZkMHl1Q1FiMXRpY0RPcWlrcnlNRnlnUGFneXJUTVRveTR1aWxp?=
 =?utf-8?B?SDBHcXpoMXBCWkFtc2Z2YWhzTVFxMFhjZ25YMzZiR20rZjRZRGw2Mlh5NU8y?=
 =?utf-8?B?K2I5bERhdWhRRnlJYk0vcEZic3VDOG9HcEFuWW5mMjZkdWEvbHl2VXBuMzVm?=
 =?utf-8?B?OFdUMUJ1QVR0NmZ2ZTRBWjNHdHRnMlBTSGpuM0hVSWY4MHpwQ0g4eU1EeFh2?=
 =?utf-8?B?MU5aWkNUV1NWOFBBTVhzTkdCcUFuWEMxS3o0anE5cGhBeFVyalJwdE1Pak9E?=
 =?utf-8?B?UU1sdHRlU2ZacmxJQzJkTkJKTGN5VHMzb2pRbUdlUVh2dzcrTklMSEJiU29G?=
 =?utf-8?B?WjZ3YS9URGYwZVZld2R4WmQxMkt6RXFVcjVpa24vc2FhYTFDV2t0YVZTTXJO?=
 =?utf-8?B?c0J6bEpCVGNtNUVzdEVXS01zZkM4U2NJU2FKWmFZRHBZZ0JIQ0t6c05mczNQ?=
 =?utf-8?B?N0ZNQ2xiWDhlQ1Z6NVR6dkFBMjYwbGV0N092UUVtakczeFdlRFRQdkNVdVRR?=
 =?utf-8?B?Zitlb05yK2NiSDVNSWJKUm5wcUFvVjcyS1lKRU9pRldUTTdNV1hYSUh4M1ox?=
 =?utf-8?B?Mi8ybkJ3ZkszWWtqSWc5YnZPV0RNZ3ZIcDlsRHBFd29yVG9OM0pPT2lmZjFP?=
 =?utf-8?B?K1AzR0JwL0VTZTJqbkRUcGJrNjRxNmlER1E1eWZrNlpWS2UzZmkvN0RoUGs1?=
 =?utf-8?B?SzcrN2FaQkRDd2VNcDNwUXk5c2Y1WWk5ditWTXppZ3RoZysyQXJiOVJsZ1dV?=
 =?utf-8?B?ZmoxOGNjWG0yZllJdFk2UjU0ZlhFNlBKMDJFL1VTL1ZDTzlCcTRpcHpJZFpM?=
 =?utf-8?B?dXEySzVUSFdrdmR0dmpjc0IwRXZIa0c0ZHJ1MUVUUnBuUzZoUDFJekR5Ym5a?=
 =?utf-8?B?Mm15REUzdXc5djF6cm9JRldIbFI0NDZ5MCtUS3d0S2xmWWg5K0ZuOXFsSUlH?=
 =?utf-8?B?MWc3RHlyMzVOQnV2TW1YWURiQ1k1SUZzaUdWRzRDOXByVTViUWNNdUc3aDZI?=
 =?utf-8?B?VE9qcFRiRzBOOTlOM0lxT0E5QXRsbzEzMXVXOW5RaEFHZ2laTUE1ZWc3TTVa?=
 =?utf-8?B?bnVxQWs1TjArZGdaUm5iZG13aklnREtJUTBDeWljKzJaY3cwY1BlWHZEN3BT?=
 =?utf-8?B?QmZxNFFEV1VWSWVmdnNBMTRvRWRUTnowMnMvL24vRmRyZmw2a0JqTkxDTGpK?=
 =?utf-8?B?SFBJM1hpRnZaOHpuSlRxaHhLK0t5YU9zaVpYK2F4aG9lYXNySkNqQXlHTnFi?=
 =?utf-8?B?c3BwMEtCb0dmUUNNSmZzMW9iLzVxc2RpOW0xS3dWM3dPdTYzL2w0VHJ6UTlt?=
 =?utf-8?B?TnpVY2xYUzZHRm5uZHd2UTM5Y2o4MVJFWHdCQmhndG1HZWx6SWpwMUVaSGM3?=
 =?utf-8?B?bFdLZ1R3QnRMRWhTV1pqSGE5bmZWTmUvcFJEL2dNTGJVdDJic2xVQTFKMHpZ?=
 =?utf-8?B?YWpHRGx0OGZEZlJWQnpId0lzMFoxdk5VejJiZVBBcVQrSy8xbGk0K3FTWm1Y?=
 =?utf-8?Q?x5AVsqCBqwnvbCgtv2ZwX4QYo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1dca15-96de-4365-3b01-08dc80ab8419
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 13:22:12.6768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Jh5zNlHD4uLzEJfCqPAwvA6hlfNvNm2USpfmkBt4m5Zo/sMju54A3OWhkDNdxTk+e9NWlouqclcQHeWEH3Qog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8644
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

Abhinav,

On 08/05/2024 21:52, Jon Hunter wrote:
> 
> On 08/05/2024 17:46, Abhinav Kumar wrote:
>>
>>
>> On 5/8/2024 2:17 AM, Jon Hunter wrote:
>>> Building the kernel with python3 versions earlier than v3.9 fails 
>>> with ...
>>>
>>>   Traceback (most recent call last):
>>>     File "drivers/gpu/drm/msm/registers/gen_header.py", line 970, in 
>>> <module>
>>>       main()
>>>     File "drivers/gpu/drm/msm/registers/gen_header.py", line 951, in 
>>> main
>>>       parser.add_argument('--validate', 
>>> action=argparse.BooleanOptionalAction)
>>>   AttributeError: module 'argparse' has no attribute 
>>> 'BooleanOptionalAction'
>>>
>>> The argparse attribute 'BooleanOptionalAction' is only supported for
>>> python v3.9 and later. Fix support for earlier python3 versions by
>>> explicitly defining '--validate' and '--no-validate' arguments.
>>>
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>> ---
>>>   drivers/gpu/drm/msm/registers/gen_header.py | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>
>> Thanks for your patch, I had sent something similar y'day.
>>
>> If you are alright with 
>> https://patchwork.freedesktop.org/patch/593057/, we can use that one.
> 
> 
> Yes that's fine with me.


Any update on this? All our farm builders are unable to build either 
-next or mainline currently.

Jon

-- 
nvpublic
