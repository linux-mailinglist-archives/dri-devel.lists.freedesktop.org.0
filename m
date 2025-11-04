Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC784C30D72
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 12:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60EB10E260;
	Tue,  4 Nov 2025 11:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WLrtxMQn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3441710E102;
 Tue,  4 Nov 2025 11:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762257352; x=1793793352;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RN0lIw85P2GHCyS3VNwIoEHzmKbGlPqC+gbdXnyKMwk=;
 b=WLrtxMQnlatBgx0uiQWv14vCEHZlPkcUvQ0JAKfxw0GlixNBsO/0DGgE
 ZwBDs6uczNrqzHA6/RUaq2LCU5skPTLeidzILh8eNpKaptVw8Xmem1NRZ
 EeNxp4HgYpqoUJj5EIYpTN6hTAezVzy+Lsv9kWQXlFGrtY0ncZp5hQAgi
 vK9jDEFvi9i8xnyLzUQgyj+rymUd8V9txHc/NETiCfMK9bzDqrSTSloKI
 Q6+VXqkAJ7D9NJ7rst/WakiByAHuw+JEYDYdYo7E4vmeDKsG8L1WiQ6QP
 sNi5iDc7H9MaignxDax5h9+GjoXnqCB3Ompg57ORMlPkc0uqCuBQtvlF/ w==;
X-CSE-ConnectionGUID: FkhLwSFUQGOEruz2FxUipQ==
X-CSE-MsgGUID: R/8Ao764TDmlWo160TvqUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64234746"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="64234746"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:55:52 -0800
X-CSE-ConnectionGUID: LTPXj5ChTImu1RRgZxQrWg==
X-CSE-MsgGUID: Bbs6RFY0RuWj4LrLCiY9sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="217783001"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:55:51 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 03:55:51 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 03:55:51 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 03:55:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ae6jo/30afQqEwl5WORFOIl9QeF09gWoYY9ObfVzA8rYd6SrZCXCcYU5AJS4+wEBGpSOEe+5Pfmz/WnFsOUws2+vygPKr8mhJDuZIgnE7ffLJotT/1vYG8qziLyvytPfxbESfaZORBnDCMIrGvcvf6YYlXpkWwTGTAhSKfzRHbYvvk7n9tlvJPScJgTIhiv7B70+ibsup7zS49dZG0cFC2vapw1jD1ppbWdl6ALKGmrQqrqW9JTY0L6R6OZQX4swT2dZlUWH/92T5nwUrUm8bIx7n2ahBcfs5eOjiVzqSYqbHSl6kDh2nTUUZct2PMCwGtX7lqvLugZYA21YGAmvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCGDJJ4KUAOMtYXqtbcqgzpcUVcFRt/Ah6F1pLKGIBg=;
 b=G9b6RdbPu4lK+QXkAUmWj/xSHS1an1Ne+DhEMEPLQD/k6ZGrhh9rxXQLa9CrkHvNh2LqsGy9LJ34WWExd4NqaWx1wo5AjBdPDX90dlK2x6U8vXwVIpO80AWxiLqFgBNMf9ntKcS4K0jF/J5K5SeP63NQ6vWrLKKp99jzWkrQMYp7K3fSh/9ZOr4w7p2tdxRhrTciY6ygU5Hmtwpl1SzPHnN4daGDdI43sJPRO1s3JjoeLalPTwFCW+otCZ25jONOC8YumYQIhR02wk1EUcKmUIj9/DX70h8s5+hLgX356TGPFRw6vWOfwEVVac7V9iKl7EB0ygr5JKDvWCx7SwpurQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB7786.namprd11.prod.outlook.com (2603:10b6:8:f2::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Tue, 4 Nov 2025 11:55:48 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Tue, 4 Nov 2025
 11:55:48 +0000
Date: Tue, 4 Nov 2025 12:55:44 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v3 16/28] drm/xe/pf: Handle GuC migration data as part of
 PF control
