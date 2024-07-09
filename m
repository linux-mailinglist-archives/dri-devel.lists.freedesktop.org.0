Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232EB92B1D8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 10:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFCE10E4A8;
	Tue,  9 Jul 2024 08:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U8vDRd4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A871D10E4A8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 08:12:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QObJbO6+coIPSKE42BqnoHRSC46LX+gsbRLj2O2YyKiWgPaR9kvuFL0tMTrscy8GZhaSyEW8nYdOmuwOY3OoAZL2Iug9GeXlD6bklPrQ/zE+BqkxZKsgMA2QGGin2hZ0UGop53pslkhYwyj4CUrLn7d6aEdhxaZmJrU2PT235JtM8j+rSDQG7TgzqMeWWXeD1rQB9KbDkiV59kb52FxUiKWj5jVZYdPukg3hauTHWpGZV+dNTA4qN4cdY2WoCLjHmKsW1X8aCVeLL5zpqyUEVxO/8UJ/nwHJylfKp9+Sc/aS/Ah6AVs1rX5IX+auZt2nY/TdX3thoCyCqCGvIfSbDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olET9NKXpeM8+y4R8raTGm23sPCNkBGWN2BZfP6xGPM=;
 b=D3wqMfpxC/bkmtwlhNsrJcGoWWFux7TGBDts3wOgtUnL5nqXBFst7uG1+5I64ywDbp0/ZFsBpykMpznUpFNkI3/+025hgtKm/2YPhQRSd40uSO1Q+M7+VgfcDTZuR+gz2ioTM/fIxxylBsZCDEUd3dtsCVyqfbJo4hxX4JIIMfGx0nAgs9BTaSggTC//Ge1lbIC7peycroBlhzSakevttz8M28DfcR8XZ6xrO82hdBCre8YlfX/fWVyFHY/yKgrTS1i9nuFG8bC0DY3grAx4oPsdp41hvIhm8rAx5yn4z+BsrWsymprA3zng90PWpl0fCtSfgSfgxKqyfYKTl8DWdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olET9NKXpeM8+y4R8raTGm23sPCNkBGWN2BZfP6xGPM=;
 b=U8vDRd4rEQsmHtJDcJBxkWw5qhKB8fR14CdFgKlcTwQX/TJ6eK0w+zYYIOZN3vf3GfnCUYW3inq4wpYzR+S75/ZKcqShoUkVVqipy3BVV7htxlqTrK0aaxpcN1oNsyzTT3bIhHEjtfBIS4YbmBpBPKZHr0JI7zf8ky/4pRhErJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by IA1PR12MB8224.namprd12.prod.outlook.com (2603:10b6:208:3f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 08:12:52 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::e441:89a7:4dd:dce7]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::e441:89a7:4dd:dce7%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 08:12:52 +0000
Message-ID: <51f06b90-d992-4187-a533-f9e89c36521c@amd.com>
Date: Tue, 9 Jul 2024 03:12:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/13] PCI: Give pci_intx() its own devres callback
Content-Language: en-US
To: Philipp Stanner <pstanner@redhat.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: airlied@gmail.com, bhelgaas@google.com, dakr@redhat.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, sam@ravnborg.org,
 tzimmermann@suse.de, thomas.lendacky@amd.com, mario.limonciello@amd.com
References: <20240613115032.29098-11-pstanner@redhat.com>
 <20240708214656.4721-1-Ashish.Kalra@amd.com>
 <7734192dbf4d07ce77ab7a20481ccb12ff71ffcb.camel@redhat.com>
