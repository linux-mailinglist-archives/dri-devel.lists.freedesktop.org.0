Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E539FC2E202
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 22:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72C410E499;
	Mon,  3 Nov 2025 21:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S4i56aP/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010067.outbound.protection.outlook.com [52.101.46.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D95110E492
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 21:17:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxtFfKGJVIY47t4bsku/mYQkNguDVpJ9/qd0ITkx8m6OF6R2jZw3MuSutoChuRteLcqy9ItaROHkFQqma4sx/MVgeVez3mVsk8W6WGyPxmPGzNDrYRJYrQ7Dda63l499r9BS15lDEUTgLShP7lUWni2FqqmchEdfRZh5J84tRRRhEsF0y+ok/oraBaJjibYMJURXJ0Ii1/TXJ1M2o7T+Ott+s4TOT20beYyhXM8NVVOJwAiMq7CZcGdpBFsuhw15VM2+5He1dEpVtxgEq1KmXjbtKz0W84iRl5QYqzALLsHxK3ncLT7xTNOQACBKjlDryjuHR+4f9CNHO86sBC4hiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O156l6fangAe/Pc/7bUtJEjTmIL0h4W4UtWPU9b2PvY=;
 b=M0NFbJmnitNqA+ab1B11PH4p7uXU/Fcm8OJhPJsTbH8MotVYcY5UnQoIbocYTLkWhzaFx5humputHbr1lgwwtgLNLXw+OWfweYBhnBdZtqE9izZReaK1evIExCpPmvaXXIBNyPXp4BmcOvDmPQjEcCxWZy567v5YhcEVTXXI5yJX/YkoeVDB5DSfzs03NMNvGMW2qhUwjuN+Su8KTu0Byms2JNViUIk97cs0MhVNnCNzynUjbeARUs2k4/tw/2xt7Uz5vyU//q9cBj/4p0YJQolypj3/hHyaE5RQPEylD8ehfNPw9cuR127OzvPzAKjxw/uilq72dPpYRQ4Wr3UqZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O156l6fangAe/Pc/7bUtJEjTmIL0h4W4UtWPU9b2PvY=;
 b=S4i56aP/FGzbfMDod/yYZGRla/4uVSTn+yIupP6brJ1kfgBY/oqVYzlcvxI4e2KeUEaF7L5MHH7fEUVfwUvKUFO0ixweWZQe37diEknTkVhW2gIMTZvmCFGMfuo3G0LPSnm8Paw8n0F5ZIb03vI4Q7MjdZqPnZutiwbYUFCgNBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 21:17:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 21:17:02 +0000
Message-ID: <a17dbc38-d35b-4782-a488-a5f2d7e26b99@amd.com>
Date: Mon, 3 Nov 2025 15:17:00 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Add IOCTL parameters for resource and
 telemetry data
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251028175817.2329738-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251028175817.2329738-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0162.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::13) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: daf9ad60-7b43-4854-cdb0-08de1b1e5521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0hNWmloaWtzY1VNMDM0MzQ1UStUWUVtOWxSK1Flc3p1bVl2c2lpeFF2RVZm?=
 =?utf-8?B?WmNOUDZXZkJZRnpCUTV6aHVESXpMVGhVRkZ5cWtIRFRlS2pTZ25JaFlSVTE1?=
 =?utf-8?B?MWNLQ2pNcGREdW9tQVprSDZFeEhUS0NhRklmQ1NzZENJYWI5amd1Yk1aUGxt?=
 =?utf-8?B?K1ovb21yY0hwUVJJR3k3dEUyY25hTlRyVmxVU1VQV0drWU5KOTMyeXpNNFZj?=
 =?utf-8?B?T0V2b3ZYWG5BQURmUGtQQktveXV0MUxpTE1SVHlTbWtuQVdRY1NnWE5HUXFa?=
 =?utf-8?B?eDlxY090VWRlYVo1dUFPREF1b2dPZEhxcXBqWjNGL2wrd3pIbGFRLzBXRlZq?=
 =?utf-8?B?VkVyMXJIRVdrb01PQWszUndMejJFdXpncEQ1dCtoenc0QllkVjRJSGgweUho?=
 =?utf-8?B?b3hZVjdSQXJTMk9iQmxJSThmeENzVGJ4T01GTlZQNVlubzYxVU56MW5yaHZ6?=
 =?utf-8?B?YkRCem4zRHVyUFpQMUtwM0xhcGdtMlk3ckpLNGlJQW1KUzVZOWVuUmYxRUhz?=
 =?utf-8?B?M0FBQkhxSDc4d0d6bkYrSHd0RUhlL00wRjY3VFV1cUcwenlCY1lEVUc4T0dn?=
 =?utf-8?B?b0xLcm4reWF5bnBpN3FmRUFaUWpkTGRZZEsxbHFXS1crOFZyQ3dmYnowZkxY?=
 =?utf-8?B?VWlNRnRyNzdMeVUzN01CNDBLUWRGdDVCMStrTlhKU3E2RWlWR3NVelBLeFNv?=
 =?utf-8?B?T1lYSlJRbFJyZmdjcTFhN2Q2dWJVS1dUVWZLcGlpalBZTmdvWkZQS2RJdGRi?=
 =?utf-8?B?QVFzbFlUcFNHd05rUC85c3JJdWJPSmd0Y3lkbXV4bDI1dnF2WWtwVnNObWNT?=
 =?utf-8?B?MmZHeGo4aCtsMEhrY3N6TU13eDVtL2VkRkhrSm9lUnRkOU1nNVlmRmtzZ1Iv?=
 =?utf-8?B?M3YvSDNaNkY4UzE4cmRmNW1EeWlCS0o5Rmh5V2hmT3E0UDhkd3dsdk94cjlZ?=
 =?utf-8?B?Y203cUhwK1BmNjRPQjlMT3JKY3l6a3VFZFlhSTJUWFh6L1piTXB2THdNR1Mz?=
 =?utf-8?B?aEZtZTJLWGQ5QzlkWFlpMGk4clpjVHBYZmZuSEUySm5OdUpNRFNpdGtTc0Fq?=
 =?utf-8?B?RmVJZ2NWMHVzbEU5c09Uam0wa0VPYjB1V2ZWTjdDQUNGeWVTZERIVU1BcWc0?=
 =?utf-8?B?V3hiWHVaVUhUbWZNd2xUQkkrWWhGTlZ0UTBNZWd5anl1Rml4SjByZ21pOTNQ?=
 =?utf-8?B?Wk5XS3pndytJUGZaS0Q0U2dGK3FvMXQwMFkrNm1MWndNQ0ZwNVdQdWZaMzJr?=
 =?utf-8?B?SzNhUGh4ZVZ5SjF6bW44RDdHZ1Q1R3RUSWhPWkNXUU43M0dyK0FFYVlnay9m?=
 =?utf-8?B?ZWR5dlliOUxaN05PekdUdUZ6UUhxLysxVmozaHFpNHpMaDlpOTczUTRjOUdE?=
 =?utf-8?B?dVJjU2Y3cDR2cGJ4L2FiUFpNOUNNdkV2UzVNRmNEREhkeVFsOTAzM01OTjFl?=
 =?utf-8?B?SG9tNFpIbjZOV2Z6U3V3cXhDRVdZQnE1eGdKd3FsY290djBUWk1DQXlvZFVZ?=
 =?utf-8?B?c085U1dMSWxiczRES1ZJT2lRc1E2V0w1MVpYWWg4c3Z5QmRTN2ppbERhVUQy?=
 =?utf-8?B?elNoQ2xHVUhWUUNtaG9IRUlhQkF0SzB4TWZhOXIxaWg3N0oyMER0TGZzeUt3?=
 =?utf-8?B?Qjh2V2NYTXZoNWxVWHB2WFczT0g1ZWdxN1RhM0hvRnR6RWE0UnQ2ZGl3bGR3?=
 =?utf-8?B?L2Q1NFc2cWc1ZTBza2d3WU91RXlHVVk3RXFMN0ZETWlnbWFIUEcxMHQ1dW1V?=
 =?utf-8?B?cU5sNmFFaTJ5UDVkOTMzYmkzbmI4WUZzZWdvdFRvR050TXpsUEZRN1U5cndZ?=
 =?utf-8?B?YXJ0TkV1NEYxSlFDN3NYcFlnWG1UUlVQeVJPK2hUYzJpN2xDb0RKL1ZnM0Zt?=
 =?utf-8?B?bDFZVHZDN1o2NlpDS2JzbjhlZXRHZDQ0Wmd3THpxbjFWQjJTQjJtY0hQRWZT?=
 =?utf-8?Q?++ZPKFqESBSW76PGWYGMojECgB6k1dXJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWFhVFZONFdobXg2MWJ3ZnYzQTIxbC9qZWhORUxiTUNyYTNzeFRic0JxTU5K?=
 =?utf-8?B?Sk1XTnkwWjBMRlZoNkRoZmpMU0d0dEd5L1NWSE5VZEdYUVNYaG5paXFoT0kx?=
 =?utf-8?B?eEwyZWl6cmRmTWFnTGEwSVFIRS9VZ2tuWHN2b3ZmM2lNakNJZVZwMytRV1lY?=
 =?utf-8?B?T3kzOFBpcWpLL1Q4dXBPNUdMd2RiYVVQZHAraTNCbmFKcUswM2N0cmdmd3lm?=
 =?utf-8?B?ZWlSZlpZVjg2eUxvQ0NPNHhvd1BaVjcrUjVqOGhuTWRzQmduSVFqRnBpYzF5?=
 =?utf-8?B?Y1hhMm9seFI3OWF4VDAyeWd1aHhIVkpCOVQ2MmFDZm9rNFpIV20rcHdpYTM1?=
 =?utf-8?B?L1FvZDVrbGIxamlpMzRJa0ZFMzd2OVRxZ0J1SGdGM1Q3ZHZpOFZlS1JwNE4v?=
 =?utf-8?B?dStUUXhxTnVsMnhnZ0dkVnhzYjhNYVIzM2VlNGdjYlE2VVFSZ2dXZGdPQkVl?=
 =?utf-8?B?Nzd1K0NaSVpuem0vdkJUc0ZZdW96VkkvT0R5Vmh5NzRCQUxBVDNpcFIrK1o2?=
 =?utf-8?B?TE5JWmE3Nlk2SVlzSzFFVHBEUXZFNkhKWERvN2w5a05ZSktmcDcyS3RZOTlv?=
 =?utf-8?B?cUlPVzdTWGpWWVZRcG1YL3pCUzlvZnJrYkp3cVEwS2FRSFEwdDdsaGJFNkgy?=
 =?utf-8?B?ZVprWlhVRkw1bitTTEwwK3A4UTFTQjNvdno3Z0Zwb2tQeE5HTmhvTFhvN0xl?=
 =?utf-8?B?Q3hwV29sTjVaUVRXYjZNZHR6b25vYmM0aFRlQ2NONVNySDV1NlF3NW42OWNv?=
 =?utf-8?B?eitLWWMyRDFZTSthT1RUSHNnK1NBMm4vOWhYeEtHVTRPME13bWVGK0grVDVr?=
 =?utf-8?B?YWFSdnFLVlFEVkV5eDJ6TlVNQ0ROWkpkZ1hhdEl4UVRSM1NoSjBaUHRkcER0?=
 =?utf-8?B?TEJRVWlNTEd5OUhQcUxHelJKeFlnekh5U2dFV1RlU2FLejg2UUdSclQ0MDg3?=
 =?utf-8?B?cHJYOU9vc1MwVk1DSEtEMEx2VFFzaVdRMG10L0xhTjJsdWtpVnpncEkxc3Uy?=
 =?utf-8?B?SkVNVml3TytYZ21TQ2daWkxCdkl1VnlHUlhSOG5ueGlVeTZQR1lEa3dKNFhI?=
 =?utf-8?B?TjB4bDBuNitLUlNqTTY5MzNhbmpKVVIvYTB6elNTS0t5VE5SaVJsNFNwQkJZ?=
 =?utf-8?B?MkZQQ2VuQ3BpZUl4cWdtb0RxRjNqVkpSTEVKczVHZ1VyV082SVZrS3hzRkQ5?=
 =?utf-8?B?UWlPZ1crTVlMOGN2emJUNkdPZDVpRXlBUEpQTzdlZ2JJYUVUSTJ5M2pESlpG?=
 =?utf-8?B?NFY4c0Zra0hLbzh0cnRyNzJ4UGtYczQ4WXhPNmFyN3lLVXI3VDhsdkRIY1Nk?=
 =?utf-8?B?dzlud2taUS91SHhMMDI1czhpczFxNkR3d0tsenpJaFV1b3lGbTJ2b3QwQmRP?=
 =?utf-8?B?M1JmV3I1TklQKy9xdzExb2tSMVBpRkd0OTFhUi9ZR0RFUnlDOG56VklHV09F?=
 =?utf-8?B?ZE4vNDc5TmdWZjhBNWpYTlRlQ2hsOVYxZmExZGJsbWtvUVlZOS9vZVNQYUFu?=
 =?utf-8?B?b21WZEg3Vk40WHI5UllSTTBoakdnKzl6VFFsQ01FT1RIN1o2Ym03eFdlN25D?=
 =?utf-8?B?WVFXQWJkTVMzbDJzMmJmK2VhM2x6Q0EwMnN0YWtlY0J3c2lsNFRXQVRmMldH?=
 =?utf-8?B?c3R2OW1NZE9NcW9ZSkErWEgrWkFyeDY1cnErY1NNNVlxQlRVbWV4RFM3WWRt?=
 =?utf-8?B?OHZNcUFtOEhZNUU0bmJWaURrSnFBcFp0RDVtSTJkRjFuSlVZQi92SUVXWmJD?=
 =?utf-8?B?QTlRemVFY1Z6UGdpblg4R3dIOWU1NXF4U0pmRE5oV0JjRHBBalJWM21qc212?=
 =?utf-8?B?VVFsUzhQc0VyQTVqVWZ4dXZhUEFVZFk3MG9XVWFmbXA5MlRqZE1NZUcyNFda?=
 =?utf-8?B?T0JOSkFWMzZ1OFY5cm5aTU5qUm5kS2kxWEh0V0x6WWxtenBoQ1JEL2JjaDJN?=
 =?utf-8?B?ZzQrNEhnWFFjK0dwM1dQMkl2T3lKN3BkUW45RmJMRHFyQWxhdFNzMFBvRHBJ?=
 =?utf-8?B?WFVxelQ0WEtVSVpGb2pZQ0FMbURwUDRHNXdpRjlOdzhWK2dncEpjcDZnQmpG?=
 =?utf-8?B?SlhrMVR6ZUlITnExa2ZqSFYrR2F2aDFtVE1PNUkwVzZrT1VDUnU0Z0tNaUNZ?=
 =?utf-8?Q?y9iW1f5M7rzj4tcFkdDQp8+lh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daf9ad60-7b43-4854-cdb0-08de1b1e5521
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 21:17:02.6986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8xfMzjEx0qAQa/WGE1CXexNVhO+sxETcyZAbvNRCTM4U3MX6D12A5CflWT7Azd2RbcZ0Gn0LYh7PATJUm46TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
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



