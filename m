Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C9265ECDC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D2610E719;
	Thu,  5 Jan 2023 13:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078DE10E0A5;
 Thu,  5 Jan 2023 13:22:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpsF3rv6alcfdbi2i0waJJhiIlE+D3Y+VtfA9NnmVDYVuV1TT4ieOZSwtLJ908uwzTGWOEPTpbsvgShnL/9kktkpmG03G3TOfT+UAJNLMctN3B1efVhUqNolnNYCxA/A+/LtoGTfRn7WK1cDHWVj8gT2WTEMTUKT6TW+ZX0VT3p93293ZCSnBaUqb/oe3ZnyRjMaoD6GcQUHj7XzM7On6cJCFfXDqTM1qMMuetdOQDJOv8uHeBRpF1SVnig1+2zglVGHm1QcZvs6r8xkdKCai24VHePg03DUxkOvrMNI8XKIZRPKfphwE2zSLxp0xflll8DEzVh+WM+qmwssKOWEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JczF6m0TSQz6mB07j2FGOfUR5p7/khgWXfVHj95Jn1Y=;
 b=YjYs3iTVZhghgmUReNYW0iyJgedbMPXeCQB/LcXPrqhjLPNu71UMCY/zqurg98WIzRQqVqEIZlx46oPqIvEU0kVh80lYXiLqcPAz71JzosEZzysHXYA3LfVY9Tk/2moirpQ45BXMdHdD0ag7XN+IFjkgYUcU1Ny6zJFHNmjmr6UkJ5aNhx5J7HfP7ksyzZWHGxo5B88hb1HdKL8yyMdmk2LojOZ2lf1zZiK9UTCqD7JocaaGEfDfKRqZN4ce6pwVHeS3HywugSBovKDh9VP9cN2HP3Bvxfel0mcK5n7FMiwzp/C+bx1XiyTGMQpIyuuVhdhIFiiXV11pvbKqcEwYnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JczF6m0TSQz6mB07j2FGOfUR5p7/khgWXfVHj95Jn1Y=;
 b=dfoBLSM9Span/uqKoNfNSBsaf//FVQi8Pyr2haQs5UMwhZtmhjZT5NiaxelAK8LVlgE/ale0kHkyFTEENQAbsBQZGfPi2kRXt2YJaWej7gsd8+jbNCLD6L5Q3vCY3gF++DlPZFM/A08mQekNvLeKC9NHYPP7hzqvXrsHmd9SQRU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by SA1PR12MB8161.namprd12.prod.outlook.com (2603:10b6:806:330::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 13:22:41 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::457b:5c58:8ad2:40fa]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::457b:5c58:8ad2:40fa%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 13:22:41 +0000
