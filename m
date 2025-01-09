Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685FEA078F5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 15:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F8110E455;
	Thu,  9 Jan 2025 14:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vUmQMSr1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB6710E455
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 14:17:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBJPtc9vW1GsVxWLwnxHwRXBJaV1b3yuKHAeSUXyBtGmpQVx18ozp0agmspU8qnWY+bFbE31jLP00DPqy0rGacyjTJYBelFh6uwvioa2wXimhT/dcSsPmEZa6KWVCxSwEZ0znHHmnE313kVt4afT9GcXAvhP9QkqTSAASHs2fiJNDp5aMMIPTCd4clK36+Td0q+ze3ZQvihtoeOcfZpgJgf6FEFXhindAfYwMmTESDfq4QKJPXIfCyUpyW02lykA1Svh1Y3IxWO1CQBRrD8QDhtEwigvleb7EmKtOyWRCykNYxWt9Uz8uo4axLjotEbAqotCDasR9oSjKhdvnLoPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zT4lKkj9F939R9INGqbdLKKGLcSGoD5d2z+hNhyUyd8=;
 b=jiqky9Y4yJAEf8Nr0Y74zARnQou2Yqf5+zthLpW8/+U2SuBfQ0hPYDRsUSyZ97SUSIUyUYUBDD8qcsFVooO8A8/7Sjl+lWBEpRnmi7jGt5pJQbAmSWSW5W6snnHNgFHfceiKEj8lofeiUGZh2RD8BHSWmrq0TqX9nWnbx9HxWhGCgAiMbKk+TfHKBlfn1Nr57dWO+WHb90muQfJMgL8J0lBB+SyS7Csl/XlFi4M0AsS2HiH23gI3WhuQu5mjJO2dK551CywEIDl4F1pGguReF325EetFN+ip0HPtP2VA3Ymk1OF8JIkbJjvzir5eb0OKrWoHI1p20logmlU27qyrDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zT4lKkj9F939R9INGqbdLKKGLcSGoD5d2z+hNhyUyd8=;
 b=vUmQMSr1ulABl1V2MdXjG4OK7anw7HTY5CDsU8l8OlGIZRLHha5ThHSGpkET0tXbOMvajdPH/P3pYFtsJ8GZl3bWjX7jbuFmbxPpS9sRYVJ9pRn5I5mEW90tHC4IDVtYctT7gcgkCEPlp0qx9uKWCM2Nbijp8rDWUCMN8aeZiCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB8345.namprd12.prod.outlook.com (2603:10b6:8:d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 14:17:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 14:17:38 +0000
Message-ID: <1fdb8580-be43-4119-abb3-44aab2e2e1e6@amd.com>
Date: Thu, 9 Jan 2025 15:17:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 03/18] drm/sched: Remove one local variable
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-4-tvrtko.ursulin@igalia.com>
 <6fa2fd44-c01c-4c29-b3ba-3e1e36b68605@amd.com>
 <b1abc40d-ebef-4426-9f81-2c3da6b08ccc@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b1abc40d-ebef-4426-9f81-2c3da6b08ccc@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: 94af2bc6-a63d-4b8f-e828-08dd30b85ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUU5MEVwYmFBQ1lteGFTR0dNbk1pRVJwRW1tOWtyeFFYSlg1RTJSQXREUlAz?=
 =?utf-8?B?dzM3UncvMm92cHdneDlCRFF0RG5WNG1tRXdJNElUV1RBZDVVbksxelBOMi8y?=
 =?utf-8?B?Z0k2WFlQNzJVQ1FrT3BPVzFBTitwTnJyMDkzNlZtT2IvK0JRb09kRlUwYUFT?=
 =?utf-8?B?eVpaM0c4MnJKTHNSa241Sm5JaGtPcG5xdjZMSnY3MUdWdWJYTGptbGJ5OVdN?=
 =?utf-8?B?TS9UaFBZMUVQaVdROXpnZ0RLQWFrY3ExeDZ4NDB4RWlhdHBFSWVCOHNPYnVl?=
 =?utf-8?B?VFZuZUtMNGFPM054azJ3NllwZStxNzZ6blIyWlg2cjJwWE5YYVNKaWU1Rjdv?=
 =?utf-8?B?Zk9ERkE0QTIwb3RaT1FoU1ZmWkZRazN1T0thK2kvR0dvcWRIaVY0VEVraE1r?=
 =?utf-8?B?ZjBrTG00Mng0ZkRUNVZwa1gvc3dwYndKQ2lwdWhXQjJzNDRoMlphTUplb2kx?=
 =?utf-8?B?WVFETDdrbnk0ZFpFWjAvMzJ0TXVCTnQyVVU1dmtQeXNxREUzTnVaalB5eVNL?=
 =?utf-8?B?cWpreThIaDRPYVg5NXBhOWU3QjkwUWNVZG1FRjVUc1R5N0FSY29QUlVlQTVl?=
 =?utf-8?B?anRib3k0QzNlUWcycUh5ZGh3Z3d5aTdpcVdRWlpDV25VWmlhZDc2YTVldUVh?=
 =?utf-8?B?N1FmQnc1Z1FUSE1ZOXlQT29CSCt1cTdSY0ZDdXJzWG9QUWZCekhhRnZ3T29s?=
 =?utf-8?B?RW14U3NSRlRaZVA3a1FXT2VIMXFSV0l4VGFuMFV0VDlwNnRhZ2krL1IxenFP?=
 =?utf-8?B?U1pBMEpDcldHcUUwTjdSdkU5bjVSSVNmVVdWenhoV1Nzby9adVNHWitSNEpu?=
 =?utf-8?B?QTh6UmJrREJqSFZnKzN2MFpGcXJWWmFYUjBXdCtFS0lZV043ZG4rTUhaZzlx?=
 =?utf-8?B?Tnp1S3REQXdlaFpKQ2JqM09iRFk0RHRXQjZTM3RXenBGVTQzalNVekEwMjR6?=
 =?utf-8?B?VDNmRDJxQnB5MkZmSWZqS1luNlRzcEFjSjRWcVBFalhxVWxocEJxTUx0RWpi?=
 =?utf-8?B?U3lmblZmcGU2aC9qWTlFYzFJQmVnYWZmVEhqZ0xPVytVRjVnc3gyZkZOSXlL?=
 =?utf-8?B?SUJ3VlJDV2FOOHFsWUx0NTZnOExCZUZvSUNKaVpuWU9wdEhsVjhZWmZKZ2ZP?=
 =?utf-8?B?VTFpc2x1VEplN3E2TzZTUXdOcjNGajZtbmovSnExRXdXREtGckNOMTBGdW5q?=
 =?utf-8?B?Wkd2Q2RSVkJqMVlVR3dvYjVqSDZVUHBVYkRwV09XcW5JVjAvbVdoZFZLSEth?=
 =?utf-8?B?eitCYXp1SHhVdkY4TGRFTGNJMXpiSmhuZU04dEt4a0I0S1A0enczVVpPdEJv?=
 =?utf-8?B?LzhNbDdIeUoyOGNmMEsxTzRKVFhYeVNrQ21xQThTRnozR0N0VGpjYm52REZM?=
 =?utf-8?B?OHViemp4M3BDUVJaYk4vNVYzaTV4b0MrWkhDTzlUY3djc1hkQ1lHaUE2STVt?=
 =?utf-8?B?R2h1VThOTU5VSlpsbkMyYTZybmM4dUcxZmJGM2QvL24yYjNWYjFNOHMzeUJv?=
 =?utf-8?B?VTBSMlpBWEo1REtvTjV0aHVFWkw0RG1xTyt5RTFMOTBCZGl2RjdXenZUNGNs?=
 =?utf-8?B?Mm10NEZrSHkvYUVPYUN1TEdFVHdLK0Erc3NIbWtSaHkvY01lT09rblFBcmVC?=
 =?utf-8?B?WVJxSWVweGpIT3RkUE41bVFIZEhLNGY5NEVqb05SeFNNc3ZIdzB2am1VWHdo?=
 =?utf-8?B?MU9JNTBZQ3BNdm5tSWw0ZUFLNWs0U1VVNmhtZUYwOVhmRkxHcEpEVm9Nd25F?=
 =?utf-8?B?Wi9yZzMwcDZVMkRmY1kxVlAzbHB6NEExaXNEMWptdmRmRjZpNHhYWUVXekU4?=
 =?utf-8?B?bXlSMmRFYnBncjNUZ1pCNm02WkJNMUkvM0VBaGc4WlkzdnNNdmppVW9rQTha?=
 =?utf-8?Q?a1FyF3jEF8Gf7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFJGalZVSUNMYkUvVVFISCtOcXNOWG9PWC9xSlZmOTQ0OVJ6ZjhZYUVlNHk3?=
 =?utf-8?B?ZHcycWdNcW1qSzRJcG9BUXl1UVZ1R1lMMm9HUm9ENVAwN3VPa0VkR1ZEOUFl?=
 =?utf-8?B?SStwRWE2RVhSSFg2OCtGU1piWnJzdjdPQ2gvZlBuNmJLalRZUnpNV2Mrcml3?=
 =?utf-8?B?OEVRZFlDNWJDWUZPNVRnZ0JwbHlPOGM2M0hpaGxZYUMydHczT2lVaWxFY3Nt?=
 =?utf-8?B?c3phdy9BYk9IVGR4N3dRUUVQUUcxSVp5L3Z1OG1VSndBTEYrUkl3VlhkbUJB?=
 =?utf-8?B?STVMbVVHL1REdUg4Y3Yrc1FKdmRGM3ZmMXpBMk54SFNEM0FONGZWbUMrektT?=
 =?utf-8?B?Ynh2cmdmYWk2alh6VnNXeWt3bTFBbzc5Kzg4WXZHZUREYklqTVpUQlpiQW5F?=
 =?utf-8?B?VWxQeUtvVk8vYUtST2hwdGQrU1RveEd0YzRyMGR2dUV1d3MyZ1NkNlpwNlA3?=
 =?utf-8?B?TG1ZTUJzNnRNZHlZeDhteFc3THhPSDliUm5sUXlTWDBMbE1hQVdPVVZhMURo?=
 =?utf-8?B?YzdpdHV5ckllOTRKd3R5L3g4SzVHQk54MnpTN0tWbTJVc05uNnFHa2Vxd2Vs?=
 =?utf-8?B?ZUhUYjZQajJ4K2UrMG5RcEkya0xiZW9NekpkRks1ZmRRUlBrOWlYby9HcTUz?=
 =?utf-8?B?eE5BS3F6cmREMklxRGhLVEhWSWxleTlkcUM4b0o2TnVZcmp3VlBDTTNvUDMz?=
 =?utf-8?B?bEVONk1PcXIxQVI0L0xnZE1XbHZyN1A2ZG1LRUVyU04rODZFakpiVUtLRkxR?=
 =?utf-8?B?UldTUXUxbXRob2pXSHc2T2RCNm9Tc2NQdVNxOTJRWmtGTElWWGdXNjFlaUZQ?=
 =?utf-8?B?YWdWNVp3bklFdzJJZEVmQTcrVGpSL1lmYVVkK09MSHFHanFrcktCak5aWXdv?=
 =?utf-8?B?aXZsYVFQc2tBRmdoM2JLc1RJc2JrTkp4WHNjQ1BIa2F0dWRGMjE3amxBRUtS?=
 =?utf-8?B?cEhSRFBhbkF0dmdKczJiVE9yb0FOdS9jOHR3VDc3MjFNYjBpbHR3bHZ5bjdE?=
 =?utf-8?B?VXZPWFd5TmJyRTNybEZMdXJ3S2ZWUzREQmVLRWJuSUxsdEQ4djk3YmFHVzBE?=
 =?utf-8?B?Uy9uSmxKMzQwM2ZLT1JPbzZtc2ZvYXViaXAxUVFpZy9BaU9oL3ZLdU1IdjU1?=
 =?utf-8?B?a0dxaHlPcVhCMXB5MEJvcDJhS2VPaDRHcDdDWjdjc0NTRmNEOEhkM0hQc2pu?=
 =?utf-8?B?eHpVR0N5YXBSTEd5YjhwbUlhY0d1cmtkODlxMUR1TC9LLzFwS2h2TGZnVE0x?=
 =?utf-8?B?b010RTU4U0lDQ2lEaTJJM3hJMnBBT1g4SjRuVUNtWldjZEM5b0d3VzRJR1dK?=
 =?utf-8?B?b2dLSUordXdray9MeE5RZGM4c3A0SWNrQnd2YXJTUVQyV2ZUdVpFdjNUdTNF?=
 =?utf-8?B?NjVOUlFXaTlseE9zNFNZWUZrSGtnanlMUGVndm5yT21sL0cxSTc3SGhpZ1RC?=
 =?utf-8?B?TW13N3BoNHVGUUJGbC9wSVV3NEdwQS9pR0hud05EQ0dWSHRlQmd1U094TS90?=
 =?utf-8?B?VE9Ra0FHdFFBUVhiWjY1QWp3TFpNa0twcXBLMTZ0NTl4TTV3anFscHZJSWQ3?=
 =?utf-8?B?SnFsaC9WOTZVclZsaXIrN1BzRlhnZ0hpaFZabXd0RndObHlBOFU5M2doa1ZV?=
 =?utf-8?B?M1BIV0RwQmFTMElyczkrVHB1NFBBcXlSVFdVYU1CdHl5MjRoQmpkMDQxdlg2?=
 =?utf-8?B?dXZqUlBtWUNjUUd1dlMzWEtMYS9YUUgyekF4Tkg2QSs4UGZ0bTNMWGhGL1B0?=
 =?utf-8?B?eGhpb0dJTTdWeU1Va3BZZitXczQ1cndpN1M4cEdjZldXMWpiRUxPR0ZhTG13?=
 =?utf-8?B?OXV3ZWs1OEQrbEw1NUp0djBXdjUyTVNKeVlDSmNBVG43ZW1wNVBkWWg2WlpZ?=
 =?utf-8?B?NHE0cDlRRm1vUWxEVTI1RS9HaFdaQS9iSE9qQWs5MFNpS0ZUY2lGTVFPS2lH?=
 =?utf-8?B?VlJxaTg1MHFIRjMvaUExRzYyczN4RWFuOE9PdUxYWWxsU25DcWtDenlnS01v?=
 =?utf-8?B?SS8xbjRZVzk1aDFFelRTZ080ZUcvYWovTWRtQW9rSko0dUpiQ3ltTGY2MERW?=
 =?utf-8?B?YkJsRXRYV24xOUhzUE0yVWJvOGxqNGk4NFFUNUtSekVEN1hKSWJnSEJWN05V?=
 =?utf-8?Q?/2jpcy4vK0k4jgsFBeWPuS4ST?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94af2bc6-a63d-4b8f-e828-08dd30b85ed5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 14:17:38.0669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3LRv8eaGw0J3aNmYIdb4j7N3L7nmoerp8Qlz2zZ3u9ngjOE9Cnb6umQKOwIt7Ze
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8345
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

