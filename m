Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A82C6F224
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 15:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05ACD10E627;
	Wed, 19 Nov 2025 14:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eHTkBcoE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010071.outbound.protection.outlook.com
 [52.101.193.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C332810E627
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNCisLbtgLv7+XSWBx6uIMlyAkRqs49RpNLx982MjBKEwzNF1UHw5hTCD90Wuq8AkcJqg6WpnYX/hOQBiCRc735RZhf/7tqLYM74wdN+f61biNH/ylJlQEOVm82uspZKP8ac0WOUMDZew3ol61J1M7zwqBcpun4PJxjdEugl+RpHarUbSP1VE6kIQXp+yFzIFA+r05S9yGRkvJC3lYXmbW1PiEdDC4osNGliCSS7W7uGNi1ugdH1IuKtfjAtoeJ6rE3j9T2JNYp1aE5BI16JDK36B4BLwPH9QqMriM1CWYCGp56PVbB4BrozsfiLDigx90v2a5UYaHETdAkOoYgtHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RodIlqiCVlrGXPsR3ERXgJajNGk+sw1kRTH5SeTDbhg=;
 b=JqQIAA3R2hQxXKajJZIZ5wjuOQBmZYbay5vDZ/o53ne78sNuTswv4s38RMVOzN6zVPpAZwmr7qL9qWCUHcXBXh/Pf8oi4pgDorX9HBtR0V9wSahhgRWQrEHd3mdi+F0nWwKrB2vOC5nq7V/uJjpYurcpvuE4CV4GAzmfLE6oqtOESzh0SjOc9elr5GiNDzjgi+P/9I5t7x0MMa3lpI0ImFlvmCOiXSSGKOTUCiGBtyrntkigQLgOEa/RzUa4EbXWrQXHE8XTMtaxo5z6rKB5l/4Ns/PjyGH/FOSiPAe14wdrF+WD1Ol9q+OOSq94yp1wzwuy4kwLgq1TGxxxPDUqLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RodIlqiCVlrGXPsR3ERXgJajNGk+sw1kRTH5SeTDbhg=;
 b=eHTkBcoEOun01arH6EyTQHDDCj+HijuB0t4CxtKWYr6hsV0CFgBUCvu5nditWV0BmhCM6cNq4MuIN83Lr/vhN5eWfBCCY//7JEK7oplYD5lfl+K2vwkcyr5Qk97o3d6qQr94oru4QG0KZbhj2gXd1yXkefisc6Lu8Wpn2qfqAVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 14:06:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 14:06:26 +0000
Message-ID: <ad36ef4e-a485-4bbf-aaa9-67cd517ca018@amd.com>
Date: Wed, 19 Nov 2025 15:06:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/11] PCI/P2PDMA: Document DMABUF model
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
 kvm@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-5-fd9aa5df478f@nvidia.com>
 <9798b34c-618b-4e89-82b0-803bc655c82b@amd.com>
 <20251119133529.GL17968@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251119133529.GL17968@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4343:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e99477-a4ec-41d0-1404-08de2774d454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHluUHVtR1pTcXo3VUZoOFNBTHdpcjkvMHViUXdXRm9QaE9sa2VRT1BiMlMr?=
 =?utf-8?B?ckxrOTNDRG5Xb1V0TTE0Z3BUT0hBcXJKNWt5K1dkajZreUM0WEp6bFB4T0VR?=
 =?utf-8?B?K1BzdmFzbVlFZkZhdGxXREVsTTBlSHRBWVQ2VkpTdmlsSlUrWHJvSm12SnRz?=
 =?utf-8?B?L0pXVWdHRTVUcDhJemwxZjBVTVVoY3Ntd2l1RG9Cc3hLeVBLLys0QnZpaDQ0?=
 =?utf-8?B?NE5jbFZTNGU0cG9KdklIUnpFb2Fvc0FUYVhXZXRrcUFlVm1XbFhLa1pOaEVS?=
 =?utf-8?B?S0pHbGlLaWdrT3hXbG1mdU45ZHRZQVZ6SWVWZGRhbVRYcXAyTW1wakt1ZWly?=
 =?utf-8?B?bVcyRlhpdWZXbTk1N0l5VEUvN05LRVZVY3YxSEZQVXpCZWdXNTRqZEppTXA2?=
 =?utf-8?B?NklLaVRXekNqU1orWkNhUHJuL1AwdU5ub015eFNGdGpmeG1MWVJ4bmV3YU5q?=
 =?utf-8?B?MjFuSmhueFBZWmQ3RUhlS1VFNnFWRE9YWDRRMDA2QSs0SEovL2tYMS9KQUd6?=
 =?utf-8?B?MnU2WXMvU1BKdUFQQVdQYWFxK1l1YjN2UzNPL2Y0OUh6RmtHNVlubkxiS3g2?=
 =?utf-8?B?MGNUcmFQWkt4Y201a244WFBPMHpNN2ZnV2dYSVF3MUhZamFJcmY4K3lnek5G?=
 =?utf-8?B?MTI1anowVUpzRk80L091UE12TlVMWnpLK0lMajNqUUo3U2RFNXFOQWtOaU9B?=
 =?utf-8?B?WjB5ejdmc0g2RS9JWTc2UWNlTWhHbWNscjgvWFIrejdOYzRwS3BFNU8zWkFP?=
 =?utf-8?B?ZWgxZlpEV2xxZzRoMFlHM1FqV0xIUWxQaUVMVGpKSmllVy91WnM4RHdaWmV2?=
 =?utf-8?B?RzlrL2hVVWRIZk1kZHZEUHJFeFdPZmpnZkhVVElhVnQzejRrMVN5d2l0YzBZ?=
 =?utf-8?B?USs5bTROZzdwWFU1NjBiZ2Jlc3VLOUlDd3lSbHpYWWxKS0l1L1g0aGRGQWtT?=
 =?utf-8?B?RU9ubjM2VDExakw0K2ZaREJoYTJhVS81UXVyTGcyalRpMEZ6ZHBPZ2V6VHZi?=
 =?utf-8?B?NkVJRTlhQ29SbjJCUThmb3luUTNwd1Y5bHlaWjJadTcrOTJGbmc1MEkrTGdC?=
 =?utf-8?B?elRvbERjTFZoQzhaV2VUdXJvaTl0SkI3MlRCR2VhU2ZiUnpPcWxBVW9pRGE0?=
 =?utf-8?B?Slc5dGcvL0xoZDhVS2FqYUVpYVFwdmNkdFJtRytXRXA0VEg5SWgzRnY0M0I5?=
 =?utf-8?B?NkJJVGVycENhNHpaeTV3eWwzZHB1NE82RkZuL1JVK244QVZjNFVEUWFvd3lS?=
 =?utf-8?B?MUxOTTE3RjA4TU5IL0hBb1o2THZLc2dYbFZoRFhkb1MreUJpTU1IN2haeUkz?=
 =?utf-8?B?WDdXRVFxRWhGU0Q0TFBUN1RDV0w1bmM5UE80Zys5a09ORm0weFpqVTBzb3hG?=
 =?utf-8?B?MExRNDlYSFRRN3I0U1F4K3VnQWxnY3V1V2dMWk5CL0I0UGxGcFU4RnJwckJK?=
 =?utf-8?B?bS9mZ3FRQ0VBNmJTaFJ0eGZGbzFLZVlSR0hhaUtRMHdua0txQ1BSaERQaksz?=
 =?utf-8?B?cTd0d2JoOXIrK3NMbE02Rmt6RTdpdDd2YlVlOExhazRvMDEwREd0QVd0cE9L?=
 =?utf-8?B?WjM0WUdOMldJRkM0TGVkRzBQRENWcm5kNnhSMzRickExMDA4ZVN6dVR0eUpv?=
 =?utf-8?B?WUJsVWpCQ1RFd25kUWs3Mk1kbXNrdzlLczNGd2Y3Z0NCTWc5YjRpOVptZlFs?=
 =?utf-8?B?MlFUYnUrTW9aSjhFaDhjQjZBSTRtaFFudHNMQnkzT2Q5eEpZRzluYXE0NGQ4?=
 =?utf-8?B?aUdQd3I4WmhVRmFIdUsvZjlqY0hRUVNDVFBjbVM0VnhFZjZLaWlPazlRcktp?=
 =?utf-8?B?aUxGUWQ5a1p3U0pydGFSY1VWdjFIQjhlYTFLbEhGVURkak1TUUZQZldKSW1N?=
 =?utf-8?B?WWtTbk5HOU96azlpdUV3YWFmSUNlSEZ6dmRXZWRpZHhnUVQ1eVRTQ0hhZ2Mx?=
 =?utf-8?Q?1dI5GZIUeHeful+qKhKNxmPZYGtl7+jc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEdOenRHUTVIcXFWYi80V0pwMXdWRDg0WHB5Z1IraVU0RGZJR3FJTXdRL1ZT?=
 =?utf-8?B?NGdqdFY3UjZpYkNHNkMyWTI1bjZZdzBRb2RvTk5pUmpzMkZlbTY3dGF6LzNO?=
 =?utf-8?B?Wk8rcVJ4VnR3WE84OTNnZHhRTGJJbGpTOWxndm5xWUt4YkdCZTBIZ21STEpt?=
 =?utf-8?B?c09Ta0NKeENvd3RvYzBhaDBGa2IwOVpwRGFrZW96UmFBMjY0MkhTYWxoMXJx?=
 =?utf-8?B?d1krbzZtVEU1clZhSlZCV2luQmpIWUFkZWZJV0VSaHVWUlcwdzltY1dTZFdE?=
 =?utf-8?B?NTlveFNOUnRyNC9hTjE4bnhDWURsenlqdTZ1c2thOVEyZGJVNlRNaTR0VEVi?=
 =?utf-8?B?Ulp5ZndLcjRSWDA1WHpUVXJiU0JhRmozSWRzS1ptdXdpVEZodythOGltWkRF?=
 =?utf-8?B?cnVobEdpTFMxQkNvOWxnN1VDdzZTbDNxc3RqVUw4WjZSUGJtMkVpMWpScU5m?=
 =?utf-8?B?NVZ6YlJMTDRpdWRvditIbVMrRU54eFJhVGNCcHFDNmpGVkJISEVUaWtzQ0ta?=
 =?utf-8?B?ZlVOeWtUZzhCclVaRXcwWUxIaWdUOUJGSSt0cGJweFZXY0FmaFAxTmd2eDA5?=
 =?utf-8?B?YWxVR0pSRjJlZitjMTNyd3dGS3haR0JZTENOVlBZeVVJc3VOZGVFZUZtWHpR?=
 =?utf-8?B?V0lXbGNiRmp2Z2pHVW9hbE9GQmZWRjRWSFNWZGlaLys3c21hY3lCbnpLUzdx?=
 =?utf-8?B?RUNzMVZ6ZzBqYytWQlpUdnNDMk5IdEFCbzJ2TkdDN3VPNi9yME1WU09SVnNy?=
 =?utf-8?B?NEdVZDVHRVAzeFBQNU1FbSs4MHdRWmdHY0NkdkZ0R3J0dkJ0ZVNHMUdWbUVY?=
 =?utf-8?B?aWpJSVpHQmh2cmE0K0JUVnJGMkJKaFByVUFpT2p1SHdWMnp6V0FyYllDWlFJ?=
 =?utf-8?B?L25XUzl0LzVwYkYyMmtHa1E1VWFleTFlQ2xNWEsxQ0lQbFlZdkhYMFNwMWJa?=
 =?utf-8?B?L0dNZjdmVjczWDBCWHcrL2dsL21KMFJ4VEs5Y1ZxN2Y5RjlURDZSdDFJK3lo?=
 =?utf-8?B?WlNLQ0RiREczeEMrcE9YVHdCeElIYUgyYmJ5a2N0cWIzZnZtSXpkNEswdWJK?=
 =?utf-8?B?eEFoY3FPYXBnRUFERkJyYktjYnN5V1BqbXBqSDFXc2tBSGV0dUVYdHM1b0dr?=
 =?utf-8?B?bVZWVVA3SUtHQnVrSVRjemIreWNTeDhQK20rL2VVMWNveGZZMm5EbzBmUlFX?=
 =?utf-8?B?UHRjVWp6Uys2NjMwYktKclMxdWt2RWtIYUZzTG1tUGVWUWh0VGNPUzBPbThW?=
 =?utf-8?B?SERTdEpUN3V3c1BDeDZLWmFQczJuNnd3R0VRd3dFQWhRd1FaVytXTlcybU9y?=
 =?utf-8?B?UGpETTV2OHNlb0QxMGpJQVRIUm8rWTNjdVRzQVcyVEVpcFl2OWl6bVFtcEFw?=
 =?utf-8?B?Qm9Pa1lKaHVnU0ZYYVBiemdEdFRsQ0VGOUhTdk9DeXRQRWh4MDJJR2RFazNK?=
 =?utf-8?B?YzdDbG1IUDhmSlB6SUJubEN5bzFHNTBFUytzRHBPQzEwSkxkQlZGL2l4Qmk2?=
 =?utf-8?B?R2lUMFlFc1lOa3p0V1kxblQwblVxc3NmTitGeG1Td2prYU03c1B3ZC9wVitT?=
 =?utf-8?B?VTJtRTlIOE9HODJVWmh5ZzFWR3lwVVpkVElmYW94Z29lZ0ptc2lVMW96NlN1?=
 =?utf-8?B?aVNhL3NmQzFvSm92QUtzb2R0a0N1dHo4aTVGSXlNSTM1V2lBUzZBWCtTZ24x?=
 =?utf-8?B?NlVzK1pVcWxmRzJNWGc0aHlnQXVWRS9zMmhZL1BxNE9HNTdYTHlZTU1QUTIv?=
 =?utf-8?B?NWVpMXU5MTUzaGVkdTREb2ZkZVkxTjZuZUU2NW9XR3NhY0tmSWxzY0VpNVAr?=
 =?utf-8?B?a2hzektwMWkxSEs5UGhwS1VSb2pmRkxUYnIxaGdhTWV5bmZDZEgxdEQvaHFC?=
 =?utf-8?B?QVpyakpveXRQUVZsNFljK3M3QjB6N1B0dE9sRUYxdTFTcm1JNU5CM2dJN0w1?=
 =?utf-8?B?NHhTajBiUlhPRFNQSkQxbXNxVVhnTytkdlhUNmhJekp0djhTSm5sSVZ2MnlY?=
 =?utf-8?B?Sk5vNDJPQW51dWltZGc0bHAyUVVwVnhpd0tob0lIR0Rtczl3M0x0VFQwYlJ3?=
 =?utf-8?B?K0ltd3NSaTI1NVZBZFRXL1pKU2FRWEFSUmhRaEtJcnlUdm1JNGlXUE1kbC9o?=
 =?utf-8?Q?k13nGerExg0UWYXeDpwl3lxdz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e99477-a4ec-41d0-1404-08de2774d454
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 14:06:26.8266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djCzkXeBdruYECvbipxbQfad1TBt2kTeP8tDXCBMBWh46twJm+AZ76kKKSAJ4NHp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343
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

