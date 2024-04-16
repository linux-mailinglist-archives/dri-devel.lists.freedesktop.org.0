Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 862298A660B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 10:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D0D112AEC;
	Tue, 16 Apr 2024 08:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RbDWI7sq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9879112AEB;
 Tue, 16 Apr 2024 08:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713255879; x=1744791879;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=18jMRcrIyuYST7vsbDvd2f6fw1ojsS4ukZtACef75A4=;
 b=RbDWI7sqMc1PlKWM1ajrLs0QTEO+e/EbYV681t3nyOzfZvfONDuv/R+J
 3aHl4D6gH4Lpj+qfASF8q18rQuzAwNUwyRSQXeUK6bSG+GdELhT9W0Ovs
 Iw5nNd7sEl26TbwguxuUUhFKuJegxCnjWNXaOtiKJnV74msXq5BXy384G
 7TjYdrlqU0WJdTFmyxPbLfc+1rTmaCJ5QWMZGsK9I93pWiTTI7WsYXzZs
 b5bKeCP8NvdaqgKnVJCW2mmW+sgIinrPohJjPZvMSo4UXouzlidVHFokr
 rPaF8ZSJ8Uv6a67SEnQKJXngkIX2XG0+zI0H7QU2BEuEHWM9h4oAxseX3 A==;
X-CSE-ConnectionGUID: rdlTdchvQwyuX967NZZlzQ==
X-CSE-MsgGUID: 41wT2s0XSeyaWKwuXK/Gaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8543191"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8543191"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 01:24:15 -0700
X-CSE-ConnectionGUID: ZO3D58CeQzGwN5cnBgZpVw==
X-CSE-MsgGUID: tBs2T85BQzyyvHBBObTjyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="26972745"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 01:24:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 01:24:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 01:24:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 01:24:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 01:24:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmz7U80YPiXQWeytF79H2TFmTKy6SpFLtCZQmWFhpMipefGaHBK/I/pEYHo1ISOApzM5tlfgNh/mBqXxApPWzsEc7pUAsjFi8Tt3fHjD0YjOAzEcAWq3f2Nvpo+7IARsZQjCTIrTRCumwqaCIrn/ElGx+D9jyiOpYFs0NsJCQCK+wavrjAarwNjgUt+XJGk9nTS7GZCGSAjk4kCVFGQgQvQ7f1q3+7c5+O6zBZQR1//9ytI+V2Vk8QKs8Yap7E+ePIE7dbjTp4hCv0lKMRAw8GOteqMHFP38EKRdk78GqPQQHxuJdeccwkDXRH6TP4ewXO3dAk4gaFK+wLRprhM9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DV3Xt1K/JOBdm70lNbXCgrsr8Ez01xbOuak1QZnLmM=;
 b=R9AJFFlXenvzdjANbusGAZaYR5js9hX8TJF5/k1Ypz5bbd2kSLOkfrChGorAQ6OlSFEJCLZ08xxGDdscRKipOXZYvYzJmvExYwUuFeb0q3pE/JG11s7Y2SgA4cfAgv7cpt+y/m2JKIFyPvbAHeOFYTrNJFdSFBc2Rp4qttx+VL9HoEpwWeGq5gwRhsYmDJ4cNEngtXtnvQFt8FdAjpQn3IDCuWGxMYCvDoJb12FXt6oRWn3EUEjTvJ6DxeeJ7FOk+v7BaEYEAqaOEfKi/GizGnsJVCJIXEf5m0szEwNEXS/+fTb/N0CsrQ5TH4AtlvECXJi3RPQ3Xp7TpDo+EV8CKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 by CO1PR11MB4964.namprd11.prod.outlook.com (2603:10b6:303:9e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.27; Tue, 16 Apr
 2024 08:24:12 +0000
Received: from PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::8970:61a2:f00d:b23f]) by PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::8970:61a2:f00d:b23f%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 08:24:12 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH v2 4/6] drm/i915/alpm: Add compute config for lobf
Thread-Topic: [PATCH v2 4/6] drm/i915/alpm: Add compute config for lobf
Thread-Index: AQHajPOwn2OS5NbU/0+Z8AAK5rr3PLFpO5sAgAFZBsA=
Date: Tue, 16 Apr 2024 08:24:12 +0000
Message-ID: <PH7PR11MB5981E01E44092DDDE5426556F9082@PH7PR11MB5981.namprd11.prod.outlook.com>
References: <20240412155243.2891996-1-animesh.manna@intel.com>
 <20240412155243.2891996-5-animesh.manna@intel.com> <87y19e3l03.fsf@intel.com>
