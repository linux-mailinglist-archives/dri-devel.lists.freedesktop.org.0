Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12458A03F5A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 13:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C6110E6E2;
	Tue,  7 Jan 2025 12:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p09NfBmh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E069B10E6E2;
 Tue,  7 Jan 2025 12:36:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGksIexAP+lV80RGlbkysrSoIB/LIOT3iBaLdGV/bl/HjdQPCajERDKNbDDT2yMU19mVIhpV5ljKJEzXyu45k06E0o5BR48P0Uymw9hsDnMBZyC/PUpC+9HCQw+QA82Q3oUe4WKHOVbMyhhMVdjKbBkVH9ufaFPaqMUEDPTPpP2yrS6nswLto2RLe3m8wfdxZVA1DKTuHKAPjGs1E8FTSqa4dGqwse1k0wqRdd9gWc81RRGN8X/EJnkr9Wvs36gHgGAD6iYfaKa6NuQxIHXnIfWx1fYEKWXSOdi4UYO3Koje0Q7RB3thqYhormXD7f+q7N54qVrmzEosrT7X/PjkYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSDxfiSct0+p2RT/YZTR6pR+KTextSw/SeilJobxZe4=;
 b=VeAQn2GWgu//2HyxtQpFP9XxGXRQzVyUPzHcDRZYsiLGkc8JgOOm4fCzWuVx482K00h2GWBHnTbAMnJQmALbwQ4m1frM4XEPC2H+NHVgameb8AX/Sao9WGFFDMwK3D/YkuWXQi/OeMHbM2ipw+SilRgqXL/aRfLbZ9zYReyvpNEKZUXmC4/xHVBpuJs7qhLjD9HIeyyRGHY8vYNTiGwNEkjG90CMv93lu/t5YV7ZBae/2Gb/3V8gXsgWq62g+YpkvkH1KcPtMLLhhMM2bsykQERgynHfkvCGj7XaLT7+CCXcIELKu1+RFDxA/Ft8dIYhBCPvvZ1x1QlDSK2Jxx077A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSDxfiSct0+p2RT/YZTR6pR+KTextSw/SeilJobxZe4=;
 b=p09NfBmhI9nphbdnzsL9EDOrXA+sOo8gZpbEwEzMME0+KHq+mncfFhW7l7T7ppU4pUj5NIcy4zugWWDHWKXm84iCtjP+PNZ0RCj6pyX2iRgUEnvriX8JQMPE/DHUtjPa/o/iLuv6FVK8/VHIwaYTBhWXGoNUGAmxXMsFDMWnP2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4456.namprd12.prod.outlook.com (2603:10b6:208:266::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 12:36:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Tue, 7 Jan 2025
 12:36:47 +0000
Message-ID: <37743a9d-8a07-4df4-be7d-b06e1e20dafd@amd.com>
Date: Tue, 7 Jan 2025 13:36:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Enable runtime modification of gpu_recovery
 parameter with validation
To: Shuai Xue <xueshuai@linux.alibaba.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "Ma, Le" <Le.Ma@amd.com>, "hamza.mahfooz@amd.com" <hamza.mahfooz@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "Jun.Ma2@amd.com" <Jun.Ma2@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tianruidong@linux.alibaba.com" <tianruidong@linux.alibaba.com>
References: <20241228063245.61874-1-xueshuai@linux.alibaba.com>
 <563b1797-5524-44c5-89b0-754f245e6b8f@amd.com>
 <63938ba2-dcb5-456f-bf82-bd8c893549c0@linux.alibaba.com>
 <PH7PR12MB5685C307737F826039EEE48583152@PH7PR12MB5685.namprd12.prod.outlook.com>
 <Z3vIBq1eTxJcDOyc@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z3vIBq1eTxJcDOyc@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4456:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed4deed-bdbe-4539-dac7-08dd2f17f333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bm1YV1dCMHpNRkh6Qm1MYlJ2Q1BybkdDTElTQk56bklvczlkUzh0TExPU29s?=
 =?utf-8?B?VkQzVnJEU1FYTjZEZHdNVE1VMXh2M3VZTVlPbmg5SzZuUVppeW1SZFJuaTFC?=
 =?utf-8?B?ajNQMmlackw2OWljNFh6Y1RnMDBaTjJHNmsvOGxydGtmQjY4ZDNMeG50UUxI?=
 =?utf-8?B?K1loeVBkNnE3dlNVSkZsdk95Q2dkazhHK05vTGVGcWoxQWw4YnFiaFUzcjVB?=
 =?utf-8?B?bHVYbUc0dVVFeGdmRTRxNzB0U09Za043M2tqRWRKdVdJNzQyN0d6SVNRcEpn?=
 =?utf-8?B?b3lZT1VGSnRqMTJCNCt4cXRsZ1A5RWIrby84VkFSaWZSejlSVjNGS25LSVQv?=
 =?utf-8?B?ZkRhdWZYMWQxK1RpazJON2s3blVaWXJzUllUemY3Sk5tV0VZeURSbkhZNk5I?=
 =?utf-8?B?WDJOUzkvOXZyZk5uSFo1bjBNdTRKVXU2VEdLUmdJT3RvTnFodXJNZ0haazl0?=
 =?utf-8?B?MDRYMHY2emY1NVdyYlZkRUtablBHYlFzTHNwYzZiWHhlK3Q4eURvTldTM3Nx?=
 =?utf-8?B?UVRyNzN0WTNQbW1aUWZodThLWmVXWkhQVW1OVGxWcmo5ZDR1ZGxoYm1nbmpU?=
 =?utf-8?B?Qzl5VnRWQVE3cUd3ZWs4M3V5MU8ybTF5aWpURkYyR3NncXIxejBDSWMxdGgv?=
 =?utf-8?B?d2svbVBwbXdyRHFta1BVMlJtaFJuV0JaTXkwYmx1ZVhTb3F1VWc2czlFdjBR?=
 =?utf-8?B?TGFzVFJHQWFLZlIrb0twUHFsR0RZeThYQWRKTGZBTng5SlBsMndmcC9oVDFQ?=
 =?utf-8?B?UWRPZllWS25tOGpWUE1vR2tJTERYRzA5WVY4ZjdZNW52VGJqQ3pueFhmdXZp?=
 =?utf-8?B?cGsyMmhCRmFzZE81ZThTTnh2Um9kVnNUanY3N1oyUmwvaWJOM2JLMEt2NGdu?=
 =?utf-8?B?RVliSjUxazRZQk9vOVYwRjdhQTdhd3hmOHk3aVdRUFpxUW1KZTZUTWNlS3Zt?=
 =?utf-8?B?WVMzY2pkTGNlTEl3NEZPUDBKTTNKM0NiRU92VDQ3YlJTeG9VNG93VG1EYzRS?=
 =?utf-8?B?bFp0aHNoaFlGM0hOd1FzbDR6TWw2NFpjeU1ZZmxwcmZvc1RHdDNIUlA5NnNW?=
 =?utf-8?B?bnBtZ2Q5SHc2K01CNHZETDRnMXA0YVVMVFU1TWwySUZacmMxbzYwZkNtYU91?=
 =?utf-8?B?TFJZMXV4blAxN0lkTFNxWThxVWJFeS9UdXVXTUVuYzVYYjdzK216Y2dtTmRR?=
 =?utf-8?B?NkIvMXo1RUNNVE5Ca1VnaENGbzlEYmp4Y0dWWlExK3cwOXhKcDlVUEdESzZD?=
 =?utf-8?B?UTZEOUh1VGUyTTQvdkgvbmljUXVzbFd3N3BDWjA0QTFzRVdHU3FWWmgzcEpH?=
 =?utf-8?B?elMyV2JneWYyUVpuOXNweHVISUpjUC93UkdTWDZLdzE4N1JHNkNOQlcyNVkw?=
 =?utf-8?B?dWJNVVFjelluUXNDc0NMV1FGTWhwcWl3c1VLcmxJZUd2RUdWcEJhVys0b3BC?=
 =?utf-8?B?ZEhhYjNJR3FycENuZWVQZXAvdEMrZ1E3OUlOSE55d1RhdVovMEkzbFhNUUh0?=
 =?utf-8?B?d212cEtid0MxdUZ0OVV5N3llWVBqeDY5aDh4YUQzOGgzTEJoTEFkanlDcm9L?=
 =?utf-8?B?TFFZcmNyN3p3YnJ4ZlN1UEs0dVBvaUQxTU5hdXFiWm0zWUV1Q2dzbW9vaFNP?=
 =?utf-8?B?R2gvQTFmUjJxUzZtdkxRMFhHVVZjZzY1aG9hNStKbnFuemhQam93OXltSURj?=
 =?utf-8?B?VStxSU9BYnRMb1FsdU8xTlU0RDJPU1FiZCszT3JBcVZCWmFGeHZPZko1L2Qw?=
 =?utf-8?B?RWtObkJvenVzZktoQkdYb2NLbGc1VnVRSlkyVG1ET1doQkJkQ3d2SWYzUHdh?=
 =?utf-8?B?UjBYdkREWHBlRTJhdDcyTXZVNHRzQWYvUEI1enJyMFBhWWl1M0pJTmlhWXBr?=
 =?utf-8?B?cy8zSjREZzFIVmsyS21pWG1ENmJUVDd0aFBndFZ3Q24ycHRUS0NNd0dTRHN1?=
 =?utf-8?Q?8Nqf6clQQZXuP9kFhuhnbge2oepdoXTU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjBCc282RTJjY3l2Wmk5WlFDeEhWcElRazBXcmoxZmVRSlN1ZXMreFl0U1hx?=
 =?utf-8?B?K2VmanpXVkV1VStIL2xMKzBHK01zdlpiNm9TL01NMU5NQm9mem10T1NOdy9Y?=
 =?utf-8?B?SnhTZFhTUnRFMGxsM1g3bkhmTFhWbkh1M1dBZ0hXT1diZ0xOOUp6djZYVlFv?=
 =?utf-8?B?d0hjeUY5akdTVEJxOVQwY3F2c3lueUhKSE5aRHJuUkEzRGFxK1hVSXp6bmoz?=
 =?utf-8?B?ZmdwWEVzTnZ3RnBuSVlrMzNOWmVwQ0d3NzJZcG44MFdWR052RHZISG9WY2tL?=
 =?utf-8?B?RXV2Ry9KbEJ3U1JIeGhRbEk2dVl5SFhGYVpxUDk4Qm9BMU1QNEg5dDVXamdn?=
 =?utf-8?B?eUs5QXd2L2ltVHBDZjBnRjNUSzBoOTZ5SU9PSXBNNGtodHNiUkkreW5lRlRQ?=
 =?utf-8?B?c1dKbGZLU3ptR2VPeStaM2YxWlM3K04vc2YxQ0xxdTBFOWJIR0NEcHZCVjVv?=
 =?utf-8?B?bjZpVG5VbmFPKy90NUxZVGUyeU55Q3UxUnl1ak44OE13SHpFbzBLeFJCYlB5?=
 =?utf-8?B?TW1YZnRSSXNpWVJEdzI2VGZnZ0dETGF1ZGtBNktTZUNiVzY5VkROV1BOWEx3?=
 =?utf-8?B?bHR2dFk1cmlTRXJDa2lYN2ZtOU1pYTFOTzRPczdtb01XY0V1Rlh0UXpXU3B0?=
 =?utf-8?B?OXR2cjNialREdHRiYnJ4ZktNOTl5c1FEb1BaMWV3NkFkZEh3cG9HY2FTUlZB?=
 =?utf-8?B?S3VhQWtPMkdLQXZPcit3MVZ4dnhyNGdqNlJ6ZzU4VjVSUkhHUHdlbGd2b3oy?=
 =?utf-8?B?VkkyemF3Zm11ZVQzVXFMbmVzblVPTWtaei9kaHdDcDlGY3JMdU4wL1FFRXJI?=
 =?utf-8?B?bUtRKzhOUml1eGRmZjNEM1NIMG90SzZZNVI1emhRYzIwZXV6VDVnaTM0WlJD?=
 =?utf-8?B?ajdwMTJHQnQ2VUc1QXU2WjFWM1NiWkw1Mko2aTU0MnY2R29TdEtub2twRmNy?=
 =?utf-8?B?REx3UTZEbmtvU20xOVNQTkRGVXVWS0VNbGdueGQ2ZDczMVllRDQ1VHdMT3dR?=
 =?utf-8?B?d2E4TlBqWFB6bTZzWmsrZndBSEZDZzRGck1jMUR4ZHc4cWRqam5LN2F0WWFh?=
 =?utf-8?B?YmdGeTREcUR3K0NrUEI3SnV0MmliK1U5THp0UHRQZW5aVEh2eEVRMjlRU1Bs?=
 =?utf-8?B?YUN6RDcvS21XbUdHaHNESGV2Nm1IUFVsS2dNMWNKQXFMbGg5eld0d1gwUVdz?=
 =?utf-8?B?TkJZSlBVWHg1eFFqTitXUG5oWEl4bG83YkorNHEwRUxMSkswbExJbjdhTHJ5?=
 =?utf-8?B?K0NrNytGenBmdG5iSFNsRUJlYU04VFdLK1ZiTHF3Rm5xMUlzckZpeU1DRlAw?=
 =?utf-8?B?NHpuZ2RteS9FWVAyYzRhS1A5c01TWElmNng4MUhJSjhPVzhzNzFPYlNXMzQw?=
 =?utf-8?B?S3ZMWVp3NWVSSllPMmp5R1ZNL1ZPV1JBbWN6ZlQxR1pZaVRLVFVmTDZTVVhZ?=
 =?utf-8?B?a2hUNklsN1h2LzllSHVpRkQza2JoU21Ua0pBNlB6aVU4R3d4NERFdXF4b3cz?=
 =?utf-8?B?MFJnMmJkWUVKTWVnalk1dlJVRVYzRzlVdk5sZmduR0FSMFFuOE5IcUI4b2wv?=
 =?utf-8?B?MTVpSUxQbWZKVDF2MFJocHBkRFAvbzR3WGhDRXNDQmhoVkF2UkxhYzVycXcz?=
 =?utf-8?B?eGJ0SFpMQU56ZTV0U3UrQWhkemVOSmhiSEIzTmsrYjlkRjRYZFVUc0dGR0k4?=
 =?utf-8?B?enFuYmhKazZkRVEwUHlzakg4eHN5Mm1RWHduUTFVaVZuZjdUYSt2WlU4U0xW?=
 =?utf-8?B?S21OVGlrZkMxUWliUHdQY202ajZyaEk5NCs5S1NUbXJBczE4bVFBekJ5Zk9J?=
 =?utf-8?B?Ymx3TUxGMGs1a0Vsbjh4dW1UWmhPaXAyRFhOWUJmMmIwTXpQR3JMSlZaVmVB?=
 =?utf-8?B?eG5qSysvQXRVVVJnWlFNRzBCTVNXOHpid2NSUUt5TDBWaUN2WFhjWnJkVC9m?=
 =?utf-8?B?VlBLTWNHcVNZOTdjTkoyS1BQdEwvWGJqZjFBVThMSXFuSDM0Y3NmTUxQSDhX?=
 =?utf-8?B?Mk9tVG1QK1pYZm8vcHJJNVFBQ2xkRXRVbGhuNVdNOXJjamRjWFJLMWZDYjlY?=
 =?utf-8?B?REoveEMydk01dUlJOFdOY1ZRd25TNVp0VEdBb215d2tlQktJV1NONzJHTnp5?=
 =?utf-8?Q?T4o/KE9Y2E3jGfRtGpJpMCLOS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed4deed-bdbe-4539-dac7-08dd2f17f333
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 12:36:46.8932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPp0sTdhL4ZoB1VXos71fNvSjlvOeOxQP2EveGwk+chKuk0QyC+lnrRRwbAEHBQO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4456
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

Am 06.01.25 um 13:09 schrieb Simona Vetter:
> On Fri, Jan 03, 2025 at 08:21:43AM +0000, Koenig, Christian wrote:
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>> Hi Shuai,
>>
>> setting gpu_recovery=0 is not even remotely related to RAS. If that
>> option affects RAS behavior in any way then that is a bug.
>>
>> The purpose of setting gpu_recovery=0 is to disable resets after a
>> submission timeout most likely caused by an unrecoverable HW error.
>>
>> This is necessary for JTAG debugging in our labs during HW bringup and
>> should *NEVER* be used on any production system.
>>
>> We already discussed with upstream maintainers that we should probably
>> mark the kernel as tainted to indicate that it might be in an unreliable
>> HW state. I will push for this now since there seems to be a big
>> misunderstanding what this option does.
> module_param_unsafe and friends really should be the default for module
> options really, since generally they're just for debugging and other
> hacks. With multiple gpus you can't control options per-device with module
> options in a reasonable way, so that's all no-go. So might want to go
> large-scale relabelling module options while you're at it.

Oh, thanks a lot for this pointer. I wasn't aware of the unsafe module 
option variants.

Going to prepare a patch to make sure that debugging options are not 
used in a production environment.

Thanks,
Christian.

> -Sima
>
>> Regards,
>> Christian.
>>
>> ________________________________________
>> Von: Shuai Xue <xueshuai@linux.alibaba.com>
>> Gesendet: Montag, 30. Dezember 2024 09:50
>> An: Koenig, Christian; Deucher, Alexander; Pan, Xinhui; airlied@gmail.com; simona@ffwll.ch; Lazar, Lijo; Ma, Le; hamza.mahfooz@amd.com; tzimmermann@suse.de; Liu, Shaoyun; Jun.Ma2@amd.com
>> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; tianruidong@linux.alibaba.com
>> Betreff: Re: [PATCH] drm/amdgpu: Enable runtime modification of gpu_recovery parameter with validation
>>
>>
>>
>> 在 2024/12/30 04:11, Christian König 写道:
>>> Am 28.12.24 um 07:32 schrieb Shuai Xue:
>>>> It's observed that most GPU jobs utilize less than one server, typically
>>>> with each GPU being used by an independent job. If a job consumed poisoned
>>>> data, a SIGBUS signal will be sent to terminate it. Meanwhile, the
>>>> gpu_recovery parameter is set to -1 by default, the amdgpu driver resets
>>>> all GPUs on the server. As a result, all jobs are terminated. Setting
>>>> gpu_recovery to 0 provides an opportunity to preemptively evacuate other
>>>> jobs and subsequently manually reset all GPUs.
>>> *BIG* NAK to this whole approach!
>>>
>>> Setting gpu_recovery to 0 in a production environment is *NOT* supported at all and should never be done.
>>>
>>> This is a pure debugging feature for JTAG debugging and can result in random crashes and/or compromised data.
>>>
>>> Please don't tell me that you tried to use this in a production environment.
>>>
>>> Regards,
>>> Christian.
>> Hi, Christian,
>>
>> Thank you for your quick reply.
>>
>> When an application encounters uncorrected error, it will be terminate by a
>> SIGBUS signal. The related bad pages are retired. I did not figure why
>> gpu_recovery=0 can result in random crashes and/or compromised data.
>>
>> I test with error injection in my dev enviroment:
>>
>> 1. load driver with gpu_recovery=0
>> #cat /sys/bus/pci/drivers/amdgpu/module/parameters/gpu_recovery
>> 0
>>
>> 2. inject a Uncorrectable ECC error to UMC
>> #sudo amdgpuras -d 0 -b 2 -t 8
>> Poison inject, logical addr:0x7f2b495f9000 physical addr:0x27f5d4b000 vmid:5
>> Bus error
>>
>> 3. GPU 0000:0a:00.0 reports error address with PA
>> #dmesg | grep 27f5
>> [424443.174154] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5d43080 Row:0x1fd7 Col:0x0  Bank:0xa Channel:0x30
>> [424443.174156] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5d4b080 Row:0x1fd7 Col:0x4  Bank:0xa Channel:0x30
>> [424443.174158] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5d53080 Row:0x1fd7 Col:0x8  Bank:0xa Channel:0x30
>> [424443.174160] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5d5b080 Row:0x1fd7 Col:0xc  Bank:0xa Channel:0x30
>> [424443.174162] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5f43080 Row:0x1fd7 Col:0x10 Bank:0xa Channel:0x30
>> [424443.174169] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5f4b080 Row:0x1fd7 Col:0x14 Bank:0xa Channel:0x30
>> [424443.174172] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5f53080 Row:0x1fd7 Col:0x18 Bank:0xa Channel:0x30
>> [424443.174174] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5f5b080 Row:0x1fd7 Col:0x1c Bank:0xa Channel:0x30
>>
>> 4. All the related bad pages are AMDGPU_RAS_RETIRE_PAGE_RESERVED.
>> #cat /sys/devices/pci0000:05/0000:05:01.0/0000:06:00.0/0000:07:00.0/0000:08:00.0/0000:09:00.0/0000:0a:00.0/ras/gpu_vram_bad_pages | grep 27f5
>> 0x027f5d43 : 0x00001000 : R
>> 0x027f5d4b : 0x00001000 : R
>> 0x027f5d53 : 0x00001000 : R
>> 0x027f5d5b : 0x00001000 : R
>> 0x027f5f43 : 0x00001000 : R
>> 0x027f5f4b : 0x00001000 : R
>> 0x027f5f53 : 0x00001000 : R
>> 0x027f5f5b : 0x00001000 : R
>>
>> AFAIK, the reserved bad pages will not be used any more.  Please correct me if
>> I missed anything.
>>
>> DRAM ECC issues are the most common problems. When it occurs, the kernel will
>> attempt to hard-offline the page, by trying to unmap the page or killing any
>> owner, or triggering IO errors if needed.
>>
>> ECC error is also common for HBM and error isolation from each user's job is a
>> basic requirement in public cloud. For NVIDIA GPU, a ECC error could be
>> contained to a process.
>>
>>> XID 94: Contained ECC error
>>> XID 95: UnContained ECC error
>>>
>>> For Xid 94, these errors are contained to one application, and the application
>>> that encountered this error must be restarted. All other applications running
>>> at the time of the Xid are unaffected. It is recommended to reset the GPU when
>>> convenient. Applications can continue to be run until the reset can be
>>> performed.
>>>
>>> For Xid 95, these errors affect multiple applications, and the affected GPU
>>> must be reset before applications can restart.
>>>
>>> https://docs.nvidia.com/deploy/xid-errors/
>> Does AMD GPU provide a similar way to achieve error isolation requirement?
>>
>> Best Regards,
>> Shuai
>>
>>>>    However, this parameter is
>>>> read-only, necessitating correct settings at driver load. And reloading the
>>>> GPU driver in a production environment can be challenging due to reference
>>>> counts maintained by various monitoring services.
>>>>
>>>> Set the gpu_recovery parameter with read-write permission to enable runtime
>>>> modification. It will enables users to dynamically manage GPU recovery
>>>> mechanisms based on real-time requirements or conditions.
>>>>
>>>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 26 ++++++++++++++++++++++++-
>>>>    1 file changed, 25 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> index 38686203bea6..03dd902e1cec 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> @@ -563,12 +563,36 @@ module_param_named(lbpw, amdgpu_lbpw, int, 0444);
>>>>    MODULE_PARM_DESC(compute_multipipe, "Force compute queues to be spread across pipes (1 = enable, 0 = disable, -1 = auto)");
>>>>    module_param_named(compute_multipipe, amdgpu_compute_multipipe, int, 0444);
>>>> +static int amdgpu_set_gpu_recovery(const char *buf,
>>>> +                   const struct kernel_param *kp)
>>>> +{
>>>> +    unsigned long val;
>>>> +    int ret;
>>>> +
>>>> +    ret = kstrtol(buf, 10, &val);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    if (val != 1 && val != 0 && val != -1) {
>>>> +        pr_err("Invalid value for gpu_recovery: %ld, excepted 0,1,-1\n",
>>>> +               val);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    return param_set_int(buf, kp);
>>>> +}
>>>> +
>>>> +static const struct kernel_param_ops amdgpu_gpu_recovery_ops = {
>>>> +    .set = amdgpu_set_gpu_recovery,
>>>> +    .get = param_get_int,
>>>> +};
>>>> +
>>>>    /**
>>>>     * DOC: gpu_recovery (int)
>>>>     * Set to enable GPU recovery mechanism (1 = enable, 0 = disable). The default is -1 (auto, disabled except SRIOV).
>>>>     */
>>>>    MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (1 = enable, 0 = disable, -1 = auto)");
>>>> -module_param_named(gpu_recovery, amdgpu_gpu_recovery, int, 0444);
>>>> +module_param_cb(gpu_recovery, &amdgpu_gpu_recovery_ops, &amdgpu_gpu_recovery, 0644);
>>>>    /**
>>>>     * DOC: emu_mode (int)

