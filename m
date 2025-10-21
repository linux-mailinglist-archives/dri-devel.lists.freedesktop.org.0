Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C115BF9139
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687C210E651;
	Tue, 21 Oct 2025 22:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4xYVCMS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81B910E650;
 Tue, 21 Oct 2025 22:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086558; x=1792622558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KlyFIvsP13Zpis6AimpONUfRQqfibhykGsKCB3fY0EI=;
 b=f4xYVCMSw5BOPvolXDmKdp006JxfgTEOLVNSZD7mDt/ctPI3aHG5YnOa
 hdQdZCpEcF9dzdwE27yGA7dwuj7U3nDXkbOyWfowAKsPeeMXLWTE3MrJ2
 UZpiiNs9isCFINJ4l4VrYIKzwHlfoJLIl/sk9cQVzJ3Np02A0UhYynqaz
 igWKDV8y4eM64nD5O0wMRzgXkD9VU07zd71EaF5i6UNWTLAU6u2mrUgv9
 kQJYcZwqn5GGNY8HEbMBNjflqvTCa6HW0GKO//905Z6i+PhLGlIsAE5J0
 3dZFAoqhK8XJP1QyXPaMkjaPjjHTJWHjmotR4xAi0m/6Nb8nGa5+Z3x/f g==;
X-CSE-ConnectionGUID: 7PK1fUyKRBefQpQjTYuFMw==
X-CSE-MsgGUID: uCX1BInmSMG8LVEGRhMnEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67088850"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="67088850"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:38 -0700
X-CSE-ConnectionGUID: qrNCboi5QbOy7/WW7GCykw==
X-CSE-MsgGUID: /sgZYa8nRQS6MaYmOUK8SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="188988496"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:42:36 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2gnIVF+Mye3syVBpqdiYkXMVx5o8ae5fy6xAx7ohM0BZLjnxOXmeWUdozAhrWroTiIhvlmlawBXw9gY+jfQCeJEwo+BWFb/938mJR6CpMk4McfLRXdHmwcUwRxpHdqnjJYKmCD3f7bZj5K4CnejVYRKuH3o5yhx4bq1UklCKX+BAbDgyfKyBCC/77w5Z/YPXq6E0zWg+CTk85E4mQyJtJF51j89nB5EuJe4ELMmAekydMM2kpJJoZT4+4k6dRG+JpCR0h4toynglsAmYh3FtZQt+vqvsbhKeb8ieIjw4JQi8QHi5hrLfUD99u62NbWddlpmX/yvLQyPB6C30+reew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nu40GJPCQTRP/yB+hYIbZH3zUyfpPKlnb41zWApGyjM=;
 b=sCtjQFGUAtLPj7JDQbdoAku+Men/jdKchnjqp4tifRv9hE1bV+xEg/tT34dE6JjEK9bVFxh66iZSx9oRvXdhQSLkE2Y2CRCFW+iQmKEBkmBhFP+4I5sfTAYP0jxTWEng97Dm6Pm4mMQM8WUcuQHfPElu8gQ8hKBOBWYFDKMZbfrw3NqaS+GKEl6UlwDhKsJDz+u1sbUSaJn/FaJEXnzCBTlAdoj0Uoc6oSUkYGDfG7WoRTkTHxa+JESXIzNd2I4XbaHku6D5fvL2WzvE4yXASEcbbpNGF0vt++JW3fYyzPKVLlkO1R5nguSmBBXIhPGmSYk5DunpkA/th4N6bYGSxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 22:42:34 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:42:34 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 05/26] drm/xe/pf: Add helpers for migration data allocation
 / free
