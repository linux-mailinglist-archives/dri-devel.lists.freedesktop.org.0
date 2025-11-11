Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9A6C4A2DD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08A010E4B9;
	Tue, 11 Nov 2025 01:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlwU6PFT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5F010E480;
 Tue, 11 Nov 2025 01:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823145; x=1794359145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LWn4AKvWKMbUdfeQBKrgh65iq0HlfVqG2AVOpgbcpAk=;
 b=OlwU6PFT7o4DJis85YfTjfMIBCILNNkPQyqEXvIJ9Sijk3jZ9ZPEvOBq
 yNMgw1pFqr1c9DzpRnp4DfDNbpPWscJK1S/FSPwNp+wAc4itlUwj/J9sH
 smfjBLeUSGcENx+i17sHnvIh7lz/J+to8oe1meE614663V4bZr2vIbmYi
 S/w0KfmPkMDo7g8qF5did1ieFNrNL0axkXE3gJUg+NnO1a7enlhckEKoE
 DCMOuOeh0c+7UN0DGEClWdCgXoACHnbjwcW6Rsy+7eVHeQBlHBaP98TyN
 2XYb7rxgRdoOnvaZGH5rOuZSMgE8/Bra6p7vJ5UhfqIfnyPS856aHGIzn g==;
X-CSE-ConnectionGUID: xGBWJQi7QIugFkP72qnhYA==
X-CSE-MsgGUID: 7YYcEvQ/QGWPl0WcmUIoJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76334067"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="76334067"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:44 -0800
X-CSE-ConnectionGUID: 6ppReKIBQkqXtzQD9hDG8A==
X-CSE-MsgGUID: 9VQHKiglQW26Jcr0BfCFTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188081847"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:44 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:05:43 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q68KwVgnLYvGvOASB0rLm5Bx6ILyj1cfwN2mYMnO2rcV3uT6twUQqa6yHglRb3+jp1Busq3kCpb8rRuiNmXoFSjfUJgeCwcfJl5vBre3ptL9Sox7hdP7OF81rCx6ELeCSQjm/PWCcZ3u/l1gDMivsUhcck7gx6fKx8D5p1AVh6xyigbHARpaqRaLoQf0Ugnyav3l0ngB4Hox8hNQzSBKUZx/aGVLE/g8woHv5At34QbECHJBdipa52NMnQ1iCoq15VkqOc4cMtLnku1WKopmglw5JO/X46A4xt29nMeFsodrwCcMgv6aurrGs/M2AowQctVyOXKFAm5ZPKHHP7gCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4u3lcWS0P3f3SEZtPiV1rCAAHXs26Er7SCLzXTQDKYU=;
 b=dNR8zyVyzQGx9StUa2NjumUcV9Auoc4oFCFDg/d5Q5gmBn4JkKVbtCFJQGOLkro90SBW0TMgxyMhC8SwJl2/l7lwpyChUeDVvY586Ydsw13EeZd4kMqWTobUQLeK/cUoAcJoe5qd6GCojonTyujwTc55YQz3kZ4HoD6lMsZL63EflvzUUB7bwr8wxIPePxQXsLD7UK600XAmtfQHY0ci70UMduo3MtjCK4o3l0RamNhPjmBHpWelY3rkRY1OsZSt3ju7W54MSH8+98hAYo6jVTRPWk/wMysoXUBKOKa5zK+IX1Qq0aFWmJ0GH95P/NeLp3OWU9ywAtNgP2SOGadNmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:05:39 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:05:39 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v5 07/28] drm/xe/pf: Add support for encap/decap of bitstream
 to/from packet
