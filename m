Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FD2C50A7F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 06:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC5210E6A5;
	Wed, 12 Nov 2025 05:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6OPFLBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AAD10E06A;
 Wed, 12 Nov 2025 05:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762927123; x=1794463123;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e1K8I61zDPL8KbLQR1bBAf3a14bdN/yQNhGjqvEnONU=;
 b=S6OPFLBekfVPcDydrv84+i4HysA24TMw80nK3UdSlRnvIAGuwb856ZAa
 RzhZwY6B7JTOjQ8600FtEizt2D1UryDW9cTLN3Nmj4H0O4cIk+z/0tgLU
 FEsNruy5PyeI2rvfF2wbvZRgYQ6BnKr9ezbJmGzCVg4kwLmWIFE7tQdqp
 M42AAVYzsubw6wths5k0/bFbx9cVwGoZLo8Oz2GIgCRLDsiOpYikaJsQ2
 jjgJkmyufpnYYQF1zAUwCpK0GBj92+9UdvNBtvz5zDoxyCPMRSZt19lfO
 +kALHFyGM/WohSr8ZwO1r3MBfNtJ1PP1n7ri8g2jWLFOlSh+xpNiGb9bh g==;
X-CSE-ConnectionGUID: EqVYNJiHQs+/AOlfB1ApwA==
X-CSE-MsgGUID: eNpPfSR9QQm3KrKu4r4KMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64919531"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64919531"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 21:58:43 -0800
X-CSE-ConnectionGUID: wW3bzNqaQ4mre5eMOsJH6w==
X-CSE-MsgGUID: neBOPXJhSNWIoBJ3y9f3gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="188393507"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 21:58:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 21:58:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 21:58:40 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 21:58:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAvLa4JDEz4WdiH7PPCPZeujr25iDzhEQD9gHFPxuc72VDLMQWbatFPepp1b/Strv2Of5b0tuCi21KdlryMrTJ8nRxrwnKXkE8Be1P/KWrGHpYkl4aJKV0fi+5XFeL/FFfebvkGKLq0PfdUEWGBMkSdK8iqQXlKCkuxnQMt0P/l95rDyQXspprCXKR3II15scwryAv/WrsZWj0XE/KuVuLZXZZyi9/imp7aHsIdfIqMmBSwPcss8v77rAm0ihKmMDhGnk/rBh0wxTJgCSQbhGi4Qw1lp/zcEB0FW63hUHpnfux2GNEDHzxWJGt6YvEajjgEDmvKfdm5zkJNnhQkwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1K8I61zDPL8KbLQR1bBAf3a14bdN/yQNhGjqvEnONU=;
 b=uu5rsBQXOKwC6hqGGbmOH7pUrJpxqTkq7LacoTYFAOLqDouuC1n6xlih4sm8ttc8vc2dxAzCtbpAYY7LIY9dS8jyA/kSlFN4qRfrIXsxjIuqOHY7yJT56MLTwxgOdephar72CqwKhHuPLE5Xskbk4+M5PVgbG9y9l69TyfxCWYMYyrtiF6xEHrGD5T9BdAnZ6gFEZyIfyWfmvPR2+XvmQSf7B+NBN7N144K/4VmPISm3trHMUvMhqTBuUc6egQzcwYAC4yKrl3K2r4EgC//cBBYeEf4f16l2NkOzC1c5Rbd6kZcFQBT4dM9dL/FajCM9f5qI1+wcv/ZZ39JqDAbdJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SN7PR11MB6725.namprd11.prod.outlook.com
 (2603:10b6:806:267::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 05:58:38 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 05:58:38 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v3 07/10] drm/i915/alpm: Program lttpr count for DP 2.1
 alpm
Thread-Topic: [PATCH v3 07/10] drm/i915/alpm: Program lttpr count for DP 2.1
 alpm
Thread-Index: AQHcUwypKYLYTadUrU6PudaHdD0mOrTujB0g
Date: Wed, 12 Nov 2025 05:58:38 +0000
Message-ID: <DM3PPF208195D8D44138C2A5FBBC2089978E3CCA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251111124316.1421013-1-animesh.manna@intel.com>
 <20251111124316.1421013-8-animesh.manna@intel.com>
