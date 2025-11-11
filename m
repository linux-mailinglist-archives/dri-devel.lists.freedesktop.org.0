Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D1FC4A331
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B5810E4CA;
	Tue, 11 Nov 2025 01:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YinWvLSa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9DC10E4A4;
 Tue, 11 Nov 2025 01:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823190; x=1794359190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hakZsE9fwmPwfr7aqIQ43lnMkM6PIxzwrv61fODzCSc=;
 b=YinWvLSaA4zfR+ZRxrQi0F+/yHaihwc+idB8x2lXuLW67r3Z5WHiiJzi
 zji5822P0fol83LLa08c+N1Qs/eJZQVPyU6+TA8qyJEKwRjiUFb8N2G2x
 0HzuwP9m6pjEXIsa8PsGtCr5juJjxbwl6tM5Jpan+hsm7NA5AH5Ej68xD
 szhVdxzl+0u0gyrMyv1LIuN6N1GpmhcOU21TuKmFeLDmdcVvjJnmk+5OM
 IDjbhfu+2HG/OOpA4kQ6U5ItdPz5r8iEu07Oa760bhmfTSS9670JbK8+G
 Dcgl8Qte9KxrNRA6mBNrmxX171pq7EHoivxf1evy1a+580R5DK731hqL0 A==;
X-CSE-ConnectionGUID: kZ8kgw6sQWGW4e+k59UDKA==
X-CSE-MsgGUID: 7doShlSpTgKMFNfh+U1Bkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="90351208"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="90351208"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:30 -0800
X-CSE-ConnectionGUID: nMAgWIpzRJ29UpUGI4AXPg==
X-CSE-MsgGUID: Izr1RY8qSYidIsC34F1OmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="193824724"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:29 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:29 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:06:29 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQdtAoTjaOoH5BjPz7raccy/qScL8n8DvjiCf/2h4mj96SU++1MW/qEaI43wDaKPP2wjOIMsLJ5mtNopnMvOpSlSWkgYUBCGiVI3vemhYWemzgddv5Cf2K4Qe+q7XGrRTXb1SWshUCDnxJqK7nIpUUuqOukRmH5WfCMmKS+dSXkG/ZOuBeU+WS3MPtsKm+kkOMyXmoiPtNpSXGSsygyDyIbMw/SzoH6AJRXTp+5Do51Kl1CPkDIARUjgiYO8Ha0EKdzSVaysAcrlH4VZfjV1NB7c2ASnq2mWED9Dq15XMUTuWgq5DI5NiaQgZO/LS8RuebbM+6UpstJB9VaaahY4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKnL5Ax2qahDfhjlNfy80qUTJCJ7K9jEbHDCdbIz/Jg=;
 b=FzTRZHlpIaOA3ZAs6NDp5UxONEuH2qVh0hKgRM7c6B8NR2uhEHSWXCN82a2gJc9Z1Jg1SqsJz78TacIvgVi8vWbZIfCyz/TAm1lJ3Eh6giKHc2/vHHPdjivnBVdL1DsGRikQHjrDt5eIN+zzUsxIAhDMX+uTbblT/UhN9p7BLZoXup0HLnU2YLdnmETRfeV+wIvIbrdta2fJjSslRfJ39L/OMkLJcgdrkk8S47lhSbJc8PX7hHaU2gEF/xQjeoHt1AyedknfFawchqiuAssP90fWSy/aqJ0S3iNSFL0if2MRMvsmgGCRE1lVnQQQ3swa0afI49/zBOo0IHrDd+z9rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 01:06:27 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:06:27 +0000
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
Subject: [PATCH v5 19/28] drm/xe/pf: Handle MMIO migration data as part of PF
 control
