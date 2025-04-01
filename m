Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332AEA7742F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 07:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC4E10E299;
	Tue,  1 Apr 2025 05:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FOubu6j+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200A510E16F;
 Tue,  1 Apr 2025 05:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743486874; x=1775022874;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jk4N86CEoprqxRLO5nTOot59K8C+Mvkc9JEA5quRPrA=;
 b=FOubu6j+eJN+jCrQgHBUhqzclUMOvW2TyPxDH9QsMt4hR7OfUdywMjpu
 HBnp6JsDYAU602hVrTrdRSRJxKBbdxyfjXBY6h5j0pgcTrlNPAAXSK74x
 kg7N7dG4TmFeQYJeJpoZtpS/yQhpBnPYIdx9yPCJRYnTA71GVPJ1/LZDQ
 I5pru/OJePmYG20wm65PvNuiD+6f/UN2QRaCeboxcwI4wN2Uv98GdTPfA
 eRkAHN4Nu9zyWrP0/hGnXXnI/XRoeBKqyrY443dF2Y5CqbFN3XXOgSuDP
 QlJEK+ePkp7OvrY2vx3FDwlLSgwVmzM86sOy2bd7QJW3jcZOifqVNkwyK w==;
X-CSE-ConnectionGUID: ouKIwqowSIiFN6LxMSAzkg==
X-CSE-MsgGUID: 5hiCw/JpQfKAGR2iM8rhEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="56163618"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="56163618"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 22:54:26 -0700
X-CSE-ConnectionGUID: csV88yUUTqereWsM8Cb6yQ==
X-CSE-MsgGUID: 6g/irnjlTqSFFWzWPQ3dOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="131285562"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 22:54:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 22:54:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 22:54:25 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 22:54:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkeruAEqx+hqqz4U6Tu4Vf9zJTBkJ90W8ysOvgWGcASgGocexFBXvHAdi3WP+TbwQwiTCTNfh6K14Th+z/xTUlZOGEirXGR7EweSpl/Y17tYIEM9+2Pf1rwKlwQiPe7adIvHJbdzBfyH0pESuAT+Uhlu3WHoCTFyCp8b61UrS74NVsoyRMRD/HK8MjivJLuCJBCZIWEtLAe/hE5csRj6QdDpnbQEv6czL51jBV6TDunxwbzI1gdZUgsD9Zc7t7KKsOZQRa8vhUifaTBvAXd5IMK3To+qa7YBzR+bOj6IXvfrDIGGPKRI4V5ebAQvQr3r/QN0f6A5mRFQRnIrwFdMIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jk4N86CEoprqxRLO5nTOot59K8C+Mvkc9JEA5quRPrA=;
 b=UlDmno8LtwtfFPYB5kABRkDDWHRrSSu6C7kaEh0Ix/aFrKj4q0L1ErRq1lmpELgG5kGvCcnLn6r/xRu0tFfxiDcI/o6A7WgmjZ7zHsb9gSCLYF3eAgbiBK5OXmX5UPerAC08KDI0EaQIyAfFr8CMcGw1kyMsRbuLRsunQplhdDUYz149KPngRlkGAzn1a70/qObgREu7NMIn9lOqMN//rYmdRiXdpoLhZrAg2sn6sy+CwiHLWF0lQS+7YAKTclIcyOEkegtMU8RK0DZJYG7pcQJrnHiNzrC54x80dxG9h1e8LArGZtECgV+KwnUI/MN1Se9ml4XjzyhsS0DpjbB7gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6477.namprd11.prod.outlook.com (2603:10b6:8:88::17) by
 SJ5PPF06F7EC6B5.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::807)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Tue, 1 Apr
 2025 05:54:09 +0000
Received: from DM4PR11MB6477.namprd11.prod.outlook.com
 ([fe80::708c:96d6:bf31:36b2]) by DM4PR11MB6477.namprd11.prod.outlook.com
 ([fe80::708c:96d6:bf31:36b2%5]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 05:54:09 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 09/12] drm/i915/display: Set a scaler mode
