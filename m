Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24377B21E96
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 08:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AC410E59F;
	Tue, 12 Aug 2025 06:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LktJeV12";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8437910E59F;
 Tue, 12 Aug 2025 06:49:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3bIyM/C41dmF9IJHKEuRpwxqDcZKp0ykr1CkV4MjX189Tm5e4Yx8GYYLAg4IOepaSvVMgNXhW3Okh2VC/zejuWHye2hM0PItMt0RyCvxoUnwkRfzF7VitSNXeGLYsodfiR+SFLJP/L/aCI7vYlZi3+42rUT0zJsYkOxRs7109EvTbnNqPu9o0KG6nhEjqiXHSAQ3na1l/evH7/V5SoazxH2kUYx+LpOAJ2GW+gCAxSnJXuom/iJMQBMsDGHsgoSkwFmlgAC3iTkT9Jjg8YJTPXjt6JZ8HXV2BApXyCV0UOGjo/bgCOZbO8pKvfcZdRppkOTcQ2kvDrqGn0Qqv91ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YaZd+TokZMSpAAtmLwhEPK2quYgQuytZZPxq3E12tOs=;
 b=W5GhJBlzKC4V0XB8/CAAUCJ1AXae/3cPDkpDwXcVoWM+THx8CmzYr+GvCMzf3nag8PxFX94Y9QFhPJDyNjgHUnKJZOUtonU+zWS1R+0a+y6bbz6bR2rZI3XTlEVvuOdA74OpizKyZVuLeM7ZIfAbByL0B+ea5Gs+Jj3cIoU+ReRIVQoJy9vRmt68muxRkKpinArfv6FaCrpgd/0XbVMUwhs3Z7J/Z638RZPty9yumA9XAFB1vLH/qkh6hZLUo3jeFiv9Uvjx7LJtov7nNHvyM5oV6AUzHgdWawQf0SmcmqJDywdowZP/DQVVurcPzr8/zaBfH5PKaOhnXlo92lbzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaZd+TokZMSpAAtmLwhEPK2quYgQuytZZPxq3E12tOs=;
 b=LktJeV12jXpdOIvb2I4552MHxCYT2J30JBg7R9IbP8Id2ehwB4ENEfU+xDumL9khudTlhBTJ/ReIcFhRsh3EyPkZqHTG+W/UOLAjjX5vIzkuZA0/gnVPi23V4UGDn5KDT9lnSfyefkCzZCT2WAe/g3dGEAzJOscYWDrtkBK2nC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8162.namprd12.prod.outlook.com (2603:10b6:806:33a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 06:49:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 06:49:12 +0000
Message-ID: <0811e8e8-5990-4880-a2cc-f9bd6b3ec4bd@amd.com>
Date: Tue, 12 Aug 2025 08:49:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: replace min/max nesting with clamp()
To: Xichao Zhao <zhao.xichao@vivo.com>, alexander.deucher@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250812031603.463355-1-zhao.xichao@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250812031603.463355-1-zhao.xichao@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:208:256::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc2a43e-fea0-4e47-4180-08ddd96c5879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejB5NTZzVHF3c3M4ZUpWa05hYW91YUltZndhczN5RXRPdXVmbGRYSUR0eFdV?=
 =?utf-8?B?SlNzUzFlWlhYa0FLOFFRbWRIRGY3S2pSeTgxS3RkbWVBSHhQZGxYTVY4Sko1?=
 =?utf-8?B?TS8rYXNacXVSMkc5ZTZwRkFKZk14UG55OFVVWUJDaXUxM1FJM3hUNW5DVGhY?=
 =?utf-8?B?ajNjRG1RcjV3dWZySzJkUnhmMlZ4U0o5M0xtM0puRTQ1anRodmNaMVQzd3kz?=
 =?utf-8?B?TkJMNnRWM1cySllOcjhRSGFHYXdlU3hCYzlISldSMWQyamJBOGwydHZWWDg1?=
 =?utf-8?B?OFNybTNGUENqY0RiandPWHc2QkNRTEI5WHMveTRhVmJlRitsYm5wMWNJNTNw?=
 =?utf-8?B?dmNNeWFpWUZwZ2pZa3FSbFJwUFFnT0dHNjBuQkFBWFFZSHZIR3AwUFZJYThj?=
 =?utf-8?B?MUNIR2VqemNNOUxDNEVjQk1vNjJsUFdDRXV6OE5nWVNmRndKMmRDYTNQZGNF?=
 =?utf-8?B?WGdHQ1NLeDBwSWVCVms1eVVCb3AvSDRDQ0NSWU5zUXM4Z1JCcHl1WWwwVmxh?=
 =?utf-8?B?MWRqTzh3SzJueHFTWjEwL2JWTlY3L0s4WUd4MjNNdlc2amNqbjJxSmt5S2ZP?=
 =?utf-8?B?UytCZVdGWmw4WVpyR3JtaUpaRnNnZ0hNY2ppNHdxZVp5M2g3VmdJUkQraTRw?=
 =?utf-8?B?K0V0ZTQ3TjZzQmYycDVrc0NLNk85bmZEdk44TGQ0M3FGdjdRSHVObDdyUjFa?=
 =?utf-8?B?NVZxeForY1h0MzZ2YkppbmNtdGRITC9iRHFGMW1ZWXNCS2RqVHBxUVUxZkRS?=
 =?utf-8?B?eEV5M05iNVMzZkd1V0tPUDVvWHhINERZNU44WTNsY1I3ZmVEcmczd1lPZjdS?=
 =?utf-8?B?MHR6c0tkUWR0WGxNeTY5OUFndy95aUQ1NWF2QUE2aW1BSlZHUnBZWXZvTXpj?=
 =?utf-8?B?b2pYLzJQNVdkRDlDdnA5TXZROG9Nd3hGUGl2ckQrRHo5ZEpIOTJJS2JUNy9V?=
 =?utf-8?B?NEd1TDN2bFl1eTlsaW95S2N3WUJvUVRKOGdIYmNOTlBzbzJ2bjdFNWZBSllU?=
 =?utf-8?B?dHcyaDFLUFNUQU5MMDgxZnlBaTh0NXdqc1p6QVdnbUtXNGFGZTA0ckRMTmkz?=
 =?utf-8?B?TUJ6VjZwWFIzVDlRRjVJRnE3SEYwTHByK3RSRU5KZ3ptV25odUJZWkhRYmhQ?=
 =?utf-8?B?WW5uRFp1YnR2U2k5bzVJbHlkcm9hc2xkTUFXTmVVV3kwb2dVZXgyVGVUNXI0?=
 =?utf-8?B?eVVkdFdncnpIcmpLRzFBakF2Z1lxcy85UFg2Ui9la1ZUc0FjUUFGVWo3VWNt?=
 =?utf-8?B?MXhsbUw4SmR2T1lIbFBGb3FjN3F6Mm9JZFR0cmxram1yYWZrL0s3VG1QZ2R6?=
 =?utf-8?B?OVJLNXlyc0YzY3pMYWxYSHVETnJrR1dSNkVpT0JuaFRnNFo3Ym1Wb2Q5aVBl?=
 =?utf-8?B?a1pZb012ZElSTjZWaDJlYkJYL1UwL1ZHQi9DNklzVkRUMzFhUlhyZ1NWSEVp?=
 =?utf-8?B?Um5XYnlTdXVzektKdVJzc3VtbGRFeWd3QUVwQ0NnS0JONzNwM01meXBIRW0w?=
 =?utf-8?B?R1A3QXNqNHk5Q1g4dnB0K1YyRHpNaVlTWnVUSnFTS04wbk9pL0JMRHFTZkVM?=
 =?utf-8?B?N2tpVzFVdnJYVjBjSWpJUHdTaCt2cnF2dnRrRE9nbVd3dTE4b0h3bDExSjEy?=
 =?utf-8?B?L1dWNjA3NlJzU1VLR0h4MjV3cUh0allnTWYvMm5mcm9PUnhxYTM2cTF6ODFH?=
 =?utf-8?B?WjdyTEd6ZzZIek80Q3liUDA0NWlQakZnK2VPQ3pSd3F3NlF3VmI0RXYzb1A5?=
 =?utf-8?B?bjJDdjJtS0YyeHk4K0RIZ1l4K21qMjBqZTMxdDRtc1YxbU4rU2J5dWlxNlNY?=
 =?utf-8?B?OEt0ZnZCWnZZeHlGbVpvaVRlUlExWkJnMDJsMERDcmZtY2RvZ0JndHp1cWN5?=
 =?utf-8?B?Sjlxa0xyMWFrZDlsbHhTMnpJWEdSUUJjK0RxU1A1N1RoaEhDZmwrdnNYVGtM?=
 =?utf-8?Q?76Mzs5HlUrU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzhSK21FbFRmYjhYRW1TNnlRM1k4SkFuOThjOHh4aDJQU2xBbVVKdlFEOXkr?=
 =?utf-8?B?MjBlei9hY3FQYSt4Z2xmdGVkL1R3K3BDMXI2S1FoQ1plQ1NFL1hLSEMwQXpV?=
 =?utf-8?B?UGNpUVhJMDZ4RnVyU21OM3YwaElNWktYRkZ1S3M5NEF4TFBHNzRyamFZZ01I?=
 =?utf-8?B?ODViR21XSlBVNTlpbGhVbGNZMVMvblI5dWpNOC9HRnNNZDFxRU1LR2RWaXUw?=
 =?utf-8?B?SHdLbUFnd25HZ0ptUDVWNVc3YS9tS0hid0d0ZXl3L1VvRVovTzNlYW1DbDV6?=
 =?utf-8?B?MXZncVFyaFlhV2FRU0NIa2hxaEdJSzVtRkl1VzgyVUJaYmx2RXptZ2tMU2d1?=
 =?utf-8?B?OVVxVWNMc3RnZ25hR0xLNTV3TTQ4eThESS9FbnVac1NnUUJkSThvUDJ0NGFE?=
 =?utf-8?B?OWkvM1VKWC9WV21wVkdkZ0FpTVpCZk03QmNDalpCazJCRW1HenVlR05MZGEv?=
 =?utf-8?B?RjdXMHRQK2xPM1NxWnVkZm0xaSt5VWdkSUIxb3dQd2xVRDhNSzRmM2VDM1Jo?=
 =?utf-8?B?a1VRelAvU3orSHNJdmpxUndXcnlOR0tlTEtPaTdPRnB5OWtyVFpUQmlBWXRy?=
 =?utf-8?B?dUJENnpRd3dhaTEwZjdUVFBvRWlVZHlMU05HOVV2Qyt5UkJYWTQ1U3UzSXA2?=
 =?utf-8?B?bkFEeTRrU05HWTQyMkdDYkw0MSt1alVPWHBVeUx0MzNhcFZid0Z1YXgzMzJ5?=
 =?utf-8?B?OTZLT2hBNnRKbzRWZ2xocTFqZUZXODRCK0g4TVc1VzNFTVNiQUxPL2hNQ0Rz?=
 =?utf-8?B?OG5RNkpVOFdldExURE1lbDlyWjZpa1AzbExmUU5HSkpNeG1FQVVxL2krTXEv?=
 =?utf-8?B?M3NmK1E1QXpkcENlTVp3b2hLTlpsT1R2R241eDdmelUzOFE1NnpObFRKMUJP?=
 =?utf-8?B?d2Vyb0oxVWV6VXlEUXMyR3AzSnJ2OEl1SUZVdTV6aXVCc3R1K0o3ZE0wK05X?=
 =?utf-8?B?NHdjaU5OR1ZRRjcydlJvZEVESGFadG40cjd1ZUp1RkR6U2VQa25DYjdwL1VY?=
 =?utf-8?B?RXRVU0NldXZzems4VC9hQ0c0WEdHRGprZVloaGs2VUpuRTdWcmg0Q1NvTFRz?=
 =?utf-8?B?R1B2bERwVG1lRmNCOG90bHNQakMxR2pVSHJvMW5hL0U4SjBDR0dQQ1lEdjZ0?=
 =?utf-8?B?Q1FKQmFWdUI2cmM5QUVETkhidkFJRGpSYnVtMDRDWGh0MXFYcmhpWFpyUGNo?=
 =?utf-8?B?RjNLM2VUQTlEVXN5U0hHUE93QmpadG5kd2ErRkc3OEx0ck1HM2QxWVdtTTZl?=
 =?utf-8?B?YUhEbDZXWlJiemZxVHhQQVFzaHU0WDRRRG5LNTR6Q05IVHJqZUVLeFdQNmFm?=
 =?utf-8?B?M24vMFhxdHJwdTJDZDhtS0NUZ29WaW1ReVZ4TVBTSVBBODhYUFRRejJUVmZK?=
 =?utf-8?B?QkNRV2tpbmlLYkFxUGJVMVhsRG5Fc3NCMnZLcWhUaElNSU9qK1M1cVViODlv?=
 =?utf-8?B?Y1djSVRaWWZ4bXFVYjNLV3QrQXJSZURxYmI0RkhDQSt5VmZrRzNNYTFld3ZR?=
 =?utf-8?B?TzErYlFLbUVQTDVneFVEL21QeEFrN21Ob2NSQWFsN1AxUTMzWDV0Mm13Sjcz?=
 =?utf-8?B?NDdoajFuNEpobE5zbDlDbmRCdFhZMzdpMGhjSEJPYk9zWTRjYTV4TFo4M3BI?=
 =?utf-8?B?UGFFdmdGVE9xb01JSDNzY1FJT0lVN3lSZUNXSHo4bzFkQi9BV3JIeXpQMW1k?=
 =?utf-8?B?MzdiNkIzRXZGRzczMElNa014YXFxb0EwTGlxTVB3V1prSWdCLzA0eWw3eUVw?=
 =?utf-8?B?Z0RjV0xCdnYzZUd2L0Nac1BxRVdTdVBBWTRYN0tjMnpmeGVab1N4V25DSFc2?=
 =?utf-8?B?a2U1aGpua1dzK0VCSGtpZjNkcG1QRmtSWWlsTUY1d1dubVdud1QydjZJR0Ru?=
 =?utf-8?B?WWV2eGdWQ0ljZmN0Y3NwNW1LRFhuVWdYZzh0TUs2anlKeXY4eTdnUy9uTTBG?=
 =?utf-8?B?aU1HTE1BMHZJS3lkajhKOG9yUU45b29kRG9IWnlEMWJhdGhiVnRyeFRTQ3Ns?=
 =?utf-8?B?eC9hSzJtUmQ0VGlYbENzYytpb3c2eEVCR1pXU3FKVXN5TGNpU3puVy8yVUQx?=
 =?utf-8?B?S2ZZVVlVVWR1bDhlVFJDV2p1c1dOQm03U2srK3BYQ2hEanZPRUJqVVhXOVhN?=
 =?utf-8?Q?KrQUFkxWQfgZMciPcryoIbAiD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc2a43e-fea0-4e47-4180-08ddd96c5879
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 06:49:12.2151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5N0MlLqZeJowsg10ShNC5zEjCxVOB4JWYPGgthcLtq6w6Gt38Yj79ieb9fzHxnDq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8162
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

On 12.08.25 05:16, Xichao Zhao wrote:
> The clamp() macro explicitly expresses the intent of constraining
> a value within bounds.Therefore, replacing min(max(a, b), c) and
> max(min(a,b),c) with clamp(val, lo, hi) can improve code readability.
> 
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/radeon/radeon_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index b4bf5dfeea2d..d66c1a30df95 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -926,10 +926,10 @@ static void avivo_get_fb_ref_div(unsigned nom, unsigned den, unsigned post_div,
>  				 unsigned *fb_div, unsigned *ref_div)
>  {
>  	/* limit reference * post divider to a maximum */
> -	ref_div_max = max(min(100 / post_div, ref_div_max), 1u);
> +	ref_div_max = clamp(100 / post_div, 1u, ref_div_max);
>  
>  	/* get matching reference and feedback divider */
> -	*ref_div = min(max(den/post_div, 1u), ref_div_max);
> +	*ref_div = clamp(den / post_div, 1u, ref_div_max);
>  	*fb_div = DIV_ROUND_CLOSEST(nom * *ref_div * post_div, den);
>  
>  	/* limit fb divider to its maximum */

