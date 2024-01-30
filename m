Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5438842A8B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 18:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75161131D4;
	Tue, 30 Jan 2024 17:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85E21131D2;
 Tue, 30 Jan 2024 17:11:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYUHGmg/x2Mcc/nESIx4YD7gmCcNDpuW8QUSgzwD4YOglbiSprorL+ByXejWT+hTuHyGMeH4b2rPWwysGMYXlIyZA+qlFE9VS74vuLE9MykNpdoTT3qQl5kDjKUMLz0Xdiq9wJlxI7XRLuLW1BH8w62VsflKR73yIJUu1BZTScTcDzkqWMzpnqWEQc272HYth+xfZno5pNuv1eX8fyCOcESGzOLXo71TUY3XL3euB2f7WUKXxGca2jkwGabENpcSc5qJqs2CzPvaetm8PYM3BQtcUM2+oS9zxyKUvoikl60RUwzDWA3m82sud57myF8RySyG3LWGyXwrbQ1mbtdg+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLduJzD5k+0ZEqlPnd8PrXyv5Dlq6kz+3kGK6SQv7Q4=;
 b=DprLtVA2JWDGvuRy79Kcjiv9J21YEfEFUdbPHfleaeigJpG3GeBewPh3bEfVrkKIWojrPCsFSIh3v28zFdFT52fHcFXxv3IJfxDErw7HQFoVzXMjHj+42P4tWJqz4cgUR27ZcoQWI5vkxHqK5fGMeO0m7rMLIhk9th7h3UKdBbFIXDAQsXAri7LxyTnCSQVdebn/WYsx390dYtqskpFNvtFf49k5Gk0f/kkkO6xW0ekfo+DIbzriM31NWKoovfD1Bs0Lmwo03i+5L21enZt0SXBDRuBK0L9QugsPlgbze6Rq4PeUq2KVUwsEu/qxnf0h6X4MH/efXs8wMLmCt+fAdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLduJzD5k+0ZEqlPnd8PrXyv5Dlq6kz+3kGK6SQv7Q4=;
 b=0AD7g69z5l6OPp/cW9AeJazYTvdAH7vP6PWgmjQ2MCaOrzYQLwUWz72yNoldPakgjPF5lNUHKg/80IQbejLoVCi33+sYforsvJLvm7mTU37vWgnmJlEraWa19BAIwVnCQzss1/TBmGbv6MzXT3DBkMd+qMwKwWCav7FrGprMnyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 IA1PR12MB6308.namprd12.prod.outlook.com (2603:10b6:208:3e4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Tue, 30 Jan
 2024 17:11:11 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::c64d:9152:25d4:c658]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::c64d:9152:25d4:c658%4]) with mapi id 15.20.7228.035; Tue, 30 Jan 2024
 17:11:11 +0000
