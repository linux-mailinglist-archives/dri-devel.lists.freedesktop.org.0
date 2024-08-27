Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7B9960399
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 09:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D2210E181;
	Tue, 27 Aug 2024 07:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T+lMdAbH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D56110E181
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 07:48:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTTgwe4U906mramj8GjkqjYhlXErg68xJp4BnaXBwFo4nZsCcjQHR1wezqsdW/+3bOU9xOP9icy4NFj7y1reEk4aJ2AAoq/EU1xs0pIDmrxI+/P6k1HcqKwRWzZbAzB8hNecgPYmDzK0shn4CCRnL9SmVETu52+FVoT0JZm9MsgK+1maUWUUrmTT2izOliGHiTl9sHo2O8udyYqJ5PcmGD7GYtXQmfW9LAa+C7NsGKFTT2IyktRbJv+tlsFBr6v+5R680XHmCiscZ1Dz7XidEt7ReJlCGELracaILF0VbTb+uulA1ttdcvt9UAh3qCqDkMvDiwbTw3I9qo7P15b9Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nP1QsQ2cWg5nLIWYCzesn6v129v5p2Xidt7XnpE33ps=;
 b=X6moJNDQyLyXNy/w6bh4W9qlBrzXtfjMCKzepF9GwaSTYwKb5wSDr4lmeu3GR7QurarraD1pcSiyHHs0oZZAEvuPUyH4t+w/flSCd7AAKF3cvo7cNafRIcoR5PcI1xVK4JvkIrKCGPFfCPHAnfFangkVOce7Ig4E4ZdT0hdOnC8tHG7rYg1LziylD6XlakyO+H35hzlH4+7Ge97/24rwU2JYYX1AGlRRhJVJSe7OwZ/eGbXhaKH+ARFNDXXY2xmy+hAFf4sWyaYevR+D4rPDvcBKBfwYdlEGaVzlIjkBEsR2N3nPikXmzvSjDB/cRLUmSghRVJya7cTHL9PIpM9nFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nP1QsQ2cWg5nLIWYCzesn6v129v5p2Xidt7XnpE33ps=;
 b=T+lMdAbHX+eRH4EckemnHGTkSj3Wk0IKLuJuR+oQ9ME65K8c+Ht56ASCUwhI4ZNUPQDDpBQUxHk+lTcpUOrSUOZo7rGJBA54fB2pDIu7heU6FyIUQSIINYqMGBQ/Mdc9scXzGtk2qErrBVzOYyvFJcJxFfY3jiVYKEZpA+mqy/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB7480.namprd12.prod.outlook.com (2603:10b6:806:24b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 07:48:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 07:48:19 +0000
Message-ID: <95df80bc-545e-4942-b380-33a53682558c@amd.com>
Date: Tue, 27 Aug 2024 09:48:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix UB pointer dereference
To: Philipp Stanner <pstanner@redhat.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
References: <20240827074521.12828-2-pstanner@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240827074521.12828-2-pstanner@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: 32725363-9519-4d8f-6cb1-08dcc66c9e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGt4bWZ3ZnJtYjBlY3VPWE5IUllnNjhLSFV1ZmVDSDh3Z2FYc00yWG94L0Fi?=
 =?utf-8?B?RElMc2hoYkRFM2l1VTc0Vk1EdTl5N0FjZ1lGeHdjTDdxOC9WcmdTM0ZRN1lG?=
 =?utf-8?B?Mzk5aGJodnJrZm1xaDFBNnA4UjNNUzQ0R3IzU0lsUmgrUTVoalRmUUpYNkxL?=
 =?utf-8?B?MHBNTXM1TE9laTFpdnNTUm9KbjZBMm9hS2JJNHJqWDJWRnpDM0ZSSXFONVIy?=
 =?utf-8?B?eFVsVnZ4Wkc4MGozK0pOVktNeGZRcW5MMzZqMGR0NUgyOGc2a1FBcmlxVGxG?=
 =?utf-8?B?TjdtNlk0UWFKdEdraW9GblgrTGo5WGs5SmlHellOMVNtOTEzcmFtcFN6aHVo?=
 =?utf-8?B?VzlPblljcGVoZ1V6SWx6aXh2eW12aUg2akxpYStaR1BHazZsYmZKSmlLVFRl?=
 =?utf-8?B?VklzdVZvS1R0Z3B1UCtkL05YT3NwWTcrWVdwUGRqa3pKeFEyRENNOUt4aE9m?=
 =?utf-8?B?cXp6SXlENTFzZHAyK1BLTGNMakYwbzVYODV5dTJrUHBXNExsbFZjcTVKZmRC?=
 =?utf-8?B?Zjh0encwNU1wa3JrT3dJdExlSUNNMk5iU29wZjlRZndTOEg4N2hDb3gyQ3k4?=
 =?utf-8?B?Z3FIeVFlTkFPVEV2ZUQrRmVvUnpHZExuY3p1SXM1ZGV1UC82ZUN3bVlXeVBN?=
 =?utf-8?B?WmlibWJNV1F1a29ZNGdhMlNDZ2htMXRIWFdPZUtDYUltb1haZlZQblUvaGRz?=
 =?utf-8?B?VHlMRmlFOXIxZVp5eU9SbmdSVFlZYndWSkcxWTdwWnlXTVNUeDd6T0I0K2ZD?=
 =?utf-8?B?b0ZJUTZ5ODVpVXpkbGpHZDZoWlB1c096VGtxT2V3OEoxa2hjVHltMndMcEVX?=
 =?utf-8?B?MHV5N1llZS8yWGl5N1NyU0lWUHBLQXV2Q2lPNVhwS1owRnFtZzROOW00TXJH?=
 =?utf-8?B?N2dNZGI1NytpWEs5eTQrcWhqMEx1b1pIRXhKQS8vNjloQ2xtajZrWXJSaTFv?=
 =?utf-8?B?WVRKRElXQ3RuVVliQ0FTT1o4T3BxNk1PTUlBaWxlN2ZRU2tBZ2l2MmsxVzkx?=
 =?utf-8?B?R1ArV0paWVNTMmVGZGpIN3lOV2lKYTJoblh1Y3JGQzJMbTJUdk5rRFEyOENW?=
 =?utf-8?B?azcwYzJCRTFDNEpPNVRlK2NEVjQxcWcwbHVPV0k0akdaeGo2RzRMdExWV3d4?=
 =?utf-8?B?K1NkV0Y2RG9BU25sRWlMRG16UEQvL2ZkK3p3WnNyblNTNDFZemlDUUlONGty?=
 =?utf-8?B?U3RJaE54V0dCeHZNWFZXeEpwNmJFdy9jd1VJM0kyRWVEOUxpcjFQME5idWJF?=
 =?utf-8?B?NmYrR1FhY3gvRmd6a2dGZHhtb3RxVGFleXlDUHRnNmVVNE94M3d5UlIwc2pt?=
 =?utf-8?B?VnJGY0s3SWVRN3Q2YTdqSm5hUnBIdmRDd1g1TW1UYkRaMmxPTXhpeDYyZ3Fr?=
 =?utf-8?B?K1BYWHJUcEdRRFZmWU56Rm1aRjFjZGZRQ3hoZFVqQmJwNGZoQ3lqUUUrVzZv?=
 =?utf-8?B?NEU2cC9DWkM0SVdrempzODVxcTFHbEVyQXM2OUh3eEM1cU9RUWllcTE4OEdI?=
 =?utf-8?B?QkE3T2x2Y2V6aDZaV2ZiU25wTmNEZm1LNkNtOGk3K2RVVWRxcS9KQVJBMWZt?=
 =?utf-8?B?NlBkNkFPcjdEMktjMXp0dEN0dkgrTUpQT216RVQwVmFXSGg1RGZBVVVicStK?=
 =?utf-8?B?bVpvdGdYK3o1S0dFZjZ2VERlNWgrN2puNGNROHZUUGNlTjJ0cHR5cUxvdEh0?=
 =?utf-8?B?Ny9uYlpJY2IxSmZJdm84QkV3V2lSVHV6SW9YL0RadVRNT1hmU29Nbzd2NUZ1?=
 =?utf-8?B?bXJ2aHg3c1VOYndJdW1vbjZyMlFad01raFVhZmRaaldFa1hkbTdlNndjd29x?=
 =?utf-8?Q?9961zTa2VKTRwFjQMGA9/LhogvNpJ6ZILoQwg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXpNSEJBVndoeHZXUFJ2c1RvMnFBMHpkaU1jK0RrK3U2Y2pHbFlmQVpRR1Jk?=
 =?utf-8?B?THl3ZjZ4N1k5NFVXMDFLcTBZM0lObHVEOXpBOFREd2phcGhnZ2NDRlNaL1oz?=
 =?utf-8?B?djNCMUxrSjlLeHlkTlZ0VDJSRDJhTmhpc29jTUFCemZ0MmRFdHNmRW1CdVFC?=
 =?utf-8?B?TlRneUx0UXNJbFgvcmlBUHhNQjNpSEgrRk5zaDhNUmNvRzcrNnpidnJiY1Bt?=
 =?utf-8?B?ZHNqaklxZEt0QldCRG5nYkYrK010NFRkZDVlK291elU5MHNoTEJtcFB5a01z?=
 =?utf-8?B?WDdKTlZsdHBOQnBJd3BRREdXclJWWG5IS3R0bDBkZmQxQ2V2cFJHWTBnaUE1?=
 =?utf-8?B?TlRKRkUvQ3BrampSOHZ5bWRPS2VNL1lJUlpkSTR0S0hPcmhjQXRuS2Fnc2tQ?=
 =?utf-8?B?Wk1xTDAwaDV6aHZrYURzV0kycVY1bE1qN0M5Rjg2cUxJaitzZnlONTdWMUJS?=
 =?utf-8?B?SUFxVXpVZUM2RmhMcSt2bWtPNktrYVQ2SEpYRC9ySENna3BuKzVINlZHQ2xJ?=
 =?utf-8?B?MEhCZWxFL21VTUdhT1dDc3NUS1VGMER5QWZYUFFrcytsMVRPNFo3ZzdDV1lH?=
 =?utf-8?B?UzhMWE96ZUlGRlNXcUplSzBpS2Z1SUwrMG9SNWV2ak5rakptQ0ZNMG1wT1FM?=
 =?utf-8?B?WHhuQUttTmc3Zzg4TkdmeEZKSmR2dmdHR1NaZTljbW0zeDlPS0EyUlFzaHUw?=
 =?utf-8?B?KzVKNW5aNTZyL0NJem5KWGZhTEkxeUNadXJqN2hTVkJtc1gwSlkxRkxOWHRY?=
 =?utf-8?B?cUs1VlBWMDhVTnpBV2FvbjNock4wcDlKOXM0TnovdmRwQnBrT0NsNTE0NCtX?=
 =?utf-8?B?Q3RoZkZQbGQxTkRLbFlFWUpVNkZ3RDhuOEhxdzBlcHh6UnJuQStlbW5KakZR?=
 =?utf-8?B?NXF0ek4yVFU0OVJ1Wmtia3ZDbkFYOG5iY3hDdktQK1U4bUM4MHJvc05RS1JI?=
 =?utf-8?B?QjhGUXBTR0JpZVoxekZPVGdPblJZYWVySDV5WWtBN2VwanZGbUhkUlFYZytZ?=
 =?utf-8?B?dFcyZnE3K3VNTTFvMmRsM0JGVEsxdDdGZzBWRXlvb1ZuK0V2MGhGNW9GRkM0?=
 =?utf-8?B?TEdUanh1K0F0ZXY4SWZzbGNWdk9VNU5jclduN05PTEJraU5oRVFFZ1RuelI5?=
 =?utf-8?B?dklpU2NQZnJhbkZHUmowVHhRTEFYdldleUpQVFBENk9yOE9rZGtUWjV6bGRD?=
 =?utf-8?B?VlNpeUxXQUp4Qmp4QXZmRjdmV0lyellWa2habkNXakp5WFlYQU1aMjBqcmFZ?=
 =?utf-8?B?VnJMME5FdmRyMnQwbVk3ZjVaOWVGWVFmS1dhQ1cvUys3bG1ERXQ1UzYzV3cy?=
 =?utf-8?B?ZzBiK2ZBS0Y3TGVhMlFQa0hLSnFJUUlNRHRCUkFjOHpCTE9KbzBVN1hyUHJo?=
 =?utf-8?B?eWZ0OVFGWjArandiSmdRVEVDV0dKUlF6UlNHSFJ5RUNiZVQzbFROdGkybkFa?=
 =?utf-8?B?Y2Iwa0Q2NzJKWGRlZUV3RzBwVjZwMkliRWVRdlhFOU1UWVRDc0NYTlVwTzhT?=
 =?utf-8?B?Vjd4amw1MVFHemh2QjR1eDAvU1UyZkNuUHhrRy91S0FkZG93VjdMV0JzdFBs?=
 =?utf-8?B?VGNIdjJGR3k4VE1adU53TjhjaW1ybHZQM1VHb0ROYURvQ3d5elpPUVhsQzVS?=
 =?utf-8?B?dCt4MUdoeEJlTTdyTFB1Nm5QaUd2Q2xNR3pBZlgzNzkvek54WUo2dDJDRHZs?=
 =?utf-8?B?OGFOT3dGQWg2T2E0Z0lRcHJFc3hOQ05qcmpOb1V3YzgveHFnWUZEbFRtVjBN?=
 =?utf-8?B?dVkrcFlTZm9wYjAvbTFqNUxaRzFvZ1ArcmdvTDJYMWJ0blZyQ3FyaTlSYnRa?=
 =?utf-8?B?b3BNYnBlbS83Wk5PWXR1U3FuSjhoU0h1S052SmFGUVJzYU5YdURkSngzemZX?=
 =?utf-8?B?ekhNZUJ3amJXek9sRFFHeTI1eWNScmtDZHVPUmhJOHlGMlo5ZEhVTTd2MU5t?=
 =?utf-8?B?SGxSTldxU0JJTGt3NGJXWUd5c0h3bStCejZST1JJN0lUd1drYURSc0V5NTZG?=
 =?utf-8?B?YlFCUDVYYzdQQWphR3JQTFpHUGVyWFZrdjNna014bm80bVlvSTBqZGNCKzl0?=
 =?utf-8?B?aitSYVdFRDlEb201SlRzb1M5ajJ2VDVVbWM1UU80aG1qcmxWYm54RUdKK2g2?=
 =?utf-8?Q?wuZE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32725363-9519-4d8f-6cb1-08dcc66c9e49
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 07:48:19.5312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zr0CdiPJ16lT1YZ5NiPcIHhbY+/fU2JelpxskQ3PsIX8qytgnjuJqt25XXxoUzcs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7480
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

Am 27.08.24 um 09:45 schrieb Philipp Stanner:
> In drm_sched_job_init(), commit 56e449603f0a ("drm/sched: Convert the
> GPU scheduler to variable number of run-queues") implemented a call to
> drm_err(), which uses the job's scheduler pointer as a parameter.
> job->sched, however, is not yet valid as it gets set by
> drm_sched_job_arm(), which is always called after drm_sched_job_init().
>
> Since the scheduler code has no control over how the API-User has
> allocated or set 'job', the pointer's dereference is undefined behavior.
>
> Fix the UB by replacing drm_err() with pr_err().
>
> Cc: <stable@vger.kernel.org>	# 6.7+
> Fixes: 56e449603f0a ("drm/sched: Convert the GPU scheduler to variable number of run-queues")
> Reported-by: Danilo Krummrich <dakr@redhat.com>
> Closes: https://lore.kernel.org/lkml/20231108022716.15250-1-dakr@redhat.com/
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7e90c9f95611..356c30fa24a8 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -797,7 +797,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   		 * or worse--a blank screen--leave a trail in the
>   		 * logs, so this can be debugged easier.
>   		 */
> -		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
> +		pr_err("*ERROR* %s: entity has no rq!\n", __func__);
>   		return -ENOENT;
>   	}
>   

