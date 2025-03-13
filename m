Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5829A5F93D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 16:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FAC10E8D4;
	Thu, 13 Mar 2025 15:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4SMEsk0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2079.outbound.protection.outlook.com [40.107.212.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC2310E227;
 Thu, 13 Mar 2025 15:08:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2bOadPGCOY6MXQF5kj6ZCmpEIpZD5mwlh6O3v4nDCzWbutD/c5AGWpIvHXF4VFLE6tZJ4Q5qRr6AkiGJkIFMV/EOem50gQ8cOMxQNAHsmDaVWVBZ0UvmoJkI8OGMx5h5zePOOpgzfzZvkAiJjykTyShCU8848TsOGXDedxD7kjC8j2nobS/2p2naR88co0ZMyIe4TIZ6s51arKjA/DNTSxoTdf/BWU2p/N/LW3T75Q8ZEMFen82Maj+5DrrMM+MbzD77on8Pi8RuvFdOOoO7Cz1YkWc6hxP2vjZH/IgcHD5LkegaY8aX7VLYx/5uPGWvVtEIeYRDLKvK8Xsv7SpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uZZEpiUiaU4OrSHyj5c7idszylG1gmbEhBxH90R+b8=;
 b=fZxhaXjif2PdIMLvj17q68zFZatmZXo5HPTlO6teTDXcHzH2rxIcX7grMXUz77dGoTWDTntFdoEQHjo/8YmfX6rq3MB+TN91ijatGG3ptsA/OWozAUKprhU1hOYxch+5o0qcOkQuDCysQVyVtnI1LB2jNGlWkCHLrFNwE3e0zh/KSwZsn2rZn77MHFjAU9uPo/fcsXmjHvsEnzjC6mwEEq2yefLG18LUyl51E1AfbSUkk5s4jb1lMWKDU+1QvcHlRzKRXEh4BqdxlKUweFZghSvdQvOGbmQ0fwACaiCKslrzvv/046T8CkJwkFOynVToay+y0oQDMuiV1nT87A/T6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uZZEpiUiaU4OrSHyj5c7idszylG1gmbEhBxH90R+b8=;
 b=4SMEsk0mLExRwase6NDtn7k/tah+9EC5W9izbt7rn9DkE9INplKvkgjadv9VdnZG/ghN5dbvQCaVjjFduo5N5GCcSZZ9H7c925edRwNli7y8wmI/UGQAZk1RL7Sl5By/I/K6rq9C7nvxTOLTnaJx6u013CY559yB4MzirV/XMgo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 CH3PR12MB8259.namprd12.prod.outlook.com (2603:10b6:610:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 15:08:31 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%3]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 15:08:31 +0000
Message-ID: <a77432c5-a02a-451e-a316-594e8fdf5ba8@amd.com>
Date: Thu, 13 Mar 2025 11:08:28 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: avoid NPD when ASIC does not support DMUB
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tom Chung <chiahsuan.chung@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, stable@vger.kernel.org,
 Daniel Wheeler <daniel.wheeler@amd.com>
References: <20250205-amdgpu-dmub-v1-1-88151fe565d8@igalia.com>
 <Z9LBt2ePtxJ0Nzz4@quatroqueijos>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <Z9LBt2ePtxJ0Nzz4@quatroqueijos>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0315.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::16) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|CH3PR12MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae37956-0303-4822-1950-08dd6240ea8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnJnazgweFBUNWs5RWx2YWZmZFR1R0t2ZWRxQ1RadXFKdVlrYkZ4b21aWWYy?=
 =?utf-8?B?Qm83c05LMHN5NDZsUExxR1pkQndiYTlGQWt3c2E1cDRVbmQ1SU15RHNNL3E5?=
 =?utf-8?B?bm1jbG1SZjEzclNSOXg2WUpVb3A2SVlPVmlVcFlQT005QXY1SkRrc3ZqaWRn?=
 =?utf-8?B?cml3MDg0dTJKV1d0TjZaN0NBL1lFc202bE9xcXNkdTNYcVkrbzhtOXdUYlVS?=
 =?utf-8?B?VE5JOFdZUHg0SEFxQ1ZrZGdpNmswcmpTOEpxMkNRUG5VN2JocTl6Zkg3S0da?=
 =?utf-8?B?Tys2SVdXN0l4WWF0UGxyZzgwcyt6SEdpOFY2TnJZUG9TaExvTlhjSEsyNkV3?=
 =?utf-8?B?SHhTSDA5aW51QlVhWGpiZVNsbmJEeFhFd2FNMmgvMncwcktneWx3Qk9CS0RZ?=
 =?utf-8?B?KzdRdXF0d1VMOWtXNHdnTSt0Y2V4VTlsMUVwR2NXUCtwY0pzVmZnT3RnSng4?=
 =?utf-8?B?ZnMyRHNlYmNJck8yVGR3cFlPZGdML1BhWVZWZkxHUWdyMHBUaWl1ekJpSzc5?=
 =?utf-8?B?YUI2ZklQSnNobmJyd0l0dUVDMGxEVlEwdldTZ0lhVDFmSWRDalRBMHlHSTJD?=
 =?utf-8?B?TEJ4SjRpOFR0SkNFeTZRWExJTTFWbmNNUWJtSUVyaHZ1by82QjdQVkUzOTEv?=
 =?utf-8?B?ZVRPV0RmcnVqYlBvSHhMRmgxWEJLT3pPTVdDRnRHZVI0Q1hPbys3Z3hWd0k2?=
 =?utf-8?B?dHA4VlUyREw1ZU01QkxDRXIrZ0p5UEJKanorOCtpeGFuL3pyMStjS2ZIbnJX?=
 =?utf-8?B?RjFyZk1XclQvV01HYXJycnlnUC9iZVZXWCt6Yjd0VFVIZU9PUk1QUjl0bTA3?=
 =?utf-8?B?SldGK0xXRjNvRTZNT0JXUC9yaXBMb094QlpsRkFyeU1xajcxUmhNemlLUm4x?=
 =?utf-8?B?Uzg2c2Fib1dkakNYTWVEcnNrb1g2SXpvaDdpalpnK2kzZlFJOFNPTGhhYW1W?=
 =?utf-8?B?VmVITHpFc2EzekZYdHVBWERaVTVYTVdpMXBpUGt3RlVxS3E2OEFNSTExVnlw?=
 =?utf-8?B?TmpGZ1kxOWYzcHhFUVNUcHBlRlliLzhtMERJOW1iREs4MGY0T1VPYWJRcU1a?=
 =?utf-8?B?Qm12Z0E1T0kxUXExWVFlZGNiYXQwSWpSZTFJMFFZY3IwWE5JWXZ4MWFMSk83?=
 =?utf-8?B?UThJb3NrejU4K21yZU5DeE5tNU5Xc2lYU1VXd2RpQVhsNXYweEtTNGRyVnBo?=
 =?utf-8?B?enFHd0FNWUE0VExQbHEvUmxRR285aSswL21kdEFXL01zWlRUcjJjYUxKRits?=
 =?utf-8?B?OGJmQ1BEU1FFWXNWRHh6WEZHQmlmbXh3VmJuLzFtM09UQTVYY2puSjdCNTh3?=
 =?utf-8?B?bUFsOVF1UWV6dXNaUUgyMnlia2hGVmNGd2s2QXpSUkRnSkIydnJCcmNXcWlJ?=
 =?utf-8?B?d2JsaFl3cWh5WmtMVGpNNVlPOUdwMjVBMEJGZ0NDSkM0TnhXb2pGZ2huUnJa?=
 =?utf-8?B?cExTZmhNbzRIbkdVUTZlVk1jS0ZWdVkxZkx4K1JieG5CQTFIK3lBVThlbFdB?=
 =?utf-8?B?UEM4NlIvdHY2VXJJd3EweGcwcU9KZmZOWFhYUmNPR3c3eldsUkFic3B6YVVO?=
 =?utf-8?B?Q1dkN2VFeVJ4eHpBdkJqNlF3a1ptbjVWRUdZR1l4MFpWSDE1YSs5Qlhmc3B2?=
 =?utf-8?B?KzlnemhnUnRLaHdUd3Bua1MybnJyK2I5Y2I2QzBtRWpxSHMrQUVBVnBlMEUz?=
 =?utf-8?B?YStrcnYyYmVWc1lneStERTJ1TklhWmY5WHErK01WZklQaHIzVWdldTIvR3Zh?=
 =?utf-8?B?SDMrc1FBV1lQYXUyK0RZMVNPS1hrTFdTWDhmS3FoeVpRSHAzN0NhWTRveC9k?=
 =?utf-8?B?Umh3NnA3bGYzTVJJc0ZRUnE3ZFNIYnU4aExPWUVTWkhNZTh0VFlCQXFOdjZv?=
 =?utf-8?Q?k0+MouLGgXRzc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODgzMmcrV01keTFlMjJONDVmWXdCV1pFd0svNWRyOHp5dE12R2s2YmhPM0FP?=
 =?utf-8?B?VUFnd1MzZnZObEdlNGVOWEt0emVDRkg1V0xHV1JuOGszWWZwSkRHTVB4WlQx?=
 =?utf-8?B?Y29DLzVJYUFJVzI2RTVUbDJxNkRSL1ZvYmVsQlVkUEVHWlltUjNPdGR2c0pn?=
 =?utf-8?B?anVOMXZCVkFURVBSMmVpOHRFamZ6clRMeXVhZWVBNGN1d0diN0V2ZjVJWkov?=
 =?utf-8?B?L1FiTUFWYzJGdVZXUnQ5N0o1MXNGcjVGVDVTdkkxQlA1RTJ5c3YyTXZTSTVl?=
 =?utf-8?B?ckhrYTlORlU5YytlVUtLZklQMjUra0V3eWpIdzBUQnQ3cFpUNlZGL3lCZmpy?=
 =?utf-8?B?MkRieG9odUt5ZElBSFlCNDg5cjBLYXI3Zzh1dXJ5STZkOTFjZFhuVmR4ZnJU?=
 =?utf-8?B?MktyYWZUTkR5bTkvMWludnRUbmgvL25RVkpOUHZReEJsQTRDRU5ScHc0NnN4?=
 =?utf-8?B?TkFCREJXRFovdndTWS9WaEZxajJtNUp0WGxKTDRNaTRsT3o4cHRMQlh0aStM?=
 =?utf-8?B?N0V5RFFDdW5NZlVnQXBFcHcxUHZ1ZXN4Y2NmRlo0VHYvRWpEZ2JSUTkwZkgw?=
 =?utf-8?B?TEhJTTBmeGlyNlFHMVpWODJiZGt6M1Rwa2RyS0wrZVBQeEo5MlB0SkU4SzhV?=
 =?utf-8?B?Zk5nL0lMVzdMVi81Z3VLaWJ0Vmd5b08wVHNKbkttT00yMW4vSGxvU2poeVor?=
 =?utf-8?B?bmMxWEtFVkpsMHRlWTNHUzl3TXpPeDYwWldlNzlSajVGbkYvZlE0TnV1cVpE?=
 =?utf-8?B?emdQZ2JPWnBIRWUwVUIxTVJacUlMUjI2bUdQRktlVHFrYWZISmhiemRVWUp0?=
 =?utf-8?B?eDNQUDNhcDJSclpvaU12OThtbUlnTDl0YjY4UytyVmt0cHdZQ3pXa2pjQm5Z?=
 =?utf-8?B?NkxaZnhjb1ByaWREZnlDUU5kL3JyVDMvYWRMcTdlVmdOYUJ6aTFWbXJlNGVy?=
 =?utf-8?B?TE5GOERwdGlQODZyNjAvaHp4ZXFQbEo4ZHlINUxsNjhaQll4VGhSNTBPSlZq?=
 =?utf-8?B?dFQ2QWxMbkRkUDhLaW5mSWJ6WjRReS9WN2dVUk9iRW9kVXh0NWNPWFhTSDVB?=
 =?utf-8?B?em9rWUlyYkYxckw4NG01bFdUVkFFWG0zakV2eEhUQk4vblJjamJ6TE5ucVU1?=
 =?utf-8?B?TndyL056U1pOdGZCbW1mYS81VXBRYXo2ZjJUbmhWWm5HdVdNRFBWNW1DY1dZ?=
 =?utf-8?B?d1FRV2d2Q2dGU3VhOUhiZFhnWGVVRXpGUUoyR0kzU2gvaVhBMVFxRnlmdVVt?=
 =?utf-8?B?WmZ4ZUFzQU5PSUhETGJ5VUN2MDhiYll4RllPeXZCYWs5NVJaQmQyOXlOVTNZ?=
 =?utf-8?B?MGpEWGlMRFF2cHNlRzR6MFQ3ZHU4bnJlYkV0dXNiYXBWY1hmMmw0aXhvV0ZQ?=
 =?utf-8?B?QW9OdTdRM2NQUFFONmZQWCswMXB3SWxlL2syZ0tYNzhUMVBIN2FJcjlHUzZX?=
 =?utf-8?B?YUhNK0lOR3RSVzkrWTVOOVlncnY2Y0RkYWZRc0Jaby9Od042WkFPVEJaa2g2?=
 =?utf-8?B?NkI5ZWROclFYNTRSUk10Wk1xc0ZQRDZSM0pHdklQUFF3Mk9HMFJaZWVGYVBO?=
 =?utf-8?B?MmlHZEozcHhjWlJ6VU55VElhV3ZUNUltaHkwZitNWnBnTWd6c3RlUStrK0xF?=
 =?utf-8?B?cTZ2UUpiS21vOHl5MC9pWG5meHpmY2hHNjBZdjd0M3djUVVwMWUwWERIRUJX?=
 =?utf-8?B?ZndleVpoKzNMYldpMlJmWFJWcFJ3QUllZTN1QUEzNWx4Y2laUEVBaEVZU0hJ?=
 =?utf-8?B?Y29NZW52cTZwdUlDZkVLYzBxM0JaRHBLYVNLK0VmNjgyMzFMQ2w5S3VlbzFE?=
 =?utf-8?B?VyswTXZnY1pNNGQxK2pKSEwwWkVSTFRCQm01dVlEbGpJSUNHNkViRUNOb3d4?=
 =?utf-8?B?WFA3SEY1ZXkzK2ZwSXNEcUhQWC9YcGNxZlBRZ3h6a2JEUnNxb2s0R0tqR0U2?=
 =?utf-8?B?MGY1LzJUY3IvU2VieWxDY0swY3cvYkJ1aktLU0R5cjZ2VXh0ZXh2akxBSlBV?=
 =?utf-8?B?UFdIQmcyTkR4RUQ5b0xDaFF3QTVwKzNMbU5HT2dwYjlFZE13aTBNZXZ5MXUz?=
 =?utf-8?B?bkl1dEhpU0F5bll6SG5BZU8rZ0Z5MElyWkY1TmdQdml6bU1ZYjV5bVhPYVVh?=
 =?utf-8?Q?GP27U+zhlj6yS9z3CknC8EGOo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae37956-0303-4822-1950-08dd6240ea8c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 15:08:31.0879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyHtyisHwPJv/22x8uefKbODWVAFkP1uB8JX+GPAUYmzuf2XW8jSnx/oZkKbMN+/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8259
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



