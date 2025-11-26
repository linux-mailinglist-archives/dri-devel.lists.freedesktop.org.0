Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3C9C8ABDA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 16:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D2910E115;
	Wed, 26 Nov 2025 15:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5IqU6Tkb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012022.outbound.protection.outlook.com
 [40.107.200.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7ED710E115
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 15:48:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/eR9PODV0ISGQ2Hv4CgZyX2wC4TQJkNFwho/odNdcJFlPMmTtlBBj8T3NW7NWmVn5j8/NpNBtXM7t123X6G20+USAIU0+MCm1d+sL0V04x0yZOJheesc7tH1nlChTdQDLF/bxGNlunF+cuju+wd7p3XtrR6vDytCu2YfewdlqgQYUf6xeyiOIgfcr7yIsic8dGzdVUyKo0paJxN18QIt/TrelNHkKPyYeY0Q350GSLXsxrU92iCqvNFTdsTDOb9FlFy9C4PU0OVIhtrpheEeHbGs3dq4X7qQNfqgIuajv/3BsAQlXX8nOcJsVX3hPH7722aVmHJY1rLcGNtc4HLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMz5/JDciLe7MxBvllKP6uj3IbN1oaFpG6vij4gtDJI=;
 b=J+IfjjFih/nweUyLgRJwp5ZBjBJhoeRLR+P990bGaDOBoR6Ey4Gl7Kx9v85aKmNcElbYbx2W8Ll145WWCckegWgedBa3E78ewDp/ahequ4blckcm460zsvs0+3/ngAyHuAUiYIFbBt8h8NMamNfKWcT4Np09+NrB7QPHEFVbN5HlY4v9BCO7wpShUL+prj8+x+9tjZKdNKZ+0D9u2REytjm6RmvM+8pGQlZ19HEL/DKCfdsDi34+xB3V4ClQsxiNWCFxDi8sSeEJEi+kR2UWjn4kpj3wcOZLkNbLV3GVqzikgwcX6R2gxlKIKVzN6IJCWr+LPW+2yZqzJO2/xteZzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMz5/JDciLe7MxBvllKP6uj3IbN1oaFpG6vij4gtDJI=;
 b=5IqU6TkbCUhywNRG07e7vE+CbtutO87ZpfpqAxRE31/9n53Ke2AHx4G966YcrXUqa0gbkMMDwZlnu7tZku6nCw+F1u/SdJKd5jKOUp8152pXUUO2J8ZZPhGx1J/wu+DulV7HapPlaIYEiyjzDValAuXnKyVJQDRrUtv9grNL6/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8164.namprd12.prod.outlook.com (2603:10b6:806:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 15:48:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 15:48:11 +0000
Message-ID: <b12b952b-1e32-439f-8d96-78e449cbbde7@amd.com>
Date: Wed, 26 Nov 2025 16:48:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/28] drm/ttm: rework pipelined eviction fence handling
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-20-pierre-eric.pelloux-prayer@amd.com>
 <414584f0-3fdb-41e2-aa26-3776dc514184@amd.com>
 <7346d42b-3ad7-4170-900f-73d8ed356f71@linux.intel.com>
 <cc43a512-b979-4c11-a413-ab5108dab466@amd.com>
 <847eb5a7-7464-40f2-81ea-7bf2ff009a31@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <847eb5a7-7464-40f2-81ea-7bf2ff009a31@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0460.namprd03.prod.outlook.com
 (2603:10b6:408:139::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cfc13f9-ad91-425d-4331-08de2d0333cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUNrZ0hhR1pFcVRhbDdzYjNmMTIrNnA0ZWg5Tlh4TEU1UFk5Yzd4OGJmWXoz?=
 =?utf-8?B?K0VJQUtuZFBScm9VcTY5U0RLVEMvbE9DK09DREhmMzBRS0pvL2FUSjZTNGdS?=
 =?utf-8?B?WjdtZGVvTUdnczFIbHU3RHBPSUxiTEJOdVNxK1dnT21GQ3V5Vy9BYk9HVGEv?=
 =?utf-8?B?MitkbTNpbko5ZGJybXFkaUZHZjR2a09aRy9tUitGMDFLcStOOVRVMUJhV3J1?=
 =?utf-8?B?VlBtYWNCMUJRS3c0WStFNWtnSW1RQ01LaVlZODBZQ1M3MVFaWWFNUUpSWTVZ?=
 =?utf-8?B?QmFDTHBEeTlwSUt6RVRBU3dNZFV5MVRJSm9XYlQwMXdad05wOWVGSG5OWHVz?=
 =?utf-8?B?NC9BdFBvaGRkd296ZkVHeDRGN1doY2dmZVJJeWlxYlFweVBhaG5JcW5lR3g1?=
 =?utf-8?B?LzE3a0NCdUJZMm5sYWUyN0p0MUNVN0grY0xxNFN1ZWQ5WWwrbjhXeGd5ZGZm?=
 =?utf-8?B?cWI2dG91R3p6SW1DVVpOYXU4YWpvUENSRzhBd3dTZlp3SjZac0cyTnJzT0RK?=
 =?utf-8?B?U0xKZEhNSUFRWEZmaUMwVjlabGMwNCsvNnFWSExKb1YvR2RyNzdaTnFHbkxh?=
 =?utf-8?B?TUErS2REVWNNOWZzTDhGNGtTeHFIYWFiTHlzdDU4OVBJTUlEck1Tdk5YK2hD?=
 =?utf-8?B?aEF5NHNLamNZblFDQTVEUCs4Nk9QVWVBU0JrU1ZsQnpQa2Z6RC9oZnovek8z?=
 =?utf-8?B?cHJjT3VFUXRCb2FKU3NiRklKbXlrU2N2aUg3WXZzWXFiODBnODBDcXdObTdk?=
 =?utf-8?B?ZUVUaGczKzdweEJzSmFvNlFEakYyL1lyUlhiQ280RlYrdU1yMU1wRllLaHlo?=
 =?utf-8?B?WTBPYzV6VVFFMjRyVUordXMvOFJnYS93RlhGY2lxdDAyd3ZWOUsramJIeWY3?=
 =?utf-8?B?ZW9nQmJGNGJObEs0Yi9OMmV3d3RDQ0xlOFBKVlN3VGIzS1dJdGkyZ3RRbHpa?=
 =?utf-8?B?OHg0VzlDbUZJa1NJNTQxQkZ2ZHZuelBRUExOQ1hmYkZ3R0pQVkluemU1Mnhn?=
 =?utf-8?B?YUsxdS8velYwOFhXcGRYK05lOFFrTVJsY0MwWHl6NjhmZEFoeVUyZk1tY3RJ?=
 =?utf-8?B?U3NzWWhSNW8zaXV3NlR2WTJjVWxKRzNHdUxybHdxNThjVEI4dFhtd2E0ZDA2?=
 =?utf-8?B?YjMzWHRna3I3anZtSCs1Z29EWTZFck1UVE1VQ3l0YTM3SjlLQlB6Q0xsMWNO?=
 =?utf-8?B?M2VjZ3FMeit5SEhkSTVuM01GeFlDUTkzZTVLc2VvbnI0WElKTXEzUExVSHMr?=
 =?utf-8?B?TWhKclZreEpKUkNZU21DNmFpak9NNU53V1NnSmhTd2w0UmxZS044MmxPMUht?=
 =?utf-8?B?TFFqcXZpSjZMemZFMXZHdWFhcHVRZERib0NySlNHSWNJWW95SDg3cllDUUdz?=
 =?utf-8?B?UFBkMzQraTYyMHFad1NYOW5HZ3UzLzhzY21Tb0pDanUyNXpMNitkc1pqVzJP?=
 =?utf-8?B?Wk9NcjFYVVJMY0JaYXZncUtKOUxEWlZZWmtWemlPYVNSTDFvTUNwTlhVSlRk?=
 =?utf-8?B?RmJEUWR6ZFR3dkJSNmFNSnk2a1p1TjFLelZ5WDFuYkM2TjBVY3dRS1kzU3NB?=
 =?utf-8?B?eXBOOTlWbEtTdDB3bElySEVKc0l3bnJ4eFlwUlYvQnJWSWc5MW9rYWtwZkFB?=
 =?utf-8?B?WkRtUUJEYkZMalNOUGZUMVloUVowT2I4TFJXUDM1RXBBbE05bDJ2MmovTEt3?=
 =?utf-8?B?NEcvd2pXbURjaVBJbUx1SFdKa0ZJYU1oZG9MUG12RzZpS3dJUmhuQjlOSUJn?=
 =?utf-8?B?eWpkc3hXV2RxVUdTWmlhTk5GWnBTUVNlNmNvT2RCSDNEanNNcTFCQVlJNFQz?=
 =?utf-8?B?TmpKS1RSbHJlNUVZVDh3NGI2VXprU2l2WUVHOElsT1JPMmthcDRmVGFxT1Fl?=
 =?utf-8?B?V3lmZ0x3eXhndVZNR0VMckwxZXhTZS9CSVV5aXVvZW5oV25wUmRLVGxNUG1a?=
 =?utf-8?B?ZzlwVklxamJ4WkxCWjRzMEVzdWJVWWs2VTlDdDBXdnVFcUNEZWRZb1RvMkkx?=
 =?utf-8?Q?4WeNOprzoNZIHlx66ntzzmqdJrUDTI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjlNQ1JmNEdTeVc1VldaUk5DNC9zdkQ0d3Zob0xtWlk0cmgwT3RXbm84YUNR?=
 =?utf-8?B?cG12b3FvQmVYa0d0RVc1WW0vb1NHK0l2aXVNei9OaHdDa0ZrV1A2bzl2MkRq?=
 =?utf-8?B?Z01ISUJaMHhiYWNZZ2pDd21UUUlLL1hKMTRNNlIyWmxzRTVZWlZrR1Y3KzVk?=
 =?utf-8?B?K1ZHQTNZVVVLODRXelk2Z1NlQUdEVzdXbkR1YkkrU0llUnpZS1BmcG9mUlhs?=
 =?utf-8?B?RFJlSGpWeVdsbGdpdEhOWDNadm51MThpT1BhTUdXUTVHYlUrQjV4Wk9WNy9v?=
 =?utf-8?B?MzVpYnZpZFI1RlBvaVBobWVsUDlndlhWUk96MHRTV0hMcVFDZE9GSUltaElT?=
 =?utf-8?B?UXV6ZS9JamFUdk9RWkFCaTZOWUY2SjNUVHQyQ1RNb2FObGhrY1dybzQ5V3Er?=
 =?utf-8?B?N0tORXFGMzBVeXFLSEhSY1VqazhZUlFpVllWdHlVenNBazBuMHVIRnZueTFv?=
 =?utf-8?B?WjJKemIrN2xQU1NxOGhJMTZJU0ZjVkUwUENXZWpRcDlkb240c1A2R0hWSGRU?=
 =?utf-8?B?RU4xQ2x1Q2crOGpyZzB1UGJvQTNHQUtrTGlLYTlFbEtqVW1KWWlzZ2lHZzBY?=
 =?utf-8?B?Um4rUlpJUVdCUGdqcnNPbDlyUHY3QnVHb3FOcG1NVEJ5c3Q4UHVPVU9jZ3FL?=
 =?utf-8?B?RWlWVUtoajk5TnBHR2RNWmZGemZ1TUFtYXZlWVhtdUh4bHBnd3dnTDVLVkVZ?=
 =?utf-8?B?ejVSUGE3SkR6M3ozTTBYekhrUDZ3TENTODQwUTNSdWZyTHJ2RFN0Y0VpY3E1?=
 =?utf-8?B?bjdWOUZNak4xelV1TXVMYnFUSGRDKy9CMkNNR3NaR21JOWJiaERwVGtUR25E?=
 =?utf-8?B?eUlZSk9hR0UzNFZjT3ZCcUVzM0JkRXl3YWdOVXY3RDU2ZWNlRkZqaGlrTlpG?=
 =?utf-8?B?ZUxZb3NVRFA2aUgwa0tOa3oyVXhvbGlOZ0VsU0s1ekVZLzJOMndrSTZFV2xM?=
 =?utf-8?B?ZVoyenl5VHg0NkJxNW1UcjVmL2pGck84dEdjM2xYekcwNTlLd1YyT093dUxX?=
 =?utf-8?B?TFo3bFFSTFR5Y0plN1oza09aeS9KRmZneXBTU2hkRmhSTkhiS0p6d01rR0to?=
 =?utf-8?B?OUJWN1F0U1NHcml1SExvTFVtNzg3NWxHRTdCODNWU2swd0NNSndjUC9UbVZp?=
 =?utf-8?B?U1FqcFNtT0xJREJRbGwrcmZHM2RyMW9mS2E3VkNEYWZiRk8xWTNwa2E4bU5Q?=
 =?utf-8?B?c0hWeTNITXF3Q0M4dXJHNVZFWWo5YVRrN3pnTCtQdTJEdFZsOTkrekI1Y0xO?=
 =?utf-8?B?VTlWQ1JWRFErKzFPdFV5NUxtTWVrZTF2WDhnSkVzQzFPRmU4UGZtT0orT20y?=
 =?utf-8?B?bi8zKzJHTkljTmo1UDdaaWluQXk0UWNFbFZQNy9LZ1M2QWdESzBLRmJXL0tY?=
 =?utf-8?B?WnB2UW9LcUxVNExKWDhxT1d4cEhzTEQ4V3JOTnRiMDByOHBWWWsxRGtXRkM2?=
 =?utf-8?B?RE04bUFHNE9NTWwxSHgvcVcyR3ZZUFRPZ1p4MVNjQzBqdllkR1d1TUJlZFFZ?=
 =?utf-8?B?bXk3Nzd3djZ3UkRxS05laGxaL3JpM1pmeGZHTDM4aU42TEtUVGhMNTdpU2Yy?=
 =?utf-8?B?Qm56bS9JbFhwcmZscmcxWW1wR0tCbXE5d0pkT3dCUDl3RDRjMnh1c3NObWdC?=
 =?utf-8?B?OFl6YXVJcU0yaDVMRjNPQzNHTGRDU0tTUmF2dGl1bktrRWJhemlHOG9OdDJQ?=
 =?utf-8?B?NVpyLzlCRFpnMEpKMENDOFRLY0VBYUpCY2h5MUxZYmxhdmM1TVArQU5HYkJX?=
 =?utf-8?B?aWtqNjcwUENVZWJ2T1ZnaFN5MW5RRFZpSGhsT3BlbnNTZmZ0Y2haY1pWaFNp?=
 =?utf-8?B?ODBUN1hqaW5OTFpFMTRKWVRvak9PZGs1ZXdSRmZFNSt4K2JXcU0xQVozK0d2?=
 =?utf-8?B?aExFZFdvMXk2amFkN3hMU21kTHp3ZmRRNWllZHdvOUhIVzNXNTlJSGoyVXpu?=
 =?utf-8?B?aVFYbGI2ODRucWcwRXF6d0dLTE9FNm5oR1lQaW1vZGtjK3pIT0tGejRZRHQx?=
 =?utf-8?B?a2RMMkFYR2l1ZlYzSDlRVE1sWFFlLysyY3UrTFBYaHpIY2hNUUJ6cysrVyta?=
 =?utf-8?B?L2RVNTdIVVQ2QXRrNG5Uc3VqMlo3VFRSUVVScmlYQWNSK3ZmM2NLOTNJaXFk?=
 =?utf-8?Q?7p4O3k666MhVcqfKZZvvi5omw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cfc13f9-ad91-425d-4331-08de2d0333cd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 15:48:11.2397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUTPpLs5DsfA3p5bUZSX8d8Fd1O6uBViPJz5N/4oXdOf4zUC8eGzDwEDifPbu49W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8164
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

On 11/26/25 16:39, Maarten Lankhorst wrote:
> Hey,
> 
> Den 2025-11-26 kl. 16:36, skrev Christian König:
>> On 11/26/25 16:34, Maarten Lankhorst wrote:
>>> Hey,
>>>
>>> Den 2025-11-21 kl. 16:12, skrev Christian König:
>>>> On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
>>>>> Until now ttm stored a single pipelined eviction fence which means
>>>>> drivers had to use a single entity for these evictions.
>>>>>
>>>>> To lift this requirement, this commit allows up to 8 entities to
>>>>> be used.
>>>>>
>>>>> Ideally a dma_resv object would have been used as a container of
>>>>> the eviction fences, but the locking rules makes it complex.
>>>>> dma_resv all have the same ww_class, which means "Attempting to
>>>>> lock more mutexes after ww_acquire_done." is an error.
>>>>>
>>>>> One alternative considered was to introduced a 2nd ww_class for
>>>>> specific resv to hold a single "transient" lock (= the resv lock
>>>>> would only be held for a short period, without taking any other
>>>>> locks).
>>>>>
>>>>> The other option, is to statically reserve a fence array, and
>>>>> extend the existing code to deal with N fences, instead of 1.
>>>>>
>>>>> The driver is still responsible to reserve the correct number
>>>>> of fence slots.
>>>>>
>>>>> ---
>>>>> v2:
>>>>> - simplified code
>>>>> - dropped n_fences
>>>>> - name changes
>>>>> v3: use ttm_resource_manager_cleanup
>>>>> ---
>>>>>
>>>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>>>
>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>
>>>> Going to push separately to drm-misc-next on Monday.
>>>>
>>> Pushing this broke drm-tip, the amd driver fails to build, as it's not using the eviction_fences array.
>>
>> Thanks for the note! But hui? We changed amdgpu to not touch the move fence.
>>
>> Give me a second.commit 13bec21f5f4cdabdf06725e5a8dee0b9b56ff671 (HEAD -> drm-tip, drm-tip/drm-tip, drm-tip/HEAD)
> 
> Author: Christian König <christian.koenig@amd.com>
> Date:   Wed Nov 26 13:13:03 2025 +0100
> 
>     drm-tip: 2025y-11m-26d-12h-12m-41s UTC integration manifest
> 
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2188:34: error: ‘struct ttm_resource_manager’ has no member named ‘move’
>  2188 |                 dma_fence_put(man->move);
>       |                                  ^~
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2189:20: error: ‘struct ttm_resource_manager’ has no member named ‘move’
>  2189 |                 man->move = NULL;
>       |                    ^~
> 
> Is what I see.

Ah, crap, I know what's going on.

The patch to remove those lines is queued up to go upstream through amd-staging-drm-next instead of drm-misc-next.

I will push this patch to drm-misc-next and sync up with Alex that it shouldn't go upstream through amd-staging-drm-next.

Going to build test drm-tip the next time.

Thanks,
Christian.


> 
> Kind regards,
> ~Maarten Lankhorst

