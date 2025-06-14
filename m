Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01581AD9B28
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 10:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D1210E0D9;
	Sat, 14 Jun 2025 08:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0QR3Ltl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E69210E0D9;
 Sat, 14 Jun 2025 08:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749888198; x=1781424198;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kjw86R2SyVwTzZGjCNhtnFRtobvfjFQYe2xer2+2Dvo=;
 b=l0QR3LtlDUR1DsJnRpE+uwG7pS2HGdhuVqfO20xhNc8Xb69qa70loZ5E
 3nry+vfeJp0QFuJSQ3YyHCX0iHGQtnHhbOd4VO6ZQ+76iCdR5uFmtjPwa
 Dk0hpbEnC0VzMkfKcADsiMPDHn831RxInt3QKZUwm5TZLMoH2tZcBGnTq
 e9SfuEDvCTSFCqeKa7WfogCzG2gICrb2wFBMFqPZK2Rm57De36So6ssvR
 Nxhkh6BMWZ4ckgfZADycz5tMvUZjfgKhamost0QgRoUPiT3y2kwxXbuRR
 LXI+u9kwqR4Xzm18U7ghmhFuErFRISs2q+SjaRJZNOPWoDXxvUtC3SZah g==;
X-CSE-ConnectionGUID: k4xtkWq2SiuJ1XgG2nCOvw==
X-CSE-MsgGUID: L5tIhODFSGOjDavvDEuJ6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63512457"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; d="scan'208";a="63512457"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2025 01:03:03 -0700
X-CSE-ConnectionGUID: twymRGx1TlKTFW5WH5H/og==
X-CSE-MsgGUID: AlYCw9/BSl2dtKMyQwq7pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; d="scan'208";a="153305934"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2025 01:03:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 14 Jun 2025 01:03:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sat, 14 Jun 2025 01:03:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 14 Jun 2025 01:02:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrnuV/ocAEW2JAwkIyR3BSbGqzI7e3rrkcgnv4qHHIBU6TE6NCA5ivDxwAOSJbz4CGd5ivuJws2a5I22ZIKJhlIpXAieAIbr3CbjdaMZxlRBKP4+QHeK/X5YkOanE/cAqd0KCINwM99FYkzqdpDdDfIiSDWAVpTrhZkVzEQ5boUNtvW8z48BTh4GZtfsyTlsc10wT6UIeJqn8GDZX9DBI1uo1ja3MY6CJrOIDmllZcT6/2HfITeKM/BLB0x4hxwg4DUhK358JMj8h5KCvHYzwc+d3u8e4zdduNliusZ3jFDBBu0Snwv+9VPV3ftzwXl0REgVGjLi7Tyr05KUXJOENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rZDn2F7Ec2q170s0UjKweYGk9Km7jaQyC9gcl2+OHo=;
 b=optijyPK+/q+GrcmVhJkwJD0TDYueCKshIFpkkG+4529gmTq2NNj9wZ3oZG+D8eQ8EuqicJ4b/F+z06R7N7cfnuFOKlDXcC07npcyAscAb79psksqUrT6FXJIevPd7p50dTXsaPYfYz0+auHsDW/Z3wMm9TEpvq4ljRHG2uoutKpu6M29or8ynhDJy90ZBNN9gbz7yWkSaaaGnhB4HCcxes79zHnv29yk30CMVM2yWebG92TUy1I68U3VYQP5MMrbHZVU4e4RR7xNXzVOZbeVgaANrXMnlQIqokwMu2TUgI0zz98w9Q6BBKMdWd1RMSW/SljCT/1r6QNxG03izuTUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SN7PR11MB7042.namprd11.prod.outlook.com (2603:10b6:806:299::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Sat, 14 Jun
 2025 08:02:30 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%4]) with mapi id 15.20.8813.024; Sat, 14 Jun 2025
 08:02:30 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Usyskin, Alexander" <alexander.usyskin@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v2 02/10] mei: late_bind: add late binding component driver