Date: Tue, 11 Nov 2025 02:04:30 +0100
Message-ID: <20251111010439.347045-20-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::23) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: bec2ac5f-7f4d-40e0-9a04-08de20be8a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlVTYWg4SlQ2WHp2ZHZuK1A3cmJSdjdPNkJjQ1hqNkZBUzFaZjNxQVkySVlD?=
 =?utf-8?B?T0dhcmNpNEMzOGJiSCtNOUQzV3Ewc2MzWnJKeFRLSlBuUTdLd0Z3QkpvdHhZ?=
 =?utf-8?B?LzVLUFpybHNENWxBTGN2a3NSVklyMHdRbFVHQ2NBUlNCN1lKTjdYbTlZVFk4?=
 =?utf-8?B?MzJZSjJiK3lhSUJMeFdWV040UU1vN2FVTXZKNnU1cWg0Q1N1a3dHUndOMXNw?=
 =?utf-8?B?L0FRSnlQbDhKQjZtaU9CN29YUHVaMFplNVVKOWFoeFk3SUVYZVBTZE1QdVBL?=
 =?utf-8?B?QVdGWVpLYmVEd1pFZFV5UDJmVzNEdTVyWTZ2d2N2SVN0b3N1RFlDbjE5R3VL?=
 =?utf-8?B?eCtidkdzQXRlM2Naa0Z2Z0RTYnZZbzYydkFhOWZ1Mnk3OGNBdmczS28zdTFX?=
 =?utf-8?B?MDM5aXVtQW8rNlpaaXo5azhCWkRQUEdRaERQWE1vWDVYb3podEh3MVRaZGVI?=
 =?utf-8?B?ekZIVjI5WS9TYXB5UFNaUlFBSkFicmNwK280dmZON3FaY0NBVHg2N2hQK25v?=
 =?utf-8?B?QmRWTzlMZ016S1FVMkJmYXoxZHYvOTZBYWd3STRUUDlXOWtlZy9ZaEs0UHoy?=
 =?utf-8?B?aEw4NHdqVGJ4aHJtVFlQOXg4NWtHUWZGVHM2Uk5HL1lxNWdmM0ZlaW1FL05n?=
 =?utf-8?B?eEREYVZSaksrR0R4UzN0UWhOSU1jUVBac2FNMnVCelp2TEpPSEVMWGFBd2p2?=
 =?utf-8?B?a3Q3QS9ZTlBrSzZ4R3pWNXo5OFlKMGh1Y05hUzI4ejF0U2ZXbjJLSDRVdmNw?=
 =?utf-8?B?cTBQTFB1eWdFS0NSQm5udzM2S2l5ZVpwRWwwUUpwNlZLcWNxK3J0UnRIQXM4?=
 =?utf-8?B?V1NjbEJ0elUzQVVXb0lQTWNxTnlEdjNZdEJwT3p5eWh3S0dabVZFOTZLRWt4?=
 =?utf-8?B?b0Z4aTRONU9jdGM1cEpmVjQ0NnA3TS9iYVozQWY2NG1LRXhEZ29LZFcvTjk4?=
 =?utf-8?B?eGNNQ0JDc0NTSHNwdWh1NDlxVTkwSGwzanJiaGNocHE1cHIrTUVzT1FRcnkr?=
 =?utf-8?B?YXc4UGV6bUhJYnBoaXdQK3BKN0tGOFZvYmNESU9xM0tsVkVpYzZSUkhBMGp5?=
 =?utf-8?B?T2wzR1hFU21JNWpZbm1UT1ZYRGpaT292SEZSYnB5dVQ4UXBBb09iNW1PMGFk?=
 =?utf-8?B?RW8yNXcxdUduK201ckZjYW1rZ1AxdDZ6V0lJL25mNmJqeVprVXgwbEt4YTdD?=
 =?utf-8?B?SWZxTEQrVjFTL0JPRjNTOGg3VjRTeWZNcVNRcWRWeWVkaERhQXJkL0JFak1K?=
 =?utf-8?B?eUNDdzhGQ0YrU2o4NkpzTHhyeGxMQWpYdXd1dFFvYVlMYWhrQVU1cXRNQXBH?=
 =?utf-8?B?MGFpRlFzUnpDUzBwWXR3Z2lCaXJhYWsxdjZ0d2ROYTMrZ212OExZNG9tQ2lS?=
 =?utf-8?B?R29jcmc5UEhLcVJPajFLQStoWHVGSDI0TXBxcmZMU2ZqMDIvZmNBYTZpTVBK?=
 =?utf-8?B?emw5NWxwNlBCR0hiR2M2YWcxODZ5cDJWK0wzUlovQ3FzTTFwSGFpV0lpclJU?=
 =?utf-8?B?UjhFakZtL1pxaStHa1pUYzdZcG5IM1h4WnBpbCsya3ZDNWlYZTlPS3l0eDQz?=
 =?utf-8?B?SE1JK1h2YzdHdDBMVGdxc1ZGeXRNdW1zd2p5TkpTbWFreWt6UVp5cEhZQ0ww?=
 =?utf-8?B?aDhBbGdSaGRRNFpHY2ticDh6aDd0dGhNYjlJTXEyekFUa2FkMS8yZktGMzJM?=
 =?utf-8?B?dXAzMkM2aUE1a0VhR29nTmFCMXRwOE1DT0YyVFl0R0E3dlJRVUh0R29ZNGJG?=
 =?utf-8?B?SWFQOUN2MDEzZ0JIS0cvcWNXL3hpYWJYUzUvTjZGZlJadGZPTFR0TWNZWnFK?=
 =?utf-8?B?bGxsdXMvR0ZRTXVlVUQ4bnFGK0hGcW5CK2p1R1Z3a1dTNjRnQTcrajdRV29s?=
 =?utf-8?B?VE5EcW4xb0pMRFArOFkwODFJMHVHczI2aW9ML3pSVWxlaTlTTmFqbEFqcWcy?=
 =?utf-8?B?ZnpaaVNBWDZmS09CYUVEYldqVStGY0ozdDlXQXhNWTVBUmlaRWxyOTJKMFRO?=
 =?utf-8?Q?/KpRoWSQ8M/xVSGAamfxCbezuqMjaI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z09OZGFJaGRNRkxmVW9uNTJVYjdPQ1k2WFNpZzZyekZKOVA1QmFleEt3Qlhu?=
 =?utf-8?B?eENRRURpVS9hUlkzNzB0R1hXNG95K3NxREM5Zjh3ZUlpZFhBdnM4MTRIQzdJ?=
 =?utf-8?B?L05vZk04MzJBWS9kVVBCNHYrdGFSaFpqMWtmTlg0UEhRZUoyNjdiNTFDd2pz?=
 =?utf-8?B?b2VZMndHb01SQTZpWVVIOUNZZUZ6Wmx2S2dTZUdiK0JocVFYeHBXS1hVUHBM?=
 =?utf-8?B?SkgxaUZiR2R1Ti9qWmFjSFhaUHFCNW1tOUwrUkg5ald5Z3BzTlV3Qit5R2tS?=
 =?utf-8?B?R2dsU0xCRlFmaUFwNlF1VGd5SStPS3NPZWFyQnQ3SldYNG1EdlFkRU9wZUMv?=
 =?utf-8?B?emdVcEFBSTRubGFUMWNDbjBkSWhXSGhVU0dJUlRlK3p0ZlhjVjlPMEJQSXdv?=
 =?utf-8?B?clhMZTFxZGlPZkpXWHU4RW1rSU5UUFBwc3hJa0RSVW45R2ZHWHJDZzNPMUph?=
 =?utf-8?B?bUdrNGpBeUcwN2xEYWViV0d5ai9UVDRJRURkdDA2TVpjaWowNkY5aWkvVlY0?=
 =?utf-8?B?VEJiRk05YlI2RGpCMXJXTk05NHRGQ1FTRWk3c2ZZYUh0bUpxNnVhWGNiaHc0?=
 =?utf-8?B?RmtKcTVRTXlQcHRNQ3RvQUdON0QyODUyQlhZZXNTaGJYS2Z1Vm1rb0MwQmgv?=
 =?utf-8?B?aldLaW9sNE5BTVRxSzJFVXVmQlBwbm03U0p4MWRrbzVDZ3gzb1VrQzZmRTdq?=
 =?utf-8?B?U1NwZWJ6WG1IY3NaQ0hYdURKZ29ucXVTbTR0dWtIUHhSTENRK1k2UHMybjVZ?=
 =?utf-8?B?R09vUEVGZGdvZC9Sd3ZBR1hhNHBmQk1zZHdQZnd0TGkrQ1d1VzNoQWt2MkZr?=
 =?utf-8?B?UlZoaTByZk5pUDhyZVdGajZZakNENktHVWUyenpEYUpSS0JIM0ttbGJKTVQ3?=
 =?utf-8?B?OE1CTzNseGw1SFdneThhdmxaSmtTM21EemszZUlncDJWMW1GMjdJd1hjUnpL?=
 =?utf-8?B?Y0dtL0w1ZUQvNEZEd1N6VCt4SFJKZlBBbGlSeDFEangxbjdNSE03TmJVQytP?=
 =?utf-8?B?a1FhNHBNY1RxQUVGUDVKSCt1UU8yZDB3Y1VMVUZDOWkzZjJ3VVVMdlNrLzE0?=
 =?utf-8?B?dUJaNWo4SWxxTUZrZnVNUzNlbm1DSVhBOVdvbDRTWWVRbkFLTStxZmE0RXp3?=
 =?utf-8?B?VWhxOVIzR2ZLeGNJRGRhelZhNCtOcThvbjQ0eCtzVi8zVUxraHA2ajBtTFA5?=
 =?utf-8?B?MnBkMklZaGtVb3JtNWZqUkVVdStXZjNTaHVXdmZDUi9zYmlGZlB2WUhycVZG?=
 =?utf-8?B?YnkvaXY3ZHBhNFNvOEUvcEh2ZHNaUVZGTjFDaHZCUWxDd2U1bitsVWRzQWZQ?=
 =?utf-8?B?VDI4QmxSd1VVQjAwMkpUcFI4a0s1cmh1ZVZOV2R3T2NSVzNlL05Ic2grcUUx?=
 =?utf-8?B?RzhjNUw5QkdOOXpFSkRqdE5BeDVzUUlVcjFRWGhaOWpCL1BNejNiWUdKdXZW?=
 =?utf-8?B?NzhVb1NMdjFLYzFDMmR6MVNBeitENHplMTY5UzhoQzF0ZUR4Qkd6T2RQK2wy?=
 =?utf-8?B?Z1RHdXIydVFJdEJtNW1mSzM4NGxRb2tRSVFqU2JidTNaNGJVVmVMTlNvVU9V?=
 =?utf-8?B?aWNobHY0alpsNTJvVlpIM0VnUUFiR2NIODhIZVduaU9kUml5azFyY1dKWENz?=
 =?utf-8?B?ZDhoeW1JQnluZDF1TmQ0amR0S3VkcDQxZm5Dd1M3L2QySHpTMGV0Tk5Dc1Vi?=
 =?utf-8?B?MnMvTE9nMHV6WUdtUHVvS1NPT1FRcmwvZ3dPZnM0UC9Nd2Exa1BRakwva2Vp?=
 =?utf-8?B?ay9nVXRrL2VRU2NEdlRPbFk1MVVaK3hIUjNaemxWYUN5dTZMaWlMRS85WFM4?=
 =?utf-8?B?dDRvT0UrYzcwTzFoYTdGZjdINGJ2RTExamh3VzFYeWRYQVBZL1hEd3ZzTDJ2?=
 =?utf-8?B?QUZnaVRPUWZEeDhBZSthaURtb2pjY1F5R1hVbXZaTE5lT1p6QXgwMGxDM3M0?=
 =?utf-8?B?LzNIR2NCVmlYOHhqSkxQSmtwSndYL2pNMEJ3T3NYcFdYcTh2TG5vS1VPdmla?=
 =?utf-8?B?SmxWSE9XdnprcEV6eXVqYjE3Q0syQUkrS3RqVmlvdjN4SkxLN3o2SkdiMGRZ?=
 =?utf-8?B?V21hUTFRTHY5T1ZTakxmRG9lN1JYTHMrUjE1YjJuMDVFNnZLdytOcjhvWENM?=
 =?utf-8?B?SXlTMDQwZ2Mzdnp4WGJFRFFBcDQ5U21NWGtmSjB3YjJRaTQ3YVpYdE90NU16?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bec2ac5f-7f4d-40e0-9a04-08de20be8a80
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:06:27.4137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gesZLHLPecC9xyLeAfLmwwzxCLCevMyPlLpZjZYFOHSv/pUHcZqL5wIQ2CSAmVQDZNqNlTrpZtqa84LsbhhGlyaJNNYhchU1R5ABT4LZsEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
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

