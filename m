Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A28A893AE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 08:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8609410E358;
	Tue, 15 Apr 2025 06:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XGBGBxU7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6752310E0E3;
 Tue, 15 Apr 2025 06:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744697367; x=1776233367;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QaKM3MKtd3dTK7vqs6Q/JR0VKkRK6dkbDxv31/J1AUM=;
 b=XGBGBxU7ceosJOCLMUd2zWY2p1FOwtASPOMFRZ3cu0rj7nHNgM8X6czr
 nSoPgdJStliV6f3oHjTiOOEiuxEcvl6gG0eOPIyuBLTR8N7mC7h6EogX0
 VWF5dB7qCTqVOib7jJsX5sSgM7mkJvG1zPHqOtnfWZkq1sQrKKfAnbA1H
 uCEQwb55uu8pIetG9EMe//yiknf+bcei7LkeoNYbdz1t84qo5E5GOYr+u
 GWzahZnnEY3YoLYYWQ6cmiHhbma4WRE+mRncZnsxKilpCoWeVX4MuR1cw
 Q9NssjcVouoDA8T9bCHIuy1S6/SGgkS34DGGz0A6qkk6pknhp1/ktBE6s Q==;
X-CSE-ConnectionGUID: U6pqMRKVQkyBuGgEmQhaxg==
X-CSE-MsgGUID: 3NnEMRCLRp6OgUwOhxquHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="50016153"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="50016153"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 23:09:26 -0700
X-CSE-ConnectionGUID: oc559xnMQHu2Y0hMGzCLUg==
X-CSE-MsgGUID: jZbU4vGeRe+KZXQBXKLXhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130557202"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 23:09:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 23:09:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 23:09:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 23:09:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BevOGfuwtLjSf+8Htfwkeg3UJf2WB3eprfZ9PpvkphcoYdrLKDVBLvxJYD/no/oYoTljdvM5M4XhOjQhdhezPDHuAAFVW5iHFy/D+Fy4JbvniJ71BLqmQsAzxhxNCRvM8P/2wgZwAM2T7NE+duA8fp/OS1kKS54sZQyBcj43ONZpuz87GiqsqlLQiis/RTHRCS4uqftg3Z0LEU9CBg1pIQIjyjtY34jP+Gph5VCdtSEN7uCaODOQPJAr5x1BITIi2mupJOVJiK/kcO9/CGlpSjBW7V5Kgqn9LYqiZunFjEgpIB5vdPUsSMVhJzXFIzmsvu2uzCyTyatnA9LUIyi86w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOB0CLY9mJs8EVhb9qlgcwglx7a4adt6q3sJnqqOcWk=;
 b=U+WgW7z+/mYLGmMKceRsPf51yjnIEgwB0cEz1eHrzetw3LO6jIwZLGhDOEyirAyqSJzW/uNsnQeLnc4ADamfeEF7E4/rqQhCJHNgtkrqtA+MXkh0nSQOsbsgiJKQuz9a+tNfTFPeEkNkY3yLLoT+vpaeGIt6sEiyY6mJgdh//gO2+pJTpn2B9gagkKzcJDEcAs9DKr4AfRU+f+Ks1nn1qg19KE8WIZG30CAfNgesXwQ6HBZFN3qxO9UhR69kIK91qZ1mviZ2W+LFp5wzfoN75VP/xz6GEjxuD2Bud2LgZ7UwJEu+qQVaXhI9pyEyK02K7eP9p8b1J5rcn4IFaiOlaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by CY8PR11MB7395.namprd11.prod.outlook.com (2603:10b6:930:86::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 06:09:22 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::3ac4:e20e:84f1:f826]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::3ac4:e20e:84f1:f826%4]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 06:09:22 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Alex Hung <alex.hung@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "mwen@igalia.com"
 <mwen@igalia.com>, "jadahl@redhat.com" <jadahl@redhat.com>,
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>, "agoins@nvidia.com"
 <agoins@nvidia.com>, "joshua@froggi.es" <joshua@froggi.es>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>, "aleixpol@kde.org"
 <aleixpol@kde.org>, "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>, "Borah, Chaitanya
 Kumar" <chaitanya.kumar.borah@intel.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: RE: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
