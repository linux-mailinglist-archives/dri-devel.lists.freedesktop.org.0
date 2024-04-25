Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE678B1B1A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D10F10FA38;
	Thu, 25 Apr 2024 06:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DQRRrgbU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8F410FA37;
 Thu, 25 Apr 2024 06:32:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXo0/jyLSUJ8YpZNLJSM1jqf1RwrRTqZZ28vrdu8+MV3MOYjbCNYRf3irb8fJnO0FZIyPfzDFlTZOriozq7L3DbgzotuzwU8LOaKHQUOmWoNk1RH0dB4rrbnbwgmxhvyLYFHTwImHT6gHa+D1oMvefQgyTXgmrwmO/5sweM78Cfs0MtrsDwW6qM0MbJ/h8vUzCVsV55Oam367ujQ+dHJsPnjdB/V/k6IwP1R/30S9idbuLNuO9wfGboywnTHs9/gFzIVTmpUlT1EEJVQziD2kM9jbybaLF2dnQ9obcRkkfmiUowiqCI9tqCZpugG0mNt61jsN1M+PErzpujhSuEvnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mw7sDPg0Vzb4GNIQFAn+VvxFf16bJtmt1GC5jZTqHy4=;
 b=I2bekx9i1kuDDglugVLiuBWWDaJVoSH/85hlHYM5iWY8GiaLW3E5A2goLtV20fbhrWH1RZ0R8avI926hXtDTNxqnDxTeJ8fOclKvzsgtZ1ce6YsC06HQjCjXV1XFSb9MvGDN5HLePn1TidkOzMB/+fmh6hZ+p5UNqkWBCMY+bVljfe3dWE59Hk2xthpLYpB6X3KtvFwNDHO4t5J1KEwjFytu6NfKOt4DJ0W5os4FssFl59U25lBJCovqj3exLi001UEAfFTlxiXer8qmp31RpddusUUpGQbJaqW9xNokrjsqNP1q8gEn6oaiGEMCyCfXw8wwOc85ccmGoue2IMhLXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mw7sDPg0Vzb4GNIQFAn+VvxFf16bJtmt1GC5jZTqHy4=;
 b=DQRRrgbUDoDlI5mJWFj3EaI7EV5nlsNtLbdM0fpaD3oX/dHdg78dq2E7SHgW5qzNn9KM75ibsGeHiBUcQAb3Jg4Ck5tRBL/pNtQzuLkMWYkJn1jtyX3B+X6XnMZbiweyVTb/56T8mZO/WzNNKWxZki0cx4IB2TxzUYhrqosRrDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7915.namprd12.prod.outlook.com (2603:10b6:510:27c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 06:32:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 06:32:40 +0000
Message-ID: <e5224fdf-ecc0-41f2-a7d9-42e3937f2e63@amd.com>
Date: Thu, 25 Apr 2024 08:32:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 16/18] drm/amdgpu: Implement SET_PRIORITY GEM op
To: Friedrich Vock <friedrich.vock@gmx.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <20240424165937.54759-17-friedrich.vock@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240424165937.54759-17-friedrich.vock@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0221.eurprd07.prod.outlook.com
 (2603:10a6:802:58::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: e01cced7-6030-4ef6-918a-08dc64f181bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDdvQjg3RElUcVZDcjlyZWVlT0tCbk83dTZMaUNiSGs4VjQrY21IUGRnM2ZJ?=
 =?utf-8?B?bHZReXRWWVVQUHdobFcvdW1HTWwvMjEwY1BmZWdYRFBIQi9OTmx0TkY5dk9i?=
 =?utf-8?B?cSt4T2hYM1cwbG5TM3E3TjdaTldZN3lqdVB3RzZOZnU4VFFCMFN3L0JPMUVJ?=
 =?utf-8?B?bWtHQ0VFK3M0QmwrM2ZhcnFjZ3RaVnhlaVRJMlZQWEFUcGdLeDg3cWMzR2JT?=
 =?utf-8?B?bVdMd1lQR3IyWWhlZmRmQWhWcFN1L1ZTUm9sbUZ6QnFLbmJ2Sk9WZktCUDJ3?=
 =?utf-8?B?WVFrZXhiZFR0MUZia2RKRTRLRWkrMEFRdTBCV1BDanF0S1I4Q2JiRjNNZnB3?=
 =?utf-8?B?aHJHUkRua0Y5MUpXN0tyK3VEdTlaZGRjRDdoY2RsVU5ldm9USnU1N2pjaVg3?=
 =?utf-8?B?YjhoMnhuWE5jTTkrSUxmNkxRcTBuY0VoRm53MUZKdVdtNUE2WHFUT1FQNTlp?=
 =?utf-8?B?YUcrRi9tUm5ZRmJtb2pBMm00VHJUL3N6dU5FaXAvcjRUaXNKLzk4QjVzVWZ2?=
 =?utf-8?B?K3R0YXhmb2k2aDBvYnVQaGtFQ3ZHWGd4TG5VRDBrR0ltV3orOUxua3IyR3dt?=
 =?utf-8?B?YkVhV3c2NTdjNDJqTUpaY1FGdXp1bWdwQTcveXdVK1Z3Ty9BeFg2VnZyZktC?=
 =?utf-8?B?aUtEMWVKTE5xMzBBenV5cFF3Q05HZDVWTndRbFQ4QThJY3BRQUdTTkFBUUUy?=
 =?utf-8?B?YTQyR2RMKzlLeHdXWmtiVFBnM3FMMDlqZ0lRNlc4VVB0bVpxRXpXY1l4UTlt?=
 =?utf-8?B?ckdKREVjN1NYYzNJN0ZtQjVmT2dxUnB1cmIyMEU2ZFRZb0F6K2pjV1dSTXNK?=
 =?utf-8?B?cWJSM1hPOWtDN0RkdDBKd3NQK0wwWEJLaml4NTAzWWl0U3FSbjBMYmYvSjRW?=
 =?utf-8?B?cnoxNUN4eWl6SFlMRDAxRUVZN0dSclpuY0VoMXdKYXdLT1dhVjRuL1VrNFVH?=
 =?utf-8?B?ekF6c08vdUVpZ3hEUDV3aHZrSmREVnhFM2JCY2ZQOXAzZnJPN21tREZhR0Vi?=
 =?utf-8?B?VnNFOW5MZkV1U2tjcUNjQWZiNEowS0cxdzVaeGlsRjFRZWpkaEoxcmN6cGFs?=
 =?utf-8?B?RHpkRGtzVTdhZmtaY0c1YTA0T00zMEhKcE0yakZva1EvR3U5M1l2dzFnODN3?=
 =?utf-8?B?M0JDaHBvak1oN3ltd0YrRXExQ0kyV2E5VW9hUGRMT0R3MmN4a0VSNnQ3UHN4?=
 =?utf-8?B?S29tVGtNR3hyaitCbUR1MTNmbmMzSGRzVzRFVFBmY1RsaFp0Z0dyR0lzakc2?=
 =?utf-8?B?V0RqRDVHeWFSVG9hYVk2Q0VVVzBIaFdmSXZicm5WQ1FMeFM0V0ZZYzFGMkli?=
 =?utf-8?B?TFd5dmR3UFhtUjRpZ0JhYzZISXJhdDN6TkhSQ3hCWWM1K1pFdzh3NFU4eVJ3?=
 =?utf-8?B?aHZSMnpSeUw5RE1zeWl2S2grVHVwek8zeWpBNWgzQzBoNUhxSjNISEVNVEhE?=
 =?utf-8?B?QU1TcllUS2puREM4UlBWZHo4TGlhOEFQaGxwcHpZZyt1MkFFK0UxTms0MytD?=
 =?utf-8?B?RE1jYjRGeVN6dFovV2NEbkZIbWNnRmc0bVl4NUROcnMxRUdveHFOblEraFlF?=
 =?utf-8?B?ZC9hV1Y2U3NRN2pyYzhJZjJTUEFhcy9rNkwrK09nWWN5RkJPRU9mYitSc0ZZ?=
 =?utf-8?B?NHM0MUZqQTlHS0hOeVFSWUdNVDdYWVBRcGZCMmFWZ2ROa0tOcDBlR0dscmh5?=
 =?utf-8?B?Q0MyNHA0Ty95ZFNnR3pSdzVIWExwOHdFNUxXNWlISXJIOEpkWlp1M2pnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVFXREFoZEhycjU2RTB1UUg2L3AwU3ZHdDVQSk93aWhUelQ0SUhtUDh6QlZ0?=
 =?utf-8?B?azAzM2pzRDZQTHRPcDZZUEhyRkl5UEFlZEhQOGdDTDNhZTVaQVVtVGdWbXpT?=
 =?utf-8?B?dEJoS0xoZlVBbzNBUkZnYW1BSEN5KzRBaGQ5aFZ3d0dYSmk2UVlnZnRyTXVK?=
 =?utf-8?B?bXhYSWJMVTNDQ09vWFozNC9reWNNY2RnSmsxbGU4cE1IbkNEUHJuVEI3dk5L?=
 =?utf-8?B?MUxsdzJyM3EzNFJuOWJQekRmOHowM1MrbkVlbmNRWHVwYmdGMGNlOG54WEhZ?=
 =?utf-8?B?MFdXbWU4M2xuYXlydGthWEtiVFNjWC9xbUZxaUdaVGdibUpMaUQ0ZmR2Szg1?=
 =?utf-8?B?cnVEMEE2bmw1WU1Pc3RaSHFjVjAvNUNHcHdnNnNpOTk4VDdoWDlkWWUrTXo2?=
 =?utf-8?B?MkNYemJlREllZWV1dUZvdXdScVFqS2VUeHRlcjhlWXBQZmVFWFNhT1ZPd0kv?=
 =?utf-8?B?dWdQWktiZDZ0eVJHelBFT3p4Tm1tN0lobTcwY0Y4NW94SE5qZGtIa0hSRHlX?=
 =?utf-8?B?UXRkNm5JTVQ3R05CVklmcnphUDZ6d251dmYwOHNoOUhNS1Zjd0hQWUlqMk43?=
 =?utf-8?B?VXdaMUNlVDNsU0lYVldHNEVuYjZhSXpWcTBubzRNYW5LdERuOXpiazBNVXBX?=
 =?utf-8?B?RnYrS1R5N05NS0ltKzVybkd0NFNKYVM0Nzc2R3E3Q1A0RzdiSnpJb0p5TWJz?=
 =?utf-8?B?M1d0SnNVV1NsZmY0dG4vekc0Skh1MGQ0NDhVZVducnR6cjN4eHdiemovTGEx?=
 =?utf-8?B?S1MvRlZIZTQ4WkxHaGl3WmdpakFlUi96WjFKcDkraktRMDNkWmRrOG8wTTFR?=
 =?utf-8?B?c1J1ZENXSzFWT1Fna3k3eEprVXpQNGMxZVBoSXJYbTNlK0lHNE5sQzVMaWlM?=
 =?utf-8?B?MnZPdmNDS2w2UEptcWpZYnQ2NitwTzdnYmRMNU9LaHMzZHpmK1dhNFNnS1hH?=
 =?utf-8?B?VXNYL3B4cW9TUktHanYzbk5DTW9zUFRwUVovRVhqOTRRS0JkTzRCNEJtVzBM?=
 =?utf-8?B?MVhQc2hNR3pGN2F5M2E5R3NFelA2RHY0ZVhINEduaVVqb2Zoc1dOcjdIM0Ux?=
 =?utf-8?B?aGx4WHlEdC9BdGFqVExvMElMT0MvTmNUeHNmZzFKOXdQL3BYUzZGQzRSNzlj?=
 =?utf-8?B?L0RlcG5WTkhEZkFCMU5xZ2JxSElQdUUvbjJ3SUg0c0cxajcxQm0zaUxIZ3cy?=
 =?utf-8?B?ZytUWTliVmlvU2VYOXora04zMW9yOTh3dUNFNFZlWmNVYmYvdjAwRnl1MTlL?=
 =?utf-8?B?RDkzMUFVNGZ1ZlRqQ2w5OWo2eUdadmF5Ly9vZDJYNU1QOEJhTVpZcW5LWnd6?=
 =?utf-8?B?Y09Mb3RqcWlqdlp0cFAzekw5SGZueE03QTBYZEZaQnlUWWJYZWFtUWthaUxi?=
 =?utf-8?B?ZkRibWpVbXZCSHdrMmNtNkc1Vjl5ZmdaQmN2bEQ1WFRod2E0UTdIUGQrVXBo?=
 =?utf-8?B?MkNkNi9rSkxIRk5CQWJyTmoyRjJSUlFsWEhOdEJGTFdPYkpiaFg4VkI2UGUy?=
 =?utf-8?B?cERtNmpLLzRKeEFidnErUGtGZkFoTnJLU0k4OUJLWUllUGFMbjNTcEpHcllw?=
 =?utf-8?B?KzljSzhuSkV3TG5TMnNvbEVwOGFaeGgvU0piQWg4L1g1d1d2cWp3TEwrKzNa?=
 =?utf-8?B?SFlSdThtNm5KS20rYXZUbEJjTEhhalhUbjhOY0xUU3VkTWpvTklxZkVTVnBa?=
 =?utf-8?B?T04yV09VZzhJU09BNlVoZEt2bUo2T1o1T2RjeFQ1VjhxTU9NWGtCUVdVc2pn?=
 =?utf-8?B?OHNzdExISGs5andFZFYxTVRYTEtORnE4VWlRRlhOQWtvVlNhM2Z1OE81ZEd0?=
 =?utf-8?B?aCtaaURISTNITVl1OGhnOU1uQ3g3cmNORXJvMzJ0cVBNL2JxQUp5VUZrenZE?=
 =?utf-8?B?Mm5ONFg4WkZldVAxRE0yMVNvbVl1Y2lqbnhhSTM5OGxsMVp6TGl0WmVMSDBE?=
 =?utf-8?B?NlJrWU9BU2NNQW5XT09jOWhpa2plT3VxZzM1cEY3bFBjYVJUQ2NJRmRwVjVv?=
 =?utf-8?B?d1JpVnBCYjRVeFJPZU9uMEgwM3B6czNIQ09odjV2aVpCdUozTS9KNGJmeWVZ?=
 =?utf-8?B?a3pVT2pWYVJJanJmWmFEWWhnT1JmVnhlK0t4bGlFcTlsay9rVnk2NlFKQnBR?=
 =?utf-8?Q?C6HNzyyXWw2/2sdh26V/J/n8S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01cced7-6030-4ef6-918a-08dc64f181bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:32:40.8976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBnTH6Rc9m0VgLgFAPCikOKT3XyvhHgGRZVqsOxmb7Jpx6VHtEoMwTtP/Yzq1oYE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7915
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

Am 24.04.24 um 18:57 schrieb Friedrich Vock:
> Used by userspace to adjust buffer priorities in response to changes in
> application demand and memory pressure.

Yeah, that was discussed over and over again. One big design criteria is 
that we can't have global priorities from userspace!

The background here is that this can trivially be abused.

What we can do is to have per process priorities, but that needs to be 
in the VM subsystem.

That's also the reason why I personally think that the handling 
shouldn't be inside TTM at all.

Regards,
Christian.

>
> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 20 ++++++++++++++++++++
>   include/uapi/drm/amdgpu_drm.h           |  1 +
>   2 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 5ca13e2e50f50..6107810a9c205 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -836,8 +836,10 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
>   {
>   	struct amdgpu_device *adev = drm_to_adev(dev);
>   	struct drm_amdgpu_gem_op *args = data;
> +	struct ttm_resource_manager *man;
>   	struct drm_gem_object *gobj;
>   	struct amdgpu_vm_bo_base *base;
> +	struct ttm_operation_ctx ctx;
>   	struct amdgpu_bo *robj;
>   	int r;
>
> @@ -851,6 +853,9 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
>   	if (unlikely(r))
>   		goto out;
>
> +	memset(&ctx, 0, sizeof(ctx));
> +	ctx.interruptible = true;
> +
>   	switch (args->op) {
>   	case AMDGPU_GEM_OP_GET_GEM_CREATE_INFO: {
>   		struct drm_amdgpu_gem_create_in info;
> @@ -898,6 +903,21 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
>
>   		amdgpu_bo_unreserve(robj);
>   		break;
> +	case AMDGPU_GEM_OP_SET_PRIORITY:
> +		if (args->value > AMDGPU_BO_PRIORITY_MAX_USER)
> +			args->value = AMDGPU_BO_PRIORITY_MAX_USER;
> +		ttm_bo_update_priority(&robj->tbo, args->value);
> +		if (robj->tbo.evicted_type != TTM_NUM_MEM_TYPES) {
> +			ttm_bo_try_unevict(&robj->tbo, &ctx);
> +			amdgpu_bo_unreserve(robj);
> +		} else {
> +			amdgpu_bo_unreserve(robj);
> +			man = ttm_manager_type(robj->tbo.bdev,
> +				robj->tbo.resource->mem_type);
> +			ttm_mem_unevict_evicted(robj->tbo.bdev, man,
> +						true);
> +		}
> +		break;
>   	default:
>   		amdgpu_bo_unreserve(robj);
>   		r = -EINVAL;
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
> index bdbe6b262a78d..53552dd489b9b 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -531,6 +531,7 @@ union drm_amdgpu_wait_fences {
>
>   #define AMDGPU_GEM_OP_GET_GEM_CREATE_INFO	0
>   #define AMDGPU_GEM_OP_SET_PLACEMENT		1
> +#define AMDGPU_GEM_OP_SET_PRIORITY              2
>
>   /* Sets or returns a value associated with a buffer. */
>   struct drm_amdgpu_gem_op {
> --
> 2.44.0
>