Thread-Topic: [PATCH v2 02/10] mei: late_bind: add late binding component
 driver
Thread-Index: AQHb1wwAOQaAy8X7AkexPMlP+EXQ+7QCKIWQ
Date: Sat, 14 Jun 2025 08:02:30 +0000
Message-ID: <CY5PR11MB6211ADC01F813F24F5B7AA939576A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
 <20250606175707.1403384-3-badal.nilawar@intel.com>
In-Reply-To: <20250606175707.1403384-3-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SN7PR11MB7042:EE_
x-ms-office365-filtering-correlation-id: eba8734b-ffe5-441e-e0d9-08ddab19cfc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+ZyPXzQXf7o0iNQD+eroj5uBx1b3uvbNsZHBEDI1kndLZ7jpmy0xPDmZ04F4?=
 =?us-ascii?Q?r481N6jo161MHlmtFbk7prYSZ4PA5AS6Yya0UIvHKgoRz7t38B40t3zbslFq?=
 =?us-ascii?Q?qpX5FEeRGxryry7k1TLM8wUKNPKSiHvZMW6zrxfNq+2/ip/kbfBLftc8QM0/?=
 =?us-ascii?Q?5xDzBCMoEWhscgumu4DU2oah4ajzGS7fX9wE2C3l0xiMvLLT5W312XMXFl6i?=
 =?us-ascii?Q?VJhorlhlSDak/62QWG1duYmvSihMEqXGhEtLODf2OL5uv6rUavtMG4jrv6oj?=
 =?us-ascii?Q?PZ4nEuJAZd3n4LX/bApPotYVo1bqKRc+XXBIttgWnmPF7N9sYyi2kjWDmJOu?=
 =?us-ascii?Q?RV4zV68yunMbpnOY4bI6Hbrrcphs41c8hvOCn1kLBtuMAy/1cVT44xMXDcqL?=
 =?us-ascii?Q?c3nEUwfA4noboTQOf5t//uy3YFmgVfH2eLvTp7FP5SQlDLpTvhJ0M2oDwUsh?=
 =?us-ascii?Q?d3cU4eVT70B+dq6K16Hq9LPSAVI9oe+BzFqLiYhwt+qIJd/lMhXx3ne7QaDs?=
 =?us-ascii?Q?MhXPSgaratLa1tIhUilBYJFnwhOKD3Wc83Lbpsu8G9zN4meg3rYVCu5rKWby?=
 =?us-ascii?Q?lD55KQBQnddgBsFigL5ZV2RlsC/2K9oFlD3hFM/yiXrLPCUt31g6T+s2uBvw?=
 =?us-ascii?Q?TnbebJK7USZU7IS6RE7Ga/ruVh52nMyPVUd56H0/4I18P++lg4KKflw0r1EE?=
 =?us-ascii?Q?i/fyzX7owKVz667UQj1rgT2YFOs3dMeEfy1LOcpolFYE3C2e7RqPLFnFYNor?=
 =?us-ascii?Q?Vt9OzmYI5RuP+Maa2vtDWtohcmT+5VkDL2+2eEba2RBxl0hG4O8QsF5xd4Kt?=
 =?us-ascii?Q?/mc5G4RqIzOAhfdmIzhfXbz01l/zasvFoyzzzg0KwkZnTVhCWjCRfFF7ai8K?=
 =?us-ascii?Q?fMg+TpcWCH7xehseN7mPErWgSVfMoZcBAe1QNhbLUbZVHs6jP5JqboslfMAC?=
 =?us-ascii?Q?X9dyU3ZD+l9ryx18xUH/5Cyo5jK2GtDI73YDIjnVnvXNJq2Oytqv6OV44VM7?=
 =?us-ascii?Q?hqNzHDHE821i6t5S9Rs315kIigLMuChh1z/Rx+GPfcYN1QzKfCxR6xSVZE3f?=
 =?us-ascii?Q?td1bqLS6xSVqp05u2OPMaJB9itxXDHQJVdwFqGBSemoXeg46ErBMO895ej/p?=
 =?us-ascii?Q?OXYvwmz3oH2PewFW4giiPJXKpk5CknnENWL7gcw87yaIMF082bs8B1kg6fNu?=
 =?us-ascii?Q?nGdqOPMs7KtCHKwlUSbBCmT2X2BDNsgxL7c3n0pJGIrPLS4dKoNgVQ6rIcO/?=
 =?us-ascii?Q?sZN26S7ioYmHThcj/koX5AWa6VxblfJVsmWOKgOAl5XLD7knKqU9248zFZV+?=
 =?us-ascii?Q?g6YeAnqwVILH7za6flOcra/C+0/4Vqw+69dkuQmzXLO3ajMmhsKJJFHe8ZM2?=
 =?us-ascii?Q?jDOaBN7GmVmfGJtLIRNaQXwVYGBjmvNH3MLpCV/B1R95oRWHXVI6WpCa3tfG?=
 =?us-ascii?Q?0Dn0fA6YLyBXnfJOV29Pqk7twTZ5sSINq4z4SHrld9F4/VZmPsEZQnWY/C9x?=
 =?us-ascii?Q?hfn3tDnab1TVU00=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?15MElt9EtsZAeEw13PspCHC7sPNlTLJuu35JD6NVt3hi7gAuQ2jPNrgBUsLY?=
 =?us-ascii?Q?PdQ3DFeCGSVhNxw7HbiX3elVuYXNwv3UTtvl5U7Y5jAhH4HYYQb84snPrq4G?=
 =?us-ascii?Q?nZ0XeeIbKBAkN1//292iJia+6eJWYskDHY2z3I1K0ttd69lT38cNaHetmObd?=
 =?us-ascii?Q?gW4MoKAp0f9X4ozckkh7ujGIrSlNQUsKrCAVINDUQKkx8l56R3TWrue7ih3B?=
 =?us-ascii?Q?D7DpnuYrTMQkrz9sYTyGx6YjrJOFmAFBg3q57DQ+otmoqBPn0JxLa0xC3vu6?=
 =?us-ascii?Q?KZVN73X5EdWBwau5QEpGH+an9kxHCyI7gc6lb2bm+4ndJIJWFsBeLc9H51oR?=
 =?us-ascii?Q?usIEGq4VfKbmpXpuiCS6t298h0XZVqut6gAN7p/Xgw+RJPliaPXM7quGuFzd?=
 =?us-ascii?Q?zOTfIcj/gc/+rWOyBu73Bv0DWSn581r3PXeAZ301nr5guuY5SX35jqA9/3En?=
 =?us-ascii?Q?YaZMLNdOHMHKGwcM9YB51R033W1UWs2vT3r+HSibZA0hC25tQi93TEha4+2T?=
 =?us-ascii?Q?ZjqtizqPK1/38wVM0NfyQZuJFj1lHFk6ywqTjU2xcJXtcHrfTyRM2OJRhR+0?=
 =?us-ascii?Q?K5TqKF56oExOoendyuFvZ2rTY4oLSr235P9I5cIxMKWd2p1JThNNVkIJG/ce?=
 =?us-ascii?Q?0JCl4H3rhFJ16UpmG8AZwmAqXtFvzZs3gdGFIUBQHFxmglGFJzGm4KanX4ZX?=
 =?us-ascii?Q?Tk1MHTsrGGjQKQSqrS1wVnX58BpuB3DsEGa6PjfK7UQaINe+qf1dAXIOaccg?=
 =?us-ascii?Q?ZELhJGJs+horVDlxcqKDEeqxUSa/fLzUML1SFKMaSc39+Dtw3A5hxIzXoOUR?=
 =?us-ascii?Q?MGFzRhzcqAO6/MAcGJIiMezAmUjgLPLH7aX0sRBM2NysJxuvbJH+N+u96KBI?=
 =?us-ascii?Q?0ruQsA6TOo/2xdkMNmUO6PMy2mH2gxuaGwOI19Awd8nzinTwAKnDmCKJ5vL/?=
 =?us-ascii?Q?ZiwPkocUf0Yf/PNXo7y3pNT+7hBoVBtGruq0yGMKnYWbm7TFS5Jz8MeTQIF8?=
 =?us-ascii?Q?o1RYiIv/sS3u+egdGobT0NokljE4f0/K3GrMrLRgH2+8LrfvpkNI1NeoxYIv?=
 =?us-ascii?Q?grWqDIZT8ddv7sbZQO5eCF8Vsena9q/plqySAcV8B0JWRav9NhcGR8S2rwSI?=
 =?us-ascii?Q?7MHzKCUO8k+y4rQWKUesq47tZlVW7MR+5vpIkcTmySBNDpc4XR7kp56vaYSf?=
 =?us-ascii?Q?7m4KZApXUunBzVEI3Z5Wk4znlmd7UKphebYCH4wLKbcNM7wSpb7wkl9/dBm9?=
 =?us-ascii?Q?RTFngkSuaGR/tSmdkvCoz+SrzujNhoUo/sT3wCa1eZ8tcMnAvVsL1dEpptCY?=
 =?us-ascii?Q?+9DBU21LCyJ0CsJcdPrKWRXlEHljbd59ZyXuutmQfmiEEkUxRdT/l+yRZ8N2?=
 =?us-ascii?Q?Q8wjRReHIvfTU+NH752Zzq8JStH2Jb9qC3XcHDO8shKpI7FmUkbv06AwSRtB?=
 =?us-ascii?Q?TicVAYiCjhHSzSy5lnM7Lr2C4jS2RBGc74Zg2X79Iga6hhJUHAHk/9YXWPbl?=
 =?us-ascii?Q?EsTPdw+oEFPPz+HvhQxmpo2fYIjkfqQn2C1+Fhh3XzWFWbfTaJRNWIvffHPx?=
 =?us-ascii?Q?RoKBatU+uqNEcGvWpf900blo0VFePEjNYzzYKNp8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba8734b-ffe5-441e-e0d9-08ddab19cfc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2025 08:02:30.4517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sD/eY3YFOCfPPNhonXk3Bk/oVAhDh3hvzR5xfDm43PqOIArAdro7lnkfgR1hf9c5TZPI5r1hOHmYlnBDsRaVW536OuzZafrBfq73wnH8nCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7042
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
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Friday, June 6, 2025 11:27 PM
> To: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Usyskin, Alexander <alexander.usyskin@intel.com=
>;
> gregkh@linuxfoundation.org; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>; jgg@nvidia.com
> Subject: [PATCH v2 02/10] mei: late_bind: add late binding component driv=
er
>=20
> From: Alexander Usyskin <alexander.usyskin@intel.com>
>=20
> Add late binding component driver.
> It allows pushing the late binding configuration from, for example, the X=
e
> graphics driver to the Intel discrete graphics card's CSE device.
>=20
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v2:
>  - Use generic naming (Jani)
>  - Drop xe_late_bind_component struct to move to xe code (Daniele/Sasha)
> ---
>  drivers/misc/mei/Kconfig                    |   1 +
>  drivers/misc/mei/Makefile                   |   1 +
>  drivers/misc/mei/late_bind/Kconfig          |  12 +
>  drivers/misc/mei/late_bind/Makefile         |   9 +
>  drivers/misc/mei/late_bind/mei_late_bind.c  | 261 ++++++++++++++++++++
>  include/drm/intel/i915_component.h          |   1 +
>  include/drm/intel/late_bind_mei_interface.h |  37 +++
>  7 files changed, 322 insertions(+)
>  create mode 100644 drivers/misc/mei/late_bind/Kconfig
>  create mode 100644 drivers/misc/mei/late_bind/Makefile
>  create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
>  create mode 100644 include/drm/intel/late_bind_mei_interface.h
>=20
> diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig index
> 7575fee96cc6..771becc68095 100644
> --- a/drivers/misc/mei/Kconfig
> +++ b/drivers/misc/mei/Kconfig
> @@ -84,5 +84,6 @@ config INTEL_MEI_VSC
>  source "drivers/misc/mei/hdcp/Kconfig"
>  source "drivers/misc/mei/pxp/Kconfig"
>  source "drivers/misc/mei/gsc_proxy/Kconfig"
> +source "drivers/misc/mei/late_bind/Kconfig"
>=20
>  endif
> diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile index
> 6f9fdbf1a495..84bfde888d81 100644
> --- a/drivers/misc/mei/Makefile
> +++ b/drivers/misc/mei/Makefile
> @@ -31,6 +31,7 @@ CFLAGS_mei-trace.o =3D -I$(src)
>  obj-$(CONFIG_INTEL_MEI_HDCP) +=3D hdcp/
>  obj-$(CONFIG_INTEL_MEI_PXP) +=3D pxp/
>  obj-$(CONFIG_INTEL_MEI_GSC_PROXY) +=3D gsc_proxy/
> +obj-$(CONFIG_INTEL_MEI_LATE_BIND) +=3D late_bind/
>=20
>  obj-$(CONFIG_INTEL_MEI_VSC_HW) +=3D mei-vsc-hw.o  mei-vsc-hw-y :=3D vsc-
> tp.o diff --git a/drivers/misc/mei/late_bind/Kconfig
> b/drivers/misc/mei/late_bind/Kconfig
> new file mode 100644
> index 000000000000..c5302303e5af
> --- /dev/null
> +++ b/drivers/misc/mei/late_bind/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025, Intel Corporation. All rights reserved.
> +#
> +config INTEL_MEI_LATE_BIND
> +	tristate "Intel late binding support on ME Interface"
> +	select INTEL_MEI_ME
> +	depends on DRM_XE
> +	help
> +	  MEI Support for Late Binding for Intel graphics card.
> +
> +	  Enables the ME FW interfaces for Late Binding for
> +          Xe display driver of Intel.
It is needed even for headless cards as well.
> diff --git a/drivers/misc/mei/late_bind/Makefile
> b/drivers/misc/mei/late_bind/Makefile
> new file mode 100644
> index 000000000000..a0aeda5853f0
> --- /dev/null
> +++ b/drivers/misc/mei/late_bind/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Copyright (c) 2025, Intel Corporation. All rights reserved.
> +#
> +# Makefile - Late Binding client driver for Intel MEI Bus Driver.
> +
> +subdir-ccflags-y +=3D -I$(srctree)/drivers/misc/mei/
> +
> +obj-$(CONFIG_INTEL_MEI_LATE_BIND) +=3D mei_late_bind.o
> diff --git a/drivers/misc/mei/late_bind/mei_late_bind.c
> b/drivers/misc/mei/late_bind/mei_late_bind.c
> new file mode 100644
> index 000000000000..964757a9b33a
> --- /dev/null
> +++ b/drivers/misc/mei/late_bind/mei_late_bind.c
> @@ -0,0 +1,261 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Intel Corporation  */ #include
> +<drm/drm_connector.h> #include <drm/intel/i915_component.h> #include
Why do we need drm_connector header ?
Remove unnecessary headers.
> +<drm/intel/late_bind_mei_interface.h>
> +#include <linux/component.h>
> +#include <linux/pci.h>
> +#include <linux/mei_cl_bus.h>
> +#include <linux/module.h>
> +#include <linux/overflow.h>
> +#include <linux/slab.h>
> +#include <linux/uuid.h>
> +
> +#include "mkhi.h"
> +
> +#define GFX_SRV_MKHI_LATE_BINDING_CMD 0x12 #define
Why it is not prefixed with DGFX. This is unique to DGFX cards ?
@alexander any comment on above ?
> +GFX_SRV_MKHI_LATE_BINDING_RSP (GFX_SRV_MKHI_LATE_BINDING_CMD
> | 0x80)
> +
> +#define LATE_BIND_SEND_TIMEOUT_MSEC 3000 #define
> +LATE_BIND_RECV_TIMEOUT_MSEC 3000
From where we got these delay numbers, from any specs or it is arbitrary de=
lay specific to let bind ?
Add a code comment in that case.
> +
> +/**
> + * struct csc_heci_late_bind_req - late binding request
> + * @header: @ref mkhi_msg_hdr
> + * @type: type of the late binding payload
> + * @flags: flags to be passed to the firmware
> + * @reserved: reserved field
> + * @payload_size: size of the payload data in bytes
> + * @payload: data to be sent to the firmware  */ struct
> +csc_heci_late_bind_req {
> +	struct mkhi_msg_hdr header;
> +	u32 type;
> +	u32 flags;
> +	u32 reserved[2];
> +	u32 payload_size;
> +	u8  payload[] __counted_by(payload_size); } __packed;
> +
> +/**
> + * struct csc_heci_late_bind_rsp - late binding response
> + * @header: @ref mkhi_msg_hdr
> + * @type: type of the late binding payload
> + * @reserved: reserved field
> + * @status: status of the late binding command execution by firmware
> +*/ struct csc_heci_late_bind_rsp {
> +	struct mkhi_msg_hdr header;
> +	u32 type;
> +	u32 reserved[2];
> +	u32 status;
> +} __packed;
> +
> +static int mei_late_bind_check_response(const struct device *dev, const
> +struct mkhi_msg_hdr *hdr) {
> +	if (hdr->group_id !=3D MKHI_GROUP_ID_GFX) {
> +		dev_err(dev, "Mismatch group id: 0x%x instead of 0x%x\n",
> +			hdr->group_id, MKHI_GROUP_ID_GFX);
> +		return -EINVAL;
> +	}
> +
> +	if (hdr->command !=3D GFX_SRV_MKHI_LATE_BINDING_RSP) {
> +		dev_err(dev, "Mismatch command: 0x%x instead of 0x%x\n",
> +			hdr->command,
> GFX_SRV_MKHI_LATE_BINDING_RSP);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * mei_late_bind_push_config - Sends a config to the firmware.
> + * @dev: device struct corresponding to the mei device
> + * @type: payload type
> + * @flags: payload flags
> + * @payload: payload buffer
> + * @payload_size: payload buffer size
> + *
> + * Return: 0 success, negative errno value on transport failure,
> + *         positive status returned by FW
> + */
> +static int mei_late_bind_push_config(struct device *dev, u32 type, u32 f=
lags,
> +				     const void *payload, size_t payload_size) {
> +	struct mei_cl_device *cldev;
> +	struct csc_heci_late_bind_req *req =3D NULL;
> +	struct csc_heci_late_bind_rsp rsp;
> +	size_t req_size;
> +	int ret;
> +
> +	if (!dev || !payload || !payload_size)
> +		return -EINVAL;
> +
> +	cldev =3D to_mei_cl_device(dev);
> +
> +	ret =3D mei_cldev_enable(cldev);
> +	if (ret < 0) {
> +		dev_dbg(dev, "mei_cldev_enable failed. %d\n", ret);
> +		return ret;
> +	}
> +
> +	req_size =3D struct_size(req, payload, payload_size);
> +	if (req_size > mei_cldev_mtu(cldev)) {
> +		dev_err(dev, "Payload is too big %zu\n", payload_size);
> +		ret =3D -EMSGSIZE;
> +		goto end;
> +	}
> +
> +	req =3D kmalloc(req_size, GFP_KERNEL);
> +	if (!req) {
> +		ret =3D -ENOMEM;
> +		goto end;
> +	}
> +
> +	req->header.group_id =3D MKHI_GROUP_ID_GFX;
> +	req->header.command =3D GFX_SRV_MKHI_LATE_BINDING_CMD;
> +	req->type =3D type;
> +	req->flags =3D flags;
> +	req->reserved[0] =3D 0;
> +	req->reserved[1] =3D 0;
> +	req->payload_size =3D payload_size;
> +	memcpy(req->payload, payload, payload_size);
> +
> +	ret =3D mei_cldev_send_timeout(cldev, (void *)req, req_size,
> LATE_BIND_SEND_TIMEOUT_MSEC);
> +	if (ret < 0) {
> +		dev_err(dev, "mei_cldev_send failed. %d\n", ret);
> +		goto end;
> +	}
> +	ret =3D mei_cldev_recv_timeout(cldev, (void *)&rsp, sizeof(rsp),
> LATE_BIND_RECV_TIMEOUT_MSEC);
> +	if (ret < 0) {
> +		dev_err(dev, "mei_cldev_recv failed. %d\n", ret);
> +		goto end;
> +	}
> +	ret =3D mei_late_bind_check_response(dev, &rsp.header);
> +	if (ret) {
> +		dev_err(dev, "bad result response from the firmware:
> 0x%x\n",
> +			*(uint32_t *)&rsp.header);
> +		goto end;
> +	}
> +	ret =3D (int)rsp.status;
> +	dev_dbg(dev, "mei_late_bind_push_config status =3D %d\n", ret);
> +
> +end:
> +	mei_cldev_disable(cldev);
> +	kfree(req);
> +	return ret;
> +}
> +
> +static const struct late_bind_component_ops mei_late_bind_ops =3D {
> +	.owner =3D THIS_MODULE,
> +	.push_config =3D mei_late_bind_push_config, };
> +
> +static int mei_component_master_bind(struct device *dev) {
> +	return component_bind_all(dev, (void *)&mei_late_bind_ops); }
> +
> +static void mei_component_master_unbind(struct device *dev) {
> +	component_unbind_all(dev, (void *)&mei_late_bind_ops); }
> +
> +static const struct component_master_ops mei_component_master_ops =3D {
> +	.bind =3D mei_component_master_bind,
> +	.unbind =3D mei_component_master_unbind, };
> +
> +/**
> + * mei_late_bind_component_match - compare function for matching mei
> late bind.
> + *
> + *    The function checks if requested is Intel VGA device
> + *    and the parent of requester and the grand parent of mei_if are the=
 same
> + *    device.
This might be broken for headless card, headless care need to necessarily b=
e VGA card.
> + *
> + * @dev: master device
> + * @subcomponent: subcomponent to match
> (I915_COMPONENT_LATE_BIND)
> + * @data: compare data (mei late-bind bus device)
> + *
> + * Return:
> + * * 1 - if components match
> + * * 0 - otherwise
> + */
> +static int mei_late_bind_component_match(struct device *dev, int
> subcomponent,
> +					 void *data)
> +{
> +	struct device *base =3D data;
> +	struct pci_dev *pdev;
> +
> +	if (!dev)
> +		return 0;
> +
> +	if (!dev_is_pci(dev))
> +		return 0;
> +
> +	pdev =3D to_pci_dev(dev);
> +
> +	if (pdev->class !=3D (PCI_CLASS_DISPLAY_VGA << 8) ||
> +	    pdev->vendor !=3D PCI_VENDOR_ID_INTEL)
> +		return 0;
> +
> +	if (subcomponent !=3D I915_COMPONENT_LATE_BIND)
> +		return 0;
Why I915_COMPONENT_LATE_BIND ?
Isn't this should be XE_ COMPONENT_LATE_BIND.
> +
> +	base =3D base->parent;
> +	if (!base) /* mei device */
> +		return 0;
> +
> +	base =3D base->parent; /* pci device */
Is it sgunit pci endpoint ?=20
If yes then good to mention in comment.
> +
> +	return !!base && dev =3D=3D base;
> +}
> +
> +static int mei_late_bind_probe(struct mei_cl_device *cldev,
> +			       const struct mei_cl_device_id *id) {
> +	struct component_match *master_match =3D NULL;
> +	int ret;
> +
> +	component_match_add_typed(&cldev->dev, &master_match,
> +				  mei_late_bind_component_match, &cldev-
> >dev);
> +	if (IS_ERR_OR_NULL(master_match))
> +		return -ENOMEM;
> +
> +	ret =3D component_master_add_with_match(&cldev->dev,
> +					      &mei_component_master_ops,
> +					      master_match);
> +	if (ret < 0)
> +		dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static void mei_late_bind_remove(struct mei_cl_device *cldev) {
> +	component_master_del(&cldev->dev,
> &mei_component_master_ops); }
> +
> +#define MEI_GUID_MKHI UUID_LE(0xe2c2afa2, 0x3817, 0x4d19, \
> +			      0x9d, 0x95, 0x6, 0xb1, 0x6b, 0x58, 0x8a, 0x5d)
> +
> +static struct mei_cl_device_id mei_late_bind_tbl[] =3D {
> +	{ .uuid =3D MEI_GUID_MKHI, .version =3D MEI_CL_VERSION_ANY },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(mei, mei_late_bind_tbl);
> +
> +static struct mei_cl_driver mei_late_bind_driver =3D {
> +	.id_table =3D mei_late_bind_tbl,
> +	.name =3D KBUILD_MODNAME,
> +	.probe =3D mei_late_bind_probe,
> +	.remove	=3D mei_late_bind_remove,
> +};
> +
> +module_mei_cl_driver(mei_late_bind_driver);
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("MEI Late Binding");
> diff --git a/include/drm/intel/i915_component.h
> b/include/drm/intel/i915_component.h
> index 4ea3b17aa143..4945044d41e6 100644
> --- a/include/drm/intel/i915_component.h
> +++ b/include/drm/intel/i915_component.h
> @@ -31,6 +31,7 @@ enum i915_component_type {
>  	I915_COMPONENT_HDCP,
>  	I915_COMPONENT_PXP,
>  	I915_COMPONENT_GSC_PROXY,
> +	I915_COMPONENT_LATE_BIND,
We probably need a change here to make a xe specific component.

Thanks,
Anshuman Gupta.
>  };
>=20
>  /* MAX_PORT is the number of port
> diff --git a/include/drm/intel/late_bind_mei_interface.h
> b/include/drm/intel/late_bind_mei_interface.h
> new file mode 100644
> index 000000000000..6b54b8cec5ae
> --- /dev/null
> +++ b/include/drm/intel/late_bind_mei_interface.h=09
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (c) 2025 Intel Corporation  */
> +
> +#ifndef _LATE_BIND_MEI_INTERFACE_H_
> +#define _LATE_BIND_MEI_INTERFACE_H_
> +
> +#include <linux/types.h>
> +
> +struct device;
> +struct module;
> +
> +/**
> + * struct late_bind_component_ops - ops for Late Binding services.
> + * @owner: Module providing the ops
> + * @push_config: Sends a config to FW.
> + */
> +struct late_bind_component_ops {
> +	struct module *owner;
> +
> +	/**
> +	 * @push_config: Sends a config to FW.
> +	 * @dev: device struct corresponding to the mei device
> +	 * @type: payload type
> +	 * @flags: payload flags
> +	 * @payload: payload buffer
> +	 * @payload_size: payload buffer size
> +	 *
> +	 * Return: 0 success, negative errno value on transport failure,
> +	 *         positive status returned by FW
> +	 */
> +	int (*push_config)(struct device *dev, u32 type, u32 flags,
> +			   const void *payload, size_t payload_size); };
> +
> +#endif /* _LATE_BIND_MEI_INTERFACE_H_ */
> --
> 2.34.1

