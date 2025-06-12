Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D618AD6F94
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 13:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F7210E7E6;
	Thu, 12 Jun 2025 11:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrLRTfy9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A514C10E7E5;
 Thu, 12 Jun 2025 11:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749729283; x=1781265283;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zkdm60vVT3oRHZpZ6KfxoJZmpCxfChgGPXQhj44k9xc=;
 b=KrLRTfy9taejyVtq8g/TacHv9/XmoqHPq73RgOSLddZjv1Zse9FTrZ99
 ul/ZbDDxZ+2LS0d09bKa1f90LcMoCmYexKzjc70aqxMKv/gqH6Cy5Zsf3
 68CUnjp+Gno756zL9ffHponkHZU1Jj7uqj0vYmGiXaFrsvuC3t6tUJWe/
 S0h6viHp9h+MJUt82rtFJjXVRr6HgR2xsHRxsPT2rZxHlUSMW6akI/jDL
 bHJ3r1pd40V577QmnybPdA6C9acx/lnijfw4L/KlQ3AaAnwCGJSdu7kqv
 BaNnDXTvta3M+rV3OofxPumvNNSweZjc5YB+7ZSCxxZ5M7Bvxqlk6q7Bm w==;
X-CSE-ConnectionGUID: dj13uDoXQcWHP5CuBefCUA==
X-CSE-MsgGUID: MtbqjAHRQ6eR6YXGzYaDpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="77306675"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="77306675"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:54:42 -0700
X-CSE-ConnectionGUID: j/ObEkgoS2unO3Q0JjkD0A==
X-CSE-MsgGUID: nbHg56LCTAyCnSTPLoMHuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="148051551"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:54:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 04:54:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 04:54:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.64)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 04:54:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghbsqRhEztPUNBp5LSVFTuQ2cMb4Xn0Ks6rejWtC5FqsqytRUT6a+7G9970QNwnm/aGVwT6pyX9d/E+LuRFodC03xx6Xis1xldpT1pZsHrChdCLW0ni8B10EF8skXWaUIky+7QSlIc4HQLvqemMNN3kNu4TiiyjmSYsb2rF+8Xmq6JX+VvXieLBb9sl3g1Xem6JfuUMfHIZmJBCR+X8aYGGqZHDM4YW00kGy0zXOPYl5hinUfU7Z9oxpYxSY8CoVz/SMwFtkOKgM3Ad0cWM5KWFqKEUraU5EAIcbd5mfBULtreyGkp+U17aP4pKjkbUU9d2L3Bh2rkc3CZc3KY/cjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zkdm60vVT3oRHZpZ6KfxoJZmpCxfChgGPXQhj44k9xc=;
 b=EVLEm16PvNJq233d5VYqLPBJRKJUUX/fW+NHGE8BAAGMp9Y+LOh1Y7XRa+6cGTA42GBJ6u3RbsRiA6bg82M1IAcrrswL1weCcE/z0wMbzFHSUQXNK4p0jZUmIL/3kPXxv7GlP/hiRdMnH5v/2N/ke36k12r1xwNeH6kCIaAdCMUeifq5KXU2Cqrly0JSs6sWVOlnwfx9VbDJ6k5GPOm3Wu+IKesP9Ga5Mko2SB9TRmVUuK8L+0gB3QNt5rHbV3jfJFx6wt51CvFHtZX4BjijoUrBh3Px+X5AS/OynRjXX0ppJj6uMusSHzftOisvfJX3kLoiSHnra49gb2TuJiiKoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH0PR11MB5805.namprd11.prod.outlook.com (2603:10b6:510:14a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 11:54:38 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 11:54:38 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v2 05/10] drm/xe/xe_late_bind_fw: Load late binding
 firmware
Thread-Topic: [PATCH v2 05/10] drm/xe/xe_late_bind_fw: Load late binding
 firmware
Thread-Index: AQHb1wv8UoaS/FsDB0a/fI2k4R4xBrP9HlEAgAJUobA=
Date: Thu, 12 Jun 2025 11:54:38 +0000
Message-ID: <CY5PR11MB63660D5FCB0F3694710EA975ED74A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
 <20250606175707.1403384-6-badal.nilawar@intel.com>
 <a51e1b65-dece-4ac4-808d-8749a1a21d8f@intel.com>
