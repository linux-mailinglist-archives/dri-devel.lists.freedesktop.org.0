Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE4FC22486
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D7710EA98;
	Thu, 30 Oct 2025 20:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DATu5bJu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DE810EA8F;
 Thu, 30 Oct 2025 20:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856471; x=1793392471;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jLpXtrZ2RlcX2PcaxaetB6kBLX4YC0rRscdePIn1QzA=;
 b=DATu5bJue113CEQnuE/ZL2DQluwpHIwh0XF0Lj25u7jWG3kVvbEF5CS9
 MJuQGBpTG33bLFYGPQIhPh927UOx28JzmMMmzyDBxRaMBv+ISU+VnfThr
 J0KTTocu61Lv40mfugmDqRaBfOGTANzQZOjoumRDsneuNWg6lWi4sUOb6
 AHFnb2QA/ZKe3L9+TrYjVBgJlz7BK64u9k6ShItAy5ENrdUUQwqjf4+5j
 Lvl9qMtFcYojQwbssQbQgoc7b7NIbpqPVANPI0JPYWOyPbUcNjFYDL00A
 gCGMo0GbJv8Nksm9LjU0p83GqT0CVSXg/XHTIkVXLBM0uALoEox0/GDYP g==;
X-CSE-ConnectionGUID: 1BF1Kv5BQLKmpVVbGpg/Pg==
X-CSE-MsgGUID: FMvWFpzBSNihdW4iHrwPZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67847829"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67847829"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:34:31 -0700
X-CSE-ConnectionGUID: 3mgpyaFeTSi1IoMjgWCNiQ==
X-CSE-MsgGUID: hiFw2PY4Qe6nhw6G8NiGqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="186492919"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:34:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:34:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:34:20 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.11) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:34:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tqfn/+HVEU7WKnXmT02bsCE5bPsJTnAbPhz2b+ZWL4C3ZergtDoWSKFfJr1xO1bDmQc3Y5P2RT56scIdfhC0VbOAe9yzWHZ2G1Fj/GljXKMi6N+c/RB4STe+MR8v+My7m+0joUKtB8F77R7UkbQ3YuqNVRfr1wAXqPKaUPXcrw4j+lMOa2QJH5ZGS00/mgt39Nf+2lMUHmZJnA+eZ/ZDcUUiGQ9Unl0PeK0BQLoj+V2/kytxIw3+v50XreZN657LwbSl53iocdIYtMRcevCdM/tnEHW5dpO2YMC1PJUXZOlpXUCp6F/0YLaCQLHG6YQOd7mCTMVI1tUvq0U7+aFg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqCf6xbos9OcMiiMZzYT0jam2dBqfFCqKjCOZKuuYF4=;
 b=EkT0ta0hKzktS1IJL1CSVhMJkPCzyUUQfWMUEkXlbm6CbSGRJgLJBDLz2uN6b/k30SXoVZupnvI5YQHb4tlVINV/ETuLyGVVf+eyBIPTtrbFb0U7lkO32aHwCcERxhBeGjeLfThguV9oYGqr/zSDPBcr/hLYNH7MetqDMYFIyEmKWJZ7DELPqdQlj63Jhnf+tq/xi9lz/yNJmYrfuoetOaSE9poqplZ+0jw3v56/xvqfOG5lV2glvwBVXntEALEu9KlDrZLSJGc3UmRs8lG023BbNAiSkayA9B7LGzYq0qktQ0O93iCU6u2UB+WL94XAeRxdgYkWZRZQDxnroW5iHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB6896.namprd11.prod.outlook.com (2603:10b6:806:2bd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.12; Thu, 30 Oct 2025 20:34:12 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:34:12 +0000
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
Subject: [PATCH v3 28/28] vfio/xe: Add device specific vfio_pci driver variant
 for Intel graphics
Date: Thu, 30 Oct 2025 21:31:35 +0100
Message-ID: <20251030203135.337696-29-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: de0a3f5e-b871-4c93-a483-08de17f3af90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmwxU203aStYbURQYktObTVVQjBDaWRrUjF0Z3loZFp0T3ZGVVlVaGsxNmlY?=
 =?utf-8?B?RDdGQ2JDNWF0MkF0MEY4T3JUTWpqU083NUlSc3JMMGxLYU9nTVpmNFQvc2J1?=
 =?utf-8?B?NnJUT1MxL0VBODZPM0crMGp5Ym1ZeXQvRkxLN0xFdEpMUW95dEswcWovbVJE?=
 =?utf-8?B?aG5nSGN1RWJPNUd0cG5nQnU3YnNNcHU5Q2xINTFPeVNYY01SREFGVTh5T0FI?=
 =?utf-8?B?MXVFOThMVzlGVXVDZEFUK1pkL1o2blQ4REJtVmIrM1dnd29zSmZPMEtHQ3h1?=
 =?utf-8?B?Sm9ySU9VSzdCMndBK21aQnFvK3lwcTgyZ0dXT09EVVhETSs4Y09mdTZwdlo3?=
 =?utf-8?B?ZXJyZmw3WXdyQzU2Z2R4dlJjcGRwR1QwTFhYU3o1SnN0NC8wOCtmOHowWFlG?=
 =?utf-8?B?ekg0RFVhMDdkRUZTckZjblh2ZnRWU3dYNElYUUJQY0RaWjQrRmk3WUZzbWtI?=
 =?utf-8?B?czRUWGZqSnVkbU92enhZZlFVSnArZjI3MXkrQzI5aWZuV2VGTHFnWHFObW53?=
 =?utf-8?B?WUdJcVZmeCsyaUFBNlF4cmw4K0twNGlnakh3U01vRlc2YTI1SnZoQlVxQ2tF?=
 =?utf-8?B?T3EreGdEemdHWGJhZzF0TVprRzR1Um9neWFoRTRoUHdCK1k4RVIyNG92ejEv?=
 =?utf-8?B?VXNHRG5CTGV1bVFzeUUrcStBNktYbytpSTNuTlh1TW5JT1krenpWdUc4Y0U0?=
 =?utf-8?B?WUR3Z2U2WnlQSmEzdGk5N1BqbnNIVStCTnU0blhNUEg3ZzBRVll2MWErVzVj?=
 =?utf-8?B?Rjd4cHZTMFVGUVU5R1R2NkZOK3RjWk14NnZYRW1QWEZraUc1a3VPQjBsUXlj?=
 =?utf-8?B?MGw3TlJjeXFPbGI5STdjaGRibzBRUWdramVTdUFocDBWNVBNSU9ZZDVKRUND?=
 =?utf-8?B?Wms0ckc5azhQelc3ZE5oK0wxbThVZGk3VEFXalpSeWh0S25sU3A1UXF6bVpQ?=
 =?utf-8?B?YW9pN2UzcGV0ZnRCZmx3YW9wK09ZQjFJTFVYU1BYYUZ3bFFRVENiMjg2Y2hN?=
 =?utf-8?B?NCtuV2JybnNUUUZSUndpK21obHA0azVQc0cyMk9STVRBNnptN3Y3RFZQb29H?=
 =?utf-8?B?TWJleUpSVlk4SVZSVzFyRlhWV0hSL3pZajFvcHUrbVJYTUFjTEVhL1Vad2s0?=
 =?utf-8?B?SUFuYk16QnVpdHdKeVNNTStiV0lMTjdSNnd3SHk3YkNmNlpiTytQeGZ1K2t6?=
 =?utf-8?B?MUlkT1RpaUtiTTJJUE9pZGFsWGxseklVcTZURGNVeEl1ZEpaZGdzSHNTN0x5?=
 =?utf-8?B?eENBQzU5SGNJZThiQUJhbGZKVlUxWVNaajJXUng3T1BBbTQ5eWZIZmhRN3dK?=
 =?utf-8?B?RU1jdTR5SU9mQzB6L2FTNGYxaGROSmlUOGs2SlB0L1JIdkNieDBCWFFNWllB?=
 =?utf-8?B?WTJGUXdkK2U3MHFzTWZ5bXE1V091aVdzK0FpVzBEeXU5dEZKblZDWTVIOXRh?=
 =?utf-8?B?UzZjQmdsZ3BoVjRQSlNOUHhNTXdnMHV4UDBvTXo3VmdaU1NiU0k1UVQ4ZExX?=
 =?utf-8?B?T3Y4WWVNZUsyTGsxUXZ2ZXdoTEdOSXU2RzZNLzEvM3U5NTFWMkh4QlVCVDBj?=
 =?utf-8?B?KzlUVXpUUUNhM1dMRlkrdnBWY1gwRUxCUGdJbkpFLytoOHE3R0pOYmZ3MXVw?=
 =?utf-8?B?UDhrRTNxRzk4Zkk1aTIzNWpRdnFRc0o1blA3d0syRXFRM2dPZHQ0dXVWZmNa?=
 =?utf-8?B?cElHcjR3WStWaGZKNkd5anIzMXdxcCtqTU1vNk1tZmVhMTEwTHUwU0k2TktR?=
 =?utf-8?B?TXpPK0pTSzVNcjNsSitVRkFBNDlWbW1UeHZmM0Ryajl4cmJIYnBPUnVNdVJH?=
 =?utf-8?B?S3JhTy9qZ2tjQUcweXlPcTY4VDE5bXhXeUtXems2bTd0Qzl5eDN5OEkyRE84?=
 =?utf-8?B?NTZHaGpJaS9GY3V3U3JMckVHa1lvY0gwSkt3ZDB6VG1jTFd1N01lMG0rdFIr?=
 =?utf-8?B?d3VjTTlTRFVtVGlvRHdsTXVmWmVzSXQ2Q0xzcEZyZzFlLzVqSnRXL0RjWE5h?=
 =?utf-8?Q?GRepSLVKn4TaD2ZKDrtAZygS+e4BYg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHozWm9PNmNEVElKcUFFTXdmUm80engzWmVDTmt4QzdPWFZydWlxbmZKa3dq?=
 =?utf-8?B?cTdFSDI5S2VwanVHbG43QW1lOWhSZXZEeFNXMXMyVVErZUROUGJKWjdUd0RK?=
 =?utf-8?B?NmFWQUgwZ2FaK2hqbVloY1RCTXI0WlBhV2Y5RVViVXBIdllxTFROcUVIdGRV?=
 =?utf-8?B?MXg0VEVIcGVBNDQ2cUU1S0tpNnVtL0xSc1dsNkx1NXdpRkdqbGlGajVKQTBr?=
 =?utf-8?B?bDEwNUF3cmJiWEx1dEF6ZFdyZi9rSklPNFNaSFlFUVAxZ1UvUWdvYWhnaXlE?=
 =?utf-8?B?cS9xNTBINS9YSjdGcmcvc3Uzb1FSbDlzenRCRUw0NURuclNJczNLOEpGcVBX?=
 =?utf-8?B?SlFiWE93SVhnSUNHMDZIOE9uMU9XZk5DRjZMOFY3bXkweDNGSkZHVWplNEpr?=
 =?utf-8?B?c3Y5MlpTRkpCejRHQVREbWd5OS9yV1JyZ3F0QmJ4L1JzNW9MRWJCZ0VSVjYx?=
 =?utf-8?B?aG51aU4xWEVpeE5JYk9TN1ZsRkdOOVVsZTJHYUZRbmgybFNBMWJ5aTZyYTNJ?=
 =?utf-8?B?RmZ2QUJKSXJGWXVVZmMvUDAyamU5NU02V0l5TWloVDVWRlRSa05lSWI2aElH?=
 =?utf-8?B?ZFlnM1hwRm5OQ21GZVV6eWVwdU90KzRlTEdkT1VSWERTdWgvTlJleWdqMFlx?=
 =?utf-8?B?ZVU1bjl5UWNUS1B2ajVNek9UTUxlN2hvWjFvMS9JeFU1N2J1V292WHh2ZGpR?=
 =?utf-8?B?VWFab2pBL1llTUs5ekZwc21GUVpZcElvVUVRSDBxOVRzdUdMdjJHUE5GQkI5?=
 =?utf-8?B?WGhRMi9ZMmMzN01hTS9xYjZ0VzVuQnIvYXRtWFlMLzQ5cWNhL05ZdlIyNmIw?=
 =?utf-8?B?Mi9oQTBrSTNZRjd0OEM0ZURnTDRrQjdpRUJ6QSs4Uzh2MUhzay96YUtIQnZ3?=
 =?utf-8?B?TWdiN3p5Sy9MR3NhVVlXR0tlaFBaMmx1YkFqanBta1ErK3lOb2tmMGNWWGJt?=
 =?utf-8?B?ZzJFN1BIUm9yemRLNmxvRko3RzBzb3pobjdpLzNGK1RmTHhiVkxlOU9VblJL?=
 =?utf-8?B?VXl2VDdhcEQybzFhRkRjbndQaGZLdlZ1U0c5ZXVFMXVFY2ZJT3E4QVJJekpJ?=
 =?utf-8?B?SzFINmRqZ0VFMGhNM0dsb3F0eHUxOGI5c2dvN3czZjdncHE2N2ZlR1YzQ1FN?=
 =?utf-8?B?U1BSUDdYa2FacHpsM3RNdHpyUkFSbWNENVVSbXEyR3F5SnpxanQwSDZkRW5r?=
 =?utf-8?B?NWFDQkY1MmUzQ0lLUGRxZVhwcWJBUjBmQmF6UVRxcnlrbUxrQ25PRm5SSkVI?=
 =?utf-8?B?SFJyb24vY3RtUHpSTVVacnFpZWNKR1dxdGY1cXA1SkVvUWxjaFVKNERDUnpy?=
 =?utf-8?B?SE1vYUVNeDNUejk3Sms0a2RubzNKREFPaEEraldDVWhxK1YxNGJpMG12aUVo?=
 =?utf-8?B?MUxEbkpLdnVNT3hucHZNcDdvZ0tiK1oyMmIwbU1tZ3p2bXFBbXdsVDFEdXVG?=
 =?utf-8?B?Mi9sd0ZOd09zbmQyWCswTUg4aUYvTDJIckN2VGVqR29yME9VcVZwb2I1RUlz?=
 =?utf-8?B?WVcxWHhiNlFNcEkyclFrdDZ0V21aUHNPa25paWtnWGpUdGphNjRIRjM0V0lh?=
 =?utf-8?B?NzhYZEE1a0tCZ0hpUVFUWUhJdmdPaWNMUDhma2xSM1BRY1BFS1B0TVBwOTdC?=
 =?utf-8?B?UitPWmNERlcyWi9sZENNRElQWmtET1hxd2p6Mm5FQ1AyMEUzZjF1S2lNTHVa?=
 =?utf-8?B?QVM2OUJlc29Bdis2RFJzS291b1UyS2htNnVUc1BFTkdTYk1SVGRaVkFSOGRJ?=
 =?utf-8?B?VUwwRmxyVWpjbnkzMHBOZUJDRlNEclZEeXZ3TWxJTGVkaTRhd0MvaFhRVUx0?=
 =?utf-8?B?YVE0TkVVNVZ6cVlTT3h2RlcyTlcwUFN3NmRJVyt1YThtdWF4WVBRU0k0QmFv?=
 =?utf-8?B?M3NpSWN2ZXlsdnEvaXVGNW4xREJONVBhN1FLc0tUMGVIVjYrbSs3aVNGc3ds?=
 =?utf-8?B?TjdjOEhVYm4raWs2TWIyUzU1d3A2V3EvVVZIUGRmSWJnVTdYY3h4ZjN0ejdn?=
 =?utf-8?B?Mis3SG43NDg1bWM2cGhWcnErUmtLT1p4R0tYYmZuaUxMMHliTWgyNzVpQ3lX?=
 =?utf-8?B?SHhhYmV6NE4xeUllSDdPNktTUFNpUUpGZGF3YnpvOGcycCtsUU9yZ2RKMUQw?=
 =?utf-8?B?WmtqNUVkUCtha05reGI2ZmFYM2YzYkRqQjJsZ2RhaE5ieXJHK2l4d09kVUVr?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de0a3f5e-b871-4c93-a483-08de17f3af90
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:34:12.6013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4d2tuJT/VRsCInlM+qqOUzr2YgWgHks9fXPnp0rAIVJmrKFHTvqr6amv3rMALIuKVo5695UJ0lthcy41pVO8UASXmj0UQTqldYDsNijrpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6896
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

In addition to generic VFIO PCI functionality, the driver implements
VFIO migration uAPI, allowing userspace to enable migration for Intel
Graphics SR-IOV Virtual Functions.
The driver binds to VF device, and uses API exposed by Xe driver bound
to PF device to control VF device state and transfer the migration data.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 MAINTAINERS                  |   7 +
 drivers/vfio/pci/Kconfig     |   2 +
 drivers/vfio/pci/Makefile    |   2 +
 drivers/vfio/pci/xe/Kconfig  |  12 +
 drivers/vfio/pci/xe/Makefile |   3 +
 drivers/vfio/pci/xe/main.c   | 552 +++++++++++++++++++++++++++++++++++
 6 files changed, 578 insertions(+)
 create mode 100644 drivers/vfio/pci/xe/Kconfig
 create mode 100644 drivers/vfio/pci/xe/Makefile
 create mode 100644 drivers/vfio/pci/xe/main.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b890ff265f03f..d73348c5f3f3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27008,6 +27008,13 @@ L:	virtualization@lists.linux.dev
 S:	Maintained
 F:	drivers/vfio/pci/virtio
 
+VFIO XE PCI DRIVER
+M:	Michał Winiarski <michal.winiarski@intel.com>
+L:	kvm@vger.kernel.org
+L:	intel-xe@lists.freedesktop.org
+S:	Supported
+F:	drivers/vfio/pci/xe
+
 VGA_SWITCHEROO
 R:	Lukas Wunner <lukas@wunner.de>
 S:	Maintained
diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index 2b0172f546652..c100f0ab87f2d 100644
--- a/drivers/vfio/pci/Kconfig
+++ b/drivers/vfio/pci/Kconfig
@@ -67,4 +67,6 @@ source "drivers/vfio/pci/nvgrace-gpu/Kconfig"
 
 source "drivers/vfio/pci/qat/Kconfig"
 
+source "drivers/vfio/pci/xe/Kconfig"
+
 endmenu
diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index cf00c0a7e55c8..f5d46aa9347b9 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -19,3 +19,5 @@ obj-$(CONFIG_VIRTIO_VFIO_PCI) += virtio/
 obj-$(CONFIG_NVGRACE_GPU_VFIO_PCI) += nvgrace-gpu/
 
 obj-$(CONFIG_QAT_VFIO_PCI) += qat/
+
+obj-$(CONFIG_XE_VFIO_PCI) += xe/
diff --git a/drivers/vfio/pci/xe/Kconfig b/drivers/vfio/pci/xe/Kconfig
new file mode 100644
index 0000000000000..787be88268685
--- /dev/null
+++ b/drivers/vfio/pci/xe/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config XE_VFIO_PCI
+	tristate "VFIO support for Intel Graphics"
+	depends on DRM_XE
+	select VFIO_PCI_CORE
+	help
+	  This option enables vendor-specific VFIO driver for Intel Graphics.
+	  In addition to generic VFIO PCI functionality, it implements VFIO
+	  migration uAPI allowing userspace to enable migration for
+	  Intel Graphics SR-IOV Virtual Functions supported by the Xe driver.
+
+	  If you don't know what to do here, say N.
diff --git a/drivers/vfio/pci/xe/Makefile b/drivers/vfio/pci/xe/Makefile
new file mode 100644
index 0000000000000..13aa0fd192cd4
--- /dev/null
+++ b/drivers/vfio/pci/xe/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_XE_VFIO_PCI) += xe-vfio-pci.o
+xe-vfio-pci-y := main.o
diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
new file mode 100644
index 0000000000000..4892c6648c0a7
--- /dev/null
+++ b/drivers/vfio/pci/xe/main.c
@@ -0,0 +1,552 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/anon_inodes.h>
+#include <linux/delay.h>
+#include <linux/file.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/sizes.h>
+#include <linux/types.h>
+#include <linux/vfio.h>
+#include <linux/vfio_pci_core.h>
+
+#include <drm/intel/xe_sriov_vfio.h>
+#include <drm/intel/pciids.h>
+
+struct xe_vfio_pci_migration_file {
+	struct file *filp;
+	/* serializes accesses to migration data */
+	struct mutex lock;
+	struct xe_vfio_pci_core_device *xe_vdev;
+};
+
+struct xe_vfio_pci_core_device {
+	struct vfio_pci_core_device core_device;
+	struct xe_device *xe;
+	/* VF number used by PF, Xe HW/FW components use vfid indexing starting from 1 */
+	unsigned int vfid;
+	u8 migrate_cap:1;
+	u8 deferred_reset:1;
+	/* protects migration state */
+	struct mutex state_mutex;
+	enum vfio_device_mig_state mig_state;
+	/* protects the reset_done flow */
+	spinlock_t reset_lock;
+	struct xe_vfio_pci_migration_file *migf;
+};
+
+#define xe_vdev_to_dev(xe_vdev) (&(xe_vdev)->core_device.pdev->dev)
+
+static void xe_vfio_pci_disable_file(struct xe_vfio_pci_migration_file *migf)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = migf->xe_vdev;
+
+	mutex_lock(&migf->lock);
+	xe_vdev->migf = NULL;
+	mutex_unlock(&migf->lock);
+}
+
+static void xe_vfio_pci_reset(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	if (xe_vdev->migf)
+		xe_vfio_pci_disable_file(xe_vdev->migf);
+
+	xe_vdev->mig_state = VFIO_DEVICE_STATE_RUNNING;
+}
+
+static void xe_vfio_pci_state_mutex_lock(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	mutex_lock(&xe_vdev->state_mutex);
+}
+
+/*
+ * This function is called in all state_mutex unlock cases to
+ * handle a 'deferred_reset' if exists.
+ */
+static void xe_vfio_pci_state_mutex_unlock(struct xe_vfio_pci_core_device *xe_vdev)
+{
+again:
+	spin_lock(&xe_vdev->reset_lock);
+	if (xe_vdev->deferred_reset) {
+		xe_vdev->deferred_reset = false;
+		spin_unlock(&xe_vdev->reset_lock);
+		xe_vfio_pci_reset(xe_vdev);
+		goto again;
+	}
+	mutex_unlock(&xe_vdev->state_mutex);
+	spin_unlock(&xe_vdev->reset_lock);
+}
+
+static void xe_vfio_pci_reset_done(struct pci_dev *pdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
+	int ret;
+
+	if (!xe_vdev->vfid)
+		return;
+
+	/*
+	 * VF FLR requires additional processing done by PF driver.
+	 * The processing is done after FLR is already finished from PCIe
+	 * perspective.
+	 * In order to avoid a scenario where VF is used while PF processing
+	 * is still in progress, additional synchronization point is needed.
+	 */
+	ret = xe_sriov_vfio_wait_flr_done(xe_vdev->xe, xe_vdev->vfid);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to wait for FLR: %d\n", ret);
+
+	if (!xe_vdev->migrate_cap)
+		return;
+
+	/*
+	 * As the higher VFIO layers are holding locks across reset and using
+	 * those same locks with the mm_lock we need to prevent ABBA deadlock
+	 * with the state_mutex and mm_lock.
+	 * In case the state_mutex was taken already we defer the cleanup work
+	 * to the unlock flow of the other running context.
+	 */
+	spin_lock(&xe_vdev->reset_lock);
+	xe_vdev->deferred_reset = true;
+	if (!mutex_trylock(&xe_vdev->state_mutex)) {
+		spin_unlock(&xe_vdev->reset_lock);
+		return;
+	}
+	spin_unlock(&xe_vdev->reset_lock);
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	xe_vfio_pci_reset(xe_vdev);
+}
+
+static const struct pci_error_handlers xe_vfio_pci_err_handlers = {
+	.reset_done = xe_vfio_pci_reset_done,
+	.error_detected = vfio_pci_core_aer_err_detected,
+};
+
+static int xe_vfio_pci_open_device(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+	struct vfio_pci_core_device *vdev = &xe_vdev->core_device;
+	int ret;
+
+	ret = vfio_pci_core_enable(vdev);
+	if (ret)
+		return ret;
+
+	vfio_pci_core_finish_enable(vdev);
+
+	return 0;
+}
+
+static int xe_vfio_pci_release_file(struct inode *inode, struct file *filp)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+
+	xe_vfio_pci_disable_file(migf);
+	mutex_destroy(&migf->lock);
+	kfree(migf);
+
+	return 0;
+}
+
+static ssize_t xe_vfio_pci_save_read(struct file *filp, char __user *buf, size_t len, loff_t *pos)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+	ssize_t ret;
+
+	if (pos)
+		return -ESPIPE;
+
+	mutex_lock(&migf->lock);
+	ret = xe_sriov_vfio_data_read(migf->xe_vdev->xe, migf->xe_vdev->vfid, buf, len);
+	mutex_unlock(&migf->lock);
+
+	return ret;
+}
+
+static const struct file_operations xe_vfio_pci_save_fops = {
+	.owner = THIS_MODULE,
+	.read = xe_vfio_pci_save_read,
+	.release = xe_vfio_pci_release_file,
+	.llseek = noop_llseek,
+};
+
+static ssize_t xe_vfio_pci_resume_write(struct file *filp, const char __user *buf,
+					size_t len, loff_t *pos)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+	ssize_t ret;
+
+	if (pos)
+		return -ESPIPE;
+
+	mutex_lock(&migf->lock);
+	ret = xe_sriov_vfio_data_write(migf->xe_vdev->xe, migf->xe_vdev->vfid, buf, len);
+	mutex_unlock(&migf->lock);
+
+	return ret;
+}
+
+static const struct file_operations xe_vfio_pci_resume_fops = {
+	.owner = THIS_MODULE,
+	.write = xe_vfio_pci_resume_write,
+	.release = xe_vfio_pci_release_file,
+	.llseek = noop_llseek,
+};
+
+static const char *vfio_dev_state_str(u32 state)
+{
+	switch (state) {
+	case VFIO_DEVICE_STATE_RUNNING: return "running";
+	case VFIO_DEVICE_STATE_RUNNING_P2P: return "running_p2p";
+	case VFIO_DEVICE_STATE_STOP_COPY: return "stopcopy";
+	case VFIO_DEVICE_STATE_STOP: return "stop";
+	case VFIO_DEVICE_STATE_RESUMING: return "resuming";
+	case VFIO_DEVICE_STATE_ERROR: return "error";
+	default: return "";
+	}
+}
+
+enum xe_vfio_pci_file_type {
+	XE_VFIO_FILE_SAVE = 0,
+	XE_VFIO_FILE_RESUME,
+};
+
+static struct xe_vfio_pci_migration_file *
+xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
+		       enum xe_vfio_pci_file_type type)
+{
+	struct xe_vfio_pci_migration_file *migf;
+	const struct file_operations *fops;
+	int flags;
+
+	migf = kzalloc(sizeof(*migf), GFP_KERNEL);
+	if (!migf)
+		return ERR_PTR(-ENOMEM);
+
+	fops = type == XE_VFIO_FILE_SAVE ? &xe_vfio_pci_save_fops : &xe_vfio_pci_resume_fops;
+	flags = type == XE_VFIO_FILE_SAVE ? O_RDONLY : O_WRONLY;
+	migf->filp = anon_inode_getfile("xe_vfio_mig", fops, migf, flags);
+	if (IS_ERR(migf->filp)) {
+		kfree(migf);
+		return ERR_CAST(migf->filp);
+	}
+
+	mutex_init(&migf->lock);
+	migf->xe_vdev = xe_vdev;
+	xe_vdev->migf = migf;
+
+	stream_open(migf->filp->f_inode, migf->filp);
+
+	return migf;
+}
+
+static struct file *
+xe_vfio_set_state(struct xe_vfio_pci_core_device *xe_vdev, u32 new)
+{
+	u32 cur = xe_vdev->mig_state;
+	int ret;
+
+	dev_dbg(xe_vdev_to_dev(xe_vdev),
+		"state: %s->%s\n", vfio_dev_state_str(cur), vfio_dev_state_str(new));
+
+	/*
+	 * "STOP" handling is reused for "RUNNING_P2P", as the device doesn't
+	 * have the capability to selectively block outgoing p2p DMA transfers.
+	 * While the device is allowing BAR accesses when the VF is stopped, it
+	 * is not processing any new workload requests, effectively stopping
+	 * any outgoing DMA transfers (not just p2p).
+	 * Any VRAM / MMIO accesses occurring during "RUNNING_P2P" are kept and
+	 * will be migrated to target VF during stop-copy.
+	 */
+	if (cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_RUNNING_P2P) {
+		ret = xe_sriov_vfio_suspend_device(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if ((cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_STOP) ||
+	    (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RUNNING_P2P))
+		return NULL;
+
+	if (cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_RUNNING) {
+		ret = xe_sriov_vfio_resume_device(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_STOP_COPY) {
+		struct xe_vfio_pci_migration_file *migf;
+
+		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_SAVE);
+		if (IS_ERR(migf)) {
+			ret = PTR_ERR(migf);
+			goto err;
+		}
+		get_file(migf->filp);
+
+		ret = xe_sriov_vfio_stop_copy_enter(xe_vdev->xe, xe_vdev->vfid);
+		if (ret) {
+			fput(migf->filp);
+			goto err;
+		}
+
+		return migf->filp;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP_COPY && new == VFIO_DEVICE_STATE_STOP) {
+		if (xe_vdev->migf) {
+			fput(xe_vdev->migf->filp);
+			xe_vfio_pci_disable_file(xe_vdev->migf);
+		}
+
+		ret = xe_sriov_vfio_stop_copy_exit(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RESUMING) {
+		struct xe_vfio_pci_migration_file *migf;
+
+		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_RESUME);
+		if (IS_ERR(migf)) {
+			ret = PTR_ERR(migf);
+			goto err;
+		}
+		get_file(migf->filp);
+
+		ret = xe_sriov_vfio_resume_data_enter(xe_vdev->xe, xe_vdev->vfid);
+		if (ret) {
+			fput(migf->filp);
+			goto err;
+		}
+
+		return migf->filp;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_RESUMING && new == VFIO_DEVICE_STATE_STOP) {
+		if (xe_vdev->migf) {
+			fput(xe_vdev->migf->filp);
+			xe_vfio_pci_disable_file(xe_vdev->migf);
+		}
+
+		ret = xe_sriov_vfio_resume_data_exit(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	WARN(true, "Unknown state transition %d->%d", cur, new);
+	return ERR_PTR(-EINVAL);
+
+err:
+	dev_dbg(xe_vdev_to_dev(xe_vdev),
+		"Failed to transition state: %s->%s err=%d\n",
+		vfio_dev_state_str(cur), vfio_dev_state_str(new), ret);
+	return ERR_PTR(ret);
+}
+
+static struct file *
+xe_vfio_pci_set_device_state(struct vfio_device *core_vdev,
+			     enum vfio_device_mig_state new_state)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+	enum vfio_device_mig_state next_state;
+	struct file *f = NULL;
+	int ret;
+
+	xe_vfio_pci_state_mutex_lock(xe_vdev);
+	while (new_state != xe_vdev->mig_state) {
+		ret = vfio_mig_get_next_state(core_vdev, xe_vdev->mig_state,
+					      new_state, &next_state);
+		if (ret) {
+			xe_sriov_vfio_error(xe_vdev->xe, xe_vdev->vfid);
+			f = ERR_PTR(ret);
+			break;
+		}
+		f = xe_vfio_set_state(xe_vdev, next_state);
+		if (IS_ERR(f))
+			break;
+
+		xe_vdev->mig_state = next_state;
+
+		/* Multiple state transitions with non-NULL file in the middle */
+		if (f && new_state != xe_vdev->mig_state) {
+			fput(f);
+			f = ERR_PTR(-EINVAL);
+			break;
+		}
+	}
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	return f;
+}
+
+static int xe_vfio_pci_get_device_state(struct vfio_device *core_vdev,
+					enum vfio_device_mig_state *curr_state)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_state_mutex_lock(xe_vdev);
+	*curr_state = xe_vdev->mig_state;
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	return 0;
+}
+
+static int xe_vfio_pci_get_data_size(struct vfio_device *vdev,
+				     unsigned long *stop_copy_length)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_state_mutex_lock(xe_vdev);
+	*stop_copy_length = xe_sriov_vfio_stop_copy_size(xe_vdev->xe, xe_vdev->vfid);
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	return 0;
+}
+
+static const struct vfio_migration_ops xe_vfio_pci_migration_ops = {
+	.migration_set_state = xe_vfio_pci_set_device_state,
+	.migration_get_state = xe_vfio_pci_get_device_state,
+	.migration_get_data_size = xe_vfio_pci_get_data_size,
+};
+
+static void xe_vfio_pci_migration_init(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	struct vfio_device *core_vdev = &xe_vdev->core_device.vdev;
+	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
+	struct xe_device *xe = xe_sriov_vfio_get_xe_device(pdev);
+	int ret;
+
+	if (!xe)
+		return;
+	if (!xe_sriov_vfio_migration_supported(xe))
+		return;
+
+	ret = pci_iov_vf_id(pdev);
+	if (ret < 0)
+		return;
+
+	mutex_init(&xe_vdev->state_mutex);
+	spin_lock_init(&xe_vdev->reset_lock);
+
+	/* Xe HW/FW components use vfid indexing starting from 1 */
+	xe_vdev->vfid = ret + 1;
+	xe_vdev->xe = xe;
+	xe_vdev->migrate_cap = true;
+
+	core_vdev->migration_flags = VFIO_MIGRATION_STOP_COPY | VFIO_MIGRATION_P2P;
+	core_vdev->mig_ops = &xe_vfio_pci_migration_ops;
+}
+
+static void xe_vfio_pci_migration_fini(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	if (!xe_vdev->migrate_cap)
+		return;
+
+	mutex_destroy(&xe_vdev->state_mutex);
+}
+
+static int xe_vfio_pci_init_dev(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_migration_init(xe_vdev);
+
+	return vfio_pci_core_init_dev(core_vdev);
+}
+
+static void xe_vfio_pci_release_dev(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_migration_fini(xe_vdev);
+}
+
+static const struct vfio_device_ops xe_vfio_pci_ops = {
+	.name = "xe-vfio-pci",
+	.init = xe_vfio_pci_init_dev,
+	.release = xe_vfio_pci_release_dev,
+	.open_device = xe_vfio_pci_open_device,
+	.close_device = vfio_pci_core_close_device,
+	.ioctl = vfio_pci_core_ioctl,
+	.device_feature = vfio_pci_core_ioctl_feature,
+	.read = vfio_pci_core_read,
+	.write = vfio_pci_core_write,
+	.mmap = vfio_pci_core_mmap,
+	.request = vfio_pci_core_request,
+	.match = vfio_pci_core_match,
+	.match_token_uuid = vfio_pci_core_match_token_uuid,
+	.bind_iommufd = vfio_iommufd_physical_bind,
+	.unbind_iommufd = vfio_iommufd_physical_unbind,
+	.attach_ioas = vfio_iommufd_physical_attach_ioas,
+	.detach_ioas = vfio_iommufd_physical_detach_ioas,
+};
+
+static int xe_vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct xe_vfio_pci_core_device *xe_vdev;
+	int ret;
+
+	xe_vdev = vfio_alloc_device(xe_vfio_pci_core_device, core_device.vdev, &pdev->dev,
+				    &xe_vfio_pci_ops);
+	if (IS_ERR(xe_vdev))
+		return PTR_ERR(xe_vdev);
+
+	dev_set_drvdata(&pdev->dev, &xe_vdev->core_device);
+
+	ret = vfio_pci_core_register_device(&xe_vdev->core_device);
+	if (ret) {
+		vfio_put_device(&xe_vdev->core_device.vdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void xe_vfio_pci_remove(struct pci_dev *pdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
+
+	vfio_pci_core_unregister_device(&xe_vdev->core_device);
+	vfio_put_device(&xe_vdev->core_device.vdev);
+}
+
+static const struct pci_device_id xe_vfio_pci_table[] = {
+	INTEL_PTL_IDS(INTEL_VGA_VFIO_DEVICE, NULL),
+	INTEL_WCL_IDS(INTEL_VGA_VFIO_DEVICE, NULL),
+	INTEL_BMG_IDS(INTEL_VGA_VFIO_DEVICE, NULL),
+	{}
+};
+MODULE_DEVICE_TABLE(pci, xe_vfio_pci_table);
+
+static struct pci_driver xe_vfio_pci_driver = {
+	.name = "xe-vfio-pci",
+	.id_table = xe_vfio_pci_table,
+	.probe = xe_vfio_pci_probe,
+	.remove = xe_vfio_pci_remove,
+	.err_handler = &xe_vfio_pci_err_handlers,
+	.driver_managed_dma = true,
+};
+module_pci_driver(xe_vfio_pci_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Michał Winiarski <michal.winiarski@intel.com>");
+MODULE_DESCRIPTION("VFIO PCI driver with migration support for Intel Graphics");
-- 
2.50.1

