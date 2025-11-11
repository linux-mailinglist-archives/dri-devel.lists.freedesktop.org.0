Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A64C4A30A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B7010E464;
	Tue, 11 Nov 2025 01:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ddsvyi4j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E7E10E4BC;
 Tue, 11 Nov 2025 01:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823166; x=1794359166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lk+65UU4VBbKG1L0noYI3cutbxJHfo80+io+HruK/S8=;
 b=Ddsvyi4j3y8pkQHFAw0vj7O1xqxDcx20lY3oL7eHaFu8AUEvg7hYtb5N
 Z2KWUkrShzBOrSSmzV8l843jPYuvEX5LiGJsVTZ1rD+/UoYjaxzyUHzyG
 LFTtFO8ihzRUAhYwhJE5Y+EvC1cLc1+/oKG/9kjO8S7S+nI5XJfLComC5
 TGOaSLefWU8FAJUCG/EjfLGM7/3hUqWn2cNO2k+CxADaj2tGkjvnUoESd
 hIW/wCjChY2EFJOCUdxaAdi265l2ON9jFqWUbp/fmUCyKRkMTe3hLfIaC
 bgplZ1w2M8TN/W772aHX33IlVkBxrTacBBI9VG7aMHreMgNlYleP3A167 g==;
X-CSE-ConnectionGUID: JQNUAxn5QQaxPcUX7kszVw==
X-CSE-MsgGUID: OB0qht3kSa+rWWeL7uxiDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="67486671"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="67486671"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:05 -0800
X-CSE-ConnectionGUID: yY30LflvRt+AsOC31e8mhQ==
X-CSE-MsgGUID: 3n3VsxAmRumBHbraMOmmww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188657165"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:04 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:04 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:06:04 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.37)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHuFc9bGkh2g6dd/RqBJC+dc7mQJkgcxOsNsGfA4DOxH+p6dpeaCWQug47cf0TlOcuoKbjvLvmYiW4XEZrHtDCD3jJzEDqvK1aBvWacXt7V0uAQYFmyPXuOVlNF4Q2CFUrhQx7aoiaND5vQ8zugMD0nupEmRncRAG3ZUV3JNuOFX4ogtW/VvZDVhpmr/pYZP1ePJD+VTLvPopBN0augmArrMqnZE8V5PoqVktDCILFLCisFMAmPGlbL7ZIe55fgUqt3QztRzh6rD4IsYeNkoYlBY7/l5Vgnj4kGhbpZTv3Tl1GZahAvSz6WFfEEzf5qFfV6Nhdxq4X4Obg3LRVt7pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukotbZUfho/Muy5LocCZz85Giiw4AHi5xE9w0QXcURM=;
 b=BFXT0quo8ofDXaEYCIpHNGvmUgMqgxp8zlQtI1aPX6NMZfOvpraZLAb8DS3FN6eajg438REWLddZD7yrfHi5QP4o1pQzwu5Q+kk20cxLsHoUljX8ZZHGY6PBlDQxRGxEkOLvD3q3Oz5/6xnsdaBLfmSbm6dkD7SgdxUOiIjM/kJJ96aCLZeNroZVw95SrL/Yu6cPD7XiCMFYwISiK7ZXH3qqWehkKSoTsYIyR7VeoJxEH9YWwM4PT4ORoo+afozYvNbQ+1KhOk37mxrJeLPq6GETA+DEa6fwErzIvWKzRkJFyNM+vu5Qg+NSnpefxnjxFARgW84TDGe+b7/v2tsVmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:06:01 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:06:01 +0000
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
Subject: [PATCH v5 13/28] drm/xe/pf: Remove GuC migration data save/restore
 from GT debugfs
