Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A741CCF7FBB
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690F210E4E8;
	Tue,  6 Jan 2026 11:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXpwfgNL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD0410E4E4;
 Tue,  6 Jan 2026 11:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767697887; x=1799233887;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HKOqQehZi9uCapbWdRgnGaYlDSRHEYAI5fVofn5TquE=;
 b=dXpwfgNLjrVpk4YZLAEQwOO/0Q505kUu2FXCOSdq9vkQmouvEbpnDQz7
 QLDFSCX26uuDqVVl8RlqGIalZe6xTgciSc+Savt4S0gGapg4oNcWC9uEq
 swQyggYIiyGgFv1+1bFE6MhzDz617Uuq/yInv69nplLQpSZzHIOf14MSC
 bI5NV4Pzy/oEw271KCHoX9eSOi3kUFNkRr8fj+3BIQdhqk12RX8ZhwjlU
 4NtSLHYDEyzFqE0ha8pMp7m/Bp2Yg+DDwqBwec9ozTcyQ2l/LkcADA3Ua
 CVUsIIWNLIvhroVk3IuUDARFj859j89LZbspgEnuI7D7NoXHH+4GzksDP g==;
X-CSE-ConnectionGUID: eTqLXn4gTSq2sg3X7IfwvA==
X-CSE-MsgGUID: d9Jlck+iR52naaYFRfIRhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="94531815"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="94531815"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:11:27 -0800
X-CSE-ConnectionGUID: R9owG0yvS9mXHE19XkPDzg==
X-CSE-MsgGUID: goVkyP64RTaR78ISgqsidQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202650608"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:11:27 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:11:26 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 03:11:26 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:11:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9F03cuW3iO1H1jRsGqSBsV6diNrYfNOTtU6WSa9Ak7tx9a+9lDuzhXehfskTooW5cMoBUMXh6Nik2AII4iCylJLSL0GdvFu/y6QTS8wMJP+ffcvi9XA9YTrPWr9XJ2rPV81NnILeaO6QORFB1I1I7ojL3PKpZFJ4UhhoYhv7kIjl30bqO5l4ZPKA8Lh221fBiEid1cPumUyN1g2f8Zfyeo8zclgx0dEX+GN2CDS9ZCT+g1yvrdET9SmWf3A71f8AMIPQNQ+8+VxFr+pXx8ef0qsyu8vJGkXHZB0JRX8WK4CZ+JX0rQlxrhtuwEERZWLLwFqVmvUfbj/Yl51TwN1bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQy35dBiyf0tpjwabRezsIH9oCp1DX5ysjoE8d9C/B8=;
 b=gfYixe83DZj9OJ1Wfb4AlC/I0uWvnreCayQpR0kMkH81xKTVYF68t60Yl97egY/BI0fQL7Vi5UGrf4XUlxmEINIeE6jOLZHFfZijLdvFNFNIPMo8UECC4wEibzeVr7w7emG/n5y9dadLJuZAJt7X/H3eqQIX/FA2h9dl+LZ+2WyOEQNuFLNY5VsQMRS29iuDi6N48ZBuCtOjosOe284U9XevXeyCo+c63Co58LV655XCemPny4pNe8QoFxudCu76MirHiX7oLzQHg85VrD58ZeEE+Z8aaIFfTIDkadMLSCYjrzhwI3aLrXyBcORs6kMvvGkto52356xhOB/vbhKO0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:11:23 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 11:11:23 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 08/13] drm/vkms: Hook up colorop destroy helper for plane
 pipelines
Thread-Topic: [PATCH 08/13] drm/vkms: Hook up colorop destroy helper for plane
 pipelines
