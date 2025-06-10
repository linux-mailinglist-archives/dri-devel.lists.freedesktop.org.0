Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E76CAD397B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA3E10E566;
	Tue, 10 Jun 2025 13:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMO/WIu4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B333F10E566;
 Tue, 10 Jun 2025 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749562758; x=1781098758;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e1bSMsjNgg8a+954tE1gjxPX+JcPGxY5erkW4qrQp7E=;
 b=lMO/WIu45Dw9TSgQpFIanO3F8n+GuRTsHRluZGC6VR8j1dgdpXY6mVrd
 +811q44Wf+GKarGQ+TGTR8gvePpph2zlnXUMuRkE5i+AQqLY1R9XlJwff
 8Tk81i0rXqoNXgJbNup0uEDvn7NrfV8xBSJD2g8BnhDehHzAF0YsDP4Ln
 P2g8sbcgHnhQ2x1AMk1F1nhRabPeG4BKmiX7DGeVULdYecNuyNjaTh9Aq
 ZqYIhRkaA02koW9AR82rLsrCGWhmfALsqkvYgL2JBGIhxTU6W5jlNjjhh
 ghgi5wAFBqRM1S35mFEGZTiTsXz5nFCp+/EpiwKFCOM7bYpMGlS9mTqNV Q==;
X-CSE-ConnectionGUID: gr/MdkayTlql0s7h5e9tSA==
X-CSE-MsgGUID: 1n3Ea9NJQISGuvWJr3bV6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51665180"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="51665180"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 06:39:18 -0700
X-CSE-ConnectionGUID: Kt5ntsbaSgyP5JlIqUB0XQ==
X-CSE-MsgGUID: 4iIWUzoVS12Pp/ebIubVKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="146817160"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 06:39:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 06:39:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 06:39:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.80) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 06:39:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uh3BXt4yXHzEH8VxgXUMkHHmrCoHOXUBEnrYWbk7kHqglNbBt4j8vsa8DJyS8KHIv33fYQCd0+lwABe0cfDnyjrrAaGqel03LnQ6CVwPSTuoREUb9phoMjft0yeOyc8SFRsXvJm8Xqfhl/L58H3CWEV43wX4WdS8U+3rp0YNTU9PEzO3QtpzsCcywkJoMFlcazodFKSEelYwz9uOZ0YRpEI2HqmUBXx67a4V5ATGICbA2tMXPsNcsoqN76ixhx0vCU7jytyt7j6CF38gIi2iX4b1KffBeqlFHzuOtEQItNqG1ta7zSKhVKp54i3YMGjIuyODZ0koBbM6jxt9TS+1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1bSMsjNgg8a+954tE1gjxPX+JcPGxY5erkW4qrQp7E=;
 b=HTehSDQMJTBncyzGB6X1t5eaXuylTK7vLCXPboOJstB/ULMwFyywA05X0qnXi11GUpn/+Cm8QsQcP/WdRE0it+jA4ycHNER3iGBJe6PIe1yD7vb5IoiW+hXvrQ8/Jf+MzjW9iIoQjDQhmMzbnFmSXapqBwOANMDyeY/CiJuuCfF/3Itmdg6dUMs4colwc2/5prFyyEIYLPm0wUkELrHhcWoYuvYuvb5BuV3UrjkZOL5HKewsC4th5eKGVdoo0zlA4TH9Zv89gxPGGtcefTRz8qn3qx+CHPt0xDe3jUOriqwTBkEuLMVgbRvTC9ToQ5G7b2GBkdT2C6P8wvY/UYXtmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9279.namprd11.prod.outlook.com (2603:10b6:208:561::15)
 by SA1PR11MB6941.namprd11.prod.outlook.com (2603:10b6:806:2bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Tue, 10 Jun
 2025 13:39:01 +0000
Received: from IA4PR11MB9279.namprd11.prod.outlook.com
 ([fe80::e3e9:ca34:caeb:1320]) by IA4PR11MB9279.namprd11.prod.outlook.com
 ([fe80::e3e9:ca34:caeb:1320%7]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 13:39:01 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v4 5/5] drm/i915/dp: Disable the AUX DPCD probe quirk if
 it's not required
Thread-Topic: [PATCH v4 5/5] drm/i915/dp: Disable the AUX DPCD probe quirk if
 it's not required
Thread-Index: AQHb2T3uftmeaA0bzkaZzbjgJGAdErP8ZuJQ
Date: Tue, 10 Jun 2025 13:39:01 +0000
Message-ID: <IA4PR11MB92798E24D1D7C055690222B5EF6AA@IA4PR11MB9279.namprd11.prod.outlook.com>
References: <20250605082850.65136-6-imre.deak@intel.com>
 <20250609125556.109538-2-imre.deak@intel.com>
In-Reply-To: <20250609125556.109538-2-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9279:EE_|SA1PR11MB6941:EE_
x-ms-office365-filtering-correlation-id: a1870531-c370-4307-30b5-08dda82428b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?b085ZFN4SE5RWWRPdVBYSjl3eC9iNUI3NXh2c01NeUtxQmNFMW9SMFBoZ3Bu?=
 =?utf-8?B?dU1BUkdVeFpualZZUm1Na2lCRGxVenI0a3d4VktCVmZuQWQ0OHNxRW42Vjdw?=
 =?utf-8?B?TUxSZVBJRlBOMVhhM2hmTENKcDkzQ1ZleWhtQmEzNTdkY0VzVHdIWjNsQkk4?=
 =?utf-8?B?d2hobzZmR3JXQlJMcXExNDEvS0lWTmVndmVIRGpwN0c0dkl4bCtKV1J0bWRB?=
 =?utf-8?B?Q2F6YjVZVzNqQXc4cDlZaGN3cjN3OEIyVmtVS0hVNER0U2dwOVZmdnBDNVRY?=
 =?utf-8?B?Z3loOVNPSWNBYmlGTThLQlpqVUpnc0s0S2RNaElmdENGVkJpcGxBNngzRXQw?=
 =?utf-8?B?N0VmN0J5cnd4VVM3U2h4TUFHUjdkUWEwWkxQTi9MWHhmbFhxVU9YRU1wRHF5?=
 =?utf-8?B?L1V2ZXJmQ2tQVmpkQnEvajN0RDlWR0gwM0JqZ2t3dTRSQ1RMemFnZWE2bmhy?=
 =?utf-8?B?c0RJTEtkcFQ4Qno4elBuT1VTaE5IWjhXTDVUZEljTmdFSWVPT1VLNE1TYU1p?=
 =?utf-8?B?emc1NlNXWE8xMk5KMHVFcmpFN2NFSjBSQ0haU3R2dUZUdU5SM0FIUGZWUnZa?=
 =?utf-8?B?Q1NPZVNidEVTTFdTTFUxMEJPZTV5WnpxL0c3d3VDODNvbUtkOUhqTnBXNnBI?=
 =?utf-8?B?blVqaC9sT2RUMGU1WlRHNXNJbjFKSDYveUt4WCtmeTBGbUV5d1VIVzhjTkYv?=
 =?utf-8?B?dXYvaGQwYm1LWFl5Q0R1bVhIUVlEaDhDQ0xuclVXcXRMRWhkSGZkWEcwbUxi?=
 =?utf-8?B?NTEvT3N0MHpJazZaeWtLWXYzMnVoNlYxdG55VHFzTVVVakF5N0k1cVN1UEQ0?=
 =?utf-8?B?QVhCbzdzUWszOHBQZFRnQkV6alg5TmYxblg5OHI4bTZkZzNxM1U1a08za3Zj?=
 =?utf-8?B?ZFF0M2hzZ3pNbUgwQWlaNmNGSzgwOExyM0RJbk03T0JYaGpUcGluV3E1cHRv?=
 =?utf-8?B?YTBYdGJ3dEJyR2hQUXRHODlZQzhTc0M2VjI0ZmRzdVU0dExQRGtBam5MYjYw?=
 =?utf-8?B?WVBubzZWYko4TE92RG9JVW0wTjJrSHlOR1FsbXQzYi82WVpOaEZvb2dkRWpv?=
 =?utf-8?B?cDZIOTFEWkxFeStBNU1scjN6UlAybzErU3o4TVI5UjArQnIzUkcwUnZONXE1?=
 =?utf-8?B?d3pRMzFPSGl1RzVsNExTemdvZWUxMyt6dGpxbG9IOEZiOW4rTnVia0lDektO?=
 =?utf-8?B?WDdoMDlldjNDSjZRZTNldnpnbi9hbXlmeEIwUkFaOGFQZzlhcUQyQXBCMFhD?=
 =?utf-8?B?NWlqRFVkL2FoU0wycW04dndoLzc0SVdHSWIzVG5IWUFUb2gra2l6TGsxY1Nv?=
 =?utf-8?B?S0pRWFgxdG5uZm9XOVVKcEFoek5lYWFGUm1xV2VnOE9WU1BtR0tBMHpsTUJu?=
 =?utf-8?B?ZDRPM2RCKzFkNCs4emlYeEp1WHA2MVJzb1FOYzNnMnZ2aXJsTFl2S1dzYlhH?=
 =?utf-8?B?VUpDbGhKNEp4V2ZQT2c4SERUeURqTEtLMForbzZHMGhjN0VDYWY0aVZEU3Fr?=
 =?utf-8?B?S1ZGQklsSXRhWEkrSysyaXhEWWZZSUVtZW9QVVpxQVV5UDVrMnczcHFNZzQ5?=
 =?utf-8?B?TnhLS3diQzlpMlZ3NS9GY3k0RENwTVhuSi9HaGpIb0Z2Qk8vL20wdlFqcDdH?=
 =?utf-8?B?SjY0OXRQUUR3UFpkNE90NHZNU3pHTjZVTkxlSFRpN3NBQkxsRThDQ2Q3eWZh?=
 =?utf-8?B?L2tWbWZVajRLUWZxcHV3aVY2b0kxTFJ0dWVpNFE1THB2V0lOVTJFOHlabHAz?=
 =?utf-8?B?UG1xT2YzbnNPRjJDaElhNTA3Y3cvVHNCMXNZaE9xemN0REdpQ2NhR3BFa25N?=
 =?utf-8?B?anAxa3BGWTdISyt6UW0wUFhJaUtaMlBoc2U4akREZmhWMlVqYk94eXUrdmZG?=
 =?utf-8?B?U2MzTzVuTzVCbUxRTnlhVFZhSXNUbkFIQW1uR0YxV2ZqQTAwdFBYY2VvckVK?=
 =?utf-8?B?bE1TOXRiTU5jVlMwZTNZclM0emd3cHdxVUtYMDVHZTFERk8zQ1NkbTNDcFQr?=
 =?utf-8?B?SHlMYXdzeDF3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9279.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0QzN3lHVjJyQld6NmpEYUg3YjRJYUFFcjFKL3IxeGlBR3pRU09Odk9JbFBS?=
 =?utf-8?B?b29uWTlkcm1TS2o2RlRUUTJNSlppSzY0clViandvNXlKaHkzSlZBcStuSzNx?=
 =?utf-8?B?UlJUWWx3M2E5NXF4Z0NkVTc4S2x0S25nUExwRjFBbTBEOVdIQ2tKOEJOZEV2?=
 =?utf-8?B?aXZZTXhYUng2bm5KMjJmSjhHNWdPeU9aNGNmMHVSazFhUWIxQXM0TkU3UGo3?=
 =?utf-8?B?ZlkvbjBGeC9mcElHdFhtbFFYa1luSzBxSXhQMWxtY0dUVjhJeWZBbG1paFFF?=
 =?utf-8?B?ZTVvSEEzUGlUaS9RWkI4dlRlOG9WTEpVU3FIcjR1czBZUVdZSDNhL3NpRGJz?=
 =?utf-8?B?VWc1WFR3ZUpEczlaU0NFQWxQblhhUndRTTR3cURONzJIamdqRjh3ZHE5L1Vn?=
 =?utf-8?B?Y1pwdlZwZlk2MFlVSUZYN2t3VVRENXhXTE5TUGNVN3FiQnJvcjBmMldMOEJG?=
 =?utf-8?B?cXc4dzJoN1U4b1NaV2U2YVB2VU96Vi9UQWJsa24vbjdFcWptZHVTOVEzZnNP?=
 =?utf-8?B?dGFURnFPMEU4SXVqWnpYQ2pXY0VGbURxSGx4dlRPNmduRXRxOTg2VlVybUcy?=
 =?utf-8?B?cno3NzFxZ1ZOc1JlcHhHUTdIUWJ5UFNLbTZ5dGJybytRV1ZHNU40UVVSTE8y?=
 =?utf-8?B?dWk3K3NKSk1jTGVBS2pRNEs1d2xZU0EvcC9YSE1SVnJYNTloM2RtdlNQVDc1?=
 =?utf-8?B?V0VDQ2hNc0hBa0svZURiZHlzcml5MWswRUtDRjhhMnJQNmZ0RTVqTjg3YW0w?=
 =?utf-8?B?UG9TaDJsbFlUazRtRGY0dUdFSWRRMUUyV1pQb09CSkhlMU9VWTdidmpTTVRm?=
 =?utf-8?B?SUpLYTRJWjJWV2l0VHhqaFh4YWdoTVBidHBoY2F5U0RNZG9QSm9iVmFBY012?=
 =?utf-8?B?Zm01eXZqZ2lEUWRBaVFqY1hPcWpmVFBpMzJLN2hnNUR1MEl6U1VYU2FVYStF?=
 =?utf-8?B?Z29BT2QrRHhUSGxkb21BRitSZG9WM0pGWjlPd0ZsN1FHUGYwZEl4c1AwOTdU?=
 =?utf-8?B?MC80cFprWVBhMGR1Ym1mWm5FeVArYW1mRFpTVHFLQ1p0RUtoTnpucFNaV2ZV?=
 =?utf-8?B?bll1eFZZT0I3L0w3QmV5ZHhVUkdoZjIyTDZmbGs0S1N0NmRKcEFWcUdLdkti?=
 =?utf-8?B?OFlMK1REYXVYVEthT01IaWhjbFlYZWJQWE56UG05ck9LV2tBeXNnUHhyQ3FH?=
 =?utf-8?B?WGp4ei9XRG8xWVBpYklGQWVsUXVaamhGa1VteE9md3ZMWGxnR3Uvb1JoeEZZ?=
 =?utf-8?B?Y0s2OXVRUDdJTTF4YzhjUURHWmxCZGRSQjlVWDdYOHFvR2srM3NHd0k3ZXRs?=
 =?utf-8?B?T3ZJMTc5WWlUL1YrRVBuS3I5TXNVaVdzREtvUlFaVjh2K2lqUTAvVW5oRFNT?=
 =?utf-8?B?cGpQK3lTVTRiVVJMeSsvWEVvMzU5REhXbW85S3FLVjcxZVNVZTE3MlphVWd5?=
 =?utf-8?B?eUF6aFN5dy9rUWZ4Q2xqSFlac0wxWmFONmEvMVAxeExHNFZTdUx0b2NDS3J0?=
 =?utf-8?B?Q3N1UlNIK3A4NE1KYnZ2aUlnc2ZHVnl6Q1FBUlZlOFIvK0tvelpGakVxcDFC?=
 =?utf-8?B?SEh4a0dHZ3hpU3FSRGVGQU9zYzdIcWhDbGx5RVAzUERoZTVQem1xaytWaEVH?=
 =?utf-8?B?Qy9IOHdoS0tUVnBBQUw2MTNPZ1lQZmtpdkRBaGxUd0IxVDJDNmN6MS9uT2hi?=
 =?utf-8?B?a1ZJNFNVblY4NllGQXcyTlRJelF3b011cVJ0TGtLVzdVa1FDOTZoWTBneStX?=
 =?utf-8?B?RmhZcG1jNmduR2hEV2lyMENLVFBIZjFUQUE4YldLdnUvaVJKb3RQSVFYdlY4?=
 =?utf-8?B?MEQxeTcvRXIvcmRMREJBTmZ3UlB6T3ZqNVFuN0Y0Tm9GNVk1bUJPUGpCZklh?=
 =?utf-8?B?Z2RPZXhrajN5c3Foa1g3UU1NK1ZyRi9rbm9nc0RtaFZoUkR5Z2VMdHliT2F6?=
 =?utf-8?B?RnNIQklpcGZuU2NldnBhdXYxU3lhMEhVZmluc2xQOGY2S0VhY2FlYUU2SENO?=
 =?utf-8?B?UDRlMW1wTFFDdE82ZzN5WXhETjg2cW9ScWIxenBhTmF1cmkwSzZOTXU1WWht?=
 =?utf-8?B?ZnB3SFZpTGZhaldmeHhpWkVheWYwcnhlM29LSmIrRC9BbGtRR3lvMGdEZThD?=
 =?utf-8?Q?jt9dTBrfMH6L0YnhOQA3YMk0u?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9279.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1870531-c370-4307-30b5-08dda82428b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 13:39:01.1398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jYLGZ4JLRMqoFlnaRpJ3nnpJtv1915c7KBhKEDYzCE6N8Zg2Tgc8sYEMDbIHAOG9F9shVqL05yB6CSR0UV1D0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6941
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEltcmUgRGVhaw0K
PiBTZW50OiBNb25kYXksIDkgSnVuZSAyMDI1IDE1LjU2DQo+IFRvOiBpbnRlbC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+OyBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50
ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjQgNS81XSBkcm0vaTkxNS9kcDogRGlzYWJsZSB0
aGUgQVVYIERQQ0QgcHJvYmUgcXVpcmsgaWYgaXQncyBub3QgcmVxdWlyZWQNCj4gDQo+IFJlYWRp
bmcgRFBDRCByZWdpc3RlcnMgaGFzIHNpZGUtZWZmZWN0cyBhbmQgc29tZSBvZiB0aGVzZSBjYW4g
Y2F1c2UgYSBwcm9ibGVtIGZvciBpbnN0YW5jZSBkdXJpbmcgbGluayB0cmFpbmluZy4gQmFzZWQg
b24gdGhpcyBpdCdzDQo+IGJldHRlciB0byBhdm9pZCB0aGUgcHJvYmluZyBxdWlyayBkb25lIGJl
Zm9yZSBlYWNoIERQQ0QgcmVnaXN0ZXIgcmVhZCwgbGltaXRpbmcgdGhpcyB0byB0aGUgbW9uaXRv
ciB3aGljaCByZXF1aXJlcyBpdC4gVGhlIG9ubHkNCj4ga25vd24gcHJvYmxlbWF0aWMgbW9uaXRv
ciBpcyBhbiBleHRlcm5hbCBTU1Qgc2luaywgc28ga2VlcCB0aGUgcXVpcmsgZGlzYWJsZWQgYWx3
YXlzIGZvciBlRFAgYW5kIE1TVCBzaW5rcy4gUmVlbmFibGUgdGhlIHF1aXJrDQo+IGFmdGVyIGEg
aG90cGx1ZyBldmVudCBhbmQgYWZ0ZXIgcmVzdW1pbmcgZnJvbSBhIHBvd2VyIHN0YXRlIHdpdGhv
dXQgaG90cGx1ZyBzdXBwb3J0LCB1bnRpbCB0aGUgc3Vic2VxdWVudCBFRElEIGJhc2VkIGRldGVj
dGlvbi4NCj4gDQo+IHYyOiBBZGQgYSBoZWxwZXIgZm9yIGRldGVybWluaW5nIHRoZSBuZWVkL3Nl
dHRpbmcgdGhlIHByb2JpbmcuIChKYW5pKQ0KPiANCj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmls
bGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1
bGFAbGludXguaW50ZWwuY29tPg0KDQpKYW5pIGhhcyBhbHJlYWR5IHJldmlld2VkIG1vc3Qgb2Yg
dGhlIHBhdGNoIGFuZCBub3cgdGhhdCB0aGlzIGNoZWNrIGZvciBkcGNkIHByb2JlIHJlcXVpcmVt
ZW50IGlzIGluIHBsYWNlLCB0aGUgcGF0Y2ggbG9va3Mgb2sgdG8gbWUuDQoNClJldmlld2VkLWJ5
OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6
IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAgICB8IDMxICsrKysrKysrKysrKysrKysrKy0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmggICAgICB8ICAxICsN
Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfYXV4LmMgIHwgIDIgKysg
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaG90cGx1Zy5jIHwgIDYgKysrKw0K
PiAgNCBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYw0KPiBpbmRleCAyMDhhOTUz
YjA0YTJmLi5jMDg5MDM2YTc0NWZkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcC5jDQo+IEBAIC01NzkxLDYgKzU3OTEsMjggQEAgaW50ZWxfZHBfZGV0ZWN0X3Nk
cF9jYXBzKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApDQo+ICAJCWRybV9kcF9hc19zZHBfc3Vw
cG9ydGVkKCZpbnRlbF9kcC0+YXV4LCBpbnRlbF9kcC0+ZHBjZCk7ICB9DQo+IA0KPiArc3RhdGlj
IGJvb2wgaW50ZWxfZHBfbmVlZHNfZHBjZF9wcm9iZShzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2Rw
LCBib29sDQo+ICtmb3JjZV9vbl9leHRlcm5hbCkgew0KPiArCXN0cnVjdCBpbnRlbF9jb25uZWN0
b3IgKmNvbm5lY3RvciA9IGludGVsX2RwLT5hdHRhY2hlZF9jb25uZWN0b3I7DQo+ICsNCj4gKwlp
ZiAoaW50ZWxfZHBfaXNfZWRwKGludGVsX2RwKSkNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArDQo+
ICsJaWYgKGZvcmNlX29uX2V4dGVybmFsKQ0KPiArCQlyZXR1cm4gdHJ1ZTsNCj4gKw0KPiArCWlm
IChpbnRlbF9kcC0+aXNfbXN0KQ0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsNCj4gKwlyZXR1cm4g
ZHJtX2VkaWRfaGFzX3F1aXJrKCZjb25uZWN0b3ItPmJhc2UsDQo+ICtEUk1fRURJRF9RVUlSS19E
UF9EUENEX1BST0JFKTsgfQ0KPiArDQo+ICt2b2lkIGludGVsX2RwX2RwY2Rfc2V0X3Byb2JlKHN0
cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsIGJvb2wNCj4gK2ZvcmNlX29uX2V4dGVybmFsKSB7DQo+
ICsJZHJtX2RwX2RwY2Rfc2V0X3Byb2JlKCZpbnRlbF9kcC0+YXV4LA0KPiArCQkJICAgICAgaW50
ZWxfZHBfbmVlZHNfZHBjZF9wcm9iZShpbnRlbF9kcCwgZm9yY2Vfb25fZXh0ZXJuYWwpKTsgfQ0K
PiArDQo+ICBzdGF0aWMgaW50DQo+ICBpbnRlbF9kcF9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0
b3IgKl9jb25uZWN0b3IsDQo+ICAJCXN0cnVjdCBkcm1fbW9kZXNldF9hY3F1aXJlX2N0eCAqY3R4
LA0KPiBAQCAtNTkxOSw2ICs1OTQxLDggQEAgaW50ZWxfZHBfZGV0ZWN0KHN0cnVjdCBkcm1fY29u
bmVjdG9yICpfY29ubmVjdG9yLA0KPiAgCWlmIChzdGF0dXMgIT0gY29ubmVjdG9yX3N0YXR1c19j
b25uZWN0ZWQgJiYgIWludGVsX2RwLT5pc19tc3QpDQo+ICAJCWludGVsX2RwX3Vuc2V0X2VkaWQo
aW50ZWxfZHApOw0KPiANCj4gKwlpbnRlbF9kcF9kcGNkX3NldF9wcm9iZShpbnRlbF9kcCwgZmFs
c2UpOw0KPiArDQo+ICAJaWYgKCFpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHApKQ0KPiAgCQlkcm1f
ZHBfc2V0X3N1YmNvbm5lY3Rvcl9wcm9wZXJ0eSgmY29ubmVjdG9yLT5iYXNlLA0KPiAgCQkJCQkJ
IHN0YXR1cywNCj4gQEAgLTU5NDksNiArNTk3Myw4IEBAIGludGVsX2RwX2ZvcmNlKHN0cnVjdCBk
cm1fY29ubmVjdG9yICpfY29ubmVjdG9yKQ0KPiAgCQlyZXR1cm47DQo+IA0KPiAgCWludGVsX2Rw
X3NldF9lZGlkKGludGVsX2RwKTsNCj4gKw0KPiArCWludGVsX2RwX2RwY2Rfc2V0X3Byb2JlKGlu
dGVsX2RwLCBmYWxzZSk7DQo+ICB9DQo+IA0KPiAgc3RhdGljIGludCBpbnRlbF9kcF9nZXRfbW9k
ZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKl9jb25uZWN0b3IpIEBAIC02MzIxLDEwICs2MzQ3LDEx
IEBAIGludGVsX2RwX2hwZF9wdWxzZShzdHJ1Y3QNCj4gaW50ZWxfZGlnaXRhbF9wb3J0ICpkaWdf
cG9ydCwgYm9vbCBsb25nX2hwZCkNCj4gIAkgKiBjb21wbGV0ZSB0aGUgRFAgdHVubmVsIEJXIHJl
cXVlc3QgZm9yIHRoZSBsYXR0ZXIgY29ubmVjdG9yL2VuY29kZXINCj4gIAkgKiB3YWl0aW5nIGZv
ciB0aGlzIGVuY29kZXIncyBEUFJYIHJlYWQsIHBlcmZvcm0gYSBkdW1teSByZWFkIGhlcmUuDQo+
ICAJICovDQo+IC0JaWYgKGxvbmdfaHBkKQ0KPiArCWlmIChsb25nX2hwZCkgew0KPiArCQlpbnRl
bF9kcF9kcGNkX3NldF9wcm9iZShpbnRlbF9kcCwgdHJ1ZSk7DQo+ICsNCj4gIAkJaW50ZWxfZHBf
cmVhZF9kcHJ4X2NhcHMoaW50ZWxfZHAsIGRwY2QpOw0KPiANCj4gLQlpZiAobG9uZ19ocGQpIHsN
Cj4gIAkJaW50ZWxfZHAtPnJlc2V0X2xpbmtfcGFyYW1zID0gdHJ1ZTsNCj4gIAkJaW50ZWxfZHBf
aW52YWxpZGF0ZV9zb3VyY2Vfb3VpKGludGVsX2RwKTsNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RwLmgNCj4gaW5kZXggZWZmMzQxNGMwNWRiZi4uMDY1N2Y1NjgxMTk2
NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuaA0KPiBAQCAt
MjEzLDUgKzIxMyw2IEBAIGludCBpbnRlbF9kcF9jb21wdXRlX21pbl9oYmxhbmsoc3RydWN0IGlu
dGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsDQo+ICAJCQkJY29uc3Qgc3RydWN0IGRybV9jb25u
ZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUpOw0KPiANCj4gIGludCBpbnRlbF9kcF9kc2NfYnBwX3N0
ZXBfeDE2KGNvbnN0IHN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmNvbm5lY3Rvcik7DQo+ICt2b2lk
IGludGVsX2RwX2RwY2Rfc2V0X3Byb2JlKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsIGJvb2wN
Cj4gK2ZvcmNlX29uX2V4dGVybmFsKTsNCj4gDQo+ICAjZW5kaWYgLyogX19JTlRFTF9EUF9IX18g
Ki8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBf
YXV4LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2F1eC5jDQo+IGlu
ZGV4IGJmOGU4ZTBjYzE5YzkuLjdiZWM5NjRjMDQ5NmYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfYXV4LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9hdXguYw0KPiBAQCAtODM1LDYgKzgzNSw4IEBAIHZv
aWQgaW50ZWxfZHBfYXV4X2luaXQoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkNCj4gDQo+ICAJ
aW50ZWxfZHAtPmF1eC50cmFuc2ZlciA9IGludGVsX2RwX2F1eF90cmFuc2ZlcjsNCj4gIAljcHVf
bGF0ZW5jeV9xb3NfYWRkX3JlcXVlc3QoJmludGVsX2RwLT5wbV9xb3MsIFBNX1FPU19ERUZBVUxU
X1ZBTFVFKTsNCj4gKw0KPiArCWludGVsX2RwX2RwY2Rfc2V0X3Byb2JlKGludGVsX2RwLCB0cnVl
KTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgZW51bSBhdXhfY2ggZGVmYXVsdF9hdXhfY2goc3RydWN0
IGludGVsX2VuY29kZXIgKmVuY29kZXIpIGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2hvdHBsdWcuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfaG90cGx1Zy5jDQo+IGluZGV4IDc0ZmUzOTg2NjNkNjMuLjkwMWZkYTQzNGFmMTIg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaG90cGx1
Zy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaG90cGx1Zy5j
DQo+IEBAIC0zMyw2ICszMyw3IEBADQo+ICAjaW5jbHVkZSAiaW50ZWxfZGlzcGxheV9jb3JlLmgi
DQo+ICAjaW5jbHVkZSAiaW50ZWxfZGlzcGxheV9ycG0uaCINCj4gICNpbmNsdWRlICJpbnRlbF9k
aXNwbGF5X3R5cGVzLmgiDQo+ICsjaW5jbHVkZSAiaW50ZWxfZHAuaCINCj4gICNpbmNsdWRlICJp
bnRlbF9oZGNwLmgiDQo+ICAjaW5jbHVkZSAiaW50ZWxfaG90cGx1Zy5oIg0KPiAgI2luY2x1ZGUg
ImludGVsX2hvdHBsdWdfaXJxLmgiDQo+IEBAIC05MDYsOSArOTA3LDE0IEBAIHZvaWQgaW50ZWxf
aHBkX3BvbGxfZW5hYmxlKHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5KQ0KPiAgICovDQo+
ICB2b2lkIGludGVsX2hwZF9wb2xsX2Rpc2FibGUoc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3Bs
YXkpICB7DQo+ICsJc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXI7DQo+ICsNCj4gIAlpZiAo
IUhBU19ESVNQTEFZKGRpc3BsYXkpKQ0KPiAgCQlyZXR1cm47DQo+IA0KPiArCWZvcl9lYWNoX2lu
dGVsX2RwKGRpc3BsYXktPmRybSwgZW5jb2RlcikNCj4gKwkJaW50ZWxfZHBfZHBjZF9zZXRfcHJv
YmUoZW5jX3RvX2ludGVsX2RwKGVuY29kZXIpLCB0cnVlKTsNCj4gKw0KPiAgCVdSSVRFX09OQ0Uo
ZGlzcGxheS0+aG90cGx1Zy5wb2xsX2VuYWJsZWQsIGZhbHNlKTsNCj4gDQo+ICAJc3Bpbl9sb2Nr
X2lycSgmZGlzcGxheS0+aXJxLmxvY2spOw0KPiAtLQ0KPiAyLjQ0LjINCg0K
