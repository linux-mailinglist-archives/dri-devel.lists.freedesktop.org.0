Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040AD8CD54A
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 16:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C838010E474;
	Thu, 23 May 2024 14:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YL+dW5wB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A9910E3E4;
 Thu, 23 May 2024 14:03:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HT6eFmS8HjFAzzald/uDw3RK1cAKJnA8RkhLq27H/ChoKNAxPeMiRBbrLCCTfG43uH28thKhpzHt6GH6S3qIdpTdh5ZxrwLqfc10QL7bCepOtJokDWuwUqgnzP9SiUKX6KfcJVClJTvRmTR1MraFy7KK2BrmYJx7YV19EnM59fRQHcqNxdeGS/8u3pgowB+t9A6Ae6gnzdJLPzbOb4Rp6mhIKizPFsDizL1FVUrEuOcpFCEVnvN5KfCcWutIUHkqE7tWzDHQWH3OFrkOh+vXnyaxiCJV6dHILaCeXQyIczBgqM4hFawncmiIevIad4TDSrOr5U0fvXptrelgh5bcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbf0XR1rfkPLMO/nv5JDNK7viGH4RSwShuz7YNSZWGY=;
 b=laqc1UFN23UMaVt+OGJnCMiFHf9A3RKljdPIr5oMn4mdXEBbftDOHHd7NHQe9qMRdy+l/5rlVGsB7PIfsM9iY/7WTFVsKiTF7ZcQ4NtaLxqtB9J47rf4wjXnlgz0raIG5c95VKB3Fdrk3rDkgHh4aOeOuyIDQ4zVtbFkSdKK4sEm7I1T0NTlVKoOHJeVF5D9tjUOmsobuXvi1aiL79S9kQl3ndKZ8AB5cvWquaN0XLwwPI2QjiY/zqTCOJqG+nGad9ddqnip3vgUR2SqcLEzdLbUXfiZGw7Fi1rg51nb8ld/z/PNYoIu/2dG6iP4trJKIcfqrn+6HKfw25hoderj+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbf0XR1rfkPLMO/nv5JDNK7viGH4RSwShuz7YNSZWGY=;
 b=YL+dW5wB/zRYCn73OAgEwWPWPj0bYDFYr9fYQu7BnI7IW11jc2BB2bLn4DZzJniEuE4Pf/Eh4PsAYwF6K8IYF1p7gDuPQRb2Q7i82Wf6whhDP1596ym5SnumzzcAKBzu8ZChW9D+qWgDVi0ruGHw9nbpB9i6eebypgV6JCpq22o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW4PR12MB7142.namprd12.prod.outlook.com (2603:10b6:303:220::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Thu, 23 May
 2024 14:03:03 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%6]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 14:03:02 +0000
Message-ID: <39ca29dd-f072-43af-96ab-0fbe24bdda61@amd.com>
Date: Thu, 23 May 2024 10:02:59 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: Enable colorspace property for MST
 connectors
