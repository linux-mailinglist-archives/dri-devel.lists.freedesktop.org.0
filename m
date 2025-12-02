Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C9C9C74E
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 18:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8EC10E675;
	Tue,  2 Dec 2025 17:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmJC4y8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB28A10E16F;
 Tue,  2 Dec 2025 17:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764697640; x=1796233640;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=go7AQooJ3n1U8q2LW4L5phZXivwq0y0g1eXb3+tyLcg=;
 b=UmJC4y8vpETeZl+80sDy4NxpOK3XilIAYSSXfz9azF5QqLqeNInnEe7A
 UYNIN7w7XrzlMSA+93Rc9uUSf7wbOjfSCEh1ZNZ+XxywomBkRSi91V5lE
 CWl9p6P6IY/p55GHrfqAqAuUpgznwlPnWhKYFeStHALOFB7K52a1Uvd10
 9EQQXgJx1PZcopndnuesS8vEINMCYioOvxH2ZD2rUk5ZZrWktGqRA6XHW
 HD33BT0Yf+2fSCjcyFxJPLScrzzv/hQ0y/8X2zTlK1rwE/oUWse6//jLW
 Y2t2fbUSp05+iJmTWSMcrd6pyL25IjBU5XpdC3PMXDijO8MhHHP7JyOlH g==;
X-CSE-ConnectionGUID: cr7SDedsR0mzD0ua86OozQ==
X-CSE-MsgGUID: A8d9RXimTCG88IJu7LNPhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70534034"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="70534034"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 09:47:20 -0800
X-CSE-ConnectionGUID: 1CTVVaWoSyqSZZJ1DBqF+g==
X-CSE-MsgGUID: kxx64UzdQUCS/i7q9LGFiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194113006"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 09:47:19 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 09:47:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 09:47:19 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 09:47:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L05fN4SllZvuGq+ZrmN1UtBv7+Xz21osxE9T7/GxcWll2ctWkuDXPKEj26wr3Wl/FQwB7JQF33lNbiyn+q5QbWhi9SMejVFmNjvrfs3Tv4DBlzu6k9eRk2D3TiKYXt6KrGZqlitdue3mOikbJcVGJr0YxjZckEbjFUx49C+NTdYFzRZX4ja8SifsTYJ0xIF2QTMKqAFYmS9TqFEWllegn8MhV2xokF6cjlQf29WrY9UwsBXaWwcNuR6sdtGa99uc58AQbn3Ua1K8gn15auQgxgDt81BH65t0VdBHlVevflA0/AqB5G2CbkQj2n/Ss7NP9YxuQCpwY5Cd8MCplqO/Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyNAAR13c5hkLUIySUtL0n8CQ4ikI7e6OxQeKwiUj8c=;
 b=XRqOhtpfoiZi2yE2UOwO+ERstDwt8atSvuguMfepdgqDCJH4TVH5kLaQcIC0MM0KJLHoepmKqizf82fCqgCZe6cus0MSw67lySFs6IBX+gGQbzv2NexcLuWm4TOTw/DKlLujtugFAyy9ZO8kEfgOhEkHhmHZVRNnFe4YvUrF0DYYEVMHrkn1wURODYWxCDn6mgkWPCid5VTYfebVd04ZmXonP4too/pMTStemfWm+96DnvPjhNDqd5rysE25ywCvxzadTXUD4HHSLzoSE8+zn/xHentOD8qWHuHkrhBpC5d1dE8iwEebwg1ER0KkpI/h1W0bNOYAEpRjXtj3q8K/tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MN2PR11MB4550.namprd11.prod.outlook.com (2603:10b6:208:267::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 17:47:16 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 17:47:16 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Zhang,
 Jianxun" <jianxun.zhang@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>, 
 "Auld, Matthew" <matthew.auld@intel.com>, "Hirschfeld, Dafna"
 <dafna.hirschfeld@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v28 3/4] drm/xe/xe_vm: Add per VM fault info