Thread-Topic: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
Thread-Index: AQHbnqqz2YhtxDgq7E6gFv3ZntqEdLOkXCdQ
Date: Tue, 15 Apr 2025 06:09:22 +0000
Message-ID: <CY5PR11MB63441E057180C043C51230A3F4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-33-alex.hung@amd.com>
In-Reply-To: <20250326234748.2982010-33-alex.hung@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|CY8PR11MB7395:EE_
x-ms-office365-filtering-correlation-id: 8d0bac22-63c6-4840-2295-08dd7be410d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ptk3YTd2AGmmIPy5EyPGcJ2YOH65Hn3hoBtncRInIjJ+65oTq7M3y/1IMIb8?=
 =?us-ascii?Q?jerdLvaRre2poUf2gRy71t7f9w4hyKisv4QWXP8IWnC+pt5/nq4YIxIhR2CD?=
 =?us-ascii?Q?RajQTSfO1cA2i5Xu7cQvDIU8iUlZYP5XbTIHbX/3UZl4fLDIfYbwrjRNugSa?=
 =?us-ascii?Q?X0XCMHfQ9Kkoj1ghHTmv5gqafCv7ujwHb1EOwiusFJlsKcDbRtutTc92sfTr?=
 =?us-ascii?Q?vIa/106F7wuMsMxFKsDfXyqYBPdcXJrBgiv4dFtGSKvMlN9IISrqyGp080VG?=
 =?us-ascii?Q?W8HwyEiwRLOpLcxy9DVxsUxXh+DwETz6OEOdwEOftWBedNjorRAhMH2TOm03?=
 =?us-ascii?Q?YCc1vWBynw2559Hvj1LS0ezVRWIf3LoO65oQPj+PfkU0vcOMfGjbgumRu8QD?=
 =?us-ascii?Q?pkhtVjX97RV0KrFbqq7I6wOkQBB2yuhw7ZS1pHjTusxkQB+uUc2xbDgfII7G?=
 =?us-ascii?Q?WF+YRiuPlqXoNoCiDMTmCNCOTn1ZdZXtHLDw1VrKwRot5Q/iQVm/9dZ80oQ3?=
 =?us-ascii?Q?saE2OUZtF85lE8mhq8Epbl3gYe/o4ev6NPksltM0fyMu+jzNh5xKG+gNHusx?=
 =?us-ascii?Q?n4CaF6LFu2TOeo6YAb5VJRSpJd6CT5iq2NwpmD1LjTKZGklpT+2Cfg2SxJdR?=
 =?us-ascii?Q?+FaC9FjZikTPambcv+VDquSp6XlcX0VKdvRHeY220Rv2iTq0EIty+Z+rDdnY?=
 =?us-ascii?Q?LdJyJmkDgWRqmvc9JChcPqvmAcfm1SNoJhGodIBpOMK2ELXMl0ENQ+oEnQI8?=
 =?us-ascii?Q?RnnrnhtzCKMQr8Pnmwc866osZPhqX4eWcAobhJ49VSMCZMYBFYERo6zELOLI?=
 =?us-ascii?Q?KCwSUz9SHdeT9UVWPGBCRXNNKM8KMbvJny3cRMhHTrd17o+w7MKYCDaxUc8h?=
 =?us-ascii?Q?M3Uj6C/akZB6Ao2SN2eh3zIkfoOgYAfOxJ2c+MIfgkO8zCMTm0mQBTxjh/RM?=
 =?us-ascii?Q?7x8yJsrKXH7kxeM2Ns3dsJNAGtRbw+NS5YbaYkzq3O670/z5sIT8+MwuoFTI?=
 =?us-ascii?Q?cfTtjxoe7biW0+EGK+T+CfmB7GJhvm9lTAAhz7VBgF2l6D8iY2J+Wh7++Ecv?=
 =?us-ascii?Q?fbizOAMkL/HSA0UVmh4BINnmDZuy4T+2CwzR3zu9nvhF/98e++tegQ6QvctT?=
 =?us-ascii?Q?C/GkHxcpOB/FOg8c+ijF0QjKv5/fPith3FWVX1BEpsxZc9m0WETRAkLKuQ7/?=
 =?us-ascii?Q?yOsmjOTJqR1LjFybYHT77WDUhd851h9q8acu2+Uc1L+Lztoya8H4+mhi5TmZ?=
 =?us-ascii?Q?g8WF+9L+s4OfqkpUigxt0+YPVgEXItjRj9FwGhUSAV5+QzjiGg/OapCkuDP6?=
 =?us-ascii?Q?ELIwXU+Kk36NSQJv8HIfRhw5okK2QyPXp/sIv2Peg/HC2Q4uy3xt6P2M+G2C?=
 =?us-ascii?Q?EJM07+PBvB/L7AdiaA6aXanItGrDyhwjwfZiR2t9lrv8pj1zm1V8H5cwVSXt?=
 =?us-ascii?Q?iusLe1x3drU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FZdYPm2VJP000n0fsYZFNnTToK/+QRwvZ2EujsLuL+tYVUxFnhgXDGTE2r0p?=
 =?us-ascii?Q?EBh+28ckWmh7jaHqda6ptxJz3ZfgyIktvh5BFTCpA/Pxdb48CQHNAE2bdECn?=
 =?us-ascii?Q?J1uCcPsZkksv8xNfXPdcAF5eugtuydGPswHCTAGSzdZ9EUw/56+80DsGdoy5?=
 =?us-ascii?Q?8e+8h7vN43anQTEgl2pdKySO8e65mr5BWr9610vIHvAAb4hcUYNlgtK4EXZk?=
 =?us-ascii?Q?pLYsaSr1jYm8sfykFzu7ejSO1UHRIwdynzjM+j9DwEE7HlvICumcfwjwv1NM?=
 =?us-ascii?Q?q9GfQe3TvFaQEqmIIDZGCNXDzIfcUPq/lxSCTNPATOZi4DPDlPUsLP5x+vFI?=
 =?us-ascii?Q?RvSxj941I7Y895aTdS6FoqeG3CAHJNnZttThyfncDg/aqRlKSu7dn5yYIINW?=
 =?us-ascii?Q?4AlJEQjOnVI6VmboFGaW3DAdLHYYl8Se8Dkhmd/38kEcG+bOSNVR06PyM8O1?=
 =?us-ascii?Q?bTxlnq+5IpiTIcXDLoLGXmm6yfUIRm5LOvawPQYMTohIwMG5XBZ4CdXnFtaF?=
 =?us-ascii?Q?h+l5rZQs3Onljb4Y4ps6xcCZfzoCB0ecMcyKBvaAXwVlU39ow46vzdPM97Ek?=
 =?us-ascii?Q?JNB5MWpWUUcIrR7eCeQigkkC9EH/MfBR6Vj9F4mVsps4A0m44umnAnNZXlJL?=
 =?us-ascii?Q?VcKCh9Xxg4Wt4NJBDSjLBLYrEM3gcVDBi5fpDMwkpwNk7KcU4WASQ15i1Be1?=
 =?us-ascii?Q?ipClvpXzg7ua6C6PI0NUaMrK3u2feNBlvl9+aFUBHdEmD9xzi75/DQAz2gwv?=
 =?us-ascii?Q?63lQWcXMlISW4DrPPYHZLo3VASwWKdNikiMUq43qm87cQQHPRN4zEWjAqNXC?=
 =?us-ascii?Q?4KEpE1rOm/HR/P47fnrBvNpDwk1RB5PZNDVkN+yoeRalz/VN2v6ajin+o2sW?=
 =?us-ascii?Q?x72Tbz1ikeiAi9be3E2I82KpB1yj6jWEFK56SithSzHzYslSAYfsLicblMVk?=
 =?us-ascii?Q?UM6gb7vcaEsAFNzekXWsY/vnqf3BCGn7aZEnyaiRrzhU998L8pplU2xlsprM?=
 =?us-ascii?Q?dv3VWRzND3N20n7bYKvSgD7L9SyinU/t49kwrAdmVhaCbAKTiu8rlsUajFLM?=
 =?us-ascii?Q?ZsYwF3FR7+kiBpGDAFYmOZl50pJkTpoARAcIy0WyYpI0KrMrf1wpQ/c4FcUx?=
 =?us-ascii?Q?mpcaIZ+jzTv9gHLnMIe7GiY1Oy+HqcDU9oZFPSJZqrIhipl0JWIf4W2Zs0R+?=
 =?us-ascii?Q?3mlxyTc9eIaLG8X0p35k2rBKp0m2/Z0ReVsL/mrZfUvuIn5p0vBCgMVG3uCp?=
 =?us-ascii?Q?3oI/EwqmAS03wGeXXFs2ZH5ATvfA3umOhXp2qx4onU/eKoV/qh4THR1JAH6L?=
 =?us-ascii?Q?qaacOkF24VOrsDhTDNOWEKWWJx55qvmDYqsz9N4acRJEb2LePBGGapQcRDIE?=
 =?us-ascii?Q?ADCBZhCR5tfWwGLyq9doXCzkfNdGGuQHjj7/n3IxctRe5ozrKarQNMvinTt/?=
 =?us-ascii?Q?/p1ylbp+4bTCQY6qLnrscsXoZBuztvk4ZzsAK5KymNzpR1W1lLTwhTNak8Kv?=
 =?us-ascii?Q?Dt63spYKcXedQiK3F6mf74bKeC/xF/yTgf+QyiVcdpfSlF74Skp8NYjOvFXT?=
 =?us-ascii?Q?7d+u4A5KpUpYIhF9dV1sjydHOPJeBE++ItUPDKOT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0bac22-63c6-4840-2295-08dd7be410d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 06:09:22.0672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m+TLTnXuoBRA0TOpprnsPZ6639Axdra/kDivx1frATh4vgWhpk6Vt8z4GZMG9M5LORwPAH5RjJWZehTkm0lK2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7395
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
> From: Alex Hung <alex.hung@amd.com>
> Sent: Thursday, March 27, 2025 5:17 AM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: wayland-devel@lists.freedesktop.org; harry.wentland@amd.com;
> alex.hung@amd.com; leo.liu@amd.com; ville.syrjala@linux.intel.com;
> pekka.paalanen@collabora.com; contact@emersion.fr; mwen@igalia.com;
> jadahl@redhat.com; sebastian.wick@redhat.com; shashank.sharma@amd.com;
> agoins@nvidia.com; joshua@froggi.es; mdaenzer@redhat.com;
> aleixpol@kde.org; xaver.hugl@gmail.com; victoria@system76.com;
> daniel@ffwll.ch; Shankar, Uma <uma.shankar@intel.com>;
> quic_naseer@quicinc.com; quic_cbraga@quicinc.com;
> quic_abhinavk@quicinc.com; marcan@marcan.st; Liviu.Dudau@arm.com;
> sashamcintosh@google.com; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; louis.chauvet@bootlin.com
> Subject: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
>=20
> We've previously introduced DRM_COLOROP_1D_CURVE for pre-defined 1D
> curves. But we also have HW that supports custom curves and userspace nee=
ds
> the ability to pass custom curves, aka LUTs.
>=20
> This patch introduces a new colorop type, called DRM_COLOROP_1D_LUT that
> provides a SIZE property which is used by a driver to advertise the suppo=
rted SIZE
> of the LUT, as well as a DATA property which userspace uses to set the LU=
T.
>=20
> DATA and size function in the same way as current drm_crtc GAMMA and
> DEGAMMA LUTs.