Thread-Index: AQHccLcDMaasuLoqHkqp4o7gwm/O0LVFGMdQ
Date: Tue, 6 Jan 2026 11:11:23 +0000
Message-ID: <DM4PR11MB6360868E20B577E597649101F487A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-9-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-9-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SN7PR11MB6679:EE_
x-ms-office365-filtering-correlation-id: 63ad3f12-e3b2-4ca4-3d52-08de4d1453e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?bKgWEZCa7AMVVZm8I1KxDXE+uJIXg4N5zbKStn12BA6Blvz9v7O5bVoprcDn?=
 =?us-ascii?Q?wA0xt9Aagcl11tpRGep6NgV/u3OvsBTIT0ESYoKRoxgJ62l61PMuSkV8oTr8?=
 =?us-ascii?Q?TTauRSTOp+42rBm9ByBFTOO03Gc+PfGvwSspmXWHYsF/ZWUlNUKPy7m99yGv?=
 =?us-ascii?Q?BFHvzR2NMzQIZWDbFK6oByBEYBaCWRRXi0vrSlLCHX7Zi/878peIlcEsg5A1?=
 =?us-ascii?Q?lxkb6IKxufyLUhtLCXfgss/J8VqDaHbgrJagPToVMnfhXWLL7GH02IRYFAC2?=
 =?us-ascii?Q?Jy29/+E35XGlM9Kvi0dFDROg5tI2PxxckINHvWkgeMWO/WUZrntttODywMJd?=
 =?us-ascii?Q?920YPCljytzNoGuyJPUCPcLckdwUDseSrvRjGP++5gd+fGajPJsb0RXGn6vM?=
 =?us-ascii?Q?OPUMb93LNeh60uaN2Ap+hs+Xym0Sk8Glv6Ssk5zNAqWDKp75VzyfsU7uHHYY?=
 =?us-ascii?Q?uG/e4/PpMVmO498qK6cO4kpo1iTaNvfqhLVX7RH2RU/TfuLZQuA93Dk00Zyg?=
 =?us-ascii?Q?+FvI/Xa/oT9HQNklSXpr8sJGhgqT9FgKt6A49uj6SOaEuLPmG/S7kSJnv2sF?=
 =?us-ascii?Q?DoXkUAKFgQp+lTfGbSeKkWxQpEGnCmHwWko8yKc05P8gCT7FduNnmdNpZ+Bf?=
 =?us-ascii?Q?dIZsPbvFcCow9n7kgrEdg8xXLK/uj6cgeIyrZaddUS6IEhdl6o8KmGu6UvG6?=
 =?us-ascii?Q?+eVs1ara92UikBmu/1CBQBLv3n2kOOIlmn40zMdwqJG31rUnEODhq9rygjsM?=
 =?us-ascii?Q?sgnfEmkRMrnViLj+jARRFzd9+H6qoeo3dUuKx3q0B57jY2W+pkX/5dEWZ2xY?=
 =?us-ascii?Q?6HC/2cG5diGjcAVNxSrTZSzBcljgZmbZlA1HPNAIEKHT66WCNKMlY5vi3a5+?=
 =?us-ascii?Q?rwgauByDvyWDVLFmR+8ngn+Q93Hm0ZVhfAVR5WxGllKHrWjdGzgE0eNK93jf?=
 =?us-ascii?Q?WR6IE0/Rb2vS9PTsOnLr+/pqS2IUnXB1kw+kF+riM+21dXqCjyJo0fYZ6x6e?=
 =?us-ascii?Q?Y7RE58DuKcGW9YAljZdPAIKjF7oH3pxW9MA7fjyS4YF5/Oamw71+yUOFSmwy?=
 =?us-ascii?Q?Rpq5XbP10pSP1dQN/ez597iTgatzX80/jaiY/k8AvuhVjNlEcdGl/FNld9iv?=
 =?us-ascii?Q?DxmGv9ZsgTj6e1Et3ua1enuXoBsWy7BVwMFIX35QacW2GtLOoar3MNi/DMBp?=
 =?us-ascii?Q?jtFfrB1UaJmEALoj+Tc6DJ04JVkGP4R4SAGZA8TPUsaoljF8OhpLa7bbS+Zr?=
 =?us-ascii?Q?6NDc8OGW645naUlZ0lPcbZqWPukqABQrgxwmTqdJaZl+AKfwfQDD+Jd8/C3/?=
 =?us-ascii?Q?ve/I5bUPoV3mWPW0vXSWfQ/hpTPl0LZwxsWnD9UttN/DZ5AR480Z1hh2cFg0?=
 =?us-ascii?Q?/tzQFTDx2QkqoSAnNWAXqryzqL9mQxNbdPZt0qcRXYQXXRoaIUgmMWcWQXFf?=
 =?us-ascii?Q?OWnSKNfhcDXv3TLZAEs0wIzkhusxZUVr5xj28Ky/IkWLh9a9Dn96NfOK9hb2?=
 =?us-ascii?Q?a4NycdEvaZMFYhi+5zVoz5/ps4umvq4dJWI6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9R+bxWI6opbCL9rnfDYCNhtevctMHM9Ag9pZou7pKfRAL606ZHHAEn//G8SE?=
 =?us-ascii?Q?ERnAbAP0Tl7Bwf6rARbHDJ5eR2KeJzjuNdVaSo7ChMP6B5p6zIhZWGOqaqeT?=
 =?us-ascii?Q?XwzceTApDdMMNH5U8bzjJY3A/XHqy5+gYcz834CZSKxgQ/20bStes3Yx/y6i?=
 =?us-ascii?Q?DMC6B3wOlwFNWyHyZeu+B7tsFT+4exFqeW68b4x7Q2T5DzSPNXT0Cz8GMXJ7?=
 =?us-ascii?Q?L/Wt34ftysk3SnreUHIAW5iKsSIRzJI9vl0iPdCY1YbF5ldb3CANNjEMbU8y?=
 =?us-ascii?Q?SwkMF7h/bL6O/U8aW4bDMkosz0s/AfcIHmBUFNSrc99s+15GDiPNtdtTMbsk?=
 =?us-ascii?Q?AOj3pwsE+gaInHqDmU1yavHN4lbWv5AcI7Pl84dUE+48DTe4twOZKbn+dkIA?=
 =?us-ascii?Q?wL4BNncKRjcbbA/CGQrwwlQQQDgAVbGOPSjZO73xSUDTHN8rvTHJU16Sr9lJ?=
 =?us-ascii?Q?lphw8s+6KMXNhHI/tx2yvM54Bar661mLixdfq0/qVLWnXia2BEPdosS9wMAj?=
 =?us-ascii?Q?v5mNnU4ZVIQzoPuOU6VZK17bZrYushJwBVQm2NhO8w7BxeOBF5/uydNDJj7V?=
 =?us-ascii?Q?htyST2WwqwGsARa6JvRCGU/LaE1FqUvzjOvHj+XB94+uucEo/+8ucHLrqamN?=
 =?us-ascii?Q?pyG/I+ipmigDDG14AzzwmnpPZPl7XvZUnIBausaSR8ARI1eHr5cXI1d6l9+j?=
 =?us-ascii?Q?krc+5tSLpa0IBYV03s+JB6Fxp1mPb4I71jk4r92k1dkgg9Zn0iqvf/KZqDHP?=
 =?us-ascii?Q?LKuz7xGRGhOBj6gc0cL7nkmtYQSd8RTZ3iZT2AtyedahuAbWFlHgh3SxPgir?=
 =?us-ascii?Q?WxtJQmy0IcJyzslLqRDsktKMVvliEzQxhEsxsWNDecZvTcL8esM87EEbmETY?=
 =?us-ascii?Q?miC3Wux5ATbrZPCzlOSIZrcH6fbJcKJGVM2i8Ab81+9cKHxUSYoYF+41GMTr?=
 =?us-ascii?Q?89wqGKbcPSKU0kI0hAokcclW+MpDuELyiGF4aboqFv+Hhojl38vmX4FRiqh8?=
 =?us-ascii?Q?Pr2QyP5rodue5uDFmgsSZrnWjM7XZ989QJ9Jkzv0OCWYtVzHeVCMoMXk9N6/?=
 =?us-ascii?Q?NG6gaQnnkgIo0YQ1HgHbEYCfM1jyy2rrY8JvFEkdyJgapOID0MExmRA60ZB9?=
 =?us-ascii?Q?0T2xo8zX2akAik+lA8uKb2K8/Q2AtWOZrKXw+QS79aZn4t+wp5PjcqkgevYr?=
 =?us-ascii?Q?9NsaWlKo0U1wSGLzbJRUaZcKEy7Esivr7yx188Etfk/W+S7wcyH5pQg9DiN1?=
 =?us-ascii?Q?8+FsLDH0bn3lUcPMeAHlI5phkx7vnA3OL+Wn54+vt/aEpMXV8VpWatukZIE1?=
 =?us-ascii?Q?nFjH3JowZ+cHRXMe+i7NLmIBJMqfahoPRX7NDWDaTwanRkYNlZhvt9jUGRGi?=
 =?us-ascii?Q?nqGH+hb2wEUQzUxYTFSlUgZr9N5h3gWuqGvhbC+E16cu11duuCV79kKxekON?=
 =?us-ascii?Q?Rq/3EGwhR0lMgZ0aRiNEF4wpiJVNFFBqgRVQv7cz2JyLliykLoTP1vI8NKxy?=
 =?us-ascii?Q?FOtmn2ZGvdO7X/ksdJNmc3vLiMz2jGRqYh8jYq/jHWWNiUYwxRLhgO9uhi8U?=
 =?us-ascii?Q?gUh11tA4MkeGoQ/6OgHQ3Mm0w7WhQ2CRIiM06UhoRtDd1GIzdbni3dAiENSz?=
 =?us-ascii?Q?Ahyq4OrukEnzLVN2A/WUu9kN8BzgZksmFh0uFg/u+Icj5iotubXOdWa/f42E?=
 =?us-ascii?Q?aW/w++5lSF7OG1Yi/YxqgMGQgJ7Cc9sPEtkIOHd7W2mO/Dg9VDx5tAtb+j79?=
 =?us-ascii?Q?M1Fkb6BIQg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ad3f12-e3b2-4ca4-3d52-08de4d1453e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 11:11:23.4958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UfkIy64z8xjJ4/IVuf4+KgkfAoiIP9eVhu+Zb4njt5jd1prc29aibd0b6YciRt4s72Mr+8bMXI9y67/Hpm3VsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
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