Date: Wed, 22 Oct 2025 00:41:12 +0200
Message-ID: <20251021224133.577765-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0172.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::29) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: d4253408-dd49-4448-0d89-08de10f32074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXl6RFJsN0hLKyt1MjYxSE0yUEpTbEVkS2dUazhDRCthUTY1dk1TTmpzS2VR?=
 =?utf-8?B?VURYaFcrK2xSTm85VzNMSjN4U1pyUThLMVdiUy82WmRYOXN4aHc2MTJzZHdP?=
 =?utf-8?B?RTE1czJYZEF3SmFldEFFMHBXMFk4Y2IzejlBTm01ekhyM2NMU1hqQ2tSb1hQ?=
 =?utf-8?B?bmFRenI0aVYxR21Ib2Y4MVY3Rmc1aFJQNEFUN2VuL09NZTVKcWdITGpaSEJy?=
 =?utf-8?B?WlJRaDEzSStPbjRHUWtrQjFpVzIwTGNEYjFVWXlIKzFnR0tmeXIvc2hQalk3?=
 =?utf-8?B?VlZBVXVKblJ0NXorZUpORWxNbm1mek9LcWR2dDJTVUY2NFVYczhzM3YwNHlZ?=
 =?utf-8?B?Q3pjMXh4ZVdsNGZGT1BDSEx5RXNtQzZTcmtsOHBxOVh3VktUVVJQc21SUHFJ?=
 =?utf-8?B?YWc2TFRHWjNzczNGSTlScVI1ZEVTZXNDL0JwVnREbGpRUTJBbzZaRE9JMmtK?=
 =?utf-8?B?OE0xZjFrdGVrU3ZiWmFpbmg4cFJVUWtNZDRnUUFDS3Bha21FOHg0VWh0OEUy?=
 =?utf-8?B?elBWVWRsVkUvT1R0QWtBalZ0dkFYUUc1Tm5jdlNmQzJVNTVCdUpNNkRGZUVu?=
 =?utf-8?B?VW1xeUxwTmxVcHpCTU9SSGVKQTlSVUhNditFd3lKRTE2QXpKR0wzR1NEVVZ0?=
 =?utf-8?B?dzE5U1pReldCaTU3MVd0VzRVNG1TQ3Nma29YNXhuWGVscEh6clhjV0JSOEFk?=
 =?utf-8?B?aFhKdGE0MzM1VXluQ3hneE04MWRLS1BXQ3BEQk1OaEZBVzZxemY2UTJ3M3d0?=
 =?utf-8?B?QzlRekVJQWwyRS9RMDlSMXVMY2ZHRUMxSXA3T25yRXJUMjVsUkNXVXVCQVor?=
 =?utf-8?B?SXAzKzRPcStubWpMSU1FWWpEb0ppRUtqQ1FGTGs4ZmhUbThBNk5PR0pkODZ6?=
 =?utf-8?B?MFZFVXhJL1UycFppK0FSVVJjT2NEYVdNQzg3RklTYTVXZUgxQnZlUGIxSDBS?=
 =?utf-8?B?RjNFaUhpZ28xNit1bDRWZ3pJcXhpQUwwMzFBQVZDVXN4eTJ3ZmV1ZXRWSW5Y?=
 =?utf-8?B?WWovWGlxOVNZTTBRZTB0QmFKY2I2M29ZSm11RjhLT2NKQkJJVFZ1b0MyQ3hT?=
 =?utf-8?B?WTJ0bVBrRjNwUktFZE1LYTFNN0duT0I0WUUrM0Zqc3ZUbGIwTTVVN2xMbThQ?=
 =?utf-8?B?TVpUR09LVWZCZEtNZHlrcGFTSnVhYjhpemVzVXJSemhBYms5YXlxaXlyNXpw?=
 =?utf-8?B?Tzk4M2YyMVZwQ0lFVjFvRVFwTGFvaSttaUE3UEw0cXNEZENnQXdUTkUvK0FX?=
 =?utf-8?B?bU9xL2M1R3VsVWRmUzNzYzVLQ0xFUGhWY1N0MlMrZzNSU0pyUFhyMXJGOWE5?=
 =?utf-8?B?TjdNMUtyUXBzWXd4QUJyUGc0MVVLK2xROHd4dVRmYXoyOEdaN0k4VURVWDFK?=
 =?utf-8?B?MysxdWpIQmxPVXNaRy9nSVBxZ243eXA3ZnFnRlRVWDVGeEhBTlF4LzVFOEFB?=
 =?utf-8?B?Z3JidjRXb2E2SEJzRmVkaWk0Q3R6eEFJSXRCZ252VFR2YUtsdTc2blpuelRj?=
 =?utf-8?B?bmsyd0ExVzMvS05YWXBud1ArR2FTOUd6WUhaeFRIUmowbm5oVTE5OVNFT081?=
 =?utf-8?B?V1lhUWd5MloxMk9DUDBvVUQ1TmRUbGhNWUhpd1E4RzF5cklLVlI3YVdqRXRX?=
 =?utf-8?B?czVCVmJEem4vaTBLSlBIVXhwSWwrY1BTaUNnOXpHaW5QTEpDMnFCWTlvb0tq?=
 =?utf-8?B?eHlTdG9PNFVobEJmYzVqNXhiNElHM3FtTDJ6MVBxWStmMG5yb00vZkdpdzNK?=
 =?utf-8?B?MWZTWENDa2d4eWlUdWpoQ0toSTlIS0orR2xOcUxjMmdKWWg4OG01Y3ZxUWpV?=
 =?utf-8?B?VTIzeUx3RUtITFRxb1VPL285d0NkZlE2Z2JVTVNmMWVWdDNvb2FuUnVHaSs4?=
 =?utf-8?B?cXBkWHYzem1TWXlxcVozS3YyZlpwQ1hMQk1LcFV3ME9pZjZiLzlxbzNEaFBG?=
 =?utf-8?B?OUdZNWU0TzE4dy9TSXRYeldVQm5leHRnd0VtcGhPbDJLTEJIeWd2Z3k4WlJW?=
 =?utf-8?Q?abeyomZzI6YObpBFTSviu+TZ1zbps4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0Z0aE5oSDVUaEhFTDViYXdlUXJIZUZ0M1UyNTVyWnU5MUQzblViN1g3YUlV?=
 =?utf-8?B?ZS9qTWQvaVo5SE5pQkxZV0xnVmxYUHpDK0pvbmZjb2F5bFVpMnRJbjI0TjIw?=
 =?utf-8?B?NDIzZi9wbzB5cTV5ekxpQmxjWmlVZXpYZDRTc0psZEoxZGlJYzFOV2NBTTg3?=
 =?utf-8?B?VUJySHNTUnFCWElPSStBcEZxTmNwTnAvNEVzenFNNzRxN21mZDY1YXdjRW9w?=
 =?utf-8?B?THJwZjV4R1l6dkpjZ1hxd0hkWjNqZVF4Nm1tMGRMQ0N0RXY0c1BtM2VoZDBN?=
 =?utf-8?B?ZUxucjdqaHdGaWFFNjZqeE9taDdoZFh3UGRTejVIZndabmJhUGtKUEtQOHdz?=
 =?utf-8?B?Ymthd1pxYWs1U3F0SnVxTDlQb2VuZWpFc1FCWWw2cEVVY2JKR0Njd0R4eHJM?=
 =?utf-8?B?RGpzM2lKWEo0bzNNSndPRW1KQmZMMjUvV1JvenpiYzZZQytEUExxeHovc0gz?=
 =?utf-8?B?NDZqRE9jSG9VSDlqd2FTWU9VK25RMUNxVTZib1RNL3JEWGpPelZmWDlOK2FL?=
 =?utf-8?B?MEJ5cktCcmhFYUpaSVRxMkFOazdWZ0Y5WExWazQ1YUYrSk9hTk5HWHoyMWhG?=
 =?utf-8?B?Y3ZLaEQ5ZGJqYm1CVkRhQnNrOFpzUXZpRk5OYmlwVVVGamhqdHJMY3ZSSnV6?=
 =?utf-8?B?NUluY2hJL3lLcmVLSzMwN1MrWkRDTU1FcW9mdmNSR0pPTmFUV1Y4WDJVazRs?=
 =?utf-8?B?YUZTL2VOdm5mOHV5MFNsZjM4c0tBeC9HK0VJSXVoZWoza2hGanYwd044ZHl0?=
 =?utf-8?B?RmlOMitLOXdJQm0wT1EwNWkwZ05PWmxhNGRRRGM0eGFVb0hXOUd0cU1lQlRu?=
 =?utf-8?B?Y00wMTkrVkJIdEJaQURURHcrc0NJQ0oxYUU5OXY5U2JqUWdVR29DMGdiakx4?=
 =?utf-8?B?N1VqbU1CN0lmNUFMMUtWUnpDbUU2c1BTcHNKelEvNjhVSmliaGZQWHNVcy83?=
 =?utf-8?B?cWJ2MEIrck1qd3JNRm1WTFhXaCtReDFnNXJRTjUxRGw2V0swVlZqNGl6Mzh4?=
 =?utf-8?B?WXNLVTZJMXo4bTcvdG9aWFRHZ1hPOFlmVlZwYjNGNGcyWWNUU2ZMY1BEcCs4?=
 =?utf-8?B?VTJrUVFRTDVyVXF4MDFYU05yT1k1dkw3ZitRM2NPaDNlMm10cjNUMEZCV0ZS?=
 =?utf-8?B?SnNhSjRPUjczc2ZzdkhnRVU1WEk3QVAzVTZZVXJoNDFrZHA2bDBibUU5SEZE?=
 =?utf-8?B?K3JqU01ZR3hjdExhZGtQVnRZdTFLTWt6NkI1VTJKK1habWNYRlJwcTNVckpI?=
 =?utf-8?B?U1dOYngwa2w0eHFCaFVJcmRUSnFCV2NTenl3WTRFNUlQbnBxOWF6SVVyTlAv?=
 =?utf-8?B?aHB5RkxxbmdIVFJ6Tjk0SGVTZXFFcDhpVVNlS3lSeHE0YVhZQ216alhXQ0NW?=
 =?utf-8?B?NWQ2Zk1yTE1uR0ZCKzhnT1B2c21qSVhsTGE0WFZLYVdYMUtuRThwcjQ4RHRx?=
 =?utf-8?B?Y3lXejVwTmpiY3MrMjhhMm1zSWh2VG8wY25GN3FtMDNvVnV6NHN3VFNEdFhR?=
 =?utf-8?B?ZjFhTlRDVmZRNzUwbjRkeDRnZFFJUmRLVE5YVFBGSnpZRFdLeG9HTUZMaDZo?=
 =?utf-8?B?d3JUY3E1VmI5K0xrajJKeVIzRnlGTUNRMzRiSWtsZUJCRVkvdldMajdPR3pC?=
 =?utf-8?B?WDd6NVA2VmVNZ0RLYlVvL3ZSUjFrL3JyTWx3T1o2QzdHMk92SlpBTVQvYVls?=
 =?utf-8?B?QlAzd0tvS0FSZnc2OHBONHQ0SEFrL3ZZNkJCbFpUL3BDQjVIeHZ6VTI3cDhL?=
 =?utf-8?B?Szl4NlEvcVdkRDZ3N2VJZXBaK3c4eDNlQi8rQlduR3dRaWlMU1ZGeGs0cWw5?=
 =?utf-8?B?dzgyUzQxWWREWDcwenhtT29RNFVlNnVUdExsS0d0dmNJU1VrU1lUM1Y3K1FX?=
 =?utf-8?B?YkZzdEJWQmJNVFE0ZDZqM2Z6RTlmRDQwVCtWSjEwMGdTZ1VwOS9HNkNrSWJL?=
 =?utf-8?B?aW1oMEpCMDlxeUZtR1FFVm5Dc1UwMGFqd1ZtS3A3aVdUYnJCZnFUSFRLOEU4?=
 =?utf-8?B?NTNTT0R2aTI3TXF1YktNcUdQMFFaS2ZzdjJxNDFPTFFuSlFNQTNOdXRoMjBp?=
 =?utf-8?B?MlI1bWQxL3RTT0x3cnllREVJeFVuYU9JWCt3d1RtRS9WdEJWVjFGVVp0Ykho?=
 =?utf-8?B?d09ETDk1YkMwa1FNU0laOXdKU0lZblNBL29xMHlqaUtzMExSMWJkNDhrdG5K?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4253408-dd49-4448-0d89-08de10f32074
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:42:34.2940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtoLp063Pnwj42tecaRTddlZIqJ81Dlh0yg9LDgPOxs6STsYz6eAP+N1How3Z/9+J+kWKsnetOX30u1GIyO4HJs7GDSngWiapGAixWuGX6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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

