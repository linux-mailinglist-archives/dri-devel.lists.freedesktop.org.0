Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F401BC6F72B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 15:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC6789220;
	Wed, 19 Nov 2025 14:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="m2AKZFQk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DC389220
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:54:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoCCJIC2Yn8/MQygf6+QMVJqXBklnboMQXFkR5tXOqqpXgyMSKG8kzAKAvpJHiZKMKIuYSJpP+mmHOmD5X30H/9FjHi8jCsku3SmM1yvZTuCk2CMq2UflSSOqqt6fvWc4gD3vzhozQ9TUpz+pHKQcuIalcjZW5T4YvLy8L/TlScT56DONdle+hbFTW720LMjAdL16eLAqMVr0YJc8TKE+3zTkwI7Cl77PvzwnlzXs7/IhklhZlG5BRHJRBBoevhzZO5JaQZEMzdplRnMPF/qBdYoTMDvP2jBnFzh9CxZfd74Qhqdlr6mprZ2oOiZJ0+zTBdP3qk4Aj1VTkF0f624cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12ACATNbzileaDoqo3EoAjrShJw+rL7FwsR50NoiEvk=;
 b=G8eygHShglMI6xmktpuGiCZqI6LdR8HHq8g0R52CXQOfOHXUfmFumoFqEcDdAc7DPpxYD7X8pVV4uYul03X/9uKt0FSnuXM+PuMeNBxe7LBYmReEOgNnXEeYnl5v3B4SOhNym8vWXufP010dv8tRDFDs7PPMBZ0fKhPF2ki8jYjuGAbaLqrjoXT/N6gSl62V7ZwuOhqpZSHl3tp23KAgOIDiwnoXCNA3pIhqWcp7OoFB7E073maCxTJ/MHBopp0nT+McfpeLuwLiG1LnxoLeQIxk7jLEOPqZyl1f6dIFYFVfBT0yl/0GAJ29aaJ8ZTyXOkIIX2VLPcRg6UPvHG52Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12ACATNbzileaDoqo3EoAjrShJw+rL7FwsR50NoiEvk=;
 b=m2AKZFQk8iURZLahgg0aAKk5EC9k9hlcS5vXTwx9YeG6ICwVgnKQSnfZAONK1RCDtc4HL9ANbAfw5jNPHpW4N5uiAJZk4ZiNd9MgQxsEijxTLp6gBdU2OYIbejstxkuoXZ8ok8lbIfBDzGu2Ctui96X9RN4hIF7zZ9zgQxRQEtc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6707.namprd12.prod.outlook.com (2603:10b6:303:1ee::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 14:53:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 14:53:39 +0000
Message-ID: <26d7ecab-33ed-4aab-82d5-954b0d1d1718@amd.com>
Date: Wed, 19 Nov 2025 15:53:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v8 06/11] dma-buf: provide phys_vec to
 scatter-gather mapping routine