> -----Original Message-----
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Friday, December 19, 2025 12:26 PM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: harry.wentland@amd.com; jani.nikula@linux.intel.com;
> louis.chauvet@bootlin.com; mwen@igalia.com; contact@emersion.fr;
> alex.hung@amd.com; daniels@collabora.com; Shankar, Uma
> <uma.shankar@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>;
> nfraprado@collabora.com; ville.syrjala@linux.intel.com; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH 08/13] drm/vkms: Hook up colorop destroy helper for plane
> pipelines
>=20
> Provide a drm_colorop_funcs instance for vkms color pipeline objects and =
hook up
> the common drm_colorop_destroy() helper as the destroy callback.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/vkms/vkms_colorop.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c
> b/drivers/gpu/drm/vkms/vkms_colorop.c
> index 9e9dd0494628..ba826ad384b7 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -12,6 +12,10 @@ static const u64 supported_tfs =3D
>  	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
>  	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
>=20
> +static const struct drm_colorop_funcs vkms_colorop_funcs =3D {
> +	.destroy =3D drm_colorop_destroy,
> +};
> +
>  #define MAX_COLOR_PIPELINE_OPS 4
>=20
>  static int vkms_initialize_color_pipeline(struct drm_plane *plane, struc=
t
> drm_prop_enum_list *list) @@ -31,7 +35,8 @@ static int
> vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
> supported_tfs,
> +	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> &vkms_colorop_funcs,
> +					      supported_tfs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
> @@ -48,7 +53,7 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
> +&vkms_colorop_funcs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
> @@ -65,7 +70,7 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
> +&vkms_colorop_funcs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
> @@ -82,7 +87,8 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
> supported_tfs,
> +	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> &vkms_colorop_funcs,
> +					      supported_tfs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
> --
> 2.25.1

