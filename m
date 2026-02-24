Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOyeJJZonWnBPwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:00:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55A618423A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435C910E51B;
	Tue, 24 Feb 2026 09:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aWZlAJ6A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD3310E517;
 Tue, 24 Feb 2026 09:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771923602; x=1803459602;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gF6CtEfvVPMPM+c0/cmgb3IdOoePNfn38nBOTAHb+g0=;
 b=aWZlAJ6AW6kS5hlH5bs5+XkKxm8PxOwQNTq4lMo457ukw3KPvJeJu8PU
 jb344Ln6vePHNhGg3bpKkCD74EUy6lIj+lJI/F9Uwz4DvsZ7jBBmg3bfx
 sNK/g0EOgBuAI4P69bGTWJi3XBv579BAyRX80WA+iAtQBzoAGEn+56+RA
 F/emN+UPjP4XQ2CwgNPpZ89f2E0/PkA2CtAX9K1jJPcmtwYrkxg/yVX/G
 mLQMmiffUelbZDKBAwsggJV4HO2X3nGxAQf3CpeugsGTierH1UTZNpEsH
 wF04SuRW4cUC1tAb1Tb5gCr/qRcW6HxnNPvW4tvioNy57z8/kOZH3QAQM g==;
X-CSE-ConnectionGUID: t5v1UNTrQ2WUcnfCM5yK0A==
X-CSE-MsgGUID: XcOCYuYGTYeru9VvCqMGCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76793963"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="76793963"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:59:59 -0800
X-CSE-ConnectionGUID: PQm9Mso9TouI8HDjqGkQ8A==
X-CSE-MsgGUID: J08edmAMSwaCtHePgmS/SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="253570589"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:59:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 00:59:59 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 00:59:59 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 00:59:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fX/Q7hdF2uwhVNYJwQo3Et5x1iwhDZS8z6XCvcZZxQl4V3AiVxr8HKrmR33gtcIAafVUKuiC5j6+ShRs6MQNxqsJ9ymxLh7pSIMetgYNltJQCF8U+ahDGHDdEaP1tHc8N29/DhiGtW2QcoyEUkRFk1EjwSnfd0gOmgiGTYpEuegI6rRF2nKVlpIFIQEdPll9A1qRRkpFdOwiDjGSiNrFYdK/7xePk467l2TuwE548JY7LvKci/eX2NdK8HYkyMxT0N7LYJlQ+xsFs6sl2DT/jClnm+k7smPhL7IZPKR0Gtf423qOfC90yAY3KWG+GnyWa6XfAdrgr+PlKKOLihL9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gF6CtEfvVPMPM+c0/cmgb3IdOoePNfn38nBOTAHb+g0=;
 b=bs5gm+Keu3XOVMT5OWXlZVNdmSp7O/SgoXvR27ipUlzfR/ZgHgNplAEfiMDznKMiheHyv9gVFykWp5r0DuaK5JqqsJD0/utNHGmxU+K8qlVCVf8WIVfjiLVg48IrnTZNvka/+/QDCUH1Vku8KvgeP0nTjM/BvKQqKLN0zit78FcyutEZsjDVVujc1lucAkguO/wW7b7ChkgZTfkQzWJo3iAVMPbNtKQI7I2vEEqBxrceNr2isi1MCqo+kobZ5iXC2mwHLMTPatrVMF2fgo6wRpiS1iGIG2sMGqTNsYiZTmpEPs35bk30mwBA+Xg6lNa+3CCqWW/653e06cCCqYIC7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 08:59:56 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 08:59:56 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Harry Wentland <harry.wentland@amd.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "contact@emersion.fr" <contact@emersion.fr>, "alex.hung@amd.com"
 <alex.hung@amd.com>, "daniels@collabora.com" <daniels@collabora.com>,
 "mwen@igalia.com" <mwen@igalia.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 0/2] drm/colorop: Keep colorop state consistent across
 atomic commits
Thread-Topic: [PATCH 0/2] drm/colorop: Keep colorop state consistent across
 atomic commits
Thread-Index: AQHcoKdYzChqbBKpyECpDnAvZXrljLWQ0WAAgADEHWA=
Date: Tue, 24 Feb 2026 08:59:56 +0000
Message-ID: <DM4PR11MB63605890253C37E67BA672C2F474A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260218065713.326417-1-chaitanya.kumar.borah@intel.com>
 <f670f350-7230-4bbc-9443-a6307429d7b3@amd.com>
