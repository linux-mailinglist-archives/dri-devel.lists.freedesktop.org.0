Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847A7908D68
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 16:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B95810ED6C;
	Fri, 14 Jun 2024 14:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r5Xb1GJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C8B10ED6C;
 Fri, 14 Jun 2024 14:32:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRfJqqqBY4jVE9zNyFNzMx2mIQZd875fE93mDpLT9qOOeiqbv+I0xA+Pt9LwMmXxqq1WIj+5iQfyvNmuxBxHu31U/jt5+vH6TrNszV3C1DtaSQZQw0dhP8jmtn7Fm9jZdqs2kqxMCNCdDPYWEhXP+7DPnID0+R9WrcwjwQk0ToZzYF52zBdGACaIrlJWk+nUYjq96UHO1Arr/kvKLgYE+cWQSpaP5tFFADz1yl1CKk15UPY3LOQkbJvCHhhRA1ED/vTBK3L+LPj+BDr5LH1FNMos6PBQcMszlOy5FvfH5oQw7MGK5WLtJl+T+059HH9wiruHdfV1YPd/EP82DaRgnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXCafHjxq0QoKQPr7Xvg/QUZYu01QISc18XJWmigOGk=;
 b=D5JwxuHfeFoHq/tgC+ta7qv1+5pLEUg94Iyiq4M/xu1W0ve8K+UNFDZ8JMspztHsSHzcSwEHSJoOjdi4NOJmWbawGJXYzJ0G9w/Tr+1MGyVcq4O812kiD44PGK1LnUX1rnsj2mJIOIGU/ai8hAclw+NJR5AZWIcWY3/hiSDqdHBd9ZFjD0Q1pdfD4mR4nX0u3mPCuDMAZt4w5+63Vv8TjCErMBbmHJLI153EAPKTeQiXnjUDsPH8HiLwrxi7Q1Me8+DFamRj7pfZ2we2C9VREjErzFFGo/rlxu5efV4e0wyTdHC8BIVihFNcbO0KCErOohNaTL6zRZ+IwmSFTAH8bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXCafHjxq0QoKQPr7Xvg/QUZYu01QISc18XJWmigOGk=;
 b=r5Xb1GJvGn3R4QFgYBvOyG2aKEBjB9Cgb3e0xx/6sDiOyABHTKU0xjAgfx/SSYZ7gS52SbGt7xNGOCX10Ae45VdCVCuPQM8eE+tw5etp9hpRJUn96bo6IIfZ+0TsWJ9uZ2GEZSCJI5FPuHqhebBJ8TpbQFLMxP5WAwTbDBnhymU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by MN0PR12MB6002.namprd12.prod.outlook.com (2603:10b6:208:37e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Fri, 14 Jun
 2024 14:32:04 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%2]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 14:32:03 +0000
