Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B717AE26CB
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 03:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE0010E25D;
	Sat, 21 Jun 2025 01:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JgRVYB8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA6810E25D
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jun 2025 01:07:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLHJkVZgB4ci2Tkl6L7UhsG4e0oBhTU00wTdIn1XVb2Nm0sDm5NP5ne+cwAVNW/NU/iU4agGwwinXhz+yOAuJdgJExdKchR7NP5UIA5RpR1eiMozHU+PZ/0+r6XqKH6mw5Lod7+zjE0fattijWjvU3K7lHB2qJ63MBwpjQ7AQF3+K7DSNib8zs0OmMR+kwi1/a+YnS8LtP2yDPbA7/xTrj0+WFxDZgWtdhBpS1RY9jh8jLxtncP7cs21NrYB8TzhkDIi2HFkxtkFIa7jSVojl6Baznre4xVQTn5AzNJTfGsAZ7hSX/954GV++qhQSNSc1w1vRQakAgY7TPhoVAOKYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjTGrj8sZTiCMkqC1H0eEpPIgJLDeA67/gTAEzKHtPI=;
 b=wIhKIbYmpXiHhvtoLqpaLXhDOcpwseh9EXutWMMN6BS4uxYOP/ZNYaChlIkPdyl86gSPwHgVmJqMncuAUIXBq7FOLLwUhvcHttUFnYxs3sZfC0yGh5hW6/Iqgf6MMO3BKs8z5/N/Xad7SFLrzIUMLjP7ud+JmN5K5ccaM7Vxykua9MKtafsmCpSC5XCNW8/CP8MSFjCU4QL0HsAeLvHYcHpLvi6RTdQSgMirBZ/HNMn2zLiZhaiZ1OSNH0Fyt1aqwl7cXi+mHeJFG1NLj57HWik3XFLAiLitFgW1ynnnKB8AJBGG/3lPZhSXwVS+X505/ONFt1n3y79vXVg0Udr9Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjTGrj8sZTiCMkqC1H0eEpPIgJLDeA67/gTAEzKHtPI=;
 b=JgRVYB8KTxaJzhWlUweMmdDjaBLSlg0G7eonXlLArEOd5sX5qf4XjofUM8L7wmxKfX3eym1YNDDvVg+TIxSznyCs6VPWOIA8V2PxeOTRwWHT37I7nkMnGhtye7lf7AnYgC1oz6ZY73yCgoEWS+KgG1myVbRAvHc/asCB4HeKUhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by IA4PR12MB9811.namprd12.prod.outlook.com (2603:10b6:208:54e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Sat, 21 Jun
 2025 01:07:34 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::1e6b:ca8b:7715:6fee]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::1e6b:ca8b:7715:6fee%7]) with mapi id 15.20.8857.019; Sat, 21 Jun 2025
 01:07:33 +0000
Message-ID: <f5958bda-838a-4ed6-84c6-fef62cd0b28f@amd.com>
Date: Sat, 21 Jun 2025 11:07:24 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 00/30] Host side (KVM/VFIO/IOMMUFD) support for TDISP
 using TSM
