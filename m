Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C80A86A87E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 07:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F9310E51C;
	Wed, 28 Feb 2024 06:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qo+3eXH8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2087.outbound.protection.outlook.com [40.107.101.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCC210E51C;
 Wed, 28 Feb 2024 06:46:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6UgaGQdKKb0RN1/+JHDc/BReMwJcuH1huipLPMOu7hYAs7D2PaUx/8mqHb8BfOaRCqIpdmFXl4jUZO2dqsKw9LXbh1W213n63zm1KT6DGLYHgUCwZU0A3W2x0h5WKRj1LP710wvhFWhBUNZNMNdz+UQm+RimlHguXCv3VFM2xliZPAC2e85DdXtYd46x/vLSUhPkiDdwwwmf5ZUPFnUkDDa3j+fM8AC+zeQGxZTrU6Z9pnbrq+RKrwRJMHwL9hw8KdGxfc67mbX99KZI362nw2yfRkovk6EDo2btl0fi7LDmNeZA1fRHSIAecDaxAUGcRsvrBc7q7/fy1oA8pvaYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDGS+TH2M/YhbrqkS/M58yCqKOQLGM4eFkFgNqWsAJ4=;
 b=ESTjqErM2qgZZFknINyndt44GrRahdhA3C/1d1LmHepkyQhB2pGkktUclb7/7wpZr5/z3qMYNDBh3etXT3GYRTuR6gQXpOmnHdQj+askadoShSLDKTPsD2T69Y7reM7n2fTujo8l9zUP4y8ToHs18DOaxRYWhysC29kz7muZEJpPRp5vT5S62Juwdby6bX/BDTqM8mo0FyVIiTV93uATroN/RkkMNqGjVLcZAs4lklOVKMRUqAglNwRvN3J775NJUt1oijVN4oNTP/h36kD7Yx91hMfqNPW5rm6OpGTd2PxWplBd8kTa3MO3cmsm254HudQlJsecBweaEF1JKyKgCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDGS+TH2M/YhbrqkS/M58yCqKOQLGM4eFkFgNqWsAJ4=;
 b=qo+3eXH8qZBToddBd0tM5ZmRg0k/32aeq/Qo4foqg4f0R3rZnjtYMS93fErrY8GIxB2lfN17rxq6gH4Zi/jB0Ti9Bqv+7e9faBBAaxn6NkPwAbzaQZJeE8lfI9I+bq6ui+9Y24Sk72vAUstzQGbAvU3zHIFeFVFO+SHN3milMkQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6028.namprd12.prod.outlook.com (2603:10b6:a03:489::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Wed, 28 Feb
 2024 06:46:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7316.031; Wed, 28 Feb 2024
 06:46:47 +0000
Message-ID: <562e35a8-b0fd-441b-a1cf-a786461a8fb6@amd.com>
Date: Wed, 28 Feb 2024 07:46:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/ttm: Fix TTM_PL_FLAG_DESIRED
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Zack Rusin <zack.rusin@broadcom.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20240227202645.20111-1-ville.syrjala@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240227202645.20111-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: 84df102e-d27b-461f-acdf-08dc3829088e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eGo+GYpXlYVBVdGVyBAfcVY8ENByt9oYfGvI4yGmo+03pVLwE+BEWyYSt2jLbgQNsA2CWCjiroetaWd1S9xnotWhycIc2msHjVMhyGNuTRf04XAPc8QD7NT0LD35ZMjfvyJ/V891HMRY25GAXviiVpATgJJ6hyDRny4E3yfxIN/YEYBlBS7cjn3OfB1Rwro4ocKvVVO+Mb/o7O70/MlJYGnBnyItqX3GKMR7HJiN5fOvUkBs/pxo6pNX8BP615aKmTTohpb8K5MfyXturNPlO7089Fc4QHASxLdP3YLf34qQPCGIPiRcYjveCDZcgVtwVG21hGY2dZMgt1Wu6MTUVzsmL6P0V4rac0JVIv/ppd01DtQEfb0JBrbe2ukodrIilkiFtiNstIOD7SFgVMrunHMraKRCdUaAUgwhDv6TUGUkhsAcLBu8MvtbXVXBn7CddECKH8wJL39HCGkxtw3yRDTppPfV4hCLAd6mIitnPnxOfZq+BRdqlhu8iTKaVgkQd5CxCUZ82HYQMQ3FR0IujKNdfX88DXXSM6yEXOp+uJBDQlsAbCOPCWrjmCcRQfFp2pqX3Peg/scgrdnqFdEgI0TcOmLV1euMmnhcjHuxiFWGT1GE19DCcontijsDF3ZgbBNdxkwaSrLBvjw8EEn78WyD9UeUnjD+QQswYtc5PNg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWtDMXRTOEkvSWJ2V2xTQ3UzVTVnSXF2cFBGdnl4VmlibzlXMGE2MVk3NU14?=
 =?utf-8?B?dzgrUjVkVXg3YXdqSlJEbk1oemlCK1Bvb2xwb0RqUWx4NmtEVTkvYVdxb1F2?=
 =?utf-8?B?SVVmb2d0MFYvcXdiU2NrOVZ4Q202MUsyaVRtVWxqdi9UR1QvN3N3aDcwOCs2?=
 =?utf-8?B?N0lvdTVRUmhJZFk1b3BnQWFLdERxU0drVTlFZndmd1huMHo0ZExNSXFaell6?=
 =?utf-8?B?bXZsYTJKL0xLclFLR2VpT3Fqd1VoSktwbzMxMWxlWXJreG1MN0ZGTmsrRElV?=
 =?utf-8?B?cldORmtSSDNMaXlHYzlOMUVlOGJuQUNGL2cwcE4wNlpZeVFObk91b3ExZmll?=
 =?utf-8?B?cjBNbEl4ejV3NytKVlJkRVU4MlVSeDJLTW9LOFRJM1dralVweFI4MnNZQlB4?=
 =?utf-8?B?UG9pajJpc1V5SThqazJ5Nk9mdEJ0VFhleGlzazJmQUYwbGE1Q3d6bnZXTy8x?=
 =?utf-8?B?RW1lWjR1OVdDbWI1R3ZHcG16Y2NNK3daWDdmbTdlKzNQZmFwK1h0Z0dMb1RM?=
 =?utf-8?B?ZmlpeWgwUkRlWTdqeTlHMTBLbVozVU5SRFhSSUcxTzQ4V01TMGU2L2orOVc5?=
 =?utf-8?B?b21XTEVDaURpaG9idXhhNlEzMHR5enN3QU5kMDBMcFRlbk0zdVV0YjIxNXpj?=
 =?utf-8?B?S0VacWM1enh4ekRJV1N0VnJjMjM4NHRUcVZNZTNRTENhWE4rUUJoQ1M1aVBr?=
 =?utf-8?B?Rnd0dkJ1dVE2ZEkySEFGZi80SnE0b3JaSVNBN2NDVmkrS0dEOW1xdTdBc0Fo?=
 =?utf-8?B?RnBPL0dVbDlGdXFlUS9mWG8rQzY3UFJMeG1DQjR1d1Y4SzY2dHJ6dkJZRUpQ?=
 =?utf-8?B?U1FIT291cHJrV3lCWGU0L1ptSnByeHF6TStrVzZBc2lseU5CMEpaU1lRVW4v?=
 =?utf-8?B?WWRYaklwZk01TUROalRQRzhyMVpyaE1yNXQ0MHlMN2V1WE9ZT3ZIRkc5Uitt?=
 =?utf-8?B?ZmNQbEdQbWJqWjFSSHg2bUJBdjN5bVZZd0JoU0ZPbUV1NllyaldVd0xvclph?=
 =?utf-8?B?RnFrei9BTXNwYkxNT0tKRHVpSDEyTnFsRHN2a3R3bURuMit4K3RHU25QRjEr?=
 =?utf-8?B?RUIvLy8wdDFPTkM0MEIxcWFPcnpNOHZUbXFYRjJ4LzI2QXljR3lGRUJ4QXZj?=
 =?utf-8?B?OHB6UlBrUGJxeXF2aDkzVmhvbndRdW15WHFXQUVWVVJyYlV5ejJSSXY3WkEz?=
 =?utf-8?B?NHdhYjQ2b0xDMnJTM0FTcHdDbkFlQ1Ayd3NVVnVFZXl0SzNFbXJOK09MVndP?=
 =?utf-8?B?b0lGNitITnBxNEJCNVhJVk5CZENwS1BDS3JocUR2Mi8zNk5IZHZrUWd6VVQ1?=
 =?utf-8?B?ZGk0QXIwMDJDYkp4OWFaOVNyQ0prYkIyWEN1djBtczFjUU01cEdaVjVpL0xx?=
 =?utf-8?B?MnVxWGpwVm5vUHlBMWk4WHdhRC84SnZIQll6OUJGakc4ZW1tWkpYK2pUQ0NR?=
 =?utf-8?B?WXl6U04wblN2ZjdJODFnR1lVQXdqTXBJVXZpTHg4eklUQjlVMXJpeW4rSmQz?=
 =?utf-8?B?cVNaQnVHZTFuVFVrQTU1cHEyT3U4djdJMjFkTjQzcHFjQ0xxL3NMaWlPVnBv?=
 =?utf-8?B?YkVmcmt1ekp4dCtUcG14aUhGLzlEcXFjSW1kZWJNWFJpMU5KRXBXNEhkbnRs?=
 =?utf-8?B?djRwaW1EQjViL2d2MjY5WEx4Vm15K3lOcGFmbGZVYkcxc0lzOGxwUkl0aEpO?=
 =?utf-8?B?M2s0RnA3WUhpZENNZ2loVWY1d2N4N0grRklsbGFqdnQxcCt0b3psOUxmbTdI?=
 =?utf-8?B?bjZTanRMQnJBcHR1MUNBM3kvOTlQLzBmbkkvaFJDK3Y2NExDZVNmK3FJVkwy?=
 =?utf-8?B?SVhEaGMwNDZwRm9KUHVNNnBZVEpDUys0a3pCSUsydDN2c01jeXA3TFJGZ3Rt?=
 =?utf-8?B?d0oweHpnbnFmb1VrY3NkOXFiblNtZmtqU3BIdGcrZy91dG1TcmV5WERRTStN?=
 =?utf-8?B?NlVoVTBDTjlJcGt5ZWx2ZUhHbVdaM05qQllwbEtSVDlHK045V3BCMVpHQlFF?=
 =?utf-8?B?a0NUSHRScWNreWRnNjNoOEZYYmdOcmNWYkUrSkpLS01IR01zMlQvc0FUSU10?=
 =?utf-8?B?Y0RZVkpHZjlCcTB4emRHaDcvS2lXNHJ0a21IU3RSRTB3VXJLaEJuNlRJQUZY?=
 =?utf-8?Q?VKZE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84df102e-d27b-461f-acdf-08dc3829088e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 06:46:46.9480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oq4QO8jpXRaPYUd8DcB+c0fcRqmGklVXveKvFgIamXXZThe5rIiTOmS03dnnchW+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6028
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

Am 27.02.24 um 21:26 schrieb Ville Syrjala:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> inlined from ‘i915_ttm_get_pages’ at ../drivers/gpu/drm/i915/gem/i915_gem_ttm.c:847:2:
> ../drivers/gpu/drm/i915/gem/i915_gem_ttm.c:165:18: warning: ‘places[0].flags’ is used uninitialized [-Wuninitialized]
>    165 |         places[0].flags |= TTM_PL_FLAG_DESIRED;
>        |         ~~~~~~~~~^~~~~~
> ../drivers/gpu/drm/i915/gem/i915_gem_ttm.c: In function ‘i915_ttm_get_pages’:
> ../drivers/gpu/drm/i915/gem/i915_gem_ttm.c:837:26: note: ‘places’ declared here
>    837 |         struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1];
>        |                          ^~~~~~
>
> Furhermore we then proceed to call i915_ttm_place_from_region() which
> memset()s the whole thing back to zero anyway. So in the end we lose
> the TTM_PL_FLAG_DESIRED flag (and fortunately also whatever else stack
> garbage happened to be in the flags at this point).
>
> No idea what functional changes this will result in...

I've already send out the same patch yesterday. Please review that one.

Sorry for the noise, didn't realized that i915_ttm_place_from_region() 
was initializing the flags and not the caller while converting this.

Thanks,
Christian.

>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Fixes: a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 27dcfd8a34bb..e6f177183c0f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -162,10 +162,10 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
>   	unsigned int flags = obj->flags;
>   	unsigned int i;
>   
> -	places[0].flags |= TTM_PL_FLAG_DESIRED;
>   	i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
>   				   obj->mm.region, &places[0], obj->bo_offset,
>   				   obj->base.size, flags);
> +	places[0].flags |= TTM_PL_FLAG_DESIRED;
>   
>   	/* Cache this on object? */
>   	for (i = 0; i < num_allowed; ++i) {

