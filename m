Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79C7CF7F9A
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE9A10E4ED;
	Tue,  6 Jan 2026 11:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9mkna3B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2509910E4E4;
 Tue,  6 Jan 2026 11:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767697852; x=1799233852;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U7HVwXVa8Rs+gwWTYQf8t1u/O//Y0zPMPd9I6XUYlvA=;
 b=e9mkna3Bpu3IaF/W08u/mAHoa6f9tLrw1KSSbXHrLOP/wVaRhqle4Zhj
 Cg5TZugZeRizGnOPBdReS+goKY0TY0RZleeIIQkIVE/E1XegYviPt4Nef
 5Ojiwrxcy3EDnO0oVyzAov2ubvuPx9Py0McbU9d9b9P6MD3VB/mRMgJml
 nB0C/w71+gTWOOSAjCKFIJK7cErG1PyuX4H1Wy1MyPe17Fsl0P2nCcEI3
 hzQf53Cm10afzatcNHmevOu7lBjJfKuvb3EhwyVpBwlSFFx+GidH8MYWZ
 kKY5QtjzYCpRzOn1H6+Lj1x4diCtQayUHwBq/HUfwvtE/Z1vt8iihmLit w==;
X-CSE-ConnectionGUID: K8AEZs/KR5K+XhALztpB/g==
X-CSE-MsgGUID: 53W/XNuORh6BLaXgDAYUgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69104384"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69104384"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:10:12 -0800
X-CSE-ConnectionGUID: fqLsiFcXSxCMevSjEFdR0Q==
X-CSE-MsgGUID: GQUcRaXwRqeP570nJCU7rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="207672310"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:10:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:10:11 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 03:10:11 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:10:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2j2CzZ6kEVdsUrIIsi1gq3A5KqvwglPJ9N2luLaiab1XArl1S2Qfp10Ho1RRrVer3iFacc9ByzKsngdCJHUtaBB08EmdUCEBJ+WECYUXef2TBubW9CM+E0oz78XAW3pib9Eic8vyDAiL4BDZkJ8LQoGV2SX8KbaEu/u1tHOrXXHqKtU3C9hxywqtOTEw2lfrvahth0qyQv07FEjJ1jtMac1//QQ7eplrJSALEpxcUKn9WdvQbbHkL2tFm3/Ho5qsSVI3vyyOOLulVKmo5GXnubRd/8POsO/uq9zddlc+3buBZw4ZjMNVp8kW7iGE/aDqldANu+TGQuhMKOIzbOmsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgklybjF6jmIbfFCg/CcgjSjsJFx8P44XOOQFoZsdH0=;
 b=ZMxCCBvGk41ub1YEwG49JFp4nsq3GRRYyuSNj+luVFwVtMxEiLTWbC6xFBUIbXGfJB+lc9kOEFhZiAbqkxm2NeX0b0GKytaMbqQBLDsYagtwvJTfYvCJEkDTVHb99HFrmm41f+KeSyuP7BWbNq1DGiX6KPn2/BzlxEs+JeZbIm5FeSD8TL1UuJIJyMGn/VtTvmEJBhvVPnmYjLkpnaCM4qIrn/hOCKZrDjM3/ZbMPnbcUZpQX+aLtAKY3ZSo2yFfwLha9F2LDwWa0ZQRr6PZnRaNkOrHN161eWSnHU0kKjjPy1XV7GlPeVuPmjccvQ7SfaHnQx1YxrInqr64c8ocoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:10:09 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 11:10:09 +0000
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
Subject: RE: [PATCH 07/13] drm/amd/display: Hook up colorop destroy helper for
 plane pipelines
Thread-Topic: [PATCH 07/13] drm/amd/display: Hook up colorop destroy helper
 for plane pipelines
