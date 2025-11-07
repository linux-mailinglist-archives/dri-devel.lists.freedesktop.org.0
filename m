Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5366AC3E64A
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 04:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D67610EA21;
	Fri,  7 Nov 2025 03:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeHafYBY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8807610E18E;
 Fri,  7 Nov 2025 03:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762487371; x=1794023371;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fpYfKDtglmpIifaFhijfPAE+vrYsCiS4kphxnsTxMLo=;
 b=PeHafYBYFApmt5BgHv2RL8Rvq2nC195E3O/7uNhjBCZLLnWlDZVU+//3
 61e5IowhDwTz91oInXO86khPUfixm2mN5zXXwTgs7SvbGvtUz1LvrUP9/
 ahVA6zL9k1rAdTTz1e3ehVby7BiryVGWSyZPXsNE5XVRjpGjVdUMgjZlQ
 yl4dKs1WxcQrVgAs/1xqCg3U+Ek7wWnWUxTvdOEqriOTXWbdfoeiAjtAj
 G3VtGpywnQgLzUhf0BSZRSDqkt2SecgRmc7shlzqIkoVNrZ7CCFOMvN8Z
 vihYK+9qSqT98D2GmvUUW0AkF1UdbQ6bY56nbAJky8/8bA7GVTiPmJopE Q==;