Message-ID: <03d7040c-7b77-4498-8d5f-aa928c83aa23@amd.com>
Date: Tue, 30 Jan 2024 12:11:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm: add drm_gem_object_is_shared_for_memory_stats()
 helper
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 daniel@ffwll.ch
References: <20240130161235.3237122-1-alexander.deucher@amd.com>
 <20240130161235.3237122-3-alexander.deucher@amd.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20240130161235.3237122-3-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::6) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|IA1PR12MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f40169-f845-43ac-2c36-08dc21b674ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 15fWVGf5zraC64ErlnnkYPuGrfeZkEMJNgElntKaoq/WN9+AxuxuQzMY7jH6Odq7N3CIWBNe9IRztpZw4AG0zoa4WEdkiGzeTEtgcnP6nrak9hXaf/DQLvgAsr12d7tMFK8V1pqkuHklcqT/N34W729+oG68upqQkaTak9cTz2sow1tlFJn+ytTnfbY/j1yLiN6lTlnRb4pl7iDOuEfbZ0eyIIMGtDGwpSKiWUqaiAbv1WJSDL3c0x6hzl9sCaQGcuPapX1ayHq/QWrcC0oTZwR0x+V/t/tpuMvnIIDtoIkzD9+vfsxTC+HsxVWbuEjcXk+RJTELy7MbOZrbJeT9WclMMUyvJhNCFTKz7FC1Iw606OwbvEcUSbWRjC0xh1QfNaWIgldG0+x5bTrT8QtydienG+y2baz+jYy2qCkMz55Y4T9dMUO9TW8/8MFukjnTT178azh4G7ELe5Rr2TtX86POq4eqfs22BnyqYIGuV6/Lp+4yeTWcH8I8y93uFkjqegT41cmDi7rCoaEhaBsuadBPX1E4rheFAs/y9q/+gjFqGEnHEMDMCd24FN3GOj0/KylAO9fyg2SZlyFYEHUHqk3773NEUztIi0VXN6q4UP9y2ZMOS1TtOaq2O1X5mIhtQ7ssOQE1fOyuwDqTkZy7Ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(26005)(2616005)(41300700001)(31686004)(966005)(66476007)(36756003)(316002)(6512007)(478600001)(6486002)(53546011)(6506007)(6666004)(83380400001)(38100700002)(2906002)(31696002)(86362001)(66556008)(66946007)(5660300002)(8676002)(44832011)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djFHTU5qUURkUWpYYnMvcnRpZ0ZpZDRPR29oZS81WmNBZ0kwQmM0K0F3bHpG?=
 =?utf-8?B?d1dEcm5NV2daWnNyNjFoSVI0c3RkYmtHQUh1TFRyOWM3UzhzeG9TOTZhanZW?=
 =?utf-8?B?NjJoNVFkNUl6M1dBVmgrZ3hFdjcrcXU0N1cxQ0pacVFRYlUxam5Vbk1FV3BW?=
 =?utf-8?B?b0xWSDloSkZCRHlWR2pwcm5XTllraHpmeVJGdmFFVjdDWDNlSkI4U3pzMHd6?=
 =?utf-8?B?c21LbXhFemlWYTVNOUtXRDRYbXRjaHdWMnYxNGd2elM5ZW1WMEh6Umw1cS9u?=
 =?utf-8?B?OTRMRzEwME1SbmhMNkQvRmxYV0lLL01ta1FTeDBwL1F4ZURUMkNjM3JiNmRX?=
 =?utf-8?B?K21ZY01Fd1NMamplb2hkZ3o1TUJFdDBPdXdhZzB1cGN2QUsyOHZNbDNKOGJE?=
 =?utf-8?B?L1NUenNMMnlMWWpWeXRxTnhBSFF3aGFIejNORVMzdnRBZFhkV0VaUFd3dFkr?=
 =?utf-8?B?Z2ZHYVYydmpBTUtLK3d3dlhoWUdEQUovbFZiUkQxa093WXRydEsrZjZZcm40?=
 =?utf-8?B?akFGRmZPQm5WQ1FteVdkK05jTnNWQVAwSlg3akVyMWp1dTdmWERjZjh5Tm1t?=
 =?utf-8?B?U3dyN2dWMUJTL3BKd2RaNVdKa1BtWk96V2diRWRkSjRZVnF6R2E0L2FId2x0?=
 =?utf-8?B?S0JSTi9yV2kyZG1DeDJNQ2NlWFUxUnZoZ25GbkE4TWJYWEtzVGx0MHY3SzVy?=
 =?utf-8?B?VFZHbmVwY0ordEQvcUlYK2NVKzFRZkRUNU43NTl6M1V1dlFBeldVVFovWW1K?=
 =?utf-8?B?SURTa0o3SURuaHZXN2dCTHpSS3B1MlRVVDROeHBCbFpxUlROMWxOdFBZTDEz?=
 =?utf-8?B?UnhkUE1oMzRkbXFtS2V2bFdaZENJOWtpWDd3STZVWlpFYmwzSitPdkIzZ3FG?=
 =?utf-8?B?RGIwYTd5VklGM1VSTmsrSjMzZnFBOGlUMU8zZGlGRHE4TlBrdTJiekpuZEUx?=
 =?utf-8?B?NEpKanRjYmlEUUc0eE9sWkZXcW9ac0dHbnUrQzFQSDdPcVFJdVJXcTdyOWdu?=
 =?utf-8?B?aGJKeUEyT20xSWhCNWtvZzFFRUJ0ekZHZWx5SUJlWkZSemE1bkxaVDFRMG5O?=
 =?utf-8?B?RXYyOXdyTkcwVjVnb1hWbi9JaHFudHBKTlorNXpCaWZwb29iU1J4TE9OdFI5?=
 =?utf-8?B?S3pYWmNyRzdPYmJmbTRjejMvZ0NZT0RUbXhrZlEydytCZURib09vTWVhL3Bl?=
 =?utf-8?B?Z09lV1hERFdMdlF0akVodmlNZi9BWmJXYXQwNEgwbmNBTWdaYVJKbGJCQWJK?=
 =?utf-8?B?TTljNWJNTkFpSG95b1RRN0NNQ0NTNWpTS2I0ajJGZHdhWHhnRTRRa0t6K2wx?=
 =?utf-8?B?ZGgzKzRnalNUSGVRRk9ZN1BZZWNpdk4xWnBGbHhCNnBmZHpaMTZpSGg1UTg4?=
 =?utf-8?B?SmZhdUJvdzhBa241ekdySVRINVdvS3pFc3k0RE1xeTVydGsvODhiemVFRllB?=
 =?utf-8?B?NDJibzFhcVpMNHFNK1lLSDBOME5IdFZDcG5kT25SbVY0eFNaNXZxQ0owQW9V?=
 =?utf-8?B?Q2pRL3pMQmg2NWJZTktpTUNpRHE2dFdKaVB4OENpU1lDUmdUUkoyOEF2eGJt?=
 =?utf-8?B?Y3hNa2FrbTE5VGJWNS9CTkFkdDRRUVV1M2FmMHkwaEpDQ3NLUFgyUTFWVGJS?=
 =?utf-8?B?a3ZiS2RmVkJ0TFJ3NjVsKzZEaGV0TDdvVEkvRTNUaFZmOTNHTG5QSmVRai9F?=
 =?utf-8?B?enVpb2JuanJ0OExlbHRBakJvVVM0Tm1hNFZlSmsvT2U3SFoyV1JFM3d1WnNp?=
 =?utf-8?B?RW51QksrV0NjM1FvY3Z5K3NZRHZZRncxN2dxeHZ0KzVzRE1vcG14clYzdlRH?=
 =?utf-8?B?NXl1bnd0eVdseXVzclRJWGI4L0VDM1NZMWJiY0dPMnY4Mzl3Z1ZCbWR5U3Fn?=
 =?utf-8?B?OUx3Q25TMENCMlRLUStsb0VlN3FYYU5BSUt2MzZIM3RsZ3loMVpKVi9uaHVD?=
 =?utf-8?B?d3dFbllWbUpHaUl4WmZYNytha1R1NnRQdFZFViswQ2VYU3VWRGJRMkp1NUp1?=
 =?utf-8?B?Qkg5Rm1WV1pVUTkxd3dFb3cyVnpmU08rQXo4S0ZwYmcvL291MGhpNUMwWUpS?=
 =?utf-8?B?WWxkSjljdTdaNjQ3TC9DYlVueDlIcnB2TnRWZUFRY3BFZHNrMWoyRUlISXA3?=
 =?utf-8?Q?pq9TnHpjr75t4NxvyLkxvVY8Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f40169-f845-43ac-2c36-08dc21b674ee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 17:11:11.0352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eL7MQqn65WcSw1pF+x/s5UMftPhJdlRnY3nJqrLxvNsrb8s7GpfPHzSTI7iRZ4mQTdNka+bjbo+ljf4hONAg8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6308
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

