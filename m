Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25F4A4515A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 01:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3478710E823;
	Wed, 26 Feb 2025 00:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6EE10E1F9;
 Wed, 26 Feb 2025 00:19:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZCOWIPKcluS8Z1Ovr6g9uP6zY5ciPMwBk7eS0yxBQvxnVssYo5137eAwbWAgKo0BdxEyy5Gq9jH6OQu0+7GXIYu9Egr5uENzTn5yl3hbiTUbUmDYzs8eO21Q89GREAolJ/PSk5qFOmXR595hzTjFnIa+R/Es8xCQjAPTp63J5eS2oBPDql5UL05ObFAWr6pLTq77GGTEpxFX8ypEh3kzm8ta4OM/u4MarLVCwS0e/Q4wXqykHIQr+bMB0e8NLLQHXmIQB6UD/lFv2/YtR45NaWLUg4imFzh/ledYrWSMDBTIjsr1y104S/b7lHP3ZCugo0i/i0xThC+svJKc7PS/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNDOdOc0XtQE73Ke0X54RD0xksQt2iUUpnK6MXw97wg=;
 b=oshf1g/iNdy03RixRCUlFY93XZMoN1Qk5FIytQ1uBh1GkpylwuDHbTig11bXb/5X95RrySldBbA7GmF+Mq2vgseti/wftICCb/gs+QBXPneDPMSWyXAm8toYlZgO8YnoHbLF278agiNNpXLZVaWRCrxrTIFapCijqB2LP3SUT5KPVbu3ijPKWmqWhIIBboA+gL/3K0+IdxPSfb9V38ydKr3VaoWCCs0DhnmZ4I5O3CbUah0+lcJw77xWmFoMakZpjn7fXG4VVuQ72FaO3ALJRyi0YbJa9CmzYlD1SPTHbSuW93FQ2QE5/GPCPnDabbpsqr4c2Auc5bzZGIImjgg+FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNDOdOc0XtQE73Ke0X54RD0xksQt2iUUpnK6MXw97wg=;
 b=XXw100AV5qYgkfo2CUERMmhy/S1ko9QAxxiS5uJFTuatz5Rm+H73VX2IQ4noVzOxPqLoH454fCgeiP7r/3HFUaPURG47jZa1nnl5/odfLjLh///990YJUh9+6z4qfyFgqGUCFaTFsv9mlL/fRk79k6vnntSqFSToXbyYt1QqAr8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA1PR12MB6115.namprd12.prod.outlook.com (2603:10b6:208:3e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 00:19:42 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 00:19:42 +0000
Message-ID: <58f33eb8-ae56-416a-ab23-2690160756cd@amd.com>
Date: Tue, 25 Feb 2025 17:19:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: fix type mismatch in
 CalculateDynamicMetadataParameters()
