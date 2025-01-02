Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F19E9FF9E0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 14:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799DB10E3E3;
	Thu,  2 Jan 2025 13:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ICjmcQqA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76DD10E3B4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 13:39:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7xVuhVoFdMKDkiX9IXhih57agcMMNRH+T6TogjpmASHxECYxVodcxhuuG1yzKKnFOljAYBuZoNZUQKXyfiLdckrlWM+/VS9FauQpCrbHV3U5KVa+j4D5UGEtm5Uvz6Fn7sZkA8//aAqtQIkcN8kokY/VKtGGAsZp8TqJEi9A4yl0hhVMI55i6bosnBeLIHJQY/5XUTo6jACvR+rzC9hUvxiIiAzif9UeJnMF1z8QVOW2JHY0/TMXcJX3OvkXmwXvkM8wXnPwouoEWgzovO0CpPGMjcLyevaWl51J7EfnXjgHvnsUQmQ+o4bzoqs4aNm8Q6RiyY/SKFzQ+n7+S4E8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wb/ra7Vjkw46FGNVvSucpUeuYunfZTt8HPTFrpGSinA=;
 b=nLhll/fQvfMblxTd0Fdr4Xjqw26DceDZgy7GyCVY+UTgXVEeiTeS+TLvYzMSrOjd9sswNSpeFmsM0+mWQfDVXiyPHQmdBuKCDHyyTrOsJxBY1CtGJ8HLtzrh/ph6H7WkmCH+V6FnKt0DCTbnNRXZ4+6hSxWVMfurjeBxy8EpuWH3auHziDyXMIx2P+hR5YqK28OzE+P94YqMJlToP0GuPpqPk6UJny1EteqM141E+iWwjprEO8gxbhDiCgecTtiMKYSt/ML1ZX1aKT3QHwDclZwHBAIVWEksL08OfmhO/xJV6I0e3O7GHk0BiqFVfL5PLqsXb0wW88VJz9uUH6wFDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wb/ra7Vjkw46FGNVvSucpUeuYunfZTt8HPTFrpGSinA=;
 b=ICjmcQqA7qf7o2+vYzokkR897Bk/zmbwqGoRcaex/pr1CBKvwrxP9zCKHvsHmO31yhwtK35mYyCd2SZGo96zQZcSV7qET22vE/LxE53ueHO/rFSRl2aup7rHskfTvNGBGWOoUJQDsFxk2buMidNZwc3BDuvGLkq/1eRZWFk2uhpDnkIp4JSSn47CaE047e6nuKFEIzmAn+CCSbGoTWd6Kaj4Ab40aJ4Z8N6lqxuWOoClLpp35CikpwatJycNBM/PnBXP/9lHpanDApEYamO8C/fxlFCIstNPCEdmEqB7iw8OhcXRww9DXLrdPgS3A9RysBYUZoMbVAcxaPGqJaeHSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MW4PR12MB5643.namprd12.prod.outlook.com (2603:10b6:303:188::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 13:39:53 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 13:39:52 +0000
Date: Thu, 2 Jan 2025 09:39:51 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Wei Lin Guay <wguay@meta.com>, Keith Busch <kbusch@kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Dag Moxnes <dagmoxnes@meta.com>, Nicolaas Viljoen <nviljoen@meta.com>,
 Oded Gabbay <ogabbay@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Message-ID: <20250102133951.GB5556@nvidia.com>
References: <20241216095429.210792-1-wguay@fb.com>
 <89d9071b-0d3e-4fcd-963b-7aa234031a38@amd.com>
 <Z2BbPKvbxm7jvJL9@kbusch-mbp.dhcp.thefacebook.com>
 <0f207bf8-572a-4d32-bd24-602a0bf02d90@amd.com>
 <C369F330-5BAD-4AC6-A13C-EEABD29F2F08@meta.com>
 <e8759159-b141-410b-be08-aad54eaed41f@amd.com>
 <IA0PR11MB7185D0E4EE2DA36A87AE6EACF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
 <0c7ab6c9-9523-41de-91e9-602cbcaa1c68@amd.com>
 <IA0PR11MB71855CFE176047053A4E6D07F8062@IA0PR11MB7185.namprd11.prod.outlook.com>
 <0843cda7-6f33-4484-a38a-1f77cbc9d250@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0843cda7-6f33-4484-a38a-1f77cbc9d250@amd.com>
X-ClientProxiedBy: BN9PR03CA0387.namprd03.prod.outlook.com
 (2603:10b6:408:f7::32) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MW4PR12MB5643:EE_
X-MS-Office365-Filtering-Correlation-Id: 6114e894-f632-473a-37f8-08dd2b32ef90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGtSbEw5RDlMVHIveXNyWVdpRnR1c29yVUg5SUN1Q2xLTnJPMEN1MmZzK2JG?=
 =?utf-8?B?QVlsVkM5UWNiUGxIdW91ak5LcGEvQ3ZiZ0ZKMUlxNHJxaUM0YWgvaVZReG43?=
 =?utf-8?B?THhOVUp1aSsvNnFPWUhhUWpTQTV4Wk1LWnl4VWhNaFdnUXJQMzUza09LN2VB?=
 =?utf-8?B?WHFnbnJ0c0p4R0ZJTGdxbVlIL1NmaldLcVRHdHo0OHRIL1pTZWcvWXUyZ1VJ?=
 =?utf-8?B?SlAvOXBRU2JzeXFKbkdPWlFseGlCdTEwK1RNdXBHbjdVOE9zQXJGUnhNcGpr?=
 =?utf-8?B?UjVMQnpBWU5iQ2xKemxVbHJHbGJTcHFwOFlPeXhsVkhjZDByVitKNGR6ZFlU?=
 =?utf-8?B?UURMZ3pGNCsyYU54MnlPRFA4VW9LU3V3ZFdndkd2Yk5ZZ2dwOUVldHlNRXFy?=
 =?utf-8?B?bFp1OHFWYVFsdnZJckdwc1RJdWJEMDVxN1o4aTdmc1A0VHlIcm5CTVJCUHRj?=
 =?utf-8?B?dERnMS9PdXlvaWQ0Z2tuY3hkdkozaHBQNTdNTkJGNTMwUGFvcExJazJSQUFF?=
 =?utf-8?B?S1J0U3JwRG9udkQ0OW10am1zSFE5NU5ZMjNVWTZWcDlRc0VZUytubk0wRU1U?=
 =?utf-8?B?angvREZuK1NTdkNXcDNEdTkwODhRcmMwMXhWQkg1ZDVDNEh2WmhrRm9KRS9M?=
 =?utf-8?B?ckxwSFZSREh0VFIxN2lGTDk2UmhjdTBEYjJROFBHVjE5Ymd5VTRINUNwY1lx?=
 =?utf-8?B?LzZlK3AxREVkWUlCU1FKcXlKOWR2VldaenkxUTF5TWpHSzFqREdSeHQxbjV4?=
 =?utf-8?B?bml0dlk1Tzd2cGFvNHc0ejJtMnZTMWxHVE5uK2xScWw1SS9TaTg5OXI2TGFk?=
 =?utf-8?B?RzdRZHNVTGYvWTR3M2lqZk4rYUVKNXVLQ0VpSlkyeDRrVVRWemZnTWFFL0dt?=
 =?utf-8?B?Z2xscE5qdS8yK0ZtcncxNHdSWTJGRWVHSHM3b1dIbVZmMXd5NTRueEJZaGFR?=
 =?utf-8?B?WEtkdlN2eTFpcm5DOWV3QmFMUWxpeExHTU5NelBXbDBnVlFNaVRXMlVuaFpi?=
 =?utf-8?B?SDJrRWZTZlNvZUJ5UENTeUdzNUY1QWFpeno3MnNES3hlSHJSL3F2bGVuMHcz?=
 =?utf-8?B?T3hHUllNb2wxRHhYY2J3cFNzalBrY3RWM2pUUEMxZTRFMGFvUjQxZXF0M0U2?=
 =?utf-8?B?WSttWFlaWnRxU0s4TW8wODFEQW0xRWlnZEp3LzlncXhUQis1d1pUcTVIcU0y?=
 =?utf-8?B?Vkp3UDhrYVFEY3JBMmlYYy9abWg2YTJNcitCRWlkZDcyL2psODNnNEJoeVZx?=
 =?utf-8?B?MzRIeG9EYkM3Slpvd1FYT1o5UXJXS05MVGhFTWVrV0wwY0xGUUVTTjl3ek5J?=
 =?utf-8?B?MDlzWTZHTXFjeTBCQVdDeHZlNlFmajU3QUFkWEJ5dmVRNnRxWGpIeHFYMHN3?=
 =?utf-8?B?bEdUN2NLOHoxUFUrcTlBNFc4RkE4NGpqVENYZ1lWZjdCMHhjY2pneitWbG5H?=
 =?utf-8?B?UHVIZ3RMYkdXS0ZNK1VEbW1QU05WQjJ3M2s3emFuQURHS1YvUWRvYzVrK1U5?=
 =?utf-8?B?czk1eVp0ajVwRFZPSkp4aFdSREtlRFlvT0owVlFPcmNIRUlDVzlCN21CRStq?=
 =?utf-8?B?NXdYZmhTd2hURzhVQ3IxeTU5REpNWEFJM2lCYVd5UTdPdkVuQ0M2VnJwRXJx?=
 =?utf-8?B?NWpnNm9rZjQrR2ZVOWdyWU9CU2J5aHFvQVREdTNMcUdXK1V6YXFra3VOcWFT?=
 =?utf-8?B?ckJRdmo1Tm5TdXErSXI5MWZzbTdpTmZCbFFUalExbU1nSHRXV0JyMDdyeVl2?=
 =?utf-8?B?WVlmclZRbE15TUd6VXdpSnUxUWtWK2hYVGpranZwRm9VdkQ2L1hHalZLOWFm?=
 =?utf-8?B?YkFJbldKZlFFWFQ1K2ZjTmhERGpBc3VJVjZqcU1aQVJYNks1bEx4RXVVNVlx?=
 =?utf-8?Q?YNPYMrNIOJi9P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVpsM2VkU1ErMnZ4WGFpeEdqbTBLbnNHWGpxcXd3SFduNTBpek1IcXFsa1lC?=
 =?utf-8?B?bzM2aTQxdkdMRkVMbk9RSlYxVUI5c1NYaWMvVUorb2tEak9JWVF0Z2RaQTVJ?=
 =?utf-8?B?UVF2MFc0RHFqb2kzMFlqZmZEcHRHSy9yQnRPTWk4TXhGQVM0R1NFRHFRVTBG?=
 =?utf-8?B?aWQ2cFp5RGhoUkxIYXFLZ1lUWWcxUnI5MVNqcnRqdzJucjhFSkZUNmdaZG5G?=
 =?utf-8?B?RHZHQUdTZW1ZMExvMlFJWTFPOU5XdFZvODFqdTRQUHF5cG5OdFJmS2VlcGxI?=
 =?utf-8?B?MkhreDlhcHNzR2taUXJGTytITWl5UmlQTUxiL2h3NUNkL3M3TGlaV2ljYmZv?=
 =?utf-8?B?bEZibnBzWjR4Nm5EdnJrSTVCR3dFTngyZitKL2oyU3RoTEF6TG53YlREaWVJ?=
 =?utf-8?B?bnlVWDcyWExZTUpQNCthQmpwNCtScnhmWTNvbERqNmpxSDhMY2U4OE9jK2R6?=
 =?utf-8?B?WHRjc2hDYk9LTGQvaWlHV3lqanBNc3UvQ2Zmc2VFSFVWb2ZkY09mbFEvRzc2?=
 =?utf-8?B?K0RESGpYVlJrd3FBZEdTeXhGbDJaYlVXY3o0TEIwc2k0ZGs1Ykd4ODdwRklP?=
 =?utf-8?B?R2lLZ25kWkY4cVQvaTdySHMyREUxVExoNWtOSjhJeGVvY2pvMGNaQk00UW9s?=
 =?utf-8?B?M2Q3QjIzemxYZm1PbTZwYjRSKzVmNTBGbEZyaUFHMzBXVE91bDhQaEVzVEpY?=
 =?utf-8?B?YjRsbHRBcU0yb3VjRmVSSDNrT0JQcU13cG5nNEVmWmlKV3M5VjlQcUVPZ0hw?=
 =?utf-8?B?WXFLQ21mYXBUYlpmckNEVXBCTFdTVURieXBmLzY3S3FUdFJpb200OWpwcWJn?=
 =?utf-8?B?VksxMWppZUpCbXlVUTFycW1PR1NWRVNOMFV1TDNLai9qNm9PMlBseXFNZUJQ?=
 =?utf-8?B?Z3FBYkdRVHNkQzhPQ0JxNFIweFozSThFWG8zNS9UVUpqbkhVa0IvaUYvcVQx?=
 =?utf-8?B?eGFZR2FGeDJ0NmhCVno5TVJDVjg1TnlWUzJyWTk5Wll0TnVyWVNjeE1Bekxy?=
 =?utf-8?B?OU44MVUyQjcweFF5UWU1VlNvTmlsWm5sS0ZSbjFXWVFlbWlmY3FleTNOcXJS?=
 =?utf-8?B?ZzlmSUNROUx1MXRrUGozcTBPWXQvUVdOSXVSL3FWZXE0T2cvekxOSGFBem5Y?=
 =?utf-8?B?cnVkUDNFK1VKbVpTSEpxY0JycGxQdUlzWnFnRnAxMHJ6bnhjQXZ0VkNnV09M?=
 =?utf-8?B?U2hoOWJMQzF3NGJGRGRRaFZocFduQU5ucWEwZmdjQUh5T0liWWJiSlhHVGN4?=
 =?utf-8?B?cG5tNUE0Uk1FRU51UUhxdzUzK2dVMUgwbmduUWFRMmVzanQ3cW9HbFFnZjFo?=
 =?utf-8?B?N3Q4K25tMDdLZ3ovT0dNUDdoZVZBaUlRQ00wZUxuL3pOWnFrTGkySmVsUUVT?=
 =?utf-8?B?cVpwbHY2NkcwVjkrcFpnTVo4OG1FVGJBdStMYTE2TnBTQUIxTDhlb1hZYUx0?=
 =?utf-8?B?YWxpZGZoekJNZEtoZGcvSk0rQnZUTWFrNGRsMjRjMlVBR2huWnJheU9pNU81?=
 =?utf-8?B?SWZmM0REZlVvd1JCTXIvVEpLV3NHckhOelBCeEV3RklPRjNLUFc1eHhiTW9L?=
 =?utf-8?B?UWJuQnEwdkJlbkZSc3d2ZVR3VGx3L3ZuV2xyMnhEUk50alpPdWFzQ25MR2pu?=
 =?utf-8?B?SDZTRVVLUXdmSFo0Z3BYVW1DNktOTkdudW0rZ0doY1lUWlFER3RZMGVoZDY0?=
 =?utf-8?B?dkpxaWFwdTExR0FsV2JCMk1GQmozRGIvaHJMcGhSMlpuaFp3VlU0SEUrcFJs?=
 =?utf-8?B?TjVFSUM2TGNBSWRVUGtLaGNJdGY4R3FSTkZ0WmNaRkxBeFVWQzBCbmJGVkNK?=
 =?utf-8?B?Mm5jeVFWUHF3bE8xUmdNblc4ZG9vZE9MQjRIbGxwckxtUWdHY2JkUHltNndu?=
 =?utf-8?B?ZkZzOHR1bE1WM3hDOUhEVjQ4VU1TdFRPNUtFU1hhZUhWTStybkQ2clRROXJ1?=
 =?utf-8?B?UzVKZnNvZHF1ZjBIOW9OdHYyRDMvQWRaVy9tNDA0Zk5vcTF3R1RZcWVjcUN0?=
 =?utf-8?B?T0E3VmtVL1h5eFNoSUNOZ3VKT3M1UW53c29SWjBYMDNHc0lLVnpNb3ZwdFRj?=
 =?utf-8?B?eUJQUDIvUmpXNGNSVHNVMTBCV2NlNjIrSGhuNDg3UU41YlQ1WDJwKzJjSDkw?=
 =?utf-8?Q?/Y7g=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6114e894-f632-473a-37f8-08dd2b32ef90
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 13:39:52.5481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nsIStHaMhMVO8Jt5j0suY0fxk3lZSgXfewCbeJk65U3EbXruzHCKtoJBV2JtPfVF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5643
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

On Thu, Dec 19, 2024 at 11:04:54AM +0100, Christian König wrote:

> > Based on all the above, I think we can conclude that since dma_buf_put()
> > does not directly (or synchronously) call the f_op->release() handler, a
> > deadlock is unlikely to occur in the scenario you described.

Right, there is no deadlock here, and there is nothing inhernetly
wrong with using try_get like this. The locking here is ugly ugly
ugly, I forget why, but this was the best I came up with to untangle
it without deadlocks or races.

> Yeah, I agree.
> 
> Interesting to know, I wasn't aware that the task_work functionality exists
> for that use case.

IIRC it was changed a while back because call chains were getting kind of
crazy long with the file release functions and stack overflow was a
problem in some cases.

Jason
