Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96F6918DAD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 19:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B22010E987;
	Wed, 26 Jun 2024 17:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ao7A6WQ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D933710E983;
 Wed, 26 Jun 2024 17:57:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwSSZXJevxv1tZZSzh30XT/iFUe7f/H99iBGY8TzAyZ0CRBjH8BEEle4Uftm7G1EB1chOsip1FY4arR4JwZ2+XkBhBJvAwcOpLMsmzFIE/LKfGRZ2jdDNjU+aAd3p98jftTwLI3etCPRVapaD8zTnhdinAgWpUCjnUfb+B03tUM5Jy2ugv+bo7IjihSylbz3pm7tlNEwW+ScyZfmpHUMpf20BO/AGOm5EQ7L0157XN5RUUBIhZpgUhUqZHRZ2UGyI8gzdTXD56ULe4d+/S9yu1D4knk81LPQcxi887ti2D2ISiiejMXAFGJOe+x0BnCXnEpyWCdfYBfDBgnZHYjQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mi21xCIz9cR5aIStkZMvJXwFYTr1EP9RridN457rm9E=;
 b=PKcOe+6NYwiH8141440YmLOgDLFkJigCVRcoAHnNE3L1j4SPF5K9466ZCN3Pjs/NpbvjiGIv0+I+ybRGaoR9xyrh/S8MS3V2wwxawHej2+ITtCzCu3iKeiJvDXxortSMYGPmwJEpYqczD2J1GzM8dJEznSgJMZ+0Y89qoT1U5nN/CC3/tNG7ZFDi6xNp1ngdczKXhYfz4uxP05zX2Hxa/KyxkgOuFKDDr8oYR02mxaACDYdCNf1YmELJiTqCbTSrQBoO4Q200c+GCL5HI9cmbPfDI/ratkcrnQLrD5AMFhuGqwxTUB4g4mSfzJc9CuDT+L1WrrBbNfF5z1ZN+l8+dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mi21xCIz9cR5aIStkZMvJXwFYTr1EP9RridN457rm9E=;
 b=Ao7A6WQ8zaZ3ao6NP89UVkRwX8Q2SDFb5WzbkSPBMaD8pieY79dh3RpwEoLmrX5rgrR2a0/RoA0o0qDqprAyJAB67PNrBSQMeK9ro8W7QIZoDnHdGwQy4GbDluhpISA+IvXk6m0pejtgkKURbqNn1x/WkJSqzXtX8TJ3zkBIp7Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by CY8PR12MB7097.namprd12.prod.outlook.com (2603:10b6:930:51::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Wed, 26 Jun
 2024 17:57:09 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%5]) with mapi id 15.20.7698.032; Wed, 26 Jun 2024
 17:57:09 +0000
