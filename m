Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7247EB10C6F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 16:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CAD10E93F;
	Thu, 24 Jul 2025 14:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AyHq4EzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B03610E389;
 Thu, 24 Jul 2025 14:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753365606; x=1784901606;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+72AlpBZ7mcFHVEVdLbF36GG/Ce4BX94R9cF6azRf+w=;
 b=AyHq4EzETmJZKoCtJgMVQeh904kqZ+WpBERJS7JOOvbbLXA71yWOyGFl
 9Wlv2HanVa6/NVZWlbg9QqiHc2DaNd7RlNPeCYLwDNoxsBrKj6ePu3lrS
 hECU2tvQiWIOqczM445s3b3W/M80eZ7hpaC1pPC4ihQgcE+WpZTXbYwwf
 EINsU8nLXUFsXtD4rTF5m9p+HAcLfrghz4UXgYhX13U1nl2Td7lL3z3Q7
 OmhgvikQfDTVkKx0WpBfE+scBAUggSHAlb0qdROkyG5PpQHFXgU8Sorjc
 hIz+IHpdhq+rCdWsoXzvBLqp72TD25HxqKOzo3+LJTZlfWlUp/OZQRxO2 Q==;
X-CSE-ConnectionGUID: jMJ5kt4WQHKfKjb5Ea686w==
X-CSE-MsgGUID: jrZHFn9tR/KXg7bMqhSFnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73144223"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="73144223"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 07:00:05 -0700
X-CSE-ConnectionGUID: mUAY+0ZRT4eQh9NKucJToA==
X-CSE-MsgGUID: etZuYUShTHmFjtLB17sDnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160007223"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 07:00:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 07:00:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 07:00:04 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.81)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 07:00:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kf98G8ZD3kbyd8ZjCOxjG6dHO5CpbwVY3nTA7BuyKiSff6X/uZENIJE22v1a2C1H8LwjWUjkSABzG7oq36dQkNQAYEVpodRtCVSrMuXwgq/oHUiHYWlokxtIKFPQTqlN2F7FWtu00waWRrvWmnOZnEe1YByuZVfHcvQ0VjudVyktnF6Po4TAzZUx9ExuLZ0t5p+XYkmF/IAUxutdFOvK+5u3js4I3XcaOl09GZKzuU7Yn6DHhrmo0AwjwPVFFUJ6GmkZl5EsRLFB0wfKkfxrLZ5baxzJ6xTMRWelIElHIw/bbxw5sdjTpSUhLGHR5xhie1FGoaqy2Q7au6a9Kr4TcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+72AlpBZ7mcFHVEVdLbF36GG/Ce4BX94R9cF6azRf+w=;
 b=Jeg9aTBaYvYcYlSmQ2Ub23ZPZadBYpYJz5KPZqw6KGJvI85vhE4mvpGSVVei0hzwOcU4gj4quJ6zFmwq4ElT9WSENMkswzdFeWcSMmRmBBTjmJGFtJjeiJcVaPqhs3t6q8yQUQ827Nky7+KVzHV28LG2vijqp2YNW3SVftdOsTuOt0HhaWdpKTllt+yD3DcINoxemAPkT9Y6bg0yOhnj1fj8itQqUHfyMOklAZFe8+NU2x6P4LUtbCt3tQQE1tBQs3vuHO+d7thoDdg3ODpwVdZdcUqsi2N+VOiEPf2ZkDBhpP4obzkFGdBpLQUQahav8BLqQo01MNJ+ntTYoygljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by BL1PR11MB5237.namprd11.prod.outlook.com (2603:10b6:208:310::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 13:59:56 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%3]) with mapi id 15.20.8943.028; Thu, 24 Jul 2025
 13:59:56 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Xaver Hugl <xaver.hugl@gmail.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 00/10] Introduce drm sharpness property
Thread-Topic: [PATCH 00/10] Introduce drm sharpness property
Thread-Index: AQHb++YX8HJXdiVmDU+XBh8U+XyMFLRBTgBg
Date: Thu, 24 Jul 2025 13:59:56 +0000
Message-ID: <IA1PR11MB6467325FABCA5F4FFDAB4053E35EA@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20250519122644.3685679-1-nemesa.garg@intel.com>
 <CAFZQkGyRi310n967Mzq8qZ_DUTJeWx8tWks4XQAUxfVeOx65Rg@mail.gmail.com>
