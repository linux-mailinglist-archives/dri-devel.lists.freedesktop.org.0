Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C612A718DC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 15:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6433010E6DE;
	Wed, 26 Mar 2025 14:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="msLS1Eja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515FF10E6DE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 14:41:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6jfuzjFRi+t1Gi0shZ7zguO8Lamx9nguzhej81GBJ6bQlcY9CIdlQElnz2ih0qBDKjyuwUyj9Pk1o7eixKRxUnW8zxctKIVKwAu8hVJIORFC//1pF437MnisZLt/KLWtmMfk2LnleIf7OTX/zTMmuabes6X3ykSu3EeChbUlhI8j6TSPOOay9tD/PrPYyQo+1LrGWWNUCmmdV9kdNbqZpZrLit6nlxawGS/LfIr3q/P2URWlz9Fzm/vtaTKBSR9afuNXIwnyOlx6JpV0BZkoKDBFhpzbmr7SWwaAU0NJkwYACzI4mgbjEmpFOO8hyYhGLSbRa1docPHGo4l0GqG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NozI1wmFGDgQxqNzUkl5eyVdHZFamFTk5z677buMxjE=;
 b=yWfgkgm8fizodV9fMUXr3NffMunmeCAdFw8ZL01c1QUYX9oy3jPU0aqy5cy+HhL9kf3Ste00D9an+Uo4AWg+32L3mxKYNEraoGimlP/GPmcK3UPvtxlyGjzdv4NPuzhdAAeP/OqMiq+5Zzqs17R9+Pmi11J9aQLs1INWT/btrnO9ybfba6sL5oQaX5qnoHRWaz+ccrDsylKzJWu7HLOTopgoorLmWQ8S6A5T5oFXPndy+RPYYwwL3Bc+/T/h/VRjcTOR0Q6QcZXWQNjEgTV8pJvGwRUh/Fjc7AOxJ5Nn6HnJqk1oj0DTUfJtbwtcESqdACZPP0BcVXRN1WQ0GwAbPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NozI1wmFGDgQxqNzUkl5eyVdHZFamFTk5z677buMxjE=;
 b=msLS1EjaOIVq8eJKeECKNbVKeyqcovNnoN8dWRh40NG28AjHff6GRZXY3vV2rXeqa1Asml3EaThigEZBLpy5/rIL0QjZzETSlFCKtYi+KxYqvUUnNon1I48ecBgkbPA54SxQsLe5FD8gw4f0UqGhQbXGfQDFK6Z/LiD/CKtwwa0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7894.namprd12.prod.outlook.com (2603:10b6:a03:4c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 14:41:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Wed, 26 Mar 2025
 14:41:37 +0000
Message-ID: <342ee079-ee0e-470d-afd2-c2870115b489@amd.com>
Date: Wed, 26 Mar 2025 15:41:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
References: <20250326143903.24380-1-robdclark@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250326143903.24380-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: cc5f36a6-0319-4cbc-b515-08dd6c745039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3RodUtPSVkxMEpURENtcThWRjN0V2ZtUUlOcEVNZzFoRUhMNlh5MXkyUFRs?=
 =?utf-8?B?UjZtOUxsTGNIUmZPbkpMZ24rd2huSW1iZ01BSUZnZHRCaWh1dkdmT1oySWJo?=
 =?utf-8?B?L2dCbWorL2p5OUVpV1pqbFpOZnNTZmUzRENLTldPNDBxd05qakhsK2dYdERu?=
 =?utf-8?B?VWU1WXh5bENLVE1vSFVzRE0vY0R4bG54R3hHTENzdWJPU0I4TjRaRXFxeFNh?=
 =?utf-8?B?QWVRTzQwbW42MVlHOW9ydFRtS2JWWmtnWGR3OWp3SXlab3NFVXBNbllmcjdP?=
 =?utf-8?B?eHZYUnl4Ulk3RGhXMTBHQ2FJZlA3VE50RVBLWG9DbDJyN05vWTF0MGxPeGJo?=
 =?utf-8?B?YkEwM2JlcWxlaUJFZFdVbFU3VjkrYkVYb3VOSjBlVHBrUVk1NDlqc2dzUytJ?=
 =?utf-8?B?SHpidkNnZzhBN3ZRbnd3T0N3VGJxTENPRHZ4bDU4aTkxQy84S3ZoMndrTit6?=
 =?utf-8?B?L21taXVHRUZzZDhieDA5R3VCTFk3L1psTnJWSFNLb01laXpzMEtEd1dqQkF0?=
 =?utf-8?B?cTh6YUxteVdMOElqeUpaKzRSd3h5TzRoRittV3VLRE1YejFEUEVLeTVielhi?=
 =?utf-8?B?T084Sk9kaTkxTXNsTHJvSGlONlVmdDhtN09CNkZhclJSdUh2dFR1cnQrN2Fj?=
 =?utf-8?B?RXdTUWd3d00yYnFnWE1qRXBneUR6WkFTZEdSS3c1dGUwZjNldEh5UW5ZbFFI?=
 =?utf-8?B?VlJPazFoL2tlQUY0YTRNeUNHTjl3bWl1bzdPRlVwZDhzTjJFSjllYzYzNHpU?=
 =?utf-8?B?YUNmWGhJUkxWWWgxY0VKczd5RE51V0lpZGRzMFJ5QmJMWEF6S054QXZvbjRZ?=
 =?utf-8?B?QlFRaEJhdThPWXl3RzY4OEJaWllUWXRPZmhaRHhqZ0FXVmtDZmk4TVoybldM?=
 =?utf-8?B?T3J2eE1oWEtJWlhhT1dHMVRjaHJjbjNIalp5N2tzcmhBN0dzUnFsaGxmeWF1?=
 =?utf-8?B?T0JFa2lrcEhvdysxR0tpejRkQnZLZG5uMEhDb0kxYnAyeXRBamZXeWdFQzBM?=
 =?utf-8?B?WEVoM0lLampvSkx5UE1JR1JhMm1WUEFaSDVIZkZ5cWxYeDZOTmVkT3pUN0ZE?=
 =?utf-8?B?eDh3ZklwYUNOM0hQSjBHY0E1RXBUb2lxdE5QSFB2OXNBZHBtbmlWOVV3RzR5?=
 =?utf-8?B?NHdEMnY2K09RZTNkQ2FUdXpQZlRsNlZiSC9tdkx3cmVxbjNoM01BNkNTSXQ2?=
 =?utf-8?B?NEtiTjQ3d2FINlRVVzZFRzBMcHNwSGN0eGF1ekM1SW1LSTcwaWJZR3c4alZo?=
 =?utf-8?B?dTRJZDIzYWVSbFBYZmh5MitPcEJLQmZWOTlkbDJoNVZTdWpOVk9VTmR5RkNR?=
 =?utf-8?B?UlBaNUdCMG05VEJBRXM4N1NuTlduVG55aDhrZ2wzQkYwVFNqYTg4Q1o2UlBh?=
 =?utf-8?B?L1g3ckloaCtkUVMzU2w2Y1RuZjhKTGJvWnViWkFPVS80Yi8wMjR4Qmw2VUlz?=
 =?utf-8?B?ZGVML3lUdUJKY0RPWVljN3UvM2hONEJGamZRNmFMVVNQa0VUVGJoYVpaeWdm?=
 =?utf-8?B?RUY0UUdLYTNXK3NkT3Z0eFppb2c1citubTJlQlpLRjFsTGRyMyttZDdXTUJE?=
 =?utf-8?B?V3lBblBGV1ovdmJFa1daRXFkcGU5RVRhdkJtcDlBSTBMcHpGazNtWlEzaDkr?=
 =?utf-8?B?OUxNQW1HS3NnMzlYZTNmU0Q0NkREWDlid3hBNmpVeHJGZVVjWUJYN3pVeUVJ?=
 =?utf-8?B?RVc4YUE5LzQ0UC90MmhKRVl5NFd4MzhjdzNjVS93Zzd5d1l4STRPWXgvTGds?=
 =?utf-8?B?ZlJ0aFI5bWVsOWR2N0twd2RHNW1WeUE0TWkzczB4QzRibm5oSkwrSHNSRi8y?=
 =?utf-8?B?cHNvUVFsOGc1MGpiYmRvUnY3dUc5Uk1IVGYvNUIxczcvUHpWOWZNVG91Zko3?=
 =?utf-8?Q?c1jWFc/pZBNgo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkFGYWZQY3NTNU5lR1ZNclF5NjZlcmdrQW9na0NQeGtMNiszYTA4NkpvdHFN?=
 =?utf-8?B?aGRQM3hXa3ZLcEs2UWlFMVVpTjFvK1NGNjIrWjNEUDJmK1F4b0MzNTVsOXJS?=
 =?utf-8?B?dHVXUEM4NDZxeWRncjU0NERpUWt1QU56cUEzU3g1SHZOUmVqRDlwZm4ycVlW?=
 =?utf-8?B?T3RZd0lhZnRQUk5kV2tHVXVPTU9tTE1HSENOc3dwZUVVMXJ4Z3A5YjQvVFBI?=
 =?utf-8?B?K1M5TjhUTWFnMXE3T0VHalVGSEJvc3IvMmlUZkRtQkMya1pDUGdYRy8ybTFR?=
 =?utf-8?B?ZHFZQTlkRmh4U054K1RhMG9hSmovTENncTF3ZzQyLzhBYk1yZ2NiN0Q4Yml0?=
 =?utf-8?B?VWtNYXgvS0c0VFpzVmtabDBIYUtkMzhJTmd6UXZKcm04ODdTMHpIaXo3eXM2?=
 =?utf-8?B?bjBEZ1d6TVMxQWthL1dZMWlkRDh3UGgySzB3Vzc5T2tUeWI4NXFkYzE2QmNY?=
 =?utf-8?B?WG9pVG8wSG91djdqZzF6K1VSYk11TXptMTdjSnVtMFZudUJ4YlpnVFVLdy9M?=
 =?utf-8?B?eXYxcXpLdDhrdWZnZ3owRElSNUQwYVk2Yzd4KzkxeG00dUU3dmIxdXZTYzdY?=
 =?utf-8?B?d0gwNW9LcXdFamVWR1FxckhsUGNobTlJaThNZXlBb1VRdjBWYWtlaWkraEFs?=
 =?utf-8?B?TUVFNnIvbE8zTHZvNUpuTXcySUtKZ2t2Z1AvaW1wT0dqVW1TRjRQODJtd1E4?=
 =?utf-8?B?N20wNW9TYUtzWVMxK3pTRXBFQ0lIYkx0SkduT1lISWRGeUpoLzBVelo3ZmYv?=
 =?utf-8?B?TVhaTFZZYTIvVTFSZS95Ty8vVFdURjgxdEladTBQZjRJRGJ4UG1XQmdxZWcz?=
 =?utf-8?B?NTNXL2svRlk1Y0xzdjRJeXRNNGdxdk02akRlWEw3ZWxQdXlySEp0VmtwZGU5?=
 =?utf-8?B?TnZrWUd5MHNabkxyZEl2cDJUeUNSMXNTbitjZnpkYTYxcndLbXFBTXdxSEhh?=
 =?utf-8?B?eGFmcTJ6RVg0eVF6SyszT2EwOEhGYXo0MHBhYndXRHo4OGlTMFhHZENqbkFO?=
 =?utf-8?B?VUpjeEtVMDZDMjVPN1g3UWd2QXhFWlJVTE9IL1AxSnBQV3l4WkhkbjhCdnpn?=
 =?utf-8?B?M3RPSFVHZnN5c29NNTFSRW5UVVp4Q1lxbDgvVlZUV1orV0IxcnFPUmppVWdT?=
 =?utf-8?B?Zzd6WWl0YkxXY2lxZm9TejN5WEFMV3JuS1B3Z1ZNazdxL0dqcnc4NDVhS1ZB?=
 =?utf-8?B?emxldFByYzB5bnBaZjMvTS9UT1dicFNFZVpDZ2FBNmFvamdDYjBWSTZWQkh4?=
 =?utf-8?B?Nk5CUExoSVRRRlZxNWRONVljL0luYXdEZml2aUNtY0tQRTEveEd3bGI0WVRs?=
 =?utf-8?B?a3ZoNzNaSTRtbjBYeHZsaTlGR2YwZWg0MXRlcjZheFlNdXRBaUZ5WWE4b2Rp?=
 =?utf-8?B?K3czZWFZNlkyRkJJRWdLaDhkL1BObkwvdlNXY0J3RmpKRFFseXUrTThxL2p1?=
 =?utf-8?B?ZDVoS1lydDkwQnJiTHl3VTB0a3huNnpkcUlUZVNvY3o1QzR3WEpnYWptT1VM?=
 =?utf-8?B?aW5JRmw5dC95RGcwT0ZmNGx3Q1RaYk5nbnd6dUJkeVp0YTkyc3Z1MzdxS2xP?=
 =?utf-8?B?dWQ4RWFCQ3RBbkx0ZTBYdS9VbHJaZzlmL0ZsTm93M2hoc2hiNHVzMUJyc0xI?=
 =?utf-8?B?OWR5KzltUFJtOFNBeWpGOXpFYnFMMnpKUkEvbEhUZlVYdkZDcndrRGh0U1Ft?=
 =?utf-8?B?bzVOZll0NklWMUxCbSt5ZEh3dFA2WjUrbDZPRTVYeW9sbEZOVmhHeWhDbzhT?=
 =?utf-8?B?QXFxQ2M0MXB1UGV2aHBrZktlc0ZwS3VQRFNvY25GTUZvWlBiWm4yY2VWWGFt?=
 =?utf-8?B?eWU0cE5xWnJnSm1Zc0xzemJSVEw3LzNzcHl3TkNPaXY5VDhrUVExUmo1Y20z?=
 =?utf-8?B?NGQ1dVgrRzVQdm5aWklyMUZ0WDhrWjN6SWw2WHdJdUlKWVBKUVBESVRha1pF?=
 =?utf-8?B?TS9QWmR1eHNIZHFQRXhUWkg3d0hhTG1XSGphamdhUzVKRjFzdHNkcWphdnZI?=
 =?utf-8?B?QUFOVi9LVzhKdXRXc0RqN1VkOHo1Z0Y2VW1PRm52WXVPZHd1ZERiRUhkcmYy?=
 =?utf-8?B?c2JjQVZxMS9SdkNjam1jbXlzSmRROHJyZWduY2ZNWnZyeVV2TVA4blNQc2Np?=
 =?utf-8?Q?87mND6t8aDH1ABBPZV7GayKGx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5f36a6-0319-4cbc-b515-08dd6c745039
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 14:41:37.7161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ER0dYZAHfHNoPYPr/ELLiHR0cut2uB+oULxd9q1cmseKA97sFFulvE3yAqaBkHf7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7894
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

Am 26.03.25 um 15:39 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Add support for exporting a dma_fence fd for a specific point on a
> timeline.

Looks good on first glance. What's the userspace use case?

Regards,
Christian.

>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 8 ++++++--
>  include/uapi/drm/drm.h        | 2 ++
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 4f2ab8a7b50f..eb7a2dd2e261 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -762,7 +762,7 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
>  }
>  
>  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
> -					int handle, int *p_fd)
> +					int handle, u64 point, int *p_fd)
>  {
>  	int ret;
>  	struct dma_fence *fence;
> @@ -772,7 +772,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
>  	if (fd < 0)
>  		return fd;
>  
> -	ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
> +	ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
>  	if (ret)
>  		goto err_put_fd;
>  
> @@ -882,8 +882,12 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>  
>  	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
>  		return drm_syncobj_export_sync_file(file_private, args->handle,
> +						    args->point,
>  						    &args->fd);
>  
> +	if (args->point)
> +		return -EINVAL;
> +
>  	return drm_syncobj_handle_to_fd(file_private, args->handle,
>  					&args->fd);
>  }
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 7fba37b94401..c71a8f4439f2 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -912,6 +912,8 @@ struct drm_syncobj_handle {
>  
>  	__s32 fd;
>  	__u32 pad;
> +
> +	__u64 point;
>  };
>  
>  struct drm_syncobj_transfer {

