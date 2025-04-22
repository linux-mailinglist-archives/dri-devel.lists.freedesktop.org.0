Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CB4A96369
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 11:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0AF10E54F;
	Tue, 22 Apr 2025 09:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YMITJm0F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD46B10E54A;
 Tue, 22 Apr 2025 09:03:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcVOIsZ4ekeNPHTd/byakk5Lp5w1UhZrVWWjykMcgAqIbfnyP+Y0yZKsZIo0Nat5taMPq7GOLTS9CoHMcSgHHHc2JJDwWfYQqK4CQR8xWAZfwjdV9i31Ybf9E6bi1Bg13BlPHZ6g2oqKtrXth3mA53/0vBnRW7+wYizWM7EkNuU8yAeaHOn+OoiNgd5H727muNj4EGnOkIefo8eLaQvz6tn8xz5Ert3guvdnKSuah19OSZQlpIbd5QNiBNuvP+Qqi3FyxReqAU7EsjmHjBic72+CbdhFym6KkaHLv2IuVU9EuHdUNO33vaxQuzragr/lCSW2Pc58J/EPFEsaUqZ6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVIguv5LrA7ocdhIQOZsPSaSU3yeP/lgIamf7ESPduU=;
 b=unYWYX9qMO2d44itr3KZKgBArNagKsq8gDAlTt+dyXZtDHNBvUWsR6SGseqBlFgmH/IqIarXmLt/7RIBVN6jv44wW5Mkx40pGpqfVm5rC4nFfTUP8xs5dUdczM+CBDxWhdGWaKs7vnPsut2+OhsuwXHMS5AiXcbltG7fqF9wuFeKa/1WdVGEYqQcenJqPByuQaqJLNOD/ab12gwZ7iRvPAew14f7JuJvXoUs1CZWkNlsVTVtGg4t5qek+lp7bQWS/HePHB8dZizwgRUhqYb/h2D7TiaVfnRZ1OKtsiN3YTiaLfLz0JBszi5/Yu3fwoXwE0J34a+3GbV/BM1t6UJRYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVIguv5LrA7ocdhIQOZsPSaSU3yeP/lgIamf7ESPduU=;
 b=YMITJm0F2vxc5VjGQpq9Wq8n1+wT7DEAbaKEIhz9wVjqpduO848zvsnmxazEa4x8E8slhRvx9FQptMWhUOeYdlRqHjYw71v4+F/47+4yWNf2FymBSStR09ZMd+dW+6EA+qZDbrVVHufSksC3w8Giq22tBjRP3jUVb8fIZsCKQAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Tue, 22 Apr
 2025 09:03:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.8655.025; Tue, 22 Apr 2025
 09:03:43 +0000
