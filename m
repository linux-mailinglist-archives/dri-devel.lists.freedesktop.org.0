Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C44C12EAE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 06:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601AC10E317;
	Tue, 28 Oct 2025 05:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ePlB0ys3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755E910E301;
 Tue, 28 Oct 2025 05:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761628455; x=1793164455;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qvYMw3vitE3Yt2Rw99datmPhnz54KWYla0X+2kYjhAY=;
 b=ePlB0ys3KxPXQbGF90AFy5u/dpIhGWEeQMXHSwk03mLJL1EPaQeX4InC
 rxlIVnOxm04XpXtDnmfJPmwnSxoVzcdSjIbcVuQIPAIHP7aEEqLYpt8uN
 9huAUcAhJ7CnzgHwArrbjm1YG5hpbJ9Rj9fImjuvhcAeHJ94P3H6vrQWS
 xo9ee1313hDRUGpYzBdzC/zpNIrJxOH7aWx0vVrXbTP3IAWewvlWIwFac
 FtbeqKhSpPawG8AoWYDnDSdj2lVx2NujeZN2pbf2UGHZQc59qSCFCM+au
 9bcqXHLXRvOq8r3/a2l4JLbJxQHX6h0XuKR+KmcdsZLSbSd3ZPwImCr7v Q==;