On 2025-03-13 07:29, Thadeu Lima de Souza Cascardo wrote:
> On Wed, Feb 05, 2025 at 10:06:38AM -0300, Thadeu Lima de Souza Cascardo wrote:
>> ctx->dmub_srv will de NULL if the ASIC does not support DMUB, which is
>> tested in dm_dmub_sw_init.
>>
>> However, it will be dereferenced in dmub_hw_lock_mgr_cmd if
>> should_use_dmub_lock returns true.
>>
>> This has been the case since dmub support has been added for PSR1.
> 
> This bug has landed on stable trees. Any chance for a review here?
> 
> Thanks.
> Cascardo.

Thanks for the ping and fix!

Reviewed-by: Leo Li <sunpeng.li@amd.com>

> 
>>
>> Fix this by checking for dmub_srv in should_use_dmub_lock.
>>
>> [   37.440832] BUG: kernel NULL pointer dereference, address: 0000000000000058
>> [   37.447808] #PF: supervisor read access in kernel mode
>> [   37.452959] #PF: error_code(0x0000) - not-present page
>> [   37.458112] PGD 0 P4D 0
>> [   37.460662] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
>> [   37.465553] CPU: 2 UID: 1000 PID: 1745 Comm: DrmThread Not tainted 6.14.0-rc1-00003-gd62e938120f0 #23 99720e1cb1e0fc4773b8513150932a07de3c6e88
>> [   37.478324] Hardware name: Google Morphius/Morphius, BIOS Google_Morphius.13434.858.0 10/26/2023
>> [   37.487103] RIP: 0010:dmub_hw_lock_mgr_cmd+0x77/0xb0
>> [   37.492074] Code: 44 24 0e 00 00 00 00 48 c7 04 24 45 00 00 0c 40 88 74 24 0d 0f b6 02 88 44 24 0c 8b 01 89 44 24 08 85 f6 75 05 c6 44 24 0e 01 <48> 8b 7f 58 48 89 e6 ba 01 00 00 00 e8 08 3c 2a 00 65 48 8b 04 5
>> [   37.510822] RSP: 0018:ffff969442853300 EFLAGS: 00010202
>> [   37.516052] RAX: 0000000000000000 RBX: ffff92db03000000 RCX: ffff969442853358
>> [   37.523185] RDX: ffff969442853368 RSI: 0000000000000001 RDI: 0000000000000000
>> [   37.530322] RBP: 0000000000000001 R08: 00000000000004a7 R09: 00000000000004a5
>> [   37.537453] R10: 0000000000000476 R11: 0000000000000062 R12: ffff92db0ade8000
>> [   37.544589] R13: ffff92da01180ae0 R14: ffff92da011802a8 R15: ffff92db03000000
>> [   37.551725] FS:  0000784a9cdfc6c0(0000) GS:ffff92db2af00000(0000) knlGS:0000000000000000
>> [   37.559814] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   37.565562] CR2: 0000000000000058 CR3: 0000000112b1c000 CR4: 00000000003506f0
>> [   37.572697] Call Trace:
>> [   37.575152]  <TASK>
>> [   37.577258]  ? __die_body+0x66/0xb0
>> [   37.580756]  ? page_fault_oops+0x3e7/0x4a0
>> [   37.584861]  ? exc_page_fault+0x3e/0xe0
>> [   37.588706]  ? exc_page_fault+0x5c/0xe0
>> [   37.592550]  ? asm_exc_page_fault+0x22/0x30
>> [   37.596742]  ? dmub_hw_lock_mgr_cmd+0x77/0xb0
>> [   37.601107]  dcn10_cursor_lock+0x1e1/0x240
>> [   37.605211]  program_cursor_attributes+0x81/0x190
>> [   37.609923]  commit_planes_for_stream+0x998/0x1ef0
>> [   37.614722]  update_planes_and_stream_v2+0x41e/0x5c0
>> [   37.619703]  dc_update_planes_and_stream+0x78/0x140
>> [   37.624588]  amdgpu_dm_atomic_commit_tail+0x4362/0x49f0
>> [   37.629832]  ? srso_return_thunk+0x5/0x5f
>> [   37.633847]  ? mark_held_locks+0x6d/0xd0
>> [   37.637774]  ? _raw_spin_unlock_irq+0x24/0x50
>> [   37.642135]  ? srso_return_thunk+0x5/0x5f
>> [   37.646148]  ? lockdep_hardirqs_on+0x95/0x150
>> [   37.650510]  ? srso_return_thunk+0x5/0x5f
>> [   37.654522]  ? _raw_spin_unlock_irq+0x2f/0x50
>> [   37.658883]  ? srso_return_thunk+0x5/0x5f
>> [   37.662897]  ? wait_for_common+0x186/0x1c0
>> [   37.666998]  ? srso_return_thunk+0x5/0x5f
>> [   37.671009]  ? drm_crtc_next_vblank_start+0xc3/0x170
>> [   37.675983]  commit_tail+0xf5/0x1c0
>> [   37.679478]  drm_atomic_helper_commit+0x2a2/0x2b0
>> [   37.684186]  drm_atomic_commit+0xd6/0x100
>> [   37.688199]  ? __cfi___drm_printfn_info+0x10/0x10
>> [   37.692911]  drm_atomic_helper_update_plane+0xe5/0x130
>> [   37.698054]  drm_mode_cursor_common+0x501/0x670
>> [   37.702600]  ? __cfi_drm_mode_cursor_ioctl+0x10/0x10
>> [   37.707572]  drm_mode_cursor_ioctl+0x48/0x70
>> [   37.711851]  drm_ioctl_kernel+0xf2/0x150
>> [   37.715781]  drm_ioctl+0x363/0x590
>> [   37.719189]  ? __cfi_drm_mode_cursor_ioctl+0x10/0x10
>> [   37.724165]  amdgpu_drm_ioctl+0x41/0x80
>> [   37.728013]  __se_sys_ioctl+0x7f/0xd0
>> [   37.731685]  do_syscall_64+0x87/0x100
>> [   37.735355]  ? vma_end_read+0x12/0xe0
>> [   37.739024]  ? srso_return_thunk+0x5/0x5f
>> [   37.743041]  ? find_held_lock+0x47/0xf0
>> [   37.746884]  ? vma_end_read+0x12/0xe0
>> [   37.750552]  ? srso_return_thunk+0x5/0x5f
>> [   37.754565]  ? lock_release+0x1c4/0x2e0
>> [   37.758406]  ? vma_end_read+0x12/0xe0
>> [   37.762079]  ? exc_page_fault+0x84/0xe0
>> [   37.765921]  ? srso_return_thunk+0x5/0x5f
>> [   37.769938]  ? lockdep_hardirqs_on+0x95/0x150
>> [   37.774303]  ? srso_return_thunk+0x5/0x5f
>> [   37.778317]  ? exc_page_fault+0x84/0xe0
>> [   37.782163]  entry_SYSCALL_64_after_hwframe+0x55/0x5d
>> [   37.787218] RIP: 0033:0x784aa5ec3059
>> [   37.790803] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1d 48 8b 45 c8 64 48 2b 04 25 28 00 0
>> [   37.809553] RSP: 002b:0000784a9cdf90e0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> [   37.817121] RAX: ffffffffffffffda RBX: 0000784a9cdf917c RCX: 0000784aa5ec3059
>> [   37.824256] RDX: 0000784a9cdf917c RSI: 00000000c01c64a3 RDI: 0000000000000020
>> [   37.831391] RBP: 0000784a9cdf9130 R08: 0000000000000100 R09: 0000000000ff0000
>> [   37.838525] R10: 0000000000000000 R11: 0000000000000246 R12: 0000025c01606ed0
>> [   37.845657] R13: 0000025c00030200 R14: 00000000c01c64a3 R15: 0000000000000020
>> [   37.852799]  </TASK>
>> [   37.854992] Modules linked in:
>> [   37.864546] gsmi: Log Shutdown Reason 0x03
>> [   37.868656] CR2: 0000000000000058
>> [   37.871979] ---[ end trace 0000000000000000 ]---
>> [   37.880976] RIP: 0010:dmub_hw_lock_mgr_cmd+0x77/0xb0
>> [   37.885954] Code: 44 24 0e 00 00 00 00 48 c7 04 24 45 00 00 0c 40 88 74 24 0d 0f b6 02 88 44 24 0c 8b 01 89 44 24 08 85 f6 75 05 c6 44 24 0e 01 <48> 8b 7f 58 48 89 e6 ba 01 00 00 00 e8 08 3c 2a 00 65 48 8b 04 5
>> [   37.904703] RSP: 0018:ffff969442853300 EFLAGS: 00010202
>> [   37.909933] RAX: 0000000000000000 RBX: ffff92db03000000 RCX: ffff969442853358
>> [   37.917068] RDX: ffff969442853368 RSI: 0000000000000001 RDI: 0000000000000000
>> [   37.924201] RBP: 0000000000000001 R08: 00000000000004a7 R09: 00000000000004a5
>> [   37.931336] R10: 0000000000000476 R11: 0000000000000062 R12: ffff92db0ade8000
>> [   37.938469] R13: ffff92da01180ae0 R14: ffff92da011802a8 R15: ffff92db03000000
>> [   37.945602] FS:  0000784a9cdfc6c0(0000) GS:ffff92db2af00000(0000) knlGS:0000000000000000
>> [   37.953689] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   37.959435] CR2: 0000000000000058 CR3: 0000000112b1c000 CR4: 00000000003506f0
>> [   37.966570] Kernel panic - not syncing: Fatal exception
>> [   37.971901] Kernel Offset: 0x30200000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
>> [   37.982840] gsmi: Log Shutdown Reason 0x02
>>
>> Fixes: b5c764d6ed55 ("drm/amd/display: Use HW lock mgr for PSR1")
>> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>> Cc: stable@vger.kernel.org
>> Cc: Sun peng Li <sunpeng.li@amd.com>
>> Cc: Tom Chung <chiahsuan.chung@amd.com>
>> Cc: Daniel Wheeler <daniel.wheeler@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> ---
>>   drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
>> index 5bb8b78bf250a0e56c3e99ce7c99ed7f70c8f0f6..eef817a4c580aca2ebc7fb1b77cfc0377d477bdc 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
>> @@ -63,6 +63,9 @@ void dmub_hw_lock_mgr_inbox0_cmd(struct dc_dmub_srv *dmub_srv,
>>   
>>   bool should_use_dmub_lock(struct dc_link *link)
>>   {
>> +	/* ASIC doesn't support DMUB */
>> +	if (!link->ctx->dmub_srv)
>> +		return false;
>>   	if (link->psr_settings.psr_version == DC_PSR_VERSION_SU_1 ||
>>   	    link->psr_settings.psr_version == DC_PSR_VERSION_1)
>>   		return true;
>>
>> ---
>> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
>> change-id: 20250205-amdgpu-dmub-3fc25a0bc68e
>>
>> Best regards,
>> -- 
>> Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>>

