Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B57C50AAC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 07:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE9B10E6A7;
	Wed, 12 Nov 2025 06:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFXE5dYp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3FF10E06A;
 Wed, 12 Nov 2025 06:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762927284; x=1794463284;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8ULPiRkbA9aN/sUOIGMMytCOTumJsDPBYC95CWVPzi8=;
 b=UFXE5dYpNL0KAnwD1BnZuP/rizCFET8ntVSpD/3u8qCTenDGWYFNgM03
 VpfXbU/HvcZFbVahAxjv0rsf8InqrVHSpA+/Ui18ier6sp+AgiaWV9tLW
 foGXkwXPCL5E7Ka+Uv8fPCeELI05wUcANerQlULpcFk6oQo5zP5R6a2mR
 X9Q1RFPsTLvGNl4aoX+BcgG8PczXGU3beYr8sUnPVcGDhcSp7xWJCMQyP
 QaOHfH+A91FMHZTIRDN9ZiKcMhIjJ3KirzJeUccC1PnRpBGyrwJiVW8P+
 FO462L4J7yUa+K1M0zPGY0M/CHssisV9stcF6mLFe3gZph03vhO+wX0j2 w==;
X-CSE-ConnectionGUID: d3Xr1aD9T56NONZK4cWa6w==
X-CSE-MsgGUID: O/gMhGcbTguM5vqWMkdCeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="82616114"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="82616114"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 22:01:24 -0800
X-CSE-ConnectionGUID: nXs5KOc6TsaaafhREKfqlA==
X-CSE-MsgGUID: bjJUM54tThCpmDGdR7I7VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="194335873"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 22:01:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 22:01:23 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 22:01:23 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.17)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 22:01:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pM92OLY0nlcptaRfuZtPHWnAjddmSc+Cp6BWHWO1Yf7HBGeIgOgpzRY4RJ0tDWYZLnlFud1i5mkMzF0NmKcTDIId450JNMC1hEZ/idO5Ph6F4MzQqSP8OLEkV/sTg4Z//Kbj5/NAHnt6cc76pd2lSLG/V9GzPzOXn5Gt5ttApaThemgVVqStnudcaLEgYcO0bVdKYjfW363spoWQKftp9L97Lzs671Y6rAb+dGFfdpG1whnxAusvEr7I346Gp8jzBGQw/xkxQsFVj6RQkDjfaHRfhjJfNxdTBCyUddLsB3Xf8OES7n8QGf2onC3I3Qw5fDGQRd49Cx+mzqA1Xz5j7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ULPiRkbA9aN/sUOIGMMytCOTumJsDPBYC95CWVPzi8=;
 b=NdyMei2Kk5J1C86bgRURtN73PXBlhtn9KzSdFGQKBX1IL3AousUTxtmRzslabQakDo/e7sgwpAguJ5E4ezrT/s2/sMrRu+GxQUC0pAZxKTgNCDH9OMVYimKUYsbP3D7gYA1Nbs/y/6QgHRNTDCtooeVDqb+8RQMVU2Dj3MckJhGtD00GPX3EozLMTrawSZe8K1ARt8qPatf7YWxNp5qWOX2QetH630H4tQY/zRGvxJ/AQ2OY5UI+TIDjNQg6XCXykwQsaEAausfojMmHXVYxTkZnoM8c0V2XlE1xJ+RZznZrsjJuxOSm2utpAkJMI1IzuOE8jRlbEi2pgmZ7t0BxTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SN7PR11MB6725.namprd11.prod.outlook.com
 (2603:10b6:806:267::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 06:01:11 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 06:01:11 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v3 08/10] drm/i915/alpm: Enable MAC Transmitting LFPS for
 LT phy
Thread-Topic: [PATCH v3 08/10] drm/i915/alpm: Enable MAC Transmitting LFPS for
 LT phy
