Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 808CBB3C57F
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 01:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E8A10E33C;
	Fri, 29 Aug 2025 23:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="S0XT+JP9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D3310E33C;
 Fri, 29 Aug 2025 23:09:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaAiB6VsymRmLhLmHCfybFxANT67Xeu2pULqpm/CaYrkyRRQF7/pJFolls463YkFpGAtuQCBsx2nFIKpZTU4YIs4uG+xKcpWdxDhvHArpZ8tmo5+R+aHG3uTr1OalNdhDFcfDQ7cpUHB7OZkZDNK3w/iZeIHv1r/HhcvCbq/kMXTEuqRoSL1ZE1gW3TfVBUCiDNUJmPUyGSMGQMBOP8SIjiwVC8QPHirAxjPnZsomci5L06/5vuAJyaBQtz0/CbFs5QZ/Vnffi+zVM/cyz+efxpV9Po+ftFKzQXUPz+NSG47JNap+ZMu4IYUNObQaU4kzPDxey5ouNKQjKLmEdZvHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuktZRE3CS5/dFGIpCZ3oLYLpoCzi7qERL9nR/IsFCw=;
 b=qOyzlJCLFXO6pCo0Egn1y89YCmK9zU5j0PiSmLHfO6XqPs2qHzcGn1opryDGiTByH3Uzaxr6cMxkZYmezdJH8j/wtsspJh8Brm++8MJ1eSbIWbaCCBryMWaiTIh/2xUFTadVxu75tNmnY/cGRK3Gn0m7mj/cCQLFjPW3GjKONsCbKm8pmyZui95dlSDKaqn890azpFHdlk5S8K92v3cQ4QTnmKLu+k64SjdprkLniQJ52ipc4yxizVdgHftdKQsUXIomG9tXm6Tb6+r2XcISRSDfm5wLi/NyR4dNGU3MzoE3iVDx3aTEVOXFZdlGyA62hUvDoIHqoLLNIARiF/EdJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuktZRE3CS5/dFGIpCZ3oLYLpoCzi7qERL9nR/IsFCw=;
 b=S0XT+JP9S2ODXURm9jJBGHHe1g6wjtycT2RVbm2td9N6ActEgI8VN83azaeQAUrfLXK9v9cr9aMBSPfiWMIpNZ9aOjVrAaRe8BI924v2USRutsIph5OGLCOOaWvq2B1Hyqm60e65M04rJclpxTdeZ6hSMNwMKq7YRyozZemllw4CCyDcJ4Qm1nUpIe9zZ55zAe/fm93YL989S1HUF8uP0i4NXCB9Gcl52TIWXbUr7AyWqakcDDlks05E12r9GFoudMmGaml8/+QayCi4kJyZZEiF1MVbrR6eSI2Y7U60oVJRfwcbPqeqyiSAe4nem61qc1HJUa7bwy8ZuMJhEOt91w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3SPRMB0011.namprd12.prod.outlook.com (2603:10b6:806:31a::7)
 by SA3PR12MB9159.namprd12.prod.outlook.com (2603:10b6:806:3a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 23:09:09 +0000
Received: from SA3SPRMB0011.namprd12.prod.outlook.com
 ([fe80::3228:78a0:2b93:2cd5]) by SA3SPRMB0011.namprd12.prod.outlook.com
 ([fe80::3228:78a0:2b93:2cd5%7]) with mapi id 15.20.9052.012; Fri, 29 Aug 2025
 23:09:09 +0000
Message-ID: <0385ce30-036e-4caa-8cce-7415991a34eb@nvidia.com>
Date: Fri, 29 Aug 2025 16:09:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] nouveau: Membar before between semaphore writes and
 the interrupt
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org, dakr@kernel.org
References: <20250829021633.1674524-1-airlied@gmail.com>
 <20250829021633.1674524-2-airlied@gmail.com>
