Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66647B58CA8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 06:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A879410E2F9;
	Tue, 16 Sep 2025 04:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2MYafGSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013033.outbound.protection.outlook.com
 [40.93.201.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1F310E0B7;
 Tue, 16 Sep 2025 04:09:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfGDoIPG9h0IZBlCtGTZuHsnLCkFf2qIaNfkR/ZtWZvaUVbtDLO8a7NjynxVQkMbGT/ZUFgzoE+GY25pySqAbxnXgRARxaDfY337D1Aav8d3Y1EuA5tZ++uIWjLsQzEbI9wYAAxMf0u3KAmP7kyWZ3ZB8sn5aswDOIxs73sC+ycLIb/0lrstHwQIwdoKSp9rwak67XUTTx58d7ZahsQ3yEvyKtzwkThnAG7L7+RUXnPmWA48JyYkCgLfSDdL1boXbbCtN5xHuujO4W6NIPAUCqlcNS7KhU7d+bJN2IErzZUlz6ccDlArMPOog+78fiwCpmeuv2oSKSp/NTiRAY5X9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvD0BrsqBAGLT3CHrXkK8JEgSuRl7WGPeSC8BCwVZWY=;
 b=XLhsRvFG8IoLYZei6tqccdEmUXvLR0sIZPuzyHOcoqgBxoZLAcjCmmSy8A4STyJ/YvooaPw/kL8MfAV3+hZi73P50sh8/QjX0q88E6BFsP8ALE9ocsNiOeWZPRTnYM3ARAnyxNKowLtxZ0hf8gNVO8a2q4Ntgu6nCNqjHjAZn1I3HMd/y2kw9cyCHMyQl9oY6cgCr0fEZYHd5dfOApr7f0LJmPnK6EDiqCdhxIq8O0mU6vUdSS3KRDJqVp91PGQOl2BdZf6PVDqPVSnaSxmadbsT8wEXUlCYXrpskGjHbEH1rw6W7za2tJ2UzbP8KNaTN7V3RIYZ+ze1nQSdxxrBcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvD0BrsqBAGLT3CHrXkK8JEgSuRl7WGPeSC8BCwVZWY=;
 b=2MYafGSJceDlaGRPnH3LRxc4urMyRnNnCsZnGYhFIbQkgSPr7N22megQnU88cW7Hs4iY6LUD9QzLV0iWJN/X8Lmx0OdCOp6mPg2mEAzcQY01HS2pkrzqlQw4kra7rCI8x7ATCBsLf3ZlpjyUwhamNzZzMEIOSxNKElaKwni3L1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 16 Sep
 2025 04:08:58 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 04:08:58 +0000
Message-ID: <ce6cab60-30e0-429c-bce2-7aa5e5ffc09a@amd.com>
Date: Mon, 15 Sep 2025 22:08:55 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Use kmalloc_array() instead of kmalloc()
To: James Flowers <bold.zone2373@fastmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 roman.li@amd.com, alvin.lee2@amd.com, skhan@linuxfoundation.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20250913052109.2638-1-bold.zone2373@fastmail.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250913052109.2638-1-bold.zone2373@fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::23) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CY5PR12MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: a09da266-123a-419d-e820-08ddf4d6c29e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2FPL05kNUNZbHlNTlBqTHZpVHl5ZHhMbjd5NFQ3L1YyKzdBZ2hNVmdMaXBm?=
 =?utf-8?B?RGlrT1hnbDQ2bFVBNG9hd0k0cmxiTmluTlI2RU55WVZ6L0hBLzVzRVBXTkpy?=
 =?utf-8?B?dC82SnY0NHcyOWt2aWVTd3dSRHhHbVRFdjg0MGlmb0hVY0Jic2pUeHIvR2Jj?=
 =?utf-8?B?ekVkT1VKS3FiMitCQTEyc3hPTXVqa3A4aDg0UVEvREs4ZWF4Y09qalh1bmVv?=
 =?utf-8?B?STAvazVhR1pCSm9JWXNjclNLdGRvM3ljdTNEa2l3ZVhpelJFRm5mSzVCcnFR?=
 =?utf-8?B?OVdPUm1kdnpBQVlwNzEvRzY0QzdJbXR5QUg0T0VnVUZSSHE4SzJWd1hJWnhI?=
 =?utf-8?B?TjR1MDdOS08rTWNBY2EyRzRnNnFadWRIWGVYR2JycEFReWFMR2M0UitUZjZT?=
 =?utf-8?B?UzF6WkFJcUpqcWJmRWk4dnM0eUd2bDFtQzJXa1VWUHhSK0tzVzVEaWpSTHBP?=
 =?utf-8?B?VUI2cDAzU2w1Yzd3M2RJaldZRFRoMGl0Z1J3b0lGS0F3ajBEcVNDdXhsS0FT?=
 =?utf-8?B?UFdOUEowNkJ0Zng1Y2JaaDJaN0c0UzJtQ0hMUkJyU2JaNzdZeVNjeTZlZEZO?=
 =?utf-8?B?bHJJUENvMFdRT0liSnR2blFFMEs2K0tJNkRPcnI4R1RTZGNxUGFwNlpBeElC?=
 =?utf-8?B?d1Y5UWxyOVo1RjZNWEU4YWtvYUp5LzlCUmlnTDlpTXkwcFVwQkRtbzczZHgy?=
 =?utf-8?B?M1JJZzNYRWJjQ2lBQ3pKSGVIdkp0c0piUVJvVUJET0ZqQ1JOUXEvV0FLQXFk?=
 =?utf-8?B?SXJMQ2pPTkk2U0VwOTVPV1RCQUdZRlFGR0pyNVowbW5uemM0b1IxVWpIdUh3?=
 =?utf-8?B?NVRWTjA3RjNkRTY5MFl4WEh6NHQ4Q09NVWY2UmZVWE56TEF2S2FBNXhkUjRN?=
 =?utf-8?B?cnRWaWRYN015OE9xdUZSVWg5UVA5WEYzeUtEVVY5WEsvUUdFMjZJMUNwSGds?=
 =?utf-8?B?QjRNTzMzd1cxbVp4TXZCMUU0VndsWmdWYnV1alFnQWxqanZ2VGkrWE1LQWpG?=
 =?utf-8?B?OXgxeldNRFVVQm84bnNWSmxhRkgxbnhjRjBFbTNSTEpCV0h6ZnZlYUpyOWZT?=
 =?utf-8?B?dXR1WGJmT3BhM1pHY05jYVhtdWZSTlRQNVBzbFgxcHpDTU02aFVhSVpncVpX?=
 =?utf-8?B?NzhaYzRnWFk5ZXBlVVpFdEJQQ3I5UFBuL05RQXRVQW1hR21NVHRCVzhIQXhY?=
 =?utf-8?B?elptMTVZLzJwRStNZGNMMzhuV3dSV2tISzVlVTc1UTg1RE1ub054YkJ5ZzFr?=
 =?utf-8?B?c2ozUGJ3a0tiRE12aEJVbDVPNXhIQUxrb1V6TmhQajdHeHR0NW1yZ25ZeWZW?=
 =?utf-8?B?Wmx2SkhqMVFPY3JrcVZhbHZDMkF4K0JjOWJQWloxTTZJUHkxdlFZMzRDR1hL?=
 =?utf-8?B?N3hSNnk4eWpyRWdBNEpZSkcwNlN4d2RwZW4vakMxUWhoSzVkdkJmdFB3MnI5?=
 =?utf-8?B?NmJldkFZcWNqcHdQaWJMWkczd1dFeGVId2x1ZUZ4OENJQ2UzWW1kVjk5cmRS?=
 =?utf-8?B?T1E4T3pEeEhNbnhqdktnTDFXVjVwUnJ6YmNGSWlDM1JDV2VWWGFTMXd1QWwr?=
 =?utf-8?B?VVB1OXRrVVZxMmFaQ3pDOUJwaEVqL2oveDdRN1kyYWlncmRwSU9BZEZNMDAz?=
 =?utf-8?B?RnFsV1hYcXUwRC95YUpFV0ZSSjVjRzhnVGd1N25jSTEwRlY2WjhMOStLOXpH?=
 =?utf-8?B?d3FTdlhxZC91S2Q1MmZxQmtQWmJSZjlHLzd3L0hmN0xwVEd1VjhMRzl5d3Ni?=
 =?utf-8?B?T0krV0lBZ3kxYlhrcWlxUnlpRlVqem5lS0VBRWQwTE15K0ZicTdRQjErdTBI?=
 =?utf-8?B?OWk5ZlZEUC9wWW5PUVlkRmNuNVJaa3lFdy8ycC80MnpWN2ZhUWJyZWkxcHlj?=
 =?utf-8?B?TE1CUTBXNVoxSHh6L0pHaE5HNk15VHNzRFRVUHBISTJXTlBBdWZzL0pOZUtV?=
 =?utf-8?B?ZFZra3ZwUUVlVnR5YXZrRTl0Q0V1S1N1dUVOTHFxYTVJZjNaZ2VGTVg4VkZQ?=
 =?utf-8?B?NTJQV20rSDVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(921020)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUw0a09kbHpNK05XZkRLeFdHTzZYWE92a001ZEtxelR3YVd5YVcxRnVhWFhZ?=
 =?utf-8?B?TFl0ekNvbUVYdE56dGRJd3BUdnN6eVJFcHN1aTN0NEN2VHhxRllUa2xGdk5m?=
 =?utf-8?B?T0VDOVduRWNhTGJvS1paRm8ydkxhNGY2aC9lcWNacnliNFZzdmVoYmN4dlI5?=
 =?utf-8?B?M09EUU5aT1Vyc2hSQ2hIRXVmOWRTN0VScVJMNkdyMHlpa0xjTStma1JSM2tm?=
 =?utf-8?B?VWhrZFE2V1RCWTI4bjZxRTV2Y2hxQ0Joa0ZxcXRHaHV4YXI2MW13Mm1nSmNv?=
 =?utf-8?B?WjhFa2lhbjlQRHJpMG4yWG1OOUVTdXJBenFiWHZRSEN4eUU5WDBLam0xTjR6?=
 =?utf-8?B?ZnVQVUNXUGIvbHU3Q0o4SHN0WTVsN1JYSUZoVnNqZWx5ZDdZOVVtb2FoeUtU?=
 =?utf-8?B?cXEzc2lsZkZZQXV6bTRaYWN2Q0gxK1JNRVdCUDVPZDZKMkZOTzBMQmxoNG1y?=
 =?utf-8?B?TzQ2Zldjb1ViSk82NmFOU2dNUEMxUEYrMWpyb1BPY2NpekcwcVovQm9XT2pE?=
 =?utf-8?B?V3FxOEp2dHgzeUJCa0lKeW15ZlVTZ0VwRUpBVWVia3hNVlBjSURhbFBkVXQr?=
 =?utf-8?B?aW4xMWVrNW00dlFWc1JLK3JkWDlkZ2ptWkRXZGZXd2xxbHgxeDRKK25NMEE5?=
 =?utf-8?B?d1grcmcvY0tBTXdYcExrUEZ3UHRwNVp4ME96QjZ3Wm1vZ3o3Nm8yK2NiVHpX?=
 =?utf-8?B?UTdMaTN1UUdLWUVaM1BWVlVIT2ZLdm54M016UWtpZjU3MFp4aDBobnFPUlFT?=
 =?utf-8?B?YlYwTEtheVpDQkYyWVV0OUNtVUxmT0Y0cVlyWDUxUXI5bVVJaVg5bi9GelVQ?=
 =?utf-8?B?L1ovd1hlK01iOWdQa250aG9nbWpWKzByQTNPMzAvS3RnR3JzWEpnL3lrUVRE?=
 =?utf-8?B?V0xRT1hHK2hIY3JIQU1ENkpqS0RySXRCak9mbEhldmdtY003VXYwRE5hTklh?=
 =?utf-8?B?bzBDVmc0amg0OUFubFY4VDczdnNVQ2U3K3lCYWtKWmlNRWZvT2RyOXZ4SDgx?=
 =?utf-8?B?Y0J5Zk9rM1JFcStSdmZzeERkd29jSmxzaktvTXdqc1M1N1JHQkphTlpKeEdm?=
 =?utf-8?B?VWsvODVGMTE3bHhxYVZ4aU8rQm5JbXAvTVNuc09iUlA2bkJXUVFzUkFEdHpF?=
 =?utf-8?B?YjI0QkdOcW5QLzZsb3JoSllGZU5uRzdCN2g0L0oxOVZsVHcydkJzOHdKQVpB?=
 =?utf-8?B?UFlOUXptcDRnMFVMWVNxWVN6UEpONUZVZi91Mk9MTWd5R3p0QzNLMWlaSHkz?=
 =?utf-8?B?N2xCbGFmazBFWXBxa1JqTkpKS1hPTHhzZjJMeXlIN3gxUExDWTZNQVZRUmho?=
 =?utf-8?B?aEpVa1RiV0JLOVVMZXRVc2ZsRFcrWDg0VG5CMHFIUVV5S2xKM0x6L3Y4QVJP?=
 =?utf-8?B?VDBVN2hqVitVUm5hNzhtb3FtUjNiaU4zYW9GcDUydnM5VzFYL3hJVU5HMThF?=
 =?utf-8?B?aVBlYldXL2RqdEFGSEViK0tjOGNtbXBmLzIzYXdiaXNMZHF2bjdmRzVBaVl2?=
 =?utf-8?B?Mnk0RU50d25HWVJ6V1h0QzM0TnVPeEp5YThwUHBmVjlYRTBCS205WjBZTmkz?=
 =?utf-8?B?QkhVbmJQbDZWSllKRDEzRXlVVHp0ME5QVDJpeGRhVk5OZkhYMjIvNHpQeHh3?=
 =?utf-8?B?VmtaYXpwS09zOHhLSXNsUXk0YUJuS3Nzai9tbG0rZmlzaTNBYXRZaGNvMU9L?=
 =?utf-8?B?aXNVU0djc09xNHVuSGNmSG1VK0xGOFk1NXIrcUEwd3dNc2YzS3RldUIvTEd5?=
 =?utf-8?B?S1NpeXhLM3N0UlBEd3ZWMGZ0N09MSk50T2Zyc01vaEhFVGRqS2taQWhkQmZh?=
 =?utf-8?B?WjBlcEpIcVZQMHJ6T2RHMVBXTVJuRWUzbys4RFR2Ym96V2NLdUdoNlZsOFdF?=
 =?utf-8?B?dlNsY3p0Vk84YUtobjgvU3piS1JDYkRrY013dlgrQXdzSUxCbDBtWEZVK2hJ?=
 =?utf-8?B?RnpqV0ZNa1NyVEVFY3VadmM0V0FDODJyZEtNcVRZNXFWQkl4azB4aERmZDRZ?=
 =?utf-8?B?eTBzcGlTOUl3RXljRktYQk93L0EycmVEU01rUzFlaWMzNThZRFFWdlZrNnFN?=
 =?utf-8?B?TEphNEZvTWpPSHJ4OFppNm4wRFp2dWJNM0lsMktMQnh3UzVPNmtLM0k4ejhV?=
 =?utf-8?Q?aF16wNbG04oFAW1+Ps3ulOIoa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a09da266-123a-419d-e820-08ddf4d6c29e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 04:08:58.4244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKqCuZlIYI7hnbgqdGLANOezvvZP4LIEpV496m0GskfrDPAYtu2X+WgwDxxlLRZy4R+028wkirmmYDmSlfS2yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6405
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