Thread-Index: AQHcUwyqDLvGM3mxAU27R9w4ksekQbTujQiw
Date: Wed, 12 Nov 2025 06:01:11 +0000
Message-ID: <DM3PPF208195D8DFA2DBA352DED1F5FAAA9E3CCA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251111124316.1421013-1-animesh.manna@intel.com>
 <20251111124316.1421013-9-animesh.manna@intel.com>
In-Reply-To: <20251111124316.1421013-9-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SN7PR11MB6725:EE_
x-ms-office365-filtering-correlation-id: 3fd5c680-e21b-4af8-fc87-08de21b0e14d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?azJnY0FHbFNOR29wTVNQWWZ2SGlzREQ3eHFLT29oVjZLYS80NlB4QVhVZDRZ?=
 =?utf-8?B?NUtrSVMwMm5UQjlUbVFJZ3d0VHZTWkRTZUJxem9COFRuUXVFZTh4UW5iQWpm?=
 =?utf-8?B?aGpRcUl1TDZoSnd3QytOS3lXRlRkaWxaNzl1alZLaVZMZGpqaU80aXVoTXAv?=
 =?utf-8?B?Vk8yZHR6R09mWlFmZXRsNlRmVkhabTFQVktRTUJrK01oc3lnS0JXOEVaMWIy?=
 =?utf-8?B?U0cwbytnUG01NS96U21Zd0RXbDhzZEE2ZlpLUTV4RG9aRm5zK3pJS08wK1dL?=
 =?utf-8?B?YmtpMDZ3ZytvTjdXWXRZTzZNVmxZdGw3QjBoK3cvM3l1TEFwVUxPTnhteTJx?=
 =?utf-8?B?dTB1VnlKT3JPdDdEMG1PUEI5bUVkYWlEM0pPRTFGeWIxSnlicnlRWkdiZ250?=
 =?utf-8?B?aDgrS0g5TmhrN1pzb3RYVWZJMCtuSXRUM1R0VzR2RzZjajhubjZXdU5ybVox?=
 =?utf-8?B?em10d3ZNNVNWUE02VW1DS3pyS3lYbTlGN1NraWVzblBzU2F1UmozeW5WRnBu?=
 =?utf-8?B?ZXBWcUd1MytkUngwN012VjBzUWhFTnpNZkwvakRzYlVpVnBmMURkZmtuZnJW?=
 =?utf-8?B?Tm13QTJQbG5XRjFiYzVCSzFtWUFFdXJqZ2wvcjlPT0NFUlVaOXMzbk1MVnJn?=
 =?utf-8?B?T2RRZCtYVFpGZjhFdDFRZ250NS9OWEtWNXZoKzhrckhaTGJ3T2h1bkg4bkhx?=
 =?utf-8?B?bDhBK2NuMjloZ0hkVnRtS1JmMStFTGNyb3VXcFhVY0NNWVZzNTNkQUpZdXF4?=
 =?utf-8?B?M0I4TGFHRVhVQjdOWWUyNnJPUDdTN1JYK2dLZWZ4Um9LZ3VNQTN6MGV2RVVh?=
 =?utf-8?B?Wk1KdlcwV3hNOFYxaSswdUZ0UzhhTTNxRkJ4UDVmYkhnMVZTNzZIbHJOQXI5?=
 =?utf-8?B?MFBTSkM0NHBrMTc1VkFPdDBqSHBqbEdyMkpYTVdaQ21zcEVPQTFQbkk3NEp0?=
 =?utf-8?B?d3pzSWQxdmIyMUk3OU5BeWNzN3ZHeWU3dG5oTUF6RmpPQTlXdkRsWFVrT0g5?=
 =?utf-8?B?K2NkNTQ2L3d0cGs0THdDYmlvcmdicTNFK01sWDZtR2krYXBRSllaMElObUEy?=
 =?utf-8?B?MlBhSXQyNHhmSk9sblJpcWl4TmR3bFNYZUt1TkVva3hvZy9lM1ZUMzVlWU1p?=
 =?utf-8?B?TVd1ZlBCM3ZvSkZvQ3k1K2lBYkNCZGFtZjYrcVZRM2h6bVpmaVpFVWhqcEkx?=
 =?utf-8?B?OGl4OUsrUkdaT1BUZ04xNW9aa3NFSzE1aUtjb01oOEhaN1FadU5DbTFhdGJI?=
 =?utf-8?B?amIvMXhZT3hMTWI0Skg5NTZ0NHVEUm5zU0tqdVFmMjR2eDd1VUJLeEFRRmV4?=
 =?utf-8?B?WVgzaU1kOXdsSTdMRDFFOWlFS0w5Z2J3dXgrc1gyR0ZaUXNZNFBHYjgyMnR0?=
 =?utf-8?B?NElMYTdrUmI4b2FCa0lPZG9JNVl3cnBOdHJ5MWRKbFBmb1liUmdwM29qMTJX?=
 =?utf-8?B?NWUzbmUyV2xFVSsxT2RqMzlXQUY3NURJVVhVNXVtc1ZZUTh1RmxZWm5WeWFn?=
 =?utf-8?B?T2hZSXIvYmRGeVNudHE5MG1ieTVGcERlUDNyK00yTnE2UU93QzVZdFFkajBr?=
 =?utf-8?B?eXIxWGNWQnI4Q1VnRUQwSTdwQStpTndLWFkwNUQxSWYrZzdYblAvVHFjZExa?=
 =?utf-8?B?K3JTTnN1Um5FY1lhOVpvQjZ5S1hyYUg1Z2I1WnJYNWpvbTIwdisvemxkTmFW?=
 =?utf-8?B?NUdTVWtoZGNtRnFoYnBRcVQ1d0s4WnkvQ0h4T2F2K3lXcFVYenMvWDdQL2oz?=
 =?utf-8?B?aHlkK3ZKN3V1QjBaSkx1SjJqSXdrZlRqV1NvM1o2UTFxRDVtN0Q1ZFZaWFU3?=
 =?utf-8?B?U2FzY1pDemVaS3Y1V0pQVVNXc0VTamh6WHQ2UUs2aUhzSUt2SGpSRXBreVds?=
 =?utf-8?B?NGd6WlFlQWlqdUtqeHF1TmtidzI1UUg1dGtUclhDZVpUZXJVSGRVN1ptczR3?=
 =?utf-8?B?cGR0WC80SFJDMVVzMnZrL2svZWhqSmN6S2RBMTljK3Z5bU5ESW9Hb08zaGt3?=
 =?utf-8?B?NnlCWlJDSjdCMGs1bHpvNkNvZXhVUXZmZjlXN1NpN3h0NTdoUkF4ZGcvUWpX?=
 =?utf-8?Q?YjS+v2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QS9oNkZqeVBXL1NRY3IxRmI5Ulk1NUJqcGRxZDBuclpUVC9oTFhaZE9Na3Ux?=
 =?utf-8?B?aVdmMlE1dUhBWUdDdkxyWHMwb3plQmhPcnEzamVadFEvWDg5SjEwaFBVRU1l?=
 =?utf-8?B?ZWh3TlJiUXlBVWcwUVJmMEUxRnE0dnIvM0laQUhxdmdUSHZaR256NTh6dlA4?=
 =?utf-8?B?Y1hONmh5bjBXZDBxdHMzRmVqMzJxWU1TRGNtYjV3Rkg4VWgxZkRHTlVzUktw?=
 =?utf-8?B?REViT1BpZmFYQXdjVDV3ZHB0MEVxOC9xQk84NUwrRDUrU05Wd0hDa3lmUHc0?=
 =?utf-8?B?VmM4MUFMTHk3VWl6YzJrNEZaclBlaEtrMy83VmVqVGxwUThxenQ5eExBRVdJ?=
 =?utf-8?B?VW1nR3M3TDB6UUU3MTByZTA5NmROYmI3b201RkVTT2s2SmRFMWs3OXRpb2lM?=
 =?utf-8?B?YlpSRGdaYkR2YzJETU9MUEtFWVBtdW1OQXlYcnlwdXVJWmFEUThRMlVqU3Fm?=
 =?utf-8?B?NVRJaCtMeGVTSWJ3aURKZFZ2em50YmFjbGx0R1d0WUR5THJRdnB5Z2FNRmlB?=
 =?utf-8?B?ZHRMU1g0c205c1RuMUhIVXRtZE5zdkJZVWJJSHpCeEF2YWJpVFp0RWZnaVJs?=
 =?utf-8?B?QXNmZ3NyYVoxTnRkWHdkTEFhOUQ0ZzluRWVpYnd4OHdZNG9sZlRjMlFwaFRr?=
 =?utf-8?B?V2NsY2tTS0xPVHNuQ0t5WDdYNmdzRGlYU0tFVFlQaTFVNTJ5UUNuY2VSL282?=
 =?utf-8?B?ZzEwaUkwa05kbE5maTBUbDNNcGFCQm9wakNHYXdTT01vTExvRlNLbjI3WExa?=
 =?utf-8?B?VGdMWGcvZXh2bG5GcllUa2FGRU9uc2dZZXZoc3FmQlMrMWNDSzZqUjlKNi9P?=
 =?utf-8?B?a0h2R3BiZnRqZytlL2VnN2Fud21mVW9kNFIzYWVibUlqK3NpZFY4RlNPWWNN?=
 =?utf-8?B?akc3YjJJaTUyRlJ0SWlSRFZDOEZnZFR0SFRPVUJKWForT29WSGVzcEJpVWp3?=
 =?utf-8?B?TEdiR0c1bnVubDZWZWZyTFpHTEJLNVBRWXV6K2YzK1hWK2FCb0svYnJMTGNq?=
 =?utf-8?B?ZVBLUllJTXJ6Yld1MExOQjA5MVlvZlZjUWw0Ly9jN1lFNlZPMzI2c3MwZ3Y1?=
 =?utf-8?B?cTJ5K3BwOEE4Z1AzM0JURTcxd2QraHFYdCtITnN4YWJMcnQwUyttWDNWQ3BP?=
 =?utf-8?B?M3V2VytZdndMaC9BUTM3ZXM4Zy94Umxsck5WbWV2MkNONEZyNUhTUWZ0a3dQ?=
 =?utf-8?B?NzlieUUzTVRtSTc1ZmlzV0hQVXNmZmN3SENHaFlUclI4c0lDWTIvVXFsSGdS?=
 =?utf-8?B?ZzFXTFlwc2R4clRqblc1N1Zncy90Mm5qREpsWmdtRmMvQzlFTGZFTEsvazZ4?=
 =?utf-8?B?dzRhUW9XbkppcDNEbFFJdUFVL3M5MllqOXVKRHlsK3ZFbVBqR0xXNGhpWVFY?=
 =?utf-8?B?YTVvaURKS29QWFltK1NJS2dDY3hpaTBWZjlvVmJwa09POTlpYUxMUUZqclVW?=
 =?utf-8?B?VGU3WlhPQWFuOXdLWEpvMGVneWR3b3B2QU1ra2ZKL1ZCWmJyeUUrejdHdjdh?=
 =?utf-8?B?N0hhMWxrclBpdWtxZzRudElnMEhLbXpCeFJVeVNBRlZYSG5GK1NIaDA5T0JD?=
 =?utf-8?B?VGg4Zk1YUnBxeGpHRjVYNUEwMnNQUndEOFg1SDRtdkR2T1FvTUUrR25Vc2sy?=
 =?utf-8?B?YlU3SXlyM2RaZDlzQXp5VC93NWIrQ2ZJRmRVV0dZb1hLQnhpRDdhWC9EOVpn?=
 =?utf-8?B?K2Q5dUNacG1ENVlrcktsWjBDczA5OFZ4Wkl0U2o0bnR2Nm5MUlcrc0l4RW85?=
 =?utf-8?B?aEdLbUduTUkvRUxkQU9RbjVaWmcxME55U2ErRHVDdzhmVnBsbFY4SnU1ME1M?=
 =?utf-8?B?dFdQRkFaTExQRWlKMWd1U0tDQ2t0Y3BBSU1yNGpIT25hMzI3TG5UbndtMENX?=
 =?utf-8?B?YXcvRlhTUUxKMkJ0SVBYL1N4Uy9oTTVkNEtDU29iV1A4L0VpbUFaYVlJbU1P?=
 =?utf-8?B?ZTdtZFhTbEdzbTJpWFlRUnJ6dUlSK3FLWDJVc2F0QUtQdVQ3UTlFQXZyU0xI?=
 =?utf-8?B?NUZCREQvVVZsQTZDaEZkbWpCaUI0S0VIT1FwSnlFcDN6cFBURGhJeWV1Um0w?=
 =?utf-8?B?dWFEaXAvM0kwMDNheWtHYWR5N292eUV3OU90MGtnNVFmano3WGQ5b3Q1cHJP?=
 =?utf-8?Q?WS6eX0aZ6Xfrn+GyHbH8uT0QH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd5c680-e21b-4af8-fc87-08de21b0e14d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 06:01:11.0997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HighaY4ib3b750m/dDcIAcXjWfkGY6Ma8ytgWjZHc97wUBs55Xt5kwW/LEMIzBZX5AE9QG3rWTYR8KtbOBD80w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6725
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

