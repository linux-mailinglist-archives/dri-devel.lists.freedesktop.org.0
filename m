Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B366AE128A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 06:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AF310EAB2;
	Fri, 20 Jun 2025 04:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFRCBoAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76FA10EAAC;
 Fri, 20 Jun 2025 04:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750394332; x=1781930332;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KbUCF1OP6gilHvy8KC0kEq0oW9fHqTff2zhqLZZlAIU=;
 b=IFRCBoAtk/JpopRgH2EhdbtLRy8Y5B/kAlroVuUyspCywrAh2iOcg9fZ
 6VmEfOgILLHQMhG0kjpgEiPkEt1AlihrE7CJSddXHHnVJH6U+UpU57IFt
 qqgcJqfaR+4lXc9kYXyrcw8C7IYRBkVKsw+Fxm0PYj1yHmkitQ3QUubLS
 fYy606WQnZ7l1lM2BFmQuUeRdvGgzLvD+91Dc2Rg4fbUZCMMlKzpGLbDZ
 raOVaMRLPgjufvP3o7NweoZLo7B/hqj7d+4mAtgK2mh6wNZxfDnIHYqDt
 h1NpBqLrVsFiyVQriTfMX1micORukdao53hoURFEJ4bzzmmYrGgNdRtem w==;
X-CSE-ConnectionGUID: /6L73O2KQbOGFbTTeOEI+Q==
X-CSE-MsgGUID: ArgKDwzkToCzEYPVqlWEug==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52798271"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="52798271"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 21:38:52 -0700
X-CSE-ConnectionGUID: hnxEMUtjSAGekoqxoVOr9w==
X-CSE-MsgGUID: MpDVH5UJTrSmz1M6SURk/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="156311251"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 21:38:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 21:38:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 21:38:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.58)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 21:38:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFQIY2LVgHPQoQMuDqkMki7BXp3kHxrn9qfEYJoewtwBwjAf1DqHBPIP1siak98+2PJIDNnIIKwWAGoK76DvWviNsiVbvn2DTxnLxSzwY6cAcjhbsAquDSQplKJBlkja0M+mxa3dBH9vrZLrhy/wXHrbY2Ryg6KMLD3/SLwbXqNjiPIxCsb1CvnUK9DG3IYef12a7fYYHGhPfat1+GYKnesGnk3zHed0i/W+vJWp9WffmnXn395i8D0aHvLnfp2tru1kn+h2kIBJmZe2oM8zet37qAUqDwWWLMM5f/qOGNJitC7S1dQ2Lxe6hxXeCCtZYB1n4kZkvdsqjthGxgHoBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERNp10sno+BwR5Qd0u5ZPf5xH7+lsrtsFsMCsAy9UBU=;
 b=CaJiRBDQJlKYBMVpvXZJ8hJFzMOsRZYAhT7+T/bZLxA4XR7VBumWTAT6fCIXP3K/CCqsopdYTsvACkmoi7d721EfLQkyLjfcyhSADfKBjZZachruyrUIaoi+KUJKxMTAgeYjmC0FMOaaIjOqVKPiMDwVWvAlSsmq1N/K6avMW0vIXrNgK01hzAnT1K42O9S57FZYBHaesD4cwpCveZPHN4kMv7qlYoSOQzxmCMbHPSpno9/9fsbWpPyr3B3lFWykbObuTTdGE1E+Tm15hH2Y+i00WOOpUaPbBu5JPgn5HI2TvwEjbry/I9dgb9uHrR87JbLFBdR8vqdpcFbB5113Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Fri, 20 Jun
 2025 04:38:44 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 04:38:43 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 09/13] drm/dp: Change argument type of
 drm_edp_backlight_enable
Thread-Topic: [PATCH 09/13] drm/dp: Change argument type of
 drm_edp_backlight_enable
