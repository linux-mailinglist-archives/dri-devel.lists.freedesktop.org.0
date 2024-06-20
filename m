Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA291078D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE5810EA32;
	Thu, 20 Jun 2024 14:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PmqVKhbO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8256610EA32;
 Thu, 20 Jun 2024 14:08:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKJBP43R4G/ZYZ/8bExgoCD4eVUuEu7t+ZSowSocc9ImF/VpO12uHAODFnPXdhUvHwjPTQJz5bf52nm2KYMGP54sKta4JRW5ne4iHvxOKT2MdQn2re3mz1F4b/guHtwy7meUVVQ2JUJ6WRdAoaTtSY2qsPgRwNi1ZBr3K9/U64OO5C9relZonP4M/H0YMnaTer1b+4B0kYZrbJFiOIV7LVoGNVwXnHF6eImwVqW+2EqgU8k3UcwfYiyXjl7hm8pG0PYKgChwxFGCdNge9BAM9YcE/ljuT6vdy1aF43as3fADOgyMJ3PuW7FRh8wOOWvHLg+Efrp//DaJ//prfXd1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+REmhGLUMCos0PWLf9jbHsuhecNTPaW+21p4QI+Qo8=;
 b=lIYGM67wStGEpgHezcw7Yc8aa0AL6sfNyYjn4+1fy5SrtaJ2BioeNFVUhZgq8FecGA3NPCPNW8UzMVSDlzEkCu6cGQuOPwKedvPh/pI7kb+pY77fgJ/phLjjCBY95VfeBxNhwRFH402E9q1rfDF7FU8Wk3hcvisKqS/MHt5Bb8fPh8xI/Ld1IQdo6oNEt9WaYULhB2O38cnCPei5G9QAsLkw9bEAeNADgYZ38BgmHQMhSKjFWUhRCBPwMVhrv92F8JbfFT0QLwlhwgRioyLEN/IEUAzX3DeEeF6g2UlcIeHW6JhgY27xhQzGMcyreWOdbUEjNWq1tu32GIPId4MPZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+REmhGLUMCos0PWLf9jbHsuhecNTPaW+21p4QI+Qo8=;
 b=PmqVKhbOVM8itouc0gyop98jt0i69QTeUSjhA5wHKdKlFcASBoLNU8kj295ziL38ixbl1tiXrSMWkMK9liDe5Dly1vwFfAWLOSxHgiMihwPGoSMQx3fkuf8zjBc+TX84rDcJgjbVghkOzyN7c8K5WhPjn/b1rSK1uhBHN92HveQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB4040.namprd12.prod.outlook.com (2603:10b6:610:ac::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Thu, 20 Jun
 2024 14:08:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 14:08:29 +0000
Message-ID: <71e4aed6-d9d3-41cd-b043-277e9573cb3f@amd.com>
Date: Thu, 20 Jun 2024 16:08:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] drm/ttm/pool: Introduce a way to skip clear on
 free
To: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20240620134656.14380-1-nirmoy.das@intel.com>
 <20240620134656.14380-2-nirmoy.das@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240620134656.14380-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0255.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB4040:EE_