On 11/19/25 14:35, Jason Gunthorpe wrote:
> On Wed, Nov 19, 2025 at 10:18:08AM +0100, Christian König wrote:
>>> +As this is not well-defined or well-supported in real HW the kernel defaults to
>>> +blocking such routing. There is an allow list to allow detecting known-good HW,
>>> +in which case P2P between any two PCIe devices will be permitted.
>>
>> That section sounds not correct to me. 
> 
> It is correct in that it describes what the kernel does right now.
> 
> See calc_map_type_and_dist(), host_bridge_whitelist(), cpu_supports_p2pdma().

Well I'm the one who originally suggested that whitelist and the description still doesn't sound correct to me.

I would write something like "The PCIe specification doesn't define the forwarding of transactions between hierarchy domains...."

The previous text was actually much better than this summary since now it leaves out the important information where all of this is comes from.

What the kernel does can be figure out by reading the code, but we need to describe why it does it.

> 
>> This is well supported in current HW, it's just not defined in some
>> official specification.
> 
> Only AMD HW.
> 
> Intel HW is a bit hit and miss.
> 
> ARM SOCs are frequently not supporting even on server CPUs.
IIRC ARM actually has a validation program for this, but I've forgotten the name of it again.

Randy should know the name of it and I think mentioning the status of the vendors here would be a good idea.
>>> +At the lowest level the P2P subsystem offers a naked struct p2p_provider that
>>> +delegates lifecycle management to the providing driver. It is expected that
>>> +drivers using this option will wrap their MMIO memory in DMABUF and use DMABUF
>>> +to provide an invalidation shutdown.
>>
>>> These MMIO pages have no struct page, and
>>
>> Well please drop "pages" here. Just say MMIO addresses.
> 
> "These MMIO addresses have no struct page, and"

