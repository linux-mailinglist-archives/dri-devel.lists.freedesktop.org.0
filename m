Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B137C5A081
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 21:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A509910E93E;
	Thu, 13 Nov 2025 20:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ThNKhTur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B922310E93F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 20:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763067503; x=1794603503;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MraYh4Y9pwsu2AxMspFuZKjI6++apFj1efCLDokd3iA=;
 b=ThNKhTur84WoMD+/oTamzPmJIk+RNfi1y20KvtTucf8gotCy18aTw9AS
 fPDnAgI8wHcEOAFTiO58X2WQKFNJmwRkKwYmr7KYWLL178qsCNCdYSP2F
 4CndoJGvv/99CmYuE/djq+Pup5TTd8wfq7PVbpWpC1WLZSzOpUCLPtAmI
 gZzsVxQq40q7ij01qifNCcWHcCV3tK8sHQNeZ5TM25cM07904OCwHBDDS
 FeE8Js16wcwx07FMg5WqHjab2QwzO5ekPv8EqhTbXEWJoph3OqtcFnWOR
 V0/YyB2pQxwdWTNuLyLqT38Bc46I8S0FQMq3ifWlzW2Mya1kgyuPF8qMg Q==;
X-CSE-ConnectionGUID: dfTYADSzQkmDgSxNhqCuJA==
X-CSE-MsgGUID: /43R8eqURZekmYuhDu5lrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76504545"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="76504545"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 12:58:22 -0800
X-CSE-ConnectionGUID: c0AG1UTnQqSl2qs9Dq9sVw==
X-CSE-MsgGUID: Tsge7dLbS82v1r6ym20QSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="212997181"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 12:58:22 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 12:58:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 12:58:22 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 12:58:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UKAhnONmIeFQrQVYrbDq+0jyQOcwJlw67qIC5TYn7jInAZ2SPYDsCJi2bV5LbIvtwjCfbJUsRNDNtW9yXXx1nSy0rEw8E91hNlxt2sC+072JKj1JtSQonJptKS4runQTSB0zqYkZt5NDXJPU+Qm8YXMpzA95MQdxM/sHExaTSNVf/yyvUHizqdzkU5LSK099seh/+pLzptXeQ3scJIgupx+BBgvhTssrhyi9KK6RW3YYeYLlmITvum8PLXCX9PDHfWV13dAWjHiLFpDXVpWYZpEWk+dNNsYgj+1jIBFyzi5AEw+WlTe0db/5nmGIJh5/TvPG7ZMWpo/fsvd0pt0xbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MraYh4Y9pwsu2AxMspFuZKjI6++apFj1efCLDokd3iA=;
 b=CFaoVAFTVinFdbYQZlAJozWuUZAr1+1881llgtNXwWJuH6dZbW5UTVKjzG46ffzC0hfyQ2QHBpUwvwWeC0bUWh2QDPZyJPLq8EBIJjOxb3uSoaA1oQK3oUdm00itXkFq4xDgGzRD2r0LQ2KOu99I5cCvTaPp61ziUGq3jv76pVbuanl/n60EnrV6fjAePVhnyT074cmXhaOh3acDzGyqCmc8mu4MxesXz+8xCk+B6gpuA1vAU/0/3HmegQUCiPZVtJJL18SPVPEc+mvYHf9Q6r31TY5jMeRV1S0s6BH2coUk2oIl7HzlIXodxHgT0Nn/GlS4XRwstWbPadu7eVIgeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by BL3PR11MB6483.namprd11.prod.outlook.com (2603:10b6:208:3be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 20:58:18 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%6]) with mapi id 15.20.9298.012; Thu, 13 Nov 2025
 20:58:17 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "airlied@redhat.com" <airlied@redhat.com>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "nirmoyd@nvidia.com" <nirmoyd@nvidia.com>
