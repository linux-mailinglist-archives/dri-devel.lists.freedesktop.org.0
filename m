Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D26484AC8F1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 19:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C83210E4AA;
	Mon,  7 Feb 2022 18:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CA310E365;
 Mon,  7 Feb 2022 18:57:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDbCZhMaU4QEmJ1EU7uawbJmm/ZOaJ3B6sDwM7mE0hxnvjVccBDIwNjIUzOmWiG3NLm7QH22Qj5H8GOy5VZyCWaeoQwSsM3kQ4ljlC1dM5s+Zl0X5kKSgdCR27NFo3h1cDqbxRpwANat+BpRspy2+8Q3Qk29EXaGtQWQkz5uCE4qogIasIBT641OV4boESs6BiaxFq5hStOw0XP2a6BMHAD6kwfR3tMiaRw/Y60zOPyT0AkxzeHPHK8IktqYDOicqsxAkivcLDDL+iui1PewITZqx9m8/iAFyz0dfOfjjzEmg1qqUmk5Nl9xRBIrMN5OuCWalLD62/ZFl/YqhCI+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oA+GF2hNY40pMVrP2s31tOtwhsitNmByT6tg/bMRjdI=;
 b=LXcwuAiwjjpk9xJLEi+YLYrcBQKZjlvHujSruuMb2cxEBxlm1z6O+Uo+gdLTLidKfOkqatlt90ZmptiKBnvLVRS5bCGC/LRhIDNyiCU2uKnk4dlgNXvIcOb+ETb4bInEyWGSnHi1/ovtNgcjU0k4OlYW8wVvnYLUxErnocqSc44rUOMzwx8FYSoGikDwVwGqrpgpDAcNKTcaJqfFgM2qEIIyYTYdZBTI7hsutxFSXko26lIp/fZbdXbZ4yqF9Vg8A7Yb73Cy5n9pauxUShAO3eHb5TQigT02IKgtoW1D//fA5lBZwewg02WFctaAcZdJ+SByeLrJuJVj+BpEC9yaPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA+GF2hNY40pMVrP2s31tOtwhsitNmByT6tg/bMRjdI=;
 b=eUcocDJW5aqPdG50WlqHNWbWyOO3o20uhgeD9+6uWR5PbOV25OpSZuDPtIOmh30K12EaSdV5KXOSgJh7SnBZpiCAb2HlsXafkXzM7r/Gp+4RkPtmdM/OPqHSC+VOEbumJl5sSsRuHTmb8l6v9g53hNN8Gn/HFpAzCV0xQV8zlNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB5117.namprd12.prod.outlook.com (2603:10b6:5:390::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 18:57:35 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52%9]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 18:57:35 +0000
