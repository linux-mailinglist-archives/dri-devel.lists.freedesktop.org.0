Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F6A4F3CB4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 19:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B319E10EC04;
	Tue,  5 Apr 2022 17:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C1310EC04;
 Tue,  5 Apr 2022 17:00:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqQZ6NCU5VOhj72Qsfr+htZee5eDN3kSAY8PIJoflHkBhFssomsMxb3fXSQHCJTVB56bVEc0EwLg+AftRlF95Z5IhiBF0u5xuGqPBd7eTdc3iSAQf2yJho8F2/a5Tij5rOHDkRmsd3T5T3RgkhFTsoga31jLra//O94cwaG10yjN59lgJNiTXP8LcmzLeCe39qvBFeoduMLfGlEnBzbk50AjQqx8Q8qXPG6pNqiWtFgwVQKuviBI2CJoojAxk68zxQz1sARLzJzEdVfOJ83C71wHsEtA5x0Uuss2y8FjvdI4DqEP3b6n1NqntqpYCFaU2tyKYhp8iYqDhKGRu7Ktsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRhaSgwQxursOeBtc3su16M0VCK+blA/0dBA1VenjL8=;
 b=V94L0D4RsMp4DGMAth0C/3OjCezFcBImYG6+dSM6PBCujw3/qQM2E8D/woeNeDB26/ViGCjJBL+VLv03oTE9OdeXlU5WCLVOK4Dt6ogI5Sh7NVz53HyK91/NOTzmiSzJz1NmNSxQvifo9/el6eQSSikV4EfCNSj8nOwarjkC6DiS0cts4OwYWQAz4Oi5MXab4yBC2WRZB3nx9HSwtdzolmsSVmsJBLsvRvs+ZoqHFzmTrJG5HUNgwtrFU6XTn7XL0yvsGZP31ssbzI0SDL63/emhtZBCAlOiiTSu+KC3VRro7/MvpyHll6+cpqRWiaQ8iUOCLKaDbsJeGz08fy5JqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRhaSgwQxursOeBtc3su16M0VCK+blA/0dBA1VenjL8=;
 b=oPylPikBGsqm+wt/eQTRAOu6YJ15mQIpOwnN+Dzegpdxliu5gIql5CZLmQ22j6V/yPRCKYZQa5gCxi10qXlQHujPtdWSfAI+2yFASOJu0JgOECn8M9IPqihZyCYCcG3IDbKNLkCP6medFmlp6DMMORbMGeBHdiub4yAhxwOnXW0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CO6PR12MB5474.namprd12.prod.outlook.com (2603:10b6:303:139::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 17:00:45 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5%3]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 17:00:44 +0000
