Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DE0959F79
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFE610E5F1;
	Wed, 21 Aug 2024 14:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmj/TTco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A2910E5F9;
 Wed, 21 Aug 2024 14:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724249767; x=1755785767;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=BJxxwPqsc+8m9+/JedXnuHHYwQDgxe9joxPZ215NTrs=;
 b=nmj/TTco/nnymQoPHncGhDqcTbuMrQ8YoJURW+6RiZWaOImpzidJ9FnY
 BZ6h2mxFK9Lk8fSoHjzoaqIizaZnIE6g1h0j72GtIhg4g/lDGwaPaFXZ+
 VQ1pFwXI3MPPTC15p0U/V1AhuYXy8K06CR/sYqv2GTSKCIGFljeyTJzb9
 l9k6r9h+P4iKLmu6qwkjeXDmeG9i0W2F7AUxkzwPE3qiaqGaQGiY/uBDP
 N/8slQcgueRtjmZRKu17S7XLV673OrwoWbwzkiIISkA0ceV70LOhE9cM1
 99hogOQg77w+iOrFPxQfMWgOHekEYCdvSEnI7KfD5JJZdcvZaWZwwqZy2 w==;
X-CSE-ConnectionGUID: 12n0mmPFScSj96PhakZzdg==
X-CSE-MsgGUID: vc5wD3HLSayQikkdfOpi+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22224127"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22224127"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:16:07 -0700
X-CSE-ConnectionGUID: 5GJWlreOTsWC+u3xzSaz0w==
X-CSE-MsgGUID: JT2NKs44Sa68yexA0og3jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61082578"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 07:16:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 07:16:06 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 07:16:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 07:16:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 07:16:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHyLhAKgSOG65X9WM5Y3qvKykdJeDlajfEXTjl92EMvf17g4EtCvyo1zUhQdzw/SrTSnLlLNhrncx+zXTY/XCz4DFg36jxcK7/8S/1O6mml/GxdMgDQeAQBV4GYp9fvZFFsRufMZACnK3XdJAKM7YyGXepfVGdbdOk4XCjAzOiK6KVqWBE74wW6F5YWmw56pDWJRrjep2WC0EkPWfPC7v4A4k3t8Nr0mNFJlHfBq5D50IJi2jGHwNak0dcpvBmpFaSC2YTl6MMiYvABwmMUaG+mQdZgGG9OqtWTZItRlOIJjONaTxP5ZThGq4rxlzZgCVBJe6wJBZKxN5BF8XH8pmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMiZawBjvYh5PafjjqVT7W3jIjlGKhxY6hSyAppQH50=;
 b=QAn0+HEZ75VfoZOMgqTSaVGPJNKkftVad1O0071Zlz+bcS+RvKyzdNDY0WWPW/i4kiDgWBDumAefLxdqFxQQbC96v/9tSmgtTekbdvKwgOfaVW2UsNz4Kex7b6Oh+wdoKTy/f1ioBpKygJZ8yitFVoz6gl3Vuf9oPFbgiE5xlVJh4QkjN0j31JwyZQhpAL8g7GZzGQ6aWNg3RFo5FYBXRp7T9P6tspZWdRpqke4mCJRfAS/lXwnv358jgJHSoFXISCLUlLA5hlfy3WlalY+jT+il/cK4cKnShbGeaAEReiRHXAjPsH6W0VelqjYEHOkCHT9U/PBSwg0eMWhk8n7akQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA3PR11MB7584.namprd11.prod.outlook.com (2603:10b6:806:305::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Wed, 21 Aug
 2024 14:16:04 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 14:16:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240821135750.102117-1-tzimmermann@suse.de>
References: <20240821135750.102117-1-tzimmermann@suse.de>
Subject: Re: [PATCH] drm/xe: Support 'nomodeset' kernel command-line option
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <lucas.demarchi@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>
Date: Wed, 21 Aug 2024 11:16:00 -0300
Message-ID: <172424976000.2071.18125280900868355577@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:303:b7::7) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA3PR11MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fcc01e6-ac73-4d96-2c9c-08dcc1ebcab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmRrNW1GdGNqVlhzcExGdFZ2NHphWUxaa0c5WHhEeDhCMy9lQmF6S1BnN0dr?=
 =?utf-8?B?d2hoa1ZoRkVSY2tqdEFqQkVNb1RobS95Z2x1R2Jta0hHRTIyei90bmVQZ3JY?=
 =?utf-8?B?eTdtMjR4TStKemhSM3JTL3J6UnZPTzVtMkhWQmV6RGJERUJ1MkpObFhYTDM0?=
 =?utf-8?B?WE9zZnIvK0FrcWVMQkNicExRbmNjeDRVNys4VnA2RE1zb2NaWE5GNVg1YTJn?=
 =?utf-8?B?WjRRMVFxbVZWekdRRmI2V2FFVVlJTWtNL0JNWks2VEE5YlV0ODdzMHZpak1i?=
 =?utf-8?B?UGN2R3ZSVmM5VlowTDczenZmVEtYaFowazdLVWlkZWZVZ3p6dnlUd290NnA2?=
 =?utf-8?B?MVlVV3d0Y2x4UllMaG1oaDNRa0tVN1B1cmRXOXA4MG00bWRHYVl2ZU1RMXVX?=
 =?utf-8?B?SWJZUXRNMGxDcjJaMHk2TTMrcnk2MTRsLzRwQnZBMmNmclJ3b0JNMGE0ZldS?=
 =?utf-8?B?Q0xFV1JiT3VFdi8vQ05weVMwUWg0ZE5XS3JTamplWFRTNXAzZDRES3B1c1NT?=
 =?utf-8?B?OXdKVXY1cVNDMFBrRDY5MW1UeXJkcmN4NzU0RlIxNFpDSm1LSzZCb0h3b1J6?=
 =?utf-8?B?d01kN3BHU0dwc1g5UVhVdC9jNWR0RTZKSEVYaFgwR29TQTBpSlpYMUprekUr?=
 =?utf-8?B?bVk5anBpWjE0QXBJVXNLN05teUdKNm5jeWdXOEFyS2lKbXFFL3JWSi9QaVR4?=
 =?utf-8?B?aG93M2I4MFJ3M0pCcmFab2NxM3I5Q09DUzB2bFhSZXdIKzVZVUdQVzVTRDJ5?=
 =?utf-8?B?ZHJJTmpVd0VRaXlkMHdVMDRpR3J4QW9EeWh2QnUvK3hGNm9uWUd0OVR0MWZU?=
 =?utf-8?B?ZXpjUWQ3K0RlSkdmNHd6Q3ducHVuUjRtVzgvNHpxbnBqUzgzYjRFbGRWWStS?=
 =?utf-8?B?bEFvMTdaK0ttUUhtZnF5cDJqeE9ZUTJWQ0xiOU43RDNQSG4yL0JEVTdpcSsv?=
 =?utf-8?B?clg1MVkwTkNVK1NqUlRZd3JOWmdMWGN2ZlZ2TjZxYzhXcFJjcGczM0RNcHBJ?=
 =?utf-8?B?TUtBOVJScFFMczFWRVNVVzc3enNyVXdIUTdaSkVjUVFKWjNTaXVURVJSM1dJ?=
 =?utf-8?B?SFJwN2VjN3N0U2ZlYmIyMWtQTzdBK0VnaEhIM3g4NUd0VmRseE4vL000Mmo1?=
 =?utf-8?B?by9oZ2haZVVsUzhidjdrNG80L2VRVEQ2b2xuTnlMd3FPWnJacFVhN25HSWgx?=
 =?utf-8?B?QXpncFdMTC9HZzJ0TlZZWU1ubW84dVlaT0tKZWN4Z1Fqb3ppc2t5WUcrU0g5?=
 =?utf-8?B?ZHN0NHBsUENQQ2hVM0xpcDd5K2V4c0RDdzVmOVJnZzh4MHVYOW1iQ0VuQ0V3?=
 =?utf-8?B?TzEvcCttWmNybVdFaVE1dzY5dVNBcTE4eFcydzlYUllxN2xJZXRGV1MxWFJZ?=
 =?utf-8?B?SXRLcHIyS0IzMGhNNFEvUWpNdnJsR3d1enN1Tm9lL1ZxelhYamltRWU4ZU41?=
 =?utf-8?B?WnkxS2lKZUdWSkZnNnNHYjVMVDNEZ0V5S0RrWFZEdzAzaEIzT0xyUlk5QVRH?=
 =?utf-8?B?ZTRhN25NM1VRMjRnYkw3L1prcXBQbVN5bzdOWVROcnlBN0xxVHlueEdtYmtO?=
 =?utf-8?B?dWhBTlFYYlI3eENncFlXU1llb0t1K0JISWhWbEhmR3pFN2taeDVraHVZSnpB?=
 =?utf-8?B?MFNVb1dYYXFZeW9oT2c5aUpnSXFDeGVhOG9CUTdGL2Z6dG03M2hZQ0dadC81?=
 =?utf-8?B?NjNleW85RFRlOHlFY3FSK1NkRldIa1R6cVdocW9admUwdXptOW5Ec3VHWVhH?=
 =?utf-8?B?dFFRYm5MZW51MFpISHZaems0c25IYmtNZTcrMGdLSitjOTZKWEhjendZQWpn?=
 =?utf-8?B?Ynpsajg4blFJNkQxK29udz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW5JZnhLWTJPVjhzQkFvK1JWNDljSVJSSjRldnloSEdKV0NwUTlLNVVVOWMv?=
 =?utf-8?B?aFBRMDdkZFBsMjRnQlZHb3NoNW02V0xNUFJiN1pGZEpiRlVTU2I0KzBJM0pj?=
 =?utf-8?B?RGRwM0VaSEhZTG1vRmpjRkV1MUJiTHAzN0FlTmFKK0VTT3BCNUJsUk92UlJz?=
 =?utf-8?B?amtZaFBRdFN6Z3ZGZGlvcFVGdGJzNjc4ZTFwT2hIai9iUlJIb3RBMkNKaHEr?=
 =?utf-8?B?MFR2UHN3OEZRUjdBZFJqN1g2c0JRWVJZWXRvb2FOejc5bnpNMUxmbzBzbEJN?=
 =?utf-8?B?ampNNmhuZ0hFYmd6cTBDdUVXVDg0bTY2Wll6V3ZqdzJBZ090ZG5Tam9GOWIz?=
 =?utf-8?B?U2NUeHdlUEVlRU1lQk5Xb0FIWkZNa25OVlh0dEE1b0phdTczTjlSSDI3ams0?=
 =?utf-8?B?bnpxWHZqTmNRLzlodXVDcnVBSUZKYi9kbnpNOTQ2U2d2cjRMZVV1NkpwRWNT?=
 =?utf-8?B?L0p0ZEUzK0ZJYUxVYnhzNmN6TUU5WUNnN1B5TytKVXlpbzVpR0VJaU1KQXBO?=
 =?utf-8?B?OTZxZ0RLdzROZXUySW02MHc3aW81elgzQkRXRnpZU2JRenNERlByOTFoWjBW?=
 =?utf-8?B?N3lqQk0rTURwTGRTUWRZalU1WWZJVGg0ZTNyVmc1cnJHV0ZKbjlLRk9DT1R2?=
 =?utf-8?B?bzJXYlp6WVhtU2pPSWk3S1QxVFlRYXo2MGJJcjNzeFRmQnlkdHcwTllqQ2NF?=
 =?utf-8?B?aVJVNDdSQ2NHUTB4Tm1EZ3JQOHY0UnU0M0h0WFFmMCtNUjFMdnRqY0JWUzhN?=
 =?utf-8?B?NHQ4WTM1RWx0Zm02bWNnRC9HaktjS0d1WHNOdXE5aWhkSUovOVBhdVpMWmZi?=
 =?utf-8?B?b0lieFJwQ3Z1TGUyNUN3bGZYK0l6T09LcFk3cDRwdUFiTEVFc3F6cEU4bjh0?=
 =?utf-8?B?Lys2R0tpMjRvRVZlSEIrMEhKRVMvNy9jeHBWV0p1S2QrbHRUeHVMWjVqc00r?=
 =?utf-8?B?S2hrT2JkK3ZPMkNQbmszVEQrcENZY0FaTTVSeVNJcXU5OVhZcjNBc1RNMGlP?=
 =?utf-8?B?Mi9QR01xaGFiMVFJR1hsczE1YmZLekJjeFlobDJobG5BazFuTzF6U0ZneWR1?=
 =?utf-8?B?aUxIQnB2cStaR2Qrb2dFREhvVDRNaUZDRVZ2WlJFNm1YdTFsM1VOOXR5Qy82?=
 =?utf-8?B?YmYyL09xa3B4NVB1SmZnKzZINGVMM0pZTFN0MTF1TWxCdE1ObTQyMWgvbk9H?=
 =?utf-8?B?d0RaZ2FOODIrNy9Vd29keVUrdkYyRkoyWWd4Vk5pNklCRUtYVEpsaFVsODdH?=
 =?utf-8?B?SDdudHlmcjJacGxoNlRGVHFSWTFMRmJzNElXdk5PMi9xWmc5aVEvMWlDalJx?=
 =?utf-8?B?NEUySkpvejZDSnc1RGxPcm5mdCtrRklRaFFzS0NtVkJpbnJIa0pVNER0R3V5?=
 =?utf-8?B?VC9ScFZKbGc3ZEFicU5DQXozOWRCVVlCdXNLa1A5TFB0L0g1NnYxa3FsWjF2?=
 =?utf-8?B?SXN1NG82dXkzc2c1bmFDaE1jZ2R1OXZqVW5idFU5cUNVMmtRMUJnYXh0VUNJ?=
 =?utf-8?B?SENJYnk0VWpGNXhac003RCtaTVhYbHdCUnFPQVhmZElFY3RzUzVNUXlYMXR6?=
 =?utf-8?B?dlJ3YUdFVUJiY2hxSTR1OG5lRVgvaGpZYWl3ODVsdnB4SlpPbHROUjdoQTJv?=
 =?utf-8?B?c2x2empvcFFlQkt5WVJtMVNtc2tDTVpONmJlSk9xdGlNK2xtL3Q1bDZvNER4?=
 =?utf-8?B?LzV1SDFCbmRrTFBwUzd2b0MxQ0YwSFBLV0pyVy91eHA3MWFnWlBvNzBSdGMr?=
 =?utf-8?B?Q2dNcDJ5dGYybU9RNnlVM3dmUnpFZG5VaVB6cjErNFlzQ1A0NXlNUThJOUZX?=
 =?utf-8?B?OHhXSGx2QVM1cWFRL2IyTmJDb01BZ2xHdjFqa1dBVk9ua1VrTnk4Wllxa1lo?=
 =?utf-8?B?SVEzWVJSTCtBdlV0ZzhUdm52TDRnbkthN1B0eHF5NkR4MkFRRWtDWk4vQkpl?=
 =?utf-8?B?OW16b1EvYnk3REsyM2VZaW54NDBQUUlVVmNqSVFyUHM3TlRzSUMyLytaWE00?=
 =?utf-8?B?ZUV5azhNYWowbnViSXBLQUFVYWNMSjQ4RmZDSURHdTN6UjhLMzNIVWlkdmRT?=
 =?utf-8?B?ZU9UeHdOZTNEdS8yd202L1hsSTVxby9vY2ZtSUExWjRSdjVaeFBqYTlyK0dv?=
 =?utf-8?B?MFJGNXJXem8reXEwV250TFVkZXZCUitURmg1ZGh4ZHpvZ2xHc0lkb0JSTnY4?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fcc01e6-ac73-4d96-2c9c-08dcc1ebcab1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 14:16:04.3024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2ypgzGJN/GTSJtdkI/rjKmFRw8qBTyUK4BaX6kF71Z9cE86uw1sv4bciByFiCQLMIbKCssYnwBpwFOQ/Rx2Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7584
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