Thread-Index: AQHccLb+F6R1QFA72kS7kHcRhgPKFbVFGGeA
Date: Tue, 6 Jan 2026 11:10:09 +0000
Message-ID: <DM4PR11MB63604AB38D4A971411407A3FF487A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-8-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-8-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SN7PR11MB6679:EE_
x-ms-office365-filtering-correlation-id: 3ba7f30e-0ec7-41cd-6695-08de4d1427a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?vW3bbIjiG5t/P5J1+EOcf8DHJOdoK5iU+UiHDvGtGj2jKTI2wuWzRVkES0NE?=
 =?us-ascii?Q?MTwHUnc1DkSDQLzUxyiy6XbiBvSt8h21b6rLkjchiao9VPKnoUBqMM6eHb2U?=
 =?us-ascii?Q?ws6np+Z/kmhcUFz7z5VRAYDVTzUhG5WPOqC/WWSjBzxg5J+OwY2ZK04fTUWw?=
 =?us-ascii?Q?FBetS49S/OGxPcLvTfSuf4X/wCbfq9UaPSzmIdL73zZBDYUgeDBBCyLgAntn?=
 =?us-ascii?Q?F8SjY7+DV2Je5t2fAppv4q4pMNdT8/v2ifHCVyg4pNj1S2Amta65y8l5us4Q?=
 =?us-ascii?Q?SdaJFTY0pxAlff3OaDJFd/ttDwG5e9fU/XnAwpdF5u5kKkLPN4gIhQg7dirf?=
 =?us-ascii?Q?MLlF9DWfs8edZ/5EmEss1zz6XbUxsC91O8AZJKhALlVwgjzB4pw/bCq/pVuR?=
 =?us-ascii?Q?MSdz7zFDPBg6YD45nNjDqLxalhzR/9GHqmXqtobK/IkMy9wY+7xZ8LTqZYAP?=
 =?us-ascii?Q?AT+WW9ZspMiCoFkJzeotRxEcNjuLaXB1S8oXxXla0aoV2i95YKa8DITPmt8E?=
 =?us-ascii?Q?hNzvvQksOeySjDAytIwSn5Sf1Ww4hJcnu/bN6A6Rq9/d2VrNcMNut/C7XB0N?=
 =?us-ascii?Q?qc2itX3mQSs0tQGSZgBWMfHb1PeziVz2SX8xLCVAOYg9KDSKope/oiSVcdQZ?=
 =?us-ascii?Q?j3qijWbtHgk0pI26Ejd1/A/guoO5wnnT6kGZjwNwBfdfy17nOPSHQvSofiQ1?=
 =?us-ascii?Q?GxiXfS5T5A1ED57j9DQzPSkzLcTS3+490LKkfLE38a5dspdGHLUcbY68lBl6?=
 =?us-ascii?Q?jAB0OLBzH2BVrdWI6vtY0Jxa48KcDvbPH99rho4472nIkX7ftl/ph0tqCde6?=
 =?us-ascii?Q?3mZfQtZznbuaEMjCujsuHya8XiJ2CVrMXS3m0TW5AyqtUdxwaFq3RFA4IAG6?=
 =?us-ascii?Q?QYGn6Ag9I1Ar9Jik7qKL7Cq4KbT1VyV4y5Mzng+QiRHdFyJH6FRfKe23J204?=
 =?us-ascii?Q?PH4+uuqJ6iwxEi1AcF9prMgYOZ020mXHDWNBszTxhclIEOSsGGic5HU58sFt?=
 =?us-ascii?Q?v0droOpw6TubTLDq7vqKem8bzKp3jSvN+8OS2DIKVJTDeSHOfUXRgTAvIBC1?=
 =?us-ascii?Q?zzW9E8hj5ulZqWJtOCob9z1+MlLLjIPTprMTh6f9b3QwtZOeVOeBUjQEG9Yd?=
 =?us-ascii?Q?c3LoeN3RZ3UnpE4AHxL3qpxk9L6It5Ak1uXMrOrbJX0XimBaSk3C1HBL/YM2?=
 =?us-ascii?Q?f/GRRORzecVeuS54wTWULx64bZNR6HlUMMJOB234+XI7jyDcavFazN3jSXWv?=
 =?us-ascii?Q?+NAobBPjLjL7D23sIiVHI5+Eb08+l54dIGHI9LjWYq0gfPzfHgJUmO2utYLe?=
 =?us-ascii?Q?WC6SQX0pbX2wPpMjBaMfCWpTeyn+ztswgj3AbAVurlhqztHu3FXT4TLfnoIZ?=
 =?us-ascii?Q?xdO6MNrMplOAiK7twkGQtdCM+t+8ybP/gUM2QnqCuouhjR/iuwdpFMrwCHml?=
 =?us-ascii?Q?SMAPCMZ1sPZqYT3kXT9BESkrOehc1+33A9wxfjygcYmoUcjr+QQ72D95wiCN?=
 =?us-ascii?Q?ZAGKlZ7xAbYLkq5a8hTOtyQJHLulK/gmeTWK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NGkWakhkRN1rC6pTu26dAb+DAlotm25OAuKBc1cDvsHc3nb1Zd37fj4C/dfK?=
 =?us-ascii?Q?vTxF+kuxnSkU+2DsAly1WB+AQ0k11pkl8gLIUmNNvkwEEN7YSmr+KlXQUS3i?=
 =?us-ascii?Q?5JCOZ9kD3UaUL67XZhz1b49+BmDbVL22lqlLb2oZt22dMINgGvFBA2yKbh+Q?=
 =?us-ascii?Q?yuffELbTjw2DlMLyBUT+k3INaX4a1o+meecWhJ7cWxRiA+qPnC8t7pmoSaIU?=
 =?us-ascii?Q?zL7+fNlR7qvz3z2ze8QtW0+BZ9xTIHFmGinAwD6ZPnByxt8ffW370JfrxcCB?=
 =?us-ascii?Q?JzJBZHhHVZ9SASUyqlWSe07UxVq7xjVgdgT8djQJ/H8sMVw87kh0GPDPIWCr?=
 =?us-ascii?Q?r0ie91T6Q+LY46zoZVyY3K60Z8uKEYUSdTP7hj2Wg9pIGa0SxtVFfu8urNTG?=
 =?us-ascii?Q?lPoqaPkGs8XcPY82/edAzRlvIodCOVEvWYwAYvh8xnwck9rTsoPWk2soqIMr?=
 =?us-ascii?Q?E+ERCMW4Z8TB+pGh76f0nOermj3t99vEojuPnletaPz20MUoj3uxADOJ0ps4?=
 =?us-ascii?Q?/dv7VRMsCOsOkiFtgE32uxMMJZHaIudQuUvrBAhl/1V37BjISQ+0cRgowLns?=
 =?us-ascii?Q?a4VBzh3LWDVD2iHFks4Zj6L+dumjfztjJekAyDLIAua/tKLsNYrbjg/hXb2O?=
 =?us-ascii?Q?8yXI4tIV5FRAHjdKi5Bp7SqonB/nCtNVKJOZ/AKH7avjo/7WP4UtKuRG4bEL?=
 =?us-ascii?Q?8iU7RaxcCTCrP3aqVcOCVE+16UxE9fd2Mtx6enz9togxJn0Jueqd3liFUpRY?=
 =?us-ascii?Q?LUMq1iBo0LrqAJQqx06b7LAA3/PPcZ5omPY4bfC8AC7axWiURHhgLc9fkaXk?=
 =?us-ascii?Q?j9mGOoVTPoStU6GExfycvHSb/0TAiVk53ItX4fLY/mKAe7ru8ev6Q8mNksvl?=
 =?us-ascii?Q?mEO8GreynJNaTeXjXvDDYi564aDCq9dO0Gfxnrh6Lo6yHOgUQY6Ypq2OZOkM?=
 =?us-ascii?Q?ATeoMMfrDnjBiqal5vN6tux2qOCXG/xnxU6ATnPIgwZuJosyTn0F99HGBK55?=
 =?us-ascii?Q?XVb4JXtlkdwtqYDEKJoD4AEV94cspjEGz1iRHHWR5Ybi3KxVfbNav2rdCaRW?=
 =?us-ascii?Q?3rmpLdLNe7kQPLHAqo3r8U+EEumfI4kPAcmuoI+WNdL8/owBowg/JjeXc1iZ?=
 =?us-ascii?Q?a+aQUYwAVx0WG9M3Vw0q0J3RaUJ0hBImX4lPT3BM07oFRQWTtG6gHyDZnzeU?=
 =?us-ascii?Q?l3/21zjSNjQqUgZJ+U1EgEjnJ5OIvVaI3DcA+ayuxG0WwibhiDywYhEZQ+rj?=
 =?us-ascii?Q?qrj2DzJwUOA7Xd78m9fRUzOVB68N7DCWANAbjesGeV3iE63H285qPPF161EH?=
 =?us-ascii?Q?CCMEyvhC9vR1zR7aiSZZl6CRSw4wGOUPb8CWruYEV/KrMjxDpiFZRYEiXDH1?=
 =?us-ascii?Q?f0+JV7iVT28HZoo6kRT6GXB98FwNp69Y33GkpkTl9xty0rNVhP2kmcy0Ndup?=
 =?us-ascii?Q?Qj7aEjNHSHBWS2wZpZeJIdz5CZRQVDc7QYF2gPTY/rtvYmlF15WDThiSIx7F?=
 =?us-ascii?Q?VczJ1EG50QUgHOijGio4ckZFTFVAAiG3J+dHImhn81cepSFNfQy5g6MqlAnd?=
 =?us-ascii?Q?Zmg6uzxaCrjebh/PMCOZtwm/cQDvkU634TVkTKW0VXAefKRHLDDh6ORvUvKL?=
 =?us-ascii?Q?soUEBISzmnAr+Rxc96FbPTyvT+THB4atbxl5W+rDAM3RpAKGHHQUffH83sQU?=
 =?us-ascii?Q?wU7KhiUiO8YHj6dXMWlHKSkckh6SAVP/AjU77su6Q5ezjwVnyMwk05AcKIo1?=
 =?us-ascii?Q?AonmkvoZ1Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba7f30e-0ec7-41cd-6695-08de4d1427a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 11:10:09.2428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYrHOvRZhoWXhJtk5SzD9fBppJ3bxmspvt8frj+g8Mcfy9yHZXw5mGAWeMY6dC4P4qZYLivCt9Oxe2INF+/msA==
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
> Subject: [PATCH 07/13] drm/amd/display: Hook up colorop destroy helper fo=
r
> plane pipelines
>=20
> Provide a drm_colorop_funcs instance for amdgpu_dm color pipeline objects=
 and
