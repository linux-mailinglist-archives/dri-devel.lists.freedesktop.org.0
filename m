Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD01860F16
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 11:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886AE10EB7F;
	Fri, 23 Feb 2024 10:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/eRfcQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90B710EB7F;
 Fri, 23 Feb 2024 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708683563; x=1740219563;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/+qpG/ot9AGtVPEAnnWKjFcbODE+mqgIQv5VboTdOQA=;
 b=R/eRfcQ3oaNkh4mS2rIUHzZsQ1gZM38mjVwtFx4Di70u9/eHfEMTb0mC
 yGTl9uqZYdzw716ScOd+Q/FjjqJS9LHCgkS1D/COfTvF7xBOgqpjg7Xxc
 4XX4mHhxRFwI5V/n+ZrhQy5oNEzsMh63Ep1CEVNhfVabgjUN4xWb4FpWu
 ZvG2FUX7uTZjqdORsoIdNy2O2Cub7T0EkcLzozUvdJIm7EYQuvUn3uDkR
 9vQmUufoyygGoUw8SVValP2SYxpPMHiitNiSRDqDwV3opJVgnjR71hbL8
 NCAbD66yphJMQY94LZJF0D6LOKx6EXKLMCOu45Izww2o/czfMNQpDzLHb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3151795"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3151795"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 02:19:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="10523764"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 02:19:22 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 02:19:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 02:19:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 02:19:20 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 02:19:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lK5J4Z6p2FtOmFFnxotEVowGsiEl2wxHlCTr+7d4MXsGs7bw1p17CNIjg3HR3DlcatVJnvGkt7gctAfJRASWiW0o/OV1omKxMdBCUZAlL3p3fUD44vyQVGkZXCmTanoDipRxDMqp92RCUcrLWHa1FzccBT3ZWj2FBwYwh1EVSAh5l3Cs83UsEMNSq2MDk4bsOguxEBQYnwwTrUwntny6pNQhp2gJEEw2NIiWkNZK53m5nN+/IfYfOu3FEEgMCDQr74xeoUiI8K3UWW4i7RZa4Zr9jZNJBktJfF3pSRLh19WFBqpTStW9+TOq9iRf0KG9KD0mMkfrWORJE9q5OnigPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gedHXQ9D9+5DjssPFCNtFnWuQ0U439n+wVRHqeo3cSU=;
 b=Yvo7Hit+pgKEvnA68fgJi2LwUo8vIY16S5ANzJfzvveMn4FVg78prtSRa+om3R0h7+gb0LCzfexj69krGnrRNpTWsRM6VQP6l99Re6K10phk+aMERM3s0YrMlTqTV6+7HmaKqca58mjN75oH27H9Z4e0NSN4uZP+xrdbefvb5EMIddctbROVSKmDFUSdU+W4NPLB8pqJIluhUbH9dnSXhl5gH5xbPGTbqteqEnJAWHFDIC8RwLioFAsx3IsTNC1PitSlBfbZHzc9Umz/idnlIc5O/Cr1yH0gPjC4aB/VrqTxaBH7YQ17K6cXAgbvImBTPmwKShfQ4r6pdeAVCly4gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 LV3PR11MB8676.namprd11.prod.outlook.com (2603:10b6:408:20f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Fri, 23 Feb
 2024 10:19:17 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7316.018; Fri, 23 Feb 2024
 10:19:17 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 17/21] drm/i915/dp: Handle DP tunnel IRQs
Thread-Topic: [PATCH v2 17/21] drm/i915/dp: Handle DP tunnel IRQs
Thread-Index: AQHaZEJ2YoTHX3KmQkibm7uN7Rc70bEXurxQ
Date: Fri, 23 Feb 2024 10:19:17 +0000
Message-ID: <DM4PR11MB6360DC6E445CD3F5130F34F1F4552@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
 <20240220211841.448846-18-imre.deak@intel.com>