Implement the helpers and use them for save and restore of MMIO
migration data in stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  15 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 156 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   3 +
 3 files changed, 174 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 16524bc18b1b2..25b77007767d5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -880,6 +880,18 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 		return -EAGAIN;
 	}
 
+	if (xe_gt_sriov_pf_migration_save_data_pending(gt, vfid,
+						       XE_SRIOV_PACKET_TYPE_MMIO)) {
+		ret = xe_gt_sriov_pf_migration_mmio_save(gt, vfid);
+		if (ret)
+			return ret;
+
+		xe_gt_sriov_pf_migration_save_data_complete(gt, vfid,
+							    XE_SRIOV_PACKET_TYPE_MMIO);
+
+		return -EAGAIN;
+	}
+
 	return 0;
 }
 
@@ -1112,6 +1124,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 	case XE_SRIOV_PACKET_TYPE_GGTT:
 		ret = xe_gt_sriov_pf_migration_ggtt_restore(gt, vfid, data);
 		break;
+	case XE_SRIOV_PACKET_TYPE_MMIO:
+		ret = xe_gt_sriov_pf_migration_mmio_restore(gt, vfid, data);
+		break;
 	case XE_SRIOV_PACKET_TYPE_GUC:
 		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 3a6c2008ff96d..31c7f207ac5bd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -5,10 +5,13 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_guc_regs.h"
