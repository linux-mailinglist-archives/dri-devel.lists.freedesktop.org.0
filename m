Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C547B95C31
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 14:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1586E10E601;
	Tue, 23 Sep 2025 12:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KaqjvfIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010063.outbound.protection.outlook.com [52.101.201.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7833D10E601
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 12:00:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQpLq12Rdg/EC8UWPgTtGMfT/c+dwpmi18fKh5NAsVQxNVNJVBtbvO+iAMe163P6iE7fdHNziQCDY+nLDYFiK83yKN46hiF4XG6qTP455pq+KOZe9yZDeOqJ1ibC5LPWq+MKdfe4VgAXbInQrQvj56e8ErCjCvW5bR7H5OjTubmMfm+Daxzia9DteLaOCL5+BhXWKYFk2pCZFc7wG+U5fsNUf155o4rUb6nG0jH9BuDp6BY1l38XUzvR82fA5iY0uXO+hwcr/Twr30JVNXGsdvhGx16pjSfJ4gs6FwjFTkwu6ZjKr666khsAG4doClP6Y9NPrnghuTbn7cS/+LMgTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PB/0ZdAoPooVgovtzUNOcDGAmpNC0A6Uqa85OrC8zcU=;
 b=U05JdxG3HKucS8II/f3hYEYwhcqtFqmTGT0JrdjX+A/nEs46KfWvvhc9+AEkKhC6h5tTMh7i2nHveOFZ0VHsko8f+f6cKUMxHUMEvAqYDjxYhbqLESYl66FNO4t7Ukgt0HgyFMOYtGfTwG5BWBr6rC8O10ETTpML/1nrpvO0wnocoq2687WHdlamQiwoZQi7zgDTuKfUwFHSrp6vSTXLR68P9LoQgXpfb+ps8KZPLiaglqvhJO6RvhFC5Vx/P217kKi5T1kaeIA0C4RJ5vSQR6jiJC36By6ZkUQCBaTJ7zbaGD/v99Vsv3ZSS8k0BQfA8ubPqErWn3A9Fksnz4LCAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PB/0ZdAoPooVgovtzUNOcDGAmpNC0A6Uqa85OrC8zcU=;
 b=KaqjvfIpYeajFObohdEqHwgTCg2FyauMkuZrk7J0DqL4WakrgaC6AtxwI7FMAFaq0GvnU5OS5MUmuRw3+9FGexoxMSxWtmXauo7c2R+orlDbp/5tM6tKRIaTI8q6e41gabwHGF1CtGh1LWNSUfPAlPd526IDskcU4ogvRx1D7A4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5980.namprd12.prod.outlook.com (2603:10b6:208:37f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 12:00:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 12:00:33 +0000
Message-ID: <7bb48401-ed99-4263-addd-ec1462d68168@amd.com>
Date: Tue, 23 Sep 2025 14:00:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix reference count leak in dma_buf_poll_add_cb()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <aNKBIcpF6kZRG6Mg@stanley.mountain>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aNKBIcpF6kZRG6Mg@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0407.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 746f6827-128e-4338-f1bf-08ddfa98ccd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnNRZEYxQXZrWGJIc3BzdDRQdTVJTUtwUk5oZzZrSmREaE5SL0lESEM1RUUx?=
 =?utf-8?B?YkZiZDZYYlRuRDNxOWtkbkQvL0dkaE5yNHVFaVRCemhlVlJ1aFZzS3pjc1E1?=
 =?utf-8?B?eG5vL00zcklwekRLeElhdURldlRpS1ZLK1pUWkV0UW0yMVVEVWJxa1lRNURn?=
 =?utf-8?B?cGxTdnhacHN5bFJyNHBqWmpBWGVnQ0I5aER3MlVCL3NtZndkYTdQYnYvTlpG?=
 =?utf-8?B?VkVrMHc0NzJxcnJBeWJMOFhRMnVNdFpQRlJsNW0yV2RRNit6L3lNVEdNK0xC?=
 =?utf-8?B?YUlycmE1aVNVdm1NQ2tsbHYyZ1VOOWVEcVdXS2g0ZzJhSkZRQzMyWm5XZ005?=
 =?utf-8?B?SlZyeExiaUh2MnZUbVVOSDFmK3JvanNPSVIybmFRZ1hsM0w3K1hkbHlwZ3dv?=
 =?utf-8?B?VkJuVlphdWxpU3F0dDZLZjFZSzNEOXA4RU80bWRXL3FYbHNIUDAwdEx5TE11?=
 =?utf-8?B?WnZXR2dOTkhQVjNoL2cyeHdQNTVIakl5RTU2QUFCMUd0QTdXU0hZek1XS09P?=
 =?utf-8?B?S0IrZDNlSVp1WHduNVJvaXZJdGVFNzNPc3NGdG13bFVWclBvRmJXVXNKUGVr?=
 =?utf-8?B?MVA3K001QmZnQUtNMlQxblozRFladWRWOEVBZEpCLzM5akVMbFQzMy9QRnA0?=
 =?utf-8?B?Snd4SnJlOXU5UlBtY29BSWxmUU8xWmFIM056VWNCRGthakRNK2oyU3kzLzFz?=
 =?utf-8?B?Q3VOQlE1NFQyU2YxVm4vV0hzbXVqV1JjSjQ0RnZYbUNnYTlPUXkzT3N2V3U4?=
 =?utf-8?B?M3NJQU1pRzlaNUltUWtVRGNtVlNDY3NtYncxN0tyZS9HREVQbmIzcVY3Tzhh?=
 =?utf-8?B?V0M2MmtXOExsZXlkQTF4b1lkUFltWkRKOFcvajJjcW9NTWF6WVEvUFdha3l4?=
 =?utf-8?B?VWhYS3poSUZNZ3h2bHBNNGVxSFpZUmRCNkJUM3NHNWFxc05ENVVCY2dtZzlQ?=
 =?utf-8?B?SjVQdTF5UDhOdDYxUlNYZjdRZ1RNbTRDMUdWclg2aFdWU2ZVRUYrMVBVVDlJ?=
 =?utf-8?B?S1dRSEFLU1FCUSt6aDVMa3lxR3FpcERlVHo4V25iNWhKaG5qcVhGZit6c1lB?=
 =?utf-8?B?S0s3QzMyNlhCYWxOV2RhOTA0bWFIckxsSkx2aFFjNVhmQ2NkV2Y3THN3TmpX?=
 =?utf-8?B?TktkOTdmeVRTMmp4Y2xwanhTcEhuRHVVU0pSbEZ5Z0dnV284TTkzb2ZGSTM5?=
 =?utf-8?B?TElvUmFpdDlzczUxMG0yR1V5VW1pT0NNWEJ3ZWZudjc0WW1zdndkTGo2aXZC?=
 =?utf-8?B?OUFkVUI2WU4zR0JYQnRvUVZLZ1FDT0xHTUlwUDc2SlFCbjlJeTJBSUNaSmlK?=
 =?utf-8?B?VEF2bUJKZ0lGRGJiUjRRYmo0WXVZd2ZLWGJTUDQ4clhPcmwvREhYbWUwQUNq?=
 =?utf-8?B?K2FVL0UzZEFyNWRJQ3M0QWRoS2ZSNy9ROXhpNXQ2T3d5eGVBaWQwMCtXb1B5?=
 =?utf-8?B?WTJaNjhRQkZOcldPUHNBL1M4cmN5TmVlVGRmL3poODUrelpOYnJ3SDNnREJB?=
 =?utf-8?B?NXdIdVhRdGJCS28yYXg5bzBkNmNtQngrc0Z2aVlYRmlnMFdoRHhpbnYrRHBJ?=
 =?utf-8?B?SDdJTXE4WWJwY1Y2RjhuZTJ2cCt2d0d2ODRScUFmYUc3a2dpaE9QMm9mVGIr?=
 =?utf-8?B?b080c1NGWkk2eVdNWVlWUmVOclVqOSsydDgxcVpVRndpcjJZeGFzc0E1aWhj?=
 =?utf-8?B?Sk1rb3EvOXlaaVpXYXZqZjh5U1podW9Sa0xwSCt1Nk5uOWx3ZU9VYmNlU3Yx?=
 =?utf-8?B?NkVQUzFnWlFWYlp4dUJUZy9vNTNuN21WTHBRSFN1UHB0Y0orSHd2WlQ0OE5B?=
 =?utf-8?B?ak1aK3R3bU9oMEhqY3lUcVRrOHBFVDNLeGZEYTZ0YWZiODVmVjU2U21GanJU?=
 =?utf-8?B?TlZwRENqb3kwYnVSTitWRFRyUmFRVm15Q2xLSzNNWndrWjVqK3RnSCs0NHZl?=
 =?utf-8?Q?og8VjhEv+Z0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG0vaDNZOTF0MVNNelVsTzVFWmpsd0xySzVIVFFIYUhrWFhPcUZyK0lpVitK?=
 =?utf-8?B?Z3lhUUQrU3FIaU1kQTlvWUtod1ZpSXRaemVrMmNTb1A4K2RzU3VGQ0pMcHdp?=
 =?utf-8?B?QlVxbndiQ01PRytMUzZqemhCL1ZwM1l5TnMyMUdqek1lWXBmWC9CS2laSktD?=
 =?utf-8?B?a2k2R0VWT3VUQ1JqVDhxc1YzeGlkbmkwR0o4VWVhd3BoRHI4VjBPK1Rzcm8z?=
 =?utf-8?B?bTFNejJYb2VJNDd0T3Y0bWd4YWlkcUpkaFV3MFBicDdPRDhlZ21QMitwSEtx?=
 =?utf-8?B?YytWTlF3ejREN09XMUFvM3dOV0QyY1NUOXpLbGlvWU1VenpNMmdWai9FSUJi?=
 =?utf-8?B?T3RmQ2w0M1p3SHp6ZFFpY3I2QkYxak12V3djR0IzZVRwempTdi9HaS9zSlc3?=
 =?utf-8?B?WjdMdXBiNklJUFoxTFNPaENqMzNnOGJhS3Exa2RDR0g5WFpSYnc4QkRYTzZ6?=
 =?utf-8?B?OHJic3lKc2xjRzFWZldpczNqNTFYOHo3UW04aCt2dWR4VDYySkJQdlM2WEcz?=
 =?utf-8?B?VDZpM1hWODU1djlkYW5iT2JyVkVTVS9WQll4ZEpHUlluMDErZ3hVeFJUMGN1?=
 =?utf-8?B?K1lxOWo4YlFFTUluR3U4Wkc5TzgvYkJBd2tVcEh2amtBYUhSeFB3Z3dzR2xT?=
 =?utf-8?B?MTkyWkVkR3dtSWliSDZDb3JGRzVmVTMxd2QxUzcxU000RjJzcnFZbll0dEc3?=
 =?utf-8?B?LzNROVZtSlQ3enJ1WEpiU1RYR2J0L2ppdC95eDhWcng0ZGhvVDRmOEs0ODMv?=
 =?utf-8?B?VHFORUdqSWxhYUJjakRON01aZmZudWpHeXdTVXlYcmU5VnI0N0dPTlVJWmpF?=
 =?utf-8?B?emtucFR2OFBFRVBSM1phSm1peVFueWc1RUFtNk9GT1lybnd1ZUxiSUdxcHJi?=
 =?utf-8?B?UFYyWXlrL01zNmppazBIaEN4OVlMNytrWDNuQWdTSXNUZG91L0s4UnMxNUpt?=
 =?utf-8?B?Z0RFS2R2ZjB4c3k5TVpKczlSWjlhU3JnNFI4UDlvZk5SYWkrS2NMVVc4aE5B?=
 =?utf-8?B?MUxtS1NFMzdLaG4weTd2WW55bWZWQzdPNFZHaExUbUFrRnFsYjA4aFNRT0kx?=
 =?utf-8?B?akZPanhpQ2NLczl2WWZKRWVsWFdyK244Z056TTJicEhsT0QxdlM0aG42b3Q2?=
 =?utf-8?B?K2svdi9MTlZCT1Z1djBDblZEaUdhak1mUXErNkJCM1MyckUxdzdTd1ZDdzRy?=
 =?utf-8?B?SVdjdE5nd1NPS3VOZlhtODBkT0dLQUQzRnM1NFVXeUpselJ4NTYrZjFxNEhE?=
 =?utf-8?B?bHpFaXBRNVNLMFJzekdha2sxbm9QZDZ2b1JCd3dSdTNFaUZ3NDJrQmVJNnVh?=
 =?utf-8?B?WkxLVllOb0VqdWt2SGNFSUVpUTROSDEzL1gwQ3RZVS9IUTJVR2FVR1F6YlFZ?=
 =?utf-8?B?TXBTU3FBRTFWaEhZVjNpWXVpMjN3MkpEbUQ0K0tuOXFMZ1M1V1p5ak1ycno5?=
 =?utf-8?B?azBvaHM2L0RsQnhxOCsvcTZ2UWY1cFJlUTI0ejhyOE1RbnVLNzVSRTkvVkhG?=
 =?utf-8?B?b1pUSjZ6VnhPY3FEY0NrYXVYbXJReUluc0xMTXRhUlpMOUd5SUZSODNvUUFQ?=
 =?utf-8?B?N1FuTGpHYVZSanlOSDZ4bDFRUW9HZzYzYW1YVDlqSkVORFJMOHhEUVoyc0Vt?=
 =?utf-8?B?Y0MxMFhnQVl0dGprR25hSjhTSUxEODVFNHZ3T05ZN2FuZUxPbkRTaHdCUWYw?=
 =?utf-8?B?alVBdkpXdEhVMFpnTG91Mmxqb1kxNi8xY0o4ZURVa1ZHdlA5KzlGd3RiTGU0?=
 =?utf-8?B?YVcrRzVpQ3hBbXQ5MHpnRmhHN2Y5U3RBVFVWTWUzTDBYQjhkQmJYT0RxOFdL?=
 =?utf-8?B?R2dYdHAycHMzZWU0T0NpSkp2di9KQW5YWlgybDIveVkrSnVXdnppMUwxaDJQ?=
 =?utf-8?B?WmdHT2xXbzltV0RkbkNWcFBidmJ0YzdzSDVSREhtR3o1UE5jWVd2UUp0bHVy?=
 =?utf-8?B?ZDV4dEM1MG5IMUI4cTl0V2d0ckZWeENaNlhmbGxydlZBVEszMzdqVjU4WWtZ?=
 =?utf-8?B?YWE3V0RqeVVrQ2I1VTlxZ0RYSTRoTG1uT0pkcEd2RjhDNEowWW10ZFVLak9x?=
 =?utf-8?B?UTkzajJkT2MxU0kraEFpOE5sQUpqMGtvZno5QXQwamI4RXFzTGxSVXhqaWh2?=
 =?utf-8?Q?RiA46wAsKP8icelMX99T7YnOz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 746f6827-128e-4338-f1bf-08ddfa98ccd0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 12:00:33.7745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtJGthjRcHQYwnZZfhKJ5o67r1Nbdji4prnhkHKAQuzwPU37Ad1BKu2ECt5j53pg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5980
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

On 23.09.25 13:14, Dan Carpenter wrote:
> Call dma_fence_put(fence) if dma_fence_add_callback() fails.

Well that change is obviously incorrect.

When dma_fence_add_callback() fails we already call dma_fence_put() and drop the reference.

When the dma_fence_add_callback() call succeeds the callback will drop the reference.

The problem here is that the return code of dma_fence_add_callback() is an integer error code instead of a bool and basically has the reverse meaning than what people usually expect.

I have it on my TODO list for years to fix that, but never found the time to actually do it. If anybody wants to volunteer then please go ahead.

Regards,
Christian.

> 
> Fixes: 6b51b02a3a0a ("dma-buf: fix and rework dma_buf_poll v7")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> From code review, not from testing.  Please review carefully.
> 
>  drivers/dma-buf/dma-buf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 2bcf9ceca997..a14e1f50b090 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -301,9 +301,9 @@ static bool dma_buf_poll_add_cb(struct dma_resv *resv, bool write,
>  				fence) {
>  		dma_fence_get(fence);
>  		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
> +		dma_fence_put(fence);
>  		if (!r)
>  			return true;
> -		dma_fence_put(fence);
>  	}
>  
>  	return false;

