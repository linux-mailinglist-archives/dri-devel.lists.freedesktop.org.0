Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88F6A85E95
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 15:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D684D10EBBC;
	Fri, 11 Apr 2025 13:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wt5hi2T5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFFB10EBBC
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 13:20:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxZwE/yhrVmNnJS4xEF6xue24+sy8W46MZtyEaDsRvGlrT3cUf9ZRwhxwDQue4is0D+kljNdFsMuviRwtMcPUiapV+FITIYZG+PQwLmSUIcVlVi5WnZj8g+/HlI8IR/GyIySMLY/ZnFT4jKTkPgY+3iHXBaQxcqXI4vzJnswpWwX5DiO3LYqrCIVz85mkU9DwwD0zEvEv/Wq1hEtwx7P7d5hkU7h07YgHEj+UE6l9ZR5vYEyauKojJ9hHRiJ3Tub5ISi0W84jfNwLThwJLOyALlxVxS8P8kLhmVyqB1I+yJMzKl2eInvfYkw/AN/Gw1h/OB04v8ULcVH0vwFRaUwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ROP0nlxEq7mMxLcgXwpjhOZrG18+dsxjH9MjdwAUtk=;
 b=vV5DaTzb4DOilp+gFKscPeVcqhVoivIXkhWPajlZO6jxicn2lL+PFX0TPqhjRaX4WFK5PvpA2C6tM5XDp3Yv9nM2ZeZGB8j69i2Q7ArJmn8EzixzLovU/v1Q09zjoK9BR5wdAXNR3Wz7XSNriXZAef7w72jkgoU0OmV089+q6T5HFOsqIwe38gP2tHhzUlk2SPAvjQVpBCe4mLbzKrKCCTbBGYbm03QH7CCRDTqYcjo5oyUxtgQrOjyUXy08EarIk5mC3BnG2Y/x0IWbsXOylzmxpmefy6XwDB+n/2tvEtCSec2cRT4WrkL31opZpoqaeBCg6hwG2M4RmvJU1HRN4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ROP0nlxEq7mMxLcgXwpjhOZrG18+dsxjH9MjdwAUtk=;
 b=wt5hi2T5EZrj1qizLrJgCkSH06dCVM9I2sAeBgzaU7vic/+ivOcQU+FbQEZlSZRqQGjiwq5wUBVq5Co9HDvWPTYs5/hj18hfpfMWDCqj+z78647WnUFPdQvObN/8KUq2oVcd/6T6cQN9z9KH3mV+SajzG1NtOW0fYWN04Lbrl0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS5PPF5FAA0E762.namprd12.prod.outlook.com (2603:10b6:f:fc00::651)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Fri, 11 Apr
 2025 13:20:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 13:20:11 +0000
Message-ID: <f30552b0-36a7-4a56-a117-44e9eb3a14bf@amd.com>
Date: Fri, 11 Apr 2025 15:20:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dma-buf/sw_sync: Decrement refcount on error in
 sw_sync_ioctl_get_deadline()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Rob Clark <robdclark@chromium.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <a010a1ac-107b-4fc0-a052-9fd3706ad690@stanley.mountain>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a010a1ac-107b-4fc0-a052-9fd3706ad690@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS5PPF5FAA0E762:EE_
