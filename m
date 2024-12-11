Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5429EC6C6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 09:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049BA10EAB0;
	Wed, 11 Dec 2024 08:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="olofVtKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A088610EAAF;
 Wed, 11 Dec 2024 08:16:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y27KTvOsOAO5+lSoYwo7784eRT9QrJ0x7rQX4d2iMGKDpGWVDmEZTlAsP2vm4XyJ1S2yYm9hS7jR33fDL2AVQrUe36clP1I+4DPvAp29Abf2/cXst6yM0XsGRubqtJpSdiXGPXu64XRNSFe+06lX60SmiBDtrbqPmXUaolPg+2ObHy+fzAnKcRgOTyA8kVY9sYGkmA8SMAYw880t7+aL9Nd114vYcJJsjU/Ad7aaJikCgUrtfL2Byc1tiyz8egzm9UvmAcRylMGYlGmeHYepm1A2MFtMtw2TA0YKzjgmSSK92oeQcHZxM/vbTwLpY3MmB3hfbCfb3/QoF7KFs0OTTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gY9a/yswCFdhy6I6itwbSAHPrVmR6C3bMSXla707lz8=;
 b=s/ddd1LP8kOVFQz+SqR/burnOhIpE7UddNKbxqG11fmbg5ZqgcRnv0UuQAz2COTmHgv3HuIDhYgjZ2sRckrMkBFVqMTtZ7032GkzPNqIMmyz/6EJCIRFFoXCrEOaZmqdXIBfkf0WdxiRIC80l7QbQZ7ADFotdybuqfdHAfzkW/stmjTYkNkPANv/bWPcabBLsE3yNWt5iBL86itSxRNgr3GW/oIOb7EN2eP1exo9mM0+b2T3eP0kHbE9DdSweR8PDRREMzOJa2u4iUWI/En+tpi8qWMJStC3wNLW4en7Wx4rnkmbL0bW/OJeTJXV1JJYIcnPmM28pPpmvb51lE9qyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gY9a/yswCFdhy6I6itwbSAHPrVmR6C3bMSXla707lz8=;
 b=olofVtKT/UWk1xPuwwfDA/aZ5NRaVZizFjDbLxLojaYy8G0idtbvnRFCedw+loOqm3ZddzAOI9oZ7kdE0wIpxdGwr1yQ8PaVNEy/NK+C+s06oCuRNPgq6NZ+nbBeF8GvO/Rn/BfWQ3RVoZZ18kN04c4r7JXqaHpZxB+LZQCkHlw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8792.namprd12.prod.outlook.com (2603:10b6:806:341::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 08:16:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 08:16:01 +0000
Message-ID: <674b6d62-2274-4b0d-8d27-382faad5de88@amd.com>
Date: Wed, 11 Dec 2024 09:15:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] drm: consider GEM object shared when it is
 exported
To: Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 tvrtko.ursulin@igalia.com
Cc: Alexander.Deucher@amd.com, dri-devel@lists.freedesktop.org
References: <20241210175939.2498-1-Yunxiang.Li@amd.com>
 <20241210175939.2498-5-Yunxiang.Li@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241210175939.2498-5-Yunxiang.Li@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8792:EE_
