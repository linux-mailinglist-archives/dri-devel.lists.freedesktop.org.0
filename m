Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ/8BYuQj2lGRgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 21:58:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F982139858
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 21:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09F410E317;
	Fri, 13 Feb 2026 20:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUS9fLuF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D200510E2C2;
 Fri, 13 Feb 2026 20:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771016327; x=1802552327;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xaWKf/JFp719aR8II3b9IeSRqfViytaSjb4BaTGM+pg=;
 b=MUS9fLuFCNWzKUYA2wHCcJ0bpBI+wI18AAl4a1PhMh2Vvv3YFG72ganw
 AlK01E+Fbm9uVNuQiqdCEUhcRnVjw5HrLpWm3uMGZdODZIrvikn2nN+RD
 OYQcht8uMR9m632psQ/HQKkkQTFVR+E91RNLwcsuSR7JGqwI0Me7OWsjh
 khahZP5Hnc+bgUcZ8BnWe3pXYZoMHIAXB+sg5x1WTKV12OLA5kC3AnqCi
 4HSS8iyh1ExmrbBIB3abhtDMsAQFp+TJhc5RtbH6HlGjvdXg4nkNJr/06
 WbQinK78QiXKxts40vs36yUvGl97JHbr+QcnCBsK8+VrI0lOg54Xn0cbQ Q==;