Date: Tue, 11 Nov 2025 02:04:24 +0100
Message-ID: <20251111010439.347045-14-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b1a762-5ac8-4f06-aeb2-08de20be7b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjRwM20rNEIxMllXQVFiNXZEZzdWS0JTVkQzRysyaHRoSkJnSW1HOU8rdkZn?=
 =?utf-8?B?ZjNRdmJNMEFFeUdxQUNqQ2ZrMmNVZy9zV0ljZ2tWVHRqZXNad096Mk1HcmlY?=
 =?utf-8?B?djh0anFQYWlObzBmTFppdWxNMnNvQ05rVEFLQ25qTTE0WHpTZHpvcnE3ZVY2?=
 =?utf-8?B?eHF2SVpuZW5EOTE5Tm4ydDJTcTQzaGRCMDJLUDRsWE1iUlN2cHhERnRtc054?=
 =?utf-8?B?Um9aUi9BODQ2ODVxcVNXekdEbUZ3VlZFVnZ1ekdtMjBlTVgzdXRGYklPYTAy?=
 =?utf-8?B?Qkw3Y1ZROEtkcVgzZERyNGIxc3ZxeW5IM0ZaY3MxYWFlbXNyU1NOcnZCK0tU?=
 =?utf-8?B?NzJWSi9FZzFKNmJXQkhZYURUNDZ6R05aZ1ZET1lWSDViTjJTc2pxdWxCek1C?=
 =?utf-8?B?WWZYVldBaVRKR1ZyTVVkT2Y4VVBDc3lkWDJ4UGFobCtaZlljT0kwMDYvaERW?=
 =?utf-8?B?YndmbEw4Qk80NTkvakdXaGZVU0xSTGVuMnVEOVovUE1jczF4WWdYRis4VzM0?=
 =?utf-8?B?T2Q2MEN5WVZQblFnSzRrblN5VFlYQVJidThKa1dKTGdFQ3FvRnZScjJxaWpS?=
 =?utf-8?B?eThxZmtlZDRaRVFLdWdOWmpPQmYvVEQ0dHVFaW1WNnF0RXVMeXB4U1d5Uzkv?=
 =?utf-8?B?RjcwdGVQd2dDSytZNXgxMHhyWFVVVEdyYUpsSEhWbGU5R1FHSEtQS213dVZn?=
 =?utf-8?B?bnZhTUV1TTZXT3NJOWtjRm1EUS8zMkZJL1VHQTBKYVlnZUQzZXlVc3NjQ2Uz?=
 =?utf-8?B?M3hhRkFPSFZjYk5yb1NCdWRmUXg2KzdVbU9KMit0Q2RoVDdraG0xTXJUdm0w?=
 =?utf-8?B?K0FicFZvcnlVZTBzNzloU2xBVjdwNncvY2N1eUo3OFZoVmlSWFNnTDYvOGY5?=
 =?utf-8?B?aUFaRUEzS0RzNFdsWXJMM2M3T1RxbmU4dC9RSFBSdld0Uk9KenRwUWpVT3dZ?=
 =?utf-8?B?RG1Namlsa2p4b1pOUTlvUDh1VG4xTGg2TlNjaTZWaC8xU0tXY1VSSEljWkdE?=
 =?utf-8?B?cjhva1phZG04eTIrKzJ2MTF1S3JOeC81aitFOTdtZGpHOEd6Wno1QnozcTV2?=
 =?utf-8?B?YUYwNWR3Z3ZpS1NXSFBQSCtNWjlTNUJjL0tRUUNLakdPbTN4ZWlLQTZxWkha?=
 =?utf-8?B?MTBsbkNPVTBaOVdxWFgzNGFoZ0xVbDFCUWRRdkg2dmJJRVdwUVkydGxCaUMw?=
 =?utf-8?B?d3U2UEtQRlRabEl4ZEVjY24wMGN4dWVnUmZxOFoyK2xhS01UYjJUNENTQ0Nl?=
 =?utf-8?B?UXc1TmhBWFBLZldPdjJPdGxuaUVPek9xU0NSWVcySnJvWEc4b00vZmFNQkNW?=
 =?utf-8?B?dC9IQUNreC9vajh0dWREUXhyNzZaQVIwb01xUnpxVTE0cXNjc29ydjY4bXpR?=
 =?utf-8?B?bE1oU29Ja0RyTkR3V3BkaHB5bEZYMWtJUE1NSVNMNW0zMXdEN25ZSm9NbHFM?=
 =?utf-8?B?UDhEZXRpWkVLRlJkaERaS0RXaC9NWDFrc1RvdE5JaUI3WFZrd0V5Mjh5N2M2?=
 =?utf-8?B?WFBhTFNHdGdPYmJ6RWFkQ0FhR3N6WTJpRUV4cEQya1ZFd2ppVERqY0wyYXdp?=
 =?utf-8?B?V2NSMVJvejZPRHdiUnRLbHI5Ym92MW1EUG5naXd1RWo1U09JVjdSNlhUVzJE?=
 =?utf-8?B?ZXN2dkFRZUpZNExkVU5jd0ZHOVRUM0duWjF2NnZPMHhCdjZoWlZtK2crMkM1?=
 =?utf-8?B?VnBMdEtyd0FGQWVkY1BtOVdTaDFQVndtc0hLdlJyNWpNQjA4YTRVK2lCbzFn?=
 =?utf-8?B?N3NZMk4wUjhXWnV2bDFjSm8vR1JEUjRNRlgxWmJWcWtYQnBuTUJ1T3FhNXhw?=
 =?utf-8?B?dFVEY3BCTnk1WU9FNVZVQTVUUktjMGdHOG9aRWlpWjVSbUYycHpZQzFPdnJZ?=
 =?utf-8?B?alNjaFlxWW9uS1duWWxyU1ZLbnVuMEdCdFdINElJQ2VQUEFVNG9FSlhYdkhX?=
 =?utf-8?B?UDVpMFZjTHprY2FCRHdGOTlWeUVWV09rbjFUOXplTHlFL29PbEkydmdma3V3?=
 =?utf-8?Q?1vN7SyMYr4U+38IUQaagMp3NTSdTfo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnpLajlwdDB5QWRrQ1NzdVZKaVY4djN3V2l3bmZwZTlCT1J5Zk9wekRYNG8z?=
 =?utf-8?B?QmNzQ0g5TUxnM1Nxb08rSzRZVGhqVktQNGp6ZEFNNW1DR0tVSEZDRnhHRXV5?=
 =?utf-8?B?YjZ0d3FUNS8zUFFVWWF3RENnc3dQSmM5dEhqQXRmNHZLejUxL3N5d1hIRjFW?=
 =?utf-8?B?Ym5xOG9DYlc0Q1hGeDBDdkZNNjR3Vy8wQmQ5WWxwRklBSit3TTl3STZDVExN?=
 =?utf-8?B?eVB3a0RXcEwrdjJURHlTVFdyQy95NndQQ3p6d29QeUZrZHRMcDQwWUpjQVBz?=
 =?utf-8?B?UjJ3aUErQU1XNVBXUkpqWUhNNG5UYko3WHV5TXZJUnZjWmtXREt1cGpUYzhO?=
 =?utf-8?B?aHZ3RVdhZmFMci9VdDR1Z29KbVQvNjc0QVBzVW82cXNVcEtuU0VWeVhFMm5Y?=
 =?utf-8?B?eFd6VGNYeUIrbjZRR2ZrNjd5R2hvWnRSMnRiZzZ5ckJyRmkzTC95dTdwMXpC?=
 =?utf-8?B?YUNaUS9STDdnQUJpL0k3U1Bwc3hqOFkvS2ZONUhKN3F3ZGhJSmsyWFJzaTJY?=
 =?utf-8?B?dUJMZy9NVFZOZmRsWXkrd2x3cXM3QzJDOEQzNzV2QUU0ZDJzV1p4WVZxV0Uw?=
 =?utf-8?B?YmNVTVFlRVZyendXUEVjaVRZT2Vpc0Y5cEJuN2dSV2ozNEZ3djd5UkZ0RXJC?=
 =?utf-8?B?ME15V3JMTW5hVEhEU0ZqWmNHaUhWdkdMMHBXTkxkallHa00vOU1XYU9RbFRU?=
 =?utf-8?B?cXpkRXlVTzRzZENYYjhjT1FnV3FjcUxHNW5UUEM5bnNDcDUxRmNFUHJhcFlh?=
 =?utf-8?B?NzVwKzFBMnZENjhuMGRUdHZESnJoZUxFRUxWR2N5M2VXU0RRNEZvcVphWngy?=
 =?utf-8?B?eWJSM1RwNkNhRzU3bUVlY3RTN1BESHJ1Z1lJREExZFU5V3VPQzlEdlhkdmpI?=
 =?utf-8?B?VDArcCtGVVBEVnMzQ3BONHpUZU56MTQwVWdxdVIxcy83b01oVUVnZVNZQUlG?=
 =?utf-8?B?bmpzYXZZd3FqTkRPdktzbVczK2FkK3orSkVvQ1Q2K0N5V29CZ3ZnMTNNVGsr?=
 =?utf-8?B?T1dadXUzZVNBZVlRT0t3azNqZ1Z2QTgwVXhlY0tpRThDNndsWm1TQnlZM3Bt?=
 =?utf-8?B?Y3ZLeUttWXc5b2xFQlN3a1RhM3VYMGVJYlB0TnVzOVA2RVo4ZWRGajhtdEcz?=
 =?utf-8?B?eU1iaEYvY0ZPRHJHNExKT3JGb3orYlhMaUpqRWV3Uy9xbnlCTkNOTlIrYjBy?=
 =?utf-8?B?SUNuSm5zNnZrWE51UUIvMnAxR2loUVBoWEphM3hKSFpDSlVqODBpalNxc05r?=
 =?utf-8?B?VHZBUFVzNy9RRTdWQWducUpqVWl5cFVtRXU5NHR2eGpDdUlZWjZvWW1tbDZa?=
 =?utf-8?B?SzBYSk81cEFZT2RqTitxZ0Nnc1I1TXZSdVVsTGROeG9JNTArdXRnZVpSaXFX?=
 =?utf-8?B?aFJwendSczFGb0RReU4xK2N3RWcvZUZHUFcwcjQ4U3JxeW5qQTZiWWVwWk94?=
 =?utf-8?B?NitrV1R1bHdJZmhHMjAwVnhRVnJuSUF5VzQzdGRHRXZkbFlPbWVtVXk1STRH?=
 =?utf-8?B?dVF4UlVtNTFDM0NlZ2VVSFk5QmhIRFJYS09Tb0xZVzdsaS9JVStsUis5UEt2?=
 =?utf-8?B?bHM3TTU4SnV1VnVTMFZMQkNyeVNVRG54V3ZFRTZUZjVKOVhZQ05WVFJIVkVZ?=
 =?utf-8?B?Tjh4Yit6dXJwOGNmbkx3RmZrRE5EVWtxQ21Nd3hNVUFPZHJCZENFTzhJZ2M2?=
 =?utf-8?B?VG1zaytWWVBJNkFxZWtOVldHMi9SVklYK3VyOVk4RjZyTWRYU3RkRWZjOGVi?=
 =?utf-8?B?aGlWcFFDeFRWRXdkaC8zUDVMUWVwbUdmNDNzY0RzckQxcWxnbGZlSXF4R2pE?=
 =?utf-8?B?eUQxaVBTWTYzeXJza0RGK3RSeWZWNmFVWXp2cERYTEoxQWZKVGxVeFU5U2Uw?=
 =?utf-8?B?QmJYdG1LY0E3Vng1dzhjZU5makJadFAwNXR6aCtqbUVnc21Vd2ljRGRxek5i?=
 =?utf-8?B?RDlvUCtvUis3bERpTGoyYU42UWpWcUM3LzNGa24xU0N0bzBpM2picWtEUnJx?=
 =?utf-8?B?c3pNQkk1dG5hQ1BsdVlTdndsSXB6L1FxZWIwczJXbmZJdXhzeWdicGI1dEYx?=
 =?utf-8?B?SWNVYzIvSnhOcktET09Dc0xhU3ZFUStMNFdXUlhZcjFBSFZrT1EyMHBLUDBi?=
 =?utf-8?B?blpTVUpCN1N5eXFQL1U3TWZ4Y1o4TUg2bVNVYVpJRWZWZkdVL2kxZTc0VXow?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b1a762-5ac8-4f06-aeb2-08de20be7b17
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:06:01.5278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/tomf4wKFIy+P1cI+JzDIyHFf3CKodmD/6kGZMyYAwUhgzSaEhnL6tuQBZYqraBMarNt4ZnW+j1ALkJjEgRTjhCwgANa7KX4HvSQeUGOcM=
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