Message-ID: <c55e9866-83f6-a3a0-2ad3-40090e978b40@amd.com>
Date: Tue, 5 Apr 2022 13:00:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amdkfd: Fix potential NULL pointer dereference
Content-Language: en-US
To: Grigory Vasilyev <h0tc0d3@gmail.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Melissa Wen <mwen@igalia.com>
References: <20220404222132.12740-1-h0tc0d3@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220404222132.12740-1-h0tc0d3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0115.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::24) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e58d55df-24a7-477a-d4f9-08da1725d2dc
X-MS-TrafficTypeDiagnostic: CO6PR12MB5474:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB54749A4C4B9C51296BBEEA2E92E49@CO6PR12MB5474.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cvOjWkzxtFGgp1x+8pubBFHIzA7ofEHVS6FnkBS5br2GBpR1CdQi3oKLl+K8m631CvPMdBSfKbDPzM4NRgmFjSkGF1rLegK3V8fIwbphjhu5AH7lm8EGPaQZMaek6lwvzr0BmSpWS/m7eWbc/gWPguAWCdm7hgy4T0YwLo2DLoeA+KyEnns1GsFtm63wTxLQg1icg7wQj4+t/8I0iFH26vyaq+KLDEppBouEeSCYbmZJJNwah2MnaQnk3Jb8TfHis8zSxp0VHGUVHSa1Lql9Qe5MuZQEau9tdWiFI0qi05WT1NmAw2f2KrwC+mFzNlkQLFcsngsFKd8xEt/3ZbR+iSqLdRE3kjT1NGlbhB57d7lq9CQ9OGIzheQP/zy/ltV2f+wYuQqWAxVrqkdGocFyZ0LpubgG2DFSk5/RRvsgqLNtvkLtCYBu2NSEYhJ8CoSkvO5RPwMZn40TyUtrSAoeRz2CRrOTGYg7y9Q1o3ByMA8rAS99hg9KUqrEzsLwa7IJWXetB2fLdiYJcE2YBRoHxSgSQ5X9NJ0CbFuAhm8491aCiFQpy2QDSU4J8C+T2gc9FR1ibu/xxkNJB5kMeHafADtmSUX2b1b5W65biLem8fL4KcsrIYFvu63ZmaUe5VwOzGp33AUM0kfEJSef82JLZ/D4ooWZAKUl5Aherdiax1grCtGwGTgfhGR6VD1WxL2st5QKc0VZXoaxym9y04IaQPaSwOoCAxRXD5PH4zsofiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(36756003)(26005)(2616005)(4326008)(66946007)(186003)(6512007)(38100700002)(66476007)(31686004)(66556008)(83380400001)(6506007)(8936002)(110136005)(31696002)(508600001)(5660300002)(44832011)(2906002)(54906003)(6486002)(316002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUIyRXB5dzNTK2loOHA5ZEJoVWNYQi8xQ0YrZ0Jwc0hDZG03U3llSERTVnp4?=
 =?utf-8?B?Y1ZzUmhHVENUcHJsdEovaWZIL3paTDhCdEZwa0dQTXl2YWVQd3c3UE5iQnNk?=
 =?utf-8?B?Zm42bUVvd3lieERxdW5yU00zVUNydXJDd0xSV0dKWVVrNTNtbk9PZFM5cXhX?=
 =?utf-8?B?anEyOFhxcS9NQzI3NFlNK2lQeGRFektQdFNPWGJqZW1yNUxqVDZTOHpodW4w?=
 =?utf-8?B?cHhDRi9HQjkyT1lHR0ZNSkZNSU5ZT3pTSUc4RkpWSGQzVlRoY0pCODkxaDV0?=
 =?utf-8?B?YWdVeGZ4ZG1DdnIrekdDbWlaWFE4OER3RDhlNmg2RlJHc2VXMVBpZzNUdTQw?=
 =?utf-8?B?RVByR0NLdjZFSDlXdno1aEgwYUJmZzk5aWNkZEp0M2hHTmZhNU1WYXhacHJn?=
 =?utf-8?B?blgzRjg4UExReWlveUo0THdqeVZVRnYwUkJ1OU9QU0VpVVZ1SHFlUmVHOFhL?=
 =?utf-8?B?Tm0vdUtWSnk0MGNCRGp3RnorVGtsdnJ6WmhoaS9UNmRCUi9lZ0JjeHZhbU1v?=
 =?utf-8?B?NVJ5bWZUWTJkelg2ZEFCc3k2UEgxaWhhRlFwWE1tMCt1ZSs2MmVTT2FNZ25t?=
 =?utf-8?B?d0N6OVMyZHJLSFBlOHZBZEJrWTlrZlBQMmd2dzA3MXJ0aVhwbFBvNWNhVmUy?=
 =?utf-8?B?T1N6eEhQM0FVcWtKdmk4ek0xN21UcEROSWRiR1I0d21uZ2x5YUZvc2Q5dmVp?=
 =?utf-8?B?cm0vVHhaMUcwVGZRM3JlVDZUaGN3RWRYRFJZK0p4ZkQ0WmtOa0FHQWxybVlT?=
 =?utf-8?B?OXJpS1o2T1NJYkh5dHBPZjM0UUU2R3libStUbDBicGpJc08rc1hWaUc0Yk01?=
 =?utf-8?B?ZXdhSThYZGl3SjVXdk9URHd3Z2JTNDBidVZDQ1hjajJaM0MyMkpGcHZERXlO?=
 =?utf-8?B?b24zampsa1pTNm1iV3J5dmVjLzJTeG9YOW9XUVpuZ2pibGRuSllDVDNoU2J2?=
 =?utf-8?B?SXFtQUhwb0l4SnJsNGhTUVNRYVVneEhibEZ2UHBYb0lRTVN3Ni9pb1BiT2ZI?=
 =?utf-8?B?M2dSMkFJU3l6Z2JpUmltcFQyNm53QVk4bkVhTVg0RjhxSkJweXozU2c5dkEv?=
 =?utf-8?B?Skp2OFExUldLcXkrN1FwTUIvbGJYalR6Vko3VnljSVJuY2FtV3AxR1lLSWVK?=
 =?utf-8?B?UnZhOVNJK2VVaHphMVlJS3JLMGF1ZURhR1Q4M0lvYW0vbVo3Uk9rMlJoR1VI?=
 =?utf-8?B?Q0tmWlk5dytjMnJwa0xIOHFMbVd5L1FORTRlblQ1bEJBOHBNR0Q2N01uVkps?=
 =?utf-8?B?YTFRVjE0VTk2U0pLZHJmZWp6UHRPbXcwUG5HalQvdi9iZUFZa1VqYXpzWjI2?=
 =?utf-8?B?TFhETGlNbDRmbW84YmNnUHBQY2w5TDcrTFQxcUk4dldXRDhLUVVYRW9haDBq?=
 =?utf-8?B?Vi9SNmNLeXA2bjgyNmwvUUQ0U0ZaUjBCRFNHNnE4bzlOeWRaejUrblEzUmRl?=
 =?utf-8?B?anpMTzN1alltOVNXNUZOM0Q4TGhDYS9DVUZuYS9QbTc4ODFFQXpOekFRemhD?=
 =?utf-8?B?T1dWRmlvK0JqVmxNTDBhbENqR2pzY0I3a3VXT2orKzVqY2o0Wk9TODJyeE5P?=
 =?utf-8?B?YjZvVzJCdlZveVMvYTZZS2p0V1IxY1Zja29Dbit4MEs4dUV4bHErMi94WndJ?=
 =?utf-8?B?NVIvNEhjd1RueTFMVElxUVN0WE9xNktsMHZFZXhRZUhZcnpmMHVBS2FYSXBi?=
 =?utf-8?B?MHp1VWg5eTkrbUhwRTRLUDJoVkx0K3RONTdDT1FFUFIwbjZpS0V4NkYyUnpy?=
 =?utf-8?B?M1Q0K3FINzgvN3BsNmplYjVlayszYzRGMzJYZ1Fjc3d2RVNxN3RaQkdzZlFY?=
 =?utf-8?B?czZuWmdCMnNBS0JycVNLMFVoL1hGa3VFdUtJUFJLNTZjUEJvNFFGNGtscXRE?=
 =?utf-8?B?NC9YMWljVUJUTmJqVjdQbUd6enlaeUlhU2dudXRIRThGTkJoYWI0UjZIcWdN?=
 =?utf-8?B?RmN1YW8ycFRUUGtwYm9SNnZ5UTlBQ21ObkJ4eFQxV20vV2lTVWdELzdHcUQ4?=
 =?utf-8?B?eHhKcVBtekpkTWJKemNqRmRNRzEzVWVvS3JuSWIxRGFTczQzWkxxa09YREpa?=
 =?utf-8?B?MXpwQ1YwTDBqcTZEb3o4c1NXMDdSNWl6NXVCNmxKVlJaTlVVektlT2xYL3E5?=
 =?utf-8?B?eFI0NGZobUlPUVJUcXdzdmdMODJ3Vjlqc3NvNGdYWGxFNTR2ZmwvMFdiZzdJ?=
 =?utf-8?B?VU55dGFkWVRVeXVWQ3pEUUovTlduSTRrSDR4UDdDcy9XMjFzQ0huTy9GazEz?=
 =?utf-8?B?WGZGQnRIUFR4akRJQWJnWHl3amFQV2FJUyttV0phY0dONEhycUtvVVY5RFhU?=
 =?utf-8?B?UDlzanVycTJQME52OVV2SitPbU9MUmRqYlFlRFVNeFhyMDlGZ0JtZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58d55df-24a7-477a-d4f9-08da1725d2dc
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 17:00:44.7606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cSFjzYDu1rICe6cV4W256XyAHzXOktmnWKAirf4l0dzwAiJWbGaYYlUv9qi/nmE/ATXqmjPL9hz+Ne+iu1ONg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5474
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-04-04 um 18:21 schrieb Grigory Vasilyev:
> In the amdgpu_amdkfd_get_xgmi_bandwidth_mbytes function,
> the peer_adev pointer can be NULL and is passed to amdgpu_xgmi_get_num_links.
>
> In amdgpu_xgmi_get_num_links, peer_adev pointer is dereferenced
> without any checks: peer_adev->gmc.xgmi.node_id .

What's worse, peer_adev is uninitialized with an undefined value if src 
is NULL. So that code was definitely bogus.

However, I think your patch will result in incorrect results. Currently 
amdgpu_amdkfd_get_xgmi_bandwidth is always called with is_min=true if 
src==NULL, and with is_min=false if src!=NULL. The intention is, that we 
assume a single XGMI link in the case that src==NULL. That means the 
is_min parameter is redundant. What we should do instead is, assume that 
num_links==1 if src==NULL, and drop the is_min parameter.

That would keep things working the way they do now, and prevent 
potential problems in the future.

Regards,
   Felix


>
> Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> index be1a55f8b8c5..1a1006b18016 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> @@ -541,11 +541,10 @@ int amdgpu_amdkfd_get_xgmi_bandwidth_mbytes(struct amdgpu_device *dst,
>   	struct amdgpu_device *adev = dst, *peer_adev;
>   	int num_links;
>   
> -	if (adev->asic_type != CHIP_ALDEBARAN)
> +	if (!src || adev->asic_type != CHIP_ALDEBARAN)
>   		return 0;
>   
> -	if (src)
> -		peer_adev = src;
> +	peer_adev = src;
>   
>   	/* num links returns 0 for indirect peers since indirect route is unknown. */
>   	num_links = is_min ? 1 : amdgpu_xgmi_get_num_links(adev, peer_adev);
