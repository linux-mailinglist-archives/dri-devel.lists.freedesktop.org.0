Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424769D3C94
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 14:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C6810E3D0;
	Wed, 20 Nov 2024 13:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Tq9WZVEv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECBD10E3D0;
 Wed, 20 Nov 2024 13:31:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQuHoT7w/T41W13fZefZETIhSrsWO1+vLsO6qYy7is6ED7R2sYVGo0HZHhvvU4e2lvlBZNRwvhwo/mjDERh+p+vqLkc/VWOYucA70sftM7KJvW926Xqjb/AtQfU9jvmPMw1isIlZyuT6+ukc+mFLEt+RWmi/92O3Gic+oFPFHaa28xM3ppezU+1keCal7EDk/n062FObtTcnAtAJA4Hyw6Z0pTxhNSUCfX/7GXMwg7cYGy2jHr1l98K1I1S11HS4wy2i34hasZ39Ywm0wK5A/j0eS+4KQeTR+iOQk5XYNNJ3JVAW3uE/u8A3W+lF6QfrowyZuwvMcw+VQkbsdA0KTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epLXk2+DZbBiRP4bxYRkHuuBGGDyNN87xjIKFkMO5Kk=;
 b=dzAT1f6CJxG+BGxx3CZ4HuqGzhP0cdzHrQnsvMwx9Y8yoClxFh+BHTULZhY80v91NmoRwqzbTUopfQLiFaKDipxOSzPeuovYUTmlZ6ktYS/rv3O5cY/4OLrb4hObuq32zI7/9ZB4jkmpINSRCL+tqoq3JslpvGAQYZ6T8xen9LPVoY10Xdm+y/b/WSLEaqJaAkAvX/D3g+wn4ysNEiDfgOJqkC5/f9cT1P0+PDbn7gbKk9isfVYG3kvosGMhY6ug+HCrKDUNN68aq4uvceNARMe4JwI35tb2J9LQ0fMBg3wicFqm58CtWkSCMI6UkQttToR/uFlRRFZrt36vdC+tpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epLXk2+DZbBiRP4bxYRkHuuBGGDyNN87xjIKFkMO5Kk=;
 b=Tq9WZVEvjVOUnAphpNyk4zC9405d/VRtE0tAm1jAo8Poy2kWrttGmO9g83NENopzxeAW3GW/xeSvWM1z8Sdt87UbrbSBntGQgztAztJLfMykM22Pgeq7XeAo29mC8EQ+R93y+OQnQz4q8xHab0jG4BDlNi7FSlvSRuyP00ciaSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8913.namprd12.prod.outlook.com (2603:10b6:303:247::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 13:31:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Wed, 20 Nov 2024
 13:31:56 +0000
Message-ID: <431e53fd-ab98-427c-a6ed-6c2907438952@amd.com>
Date: Wed, 20 Nov 2024 14:31:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/29] dma-fence: Add dma_fence_preempt base class
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, mihail.atanassov@arm.com, steven.price@arm.com,
 shashank.sharma@amd.com