Thread-Topic: [PATCH 09/12] drm/i915/display: Set a scaler mode
Thread-Index: AQHbmnv9juP6pRc0JEmwObWhfdyxw7OOW0eAgAAEGsA=
Date: Tue, 1 Apr 2025 05:54:08 +0000
Message-ID: <DM4PR11MB6477697BF07A9099C97BA2C4E3AC2@DM4PR11MB6477.namprd11.prod.outlook.com>
References: <20250321160628.2663912-1-nemesa.garg@intel.com>
 <20250321160628.2663912-10-nemesa.garg@intel.com>
 <2d020b00-cd4e-4802-965b-191ba9d64eaa@intel.com>
In-Reply-To: <2d020b00-cd4e-4802-965b-191ba9d64eaa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6477:EE_|SJ5PPF06F7EC6B5:EE_
x-ms-office365-filtering-correlation-id: ed70055c-0cde-44dc-f468-08dd70e19eca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?akdRR1Vza0JoY0doVkc2eCswcm1uS1VUQnNsckNkRnY1eTIwd1hRTktseGtE?=
 =?utf-8?B?RE5mUnppZjl6SGVHcytsdllPSkE1N1dmUjk0K25iaXgrZS9pNmZXTWFSbTFu?=
 =?utf-8?B?V3BYeFFMdXpXNmRwdVg0MTJLVk1pRGlvUlRsYTB0UVhsblo0K3c4QWJQeVcr?=
 =?utf-8?B?MjdQbVRpRXJ4ZkovZ2pQVTd6eEZJVzFQdi9jdmxiM3BvRFIwbHAzbWpmc1By?=
 =?utf-8?B?OGdmeU5uQTA1ZnhQeUlJcXR0VFdRVHlqZFk4YzFnQ0VNMDlsaU8zaTZJT0ZI?=
 =?utf-8?B?N0U1dUFaeFpXVStBdG5yZjN2S0h3eFpwWlR2aWJ0SGhnSkp6QS9JNEpOZUE5?=
 =?utf-8?B?ckxvcnd3TXNWYzhvYXg2QXY1NDNOVnhuTk1BSHJGc29mUVhRZmVVNHhuYkpt?=
 =?utf-8?B?bDBLSTBzY1JMNUMraE9hcnI0MWdOTi9odlNlbThzU3hFSkg0Q2tOT3k1eVR0?=
 =?utf-8?B?d2NacGNzMSs5cGt5QlB4MVNJeERGZ3hzbjZDNmEzbTVIRVBuSE1kM2p0Z3Jz?=
 =?utf-8?B?c0lVM2M1M0ZCTld3d1N3dzFWckV0dTFnc2E0bEVFVXVZSU1RdE1saHQyQWx6?=
 =?utf-8?B?SjdjQTc2cENNSHRXUC9NY212dEdQWHhyT2hBR3dUOE0xMCszOFdNckJoZldK?=
 =?utf-8?B?dkc3S1Q1eDQ1TXRBV2REVlQ1cWJ5TVhqcDFLNitUaUFmK2M5NXpjWTQzZ0Uv?=
 =?utf-8?B?N3hpREhlVm5YY2RDNFFLZ29qTjR4R05HTmZaQVAzWno1SWRRS3VhdFhUa2dS?=
 =?utf-8?B?WnFGN3haVzRCTlNEVHBOTzBpaXh0WDJsTWZIdHJWQ2M5Uzc1QzlvZkxza1pr?=
 =?utf-8?B?MkhsQlNKdVh3WFowSmF2QkNsVDg0MUJVYjg4QUhyb3MrMHJYTEdvL3JKMVhY?=
 =?utf-8?B?YUJWejRiUloyZ1dYSTVUbTJPajM0MTd4eUVNSUlONmRhdHV4Z1FnekdvSGwx?=
 =?utf-8?B?TFlUVWluWnIxS1JTWWZSWXFZOVhBRWdORm8vS2pJT3RiWktjZFppaU5ZUEZw?=
 =?utf-8?B?Rk1mYUFFeVpMWHg2SWRZd3kzYSsxRFBuYVhLL2pWcG9uVTlMbS9sL1pVd1hi?=
 =?utf-8?B?M0h5SEVLTkQ3b1BVcWlidXlWZkpkRjhLR1NrY2tXeVZnaUVyakdmVlRqblh3?=
 =?utf-8?B?ZnA2RDdLN1VFcE1CaGV6Nis0RzV3NWgvQjJzZzRxSnc5cGZ2UlgwcXl3ZHJ2?=
 =?utf-8?B?cWVXay9Bc2llVFFHYjdiM0R6Q1kwdXVOSGdFSGlNazduRldtNmg1WHpCNEZV?=
 =?utf-8?B?Z1Zqcy9SVXQrZHAyL0JFbWR6Zk5QZGNIMDNsMU5KR1RhSkk0SzhWU2N4OTkw?=
 =?utf-8?B?TWk0blFReFVXS2pPY0xiVVN2T0l5Y0pPZlQ1djVSSWExVlpDYmhXbm1yKzNs?=
 =?utf-8?B?d2tnYVUwZ3F2VEU0UVBqTzBpRnpvblBuZ2JKMlN1d05mM1FUSFJhT1owdUxU?=
 =?utf-8?B?bzNwbjExK2hvUkxONktkVkM2M1JwMG9PTXl3bldqaGprNUkveWNXeFkxN1dQ?=
 =?utf-8?B?M2NySlZ0a2lsYWFLUEVSMHZab0xORk5mQ1F6SFlabkpBaG1RUUtsbjdyOEo3?=
 =?utf-8?B?b211dUtxK1BNc0s1bTArbzJhQmdKb01UL3BVUmV2NU5sS2RaSzJBRGNvVjVn?=
 =?utf-8?B?SUtScDd3MFJ1aW40UmNhenBRaHVjcFNqL3M4c0FsaVdTNWpwdWk3VVdyNk5h?=
 =?utf-8?B?cXdyRXlXMHNvMUIrMUxqMjlTWWJ4dERzRFRqNjIraEhKWGhCUllQOGduWEh0?=
 =?utf-8?B?eFFXcHNTWGZVN0RRUk9OZGppakMxL2szbG1xMGx1cTVUdTk3eUtpODZXZzNV?=
 =?utf-8?B?L0M1VTdmWnVYa0FWUk53VS9NazBndzdqY0g1QWNMOGFWdVl6ZVFpWTdKbFJq?=
 =?utf-8?B?VVQwWDdyektkckRyZjBOd045dURwN3FMUWxtd3VyMTBaSy85NnExSDBQaFRV?=
 =?utf-8?Q?L1Ml9jPkqrA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6477.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UG1EQXdyVktQQW10NlV1WVhFaldreUZ4QWdWSGorVjRMZUNLWHdmRnhmdlJ2?=
 =?utf-8?B?a1FkcE1mVlpleXV5MkRUV1VybHlpRzIyZFdPSGxlOUY5UzE1TUFMVE0zU2V5?=
 =?utf-8?B?NStTajgwY1pDaEJQckV2VllRYlFucXlOdFJIYlBKQjNvODRveDZyb0V3WFRJ?=
 =?utf-8?B?RVZpQzBYbUdKL3llbG8yWW5sWXJpM0N0eFFWQjRzN0Urb1Yrb1BRZmNCL0Q4?=
 =?utf-8?B?R3JCaWMwQS9ZK0pMTmROREhaYUgrM1JCTUVLY0k1Y2ZVMytEQTMwdzNwdVZ6?=
 =?utf-8?B?blpnTzM1elRld3RYWlEwb0ZmdFpnR2x3VEEwM3puNnE3ZjdZbGpQYWNYYjlD?=
 =?utf-8?B?alhXY2M4aEVBREdKeXJ0TklzU0JIemxxYXJhL1B2a1NwRXRJZENFbGFPbEhR?=
 =?utf-8?B?OExhdXlkQmRSa0ZrUDVZZnkyeStId3lHeVBPRXlxZi9Ga2tGUmJaT1c1N1dE?=
 =?utf-8?B?K0N0OHBDOW9qWGZVT2wyaS9XTHhaTFFQV0V0WDBmYzlJWktLQXREZngzMUlJ?=
 =?utf-8?B?SGhrN2g4UzRObmhlSytFZlFUREFQWkIzN1E0WUFmWklaM2t3WXhmRXJIZ25C?=
 =?utf-8?B?RlVnZzJrYlB4Q0VOaUtITVR5MVFEWnZnVUIwS2svUnRkcGJwT280SS94aVBl?=
 =?utf-8?B?SUR3ZC9mdDF6WFhocDdmR0ZsYy9pWkc1UUFyWW50b2h3SUVqWGViV1JMS1Q4?=
 =?utf-8?B?Rlc5aW5mMnd3d1dMOFYrMlBJL1cwNEdLeXpEaXlnRGF5aEQyRnlCelpCa00y?=
 =?utf-8?B?cGV5UVhJSGprMHNqRE9yanVrUzA1MFBwUGNsaGZqL1dIWFpEMkliMHpnRkdP?=
 =?utf-8?B?RDJxOTRhdTA4VklhVUV0OWdEN3VVZFBzSXdJa0g4YmZFREZTMXlPcFRRb3hT?=
 =?utf-8?B?NmVHM1ZtK2FOYW1TaVlHRUEwNkxON0M5TVVzL2Y4aVFGQXI2eFhFUEZRWUkw?=
 =?utf-8?B?ZVRlK2dReGRWV290bGxkUXpMOEVDVkpPbkZWWWtGTC9UN210NVlRTkUwRDhC?=
 =?utf-8?B?QkVOcVovSkxYZEJ0MXViRW1DWnUvUWxlOVEzNnh1Qlp1c2hEYjRiNHREZEVm?=
 =?utf-8?B?ZysxQkNhb1RSZmptY0ttZ2NDS2psODdGd0ZBaWdabit3WjRRZ2EvSTQza25l?=
 =?utf-8?B?c3JmdldXQXI2Q1JTc20xNzVlMUJIZlc3UllTcGxMUXRoMjdjQk1ncEIwUGVD?=
 =?utf-8?B?TFhESlVRcTNDLzBlTVlCOWFGRC9PKytZRk54Z0N6M1l4czhOZU5rWGtpaFB2?=
 =?utf-8?B?c2UrYUV5STZmUVY0NDF6VG1TSER4Zm16Ylg4TmVqYk5KRXphWC8za3ZZNHVG?=
 =?utf-8?B?WDVDNi8rM0lsWHRkcWdFZVBqY3pPbVZxbkRCU1I1b002TnAvYjc2emxYV1Zz?=
 =?utf-8?B?a2tmeTV3aWswcTZNREJLc3p5ckVKYytzMVBtNXFsS1dtMURUNno0QVhicG1o?=
 =?utf-8?B?TFVNMlcyanZyZ0ZOZDFYbVhLdko3ckkxVno0U1BuSjBvaFQvY0F5aW95RzhH?=
 =?utf-8?B?OUpEbG90MG93SmhQY2VnZUZ2bUQ3Mlg0bjR5UGsyZVBicTYvOXg3dEdiVGt4?=
 =?utf-8?B?VWloQ1ZOWW4vVUkyNDA1SGpCK3RoakVRcUlTRlZwcFVTb3NqOWNDMzRnTU1C?=
 =?utf-8?B?NVdWL3IyQlRuOGFQMFlrZDlPajRvL1N5NUJPZ1hCUjFPVTFyVzNxSE9tdldT?=
 =?utf-8?B?Zm1ZdldPOXU0YTJxSG5RaSt4TnZ6STZCOVdyb21pQmxBdGhFTUtiSkNxYktP?=
 =?utf-8?B?bm5kOEJBb2lqSFlqZVExb2dXVUx3Z1hYQkVDRlFleVhTNG1TUEgyYVVWZzdC?=
 =?utf-8?B?UUtDMmRvOVRNUENodEdJNjliK3dEVGdqZTFKMDRCb0l6OEVDQTBNT3RtOGhV?=
 =?utf-8?B?OTRLSHU1c0h4RGtEanMyVDVnYUduY1pPZEJGeDZZb0t1WDA2dWhDc0FybnJC?=
 =?utf-8?B?RWloZVh2ajJ6Q2ZlMnF0aVhyVTZOSlJwMHEzRU1JZUdldksxL2VqMysyaDBO?=
 =?utf-8?B?c0VoU3locVRqZDZJQTF2NlJXdGQ4c1RsSHpzL3hIeGFWZEg0R3JwZzFva2Q4?=
 =?utf-8?B?ckxiZ1BLbkQ0WkQyTTRvMXNuZktoblpZV2w5eDZnNnhjVnkxelpuc2hzMkNF?=
 =?utf-8?Q?30RAwfQUQN4Urq2Eh7KSWDhMj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6477.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed70055c-0cde-44dc-f468-08dd70e19eca
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 05:54:08.9980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G66vRRC6K6a8Zpti06RZFaNSb/IBNLKJSltDr/j5GUJRnQUQwt3BDGvYFCDE/Ghv2sqhEddouhjmPTHgAl1cvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF06F7EC6B5
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmF1dGl5YWwsIEFua2l0
IEsgPGFua2l0LmsubmF1dGl5YWxAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAx
LCAyMDI1IDExOjA3IEFNDQo+IFRvOiBHYXJnLCBOZW1lc2EgPG5lbWVzYS5nYXJnQGludGVsLmNv
bT47IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGludGVsLXhlQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDA5LzEyXSBkcm0vaTkxNS9kaXNwbGF5OiBTZXQgYSBzY2FsZXIgbW9kZQ0K
PiANCj4gDQo+IE9uIDMvMjEvMjAyNSA5OjM2IFBNLCBOZW1lc2EgR2FyZyB3cm90ZToNCj4gPiBT
ZXQgdGhlIG1vZGUgb2Ygc2NhbGVyIHRvIEhRIGZvciBjYXNmLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogTmVtZXNhIEdhcmcgPG5lbWVzYS5nYXJnQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAg
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3NjYWxlci5jIHwgMyArKysNCj4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF9zY2FsZXIuYw0KPiA+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9za2xfc2NhbGVyLmMNCj4gPiBpbmRleCBkODE2ZGFlOWNlYzQu
LjkzYTg0N2MwNTUzNSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L3NrbF9zY2FsZXIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
c2tsX3NjYWxlci5jDQo+ID4gQEAgLTM5Miw2ICszOTIsOSBAQCBzdGF0aWMgaW50IGludGVsX2F0
b21pY19zZXR1cF9zY2FsZXIoc3RydWN0DQo+IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUs
DQo+ID4gICAJCSAgICAgIkNhbm5vdCBmaW5kIHNjYWxlciBmb3IgJXM6JWRcbiIsIG5hbWUsIGlk
eCkpDQo+ID4gICAJCXJldHVybiAtRUlOVkFMOw0KPiA+DQo+ID4gKwlpZiAoY2FzZl9zY2FsZXIp
DQo+ID4gKwkJbW9kZSA9IFNLTF9QU19TQ0FMRVJfTU9ERV9IUTsNCj4gDQo+IEkgYW0gbm90IHZl
cnkgc3VyZSwgaWYgd2UgbmVlZCB0aGlzLiBDb3VsZG4ndCBmaW5kIGFueSB3aGVyZSBpbiB0aGUg
U3BlYy4gQ2FuDQo+IHlvdSBjaGVjayBpZiB0aGlzIGlzIHJlYWxseSByZXF1aXJlZC4NCj4gDQo+
IElmIHRoaXMgaXMgaW5kZWVkIHJlcXVpcmVkIHRoZW4gd291bGQgYmUgYmV0dGVyIHRvIGRvY3Vt
ZW50IHRoZSByZWFzb25pbmcuDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gQW5raXQNCj4gDQpUaGlz
IHBhdGNoIGlzIG5vdCByZXF1aXJlZC4gSSB3aWxsIHJlbW92ZSBpdC4NCg0KUmVnYXJkcywNCk5l
bWVzYQ0KPiA+ICsNCj4gPiAgIAkvKiBzZXQgc2NhbGVyIG1vZGUgKi8NCj4gPiAgIAlpZiAocGxh
bmVfc3RhdGUgJiYgcGxhbmVfc3RhdGUtPmh3LmZiICYmDQo+ID4gICAJICAgIHBsYW5lX3N0YXRl
LT5ody5mYi0+Zm9ybWF0LT5pc195dXYgJiYNCg==
