Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF6E729D6B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 16:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1324C10E0B4;
	Fri,  9 Jun 2023 14:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2065.outbound.protection.outlook.com [40.107.212.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AC510E0A3;
 Fri,  9 Jun 2023 14:54:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvQw11cN1iTSr0SKcJ4SHrBP2ngscc0r66ea+tNoiie4F4RY/crWRkX3V/eUM6jDIYj7tWgGQppJFNXTYPe9HOeeT40K+cOi2anm8FDPhKds/xbvW6ZEFH0PcTlIWlBvYqtS5Gr/bOtTElB8IZ7riOswkMdBPvnvqFiSn2Zry0QLP7wXCFHopeXwiXNpieOcEkCXa8enS3ZkBVmuKOv2oYXu/viRkuyD1TLfASGTwlYVNzsDqwe4+izYgdWP3KGMl+uqcehNUvMJwI9WwIal2/SQMhK8aHW0sgmVTbx712RTzXEyQMe9x4db7kECa8OCLN3TzwixVe8PDYeflOqfVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SC+YV4Sgfwo8OHcszvKt0afV4qQxDY5hGQdrcwfN8+A=;
 b=UD0ekq3KBSXoKgmFrRnWZD5ZDJtNqCDW7tDymIA3HBu+Jmw3Virt+Xrydb/HpHzVN76nwIj3Utvi9hCkOry6AYJVCf61oyEyvt5wnXZuyl6/6tbzzmS/YYlLJpaZeB8Iz/QBubwue/m7cedvbc7cOvmUToD4LnBX2Dn/Ynv7PRVXgNRbRYZxDQfa2GZHT7vv96gpeYTC8GgV/22buM6mVky4h5GXyI6rMD2x9L91y8be0kZmsg68BVvhLctRjcq/YGxZYxYH6M0ZMS3DSe75ampV4GUINVepE0TZQk1LW0TxmTVVDDzncRCjKpP90fIPWAIjnE8AnMj05O8ZpXlkBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SC+YV4Sgfwo8OHcszvKt0afV4qQxDY5hGQdrcwfN8+A=;
 b=bIe6o8lqIEmUdw3Wc1pyjZkjZaVqzfsEoUShWKWSChkMMk7cS6Ovq1GSuxNMVwZmGCDHi30hrlCJDfhpAiScQzKsGtpi+cYszdRv0YOzeV6WN7bcAtV+8lAjIDZ8D5udriKF6P/S3n++g5KWkiKljQv5qTsLNYJlBs79HwmPdfk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL3PR12MB6595.namprd12.prod.outlook.com (2603:10b6:208:38e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.42; Fri, 9 Jun
 2023 14:54:26 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%7]) with mapi id 15.20.6455.037; Fri, 9 Jun 2023
 14:54:26 +0000
Message-ID: <3f71e132-8b9b-8f54-973c-ad9403369c1a@amd.com>
Date: Fri, 9 Jun 2023 10:54:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RESEND 11/15] drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Move
 SYNAPTICS_DEVICE_ID into CONFIG_DRM_AMD_DC_DCN ifdef