In-Reply-To: <20251111124316.1421013-8-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SN7PR11MB6725:EE_
x-ms-office365-filtering-correlation-id: e1dd097b-5da8-43b2-0e7a-08de21b0862e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SVo3aXNEODlYcVlvTUpjaDJmZmxCRGNoWmJoWkNiL3Q0K2dWT3NzclZmUW42?=
 =?utf-8?B?TC9QMkFOWnVHbStMa0N3Yjg4UjQ0aTJSWGlCdFVDNXU4M3ZsZ3gvZUJJNHRm?=
 =?utf-8?B?SHY5a0NLcFhCUTlZSE9YaFdCWG9xSEloeEtKWGx4bFY2amp3aXNhUUpkZEpn?=
 =?utf-8?B?dk1UNUtkcWpyYkNQOHFHN0l3R1c2SjlTZHVRT01jdkYvTS9NMmxaMFFweWVQ?=
 =?utf-8?B?Q0pYN09aNlJVMFBPeVR2SlFvNEsrRGI0eDIxd2JyWkNvT3NQS2g4S2JmVTlC?=
 =?utf-8?B?Q3hERTRrRWN2UmpqUXpScmtKWlE3NWxXdDJXZVduUmNZWXNrYXF0SndjU1NZ?=
 =?utf-8?B?QngwY2NudEVVdmhRU2pxdTErdDNTUlREOFZDeVFXdThZQVZvMUtZZnJtRHlN?=
 =?utf-8?B?M2gyemhMSzBRODJvRXAzRTBJbUtoZlUzbHNidE9qR0p0UEVnSzJPMVFxSFQ3?=
 =?utf-8?B?cFRFTEdyVnZMNnFXaWJ3VnBNYWY2OE1yY3l0cTRPVWlGb1BTc1ZJdWtrcnB3?=
 =?utf-8?B?V3RTRnpEcG5HaWMwV0xiWU5iOXJpeVpETDd4WjdwaFNhNUE0Y2JVK2tFbWll?=
 =?utf-8?B?N2huZGhtdFlNd1k2TG1JdVNmaGdiMEl5UFVYWGZjenBhRXQ2eDk0NGNyYW95?=
 =?utf-8?B?RG4rVXplKzFqajAvbVZpblBmV1VwbWVYbHVrK2tvTnNCaW1rV0d3WGFJSyt1?=
 =?utf-8?B?RTk2OHQzVFI3L0JNQ05Wb0g3SCtEYVZOUnM2dFkzOSt5OFBFYjVFV1BSM01L?=
 =?utf-8?B?VG5aWnVEWUpKSEZzOEI1OGFETURkZmhrcWd6QytqUStxUkpjc3ZDZHRhNXEy?=
 =?utf-8?B?WHdpWHhZeUM5aGxyZy9vU1RwWWp0YStEWGdkT29OclpES2t2VDBBWTJIR09a?=
 =?utf-8?B?UUhRVTB5d29lbXhQbWVrb053VTNjMGRGcW9Fb3RFWU05WTErZTd5RmNUVFVD?=
 =?utf-8?B?TWpSOXBiVlV0ZHI3T1FTOEtXdVhNNE02S2FrelkxQWNaUXlEZGhYbFBMYzQv?=
 =?utf-8?B?TXVDRWEzSi9EeWxRaHQ0OVg0ZWd0VzdkSEZ2dFkvdkNqNU8rUGZkWTExaENH?=
 =?utf-8?B?UXRwQ1EwZWlacXJtQnU2Y1YxRER3Ujk5YkJPdzU0dml6anRUNzE0VkRWV1hh?=
 =?utf-8?B?SlhyNkJoWGtjczJEenFNNng3NjFkZ3Q1N1VCS01SL09VMGhmQ1JHUS9oVWRl?=
 =?utf-8?B?bksrTk01N3l6YzNHcHJBSk1EaHBGWTN2bUp4U0V6UDUxY2UzRVhsMnhzR1Zq?=
 =?utf-8?B?WDc4YnBjb3l6ZWt3dTAxbjRmbXJSdWk4a0lUR3hZRkxVcEJjYlR6STNsTk5n?=
 =?utf-8?B?c3JtYmJkVDJ2RXhlMTVMSDNKWVFtVDBKMnRWMXhFTkhDZmdBK0VpWkphSi9L?=
 =?utf-8?B?eE5YNnF4d2djVm15Njhhb2RmeE5SRGpSc2dqeVdDb21xWkJ2MEd1NG55aTJU?=
 =?utf-8?B?ekZhZVhGcGhhRXd6aHl2WkxBMXA5WWVDaVRMQlZOTTh5SDV2ZVl2bDFUTXVo?=
 =?utf-8?B?OE5XbS90QlJkdWlOOVQ2YnFmRDJEV0dMUTREZDJ3ZEt5YnZ1NHFKMnczMzIy?=
 =?utf-8?B?V3pEZG1RT2R1NUc5bUJSWEJEOFZQMWFIajJva04yc0lsYTY4RVBjU2RQeFVv?=
 =?utf-8?B?eXZvZXdFbE1Sbkl0djJJdFgxMmhMbE9vOTN2RUNBazFuUWVZZy9MZ09GK2dN?=
 =?utf-8?B?ZmIxc2xNVmdDYk5OcnhPLzNHRWsxOFFrYkNORmsrb1FHYThIQ1BnY3BkeEZW?=
 =?utf-8?B?ZkwvMTE5RzhvNkJMb2d3TnRQbU8vVnZ3Vit2KzBhYUJZQ2xKTjYvN1VLWlM3?=
 =?utf-8?B?bEpvTGlPWUIrUExJQmhscWRSaWNaYzZNeW1UVUxwUDgvd0xneEp0WjRkeXpv?=
 =?utf-8?B?dk5pSFpOYjNaeHBRb2d1UTJVbjlnTlpEcFdrL3BXVmZzNVdVQ0tSRTZtY1BI?=
 =?utf-8?B?SkVsVkUzVU9XRDBTRTc4UWV6czBZSDZtMnIvOER1NzE0Y2xhQkxSSWF2U1gx?=
 =?utf-8?B?aGhKNnNMNmN5MVNjYWZYdnhranJiUjJONWNaRjVSQ0p3NHBzQlFsUTlLOGht?=
 =?utf-8?Q?Ioh4uo?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3Z5UlJWS001T1FVVVNZUFdLQ0hSeU5NeW43cW5aNnA3S0wwL2hMeGNmS3Z3?=
 =?utf-8?B?UnNJbUpZMVB1OHNqRUZSdnYrT1ZUUE9xd1BLc2dyc3UrOTlHQ2p6dDZmRVBP?=
 =?utf-8?B?VFRCUHg5cFc0ME9hMWQxUFZ2NWVoNU9lOGFZek43OEdIUEJDemtSenVGVjBv?=
 =?utf-8?B?Sk5CZWtBLzJmVWxWN1VRV1JWTWpWVGlLSGtVaXdhY2ZQTnQ0TTZHangwVUF5?=
 =?utf-8?B?M0tabElXMEFOaXluR0tacjk0bU5YQXh5WmY1UHN3ZFV3amplSGNQeVpybjJT?=
 =?utf-8?B?V3p4cmUxdGtOaEJLVTdUbjRMc1c5RjhqNHJLbDFmb3djZXU4QUlPeS9JUUlz?=
 =?utf-8?B?RmI1WDRuZDZNT0h0VDBZd1Y2a1ErbWNURVl2OW1iY3R2VFFKNFdCQmlWMllZ?=
 =?utf-8?B?R1lqOExTTzAvL1RjUTc0U1h0YWw4b0hDbXVIcjM1VjluNWtKMDVSZFArSEFS?=
 =?utf-8?B?Q1dPZURXNkxjRUM4Vm5XQXRPYlRERXpmUTEzL0l5V3BjWHN1aHliTmJ0Tlgv?=
 =?utf-8?B?RXBKMUI3bUFhYVNDWHdpNllTZ0huODlBQTJFaGZGcG5Ubk5KeGxzck4xbXJB?=
 =?utf-8?B?THNSVTVjMVlERUMwY005MlB6ekozZ21lTThCQk9CMlBsQlV3QTB0TWk4R21q?=
 =?utf-8?B?MkkvNHl2N1MyN2VlWFpwclNmNkhSR3dnZ0pyejVXSUdabDlMTFFVU3BsVEt1?=
 =?utf-8?B?Wk9OUFhlMjJhRlE2eW9tMGhDU3dicTdIbWg4eGo0d0Ira1J2TjZ6RmZEZTdv?=
 =?utf-8?B?S1pNNFVhdXlrTlkySFpWRU1QcDNOOUJvL0FCL2hOdzJ0cUVVYm51TVoxT2pm?=
 =?utf-8?B?VzNJaVRwQStpMjZ0eFByOGExcnFsQ2txOSt3ZDlHNXVtYzNTc1FZVTRMdkRy?=
 =?utf-8?B?RVJ1clgwRGcvemJVVVY0cWF4bVNFQnlvOWJKNmVBSFJwMWpkbnhQYzFCRElH?=
 =?utf-8?B?TmZZMzE1U1I5bVgwWjNOcjg0RGV2YmdQbk9BZ0dMbXJLdUkvTkJ1YVJzTmdT?=
 =?utf-8?B?dDFRVEsxR29JdXhDUHA4OE5JYmh2VkVlRWJGLzJjelN3dWpTNjlIamxOUXF1?=
 =?utf-8?B?TUVmVXBGaUh2b2RrbllReC9IeHAveFRYVUxQVzM3M0orbnI4OTF1QmVMT0U5?=
 =?utf-8?B?VHFiY1NtdVVmTmw0eVUrei9DQllGQ0Mrd1hTQmoxa245dmVTZU1VdW9ZeVQ3?=
 =?utf-8?B?ODdoUlMwVjJWTWxoYWV0dUp1aEMzQTJycFpmV09wSTBCU2NMeWppSlJseStu?=
 =?utf-8?B?SHlsQk04b2F6aUtITXV6Mkdid01VTEpBVDhKVndFK2FKdEtRK0lPNlNQaGZs?=
 =?utf-8?B?cCtnMkRNODcvbkV0L0s1NVlaRCtCcWJyUmE5ME9oNTQ4aG8xbDZ4TWl5cmNQ?=
 =?utf-8?B?TG9NUGEydjkrQzRhMjJKNnlqTTlZTXEvYWhKRzFScW1BVVdkUVNSNi96NFpB?=
 =?utf-8?B?V1B3cFFBOCtwNVhTK0t2aS9DTys3L3pZZEdZUEVHbzdlNVQ3bmFORzhWWm1k?=
 =?utf-8?B?d0hMTmpaYkxCbExvWHdGeDl1VmdabHlmUzVlRVlVRXJBZFdrOU1OdXB2U1B0?=
 =?utf-8?B?SlZxNWdsNVVBQU8xam5iZEI2VitFRHBmd1ZEcVlmbkNoaDU2T0k1UjNiY0FU?=
 =?utf-8?B?bnhXRXUyVGxWcks3WlhpSVJKeXpkbUdVSUR1dkhWQTVpUS92LzQwRFFucHc1?=
 =?utf-8?B?ZVBnQjVjcW54QzVwMTN5b3FLN2NjMnk2aTl4dFVKU3JLcmxUSUpiK0xOMlMw?=
 =?utf-8?B?NDJnbVU5dTN3L2FmMHBiRmUyMWZWeUI1WDJ2U1Zad1JJZkhvd2pDc3ExdmNw?=
 =?utf-8?B?TTlsbTVHR0grdEVnMFFHdE44eTVtSmExQkNOYXBFbUt3STJiVmF6dGt0Y3Jt?=
 =?utf-8?B?UExvV1IyYVRkSHhmbU9sWmZmYzZYU05iUC85RjVFNXdRZjM3alV6MTd3QmQ2?=
 =?utf-8?B?ZjJrcFZLNmV0MWUxeHdMaFhnc1BKTGVKcEhoRmZOdVhQb0tlKzlMOG00aWMz?=
 =?utf-8?B?ZXNPSk4rU0tPeG83QUR2VGhucnNXR3RuZWxtd2tnNWVCU2toam1SOVVaLzI1?=
 =?utf-8?B?YW9yek9SS000dXN6djluVk1oNUZFWERmNmdrSWxyWjZKVUNmSHlvSEZqZHpW?=
 =?utf-8?Q?bs5WhThn4MUhx2yO/sYjC2sWy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1dd097b-5da8-43b2-0e7a-08de21b0862e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 05:58:38.1788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lQIhsAb9AxvFlmy0K0VL4uQSuLBos8cFVbDe7lwXx8fdtqpfApJrBj0YzP4Yn8LJjdNzUpBTmxpY9xY5nzIkSw==
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