Thanks Alex and Harry for driving this forward.
We want to have just one change in the way we expose the hardware capabilit=
ies else
all looks good in general.

To expose the capabilities of 1D Lut (of any kind), we can use a generic
implementation which covers the distribution of LUT samples along with size=
 and
precision in a common color op. Something like below:

struct drm_color_lut_range {
	       __u32 flags;
	       __u16 count;
	       __s32 start, end;
	       __u32 norm_factor;

	       struct {
	               __u16 intp;
	               __u16 fracp;
	       } precision;
	};

The idea is to expose the lut distribution covering the entire color range =
from 0 to 1.0.
The underlying implementation in hardware can have just 1 segment covering =
the full range
OR a complex LUT distribution in Hardware like PWL, multi segmented etc.

To explain the usage with some real life example
------------------------------------------------

1. Conventional 1D LUT with just one segment

		|---|---|------------------------------------|
		0   1   2                                   1024


	- Hardware Description: A color block with a LUT linearly interpolating an=
d
				covering range from 0 to 1.0
					- Number of segments - 1
					- Number of samples in LUT 1024
					- Precision of LUT samples in HW 0.10
					- Normalization Factor - Max value to represent 1.0
						 in terms of smallest step size which is 1024.

	In this case, it will be represented by the following structure.

	struct drm_color_lut_range lut_1024[] =3D {
			.start =3D 0 .end =3D (1 << 10);
			.normalization_factor =3D 1024;
			.count =3D 1024;
			.precision {
				.int_comp =3D 0;
				.fractional_comp =3D 10;
			}
		}