X-CSE-ConnectionGUID: Zbb0BnfMRBiC57rdw4jvdQ==
X-CSE-MsgGUID: lx2TYOnmR5e2+25r31WZEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62750461"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="62750461"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 22:14:08 -0700
X-CSE-ConnectionGUID: taqFy6feR32NGBA019WPCg==
X-CSE-MsgGUID: jKfENlYSTyCoCSRNhGTeGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="190444006"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 22:14:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 22:13:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 22:13:56 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 22:13:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkKGBLD8oWKVUQpTdoD6LWCUcet3LRlqVH1IKtz5LkwdsH1ULUoNcJ5BlUi/xGtj4huY4aLPOW3KJXz/UqnrD6ACriVka/LKpSR3JnYiQQPJ0/k8Qo+6+ukXUJrUKZnRDQeQphy/SzR5F9o2+r68xe/GKThpvJJkQFMfvgGPl7x7JdXPYFwexMS8vEMeZyEJatnd13VRdxNbsgZ9EWIx/jbG3A5fjZJiIt0EIzXq54p7J/gQRItb/AyfuEQqd+WDQ9yIksovnds5wePgPWgJNrh0PxLa/SO+NAuxtb5qitAI/c4dmFmEagOzW2YzAQ0JV+4QFd4clyonLjSG3eJPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P674ZFyr3lyNmm+azc6SFsmjpEU4D3MMSKabhqS1li0=;
 b=fYBxGCzfjcW28/xzB4budKtwyscv5RWKAGsJONPpzMz7k0nPT8w5gNKRZCd+ff8IlMLS1IaP3TAqHrH4PzWu8/A/rUCSxFGns6MBFgkKfh6KTXGqefRddPdHCfrRPu3TV1VtbCx4RT0r3+ZHE3L/nT8wbvOVeD8LcUmR+m3KCzfdIUgW68a4etIMhlYN3CJBAtYoop5SAArcsqdJyw0KzJ/Hx1fOhiYg/N1JVBf0LfN/4mMk7oL9FwfmMTOt5WAyKUsUNLekPiRvwo0nBnTSnZBgTYsI2N/sg0puRFyBzVZUjcbCXoHjKYIPUMRscGV9+MS7UReTqSqfpKdcm1rDzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ0PR11MB5166.namprd11.prod.outlook.com
 (2603:10b6:a03:2d8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 05:13:54 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 05:13:54 +0000
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
Subject: RE: [v5 11/24] drm/i915/color: Add and attach COLORPIPELINE plane
 property
Thread-Topic: [v5 11/24] drm/i915/color: Add and attach COLORPIPELINE plane
 property
Thread-Index: AQHb6zDziftNpqPVL0ejmaToJdsRLbTXu28w
Date: Tue, 28 Oct 2025 05:13:54 +0000
Message-ID: <DM3PPF208195D8DB02B13BC6F33E064A0E4E3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-12-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-12-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ0PR11MB5166:EE_
x-ms-office365-filtering-correlation-id: 983784d7-14a5-4bc6-72c3-08de15e0ca20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?TWBTCvAnMbfP01Ti2jILUfO9lhhDdOp5Eoo/6bA3uF9SPq65OcBTLbxLy6+m?=
 =?us-ascii?Q?nif82Hy3DmbPTiuz5+PMElLBwHjjn6HmYBGyJm0vq6K6M3HWjBSzy0sMc7q3?=
 =?us-ascii?Q?IPcOFpkjW8oZk7hqhsxGAFjqfiFoXVdRp0hCtelCeqd/xYgOMLJQAo5sXI4E?=
 =?us-ascii?Q?Q8u5V+n9wC5IAyJvZK56vGcyy3SMCZwwJYQ0j28Tkekkhh3dCPiwe/mwHJU5?=
 =?us-ascii?Q?V5Deh9LWcGzM2Z1HRwocgcYYJEngiMLq7Y9vp/+A2+Kkt0mTjNBSK99oF8Yu?=
 =?us-ascii?Q?KFzwuV1uspe+E0bU7nvWxzNHbc7ExM3jv5H92mF5cuK1gtmyvqD1e2oIUSyq?=
 =?us-ascii?Q?DQG/O4rwtRXzvciql5MEVGzNLP1Hi+PQniyJuEeMJ62dkDSE2vcHVFRMwnYo?=
 =?us-ascii?Q?nT/LdTA+4zFzxvwi8Asg/e9md1+Goh83KZIzPS6Jgig6k4OE4FQSqL1VlY8c?=
 =?us-ascii?Q?VQcXskqhpbA7yklSPKm27tZrIORyVgSCrGLWWdvb2BDTFsg4sXTzLn6PBFEw?=
 =?us-ascii?Q?8oaH8olo59WFc6BV7vi3C/OcH6q/PYAgtTJ5t6FvoBfJO0D3Wsyuiy/7I0z1?=
 =?us-ascii?Q?jamoOec/7Qfspdf18O7nTy8YSOFXVz5vATJUUhniid7JvRZmkwWYQEVt/ccK?=
 =?us-ascii?Q?nEorHBg5Api5/B+FPd/S7+UM0QNQLj0Nd/W/fH3svNX9BykVRLIRUWxVH2UD?=
 =?us-ascii?Q?XGJrm/CHkaXmtxDrpgxrt1XeXU3nhjgr7KC5UEm0rsy0Yh6rXIpVX/9Acut4?=
 =?us-ascii?Q?AeUyfHs0bmJaxsWKpW2R+XNIaZ/o52MlgTd0yJhbXxgNlUk9o/FllIhjljcn?=
 =?us-ascii?Q?aEj+a31XnvMYaphg3VNLKoxRgpDd1rJ9jPH5r+4Vj09NZdFe3Rb/61T3Aq5E?=
 =?us-ascii?Q?2S2V2uqCu0A5VZzbNlyaVjlZrTwc7vAYejmgSGTntmIo2QGvGJHF7+M2yFt3?=
 =?us-ascii?Q?snPM9pUD8XOCjIJ2slFL/b05P6FBSC5ef8X8EcSm7+y+c15g6D28xknTnJoZ?=
 =?us-ascii?Q?81gT2ZlRNI1EjEgZ5EJspii1tti2zme5L7D3zf4XJ07YIOQz+8xj2d/TMpSS?=
 =?us-ascii?Q?UFTD3Wtev/xT9fzO/YR/i6gQcF3yVCZDV6DVWyoMTqO8D2r68qJAKkxqihBE?=
 =?us-ascii?Q?azIueiok87SoN4ey0EUp1NbxTPd7eu/ksAezcw4rN+fG0j6TW2KLR0TbZKR1?=
 =?us-ascii?Q?TddOoegDKGBRaBojG5O9YmeI3wLuyuDHJq0YRp/mNhBkZzb7T+0VBWYwJzAj?=
 =?us-ascii?Q?KZRJTEVp9ZqjTZAwVZ3I9WGJQH+qmDVnIU9UpFuu7qnl1ZITkjtfZb5XzI5S?=
 =?us-ascii?Q?6E1vkFSXoCqO4OB2CmFmZ6Wqfa09P6fLDpCwI+Yccrh7u+ud8CnjUbuiGmRF?=
 =?us-ascii?Q?PryfprgXEm+pE2+LJIaidUMJ1QGixM503G7DmzpkDX6olANo0T2kvXehBSj3?=
 =?us-ascii?Q?hU6bVr+0gwYgnvBGNd0GOZNrtqegAFcej6sPgOACRp1n/WROLe0VWxEJSw3S?=
 =?us-ascii?Q?CexV23xEziMvVppVVa/xjxW4eka1S2sQ7ZMz?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GMXbLT/b+/2w9mXFZuVoCFRwG8J8Z1464LKybjt/AjPguZTevYP2K8xJwjA3?=
 =?us-ascii?Q?ZkywPTfEOYo/eEB69ukUeEnGD/0GlLa1t969QJuZj4vK4u7nurMWq5XnyUtY?=
 =?us-ascii?Q?+Syisjo0pYWZX3hlZl1Bo854XNBUWqrsnh9RdaLpzrp8mCGLQW5m3DA+k+65?=
 =?us-ascii?Q?AU5gY0D1FwAGafDyoplLDAm1i8sVLPIfFdvzPHxlf/EKLIFVQrdyJmF6/Y56?=
 =?us-ascii?Q?yyjvpFsxN0pHvA0tBJY2lzU20LMW6K4ArAf3s9I9VlOn1OKSxL8Uhoi12T0A?=
 =?us-ascii?Q?ot+42oS3gE5O1w1p0L57rgGkjCcIVQyY6K6iwsQjafThkhrvtSpd5G+xAGb8?=
 =?us-ascii?Q?OTDbcNTEW28NxIBKTzanNUV52sxF1yQsD5+BhXlEFAMb8OiP/yIap2Q4QXVw?=
 =?us-ascii?Q?/uWWOKvbQzAe+AgVB7Wa5REj5tWE87ULZMuUNetiCRLnyFXzl59sgoWMh9vD?=
 =?us-ascii?Q?5WmIiwjX5nN5JrmZNzOI6ePPzNpeILIEcxe2hpbAfUi3wr5+/3FmPKLAykqz?=
 =?us-ascii?Q?ejoAYbZtIRxzBx+DFRDf9IkuHDaKWJeJ7bd1EHu9la96ed7PUWU71f/H/YdY?=
 =?us-ascii?Q?WdrX8wcDcwJWjeZ3Ksk6hsvMfHEEYzPs5HAQPgPKckyBqWPndl5emlJk+24Q?=
 =?us-ascii?Q?rAxSBC8DktdhcENSZ1rxYt20JJDDO/cEnmL4p+WSj6Q7DzPfgNUIqbxXPzt1?=
 =?us-ascii?Q?FqNauWAxGfmVn/ouUdP97OYbQImTsMpkxCa68VPr3iv6dqdfm8PMTYhLVBrY?=
 =?us-ascii?Q?+5y7N96anZVGa9/n9HdekC9gSO6v5LegSOngB5JVHrLNOt2kiYcr/bhDs6Hw?=
 =?us-ascii?Q?rr/N2R7FWJtnpHC6W72x2KPnemUTAHhdsN/fr3Jn+R6ctkawYczoPIA9Sh4v?=
 =?us-ascii?Q?CKx8Qh3AN4xIxh08STsMZqeJuMULT6aK+Ys0+e57Nt6wqsfR42m/4ZMDALar?=
 =?us-ascii?Q?I16x74I61wGxI1ifJHyHOTnlbwLfgcliFaWyDs1JsNvSEEE6cFgpOIDLWnpA?=
 =?us-ascii?Q?AiVJMw2pId/w1sCnw7T8PTQwiUaEIyHUjtPFOJtdF7h+IzgFNXt47Nc28RBk?=
 =?us-ascii?Q?+tFboOpCj5W+7vQGugsoeWns+LdkwYLURrfG4+h2IfuxqHnbn0jplXOMARpz?=
 =?us-ascii?Q?5npQJ3i5drBOe0TBdfnREmbbDqG42BVxd8oFAhL93pSERLtWaPpYVXMKxD5Z?=
 =?us-ascii?Q?oFnKpAdcu2TWIYLVXHNlakG+69hBt+90QodxK3/EDCkD+vb9JjJrmxhWZ0nE?=
 =?us-ascii?Q?5ZTb/OkvGqVRS1Sarpa4DQZK3VctJMLfEZQxtLJE4UKIPHpQplYBmTc3tvEp?=
 =?us-ascii?Q?m1ZjaGu7TYbdwfflTKoDodyFTkbj/ldRO7DeNsXu0mqV03gxMspHoH7OPB8+?=
 =?us-ascii?Q?0yHSDrAi2BzYp4QuUyh2ngOp86A6H/FFb1HwzG7NkqcI0I4L8f2+6LqDYqe/?=
 =?us-ascii?Q?LYcxrR00HMqR5VFrO7UBfnpm0mwlMB2piFUuCof+Mzingu73ILJQAUa6edfq?=
 =?us-ascii?Q?mb77USAjYM8syWM4td017BvbtGKSs8/GituF1cm08i6/bxNZ8/TWIX9a6B09?=
 =?us-ascii?Q?SmoRF5X00F23rjW7VsvLHpKBc9ezraYTdbJCc21s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983784d7-14a5-4bc6-72c3-08de15e0ca20
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 05:13:54.1086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jkdvRXxlbbnZG+9EyyYUGk9U6JU8e9n1nY+xEAiqmmvJNfYRSbmIKWG5B8MpKNXPAZ7q2yPoPhycyf805gk4XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5166
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

> Subject: [v5 11/24] drm/i915/color: Add and attach COLORPIPELINE plane
> property
>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add supported color pipelines and attach it to plane.
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 42 ++++++++++++++++++++++
> drivers/gpu/drm/i915/display/intel_color.h |  3 ++
>  2 files changed, 45 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index 90ac6530d1a5..363c9590c5c1 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -4050,6 +4050,48 @@ int intel_plane_tf_pipeline_init(struct drm_plane
> *plane, struct drm_prop_enum_l
>  	return 0;
>  }
>=20
> +int intel_plane_color_init(struct drm_plane *plane) {

Again need to rethink the name here

> +	struct drm_device *dev =3D plane->dev;
> +	struct intel_display *display =3D to_intel_display(dev);
> +	struct drm_property *prop;
> +	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
> +	int len =3D 0;
> +	int ret;
> +
> +	/* Currently expose pipeline only for HDR planes*/

Missed a blank space at the end

> +	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
> +		return 0;
> +
> +	/* Add "Bypass" (i.e. NULL) pipeline */
> +	pipelines[len].type =3D 0;
> +	pipelines[len].name =3D "Bypass";
> +	len++;
> +
> +	/* Add pipeline consisting of transfer functions */
> +	ret =3D intel_plane_tf_pipeline_init(plane, &pipelines[len]);
> +	if (ret)
> +		return ret;
> +	len++;
> +
> +	/* Create COLOR_PIPELINE property and attach */
> +	prop =3D drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
> +					"COLOR_PIPELINE",
> +					pipelines, len);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	plane->color_pipeline_property =3D prop;
> +
> +	drm_object_attach_property(&plane->base, prop, 0);
> +
> +	/* TODO check if needed */
> +	if (plane->state)
> +		plane->state->color_pipeline =3D NULL;
> +
> +	return 0;
> +}
> +
>  void intel_color_crtc_init(struct intel_crtc *crtc)  {
>  	struct intel_display *display =3D to_intel_display(crtc); diff --git
> a/drivers/gpu/drm/i915/display/intel_color.h
> b/drivers/gpu/drm/i915/display/intel_color.h
> index ce9db761c6e2..c2561b86bb26 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.h
> +++ b/drivers/gpu/drm/i915/display/intel_color.h
> @@ -18,6 +18,8 @@ struct drm_plane;
>  struct drm_prop_enum_list;
>  enum intel_color_block;
>=20
> +#define MAX_COLOR_PIPELINES 5

Here I see you will be initializing a max of 3 pipelines if I am not wrong =
the number should reflect that so maybe
3

Regards,
Suraj Kandpal

> +
>  void intel_color_init_hooks(struct intel_display *display);  int
> intel_color_init(struct intel_display *display);  void intel_color_crtc_i=
nit(struct
> intel_crtc *crtc); @@ -46,5 +48,6 @@ void intel_color_assert_luts(const s=
truct
> intel_crtc_state *crtc_state);  struct intel_plane_colorop
> *intel_colorop_alloc(void);  struct intel_plane_colorop
> *intel_plane_colorop_create(enum intel_color_block id);  int
> intel_plane_tf_pipeline_init(struct drm_plane *plane, struct
> drm_prop_enum_list *list);
> +int intel_plane_color_init(struct drm_plane *plane);
>=20
>  #endif /* __INTEL_COLOR_H__ */
> --
> 2.42.0

