Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2CCA5E32D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 18:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291D510E32F;
	Wed, 12 Mar 2025 17:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NAnX/04v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CB710E197;
 Wed, 12 Mar 2025 17:56:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQowu90qbH3O2N+3HjTCeFezjwj6QmCQv8LaveEHLdZ4T4RcpCQ5HC0xaTUerz2P/IGrM7qVTagREi7JAk1BNLQdejPpHjfHsKdF9cbWfueRXNS1rKz/obNP3MaiuRxOffHvD573y7WTpktnc4YJ55biJYaBYKpPliR7kO3sslQONldoyum/J1ueTHbqE2ojik2zL28jCLcR9YyTTxdCFfJy2rSyr0ScASjbVVPiqsp86roZTg9eSaNqhsYjePGDJfIdwe9MdcPHRWeWk4kfGY/kD4YNWunPFJ+JcPSxplg15aDhU2v8FVcpDxcijC+Oa51gth41mO1ksONA1eEpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtI2AIihnW/XNx8IOyRqJbDqXO9ptndlEt0wH0DcCmw=;
 b=grCpXhZa1GIEXWMznavZtVRQR9rK1QLJjXJzZwivjwtekwYN58b9U0iDMBxhqpZCUdlzrpw4PioLYgeL5Y07BdbLIhuByNVrB+tZ7KpF9cFewzreGRZmI54ht6ksaSNMiZEbDhCtnO78P/kq0XCX8IVgnQbnHxb751RtgjbejG2MliwrK4FnmMrPLkkFWWQ8vj50joZNAUXoRbg1UbsNMlOz2vyENACTIJRJNm/XjJSejm0Z1lYgSmypzckBl06vf8NC9iesIxjIZr5YFIwHHFSOCqtP4dMfHN7ZddWPRinmHtWqdk0++X1/N+gPPXmPRvoE7t75x8R7LUa4kl263g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtI2AIihnW/XNx8IOyRqJbDqXO9ptndlEt0wH0DcCmw=;
 b=NAnX/04vCIZhJbBqBZsD4o2YG21s77Zh+bUGMV0aG31qRrajLWsffT6fdwc1tFixu9STQwPI5kGdfX+yDgBnTvkjgtrHCPndGGQAaHpGNotYR5f0nbpiE/kC2DkNkUMr/qdFNfOUIl8hXNIpvnPJPvgYqPuxK20xGNSk1QVyqO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA0PR12MB8929.namprd12.prod.outlook.com (2603:10b6:208:484::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 17:56:51 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 17:56:51 +0000
Message-ID: <777c97fc-fcd9-4b22-a8fe-095f2f7bad52@amd.com>
Date: Wed, 12 Mar 2025 11:56:47 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Remove incorrect macro guard
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, jun.lei@amd.com, aurabindo.pillai@amd.com,
 airlied@gmail.com, simona@ffwll.ch, Samson.Tam@amd.com,
 Navid.Assadian@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250311171017.3053891-1-alex.hung@amd.com>
 <5577b032-dae8-41d7-9e30-abba60a22c44@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <5577b032-dae8-41d7-9e30-abba60a22c44@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBP288CA0030.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::28) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA0PR12MB8929:EE_
