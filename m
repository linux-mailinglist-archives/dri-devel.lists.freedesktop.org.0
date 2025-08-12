Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6547B222AB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 11:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F0810E5CC;
	Tue, 12 Aug 2025 09:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CdwqiNbc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2070.outbound.protection.outlook.com [40.107.100.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34F610E110;
 Tue, 12 Aug 2025 09:17:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPeXO1yhnFXMTvSRzk2KHgUdJW/USrnVgC89xXGuN96C1DgDMUcHSniEJDXyE+JvH3V2psFjBiMVL6LOYmdW99j3x2yq9pSi24kTOGgF05kb5FyikYfY4zieKiWTTLjoD6EfaylXtpNsumJE0SKIki1ZVg3uccpzaaHL5FkPrzxdjOc7wM4F5BKrtZ87S+6xuQ3rkAbt2DdX9x+0CSLm32wAoRO5Fnmsy7KNMyCTuKLd8PfgOnyskBeuEDWhXKi4eboGRq4zjFAmDToJwqWDIkzqfqx+/Zk5yTyCI1iPB/E+AdZUqpRGtXyX6rpORcNnRGDNJOiTIZGSJgrGsK5L0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fn9xUOWvXOzYnq+35WK2Qfnmo2MGlvCrGiSMXC0nAWA=;
 b=De0yecTo42u9ORdmiheohEJdm3/habfPkp2anODGpxNVlHMIMo9dvHHCzzUKGbYDGm8Z5EbiyWc7ahNCbNhauu9D3lqYxd7bDUrZxcU/S6k5XzBRcjYfIIKS4rK2YUcp8zl7g9o9wbnerOO3llq9EfwQrqFNUPGXqeNrmf4TVlXCVgW4HcJ+uI+8knZfZ4pAtKQu9BwNVxJejrokyVX2kPBJiLHJrAzqa2V8Uw0MX2Ttc0NqFGHmmMlTnIBvapXNazcCRBoQ2h3PU1S5iYtBlyzSzyD7MAMC/m1nqomZgrd9/fv7uhbh7YQ9DG6AIP6N9xwHTSq0cUOkjkneNs9O+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fn9xUOWvXOzYnq+35WK2Qfnmo2MGlvCrGiSMXC0nAWA=;
 b=CdwqiNbcavn59788p/KINCM8CllhG+b67lL9Qv9JCeawY4llpQW8DayNn3MTgKx6GBPyESZCBcIYpRQczdxRyTmBEK6dQpTfEPu4gGUETP1j9kVyhIn0b8jXhN1+1Y8xH8FpYpG5yGDh3ZepCoSbBSH2wEMKkLMQOIS6BD9l7Pc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 09:17:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 09:17:29 +0000
Message-ID: <1ffa7bec-ed8d-47d7-9002-66c08b1c6e8f@amd.com>
Date: Tue, 12 Aug 2025 11:17:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: WIP limit the TTM pool to 32bit CPUs
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: airlied@gmail.com, matthew.brost@intel.com
References: <20250806132838.1831-1-christian.koenig@amd.com>
 <3ff97e0ee433817c0c071c264d3a28622d717dfa.camel@linux.intel.com>
 <d6830af2-52aa-4ca6-85c5-2a4635ce6c7d@amd.com>
 <be9d451d511f8bc4652d835a2c28fa823aaf05f1.camel@linux.intel.com>
 <76b287bf-9698-4df2-ac20-70b178a3a7c1@amd.com>
 <a0bf9d3ab00bf18783c75e453324e232633501f8.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a0bf9d3ab00bf18783c75e453324e232633501f8.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0033.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::46) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4f400b-99ad-43fa-964c-08ddd9810f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djJ1Y1B0Yi9pa0dya051MzZBQTNvczdrR05nc0M3RnVDTmVzUWRZSGE4R1pS?=
 =?utf-8?B?K3VqOTJiVlJtSnNueVEzMlhEdFBrRXoyMnVkVWdFUmE0YnlqZmUzOHVpV2ds?=
 =?utf-8?B?WDJNRHEydGNEMUJnU3U0THg4cU81dU43WFNRTXdjOEtYdGNGVDU0eGRMeDNu?=
 =?utf-8?B?SGx3Sy9iYUg4aUZ4Uk4wUkp2cms2QkFaL2dhMG5tYnhtUEVHMldjTFVOUXBR?=
 =?utf-8?B?VkpKdWgzUHRPL3dRV2l6ckxtTC9YNUhlam5hQW5ZcktWY2UzL3k0aEdONWdt?=
 =?utf-8?B?dzBNY3gxbFY5VjRrYm5KM0V6d200MlROTU9DS2ZDeVZVWWFXQ2hxeEV4SHNV?=
 =?utf-8?B?b0FNb3JFc3BQNWkxeXRsMHk1QTVmblNHYU01MEYyZ1VMa2h5M1BIeGpoL1BY?=
 =?utf-8?B?c1pTaTZXZ1h4eTFQekZ5Zk96amtrMTNRZ2NOYXRIYk9Rdjc0ZHQ5cGpZQmRk?=
 =?utf-8?B?S1lybEZRRWlvcVVNcHVWenlPaFZaUTM4Z0tnK0k5T2dTTyt3K29rVVZ3Q0N5?=
 =?utf-8?B?L3ZKRTZpb2xyVkNhbVo1SUJFa3N6VEw0Y3R5QUpucTdndXl5MnJpUGRHN2Y0?=
 =?utf-8?B?WXNlM3BaejB5UzgyclBlL2Nyd1FRUDBVN09MMUxMbGNCWDNFRHdlaTBzOC9V?=
 =?utf-8?B?VzR0UVZiT0ZPSlNic3RHZ1JZTVpBbXV4LytSOTQ0SkdiS2VaWHdWbXFQWExV?=
 =?utf-8?B?NFhLWTQ1dUpRRXc1TXBlQWw0Zzd4OUZlQTAxb096OGxVOVoxN250SkZlVWtT?=
 =?utf-8?B?WHJhbWJ2Vk1Oa1M4Y1NqcUN0K0FDdFUrWjU4aWhPZHMyTlMrWTNCRGQrdkc2?=
 =?utf-8?B?UnV2YmYyUFltU1p4Z1NrY3A3Y3pGdXZSdjVxS3p3UFAzTlpQczlDemNZZTJZ?=
 =?utf-8?B?VHpybXZOd1BES0toT0NzSytISTFiMEZEMld0YWQ4R0N2dGJFQzR6TXM1R29S?=
 =?utf-8?B?Qi9OdXFIQWVldERZM0krNlBVMnlPZmVreVJwQkI4ZkxHeWRwaUI5bXhRTERQ?=
 =?utf-8?B?ZnA0bzM1cStmenZFVGtvTjhZRGxQTHdpUXE4WkxLckdHZHRYR1FVUHFuN1hM?=
 =?utf-8?B?aDM5SlBueGpNNUZSNmFrTzZodEFZRFYvYll5ekpjMXN5bklBOTJmekgvYy9U?=
 =?utf-8?B?d21XRnZ3SmdZckUzSVpuRnp6TzVwK3NpaloxaXpHU2NOYzhOTmUyS1RZS040?=
 =?utf-8?B?Z1VXK25mSkgrYnVYZUpBUmNKVzlIcnJIOW93YkZ1WkhqbUdTem1lcU1BYUkw?=
 =?utf-8?B?alFvcWZKcU5td1RTbHB1WjNadG1EL1ZyNTVSMm84SHBVb1Rma1FUVW4wdHlq?=
 =?utf-8?B?YUx3czZPMExTc3RHdjZDR3VEaU5DU3V5KzFaaFNKOW50RkdzSXJsTndSUHJo?=
 =?utf-8?B?c2lENEx2SGRpRVJyZ1BodVhCWXJWNEdXWVl1d0dnR0FZaU1KclFCMnUxaFRy?=
 =?utf-8?B?RFNOWUtZbEV6bGNOb01MMU14dlZLQjB4Tkt1aTI4MHlBamFQNVRQREtSMVFB?=
 =?utf-8?B?VStDRThLUzJtNDRCZEVSbDR0clJMak1MYjBEdG1PUWpacTBaVlpzOVI5aHRt?=
 =?utf-8?B?Szk4d215SzdkVkRjZjltNDY1bVJWdER1Um1IZ0VPdldFZ1RYU3NzTktUZkVz?=
 =?utf-8?B?Rk5VOUJlVUZKS2x2LzE2NlliZjhDYzJVcWpjUVkybURWelRpa1VlUVphd1FT?=
 =?utf-8?B?VnpoenZPb0ZnVzlzbGVxK01Fc3c4NjhWWVVhMEF5NURZRG9RRVdEaWpMM2Ny?=
 =?utf-8?B?TlY0SEVzb2lpU3d5S0lPRERQZk5PZjBUKzlHc0hXTVhuUEU2Wmtwd0pIZnp5?=
 =?utf-8?B?cGNnMXJuNGM5a2loYzBKUURFdmF1dXBLNEhEQTRqK0RSZ1lwVTlzcWV1Skt3?=
 =?utf-8?B?OE1mWk1mdW0wdnVGVjNlYWd6anEycS9uUThSZFVVT2E1Z29jV3JpVm1XTTl2?=
 =?utf-8?Q?le+DMYKz6A8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y09ZYWJtQlQwbUtoSGdGZCtYNTZkSmpqOWxRV3dyRENBUHJ2TFRSRFY5S2dB?=
 =?utf-8?B?MWtBMkV4WDB5Q1RMVWQ0UzFFMlMwaW4zRWwrU2lvQ2lTMTZ0b1o2cGJpVGlV?=
 =?utf-8?B?bEs2MkFuNDdLU2xVdUxFVjhFdmk4ZVlnZHJwb1pQcWJudWp3a3lLWnhuSjRS?=
 =?utf-8?B?aFh2eVBMakpXOFhZUUJlMVV6cEIvMVZDcU5NVXZRRUV3dzlaZ2NzL1B0a1lu?=
 =?utf-8?B?OTBYSjR3NzJxZlFzUHE1S215MEVwdWY1WEFtOS9yUmhoaTlldFUyRDBTR3Nh?=
 =?utf-8?B?NTRzVFRtVXdBVzhXQXhBRlF4N2tBZnAyYkZ3dS9WdmlYbHhEbUxQSFQxZjNP?=
 =?utf-8?B?dGJPNHplL1lrY0kxZHlFZVhyTStRTWoydHVNbGtKb1pXK1o1VHkrUjFydEE3?=
 =?utf-8?B?cWVNTHcyUnZVbGdNQzBUTmp5SzR2aG1VKzJEb1lmMUFMbjBlSXRJcDdpcVNx?=
 =?utf-8?B?L3IrMCtJQm1XQVZRdS80RG04b0g4QlBCb3NsTHVQNlQrbFJOamUxMzBRd1VW?=
 =?utf-8?B?ZWVlcU9hdlpGQ3Y4MHBPMDI3WEtzNkZPRGEzRytOdXByMmxVdE13bzhuQ2dZ?=
 =?utf-8?B?bFR6bVYxNVpuNE1UMVFyVjA3TGFZVWxZSzZHZ2JkRWFma3RRMlBFYnV6bFdu?=
 =?utf-8?B?ZTh0bnhId01TVVFRd0dhaEp1Y2JFS2Y2UmhabEc1ZGZKa1lhTXYxTDVRbHBY?=
 =?utf-8?B?b2xpc1dNK002YzZCU1R3b09PYnZuems5ZVFnaW1HcFBPbU1HSXdPOTAwU08w?=
 =?utf-8?B?WEhZQTFRekk3czRkNUhIaDlydElFU3FhMjI5YTBodFp3VWFMMWllT0F4Z0ta?=
 =?utf-8?B?ais4dVNzYk5DMTB5RWNFejc0U2YveDFqc1Y5NU1vZXE0K2hzK0NsYVlzSlh6?=
 =?utf-8?B?cVpENHAyWjBJR3JWR1hqL2R3WkdwNno3QTRxNWl5NElHd3BoVWFidWN1NjdH?=
 =?utf-8?B?aEt6VGZENWVGODNYR3Q0cEpvblo0QWtVY25JbmwwRU1ubGVLNWtCd0NUaktQ?=
 =?utf-8?B?NDhIaHUySmsvVldiS1hjUnJzYmcxOG1idGp0anhmSEtEMlIrak5kWXprNVpn?=
 =?utf-8?B?SmZTdm96dHBMOU1YaUtubTZ3cllWcWZxN0dhZkpiUWZrVUNYSDJ3eklHM085?=
 =?utf-8?B?UEhvbUNWdXQybmVDUERiLyt0dnFQalQ2QnZUMVhvYnB0QXJoRnVxVEFBT2FT?=
 =?utf-8?B?bTlyTXoySS9qR0RpbVZYNWo4blE0Rjl0N3lTSUV2cFRqM3FNTEYrTFI5TFU4?=
 =?utf-8?B?ZVB4amErbXZaNWRnR1U0MlpvTFlhU3dDdkYwY1k4VS9Ldlo2cUZiMUw3aE1s?=
 =?utf-8?B?QzNCQTd3MURnSjBDbW9YRHo1R2UySDF2SnRhTkRyMi9uZzRIWE54V1pWcjZx?=
 =?utf-8?B?dldNUHkvVC9BYy9vdjVVNi9FUU5LZmFVQ2F0MEFwelhNa1hHQnFld2x1ZUg0?=
 =?utf-8?B?OFhCM29IaDBvQ3o3YTJ3UWtwWGR1MDgzamJnYkxKY29DWkROMitaV002Rk12?=
 =?utf-8?B?d2s3ZzlTWVFESnhSOXoyY3FxV2ZqS1VFYW43c05sSDRmRzhKZ2ZXSlZLajIx?=
 =?utf-8?B?RzRsa05sZmJVZGMrY29NL1dZUngyUlhrMDRrWkE0VWdybjlmNnZDSWhINzFo?=
 =?utf-8?B?VlVoZlNYN2txelZhUDRiL29HaThXWVR0Tis1ektwNGVVQlRjL3hOaWFxM1RD?=
 =?utf-8?B?VnlPeEkxRDV1Qis1YS9mcE5QVXRmeVYrbnhSc3hpOFMxN1B2aWdqR09FbFRk?=
 =?utf-8?B?T05pdUI1NzVUVmZLT1Y5LzV3Yjl2NnlYcFRlcnpSSHZCVEF2VmtvVWpPRmJu?=
 =?utf-8?B?Z1hYTjBOVmhkMEorSjB0WlAyT2ZKR3pIaVBrZ1RFdGZVVzNZbjQzLzZRcGdm?=
 =?utf-8?B?SGVnbmJWVDdORjRteXNXRHRVOWRsMDNVWENMT3hNN1h1YWNybG05STdjN3RM?=
 =?utf-8?B?NHJnRkdJcTQ2R25hVGJScXYrQVNyRVk0cVUyYUJlVG91RFVTUVRpQWljOE5Z?=
 =?utf-8?B?bThVQ3l6a2U4NFYyU0NRV1lZc01IZk42NUlOcktqbVZvejZicEsvMTJsUnRa?=
 =?utf-8?B?djUvbjFsWDhvSXNZTFA4aGlCVFpWcUtOSVVydXVnSmN1eFM5YVZGSGF6eGdu?=
 =?utf-8?Q?rzjOTSY5sE6MTetIkdoU1axCj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4f400b-99ad-43fa-964c-08ddd9810f6b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 09:17:29.1578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDKnQaJeWWnn4XmdaCgvI1vaIQofRVn/gnXGzHSLJLiRLl0MZAkmZYQQc+WAGeXF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569
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

