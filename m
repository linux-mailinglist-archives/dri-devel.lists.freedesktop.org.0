Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DBA948257
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 21:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E8810E28F;
	Mon,  5 Aug 2024 19:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcZJgXRn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F63610E0BA;
 Mon,  5 Aug 2024 19:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722886447; x=1754422447;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=seiF0Bz3oBy8FwoZKcdj9P/NWJhxfVs26n2cbHqWWhA=;
 b=gcZJgXRnmHb7BSes8nGeOhzE64ExGKr+Wu2d23pw0c6XKTEfqeUYvZw8
 cOZSbBbZPJKCHams75kuBRXF6pFGV/WDzBRzGxB9Rs1pGMEMPp/0pWco0
 gYFn2yc2WWgzaAsTz/SZ87+3DTpBCo1oheXvvhkcB18HW7i+ww3cU3UvR
 lDbF2NnaAtWO9qnRuzWy6kHi+MgmtgI2RfEeWepeh0MFLKp2D1t5ppx/k
 3wPvjuVSkDjrgwqgp/uH56Yj6yeHd15ltMteO6glsUfHWqq2rahQDS/uj
 Xo1a9wwOqMh3mu4Q0f7Qk55FkVW8nlHUTYKFpZodDjzzVMPXigYETKKsS A==;
X-CSE-ConnectionGUID: mFLdDJUkTIGa7T+sroKWZQ==
X-CSE-MsgGUID: wTMfX0KiStmBcu6jPPZ41A==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21049755"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="21049755"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 12:34:05 -0700
X-CSE-ConnectionGUID: GMLEWlb3SWSQdVox5iTUww==
X-CSE-MsgGUID: JJKptFCTTbuSdT4Bu5w49Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="56471527"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 12:34:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 12:34:04 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 12:34:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 12:34:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 12:34:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkLCWkeyzqF3qnxGgvvb2q9SFQRr+NZqWFEH+sFSg36TedCiFJIrGUouIhOUnj14g9Laeq3WoLuSfMIvLFJhgW0DXvddNcJqQnERpzqrfR8zqIjJgS0UAj18gSARlbRq98sDmLrMMqJImzpoT4rdOJASgCNyfYtruijyznMx14UyA8EB3JTn8a+Bh+8XXyBJF5zYQLK60TgN938Zl767+2xFGvUJNDXQvz6raSOrJo1e+3uVKyUUzu1kKTyQajb2rgfZDcvABzV+E7zgK/opXB4d52LO8zgXYcUta9FK+z6gpwI0cRvv6yIJaAhiCLyJR54j99VTr6ZRBlRSdFvPWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seiF0Bz3oBy8FwoZKcdj9P/NWJhxfVs26n2cbHqWWhA=;
 b=qOPlB62oU6EzFdjrRpkGf2emhlSYhPZuAhJCOcFepkimjOuyQ0ijAwrpl1x+b5o68g6lxaG2hJJWPYC49hGBbhxtRleazQxIcVy6iHpTeFaLxIv42gOakQLyAnpVcDnb7ab+PxgkiOms9zuKOa3lMdY6KaDoAPusu1/mrPTLiAu9WQ0XBalrYxQtRmkjFXw7Z6ofEUVJJKkb6feWoxSRd3EmHe2S7h2hECCKbJ8uRLUzV80iJmh5IWIVkzDM+0SP0zec6djGqDKrlC+A6M0tO9XaSv+GjhWLE4DLIfHvblOffKlrOhcWgfAdjgaje6sBWCISU2adYOoUaTIWXXL0kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB6446.namprd11.prod.outlook.com (2603:10b6:8:c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 19:34:01 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 19:34:01 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Thorsten Blum <thorsten.blum@toblux.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2] drm/i915: Explicitly cast divisor and use div_u64()
