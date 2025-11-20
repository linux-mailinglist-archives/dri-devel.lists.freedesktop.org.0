Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41755C72E38
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 09:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D03710E712;
	Thu, 20 Nov 2025 08:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UvmPEtCL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010058.outbound.protection.outlook.com
 [52.101.193.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9519910E049
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 08:32:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oy1adKNts9gR1TIX4pX/eNuDo05TRIp9has//tsNMLDyZYmzkk7vfU9hKG1/8Qe+sSThOn6BbOlZQw2X4MBBMKmR2oDEovCUqR6qDWGHfnjx7pXL1/Hwl378ngD5jkj9rWpu270LnFgqa3O9cyWaMsy9CKvp//QehO1lK5KUwlLfdSnQzfY10TwHsjLGKwT6PLPoDEQCBDQB+1CCaRiKQ1ORySsWg8tlG2NtsuizyXuiwENL0gKxnXfsLq9E1epZr71TqSdkPwiTmA2mfQr/ygZXyyPTza6U8JPfzBcSTvCNxJ4vSG6On04y7qJgaVJzwU269L5v3RO7EjiXHOQihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsKT8NtNBSIWWXLiz+ADR0aSU+r3n63tviQ9dZ/h0yw=;
 b=XPLm9Awr3wN7rJt28cU8nhR+55BtTwEhRBz+O3mUJCGD9JKPcTbjDMVM8Kf0wVkQuY2vgdU0qoMWbkL78CAlsHSVNjLMJ9I6WMomuAXnQp7Xf+2yzS/PnNwEJEmA0Tdc0K+f5iR71NPDiY0cMcAp79Ly1aKz5xfjAoe8m/4TGWV8oJweYVgNlc+orH8UuZYwalgc7zBQRQ1X5LGv8NQA20KnSJmxinXoHm4gb/NaByslpRQf8FBF1YrGAK4vQYxKlZpy24TtyTbXg34yCF7jnjasmpVgYoefnYvs8EIATTbfgyO0Zwti8ysBX5q1GG4olvIH2doGRrY1246Cb8BtMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsKT8NtNBSIWWXLiz+ADR0aSU+r3n63tviQ9dZ/h0yw=;
 b=UvmPEtCLgu4+aH5ghICuNGjHtB3Nc2lmi6wLZrK6fC9965ax7/zY8MdjSdnn6tQ+fRPhdJiXt2QWcUwn1A+/BAks2zL/jI0PHKNRWHim11iSq4F+wT7HPVjnN/UXDB9iOi6Tr9hv9mkVE02eIYu27TCnrZ9voi5KIgb31Ya/g54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH1PPF0316D269B.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::604) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 08:32:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 08:32:32 +0000
Message-ID: <1e238415-1080-40b3-abb4-7fd31033d6de@amd.com>
Date: Thu, 20 Nov 2025 09:32:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v8 06/11] dma-buf: provide phys_vec to
 scatter-gather mapping routine
To: Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Bjorn Helgaas <bhelgaas@google.com>,
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
 <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>
 <20251119193114.GP17968@ziepe.ca>
 <c115432c-b63d-4b99-be18-0bf96398e153@amd.com>
 <20251120074137.GR18335@unreal>
 <209499e2-6a06-4291-ad4c-77230926c665@amd.com>
 <20251120080635.GT18335@unreal>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251120080635.GT18335@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0319.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH1PPF0316D269B:EE_
