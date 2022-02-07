Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1479A4AC8F5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 19:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A7F10EC7C;
	Mon,  7 Feb 2022 18:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2053.outbound.protection.outlook.com [40.107.100.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFB410E42C;
 Mon,  7 Feb 2022 18:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iihoaJEXpNUYb8YXrOR0tna9Cmz186HjabhrFyTw7ABnCRCVR3cNFhjbCMQJBthsS277PP4ebXmj+fF5BYr3cZlmNcXWXSmGWK60mlg7JxL7/B5T+ZolMcIgd/Vb7EvjneFy7a6kN1FfOUOT1fGYOuI62kVD2LN6jr/4RzI3dCbrQzwzn6yvXuybj/wVU1Q32yABiNmUP3gyKB+6WHkI93aqZwVbN6syjIYnHerj+UT1aesh9kldII5XKSWBQ7MNkpUohay6w8/sj3gF24w9O+/uJlbowVIxt+yr+JsH2miwPA2DerFZAKNp8S5ZgDLp0Hb5QJLllBBCjPj640Jyhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yso3z3mzGRMKRwlH2mAKb66LzIl5G5FJov8BaAT7uQk=;
 b=SL1gl7GOXLw1qfH4xoFSVCDLro0EVtEO+f5uYgB9g5XM26YrmY+RiDTJhvUF8nfZ9+kTeEAlcN36D7Z87JGMTK1x2odX5n2ZKF1A6/F1dgubb1S/NOK6MN8KRe7ZZlcNjPNYZ162rpDpOoxIfNbb9OKb9X1UhOu/pslKyCWYRD8PWcdn9caBNOKj1lxCuh5ZNb/MfGBWdDwPrEiJ8McduCqeujn7PJixuqaUezkurrlPTLNAm02DFQV7QPp4K/hT8KoOWWOJMl5tZ3ivRKmzoRidgOgldBGJI5KRX7PoD2POGPy9PWmH15eRtiNeJ/rMjQcP96fF3gM5qs7aF6qqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yso3z3mzGRMKRwlH2mAKb66LzIl5G5FJov8BaAT7uQk=;
 b=I1xuV0ghcb2u3gjPspqDISIlVE6xFWbg7YyohC3Agp62Sv6HFujSi1htksUndoTYh+wzHsq9DdcPDo1IzALUfgvhvcYl+Bb6fwTIfPPRj/9EuYq7JGMF2Enk32ysheJiS3YW+3qlF/jH6gcIaRYetjojs5BhKEDFgBEm1cn52mY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL0PR12MB2466.namprd12.prod.outlook.com (2603:10b6:207:4e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Mon, 7 Feb
 2022 18:59:42 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52%9]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 18:59:42 +0000
Message-ID: <3a9f5ff6-52fd-25f5-2714-8801eba13dab@amd.com>
Date: Mon, 7 Feb 2022 13:59:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 05/23] drm/amd/display: Fix color encoding mismatch
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-6-maxime@cerno.tech>
 <8aa30074-6039-ba5c-c25d-38a0c2f52619@amd.com>
