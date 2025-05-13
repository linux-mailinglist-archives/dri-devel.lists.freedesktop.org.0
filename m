Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308F9AB5C44
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 20:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56E710E5D2;
	Tue, 13 May 2025 18:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u52GOBPV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4D510E213;
 Tue, 13 May 2025 18:27:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqLTBTVz+5MQNBpOmCK8QLKmhNttv2q0H9hf8zFVOMDcUbUIClKl6X1mPSRq6G8NXGgkDYmiHScBSlSf8MuHbI4cZFyTJqYWqD/OT9FdeizOqxTFErANzv9PLyrxuKqrgooSoiEEcLWLHMYtdYzwE4hNcWnLokvB0lwkAVh4EdG+tqtQKvrlNPd+ZnfFZ7351+PZh7NYgyPU4XUKsYJZ1VWXSN7RdWUdnFcBztO4znVb+Q8EjmMbiSp9CDvHCcRlEK702sLqIwRz4KSw3lHWymMz2H8KMCjRXiTdreW2wUbhE8OjrpOSRNDJtd0lUFChbav+n9EMIH6LOiLM17r3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCShJ48YGAz4zDlE+Dic00rX5JqVpYj8tInxQteyNi8=;
 b=W7sE1uSbTMGg13kaMNgLByu0z7t8sg4Tdpazz30qGSo6cb7urQXCNg8CxC4gfFefCmso+9p/nrb9oETAEnA7iP3fyOUgBghxFHdB0+sQXVZgtB9FsOTANi8L9P26tCQSklns6mQWPZTcXf/0Zb4UAelfk0XvLos1dfRpSFb86sPawoNE9OmcwdWeo5Y+P4x16udqnX5XJ6DbfGfKoIo3Y/rz/HYhvyjb9g68sVKXWGW0TgILO9por0xQUCW9wXjrSDMgKA5/EqQA2lz5A+hcIEn7vX0EozjPXPVjJNUtjZL/3b1nDljaWR1NNabu6OIASW49+Hs8FOjX2i5kGxlN1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCShJ48YGAz4zDlE+Dic00rX5JqVpYj8tInxQteyNi8=;
 b=u52GOBPVUJlSQYKEA/ZzUczXy9dvorRSAco3LSppKE7WWKck2n1PkjjmlNBwFD84NPYsqkAe2LcUj036xVVc6E3JiOh7iGGs8kVk9ESN1KlGjJDQY06oWKPUi0xtTcpacBFJLCDNZuCxXyCDsLBm+K70jiIllsnJi8wU9MWfsa8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CY8PR12MB7708.namprd12.prod.outlook.com (2603:10b6:930:87::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 18:27:50 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 18:27:50 +0000
Message-ID: <37014944-2ed8-4b54-8136-b2e9b174b4f0@amd.com>
Date: Tue, 13 May 2025 12:27:46 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: only collect data if debug gamut_remap
 is available
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250425205133.317843-1-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250425205133.317843-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::21) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CY8PR12MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bbfa8f0-fd1f-40de-4392-08dd924bddf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czdpQ1JWMDlFVzZZSmQxcDN0d0FPbC9VQXFIekdJdGNWZnozV2RzRXgrN0xZ?=
 =?utf-8?B?RWhuOFJ1bS9NbzlJczdtTWUzaGtIbHozZXhuTnNVa0dVc3IzQTArdmpXc1RH?=
 =?utf-8?B?bnAwM2I1cHlIajV1MUY1Yi9PcEMwOFdrWXUvZ1V2Z2lrRWh2a2Z2OFJRNi9w?=
 =?utf-8?B?MHRrNGVtMkEzdXJBaVBMUnFvalJZMUNncmhIdTV6VjZwcXd5MjhTRDhEbnlS?=
 =?utf-8?B?NjN2V2xWOWw5TTZwQXR6KzUzZ1ZBVFpHeFhDZUVQcWs1dFV2UnBjaXJ3YmpI?=
 =?utf-8?B?ZmptL2t4OEwzMi9DWE0yZTdvc21TcDFGT3B4cDdzazV6WUhZWmJWNnM3ZlpX?=
 =?utf-8?B?TWlhVVM2YVZnaC9WUEJNTzBFeXQ3WUpxcjJEZlovb2c1dEpIaDFHWHBzMEpK?=
 =?utf-8?B?cWhSai9tUnN6VVdEWU90SkhNcW9DeTRDbzZqZDczbGdmUTcxL2xvYVVIZmVW?=
 =?utf-8?B?WE5IR0o0eWxCdmNwcXA1NFl6ZUlUaHEzUncxU0hJaWdzbllBcVh6a3Joc2Y3?=
 =?utf-8?B?NElJdytOUmdqdDRrZGI3L0kyc0NZMWx6cFNuMS90ejdqckpXMzNaWFVEbERL?=
 =?utf-8?B?NlVTakszNWJUVldpcVdwSmtpN0ZOTHVQREE2c25JYndlVHg4L0pXeHBnQURi?=
 =?utf-8?B?bHRLQUQ3dkp1bWg4b0RuekZGVVZnQmNWaWxOWHFTNzhGTkM4QUF0QTJ3dXFU?=
 =?utf-8?B?ZFU4MG1OTDl6aVZ1ZEF5K0w1ek0wOXdLMnhlWkhvYmc4Mk5CdHZvUG4wSDQ5?=
 =?utf-8?B?SFdPRkVwT3Q1b2dSRGwxYmxMYUYwQm9KektaUTlyeEZoY2huQ2lEZXhaZ29G?=
 =?utf-8?B?THBRaitydER2Z2hvcDBWK1RvT01CSnZ5akNlcmJGS0tZa3p2MkpkS0d0SEFL?=
 =?utf-8?B?dWRXWEp5WENGclZ0c0lqOW9ubit5ZFplNlBRUU5RQzJTOFE0MEt3bWVFTGFS?=
 =?utf-8?B?STNhZ05GY2JENSt5bEZWTDd1aVNSRkt4WE5qS0MrR3FURW44M3lvVDdFMTNF?=
 =?utf-8?B?aEVnM1NNVFJmQStpbVlVWlFlRFBBUk9XVG1oV3ErNWZHYWRCSzZmbzVNejFv?=
 =?utf-8?B?QmhQNi9ZUnFCc3FkUmdzeko4anJ4Ry9mb1drSDJGaWlocHl5bXVHRVAydVd1?=
 =?utf-8?B?WmM2RUl2T0xVTFp2NjVUcld1cW0wUS9xdk96MUkrYnIydGpMbTdtTDl6R0ND?=
 =?utf-8?B?VnA2Uno0R1EzUzY5SkdNSlNEV25tZ0diQWJjTzNQYmk4QjJNbDN1Z3pVYWJM?=
 =?utf-8?B?Sm1KQUpmM2xvdXpIbjFDYUxLdUtGZW53NDlsRFo4QWJzcWpXTm9sZTlRZkZs?=
 =?utf-8?B?c040eXRNZjlWeU8vVkpENmszMmJjTTJuY2plSk5LeGR6amRsU3pDYzlIVnpi?=
 =?utf-8?B?YWxvUGVvVzBmWi9Ldk9OUnh2L1BtZnM2ZGFGWTFJVkNOcEZwZStXQ3dVeVpz?=
 =?utf-8?B?Yzh0dzMrUzA5cmFvOFpJKzBuM09EQ1l4K0NjVFlRNnVnd1M3K2F4RGZEV29j?=
 =?utf-8?B?TTJ0ekVvaUxTVDQ5dStOTUIwK3pCMGxqRTZaMlIxblJaQjZpLzF5eW1RQ0dH?=
 =?utf-8?B?c3o4ei9NTVJ5UmVkQ2VzYkVZdjExZGRBR290QnYzdDEzcVQ3UUZpUnlwZzVz?=
 =?utf-8?B?RnoxdFdhME1ycU5NWG1SRWVJdDJ6NXYzZ2hEcmdxQzV6aVJBT1JsWEd6bU55?=
 =?utf-8?B?MWUyR2hPTW5maDVac2xNQms4UERMcmN1eU5GTE5iRnl3cVF5WDZIa2RyMjcy?=
 =?utf-8?B?ZFFZUWJKYWpwczkvRGI5WThxTHNPOFI3TkVwbWRjSDJjQ3JwMWZzK2I0cjZj?=
 =?utf-8?B?UlQyZ2h2aGk4Njc4b3VodG5RYzAvWHE0S0owbFFFVmZIZjdGOE9pNTJuWW4z?=
 =?utf-8?B?a1VQQ0VBVTFGZytFRzBWM2wzWFZ0VUw2NXFzRlBreWx6ZHFtOTU0ZEhUdHZH?=
 =?utf-8?Q?wJy0iKxYgb8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUpBcys0T3p1S09LQ1ozUUUvTTlJdVU4V1QxcEJqUVdYUUE4dGdPbVNOR0x4?=
 =?utf-8?B?ZUxUVzhUbW9aTXUrclAxbXFXdSsyc3lCc3BTSWJKckF1Ym10aVl4Y1I3QURv?=
 =?utf-8?B?cG9IaDVmanpiSWxRWHlud04wcHV4ajFFeDNNNktRc0laOEgyUWp5Y1hEcElD?=
 =?utf-8?B?UERoK0FNZ1J3R0lqT0FLMlBaSDlhaTU3VUlsSUpHeU5yY3ZCRFZIS0NCNHlx?=
 =?utf-8?B?ajFJdmMxbUxHbUxyLzR0d09Ldm1INUJicXZmaG1aVDMySW41cEdHaWxTa1hM?=
 =?utf-8?B?TTJnNWpSbDRJR0dVdmJPaXNlZmY2RXZRcUphYlFKNWdDUXVKQXZFTFI0Z2xF?=
 =?utf-8?B?Nm1oNjdObEtNL0tYaWxqbWU3eVhrMjgwc3l5Q1hITkVNSU9sZTMxajEyZlhG?=
 =?utf-8?B?ZXZtQmZrSVJ6Ni8wWFpNczk0enZmMk02bTVmYTl6VUJGTjVnaVk4K2g1Zlcr?=
 =?utf-8?B?OHpCcEYrYnV1TjltK1hQL2FvNEUveEpUMjNaRE5CZ1ZhbWpwTTNsM1hMUC9r?=
 =?utf-8?B?V1BBNEorMkZqVCtLa1orUWc1NTc3c3EzWTJoN1RjTGdoTCtPK2x4WDZkb0FI?=
 =?utf-8?B?L2F5US9mZ0U0b2tlZHZxVkZYRlNpeVM3UmV2YTg4SmR6RkNBWG1UY0NDci9h?=
 =?utf-8?B?VU1qdGtVMGVsZmpTaFhjMlBDVG5LNFQ1eWpBU0h4YzNVandRZXpHS2dXRmt5?=
 =?utf-8?B?RU9kUWVBYTVVQ1c2SGl0ZFFTNEx3aDg2SlVrcTJIV3o5dkkyNld6VjhSQWJl?=
 =?utf-8?B?czR4NGZZRmV6VjlCandvaUVBVWRjNmVZZUtRa2MrMTdKRUlRcDhsbWcwc3Jl?=
 =?utf-8?B?ZmJBUGxBTEJPY2xKSmtmU05sRmExdFhiQUI3UGE3aGFSTkdXUERNL1hCeUxC?=
 =?utf-8?B?djBwYXdVa3VqOE56cUhtZk94elFZRzUvSXBSdjJaNXFLMkNvbGk2eEduWHZ3?=
 =?utf-8?B?QXk2cDRCVzVYMjQrZzJ0eFRKN29kWXQ0czlMWHNKdDAvWTZjY2RzYkQxbVRI?=
 =?utf-8?B?U1R2ckgxWTdSbVpuUUIycjR0UzFFUmg3V3VYWDBRUkY0cmxwb0dRYUZUYVVS?=
 =?utf-8?B?QXRmWnNHN1RKL09zcUQ0ek1xWVdKblpJa1I2MitDNTgrMkpoei9OM05LUm05?=
 =?utf-8?B?bUNwZjNoUEJmeWI1QW9Cd2JRejl5T3Urc092Um5FUnJSNnY0R0NoWVV0all1?=
 =?utf-8?B?b09wMDJBd2ZyNU13YjRYYmFob0cxQzVHZ2JYUGFudTUwMktiRzFKWVNpeU5z?=
 =?utf-8?B?VHk3TURPVlc2bVhhNG5DU1NLMVFUNjFaYmRlbW9NU3VpNDVhenllWTNQbkRX?=
 =?utf-8?B?cWNNUHkzYkdiMEpyUGZDdXAyVDVwOWltYTBVNzV5Wm9XODFRZkxNb2RGWjZT?=
 =?utf-8?B?TGJlc2dqK0dCc1FibnA1aFZLUlF3cDBJM0VLN09qalFmQ0hQZGZaeldTWVJP?=
 =?utf-8?B?djdTRU92UmdUUDVPRWNWcEE3NjZpaHhaeWNpbkhRcDNML2h1aSszR0twVis5?=
 =?utf-8?B?TkE0YzdLUUhUUzVYWXFpV2NQYlVvWklOWFp6VCtaeW1iZGFLVHozUFQzclRu?=
 =?utf-8?B?b2MzN2NIdXlsV2lTeDMzSFgydnBMTTVsZlY4Sm5oVnlDZ25RQWllRDNQS3Yz?=
 =?utf-8?B?Q1NvMmRTeXRYS3RGckV5b1FSSVZDc2t1SnV3LzNqT3VZOFcvZlVCT3QxMHll?=
 =?utf-8?B?UXJzcHZQTHNEZ3Q2dFNmYVQ0T3FwSkMwRWhzL1ByNHhXWGUxdWEvVXIzSm4y?=
 =?utf-8?B?WWVlUTROZWE5Qm1sVXc5NDVzWjVPK0c1RGxaTWE0dTVoUzJLSEZiQXNETSs3?=
 =?utf-8?B?UE5ad1FDbExQSWJhV3dOSVZrWldKc0VTcVFKelBTQmVqOHhmT2o4eXpERUxP?=
 =?utf-8?B?U1N5NktHekxpbXRoV2JhakhIVUc1VnYwVTJ4RWxUdm5taWJxNnNPcVZhQmxm?=
 =?utf-8?B?Zm5Oczh3eVVZUGQ5NkwyckprVVJ2VFdaUDcvMmkxWC9yYkN1WVBsS2hjazBB?=
 =?utf-8?B?R1RNNjlrWnNJN0xSSDBRSHNvOVZ0S2JYcWVBREdScjVYQWJnZGJoZzR3Z0Jv?=
 =?utf-8?B?YS84N1hzWDZVanA2S0dMTnpHSjBOcndIV2FxZGdlclZCdXNQNmc2YUhwQ0h0?=
 =?utf-8?Q?iUv83zv+e1lUohDm7KqO+tKEx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bbfa8f0-fd1f-40de-4392-08dd924bddf5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 18:27:50.3932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTXml+F+XbDMO7QYfE3Qn0kzftHZpbiaZk3Sc0g5ebkwtrAOMc7BcnyOEmHn4qb/VIzCjW1s24z/hIcqF6gjpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7708
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



