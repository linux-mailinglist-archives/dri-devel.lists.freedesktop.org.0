Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCA4B49678
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 19:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650BE10E05A;
	Mon,  8 Sep 2025 17:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Db+Dbe3/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F5C10E05A;
 Mon,  8 Sep 2025 17:05:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXCWZgpvBXy9ipR0nliHT93X8tGzAREFhSu08IUsGfOP2paEOxV4e1+nuxalDiNbHwywsXVG+TBQzmcaSO9rBFt6iw9OSLXnBuyaNYmrdbrjDmITJRJlqvOTy3++Za4q7syrj1utEM1OwW70HGegZ5uXa6bFYjeumz719Lrgad9tRaTXFx+R7um/ZCxzCD8Gfy2RUM61BAgx/NFCExy+9XaMxLCz+y5I9xdyHiKr73HKssk56u5NKOkpBlirNE8SyhEcpL7gXE1Ea7VO+wsRWBydw278f3say2wzqRIEKgej9FpsMdKR4dC00Aj8eLViQSDo1GmSJXSfOQ+qZlcULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1bUyYjTu7YoCaGBXaKJMS0+O9ZPNG2O0yv6E/b/Z6g=;
 b=ArENNDM/W+wDIjWJRdxE3wpEVABhWry1j35u83BX0YzLnEeNqlK21eYBWdWGcWPsB07iRLEbKLXanAcZ4TzOTYHY998k5+8dk5UKBOE1QSraEdSTdDxHOscnMrwB3sNoOuXlwSDbZH+TBxsKqZrGI7GPZRXodY2nEfTTprcHBhFuUeHIZUdNPFy0qcK7Wp9GdaPNDZAkZUcKK1oSfJFs3E42ha8kmoG8cdjn6xv4uEiXE68Lk51B9FN3krdv1fDMrumD10xy4TeFT+vvHYtqo0D4MBmmwPt06X+bibmK7vSciohMNqW5xRegtlfN2SCuxgHJN/MiFNNm82qwoFAcRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1bUyYjTu7YoCaGBXaKJMS0+O9ZPNG2O0yv6E/b/Z6g=;
 b=Db+Dbe3/LIGiVc4dF2ES6lTnDYlMuNYRiuWky4ls0IIhgefSV+mpxJSUkMCANkvMShgtHpHCLM+jKi+lHlX2JUoK3GGgrEK1PWT3fB37UBywPF7pAFemF8w7/u48MSV+C7ObfHwrYBeYqg2SddH6dzyb4r+/wN8YMyCr5ePqQTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by LV2PR12MB5870.namprd12.prod.outlook.com (2603:10b6:408:175::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 17:05:09 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 17:05:08 +0000
Message-ID: <c28df8a2-9ec1-41d0-afe4-4ee047290d27@amd.com>
Date: Mon, 8 Sep 2025 11:05:05 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amd/display: Optimize reserved time candidates
 sorting using standard sort()
To: Kuan-Wei Chiu <visitorckw@gmail.com>, austin.zheng@amd.com,
 jun.lei@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: zaeem.mohamed@amd.com, wenjing.liu@amd.com, chiahsuan.chung@amd.com,
 Natanel.Roizenman@amd.com, Daniel.Sa@amd.com, jserv@ccns.ncku.edu.tw,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250824182359.142050-1-visitorckw@gmail.com>
 <20250824182359.142050-2-visitorckw@gmail.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250824182359.142050-2-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:303:b7::15) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|LV2PR12MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: b66f567f-d9e6-4646-40fa-08ddeef9dd4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFd4YUFpdHI5bVRlVURXdnQvb1ZqUGx0ZzZEdFJnQkRmcnRpQmNiN21oczRp?=
 =?utf-8?B?NldrdFZRRDQyaVVLUmRaRlNZVVcwcWNQSE55VWcwTkhoMHI4NEkwd1l3WmZH?=
 =?utf-8?B?K29QeVpQK2hrYXlxQ0NxaG5GK3U3c0x3RGhTM2hkVVZQZDU4eXErVGd2dk5r?=
 =?utf-8?B?NGQ2c25hY3docXVlV3RwUG54d2piYm1kdGdFZ3J4dVgyL3prTGpoWElCWEpV?=
 =?utf-8?B?azJzb1ZwY1BncDdoWHFoSlN2aWZOcjJCMjVZL3lPSlQwem1BR2trc21sTUpn?=
 =?utf-8?B?YkxNQm5ZajNBbGdCeUVEUFAvNkQ4cmVkbWdYQTlFdjdQSkJqUGdEb1dzWFA3?=
 =?utf-8?B?cms1ZmlXMEhMQXRLVlNRZ2M2OGV3VUM1L3dEOWV1TzlOb0VzNGhiWTF2b1pC?=
 =?utf-8?B?MU1RRm9tY0dNdWVTNGQ3L0hrdnZJSnlsbmZFQU9xZHI5MTJVeGFPM01xSzN4?=
 =?utf-8?B?VW1hZHhRb3VNRUk2NUYzZmNMWEF5YTd6M2t1aGZBeXRhbmJkdlIvbkFTdW9Y?=
 =?utf-8?B?R1ppN0swaXYvWVQ3aWMzMnIxSnVycEVLVmZyNWJGYzRwcjNOYTN6MnI4Z29K?=
 =?utf-8?B?aGpsR0dWTWZ6SEVFN2wzSEVOQTJxL1RPUlY4bW1LaExQdDZ0L01pSUJ1alNW?=
 =?utf-8?B?eDUvYjVPQ01yeEFnY3ZPbXhaVkFBZUx2YStWbFUzRTNUc1FpMjJjZ0huKys2?=
 =?utf-8?B?UjBrZlhYR0hUSS9iZlMzQTVGdCtlZkpOeGVFQ0hlZ0hWQjN0WjNZNEtDYkwz?=
 =?utf-8?B?R0I4bXhrdjB1N0ttOEV2RVpJRndjV3JOMHlUbEtsZHJxRzJaM1FWZThLeWZN?=
 =?utf-8?B?MXY3ME12RWZFRWErN29BejUyeDlDNUZHMmtJVWVrQmdkRWUrNjUyMnhVWFI1?=
 =?utf-8?B?NzU0TzR6alZvdloxY3RzL0NKMHE0UGE5WFpvMkJaeFNWa3lZRlhXNlY3VWov?=
 =?utf-8?B?b0c2MXh2UGZFeUNsNkxPYWRhNlRRUmc1blAzZ2doZENnbGU0VHN6Nng5UVhQ?=
 =?utf-8?B?d1k4Ymk5dWNXdjZOQlVBRlM3S2s4akQzUTFOR1I3eXd2OXBkeHdZeXVuYnBY?=
 =?utf-8?B?L251R2lMUUEyOWhNMGFDZXQzK2dXaTM3aWFiaGo0VzlNZW9CZTBsR1VScHkw?=
 =?utf-8?B?ejIvYmhYOXkvcEVGUnlPOCtxZzhGR2czcXhtdmwzVU93S2pkN3V4UzJETVNF?=
 =?utf-8?B?ZXlWSlI1UEdZTHB6SndVLzBGaDh5eWhTYlBqQ3JiK3J3eTVNbkxueHlMQVUx?=
 =?utf-8?B?eXpIMzdNUEVsd09qWkZxMHFBWFlkQW9OS2Y4Y2ZabEdtY1JUL2xzbjY3aTBr?=
 =?utf-8?B?dEJnTzdLTnN0ZE1zOHZkeVEvd3ZKdU05bUJ3WDcyZmVRbTlVcXAzeUZ4Zmlz?=
 =?utf-8?B?NzdzN0s3ZXowMk5VdVo3a3U3Yk1tQklCaUFKaVFrOVZYRjdDVzhuZ00rdkda?=
 =?utf-8?B?MlNOMHJqb0RYWXJlYU56SDlXUHZRRmQxSUNSa2V4QXVGUU40VkFmdDF3Tkpk?=
 =?utf-8?B?S3gyaTVlendPNVVQdzNRS2xJM2hTWDFvZnhHbVlZS0JEeWROMTF3aElsZTd0?=
 =?utf-8?B?WEc3OE9RSFU3blpzY3RvREs5WVVjdVdXUWV6eUdFLzVNUFFXWGx4YkI1U3lM?=
 =?utf-8?B?L2FxZG1mNG9uK1VLU1REOCt1UFJCMmlWUmxDd3U0cjBqL1d6ekNkMGdvRFR6?=
 =?utf-8?B?M3FReUdnSnpoK2V0TUNqd0c5M2Z6TXRveXNLTFg4QzBveHJqbUFuQlpkZXVY?=
 =?utf-8?B?VEIxcGxleGNUeFptdEVUT2N3MVh2ZHA4MnFqUUZCOW9uYlhSaVZxd1FYUDZy?=
 =?utf-8?B?VVNNRVhvbDFVZ1VoTFl6NG1HbFAwc01vVk5SQVhWM2t3RGdtaWpsQzNIQ3RJ?=
 =?utf-8?B?Vm4xRkpjbWRXdlZHaEFXbzBrNnRzWUtycGp2b0J3VXZzNllvNWJKbE9rd2Mv?=
 =?utf-8?B?aDZuTVN2YlVXcUpjYThqZ1BES1hKTlFiOWZoWE55SW0vb3d6YmlQVytxUEpM?=
 =?utf-8?B?bmI4K04yVmZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(921020)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2NzWENlRkZnNGQxU3R0TUozYllSOEExdkhycGZlUmxIblBCTDZpbVprTG5Q?=
 =?utf-8?B?dzdVS2pkeEFLYkhDd3EvTUpQUlhkMHVldW12TEloODVvaS9mL0hhbGdSbnRW?=
 =?utf-8?B?cjhPM0M2RWlwRWlBcnU1MmlTa04zMlU4dWNCMUR2SzU4MlphVzFVaSt5ODRD?=
 =?utf-8?B?RUxxa0Q5VnJERGgzQThrVVJWU3FuNE5PVFN4eTNLOEsySlkrdXFXZG54V2Vm?=
 =?utf-8?B?TVBQb3c1b3hVclhja0UvbXRCNm9CWEh5VnBvOVdEc0lJL01mbmVkUHZJZ0Rm?=
 =?utf-8?B?UmtGNnpFdDZHeERXdysvSzFnY29rZFVYNkJ4UEtSa1cwUVpwQ1FMMnJyTGhO?=
 =?utf-8?B?N0k4c2JTb0FWRnFTQzBBUWhxWjBCRjZrWVFDWkdwMnZNN0gxUU52aTR1M2VK?=
 =?utf-8?B?SDNyd3dqOFpkTWpvRGE0N3RwNFFURklsMWlSK1VldVhZVFVoVXpUeHZBQ25L?=
 =?utf-8?B?enBydDd1djhTTkxzZ0NlanYvQWV3MjVEWW9nSDRCdmltUURvYi9pOEoxL09Z?=
 =?utf-8?B?bFJ4VWxjZWQzb3RlMHg3ZUhpQW9RcFNveXVENUlMZFBUYVYvVTBwdGNjRXpX?=
 =?utf-8?B?Z0VTN2lKR0tobWpJYlZrSXB2YkJTemoxWFpJb21oeWZxKzlKeXBjc24zRWtT?=
 =?utf-8?B?bHJ1ZG1HV3c0MGlQZzE2ZUwxbHR0eHVxRWRtandtRzFIN25ZMk1ZS1dLZTM5?=
 =?utf-8?B?VEVVelZaRk1sbFdUMlZwV1N4YThWQXBEOHdaNFkzZjBkVkljaVJSWmk1QUt1?=
 =?utf-8?B?ZW9aaEVJSHA4WjhXbHZOUDhyVWFhSk1hT3R5UENUaUtlSDlkSU1WeUZ3T09G?=
 =?utf-8?B?MEhDV2V3MUxwanN5RGNwN1dqTElvTU5tRHBmTzdOV0RPVEpSMDRXTkUrVERr?=
 =?utf-8?B?TVJsd1NGMk9MTmJWVG5jb3F5R1RHM0hMT2hseDlNbnNBNlcyTU5QS2JoWGVn?=
 =?utf-8?B?SnNiNkZZN2JnYnNVaDBXZ1BVVTVnU2lYM3ZRdWhEOVRhdkcySFIrajBaTUsr?=
 =?utf-8?B?M0t3UFpwWUl4Q01uWWM5Mkd0MW9BSmRvZlphclk5dUFQRytQWVlHMWcvejNx?=
 =?utf-8?B?VUdkTEdYMU1BVER0anFpUUFhMW5JMHU2eGNSZUFhbnNVdEFhS01GMnFjZUxl?=
 =?utf-8?B?OFNaeXRHWmIreWJDV2RjQVpQYkN4blRKYVlZSy9NUEdmMy93b2MyelFBNm9X?=
 =?utf-8?B?U00zekJNYWNJQzZybjNnMURndVpieHpFQmIwcVdRUWhuZjJzYTMyOGJmVVE5?=
 =?utf-8?B?aldlL1JDRUFjL0dERDUrT2VpdWkvNUxJcWg3N21PV21UMWRvdkxzYThjSTJu?=
 =?utf-8?B?Z3c4aTFWV3YrMVJiZjkvbjlReUlKWFR4bnpCUldCbXpiVzM5dkljWHl0Zkd5?=
 =?utf-8?B?YVJNWnhRZjdTcm1JbVRMZEdQcisxNFlIM2hyS3BONTM3a0pBb2ZNUE43ZWpq?=
 =?utf-8?B?MGpTZWVkdHdPaVE5a0xtdUlIdEd1eEhjbjJIQ0hON2tNMXRsSkZoaEhtYmFY?=
 =?utf-8?B?cDZyV1RyTWlXU1FRZ001QWplYUxBRHVxUGR1TkNTVXZTT0s5aE15bHl0eXZZ?=
 =?utf-8?B?OVVPWk5YZ1MrSEkwczlrTnkrSVpzYWhnbnh0bEcxckZFY1BaRjl2Y3pSQW40?=
 =?utf-8?B?NEJRTWxqalhDb2dBb0hBRWUyWGxyeGdDcTZFWnIzSVJKMmZzQXp4ekFpWWZV?=
 =?utf-8?B?VXdIVFJES3Nib20xbys3YnlTYitvdTUvczFUSmtxWXlHV0JUaGNIZXl3Qk9q?=
 =?utf-8?B?a2xwRG5PQ1hLYitwbHpsWmJuZVlmSEV6VFE3MnZyY2F0SnZueHkxeXl4UFFo?=
 =?utf-8?B?NnovME1wZjQ1Q1ZiY2g2aFAzOGtpWjlyUTJyV3FuTi9uTUJFRm1Sa2FyZ1BL?=
 =?utf-8?B?Y2NIQTU2S0tsLzFUWmluUElGZmlGeDl1SE9YN1lLVEFvcUxDS0t4eFNwYXQr?=
 =?utf-8?B?dnNXRGlhclhjN1M5eG1oQStKcENwbXg4ZUNpUWJwZlNtQmcxeElPUTJXN0pt?=
 =?utf-8?B?MW5lRVd5Umx2K2ZLNWtidzNtT1N4cUZNMVlRaDUxN2VtNjNabEd3Ly9WVGNz?=
 =?utf-8?B?eFFQYkpVakZVODhlUDRNeFEyWElibkFCZU5wbjhTNDlaeGR4NjVGUnlBUktO?=
 =?utf-8?Q?tSYBXHEN6+7TvOsp1HayEoLs2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66f567f-d9e6-4646-40fa-08ddeef9dd4c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 17:05:08.7361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8k2xmUkuHMcjqnYjHKNRN5Rt+yjfdPitwXV5vdCEI7bxJkJQqvrTF1z2fDH9A3qPsY+0yaNyqUfWcj54hbKdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5870
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