DQo+IFN1YmplY3Q6IFtQQVRDSCB2MyAwNy8xMF0gZHJtL2k5MTUvYWxwbTogUHJvZ3JhbSBsdHRw
ciBjb3VudCBmb3IgRFAgMi4xDQo+IGFscG0NCg0KKkxUVFBSDQoqQUxQTQ0KDQo+IA0KPiBJc3N1
ZSBhIGF1eCB3cml0ZSB0cmFuc2FjdGlvbiB0byBkcGNkIDB4ZjAwMGEgd2l0aCB0b3RhbCBudW1i
ZXIgb2YgbHR0cHINCg0KKkRQQ0QgDQpXcml0ZSB0aGUgbmFtZSBvZiB0aGUgcmVnaXN0ZXIgcmF0
aGVyIHRoYW4gdGhlIGFkZHJlc3MNCg0KPiBiZWZvcmUgbGluayB0cmFuaW5nLg0KDQoqIHRyYWlu
aW5nDQoNCj4gDQo+IENjOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5j
b20+DQo+IC0tLQ0KPiAgLi4uL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2xpbmtfdHJh
aW5pbmcuYyAgICB8IDEyICsrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwX2xpbmtfdHJhaW5pbmcuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZHBfbGlua190cmFpbmluZy5jDQo+IGluZGV4IGFhZDVmZTE0OTYyZi4uY2YyNWZk
NTFmNDUyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2RwX2xpbmtfdHJhaW5pbmcuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwX2xpbmtfdHJhaW5pbmcuYw0KPiBAQCAtMTYyNCw2ICsxNjI0LDE2IEBAIGludGVs
X2RwXzEyOGIxMzJiX2xpbmtfdHJhaW4oc3RydWN0IGludGVsX2RwDQo+ICppbnRlbF9kcCwNCj4g
IAlyZXR1cm4gcGFzc2VkOw0KPiAgfQ0KPiANCj4gK3N0YXRpYyB2b2lkIGludGVsX2RwX3VwZGF0
ZV9sdHRwcl9jb3VudChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiArCQkJCQlpbnQgbHR0
cHJfY291bnQpDQo+ICt7DQo+ICsJaWYgKCFpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHApIHx8DQo+
ICsJICAgIGludGVsX2RwLT5sdHRwcl9jb21tb25fY2Fwc1swXSA8PSAweDIwKQ0KDQpXaHkgd2hh
dCBpcyAweDIwIGF2b2lkIG1hZ2ljIG51bWJlcnMgd2l0aG91dCBwcm9wZXIgZXhwbGFuYXRpb24N
Cg0KUmVnYXJkcywNClN1cmFqIEthbmRwYWwNCg0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwlkcm1f
ZHBfZHBjZF93cml0ZWIoJmludGVsX2RwLT5hdXgsIERQX1RPVEFMX0xUVFBSX0NOVCwNCj4gbHR0
cHJfY291bnQpOyB9DQo+ICsNCj4gIC8qKg0KPiAgICogaW50ZWxfZHBfc3RhcnRfbGlua190cmFp
biAtIHN0YXJ0IGxpbmsgdHJhaW5pbmcNCj4gICAqIEBzdGF0ZTogQXRvbWljIHN0YXRlDQo+IEBA
IC0xNjYwLDYgKzE2NzAsOCBAQCB2b2lkIGludGVsX2RwX3N0YXJ0X2xpbmtfdHJhaW4oc3RydWN0
DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+IA0KPiAgCWludGVsX2RwX3ByZXBhcmVf
bGlua190cmFpbihpbnRlbF9kcCwgY3J0Y19zdGF0ZSk7DQo+IA0KPiArCWludGVsX2RwX3VwZGF0
ZV9sdHRwcl9jb3VudChpbnRlbF9kcCwgbHR0cHJfY291bnQpOw0KPiArDQo+ICAJaWYgKGludGVs
X2RwX2lzX3VoYnIoY3J0Y19zdGF0ZSkpDQo+ICAJCXBhc3NlZCA9IGludGVsX2RwXzEyOGIxMzJi
X2xpbmtfdHJhaW4oaW50ZWxfZHAsIGNydGNfc3RhdGUsDQo+IGx0dHByX2NvdW50KTsNCj4gIAll
bHNlDQo+IC0tDQo+IDIuMjkuMA0KDQo=