Subject: RE: [PATCH v6 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Thread-Topic: [PATCH v6 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Thread-Index: AQHcU8P68/QJa6PMwEe0In8Rn91S4LTu4YeAgAI3M6A=
Date: Thu, 13 Nov 2025 20:58:17 +0000
Message-ID: <PH0PR11MB5112C2E40D62064E25CA11ACFACDA@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20251027205323.491349-1-dongwon.kim@intel.com>
 <20251027205323.491349-3-dongwon.kim@intel.com>
 <80e30da1-1a66-47ba-a773-ea4e3ea94740@collabora.com>
 <c35336e9-a500-437b-8d25-38d57f4dc7d9@collabora.com>
In-Reply-To: <c35336e9-a500-437b-8d25-38d57f4dc7d9@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|BL3PR11MB6483:EE_
x-ms-office365-filtering-correlation-id: a5484bb9-83cc-48d9-6c90-08de22f75f02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cURwa1U2cWI3UkRsQ0VEMTdqZUhwRlErdUUrU1FjVDdyTzF1Smx4d3dtK1pr?=
 =?utf-8?B?KzJ2ZUdNTFlncnpEbDlHSGdoVlNrcUtITCsrcUNmRUM5cVBKRnFDaVN4WDAy?=
 =?utf-8?B?Qm9xUTVOZUFubDFDR28yaDYwWk9KM1Y1VEVYclhDVWdnemN1UVI1eXpxeFR6?=
 =?utf-8?B?STF3UGljK1UrdVpwNkUvS01DbHZNaTJ2M2swYUVpNDJibjhyMGpZZjYra2NG?=
 =?utf-8?B?eC8remQvK2NXTExnQVcrVzhvY0MyV0ZHWmhFbXRmbzRpU3hNcEdUM29uVUI3?=
 =?utf-8?B?eHRMeFZPM2NoK0RjeXREazZPU1Q5TURiQ3l2a2R0aHM0SWc5M2wwR3c4Z0NP?=
 =?utf-8?B?dllHUjdOSGFyNjNKamgwOHRKQ1U3Wmp6YS9uc0hGZ0ZmZmpvcmV2YmpTdmd5?=
 =?utf-8?B?SDAvWFR6KzNLOHBWdW5SQ0pIcXU2YmlpbDB0QXVxZjh6ZGtvYk9RNmhFOUhL?=
 =?utf-8?B?eXJEK3U4UkowUkoxUzAzWDR1NGdHQWNYRjM0dHgvRFQ4V3FxVkR3eXR1WStR?=
 =?utf-8?B?U0pUUk13cUI5N1UxaHVRMmpqSkN1OWtsR05Nb0o1WmdrUFYrWGlIbGFyV1Bn?=
 =?utf-8?B?OENqdVlmWmt4WGFtd1pBVFducXZQKzU3V2hQT0pBZk1PTnI3aVJqb3hKck5P?=
 =?utf-8?B?cklrK290SXFrSE82aDRCT0hvOXFDRWVJdDdqd2pGUm1jQ2pzS3Y3UklkTFNG?=
 =?utf-8?B?Y3RVVG1XaEdoZWx6S2t1SGtKK044ZzdjdEJHNWpDckFjMHZ0UjNXWTM4bmhH?=
 =?utf-8?B?cW51blAzUVJacWp1WEJJMWtYc29COTcvNTBtcHpmcEFJUWp1ei9lOEFWK1d5?=
 =?utf-8?B?K0tvRno5ZWxLSWtkWUJvL29nSlVLV1RZd0pSczdaU0syL09HMkpORVhlV3NJ?=
 =?utf-8?B?aEQzS2V0WjNiZmFLT2lGbFFSYUp3emlobldMYlN4eHhQamVPOUpGRjdtaE02?=
 =?utf-8?B?a1lYdHlyOWpMcEVwMVZnMVY5VUd2NXl2bmpCUEpyNHd1TWhiMGFBU3Vkd1lk?=
 =?utf-8?B?bGtITkRIOW03Q2xEYjRqOHYwaWFFWjdVOXplMFdLZVFTMDN6RlJiS1c2S0sx?=
 =?utf-8?B?MElvaUlDallDU2pSMk9DTlJ3bWRPa3Y0bHQrKzNVRTcxcVRYYnZBMGtCSDdT?=
 =?utf-8?B?QXlmdEZvQmt0NDZTR3pMSk4xYTdZZ09oYW5DeTV5em13MGp6MEhtYVZYSTBi?=
 =?utf-8?B?VDUrNXoyYU1FMEJBTzdtODZXZDdQNytNdW5udW9yc3d3cXBZYWlweW1VOFZi?=
 =?utf-8?B?WFBXWEJsaWQ3cHFZS3Bqc21XT1BWemxydTJkWTZDc1VYTWFVRnpWQ2NpaU1Q?=
 =?utf-8?B?cS9RZ0tLcDMwd2tzQzJ5TWx6ZjBIQlFXVXJuOVFSK1JFcHF3SFczZHJCWWFV?=
 =?utf-8?B?SVN1QjlKM3puRTB4cVdySms5Y1hjbnNnclhoTkluVVdHc21veEVpTURqRWxy?=
 =?utf-8?B?ejhsLzIzTVZtVDVTMGNZbUJlNGs0WU15VWwyUFFhcEdmSVlKTVN4OXJtVmtj?=
 =?utf-8?B?djVnZmZjTDBGUDNqNm1qSDZtcEJodFpBODlXa1ExTUE0R0k3TFRySTNMaVdu?=
 =?utf-8?B?V3p2aVp2TlVIcDc5QzBjQWxpKzd6ZU1JbHRkQVJXYnVVQXZqbHhSQWYyd2JJ?=
 =?utf-8?B?VVNMUStxZjJMV2F4ek1sZDBsNmorMzZ4NVhKcldkREw1dUorZkNGVlh3Qisv?=
 =?utf-8?B?YWllSEpOQUNQODJtcDNCTUtOZkdEZjZSNUNPVlk5VlR2UHJiTlZKUFIyMEdO?=
 =?utf-8?B?ekQ2OWtvc2E2MitFRktnY213VW50YnNuNTk4NEVTUUdUbWdmcFlWSjZoRWZs?=
 =?utf-8?B?ZXlrdkZKMFh4eU5tMllzSStJZldwWUR6R05UVm9BeVdUVUxUS0Z0eW9xekg5?=
 =?utf-8?B?NlV6b1NpWDE0VEU4UThSVTBaaEpZaWduRExBcG93cHJmMndRTktFUTlVVDBN?=
 =?utf-8?B?NC9QRkwxZkpnT201S25pbkhaUm96MFpGQm9nMHMxUzE5Y3hsYVNSdWtQU1RH?=
 =?utf-8?B?TVh3aERSRlpLVUl0Z0tiTVNhc1ZlZlRPNlliWW1CdHV0YmFGUXNRWXJmdFFu?=
 =?utf-8?Q?OuI1YD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2gycU95d2lScWZMQ1QvSzJCSHdvRjRjZ2V1dzIyVTRyS0Y0cGJaeDVWcVF6?=
 =?utf-8?B?Qy9NM2xPbHk0Zi8xZjllK2F3TmF2RkJTeXFQOUduTHpVWWtMNzZuSHVodFpP?=
 =?utf-8?B?QjduQy9HaXFaRWpBYzdWQnpCNVp3M1VuZ0N2d0ZBRDgrQ2ZnV3VqTTJiRFFy?=
 =?utf-8?B?b0JqeEtWQnozWTJSMUg0Y21TblUxT2VZMmp0dnFGbjJoM25TNVVWYStFeTZ4?=
 =?utf-8?B?OEFMM2h0VWFreUIrVVBwcFp2aDA3cHZ0alVRTndERzJzRnc4Vkk5SldtU3gw?=
 =?utf-8?B?SCtkTFhRVDUxNlhmNHcrcStRV3QzZUZpdHdsQTRBNXZQSXVqd2h4NVk4OEVy?=
 =?utf-8?B?VENiQzB6VWlOelhlYmdtb1FKam5SdWpHUlZBaVpINVBOcVB5dVZhZUlPR1BN?=
 =?utf-8?B?R2xNSnFUVkFZYzZPSWwxQSt0ZGo0NzdERWEzSTYzc0xiVkJtaUV5dldPaTk2?=
 =?utf-8?B?NHd3TXRvZ2V6S2dkSHc2YjhhTlVGS2RDR2FYWmROYmlnUi9XTTFMVlFhOTEr?=
 =?utf-8?B?TEZuejM0aXVVTGVGWE9qaElub2d4WjhYeXQyeXl1UUtDbFhJZzlyRFJHNitM?=
 =?utf-8?B?QjBjOEZzcGc1MFN2TVkzVU5aMTFhY0M4OCtvREkzaC9FaUFQUTROUWVqcmlm?=
 =?utf-8?B?REFuTjdJeTNLdmwrbDhkbFlXS0c1TTJHaEpScXVrVkhDMzlaRjZLT2gwUjRQ?=
 =?utf-8?B?QnJ1Y01VZG9vZnBzbm9WU2QwWHNJTGpoeTVUYW9OZnBIKzg0ZFVRaThzU0Nj?=
 =?utf-8?B?L0RJSWJvaW1BR0dNOEFPYnpHZnlpdDQ2UldXejhLSnpOK0FiNHpIdWdTSExE?=
 =?utf-8?B?b2tMbm9ET21WNzhyUFo1d0xxdXFMemZydlJITi9HTGhXVDhKOGtSMWVua01H?=
 =?utf-8?B?T3U1bEdOYnJBZ0hUdWNNd1NCUktrNEJlakJlSHpiUGxCWDZwcytpdTd6TnpT?=
 =?utf-8?B?VElEMHZJNG5mUm92aVM0TEFTeUNoY2FpMTMvUytMcWlmMXBDSy80WFl0cFk0?=
 =?utf-8?B?VU9PRURheXcwVHVwc2pLV1ZJeTVnVFljZ2JFWDBMSHM0eS9sQ2tJQ0NuMXpZ?=
 =?utf-8?B?RXE4WW1lenQ4bHlMa2hHSTRRSkFpTjRRaVR3UXRodHFBZ3lGbWc5a1V3Sk5p?=
 =?utf-8?B?SktqVG5rbjlRUWI0OERhK0pld0ZPSzRrVm8vOWRqeTcwbWtPdzlxQ2hJNWdV?=
 =?utf-8?B?Y1pDOStxSlc0RUZsUkdLdjB5eWkweUg5VXVMdlNZWlNRdUduMjV0RUZ3aDJ2?=
 =?utf-8?B?ZWxxTkFiSlpTVldkZnNVNDkrK28xdzArZlFqdWZNdVRLandTVG1sV0kvQ3Mv?=
 =?utf-8?B?VVJBbWVFaEFHeGt5MG5hb3FwZ1NRYTRwVE9BZC9JeWFZL3oxa2xoT2VIeldi?=
 =?utf-8?B?NTU0UytCaFc2ZVhzbWIvYmxtc01XSDhCemN3aVdNR1lsMWhnN2tiU0ZJVzRy?=
 =?utf-8?B?UVNjWGFwWGlMUW13WktRTzdUVmxSREVxK0tlZmFhOXdiWUFkM0ZpQkJ0ZHQv?=
 =?utf-8?B?K0U1WVY3dlRKb2s2eFRJa1JoSUlsY3Q4N3NwV3lKU3VIWS9pamR0YlNHVjdH?=
 =?utf-8?B?QUZ3bXhXMnFsSk45cThadVZpd2RZSFZaZGd6ZmdmTVNrUUdSSGpHMFhSZXhR?=
 =?utf-8?B?djAySHpXWUsxTTRoME5CRmhOTkNWZnJyNG95dVRBcFNjWitYWjdWOVA0S2JS?=
 =?utf-8?B?a3p4elhtOG91MmNtZ2t6VXhycjlmclkrdkgyY01vTkVpb0lFZmM5TjZmemVk?=
 =?utf-8?B?VGZRNG5Rd1FZdUNrUTB6WGIzb2lTN0JvbUpZMGFQaUVKbzFjNkhkMTRKN0xK?=
 =?utf-8?B?SDF1OXloSk9tc2V0MTBkS0xzK0NLMDBVMnduWlFlbHplTHRmVklNby9uTW5k?=
 =?utf-8?B?QytvS3J1dndqZXN3TUw1L2N1TDRuNVFTNmV3ek9mQnl6QUVSM2pNWHdja25F?=
 =?utf-8?B?UFN0b09yTlNKYmZWTDkvZlpncXJQallZMEhzYlh0RmtmaTFQNFNrWlRpR2M2?=
 =?utf-8?B?SE1NOG83dHR3MTU4dlhEWERYWXRKbGhySmJhWCtwT1U5Y1YvWENoVTZpNkwx?=
 =?utf-8?B?SHRLT01UZGFRL09KbllNOVFNOTRvdXczMzMyS1NEellCd2dzcnJnemhMenVo?=
 =?utf-8?Q?4mq1cLtCG1y+tuVLknQc3weAX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5484bb9-83cc-48d9-6c90-08de22f75f02
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 20:58:17.8980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ruh5beXMgBoLI2UcWb5Pzwk89xtlNmJ3q8s1PgX5HK6WWzXDQg6cGBuCXuSreOQmR9IDGbDIJmQ7NPxbeP/4HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6483
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

SGkgRG1pdHJ5LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERtaXRy
eSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTm92ZW1iZXIgMTIsIDIwMjUgMzowNyBBTQ0KPiBUbzogS2ltLCBEb25nd29uIDxkb25n
d29uLmtpbUBpbnRlbC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBhaXJsaWVkQHJlZGhhdC5jb207IGtyYXhlbEByZWRoYXQuY29tOyBuaXJtb3lkQG52aWRpYS5j
b20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAyLzNdIGRybS92aXJ0aW86IEFkZCBzdXBwb3J0
IGZvciBzYXZpbmcgYW5kIHJlc3RvcmluZw0KPiB2aXJ0aW9fZ3B1X29iamVjdHMNCj4gDQo+IE9u
IDExLzEyLzI1IDE0OjAzLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6DQo+ID4gT24gMTAvMjcvMjUg
MjM6NTMsIGRvbmd3b24ua2ltQGludGVsLmNvbSB3cm90ZToNCj4gPj4gKwkvKiBzdG9yZSB0aGUg
ZG1hYnVmIGltcG9ydGVkIG9iamVjdCB3aXRoIGl0cyBwYXJhbXMgdG8NCj4gPj4gKwkgKiB0aGUg
cmVzdG9yZSBsaXN0DQo+ID4+ICsJICovDQo+ID4+ICsJbWVtY3B5KCZiby0+cGFyYW1zLCAmcGFy
YW1zLCBzaXplb2YocGFyYW1zKSk7DQo+ID4NCj4gPiBOaXQ6IHVzaW5nIG1lbWNweSBpcyB1bm5l
Y2Vzc2FyeSBmb3Igc3RydWN0cywgImJvLT5wYXJhbXMgPSBwYXJhbXMiDQo+ID4gd291bGQgbG9v
ayBjbGVhbmVyDQoNClllYWgsIHlvdSBhcmUgcmlnaHQuIEkgd2lsbCB1cGRhdGUgaXQuDQoNCj4g
DQo+IFdvbid0IGh1cnQgdG8gYWRkIGhlbHBlciBmb3IgYWRkaW5nIG9iaiB0byBhIHJlc3RvcmUg
bGlzdCBzaW5jZSBzYW1lIGNvZGUNCj4gcmVwZWF0cyB0d28gdGltZXMuDQo+IA0KPiB2aXJ0aW9f
Z3B1X2FkZF9vYmplY3RfdG9fcmVzdG9yZV9saXN0KHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAq
dmdkZXYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZp
cnRpb19ncHVfb2JqZWN0ICpibykgew0KPiAgIC4uLg0KPiB9DQoNCk9rLCBJIHdpbGwuDQoNCj4g
DQo+IC0tDQo+IEJlc3QgcmVnYXJkcywNCj4gRG1pdHJ5DQo=