On 11.08.25 17:16, Thomas Hellström wrote:
>>
>>> FWIW If I understand the code correctly, i915 bypasses this by
>>> setting
>>> up user-space mappings not by vm_insert_pfn_prot() but using
>>> apply_to_page_range(), mapping the whole bo.
>>
>> Yeah, that's probably not something we can do. Even filling in 2MiB
>> of address space at a time caused performance problems for TTM.
> 
> Wasn't that because of repeated calls to vmf_insert_pfn_prot(),
> repeating the caching checks and page-table walk all the time? 

Only partially, the main problem was that only a fraction of the BO was actually CPU accessed. So filling in more than faulted was just overhead.

> I think apply_to_page_range() should be pretty fast. Also, to avoid
> regressions due to changing the number of prefaulted pages, we could
> perhaps honor the MADV_RANDOM and MADV_SEQUENTIAL advises for UMD to
> use; one faulting a single page only, one faulting the whole bo

Ah! In my thinking apply_to_page_range() would always fault in the whole BO, if that still works for only a partial range than that should be ok.

> , but
> also see below:
> 
>>
>> We should probably just drop overriding the attributes in
>> vmf_insert_pfn_prot().
> 
> I think either solution will see resistance with arch people. We should
> probably involve them in the discussion.

Any specific person I should CC or just x86@kernel.org?

Thanks,
Christian
