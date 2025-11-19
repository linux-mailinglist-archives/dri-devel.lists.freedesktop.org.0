Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A096CC6EF68
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 14:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C0710E612;
	Wed, 19 Nov 2025 13:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TqBsS4Dm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013011.outbound.protection.outlook.com
 [40.107.201.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2435010E612
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 13:42:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4KkTQhpqe4foZiXRMgQ1qPpQ8WSmEG45j/+7kQ+WFQlsl44bWRxeVsJjhg4RfwC9UYd/kmeTgQqKfuR4FB602esweSc/Fis6gtkODsQjP+NIw7Nm4F1NiMUS4w2cUXiDBigK6WeaS+7D+NgXoUOyWsjuzYPgoJSpXTq5ziRLPX2oTHDsxUNotLXOzXcrXANjeukOxMQF8J/koV64r/5EPYewELYE4ZbKGbiBYsxwz60NfcMzM0b6pUCI9VXHG9tMheNF8QiFkX83TdM1KV14J461XX/C5HOwyDS35Vb6MtfW90dRpKZMs9Sdg4rClVDmRt6xfxuOl5aQWmeXl1OPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SptarLRnYfOUYk/a5WuNCuLi6/HVNG04w/Ch2ewNJbo=;
 b=doZRYZmPfRVlzdJ49xCsMgKAVC5gDygQokkt46Yxtl6XaxMFN7zLU4ptanMlY3diipQOx+0j5txuK0p05p1nSywBPw1Q8jw4udWaplRWdV26knhvOKUm+eNdP13xbc411nf7hBh6SqfPdZbIz30YvE/Sd8//3QG/SYMwp4mE+PmnpYVgD/A/uHMKaKubt0gUm8UQYPnqZjbGUWEpAVu7tdykkLmny3lUkt0t7lI9gZo8huNf83VyUzjbjs8sUDPxzoVLCOxbsvd6RvjVYOznQLyO6dnNjS36duC3nFWmyzAAWLekrAt27+ScnNpYHzQTbaHw2s5dOhVsiNrQZ4rG+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SptarLRnYfOUYk/a5WuNCuLi6/HVNG04w/Ch2ewNJbo=;
 b=TqBsS4DmIveBZVrzRcayuh34qNImR4fcHl2XYU/Ay7q9MudKKkqNQulk3la6OF4HlcQxm8I78IUvnqpAvr2NosRUJW5nPedeSqzvmTGXqLdnLscXEmy/A1Q0+MIELY2BZH3B0fOSRht9HR/PetP3xJETaSDzBe5t2VolT1lsCl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7707.namprd12.prod.outlook.com (2603:10b6:930:86::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 13:42:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 13:42:27 +0000
Message-ID: <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>
Date: Wed, 19 Nov 2025 14:42:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v8 06/11] dma-buf: provide phys_vec to
 scatter-gather mapping routine
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org, linux-hardening@vger.kernel.org,
 Alex Mastro <amastro@fb.com>, Nicolin Chen <nicolinc@nvidia.com>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119132511.GK17968@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251119132511.GK17968@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0277.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: d372d7d3-50d7-4ef1-6dc0-08de27717a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTZITFozNlQvUGtmdHFYYTJ1VUM2NnRJUXdqOW43d01JZXZBOS9SMWtoRUtV?=
 =?utf-8?B?YWt2aG8wdThSVFpKOUJ3VUlva3I4akg5aG4rdk1wL2pyV3d5Tlo3R1RpamVw?=
 =?utf-8?B?RFVXNTZEeld3amZ1Y0hNN3A4bmtpYlZZRTFTVEJDaktPcGd2N1pPME12V0JR?=
 =?utf-8?B?SWRvclpGdnQ3VG8zK1ZlaUxWTEo5ME45TDZ1dmpzOGV4bUZCOGsrTlNpbHRK?=
 =?utf-8?B?Q0ZnM2xTVXhNMVNiUVpjdktHNXB2akxtOGI2VFJuSTg1bWN2Nlc1N2tlYjZ2?=
 =?utf-8?B?dGxLVzRjai9mVlNMOGgrb0podzRtRlRpS1NRVWQza2hCZFpTejVzRGo4VnpP?=
 =?utf-8?B?cThDc3VQaCtlb25wSmdGTnVHelc4L2xMdkw0bm1HNHlsNWoyWlZoaG9XMVVv?=
 =?utf-8?B?aFMwYWJmb1VHMWl5WXZSTGlJcko4dW9vY2FmbmFDdDVwLzYxeUlCNzdBcWNq?=
 =?utf-8?B?dEJUdVo3SWJveSs3eHZXUHZ0Yldocm84R1hEcEw0eUw1YnplY1dTQ051MC82?=
 =?utf-8?B?Yk92QlRES3MrK1ZQUWxvblgyQWdURkl2RVpHaUFZUkd4MmloYkFjNDU2cjBs?=
 =?utf-8?B?bWUweEFmQXdyMngwMFpuQjRYdlU1Q2k1M2NDSzB6Zk9kYlZkN3U4L2RTRzQ0?=
 =?utf-8?B?WXdRVkZNdStLaFB1M2loVFRDVTNHRG0wUWowSHhmM1Jock1LUzI4YVMyZmVN?=
 =?utf-8?B?V3h1c2FWYXExN1FxWDZtR3Z5MTdMVW9PWGd4M3oxc0wxOWsvbFkvQWN1RDJD?=
 =?utf-8?B?b1o2Y3hGZjNCQjM0VGY5eHpTRjRvUmR4QkFVMTkycmk5d05EK1VCNC9mWUpQ?=
 =?utf-8?B?VWJnYXdWT2FDUzJTVHowSEVSYzlrdU1XanZ5M1NxcmtiSWZMRDl4eU1qeGJp?=
 =?utf-8?B?THdQcXMxdmswejNOZVlQZWo0VHRDR1daZHR5bkFOVFJlMm1DaDFKenkvc1Ev?=
 =?utf-8?B?R2FGdVIxRERBeE1qZmQ3VWJxVE1PMmdUVmNURUM1akxBUUJhUi9jaFVLeDhm?=
 =?utf-8?B?RHlQOGVMUGRHVlNLWEw4bUtuSVRCZUVqVzg5UnU1YVAwUG44aUNlMWlGQm51?=
 =?utf-8?B?UWI3R3h6aXUreEhHRi8veVFDODM1ZW83MTVCMHJKVlBsT01vQjZzUDVyNjdu?=
 =?utf-8?B?U2JzRkZkMVoyRmxNd2tBcnd6bWZ0V1pqR2JnRE43WFEyYVViMmNmbGwxK1Ix?=
 =?utf-8?B?MzhvcUxua3pxTnROSDJkMno2Q2hEdkE0V2dYNjU3ZUt3N2R2UDkvS2Yrd0lr?=
 =?utf-8?B?bFo1enRHWmx3MDhhRlFuL3J6dFBXZTZ1aEFKVS82aDVMYmh0clBxMlJTQU1q?=
 =?utf-8?B?YWJ6bHB3MHRHcGV5dFpiVGJoUzN2TEsrQ3NFNU9CdGYvd3FnQmFtL3RrcTBs?=
 =?utf-8?B?MnpaSk1lUDlDZnNzbGdoYXBtK09nMnJibUFMVzZrQlQ0Y1NCSHNRN1JGQ0Nq?=
 =?utf-8?B?TzRtcXdYRmNUY3NNTjlzRStpY0krMHNSUWpCSHcxZDdka0w0V1BVRlFZY0tB?=
 =?utf-8?B?bHAyQm4zUElqclVPbDFUZ2Y2M05SZzd5VDlLNTdjeDl3cWRPTGJQUFI2OHIr?=
 =?utf-8?B?MlMrWlFvV25pbndhb29rYUJ1KzFzMXdiOTdmYTd5SUwwd002aFRLQytHQXFH?=
 =?utf-8?B?KzdoaUltaS9SOE80S2dmM0lTWm16VDRDQ0JsZzNSQmNMVFQ3K2NxNTlrY0NB?=
 =?utf-8?B?dHVaQ01UYkxuczcvN1MrSkFBYkk2QTNiRTFOL2orL2gvdmpYV2g2bUgrTVdK?=
 =?utf-8?B?Qld4alZXOFZUSmY0TnYyN0J2SnJYQWlaQ3J1RVRlbzRDaGhaajdBRkNNOXNk?=
 =?utf-8?B?cTJGbmo4VlFvNUVWaVRmWjFVQ1h1d1ZFTVVnUFZVK0RCT3hmTmlkNnAzL2Yv?=
 =?utf-8?B?NVorNENEUElrOGVzWngwVUlTUTZ0WEZRcWtERnpldkVSWFExRy9wVzc1bUhs?=
 =?utf-8?Q?aASJ0lv2paih8o9t6+ukh6+LNt9vE+Su?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUc2Q2xCNStNcUxxWGtHb2lGazJYVnVpZUI5QW55UTBHcmw1V2xabW5mWFh3?=
 =?utf-8?B?Zmc0TXBsdmwwdmQ1V1N2MUZEM3hnbUltenV6V2dpdU8wWlJaaXFPVTBCMHhl?=
 =?utf-8?B?SDhDZFJacFU5Vk9aaDRBbERKRmN5Rlk4TVJpWEgrMnNPRXRlckJGZGVVM0tW?=
 =?utf-8?B?Ym9KelJzUDBnUGdFc2c2TFdNK21xYWRDMzhOUFBtWlRzN2s3aURxNUkyengv?=
 =?utf-8?B?aFNGYlNvUlQ2SUh5Ynd3YzZWSzhpODRoUHNFQTE4UUZDV2tUZll1MFlJNVZL?=
 =?utf-8?B?NkdqcjhBTVpyUjNtRXpPOFR4Q0Fzdm1jQk5BUTQxdFFHM0wzR1g3QjVrOTUx?=
 =?utf-8?B?Y3dydmRIZEZYWW1NM0htMjBCVkt1bUwzVmJDeHBLd0owMEdWZWZoT3F4SS9G?=
 =?utf-8?B?VmJXQm9STUhTaVVIOU9waUhGYVFrRjFEcDBwLy8xNSthd3JDZ0dnc0RJUEF6?=
 =?utf-8?B?VlYvNTZydnNPY1kzS2JBYnV5ckJQUEVmVTlJRTZ2ZkllZXpMV3IvcUM5aTZP?=
 =?utf-8?B?UE0wblUzMEFRTERaa2YyRUJldlhkNTE0YjkxRXBHU09NZmlEN2tEaWtXbzg3?=
 =?utf-8?B?dEo4UjJXUk9oM2kxdTRMSzYxbUFBNDljeUVVVkRtWWtQK2hLRWhHRDZLdGQ5?=
 =?utf-8?B?Y2JGRXpPU2d2U2lod0tvNVBZaWxlVGdSWGRRTGluNWx5R1NIdlM4VDIyMlFp?=
 =?utf-8?B?SWxUZXl0MWRlVENoejUyT2ROT213MVlmU1NsNkswRldKYXFCYkovcDkranZU?=
 =?utf-8?B?dEtxeml2ZGdZcDBCVW0vNG04dnVNTTBkWjJ3a1kzTTBvdFBWdkN1ZGF2NUph?=
 =?utf-8?B?ZE1RTTFuZGdUbjIvOG5nRW91aTNjYitPYW9YNXJna0JGVHdFNkpuSThTVWtv?=
 =?utf-8?B?YjZrT3laVy9jUXRiZk1EMEVrUUdtSUI0WjhHc1hMRjVVMVoxamJoeVg5QU1p?=
 =?utf-8?B?L1BQSkE2NUh3ZzNaVWU2Sm93N1dYZHo5NXpRd1hPRmdlYzJ4bm82MlQrMEtv?=
 =?utf-8?B?VGVOUnBtSmVLYnBPMGUzcytla1A5SlRRK0hpL2VnNnUvQWswc1pkenI2bTQr?=
 =?utf-8?B?bEFBR0JBdzhhbENqZE1lVzRBNnlLcURaeE8zMURWL0JuY1pKTmNYRmZIa0lm?=
 =?utf-8?B?UzZqOFZzUW1XMjNSdS9xS25vM3E0WWYrR0dodTBGdmZlbGxzZUFpQjVJREVN?=
 =?utf-8?B?ekNpNENoeUJPTUhMMmpwM2pJTHlGVlBJV2FETURSK0lJRDAwQStndzlxU3Jn?=
 =?utf-8?B?dTdrajhac20zeW9iaFV4V0MxekpTT1pKODlJZFFTYUJRZFdFZmV4ckpnRXNx?=
 =?utf-8?B?SmhQb2llZzBPZEp6Y0Rka1BVUzJxNWlPazRkdjJ2QUpaVm9acm5FNFI0OURj?=
 =?utf-8?B?RGQ4eE5jNiszM3NyTGRKKy91MHd2ZTVHSFRGRDM3bjFpL1BVdzF1U05hNlF4?=
 =?utf-8?B?K0QyZlovVFJlN3B5OHMxOTBWWlJHYnc2eis4ZXVHcWlKYnJUTmJCdTVDbjU1?=
 =?utf-8?B?K2w3bzkxMEdMRGh0T0wxeUUyNlQ4R2JuZDhJRFNMMTNwQ3hnL2pNUVgwSVdO?=
 =?utf-8?B?MTliUjYrb1paaXk2MUt4Q1ZjcURjSW1udHU5d3F5NjRBWFhWdEFseTFGYW1B?=
 =?utf-8?B?cDc4VWtDaG5xYm5KWE13VkVPTDhsQUhEOTROZ3lnTkRoOXA2ckp3YzhwWmF4?=
 =?utf-8?B?NWZhSDhuSDFlQUJKdmVkRzhSbnZ1cG1nSmNUa1RiNmxKSkxUVWRjU2FCZS9k?=
 =?utf-8?B?V2U3c0tvRWhaT3ppQmdRbzluT1BQaWlQOExmc25OTHVVYkZpVFFuSWNjZzZD?=
 =?utf-8?B?NEEvT2h3ei9jWkZoZHdmNXFlTmZRdFByZ3kzWjYyVmdsalpZSzNOTE9paVZ3?=
 =?utf-8?B?OWR5UVZxRVhZMmdVS1l1SnJUMm1hQ2lJd1gvcjFyc3JMZTZ5cnAxNVd0UDYr?=
 =?utf-8?B?R1pvdFdCRC9uSldqV1lhdktPamtkM05kanRna0lsenVtTnIvYUJRbGdWSDg3?=
 =?utf-8?B?YWIwTWhKeit6Umt2WitjK2hIUURsVVhsbHR0MmtBY0cvTDBYNlAxMlFBVnAv?=
 =?utf-8?B?SncwTVJudzRBUFZYMFh6U2hoamtYSjcycWdMczUxd2VKdGNMSXZOSjdXZ3ZE?=
 =?utf-8?Q?JFhD5+A3sLLUtsF95m/aDvtGf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d372d7d3-50d7-4ef1-6dc0-08de27717a85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 13:42:27.4997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGLdCC6Nlm3dKS89ZeoBL79XyWUD8tMMPXBb3Oc3DKbSqCFw0Bj32cBrAWaFlCRc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7707
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

On 11/19/25 14:25, Jason Gunthorpe wrote:
> On Wed, Nov 19, 2025 at 02:16:57PM +0100, Christian König wrote:
>>> +/**
>>> + * dma_buf_map - Returns the scatterlist table of the attachment from arrays
>>> + * of physical vectors. This funciton is intended for MMIO memory only.
>>> + * @attach:	[in]	attachment whose scatterlist is to be returned
>>> + * @provider:	[in]	p2pdma provider
>>> + * @phys_vec:	[in]	array of physical vectors
>>> + * @nr_ranges:	[in]	number of entries in phys_vec array
>>> + * @size:	[in]	total size of phys_vec
>>> + * @dir:	[in]	direction of DMA transfer
>>> + *
>>> + * Returns sg_table containing the scatterlist to be returned; returns ERR_PTR
>>> + * on error. May return -EINTR if it is interrupted by a signal.
>>> + *
>>> + * On success, the DMA addresses and lengths in the returned scatterlist are
>>> + * PAGE_SIZE aligned.
>>> + *
>>> + * A mapping must be unmapped by using dma_buf_unmap().
>>> + */
>>> +struct sg_table *dma_buf_map(struct dma_buf_attachment *attach,
>>
>> That is clearly not a good name for this function. We already have overloaded the term *mapping* with something completely different.
>>
>>> +			     struct p2pdma_provider *provider,
>>> +			     struct dma_buf_phys_vec *phys_vec,
>>> +			     size_t nr_ranges, size_t size,
>>> +			     enum dma_data_direction dir)
>>> +{
>>> +	unsigned int nents, mapped_len = 0;
>>> +	struct dma_buf_dma *dma;
>>> +	struct scatterlist *sgl;
>>> +	dma_addr_t addr;
>>> +	size_t i;
>>> +	int ret;
>>> +
>>> +	dma_resv_assert_held(attach->dmabuf->resv);
>>> +
>>> +	if (WARN_ON(!attach || !attach->dmabuf || !provider))
>>> +		/* This function is supposed to work on MMIO memory only */
>>> +		return ERR_PTR(-EINVAL);
>>> +
>>> +	dma = kzalloc(sizeof(*dma), GFP_KERNEL);
>>> +	if (!dma)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	switch (pci_p2pdma_map_type(provider, attach->dev)) {
>>> +	case PCI_P2PDMA_MAP_BUS_ADDR:
>>> +		/*
>>> +		 * There is no need in IOVA at all for this flow.
>>> +		 */
>>> +		break;
>>> +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
>>> +		dma->state = kzalloc(sizeof(*dma->state), GFP_KERNEL);
>>> +		if (!dma->state) {
>>> +			ret = -ENOMEM;
>>> +			goto err_free_dma;
>>> +		}
>>> +
>>> +		dma_iova_try_alloc(attach->dev, dma->state, 0, size);
>>
>> Oh, that is a clear no-go for the core DMA-buf code.
>>
>> It's intentionally up to the exporter how to create the DMA
>> addresses the importer can work with.
> 
> I can't fully understand this remark?

The exporter should be able to decide if it actually wants to use P2P when the transfer has to go through the host bridge (e.g. when IOMMU/bridge routing bits are enabled).

Thinking more about it exporters can now probably call pci_p2pdma_map_type(provider, attach->dev) before calling this function so that is probably ok.

>> We could add something like a dma_buf_sg_helper.c or similar and put it in there.
> 
> Yes, the intention is this function is an "exporter helper" that an
> exporter can call if it wants to help generate the scatterlist.
> 
> So your "no-go" is just about what file it is in, not anything about
> how it works?

Yes, exactly that. Just move it into a separate file somewhere and it's probably good to go as far as I can see.

But only take that as Acked-by, I would need at least a day (or week) of free time to wrap my head around all the technical details again. And that is something I won't have before January or even later.

Regards,
Christian.

> 
> Thanks,
> Jason