From: "Kalra, Ashish" <ashish.kalra@amd.com>
In-Reply-To: <7734192dbf4d07ce77ab7a20481ccb12ff71ffcb.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::15) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2767:EE_|IA1PR12MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: c22c7bf0-9ec5-49f0-92df-08dc9feeedc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WURTVWsxcDZ1elp6bWx6b1BSMDA4bHduZVk5NjdEaFdTNUZyNDVKS3REdU1v?=
 =?utf-8?B?VTE3SmZrdG1SUFpleTd3V1k1ZjNwRDgrM3dLajNWVHIvRU1oNTVLMmtKdWZM?=
 =?utf-8?B?dk5OUm5IMjUvY2JnOXFDcFFxSnJGdXdGRm9WcHN3L1MzTVRKYlkwSWVpUE1K?=
 =?utf-8?B?RUladmEwbkh6Y0JwWGlxaWhwK3BaR25vdlRtenlxbC85b0w3Q2YvMWxNTE42?=
 =?utf-8?B?Yll2a0VTeHhHeXk1ZlhqTGg1Q0JTaURudTRPSG5FbENadUJmVTAvSk1Dd2Nu?=
 =?utf-8?B?RVAybnVhYmNVSjFia1BNbHRDQUZmS2NVcUQ3K1l4S2dRaHpQVGtodkx2c2l4?=
 =?utf-8?B?dDM0RmxFK0tDR1ZzbVhWN1VyU0tmcWQ2c0lQMzA4c1ZGQ0FJZTFOdjVmbXBL?=
 =?utf-8?B?cW1HSEFHTlRTd244M1I5bFRJYVVUYW40c1JIZTZQUkZTSzhKV08zUGU2M3Fo?=
 =?utf-8?B?U2pWZEpJNkhvUFBuUEpZUnorbFBLb1FLSGlGeWxVUG91cVNmbFZmdGpQUmE2?=
 =?utf-8?B?RVc3d0w5WkJ3bHl6ejJjeGtxeXlnQzl0ODdwbXlMQ0gyR0d4anFmSFRhVUVC?=
 =?utf-8?B?ZzFtK1hIT3FiTHdBZG9wbzhRY1luUjZPa3oydmJiOHF6QXlPUjJYNTFVM0Uz?=
 =?utf-8?B?RlVzUFVsNXg3QUFLLzc2NEdLdEk4a1FxcjQ4ck8zOVNZOWhrM0t3K1hCSU1P?=
 =?utf-8?B?aXdFZHNkd0JkZTFhZjFRMm9nT2M1UnY0d1lRNFlQNHBvVEhtZTV5ZVVhTEpP?=
 =?utf-8?B?NzVKTFFKY1dUbG5xSlBKVTlWWnVrbjFXRHRBVmkvMERucS93azlReTZvWWRG?=
 =?utf-8?B?dlRyUWF3bXRGZUZKRmNFUXJseFhkeVg0VHZYRDRMLzV6U1NyVy9CZEdKOTBS?=
 =?utf-8?B?bmZQQ3Q4Tkx0eXhVTXo2eWRRZlYwcC9kWis0OEUvNko1Wm1MUXc3U1ZjcjJx?=
 =?utf-8?B?NUI4eURGV1A3ekpYUHY4d0EyeXZLaHViUEtyYXRUQTZlWU03cVFmTEF5bEdu?=
 =?utf-8?B?Z05VbUlEQys4VjhpNHhMVHJrTkN5L1lmVDlScjBqMG90ajZWNlkwZ1NWNEpo?=
 =?utf-8?B?Q0xwZFMwY1pxWUEvdlMrUTE0cTR4OXc1SXN0d1ZCZlhiUjM2UW9vMHNFNkpu?=
 =?utf-8?B?Ni9RQi9nNzdCVmFTNk9jWmc3YW02bERMYWZISXlRbUNpKzN6cm9rejYvUXdi?=
 =?utf-8?B?Vjd4ZVpQbng2cDdScWRxa3N0azhhVW1rK0RPRm0rbm5uVTY4NW9NbGdtbVlh?=
 =?utf-8?B?TCsxTlpEcFpSUjRLMlNlZWRTSUtKd3lDWmxrTGpkTzJDb1RMcFJHUi9aRXNl?=
 =?utf-8?B?OXBwNCswckFRK3lkaFBoUENtS2YvdlZPZzFwRldIMFByQkRSdnpYRzd4cnc0?=
 =?utf-8?B?VHkrWWxkdks0aCs3c1N2QnFGcGlMb0NqZjV2b3NLcjlsbnUza3VRZEJPY2la?=
 =?utf-8?B?b3piV1hucnBBcmt5M0pHc1RIODNJMS8rZnMvT1gzZ1ZDYlpYRW1CUjBheksv?=
 =?utf-8?B?V3QvSmltNXZqL21sYk8xc2tLcU9XUnFlSXZWeER5L2FZVXd6SlNaSThVQTBM?=
 =?utf-8?B?bnlGTjhNTXUzSXdpT0xDcnRseHZJVXNBcDRDUXd5WE1RMTNtMnpKbEVxZFV1?=
 =?utf-8?B?WS9TTDhvYVVaOEkyMGZLSWp2QkUwL0xFcWQwWWx4em1xM3JsNUkwQmd4OUxx?=
 =?utf-8?B?cVNaSGhNTWVxZVVrdFV4OWdtLzR6N3Zmb2FhT2puaDR1b1FaQ0RyemFuQld0?=
 =?utf-8?B?TXdPY0h5MkFMRmVwbUp6ZXZBRlhkZ2hXcXVGa1FSdFlScjNvMVpIUjhsNUZv?=
 =?utf-8?B?ZVR0a2VQRFRTM00rdWRDUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1dXWXVyTXJBOWVPOWk5RXZrZVp3ZUZXc0NJN2EwQTFQbjNpOWRXTzFIRnNH?=
 =?utf-8?B?VzdVTGdDb1pYWDNpWDF1ckcrZVpGZ1hPL2g3TndCcWNrZENYNnpiSm8wT2RY?=
 =?utf-8?B?NDVYZ3RlYzVMUzMxRHQrcWtXRW5sR0hFb25FMVpKMFkwM3BDUGh2T1hOTmJH?=
 =?utf-8?B?Wnl5TS9qNjJXZS94WDY5TFREOE1lSTRpbVJiRlZkekdEYXJLZ3lXTnh4OWND?=
 =?utf-8?B?TVc5dzV1U2g1enlXTUlCSzNzSjdyRS90dUs0NnRZWUJEOEhqcWh3dlBoQ3kv?=
 =?utf-8?B?U1JRdzhkUzNFdkw0QW1aREJYT1JjZFNhNEtXUzg2b3RaTFAyRmtydUFUTDRI?=
 =?utf-8?B?dm5NV1ZGQUdmRll3Z01iL3VHbXJIaW9WU0FXL0FhMlA3TGxqcDJEYmRwL3p2?=
 =?utf-8?B?TG9QZCtpZExmdGhPN0wyNjI1S1ovRm9yMGlXTlY0VVZDR1hKNCtHOElxVld6?=
 =?utf-8?B?cVgrM05QdDE2WkNWRmM0cWNPcVVyMzdqdVIvcDJiYTRvOGlrRUlDN05uRVpK?=
 =?utf-8?B?UHpHbEFtQWp1R0h6QS9idFhQYWRmb2laVU83RmJtL0Fqa1J2M3ZRNUJzUW9j?=
 =?utf-8?B?YzVvVkExOE5wdDg5WFV0SmVVdlM3MVlsYWU4ZzFsTGVKN2ExVTFTNEY5N05p?=
 =?utf-8?B?ZFVuNFl0UDZMSUNRU1o2T29aSWM1RmVFeFB4MVVMYThDbHkyWjJDRDZmWnJL?=
 =?utf-8?B?UkVHVkJ5a3FrdStINUwvVHR1bitud2RyZjVFWkV0YmZLc2xWVFg5RXNZN21D?=
 =?utf-8?B?RE5tRXk3SlNLT092OWp2UFg2ZEl5ZlJYWGFnR3Azcjcrb2FJck9NV0xGbnFs?=
 =?utf-8?B?eDREams1RHN3N1J4R2hXWkhWNGg4a0RnWXA4T2Q5SEd3eHFySmR6bzF2VVJR?=
 =?utf-8?B?VE5jYXEyQVg1VFRDbjdTRGJwK2Fod2VBQVFSOGwyaDJ1aDdzaEF6MS92WC9y?=
 =?utf-8?B?Y3RXZm9jZE52QUU3OE5lT25GdCtzTU0vNm9OZFNGSW1GQU5HK21MY1UrQk9S?=
 =?utf-8?B?cEQrUW9LdHBQS3JOeEVTYkRlcGNjQW96ZVY1emk5Z3l0L25ZWnJBVEhUZXFB?=
 =?utf-8?B?eERPU0pGcUszdUNhcGZobFBBNFN5RXRuYUN4MVlkU0hzRUVxT0NyRXlLSG1o?=
 =?utf-8?B?a0ZJN3R6eTRQeDZLeEdYdHZCNm41Tnh3WHVKL2t4VSt6MUpCZmFONGd1SFk4?=
 =?utf-8?B?TjJPM3BGRXFuazhxTTNhTTdST1VZUWZaaXFvako4U284Zlg0b2wwamRRN1oy?=
 =?utf-8?B?UEplNDRYQnhOTmNqS3NNS21hdUVoazY4ZXlqM3N3N1c0cGp4dGRaOEhLTUMz?=
 =?utf-8?B?Um4yRit4MTNLNGZXRXB5RVMyVE11c3FOamFsZ2NJMVhmTkw3aDdGOFpNM2c1?=
 =?utf-8?B?elE5ZC8vSUtpcGkrVXE0ZHhCSWhGc1ZZamRHYTBkR1RuZElrUFZTSEk5UlNp?=
 =?utf-8?B?U0grY3JZb3hqeXUvL3E2Y0FuYWJlY29CWmU5dy91UkxYMUpROXVxTDVHa2NW?=
 =?utf-8?B?ekJqZ1VmMFl1aWYvTXN4MUpBWVFqclkwUGswTUYwRVd2OEU1cnpabmZsVVRx?=
 =?utf-8?B?VGpVNlVHMlUraHhkeWhvU1k2L2s4Nk5XY2NKalY5VmJEMWkzS3BkS3BhRXdu?=
 =?utf-8?B?a3E2N2pXVW8vZWpoSHVtcGkrLzU1TTNvVEZ1SCs5ck90bzFQenlDa3hPeVcr?=
 =?utf-8?B?NXdzNnBxNWVZd0FIcmpKdGpBcXJDMkhUeWF6amNEQVA4Y1BkWjdMTFhoV1FU?=
 =?utf-8?B?eVdkazNsYVlEem5WUGtKejVTWEFJeWhyckhJSjd0MDdtaHpHSlNwT1YvOW91?=
 =?utf-8?B?VU51VGVlZzJmU01wOHhMWGg3VHYxWlR1bUFMZGpRWnV4UVRXWUlqZTc4emw0?=
 =?utf-8?B?TnNtTHh3YXBLN21IMHZMbXhWcFZPcjdvbHMyTTVQbGRMZzZUMkQyUVJMakt4?=
 =?utf-8?B?VDFnV2xYZTQwRWJ5MFlhVEJZSlZBZ3BSZDgvZFBodVNPMUtkVUZybFh6QXNN?=
 =?utf-8?B?SWhBUkNRRENMUm9LTkRxY2JzRlFvZ3FhVnBOSy9URVVqMkorcHFGOTFwOHlp?=
 =?utf-8?B?ZXJEczFTcEZ5clBwSWx6OUVkZlc3VURqYXVjQWw5UTdOQlF5bThvVnJnTG83?=
 =?utf-8?Q?+pt2tCic28vzesGATKfKTEKlJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c22c7bf0-9ec5-49f0-92df-08dc9feeedc7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:12:52.1432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQ0+y532LOV4nfNAPNxlLLzG2zgrGj/EWB3UpvBkjNM6UsIEQi/HYozkxy9k4Gi+zjbvXP4TbyGF7INs+UAWyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8224
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