In-Reply-To: <8aa30074-6039-ba5c-c25d-38a0c2f52619@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0092.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::8) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d8af884-a52c-4bdd-e31e-08d9ea6bffcd
X-MS-TrafficTypeDiagnostic: BL0PR12MB2466:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB246675C5EDED27F7D8DB65568C2C9@BL0PR12MB2466.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fRKTLJ/mUxhUxCuWoE96DPG3wIwsMVExB+MRAXzzLXTygdG26N9US3dz5H5L4ZBu2b8X6KATVddRb4MhpOpsMUHSBUXeZBfUS6+Qo9diaOVxhpg1AfMO/HesNYQUCoCY2iN+dpJHwI0ON/1klJ+p4C7wYVWgOiUnFbjwqkCdYY4PZvg2JvJGnOqoYJuHywsUx3TRDKZVifeXiAmZpzxSf3UdLXXpKBo2uzSPufw8uGbnViMoWrWPoY1/OEkcDFScqcK04YhUN+/s1BW1xiJ35DgTU3sMbGe7DJkrWqYxnFX5i/KOrfQopxxH33zp8eRjNxx99glYxqk75t0/AviOVkgR0GlnG3tL5GHGGsVLSQ+1GvQBsiEK3LZbUtgSRdVOtEwpGs42128XzkYVXYslB1QfwK1vXy3Yk9sDNHTju/1TUhJ6+OQOCDq/kUoc1bepG8g5I4FRsIkjoug3b4lGlkKbHUzRZBAx8hUio+zTmslIZMJPTSHw6SSNH9jH3W8fLwt6gdDsCZq778FBbCpwk1nV7JObj8xPMZvL5Hj1O3/RaRTFJM3ru/WjlfvpJlj8isOexjQnDE8TtqYiNp77ytEU3IPv4Hdh8AwJQtl0lECpPPi9PHuuHBM4/40CkH2QygFjBE9/fasrIRx/oO39wSLE1CqsBUQpGm3sCtIZCI1z7ue9NlBA5hqZpake9stEtaVodj8aIXRm2U7xMiu4kkhCe9PTsEkyUreaBjT1ajBKr1w9NA/ygu2HaAaecJ4b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(36756003)(7416002)(2616005)(66574015)(83380400001)(5660300002)(8936002)(8676002)(110136005)(508600001)(6486002)(316002)(6666004)(26005)(38100700002)(54906003)(6512007)(31696002)(44832011)(2906002)(31686004)(66476007)(4326008)(186003)(66556008)(86362001)(66946007)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2dBcSt0VEZnN1dweGI3OVY1alZDV21yUWJSdkdUSVJlK3U0UTgra3dYc3My?=
 =?utf-8?B?K0ozTklIVSt0YnRFZ2lrd2k4VVlWMnFURUZ3bFFVNi9kQmxITzVGeGt3d1Ew?=
 =?utf-8?B?THgxeURDNVRIbHN2RzdmYVB3Z2dyQ1FkRGZhb09JaFJGMHdFTitBZFl0cmVY?=
 =?utf-8?B?S2ZSKy9PaWRDSUFncVk0NnpjSHgwVHB2QXJVYUtQL0dWcExMRlB6L3FOTEVL?=
 =?utf-8?B?Q2ZNR2s1VzVpdjd2Z0F1QU12RWZuZUtITXR5V1M2QVE2cm5ZYWF4cjYwb2ll?=
 =?utf-8?B?d0JZS2l2VFpsaUhuS3k4dVpudXJpdnFKTDgzWld1aDg5MVFRYndhRmkyREli?=
 =?utf-8?B?NzJZNXJ1QllMa1JvSGh3SUVNeHBUcGZxTUNiakErbGZjVk1XY25temRwUVRp?=
 =?utf-8?B?dDYwSnR4d3cyMkluQ25XeFdqdFlYQmRHcW5KKzZQYnI4bDAwU0w5YVF1ODBD?=
 =?utf-8?B?Q05Ka211UzJ6L1V4VnFmVm1pRFpIVDV3QUUwWkhyNXpwcWJFVkxkVGdnOTIz?=
 =?utf-8?B?QW9BS2ZXMzk5MGlwNmRITXg1TUNlQmxBa3dibTJ0MnoyUW95OFpWQTRRUldi?=
 =?utf-8?B?Z1kyeWRPQVFaM3ltYjlJenNFQWw4NDd0V20xZVhkbHZhKy90SW11ZXJNQ1kw?=
 =?utf-8?B?eDVDNEpKeVM0STFxanRsNjRubHpsY2xuTjluSmxpZDVnK3MreVhSN2crUi85?=
 =?utf-8?B?M0F5NTQxUlAya0Z5T2tKMzl1WnNiUHE0TWNqK3o4VWFCeHlvSnNhdzJNdUtI?=
 =?utf-8?B?L3gxMjlJRStScWsxMnVTWDNyajBQZlhTbDlWR1lGVDNGOGc2RWR5dGMrNVpF?=
 =?utf-8?B?Rlp6NFptSVFUYXg4akVobkRKYzhkYUM2STZUQTlTUGdjcVNlLzIyTzAwMjBN?=
 =?utf-8?B?aEF0V2cwYUtTM0dYL2hxRDJwYUVUMzRGcU1FZzQ2K2VvczlJSE5wMWNxYlVj?=
 =?utf-8?B?cldiT3Z5ajFGSEVIL2dDSXlYRGx2N0xuQ2pJMFN5L2J3dTBIejlRZHFFVnc1?=
 =?utf-8?B?VDdOVHlpdGFEVmlWMk5CMFdZUnhaMDVqeDRMSTgxS3ExaDcwd0lCb1MrNURU?=
 =?utf-8?B?aFIxb2tWZkc2RFJzUElmZWp5dmdCY0JsQlpCVzVjUVMvT2pvczZpa1RQN29q?=
 =?utf-8?B?c1JubGVoY2MzbWxxd215MG9mc1prZHl3Mkh5SWRDSlVSOVJUSzZVcVBiR24x?=
 =?utf-8?B?MkNHVzN3QjFaVEIwVlpFU2JBeGZHdXk1aXBUTkprckZiTnFwOFZrWTFXZTYw?=
 =?utf-8?B?RXJ6aFc1OTdlMHpiTVM5R1FsUHRTQTdqVjlRQ1dLN1kzYjV1dXo3akVNQW1B?=
 =?utf-8?B?ZFJBMnlKelE5SmdMbEw2SitudHRmZlNDZDM1c3YxeWxiVXlYZzZ1UUl0Vldy?=
 =?utf-8?B?Z1RSSnhPUmh3THNxWVVtQVFvL09HTnpRWnZQaTdBdjMzTWpGMllhOFRqUjFK?=
 =?utf-8?B?WGlJdG9DSHFWaE8vbGZjYzMvM0dXSG1ZU0NrNUVhUkJ6SmlNYnJlcVZrMzVK?=
 =?utf-8?B?TURTRHcrSmJwV2pXZnFvcmIyWkQ4Z0xFazdUN2gvR3pCRE94NUxJNUJvMElr?=
 =?utf-8?B?MlJUSFMwbnJGKzR3dW9NSUQwSGZ5MnlYdDVVcUxTSFUybVZHWEMzSWpKR3JJ?=
 =?utf-8?B?OFVZMjBURWtURkxpa1ZEOTBtaWpQTGxzM1AvVWpjOG5razM0VUZteDlBeXpZ?=
 =?utf-8?B?cThpUUVXNStyZCtjN1VYVjhrOHEwYitHY2dDVXlRbldaOWhFaXZKaS9IVjUv?=
 =?utf-8?B?WVpkZStZdFh6cHUxR0xueVFOekZqNmlFWGZWYlprc2RYdkxFbnhRTzBoUjZo?=
 =?utf-8?B?YWtQcWZEbXUxb0pacHpiZ0trRm1oS1JiaXlQZEFidEZPWUZhMmV6dTMvUm02?=
 =?utf-8?B?MjlWamFIb3NueU0vWkxhWllKRm5mMUtWR3JnN3FVMlJ4MCtJSlErTXBMZDB0?=
 =?utf-8?B?eEhzdGJzRXFpSFVySlRiQmloNXFDbkhsNGI4TWp2eitEZ0ZQSTN5UUlONDh1?=
 =?utf-8?B?UThjVVFERXcwMzRONStNcXZRVS9FYjB1RmlWSHhqTVRIbmRSVkoyZ2pVRm81?=
 =?utf-8?B?aGV1cWhoR1VrcWlFaEdpM1R1Zm1IQ2dHaVNsL3p5NHRQbFpCdmVrS1BYazhl?=
 =?utf-8?B?dmgvb2IzVE44R25LVmI2Ykx2UkFuY1ZSK29kelh4a0dNdmU1R1k1MnZ4blRB?=
 =?utf-8?Q?2/Po5KIO9jJMjJyuE6yK04o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8af884-a52c-4bdd-e31e-08d9ea6bffcd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 18:59:42.5916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SF4n72r4F2c9f1QidnA0TaG89BfW42vFx7eOBvRMWSLLpBExYeKhJAFuPvrrdqtots/HOPajEA2XYvTL6IMp9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2466
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Leo Li <sunpeng.li@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-02-07 13:57, Harry Wentland wrote:
> On 2022-02-07 11:34, Maxime Ripard wrote:
>> The amdgpu KMS driver calls drm_plane_create_color_properties() with a
>> default encoding set to BT709.
>>
>> However, the core will ignore it and the driver doesn't force it in its
>> plane state reset hook, so the initial value will be 0, which represents
>> BT601.
>>
> 
> Isn't this a core issue? Should __drm_atomic_helper_plane_state_reset
> reset all plane_state members to their properties' default values?
> 

Ah, looks like that's exactly what you do in the later patches, which is
perfect. With that, I don't think you'll need this patch anymore.

Harry

> The amdgpu KMS driver currently doesn't respect the color_encoding
> property but I would expect that a call to drm_plane_create_color_properties
> with a default of BT709 means we're getting BT709 as color_encoding 
> as part of atomic commits.
> 
> Harry
> 
>> Fix the mismatch by using an initial value of BT601 in
>> drm_plane_create_color_properties().
>>
>> Cc: amd-gfx@lists.freedesktop.org
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Leo Li <sunpeng.li@amd.com>
>> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>> ---
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index feccf2b555d2..86b27a355e90 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -7914,7 +7914,7 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>>  			BIT(DRM_COLOR_YCBCR_BT2020),
>>  			BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
>>  			BIT(DRM_COLOR_YCBCR_FULL_RANGE),
>> -			DRM_COLOR_YCBCR_BT709, DRM_COLOR_YCBCR_LIMITED_RANGE);
>> +			DRM_COLOR_YCBCR_BT601, DRM_COLOR_YCBCR_LIMITED_RANGE);
>>  	}
>>  
>>  	supported_rotations =
> 

