Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 336F3AD71D3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 15:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8825410E331;
	Thu, 12 Jun 2025 13:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dOMhFxMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F085910E331;
 Thu, 12 Jun 2025 13:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749734850; x=1781270850;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dq4KuSnSwGE6T8cYnF4SQjIcNsMf9jfDuLQduWO44Dk=;
 b=dOMhFxMxf1kR/eRWTqzdMrFfCjtHKcsf0/4TvVzohKCAnqiLg+7UDCWc
 wA8RMGmB4yV97J9Htqxh2v2s3YAQhKgWIUVHWdqi4fjLnDzlep4dgJRel
 uqInEAZQshFXf5mGOAUTktfJjAYMDP7aMqzvtFcXewHnRJjWcb6KwJ7Zw
 4H1lbDh/VI5IjnhCYzRqC9A9YkOh8UTqQsxHyuG1R8SH0PPnkEQvJjBhq
 z0Wri+cINGiK9LaVSZ1bOenuyhSiVFXfJAstcShdlj+dnz0NlHfVE4CIE
 nDi/CVuc0HACMx019bueONVc3HSiGD+Z6YIqQtUFVG/0nq8rWdtZ+EFBV g==;
X-CSE-ConnectionGUID: pEz2QnwvQpuERtpuIxKzGg==
X-CSE-MsgGUID: BSdI81yaQ8i9tz9K8GUwig==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51626915"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51626915"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 06:27:29 -0700
X-CSE-ConnectionGUID: UhdmXnEwSpiMF3eXZg+cfg==
X-CSE-MsgGUID: YCjCs5x5Rh6hkPI8IvSuZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="178499267"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 06:27:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 06:27:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 06:27:27 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 06:27:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xczsQO2oZIeVD1qFCIRRKozK+XM/y094V17tNSkPUTf/ct/xG8MvDtOiT5HKUM0iRlTp0qRpyqX8D73DQWo3I6XMsb2Ha7DMUQOBekytpl3jk4e0eU3Orge26q3htF3fNJkN1ohzD6hmr3SeihZ3oYfpPpQdDxTOGb1TSmNNh4N0chtYFkawD7mf1sVVjlkTmdPY2mrk3y9+mtcLKZYTqFts2p5uCC5j1VomIG+j2eoxgY8+waEjVwIM5HShg9HK/TVSr9D2oyNMr4WEiZaA5LE3n0LwKuo4+4bxBRgh567Q6244xJwi9LLGhEyeyQoc2bRjMZux3TO4aKGzlIETzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3m1lw3xsrYIdXFO9dvKG9QqB7WUId03dvSHg0kRuKc=;
 b=t94BZU+uRRK0LYSA86wvLJlpoDkIU6HPRGSi913YOhainUWwSrgBzJSgqiIkoJQEdkWDr+9HSfT1Px39Sk5B4qdZhHBKgYtzRAlVLrBWzlGn+GJU75x2E4oplBffC+rpp+aK0/EGZENxPINqH3IMHYTb4szvNbcclHa0aPzufaPTpASkLqyqF+rKv3AjCe+jnVC9YRe4lTBpiVdu9g5V/VlfRgnEVC4B1UW6gesGGYSUEPxxQaZLsKZbR6czWK9jWv4yoAaCHmfqnpxueMBYjcA+kZMozhFsMtbE4KJQfhvX4CkAsBJUXwwTRJtL4dAlLB7GKO8xdlg2b5WWrU+yhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 13:26:57 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 13:26:57 +0000