To: Lee Jones <lee@kernel.org>
References: <20230609081732.3842341-1-lee@kernel.org>
 <20230609081732.3842341-12-lee@kernel.org>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230609081732.3842341-12-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::34) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL3PR12MB6595:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dde8987-5763-44bd-16b2-08db68f96bba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EqWRpxU6MhWdoQjJGf4TXkdBu1JTgYMZ2HkblSbCzBIlu8DRAL0hjOX5mVbYFF0Kd1V7aBtiLR/xRu9X6ld5TK3nPHFzwMNbp0vV/ZSQ9JGqmPCnURi19DcFjDs5O4QFLDvU+ku+KxybfyUQO6iDgdn40emVQzQ1QbeAfHiAUKU82LcVtasHxV39Bc4Z9CGM0O07Va9iWdW3YM1aZMrn9CN2+JJbpAX5fSQMmPafVIerk/D3TNGniMxjKME255qGJmRNG7VntfBE8CjJYQPWYIVk/uMkQ8eAmpMOJuRGzZ1H4SJJvzMphpKHtLwHrdDIE1II3UxFQ6evLJJAYxxxUS8hUl7LkmdQKV0abRjIzCplJdSEW9ZSr6O8wawIOEgQGdBkIB1ErGTIzzxV4E7qjRGDRz6moZtlGeTcnZCIevYdawrA17FbBXgrALIfur+luzYFtu5K6dpvgd+ThzoqqD2E9NdNvZx/epVp8apeVIyloGs4rB44Ne/aTf3AzH2UySaA2yoqEEmTApLg5/gDp9ZZuMgdnvfPseEpS59grN5tnwaO/My8MJ76SAVTCTziP8+TLaYJSRESGX3z8ZKj0KxNi77ofdiRI4z2xLo3gS1Kx26Wsg/lbe1fI9gdKsUxU3poH75BSbv3+xr43H5gyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199021)(2906002)(31686004)(44832011)(66574015)(83380400001)(5660300002)(8936002)(8676002)(54906003)(316002)(36756003)(66946007)(66556008)(41300700001)(4326008)(6916009)(478600001)(6486002)(6666004)(66476007)(186003)(31696002)(2616005)(86362001)(38100700002)(6512007)(6506007)(26005)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDBlMEFvOGs1OUZnY3ByYmlxQ1VWT3dDZE5mcXUzZHllMzhRdytab1J6dzZv?=
 =?utf-8?B?UW5BT0NOb0RUT2t3YzJnbS9XdE5CV3VpVTVVSnFQQUowenhIZkx1VmR5ZHZm?=
 =?utf-8?B?MCtOQnY1UHFqY0ZxRFpuQjhHMnU5MjZ2Qk9sbVlxVGJBVVJBb3UrN0FjQWdh?=
 =?utf-8?B?VXBnUHRINHRvU1VSWlIvM3VaaS9STGdMUGwvd1dSbmxyRzQxSit3Y2YvYzhF?=
 =?utf-8?B?T2tsKzlBeDIzUml1UTBnakE3RVpIYmxQNFIzZEJHcHBqZ1BnRm5HbTFyUlVo?=
 =?utf-8?B?SGRLaUdOc2NlTnpoZUxLcmxMMmREcGplZ3U1KzljdStYWUFvWG5xdCtmWFlr?=
 =?utf-8?B?Y1BaS0RnQ045cHZNMEorUzlyYTBRUTY1Unc1Z05sc0FBMm5LSytNMWEzY3VP?=
 =?utf-8?B?UjE3TUE5L00vQU1tNm1SWkZNZE9xSXRUNlhkSFBKS042dmtneHpFdTU2MUZt?=
 =?utf-8?B?Y2duV25KbXJ5SG53OEF6eElQTEE2NUdjbzNKdk1ha3F4MDFFSllJczNSdmhr?=
 =?utf-8?B?b1lEQ2dCZVpVQWNSUDFSYWx4bHA1ZXUrbExWcjh1OVZudDN0ZXc3d1pTdC8x?=
 =?utf-8?B?dWlmQzJ1YUpZZFo0WHJqQXlzYUF6YzZnSzdBcjhtZEtHQUN3S3czWWE0c1ZW?=
 =?utf-8?B?NXhvTnJ6RDNKMXJGUFJUNXFWS0NHc0RJZ1lIY1BiOG84ekFLYk1IMWN2M2xz?=
 =?utf-8?B?T0RIeThMVEhlOUdaMXE2allyeHJPYjhmeU1yMUVZcitDaXZWcUNjUWwwcHU0?=
 =?utf-8?B?WXQrOUtyR0JGd1YybCtadzIxcUFiV3AyeGYxSndFTzFHQ2t5N0ZvZnFOVXhY?=
 =?utf-8?B?MUtyZmg2azMwVTA5OEJLOC9tTDRpSW5CTXBWM0ZnZ0N4cDJrRy9xSHNld2hi?=
 =?utf-8?B?aWlaMWI5N04vNGorUk4wTThQMFdOWnRpY1NqaS80RWl4aDZ3SFZpc0FQWmZm?=
 =?utf-8?B?clYzTTM1ME4vbE0vWk5PRGsvdDJNRWRIK0FhQnphcjNVWUNqd3c3czgzQ3Az?=
 =?utf-8?B?RFY0cVFKa2plVFdKS09WUHB0alpxcDRzYVlPc3FYekZ1cVA2ZVFGSUlKZk1U?=
 =?utf-8?B?Y2FwaS9YOUJZRlZmZ1hYU2t6THRiYUNnZ0JYWTVsUXl5amRXbmhaZWdKanRJ?=
 =?utf-8?B?cjk1MWxFSlJ3TUxHenhIbFJYRXdJTVc3T1R0QzdiRzJrayt5OG5INDdNQytV?=
 =?utf-8?B?cDlrV0M5Z0pIL1hrM01CYm11eXg2MTRhWU9SbUsxVGxXZytKUjlFa3F1QzF5?=
 =?utf-8?B?SmhPc1pBTkVJTkorbEQ1Z2E0Z2R0L0pHMXVxYzlhWndSTnRBaTgvTFVBektI?=
 =?utf-8?B?OHBHdmRqVjVxS0NuQWQyODBybVdUM2pjM3VQTFRxNmhoWjlaQS92MDNCamhT?=
 =?utf-8?B?RzFBeEkybHE2b1NhVlZ0YVZtTkNIOFY5MG1WUWNIdnBURCtsOCs2VDVQR1hG?=
 =?utf-8?B?MXVaSVlHR25NaW40eGQvOHA1QkNjazBBdWdqVjMvNFFvZjVLZmttdU1OMVRr?=
 =?utf-8?B?YXNYMXg2QjF5ZjNoWHRPVlVuUW9XVEtIbUdtL0w4bGdWTlB0dytieVNYRTEy?=
 =?utf-8?B?bUpEcnJKY1dxSGVGZ0pZYmg4WVptcWdWMDZtTklnWUhWNHR5M3k2WTFTdnA0?=
 =?utf-8?B?eDFlNjJjSlh5ZzBHYWhpWnhPdDVPSnJjZVd4eTcvS01qZjlRdnBMMEJWcjVs?=
 =?utf-8?B?OUVPZ1pYNzZzcFZNMDNMcVZHYjdBNU4wd05sQkhzeGJDeTRFcjUyaUlCVnI1?=
 =?utf-8?B?VzhZM20rZW5DZ1k4QjVndm9iR2JHamtHRnZHT1dZNlZXb21DcFlMSXpHb1pR?=
 =?utf-8?B?TzRLbTgyV0oxRGkvYUI0VzdMeFluUkliTWxDMUFiNGhvblpIUzNIS2Zydzlz?=
 =?utf-8?B?YXNBWExRYzBUODZENjMyK3pucENHdUtCUTcvVm0xdU5QTG9MU0I4T0M0NU5X?=
 =?utf-8?B?NEQzUVhrY24yMEZIaDcwQW0reDlhaFFHdTlReExYMW1YcTkvazFWNTJSczV2?=
 =?utf-8?B?WlQzaldsaVJINll6QjYzejNwVEZyQllnR3dCVmZ0MWRLOXBSUnlnd3ArSFpV?=
 =?utf-8?B?OEpzaUZjdm4weHdsdWtsTnpTTjRMWWNYY0V5Tm56YUdVamdIcFJRTytIVWg1?=
 =?utf-8?Q?ucI9DNZMQq4V46qlA20opF4Iy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dde8987-5763-44bd-16b2-08db68f96bba
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 14:54:26.8480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKD44Gqsd4iuJwBPBVtN0F57qAKtM85dTX07HAnge0kPlfWwISLUW7hPpc/t3MgesAhG62bsumXomjzbtFZFag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6595
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/9/23 04:17, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:48:22: warning: ‘SYNAPTICS_DEVICE_ID’ defined but not used [-Wunused-const-variable=]
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 09e056a647087..cd20cfc049969 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -44,9 +44,6 @@
>  #include "dm_helpers.h"
>  #include "ddc_service_types.h"
>  
> -/* MST Dock */
> -static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
> -
>  /* dm_helpers_parse_edid_caps
>   *
>   * Parse edid caps
> @@ -702,6 +699,9 @@ static void apply_synaptics_fifo_reset_wa(struct drm_dp_aux *aux)
>  	DC_LOG_DC("Done apply_synaptics_fifo_reset_wa\n");
>  }
>  
> +/* MST Dock */
> +static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
> +
>  static uint8_t write_dsc_enable_synaptics_non_virtual_dpcd_mst(
>  		struct drm_dp_aux *aux,
>  		const struct dc_stream_state *stream,