From: Alexey Kardashevskiy <aik@amd.com>
To: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, pbonzini@redhat.com,
 seanjc@google.com, alex.williamson@redhat.com, jgg@nvidia.com,
 dan.j.williams@intel.com, linux-coco@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, tao1.su@intel.com,
 linux-pci@vger.kernel.org, zhiw@nvidia.com, simona.vetter@ffwll.ch,
 shameerali.kolothum.thodi@huawei.com, aneesh.kumar@kernel.org,
 iommu@lists.linux.dev, kevin.tian@intel.com
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <e886855f-25cc-4274-9f11-fe0e5b025284@amd.com>
Content-Language: en-US
In-Reply-To: <e886855f-25cc-4274-9f11-fe0e5b025284@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY6PR01CA0044.ausprd01.prod.outlook.com
 (2603:10c6:10:e9::13) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|IA4PR12MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: a4146cf4-8f6f-4881-9310-08ddb06000e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d29FblVqSmVKMktaSEthOUNvSW5neFZmeHF5aHdXdFZqWnBaM085UG4xUjE4?=
 =?utf-8?B?c21OWE1zT201MndCdDV3SGNnTENXS1pzQ2ZCU3FReGZRbGlVQURLZVhLeFZU?=
 =?utf-8?B?VjNhZW9uSTlRQVpTdmdKMVR4by9oQVVtTDNrb1g4dXhrQW8vQ2xVSTR4QTdy?=
 =?utf-8?B?ckQ1WHNnSlVDWjRSMXdoTHRFMmlRbyt2dytJRTVRa1A2anMxb3ZCVnhMRXdW?=
 =?utf-8?B?aFJIY2I3djhvMFNRL1JvRGRjZ0wxSW0xRXpNZFMxeitLWFdUUm1iWVRxZFky?=
 =?utf-8?B?QzR2TUhtMjhDaGJoVkJJMEt2c2kyV1VWU2xhR0lEcE9uTDVXcUJLOS9zUC9U?=
 =?utf-8?B?TXkwb1ZLRjJwYVR0d20rdzVCOHlJTUhUb3hiWVpIa3ZQMlBycTdLRng1amdn?=
 =?utf-8?B?dUJYTm5GVWlQUThVUHcvZUhSYnY4aEdhampCK1h3UEN4dXBsVlBWMytOYzhJ?=
 =?utf-8?B?TEtGamY0RXpTZ2dPeG5ZSS9Kcng3bEZ0dHF0NS9ma2FNemtrNUtvaGNFeTBq?=
 =?utf-8?B?bVBNSVRPZENFc3VqNGI4bkUvenN1R21MTkZaZGQzYVdTOEkxZXVkbmVsM25W?=
 =?utf-8?B?bnl6T205cXltWUdvYlkwTC9EbnpDZlpHdE9OWWtyVUxMTTJFVVNWcXQ3Rmd5?=
 =?utf-8?B?elpqZkp4aFNDSVdPZ2JzekN2bW93OXR4V3RVZlRncnJNbWFsUXJEUE5kNlJx?=
 =?utf-8?B?QmgyQmJFYzU5SmlsOERvbktnODdxWFdvQmJKUnIrYTMwK0Y4OTJ4enBKdHVB?=
 =?utf-8?B?Q2NwYmsrTzZYbjhYTElGWFdLU2VZTkNqWjNBOXRodVVhMGYyOUFBTXNYMVlt?=
 =?utf-8?B?TkFCSUZ1bDdUWktuZlBhQS9FQVpuNlg4UmdVN0NjSytlamVvK3NOclcxMy9Y?=
 =?utf-8?B?NmJvNFZJaWlQckt5TDdLVlNKa3dEaEI2dkozcnFIOEViUm5yV090LzZuUnh3?=
 =?utf-8?B?RTM4QXlwVzVlcy9CZWF0aFhURnAwU3A4dEZzWkxVRDcwNStLclBFa0pVTjJL?=
 =?utf-8?B?Wms4aTVrc3llRnhpUGJsWkprOE5LaHFXZElnZklCTlh3Vkg1SG45N0c1cEZS?=
 =?utf-8?B?eFZXcEhhallpeWhCUzdvSU00ZTU3ODcvWkFTSFlGWXoyNGQzVVRUdlRmL29M?=
 =?utf-8?B?VENFcGxXZTh4NldsWmdlRi9FQlcxNjVKSUhDdG5NQzhwNVdBOXloRGZlVjBl?=
 =?utf-8?B?b21ObGlzODFvVzgrd3k3WW5BRHdrcmViTmo1UkV2OEJ3bjlTS1lVWHFaMHpj?=
 =?utf-8?B?YnFDcWUzOWpQVmFSZmVpNWtQMnBmNEtsd29HcFNDdW5FazZITVdlNi9SWDJ6?=
 =?utf-8?B?NWdGZnpHZ2MrN0ZlQ21lbTRvOFFSU2ZKb1YvUFdyQ3E4YUdOUnlnQ3dRbC91?=
 =?utf-8?B?ckFXNjdNektDV0JqQWpHaW1WeHA3Rk9tNTdNOXdUKzZTb2gvRS9UVHA0ZU85?=
 =?utf-8?B?LzZSSDJ6Z0V6TzU2YlpQUml6N0N3MHB6emhGVXJQZGN2Y0JBMEdmMFZUM0s4?=
 =?utf-8?B?SVFhUk1PMVhiWHpOd0hJNkFHcStaYkg5WUN4QWV5RStDSjg5U2JZcHBxMHZz?=
 =?utf-8?B?Tk5TZGpiaHJvNGRCUVpCVmdjSVhLMWZIdFJ4SHdwRjlGUXBoVklSTUErRWRs?=
 =?utf-8?B?ZzBIQTRQbTB0S2pNaldnMUFDR00rMlF5ZUNGQzhjSXBsa1g3QXNHQk9Tc1JP?=
 =?utf-8?B?dXJFNmQzUXBkOG14WmFVOUlTaEdCcTZpNWpxcHQycDEyTFVZelJjRFp4a09Q?=
 =?utf-8?B?QlhFTThJc2UzdFpTREYxYkwvZTg4N1JaTFl3SG9ISnh5VkhzZ3hzb2NKUlpt?=
 =?utf-8?B?dDN1ZnpnRVI4V1FoblpEaUluMUt0ZzN5eDNBaDNuc01qTHVFRW9iNGE4Y3pp?=
 =?utf-8?B?RUFtcllOTml4U3UzUmo2Y09Xb25NMkhkRkozMktXSExWWC9KWFRXY2NJclNK?=
 =?utf-8?B?dnNQbFl0RDA3WURSbUx2d1RSY3hEOVY4L1BLZWNjcWFoQkp2TDAwQUhqSmN6?=
 =?utf-8?Q?p/CxmS7yxKCDegJtG0YyrsnNmtyeWs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU1xOUV4dWg3WjM1TVd6clgzR1ZldkMrUE1sWFVkKzBQYUc1M1FteWhlZjVV?=
 =?utf-8?B?TE5qQTRLWWxMWjVaN01USi9maW8xYXRoOCtMWGpab0sxQ0NmbWZJbjBrb1Az?=
 =?utf-8?B?NzFnTUorZXJrdG0xaXhTcFloVTBTRVU2cTJ1em1vQ1dwMmVzVWIrTFVQWllT?=
 =?utf-8?B?d29oSHZ0SzJxYk5mNWlCcTdtejc2UzB1UWdObGlNdVZPVkZmNkludHdRak94?=
 =?utf-8?B?N3h2bm9YTWFhTUF5QVJNZTNzUWFDclk5U0tmTStjQ2xzNytaSnpjWlZXU1RM?=
 =?utf-8?B?Ky8zTFVUei9IaHBhb3dqVUVqbU4wb3htcVNxSUk5TkE0N1BHdlFhL1llWjRO?=
 =?utf-8?B?NkhjM0tLMjJmVkxKYnNDS084M0EyTVRyb1d2Vm5oZG9YNDdhZ3RzaVF5ZCsv?=
 =?utf-8?B?RERJTGlMUENQUHZYak9FcEZsOG1uRkhlNGdhUjVEd0diZDhvWis2SkdKUGJZ?=
 =?utf-8?B?d295c1FUViswUXFRb25EcHBrVXFnR0ZDOUsyTDI3RndqZWMraHo4TGdQdUIy?=
 =?utf-8?B?dVNSVXhWc2E2OHlNNUxCQmlWcHVQZGJIMEQvSlZac1JiNDVxV2dHZzJ3Yi9x?=
 =?utf-8?B?SGFLM0RuU1BoRnhkR3dnVzd4SGZrczR0V2ZwZEJDK0VNaDgrc0kxbVcyUnRK?=
 =?utf-8?B?d1FSdnVhcTh2M3RNZWxiNjZjYVorcm1oVUVjd01FUUNHNzVkc09hN0ttVGZo?=
 =?utf-8?B?R2duVTRLKzNsVnVRcHNMYlhPRGtUZU4ycFYzcjUrNWJFUUQzQzlTZUJBT09Q?=
 =?utf-8?B?TVo5cU1jTGFiUDU0YkpZc1A0b054TEp2QVZrNGZJSnZVM1Qwem82R0hjNUJM?=
 =?utf-8?B?WnRsTlhUdTJyMmRWaDVUZGsraW1xUVNmM3Q2VmFaNVlib2xRaldUbHZxYVI1?=
 =?utf-8?B?Y1ovekpTMHFTdnpna0docFpTeGtWM0MrWmU1TTJqdWx5YThZTnZHYncvb3lV?=
 =?utf-8?B?QWZPSzVvYUJZVnpraEVURUZpOTFXd1M4R0RyYk12RXFxUmhyK1dDM0RENzlU?=
 =?utf-8?B?VlpYdUJKWGpRSEtYUXZvV0RCMzdDLzN5UWRnVzZvZGdqU2VEUS9LNTZYaXJD?=
 =?utf-8?B?MGJ1Q3RKWVhLZmRpS09TZC9pbkhQYnN3RnNqS0NTMTdsMjFneHNMS0d6TEMv?=
 =?utf-8?B?RG1mcEZtOGxta3BaNDJGWkUyaHk3VHlYakZFRXRDVGJKQjNIS0hRdkZSaUdX?=
 =?utf-8?B?bjZQdS96bXUwNEZFMkdqbmU4OTNyOC9xWWRXTlp1WCsyVjFSNUVMWkdQT2Fw?=
 =?utf-8?B?czZMOGlHWkJpcEZSVTVkREZsSnFEODhKM2hPRFc4YTNjVDh2cldKdGJYcGxo?=
 =?utf-8?B?OTlDaFJtQ1pUTktJOFdxbTcwNnFQd3FyNXlZNUhCbHhsNGNKYllXSWhrVnZv?=
 =?utf-8?B?dWNYS3hvcUlkSzZ3OXdMZFJuZm9kQlVFTGRpS2R1bVE1WnJkZE9SUTR3cVhJ?=
 =?utf-8?B?NDFSV01oODJKaGtGNjZIM2pMN1BJMmtvem1IZDVaYlVRbzhRekcrQjUxV25v?=
 =?utf-8?B?Zy9OeU1VUmUrUnEzMTZSRVNTWjd4VnA3MEIzU0YrVnl6Sm1VK2dLdTFBeUFv?=
 =?utf-8?B?ZVdHSmV2SDNKZFdkRHlCbTB3VUxYbXdkUFlab3hSZmJJTHFDVU1FWE5veXB1?=
 =?utf-8?B?MEdvd3dUbnlLSXByZ21wWmR4eEdWQTJyelFkVkVEcHpOb1Y5bmRIRS9DMWtm?=
 =?utf-8?B?UzIzZlhxU0FHOWozUi85dm5QYWFiQ2swZWRpMmxrQlFCSHcyM0dmU3ZCUjFp?=
 =?utf-8?B?NEtOQy9sZWxwR1ZFZUNETkpxNkZnd3UrMEpZTDd5TXpQazRGSXp5em9lQlph?=
 =?utf-8?B?TWxlNHRrVjZoTXovNDRyei9peW5Ualk0RGtlOGJybG50UUlEZlY3RjdTbk9C?=
 =?utf-8?B?em1Hb3Nla0cwaVY4bi9Xc29WSlZneklCSXgvbm9VaWNaT0QxSm05MjNaWHVa?=
 =?utf-8?B?akwySGJNT0xMa29uVHFiVlg1eE92Vis0eTUvWno3NEt5WnMxT1gzUE1XN2Ro?=
 =?utf-8?B?eEtkakF3M1YwZFQvU2JSWTZHRkQ5UVh5OXh6d1ZUZEhZVm94bHhJK0dGS2t3?=
 =?utf-8?B?NnJ0Qmcya3NUcVdXZFArUUE5a2R3bmFtNEFWdjBhZFRWdTZSVHRFdC9qU1pz?=
 =?utf-8?Q?YT4TkrniqZNOgoMWZYn+1vslE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4146cf4-8f6f-4881-9310-08ddb06000e8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 01:07:33.7513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlohPfUHUx4fL0mOV4b0eE9OiwyjuncljNruBm+v8LKWEsVqnt47TagNC5i3y9/4lpm9KiLu0abVpjHiWQMnqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9811
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