X-MS-Office365-Filtering-Correlation-Id: f664ccc5-66ea-465b-6e52-08dc9132760e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWxXS0xtVlFpR29Cb1dib3F4RmFzOERnbEFMR21mc3B6TnZPd2Y3dnJaUmFQ?=
 =?utf-8?B?TElsUUsxOURhb3U0V2NFVGlFYmhJU00wYWJpWUhvNUZjbTBsbDhUQ3lVdkV5?=
 =?utf-8?B?aEtSV3lkRVcxa3pCc2NkaU91cHhreXhnUmhteklYS3YyYVNXcGF5TG9BYlB4?=
 =?utf-8?B?VU5TSWVGMENTMXo1WEUvVjJZR3IyczhLTzdRdHltOWpFU3krbFVqbnBYNVY3?=
 =?utf-8?B?eHZuN0lWNlErU1NEaFNuMDNKNWl3QmZOME9TamRXZitxNkttL0ZMNjlnbzgv?=
 =?utf-8?B?MTE1dVBlUnZmVkNaUkd1VGZJVEIvS09uU2NvbHpRZ3lvWDg0dE9oME5MUmZM?=
 =?utf-8?B?K2JkRWREeUREM25uaU9DTEVCOXkvYW9qejBXdUFvdFNXRDhqczRqWGlDSVNP?=
 =?utf-8?B?RmFRRzFrY3NZekdjWk1TaldCVTdiUTFYaUZ5bm9CUnJ0UGFvV1BSK2lWN1k4?=
 =?utf-8?B?UTRreG14RjVxMEYrZG9FOW1YUHVRL29vY2pNZnQ2WnN1cUo2R01Ob2JpdnhV?=
 =?utf-8?B?TTU0NVB5akRGN1FublowTTFXL3QvdERrRlp0TjI2VUtxTjE1ZktCb3ZrQXZj?=
 =?utf-8?B?V3RCU0hLTDBBd3VKVG1yOEw3N3BrWHlrUWlsSmprYlJTWkN0R3pYWndRMzJ0?=
 =?utf-8?B?WkxzMGxBTml1eEkxZ0dxbC9SL3ovVlMxbzcxd3QwMWhOQVNHcnZvWEpXYXRL?=
 =?utf-8?B?K2RXK1hyanVQRHRUWjkwRnJwdjBvcEFtbFV5WCtOR0VGQ2ZvaHNKcEV6RmQ2?=
 =?utf-8?B?UTFYdmJFTXF4ZFNEVXFyZ0R1K1dHaXdHZEZCQVlMY0pFemI0bzM1aHRsTFFI?=
 =?utf-8?B?eUREL0VuWndQQktiUGZTNlpvQlBOMTJSYmJ3bzVXalora2RmOElYRkh0MWZT?=
 =?utf-8?B?a3BFOGQ5elR0QzNmd2xwLzV5NEVsQ3Fmd3dpMXh6NEpxczVnQ2JwVFZQb3lk?=
 =?utf-8?B?czU3bkV1OExpcGptc3MzdFR6Z0RNQXR5M0xCd3BEeVNXdzJsUTRqVlhkLzFB?=
 =?utf-8?B?bGorM1JTc0lSR3lwUitJaWFoMVRXYW1DQVIwYmZLUlRGMUFZRFVvUWlxMGpv?=
 =?utf-8?B?bVp1ZnUzbGY0d2VPOFNaRzd6YkUwb1ROTjZxcWg1Q3pHM3h6MVJUWmNNSjNs?=
 =?utf-8?B?eTQ0ZTh3MVg3VWlYWXU3blVMVzlzeVJGbExmWkc5SEVYQ0ZZMlR3TndHMjJQ?=
 =?utf-8?B?L2djQTY0NWE2eFpaVWJQS0w1UlRhbmxSVXBYSFdGMElXcGJUYWhVT1NMR2F5?=
 =?utf-8?B?QXJQSmoxOEk4dDRubDdpSEpId2wra0JLeExWZWtrS1Jkc3FuNitZaWt5SjdO?=
 =?utf-8?B?ZTdySHdBcnNPT1NSbDYyZEZMMVhyeTBoUGVHbC9kSHhzRHJPdDdRUVNLYitq?=
 =?utf-8?B?STdmRGd2bDNqK2czMGZ1UFVVTk5pYjFLbi9NLzNqZ3JFMlY2OGFBemZuU2Fl?=
 =?utf-8?B?RlJJZ2F1bTFDYitqWHl5NGdzMmZEbVZKN3NQcnJtTFVYQy94Y0x5SmlGUnBj?=
 =?utf-8?B?Q3h6dUllL2xsalF5T09TeVhFd2pEdmw3RUV3S0kyZy96ekVCVE5sQkNUa3Vk?=
 =?utf-8?B?R0FBUk5HbC9qbk1zQlpEN1ZCSHAwRkZ4VGgwcGc4KzBQcTkyRVBIc09nU2Jq?=
 =?utf-8?B?UGVrSmgwUUdkOE1mSU5BaTJOdzM0bzRaeGc1N0Z5QjRBSTR1d1VTWnVpSlZQ?=
 =?utf-8?B?NklGYjl3SzVwUENGMXRidDJlemcraGJoSkdQMDdHQTFtMWZmcjRYbExWOWFz?=
 =?utf-8?Q?wH3qwVJlJOJ4WD+WnbT5D3nRc/jlxY6FUJYcn+V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHNhSWlCSnVJNmtIZGRaUlFVQXlYUlBCTDN5NGo3aVRKcmgvaFEzaG1CUExj?=
 =?utf-8?B?azg3dlNXTzh6elp4QkE5djBQdnhQNUt4MU0vdThTRGxmQ1h1bnRGL3ozU0p2?=
 =?utf-8?B?SDVzV3Z0OUlCTWxDQWFNNVcwQnlEbmFQT0l3VWZiTHlFdEF2NjJ5cFpGT01T?=
 =?utf-8?B?dHR2aGNmWlo4NzQ5dnJkOFBPd2RQUmRIUWJwQzJkalRxVHVrZlU2TEdFQUN6?=
 =?utf-8?B?SjcvR3NOR1NVWmpRYkZzQ3Bxb2EwQTlLdXhXK2MrcVk4NFdUa2RFTnRjOHdh?=
 =?utf-8?B?amxvSlpwbE9XblJLR1BMNzNNMm8raThaUGpXZGxtc1RCaGtUUGQ2dVRaTW9h?=
 =?utf-8?B?Y09aNklVRXQ3U0VBVjV0YXBLa1pLUTlXdjh2bkROUGw5cUhqazVxYnMvVHRX?=
 =?utf-8?B?dXR5OFh3eG0xblJPWFZLZGZuVkJkTXltaHI5YTdZTFVTVmU1RTA4SUhoQm43?=
 =?utf-8?B?Ym1wdnVmWGhMQ3hEL1dRcU0zS013amdrenJoMjVqY2xsTVlIRFVidmljVWlj?=
 =?utf-8?B?L1dZRFgxTDU2NWhRRGFMdHFSLzBNMHkrVGxtUXNzQWVqZUZvT24zN3YrampD?=
 =?utf-8?B?dmg5UzI3QlJYMzE0YjI4Qk1ENGxVSytzM1grdkwzZjM0Z3pKYVpPV0pERzZr?=
 =?utf-8?B?Wkd3ZWQ2OTQzVUlNSjdpWVNTQXZYWDZHcTl1MW8raWduYThMenhaSUMrV2ZM?=
 =?utf-8?B?OEk0M3hWbzZSajYrSCtxM2QrV3k5NEZyU3JFWFZ6eDJ2QlVkdEJKekZNVmto?=
 =?utf-8?B?TFl0dkxVZ0lxbG1tK1MwcUhaR1JrRndCTmVway94alA1WnJoQk9QK0phalU3?=
 =?utf-8?B?WWZac01PcTBIdldMVitTazgyeWQrSWovaTVEM214aWQyVTNrdHV2ejhQSVVM?=
 =?utf-8?B?L0N4elNSb01Ec3hwU1MxVSsycmR4c2hvYlM3WHlVQnYwaU40NmhUdTQ5Z3Jn?=
 =?utf-8?B?TEJ1S1B5T0VaNVhpUmMvNGR1MVhablhrSEZaa0lyYmoxb09IdmovUWZXNGVk?=
 =?utf-8?B?Q0ZnTHNqaEo5b1E0REJJdzBXRmhFRXF5TCtSL3Z4Z1M4aEwrMXlISHNOMWJZ?=
 =?utf-8?B?c09GcGZKMEpQeEd0cHFDa0p3d1BlaVhkNC9YRGphVnkxVktaMjA2SWJQSzBO?=
 =?utf-8?B?UjRIWWRKcGphQmVKMkRPdmV3YUpVc2tCMmtqOFIzckszSENpaUJQYm5oWU5r?=
 =?utf-8?B?cHo2Wk16U0hic2tGVlBWUWhxck5yQkM4Ull5VWtiZnhjYVZYWTQ5V0dBUEJU?=
 =?utf-8?B?allzRGFCaEhDeHVnU2VoanJraHJVVVBwbXhsclpBVUJ4ekJkaW5xeXU2eHB2?=
 =?utf-8?B?eHYxeXpnZnVnSFBXOUVncWVYbEhkRjMxdWZPUjIxM2VKeHFSTm1vSjMrcWVD?=
 =?utf-8?B?R0ZieTVsYWVORFY1R3dRMTlyMlo4RWZOODFjUy8rc2pGeS9rK3ZFQTQzR3Rk?=
 =?utf-8?B?OGh2NWg1UWF6cENNcklYbHZ3RGE0YnYxSEwrUHlUbXltOG1pUms0WVc0dXA1?=
 =?utf-8?B?Lyt4a3dTNmVhMWhQQjFOa29hOWI1YzZYMUNVck1OdmludUdSc21nVUtpbElo?=
 =?utf-8?B?aDNpNmVPSHNNcmt1UWxpcUphWVYxS2pxWVpkVm5tbnhZZzhILythUDVXaTB1?=
 =?utf-8?B?VHk5eGVXakVYRkU4UGFkQklpNXNZY283SUZuSkNoZ1BFSFkxY1dBZmx1THNI?=
 =?utf-8?B?WkEwM3RPVG5uMzFMQThrZ3dqQWhKd0xXcTVjUDVFN05CWXFBTVpEM2pKTzZW?=
 =?utf-8?B?NDhVSHg5cEt4NEhlWEhISEVTR2x6ZWM5UHpPclkzQzFvbU9sYjk4RnZaTENT?=
 =?utf-8?B?RFpOMFdYS21HMEY3UWxiSmF6Z2Z0V0Zid2dOMUdGeHMvZWw2Q01LbjgxNXdH?=
 =?utf-8?B?RFJ5MmNuakh5cS9ScWhtMURFRzcvc0RJRzdTVXpISjJzR1RWeE5DV1ZxcW54?=
 =?utf-8?B?czM0bnNWZlIvRThXczkwTG5HT1RTUFNmTEduOUJXOVJCMVYveURmNkk2QldX?=
 =?utf-8?B?UlRrVW1jMlR5MWw3MWlDeDc5VStqdGY2ZTQ0MmVYdDVWWWc3ZVpVOEc2SVBW?=
 =?utf-8?B?WWFBZDY3MEFMVk5QeDBiRFRhTXV0ZkZNK3JneVJWTDhjc1BwVXZiVFhyZWRW?=
 =?utf-8?Q?EcoijwfLe2Fps7bMGRF7No+Hj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f664ccc5-66ea-465b-6e52-08dc9132760e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 14:08:29.6665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smhyDs6TuHw86X+waY7W9eegA9OVxoUOmo4I4Mukg88vJOTNPPhttiaWNcQ7oUQ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4040
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

