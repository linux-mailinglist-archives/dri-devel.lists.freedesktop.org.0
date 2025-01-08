Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC642A05D1A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 14:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6894310E06A;
	Wed,  8 Jan 2025 13:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aQe4xpxp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2088.outbound.protection.outlook.com [40.107.96.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FA710E2BB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 13:44:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2vDPvwXXkS1sYeQxWacMoyFNPuzAz30y3lsZWnY5Sq5HQmhf8kGhZulHzU6gCG65GSSWhcBdHLm71gCuVyPo+lf7UB5amKljq4NIi0VDJm2tL7Dvjj4KWeVeHh6rSxjQcrQ6zwNjHICKNasOKKorn+sb9q75wIwHS/bhr0rbKVsNgkWV0IqE37bBtgaSQsTUCKUTaPrWXtKZzkaM9Q+J3hkW6mfv9n3Q+jLpB7U73uyiZRkRVKUO5kVkC6k3BohyHkT7YS56MzeiAgjTN+E9uhXdrGCC17TSkJakQUwplH3nCIemF0aTgfI+9Zb1+BoySbpd13owfTd1aBAVKm8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLuMRiyx5kT9NeVvdHDy+TEeQUAgETX1BZPWKtJNA8Q=;
 b=AHHINPbftYzmZExk09wZ6XLPEIe0TqMnUSoJkeQY1/x2MDrO8n+hTZY6iwtmxWRYzB+/nd2IpUQZNlxOZDTCTpROxiXVOPLfuw1cuo67lLjXOEuphbLO4eFGsKtV1K83TVbDu8HSHVkneX5ITts6XO+UMcSG2rYRQZ8q5AH4JjlT+8kcGx8IH/8lTHzIXoMC9lv41bpZlz60Kxa3NiG165phr6CBaKWfbQorr5oqISsltU85w1yuaHsEvZCTPTUF3SL9HyJpAFRDBA84ueDUorvNezYFxdxP7upktnGB6dIjrNLMF1bzkl7F5WJmpRmGfdtN/XH1rJ2TXhaXG+j50Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLuMRiyx5kT9NeVvdHDy+TEeQUAgETX1BZPWKtJNA8Q=;
 b=aQe4xpxpkKaWY5kfKx38joh+rDZr46J9cK4DnxC3YCz4QDeHPWEdkHH0FvG+2X5u695cdGuAR0lAAwuIwRZTV4clJNZaNo6C/Iyv7i1vrxPvEIK9UCJOZoBa+QuXD7Jpgz4WUgbv3ZtRut8PF6fuAlFPxhalI+tannCqkObLsuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7521.namprd12.prod.outlook.com (2603:10b6:610:143::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 13:44:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 13:44:35 +0000
Message-ID: <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
Date: Wed, 8 Jan 2025 14:44:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
To: Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
 <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250108132358.GP5556@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 206a5187-6cc0-46aa-fc20-08dd2fea96cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGVTY0plVEM0eXJlaEM0ZDBoaUJOVXphNkZKOElvUkNORG1yYzA0WnhtZm5P?=
 =?utf-8?B?YjNmSkhnbndqNVA1S1VTeWp6cTlrZk9ZOHEyRXJTOXhEeDl3djZwUWVuaHo5?=
 =?utf-8?B?TGtub0NhUW1ybVpaTmpSeWY4UWxFL3REV0UrRWpFMnltTlg4dVRVMk92L1Zs?=
 =?utf-8?B?N3psak5DWWlScXZWL3VoL2RrUlBWeWpHWi9ORFByS1dZWTJseWdOeTJrMEQ2?=
 =?utf-8?B?bHM2Q3M1Wm5ONE9QY0s1SW50TWU5WTRtUzNoREJvUzhRelBXOHNubTIyMjFT?=
 =?utf-8?B?dFhhYlZiSTNoNkhxMDJCZWZRUFdQUE8vcVZDbFZnS3pBVnpGSndrTlpjajlO?=
 =?utf-8?B?NElUZzJEUzZPdnFVSWw4clNOaTB1U2NMMW9HYkhjK0xKaHBVeCtkMmdYV2tD?=
 =?utf-8?B?bXJLeHN6dE9qbE93MUNFRlBmVU4zQWJkaVNKS1I0M01kSjVXbHlnTlJUSHQr?=
 =?utf-8?B?ZlhUMC9wVDRPdmJ5Y3lYbm9xVWV0U3RjdjVyYlo3RitUQThLNWk4SVVFdDNt?=
 =?utf-8?B?MXJ1d3lXbXBMc05iY041UkdHRjIwYW9lMXN4M04wR0p1aHBYQTB3bkFlREs1?=
 =?utf-8?B?UllqVmNFRDhLeHZtTnM3T2h2UkRJdmZDRHA2Rm5NL2R4YWFtbnhRZUVtYS9F?=
 =?utf-8?B?NElVeHVrYXFBZks0RzNjazRxVFFPQ2ZILzRiVGVIcW9aRTFUcjF4MmF1RUpI?=
 =?utf-8?B?dTlPMnA5TmsyUnV3NWxUZ25JaUpUdy9mbGE3OWVjUVBpUHJ0YzhjL3huU2s4?=
 =?utf-8?B?ZlROcVZ0SXBJdm9MVTl2dVNOWHhZMWFGbEJZa0I0QktpTE1MUmczYVA2Qlhh?=
 =?utf-8?B?QkhXOU9jT0hCT0Nkd2I5L0lKcXJQZWxsY1lXNXJORElHVW5YNHZJR29tMHFD?=
 =?utf-8?B?SFRXTUtqLy9veVcraFRVdzhjdUpvYm4xd3llQlRRQW04dERxallxY0tOQW9o?=
 =?utf-8?B?VWEzc0RpNUxvdnZld0RiWWJYR04vVHE5Zk8zVWIzYjBTWUQ0WUZHOUZXaDVw?=
 =?utf-8?B?K0ZuY3RIc1liMEZvbFBTTUQ1VWMrU3dKbmdXTVNaOGRxUlpVUXlHcWhOZENK?=
 =?utf-8?B?SjBTYndjSEJ0OWVuWHhFOFlZbWpMYjNtMTBlUFdrcitidS95K3NOTXA5Nkw4?=
 =?utf-8?B?UTFVZ3FmSVIwV29rRmYyVXN2QURPT2lCQUtkZWpFc01pNFgycU96WlN2VGFO?=
 =?utf-8?B?QjNpSVJ4Q3VQKzBYc1JYOXNZY0J0RmN2OGpZSytLaGd5bVpvN2hRdHNQSjVS?=
 =?utf-8?B?aWFsSi9vbzZ0KzZqUFZFN0VuYVRjYVJRWUtKMHhRbXVmN0U0cEw5REM0T3dP?=
 =?utf-8?B?aUVYTVlSWUNGOHRGczZ1cFdGZW8wMWZjNHk3ZnZjdDZSdVNQOFRIVnVieFoz?=
 =?utf-8?B?dENnVVlxTkxvUmNxb1lIS2FuYVk1VWRSemdubjRNb3pEcGo2NzZhVVYrcCsw?=
 =?utf-8?B?K3lIeG00NDIydGVCWEphUVRlTVhWZ3JoZkZ1TlF4dTJsYkZuYnVPa0p1d2Rl?=
 =?utf-8?B?WUUvTkpJL0ZTT1Jyekc1Tzc1Vy9BU1VGekhzSG5Od0o5WkZKZ3ZSa05WN01x?=
 =?utf-8?B?UmdMOG11My96MUwybFIzZU5SZTYrTXVlY21rczVMd2Q5UkxUNlNNYUt1SjZa?=
 =?utf-8?B?N3NQNENDYmdOTVRaaW0xYUdacjBHd0trclg5ektsYjk1UEZNNDV6dTJRaVNG?=
 =?utf-8?B?R1ArTGtpOCthM09STmFDSmdGdXVDRElUV2I0T1ltNWptZ29QUnNyWTBqT1Z6?=
 =?utf-8?B?Vno2N0RsMXlVaHpWcXZ3MjZzS1VhWEx3NkIwdGhkTFY2SmRyOUVUYnBnOEdQ?=
 =?utf-8?B?ZEJNMENjcXM4cnJFa21DMzVYRUVNa2Fqd0hLNTRhOWhPanZKSVpsT29hSGph?=
 =?utf-8?Q?lDrB9+y5Lpwbl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1VzUko4c3gvT3VURWJTVVJybXBOTFdTSWtwblhhOGJyOXJIaFdqbGkraDY1?=
 =?utf-8?B?ckxoTFVtR2pyZkJrQ1ZxZHpaS0VYYTdzb1I2czNYY09wOWczeEJibm5sNWc0?=
 =?utf-8?B?eHhNdlQwVG1CNXg4WGZxeFdzbnJmSEZkbms4T1hmVi9FZ0RVbnIxc0JMUk1B?=
 =?utf-8?B?VVJRU040QmVKN1N1ZnQ5VGdoZzhMYlo2L09EdHlvaHY3Qm80ZWlMM0REY3A1?=
 =?utf-8?B?TjdwL25jWFJWK0dpdjczSmswVjh2MTEwV1o3VnFZY3RPVFBMVXlTdTZFZDMz?=
 =?utf-8?B?ZnV3Wk0wL2cxMzRlTlN1WFhBeEpsMGp3QW9paGhzNjBLTnlCNXFxREtqbzM4?=
 =?utf-8?B?UE56NW9qNkYvRmtGdDdZenJQbWpmd0tCN09ndlBkQlJmN0VXWGkrd3k5OG1R?=
 =?utf-8?B?UUszZDhZY2VoUEZUcmprQ3RZa3FqV1VBTGttNGozM0R6WDZXZ3lUL3duYnIw?=
 =?utf-8?B?SGZhcitoMTdlai9jK0RET2prK1BURVlhL0hMT3pudHB2UlR2eGlxUUJEZmVo?=
 =?utf-8?B?c2xJK1BGcWN3Q2czQk5wZzdVZCtSWFZZS0h4aXVvMXBrWG15QzJlekNHSlhz?=
 =?utf-8?B?MjFRdmRLOHc5TWdJYVo5WThNWEhiK1JPWG55WUZWaGdiNjZkR0pLVzk3TjB1?=
 =?utf-8?B?d1ovejAyQzRWRkZYdW9lUEpOTnBFTnUrSzhiaUpMVzlXQ1QvMFpDQVVWK3B5?=
 =?utf-8?B?VUtpc1FnSFN5ZHIwalJneDNYNkpQS2VncFVwSHJ6di9NdUMvbjdPdTMzTU9W?=
 =?utf-8?B?U3ZSa3NENHdKSW1JSGRNUFlGQ3ZVa0YwOFhxc3lwTmNOWjFud0Z2UUxsSGdI?=
 =?utf-8?B?ekR3V25QK1hzMGpvRXIvSmNVV0h2cFp1aXBxbnBDY3I0VDBSNE1VRzFxZlJq?=
 =?utf-8?B?L2RSdTNPalFzckg4UGJTS2NsMkp3Q2FXTjZKcC9pUlNOVzJjSllnREsyb01T?=
 =?utf-8?B?bEFGclF3Tlg4WHdFZGpjcmx5cS9UNmdaRUplVDB3YWdHdE5ScHpjaFc3RURO?=
 =?utf-8?B?RmlwWGJPaWhhb0RWbk1naStlZk9RYm5XY2lwSjYwZ0hreXlvdjVFSGp0Q09i?=
 =?utf-8?B?RG1NQkQzNGpiWXpyL2NQNlpoYks5QmpEWnBKZjhuSTlMV0ZBRG0vQUdqSmxH?=
 =?utf-8?B?WWcyeVFqUkc1cjczaVhxaTdkYVRLKzJ3TjdVYW1EMzRrelNQeHEzQTVNakRE?=
 =?utf-8?B?cExGcGhvMHU2RUVud3JxUks5dWNRRmhTV3VDSml2ZjFOcmpQWVN3QkNXWVU5?=
 =?utf-8?B?SUN0QUFDb281ckxKSlY4d2dyejZSazh6RkFNUkYvbmZhWWRDR3JXMHViN04x?=
 =?utf-8?B?U3hvaVJlYnhYTlNRTjRFM0QwdThNanZuNVdEVWt6OGlQMXgyVFRvT1Qya0Ux?=
 =?utf-8?B?WmNmM3B0N1hCTzN3MkdwNTJLVm0xcldIeEExR2QzYytPakdreDNoVnVMRGlK?=
 =?utf-8?B?UGwxeEdyODlJL0xmRm8rN1R3OGhjZVFidGRWN1ZXK0QxYzZLMTFZQUFpM1J5?=
 =?utf-8?B?WEtkVms5Z0cyUkdsRVdpRXNCY2c2NVVMZ0xyR1hKV1h2aXJrcks2SThFdGtT?=
 =?utf-8?B?bmR0MS9IV0RrT0YzYjhEQStyVllGcDRJcmVvdnpHK2pocy9OMWUvQ21BWWg2?=
 =?utf-8?B?SFBKNkJHOHB4S0dUOXRVbjhOWWs4cFp4dm1JbzNSV2RmRTFHV2lRRkNmYk1L?=
 =?utf-8?B?U2I0bFFwbGFJdWhLcGN1UTN4L3FXZjEwcFRwWUVIS0JKNWhpdkdsZGVxU0NV?=
 =?utf-8?B?NHBPb2crVWtRdHBoQWh6ODA5ZzRQMzdibm4zNThHaWlOMHIzNjloeTM4QUdy?=
 =?utf-8?B?RnB3bHFKMGJJSkFOaGhRd3lrbmlaMDZYTGRMQm5zNlpva3V2QjY5UTd3MzRu?=
 =?utf-8?B?NWJyV0dpd2JEdmp2N3RaMWR5c0JKMStyUFpTSWc5RURjamtSZk8rOUhJdVBS?=
 =?utf-8?B?TFFTMGhGUmFMUjFpQXBtZVIyTTJYQnM0SVJwWFBQNXNKaG5aTVpnTVRINkxt?=
 =?utf-8?B?NTN5RkswbnFPWE85RmJpMnZDUW94UnB6L2xPT2c5RGFZNTE3ZTJKRHVveEl5?=
 =?utf-8?B?UFQ4eDMySHhWNlFjNTRnb0lkUkxlZnJiS2c5NVB1ejN2aDdpL0RaTUZtSUJr?=
 =?utf-8?Q?RBsKMnmlTyTzVgXYRGlbsDrXZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 206a5187-6cc0-46aa-fc20-08dd2fea96cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 13:44:35.6405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGpTsvciDsz109PvP329EZger7N9wD/L4I+DZSvPVZfgoIrXE3pQdjngTlBcNPuK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7521
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

Am 08.01.25 um 14:23 schrieb Jason Gunthorpe:
> On Wed, Jan 08, 2025 at 09:01:46AM +0100, Christian König wrote:
>> Am 07.01.25 um 15:27 schrieb Xu Yilun:
>>> Introduce a new API for dma-buf importer, also add a dma_buf_ops
>>> callback for dma-buf exporter. This API is for subsystem importers who
>>> map the dma-buf to some user defined address space, e.g. for IOMMUFD to
>>> map the dma-buf to userspace IOVA via IOMMU page table, or for KVM to
>>> map the dma-buf to GPA via KVM MMU (e.g. EPT).
>>>
>>> Currently dma-buf is only used to get DMA address for device's default
>>> domain by using kernel DMA APIs. But for these new use-cases, importers
>>> only need the pfn of the dma-buf resource to build their own mapping
>>> tables.
>> As far as I can see I have to fundamentally reject this whole approach.
>>
>> It's intentional DMA-buf design that we don't expose struct pages nor PFNs
>> to the importer. Essentially DMA-buf only transports DMA addresses.
>>
>> In other words the mapping is done by the exporter and *not* the importer.
>>
>> What we certainly can do is to annotate those DMA addresses to a better
>> specify in which domain they are applicable, e.g. if they are PCIe bus
>> addresses or some inter device bus addresses etc...
>>
>> But moving the functionality to map the pages/PFNs to DMA addresses into the
>> importer is an absolutely clear NO-GO.
> Oh?
>
> Having the importer do the mapping is the correct way to operate the
> DMA API and the new API that Leon has built to fix the scatterlist
> abuse in dmabuf relies on importer mapping as part of it's
> construction.

Exactly on that I strongly disagree on.

DMA-buf works by providing DMA addresses the importer can work with and 
*NOT* the underlying location of the buffer.

> Why on earth do you want the exporter to map?

Because the exporter owns the exported buffer and only the exporter 
knows to how correctly access it.

> That is completely backwards and unworkable in many cases. The disfunctional P2P support
> in dmabuf is like that principally because of this.

No, that is exactly what we need.

Using the scatterlist to transport the DMA addresses was clearly a 
mistake, but providing the DMA addresses by the exporter has proved many 
times to be the right approach.

Keep in mind that the exported buffer is not necessary memory, but can 
also be MMIO or stuff which is only accessible through address space 
windows where you can't create a PFN nor struct page for.

> That said, I don't think get_pfn() is an especially good interface,
> but we will need to come with something that passes the physical pfn
> out.

No, physical pfn is absolutely not a good way of passing the location of 
data around because it is limited to what the CPU sees as address space.

We have use cases where DMA-buf transports the location of CPU invisible 
data which only the involved devices can see.

Regards,
Christian.

>
> Jason

