Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B38A46A0D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 19:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB4F10E9B8;
	Wed, 26 Feb 2025 18:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WumaBWk5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2079.outbound.protection.outlook.com [40.107.96.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD8210E9B8;
 Wed, 26 Feb 2025 18:47:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GayRiyoArYhfOA3wy9QwEFTqMmNDhiRTII6BwnG5AXwwA1ocL1Nat737Thpp3DjmgV1moqJkcZYMVsYtkQL5RN/BeQgRuZw64bqIytcdbjC1y0nLhud/rqCvuFPHMG4zu8Zrab8AEYYmqDNci8xqkC/rY6ekDzFImumczMqECyz0H7lrR66L8RwysflLryXsvyFfwJvFHvNTOGrIugv5rR27k4TfjP74FsXtEKyKpSb/g//RpskbUfurXCZGeGsmoFETg6A7k5ruf22/SKb8AB7OKidJm3iFfrYEZ7deJ43O3XX5bBuJejP4SJoDoPjQtUkWVny9qppJv5u5K1o50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yOxEDnsDskv3juzcK+EYT613AdVeyzWA3PEv9FVfec=;
 b=Axv5t9/QdqkfSZDG7D/HnrjL0mx7GkRTLMTFoFc4wy3rwg0AoDjEF2P+jsalJ8kyUK2RslheL3uRgQIG+VnEFxmuSir9UibRyY67AHOzkQxEwBHJeBerqxYIOU/te8rzyplKUDBjtjDLRK1VvdLxzYy2tN/vwCKwqk33b59XC1xydaex8BedTKlNFdZR8/byn+5ei4xSRMcyp5AUvZy1CJGytNK9ut3wLFp0vOXn/rsPhyJverkxwDWn1y6plSB+gstBKXXKoSMNO61tE0HMo+ge2Meu+JFFxX2qfvVQoSxHgGSt5PmbYGYDwmDEyzV/v0cEkDAdzr/2tosoUrOZ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yOxEDnsDskv3juzcK+EYT613AdVeyzWA3PEv9FVfec=;
 b=WumaBWk5t/kCesdH7EkA/KzBukMesp+V9OSa+0Tr3UE+YMxyzJXk9pihCz0hTA4dYNsFbcw5aHoRfVGxhmoNu2qOkw/RlXr6CafVoVuLvGqQmtZ6ClZq0WDdd8gcHPGy2yn+lazpQQ9Cd0kZ2TS6dwsviI1kvJFdAgRZ7xR1Jj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH8PR12MB6771.namprd12.prod.outlook.com (2603:10b6:510:1c6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 26 Feb
 2025 18:47:51 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8489.019; Wed, 26 Feb 2025
 18:47:51 +0000
Message-ID: <749a1601-fa9f-468b-92d1-1a1548a08471@amd.com>
Date: Wed, 26 Feb 2025 11:47:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: Fix null check for
 pipe_ctx->plane_state in resource_build_scaling_params
To: Ma Ke <make24@iscas.ac.cn>, dillon.varone@amd.com, Samson.Tam@amd.com,
 chris.park@amd.com, aurabindo.pillai@amd.com, george.shen@amd.com,
 gabe.teeger@amd.com, Yihan.Zhu@amd.com, Tony.Cheng@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250226083731.3584509-1-make24@iscas.ac.cn>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250226083731.3584509-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1P288CA0032.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::45)
 To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH8PR12MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: 149ab81b-5a5b-4d55-dccb-08dd569612a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWZrcWxJWTIvS0dqdVN2ckhMUSs5enNsaDZsTHE4cVRNOEdmZHAydERiVkYv?=
 =?utf-8?B?MXY0UHlnSklsZUtqMlJuK2Y3Wm9nckFyQnVtYncxU2lrVU8ycmVHaGhsUGky?=
 =?utf-8?B?K1NLalhFWERkKy9HUDhEdTM1STlodFUvOXg1UHdhcnZKT2RieEhmV1dKMEx6?=
 =?utf-8?B?NGVHQXE2T2JzMERaSUI4Y0pFVk1jL3I0NjdNamRFVnRobjRhK2dNeVpxWWFC?=
 =?utf-8?B?SzdKNk1tclFMUjA5L240UDZzR2Y3T1ZFczJyL0hOYW83eGtnUjdKZWZ0bkVo?=
 =?utf-8?B?anVFalgvR1Z1M2pJbmMrczVpR0t0NTNsaCtKSTkrQWs2T2Q5aTgxMEk1K2Jz?=
 =?utf-8?B?YTFtMVVQcWorZXR1WEFrOU1LM0VROVFZVm5DRVNFeDN3QWVtOHBCa3VXM1lr?=
 =?utf-8?B?MnJYekVWcGxaSUt5SFlmMWozc0cvTGhnaDVudTVERElmb1VrdDhTSm5OemRP?=
 =?utf-8?B?TVdIREFZSzJWUG1JRFdaRFFEeDZraFRlTjlWLzA5Sy9RdXdsR3BmQU9QVHRU?=
 =?utf-8?B?NnRGUG5mWGM5dlFMWUd2SXMwOUg5MTJhdHovMThFUi84cHpiT1FISURnaWpD?=
 =?utf-8?B?cWRHYnFlMUVMdm9KS3VXaER3NVlvUnVNUjRXTWZPTXZNQXB0bVR2NnlsamxJ?=
 =?utf-8?B?eENGR1E2YmpOMVlXU3c2d1dYZHdjVzU1OHB5ZVNRWGFZNjhacW5HMVpSdlh5?=
 =?utf-8?B?Rm05RXl6TVNUWW0wNkdWZ2tFNGZhenNGU2dLR1NDQlROcktIc3J0MW9vVnNN?=
 =?utf-8?B?eWxrMWhVWWE4eEViTzhNSS9nZHJhWUF5T3BGbFhlODdtREE4dlZOWEhXN0xG?=
 =?utf-8?B?aVgvMmlzc0ZkRXRpckdoeTBLMFprM09DVEo0enBmc3crRjNqbTZKVWtOM2VS?=
 =?utf-8?B?eGg1RW9uNENMVXRpVElNNjAvOVhKdWgyUEZ1THljbXlCTjJYZFRIeGw0TjdS?=
 =?utf-8?B?S1czcndzZEZMZWxvTmljQ3JuSVhaQ1dpTCtHOWJnOTJDVWQxbXM3OVpLSEkw?=
 =?utf-8?B?aWJUdEttY3BLVzZ1anBtaW5yajA5N2RmTU9oZXF4VUNWaVYxeDBlUVBuL1d5?=
 =?utf-8?B?Tzk4bmZTSlZhbHdwTXphN0l4NCtBMWlqNDhVOWd5RjNGNnNCTUIwMkZMR0Vh?=
 =?utf-8?B?UTFraDVCSUpJdlB4akZrd0ZMY0FkNXIyME1hZnNaN0dId1NwTnZSRUE2cWZK?=
 =?utf-8?B?MzNCcS9RRis4T0lwb2RMVjMrdjh0bEdmUVRKVklqNWNNbmx2SU55dmZCRjJX?=
 =?utf-8?B?U1ZZOURlUkRFTWt3RTA2Zk9lcUlKWEdmTzduZVMvUmZXT1dkMlArMGVMR2R0?=
 =?utf-8?B?R1VDOCtOb09HWkd1aWRxM0NlZWlUZjdvcGF5WXFVblIvZzhEV3Vua3BySTFz?=
 =?utf-8?B?OTdJSEVTRkhpbWZ3RFhPV2I5Q0dFN2wxN0NzNkJjaXVsdjR3TlFLVFg1ancy?=
 =?utf-8?B?d1VaZm9yV01DbDArcFZoeENIcjNIMjh6aWVNeG5tZURuR21tdnQ0MTEvWFBw?=
 =?utf-8?B?UGU0aXZ5ZlhMYWVkTTRXN0E3K0JJVEIxNHlibjlqaWx1a2cwSG10RTEzSG55?=
 =?utf-8?B?UnA2VzlxcEFmbjYrb0VTdTh2bjlOb0hJVjBnRGRFVzM0bUhreWlhMTlIaFhj?=
 =?utf-8?B?cjVVNUtaZ0FhamZ1SjZhSDVZZ0l3WndWK2U1VlpZS29IMFdhem5CRzZNN3ZX?=
 =?utf-8?B?YzZXemxUNkRLMW9ndzhreDd3UTYyUEUvMnBxNE9aRks5M3BsejlZbFBObkhU?=
 =?utf-8?B?bm1TVU1MOGRQL29uZlBndEpNanFCYnc5VUFqNFZVQXcxUnQvaTFvc0JwUVhD?=
 =?utf-8?B?SXowNW5zM3F0NVZVOWR0b2lqZnBjODJOVE1YQUNPSTl2Uk1KeFlCWkZtTHlS?=
 =?utf-8?Q?Uph7w5N54nhii?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmhhZzNLbkNVSWNMOHhWdXRGQlRQMVF0RlkzdG1MazgzV0s1eTdlZlJsQ2Qx?=
 =?utf-8?B?a3NtZTFtRkJzS1NmYy9aY29oUjNkek9tTXdjK2VRR3RSSUd6aU9kTEs3bXd6?=
 =?utf-8?B?ZlBtaldTLzRuc0tFY2RZU0R3TEhFdnMzTUpIcEZrWmtXWUZaWFlmSW1mcWs4?=
 =?utf-8?B?TzlRQ28wb1hnYUd1TjI2N203Y0RmM0xiVG1oeXRHMTZzUkl4SGk4RlBPWmUw?=
 =?utf-8?B?Z1J2UXdOTmVjL3c4YWlONFE4T1ZwSXBrNVF2T3pMaVVOVzI1eUQyeC9Dc2J4?=
 =?utf-8?B?OVBOV1N1bDJQRmFiNmR6NnlFVnBxNGY2ZW90WitZR3pUSGpBQ1YyQnRlTHN1?=
 =?utf-8?B?NTE0YitHblJpT1JCejl1UktJTG82NmhEeUU1c3NLVW9MMWgyVGFpWk9rUmRh?=
 =?utf-8?B?Ym94aUtmc3dnS2M2Tll4ZE9sSEJkaHhNYjRPRThXTk5Ya0g4c3ZCdGUwUnN3?=
 =?utf-8?B?NVZqWDVrcmZvQkpJNHZLSUFNQTRBQXpyTHNhdmw5Nm5JNnE5cUtPcDZTNW55?=
 =?utf-8?B?Um16MkE1TCtndVhlQ01XVWp5ZVVoZ0l3c3ZOUmRUQ09NRHJZUkk5SS9kSi9K?=
 =?utf-8?B?eTZyWDN2WHhUdWJ1UHplVExibUFVM0k4dklBRGRUeWJnR2IzTmJ1R1pBSDhl?=
 =?utf-8?B?SkVPczBVRUxDMTNIR01UUXZlNVl3bGtST0tIOXdMeDYvYWlqVDN2ekRSZXkv?=
 =?utf-8?B?b2dWbXN4RElNTWJibGZnNWhISkFyeXpsVmtoeGszWjVEdUlPTGNuT01NaG13?=
 =?utf-8?B?alRZcXBPcHFNaFg5cDE0eVltL2tCR3hkckZpaFZRNjg0WDJxcjJyMkgrTmNr?=
 =?utf-8?B?bU50R0dqK0tUcEVTbTNGVFdCK21HeXY1WTNXQjZDK2NXVzh6bnM3YTEyRGNl?=
 =?utf-8?B?UXJrYy9OL1JqSExTZTlRbmRYY3dLN2xBOURDR1BFOVZuRUVKMjZ4ajBKTEtL?=
 =?utf-8?B?dWF0ZTcxcTZReVNyeWpzL0c0c3JoZ3pXcGlycXE2Y3MxMHJ4dkJVTEtWN0dM?=
 =?utf-8?B?L0xlU2dsb3ZzQTJGM2ZzYm9Scm4rL0xWVlZhQ1hqQWl0QXROU0Y4cVBiOGxM?=
 =?utf-8?B?d0Mrb0w5SnJzTE40K1diQ2NqeERDZHB3bjFRWTlERC9hWGNobElLY3hISWVw?=
 =?utf-8?B?ZmxDNHkxSlBJVHlzMEUzMjZmaW5ObFk1YVE2UHZyWlIyLzRQSE9weE9TL3FD?=
 =?utf-8?B?M1RQL04weWFrK1Q1cmYrVzQvdktXeVBqVGgvQ3dvYlVrb1F4UDk3OGRvdCtj?=
 =?utf-8?B?M2FUd3o4ckJTVHdTRGNCZWE4M3pBNmM4NUpXYVVOU2l4dlVBT2Rkb0Izckox?=
 =?utf-8?B?cE5ZSjZkZnZ3ME5JZkRqSkhnRTV0aEFLSGhzRCtFUG5BcE5RNFRoNkNvQmZ5?=
 =?utf-8?B?bW9VU0g4RHdMRTVZQ3pFSU9pZkkvUmNKeVZIQWplRnBvWUQ2dFRuVlljY3Vt?=
 =?utf-8?B?c3pWUGlsbFR1dnlDeUNwVFhWaFV1dlRKcmIvR2NhZklBTDV0ZzJnNjNZd2xv?=
 =?utf-8?B?M1JjbzhMeVR6ZkNkMGE3dDJZZ0diaTFHRlg3TjFQRVFSS003S0tSbnJOSS9h?=
 =?utf-8?B?cm84REtuY1h1TGhXd3RiZGRCYjByOE1UK2lJRXpDdmxEMzJtajVtS2NhS0d5?=
 =?utf-8?B?M1BMaElPN3VoRGtwRGJ6T0tLVmF3UzUyWDB4NlJWYUt3UXN5M1pHb2VDa2Na?=
 =?utf-8?B?ZldzYmUwTkw2SFZXSmkwV3o2cGlRQW5tUm9EVW9qWHgxNkFHNzR0a3V2dmp6?=
 =?utf-8?B?aDZpdk8xU3drOUt2QUZhT09ueG45S1l3R1J5MFdndzFJY2NLK0VXVUhQY0dm?=
 =?utf-8?B?bC9ObkxRclZrb0tDRVBVY3Q2VGp6Y1pKb2o4bDI5cmhnWnliTlUrSmpFaVhp?=
 =?utf-8?B?cW9kTnZEY0hGcDJwK2NTTUgxNnJYdHFDdTBNNnNoTVZwOFpxZnRNU0ZVdFBB?=
 =?utf-8?B?c3gzTk5kalVFSzBUVDRQRnpDNkJwSGpvUC8yNWN1OEN2KzNUWk16Mjg4Uzla?=
 =?utf-8?B?TjFJQWNTcHNlK253dC9PZGkreEJCY1N4c21ibTJOVVpTZFlKRzNTYmVtRmdB?=
 =?utf-8?B?WVNQK1BHNDJSQi82cm1uMDlhVUMvc2lCUWl1RnZYUUxoZlVJeDRtckVtQ3BT?=
 =?utf-8?Q?H6utNtJ9ovz7XSLE1Vp7zPY0P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 149ab81b-5a5b-4d55-dccb-08dd569612a7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 18:47:51.6171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oibc533VW0VoaY5eE7BlLtlZmA27mQADjI0OxzUbkKwi6t0xr7wk7ebWo1SGGp8bfTSjpbGbpQSHUac9raSNfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6771
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 2/26/25 01:37, Ma Ke wrote:
> Null pointer dereference issue could occur when pipe_ctx->plane_state
> is null. The fix adds a check to ensure 'pipe_ctx->plane_state' is not
> null before accessing. This prevents a null pointer dereference.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3be5262e353b ("drm/amd/display: Rename more dc_surface stuff to plane_state")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - modified the patch as suggestions.
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> index 520a34a42827..a45037cb4cc0 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> @@ -1455,7 +1455,8 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
>   	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
>   
>   	/* Invalid input */
> -	if (!plane_state->dst_rect.width ||
> +	if (!plane_state ||
> +			!plane_state->dst_rect.width ||
>   			!plane_state->dst_rect.height ||
>   			!plane_state->src_rect.width ||
>   			!plane_state->src_rect.height) {