Message-ID: <a3941348-1aa4-48c3-b7dd-2985d41f3278@intel.com>
Date: Thu, 12 Jun 2025 18:56:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/10] drm/xe/xe_late_bind_fw: Load late binding
 firmware
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "jgg@nvidia.com" <jgg@nvidia.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
 <20250606175707.1403384-6-badal.nilawar@intel.com>
 <a51e1b65-dece-4ac4-808d-8749a1a21d8f@intel.com>
 <CY5PR11MB63660D5FCB0F3694710EA975ED74A@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB63660D5FCB0F3694710EA975ED74A@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::6) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY5PR11MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f89c80-0060-4467-e3cd-08dda9b4cdc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0RGbVRuZWJlTkUzbmdXT3dIa3B4VFp0UTRPeGxlQVFqdUJVWHBGeGlVdFBE?=
 =?utf-8?B?SExWZzB3RXBNN0RJM3VSam1qNDAvcjlIWUI5cWVRb1NkdFVmQnJSa0VpbUZo?=
 =?utf-8?B?WGdabnU2SGtEZURreFlOUUFpRlZ0RzJnSGQxQjRsdHRueFc3Z1pMbWVSQWFK?=
 =?utf-8?B?VVgyTlR1SGsyTktHZU5qS1dtUmNhM01hY1dMYjBMN0ZjcWtVVEphZ1lXV0p6?=
 =?utf-8?B?dnIzWExhTlMycXBBSGhMbCtZai9sWnZLSmQwMjFOaUgya3pXY1JKaGlFZzAz?=
 =?utf-8?B?dzZmc2t4dGZlRFF5ZXI2WHpDMTdCK0FCeFhuVi96TU1PdVNCNkdROHRtZm9H?=
 =?utf-8?B?Mkl6YkVMNGRQMmsxQytuaTlKMXVTS25UT2pQbHJkNFk1SG9MRXR3N3ZlQnZx?=
 =?utf-8?B?bDhDNHBxRDMrbHlZK00xZXQ0VXRRaHVaOUxuSGdOc0M4M3VMaHNNZ0xxdmt4?=
 =?utf-8?B?SEEzb2VsV1RYU3NEcVJYeWdjL3EyRGNTODcxTlBaWFZaL3NrM255enNBRUo1?=
 =?utf-8?B?MS9KQ25YT0IzNG50T3dXVnlyZ20waVpsOEtjVVlKQ2loN3lJT0U3V2krYnBX?=
 =?utf-8?B?cXp3Q3RQODZFTmFFUXRVVnNvNnFIZk5STklXVmtYWERGeTlvWFlYcDYvQUxD?=
 =?utf-8?B?MEtBRHlkSHphREl0TTUwS3VPMVlubXdaRFNBbzFYTFlrYnQySWtZRStnbDV1?=
 =?utf-8?B?SGpqbkl3NE40T0F2SjRKV1lKVFVMRjlDTTEybnk1dEVhZzVxQjRFQ1p4dHVQ?=
 =?utf-8?B?MHBONmxaTW56aUpGQ0FLcUdIbkJOU3p1UUNpdy9MaXhUNDVDMnBhcmNqTEZz?=
 =?utf-8?B?V2dDUktTQzcxQmI3SXFjYnhzbjNuUFlZQldMaE9sQnM1SEZZeHRydG9WZ0Jl?=
 =?utf-8?B?ekdyWmRxbTczaU4waFZIVWtwajN4MS8yUVpYNnJVVXFvSkpSVHhiTG1LWnFk?=
 =?utf-8?B?MTNZa2h1Q3c1OHZuSHhmejBxTkY1anpVVk9ReEFIZmZLVVo1Q1MrSktxQjhr?=
 =?utf-8?B?YnRkNWw3Q1h0MWsrMElvb1lKRzF3enNOOG5jMjFPTEs4RXNOelZWNlZXWnJT?=
 =?utf-8?B?akQrUnJiQ2dSaUJ4Mm43TE5uQlFkRXdLZzdzRVBuL0s1aHZJVEFiNWFSYVRB?=
 =?utf-8?B?cGF6U0R2N0IrWmhOWXJQQ2IrcWVleXV0NVAwUk5SZm1EdlhPR2lCK3BOODEw?=
 =?utf-8?B?WkdiSVg3T0dZS3ozUW04L25QaGdRT2pYZkhwUXlidFdGbkVhbzgyczJuNlpE?=
 =?utf-8?B?NHNRTFBhWnVXTExuL2VVMk53NjJqU2d1ai9ldHBGaTlFY1czenREQTBhWGFu?=
 =?utf-8?B?dE1yM1FpbFV0TnkzVmVSaG5uc1VmVXJ4enl0S1dpVTZnZ29JOGt5QXk0Mkt0?=
 =?utf-8?B?aExOZS9NRkY5VTBVWDdrOXNrb0MxbE1ocnU0YjJxbjRDcm1memVDc2cvd0RC?=
 =?utf-8?B?ai8yMW15eDF1MFN5TE9WL25DQlJGSFdLbWd2QVNqRndwZi9tZmgvKzAwMzhq?=
 =?utf-8?B?Z29mVDJUNVJjZGhuakJ4NXdkUUxsOW5yUlNiTDk1VFl1WTVnV1ptSGxpZlFj?=
 =?utf-8?B?M2tzNXpyb1hiaHdkcldNUjA0NlVRZWhDSFJRZnhZeHZwZVhwM21LRkNuV3NJ?=
 =?utf-8?B?RHBvRXBsT2p4VytZbXQwSDZnS3hKeUtFNStiL2swcG8wUE9xSFV5dTJDLzBy?=
 =?utf-8?B?OW5tdmwvUnBOLzNGeFNTWmRVUzF0THlXd0t0b2ZPVkpLd0xwTlZpOFYrd3VM?=
 =?utf-8?B?cVJtc1pIeVlPV1Nha2pDcXdNcEVhbkhoQ0FNZkUxQTlPbG14Z1NuWmQwZ3E5?=
 =?utf-8?B?ZTZTdTQzSVRxeDBsVFdtTEVtMnlUd0Z6MjNBZ0wyaHFLRWR6dWVsRE5LQnBr?=
 =?utf-8?B?NWpabnE2cWxTQ2tZRlU4aE4xUS91a1Fyd3hEdW90aHdIRFgra3dHYmVvQ0Jl?=
 =?utf-8?Q?p8J9j8IfU/4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3lwTXhaSHgwRmlGM1ByRExTOFRLQldhdWYzbUl2UmUyWitaYjhaMzJnek5X?=
 =?utf-8?B?WlZtNTRXMzJFWEYvRXBNOWVCQWIvZ2haQzg1WkMzN0QzbUtkRTM2cEdBYjha?=
 =?utf-8?B?UVJZVkdNSFdMNVA1MzVQYWNZUjljNE1qLzA3VXp4cldTdjB2YjZMN082ZWFm?=
 =?utf-8?B?RE9EWEg5ZjdWbzBxQUoyZ21aOXZSTHcxNmI5TXNkU0tPZThvb29ISXhzZDVi?=
 =?utf-8?B?c1Mrb2ROMGhPNGw0dFIzZUxCNHg3Y2twUjlKWG9yOWdpMWRHSllXZGhVOWRk?=
 =?utf-8?B?RGtDL1pqOHJpTVQ5SDIyTGNzTGtReElCVytQbFZodmt1bDhIRzdJT01xejBr?=
 =?utf-8?B?QWYxNktlOWNsbHRCbE9xdCtmWEsxL0ErRGJkTFdKU3V1cTMxVWVjYnpMNUsw?=
 =?utf-8?B?NHEvYVkrcUI1NHZYeDFRL04rMFlVdTVwUVhJd0tUSk5YVzdCajVtNmZwSEhZ?=
 =?utf-8?B?eEtVTmxGM2FpbmkwcDRvbnQ5MjdLcWZVaVpTNGp2N3BRL0YzV3hORW56K3dy?=
 =?utf-8?B?N3BCVUtETFpKVlFCcjk1Y2hDRWNzRVRpcmhHZGEwb0hWVURGRGVTYmVQV0Zn?=
 =?utf-8?B?cVlrWmtkU2k5bjBQcTV0NGxiZFdybE5YcHh0VkRNejdQdFY5WHBwbFR3WVVn?=
 =?utf-8?B?WnFYeTBjNU5oRUhvd1pCcDNYbFcxcmJacmlFNDYycWlCS2VhRTZudkJUWFpU?=
 =?utf-8?B?VHJYSjNRcEhpZ2lkUlAzamtFQ2Nxd2NBT0pDelhMbERHNUZWQXFrV1BwQkpB?=
 =?utf-8?B?bm1rTnhJbDJlZlk3bEZYQUJITW5yYnR4OFRCRUJYR2ZmaEtZSW5hRGtFZTMy?=
 =?utf-8?B?aUM3UktqUFVKbEd1QWpwMVFWUnQ5ZXY1WE9EK1RaZEY3RTJ2OGN6RFRkV2h6?=
 =?utf-8?B?QTVoTVNZOHZkTTVrWGlmTFRYeWpzSWlxTkdTTmtEbTlUK2hBSTIwcmxxWWdT?=
 =?utf-8?B?RDkvSEpabDlNSEVKcUUzMFAyNTgxWTRzTjc0dEl6TW0yZWZLQjJ0cVFONGNN?=
 =?utf-8?B?dUJoUzFZVzY4QS9uRkNydmNHQVh0a1pJTjBCb2toWUl1cTQ1S0o0VTBCWTZx?=
 =?utf-8?B?eTBRRWJ6SXZuV0ZnZWRHRE5XZEs0SXltN2p3YkRYV2dwRE40QXVHbVpaUEdO?=
 =?utf-8?B?ZU1FQU44R3VEOEdlZ3NiWTA4N0RqZU5oMVhWZDZrTVJlKzNkb3QveW5yQTNC?=
 =?utf-8?B?NHpXNTA1by9IeDRvSXhQRFlIMHUvWEpkeTV6YmF5Z0xWMTlMenlkWUt6OGhq?=
 =?utf-8?B?ZGJwUFNyeStXc3ExQStXWUpWWXNHVTNJZ1o2cVpJWHRmWlRnVGpnZXNiVlhj?=
 =?utf-8?B?MDZqblQxcnU4MzFna3BqeTQrdlNZRE1BREZycU4rVWJRdGp5RVFsd2VnRkY1?=
 =?utf-8?B?S0NCOGFYekwyR1BUQTZoZmVzSDB1emlYMXdZZnJmMk9GNGZTbVRjQjBpQzh0?=
 =?utf-8?B?RGlHUVdFdnp6WWNTcjdpZytvR1RFU0R6Qi9hWlZwUWo5Tk5EdmtMSXNMYXZS?=
 =?utf-8?B?NGs3U0VYb01xNUdEUlVxc2cxeXp3ZDR0T0VEdTVrSzZXWUdhNVR5c05nQmp2?=
 =?utf-8?B?c0RkUG9SMW0vWjh6bEhNZXNsRDdXTmZYeXZpekdpSTlkSFdXcUFnejQrK09R?=
 =?utf-8?B?OHRxRjNzZFJHSmRJTzQ4VTFzKzlKelU3ODZVUFZWSXAwQnc5VU1IdmEwYnNw?=
 =?utf-8?B?V3pKY3NQL2JsNlYzbFBZN3l0VmhwTGY1TUdsK21sbC9hbTlKN084WTUvU3pu?=
 =?utf-8?B?Q0ZGS0swMEk2eTY0S3hMWlp3R2VaZ0RURlhsbHQ1RHJBeFIwNjBaa3FzRU1E?=
 =?utf-8?B?ckJWaUo5ZVh5QVo4RG5VUUluWmJEYW1rRVpKZWtraGluZWlTc0ZiZTdKNHRF?=
 =?utf-8?B?WVY1UzNFcGtaWHZSM2I0UkNnREFMYjA2VS9JdkxPdDJQSit1aW82cGxLU0dl?=
 =?utf-8?B?di9zd3djY2Q3alkzSTZub2tMeFc0MVluVjlNRTVOMmpSNjJNWVl6b1FWNUti?=
 =?utf-8?B?NFdQY2NqOEFPR1dPVFp2YUh6dlBmV3ZvWk9IOGNzeWRYS2kzbGg5d1lxNkRL?=
 =?utf-8?B?VS9GM09mNk5ZNjV0TlNja1ZGMElIK21jQm8zZkVBN2d1VXVuUzlLSmZtaUY2?=
 =?utf-8?Q?gCXsBdarIbVIISEJjE6tVvbkY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f89c80-0060-4467-e3cd-08dda9b4cdc6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:26:57.2553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcyXdzjUGyHk8wrCBXlk2UUHW9aqBo8oe2i7WvgqoJcbCoOKimMdhe2eJRm4olIlLBbXcqHzVnAO3Qmdxw4k8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
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


