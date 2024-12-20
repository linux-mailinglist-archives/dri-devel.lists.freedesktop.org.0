Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C4C9F931F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 14:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FCF10E38B;
	Fri, 20 Dec 2024 13:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Gvs+ShEg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F1910E38B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 13:26:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6QODVdaTbY+5xSXnjfV7/C0ZZdujeH5aO5pcatIjXqWWn7p4/t682TS/vr20mU5pSV7RCzHymMtScbW7q/d/Y16t7oU6+1y7U05DaJm6BzSgoRMFBiGibdCzvXzCmzTnqa1AAlC0BJJexlCytLKkTMsEuoA4JyFqRbdyz9zjy5bRdYrcNuB2OaXOM7J/L14zRHgwB9o/N1t22LOujXOL0pu+hnX4hrZRCqhtKP95Pm1bG4+azTGxVh8Ez+l/FvEmlyQ1PEg/H1x/LQEJd+SGsNEtBsEEI/xXxs34nj6jFkmvgSt0Ktg2D7VPj+bOvyWSWYIfTrrGX+UH0IG16JQmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJ4wk64m1ZjGPrs4EsrSA/oc9JoaR0dSXNvRh0EdE8Y=;
 b=j2aHSyyg9DTGrB/wZDhi1V4OqtGHhwkqx6q2lkIk7ObJcwNBGGQ9vOhwfWvTSQHAMKjYBOVT6aTTYYVM8fOUe+rAgO9clNcP3gc7pzEeTIHcM4jXZ0zn44QPMvWKTCj74PX7u97yUNQXxF4g+ydMx/Ha7+AkPMF4nM/Cxy2OFDtwFMy9cYVnniZFGPB1gdj5HOV4UP+xeJhbSvCkQ+JrxuwxHzQGXcOxIzAmwzYPoz5iR35NYZivqv2pHtxyNcArjmn6fKAC5dNStKxJyQhYYg/kviYIy2gPLGiP5iK86FAAwgptmkQynb+N1YcJznBpqWQVV8ot3zXjwVJgPBYuHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJ4wk64m1ZjGPrs4EsrSA/oc9JoaR0dSXNvRh0EdE8Y=;
 b=Gvs+ShEgU8mKp+FAgGT1890ikJs1VpezE7HTczmr0jAlGRjo8gYmNTNoE/gMLBuNYIibKQzt3vJch01iHwoSopb8B8q2Z4QylpEJ7qtfJULN1IBjbhuwsfLsMbmlKmZIv0XagysZHzi4xFF6N0Dj583FNUcKCRi2djX8tnjHhgo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4196.namprd12.prod.outlook.com (2603:10b6:a03:205::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Fri, 20 Dec
 2024 13:26:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 13:26:02 +0000
Message-ID: <e366a206-9fa3-4c6b-b307-d48855a7b183@amd.com>
Date: Fri, 20 Dec 2024 14:25:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Document run_job() refcount hazard
To: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@kernel.org>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <20241220124515.93169-2-phasta@kernel.org>
 <5c4c610e-26ec-447c-b4db-ad38e994720b@amd.com> <Z2VunIJ4ltfW_xqD@pollux>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z2VunIJ4ltfW_xqD@pollux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b24d59-e84b-4534-8926-08dd20f9d988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aW1nRk5QeWltaUd3SmZMK280aGR5MHNKaGNZZXN1NzlGYTJNdE9OOXN6MGVj?=
 =?utf-8?B?N3VycmVKMzdhbW9qK3JYcGVDZDM3MU94ZDN3ZW1NN1FzMlgxUDdiak9Pbm5R?=
 =?utf-8?B?UUdnOWJJR2hxQWtMK0trYjlFMUZ0L2hxdFhxZDVGc0hzbC9aMXV1QyswTkhD?=
 =?utf-8?B?L2NBS3B1WVVQSFlxYWdiaDBEVFdUdkZVS09EZ1pLMU00RG91bnR2dnA4QlNT?=
 =?utf-8?B?dXQ0Q0xUMnBIZTF6OGd0TGQ0NGV5WmpXQ3N3R2JDd0xtTTFvMmRUWFNVaGIv?=
 =?utf-8?B?WGI4VmVJdDRBVnpwYjIwS3o2TjQ2SkJSbENWZXA1VjNCZFl0S3l0Z2dOMWkx?=
 =?utf-8?B?ak5NeUhIWHZZMTVoVVlPWlZ4OENVaS83eWdHTzNxR3FiYnJtTkV3NElBUkJi?=
 =?utf-8?B?dlNsUWIzaDlvamRPeWVNV3V3QXhCOEMrV1QyV3BlTDFQVnJXUUp6MDg5TjYx?=
 =?utf-8?B?Qy9vdGxXL0Q3RXZSazZxeVcyMG9WY1pRdXNhU1pTSTN2Z25kYmQ0L2FYTWVi?=
 =?utf-8?B?MkFaTVRtUWNIakNSODFoTnlkVGtmdXh5amt4c1pSZ0NXYU4rNUo5ZUdXczUy?=
 =?utf-8?B?OGkvTlJSM2NqdFhxOVZ3d1JUQmVBWloyaEl4NnpMMzNDOHJsbHBFZ0t0bkc1?=
 =?utf-8?B?RmU0elpuWFN4aFhvcFEwZmNQQ0p4WTk1MkN0a1NObS85alk1MTE1Q0ZNQ2NK?=
 =?utf-8?B?bm5sem5aUVZMYzlOWGkyempyNWxENW9kRVU0VnQ0NUNyOCtwa2JQNGl1VGUy?=
 =?utf-8?B?ODZwVnJKOTZGYjVSKzhCOUtnQU1MQ2U0YW8yamtsR2IzeFp5SEF1K1BmaFdB?=
 =?utf-8?B?S3VGSUt3WVYvZTRNYnM3dlRMazd2amh2TlpzdDBPNWNtZk5EbGZ3SmFUbGVS?=
 =?utf-8?B?S1BuM053MXFja0NJbHV3TnhBZHVUZjMrT0hXb2NiVlR1SGdpZEYzdEZiVnVM?=
 =?utf-8?B?OUdCdVg4Zjl4OHpBa3E0UWdSNEwwRldKakYwYTY1VHBhelp5ay9yWWI4MERZ?=
 =?utf-8?B?ZkFuMHplYnk5cHVrcG9BcUpQOFBpOEdJU01VWWFXUGI1QXNFT3E3S3RGWXZD?=
 =?utf-8?B?Tm81YjBqaVQ0RUViNE1OeUNFUWhqQVI4U0NCbENQNVlmSmduNk9xOXdtYkVJ?=
 =?utf-8?B?ZjJvY3ZLdzJnUm45c20rbmlUWjhVU3F2ZEtYMWN3Q3hxZ2Y4cDJIM01ncitG?=
 =?utf-8?B?K0czTW4wSWFGYlR5R0NEYjRJQURUa0lZR1RDc2pyMHFWSW10WUd6ditmL3py?=
 =?utf-8?B?NDRPdFpXNnp5djlwalR1VmZEekhPT2hvM3d2VGYyTEVYNi9YaHNZRUJETU8w?=
 =?utf-8?B?ZmRkbE1CQlJEdnJQTnhBYTlNV0RYdUtGRXllTjlISHg4NWVRM1N6Unp4TVQx?=
 =?utf-8?B?WXU4SXdUTjhTanBVL1N1Zm8yWURQd0R1YStyVlpQMUk3bUpISUV2dDFBR0pB?=
 =?utf-8?B?ZEtjZEEvL2R5WWRMK3hWOVBnVzJRRmJqN0REY00zNWFaRHhpSGJ6NmZFb1lq?=
 =?utf-8?B?ZFI1d0VOQ3o3SEwxUTFycGhQekpDV1M4WU1XRHVXTmV0NlhVL0Ird2dhRWM1?=
 =?utf-8?B?ajF2SlBGSEpsL1Z2bEkvd3BqOThZRWQwdEkrbEpjdWlpam9lbzNHTlZYNUc0?=
 =?utf-8?B?TTViYkE1VWZGV085b2pSYXAvQm5lRVpvQTlNMHhxNjlmS0hTdHRkaGtUVWJS?=
 =?utf-8?B?R3JzMm5LRnRWN0xRV0hzWFdVMExZaE1WSlh1MnhwTmJjbkxScXFIVzBhNG1o?=
 =?utf-8?B?OVpOeGRnUisxbVhDTWhNcjhieHlNdGJEUXUxaVFmNkZ0L1pJT09RUzFnZWs1?=
 =?utf-8?B?OHMzTzhXRmlPcDA5TXUxdWZBZlBJYzEzSncrWTJjeXVjY0RTa0plaUJndG1v?=
 =?utf-8?Q?vUT2X+pR6lVJi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEdMdmFiVUNBcVFSZ1ppcFdISE1LV3VxRWVEM0xLamlHNGRKVTlQeHpYRERm?=
 =?utf-8?B?N2N0aEpUYjlhZnkwRGZwUDJIVjJxSkZVVWZkL0FpNmpuK244WHJGODRSbzVk?=
 =?utf-8?B?MzRnbU11UlFhVEUrd3piZ2MwZHd1YWJlN0VtbWhMUzdJRXErVWFDNUIwQ0l5?=
 =?utf-8?B?RmV2eFJXQjlJNHhSNHV1bVZqUk1RZjNha2JXeXUyU0lTNFpyTHVRQ1haYzNN?=
 =?utf-8?B?ZDc1N0Q3VlVvTXQzcXlXWkVZQkE5cU55WHlPU1cxbFBYbW43dk9JNDBVSWtj?=
 =?utf-8?B?d3ZoVnhEd2U5cW9rK08yYkVpNG9YT1V4ampVNVNhYnQyYWVtZER1Q0F2ZDdN?=
 =?utf-8?B?cURpNm5XSWxoMFBvVklnQ2N2VXZadWJXaGdkZ3lLU2JCVXdxVTVzNG9JN0J5?=
 =?utf-8?B?bVhDOEJUMk11c1l1MGZSNTRVUlhOQmtFZDdyLy91WitndGxqQW9EZFlHRzNi?=
 =?utf-8?B?eEdPMTVidFhTMVhOMTBXV2R4cE84TzlGSnRmOUpJVkRuNit3NkV3Ry9KV1ZH?=
 =?utf-8?B?ZHhJVDlEai9QUEJZZEhhbnNsY3FteVRCMHZJY2pyRHVZMmd6bW5IU003MCtS?=
 =?utf-8?B?MnJYYlZPR3AweXJPa3hZSmlYOVVUZFpCbmVsaHYrWjBteXVod1REbTlYS3hF?=
 =?utf-8?B?bmU0RzRhN3RkWEJNTVovcXFjMjNnTm0wSlNadXVuaFowQVlpK25MUTd3UUNa?=
 =?utf-8?B?cjhGL05WczRGOWF6TlArV01lbjVCRmdFczVWZklGRVJ3RnFjc0ZLbjBIdjd3?=
 =?utf-8?B?ZWNiT25ZN2Z5aW96ZC8rR1VhRWRiTTJFbmNncXJ5cFVzakV5TDliTUlRcVo4?=
 =?utf-8?B?V3BzZm5kU01tSzQ3YkZ4ZWU2UWdmeVV5ckR0VUZycDk3cHlLOU5mUnVCMW9j?=
 =?utf-8?B?TEQ3aTduSFlySkJBS3JEWDA5dTVJOUZEYWFRTmp5Z3gyancyVHBzTytyOWNW?=
 =?utf-8?B?OEFZUEEyMG05QmtBcE5CM0dGeEthazYvc3lqSitGRHBuaW9mVEtaSTMwZzJ1?=
 =?utf-8?B?aWpSdThvMEZ6NXdWNTZtbmQ1TTBUSHUzZ3BndXpEbkI4ekZwa251Q29JQkox?=
 =?utf-8?B?ZS9HMXZiRWpVaVdQQ1JIQmZQMVg5K01oL3ptTmJ1MlNJUVpDa1lUckdVbnA2?=
 =?utf-8?B?VGdtc25UYWtsUlVndTg5TzZIQ3hyTnI3YUwxSXZ3OW1rZVRFdzFRUG9uV1dK?=
 =?utf-8?B?UWRyY3dnUEtuQWZqem1pUm5mVm9IR0Z2NXhQV0wwcnNKV2RnTzU3K2VQSWc4?=
 =?utf-8?B?RGo3cEllMVRxRmNOd0YxQTRFRlI5bjRqanhVY1pZcVd4bnA2WEpzL0hDZU5Z?=
 =?utf-8?B?VHUwaVVtWlZQQW1hTHJ5Y04wQXVobnlzNy9qcUdSRm5mdkNlZVF4bkJFdTFQ?=
 =?utf-8?B?bVJYaXFJNi9DMHFUQndxV2lkb2RaSFFTaVhvTE81NU9saHZNYWNMUm9GSFVU?=
 =?utf-8?B?eWRUS0FKMW5Iell2aHA1SlRrSmhXY21CUi9pZ0toY2ZYTERrWTA1ZVR2RGZZ?=
 =?utf-8?B?bERFTmZZaExPMGk5SWpucVJFNlM1TjQ5RGRjaFY3ZkJiVzRpU0Y3Wnc3TXkv?=
 =?utf-8?B?MlFZRTE0VXdvUDJIUjZCeXBBQkFXaTJWcUdpdjRIMmxyVW45NGtxbnBTbUlI?=
 =?utf-8?B?cVV1YWhoVXZPbVJDMTBHTkU4a2czZE04aXdPV3FESlBtSXM5ZWIwdmJJL0ZW?=
 =?utf-8?B?eEExbnc4SzczY3VwNm1tNTZTbjBIOXZvWGtDWGJVbXM5cGJiVGR6ZmRnVFI4?=
 =?utf-8?B?c2xkSzBLd1dVa3NSVnV2V0wrenpZbWtIS0tJckpKQ3JtR09EQ09DV2xIK0kw?=
 =?utf-8?B?N2tnUWd6Mk9qeHh2RGdzU09FYjNlMnJMdUM1Z0FnU01vNjBodjlzakx2OEkr?=
 =?utf-8?B?L2Z5QStGQWRxQzZ3VnBPN0Jycm9NcThqbGhHMjN0V05UYnFmYVcwSnVJbXR3?=
 =?utf-8?B?cXhIalVnSC94VHkrMk8xcUJTcFhqNEp0eTdEMUxiZEUyOUw1bExwTVJtL1Ay?=
 =?utf-8?B?RzMzdFB3L2FCUXgrUnRPZCtkbVJJZXJyZGVsbU5Ob2RqYU1xR3ZmalNWTVFh?=
 =?utf-8?B?bkl3THRwUGdsSzN1WVJia3NqQTZMbGZTZ00wUlkxRFNBWUtCRS94K2tNNHZE?=
 =?utf-8?Q?Wl+LZ6eLh4q2dbS7bs4kc4OCR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b24d59-e84b-4534-8926-08dd20f9d988
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 13:26:02.8120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mrXkR8C8xpot+U5DVGj203ZZQVjVAwP+fX4QXX0SWZiisM67YGEmAO72kl04F5w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4196
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

Am 20.12.24 um 14:18 schrieb Danilo Krummrich:
> On Fri, Dec 20, 2024 at 01:53:34PM +0100, Christian König wrote:
>> Am 20.12.24 um 13:45 schrieb Philipp Stanner:
>>> From: Philipp Stanner <pstanner@redhat.com>
>>>
>>> drm_sched_backend_ops.run_job() returns a dma_fence for the scheduler.
>>> That fence is signalled by the driver once the hardware completed the
>>> associated job. The scheduler does not increment the reference count on
>>> that fence, but implicitly expects to inherit this fence from run_job().
>>>
>>> This is relatively subtle and prone to misunderstandings.
>>>
>>> This implies that, to keep a reference for itself, a driver needs to
>>> call dma_fence_get() in addition to dma_fence_init() in that callback.
>>>
>>> It's further complicated by the fact that the scheduler even decrements
>>> the refcount in drm_sched_run_job_work() since it created a new
>>> reference in drm_sched_fence_scheduled(). It does, however, still use
>>> its pointer to the fence after calling dma_fence_put() - which is safe
>>> because of the aforementioned new reference, but actually still violates
>>> the refcounting rules.
>>>
>>> Improve the explanatory comment for that decrement.
>>>
>>> Move the call to dma_fence_put() to the position behind the last usage
>>> of the fence.
>>>
>>> Document the necessity to increment the reference count in
>>> drm_sched_backend_ops.run_job().
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
>>>    include/drm/gpu_scheduler.h            | 20 ++++++++++++++++----
>>>    2 files changed, 23 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 7ce25281c74c..d6f8df39d848 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> +	 *
>>> +	 * @sched_job: the job to run
>>> +	 *
>>> +	 * Returns: dma_fence the driver must signal once the hardware has
>>> +	 *	completed the job ("hardware fence").
>>> +	 *
>>> +	 * Note that the scheduler expects to 'inherit' its own reference to
>>> +	 * this fence from the callback. It does not invoke an extra
>>> +	 * dma_fence_get() on it. Consequently, this callback must return a
>>> +	 * fence whose refcount is at least 2: One for the scheduler's
>>> +	 * reference returned here, another one for the reference kept by the
>>> +	 * driver.
>> Well the driver actually doesn't need any extra reference. The scheduler
>> just needs to guarantee that this reference isn't dropped before it is
>> signaled.
> I think he means the reference the driver's fence context has to have in order
> to signal that thing eventually.

Yeah, but this is usually a weak reference. IIRC most drivers don't 
increment the reference count for the reference they keep to signal a fence.

It's expected that the consumers of the dma_fence keep the fence alive 
at least until it is signaled. That's why we have this nice warning in 
dma_fence_release().

On the other hand I completely agree it would be more defensive if 
drivers increment the reference count for the reference they keep for 
signaling.

So if we want to document that the fence reference count should at least 
be 2 we somehow need to enforce this with a warning for example.

Regards,
Christian.



>
>> Regards,
>> Christian.
>>
>>>    	 */
>>>    	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);