In-Reply-To: <f670f350-7230-4bbc-9443-a6307429d7b3@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SJ0PR11MB5088:EE_
x-ms-office365-filtering-correlation-id: 94128d29-7433-4f0c-fd0e-08de738314f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?eWVVZ1RmZVFuclhRbFg5UXo4RDg0S1ExTG1wWisxZXZjWndwNjJsbGpURFdE?=
 =?utf-8?B?R3FTU09NN0o0MUZMb2xaSGZlblRwZ3JaWDdSb25Cd1l4Tkk2R3dHc2xkSXJt?=
 =?utf-8?B?VUI5MVd6bFFFM0hmU1JscVdNSUxERWJTalZjWnExWjdBYXlKUExSamg5WU5a?=
 =?utf-8?B?MTNoMEpwS3RKcnN0dGN0K3lrdE9LV05IeFpDRTk3dXZ3WjcxV1cwVktpV3lZ?=
 =?utf-8?B?ZHk5UGVKblVnbHFFV3hwQVdqNnFodVBDNVZIeTVrTUlCUkZwOVF5TGNBdEdi?=
 =?utf-8?B?VysxM01hazZUd2dCK0dIL3FHdEZUelJlRng2TkpmeXB3ZTZ6SXpDSE0vM1h1?=
 =?utf-8?B?NWhQNkNwelRqOGhQbUR4MmR3QmxzSi9CbW52dmhGREFpR2VGVlhYQTZXZUV0?=
 =?utf-8?B?VzhLdFdjRGVYa2RpQlJ2YURDaWp6azhuTGZOMTc1eXhIM3RVQ25qdUFrbkxk?=
 =?utf-8?B?N1BlZTh6cVlMUEs3aVFSN0pqMXlOSlNaUWR3UXNoandnL1UraGI3aHVQZ2hP?=
 =?utf-8?B?OStqb2lzU1RFNlRIQ1JndWg2ZFF2RGgweTRWRjkwWnB5ZWNRM0FuVVVyTWxt?=
 =?utf-8?B?d0pPR1ovM0xZTGxCWVgxc1JienFMYzVBL2taQ01MUlYrdm02WXFEWlNxWVQ3?=
 =?utf-8?B?VWcwUGxzZWJvd21KWjhXWXlMdUQzZlJ1TzdZalRla2t0SDJCMVJ6V1grTGRK?=
 =?utf-8?B?QkwzeFJuZU5pR3podjJuczg4b2VHc1NQZE9scGQ4QTBuT3ppdE91QllZeWE3?=
 =?utf-8?B?MUhuQXo2VEE0RlNFd0h4cVNabW9yVXVaSGFlUGV3TjUvMjc5bndyUnNEdk9W?=
 =?utf-8?B?bjdiOGdRWGJlWWkzWXowUlZ6d1RkSGduYW5OYTBuL0RZbnhvSVpOV0pJT2w5?=
 =?utf-8?B?RCtjU1g1Yjl2SkhoWE1nSlJQUldmV2xFYW02N2JCZTdvQVMycWRSSWFWaDJq?=
 =?utf-8?B?dTBab3RDQTBTTUR1TVUyeEovMHpEaXJGdE9qVUVUYmdTYVdWL05WL0R4ZzJ1?=
 =?utf-8?B?YWNTbTk1UEtsbkJwV2ZOVERmNWpVRWtZWmZ3MzM3UU14SXNLK2dyYWJmUFFp?=
 =?utf-8?B?dUhmY05wZkcyc2JFbFBsY1pWZnE0THJ4WU9QY1pFN2MrVC9GWnQxME9UUGdL?=
 =?utf-8?B?dk9tMTJ2dzZrd0ZYVStBMmt4Vjc5K1hMZjVDVVNPVkhBN05VdEFwUXFFNWxI?=
 =?utf-8?B?SXRGS2NlOUFZSkZGWGpPRmVja0ZRSTVxbUNmcXJqeG9FOGRMTzFzcDZCQ0tw?=
 =?utf-8?B?eVlmcHBVQ3hkTms5U05PLzRWZlBOUWNobWFhclRWTmljVWRsbGVqZldSM0E5?=
 =?utf-8?B?bWhQWXZVZ2d1NmV0WHlFdkNodHI1MDhxYnlXKy9FcW1tTU0wZ0VpdG53QVJo?=
 =?utf-8?B?a1BObnFxeUJ3VlB3NG9RK3NCQmZaOEVoa3U4em9ja1RrR2t0QklpZFNLL05n?=
 =?utf-8?B?WlJydTR5SEpaZ0ljQlY0aGxoS1J5TzFJbDkyTTRVMXJDM0lYcDhyck5MMVMx?=
 =?utf-8?B?SEhvWERVLytESHlucW9ZSXJKTktRZjh2a0tNdU0zZDZ6T0VzNHg1a1dTTkRl?=
 =?utf-8?B?RWhCdWpmdmE4dnYxZ0Z3S2cwcGx6cWFvVkowVGJrZzZFUWpRYVc0d3B6eG13?=
 =?utf-8?B?ZktQSS9tMlVGZUg3elZrYUhsZmRrYk9BeitCTWlCOVdwOFZ3aUd4VWlLQk5W?=
 =?utf-8?B?U3ViRG9DYWFIV2h6dHozSTRIRjNIbHhlQXZPQVczQzRybUFESDlGRVBOd0U1?=
 =?utf-8?B?bDF3b0xLQnQxQUVYRmlnMXNxRFgwRHRHZ0pwWXBlT0ZWZDNNTnh6YTFGYVZY?=
 =?utf-8?B?SXRqMi9Oa2t1RFpDMGxVbVNZTVJ1ZXJ0VmlrWWlVaFR3ZTZJNno4RElpTEZi?=
 =?utf-8?B?cllPcVhrNkNTUXRSc1Azc09RR0U3bFQvZmI2ZlgxWWFhVHptUEcwRk9ENnlV?=
 =?utf-8?B?RDVhaTlNSWtYUHhMazgyTzY5RFdiWjlKU0VTcjhQYU1zYXY1dVFFZThPay9I?=
 =?utf-8?B?WmhlUWE0QUl3TGdJZ3l3bmxNRnVaUXNUUFZpbVZ0TmhqdldUY2hOSjVNSjJM?=
 =?utf-8?B?VWFmdVVFNmxMYllVRHdCT21QekcwV3pqVW1GNG9rL3VKMmY0cnRCWEZVM2hQ?=
 =?utf-8?Q?ZTq/zcNC1TA+Gjy0+7Dg7BOYD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0ZEUlBlVlJrcGR1L2p4V0hrR0ZaOVN3YklGSVpOelpURzhJTWlpS1Q3VUZ4?=
 =?utf-8?B?OGh6cEtKeGRyWVFwYkJVR21sNXNWK3FvUlpVZ3lYZFNuQXRzdkNsTkxvb01w?=
 =?utf-8?B?NUF3ZHJuY3Q2ZnpoY3VhVHI5bk4rZ1ZCZzh5SGFIbVErZ3F0SVVsWXEweG9x?=
 =?utf-8?B?N3RDOWlwS3ZKYkhhNDAycnZCQk5Kc09NWGtUNE5UQndFRDUyZ2FGKzRZb2g2?=
 =?utf-8?B?NDBKV3ErNEJ3WUhFSkd2MnBJUEFEdCt0Qkl5V2tTeXZndXdic0xpOU0yOHZN?=
 =?utf-8?B?dzhMTDVXZ1QrV2RQbkVrWnR3QXdGNzlVbXhYcVhRQW9sam5FdUFuN1RlbmV4?=
 =?utf-8?B?UEhjcWVWMndtblUvNjZra2EwQ0cvTnh1UHJ1Wkx0YTBnQk5UK1JRMjV1OGh0?=
 =?utf-8?B?M1R2RWtPN0g0ejV0bDJieXlVeGRpN0x6RHRtRWdsVzBDWXFuUm5kRTdMdmlM?=
 =?utf-8?B?ZDVLdWk4RERIMG1JWG84RmpocXlBbkp5NC85bEVJcHlERTU4c3ZLdW1jOHIz?=
 =?utf-8?B?L0lYdEZpM2lKYWViT0RBTnhUMEVEVDZlcFd0cHY3dE1oME9BbjlqanRvSERL?=
 =?utf-8?B?bnlJOEpUcmJyaWYwY2kvc1BkalJRWCtsbjdtSGFKMnFQQXNtZk1oMnBnd1N5?=
 =?utf-8?B?OGNCcGtEMW9EeDZZblI2Qk5wa3VPWHU1a2dqS1ZLY1FrR0UwOUhHK3hmZnVr?=
 =?utf-8?B?eHVBYWRaTE1obTVuQzZuY2pwdG1qcFBUUFdKUSszTnQxZFJjNWlESmpjdTlm?=
 =?utf-8?B?MEduYW42TFRyNDZydmhCb0dEemZpWnBSTVlwajdBcndnTlUxTjdteVhjNmZB?=
 =?utf-8?B?OHkyYTlNbWpqU2dmTE4rYUdMdWRzRG5uK2J1Sys3RWpGcHcwOXJhZzNodTlm?=
 =?utf-8?B?Qk5LWVU0M3Z1SGpVazc0QkxVWTNUekNFbGt6Rlhta25BWUZTb0FyWHJBYW9L?=
 =?utf-8?B?NjJVT3NwVmM2ZkU3MlFpc1YvWjlHbjliQ0luNWdQeTBwRkFKNDlvRStOZjZY?=
 =?utf-8?B?UzE3RkFJR3craGZOUjgwemxhL1kwa2FCK21WemNVSktMSmhON0lyK3EvWW5G?=
 =?utf-8?B?L1BpSXJQRlZyajZ0VzBWTmFvUWYvRU9RL2c3ckhYMFczZXhJMkpsTEdqa1FC?=
 =?utf-8?B?aCtoaGFJWGRTYUN5VXBvbVNoQU1SeHI1YzIycm8yVzB2MDBIV0JWUVVwM0xj?=
 =?utf-8?B?WGVtdzNGZ25SN2EwQ0tPR3RqNDAxdG1LOE1iV2ZKUTJ4UE0rbmVtV2xKZTVD?=
 =?utf-8?B?V0pCQnFDTjRXUitoOUJWT1FUb09wOUNqdHRJaldGdGpFV1daNzBLZUpGdGw4?=
 =?utf-8?B?dXVqWmxlVjlIcHN4bUlFZjZFYlJ5V1E1NUVUYnFpY2JUR2FWd3ZwR1dxYTd4?=
 =?utf-8?B?ZXUwWFNURnd3aDhJMlZwdzQyd3NSeHZVR2JsaWlTc0FzMU5WOVQyTktLeldo?=
 =?utf-8?B?SjJEaE9VdXZTMnUrNkx2d1o1RnIyd2xacUpnWXp5SitmcFJNdW1XaWF0cjBu?=
 =?utf-8?B?RHdHUk9xbnF2UU9wa0I2cGFVL1ZqcXkyVFRyd2MzTGFFN2Ixek5od1ppSE9n?=
 =?utf-8?B?YytHTWlERmw4ckI3V3VMVnE5SXNkL0NCMzZ4UVluVks1clBiRDd3aXphckNV?=
 =?utf-8?B?S25SVFNKV0ZrZjl0M2JhSmFtYnhoL0VtVTV2ZndvbmRGQjVyMUFibTgreXVC?=
 =?utf-8?B?RnBQUTNKUTN3dGlycWZvUlRSNVV4TSttZ2F2ZnlsbFlsZXNuUXV6ZVkzWFVO?=
 =?utf-8?B?bUlvTXFOUDlLRmxBeWViVS9ZWDBjU2JwdjFxdW5yaytnQmtLaWRYaVhNcjdv?=
 =?utf-8?B?WGZsVElmci9hdlNsTEdCUGVjRDFDa0YvcGJkdXhYc0J0d3pVWlA5cGdwWFVa?=
 =?utf-8?B?UktTb1ArcllRdEJ2cG1Yanl1YzF0TUMwKzNIenN1U25yVlV6UU5ud0NldnRw?=
 =?utf-8?B?Y3ZqMWVsTnhtNm1tWDBtZmc5dW5hOG5oYmpVU0VPSlJidG91dFE0UDUzSFow?=
 =?utf-8?B?dlJNcG4yd3EvTE4vVUJUMmxkd3pFVitVcG9wdkw1d0F6cTFjd0Jlayt3NEI3?=
 =?utf-8?B?U3RUQjFpNUFqbzcydTJTeWlJLy80MWh5RVI0QVNYNUJaL3poQksvaVRNekhS?=
 =?utf-8?B?czN0cTlXY2o2cy83b0hCcTc0U3liWGFFSHNOMDdGd2FsSmdmL1AzMGhtRFZN?=
 =?utf-8?B?NkxoSFd0c3F5ZktOSzBVZFQ0enArWEdycngzMitWSTZlYy9KZEhhS0ttczZ0?=
 =?utf-8?B?MjR5OERhUE9jZDA1NXo0V1JLRWxHQit4ZVdyWUhFZXk0SDVXcHo1NmF1ZmVY?=
 =?utf-8?B?a1NqLzQzZ0VxVFBmQ1RBdWxKSzlya25SVGMraGVobGRwaVpNMXorZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94128d29-7433-4f0c-fd0e-08de738314f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 08:59:56.2398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 87WSKYkLpZnWlY190dlZDbJ0I7CQ0H0SbcoMFDsL/dFJkK0plTp4dFMzvve1tFhJSRtifo4HutfwyZaekJqAKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[uma.shankar@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: D55A618423A
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFycnkgV2VudGxhbmQg
PGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDI0LCAy
MDI2IDI6NDQgQU0NCj4gVG86IEJvcmFoLCBDaGFpdGFueWEgS3VtYXIgPGNoYWl0YW55YS5rdW1h
ci5ib3JhaEBpbnRlbC5jb20+OyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogY29udGFjdEBlbWVyc2lvbi5mcjsgYWxleC5odW5nQGFtZC5jb207
IGRhbmllbHNAY29sbGFib3JhLmNvbTsNCj4gbXdlbkBpZ2FsaWEuY29tOyBzZWJhc3RpYW4ud2lj
a0ByZWRoYXQuY29tOyBTaGFua2FyLCBVbWENCj4gPHVtYS5zaGFua2FyQGludGVsLmNvbT47IHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tOw0KPiBtYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb207IE5pa3VsYSwgSmFuaSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsNCj4gbG91aXMu
Y2hhdXZldEBib290bGluLmNvbTsgc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDAvMl0gZHJtL2NvbG9yb3A6IEtlZXAgY29sb3JvcCBzdGF0ZSBjb25zaXN0ZW50
IGFjcm9zcw0KPiBhdG9taWMgY29tbWl0cw0KPiANCj4gT24gMjAyNi0wMi0xOCAwMTo1NywgQ2hh
aXRhbnlhIEt1bWFyIEJvcmFoIHdyb3RlOg0KPiA+IFRoaXMgc2VyaWVzIGFpbXMgdG8ga2VlcCBj
b2xvcm9wIHN0YXRlIGNvbnNpc3RlbnQgYWNyb3NzIGF0b21pYw0KPiA+IHRyYW5zYWN0aW9ucyBi
eSBlbnN1cmluZyBpdCBhY2N1cmF0ZWx5IHJlZmxlY3RzIGNvbW1pdHRlZCBoYXJkd2FyZQ0KPiA+
IHN0YXRlIGFuZCByZW1haW5zIHBhcnQgb2YgdGhlIGF0b21pYyB1cGRhdGUgd2hlbmV2ZXIgaXRz
IGFzc29jaWF0ZWQNCj4gPiBwbGFuZSBpcyBpbnZvbHZlZC4NCj4gPg0KPiA+IEl0IGNvbnRhaW5z
IHR3byBjaGFuZ2VzOg0KPiA+IC0gUHJlc2VydmVzIHRoZSBieXBhc3MgdmFsdWUgaW4gZHVwbGlj
YXRlZCBjb2xvcm9wIHN0YXRlLg0KPiA+DQo+ID4gX2RybV9hdG9taWNfaGVscGVyX2NvbG9yb3Bf
ZHVwbGljYXRlX3N0YXRlKCkgdW5jb25kaXRpb25hbGx5IHJlc2V0DQo+ID4gYnlwYXNzIHRvIHRy
dWUsIHdoaWNoIG1lYW5zIHRoZSBkdXBsaWNhdGVkIHN0YXRlIG5vIGxvbmdlciByZWZsZWN0cw0K
PiA+IHRoZSBjb21taXR0ZWQgaGFyZHdhcmUgc3RhdGUuIFNpbmNlIGJ5cGFzcyBkaXJlY3RseSBj
b250cm9scyB3aGV0aGVyDQo+ID4gdGhlIGNvbG9yb3AgaXMgYWN0aXZlIGluIGhhcmR3YXJlLCB0
aGlzIGNhbiBsZWFkIHRvIGFuIHVuaW50ZW5kZWQNCj4gPiBkaXNhYmxlIGR1cmluZyBzdWJzZXF1
ZW50IGNvbW1pdHMuDQo+ID4NCj4gPiBUaGlzIGNvdWxkIHBvdGVudGlhbGx5IGJlIGEgcHJvYmxl
bSBhbHNvIGZvciBjb2xvcm9wcyB3aGVyZSBieXBhc3MNCj4gPiB2YWx1ZSBpcyBpbW11dGFibHkg
ZmFsc2UuDQo+ID4NCj4gPiBDb25jZXB0dWFsbHksIEkgY29uc2lkZXIgJ2J5cGFzcycgdG8gYmVo
YXZlIHNpbWlsYXIgdG8gJ3Zpc2libGUnIGluDQo+ID4gcGxhbmUgc3RhdGUgLSBpdCByZXByZXNl
bnRzIGN1cnJlbnQgSFcgc3RhdGUgYW5kIHNob3VsZCB0aGVyZWZvcmUgYmUNCj4gPiBwcmVzZXJ2
ZWQgYWNyb3NzIGR1cGxpY2F0aW9uLg0KPiA+DQo+ID4gLSBBZGQgYWZmZWN0ZWQgY29sb3JvcHMg
d2l0aCBhZmZlY3RlZCBwbGFuZQ0KPiA+DQo+ID4gQ29sb3JvcHMgYXJlIHVuaXF1ZSBpbiB0aGUg
RFJNIG1vZGVsLiBXaGlsZSB0aGV5IGFyZSBEUk0gb2JqZWN0cyB3aXRoDQo+ID4gdGhlaXIgb3du
IHN0YXRlcywgdGhleSBhcmUgbG9naWNhbGx5IGF0dGFjaGVkIHRvIGEgcGxhbmUgYW5kIGV4cG9z
ZWQNCj4gPiB0aHJvdWdoIGEgcGxhbmUgcHJvcGVydHkuIEluIHNvbWUgc2Vuc2UsIHRoZXkgc2hh
cmUgdGhlIHNhbWUgaGllcmFyY2h5DQo+ID4gYXMgQ1JUQyBhbmQgcGxhbmVzIHdoaWxlIGZvbGxv
d2luZyBhIGRpZmZlcmVudCAnb3duZXJzaGlwJyBtb2RlbC4NCj4gPg0KPiA+IEdpdmVuIHRoYXQg
ZW5hYmxpbmcgYSBDUlRDIHB1bGxzIGluIGFsbCBpdHMgYWZmZWN0ZWQgcGxhbmVzIGludG8gdGhl
DQo+ID4gYXRvbWljIHN0YXRlLCBpdCBmb2xsb3dzIHRoYXQgd2hlbiBhIHBsYW5lIGlzIGFkZGVk
LCBpdHMgYXNzb2NpYXRlZA0KPiA+IGNvbG9yb3BzIGFyZSBhbHNvIGluY2x1ZGVkLiBPdGhlcndp
c2UsIGR1cmluZyBtb2Rlc2V0cyBvciBpbnRlcm5hbA0KPiA+IGNvbW1pdHMsIGNvbG9yb3Agc3Rh
dGUgbWF5IGJlIG1pc3NpbmcgZnJvbSB0aGUgdHJhbnNhY3Rpb24sIHJlc3VsdGluZw0KPiA+IGlu
IGluY29uc2lzdGVudCBvciBpbmNvbXBsZXRlIHN0YXRlIHVwZGF0ZXMuDQo+ID4NCj4gDQo+IFRo
YXQgdGVuZHMgdG8gcmVmbGVjdCBteSB0aGlua2luZyB3aGVuIEkgd3JvdGUgdGhlIGNvbG9yb3Ag
c3R1ZmYuDQo+IA0KPiA+IFRoYXQgc2FpZCwgSSBkbyBoYXZlIGEgY29uY2VybiBhYm91dCBwb3Rl
bnRpYWxseSBpbmZsYXRpbmcgdGhlIGF0b21pYw0KPiA+IHN0YXRlIGJ5IGF1dG9tYXRpY2FsbHkg
cHVsbGluZyBpbiBjb2xvcm9wcyBmcm9tIHRoZSBjb3JlLiBJdCBpcyBub3QNCj4gPiBlbnRpcmVs
eSBjbGVhciB0byBtZSB3aGV0aGVyIGluY2x1c2lvbiBvZiBhZmZlY3RlZCBjb2xvcm9wcyBzaG91
bGQgYmUNCj4gPiBoYW5kbGVkIGluIGNvcmUsIG9yIGxlZnQgdG8gaW5kaXZpZHVhbCBkcml2ZXJz
Lg0KPiA+DQo+IA0KPiBDb3VsZCB0aGlzIGxlYWQgZHJpdmVycyB0byByZXByb2dyYW0gcG9zc2li
bHkgZXhwZW5zaXZlIGNvbG9yb3BzIHdoZW4gdGhleSBkaWRuJ3QNCj4gY2hhbmdlPyBJdCB3b24n
dCBiZSBhbiBpc3N1ZSBmb3IgYW1kZ3B1IHNpbmNlIHdlIGhhdmUgYW5vdGhlciBsZXZlbCBvZiBz
dGF0ZQ0KPiB0cmFja2luZywgYnV0IGZvciBkcml2ZXJzIHRoYXQgc3RyaWN0bHkgZm9sbG93IHRo
ZSBhdG9taWMgbW9kZWwgaXQgbWlnaHQgbGVhZCB0bw0KPiBpc3N1ZXMuDQoNCkkgdGhpbmsgdGhp
cyB3aWxsIGJlIG1vZGVzZXQgcGF0aCB3aGVyZSBpbXBhY3Qgb3IgbGF0ZW5jeSB3aWxsIGJlIGxl
c3MgYXMgY29tcGFyZWQgdG8NCmEgZmxpcCBvcGVyYXRpb24uICBIb3dldmVyLCBpbmRpdmlkdWFs
IGRyaXZlcnMgY2FuIGNoZWNrIHJlc3BlY3RpdmUgc3RhdGUgYW5kIHNraXAgdXBkYXRlLg0KDQpS
ZWdhcmRzLA0KVW1hIFNoYW5rYXINCg0KPiBPbiB0aGUgb3RoZXIgaGFuZCBpdCBtYWtlcyBjb2xv
cm9wIGhhbmRsaW5nIGxlc3MgZXJyb3ItcHJvbmUgaW4gYW1kZ3B1LCBhbmQNCj4gcG9zc2libHkg
Zml4ZXMgYSBidWcgSSd2ZSBjb21lIGFjcm9zcyB3aGVyZSB3ZSBnZXQgY29uZnVzZWQgaWYgYW4g
YWN0aXZlIGNvbG9yb3ANCj4gaXNuJ3QgcGFydCBvZiB0aGUgc3RhdGUuDQo+IA0KPiBIYXJyeQ0K
PiANCj4gPiBNeSB1bmRlcnN0YW5kaW5nIG9mIHRoZSBhdG9taWMgZnJhbWV3b3JrIGlzIHN0aWxs
IGV2b2x2aW5nLCBzbyBJIHdvdWxkDQo+ID4gYXBwcmVjaWF0ZSBmZWVkYmFjayBmcm9tIHRob3Nl
IG1vcmUgZmFtaWxpYXIgd2l0aCB0aGUgaW50ZW5kZWQgZGVzaWduDQo+ID4gZGlyZWN0aW9uLg0K
PiA+DQo+ID4gPT0NCj4gPiBDaGFpdGFueWENCj4gPg0KPiA+IFAuUy9CYWNrZ3JvdW5kL1RMO0RS
Og0KPiA+DQo+ID4gSSBkaXNjb3ZlcmVkIGluY29uc2lzdGVuY3kgd2l0aCB0aGUgY29sb3JvcCBz
dGF0ZSB3aGlsZSBhbmFseXNpbmcgQ1JDDQo+ID4gbWlzbWF0Y2hlcyBpbiBrbXNfY29sb3JfcGlw
ZWxpbmUgdGVzdCBjYXNlc1sxXS4gVmlzdWFsIGluc3BlY3Rpb24NCj4gPiByZXZlYWxzIHRoYXQg
d2hpbGUgQ1JDIGlzIGJlaW5nIGNvbGxlY3RlZCBkZWdhbW1hIGJsb2NrIGhhcyBiZWVuDQo+ID4g
cmVzZXQuIFRoaXMgd2FzIHRyYWNlZCBiYWNrIHRvIHRoZSBpbnRlcm5hbCBjb21taXQgdGhhdCB0
aGUgZHJpdmVyIGRvZXMgdG8gZGlzYWJsZQ0KPiBQU1IyIGFuZCBzZWxlY3RpdmUgZmV0Y2ggZm9y
IENSQyBjb2xsZWN0aW9uLg0KPiA+DQo+ID4gY3J0Y19jcmNfb3Blbg0KPiA+ICAgICAtPiBpbnRl
bF9jcnRjX3NldF9jcmNfc291cmNlDQo+ID4gICAgICAgICAtPiBpbnRlbF9jcnRjX2NyY19zZXR1
cF93b3JrYXJvdW5kcw0KPiA+ICAgICAgICAgICAgIC0+IGRybV9hdG9taWNfY29tbWl0DQo+ID4N
Cj4gPiBEdXJpbmcgdGhpcyBmbG93IGNvbG9yb3Agc3RhdGVzIGFyZSBuZXZlciBhZGRlZCB0byB0
aGUgYXRvbWljIHN0YXRlDQo+ID4gd2hpY2ggaW4gdHVybiBtYWtlcyBpbnRlbF9wbGFuZV9jb2xv
cl9jb3B5X3VhcGlfdG9faHdfc3RhdGUoKSBkaXNhYmxlIHRoZQ0KPiBjb2xvcm9wcy4NCj4gPg0K
PiA+IElmIHdlIGFkZCB0aGUgY29sb3JvcHMsIHRvIHRoZSBhdG9taWMgc3RhdGUsIHRoZSBwcm9i
bGVtIHN0aWxsDQo+ID4gcGVyc2lzdGVkIGJlY2F1c2Ugd2hpbGUgZHVwbGljYXRpbmcgdGhlIGNv
bG9yb3Agc3RhdGUsICdieXBhc3MnIHdhcyBnZXR0aW5nIHJlc2V0DQo+IHRvIHRydWUuDQo+ID4N
Cj4gPiBUaGUgdHdvIGNoYW5nZXMgbWFkZSBpbiB0aGlzIHNlcmllcyBmaXhlcyB0aGUgaXNzdWUu
DQo+ID4NCj4gPiBbMV0NCj4gPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0t
dGlwL0NJX0RSTV8xODAwMS9zaGFyZC1tdGxwLTYvaWd0DQo+ID4gQGttc19jb2xvcl9waXBlbGlu
ZUBwbGFuZS1sdXQxZC5odG1sDQo+ID4NCj4gPiBDYzogU2ltb24gU2VyIDxjb250YWN0QGVtZXJz
aW9uLmZyPg0KPiA+IENjOiBBbGV4IEh1bmcgPGFsZXguaHVuZ0BhbWQuY29tPg0KPiA+IENjOiBI
YXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCj4gPiBDYzogRGFuaWVsIFN0
b25lIDxkYW5pZWxzQGNvbGxhYm9yYS5jb20+DQo+ID4gQ2M6IE1lbGlzc2EgV2VuIDxtd2VuQGln
YWxpYS5jb20+DQo+ID4gQ2M6IFNlYmFzdGlhbiBXaWNrIDxzZWJhc3RpYW4ud2lja0ByZWRoYXQu
Y29tPg0KPiA+IENjOiBBbGV4IEh1bmcgPGFsZXguaHVuZ0BhbWQuY29tPg0KPiA+IENjOiBVbWEg
U2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KPiA+IENjOiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiA+IENjOiBNYWFydGVuIExhbmtob3Jz
dCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiA+IENjOiBKYW5pIE5pa3Vs
YSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiA+IENjOiBMb3VpcyBDaGF1dmV0IDxsb3Vpcy5j
aGF1dmV0QGJvb3RsaW4uY29tPg0KPiA+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gI3Y2
LjE5Kw0KPiA+DQo+ID4gQ2hhaXRhbnlhIEt1bWFyIEJvcmFoICgyKToNCj4gPiAgIGRybS9jb2xv
cm9wOiBQcmVzZXJ2ZSBieXBhc3MgdmFsdWUgaW4gZHVwbGljYXRlX3N0YXRlKCkNCj4gPiAgIGRy
bS9hdG9taWM6IEFkZCBhZmZlY3RlZCBjb2xvcm9wcyB3aXRoIGFmZmVjdGVkIHBsYW5lcw0KPiA+
DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljLmMgIHwgNSArKysrKw0KPiA+IGRyaXZl
cnMvZ3B1L2RybS9kcm1fY29sb3JvcC5jIHwgMiAtLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KDQo=