X-MS-Office365-Filtering-Correlation-Id: 851a83f8-f7bf-4c9b-f8e6-08dd78fb9640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWJvSFVmUHZUSmJ1L0RMdGVHdWx3SVNvczZmTk9hWjNYWTY5R243Tk5OaW1W?=
 =?utf-8?B?TWVibDdPYTk5b2R1WFpibktpMUkwcUdQY05vV0JzYWsxR2lUa09aM3lTS1FY?=
 =?utf-8?B?R1k1Kzlpd3M1UlVqN1JWNDVlMFJ3VEpYamMxazVBNTZoWVFnUHVWVCs5bGNn?=
 =?utf-8?B?RzRkbXl2UXByTTlsOGZ2SjhFT3l6T2oySktqWkJhaG54R3AyUzJxSW1NQzJw?=
 =?utf-8?B?bXJucDNjb3FSNVVUNndYODlua1luQjVRbWJ3R2xNUms2cDdNekRrdGZwVDgz?=
 =?utf-8?B?L2JzUXN2em5Gc2dnejVUNXhYcVYrdjJaT25xM1FSRXl1eEtCT3dlZlVIODBi?=
 =?utf-8?B?Zk1YV3cxNHFVd1hjMkptaUJPRlhXUFB3MjArZWIvbmtma2VTeTVhaytFRWFW?=
 =?utf-8?B?NklBK0hWSmUySDBxKzZ5ejZmeFkwMHZGNmZjWElENGpFNUpGWm5kN3RHK1dk?=
 =?utf-8?B?ZjhGUHJKTVMwY0RENjNpS0F2TUIyM2lGY3dUQkl5NkxIWW90VHlQVTV3elRR?=
 =?utf-8?B?WTJIVVd6SHdEMTF5MGRZSVJHNS9laUV2Y0NqMnJpYllhdlZrUnhNVW5YRjhv?=
 =?utf-8?B?djdZR3ZUZGNPUTlCbXZNTUYzRThwazdWMGZqTCsxMnR5ZXZOeU85U1J6U3Ni?=
 =?utf-8?B?UDFLT3JROEZUcXZvRld4Q0E0MlVIODdoWnpEMjZSV25ESG9jT0taUkdVTlRH?=
 =?utf-8?B?UTNVYUx1QXpVOE1PNDdzSXdIbjRrZy9YS2JjU0l6N0owOEpZMUdTOHJNd09s?=
 =?utf-8?B?SkxSNXVWc09qVktlbCt0TmY4dkdTakZwSXljZWFSYVIydGFIcXJGK1V1WTVZ?=
 =?utf-8?B?YjRYaGVWeDlncDZsRmZnYk0vVnpJNFRRQmhVUHplR1o4VlE1eEt2aXJGdFNI?=
 =?utf-8?B?WWEvcTVFWnRNRzNJbWViSS8yVUZNbUp5bkUxcnFDNmlRWkdsVDNLZEFqYVhH?=
 =?utf-8?B?UVJIbUFYS1JIQkZnYWVrUmdtOHRmWVp2VmsvNVArUmUweDZUakIwdmwyeEZD?=
 =?utf-8?B?ZWZYVjd0RVhxeWgxTG9kSHBEMDJLaWplSFFYa0d2MERPYTJUUTJEaVEzZjZI?=
 =?utf-8?B?NG5IQ1dDN21vVGx2bUhHZmlWbURHZHQ0Y3p0aGFWaDF6SnhTWCtrbTh6dmds?=
 =?utf-8?B?ZDVybnR3cllvczVqRExXeDhsWFVTY3cxclRjdm9mTWNPRzJIT1dHTjFOUHpk?=
 =?utf-8?B?UVNTTGlXZjF0b2VrWDJDVHd6TzJmbm0rZE5qZHphUEVCRkhJNFRWTGZFS05l?=
 =?utf-8?B?dXZKbUIzdHdOd3hIcmdtUUkyR2QxanIxWU84R1g0aHplNjc5cmU5d2FQMUFi?=
 =?utf-8?B?QWZxKzlRUzRlS3NucFlRNXpWQjZuRkZGbXJXQ2w3cXpwTG9JY3dod2YrZmtz?=
 =?utf-8?B?VEFwZXZYdWdMQUU3YnNXNEJhd1JuRDZ6NzViTjU1aVU2MVlDWmVvZlVJQTBR?=
 =?utf-8?B?YTEwTEc0TGxFaGlvVmR0QWcrbW1kRm1jL1d3VDdDNmdKQzJLR1BDZWtBUFBX?=
 =?utf-8?B?U0JGTGdlUTg3NU9vVmkrVHhHVjFQZWFOdUZVTzYyM2F2YlZNOUZBTTJPSnFN?=
 =?utf-8?B?ZFF1eHRMM3JJTndjSzBUMkh4Vk00UDFjZTdZZFp1eGlBTTVjekdzMGE4aVZB?=
 =?utf-8?B?T2RGVGhvT2xlMUQ0am5Vc1RYRTlodlpCOGZPbjR2WGFwdzVUWTFNZEovcXdx?=
 =?utf-8?B?bHZVUlFENGtoRlRlMkpPS0RXM2Z4QkV0N0UvdjFBbzVocXZnV3NHcmVVSjU1?=
 =?utf-8?B?Tkwvc0ROQkFBRk5XSzN4bHZnK1J0WE5Ia0xXdlEvWXUwUXM4ZEpwMjVtZjl2?=
 =?utf-8?B?MFAxV2ZuczhwcmZMY1Q2SFdTNzBzOEVjbWdLN0tsb3J3dzZwTUpFT1htUUR5?=
 =?utf-8?B?aHJ4UmNabkNncG1QRzhmOTF0eThXM3VPeXBRRjRmaU9HMVgwang4RVZyYUx2?=
 =?utf-8?Q?I4h9NbjnSRI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnZGWS83T2dCMEQ5bW5vck12cXhKdFZ5RXpiMUg4VURZYXh0bVZNelJRQVpn?=
 =?utf-8?B?QVkrVW5EdlBudXlGaWlUZVc2VjNGUXIrMFVJV3d6QjdQMVBqZWphZ2hrZkxj?=
 =?utf-8?B?d0wzOVp3TnMzVGVZMXFheU42aGtQNTNpVVFRcEh3Z0h0MUlyRUQyMUtrdFo3?=
 =?utf-8?B?OEVHVE92bERIS25iMWNxVGsvallsYTFsdy9BdkRGWStCSElLQUlLcFBySmgr?=
 =?utf-8?B?ZmFHMzgvSDdMVmtIYjRmWllEY3gxczhJN24wbjFZTWRrVlIxR0p3ZGswRzJo?=
 =?utf-8?B?elJpMDVQeTJ2SGtPd1REYi9HaERyd3ZQaE03ajlPUGxJdEpPSXZnSDNTZzZa?=
 =?utf-8?B?TkxHZC9iSE4zTHJDUGNLcnZmTllnVmhxUDJCMmM3eFdKUVlteGhNaHo1N1Bt?=
 =?utf-8?B?NVBiaUZrN1I4aFVrMUlQYktUK0NidVhZeWVEM0o1L3pZZDVYbVloKzF1ZHp5?=
 =?utf-8?B?anZMcGUxWDl4bitBRUlZWWh6bE5vbDV5alk4SUhUSkFPbE1Pdy9HQXcxNW9G?=
 =?utf-8?B?VkpFTlgrNjgrZjd2bUZmb3ljSGdrWjlmcEJ6akw4Zks4R01WTkI0Rmt0bzBr?=
 =?utf-8?B?WXB2TWJsY1VSSTZ1V1kwYlRGSEpmMjBPV2p3cjJZNGNSVEEwV29hNUN3Rmw1?=
 =?utf-8?B?Nm5xczV0MW9GVHArampzclBnSEpEam9qUHNjQ21IU0Y1VjB6MEZKZUxaWFBH?=
 =?utf-8?B?MU1VeUl0YTRDSlVLNm5IQ1g2YmVWVTZQaFVTZDFTaytYeTJDSktRU0dkVWRX?=
 =?utf-8?B?SzJZM2pNaE0zbWV3NE1MdTV1M0c1dUdmTFBTdlhnTGZqRDRCcXV5WFZiSjFS?=
 =?utf-8?B?cjZaMVQzcUlJWHVHR3VVZmtUQlc2Q0U0ajhYV1dvNmFWdzlQQzUySTgrNnQy?=
 =?utf-8?B?dEQ2TThHb2VMeXJEQTJ5RE5HTkdlSU5nNTNEQ1hpUlgzZkdWbDduMWVySEtU?=
 =?utf-8?B?b1BOb2paSEVUa3ZLVEV1Z25LZFZOZERzTGZ1aE4xdGFCMFFKS1FpRHVqdVlm?=
 =?utf-8?B?bEtndDNUSXVqVytNREJCeG1TQmRKeHdnbTFXYWVRekxhbGlCdkJrQVhnd2tZ?=
 =?utf-8?B?MkRYMkpBTXhka29XL1pSZXJubm52NGQ1aFR5dFJidzk5RHFMYjI5dTVZWVNL?=
 =?utf-8?B?c1doZnU5NmR6akMrblFLYmY5Q0hHRE1MNXBrdk9RQk1TOWFMUjZPbFVCNFZX?=
 =?utf-8?B?ak1odktEZUUwMW5mSFFRZWhvWlU4bURVdFlmV1Y1UzFERkU2QUNQdVZIOWk2?=
 =?utf-8?B?djJ0ZFZuUmJpSDM0eFNTMmx4R2NIZjBKUXBPN0VDOFpIbE92TlNsMkdIOXVo?=
 =?utf-8?B?YVBsQ0t5d2djcHlvblNhUTVRa1M3eFMxdEJuRjBoZ2Iyc0JlTjhhRmRMR24z?=
 =?utf-8?B?TGRTeVJpckxhZU1Fejl4ZENHWGU2bjM5N1NhemptVHJSTk5va2hOTXdQQWFT?=
 =?utf-8?B?VnZCc204OTQ0R1FPUUswN0xRNHJQVm5WWmZmR0p3Si84MnpQUWFKY3B5cTQw?=
 =?utf-8?B?RTBBMXNDeU1sR3piRFdqWDlEWjRMQ3BrdWhHME90NHo1SVJxakozSTVOL0ZI?=
 =?utf-8?B?cmpWNlpZRG41VktJR2tIUmZ5OWNFdlpWZC94NjBuUHBYeGdJMVdsT2hId2M1?=
 =?utf-8?B?c21xZUZJRTBTOE9tY3haWW8wMUsxN29QbUo1Uy9acTgrS09aZGFEYy9lclFu?=
 =?utf-8?B?QVRVSm5IS2dhSlNTalE5SjZGc2cybkl2d0w2dWphZy9vZWVrSUppakR2cUhR?=
 =?utf-8?B?c3U0M1NwaXMzUEhncURIL1BDUktldjBsN3FnZmxRd3RiV2hXRTU5MXI2dU0x?=
 =?utf-8?B?N2dzc2xuRjdTT3BwNFg4R0Jud3Z3SW9aOWNTa3BhbEdpODBjVDY2L1VKSU04?=
 =?utf-8?B?WVRBeHJWcURmVjB2dVJEZVBJTHRBOWc5QVRiQjExSjFENC9VK3NjV01qYTZL?=
 =?utf-8?B?QnEwZDFpTUpnUkFLUS9GVUdvRnpTTzhURFpkMG1VNkcxNUczZjd5NUUvSUdt?=
 =?utf-8?B?Q0NlWm1NRVJtSFd6YWRsWVBsUjBKaXhlSzJHWmRXYWJncGtRUTVQR3VXRWdy?=
 =?utf-8?B?Sk5FcklDNUdWMTEzbXNWUU1MaTlubWpJc05Ib3BOek9TMzhkbDRjUU5XT2Ry?=
 =?utf-8?Q?5X/dgUM+UU/9gtgG6jkX4YIFd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851a83f8-f7bf-4c9b-f8e6-08dd78fb9640
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:20:11.1952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2NlRSc27egy90h/oHPuzJ94+4EkaU6dEcDUBWvLfctPdbAqoniWCh+leGm1AJy1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5FAA0E762
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