To: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>
Cc: Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Fangzhi Zuo <jerry.zuo@amd.com>,
 Aric Cyr <aric.cyr@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20250222235818.1990-1-v.shevtsov@mt-integration.ru>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250222235818.1990-1-v.shevtsov@mt-integration.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0154.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::12) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA1PR12MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: cca57985-b6bb-42ec-58ec-08dd55fb43bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzFubG0zYS9XcWZMMDRFSFVyRFNLRnBtd1JYZHdJMWZjTHBtTk1wdDg5NWNI?=
 =?utf-8?B?YVVGdStLOUZYSWJOUitKSkpOTmNZKzNNWXZMRU1QcVNDMEJyOGNKZ2FmSHAy?=
 =?utf-8?B?OGNwMjNwR3JQUEFEcmhRRHNlcXIyUGkzRGZPb1ZOWGUvRnQ5S2tVdFYxdnZq?=
 =?utf-8?B?MmdjWnYzaXk3QWpqTUYrajFoRUVuYUpOaG5acE8zSEVteHRWU2diU2syNzVu?=
 =?utf-8?B?cTFzUytWN2hHeGFiNlRBeVdhTm1FcURWV0NFZ2czOVNSdXgrVzlZcFdOK0g4?=
 =?utf-8?B?UFAxdG82ZFFvWWtHeTczNTAyNUlJU3BhNHJWNHRtaE5JUEJHbkF5c2Q5OC9C?=
 =?utf-8?B?a05sZ0hlclpDTW83Y042Umo2b0FteW4xZWxVbzI1QS96S2R2TWVQNy90WnQv?=
 =?utf-8?B?MGdpODhUaEkrZGlsM09hUFI0S1JqV0dTbld2ZG82dHdvNzVqWVU1L3Y0Y0lk?=
 =?utf-8?B?VU9OSlRzOTB6Zjd3aWVMNS9HT0Mxczh4eHhLM0lQYkhtbXRpVnBhNzRrODRQ?=
 =?utf-8?B?ajNzeE1pQmFhZnhKTWdyRXo3UzhHcDlrTEUvbnYxanUxUDJaaUNISFovYzZj?=
 =?utf-8?B?b3R6cklncTdITFkxWm5XNUZNVEFQTnI0ckRXM1N1cFo2Q3ZuT0VlbC84c1Vy?=
 =?utf-8?B?N2pmRjdwdDNjRVZnbnIwT1FGbnBpWWcwUnhVOTBmS2Y3cWtBK3dpMHM3bHNR?=
 =?utf-8?B?RkxXTEhVajd3UTJCSGhabWgvM0ZTR0pmSWJxYXc0NFQvSlJHMUxxQnRGbmox?=
 =?utf-8?B?cVdwRG1yOHhoWmhQajVuV2lReE5DOUFtZkRocXVrWnp6cGtMcTRZU05maEFN?=
 =?utf-8?B?bVNHWG5LRHdTSjQ3UzYrY05MRVBRNVErTFZUd3k5UE9PYW12WGovSGluMWsr?=
 =?utf-8?B?SncvWVFGYWk5YmkvQUdDa2tkYXJKTU14YTJFZGJqbHRxNjlHdFl2UXVlamxa?=
 =?utf-8?B?OGIzb2lBaFBwd2tYak82S1F5WWFQazg2ekFscUdCSzhiTVF5dGt3Z25DbWJ1?=
 =?utf-8?B?cEpsVXJwOTNrLy9DY1YxejkzVzNwM3dqRWdQN0FjbGc2UWxpbnNhMm1pYVQy?=
 =?utf-8?B?bjlLcXg3WE90cXFzbEhNTVFWbC9vaStla2dWeEFZMmNaeWhhV0hvUXZIekRO?=
 =?utf-8?B?bkZxS2JhZmo4bDNHTVlqY3FkY09ZSUVueGM5YnFWT2FDTFd0YThXZmZWMytO?=
 =?utf-8?B?ZFJNMnkxRkU3R2MvdnoxSnFIV1BSOXF6VGgvYm4zTVNBRTdqMjhKT0V0VnVT?=
 =?utf-8?B?dW9rdnFYcklHalo2N1lETzVIaUdPdWJGbmFET29aRmtPOXBXK21zNGx6Zm5Q?=
 =?utf-8?B?S1lYaWZmNklKbVlwYitRYldjck9abzluL0F5Uk5JY1REcnZnZWVBS3BHTWF6?=
 =?utf-8?B?ZW8wQ3Y5WWtxditqaG1oMENlVGJGMmdRUll6eDVqYTlncGE2dVNNa3N5ZFJx?=
 =?utf-8?B?UTRaTHBGT1dWOW1RWHdtRy8xZUZFWkxEaFh0aVlnMExpYll3QWQ2bGx5dEpr?=
 =?utf-8?B?N2R5S2NKak9xWGVFNWRZQWtGa0xiU1hKMmZLUmpuMzZiWEo0NDRyUUxUcTNY?=
 =?utf-8?B?RWhzZGF2NEYwYVhYZDcyd05DTVdzaXdwendtSDlaM2FYUG5EWHFYTWxaK1RO?=
 =?utf-8?B?dStuWmp6aDVQOGVlN2R3SWpjRHNFM1RQczVvTmhzMmxqMUxUdytZTkR5cHFJ?=
 =?utf-8?B?dkFXckJDVStzcjVJazYxZERpUS9hUk5mZFpTWnZtL1dsc05LNi9wODNkWmRp?=
 =?utf-8?B?RWxERVMzenNOclFkZnRSZVN2UVVsUDJWSzZmck12MDVMMFJJZy80Q3dMcTdK?=
 =?utf-8?B?WGRDMlBUN1V3S1ZnbldCVlFORXBTK2hocTUwUUxGR3BENGFrTC9CMU93RDZu?=
 =?utf-8?Q?qQC7nZB+0rhFu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVhTWTFVaU1DNnBVMEg1R3g1ZUViYU52cUpMWlJPczQ0MVdHaW0wNG9qaUEv?=
 =?utf-8?B?UjRoeWpVV0V0cldERHFjeHZwUWVzWmhDSm9lVTNpa3VreSsvcEhIeUt1UVND?=
 =?utf-8?B?S1ZYaFg0SWVOVmlPa1RaK0JwSWw0SlU1UkFsSlcxaFBSMTVMeUlSQWJBeVVk?=
 =?utf-8?B?dkRucjNOT293cDJuWHJ5M0V3VURXeG90dnVJM01YcGhpZENjOVFYbWlEbjNQ?=
 =?utf-8?B?TFd6c0xoZnAyeTU3MU0yYXRKamRpT1pIK1Z0MWN6YnFNMnA0YmVvb09sTE01?=
 =?utf-8?B?N1dMZDlBZEwrem9lM2hraVd5ZE8vbGE0alhSdHYzQXpmTjF6Tkc2TDdIVWlQ?=
 =?utf-8?B?SVZKb1prTWg4VDJ2R2RRdWUrdWFMMjBEcDRGQTBuSERmTzhoM0lzR2xlSEt6?=
 =?utf-8?B?djR2SGgyeG8rM1ZGcllXdjZoaktoYUs1UUNmM2ZndGZpSGZvQ2ZYaG1ubGNH?=
 =?utf-8?B?TDZSdGk5c09wZFdUYUI1VUJTRi9pR1hxWEVFSGZUUFZ5a2ZLYUFsL1pBREM1?=
 =?utf-8?B?cG90NU0rL1ZSNDZvVFhrVENNMFdrWkhWdmtvckJuZEpEOHp3TjVLbDkzQ2VY?=
 =?utf-8?B?R0hjaVNmV3BQVnRacVgzanVzN1Rrdk8yc0dlNTE1YVBPT2lRK01KTnZSY1ZI?=
 =?utf-8?B?bEhMdE5sYTIvZzRHbW1TRHBxRmZWS1QxR3c0N05DL3phRnJOZzJ2Uy8yS3F3?=
 =?utf-8?B?RXNJQlRKaHhCWk11UEdHV2tHV01LVWh3ZkxtaVNBaUhNRmpMV012TUI1QkpR?=
 =?utf-8?B?U3ZXTzdlTzV0RXBvR2g3WTNOMlFMbmVraHlrM1ZXZEE5REkyVi90WWg5SWM5?=
 =?utf-8?B?c1hGYlJ5UnIxNzkvWTg4MnBvYU5XRGJRdmtVWVIyaERNZzl3blJkdmRMTEFE?=
 =?utf-8?B?MEtyblhmNjB4RkVTeDlacHE0R1FRQi9sSURhNUwvemtVTjh3UU9KelpkbkFI?=
 =?utf-8?B?QzBHMm8xRE51VzVlYktOYnhBOVkyZU96RHFFa2tqL21WS3ZZeUVHWVovYm9j?=
 =?utf-8?B?S2R3YjE0NFRBbTNYaFRyZVBicHhkc2xZNW05MVd4eXVMbE5rZkhGejMzTE05?=
 =?utf-8?B?TE5kUFZKaFdnZHpibTNxZjR1dVJKSGhpenR0Kzk1WTQ3R3o4OGhXRjdMQ0tY?=
 =?utf-8?B?Zm1ENXRodkVKdWlPWFd0NU1BRmhnYWVsV0Rjb0RpOC95alFiaDMxRUZvaVR0?=
 =?utf-8?B?MUkvYUhIRUF1R2xpcmh4MnM0TEgyNGRuTnRQOWs4RkdkYS9MZmgybFp3dVN3?=
 =?utf-8?B?cGtIWkxvRE9SQ3dodHNUczQ0dDlnSk01cEZMRFdnYWIzOERMdmpnSkNocDV6?=
 =?utf-8?B?Q1JWUzYxV1psSnZrMHYwcG8xd0ZGa0I0NEErMitIRW5KY1o2cE5XOEZNV2FD?=
 =?utf-8?B?RVZQSFNhd25uaWljTVZNVjBtd1hSd0JRZ0txc1dwa2ZLWmNuS2FLWE9BNUZt?=
 =?utf-8?B?bWJ3YkZMckppT2hzN3Zmdnk0QXU0OXBaRGM2b1U3ZUhGN2lTN2VZMWZ1L2tG?=
 =?utf-8?B?U3NkRHNwSFR0STBlTEorZGFoVys0SWlDZGtLcW1ybmNTekxaNkRCYzFQbmts?=
 =?utf-8?B?a25wZzE3US9pc0o0NktvOUh3VFdlQUZwR1dzN3ZmQTVWSWZzdmM5cGJrZWtG?=
 =?utf-8?B?YjFwd1NqVW0rL0NjS2hMeEV6NnE2dTJSc21PUzV5NlJUYTRXZVlVVnJuVFAy?=
 =?utf-8?B?UkxuNTlSMXJ6MkpiR25QVk9lWmJHK0QrcUhiQnNLU0dqOHpXbC9FZVQxanRZ?=
 =?utf-8?B?N2V2YTJPRzRIVHlDY29IUXVodzlybG5nekttbVUzMmhxT3NnbEs3WW80ODFZ?=
 =?utf-8?B?c3lPblVnNThFMWpSc1ZwdVFtMzY5Nnpzc2czTjByMXFDWEE5bFhhUGY4YThj?=
 =?utf-8?B?Q2lMR2ZRd21rMWJsRUNPaXhsdnloOEZrcnJpOGEyMnFGaWpYb0RvL3V5bkd0?=
 =?utf-8?B?dGgxVDk0MHRiSzdXQ2oxSlVJdlphVjZNSDgwRW9jUFBFdWVrd1FTWi9ZblhD?=
 =?utf-8?B?dE1ZVVNqOW54RWM1L1p0Ujh2dGtpUXp0akZrMEZqQWttK1huZjBNcmt1TjM1?=
 =?utf-8?B?OEU1aHRuRC9VWEUrV1ZFSm96NWNYWjduRFdCQ1VrcHBYempsUVBDbDFSQ0Qv?=
 =?utf-8?Q?7po2a0swzf1uOqyFLoZOY3E+y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca57985-b6bb-42ec-58ec-08dd55fb43bf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 00:19:42.0185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXN1nXgQqcJX7gysrTLnFNAOuo10JPUIwLUUCH6FEFGra9wiCqV9/nUih3252hU7roBPjq88oP/6c4Eea/eLJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6115
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



