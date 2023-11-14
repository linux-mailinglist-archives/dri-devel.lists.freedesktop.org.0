Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7FC7EB205
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 15:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C67010E0BE;
	Tue, 14 Nov 2023 14:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2048.outbound.protection.outlook.com [40.107.101.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C899610E07E;
 Tue, 14 Nov 2023 14:21:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZLgbpS5RZ5VvVCaRbD6Q5RganIG4R3AHIkN7FlbUQyT02sWifkRvFX7SMIfmh6kUrmUUgw9g9ygEelJJIZWqeoua0r3MsjNwDKWVjt4i6AnpfXNNT5rYtgxjlE0pEE8Q97HCE4V8yrYVfhE+kulIiP9C5HoyyNnLHSnmXALzGiueMII0bss53/wCtf5cP3exz/9I7Rq3eKsxl1o5iFi9oC4xRMYaj3MT+ZCEOO7VPTmZ8en/V+2DybsnCw9biq05Ds1M83yD2tibI7kOjt7jlBXt3XqYpOGPSFDvSs2oZL7GWn7vaWMzSh8EjSzR7NCDuW6xIMj6YkThGJg7wwSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwpstLwAKCPSiISO0gQ1tqEvboxggq8vZVnvQbYYu2o=;
 b=FhKnRGicFvPD3qmBN0z2BqeoggH6n1wpmOYGVlpaGSuuowS2nvwe5JMK6mEcgXIAlUhGhomNhdp4Dn2MkET+7hx/kWC/oFJj5tl8fxQHMbQqiuJC47bWn5G/olHpnicBbeIv6MAtcZN7Kzzi7b1KOIJAocXJWsu5BDLZ84DQ3g/Ju3LA2y6GbzfSgwFzcLs7xqiPrjHFbJ20FEmuGBFKr+PW7SZX4ma4Cg1N8KpRgyHlP8n5oNdV1myHus2Yq0VQpqbFfLF+cm8T0HP6ZpubkJuizkZRLKbeRAop5Yq6v5YpkpKpSptaABmsNVuyok4Ag4Nkj9Z8qu653cXOf8Uc/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwpstLwAKCPSiISO0gQ1tqEvboxggq8vZVnvQbYYu2o=;
 b=tP51PdnJFe5bJqhK5RwKa6Ni+e4o3PL0OfMEXHy96rStb4IeGZC75tUitanZt2wS6X9IfIUQ/UDIv9ON32gqmpMqnE5bRBfYAQs0I7JVgCXXqulYIPIO8Zv7nd5oED7No5nrrpAPYTqtk9+d5TZHAkVMvQwCfGEybFChAYI3Fak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DS7PR12MB8369.namprd12.prod.outlook.com (2603:10b6:8:eb::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.29; Tue, 14 Nov 2023 14:21:15 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466%7]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 14:21:15 +0000
Message-ID: <bd577fa9-d487-457b-8c27-bbbfd338fcea@amd.com>
Date: Tue, 14 Nov 2023 09:21:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: fix NULL dereference
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 skhan@linuxfoundation.org
References: <20231114063647.71929-1-jose.pekkarinen@foxhound.fi>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20231114063647.71929-1-jose.pekkarinen@foxhound.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::17)
 To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DS7PR12MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5652ca-3c7d-40d2-a93d-08dbe51cf5e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: woT5OCI8oy5Y0rImTsbHYhmfOUqT7cgMbaGQFhNae+3AB3kA/X1Qraqh73PXY/Zms5L0vn116jlyIVris6Nj8bP6DE5YwQnLup9+aXbGZjCA0/GymGGOg4hr4ROHWEchFD8B6JZhTgdHHernzRSR+eHB0CUxJSeW0peOEE60rKt0ST1Jq/ySC4IWS+HfjhC9jEzxFKQjN4JF7ZvzpEyFoHR9z6KEFAzhaCX3E+Kqx/+4+u2jf/NoD3uQP2P/wjGAm6XMJfF6bOHfWnveGPw+t955Rcp5pT35QudtN5bRYkMmH3w93lFx4tzf8WWFb2bKt0jYTLjgf8ZOHbWMMWOVZzXMRnHQWgpvRCLNjtxuvmCKJtGXVp5ojAOv2KxTaHpCGUK0ccOYlP//2HTMRjQ8veI5YAKR77wxPrNYuMB+srp/yUbknkDzJv7cslYj2H0xZIYZRTWHNbkCyEZxGUyfe+kHRBuWz3kqkQDlcCouIjrDcvXGJU4gGTjsZPE2kSGEniToNunadUPv6/8hWM/0Ym0vyZPQ/rhnZlv0+rp9689Ts9Cr+WFVZ+hCc1lLfwklfE5lgjG12tuEz37xUOb/sN+3fMWG+utVBM3R3D0XzjGf+NOqyT3hcop4fRRqhIO4bcJchwwWBZ/tyUxvbyeekg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(36756003)(26005)(31686004)(478600001)(6666004)(6486002)(53546011)(6506007)(66556008)(316002)(6512007)(66946007)(38100700002)(66476007)(2616005)(5660300002)(44832011)(8936002)(4326008)(8676002)(2906002)(41300700001)(83380400001)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2ZORGRnRjl5eW5Oc2g4cys3Y29UMUpEWUdXV0l5YVBub25JYWRqWmNtZVZQ?=
 =?utf-8?B?bDdwYmcwbEdzYnVLeHZNUHgwYm9hKzVwN1ZsUWZSNEE5dklweUFjV2JPRmNk?=
 =?utf-8?B?c28zK0R5blFESmRkb2p6SHE2RDYwUWRBR3FSLzk0MEo0NlhKY0t0R1BLWTJP?=
 =?utf-8?B?ejNDQkxXdTR5a0NaUXNRWE9jTjVSUlIrWWdjTldJdlEwUWw4Qkc3bGJpWVla?=
 =?utf-8?B?eFFibWJnV3Y1MlZETE5TVE1FNit4QWcxUW4wQVp1OXhVS3Q1N1pVdkdpS3Ur?=
 =?utf-8?B?VXlLOVBCanllRFNzOGVIL2Vwcm8vS01FNG9ZcVdEZ3Y4Zms3YTJBNklVVFBh?=
 =?utf-8?B?b3MzWUsxRHRjNzhKbHFUS0gxZmJzOE5vWDN2UkF3TTd6b1Z3NEs4ZUF5d3NC?=
 =?utf-8?B?Wm14UkxXQUVOMGFqRDArM2QrdlVmZlV0YWJZWWFqbzE2djRQL25ISVBTc3Ru?=
 =?utf-8?B?TkhDa3NVeWlndTg2Q2ljT1RiSU5UanhPNmhSbDREeHVXc3YyWEpOb3dNL1FY?=
 =?utf-8?B?MlB5akkrd2pTNEl6OXM2SDlmRVRSSXhBVnlJRlhTK1NUVThYVDNDSEVoUVpj?=
 =?utf-8?B?Y1NoZE45U0dJN0RodUtzZlU1eFBrRjV6TjJEUjRidFIxeldxb0JXbXp2d1Rn?=
 =?utf-8?B?WG9UQVFmdktPc1VYTnZ0L0g1MXZ3T2hQOUtUZlBBdWpEL3BISHI3N05zQmlG?=
 =?utf-8?B?dXFZNDN1dk5HM1JLZER4cFR3ZEZMU2tBWWpqTmVZUmdKZ0t4NW9UV2tya05G?=
 =?utf-8?B?OEVodlFFWVV2YkdxVWJSSHc4TlhtNEtIb1o2NlNLd1hJY013T1pCUEw1K2NP?=
 =?utf-8?B?VVpKdWJyRGZ6aHV0WXYwVjNzL1RBVUI4V09CK2Y1cFBCQnpJSFMyYnp3NlR0?=
 =?utf-8?B?dFQzQWxYWjdzWCtGY1E0WXFRMFREVU00SXpWY0FXSGxVTE9oZ3FBdW9qNjhP?=
 =?utf-8?B?K2xEdGY1aUpxQjhMR0ZMOTQzeHVncGVNcEV4MnpVWHN1YWYxQ3ArUjVLem1H?=
 =?utf-8?B?ZVV3emtTOXNiOFJTczNBQm05ZlBWNGNPTlY1SXBoeWFwemcxSk9vTUM2TVNS?=
 =?utf-8?B?UW1vQWxDQ3ljK01oTURObkl4R0ozc3hMWW1lbDNOemtUdFp4Q01Gd0VRcTRI?=
 =?utf-8?B?dmxSOU1NVlhkUlRvM2kvVHRtcEpHSGloUHJJcWpnbzVYNFRUU0Z1OE1VbGVL?=
 =?utf-8?B?c0NyZ0VXS2ZTcExFYTNUZ2lpWGlHM2UrLzdSbjdBb1VhNDByUlVVc216NnEx?=
 =?utf-8?B?NnEvTmsway9oSklTeWEwcUQwbW1vVnhwRjJMMTJOaThrTmk2NzNnRnRUSGFw?=
 =?utf-8?B?U3NaY1R6OStIZ0tWNFljUkZFdVNpaFdUbWdScmZFUjgwNXBuMWVZMkdQdk9i?=
 =?utf-8?B?K09Fd09abk1KbTFBYzNydDV4cEFTeE96SFRBOEZZMXVTZUo1QlZjN2RuV2RK?=
 =?utf-8?B?cjdMN1FES3Y1STNVSGtSYUhVZ3lwRURTaVBFQzgyZ3hZT0lwWldzeXZyTjhK?=
 =?utf-8?B?NW4vdzUyVHBra2trVCt1SzRCUGFqZUpRWlQrZ1AxSGd5RmFJQ1ZFRzJHa2li?=
 =?utf-8?B?V2hGdXhZV09sQ1BMTTN0UC9GMy9ZdVFtZlFGUDFIVmErQ2ZWZUNEdmpNanlT?=
 =?utf-8?B?ZmMyWjdaL2dwNlBaVjlkdnVYR3duOFh3QS9zelltZTk0cFlTbXp6Q2pSNUdQ?=
 =?utf-8?B?Z21qWFI5OWQwcHcxdGRDbDlCbGFpK0Z3ZHpZTUlxZUliR2oydnppT0FQRjBB?=
 =?utf-8?B?SHFPUXhKYzQzekw4TmVWZTQwYjNHZUtEN3IvcG1zd0Y2R29zTi9zT2NQRlpo?=
 =?utf-8?B?Qk9ZM2tybGg5c0Q4UU91eFk0RDF5NUJIcmNBandFNlVlWVIyelQra1VBd3F5?=
 =?utf-8?B?dkFTYUlodEQ3am9OMFNrRGU0S3N0SW9CTlpMT3lMUzJXbmJaUjdqd1pDUVNL?=
 =?utf-8?B?QlhlTTJWVGdOdmMzWkdZWEJHOVM2QWNJODE2TkxkblU5YlE5eDJMdWJodkJU?=
 =?utf-8?B?aDNjdDRhRHZRVDBSbU5tMm1wZHovVFVUY2NveWtoSlpCVENML0xQRDYwb3pu?=
 =?utf-8?B?LzZWUjlzYnhNMkZTTWllc1ErUmVtK3lYZXREaDlPODFxUG1XOS96M1Bvclg1?=
 =?utf-8?Q?jkM/3S3Beb4HOGXOUB6fyyTAQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5652ca-3c7d-40d2-a93d-08dbe51cf5e1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 14:21:15.2550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2o00DjnaipG8j7aeR2GvStBMgo8jcSDzWjNLEKmYh3p5pjoBCnnTJ6vR/coCh1ctPLbdqQo7TRz7yxvfO/v7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8369
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
Cc: qingqing.zhuo@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com,
 dri-devel@lists.freedesktop.org, Wayne.Lin@amd.com,
 srinivasan.shanmugam@amd.com, mikita.lipski@amd.com,
 linux-kernel-mentees@lists.linux.dev, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/14/23 01:36, José Pekkarinen wrote:
> The following patch will fix a minor issue where a debug message is
> referencing an struct that has just being checked whether is null or
> not. This has been noticed by using coccinelle, in the following output:
> 
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:540:25-29: ERROR: aconnector is NULL but dereferenced.
> 
> Fixes: 5d72e247e58c9 ("drm/amd/display: switch DC over to the new DRM logging macros")
> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index ed784cf27d39..7048dab5e356 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -537,8 +537,7 @@ bool dm_helpers_dp_read_dpcd(
>   	struct amdgpu_dm_connector *aconnector = link->priv;
>   
>   	if (!aconnector) {
> -		drm_dbg_dp(aconnector->base.dev,
> -			   "Failed to find connector for link!\n");
> +		DRM_ERROR("Failed to find connector for link!");

I would prefer a patch that drops this error message entirely since
it's not particularly useful. As, it's only possible before hw init
(and at that point it's expected).

>   		return false;
>   	}
>   
-- 
Hamza