Now that it's possible to free the packets - connect the restore
handling logic with the ring.
The helpers will also be used in upcoming changes that will start producing
migration data packets.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |   7 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  29 +++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   1 +
 drivers/gpu/drm/xe/xe_sriov_migration_data.c  | 127 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_migration_data.h  |  31 +++++
 6 files changed, 195 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_migration_data.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_migration_data.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 89e5b26c27975..3d72db9e528e4 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -173,6 +173,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_lmtt_2l.o \
 	xe_lmtt_ml.o \
 	xe_pci_sriov.o \
+	xe_sriov_migration_data.o \
 	xe_sriov_pf.o \
 	xe_sriov_pf_control.o \
 	xe_sriov_pf_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index cad73fdaee93c..dd9bc9c99f78c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -18,6 +18,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
+#include "xe_sriov_migration_data.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_service.h"
@@ -851,6 +852,8 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
+
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
@@ -1045,6 +1048,8 @@ int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
 static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
+
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
@@ -1078,6 +1083,8 @@ pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 
 	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
 
+	xe_sriov_migration_data_free(data);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index b6ffd982d6007..8ba72165759b3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -14,6 +14,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
+#include "xe_sriov_migration_data.h"
 #include "xe_sriov_pf_migration.h"
 
 #define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
@@ -418,6 +419,25 @@ bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid)
 	return ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring);
 }
 