References: <20241118233757.2374041-1-matthew.brost@intel.com>
 <20241118233757.2374041-2-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241118233757.2374041-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e2b6680-be53-432e-5665-08dd0967b413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkN5WmVEKzFPVlVOWDJiakJ0UDNCSmtxdGdicFA4cDhkNXc0ZGRMTXVpVXZO?=
 =?utf-8?B?QURnUndIaStmMkFyTlBWVktYTE1CYlNFQ2VtNUp2cUVUczROSnlBbzZDUVo1?=
 =?utf-8?B?OG9UckRaSWQxTHc2K0c3enFoRW8zWjdvbldBTFZRa3dCTjJ3VmluYzBBSmpE?=
 =?utf-8?B?MEVGVlEzVDJxU0llK0JjVGZlbnhISVdnYzFzU0RzY3NoMmU2eHp1cXl3c0s1?=
 =?utf-8?B?TlZtYTViSWUzdnprU2tkQ0hkMThFTExiMzdWb1pkcFBYTFRqQUoxRExSMkF1?=
 =?utf-8?B?RElpdFUyZGdIeGZ5MnRQaEJSZnlwT0VNL1VMVmxBWkdYYXhOenhyTURnN2NL?=
 =?utf-8?B?cDJHRTBlTml6Tm04cmU4VWpWZmRiOU1pYzJTZG4vNDViQVAwQTB4YXVPNkNY?=
 =?utf-8?B?UjNwZ1FXckxGb0ZSZ2N3UXZKUHZVQ1FmZ3ljRTZDZDM1R29hVkNlL0loOXN4?=
 =?utf-8?B?Y3lKYmMwa01qUGNydjFUR2RKaUIzQnd4VURJeHBaSTV2UWNHclJwTENibmt4?=
 =?utf-8?B?VmhCZk1QMmZqWXJKbXF1UnNwMlhlUDQxYW9YRFhiNnhPcHo0RXpxYnhYUnJ2?=
 =?utf-8?B?aDRSQ05ZRHZPbWZ4MEpESjdxN0dtUmVLOUhaemlaWjg4dHlaeHB5aWt4cGJP?=
 =?utf-8?B?M3BWbUJha1NBR2JSVm15ZjFTeTBxL1ltT2ZuM1RRaEpFcjJXb2tLOERVK3c4?=
 =?utf-8?B?djAvOG5wZlpBRTBjYkpOTXBjVkcvZkczNW00N1dERllKTDJMTmFsWlZzazNI?=
 =?utf-8?B?elUyTkZ5Z25DSmh3UmdBU2lpOTlJY240YVo0STc4Skx6UkN6RUJvaGhkaXpr?=
 =?utf-8?B?MVJhRWd3R3JUcFU2d0JZakEzMVdGRy8xYUFiZ0N4ZEo3dWQ4RGJIdnp6THVh?=
 =?utf-8?B?Y1I3bWZZSzF5RFRvMU9zZSt2RCsvTStRMDFnODdXdzJmS2NZcWRUQVdwaXBD?=
 =?utf-8?B?TWtNT1lWdXZQTHdVTm9sM00zUHlBVVUwaG5YM0c0VzRCUkY5U0ZWR29lUlBC?=
 =?utf-8?B?OW9pVWVEdmlpU01oWStkd0h4TFRxUU11V1QwbzVxeVA2aUVhVE9mVDZVSW5F?=
 =?utf-8?B?RWVKcHRsSFdhNFZNdFcrQWhtSmRUcDM3OXI2WGE2TWJmT0dJWEZydGs1T0tp?=
 =?utf-8?B?a1ZueGRyQ3pLNFdKN2xIRXQyRzhUUTNLMi9PTGViTkVrZmtHdDRZaVBRbGRB?=
 =?utf-8?B?aDVGSktCd1Q4bXJGSWtvRm12ZzlYcyt2V2tTTE1XRHRCekhKeHNuVkxwVVNz?=
 =?utf-8?B?OWNBL0J0a3JxVnNUK3ZNZmVYR25YUTdiU0Q0Q3lHb1lJY1hyRHNHSlZkRlc2?=
 =?utf-8?B?TUlVN2Q4OTBqd2VIbkxXRCtWdGZ3LzEwSFpVanc2WHVjSllsVSsyMVFKVm02?=
 =?utf-8?B?WVJKdjFMYUt6K2xwSkdRNTh5WHd2dFZhRk5hb3IyTkZvVlN0bWNQa044S2Jt?=
 =?utf-8?B?Q1ZsamlJSCtaclZITXlOV2RJVkJ3ckw2V3lVTE1YZVJuRlZQRDdXbFc2ck5L?=
 =?utf-8?B?VnUrd3BCVXRXL3hmcjZqSnQ2Q2Z6MW90SWNLcEJmM3dzNEozZ0NmVC9iS21v?=
 =?utf-8?B?cHZOU2sxeWtLaFJKY2VueThnVGF3TjFDSWliOGhDSDA4KyszbFV3VWNSYlJZ?=
 =?utf-8?B?aXd1K0hWVCtLc1c5ZXpiWXd6UHRTeWJtSzhNK0xXV0RiL3hYd2RITFM4Rzdl?=
 =?utf-8?B?ZlRqRnNzR010VDBlVW92VjJpZTlnelVjeFlVK001RlV5ZWd5d0RUNlRZT2FB?=
 =?utf-8?Q?3DdpIFKk3w/0zXoD8HfvaqQKp/N4xbg9QMpYymL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHMxdTRqOG5mTlVIallMdnBqQnFoMk9HVHl6ZTNzRzZUNnRxMVJLT25tYU1J?=
 =?utf-8?B?UGgrMnVGQTBjUnArdENRS0Z5b0lpTVlrZ0xzMlYvdzVhOW9CNGd0RmFGYjNO?=
 =?utf-8?B?bENFU1lWT0E2MVNacExkeWNrVyswSlVCcFM3QzlNN2V4dzNyaXVhbEs0QTdw?=
 =?utf-8?B?Y2YrZFRiQndxMEpFRUhRcGkwbWw2UkorQ2d0N0daQm4yL2IvcmJOWmlSN0NI?=
 =?utf-8?B?TFZMVGhLTll0enNCeExBdkoySmdveE85aGJ5c3BZOHFlU213b2tpZ2tvTDJp?=
 =?utf-8?B?T2FVYUNuMll3M1ExdGcyTllCS09mSXBUOHVoV1dXeHRXZjBtTENsQzNzdm01?=
 =?utf-8?B?VUQrMFZMNExwY0xuUjFXeFdydUZKYzhEc2NOcm9LTzZadHhnSGxmcG1uemM4?=
 =?utf-8?B?cGpQaUtPS3pKckVmZm1zSFAwSE5lcHlzdnJaNWJ6SW1aU1ZhOFdNNUl6emxi?=
 =?utf-8?B?d3VCdWxQK1dWdFhIQ0lORlFjVHViS2U4TkJSQVB4eXQrUXZzbmE2UEV0Wlli?=
 =?utf-8?B?a01uWlZQSnczd0lHUlNiM2ptcFJ1bEJmU0xIOFNXazhSd01YVGNSVTVEWkd4?=
 =?utf-8?B?bU13TWw2RVJDY0thMy9ucVJnZnJ2U3htMFg4QVNFZ1BKQzcrVHl4aFBwVnd6?=
 =?utf-8?B?bzh4RkxJOUJrcjBkZWJIUXQvSkVCUHNBNno2TDN0dGFKREw2YjR5WFI1Nkh2?=
 =?utf-8?B?K2RPRTVMck95dDdxS0ZLSFFYajJxYVQvTlZseWZIRWZJd2pwSzRIYU9OQzJl?=
 =?utf-8?B?alZENE9aK2ZCUVA4OUYxMnlJdjVDVmNpazZmM1BlRXBTTi9KYmFJZGM2WkRx?=
 =?utf-8?B?VW5rRzI0OHJKRWM0WGZuN3pOS1YvczR6NjRCMjRVQUlFYU5QM1RRYXlwVm44?=
 =?utf-8?B?Y2JzcFpLd0p1aCtkSEZYbEVQVzZyeTlJb0NSTFFJUnFpRHNHSjdpazQ2MEVT?=
 =?utf-8?B?dVhxVmh3VUpCazhhWjROZG92VGlZZVo4NU43SXo5YlpOeFI4ZjkxQXhZNzla?=
 =?utf-8?B?UDVaZlA5S3lJUEVmU21sUWN6a0txK0xoYno0R1pwanRWanFNelgrY1NzZmRr?=
 =?utf-8?B?bVJMb3JvTzRDa3hTT1MvUG1hYURHT2hzc0JSOGI3RmRXVUFaNVdjeFkyVjA2?=
 =?utf-8?B?amlOZnM4OEJPUHVrN1kzZlhEYm1UR01qQjVRenRudXBTU1pPVDlxYkxhbHM2?=
 =?utf-8?B?NmxuQ21FUUdWM0IxTlhON0dJN3lTT2ZMVXhLVHpXUi9rMXJkaTNUUmdCNmFD?=
 =?utf-8?B?dDdyaVY2MTVqcmFNRUdqWTF6RHJpQ3A3Nm1kR2tBSWNPUnFuU2UzZmgxYm9v?=
 =?utf-8?B?a1VYQkVETG8xOU1QNklubnZGVnp1TnJwTXRzNFhQamUzQ3lvMHlYaUZwdjVx?=
 =?utf-8?B?NFl6cDJ1TXRtMkNDVUkzcXcwOWJKN0w4YzEzZE81Z2NIUER2aU1oNnkva1Bx?=
 =?utf-8?B?YlN4dzgyVTkzdFl6YTBxVjk1blBKK2E5NThvZTQybHIrYTU3ZDErOWdDanJI?=
 =?utf-8?B?Ui9wR0NhVFF3cWptMkg0YTF0VGdybUtWSmJOdnFMVW1waHVXaFUyRUZ3SlFM?=
 =?utf-8?B?OFBEV1pidVRzVTBYK0g0S0dNemZCRjZzalVqQkhhemIyaXBLQ3Y1T0F4NEdX?=
 =?utf-8?B?bGJsdWRqUXF4Q2oyK0tKci9yVTlpM2hFR3hrdlFjVjhpRDlYTFVNek1lV29j?=
 =?utf-8?B?azVEYTZ5My9WUVZJSEgrYUdqMEIzdG5MWklIT3VoMG84MGFLdTV3THFZZ0Ji?=
 =?utf-8?B?Y0w4UldwdE5BMUc1Y0ZNNHJaSldHYVJkWTVTODZ3M3ZYUmp0ZjB6M1AwRnM0?=
 =?utf-8?B?T1FlcGNOeEswY1RHUFVrby9NS2N2UXZrYUhEeE5ZclBPY3RTSVBUQUQ0cEFN?=
 =?utf-8?B?ZFIvQmt1S25pUUJBUlVubzhUK0ttdUdJbnFGWExaWmwvWDlkeWdhRlJvMUd1?=
 =?utf-8?B?Q29oZW9lVGdMcTBHR0M0TVRWMGVUNjlnVlAxZGFjWlUxbTQybEVoai8vQUgx?=
 =?utf-8?B?cjEvNXVCZmxzTXpjWlgzcWNISVNic1JpYmt6ajZ0cjdGTGNMMmtydnBNNUdH?=
 =?utf-8?B?dHgyVzd5SzhvQ3FieEUrdlBxenhlKzNCT2VEK3ZQYkZyWWpXbWVxRyt5L1dB?=
 =?utf-8?Q?xvZj5ChVsoIeKFmUPIFAhz+Es?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2b6680-be53-432e-5665-08dd0967b413
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 13:31:56.5246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Spjh0b+ohaef+nrSHkmU8N/wvWAkLjAbMKRQ07Xg0HM12ghKW0qOeu5dohHGEnS/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8913
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

