Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01BECB92D6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 16:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58DE10E902;
	Fri, 12 Dec 2025 15:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IBIS/Qug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010068.outbound.protection.outlook.com [52.101.61.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBAC10E902
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 15:46:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hm6b41yU8gQE+ZplrO9WomkNY+OAnVoCGgM60HCyHJXK2P2fizS1ViUEZRWMLkZqvD+9aNQF4uUXTqhecv9It9znTppS3Xa5oPBZfTn/qrM1gZ2junrRKZGPzWv0f43Mc8m/r2oWyUN8HA+P2003gR6JLBa/1Vi4OPP3t/8laT+dz3r6CleYne/oR405MD2IfdpWE8kxjYDKN5tJZbzA04vMgOoK9SMvJbeV7mHIcIWKS0eCSm613eaU4U3QLOkBmoBZ7ZYkbyZOCFZod2YhGHlPt7ksaHbAYgooaUc0f8OPTuA3akewDDQhvZlKcznr/A5yo+U/TbiYk8lkf6JphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAkvh1VSCQFVkXjKRjFL8EB4i+OQrJ+NfBHYUUccbh4=;
 b=Im9R9QKvc/KOhv19eoDitODXZJ9c/p57youG2goMRFtU4jxlEbMgEcmbJ8cbCusJ8B8qymg5V9CC10m/C1SBdcc2sQHgSjIhs0x/2nTSE++T3AVJf3i0PrpWGlJ7KYgjAeHJbQf0fUbcl2mKNX1yMW1w2bfL5DVxs43cl9ZKDyKBeyGzW4BNUpqeGYmNx8v7ZPvy2mzvbMUIJqJGH3gh5WiuBUiuxbla8lLuqU7WYYZivCIMyBOZSKfCrsCv/6jX4OHH0cDlH59rSoEvoYpikgT4lFhHy97MeUIdwB92hg1OspZN+0eswviw7Ye4JY+KhgBKAqEG+YIhvKUqTkWrZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAkvh1VSCQFVkXjKRjFL8EB4i+OQrJ+NfBHYUUccbh4=;
 b=IBIS/Qug7/QMeOenTfMjtTlu3hCzEaOz0I2LjplEQHOUT8UeOebH/Mq6TdGN19sc76CUQJoepXLzOSHhSdKzYqbNLdXdQWJn5g9JNrpT6aGthLLA35I1qzRoUx/mqkXl7qzG8LKu+awY5SvmsSSBTxgmiDM6MPJRP2TahByNs+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6299.namprd12.prod.outlook.com (2603:10b6:930:20::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 15:46:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:46:23 +0000
Message-ID: <82a1a8d9-633e-4da4-aefc-1aa9266298ee@amd.com>
Date: Fri, 12 Dec 2025 16:46:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/19] drm/amdgpu: independence for the amdgpu_userq_fence!
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@mailbox.org,
 matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-16-christian.koenig@amd.com>
 <3276bb85-3bcc-4f55-95b1-4c05fe198d31@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3276bb85-3bcc-4f55-95b1-4c05fe198d31@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0682.namprd03.prod.outlook.com
 (2603:10b6:408:10e::27) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: 37694d14-8e27-47a6-f478-08de39959a2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3JKY3hRdDc1TUh1Zi94cTEvMGJrQ0VBVk5BbG5FK3NrY2JoQ1I0VFJXd3BO?=
 =?utf-8?B?VjJMYXBFTk9BTWtXSThHVnVwb1dJSkFmSFdPQ0tKa3FRZ3o0a2hvSk9Pck9J?=
 =?utf-8?B?VExSbUFLenJqUklESGRBc3VpdFVjVVJKcDBlK2lGSUlJam53L0pCQUloRXFL?=
 =?utf-8?B?YnhnbmVSOVVMR2dBLzBFQXRLYk1RN00wOG1DVE9abnVJa1dMUUMzUUJDTGFR?=
 =?utf-8?B?RkpsNHRId2FYVFRUZWpJZHFyTGtveC9uUjNkTG5kRE85WEN1a1p4Y05kYnpv?=
 =?utf-8?B?cjZuektIZUtpQzNQWWNNWm5NLzV1U1UrQUFKVkJnUUVGaCtGOGJSSnE3bTJH?=
 =?utf-8?B?M1pVdXJDeWV6a25KUmJrcG5uUWM1eGFML280U1JOZVRGT2pNckprRjhsUkFC?=
 =?utf-8?B?SDFabTdmVjNxZFVKZHBqWlAyNlpKSmExMG44ZjBoWWtxMW44YjdpRU9saElq?=
 =?utf-8?B?enAwOWZLKzNReHZRWmpzVW1WRTlLdjJmTGxoTHpzZ1ZCRGxRd2dsTW96RmF3?=
 =?utf-8?B?aDVJTmlGNDVuOWlUWG56UGtRQTdjUDA0Y3FSOUtVbFp0VnhmSHZMcCtBN0RK?=
 =?utf-8?B?WFlzTk5GNFMyazBZa05TUlkyVEdmUXB3ZGtHYmc5Q1VWb1dlRXBHTHF1RTNu?=
 =?utf-8?B?OFY1RWVSY3gvdkpuRkRRTHB6bElabEQvYzJPRkRBaVIrNURnOHpQMVBxY0JB?=
 =?utf-8?B?SlhvRlpTdndXemRpd2JkN1czbVFYQk4xRC9TUEhKS21qdEwvam1XejkvR0NY?=
 =?utf-8?B?SjFJOG9SSGF5RVZoN1EyN1JmVzl0NEFzSnIrdHN2WEtxMldMaEhNb1ROTGd5?=
 =?utf-8?B?ZGNpN3ZJWDMzellaQXNlRllieDZkRjdsdmlXc2FqMm1mRkt5WUdhZ0N4ajZv?=
 =?utf-8?B?VWdBeS9UVlRZNWpodllGVmJEOG8yWjZhTUJ4a1NTZEFLb2lLb2Q1em9LYitF?=
 =?utf-8?B?N3lRb3NPSE50TzFaOStDaXRBN2tNZXhGWU8yNkhLaEl6Wm16U25FbXk3eWRl?=
 =?utf-8?B?QW1DTk5lRVVLaDhHRUY2dEwxNndnWHpMTFBWdXErTmFVcHU4cGZtdjZQTEF5?=
 =?utf-8?B?WjhKR1hudFViREU1OXNMVDdZdWM1SCtFQmJIZk5xZlFLbU5FbkVzcGlxSnll?=
 =?utf-8?B?YzlyS2dOQ2VXdDF3LzRvMjVRdGE5aS9EWk1KRkFtbjdxNnRmTFBTd0xTNWdu?=
 =?utf-8?B?S0lyZkpZSXNBdmlsOHdKOEM0eXlrUmtXaVVrblQ3ZW9VUjlOblVZN1ZkTDNp?=
 =?utf-8?B?TTFhWDEzMmc4b2FLb0ozd1dheDE0U3k5RXpLQWV5dWZVVjZCUzFNUDJVYlZC?=
 =?utf-8?B?THMvV1ZZY0c5RVdDTnBvQ2NrcXBEN21WR0VTcVdJVElSbGxpWm96U3Z6MXJa?=
 =?utf-8?B?VHE5cEo4ZHgrS1NxempTZjI2Yk1FV2NDTGlXNGl4RmszQTRpb1puYlZXU1pM?=
 =?utf-8?B?L3ZPTXlaU2dsSy9HMnRzanNUN3NkT2ExbXplQjk3RUg0K285Q3drVTl4bXhY?=
 =?utf-8?B?eVdNNmUzUmV1LzhDZ0dxSmtkQW1aL0VQWEVFZ1p1MytUdHowWk11MlFSbjVl?=
 =?utf-8?B?Uk15NnNMSDRmK045YUFzaUxKY2hCQjgrMC9kSVFjS0NMb2hJdTI1TVp0azZ5?=
 =?utf-8?B?Yzl1alhMbVZ2TU5rVEN6Mk5kOGYrWXNBRkU5WERGdkloLzJDYzM2am9RMUxD?=
 =?utf-8?B?cGhCVzVaNFBTT3dTMzVhVWFiQnhkZDJSUXRMM3A0bTVqdVdUMGtoK0RFZkti?=
 =?utf-8?B?NWd3em5nS0lVbHdqbFY2ZUVRMlZHcFJRZHdtZlJLdlNKRjRFY3NnZVFwQVZi?=
 =?utf-8?B?OHdmUEFlL3V6ZTZJZmY1elN5eHVWMXJEUGdmWDlwTnZXdnZUMGpFRStMc2hq?=
 =?utf-8?B?Z2M5QTFaUllTZUdXeHpEcUFQOXdwSkVudkptSk84bzAwdU9Xb2tQTHhwNkV3?=
 =?utf-8?Q?OcgIqqnLVhY5eXDpT9h+IkCclu+psKDQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1hldDlqVlFBdk5xajQwYWdLejZPSmRVaEVFVzhwWlZuU0hDem40WGgwTzRP?=
 =?utf-8?B?WXduWWRIOTlBL1dLYkZFSzAzTHBtNmU5bmg5UnFna3FzK2ord093RlNrVklX?=
 =?utf-8?B?L0V6QlFVVlp2S01pSnhSZzAxQ1QrZ3l6Z05xdS8yZ2ZhQ3FKT1V3cXJYS244?=
 =?utf-8?B?aG1YSnZWcGpDcW1zamJiOGJ2bU5BSUtxWWRyb0R1OWNTQmFsblN3bkpTdFZs?=
 =?utf-8?B?NlZsaFJRenMxZXlyUStBS2JiNEFibUI5UFVnVFFlUXdBR3RjNDREQ0RiVzNo?=
 =?utf-8?B?ZVFNd3UrZDdzeEpCYlREZXcwdCtMeXU5T2taaHpEUzdpUDZXRHdrMTNaMjJE?=
 =?utf-8?B?RUNGV09ua0gzWHJkRklWZ0czYlBIamVOR0FEamJRbC9OYWsvRnVvNlI2UDRQ?=
 =?utf-8?B?YWJ4blJMQ095WXJ5Ti9jMjcrVDNObDlLVVA0eWdFRUk4Sm5Xc2hvZVJVWCtP?=
 =?utf-8?B?Q3Mwa1FDeFZWMnh6ZEovbG9zVGhkbUFqb210OWxyOHc3dW1UZitTL01lU1JX?=
 =?utf-8?B?Wk1GQkU1MmRGOGkvc00yRC9NMmZZa2pySkZWK1EyRTQzSHVNaUF1WmltckIw?=
 =?utf-8?B?SjA2YlRMVTNKZ1NNaWZtNlhvY09keVV2QVc4NVdRa2JycVhONXNWaXIyMHda?=
 =?utf-8?B?M2NINmRnVWhSeUEyMkxrUlNRdm1SYjRtRUtlMTFvWE4zRmlHUTdKWGE4aGpo?=
 =?utf-8?B?ZmZCYy9VWmdTYmovUm80dlBaWEs3dzVCZ05mWGdCWHY5NmtCWHRxYlYvT3Rv?=
 =?utf-8?B?RFY1WGY2dmU5MlZldHJNZ2NnOTJ5aGNrN3hhQ2JFdFFyY2lOOUN5WUc3Kysx?=
 =?utf-8?B?MlhsQlNsWk9qc25TbWhwWC9DYlltYnBVWXkyc0xyRUd5bFBuTjBTZzlqSmZP?=
 =?utf-8?B?VTZ5dXNSMHZTd3FSRWxGalFyYWFmZEM0ekltbnBnNGJ3SjBFdlA2QnVyY0Jz?=
 =?utf-8?B?WkNvT1A3TFQyQVF6V2pYNzRxRFZMUW1Tam1ybC8waDlFVmF4c3JjOU9US2c4?=
 =?utf-8?B?NTd0bHlMKzliYzFtSllvQzhnbHk2Q2ZYcFZEcFRYeFQ3NlN6SVREOW9pcHd3?=
 =?utf-8?B?TUxlTkYwZ1pQa2xDYnQ5SVVnNlc5bTAwREN0aVRZbU9BRVYzZHp2MThlWm11?=
 =?utf-8?B?Z2VLMm9OMkVSWTRhOXBOVUxZbEkyNmV6NmFreFhwWVNJdWpucm1taVJmcGRV?=
 =?utf-8?B?ZUlzOUVsYTFldEVDUEhpRGVqdGFHSTRlUkhWN3hxWlcrNmRvM3dsbDFoSlhu?=
 =?utf-8?B?bjFUUWxSZ2hQZTBBMEk1TGVsNGNtSWVPQk1OaWc4M0xZUWZMUERLaXVha2FF?=
 =?utf-8?B?ZVNrUVozQTVFdisyM2V1SnlXTExuZXlOT1kwZ3kvd2k4c201RDZWckQrWXJW?=
 =?utf-8?B?djBDZjNNcHhTZWdzbS9QdnRBVXY0SHdNbDJGU2RWYkhDd3hsNVFYczNwZmVz?=
 =?utf-8?B?U3JOeTZjc2lYcjdwbTB1aWQ1dk5lVXhyWS9tNzB1aTNUcHhTTmdndXdNS0FT?=
 =?utf-8?B?MXdsL2FLcEdTbFN3Z1BvSGRVS1pBQkUvd3I0UFFHa3ZmOTQ3RnVYTU5WM0xW?=
 =?utf-8?B?RmdNUU9JL2QzM1VuQ1ZIcmVQSUFYZ3lTam04cDZOL2szd0ZCVFc3SVJjaFZT?=
 =?utf-8?B?TjZhWHcyYTV1dC9ocGdockNaT2dQNHNFenNUS3VQblNKVDNCU2xkUU9pckJR?=
 =?utf-8?B?VjZzZ2ZDeEdQRnV3aFBXVTJjdkFYYWUrZVIxL3BkU0JxbVYvUnJPL3Q4cGhI?=
 =?utf-8?B?L29EUDdDdDJIWklCUWcvQ0Z3Ym85b0p3R0g1TlVEdUdaMENJR1l1QURRNVNo?=
 =?utf-8?B?STZ3MlRXUlZEM21wYjRFV3BsVStzT1JDU3dxZzR2Q1MxNm85R0FQQTNTck12?=
 =?utf-8?B?bElidW04YU5TMmRjSmlGSmFMUk0wUUhodjQzK1BKaG5YTmhFRDJXaHV2N2ZX?=
 =?utf-8?B?dEROelhScUJ4RWJTMFBIR0QxdHN5dzFMUWJmVU85SzFpU1Q0SCtWWUpZblJP?=
 =?utf-8?B?Y3FNbGJ0bWJEWXNEMHZ1N0pLdDF6R3NSbk0yaUgza3U0dUtBUlRnNEN6TVFl?=
 =?utf-8?B?aFFWc1FwdWdYL1h6aUdSeHUzNk00bm85M25TMFplMVYyemZrYmtJK29OemVm?=
 =?utf-8?Q?isKbV81lBkthkJA8z4PlUDkby?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37694d14-8e27-47a6-f478-08de39959a2a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:46:23.5283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCkz7o1Pmg5EGh+pNh7VRPs2dbkB+HIkYBtktMnRw6Gce1IQWvGIu4qJgYFcplWg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6299
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

On 12/11/25 17:12, Tvrtko Ursulin wrote:
> 
> On 11/12/2025 13:16, Christian König wrote:
>> This allows amdgpu_userq_fences to outlive the amdgpu module.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 13 +----
>>   .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   | 54 ++++---------------
>>   .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.h   |  8 ---
>>   3 files changed, 11 insertions(+), 64 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 2dfbddcef9ab..f206297aae8b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -3155,11 +3155,7 @@ static int __init amdgpu_init(void)
>>         r = amdgpu_sync_init();
>>       if (r)
>> -        goto error_sync;
>> -
>> -    r = amdgpu_userq_fence_slab_init();
>> -    if (r)
>> -        goto error_fence;
>> +        return r;
>>         DRM_INFO("amdgpu kernel modesetting enabled.\n");
>>       amdgpu_register_atpx_handler();
>> @@ -3176,12 +3172,6 @@ static int __init amdgpu_init(void)
>>         /* let modprobe override vga console setting */
>>       return pci_register_driver(&amdgpu_kms_pci_driver);
>> -
>> -error_fence:
>> -    amdgpu_sync_fini();
>> -
>> -error_sync:
>> -    return r;
>>   }
>>     static void __exit amdgpu_exit(void)
>> @@ -3191,7 +3181,6 @@ static void __exit amdgpu_exit(void)
>>       amdgpu_unregister_atpx_handler();
>>       amdgpu_acpi_release();
>>       amdgpu_sync_fini();
>> -    amdgpu_userq_fence_slab_fini();
>>       mmu_notifier_synchronize();
>>       amdgpu_xcp_drv_release();
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>> index eba9fb359047..bb19f72770b0 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>> @@ -33,26 +33,6 @@
>>   #include "amdgpu_userq_fence.h"
>>     static const struct dma_fence_ops amdgpu_userq_fence_ops;
>> -static struct kmem_cache *amdgpu_userq_fence_slab;
>> -
>> -int amdgpu_userq_fence_slab_init(void)
>> -{
>> -    amdgpu_userq_fence_slab = kmem_cache_create("amdgpu_userq_fence",
>> -                            sizeof(struct amdgpu_userq_fence),
>> -                            0,
>> -                            SLAB_HWCACHE_ALIGN,
>> -                            NULL);
>> -    if (!amdgpu_userq_fence_slab)
>> -        return -ENOMEM;
>> -
>> -    return 0;
>> -}
>> -
>> -void amdgpu_userq_fence_slab_fini(void)
>> -{
>> -    rcu_barrier();
> 
> What was this rcu_barrier() for? Cargo culted or more to it?

All dma_fences are RCU protected. When they are backed by a kmem_cache you need to make sure to wait for an RCU grace period to pass before destroying the kmem_cache.

Since the dma_fence framework now uses kfree_rcu that shouldn't be problematic any more.


>> -    kmem_cache_destroy(amdgpu_userq_fence_slab);
>> -}
>>     static inline struct amdgpu_userq_fence *to_amdgpu_userq_fence(struct dma_fence *f)
>>   {
>> @@ -227,7 +207,7 @@ void amdgpu_userq_fence_driver_put(struct amdgpu_userq_fence_driver *fence_drv)
>>     static int amdgpu_userq_fence_alloc(struct amdgpu_userq_fence **userq_fence)
>>   {
>> -    *userq_fence = kmem_cache_alloc(amdgpu_userq_fence_slab, GFP_ATOMIC);
>> +    *userq_fence = kmalloc(sizeof(**userq_fence), GFP_ATOMIC);
> This GFP_ATOMIC is suboptimal for sure being on the ioctl path. It is outside of the scope for this patch, but once my userq cleanup patches get reviewed next on my list was to try and understand this.
>>       return *userq_fence ? 0 : -ENOMEM;
>>   }
>>   @@ -243,12 +223,11 @@ static int amdgpu_userq_fence_create(struct amdgpu_usermode_queue *userq,
>>       if (!fence_drv)
>>           return -EINVAL;
>>   -    spin_lock_init(&userq_fence->lock);
>>       INIT_LIST_HEAD(&userq_fence->link);
>>       fence = &userq_fence->base;
>>       userq_fence->fence_drv = fence_drv;
>>   -    dma_fence_init64(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
>> +    dma_fence_init64(fence, &amdgpu_userq_fence_ops, NULL,
>>                fence_drv->context, seq);
>>         amdgpu_userq_fence_driver_get(fence_drv);
>> @@ -318,35 +297,22 @@ static bool amdgpu_userq_fence_signaled(struct dma_fence *f)
>>       rptr = amdgpu_userq_fence_read(fence_drv);
>>       wptr = fence->base.seqno;
>>   -    if (rptr >= wptr)
>> +    if (rptr >= wptr) {
>> +        amdgpu_userq_fence_driver_put(fence->fence_drv);
> 
> fence_drv is in a local already.
> 
>> +        fence->fence_drv = NULL;
> 
> amdgpu_userq_fence_get_timeline_name could now oops somehow?
> 
>> +
>> +        kvfree(fence->fence_drv_array);
>> +        fence->fence_drv_array = NULL;
> 
> Not sure if this is safe either. amdgpu_userq_fence_driver_process() drops its reference before it unlinks the fence from the list. Can someone external trigger the fence_is_signaled check, before the interrupt processing kicks in, which will clear fence_drv_array, and so amdgpu_userq_fence_driver_process() would oops?

Oh, good question. I need to double check that.

Thanks,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>           return true;
>> +    }
>>         return false;
>>   }
>>   -static void amdgpu_userq_fence_free(struct rcu_head *rcu)
>> -{
>> -    struct dma_fence *fence = container_of(rcu, struct dma_fence, rcu);
>> -    struct amdgpu_userq_fence *userq_fence = to_amdgpu_userq_fence(fence);
>> -    struct amdgpu_userq_fence_driver *fence_drv = userq_fence->fence_drv;
>> -
>> -    /* Release the fence driver reference */
>> -    amdgpu_userq_fence_driver_put(fence_drv);
>> -
>> -    kvfree(userq_fence->fence_drv_array);
>> -    kmem_cache_free(amdgpu_userq_fence_slab, userq_fence);
>> -}
>> -
>> -static void amdgpu_userq_fence_release(struct dma_fence *f)
>> -{
>> -    call_rcu(&f->rcu, amdgpu_userq_fence_free);
>> -}
>> -
>>   static const struct dma_fence_ops amdgpu_userq_fence_ops = {
>>       .get_driver_name = amdgpu_userq_fence_get_driver_name,
>>       .get_timeline_name = amdgpu_userq_fence_get_timeline_name,
>>       .signaled = amdgpu_userq_fence_signaled,
>> -    .release = amdgpu_userq_fence_release,
>>   };
>>     /**
>> @@ -560,7 +526,7 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
>>       r = amdgpu_userq_fence_create(queue, userq_fence, wptr, &fence);
>>       if (r) {
>>           mutex_unlock(&userq_mgr->userq_mutex);
>> -        kmem_cache_free(amdgpu_userq_fence_slab, userq_fence);
>> +        kfree(userq_fence);
>>           goto put_gobj_write;
>>       }
>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
>> index d76add2afc77..6f04782f3ea9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
>> @@ -31,11 +31,6 @@
>>     struct amdgpu_userq_fence {
>>       struct dma_fence base;
>> -    /*
>> -     * This lock is necessary to synchronize the
>> -     * userqueue dma fence operations.
>> -     */
>> -    spinlock_t lock;
>>       struct list_head link;
>>       unsigned long fence_drv_array_count;
>>       struct amdgpu_userq_fence_driver *fence_drv;
>> @@ -58,9 +53,6 @@ struct amdgpu_userq_fence_driver {
>>       char timeline_name[TASK_COMM_LEN];
>>   };
>>   -int amdgpu_userq_fence_slab_init(void);
>> -void amdgpu_userq_fence_slab_fini(void);
>> -
>>   void amdgpu_userq_fence_driver_get(struct amdgpu_userq_fence_driver *fence_drv);
>>   void amdgpu_userq_fence_driver_put(struct amdgpu_userq_fence_driver *fence_drv);
>>   int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,
> 

