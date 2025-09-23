Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D374B948CF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 08:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD74A10E56F;
	Tue, 23 Sep 2025 06:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifSuwp+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F7910E56D;
 Tue, 23 Sep 2025 06:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758608761; x=1790144761;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6MSGrQ8Hj9U+UmiCusFa4W/DBv+soG9txOe7iVCeIdg=;
 b=ifSuwp+1gWe6PrC2Juh8OlBk3250BMVOpeN6l9LDE6VCTb4u9GTDdRJD
 dmXFTHuEIUX2Mj1MAG2I2LUSlXqB5K4SH/rSfk2s4P1l7+AtoK+2n+g2J
 lrzAnt8guI5Jh9sOpdYaA+tH3i+m5eRGYzqEFI2MQnA0KChzkXJY4SfbS
 d6bgTB+DYmX9VSLo+bsRkNv8IkovsXXWks1P0rKcjxip3GtrpobolEG8Y
 saCRUc306eaXa9gsoAQNYZd5eIUn7xFHa+n/o0ibsYiC7lQEQP8p+74tf
 tCaDh2gJKUD5o3Etvid3732zPwmNBwzK5S7GUXytSCqr2PXi+JxU/Vqr9 w==;
X-CSE-ConnectionGUID: XrZLpk8DSa+EWVCh+eCt+g==
X-CSE-MsgGUID: EzUw8zjLSNqm7A/in9/EAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64704955"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="64704955"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 23:26:00 -0700
X-CSE-ConnectionGUID: t7ORBKSLSn2cFiecI0UHuw==
X-CSE-MsgGUID: kl0/7c1WSQOw7tcafGHMrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="175969021"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 23:25:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 23:25:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 23:25:58 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 23:25:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z48CJ4b4nKHDCCgj48A/jm2EfQXmZTfLhFW96zGICfiST8heVrEOavUkk2FyMUzRGMUHh4jecVGMdmE+w88zx3hkgACucBZNsCQyOL6K/bI6hiF3pgOzUmhpukEU00Zl/qqgIiGU1MevnwvEaWyZJrosnEkEE3s1YQqJjWjOd74SqziOaUql1GWHrhf+T4ZmZIqAyoAEgR69PcsKlzcw+V1sFaL8f3qbswdqnldTk8oTpeGTNgfAmH7dEIIFROKSapFeH2V4UXmAJQXMofALkQlkww33RfX/Y8QZsTQfruhYXD7EYlkrXdaR+p2s4xTtjTBUDqRqhXWI+Qp4cHUcrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Y/rdPEOiBCOYSoBHCARrEsLTUKohFXIaY4ElCFxlqE=;
 b=whxgbKeVb3DffaVHncdbmJU8MS+51Zkq+daZm+H1oDl21gJGRgg4HjRNdsRgx0HWeMqrL+o25VLqQZZDjNiKYVw0OFfbSw+VumxCxl2UOYduq+LNvpc8NzDsyrwVoY2uwz6fVXFGQ0IPsR2QOSesn59CN8yMuywMHmLZl71UjskkNeqBFaAzLzXL+0wyWj2GmEVr00YX3sL2xiv0jQ3w+gKCWIeFwOZdFdk1wLmFBOQFsHrj29kJoa3HCHytfqpPn9wXWgcWCubhDWaukYDtUon3FULeXUpEiQ38b7Z5B7x90LcwbG4G8AWlE39oVjUWRBptYUVB0l3jN86uu/2anw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8748.namprd11.prod.outlook.com (2603:10b6:408:200::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 06:25:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 06:25:50 +0000
Date: Mon, 22 Sep 2025 23:25:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
References: <20250915072428.1712837-2-vivek.kasireddy@intel.com>
 <20250916175709.GA1324871@nvidia.com>
 <IA0PR11MB7185186F6AB160AA7F8F0FF3F816A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:303:b6::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f790488-47a9-41de-5ef2-08ddfa6a0a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVdiNXpsOStMeVZ6QzdnOGtGYkwyM0JPSUdHT1NuNkpaVHlpS29Eazd2NkR4?=
 =?utf-8?B?cFhFL2JBMzVSQi9jeFFSdGwxczRHRHQwSnVaN3JDbW1vZmloZEZsUlZNUHFh?=
 =?utf-8?B?Q3dtTWROZmp5Q2E2YlBqUVAzbUdVMmx5YTQwRERnalA4a1U4bkRSdmluZ1Nh?=
 =?utf-8?B?V21udGZla1FMUElMVUxMYkhIOEhnOUd1TzcyL2h6VFNBWHNzVTVycEdzdXZu?=
 =?utf-8?B?MXNSaHNLVUlQRThiUzJvYk92SjB2TEEwamV3ZitRd1Vxelo0TEwyd2tsaFNV?=
 =?utf-8?B?VTdxT1hLcUppUmtSUTNIYjhLcEN3OTJESEFGTTNBK1k4NUJTcnNLR2h1a1dy?=
 =?utf-8?B?bFF6YjJzNmJUSW5uWDd0bi9LSFJNVFpRQ1dIdHI5bzFwVGlwb2wzMG5HUTVP?=
 =?utf-8?B?VXRzNHo5akt1VDc4bExUU29ub3RKODZtZmEyZW9RWVpmTmQ4UnBsOThyQ25T?=
 =?utf-8?B?b1pLd2NGSnZIaFFDRGtyekdmRUxHUFdmdHZFR3U1dEE5dGRadGJDVDdtTi9r?=
 =?utf-8?B?TnBBWUZQdWZWeFlRUE5FR3dnb1hRUTZVNFVMSERtYW9Yc3ZDbllwUm1BN0dF?=
 =?utf-8?B?RVFFeG0wTjRlaUwybjlybjJyazRDOVNiaGR4KzJVTklOZ1pyTGlLT3B1b1g2?=
 =?utf-8?B?U3FuTTBSRUJQQmdIdG5oZXRTRjZOQ3JGK0lZb3pJcldXRDF4dzB0ZEsySFJO?=
 =?utf-8?B?dG9WNlpyS1ZYQm9GUm9TbmoybTVwUm1jMDRCa0MwYWswRkl6OW8vbUVCSFZp?=
 =?utf-8?B?TXZFcXpOL28rQ1pPdGdIL2ZxQzlMdDdGOSsrb0psajNFanVmeThUSjdUNmU4?=
 =?utf-8?B?Mys5QTNiS2NLMnBzeE5WeTNzR0hSUTM5RzBOS3ZSTjFUVHVLWGZJcEdZVzhF?=
 =?utf-8?B?aU5JRVRTYyswY0toYW54Z1o2Q3JITHF5MVVqeVhaeEhRTFBUNmhLN09wNlNm?=
 =?utf-8?B?dExmQVZWQTg1Z09xdjFVOGlKZWFrNzRDeHJWSzI0VXFrQVFYSzRQR0NHajJH?=
 =?utf-8?B?bTJCaElXdG1PT1g4Q2NwTTFrQytNUHVkVHVBRnh0VVovWTlhOENsWWQ2SkVp?=
 =?utf-8?B?eWxEUjkvaGR5dW1BYzNMcDNZTDI2TG90OHAvT1AyeDdvL056dlZ2Z2NWNmVV?=
 =?utf-8?B?TnJXRWl3M25FK3NiVlNHVXl6WStUU3dJOE1ZVWJodjBLT1pqMjZUK2NKclZV?=
 =?utf-8?B?SVBibjRLZGJ0bUNyekU0OVZSVW5OUnBrNTJsVm15RllCN1BmbHA0Zk54Tm5E?=
 =?utf-8?B?YUgreVhmTDJTTXRzTExHMzdFVDJjVmRWK20yNHhlak8vYTFXKzk4aytWL1NK?=
 =?utf-8?B?eHlEQ3ZIODNDU2U3M1ZOdmt0VktNcnlKV1JvcnpHdmF2ZGN1SzV0QWxZV1Zz?=
 =?utf-8?B?a3hsNi9BQ3BmK0l6L2liZXpHckRRV1RNTmxqV3hjSmUzeHF6QWl4ZVpVRmhj?=
 =?utf-8?B?eDRZc05VcS9OYjF4Uk8zUnZIYzltWEpkN0YzT1h1d0pUY1htMXd0anRYeFRY?=
 =?utf-8?B?ZktjT0ducXlTT045cU1GaUlUMWJ3NGU4emJGMEJxRU5MMVM3ZjFINnFPRmxj?=
 =?utf-8?B?bmxBcXhzUFRNN3RZQlBkSzB6cklNQ2V0UnZ6MTlJR3lJZGlRUW9sTFV3Tndu?=
 =?utf-8?B?RDQycWJBN01CeElHb2ZlUWUvSllNQ2FVZEpMUTNUSUJ6WThVZUk0RzkvQVRO?=
 =?utf-8?B?enZqWFZQenRVOUM0eDIvL0FNdVRrNkVXcWhpRVZmUklmOEFLS21Obk04VGwx?=
 =?utf-8?B?UDJVRzZKR1VlMTcrNUNyZGFvMWxpTnZyVGd1dEk4N0JJMXhMMHJzaVFUSHNO?=
 =?utf-8?B?cVArVlIranpsaWs2VTNUVkl2NWQzalNuWDZhNERqektWV3U3NzJHUWJiOE1F?=
 =?utf-8?B?eHN2Y1doYU5TZERLWE0zOXN1SVY0c0ZCbFI1VmQ5aGJKM1RhRGxxSHZQdFcr?=
 =?utf-8?Q?ynpUSL/9DV8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHF4TCsvaFQ5eklQZ1hSSlF4UUJIVytvS0NCbjNrS2l6TFkvSFNlblJkZ3l6?=
 =?utf-8?B?d0hOaWtOOEI2SWY3N3VoOVdsRkhwUkZQSGpTUTV3SmR3TXVFbE5HVWJLK2JX?=
 =?utf-8?B?RFI5cGdFb2h0YllxTGlPTmFQUm5vTkN0S1FJNEhmajBxdnNYbTlpRDFqUlg3?=
 =?utf-8?B?TEQ2YXYyY3NDQWplWTdXei92VDZhWE9Sd1VYOHBnV0VESTJnU2loVkpERXJu?=
 =?utf-8?B?WFM3T1VndStPUXkwL3pxajZLT3NTSU1COVc5cnVwWEZBQm0vdCt5L3hsKzBW?=
 =?utf-8?B?bWJiL0sreS9PZ1VBaVRlSGxHMjc0M280R2VEallQWHF0T29iTXJoOXc0QXdz?=
 =?utf-8?B?NnhvaWFIRlk5ODNRWUt2TGxBL3RwZVlRTmN2Y1FkK2gxczBvTVl6alA5a3hX?=
 =?utf-8?B?cXppOEhrMzZGVnBrc3FLTk12czNOZ2F5RVVPQy9ueEZvZFlUQnV1RlJjajIz?=
 =?utf-8?B?OWpPTGtUQk1RMjFhRExsYUNFaWh6akxzNHNWVk05Zk5YR0hia2RMdUh1S200?=
 =?utf-8?B?WVRjTDdzOHVQT2ZmVTBXc2VFTk44akR0YWJDOWNPVnZpUlQyZmNIclZBNGdI?=
 =?utf-8?B?L2x2YjNzaEJva2NCS2Vhd3BZKzBzSURXNSsxMnFhSElZWFcreWw2c09BaUVz?=
 =?utf-8?B?NW1RMC8yVHMrVExleHlKMy82TW95Yk1MSGlxV1JaTjVnVU4zMzVENGJ6MktL?=
 =?utf-8?B?MnhveGFWTHNWZmc1S2NrdlpxRndDcWRYSlFOcEN6a0tTM3ZZT2hHd0RVVjlm?=
 =?utf-8?B?UW1UYVlVZ0IzTm53UkJoMVNSUEdnLzNvWVZycnJyaWhUbndxSVBXcUl2RkJo?=
 =?utf-8?B?akpoczN6d2txdkRKd0JrZVJPNnBXOUJKQjh4clZoM1FJVk9PRW9ZdERjU05u?=
 =?utf-8?B?Tm9rMWdkZ1V4VlFJK2poMlB0K05wRmxVS2MvV3ZLZm5xaTljS1JvelJSbmJP?=
 =?utf-8?B?akNIanhvaGdwc1h3NHAwTjdTZjZCT3RBR25LcmJCZnN0RlgxWndwWmw0VEx2?=
 =?utf-8?B?SnUyL08vMGg3TUpaY1R4VitMa1VOMjhxaVMxekRYWTFBMXVEUEErMk8raXJs?=
 =?utf-8?B?TGVHTTh2MHJmZ2thdFVZYzVpM3ZSdUdPMjdueW81Nmo3Mm1QaVZUR2x4VFJZ?=
 =?utf-8?B?Y1Y0ejlId0lOTkJWSmY1VDVKVEtpTytlVWRPc1lzUkNCK1dPNHlWSWdycXdp?=
 =?utf-8?B?a3pOTGE5bVFzL3E0cUJJZXJxU2phNHFPbkxZcHkvK0JiM2lRRlA0akRjWENh?=
 =?utf-8?B?WHBlSEcrd2pxSy8rZFIyYitKb0RkcXZrUkZueW9UNkdYWjhRbEtCUGpZdXpI?=
 =?utf-8?B?KzBvQ0pocUVlTVR5d2xrQkkvQXlKQzFpSnExT29EOExKRzNON29YMmg1VDVr?=
 =?utf-8?B?SmRWa29ZaHMwSzJmN2U2WWIrSXR5OWtlck1VY0dWdEJ4ZUhlcGc1OGVuNlNO?=
 =?utf-8?B?TytCcHdibWJWcUNSTWd5TVVlMnB3aGJPeFJuZkxDb2VGQkk0b01VbXNhSGha?=
 =?utf-8?B?c2ZWSmdSc05JdUszQm9POVl1SnFlcmx4T1UyRW1tcGtnTE9BeGZjaTF4WG5s?=
 =?utf-8?B?SlhUSFpHVjdhRlJicFF0NGpITHlpTSthc0xWZU96ZlJhL2htWXkzU3lkQnhx?=
 =?utf-8?B?UTRtYlNDZXFJNVJCTk5nOWprajA3anZhdzZ1QzNyNWtRWjRmMXg5NGZnYmYy?=
 =?utf-8?B?dVk4eWZYOVVkbkx5aXBpM3N4VGo2c016dE5kMGJFWkx2dG1CQlQ2TGVuZzNu?=
 =?utf-8?B?elJWazY2dW5odnNqb1oyL1VKUmZhSnlFd0t6SlZYWGpidWJoRVJJNkYrYjEw?=
 =?utf-8?B?b1dnYlJyVWxqRGtWLzdxZWlYMGhMYzdtWURWb21YQ25yY012NzcvYTBZVE5w?=
 =?utf-8?B?SlI1bWVkVjB0RmlhZW9WZmdtdzRpTDYvYk5uTlBYVzE2UERwM0NuV0FSUHQz?=
 =?utf-8?B?emIydTNOa24zem1BcVcxekdpVjd1enBHdTFJZDNrVHYzeDQzME5CNzRQSUls?=
 =?utf-8?B?SktxN2piaHpBN290eU1ERWdZOEJUejF3YkFneWZlUk9OYVIrUjVrQ01ZN2h5?=
 =?utf-8?B?UW0zVzYzcjRoMmZ4RmQrTTlvTXE5RUM3dFZlbERqVmVzYlF1bmhXUGtNT0F0?=
 =?utf-8?B?NzM1TThFa1VIdnZDLzYvbVo1VEs2SGtxK1BBNFFIOTdDa0JMYnNxZ1BnWHJs?=
 =?utf-8?B?N2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f790488-47a9-41de-5ef2-08ddfa6a0a34
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 06:25:50.2638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbGnLP8/nVcTQZP7lpN5EuCdRCFcv2V6S8sEHjGLXnZyFy028VgEzPePWzW4vkGU73vaCdpR8fCK1OzFej8JxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8748
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

On Mon, Sep 22, 2025 at 11:53:06PM -0600, Kasireddy, Vivek wrote:
> Hi Jason,
> 
> > Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
> > functions of Intel GPUs
> > 
> > On Mon, Sep 22, 2025 at 01:22:49PM +0200, Christian König wrote:
> > 
> > > Well what exactly is happening here? You have a PF assigned to the
> > > host and a VF passed through to a guest, correct?
> > >
> > > And now the PF (from the host side) wants to access a BAR of the VF?
> > 
> > Not quite.
> > 
> > It is a GPU so it has a pool of VRAM. The PF can access all VRAM and
> > the VF can access some VRAM.
> > 
> > They want to get a DMABUF handle for a bit of the VF's reachable VRAM
> > that the PF can import and use through it's own funciton.
> > 
> > The use of the VF's BAR in this series is an ugly hack.
> IIUC, it is a common practice among GPU drivers including Xe and Amdgpu
> to never expose VRAM Addresses and instead have BAR addresses as DMA
> addresses when exporting dmabufs to other devices. Here is the relevant code
> snippet in Xe:
>                 phys_addr_t phys = cursor.start + xe_vram_region_io_start(tile->mem.vram);             
>                 size_t size = min_t(u64, cursor.size, SZ_2G);                         
>                 dma_addr_t addr;                                                      
>                                                                                       
>                 addr = dma_map_resource(dev, phys, size, dir,                         
>                                         DMA_ATTR_SKIP_CPU_SYNC);
> 
> And, here is the one in amdgpu:
>         for_each_sgtable_sg((*sgt), sg, i) {
>                 phys_addr_t phys = cursor.start + adev->gmc.aper_base;
>                 unsigned long size = min(cursor.size, AMDGPU_MAX_SG_SEGMENT_SIZE);
>                 dma_addr_t addr;
> 
>                 addr = dma_map_resource(dev, phys, size, dir,
>                                         DMA_ATTR_SKIP_CPU_SYNC);
> 

I've read through this thread—Jason, correct me if I'm wrong—but I
believe what you're suggesting is that instead of using PCIe P2P
(dma_map_resource) to communicate the VF's VRAM offset to the PF, we
should teach dma-buf to natively understand a VF's VRAM offset. I don't
think this is currently built into dma-buf, but it probably should be,
as it could benefit other use cases as well (e.g., UALink, NVLink,
etc.).

In both examples above, the PCIe P2P fabric is used for communication,
whereas in the VF→PF case, it's only using the PCIe P2P address to
extract the VF's VRAM offset, rather than serving as a communication
path. I believe that's Jason's objection. Again, Jason, correct me if
I'm misunderstanding here.

Assuming I'm understanding Jason's comments correctly, I tend to agree
with him.

> And, AFAICS, most of these drivers don't see use the BAR addresses directly
> if they import a dmabuf that they exported earlier and instead do this:
> 
>         if (dma_buf->ops == &xe_dmabuf_ops) {
>                 obj = dma_buf->priv;
>                 if (obj->dev == dev &&
>                     !XE_TEST_ONLY(test && test->force_different_devices)) {
>                         /*
>                          * Importing dmabuf exported from out own gem increases
>                          * refcount on gem itself instead of f_count of dmabuf.
>                          */
>                         drm_gem_object_get(obj);
>                         return obj;
>                 }
>         }

This code won't be triggered on the VF→PF path, as obj->dev == dev will
fail.

> 
> >The PF never actually uses the VF BAR
> That's because the PF can't use it directly, most likely due to hardware limitations.
> 
> >it just hackily converts the dma_addr_t back
> > to CPU physical and figures out where it is in the VRAM pool and then
> > uses a PF centric address for it.
> > 
> > All they want is either the actual VRAM address or the CPU physical.
> The problem here is that the CPU physical (aka BAR Address) is only
> usable by the CPU. Since the GPU PF only understands VRAM addresses,
> the current exporter (vfio-pci) or any VF/VFIO variant driver cannot provide
> the VRAM addresses that the GPU PF can use directly because they do not
> have access to the provisioning data.
>

Right, we need to provide the offset within the VRAM provisioning, which
the PF can resolve to a physical address based on the provisioning data.
The series already does this—the problem is how the VF provides
this offset. It shouldn't be a P2P address, but rather a native
dma-buf-provided offset that everyone involved in the attachment
understands.
 
> However, it is possible that if vfio-pci or a VF/VFIO variant driver had access
> to the VF's provisioning data, then it might be able to create a dmabuf with
> VRAM addresses that the PF can use directly. But I am not sure if exposing
> provisioning data to VFIO drivers is ok from a security standpoint or not.
> 

I'd prefer to leave the provisioning data to the PF if possible. I
haven't fully wrapped my head around the flow yet, but it should be
feasible for the VF → VFIO → PF path to pass along the initial VF
scatter-gather (SG) list in the dma-buf, which includes VF-specific
PFNs. The PF can then use this, along with its provisioning information,
to resolve the physical address.

Matt

> Thanks,
> Vivek
> 
> > 
> > Jason
