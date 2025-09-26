Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1518DBA44AA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 16:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8487410E319;
	Fri, 26 Sep 2025 14:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="btnJ4iMu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010066.outbound.protection.outlook.com
 [40.93.198.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BC810E319;
 Fri, 26 Sep 2025 14:51:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmzC2FrmSDjnezgAtkzLwHRFrrUrHHWpRcnxu5Wrukrva5elzUuOjOjZ3h4+Miuiczx0DY5pA407nq6wuGCKwDyDAEPXfb7WcfSF9m9upVJ/0t8yDHxpR36povpp+C17cparAN5UL/kHy91GubeN18aJQhMsZZWwZjpHIbzrpP7XdoZPCDGRS11lNQs+hDUWlsYIR97K9/h0dTAKpEBdJ8AB0gfQNNvs8WQOV6sdy65vtVpxfXAprVcfGvXMpIi59/MZKKQJERFFhIcM482pCEdh3bI6Bht86Du0PGwM3/mlzAUyWlJoC/hWGIFpRv2mdUMAXRV2L4G7BcEq+M/+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTgfWCvJ5eulNcLgHjwfQ72QSBCUWrukbFzDw57vVhY=;
 b=wZ9H9IuiNqRc6KMx101f+ucP3JMfo1rOmkhM5dK5DA88Bh02AOS/zsRF+RPgvMpQGrcMA1vM/asn8PKJK/yDcfTs+fjUXMiImcBgHY5vrqHfs7ZDTkmku5AqyuAN8DwZRZV69m+g8qWAC7jSD67eugVcNcSAC59W5/J0Y2tip0j2493I6VcmuEO0c6Fthg/D0T7i2Iegbl0f16mjUPLeWgutOjb01m15jDHTPWGVimEfEbNZ5q1LoZfB56t4eZ9JHfPiylhjS+UfBQXAjj9XaCdpTI/Uom4LT2N5DjzqxHEphcUoHmGwq5Z0k0LYlVOdsgQ4VzKbZjHZLcw87v1ISA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTgfWCvJ5eulNcLgHjwfQ72QSBCUWrukbFzDw57vVhY=;
 b=btnJ4iMudP7K7LubxkV193H6c0axa8FeSeRMDiuoqkqjtYGzNilJVVlJ0v+wdhpEZXWgfrucKJDp/DDet+GU5UNfuev0dWQRfDwYrlZruajFBWrZAo53ZyaoPB6RhzEAU+96vOROcwE0z7FIk0XTVqxpRpO1BpABTkr5ZMfw7Ak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8897.namprd12.prod.outlook.com (2603:10b6:303:24a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 14:51:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 14:51:35 +0000
Message-ID: <765e3449-2eb1-49f5-954e-3bab5a5fc9d1@amd.com>
Date: Fri, 26 Sep 2025 16:51:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] dma-buf: Add support for private interconnects
To: Jason Gunthorpe <jgg@nvidia.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250926084624.2288-1-thomas.hellstrom@linux.intel.com>
 <20250926084624.2288-2-thomas.hellstrom@linux.intel.com>
 <472f27f0-2f54-45dd-b0a6-3a26b5eec301@amd.com>
 <ef9f4fb1c55bf3e5e6423b2accdccee0607b95ef.camel@linux.intel.com>
 <20250926144128.GD2617119@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250926144128.GD2617119@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8897:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc0008f-f226-4f45-8eda-08ddfd0c303c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUlET2RuWk0way9NcmxIQjVSYUM0R2RYSmMyVlFPc3RRYVgwZ0k1dDBaV1lF?=
 =?utf-8?B?YlExUFgwU2h4RUd1K24xcUFTaDBaUUdOUkFzUStxZThWTGw4TVYxaElCSDJN?=
 =?utf-8?B?bG9mY0FRZ0Y3NHBMZCtEbEhZNmlHM0ZRR1VhZnk3UGFqeDRUNHJub2VBL1JW?=
 =?utf-8?B?L3c1YkJaaFJPNXVQa0dNa0lGMGZaYkJiMjhGTERDeGg3K013djhuZ3JLR2FW?=
 =?utf-8?B?eE90THlsa2hwaTdJdmlvSjQ2Q2NUUnk1NDVjTHhRNGpUNDlxT1BnQ2huTk1C?=
 =?utf-8?B?RWFreGlwTmJpUlRRZk0wTGJCMDFaRDhQWUE1WTZqQkhmbGRXenJwT3IySjB6?=
 =?utf-8?B?SzZwekRXa3Fpd041aEV2ZjBiRXptRjRrZmFTWGovN2lYdjQzbjRkMXloaC9q?=
 =?utf-8?B?SXZybk9XV2pHeHpoS2J6djdCaGNuTXpMUGJpNFhqM3Rwd0t0VUxOSjB4MldB?=
 =?utf-8?B?aU9rSitZSk9RdnpWQ2dUQnBBODQyYXhVZGpWSUFpblo0M0FQaEZ0Nk5kSjB1?=
 =?utf-8?B?RVd2RDBuQU9xY2RMWGk1eEROL3FSNDBrOVM0Z0NmVnRKTHdqVVd3K3VoTnMr?=
 =?utf-8?B?Q09WMmRmQkREWjh0MFpVQU9lcjBRN3FWWGdEM3JGR0hvOTBWcnRWeXgwMUxn?=
 =?utf-8?B?cERhcWtrOHVJOFhzekh2VTFCa2JEaGdKVmJscjgvK0JuTzFPSGgxSktGMVRP?=
 =?utf-8?B?dkl3c1JBa1crbEtMVzRXdXRnR09obE5wRm12cXZYaTFPMFNFTVVnYkFiRWJh?=
 =?utf-8?B?QVZjbnpqSkNiNWtrTkY0NXYrTFZUWUZ5VzhreDRwUytQSVdqMkg3VXNmOUhr?=
 =?utf-8?B?K1VETENIV1Z1SlNPM1h4b0tWdjNXaHFlcCt2UEpHR3RCcS9jWWhkSWt6Vzlh?=
 =?utf-8?B?QWZUYzN4ekhRTkphZ2txMm55ZVJEMTJxTkltSkdpRUs1bXgvK3cremNyQ2l4?=
 =?utf-8?B?VUVTU1U4Y3hqaExJbUZULzBwdHpWcnF5TmNJY3NzOVhJUElpSXRlTXR0aTFK?=
 =?utf-8?B?WWJTREtPakZlWkwwVWxJeWg4QW9HNC9IL1JJamRHZ0NmOXUzZWtHUjlBQ3Jq?=
 =?utf-8?B?UHVqdEFzYlJpb0gyZExMeFZ0aE9XMzhnNU5BVUgwL1VFcE00TGVkZzlwQXlZ?=
 =?utf-8?B?aG9nSzh4allUUzhFN2V4bHVTYmN1eTVJQjROYVhWR1E1bnl3L25aQUg1Y1NM?=
 =?utf-8?B?clp5c0lTeXIvTEh3QVNSN2RCc1RxeXdYbEdRbzRZY3krb1VCd2pWcVlHWEZH?=
 =?utf-8?B?cHBMZFlsaTBNT1I2RWdTWnBRZFV2YW1XWExWRm0ybUpabjFpbmlsVkwxak9B?=
 =?utf-8?B?bFhJRU5HWmxDNVcrTEsySENneThiZ05xVE5wd3hNRXRHT2NxWE13eW1hc0xU?=
 =?utf-8?B?U0hYODcwdkprdUdObm82LytLNDdtUElkUFFwa09iTEJGQ21pYWNGeTVWKzhz?=
 =?utf-8?B?U3hvRUloWGxhbnM5OXhHK0p4UGZPaEJrWDMwNFNXVTJJVUF5WkZSSk9CYktx?=
 =?utf-8?B?NFVrSkFIVmZGNjRHWVJDcmcxci8zNVpjR3M4RTJJSnJmWjgrcCthTGw2QlE0?=
 =?utf-8?B?RENocE5xWjNZWVIybGdTajJQQ0xZaTZXZnE3Nm5kZXJSR2hJMHBFa1VkRG1w?=
 =?utf-8?B?cWtyS0N2RXNUZzNrUFg1U0g0cm03TU1sT0l1UTV1MnF4bmEwMDhUdUV2OEFC?=
 =?utf-8?B?dWpObjRGVnd4aUkzNUpoaEpCWUdJdzZBZThTWTQ4dCtlVXdxZjM2QW9Dakp4?=
 =?utf-8?B?VWpNL3pLenJIVysveFNkdzhmOXo4VExWeHZoVmM4c25KRFJwMmNXaGVxejdZ?=
 =?utf-8?B?cUxQUHN3V0FuM2xsdjNINks5cjNUUDRNY3hzc0ZPYkRjcHVFV1FOeDlDZ2M0?=
 =?utf-8?B?ZHl0QjV6MWlvR1R1WGJtTTJBMFFVOGlaV0NhNzltMjlhbVpwcFE3NTBFQzNt?=
 =?utf-8?Q?OnAdF865Y0bxhBUDVH6KrrcwYaIvTVc9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlI3MFVlOFUyZERyR3QzdFVNeDhLYVR4V2FlQWE3ZWttZ2ZzRU9SZGFhNWdv?=
 =?utf-8?B?clE3dTRqVWNxbkhUcmxIZWdDTTl4Z29kVkNXT2tEOEJmM20wd1hnQ1pqQm0r?=
 =?utf-8?B?ZTgvdjdEQzBXSUhBaUNmb1AwbHVrci91TmlZZHU2YUhpT2h4aEcwSkJFV1oz?=
 =?utf-8?B?bmlkQ0h2cC91T3hYWGprKzVkdngzQ0pGYkYyd29NcTRocmFwdG96VkhiZldZ?=
 =?utf-8?B?cmc3Y2t3UVRKaUk2a3hPNU9YUUJrUkliM1NSWHp1MUt3bjd4ZVorWjUxSlNV?=
 =?utf-8?B?VERMVi9sQ0pDWDFmTTIzOHFUQ0hkcXdQOThkWk1EQjlscEhOZTk4ZXRuRWNx?=
 =?utf-8?B?L0FUNnFqQ1prSUpjWDJoWSttNzZoNVBWSFN3NkxFQWliQ3NGcTJ1SmpNU3Rs?=
 =?utf-8?B?RnY2RThLM0tGVk9NMWZHUHQyRWhWSzBncENlOGREcnhkeWxvblZGbnZZUWFI?=
 =?utf-8?B?ckNFcng0NnZWL3ZXTVhnNjVmSitpU3IrNWU4bGpHSER1QURLUkxtZE1rcHZN?=
 =?utf-8?B?ZnNZSnhFQmljQTE0VVNhOWxqN3dPa1ZHcWU3YUVWUS9UdG12Yk5ldnVaajJ3?=
 =?utf-8?B?bnBQdk9aMjVhZU9zLzk2dWxzZ0pBRGNFd1FNR1BNcWI3QmVYQVhiMmdiUS9X?=
 =?utf-8?B?dC9ZS2hvbjh6UVhLVjZmSTJESjM3TklRZ3p2dW0yVGM4cjc3UHNnR1IvMFlx?=
 =?utf-8?B?Q3ZKKy9zUDcwa3dUbjZ5RnBuQ3ZzSlhoQ2FKRmhqVmJJRGoxRldSYmlsQjBk?=
 =?utf-8?B?MU5mTEQ2ajlKaHNVZllEUUt1WUZDblZHWGlqTXZzdHdDUXpheFVzK0tBbDB2?=
 =?utf-8?B?dDNLSG5mbUIzQk5taHIyKy9mdkhlWEhVYThkNUNGS1VPZWtJc096UU9va1BH?=
 =?utf-8?B?MjVaMEtsbW8vWDFrbUlMaWFNdVZjb1Y1bWJNZENVbmNOM0dtRHFCZnV3Vkxs?=
 =?utf-8?B?NkNDME05dG04MU94S0RZVjFoYUl3cUQwZGoyc1hnaW5LdG5RcWNiZHJLZ0t0?=
 =?utf-8?B?MzFTV200T2hjdDB6U1c2ZE15eEo3b3RUTHh3U2xpYVc2V0ZNTmFnRG1HK1FJ?=
 =?utf-8?B?dkZ4aEMvUTRjTHVDclRHSk43cmJSSHF1cHZIS3JlWW5TcjV6dWZ4OEMwNVlM?=
 =?utf-8?B?L09kZ1FBN2lQcnYzd2RUVTBTUVNySGYrcEdyekM2WVA0c2N1d0R4Wkl5MmY2?=
 =?utf-8?B?aXBaSGFKaEtjQlBBVFg2VlhTSTRyVVNYMjdSdGlxL0tEWXkwdWxVUENXMENQ?=
 =?utf-8?B?OEdnMytQbmx0YUpETnR4YnB4akYyRGU4ODVHMCtaUVFQOVZMMGl3b2xyamJl?=
 =?utf-8?B?RHZ1ZEJlZEFKeWxPa3N1dnhJNTR6MHlUUlo3bFo3eFZ3cEYrRDc4V2ZmR3lF?=
 =?utf-8?B?SXR3TzJOcDJRWmdDdnM3ek1zalRpK3dycW9XSmprc1dud2YxNG9FRnIrdjFl?=
 =?utf-8?B?U1N5bW9zMXgrWXR3RXRKUFNNY2xsTDAvenBlaXFnb216aW9qc25QTVRXZnJK?=
 =?utf-8?B?bGN3UGRlc1BSNkV3VTgvUXp0RzljN3IxS3NYSG5VZCtRemg2RzdsNUUxR3VL?=
 =?utf-8?B?eXNMZXlYc1o0bXEzeDFaenhiMk5HOXQrRldFSGdocHhVVDR1bnlHVG9SeHlS?=
 =?utf-8?B?cThHSWxCTnA3MzlVSDNmdXFSS1VCTWJNVzhuTlFMQmFjcVlZSUMwSHJacnN2?=
 =?utf-8?B?Z2NoRDlvNytVWGZXRysvKytoZUdnZk9Mc3pDUUVaV3UwTE5FN2xXeWUxcHB5?=
 =?utf-8?B?WVBpSnMrMGFtelBTZlhZa3NoRy9hdHNCSGVMd252a2FmTUtZZVRXQW9HbEw0?=
 =?utf-8?B?a1VGeUJBRytxOFYvckExQXQxZ28wSDlkZVIrdUxMd0t6SjRYMUJoaVJOaHZ2?=
 =?utf-8?B?Vmg0N0R3VjRHMncweHFMdjh3K3RQMmNheG02YmxQR1Z1eURaY2hWRHoyRmVj?=
 =?utf-8?B?V0FFOEl6Z09hWThTcjJuMWVkTUFWYWZVdlJCVHI1SmhyNDA5dThoQVVuZVRs?=
 =?utf-8?B?Nkc5SGU4clJRWnM1N3JsdWdpOFF5TE5ZcTdPc3RCTzlmclJwRjVNdUM0bmNQ?=
 =?utf-8?B?U3IzbmVXQm85OEdHcnVicUtSaHNES2wzL0N3UjUzNTZncmRONlY2K2h2dHRC?=
 =?utf-8?Q?ciak=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc0008f-f226-4f45-8eda-08ddfd0c303c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 14:51:35.0044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBkM96PN6TgM8GcxcTWw7BycAczxiA5OeG/oQCBWMBw2rss/nbsb48q2fYHRgohl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8897
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

On 26.09.25 16:41, Jason Gunthorpe wrote:
> On Fri, Sep 26, 2025 at 03:51:21PM +0200, Thomas Hellström wrote:
> 
>> Well both exporter and exporter has specific information WRT this. The
>> ultimate decision is done in the exporter attach() callback, just like
>> pcie_p2p. And the exporter acknowledges that by setting the
>> dma_buf_attachment::interconnect_attach field. In analogy with the
>> dma_buf_attachment::peer2peer member.
> 
> Having a single option seems too limited to me..

Yeah, agree.

> I think it would be nice if the importer could supply a list of
> 'interconnects' it can accept, eg:
> 
>  - VRAM offset within this specific VRAM memory
>  - dma_addr_t for this struct device
>  - "IOVA" for this initiator on a private interconnect
>  - PCI bar slice
>  - phys_addr_t (used between vfio, kvm, iommufd)

I would rather say that the exporter should provide the list of what interconnects the buffer might be accessible through.

Having the p2p flag set by the importer was basically just the easiest approach to implement the flow, that is not necessarily a design pattern how to approach a general solution.

Regards,
Christian.

> 
> The exporter has a function to run down the list and return the first
> compatible. Maybe something like
> 
>     struct dma_buf_interconnect_negotiation {
>     	   struct dma_buf_interconnect *interconnect,
> 	   void *interconnect_args,
>     };
> 
>     struct dma_buf_interconnect_negotiation importer_offer[2] = { // On stack
>         [0] = {.interconnect = myself->xe_vram},
>         [1] = {.interconnect = &dmabuf_generic_dma_addr_t, .interconnects_args = dev},
>     };
>     idx = dma_buf_negotiate(dmabuf, importer_offer, ARRAY_SIZE(importer_offer));
>     if (idx < 0)
>         return -EOPNOTSUPP;
> 
> Then you'd 'interconnect attach' with that compatible item and get
> back an attach. Using container_of to get the specific ops which then
> has a function to get the address list.
> 
>    attach = dma_buf_attach_interconnect(dmabuf, importer_offer[idx],  &dma_buf_attach_ops);
> 
>    if (idx == 0) {
>           xe_vram_ops = container_of(attach->ops, ..);
>           struct device_private_address *addrs = xe_vram_ops->map(attach);
> 	  [..]
> 	  xe_vram_ops->unmap(attach);
>    }
>    dma_buf_detach_interconnect(attach);
> 
> I can imagine some scheme where if the exporter does not support
> interconnect then the core code will automatically look for
> dmabuf_generic_dma_addr_t, select it, and supply some ops that call
> existing dma_buf_dynamic_attach()/dma_buf_map_attachment()
> transparently.
> 
>> So the above function mimics the dma_buf_attach_ops::allow_peer2peer
>> bool, except it's not a single interconnect so we'd either use a set of
>> bools, one for each potential interconnect, or a function like this.
>> A function has the benefit that it can also provide any additional
>> attach ops the interconnect might need.
> 
> allow_peer2peer seems to indicate if sg_page() can be used on the
> sgt? It doesn't have any meaning for an importer only using
> dma_addr_t?
> 
> In the above language it would be an interconnect exchanging 'struct
> page *'.. I'm a little confused by this I thought touching the struct
> page was forbidden?
> 
>> Is this to not overload the map_attachment() and unmap_attachment()
>> functions that otherwise could be used? Is it because they return an
>> sg_table?
> 
> It would be good to avoid going through APIs that use sg_table in the
> design..
> 
> Jason