+
 #include "abi/guc_actions_sriov_abi.h"
 #include "xe_bo.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
@@ -16,6 +19,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
+#include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_sriov_packet.h"
 #include "xe_sriov_packet_types.h"
@@ -356,6 +360,148 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 	return pf_restore_vf_guc_state(gt, vfid, data);
 }
 
+static ssize_t pf_migration_mmio_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (xe_gt_is_media_type(gt))
+		return MED_VF_SW_FLAG_COUNT * sizeof(u32);
+	else
+		return VF_SW_FLAG_COUNT * sizeof(u32);
+}
+
+static int pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size)
+{
+	struct xe_mmio mmio;
+	u32 *regs = buf;
+	int n;
+
+	if (size != pf_migration_mmio_size(gt, vfid))
+		return -EINVAL;
+
+	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
+
+	if (xe_gt_is_media_type(gt))
+		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
+			regs[n] = xe_mmio_read32(&gt->mmio, MED_VF_SW_FLAG(n));
+	else
+		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
+			regs[n] = xe_mmio_read32(&gt->mmio, VF_SW_FLAG(n));
+
+	return 0;
+}
+
+static int pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
+				     const void *buf, size_t size)
+{
+	const u32 *regs = buf;
+	struct xe_mmio mmio;
+	int n;
+
+	if (size != pf_migration_mmio_size(gt, vfid))
+		return -EINVAL;
+
+	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
+
+	if (xe_gt_is_media_type(gt))
+		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
+			xe_mmio_write32(&gt->mmio, MED_VF_SW_FLAG(n), regs[n]);
+	else
+		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
+			xe_mmio_write32(&gt->mmio, VF_SW_FLAG(n), regs[n]);
+
+	return 0;
+}
+
+static int pf_save_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_sriov_packet *data;
+	size_t size;
+	int ret;
+
+	size = pf_migration_mmio_size(gt, vfid);
+	xe_gt_assert(gt, size);
+
+	data = xe_sriov_packet_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_packet_init(data, gt->tile->id, gt->info.id,
+				   XE_SRIOV_PACKET_TYPE_MMIO, 0, size);
+	if (ret)
+		goto fail;
+
+	ret = pf_migration_mmio_save(gt, vfid, data->vaddr, size);
+	if (ret)
+		goto fail;
+
+	pf_dump_mig_data(gt, vfid, data, "MMIO data save");
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	xe_sriov_packet_free(data);
+	xe_gt_sriov_err(gt, "Failed to save VF%u MMIO data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+static int pf_restore_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_packet *data)
+{
+	int ret;
+
+	pf_dump_mig_data(gt, vfid, data, "MMIO data restore");
+
+	ret = pf_migration_mmio_restore(gt, vfid, data->vaddr, data->hdr.size);
+	if (ret) {
+		xe_gt_sriov_err(gt, "Failed to restore VF%u MMIO data (%pe)\n",
+				vfid, ERR_PTR(ret));
+
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_mmio_save() - Save VF MMIO migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_save_vf_mmio_mig_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_mmio_restore() - Restore VF MMIO migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
+}
+
 /**
  * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
  * @gt: the &xe_gt
@@ -388,6 +534,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_packet_hdr);
 	total += size;
 
+	size = pf_migration_mmio_size(gt, vfid);
+	if (size < 0)
+		return size;
+	if (size > 0)
+		size += sizeof(struct xe_sriov_packet_hdr);
+	total += size;
+
 	return total;
 }
 
@@ -456,6 +609,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
 
 	if (pf_migration_ggtt_size(gt, vfid) > 0)
 		pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_GGTT);
+
+	xe_gt_assert(gt, pf_migration_mmio_size(gt, vfid) > 0);
+	pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_MMIO);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 2d221b6409b33..04b3ed0d2aa23 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -22,6 +22,9 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_packet *data);
+int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
-- 
2.51.2