To: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Tyler Schneider <tyler.schneider@amd.com>
References: <20240508214535.356-1-mario.limonciello@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240508214535.356-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0129.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MW4PR12MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f40ff5-b7b0-4899-605a-08dc7b310fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elo2S1JFcUtNY2ltYlYzd3NUbStpancrRVArV0pTVEFaVS9LRmg3YzYyYmti?=
 =?utf-8?B?aEFNSXdrY2MyODI0a2dxZ1FaRzBOMGZuVlNrbGtwbzk5WFZuU3h4WFY2RVl1?=
 =?utf-8?B?U0xFOUlXcVZCQWRCaWFkWDZQeGtoQTUwbkdIS3BGc1FRM0xJY0RjOU55enFx?=
 =?utf-8?B?VkdhbVcyNGpzdWIyZWk0SUdob3FvQVFDeWljL24zNE1CaVRHU0kvVzJkSEh2?=
 =?utf-8?B?YlhRNThVWFBEM25SSEJ4cEZUQ0hId2d0Z014ckE4a0EwOUNsUW9jT3RYTGVh?=
 =?utf-8?B?VTNqeXp1QVJETUpLYnhqV242Z2htOE5WSFl3K0ltQlBYaXU3YXUxaitJZkpl?=
 =?utf-8?B?dndNdkh2aXhXV1ZxUmZtUUM2eFkrd1Q1Z2hWUGQwbFBDdHJ1QmJBKzZkY2ZT?=
 =?utf-8?B?YjBVM0ppcHFWZkxTM1I2Ujk4aEZKQTVGVnB3V3U5T1ZlOFg5QURXeWZEQUpO?=
 =?utf-8?B?WEkyd1EwTmY0WGljbTREQnRWQm1UaGt5UTlReVdxNk9IaXdQSmYzT253TVcy?=
 =?utf-8?B?c2xiRDNZUjZUZS9ITC94YWl1VGl5TTJWeVdoeVFERE4yeXFrT1BxU242VTZI?=
 =?utf-8?B?ZjhSeisrbTlUWHh1Y3A5eVZFY3d1SzZ3dkkyZldjeGdWNTY4Q21NUmNJUWVW?=
 =?utf-8?B?NHhWYXl2NjJoeG5YRTEyNjA4WlVKL09iam83Z1dNL2dhVVIzV2o2clhkeXFH?=
 =?utf-8?B?bG0wQS83d1BKeFNNTTljdEc1MXBBOVdod2I1T2NvV29Fd1Qwd3krY1VON3h6?=
 =?utf-8?B?cTFyY3grdU1Uanh6bExHK0R2aUhyUVpFUjM1TzlVK0FEZU1GL3RnTVQ0Vk9N?=
 =?utf-8?B?Y0UvR3RGaFdjbTk2LzFTeDg1YzgrTDNNc3lkYWFDemplQzJVL2JyL3FwNGxK?=
 =?utf-8?B?UHVkZWtlV3dwbmZBLzRuazlRWGNqUnZmcUUvaXRqRGhGeXV1Nkh4MWhlalhr?=
 =?utf-8?B?S052NkFvMWNPSGQ4THRwRDYreUgrVnF6bUNuWWNPN1dZY1hJSFRIRk5qV0Ri?=
 =?utf-8?B?dnZGbHF3NHlIVWdsdld5Vy9KTWVnbzhpRGpRYlVXT09FMTI2Z09wRTBiTVFJ?=
 =?utf-8?B?WUpvbDBJMjhEMzFMdEt2cWVLRXp5dDRhdjFYdm8vdkpXTjNtRFlvbmhzSEdC?=
 =?utf-8?B?cHFZT29TcUYzdFhPWXZmK0tSMkROaXZWNXk2cUg1TEJZblJuZTR4ZUJYcmdH?=
 =?utf-8?B?dWw2WUhtbW52bXhadDBzak5iS0pIbCtFUVBYcXdwNWc5MzhLYUNEYytiODA2?=
 =?utf-8?B?cEQvWkYyZUZlZ1lHTy9QSm5GandyeWU3cDkxcXF6eTNBVnYzODZta2pwdUc5?=
 =?utf-8?B?UmkzWmZXcjE0L202N2VudHFyRlZ2TDh4S2QzTU1oWHYvN1BXWkZpSVVFdHF6?=
 =?utf-8?B?UC9tOVo4ZzF3TUNVY3BrTGttNXFJb3V1T242Qlg1TGlyT2MvRFpKaStESS96?=
 =?utf-8?B?NVJyc09qcHFKWng2K3drZnZvaU9kNVhBb3B6MFBxY0tVS3B0TlNpQWJ6TGk5?=
 =?utf-8?B?N3ljaWJFMFkyQVdsTlhXZ0lxUmNKbjRlYzNOeFNib2dLOEp3azB3WHBtb2F0?=
 =?utf-8?B?cEJ5bmtVZzFmR1h0SUVDREorYkVheFdiYkRvRnZTRWVEZ09SSnhEWTFRekVK?=
 =?utf-8?B?bGp0dHByK3FRUXJwKzdoaGxpb3l3Tmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um0wUW1QaWZMcm03ekZxSmVGeFBONE1zUWNkU3NlY1FrOTAzSmZqOFlLRlR1?=
 =?utf-8?B?RnhSMmFualJOVk0wclN5WmJvTWJCQjZJQmovV2J5MmFuNWRsSSt5dC9jRDhj?=
 =?utf-8?B?SGdqL3NRdUZaVDBlaXZucjlyamN0RjJzT2k4NlFJV09GdnBKUlRBVi9FOS9a?=
 =?utf-8?B?dHYyMFhrOVovcEg1UjRVeXZFaFEyTWtIeVdURXJZN1dIUFByWS9MRWNtbXR4?=
 =?utf-8?B?WXBsaG53SGtMQzJkcG1pNGFrRHN4MkN3UkEyd1l5dFNyUE1rZ0hta3FRL2V0?=
 =?utf-8?B?dWRDN3ZWSkdZZGtvNkozb3cyeXRCcFY5QlFKaHI4U3pwUXFiOWtSc29rQkpP?=
 =?utf-8?B?Z0UwSW1ncE90cnJud0RaMU5iSFVuRjRiTUJjMFhkUVNmeC9namRydjlOM09Y?=
 =?utf-8?B?djB0RnZ2N0JaK1dHbGZ1Mzh4djBCY3JNTzhCdWtiT1d1cU5QRWhxK2JsRWc3?=
 =?utf-8?B?bDFsTCswUlR3aytqWkhIYVE4YXpLNVZkcWpLaUVNMGo0bEVUb2VvdWhFRHVC?=
 =?utf-8?B?L1FwZFdLUis5T2hLaEVVeW90SzNqTWJ5VHpjK0JMYncydkZNWkhqVWhsSFVj?=
 =?utf-8?B?TndmdWtuZksvUDlQc0kvZFlUUnJhSUlHOU52TFZ5a0pjQngzbml0M1lpWUJJ?=
 =?utf-8?B?RlU0WEJxcXpqOHN0d2ZuUkZmRmI4TlFlUmNubzE4bXNQcGpidEpIZXFNLzRp?=
 =?utf-8?B?Mnh0VDN6Y2VYcWtrSC9VTmV5cGloVVFOdTRLNE9YQ0ZiZ1gyeE9zYjlHUE1Y?=
 =?utf-8?B?NjhRdjk3WVIwTTVLdHZsRWpVaEw1ejliUkpHNFFuSFA1OGluN250aytMbk5U?=
 =?utf-8?B?NGoxam16UHlmbGJzYmtWeVFQMXpoWGlSNStFdjliSGtqUmF1YS9VNlFQSDFm?=
 =?utf-8?B?S2VjTkFuU0V4ZTR0aEJYc1RQbUtFeDBlbzBmYUhQSWRObk5uVis4cVN6WEJL?=
 =?utf-8?B?WUpRZjBPWDV2ZXpseXdCeUwyQUJLYzVXWlRyMng1NTVneUFQbXVBNnJwWU9P?=
 =?utf-8?B?T1ExRnZJRVpraExmcDBpd2VCUkFrODVFaHFlUXNZcFBXSjVwYWhmTXlNd3Rv?=
 =?utf-8?B?OXBXOVJvT0xCdUl3WGxTU0VjMVpFM3N6ZWs2K1lteVV4VHQ5bXFFL3RScWhI?=
 =?utf-8?B?N0JHVEhFeVFZUUh0LzI4Qk1pVERlWERRR0lBK1FtZ3IwRFhYeEVYYlVwM3hH?=
 =?utf-8?B?eUk2Smw5eVhqU1NDSzVhenZ3SkNZdkc2MUtNbG1WaUpSbXhCaENuWU9yTDRw?=
 =?utf-8?B?cDduM1ZRRFhHdUtMMVA1WTFwNmxNaSt5cnhuNjcxVHJvN09IRnA4MjNCTTUr?=
 =?utf-8?B?d3VLQktDYm5SK0FHbDJLN2FLSkNkeWRBN0l6b1ZWWlFYZmZVQ2IzaTRSWnd0?=
 =?utf-8?B?YTI4bDRYWE5DS1NlekpaNDAxMnV4RG9qbU0wSkhIZnoyYm1kaGYyMGhBRGEz?=
 =?utf-8?B?b01aR2xsK0piMGRTZVUrL0FwZGd4ejFERG5tQkRtek9BL3VxMUpBQTZXTnVN?=
 =?utf-8?B?VFhkSFNVNUdjS1JkY2M3aTBFemFUdVEzWGlNRGhVNUJldTh3SUJzeWZMTjRz?=
 =?utf-8?B?MU1FR2RUWlNWQUFrOGw4ZE4weXlCdlgrRVAxL3NVOEo5TmZWOUFwNmhGSlJ4?=
 =?utf-8?B?akd2ODBPVFdYTFFnMG1OMU13enJqS1E0bytQdEIwOUt6ZVZDOU82UE1YcmE5?=
 =?utf-8?B?eVFQaEp2NVhCUkVrL1lvQjVZMFU3TmJTS0ZuL2hGd2NKcmM1OVd5a1ZSN1U1?=
 =?utf-8?B?NjRHRGg3QWNsNWdVZDVKaVo4SG5VTnl3Wm56dXdSMnB0aElCUnB0anQvSWhD?=
 =?utf-8?B?aDBES0ZzMUpRUk12blFTcVNoRDl6c3duRldKdm0rSktIZDJSazhtcDdsVFRl?=
 =?utf-8?B?RGt1ZXdQdGg0UGwvVFhsdysvU2UyQWZJRWNib3NsSVpNMEZCTEtvZXUwVkpy?=
 =?utf-8?B?QzYrWEFxOGw5eWE2L0hlTjFrVnM3bGZWdDFPNndORDdUSlFHdGYwNFVLNE9m?=
 =?utf-8?B?L3pLZjR3NU5kci9GYVY4Q0FMRzBCQ2N0NFN6M0FId3YrUWpvUGw4bWFoaGpn?=
 =?utf-8?B?VE5aVGFlYnZOR0hqN1d3MFRzK25BM2s5aXovMDF1eldtZDlRdmFZanBKTExE?=
 =?utf-8?Q?l5OJXbDPYb7tJinz2AzG4D2Wf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f40ff5-b7b0-4899-605a-08dc7b310fbd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 14:03:02.9330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HyOs1d/Rg/5U1QLvLxxKxp93fQhhK+EWO1/+nzJ7mvkWTKMsYtpu2kgbXchTl/J+O2MzrFjGH1JCRKAEMTvxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7142
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

On 2024-05-08 17:45, Mario Limonciello wrote:
> MST colorspace property support was disabled due to a series of warnings
> that came up when the device was plugged in since the properties weren't
> made at device creation. Create the properties in advance instead.
> 
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Fixes: 69a959610229 ("drm/amd/display: Temporary Disable MST DP Colorspace Property").
> Reported-and-tested-by: Tyler Schneider <tyler.schneider@amd.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3353
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 941e96f100f4..12b036d511d0 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -613,6 +613,9 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
>   		&connector->base,
>   		dev->mode_config.tile_property,
>   		0);
> +	connector->colorspace_property = master->base.colorspace_property;
> +	if (connector->colorspace_property)
> +		drm_connector_attach_colorspace_property(connector);
>   
>   	drm_connector_set_path_property(connector, pathprop);
>   
