Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F2B860F69
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 11:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D1410EB91;
	Fri, 23 Feb 2024 10:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgBOeTLE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C58C10EB8D;
 Fri, 23 Feb 2024 10:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708684436; x=1740220436;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bt+sElV8/HphGfcnre/lyLRIT10f/+tL4Z2SrGr1lq4=;
 b=jgBOeTLErUK0eARL1QiRKMgsejKDuGvAlzvJUT3I8C2Nr+baqIfY1boU
 QzS+Anb1MYGgKYGcnjBb3u42Qc+v0SA0NluwX2VGR4W2GFNGTr8nXuV1/
 7moyU0P3Nfc9dOr049OjQXsXnPaRJ/T7zS1PEOmrRJzJZnEr6OsCHDKjj
 4AZnX8NPDTbtAZLNbV5aKRb1oyGSHH0+MQkrdnTEetk58q8nk38B+cPRI
 oqgzGXw+Wq/48oxN1h1crQJzeqNk4rBihHuvgiqkC3ICUTTlBMl0cEO6n
 nYmQK6ySdujQNOj7bJPOj5yu988TNZ8KyhKDIZP8ccC2ssKXfxTH7KJLh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3148547"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3148547"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 02:33:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="10565103"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 02:33:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 02:33:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 02:33:53 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 02:33:53 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 02:33:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHdrm5ozymNDHP4RAN9zBHyuOhuPwgelByG36N+OviOvqCRfUztLnP2QW31bLatyJZyZDxxIQ2lKNRbSjvjlRmAk4qUUKtNlQQluUDT8Kcaj7pgjiBmQDzSKaSQNlb8cIQsYY0cUvCepqrJYNCUclz64Zaozlys5Gj8gtRo3kObHnoVkq7Jd8VxwugZKy9Mj8CMdp20EU5MUkgXNnGIJR2zmwGCgJTtEOuvZS5mHcM+mGEwo1pVRQRC32/PyoB66/7m+HnjEGKtMYUcWwYdVPv49wCRf2YraxrUsLsqI3WkxqgxEiVOlU0X8+PWqdao/Hk96P+jlVDf/F1Ydoci6nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oGHV0UZiJye5mRF0cbE3jUy5YR7tOjKl84KZRGxhUw=;
 b=Wdn5bRoBcM/bm03FQDSGL3FqG/crAGcPBnJnE3OXccRevwlHMW7YG8RpLGcU5RazjsOy/bAxHMHAkxNhr4S7gNOaSQuOsS5UwolxGPaBqguaS6+0PJ8PK8ZHyuV+KnkwIjGnv1i01bITR14iylYyjkSo3ZMx9W5kMw9arfoNRPJSlWULg8qglngjttNMEFN0QUclCpuj7V5fIRiY1Oo8SglKUxLQ1luISNxkC1KZtAF7mgjkWU84y8EmmsNWDnpLpERd8afPE9+LYM2srqFJuKxpMbTGsn4NDx+g7YLkZT3qOWOMuGvC8NncLzNaxrqI2hlav7xNuOwTQyGFjm09sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CH0PR11MB5281.namprd11.prod.outlook.com (2603:10b6:610:bc::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.10; Fri, 23 Feb 2024 10:33:46 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7316.018; Fri, 23 Feb 2024
 10:33:46 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 20/21] drm/i915/dp: Read DPRX for all long HPD pulses
Thread-Topic: [PATCH v2 20/21] drm/i915/dp: Read DPRX for all long HPD pulses
Thread-Index: AQHaZEJ52UOi4kgXYEix/DGERHTiX7EXvuoA
Date: Fri, 23 Feb 2024 10:33:46 +0000
Message-ID: <DM4PR11MB636020B4D1B18D6505A52885F4552@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
 <20240220211841.448846-21-imre.deak@intel.com>