Message-ID: <4b7a7016-7ad5-4d08-919e-9876f7da1ef2@amd.com>
Date: Tue, 22 Apr 2025 11:03:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 1/5] drm: add drm_file_err function to add process info
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Simona Vetter <simona@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417161042.120981-1-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250417161042.120981-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: e45caa19-d582-436f-8151-08dd817c94ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVNsbHJiTFkwajR2Q1ZFbUdBc04wYXRHNUNTN1VQWEhTOXFmbXlrUFBpcHcx?=
 =?utf-8?B?dEt3VTJiQVQ1MHZ4SUhxWXNrbXZkaWU5azVwWGtoR3RDajRFdlNJRklhY1BG?=
 =?utf-8?B?U0NaVEQraUowWWovZG16VWQ4ZTdkTkdGdTlHYk1kUmJnV2s3cVhXLzJnWHo0?=
 =?utf-8?B?M1VXbFhRMGNJQjlvMlhuc3Q3b2FVY1NZellDVHdwcmgwOEpMNzZkL1RMaURX?=
 =?utf-8?B?SUNrNExVZFV1RlB1ZHluNkpqUGEvc2lwM0lWaWRMUDZKeGo0TE44cWZjNlZ4?=
 =?utf-8?B?SFN6cElqTVp6SWsxOTc2dlZhdDdHNHJtZ2w0QTc1d2VoTDFLZHBndS85dVRk?=
 =?utf-8?B?dXd0QXVtenQwcllWTUhPbjAzeWZ6SnY5NUlqUUhVcFB1bm5OSDVLbEFZMTZL?=
 =?utf-8?B?MHNuZGNCTXM5d2liQ3lPdlpycHR3dW9Mb1NuSTBDNVVzSUdQUVI1aE5LTHUr?=
 =?utf-8?B?aEYxdUJmSHNaMzMxV3hRTjJZMnNNR1lzblJTUDJ5a1E3dkNjWHBud0tyWWxN?=
 =?utf-8?B?dWJaUjcwUHJrRGM3dGh6Vi9ycTR4VkszM2NHR1BOengyYW9URW5KTWJuUzJi?=
 =?utf-8?B?Q0dHdmNvNmpRUkdLdUtnMlZYbXdMY0pKTFV1MG1rb1VtYzlFZmdqSWRaUHV4?=
 =?utf-8?B?Y2g1bUlLN1lrTWQyNHhUTzVCSnV3OWdhM0dGTzkwdll4YklRYUdVOFFzbXVP?=
 =?utf-8?B?YzZaR0tuYnpwSG9qbDFBZ2VyS2RXR0owQUU3aHN3TVdhNmJ5ZVJ1RUdaZG4y?=
 =?utf-8?B?eGF2Vm5JTlh5OXBPa2NrVnU4ZmNWL2VWQ2pKQ3NqR0JzSklqNFVoNWUwNW81?=
 =?utf-8?B?RytRUjEyemhzdGFBMmszQTdIcFE3V0gwN2kxUkRPbGhUbGxvTWNJTEJWV2xK?=
 =?utf-8?B?VXRVRlpmUlBRaW83bkd0WFFzaDNFdEczdFUzVmVFdU54bm1TVGVWRlFiOExI?=
 =?utf-8?B?VERFUnNnVWJZTERmaWRJaWNLMDZtVC9lVlBTT2huQ3A5Wk1FRkVpSGtNZHlv?=
 =?utf-8?B?ZmlSc0x5OHEvcjJtcmVvRllxckNiaGgyV2o5SDRRYTBjSkRYNkQ2bWFQWXda?=
 =?utf-8?B?WXRiYUdaaEd1RGhrMmt0aEZscFdSYlRkT0FOaFRlc1p5MUE1azZ6TjljU0Er?=
 =?utf-8?B?Rms4dHg5a29PRFBldUJ4Tk1HdzZKRERzTjcvUXc0dzV3SVZqcEx6MWJEdGQz?=
 =?utf-8?B?MmZmN0huYk5MbHVlc09wTXZhMm11Z09wVy81dnQzemd1aVVFajNscWY2RTd2?=
 =?utf-8?B?UzZ1ZkFpWU1lWUhsNEl4a0tCS0NFQmNBaXk2VFh4Z2V1T2dOb1VMeXJNc3dG?=
 =?utf-8?B?d01XMHN4MnIySldQYjBhcFdXazVEUnRDbUtmai8xMHQ3WG5mSi8vbmR6Nk9S?=
 =?utf-8?B?UytPZWsxLy9oMGVtRENxL2RlQ0FQcDdZLzdLZG5BQ2RTNkhEUjJOWDMyTWxn?=
 =?utf-8?B?OXFZbzlqUUR6ZzFWMlpsQThWVUhNb1hMMFJXNy9FalpIays3cEhFTGZrU1NS?=
 =?utf-8?B?a0xMeEFMemhyT3loT3RGekx5TE9OeGlyTnBwTWhzNThIR2kyWkRCbDhpN1VI?=
 =?utf-8?B?eFk5d29RMGNmcVczUk96MENmb2lyalpKczJLVGRYMmh2SGlrczlYZTJGMWgz?=
 =?utf-8?B?cXZpV3ZLdWswZmthSk1nbW5wcFJYZUdMcXlYWVl2M1dVZjZxWVVCZFhOeGd3?=
 =?utf-8?B?a1hOZStxSE04N1BLKzhCUCt6eGJwOC9mZWd6dFNaTEZKSFdmN3UxdnQ1OTEz?=
 =?utf-8?B?TnRaR3dkNDJWQWE5VitndEM4YzFFOVVQSzFKVzJwMEJ5dzI5YjJ6bWVMcVN4?=
 =?utf-8?B?UjI1Yi9HME9hU0tSRG9IWFhWOERhU3JsMzdaSjVFTGdQTW4zZ3JIVFgwVnhE?=
 =?utf-8?B?dVZ5T05PemlaRGhDSkw5RnZ4aUVDZ0hJSmNTNzRrUW4vTTBNT2FvcHNrK0tj?=
 =?utf-8?Q?v65plcZuSTY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTI0M0c0V2JjQ1JFMHJlYjhrQ0xQOEZ6YVRXVHAwb1hVSTlRUHFqQ3R5QkFY?=
 =?utf-8?B?V29UYVhBS1JRMDV0WlhmeWdycDNUQXo0TlBVYjhMM3h2VjVZK21uSzJId1pW?=
 =?utf-8?B?VzJkNjY4czJac1VoSXBhQWZFTExNb1VhSDNYR1lFUzVUTi95MEZnb2xwNWpP?=
 =?utf-8?B?Q253dnhuOEozOHd3UGNJY05qRlQ3QjhuWXA0eURNYWJwODNjNlplQXR0NW1S?=
 =?utf-8?B?SWxmQnVHWlgwNlYyQkhvaE84NTRCVlp4TWJVTy9UaHdBY1duWDJ6UGcrVW5w?=
 =?utf-8?B?NkNZRU5pdGVHcndoY3pVTThjQ1dyK21LSDYxYTUvQmVIcjBRNFgxQ1NlMkdK?=
 =?utf-8?B?dy9qek9EWkdpNitwUDFhUnI5aitFTTlZbThRcWNrUFhyZzRZT2cxV0N0Ly8z?=
 =?utf-8?B?V095NjUxUWNTUXBBdVcxYkErTWNoNGlDZkdEVmE0b0VTWm03MzZ3REVaNFJx?=
 =?utf-8?B?VEk0cGQxUnZyR1ZHMzhTQlRDNjRNN1o5M3U4MS9QcmM4cy8ranI4SmpuOHhE?=
 =?utf-8?B?SEpuWVZhYXpacVF4aVJYek1vZzZKb0ROM0hyMjd6UWE3bERIaVlxZFdUZ0ZP?=
 =?utf-8?B?ZnIyYjgwL0xrVll6YmZ6OVhlbmdqUU1TWndqOUx4aHk2enFObzBXeTRSM3Jp?=
 =?utf-8?B?MmNVUXBrY1JWZjd1cEVOZU0yUFU3cEdFU2ZFT3NlbEg0TEIrZWttRm1QTVhn?=
 =?utf-8?B?Y3ZXS0tBaWNvWHZZZFBOaDBBcXlERlFEZFVXK2JIZ3FlZlIwNjZiY0RpQ3N4?=
 =?utf-8?B?N2VEUjdoWW1TN0FNYmtnRHd0eTJ4VFEwRXVRK3hKTWhQSUF6Yk1qbUhYaXZi?=
 =?utf-8?B?UUVyZytMTlRSaEY3MHVaMlRHeGhFYThaWWRVV3dhekNKUkQzZDhaN0IveEs3?=
 =?utf-8?B?bjh6UDFPYTM4bk9QcmNyK21zcmhEMWsvQXFBbWpnd0w5Mk1NVTZ5TXlIQ1hq?=
 =?utf-8?B?dGpIRzBidjJpZzFHTDNzTmhnN1RBYzZlV2JXczRGd25ZOFZuRUFDcHhCRG54?=
 =?utf-8?B?Kzl2WHZyNDc0Qm1PTDhVd3VoNDcza04vWitVdXkwRjhleUp0YmJPVW9jYXB2?=
 =?utf-8?B?UVA5TVBQL0Q0NFd1c0I0eVF1SEJ6L1ZuRnJOQjdMSkpLK1AxZ2owaSs0N0sx?=
 =?utf-8?B?ck1ucks0bHNrZ1RmbW5ZYXZBNnA4dzhuelhxNDdSbWNzdU1odXZPVmF5Q0NT?=
 =?utf-8?B?MXJ1d0tQVjRXRDgvK1NnSXY4SnM3dHA5V1g5bUdXSEJCWlVJTFJrZ21hZ3Vm?=
 =?utf-8?B?Y2lVemRFUStKM3ladmFxbTJUb0dNMDJObzJHdFd0QTl0b1krZ3k3OWRnYkY3?=
 =?utf-8?B?aDBGbGVSdytiK0djS0NhaWpYa05mRkl1YlQxajY3ekhzL0dOMElROGs2Q2NV?=
 =?utf-8?B?cEZVS1Z1Nm4yWHNCRVROY0ZOMFdvUzhwWnVJS21oRUNXcWw3c3BLUnNaOEp4?=
 =?utf-8?B?ZFNvYnFoSVZpOHppSEw0Q21jWWp6NHVueEtJZzZWRFJzRFQ1VGUyQ2lOVlIr?=
 =?utf-8?B?blcybEZEMXJlTlFoV0o0elFtVmYvbExCZ0RpUmVFdlpkZC9qTWJaZmdYNmh5?=
 =?utf-8?B?T0gyeW9DWGx2SjFUSGw5THpEMDEzQnJLQWI1clcyb2xoMzdLQWhURGMvc0k2?=
 =?utf-8?B?cHdNeDRzUFpJOVhBRjBHZXBRZXEycWxxRll3b2w5a2ZTQWFoUFdrVGcrUW82?=
 =?utf-8?B?Vlk0ZkxOWHFwMkpaS2R3a1kvS2tmZGR3ZVc1VVJzSld4d2NGMTVLb0RWUm8z?=
 =?utf-8?B?S1dqWWdmU1p5RWozck1pWXZzbWlKMHZVT3JYazQ0Mk1LaDQ0bExSVWZLbWc1?=
 =?utf-8?B?eWxuOWV5Vy9DV3RpOTVqNXAwU3NMVzgvc0VPQ1VkTTFRaXlSNXRpcW15cWpZ?=
 =?utf-8?B?aTdSeC9NNzVKdUxKcVdlaE5CenNiemY2c25uS2F5VFNPRGpMM05xcmNuSUxz?=
 =?utf-8?B?T0xTVzIwYXlEYUFMbmh6ZU5pSFY3dy8xcVdCVmlKb1d1Nnl0c1FHS3VER012?=
 =?utf-8?B?Y25zaWR5eTlTQjZLa3VNbDNxTVFyOEE2MW9PY0RNOWdJdytQQUVvUk9wcXV6?=
 =?utf-8?B?UnU4VmZrRmJ1VWFEVWMyY2pFaEp3K3IyTUw5SXpZMVJCQTNKampid3dBdFhC?=
 =?utf-8?Q?2kh/YOp4kwJPnW+NZk98khOvk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e45caa19-d582-436f-8151-08dd817c94ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:03:43.0191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyhKLGcb8aiilKnsTMLZf9B/orNwkj2xVf6vPNLNsUcpws0Lz16zzVAk9UnijPnt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6870
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