On 4/25/25 14:49, Melissa Wen wrote:
> Color gamut_remap state log may be not avaiable for some hw versions, so
> prevent null pointer dereference by checking it there is a function to
> collect data for this hw version.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   | 26 +++++++++++++------
>   .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   | 24 ++++++++++++-----
>   2 files changed, 35 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> index 5e78b553adbd..b0f9e46e202a 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> @@ -76,6 +76,7 @@ void dcn20_log_color_state(struct dc *dc,
>   {
>   	struct dc_context *dc_ctx = dc->ctx;
>   	struct resource_pool *pool = dc->res_pool;
> +	bool is_gamut_remap_available;
>   	int i;
>   
>   	DTN_INFO("DPP:  DGAM mode  SHAPER mode  3DLUT mode  3DLUT bit depth"
> @@ -89,15 +90,15 @@ void dcn20_log_color_state(struct dc *dc,
>   		struct dcn_dpp_state s = {0};
>   
>   		dpp->funcs->dpp_read_state(dpp, &s);
> -		dpp->funcs->dpp_get_gamut_remap(dpp, &s.gamut_remap);
> +		if (dpp->funcs->dpp_get_gamut_remap) {
> +			dpp->funcs->dpp_get_gamut_remap(dpp, &s.gamut_remap);
> +			is_gamut_remap_available = true;
> +		}
>   
>   		if (!s.is_enabled)
>   			continue;
>   
> -		DTN_INFO("[%2d]:  %8s  %11s  %10s  %15s  %10s  %9s  %12s  "
> -			 "%010lld %010lld %010lld %010lld "
> -			 "%010lld %010lld %010lld %010lld "
> -			 "%010lld %010lld %010lld %010lld",
> +		DTN_INFO("[%2d]:  %8s  %11s  %10s  %15s  %10s  %9s",
>   			dpp->inst,
>   			(s.dgam_lut_mode == 0) ? "Bypass" :
>   			 ((s.dgam_lut_mode == 1) ? "sRGB" :
> @@ -114,10 +115,17 @@ void dcn20_log_color_state(struct dc *dc,
>   			(s.lut3d_bit_depth <= 0) ? "12-bit" : "10-bit",
>   			(s.lut3d_size == 0) ? "17x17x17" : "9x9x9",
>   			(s.rgam_lut_mode == 1) ? "RAM A" :
> -			 ((s.rgam_lut_mode == 1) ? "RAM B" : "Bypass"),
> +			 ((s.rgam_lut_mode == 1) ? "RAM B" : "Bypass"));
> +
> +		if (is_gamut_remap_available) {

is_gamut_remap_available can be uninitialized before used.

> +			DTN_INFO("  %12s  "
> +				 "%010lld %010lld %010lld %010lld "
> +				 "%010lld %010lld %010lld %010lld "
> +				 "%010lld %010lld %010lld %010lld",
> +
>   			(s.gamut_remap.gamut_adjust_type == 0) ? "Bypass" :
> -			 ((s.gamut_remap.gamut_adjust_type == 1) ? "HW" :
> -								   "SW"),
> +				((s.gamut_remap.gamut_adjust_type == 1) ? "HW" :
> +									  "SW"),
>   			s.gamut_remap.temperature_matrix[0].value,
>   			s.gamut_remap.temperature_matrix[1].value,
>   			s.gamut_remap.temperature_matrix[2].value,
> @@ -130,6 +138,8 @@ void dcn20_log_color_state(struct dc *dc,
>   			s.gamut_remap.temperature_matrix[9].value,
>   			s.gamut_remap.temperature_matrix[10].value,
>   			s.gamut_remap.temperature_matrix[11].value);
> +		}
> +
>   		DTN_INFO("\n");
>   	}
>   	DTN_INFO("\n");
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
> index e89ebfda4873..931cd2e886b8 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
> @@ -74,6 +74,7 @@ void dcn30_log_color_state(struct dc *dc,
>   {
>   	struct dc_context *dc_ctx = dc->ctx;
>   	struct resource_pool *pool = dc->res_pool;
> +	bool is_gamut_remap_available;
>   	int i;
>   
>   	DTN_INFO("DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode"
> @@ -88,16 +89,16 @@ void dcn30_log_color_state(struct dc *dc,
>   		struct dcn_dpp_state s = {0};
>   
>   		dpp->funcs->dpp_read_state(dpp, &s);
> -		dpp->funcs->dpp_get_gamut_remap(dpp, &s.gamut_remap);
> +
> +		if (dpp->funcs->dpp_get_gamut_remap) {
> +			dpp->funcs->dpp_get_gamut_remap(dpp, &s.gamut_remap);
> +			is_gamut_remap_available = true;
> +		}
>   
>   		if (!s.is_enabled)
>   			continue;
>   
> -		DTN_INFO("[%2d]:  %7x  %13s  %8s  %11s  %10s  %15s  %10s  %9s"
> -			 "  %12s  "
> -			 "%010lld %010lld %010lld %010lld "
> -			 "%010lld %010lld %010lld %010lld "
> -			 "%010lld %010lld %010lld %010lld",
> +		DTN_INFO("[%2d]:  %7x  %13s  %8s  %11s  %10s  %15s  %10s  %9s",
>   			dpp->inst,
>   			s.pre_dgam_mode,
>   			(s.pre_dgam_select == 0) ? "sRGB" :
> @@ -121,7 +122,14 @@ void dcn30_log_color_state(struct dc *dc,
>   			(s.lut3d_size == 0) ? "17x17x17" : "9x9x9",
>   			(s.rgam_lut_mode == 0) ? "Bypass" :
>   			 ((s.rgam_lut_mode == 1) ? "RAM A" :
> -						   "RAM B"),
> +						   "RAM B"));
> +
> +		if (is_gamut_remap_available) {

is_gamut_remap_available can be uninitialized before used.

> +			DTN_INFO("  %12s  "
> +				 "%010lld %010lld %010lld %010lld "
> +				 "%010lld %010lld %010lld %010lld "
> +				 "%010lld %010lld %010lld %010lld",
> +
>   			(s.gamut_remap.gamut_adjust_type == 0) ? "Bypass" :
>   				((s.gamut_remap.gamut_adjust_type == 1) ? "HW" :
>   									  "SW"),
> @@ -137,6 +145,8 @@ void dcn30_log_color_state(struct dc *dc,
>   			s.gamut_remap.temperature_matrix[9].value,
>   			s.gamut_remap.temperature_matrix[10].value,
>   			s.gamut_remap.temperature_matrix[11].value);
> +		}
> +
>   		DTN_INFO("\n");
>   	}
>   	DTN_INFO("\n");