Quoting Thomas Zimmermann (2024-08-21 10:56:59-03:00)
>Setting 'nomodeset' on the kernel command line disables all graphics
>drivers with modesetting capabilities; leaving only firmware drivers,
>such as simpledrm or efifb.
>
>Most DRM drivers automatically support 'nomodeset' via DRM's module
>helper macros. In xe, which uses regular module_init(), manually call
>drm_firmware_drivers_only() to test for 'nomodeset'. Do not register
>the driver if set.
>
>Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>---
> drivers/gpu/drm/xe/xe_module.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module=
.c
>index 923460119cec..60fb7dd26903 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -8,6 +8,8 @@
> #include <linux/init.h>
> #include <linux/module.h>
>=20
>+#include <drm/drm_module.h>
>+
> #include "xe_drv.h"
> #include "xe_hw_fence.h"
> #include "xe_pci.h"
>@@ -92,6 +94,9 @@ static int __init xe_init(void)
> {
>         int err, i;
>=20
>+        if (drm_firmware_drivers_only())
>+                return -ENODEV;
>+

Hm... But what if xe is to be used only for compute or render? Shouldn't
we handle this somewhere else?

Taking a quick look, xe_display_probe() might be a good candidate?

--
Gustavo Sousa

>         for (i =3D 0; i < ARRAY_SIZE(init_funcs); i++) {
>                 err =3D init_funcs[i].init();
>                 if (err) {
>--=20
>2.46.0
>
