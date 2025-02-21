Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A28A1A3FB39
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 17:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07AE10EAF8;
	Fri, 21 Feb 2025 16:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b/a6YTQk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C6010EAF7;
 Fri, 21 Feb 2025 16:28:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaPNftQZHzRe2AdIf1eA2cB9mXeAt2XwylAuY16cbzAgdNFxD+OWfcD2xh/wjd2IqGnncJGE+cVhk2jKh2wAsSW1E4uUxcoXHkdPrKFlzigOUgHsWY+vGcVa6yvr+SP4Mpg7e2gGwwuqo5J1R/RBlgYB7OroXlofV2PlWbqsyU2li6VUbPSvSz+IKaaH8y6zJOjNNy+pJGIGFe8saKPGmEOt8D05p1yG9T5z3jrSmgIk4yBUgh5DJL4oKtiOkrRmgnO3DR61j2ugUParQTRGBiG3nC7xAw+2r4lge+UwvRdr2qFarpJS3PXWNAkSPdr/QC3evRtAEmQOpew+zsrvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YwIz5a0QCYuNE09cd7gUd/bvlkKrMIL+TmZlNqC0DQ=;
 b=v9cZfa8Atg5jVy5u5YOAT4scm6p2/1gN2Z5fiMmbSb8xNXoxOCPX6Ab8RQpXMSCgdAZ+k4trikVdEMRdqFftT+9ubQHZ19/mI1YhIZ1HvJG6Fm5l2UYSvI4oWLM5wGo07zO7Jr4yYLe5kGp0imr5vGCNzizGFWa8ajb3npV4DQVrR2JeTjarWd2NodZpuct1X3q/DM+hJkEDWS8CXjzCDHvf3jQZaqffDEsku8tiAEqPhGmjAG1BnQC0MgKSdPCNmQukT/vwwu0GhTHAKrMh41nys7BncQgKU6qJ7J2660k+sXV8TOXGM9fWXWIHydr/4kmD+OxAyKUKk7vBwfZBIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YwIz5a0QCYuNE09cd7gUd/bvlkKrMIL+TmZlNqC0DQ=;
 b=b/a6YTQkGj1ykZQrAvTcHlt2kRD8FGAmF6zU1XITmtSuQK9JjMJsyB4WDmSNERapQ7eWMxrwV6q6ItM9xhLk+v0HcSle7RikN83k4AnpsmjK/pqACEvHo/jm2Q1zOsOLBjqo9+WYQDnayig1tGc7aprU2M789Ds6haVjx8hx/Xw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB7019.namprd12.prod.outlook.com (2603:10b6:510:1b9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 16:28:26 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 16:28:26 +0000
Message-ID: <2409f2a7-3782-48cd-854f-d3dee705646c@amd.com>
Date: Fri, 21 Feb 2025 11:28:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 34/45] drm/amd/display: add shaper and blend colorops for 1D
 Curve Custom LUT