In-Reply-To: <87y19e3l03.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5981:EE_|CO1PR11MB4964:EE_
x-ms-office365-filtering-correlation-id: 85134f08-74e2-4fb2-a970-08dc5dee98b4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s7cRjFJ7gAd5NwcpAqgTx3Q9CTS5tNq4OYPY7CeotSQyO5kimbpEz9pxaV8MqnWg4eS0z3EtwAwOFzavL58FerLLePZDUbntZHKJAuKcG4t3e63QTVdwO3e0r9bo2aKpWUcAnypWfPU0WthNp4kiKIw1CwpIiUtH3z46iMOsshPtwosDRO4P62lN8wSgu6gQWoBp6RI+4e4ORV/Z4ZF7AhnKVSU7TnvKz7fJv60lWCiIasWr7e3P0GdqB81iLZuqfwTeVp7cEFL1Xfz4lxbSeNiwwUriwfAFkewBrsevMk6z8n3cGscOIaMJuuIJT6l5xgYyXcWpOqTRn3eDYf96fgsbVWjZlQ8iAgKkpCxgn6ejZfiKd7GpnHZ1iWn28ELmu0+dEMA5XDMioMY3WkXJ5WeWg7ge9u7ID153azPifze/62y+Eckl6EIf50o5wOJY3LipWoxZZOt8AGFi9cFT5HOS5TTtI3djwczKekkVj1wzfSA98fh8yqp9+LXEh3DyCglTXVXC6qwx9KvNCYQLZTv+VtVqS9DZhLkMBUl0wHWqRtds2/UUD2UsAXWbr8kp3QDO2TeNDdOiefZjPeanOZqdRirTg6KLBj+qwUXCuWbhaEDrvnA6hMsD5vaexEpueYyL3xfVpWPQIgf30VNeQjDbFdBnEkrc5h53zPTAfaY8BTkgyrq+JJQrzYTCtm6RnsxRcf+aawBnumKp2vEUXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5981.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bxI+Sgv/n0tp9lRpE9Q/pV/wc/ETo+sG9R0VgCqGhr/Rr/24oc3XtZFitb5Y?=
 =?us-ascii?Q?Dz0y6VI2xldrvwNs9jTsB2dQveWPqdxGwn04f0KcrXxBAsiM228Y1b9oMeJx?=
 =?us-ascii?Q?bsxAk2FBagYxgFbyZshHUGbvcAMXmBaJuhJN/pHrYRaHKeKPMDSgdI4iDw47?=
 =?us-ascii?Q?lLSlySGwMAdoc+0/D/nZ0xJ1cd1AHVjOXk16cseG/Zu95CY7nQya9JsIDg27?=
 =?us-ascii?Q?9ZNQkELCyyQ1J3eekr7EMgJqXwd7aNM876A5h+MUVJwEmMjTGtE1/2uUIqyL?=
 =?us-ascii?Q?l9cB7mXiK4tZPTsWjsoSl53DE8TCh6ZL8aGfcHGldP0egjdacA3KavuFGJ/H?=
 =?us-ascii?Q?cDkfqnhd2aM8UVk4ExmmAfGtG+jT/KzepV0VPe+ypMKIpepftVy6OC0kgY08?=
 =?us-ascii?Q?d2BP1SBMlNpXV+FwehIlERl8pc8E1KpHwiR1N13LBTAl2VcdaNY54qzWBhdO?=
 =?us-ascii?Q?urK1BfWQ77dlYenu9FzWz8lMFUn2gdAGb8J2mkfop9hxWNK7rg4VCz2CtU9y?=
 =?us-ascii?Q?GjCy3QnncZVck0ePFRDvOqqwfXIByctp1JHfMgIwMwzPPT5qJ69UlcmVD4sw?=
 =?us-ascii?Q?q+UiVIgRsqLpvmdxFUzMEl70gsAntGInhqcsg2U7FmU9KwGAkd0vN7FBK1E2?=
 =?us-ascii?Q?po7Yhe8NJHAuPaayBbHHVfpoKsknENbcwfo6sBIYm0FaFBrZeUboKhpq9/EP?=
 =?us-ascii?Q?jJlA8MQzPYDGpXcKK9Q9lkrMzdN363jEhMPt9snwEmIb8oOBmqulAqVrLQ91?=
 =?us-ascii?Q?vkBh85MZpSjcmCWN8Bm+YUvgXLNe5Q1Pgvhk/98tpHcY36ZJDqiUXnrFnzkk?=
 =?us-ascii?Q?OXpAMGxFa/UaUQL+v0y9LqaACtBiNTuJv1/yaKE/lOiBrNMH/eGsHkbP8fEB?=
 =?us-ascii?Q?n0mGD/Yo8iaM8i1cpA3VNdnu30AHnVLs7ov7951RxMr9t+swYL3j1WhCv9vs?=
 =?us-ascii?Q?KdzR56XI30vAENBwWW1LOinUEad0XW8qbAMyM+jc7M43+ZMXcJmC5YFKLuJN?=
 =?us-ascii?Q?LYmOYZouaWsIhx6WVbgGEsYwTy66pIwF3lJuV3OkzQs3UFeedA8jUh0SEFk6?=
 =?us-ascii?Q?mcaWRH5bVsTMRAPOHACGz2WoAxizdGCjHcwFOoKDWgx1FH7VVIKLeyyKX/jL?=
 =?us-ascii?Q?HL0ZKFpKTqqJpvfR91mlcBM0f23sxuOHRlfiJ4pueJNnDXH8jXn6YgrQbZID?=
 =?us-ascii?Q?nMNlE9uVQYmRH7m63qpwY/aSgVWlRU/CTMGyCRn78sRqEr+dz3QnLrQaeYa5?=
 =?us-ascii?Q?i++rrzsS9DZDDTC3YOMSSicUS9Y9CcPpZFrgLos3bUgSJTdblrFKM39hqls4?=
 =?us-ascii?Q?WfFVpe/Qj6QcMqxHyZvluF6kDN9mJJlBvUQA6x5lL+/wCZv0TulCP7IDNhJS?=
 =?us-ascii?Q?ynHRKIl+nSOuytDID8+c4WIVTBKS5eGeiYMJ+l//6tRp23SlheMfQ8fgf0UE?=
 =?us-ascii?Q?ZS/H3cE74cyVQFv7cnCW8tkEkicn85YApiZqURWhlpjB0iCKG2wyrjc/vN8I?=
 =?us-ascii?Q?5fHIQ35TXxeoDa73NGGNBPyRVOlHusFAjKyi04KRaOd4NQqVBxDUHUhUcUh5?=
 =?us-ascii?Q?rERWozKAXrkHEwQvAcLuI1UUGfrr5Xj1Wbb7Xlk9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85134f08-74e2-4fb2-a970-08dc5dee98b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 08:24:12.5182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bp1OJZuN7/boUWoGitT8UffXEub6dx9ogy4n5lN+LnmBFr2lOjEoHKS6+hx0XysVUrCekgvWRE0fS6aynNTWmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4964
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
> Sent: Monday, April 15, 2024 5:18 PM
> To: Manna, Animesh <animesh.manna@intel.com>; intel-
> gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Hogander, Jouni
> <jouni.hogander@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>;
> Manna, Animesh <animesh.manna@intel.com>
> Subject: Re: [PATCH v2 4/6] drm/i915/alpm: Add compute config for lobf
>=20
> On Fri, 12 Apr 2024, Animesh Manna <animesh.manna@intel.com> wrote:
> > diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h
> > b/drivers/gpu/drm/i915/display/intel_alpm.h
> > index c45d078e5a6b..c341d2c2b7f7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_alpm.h
> > +++ b/drivers/gpu/drm/i915/display/intel_alpm.h
> > @@ -10,9 +10,14 @@
> >
> >  struct intel_dp;
> >  struct intel_crtc_state;
> > +struct drm_connector_state;
> >
> > +bool intel_dp_get_aux_less_alpm_status(struct intel_dp *intel_dp);
>=20
> The names here are supposed to be intel_alpm_*. Is the function in the
> wrong place or is the name wrong?

Sure, will change the function name to intel_alpm_get_auxless_status().

Regards,
Animesh
>=20
> BR,
> Jani.
>=20
> >  bool intel_alpm_compute_params(struct intel_dp *intel_dp,
> >  			       struct intel_crtc_state *crtc_state);
> > +void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
> > +				    struct intel_crtc_state *crtc_state,
> > +				    struct drm_connector_state *conn_state);
> >  void intel_alpm_configure(struct intel_dp *intel_dp);
> >
> >  #endif
>=20
> --
> Jani Nikula, Intel