Thread-Topic: [PATCH v28 3/4] drm/xe/xe_vm: Add per VM fault info
Thread-Index: AQHcYx4Guf3P1lH+7E6YJG1reIhwcLUOm9wAgAAATwA=
Date: Tue, 2 Dec 2025 17:47:16 +0000
Message-ID: <CH0PR11MB5444CA5E17BC165FD91D7892E5D8A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251201235539.236686-6-jonathan.cavitt@intel.com>
 <20251201235539.236686-9-jonathan.cavitt@intel.com>
 <aS8hsmKCc18aGtM8@lstrano-desk.jf.intel.com>
In-Reply-To: <aS8hsmKCc18aGtM8@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MN2PR11MB4550:EE_
x-ms-office365-filtering-correlation-id: 9c103838-9961-49e4-0dcf-08de31cad562
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XUvcny5dInbPouj4WWNrLahHTRdQrQAI8AOZL3sNcolEQTkU5Xju55BpZlNh?=
 =?us-ascii?Q?enDEXVlY4YfMKsW+RT6/U6Fkzco+auTGSdHlGtYRqKua7dl3YFNYPEGxURCw?=
 =?us-ascii?Q?85Y69dJ7QkHWMYyImZFRhAHPPL0Q0+M2mbhqlyS5gg6iJhwRahru4Y/Ws260?=
 =?us-ascii?Q?ccvSVf24ZW+7rLX9ih+uX2ujyVxZML5HFUgUu25ImZQba4hwjDYi364n9BsV?=
 =?us-ascii?Q?+vE2qxZrrAZmyUxOl8g7sHy4zw1t1ZjNw3Vdne5IfctSwrCzbs2cIH8tNblz?=
 =?us-ascii?Q?sPhJkSnecGoizS6aruYGuigdYas5mZZ8QNRA9jPjxqlZ6WCIaC0GHIqqgIG+?=
 =?us-ascii?Q?NZsAFfvxCUSm276lVEz6j1kuUoJiHUsuId+yj+ieAYMK69HEI88wcaQTdBXP?=
 =?us-ascii?Q?YTz5iTxK9F6xIz7MFlxcexj8cEpvboY1r/lfkEvLXC1lKIZxU77h5FIDepzt?=
 =?us-ascii?Q?Okcp/10GDfCT4h4niA/QmfzFuphhu7iRHjUwf6nh7Gd73G3J7qx6L8BTIiHd?=
 =?us-ascii?Q?xEjF9Shg6osQ0zGSV320LdrlygIUYI5mVgi64CSPl4/W1xBQI9QtJq1U/Cwp?=
 =?us-ascii?Q?XqX6gYF1r7eC7g96phRcrjVoL2YcCbLFEtlNAhp3cXikq2VQWvHfpA+g42T9?=
 =?us-ascii?Q?+pCimVB/w0lgHSQotTAaZ8H07KEI1EtlxhaDJ508w2zUpb4KHhej+gDuCgvQ?=
 =?us-ascii?Q?fXxukt2iwVEa8VUbnSb31EImrKDL0MZHzpGZCRIBmowmqTwvUc19yQ8EoZle?=
 =?us-ascii?Q?tXLyu6p69cG7qQ4QFa3wYNjDogDeXxenTDC2fA9meFLMsjli0RG/16EV2ih5?=
 =?us-ascii?Q?Jr9fs5pbO7LelM3FBFF990fadb4ywCNXViLgWM93aysVInj+p+e+/E3QDKWM?=
 =?us-ascii?Q?q7ZIu2HlGse3PnOzZclUVEHTq2KKAoo5M61xe5qymd4iqa3W3B9O5HWWjOoB?=
 =?us-ascii?Q?5I2kxdhSbqmuCNsWRDbNleuhsjGESv1dzWX5qWkkpFEqtAIE9h5rjxAQgf+d?=
 =?us-ascii?Q?0oML/jMV2oHPXkaTX3yj8shHIzr6S9cGFadeiY/05oTnCK6buysSwbyoilmw?=
 =?us-ascii?Q?ySP4Z/TpKz6WEEMShv5odw5aXaYGK4hpKqZlBpBwlASbW2XsjN/ndrYkzr5k?=
 =?us-ascii?Q?eg59Hr/D6keY53QqfYgwyEPrA+0aro94GyOkzSbhkA6sZePFkGKDNk//LIWG?=
 =?us-ascii?Q?wZMlQxlPwbosYqma4ZlGzFt5k61kIanab4hoUiIjzSGhat+1lWqhUPrWTDxZ?=
 =?us-ascii?Q?I+ieWCpWtIMyglvSXzCN/73OAGy9n3Je6Bd4nzNmsQy59KvSU4chWu8ekSb9?=
 =?us-ascii?Q?P+dSS5wkUdsoYUb2OA4xRZ1CabXey6uCKLsiFfBngvJd3JL8Vu0/p3AaL66H?=
 =?us-ascii?Q?3kBI5Xmo2ZN6gPtXF60vNA9iD65ZUS2vWqwxG3el9fHQJeZzYRIcDwfdyeKY?=
 =?us-ascii?Q?NqgRTcPARu9Tn3fQPnAbdMGcHeGjHLF1pxWG8gJIPqHcle4c+3ppDVgQnTcj?=
 =?us-ascii?Q?rpn5KX1OU8ViNn57OFqPUH7fRlF8LSBt7/Ap?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+6TdCw0n7m/8C3Kq460sMcNjxQPBYrtLQ/EIOEyvZ6WFrNr3pTPCiN/sA6Lg?=
 =?us-ascii?Q?HMGb32CxLw3JExNP6fOgXVm+yDzJYqt7jwTFTWI8Vw1q3Ja5gINFgv6IZSRl?=
 =?us-ascii?Q?ztWMyKvfVnKOMXlODKpBSYdCzklC3b97J8oaZFu7Y5UWBBVfFEqKOCvFIugl?=
 =?us-ascii?Q?DIqTZP4U+gyX96qH5liW2zPHk+LQWvjery9CmKGOYBXorna+VimXbjrgh9NW?=
 =?us-ascii?Q?fNUXcE0Ak40Sg10/CpW2uw2XXNPTMeoIP+SPlquKloK6IHAlqS8HRJpwyv4T?=
 =?us-ascii?Q?Pjadw8Eove+Ldc3Vh6QnlfHXXmNj9UvadLs32Hx38FWfNKblVrVGQSuSyeGI?=
 =?us-ascii?Q?QMK+srQO4mrUoEvsFMxnzlmzMEC+1se8mEVqEq80hS7eD2I+KbmEHQ528T71?=
 =?us-ascii?Q?OWBUcMe5PhguXeNtuDVFPD4UgsPtszhM2g96j6C6jb3VHjSxS/Vcm3/x1DCv?=
 =?us-ascii?Q?umBDEJjA3C2Pwxd/EJF9alp6yDMYFHEuDX7EVSG4fWII+IpZox2XoBNP8J7V?=
 =?us-ascii?Q?+ePLhE+QxcvMEkFokD7W/rLixr4OCCnZp1G8X5JX0OtDuTIkioCZ8Datu0Ci?=
 =?us-ascii?Q?WLvHAbD2GN96HnjTsyVQBexIUdQ25lIyX+tvyuwtWXdJmKzBD0zcidRfOm3s?=
 =?us-ascii?Q?5g2RqgRNfnsgec6Kx6wGHSNkTCMM6diIjw0PSnyPX9LRsmj6QKdAkazqiYaM?=
 =?us-ascii?Q?4UwkbzoXv4uL/PjGsKf7Q2ENRSa8wmtrZRSkUWQP1vJAXdMaFA3YO9i+b+g1?=
 =?us-ascii?Q?14PWjskhF1/PuhbXjRKZ7a+fvt6/iTwZA4gYxdzBiK+VnIFZWJ028WJTIbqP?=
 =?us-ascii?Q?Sb7dvXIoVq6Wmvz+Vv+lK4r9C25O3s2NBmpUbytV7LoOj8VrO61i3mc3ozOX?=
 =?us-ascii?Q?RxO/Ewi8UOeVPdtXEmJPrr9vIqWDeKuLSD7TBRKDsSa/osUC+gnaomCE1b77?=
 =?us-ascii?Q?6UFkAMQcelixHRaGk2YQfXoDS6hKcxLcr67DkL1VoF6gE0JPKYZTfAOaIs1T?=
 =?us-ascii?Q?YhuKdRHzmvh07k+n7dnfQvs1YcfiF1wcL52OBgVE9ZYGf32Z1KWzlenYhOkP?=
 =?us-ascii?Q?fugw3yGWY2cYXR4W45pjRjWUo4cFt0panB06nwzd6L1gEr53XK0VN7BcbRBT?=
 =?us-ascii?Q?Tv91T9geIzqsdMc6Wlh3FjAr1YdECQR/L20AF2fW26mNZLvbzCMwma4IhkTB?=
 =?us-ascii?Q?LIgPXLs2we+ymzf2/qNCBSrbm/cKSvOtf0A6OWq2rwfJvangrDs3Fhmc1dGp?=
 =?us-ascii?Q?Zm84azjoMXDNnxz8P+HRY6K/m6bBgtBMlnFLtWJkmbZg3AyfjRb4uE9vnGKa?=
 =?us-ascii?Q?WaD3/yz1rVYROVg1pHrPTDh+6gZ3sCa8bs6W8ogPzqAmJUNPGcXmmIoAbzUE?=
 =?us-ascii?Q?jKOAnxasrdsZgiMvLjGzCqOQ5ZoP0epvNEERwrx0dKD17RpldbNtOlKKKj53?=
 =?us-ascii?Q?oxqZce+W3Ka3iKM8lFhC9qMH68MO/yhUd5qqDzuxa2XzwZbFSeuX+y+1kKMM?=
 =?us-ascii?Q?c3En77W/I7xBhRkt6CeSxwuE+05jZRvwh8ld04OVU5EfLCBdzPcvPV5ECLWG?=
 =?us-ascii?Q?+hDEZ4eFm+ni9ysyGe20NJvMpCYqzmQs6j5U4TC28BmpagPhHcWOjnx/S2JU?=
 =?us-ascii?Q?DkasGqNmE4ME3KBRIWxMILAmA9tBGTvMV6CQY0/kTcbn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c103838-9961-49e4-0dcf-08de31cad562
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 17:47:16.6051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3DVrhYFRjwRvySuTT2Q47Q3cQauvu2qicVyBvuuDSShMvNK0mhLehG6R3HwJL20D35D85pHWWNbd/Jsmj4xuCcZrJRyjJygqF5xVOmQYkkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4550
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