In-Reply-To: <a51e1b65-dece-4ac4-808d-8749a1a21d8f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH0PR11MB5805:EE_
x-ms-office365-filtering-correlation-id: 192807d8-123e-4cc4-494c-08dda9a7e8cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cjRrY3ozWXFhbTRVNDZXMzIxaFZ5T1BQZkJQQmtlWGpVUVRIRW9sRzRreDE2?=
 =?utf-8?B?NXF2YWRxdms5MSs0Q093RUxna0NmdHZ6emlSQ25WZEVvSGJBVGE1MmJvMFRW?=
 =?utf-8?B?RmdFcUdsblBnYWJ6MnNYZEszdm96S0N4Y2hjYk56bWlvZ1NENEI0RW9ERHVl?=
 =?utf-8?B?MFBLWlNrTjNRT2xjc3BXRWxBbi82Um0xeFQvWWwxKzJxeHdLYkpvWkRYQkVm?=
 =?utf-8?B?RjkzeG9nd0VmOFRHYWVGa1Z3L2V2K05mZXA5SlZhNWdFVEtnY2JOQklKd2Jp?=
 =?utf-8?B?aDBqUmZSVDNUbDdNQnQ3aDlLT1podnpSQmVQNE5hZkpxUTFETjZDMU5WWXRw?=
 =?utf-8?B?TDBQZGRWTlNLSnNmS1FMRE92aVNJSzY1VnROVlBYNFg1V2Y3YURqNUtXT3A0?=
 =?utf-8?B?SHJydzB0dm1GSTZXVkJ2aHRtY0toci95eGRSTHdGTWFKbWg1OFhVZzZpMTVm?=
 =?utf-8?B?eUtrOS9rWDR4YTdvbWk2NUtEQ0hTVjc1VW5SeXBmZHFQZnNKNnRzSW1uU29r?=
 =?utf-8?B?TURLbS9NWEdsc0dKS2x0eXJUTGExV2IwWmphdXREWUhoV2Y4Y3RyYm04eE04?=
 =?utf-8?B?bTQxTXlFKzd1K01wNWVRamNFNk1WUVNQK3lUcXk5eE5WdDl6Qkg5RERnQi9y?=
 =?utf-8?B?Q3M3N0lkakk2a0htOFNRTnJyTXhjWXlKK3BIeEJMWnJsRmh2SGk4aXNQbHdB?=
 =?utf-8?B?V001Y24yVFdtdWM4SWpVeXV4K3VnOFU5Nno5L24wZHZmYVNqbllsOW0rL1VF?=
 =?utf-8?B?L2RGZmJxeUJ6anRkS0U2dHJxMlgrR3BNSTlhUG9zaWs2dVowUmFYaENYUFpO?=
 =?utf-8?B?ajFSa3R5c1BUcW9wZngxbmQwV0U5enpiTGJOSVFhZ0J0WlVBWVZlbDFvSUly?=
 =?utf-8?B?VTF0cGR5cVBZTU1IckFGZkxld0NSM001QUtuWkhKQ1BTUzBGY1BWY0ZyWTNs?=
 =?utf-8?B?dHpNVS9WUUY2RkorUFd5ZnM5dHdGTlUxSmZacjZ6L0hKVkI4TXF0OVBIZFBD?=
 =?utf-8?B?MHJOMitnMlZWNElFRzd1WTFJT24wU2p0UXRYRVZNU21tUk9zK3BkWDR4NS9k?=
 =?utf-8?B?TjFWV1N2YktUL3BVWXZqVXM1RDIzTEtMZVpVZ0VJWDQ5UHNKMldlN2c5OWlT?=
 =?utf-8?B?cEdkdllmUzlQdXluOFpkOHIxd1JJZXNodjVQc1NzSG9MU2pQTjBlVFRVWkcz?=
 =?utf-8?B?Z2dOTU42MmJWYUNIVXA5bmpwQ3FkSWo2aFRnYTdDZmJTZnZ6WUs4WWJJL2tP?=
 =?utf-8?B?NE80czNWQU5IcXg1MHJ2YmlUM0ZFNmRtNks4U29nelhiMDQveTU0dFJOT3Ry?=
 =?utf-8?B?ak05OWMxSS9mRU82T3ZhaVBZN1VnV1ordXI2VTB2dEpaTWRlcWhROURMRzlV?=
 =?utf-8?B?WnVBVXVZQWx5cG9ZSVFMYjhlb1hzckhXS043OEQwRFEvcnF0TW5jYjNJenV2?=
 =?utf-8?B?N0JmamUyRVRVUlBDUjJzczAzOXc3REdTa3Y5YkNBNkNlcE04NXdJczN1anFZ?=
 =?utf-8?B?L3JSUGI3NHN2YUdEa0ZxY1kyMzJkZzdiejRwTlJnN3p1Y2E0aDU3UVQrTmpW?=
 =?utf-8?B?ekRhSkJjTVIxdEM3MTAxOGtaQmtMQ0swQXFqS29DcDFNYzdvUERIOFFmZGhi?=
 =?utf-8?B?M0NGcHUwd1d0UmNjNEdJMk5CMExEUURMSXZCeEFwTUxyb1dlMys5YmE4WTd3?=
 =?utf-8?B?d1oyeTE4RmdMWkw3dWZtSkcxNEZJQkhiUW1XTjd1aldBMWUyb3ROOHVSQ0dJ?=
 =?utf-8?B?aUJ5b1RFV2xtRkh1cTA1bElxMDc1aFZVQ1dQb3VmRXc2WXNneEF0Z2FNcUsr?=
 =?utf-8?B?KzJXa1QxSG9jV1lSeDNYZGR0RTlLN2k0WHhZSVJiL3dHZE9uTklHQ2c2dDJO?=
 =?utf-8?B?V2hsQ0VCT2tTODRxQ1QwOGRJKytGdWJteFQvS2FMbFBwQW0yWndlbSt3YjJQ?=
 =?utf-8?B?UmFyMDd1c2JZNW9IUHBwdlVxQzdidlNQZkVjZkFleElHUElPMmxPV1NPMktE?=
 =?utf-8?Q?sfq6qslIhI+x20TZRk2nxEWgr+GQGg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bitnNjRnZGhDKzVBTk5yMDBBaEhBNW5keURrUDR0ZTlrOTZ2TFMzTnp6K0x0?=
 =?utf-8?B?czBLcEh6TFlCeE5TcUJWU1o3cmZCQlpoOWQwQWlkVmFNMUc0REFRTjhXMVor?=
 =?utf-8?B?ZXUrdGxscE9LeVZWRVQ5OUdFZnpkK09RdWhsckFJNnZkQUV0WE5rWjlwaVN0?=
 =?utf-8?B?Q2FtMmJicFdkUmxQQ2xGeGpiaVo3SXRaeTlnbFM2VWlFWkh1a0RFVjIvalg0?=
 =?utf-8?B?dmRocXZ1bWVxZEdaTW9leGc1aWFrZ1dNeHRsTlBEL1VSSkp0cjhNdm1KdnBN?=
 =?utf-8?B?RGl1UWhKK3o0c2QwSEU3ZGdtNFJ1NDFsSmVFY2c4eDBOTGxmbHlNTWZUdWxv?=
 =?utf-8?B?WEVYTzNxK0pEckpndTA1TW5RUUVoVHpsV0lZTkdSaU1qNXdyRTFYTmdiWCtK?=
 =?utf-8?B?bTIrc0wwWlNnek9yc0ZBcTM4NFVWemFlbER4M0NoMm9BWHVtc3lha0xvUlZ4?=
 =?utf-8?B?SjVIK1kxeWIvZ2VZWlZiQmY4b1Y0Q3Vpb0dXU2U3dDlwZmNYWG00ZmdLQ2gv?=
 =?utf-8?B?ME9aQVI4U1FaVE5tbC94dVhjWUtpeUhabjBtampMUkwvZS9PSEU4ZWtKT0Zk?=
 =?utf-8?B?ZjY1dDVMRWJnT2VmWi9QLzlyTFlad2FSMG0xWkxFRDViM25EUkN0QjExQXNN?=
 =?utf-8?B?am01SE5kcElDK0p5T1FxeGRjUHNRVWtZa1BNOGt2VGVBWW5yYjdoUDN4VWUv?=
 =?utf-8?B?QkdUaEVySk0velNWUDFmNjM2YnZ0cXlMdnc4SWltcDN3L1hxcEsrWU96VGNR?=
 =?utf-8?B?aFYxc1J1dFVWMlo4WnI5NkYvL3ZvVXBMenV0K09tZHVUaHBHVysrbFJBVmhT?=
 =?utf-8?B?aUM1L2tERkV1VDZtb0tiNUJoV3lkdlRpVWZBZlAvaDM4UmRySFFDbGxOV29W?=
 =?utf-8?B?WWgxMEtseFRkK2VEbnNsenlNOUxlU1VEbDQxOTJodHRUWnpzdy8rQ1ZWUFVi?=
 =?utf-8?B?VjloRkYvcFhVVlVqU0lpV3M0bTNkdFBCVHdZWGdEY3c5NkprTGEzejN1NFF0?=
 =?utf-8?B?OHUxcnBnSGhmeUwwMmxFNzFWbGw3cVhOZ3p1R3BIaDU1LzdHVXV0ZUlRZVBQ?=
 =?utf-8?B?dkNzbmtWU0dSNUI5b0l4SUFnekRwdzFhQVF3bGRRaHBjZUlKVlBRMSt1eVdi?=
 =?utf-8?B?UG1MZDU5QWQ2cFdOWUNtZWhFWkM3M29JY0w4TFFKUkxvU2MrZVUyWlhMTWUr?=
 =?utf-8?B?V2NEczFMYjhVSm1CYWQ5anBaUUgwemdYTE1lVFF3K3JpTTFhVGRGcDR2SVN5?=
 =?utf-8?B?aGxJdkUvVW5xUEJKKzViZVozeVR4SjJkNUI4clRjTGFZNTZRT09FSHhlejdm?=
 =?utf-8?B?dTcrTmFlM2NTV28zSHM1Ylh5WGxMdVhsaDlLdXk4cEJFR28vcjlENk1BNmFB?=
 =?utf-8?B?SnZtUGVSWDJrY2tBbkdPRUdUM2x4RnJkbmIzZzRGVDlFa01pOWZCMllGazd4?=
 =?utf-8?B?QW84RE1uY0NESzhjRVZQSTdVVldFYm1vdGlJQ044bnZCQ3BpRUR4MDVkRzQ0?=
 =?utf-8?B?UExSb1U2L2hBQlorVjRMbm9yMTN6aVhGbEdxclhPNU52TlA2VWVaSm5RSTBw?=
 =?utf-8?B?MHl5RjlERlJ1RWJ0YTZoQ0ZRNE51WWZEOUdrTVFyazgycEduUUtScWQwc01X?=
 =?utf-8?B?NHNhKzRJS3AyVEZmTElLL2w2MkppaXlqSFJxdHdZMk9tMG11SnMwRDZKM29s?=
 =?utf-8?B?T0xscmczc1FzbHd2SjJPS09qSHFHOEJFL3JWVVh0VklPWk9Pd0VITCtVdEJm?=
 =?utf-8?B?MVBoL0ZnK3M3ZnBSZkdIT0lMdTNZU0FKYzVxalhIazVoK3JhWWpOUkJDMlZr?=
 =?utf-8?B?ejMvTHdSUXFLalhMZ0Y3UWN4VENVYXMzaTAvdzhMVUlhWGM5NndBVUkvRGpC?=
 =?utf-8?B?dWxIR05sL1pPSEVTRDRheWtvQ2xHWkFsMXNMRHlXbTNwSEppcGhoUEI0cTN3?=
 =?utf-8?B?YU4rNnpNdnRlb1FKczZXa0RsZ0RjZXM2aDQ3L2x1VTBLNEhDbjVadHB3VEJV?=
 =?utf-8?B?SENFaHNLRkkyMkY1NTUvalEwY0hibjlrdW4xNUhBemF2WDBZQ2VtN1ZMbnF6?=
 =?utf-8?B?Umk0MXhQV1M5UXdzdXRBMENQZFNtWGN3LzJuOUlyd05TalhaVVBydUdOY05r?=
 =?utf-8?B?aUM1S1ZJbUFwUHpaSVNVU2Fsd2d4T0VJdEdEa1ZheHdTK2FmZ2N6cHMzSmJq?=
 =?utf-8?B?bW1HSGxNdkNHeitzSnhoV0Y1V1Z1aTArMm94elVjL1o1aDlZV2NrTUlUcHRO?=
 =?utf-8?B?OUlLdURQM1Q5R2NPaVZaNkxtRDJ3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192807d8-123e-4cc4-494c-08dda9a7e8cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 11:54:38.6947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sm5MqBBsNWJPEH+0y8c0RUYbm++4mkzP1MjanzieNoBrGPs8DDi8R/6uHFnGMnsEPvD7cwNsMvARuOf4nFhtmFZSFHs0Cs5ICsaX5OxK6zY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5805
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA1LzEwXSBkcm0veGUveGVfbGF0ZV9iaW5kX2Z3OiBM
b2FkIGxhdGUgYmluZGluZw0KPiBmaXJtd2FyZQ0KPiANCj4gDQo+IA0KPiBPbiA2LzYvMjAyNSAx
MDo1NyBBTSwgQmFkYWwgTmlsYXdhciB3cm90ZToNCj4gPiBMb2FkIGxhdGUgYmluZGluZyBmaXJt
d2FyZQ0KPiA+DQo+ID4gdjI6DQo+ID4gICAtIHMvRUFHQUlOL0VCVVNZLw0KPiA+ICAgLSBGbHVz
aCB3b3JrZXIgaW4gc3VzcGVuZCBhbmQgZHJpdmVyIHVubG9hZCAoRGFuaWVsZSkNCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEJhZGFsIE5pbGF3YXIgPGJhZGFsLm5pbGF3YXJAaW50ZWwuY29tPg0K
PiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVfYmluZF9mdy5jICAgICAg
IHwgMTIxDQo+ICsrKysrKysrKysrKysrKysrKysrLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2xhdGVfYmluZF9mdy5oICAgICAgIHwgICAxICsNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9sYXRlX2JpbmRfZndfdHlwZXMuaCB8ICAgNSArDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQs
IDEyNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVfYmluZF9mdy5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2xhdGVfYmluZF9mdy5jDQo+ID4gaW5kZXggMDIzMWYzZGNmYzE4Li43ZmUzMDRjNTQz
NzQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVfYmluZF9mdy5j
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVfYmluZF9mdy5jDQo+ID4gQEAg
LTE2LDYgKzE2LDE2IEBADQo+ID4gICAjaW5jbHVkZSAieGVfbGF0ZV9iaW5kX2Z3LmgiDQo+ID4g
ICAjaW5jbHVkZSAieGVfcGNvZGUuaCINCj4gPiAgICNpbmNsdWRlICJ4ZV9wY29kZV9hcGkuaCIN
Cj4gPiArI2luY2x1ZGUgInhlX3BtLmgiDQo+ID4gKw0KPiA+ICsvKg0KPiA+ICsgKiBUaGUgY29t
cG9uZW50IHNob3VsZCBsb2FkIHF1aXRlIHF1aWNrbHkgaW4gbW9zdCBjYXNlcywgYnV0IGl0IGNv
dWxkIHRha2UNCj4gPiArICogYSBiaXQuIFVzaW5nIGEgdmVyeSBiaWcgdGltZW91dCBqdXN0IHRv
IGNvdmVyIHRoZSB3b3JzdCBjYXNlIHNjZW5hcmlvDQo+ID4gKyAqLw0KPiA+ICsjZGVmaW5lIExC
X0lOSVRfVElNRU9VVF9NUyAyMDAwMA0KPiA+ICsNCj4gPiArI2RlZmluZSBMQl9GV19MT0FEX1JF
VFJZX01BWENPVU5UIDQwDQo+ID4gKyNkZWZpbmUgTEJfRldfTE9BRF9SRVRSWV9QQVVTRV9NUyA1
MA0KPiANCj4gQXJlIHRob3NlIHJldHJ5IHZhbHVlcyBzcGVjJ2QgYW55d2hlcmU/IEZvciBHU0Mg
d2UgdXNlIHRob3NlIGJlY2F1c2UgdGhlDQo+IEdTQyBzcGVjcyBzYXkgdG8gcmV0cnkgaW4gNTBt
cyBpbnRlcnZhbHMgZm9yIHVwIHRvIDIgc2VjcyB0byBnaXZlIHRpbWUNCj4gZm9yIHRoZSBHU0Mg
dG8gZG8gcHJveHkgaGFuZGxpbmcuIERvZXMgaXQgbWFrZSBzZW5zZSB0byBkbyB0aGUgc2FtZSBp
bg0KPiB0aGlzIGNhc2UsIGdpdmVuIHRoYXQgdGhlcmUgaXMgbm8gcHJveHkgaW52b2x2ZWQ/DQo+
IA0KSGVyZSA1MG1zIGlzIHRvbyBzbWFsbCwgd2UgYXJlIHdhaXRpbmcgZm9yIG90aGVyIE9TIGNv
bXBvbmVudHMgdG8gcmVsZWFzZSBoYW5kbGUuDQpXZSB1c3VhbGx5IGhhdmUgMyB0aW1lcyAyIHNl
YyBpbiB1c2VyLXNwYWNlLCBidXQgaXQgaXMgdG9vIGJpZyBmb3Iga2VybmVsLA0KbGV0J3MgZG8g
MjAwbXMgc3RlcCB1cCB0byA2IHNlYy4NCg0KLSAtIA0KVGhhbmtzLA0KU2FzaGENCg==
