Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208E6AB1A6D
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 18:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663AB10EA96;
	Fri,  9 May 2025 16:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FE253bmu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E0410EAAC
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 16:27:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKjIo3YcI9uqL4H+iuw/L+LUd+LGhq/tEVICrpIqLG+oLC0RRW0jL71H8uwdSTF+u/lHdS/x85kuywY5VEltTXJKwzuGQuAbGWO+oB//EkhRPSBPHbx9DqucunhpfvpUKuKl+M+rLpvXO3TkLY4+bIehPzwxPD7dfoFHZrAHA0VM4iAogOSktIRYEe3EcMZ/UgTUFWM3qizTd4YT4f+MKa8RZtAduleBR1PExnWroyiL7Sntg3xGUjsBpn6jP9dAFiqWrr7QQ5CCuJriccagnSpotuMgPax78XLew6vbsM6GofX4fhdXqfmLQxzO0ODwdhNOcll9rAz90UV4OQJ/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WhNZgkVgkfjTPKngMNXygouGDlfM9ZCosCO45N8Bv4=;
 b=Q9Gn9/MOgJK8rKKRjYRwgnSXph7yZsvm8ojBcJIlQIbyfeyvPCfDKl1NaCT41uSfr/Myzq9TA4J3wJhefdwicA2X2c9dx1WOly81N2afJURqZCXLny3EZzDJDtyKY6x2vpScK3BZxkxfXIwx6txX033daZRzPmoQvD+5bbu19zwk6F1f4dUjcyCRj8eDxgoNraNffgHMc2fYHHzxxINOh+btUHavDWLSabFxRB4lEmh1ruLu2R1VY94cWxfIFTFowRAc5mnHaC4qSPCDKLKx9z+JocLilybzfWDRCgMfa+zDybhPl6ZJsnTIZQQ2HxkZwsg7veFQNNnv5ALLnnKaEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WhNZgkVgkfjTPKngMNXygouGDlfM9ZCosCO45N8Bv4=;
 b=FE253bmu4KO+I7pqQKwuf6QN39dVgG7Nc0ebyyY1pnfxOEGbhvYv0Sj7NvYloTwweOpt6FG/3It9s1sHIencMBX1SSxCNaFjVQ0id8eIYt/7GGolaa5x66z1gJnvk9Ifp2NNrD1YO3S9sUZ4jM/enaDd/CZ02lvdyNWraX1Kds8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW6PR12MB8960.namprd12.prod.outlook.com (2603:10b6:303:23e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 9 May
 2025 16:27:45 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 16:27:45 +0000
Message-ID: <4c3ecc0d-9c9e-47c8-b09d-28a5ae18e5a7@amd.com>
Date: Fri, 9 May 2025 11:27:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/dp: Fix Write_Status_Update_Request AUX request
 format
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 harry.wentland@amd.com, stable@vger.kernel.org
References: <20250509092218.805771-1-Wayne.Lin@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250509092218.805771-1-Wayne.Lin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0103.namprd11.prod.outlook.com
 (2603:10b6:806:d1::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW6PR12MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: da031595-00e5-4a56-7a1b-08dd8f166d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzNZSkExRUdCOTZ6MzhaSHF4d0gxSnJWY2libktta0xCR0MrR1RTL3d0UUlY?=
 =?utf-8?B?N1dHMlBGc1VTWm9uNzZGSndsZ2ZBdU11eWF6SzE3d2lOU2xtM3EvSWxaSkh4?=
 =?utf-8?B?YjNUazFLSm5NS2l5Q0RXdTBLK2JINzByRVBPL3l1Qk5iQ3IwTUJ6K0dzeGxr?=
 =?utf-8?B?OThMOE5Fd0VrT1JKZW1sSUNlQ0dUblBqTnBkdzhRSktJVHVLeWViU3BZNzFV?=
 =?utf-8?B?WnE2c2h1V2dDVTZ3UlZEMnVwY3Vvank1Nit3UmZCMnVhdGplOXlBOFM2UGE3?=
 =?utf-8?B?Ym51WnpIMlc4M09jT1F1emYvUGkraGRaeFk2bEZoRkExZFZuanBIOUF0UkR2?=
 =?utf-8?B?V3BpUy9raXhFM04wdDdaODdpeE1kRDFiQTR0aWMyRVliKytHQ203WDNmVWM3?=
 =?utf-8?B?VGd5SDdsM202M3lqbElzSVhxM2F0RUFHWHpSU2s1K2dFZFFJU21QdFE0c2do?=
 =?utf-8?B?S1dXV1pHMkFtTFd0KzVpVWYwZjIwckJqSElNYlNvbG4waTROWEJRemFnWEZF?=
 =?utf-8?B?Y1dKL2ZON29ySzRWYUdFemNHM3R3bFMyL2NPZURWUnU0WGJDdFpyelVFTzAv?=
 =?utf-8?B?UWZQSEsvY29qTHNaVmxxSmJYR1RuVDF1dmsxYXpkNjJsMTFsVUFtSGdROUp0?=
 =?utf-8?B?TGswWnRVYlJUWndtbDlDdS9jaVQ2dWZRcFJuUDY0VXk0U05QdGRpRXBlUmFE?=
 =?utf-8?B?RURFS1crSDZDVWQrekFhZU5INWlXV0U3cmVQZmZlcDZMUGs3VE1XenRybndp?=
 =?utf-8?B?eUtrbnhpcUJuTEpBajlxbjZWeVRkUUFZM3dQQXV6VG0rNStLcVR0QklxRmlp?=
 =?utf-8?B?a1hpQkdIRTRnOVJXdkJwZXN1andFbGZ1SWlPQWo2Qi9uK1R6bXFGVmM5VmJz?=
 =?utf-8?B?ZFh1RVNtQzdLN1FmNmtwOXlyVzdsVXppWGpNSnUvTSs5N2xaOGJwbVdnRmpm?=
 =?utf-8?B?VjlCUXlYSXcxdnNlbU42WXluaW92QXFkYXNoQlF5ZkdrSFppbHFuam5tckJ2?=
 =?utf-8?B?NXNWNHd1Y1JlTjdGODQ0b08xVGJxdGd0T1ZxNDhkZDZ6bmFGekNHaDhPRytC?=
 =?utf-8?B?czJyZENBWVBZSDUxMW4wajNYanRwVTJUaEU4UkMxYUtvZU02Vk9pcGRLcmgy?=
 =?utf-8?B?VGdrQlhhRFNHVjBvUFBDUU5WNnppUGNEanpPMVE4YkVJeTM0Q0ZIUFNKM1RR?=
 =?utf-8?B?UVFObDFGNXEwMGVETGlXVWM5YzNONm53N2FrME5uTG9QZjJqdEZUMGdkNEtQ?=
 =?utf-8?B?SHdGV0gwUFFqVUpqeTZRVC84RitpcDI0OVUrYXBwTVFvTjYzZlhqd3laeUkr?=
 =?utf-8?B?MGorQTM3K1BmTTlISmcrTmRqcmZSZjIyc1JaREUxUkdWQ1YzaWpGbG5iM0hX?=
 =?utf-8?B?dmwzc1VtcXBHVzhtYy9lZEpyQnBySDJwTjY0eTloTmJNME9ldkNCVkRsWXpJ?=
 =?utf-8?B?SGJEdGl2V0ppUlhMTTlPVlJyeVh0d3gyLzdRVVBMMkdjcUZ0NWxZZEIwendB?=
 =?utf-8?B?QlRZb3NiY052K0QzcFZLdFVNSUUwek1weU1pTDFhNXdzWDJWaXBseGcvRGhR?=
 =?utf-8?B?THFYc1luN2ErZy93dXdhSWVkaS9yMmtkOHNYem9kbXNqVmNKM213dW54bm9M?=
 =?utf-8?B?TXhCYm1RTnZVQkxhTUhBRm45c0wxYlRxSEx4dWJKZnBJZSt4TTU2alVDdUUx?=
 =?utf-8?B?K0JTK0RZVnFCcW5KZXdQOFJSa3RYcjZmQ093QnRCQUZRYURRSDBhTDhBVUt3?=
 =?utf-8?B?Y3FLQk53VFhNVHovejdwT1dlbDA1alJLVXNKdkJaSkhjalFTRVhGQVF4MkJ4?=
 =?utf-8?B?WGdPS0UwZks1UWUrb1RRd3JWWFEzMGVwYkFUei9kRmgzRytNeFFWTERkdGhm?=
 =?utf-8?B?T3RVSk0rTmJBWGVNcnA2M1hCLzJRRWROTFI1OTZ6T1hxZnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUhqQWJvZGVvMDI2S1phNU9JWGFKRDk4OFBLWXBvcVBrSTFrdkNxNGV1MEE4?=
 =?utf-8?B?Q0lpV0FEUVF1ZG1Qem9rREIzUno0ckNnSXRST1dMMkFDUmx4UTdubm5NS0E5?=
 =?utf-8?B?NHRyNi9WOVdCeStEUDkwY3puSmEwbTB0d2cwNVV0VDJDa25mOTRFRDMvSERp?=
 =?utf-8?B?eks4emlaMG5XaE5kR2VmQVQ4N2laVVdHRmI2TWNqbDRmSnB5V2kybG40UWIx?=
 =?utf-8?B?dWNNV2EzQzB6RXpzMFF1N1IwV0RvSzZLRmgyRjFqZzRKVEdxTzZoeFJaeExI?=
 =?utf-8?B?NVgwNXQ4eVhGdUtxVjliZE1vdmpDeWRsdUgvbEU1WjB6TW14Y0M2V2hsVnh2?=
 =?utf-8?B?U2tGbHArU2FZSHJkdVBLQnJYMGwvdUJmbko5L3VZOXBqTXZJcmZqdnhVaWJI?=
 =?utf-8?B?ZnhCQVgrSmVhemRGRjA3ckJUWHRxaW9sUDNwWERUUkZSUnAwc01aQVNxNHVi?=
 =?utf-8?B?TWNrdkhJSHpsTFlEd2lBclM5WC9IdDdqbnhRSWhTdzlWV2h5SGU0bk16SjdM?=
 =?utf-8?B?ZnFKVWJMOFYzb0FaellFdGpqL2tNK1lIc1dPc2dndFVqbnV3MlNWajd0amd1?=
 =?utf-8?B?dWdtblVkTG00NmxBYmN3M2gyTFI0aXFVOVVzV21heGZtajcybDRZL1h6SXMy?=
 =?utf-8?B?L2FZSjFrakp3YUp5WFRFM1BFUnVJVXEzRG5oaTd6WVFYVVpVeHNIKzNVUTlK?=
 =?utf-8?B?Mkx5cFR6ak5jdmtic0RyeXIxMTFaR1JxVTJDc3J1dm1ReEo1R1dpcjAwV29p?=
 =?utf-8?B?MkxqYXZtN2E3NXlwSWwxQUJuZEsrWHh6MW1RWGFRS20zOXZxWENWVDFuSTdv?=
 =?utf-8?B?RVV4TU9RNE1XVjFsTDBEK08zdzNXdmZDdGFsL1RPV0ZYYXVQdzN1UkUzUTZL?=
 =?utf-8?B?MkI2MzJCZjNVRzRCUFByTURJbG0vRWhxZUR5ckcyUEQxTm9JajgyRUxlbFkr?=
 =?utf-8?B?RHByV1YyL09YMVVRbXVGU2s0VGtQZ01STkE4eXFPZzBDaVhSV1VNcW4wS3JY?=
 =?utf-8?B?REdBa2RyK1lPczByRnhqLzF0dEdRZG84dXFrcEhjUmNZUTd2WWs3TVhic2Ur?=
 =?utf-8?B?Ukd5R2NNNEZkNTNuNk1neGFUVVgrLytnWlNZd2hPcnFCSEs2d3RJMllHT1Mv?=
 =?utf-8?B?bzY3Sm45aExMc3U5WCtwMnRDc1h4dXo0YXJjU3BUZ2NtdVRKMlVqam9tZUMv?=
 =?utf-8?B?OEVLUmt4Z2tkSjJuN3grMTNKVi83NUg4aHhiVWc0ZmJ4VmR1WkorQjRQejVh?=
 =?utf-8?B?dy9RNm1OamdXMTNtSGhVSjFZRFdadXZ0TVM4a0FncC8rSmpuc1cwZnNDdzhV?=
 =?utf-8?B?ckFvZHN0MFZLUzFXMWZQbk1LSGFhdS9HeVVHZXVTQVFkdWZCdHJIdUNWMG9j?=
 =?utf-8?B?TjBHS29FOUdtU2Z4Q0ZoSTlVWVhlcUtSdEJDN2xqUk1lbUxnUUYxdklTbzd4?=
 =?utf-8?B?S3lDUGo3N0NGdU93YVU0VHJkeWpPanE3WWpGSEhyYjErWGxSbnlGTGxlZ1lz?=
 =?utf-8?B?cTBrRnNiNXhQaFVBYVd1MGltdWVhWm8vUUY0VXBvMXVibjh4RDFXVkczWTlC?=
 =?utf-8?B?L0NlSjFlVEdSWkU1dktQOG9JOHdWOXZHNkNyT3NUYWErZUMrTVZrWDU4RS9G?=
 =?utf-8?B?WUtwbmw3OGJIWGdlQllkb09QN1IyT1crSjBmbzdQb0NOZ2dDZVY5NkI2Q1VM?=
 =?utf-8?B?RzRFRU80c3NCbjJqcE40YnBib3REUFJOVGxPVU15Y2I4MjlxeGdaT09sRHlJ?=
 =?utf-8?B?aHN6QWJRNGdHSnpDUXdCcTdXbXdscW1ydGhzK2hrVWZmcFdXOGZhaWRxVnB2?=
 =?utf-8?B?WWlHVnV5ck9zVlpwM0JkWG4vc3JJU3FzVDZMT1dlUnVpVGxBdTMzSlltMDEr?=
 =?utf-8?B?TmhiRUo2ckZUQWdSb01lYkR4OTZZLzBQdEJnakZjTVo1UlZpWWtTMU1BVDNU?=
 =?utf-8?B?TGVYWkVyaHZNSWxGT0p4S2R6R3AvWjB6anFKNThXRVVIaHRZY0xHU25scjly?=
 =?utf-8?B?bExEWi9mb3hIQytyZDNBVnA4OXZpU2xrQlNpaHJZbUdTNUYrVTRXZUI2QWpI?=
 =?utf-8?B?K2JqZFBnRjVocTIvRThpeGVEME5wenRSbk1OelBKUS9lNWV0UlhGUTVOVXVY?=
 =?utf-8?Q?lqmZzn++0+2rgelm6/n9+4tpb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da031595-00e5-4a56-7a1b-08dd8f166d9e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:27:44.9299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+Va3L5C2vzpcskXzZp5ybNdb5WcwdqCBz58LQIbAcrhYvTsiXdhMn02pb4FPhLYsYzVrzignu9OVbBlbW4Ddg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8960
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

On 5/9/2025 4:22 AM, Wayne Lin wrote:
> [Why]
> Notice AUX request format of I2C-over-AUX with
> Write_Status_Update_Request flag set is incorrect. It should
> be address only request without length and data like:
> "SYNC->COM3:0 (= 0110)|0000-> 0000|0000->
> 0|7-bit I2C address (the same as the last)-> STOP->".
> 
> [How]
> Refer to DP v2.1 Table 2-178, correct the
> Write_Status_Update_Request to be address only request.
> 
> Note that we might receive 0 returned by aux->transfer() when
> receive reply I2C_ACK|AUX_ACK of Write_Status_Update_Request
> transaction. Which indicating all data bytes get written.
> We should avoid to return 0 bytes get transferred under this
> case.
> 
> V2:
> - Add checking condition before restoring msg->buffer and
>    msg->size. (Limonciello Mario)
> - Revise unclear comment to appropriately describe the idea.
>    (Jani Nikula)
> 
> Fixes: 68ec2a2a2481 ("drm/dp: Use I2C_WRITE_STATUS_UPDATE to drain partial I2C_WRITE requests")
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> ---
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

One nit below.

>   drivers/gpu/drm/display/drm_dp_helper.c | 54 +++++++++++++++++++++----
>   1 file changed, 47 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 57828f2b7b5a..c71a1395a2d6 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -1857,6 +1857,12 @@ static u32 drm_dp_i2c_functionality(struct i2c_adapter *adapter)
>   	       I2C_FUNC_10BIT_ADDR;
>   }
>   
> +static inline bool
> +drm_dp_i2c_msg_is_write_status_update(struct drm_dp_aux_msg *msg)
> +{
> +	return ((msg->request & ~DP_AUX_I2C_MOT) == DP_AUX_I2C_WRITE_STATUS_UPDATE);
> +}
> +
>   static void drm_dp_i2c_msg_write_status_update(struct drm_dp_aux_msg *msg)
>   {
>   	/*
> @@ -1965,6 +1971,7 @@ MODULE_PARM_DESC(dp_aux_i2c_speed_khz,
>   static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>   {
>   	unsigned int retry, defer_i2c;
> +	struct drm_dp_aux_msg orig_msg = *msg;
>   	int ret;
>   	/*
>   	 * DP1.2 sections 2.7.7.1.5.6.1 and 2.7.7.1.6.6.1: A DP Source device
> @@ -1976,6 +1983,12 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>   	int max_retries = max(7, drm_dp_i2c_retry_count(msg, dp_aux_i2c_speed_khz));
>   
>   	for (retry = 0, defer_i2c = 0; retry < (max_retries + defer_i2c); retry++) {
> +		if (drm_dp_i2c_msg_is_write_status_update(msg)) {
> +			/* Address only transaction */
> +			msg->buffer = NULL;
> +			msg->size = 0;
> +		}
> +
>   		ret = aux->transfer(aux, msg);
>   		if (ret < 0) {
>   			if (ret == -EBUSY)
> @@ -1993,7 +2006,7 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>   			else
>   				drm_dbg_kms(aux->drm_dev, "%s: transaction failed: %d\n",
>   					    aux->name, ret);
> -			return ret;
> +			goto out;
>   		}
>   
>   
> @@ -2008,7 +2021,8 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>   		case DP_AUX_NATIVE_REPLY_NACK:
>   			drm_dbg_kms(aux->drm_dev, "%s: native nack (result=%d, size=%zu)\n",
>   				    aux->name, ret, msg->size);
> -			return -EREMOTEIO;
> +			ret = -EREMOTEIO;
> +			goto out;
>   
>   		case DP_AUX_NATIVE_REPLY_DEFER:
>   			drm_dbg_kms(aux->drm_dev, "%s: native defer\n", aux->name);
> @@ -2027,24 +2041,41 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>   		default:
>   			drm_err(aux->drm_dev, "%s: invalid native reply %#04x\n",
>   				aux->name, msg->reply);
> -			return -EREMOTEIO;
> +			ret = -EREMOTEIO;
> +			goto out;
>   		}
>   
>   		switch (msg->reply & DP_AUX_I2C_REPLY_MASK) {
>   		case DP_AUX_I2C_REPLY_ACK:
> +			/*
> +			 * When DPTx sets Write_Status_Update_Request flag to
> +			 * ask DPRx for the write status, the AUX reply from
> +			 * DPRx will be I2C_ACK|AUX_ACK if I2C write request
> +			 * completes successfully. Such AUX transaction is for
> +			 * status checking only, so no new data is written by
> +			 * aux->transfer(). In this case, here we have to
> +			 * report all original data get written. Otherwise,
> +			 * drm_dp_i2c_drain_msg() takes returned value 0 as
> +			 * an error.
> +			 */
> +			if (drm_dp_i2c_msg_is_write_status_update(msg) && ret == 0)
> +				ret = orig_msg.size;
> +
>   			/*
>   			 * Both native ACK and I2C ACK replies received. We
>   			 * can assume the transfer was successful.
>   			 */
>   			if (ret != msg->size)
>   				drm_dp_i2c_msg_write_status_update(msg);
> -			return ret;
> +
> +			goto out;
>   
>   		case DP_AUX_I2C_REPLY_NACK:
>   			drm_dbg_kms(aux->drm_dev, "%s: I2C nack (result=%d, size=%zu)\n",
>   				    aux->name, ret, msg->size);
>   			aux->i2c_nack_count++;
> -			return -EREMOTEIO;
> +			ret = -EREMOTEIO;
> +			goto out;
>   
>   		case DP_AUX_I2C_REPLY_DEFER:
>   			drm_dbg_kms(aux->drm_dev, "%s: I2C defer\n", aux->name);
> @@ -2063,12 +2094,21 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>   		default:
>   			drm_err(aux->drm_dev, "%s: invalid I2C reply %#04x\n",
>   				aux->name, msg->reply);
> -			return -EREMOTEIO;
> +			ret = -EREMOTEIO;
> +			goto out;
>   		}
>   	}
>   
>   	drm_dbg_kms(aux->drm_dev, "%s: Too many retries, giving up\n", aux->name);
> -	return -EREMOTEIO;
> +	ret = -EREMOTEIO;
> +out:
> +	/* In case we change original msg by Write_Status_Update case*/

This comment feels unnecessary given the name of the function..

> +	if (drm_dp_i2c_msg_is_write_status_update(msg)) {
> +		msg->buffer = orig_msg.buffer;
> +		msg->size = orig_msg.size;
> +	}
> +
> +	return ret;
>   }
>   
>   static void drm_dp_i2c_msg_set_request(struct drm_dp_aux_msg *msg,