Message-ID: <d62e10cd-6e27-4498-b90f-3ec891686070@amd.com>
Date: Wed, 26 Jun 2024 13:57:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Add null check before access structs
To: Ma Ke <make24@iscas.ac.cn>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, jun.lei@amd.com, wayne.lin@amd.com, dillon.varone@amd.com,
 nicholas.kazlauskas@amd.com, Qingqing.Zhuo@amd.com, stylon.wang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240626130650.2866706-1-make24@iscas.ac.cn>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20240626130650.2866706-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0091.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::26) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|CY8PR12MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd2b6c6-01c6-4a05-526f-08dc96096633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|1800799022|921018;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ck44RnRlclhJaFNTZ0JiUmtMYWpzdk5YcUxrdnlYMzJKYi91UUNYV0lyZUlY?=
 =?utf-8?B?M2IranFwdzRGSDNMN2c5ZFR2b2RXbjV5a1pEOEIycDFGZ3pLUjI0eS9zTHdI?=
 =?utf-8?B?TUNUalN4enAwanY4MjVCdGlQRFRQUHpyaFRud2ZwRm5EZVNieGQ3R09ERElN?=
 =?utf-8?B?NkRRSDBBN0FEdlBPYTBSMXgzQzRGQWNUVC93ayt6aTFqbDJKRk02YllzT3g3?=
 =?utf-8?B?a2tVdFZxeXZqazZIRHZ6TmZtY3NOVS9GWGYrVFV5YWp4L2E2eUVVdGplWjlZ?=
 =?utf-8?B?dkhITCt1dnFLY21XOW5LYk1TQnh4NE4xRVFFcUF0ZmNRLzg4Z3dmNXI2ajhH?=
 =?utf-8?B?ZlBoenh2bEhUNGd0RmFFaHIvYXBLSHFTNjA5OCtBK0JpSS9ySS95UmhqcytR?=
 =?utf-8?B?a0tHUndONHVnQXdPeFhiRGgxMTNZa1A2Wnl2N0VHWEdaV3BpMm1ueVJpVksr?=
 =?utf-8?B?NHB3UDd5QjNwd0x3UFRLNHNHVjB2dXMrNDNidW51SjFVMHpJMFVxTzh4R2lM?=
 =?utf-8?B?cFVtQ1ZNN0hyUmZlZ3AwcnllUVNvWE1xMUVuRlZ0bkd2Z21lWjdsZVB6Nms0?=
 =?utf-8?B?dmJTREZ0YjJoVEVxNUNnci9lZ29OM3lwM0k3UmJzYmZrZ2IxNnZuRm9GMERs?=
 =?utf-8?B?YlR4SUhMalB4d2QrK2VJR09EWk5lTWY3dGxyL2FZb3JLSndrMUJLc3NCSUpH?=
 =?utf-8?B?UFloMVRoeGRQR3kvWWw1bi9GMFJjcmhDZU1NSk9CeGJGVlU2UlJkbklRRDI4?=
 =?utf-8?B?c0hlK2ZldlpKZ3AxNWJJek1jUElNTkw2aXJQbFRTM0ZvbWNWeUptUGlJdlpq?=
 =?utf-8?B?WFdBcDlPYm94VVdZbkhtS3NyNUw3d0JpQVY0SjBMcjFFaGRwWE1SNDJraUsy?=
 =?utf-8?B?c2VTK1NPRlpwVnRzTWt5SkFrRHBwZE5xWVlaUHZTNHJpYUppWDQ0MlhlR0t2?=
 =?utf-8?B?cHE5ajJjblBBUzZmTktjblZxU084alh3Wng0bzNiemNlMjVCamRweW4wVExN?=
 =?utf-8?B?OXF2RGt5MlJwU2lHZTlOZlJ3WGhrd2J0VG5lbGJMMTBHOHU1NHcyYmd3ZEhR?=
 =?utf-8?B?YkZ2cEtPZkpMeXdPMGVXd05tUFhPblpMQVRYbWZOV2ZCYkU1QnE2V0dVTSt0?=
 =?utf-8?B?S0RuNWRHaHhVVUFSZWlOT2RKTmtrNXFrVHh5d3EwZ050N0I0OXFGd0p1cnhR?=
 =?utf-8?B?bk1vSkVybUc0d3FlU3l5MGZUdHZ0NFd1Yk8vWVFJZlNmS1dWYnlUVmgwcnlt?=
 =?utf-8?B?TWJldWxCZnNwMjNJcHAzNDdsT0tzUWE1Z25rcUk1elFWa3k2aHFYRTF0NjV4?=
 =?utf-8?B?YVkvUHBYQ1FHNkFzNGwvTGVHcXFtc2cyTHlucFFDWi9ZdXN4K2RrdHprNG1z?=
 =?utf-8?B?NTA5dUFlcFFxMW1udTdHWlJOY01yTTFQWngySG5RS0lsOE1WSUx5Qk1RQ2Z6?=
 =?utf-8?B?YldxME53cENOaUtBNnNSOE1CRkpiNEEzM2REOE1zcmxJODVxdlViQnV4clEz?=
 =?utf-8?B?aEMyTTZBSDRsYW15NWphK29ZTU96VW1XSC8xNGJHblpVc2h6dDhqQXB4MU9P?=
 =?utf-8?B?RUlsczI3RDQyb2Y0eVN3WmtYUlhQOVl1bHQ5dlNGdk5SRXYvRlVkUGJDdHZZ?=
 =?utf-8?B?TmcvWmlFVFlaNkxBeHVtVVFMYXVuZTA2bVlwOUYyV0x4R2F4UTFsenBlRFpz?=
 =?utf-8?B?RFdGcEVsbWxRc09pQ2ZhU3hKdERVVEJxMzkwaVEwYXRKMFp3NmtBTkQ5RWEr?=
 =?utf-8?B?SFRIVVVNZUc3QzQraHk3cWpLZVNnZm1hbS9yQW9KM0l3ZmE3WERrWHdnWkJX?=
 =?utf-8?Q?UQy4jYYofN4b9X66xPn5Lbky/9cymKWK8WKEs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022)(921018); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWV4bUJmaCtXSGYwdEJxcFR0TnJnVUNGaG1VVUdXZTE1bUZLWmtkRVZ6QzlG?=
 =?utf-8?B?M24va0hseVEvUXlJREZzU1lxbzUxdG4rM3A5Z0wrOTlxYjB6VG1ETWlQOGlp?=
 =?utf-8?B?T3k3TzRUWWRVMG1RRzZsZGhvVDVtRzZBejZEUUhGYU5ieUZ4a2hPYjlULzNi?=
 =?utf-8?B?UDZiODlMbUl1WmdOTjhReVFXZzY1NnJyR3MrMFN4US9haWdhN0EzeTI2TWtE?=
 =?utf-8?B?cWZkSnYxRkt6ZWM5WnV4VWY5c1lENk1tRmVPTFpzVExjeU02K0N1ekVCa0Uv?=
 =?utf-8?B?dlFTbUVwcXBFK01HbkVZVVBCVmVScjFMOXdJQXg3MHhSYnBtRHQvRGx4ZjhW?=
 =?utf-8?B?NnRPMThxZnJORFFQUmJXeGZSaFhxYm1rREZZQmxzdFNTRlBVWTFBcVVjRUdi?=
 =?utf-8?B?c1pBRkUxZHNKampHY2llYjZaamlEZHVFaE9XTFdsdXFZVkZ3Y3I3c0JFVkdh?=
 =?utf-8?B?c25QZ1hyNTFsRktSNElsb3Q5dC9mLzRINkVnOFVkQWc4bUs5YWhXQVViNE52?=
 =?utf-8?B?aEFDT2RNVnQ5SUtVS295K21adUJzYjJQamEvNWNaZ0w4dHl5RnExYS8zL1cy?=
 =?utf-8?B?T3owaHlCZmErb3RQeXhKQTdQUGFIMUxXZ2hEeUs2L2VOa1l3cG9JNjJxWFkx?=
 =?utf-8?B?ekFSMm8wQS9YZHMyV1l4bHA1Zmg5bHNMd2FucGlVUzBzT0JxenV6b0xTdVJo?=
 =?utf-8?B?QTl4RTFGSGhrdVBwYTd2RTRsQVh0M25waWh5ZjRCWHVWRTl5UkU3VnZrbnNl?=
 =?utf-8?B?T0Uyb3R3VjRHMWZWL1QzR0RYTzFjcHN1OWw0RjVTb21pcmoxTTl0cnU4WWxv?=
 =?utf-8?B?alUyL3JoT2R6MWFmbmw4QVhVb2Fld0pyZlhYUThLUWt4TVZ6MWZRM3dQNld4?=
 =?utf-8?B?Yk1VcWNFemFnZTZRUlhvVlF0Ky9TREZ6dlluczA0aXlHS0E0VVBwdVhKbzhj?=
 =?utf-8?B?TW5vV0N1dFB1dU1QNHR5UXNGczVZelFyc21QbHNuK0p4M21rT3B0SDI5S0Q1?=
 =?utf-8?B?dFptNFE0UkVZaFlhMGNGOXB3OUZvRW83d0dIZFZpZUlMYVJBNXRWTGR4MzM2?=
 =?utf-8?B?dWRhUTV5N1k0Smc2N2V1cnFsSUlWVXZGZXl0WjNBTFE2SzIwRjNrYzljb0Fr?=
 =?utf-8?B?bXVvNFlJeG55cVMxRDlkbSsrL01MeXQyMjF3VHZ4TC9zbkxiMG0rcHNtbnBj?=
 =?utf-8?B?WEdySVgrSkZDdTNRSUdIMlFjSkNMdGNIU1BCaXVoS0VINTV2a1p0TXFmYURI?=
 =?utf-8?B?UWZrTitpbmR1MFpmMis5Y1lsajN4L0pmY2N4bXhybEw5b2FmRzBkUDZhTnNV?=
 =?utf-8?B?WmxCUk10R0lOOG1qTThNeHJhSytGdGtiMVcvQlJQaDIxVjkvYURpNEJ0OXc2?=
 =?utf-8?B?aWt6RlROc1ZqSHFUOVorbzJnRzhxM3JBVE5RbHRHTDRRa1dLSS83R3BHMWZT?=
 =?utf-8?B?dzhNS05UWGZtWTl2NnF5ekk4Qzg4dkZSUmdmNnRkRk1ZMlpxUkhFVmVCY0Fa?=
 =?utf-8?B?UTE2bHVud2VrMzhVNXVqemlTZVhpSmtxWEFMK2Noejkrb0d4dkJoWGpqUXpz?=
 =?utf-8?B?V0JmRGRjbUs5L2NQMlg3cE9FQ1FSaWgvUG9oaXBLUFhXSHhlU0pmSUgyWDBM?=
 =?utf-8?B?ejVrdEdOajBoU3IzbWRlVWxJS1JTUG1LUHcxUG9aSXkwMmtBWXR2aTlLUzRt?=
 =?utf-8?B?TzJoVkovRHdVMk45YTRoZDYyMFY1Y2tMbnE1NHBVMmNLQ3Jrd2VyZ2JpYXgy?=
 =?utf-8?B?OFc2SU0wMXRLSGJYRHBYRnVwNndEMkhQbktuWGFHSnU5SEx0cldSQ0ZIc3BC?=
 =?utf-8?B?Wmg2T3Z0UWkxbU5IUWVHbmQwWkRpK0hGeDhyVHJiTVU1cHF2UDJPRnpraXZP?=
 =?utf-8?B?UTlqTDF1Z2cwa2w2SW1xbk1tMTFaT2kzNlZYb2p5YjJDcitVRUdQU2JUZ0Fu?=
 =?utf-8?B?OTQzbUlKRjlWSE84NE5lcXVpeEFxRnhRWGJsQTdRa3ZoaU54ZUVOaDFyTWNB?=
 =?utf-8?B?QVVYOEgxZzV1cW1HSGwzN05JS3VkUERMakRwV1pZUS9QZlN2cnBCUE5QVSt1?=
 =?utf-8?B?K3JGR0VWRllEdFRPaE5CWUw3LzZhVC9rNlFCQ1o4dnM1eXJQU1pWeTNYZFY0?=
 =?utf-8?Q?r77VhEsErEu6Dyrs9rvcV5qVA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd2b6c6-01c6-4a05-526f-08dc96096633
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 17:57:09.5410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJJxGa3W6lDtYp97saQo8vbO1vmE0utXA0CRpCBNeHrQbzuv1fToUxPEITs5tzuQDwiLLG6cZAPdAXcRiTHbAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7097
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

Thanks for the fix, I'll apply this.

On 6/26/24 9:06 AM, Ma Ke wrote:
> In enable_phantom_plane, we should better check null pointer before
> accessing various structs.
> 
> Fixes: 09a4ec5da92c ("drm/amd/display: Refactor dc_state interface")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>   drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
> index 282d70e2b18a..3d29169dd6bb 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
> @@ -750,6 +750,8 @@ static void enable_phantom_plane(struct dml2_context *ctx,
>   					ctx->config.svp_pstate.callbacks.dc,
>   					state,
>   					curr_pipe->plane_state);
> +			if (!phantom_plane)
> +				return;
>   		}
>   
>   		memcpy(&phantom_plane->address, &curr_pipe->plane_state->address, sizeof(phantom_plane->address));

-- 
--

Thanks & Regards,
Aurabindo Pillai
