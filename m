Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F3C571BC1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 15:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5814E9493F;
	Tue, 12 Jul 2022 13:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556A39493A;
 Tue, 12 Jul 2022 13:56:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RObxB+ZjFE5p6uchML6xJv8qRsDlcIrULZHRsBp19ovDqHOKL98FRsvhSOcrvOAjLJkDbjO5qje+Xd5ZaAPNYsZCuXerOm/mCY78IklGWSjZSztOBn6oO0WvUcztYopJGBecGLtRDjwhMdqknmYFBbbj+V1w0r0s7qSMPEeXI5tpxthhegSTzLCuVR+lftdHC9G5x5XsHP8L90sxH6EsnaSm7eU/BGhYhpVnlo95VIbWw7Ee3W1XodEVWD26A0acGf2wBcwi8+dachegNorZh1e59S4uVFCfbRtk97NSwEmtnQ3ZkAom1SQmqe3DcHOidThZdPpSed7elmd0rMja5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9K/yE7pY5Y41FoPOzrwoRzWMKBYn4KsNrVe6rVIsLU=;
 b=LlGH+CublyEC276Vjy0+jUdxd8pEbd7aMFDrTmW1b55Lpn/CRdpdk+0XC4Qx1EuqbJ7YwEdlNmS768QuU3toaFPpuVcjN5Hy/Dt/GWL4pGgkEaR058fIBcr37gCE7CU6E0vMZmgwMrEtXTg1cQAJzXvUBGxd0SE1YDoTXcsy89E0QT1JfLXgG6eUtl9m7+QIjAaJvkADuN47GtBwYtn4aT3cTuxj7nFcceRAsuee+DNWdEkCF8BUzWjbVeaC1HVwgri7Vxb2HVxDryUFCXWIV8xMDCAl9DIlsxUMjH7ZaCqNpAwlmiP7wgsU0RNbVUA1noAQ4QBmlCZEut/cQjzmpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9K/yE7pY5Y41FoPOzrwoRzWMKBYn4KsNrVe6rVIsLU=;
 b=fVDAcPEpVGZnDPadce1ZrKrQEWR/XJKel0r0dufpejl7XhzlFN7f0fc+gpKmO1DZOzxtFJgOwUc4hkhEOiL8pSus3+gK7qpHwb/4wJNGTsU20qVD9h6qYoa9AIKKhN7yqG2RWNx2PEqpiAkBmVOBDR1VUbg4I/kW9d7XMbzLDww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM6PR12MB2889.namprd12.prod.outlook.com (2603:10b6:5:18a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 13:56:40 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6999:13c9:d124:418a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6999:13c9:d124:418a%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 13:56:40 +0000
Message-ID: <062bf9e7-8903-5635-b681-ff42ea518031@amd.com>
Date: Tue, 12 Jul 2022 09:56:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amd/display: correct check of coverage blend mode
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220712113239.132905-1-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220712113239.132905-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0155.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::34) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c49ee1b4-7cfc-4af7-8620-08da640e5863
X-MS-TrafficTypeDiagnostic: DM6PR12MB2889:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: //zQ3oT2RnigWCRzY7Voo+9XXuD/harhQJSKfrlYfEPqMHEfLtO8hvKPQUq2lOXvHuUf/XlK0/R5BSnAW19t9c2tjSs44joyTc2bkXpgrSWxx6EpFki+xccrqqDFiDYuDo7pV+mYgD2L+TRxJrGNjxw+cQCTMPtp2cgl0v0/yJ16CxSKltqs+t+fHzsU462Wfh6Lq/eZFIHg3OeJfwB1uS1aM+uzIIKKJnp9cWULEQZKmog0b4Dovk1tT3UybhOSbDB0meRnuAbkHaZeyGGnFTMxBJu3pEAEBIGh7/TFd4aOS7LAKv4+juShVdPKF6OuA/ru1a9OvPxejPVF4pakp6y/ET3+QVstXlzrPf9c943Ybr7jJhYsGoAqgSgDJ+bq7DwLCVC9to+6BEBpdeGk83EeVHikSzCyZRGcRAfj6Ab3tq9V8nuxQwzD9v5P1GvGBiWICb+eLD5K0KmBpLDDgaunUzHqE/8RvCajLeAUN+zr+fyPXkOaeV5Wb/4vRHUKOM0nQuQbCWpvrraIylZ0X011Cb9+VFazWX7LC22x1OTTKrTfUIssVCLNXvZVkLYS/Y1NFuyy1a6f1ECBSAg1Ao9AUUlhVBGqKff0BCfJvDcRBX5/y37JDvcR1HIy8sVslY5tNsPB+Q7u++H4pliRrloaNjXvSKxvHzR7+1c3WjBHwxOxheYGwjRd406BexhctWx/m6/z4FFHJmsyGrDJO32AHYupbPazZMOBcRugeFiXs/KXSrnYzIAheFkzXwj/XhianYD3QZqARBY7MT3U5dza7O6UysI7wiK3a1Es2wwZ4PAij+dnlmmx9V4ZlvTo8s9lxlrFIaP5zq/SCLncnk8WwUPI10X2pXjxB3K7530=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(26005)(6512007)(66556008)(8936002)(4326008)(36756003)(2616005)(5660300002)(186003)(53546011)(316002)(54906003)(6506007)(31686004)(86362001)(44832011)(83380400001)(2906002)(8676002)(6486002)(478600001)(66476007)(6666004)(31696002)(41300700001)(66946007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjBZOG1vSWxzYVZwMENxQWhDQ2k0SG50RXdYL0pUaDhMZTFRM3dOWklyRDBt?=
 =?utf-8?B?bzNiTFdFQlU4dDRGTnRjSnJzTkRLZG42T25QRVUrTVlGcERVVE14aklEdVBO?=
 =?utf-8?B?d1ZYUHN1dmZxbjFHeFBKR0ltNmtQYk9lNGtBeHZlTkh3ZkR3NGtLUVh2MU1y?=
 =?utf-8?B?d2hVaG9xOGZlaTB3VHpxSmRJd0hyRU5vN1NlYkN0OXBzOXYzMUh1SlpySnQv?=
 =?utf-8?B?KzJGWVl0eUdsWndabXBXcDJzREFIOHRVUzYwQ3FUem5tajY5TDVKdHhnYVdF?=
 =?utf-8?B?WWFyaitUVnN3SWFHbENGYVdBbjl0cnNlMDdEUE8zY2VOcGQ1ZTJZN1JkS3Bz?=
 =?utf-8?B?SUxlZWxWa3hVcSt3QWNWSDVLc3UwUDVlQW1CMGVXSTluck1VY2hBMWp1cG5T?=
 =?utf-8?B?YUU1V2ZDMnRrOFhweWxZeWVTcXB4TVlKRC9qRGYrZmVnUmRodGRyZkVWSG9F?=
 =?utf-8?B?aXdyNGszT2U0ZGpTZjNlWTdWdTlZUzJ6K1Z6VjJSd2VwbnNKTEtyVm5CTzlM?=
 =?utf-8?B?MEErd1o0QUZyYjlWQU1yZ2s0cG5zZ3V1OGJlYnU5VStmb0Uza0J1NlhFNy93?=
 =?utf-8?B?azBQUEF3Q0NocmxlNTZWWUE2bUFKREpiV0ZSam5PUzBncVNmRkJwWm10LzE4?=
 =?utf-8?B?Ri9Ic1VVUFl5UUwxVDNTRDBqZTk5VXUxSnRpNGhhakdPVDI0VGdHdHhvQytW?=
 =?utf-8?B?WFEwcldzWjlCVTlOdjVaNmswTHlRZ29KTk55ZHhHczVOb09qUDZRYlhHdjQv?=
 =?utf-8?B?TSsxNDVLQ3NyQ3RzaUpHYlFNblRQMXRNbHJmRWFsWi9Wbk4zNkczclNJd3BP?=
 =?utf-8?B?Nm11WHQrY3JPNDhmSVRRdjAzVUhnWm95dDNySThKdjA0Q01DUHhyWGlhRmFF?=
 =?utf-8?B?VmJxQ1B0MW1wZ2ZXVTlyOXZMc0xBcDkzbXFvcjFoM0gxdHc1bEF0Vm9PcTVi?=
 =?utf-8?B?RitLUk1QTXJIaTBLTmZQYzNMVTU2T01RZXliUkpLSm9iS3BmbFBBR1hMcE1u?=
 =?utf-8?B?Tklvdm9RYWhYUlhmS3h1M0Vwb0l6RDdDVWVBODlKVndzZ2RzN2JBRU5IVHRW?=
 =?utf-8?B?em1tak9sa2N4NDNMK0ZId3lja1pOUkgvQVNsUWlQOElmZ3VvL1FGN0w5djl4?=
 =?utf-8?B?N2Qwc0poZEZQWkJTNnlsOHpJdUt0RGMzRS9sd29jajA3NllyeTlxaEFIOG5k?=
 =?utf-8?B?NWZsYVhEenczOURVM0krcnpYaExrTGZGSU1hMDU0ZytOeGhlelpvOVUrNDRu?=
 =?utf-8?B?TXNkUWN2aTI2dTdLcGRjN0VvM29EY0ZSN0oyVjVjUzVWUU4rWEtTTkZsSjR1?=
 =?utf-8?B?TkYxZUhJY29PTFNwNnZ1bnFEci9PaWVyUUdrRm52d2k3NTJUUnhGdUhqMGFu?=
 =?utf-8?B?VS9uaUhNOWFqVXN4ZW00WE5xbTFwVTdrU1V5UTMxNFcyUTZOSjl2enpmNGta?=
 =?utf-8?B?emtqZTV0T0dWbDZZUFpXamRmeHp1bENzV3RxaXFQS1RsOFk5V2t2UG9QRGZy?=
 =?utf-8?B?NFBXTDBXamUzTG1HaEliV2FTaHJnTGR1blkwblhlQjQxemU5dE1uQWhodlpV?=
 =?utf-8?B?cG1rLzNOTmJoZUgwaTZyM2pkOVJoZmlKYXowamRmTE5hVThEeFBlaVlFQTJK?=
 =?utf-8?B?NXJvam5XTzZCS09mME1LREUyblZycXhTRGV6cFMvNEFuZ2JDS01hUmJLSUpO?=
 =?utf-8?B?dHRiMldxL21VZGM5VWhkdExXNW44MXMzMGJpMW92eDdDaDdxSzR3aC9jT1pF?=
 =?utf-8?B?Y1FJOG5wY09GbUlLVFdFZnltTGhrbm1pV3pOd0dBak8ra1JvTzF1OVNPVjNv?=
 =?utf-8?B?VngwZmxPbTkzb21mTjhXNDU3NUVYb2NrSVF0SlNYS2MxZjdiZm5UZGMvMkFo?=
 =?utf-8?B?SGR0UG80OWR4WmxLaTMvYlR4WWg2L0hyMXJKakJTblBNd3poUVltakxTRml0?=
 =?utf-8?B?a0hIOThiQVl3UldIWExZWVBIUlpkY2ZFMng3RjJsbDJ5bUVwQXEvN2JBWE4y?=
 =?utf-8?B?QVFSUkxnY3hUM0VuRlowVUZ4aDFQdnlJNjJ6WVlGUHNxRmxERzJTb0Ywenl4?=
 =?utf-8?B?czkzeWpPb0ZvQzdxS2xES0h3UStjVzVOTkp6ckVkMjhoU0piQmpFQzJsY05k?=
 =?utf-8?Q?FdA2sJH4uxxiiVgdXm0GWXLdq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c49ee1b4-7cfc-4af7-8620-08da640e5863
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 13:56:40.4864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luvtCZpTap83/0ld3Bi1CCOo0+lcjGkXr2HZFI2hJ3ptVWm2PhmM+vmbxtwMaj6XD8aETlEdlYk7a6RrPiYaUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2889
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Dan Carpenter <dan.carpenter@oracle.com>,
 Sungjoon.Kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-07-12 07:32, Melissa Wen wrote:
> Check the value of per_pixel_alpha to decide whether the Coverage pixel
> blend mode is applicable or not.
> 
> Fixes: 76818cdd11a2 ("drm/amd/display: add Coverage blend mode for overlay plane")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index de1c139ae279..25cb833b267c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5486,7 +5486,7 @@ fill_blending_from_plane_state(const struct drm_plane_state *plane_state,
>  			}
>  		}
>  
> -		if (per_pixel_alpha && plane_state->pixel_blend_mode == DRM_MODE_BLEND_COVERAGE)
> +		if (*per_pixel_alpha && plane_state->pixel_blend_mode == DRM_MODE_BLEND_COVERAGE)
>  			*pre_multiplied_alpha = false;
>  	}
>  