Message-ID: <142113d4-b958-c55e-eacd-04ff4ef3243f@amd.com>
Date: Thu, 5 Jan 2023 18:52:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v6 20/45] drm/amd: Parse both v1 and v2 TA microcode
 headers using same function
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org
References: <20230105034327.1439-1-mario.limonciello@amd.com>
 <20230105034327.1439-21-mario.limonciello@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20230105034327.1439-21-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::9) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|SA1PR12MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b1bdb8-2e62-4ebf-fcc9-08daef1fec2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oYznoEUgjvs8E1FWkoraQ+gJULF5MhGX8k2aY/DFq4Z4iSb54NF/3MkAMLqK6y01E5r8WLnVSpQdTQftsS9WXVrbHJWKkozg+hsNeznk0CHwugGPePhZFKOV+dvXMjZYTNkoawcb8YmQ/l7Yu0LHslcaB80auq+xXZ0mWqlyn/moZNWidEQFT2tpof7zkDOtAYiwnk8yFKFq7BdH4QFnxKzkXMfJwgFm2xzhFmniJIuq69b2J56oFUviOqW9N9uGIcY99e5NOpOis3d0pedKrAr+7ahahg+nhsIXcWEelvlXA4EKIjgoWRg9CxIdYvhfch0o8/dWihQGY5tLlLUCTDOyUZDo8Qk+Cg2oOuTO1Vt4vwA4GxAno5oB40J4CWe5hmJSAqGvjKTXxU9YxN/1yzXSaDt9C0yU78XJFo3dCAaHJYz2j1IZMnxbcsG/S/KMNRZ3X+c5LojEBFhaLh5lA/1syoSCQtIgHnUgMgUFRhqedyU7VY+oVJK7GD4uWi749EGxyuVajIdg/0Fh/VQCCDKTqBS31+DOEcrHaUpaxcQFUruaNXaCjmWsqEGh0rP5ohWClNKDSnnFr4KDsCA5B5xLJ6T9cCUwxr6VO9FmCGpXd5Kw9zhPyOKN9P3NiRi51jydkzXZJDU9Z+ugDODfhiinbmQBhIphy1hxi5VvPn7aXPunuDAxPDA9Vc8P5Q2Yb/YPx72pD4/W3d8vXa4brROHTq+6R1+NUy0Ugr1awRM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199015)(83380400001)(2616005)(6512007)(26005)(186003)(53546011)(6506007)(6666004)(86362001)(36756003)(31696002)(38100700002)(41300700001)(4326008)(8676002)(5660300002)(2906002)(30864003)(8936002)(31686004)(316002)(66556008)(478600001)(6486002)(110136005)(66946007)(54906003)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmZYMHZhOFc2eXlyVW1mWjRhcW9wVTdPZUtZNENNbkNyOXVCM2U3dHZ2REh2?=
 =?utf-8?B?cVpEd1RmYTd3VCsxSHdGSzFvQW9XNGw3NmJaN3BTNmFFYVBLZDJwZ290eTd0?=
 =?utf-8?B?eVRxeVl2SzlPdmVFNy84bXgzYmRiRVdGWGJ0Um9hK3IyV25lTG1OZVFEcVVs?=
 =?utf-8?B?TjNuSTZpU2twV09YUGl3aHNoS1RzNDlMRzVWdm9ZVEZveUZtbzFPSGZ0R2JX?=
 =?utf-8?B?SDJTT1Uxc21EQU4vWCtZN1N4ek5FSDZZMDhmUU5wNXArSjBxbzVEWXNhV0U4?=
 =?utf-8?B?UDg0dVpYWi9ZTXRWelppb2J2WXF6Nmk0YmsxTzJ1am53MlVXcmk2c3VVRDlH?=
 =?utf-8?B?YmF1SkxDNDRVcmRJNkhXOGFBTnVKSW9pTG1pRmZETnBOZVNhR1loS2dma1NL?=
 =?utf-8?B?dkY0MFo4RG9MNlhjRXVyN2xQdUVnTjBhd2Mvd09UU0R6bUdZMFJKc01pVWU0?=
 =?utf-8?B?Zkg4eEg3TURXb2lrc2pPTDRrNmFXZE0vWlpHaXlkaDZ4M2RaSFdxNzhQWUQ5?=
 =?utf-8?B?dmF0c2NnZFp3aTMrWWlIVm1LNEJMVk81R1JuMktGYnJ4QndpZER1T29sSlRo?=
 =?utf-8?B?QXp5WWdXMDJGVkQ3T29xMDhRdERMZzlIdDREQzI4ZUxkc0lJVHVjMmhnWU9I?=
 =?utf-8?B?c09wd3I0R3ozNXEyR01MZE9DTy9ra20zcFQ2SzVHWkZwald0NGFXZnBZZnha?=
 =?utf-8?B?K3F0R1FRQW5Ba2pXQURqdWFQMXY1K1JVTzg4aWxLdXVRUDAzU0NhWWtDeldw?=
 =?utf-8?B?Ty9mb2tuOUVISEVPSUJ3THdEUk9XVXRETXVQekRkVHpIdFFucklpbHhXNHY1?=
 =?utf-8?B?clNJcHRjN3dTbVNqeFY5c1lPanZUWlNjQW5QZ09KNVFaR2tWYnJnZTJiSCtB?=
 =?utf-8?B?VWNRYUl2Z2dlT2pocFh5c3IxOVhWVnV3ckJpLzU3OWw1elJjbGx5cGFZV2lu?=
 =?utf-8?B?ckdvYk1LenkzQzBmK1owVDhneTNNdkgzMXZ2S2dwd20vcTJTWVEwL3NDeXMx?=
 =?utf-8?B?Wm1Cd3VOR05wRlF5MHZ2a2pCQXI5d1BNWjBaNFcrd2Y5RnJVRTg4OFpEYlo0?=
 =?utf-8?B?VHlaS3gveWp5QVZ5RURLcGlkQ0NXUmU0eG15R2Ywbkg2aWV6N2g5RVdaMjlu?=
 =?utf-8?B?MjZlaWxLUFlkNkpSK2V1ZWFLMU9sTjc1anpMbE1maWs4MVBpZ01UM1FSU2xl?=
 =?utf-8?B?bU1wbmpxZzlXdk5PeFNia1MxeUNKbmtsRldXdVNQWENkQzdFcmh6TlN4TW82?=
 =?utf-8?B?MWo4R0NnZWxNNGlycXd1UG8vOWw4SGVBVHRHNG9ySURHd3A5Y1FPaE9UcjRQ?=
 =?utf-8?B?b09yamJwNXNKSlNrczFrZlZnRkdISENRTnlaWG1JeUIzSlYrTDdkMXBQeEg3?=
 =?utf-8?B?U0pRQXc4UHcyVzRtcjNRY3l3SWpJSkZoY3czN09mZWhDZXR2RktjbkNVQzJk?=
 =?utf-8?B?K3c1M2gyVmdRVFJ2dnVNQi90MHJ0VjkwQzhucis3VlpCdks0OGY1eGEwS2pB?=
 =?utf-8?B?MDE1NFA0U0ViWDhzeXd0bEpsSHNPalpIR1FnRTFCWWhsS1lCZW1oSm9xd1Mv?=
 =?utf-8?B?d3p4WGRINVRUM3RabmZPZHpBdDJKQUJuWDJhd2Q1NGJpdjRWaVBlZVRabFB5?=
 =?utf-8?B?VGZxeGNjN3Z3QmxZbDhSem9MVGtob2dPNzFYazRHTXZPNjBCdE41ZDYyVUd2?=
 =?utf-8?B?Y1VVOWxIWmU5cEJRSWErNW9KWExVM09mc1F1amVqczM0K1ovb2M3N3ZjZ0xB?=
 =?utf-8?B?ckdCcTQxSnRTSlp2cDJSaXlDdjgyak9QUmZxVEhZV2x4UXBXM1dkRzFMMXVj?=
 =?utf-8?B?OWVTRldpMXJlamlvMDV0L011VlB4QnUzSDQrTllaTWpmdGJlREdSOEd5QVVG?=
 =?utf-8?B?eUFTL0ZvUkhvaUM0NW9QWGpBK3Fmb2M1a0NFYmx6STkxU2E5dGJmVGRzZHN4?=
 =?utf-8?B?dEdQTlJTbE5iL2ZXU0cxOHA0RXY1VnVqYjNNY1pSQVA5UitueVVWRytJeDho?=
 =?utf-8?B?NVFSNnpEVWRyd0xCaXZRQUVwODN5RThnNDZadUN5VmwrYS9xMnF6aU84dFY5?=
 =?utf-8?B?SW5MMkZPY1lmcEluT3hRL1lFZjFXbWUraEFsZVk5SVJpbFE1YmJXYUpkRjUw?=
 =?utf-8?Q?X+fb0wm4RHOwAIyf+dOWvwt7M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b1bdb8-2e62-4ebf-fcc9-08daef1fec2c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 13:22:41.4085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUfqijTRTw4FaZ9O1O5bjA3tpZ2ip9xdZxNVIFNzODN9xGEQWQgl6Sxbrq8UBlgS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8161
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/5/2023 9:12 AM, Mario Limonciello wrote:
> Several IP versions duplicate code and can't use the common helpers.
> Move this code into a single function so that the helpers can be used.
> 
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v5->v6:
>   * Rebase on earlier patches
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 120 ++++++++++++++++++------
>   drivers/gpu/drm/amd/amdgpu/psp_v10_0.c  |  64 +------------
>   drivers/gpu/drm/amd/amdgpu/psp_v11_0.c  |  77 ++-------------
>   drivers/gpu/drm/amd/amdgpu/psp_v12_0.c  |  62 +-----------
>   4 files changed, 109 insertions(+), 214 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> index 7a2fc920739b..d971e3785eaf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -3272,41 +3272,75 @@ static int parse_ta_bin_descriptor(struct psp_context *psp,
>   	return 0;
>   }
>   
> -int psp_init_ta_microcode(struct psp_context *psp,
> -			  const char *chip_name)
> +static int parse_ta_v1_microcode(struct psp_context *psp)
>   {
> +	const struct ta_firmware_header_v1_0 *ta_hdr;
>   	struct amdgpu_device *adev = psp->adev;
> -	char fw_name[PSP_FW_NAME_LEN];
> -	const struct ta_firmware_header_v2_0 *ta_hdr;
> -	int err = 0;
> -	int ta_index = 0;
>   
> -	if (!chip_name) {
> -		dev_err(adev->dev, "invalid chip name for ta microcode\n");
> +	ta_hdr = (const struct ta_firmware_header_v1_0 *)
> +			 adev->psp.ta_fw->data;
> +
> +	if (le16_to_cpu(ta_hdr->header.header_version_major) != 1)
>   		return -EINVAL;
> +
> +	adev->psp.xgmi_context.context.bin_desc.fw_version =
> +		le32_to_cpu(ta_hdr->xgmi.fw_version);
> +	adev->psp.xgmi_context.context.bin_desc.size_bytes =
> +		le32_to_cpu(ta_hdr->xgmi.size_bytes);
> +	adev->psp.xgmi_context.context.bin_desc.start_addr =
> +		(uint8_t *)ta_hdr +
> +		le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
> +	adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
> +	adev->psp.ras_context.context.bin_desc.fw_version =
> +		le32_to_cpu(ta_hdr->ras.fw_version);
> +	adev->psp.ras_context.context.bin_desc.size_bytes =
> +		le32_to_cpu(ta_hdr->ras.size_bytes);
> +	adev->psp.ras_context.context.bin_desc.start_addr =
> +		(uint8_t *)adev->psp.xgmi_context.context.bin_desc.start_addr +
> +		le32_to_cpu(ta_hdr->ras.offset_bytes);
> +	adev->psp.hdcp_context.context.bin_desc.fw_version =
> +		le32_to_cpu(ta_hdr->hdcp.fw_version);
> +	adev->psp.hdcp_context.context.bin_desc.size_bytes =
> +		le32_to_cpu(ta_hdr->hdcp.size_bytes);
> +	adev->psp.hdcp_context.context.bin_desc.start_addr =
> +		(uint8_t *)ta_hdr +
> +		le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
> +	adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
> +	adev->psp.dtm_context.context.bin_desc.fw_version =
> +		le32_to_cpu(ta_hdr->dtm.fw_version);
> +	adev->psp.dtm_context.context.bin_desc.size_bytes =
> +		le32_to_cpu(ta_hdr->dtm.size_bytes);
> +	adev->psp.dtm_context.context.bin_desc.start_addr =
> +		(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
> +		le32_to_cpu(ta_hdr->dtm.offset_bytes);
> +	if (adev->apu_flags & AMD_APU_IS_RENOIR) {
> +		adev->psp.securedisplay_context.context.bin_desc.fw_version =
> +			le32_to_cpu(ta_hdr->securedisplay.fw_version);
> +		adev->psp.securedisplay_context.context.bin_desc.size_bytes =
> +			le32_to_cpu(ta_hdr->securedisplay.size_bytes);
> +		adev->psp.securedisplay_context.context.bin_desc.start_addr =
> +			(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
> +			le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
>   	}

psp_v10_0_init_microcode used to get securedisplay_context 
unconditionally and now this is restricted to RENOIR following the logic 
in psp v12. Better is to fetch all FW details unconditionally and make 
the size_bytes to 0 (just to be sure) in specific PSP versions to 
prevent their load.

Thanks,
Lijo

>   
> -	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
> -	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
> -	if (err)
> -		goto out;
> +	return 0;
> +}
>   
> -	err = amdgpu_ucode_validate(adev->psp.ta_fw);
> -	if (err)
> -		goto out;
> +static int parse_ta_v2_microcode(struct psp_context *psp)
> +{
> +	const struct ta_firmware_header_v2_0 *ta_hdr;
> +	struct amdgpu_device *adev = psp->adev;
> +	int err = 0;
> +	int ta_index = 0;
>   
>   	ta_hdr = (const struct ta_firmware_header_v2_0 *)adev->psp.ta_fw->data;
>   
> -	if (le16_to_cpu(ta_hdr->header.header_version_major) != 2) {
> -		dev_err(adev->dev, "unsupported TA header version\n");
> -		err = -EINVAL;
> -		goto out;
> -	}
> +	if (le16_to_cpu(ta_hdr->header.header_version_major) != 2)
> +		return -EINVAL;
>   
>   	if (le32_to_cpu(ta_hdr->ta_fw_bin_count) >= UCODE_MAX_PSP_PACKAGING) {
>   		dev_err(adev->dev, "packed TA count exceeds maximum limit\n");
> -		err = -EINVAL;
> -		goto out;
> +		return -EINVAL;
>   	}
>   
>   	for (ta_index = 0; ta_index < le32_to_cpu(ta_hdr->ta_fw_bin_count); ta_index++) {
> @@ -3314,14 +3348,46 @@ int psp_init_ta_microcode(struct psp_context *psp,
>   					      &ta_hdr->ta_fw_bin[ta_index],
>   					      ta_hdr);
>   		if (err)
> -			goto out;
> +			return err;
>   	}
>   
>   	return 0;
> -out:
> -	dev_err(adev->dev, "fail to initialize ta microcode\n");
> -	release_firmware(adev->psp.ta_fw);
> -	adev->psp.ta_fw = NULL;
> +}
> +
> +int psp_init_ta_microcode(struct psp_context *psp, const char *chip_name)
> +{
> +	const struct common_firmware_header *hdr;
> +	struct amdgpu_device *adev = psp->adev;
> +	char fw_name[PSP_FW_NAME_LEN];
> +	int err;
> +
> +	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
> +	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
> +	if (err)
> +		return err;
> +	err = amdgpu_ucode_validate(adev->psp.ta_fw);
> +	if (err)
> +		return err;
> +
> +	hdr = (const struct common_firmware_header *)adev->psp.ta_fw->data;
> +	switch (le16_to_cpu(hdr->header_version_major)) {
> +	case 1:
> +		err = parse_ta_v1_microcode(psp);
> +		break;
> +	case 2:
> +		err = parse_ta_v2_microcode(psp);
> +		break;
> +	default:
> +		dev_err(adev->dev, "unsupported TA header version\n");
> +		err = -EINVAL;
> +	}
> +
> +	if (err) {
> +		dev_err(adev->dev, "fail to initialize ta microcode\n");
> +		release_firmware(adev->psp.ta_fw);
> +		adev->psp.ta_fw = NULL;
> +	}
> +
>   	return err;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
> index 9de46fa8f46c..f14fcfb9c425 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
> @@ -48,9 +48,8 @@ static int psp_v10_0_init_microcode(struct psp_context *psp)
>   {
>   	struct amdgpu_device *adev = psp->adev;
>   	const char *chip_name;
> -	char fw_name[30];
> +	char ucode_prefix[30];
>   	int err = 0;
> -	const struct ta_firmware_header_v1_0 *ta_hdr;
>   	DRM_DEBUG("\n");
>   
>   	switch (adev->asic_type) {
> @@ -64,66 +63,13 @@ static int psp_v10_0_init_microcode(struct psp_context *psp)
>   		break;
>   	default: BUG();
>   	}
> +	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
>   
> -	err = psp_init_asd_microcode(psp, chip_name);
> +	err = psp_init_asd_microcode(psp, ucode_prefix);
>   	if (err)
> -		goto out;
> -
> -	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
> -	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
> -	if (err) {
> -		release_firmware(adev->psp.ta_fw);
> -		adev->psp.ta_fw = NULL;
> -		dev_info(adev->dev,
> -			 "psp v10.0: Failed to load firmware \"%s\"\n",
> -			 fw_name);
> -	} else {
> -		err = amdgpu_ucode_validate(adev->psp.ta_fw);
> -		if (err)
> -			goto out2;
> -
> -		ta_hdr = (const struct ta_firmware_header_v1_0 *)
> -				 adev->psp.ta_fw->data;
> -		adev->psp.hdcp_context.context.bin_desc.fw_version =
> -			le32_to_cpu(ta_hdr->hdcp.fw_version);
> -		adev->psp.hdcp_context.context.bin_desc.size_bytes =
> -			le32_to_cpu(ta_hdr->hdcp.size_bytes);
> -		adev->psp.hdcp_context.context.bin_desc.start_addr =
> -			(uint8_t *)ta_hdr +
> -			le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
> -
> -		adev->psp.dtm_context.context.bin_desc.fw_version =
> -			le32_to_cpu(ta_hdr->dtm.fw_version);
> -		adev->psp.dtm_context.context.bin_desc.size_bytes =
> -			le32_to_cpu(ta_hdr->dtm.size_bytes);
> -		adev->psp.dtm_context.context.bin_desc.start_addr =
> -			(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
> -			le32_to_cpu(ta_hdr->dtm.offset_bytes);
> -
> -		adev->psp.securedisplay_context.context.bin_desc.fw_version =
> -			le32_to_cpu(ta_hdr->securedisplay.fw_version);
> -		adev->psp.securedisplay_context.context.bin_desc.size_bytes =
> -			le32_to_cpu(ta_hdr->securedisplay.size_bytes);
> -		adev->psp.securedisplay_context.context.bin_desc.start_addr =
> -			(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
> -			le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
> -
> -		adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
> -	}
> -
> -	return 0;
> -
> -out2:
> -	release_firmware(adev->psp.ta_fw);
> -	adev->psp.ta_fw = NULL;
> -out:
> -	if (err) {
> -		dev_err(adev->dev,
> -			"psp v10.0: Failed to load firmware \"%s\"\n",
> -			fw_name);
> -	}
> +		return err;
>   
> -	return err;
> +	return psp_init_ta_microcode(psp, ucode_prefix);
>   }
>   
>   static int psp_v10_0_ring_create(struct psp_context *psp,
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> index bd3e3e23a939..21d20ca2377a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> @@ -89,9 +89,8 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
>   {
>   	struct amdgpu_device *adev = psp->adev;
>   	const char *chip_name;
> -	char fw_name[PSP_FW_NAME_LEN];
> +	char ucode_prefix[30];
>   	int err = 0;
> -	const struct ta_firmware_header_v1_0 *ta_hdr;
>   
>   	DRM_DEBUG("\n");
>   
> @@ -129,6 +128,7 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
>   	default:
>   		BUG();
>   	}
> +	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
>   
>   
>   	switch (adev->ip_versions[MP0_HWIP][0]) {
> @@ -140,35 +140,9 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
>   		err = psp_init_asd_microcode(psp, chip_name);
>   		if (err)
>   			return err;
> -		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
> -		err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
> -		if (err) {
> -			release_firmware(adev->psp.ta_fw);
> -			adev->psp.ta_fw = NULL;
> -			dev_info(adev->dev,
> -				 "psp v11.0: Failed to load firmware \"%s\"\n", fw_name);
> -		} else {
> -			err = amdgpu_ucode_validate(adev->psp.ta_fw);
> -			if (err)
> -				goto out2;
> -
> -			ta_hdr = (const struct ta_firmware_header_v1_0 *)adev->psp.ta_fw->data;
> -			adev->psp.xgmi_context.context.bin_desc.fw_version =
> -				le32_to_cpu(ta_hdr->xgmi.fw_version);
> -			adev->psp.xgmi_context.context.bin_desc.size_bytes =
> -				le32_to_cpu(ta_hdr->xgmi.size_bytes);
> -			adev->psp.xgmi_context.context.bin_desc.start_addr =
> -				(uint8_t *)ta_hdr +
> -				le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
> -			adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
> -			adev->psp.ras_context.context.bin_desc.fw_version =
> -				le32_to_cpu(ta_hdr->ras.fw_version);
> -			adev->psp.ras_context.context.bin_desc.size_bytes =
> -				le32_to_cpu(ta_hdr->ras.size_bytes);
> -			adev->psp.ras_context.context.bin_desc.start_addr =
> -				(uint8_t *)adev->psp.xgmi_context.context.bin_desc.start_addr +
> -				le32_to_cpu(ta_hdr->ras.offset_bytes);
> -		}
> +		err = psp_init_ta_microcode(psp, ucode_prefix);
> +		if (err)
> +			return err;
>   		break;
>   	case IP_VERSION(11, 0, 0):
>   	case IP_VERSION(11, 0, 5):
> @@ -179,39 +153,9 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
>   		err = psp_init_asd_microcode(psp, chip_name);
>   		if (err)
>   			return err;
> -		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
> -		err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
> -		if (err) {
> -			release_firmware(adev->psp.ta_fw);
> -			adev->psp.ta_fw = NULL;
> -			dev_info(adev->dev,
> -				 "psp v11.0: Failed to load firmware \"%s\"\n", fw_name);
> -		} else {
> -			err = amdgpu_ucode_validate(adev->psp.ta_fw);
> -			if (err)
> -				goto out2;
> -
> -			ta_hdr = (const struct ta_firmware_header_v1_0 *)adev->psp.ta_fw->data;
> -			adev->psp.hdcp_context.context.bin_desc.fw_version =
> -				le32_to_cpu(ta_hdr->hdcp.fw_version);
> -			adev->psp.hdcp_context.context.bin_desc.size_bytes =
> -				le32_to_cpu(ta_hdr->hdcp.size_bytes);
> -			adev->psp.hdcp_context.context.bin_desc.start_addr =
> -				(uint8_t *)ta_hdr +
> -				le32_to_cpu(
> -					ta_hdr->header.ucode_array_offset_bytes);
> -
> -			adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
> -
> -			adev->psp.dtm_context.context.bin_desc.fw_version =
> -				le32_to_cpu(ta_hdr->dtm.fw_version);
> -			adev->psp.dtm_context.context.bin_desc.size_bytes =
> -				le32_to_cpu(ta_hdr->dtm.size_bytes);
> -			adev->psp.dtm_context.context.bin_desc.start_addr =
> -				(uint8_t *)adev->psp.hdcp_context.context
> -					.bin_desc.start_addr +
> -				le32_to_cpu(ta_hdr->dtm.offset_bytes);
> -		}
> +		err = psp_init_ta_microcode(psp, ucode_prefix);
> +		if (err)
> +			return err;
>   		break;
>   	case IP_VERSION(11, 0, 7):
>   	case IP_VERSION(11, 0, 11):
> @@ -237,11 +181,6 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
>   	}
>   
>   	return 0;
> -
> -out2:
> -	release_firmware(adev->psp.ta_fw);
> -	adev->psp.ta_fw = NULL;
> -	return err;
>   }
>   
>   static int psp_v11_0_wait_for_bootloader(struct psp_context *psp)
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> index 8ed2281b6557..634fa2822d8a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> @@ -49,9 +49,8 @@ static int psp_v12_0_init_microcode(struct psp_context *psp)
>   {
>   	struct amdgpu_device *adev = psp->adev;
>   	const char *chip_name;
> -	char fw_name[30];
> +	char ucode_prefix[30];
>   	int err = 0;
> -	const struct ta_firmware_header_v1_0 *ta_hdr;
>   	DRM_DEBUG("\n");
>   
>   	switch (adev->asic_type) {
> @@ -64,67 +63,12 @@ static int psp_v12_0_init_microcode(struct psp_context *psp)
>   	default:
>   		BUG();
>   	}
> +	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
>   
>   	err = psp_init_asd_microcode(psp, chip_name);
>   	if (err)
>   		return err;
> -
> -	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
> -	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
> -	if (err) {
> -		release_firmware(adev->psp.ta_fw);
> -		adev->psp.ta_fw = NULL;
> -		dev_info(adev->dev,
> -			 "psp v12.0: Failed to load firmware \"%s\"\n",
> -			 fw_name);
> -	} else {
> -		err = amdgpu_ucode_validate(adev->psp.ta_fw);
> -		if (err)
> -			goto out;
> -
> -		ta_hdr = (const struct ta_firmware_header_v1_0 *)
> -				 adev->psp.ta_fw->data;
> -		adev->psp.hdcp_context.context.bin_desc.fw_version =
> -			le32_to_cpu(ta_hdr->hdcp.fw_version);
> -		adev->psp.hdcp_context.context.bin_desc.size_bytes =
> -			le32_to_cpu(ta_hdr->hdcp.size_bytes);
> -		adev->psp.hdcp_context.context.bin_desc.start_addr =
> -			(uint8_t *)ta_hdr +
> -			le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
> -
> -		adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
> -
> -		adev->psp.dtm_context.context.bin_desc.fw_version =
> -			le32_to_cpu(ta_hdr->dtm.fw_version);
> -		adev->psp.dtm_context.context.bin_desc.size_bytes =
> -			le32_to_cpu(ta_hdr->dtm.size_bytes);
> -		adev->psp.dtm_context.context.bin_desc.start_addr =
> -			(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
> -			le32_to_cpu(ta_hdr->dtm.offset_bytes);
> -
> -		if (adev->apu_flags & AMD_APU_IS_RENOIR) {
> -			adev->psp.securedisplay_context.context.bin_desc.fw_version =
> -				le32_to_cpu(ta_hdr->securedisplay.fw_version);
> -			adev->psp.securedisplay_context.context.bin_desc.size_bytes =
> -				le32_to_cpu(ta_hdr->securedisplay.size_bytes);
> -			adev->psp.securedisplay_context.context.bin_desc.start_addr =
> -				(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
> -				le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
> -		}
> -	}
> -
> -	return 0;
> -
> -out:
> -	release_firmware(adev->psp.ta_fw);
> -	adev->psp.ta_fw = NULL;
> -	if (err) {
> -		dev_err(adev->dev,
> -			"psp v12.0: Failed to load firmware \"%s\"\n",
> -			fw_name);
> -	}
> -
> -	return err;
> +	return psp_init_ta_microcode(psp, ucode_prefix);
>   }
>   
>   static int psp_v12_0_bootloader_load_sysdrv(struct psp_context *psp)