To: Leo Li <sunpeng.li@amd.com>, Alex Hung <alex.hung@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-35-alex.hung@amd.com>
 <cd17946d-f576-45fb-afd7-59cfd29cb6f6@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <cd17946d-f576-45fb-afd7-59cfd29cb6f6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0237.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::32) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 770ac1c0-299a-438d-42ff-08dd5294c425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWpENTVucW9PZ01USzBORGFyWHArTVNYcU9VN3VhUEs2M1pNN2lUWEdyVnNn?=
 =?utf-8?B?Z1VpVVhSMnd5T1VESG9vS2x6MUc4NzM0QmZmcEVseEtRTEY4cTgzOCt6MWl6?=
 =?utf-8?B?T0wvSVFkQjgvQUZMZ3RsSVl2RXRXaDI0Nyt5WkNrTlB5RGZheXl5Z1NrbzZw?=
 =?utf-8?B?S0JFR01sNUZkRVBFVXNCMjMyaDJIRkd5cWRzc0R0QklGVzd0VVJJTngwZUJ5?=
 =?utf-8?B?Rlc2c1ZqZUlYZ1h3SHhmdURMUWczVk9KM0VCUzVqR0oyZ1VPbDU2M1pNZTlQ?=
 =?utf-8?B?R2hFSndKQXFUY2w2WTVRMUQvdllzai9NdUF1M3NWZ2JMRG9jUFFsSHo2aDhz?=
 =?utf-8?B?V045YzB2MzQvLytUcWtrV1BqSFluTmRvY2I1V3dsTFJMY1htMzFicHpNbW96?=
 =?utf-8?B?RUw5d3E3NTFxUmtlelJJZ3FxRGJQMW91R0RZa3BKYnhCZE92NWt2ZklXNlhy?=
 =?utf-8?B?T1VwYUxaK2xmV1dGVStaRFdKNkI0a0NFLys3NHhRQUlKa25pMWxVSkUyNndl?=
 =?utf-8?B?WlIybkF1NThXRUh0YVlRZ2lPMTc1QUVTREVUaVdqVldDdXE5OXU5Q3NrN21a?=
 =?utf-8?B?WHk1Mk1HK3ZnSDdRTXRNeGl3SElTTXE1OUZNZ0VpRU9YUmFTb21uSHJVSi9v?=
 =?utf-8?B?VFlLQ1hKUWt0bldsNjk4RWxnMCtDL2R6T1BRSDFUSEJaNWV1SmhYd0d5ZHVj?=
 =?utf-8?B?NHdKUU1SZ2R3THp0c3Z3S09JZUNQVGRvR1BCVjZWSi9wekdSSVhEK2pIYmMz?=
 =?utf-8?B?cTBMaWFmNW1qYWtXNDRYbElhRzNzU0N1M2p6SU8rTEFCSzk4ZHIxbDZrRFRY?=
 =?utf-8?B?V0hxT3ZWYWdCRCtFRGNza3B0Nitub3F5UkpENk9uYlpGQ29mdndtSWt1QXZu?=
 =?utf-8?B?cHZYTlVUY2dDeENPNFdWaGJ3SnhKNDFrK3dVVkRKcTRHWGpZN2dIVWx4dnRL?=
 =?utf-8?B?UzR3MlRrdVA2VndOTWF5UzF0SnJINTQzQmw4SUpRWVFZWC9TaXJyVElhb2V3?=
 =?utf-8?B?d0ROVGFUR2NTUzJIVStRZmw5YlpVcmtCbVpySGxnN0FFMjVZdTl2UXRHbEN5?=
 =?utf-8?B?aUp2RUNsU3B0SzA0blJPbmZJRUpZVzVZbGZnVHRmNUVaSmp2S0FQZzg1ZzBq?=
 =?utf-8?B?eHh1U3dic0FZNTBMK0JoUkMxVkwvQUlQa3FEdHRXZk4vRllycktZMXVmQ1No?=
 =?utf-8?B?cHowcFZYU2d4dXIrZGd5OWtGQXhmYnYwWiszOGlIYWFUSWpHTHIwYWYwM092?=
 =?utf-8?B?WVg1ZTVPVzlHSG5rb01XYms3RlJGYVgxbkk2dlpNcWNkRlFTVTcrc1lieHJ4?=
 =?utf-8?B?MmFHdXJUQnFkWGxIQWp3TTBVR05nMisrZytBU2xackFERzNTRXhYMDdWQ0I4?=
 =?utf-8?B?RHNmeEZtS0Z6L2w4OFhpT0F3WDJoTDdyYlVOb1gxUEtpZWowUnhNMnhYTFlu?=
 =?utf-8?B?TmRienpGNk9CUUREZitoUEwvYnFoT0hIcU40UmJyRThMcG9NZndRMTVJK1JE?=
 =?utf-8?B?THVJL3NpM1UyWHduRkZ6ZVdCbDEzMkYxbXJzVFlJcGhFeVQ5dEovZXF5ZEV1?=
 =?utf-8?B?QVZxaWNtcWlZN3IvVFE0a01PUC9MQ0lIcEdxZWFUVEI4ajBQcTVDaGFhSHBR?=
 =?utf-8?B?VU92NStnZUMvRjAxQVRlRW8ra05xRFZ3Nm1EN1NlWHlsY1E0a25TMy9UTUdZ?=
 =?utf-8?B?R0o5THFaZlJZTEpJZHFKeGVQdEtUWkQ0TUtpdzJuZDNySGFiQStVbFEwMnVy?=
 =?utf-8?B?L1FsZE1TalUzRitLeEdybWJhMytWTDlBczFuRkM1UXZ3QWdLbUswYTNMZUVm?=
 =?utf-8?B?Qzl3MDdMYVdPWFFka0htcENFeGRpZkdmMnFNMmNRWW9Xcy9LQm5xVnlpTVJ5?=
 =?utf-8?Q?Jh4/H6uDOaxec?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTB2emNmQnk5aFVZc0h1aytBTnlJc0NndFd1VEEwcnB4Uk9aZ2lqUXZQakRl?=
 =?utf-8?B?Z08xSVYxUXljV1pRN2wzL1puVncwS2FiSUk5ZC9Bem1YSXFUbGJlcmlTUkk4?=
 =?utf-8?B?WGlTS0ttWENSMHBDU3F6UzFYeFpmRHUvQVJlZ2JnZ0JhMHRqK0tUSXJjUDVw?=
 =?utf-8?B?UjN1Q0RQODRKUkRMdGNpYTRWVmR6QWZxN2gwcnoyQXJDcGVwVXJEcUpoQ1hz?=
 =?utf-8?B?MFA5bVg5TGY2YmUzVG15RWxaSFY4ZlBtYjdrYjVhTzVPQ09FSXlKTFM5dUU5?=
 =?utf-8?B?c1dwOW12a2hPRjhnbjZ6eVJUY2MyeS85T1dHa3FXMC9DYjJyYm5VcVYvM2VE?=
 =?utf-8?B?M1d3VXVldzdQUzJWZVdudFhPazdtSFdrbFdmRHo2eWdEbTFlK1dIUFhvS3BX?=
 =?utf-8?B?ci9SSXFoQ000OFRZWUZTbHQvM09MQ21pQUs4ZUdod0Y1REhaZEJYNVpOVkxR?=
 =?utf-8?B?Y0d0blgrYzFTUHZMNnYyWUppa1FoeW9EdVFHTCtuK0ZLOEg1TVVLMmtYTjh3?=
 =?utf-8?B?WWcrckNqcEl4cW1Gc0RiTzNBRzNORXBneDZLNmx6a0F4cys1Z04vSUxHRXhz?=
 =?utf-8?B?SnRGZ3RKVVcxcFE2bjd2UExlOHhhUlJVWXVyOU5qa1hBYXBkQmhkcWFNRExX?=
 =?utf-8?B?OWNSaUxuek5Kdy9MRE1lN3RTYlNkWkVEbXVlWUM1a1JsNFVTczdWNUNNbmhH?=
 =?utf-8?B?SzhDcHlYRXBSUndBSW41UVZsZmkxZzZ4SURreW5SK3dheDhpd2FnV3RmSkFh?=
 =?utf-8?B?UFoybmZDZ1NwSjNNTm5ST1ZrRktOUHk2V2lxc21ndHAzR2dvRkdOVHJDa0lI?=
 =?utf-8?B?eVFGTXpZUk1GNkdTdytGT3M4ZHNRUkdzdEJmVERvKzc5TkxodjJTRFE3a2d6?=
 =?utf-8?B?a3VBY3BjRU1yQS9zcXdlUVkzUFVwb1lWYXpXcU4vM3A1SWhxWTNJSSsvWExh?=
 =?utf-8?B?dGhiL3prME9FUjUxbTQyai8vSlc2VmpPSWVFK2w3Wmw4SXJkZFBnQUNpUGhJ?=
 =?utf-8?B?V05jaDJDRk95N3RJY25Zc3dERTV0YS80eThSVkhHSWhzV3ZaQXR1dTJLSnhG?=
 =?utf-8?B?VFRGWVkxK090a0xvaWFQc21Fak1remlpTEVRcXNSbGNIR0VKZGpsNTFudTd1?=
 =?utf-8?B?aGRzLzNwUDF5TGpPQ0ltYmZoOFVaUTFqRVlDcjNMbDJFc0MzN3FZSnJHTTcz?=
 =?utf-8?B?OURWcXV6RDhVMzFRNUxUZjc3eE9PWURLOUxsdmdjUmEza25iNWptODljeTc1?=
 =?utf-8?B?Y2hxYXp0eWdqS2xmd0xHTFFpUXczSFNmeXFZSE93ZGIvZElsTzc1aHp4SVo5?=
 =?utf-8?B?aWpxRUYyVmxxeGRUTkd4ZlhraTlxZmpwNGNEaStCbkxPQmZhZWNRV1hzb1BC?=
 =?utf-8?B?Z3JWQnptZzJYTG1sa2lSVVJBNDJpVEpsSVVhSVhNd2t2U3FLUkhhZ0c5SVdV?=
 =?utf-8?B?QlROb0RIbjlrTE1RT3RLR1ZCSEN1N1N1d3dVbG5PYnpqYUt2ampGNEVrZ1Zr?=
 =?utf-8?B?cTFvNnBHVEdxeXBHYWtBQ0lVWjdCTExFTHh1OWREd0dDeG1tVU44Q1JBejNq?=
 =?utf-8?B?N1dRME1Ob1dUMy9NTGZIcjVzK05zdHE2c3NYV1dDQ0c4K3BqN3U4bk9zdTFG?=
 =?utf-8?B?clR3RDNmeFdZN0hISitNY25XZVVRSzRqR3BkM1B4anoxUEFzU2VsNGI2MWJq?=
 =?utf-8?B?MitQRlVvTGNNUHVsMjZYTWg4dkJuUlZtME9DeVNLaU5lMnUwRzhGR0VCbVJC?=
 =?utf-8?B?M0g1bGFpTFpPNUVRMkxzRUxOZThFUVJtQjJZTldsbnJsZEVwSjVhcC92RFM2?=
 =?utf-8?B?ME91S1ZLYWZLRDMzOTVQZWszS3hoZGRlNHlsYUdtRSs5Vk0zUlV5T2Z0Z0xt?=
 =?utf-8?B?MnNRK2owZlIrTkhmRjZSR2ZSRXAvVTZmK3Fub3JIa1Q0a1NwSHBwZ0hZUTRE?=
 =?utf-8?B?UnZDZ2xoTDhiUWNNOGhjMjA0L05pdzhFb25HbGdtWUM0bzNVMUkxTVgxOTdy?=
 =?utf-8?B?ZW1rQS91bjlKVVpwTlVpTjAybU5NelltTXRqNkMva25IOFdISFF0cGZCaFVM?=
 =?utf-8?B?ZCtwdjdyN080NXdYRWx1MkgvYzBVY2xPMVRqL2RGZE5haHF3ckJVSVdZaFdC?=
 =?utf-8?Q?jELOTCTC6PcACOZhT+3ozzuCB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770ac1c0-299a-438d-42ff-08dd5294c425
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 16:28:25.7409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDY0kHRDjC6ukbiBQLMfcU8OjVhjxTGAFWYUyjxlDsyQpf4smDucLEQ9wg7vUAvREHCp55ozl/8QVsC24q6gYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7019
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



