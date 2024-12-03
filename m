Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A69E16C7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 10:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E93010E997;
	Tue,  3 Dec 2024 09:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVHjh2Mg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024A710E991;
 Tue,  3 Dec 2024 09:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733216990; x=1764752990;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yC/qWCEXkCrzaKvDcVlTcfojZ+I0zLLyuHK3GQZpUHs=;
 b=IVHjh2MgHnE9pBCui8JQsOyxyAzAiQ9guiOBifPrEoNemLrypatUYQZ8
 shqGEx6uCFGnTN26t5UrxeCqzNqpZgXteypQ6LHcz6U/WhwXnjzkr0F2H
 M1J5rymZ3uHg4osSL1Pv5iXMSxB5r755eb27n9fMz4bVWWxMl/ePJlPWK
 9NOSno50MoXObycopm3W/tQCwMTgsGJwbIlXqlM/lEWK1LgTtpDf0Kdyl
 TN2jDj3Hwlzhk4KXrAGhIB1z8SRiXBzxrTleFWZHzGIYN0J4+8jUQX7tE
 bq5ZWqz8/QJWVdG+MC3qG2DpJ2NjbFpC1XIxBwVy0j9gCqqDdF0GIjdx1 Q==;
X-CSE-ConnectionGUID: j4KfUsV7T42x/RRr8s8a0w==
X-CSE-MsgGUID: xGsYg2tFQk+gi0IIQ9gtqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33339443"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="33339443"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 01:09:49 -0800
X-CSE-ConnectionGUID: 2w7IAJjXQjSoytdmIZNhZw==
X-CSE-MsgGUID: eTKGzoB8Trm5tpM9d4DthQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="93570604"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 01:09:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 01:09:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 01:09:47 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 01:09:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfkFHH6JPQJMDd6JOEIrU7z74Y3eAOUzKIXBe5DcSxKq6Ra13OZYGKr9BN64ixXKdmJmJcsGBuMe5NLmlQT+f/dnljfcK9Gtk4Emh5USu8bZejeJ+xJe+Vg4Fogjc5qPinp8STUP0UBJ+nMz1KQo2jq7iT4+T+AgPe42NfZ8zzdXUPcSMuF/M3L1iUcOuNm8iMSRuTuDTES9hZhKeWwMg+2XMvstqsiBADLZjBOvqrYHKGWgq4wU4UhCQgO1NPzBmyC0aAAWOsFwK2S1zgyM/ZwtuPErtyRUj19w2Sc+jvPNQUV5c64eQLLHvGPL18TP9HA7LrLRl9SnCJt7dWzhMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuZ0lUf/uGJdOE8+xdBmzlwLyj2CAXY1+G8kjlfq6xk=;
 b=yT8NyTUzx6JeXRHDWtysVufiTcXaO79rzQLyLwf6dNVdeA56SiwLcZqRnOcL9XE79YpaPM3vYD++MftLtZkydr+yCeFpXgvN+MoMQMmZ4Pa0/8guhxi7G896BDg2sjW5cgIiif+MwK9ukZAHErfoQCTBjewwaur/2mVnf98KTDhUY6b/6NWmDWkRco5J2ybrPm/EB5K5qkBJLJJx2uDW+UZc6YVpjCcyNhV/Q09nhdDK+shlg/zLgMDTBrV65pwcj7O5SPSFqsftI4QrSkJOk8YqYdWrwuXI3nqtWg7KXH4fbtBG8HqXPyiRPfcdhB3H5KJsNEo4G59C8fRgfWv8Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 MW4PR11MB7126.namprd11.prod.outlook.com (2603:10b6:303:222::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 09:09:43 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 09:09:43 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "pekka.paalanen@haloniitty.fi" <pekka.paalanen@haloniitty.fi>,
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>, "jadahl@redhat.com"
 <jadahl@redhat.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>
Subject: RE: [v2 05/25] drm: Add Color ops capability property
Thread-Topic: [v2 05/25] drm: Add Color ops capability property
Thread-Index: AQHbQAXj6So2GHTSDEGRhGVEQBmrFLLPmIKAgASsJHA=
Date: Tue, 3 Dec 2024 09:09:43 +0000
Message-ID: <DM4PR11MB6360DBA8869357B70E9CF2D7F4362@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
 <20241126132730.1192571-6-uma.shankar@intel.com>
 <5jv337lffqqkebsy4ttn62peqnb5a7d4igqe5fvgrzi2kkzjfk@vub74vxn2nqk>
In-Reply-To: <5jv337lffqqkebsy4ttn62peqnb5a7d4igqe5fvgrzi2kkzjfk@vub74vxn2nqk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|MW4PR11MB7126:EE_
x-ms-office365-filtering-correlation-id: bb4c7888-de4a-4b88-38e4-08dd137a3a04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ZxDlJr189IiC3anj/kDApHHrcRSE2EIK59dtenOu9OlTg8kBvaU8L33xXXqY?=
 =?us-ascii?Q?/JUK3K5jRbwzkoBIgZn3hJQNlRA+5GFDNYS62UBQwgLpvnZyFlTSFl92Vi10?=
 =?us-ascii?Q?6jmA0caqWNC3iKXQbT/4RnWSlfMPF049zOd6AW+HbwZRL083g4Oegiis0kaw?=
 =?us-ascii?Q?noGEQicNIuqV4pFD+XlrGZkPeFNDrA5XohWGMbeDmUhdK3XEAwqucYL/+jP7?=
 =?us-ascii?Q?dCuDMefplziLvcMVRjPubyoKVfsEjjNXy6Sb+/KooJdWcfluhNT7rd0TEKa5?=
 =?us-ascii?Q?USOUBJZnxziGe3jk5w54J/qepy79POlYV+0oxCuzVziedXSS9XRXTQM3Ijqp?=
 =?us-ascii?Q?quQ5i2SpJ0JefsgS9rEbCzdme09Xcyym7xH3ftsOeyzRLTxgfRccLtR8mOic?=
 =?us-ascii?Q?jMkjWlMsf/4jWQ6clD0uVp8NwrJ6Eh6igcwa3AKAg/4x6lO18gp9YyQWTnag?=
 =?us-ascii?Q?HTD1qXnejGDxYKrC/qLPsvjrseLml0D0ykFUtS0byXjXfksVq77U+tvt3Db/?=
 =?us-ascii?Q?ZzLB608aLgpEWrpMA/CiD4+tOGHdPJlt3KR2S9I2PaaBqH9PK0/wuSBVz3JK?=
 =?us-ascii?Q?NkWAugmMeg7qKbb8mkBY8WGPKVdOPLw2/pXnDhsbRxdTVyEqOmfOIZGEtbSh?=
 =?us-ascii?Q?MI5kYChp0kx/bLD/aR9IUS8wIoDr22qywJXHwT3zp4gSosijfzCZ+jQGeUCv?=
 =?us-ascii?Q?XDO6OEOv+iYX2hGwcSXGH3W15Jg9saPXHMFXBjSGDqc4JjhjrQ/PefChliuy?=
 =?us-ascii?Q?wLwx/jPpedYq/Xa9OZI9lPH2jxVJBWtjLJRQoIkESMYmoEgZqdHxqPUXUIai?=
 =?us-ascii?Q?RwKGsRuZ4H8zTLmtF+goibqiTEmrPWEB3WFySCSuvn+LUO+VakdqVQ1vLtPH?=
 =?us-ascii?Q?ACgAzB0wG/Vnd1HDVbkh+nQiiG+5yF/MiMO86mV8nzYjjrbXOcmbxgVb8Jew?=
 =?us-ascii?Q?vNy8OocXALRwUlZ9YdvAIwsYtPRobM9CKYBRjJr97jpC3Y4eXNWpntudkJNq?=
 =?us-ascii?Q?vlUjvvEWrdNFTU1DRIvGURmZEos7T3JS3EOHzztKTaVPss0Fp2rjiZeePdY/?=
 =?us-ascii?Q?J8xq+qKnJTaJm/OP1wcOBWd5r7cVHgswmHREdrGkyfCLfq60tt2yloVGnJPJ?=
 =?us-ascii?Q?4UR/VzZvsdP9PHkoBrSPgQQzx8Rn41yNdj+WadddewUeWGTzKZJXV4vX/hdD?=
 =?us-ascii?Q?QQTpmJfInqVVqnL9R7fZXgR0BGrlM/aXRv2Lg+PmDdrkYtdhAg0ISXadS6IF?=
 =?us-ascii?Q?642uk2wxE3Apgi+c0+LUyBvywk1GQu558giQ9ghGeqTmHnPJdvX8ar2AAVU3?=
 =?us-ascii?Q?ZVr1/OAiKFG0UHQ0jF28n58BAJRaChulhvlkakq+IvivBpA4aTsqPAMelq9g?=
 =?us-ascii?Q?SKIjQb0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b6+mN0enBUmuAtHdGez+JNRsYKgifGnWUx8Yiv8+BWvJJauCaXG5o+Mhnt2+?=
 =?us-ascii?Q?Hqqur9gSkVu3bQVT6XGXpZ0Y2h/ZlfSs1i1OIX4DOKzD17c0gC9gieeq3w0W?=
 =?us-ascii?Q?kS507ABEbxciEaVKIXauoDSsgZzkuexKXV7lKoVhGhbY1dX4koTMMoHjqbZj?=
 =?us-ascii?Q?XYdM3ddu+m06HHTUERZWP2KhpV44JupDl1w/rBZ7tapaat62FsGGiDu+GhYQ?=
 =?us-ascii?Q?FHXl1WdxsAvQFiGbLvQkySsdjmch+usUAJtoJc0ldaDYoJkI4hKfqdS9byaH?=
 =?us-ascii?Q?DGCD7tS54uniSx+kpn1QcdDhjlQN6CWWQovBRrkOmV/dYEWJFGCjQEwb86O3?=
 =?us-ascii?Q?soB3rPAnbLrygP+Fp0t2ZHO98o0OfgUcSTRqLiR9sstX/HLi9+uadLtjWRIB?=
 =?us-ascii?Q?76si1InAwbBsgDZZ1FQyFeY3fU206yjrK0ZdAEoU4zpFaXEe/GbLUkqfiyfJ?=
 =?us-ascii?Q?Mn8SKxDBsJAVtYUm/QRsQiuV1ja826umdj0mT9EEQpQ2UdaNrlL9X/K83CwB?=
 =?us-ascii?Q?oTEWIWjzhVJWeKJZyx6FQhm+nDVrGhBKg3AbvGXVD63lWIhU9Zmk8ANHOoEQ?=
 =?us-ascii?Q?MTP9AyLvSigObDrJ9YLU715/G1iHH5WA1pyvQpBKdzV8P1VZ/ni5oGMsWUVi?=
 =?us-ascii?Q?rY2dL89pz3NwrM1shgdVJLyjqSGPd+vU9kF4ZWTbjEywPRjN9ITybJbMeJpi?=
 =?us-ascii?Q?FRkqyN++u4gwA97g8u8YSpdnDrb27FcfKQMxznd6xkn5LRGFUb7lM8WVfW59?=
 =?us-ascii?Q?ZuMENTaDBUxNn4IQD6bLG9H155setHnjkEyqNkKsAQ71JKdjr5wZpsPv6yVG?=
 =?us-ascii?Q?6N6Jq9ZLo1CSAWe9cUCORge53ASVD0byjaKUtLuVmaxUumgUOzq5jUTF67qo?=
 =?us-ascii?Q?Mo30ivO/k8zSjC9hDVbBUu96XA8f2fHw55p6AvoCzRe05oVEbwNULec+hGrc?=
 =?us-ascii?Q?+2yYDc4HBIg/PV0/Fj8k5CJRsS4+Nl0V9VfV4MG45J6N6JgEzX1KLsABXrtZ?=
 =?us-ascii?Q?JreLIZ1MyJKJDeIY9ZHP9z3KxuzRfX+mo//qsrEuUMVzEVg0aAaJpv7Re9k/?=
 =?us-ascii?Q?HKRieoXA916oNrQbqrsQtJNDdgu8Oo7/PRGPkII04iKaAxgxQLCVV7OlHK4u?=
 =?us-ascii?Q?jn4VpBg+RpQy1UR5oukn3BhA0HcMHz5bH7P9LMoo8dGDjdneb/dxjNiu1ed7?=
 =?us-ascii?Q?L9V52KRT0zpQglyxSraKewuaM68vaz0/km0Y3Pq0nbpdMdzLQ18hu3mLXvCs?=
 =?us-ascii?Q?ENE0gxW/jqtQa6NcKc2NXF47o1ZfLky47RicPwYDl8sadKV5ZYntop+pAryr?=
 =?us-ascii?Q?lTC3dwmkWjU/RV38hha7602uwFNgVBVYUrmW2Nt9cS83EgZjsqgyOQuYPuN/?=
 =?us-ascii?Q?iBU6oQvIVDopMT4oyho0DIqQIJP1wZu98PeAbXo+SCx6HW6JRji8p4EEs518?=
 =?us-ascii?Q?kMna8+O8ZMJxP4IrzRh1E/bxP8s5I5E8jPkgyAElwzFPaeJzoj0ZdOgMRQIX?=
 =?us-ascii?Q?/HBONebMqQlqTMAlm+XRUe8VGQ1W5+zAdotBkJEvu6YfDGqVhQLBRnbyKTuq?=
 =?us-ascii?Q?jFWdsWjiX6dzcY/uHYkxiRBTuohG+OhZnWwrRnQp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4c7888-de4a-4b88-38e4-08dd137a3a04
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 09:09:43.6491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pAy/047vcVeAOCy/mmitqtmvoUM6E/rLMf0nyF4sK8GajndU7ZhnJDkL2C0BCp/mLAuOJ7kTujcn0MYs31wCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7126
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
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Sent: Saturday, November 30, 2024 3:13 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org; ville.syrjala@linux.intel.com;
> harry.wentland@amd.com; pekka.paalanen@haloniitty.fi;
> sebastian.wick@redhat.com; jadahl@redhat.com; mwen@igalia.com;
> contact@emersion.fr; Kumar, Naveen1 <naveen1.kumar@intel.com>
> Subject: Re: [v2 05/25] drm: Add Color ops capability property
>=20
> On Tue, Nov 26, 2024 at 06:57:10PM +0530, Uma Shankar wrote:
> > Add capability property which a colorop can expose it's hardware's
> > abilities. It's a blob property that can be filled with respective
> > data structures depending on the colorop. The user space is expected
> > to read this property and program the colorop accordingly.
>=20
> If it's a blob, where is its contents documented? Also please point out t=
he non-IGT
> userspace implementation that uses the property.

We tried to describe it in the docs (last patch in the series:
https://patchwork.freedesktop.org/patch/626179/?series=3D129811&rev=3D2

Will add more details in the patch here as well to be clear.
Currently for userspace, plan is that weston will implement the color manag=
ement protocol and
related KMS changes. Pekka and Sebastian are driving the implementation in =
Weston.

Regards,
Uma Shankar

> >
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
> >  include/drm/drm_colorop.h         | 12 ++++++++++++
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> > b/drivers/gpu/drm/drm_atomic_uapi.c
> > index ba68358c0ffe..46cc7b0df6e8 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -780,6 +780,9 @@ drm_atomic_colorop_get_property(struct drm_colorop
> *colorop,
> >  		*val =3D state->size;
> >  	} else if (property =3D=3D colorop->data_property) {
> >  		*val =3D (state->data) ? state->data->base.id : 0;
> > +	} else if (property =3D=3D colorop->hw_caps_property) {
> > +		*val =3D state->hw_caps ?
> > +			state->hw_caps->base.id : 0;
> >  	} else {
> >  		return -EINVAL;
> >  	}
> > diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> > index 56b51fafebdf..58e5b87c6d56 100644
> > --- a/include/drm/drm_colorop.h
> > +++ b/include/drm/drm_colorop.h
> > @@ -146,6 +146,11 @@ struct drm_colorop_state {
> >  	 * Number of entries of the custom LUT. This should be read-only.
> >  	 */
> >  	uint32_t size;
> > +	/**
> > +	 * @hw_caps:
> > +	 *
> > +	 */
> > +	struct drm_property_blob *hw_caps;
> >
> >  	/**
> >  	 * @lut_3d_modes:
> > @@ -297,6 +302,13 @@ struct drm_colorop {
> >  	 */
> >  	struct drm_property *curve_1d_type_property;
> >
> > +	/**
> > +	 * @hwlut_caps_property:
> > +	 *
> > +	 * Property to expose hardware lut capbilities.
> > +	 */
> > +	struct drm_property *hw_caps_property;
> > +
> >  	/**
> >  	 * @multiplier_property:
> >  	 *
> > --
> > 2.42.0
> >
>=20
> --
> With best wishes
> Dmitry