X-MS-Office365-Filtering-Correlation-Id: cb32ed22-2204-4880-9d09-08dd19bc0c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXhPQXNsMFZpZGtTakNFK1lsQXdvSUVIc0ZEOHA5L2d0RFIwMTYxei9ZdCtH?=
 =?utf-8?B?Qit0RW0rWlFacG40VHhzRmd1N1FsVmVTQWhPNk5vUVdYZ0lIK1NUVTlUMFpF?=
 =?utf-8?B?Y1ZWZzlDY0lib1VGaFFHeFNhT3FVMmt2OFlJR0JHeVdHQlAzaUY3Ynkwb04v?=
 =?utf-8?B?Y2NZcFplOTgySCt4SXZrQ1RCcFlIckVGSmR1dmUyY0tGeHFhMjlYWnRxMVZv?=
 =?utf-8?B?aW9xTzM2M3dZYzlvMXllaS9aRXhqUy9oOU95YmNEL1lvckNPbHVSZWc5MDVC?=
 =?utf-8?B?b2tpWG5BeGkzVWg0THIrR1d4dFVnTEptWjQvNERqWUU3MEF2aUZadGpIUitR?=
 =?utf-8?B?L2taVWg0SytuTEJ5enF5M29VcGZFcGxBSlh6bWtaSDB4T1VGN2FzeWdoSWtl?=
 =?utf-8?B?N3JlQVR0ZWZETHF4bkd2Q3BzUi84SEVZZnlKdHRPOXRhRk1nOUo4VHBxKzNi?=
 =?utf-8?B?SnVIbU9mS2RDT0NzbnBiamIyT2I3TU5sMXBYS1lVMGpMWEpLQThsL0kwd3dw?=
 =?utf-8?B?eHhhMXU5bi9RSWVnNzNXQzJNb0VsckU3QjEvcXBDTDB1Q29xczdkY0NCTis4?=
 =?utf-8?B?OE5yUndCVWhpaGdoOUV5em9idjgzWEQ3WGVVQ1JmQlJPWlpYdkxXTGViN1Bs?=
 =?utf-8?B?NjRUeVlyZGs1Ly8yY082VDJmUWxQQlRpQzN5aTEyUERic0xsTWFjeUc1eldn?=
 =?utf-8?B?ODdWMW1yaVNhRkNHeDhXL3ZHYVAxM0htczRQTjBSK1pvTDN0WmJUM0hvSHRQ?=
 =?utf-8?B?NG1XS296aEhLd3p6ZXRQVHZLRmppazZrYzRlQ3Z6eWRzSTlDTWh6bmsvRlgx?=
 =?utf-8?B?WklabFhld05wMmJENm03R3NCNW0vZG9MTWhqa1lEdk1nL2Q0ZEZMQndrd3U2?=
 =?utf-8?B?YWNyOVZ0dnlzaCtaNTFvckRrS2syemd2ZFNjSlVGYTkvV3ptRzNZZ3dIeGdY?=
 =?utf-8?B?TElGcFZRVTQ0bkdTeHhTR0dUYkl5TVY4L0FPNmtBekZpWC9DWTZoVlN6S2pH?=
 =?utf-8?B?OWJYeVduOTFBMGdmYnd6ZHBMSTZJSmUwbTZkS1pTeGNVOW0xSENtLzc1Mi94?=
 =?utf-8?B?amR0bGdPMm1xczlFZlNHSmN3T2tNaEIzQUllUXRmcjdUVnlGMm5RZ2c3dmpJ?=
 =?utf-8?B?VW4xNzdRWDlxQVpEdUgreEpZVjhJU0MyaXA3dnR2VGxnY2g3eXVySFV1b3c4?=
 =?utf-8?B?Rkt1cXZhN0ZtU3VjL0hES1hxbEJybnVLMmJFek8zYVBKbTE4TGNlU0tXSEpH?=
 =?utf-8?B?OFpHVVgzUUwyY1JSRHd0dklLeXVpcWh4N1dXSmhVT2N6eW44Ni94ejlCUUd6?=
 =?utf-8?B?ZStycGlDZDlBNXpBczQ1T0txb01tVm9TenAxRnRiKzExM0JMRk5OR1Y5Mmc2?=
 =?utf-8?B?TUdwbmRDVnQvTCt4K0V0aXo4cENDWjJxWjhvTUI2c041ZFBDaFZpQTFNbVhM?=
 =?utf-8?B?WCt4RFE2RlFKVk9mVHVDMWwwSTYyYkEyb0N2U1FhaklEVElmdW9ybkZKSDZJ?=
 =?utf-8?B?NkpxaVpicDNuczN3M1NpTzFxRUFVNmNXK1poT0x5bDNiMTNiSXZqQ1E3Snoz?=
 =?utf-8?B?cjQrblZSQjNRbGF4SmRrZDNaVS96RkxTcmlOWWNGTnBNQXhsYXN1d3hNaytk?=
 =?utf-8?B?Mzc3cjVyb0p0Qmp4UXdETUhiYzNMK3F0MlF2NWpGM3dwSncrbURhalQxUlBi?=
 =?utf-8?B?VTMrbjZkTi9JL3pPQjVuMEVwTXMwYmRvNm5wdlBjcnR3ZHR6N3pBNm1UWnZS?=
 =?utf-8?B?akZqQ1NRZlJ5Z1lmNDhJNngzRWMwNUlJOEUydTZkVDl5UGNEUTNCS1VuNHRN?=
 =?utf-8?B?OWMzcE9iQnJnVzQyTGRCZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3YrRHRSN1M3Q2t6ZlNFM3daa09ORW9ENmFaUHR4RVRpSllPMjZKYnIvZEto?=
 =?utf-8?B?aEZpbS96cnN0NjVJVWc0VHNPaG9SME5iVlRqckVhTDRmcFRYRDR5dVYxenJu?=
 =?utf-8?B?TXBzNjU3R3N2MFRRbzVJMzQ3S3dEVGVVUmxGalFvS0JraUVVTHUyd1VxdHhJ?=
 =?utf-8?B?TVRoNFE3d1RIQmRWYXZOemlJN1RnazFhVWNYZlBhWEZ3S1dNZEdETmlES2Ft?=
 =?utf-8?B?Mm01MnZPcG5CS0pBeHQ1OSsxV1kyeTVCZXNkZkE5aTZGWXpLOUZYdGVUY2hr?=
 =?utf-8?B?bUFtMERUZVlzbGJqeEdPSFA0TE1EZUlWZjJRUllGRFVvNHZjRnZBWm02TGNa?=
 =?utf-8?B?RFdwbHZNWDVJU3Zxb1ovVFdCTmZyYnp3SnFHRi9MYTZPbGF4TmtFSTh3MGRv?=
 =?utf-8?B?TVY1Sm16NDRnSVNJWlJEdHlpQU91VW9ZNHRtbXc1OFgxTjZFZWg3SllwMldY?=
 =?utf-8?B?SzNCN3F4N0xnVlU3UDBSMzRLc2RKQkF3MHhrdjJJcVl1RTJaS1JaQWtWKzFW?=
 =?utf-8?B?NHpmOUN1U2E1Rk1xUGdlb3pOWWFoNG1kaXBvRlNvZFFSbk9qZjNLdUxSQmsw?=
 =?utf-8?B?dWhMUkFWQWNDM3JuZ00veUlpNGhIRmJkdHd4dHVIbWNta2ZSNmo2NzR5ZlNS?=
 =?utf-8?B?NDlYVmtSc2E1MDFRd3o3WXRCZllMcXJaZ3JuRGdkWGpSenlkamptTGRZWTJG?=
 =?utf-8?B?WFUvRHBtdHRBVWdMcFc1OENkUWVMWE9IS3VNNVVYZ3NtT3NsalVhellUR2Q5?=
 =?utf-8?B?a21Rc3k3RHpCQkN0NVRZd1pIdEl2QVhobGtoUlpmdU9NamJJQmJMVU5VajJS?=
 =?utf-8?B?UkRuNGJVM0VLL3RReHpqdVBhc0tFa2tEYndBWUJPSU1XVi9EMkdGN0xmNmlF?=
 =?utf-8?B?YkpIakIvN1hSMU1zdnlWc3ZVc3ViejB4NzMyS096b0dKb2tUR05XMVdEdlI4?=
 =?utf-8?B?T3RlZTdMUzZhdnoxbS9VaUpvdVBYQWc3RnVyb3F1WjRhdlJGanFYUlBuajhw?=
 =?utf-8?B?amhqQTRpRXRjMHZEWUNkVlNNU2UySkxqa2w5K1h1L0FmZ0tjekZGNjg2VU9C?=
 =?utf-8?B?M3VxeUdmK1pZa3JIUG9aRll3NzVPZ3hMazIyZVlHZVNwRkdScW5CUG9SM3hZ?=
 =?utf-8?B?S1l1YmZDM2Z1c1VnMlpvUFcwZmhDLytlQmkrNDNEeHlRNmd5QmNsZERHVlRI?=
 =?utf-8?B?dTFORjdWMzJUV05UbG9rd2JaT2tPTTZ2Y0lhb2NlTzB0NFVPMzdJSEpzYmpK?=
 =?utf-8?B?c0V3UWgzUmJyR2hGS1d0My9rMWpHaCt4a1BCYkdvK0xwc1BSRVBxWDNRUCts?=
 =?utf-8?B?ZDZpdTFEUHFFNXp4cldaWlFpc1BVRHIwWUNDbnVaaUZlaDB2YVVRWW04V2Zi?=
 =?utf-8?B?cXkydjYvMWVzQWQ4Z04rQUZGcEVEdDQ3MXRpb2NuWHlEenlnczM2UktnTTdr?=
 =?utf-8?B?aitKVm9OanNLK3l2ZDBRaVJjampSbGJsWGg2cmF2TUxZOEJYa05NY2pBbktN?=
 =?utf-8?B?dWVDNUdmZzZ1TXEzUnhzbUZ1Q3lYSW94M2xoeXBFVUlWZjdvQmQyTDRWaU43?=
 =?utf-8?B?WmVMRG5XRGpvRU5CbUxXTDRKMGp1VG1lUVVYUnRkSFVsT09mU3dFbUxYN1Vt?=
 =?utf-8?B?RWdBTVZNTmtkWFFDWk5pUnUxN2pwdWRvUXZBKzE2dGdNZURjOURNdEpQTktM?=
 =?utf-8?B?ZWNYb0dvOEpwUUU1UDdrOWNId01vZWFPWXh0N0QyYUVLRkU4QThJa2tkb2NN?=
 =?utf-8?B?V3NWRVV2R2luWlZvdFdCcDdoS0hzVFNCa2NKQkVsbkh5ZHVab3hDdXJ6L2JZ?=
 =?utf-8?B?NTlYT1lzeFVFdkROUGFvQ011c0N0SWlTWWZTRGlTNkdCRGwwN21LYi9DeTVj?=
 =?utf-8?B?MkYzYWNqQ212SnJJZFVLSURQajRQUytCQVc3OGpNdWZyQzRUY3Boc2FqN2Zz?=
 =?utf-8?B?UUNmM29VaURZUUExZ2pIYkF6aStsRXNoZDBybEN0blZsdkdyc2R2YU45cTJx?=
 =?utf-8?B?UFY3VXhOWDl5Uys5VUVOZFNnR05rZmtOMG9ESHJSWFYwSnlGSzE2OVE2ekJh?=
 =?utf-8?B?T2QvUW9XUjRta0hRM2Y4cnN0bGYxRUMyclJUd2pJMlB3WklubFZ3VWM3cmQv?=
 =?utf-8?Q?I8f0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb32ed22-2204-4880-9d09-08dd19bc0c8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 08:16:01.4130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4vqjTFGAWeMVNtpJ/60IAgJfD2E8mbsdgXpJsboQleey9t/jV1+LCLy7jWozWUr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8792
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