On 11/6/25 11:55, Alexey Kardashevskiy wrote:
> Hi,
> 
> Is there a QEMU tree using this somewhere?

Ping? Thanks,


> Also it would be nice to have this tree pushed somewhere, saves time. Thanks,



> 
> 
> 
> On 29/5/25 15:34, Xu Yilun wrote:
>> This series is the generic host side (KVM/VFIO/IOMMUFD) support for the
>> whole life cycle of private device assignment. It follows the
>> previously discussed flow chart [1], aim to better illustrate the
>> overall flow of private device assignment, find out and narrow down the
>> gaps of different vendors, and reach some common directions.
>>
>> This series is based on Dan's Core TSM infrastructure series [2].  To
>> give a clear overview of what components are needed, it also includes
>> some existing WIP patchsets in community.
>>
>> This series has 3 sections:
>>
>> Patch 1 - 11 deal with the private MMIO mapping in KVM MMU via DMABUF.
>> Leverage Jason & Vivek's latest VFIO dmabuf series [3], see Patch 2 - 4.
>> The concern for get_pfn() kAPI [4] is not addressed so are marked as
>> HACK, will investigate later.
>>
>> Patch 12 - 22 is about TSM Bind/Unbind/Guest request management in VFIO
>> & IOMMUFD. Picks some of Shameer's patch in [5], see Patch 12 & 14.
>>
>> Patch 23 - 30 is a solution to meet the TDX specific sequence
>> enforcement on various device Unbind cases, including converting device
>> back to shared, hot unplug, TD destroy. Start with a tdx_tsm driver
>> prototype and finally implement the Unbind enforcement inside the
>> driver. To be honest it is still awkward to me, but I need help.
>>
>> This series don't include the VMEXIT handle for GHCI/GHCB calls for
>> Bind/Unbind/Guest request, cause it involves vendor specific code. The
>> general idea is KVM should just pass these calls to QEMU, QEMU parses
>> out the command and call the newly introduced VFIO/IOMMUFD IOCTLs.
>>
>> With additional TDX Connect specific patches (not published), passed
>> engineering test for trusted DMA in TD.
>>
>> [1]: https://lore.kernel.org/all/aCYsNSFQJZzHVOFI@yilunxu-OptiPlex-7050/
>> [2]: https://lore.kernel.org/all/20250516054732.2055093-1-dan.j.williams@intel.com/
>> [3]: https://lore.kernel.org/kvm/20250307052248.405803-1-vivek.kasireddy@intel.com/
>> [4]: https://lore.kernel.org/all/20250107142719.179636-1-yilun.xu@linux.intel.com/
>> [5]: https://lore.kernel.org/all/20250319173202.78988-3-shameerali.kolothum.thodi@huawei.com/
>> > Alexey Kardashevskiy (1):
>>    iommufd/vdevice: Add TSM Guest request uAPI
>>
>> Dan Williams (2):
>>    coco/tdx_tsm: Introduce a "tdx" subsystem and "tsm" device
>>    coco/tdx_tsm: TEE Security Manager driver for TDX
>>
>> Shameer Kolothum (2):
>>    iommufd/device: Associate a kvm pointer to iommufd_device
>>    iommu/arm-smmu-v3-iommufd: Pass in kvm pointer to viommu_alloc
>>
>> Vivek Kasireddy (3):
>>    vfio: Export vfio device get and put registration helpers
>>    vfio/pci: Share the core device pointer while invoking feature
>>      functions
>>    vfio/pci: Allow MMIO regions to be exported through dma-buf
>>
>> Wu Hao (1):
>>    coco/tdx_tsm: Add connect()/disconnect() handlers prototype
>>
>> Xu Yilun (21):
>>    HACK: dma-buf: Introduce dma_buf_get_pfn_unlocked() kAPI
>>    fixup! vfio/pci: fix dma-buf revoke typo on reset
>>    HACK: vfio/pci: Support get_pfn() callback for dma-buf
>>    KVM: Support vfio_dmabuf backed MMIO region
>>    KVM: x86/mmu: Handle page fault for vfio_dmabuf backed MMIO
>>    KVM: x86/mmu: Handle page fault for private MMIO
>>    vfio/pci: Export vfio dma-buf specific info for importers
>>    KVM: vfio_dmabuf: Fetch VFIO specific dma-buf data for sanity check
>>    fixup! iommufd/selftest: Sync iommufd_device_bind() change to selftest
>>    fixup: iommu/selftest: Sync .viommu_alloc() change to selftest
>>    iommufd/viommu: track the kvm pointer & its refcount in viommu core
>>    iommufd/device: Add TSM Bind/Unbind for TIO support
>>    iommufd/viommu: Add trusted IOMMU configuration handlers for vdev
>>    vfio/pci: Add TSM TDI bind/unbind IOCTLs for TEE-IO support
>>    vfio/pci: Do TSM Unbind before zapping bars
>>    fixup! PCI/TSM: Change the guest request type definition
>>    coco/tdx_tsm: Add bind()/unbind()/guest_req() handlers prototype
>>    PCI/TSM: Add PCI driver callbacks to handle TSM requirements
>>    vfio/pci: Implement TSM handlers for MMIO
>>    iommufd/vdevice: Implement TSM handlers for trusted DMA
>>    coco/tdx_tsm: Manage TDX Module enforced operation sequences for
>>      Unbind
>>
>>   Documentation/virt/kvm/api.rst                |   7 +
>>   arch/x86/Kconfig                              |   1 +
>>   arch/x86/kvm/mmu/mmu.c                        |  25 +-
>>   drivers/dma-buf/dma-buf.c                     |  87 +++-
>>   .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |   1 +
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   1 +
>>   drivers/iommu/iommufd/device.c                |  89 +++-
>>   drivers/iommu/iommufd/iommufd_private.h       |  10 +
>>   drivers/iommu/iommufd/main.c                  |   3 +
>>   drivers/iommu/iommufd/selftest.c              |   3 +-
>>   drivers/iommu/iommufd/viommu.c                | 202 ++++++++-
>>   drivers/vfio/iommufd.c                        |  24 +-
>>   drivers/vfio/pci/Makefile                     |   1 +
>>   drivers/vfio/pci/vfio_pci.c                   |   1 +
>>   drivers/vfio/pci/vfio_pci_config.c            |  26 +-
>>   drivers/vfio/pci/vfio_pci_core.c              | 161 ++++++-
>>   drivers/vfio/pci/vfio_pci_dmabuf.c            | 411 ++++++++++++++++++
>>   drivers/vfio/pci/vfio_pci_priv.h              |  26 ++
>>   drivers/vfio/vfio_main.c                      |   2 +
>>   drivers/virt/coco/host/Kconfig                |  10 +
>>   drivers/virt/coco/host/Makefile               |   3 +
>>   drivers/virt/coco/host/tdx_tsm.c              | 328 ++++++++++++++
>>   drivers/virt/coco/host/tdx_tsm_bus.c          |  70 +++
>>   include/linux/dma-buf.h                       |  13 +
>>   include/linux/iommu.h                         |   4 +-
>>   include/linux/iommufd.h                       |  12 +-
>>   include/linux/kvm_host.h                      |  25 +-
>>   include/linux/pci-tsm.h                       |  19 +-
>>   include/linux/pci.h                           |   3 +
>>   include/linux/tdx_tsm_bus.h                   |  17 +
>>   include/linux/vfio.h                          |  27 ++
>>   include/linux/vfio_pci_core.h                 |   3 +
>>   include/uapi/linux/iommufd.h                  |  36 ++
>>   include/uapi/linux/kvm.h                      |   1 +
>>   include/uapi/linux/vfio.h                     |  67 +++
>>   virt/kvm/Kconfig                              |   6 +
>>   virt/kvm/Makefile.kvm                         |   1 +
>>   virt/kvm/kvm_main.c                           |  32 +-
>>   virt/kvm/kvm_mm.h                             |  19 +
>>   virt/kvm/vfio_dmabuf.c                        | 151 +++++++
>>   40 files changed, 1868 insertions(+), 60 deletions(-)
>>   create mode 100644 drivers/vfio/pci/vfio_pci_dmabuf.c
>>   create mode 100644 drivers/virt/coco/host/tdx_tsm.c
>>   create mode 100644 drivers/virt/coco/host/tdx_tsm_bus.c
>>   create mode 100644 include/linux/tdx_tsm_bus.h
>>   create mode 100644 virt/kvm/vfio_dmabuf.c
>>
>>
>> base-commit: 88c473f04098a0f5ac6fbaceaad2daa842006b6a
> 

-- 
Alexey