Message-ID: <nbdtwagbmlne74es5ftv2ji2z4iujf3kphk2mnyxgdjc7i2kki@xrmkyz3qwstu>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-17-michal.winiarski@intel.com>
 <af732344-8b37-4e32-970d-5ec10df7c328@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af732344-8b37-4e32-970d-5ec10df7c328@intel.com>
X-ClientProxiedBy: VE1PR08CA0013.eurprd08.prod.outlook.com
 (2603:10a6:803:104::26) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c0f912-83ac-43b9-cb82-08de1b99182d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0hPRlFYd3BGUlQzbTZMYUFqNEczNXUyajJRVk1nZTBDSUd1c0R1eDJiSjRZ?=
 =?utf-8?B?M2hWTXpqQTRUdjdBd25rRkhieEs2Y1pINmlzVkJPd3VxcnlGSlp1RTdaTVpk?=
 =?utf-8?B?V1hSZFE3Wm5neDhSMjJFclZqeEVmU2Iwa0F6T29rMkxLZ0RPNDlxb2FacVhI?=
 =?utf-8?B?ckFiUnRpN052T20yaWhHNDBaa0VlU3NCODBza3RCTHkyeWc4SjdRK3NrN0lM?=
 =?utf-8?B?WDRjNzk2SVZlYUtSakozRUNoeVl4UlRFZlZPbktSaUtsdjRpRGVFc3ZvUnM5?=
 =?utf-8?B?cFRnZmswc05la01sRjZhVE9MRnJqQXlaaFZHVG01VVp5RW5iSG1wcWw1V1o4?=
 =?utf-8?B?dnFNUCt1RzJteWp4dGtiTWhwL09XUGR5djA5OEFEUmRrUTIrUjE5N3ZxL3BU?=
 =?utf-8?B?N2l5cWNqOGw3MHp1ZURhVHpQZ2E1UENPSDdUdlVOOUFNM0NVUmR2a1RRb1pW?=
 =?utf-8?B?Smp4QlV2Tyt1YjN2UFpvWVZiOElYR1J5NytxTi9rUXp6aXh5ejVnUTVyejMx?=
 =?utf-8?B?UlQ1V2R0Zkd6UEdmbmREUnR3SkRkeHYvbzNIUEJDY2lBY2pQVUJEbzhLQlBF?=
 =?utf-8?B?Vlp2V2xsS3duVHk4NkVMelRuUVNPZzdJVUdnemVFaGU1Qzd3M1lHaUM0SFVR?=
 =?utf-8?B?QWl3Yy82WWtiU0gzWWl3Ulc3em1oODgxd0JFMzMvc3puNWNScHRPQ3VJUDJW?=
 =?utf-8?B?QmQzdkc3MnVsYW0zaVVOSkhNcXdLTTNIdjRPYnhwSkRRaDEzVWJVVUxlWkRX?=
 =?utf-8?B?Lzlxb2o0aEpZQ1lkd3pqZUVYamg5d1RUWXlFeFZ2Z0UyTkZmSEJyRTE4ZVd4?=
 =?utf-8?B?eWp6dE9JZThFeGxlcWJnQmlaQmpLSjRQUnBoMGVPdzdpK011M3poKzErSWZ5?=
 =?utf-8?B?QzFmdjdUNms3eGFHRkwxME02eU1XV3llbWp6c1QvZ3JxSGhCSjY4RTlhMS9p?=
 =?utf-8?B?V2tOMEdJVmthQjdhbk8zQ1A4dWR3bjVSUHZRY1o4azBxTHhmb1d6WVVUd291?=
 =?utf-8?B?eFMwSi9OVCtyYzlpYVhkeTMyTHBzby9GSXE1dlFKcWlWMzJ2bmhVRVJ2cE5D?=
 =?utf-8?B?eElXdDE2djFGRmV2c2RyMHplRlhPd2Y4d2lNMGxET1Q1MVZFQkZxbGI1ZUdJ?=
 =?utf-8?B?cm4yQXFkY0NJQ1c0TXVzalFqZmtMUVZQbTZrenBLQWZDeVE3VUovUHBpcDVM?=
 =?utf-8?B?dzQ0QjdYckdXQS9FMnRRWkh2ZVQzQXBSdjVRVVdvQkpGaTdUYXJVeG9lbU94?=
 =?utf-8?B?MDA3RkFFLzFaYTFuT2hUTHlRWWJuOW9hQTRqWS91ZmdQdFpwZi9hdjlab2dt?=
 =?utf-8?B?ZFEycjVLako5VUR3Yzk1Z3RUd3ZnODY1ZnBFTjh5REFpTVpManBLYWhjSlAv?=
 =?utf-8?B?b1VlRnVVWmhzTXQxSXRXUkFvS1IvdDdpVTNpdXU3aEtrSkdQQnkwalBxM1Er?=
 =?utf-8?B?Wms1UURmaUNsV2ZYMG02dndHR0NVeFc0aENyN21IV2hORlNCZWNlbHZ6YlpO?=
 =?utf-8?B?b09DWCtlaFVPV0RQSGZvdVVkN2UvYjJTMzRFbG9HQVc4NGxDR1Z0YjJoQTF0?=
 =?utf-8?B?ZDBSVFdCRDlFSmxBdWNqdlB2QjVoMXRtRVg4TnpGYVRBL2gxL2s0NWJHb2pr?=
 =?utf-8?B?M1Ryejd3elAyc2pWM0h3NHRDZ0YxcGltNW1ZY3lIVFRxVWJGNnAzL2wraERq?=
 =?utf-8?B?Vm13MlpnMGxWVnVUWjhyUGVTWTZyTEorR1I1b21DNEMxRDhJYlVEVGg1TnRI?=
 =?utf-8?B?TXFSRUdhcFJNZkFmUkJ5MzN6anJRcEZFYWFmN3Q5YW1DZUxpMkdKN21IeTEr?=
 =?utf-8?B?cDdzZng0Z0gwdmt1VUJhT29IbFJFekxxbnNlSDBpME1TaW5qZkJTU1paN1Z2?=
 =?utf-8?B?VW1Pa2VCSC9nSmtEUHNMOGJDUUxhY0dnbU9qSjJGYVFZaTV5c0kxZytIbnVO?=
 =?utf-8?Q?bDfe4CQkSvpA/30XBHfStYq/UCXEtqWx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkRWVTliclVQM2lTT2grQjgvWm5WcDA2Q0FOU3lobzV2bkNxYnplMUkvMWxV?=
 =?utf-8?B?VFNIc2NxYXJ4enNxa1BVN091d2JrRUoxaU1sMHZSQTZlY0hvY1JyM2ZvaFdV?=
 =?utf-8?B?QlIyV2dpdE1yL25NdFBPY3YwcnM5UjBxSGFaZWt3MjBVYXBPemlqL3NWU3dF?=
 =?utf-8?B?YStYYnBOY1Q5YVFZekttYklOYWZ0eTJkeGVkT1pJZE04bmdwSkl4YmIycWUw?=
 =?utf-8?B?bnBrcUxVb0xvTkZvSzNXYllONlNmT1BpOStjYURkcEwwNm9OMEx4ak9FNHQx?=
 =?utf-8?B?VVRnQmJFZnpGaXI3dENpS093eUJIWTBza1pyL29rMnNwM21yT3dDOEgyVEN1?=
 =?utf-8?B?LzlmeXEyU0dIY2ozVjdVYW1PMUlsWE1pVWIxUlhiTlR5aVNRd3BKeHJ5cE5V?=
 =?utf-8?B?M2JIZkh4aTU3eEV5anNaNmlMVnZvU0Y3Y2pIdFpoeEg4K2VGK3VSOG9rQVJP?=
 =?utf-8?B?ejhtQTdkRklENlVFeWlveUQwRm5EWk1yNzU5bFBjSktEMS8xU1FvVzhTS1ZT?=
 =?utf-8?B?ZjFUV3luT1R4dU1tOS9kUW1lRkhjWnNzMlRMTE9ZU2xSYnVabVk0UjBKSDM5?=
 =?utf-8?B?dXo1ZGtWK0F6SGdzT3dSMkVOOWs5akRtcFJPd2I3bGllY0hKQit0WEpZeTBO?=
 =?utf-8?B?dFMvVkdDU2tza1d6cjJnaytMc0NwNllKNDRzWG5VZmIzU3NYNE93U0tmZHdr?=
 =?utf-8?B?RDh6anQ3aldUVGg5aEloNWoxdjZVVFlyLzFOSHRTdU9HbkMxbWp2V2p1Mmc2?=
 =?utf-8?B?czc2TkdWYStNemhDTHVjT2dEZ2xiNnpmZTZxbFkzWUZzVWFoR1VUYjdNcE8w?=
 =?utf-8?B?YVZrd3RzakNIWHp1Smx5Z3AxSjUranA0SS9jMXZ4UUp6djdzeGg1cGRGWTdZ?=
 =?utf-8?B?WUl2QVpaV3FpYmdzcU12ZGw0WWg1UXc1aGoydk4xeTlndTRXTVBBNDVQOWNE?=
 =?utf-8?B?QXpGczJBV3lvcU1tR0ZJODNLd0hyM0JLMWNuUjNrakRpeXlLK2NtU1ZZK05K?=
 =?utf-8?B?RkprWnhiRmtJaTJoYVdRVHZRZXQ2ZDZ6NEMrV1kxOTBMeWltUG1nNVI1elVk?=
 =?utf-8?B?NEdRN1Q3elJoM0ZTT3VXaXNkUlA0aStNTnQvQU40OTBKMU95OWFhcUV4Mjc1?=
 =?utf-8?B?SkIxVzRLUmVuYXg1V0hrWngrVG4xdUs4MXc3d0pDem5oL3VuSnhRdHVwMHZm?=
 =?utf-8?B?OVBOMmVPMkdiZ0dQUXZhTTlWUGpFM1RoR2pYVVI3aHhsVGJ6MkYrMWNPaUFU?=
 =?utf-8?B?OFZmVlBOK2xrWHRBeENNRnRSeDJRUlpoNnZ5QVh5cDJxSlBDaklPSm9PMUVU?=
 =?utf-8?B?RHNkUEdjU3VNbGNqWVoxY0cwckR2TWhla3BWblUxbi82aFYvWEw5NjdXbFNG?=
 =?utf-8?B?QnEwcFhBeDNBK2pna2RiTmtKTmwybFJEQkd3Qi9ZeUxGbjFwWW9qbHlJNWg5?=
 =?utf-8?B?UllSM3cyT1RFNCtSTExRM04vN3o1US9oUmlnOVRwQ1FINytpc2RwTnlndlkx?=
 =?utf-8?B?Tm05TWsrMkFRckE0UFc4dWI1Y0xtdHd0SjFoS3dWZHE1WExyTmY4Umd0cFpL?=
 =?utf-8?B?WjYxYzVleEZjdlNud2ZpYzdRY1A2ODA1NVgwdHlkc0piVEs0cisza2xyemdC?=
 =?utf-8?B?WVo1SlVHZTM5TjdySFg3TWFtbm5zVzc0akljc1ViOFZFaHN6WGdodW1hNlIz?=
 =?utf-8?B?TGRod0lYVnZMWm85MWVBdzVkKy85VlVINFRlUFZlc21wU2xuNUhPaERvbSts?=
 =?utf-8?B?ZkQwNzh2eEthcGpGZldwOHFCTmRyd0pVc203SzJUQXRCOFkvTHphMVFpV3VJ?=
 =?utf-8?B?RUJMK0VFTDhYb3doTStWTWM1bDVocnFPcDJvTm1ISFE1N245VWxQcWpQOG5w?=
 =?utf-8?B?L1EwYmZwelZjKzhLKzJ0bzNFVXAvemNpQVVlYjJtbm13bkdOT2djdHJBdzdN?=
 =?utf-8?B?dFZsd2l1R3piNGNXNGcvY21uVVVmUC9KZEIrRmhVV3QzT1Z0TTdpb1U2RDVH?=
 =?utf-8?B?V0g1cThJV0xWOGdHa1hEck44TFpsS0tzcDRReXY0S2FVcUwyTS9uWmlubUIx?=
 =?utf-8?B?dTdjR1VLNnlLYXlVTk5RSDZOUnpPZ0o3TkY0UmVYT0pnN1VPRXMwdU9tYzdC?=
 =?utf-8?B?di91aGhEY3VETWRFczZVTFVFS0FLNnAzWGtzM2tYaHpwNVp1eWk1Y0xOMldY?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c0f912-83ac-43b9-cb82-08de1b99182d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 11:55:48.6854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5U/9UVJM9QZMwx/IlZwEBLa1lbbh4aoFKdlp4LzKN4Nw2M3fpn41bZYBmV7BT4O8GGfKGesbH7Gp2nIRBmVS3Ko4tn0xAXuPIXXZYN9WyJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7786
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