In upcoming changes, SR-IOV VF migration data will be extended beyond
GuC data and exported to userspace using VFIO interface (with a
vendor-specific variant driver) and a device-level debugfs interface.
Remove the GT-level debugfs.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 47 ---------------------
 1 file changed, 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 838beb7f6327f..5278ea4fd6552 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -327,9 +327,6 @@ static const struct {
 	{ "stop", xe_gt_sriov_pf_control_stop_vf },
 	{ "pause", xe_gt_sriov_pf_control_pause_vf },
 	{ "resume", xe_gt_sriov_pf_control_resume_vf },
-#ifdef CONFIG_DRM_XE_DEBUG_SRIOV
-	{ "restore!", xe_gt_sriov_pf_migration_restore_guc_state },
-#endif
 };
 
 static ssize_t control_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
@@ -393,47 +390,6 @@ static const struct file_operations control_ops = {
 	.llseek		= default_llseek,
 };
 
-/*
- *      /sys/kernel/debug/dri/BDF/
- *      ├── sriov
- *      :   ├── vf1
- *          :   ├── tile0
- *              :   ├── gt0
- *                  :   ├── guc_state
- */
-
-static ssize_t guc_state_read(struct file *file, char __user *buf,
-			      size_t count, loff_t *pos)
-{
-	struct dentry *dent = file_dentry(file);
-	struct dentry *parent = dent->d_parent;
-	struct xe_gt *gt = extract_gt(parent);
-	unsigned int vfid = extract_vfid(parent);
-
-	return xe_gt_sriov_pf_migration_read_guc_state(gt, vfid, buf, count, pos);
-}
-
-static ssize_t guc_state_write(struct file *file, const char __user *buf,
-			       size_t count, loff_t *pos)
-{
-	struct dentry *dent = file_dentry(file);
-	struct dentry *parent = dent->d_parent;
-	struct xe_gt *gt = extract_gt(parent);
-	unsigned int vfid = extract_vfid(parent);
-
-	if (*pos)
-		return -EINVAL;
-
-	return xe_gt_sriov_pf_migration_write_guc_state(gt, vfid, buf, count);
-}
-
-static const struct file_operations guc_state_ops = {
-	.owner		= THIS_MODULE,
-	.read		= guc_state_read,
-	.write		= guc_state_write,
-	.llseek		= default_llseek,
-};
-
 /*
  *      /sys/kernel/debug/dri/BDF/
  *      ├── sriov
@@ -568,9 +524,6 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 
 		/* for testing/debugging purposes only! */
 		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-			debugfs_create_file("guc_state",
-					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
-					    dent, NULL, &guc_state_ops);
 			debugfs_create_file("config_blob",
 					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
 					    dent, NULL, &config_blob_ops);
-- 
2.51.2