To: Leon Romanovsky <leon@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe
 <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
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
 <20251119134245.GD18335@unreal>
 <6714dc49-6b5c-4d58-9a43-95bb95873a97@amd.com>
 <20251119145007.GJ18335@unreal>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251119145007.GJ18335@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: a6766521-bc9a-4885-9cf1-08de277b6c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2tiSFpIZ0xweXdtek9xQnFKMExPMHlldGV0bDBlV3FtS3BFU3FOQmdPTVNH?=
 =?utf-8?B?RXN3K25WSmZicFFBTUtGSFd6TVVTMHZIc0kvQlU4cWMrQ0FzUDJObWgvc1Nn?=
 =?utf-8?B?QkpzRm9BUG00MjBUZFZtUVRFN0x5OWd0eUY0OTEwRkljQlNjYW92dmoraTIv?=
 =?utf-8?B?K2JOMlV6VCs5aVFPaHZZSnZJblJkbHJJYnVnbmlYRCtpaW54cS80NFFQWDJa?=
 =?utf-8?B?bTU3bHNrc1VOVGdjYkxoQ2prWkpWOElXcVNxMGNSTmMzR3pmMm1pRFB5RUM0?=
 =?utf-8?B?YUZ5MVZuTXhpeHJNS0MzY0R4VVpGNEs5a1pHYTAwN0FISDJ0YzYwaXVtdGFH?=
 =?utf-8?B?OUxsbFdqNDBaS0lYdXU4OWNMSWE2L0ptVkNXQzZROHNRaTUvMTI3NC9oRjJF?=
 =?utf-8?B?aHhkNUxTUVB6VnAwSkVBRk91Y1RkdStVRXZRVE9RYTdGOU5zeCtKYXZlVEgv?=
 =?utf-8?B?anByWFVrSnllOGMxK3hnTWZIUnF5NVhrd3ZaLzZmUytiRFZOeWtjbWNUYTR3?=
 =?utf-8?B?WmtkRG4vTzhoVHpjNjBZY2M0cjUvUG1QditiYTdUSVNTMzlwZXNGeWV5ZVhN?=
 =?utf-8?B?Z1o5cWdteC9WR3hvcVlWNTBwM3hOUm00NSthMjlHeFk3b3hzcmk4RHUyTndQ?=
 =?utf-8?B?bjc2a2RWL2IyR3FHYlFjZFByNFpsNlRzM3U3Y0gwTHFseGZXbVY0SmJ2ZEMz?=
 =?utf-8?B?NmxFRHVoTUkrd24xeDdhOElMWmd2SmdOeXBlTWFTMVZTeEFndytmYTdFMnQ5?=
 =?utf-8?B?eGlIZGxKbkl5SEhqbXhoeVhLakY2dUFxYzNKSlpTWXFKb3gyTjZ0ZTRCcStD?=
 =?utf-8?B?T1V6dDFTekdBdmphbFZBM2lUNmJqUkRUQ2c3YktiVVBVaU15Mm9iSkUrczMy?=
 =?utf-8?B?SFBPR1pJWWxqaWU1WVFKTDVoMU12UHRvU0t0aTdzWnBrRjJtYm9vSGtqRGhM?=
 =?utf-8?B?TXNQUC9CU2dJR2RPd0M1UXl2bFNmdzRIdHlUUndZSE5IMndCMFdmbkZKcmhy?=
 =?utf-8?B?TUdIK2lrNXM5RjhpdklEMW1JU3REMzN3QXRhRTBFTWhLaUUxVyswVFBOKzJi?=
 =?utf-8?B?UHFkSUwrSXNERUE4V2lVd3FvazVSSWo4S2haRmhqSjBuSzN1cFZZTm1PRWg1?=
 =?utf-8?B?NnRiVDN6NWh4SlQ0Z2F6RFQySWF0Snd6WkdYZms2YjNzMzBzSXlKOElsckV3?=
 =?utf-8?B?Uk14aEUvZTI4WWprZ1Zzd2d4R2tJZGpXMGpQMUpjbTdvNlZEUnVuSTkvYk5z?=
 =?utf-8?B?M0JqamswTTVTL2JHRGpSeWQxSDZWUWxCM2hCQ1RoTDhvS3ZoZk8rWk9MOFl1?=
 =?utf-8?B?Y1Y5eVBlNVZqdmZnWHV4TXZWWlVzZk9OaE5CL29TbjVCRjBQMW5Dc3Jobktn?=
 =?utf-8?B?b3dxcVh3bklQR3RZeVoxblVqSFFmS3ZhZ1lqL3VBQzhTeEUvdDdVdkNJUEFm?=
 =?utf-8?B?bkg4LzhWK1Y3eGFHaFNvNVloM0ZaT0d0eUJBTkxNd09rK0Yva2dtaUR0YmJa?=
 =?utf-8?B?TjN3aSsyY2JTbWtPN29wVHZLdjdlajg3czg5c1BxcytEM295L01CRlM1NXJ6?=
 =?utf-8?B?dEw4SkRXalNTa0dCUU1QTTZPOUpYNmpndURRM1B1VDVSLzZKUDR0ZVNucGor?=
 =?utf-8?B?VFJOenVhZTBzRFlXUnY4VFVqazZJVWdNN0xIWXJFSjFpekFCYkxTaUNrb0JP?=
 =?utf-8?B?eFhlREtGcGdGUk8zUlNleEJqbDNhUWtXMVBmTmVyaEZYK1dyNTluNWVQVDdz?=
 =?utf-8?B?YzlVbzBwZGJSNWFiL0Jja3lVV3RwOUJrOW1zbFM5M3ptRmpEbWo0NjJuL3p4?=
 =?utf-8?B?TWFzVHVkUk9EWDJGd0RSQ2R2VGErUDU5cVZ2dWVwWi80QlhjQTcyOUs0RUp1?=
 =?utf-8?B?clNvVndNQUdsM1grc3ZGRXNQam5CcGRYdnZGOTZ3cnZTU01MVW5RMjRSaTl2?=
 =?utf-8?Q?ByReOjyq3jFWt9PECRHozOdLJW3bJOt5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHFJRVU5MnU2VnMxSm5QdnRnRCt2TXR2cFVnZ200bStCYytBN1JxSlZ5TmNG?=
 =?utf-8?B?a0UrcmpBMUE1SXo0Y25BRnNlVmswajVHMVdOdWhPV3dVOWhSd3hVUDR1UEdF?=
 =?utf-8?B?RGwvMHpSQ3BzTmxSNXNyczRURStQNDZBYmQzb2crRWJ2RUpRaGpodm93MTRG?=
 =?utf-8?B?ZEd5a0dkTFJzeG5QMDhCODBBejE4YTRsSFpzYjhpUElObG8xY3kxNnduZDVm?=
 =?utf-8?B?VHlqbWtVdnd4ZmNSQktSeG52RjdFYmxPS3BrWFloQWY4N0pxVkovQWZBeW93?=
 =?utf-8?B?WjJDYjd3UStjb1FmM0RkZzZEZFk1aE5BdmFZQ2NRREdRdnhzZW1UYSt3NlFR?=
 =?utf-8?B?TS8zZmxQeFgyZHNDbnJ6ditxa3dxZHlzOVhSRHBINkF2bml6aDhWTHdBYmlE?=
 =?utf-8?B?dCs2ZVYrdEV0NnJ2QUtKcHJVM3NrWXdDcWhPNkNvQS8xVjhwbXRvZEVrZUhm?=
 =?utf-8?B?ZUhMYWdUTFFZa0NxZ0dmR29ERkNxMGVmd3hkZnpCbVZYbHFqVXZtdXRFSndw?=
 =?utf-8?B?UkVJdmxYQ0p1aXRvSVZ4bzh2VjhEM0pMMkZiTU1WV21aTXU0NjY2UUZ4aXdt?=
 =?utf-8?B?cFF6TWxYN1JBZ3RJbHk3TCtjc016bm96NkVVajdIZTYzajJlVmI3WE83ZUZU?=
 =?utf-8?B?SWRsd0c2SUhBSGVCWFNpNlFGdEVqeW1Ka2hZRmEzZWhXbnBIM3ZzVWVBUmlC?=
 =?utf-8?B?eitRMHhwYTF6czVtRC96dHNVcXNNa2duSEhiUVFBbEZOcU9XNWZURTN3ZFlB?=
 =?utf-8?B?UDNlTWYxc0IzT1N6QllLNGVvM0I0OUtwczBpVFFxZWVVOFlEbGFyeUlmcXRC?=
 =?utf-8?B?SFA2WWlHVklIbTBQRFduN0tndmd6R0hkMm9tV0J4NWFRTWVwbnI1dnhhaVlV?=
 =?utf-8?B?UlN0amMwdHB4Q25QVEpCbEIybG40SDZzRTZZY2R4T1NtUFhDck9sNW4xejQw?=
 =?utf-8?B?Ykw3bU5DTWxhTWxqTHR1eEZVaEMzSHFNQlk1eEkvRldtY0w1TW9EWTJheTJh?=
 =?utf-8?B?YWZUN3QxUk1SWVg2WWYrU3RHSW5adkl3QythdWlpZ04rM1BEb1lyWnZDY3Bw?=
 =?utf-8?B?RS9hejArRkNvKzF1TFRrbHdVNjNob2VUcTdOMHFGSEdCUEVoWC9NWmltdDdI?=
 =?utf-8?B?MHhldG0zdlRoL2IzL0p2aEVWY3gzTUJrbHZ5TEJKZmxLZWdPSjR1ejk0dGxR?=
 =?utf-8?B?Wnk3dU1DSmpKb3RyeDRzekdoVFBWOExQektXT09BTFlFbnFrN3dMMThaYWM1?=
 =?utf-8?B?SnI5OVdGK2xvTUxPMTdodHJrcnMyNmFJK0JlaFZOTXZFWFFlajdKa0FUOFJS?=
 =?utf-8?B?VFJaeEVCU0g3eFRxYys5WW1OUDhvQVlPZHNVQU9lLzExQVNwWEFKc3g0TjF2?=
 =?utf-8?B?alMwRDdEY1B5UjdaaXEwUFgwdkNWR0FzSUpnVEx6dGhIdWxGc0h5OHlUWHg1?=
 =?utf-8?B?VkhzN00rZ01vUVJ4dE14RFE1L0dIckVzb0trT0grTlFGQ1BqRjlZZ25WVUYr?=
 =?utf-8?B?YjdzS2E0OFI1VTFtZllUVzhmSDV3Q0pnT00zNjBxMEVPVCtGQlRiZGJwREJ3?=
 =?utf-8?B?SHlDR3NMRzVZcGc5QytmRkRxd0d2YXZCY3dSZ2NnL0pLSXFxY2ExRFJrbHph?=
 =?utf-8?B?Z0pLSHE5dm80K0dnMWcycWZxbFpabFQvT2dvSzlaM2tuczg0TmwwdytxM2My?=
 =?utf-8?B?UlVNMGpDcVRIOE0rYUZGYzU2Q1d5REhKNzM2M3lIdURhcXdLalYydURVU2xW?=
 =?utf-8?B?dXpUcmk0b1ZtY05vTFFPY3U0R3JOVEYwaUIyTVlYeFFNVGlWYzAxN3h2clBB?=
 =?utf-8?B?cUU2cUkwOVV2MU1wTDVVS29WWkhMWWFLQ0ZZaVVGc2NKdW9iRmhTVzhFM0kr?=
 =?utf-8?B?b3B1cWpIYzJhSzBhQXBrcXRLY3NiTDdmRzV6OG1QalZueHE5VFpCcUcvOXZa?=
 =?utf-8?B?bWkrYW9DUmhYZXR5UWpNV2xrZS9sUkRydUt3Z3Y0UWh1N084ZWUrU01VSHds?=
 =?utf-8?B?ejd6cS9SUFd6bFFja1pNWlVHSjJvT0VyNElnaXQ0SXh6UlgyR1RucjlOUmc5?=
 =?utf-8?B?UU9qSFArZFZUUzdpcm5TK1V4d2ZFNGtnYjhKdXJPYWJ6WjJmUDRoMXBKMDd4?=
 =?utf-8?Q?STjDYM2Eul8c2L/6+mV+YNBiC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6766521-bc9a-4885-9cf1-08de277b6c8e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 14:53:39.1798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAAgUa6BbVnYIR9n1lRVabMKLJZZQOerx9YYRq2dmneBCEkMtVz+yOoN8B+rd3WI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6707
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



