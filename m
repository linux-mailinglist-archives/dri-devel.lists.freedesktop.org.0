Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3pPgBFRRfmmvXAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 20:00:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D49C39BF
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 20:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CF310E08C;
	Sat, 31 Jan 2026 19:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OppeVChu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4767D10E08C;
 Sat, 31 Jan 2026 19:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769886030; x=1801422030;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=W41hjTLtee3ziabilnwLBcFUaR7VbpI/RJLXmXOZ/SQ=;
 b=OppeVChulvG+T1SkyVFh4Am56QNcW2GdebaOBowgVqzlbSSmnVDh3C5t
 aYxpIGU6fQ8A8Dro833iEFPCEYb+jDxkpfIMI9v1jxMB+M2boto2u+hyl
 X8wZBxXB1Z73bd8zNsbMSNW6VcJmShGtfACekXf+/DZyF6VEJSftVZu/Q
 iXf93ic6FI71edGwXIQ4tSUxGw/PdH8i0tp1pvq/OOqTMDMlYOGT9UWUP
 PZ212lEcW/ExyTkNxU9Fc4IK598/tT6OsAuC3/+tmaoDvjamFYCQT2k1L
 43VgNemU7LQCgFi9dzoRMWpZbruIPlxN5V4kjkd4wau/MdbpThmFecdDK g==;