On Fri, Oct 31, 2025 at 07:15:18PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 10/30/2025 9:31 PM, Michał Winiarski wrote:
> > Connect the helpers to allow save and restore of GuC migration data in
> > stop_copy / resume device state.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 25 ++++++-
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 66 +++++++++++++++----
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  8 ++-
> >  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  5 ++
> >  4 files changed, 87 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index 203ba1fbeefcd..cb45e97f4c4d9 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -848,6 +848,18 @@ static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
> >  
> >  static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
> >  {
> > +	int ret;
> > +
> > +	if (xe_gt_sriov_pf_migration_save_test(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_GUC)) {
> > +		ret = xe_gt_sriov_pf_migration_guc_save(gt, vfid);
> > +		if (ret)
> > +			return ret;
> > +
> > +		xe_gt_sriov_pf_migration_save_clear(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_GUC);
> > +
> > +		return -EAGAIN;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -887,6 +899,7 @@ static void pf_exit_vf_save_wait_data(struct xe_gt *gt, unsigned int vfid)
> >  static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> > +		xe_gt_sriov_pf_migration_save_init(gt, vfid);
> >  		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> >  		pf_enter_vf_wip(gt, vfid);
> >  		pf_queue_vf(gt, vfid);
> > @@ -1048,14 +1061,22 @@ static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
> >  static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	struct xe_sriov_migration_data *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
> > +	int ret = 0;
> >  
> >  	xe_gt_assert(gt, data);
> >  
> > -	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> > +	switch (data->type) {
> > +	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
> > +		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
> > +		break;
> > +	default:
> > +		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> > +		break;
> > +	}
> >  
> >  	xe_sriov_migration_data_free(data);
> >  
> > -	return 0;
> > +	return ret;
> >  }
> >  
> >  static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index 4a716e0a29fe4..fbb451767712a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -174,22 +174,10 @@ static int pf_save_vf_guc_mig_data(struct xe_gt *gt, unsigned int vfid)
> >  	return ret;
> >  }
> >  
> > -/**
> > - * xe_gt_sriov_pf_migration_guc_size() - Get the size of VF GuC migration data.
> > - * @gt: the &xe_gt
> > - * @vfid: the VF identifier
> > - *
> > - * This function is for PF only.
> > - *
> > - * Return: size in bytes or a negative error code on failure.
> > - */
> > -ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
> > +static ssize_t pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	ssize_t size;
> >  
> > -	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > -	xe_gt_assert(gt, vfid != PFID);
> > -	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> >  
> >  	if (!pf_migration_supported(gt))
> >  		return -ENOPKG;
> > @@ -278,12 +266,19 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
> >  ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	ssize_t total = 0;
> > +	ssize_t size;
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> >  	xe_gt_assert(gt, vfid != PFID);
> >  	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> >  
> > -	/* Nothing to query yet - will be updated once per-GT migration data types are added */
> > +	size = pf_migration_guc_size(gt, vfid);
> > +	if (size < 0)
> > +		return size;
> > +	if (size > 0)
> > +		size += sizeof(struct xe_sriov_pf_migration_hdr);
> > +	total += size;
> > +
> >  	return total;
> >  }
> >  
> > @@ -330,6 +325,49 @@ void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid)
> >  		xe_sriov_migration_data_free(data);
> >  }
> >  
> > +/**
> > + * xe_gt_sriov_pf_migration_save_init() - Initialize per-GT migration related data.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier (can't be 0)
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> 
> but it's void

Ok.

> 
> > + */
> > +void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> > +
> > +	migration->save.data_remaining = 0;
> > +
> > +	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
> > +	set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_GUC, &migration->save.data_remaining);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_save_test() - Test if migration data type needs to be saved.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier (can't be 0)
> > + * @type: the &xe_sriov_migration_data_type of data to be saved
> 
> .. to check

Ok.

> 
> > + *
> > + * Return: true if the data needs saving, otherwise false.
> > + */
> > +bool xe_gt_sriov_pf_migration_save_test(struct xe_gt *gt, unsigned int vfid,
> > +					enum xe_sriov_migration_data_type type)
> > +{
> > +	return test_bit(type, &pf_pick_gt_migration(gt, vfid)->save.data_remaining);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_save_clear() - Clear migration data type from saving.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier (can't be 0)
> > + * @type: the &xe_sriov_migration_data_type of data to be cleared
> 
> .. to mark as done/saved

Ok.

> 
> > + */
> > +void xe_gt_sriov_pf_migration_save_clear(struct xe_gt *gt, unsigned int vfid,
> > +					 enum xe_sriov_migration_data_type type)
> > +{
> > +	clear_bit(type, &pf_pick_gt_migration(gt, vfid)->save.data_remaining);
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
> >   * @gt: the &xe_gt
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > index b3c18e369df79..66a45d6234245 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > @@ -10,12 +10,12 @@
> >  
> >  struct xe_gt;
> >  struct xe_sriov_migration_data;
> > +enum xe_sriov_migration_data_type;
> >  
> >  /* TODO: get this information by querying GuC in the future */
> >  #define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M
> >  
> >  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
> > -ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
> >  					 struct xe_sriov_migration_data *data);
> > @@ -26,6 +26,12 @@ bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
> >  bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
> >  void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
> >  
> > +void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid);
> > +bool xe_gt_sriov_pf_migration_save_test(struct xe_gt *gt, unsigned int vfid,
> > +					enum xe_sriov_migration_data_type type);
> > +void xe_gt_sriov_pf_migration_save_clear(struct xe_gt *gt, unsigned int vfid,
> > +					 enum xe_sriov_migration_data_type type);
> 
> nit: "clear" is little confusing, maybe
> 
> 	xe_gt_sriov_pf_migration_save_data_done(gt, vfid, type);	// instead of save_clear
> 	xe_gt_sriov_pf_migration_save_data_pending(gt, vfid, type);	// instead of save_test
> and 
> 	pf_migration_save_data_todo(gt, vfid, type);	// instead of set_bit

I'll go with:
xe_gt_sriov_pf_migration_save_data_pending 
xe_gt_sriov_pf_migration_save_data_complete

> 
> 
> > +
> >  int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> >  					  struct xe_sriov_migration_data *data);
> >  struct xe_sriov_migration_data *
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > index 75d8b94cbbefb..9f24878690d9c 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > @@ -16,6 +16,11 @@
> >  struct xe_gt_sriov_migration_data {
> >  	/** @ring: queue containing VF save / restore migration data */
> >  	struct ptr_ring ring;
> > +	/** @save: structure for currently processed save migration data */
> > +	struct {
> > +		/** @save.data_remaining: bitmap of migration types that need to be saved */
> > +		unsigned long data_remaining;
> > +	} save;
> >  };
> >  
> >  #endif
> 
> otherwise LGTM, so with kernel-doc fixed, and (hopefully) with better names,
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 

Thanks,
-Michał