> hook up the common drm_colorop_destroy() helper as the destroy callback.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 25 +++++++++++++------
>  1 file changed, 17 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index dfdb4fb4219f..5130962193d9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -55,6 +55,10 @@ const u64 amdgpu_dm_supported_blnd_tfs =3D
>=20
>  #define LUT3D_SIZE		17
>=20
> +static const struct drm_colorop_funcs dm_colorop_funcs =3D {
> +	.destroy =3D drm_colorop_destroy,
> +};
> +
>  int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struc=
t
> drm_prop_enum_list *list)  {
>  	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS]; @@ -72,7 +76,7
> @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, str=
uct
> drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
> +	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +&dm_colorop_funcs,
>  					      amdgpu_dm_supported_degam_tfs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
> @@ -89,7 +93,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_mult_init(dev, ops[i], plane, NULL,
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret =3D drm_plane_colorop_mult_init(dev, ops[i], plane, &dm_colorop_fun=
cs,
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
>=20
> @@ -104,7 +109,8 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
> +					     &dm_colorop_funcs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
> @@ -121,7 +127,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  			goto cleanup;
>  		}
>=20
> -		ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
> +		ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +&dm_colorop_funcs,
>=20
> 	amdgpu_dm_supported_shaper_tfs,
>=20
> 	DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  		if (ret)
> @@ -138,7 +144,8 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  			goto cleanup;
>  		}
>=20
> -		ret =3D drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
> NULL,
> +		ret =3D drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
> +							&dm_colorop_funcs,
>=20
> 	MAX_COLOR_LUT_ENTRIES,
>=20
> 	DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> 	DRM_COLOROP_FLAG_ALLOW_BYPASS);
> @@ -156,7 +163,8 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  			goto cleanup;
>  		}
>=20
> -		ret =3D drm_plane_colorop_3dlut_init(dev, ops[i], plane, NULL,
> LUT3D_SIZE,
> +		ret =3D drm_plane_colorop_3dlut_init(dev, ops[i], plane,
> +					&dm_colorop_funcs, LUT3D_SIZE,
>=20
> 	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>=20
> 	DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  		if (ret)
> @@ -174,7 +182,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
> +	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +&dm_colorop_funcs,
>  					      amdgpu_dm_supported_blnd_tfs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
> @@ -191,7 +199,8 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, NULL,
> MAX_COLOR_LUT_ENTRIES,
> +	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
> &dm_colorop_funcs,
> +						  MAX_COLOR_LUT_ENTRIES,
>=20
> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
> --
> 2.25.1