Am 19.11.24 um 00:37 schrieb Matthew Brost:
> Add a dma_fence_preempt base class with driver ops to implement
> preemption, based on the existing Xe preemptive fence implementation.
>
> Annotated to ensure correct driver usage.
>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/dma-buf/Makefile            |   2 +-
>   drivers/dma-buf/dma-fence-preempt.c | 133 ++++++++++++++++++++++++++++
>   include/linux/dma-fence-preempt.h   |  56 ++++++++++++
>   3 files changed, 190 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/dma-buf/dma-fence-preempt.c
>   create mode 100644 include/linux/dma-fence-preempt.h
>
> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> index 70ec901edf2c..c25500bb38b5 100644
> --- a/drivers/dma-buf/Makefile
> +++ b/drivers/dma-buf/Makefile
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
> -	 dma-fence-unwrap.o dma-resv.o
> +	 dma-fence-preempt.o dma-fence-unwrap.o dma-resv.o
>   obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
>   obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
>   obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
> diff --git a/drivers/dma-buf/dma-fence-preempt.c b/drivers/dma-buf/dma-fence-preempt.c
> new file mode 100644
> index 000000000000..6e6ce7ea7421
> --- /dev/null
> +++ b/drivers/dma-buf/dma-fence-preempt.c
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/dma-fence-preempt.h>
> +#include <linux/dma-resv.h>
> +
> +static void dma_fence_preempt_work_func(struct work_struct *w)
> +{
> +	bool cookie = dma_fence_begin_signalling();
> +	struct dma_fence_preempt *pfence =
> +		container_of(w, typeof(*pfence), work);
> +	const struct dma_fence_preempt_ops *ops = pfence->ops;
> +	int err = pfence->base.error;
> +
> +	if (!err) {
> +		err = ops->preempt_wait(pfence);
> +		if (err)
> +			dma_fence_set_error(&pfence->base, err);
> +	}
> +
> +	dma_fence_signal(&pfence->base);
> +	ops->preempt_finished(pfence);

Why is that callback useful?

> +
> +	dma_fence_end_signalling(cookie);
> +}
> +
> +static const char *
> +dma_fence_preempt_get_driver_name(struct dma_fence *fence)
> +{
> +	return "dma_fence_preempt";
> +}
> +
> +static const char *
> +dma_fence_preempt_get_timeline_name(struct dma_fence *fence)
> +{
> +	return "ordered";
> +}
> +
> +static void dma_fence_preempt_issue(struct dma_fence_preempt *pfence)
> +{
> +	int err;
> +
> +	err = pfence->ops->preempt(pfence);
> +	if (err)
> +		dma_fence_set_error(&pfence->base, err);
> +
> +	queue_work(pfence->wq, &pfence->work);
> +}
> +
> +static void dma_fence_preempt_cb(struct dma_fence *fence,
> +				 struct dma_fence_cb *cb)
> +{
> +	struct dma_fence_preempt *pfence =
> +		container_of(cb, typeof(*pfence), cb);
> +
> +	dma_fence_preempt_issue(pfence);
> +}
> +
> +static void dma_fence_preempt_delay(struct dma_fence_preempt *pfence)
> +{
> +	struct dma_fence *fence;
> +	int err;
> +
> +	fence = pfence->ops->preempt_delay(pfence);

Mhm, why is that useful?

> +	if (WARN_ON_ONCE(!fence || IS_ERR(fence)))
> +		return;
> +
> +	err = dma_fence_add_callback(fence, &pfence->cb, dma_fence_preempt_cb);

You are running into the exactly same bug we had :)

