Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5DE8A6655
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 10:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9AC10EBE5;
	Tue, 16 Apr 2024 08:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7/GQcpy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFAD10E9F3;
 Tue, 16 Apr 2024 08:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713257000; x=1744793000;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lejyBb/vpDHCRmvUrkGea8LLZuq48TwR8aalPxxOWOY=;
 b=k7/GQcpy3jNunEr77uOIuB6vZQAc/bAn13cCRSWH/2XnMFOmXzS10H8I
 1C8kYRQ5sLvFUIVpZLAZn6tEHe6nNUiOSeUk65oDP9aKSar9nNPEKBezC
 2x8GMLcTPH0HdhQsDzvmBu0ApP7KSKalnUUr10cBp2unS68aAY7mzJGz1
 Ga6d40BDhFDBnuNG9KrWX40BUK8S74g3XH1jrkuvBqGz8kG0xOv3XFu0L
 Lkr0hVv32ffqsjZXMuUt/MqvDlltMleGEVtt1urYsDorHzlTFE1bCBi6L
 jqZ0l6V5HzSVIqMufWiT+wWby+87XJutUYXrHCGEAjdTCHRpaQ1IZcS+K Q==;
X-CSE-ConnectionGUID: T0BNEkj2Re29qA7SdD/8sQ==
X-CSE-MsgGUID: g0y6xZFTSeuPO0TE5XiQRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8601606"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8601606"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 01:43:18 -0700
X-CSE-ConnectionGUID: dh1AQs1MQFeB6gx36s7YCw==
X-CSE-MsgGUID: /8ExEJWzRm2eed/k++K5TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="26851435"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 01:43:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 01:43:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 01:43:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 01:43:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nk6jzcJ6bMSFyZilGGcHdxt2F1lwNgMbSZ1AB9MmYJkEC2s11ZZB7VS0Vzr27ukOo4Jb55znUReKDEAvRQTzBEnaLar6RFVdrcx3tGyfdbHV3dOGl5rbG3hbbTpT9+YdHEWSnVe4PAp26Aee+S8sy4apnwHm5vmiPU96gjMFZmMZpdDNMOlKISN41J+bZoEzh4m4dh9HDp/XvCCx3feSm3/excUZ2tHWZrQ/NXVSevuY3ZTpqvp2UwSiB+4ovjVJgrYzp0WCp36QlyDeQQREZhf0zw9omnRPWtOnlOtKNrcK7PvDcEGeI1fR5h4Vb2jZQ2pnEuMsGTrpI9moMWy9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uALFFRYim32Q/LkDPacQORCALAtFiW9GOiYPHZF9/7c=;
 b=VYopBq/j1nJHRcAeqm8JfTFshykzfSGXRnTEXHcU4sknZ2zOxiLPttc02lzMdqKIfueRl06CntN8jTNenwctyodX5EI6Dw8Ft949dUR/cnB/3VJrmIT8ogGtOWiZ2tVXjMRPOd/fhsGlxbOtD03AonwYCdmPnTsuuAlL0Vv1Ve8w9pb9JcujYIb7i/CiqxxcCbp4gHuaP+rdll0t9T7Qcews7BuipbJbaAzTAHCkiwiopbBwW12zBLHeXxeE5Qa3sIAgL/ZBzoBt4vc0GGAx/31QgKkhjsYVkrywJK7Uv/Jh7Cc3ajCBAyYSsWh0Ue7Cl2zSxL/mjePJzPfCj95z8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 by SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Tue, 16 Apr
 2024 08:43:10 +0000
Received: from PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::8970:61a2:f00d:b23f]) by PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::8970:61a2:f00d:b23f%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 08:43:10 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH v2 6/6] drm/i915/alpm: Add debugfs for LOBF
Thread-Topic: [PATCH v2 6/6] drm/i915/alpm: Add debugfs for LOBF
Thread-Index: AQHajPO3Kk0exObOm0Wlb4MImlWYNrFpPQgAgAFb9OA=
Date: Tue, 16 Apr 2024 08:43:10 +0000
Message-ID: <PH7PR11MB59817561E47D77F8C8E86CD7F9082@PH7PR11MB5981.namprd11.prod.outlook.com>
References: <20240412155243.2891996-1-animesh.manna@intel.com>
 <20240412155243.2891996-7-animesh.manna@intel.com> <87sezm3krl.fsf@intel.com>