2. Piece Wise Linear 1D LUT

	  |---|---|------------------------------------|
	  0   1   2                                                32
                |       \
                |          \
                |             \
                |                \
	  0                   \
                |---|---|--...---|
	 0   1   2            8

	- Hardware Description: A color block with a LUT linearly interpolating an=
d
				covering range from 0 to 1.0
					- Number of segments 2
					- Number of samples
						- segment 1 - 9 (covers range from 0 to 1/32)
						- segment 2 - 30 (covers range from 2/32 to 1.0)
					- Precision of LUT samples in HW 0.24
					- Normalization Factor - Max value to represent 1.0
						 in terms of smallest step size which is 8*32.

		struct drm_color_lut_range lut_pwl[] =3D {
		        /* segment 1 */
		        {
				.count =3D 9,
				.start =3D 0, .end =3D 8,
				.norm_factor =3D 8*32,
				.precision =3D {
					.intp =3D 0,
					.fracp =3D 24,
				},
			},
		        /* segment 2 */
			{
				.count =3D 30,
				.start =3D 8*2, .end =3D 8*32,
				.norm_factor =3D 8*32,
				.precision =3D {
					.intp =3D 0,
					.fracp =3D 24,
				},
		        },
		}

We can add and modify the relevant fields to be exposed in the capability s=
tructure as per
the community feedback, but this should be able to cover all the 1d LUT asp=
ects and generically
expose the entire hardware block to userspace.