Am 08.04.25 um 13:01 schrieb Dan Carpenter:
> Call dma_fence_put(fence) before returning an error if
> dma_fence_to_sync_pt() fails.  Use an unwind ladder at the
> end of the function to do the cleanup.
>
> Fixes: 70e67aaec2f4 ("dma-buf/sw_sync: Add fence deadline support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed and pushed to drm-misc-fixes.

Sorry for the delay, I was fighting a bit with dim after the migration.

Thanks,
Christian.

> ---
> v2: style changes.
>
>  drivers/dma-buf/sw_sync.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index f5905d67dedb..22a808995f10 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -438,15 +438,17 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
>  		return -EINVAL;
>  
>  	pt = dma_fence_to_sync_pt(fence);
> -	if (!pt)
> -		return -EINVAL;
> +	if (!pt) {
> +		ret = -EINVAL;
> +		goto put_fence;
> +	}
>  
>  	spin_lock_irqsave(fence->lock, flags);
> -	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
> -		data.deadline_ns = ktime_to_ns(pt->deadline);
> -	} else {
> +	if (!test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
>  		ret = -ENOENT;
> +		goto unlock;
>  	}
> +	data.deadline_ns = ktime_to_ns(pt->deadline);
>  	spin_unlock_irqrestore(fence->lock, flags);
>  
>  	dma_fence_put(fence);
> @@ -458,6 +460,13 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
>  		return -EFAULT;
>  
>  	return 0;
> +
> +unlock:
> +	spin_unlock_irqrestore(fence->lock, flags);
> +put_fence:
> +	dma_fence_put(fence);
> +
> +	return ret;
>  }
>  
>  static long sw_sync_ioctl(struct file *file, unsigned int cmd,