The problem here is that you can't call dma_fence_add_callback() from 
the enable_signaling callback. Background is that the 
fence_ops->enable_signaling callback is called with the spinlock of the 
preemption fence held.

This spinlock can be the same as the one of the user fence, but it could 
also be a different one. Either way calling dma_fence_add_callback() 
would let lockdep print a nice warning.

I tried to solve this by changing the dma_fence code to not call 
enable_signaling with the lock held, we wanted to do that anyway to 
prevent a bunch of issues with driver unload. But I realized that 
getting this upstream would take to long.

Long story short we moved handling the user fence into the work item.

Apart from that looks rather solid to me.

Regards,
Christian.

> +	if (err == -ENOENT)
> +		dma_fence_preempt_issue(pfence);
> +}
> +
> +static bool dma_fence_preempt_enable_signaling(struct dma_fence *fence)
> +{
> +	struct dma_fence_preempt *pfence =
> +		container_of(fence, typeof(*pfence), base);
> +
> +	if (pfence->ops->preempt_delay)
> +		dma_fence_preempt_delay(pfence);
> +	else
> +		dma_fence_preempt_issue(pfence);
> +
> +	return true;
> +}
> +
> +static const struct dma_fence_ops preempt_fence_ops = {
> +	.get_driver_name = dma_fence_preempt_get_driver_name,
> +	.get_timeline_name = dma_fence_preempt_get_timeline_name,
> +	.enable_signaling = dma_fence_preempt_enable_signaling,
> +};
> +
> +/**
> + * dma_fence_is_preempt() - Is preempt fence
> + *
> + * @fence: Preempt fence
> + *
> + * Return: True if preempt fence, False otherwise
> + */
> +bool dma_fence_is_preempt(const struct dma_fence *fence)
> +{
> +	return fence->ops == &preempt_fence_ops;
> +}
> +EXPORT_SYMBOL(dma_fence_is_preempt);
> +
> +/**
> + * dma_fence_preempt_init() - Initial preempt fence
> + *
> + * @fence: Preempt fence
> + * @ops: Preempt fence operations
> + * @wq: Work queue for preempt wait, should have WQ_MEM_RECLAIM set
> + * @context: Fence context
> + * @seqno: Fence seqence number
> + */
> +void dma_fence_preempt_init(struct dma_fence_preempt *fence,
> +			    const struct dma_fence_preempt_ops *ops,
> +			    struct workqueue_struct *wq,
> +			    u64 context, u64 seqno)
> +{
> +	/*
> +	 * XXX: We really want to check wq for WQ_MEM_RECLAIM here but
> +	 * workqueue_struct is private.
> +	 */
> +
> +	fence->ops = ops;
> +	fence->wq = wq;
> +	INIT_WORK(&fence->work, dma_fence_preempt_work_func);
> +	spin_lock_init(&fence->lock);
> +	dma_fence_init(&fence->base, &preempt_fence_ops,
> +		       &fence->lock, context, seqno);
> +}
> +EXPORT_SYMBOL(dma_fence_preempt_init);
> diff --git a/include/linux/dma-fence-preempt.h b/include/linux/dma-fence-preempt.h
> new file mode 100644
> index 000000000000..28d803f89527
> --- /dev/null
> +++ b/include/linux/dma-fence-preempt.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef __LINUX_DMA_FENCE_PREEMPT_H
> +#define __LINUX_DMA_FENCE_PREEMPT_H
> +
> +#include <linux/dma-fence.h>
> +#include <linux/workqueue.h>
> +
> +struct dma_fence_preempt;
> +struct dma_resv;
> +
> +/**
> + * struct dma_fence_preempt_ops - Preempt fence operations
> + *
> + * These functions should be implemented in the driver side.
> + */
> +struct dma_fence_preempt_ops {
> +	/** @preempt_delay: Preempt execution with a delay */
> +	struct dma_fence *(*preempt_delay)(struct dma_fence_preempt *fence);
> +	/** @preempt: Preempt execution */
> +	int (*preempt)(struct dma_fence_preempt *fence);
> +	/** @preempt_wait: Wait for preempt of execution to complete */
> +	int (*preempt_wait)(struct dma_fence_preempt *fence);
> +	/** @preempt_finished: Signal that the preempt has finished */
> +	void (*preempt_finished)(struct dma_fence_preempt *fence);
> +};
> +
> +/**
> + * struct dma_fence_preempt - Embedded preempt fence base class
> + */
> +struct dma_fence_preempt {
> +	/** @base: Fence base class */
> +	struct dma_fence base;
> +	/** @lock: Spinlock for fence handling */
> +	spinlock_t lock;
> +	/** @cb: Callback preempt delay */
> +	struct dma_fence_cb cb;
> +	/** @ops: Preempt fence operation */
> +	const struct dma_fence_preempt_ops *ops;
> +	/** @wq: Work queue for preempt wait */
> +	struct workqueue_struct *wq;
> +	/** @work: Work struct for preempt wait */
> +	struct work_struct work;
> +};
> +
> +bool dma_fence_is_preempt(const struct dma_fence *fence);
> +
> +void dma_fence_preempt_init(struct dma_fence_preempt *fence,
> +			    const struct dma_fence_preempt_ops *ops,
> +			    struct workqueue_struct *wq,
> +			    u64 context, u64 seqno);
> +
> +#endif

