Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DDAC6A06C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219A110E4CE;
	Tue, 18 Nov 2025 14:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="M+SC/lt4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010044.outbound.protection.outlook.com [52.101.56.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951AA10E4CE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:37:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hc8JXXKZQn7KNj34fN2cwTpuWf2Agr+mjtScoRAM15OwLyPxEKCnU8HTCP+lKWjrYAIEWK94xdr5GKRBmkslzIorwGAbQ5gR8CPb802dJaXFZZ5eqrGOxONDkow7VA9AqPEqCjqx3CFbbIcjjEMa+Ms/ySBAOo/0blYMxvhEsrRwOLA3HqPjvP4erX7qju4vZ6oW6yTIwwNUTK/LKDSBI3wHBvzP+U7KnNLUHenWGWvm5xN3AX35ciAAVnh3qp5ivmPCjPuRcC6r/lc/CdTFoPzq7cdR6tyxkYhdm9D71iiSZ5Ol95RfxPZSUrXPpcYetoccPDqbwu3PkdA+SaF6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sojIQ70amDwTTEfvkrexj0JUAUml/vTid36kXPgXSS8=;
 b=RTT7JatR8Z3xMzsZWVzpiymTD0hWKeczibedn+R7qzLlvhvgm3wWL5WVxa99FaSaCU4Z+aPMqtf1V9Aii2lo4nBeeI2j7JMOMvm+lGwEDj9c1gfsMDqxs1eTLXxaHwC8mucOdT2FjjZupKeokr27+Pczp51Dl9jZvIEQbg0eOIvdQjaOX7/TuDlVBnEvyQFD/GyQiuJNAToor3WHleJJc2FS+33RTiKYWnuMlAsBBTFuBbUi0qBSQwGfhu3KsF30y4iN2F5sQdwIcGsbA1oaj3i94I1jrQiyFtXraf0kt1KsYOtTEKyEoeUeS5sTkOzZUavOY2Axfuo32LZmHXzQVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sojIQ70amDwTTEfvkrexj0JUAUml/vTid36kXPgXSS8=;
 b=M+SC/lt4/dFX5FJ7ujaLuHAJ86pswPr5uAznuJ6V6jKnNCKBUt47ZUbvPROMscDwVYFdKvdUpQ4SB4DIVgTUTKJA1VCYXlWXuaELaaVn39JYKhtrfy8/JJYYocUpTmrMG1CnhME/yqBe9Mh3tZujeEF5uh29lLtFYPcLNTDv2Z0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV3PR12MB9260.namprd12.prod.outlook.com (2603:10b6:408:1b4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Tue, 18 Nov
 2025 14:37:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 14:37:54 +0000
Message-ID: <3599880e-5b50-4bad-949b-0d3b1fb25f3f@amd.com>
Date: Tue, 18 Nov 2025 15:37:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/11] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
To: Jason Gunthorpe <jgg@ziepe.ca>, Alex Williamson <alex@shazbot.org>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Krishnakant Jaju <kjaju@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 iommu@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, Alex Mastro <amastro@fb.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
References: <20251106-dmabuf-vfio-v7-0-2503bf390699@nvidia.com>
 <20251110134218.5e399b0f.alex@shazbot.org>
 <da399efa-ad5b-4bdc-964d-b6cc4a4fc55d@amd.com>
 <20251117083620.4660081a.alex@shazbot.org> <20251117171619.GB17968@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251117171619.GB17968@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0773.namprd03.prod.outlook.com
 (2603:10b6:408:13a::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV3PR12MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bdb606f-d51d-4fa0-44e9-08de26b00ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEhZUURmZE1MMmNlSCt4bHI2aFNWZmZBbjE5a0xaUXQxcElzWVVmRUVBcm9w?=
 =?utf-8?B?UDYrYU5xaDVlN3lLUVJva2hOR0JHNFNiSnZ5Y2JHcUU2TzlyS1JuMjFnSmI1?=
 =?utf-8?B?Tkw2RWtrSjlHTjN0U1dXaUlMTm1OL1hiMGhRZjk2c1dyU1BjbVBZRmU4ZmVE?=
 =?utf-8?B?SFpZOStxN3B0Ym1MOFFtazMxRWFrU2FhcXBYcHdBOWZJMXBZMEYvczZER2dZ?=
 =?utf-8?B?eVJDbGo0MW16ejJOUzZFOWczb2RNQXV0ZVNvVmFNVkh2NGV4RjhHSnhFSnVo?=
 =?utf-8?B?aGt6cTZaSlViaUk1b2kxelc3T1VINStuSVdyREFQYUpxdHl2MEpOdi9sRFJQ?=
 =?utf-8?B?OEQ2MW9QWW1DTzFJTDcyNlRHVGRSb3huZmJSckZCK3JxQ0xXOTV6bitPS25x?=
 =?utf-8?B?Ky96RW5ZWXRMc1N5L1JXRVpzb3RxbG5iN3p5aHNQWFF2c1M4QUNadE5PMkRJ?=
 =?utf-8?B?ZVV1MjJvdnpJUU93VnFmYmVidWN2cHM1Nkxqck16a3JGMi9wZFMyVFBqZVAz?=
 =?utf-8?B?ZzJ2SVd2TFdVQW0zSG53UGZEcGNHUzNnTlNWUVVQeWFMbnZtQkNOOEV3VnV3?=
 =?utf-8?B?c3lVUmxEczhkQmNVNjZCMW1ib1pTS1Q2L0pWTGhYWms3MUVnZzR4SnkrOWlX?=
 =?utf-8?B?Q0x5aHRTVGd2QVlWWEpHQi9mVEZVZStQTEdCdVpybDVLZWVKUFcycFBxN3FS?=
 =?utf-8?B?bGpMNUViVGU1czgrWjNVSzZZTTNpeDFPb2tzMytXNEpiOGFFdW5FM3lOVkIx?=
 =?utf-8?B?M0xXL2tSUUVlTlhUOHFvUHVRQUJ5cmc4bVBpNnhGR2hESEhZc1ZnTmQ2cGdI?=
 =?utf-8?B?UFA2a1U1NUVSVHpDOGVrSE1sMTkyMVpPK0VSRkNkQzFvLzBpSFZCUm0vVVNa?=
 =?utf-8?B?cVFDbGpIOHlQUERLWmRnVSt2clROMDB2V05kaHdCaFZUa1FhMDdoL3d0NzYr?=
 =?utf-8?B?L296SXQrdVN5WmREWC9XRjNEN1gwLzEvVFlpcTFXYkxlVVpVVXM2K05MdWZy?=
 =?utf-8?B?a0RidmZOSG5QMjVPWlRqQ2dHOXZQVlFyMXBKR1U3WXJlZmh1OU01Z0FMSTdh?=
 =?utf-8?B?WDVNME5PQVZWSFBXYkUvclBQUkxqYW82NnJlR0lXZUdqV1R2T0drWXE4QXJu?=
 =?utf-8?B?MUdleHNPWCt2NVl3aWdDM0FnNC9rb1pUOFUzV1VFKzJQZjBaWlVFSXA3dHVK?=
 =?utf-8?B?WnNIWFBmNXRpdWt6Z2s4Zk96RWh5VysyaHFUTUFKL3oxNmVFdGNQRERQeU15?=
 =?utf-8?B?UVJ6UzZZeTgyWFM4cXNqZWVLSldwNm9nbzdxR3U4WWV2WDQ0S0ZpZXFkMlFo?=
 =?utf-8?B?Zm5JbmdEL1d0SFdjUHkraUlpYnNNUmdzbDBHb1pQTEMvNEZITEpKNEVVbm51?=
 =?utf-8?B?bWlVYVAyVjhBM1RFRjNoeElyWGpJai9GNUpZRUUvdHNpeWI1TmJaNmJVRnc2?=
 =?utf-8?B?VnJGbFpYWDkyRU5jQ3c2cC9PYWlISXErbS9JeWpzT3YzempJblV6R2pZT0cz?=
 =?utf-8?B?QlBJN3dZMzB4R1kyWWVQV05NNUNVVDN2ZnlVNFNzSkpBeU5hc2ROYngrVWVz?=
 =?utf-8?B?WTNZRTRWNkQzR2U5UVJiNWNVZk1ZK28zQWt4MHNLT1hyMEVuek8vdU02WTB0?=
 =?utf-8?B?YmVEMmFGbm9nRkVLMVJ5dDBrT2ZobFFiNStiUTVGUjNwZ0psQ2VqUzk5eUwr?=
 =?utf-8?B?VFZTbDkxSUJ6SzNxUnMvZ3lzQm5JVG14dnQwZFpRcG9qeHo3RllyU3NqVlhl?=
 =?utf-8?B?NmpUNW13bEd5ZXgzZzRxWFF1N05mMnhVZlNqKzRWUkFHenV6M3QyTVRvUGty?=
 =?utf-8?B?Zm9qSkF3K29PL3NOaWFqVDFBYmUxVGYyRk5RYmcwc1VUQWx4aWRZSXdaa2dw?=
 =?utf-8?B?N2ZwbCtORk94bG40V3ZZV09DOGZhcSs2L0t6UWh2RW5KVGxsTEtWM0ErNDVS?=
 =?utf-8?Q?BUD9FRzKc8dcVQIUYlMaHtmYMPLBC/4B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGcxK01Iem94RjZtZGJjb0tXSzV6T3VkbHowT2NXdVM0WjlESEs4OFB6K0t4?=
 =?utf-8?B?aHdKQWRTb3gzS1dnQWQ1M1UxTHN5Sjlpb0R3aUt2WVhDSGZjQytJa0xVNG4r?=
 =?utf-8?B?SlhSTUFhSlIra2NmTlBRWHJxckQvVk1sS2k1eFFHbEFuZTFVUWdIUVMvZUFZ?=
 =?utf-8?B?WUYyemJnMWNta1lZRnVLVDhxbzZ0R3VLY3VwVFVVWEovZ1FDZkJmc2x0eWxu?=
 =?utf-8?B?YVJ5dGtxVWJPWEpGUi9LVmdQUDRmdFRZZjVGOFFaeDkvdjN5R2hDY2hBU3dR?=
 =?utf-8?B?dUdMb24wWldmRU9rTS9MRS9KSTFRR2I1cElHTjJYUnQ0U1V6dVIwcHptb3BV?=
 =?utf-8?B?djh0anFMVTFsWm9yYUxvVmZ1TUE0QnBrTG8vZVhHWjRQNGZBUDlYMW9hUkFs?=
 =?utf-8?B?eU1wV2pGNTY5Y3BmeFpYV1V0TTF3SENTa3BRNEdNdTdaM3hJRU1kc3Awc2ph?=
 =?utf-8?B?UHdMOFZXa2dlTW9ZOVNwVUljNnpSQjBkTExGWTNhWVE4L3ZUOGxIeUlHSGJ4?=
 =?utf-8?B?dTRDOCtucHRmMUdGVDZxS3h3ZTJxS01QRldjLzZqUkR3VldRbmtncjA4ZE1Q?=
 =?utf-8?B?dXlxVmZHemw5YnlDa2M2TDRLRGprTUZ4T0s5eDlSRnBkK3lCYjFzVCt5OEZu?=
 =?utf-8?B?U2hKaXQ4THBxeTFYZnBvOUNGN1pJY1p3N0VURnU0ZDlWNkR2a1dSME0wTUlq?=
 =?utf-8?B?RUMzK01NUVJLOGVQaDlmMWVFVkdrZ2lkTFVZNE1PaWtJUXBoRXFtd0NwVUlt?=
 =?utf-8?B?bmNLeFlQT1YzWnlqM0Jzcnk0YXV2NXVpcXpZMlQvV01Lb3ZadngwTGdHY2x0?=
 =?utf-8?B?cGpZWlVKalA0R0dnNXdnMXhybFY4YUU3clkycGxoTlNaRm1vVGd0QTB2TGN1?=
 =?utf-8?B?OVd2UXQ2OFN0TkpzY3NhYXREQnozNlQvZmJvTmliNXpZbGdQTVB1elVCU2RO?=
 =?utf-8?B?UmJ1Wk16V2trMzJxUHZHZ0VOaUt3S2JFYkp1dk1pQXgvb1ZmL0h2R3FvVUlO?=
 =?utf-8?B?OEJyUnB4N0VlbXpMV3RvenlxOC8yYUd1NWgvV3B4M3QxRFovZ3hlMkZ5UHl5?=
 =?utf-8?B?YWZOaDdKejRZeDhHU2VYKzBncDBIQWUxYmZ6VTZjNFUxZE14c05vRXU3UWJ4?=
 =?utf-8?B?cHgyTGZLa2dhTE9vbm9hOWE4QTFYeGRnVnZNb2U2TkVjRGxKVWhJNGRiakEx?=
 =?utf-8?B?YVJ5SHlDQzJKYTN5SHNNZnBlQzJIV2M0UnI2QXN2aTlqSDc1NitwM3ZsTlVK?=
 =?utf-8?B?dDQwckkrbU9naTNMRXRYQlNXamZjWWtBSDZwMUZxbFI1cVQzZlNBQjlkczlu?=
 =?utf-8?B?Zm53N0prYW1WQURoemx3bXNsYTNzYllGVnNNNVVmcmMvU2F3YnpQQnhJOEcr?=
 =?utf-8?B?K3FnLzZ2YmkwOU54ekpVR2hKY3UwTjN6bnY0WVJwc1VCWVExUWJISW56WE1Y?=
 =?utf-8?B?YitzYTI2eGpVUDdtZUhhcFFHbGxid0pycVVoNzhiVlB2a3p4ZHl0MXJ4SjhW?=
 =?utf-8?B?ZkJrZ1FCbFovSlI2U2dLNEE2M1BGUFFnVGlCUUdraG1kWFVkN0xIY2RySlRs?=
 =?utf-8?B?Uis3VFphWnNleVlINXBhQ2JNRWdibjlWemRBZTFQZzd6VzlQU2V1aHorNEFp?=
 =?utf-8?B?N3cvVGJyWHRZU3pYd09udjRuaXNjZ05ZdUhyT2xTVTk1aWJNNTdqZEQ5UUtI?=
 =?utf-8?B?RXloSW8vNWZvOHkrNGpNVWFGYzFvY0RHWlhXV1J5QkR6YUNobkZhWWo5aEEy?=
 =?utf-8?B?QXpvOTFnVnUzYlphdFlFbzk4Vnp6RzNWQit2aXo3SkZaZzdHNjVPYnYvYVpu?=
 =?utf-8?B?LzliTGJ6WEtTNnVxeTNQdEo3K2ZCSmQ0ZHk2bG9Zbk1zK1RGVVppOW14VUJU?=
 =?utf-8?B?K0FMQkhFbGFINzR0ODlLL0xZZWcza1pvTzBod1VvZ3N2eWE4dklWUytIU2h6?=
 =?utf-8?B?L1BKWDA4Yml4OWVON0NlWDQ4NzZyVng2eG5iMTdwS2psRUlXc1hLTjdqQU9u?=
 =?utf-8?B?VWZ0UVNTeGVqVER6dHVTUWY5Qm5yekUveW9nWWZHV0l2SnVydlowd3lwcnAz?=
 =?utf-8?B?RThmRkFDWUp2YjQzcFNnMFlPT2J0bHptT25pYi9nQm56TG4rVDBhd053T29H?=
 =?utf-8?Q?CZjzXlJnOmX+CsVpIuR3DgEig?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdb606f-d51d-4fa0-44e9-08de26b00ed4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:37:54.4101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lp3cxAYHodvzb7TqTXezTcR1s8lUWsc48CP5TpXXGWths1tQECeAz/fAW5OjNHU4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9260
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

On 11/17/25 18:16, Jason Gunthorpe wrote:
> On Mon, Nov 17, 2025 at 08:36:20AM -0700, Alex Williamson wrote:
>> On Tue, 11 Nov 2025 09:54:22 +0100
>> Christian König <christian.koenig@amd.com> wrote:
>>
>>> On 11/10/25 21:42, Alex Williamson wrote:
>>>> On Thu,  6 Nov 2025 16:16:45 +0200
>>>> Leon Romanovsky <leon@kernel.org> wrote:
>>>>   
>>>>> Changelog:
>>>>> v7:
>>>>>  * Dropped restore_revoke flag and added vfio_pci_dma_buf_move
>>>>>    to reverse loop.
>>>>>  * Fixed spelling errors in documentation patch.
>>>>>  * Rebased on top of v6.18-rc3.
>>>>>  * Added include to stddef.h to vfio.h, to keep uapi header file independent.  
>>>>
>>>> I think we're winding down on review comments.  It'd be great to get
>>>> p2pdma and dma-buf acks on this series.  Otherwise it's been posted
>>>> enough that we'll assume no objections.  Thanks,  
>>>
>>> Already have it on my TODO list to take a closer look, but no idea when that will be.
>>>
>>> This patch set is on place 4 or 5 on a rather long list of stuff to review/finish.
>>
>> Hi Christian,
>>
>> Gentle nudge.  Leon posted v8[1] last week, which is not drawing any
>> new comments.  Do you foresee having time for review that I should
>> still hold off merging for v6.19 a bit longer?  Thanks,
> 
> I really want this merged this cycle, along with the iommufd part,
> which means it needs to go into your tree by very early next week on a
> shared branch so I can do the iommufd part on top.
> 
> It is the last blocking kernel piece to conclude the viommu support
> roll out into qemu for iommufd which quite a lot of people have been
> working on for years now.
> 
> IMHO there is nothing profound in the dmabuf patch, it was written by
> the expert in the new DMA API operation, and doesn't form any
> troublesome API contracts. It is also the same basic code as from the
> v1 in July just moved into dmabuf .c files instead of vfio .c files at
> Christoph's request.

As long as it is only an internal API between iommu and vfio which also respects the standard DMA-buf semantics to either pin buffers or provide a move_notify interface then feel free to go ahead with it.

Skimming over it my only concern is patch #6 which adds the helper to the common DMA-buf code and that in turn would need an in-deep review which I currently don't have time for.

So if we could keep those inside the VFIO driver for now I think that should be good to go.

Regards,
Christian.


> My hope is DRM folks will pick up the baton and continue to improve
> this to move other drivers away from dma_map_resource(). Simona told
> me people have wanted DMA API improvements for ages, now we have them,
> now is the time!
> 
> Any remarks after the fact can be addressed incrementally.
> 
> If there are no concrete technical remarks please take it. 6 months is
> long enough to wait for feedback.
> 
> Thanks,
> Jason

