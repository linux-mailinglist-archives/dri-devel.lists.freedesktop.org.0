Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77441BFF561
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 08:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A75910E88D;
	Thu, 23 Oct 2025 06:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2iWk2g4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C2110E88C;
 Thu, 23 Oct 2025 06:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761200716; x=1792736716;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JsbFUGxPQcRtBozIzc5gv26kGwXGJOO4Jvz928iLbvA=;
 b=c2iWk2g494/zC43DW1c7Xh+EztvTT42G4xThBQCWJIkTelTxU5/EDm5r
 YpyjY0cXZyBDMvFxArrU0Rf52dpcU8AArqFexdoykuOhmPJkUh+jrHpPH
 8CZXvQClvVy775mfJX9gVcFqHylIdIwGOi/06n6lhjEeG3zqFtBYY12AP
 Qz+arALSJ/yf0pz0dD8xKGfWsEFzE3JQrSGWc1sJdlW+iJT9AMbKaNnCF
 me1QIickzLPgMNV/S+Ik79i1wsneNk6ir0p5ZNzuwjIS6Yv0HPAIcsukG
 duKGz6A8LzFj9sKyGGAmZHSg9dLu94wN/jcBhGzO3TvLbkvHzGMKdcx/Q g==;
X-CSE-ConnectionGUID: tCNy0+PSSymLEVEhqT+jOg==
X-CSE-MsgGUID: ldb78P7FQPqAcgvmAbH7Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63253202"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63253202"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:25:15 -0700
X-CSE-ConnectionGUID: HPeMk0lLRyqCfkq/sojEvA==
X-CSE-MsgGUID: AhnEu1E1RoWEON8ggsTmXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="214724402"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:25:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:25:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 23:25:14 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.10)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:25:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=golt76FmdCZhV3Mhz/HQ9lCAMdYukgFaMdAHj2udUqabqQJnER/bravzVPynHemjUPuzFsLNfI5obETBGoDrpoyP4/YobNfefRfixc4OnNccI3V/zkIl9atA9lwB4zTI3bC/cOHiEIBrz57xLZs8M9qwgWhAFDbUSvaqepTGR3we6E86tUPb1sHBvIZgy7OfPpEWLTN0Sky9PIwopLBTcqxEXw2fIIXmzU0D/vuMN3QFoRTzD9v1dwM9+t8rJEb+aw4ZGivOg1a5/lc/vOwN+cvWQP+L0oLFwyR+nmC4FIwNp+NfQeRaH3JMzf48kWQDb7ELWeC9E0jJrq7rgd3njg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcagP+dv3H9qg3tFrRaJ1I65jLZ7boTr8FXhMUtoc1M=;
 b=czcyhVCCM9dMmOfR1sq7ePKdeTAUxj9Q4px4WOM+9vbJM6Y6WdOlZVquehGj62oo9Bkk2lfQ+gyELnDa0iN+1ysbMzYTrcI9n8hZN2KjyJ1qeKgWFIVCleIiNIRICtuSvG092WRpBlru7neHX7trA0z8Ea/TSsYqQs0deXK62Is2Z/vaqhGpQccyLUyYXAMi7mv3WOK0+Vm8ObAAQmfoCyN7pluE3pQ7BVoFchTvVqo+ye8vsPIpmUVcjrVcv9a6jh6+MZTABQFz/bLJrC+2EsrJ7oGin0WHmkUXHK67vVVCUPqLoV/zzQqfh3YiW2F6BELD6hd08KF+XS81LdxQNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MN2PR11MB4709.namprd11.prod.outlook.com
 (2603:10b6:208:267::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Thu, 23 Oct
 2025 06:25:12 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 06:25:12 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [v5 19/24] drm/i915: Add register definitions for Plane Post CSC
Thread-Topic: [v5 19/24] drm/i915: Add register definitions for Plane Post CSC
Thread-Index: AQHb6zD869h5HelacUSU3uBcqlvu7bTP9Q1w
Date: Thu, 23 Oct 2025 06:25:12 +0000
Message-ID: <DM3PPF208195D8DC1BCA61B9F91F9DD40E5E3F0A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-20-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-20-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MN2PR11MB4709:EE_
x-ms-office365-filtering-correlation-id: 8792f7df-c46c-4c84-8632-08de11fcec2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2Ih1folUNZiv/itA1mP/9AdUsvIYZ1bLFhuxG21ArQwvEdn+9IqUb/4/s1Rr?=
 =?us-ascii?Q?zvoHkDwIFhfThpAQX9qLCv/DXSN/ZOP4AEHqRGMjbnGMB5nWP1dpFLVwfJRE?=
 =?us-ascii?Q?6uVcatxnRM68/aV18EBNxV2VNBvxESH706qo/glNAaarUhUpM0SJxHSehmfA?=
 =?us-ascii?Q?oLnDYDADhEOPF0DLvgZFifWbNlFKxxU29w3EbLeA1lyWXMBCMXftMydjpeR6?=
 =?us-ascii?Q?P8C7iB8kgUNE5xeHZqrxdOSQ0lIBkxqm3RbR5UDmZ+DsYYCp90szrALVl3Wq?=
 =?us-ascii?Q?WgM53CZ3fCNwScfS1fmgQblHHfqM67Y6MBLDuIYvydiJn/1sePXjxPNDDTGz?=
 =?us-ascii?Q?CCvODZfGM2VLO0gK68DjVYGCsS0e23IQsVBLvfK8i/YvFxuBOBcS314C80TJ?=
 =?us-ascii?Q?oCV0C6DxXTIAl5FDyyLQL/hpfeYj9ovQWkng+6+pLAtbl3wLBNcEyNqbchv/?=
 =?us-ascii?Q?+6Pe7i+G/J66s3VqguFrerZH6zAbDh01TLNN40LLLQtblkR/Bi1eK3Cgfihp?=
 =?us-ascii?Q?R82cvq811EqEwV4d8y3czHmzS1DIdkOr/mWqRoXacO89sO0M3O7Am7psCG5T?=
 =?us-ascii?Q?tFd0FRiHCpdgwHhs9/pKyCmGxxkC7deMUb3a3bP11EJbEnK/dLtjAneib3cU?=
 =?us-ascii?Q?GfB921LX1oR7dmLrFCT0+ifH+V5yi/uDjdfPwmt+N+Dan5WCQqIYuh8+W5NS?=
 =?us-ascii?Q?B9P4zeACo6Mcw5vKCf1vEL9ddDvk+4+EWICfTKJg4X5IGcpj/YDmxiGtqzKI?=
 =?us-ascii?Q?4Ve3xtnq6jjAdWr+1KE4keAZo2BCFIyCMu5opfm8weor7NlXYrIPVvjLuwwE?=
 =?us-ascii?Q?RmJNcuQzMEQmocSt9Xrlhip3Q8Tj8KLrQWekOYBJkvnAoeaDYmfqOMuzMPn0?=
 =?us-ascii?Q?LkfDsj0KltBLlU7YhQbskMvgjmN336fUpbvxoC1Iu6GgPOy4lsd3OH+oLl5X?=
 =?us-ascii?Q?qyxX8j41JWV843nlFjkJqaXqpTKNhv0IS3I5qBqbwSsdAkkykuTed4/eNnou?=
 =?us-ascii?Q?0OQs9ChNHNLm+0xngLNMu7OYT5eo/Gi3AyPRT5Zt4pBCh990MXrsFVeJQ4Gl?=
 =?us-ascii?Q?McoVt6MCUJRTudSOGRZSgcyDyJTGDSHBqUg/eCFFWJKD0gm/OKTirUHv7ZTJ?=
 =?us-ascii?Q?oUiT5Vo8m6ejuaclthTgq3JFZ7WNLHnOMI2LxcK9McBlq2sP7O2dnWxz4+zS?=
 =?us-ascii?Q?yRZiekdVXcdUUpKjpY3f+OW88c/Z/SrFh/cP3exhiDAhIr54TcaccJAEmeRz?=
 =?us-ascii?Q?ntwWWezrJfQ6EqV6hCi79cmn9oVbSBQdKaBJNey17Vc2IR4kKiqY/rSZWXL1?=
 =?us-ascii?Q?wnvcV3NZuV7CbgKsOS8ocNY7f2hKpQjXRqU3M40lJlyfpy3JFci3qNKj+opX?=
 =?us-ascii?Q?D2Q+Ar3MueJ1s/bG1L+c4q0yIavk7oPsjhLNSV7EmODphtHyEQwfAE/eJHGt?=
 =?us-ascii?Q?NcQuFiNQ9ag7PfqJfGu2xuqf/NlSvV3pTqU0RFrcc6XexhRmSjbG0N4gFNrz?=
 =?us-ascii?Q?r48M15zSH788PlWAwq2sN7DcWp8HjdphGSTN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/7ifMwITS/daG7zJeOnHU8fRhqRKmCp0hxHlSRTcPScOUhg4hHcPeUkk44vx?=
 =?us-ascii?Q?4DNHsa/tT5sW8B06nC49YY5xWLIO5Pp+ATvafPYYR4i0Rx3D/v8iBm3USkFR?=
 =?us-ascii?Q?zp8gatOl4ZQ96g1NWNwLFDNKX6bjUTQxfsJ009NIlEOR1clnOEvmjrlBm4ip?=
 =?us-ascii?Q?kZDOG4y/uO60SF6rEy/VHxI0mzGrITrjChoLi8TJm9/vN7reuzFc567+rcFS?=
 =?us-ascii?Q?5NVEEnLUsF8S5FPnMvXDxR7lBUzK4ijWjAjRlrIe1SVFcoYh31qEPqNBYx+2?=
 =?us-ascii?Q?w18vTdgDz4n1fv9E7EKKPAbJq84v4Nwr4HpHQF5EvFqacz/rTQqMD85Mlreh?=
 =?us-ascii?Q?/onQtnnikqNHSiIKDV4tON8GdnkexWeCmk/edEoKO+EkL6QNNS7GEwulTrsB?=
 =?us-ascii?Q?EIA32fyp9l/dWLj6ZQleQ6u2HoOF1Q29GZIwxZzsNFxd/ZzbrzurasDdZ7DM?=
 =?us-ascii?Q?JMxJbEmXyAQNv3r22ElIvi2PiAzU3X9TLFdsJAw5QwYdv/dtfqU5glFUNwQv?=
 =?us-ascii?Q?NpX8vGyMKIy5mO9mKymLw2GOZafk7NB/WGCddw0Bgm260ks67bicbpsJWabt?=
 =?us-ascii?Q?LHuBLJM6iFZkae+bejkDy423z0FgDCOFUgSLTMZ1/i/gv/Nk0/6KnHKLJa8J?=
 =?us-ascii?Q?ppePPE+QIVupN6fGXm29GQePUS1hrYGh/Syc0ujNbqAQ5CLnuMgHar24ZkcM?=
 =?us-ascii?Q?X/5EIZXQ8FXMi/WvNEqDrYchYUXfPOwwzYLbuzAV/du9Dg+MkDzifoBNxU0T?=
 =?us-ascii?Q?hJw5IrzHcByyqBzPY2buI6rJcRaHcfwJ4YEr0cbN/y3xpo4pCHIW8qTXOD3u?=
 =?us-ascii?Q?hI66K24xyJJASbvhIcG+6qnPOEd0Ubm7fO2fnySIEdmNPtmF86OcU3gUjM0y?=
 =?us-ascii?Q?mnuddSMNoA/v6G2NWvoWUfFg0dT4wQd01GZqgZyQc+IIR/8HkKXJ9HI58KeH?=
 =?us-ascii?Q?5vxNyDJfSMf/L9GQGoPR3HHpTVXNqm/QhqRJdmyT826zFGW8Lve7QDYCAxQH?=
 =?us-ascii?Q?Z61Fyos1kLWwXj2gaSWOPOSVq4GeMJterE0wPFjSKfK6AOo1atLxGTHewbO3?=
 =?us-ascii?Q?lR+5Dcofhwx8z7iUPnw4OGju+Zb+4qsDqWtC0/q6zLBeUH/35u40iVZ5hVS0?=
 =?us-ascii?Q?+vafvRkeEFYpJKXGP+PQskfAY1TipYVGng3VPt7S8DKqaANPXTHR/vMCws88?=
 =?us-ascii?Q?6IXYI14f8/UUCCwAA9Us0+xJgHAEsZYbcW5OKVQo0HxsGRj8lBj5DNR9RlT2?=
 =?us-ascii?Q?AI7//ayXvWsJeVqw0aj6UM6h/yq6K9rUir/twezNxKC6Dn9oqKQ4gVpDNeWt?=
 =?us-ascii?Q?BE5lrqQdL2G5gZlNt3efr++0EJYaXjnETAZJYYhNQxmpoivmyVVoahxvJtkG?=
 =?us-ascii?Q?Zh+uA82a+4Lxm/T1jyonzDyi8oto1XPx7gn3khlHtm7nvj1Wk8OlYwEAK8TS?=
 =?us-ascii?Q?m/8sXd4Lp8xKtIWsMoKvIaWY4/0p0yuBZ3xYFvJQcGz7yAMKUureaRO2Ynus?=
 =?us-ascii?Q?YE99ZqmQagFzRAIwqb3y2Qia0bNz8bwb8b2TccNVMr/fUwaguQgkQaQLfoVn?=
 =?us-ascii?Q?JmV3VrdtRIWvkvZDJbcY2Qyk8dqM3v9TYhYA4deK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8792f7df-c46c-4c84-8632-08de11fcec2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 06:25:12.4435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C/4vp6DU3SVb0rqlz0JRumyIZwi+9937lqVDTcc3ri0SLMfilYtUcBqscVx4Ex59w8s2x2ts6IefedNJdGruvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
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

> Subject: [v5 19/24] drm/i915: Add register definitions for Plane Post CSC
>=20
> Add macros to define Plane Post CSC registers
>=20
> v2: Add Plane Post CSC Gamma Multi Segment Enable bit
>=20

Add Bspec link here=20

Regards,
Suraj Kandpal

> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  .../i915/display/skl_universal_plane_regs.h   | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> index 2cad4ee9fe04..cb31b4ce0d5c 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> @@ -254,6 +254,7 @@
>  #define   PLANE_COLOR_PIPE_CSC_ENABLE			REG_BIT(23)
> /* Pre-ICL */
>  #define   PLANE_COLOR_PLANE_CSC_ENABLE			REG_BIT(21)
> /* ICL+ */
>  #define   PLANE_COLOR_INPUT_CSC_ENABLE			REG_BIT(20)
> /* ICL+ */
> +#define   PLANE_COLOR_POST_CSC_GAMMA_MULTSEG_ENABLE
> 	REG_BIT(15) /* TGL+ */
>  #define   PLANE_COLOR_PRE_CSC_GAMMA_ENABLE		REG_BIT(14)
>  #define   PLANE_COLOR_CSC_MODE_MASK
> 	REG_GENMASK(19, 17)
>  #define   PLANE_COLOR_CSC_MODE_BYPASS
> 	REG_FIELD_PREP(PLANE_COLOR_CSC_MODE_MASK, 0)
> @@ -293,6 +294,79 @@
>=20
>  #define _MMIO_PLANE_GAMC(plane, i, a, b)  _MMIO(_PIPE(plane, a, b) + (i)=
 *
> 4)
>=20
> +/* Display13 Plane Gamma Reg */
> +#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A        0x70160
> +#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B        0x71160
> +#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A        0x70260
> +#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B        0x71260
> +#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe)    _PIPE(pipe,
> _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A, \
> +
> _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B)
> +#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe)    _PIPE(pipe,
> _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A, \
> +
> _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B)
> +#define PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, i)     \
> +               _MMIO_PLANE_GAMC(plane, i,
> _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe), \
> +               _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe))
> +
> +#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A 0x70164 #define
> +_PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B 0x71164 #define
> +_PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A 0x70264 #define
> +_PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B 0x71264
> +#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe)     _PIPE(pipe,
> _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A, \
> +
> _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B)
> +#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe)     _PIPE(pipe,
> _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A, \
> +
> _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B)
> +#define PLANE_POST_CSC_GAMC_SEG0_DATA_ENH(pipe, plane, i)      \
> +               _MMIO_PLANE_GAMC(plane, i,
> _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe), \
> +               _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe))
> +
> +#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1_A     0x701d8
> +#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1_B     0x711d8
> +#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2_A     0x702d8
> +#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2_B     0x712d8
> +#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe) _PIPE(pipe,
> _PLANE_POST_CSC_GAMC_INDEX_ENH_1_A, \
> +
> +_PLANE_POST_CSC_GAMC_INDEX_ENH_1_B)
> +#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe) _PIPE(pipe,
> _PLANE_POST_CSC_GAMC_INDEX_ENH_2_A, \
> +
> +_PLANE_POST_CSC_GAMC_INDEX_ENH_2_B)
> +#define PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, i)  \
> +               _MMIO_PLANE_GAMC(plane, i,
> _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe), \
> +               _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe))
> +
> +#define _PLANE_POST_CSC_GAMC_DATA_ENH_1_A      0x701dc
> +#define _PLANE_POST_CSC_GAMC_DATA_ENH_1_B      0x711dc
> +#define _PLANE_POST_CSC_GAMC_DATA_ENH_2_A      0x702dc
> +#define _PLANE_POST_CSC_GAMC_DATA_ENH_2_B      0x712dc
> +#define _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe)  _PIPE(pipe,
> _PLANE_POST_CSC_GAMC_DATA_ENH_1_A, \
> +
> +_PLANE_POST_CSC_GAMC_DATA_ENH_1_B)
> +#define _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe)  _PIPE(pipe,
> _PLANE_POST_CSC_GAMC_DATA_ENH_2_A, \
> +                                               _PLANE_POST_CSC_GAMC_DATA=
_ENH_2_B)
> +#define PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, i)   \
> +               _MMIO_PLANE_GAMC(plane, i,
> _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe), \
> +               _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe))
> +
> +#define _PLANE_POST_CSC_GAMC_INDEX_1_A 0x704d8 #define
> +_PLANE_POST_CSC_GAMC_INDEX_1_B 0x714d8 #define
> +_PLANE_POST_CSC_GAMC_INDEX_2_A 0x705d8 #define
> +_PLANE_POST_CSC_GAMC_INDEX_2_B 0x715d8
> +#define _PLANE_POST_CSC_GAMC_INDEX_1(pipe)     _PIPE(pipe,
> _PLANE_POST_CSC_GAMC_INDEX_1_A, \
> +                                               _PLANE_POST_CSC_GAMC_INDE=
X_1_B)
> +#define _PLANE_POST_CSC_GAMC_INDEX_2(pipe)     _PIPE(pipe,
> _PLANE_POST_CSC_GAMC_INDEX_2_A, \
> +                                               _PLANE_POST_CSC_GAMC_INDE=
X_2_B)
> +#define PLANE_POST_CSC_GAMC_INDEX(pipe, plane, i)      \
> +               _MMIO_PLANE_GAMC(plane, i,
> _PLANE_POST_CSC_GAMC_INDEX_1(pipe), \
> +               _PLANE_POST_CSC_GAMC_INDEX_2(pipe))
> +
> +#define _PLANE_POST_CSC_GAMC_DATA_1_A  0x704dc #define
> +_PLANE_POST_CSC_GAMC_DATA_1_B  0x714dc #define
> +_PLANE_POST_CSC_GAMC_DATA_2_A  0x705dc #define
> +_PLANE_POST_CSC_GAMC_DATA_2_B  0x715dc
> +#define _PLANE_POST_CSC_GAMC_DATA_1(pipe)      _PIPE(pipe,
> _PLANE_POST_CSC_GAMC_DATA_1_A, \
> +                                               _PLANE_POST_CSC_GAMC_DATA=
_1_B)
> +#define _PLANE_POST_CSC_GAMC_DATA_2(pipe)      _PIPE(pipe,
> _PLANE_POST_CSC_GAMC_DATA_2_A, \
> +                                               _PLANE_POST_CSC_GAMC_DATA=
_2_B)
> +#define PLANE_POST_CSC_GAMC_DATA(pipe, plane, i)       \
> +               _MMIO_PLANE_GAMC(plane, i,
> _PLANE_POST_CSC_GAMC_DATA_1(pipe), \
> +               _PLANE_POST_CSC_GAMC_DATA_2(pipe))
> +
>  /* Display13 Plane Degmma Reg */
>  #define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A      0x701d0
>  #define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B      0x711d0
> --
> 2.42.0