Date: Tue, 11 Nov 2025 02:04:18 +0100
Message-ID: <20251111010439.347045-8-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 7afbeb12-5128-445d-d30f-08de20be6e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlByYmdCbCs5SUZJY29Wdmo1Ri9iRWNBdGt4MWhNbEt4bWhNZkFTUmxUdkZy?=
 =?utf-8?B?aSswTkV4RXkxd2NWTnNzbDJkU3VxZmxvUmxZZUxBVUtJMFR0dFkzV3Z6WURw?=
 =?utf-8?B?cTUzaythTnV6VUJHOXdDMGIyajI5WEozeGVFaGVMa1YxdXVwaTUzc01nR1FF?=
 =?utf-8?B?ZWZTSzFCZjkra3dUUmhVUXpFYndFRTJicVVYN1ZwclptT3E1VFRrbTFydFN4?=
 =?utf-8?B?MHhUVm9ISHpZUjRGeEVBQkwydldxWGdNc29tdGdHK0txVW8zRE9OMFhCTm5C?=
 =?utf-8?B?Ym1CQ1J0VzRoT0Vsc3VwdWx5WmQvaEhnR1R2SnlCMjVYOG0wMVBhd0xzWmtq?=
 =?utf-8?B?K1FrcURqR3lSc3VkNERWdmRoT3NmUUk4eEpHbDFTWnJrZEtHRktsVk44eGlp?=
 =?utf-8?B?cm50Y0ZWbDU1Z3c3NHZ0MzRmRXgxVjlhcEFGQStOaE5FT0lFbFVkS2hLaWpZ?=
 =?utf-8?B?eEgrNXlhMjl3Nmtoak9yMStMV3pGcGxEZTRja1NiV01mamRrQ0FReldCbmJm?=
 =?utf-8?B?OGJraGc2bHFOeGRHejRCa3hSemM5SEx2RjBjWnpGK28rTDZTZTRiVVN1OW1T?=
 =?utf-8?B?UUN0RnluOTFPUUhhZkxDZ3VPampoTWNSREt4OEEvZTZTb2tvYllHVUREbFY2?=
 =?utf-8?B?ekJKY25yd2x5NTJvdDJlbnBaak5paUhYQnRFSmdJeDI1d0VCL1hKS093VW05?=
 =?utf-8?B?dFNsb3J4MzNGc3Q3elhEbjlHUHRYcmxHdWtvczJ1bWpjNU5qRjRZazhJVlhi?=
 =?utf-8?B?dVJ4cTVieitYOURmdVA2Z0c5eStUWDZXVFRuRVlPQUgvWGE0aW8xK2RRMHJV?=
 =?utf-8?B?eWU1NHdBcmU0bUloWVhHNitoZjRxbUVvQUQwUWhKSnRZZXJ5QTE5dW4yV0Q4?=
 =?utf-8?B?SVJzbVc0MUlOTTNlRnJvQ1dONmtNdCtEU2JMVmx1VDZCaUJWUjZiUUliakl4?=
 =?utf-8?B?Q2srR3hyV1hRTVVtVmpubWlzUzVrRGUweFp2anhOV0JpL1JGMWJQaGJHOUU1?=
 =?utf-8?B?RjZzbGZuVzhLUEhQcXc4cnZ6YWN5UVQ1NXFXNnBpNTQwZklEdmcxZ3dQQ2Vm?=
 =?utf-8?B?K1p4SmNTMGtnMXd3bzlER1NIQmFVQkVWclZ1MUZ5cGs1b2Z0TzcyWEROUVVv?=
 =?utf-8?B?eFJ0azNGdnRVOVprNER6TEU4SHVueUtoZm1wSTJjT2FnczdxajRjRGJRNllx?=
 =?utf-8?B?U2IzelJZSHJvRmZRUmNxTURnUTBVczZINTl6dEF6WEtXOW9BNkFaNkR4TDJl?=
 =?utf-8?B?NHRDWVJNdml5TDV5M3FPblpjc3ppUGpVQTEzRUhSazN2YWJJc0ZleUFQbVNC?=
 =?utf-8?B?Vi9QVWU0a3VWV0tIcExHNDlVeEVlZCs3NzZmKy9EVG1lSURFUW94ZFdZcjl5?=
 =?utf-8?B?ZFNnOEo5Wm53cjlIT1FqR2xpT2lUYnBZMENBNzVtdU80T2FuQzN5MHFJckxU?=
 =?utf-8?B?eXFLUDVKeDd0Vm0zSk1HRmxnK1I3dWZjVHB3ZzI5MUM4NkRGYUJDRGk3UFNh?=
 =?utf-8?B?b3NUcWJ4MlJXSGx5THQ1TGczbit2cU5iRkFURGxmRnFxOVQwaHM4YlZRLy90?=
 =?utf-8?B?Y3NqQ2NCcHY5UmY0eEdqKzJhYmkrNWZpaEFuWWFLbzdLZERKK1VhNVVsMklM?=
 =?utf-8?B?Mk5pTmZmN3hlOVVzNkxpZk45cS8yaGZwSldKS1BnSUtFN241ditXRTZ6c3c0?=
 =?utf-8?B?bGVsSnZTWFN2Ty9wYkkzUXpMQUxzSTZuNnU5dEc2ckNvMG5MOGxDNnMwT0ZJ?=
 =?utf-8?B?ZVZRMW1xMDJ1aWhqaHBIOVFYZlpuNDdWZm9hcGZETE5lTUhnc3VTR1d5d005?=
 =?utf-8?B?Y0ZySGcyVTczUTdyTjhSL2tyTzhKNTk2V2VCM2FOZjRyN3hzWHlmRm9kMWgw?=
 =?utf-8?B?K1ZMWFRseG9wVDE3T2IzQ3lyRmNRbGRXVGFGbk15d1N2dWZCS3JrSDhtQlIx?=
 =?utf-8?B?R1ZsT2RFeVNQSFFRUUNQWjFhOTFIWWd4OCs1ckZPWjZaUExuZ2dIRkRNT3Jj?=
 =?utf-8?Q?fb+5BaXPBG1mJDGmDyf8lXBTLZtJcQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjlWMjg1VG94UXRCcjUvSWsvQytOaGV4MTR2ZHRYNVN0akV1QUNzdHEvcTQ3?=
 =?utf-8?B?czRya01DRjZ2emN3ZTFqMkV0cnlHRVhoNmJpakZZNjRkcUVQemhDQ2dPdkVL?=
 =?utf-8?B?b0FEY3owcGdJMmZUWGJ2clZFcXRmWWROUVVKdEg5c1kreG1oZ0NGazdNR1ZB?=
 =?utf-8?B?NkFNdi9QUjJOSHVUT0tickxEdmwyL2VMMG1FcjZvT2hKNGNQSXIwT3luZ1ZX?=
 =?utf-8?B?MFZqclNtT2FzL1NQdkpFeDRmUEltTmFmQ1UwN01QUWJtZ296akNMaWl4RHY5?=
 =?utf-8?B?VkJSeENPR3lXRG9WNTVUSXNJY1pJQm42UGdCQUFlNVRWK3pkbHZOeG4wUHda?=
 =?utf-8?B?TWJaYmFNN1AwNUFRcmM1Slp2dy9TN2g0NitzOGt2clFKd2RwM0Z0dHF5NDZB?=
 =?utf-8?B?OUkzTis1SkxMRFNXczM3aWJBaHF3ejcrVlRkTFFuYUE5dUZNMVdudzk5U3hG?=
 =?utf-8?B?VTJESGliNHlCWXlMbjBpOFgrUzF4OHVQOEE3Z3J5V01wMGM0QlgzTGRjWnFS?=
 =?utf-8?B?Nll0Ky9VL1hsWWZMMFFNZ2NPdGpUbGt6bUx6WnRSZittR1A2UXg3ZnM3MEpz?=
 =?utf-8?B?amRUQklxUTg5RHFBRnREOUpldXZXVUxrN0Z4Qlg0QWd2WGRUSS9CR0ozZmJQ?=
 =?utf-8?B?V3puVzdCTlZoUE1kT0JJYlRaVTVyR2QrQi8wVlhaSGU3OWQ4aDZaeHZiQXVy?=
 =?utf-8?B?MWtEYmtnUzQxSytvSkZGcUZwQy9ZOFh0TEJGRlpNa0IxYk1ndkVsVWRTNUZt?=
 =?utf-8?B?YmVKRzI5blFZd2hHOHRrTEpVSDlvb2ZXWmxsNWNiS0cyUVowUXVhSml4Zmw4?=
 =?utf-8?B?NGs1Qmp0RHdtVUJlQkJqdjROaFNuMVNSR25tNlZlWHFUTlowOUFTTXd5eXh0?=
 =?utf-8?B?Z0ZxQ0JlSExpT0dFWWtmcDJIY1Rpa0thWVQxakdxNWpOQnR6TWZlYU1aV2Nr?=
 =?utf-8?B?ZnFRWmZxaGN4ZHVEZkk1VmVzeTZDazJpMncrMXdVT2lPNm53UGpmQjcxendZ?=
 =?utf-8?B?d0twdFlkR2hmN1hNcmVUcUUraWh6U2Zhdk9VTUZrUmRpdm5oWDQ0ckRvRFpC?=
 =?utf-8?B?Wi95ejh6Q3Y2WUFNbVFXdXpNdDJGY3drTkJOckVPR1BXYXVKalRoWDE4aXBy?=
 =?utf-8?B?aVg5bi9Hc1gyeEhnQVVYOW9aaWZ0OFc0TWtvdDB2U0tNVlAraG9ndjQvRHN0?=
 =?utf-8?B?bDlQZlZzYVJMbEJEemNQWU9HeE5pSWd0alovQXN3bW1BNGJLZmZKQlNBM29R?=
 =?utf-8?B?ZjhRRjlnZ2NwNWFRcHpEK3pEeTJPM1FZL0ZLSlFURDl5b0Z3LzBXUnpBeEUv?=
 =?utf-8?B?S1BmWkpuWGY0SlBqS1UwRFFuYTBLb2Z4a000NmRNY2I0Wk5QVmI0cDJ2UW8v?=
 =?utf-8?B?UGZKQ1ZQWTFpWHdMNFFzcHZ4OTFicUc0YVJoeU5EUTBFRFAxazUwaytDZTR3?=
 =?utf-8?B?dVVnNFk4WGxlWi80K0hTcUF3ek52U093RUcyRzB0OWYxckZ1UHJVSjRiT01P?=
 =?utf-8?B?NkJtMGZ6MjhCYkVJQ3NVQXh2VkFiTWE5STRZSEtHYXQ4b0h5MGl4REV1WDNN?=
 =?utf-8?B?eHlab2tCWnpYTUJkQUVTeGhlVVdtQXNaNEV0dVA0aFl2bzlyK2NiQ01LN0hL?=
 =?utf-8?B?NGloVlR1R3FQVEpKK1U1SmFiQUcrTkFzTTdCbGFEa1JEaCt6TTNUSUVoQWZ6?=
 =?utf-8?B?cEdidlZBV2JLMTltMmJIUXVRY0FZYkRxUEl5enFjeFdSeXF4cjhjQWJxOW1X?=
 =?utf-8?B?L0JybUF3bkp6Tm4ra1loMDdKMTZQaG1LSkxkb1RlN2E0Vnl1OXpUWUhlQmFU?=
 =?utf-8?B?UVVVY3dqOGZvbHFMNWJLdDNqVzZIK2R2dndjWmhyYlYzZWFCU2JhQ2YxdENh?=
 =?utf-8?B?K0hHU2pPYlVYTDRPUXF0NjBDSldMaUJpL0tubVk1MDM2VTJwNXhWbjYyR0Nn?=
 =?utf-8?B?LzUzOTNIMDlBSEtzamhFNEJlMFEzNlRKaWRZcHBTUzB6UzhvNjlGb0pHdnRC?=
 =?utf-8?B?eWUybTJtdk5xdnNvR1hUVEJ3OTYyM3YrYWZLWnpiVElCUUpJU3NiWlNLMFFB?=
 =?utf-8?B?Z3FpaWRYekVVck5QUXpDdC8rMDhSdmtKdUFHZVlGN0p6SFFMc3dqNGFDeis4?=
 =?utf-8?B?Y1oydklVeDBMZ0hIMzR6TEh5SjNFRm1CT3g4THpTeVRJVnozeEgyeGhYelVO?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afbeb12-5128-445d-d30f-08de20be6e0f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:05:39.8053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBvNYDYawzTjERy+n9E+x2igfUH6F4Zg5+kzmNGvf2TznrqUHlezgD7Jr4tHUyfgCQ1gYh/3sy2iSf5h83OAupizkXAvI6LYbSPRWQEszGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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

