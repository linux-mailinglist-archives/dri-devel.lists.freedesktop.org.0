Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DE965D796
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 16:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BC610E299;
	Wed,  4 Jan 2023 15:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2046.outbound.protection.outlook.com [40.107.102.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F4810E1BC;
 Wed,  4 Jan 2023 15:53:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3uYNk3sgoAMx3imbnSBdMRRctsY+lciqp46BACe732lx3PU6XDSObC8W8pthfPsGH090sqVf4wXl7LG4m/RhV2JNykuyRz3rrt++V2TswT/2eVu+yP0zbezzwUWAOqY6GRSrAU9sU2PMVV44ENfwTjPUn7CaCYH2MjmvsVXJykf8yyzW2oMaoB9SiuQ3IKvG451UBGFocqDXUo7himo0/Es9+5O19Jr+/91OuINLsQ4pzRy9fh5c427Iu/3IHlPBgX2XePYTALNknec2Ave+wYMQXIJjhXChtfyiBVrbx4vwrxVYotrhtaGoGNXkCt48ejI6Jo4EaOMTptgL8rHQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irpxQpr9tgwxh2EFZV72+6GGBRdKOEhnZH2NSIu/7+I=;
 b=RV4y0aY7jK/LYKbz6N7wdmMKikwU0anF1V+QHcVvDTshe6S2GKWErvIiabMdH/eCdwh3zFfWM1G5AdN4krJCMPIfFgh7XGaGtf3Ks/pjaUoFcRaSUdRBUXyFfV57USJOBnxc/qPzWjP1lzJXh3sggkotS16xrgM7hKAGNLrBSgU7mcmbNZSDMUrEJMLu+1OuH6LDgiOJAztoeFwceZIBIMYGHrSJgPp9ik6w9n80eFIQKShgXUSacty1HmVkAkA5yIffl3Xn5Py2IkC2iabO2IyjFgwJC40GmPL/JGYq3Z/5JJK6ItRJDKxyY2yskkTyu3TGEutpb/QSOpFZJuEPOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irpxQpr9tgwxh2EFZV72+6GGBRdKOEhnZH2NSIu/7+I=;
 b=GzSOEhzhS5VvDUI0GlNip/xqvAo2DuCz/9/tTSyLsmfzumXvkknw6zAdx/Nk6n5Nn+U14emMz4m3kAiw5z7iT79so/2yIA+h6IIrwN1qH0OJU1f2dUWkfvrY+bEUIrvQ2ln/DYpsrbPMCJ2YJstUIL6UmJNPo/KDNm+JwH689bc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB6612.namprd12.prod.outlook.com (2603:10b6:510:210::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 15:52:57 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%4]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 15:52:56 +0000
Message-ID: <4d87ae7c-457e-ffce-cc3c-d586e0513698@amd.com>
Date: Wed, 4 Jan 2023 10:52:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 24/27] drm/amd/display: Load DMUB microcode during
 early_init
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org
References: <20230103221852.22813-1-mario.limonciello@amd.com>
 <20230103221852.22813-25-mario.limonciello@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230103221852.22813-25-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0354.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::11) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: c235d916-4cb2-4fc4-0842-08daee6bbf63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HeYTaf88TNl/1+JvSE42uUuh/WqAKFTJ0JDGRtFUj2g6FreSfROmkmE0Js5hveqciJd6v0pOCMTUQhKefwH3fkml5/CZXzF2kz1S2wh4mvK+zh1N/9Ns5DWSdjvdogkUSbNj7wPLa0JJfK0kbrSJgYmRyTSQdCDt6V3A4M2eiryU6M7AzlCEw5MNHa4AbO7951NV0EQJF71ep5qrp4AzoGJhAHuL3NQ5tauBBvwaoczSu9XxHXjP6h8439mLZ+5CDb1JKKINKO2AQKEgm8l63MoegtJndvGSNzPfVbgvrOpBFRoXZFsj0WtAX4BI+PeMC6AjKCuZ5fi+QqM1XoMZbPvJ2/dV1hiWaxsJAOlkg1VMUJgMQiQ+KdOoTQQBVe0SdwJw7xk7Lraq4OE9M/jH5LTI7pdpjoCJm0pT/vpGlLNPbyqKKOBkmQ9j1/oy8DGKAyNt6RCF/PDOA6OFg1YIkhPGbWI4Zr9SLeO/Mw21jADkgsIb9SqlD/HgxrI5NxapHsfPTiqjsC65VeH3gQj1wg8rDryQA3gW2hBiznwg/QbD6WNM1hGWsac+Il4hxpp8Awv3ipOkCc1LcK0kCejut2akzCAbiOongKZbhCBWJmKWHmeYpJLPRrwt0/0JeqnmBizVG/y6sT0Yu+mZJz8HTDGnTjKY6+lvU5ujCEqqHQrqPN/yflOFyXlLsY8EIUUkg0itL4Mj9OggBmwZy/ii+GumKZMQUKvdh7Q7TdKMXnc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199015)(44832011)(41300700001)(8676002)(66946007)(66556008)(4326008)(8936002)(110136005)(54906003)(2906002)(66476007)(316002)(6506007)(6512007)(31686004)(6486002)(478600001)(186003)(53546011)(26005)(5660300002)(6666004)(86362001)(31696002)(83380400001)(2616005)(38100700002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUNNbmZzR2hFOHh4QUtEMG9uTUJqdWx5UlFzcFJJY0tYY0JUMTB5VC9Nb0pT?=
 =?utf-8?B?cTNqM2lsTWV1YTNlRHdNTWZFUjN3NjFGbGEyb0ppUWNURzF4QWNnZ0h1Nnp6?=
 =?utf-8?B?ZkZjVWZiZHg5ZkovWm5zaWR3V0tselJuSUxGWldSYzhIUUhnVkhkdnNQSmxT?=
 =?utf-8?B?OHVmV2NEdzFzWDZxZTR4UlJJNEthNWNuWmpXSzlvZktvZThMckJua0NUbzU2?=
 =?utf-8?B?M1ZKU05VdzFndElUVGNSbjJNQTg3MW9HNGJDQ0pZVUdrcFdQdUg2bXprVEJD?=
 =?utf-8?B?eC9iVjE2WkprYUlscnU0VVUwbEg1d2JZOEJhbDRKcEZQOGRTWHJZcFFuQVZ5?=
 =?utf-8?B?VXN2VU1WbEVUWXJmU2pTVVlTWXhPRU1BNnMwMXZselhhbzF5THNkSUVrY3hy?=
 =?utf-8?B?dkErdmEzWm94NDMvYXNnSDdMSmUzaEt3MjBWaVVLbFdvVzhJVTBEK2hIWTNM?=
 =?utf-8?B?NDg3Y2U0V3l6Q3ZtRlNWRXRmNEQzVFhyZlFjbWJaU2tiQkRjUklPeEtwT0FE?=
 =?utf-8?B?R25aTTd6V2JJNTRzQ2l4YXhJVWkwRzB1Yit6YjBVOGpvUTJpVWtiMXdZNWwx?=
 =?utf-8?B?MUhaWEhkQUNVTDlhOUFEc3pYV1FqNnkrNUJUU0xFWTBRWFB4M0ZiTjhER2Zz?=
 =?utf-8?B?c1Y0N3hhaFgyUy9nZFJaZWJ6Q0tJWlNnWXRqM2krQVZsakhXWkxnSUhOMlhi?=
 =?utf-8?B?bjJuOXUydkNGbVZkZjRrK3Y5U0M4ZDFnaFNTRGkxQTl0aFpUL2FBbXNTSGNi?=
 =?utf-8?B?R2NxdlV3NHJWZmU4MHU2V2ZsOU1IaDJNS3I0ejZvTDFrQmdSUUJhTzZiVFBY?=
 =?utf-8?B?VVRraGY2bmxjMmI2SlVoRlcxbWFFUjhPYjB2a0Q4U2d6UjBqRG5SRUpZZUxQ?=
 =?utf-8?B?Zk41enZ2UkJUZkdWYXg0alg0bUxmTGttVGZFOVRsTjFvSVFYeTkvNEdiVnlo?=
 =?utf-8?B?c1c4WWRFazlHVDh5dVJQTmNSMHlqQUtlVmFoK09lVzZ4VSs0UXVUaU5hQzRh?=
 =?utf-8?B?eklieC8xdzdYZENxczhBQ2VWaWxiRkxvK2RyYldrT2tnTVBCNVl6TWxFa2ov?=
 =?utf-8?B?SGMwQmk4OStPbitDV1Y1SVpVbUVEdmVDUDJJTmNLalpCUG9JWTJlb09rVVgx?=
 =?utf-8?B?VjdwOCtjWVN3LzlRWERHR2ZkdEcyZEdaK2J6Y3cyamltU053WXdMMmtsZVRZ?=
 =?utf-8?B?WEFLWTJRdGtpYkNTWEZ6d28ySCtzczZnNnBlaWNwTFFKcDdDdW9jb3VNZXZs?=
 =?utf-8?B?T2N2Qm1QZ1RBejR6NTFwTGtYR0VLS3NPcWt3ZW4veXR0SGRrZVl0UTdLSzdn?=
 =?utf-8?B?Sk9palZEUzRvSEgyWTh3bHVUWjMxenpBVTF4UWhqY1BuejRhSjFZTVNDaWVJ?=
 =?utf-8?B?ejhYOXRUSFAxOEx3dTRRRm05dU9rZGJNbEpNbXgrazB2bmlQMmx1a1JTelVN?=
 =?utf-8?B?TEViVS9LTEhYbUtpTnAyMDAvdnZmSXZYRGNZMU15L3VheERqRDBzZit3RFc2?=
 =?utf-8?B?M3VBOXBUdmJkWGJDSGRScTUyUlF4MGZmNmdCeGxleDJCUFdWZTJZdGxDZDJQ?=
 =?utf-8?B?S0xWMllFTHdVeVYrS29PRktPclJ4aG4vOHZlWTY1YnV1My9KeklCTEZvY0xK?=
 =?utf-8?B?aUFRWU92MXdqcDVOL1BaV1JZakpiZVB1NDZTNVNzdVpCM2ZWMDFZN1N0cm43?=
 =?utf-8?B?Q2ZRbjh1ZFBOMjJTcURyWTNMRTBzQWhCejJkRXZma3BtaE1oZkx5QVBEUWZu?=
 =?utf-8?B?UGFwZ2IwWTNQeEVFUU1EbmgrUjl2L2JrNDNjSE5vNTFiUXgxbmZ2WFkyRjR0?=
 =?utf-8?B?NXNBV3R5RGtVVUVrcVptdTNyTkhnclo3cVhIaE45elNjMWc0dUtBRGtyVUZh?=
 =?utf-8?B?TU5jbmdzYXU2bFljbm9Mdmcvc1ozNUk4aHREZ2F4d0o5U250c0g3emp0THlP?=
 =?utf-8?B?VHk0R3lWMUtaZ0tpMkhXZytRQjFWN3UvVnZUUmdKNWMrSG9GOVNBT1Q3Sm5v?=
 =?utf-8?B?S3lPR25QNWpuelp3UTdnUldoenZoRXYyTTlhVk9mK2YvTGZ4Vm5uMDFFcjNK?=
 =?utf-8?B?bGJWRFAvZjlzTGlzclhGRWhKVm1SQUl3UzNuQVRhbGQrN3JpKzVSYktpbE1Q?=
 =?utf-8?Q?hZZP0JiMdgeU3PtFbjzBTHe6p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c235d916-4cb2-4fc4-0842-08daee6bbf63
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 15:52:56.8227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owodwMU6fRuZecd5zKMEhHEGATSqbN7RW/aEpSfhTrkKb8rtUrCG9fWox9NFHNvxzZE5LOgBE/hQKOTcviYZYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6612
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Lazar Lijo <Lijo.Lazar@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/3/23 17:18, Mario Limonciello wrote:
> If DMUB is required for an ASIC, ensure that the microcode is available
> and validates during early_init.
> 
> Any failures will cause the driver to fail to probe before the firmware
> framebuffer has been removed.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

In addition to changing the FW load order this also changes
request_firmware_direct to request_firmware but this seems to
be the correct thing here anyways, since DMUB is not optional.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> v3->v4:
>  * New patch
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 89 ++++++++++++-------
>  1 file changed, 58 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 4829b5431e4c..eeccc8af0320 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1945,7 +1945,6 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
>  	struct dmub_srv_fb_info *fb_info;
>  	struct dmub_srv *dmub_srv;
>  	const struct dmcub_firmware_header_v1_0 *hdr;
> -	const char *fw_name_dmub;
>  	enum dmub_asic dmub_asic;
>  	enum dmub_status status;
>  	int r;
> @@ -1953,73 +1952,46 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
>  	switch (adev->ip_versions[DCE_HWIP][0]) {
>  	case IP_VERSION(2, 1, 0):
>  		dmub_asic = DMUB_ASIC_DCN21;
> -		fw_name_dmub = FIRMWARE_RENOIR_DMUB;
> -		if (ASICREV_IS_GREEN_SARDINE(adev->external_rev_id))
> -			fw_name_dmub = FIRMWARE_GREEN_SARDINE_DMUB;
>  		break;
>  	case IP_VERSION(3, 0, 0):
> -		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0)) {
> +		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
>  			dmub_asic = DMUB_ASIC_DCN30;
> -			fw_name_dmub = FIRMWARE_SIENNA_CICHLID_DMUB;
> -		} else {
> +		else
>  			dmub_asic = DMUB_ASIC_DCN30;
> -			fw_name_dmub = FIRMWARE_NAVY_FLOUNDER_DMUB;
> -		}
>  		break;
>  	case IP_VERSION(3, 0, 1):
>  		dmub_asic = DMUB_ASIC_DCN301;
> -		fw_name_dmub = FIRMWARE_VANGOGH_DMUB;
>  		break;
>  	case IP_VERSION(3, 0, 2):
>  		dmub_asic = DMUB_ASIC_DCN302;
> -		fw_name_dmub = FIRMWARE_DIMGREY_CAVEFISH_DMUB;
>  		break;
>  	case IP_VERSION(3, 0, 3):
>  		dmub_asic = DMUB_ASIC_DCN303;
> -		fw_name_dmub = FIRMWARE_BEIGE_GOBY_DMUB;
>  		break;
>  	case IP_VERSION(3, 1, 2):
>  	case IP_VERSION(3, 1, 3):
>  		dmub_asic = (adev->external_rev_id == YELLOW_CARP_B0) ? DMUB_ASIC_DCN31B : DMUB_ASIC_DCN31;
> -		fw_name_dmub = FIRMWARE_YELLOW_CARP_DMUB;
>  		break;
>  	case IP_VERSION(3, 1, 4):
>  		dmub_asic = DMUB_ASIC_DCN314;
> -		fw_name_dmub = FIRMWARE_DCN_314_DMUB;
>  		break;
>  	case IP_VERSION(3, 1, 5):
>  		dmub_asic = DMUB_ASIC_DCN315;
> -		fw_name_dmub = FIRMWARE_DCN_315_DMUB;
>  		break;
>  	case IP_VERSION(3, 1, 6):
>  		dmub_asic = DMUB_ASIC_DCN316;
> -		fw_name_dmub = FIRMWARE_DCN316_DMUB;
>  		break;
>  	case IP_VERSION(3, 2, 0):
>  		dmub_asic = DMUB_ASIC_DCN32;
> -		fw_name_dmub = FIRMWARE_DCN_V3_2_0_DMCUB;
>  		break;
>  	case IP_VERSION(3, 2, 1):
>  		dmub_asic = DMUB_ASIC_DCN321;
> -		fw_name_dmub = FIRMWARE_DCN_V3_2_1_DMCUB;
>  		break;
>  	default:
>  		/* ASIC doesn't support DMUB. */
>  		return 0;
>  	}
>  
> -	r = request_firmware_direct(&adev->dm.dmub_fw, fw_name_dmub, adev->dev);
> -	if (r) {
> -		DRM_ERROR("DMUB firmware loading failed: %d\n", r);
> -		return 0;
> -	}
> -
> -	r = amdgpu_ucode_validate(adev->dm.dmub_fw);
> -	if (r) {
> -		DRM_ERROR("Couldn't validate DMUB firmware: %d\n", r);
> -		return 0;
> -	}
> -
>  	hdr = (const struct dmcub_firmware_header_v1_0 *)adev->dm.dmub_fw->data;
>  	adev->dm.dmcub_fw_version = le32_to_cpu(hdr->header.ucode_version);
>  
> @@ -4513,6 +4485,61 @@ DEVICE_ATTR_WO(s3_debug);
>  
>  #endif
>  
> +static int dm_init_microcode(struct amdgpu_device *adev)
> +{
> +	char *fw_name_dmub;
> +	int r;
> +
> +	switch (adev->ip_versions[DCE_HWIP][0]) {
> +	case IP_VERSION(2, 1, 0):
> +		fw_name_dmub = FIRMWARE_RENOIR_DMUB;
> +		if (ASICREV_IS_GREEN_SARDINE(adev->external_rev_id))
> +			fw_name_dmub = FIRMWARE_GREEN_SARDINE_DMUB;
> +		break;
> +	case IP_VERSION(3, 0, 0):
> +		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
> +			fw_name_dmub = FIRMWARE_SIENNA_CICHLID_DMUB;
> +		else
> +			fw_name_dmub = FIRMWARE_NAVY_FLOUNDER_DMUB;
> +		break;
> +	case IP_VERSION(3, 0, 1):
> +		fw_name_dmub = FIRMWARE_VANGOGH_DMUB;
> +		break;
> +	case IP_VERSION(3, 0, 2):
> +		fw_name_dmub = FIRMWARE_DIMGREY_CAVEFISH_DMUB;
> +		break;
> +	case IP_VERSION(3, 0, 3):
> +		fw_name_dmub = FIRMWARE_BEIGE_GOBY_DMUB;
> +		break;
> +	case IP_VERSION(3, 1, 2):
> +	case IP_VERSION(3, 1, 3):
> +		fw_name_dmub = FIRMWARE_YELLOW_CARP_DMUB;
> +		break;
> +	case IP_VERSION(3, 1, 4):
> +		fw_name_dmub = FIRMWARE_DCN_314_DMUB;
> +		break;
> +	case IP_VERSION(3, 1, 5):
> +		fw_name_dmub = FIRMWARE_DCN_315_DMUB;
> +		break;
> +	case IP_VERSION(3, 1, 6):
> +		fw_name_dmub = FIRMWARE_DCN316_DMUB;
> +		break;
> +	case IP_VERSION(3, 2, 0):
> +		fw_name_dmub = FIRMWARE_DCN_V3_2_0_DMCUB;
> +		break;
> +	case IP_VERSION(3, 2, 1):
> +		fw_name_dmub = FIRMWARE_DCN_V3_2_1_DMCUB;
> +		break;
> +	default:
> +		/* ASIC doesn't support DMUB. */
> +		return 0;
> +	}
> +	r = amdgpu_ucode_load(adev, &adev->dm.dmub_fw, fw_name_dmub);
> +	if (r)
> +		DRM_ERROR("DMUB firmware loading failed: %d\n", r);
> +	return r;
> +}
> +
>  static int dm_early_init(void *handle)
>  {
>  	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> @@ -4645,7 +4672,7 @@ static int dm_early_init(void *handle)
>  #endif
>  	adev->dc_enabled = true;
>  
> -	return 0;
> +	return dm_init_microcode(adev);
>  }
>  
>  static bool modereset_required(struct drm_crtc_state *crtc_state)