In-Reply-To: <20240220211841.448846-21-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CH0PR11MB5281:EE_
x-ms-office365-filtering-correlation-id: c970b01d-f78e-4103-8349-08dc345aea7a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6eH3A3NLTf8SdyYuoC0+Ey/trKO5B7y1AiDTmjbdSNcme/Zr0rC6kzzhe8L2Eae1A7XmyNOiWxZ8nVy1JVJZ/q/riO4AlBe0dTXQlNPJP4528Mg3K1Cb8uugjfzrjvOzDta91hddX+HEDZG00axDYQNqFH9A6UyRNaUDqJkdtUOfDu8kumAhJK+Zvt9LL7PO0qbk66mvckYKp2jCQ28zUwGi0SIjCJ/Wy9uQ16ZiTv2GJY6/STOvEDw5Q5akVEoM81ttXruc7ShA/OVJ0RuU6g/diNFM2vptf50WkGFXryPAbZBjStEKJl5/7tIBmRcLRy83MIonifHVl0IGHv+FHsRCqWInK4rT+t2lXbeHUlLO4PLXdpF9WJdZRJBmYZELJU1yMiKCQ8IDIiaixeYeOilycl6QAHvqAa5MqkeycoKgUl2J0vtrsXOjNqHDiSrahabaICJoJYawlscGLf2ujC/3xPCcOqWpBmINlbe9dbc1QavsdajQjgtbCEiC5PblK32ox9qqegRhdzZnous78M3J2SYO2LVokyvZLHui9+Ep/edOtvB9fktJ588jBerI9i46ClBYdMc+Ww/N4I5w9ZUTlWG/314L4bS6wVcV+ur/gnxH6QKwrM/b2P5itcdQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fU4MSD/oOibRYv9nVLedqybP+PyhCqGL2UUMI6epj+EMDdipM0l5GM7WypO5?=
 =?us-ascii?Q?/0pceGa3P/sz+p5FNXXAI0lu6IWE4epLIfvwy6iOC2HaNavvKbJ2PN/1wiJg?=
 =?us-ascii?Q?qdtT8xlDZXaWBu236/51K+kfggJFclw+iydkjXL6gWSBP1M4DQuLoh3FQaOL?=
 =?us-ascii?Q?G8QVQLrnhPzBljdsXFJAtYzB+L/EsXN56s8ooYMTrFWwSYl9vaQUV49zX5Zi?=
 =?us-ascii?Q?GeqMWYThIXAM6lCctu2hVczlZ1MEeKnc0G06/0MG9RezOZXafIAb+XR+jDYJ?=
 =?us-ascii?Q?6xs4E+jbXdQ+nQ9nu6tqncol1C24zWuEFkD//HM7wF5CePlmEL40FHrFrQjc?=
 =?us-ascii?Q?Anz3pTl3Rc7fRs6aS2PndC8DWCARhQfb4oIG8gByzN/8KXbC+J38DRvk5YjL?=
 =?us-ascii?Q?Xp2zDOTM2oluRjrRNhQ+Bi9BMVWzlXjmzkYfdZct270XJ4THRdOtBxqGpkNw?=
 =?us-ascii?Q?LTWJKiI8sOvsFFgdZaI7QfBagRNiX2kRd/RAqKY0d69NkLgsK7DQDaGz77PJ?=
 =?us-ascii?Q?/yS2mNIEmdaSHUMINZy6MRT4ptf9kfLmMeFRp8PICvc5LwHPqT1/9/N6DzoM?=
 =?us-ascii?Q?lKhkkoDR9Y0ZGSmQq+llZbaX8MK5eu1OBOxt3KSgQEs4PqlABQNEutagUpJn?=
 =?us-ascii?Q?p0YlYLBOYUb+ExXeIKq+t6J8nnKDMPQPPMeFX98HliqvXwMx08YSiQ66rPBT?=
 =?us-ascii?Q?BORJ5h/xHlrJ223p9j5R3SG80oujfDpa+RbQIJmb71cPtti1qeUnCCo8zeP+?=
 =?us-ascii?Q?ER59dygDY3mVmVOOQTN8mjJpUHZFTACaU2fpB3jxSe7zqF9DDcYWtE6jzaab?=
 =?us-ascii?Q?76X4DumWLTg6om1Mg9nWNb41h7ksE3jyYhKYE3C1PyPh8H9d3Pl0z126Yes4?=
 =?us-ascii?Q?RKiC9OB0KgsqReJuXRpj99iO5SUtBZsPIHv5tWOwY/wEI4hGrPUlbqy9aAec?=
 =?us-ascii?Q?852iXWqvzjpHX+y/PMziqmfhVJFFsu6qeGYStgIUJhClqWpPaud9N+zYtYJf?=
 =?us-ascii?Q?keT8NWmjnJpkcjhhUzw9me2BANjmOupYwKvGSVNtv05AwcKtsH1dYEX0MenK?=
 =?us-ascii?Q?93X44MiL60VfAe/jZJD/Lovd53YTMPCzFWiCwgRTRv7T7RqEYu8987ePnkTJ?=
 =?us-ascii?Q?ye3GaD1lFQX6+WQqaCkKcnQrmwcAGq/VEBwjib+/NkAqcndTFizmCa8BdLsH?=
 =?us-ascii?Q?g31Hgvd8c4piaUFLuqCp+Tn3mXywgKrsrmCryNvLuhkeG8pE+cMcDpymvlVb?=
 =?us-ascii?Q?wCOi5AHO6h2wS7Sq3WF7kBvtpVOSlnKVXW+AXCfFyHTWU8tfUdPPOMXFfTB5?=
 =?us-ascii?Q?hpuorSm/qioXhppeubHJGHvpQu9+3+YHYOoFmOT9hjdVsg0ltmCHQexCCNrJ?=
 =?us-ascii?Q?ih9qA+B5Pdp3k6sue6ti+zfhJ0kl/vx+vdRmdfQpou3Nac939kim0tVWy+WI?=
 =?us-ascii?Q?jjTAu6wTBySF3v4r9lXunIcY2zXAa9lpXuCX/3t7iCw9jYUFIt2yGZUynXi3?=
 =?us-ascii?Q?EGOWqAUDYa2edD4lhT2SuEk0dS4uF8chaq9s6fuo/geDv5ZnJMSgBrqClA8n?=
 =?us-ascii?Q?F0Z92UhI5faie9PBbXMR8yy2yhgMsv6OfwLbDoYB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c970b01d-f78e-4103-8349-08dc345aea7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 10:33:46.5158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IFqQDw/BI1sf0gomVOdf0jkUPYip+ZMSaPc4T+BQ7JX8aB7L1ffkuLfVGNkoaP6cbdP5lMdh6J2gHj+xy7ta+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5281
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Im=
re
> Deak
> Sent: Wednesday, February 21, 2024 2:49 AM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: [PATCH v2 20/21] drm/i915/dp: Read DPRX for all long HPD pulses
>=20
> The TBT DP tunnel BW request logic in the Thunderbolt Connection Manager
> depends on the GFX driver reading out the sink's DPRX capabilities in res=
ponse to
> a long HPD pulse. Since in i915 this read-out can be blocked by another
> connector's/encoder's hotplug event handling (which is serialized by
> drm_mode_config::connection_mutex), do a dummy DPRX read-out in the
> encoder's HPD pulse handler (which is not blocked by other encoders).

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 35ef17439038a..f7f8bd5742ad4 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6162,6 +6162,7 @@ intel_dp_hpd_pulse(struct intel_digital_port *dig_p=
ort,
> bool long_hpd)  {
>  	struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev);
>  	struct intel_dp *intel_dp =3D &dig_port->dp;
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
>=20
>  	if (dig_port->base.type =3D=3D INTEL_OUTPUT_EDP &&
>  	    (long_hpd || !intel_pps_have_panel_power_or_vdd(intel_dp))) { @@ -
> 6184,6 +6185,17 @@ intel_dp_hpd_pulse(struct intel_digital_port *dig_port=
,
> bool long_hpd)
>  		    dig_port->base.base.name,
>  		    long_hpd ? "long" : "short");
>=20
> +	/*
> +	 * TBT DP tunnels require the GFX driver to read out the DPRX caps in
> +	 * response to long HPD pulses. The DP hotplug handler does that,
> +	 * however the hotplug handler may be blocked by another
> +	 * connector's/encoder's hotplug handler. Since the TBT CM may not
> +	 * complete the DP tunnel BW request for the latter connector/encoder
> +	 * waiting for this encoder's DPRX read, perform a dummy read here.
> +	 */
> +	if (long_hpd)
> +		intel_dp_read_dprx_caps(intel_dp, dpcd);
> +
>  	if (long_hpd) {
>  		intel_dp->reset_link_params =3D true;
>  		return IRQ_NONE;
> --
> 2.39.2

