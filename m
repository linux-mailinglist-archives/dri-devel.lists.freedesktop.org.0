Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B358C728F
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 10:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDEB10E160;
	Thu, 16 May 2024 08:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lIF8OBSG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1309710E160
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 08:14:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBJwjyFc8DaJ2DVZrfbIgCknMQwFkNNNO7wKxuJQFoFDAX4KJ6LnSduQsN61J6iZG1r47Hu0ud5vB0SYRQIgukYXdM/RB/utu8OfWl42fhOIPlJVMXPmz0tU9i6cdS5i1NF7rT+KG9KkXefqFsxrqnHcNcJDx9fJ9OioFepz6/896Rhy3kbBnpz82+7j2AquE1VdpLquFVrwOSVO88EZ4oIUdFVp60V9v/Lnd/sHdYvNfzYx0gYhyyOl8MgbY1psTLz4VFD4IgjhtKLtryRnhpmIhzHhd7WqqSwbKPatD6bex5Y9DIFHhQIJviXDksj6DpfJ/fpOYbry5zC5jiw4KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMBG43wfknCemQ0HFTcgaZt/GMbSv0hDvvt1lNy6ECw=;
 b=QdmIt1LtLG65ZGEABNY2ttoLhtLwPf/Z2iD/0hD8+K1VvAkphzKTcEj0mnD5Q3Is7OdFLloTTmBGWIlFmVENKXiHuLFw0Yfv1Ivu+D3UvZHo0z2DzpPgxurFKZuqRpgovEUzP7JgW/Yar8ZCD1edPAgoacJWjbaBu5AJADIWd4K0K9eHdoSFmrJHpM1AbJWQMJPQ0KWTkreXWWOl0lDwI6hnH8herNXaU8T4UdfLDhh50jqg61AgV+N0xGe6zg2bgcBa/vhrihW/DYKmC/dXV/jDB82E01fK2fcav3pbla/M2J93riGS9jDb0CMQKr9WQloLxU7LvHk75K1fLFLcyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMBG43wfknCemQ0HFTcgaZt/GMbSv0hDvvt1lNy6ECw=;
 b=lIF8OBSGcb8L8upO6JSy8Zibwfap19TLmSrSc6GuzaL7hKGCupzequyf6EWVAE4VdROUirEKpChq/VK93gj0n4xOWfLUc0TlUGAtPTk4CAkv1VS1nATB7TxSv96fcznCmiIgVNPu059ddJWEfKloB7MtotdSabVR7UIBl5zdOS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6919.namprd12.prod.outlook.com (2603:10b6:806:24e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 08:14:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7587.025; Thu, 16 May 2024
 08:14:26 +0000
Message-ID: <fb65e783-4d01-46c3-8e9e-de40811dafd2@amd.com>
Date: Thu, 16 May 2024 10:14:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] dma-buf: heaps: Import uAPI header
To: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <20240515-dma-buf-ecc-heap-v1-3-54cbbd049511@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240515-dma-buf-ecc-heap-v1-3-54cbbd049511@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0434.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a5ca1d-040b-47b1-74cb-08dc75803356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnJRY1FCaG5aSFo3UGpTVkNuMVZVek5uWk05TmsyWlk1RXlqUHlDRWNpaEVt?=
 =?utf-8?B?T0J4MVdMRVlmUmpzemxLSTlRUHRISTA4R1VsM0tYOUd1cWdmQmhXWDB3RDNQ?=
 =?utf-8?B?QWtxWjhDSE9Zczh6TmhXd1BNc2J4MDNKdGdoWHdLRG1CRThmZlRBV254bElL?=
 =?utf-8?B?cHlGcDR2SHVrbmpVbmdUbGdvSXVCcWg2WkZnU1JtZ2tIMkFZNFExZnhnQkZE?=
 =?utf-8?B?WjZ5MkZ3WnA3d3k2Tk4vN295SVBOTzkyWHpZaDhYR0tad1lscW5iSmRUaWhN?=
 =?utf-8?B?bFhWclhZUElFMUFBZnd5SVhjdFdwZUNoeng2ZHUzY3FmYXliUExhVk00WVlE?=
 =?utf-8?B?RlB0ekZDa096NUZqNmdBRDlBcXNFbW5rUDgwajVHTmZwdGpVanI3OFBnL0Iy?=
 =?utf-8?B?TlRNV2VqUWxTVmNsNDBmS21qNEhGYnRsdDZoMEZHekttbzJJT2xLOFJjYURi?=
 =?utf-8?B?NVRIbDdadDhjWTA5dm9xVmUrVWVZSUdUVHRqdldRdkVGU1ZPeUl6V3VHcnc4?=
 =?utf-8?B?VmdjVnFVdk9mNVNMWHBXL3NoU1VnZWhET2UzcnBTdENWUHJFR0tXZk9QT24v?=
 =?utf-8?B?WEZtMitoQ25WcGd5LzlqaDhiTGhON09lcFdmSklSa2lRWlF1QmFYSjA0SFR4?=
 =?utf-8?B?UXg1b3p4WlBmcVViWkk0bC9jeEIvUFpDbEJ0TTllNE9pVjU5YXlUdHNEbERV?=
 =?utf-8?B?RVBOSkhUNkpXbkdwZ2dmVjFEUzM4SldyV1FIMHdmRmhISlZOZ0ZTM2hFZWFT?=
 =?utf-8?B?UnN3bDBtblEzWGR6VVZyazIyd3Byejc3ZCtNZFdjL1FhcGpTekpFWlZwb1dU?=
 =?utf-8?B?MEw1OXZYMkNJU09JV3FEZHZQVlhqV1N3WDhPOWJRM0svU2JCTWtIZGpwaFRJ?=
 =?utf-8?B?YmVlMFE3dUxPaVA0Wm9VTnN4MllHbk9KdG1XZTIxdXNjNDl2dmd6M2JkdGQ4?=
 =?utf-8?B?b01BQVIyMkpFK0xvTEphUnZGaXBUWE9mYUhNSENJV2RWK3hVYThEcXo4L21K?=
 =?utf-8?B?RVVFMy96MmxMRi9kQTR4bzBNdG1xcDNLVUFkb2hTMVpxaXNpRGdkK2tmRVVY?=
 =?utf-8?B?QzhTU0pZK2dCb1h5SEQ5b3duTkVVZHVCWHN5RWtuVlpKeTZmSEk0U1VQOFpH?=
 =?utf-8?B?L0g0YkJPSWNRemY2ZGprS0w3YVpMMUJMZUtLblM1anR0OXZSUXpDN1hENmdz?=
 =?utf-8?B?TnBKZEhQeFlPY0lRYjl5aWNJcTRWcmNSQU1qaUFwejA1VGNDK1UweTU3T0NL?=
 =?utf-8?B?ekRyMmtoaFZZZjhHc0VPNmhaWGNsczB5VTljU3F2NU44N1QydEt1U1dJYU1X?=
 =?utf-8?B?UkdPaUo0T2JSaGRqN0lRK1k5WEhMUFlmQUVnckFkMnRpaHhTbklrZlgxNlVt?=
 =?utf-8?B?Vno3QnFkRHFVempmc1dlaURUejBkMk5lNXZoREZzdUI0dWlaSDU2c3JPRDBJ?=
 =?utf-8?B?bVRtaFNza1FwS0tvY0U3UHE1eXNiUEZmU1JhdWxqbDh3UnZrZU9sdzdEN3Ur?=
 =?utf-8?B?WUxDRFByRjJFYTYva0lrbEhIeDFJcXEzRXk1L0I3bG44NVZBcENCeUpOVGdJ?=
 =?utf-8?B?UkE4OXZKbEJTbFVIdUsxQkM1U29GVWUvSkx6QjFyZjk1b00xMTJwU1BOeWNr?=
 =?utf-8?B?QnRQZUMrL0x3MzFKSkRkTVkrV2FqUGxUSkVxSXdTc0JEd0gvWjF1N2pzdExt?=
 =?utf-8?B?Q1pnLzdxOE9RTWMxSk5wRUZaR3RpRG9aUnFUVk5GSWZHbFl6OHo2Y1B3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THpmcUZIK1BvSkdaZk9sM1J1SE1tb3JWYXRmRDgvL3RHMHZxVFcyU1R3K0NW?=
 =?utf-8?B?b0V1dlNZalFVL05iOWlFcGJNM1Z5WWRYNE1DalVsSkpZK0pOWjV5TDMvOWV1?=
 =?utf-8?B?a1dZakRhVS9wa3lqNTkxckNhUlNGS0FIa2RaMDVvNElERnVhMHNjbEU5dnZm?=
 =?utf-8?B?YTQxazJESS9FdUxCRml2eGI0eWk4NzdNL043L2dLOEEyWXZtbkNmQm1ZUlhs?=
 =?utf-8?B?dUozZUtUMVg1Y2FkQWo5VjVSNnlZZVorYU1ySDZXUDVDRFdlMmc4bklidTBY?=
 =?utf-8?B?Z3JiSlpWQmN6NTZmMEdzV2RsYnkxd0ljM01rM1pBbkFiUGVtN3lacHE5aUxa?=
 =?utf-8?B?UWVoQnVNdWRCT01sUVFkZE5ZTjhtN2tHdkczQ0FySWNITlpvdEllQThzemx4?=
 =?utf-8?B?cDhHV1FDdXdzN3dUbTFCeHVMUnB2SnFZcTBrajROanhsYTJxTE9IZXRLTEZH?=
 =?utf-8?B?bi9EV0hDKzBBSnB2dnRIVDU1ZFBTckNSSi9sUXE1LzFYR0RNWERHYjczelJD?=
 =?utf-8?B?YjMzZi9sSHVwcCtRbmp6Nkc2ZERpWEZmVFdjTFJzSUplQXl4Y1oxMUR5M3J1?=
 =?utf-8?B?bHlYcGxMYmVBUjhtbVZvK1dRVWxJQisvbDU3ZlQyUUUyckMzeUdUWFV4eXlV?=
 =?utf-8?B?bzFzWXBkRFhHWmpiOWU4eUs1NmhsY3JENWJIM2RHWVhFQnVlRHJza1JYNngr?=
 =?utf-8?B?cFdTWFEyWkE3NG5nZkZiWFpOYXBpOVE3S2NocFl5emVvcGl4eVpJdWRkQ0tM?=
 =?utf-8?B?cnVqQzhTWXByNmg5aWQ4WG9uQTlHM2NqdFE1aXlaZ3ViSFZvMUFFVG5PYU96?=
 =?utf-8?B?Vi9YR3FvVEY4Q2hrK3hCZFd5NjBBNUVPQm9BVTBmVVJ3WUVlMmNlVDdJa0Jn?=
 =?utf-8?B?dU5BUW0vRkViL2lnRWZabXg1bkE5RnZxdnNRb29YMHY2eE5TZUNmQzZTR3RV?=
 =?utf-8?B?eFVYbUVFK2w2N3orZUFkRW5rUVBnNERwN0krVnE0a0VBbVhTTHFxL0pSTWpm?=
 =?utf-8?B?Y3IvZG1kb0Q4TmNoMG91UVFUNnk5eXlscjdobmJCYlBSd1dvQWFjbnIwRmJH?=
 =?utf-8?B?Yko1RUR2ZXJCaXg3REFRNDNxdjdTQUJFNGQ3VjNBa0RvQTlRSlNaakJYYnJq?=
 =?utf-8?B?TW82dGE0NFBDN3RJL1JCQXVqQSszZ0ZSQ21VU1RBVkZvMjZqbkJRckxFYjI3?=
 =?utf-8?B?M3MwU21qWHBwSlA2ZnZqNU9TUi9uNWNkMkxrY2xhdExDOEhOWXVZTlJub3ZT?=
 =?utf-8?B?SFFwejZVckl2N2xQR0ZNdTVsNitGUHZoTjNwNXpRb1EvT1FNZGI3QnJCekdv?=
 =?utf-8?B?NTRMQVU1aTZ0OEk4dURFMlJQL1Ivdno4ZUlrYklza01NTm9pSVpQK0w5VlF0?=
 =?utf-8?B?Qkw3Ry9TbzBhUmQzeFFrQjRBQjVaQzB4V3k4UUNtbUNHcThQdG9CeWRqckNE?=
 =?utf-8?B?QTViMjJDM3Jra0Q4UVYrdDRTOHNkOXk0M0x0bU9teCs3SmNBV1FXSTBSeHQ0?=
 =?utf-8?B?SFFuYWVXeTZjcExEd2FaN1VNeXBYMVNvTEJlWWRsRHlYSmxQVHVRdmdYa3Rt?=
 =?utf-8?B?UEk5angvVUR2TmhDN1Q4bmhMV0xreENiKzdyTEdjR2ZVUzZSSDA1TjZrWVJL?=
 =?utf-8?B?Zm01cXcvM090TzJFUGs3SzllTnBHcU1rWWppbVllRFczK0o0OCtqY1pWNlo3?=
 =?utf-8?B?K2lwR1dtQlhSWnZsTktCQVhHSU1YZEhlTXFjOE1OR2RCQ3R4ejhCYkNwUytF?=
 =?utf-8?B?MlFXb3o0RHFabXZmK0g4QVlycXErSnpiOTVDZjVRSnFocHRBV2syRFVubzl6?=
 =?utf-8?B?VTZrYThnRXpMMllSaTdsc2h5RE9XbG5KSTkyNCtaZ3ZSaEM3Sko2WDA5MHh5?=
 =?utf-8?B?a1RGZkgydnA3c0JjRVJUMFlISHl4dnFUWnJiNG96M3hLQVJLSU9kdnJWRXRw?=
 =?utf-8?B?TE1xSEd5UFRWa0U0eXVUU1R6T3VNbDhmM3VBVE96V1VvZlcweEhSQ2x0U016?=
 =?utf-8?B?ajVaMW5FMFNDQmRnQW43MGY2UlFFOTFCWEpsTjhEVzA4TzVrTHJKUVFjRW1F?=
 =?utf-8?B?OS9XS3RUUHg1QUw3R0pnNk43cG9xcWhpTThMaXFEOEJPei9wbHUxcDljTG5T?=
 =?utf-8?Q?qMECOjt6x95rhoUVbLLzDbTm0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a5ca1d-040b-47b1-74cb-08dc75803356
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 08:14:25.9895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kEc+Qs1FFJC243aVke/lJVQTun4SR5AaDT5WJ8BLoD312gPudKa0yUnlnJ7gj7K2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6919
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

Am 15.05.24 um 15:56 schrieb Maxime Ripard:
> The uAPI header has a bunch of constants and structures that might be
> handy in drivers.
>
> Let's include the header in the driver-side dma-heap header.

Well as long as this header doesn't need any symbols from the uAPI 
itself I think that is a no-go.

Includes should only be applied for things which are really necessary 
and not because some driver might need it.

Regards,
Christian.

>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   include/linux/dma-heap.h | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 0c05561cad6e..e7cf110c5fdc 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -10,10 +10,12 @@
>   #define _DMA_HEAPS_H
>   
>   #include <linux/cdev.h>
>   #include <linux/types.h>
>   
> +#include <uapi/linux/dma-heap.h>
> +
>   struct dma_heap;
>   
>   /**
>    * struct dma_heap_ops - ops to operate on a given heap
>    * @allocate:		allocate dmabuf and return struct dma_buf ptr
>