In-Reply-To: <CAFZQkGyRi310n967Mzq8qZ_DUTJeWx8tWks4XQAUxfVeOx65Rg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|BL1PR11MB5237:EE_
x-ms-office365-filtering-correlation-id: f9016a3a-5026-4033-ee8b-08ddcaba5f31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MDRJaTk2KzFCVUhNRy9STXVNdnJXeFE3RlVpUm5kaEgrOFl1SHNsQ3pGUDZt?=
 =?utf-8?B?OGJQbEZUcXJuQVdTOUdES0h6Zi8wMkFZbCtocVlNWER0cEJoMi9YZHJ3ZmZn?=
 =?utf-8?B?b2VaeElQNnA2aEduMmV3Q29OaXZtYTNkNFcxUWxjQzJ3NlhORklZaU9URXIv?=
 =?utf-8?B?VGJPVWg5K0ZjWStTTDdTeEROME84Ty9abnc5WFpsNmVzZzBHSHpQMWRaaDlz?=
 =?utf-8?B?a0tjM3NIb0cyZnVwV3JGTDhDWjZVMWsydnROUkJkaitsSHNGV2hRb0JWMW55?=
 =?utf-8?B?bVlNbldqazJQcDFtTmVmelhaK3lUVHBFMy9HRnR2RzVITnpuZDQwZTR0UFVC?=
 =?utf-8?B?TzI0eGQ2c3BYMlQ1UVJINmtoVThEUkpMem1UNFViNEFlWDRERjZ0QTFYT00y?=
 =?utf-8?B?MG1mSkNVQjFUajV5OXBkcWFhOGZ3cENXazJDWGRTQ1JlTU1XOGRwY1NFOWhX?=
 =?utf-8?B?eE1JMFNUZVIvSmVUdlRLVVRDalBQdTc3MkZwMDhWSUhKQWFlWkJMS3pVYXgw?=
 =?utf-8?B?ZGhNekNYOVdDdUJBWEtmaThQVi9yMi9zTVExeGU1aG45Q3lNazI3bGZoamJa?=
 =?utf-8?B?T3diVkJ5Mm9LbnhXNUxNZU5qSSsrM01YR1BQK2ZucEUxTlhoZjlpSWVXSVFs?=
 =?utf-8?B?SVBTQXlQeGpwSkpVaDN1Mk4wWUQzOThUbGY4UGVxU092N0srZForMHFNM01Z?=
 =?utf-8?B?TE1FSllmcDVzUVF4VldXNTR0RnNJV0JWdXZxbjYrNHc0TE9uNU5XRXoxWVZB?=
 =?utf-8?B?RDNqajdGWUIxeUtNOURuNXBiMTZ6a2xhSjlIeWk3bUE4Q004UGsvRTF5VmFB?=
 =?utf-8?B?aHE5K3Y1U1E3YzJ6aWFkelUxSU92VFN3R1hHM3NsL09hRFpyTE5rNGdWR0R6?=
 =?utf-8?B?OE5LYk5Da2RUT2dadXN2WTNWcUJoSjlLY0tzaW1OcXBBOUQzOEZrWjZteSt3?=
 =?utf-8?B?eXBLVEdxOGRSdllFRGliL2xrVXdVaTk0Y0hObjNhSllpYXQxV1VTa3JrWTho?=
 =?utf-8?B?NGM1LzB1R21kUCtVTWg1N2dQUUF5RnExZ2NTQVdqSU1zME9Wd3pXYlBJQzVB?=
 =?utf-8?B?OUFoemRNQnAzZTVBcUFDSWl3WlZrS2hIbWQyRExkT1RSTW04Wng2RXhJbWVN?=
 =?utf-8?B?aHYzNjc3Wnhpc0RtQUQ0ZlZxODJ6aUZTSThySCtXVjZ4eGNJb0JRbXI0dWxn?=
 =?utf-8?B?c2NVRllFQXNpekw4OTBKMjk5V3VFaU5heTVjYm1RQTJSUERUdlU2MkVyejlE?=
 =?utf-8?B?Mm5LL2toNUd6ZjJDMkJ4OWV2ZDJlaVV2ZXNhRFJheTVQSGd0RXlGK0FIUERF?=
 =?utf-8?B?alF6N3BvTkh3aFVkWkI2ejBxVW1MeWx6S3RybEZxdmNFTHF4TGYrVmFudVRz?=
 =?utf-8?B?UlB6d0dvbVU4Y0RWWGxxODRZdkVhZHE3V3lYWWYzSEFUK2RkOVB5dkxMUzBM?=
 =?utf-8?B?cEpHckV3Mk1iald1SUxrVm92bEpGajdmL1lwdVhSUHpwN3NYaUZRS2lZYmty?=
 =?utf-8?B?MTBYWXEvcXk2NG0vRTNvb2RDbzg1V0NOeGVFYjlsV3JEODBiYW5ab0M3RzVp?=
 =?utf-8?B?M2NvWVVLY0hQWjNwWDFNMXJ1Q3NxQkQvc1VMekJQUWFRelpucUhQWlVuSVg1?=
 =?utf-8?B?SUNzR1dnQkFXeXNSMUIyeFVqaDg3LzFQczk2SFlMM1FSbm5jRlNIbXd3MHNw?=
 =?utf-8?B?UFNndm9ydk92bWNCdTkxWlQ2ZzlIWlExRDVReVVUdU1BaHB4N01KK3VmamRu?=
 =?utf-8?B?elNGQmdQdG1Nd051WU5pZGtoeTkvYzlvV1FPeCsyOWpxbEduWHVpVnZxUTFh?=
 =?utf-8?B?TEV6TWJ6MGJ4b1lxNWZQSDNwdUUyMVRvTlN0WDJGZFlJVzhpMnFoVXBMQmh0?=
 =?utf-8?B?dnJvb3NSYUJndm01c3pQdi9iYmpHT3Jxc3R0eDdqWHZNMDE1THRTSXZEVnBl?=
 =?utf-8?Q?DklCz9Z07I8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yk05dWVLV3FuQ25LVDhmWWdGVTg5OE5sYUg2aVRPNHpzSnphRkNXMWhNdkRD?=
 =?utf-8?B?V1lRQ082em0yY2g2dUlQem5kQlNIQS9tenhGZzhCUWtDRXd6RzBlbFFzcldG?=
 =?utf-8?B?QmJUcSthYmxwbW0yQWRiTHVhRFZzSW1iNE43SmxQejAwWnB4Wk9rdDZQZGU4?=
 =?utf-8?B?UCtWRFRJNE9yQXA1L3BWL3ZKMkpiL3dvNW5LUkh1eStCdFJST0k2cjcrSXhQ?=
 =?utf-8?B?SC9MWFFONi85bUF0MElScCtBekpSUlpMV3I3UEJnNFZIMTVlcE5aeFJpL3Yz?=
 =?utf-8?B?UlY5TkJ6V21ESVNqRVdYcGU3ZXZ2V1dXOXArM3BtQXBORGxZSEhRVVB0QUNq?=
 =?utf-8?B?S1EzNzZGWkZDOWRqVG9zT3dKVWNhSHQ2NUhQSXl3cWM1RnVRODdVOEg2MFFX?=
 =?utf-8?B?amtOVWREblVNR1RuQUVxaUJGSjd4a3NCZEhxMDlHSlo4bTUvWnlnRWxabVo1?=
 =?utf-8?B?MXFxSUtTbVBWYVJocjh6UkVadkNRVytla01GWU1FWkJiYjlzcEdRQkowQ3h4?=
 =?utf-8?B?OWgzYjVSbCtQeUFMVmloVVFEOGJBY0Y3ZlJzRTRibENlODJvclE4NjB6Q0JS?=
 =?utf-8?B?dUZScU10aGpvcXRJZ2tncWpyUnErRzhyMEZqZ2hhaDNRMzIzV0JYTzAyK2Zi?=
 =?utf-8?B?cTQxbVd6UlRIbDZnTEVvUjRhNUx3eGs1K3lndWQvMUVqcG0xTUNzR0ZmamNI?=
 =?utf-8?B?Y0ZpRWlZaDlzaDRpRUt6aEY1RS9zU3ZKdHZTbjlHNlZnMWVTdzVmUXRUTFN2?=
 =?utf-8?B?TmdnTU15MngzNVNrTWNzRVh6M0NkeWJoSUI3RTlDZjQ1VWlqazVmbmY3bjNq?=
 =?utf-8?B?K2pETWtKZ2VtQkpza3F1UE9sRERWS2hwa3FPbGxWTlJKa0ZyTXZZV2o4bUYz?=
 =?utf-8?B?dEhjY0ZVK085VGtGR3dRNUM0MDU2YWxud3hNOCtkZ3hPMm1qajZKS2M2SWFv?=
 =?utf-8?B?ZU13VWRFRWY0ZklIVEZNb3h0SUVlVzlza3pzSTZCNitGSExHdGNOd3Nwb2NN?=
 =?utf-8?B?TGd3Ry93d0h2ZXNnMmFHa2ZobkdSUXpXQjVPRGZUVGtjWlBmZytYajBCRXJG?=
 =?utf-8?B?dzk3SGFyclZWZWNtdjhSOExjTGxXMm5qbThsMHZIbGoxckRhd3dWOUU0bmFC?=
 =?utf-8?B?YVM0MWJVZEZvN3hHeGNZdnRoT2dqQTQxQklFMDAybGxMdk5zcEtlVmlHdTNX?=
 =?utf-8?B?a2FDMjRjVmlraFVJM293WGtyQld4bzRmSExLMWRwdlR1Ulg5Y0IvY3JIeGJ2?=
 =?utf-8?B?YmpkWDVLOE91eTJVQkQ5b3MzNHJqQWdkRXFXQU8yQ0hPQTlHbmpuRDBVcDVv?=
 =?utf-8?B?d2pmSVFsM3A0ZDZyeG5GUEkrY0hlVUIwVEM4WTQxTzROYmJuTkdqWHNoNkZi?=
 =?utf-8?B?N1VwenE1Nm81UDJjd1FaQ3EwNVVTL2J5T01uNjJ4aUFlaFVzWDBINW5ick8y?=
 =?utf-8?B?c2pGK1BlSmE1dmZUaVFSdjJyWjBFWjVDZm8rK1VFams4UXMrUjNHZUNyQTdB?=
 =?utf-8?B?M3VqdjlZQ2RKUVFQZkdlb3pSWk9iT1h5Sk1LN0VKM1FCeXgwdEpXOHc1cDRI?=
 =?utf-8?B?b1RGenF0MnJjUEw2cWxrUldid1ludlhvRWtaL2FCM2IzbEczc0dicTQ2K2I3?=
 =?utf-8?B?V001ZjhFOVB4cGYxWFBsTitFZ1RMeENJaXV6RzBzUlBiR3oxekl0TU1hM3Ry?=
 =?utf-8?B?NEgzNFViUTVOZkVWdm5Tcm85ODN4VzkrTE5Hc1ptY3pBbUgxOUZrOE5aK3JB?=
 =?utf-8?B?MHhYMzhSZ3ZHY3ByS0tvQmdmdmxvQy9VNmFXOUhlWTk1L3JCYTNObUtvRG9a?=
 =?utf-8?B?U0toT1I3OVJXSnJXQU1UUUZMa1o2TmljL0U5WmdFd0pXMVJPVE1pYUFrQkVw?=
 =?utf-8?B?SHkyQUw3d09iV29yM2h2ZTFXbVNmVis3eExmSTlrWFFUbHNIU21jTG1nYjk1?=
 =?utf-8?B?QnpQejA5Nlk2NUxlWUJEQVBrd0lqSUdLUGRnMVdxbm9yZU9xTVhLWmdkd2dH?=
 =?utf-8?B?bWgxczFFbXNHRkVjZVp6TzJ1TFlEWE84YTNhMWJNYnVFOTRPZ1BtN2tTK2Z0?=
 =?utf-8?B?OWZkS3dLTTRlZ0pNZmlsRTlpT1A0Sk9mMkJhNE1MdzQwN3IzcFNtMzNNekdJ?=
 =?utf-8?Q?H0q21Q/OKJSBwtoa1EbVFrOwW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9016a3a-5026-4033-ee8b-08ddcaba5f31
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 13:59:56.6102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2NEF1BvPqH6FuXJ9f112xJ2BpWnGEyySQfCCzlybNPzlKx56djN9P17JnKM/AveE7umbW8ykq/vtFE2sVL5h2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5237
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