X-CSE-ConnectionGUID: JiQdO9SeSfKclLncK79PCA==
X-CSE-MsgGUID: ejw8BhQRQ1205DJMAXUrHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="96566904"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; d="scan'208";a="96566904"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2026 11:00:29 -0800
X-CSE-ConnectionGUID: 1JbS1dJ+QKm6H+6LFsUvDg==
X-CSE-MsgGUID: F9T/yTemQsyD4j6pWt3nmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; d="scan'208";a="209523961"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2026 11:00:29 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sat, 31 Jan 2026 11:00:28 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sat, 31 Jan 2026 11:00:28 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sat, 31 Jan 2026 11:00:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qon5kzjGkxlFo1L6zrjc82gjWnTo6qCIffibK75C/rbqsLDVa+jCzzy6nhHlAwVujmPYNE8LAlkpwQJJyerhcX1+Adcy3ttvQaeHK2wgd/xDco61+Q6kmY5ET41pPeZK7SxJAkyijmpCDavt1s3EWtPCcEXJJFcKHzVSxlzAM785eJXNX8Lx2eU9fvYFZ9Q7PJo5wvOQylv+SA8Xi42QdVNBViRlrFHWa5uV4UFR0G1KCTpZ6YMuinUn2ClpaF4epa+jkzus2tt503aPA4m++Io/VQgFvphym+81AqwpwQNBgnWNR+ieF7tsx/9UfAsa9sBWbZd/4HSKg85su3AEsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UoUx94ANXeUXuRx1lERovDhjbekEj2rYali425EFaxs=;
 b=FZ7BciMUBTZ437Tg3ZAaCMScbC2gnFdGVyB3Y9xuKAS97FNTIzaZYdBMIQR9YwmqOv3uQpLMIJPBKR6hdKD+KCwA2wf2YqTApZ+9DCeYVfcrpc31hB9f6HW4g51UDOmhbr6hPrhqoeUSBOzr0AAxq7BYu6F9UGE9hBgPT7a5EhN9AtOSzX01A9h9mxavRDCShxveMhBkK1Oy3j8kRjeKP2rJLxWg8SQW0lOGC1v2uUoAZiNjisYDCAbeQIWIHtost30FwFB5WOvZlyczEufsI22+wj7X2ZjCc/tHN3iX7/bsEdsiiyZIHDMmzsOA3fYVOeBTrlqnbofzAGIuH2B5Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH2PR11MB8815.namprd11.prod.outlook.com (2603:10b6:610:284::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Sat, 31 Jan
 2026 19:00:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9564.014; Sat, 31 Jan 2026
 19:00:18 +0000
Date: Sat, 31 Jan 2026 11:00:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: John Hubbard <jhubbard@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>, <intel-xe@lists.freedesktop.org>, Ralph Campbell
 <rcampbell@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe
 <jgg@mellanox.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky
 <leon@kernel.org>, <linux-mm@kvack.org>, <stable@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-ID: <aX5RQBxYB029/dkt@lstrano-desk.jf.intel.com>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <57fd7f99-fa21-41eb-b484-56778ded457a@nvidia.com>
 <2d96c9318f2a5fc594dc6b4772b6ce7017a45ad9.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d96c9318f2a5fc594dc6b4772b6ce7017a45ad9.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0057.prod.exchangelabs.com (2603:10b6:a03:94::34)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH2PR11MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb4aa8f-923f-4b80-867d-08de60faf9ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXpPblhyTHNzRC9ibEF2UlltVyt4TDRBM25hWW8vdlpsRzJMS1dTZ1VpV3hq?=
 =?utf-8?B?Mjd2aFdWOUgvZ01XcWRlZ014U2xHREd3V2gzcUNsckMrdGhjbFVZK2o4SWRr?=
 =?utf-8?B?QnFrUllpYnY2VzJ1aFVPc25tYW9vQ2RUblVCdVpyTDFFKzlYaHlrMHd3cmh6?=
 =?utf-8?B?RzNUNVpUUlo5QnNvUEFid2Irclp1SE9XbStKem9wUjBqSzV3L3BnL2lzUSsx?=
 =?utf-8?B?NnNBbFBTL3ZYRWNKOEdzYlhpTDc5VklueE9QY3pGa01HTnVRNzUwZTdKc3F4?=
 =?utf-8?B?U1ZvYUR2T3A4YXJUS3RieDJLOGRUb24rZUhzcWUwSGlEU2NNV3QwNWQ5WTJF?=
 =?utf-8?B?OHlkSDRqMUhUeUROY0NGaXRKWm0yTFpNUmx0bVE1elZuV0dlbEZ2WUQ2V0tG?=
 =?utf-8?B?eS8vbnI4UEg4N2pETU5xYyt5cHBtc2VWSFEwbld4NXkrUFB2dlJwQ3ZPbFZX?=
 =?utf-8?B?TEtXV2h3V1RldmYvb2x3SXRzMnR4NGhEdDNQTWRqek5qcGZpUjZOZUp6QkVO?=
 =?utf-8?B?SlVZVEsvUllVT1JUR293WjdLeTFnb285QXRBbjZsOUNpb1BDVnkzalVkTGt4?=
 =?utf-8?B?ZzNTSENPZ2tWSHRpSU1YL1FJd1VJOWo1Z0NMcW1Uenl1UkVzS08rUlMycWZn?=
 =?utf-8?B?RG5BNmxGWDRnLzA2c1ZJM1JIT3hZa20wUzhYaGNXVHF1NUJmK0F0aURWMDlX?=
 =?utf-8?B?d3l1dWxxWlJkS2thY2E2NTNkWjd3VlB0YW0rNnFISUU1YUZXdmN4TE05MGdt?=
 =?utf-8?B?ZUpVVU9HdnBGU05BUVhMVFdna2NkaUtkUTgrWktNcmdlVXBucjA2RFJlVnZB?=
 =?utf-8?B?aHNqaURHeTd0UWMxVjErRlEwYkh5enJDazM1S3AzS1N6OHlYUTJha0FFU29w?=
 =?utf-8?B?QlNPbmhscFZxVFo2NHk4RjlrZzh2aUNlMkswTjl5bzcrWkZzLytZaFgyc3g5?=
 =?utf-8?B?MXcrSFRYVFlSM1RiVE1rbE5aWGd3Z1FGeTQ0UFd4eUJuNmdGWmVFYzE1aTVJ?=
 =?utf-8?B?N3JkcVRrakNleCsxZjVkMkVPVk43RUtZZm5IaVIzalhoNlp3aFhyMXFybUdO?=
 =?utf-8?B?NVBMcDVuWmRCdlNZa041b3FQVUJKT2JSTU5GSWkzRm9xY3FRaS94ZUlLMjc1?=
 =?utf-8?B?QXNicTAvMFdTNUlJMXdiT2Z1VUxaVVB4UW5VR3gvMVY3cXQ0cFJNRWhoSjcx?=
 =?utf-8?B?Z1RSTXV0R2VjTWg1LzN6VmFOeitrcitBNFR5OUpENEh1Qk5TanUzMTIrWGdj?=
 =?utf-8?B?ZkcxYzVwSDdMUThjWFdVZ3pMaTd2aWY2V0FRTEF6UGtETVBuTlBuRjNBd0p1?=
 =?utf-8?B?bXp6R2EvYjVabjVQeitqYU5rNWw3UFVsajZDOWI5SlVTeDg2SWNLbmpzOVIw?=
 =?utf-8?B?L05Rckg2a1BSZW5QVnZUWmZLWTJNL0VHTW8xRFlQdy92ZlJvcTNiNjFlaGNw?=
 =?utf-8?B?WVFoZ25QK3hUSzdtMWZmSUdCRnZVVTJQRUVZMmlSY09HRXJvUThJeG8wTG9w?=
 =?utf-8?B?TkRIeW16cGM3RmlkTi9tNEtBMXhQRzJaVXFDMFRYOUI4b2EzeTArYXAzNmtU?=
 =?utf-8?B?SFpzdkJrSk40K3dDN2grWlZIQkxQRVdrQnZRN1VkYjZzN0RRNUhEUEx5cC9V?=
 =?utf-8?B?VS9Icmw1YTJOU2JKOE5EWHRDWG9ybjFVdW9QRk5TdzU3dUtrY2svRUYxWlFH?=
 =?utf-8?B?dk5oeVJpRnlhazRlQ2NzQ0tHR1dlcFNqY3ZVYktaUGtRdW9NOSt5VG1yZHI2?=
 =?utf-8?B?YmNITm04cFAwUVA1aFRxWVdobVU2UDE1UkhvbFRkYy9Ya2VndWhyVk1uUDAw?=
 =?utf-8?B?RXNvR0pPOWpPRXNlVHBOR3J0Q0tobXg0T3hyeXpsTlQ0RE51SWlMWEJISnVB?=
 =?utf-8?B?NWpjU2hzamhnZkVSRnJKOE9ZMDVWOHhRRWVvZ3NvbGVWbEM4NEJtMEQyVFF0?=
 =?utf-8?B?R21kU3NLcVNvWXBRRG1NWnNSVXpmWlZNdkg3TUJxS3dGNE5YdmZnSld1elRS?=
 =?utf-8?B?SStOalNnVGxnRmhJVlB0eGhmazhRU3Q2RGFoYnIzY1owMHh3YXBldjQwV2V4?=
 =?utf-8?B?UHFpeHM4RGxTeEQ1SWRXNXpMSDMyZUo2bmQzazUvVWJHZzRFemo0MDRIQU8y?=
 =?utf-8?Q?YJ5o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkhOVGYrUjRSdStiNTY0UDlYZFpYa3h3eStKYWVFN0Q2VTJsU1VuTkl3SzVD?=
 =?utf-8?B?NUtDQTBUZy83WkF4TG1TczE4cE5nYnd5N0w3TjVaZVVyOHdmaTZyZEd4OGRZ?=
 =?utf-8?B?TDlRM1k3cFplOGhqaHUwcTZTbFVhRndGanVVVXpBVUlMQ0IzT3ZqanRsSUJX?=
 =?utf-8?B?ek41MkREQjJJaTBOZjNVTDdWWW9hOWcxTjhXdzJacnJZdDZsbDhUVUp2TmZB?=
 =?utf-8?B?RWVZS0dxYXgwaTdUSjJvaWRjQU8zaFVUMmlDeThoa05qT0c3b0JXT2ZOL0li?=
 =?utf-8?B?a0lNSWVUK0wxNWtVbzFjMDYvMTV0QXNxb0xqd3pPWWtyeDBYaXJDcU5yL2Nh?=
 =?utf-8?B?YXQ3U0M3NXFjQkMva3gyaytDT2kxb3M2ZlFJQW9XWUpqSlRCSjJmNzk1Z3ha?=
 =?utf-8?B?NmdpQlpxLzFFMzNxNWRHaHlZWWd3SGwwbzNSRURETHdwMmRzU2o4U2dKb0ZM?=
 =?utf-8?B?alg2bjYvL3NWMWU1MkNJUW8wQnFsN3BuSko1aEl2Z0oyNG1ObzF1QlJZd2o5?=
 =?utf-8?B?elJqTXNvSk10K0w5QlVTQ0FCRG5pQjB2UHZmZFZrZlJUbjY3MG1ETlFyZlJK?=
 =?utf-8?B?Z2t0VE42Uk1adWNLeVdkQTRhUzhCLzEyM1JmVGFCV2hHUjA2NG1EMUVBbUhn?=
 =?utf-8?B?QlQvbDlRbXpybUpPaWtuOTFvclUzZ0hwSkJzQU1VRHZlelVWbnVvUUVPNmVE?=
 =?utf-8?B?a29FZ3R6alY2SHJpcmJxN0NMUCsyNnVHV0szWGprWDV4VHRINnhkNFRnbDQ2?=
 =?utf-8?B?ZHNQNS9QcWNHbTF5Wk1PZGJzeE1OMGFGYkNwckdZT2d3R0J6Tnh3cjhlL2Va?=
 =?utf-8?B?WngydmpiejdhbFR2U2VOV2hyb2lOOHlKWTgzcnEyUWVlck90TGxpbTlXUDRF?=
 =?utf-8?B?LzN4ODd6ZjBVSFV3WmxNdFRFb1VjT0ZqRnpuZDlLV3VkalJFaXFRUEhqVjQr?=
 =?utf-8?B?WUJIQTN2aXhsWWpXOFFvSElJNk92bERtNU1NK2lGdExNdDg4UUN2OFpSMlVJ?=
 =?utf-8?B?d0IrZTVBK0hHcW9PUTFuVVlZUGdCMnVLZ016UkVNZ1c5cWVydDdVZklXVlJi?=
 =?utf-8?B?ZmE1YjFobHZwYmgxbklmVHNwUHA0aTJCRHByV3JkYkZxakQ4RDU2L0hYTEJV?=
 =?utf-8?B?OU5KMnQ2WW5VSUgwQS93WHhEOVo2MDcxNFZ2QlR4NHltQmpqaS9mbDlkM1pI?=
 =?utf-8?B?UkhoZE9pWnRZVWF4LytlZlNXM1MxQllJa1dadk9kdll6RkVmYVF6VTEybHVW?=
 =?utf-8?B?MXdEZGEvc0w1UzlwWE9VWFR0TFk1Qk4xSlZTK0xDZE1uUHN3RkhkTWV0d0Nh?=
 =?utf-8?B?OGFmYW9FcHBkTm40T3dpZHVhOUMwMlZCalpIaUNJS0dGMUMzU0ZaMlViOWgy?=
 =?utf-8?B?OWdmenJwV2xER3cxSGgvakdmdGo1YXM0SDBPeDRiaHlwMHlKVzNlWU0xdHRW?=
 =?utf-8?B?bGVQYng2Z3hkR1c0ZjYxV2FNcVZRWVhhNzVjTzZFcUxyc2hiaHk1Zjl0VEVK?=
 =?utf-8?B?cFgvRXB6NWhDVElmMGRaYi9MVU5TRlc2MDZFMzBZK1o2K3EzLzdDUDM1M2hm?=
 =?utf-8?B?RGJ5TGFsZ0NtdC8wN2hXK29oSnpaMHdsYU5HcUNheE9MWTNycWV0OUQ4M09O?=
 =?utf-8?B?YjM3RUlMQUtabVpKd1VTUTdIQWNVU0VVcWhwZkE1aE9yajNBakhpaFJ4SFJk?=
 =?utf-8?B?QkcrNlUzeXMzbkE1YUszUzlhSjE5aTVzNjZKNEhOYkhMb1JoQjErZnR5aU5M?=
 =?utf-8?B?YnhBZUhrd3U2dU5TSDExcEJtdi9rVmlVL0t6a1k4SksxUzRGVGY1ZTBYNGZi?=
 =?utf-8?B?TWdRUml6K1pXQkxmMGNvb2Z1dzR0R3E5aHZPa1hCL3BXSENhM3hNd0FKVnA5?=
 =?utf-8?B?SEZhMXpINlJUcEtQNXdBemFZanBjSkFzU1dUdzljL3YzeUtka3BvWG9FZkFL?=
 =?utf-8?B?ejU2N1JDRzRsS3FYYjg3RXRhR04zaXlRTmI3dUhleXp3bnp1Sm5GS1RqUkdu?=
 =?utf-8?B?cW9mNGd2QktQaE9nd3VNQnpUSDZUZ1dKS2pmU25TT2MvUlBwbjhtblJGeVN5?=
 =?utf-8?B?YXIwZWIxb3hKWG5FZnFVdjd3NzAxcHZBZkl1Wm92ZUZHOEFQTGo2NnZSS25H?=
 =?utf-8?B?ZjF4ZHZqaEY4OExDSEd3eTg1M3dRclpqc1NkdW1XdEVyQkFCUUNrckNYV1U4?=
 =?utf-8?B?ZEFXSzNwOXdWaHlwU1d6aEVZR21sZFJpd2d3c0NUZDJJbnlDaCtoRGQvSXNk?=
 =?utf-8?B?elpBQnpvWEZTd0tSeC9UNVdTdm9QdGxuaEI3QzhRcEV3NS9vM25wYlJKbXln?=
 =?utf-8?B?Q3B4eUplNk05WHp2bmxENC9CY2NvRjdWc2djWDhURklNSlVnRUhyQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb4aa8f-923f-4b80-867d-08de60faf9ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 19:00:18.5934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EB3NK8S8OasDwyXatOctVAgNoq3OBQz7lqyRiUrYjyDie2Juy+GKRUbj9kU6GdLtRjGmCXuyRugVYJqnI116Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8815
X-OriginatorOrg: intel.com
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 37D49C39BF
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 01:57:21PM +0100, Thomas Hellström wrote:
> On Fri, 2026-01-30 at 19:01 -0800, John Hubbard wrote:
> > On 1/30/26 10:00 AM, Andrew Morton wrote:
> > > On Fri, 30 Jan 2026 15:45:29 +0100 Thomas Hellström
> > > <thomas.hellstrom@linux.intel.com> wrote:
> > ...
> > > > This can happen, for example if the process holding the
> > > > device-private folio lock is stuck in
> > > >    migrate_device_unmap()->lru_add_drain_all()
> > > > The lru_add_drain_all() function requires a short work-item
> > > > to be run on all online cpus to complete.
> > > 
> > > This is pretty bad behavior from lru_add_drain_all().
> > 
> > Yes. And also, by code inspection, it seems like other folio_batch
> > items (I was going to say pagevecs, heh) can leak in after calling
> > lru_add_drain_all(), making things even worse.
> > 
> > Maybe we really should be calling lru_cache_disable/enable()
> > pairs for migration, even though it looks heavier weight.
> > 
> > This diff would address both points, and maybe fix Matthew's issue,
> > although I haven't done much real testing on it other than a quick
> > run of run_vmtests.sh:
> 
> It looks like lru_cache_disable() is using synchronize_rcu_expedited(),
> which whould be a huge performance killer?
> 

Yep. I’ve done some quick testing with John’s patch, and
xe_exec_system_alloc slows down by what seems like orders of magnitude in
certain sections. I haven’t done a deep dive yet, but the initial results
don’t look good.

I also eventually hit a kernel deadlock. I have the stack trace saved.

> From the migrate code it looks like it's calling lru_add_drain_all()
> once only, because migration is still best effort, so it's accepting
> failures if someone adds pages to the per-cpu lru_add structures,
> rather than wanting to take the heavy performance loss of
> lru_cache_disable().
> 
> The problem at hand is also solved if we move the lru_add_drain_all()
> out of the page-locked region in migrate_vma_setup(), like if we hit a
> system folio not on the LRU, we'd unlock all folios, call
> lru_add_drain_all() and retry from start.
> 

That seems like something to try. It should actually be pretty easy to
implement as well. It’s good to determine whether a backoff like this is
common, and whether the backoff causes a performance hit or leads to a
large number of retries under the right race conditions.

> But the root cause, even though lru_add_drain_all() is bad-behaving, is
> IMHO the trylock spin in hmm_range_fault(). This is relatively recently
> introduced to avoid another livelock problem, but there were other
> fixes associated with that as well, so might not be strictly necessary.
> 
> IIRC he original non-trylocking code in do_swap_page() first took a

Here is change for reference:

git format-patch -1 1afaeb8293c9a

> reference to the folio, released the page-table lock and then performed
> a sleeping folio lock. Problem was that if the folio was already locked

So original code never had page lock.

> for migration, that additional folio refcount would block migration

The additional folio refcount could block migration, so if multiple
threads fault the same page you could spin thousands of times before
one of them actually wins the race and moves the page. Or, if
migrate_to_ram contends on some common mutex or similar structure
(Xe/GPU SVM doesn’t, but AMD and Nouveau do), you could get a stable
livelock.

> (which might not be a big problem considering do_swap_page() might want
> to migrate to system ram anyway). @Matt Brost what's your take on this?
> 

The primary reason I used a trylock in do_swap_page is because the
migrate_vma_* functions also use trylocks. It seems reasonable to
simply convert the lock in do_swap_page to a sleeping lock. I believe
that would solve this issue for both non-RT and RT threads. I don’t know
enough about the MM to say whether using a sleeping lock here is
acceptable, though. Perhaps Andrew can provide guidance.

> I'm also not sure a folio refcount should block migration after the
> introduction of pinned (like in pin_user_pages) pages. Rather perhaps a
> folio pin-count should block migration and in that case do_swap_page()
> can definitely do a sleeping folio lock and the problem is gone.
> 

I’m not convinced the folio refcount has any bearing if we can take a
sleeping lock in do_swap_page, but perhaps I’m missing something.

> But it looks like an AR for us to try to check how bad
> lru_cache_disable() really is. And perhaps compare with an
> unconditional lru_add_drain_all() at migration start.
> 
> Does anybody know who would be able to tell whether a page refcount
> still should block migration (like today) or whether that could
> actually be relaxed to a page pincount?
> 

This is a good question. AFAIK this is probably a leftover from the
original device-pages implementation, and it could likely be relaxed.
But I’m not really convinced the folio refcount is relevant to this
discussion (see above).

Matt

> Thanks,
> Thomas
> 
> > 
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index 23379663b1e1..3c55a766dd33 100644
> > --- a/mm/migrate_device.c
> > +++ b/mm/migrate_device.c
> > @@ -570,7 +570,6 @@ static unsigned long
> > migrate_device_unmap(unsigned long *src_pfns,
> >  	struct folio *fault_folio = fault_page ?
> >  		page_folio(fault_page) : NULL;
> >  	unsigned long i, restore = 0;
> > -	bool allow_drain = true;
> >  	unsigned long unmapped = 0;
> >  
> >  	lru_add_drain();
> > @@ -595,12 +594,6 @@ static unsigned long
> > migrate_device_unmap(unsigned long *src_pfns,
> >  
> >  		/* ZONE_DEVICE folios are not on LRU */
> >  		if (!folio_is_zone_device(folio)) {
> > -			if (!folio_test_lru(folio) && allow_drain) {
> > -				/* Drain CPU's lru cache */
> > -				lru_add_drain_all();
> > -				allow_drain = false;
> > -			}
> > -
> >  			if (!folio_isolate_lru(folio)) {
> >  				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
> >  				restore++;
> > @@ -759,11 +752,15 @@ int migrate_vma_setup(struct migrate_vma *args)
> >  	args->cpages = 0;
> >  	args->npages = 0;
> >  
> > +	lru_cache_disable();
> > +
> >  	migrate_vma_collect(args);
> >  
> >  	if (args->cpages)
> >  		migrate_vma_unmap(args);
> >  
> > +	lru_cache_enable();
> > +
> >  	/*
> >  	 * At this point pages are locked and unmapped, and thus
> > they have
> >  	 * stable content and can safely be copied to destination
> > memory that
> > @@ -1395,6 +1392,8 @@ int migrate_device_range(unsigned long
> > *src_pfns, unsigned long start,
> >  {
> >  	unsigned long i, j, pfn;
> >  
> > +	lru_cache_disable();
> > +
> >  	for (pfn = start, i = 0; i < npages; pfn++, i++) {
> >  		struct page *page = pfn_to_page(pfn);
> >  		struct folio *folio = page_folio(page);
> > @@ -1413,6 +1412,8 @@ int migrate_device_range(unsigned long
> > *src_pfns, unsigned long start,
> >  
> >  	migrate_device_unmap(src_pfns, npages, NULL);
> >  
> > +	lru_cache_enable();
> > +
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(migrate_device_range);
> > @@ -1429,6 +1430,8 @@ int migrate_device_pfns(unsigned long
> > *src_pfns, unsigned long npages)
> >  {
> >  	unsigned long i, j;
> >  
> > +	lru_cache_disable();
> > +
> >  	for (i = 0; i < npages; i++) {
> >  		struct page *page = pfn_to_page(src_pfns[i]);
> >  		struct folio *folio = page_folio(page);
> > @@ -1446,6 +1449,8 @@ int migrate_device_pfns(unsigned long
> > *src_pfns, unsigned long npages)
> >  
> >  	migrate_device_unmap(src_pfns, npages, NULL);
> >  
> > +	lru_cache_enable();
> > +
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(migrate_device_pfns);
> > 
> > 
> > 
> > 
> > thanks,