On 11/19/25 15:50, Leon Romanovsky wrote:
> On Wed, Nov 19, 2025 at 03:11:01PM +0100, Christian König wrote:
>> On 11/19/25 14:42, Leon Romanovsky wrote:
>>> On Wed, Nov 19, 2025 at 02:16:57PM +0100, Christian König wrote:
>>>>
>>>>
>>>> On 11/11/25 10:57, Leon Romanovsky wrote:
>>>>> From: Leon Romanovsky <leonro@nvidia.com>
>>>>>
>>>>> Add dma_buf_map() and dma_buf_unmap() helpers to convert an array of
>>>>> MMIO physical address ranges into scatter-gather tables with proper
>>>>> DMA mapping.
>>>>>
>>>>> These common functions are a starting point and support any PCI
>>>>> drivers creating mappings from their BAR's MMIO addresses. VFIO is one
>>>>> case, as shortly will be RDMA. We can review existing DRM drivers to
>>>>> refactor them separately. We hope this will evolve into routines to
>>>>> help common DRM that include mixed CPU and MMIO mappings.
>>>>>
>>>>> Compared to the dma_map_resource() abuse this implementation handles
>>>>> the complicated PCI P2P scenarios properly, especially when an IOMMU
>>>>> is enabled:
>>>>>
>>>>>  - Direct bus address mapping without IOVA allocation for
>>>>>    PCI_P2PDMA_MAP_BUS_ADDR, using pci_p2pdma_bus_addr_map(). This
>>>>>    happens if the IOMMU is enabled but the PCIe switch ACS flags allow
>>>>>    transactions to avoid the host bridge.
>>>>>
>>>>>    Further, this handles the slightly obscure, case of MMIO with a
>>>>>    phys_addr_t that is different from the physical BAR programming
>>>>>    (bus offset). The phys_addr_t is converted to a dma_addr_t and
>>>>>    accommodates this effect. This enables certain real systems to
>>>>>    work, especially on ARM platforms.
>>>>>
>>>>>  - Mapping through host bridge with IOVA allocation and DMA_ATTR_MMIO
>>>>>    attribute for MMIO memory regions (PCI_P2PDMA_MAP_THRU_HOST_BRIDGE).
>>>>>    This happens when the IOMMU is enabled and the ACS flags are forcing
>>>>>    all traffic to the IOMMU - ie for virtualization systems.
>>>>>
>>>>>  - Cases where P2P is not supported through the host bridge/CPU. The
>>>>>    P2P subsystem is the proper place to detect this and block it.
>>>>>
>>>>> Helper functions fill_sg_entry() and calc_sg_nents() handle the
>>>>> scatter-gather table construction, splitting large regions into
>>>>> UINT_MAX-sized chunks to fit within sg->length field limits.
>>>>>
>>>>> Since the physical address based DMA API forbids use of the CPU list
>>>>> of the scatterlist this will produce a mangled scatterlist that has
>>>>> a fully zero-length and NULL'd CPU list. The list is 0 length,
>>>>> all the struct page pointers are NULL and zero sized. This is stronger
>>>>> and more robust than the existing mangle_sg_table() technique. It is
>>>>> a future project to migrate DMABUF as a subsystem away from using
>>>>> scatterlist for this data structure.
>>>>>
>>>>> Tested-by: Alex Mastro <amastro@fb.com>
>>>>> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
>>>>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>>>>> ---
>>>>>  drivers/dma-buf/dma-buf.c | 235 ++++++++++++++++++++++++++++++++++++++++++++++
>>>>>  include/linux/dma-buf.h   |  18 ++++
>>>>>  2 files changed, 253 insertions(+)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>>>> index 2bcf9ceca997..cb55dff1dad5 100644
>>>>> --- a/drivers/dma-buf/dma-buf.c
>>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>>> @@ -1254,6 +1254,241 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
>>>>>  }
>>>>>  EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, "DMA_BUF");
>>>>>  
>>>>> +static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
>>>>> +					 dma_addr_t addr)
>>>>> +{
>>>>> +	unsigned int len, nents;
>>>>> +	int i;
>>>>> +
>>>>> +	nents = DIV_ROUND_UP(length, UINT_MAX);
>>>>> +	for (i = 0; i < nents; i++) {
>>>>> +		len = min_t(size_t, length, UINT_MAX);
>>>>> +		length -= len;
>>>>> +		/*
>>>>> +		 * DMABUF abuses scatterlist to create a scatterlist
>>>>> +		 * that does not have any CPU list, only the DMA list.
>>>>> +		 * Always set the page related values to NULL to ensure
>>>>> +		 * importers can't use it. The phys_addr based DMA API
>>>>> +		 * does not require the CPU list for mapping or unmapping.
>>>>> +		 */
>>>>> +		sg_set_page(sgl, NULL, 0, 0);
>>>>> +		sg_dma_address(sgl) = addr + i * UINT_MAX;
>>>>> +		sg_dma_len(sgl) = len;
>>>>> +		sgl = sg_next(sgl);
>>>>> +	}
>>>>> +
>>>>> +	return sgl;
>>>>> +}
>>>>> +
>>>>> +static unsigned int calc_sg_nents(struct dma_iova_state *state,
>>>>> +				  struct dma_buf_phys_vec *phys_vec,
>>>>> +				  size_t nr_ranges, size_t size)
>>>>> +{
>>>>> +	unsigned int nents = 0;
>>>>> +	size_t i;
>>>>> +
>>>>> +	if (!state || !dma_use_iova(state)) {
>>>>> +		for (i = 0; i < nr_ranges; i++)
>>>>> +			nents += DIV_ROUND_UP(phys_vec[i].len, UINT_MAX);
>>>>> +	} else {
>>>>> +		/*
>>>>> +		 * In IOVA case, there is only one SG entry which spans
>>>>> +		 * for whole IOVA address space, but we need to make sure
>>>>> +		 * that it fits sg->length, maybe we need more.
>>>>> +		 */
>>>>> +		nents = DIV_ROUND_UP(size, UINT_MAX);
>>>>> +	}
>>>>> +
>>>>> +	return nents;
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * struct dma_buf_dma - holds DMA mapping information
>>>>> + * @sgt:    Scatter-gather table
>>>>> + * @state:  DMA IOVA state relevant in IOMMU-based DMA
>>>>> + * @size:   Total size of DMA transfer
>>>>> + */
>>>>> +struct dma_buf_dma {
>>>>> +	struct sg_table sgt;
>>>>> +	struct dma_iova_state *state;
>>>>> +	size_t size;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * dma_buf_map - Returns the scatterlist table of the attachment from arrays
>>>>> + * of physical vectors. This funciton is intended for MMIO memory only.
>>>>> + * @attach:	[in]	attachment whose scatterlist is to be returned
>>>>> + * @provider:	[in]	p2pdma provider
>>>>> + * @phys_vec:	[in]	array of physical vectors
>>>>> + * @nr_ranges:	[in]	number of entries in phys_vec array
>>>>> + * @size:	[in]	total size of phys_vec
>>>>> + * @dir:	[in]	direction of DMA transfer
>>>>> + *
>>>>> + * Returns sg_table containing the scatterlist to be returned; returns ERR_PTR
>>>>> + * on error. May return -EINTR if it is interrupted by a signal.
>>>>> + *
>>>>> + * On success, the DMA addresses and lengths in the returned scatterlist are
>>>>> + * PAGE_SIZE aligned.
>>>>> + *
>>>>> + * A mapping must be unmapped by using dma_buf_unmap().
>>>>> + */
>>>>> +struct sg_table *dma_buf_map(struct dma_buf_attachment *attach,
>>>>
>>>> That is clearly not a good name for this function. We already have overloaded the term *mapping* with something completely different.
>>>
>>> This function performs DMA mapping, so what name do you suggest instead of dma_buf_map()?
>>
>> Something like dma_buf_phys_vec_to_sg_table(). I'm not good at naming either.
> 
> Can I call it simply dma_buf_mapping() as I plan to put that function in dma_buf_mapping.c
> file per-your request.

No, just completely drop the term "mapping" here. This is about phys_vector to sg_table conversion and nothing else.

That we create an IOVA mapping when the access needs to go through the root complex is an implementation detail.

> 
> Regarding SG, the long term plan is to remove SG table completely, so at
> least external users of DMABUF shouldn't be exposed to internal implementation
> details (SG table).

Hui? Well I suggested to remove the sg_table, but that doesn't mean that implementations shouldn't be aware of that.

Regards,
Christian.

> 
> Thanks