Am 10.12.24 um 18:59 schrieb Yunxiang Li:
> Tracking the state of a GEM object for shared stats is quite difficult
> since the handle_count is managed behind driver's back. So instead
> considers GEM object shared the moment it is exported with flink ioctl.
> This makes it work the same to the dma_buf case. Add a callback for
> drivers to get notified when GEM object is being shared.

First of all GEM flink is pretty much deprecated, we only have it for 
compatibility reasons. So please don't change anything here.

Then flink is not the only way to create multiple handles for a GEM 
object. So this here won't handle all cases.

And finally we already have the .open and .close callbacks, which are 
called whenever a handle for a GEM object is created/destroyed. So it 
shouldn't be necessary in the first place.

Regards,
Christian.

>
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
>
> CC: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/drm_gem.c   |  3 +++
>   drivers/gpu/drm/drm_prime.c |  3 +++
>   include/drm/drm_gem.h       | 12 +++++++++++-
>   3 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index d4bbc5d109c8b..1ead11de31f6b 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -854,6 +854,9 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>   			goto err;
>   
>   		obj->name = ret;
> +
> +		if (obj->funcs->shared)
> +			obj->funcs->shared(obj);
>   	}
>   
>   	args->name = (uint64_t) obj->name;
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 0e3f8adf162f6..336d982d69807 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -406,6 +406,9 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
>   	obj->dma_buf = dmabuf;
>   	get_dma_buf(obj->dma_buf);
>   
> +	if (obj->funcs->shared)
> +		obj->funcs->shared(obj);
> +
>   	return dmabuf;
>   }
>   
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index da11c16e212aa..8c5ffcd485752 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -122,6 +122,16 @@ struct drm_gem_object_funcs {
>   	 */
>   	struct dma_buf *(*export)(struct drm_gem_object *obj, int flags);
>   
> +	/**
> +	 * @shared:
> +	 *
> +	 * Callback when GEM object becomes shared, see also
> +	 * drm_gem_object_is_shared_for_memory_stats
> +	 *
> +	 * This callback is optional.
> +	 */
> +	void (*shared)(struct drm_gem_object *obj);
> +
>   	/**
>   	 * @pin:
>   	 *
> @@ -568,7 +578,7 @@ int drm_gem_evict(struct drm_gem_object *obj);
>    */
>   static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_object *obj)
>   {
> -	return (obj->handle_count > 1) || obj->dma_buf;
> +	return obj->name || obj->dma_buf;
>   }
>   
>   #ifdef CONFIG_LOCKDEP