DQo+IFN1YmplY3Q6IFtQQVRDSCB2MyAwOC8xMF0gZHJtL2k5MTUvYWxwbTogRW5hYmxlIE1BQyBU
cmFuc21pdHRpbmcgTEZQUyBmb3INCj4gTFQgcGh5DQoNCiogUEhZDQo+IA0KPiBFbmFibGUgTUFD
IHRvIHRyYW5zbWl0IExGUFMgdmlhIExUIHBoeSBkdXJpbmcgYXV4LWxlc3MgYWxwbS4NCg0KKiBQ
SFkNCg0KPiANCj4gdjI6DQo+IC0gQ29ycmVjdCBjb21taXQgZGVzY3JpcHRpb24uIFtTdXJhal0N
Cj4gLSBSZW1vdmUgbG9vcCBhcyBubyBkZXBlbmRlbmN5IG9uIHRoZSB0cmFuc21pdHRlciBMVF9Q
SFlfQ01OX0NUTDAuDQo+IFtTdXJhal0NCj4gDQo+IENjOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5p
LmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5p
bWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kZGkuYyAgICAgIHwgIDUgKysrLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9sdF9waHkuYyAgIHwgMjYgKysrKysrKysrKysrKysrKysrKw0KPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHkuaCAgIHwgIDIgKysNCj4gIC4u
Li9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHlfcmVncy5oICB8ICAzICsrKw0KPiAg
NCBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYw0KPiBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMNCj4gaW5kZXggNzMzZWY0
NTU5MTMxLi5mNjQ1MGViZWEyYTggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGRpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kZGkuYw0KPiBAQCAtMzc4MSw3ICszNzgxLDEwIEBAIHN0YXRpYyB2b2lkIG10bF9k
ZGlfcHJlcGFyZV9saW5rX3JldHJhaW4oc3RydWN0DQo+IGludGVsX2RwICppbnRlbF9kcCwNCj4g
IAkgKiAgICAgaWkuIEVuYWJsZSBNQUMgVHJhbnNtaXRzIExGUFMgaW4gdGhlICJQSFkgQ29tbW9u
IENvbnRyb2wgMCINCj4gUElQRQ0KPiAgCSAqICAgICAgICAgcmVnaXN0ZXINCj4gIAkgKi8NCj4g
LQlpbnRlbF9sbmxfbWFjX3RyYW5zbWl0X2xmcHMoZW5jb2RlciwgY3J0Y19zdGF0ZSk7DQo+ICsJ
aWYgKEhBU19MVF9QSFkoZGlzcGxheSkpDQo+ICsJCWludGVsX3hlM3BscGRfbWFjX3RyYW5zbWl0
X2xmcHMoZW5jb2RlciwgY3J0Y19zdGF0ZSk7DQo+ICsJZWxzZQ0KPiArCQlpbnRlbF9sbmxfbWFj
X3RyYW5zbWl0X2xmcHMoZW5jb2RlciwgY3J0Y19zdGF0ZSk7DQo+ICB9DQo+IA0KPiAgc3RhdGlj
IHZvaWQgaW50ZWxfZGRpX3ByZXBhcmVfbGlua19yZXRyYWluKHN0cnVjdCBpbnRlbF9kcCAqaW50
ZWxfZHAsIGRpZmYgLS1naXQNCj4gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2x0X3BoeS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHku
Yw0KPiBpbmRleCBiMjQxM2IzODVkYzguLmYzMjU4Y2U5OGIzZiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHkuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2x0X3BoeS5jDQo+IEBAIC03LDYgKzcsNyBAQA0K
PiANCj4gICNpbmNsdWRlICJpOTE1X3JlZy5oIg0KPiAgI2luY2x1ZGUgImk5MTVfdXRpbHMuaCIN
Cj4gKyNpbmNsdWRlICJpbnRlbF9hbHBtLmgiDQo+ICAjaW5jbHVkZSAiaW50ZWxfY3gwX3BoeS5o
Ig0KPiAgI2luY2x1ZGUgImludGVsX2N4MF9waHlfcmVncy5oIg0KPiAgI2luY2x1ZGUgImludGVs
X2RkaS5oIg0KPiBAQCAtMjMyOCwzICsyMzI5LDI4IEBAIHZvaWQgaW50ZWxfeGUzcGxwZF9wbGxf
ZGlzYWJsZShzdHJ1Y3QNCj4gaW50ZWxfZW5jb2RlciAqZW5jb2RlcikNCj4gIAkJaW50ZWxfbHRf
cGh5X3BsbF9kaXNhYmxlKGVuY29kZXIpOw0KPiANCj4gIH0NCj4gKw0KPiArLyoNCj4gKyAqIEFj
Y29yZGluZyB0byBIQVMgd2UgbmVlZCB0byBlbmFibGUgTUFDIFRyYW5zbWl0dGluZyBMRlBTIGlu
IHRoZSAiUEhZDQo+ICtDb21tb24NCj4gKyAqIENvbnRyb2wgMCIgUElQRSByZWdpc3RlciBpbiBj
YXNlIG9mIEFVWCBMZXNzIEFMUE0gaXMgZ29pbmcgdG8gYmUNCj4gK3VzZWQuIFRoaXMNCj4gKyAq
IGZ1bmN0aW9uIGlzIGRvaW5nIHRoYXQgYW5kIGlzIGNhbGxlZCBieSBsaW5rIHJldHJhaW4gc2Vx
dWVuY2UuDQo+ICsgKi8NCj4gK3ZvaWQgaW50ZWxfeGUzcGxwZF9tYWNfdHJhbnNtaXRfbGZwcyhz
dHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwNCj4gKwkJCQkgICAgIGNvbnN0IHN0cnVjdCBp
bnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKSB7DQo+ICsJaW50ZWxfd2FrZXJlZl90IHdha2Vy
ZWY7DQo+ICsJdTggb3duZWRfbGFuZV9tYXNrOw0KPiArDQo+ICsJaWYgKCFpbnRlbF9hbHBtX2lz
X2FscG1fYXV4X2xlc3MoZW5jX3RvX2ludGVsX2RwKGVuY29kZXIpLA0KDQpIYXZlIGFuIGVuY29k
ZXIgdmFyaWFibGUgYXZvaWQgaW5saW5pbmcgYXJndW1lbnRzIGxpa2UgdGhpcw0KDQpXaXRoIHRo
ZXNlIGZpeGVkDQpSZXZpZXdlZC1ieTogU3VyYWogS2FuZHBhbCA8c3VyYWoua2FuZHBhbEBpbnRl
bC5jb20+DQoNCj4gY3J0Y19zdGF0ZSkpDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCXdha2VyZWYg
PSBpbnRlbF9sdF9waHlfdHJhbnNhY3Rpb25fYmVnaW4oZW5jb2Rlcik7DQo+ICsNCj4gKwlvd25l
ZF9sYW5lX21hc2sgPSBpbnRlbF9sdF9waHlfZ2V0X293bmVkX2xhbmVfbWFzayhlbmNvZGVyKTsN
Cj4gKw0KPiArCWludGVsX2x0X3BoeV9ybXcoZW5jb2Rlciwgb3duZWRfbGFuZV9tYXNrLCBMVF9Q
SFlfQ01OX0NUTF8wLA0KPiArCQkJIExUX1BIWV9DTU5fTEZQU19FTkFCTEUsDQo+ICsJCQkgTFRf
UEhZX0NNTl9MRlBTX0VOQUJMRSwNCj4gTUJfV1JJVEVfQ09NTUlUVEVEKTsNCj4gKw0KPiArCWlu
dGVsX2x0X3BoeV90cmFuc2FjdGlvbl9lbmQoZW5jb2Rlciwgd2FrZXJlZik7IH0NCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5LmgNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2x0X3BoeS5oDQo+IGluZGV4IGI3OTEx
YWNkN2RjZC4uNWNlYTAxYjE3NTZhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2x0X3BoeS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfbHRfcGh5LmgNCj4gQEAgLTQxLDYgKzQxLDggQEAgaW50ZWxfbHRfcGh5X2Nh
bGN1bGF0ZV9oZG1pX3N0YXRlKHN0cnVjdA0KPiBpbnRlbF9sdF9waHlfcGxsX3N0YXRlICpsdF9z
dGF0ZSwgIHZvaWQgaW50ZWxfeGUzcGxwZF9wbGxfZW5hYmxlKHN0cnVjdA0KPiBpbnRlbF9lbmNv
ZGVyICplbmNvZGVyLA0KPiAgCQkJICAgICAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUg
KmNydGNfc3RhdGUpOyAgdm9pZA0KPiBpbnRlbF94ZTNwbHBkX3BsbF9kaXNhYmxlKHN0cnVjdCBp
bnRlbF9lbmNvZGVyICplbmNvZGVyKTsNCj4gK3ZvaWQgaW50ZWxfeGUzcGxwZF9tYWNfdHJhbnNt
aXRfbGZwcyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwNCj4gKwkJCQkgICAgIGNvbnN0
IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKTsNCj4gDQo+ICAjZGVmaW5lIEhB
U19MVF9QSFkoZGlzcGxheSkgKERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDM1KQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5X3JlZ3Mu
aA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5X3JlZ3MuaA0K
PiBpbmRleCA5OGNjYzA2OWE2OWIuLmM1MGRiYWQyOGI3OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHlfcmVncy5oDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5X3JlZ3MuaA0KPiBAQCAtMzUsNiAr
MzUsOSBAQA0KPiAgI2RlZmluZSBMVF9QSFlfVFhZX0NUTDEwX01BQyhpZHgpCV9NTUlPKExUX1BI
WV9UWFlfQ1RMMTAoaWR4KSkNCj4gICNkZWZpbmUgIExUX1BIWV9UWF9MQU5FX0VOQUJMRQkJUkVH
X0JJVDgoMCkNCj4gDQo+ICsjZGVmaW5lIExUX1BIWV9DTU5fQ1RMXzAJCSgweDgwMCkNCj4gKyNk
ZWZpbmUgIExUX1BIWV9DTU5fTEZQU19FTkFCTEUJCVJFR19CSVQ4KDEpDQo+ICsNCj4gIC8qIExU
IFBoeSBWZW5kb3IgUmVnaXN0ZXIgKi8NCj4gICNkZWZpbmUgTFRfUEhZX1ZEUl8wX0NPTkZJRwkw
eEMwMg0KPiAgI2RlZmluZSAgTFRfUEhZX1ZEUl9EUF9QTExfRU5BQkxFCVJFR19CSVQoNykNCj4g
LS0NCj4gMi4yOS4wDQoNCg==