X-MS-Office365-Filtering-Correlation-Id: 0749fc4f-c1e6-4553-06ce-08de280f593a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTlacmFXeUxxWllEM0d6QXZLT2p3RU5PQ0xaUjM5RWgveVN6d25INXlHZFQv?=
 =?utf-8?B?VHNPenM4TWszYWpmSGRidUk2Unp1YmVEam8wY0psR1laYVl3cXY5b1gxVnVy?=
 =?utf-8?B?N1B3amw5blN0RnJ2UDFuSkp4MVJGbDVya01FOFkyYnFQUmE3eitjT1RJN0Rl?=
 =?utf-8?B?Z3hVSzAwVnNDOWhoWmZyTS9ycDFkN0F6a21Cbk5MZkpiS2VRWUhqZUR3R1JY?=
 =?utf-8?B?dmhzcmFPR3hmNEpkZnFHbTB4RjFPOTJWWWJ5blV4c01LcGNYZURDckFtNHB0?=
 =?utf-8?B?Z21hc2tZcGl6WjZSUmFjeSsxZFp4M1c4aWtsMStiK1V5dDNGZGNXcGtUT1V4?=
 =?utf-8?B?N05XSjdHd3NwSmVpRU9XRnZvcC9zRGhGMGR5Z2h4TzdxL1d4ZEk5ZTM3Y1Y2?=
 =?utf-8?B?RThhc0VFUy9uQXpFRzczZllJZHVrNGltUStaZkR2ZmREZ09pZEtyWVVsVEVy?=
 =?utf-8?B?MER0WTBscGZXajFYWVI1bTRUelFNL0V1NjZ1WHUzUTVBd3lSNlJETHpHSDEy?=
 =?utf-8?B?am5GdlRnWWo5RnU0SmtwdTI2ZElRd2p3VUNlZXBwQzQ5b0F5VzI4ZWxOWEFa?=
 =?utf-8?B?NGFmRGxNY1M2RmdsVHpuSzhsZDVBbEpaaGJrTDN0TnB3dFMwOW1xbmxleVlu?=
 =?utf-8?B?djZzUnhLMjNvd2k4eUIxblg3WFYxSlpBSm5hT01VbmZ1U2hXZW9iYkN1TTl1?=
 =?utf-8?B?aktiV3RIWXVkeXBTcDhRNkljbmhpN0ZGSTZHcThNbHFQNjZDQ2ZaWmlNZVps?=
 =?utf-8?B?cVVZOTVEbVVBYlpWdUtoTFdjbEh3eEZWNzdILzE5UWJQalV0bjBJSUtUVEFW?=
 =?utf-8?B?WUF5M21DeStTMGx3NFV5MzVyU0JURHNHVmRXYUQrWkc2dXZpdWJ0RThLNlY3?=
 =?utf-8?B?QW1IY0dJdngxYXlEbzY3WDJpaE9EK2pSQmZaSzlrckozRW5iK05MOUMxckh4?=
 =?utf-8?B?WjFrWjJ0MUd5blgvM3B3VXJwUm52QnNFTU9PTjNoUUI4NC9rWGEvM0Y0dWhI?=
 =?utf-8?B?Sk15Tk5mNXZxVnVPRitOc2dKU2lObENzWWNoWk5MSVlKNDBsKzhZMW1sRGlv?=
 =?utf-8?B?bmlJYklJTjBNNGlFeFpuWHVqMVJVRWhUMXpXbTRDTHZGa0l5eE1wS1pScDZk?=
 =?utf-8?B?SEhJL0VkZnRFWFJGNjRCNUd3cDZVSjJZNXFVSjBvcWxJbjR2YzRMTC9xeFQz?=
 =?utf-8?B?TWlHMW1ZMVZ4T2lBK3hLVVZoRVlGQTJQT0U3T25Dbk4yR3pvYTQ2aXVKY3Iv?=
 =?utf-8?B?NmY1R0ZSaTVVbE5KaEdyak1DRlJKWnJFdy84eGoyUzNIc2RCb3EzS0s3ZzJU?=
 =?utf-8?B?cFZZeUFNSkE0bVBoN0FuZUZDQWJEclZMQmtlS2Z6SHM2WVFlWHlzK25JTzdq?=
 =?utf-8?B?MzJ0cWpyMFo3WkFwY0tpZld6SG82a05FT0t3V3c0NG9aSUdDZWpiRE9sUzJa?=
 =?utf-8?B?RlI3ZE45K2gwN1Z1ZWRRemVnYUVhVlVmSSttUFpQUVFMWm5RcVhiM3RnckhX?=
 =?utf-8?B?blBVQlhaamF4bjVaOXFrSlZYbHVRWitQRXRMOWJzQ1ozN284WWhna1JGMGEr?=
 =?utf-8?B?aGhLUDJUbTBaVDRZamM5WndXbGIwbWdPdldNUFZSY3RVTTRoZUw1c1Z5cWQr?=
 =?utf-8?B?Qk1oaXg3dkRKSzdycGx2aEVMTzE5WUZ1bTJrZ1djRjVHV2dIdWxLSUpDOG5F?=
 =?utf-8?B?TnYrOVVENU9KcDFPdC8yZFVmeHU3TEpTM3k2SDFrRWdWSTYrSzJQRFNZbTRk?=
 =?utf-8?B?dFhSeThnZXBkOHIzUytJUEY1QzFXWk9JZUNOUlk4TndlTWN1bDBLMlNVNFZZ?=
 =?utf-8?B?RmpWK1RZZ3AzRWpRdy9ubXgyYUFaVnhNRjNOcCtiNVpiUEd4TnFldXdaNWhp?=
 =?utf-8?B?NTluRmJ6Q2F0UEpZdWlpdk1ZRHRwZFFFdUxya21TbnhGSzVlSkpDQktqU2pv?=
 =?utf-8?B?aHZadVQwdE5aMzNXOEtTNSs2K0V1Ukc4dzBQTUZzM2FseXFjcWZwczhOQUtx?=
 =?utf-8?B?RUczWnRhSCtRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjB3dThvb293dm9mVEg5Smd2aG5DTTAvWTlZTk1SNVZCYXNtU2pSeHlROVhO?=
 =?utf-8?B?UjlhZkpaSnFPcU9VL1A1eUNzc1BtQlZibDZpRzU5VGxVeFNiYlBPR3E0czVh?=
 =?utf-8?B?WWVFelVXdTJKUDJqM3gzTEMrS1ozdWJ4M09nK0tkUlpUK1ljTU5OeEZRRlNF?=
 =?utf-8?B?NkJHL2xWa3VaZ0I3ZWtzbTAvTlVhNWpvazRiZFhkUWZmVFMrOUVZQ2dMUkRY?=
 =?utf-8?B?dHNqR2RTWnhKRDlwdkczN2tYV3A3alNKK2N2dndsM1YyV3dKaURKRUJmRldn?=
 =?utf-8?B?U3d2SXczVGFhZExjYjcrbDc5VGRlKy8rcklvdEorNG1Sa2hRUmRheXdwZENT?=
 =?utf-8?B?Si8vdU9BaUZncUFacU1UaXFQVmVjN081VmFLRTVQa1FjUnN3bmtWcWhpWEdn?=
 =?utf-8?B?aGwzT1VyS1dwUjVFejREV3l5YmVXVzlBcnRRaWlwSmdYQTU2NVkvTjlPT1lq?=
 =?utf-8?B?N3ZSSUFSUG5vdlFYL1hUQmVsWEl5aFkwTXhNWngxdjBLaTBxL0N6dVNwcE1s?=
 =?utf-8?B?S0pFWWpYWmFOK1UzSVM1KzcyNXBmbTkva1d6NWRENm9qUE9lSTh3aWV5a0dG?=
 =?utf-8?B?VWhrWXNYZTNCcTFRVEpHcWpGNU1sUGw5Vk9rS0V2ZEkzOHduNkZLQWsrU3kr?=
 =?utf-8?B?NHZXR3ViNC9UTnJZWG9OYVZWNzZ1emFqQS81N3JZcjJIdUY0V3lEa0tScFlM?=
 =?utf-8?B?TnF5QTRHb2RKaGxCMUk1WnQ2WEFSYjJHS1ZhMklSQm5TbmN1N3lvZktGa01D?=
 =?utf-8?B?R0FKaHdDNE9nOFpSbEdrak9IaWZFYVRyMFMrVDB3SWREek9yS21idnNhYk5J?=
 =?utf-8?B?T1BOMVJjZ0lHNWw0TjlrWisxYzBEZFZXdFlKcUF0NlZLZStacUhhTUZRRGts?=
 =?utf-8?B?S2htK2pFTEcwTkZDV3JRNmZ2NnhKRmdOQ0VPNGpwOVZ0SThDS1pZQ3BRdzgv?=
 =?utf-8?B?TnoxNTNHN1NYSlFXN09MMVpQQnYzUVpHVkpIaVhRZHhINVU3WEpTRXh1MFg3?=
 =?utf-8?B?QnhYQk5Henl2d29iSEZlc3ZwMmRoVnExa1htQVQxRm1KR04vL2IzVENBekh6?=
 =?utf-8?B?S2dIalV1WWg2dXZ5RUFmZElrNnlscXZIK01MTy9GTUhDS2xUK3NjMERjbU1y?=
 =?utf-8?B?YVYwVkVDVlBhSjc2NWdRVkloZ1hYUG1kRFk0bXlWUGpCYW9qcW1COVY3elRR?=
 =?utf-8?B?YmZJbnRYdFRoM3lFNGg1WXgzL0xXeU1UbEdmelRGT2hTTzRrM3lWcDNMUyt6?=
 =?utf-8?B?RUNGRUJHdENRTHhUMlRTTmNYc2xyd0YxK3l5RDRDSXR2ZEVpUzdBazdlMDM0?=
 =?utf-8?B?MDFtTVYxTW16Rk1RV3pSblpQYTFHNUI0KzE4OEZaY0piOUt4ZEx3YmZENkdM?=
 =?utf-8?B?NDcvUE14bytTejZhb2Z5MTU5YUU5bUd3WHVKZ2srMzB4Q2Y5dW8vS1pMVnF5?=
 =?utf-8?B?QjZUVnJUL2VDUk16YXowQTJLcGVGck5Hb1lWRi9EL3ZsWERzV2ZPeUowWko0?=
 =?utf-8?B?SDIvNHRzYzM1RndFcGNUdk1wbWIrUXFLb045SWZJRzdVREZ4MXd6cDZzUytC?=
 =?utf-8?B?cTZCaElWU0xWQkVCK1NMU080akxzck1jUlhEZWFORjZFTzBHWVBSdjRZdlhC?=
 =?utf-8?B?L21UazF1UVlpdnlGR3VHSDNFSFo1VzJONkdvUERmaFlLT04xSWRQRjI3U0hn?=
 =?utf-8?B?RlBwUmZrTlpYY0NMUDFrTE9yaUVGejkxOS9zWDAvQmNjRWc4MW5Bd0RpUVBP?=
 =?utf-8?B?U1NTTGFsMHhGY1pVcC9xSWN4OXV3d2plVFJEN29MSWpkTjkvSWxUYndKUm9z?=
 =?utf-8?B?ZmQrZ0tnZzg3c3lMTXo0aUdKZkdqUDh4QkFMWERDQkdtSTkxbmh4WVpuNTFQ?=
 =?utf-8?B?elczT29Ea2g1SHptWnczd0l2ajFUbm9ZWjhONVpha2o1ZFdWVXpta3ZZZC9E?=
 =?utf-8?B?TXhHYmpIWGxneDBSRE9zV0FRZmVhU3F4RkFVNlpLN256SG5wQmg4NFF6c3FG?=
 =?utf-8?B?bWkxMmhzYU5DQWNkM2R5cVZSRHUrMGlsQXdwcWUzalNUMVBhaFJhU1UxUmhT?=
 =?utf-8?B?V3FlZzlTcWhGNlJDekZwRmVSS3VhT2JTSjJsT0JxL0lPN0FoZmxPYi9hSHBD?=
 =?utf-8?Q?ZE0fycsprUnykG+5wtal5vHLi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0749fc4f-c1e6-4553-06ce-08de280f593a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:32:32.1408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZdLvBXqIwu8uoDXsHLCCtCgT4ZVisSUsWjAN3ksgxRIYzSSW0jCitq1h04fxw1+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF0316D269B
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