X-CSE-ConnectionGUID: GfC9ttDDS9qoMmioF19Bpw==
X-CSE-MsgGUID: Oa3uwYjtSJamj/a+vrcr5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75988969"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="75988969"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 19:49:30 -0800
X-CSE-ConnectionGUID: LJ5hZsZYQjyWnRZNKQfupw==
X-CSE-MsgGUID: Z0KaooPuSfyCrGLXrXnsDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="188657123"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 19:49:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 19:49:29 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 19:49:29 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.42)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 19:49:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1Ejn5yA0Vt5v4NQYQqbbt+zyQmEK5PVLnP8fchEL03WojDvoCmjNoZsMUcyQfBQnLnTBHgHu72AC5fz7ztvR7pQAI/Q4ne6SghuB9Y/RHzKVNbDZzj43UcBZYmyoFWKO0+CpUvPcdNGjIfydRYuGdWOGrju8dMJuf+Pmnwt/XuJr55EuAlAVp2cwNKEoESdJb+gqjAwH5JtkyWHIsZkzWCBtDMRqLmesYFal86fIWcg4oeXGl4j2IDvsCpd3O/ncuGfwNfnAXIA/ZlDN4rk4aKJV90OipaqrMiZVk4gqrUbIbYmzW7RDCnDrcWNpkVei3lHJGC+o6nUD4M9PjOeGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpYfKDtglmpIifaFhijfPAE+vrYsCiS4kphxnsTxMLo=;
 b=Yem1cf5BfnRsHv5L8fvmeiitAe42hvrJzDyi1vNb67QBOkA5ASetiy9N1ohCWu8Gn6vXTzBtjqB/q0+/0uN+p0ysS7GchktzjIb8QVSXpfiVQO1rSvnWMp4r03GxvMKPNRjB/pCIbJqEVK6DJGGRFk6BtBApOgrxjVX4i7By+Ah/EBfyg9r2hu0It2XNw1pbSc0CmVx795vhX/hk3r+6lf855UTT/V5f05sTJ/1LvyZCsyo2NJT4efV67kG6O0Ayp9PlxTfORbCubaOQdKVmxnxQM5wbcu6rkjUSCpt5QLWMPz4oxaYmRmNKiTaQdjaA+Gggo5WekstVgpswkpNYEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DS0PR11MB7216.namprd11.prod.outlook.com
 (2603:10b6:8:11c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 03:49:22 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 03:49:21 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>, "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: RE: [PATCH v2 10/10] drm/i915/alpm: Introduce has_alpm to decouple
 from pr/psr2/lobf
Thread-Topic: [PATCH v2 10/10] drm/i915/alpm: Introduce has_alpm to decouple
 from pr/psr2/lobf
Thread-Index: AQHcTRPVnyX2q4zS30iURGK4+ugAibTml+eA
Date: Fri, 7 Nov 2025 03:49:21 +0000
Message-ID: <DM3PPF208195D8DEA02EA316FB774349E57E3C3A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251103220957.1229608-1-animesh.manna@intel.com>
 <20251103220957.1229608-11-animesh.manna@intel.com>
In-Reply-To: <20251103220957.1229608-11-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DS0PR11MB7216:EE_
x-ms-office365-filtering-correlation-id: 230efa8c-6f08-471c-7c53-08de1db0a2f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MzJmNmttYzkrenRzVTIzRXhaallEcWM0OC81aVM4dHVEa2hsVkE5MXE3SVpr?=
 =?utf-8?B?UkpqS1dvSlJrSm9hNTU0eHB2dmtmTlFCVFkzaG93RmEwcGtRd25QN3RQKzRU?=
 =?utf-8?B?NG94WTk1R3lJa2ZXdmxDVmVXd3NUUnNRNmxGb3U1Z1ZyQ3QyOGtrTkVoMThO?=
 =?utf-8?B?S3NIZUU4SG1iUXkxQ29FSzVPTEpiVmkvczZVSEFrZTdseU1lSnoyTTViaG1U?=
 =?utf-8?B?QzZLbnRkOTdDUTZmRnJoT2t3dEtGYzZOUDJIeCtYMWhsNkJCeEV2aG9kWG9M?=
 =?utf-8?B?c3p6NS9PQ3VzYml5ZW5uTDdra0hwSFY4OTBMeVliMkZ0L3VkZDNWTmRVdjF3?=
 =?utf-8?B?SmdpNjJIYlNEeWV5cFlGSkt5KzkwcUtKNXJCSktwVjJvd0FJTllBTXR1a3hp?=
 =?utf-8?B?eHk1QzdwOVRwOWU2cThGUVRQZ2pOak1xcjBMR21UWWFmR0pZRTVPODh4dFZs?=
 =?utf-8?B?akRHTEJLVXl5S0JDWUlaZmJMQ1hxK2tyZGNMMzFlVmFsMFJEd2RwWjFVN0lG?=
 =?utf-8?B?Q2VDYzU1RHNEajFrKzZYTWdGdnVhR25HenR6cWJpSForVml2d3Zic29hMlV0?=
 =?utf-8?B?QTNuMW5mRjVHSmQwdnJmaVdIeXQwR3dRUWY0dWlIcnZwNTk2dlk2RUI0M2Qx?=
 =?utf-8?B?a3h0Qk1pTDNNMkthYWlaNm02OUFUZlVvZXlkcHNITGFBTFRUTmtHdlRRdTZC?=
 =?utf-8?B?a2d3UHBXcWFqanV5QnNBTHRsL1VyQWdHQ05SVTdVbTVkUGFvNWpoQjQxN2pZ?=
 =?utf-8?B?dWFoQnprQkVWdjBwZW1WVHdpVkJzUXI0N1hIM3kyMktqUHM3a2lMQXNYT1Y2?=
 =?utf-8?B?dGNVNDdYL1dJNCswRThOV0lNME5sOU9JTFJxZENjdENlZlhTQXhWeTg1TXhm?=
 =?utf-8?B?aG41OXA2M1Z1d1RRZmF6b01xTjk5L2ZoZzdZQWt1VzlMcHlJcDlxMlIzQnNx?=
 =?utf-8?B?bWgvVFljREJWS3VJdmd4ekNYeWhyaDJ5em1INDdvR3FNU0Y2NXUvUEZvR3hv?=
 =?utf-8?B?cEZWNVorMUpaV3NKRzdYc2MyZ2RLRUg1dmc3VHprMWVZRzljUnJsUlBXWGMy?=
 =?utf-8?B?TkNqenc4dmpYWjlkWE1zNENuYkErd3FSOVBrdDd5ZXBmVFl4ZnFXZnhld2Y4?=
 =?utf-8?B?emIvMlZ3Ymo4MUhqQ3R5TVlPejVEbTFWZzU0NmVaS05tVEdkS2pyZ253WWZy?=
 =?utf-8?B?bmcxM0Z3N1pRYmVYTlBIK2E0b2JZQUxDelhoUVcxTTlFRVZnQ2NpU2xHZ3Ux?=
 =?utf-8?B?dStaNVpBWGVweTlkZGEvU2ZwbnJvUktwdGdNL1pNc2ZKMGx3OHZxQ0ZqSTFo?=
 =?utf-8?B?L0JCVmVaaDEvS2RIamY1UXJoVi9qYUd4ajYwdVA2QW1oRW1SQm1zb0YxK1dK?=
 =?utf-8?B?RGhJR1N6bUdpc1RyZDZpTUlrNXE5bjE0VmdjZXdrZzNlTnJQRC9HSGJPMUJn?=
 =?utf-8?B?VFViU0Z5UmJrK1Ava043aWsxaDZTRGl5RW1SNWNDRFVpODlCU3N2cldMUkh4?=
 =?utf-8?B?NTBudUJFVE1Eb3RHU3hPYTJWcUNTdEl4Z3Voa1oydXRQems3L1ViTWdMbDJK?=
 =?utf-8?B?QmpSTm9VQlpSenI5RlZmallrOE5oclJldDZsK2lzOE44a25TeEJ1aUoxS09T?=
 =?utf-8?B?aFZUWlMrR1VkYlBuQVU5eUJ3aEh2czBoT2wvSk10ZURRMzJBSkFsTXJ5VnRK?=
 =?utf-8?B?VWpISHBPd3ZHN0ozQXVmeG9KQW1HUlR1YXVlcUdWOGk4UDF5YzFRcU9DOHFS?=
 =?utf-8?B?UjdZQVhTQmNPWUdiaExsS0oxNHp5elVJeU5odU5Na25OcWFRWGpiVU4vQ1Vp?=
 =?utf-8?B?MGdmTUZqSmVlKzRWOUZRL1ZMTHViS3pIeHFrQ1QxOW9YUnJCUjhnYWdyRkcy?=
 =?utf-8?B?ZUZQQ0RRS0JGOXpkamUyQm1CZjZ5UXF5cnQyUkVpMVJnajltazZwYWdTZHdB?=
 =?utf-8?B?MGRTVmw1bmsvRUNLall0ZVFtbzRsdWZWN0RJMFROVW5NUVZyZ2libzAzRWJQ?=
 =?utf-8?B?bEtCdDJoWnAvTW03bjhSRk8xYVR1anIybitmMVJSOEdCbHZrSnJXZjlnUllp?=
 =?utf-8?Q?124j5c?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkFKdGpsK3VJR0l3YWs4QzFLdjBWZkdsRG1PTG43eHp0akdGSHRnY1hBdjF0?=
 =?utf-8?B?cHloSlFFY2JDdUJBQkplQkVqYWtUbG4yYlRUZ2tUK3ZCdElidEoxS0NrcDRF?=
 =?utf-8?B?QWFxUUtUU0VmbVNvMG5PUkJDS1I4cnpGT0F5RUtYcUtKQmp5NGVRcFRyMHhk?=
 =?utf-8?B?QXZEc0kyeURoZjlhMWtYR0NJcWhTZ3lJRDhxL1J5QUxmSCt3aDFIeHl3emFF?=
 =?utf-8?B?V1luM2JDZDk4WHBxbEZxMWhoZ3plRjN3amM3MTI3WG83ZXA5YlRhaEhmT2Vm?=
 =?utf-8?B?U1pSNEtDNmlPOFUzSFU3YzhlK0g3ZjVxbUQrRHMrNU5JaVFKQUJRUVFxUHpq?=
 =?utf-8?B?bzhSYkRiZUg2cjRabVNsa1RNd1NLQ0xkMUJtdC93ZDBvR1UyZTFrTHZuWnZ4?=
 =?utf-8?B?Si83WDNQWCtxRjdIWldkVFJRRk14UTJ1Sm9kVGRnelpVMnVkdlY4ekE2STNR?=
 =?utf-8?B?dkJFL0lzZUYrRSs0ZFJST3kxdk5mZU1ZbFBSa0RVOG9mTm5HWTcxR1B2NmFI?=
 =?utf-8?B?ZFU0L3FYZytwcFZsOTZ1cGFQK1Zna0NCei9OVFFJVHNka0VpeUhJajBFVml1?=
 =?utf-8?B?eWdVZ0N1YUZIOE1TQ3BlMEpmZ243OENqRjRRV2gzNTYvSWc2bnFMRnZoamhY?=
 =?utf-8?B?bUZ4YTNiUHVrejNvRkpyamRmUEZpb2I3STBSdjBkUDhVK2V6Vk5hU09BbHJH?=
 =?utf-8?B?eit1Z0VBSjBwd21iZC9mNVUvTmVoTVNac1hqcXd4bHlhVStPeHdlRTEvVE9U?=
 =?utf-8?B?VHdDZmt2dGNGdXE1S0dqSVBEQUNlLzV1cUNGeG1jVkw1TERreit4Nm5RS0Ev?=
 =?utf-8?B?V1Mxd0NHa2dsc01uMWlmZUY1UXNJQ1FoNFljY0JJblFiVkhoanI5dEN3MUt1?=
 =?utf-8?B?Qmwzd0FOaWZVam9PNTRTMjdxMjVkTEg4YlNNQUZvMWxnWFRHV21iQlZpNWZh?=
 =?utf-8?B?U24rcFZPL0xMVGMyZFZhWTRyTkxjcE9Vbmg2SEg3U0lEdko3WTNYb25TQ0lL?=
 =?utf-8?B?clJ3SHh6cmt5YlNTVkZ6RXBZREU5VisvL2pVZXJyNE5hV2VnVzFIckJmUTBo?=
 =?utf-8?B?RThpeHM4d0twR25KRmxCN3ZZR1oxdDhFV3NjWisySDRYYThBbDlFSGczMlZ3?=
 =?utf-8?B?MWFGMTJscEx4eWZPRDJQR0FjRXNzTDNzZEFWMUVUK3gzRGNrUnExWXJ6RWQ5?=
 =?utf-8?B?Z200dG1CVXIyZU85VC9BcVkyZHRLaEw4SmQyeGcxdmt2djZLTmZOaUxmMllL?=
 =?utf-8?B?ZWRKNWtiR1NpSGFYZzF3a3RkQnlLWkdYWjdxM05qM3NrY3pZdGpDRXVnazhp?=
 =?utf-8?B?OGRrTGc3dlUwcWJjZkllL0xlcGNmZHliUjVEVUt2Qy9aelN2MW5IODBGTDNP?=
 =?utf-8?B?eWZSbWVHYUpPU3VpcytGSGt4Z2NjKzVqOFg2R2xxM0xVL3FEMThTNUNoQVRQ?=
 =?utf-8?B?bVZmZVBPdUxUeU1xdmcycHNCSnBtM3JhdzROalNhbnhZRGN0QnJiNnAveFdE?=
 =?utf-8?B?R1llTEdpenZldjNocWNXa2piT2o2bFRoQkpxZDZYZUtobFVTRXRpKzV5c1hL?=
 =?utf-8?B?NHpyVWxNd0cvVkRzYWhiR3UyOXpiQlRUN1lKOTlia3JhKzdRak1oSlFxMy9o?=
 =?utf-8?B?eHNSQjdTMjJ4NDFhVHk5Q0xhTDNxdzR1Q3Iyd2FSb1Y1OTJySmxYUU1IMkZ3?=
 =?utf-8?B?Wm9CU0l4VnJoU0dvNDhHWlFFTUY3U1JsbjRoNGF2TWQ0bjdFeFJHeFpNdVIr?=
 =?utf-8?B?TXhqeDVzK2xvZTFCRldCUElJc0RtNTNIZXZkMFZnT0NFUXFSOTZCWXExUERL?=
 =?utf-8?B?N1ZuZm8wZ1pRai9MeDUzaitOSVpUZUpXYS80cXJ2a2M4U3RCWHo2Z2R2Nzd0?=
 =?utf-8?B?RUxpekhyS0NoRFQwcnhSbjIrd2tWdXNTQWZKSkFkcHF1dGJkMy9CYjUwRGlP?=
 =?utf-8?B?ZEZOUWt5QTNMTmxtRGFrMDNoc2FQaEZDOWErcmIvTzYxcVQva1VFQksreXFt?=
 =?utf-8?B?UkZ6SFpLbk5DRTRkenp3NnNZaUsxNzEvYjYrNklmaTk4ZTMvazdzdmhuUFZJ?=
 =?utf-8?B?bUtrMmpEcUZlL3lpMGtFYmRJNUlqWEN6d1hXbEtiUlRmRm13elVrSUxKK1Q5?=
 =?utf-8?Q?AU5NdjB+t5xFXVppKvh25QXys?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230efa8c-6f08-471c-7c53-08de1db0a2f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 03:49:21.8252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ob3+50fWh6j/2pVF9zzz0Sbec60yaySXq1j9k0OjrWGRpvgUreFETdbbS8yV8HEmcSYXLrc8EzJGopRG9uIgVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7216
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMTAvMTBdIGRybS9pOTE1L2FscG06IEludHJvZHVjZSBoYXNf
YWxwbSB0byBkZWNvdXBsZQ0KPiBmcm9tIHByL3BzcjIvbG9iZg0KPiANCj4gRm9yIERQMi4xLCBB
TFBNIGlzIG9wdGlvbmFsIGFuZCB0aGVyZSBjYW4gYmUgc2NlbmFyaW8gd2hlcmUgcGFuZWwgcmVw
bGF5IHdpbGwNCj4gYmUgc3VwcG9ydGVkIHdpdGhvdXQgQUxQTS4gU28gZGVjb3VwbGUgQUxQTSBm
ZWF1cmUgYnkgaGFzX2FscG0gZmxhZyBmcm9tDQoNClR5cG8gKmZlYXR1cmUNCg0KPiByZWxhdGVk
IGRpc3BsYXkgZmVhdHVyZXMuDQo+IA0KPiBDYzogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dh
bmRlckBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gu
bWFubmFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfYWxwbS5jICAgICB8ICA3ICsrKy0tLQ0KPiAgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheV90eXBlcy5oICAgIHwgIDIgKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfcHNyLmMgICAgICB8IDIzICsrKysrKysrLS0tLS0tLS0tLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmggICAgICB8ICAxIC0NCj4gIDQgZmls
ZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiBpbmRleCAxNmZlNjZh
NzVmMDUuLmUxOTg4ZjQzY2JiOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9hbHBtLmMNCj4gQEAgLTM3Niw2ICszNzYsOCBAQCB2b2lkIGludGVsX2FscG1fbG9i
Zl9jb21wdXRlX2NvbmZpZyhzdHJ1Y3QgaW50ZWxfZHANCj4gKmludGVsX2RwLA0KPiANCj4gIAlj
cnRjX3N0YXRlLT5oYXNfbG9iZiA9IChjb250ZXh0X2xhdGVuY3kgKyBndWFyZGJhbmQpID4NCj4g
IAkJKGZpcnN0X3NkcF9wb3NpdGlvbiArIHdha2V0aW1lX2luX2xpbmVzKTsNCj4gKw0KPiArCWNy
dGNfc3RhdGUtPmhhc19hbHBtID0gY3J0Y19zdGF0ZS0+aGFzX2xvYmY7DQo+ICB9DQo+IA0KPiAg
c3RhdGljIHZvaWQgbG5sX2FscG1fY29uZmlndXJlKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAs
IEBAIC0zODUsOCArMzg3LDcNCj4gQEAgc3RhdGljIHZvaWQgbG5sX2FscG1fY29uZmlndXJlKHN0
cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ICAJZW51bSB0cmFuc2NvZGVyIGNwdV90cmFuc2Nv
ZGVyID0gY3J0Y19zdGF0ZS0+Y3B1X3RyYW5zY29kZXI7DQo+ICAJdTMyIGFscG1fY3RsOw0KPiAN
Cj4gLQlpZiAoRElTUExBWV9WRVIoZGlzcGxheSkgPCAyMCB8fCAoIWludGVsX3Bzcl9uZWVkc19h
bHBtKGludGVsX2RwLA0KPiBjcnRjX3N0YXRlKSAmJg0KPiAtCQkJCQkgICFjcnRjX3N0YXRlLT5o
YXNfbG9iZikpDQo+ICsJaWYgKCFjcnRjX3N0YXRlLT5oYXNfYWxwbSkNCj4gIAkJcmV0dXJuOw0K
PiANCj4gIAltdXRleF9sb2NrKCZpbnRlbF9kcC0+YWxwbS5sb2NrKTsNCj4gQEAgLTUxMCw3ICs1
MTEsNyBAQCB2b2lkIGludGVsX2FscG1fZW5hYmxlX3Npbmsoc3RydWN0IGludGVsX2RwDQo+ICpp
bnRlbF9kcCwgIHsNCj4gIAl1OCB2YWw7DQo+IA0KPiAtCWlmICghaW50ZWxfcHNyX25lZWRzX2Fs
cG0oaW50ZWxfZHAsIGNydGNfc3RhdGUpICYmICFjcnRjX3N0YXRlLQ0KPiA+aGFzX2xvYmYpDQo+
ICsJaWYgKCFjcnRjX3N0YXRlLT5oYXNfYWxwbSkNCj4gIAkJcmV0dXJuOw0KPiANCj4gIAl2YWwg
PSBEUF9BTFBNX0VOQUJMRSB8DQo+IERQX0FMUE1fTE9DS19FUlJPUl9JUlFfSFBEX0VOQUJMRTsN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eV90eXBlcy5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5
X3R5cGVzLmgNCj4gaW5kZXggMDA2MDAxMzRiZGEwLi4wYjYwYWRhNGI5NzIgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5o
DQo+IEBAIC0xMzkyLDYgKzEzOTIsOCBAQCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSB7DQo+ICAJ
CXU4IHNpbGVuY2VfcGVyaW9kX3N5bV9jbG9ja3M7DQo+ICAJCXU4IGxmcHNfaGFsZl9jeWNsZV9u
dW1fb2Zfc3ltczsNCj4gIAl9IGFscG1fc3RhdGU7DQo+ICsNCj4gKwlib29sIGhhc19hbHBtOw0K
PiAgfTsNCj4gDQo+ICBlbnVtIGludGVsX3BpcGVfY3JjX3NvdXJjZSB7DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBpbmRleCAwNTAxNGZmZTNjZTEuLmVl
YjQyNTViNWU1ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9wc3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bz
ci5jDQo+IEBAIC0xNjgxLDYgKzE2ODEsOCBAQCBzdGF0aWMgYm9vbCBpbnRlbF9zZWxfdXBkYXRl
X2NvbmZpZ192YWxpZChzdHJ1Y3QNCj4gaW50ZWxfZHAgKmludGVsX2RwLA0KPiAgCWNydGNfc3Rh
dGUtPmVuYWJsZV9wc3IyX3N1X3JlZ2lvbl9ldCA9DQo+ICAJCXBzcjJfc3VfcmVnaW9uX2V0X3Zh
bGlkKGludGVsX2RwLCBjcnRjX3N0YXRlLQ0KPiA+aGFzX3BhbmVsX3JlcGxheSk7DQo+IA0KPiAr
CWNydGNfc3RhdGUtPmhhc19hbHBtID0gaW50ZWxfYWxwbV9pc19wb3NzaWJsZShpbnRlbF9kcCk7
DQo+ICsNCj4gIAlyZXR1cm4gdHJ1ZTsNCj4gDQo+ICB1bnN1cHBvcnRlZDoNCj4gQEAgLTE3NTAs
MTEgKzE3NTIsMTcgQEAgX3BhbmVsX3JlcGxheV9jb21wdXRlX2NvbmZpZyhzdHJ1Y3QgaW50ZWxf
ZHANCj4gKmludGVsX2RwLA0KPiAgCQlyZXR1cm4gZmFsc2U7DQo+ICAJfQ0KPiANCj4gKwlpZiAo
aW50ZWxfYWxwbV9pc19wb3NzaWJsZShpbnRlbF9kcCkpDQo+ICsJCWNydGNfc3RhdGUtPmhhc19h
bHBtID0gYWxwbV9jb25maWdfdmFsaWQoaW50ZWxfZHAsDQo+IGNydGNfc3RhdGUsIHRydWUsDQo+
ICt0cnVlLCBmYWxzZSk7DQo+ICsNCj4gIAlpZiAoIWludGVsX2RwX2lzX2VkcChpbnRlbF9kcCkp
DQo+ICAJCXJldHVybiB0cnVlOw0KPiANCj4gIAkvKiBSZW1haW5pbmcgY2hlY2tzIGFyZSBmb3Ig
ZURQIG9ubHkgKi8NCj4gDQo+ICsJaWYgKCFjcnRjX3N0YXRlLT5oYXNfYWxwbSkNCj4gKwkJcmV0
dXJuIGZhbHNlOw0KDQpXaHkgcmV0dXJuIGZhbHNlIGhlcmUgZGlkbid0IHlvdSBzdGF0ZSB0aGF0
IEFMUE0gaXMgb3B0aW9uYWwgYW5kIFBSIGNhbg0KQmUgc3VwcG9ydGVkIHdpdGhvdXQgaXQuDQoN
ClJlZ2FyZHMsDQpTdXJhaiBLYW5kcGFsDQoNCj4gKw0KPiAgCWlmICh0b19pbnRlbF9jcnRjKGNy
dGNfc3RhdGUtPnVhcGkuY3J0YyktPnBpcGUgIT0gUElQRV9BICYmDQo+ICAJICAgIHRvX2ludGVs
X2NydGMoY3J0Y19zdGF0ZS0+dWFwaS5jcnRjKS0+cGlwZSAhPSBQSVBFX0IpDQo+ICAJCXJldHVy
biBmYWxzZTsNCj4gQEAgLTE3NzcsOSArMTc4NSw2IEBAIF9wYW5lbF9yZXBsYXlfY29tcHV0ZV9j
b25maWcoc3RydWN0IGludGVsX2RwDQo+ICppbnRlbF9kcCwNCj4gIAkJcmV0dXJuIGZhbHNlOw0K
PiAgCX0NCj4gDQo+IC0JaWYgKCFhbHBtX2NvbmZpZ192YWxpZChpbnRlbF9kcCwgY3J0Y19zdGF0
ZSwgdHJ1ZSwgdHJ1ZSwgZmFsc2UpKQ0KPiAtCQlyZXR1cm4gZmFsc2U7DQo+IC0NCj4gIAlyZXR1
cm4gdHJ1ZTsNCj4gIH0NCj4gDQo+IEBAIC00NDQ1LDE2ICs0NDUwLDYgQEAgdm9pZCBpbnRlbF9w
c3JfY29ubmVjdG9yX2RlYnVnZnNfYWRkKHN0cnVjdA0KPiBpbnRlbF9jb25uZWN0b3IgKmNvbm5l
Y3RvcikNCj4gIAkJCQkgICAgY29ubmVjdG9yLCAmaTkxNV9wc3Jfc3RhdHVzX2ZvcHMpOyAgfQ0K
PiANCj4gLWJvb2wgaW50ZWxfcHNyX25lZWRzX2FscG0oc3RydWN0IGludGVsX2RwICppbnRlbF9k
cCwgY29uc3Qgc3RydWN0DQo+IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpIC17DQo+IC0J
LyoNCj4gLQkgKiBlRFAgUGFuZWwgUmVwbGF5IHVzZXMgYWx3YXlzIEFMUE0NCj4gLQkgKiBQU1Iy
IHVzZXMgQUxQTSBidXQgUFNSMSBkb2Vzbid0DQo+IC0JICovDQo+IC0JcmV0dXJuIGludGVsX2Rw
X2lzX2VkcChpbnRlbF9kcCkgJiYgKGNydGNfc3RhdGUtPmhhc19zZWxfdXBkYXRlIHx8DQo+IC0J
CQkJCSAgICAgY3J0Y19zdGF0ZS0+aGFzX3BhbmVsX3JlcGxheSk7DQo+IC19DQo+IC0NCj4gIGJv
b2wgaW50ZWxfcHNyX25lZWRzX2FscG1fYXV4X2xlc3Moc3RydWN0IGludGVsX2RwICppbnRlbF9k
cCwNCj4gIAkJCQkgICBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkg
IHsNCj4gQEAgLTQ0NzAsNyArNDQ2NSw3IEBAIHZvaWQgaW50ZWxfcHNyX2NvbXB1dGVfY29uZmln
X2xhdGUoc3RydWN0DQo+IGludGVsX2RwICppbnRlbF9kcCwNCj4gDQo+ICAJaWYgKGludGVsX3Bz
cl9uZWVkc19hbHBtX2F1eF9sZXNzKGludGVsX2RwLCBjcnRjX3N0YXRlKSkNCj4gIAkJd2FrZV9s
aW5lcyA9IGNydGNfc3RhdGUtPmFscG1fc3RhdGUuYXV4X2xlc3Nfd2FrZV9saW5lczsNCj4gLQll
bHNlIGlmIChpbnRlbF9wc3JfbmVlZHNfYWxwbShpbnRlbF9kcCwgY3J0Y19zdGF0ZSkpDQo+ICsJ
ZWxzZSBpZiAoY3J0Y19zdGF0ZS0+aGFzX2FscG0pDQo+ICAJCXdha2VfbGluZXMgPSBESVNQTEFZ
X1ZFUihkaXNwbGF5KSA8IDIwID8NCj4gIAkJCSAgICAgcHNyMl9ibG9ja19jb3VudF9saW5lcyhj
cnRjX3N0YXRlLQ0KPiA+YWxwbV9zdGF0ZS5pb193YWtlX2xpbmVzLA0KPiAgCQkJCQkJICAgIGNy
dGNfc3RhdGUtDQo+ID5hbHBtX3N0YXRlLmZhc3Rfd2FrZV9saW5lcykgOg0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuaA0KPiBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmgNCj4gaW5kZXggNjIwYjM1OTI4ODMyLi4z
Y2I0ZmEyMGU0MjcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfcHNyLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9w
c3IuaA0KPiBAQCAtODAsNyArODAsNiBAQCB2b2lkIGludGVsX3Bzcl90cmlnZ2VyX2ZyYW1lX2No
YW5nZV9ldmVudChzdHJ1Y3QNCj4gaW50ZWxfZHNiICpkc2IsICBpbnQgaW50ZWxfcHNyX21pbl9z
ZXRfY29udGV4dF9sYXRlbmN5KGNvbnN0IHN0cnVjdA0KPiBpbnRlbF9jcnRjX3N0YXRlICpjcnRj
X3N0YXRlKTsgIHZvaWQgaW50ZWxfcHNyX2Nvbm5lY3Rvcl9kZWJ1Z2ZzX2FkZChzdHJ1Y3QNCj4g
aW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3IpOyAgdm9pZCBpbnRlbF9wc3JfZGVidWdmc19yZWdp
c3RlcihzdHJ1Y3QNCj4gaW50ZWxfZGlzcGxheSAqZGlzcGxheSk7IC1ib29sIGludGVsX3Bzcl9u
ZWVkc19hbHBtKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+IGNvbnN0IHN0cnVjdCBpbnRl
bF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKTsgIGJvb2wNCj4gaW50ZWxfcHNyX25lZWRzX2FscG1f
YXV4X2xlc3Moc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwNCj4gIAkJCQkgICBjb25zdCBzdHJ1
Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSk7DQo+IHZvaWQgaW50ZWxfcHNyX2NvbXB1
dGVfY29uZmlnX2xhdGUoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwNCj4gLS0NCj4gMi4yOS4w
DQoNCg==