On 9/12/25 23:19, James Flowers wrote:
> Documentation/process/deprecated.rst recommends against the use of kmalloc
> with dynamic size calculations due to the risk of overflow and smaller
> allocation being made than the caller was expecting. This could lead to
> buffer overflow in code similar to the memcpy in
> amdgpu_dm_plane_add_modifier().
> 
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---
> I see that in amdgpu_dm_plane_get_plane_modifiers, capacity is initialized to
> only 128, but it is probably preferable to refactor.
>   
> Tested on a Steam Deck OLED with no apparent regressions using these test suites from
> igt-gpu-tools:
> 1) kms_plane
> 2) amd_plane
> 3) amd_fuzzing
> 4) testdisplay
> 
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index b7c6e8d13435..b587d2033f0b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -146,7 +146,7 @@ static void amdgpu_dm_plane_add_modifier(uint64_t **mods, uint64_t *size, uint64
>   
>   	if (*cap - *size < 1) {
>   		uint64_t new_cap = *cap * 2;
> -		uint64_t *new_mods = kmalloc(new_cap * sizeof(uint64_t), GFP_KERNEL);
> +		uint64_t *new_mods = kmalloc_array(new_cap, sizeof(uint64_t), GFP_KERNEL);
>   
>   		if (!new_mods) {
>   			kfree(*mods);
> @@ -732,7 +732,7 @@ static int amdgpu_dm_plane_get_plane_modifiers(struct amdgpu_device *adev, unsig
>   	if (adev->family < AMDGPU_FAMILY_AI)
>   		return 0;
>   
> -	*mods = kmalloc(capacity * sizeof(uint64_t), GFP_KERNEL);
> +	*mods = kmalloc_array(capacity, sizeof(uint64_t), GFP_KERNEL);
>   
>   	if (plane_type == DRM_PLANE_TYPE_CURSOR) {
>   		amdgpu_dm_plane_add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_LINEAR);