+1

> 
>>> +Building on this, the subsystem offers a layer to wrap the MMIO in a ZONE_DEVICE
>>> +pgmap of MEMORY_DEVICE_PCI_P2PDMA to create struct pages. The lifecycle of
>>> +pgmap ensures that when the pgmap is destroyed all other drivers have stopped
>>> +using the MMIO. This option works with O_DIRECT flows, in some cases, if the
>>> +underlying subsystem supports handling MEMORY_DEVICE_PCI_P2PDMA through
>>> +FOLL_PCI_P2PDMA. The use of FOLL_LONGTERM is prevented. As this relies on pgmap
>>> +it also relies on architecture support along with alignment and minimum size
>>> +limitations.
>>
>> Actually that is up to the exporter of the DMA-buf what approach is used.
> 
> The above is not talking about DMA-buf, it is describing the existing
> interface that is all struct page based. The driver invoking the
> P2PDMA APIs gets to pick if it uses the stuct page based interface
> described above or the lower level p2p provider interface this series
> introduces.
> 
>> For the P2PDMA API it should be irrelevant if struct pages are used or not.
> 
> Only for the lowest level p2p provider based P2PDMA API - there is a
> higher level API family within P2PDMA's API that is all about creating
> and managing ZONE_DEVICE struct pages and a pgmap, the above describes
> that family.

I completely agree to all of this, but that's not what I meant.

The documentation makes it sound like DMA-buf is limited to not using struct pages and direct I/O, but that is not true.

You can have DMA-bufs backed by pages, both system memory and zone device pages.

But DMA-buf can also handle PCIe MMIO BARs which are micro controller doorbells or even classical HW registers.

Regards,
Christian.

> 
> Thanks,
> Jason