Hello Philipp,

On 7/9/2024 2:21 AM, Philipp Stanner wrote:
> @Bjorn, @Krzysztof
>
> On Mon, 2024-07-08 at 21:46 +0000, Ashish Kalra wrote:
>> With this patch applied, we are observing unloading and then
>> reloading issues with the AMD Crypto (CCP) driver:
> Thank you very much for digging into this, Ashish
>
> Could you give me some pointers how one could test CCP by himself?
>
>> with DEVRES logging enabled, we observe the following logs:
>>
>> [  218.093588] ccp 0000:a2:00.1: DEVRES REL 00000000c18c52fb
>> 0xffff8d09dc1972c0 devm_kzalloc_release (152 bytes)
>> [  218.105527] ccp 0000:a2:00.1: DEVRES REL 000000003091fb95
>> 0xffff8d09d3aad000 devm_kzalloc_release (3072 bytes)
>> [  218.117500] ccp 0000:a2:00.1: DEVRES REL 0000000049e4adfe
>> 0xffff8d09d588f000 pcim_intx_restore (4 bytes)
>> [  218.129519] ccp 0000:a2:00.1: DEVRES ADD 000000001a2ac6ad
>> 0xffff8cfa867b7cc0 pcim_intx_restore (4 bytes)
>> [  218.140434] ccp 0000:a2:00.1: DEVRES REL 00000000627ecaf7
>> 0xffff8d09d588f680 pcim_msi_release (16 bytes)
>> [  218.151665] ccp 0000:a2:00.1: DEVRES REL 0000000058b2252a
>> 0xffff8d09dc199680 msi_device_data_release (80 bytes)
>> [  218.163625] ccp 0000:a2:00.1: DEVRES REL 00000000435cc85e
>> 0xffff8d09d588ff80 devm_attr_group_remove (8 bytes)
>> [  218.175224] ccp 0000:a2:00.1: DEVRES REL 00000000cb6fcd9b
>> 0xffff8d09eb583660 pcim_addr_resource_release (40 bytes)
>> [  218.187319] ccp 0000:a2:00.1: DEVRES REL 00000000d64a8b84
>> 0xffff8d09eb583180 pcim_iomap_release (48 bytes)
>> [  218.198615] ccp 0000:a2:00.1: DEVRES REL 0000000099ac6b28
>> 0xffff8d09eb5830c0 pcim_addr_resource_release (40 bytes)
>> [  218.210730] ccp 0000:a2:00.1: DEVRES REL 00000000bdd27f88
>> 0xffff8d09d3ac2700 pcim_release (0 bytes)
>> [  218.221489] ccp 0000:a2:00.1: DEVRES REL 00000000e763315c
>> 0xffff8d09d3ac2240 devm_kzalloc_release (20 bytes)
>> [  218.233008] ccp 0000:a2:00.1: DEVRES REL 00000000ae90f983
>> 0xffff8d09dc25a800 devm_kzalloc_release (184 bytes)
>> [  218.245251] ccp 0000:23:00.1: DEVRES REL 00000000a2ec0085
>> 0xffff8cfa86bee700 fw_name_devm_release (16 bytes)
>> [  218.256748] ccp 0000:23:00.1: DEVRES REL 0000000021bccd98
>> 0xffff8cfaa528d5c0 devm_pages_release (16 bytes)
>> [  218.268044] ccp 0000:23:00.1: DEVRES REL 000000003ef7cbc7
>> 0xffff8cfaa1b5ec00 devm_kzalloc_release (104 bytes)
>> [  218.279631] ccp 0000:23:00.1: DEVRES REL 00000000619322e1
>> 0xffff8cfaa1b5e480 devm_kzalloc_release (152 bytes)
>> [  218.300438] ccp 0000:23:00.1: DEVRES REL 00000000c261523b
>> 0xffff8cfaad88b000 devm_kzalloc_release (3072 bytes)
>> [  218.331000] ccp 0000:23:00.1: DEVRES REL 00000000fbd19618
>> 0xffff8cfaa528d140 pcim_intx_restore (4 bytes)
>> [  218.361330] ccp 0000:23:00.1: DEVRES ADD 0000000057f8e767
>> 0xffff8cfa867b7740 pcim_intx_restore (4 bytes)
>> [  218.391226] ccp 0000:23:00.1: DEVRES REL 0000000058c9dce1
>> 0xffff8cfaa528d880 pcim_msi_release (16 bytes)
>> [  218.421340] ccp 0000:23:00.1: DEVRES REL 00000000c8ab08a7
>> 0xffff8cfa9e617300 msi_device_data_release (80 bytes)
>> [  218.452357] ccp 0000:23:00.1: DEVRES REL 00000000cf5baccb
>> 0xffff8cfaa528d8c0 devm_attr_group_remove (8 bytes)
>> [  218.483011] ccp 0000:23:00.1: DEVRES REL 00000000b8cbbadd
>> 0xffff8cfa9c596060 pcim_addr_resource_release (40 bytes)
>> [  218.514343] ccp 0000:23:00.1: DEVRES REL 00000000920f9607
>> 0xffff8cfa9c596c60 pcim_iomap_release (48 bytes)
>> [  218.544659] ccp 0000:23:00.1: DEVRES REL 00000000d401a708
>> 0xffff8cfa9c596840 pcim_addr_resource_release (40 bytes)
>> [  218.575774] ccp 0000:23:00.1: DEVRES REL 00000000865d2fa2
>> 0xffff8cfaa528d940 pcim_release (0 bytes)
>> [  218.605758] ccp 0000:23:00.1: DEVRES REL 00000000f5b79222
>> 0xffff8cfaa528d080 devm_kzalloc_release (20 bytes)
>> [  218.636260] ccp 0000:23:00.1: DEVRES REL 0000000037ef240a
>> 0xffff8cfa9eeb3f00 devm_kzalloc_release (184 bytes)
>>
>> and the CCP driver reload issue during driver probe:
>>
>> [  226.552684] pci 0000:23:00.1: Resources present before probing
>> [  226.568846] pci 0000:a2:00.1: Resources present before probing
>>
>> From the above DEVRES logging, it looks like pcim_intx_restore
>> associated resource is being released but then
>> being re-added during detach/unload, which causes really_probe() to
>> fail at probe time, as dev->devres_head is
>> not empty due to this added resource:
>> ...
>> [  218.331000] ccp 0000:23:00.1: DEVRES REL 00000000fbd19618
>> 0xffff8cfaa528d140 pcim_intx_restore (4 bytes)
>> [  218.361330] ccp 0000:23:00.1: DEVRES ADD 0000000057f8e767
>> 0xffff8cfa867b7740 pcim_intx_restore (4 bytes)
>> ...
>>
>> Going more deep into this: 
>>
>> This is the initial pcim_intx_resoure associated resource being added
>> during first (CCP) driver load:
>>
>> [   40.418933]  pcim_intx+0x3a/0x120
>> [   40.418936]  pci_intx+0x8b/0xa0
>> [   40.418939]  __pci_enable_msix_range+0x369/0x530
>> [   40.418943]  pci_enable_msix_range+0x18/0x20
>> [   40.418946]  sp_pci_probe+0x106/0x310 [ccp]
>> [   40.418965] ipmi device interface
>> [   40.418960]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   40.418969]  local_pci_probe+0x4f/0xb0
>> [   40.418973]  work_for_cpu_fn+0x1e/0x30
>> [   40.418976]  process_one_work+0x183/0x350
>> [   40.418980]  worker_thread+0x2df/0x3f0
>> [   40.418982]  ? __pfx_worker_thread+0x10/0x10
>> [   40.418985]  kthread+0xd0/0x100
>> [   40.418987]  ? __pfx_kthread+0x10/0x10
>> [   40.418990]  ret_from_fork+0x40/0x60
>> [   40.418993]  ? __pfx_kthread+0x10/0x10
>> [   40.418996]  ret_from_fork_asm+0x1a/0x30
>> [   40.419001]  </TASK>
>> ..
>> ..
>> [   40.419012] ccp 0000:23:00.1: DEVRES ADD 00000000fbd19618
>> 0xffff8cfaa528d140 pcim_intx_restore (4 bytes)
>>
>> Now, at driver unload: 
>> devres_release_all() -> remove_nodes() -> release_nodes() ...
>>
>> remove_nodes() moves normal devres entries to the todo list, as can
>> be seen with the following log:
>> ...
>> [  218.245241] moving node 00000000fbd19618 0xffff8cfaa528d140 from
>> devres to todo list
>> ...
>>
>> So, now this pcim_intx_resource associated resource is no longer part
>> of dev->devres_head list and has been
>> moved to the todo list.
>>
>> Later, when release_nodes() is invoked, it calls the associated
>> release() callback associated with this devres:
>> ...
>> [  218.331000] ccp 0000:23:00.1: DEVRES REL 00000000fbd19618
>> 0xffff8cfaa528d140 pcim_intx_restore (4 bytes)
>> ...
>>
>> The call flow for that is:
>> pcim_intx_restore() -> pci_intx() -> pcim_intx() ...
>>
>> Now, pcim_intx() calls get_or_create_intx_devres() which tries to
>> find it's associated devres using devres_find(), but 
>> that fails to find the devres, as the devres is no longer on dev-
>>> devres_head and has been moved to todo list.
>> Therefore, get_or_create_intx_devres() adds a new devres at driver
>> unload/detach time:
>> ...
>> [  218.361330] ccp 0000:23:00.1: DEVRES ADD 0000000057f8e767
>> 0xffff8cfa867b7740 pcim_intx_restore (4 bytes)
>> ...
> You're absolutely right, that seems to be the issue precisely. In fact,
> this problem of PCI hybrid functions calling themselves again even
> forced me to implement a "pure unmanaged" version of
> __pci_request_region(). So it's a pity that I didn't think of that
> problem for pci_intx().
>
>> But, then this is an issue as pcim_intx() is supposed to restore the
>> original PCI INTx state on driver detach, but it now
>> operating on a newly added devres and not the original devres (added
>> at driver probe) which contains the original PCI INTx
>> state, so it will be restoring an incorrect PCI INTx state ?
> I think this is just UB and we don't have to think about whether it's
> the correct state or not – it must only be restored once, so it's
> broken in any case.
>
>> Additionally, this newly added devres causes driver reload/probe
>> failure as really_probe() now finds resources present
>> before probing.
> Yes, that has to be separated.
>
> @Bjorn:
> So I think the solution will be not to call into pci_intx() from
> pcim_intx_restore() at all anymore.
>
> Similar as we do with __pci_request_region() <-> __pcim_request_region().
>
> Let me dig into that..
>
> I guess you'll prefer me to send a fixup commit to squash into the
> pcim_intx() commit?
>
> I'm quite busy today, but will definitely deliver that quite soon.
>
>> Not sure, if this issue has been observed with other PCI device
>> drivers.
> Everyone using pci_intx() AND pcim_enable_device() will have this
> issue.
>
> The only thing I'm wondering about is where your code in
> drivers/crypto/ccp/ calls into pci_intx()?
>
Actually, the CCP driver does not explicitly call into pci_intx(), the flow to pci_intx() from CCP driver probe is as follows:

[   40.418933]  pcim_intx+0x3a/0x120
[   40.418936]  pci_intx+0x8b/0xa0
[   40.418939]  __pci_enable_msix_range+0x369/0x530
[   40.418943]  pci_enable_msix_range+0x18/0x20
[   40.418946]  sp_pci_probe+0x106/0x310 [ccp]
[   40.418965] ipmi device interface
[   40.418960]  ? srso_alias_return_thunk+0x5/0xfbef5
[   40.418969]  local_pci_probe+0x4f/0xb0

And obviously, pci_intx()->pcim_intx() get invoked due to pcim_intx_restore() callback being invoked during sp_pci_exit() code path, as below:

[  218.128978]  pcim_intx+0x3a/0x120
[  218.128986]  ? srso_alias_return_thunk+0x5/0xfbef5
[  218.128999]  pci_intx+0x8b/0xa0
[  218.129010]  pcim_intx_restore+0x1b/0x30
[  218.129019]  release_nodes+0x65/0x90
[  218.129031]  devres_release_all+0x9f/0xe0
[  218.129043]  device_unbind_cleanup+0x12/0x80
[  218.129055]  device_release_driver_internal+0x20c/0x250
[  218.129065]  ? srso_alias_return_thunk+0x5/0xfbef5
[  218.129078]  driver_detach+0x4f/0xa0
[  218.129091]  bus_remove_driver+0x87/0x100
[  218.129101]  driver_unregister+0x35/0x60
[  218.129113]  pci_unregister_driver+0x44/0xa0
[  218.129123]  sp_pci_exit+0x19/0x20 [ccp]
[  218.129137]  sp_mod_exit+0x12/0x18 [ccp]

...

Basically, CCP driver calls pci_enable_msix_range() and looking at this function:

pci_enable_msix_range() -> __pci_enable_msix_range() -> msix_capability_init().

And, msix_capability_init() -> pci_intx_for_msi() -> pci_intx().

So it looks like drivers using MSI-X/MSI (using API such as pci_enable_msix_range()) and pcim_enable_device() will get into this issue without explicitly calling into pci_intx().

Thanks, Ashish

> Regards,
> P.
>
>> Thanks,
>> Ashish
>>