VGhhbmsgeW91IGZvciByZXZpZXdpbmcgdGhlIFVBUEkuIENhbiB5b3UgcGxlYXNlIGdpdmUgYWNr
LWJ5IG9uIHRoaXMgcGF0Y2ggaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNo
LzY2NTUxMi8/c2VyaWVzPTEzODc1NCZyZXY9MTUNCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KTmVt
ZXNhDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWGF2ZXIgSHVnbCA8
eGF2ZXIuaHVnbEBnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAyMywgMjAyNSA4
OjU2IFBNDQo+IFRvOiBHYXJnLCBOZW1lc2EgPG5lbWVzYS5nYXJnQGludGVsLmNvbT4NCj4gQ2M6
IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAwMC8xMF0gSW50cm9kdWNlIGRybSBzaGFycG5lc3MgcHJvcGVydHkNCj4gDQo+
IEkgcmV2aWV3ZWQgdGhlIEtXaW4gaW1wbGVtZW50YXRpb24gZm9yIHRoaXMNCj4gKGh0dHBzOi8v
aW52ZW50LmtkZS5vcmcvcGxhc21hL2t3aW4vLS9tZXJnZV9yZXF1ZXN0cy83Njg5KSwgYW5kIHRo
ZSB1QVBJDQo+IGxvb2tzIGdvb2QgdG8gbWUuDQo+IA0KPiAtIFhhdmVyDQo=