On 2025-02-12 18:44, Leo Li wrote:
> 
> 
> On 2024-12-19 23:33, Alex Hung wrote:
>> This patch adds colorops for custom 1D LUTs in the SHAPER and
>> BLND HW blocks.
>>
>> With this change the following IGT tests pass:
>> kms_colorop --run plane-XR30-XR30-srgb_inv_eotf_lut
>> kms_colorop --run plane-XR30-XR30-srgb_inv_eotf_lut-srgb_eotf_lut
>>
>> The color pipeline now consists of the following colorops:
>> 1. 1D curve colorop
>> 2. 1D curve colorop
>> 3. 1D LUT
>> 4. 1D curve colorop
>> 5. 1D LUT
>>
>> The 1D curve colorops support sRGB, BT2020, and PQ scaled to 125.0.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>> v7:
>>   - Initialize uint32_t blend_size = 0 by default (kernel test robot)
>>   - Modify state->size to colorop->lut_size
>>
>>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 166 ++++++++++--------
>>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  32 ++++
>>   2 files changed, 120 insertions(+), 78 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> index 1765402bc122..0bea52eede39 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> @@ -1211,38 +1211,6 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
>>       return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
>>   }
>>   -static int
>> -__set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
>> -               struct drm_colorop_state *colorop_state)
>> -{
>> -    struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
>> -    struct drm_colorop *colorop = colorop_state->colorop;
>> -    struct drm_device *drm = colorop->dev;
>> -
>> -    if (colorop->type != DRM_COLOROP_1D_CURVE)
>> -        return -EINVAL;
>> -
>> -    if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs))
>> -        return -EINVAL;
>> -
>> -    if (colorop_state->bypass) {
>> -        tf->type = TF_TYPE_BYPASS;
>> -        tf->tf = TRANSFER_FUNCTION_LINEAR;
>> -        return 0;
>> -    }
>> -
>> -    drm_dbg(drm, "Shaper colorop with ID: %d\n", colorop->base.id);
>> -
>> -    if (colorop->type == DRM_COLOROP_1D_CURVE) {
>> -        tf->type = TF_TYPE_DISTRIBUTED_POINTS;
>> -        tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
>> -        tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
>> -        return __set_output_tf(tf, 0, 0, false);
>> -    }
>> -
>> -    return -EINVAL;
>> -}
>> -
>>   static int
>>   __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>>                     struct dc_plane_state *dc_plane_state,
>> @@ -1251,64 +1219,61 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>>       struct drm_colorop *old_colorop;
>>       struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
>>       struct drm_atomic_state *state = plane_state->state;
>> +    enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
>> +    struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
>> +    const struct drm_color_lut *shaper_lut;
>> +    struct drm_device *dev = colorop->dev;
>> +    uint32_t shaper_size;
>>       int i = 0;
>>   +    /* 1D Curve - SHAPER TF */
>>       old_colorop = colorop;
>> -
>> -    /* 2nd op: 1d curve - shaper */
>>       for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
>>           if (new_colorop_state->colorop == old_colorop &&
>>               (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs)) {
>>               colorop_state = new_colorop_state;
>>               break;
>>           }
>> -
>> -        if (new_colorop_state->colorop == old_colorop) {
>> -            colorop_state = new_colorop_state;
>> -            break;
>> -        }
>>       }
>>   -    if (!colorop_state)
>> -        return -EINVAL;
>> -
>> -    return __set_colorop_in_shaper_1d_curve(dc_plane_state, colorop_state);
>> -}
>> -
>> -
>> -static int
>> -__set_colorop_1d_curve_blend_tf_lut(struct dc_plane_state *dc_plane_state,
>> -                  struct drm_colorop_state *colorop_state)
>> -{
>> -
>> -    struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
>> -    struct drm_colorop *colorop = colorop_state->colorop;
>> -    struct drm_device *drm = colorop->dev;
>> -    const struct drm_color_lut *blend_lut;
>> -    uint32_t blend_size = 0;
>> -
>> -    if (colorop->type != DRM_COLOROP_1D_CURVE)
>> -        return -EINVAL;
>> +    if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE) {
>> +        drm_dbg(dev, "Shaper TF colorop with ID: %d\n", colorop->base.id);
>> +        tf->type = TF_TYPE_DISTRIBUTED_POINTS;
>> +        tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
>> +        tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
>> +        __set_output_tf(tf, 0, 0, false);
>> +    }
> 
> __set_output_tf() could fail silently -- would that be problematic?
> 
> Looks like this question applies to similar changes below.
> 
>>   -    if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs))
>> +    /* 1D LUT - SHAPER LUT */
>> +    colorop = old_colorop->next;
>> +    if (!colorop) {
>> +        drm_dbg(dev, "no Shaper LUT colorop found\n");
>>           return -EINVAL;
>> -
>> -    if (colorop_state->bypass) {
>> -        tf->type = TF_TYPE_BYPASS;
>> -        tf->tf = TRANSFER_FUNCTION_LINEAR;
>> -        return 0;
>>       }
>>   -    drm_dbg(drm, "Blend colorop with ID: %d\n", colorop->base.id);
>> +    old_colorop = colorop;
>> +    for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
>> +        if (new_colorop_state->colorop == old_colorop &&
>> +            new_colorop_state->colorop->type == DRM_COLOROP_1D_LUT) {
>> +            colorop_state = new_colorop_state;
>> +            break;
>> +        }
>> +    }
>>   -    if (colorop->type == DRM_COLOROP_1D_CURVE) {
>> +    if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_LUT) {
>> +        drm_dbg(dev, "Shaper LUT colorop with ID: %d\n", colorop->base.id);
>>           tf->type = TF_TYPE_DISTRIBUTED_POINTS;
>> -        tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
>> +        tf->tf = default_tf;
> 
> Not sure if IIUC --the shaper in HW can either be a custom 1D LUT, or a
> predefined 1D CURVE, but cannot be both enabled at the same time, right?
> 

HW has only a custom LUT but the color module combines the pre-defined
transfer function with a custom LUT. That's why we're exposing
a pre-defined TF, followed by a custom LUT.

If we could only support one or the other we would need to expose
multiple color pipelines, ones with TFs, and ones with LUTs.

Harry

> If so, what would be the expected outcome if both LUT and CURVE colorops are not in bypass? It looks from the code that we'd prefer the LUT.
> 
> Likewise, this question applies to similar changes below.
> 
> - Leo
> 
>>           tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
>> -        return __set_input_tf(NULL, tf, blend_lut, blend_size);
>> +        shaper_lut = __extract_blob_lut(colorop_state->data, &shaper_size);
>> +        shaper_size = shaper_lut != NULL ? shaper_size : 0;
>> +
>> +        /* Custom LUT size must be the same as supported size */
>> +        if (shaper_size == colorop->lut_size)
>> +            __set_output_tf(tf, shaper_lut, shaper_size, false);
>>       }
>>   -    return -EINVAL;
>> +    return 0;
>>   }
>>     static int
>> @@ -1319,28 +1284,63 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
>>       struct drm_colorop *old_colorop;
>>       struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
>>       struct drm_atomic_state *state = plane_state->state;
>> +    enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
>> +    struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
>> +    const struct drm_color_lut *blend_lut;
>> +    struct drm_device *dev = colorop->dev;
>> +    uint32_t blend_size;
>>       int i = 0;
>>   +    /* 1D Curve - BLND TF */
>>       old_colorop = colorop;
>> -
>> -    /* 3nd op: 1d curve - blend */
>>       for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
>>           if (new_colorop_state->colorop == old_colorop &&
>>               (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
>>               colorop_state = new_colorop_state;
>>               break;
>>           }
>> +    }
>> +
>> +    if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE &&
>> +        (BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
>> +        drm_dbg(dev, "Blend TF colorop with ID: %d\n", colorop->base.id);
>> +        tf->type = TF_TYPE_DISTRIBUTED_POINTS;
>> +        tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
>> +        tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
>> +        __set_input_tf(NULL, tf, blend_lut, blend_size);
>> +    }
>>   -        if (new_colorop_state->colorop == old_colorop) {
>> +    /* 1D Curve - BLND LUT */
>> +    colorop = old_colorop->next;
>> +    if (!colorop) {
>> +        drm_dbg(dev, "no Blend LUT colorop found\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    old_colorop = colorop;
>> +    for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
>> +        if (new_colorop_state->colorop == old_colorop &&
>> +            new_colorop_state->colorop->type == DRM_COLOROP_1D_LUT) {
>>               colorop_state = new_colorop_state;
>>               break;
>>           }
>>       }
>>   -    if (!colorop_state)
>> -        return -EINVAL;
>> +    if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_LUT &&
>> +        (BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
>> +        drm_dbg(dev, "Blend LUT colorop with ID: %d\n", colorop->base.id);
>> +        tf->type = TF_TYPE_DISTRIBUTED_POINTS;
>> +        tf->tf = default_tf;
>> +        tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
>> +        blend_lut = __extract_blob_lut(colorop_state->data, &blend_size);
>> +        blend_size = blend_lut != NULL ? blend_size : 0;
>> +
>> +        /* Custom LUT size must be the same as supported size */
>> +        if (blend_size == colorop->lut_size)
>> +            __set_input_tf(NULL, tf, blend_lut, blend_size);
>> +    }
>>   -    return __set_colorop_1d_curve_blend_tf_lut(dc_plane_state, colorop_state);
>> +    return 0;
>>   }
>>     static int
>> @@ -1409,7 +1409,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>>       if (ret)
>>           return ret;
>>   -    /* 1D Curve - SHAPER TF */
>> +    /* 1D Curve & LUT - SHAPER TF & LUT */
>>       colorop = colorop->next;
>>       if (!colorop) {
>>           drm_dbg(dev, "no Shaper TF colorop found\n");
>> @@ -1420,7 +1420,12 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>>       if (ret)
>>           return ret;
>>   -    /* 1D Curve - BLND TF */
>> +    /* Shaper LUT colorop is already handled, just skip here */
>> +    colorop = colorop->next;
>> +    if (!colorop)
>> +        return -EINVAL;
>> +
>> +    /* 1D Curve & LUT - BLND TF & LUT */
>>       colorop = colorop->next;
>>       if (!colorop) {
>>           drm_dbg(dev, "no Blend TF colorop found\n");
>> @@ -1431,6 +1436,11 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>>       if (ret)
>>           return ret;
>>   +    /* BLND LUT colorop is already handled, just skip here */
>> +    colorop = colorop->next;
>> +    if (!colorop)
>> +        return -EINVAL;
>> +
>>       return 0;
>>   }
>>   diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> index ff5828a1e8cd..8a5e15083f11 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> @@ -29,6 +29,7 @@
>>   #include <drm/drm_property.h>
>>   #include <drm/drm_colorop.h>
>>   +#include "amdgpu.h"
>>   #include "amdgpu_dm_colorop.h"
>>     const u64 amdgpu_dm_supported_degam_tfs =
>> @@ -90,6 +91,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>>         i++;
>>   +    /* 1D LUT - SHAPER LUT */
>> +    ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>> +    if (!ops[i]) {
>> +        DRM_ERROR("KMS: Failed to allocate colorop\n");
>> +        ret = -ENOMEM;
>> +        goto cleanup;
>> +    }
>> +
>> +    ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
>> +    if (ret)
>> +        goto cleanup;
>> +
>> +    drm_colorop_set_next_property(ops[i-1], ops[i]);
>> +
>> +    i++;
>> +
>>       /* 1D curve - BLND TF */
>>       ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>>       if (!ops[i]) {
>> @@ -104,6 +121,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>>         drm_colorop_set_next_property(ops[i-1], ops[i]);
>>   +    i++;
>> +
>> +    /* 1D LUT - BLND LUT */
>> +    ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>> +    if (!ops[i]) {
>> +        DRM_ERROR("KMS: Failed to allocate colorop\n");
>> +        ret = -ENOMEM;
>> +        goto cleanup;
>> +    }
>> +
>> +    ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
>> +    if (ret)
>> +        goto cleanup;
>> +
>> +    drm_colorop_set_next_property(ops[i-1], ops[i]);
>>       return 0;
>>     cleanup:
> 