Am 17.04.25 um 18:10 schrieb Sunil Khatri:
> Add a drm helper function which appends the process information for
> the drm_file over drm_err formatted output.
>
> v5: change to macro from function (Christian Koenig)
>     add helper functions for lock/unlock (Christian Koenig)
>
> v6: remove __maybe_unused and make function inline (Jani Nikula)
>     remove drm_print.h
>
> v7: Use va_format and %pV to concatenate fmt and vargs (Jani Nikula)
>
> v8: Code formatting and typos (Ursulin tvrtko)
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Any objections to merge this through amd-staging-drm-next?

The follow up amdgpu patches all depend on stuff in there which is not yet merged to drm-misc-next.

Thanks,
Christian.

> ---
>  drivers/gpu/drm/drm_file.c | 34 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_file.h     |  3 +++
>  2 files changed, 37 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index c299cd94d3f7..dd351f601acd 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -986,6 +986,40 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>  }
>  EXPORT_SYMBOL(drm_show_fdinfo);
>  
> +/**
> + * drm_file_err - log process name, pid and client_name associated with a drm_file
> + * @file_priv: context of interest for process name and pid
> + * @fmt: printf() like format string
> + *
> + * Helper function for clients which needs to log process details such
> + * as name and pid etc along with user logs.
> + */
> +void drm_file_err(struct drm_file *file_priv, const char *fmt, ...)
> +{
> +	va_list args;
> +	struct va_format vaf;
> +	struct pid *pid;
> +	struct task_struct *task;
> +	struct drm_device *dev = file_priv->minor->dev;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	mutex_lock(&file_priv->client_name_lock);
> +	rcu_read_lock();
> +	pid = rcu_dereference(file_priv->pid);
> +	task = pid_task(pid, PIDTYPE_TGID);
> +
> +	drm_err(dev, "comm: %s pid: %d client: %s ... %pV", task ? task->comm : "Unset",
> +		task ? task->pid : 0, file_priv->client_name ?: "Unset", &vaf);
> +
> +	va_end(args);
> +	rcu_read_unlock();
> +	mutex_unlock(&file_priv->client_name_lock);
> +}
> +EXPORT_SYMBOL(drm_file_err);
> +
>  /**
>   * mock_drm_getfile - Create a new struct file for the drm device
>   * @minor: drm minor to wrap (e.g. #drm_device.primary)
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 94d365b22505..5c3b2aa3e69d 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -446,6 +446,9 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
>  	return file_priv->minor->type == DRM_MINOR_ACCEL;
>  }
>  
> +__printf(2, 3)
> +void drm_file_err(struct drm_file *file_priv, const char *fmt, ...);
> +
>  void drm_file_update_pid(struct drm_file *);
>  
>  struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);