Message-ID: <5e770114-2751-414f-af57-de8077f6a6a0@amd.com>
Date: Fri, 14 Jun 2024 16:31:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/ttm: Store the bo_kmap_type in struct iosys_map
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, ray.huang@amd.com, kraxel@redhat.com,
 airlied@redhat.com, suijingfeng@loongson.cn
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20240614133556.11378-1-tzimmermann@suse.de>
 <20240614133556.11378-3-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240614133556.11378-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|MN0PR12MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: a11be9cb-2ac8-46eb-818a-08dc8c7ec28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|376011|7416011|1800799021|921017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkpzVmVUb2JVcUlmV0pjNms4azNxMEZ0L1VRRFgyUit6TTAxMERlc0JLeGIv?=
 =?utf-8?B?NUFGNCt0N3BjMDhDaUg2K01zYTFBbGRoVlgvM0VZbUNxR2ZaOE9RMDlJQVJi?=
 =?utf-8?B?aFdxcHN4bUtnMURhVEJWc2ZKVlZCeU44UUtqUVhCWGhmSkEwT1hMV3FsVXpI?=
 =?utf-8?B?amRNdTA0OEFETGR5NzB4d3ppZUpMaFJ4eC9Td2tVbCtZTERaVGYrYTd2T3lH?=
 =?utf-8?B?UUs2Z052eEdzM2lDSTM2M1p2cjlEdW9od1pYVENkN0JPZytmRzAyVkR3WUJ2?=
 =?utf-8?B?VlFwTm93MEgvV0R6NzRJYTMwTEU5YXp5eGtCa1BzZFY5ZDVxQStmN2JOSWdI?=
 =?utf-8?B?UHY3SlB3MDJXSHNlT1pGVDNtQkV2OUVtTWxlOFFxNDNpQnVkUmlEUVF3QUF3?=
 =?utf-8?B?MUZoTjBoVXcwSkg1TFFBZ2Z2NG9LbXEvNmpoT05QL0JYaWxQV1dkenZkOGxy?=
 =?utf-8?B?blhZaWVPMzVKTlRndVRDSUM1SUM3MzkxUnRIRW5Dbll1VUlrM3hlOWx3Q2k4?=
 =?utf-8?B?Z3UvQ3RTUWk1ek9FY0pqdXdRN2g1VE5LWForYXppVFdlTTJFYVRwZjY5Zjda?=
 =?utf-8?B?elhrc1oreFIvUG9DNXFCSmhTVkNqOW1YV1pEZy9OcExwMDFCbG01akJ4ZUcv?=
 =?utf-8?B?VkpIYTh6VHVERzlFcStVcUZ6Y3AxQ2ZjZFdSdUNxUnhqdDBRZ2lIYXZzc0xx?=
 =?utf-8?B?UFI5SjFxeGNETjNydXU4VDM4cyt0a3ZGRmxVLysrRDB1RXpaM29nL2NiU1cz?=
 =?utf-8?B?M0hyRWJqeGU0Qjk3ZW9OVVZnMGFTdVBqMkdMYW1HWU5XZEVRdjB5eGlWcWNF?=
 =?utf-8?B?bHp2dDN1UWhYaDhkRGlDNnF2RnJGYlNMMHJ1REdnbEdDVTlpSC9kcjVETUs5?=
 =?utf-8?B?bnBMTk5PMWFNbGxyc0NIRGh3aklNZS9uZlppL200aTc5NWl2T1pPZmdPM2lx?=
 =?utf-8?B?dk15VUVzQ1BTTGF4VGJSYk5yRGIvN25aaCtDVnRIVkdPTHhmSEJxQktqRUVj?=
 =?utf-8?B?dHo4MnBIUDZvNk42QnM4YVBTYVJsUXBHVndDVkhLOWQ3YnhRQ0hGVFk4QjNR?=
 =?utf-8?B?RzlVS0dLeTFXN3d1YTZlR2dEd3ZRU2FjQTUwdVVXRTBDTUI5QkkrSFhOSVAw?=
 =?utf-8?B?d0VmcllWMVdKeFRVL1lrTzF2cWR2Y0JpSDc3M1BYWld1MUFiZTUzdkhpTFRP?=
 =?utf-8?B?bGYzdnJ5Y0J5QmtKT3JSN0lYNjF0VU5kMWZ6SkFUekM1eWRkZCtmZWt0cWht?=
 =?utf-8?B?akhpSjI3bGRCUU1FbkZrWXc2OHJrSkNjRGZDOWFaY0NCQlkwbkg2NVo5VGtm?=
 =?utf-8?B?OWJQTFhEekwrWjNQaHNCRC9BeFYyUTQrcnNXdERVMEpwQ2hKTGpycmdnZG1h?=
 =?utf-8?B?aXpKQ1ZVWFA2Y1Z5S3hJYVZZbnNJZG1iY2NURlFkT1FlblMyR0xnd2JwSHIr?=
 =?utf-8?B?N1RXQWcrNjBpdHVWbzdwQTYyREZ1TDQwZnRqUXVwZll6Uk94U0JZNVUxaWdC?=
 =?utf-8?B?QjNOeU5CUzQ5K1FLbUI3dmtjdW96RVFYVTE5S2VIdGx6ekJJeXR2NXpWbXda?=
 =?utf-8?B?U24xYXJTNnAzNmQ1aVY2Q0pQVWpDU0MzeGNUVGludHRscmYwMVYrQ0o5bm56?=
 =?utf-8?B?MHphTXRFRnRnbmlxdVhLbjJnWjlkNmJSWnNjV25sd3pQbExEb3FQYkhSTXNI?=
 =?utf-8?B?K001T3p0Z0ZPMERmSFNCYXZsaVh0RWVUK1gwUm5FdXQxMXNoQWhocGlPK0Qy?=
 =?utf-8?B?blZMaHBIajFNSFF6cisyQm9GRGxjOGZrU3Y2VXdVZzhBam9zNGsvcGdYRUVl?=
 =?utf-8?Q?0aA+y6iPXFi5Ende4MY2B+7Pt0JiWRNWh1fgA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(7416011)(1800799021)(921017); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2RUSzgvb2dBTERzU1FoSHBQdXdrMW9XS1dLMXkxMFBXNitMR3hGYW9Ua0dJ?=
 =?utf-8?B?aFFjMlp2Mk84NlZIY09EYnpmNUF3d3FpLzJoWWN6MFhkM3lETDIwakJZM01G?=
 =?utf-8?B?NW4wRjdjbE9kZU5oK3o0MXFpclN1UWxwNzhUaWNOcWtFaTlnbGN3L2laeGM2?=
 =?utf-8?B?WGl4V3NIU1dxSkJZU2w5VVIrMVZNc21ramZIdm5raWNPd3l2Q0JRbWw2T0Nw?=
 =?utf-8?B?dTJ2aW9hU3U2TDMrWkhvR0tmdzRLZHJlUlJzNVVRSU8vYkJUaVJsWHhTYmhu?=
 =?utf-8?B?NytJVVNnTEFpMGg3Qlp0cTBaV1JGMTVlZGVrdGNaTTlsTzcwVEMzQzNWWWYy?=
 =?utf-8?B?S080WWdDc3REZTdWQ1YxOWd4VFdkY1RBaTM5ZGtoRzBiWWdCUktYVjgvdEo2?=
 =?utf-8?B?UXBQQ2VpVStPd1MyQzNWa1ZFVWVIenBYbFJISGZhWDhtR0NkcXg0TEFwRDFD?=
 =?utf-8?B?a3QvWVVjVDIxK2J0SW55WXN6VGEydnBKSVlQYlJNYVZxYW9Mc2Z0akZrT2JO?=
 =?utf-8?B?cmpjeWUzbEFzcmltMm1yMG1HaCttUUhOQWxrYXFUUmdRbEtBTEpPZ2NZR01C?=
 =?utf-8?B?Wi9yZ1dBdDVFek9mL0VaeEhGdnE3dUpvYzRLL0hzbndTTlg0TFNXb2pnc2h6?=
 =?utf-8?B?c1J3S3lEc3J6dXozUmJGRnMxbDE3MVRJaTh5QVp3bkk5UlN2T2tuczlhVGVP?=
 =?utf-8?B?ai9zTnFJdTVRcEdPVElHc0J1UVhRTnJydjhoTGc5UU1CUVpuWStNWmxNRHUw?=
 =?utf-8?B?bW9iSTM0T1kwQkg1cGd5T08xdjhoRTJPNGlpQ3Zva2dWYzc2YUdsNHNSY0hK?=
 =?utf-8?B?T2JuY3NOUG5JTWV4YWJFVjR3UmdlV1ZiV3pHdXdiRzRRb09ra0xFWmtvWnIw?=
 =?utf-8?B?TUoxc2Y0ZUl0cHVhUWtINVYyTkhJYXNGRVQxVWpjcEZUbytHV2J0YXF4SXc1?=
 =?utf-8?B?OC93OWFMSlRNU3lCbWcyWEJaSlB3bURDMmhVZUhCclBIMitnU2lFdzR2d3R4?=
 =?utf-8?B?anQ0U3ZVZGtOemR5R0tEOXFNNzcyZ3pQYzVSV2JLUitMODBtUDhKREQySUlH?=
 =?utf-8?B?cTNLNm9tYThLaXdqOEhFTVdkb3Zydk9VNHdRODN2MFhBeUliWGdGTWN3WHdD?=
 =?utf-8?B?c3RJTXcvRWF3SjBKdEFxU0huSG5UQ2dpUkN0OEVMVnRZaGhvY3hOTVhnRkQw?=
 =?utf-8?B?ZE0xcmNMbi9QemVieTZkRUlXejh1bWFtcEZmcUZBZzIySnFCV25VY25sbjlV?=
 =?utf-8?B?UzlzVThyYUhJZ1pTOHMwazRURHB5RUJsQlo5MDVHWEFJL3JaQXhYd1dxVjFj?=
 =?utf-8?B?OFZacU12QnhYZG1Va24zeVVMVGxtd1Y0bUtxaEluMG1FSmJKRURiaXBxRzRK?=
 =?utf-8?B?Y2ZidzcwTTl5NFJaN3ZRY0MwWXg2QlA4TEplMUpCeENXT3YyNjNZQit6MzJy?=
 =?utf-8?B?blNTMEtnSDJxU1JKQjlHekNSSnh6UENtQmZtQi8rVEpDK1piYUxnWEVlTWlU?=
 =?utf-8?B?Skl6Ky9xYzV5TFVFTk9ZVS9tRUwraTJZWldhd3NTbDVuTFlIVUVGd3l6Mnp2?=
 =?utf-8?B?dkJtVHVQNzFuQUFFbytQalJlVGdYMGppQXhtVUFEdFNrUHFkSFcwT1ZjKzVX?=
 =?utf-8?B?QW5aZnIrZ0pNN3VGVS82UmJmN3Z5T0NWbHVjd3dRQzQ0VTg0eGNjQjJzTlBk?=
 =?utf-8?B?V3dKNFhtbmd0THJTVXRWUkRLWmEwd0xUVjFJTnNEU0xITEt3N3VXN2FEWnM0?=
 =?utf-8?B?L1hWOHYzbTRVMDBKZnZvMnhCeUVrc0s0Vjl2NldOb0swUGNYbXVRajcxVGJY?=
 =?utf-8?B?UGFTZ3JVRVFIOVZtTGU1VThQYWdaUHF2QjdzU2RvSGN2U3VmRWhXQWpTb0ZJ?=
 =?utf-8?B?bmJTN1UxcndJT1B6WkpSYkNROUdyQ3grZG9jd2hmMm1JRDdXZ0I1djhDMlZZ?=
 =?utf-8?B?dnRkWi9kVUVXTzVmNDUvTmEvRnRtdnBjT2tuNm5BOGdBZDhDWVlMOVFiamd4?=
 =?utf-8?B?OFBKd2ZKZ1ozMjhadi94SFRhK0M0TldQRTM3TEMrenErTjQ1M3ZTZmlqWXRS?=
 =?utf-8?B?VlV6SjFzMG90aDArM3JmY0FWRDUyREhBMU9teGo1bmFNOTFqK2Y4MVd3Q3Ni?=
 =?utf-8?Q?6reFad53NycTnqNBPX1SaklfU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a11be9cb-2ac8-46eb-818a-08dc8c7ec28c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 14:32:03.8736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jw8tsBvMmo6NsbxRsTdR/kpSH5f8uNQI7ng9x6EhADyfJ3dNvBpCeK4OVRQ6ikmx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6002
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