-----Original Message-----
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Tuesday, December 2, 2025 9:28 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Zhang=
, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.co=
m>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@in=
tel.com>; Mrozek, Michal <michal.mrozek@intel.com>; Jadav, Raag <raag.jadav=
@intel.com>; Briano, Ivan <ivan.briano@intel.com>; Auld, Matthew <matthew.a=
uld@intel.com>; Hirschfeld, Dafna <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v28 3/4] drm/xe/xe_vm: Add per VM fault info
>=20
> On Mon, Dec 01, 2025 at 11:55:43PM +0000, Jonathan Cavitt wrote:
> > Add additional information to each VM so they can report up to the firs=
t
> > 50 seen faults.  Only pagefaults are saved this way currently, though i=
n
> > the future, all faults should be tracked by the VM for future reporting=
.
> >=20
> > Additionally, of the pagefaults reported, only failed pagefaults are
> > saved this way, as successful pagefaults should recover silently and no=
t
> > need to be reported to userspace.
> >=20
> > v2:
> > - Free vm after use (Shuicheng)
> > - Compress pf copy logic (Shuicheng)
> > - Update fault_unsuccessful before storing (Shuicheng)
> > - Fix old struct name in comments (Shuicheng)
> > - Keep first 50 pagefaults instead of last 50 (Jianxun)
> >=20
> > v3:
> > - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> > - Fix double-locking error (jcavitt)
> > - Assert kmemdump is successful (Shuicheng)
> >=20
> > v4:
> > - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> > - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> > - Store address, address type, and address precision per fault (jcavitt=
)
> > - Store engine class and instance data per fault (Jianxun)
> > - Add and fix kernel docs (Michal W)
> > - Properly handle kzalloc error (Michal W)
> > - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> > - Store fault level per fault (Micahl M)
> >=20
> > v5:
> > - Store fault and access type instead of address type (Jianxun)
> >=20
> > v6:
> > - Store pagefaults in non-fault-mode VMs as well (Jianxun)
> >=20
> > v7:
> > - Fix kernel docs and comments (Michal W)
> >=20
> > v8:
> > - Fix double-locking issue (Jianxun)
> >=20
> > v9:
> > - Do not report faults from reserved engines (Jianxun)
> >=20
> > v10:
> > - Remove engine class and instance (Ivan)
> >=20
> > v11:
> > - Perform kzalloc outside of lock (Auld)
> >=20
> > v12:
> > - Fix xe_vm_fault_entry kernel docs (Shuicheng)
> >=20
> > v13:
> > - Rebase and refactor (jcavitt)
> >=20
> > v14:
> > - Correctly ignore fault mode in save_pagefault_to_vm (jcavitt)
> >=20
> > v15:
> > - s/save_pagefault_to_vm/xe_pagefault_save_to_vm (Matt Brost)
> > - Use guard instead of spin_lock/unlock (Matt Brost)
> > - GT was added to xe_pagefault struct.  Use xe_gt_hw_engine
> >   instead of creating a new helper function (Matt Brost)
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > Cc: Jianxun Zhang <jianxun.zhang@intel.com>
> > Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> > Cc: Michal Mzorek <michal.mzorek@intel.com>
> > Cc: Ivan Briano <ivan.briano@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pagefault.c | 26 ++++++++++++
> >  drivers/gpu/drm/xe/xe_vm.c        | 67 +++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm.h        |  9 +++++
> >  drivers/gpu/drm/xe/xe_vm_types.h  | 29 +++++++++++++
> >  4 files changed, 131 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_=
pagefault.c
> > index 0b625a52a598..0fe092226d0a 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -247,6 +247,31 @@ static void xe_pagefault_print(struct xe_pagefault=
 *pf)