Add debugfs handlers for migration state and handle bitstream
.read()/.write() to convert from bitstream to/from migration data
packets.
As descriptor/trailer are handled at this layer - add handling for both
save and restore side.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_packet.c          | 293 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_packet.h          |   6 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  35 +++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 121 ++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   5 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   9 +
 7 files changed, 474 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
index 1ac7e025e9fd9..c612f37e9707c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.c
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -8,6 +8,67 @@
 #include "xe_printk.h"
 #include "xe_sriov_packet.h"
 #include "xe_sriov_packet_types.h"
+#include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
+#include "xe_sriov_printk.h"
+
+static struct mutex *pf_migration_mutex(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+
+	return &xe->sriov.pf.vfs[vfid].migration.lock;
+}
+
+static struct xe_sriov_packet **pf_pick_pending(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.pending;
+}
+
+static struct xe_sriov_packet **
+pf_pick_descriptor(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.descriptor;
+}
+
+static struct xe_sriov_packet **pf_pick_trailer(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.trailer;
+}
+
+static struct xe_sriov_packet **pf_pick_read_packet(struct xe_device *xe,
+						    unsigned int vfid)
+{
+	struct xe_sriov_packet **data;
+
+	data = pf_pick_descriptor(xe, vfid);
+	if (*data)
+		return data;
+
+	data = pf_pick_pending(xe, vfid);
+	if (!*data)
+		*data = xe_sriov_pf_migration_save_consume(xe, vfid);
+	if (*data)
+		return data;
+
+	data = pf_pick_trailer(xe, vfid);
+	if (*data)
+		return data;
+
+	return NULL;
+}
 
 static bool pkt_needs_bo(struct xe_sriov_packet *data)
 {
@@ -135,3 +196,235 @@ int xe_sriov_packet_init_from_hdr(struct xe_sriov_packet *data)
 
 	return pkt_init(data);
 }