Am 14.06.24 um 15:21 schrieb Thomas Zimmermann:
> For each instances of struct iosys_map set up by ttm_bo_vmap(), store
> the type of allocation in the instance. Use this information to unmap
> the memory in ttm_bo_vunmap(). This change simplifies the unmap code
> and puts the complicated logic entirely into the map code.

I'm not sure that's a good idea.

The mapping information should already be available in the resource and 
storing it in the iosys_map structures duplicates that information.

So we might run into the issue that the resource has changed and so we 
need a different approach now, but the iosys_map will say that we should 
unmap things for example.

Regards,
Christian.

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 46 +++++++++++++++++++++----------
>   1 file changed, 31 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 0b3f4267130c4..a9df0deff2deb 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -36,6 +36,7 @@
>   #include <drm/ttm/ttm_tt.h>
>   
>   #include <drm/drm_cache.h>
> +#include <drm/drm_device.h>
>   
>   struct ttm_transfer_obj {
>   	struct ttm_buffer_object base;
> @@ -479,24 +480,29 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>   
>   	if (mem->bus.is_iomem) {
>   		void __iomem *vaddr_iomem;
> +		u16 alloc_flags;
>   
> -		if (mem->bus.addr)
> +		if (mem->bus.addr) {
>   			vaddr_iomem = (void __iomem *)mem->bus.addr;
> -		else if (mem->bus.caching == ttm_write_combined)
> -			vaddr_iomem = ioremap_wc(mem->bus.offset,
> -						 bo->base.size);
> +			alloc_flags = ttm_bo_map_premapped;
> +		} else if (mem->bus.caching == ttm_write_combined) {
> +			vaddr_iomem = ioremap_wc(mem->bus.offset, bo->base.size);
> +			alloc_flags = ttm_bo_map_iomap;
>   #ifdef CONFIG_X86
> -		else if (mem->bus.caching == ttm_cached)
> -			vaddr_iomem = ioremap_cache(mem->bus.offset,
> -						  bo->base.size);
> +		} else if (mem->bus.caching == ttm_cached) {
> +			vaddr_iomem = ioremap_cache(mem->bus.offset, bo->base.size);
> +			alloc_flags = ttm_bo_map_iomap;
>   #endif
> -		else
> +		} else {
>   			vaddr_iomem = ioremap(mem->bus.offset, bo->base.size);
> +			alloc_flags = ttm_bo_map_iomap;
> +		}
>   
>   		if (!vaddr_iomem)
>   			return -ENOMEM;
>   
>   		iosys_map_set_vaddr_iomem(map, vaddr_iomem);
> +		map->alloc_flags = alloc_flags;
>   
>   	} else {
>   		struct ttm_operation_ctx ctx = {
> @@ -506,6 +512,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>   		struct ttm_tt *ttm = bo->ttm;
>   		pgprot_t prot;
>   		void *vaddr;
> +		u16 alloc_flags;
>   
>   		ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
>   		if (ret)
> @@ -519,8 +526,10 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>   		vaddr = vmap(ttm->pages, ttm->num_pages, 0, prot);
>   		if (!vaddr)
>   			return -ENOMEM;
> +		alloc_flags = ttm_bo_map_vmap;
>   
>   		iosys_map_set_vaddr(map, vaddr);
> +		map->alloc_flags = alloc_flags;
>   	}
>   
>   	return 0;
> @@ -537,20 +546,27 @@ EXPORT_SYMBOL(ttm_bo_vmap);
>    */
>   void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>   {
> -	struct ttm_resource *mem = bo->resource;
> -
>   	dma_resv_assert_held(bo->base.resv);
>   
>   	if (iosys_map_is_null(map))
>   		return;
>   
> -	if (!map->is_iomem)
> -		vunmap(map->vaddr);
> -	else if (!mem->bus.addr)
> +	switch (map->alloc_flags) {
> +	case ttm_bo_map_iomap:
>   		iounmap(map->vaddr_iomem);
> -	iosys_map_clear(map);
> -
> +		break;
> +	case ttm_bo_map_vmap:
> +		vunmap(map->vaddr);
> +		break;
> +	case ttm_bo_map_premapped:
> +		break;
> +	default:
> +		drm_err(bo->base.dev, "Unsupported alloc_flags 0x%x\n", map->alloc_flags);
> +		return;
> +	}
>   	ttm_mem_io_free(bo->bdev, bo->resource);
> +
> +	iosys_map_clear(map);
>   }
>   EXPORT_SYMBOL(ttm_bo_vunmap);
>   