On 1/30/24 11:12, Alex Deucher wrote:
> Add a helper so that drm drivers can consistently report
> shared status via the fdinfo shared memory stats interface.
> 
> In addition to handle count, show buffers as shared if they
> are shared via dma-buf as well (e.g., shared with v4l or some
> other subsystem).
> 
> Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>   drivers/gpu/drm/drm_gem.c | 16 ++++++++++++++++
>   include/drm/drm_gem.h     |  1 +
>   2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 44a948b80ee1..71b5f628d828 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1506,3 +1506,19 @@ int drm_gem_evict(struct drm_gem_object *obj)
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_gem_evict);
> +
> +/**
> + * drm_gem_object_is_shared_for_memory_stats - helper for shared memory stats
> + *
> + * This helper should only be used for fdinfo shared memory stats to determine
> + * if a GEM object is shared.
> + *
> + * @obj: obj in question
> + */
> +bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_object *obj)
> +{
> +	if ((obj->handle_count > 1) || obj->dma_buf)
> +		return true;
> +	return false;

nit: you can simplify this to:
	return (obj->handle_count > 1) || obj->dma_buf;

(It maybe worth just inlining this to drm_gem.h).

> +}
> +EXPORT_SYMBOL(drm_gem_object_is_shared_for_memory_stats);
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 369505447acd..86a9c696f038 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -552,6 +552,7 @@ unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
>   			       bool (*shrink)(struct drm_gem_object *obj));
>   
>   int drm_gem_evict(struct drm_gem_object *obj);
> +bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_object *obj);
>   
>   #ifdef CONFIG_LOCKDEP
>   /**
-- 
Hamza