X-MS-Office365-Filtering-Correlation-Id: 30497707-b25f-41f3-034b-08dd618f4451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YS9xNjFLT0JmZ3hsSHI3NmJhcGY0NnNwV3ZpejdQckJNZWxmbDFCNG8xMzlR?=
 =?utf-8?B?SERKYmFjN3djT0M3RDlMSVA1T1F0U1UrTDFiaWJ3d0s3NFk0aE4zOStJamdM?=
 =?utf-8?B?a3BiT1JlMHJtSnhOYmw3U2hocEY5ODlWd2h4WUROL3laT0RoR0Q3WmZKMG9T?=
 =?utf-8?B?UTljcjlVNmZmWlkvbXlKa25aWGhiZHNTQlk5Rm9qU0E5bmVXeTJJd01sSmZk?=
 =?utf-8?B?RnlVSUNqSEk5c2U1WVFERVhuTVVlbkdLSW1hUFl4SVp3Y3dBS3BmTGU5WVgr?=
 =?utf-8?B?YkRjZzZZcVVveDdEcEcyZktsZitUSTR3ZkVNaXZhTE1EejFJODRFNEFCSVN6?=
 =?utf-8?B?TnFnTGVubWtqSDdaNmtEN3R1clZGUmtFVFBreXZoTDJZd2F0VUR3Y0NGcFBl?=
 =?utf-8?B?QlNXR1B3SDMreGh6blZVK0NHZkZLMUJscUUxdmcyZHdNbGpXVW0veUFuTFZi?=
 =?utf-8?B?RWJaRDZqNXA0am8xN2pGWXQ5TlFURFdYTHpvaVZ1SGhQTkdlbTR6NVR6dFV0?=
 =?utf-8?B?WFFTRzc0TmR5N1FvbXBEMkt3UlJkTW1rL1FOUk9ueWR2TzA0SkZLTTRzRlVy?=
 =?utf-8?B?cndnSmxPdFJsUWliNis0aGdsS1BGR25UUGZLQ29wQVVXa2RYMSt2dDk2cGNK?=
 =?utf-8?B?dWY2cDkycTlLWno0SXp4eWs0K2xkS1dVRjJUQWhSZDBqcEp1amhCMVorSDRH?=
 =?utf-8?B?Zm5NT082WWpkQXZYWHJEWlQ0QjhZOGRMeVZSNmU2WEdxeUVsMGhpTDVGU0tn?=
 =?utf-8?B?TGIxaXlZTHI5YWlZWE91anVWdW9NOHpTZTdMaDhBL1VpSjNvOUJucERPNGsr?=
 =?utf-8?B?Q095bTNrWW9hOVRUaEcwUVI0U0tXRnkvV01EcjFNVWVtZ3BjQXdOeUpXanhC?=
 =?utf-8?B?ai8wbWtSelIvOGF1SkRPS0wwRXdpWEN5VXA1RndRenNTZDh0dDlpS0hDUUVp?=
 =?utf-8?B?YU9qeHd1K3h1ZkxmN1JNVGMrc3VQOUFyd2JpcXlBdVBxUmltVTlmMTNQOEZY?=
 =?utf-8?B?bW1JSk8wemgrb000d0xqK3FmaXNWd1RmeXIzbHplQTRqKzZZMzhMM2hDZ1Ex?=
 =?utf-8?B?MlA4Z0NDcFdSVXk3dHozbnBkL0JxeHk0eXFoMDBRSlhXNGNyVlJlQWZ1QVdG?=
 =?utf-8?B?c09uWkplZ3RZSDJGOTZOVTJvemtZcnFOSTVIQ3JuM2VVWFd3dXQ5dzhxcWpE?=
 =?utf-8?B?L2pBZDJzNStRM2xqWnp6R2xPM25nbzlIbUFRMGdTVkRTWFNlK1BGUzIvd1cy?=
 =?utf-8?B?Z2RZTGJiaUZuQWQ3YzMvN0I3K2Y4a2lSV0c2L2VtNDFoY3JSelFpaEJXUVAz?=
 =?utf-8?B?OXZialFaaDN6cFgxVXcyenRJQ05SNGJsb0xhVHllTXNyS3YxN3M3anEwcUND?=
 =?utf-8?B?bTdzYjdhWE5QMnpVKzZHeFNEcWY2bmFBN2tpTDJ4N2p4ZFZpN2xhYVpQY25L?=
 =?utf-8?B?VURPdXphTGxxYWREaVV6YmRtVncrMGY3alVEM29RM0Vka1hJR0wwZldRc0w3?=
 =?utf-8?B?WTJ0UlkrTTNNTmVzb0YwN2xBVDFIUm11Y2tFRlhWbDhSbzhaN0sxKzEwVExn?=
 =?utf-8?B?NW1Uc3Z2QVVqMVNCaDdOSGRzbzlRZFNxZWhCZ2xhL0U0YTRMSnp4QThnZVRI?=
 =?utf-8?B?S2c4ZzROZFpCVlhOYndxTWtHaEFMaTJWTXoybkpkYVFoOVZMZEwxZVlKSWlN?=
 =?utf-8?B?Zm9GclZmS3pQRFN4WXNVZnlLR1BKb3ppSDEydFd1STV5Rzd3Z3MxZ005dW15?=
 =?utf-8?B?UGNUb1F5K0kweXFsMG8wdEI5VXFLNHJsbTRhMDVreDEzNjZwMUYwT0pKekVO?=
 =?utf-8?B?K2RJeHNubmxoSktYckVaNzJhRWJsb2ltOVAwdElScVI3a2pzRlpKTCtYbHhD?=
 =?utf-8?B?MnJLS1Y1UC8wbWpta0F3dEpYRXRweENWUjNDbS9wQ1Qxb2tWcEtTTFR4eldL?=
 =?utf-8?Q?7/FNrifaCM8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW8vejBKT3V4UHFLemJhcFNkUDdPZW44V285b0cvL1pFVFY0Uzc4VWF0MTR2?=
 =?utf-8?B?ank4cjYxMVN1OG1KOE9iM0lvYUNxRnAvZ2MxK1YwU3hoeCtqNlBCMVJYZzVv?=
 =?utf-8?B?U3FMNGRvbG9uSWtDTHJKSTNjK1VsWjR1Tm5qR1lBMkZ0ZFRDNDFxUnROeDBX?=
 =?utf-8?B?RzJtN0N0NDNHMU1vY3hhdVJsSlJRWm9GU2FrLzZqa3JjYk1qSEtWUFljVS8z?=
 =?utf-8?B?UjUrL21qejZsZ2RvRnJ6b250dnJ4ZmcwNFJsUWlzdktDT3JCWlFvcU44WmhY?=
 =?utf-8?B?T1QxdnRzUTRPbjEwRUE4SXI1YXpGZ2I1bDZ2N29yVHd6YWlqS2NUQmxkdmZ2?=
 =?utf-8?B?cVlzVFpiVjc3cnVZZ2ZFNUMyVWhaU1c5Q3pDUUIzZ0xWb2RHa0pxUUpJTXNM?=
 =?utf-8?B?NW5EdFh0emFQUFZEV0FwSGpDK2FsNG5URUc2WUVKRDVuWVpGM0E3WUlOU2hV?=
 =?utf-8?B?cmM3cDJaaHdaSTlLV21kaXN6TFJnc2NHTDRnei9INVphek9IUzFQWGRFWVFX?=
 =?utf-8?B?Z1JKSDV4Vm9GSzZHY1lZcjR1T1hvc3FLaVg5blZSWmUvS25JMStSbTFzZ0pC?=
 =?utf-8?B?K3hsWlNlNDZyTVlOSFNyOE9mM2lyS0hCRjBGTkh1dGxMeEU3YW91VTdrRnlH?=
 =?utf-8?B?WlRGejhaeURLN3VCa1FCSnh2bFRVaFBSSVZSU3BidzNWekwrQmhLc2pmR1R4?=
 =?utf-8?B?SkhZUU0zcVlBaW5wZEZJdG1vaWR2eTB0NGMvVWk5eWxsSlRLSWNHUjltbGdq?=
 =?utf-8?B?MDNUU3d1NEZUWVVIblJSN1ROMXJVUDRhRnBPbVE2Um52NURDQmE4SlNETnVQ?=
 =?utf-8?B?NTdHNG81RVhnTzlkQ3N2ZXllRUsxaWJ2R2JEVFhQdjNGeXNPODhFNzlHZHhN?=
 =?utf-8?B?eDkzN3JLbitxUEJ5bG10MHltRWI5VVZ1TXdRazNZbysvUjlUdWJNTDNLRnQv?=
 =?utf-8?B?SFg1TkpZT1h2OWRrUWk0b09ZZXJDNm9RSnh0NmpNeS9MZ0twdkUxWXBjcGp1?=
 =?utf-8?B?Um83Z2ZZZXB6bFMvVHR6RG1MT2ZIaTJ1aUJzeCt3VTdwcG5pa0VPaHc1VTN2?=
 =?utf-8?B?TzE1RCtHaHhmdWo1NGtqaDNlUFRLQlJIZWV6QVdGYVFIbC9rREtSU29TM2VZ?=
 =?utf-8?B?MEdrVzJFRElyUWxBcDVhclRoSms4aE5oWEF4ZDBKcENKZitSVnB0YTQzODJo?=
 =?utf-8?B?ZklBc0JzMlJxdkRORlhMTU5NVEd3blo1OGVnaWZGZG96dVJGLzR5V1g4YnVu?=
 =?utf-8?B?T1poL1ZVQ3RaZXpJZ2w1a05qZDVDRDFtYlJXNXFGNHN2VHNHcXRpNGFpZVVG?=
 =?utf-8?B?YXVCNDR4MDFRaTRVTi9GUTY3bjUvSlpYYlErWFdHcEdsc1o0VmxzQTkyekJQ?=
 =?utf-8?B?WCs0Vk5idk5JVHJQR2N3U01zaXkxZGVoMk1GREVrS3ZoYmpoS3NTbXZLMWZu?=
 =?utf-8?B?VUdObUJQc3YzUUFTMlR3YlU0NjBBN3pGR1B1eWxJc2hrNWlPeXVJN2hnUmJ5?=
 =?utf-8?B?VGZldFp0TTJ6RUQxUXllRG9qcUd1eEZSdWFxVU9XUHdMc3p3bHdjRkFEQy85?=
 =?utf-8?B?THRTeFJBRWxIaU41WEZvOGVFKzVsODhDMjBHRHI5M0IrS0wyZTArT1NwaXJq?=
 =?utf-8?B?Z0lIdFFQNm10bFZNL0pXNkxwOSszQVVFSklrb2J0bVlpYUtmYk81V1dFbWV1?=
 =?utf-8?B?OXYxSWdHdk1Wd3p5Wi95WExOdlhjbHMvTlJFNTlrSTh3YmtzbTREOS9aOXhU?=
 =?utf-8?B?YnQzWDBQMnpEMm5mS29PY05QdnlGK1FOYWFWcGRVM1dhVjJOQjFha004eWh3?=
 =?utf-8?B?R2tpRi94dUpwK2hDdFV4c21mbmIyOGlRMzRaRk1kdHMzcmMxbUEvOGZrcytZ?=
 =?utf-8?B?NzVxeGoxVkpYQ0JSMmxUQ2RveUlmZ1VrTGRCQ0liekFQMUtJalAvcE1kNTBp?=
 =?utf-8?B?eEMyck9LajdyK2RJTjZwemo5M0h3UUhDazhLNk1Ra3NUN3I1TDNOSFdKNDh0?=
 =?utf-8?B?LzhuV0hRNzBOY09VTjlSSlN5a0FTTTY1SVV4WkNIUUlDNjlwYnhIMXJIbkRl?=
 =?utf-8?B?WTRieVVWaXQvY3M3MkhkZDJIT1FHc3NiZitscGE5U0FVc3hGekJYOCtsbkk2?=
 =?utf-8?Q?wVwMWxXiMKxiEMNRscM/2t+gv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30497707-b25f-41f3-034b-08dd618f4451
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 17:56:51.2976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2v1A8af/jV3DdjsK9AojiwsBEsuhRTft9A3wetUYuH2dn/IVi9xytUwHC3/zohOe2g7gSBYQ8cub1dbOgk23FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8929
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



On 3/12/25 02:11, Christian König wrote:
> Am 11.03.25 um 18:10 schrieb Alex Hung:
>> This macro guard "__cplusplus" is unnecessary and should not be there.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>>   drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h b/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h
>> index 145961803a92..d621c42a237e 100644
>> --- a/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h
>> +++ b/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h
>> @@ -17,9 +17,6 @@
>>   #define SPL_EXPAND(a, b)          SPL_EXPAND2(a, b)
>>   #define SPL_NAMESPACE(symbol)     SPL_EXPAND(SPL_PFX_, symbol)
>>   
>> -#ifdef __cplusplus
>> -extern "C" {
>> -#endif
> 
> Just double checking: Is there a closing "#ifdef.. } #endif" at the end of the file?
> 
> If yes then please remove that as well, if not feel free to add Reviewed-by: Christian König <christian.koenig@amd.com>.

There are no closing one at the end of the file. Thanks.

> 
> Regards,
> Christian.
> 
>>   
>>   /* SPL interfaces */
>>   
> 