Am 20.06.24 um 15:46 schrieb Nirmoy Das:
> Clearing pages can be very slow when using CPU but GPUs can perform this
> task much faster. With this new pool API driver can decide if it wants to
> clear pages using GPU. This provides the flexibility to choose the desired
> clear policy, either during allocation or upon freeing, as per the driver's
> preference.

We already have the TTM_TT_FLAG_ZERO_ALLOC to indicate if pages needs to 
be cleared on alloc from the OS.

I'm not sure if we really need the option to not clear them in the pool 
as well, but if we really need this I suggest to switch from clear on 
free to clear on alloc again and just honor the flag.

Alternatively you could also split the pools into cleared and not 
cleared pages as well.

Regards,
Christian.

>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 42 +++++++++++++++++++++++----
>   drivers/gpu/drm/ttm/ttm_pool.c   | 49 +++++++++++++++++++++++++-------
>   include/drm/ttm/ttm_device.h     |  8 ++++++
>   include/drm/ttm/ttm_pool.h       | 11 +++++++
>   4 files changed, 94 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 434cf0258000..54a3ea825c2e 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -191,15 +191,19 @@ EXPORT_SYMBOL(ttm_device_swapout);
>    * @vma_manager: A pointer to a vma manager.
>    * @use_dma_alloc: If coherent DMA allocation API should be used.
>    * @use_dma32: If we should use GFP_DMA32 for device memory allocations.
> + * @pool_flags: Desired pool flags
>    *
>    * Initializes a struct ttm_device:
>    * Returns:
>    * !0: Failure.
>    */
> -int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
> -		    struct device *dev, struct address_space *mapping,
> -		    struct drm_vma_offset_manager *vma_manager,
> -		    bool use_dma_alloc, bool use_dma32)
> +int ttm_device_init_with_pool_flags(struct ttm_device *bdev,
> +				    const struct ttm_device_funcs *funcs,
> +				    struct device *dev,
> +				    struct address_space *mapping,
> +				    struct drm_vma_offset_manager *vma_manager,
> +				    bool use_dma_alloc, bool use_dma32,
> +				    unsigned int pool_flags)
>   {
>   	struct ttm_global *glob = &ttm_glob;
>   	int ret, nid;
> @@ -227,7 +231,8 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
>   	else
>   		nid = NUMA_NO_NODE;
>   
> -	ttm_pool_init(&bdev->pool, dev, nid, use_dma_alloc, use_dma32);
> +	ttm_pool_init_with_flags(&bdev->pool, dev, nid, use_dma_alloc,
> +				 use_dma32, pool_flags);
>   
>   	bdev->vma_manager = vma_manager;
>   	spin_lock_init(&bdev->lru_lock);
> @@ -239,6 +244,33 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
>   
>   	return 0;
>   }
> +EXPORT_SYMBOL(ttm_device_init_with_pool_flags);
> +
> +
> +/**
> + * ttm_device_init
> + *
> + * @bdev: A pointer to a struct ttm_device to initialize.
> + * @funcs: Function table for the device.
> + * @dev: The core kernel device pointer for DMA mappings and allocations.
> + * @mapping: The address space to use for this bo.
> + * @vma_manager: A pointer to a vma manager.
> + * @use_dma_alloc: If coherent DMA allocation API should be used.
> + * @use_dma32: If we should use GFP_DMA32 for device memory allocations.
> + *
> + * Initializes a struct ttm_device:
> + * Returns:
> + * !0: Failure.
> + */
> +int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
> +		    struct device *dev, struct address_space *mapping,
> +		    struct drm_vma_offset_manager *vma_manager,
> +		    bool use_dma_alloc, bool use_dma32)
> +{
> +	return ttm_device_init_with_pool_flags(bdev, funcs, dev, mapping,
> +					       vma_manager, use_dma_alloc,
> +					       use_dma32, 0);
> +}
>   EXPORT_SYMBOL(ttm_device_init);
>   
>   void ttm_device_fini(struct ttm_device *bdev)
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 6e1fd6985ffc..6f33c3e7cdf2 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -222,15 +222,17 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
>   }
>   
>   /* Give pages into a specific pool_type */
> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
> +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p, bool skip_clear)
>   {
>   	unsigned int i, num_pages = 1 << pt->order;
>   
> -	for (i = 0; i < num_pages; ++i) {
> -		if (PageHighMem(p))
> -			clear_highpage(p + i);
> -		else
> -			clear_page(page_address(p + i));
> +	if (!skip_clear) {
> +		for (i = 0; i < num_pages; ++i) {
> +			if (PageHighMem(p))
> +				clear_highpage(p + i);
> +			else
> +				clear_page(page_address(p + i));
> +		}
>   	}
>   
>   	spin_lock(&pt->lock);
> @@ -396,7 +398,10 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
>   	struct page **pages = &tt->pages[start_page];
>   	unsigned int order;
>   	pgoff_t i, nr;
> +	bool skip_clear = false;
>   
> +	if (pool->flags & TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE)
> +		skip_clear = true;
>   	for (i = start_page; i < end_page; i += nr, pages += nr) {
>   		struct ttm_pool_type *pt = NULL;
>   
> @@ -407,7 +412,7 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
>   
>   		pt = ttm_pool_select_type(pool, caching, order);
>   		if (pt)
> -			ttm_pool_type_give(pt, *pages);
> +			ttm_pool_type_give(pt, *pages, skip_clear);
>   		else
>   			ttm_pool_free_page(pool, caching, order, *pages);
>   	}
> @@ -550,18 +555,21 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>   EXPORT_SYMBOL(ttm_pool_free);
>   
>   /**
> - * ttm_pool_init - Initialize a pool
> + * ttm_pool_init_with_flags - Initialize a pool with flags
>    *
>    * @pool: the pool to initialize
>    * @dev: device for DMA allocations and mappings
>    * @nid: NUMA node to use for allocations
>    * @use_dma_alloc: true if coherent DMA alloc should be used
>    * @use_dma32: true if GFP_DMA32 should be used
> + * @flags: control flags for the pool
> + *
> + * Initialize the pool and its pool types with flags to modify defaults
>    *
> - * Initialize the pool and its pool types.
>    */
> -void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> -		   int nid, bool use_dma_alloc, bool use_dma32)
> +void ttm_pool_init_with_flags(struct ttm_pool *pool, struct device *dev,
> +		   int nid, bool use_dma_alloc, bool use_dma32,
> +		   unsigned int flags)
>   {
>   	unsigned int i, j;
>   
> @@ -571,6 +579,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>   	pool->nid = nid;
>   	pool->use_dma_alloc = use_dma_alloc;
>   	pool->use_dma32 = use_dma32;
> +	pool->flags = flags;
>   
>   	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>   		for (j = 0; j < NR_PAGE_ORDERS; ++j) {
> @@ -585,6 +594,24 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>   		}
>   	}
>   }
> +EXPORT_SYMBOL(ttm_pool_init_with_flags);
> +
> +/**
> + * ttm_pool_init - Initialize a pool
> + *
> + * @pool: the pool to initialize
> + * @dev: device for DMA allocations and mappings
> + * @nid: NUMA node to use for allocations
> + * @use_dma_alloc: true if coherent DMA alloc should be used
> + * @use_dma32: true if GFP_DMA32 should be used
> + *
> + * Initialize the pool and its pool types.
> + */
> +void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> +		   int nid, bool use_dma_alloc, bool use_dma32)
> +{
> +	ttm_pool_init_with_flags(pool, dev, nid, use_dma_alloc, use_dma32, 0);
> +}
>   EXPORT_SYMBOL(ttm_pool_init);
>   
>   /**
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index c22f30535c84..1b20c5798e97 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -291,6 +291,14 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
>   		    struct device *dev, struct address_space *mapping,
>   		    struct drm_vma_offset_manager *vma_manager,
>   		    bool use_dma_alloc, bool use_dma32);
> +int ttm_device_init_with_pool_flags(struct ttm_device *bdev,
> +				    const struct ttm_device_funcs *funcs,
> +				    struct device *dev,
> +				    struct address_space *mapping,
> +				    struct drm_vma_offset_manager *vma_manager,
> +				    bool use_dma_alloc, bool use_dma32,
> +				    unsigned int pool_flags);
> +
>   void ttm_device_fini(struct ttm_device *bdev);
>   void ttm_device_clear_dma_mappings(struct ttm_device *bdev);
>   
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 160d954a261e..9822996309e5 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -66,10 +66,17 @@ struct ttm_pool_type {
>    * @use_dma_alloc: if coherent DMA allocations should be used
>    * @use_dma32: if GFP_DMA32 should be used
>    * @caching: pools for each caching/order
> + * @flags: flags to control certain pool behaviour
> + *
> + * The @flags can be:
> + *  - %TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE - This flag can be used to
> + *    skip clear on free when driver decides to do that on it's own.
>    */
>   struct ttm_pool {
>   	struct device *dev;
>   	int nid;
> +#define TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE	1 << 0
> +	unsigned int flags;
>   
>   	bool use_dma_alloc;
>   	bool use_dma32;
> @@ -85,6 +92,10 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
>   
>   void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>   		   int nid, bool use_dma_alloc, bool use_dma32);
> +void ttm_pool_init_with_flags(struct ttm_pool *pool, struct device *dev,
> +			      int nid, bool use_dma_alloc, bool use_dma32,
> +			      unsigned int flags);
> +
>   void ttm_pool_fini(struct ttm_pool *pool);
>   
>   int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);

