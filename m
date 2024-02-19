Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E1E85A110
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 11:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E605910E160;
	Mon, 19 Feb 2024 10:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsdKzU8+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E0610E160;
 Mon, 19 Feb 2024 10:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708338869; x=1739874869;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CAcNObnrUu2riRuqd43rMDN3FjZH0Tt+ba9Lexs182w=;
 b=gsdKzU8+uRHEZruajkaFvootCKU1Gm4fflVoplSJv1LdXuqoskq1hks/
 F6vDxlfGFQCBvzuVPou96oqlCEUYqEdPBt7wR9r5eCygfyngAgNrYb2s/
 Q053WF8nBrZnWO3xsMqeq2FGAdYifNhEFf3YItRORZMd4RO9rTzu9lU5S
 Pz9LBbjClEn6rYhwqMzHT7y4hN2jZQNIRHmiz27TlH2SsH73sFpaNcopy
 AbtQ3HmZ2z0ADNDl3TkGgcMll5ntFeUVWx5V+HatIQs7fM6yaGK2sScGS
 H0QS752OXBKcS+GrET2udy1nHr5FCJi0HfYBYTAtR3MIst9WlxxhLaCNc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2274830"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2274830"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 02:34:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4839208"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 02:34:23 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 02:34:22 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 02:34:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 02:34:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cY13ldyp/wEgsqv3gUPpLdBFatci2pCsZNVO5CyFKwCfBSA9Tc1D9n8OKHjrnUKitKjMGysNR5hbIel8JPEvsDa+mJIhHDCJXa7s4W606sjnyDGqClR27cSieJaapScLUjMWAkpvsQA9D8+5dsbSUP9HXUBKbr6igZwGPKEKsRsJqM51ARxnXYMqhY9UeYt5oX2ndHyRsXm6zSXqHY7oYD8d5B0XUKNWg0Wv+k8qISmCbMD6AxmstyvBKI9HfXOrCr2yxb9V+0YDJuRoPTZJvWnm4BQ3wDfc0JhR0gAD6MAVrv83YvwkEyVik97E6sUhaAra/NXoaL66N2TE8JCc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVnjQHOnsb26sbcqPwfK2qEBozj3rEaSvJJ6DHcixr0=;
 b=d/5rxjQDmHUDQAO/W+uGpfarxoOXaBTsDJzYc81I84rlGc4VYpjMzzj1U+MsHouk0JAkFshihvknodaIf6XAhV9hD50vuWnFtdFB6VDqJhc7VCvNKF7aJRzbL1IvO7VPNXPgEJ2ns5HZfQ3gu0RavkjOxSev2rBddle8ey5TuxCDoJeM8fCPHQZHa+8/pAnKQq8LEljBEAwhEkuToHHeinsszqfHlIXWjZaRu9TbGi8yOTktKYHTeToqpwcdRdhqUnnZoSe3JFgBJxN2M53JyGRnhZAxq59NKnCjW25PBZjpUQkBo/bc0w2YObS4N5Mp93Y5i38roO4Jotx5jGlcJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CY5PR11MB6090.namprd11.prod.outlook.com (2603:10b6:930:2e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.38; Mon, 19 Feb 2024 10:34:20 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7292.033; Mon, 19 Feb 2024
 10:34:20 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "agoins@nvidia.com" <agoins@nvidia.com>,
 "joshua@froggi.es" <joshua@froggi.es>, "mdaenzer@redhat.com"
 <mdaenzer@redhat.com>, "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, "victoria@system76.com"
 <victoria@system76.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "arthurgrillo@riseup.net" <arthurgrillo@riseup.net>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>, "sean@poorly.run"
 <sean@poorly.run>
Subject: RE: [PATCH 17/28] drm/i915: Define segmented Lut and add capabilities
 to colorop
Thread-Topic: [PATCH 17/28] drm/i915: Define segmented Lut and add
 capabilities to colorop
Thread-Index: AQHaXkfVkkDkY662rUmdCzLQ2yntRrEIA/OAgAFlVTCAACOPAIAH75ow
Date: Mon, 19 Feb 2024 10:34:19 +0000
Message-ID: <DM4PR11MB63603152935C305151D259AFF4512@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
 <20240213064835.139464-18-uma.shankar@intel.com>
 <20240213113727.22f9c8e5@eldfell>
 <DM4PR11MB636037556D1EF1ACC2A70629F44E2@DM4PR11MB6360.namprd11.prod.outlook.com>
 <20240214110340.477e9df3@eldfell>
In-Reply-To: <20240214110340.477e9df3@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CY5PR11MB6090:EE_
x-ms-office365-filtering-correlation-id: 208580cb-e7fa-43b7-fc47-08dc313654ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tX/K1kGPQmn3cH6USnvRZzgD6u/qJo17X1y9BwZXPAhu7g2Lq13v8vRbApvt7V1XPTvzEJymKiyIRPWzTqXaY1INWeY+vWJAuKY5CbnOFBlw214lO3pn6C1sHckBNdOAwBddVk9nzAF9TRAnVl7DZxC0tMf2SopSGEvVFRdrQYWs1/c/OaWp5Wg/QXLyEJgYyeAe02TinNY9JdXevrutUIeNO5EGc9yjD6h3eLOYgtoH5LSA2zpNYno6xwSuD/kI36Yq0tjSy13dZbgBTXXVlc3DGL+OPKrq/RE6NCFvqw07f5fnkySHkbK/gbEf6xB9GApR5My0hU5aCFgrbLsIZZxTTQX/rYbpmtwBdmE/ZkEiQlGJ0c4PdQnZOqdSpNJ5137B9CJumGFuMnyLp5BtM6/nY4v1BWyOw65fv/dJdQZQqGsGTwm2wqZk0VaDtrU6j+tXW8XAV/wxvUM/81JpoGoQoLjJtqiEUU8+OOcASSt8+wddL2tTVyYgZDTVP18cu1FBADzPSjSz6uxmCIhrgRt3A8SdZWcLa+tRt4NbmUe9hld9s3ZkMCvVHRwRtnqCZgJGqp9CVBkqTRaXngFtNZhcKbU7vioLjhbNIgT04wq/1TCaoaK5PiqxErpD1MYo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pyhPzIPzhrfgvCsPXOoQDep6IqE4l6U/ANHgJx2IXe2f6PvDZZYZ18+j8wkl?=
 =?us-ascii?Q?0fF+YWFVAdz7fMQE3glzamSvmduzdVWbsU2FjV/87W59NhGV5ljgnm/Cr92Q?=
 =?us-ascii?Q?WCyF+6PW/WbhXpuMp4wG7rKJg1PPJN6WFElaG7Eq5QC3BYJpyC4pErxtijx9?=
 =?us-ascii?Q?ttQXWK7QGPSiW1RYfP85vodspEATRub8wpp1y8YijejLGRlU8hI0YEBYEtPE?=
 =?us-ascii?Q?31zxCbQ+8FNOwKR32Lo5t1nFCij68Z0/vA0OrU9ZTr6KhhB6GTv2RfdaUhTq?=
 =?us-ascii?Q?bCtXfYAYvvywB6BCnfeiuTrxwu7KpAoTPcPaMjpsaKLoqADtt87BMG+TplU9?=
 =?us-ascii?Q?PrCQklVSVkuADb1YwViJiXH3ctvMfZxo4HtcHYuWMD6lPt4aGITfRG3RP5c4?=
 =?us-ascii?Q?R2fGoM/mh86ayrgUvLYefblV4Yt13sL5Jvs8KUNhCHLg9+nupfSTusjIoEV9?=
 =?us-ascii?Q?VHam691ai/O3INFEmqtoQ981e0r6AxjSfWIsxxfOjDJGhQsWfLdxsLD2h1Wf?=
 =?us-ascii?Q?gUyGRwtd5vv6RF/EykkgbwSAsGa/xD/QeRd2WIOTA1uaZ7kr1//TLxhFIyzF?=
 =?us-ascii?Q?LpH/GyL+UrJSqA4t7CDKZTbV6dvXVA8SEIXmJP9gpfj2KcpDIE65lIdaSVzJ?=
 =?us-ascii?Q?pfszq2Dpslemp8sUapFrskVh+osdc5BR8A+ynqQoh6nfecE7QBMSoNzZ4NXs?=
 =?us-ascii?Q?xdHCpDaIAUvOeg301UGsjHdzeNXk4Piql8X4FvlVcAz71sIWDpH48ZrRtkyY?=
 =?us-ascii?Q?nbE3ysnSE7Fxl3s0RQRMVBgReGaJC2a16IVAc8wpCuKQXq/QvxBux4M3PGQ8?=
 =?us-ascii?Q?pKBOhjODTNM4PGtjqHx6JQpCyZTh5w6P6KQDIZhMAuZxcAn2u1RdUFiKX9kO?=
 =?us-ascii?Q?jyAbsq90mhT3F073DWCSyaIDl0aXztZkCyP4oYSSZ3ScqVxfjQYKaDDMtawR?=
 =?us-ascii?Q?mLvCZJwG/yPhnUZbzYIxrKaXKc6TPAxkQgCOzPtC0aLQDmCssiT8fhfw1aox?=
 =?us-ascii?Q?w9VCciITXbKOvJ39JSBavwBDl/kir473zNxWN/8H3L5h0ujZVgwE/NqnJsBR?=
 =?us-ascii?Q?aUu1ayMj5P4LewyvaSy9IZe11OtT3cSklpVcxJgBCHlpU0XBZOspJv3cv28f?=
 =?us-ascii?Q?8S9JCTWIteR8xX9Bl2f5QbyVAuqA+x9q8v4vC10jokzqo8dkCzqwZCef/tHw?=
 =?us-ascii?Q?BOaDK5WlIc4Yvm6xeVHh07pxEZVIpFmWJmBbOjjuOjh/Pf8YbUMsKSInLg6i?=
 =?us-ascii?Q?xZnao/M2hSxdW6UvhofeAKerEQChp/TtX2JuxQ/CPilD8Uq9cBm5Oeg2Kgvz?=
 =?us-ascii?Q?3EFnU4K+Q0N7XmOuRXREpoFsbffn0NQ/epWb3lkPa69+ZUnb3t260B5dSTRv?=
 =?us-ascii?Q?ZOgR3c7QTKyNdjCXIIXh4/Ow5ohHK1ZYbIere0YT31poC1WOnsK4Ppfuaydv?=
 =?us-ascii?Q?crtot0qpO3ufkNbrUI2295PYATHhlCHw3tm3/yXo08aIwccCMuDLRb2MhnHE?=
 =?us-ascii?Q?O3XA2Vv4ZReRGwu4ZzQVJE2PFQZuuy8M3Y9vZ7SNEFBGqXJikfJVyO3ahj/d?=
 =?us-ascii?Q?QiEMpWn4UrupE1oUzQO1LRHI4+RlhUzu8AjV122C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208580cb-e7fa-43b7-fc47-08dc313654ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2024 10:34:20.0113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PrBHO7csHdsPmrF5TQ6rC6P2rIBrI8TgxXGHLrSKMhSFiALLZe53bz5XvJbJ7oonKNpIdXoHkLZSjy0DcW362A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6090
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
> From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> Sent: Wednesday, February 14, 2024 2:34 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: ville.syrjala@linux.intel.com; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; contact@emersion.fr; harry.wentland@amd.com;
> mwen@igalia.com; jadahl@redhat.com; sebastian.wick@redhat.com;
> shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> victoria@system76.com; daniel@ffwll.ch; quic_naseer@quicinc.com;
> quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com; arthurgrillo@riseup.n=
et;
> marcan@marcan.st; Liviu.Dudau@arm.com; sashamcintosh@google.com;
> sean@poorly.run
> Subject: Re: [PATCH 17/28] drm/i915: Define segmented Lut and add capabil=
ities
> to colorop
>=20
> On Wed, 14 Feb 2024 07:28:37 +0000
> "Shankar, Uma" <uma.shankar@intel.com> wrote:
>=20
> > > -----Original Message-----
> > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf
> > > Of Pekka Paalanen
> > > Sent: Tuesday, February 13, 2024 3:07 PM
> > > To: Shankar, Uma <uma.shankar@intel.com>
> > > Cc: intel-gfx@lists.freedesktop.org;
> > > dri-devel@lists.freedesktop.org; ville.syrjala@linux.intel.com;
> > > contact@emersion.fr; harry.wentland@amd.com; mwen@igalia.com;
> > > jadahl@redhat.com; sebastian.wick@redhat.com;
> > > shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> > > mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> > > victoria@system76.com; daniel@ffwll.ch; quic_naseer@quicinc.com;
> > > quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com;
> > > arthurgrillo@riseup.net; marcan@marcan.st; Liviu.Dudau@arm.com;
> > > sashamcintosh@google.com; sean@poorly.run
> > > Subject: Re: [PATCH 17/28] drm/i915: Define segmented Lut and add
> > > capabilities to colorop
> > >
> > > On Tue, 13 Feb 2024 12:18:24 +0530
> > > Uma Shankar <uma.shankar@intel.com> wrote:
> > >
> > > > This defines the lut segments and create the color pipeline
> > > >
> > > > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > > Signed-off-by: Chaitanya Kumar Borah
> > > > <chaitanya.kumar.borah@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/display/intel_color.c | 109
> > > > +++++++++++++++++++++
> > > >  1 file changed, 109 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> > > > b/drivers/gpu/drm/i915/display/intel_color.c
> > > > index e223edbe4c13..223cd1ff7291 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > > > @@ -3811,6 +3811,105 @@ static const struct intel_color_funcs
> > > ilk_color_funcs =3D {
> > > >  	.get_config =3D ilk_get_config,
> > > >  };
> > > >
> > > > +static const struct drm_color_lut_range xelpd_degamma_hdr[] =3D {
> > > > +	/* segment 1 */
> > > > +	{
> > > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > > +				DRM_MODE_LUT_INTERPOLATE |
> > > > +				DRM_MODE_LUT_NON_DECREASING),
> > >
> > > Hi Uma,
> > >
> > > is it a good idea to have these flags per-segment?
> > >
> > > I would find it very strange, unusable really, if REFLECT_NEGATIVE
> > > applied on some but not all segments, for example. Is such
> > > flexibility really necessary in the hardware description?
> >
> > Hi Pekka,
> > Idea to have these flags is to just have some option in case there are
> > some differences across segments. Most cases this should not be the
> > case, just helps to future proof the implementation.
> >
> > Based on how the community feels on the usability of it, we can take a
> > call on the flags and the expected interpretation for the same. We are =
open for
> suggestions on the same.
> >
> > >
> > > > +		.count =3D 128,
> > > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > >
> > > The same question about input_bpc and output_bpc.
> >
> > Same for these as well, userspace can just ignore these if no usage.
> > However, for some clients it may help in Lut computations.
> > The original idea for the structure came from Ville (missed to mention
> > that in cover letter, will get that updated in next version).
> >
> > @ville.syrjala@linux.intel.com Please share your inputs on the usabilit=
y of these
> attributes.
>=20
> Userspace will always need to evaluate whether each segment is good enoug=
h
> individually, so maybe it's not that big deal.
>=20
> Ignoring these is not an option for userspace, because that would mean us=
erspace
> does not know what it is getting. If UAPI contains a parameter, then the =
onus is on
> userspace to ensure the value is acceptable.

Got your point, the parameters, and expectations with it should be clearly =
defined.
Here it just means what is the bpc which is fed to the color block and at w=
hat bpc
results come out after rounding and truncation. This information may help i=
n
computing the LUT co-efficients and get better accuracy.

Having said that, we are not using it as of now in the IGT tests. We can di=
scuss the
usability and usefulness of this attribute for userspace, based on recommen=
dation
we can adopt or drop this.


> > > > +		.start =3D 0, .end =3D (1 << 24) - 1,
> > > > +		.min =3D 0, .max =3D (1 << 24) - 1,
> > > > +	},
> > > > +	/* segment 2 */
> > > > +	{
> > > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > > +				DRM_MODE_LUT_INTERPOLATE |
> > > > +				DRM_MODE_LUT_REUSE_LAST |
> > > > +				DRM_MODE_LUT_NON_DECREASING),
> > > > +		.count =3D 1,
> > > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > > +		.start =3D (1 << 24) - 1, .end =3D 1 << 24,
> > >
> > > What if there is a gap or overlap between the previous segment .end
> > > and the next segment .start? Is it forbidden? Will the kernel common
> > > code verify that drivers don't make mistakes? Or IGT?
> >
> > This is just to help give some reference to userspace.  As of now,
> > driver trusts the values coming from userspace if it sends wrong values=
 its on
> him and driver can't help much.
> > However, we surely can have some sanity check like non decreasing luts =
etc. to
> driver.
>=20
> But what will guarantee that the driver provided values are consistent?
> That they actually describe a template of a well-formed sampled curve? If=
 they
> are not consistent, userspace cannot use the colorop.
> Whose responsibility is it to ensure the consistency?

Since the driver will be privileged, I guess userspace should believe the v=
alues are
sane as reported by the properties. This is as for any other hardware capab=
ilities.
Also, its immutable so userspace will not be able to tweak it making it saf=
e.

> We have a few examples of drivers getting descriptive values like these s=
imply
> wrong until DRM common code started sanity-checking them, the bitmasks of
> possible_clones and possible_crtcs for example.

We can implement some helpers to catch basic abnormalities with LUT reporti=
ng
while property creation itself.  Like decreasing luts, not matching the rep=
orted flags etc.

> There should also be DRM common code to verify that userspace provided da=
ta
> matches the segmented LUT description rather than drivers just trusting i=
t. If it
> doesn't match, the atomic commit must fail rather than silently malfuncti=
on. The
> same with programming hardware: if hardware does not produce the intended
> result from a given segmented LUT configuration, the atomic commit must f=
ail
> instead of malfunction.

Yes, we can have some checks in driver for sanity of userspace provided val=
ues.
Things like LUTs not following the flags and capabilities reported, going b=
eyond
the range etc. However the actual values and computation of the same has to=
 be
userspace responsibility, if the co-efficients go wrong then responsibility=
 of the artifact
should be on the client/compositor who is controlling it (permission can be=
 controlled
so that only allowed userspace can be able to change color setttings)

> >
> > Ideally LUT values should not overlap, but we can indicate this
> > explicitly with flag to hint the userspace (for overlap or otherwise) a=
nd also get
> a check in driver for the same.
>=20
> Sorry? How could overlapping segments ever work? Or segments with a gap
> between them?

I have not seen overlapping luts in segments, we can take a call if all ven=
dors align.

> If segments overlap, what's the rule for choosing which segment to use fo=
r an
> input value hitting both? The segments can disagree on the result.
>=20
> If there are gaps, what is the rule how to handle an input value hitting =
a gap?

This can be brainstormed, if any usescase like this exists.

Regards,
Uma Shankar

>=20
> Thanks,
> pq
>=20
> >
> > Regards,
> > Uma Shankar
> >
> > >
> > > Thanks,
> > > pq
> > >
> > > > +		.min =3D 0, .max =3D (1 << 27) - 1,
> > > > +	},
> > > > +	/* Segment 3 */
> > > > +	{
> > > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > > +				DRM_MODE_LUT_INTERPOLATE |
> > > > +				DRM_MODE_LUT_REUSE_LAST |
> > > > +				DRM_MODE_LUT_NON_DECREASING),
> > > > +		.count =3D 1,
> > > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > > +		.start =3D 1 << 24, .end =3D 3 << 24,
> > > > +		.min =3D 0, .max =3D (1 << 27) - 1,
> > > > +	},
> > > > +	/* Segment 4 */
> > > > +	{
> > > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > > +				DRM_MODE_LUT_INTERPOLATE |
> > > > +				DRM_MODE_LUT_REUSE_LAST |
> > > > +				DRM_MODE_LUT_NON_DECREASING),
> > > > +		.count =3D 1,
> > > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > > +		.start =3D 3 << 24, .end =3D 7 << 24,
> > > > +		.min =3D 0, .max =3D (1 << 27) - 1,
> > > > +	}
> > > > +};
> > > > +
> > > > +/* FIXME input bpc? */
> > > > +static const struct drm_color_lut_range xelpd_gamma_hdr[] =3D {
> > > > +	/*
> > > > +	 * ToDo: Add Segment 1
> > > > +	 * There is an optional fine segment added with 9 lut values
> > > > +	 * Will be added later
> > > > +	 */
> > > > +
> > > > +	/* segment 2 */
> > > > +	{
> > > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > > +				DRM_MODE_LUT_INTERPOLATE |
> > > > +				DRM_MODE_LUT_NON_DECREASING),
> > > > +		.count =3D 32,
> > > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > > +		.start =3D 0, .end =3D (1 << 24) - 1,
> > > > +		.min =3D 0, .max =3D (1 << 24) - 1,
> > > > +	},
> > > > +	/* segment 3 */
> > > > +	{
> > > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > > +				DRM_MODE_LUT_INTERPOLATE |
> > > > +				DRM_MODE_LUT_REUSE_LAST |
> > > > +				DRM_MODE_LUT_NON_DECREASING),
> > > > +		.count =3D 1,
> > > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > > +		.start =3D (1 << 24) - 1, .end =3D 1 << 24,
> > > > +		.min =3D 0, .max =3D 1 << 24,
> > > > +	},
> > > > +	/* Segment 4 */
> > > > +	{
> > > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > > +				DRM_MODE_LUT_INTERPOLATE |
> > > > +				DRM_MODE_LUT_REUSE_LAST |
> > > > +				DRM_MODE_LUT_NON_DECREASING),
> > > > +		.count =3D 1,
> > > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > > +		.start =3D 1 << 24, .end =3D 3 << 24,
> > > > +		.min =3D 0, .max =3D (3 << 24),
> > > > +	},
> > > > +	/* Segment 5 */
> > > > +	{
> > > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > > +				DRM_MODE_LUT_INTERPOLATE |
> > > > +				DRM_MODE_LUT_REUSE_LAST |
> > > > +				DRM_MODE_LUT_NON_DECREASING),
> > > > +		.count =3D 1,
> > > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > > +		.start =3D 3 << 24, .end =3D 7 << 24,
> > > > +		.min =3D 0, .max =3D (7 << 24),
> > > > +	},
> > > > +};
> > > > +
> > > >  /* TODO: Move to another file */
> > > >  struct intel_plane_colorop *intel_colorop_alloc(void)  { @@
> > > > -3865,6
> > > > +3964,11 @@ int intel_plane_tf_pipeline_init(struct drm_plane
> > > > +*plane, struct
> > > drm_prop_enum_l
> > > >  	if (ret)
> > > >  		return ret;
> > > >
> > > > +	if (icl_is_hdr_plane(i915, to_intel_plane(plane)->id)) {
> > > > +		drm_colorop_lutcaps_init(&colorop->base, plane,
> > > xelpd_degamma_hdr,
> > > > +					 sizeof(xelpd_degamma_hdr));
> > > > +	}
> > > > +
> > > >  	list->type =3D colorop->base.base.id;
> > > >  	list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d",
> > > > colorop->base.base.id);
> > > >
> > > > @@ -3886,6 +3990,11 @@ int intel_plane_tf_pipeline_init(struct
> > > > drm_plane
> > > *plane, struct drm_prop_enum_l
> > > >  	if (ret)
> > > >  		return ret;
> > > >
> > > > +	if (icl_is_hdr_plane(i915, to_intel_plane(plane)->id)) {
> > > > +		drm_colorop_lutcaps_init(&colorop->base, plane,
> > > xelpd_gamma_hdr,
> > > > +					 sizeof(xelpd_gamma_hdr));
> > > > +	}
> > > > +
> > > >  	drm_colorop_set_next_property(prev_op, &colorop->base);
> > > >
> > > >  	return 0;
> >