Thread-Index: AQHbrPQp3GOuT1dO9EKBX3YlURjsarQL4DOQ
Date: Fri, 20 Jun 2025 04:38:43 +0000
Message-ID: <IA0PR11MB73072882E342AAFF13AC6CDBBA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-10-suraj.kandpal@intel.com>
In-Reply-To: <20250414041637.128039-10-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MW3PR11MB4571:EE_
x-ms-office365-filtering-correlation-id: 0813cecf-47ff-4ac2-345d-08ddafb4569f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?EH850/uECKbC6Q/+c8zII+iAa16+SnRYXJ6GFItPfTw3z26jQEJf+rVRLtCw?=
 =?us-ascii?Q?cZPim0HxXP+9hj+QEY8jF7R9G3En1eoQlmWlhNfSeMkycfpd4FDgq50++NFJ?=
 =?us-ascii?Q?LC22GBhLw9GgFWgkVPh4hN8aRvo4gjNRnw1RE+4dI70uMBIKmCnylk1YFTi9?=
 =?us-ascii?Q?7OZR8he4Rw8iExWZQTn8UcIDljQV7mKSlHQjaXdgs+189bdf6pyDjPz0f8Wd?=
 =?us-ascii?Q?IDlEyk75F6o55AQ2SmUyzI2KkqshtAeFqxkL65e7yXk3/4NBqqO8eyPNQ0rS?=
 =?us-ascii?Q?ndxpl2/4RjIs+dHCfPgs7BKOd0Is/LZrfF+cu1/o8ncDPbU49v8wkX2ce4hX?=
 =?us-ascii?Q?lgxNs9ZSD8SwGbB2jjzoyxnez5+oV8ZtmwKqXFqA0MYA4hnRmbRcDFvtsEwI?=
 =?us-ascii?Q?VOU7uxHHOD8z52WAHvbOx9LujXKTS9kQVlmUWmKMJOGgiICNQA4VJd1kD7zR?=
 =?us-ascii?Q?fhJ0MXP3xxbAUWOsJ5FHrXZcUZFmjfjvTt8fJXySSz6uDxhFJjGgtDs/RwF5?=
 =?us-ascii?Q?FO/I5KroliJCAeH9OXAH8k2NjwpkYc/Po+L9GrAl8CD8Nuf9txJMwaTrgdRV?=
 =?us-ascii?Q?wWqm0SlijZ/URzsVZZvhXox+a1Jrji79pwHQdjr/wykdlW7FfAZ99+g2ZUGX?=
 =?us-ascii?Q?JdN5VhSZkdFGICK/y+YXgJAjP6Gha+Ga5kNlbdoUptxU7MWBGgwvdWAbp4ft?=
 =?us-ascii?Q?A7wAeOQsygT3yIPJ60/E83GvxxcGJf7XfGsKMjdwhWmAKYAWgAcolVIK01T9?=
 =?us-ascii?Q?vMyIPbTspsOwWW1VZ5Y65mRs36IDrvCCEwkfNk//G/h9sN+5IKyVpuv8Zhrs?=
 =?us-ascii?Q?iHxv1JeItRNTb3YuyN3MMHA44Fr3HI63EoQb/6avWEKFlxMI/Kno4wMhNJxD?=
 =?us-ascii?Q?LKCTdtRusdzryu7XVhTltQN1atc6EsWeDVwoN33muZXTrOYoTXGtP5LnDDB1?=
 =?us-ascii?Q?7vTmuXV/OU7kz/ugpJPNA+jFT+OwMRbHieL3R+4jfS03QR2p64q7+ayUVa/r?=
 =?us-ascii?Q?OaNSOJQlfxeEd1q0Oxo8L8vqUdypO5FWhtRA5JntxnJG4b9McEWScOgiCzJM?=
 =?us-ascii?Q?y/JOA7KSRxm2q+LnXkYunT6aqi1D7HHIsnX7bLgaRHEKswTV7XfMtvr0UyTl?=
 =?us-ascii?Q?GAtDrzuy8Oswc2l3aF9Qa3QXyHDs4KHhYJqvaLW/SCCp4D/WYxskugiBFGR8?=
 =?us-ascii?Q?F2vmG8dQ1oFFPXHeidayQfLjafttcllLHgF3uVzo1JOuR/tZ75ed3L2Tb9tZ?=
 =?us-ascii?Q?1ZDPLRPM9yikEA3PrZEv4ja17t1vhWL0EULE5WObMYCtKj8/VCtncBfiWNad?=
 =?us-ascii?Q?IReDkgLmgWozc/TuAxUcbg3e2MQGDTMn54ZsA60miBx0kiFC4hWujU4ALnLX?=
 =?us-ascii?Q?Qokx3+cHV2cBz+Ytq0V9QZ2oJmAEiuiEx8pZ5V/nR29DIH4b5t89i018z9uF?=
 =?us-ascii?Q?RH0SIr6K30LTDbSpccLu92B9ueg0hkPBJ7kChr4nTWkOJn0rsEp8WA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iliOfR6W6HnC8+XFl5naUOhmttkPs8IpUF3iaQb2g+Q5rsGcJA7Crkg743jZ?=
 =?us-ascii?Q?k7K1Bda3ISp34B1y18oSPHGplz9kzDr8mWDQPJJrJbmmidOlUekINpr1Ec3e?=
 =?us-ascii?Q?e3UqE0dYMH4tO325FQd6cOXUBCL6KyoFSoJNvZ7MQhdRRrfLuR3JbFkW3D8j?=
 =?us-ascii?Q?7449kinvIZH3465hW+Dbeg/IdBiDmnrrrG6SM3j0vEth3lDYEX/w0mNlvwZW?=
 =?us-ascii?Q?ZsGZtK7ZDuT3cvn0iD/7ctc3bNOowyOZpPXDjimfiZl9Hj428dbcPT2kym9V?=
 =?us-ascii?Q?w55mtTBameJvFn0SsjVRzsTpg306Wtnh65ZWZWJR2AKn7cEouAcfKD379N/l?=
 =?us-ascii?Q?g9auUvGaVf6wjmnc8w7IcO60R3TqE583yeLzskS7nJeMOhgloxzC8C/69Mz7?=
 =?us-ascii?Q?Ga34nGRJaI2b16xD8bs+RELqZ2/ifsiLA6ZOpY3H5Id6mcyYF7c77j1jKNqf?=
 =?us-ascii?Q?IXRk80uNxE6tCsEI7/PGkDtdxDJNQh0+6ZUw7To4pOVvHNcxk/OH+u/cQLuS?=
 =?us-ascii?Q?rBVXqG8qWrvCuRMENpgaBUZXyXXe/R/IEv4R9RIiQ6pRolUPBc4Mb1IS89Mj?=
 =?us-ascii?Q?x3RaNvv/AnkTmuNNKyGrSIL1MxbPipVbjKweo/ptzHKFxqfPTRcMObH8F8Zb?=
 =?us-ascii?Q?kR/NQG/QppWmN6eekdgEIXiwc+MLxrP2MG19e01hFQD05KT9Rc6cJ45zAkmS?=
 =?us-ascii?Q?zUD7vDFC6L3G5IdEzHXRUeFggkg2q/311sJQpE/3xuqsIVQBeNFBFbX+V0Bq?=
 =?us-ascii?Q?c6xrf4nAgrqrXC5IPnG9CvzRuviWy/5lOILS5EYMIZo1UJ2g1V2rKvAjG664?=
 =?us-ascii?Q?ZB81P1Z+4Fbe0wRpTwUvCMoez+VHl0baLUH6R3teJV2EvWTg59LwqBz1Rmp3?=
 =?us-ascii?Q?fumlC6DiOaTwMWRAHW2pu+aymlcFEMOdmMiqRVBuZ9RfV4edYdXZaJ7PngfU?=
 =?us-ascii?Q?nFFxosISUH0xVc3wGjslIasguowdxvpVQYOO6nfxGLQqKOE1kBofcQO9xvrH?=
 =?us-ascii?Q?VYV8wzP5qko/1dtcfSKkHQJKBHfXnAY96E0MHcMwe2Vqvf3JnD2pLYKu9Zri?=
 =?us-ascii?Q?ZNHGb8BLT64iO9NB7foaRujdCgVdr79QtxhiKQoAepWDKD4ECMBzbymM8GQH?=
 =?us-ascii?Q?px+W5aGUOIj1tCXjvP/Vmx2mM2QRwdkbNgWFF/gETM/4NDdcQ6xPnXwr+DnX?=
 =?us-ascii?Q?jza0QzS7a1EjCkzVbczYg++I4OFAxwsq2tFVGvPIAFo0BUaRAnwTfmK1K9+g?=
 =?us-ascii?Q?8do8Qq32h8XQ6wqcu1XMzUxdEzV1SMA3/R5EzoHI3ZBgvz/btkgMlSunTAMp?=
 =?us-ascii?Q?+BBssqxy5nom4vLejsVq4IxZRMQjYKqDKSlgsU8MMTyKCV8yt0HzmDYLdRBp?=
 =?us-ascii?Q?hPF+sZ40O/mDnIYykGPgt2aMb4EdBufOY2MkHV+GfeUy5mi4KzflIuD0ESUX?=
 =?us-ascii?Q?yd5RO0OgbzUMCP/E1KOtxhSk5kZVlcbEoKuaznjqyxXq5/1amXMKjJJd2rIM?=
 =?us-ascii?Q?Zz1fzbUfuXdRZ5KDkTpQQZMO7kttMLhZOOEdau1JcK0zJk9m6wMKsDCxT7HF?=
 =?us-ascii?Q?cA9jIdB/FoJSfxPh4UXwENqYKoLNf7ICejBZuVl9eMK9u3Jzf9MKKwjoN6gg?=
 =?us-ascii?Q?O50G33CFFA35Rtgpm8lsKqHe6wcyVa5Dmor3Y0/eWP7W?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0813cecf-47ff-4ac2-345d-08ddafb4569f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 04:38:43.8473 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QA+YtvQwuI7pl3r+tn9agsAyIurIAr5zHKaeeBCJiS7d/TqzTWHo2gVSEQdeNTPwY7mtd5gF60vSwyfg1+8JYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, April 14, 2025 9:47 AM