On 11/20/25 09:06, Leon Romanovsky wrote:
> On Thu, Nov 20, 2025 at 08:54:37AM +0100, Christian König wrote:
>> On 11/20/25 08:41, Leon Romanovsky wrote:
>>> On Thu, Nov 20, 2025 at 08:08:27AM +0100, Christian König wrote:
>>>> On 11/19/25 20:31, Jason Gunthorpe wrote:
>>>>> On Wed, Nov 19, 2025 at 02:42:18PM +0100, Christian König wrote:
>>>>>
>>>>>>>>> +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
>>>>>>>>> +		dma->state = kzalloc(sizeof(*dma->state), GFP_KERNEL);
>>>>>>>>> +		if (!dma->state) {
>>>>>>>>> +			ret = -ENOMEM;
>>>>>>>>> +			goto err_free_dma;
>>>>>>>>> +		}
>>>>>>>>> +
>>>>>>>>> +		dma_iova_try_alloc(attach->dev, dma->state, 0, size);
>>>>>>>>
>>>>>>>> Oh, that is a clear no-go for the core DMA-buf code.
>>>>>>>>
>>>>>>>> It's intentionally up to the exporter how to create the DMA
>>>>>>>> addresses the importer can work with.
>>>>>>>
>>>>>>> I can't fully understand this remark?
>>>>>>
>>>>>> The exporter should be able to decide if it actually wants to use
>>>>>> P2P when the transfer has to go through the host bridge (e.g. when
>>>>>> IOMMU/bridge routing bits are enabled).
>>>>>
>>>>> Sure, but this is a simplified helper for exporters that don't have
>>>>> choices where the memory comes from.
>>>>
>>>> That is extremely questionable as justification to put that in common DMA-buf code.
>>>>
>>>>> I fully expet to see changes to this to support more use cases,
>>>>> including the one above. We should do those changes along with users
>>>>> making use of them so we can evaluate what works best.
>>>>
>>>> Yeah, exactly that's my concern.
>>>>
>>>>>> But only take that as Acked-by, I would need at least a day (or
>>>>>> week) of free time to wrap my head around all the technical details
>>>>>> again. And that is something I won't have before January or even
>>>>>> later.
>>>>>
>>>>> Sure, it is alot, and I think DRM community in general should come up
>>>>> to speed on the new DMA API and how we are pushing to see P2P work
>>>>> within Linux.
>>>>>
>>>>> So thanks, we can take the Acked-by and progress here. Interested
>>>>> parties can pick it up from this point when time allows.
>>>>
>>>> Wait a second. After sleeping a night over it I think my initial take that we really should not put that into common DMA-buf code seems to hold true.
>>>>
>>>> This is the use case for VFIO, but I absolutely want to avoid other drivers from re-using this code until be have more experience with that.
>>>>
>>>> So to move forward I now strongly think we should keep that in VFIO until somebody else comes along and needs that helper.
>>>
>>> It was put in VFIO at the beginning, but Christoph objected to it,
>>> because that will require exporting symbol for pci_p2pdma_map_type().
>>> which was universally agreed as not good idea.
>>
>> Yeah, that is exactly what I object here :)
>>
>> We can have the helper in DMA-buf *if* pci_p2pdma_map_type() is called by drivers or at least accessible. That's what I pointed out in the other mail before as well.
>>
>> The exporter must be able to make decisions based on if the transaction would go over the host bridge or not.
>>
>> Background is that in a lot of use cases you rather want to move the backing store into system memory instead of keeping it in local memory if the driver doesn't have direct access over a common upstream bridge.
>>
>> Currently drivers decide that based on if IOMMU is enabled or not (and a few other quirks), but essentially you absolutely want a function which gives this information to exporters. For the VFIO use case it doesn't matter because you can't switch the BAR for system memory.
>>
>> To unblock you, please add a big fat comment in the kerneldoc of the mapping explaining this and that it might be necessary for exporters to call pci_p2pdma_map_type() as well.
> 
> Thanks,
> 
> What do you think about it?
> 
> diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
> index a69bb73db86d..05ec84a0157b 100644
> --- a/drivers/dma-buf/dma-buf-mapping.c
> +++ b/drivers/dma-buf/dma-buf-mapping.c
> @@ -84,6 +84,11 @@ struct dma_buf_dma {
>   * PAGE_SIZE aligned.
>   *
>   * A mapping must be unmapped by using dma_buf_free_sgt().
> + *
> + * NOTE: While this function is intended for DMA-buf importers, it is critical
> + * that the DMA-buf exporter is capable of performing peer-to-peer (P2P) DMA
> + * directly between PCI devices, without routing transactions through the host
> + * bridge.

Well first of all this function is intended for exporters not importers.

Maybe write something like "This function is intended for exporters. If direct traffic routing is mandatory exporter should call routing pci_p2pdma_map_type() before calling this function.".

Regards,
Christian.

>   */
>  struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
>                                          struct p2pdma_provider *provider,
> (END)
> 
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> https://lore.kernel.org/all/aPYrEroyWVOvAu-5@infradead.org/
>>>
>>> Thanks
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> We can also have a mini-community call to give a summary/etc on these
>>>>> topics.
>>>>>
>>>>> Thanks,
>>>>> Jason
>>>>
>>