On 8/24/25 12:23, Kuan-Wei Chiu wrote:
> Replace the custom bubble sort used for sorting reserved time
> candidates in with the kernel's standard sort() helper. The previous
> code had O(N^2) time complexity, while the generic kernel sort runs in
> O(N log N). This improves efficiency and removes the need for a local
> sorting implementation, while keeping functionality unchanged.
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Compile test only.
> 
>   .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c   | 23 +++++++++++--------
>   1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
> index e763c8e45da8..2b13a5e88917 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
> @@ -2,19 +2,21 @@
>   //
>   // Copyright 2024 Advanced Micro Devices, Inc.
>   
> +#include <linux/sort.h>
> +

Thanks for working on this, but this file is shared with another OS and 
it is not possible to replace sort function with Linux-only sort.

>   #include "dml2_pmo_factory.h"
>   #include "dml2_pmo_dcn3.h"
>   
> -static void sort(double *list_a, int list_a_size)
> +static int cmp_double(const void *a, const void *b)
>   {
> -	// For all elements b[i] in list_b[]
> -	for (int i = 0; i < list_a_size - 1; i++) {
> -		// Find the first element of list_a that's larger than b[i]
> -		for (int j = i; j < list_a_size - 1; j++) {
> -			if (list_a[j] > list_a[j + 1])
> -				swap(list_a[j], list_a[j + 1]);
> -		}
> -	}
> +	double da = *(const double *)a;
> +	double db = *(const double *)b;
> +
> +	if (da < db)
> +		return -1;
> +	if (da > db)
> +		return 1;
> +	return 0;
>   }
>   
>   static double get_max_reserved_time_on_all_planes_with_stream_index(struct display_configuation_with_meta *config, unsigned int stream_index)
> @@ -634,7 +636,8 @@ bool pmo_dcn3_init_for_pstate_support(struct dml2_pmo_init_for_pstate_support_in
>   
>   		// Finally sort the array of candidates
>   		sort(pmo->scratch.pmo_dcn3.reserved_time_candidates[stream_index],
> -			pmo->scratch.pmo_dcn3.reserved_time_candidates_count[stream_index]);
> +		     pmo->scratch.pmo_dcn3.reserved_time_candidates_count[stream_index],
> +		     sizeof(double), cmp_double, NULL);
>   
>   		remove_duplicates(pmo->scratch.pmo_dcn3.reserved_time_candidates[stream_index],
>   			&pmo->scratch.pmo_dcn3.reserved_time_candidates_count[stream_index]);