In-Reply-To: <20240220211841.448846-18-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|LV3PR11MB8676:EE_
x-ms-office365-filtering-correlation-id: 55b5c93c-0032-45ca-a06f-08dc3458e4aa
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dIyCmqlPoaUfj8qZ5thFypm+sw/77mFsiJc5CL4hpAo13dCrJMlnzdyhOwFcErtiWdleTJt+e/Bhb371290eEV0Y1qjcAirU9RT5GjkyW9CirPQGFDX76C4xJe40nR2anQ5jXsplx2Q2+x0fTWaM6OL+hJdbqotN8qFTx9PrAnp3Tfpr3pLWQt8349yXXhXd0gd8Qx5acZ6OyLWI36+25jPq+y7yA/d0Lv2K3uX8knixxH12eba8D7jwwkalM0FQng4iyg/f33wjm7lsgVI9ZSZzh0JTYvwwdTOwgrlV5CSprKf6edhhgu6cMQB1Eguz07kJv94jFObvnuuohodTXL5wXORqkBc67RRt+8hSDPqLm3lcL2IzrWB0eA8yZPm5wyelD6XiJszCTbdIO7Pu+lJpIwJ+BJ8TihQJerxQ6Cy9rTiwNO2AEeOjmI9lacN9P85+/DxC5iK/0MDA/lD+szyTQnMteYynYFUW749xmpruErcXrkq+bD5NNR+lnAgHoCZfWYmxc1b0r2PoXbPp8GuDBXzb1DV+iY0tXsJZ+9iwddxg0tmKMzDeoCZngFmeUcK79X9GAfUCXUfmkRfgykaiWuRtuXLE3WG/l6dRWWnNWOoM3JCX3KBM2fxqBGSi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iKrcSmlCIaj99pGkrnDsLlGs4Q9EBz8tlijgknIfgFEwNSfisvfzNAV2KD4k?=
 =?us-ascii?Q?6l9CTT/oFik1RQQtQr/1kwfgt4suCvB+0wbYpYlZI4u+By7Q2LGmo0SfxD+9?=
 =?us-ascii?Q?ldJ/qlL1n2Q6m3nyfcYFYwHfBSCSwf/TTOFW3g3//n0ye9lyNZ+fwvqtjxYE?=
 =?us-ascii?Q?qbG9TchrCrSYXvJskE2dTxlseSFW+Z+iHkjWJwfR7xL19Z3Yn7PiMNGXRhUn?=
 =?us-ascii?Q?6ugfrvXXF1c2rA0yLLAMcbSikiSJhICWB88TwMcL6LldRq1RNOYgKC1WhW/T?=
 =?us-ascii?Q?EZAzg1iKeh5IxDKWp6qa9zS3EXKf9dp1ONcDqNzUOIxXbtCtVhCF2yk8wWSi?=
 =?us-ascii?Q?WpFbYLQ13JmVeVDequmOTduQQSW7akctz/kaLUEJmjYecgzPkox7SoAMTfNb?=
 =?us-ascii?Q?ulc9k8SwY9Uun/l/N7BWpFMkIV9PrzwpgfNG957gjhYPIY3BnoWEjL3txeL+?=
 =?us-ascii?Q?vvOwdOuU1nYNPb/bxpJzhTCvNJw86E0gp+dCqnTqn2enbOx8aEtaBv6/iWV4?=
 =?us-ascii?Q?A0UoL/yuPdr1D4S5bUeqWU3IDG0yZdY0lueE23WwU6yHpi2WAeevUCxRIaCQ?=
 =?us-ascii?Q?UucRA7itmsKav5V9/Zk741dIvs+nL6/V+6PxNEjdnfjan9qTUFeJgDYvCgoO?=
 =?us-ascii?Q?bZfpOiW/ufRO8mWq60TP6gxM3FL1JbN/ctRLGwgasru+UJOD/wj6qZQs8Fwy?=
 =?us-ascii?Q?pLB/KnPkHggBmFxhMLKCPqw7riUqXSklk+s6EO0l0I7iQqQBSG1FZDJolYxR?=
 =?us-ascii?Q?OxVVzq0t6mip8yhVM/HcnV0aKOdmXZnkiX5nVyuogjfcg2POgQ0DXkiku36W?=
 =?us-ascii?Q?R5zAP24ptgZ4TAIsH1PMYRrbLWJXCekan7s0tG4dsv1JXFADfdnEmsfNxe+Y?=
 =?us-ascii?Q?5NNb8qR1Szglu2pnguW46+vzTdfKsz6Wc3mEz9p+dqYsqSkRyuQPHaqlt4tu?=
 =?us-ascii?Q?sNQiiCs01q3Svqlgeh34tVT46fO3aDGX2ZD0go/pDlUTyEqyZnl1eZeJSWo2?=
 =?us-ascii?Q?AtLFRoNTGhGMuMl6PP40l8pJ05DV3p9JNHx1zAu9DdmtskqF5O8DS/8nyuEj?=
 =?us-ascii?Q?LwOi0o+GfoRWOLqYuZtNNyLzytCi8KLJuZRLGxUV2CjGxeI4J/U+9NluaXHS?=
 =?us-ascii?Q?Ec35Wo7opx/ju/rPPQpPFZ3XrJ9VrwxcYB2IHMYLjzjqEBl6P+QXXN7hrX5R?=
 =?us-ascii?Q?ROf7+SQHbvNMqXSqJvP/NRLcqnVXYQsxR+Zjudi2ONuiSHAzaqFidlNKr+bY?=
 =?us-ascii?Q?hVc+3evYT0eHuFERrpYpi5OTs8mrNBLRL+evZPekQgohfb0POf14Jid7HCu9?=
 =?us-ascii?Q?Zwpu//to0wzfGHYRvvtN2MizwGNFEwYp4Fnf5xs5VFAJ03VjB/g4YQjgwsuW?=
 =?us-ascii?Q?fzYgnZGmBvtpzDNKVDbbFcJlepFxiwcgOPLEj/Hr9idnTJJuy2xUKanwJDXu?=
 =?us-ascii?Q?33iWeXpDPbmt69zUZ32nc6loFzSGDEaGi8mBT52CSUEm1ixj7qX+9/K1aBb9?=
 =?us-ascii?Q?RJ1LPK2BkPNURH10XKdmxXOGYkRtOCQwlcNn1o+JeULZWTSJYHwg/TdkFC/M?=
 =?us-ascii?Q?Xdexl45NV5s7EOXH/uq3xy6gbU5ZIG8eqXsSRxTP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b5c93c-0032-45ca-a06f-08dc3458e4aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 10:19:17.7480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +isJN5njdSGjp7jXeXwrNefJW+yfvPjXrsoqyV8YxELwVjR1OpMelakt4eDkPuN/8CPfarD3QB5CvkF3aZCSdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8676
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
> Subject: [PATCH v2 17/21] drm/i915/dp: Handle DP tunnel IRQs
>=20
> Handle DP tunnel IRQs a sink (or rather a BW management component like th=
e
> Thunderbolt Connection Manager) raises to signal the completion of a BW
> request by the driver, or to signal any state change related to the link =
BW.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
X`
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 37 +++++++++++++++++++------
>  include/drm/display/drm_dp.h            |  1 +
>  2 files changed, 29 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 5ad7808788745..a3dfcbb710027 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4904,13 +4904,15 @@ static bool intel_dp_mst_link_status(struct intel=
_dp
> *intel_dp)
>   * - %true if pending interrupts were serviced (or no interrupts were
>   *   pending) w/o detecting an error condition.
>   * - %false if an error condition - like AUX failure or a loss of link -=
 is
> - *   detected, which needs servicing from the hotplug work.
> + *   detected, or another condition - like a DP tunnel BW state change -=
 needs
> + *   servicing from the hotplug work.
>   */
>  static bool
>  intel_dp_check_mst_status(struct intel_dp *intel_dp)  {
>  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>  	bool link_ok =3D true;
> +	bool reprobe_needed =3D false;
>=20
>  	drm_WARN_ON_ONCE(&i915->drm, intel_dp->active_mst_links < 0);
>=20
> @@ -4937,6 +4939,13 @@ intel_dp_check_mst_status(struct intel_dp *intel_d=
p)
>=20
>  		intel_dp_mst_hpd_irq(intel_dp, esi, ack);
>=20
> +		if (esi[3] & DP_TUNNELING_IRQ) {
> +			if (drm_dp_tunnel_handle_irq(i915-
> >display.dp_tunnel_mgr,
> +						     &intel_dp->aux))
> +				reprobe_needed =3D true;
> +			ack[3] |=3D DP_TUNNELING_IRQ;
> +		}
> +
>  		if (!memchr_inv(ack, 0, sizeof(ack)))
>  			break;
>=20
> @@ -4947,7 +4956,7 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp=
)
>  			drm_dp_mst_hpd_irq_send_new_request(&intel_dp-
> >mst_mgr);
>  	}
>=20
> -	return link_ok;
> +	return link_ok && !reprobe_needed;
>  }
>=20
>  static void
> @@ -5304,23 +5313,32 @@ static void
> intel_dp_check_device_service_irq(struct intel_dp *intel_dp)
>  		drm_dbg_kms(&i915->drm, "Sink specific irq unhandled\n");  }
>=20
> -static void intel_dp_check_link_service_irq(struct intel_dp *intel_dp)
> +static bool intel_dp_check_link_service_irq(struct intel_dp *intel_dp)
>  {
> +	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> +	bool reprobe_needed =3D false;
>  	u8 val;
>=20
>  	if (intel_dp->dpcd[DP_DPCD_REV] < 0x11)
> -		return;
> +		return false;
>=20
>  	if (drm_dp_dpcd_readb(&intel_dp->aux,
>  			      DP_LINK_SERVICE_IRQ_VECTOR_ESI0, &val) !=3D 1 ||
> !val)
> -		return;
> +		return false;
> +
> +	if ((val & DP_TUNNELING_IRQ) &&
> +	    drm_dp_tunnel_handle_irq(i915->display.dp_tunnel_mgr,
> +				     &intel_dp->aux))
> +		reprobe_needed =3D true;
>=20
>  	if (drm_dp_dpcd_writeb(&intel_dp->aux,
>  			       DP_LINK_SERVICE_IRQ_VECTOR_ESI0, val) !=3D 1)
> -		return;
> +		return reprobe_needed;
>=20
>  	if (val & HDMI_LINK_STATUS_CHANGED)
>  		intel_dp_handle_hdmi_link_status_change(intel_dp);
> +
> +	return reprobe_needed;
>  }
>=20
>  /*
> @@ -5341,6 +5359,7 @@ intel_dp_short_pulse(struct intel_dp *intel_dp)  {
>  	struct drm_i915_private *dev_priv =3D dp_to_i915(intel_dp);
>  	u8 old_sink_count =3D intel_dp->sink_count;
> +	bool reprobe_needed =3D false;
>  	bool ret;
>=20
>  	/*
> @@ -5363,7 +5382,7 @@ intel_dp_short_pulse(struct intel_dp *intel_dp)
>  	}
>=20
>  	intel_dp_check_device_service_irq(intel_dp);
> -	intel_dp_check_link_service_irq(intel_dp);
> +	reprobe_needed =3D intel_dp_check_link_service_irq(intel_dp);
>=20
>  	/* Handle CEC interrupts, if any */
>  	drm_dp_cec_irq(&intel_dp->aux);
> @@ -5390,10 +5409,10 @@ intel_dp_short_pulse(struct intel_dp *intel_dp)
>  		 * FIXME get rid of the ad-hoc phy test modeset code
>  		 * and properly incorporate it into the normal modeset.
>  		 */
> -		return false;
> +		reprobe_needed =3D true;
>  	}
>=20
> -	return true;
> +	return !reprobe_needed;
>  }
>=20
>  /* XXX this is probably wrong for multiple downstream ports */ diff --gi=
t
> a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h index
> 8bfd5d007be8d..4891bd916d26a 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1081,6 +1081,7 @@
>  # define STREAM_STATUS_CHANGED               (1 << 2)
>  # define HDMI_LINK_STATUS_CHANGED            (1 << 3)
>  # define CONNECTED_OFF_ENTRY_REQUESTED       (1 << 4)
> +# define DP_TUNNELING_IRQ                    (1 << 5)
>=20
>  #define DP_PSR_ERROR_STATUS                 0x2006  /* XXX 1.2? */
>  # define DP_PSR_LINK_CRC_ERROR              (1 << 0)
> --
> 2.39.2

