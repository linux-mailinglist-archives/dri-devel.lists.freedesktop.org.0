Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E6BBCCFDB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 14:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15B310EBEF;
	Fri, 10 Oct 2025 12:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aT1fNQp9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010029.outbound.protection.outlook.com [52.101.61.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A4C10E184;
 Fri, 10 Oct 2025 12:49:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTFW8COIX+6m+rqhKS6lwSaYJoSr4Ol+3n98bVKRjxoVEaq31/b0/ibCO/1/hIdZyiky9A99sTjS4vNSZlRtONU2hkidqVs8ErRfym6P8uovEHJfOdz6K6ZKRIIEztgI3vkI1X8+p2SYzKmgtRKH3DYejRZrAXUbvsdE5kTCk11fO1uPX/E3QFx5Gd8bIXnYz0UfYdb1j89Y3ZmDMKGKs41WPZ/vClk6tK+28137efQQhCN5v6BtqT17aq7G0CqWSqip1u8aCU+uhZzmtzf3SjymrdpI0ZhPFeXkCZFuRxipV1wO/F5wwmqR2HLqv5SmP/0081gBZx8U43tSDKEx5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FQ6oBAx7ZiIijcXnrIdqews987soO+3fwIa/2/qMoo=;
 b=nY6CNmzcRj4+kjLRfDVREIowx4dU3Mv9BnlTFXxJbgLeQCpsFInN8M5iQQEW5l1cIZJ25m5Ww8bAUIRpV3C/Yknn1CcD2763VL9PSaiQdNxpIEC3S+G7ynzAGZPuFrp15gAQgUsJsEg0g0u+Nbngap3uKIIQ9t/JSeG7aUgmIN8a0EARMqlHTX+Z/dyumK9sskDvtJJlp5seELUiz8vOq7rwx2PSK0fWHCWwLHeqqJjBKox5T0loXHLjkBxf8uHQ1abXtXg8VB7lW3Gv3H096c1IM/92b7WqDvqcrtdocrBGa15Ymztmo7y09XKuSIo71gZUfjHxUeO0FWMq5pcvVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FQ6oBAx7ZiIijcXnrIdqews987soO+3fwIa/2/qMoo=;
 b=aT1fNQp9zNStr0xhmR8zcsp8dDfin9+Flrow/7ustKJdaBYxp69gxZJXms7QH6t42LDO+BAirbax8n9PNNA2Ar8PuE30saM7Xf8iReMPb1gspolp53wigp3NoOwGEEGQAFi79T/aXhE3Zwv6WSZgo8Xn74X/Sjc4191UiGc+xSI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6770.namprd12.prod.outlook.com (2603:10b6:510:1c5::11)
 by BL4PR12MB9536.namprd12.prod.outlook.com (2603:10b6:208:590::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 12:48:58 +0000
Received: from PH8PR12MB6770.namprd12.prod.outlook.com
 ([fe80::5da3:7c42:3309:eb4c]) by PH8PR12MB6770.namprd12.prod.outlook.com
 ([fe80::5da3:7c42:3309:eb4c%3]) with mapi id 15.20.9182.015; Fri, 10 Oct 2025
 12:48:58 +0000
Message-ID: <11bc4d38-de19-4ffe-a49c-2b5b7a7be2b4@amd.com>
Date: Fri, 10 Oct 2025 14:48:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Avoid killing entity last used by parent on
 child SIGKILL
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
Cc: amd-gfx@lists.freedesktop.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
References: <20251002150524.7552-3-david.rosca@amd.com>
 <d67cbd3a-5cd8-43b8-badf-3f264885429d@amd.com>
 <14de5473-534c-4294-bb1d-41d1a43fb46d@amd.com>
 <4cc2b216-e778-4b4e-bd13-01af0ded5427@amd.com>
Content-Language: en-US
From: David Rosca <david.rosca@amd.com>
In-Reply-To: <4cc2b216-e778-4b4e-bd13-01af0ded5427@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::22) To PH8PR12MB6770.namprd12.prod.outlook.com
 (2603:10b6:510:1c5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6770:EE_|BL4PR12MB9536:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c407ec-75f3-46ed-d12b-08de07fb60de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTBoRmVWaXhzSHYrTU9JMzNNMENieUtIWWxSLzZ0N1NudFp1N09zRVNTaVhK?=
 =?utf-8?B?NDJKSzF5T2JCTFNDV0ZxU2VxNUpLY1ZQSVVBajlZTURpZGVPMHIwcEpUSENI?=
 =?utf-8?B?b3V1SHJMTzZyYkE0Qm1pZVB5Q0QyMlVNaVhZekJxWkpQdGdNcW9ycUFtc0hp?=
 =?utf-8?B?dGVWK2twZis3VTQwTVZ5WmRveHRIZlZYY0d5VnBmbWZKMmpwRW1yYll1b0g4?=
 =?utf-8?B?TXhOdlpmSGU0U0p1bURybU42UUZENzYrN0cwTi9TZlZaMHZaL25aaDV3K01q?=
 =?utf-8?B?VkMxa01ySUtUNVYrWWgxWUxYRjRMRWxHSjhhRHhhbFM3MVZ5OVl1MTViV0VC?=
 =?utf-8?B?NndTcG1CQStJR0RMRTBBUUt3bmsvdmlRM0JocjIrRVBiNDBkOFo0L3doOHhW?=
 =?utf-8?B?NndKUElYR05GSFpSTGMyTG1lajdoNVdQM1ZhNlJ0NWN1TzEvTDJhYzhiRS9Y?=
 =?utf-8?B?WStDZTBVb1FJR2o4NVZkcWQ3TjdidkNyQVN0RUMrZDRIK0NGeWlCa3pHYnI0?=
 =?utf-8?B?OU56TnM1bnp1cFBLUFYxRHB1SzdwTjJDcG4vcDlGR0FLQnBDcFJrU2lSWjM4?=
 =?utf-8?B?VlpoWTBKV0ErQmdVZXBUejZiZDRWaklMRkUyRzRIQlRXWTJ4bGN5c0JmSU9O?=
 =?utf-8?B?QnlIcUZxTVh6Q0N0QkNpMDlFOUxtbTl2TTFYQVM4UHRNQzU1eTByYUEvYTVl?=
 =?utf-8?B?c1lDUGY5dW1KV0pyaHFOdDZRUjNpaHV2dGllbW1CREltSzNpY1c5MG9yOWxO?=
 =?utf-8?B?Vmt5RTF0bW1pVDB1RDlWUElTZG9TVk1jNE1sTTJJT1VyaDRCVnVNRkVpUVBC?=
 =?utf-8?B?ZHFWbVBpVjFaSDRReHBkWWFHT2hjcEsveWlWdjM0Q2NOWFlmQUkxakNCL1dC?=
 =?utf-8?B?QlNZWkdJcmk3OWxqeCtQZjJQQU1HYWpJZkZKdzJvREJxVU42S0NjMmFaQzRm?=
 =?utf-8?B?bjYzVFk1QXZzc3g2WS9vNk1lV0l1aGJla0dFd0lpYmltK2ptTW4vM0NkMkNK?=
 =?utf-8?B?VTNLVk8zQklYL2tXYThyTlRIb0VCcC9UU1BrOHJsUEd0OTRDVmVSbVE2azF2?=
 =?utf-8?B?aDVZZzRuRUVibUQ3dnNpeFpjYnNLN2szYTNjZ0tXczdJVysyMEtpT1V4ZitH?=
 =?utf-8?B?VGNtZnhUZ0wzRW5EY0xCLzBZMXhkYWhBUGtHQ2Q5S1NZMStyREVzRnlVakg1?=
 =?utf-8?B?ay9lWWQ1SVEzVTBmRzRrblA3dmorSi93L3FTaXB1cFpDbFIwdDBhV2R6RVVU?=
 =?utf-8?B?SmV4L0tXa1dMVlJIUkM4c1ZoNW9pZTk3Rm13cmdWRlJoM3BkTFNOL09kOTMx?=
 =?utf-8?B?eVFFcW5SRXM1ZStrT0NNT25oRmtnWitJalY3dzBFeFViVWZNN2UvdCtFemFS?=
 =?utf-8?B?MldPTDZ0YlV3aFh3c2ZFcHhFTEk4b0hzaE95WjdaU1poa0JlY0Iyb3EyK0tF?=
 =?utf-8?B?U3phaHVDNVdZL21QcnhhVysrZDZEdm9xYjZKekg3L1VtYzc4YW9FSWk0bmxH?=
 =?utf-8?B?YmxCYTltT2hKK255TTRrbzc3SEptSW05bGtGQ0dGZUZ4eEUzQjdSeU5JcXl4?=
 =?utf-8?B?NDVPSlFGR1dzRXM0QzQwbXM0VU1VZUNJMGc1cHBJN0RvNW5EZXdibXBsK1Z2?=
 =?utf-8?B?cFQ5SEdlQ2ZFNVVhejVCWFBINkRKZE1SZldNVm94cnByY3ZtbVB0Y1dqUm9i?=
 =?utf-8?B?cm9UNmJTMVZ1TTZiVlFQU1R4VkM0SFFoTUFEWmliajRlUjF6VU1IdHJZUXFx?=
 =?utf-8?B?NCswM0FvV3ZmQ3QxZ1ZIdkRSM2Vha2dBUlNpR25LM0Y4TDRwVWZIcnJtL0tz?=
 =?utf-8?B?U1J3NlVaZVlVNGpZUytjZkdIN200QXd6cTF6Z3pvNmhLQzBlS1lNeURGU1FV?=
 =?utf-8?B?N05wbXBwTWhDZFRQNkJPMFNkZTBiZS9sUHhpTnp1SndaU0hBR1QwUHNtajBI?=
 =?utf-8?Q?X4SSLlNKbjEdsd+3Nc6wsF4sA7dn37wU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB6770.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0pUaThHRXdPM3hrUEE1azBzWnRQK3licm9CQmVOdlNYREdXek9ZZXVGM3JC?=
 =?utf-8?B?KzdEdEp0V0xka1dua3NkSzZZblZHTC9nRXVCZVB2TWpnUW9qSTg4UWg3V0Y4?=
 =?utf-8?B?WXB0SDJ1Rko4czlUdGRieStQSlk4VldWWUJ0KzVsSzM0VU9VWE1nelhrT1ZW?=
 =?utf-8?B?enVwNUFxbTlvbXRsZGxCVFZHOVNQRDA5SUdmTzZRYWxpY2JpL2t5Q2NWK0VE?=
 =?utf-8?B?OUJNbjNVUlhiY1QyK2JaSGRWclFXMVZDTndBallkcFRtOVBpQm9Nckoya0U0?=
 =?utf-8?B?S3N5MnFFeWVOWGZ0Z29vV2hydkk1WmtBSHlxbXhNRDVJTTRtelFJN1NIUSts?=
 =?utf-8?B?TTBFeHZSb25hOUtoVE9GYWN0bGUvMlF6eWVXNFZqN3NQMXJ3bUcvdnEraGdu?=
 =?utf-8?B?bHB1NjI0YnhOSS95T1FKWS9HTXBoWEdPNndQWkJJVEVrUzkzTXZwdEF1TTFY?=
 =?utf-8?B?UGlVd2lXaWxSejhEMVZsbnYwM0RDVTdoSWFUdmZQRW5NU3FXRU5iaURNbG9W?=
 =?utf-8?B?T0k2cWl2ZnhYUEd4Y1hHa05QVUhiZXF1b2xtZEtoTm51ajBzMXU4WTEwVVNo?=
 =?utf-8?B?d2k3dTJabytSdGxYYW1LaTY2RVpleG1uKzQ5dzd2U1pDaDd2SU4yaTlZS2dl?=
 =?utf-8?B?bXNvdTB0VTZ0U1ZKVTJST09DT3N4bWJlRFlJRnEwYlViZnFFL3NTSGRJRUI5?=
 =?utf-8?B?Wk85dDJWT1ZTeUc5bEZZb0h6ekUyOXlyL3kvMmdLQVBUYVZBVVR5YithVVVI?=
 =?utf-8?B?RWI2RVkxTm1sdVBJRnFTNzVmTDFaaFdiUkEzWm9ZbGx2ODdsWjdsL3RmQUNJ?=
 =?utf-8?B?SlUraFJWMDhRQnZya3REV0pnOGcrL0JaN1UxWkFyR1hrUi9lMmxrZERBRjRB?=
 =?utf-8?B?a0ZlNlA3NUt2NXB3dzlyUGdGNWoxQ1BMOXlkUFYyS3dkeWJHVS9lTzR1UzJr?=
 =?utf-8?B?VWZ3WXkveEkxZjdzeThncy84eFcvNkNEamw4dTVSeFFTZENlUGp6Yno0T2lp?=
 =?utf-8?B?anhKM2xTcXBHK3hDSWhvZWgxUEdNVG9sNFRqdjFwRFhWWGFnOGk5K1RLME9y?=
 =?utf-8?B?eGZaU2ZLdkhFNXBxYTNKYW9hYjVsUFRNUm41TDlNNTdPeUxzeXFVMEJONmhQ?=
 =?utf-8?B?ZzhQSTRsdzZQMlNZbloxS1BYVXVQeFZKTmtPSkdvajBqS3QxU1p1OXcydjFq?=
 =?utf-8?B?WWc3ZUhQS2N3VGUySmpCaUh4TTQyUjY1TW00K0NnOTNZWEt2QVZ5RVB6d3BL?=
 =?utf-8?B?MEVyTUg5V3Ywcm9FdC8xVU5PaUhDYUU1M0xDOTdvS0ZXMXRhd0tYby9GLzhs?=
 =?utf-8?B?SlhnWVFOL1VzOUFqT3FjVXFROC9heUJUWDRTSWNFZGxqMEhTSkszTU1HQXN0?=
 =?utf-8?B?RnlEbmV3YlRBNnUyWjI1azhOUE03WUFRZFlURCtFeUp6YUJGZUQ2R2p6V2Y0?=
 =?utf-8?B?blZza09YelhWQUgrd2s2Z0toNDNkcmJJR28yamwySGd5MGVLWGI3ZWI4SzNV?=
 =?utf-8?B?MVhxRmRBcW4vbC9DOWhBSWUrN1M1cCs2RFNOYUtwRlVoRUhjUlZXcGsyMGN2?=
 =?utf-8?B?VGEyWnFWa1g2aDFGNytrQTFlYnhuMEFxV2dBc1B3bzNvcVhNR2lqbXFqQ0R2?=
 =?utf-8?B?RzRSZlFpUzFqa0loOU5jWGdiOEJHK1lmem5lUnh2c0JWK3NYMUluTE94MGVv?=
 =?utf-8?B?bStBajJjNTM4R3c5a2M0VDFhVVVveE5YNmorZjJJNkRrVUVaa3BvRXdrRzZu?=
 =?utf-8?B?QVhVSXVUVWczOEdNeTlrWHNpbWhPOGFOcGcxVjUrc2V5c0RBR0swekdPMlor?=
 =?utf-8?B?RG56TXFpSFpDVVd2QWJxa0FJd2xoMzhCdDlLd2NKV0JMY1VoU05zeG1uTDVS?=
 =?utf-8?B?U3UrZ0tITzhLV0NoMlpsMFh6YWtaZE9nTnpRb00yR1owMmMzT3JHK0N4dEVZ?=
 =?utf-8?B?VGFwZ3daVUdiY0NTRk1oRzdoNGkvTVZoZEZ0SHZ2YXRRaDVqZTcydEp2MnJt?=
 =?utf-8?B?WHdtVk1TV2o5TVl3d081Y3BhQmVycmJBZngxRnVLOElHM2VyeU9DTGJPUGZI?=
 =?utf-8?B?SnF4ZUZoTjBvS3laR1RUVGdDZFVpbExFSDcyY1NYaUZDaTdSWWhIQzU5a1NS?=
 =?utf-8?Q?ynBabNhQhyEPVsEiiSnlGFg3K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c407ec-75f3-46ed-d12b-08de07fb60de
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6770.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 12:48:57.9395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxDHTjKaKuFZ97Woi2uKKKU76qUnUnc0NWqIFg8YjVhQlGpXtlhCiR0dWfLFMI/HuWNAXrCNWlEvBrHnwDcYjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9536
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


On 10. 10. 25 14:28, Christian König wrote:
> David any objections that I take this patch and make the necessary modifications?

Sure, please go ahead.

Thanks,
David

>
> People are pinging me about the problem.
>
> Regards,
> Christian.
>
> On 09.10.25 17:04, Christian König wrote:
>> FYI
>>
>> On 09.10.25 09:01, Christian König wrote:
>>> On 02.10.25 17:05, David Rosca wrote:
>>>> drm_sched_entity_flush should only kill the entity if the current
>>>> process is the last user of the entity. The last_user is only set
>>>> when adding new job, so entities that had no jobs submitted to them
>>>> have NULL last_user and would always be killed.
>>>> Another issue is setting last_user to NULL from drm_sched_entity_flush,
>>>> which causes subsequent calls to kill the entity.
>>>>
>>>> Signed-off-by: David Rosca <david.rosca@amd.com>
>>>> Fixes: 51564e9f06f0 ("drm/amdgpu: Avoid extra evict-restore process.")
>>> Good catch, but in general please CC the relevant maintainers and mailing lists for scheduler patches.
>>>
>>>> ---
>>>>   drivers/gpu/drm/scheduler/sched_entity.c | 5 ++---
>>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index 8867b95ab089..a325e4a59990 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -70,6 +70,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>>   	entity->guilty = guilty;
>>>>   	entity->num_sched_list = num_sched_list;
>>>>   	entity->priority = priority;
>>>> +	entity->last_user = current->group_leader;
>>>>   	/*
>>>>   	 * It's perfectly valid to initialize an entity without having a valid
>>>>   	 * scheduler attached. It's just not valid to use the scheduler before it
>>>> @@ -278,7 +279,6 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>>>   long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>>>>   {
>>>>   	struct drm_gpu_scheduler *sched;
>>>> -	struct task_struct *last_user;
>>>>   	long ret = timeout;
>>>>   
>>>>   	if (!entity->rq)
>>>> @@ -301,8 +301,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>>>>   	}
>>>>   
>>>>   	/* For killed process disable any more IBs enqueue right now */
>>>> -	last_user = cmpxchg(&entity->last_user, current->group_leader, NULL);
>>>> -	if ((!last_user || last_user == current->group_leader) &&
>>>> +	if (entity->last_user == current->group_leader &&
>>> You still need the cmpxchg() here or otherwise drm_sched_entity_kill() would run multiple times.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>   	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL))
>>>>   		drm_sched_entity_kill(entity);
>>>>   