On 2/22/25 16:58, Vitaliy Shevtsov wrote:
> There is a type mismatch between what CalculateDynamicMetadataParameters()
> takes and what is passed to it. Currently this function accepts several
> args as signed long but it's called with unsigned integers. On some systems
> where long is 32 bits and one of these input params is greater than INT_MAX
> it may cause passing input params as negative values.
> 
> Fix this by changing these argument types from long to unsigned int. Also
> this will align the function's definition with similar functions in other
> dcn* drivers.
> 
> Found by Linux Verification Center (linuxtesting.org) with Svace.
> 
> Signed-off-by: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>
> ---
>   .../amd/display/dc/dml/dcn30/display_mode_vba_30.c   | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> index cee1b351e105..c6c7ce84e260 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> @@ -281,10 +281,10 @@ static void CalculateDynamicMetadataParameters(
>   		double DISPCLK,
>   		double DCFClkDeepSleep,
>   		double PixelClock,
> -		long HTotal,
> -		long VBlank,
> -		long DynamicMetadataTransmittedBytes,
> -		long DynamicMetadataLinesBeforeActiveRequired,
> +		unsigned int HTotal,
> +		unsigned int VBlank,
> +		unsigned int DynamicMetadataTransmittedBytes,
> +		unsigned int DynamicMetadataLinesBeforeActiveRequired,

DynamicMetadataLinesBeforeActiveRequired past to 
"CalculateDynamicMetadataParameters" are int instead of unsigned int. 
Can you confirm and try with Svace?

Thanks.


>   		int InterlaceEnable,
>   		bool ProgressiveToInterlaceUnitInOPP,
>   		double *Tsetup,
> @@ -3265,8 +3265,8 @@ static double CalculateWriteBackDelay(
>   
>   
>   static void CalculateDynamicMetadataParameters(int MaxInterDCNTileRepeaters, double DPPCLK, double DISPCLK,
> -		double DCFClkDeepSleep, double PixelClock, long HTotal, long VBlank, long DynamicMetadataTransmittedBytes,
> -		long DynamicMetadataLinesBeforeActiveRequired, int InterlaceEnable, bool ProgressiveToInterlaceUnitInOPP,
> +		double DCFClkDeepSleep, double PixelClock, unsigned int HTotal, unsigned int VBlank, unsigned int DynamicMetadataTransmittedBytes,
> +		unsigned int DynamicMetadataLinesBeforeActiveRequired, int InterlaceEnable, bool ProgressiveToInterlaceUnitInOPP,
>   		double *Tsetup, double *Tdmbf, double *Tdmec, double *Tdmsks)
>   {
>   	double TotalRepeaterDelayTime = 0;