In-Reply-To: <87sezm3krl.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5981:EE_|SJ0PR11MB5088:EE_
x-ms-office365-filtering-correlation-id: 219aed90-9a56-463f-10bd-08dc5df13ed3
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tG1IcgMcTtnBXMJZmQzNaVS3/qvjADTWeSbF8Uikp1rTrII9SN1fo3Sy/Qlne5w0gfV5b2cdRWDPyNWvFyVdpf3QFG/be/yX8RfXPu1yyCYD2Brv5oEaTPyfMwhVVbCkmie8Q0V1DAwBPwIUFkhURm5VkIE3+MODDlk7G1TIKiMxTJPq1z6upMFUVul+o2/yH5JQs/ztwb2/GUgHyw0zibASuVUNxxb/eeZdnrBI0La0E1RR8+uhl7RF8sJnmbUWINxV/6QfGUEyVDQFW7LdCxmTAG8Iy3iVTH8F+AMot7Z+HvmUnR30CjZ+Ol7PYJyzA0RvGAtDax9xdspb/3pb23/25YBAq4HZan4OXtb/jU6NcrAx56N6K5feK8he/WxNdb/F4PMg15g2NjGn9+yAd4q51cXw6UO/RmKvDLon5lv1oOiMmKDNFbIqkucFuaup59Qx/wWFfcafImDJ4qKgDtkYxW3jJEPwNfSgdrXR43ZZbkuFOFOM8EgDpA8eOA7wId4EubusHrkV8cI3dzlHOEAWYXNBc4lita3/D7AA7j+amfoUMprjjC1xluQX6oz8N5WU86OVVwz7jDsj+GauVf8OLIdW6pj/x65X2+LC467ptpmVkZqowj5ynwv9KmeY2j10bmDxQ27wlhrf3PoylQVokCvzR4hhf+plwfHfi3TRuWgb4SzRANS/YR7NHi1qU1+8QSe5JMTSDG+R0jacyA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5981.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lKHPpVmAVPgoV8YkhUmVDrgimdInjkOy1oJ5KrYq1/rnjnx66daO8/eW5LlO?=
 =?us-ascii?Q?duJQrRcn5vd9o7HFfADtFLTgKwEivzyjPhpC7aZjsv2wWrQwRPl/AUn8qvb2?=
 =?us-ascii?Q?fMs5ekeZXiPHZ77IkMz7DVhJ1HAPZLmtKPScJvfAHoLkJXeuoFTANmbep9pn?=
 =?us-ascii?Q?cnypnSXJ14JCr8THi1wE7F+oi82FZJRSxH6iHaNSb7inNEbAXCjz+7KvPySI?=
 =?us-ascii?Q?Fjpa2g5tpDefhvbDMSPSLi8Cpixl4xi8FrnnEE2fgPTGpE/MGZXxBVkCpbN3?=
 =?us-ascii?Q?J+3gsvxGhx25WIV2D6MBPp5bahacD5Y0dYkqHe+A226dJENhmw5aUxUVtPsd?=
 =?us-ascii?Q?Zj04FSkQVVSP0Alz6A96vznwZXL5jJl+UX+GlxSD8hQN5Ap5b/sWcXlQ53Wy?=
 =?us-ascii?Q?5LD3/NwZzT+W4lsJay60WWszqJzFTWZ42dJ/ND55GHurUXZrPg8aQGl/xQ6i?=
 =?us-ascii?Q?Y5Pa7l2acCmCnuNx8tngqtYIqy6Z9O9TzbhuJfSgGgFFU74pWEVLafHPAFSi?=
 =?us-ascii?Q?IVEdJAqq87GusFgBhpErLBb+Zj2rJxMyQZhz7FZyc+HFdom+Qml36dxqLCmB?=
 =?us-ascii?Q?LuR0t/Elvr3uaCifHnUwxA/b6lizlbvmmiMPX2AlQeg6BAPHFvWjSA6e+Bl7?=
 =?us-ascii?Q?1OZw0+m+6m2GmlymiupErfp/JGEJyidgp06N6FoBSz4m5H4fPfQKZ8/SU//F?=
 =?us-ascii?Q?V6lPwLwSciXQBp9eEtIDanX71z7Gpx7/z7Zc42geJYrZfJ9Urq9GNhazQHuc?=
 =?us-ascii?Q?RH1BvIWB87L0LrPpBzE/9JiWaC4Nf40CPUdcmM85FVGQjM/gVLTQcm6pc0dH?=
 =?us-ascii?Q?5JX1Gqf3p8VgBd1veUzppbwI2EFxwayx5q019GX5MVST0Vh2uWE3GNlJrrVu?=
 =?us-ascii?Q?xPAtntI55ntlp6drQrVRkI9fV8pje/rpBejaMHaKHcIWKj9RXkfjGvTXm+yb?=
 =?us-ascii?Q?597JyI9M3ypWmkhZnV7yQRdevUf19bh/+/n3gku0CmEypvBbqwRfmpAJdvuT?=
 =?us-ascii?Q?phJHZ4s6Z2sQBQos1nUCECtGnHykMaYKRRUFXDsR+ft5QrhVn1/edCYgmNk3?=
 =?us-ascii?Q?r2Sqf0bdMcPLUuOH4CmKqL9XNY0esDnE7bxBMqrTMtJ6Axz1RNgkEUoKiVFH?=
 =?us-ascii?Q?fmB9Y1/f3r/HDU4xjdX6lI8Tz4L87YtOQuGPGSZfnfgvO8RbfgRT+HtTIA16?=
 =?us-ascii?Q?tIRERJbMtKKNjYPxxoO/WMftU21ZfdmS2zU6qmHfupIIwHUQGha9wI7oh5J1?=
 =?us-ascii?Q?IoJN/dzVmkz+NuTyd87KxTlZwTR69l67oq05Ud8Ew+DmMv8a69uH8WPwBqNe?=
 =?us-ascii?Q?HdYYxgIQPdwlwvzR9EkxZN2xvbkcx56v3fS9PcpqIRg59l0oTjBy6tBUXETl?=
 =?us-ascii?Q?WNWMxbge/o/bKfhKeuSUlUnQXcZxZXtDZ6eklkJxeOWXbL2vRsqC03+j23Kb?=
 =?us-ascii?Q?WE4824ZgA9xiBbYnryqekfkHu7Gc2swtjaMHfyBRGbHzNlVZQWB/BaJhc4Cl?=
 =?us-ascii?Q?++cDKP0DQ1UQEC9PtqiqtVQNK1fN6co6mN3oPDuGUggb6XUUZlatwuRrx6C4?=
 =?us-ascii?Q?K0gcDWooDwxpGXgi2ubNle6Q+//J/T6ZGWA0Di+S?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 219aed90-9a56-463f-10bd-08dc5df13ed3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 08:43:10.2263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gFNTLdKQIpq3V3N6B0SkmZDQVhmJglc9d54bmVew24pDa/jybz4qV8NIrFzZMf4xlMSxQM3XZ5rFWssjOp1ilg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
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
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Monday, April 15, 2024 5:23 PM
> To: Manna, Animesh <animesh.manna@intel.com>; intel-
> gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Hogander, Jouni
> <jouni.hogander@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>;
> Manna, Animesh <animesh.manna@intel.com>
> Subject: Re: [PATCH v2 6/6] drm/i915/alpm: Add debugfs for LOBF
>=20
> On Fri, 12 Apr 2024, Animesh Manna <animesh.manna@intel.com> wrote:
> > For validation purpose add debugfs for LOBF.
> >
> > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_alpm.c     | 47 +++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_alpm.h     |  2 +
> >  .../drm/i915/display/intel_display_debugfs.c  |  2 +
> >  3 files changed, 51 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c
> > b/drivers/gpu/drm/i915/display/intel_alpm.c
> > index ae894c85233c..21dfc06952d7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> > +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> > @@ -339,3 +339,50 @@ void intel_alpm_configure(struct intel_dp
> > *intel_dp)  {
> >  	lnl_alpm_configure(intel_dp);
> >  }
> > +
> > +static int i915_edp_lobf_support_show(struct seq_file *m, void *data)
> > +{
> > +	struct intel_connector *connector =3D m->private;
> > +	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> > +
> > +	seq_printf(m, "LOBF support: =3D %s",
> > +		   str_yes_no(intel_dp->lobf_supported));
>=20
> If you have individual debugfs files, where the name tells you what it's =
about,
> what's the point in printing "LOBF support" here?
>=20
> Moreover, please be more careful, this now prints "LOBF support: =3D yes"=
.
> And you'll want the \n in the end.

Ok.

>=20
> > +
> > +	return 0;
> > +}
> > +
> > +DEFINE_SHOW_ATTRIBUTE(i915_edp_lobf_support);
> > +
> > +static int i915_edp_lobf_status_show(struct seq_file *m, void *data)
> > +{
> > +	struct intel_connector *connector =3D m->private;
> > +	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> > +	const char *status;
> > +
> > +	if (intel_dp->lobf_enabled)
> > +		status =3D "enabled";
> > +	else
> > +		status =3D "disabled";
> > +
> > +	seq_printf(m, "LOBF: %s\n", status);
>=20
> Ditto. But there's also str_enabled_disabled().
>=20
> I mean you could have a read-only info file which prints all of this info=
 with
> the prefixes. But if it's one attribute per file, why have the extra prin=
ts?
> Maybe it should be just alpm info? Idk.

Sure, will go with a single debugfs entry lobf_info. Thanks for the input.

Regards,
Animesh

>=20
> BR,
> Jani.
>=20
> > +
> > +	return 0;
> > +}
> > +
> > +DEFINE_SHOW_ATTRIBUTE(i915_edp_lobf_status);
> > +
> > +void intel_alpm_lobf_debugfs_add(struct intel_connector *connector) {
> > +	struct drm_i915_private *i915 =3D to_i915(connector->base.dev);
> > +	struct dentry *root =3D connector->base.debugfs_entry;
> > +
> > +	if (DISPLAY_VER(i915) >=3D 20 &&
> > +	    connector->base.connector_type !=3D
> DRM_MODE_CONNECTOR_eDP)
> > +		return;
> > +
> > +	debugfs_create_file("i915_edp_lobf_supported", 0444, root,
> > +			    connector, &i915_edp_lobf_support_fops);
> > +
> > +	debugfs_create_file("i915_edp_lobf_status", 0444, root,
> > +			    connector, &i915_edp_lobf_status_fops); }
> > diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h
> > b/drivers/gpu/drm/i915/display/intel_alpm.h
> > index c341d2c2b7f7..66e81ed8b2fb 100644
> > --- a/drivers/gpu/drm/i915/display/intel_alpm.h
> > +++ b/drivers/gpu/drm/i915/display/intel_alpm.h
> > @@ -11,6 +11,7 @@
> >  struct intel_dp;
> >  struct intel_crtc_state;
> >  struct drm_connector_state;
> > +struct intel_connector;
> >
> >  bool intel_dp_get_aux_less_alpm_status(struct intel_dp *intel_dp);
> > bool intel_alpm_compute_params(struct intel_dp *intel_dp, @@ -19,5
> > +20,6 @@ void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
> >  				    struct intel_crtc_state *crtc_state,
> >  				    struct drm_connector_state *conn_state);
> void
> > intel_alpm_configure(struct intel_dp *intel_dp);
> > +void intel_alpm_lobf_debugfs_add(struct intel_connector *connector);
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > index 0feffe8d4e45..ba1530149836 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > @@ -13,6 +13,7 @@
> >  #include "i915_debugfs.h"
> >  #include "i915_irq.h"
> >  #include "i915_reg.h"
> > +#include "intel_alpm.h"
> >  #include "intel_crtc.h"
> >  #include "intel_de.h"
> >  #include "intel_crtc_state_dump.h"
> > @@ -1542,6 +1543,7 @@ void intel_connector_debugfs_add(struct
> intel_connector *connector)
> >  	intel_drrs_connector_debugfs_add(connector);
> >  	intel_pps_connector_debugfs_add(connector);
> >  	intel_psr_connector_debugfs_add(connector);
> > +	intel_alpm_lobf_debugfs_add(connector);
> >
> >  	if (connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort ||
> >  	    connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
>=20
> --
> Jani Nikula, Intel