> >  		  pf->consumer.engine_instance);
> >  }
> > =20
> > +static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pa=
gefault *pf)
> > +{
> > +	struct xe_vm *vm;
> > +
> > +	/*
> > +	 * Pagefault may be asociated to VM that is not in fault mode.
> > +	 * Perform asid_to_vm behavior, except if VM is not in fault
> > +	 * mode, return VM anyways.
> > +	 */
> > +	down_read(&xe->usm.lock);
> > +	vm =3D xa_load(&xe->usm.asid_to_vm, pf->consumer.asid);
> > +	if (vm)
> > +		xe_vm_get(vm);
> > +	else
> > +		vm =3D ERR_PTR(-EINVAL);
> > +	up_read(&xe->usm.lock);
> > +
> > +	if (IS_ERR(vm))
> > +		return;
> > +
> > +	xe_vm_add_fault_entry_pf(vm, pf);
> > +
> > +	xe_vm_put(vm);
> > +}
> > +
> >  static void xe_pagefault_queue_work(struct work_struct *w)
> >  {
> >  	struct xe_pagefault_queue *pf_queue =3D
> > @@ -266,6 +291,7 @@ static void xe_pagefault_queue_work(struct work_str=
uct *w)
> >  		err =3D xe_pagefault_service(&pf);
> >  		if (err) {
> >  			xe_pagefault_print(&pf);
> > +			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
> >  			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
> >  				  ERR_PTR(err));
> >  		}
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 8ab726289583..dc6c36191274 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -27,6 +27,7 @@
> >  #include "xe_device.h"
> >  #include "xe_drm_client.h"
> >  #include "xe_exec_queue.h"
> > +#include "xe_gt.h"
> >  #include "xe_migrate.h"
> >  #include "xe_pat.h"
> >  #include "xe_pm.h"
> > @@ -578,6 +579,67 @@ static void preempt_rebind_work_func(struct work_s=
truct *w)
> >  	trace_xe_vm_rebind_worker_exit(vm);
> >  }
> > =20
> > +/**
> > + * xe_vm_add_fault_entry_pf() - Add pagefault to vm fault list
> > + * @vm: The VM.
> > + * @pf: The pagefault.
> > + *
> > + * This function takes the data from the pagefault @pf and saves it to=
 @vm->faults.list.
> > + *
> > + * The function exits silently if the list is full, and reports a warn=
ing if the pagefault
> > + * could not be saved to the list.
> > + */
> > +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *p=
f)
> > +{
> > +	struct xe_vm_fault_entry *e =3D NULL;
> > +	struct xe_hw_engine *hwe;
> > +
> > +	/* Do not report faults on reserved engines */
> > +	hwe =3D xe_gt_hw_engine(pf->gt, pf->consumer.engine_class,
> > +			      pf->consumer.engine_instance, false);
> > +	if (!hwe || xe_hw_engine_is_reserved(hwe))
> > +		return;
> > +
> > +	e =3D kzalloc(sizeof(*e), GFP_KERNEL);
> > +	if (!e) {
> > +		drm_warn(&vm->xe->drm,
> > +			 "Could not allocate memory for fault!\n");
> > +		return;
> > +	}
> > +
> > +	guard(spinlock)(&vm->faults.lock);
> > +
> > +	/*
> > +	 * Limit the number of faults in the fault list to prevent
> > +	 * memory overuse.
> > +	 */
> > +	if (vm->faults.len >=3D MAX_FAULTS_SAVED_PER_VM) {
> > +		kfree(e);
> > +		return;
> > +	}
> > +
> > +	e->address =3D pf->consumer.page_addr;
> > +	e->address_precision =3D 1;
>=20
> Can you explain what address_precision means? It is a little unclear what=
 '1' means here.


As I understand it, "address_precision" captures the case where the page_ad=
dr in the pagefault
is not precisely the address accessed that caused the fault.

For example, assume a pagefault occurred due to an access at address 0x7fff=
ce.  Our current
implementation would report that address as a part of the pagefault structu=
re, so we would
return an address of 0x7fffce (as that's the reported address from the page=
fault), and a precision
of 1 (to denote the address is exact).

By comparison, imagine if our pagefault reporting system reported the page =
the fault occurred on
instead of the exact address.  Or, in other words, imagine if in response t=
o a fault caused by an
access to address 0x7fffce, the value of pf->consumer.page_addr =3D 0x7ff00=
0 (the page the address
is located on).  In that case, we would return an address of 0x7ff000 (as t=
hat's the reported address
from the pagefault), and a precision of PAGE_SIZE (to denote that the pagef=
ault occurred in the page
and not necessarily at exactly that address).

TL;DR: 'address' denotes a start position, and 'address_precision' denotes =
a range.  The reported
pagefault occurred due to an access somewhere between 'address' and 'addres=
s + address_precision - 1'.
Since the address is exact in our case, the range is 1.

-Jonathan Cavitt

>=20
> Everything else LGTM.
>=20
> Matt
>=20
> > +	e->access_type =3D pf->consumer.access_type;
> > +	e->fault_type =3D pf->consumer.fault_type;
> > +	e->fault_level =3D pf->consumer.fault_level;
> > +
> > +	list_add_tail(&e->list, &vm->faults.list);
> > +	vm->faults.len++;
> > +}
> > +
> > +static void xe_vm_clear_fault_entries(struct xe_vm *vm)
> > +{
> > +	struct xe_vm_fault_entry *e, *tmp;
> > +
> > +	guard(spinlock)(&vm->faults.lock);
> > +	list_for_each_entry_safe(e, tmp, &vm->faults.list, list) {
> > +		list_del(&e->list);
> > +		kfree(e);
> > +	}
> > +	vm->faults.len =3D 0;
> > +}
> > +
> >  static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_bin=
ds)
> >  {
> >  	int i;
> > @@ -1503,6 +1565,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, =
u32 flags, struct xe_file *xef)
> >  	INIT_LIST_HEAD(&vm->userptr.invalidated);
> >  	spin_lock_init(&vm->userptr.invalidated_lock);
> > =20
> > +	INIT_LIST_HEAD(&vm->faults.list);
> > +	spin_lock_init(&vm->faults.lock);
> > +
> >  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> > =20
> >  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> > @@ -1808,6 +1873,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >  	}
> >  	up_write(&xe->usm.lock);
> > =20
> > +	xe_vm_clear_fault_entries(vm);
> > +
> >  	for_each_tile(tile, xe, id)
> >  		xe_range_fence_tree_fini(&vm->rftree[id]);
> > =20
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 361f10b3c453..e9f2de4189e0 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -12,6 +12,12 @@
> >  #include "xe_map.h"
> >  #include "xe_vm_types.h"
> > =20
> > +/**
> > + * MAX_FAULTS_SAVED_PER_VM - Maximum number of faults each vm can stor=
e before future
> > + * faults are discarded to prevent memory overuse
> > + */
> > +#define MAX_FAULTS_SAVED_PER_VM	50
> > +
> >  struct drm_device;
> >  struct drm_printer;
> >  struct drm_file;
> > @@ -22,6 +28,7 @@ struct dma_fence;
> > =20
> >  struct xe_exec_queue;
> >  struct xe_file;
> > +struct xe_pagefault;
> >  struct xe_sync_entry;
> >  struct xe_svm_range;
> >  struct drm_exec;
> > @@ -309,6 +316,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_sn=
apshot *snap);
> >  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_prin=
ter *p);
> >  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> > =20
> > +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *p=
f);
> > +
> >  /**
> >   * xe_vm_set_validating() - Register this task as currently making bos=
 resident
> >   * @allow_res_evict: Allow eviction of buffer objects bound to @vm whe=
n
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_v=
m_types.h
> > index 3bf912bfbdcc..fff914fb0aa6 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -20,6 +20,7 @@
> >  #include "xe_userptr.h"
> > =20
> >  struct xe_bo;
> > +struct xe_pagefault;
> >  struct xe_svm_range;
> >  struct xe_sync_entry;
> >  struct xe_user_fence;
> > @@ -165,6 +166,24 @@ struct xe_userptr_vma {
> > =20
> >  struct xe_device;
> > =20
> > +/**
> > + * struct xe_vm_fault_entry - Elements of vm->faults.list
> > + * @list: link into @xe_vm.faults.list
> > + * @address: address of the fault
> > + * @address_precision: precision of faulted address
> > + * @access_type: type of address access that resulted in fault
> > + * @fault_type: type of fault reported
> > + * @fault_level: fault level of the fault
> > + */
> > +struct xe_vm_fault_entry {
> > +	struct list_head list;
> > +	u64 address;
> > +	u32 address_precision;
> > +	u8 access_type;
> > +	u8 fault_type;
> > +	u8 fault_level;
> > +};
> > +
> >  struct xe_vm {
> >  	/** @gpuvm: base GPUVM used to track VMAs */
> >  	struct drm_gpuvm gpuvm;
> > @@ -302,6 +321,16 @@ struct xe_vm {
> >  		bool capture_once;
> >  	} error_capture;
> > =20
> > +	/** @faults: List of all faults associated with this VM */
> > +	struct {
> > +		/** @faults.lock: lock protecting @faults.list */
> > +		spinlock_t lock;
> > +		/** @faults.list: list of xe_vm_fault_entry entries */
> > +		struct list_head list;
> > +		/** @faults.len: length of @faults.list */
> > +		unsigned int len;
> > +	} faults;
> > +
> >  	/**
> >  	 * @validation: Validation data only valid with the vm resv held.
> >  	 * Note: This is really task state of the task holding the vm resv,
> > --=20
> > 2.43.0
> >=20
>=20