+
+static ssize_t pkt_hdr_read(struct xe_sriov_packet *data,
+			    char __user *buf, size_t len)
+{
+	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
+
+	if (!data->hdr_remaining)
+		return -EINVAL;
+
+	if (len > data->hdr_remaining)
+		len = data->hdr_remaining;
+
+	if (copy_to_user(buf, (void *)&data->hdr + offset, len))
+		return -EFAULT;
+
+	data->hdr_remaining -= len;
+
+	return len;
+}
+
+static ssize_t pkt_data_read(struct xe_sriov_packet *data,
+			     char __user *buf, size_t len)
+{
+	if (len > data->remaining)
+		len = data->remaining;
+
+	if (copy_to_user(buf, data->vaddr + (data->hdr.size - data->remaining), len))
+		return -EFAULT;
+
+	data->remaining -= len;
+
+	return len;
+}
+
+static ssize_t pkt_read_single(struct xe_sriov_packet **data,
+			       unsigned int vfid, char __user *buf, size_t len)
+{
+	ssize_t copied = 0;
+
+	if ((*data)->hdr_remaining)
+		copied = pkt_hdr_read(*data, buf, len);
+	else
+		copied = pkt_data_read(*data, buf, len);
+
+	if ((*data)->remaining == 0 && (*data)->hdr_remaining == 0) {
+		xe_sriov_packet_free(*data);
+		*data = NULL;
+	}
+
+	return copied;
+}
+
+/**
+ * xe_sriov_packet_read_single() - Read migration data from a single packet.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested read size from userspace
+ *
+ * Return: number of bytes that has been successfully read,
+ *	   0 if no more migration data is available,
+ *	   -errno on failure.
+ */
+ssize_t xe_sriov_packet_read_single(struct xe_device *xe, unsigned int vfid,
+				    char __user *buf, size_t len)
+{
+	struct xe_sriov_packet **data = pf_pick_read_packet(xe, vfid);
+
+	if (!data)
+		return -ENODATA;
+	if (IS_ERR(*data))
+		return PTR_ERR(*data);
+
+	return pkt_read_single(data, vfid, buf, len);
+}
+
+static ssize_t pkt_hdr_write(struct xe_sriov_packet *data,
+			     const char __user *buf, size_t len)
+{
+	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
+	int ret;
+
+	if (len > data->hdr_remaining)
+		len = data->hdr_remaining;
+
+	if (copy_from_user((void *)&data->hdr + offset, buf, len))
+		return -EFAULT;
+
+	data->hdr_remaining -= len;
+
+	if (!data->hdr_remaining) {
+		ret = xe_sriov_packet_init_from_hdr(data);
+		if (ret)
+			return ret;
+	}
+
+	return len;
+}
+
+static ssize_t pkt_data_write(struct xe_sriov_packet *data,
+			      const char __user *buf, size_t len)
+{
+	if (len > data->remaining)
+		len = data->remaining;
+
+	if (copy_from_user(data->vaddr + (data->hdr.size - data->remaining), buf, len))
+		return -EFAULT;
+
+	data->remaining -= len;
+
+	return len;
+}
+
+/**
+ * xe_sriov_packet_write_single() - Write migration data to a single packet.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested write size from userspace
+ *
+ * Return: number of bytes that has been successfully written,
+ *	   -errno on failure.
+ */
+ssize_t xe_sriov_packet_write_single(struct xe_device *xe, unsigned int vfid,
+				     const char __user *buf, size_t len)
+{
+	struct xe_sriov_packet **data = pf_pick_pending(xe, vfid);
+	int ret;
+	ssize_t copied;
+
+	if (IS_ERR_OR_NULL(*data)) {
+		*data = xe_sriov_packet_alloc(xe);
+		if (!*data)
+			return -ENOMEM;
+	}
+
+	if ((*data)->hdr_remaining)
+		copied = pkt_hdr_write(*data, buf, len);
+	else
+		copied = pkt_data_write(*data, buf, len);
+
+	if ((*data)->hdr_remaining == 0 && (*data)->remaining == 0) {
+		ret = xe_sriov_pf_migration_restore_produce(xe, vfid, *data);
+		if (ret) {
+			xe_sriov_packet_free(*data);
+			return ret;
+		}
+
+		*data = NULL;
+	}
+
+	return copied;
+}
+
+#define MIGRATION_DESCRIPTOR_DWORDS 0
+static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_packet **desc = pf_pick_descriptor(xe, vfid);
+	struct xe_sriov_packet *data;
+	int ret;
+
+	data = xe_sriov_packet_alloc(xe);
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_packet_init(data, 0, 0, XE_SRIOV_PACKET_TYPE_DESCRIPTOR,
+				   0, MIGRATION_DESCRIPTOR_DWORDS * sizeof(u32));
+	if (ret) {
+		xe_sriov_packet_free(data);
+		return ret;
+	}
+
+	*desc = data;
+
+	return 0;
+}
+
+static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_packet **data = pf_pick_pending(xe, vfid);
+
+	*data = NULL;
+}
+
+#define MIGRATION_TRAILER_SIZE 0
+static int pf_trailer_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_packet **trailer = pf_pick_trailer(xe, vfid);
+	struct xe_sriov_packet *data;
+	int ret;
+
+	data = xe_sriov_packet_alloc(xe);
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_packet_init(data, 0, 0, XE_SRIOV_PACKET_TYPE_TRAILER,
+				   0, MIGRATION_TRAILER_SIZE);
+	if (ret) {
+		xe_sriov_packet_free(data);
+		return ret;
+	}
+
+	*trailer = data;
+
+	return 0;
+}
+
+/**
+ * xe_sriov_packet_save_init() - Initialize the pending save migration packets.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int xe_sriov_packet_save_init(struct xe_device *xe, unsigned int vfid)
+{
+	int ret;
+
+	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
+		ret = pf_descriptor_init(xe, vfid);
+		if (ret)
+			return ret;
+
+		ret = pf_trailer_init(xe, vfid);
+		if (ret)
+			return ret;
+
+		pf_pending_init(xe, vfid);
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.h b/drivers/gpu/drm/xe/xe_sriov_packet.h
index 282a35e77fb39..fd8da5069b53f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.h
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.h
@@ -19,4 +19,10 @@ int xe_sriov_packet_init(struct xe_sriov_packet *data, u8 tile_id, u8 gt_id,
 			 enum xe_sriov_packet_type, loff_t offset, size_t size);
 int xe_sriov_packet_init_from_hdr(struct xe_sriov_packet *data);
 
+ssize_t xe_sriov_packet_read_single(struct xe_device *xe, unsigned int vfid,
+				    char __user *buf, size_t len);
+ssize_t xe_sriov_packet_write_single(struct xe_device *xe, unsigned int vfid,
+				     const char __user *buf, size_t len);
+int xe_sriov_packet_save_init(struct xe_device *xe, unsigned int vfid);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index e7b904e57b68c..7789d9e1409c9 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -5,6 +5,7 @@
 
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_control.h"
+#include "xe_sriov_packet.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_printk.h"
 
@@ -165,6 +166,10 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
 	unsigned int id;
 	int ret;
 
+	ret = xe_sriov_packet_save_init(xe, vfid);
+	if (ret)
+		return ret;
+
 	for_each_gt(gt, xe, id) {
 		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
 		if (ret)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index e0e6340c49106..4ca86ff4b7dae 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -13,6 +13,7 @@
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_debugfs.h"
 #include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_provision.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_printk.h"
@@ -132,6 +133,7 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
  *      /sys/kernel/debug/dri/BDF/
  *      ├── sriov
  *      │   ├── vf1
+ *      │   │   ├── migration_data
  *      │   │   ├── pause
  *      │   │   ├── reset
  *      │   │   ├── resume
@@ -220,6 +222,38 @@ DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
 
+static ssize_t data_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+
+	if (*pos)
+		return -ESPIPE;
+
+	return xe_sriov_pf_migration_write(xe, vfid, buf, count);
+}
+
+static ssize_t data_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
+{
+	struct dentry *dent = file_dentry(file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+
+	if (*ppos)
+		return -ESPIPE;
+
+	return xe_sriov_pf_migration_read(xe, vfid, buf, count);
+}
+
+static const struct file_operations data_vf_fops = {
+	.owner		= THIS_MODULE,
+	.open		= simple_open,
+	.write		= data_write,
+	.read		= data_read,
+	.llseek		= default_llseek,
+};
+
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
 	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
@@ -228,6 +262,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
 	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
 	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
+	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index 11bc2e33373c8..ad5a45ddb2ae4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -10,6 +10,7 @@
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
+#include "xe_sriov_packet.h"
 #include "xe_sriov_packet_types.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_migration.h"
@@ -54,6 +55,15 @@ static bool pf_check_migration_support(struct xe_device *xe)
 	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
 }
 
+static void pf_migration_cleanup(void *arg)
+{
+	struct xe_sriov_migration_state *migration = arg;
+
+	xe_sriov_packet_free(migration->pending);
+	xe_sriov_packet_free(migration->trailer);
+	xe_sriov_packet_free(migration->descriptor);
+}
+
 /**
  * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
  * @xe: the &xe_device
@@ -63,6 +73,7 @@ static bool pf_check_migration_support(struct xe_device *xe)
 int xe_sriov_pf_migration_init(struct xe_device *xe)
 {
 	unsigned int n, totalvfs;
+	int err;
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
@@ -74,7 +85,15 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
 	for (n = 1; n <= totalvfs; n++) {
 		struct xe_sriov_migration_state *migration = pf_pick_migration(xe, n);
 
+		err = drmm_mutex_init(&xe->drm, &migration->lock);
+		if (err)
+			return err;
+
 		init_waitqueue_head(&migration->wq);
+
+		err = devm_add_action_or_reset(xe->drm.dev, pf_migration_cleanup, migration);
+		if (err)
+			return err;
 	}
 
 	return 0;
@@ -155,6 +174,36 @@ xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
 	return data;
 }
 
+static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
+				struct xe_sriov_packet *data)
+{
+	if (data->hdr.tile_id != 0 || data->hdr.gt_id != 0)
+		return -EINVAL;
+
+	xe_sriov_packet_free(data);
+
+	return 0;
+}
+
+static int pf_handle_trailer(struct xe_device *xe, unsigned int vfid,
+			     struct xe_sriov_packet *data)
+{
+	struct xe_gt *gt;
+	u8 gt_id;
+
+	if (data->hdr.tile_id != 0 || data->hdr.gt_id != 0)
+		return -EINVAL;
+	if (data->hdr.offset != 0 || data->hdr.size != 0 || data->buff || data->bo)
+		return -EINVAL;
+
+	xe_sriov_packet_free(data);
+
+	for_each_gt(gt, xe, gt_id)
+		xe_gt_sriov_pf_control_restore_data_done(gt, vfid);
+
+	return 0;
+}
+
 /**
  * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
  * @xe: the &xe_device
@@ -174,6 +223,11 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
+	if (data->hdr.type == XE_SRIOV_PACKET_TYPE_DESCRIPTOR)
+		return pf_handle_descriptor(xe, vfid, data);
+	if (data->hdr.type == XE_SRIOV_PACKET_TYPE_TRAILER)
+		return pf_handle_trailer(xe, vfid, data);
+
 	gt = xe_device_get_gt(xe, data->hdr.gt_id);
 	if (!gt || data->hdr.tile_id != gt->tile->id) {
 		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
@@ -183,3 +237,70 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
 
 	return xe_gt_sriov_pf_migration_restore_produce(gt, vfid, data);
 }
+
+/**
+ * xe_sriov_pf_migration_read() - Read migration data from the device.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested read size from userspace
+ *
+ * Return: number of bytes that has been successfully read,
+ *	   0 if no more migration data is available,
+ *	   -errno on failure.
+ */
+ssize_t xe_sriov_pf_migration_read(struct xe_device *xe, unsigned int vfid,
+				   char __user *buf, size_t len)
+{
+	struct xe_sriov_migration_state *migration = pf_pick_migration(xe, vfid);
+	ssize_t ret, consumed = 0;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	scoped_cond_guard(mutex_intr, return -EINTR, &migration->lock) {
+		while (consumed < len) {
+			ret = xe_sriov_packet_read_single(xe, vfid, buf, len - consumed);
+			if (ret == -ENODATA)
+				break;
+			if (ret < 0)
+				return ret;
+
+			consumed += ret;
+			buf += ret;
+		}
+	}
+
+	return consumed;
+}
+
+/**
+ * xe_sriov_pf_migration_write() - Write migration data to the device.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested write size from userspace
+ *
+ * Return: number of bytes that has been successfully written,
+ *	   -errno on failure.
+ */
+ssize_t xe_sriov_pf_migration_write(struct xe_device *xe, unsigned int vfid,
+				    const char __user *buf, size_t len)
+{
+	struct xe_sriov_migration_state *migration = pf_pick_migration(xe, vfid);
+	ssize_t ret, produced = 0;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	scoped_cond_guard(mutex_intr, return -EINTR, &migration->lock) {
+		while (produced < len) {
+			ret = xe_sriov_packet_write_single(xe, vfid, buf, len - produced);
+			if (ret < 0)
+				return ret;
+
+			produced += ret;
+			buf += ret;
+		}
+	}
+
+	return produced;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
index d48ff2ecc2308..dbf8094900df8 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -20,4 +20,9 @@ struct xe_sriov_packet *
 xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
 wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
 
+ssize_t xe_sriov_pf_migration_read(struct xe_device *xe, unsigned int vfid,
+				   char __user *buf, size_t len);
+ssize_t xe_sriov_pf_migration_write(struct xe_device *xe, unsigned int vfid,
+				    const char __user *buf, size_t len);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
index 5f2062c8c0c42..363d673ee1dd5 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
@@ -7,6 +7,7 @@
 #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
 
 #include <linux/types.h>
+#include <linux/mutex_types.h>
 #include <linux/wait.h>
 
 /**
@@ -23,6 +24,14 @@ struct xe_sriov_pf_migration {
 struct xe_sriov_migration_state {
 	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
 	wait_queue_head_t wq;
+	/** @lock: Mutex protecting the migration data */
+	struct mutex lock;
+	/** @pending: currently processed data packet of VF resource */
+	struct xe_sriov_packet *pending;
+	/** @trailer: data packet used to indicate the end of stream */
+	struct xe_sriov_packet *trailer;
+	/** @descriptor: data packet containing the metadata describing the device */
+	struct xe_sriov_packet *descriptor;
 };
 
 #endif
-- 
2.51.2