Thread-Topic: [PATCH v2] drm/i915: Explicitly cast divisor and use div_u64()
Thread-Index: AQHa504Vr0soS6Wu20upzoVIfgfOr7IZC92w
Date: Mon, 5 Aug 2024 19:34:01 +0000
Message-ID: <CH0PR11MB544400E7751E4A4090DBB387E5BE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240802160323.46518-2-thorsten.blum@toblux.com>
In-Reply-To: <20240802160323.46518-2-thorsten.blum@toblux.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB6446:EE_
x-ms-office365-filtering-correlation-id: e33f7141-d7ad-411f-a96d-08dcb5858ecf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VVV0NGRLRGxYSVl1ejlNR0hpLzhOU3MxWk5uUUlvTTF6T3p1eFBIYWYwVmJ6?=
 =?utf-8?B?cUx4SHhieS91V1huMUJrRFNDOWQ5WEpPbm03dktXQTBCcW5HcHJGUUNOdXNy?=
 =?utf-8?B?SURJSWdUY0RkWlJHc1JXM1A5OTBuRzMyVHRMQWlHWVNxL1pXYmpwMTArNk1P?=
 =?utf-8?B?SnEwVXU4QW5VZGYweEFvYjF6b0tUSHRNRTVoTzZrdHNUcFVsL2txTHlhYk9l?=
 =?utf-8?B?TEFwbThTQ0VGeG5hdTI0cVN5UHJOaGN3andYTkZvRkIwTit2ZmJScVh5VE1o?=
 =?utf-8?B?M2NLMHlRZEhYV2pZR0pFTmxtT1JUd1AwbVo2K3pDQ2pKUkQvSzQxbkVXMWx3?=
 =?utf-8?B?RlRadElpU0JwQjYxbDU5OUVZSlJBNUdVUDdSOHY3RlNGS0ZyOTkwa0h3dXJu?=
 =?utf-8?B?bXJtU0F6ZlVqZ1ZLUkZ5bk5lVkhMVFdxK3Z1WFB5bmhBYXNpNFNxNzBSN1Q3?=
 =?utf-8?B?NkRocU4xTzMvZ1U0dElWbnJlZVV5aTA2ODhBOVhZY1hVcmhITkJqWEdYNmdI?=
 =?utf-8?B?RVdoTEd2RlVaSWY3b3Bkem8yUzNpU21xNEYxZXl1VzFZOVNHclQvbHRaL2l1?=
 =?utf-8?B?M1NudWoreUV5L2RYeXVmYVRoY3k3OFNraGZncTJXVDhzNlB5LzFKak5ub2xh?=
 =?utf-8?B?Z1dtZUgvVjduRkpIMDFNNUtuNk5OZ0FUZ1h3R3BFdjhlT1BGMTgyTUkvRWFF?=
 =?utf-8?B?U1d3K2RSWlZUNW5sQWhVN0ZCVEYzL05aTkhrMzZzVE83RXEraFgzVTRzU1hj?=
 =?utf-8?B?N0JrQlJFbm1lZHFKdTFLOGpkTXNwZVByeUNScDZudjRaL2Zra1hpb1hHZ0JD?=
 =?utf-8?B?MUk0UFdnQVRkMFUzbzVFbnhQSzc3RkIxY3p0M3hBUjFiY095djJvUkVxZzAw?=
 =?utf-8?B?UjdEalFUblYrSUQvT1ZPMFhQaTV1Ukx5L2xRN3QxZERmUm14azNLN21GVlpV?=
 =?utf-8?B?eXQ0YkJRNm9TYVp1dUNHSWZXQjlrVnFqZ0FiaXoxdmNuc3lqeGNvaEZPanpV?=
 =?utf-8?B?MmZRMjBiSE1kVTEwS1RCcG5ZRk1GdDQxRnBRTG9LenJoTWk5Y2dYN0VIZTc4?=
 =?utf-8?B?ZFRtNXY1cG1xVzBUM0NiUUNaOVZLMVBwNU9jRGwwSE5ManlyZHY1YVFEK2xy?=
 =?utf-8?B?bG9heXplNVBjaURjbjM1aGZFcEhuRmpxa0JTMnVMUW41c1NIbDVHSE8xWWds?=
 =?utf-8?B?ZmMyYjZrdjhhK1phc2pSZDJxaTZNWm8rRjhQejRMc2V4SjFqOCt4RjJycTNn?=
 =?utf-8?B?bkZEd1JhZkZuOHNJV205UFhNa2g2VFNjb1Rud2dvdm9EK1NqVTd5dTFUQ1Rm?=
 =?utf-8?B?ZG1XWFZRaHJxTGhzWC9LTGt3RW1WUFJEVkZZQ2Z5aVNsUWdaY1NqOTFkdUtl?=
 =?utf-8?B?T3RMMjZBYWpvZnpkRW9QUW1ubFVTamJ0dmhjTk1BRnd5SVpiQ1BPNWEwSzZX?=
 =?utf-8?B?N000WFdETHVhaWVOK0YxcXpaY0k4RUhuRmJ2V01leFV3U1FGdWtJT09KQ3pu?=
 =?utf-8?B?ZUFFVm9yUzVXREp0TkRkMWtTQ2dabTdrSHBkeThHaWZ0VStkQzd5SFdvZngw?=
 =?utf-8?B?NXZLTXNVdEgrYmVUdG9VbzdZSDVMakdvZWJoNFpGV2hpRDBZU3lxSnpQREZv?=
 =?utf-8?B?R0txVjlpbC9lak1NQlNxZmZuM2FSSTRNMVl3cE51VmhrSXkzWkpCQXJBMW9w?=
 =?utf-8?B?STFCbVJndjdBUUxyU0UwWUtpb1JIajkxc3JQcmFKNjhiMDFBaGNPWWo1dlJY?=
 =?utf-8?B?NWQyTXdpaWpTM2plT1p1MHZIb01VK1A5aW5NaFNSUVRLdUZZWFNGcEhrQkYw?=
 =?utf-8?Q?Ed/YWhraFoVoWogIFWj1ZBQ0it8AprzPAWD9w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTZtRVhlNGtMSm1RSHRzcmtwYUdJUU96djEwWktGTC9GRXRMQkZjYWxUcmhn?=
 =?utf-8?B?ZG9EWUxTTXZPczhDZTRhZ3d2cGVXangxalBpVFlsRjZRcG40STd3UUVSdVdB?=
 =?utf-8?B?RlFKUjRtd2NiaEMxVTZDWStRWkxzcnZIUk5PdUdPYzhJUHRzbDdnNXAwellO?=
 =?utf-8?B?eVUvbzFyVWoybmRRNHVwYmxkTFprTWJZMGpVcUVRbnAxRGJqYzdXMEROL1Nj?=
 =?utf-8?B?czAzSUVJWUhMcHFzVlQzc0pFdjlobW1Ba2ZjYnZ2dndtM0Nsb1dTWGsrWjRJ?=
 =?utf-8?B?c3g0ZDhUK1c1OHVSM1dhTGVlalpHMFFuVUN6MnpUQnlHQUh3V3lqOW1OY3Fs?=
 =?utf-8?B?Kzh3T05DbzhUNkV6TllRZjBudWFHNmhzMlZmMjFGT1FjSmV3UW9mbHNURGdp?=
 =?utf-8?B?ellFSmd1MVZoNzdKT3dXVCtUdE9ITWtETTdrUEJPNDN0S1pEUTk2YVJDTkF2?=
 =?utf-8?B?UEZneTN6dllXUGlsdDlVYmxvL09YUWY1d09DaVJXTTEzVFBiWFhWUjRqeWwx?=
 =?utf-8?B?UldueWJkMXpvc0FyaVpNamFENm5lRE9qcVdCVVRYWFl4STFic0lmK1E5ejZh?=
 =?utf-8?B?bCt0aUMrNEhOSlVHdko4OVpuMEl1cTZ3K0ExT3ZiWXlsWjQrSkx2TjJBU0Ew?=
 =?utf-8?B?Y2Z1R3IwUXFaLzJiS2xEZG9KUFlIU1VCNUZjQlBwSU9XbHJvVklXcjJFREN3?=
 =?utf-8?B?Vy9EOFVINWVOdXU1N0lwVGRVeWlUOFBsNHFZUklJeFFWaVpRMENNUmJEM21q?=
 =?utf-8?B?VjQrZmVUTktKQ1E2c0lVTVcvNjZyT1dqR3E1WFoyaUhxUEc4SlFqWmRsZTJS?=
 =?utf-8?B?S29MbVJpTmhOeTJIcTY5NDJqYUhCVUdUSjhNZXdraHdRNVM0cC8wRmtybC94?=
 =?utf-8?B?bUk0MDhOcEFVVEFUSnRaNVJwdi9uUkRKQ1loekdNcld0ZStrVE5ML0pBMlhC?=
 =?utf-8?B?QzE3WXV3OUNKbmRZaHhZYkFtMnNCWW84ZTJESTJpbDhqZ2NVVlQ3dVh6cldK?=
 =?utf-8?B?WFlDT2tSVjRxZjF4VnlJTXNZRGRmK3NJcFF0R1dUZ1gyNzlGNTFBbmhES0Z5?=
 =?utf-8?B?azNGMHJLN2JVUHkrL0RuaEExZGtxNEljSERta3ppc2JBbDVDUHpXOU0vVVZ3?=
 =?utf-8?B?bmRHWGI1T2VIRkZvd1ZURWtzMUJXZytaRW1EbGpkQmNPa1J2WjRrSmlleGZT?=
 =?utf-8?B?S2VTNlozeEhTbzVXVG1PTzRhaTgwbkZmRWMyMnNUZ3V5Y1UzTHFXOWlGRGdH?=
 =?utf-8?B?WjlFdmkveWNZVXJad2lrQUxSSzd3VElocnNYK05IdndGVlBaazFUdGk5MDds?=
 =?utf-8?B?Q0g5cHRoQnFKeUExN1NqWGJyTnFaYjhKaGhMNDE3U3JkRVcrZ0N3bDIydkNJ?=
 =?utf-8?B?amgydG9jQ3dBQ3NmeWFLU3ZDQVNrTHZUMlBSS2p6M1JXb0I1SG1WQXorTERk?=
 =?utf-8?B?SFFJeGlWQjlHVWVaUFViMTkySU9DNlhxa2t4cVZIS0tNMVg2WW9QVlU4dVZT?=
 =?utf-8?B?enBJNnRJTG1kc2dQSitSMitMN05reXEyVHZBNjJVS3hvN2N3OGNFbUlpblRx?=
 =?utf-8?B?OUpQY2ZuemV1MUtEalNVemFLazhXQ0ZieDBqbnVnVmhVVHFNY3BQVHF3K1Ez?=
 =?utf-8?B?YU1pTmIrMnhFNndDTmc5R1dpUitlbnozbm9vb3p3K1JXcXhna0ZnL0dWQktD?=
 =?utf-8?B?WmpkOHBGRG5TYkF0Q3g4UjBndjEvbFJSai9NNHRqUmZMdGUzM0Q3RGdhSWhs?=
 =?utf-8?B?RnBESDdBZEgxaTkrWnExZ24xVTFUNEhldE1hamZ1ZllnMnRQQm1Kb01DZlVE?=
 =?utf-8?B?aEpPS2VQM2hXSmltdGtGSGJzWm9lemxkeC9wOW5VdUl2OERRa0VHd2Zoc3JJ?=
 =?utf-8?B?K2FzSnVKNXltUVd5RnhhRE14c3RqN2EzOU80bCt5SXlYMWRuQjhub2FJL2FM?=
 =?utf-8?B?YXBNSUxIWm5MNW1ZcFI1ditBSElxNXcwNUhHNzNUZjFMV3AweTd0aDJJVnBB?=
 =?utf-8?B?eDJDMnMxOHVYL0huNEpHekFmOEl2NDJqUUZFUmNreFFSRFNieDNvNTV3VWIw?=
 =?utf-8?B?UDBGMnhGZFNBZSswRXVNcWpHWVVacUZzYVMrQXhFTGQvRUw3MERXR2c0SmQ4?=
 =?utf-8?Q?TZGtmCkyeWbL4zNveA/X8zszc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e33f7141-d7ad-411f-a96d-08dcb5858ecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 19:34:01.0694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SYHHgeWV82LdYJrGQCGvHmdNwBxOawcaOCUkrsFxe9wOf7IbViBOSjrPEVSkvZaGVrLYT0gRdoJzOu3fAZC0WUmUGl2iDtGhUA3GNeCCpaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6446
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLWdmeCA8aW50ZWwtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVGhvcnN0ZW4gQmx1bQ0K
U2VudDogRnJpZGF5LCBBdWd1c3QgMiwgMjAyNCA5OjAzIEFNDQpUbzogamFuaS5uaWt1bGFAbGlu
dXguaW50ZWwuY29tOyBqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tOyBWaXZpLCBSb2Ry
aWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPjsgdHVyc3VsaW5AdXJzdWxpbi5uZXQ7IGFpcmxp
ZWRAZ21haWwuY29tOyBkYW5pZWxAZmZ3bGwuY2gNCkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnOyBUaG9yc3RlbiBCbHVtIDx0aG9yc3Rlbi5ibHVtQHRvYmx1eC5jb20+
DQpTdWJqZWN0OiBbUEFUQ0ggdjJdIGRybS9pOTE1OiBFeHBsaWNpdGx5IGNhc3QgZGl2aXNvciBh
bmQgdXNlIGRpdl91NjQoKQ0KPiANCj4gQXMgdGhlIGNvbW1lbnQgZXhwbGFpbnMsIHRoZSBpZiBj
aGVjayBlbnN1cmVzIHRoYXQgdGhlIGRpdmlzb3Igb2FfcGVyaW9kDQo+IGlzIGEgdTMyLiBFeHBs
aWNpdGx5IGNhc3Qgb2FfcGVyaW9kIHRvIHUzMiB0byByZW1vdmUgdGhlIGZvbGxvd2luZw0KPiBD
b2NjaW5lbGxlL2NvY2NpY2hlY2sgd2FybmluZyByZXBvcnRlZCBieSBkb19kaXYuY29jY2k6DQo+
IA0KPiAgIFdBUk5JTkc6IGRvX2RpdigpIGRvZXMgYSA2NC1ieS0zMiBkaXZpc2lvbiwgcGxlYXNl
IGNvbnNpZGVyIHVzaW5nIGRpdjY0X3U2NCBpbnN0ZWFkDQo+IA0KPiBVc2UgdGhlIHByZWZlcnJl
ZCBkaXZfdTY0KCkgZnVuY3Rpb24gaW5zdGVhZCBvZiB0aGUgZG9fZGl2KCkgbWFjcm8gYW5kDQo+
IHJlbW92ZSB0aGUgbm93IHVubmVjZXNzYXJ5IGxvY2FsIHZhcmlhYmxlIHRtcC4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFRob3JzdGVuIEJsdW0gPHRob3JzdGVuLmJsdW1AdG9ibHV4LmNvbT4NCj4g
LS0tDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gVXNlIGRpdl91NjQoKSBpbnN0ZWFkIG9mIGRvX2Rp
digpIGFmdGVyIGZlZWRiYWNrIGZyb20gVmlsbGUgU3lyasOkbMOkDQo+IC0gTGluayB0byB2MTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgta2VybmVsLzIwMjQwNzEwMDc0NjUwLjQxOTkw
Mi0yLXRob3JzdGVuLmJsdW1AdG9ibHV4LmNvbS8NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X3BlcmYuYyB8IDYgKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfcGVyZi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wZXJmLmMNCj4g
aW5kZXggMGIxY2Q0YzdhNTI1Li5mNjVmYmUxM2FiNTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfcGVyZi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfcGVyZi5jDQo+IEBAIC00MDk2LDE1ICs0MDk2LDEzIEBAIHN0YXRpYyBpbnQgcmVhZF9wcm9w
ZXJ0aWVzX3VubG9ja2VkKHN0cnVjdCBpOTE1X3BlcmYgKnBlcmYsDQo+ICAJCQlvYV9wZXJpb2Qg
PSBvYV9leHBvbmVudF90b19ucyhwZXJmLCB2YWx1ZSk7DQo+ICANCj4gIAkJCS8qIFRoaXMgY2hl
Y2sgaXMgcHJpbWFyaWx5IHRvIGVuc3VyZSB0aGF0IG9hX3BlcmlvZCA8PQ0KPiAtCQkJICogVUlO
VDMyX01BWCAoYmVmb3JlIHBhc3NpbmcgdG8gZG9fZGl2IHdoaWNoIG9ubHkNCj4gKwkJCSAqIFVJ
TlQzMl9NQVggKGJlZm9yZSBwYXNzaW5nIGl0IHRvIGRpdl91NjQgd2hpY2ggb25seQ0KPiAgCQkJ
ICogYWNjZXB0cyBhIHUzMiBkZW5vbWluYXRvciksIGJ1dCB3ZSBjYW4gYWxzbyBza2lwDQo+ICAJ
CQkgKiBjaGVja2luZyBhbnl0aGluZyA8IDFIeiB3aGljaCBpbXBsaWNpdGx5IGNhbid0IGJlDQo+
ICAJCQkgKiBsaW1pdGVkIHZpYSBhbiBpbnRlZ2VyIG9hX21heF9zYW1wbGVfcmF0ZS4NCj4gIAkJ
CSAqLw0KPiAgCQkJaWYgKG9hX3BlcmlvZCA8PSBOU0VDX1BFUl9TRUMpIHsNCj4gLQkJCQl1NjQg
dG1wID0gTlNFQ19QRVJfU0VDOw0KPiAtCQkJCWRvX2Rpdih0bXAsIG9hX3BlcmlvZCk7DQo+IC0J
CQkJb2FfZnJlcV9oeiA9IHRtcDsNCj4gKwkJCQlvYV9mcmVxX2h6ID0gZGl2X3U2NChOU0VDX1BF
Ul9TRUMsICh1MzIpb2FfcGVyaW9kKTsNCj4gIAkJCX0gZWxzZQ0KPiAgCQkJCW9hX2ZyZXFfaHog
PSAwOw0KDQpOb24tYmxvY2tpbmcgc3VnZ2VzdGlvbjogdGhpcyBsb29rcyBsaWtlIGl0IGNhbiBi
ZSBpbmxpbmVkLiAgQW5kIGlmIHRoZQ0KaW5saW5lIHJvdXRlIGlzIHRha2VuLCBpdCBtaWdodCBi
ZSBiZXN0IHRvIGludmVydCB0aGUgY29uZGl0aW9uYWwgY2hlY2sNCmxpa2Ugc3VjaDoNCg0Kb2Ff
ZnJlcV9oeiA9IG9hX3BlcmlvZCA+IE5TRUNfUEVSX1NFQyA/IDAgOg0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRpdl91NjQoTlNFQ19QRVJfU0VDLCAodTMyKW9hX3Blcmlv
ZCk7DQoNCkkgdGhpbmsgdGhpcyBpcyBqdXN0IGEgbWF0dGVyIG9mIHByZWZlcmVuY2UsIHRob3Vn
aC4gIFRoZSBleHBsaWNpdCBpZi1lbHNlDQpibG9jayBpcyBkZWZpbml0ZWx5IGNsZWFyZXIuDQpS
ZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0K
LUpvbmF0aGFuIENhdml0dA0KDQo+ICANCj4gLS0gDQo+IDIuNDUuMg0KPiANCj4gDQo=