Message-ID: <8aa30074-6039-ba5c-c25d-38a0c2f52619@amd.com>
Date: Mon, 7 Feb 2022 13:57:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 05/23] drm/amd/display: Fix color encoding mismatch
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-6-maxime@cerno.tech>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220207163515.1038648-6-maxime@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YTXPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::39) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a226673c-677e-459a-058a-08d9ea6bb3b7
X-MS-TrafficTypeDiagnostic: DM4PR12MB5117:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB511715B61855D9247BB5A7558C2C9@DM4PR12MB5117.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HEyqdT50iaD21o/7xfL3drRquGbPN1DSNMng/9+eLT7+Tpnl7clSE8H2o1aEpay8y3NW4iL3ZVygsRXDMCoxIEo768TCgmNX9P1QKNA+i96rt/K7p3+miT1fj4PSXh2QX+4/zxUgZzNDi4+eD7jtHBwpLDCh4+NwAauMKiR1eODJ0ircT0yqD7s/e8Ku7RrhvuJINQMlCP2zNzfRudpyqsbQp7LgqTh8zFDvOcO4FMx3/ea3XnE4mmGTlxtaqEsC7DTng35GZlye11DO3qv1TjeTlXZa/Xi0E6aRB3ytYHnf+ZFBWuxS+pR9HNSwlvwkvr8y/AK5EeY1+nqry1Mf3oQcBso2OiPcYxShTLeR9Zc/KUf2IpUpLVBpBGcLsVvKKJHW3l5vyWUQhdhKTyZ6Nmsuglub7P2hs7PrntpXOpuu9l1Lml43MXZv+w3TKEfKU2G5zw6FCRM11rw1++0yR5FsgkCGVdGV2RVl03bnjiD+hdWr/nDwQkERZiMwVtsIpBZiVxg4ohNF688O+WJ/JmxchudrF5eNQlUGgE+xSgbkfjOv9Kv5REEF2jIOV2y7/gv6J4RaafMZbS/QVoFZxfua7icovr+xsJtcFTiYotQh8D+tvwMs1qD2VkJbshsKuU+r03d0LG2Z6Jn6msETRqTktmlEwSFE7JOAQED/5SHCg8RQzoqaJrRFRe3UOzDGWliDe284b0u5z9N0ffeU2JF1KWqlqE2IpR29oQIrGlZDV2B6iR+YovtpTQjrLtM7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(44832011)(5660300002)(83380400001)(6486002)(66574015)(8676002)(4326008)(31686004)(36756003)(6666004)(6512007)(6506007)(53546011)(2906002)(86362001)(38100700002)(508600001)(7416002)(2616005)(66476007)(66556008)(66946007)(54906003)(8936002)(316002)(110136005)(31696002)(26005)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1ZiZWRJSVAwQ205RTBlUEtjejF1R1g2U2RZRVNNVE0zNDRqWm5abWVIditQ?=
 =?utf-8?B?bUswYmRaWGNka2FNRlNhV1F5Zndsb2g0NlU5UEZkL01MUXN3WDFkdU9zVU9x?=
 =?utf-8?B?aTljWThVdmxoMkpmdHBkTzlKNDJxeWh4OWZXMENrNGtVTW1pMkhLcUVSVmtT?=
 =?utf-8?B?R2xudGw4S3lxek9rMS9RVmhaWGFZWkgzeFgzaGNObXVPeWdaa0J0d1IrbkxP?=
 =?utf-8?B?T3l1N2pPNm9iY3JnaDZyN2FPWTFMNkRxSFFaRFNYTkFicy92TnF6RkxOYmcv?=
 =?utf-8?B?WnVzeFk4YXVFaE1TajNraFFVYThFNnFGTTJrSFBCRmUyZlFBbGVxU0JzWDVP?=
 =?utf-8?B?R1c0Y1ZZS3V2R29tNEQwNWQ0MGVsWS8rYTI2Q0s5eEdkWS9QaVArYythYUdU?=
 =?utf-8?B?eC9lUnpLL0d1MUpCVmpWbTZKdks0QUNwZmVoSEZLcDRZaFJEYlY5TCtxalJi?=
 =?utf-8?B?OGtHdTF4eGNFTjdLYU1mUTlFa1orcDNqaldVSGNnM1I0STNxdmJrY1QrVWhh?=
 =?utf-8?B?aVhGY21OMWszUjRUZ2xUa1JuRC9Xbm9aYUk2aWUwTW5PR053ZTZvWVBxTytO?=
 =?utf-8?B?WCtDblhlWGhuQUZPdHlGRXFxcEUrYVBhdE5wTW5ldnMwaUF4d3NOaFRqZFFx?=
 =?utf-8?B?amdtWGFPRFBVeDZGT0VkcWFUMXN6bFcrWkFROVRaQmRwcElvUFJuVDB2eDZB?=
 =?utf-8?B?Tmw5ZnBJVVBibkp1MGwwWGNrQTFJV2xVajdBSThRT0JKd2taMENKSGdwLytW?=
 =?utf-8?B?aTNMQWVGamljQnZxaUcyOFpsbHp3L2p0cGRIRDg0bThyUndDZ2o1YTI3R2Q3?=
 =?utf-8?B?K3MrSkpSMHREblJJbGhpaDVPWmJoS1l0MmErUy9XdWtpTTJ2cy8ySHZ6c2Fr?=
 =?utf-8?B?WXNXakZzSnhLckVlY1JuSEdSdFVGczViQ1dSTUVzdGE0eDNEUFZlenNSeTh2?=
 =?utf-8?B?QnArTVNZbHNPbzJvQlhnejh2cUFFeFV6TG0zdStaNlJiM3FDVUVQNlYvYUE0?=
 =?utf-8?B?Uk5lRHAwU1lxMzFlRmFQYldmaVNQK2VFdHpqYmpQZjdhZVdBbjROU0dhS2hu?=
 =?utf-8?B?TmxSQldBMVczMmI1am0ySThBelNGWkMxenVVUExjQUFCZEVkbFFnNU4zWkYr?=
 =?utf-8?B?WEt4WDJnMlRFOCtKalYzVy9wN25Pc1ZJd05xeE80WHVsQ21vNUZwVG1uQ1dr?=
 =?utf-8?B?KzI5b2NkMVpMRERBRlYycTNNekJRNGR3ODNkd0V5RlFqeit4dU9NY3ExZzNv?=
 =?utf-8?B?YUdpbXpWcmZmalFISlZ4cWpsaVJ6WmJqZmZydEpwRUR5K1lGcnRsU1c0akds?=
 =?utf-8?B?MjhaL3VpUUFIamgxM05sTmUycWhPaUpXM0ZFZ2g5ZzdhUjZybnFOMklDRzRu?=
 =?utf-8?B?TkpCbjVSWTh6TThTYkFqZlRXMktTU05Ed1BLa0RtclZGKytJUWNDWU1obTRw?=
 =?utf-8?B?NkI0ZUl5MHF4VlB4ZjZYeGJKcGdadGpOZ1JrWXhJU25pckFrdTlCcmVJTE92?=
 =?utf-8?B?QnM0Z0ZFaS9tMUhCNGhZcFZ5M1ZtU2QyT0o5UDI2K01ZTHdsQjBCTDZ0UmhK?=
 =?utf-8?B?ZkU0a3FiS0VkblNzZSsyemZPSmEydFRUbDBoQ3RFRkI4YlpQRTF4VWNFUVhN?=
 =?utf-8?B?ZWtoVTE1NU5VOXltdk5QRzBaWXZZQ1l4STMyenYwbWZpaTZOazk3dDQrSmVI?=
 =?utf-8?B?WmI5NTIreGxXcGhlazA5VGYvWFFVclo5akpMUzE4TGpWSzhJTU1WVkRQd2hP?=
 =?utf-8?B?ODNVZ0I3M3FVYXJxTHQ0NFpnYjBJdk9tUU92MHNRSGZUdHU2TmF1NW5ycVI3?=
 =?utf-8?B?RVVZbWtrZFpUcGZUL2ZHWVRUYUxtNWFSTnQzenp5bGhqSW45UUZkSTJVNnhX?=
 =?utf-8?B?RGJmd1Vqa3RFd3orYnkzdSszZFRsQkdPMkFEWnNYbVBXRGErSS9JcmVsWVJQ?=
 =?utf-8?B?WXRXZVh5NjNtdHR2Zk0xbWxxS1BtUWhLNSsvczd1d3M2YXRENUZsZVdCVkxo?=
 =?utf-8?B?d3ZtRFVHU2VxTEhJci9rck5uczhlSGRsM2E2OXNIS3BPeXVzQ3RsdHkwdFY0?=
 =?utf-8?B?am1NQ1ZDTmhvU2VadUp1dUVZSExSS2hxNGV2d0o5WWtpK1E5RG1jZk1DV3B6?=
 =?utf-8?B?V0N6ZGVCVVR5M3ZyMTkxc0lqbUUraUluSlBjd2JtbWk4Vk1RL1U1Z0JCdVlT?=
 =?utf-8?Q?pcg4YsEj2xi1wk8vLcsCnfQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a226673c-677e-459a-058a-08d9ea6bb3b7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 18:57:35.0432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9STyi1YM6xmyZSnGyRb5v6eHi9StCSBJ6a9ZYQ5GxCmeUQlvNkcUMDnTnjqrS7EKrhUFAdYHcFxyvJS+9WQMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5117
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
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-07 11:34, Maxime Ripard wrote:
> The amdgpu KMS driver calls drm_plane_create_color_properties() with a
> default encoding set to BT709.
> 
> However, the core will ignore it and the driver doesn't force it in its
> plane state reset hook, so the initial value will be 0, which represents
> BT601.
> 

Isn't this a core issue? Should __drm_atomic_helper_plane_state_reset
reset all plane_state members to their properties' default values?

The amdgpu KMS driver currently doesn't respect the color_encoding
property but I would expect that a call to drm_plane_create_color_properties
with a default of BT709 means we're getting BT709 as color_encoding 
as part of atomic commits.

Harry

> Fix the mismatch by using an initial value of BT601 in
> drm_plane_create_color_properties().
> 
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index feccf2b555d2..86b27a355e90 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7914,7 +7914,7 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>  			BIT(DRM_COLOR_YCBCR_BT2020),
>  			BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
>  			BIT(DRM_COLOR_YCBCR_FULL_RANGE),
> -			DRM_COLOR_YCBCR_BT709, DRM_COLOR_YCBCR_LIMITED_RANGE);
> +			DRM_COLOR_YCBCR_BT601, DRM_COLOR_YCBCR_LIMITED_RANGE);
>  	}
>  
>  	supported_rotations =