> To: nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel=
-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH 09/13] drm/dp: Change argument type of
> drm_edp_backlight_enable
>=20
> Change the argument type to u32 for the default level being sent since it=
 has to
> now account for luminance value which has to be set for
> DP_EDP_PANEL_LUMINANCE_TARGET_VALUE.
>=20
> --v2
> -No need to typecast [Jani]
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
-------------------
>  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
> drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
>  include/drm/display/drm_dp_helper.h     | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index dc0bda84d211..0421b2ed9bd4 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4020,7 +4020,7 @@ drm_edp_backlight_set_enable(struct drm_dp_aux
> *aux, const struct drm_edp_backli
>   * Returns: %0 on success, negative error code on failure.
>   */
>  int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
> -			     const u16 level)
> +			     const u32 level)
>  {
>  	int ret;
>  	u8 dpcd_buf;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 725331638a15..e3b8f6f510ef 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1829,7 +1829,7 @@ nv50_sor_atomic_enable(struct drm_encoder
> *encoder, struct drm_atomic_state *sta
>  		backlight =3D nv_connector->backlight;
>  		if (backlight && backlight->uses_dpcd)
>  			drm_edp_backlight_enable(&nv_connector->aux,
> &backlight->edp_info,
> -						 (u16)backlight->dev-
> >props.brightness);
> +						 backlight->dev-
> >props.brightness);
>  #endif
>=20
>  		break;
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index 6bce0176efd3..b6c03d3ca6c3 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -855,7 +855,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux,
> struct drm_edp_backlight_info *bl  int drm_edp_backlight_set_level(struct
> drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
>  				u32 level);
>  int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
> -			     u16 level);
> +			     u32 level);
>  int drm_edp_backlight_disable(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl);
>=20
>  #if IS_ENABLED(CONFIG_DRM_KMS_HELPER) &&
> (IS_BUILTIN(CONFIG_BACKLIGHT_CLASS_DEVICE) || \
> --
> 2.34.1