X-CSE-ConnectionGUID: pVcp2f2jSGa6Eom4yXIzxw==
X-CSE-MsgGUID: h4aoWHwTQ4CJS3fg5Lweyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71231740"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="71231740"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 12:58:46 -0800
X-CSE-ConnectionGUID: BAU68+plTLe4X3EkByb0ZQ==
X-CSE-MsgGUID: CTLOTZARRQWZI7Fmnbz6rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="217993754"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 12:58:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 12:58:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 12:58:45 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 12:58:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brQAvLQ1Cn11U74FV8aAz9kcfZSzQUgL/55x+5Avov+kqa1P0CB4rpl97qF0yqvYeamKqm0uss50KK1cI3+4ns8HEW/bueD0LYnv9ug3TZc/4VTYxiJ2a1JRtdWMHeMTtGFOqobt2rUtfkL5P/EJUZfrC40ZMSvxtlRh//mPhfxbUegHZw+IV4cagKZOaQOR7iX4ovKyZJS3D00auH5WQUWLi9XfjbUogap2aXWMu9qLsHVTR7Kt4TKxi9g60bwMb3Ezd8IU1R4M44Fm6a544h243OCv2Al8g3XNiEBSF7bt/BXHSXmpR2RtKkLmRoaWuUdFEnTyK3aWlSw1VVRe9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OzfsfYblcgYX/NVffUjFgJH/4+6J2iTx3au5INk4i4=;
 b=InF/FRNiJ+cL9Q+kCDsiRU1Ecjxu9g916tATwl6r1dU9mKpNzx6wFCRhGzq/99L+/vWscDYxB5wQXVwCqHYI05wE8nreVwCQRtD21ch48ssrAmStOa0Z8eR4X9EPhyW3TrrWieCaf1SbSiHrArkzjlYlMiLtFH0Evm3Lru781jKZI71UDlzDsJadFjHyI+kbox62XAuWC826mlYB9nrPOfZE7JuLczAeXajTcSOiU27XpGfMlXBuNZrz57OH5P3TCvrxx8MIYfOe+iqH/SQW2OtaPO/UMk5vU0AEI5Hz+sS0G5Hr8Emi6pUst9p4yIgI0KyvnfTd+eFXTuTfKS/wfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DM4PR11MB5280.namprd11.prod.outlook.com (2603:10b6:5:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 20:58:44 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 20:58:44 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Briano,
 Ivan" <ivan.briano@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v33 2/5] drm/xe/xe_pagefault: Track address precision per
 pagefault
Thread-Topic: [PATCH v33 2/5] drm/xe/xe_pagefault: Track address precision per
 pagefault
Thread-Index: AQHcl4hZjtn/d6x3HEKwbRawrV84U7WBJHbA
Date: Fri, 13 Feb 2026 20:58:43 +0000
Message-ID: <DM4PR11MB5456A34841A0C65BB023A359EA61A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260206164731.8395-7-jonathan.cavitt@intel.com>
 <20260206164731.8395-9-jonathan.cavitt@intel.com>
In-Reply-To: <20260206164731.8395-9-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DM4PR11MB5280:EE_
x-ms-office365-filtering-correlation-id: eaa3d809-f045-48fe-26d4-08de6b42ac88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?ww94CujTIyzmdNyeQ8KwNCYAMwQejJvP0ss8gDlKAARAgTYyh/C0OGx21OoA?=
 =?us-ascii?Q?/ufudCzwRAHXsgKCErWpK2OdgvbcIDecRMtpnVZ27saXWOAeUc0xQk4XBGw4?=
 =?us-ascii?Q?OnI3ppafNaMmD7uXkMOEQgvXLwK8k3S6BanEgau5l81FKre6qkgo2NFiT70E?=
 =?us-ascii?Q?wf/FBoFDEnTkLlXxIlFkLzpWlrX1kIE3pArz+o5djmMh3Vmsi7DqVhnyLrZZ?=
 =?us-ascii?Q?wtlUgqOWnrhaMIyu6OGsOypH32xNA4u/tJVrNS1WS7HnsCpMD7KSEQF+Ij/l?=
 =?us-ascii?Q?lfMuNDrLYMp5o9nCWKRlCwb5ZnnbYKFm43dwbGWJOoXgaWK2+7yfAq+vHXXi?=
 =?us-ascii?Q?9VbUjbci3746JqFivD5lce5CZ/9CV5FscCoKRXvyC6WOBu2xYRYPsLOySwkr?=
 =?us-ascii?Q?oKwOhi0xbDwcaJr0aZrxpGezvEtWFxLAsa1T+09e/3kRGNaDqRkD0HkkVmYZ?=
 =?us-ascii?Q?T1XsghpFRSBTAYLVcF3NSCGbPymHO+qVf+zE4gVBawNPtPffoey5/6sO5u4y?=
 =?us-ascii?Q?gGK+D1tC2yvMF55JKPyTcZK5BSwdw//nzF0lnlGeRy1zdh6tmRxLcFhafhlB?=
 =?us-ascii?Q?I9BnEmIrJifXn2PMxqENs9hAghqGE7/5nf99M30vRhPVSqNNbXrRGgt8Ze/+?=
 =?us-ascii?Q?m91Om+n8f24j/8unBqJgjUzHNclXuh974NFkh25rKMldyQs3B9BvGMufuwX/?=
 =?us-ascii?Q?SovUVnF2+u10nu9xd/oZHHLh449kOjjE1KM2n13BX9W8lFI7DCIPcSDS+Sxb?=
 =?us-ascii?Q?aqXwGekxd6xb6kabQpQloybmYZeJ42M/sDXQspzJhHMA7UpR/F/EQN2QpvtK?=
 =?us-ascii?Q?i+HUPuLfjqt3jw3HxCU3MntyCbyhp5CywWbW3R+UNMfi2jxejzmM5xAGTOYP?=
 =?us-ascii?Q?5bh9UMG+UxwfbGLT1rDHvSVRrJDTO5E/xVYSX+X6AC5oesB1F1jS3rL1KEeD?=
 =?us-ascii?Q?exk9QkNKTnWtebWx3qBfRyKjI29wkQWTNblYBfBd2/CHu2NeQtJZUzdsmWas?=
 =?us-ascii?Q?GM9GgvFD9oIV316296XPYyllVcTdtJtPOqTY4R2G/6MiuR4vhBq1LebcX1I2?=
 =?us-ascii?Q?Qu5UdgzyWY2bCab4ZtjW+AROdzLcHKCJEuP+zC1/ifM5V4/nrZCLBk7MgWGK?=
 =?us-ascii?Q?U9YLS62LSPbaf7Yi+bpFs7ajknfRf5T+m7LOwd0BrLrbWuNiLLlXIkbEc7Y0?=
 =?us-ascii?Q?54qBTfqq+zB+xxOnUrf8iXX9Ur6ix31iJY83GHx1IKnvoMpIQ/2h/b2xJAZ+?=
 =?us-ascii?Q?laLGBItVRsZailksevuOEimEfM8rm3av4BPjZZ7t9IM7j1kMA1bZfCisYJs+?=
 =?us-ascii?Q?H+8elrCkYWEJ5Kwvnb2jBJ+9ItHV6iJFocP5GH5niCAuRbAlCUFj4gJZVPJq?=
 =?us-ascii?Q?z6NVGQoLgOjUFI56NHQ6vPtZu46YxIIGs2+1980tWWufE8lK6T9recAQ2zz/?=
 =?us-ascii?Q?8EhtWoc8yHvibREhKhLUWEb8MqsxnXGbEfd9gnPkIywkwPZKiDsCQ/IS2iIW?=
 =?us-ascii?Q?2uyogzvHLJspjzELWDCsahLdkzqZ63DdHQv+Ys2SU22pxA9L7T80JasAn3lu?=
 =?us-ascii?Q?PPd6I9d/1VNYnWDs08nAhGO4cAKJAb0Fn5fsApRdC2MZNpMABezfEYr+nbdK?=
 =?us-ascii?Q?pbG1MuOPVZuJd65W8bG6ojw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rrZ5GoHj59jaLKD8CnAoruWytPH/AzhA+RNOUCEElIB+W/+TnK/1VQQi/cLp?=
 =?us-ascii?Q?HjjzGu2lo/FPV7jpbj3OEEiejqpMrhZhgoT/bcaw9C7R2Ds0bN3khdJmfxDr?=
 =?us-ascii?Q?UwdQOSY7yg81uCtshyVUl4kplQ7jq8F+utZCpkkO0oMEYzdlEWBwvn+oP1FM?=
 =?us-ascii?Q?FtbwkMvftt+97WO/Gd3+32fPzrmOr5H4Q6rRg1HmjbUmMmCiEReKHtwvkgA/?=
 =?us-ascii?Q?+764AdapvhVcQdRVzR4k9AVn0WJUITMfBGDT9Qsfe1zU5kchGwxYknhPH/vW?=
 =?us-ascii?Q?o3Tj2JBggN5jl+lla1GRyUHA/dLr6AUo5W4a0Belu4SxGGF5seDjnRDDRiQU?=
 =?us-ascii?Q?aYCP3tDHLTNpOSTCen7siX39FvzvJQKIY00s7CoLU3i0wKc9Gvzg/0SlL0Y6?=
 =?us-ascii?Q?ks1uv8iDiyqQ2KNMvM5x8EtyL8WH1w5zGOXc7VwyNdDmxIUDG4RdjilhkJiy?=
 =?us-ascii?Q?ndgKV1Kxfo9ZntIbMHfdITF6qDgivOxdvwLseRX+j7xBIPBuV7XxIjadUO5j?=
 =?us-ascii?Q?iYDeo9/xWAD9paz3hronGniYNdptZgMurNz3wg0UHR/yIcnq7vl7oAtU7wou?=
 =?us-ascii?Q?j4gFzUFid0UcPAuwFmgTdlVPj66jP0R0JHDufLE12mVfyWEBTmqKUEn/PK0E?=
 =?us-ascii?Q?8ZUf6uu3pAZPEv0J1eIm4aNqH/2B1/nH77yl0ob5o7r9fLThdttLe43IbR8x?=
 =?us-ascii?Q?ryZklvgM/vaVgimF8fR3ZWthbZpiX7EyR2cmtL0PYDaBzcnI3zx49iydQ8Tb?=
 =?us-ascii?Q?0qiYF0vLTtyF+OBJpPM9t6TwstqZepWm+oE3zIT0dp5qLXRI+/J9hqDzbNpk?=
 =?us-ascii?Q?sArTZuVc5swfRE8zUdOZ4axX7W81/n6W5u5JDIe5adw2LtrfsiqQ3CJ+mXXs?=
 =?us-ascii?Q?tSjTGMIe8LognmUwnTR+HL8uZ8QH+Qtfm6FStsSdhl0cCXzDLgbtqR4voHGk?=
 =?us-ascii?Q?neozUJwr52Vjl8TuCvIE9S7fH0ZKN5V2JIK7JMbWs/hSzqjFnbt9PbGZoXUX?=
 =?us-ascii?Q?fNckhYUqUjwJsGEarAcqXpUcRRaXYtXrBcJwPz37nxbTElhIx6SAaK4vKIKB?=
 =?us-ascii?Q?lyBhQv3+cKQxqZY+9Gq9uXB84Uko7wMUVDH2Hs+2v24kjhSrKsTrMiDLdMId?=
 =?us-ascii?Q?C5FQHJ8ukQEmyGORzOr2tzVrsM2KX0KEp8mOByzS4C+y7GH0weykivfP3OwG?=
 =?us-ascii?Q?DvS7Nxhe4pK/rFG/DsApCcevDda6lfIIDfwG6niqMc16vAkcFbecjYzK4hSZ?=
 =?us-ascii?Q?lXi0IifhyvUjg4AIQeBNrG2Ak+DiqDOVPUhx0Fjv0eDfTXC02b9fKXGg59TO?=
 =?us-ascii?Q?G9fzAaK9Zfg8mwx4doucPy4g2KElTN3YgizKetVYXYUWWP3sj6Pn3v3QpCFN?=
 =?us-ascii?Q?QWdpSVVxNivnlpUcwxF+oR9oZeS7ppCuWJmZTHW5Fn4g2xxfKHy6yWIgJR+8?=
 =?us-ascii?Q?HbUYCc6z/t/LRmFOm5+eJPD39zJWeSJCcf2dnVOVhLPvpfy9RMI3wLjBnO7d?=
 =?us-ascii?Q?zHTMz6Af3k7OGX9m2mMZOgN4UrGrDjp7CRORCS2WVGBVAQvXoNfgcapGtTxB?=
 =?us-ascii?Q?T801LtO1hFVg+jAFTC4gweqsrHJFBcytXmoseZz2lQ+XZr8MnT+XFsH0w6ZR?=
 =?us-ascii?Q?L44ruedC2adlJj0qlaD3U6HwqxxfVeWDYNT/wkAbKLGxwI8oyBtDaTtktypp?=
 =?us-ascii?Q?nTpylQYHqFEMlpoWICuMJ0xErpQsWscCxSaMH8fNTNgbSf50shWvKDfrejXx?=
 =?us-ascii?Q?DbSDdpFZog=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa3d809-f045-48fe-26d4-08de6b42ac88
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 20:58:43.9563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z7QkAgLgP5qum1YlBjGk0LSB7Xg2ggdh43nmR/JVggaD/jOJRXufRgKCXCUHfP99ls9D3e7NbvUmswc2ExJWzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5280
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,DM4PR11MB5456.namprd11.prod.outlook.com:mid];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuicheng.lin@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 6F982139858
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 8:48 AM Jonathan Cavitt wrote:
> Add an address precision field to the pagefault consumer.  This captures =
the
> fact that pagefaults are reported on a SZ_4K granularity by GuC, meaning =
the
> reported pagefault address is only the address of the page where the faul=
ting
> access occurred rather than the exact address of the fault.  This field i=
s
> necessary in case more reporters are added where the granularity can be
> different.
>=20
> v2:
> - Keep u8 values together (Matt Brost)
>=20
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   | 1 +
>  drivers/gpu/drm/xe/xe_pagefault.c       | 2 ++
>  drivers/gpu/drm/xe/xe_pagefault_types.h | 8 +++++++-
>  3 files changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index 719a18187a31..79b790fedda8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -74,6 +74,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32
> *msg, u32 len)
>  				      << PFD_VIRTUAL_ADDR_HI_SHIFT) |
>  		(FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
>  		 PFD_VIRTUAL_ADDR_LO_SHIFT);
> +	pf.consumer.addr_precision =3D 12;
>  	pf.consumer.asid =3D FIELD_GET(PFD_ASID, msg[1]);
>  	pf.consumer.access_type =3D FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
>  	pf.consumer.fault_type =3D FIELD_GET(PFD_FAULT_TYPE, msg[2]); diff --
> git a/drivers/gpu/drm/xe/xe_pagefault.c
> b/drivers/gpu/drm/xe/xe_pagefault.c
> index 922a4f3344b1..a24de27eb303 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -231,6 +231,7 @@ static void xe_pagefault_print(struct xe_pagefault
> *pf)  {
>  	xe_gt_info(pf->gt, "\n\tASID: %d\n"
>  		   "\tFaulted Address: 0x%08x%08x\n"
> +		   "\tAddress Precision: %lu\n"
>  		   "\tFaultType: %d\n"
>  		   "\tAccessType: %d\n"
>  		   "\tFaultLevel: %d\n"
> @@ -239,6 +240,7 @@ static void xe_pagefault_print(struct xe_pagefault
> *pf)
>  		   pf->consumer.asid,
>  		   upper_32_bits(pf->consumer.page_addr),
>  		   lower_32_bits(pf->consumer.page_addr),
> +		   BIT(pf->consumer.addr_precision),
>  		   pf->consumer.fault_type,
>  		   pf->consumer.access_type,
>  		   pf->consumer.fault_level,
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h
> b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index d3b516407d60..333db12713ef 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -67,6 +67,12 @@ struct xe_pagefault {
>  		u64 page_addr;
>  		/** @consumer.asid: address space ID */
>  		u32 asid;
> +		/**
> +		 * @consumer.addr_precision: precision of the page fault
> address.
> +		 * u8 rather than u32 to keep compact - actual precision is
> +		 * BIT(consumer.addr_precision).  Currently only 12
> +		 */
> +		u8 addr_precision;
>  		/**
>  		 * @consumer.access_type: access type, u8 rather than enum
> to
>  		 * keep size compact
> @@ -85,7 +91,7 @@ struct xe_pagefault {
>  		/** @consumer.engine_instance: engine instance */
>  		u8 engine_instance;
>  		/** consumer.reserved: reserved bits for future expansion */
> -		u8 reserved[7];
> +		u8 reserved[6];
>  	} consumer;
>  	/**
>  	 * @producer: State for the producer (i.e., HW/FW interface).
> Populated
> --
> 2.43.0

