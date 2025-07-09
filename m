Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F437AFF127
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 20:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E2610E0AB;
	Wed,  9 Jul 2025 18:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7WA5Q0k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BFD10E09B;
 Wed,  9 Jul 2025 18:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752086967; x=1783622967;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7eeXvzy6Ho4cO/fFIQtDddPnnN1pR676jE8V+cJKFdQ=;
 b=B7WA5Q0kNqx4bGS0m8Ht3HoMUFhC5jttukIf+djvif/4ND0ehMrlo6pM
 gVJcLdoiN3TU1fEZ9LX1t6C+wRE/wWilR/C6M8zB4lLimAPFcWICpgI2+
 nEOc4xagXrPqtHltsyN81791FXu8hG2ntdXR+snUNb7Uu/TX2RJX09vaQ
 Eh7eWAanKzgG9s1VwDXP/smZFoMtEyqCTWlbVrBPhv79r0msDi41HVxIo
 2ctHRmh9bbNZbJJdf9EIK7rA0vcT+7WP11VwtpdahrUtN2Ra+DfP3aN//
 g4iBn+2IQN+ulimrimjqGwVVDC0fq/Rx2MLmod2NQC/EWcG/fLl4B4lTq w==;
X-CSE-ConnectionGUID: TM8nQxecRLeKx8IcNCJNJg==
X-CSE-MsgGUID: cYkemKiOSveBJ9SQYk9Gow==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54078030"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54078030"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 11:49:26 -0700
X-CSE-ConnectionGUID: LmpRib8zQmmQzQkiwcXdRw==
X-CSE-MsgGUID: xVz1AqppTKyoA2vLyYMWyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="186849296"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 11:49:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 11:49:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 11:49:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.87)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 11:49:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWsbxgc2pY7Ib3f53oRzhq5U2V12vGpzChIuWgY+ZLGnWhX44/wgpfWqHfKF94cy6tNUaMGuq1CrKaRtv7LPL58478mmW9Ko8c4JZvT3QbJnsydE5QhEyv3gQkdh3iy+IgJatTo5pLFFZmDzVi/DDoWu1lHl0ITzw6ctPJS/ReN6E675GAT+DyqYDjmTOak9+v7Hgt/DgwuO6zuucpPVKDYunYhDGhxBDW/lJHgatQ8nA18RoKlHeTFkBnXlpHI7RhKbGMKsqcb326dhHrvUkDMkykzBCxgiNHmz1k/K0vQOKXeOq9ktEg6k0N2rKkN0HyYwzJfRwONu69IQ0BWzuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcQ4aowCR4j8UXEZuV0jpaaICCDZI2FsOEOsEbwJrzk=;
 b=d/qQ7fVn2PNpCYCOogE5+JLae1m95SJ93UNk1LvAVn80N5UMKxO0JnB/uSXRV+NAxlvEzsVsoiRqqXFUm5zfbGjtI4s9MhlNDmKUohSk+KGIE7vcBySbJGkToJCnFGVVcKZmrxMZ6rJGxPmUJkidV73auO10m9wkG97gWeFOL3UatMgU6tqR9u6ce0rN2TXnrEOibYm8DGWhYT0Ul4BUWSmNfPMWnLzDSwGzVzkRhp3eQ25l6sgA700OM8atMlqHRXFKOftqZRXU9gbBl5FNeIA2RQxdvQxQQ7wzpByhJNYPRmP1c2rJnXWy28XbhsPuGgXeI0QSVPJl1T2Nk+2L4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM4PR11MB8131.namprd11.prod.outlook.com (2603:10b6:8:190::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 18:49:22 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8857.020; Wed, 9 Jul 2025
 18:49:22 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Alex Hung <alex.hung@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
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
 <daniel@ffwll.ch>, "Shankar, Uma" <uma.shankar@intel.com>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>,
 "arthurgrillo@riseup.net" <arthurgrillo@riseup.net>
Subject: RE: [PATCH V10 33/46] drm: Add Enhanced LUT precision structure
Thread-Topic: [PATCH V10 33/46] drm: Add Enhanced LUT precision structure
Thread-Index: AQHb30AAJLHwA8CO4EyfEs1O7PT3RLQqQrMA
Date: Wed, 9 Jul 2025 18:49:22 +0000
Message-ID: <SJ1PR11MB6129B6D3BF76BA0A517B2FF7B949A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-34-alex.hung@amd.com>
In-Reply-To: <20250617041746.2884343-34-alex.hung@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DM4PR11MB8131:EE_
x-ms-office365-filtering-correlation-id: 791bc5e0-c781-4777-3c2d-08ddbf1951fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?AVSn1cPhYxXBYvmjChGb/6Hal7vGAhZ1O5UPNn3QJ0qAhNZapkB90pXQn/xX?=
 =?us-ascii?Q?PgtWCaIso2F9NPoYBLtWtqRW+AnkVwtsmg+djemAPCQwZm43Zt6/ziVC0G1k?=
 =?us-ascii?Q?KgOhyfbbqNNO2Csb6Ys6+8sFYVhAtlkc8iooOJ9SCEutf+P1/xNTieQDcvYW?=
 =?us-ascii?Q?BU1lnzyfQN56JgFKK1/hm0Y4O5VN3JwYTaWhQFpdw3lQuIpZGMilhCUDMSiC?=
 =?us-ascii?Q?Q9HvqZroGCvvOeGEgOf8Pc4HMizQTKvVihQAvJm+rLKX7MI4setMLNeHtlBt?=
 =?us-ascii?Q?Xt2QNKkk2y7J67uuAJLhYP11y43bU5ysUct5uDd+An7MrygryScpC6ic3+Ts?=
 =?us-ascii?Q?AqPX+VbRo/3P9TVqsxQscrq2pOW0pEwgJhqq5/VwZ6pvuuAm3OV2mtb4EQDk?=
 =?us-ascii?Q?KD4cqH3rJVO9O3sEqZK9BdpFFOsNhA3EJID9nFiyycNFTSCXnD1f6wI7GLKt?=
 =?us-ascii?Q?V6z+YGTwrmozgF6d7wBn6eeZwvuafZnJ51eWiceemAdXJ9qalXepy/VD9qDx?=
 =?us-ascii?Q?K4l1Ue866onHJ7SYBChx7bvJLww6IX6MgwUYpmtU5d93ABJYLaYxX1HR2kZm?=
 =?us-ascii?Q?F1FIrKYHqchy0pIheeLl3k6/mDzmoWEJcXEifvYHThyIJCHj4c1nNU8zoL5L?=
 =?us-ascii?Q?cHnmseMWJmRE4VwcmvEO9xIOp+qXyK17R/04bw/+9D2J9s1hTCCyHOwLemtb?=
 =?us-ascii?Q?qttCmhQyQX7oojNKA0duBmuULlI+4AHKeF7cq/JnCyIzrc2OzOa/sGNN7Ly5?=
 =?us-ascii?Q?foY89kToi1vfKiCGY8Fs0luFFDxGUwEX5Lbzv7LbhcCdk4tXyB+ccdGJEakf?=
 =?us-ascii?Q?0yjuMlb6C73i38XMJrTmdicDnycdhzEK/3bP8/n95ouEFOOdCgZZqKRfOJWH?=
 =?us-ascii?Q?N6PXF1cQiM/w0NUFDNsYJXUrDEbyeE2lyFa7E8oqYUqdHagq9oJcHTo+wKFI?=
 =?us-ascii?Q?NliGsrFa4sccC7esZqWtCe/F+2AYMMz6/KwD/z3KPYMGV/Pl4uYwCT+yMLvb?=
 =?us-ascii?Q?CkGprpr+uebjhl0T4zxiaIt/j7LdgFWpsuxLt38bBDx/aCVx4EVkEh1JJYAA?=
 =?us-ascii?Q?wDFx99bvXYzhJw7l5esUoBhqt6DYi0YQI12gBlg5VnIg4fDDeWElj3UozmZH?=
 =?us-ascii?Q?ETmBn+y8BX84M8XWAknJ5G0xrSz5mhZzQQkecK8ZDa1S/c+SDtjxDZc77C3Q?=
 =?us-ascii?Q?6hE8b21l7z/zi3nAd2lFFanKQOErbzA/G2dsA1pxf7izZWa3U0yezl3CW0vr?=
 =?us-ascii?Q?8q2sXklxPDXf/MyxslPj/6O8FmlqiPbrXA0++MkGQRmg99p/PWgUhZ+Sc9AV?=
 =?us-ascii?Q?Yxo5zhDi7uOmy2l6RYMtUjs7mUTGdvRGoQN6aQGU8W9SGPu0f1b3VcDpoZBt?=
 =?us-ascii?Q?pbM4iNlK0QjoBDCvs/UqHzvYGA+zjBqeOrH4t63sWJU+KtLRcWfBoBR9E/Ly?=
 =?us-ascii?Q?U2PJTaIb6Jhpu81RuWcKPQBsuPaEz6XFCcImPx+08GK/0yjTNq9OuPC+ATyY?=
 =?us-ascii?Q?LctShz5QcByGUtw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iF9yuXQgD9jJB9EUdsCz8Wxx+8YkAWPQsUHChc/Q1DQC0ViHoy+wag4eZXbL?=
 =?us-ascii?Q?t5tr5jvBOP16cil/j90NQoVsiPO4IEmvMfonpubVOz2ZLSzogxaqqGK6HgCB?=
 =?us-ascii?Q?lrlRvJ/JcvLHt/vKEvnXoD5dTiHtzFBwKt3hMofx0c5rod6q1ll8yvhBeC8D?=
 =?us-ascii?Q?K6BTP1qrx5tD9kcnSvP+EDYygQYmhxOzaXQfIpbku07NcXOEssAg84RTZUn0?=
 =?us-ascii?Q?7kTPkM7n7sUwd41mk6pfR1l02InyATZVzdjpRtNwdaqjthAOALs7XF1hIGlA?=
 =?us-ascii?Q?gCA9lql9rLET8Lodnou+UZ97lmerVnHqmfpfCOMcv+5bRDR6dKQ0pwuEuxCM?=
 =?us-ascii?Q?0s+OOXI0u1GX9eRmUG5+1f3QosOEiqmwOXha2WdRrdCNnrn+vLaUNa5OPEiO?=
 =?us-ascii?Q?HX7OrOWw3eDcwtVtGygblExk2+UPBl9bxA8H+ZZ2TcuPybRTPdgR3S3/cS1P?=
 =?us-ascii?Q?p+l9BR88gyknLt/wm/0nR0VNA2PniymGsO+JHlNNJ2aWZWCe+v4irGcL9AUO?=
 =?us-ascii?Q?kyocgupjA1gfGDFN2qgllUCwjR88Waw02nTKRK5jITp8dNL2bfCJuaRM4uo0?=
 =?us-ascii?Q?2SMnm3VOs0jR1cOPsDSFv1DAFyfSTFCqGF+0GdxpuenckSVt9WE0pMlyB+Oz?=
 =?us-ascii?Q?adAUSz8oLCjg3WfvcVjbYY5LI5aOucfns6ng2/dktkkjjNw/4kxdox/iLfHU?=
 =?us-ascii?Q?EBHGzpS5UJ2eVG3BgMNhsdEb04aIw01hRqbxKsR0gcafvKXF3WxoENDAt7Li?=
 =?us-ascii?Q?js02hC8s2W80Ohb0nCUKskdIeFqqou7wD5pw1Lto7uh0WmOWML2re91k6mMI?=
 =?us-ascii?Q?EqyQGjO+ZTzXayrHi7hyRc+xg/t+qdt87cnsbakUsBzQURjPqOXqQcE+o6Ky?=
 =?us-ascii?Q?VmuRSHegYVIKkwwqRPkZP3X5DQGfVsubyBzN61yl+cnQXhsrpPliXbv20Xvc?=
 =?us-ascii?Q?JJSKvhplTKiRG8wsx4zuKpcc5ywP29h9AO/FpAo7pv0QSElA9GLKs+/41K8K?=
 =?us-ascii?Q?zqRa0BfhS89Ugtx/+ycCswljSLKOhKDQN3j6d7q3x72AlLoDayl/33avETRA?=
 =?us-ascii?Q?9EdDr2fFSPvyjEvUK17+FJa6mdRzsE4QB+5Qt2OpXvFHcY8zJjnVHpPl377J?=
 =?us-ascii?Q?k2yZG/YGTIfotLkeyc7fBeioJz/FrB35PkagQ2rmmc+iIzr6Aa9rlt5pjgav?=
 =?us-ascii?Q?ZaFYBnYpuP/baGHYYpQOcQMnfqHSzi5xFWadM4Kn3aPtIanQgGEbXhIENyiP?=
 =?us-ascii?Q?21Lu43eCcYugJ4W0dGYFMLhfBLJF7sQ6NT6lYr0xvdYlmK+3hfkiHtcrfsI+?=
 =?us-ascii?Q?jTeZnsHI95UEA1IyNV/4Cis92b2IJhzZF3MICC6dNQ3/PlUhOKxpmRlgyOo+?=
 =?us-ascii?Q?KEyDkcmAWfSFqhKkBIq6gpaOYnMLiIQGjaJPzRKyAyLxps5xhIZQym0OTKiZ?=
 =?us-ascii?Q?XAs6VsLahThgkD1In5DL8RIcI9s/U5SDgWfWXecoLzSTZh9bvwLDlSzeh2Jh?=
 =?us-ascii?Q?bI4VSQ8RxlhcnP3RdBSjHFmlFBRGQ2XPHEeduaUATN9kSEuYF65wGu7lPA4c?=
 =?us-ascii?Q?aOsJeObAc2go1ciMZmzZvBrGnUjp1dMnCuWhfPwCw5oNJIhtYZfjvQsygady?=
 =?us-ascii?Q?2Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 791bc5e0-c781-4777-3c2d-08ddbf1951fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 18:49:22.6918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hTUWsQ09tMX8Ax+BaHnCYdDQqL6UzdP7GobyePS5eJUR68H96mHJH8c9q99itEP8RKpoBekvMxx0J5pHFWx/myCWsLmQN4ypXu/nIc1fr5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8131
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

Hi Alex,

> -----Original Message-----
> From: Alex Hung <alex.hung@amd.com>
> Sent: Tuesday, June 17, 2025 9:47 AM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: wayland-devel@lists.freedesktop.org; harry.wentland@amd.com;
> alex.hung@amd.com; leo.liu@amd.com; ville.syrjala@linux.intel.com;
> pekka.paalanen@collabora.com; contact@emersion.fr; mwen@igalia.com;
> jadahl@redhat.com; sebastian.wick@redhat.com;
> shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> victoria@system76.com; daniel@ffwll.ch; Shankar, Uma
> <uma.shankar@intel.com>; quic_naseer@quicinc.com;
> quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com; marcan@marcan.st;
> Liviu.Dudau@arm.com; sashamcintosh@google.com; Borah, Chaitanya
> Kumar <chaitanya.kumar.borah@intel.com>; louis.chauvet@bootlin.com;
> arthurgrillo@riseup.net
> Subject: [PATCH V10 33/46] drm: Add Enhanced LUT precision structure
>=20
> From: Uma Shankar <uma.shankar@intel.com>
>=20
> Existing LUT precision structure drm_color_lut has only 16 bit precision.=
 This
> is not enough for upcoming enhanced hardwares and advance usecases like
> HDR processing. Hence added a new structure with 32 bit precision values.
>=20
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
> V10:
>  - Include drm_color_lut_32 from Intel to support 32BIT RGB in 1D & 3D
>    LUTs (Uma Shankar)
>=20
>  drivers/gpu/drm/drm_color_mgmt.c | 43
> ++++++++++++++++++++++++++++++++
>  include/drm/drm_color_mgmt.h     | 13 ++++++++++
>  include/uapi/drm/drm_mode.h      | 11 ++++++++
>  3 files changed, 67 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c
> b/drivers/gpu/drm/drm_color_mgmt.c
> index 3969dc548cff..83dc850d3b54 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -630,3 +630,46 @@ int drm_color_lut_check(const struct
> drm_property_blob *lut, u32 tests)
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_color_lut_check);
> +
> +/**
> + * drm_color_lut_32_check - check validity of extended lookup table
> + * @lut: property blob containing extended LUT to check
> + * @tests: bitmask of tests to run
> + *
> + * Helper to check whether a userspace-provided extended lookup table
> +is valid and
> + * satisfies hardware requirements.  Drivers pass a bitmask indicating
> +which of
> + * the tests in &drm_color_lut_tests should be performed.
> + *
> + * Returns 0 on success, -EINVAL on failure.
> + */
> +int drm_color_lut_32_check(const struct drm_property_blob *lut, u32
> +tests) {
> +	const struct drm_color_lut_32 *entry;
> +	int i;
> +
> +	if (!lut || !tests)
> +		return 0;
> +
> +	entry =3D lut->data;
> +	for (i =3D 0; i < drm_color_lut_32_size(lut); i++) {
> +		if (tests & DRM_COLOR_LUT_EQUAL_CHANNELS) {
> +			if (entry[i].red !=3D entry[i].blue ||
> +			    entry[i].red !=3D entry[i].green) {
> +				DRM_DEBUG_KMS("All LUT entries must have
> equal r/g/b\n");
> +				return -EINVAL;
> +			}
> +		}
> +
> +		if (i > 0 && tests & DRM_COLOR_LUT_NON_DECREASING) {
> +			if (entry[i].red < entry[i - 1].red ||
> +			    entry[i].green < entry[i - 1].green ||
> +			    entry[i].blue < entry[i - 1].blue) {
> +				DRM_DEBUG_KMS("LUT entries must never
> decrease.\n");
> +				return -EINVAL;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_color_lut_32_check);
> diff --git a/include/drm/drm_color_mgmt.h
> b/include/drm/drm_color_mgmt.h index ed81741036d7..882253a82bf1
> 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -72,6 +72,18 @@ static inline int drm_color_lut_size(const struct
> drm_property_blob *blob)
>  	return blob->length / sizeof(struct drm_color_lut);  }
>=20
> +/**
> + * drm_color_lut_32_size - calculate the number of entries in the
> +extended LUT
> + * @blob: blob containing the LUT
> + *
> + * Returns:
> + * The number of entries in the color LUT stored in @blob.
> + */
> +static inline int drm_color_lut_32_size(const struct drm_property_blob
> +*blob) {
> +	return blob->length / sizeof(struct drm_color_lut_32); }
> +
>  enum drm_color_encoding {
>  	DRM_COLOR_YCBCR_BT601,
>  	DRM_COLOR_YCBCR_BT709,
> @@ -118,4 +130,5 @@ enum drm_color_lut_tests {  };
>=20
>  int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests);
> +int drm_color_lut_32_check(const struct drm_property_blob *lut, u32
> +tests);
>  #endif
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 651bdf48b766..21bd96f437e0 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -872,6 +872,16 @@ struct drm_color_lut {
>  	__u16 reserved;
>  };
>=20
> +struct drm_color_lut_32 {
> +	/*
> +	 * Similar to drm_color_lut but for high precision LUTs
> +	 */
> +	__u32 red;
> +	__u32 green;
> +	__u32 blue;
> +	__u32 reserved;
> +};
> +

Since currently there is no way for the kernel to communicate the precision=
 of HW to user-space, I am guessing that we assume the precision of the LUT=
 as U0.32
and driver is responsible for converting it to whatever the precision the H=
W needs.

In that case, do we also need a function to extract that similar to drm_col=
or_lut_extract(). Something on the line of [1].

[1] https://lore.kernel.org/intel-gfx/20250702091936.3004854-7-uma.shankar@=
intel.com/

Regards

Chaitanya

>  /**
>   * enum drm_colorop_type - Type of color operation
>   *
> @@ -879,6 +889,7 @@ struct drm_color_lut {
>   * and defines a different set of properties. This enum defines all type=
s and
>   * gives a high-level description.
>   */
> +
>  enum drm_colorop_type {
>  	/**
>  	 * @DRM_COLOROP_1D_CURVE:
> --
> 2.43.0