Am 09.01.25 um 14:20 schrieb Tvrtko Ursulin:
>
> On 09/01/2025 12:49, Christian König wrote:
>> Am 08.01.25 um 19:35 schrieb Tvrtko Ursulin:
>>> It is not helping readability nor it is required to keep the line 
>>> length
>>> in check.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Philipp Stanner <pstanner@redhat.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 5 +----
>>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 1734c17aeea5..01e0d6e686d1 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1175,7 +1175,6 @@ static void drm_sched_run_job_work(struct 
>>> work_struct *w)
>>>           container_of(w, struct drm_gpu_scheduler, work_run_job);
>>>       struct drm_sched_entity *entity;
>>>       struct dma_fence *fence;
>>> -    struct drm_sched_fence *s_fence;
>>>       struct drm_sched_job *sched_job;
>>>       int r;
>>> @@ -1194,15 +1193,13 @@ static void drm_sched_run_job_work(struct 
>>> work_struct *w)
>>>           return;
>>>       }
>>> -    s_fence = sched_job->s_fence;
>>> -
>>>       atomic_add(sched_job->credits, &sched->credit_count);
>>>       drm_sched_job_begin(sched_job);
>>>       trace_drm_run_job(sched_job, entity);
>>>       fence = sched->ops->run_job(sched_job);
>>>       complete_all(&entity->entity_idle);
>>> -    drm_sched_fence_scheduled(s_fence, fence);
>>> +    drm_sched_fence_scheduled(sched_job->s_fence, fence);
>>
>> Originally that was not for readability but for correctness.
>>
>> As soon as complete_all(&entity->entity_idle); was called the 
>> sched_job could have been released.
>
> And without a comment ouch.

That changed long long time ago and IIRC we did had a comment for that.

>
>> But we changed that so that the sched_job is released from a separate 
>> worker instead, so that is most likely not necessary any more.
>
> Very subtle. Especially given some drivers use unordered queue.

Hui? unordered queue? How should that work?

Job submission ordering is a mandatory requirement of the dma_fence.

>
> And for them sched_job is dereferenced a few more times in the block 
> below so not sure how it is safe.
>
> Move complete_all() to the end of it all?

Most likely good idea, yes.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>>       if (!IS_ERR_OR_NULL(fence)) {
>>>           /* Drop for original kref_init of the fence */
>>