On 10/28/2025 12:58 PM, Lizhi Hou wrote:
> Extend DRM_IOCTL_AMDXDNA_GET_INFO to include additional parameters
> that allow collection of resource and telemetry data.

Logically this feels like it should be split into at least two or more 
commits (Add query telemetry and add query resource info).

I could also see an argument for making it 3, and making the first one 
set hardware specific info like hwctx_limit and maybe max_tops/curr_tops 
for all devices.

> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c              |   6 --
>   drivers/accel/amdxdna/aie2_message.c          |  58 ++++++++--
>   drivers/accel/amdxdna/aie2_msg_priv.h         |  25 ++++-
>   drivers/accel/amdxdna/aie2_pci.c              | 100 ++++++++++++++++++
>   drivers/accel/amdxdna/aie2_pci.h              |   6 ++
>   drivers/accel/amdxdna/aie2_smu.c              |  11 ++
>   .../accel/amdxdna/amdxdna_mailbox_helper.h    |   6 +-
>   drivers/accel/amdxdna/amdxdna_pci_drv.c       |   3 +-
>   drivers/accel/amdxdna/npu1_regs.c             |   1 +
>   drivers/accel/amdxdna/npu2_regs.c             |   1 +
>   drivers/accel/amdxdna/npu4_regs.c             |   1 +
>   drivers/accel/amdxdna/npu5_regs.c             |   1 +
>   drivers/accel/amdxdna/npu6_regs.c             |   1 +
>   include/uapi/drm/amdxdna_accel.h              |  34 ++++++
>   14 files changed, 238 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 958a64bb5251..2b51c5211c2d 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -553,7 +553,6 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   	struct drm_gpu_scheduler *sched;
>   	struct amdxdna_hwctx_priv *priv;
>   	struct amdxdna_gem_obj *heap;
> -	struct amdxdna_dev_hdl *ndev;
>   	int i, ret;
>   
>   	priv = kzalloc(sizeof(*hwctx->priv), GFP_KERNEL);
> @@ -651,8 +650,6 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   	amdxdna_pm_suspend_put(xdna);
>   
>   	hwctx->status = HWCTX_STAT_INIT;
> -	ndev = xdna->dev_handle;
> -	ndev->hwctx_num++;
>   	init_waitqueue_head(&priv->job_free_wq);
>   
>   	XDNA_DBG(xdna, "hwctx %s init completed", hwctx->name);
> @@ -685,13 +682,10 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   
>   void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
>   {
> -	struct amdxdna_dev_hdl *ndev;
>   	struct amdxdna_dev *xdna;
>   	int idx;
>   
>   	xdna = hwctx->client->xdna;
> -	ndev = xdna->dev_handle;
> -	ndev->hwctx_num--;
>   
>   	XDNA_DBG(xdna, "%s sequence number %lld", hwctx->name, hwctx->priv->seq);
>   	drm_sched_entity_destroy(&hwctx->priv->entity);
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 0ec1dc6fe668..3a4c845d783a 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -45,7 +45,7 @@ static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
>   		ndev->mgmt_chann = NULL;
>   	}
>   
> -	if (!ret && *hdl->data != AIE2_STATUS_SUCCESS) {
> +	if (!ret && *hdl->status != AIE2_STATUS_SUCCESS) {
>   		XDNA_ERR(xdna, "command opcode 0x%x failed, status 0x%x",
>   			 msg->opcode, *hdl->data);
>   		ret = -EINVAL;
> @@ -233,6 +233,7 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>   		ret = -EINVAL;
>   		goto out_destroy_context;
>   	}
> +	ndev->hwctx_num++;
>   
>   	XDNA_DBG(xdna, "%s mailbox channel irq: %d, msix_id: %d",
>   		 hwctx->name, ret, resp.msix_id);
> @@ -267,6 +268,7 @@ int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwc
>   		 hwctx->fw_ctx_id);
>   	hwctx->priv->mbox_chann = NULL;
>   	hwctx->fw_ctx_id = -1;
> +	ndev->hwctx_num--;
>   
>   	return ret;
>   }
> @@ -332,11 +334,6 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
>   		goto fail;
>   	}
>   
> -	if (resp.status != AIE2_STATUS_SUCCESS) {
> -		XDNA_ERR(xdna, "Query NPU status failed, status 0x%x", resp.status);
> -		ret = -EINVAL;
> -		goto fail;
> -	}
>   	XDNA_DBG(xdna, "Query NPU status completed");
>   
>   	if (size < resp.size) {
> @@ -358,6 +355,55 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
>   	return ret;
>   }
>   
> +int aie2_query_telemetry(struct amdxdna_dev_hdl *ndev,
> +			 char __user *buf, u32 size,
> +			 struct amdxdna_drm_query_telemetry_header *header)
> +{
> +	DECLARE_AIE2_MSG(get_telemetry, MSG_OP_GET_TELEMETRY);
> +	struct amdxdna_dev *xdna = ndev->xdna;
> +	dma_addr_t dma_addr;
> +	u8 *addr;
> +	int ret;
> +
> +	if (header->type >= MAX_TELEMETRY_TYPE)
> +		return -EINVAL;
> +
> +	addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
> +				     DMA_FROM_DEVICE, GFP_KERNEL);
> +	if (!addr)
> +		return -ENOMEM;
> +
> +	req.buf_addr = dma_addr;
> +	req.buf_size = size;
> +	req.type = header->type;
> +
> +	drm_clflush_virt_range(addr, size); /* device can access */
> +	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Query telemetry failed, status %d", ret);
> +		goto free_buf;
> +	}
> +
> +	if (size < resp.size) {
> +		ret = -EINVAL;
> +		XDNA_ERR(xdna, "Bad buffer size. Available: %u. Needs: %u", size, resp.size);
> +		goto free_buf;
> +	}
> +
> +	if (copy_to_user(buf, addr, resp.size)) {
> +		ret = -EFAULT;
> +		XDNA_ERR(xdna, "Failed to copy telemetry to user space");
> +		goto free_buf;
> +	}
> +
> +	header->major = resp.major;
> +	header->minor = resp.minor;
> +
> +free_buf:
> +	dma_free_noncoherent(xdna->ddev.dev, size, addr, dma_addr, DMA_FROM_DEVICE);
> +	return ret;
> +}
> +
>   int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
>   				 void *handle, int (*cb)(void*, void __iomem *, size_t))
>   {
> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
> index cb53132029eb..2dbea1d09980 100644
> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
> @@ -9,7 +9,8 @@
>   enum aie2_msg_opcode {
>   	MSG_OP_CREATE_CONTEXT              = 0x2,
>   	MSG_OP_DESTROY_CONTEXT             = 0x3,
> -	MSG_OP_SYNC_BO			   = 0x7,
> +	MSG_OP_GET_TELEMETRY               = 0x4,
> +	MSG_OP_SYNC_BO                     = 0x7,
>   	MSG_OP_EXECUTE_BUFFER_CF           = 0xC,
>   	MSG_OP_QUERY_COL_STATUS            = 0xD,
>   	MSG_OP_QUERY_AIE_TILE_INFO         = 0xE,
> @@ -136,6 +137,28 @@ struct destroy_ctx_resp {
>   	enum aie2_msg_status	status;
>   } __packed;
>   
> +enum telemetry_type {
> +	TELEMETRY_TYPE_DISABLED,
> +	TELEMETRY_TYPE_HEALTH,
> +	TELEMETRY_TYPE_ERROR_INFO,
> +	TELEMETRY_TYPE_PROFILING,
> +	TELEMETRY_TYPE_DEBUG,
> +	MAX_TELEMETRY_TYPE
> +};
> +
> +struct get_telemetry_req {
> +	enum telemetry_type	type;
> +	__u64	buf_addr;
> +	__u32	buf_size;
> +} __packed;
> +
> +struct get_telemetry_resp {
> +	__u32	major;
> +	__u32	minor;
> +	__u32	size;
> +	enum aie2_msg_status	status;
> +} __packed;
> +
>   struct execute_buffer_req {
>   	__u32	cu_idx;
>   	__u32	payload[19];
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index f1a8112b080f..80313a2a98d4 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -825,6 +825,100 @@ static int aie2_get_hwctx_status(struct amdxdna_client *client,
>   	return 0;
>   }
>   
> +static int aie2_query_resource_info(struct amdxdna_client *client,
> +				    struct amdxdna_drm_get_info *args)
> +{
> +	struct amdxdna_drm_get_resource_info res_info;
> +	const struct amdxdna_dev_priv *priv;
> +	struct amdxdna_dev_hdl *ndev;
> +	struct amdxdna_dev *xdna;
> +
> +	xdna = client->xdna;
> +	ndev = xdna->dev_handle;
> +	priv = ndev->priv;
> +
> +	res_info.npu_clk_max = priv->dpm_clk_tbl[ndev->max_dpm_level].hclk;
> +	res_info.npu_tops_max = ndev->max_tops;
> +	res_info.npu_task_max = priv->hwctx_limit;
> +	res_info.npu_tops_curr = ndev->curr_tops;
> +	res_info.npu_task_curr = ndev->hwctx_num;
> +
> +	if (copy_to_user(u64_to_user_ptr(args->buffer), &res_info, sizeof(res_info)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static int aie2_fill_hwctx_map(struct amdxdna_hwctx *hwctx, void *arg)
> +{
> +	struct amdxdna_dev *xdna = hwctx->client->xdna;
> +	u32 *map = arg;
> +
> +	if (hwctx->fw_ctx_id >= xdna->dev_handle->priv->hwctx_limit) {
> +		XDNA_ERR(xdna, "Invalid fw ctx id %d/%d ", hwctx->fw_ctx_id,
> +			 xdna->dev_handle->priv->hwctx_limit);
> +		return -EINVAL;
> +	}
> +
> +	map[hwctx->fw_ctx_id] = hwctx->id;
> +	return 0;
> +}
> +
> +static int aie2_get_telemetry(struct amdxdna_client *client,
> +			      struct amdxdna_drm_get_info *args)
> +{
> +	struct amdxdna_drm_query_telemetry_header *header __free(kfree) = NULL;
> +	u32 telemetry_data_sz, header_sz, elem_num;
> +	struct amdxdna_dev *xdna = client->xdna;
> +	struct amdxdna_client *tmp_client;
> +	int ret;
> +
> +	elem_num = xdna->dev_handle->priv->hwctx_limit;
> +	header_sz = struct_size(header, map, elem_num);
> +	if (args->buffer_size <= header_sz) {
> +		XDNA_ERR(xdna, "Invalid buffer size");
> +		return -EINVAL;
> +	}
> +
> +	telemetry_data_sz = args->buffer_size - header_sz;
> +	if (telemetry_data_sz > SZ_4M) {
> +		XDNA_ERR(xdna, "Buffer size is too big, %d", telemetry_data_sz);
> +		return -EINVAL;
> +	}
> +
> +	header = kzalloc(header_sz, GFP_KERNEL);
> +	if (!header)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(header, u64_to_user_ptr(args->buffer), sizeof(*header))) {
> +		XDNA_ERR(xdna, "Failed to copy telemetry header from user");
> +		return -EFAULT;
> +	}
> +
> +	header->map_num_elements = elem_num;
> +	list_for_each_entry(tmp_client, &xdna->client_list, node) {
> +		ret = amdxdna_hwctx_walk(tmp_client, &header->map,
> +					 aie2_fill_hwctx_map);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = aie2_query_telemetry(xdna->dev_handle,
> +				   u64_to_user_ptr(args->buffer + header_sz),
> +				   telemetry_data_sz, header);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Query telemetry failed ret %d", ret);
> +		return ret;
> +	}
> +
> +	if (copy_to_user(u64_to_user_ptr(args->buffer), header, header_sz)) {
> +		XDNA_ERR(xdna, "Copy header failed");
> +		return -EFAULT;
> +	}
> +
> +	return 0;
> +}
> +
>   static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_info *args)
>   {
>   	struct amdxdna_dev *xdna = client->xdna;
> @@ -859,6 +953,12 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>   	case DRM_AMDXDNA_GET_POWER_MODE:
>   		ret = aie2_get_power_mode(client, args);
>   		break;
> +	case DRM_AMDXDNA_QUERY_TELEMETRY:
> +		ret = aie2_get_telemetry(client, args);
> +		break;
> +	case DRM_AMDXDNA_QUERY_RESOURCE_INFO:
> +		ret = aie2_query_resource_info(client, args);
> +		break;
>   	default:
>   		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
>   		ret = -EOPNOTSUPP;
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index 243ac21d50c1..cfe42b0d4242 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -182,6 +182,8 @@ struct amdxdna_dev_hdl {
>   	u32				clk_gating;
>   	u32				npuclk_freq;
>   	u32				hclk_freq;
> +	u64				max_tops;
> +	u64				curr_tops;
>   
>   	/* Mailbox and the management channel */
>   	struct mailbox			*mbox;
> @@ -219,6 +221,7 @@ struct amdxdna_dev_priv {
>   	u32				mbox_dev_addr;
>   	/* If mbox_size is 0, use BAR size. See MBOX_SIZE macro */
>   	u32				mbox_size;
> +	u32				hwctx_limit;
>   	u32				sram_dev_addr;
>   	struct aie2_bar_off_pair	sram_offs[SRAM_MAX_INDEX];
>   	struct aie2_bar_off_pair	psp_regs_off[PSP_MAX_REGS];
> @@ -273,6 +276,9 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>   int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
>   int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u64 size);
>   int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf, u32 size, u32 *cols_filled);
> +int aie2_query_telemetry(struct amdxdna_dev_hdl *ndev,
> +			 char __user *buf, u32 size,
> +			 struct amdxdna_drm_query_telemetry_header *header);
>   int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
>   				 void *handle, int (*cb)(void*, void __iomem *, size_t));
>   int aie2_config_cu(struct amdxdna_hwctx *hwctx,
> diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
> index 7f292a615ed8..11c0e9e7b03a 100644
> --- a/drivers/accel/amdxdna/aie2_smu.c
> +++ b/drivers/accel/amdxdna/aie2_smu.c
> @@ -23,6 +23,13 @@
>   #define AIE2_SMU_SET_SOFT_DPMLEVEL	0x7
>   #define AIE2_SMU_SET_HARD_DPMLEVEL	0x8
>   
> +#define NPU4_DPM_TOPS(ndev, dpm_level) \
> +({ \
> +	typeof(ndev) _ndev = ndev; \
> +	(4096 * (_ndev)->total_col * \
> +	 (_ndev)->priv->dpm_clk_tbl[dpm_level].hclk / 1000000); \
> +})
> +
>   static int aie2_smu_exec(struct amdxdna_dev_hdl *ndev, u32 reg_cmd,
>   			 u32 reg_arg, u32 *out)
>   {
> @@ -84,6 +91,8 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   	amdxdna_pm_suspend_put(ndev->xdna);
>   	ndev->hclk_freq = freq;
>   	ndev->dpm_level = dpm_level;
> +	ndev->max_tops = 2 * ndev->total_col;
> +	ndev->curr_tops = ndev->max_tops * freq / 1028;
>   
>   	XDNA_DBG(ndev->xdna, "MP-NPU clock %d, H clock %d\n",
>   		 ndev->npuclk_freq, ndev->hclk_freq);
> @@ -121,6 +130,8 @@ int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   	ndev->npuclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].npuclk;
>   	ndev->hclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].hclk;
>   	ndev->dpm_level = dpm_level;
> +	ndev->max_tops = NPU4_DPM_TOPS(ndev, ndev->max_dpm_level);
> +	ndev->curr_tops = NPU4_DPM_TOPS(ndev, dpm_level);
>   
>   	XDNA_DBG(ndev->xdna, "MP-NPU clock %d, H clock %d\n",
>   		 ndev->npuclk_freq, ndev->hclk_freq);
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox_helper.h b/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
> index 710ff8873d61..556c712cad0a 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
> @@ -16,16 +16,18 @@ struct xdna_notify {
>   	u32			*data;
>   	size_t			size;
>   	int			error;
> +	u32			*status;
>   };
>   
> -#define DECLARE_XDNA_MSG_COMMON(name, op, status)			\
> +#define DECLARE_XDNA_MSG_COMMON(name, op, s)				\
>   	struct name##_req	req = { 0 };				\
> -	struct name##_resp	resp = { status	};			\
> +	struct name##_resp	resp = { .status = s };			\
>   	struct xdna_notify	hdl = {					\
>   		.error = 0,						\
>   		.data = (u32 *)&resp,					\
>   		.size = sizeof(resp),					\
>   		.comp = COMPLETION_INITIALIZER_ONSTACK(hdl.comp),	\
> +		.status = (u32 *)&resp.status,				\
>   	};								\
>   	struct xdna_mailbox_msg msg = {					\
>   		.send_data = (u8 *)&req,				\
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 3599e713bfcb..2e47a09f10cc 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -29,9 +29,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>    * 0.1: Support getting all hardware contexts by DRM_IOCTL_AMDXDNA_GET_ARRAY
>    * 0.2: Support getting last error hardware error
>    * 0.3: Support firmware debug buffer
> + * 0.4: Support getting resource and telemetry information
>    */
>   #define AMDXDNA_DRIVER_MAJOR		0
> -#define AMDXDNA_DRIVER_MINOR		3
> +#define AMDXDNA_DRIVER_MINOR		4
>   
>   /*
>    * Bind the driver base on (vendor_id, device_id) pair and later use the
> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
> index 10124cccb102..23feb5f6fad3 100644
> --- a/drivers/accel/amdxdna/npu1_regs.c
> +++ b/drivers/accel/amdxdna/npu1_regs.c
> @@ -73,6 +73,7 @@ static const struct amdxdna_dev_priv npu1_dev_priv = {
>   	.mbox_dev_addr  = NPU1_MBOX_BAR_BASE,
>   	.mbox_size      = 0, /* Use BAR size */
>   	.sram_dev_addr  = NPU1_SRAM_BAR_BASE,
> +	.hwctx_limit	= 6,
>   	.sram_offs      = {
>   		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU1_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
>   		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU1_SRAM, MPNPU_SRAM_I2X_MAILBOX_15),
> diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
> index a081cac75ee0..67c2ae931c62 100644
> --- a/drivers/accel/amdxdna/npu2_regs.c
> +++ b/drivers/accel/amdxdna/npu2_regs.c
> @@ -71,6 +71,7 @@ static const struct amdxdna_dev_priv npu2_dev_priv = {
>   	.mbox_dev_addr  = NPU2_MBOX_BAR_BASE,
>   	.mbox_size      = 0, /* Use BAR size */
>   	.sram_dev_addr  = NPU2_SRAM_BAR_BASE,
> +	.hwctx_limit	= 16,
>   	.sram_offs      = {
>   		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU2_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
>   		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU2_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index e1da882420ec..fac6c1b0b74b 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -93,6 +93,7 @@ static const struct amdxdna_dev_priv npu4_dev_priv = {
>   	.mbox_dev_addr  = NPU4_MBOX_BAR_BASE,
>   	.mbox_size      = 0, /* Use BAR size */
>   	.sram_dev_addr  = NPU4_SRAM_BAR_BASE,
> +	.hwctx_limit	= 16,
>   	.sram_offs      = {
>   		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU4_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
>   		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU4_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
> diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
> index 5f1cf83461c4..c91e1fa76ff5 100644
> --- a/drivers/accel/amdxdna/npu5_regs.c
> +++ b/drivers/accel/amdxdna/npu5_regs.c
> @@ -71,6 +71,7 @@ static const struct amdxdna_dev_priv npu5_dev_priv = {
>   	.mbox_dev_addr  = NPU5_MBOX_BAR_BASE,
>   	.mbox_size      = 0, /* Use BAR size */
>   	.sram_dev_addr  = NPU5_SRAM_BAR_BASE,
> +	.hwctx_limit	= 16,
>   	.sram_offs      = {
>   		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU5_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
>   		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU5_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
> diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
> index 94a7005685a7..773f738915a7 100644
> --- a/drivers/accel/amdxdna/npu6_regs.c
> +++ b/drivers/accel/amdxdna/npu6_regs.c
> @@ -71,6 +71,7 @@ static const struct amdxdna_dev_priv npu6_dev_priv = {
>   	.mbox_dev_addr  = NPU6_MBOX_BAR_BASE,
>   	.mbox_size      = 0, /* Use BAR size */
>   	.sram_dev_addr  = NPU6_SRAM_BAR_BASE,
> +	.hwctx_limit	= 16,
>   	.sram_offs      = {
>   		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU6_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
>   		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU6_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index c7eec9ceb2ae..8ad254bc35a5 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -442,6 +442,40 @@ enum amdxdna_drm_get_param {
>   	DRM_AMDXDNA_QUERY_HW_CONTEXTS,
>   	DRM_AMDXDNA_QUERY_FIRMWARE_VERSION = 8,
>   	DRM_AMDXDNA_GET_POWER_MODE,
> +	DRM_AMDXDNA_QUERY_TELEMETRY,
> +	DRM_AMDXDNA_QUERY_RESOURCE_INFO = 12,

Any reason for the hole and skipping 11?  Should it be explicitly 
reserved for something else?

> +};
> +
> +/**
> + * struct amdxdna_drm_get_resource_info - Get resource information
> + */
> +struct amdxdna_drm_get_resource_info {
> +	/** @npu_clk_max: max H-Clocks */
> +	__u64 npu_clk_max;
> +	/** @npu_tops_max: max TOPs */
> +	__u64 npu_tops_max;
> +	/** @npu_task_max: max number of tasks */
> +	__u64 npu_task_max;
> +	/** @npu_tops_curr: current TOPs */
> +	__u64 npu_tops_curr;
> +	/** @npu_task_curr: current number of tasks */
> +	__u64 npu_task_curr;
> +};
> +
> +/**
> + * struct amdxdna_drm_query_telemetry_header - Telemetry data header
> + */
> +struct amdxdna_drm_query_telemetry_header {
> +	/** @major: Firmware telemetry interface major version number */
> +	__u32 major;
> +	/** @minor: Firmware telemetry interface minor version number */
> +	__u32 minor;
> +	/** @type: Telemetry query type */
> +	__u32 type;
> +	/** @map_num_elements: Total number of elements in the map table */
> +	__u32 map_num_elements;
> +	/** @map: Element map */
> +	__u32 map[];
>   };
>   
>   /**