On 12-06-2025 17:24, Usyskin, Alexander wrote:
>> Subject: Re: [PATCH v2 05/10] drm/xe/xe_late_bind_fw: Load late binding
>> firmware
>>
>>
>>
>> On 6/6/2025 10:57 AM, Badal Nilawar wrote:
>>> Load late binding firmware
>>>
>>> v2:
>>>    - s/EAGAIN/EBUSY/
>>>    - Flush worker in suspend and driver unload (Daniele)
>>>
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_late_bind_fw.c       | 121
>> ++++++++++++++++++++-
>>>    drivers/gpu/drm/xe/xe_late_bind_fw.h       |   1 +
>>>    drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   5 +
>>>    3 files changed, 126 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>> index 0231f3dcfc18..7fe304c54374 100644
>>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>> @@ -16,6 +16,16 @@
>>>    #include "xe_late_bind_fw.h"
>>>    #include "xe_pcode.h"
>>>    #include "xe_pcode_api.h"
>>> +#include "xe_pm.h"
>>> +
>>> +/*
>>> + * The component should load quite quickly in most cases, but it could take
>>> + * a bit. Using a very big timeout just to cover the worst case scenario
>>> + */
>>> +#define LB_INIT_TIMEOUT_MS 20000
>>> +
>>> +#define LB_FW_LOAD_RETRY_MAXCOUNT 40
>>> +#define LB_FW_LOAD_RETRY_PAUSE_MS 50
>> Are those retry values spec'd anywhere? For GSC we use those because the
>> GSC specs say to retry in 50ms intervals for up to 2 secs to give time
>> for the GSC to do proxy handling. Does it make sense to do the same in
>> this case, given that there is no proxy involved?
>>
> Here 50ms is too small, we are waiting for other OS components to release handle.
> We usually have 3 times 2 sec in user-space, but it is too big for kernel,
> let's do 200ms step up to 6 sec.

Sure I will  change the intervals.

Regards,
Badal

>
> - -
> Thanks,
> Sasha
