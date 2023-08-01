Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 930DD76A7C6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 06:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE32610E309;
	Tue,  1 Aug 2023 04:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114A010E0D3;
 Tue,  1 Aug 2023 04:08:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocribzdHbVTDRjk3JMwGnci1si4d5nvdrTSE6Z27UJs8CrqJ3lPQq7fyQC/GmM/z5f/wmQPLD9+tz9E9lanSHQGulVeKeUVAS13IbDf3LbIK+KyI0O87IWa4UqPN+udEIeq7opuUHxIhxVvnRMeIwZqMfRq2FUFk5N+XaZyFX9ZRMEzgut7i8U/hZ01rCEzjwsOQBseg2txtkzGpqHOGiVZ4tJHidnUzSKSbX/d2MdNOnFZ7+Qc7DpmimU5gGlNHn4+o63az5vJ1z11YNVhz1XAvYS3UG/2k/oTNx8DRkkefcfVtSA2xoSHv9plOROGwfSgxudHbHApl8aD84yQcag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9OxKNzOGcPBwVHJchQcRHAzScpC8c3Ar/4XD2Y8LwU=;
 b=FVWJx51wNcE1J5DssIOWizWzJ1Gh+gW+xnbQhUYpHZ+U7MhZlXJk5L1yC3maz+YVnmt9ycOWdR6EjE77o+okbtSol//EagAmIYCRh79x3i8jzdXhx6ThUEB0eN+m5TN/kqHziGp+P0zHX8CWV/bFnph2hWb7XARCOkoGyNqZab77BBmeaOCCHg8i6Mof/jmeSh3IQiWAERTNaVkvR3xacWWHzdEReLltKoO/qM+Eugsx45osdqbMULPTCgipF2195nAMp77t4FOSpZzbtqmMEv3dsEdTHzyX59DTsMV4prXxmri3BtQdMLJMR3pkdBaxZ2ymehcjSTacaV3Lm41Yxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9OxKNzOGcPBwVHJchQcRHAzScpC8c3Ar/4XD2Y8LwU=;
 b=AadACUlOfPI76y7CfU7BkxvWaaxI8OwPPQiKceQ+h3QrS/0frOrLS3DPthcRmiOg3bjgVO20dYDW7lL1Zs+geBYifCXNsnw8TzP63E/IA3Cpj95TapZf+PSf4Q7gbn9Up7+9k15h9P2K839knliMod8m6yq6Qw1ZvIE2dKwiJFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3048.namprd12.prod.outlook.com (2603:10b6:a03:ad::33)
 by CH3PR12MB9218.namprd12.prod.outlook.com (2603:10b6:610:19f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 04:08:26 +0000
Received: from BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::e888:da3c:d824:1204]) by BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::e888:da3c:d824:1204%5]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 04:08:26 +0000
Message-ID: <913fb434-a6f6-5320-bb08-89ddf1b242f9@amd.com>
Date: Mon, 31 Jul 2023 22:07:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/amd/display: check attr flag before set cursor
 degamma on DCN3+
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Bhawanpreet.Lakha@amd.com
References: <20230731083505.1500965-1-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20230731083505.1500965-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::11) To BYAPR12MB3048.namprd12.prod.outlook.com
 (2603:10b6:a03:ad::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3048:EE_|CH3PR12MB9218:EE_
X-MS-Office365-Filtering-Correlation-Id: 802071d9-ef18-466f-b04c-08db9244f41f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NqSM3f/dqlj/Ia9LAX1tVt8BH5e4OAAaWBg/J5kkxFGTRI30nVDGB1tlZgMcffyOoZCzuXAURYZCUvdOiHkPA0j3o3UYwRpnKHE/RrGeXBr79YSEGQ7h92aALekL9oGQpn5sM6PavDl94EaKLEO7i04ps01pe4YjrGpkqg6rghYhgEnT/bNfeHkGYBmnnJHiH2uIupoqHbIC3OQK2tIVVTDGyXxFL5R0SqnbfoFlyA81jBSb90++F7bTvEf7JS5fCqiIAsar6GSm4xPetYaHwTxaMUmhP3IoD+cOPjpIDUu8zYv5ba93YtnR5ulW7EQw8la63+1tQX50i/yengNNUG8VgUHBRYR/l0LcXNUbtsYHOjvAaeGkF/V21xtSaohhEfMPLqdQ3/q5GYjNN3yqAXqIZYUpwXCJwM2hfg43jeqzhm/WjcxdghT8mNj9Wfo9wtrtw5zJwd8W//Mo9xJ84VH6Wq4I1dzx5VunfKndvj7fGhiFmmVuzjj1jpkresclFVc2B6k5wWy80X9RJWz5chri76zOVKRj1T+Pkj2NNX6eryNpaPmuqNQ52vv7gmzeUi4ymMHpH71tdwJdn4N6Rc4h9HQycx0J7LRAUIdT0D7Uewc+ADzqw7Y39ZMBGvpFGTiHUiiQEj2LIYVrQHKrog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3048.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(44832011)(966005)(6512007)(6486002)(36756003)(2616005)(53546011)(6506007)(26005)(83380400001)(186003)(66946007)(66556008)(7416002)(54906003)(921005)(41300700001)(38100700002)(31696002)(86362001)(66476007)(316002)(5660300002)(6636002)(4326008)(8676002)(8936002)(31686004)(2906002)(6666004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STNHRHI0WGhGOFU0MU44TWxkR1dscGFHeUkwaDFPZ2dObmR4bFZlcWxhSDdU?=
 =?utf-8?B?UTViQzZueVJITUkwRFZPTkE5TGhYS0QweTJaNU1kcE9lMlRrQW1VRnhKL1g4?=
 =?utf-8?B?azhKa0R6YmZLcjN2bHhmTzJIT0hMRDMwZjlQMUxtRm0zdm9CTk5ZbE9RMUJP?=
 =?utf-8?B?a1NVNkZRdjdLWUdRZUNITFQzUUxoT0JRYVdaL2pHWkJBZERiUGYzSWQ5S1hO?=
 =?utf-8?B?M3NMYXdvVytGV1JXNmd2dlVQb1Ntek9rcUlJWis4YlZzQmFMVWRkU0hIckdr?=
 =?utf-8?B?L2lSVEExSlNtd3ZiNXFNaWZMdzhCZHJVa2t1dmNMZXBpSHE1ZXVOa2IxbDhM?=
 =?utf-8?B?ckZwMTdHWVJDMVR2eUcxSkZQMDBsNjlodFZYc3RMT2NnUWprMEMvTUFvbDNz?=
 =?utf-8?B?V1BxcHkrL0h2THlYeUNpenVUeUFYcVFFeW9pbTBGMnkzd1dWcGNjMk1jTkI1?=
 =?utf-8?B?YjhGQktpS0VaMUxCc0d3ekFhbTNWMkdKTXlhN3JicU5EemlUd1A5Wml4N0tN?=
 =?utf-8?B?MkFKVDFWNy91dGw4NmRYSWF4OGowT2RiWTFXREcyY3kyME5DL3FJQ0VXUXI0?=
 =?utf-8?B?UURXcEttMWNQMkRucGh6Z3hFRWlycXFNWkl5QUoxSEZkS3ZUbThEQW1rV0ln?=
 =?utf-8?B?MWJrbkNiY3IveFBGZDhpV2tuUXU4cXA0bkdJUUFjMXZHekZoR3NIbVpqR2Vj?=
 =?utf-8?B?R1FaL2k3WUNrM0E0WXpDZkZEeTBIRjRvYmlsajBkU0dxWVB1elA2Qm0vbys1?=
 =?utf-8?B?Zit1b3gwamlRQUpvKzhkY0MvWTRuUFU1UldESW40eE11dlFwKzJyRVdzWHcy?=
 =?utf-8?B?VUpqMnhJV0kwdlY3Y1EzRjlRNUxaYWdNbWNZSm9NVVV5djcxaXFlQkpIeEUy?=
 =?utf-8?B?ZnZ3QmR1cEpJUnVRczluUzlmTlRNcFJmN3ltTkYvczluZU9aa0NXSEt5ME0v?=
 =?utf-8?B?cDU4cGpJMk8yUzQrTkZjUDVSSHFJZi81R29rRkhoLzBxaFluWDczbjh2M0Nw?=
 =?utf-8?B?MFE0TldldmVuOXVhYWp2TTJ3aFk0Q2Q2MTVlNE4xd1pSQTJybnlXSmhpckZv?=
 =?utf-8?B?MUQxdnQ3eVQ5em5jektkTC9DNzVuMXVSNld4bUE1bGNNcDVKOU1TbFF0Y1Iv?=
 =?utf-8?B?MTFjaExpazNWN2lxeDdNOHN2K0ZxMjh6MHk4U3ZORit4Zzl1a3YrandSN05s?=
 =?utf-8?B?czJWcHZzUTJxZllwRkJNT2NCRHAxSUVCVFNzb0MzSC9XZE9UMHhLdXFEU0F3?=
 =?utf-8?B?V25lbDdkbUhkdmp5cWEzRWxDRS8xUjlGcWFjbzVDTlVWc0tXcjJScFB5Z1lt?=
 =?utf-8?B?S0QzUFdMbkg5aHYzRXYzUDlqWVI5Y1U3SlRTQlp2SzJBbE9VdEsxbkxZcmht?=
 =?utf-8?B?dlkvcFc3NXBBZ21ubW1KWXF2Z2x5UEpPSm9sZ3ZhVEozbk5iUytjVnk5Zmtq?=
 =?utf-8?B?eUs4MVdGdVJjY1l0NHJvelAvdkpXMWtGYUZQS3VGTWZIWHo1NGhIeEZOdEFV?=
 =?utf-8?B?Vi9lOXlXNzM0UDBJSUxaaDF4QTVZdkI0Z0t5cVMzamNMNTJrYTVGekU0TnVs?=
 =?utf-8?B?YS9hd0RnSWpBWVFlZHFtdy91QmoxSSs5cEZuenc3aFZRcTIrcWsva1JTa1NB?=
 =?utf-8?B?Z0NiS3BWcjFEOC9YVkxSNEt1YytDNnNyUjVPdUtwN1ZSV0I3dmxkaFkyZk8z?=
 =?utf-8?B?MVR2dUpDU2pnSTh5K1QrYnNBY1llS2Y4N05GMDRtMmxNVUxxYitvZk9yYWtP?=
 =?utf-8?B?K1B0Vm1XNjBTWmZaaVJYcXNGZWFnVFRjWHhPZ21vdGNkSlI2ZkpJcFZDMGE2?=
 =?utf-8?B?U2NzempxbU5FSTlFdnM0bXRxbzFYbjBKTzIyVFl4UmFtME1hYy9yWDEzcy9q?=
 =?utf-8?B?RzRLMWpJaHFnQ3didi9WY2tPWS95bUlZc2pJaFhQaTRlTUxpL0xRZ1FSVUhw?=
 =?utf-8?B?NktpeFRqbmsycHNPZVcrSU9IVzFWVU9QZjdzbHpETlp0V2hIN0wwT3M0TVRj?=
 =?utf-8?B?M3pEd0k3d3lkNDdDTTZvWFdWUkFpWWxnZUtIUERvTGFOemRKbkxMMitHcUQ3?=
 =?utf-8?B?bHdldnBEOGZLdzEzYzhIU0Y4VW9ublVBcmIyeHdjcXlpRWJYeWE2dXVZWEc5?=
 =?utf-8?Q?QkYcBqxZjS1PpuaXsxQu1NGwK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 802071d9-ef18-466f-b04c-08db9244f41f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3048.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 04:08:25.6900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/eBZACfjh7CrP9yn3w/m5FkbB0WlPBWhruBInYPCnQDLn0olWM7wxyIfmwXpFOR4rNu43uiKUwtf6+7ii9HRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9218
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org,
 Michel Danzer <mdaenzer@redhat.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Nicholas.Kazlauskas@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested-by: Alex Hung <alex.hung@amd.com>

On 2023-07-31 02:35, Melissa Wen wrote:
> Don't set predefined degamma curve to cursor plane if the cursor
> attribute flag is not set. Applying a degamma curve to the cursor by
> default breaks userspace expectation. Checking the flag before
> performing any color transformation prevents too dark cursor gamma in
> DCN3+ on many Linux desktop environment (KDE Plasma, GNOME,
> wlroots-based, etc.) as reported at:
> - https://gitlab.freedesktop.org/drm/amd/-/issues/1513
> 
> This is the same approach followed by DCN2 drivers where the issue is
> not present.
> 
> Fixes: 03f54d7d3448 ("drm/amd/display: Add DCN3 DPP")
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
> index e5b7ef7422b8..50dc83404644 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
> @@ -357,8 +357,11 @@ void dpp3_set_cursor_attributes(
>   	int cur_rom_en = 0;
>   
>   	if (color_format == CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA ||
> -		color_format == CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA)
> -		cur_rom_en = 1;
> +		color_format == CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA) {
> +		if (cursor_attributes->attribute_flags.bits.ENABLE_CURSOR_DEGAMMA) {
> +			cur_rom_en = 1;
> +		}
> +	}
>   
>   	REG_UPDATE_3(CURSOR0_CONTROL,
>   			CUR0_MODE, color_format,