Content-Language: en-US
From: James Jones <jajones@nvidia.com>
In-Reply-To: <20250829021633.1674524-2-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::15) To SA3SPRMB0011.namprd12.prod.outlook.com
 (2603:10b6:806:31a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3SPRMB0011:EE_|SA3PR12MB9159:EE_
X-MS-Office365-Filtering-Correlation-Id: daed1557-05c0-4f2c-3962-08dde7510e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0lJMmowY3NqRXBLYllkNUFnSGpuUlVVSjVYK2RObktDODk5ajB3Z0I2bDRO?=
 =?utf-8?B?cWZYM2Q3emJlYUdVTFROYVQ5VFE5dThHYW9wbk9US0J2dEIvOGdNa3FvcExh?=
 =?utf-8?B?MXlpQlRRUTJNR1dtUmRSNXFwSmJSRDUxL2RTLzFLTzBUdm1EcUFLMWZ3ZDVn?=
 =?utf-8?B?dlp4aGIzajhtOFNOS2Z6VmpSTkoyc08vREcyN2lPSDJ6WDdYbUt4c2VmVTR6?=
 =?utf-8?B?NDJrUWluZDBvR2ZNUnZtUlJwbHZXTVZlZ2ZVdk1ydnV0bzBLU0lpQlBlenAv?=
 =?utf-8?B?dEQ3amp3OFlIVWh4UEVEUjY3ZGZ0NkRQNWlaL0g5YXBOZDhJbnFaK241dEVV?=
 =?utf-8?B?a2VqVExsU0Y3T3Naa2U0d082YU5jRDVHTUt0bFFQeHErYzJtZDc0VE5PVGJL?=
 =?utf-8?B?ZXNxVG9yQi9XbkVoendsRlVMcWptbnZLUGNQa0VsclRjMGdBMldyN2VBdlZi?=
 =?utf-8?B?cUVZcElrNVIrcHVyRnhaSC9SY1gzWWFSTmZGZlZpWlZVa0EvR0xmWitKZmhs?=
 =?utf-8?B?dDEwcERSd3VqSFdTaUVmYmdsaDBZTy8wVTgrT1pOdm9scC9OQ3drSUU3aWZp?=
 =?utf-8?B?SXk2QTFVR3h5M0d0QWh2MXVoSU5BQW1sVTMyN0h1VmZpMUxvLzhMWVJ3d2RJ?=
 =?utf-8?B?a1RpS1VERDdwSEJlTFVnMFZDclpjUEg5Nm93WTE5bURmQ1hTVFpMYUdadURH?=
 =?utf-8?B?NTdrVWowdW9pS3RFSjNwL0I0NWpSTllnZ2VkOWdMR3FWMEswK3NLTmVVZkQr?=
 =?utf-8?B?ZklUVEQ4aXRKazdnOTJJcmxPOTZ6OHZRMk03Qml4THpQb3FZTEpIaWkwZjZs?=
 =?utf-8?B?MlpobHFzNDE3ZmhwRTFvS2ZUcFdmMC9WK3FRSGI4bW5WZkVVd3BzdUh4UktJ?=
 =?utf-8?B?N3Z5am12aGVyTFlFVytjNndFczBkVllUVFowNVBVMUxxcHlvRjMwdHkrbWx2?=
 =?utf-8?B?THVjY1pUNWpZYURCTDBtaStnSTBwMmxnRkJCcTlidkRrbGw1dC9SNTZ1ZUE3?=
 =?utf-8?B?QVdCaVBFS0pVM1kydHZFM2ZuOU5vcC9sUG13NDRrWEo1ZkNPSjBKekgwMTRK?=
 =?utf-8?B?UXN0YmtpaFN4NnJXZ2NMRDRzOE9hY2FIZzN5R1dCUTI2a1EzTFpNY2xrLzhY?=
 =?utf-8?B?RVVlZDFGNWV4T3lYN3Y3ZVBETnlEVTNXZVhIbElSOVZOQ2diaWltNTRHcHVQ?=
 =?utf-8?B?b0pBc3QwU2w1dlR0N2V1Z0NyWmhFeTJJRWh0V3ZDUlErUm9YTG5mdHVmRVdI?=
 =?utf-8?B?VGRidXowWkFUUnJnMTJtNHd2WUtGZElFSlJVaW9xYmMvRjZYUmhDKzJpekNn?=
 =?utf-8?B?clQ2S1pIMy9HcXdTU0NiQmMvcXF0a3FNUE02ai9ZMlFnWHliazdhakkwUGkz?=
 =?utf-8?B?UkoxcHlQT1phcUQwNGsvMkRFbnNZWGQ1eS95K2pKRG0zVTErZmM3ZDdUVWkv?=
 =?utf-8?B?dHN0SEhUMkd4QnVPanZINVc2Ykk5RFgzeE9DNW82OG5LVnplRDdqc2VhbXhT?=
 =?utf-8?B?YlMycVQyZFpFOExnd0dKMVJIdUY5KzhjTXYxOUdndFI3NFNuT0Y2RGtwZkR3?=
 =?utf-8?B?Ym5nOFFNQSt0anV4V2tjMzdSc21Td05FZm84NGtWQWEwNXk4blFWZWh0d2tr?=
 =?utf-8?B?OWtQanhpMFhNQ05IQVNlam0xQ1drRmhjZGRYQ2pvY0cwQjRRUTVUck9aeUFx?=
 =?utf-8?B?WkFiWXQ4dHI5NzlpcWU3N1k4S2l1dzBlLzVJVnhNUWN3ZEtGYWl3N1hQK0Vv?=
 =?utf-8?B?bHQxVVVaaEFHdlFLMXlVY3VSTStvK0tIL2s3c1Vtd2pzOXJSbGxvTFA2TWdT?=
 =?utf-8?B?YUtpdjlFSzhyajFkUW5pVFRtZ3pPN2YzVEVBaStkU1hScEtIdlA5a0JTN2FC?=
 =?utf-8?B?Mk9SV3VMRWt6dU9ta0d0TURWVzVZL0d5NzhTRCtLME9ySFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3SPRMB0011.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDNGOXdPcWtqZ3czRVJ1UHo5Rm5CNmpRZ0ZiYkpuMDIva1VZMEw2ak1RSnhm?=
 =?utf-8?B?NlR1MnkzV3NUekNvL3U1dWc2ZmprcFliY1VzL1lZbTBzWWJad09kcjB1cVdL?=
 =?utf-8?B?d2svMVc2WG12TGM1cXFXMHlwR29mZWpSRWgxNTJSa3VQZXdSRHNWTlI2V1gx?=
 =?utf-8?B?d0ZCS0dMZmZyWlFVMjhRcVZWNTRPYVU0VTZhMm5lOFdoYU5TSmtJYmdHTW1K?=
 =?utf-8?B?dGxaMXdyMjhYd3YxOEFLeVZ6WkFPZUNwSmZnVXMyUXBPZXYvUHB6QVY5bTJu?=
 =?utf-8?B?U2VoYWdsbW5LYTB3dG9JWGxxek9STUN3akxMM3JaSVU2V1EyUGl4dEd0ZkQx?=
 =?utf-8?B?TVVyVjltVXJvaUhGQXVrVEFPaW45MWhrcHVvb1RnTmFjSDBsb2swSjB0STc3?=
 =?utf-8?B?SVR0ZFIxdWRNbDRKOE9PMzR6MVNzNnprRUM2SHBzOWc2M3NVOThBV2lPQzhz?=
 =?utf-8?B?bWxpbCtOSTV2ZkdNajFJdjFIdXlEaU9wMmptV2xuNDZaa1ZCSi9tVmZ0aGxP?=
 =?utf-8?B?SEtRK3pVOHhoZTJGdnU0bENLUUgvV3JnZDhFMGh3NElwa0gvdHJ4Y09XRk95?=
 =?utf-8?B?WGpUTmJ4aXlEQWp6T0cwNEVReHVpcFJ2YmdkV3NSZlBpcDdrWFJ5ZGpHR3FB?=
 =?utf-8?B?Q0F6REdUeU1GdjJRSHNSVFdUaVRtZHh2RzJLTTV3Sm5iQlFIdjBUelVuUGJr?=
 =?utf-8?B?bGtqa2dBc3VJSGN1SHJReXNXblUvNFRGUGhqcEpheExGUFpURWxYYldvYXd6?=
 =?utf-8?B?bGpwZ1lxNnVGKytadFp4MWVqTDNIY3ZrRVZtVW9DR3JkM2p4K3krc3hPZ3Fi?=
 =?utf-8?B?dmp2bXNRZjBmeFdHbmk4T0ZrNlppbitKN2V4cWpPUURUcExwcmtzK1lhdTZZ?=
 =?utf-8?B?UytXaWlQM1NoS3JXUzRUc0pGU2xmWU50ZkZ2UXZocjBwSWtQL1R6OFA1ZnUz?=
 =?utf-8?B?KzdvTS9NWXIxRGZPU1JTajJURVpHQXNHWXM2K2REb0lHUHU1SkxsRXYwbDJY?=
 =?utf-8?B?MEF2a1I5M09Va2l2OGE2L1V3akc4eGE3aTRnUHhYY09PQWY5ZWRqeTlCemdp?=
 =?utf-8?B?Yk5SQzN2aVppTjJXdzFxSS9hK1Fxb1pjWVdLd25NQXR4R0pXUTN3WkxUUDl5?=
 =?utf-8?B?LzBFMkRNL0k5NWFBSitaUm5pYW9uMGlnMVdqem84TmE1eEVOZ2krRWhmOHZy?=
 =?utf-8?B?cXdWU1NkMUNNUXluSzdQbjJ6YVNGc3lUMmQ5MForaS9TdmdnUlhQMlI3eUt6?=
 =?utf-8?B?dHRYQm9JWHNDRm9MQXhHN2M1Rm5CeXJvS0pBWGxUd04rQ09ITlI0amRQaXNT?=
 =?utf-8?B?ZnJ6M3cxWGtrUjVqbUNnNmlxcm9nU2g1VVlJYlNQVzdVQlJQQ1RLTHJFQk1o?=
 =?utf-8?B?L3JKYzcvQWZaekdqUFJoM21kaTJXbzRGVWREL1VpeTVjL3lXbWQvdER3amFl?=
 =?utf-8?B?a2U4RW1HVTIrWHRJMDlJcU5FaTQxb0lvR2FQTnMrV1o1ZFZlcURCbUdHR0Y5?=
 =?utf-8?B?V3hJVnJYSVNpaUZ6dHIyVU16VFluQkNQQ3g4czUrZmhqN2ZqQnR0algvcjNu?=
 =?utf-8?B?bHlyM09sZTJCSlQzREp6cXdmUUlvNjlUT2d5R1puclVMeGtvNC9FS1ZXV1hN?=
 =?utf-8?B?QzRBN29hYWNDdWNtczBwK1oyT1ArOFl0ZHF0TlVCYm8wN3luTEhoNnZrdERQ?=
 =?utf-8?B?V1Y4SVdGcGxwUGRDVWVWbkdaQ1llSDlycnphVjV0K0crU1VXTHBua2dlMkta?=
 =?utf-8?B?ZmM4eENWc1dwQm43VnpuY1krcTF0dGwxbFVTQ1BUWmdNbThxdjVKWkhsdEp6?=
 =?utf-8?B?dDFuRlVQS20vRkdhZnUyNFVPTVdVRTZESXdoK1ZLSGhzSWVDR2FmUDlJMVhJ?=
 =?utf-8?B?Q2NoNDVjc2ZqWktPS0ZZWVM4Z0taYnlYNGZwVFR1bHJVR0JyODJwUXZMSVVI?=
 =?utf-8?B?dWtpS3BqazE1eWsvY21UcjBkbnVVcFNKK2ZnUGdOQkhLdlIwZ0MxQTFXZSs3?=
 =?utf-8?B?SDhJYlBYbVRYOWEydXM5L3pwRFFZd3VEeFB4eWpuMTlUV2hwdzFMYUpPbW15?=
 =?utf-8?B?MWNDd1owUmpxdGVBYXloUHZvY0M0dWtna2RTUGZvR09LWDBIdGhvUTJDeFJ4?=
 =?utf-8?Q?LnNrPzVuewuULY6U4pH6I1DP5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daed1557-05c0-4f2c-3962-08dde7510e3d
X-MS-Exchange-CrossTenant-AuthSource: SA3SPRMB0011.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 23:09:08.5592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QpX5HlBOldVbyX0q8RM+QqdAo9vhvoy/7anV/LNCQoGFVx9ewyKAHC2nO1hIf/gQTw1dgWTE+twcK5ahCz65w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9159
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

For posterity: This surprised me, so I asked our architecture team 
whether it makes sense. They confirmed the additional sysmembar is 
required for correct ordering between the interrupt handler's CPU read 
and the host semaphore release's memory write.

Thanks,
-James

On 8/28/25 19:16, Dave Airlie wrote:
> From: Faith Ekstrand <faith.ekstrand@collabora.com>
> 
> This ensures that the memory write and the interrupt are properly
> ordered and we won't wake up the kernel before the semaphore write has
> hit memory.
> 
> Fixes: b1ca384772b6 ("drm/nouveau/gv100-: switch to volta semaphore methods")
> Cc: stable@vger.kernel.org
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/gv100_fence.c         |  7 +-
>   .../drm/nouveau/include/nvhw/class/clc36f.h   | 85 +++++++++++++++++++
>   2 files changed, 91 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/gv100_fence.c b/drivers/gpu/drm/nouveau/gv100_fence.c
> index cccdeca72002..317e516c4ec7 100644
> --- a/drivers/gpu/drm/nouveau/gv100_fence.c
> +++ b/drivers/gpu/drm/nouveau/gv100_fence.c
> @@ -18,7 +18,7 @@ gv100_fence_emit32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
>   	struct nvif_push *push = &chan->chan.push;
>   	int ret;
>   
> -	ret = PUSH_WAIT(push, 8);
> +	ret = PUSH_WAIT(push, 13);
>   	if (ret)
>   		return ret;
>   
> @@ -32,6 +32,11 @@ gv100_fence_emit32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
>   		  NVDEF(NVC36F, SEM_EXECUTE, PAYLOAD_SIZE, 32BIT) |
>   		  NVDEF(NVC36F, SEM_EXECUTE, RELEASE_TIMESTAMP, DIS));
>   
> +	PUSH_MTHD(push, NVC36F, MEM_OP_A, 0,
> +				MEM_OP_B, 0,
> +				MEM_OP_C, NVDEF(NVC36F, MEM_OP_C, MEMBAR_TYPE, SYS_MEMBAR),
> +				MEM_OP_D, NVDEF(NVC36F, MEM_OP_D, OPERATION, MEMBAR));
> +
>   	PUSH_MTHD(push, NVC36F, NON_STALL_INTERRUPT, 0);
>   
>   	PUSH_KICK(push);
> diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/clc36f.h b/drivers/gpu/drm/nouveau/include/nvhw/class/clc36f.h
> index 8735dda4c8a7..338f74b9f501 100644
> --- a/drivers/gpu/drm/nouveau/include/nvhw/class/clc36f.h
> +++ b/drivers/gpu/drm/nouveau/include/nvhw/class/clc36f.h
> @@ -7,6 +7,91 @@
>   
>   #define NVC36F_NON_STALL_INTERRUPT                                 (0x00000020)
>   #define NVC36F_NON_STALL_INTERRUPT_HANDLE                                 31:0
> +// NOTE - MEM_OP_A and MEM_OP_B have been replaced in gp100 with methods for
> +// specifying the page address for a targeted TLB invalidate and the uTLB for
> +// a targeted REPLAY_CANCEL for UVM.
> +// The previous MEM_OP_A/B functionality is in MEM_OP_C/D, with slightly
> +// rearranged fields.
> +#define NVC36F_MEM_OP_A                                            (0x00000028)
> +#define NVC36F_MEM_OP_A_TLB_INVALIDATE_CANCEL_TARGET_CLIENT_UNIT_ID        5:0  // only relevant for REPLAY_CANCEL_TARGETED
> +#define NVC36F_MEM_OP_A_TLB_INVALIDATE_INVALIDATION_SIZE                   5:0  // Used to specify size of invalidate, used for invalidates which are not of the REPLAY_CANCEL_TARGETED type
> +#define NVC36F_MEM_OP_A_TLB_INVALIDATE_CANCEL_TARGET_GPC_ID               10:6  // only relevant for REPLAY_CANCEL_TARGETED
> +#define NVC36F_MEM_OP_A_TLB_INVALIDATE_CANCEL_MMU_ENGINE_ID                6:0  // only relevant for REPLAY_CANCEL_VA_GLOBAL
> +#define NVC36F_MEM_OP_A_TLB_INVALIDATE_SYSMEMBAR                         11:11
> +#define NVC36F_MEM_OP_A_TLB_INVALIDATE_SYSMEMBAR_EN                 0x00000001
> +#define NVC36F_MEM_OP_A_TLB_INVALIDATE_SYSMEMBAR_DIS                0x00000000
> +#define NVC36F_MEM_OP_A_TLB_INVALIDATE_TARGET_ADDR_LO                    31:12
> +#define NVC36F_MEM_OP_B                                            (0x0000002c)
> +#define NVC36F_MEM_OP_B_TLB_INVALIDATE_TARGET_ADDR_HI                     31:0
> +#define NVC36F_MEM_OP_C                                            (0x00000030)
> +#define NVC36F_MEM_OP_C_MEMBAR_TYPE                                        2:0
> +#define NVC36F_MEM_OP_C_MEMBAR_TYPE_SYS_MEMBAR                      0x00000000
> +#define NVC36F_MEM_OP_C_MEMBAR_TYPE_MEMBAR                          0x00000001
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PDB                                 0:0
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PDB_ONE                      0x00000000
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PDB_ALL                      0x00000001  // Probably nonsensical for MMU_TLB_INVALIDATE_TARGETED
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_GPC                                 1:1
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_GPC_ENABLE                   0x00000000
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_GPC_DISABLE                  0x00000001
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_REPLAY                              4:2  // only relevant if GPC ENABLE
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_REPLAY_NONE                  0x00000000
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_REPLAY_START                 0x00000001
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_REPLAY_START_ACK_ALL         0x00000002
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_REPLAY_CANCEL_TARGETED       0x00000003
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_REPLAY_CANCEL_GLOBAL         0x00000004
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_REPLAY_CANCEL_VA_GLOBAL      0x00000005
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACK_TYPE                            6:5  // only relevant if GPC ENABLE
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACK_TYPE_NONE                0x00000000
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACK_TYPE_GLOBALLY            0x00000001
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACK_TYPE_INTRANODE           0x00000002
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE                         9:7 //only relevant for REPLAY_CANCEL_VA_GLOBAL
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE_VIRT_READ                 0
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE_VIRT_WRITE                1
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE_VIRT_ATOMIC_STRONG        2
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE_VIRT_RSVRVD               3
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE_VIRT_ATOMIC_WEAK          4
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE_VIRT_ATOMIC_ALL           5
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE_VIRT_WRITE_AND_ATOMIC     6
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE_VIRT_ALL                  7
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL                    9:7  // Invalidate affects this level and all below
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_ALL         0x00000000  // Invalidate tlb caches at all levels of the page table
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_PTE_ONLY    0x00000001
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE0  0x00000002
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE1  0x00000003
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE2  0x00000004
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE3  0x00000005
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE4  0x00000006
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE5  0x00000007
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PDB_APERTURE                          11:10  // only relevant if PDB_ONE
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PDB_APERTURE_VID_MEM             0x00000000
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PDB_APERTURE_SYS_MEM_COHERENT    0x00000002
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PDB_APERTURE_SYS_MEM_NONCOHERENT 0x00000003
> +#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PDB_ADDR_LO                       31:12  // only relevant if PDB_ONE
> +#define NVC36F_MEM_OP_C_ACCESS_COUNTER_CLR_TARGETED_NOTIFY_TAG            19:0
> +// MEM_OP_D MUST be preceded by MEM_OPs A-C.
> +#define NVC36F_MEM_OP_D                                            (0x00000034)
> +#define NVC36F_MEM_OP_D_TLB_INVALIDATE_PDB_ADDR_HI                        26:0  // only relevant if PDB_ONE
> +#define NVC36F_MEM_OP_D_OPERATION                                        31:27
> +#define NVC36F_MEM_OP_D_OPERATION_MEMBAR                            0x00000005
> +#define NVC36F_MEM_OP_D_OPERATION_MMU_TLB_INVALIDATE                0x00000009
> +#define NVC36F_MEM_OP_D_OPERATION_MMU_TLB_INVALIDATE_TARGETED       0x0000000a
> +#define NVC36F_MEM_OP_D_OPERATION_L2_PEERMEM_INVALIDATE             0x0000000d
> +#define NVC36F_MEM_OP_D_OPERATION_L2_SYSMEM_INVALIDATE              0x0000000e
> +// CLEAN_LINES is an alias for Tegra/GPU IP usage
> +#define NVC36F_MEM_OP_B_OPERATION_L2_INVALIDATE_CLEAN_LINES         0x0000000e
> +#define NVC36F_MEM_OP_D_OPERATION_L2_CLEAN_COMPTAGS                 0x0000000f
> +#define NVC36F_MEM_OP_D_OPERATION_L2_FLUSH_DIRTY                    0x00000010
> +#define NVC36F_MEM_OP_D_OPERATION_L2_WAIT_FOR_SYS_PENDING_READS     0x00000015
> +#define NVC36F_MEM_OP_D_OPERATION_ACCESS_COUNTER_CLR                0x00000016
> +#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TYPE                            1:0
> +#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TYPE_MIMC                0x00000000
> +#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TYPE_MOMC                0x00000001
> +#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TYPE_ALL                 0x00000002
> +#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TYPE_TARGETED            0x00000003
> +#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TARGETED_TYPE                   2:2
> +#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TARGETED_TYPE_MIMC       0x00000000
> +#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TARGETED_TYPE_MOMC       0x00000001
> +#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TARGETED_BANK                   6:3
>   #define NVC36F_SEM_ADDR_LO                                         (0x0000005c)
>   #define NVC36F_SEM_ADDR_LO_OFFSET                                         31:2
>   #define NVC36F_SEM_ADDR_HI                                         (0x00000060)