+/**
+ * xe_gt_sriov_pf_migration_ring_free() - Consume and free all data in migration ring
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ */
+void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+	struct xe_sriov_migration_data *data;
+
+	if (ptr_ring_empty(&migration->ring))
+		return;
+
+	xe_gt_sriov_notice(gt, "VF%u unprocessed migration data left in the ring!\n", vfid);
+
+	while ((data = ptr_ring_consume(&migration->ring)))
+		xe_sriov_migration_data_free(data);
+}
+
 /**
  * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
  * @gt: the &xe_gt
@@ -543,11 +563,18 @@ xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
 	return ERR_PTR(-EAGAIN);
 }
 
+static void pf_mig_data_destroy(void *ptr)
+{
+	struct xe_sriov_migration_data *data = ptr;
+
+	xe_sriov_migration_data_free(data);
+}
+
 static void action_ring_cleanup(struct drm_device *dev, void *arg)
 {
 	struct ptr_ring *r = arg;
 
-	ptr_ring_cleanup(r, NULL);
+	ptr_ring_cleanup(r, pf_mig_data_destroy);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 9e67f18ded205..1ed2248f0a17e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -17,6 +17,7 @@ int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vf
 
 bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
 bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
+void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
 
 int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_migration_data *data);
diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
new file mode 100644
index 0000000000000..b04f9be3b7fed
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_sriov_migration_data.h"
+
+static bool data_needs_bo(struct xe_sriov_migration_data *data)
+{
+	return data->type == XE_SRIOV_MIGRATION_DATA_TYPE_VRAM;
+}
+
+/**
+ * xe_sriov_migration_data() - Allocate migration data packet
+ * @xe: the &xe_device
+ *
+ * Only allocates the "outer" structure, without initializing the migration
+ * data backing storage.
+ *
+ * Return: Pointer to &xe_sriov_migration_data on success,
+ *         NULL in case of error.
+ */
+struct xe_sriov_migration_data *
+xe_sriov_migration_data_alloc(struct xe_device *xe)
+{
+	struct xe_sriov_migration_data *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return NULL;
+
+	data->xe = xe;
+	data->hdr_remaining = sizeof(data->hdr);
+
+	return data;
+}
+
+/**
+ * xe_sriov_migration_data_free() - Free migration data packet.
+ * @data: the &xe_sriov_migration_data packet
+ */
+void xe_sriov_migration_data_free(struct xe_sriov_migration_data *data)
+{
+	if (data_needs_bo(data))
+		xe_bo_unpin_map_no_vm(data->bo);
+	else
+		kvfree(data->buff);
+
+	kfree(data);
+}
+
+static int mig_data_init(struct xe_sriov_migration_data *data)
+{
+	struct xe_gt *gt = xe_device_get_gt(data->xe, data->gt);
+
+	if (data->size == 0)
+		return 0;
+
+	if (data_needs_bo(data)) {
+		struct xe_bo *bo = xe_bo_create_pin_map_novm(data->xe, gt->tile,
+							     PAGE_ALIGN(data->size),
+							     ttm_bo_type_kernel,
+							     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED,
+							     false);
+		if (IS_ERR(bo))
+			return PTR_ERR(bo);
+
+		data->bo = bo;
+		data->vaddr = bo->vmap.vaddr;
+	} else {
+		void *buff = kvzalloc(data->size, GFP_KERNEL);
+
+		if (!buff)
+			return -ENOMEM;
+
+		data->buff = buff;
+		data->vaddr = buff;
+	}
+
+	return 0;
+}
+
+#define XE_SRIOV_MIGRATION_DATA_SUPPORTED_VERSION 1
+/**
+ * xe_sriov_migration_data_init() - Initialize the migration data header and backing storage.
+ * @data: the &xe_sriov_migration_data packet
+ * @tile_id: tile identifier
+ * @gt_id: GT identifier
+ * @type: &xe_sriov_migration_data_type
+ * @offset: offset of data packet payload (within wider resource)
+ * @size: size of data packet payload
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_migration_data_init(struct xe_sriov_migration_data *data, u8 tile_id, u8 gt_id,
+				 enum xe_sriov_migration_data_type type, loff_t offset, size_t size)
+{
+	data->version = XE_SRIOV_MIGRATION_DATA_SUPPORTED_VERSION;
+	data->type = type;
+	data->tile = tile_id;
+	data->gt = gt_id;
+	data->offset = offset;
+	data->size = size;
+	data->remaining = size;
+
+	return mig_data_init(data);
+}
+
+/**
+ * xe_sriov_migration_data_init() - Initialize the migration data backing storage based on header.
+ * @data: the &xe_sriov_migration_data packet
+ *
+ * Header data is expected to be filled prior to calling this function.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *data)
+{
+	if (data->version != XE_SRIOV_MIGRATION_DATA_SUPPORTED_VERSION)
+		return -EINVAL;
+
+	data->remaining = data->size;
+
+	return mig_data_init(data);
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
new file mode 100644
index 0000000000000..ef65dccddc035
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_MIGRATION_DATA_H_
+#define _XE_SRIOV_MIGRATION_DATA_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+
+enum xe_sriov_migration_data_type {
+	/* Skipping 0 to catch uninitialized data */
+	XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR = 1,
+	XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER,
+	XE_SRIOV_MIGRATION_DATA_TYPE_GGTT,
+	XE_SRIOV_MIGRATION_DATA_TYPE_MMIO,
+	XE_SRIOV_MIGRATION_DATA_TYPE_GUC,
+	XE_SRIOV_MIGRATION_DATA_TYPE_VRAM,
+};
+
+struct xe_sriov_migration_data *
+xe_sriov_migration_data_alloc(struct xe_device *xe);
+void xe_sriov_migration_data_free(struct xe_sriov_migration_data *snapshot);
+
+int xe_sriov_migration_data_init(struct xe_sriov_migration_data *data, u8 tile_id, u8 gt_id,
+				 enum xe_sriov_migration_data_type, loff_t offset, size_t size);
+int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *snapshot);
+
+#endif
-- 
2.50.1