With this info, userspace will be able to compute the LUT samples for any s=
pecific usecase and we
may not need any exclusive "SIZE" or separate 1D lut property and just have=
 this common property
which exposes hardware lut capabilities through "struct drm_color_lut_range=
"

Please refer to below links explaining the implementation:
[1] https://patchwork.freedesktop.org/patch/642652/?series=3D129812&rev=3D4
[2] https://patchwork.freedesktop.org/patch/642591/?series=3D129812&rev=3D4
[3] https://patchwork.freedesktop.org/patch/642597/?series=3D129812&rev=3D4

Regards,
Uma Shankar

> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Co-developed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
> v8:
>  - Add DRM_MODE_PROP_ATOMIC to drm_property_create_range (Simon Ser)
>  - Change "1D Curve Custom LUT" to "1D LUT" (Simon Ser)
>=20
> v7:
>  - Change "size" to "lut_size" (this affects multiple following commits)
>  - Move "lut_size" from drm_colorop_state to drm_colorop
>  - Modify other files accordingly (i.e. from drm_colorop_state->size
>    to drm_colorop->lut_size)
>=20
> v5:
>  - Add kernel doc
>  - Define SIZE in similar manner to GAMMA_SIZE on drm_crtc (Melissa)
>=20
>  drivers/gpu/drm/drm_atomic.c      |  4 +++
>  drivers/gpu/drm/drm_atomic_uapi.c |  5 ++++
>  drivers/gpu/drm/drm_colorop.c     | 43 +++++++++++++++++++++++++++++++
>  include/drm/drm_colorop.h         | 16 ++++++++++++
>  include/uapi/drm/drm_mode.h       | 14 ++++++++++
>  5 files changed, 82 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 5223cf363692..f713d177241d 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -793,6 +793,10 @@ static void drm_atomic_colorop_print_state(struct
> drm_printer *p,
>  		drm_printf(p, "\tcurve_1d_type=3D%s\n",
>  			   drm_get_colorop_curve_1d_type_name(state-
> >curve_1d_type));
>  		break;
> +	case DRM_COLOROP_1D_LUT:
> +		drm_printf(p, "\tsize=3D%d\n", colorop->lut_size);
> +		drm_printf(p, "\tdata blob id=3D%d\n", state->data ? state->data-
> >base.id : 0);
> +		break;
>  	case DRM_COLOROP_CTM_3X4:
>  		drm_printf(p, "\tdata blob id=3D%d\n", state->data ? state->data-
> >base.id : 0);
>  		break;
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> b/drivers/gpu/drm/drm_atomic_uapi.c
> index dcd12fc0bd8f..dfd88a227da7 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -713,6 +713,9 @@ static int drm_atomic_color_set_data_property(struct
> drm_colorop *colorop,
>  	bool replaced =3D false;
>=20
>  	switch (colorop->type) {
> +	case DRM_COLOROP_1D_LUT:
> +		size =3D colorop->lut_size * sizeof(struct drm_color_lut);
> +		break;
>  	case DRM_COLOROP_CTM_3X4:
>  		size =3D sizeof(struct drm_color_ctm_3x4);
>  		break;
> @@ -762,6 +765,8 @@ drm_atomic_colorop_get_property(struct drm_colorop
> *colorop,
>  		*val =3D state->bypass;
>  	} else if (property =3D=3D colorop->curve_1d_type_property) {
>  		*val =3D state->curve_1d_type;
> +	} else if (property =3D=3D colorop->lut_size_property) {
> +		*val =3D colorop->lut_size;
>  	} else if (property =3D=3D colorop->data_property) {
>  		*val =3D (state->data) ? state->data->base.id : 0;
>  	} else {
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c
> index fcb4a8d0e38d..15ffbba60b3d 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -64,6 +64,7 @@
>=20
>  static const struct drm_prop_enum_list drm_colorop_type_enum_list[] =3D =
{
>  	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
> +	{ DRM_COLOROP_1D_LUT, "1D LUT" },
>  	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
>  };
>=20
> @@ -225,6 +226,47 @@ static int drm_colorop_create_data_prop(struct
> drm_device *dev, struct drm_color
>  	return 0;
>  }
>=20
> +/**
> + * drm_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
> + *
> + * @dev: DRM device
> + * @colorop: The drm_colorop object to initialize
> + * @plane: The associated drm_plane
> + * @lut_size: LUT size supported by driver
> + * @return zero on success, -E value on failure  */ int
> +drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop
> *colorop,
> +				  struct drm_plane *plane, uint32_t lut_size) {
> +	struct drm_property *prop;
> +	int ret;
> +
> +	ret =3D drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT);
> +	if (ret)
> +		return ret;
> +
> +	/* initialize 1D LUT only attribute */
> +	/* LUT size */
> +	prop =3D drm_property_create_range(dev,
> DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
> +					 "SIZE", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	colorop->lut_size_property =3D prop;
> +	drm_object_attach_property(&colorop->base, colorop-
> >lut_size_property, lut_size);
> +	colorop->lut_size =3D lut_size;
> +
> +	/* data */
> +	ret =3D drm_colorop_create_data_prop(dev, colorop);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_reset(colorop);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_colorop_curve_1d_lut_init);
> +
>  int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop
> *colorop,
>  			     struct drm_plane *plane)
>  {
> @@ -333,6 +375,7 @@ void drm_colorop_reset(struct drm_colorop *colorop)
>=20
>  static const char * const colorop_type_name[] =3D {
>  	[DRM_COLOROP_1D_CURVE] =3D "1D Curve",
> +	[DRM_COLOROP_1D_LUT] =3D "1D LUT",
>  	[DRM_COLOROP_CTM_3X4] =3D "3x4 Matrix",
>  };
>=20
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h index
> d3a60c1beed1..d66c76033343 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -259,6 +259,13 @@ struct drm_colorop {
>  	 */
>  	struct drm_property *bypass_property;
>=20
> +	/**
> +	 * @lut_size:
> +	 *
> +	 * Number of entries of the custom LUT. This should be read-only.
> +	 */
> +	uint32_t lut_size;
> +
>  	/**
>  	 * @curve_1d_type_property:
>  	 *
> @@ -266,6 +273,13 @@ struct drm_colorop {
>  	 */
>  	struct drm_property *curve_1d_type_property;
>=20
> +	/**
> +	 * @lut_size_property:
> +	 *
> +	 * Size property for custom LUT from userspace.
> +	 */
> +	struct drm_property *lut_size_property;
> +
>  	/**
>  	 * @data_property:
>  	 *
> @@ -310,6 +324,8 @@ static inline struct drm_colorop *drm_colorop_find(st=
ruct
> drm_device *dev,
>=20
>  int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop
> *colorop,
>  			      struct drm_plane *plane, u64 supported_tfs);
> +int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_col=
orop
> *colorop,
> +				  struct drm_plane *plane, uint32_t lut_size);
>  int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop
> *colorop,
>  			     struct drm_plane *plane);
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 651bdf48b766..dde250dd7a51 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -890,6 +890,20 @@ enum drm_colorop_type {
>  	 */
>  	DRM_COLOROP_1D_CURVE,
>=20
> +	/**
> +	 * @DRM_COLOROP_1D_LUT:
> +	 *
> +	 * enum string "1D LUT"
> +	 *
> +	 * A simple 1D LUT of uniformly spaced &drm_color_lut entries,
> +	 * packed into a blob via the DATA property. The driver's
> +	 * expected LUT size is advertised via the SIZE property.
> +	 *
> +	 * The DATA blob is an array of struct drm_color_lut with size
> +	 * of "lut_size".
> +	 */
> +	DRM_COLOROP_1D_LUT,
> +
>  	/**
>  	 * @DRM_COLOROP_CTM_3X4:
>  	 *
> --
> 2.43.0

