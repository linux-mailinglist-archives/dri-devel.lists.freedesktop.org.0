Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC690E946
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 13:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4C410E17D;
	Wed, 19 Jun 2024 11:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGNMjD71";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FA210E144;
 Wed, 19 Jun 2024 11:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718796239; x=1750332239;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kTdgbtlQLEGd6Rdz/qykGJu8nzm57udqBcXlRT/3sWI=;
 b=mGNMjD71Yv0zmmp0ykzeh1+os+o9OpYBdql1e8CCtw8m9koiSAfUSILH
 oadHUaIny68zz72DyEEkDrvABpWCoNm1m6zfZCYTcxwxeKHpI9ROEfmd2
 WBARcQaRayG6ylBuPDn+c8OBM930xWERLbni64SCfQk+DJLxziV+bIglq
 Kfly2XjZ72eQwA4xQ12gR5jYKYQ51UfRzFoQWECa9dvcq+JkNs/rWx4qr
 UN3gqnDbnft9e+HViGtPPOfeQenDcJtvf+Blt11FXSXTcIJohZeuuwJYt
 19BbRyFV/DL3h89ilYr3l0lXdn1O4PFwWYEr2jl3VAiIid7g9ANmQoBN+ g==;
X-CSE-ConnectionGUID: pOJaiYJuSji3Je7jiwgkCQ==
X-CSE-MsgGUID: 6+o45F0SRP2oAGrHnovrig==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15848421"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="15848421"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 04:23:50 -0700
X-CSE-ConnectionGUID: KIObidwHRXi/2yxCkZ2iGA==
X-CSE-MsgGUID: DlpnEjQ5Scy6S5yaOHMYrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="73087697"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 04:23:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 04:23:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 04:23:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 04:23:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 04:23:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cd9cykKvThoMmG/awAM3ehVicHqLQ7yBSof6kyDAlmVJaQyNRIlkI72PSi352hc5hBm0vT5MwZOvgeB7yMMP1rB/4E9LrEkZ4VFIKRA+Z2KK6z2dzXvDQAmtyi/pUnzjgep1prNgt+y3NMOo03+dRmjGxBcg77CMBLsjTvm5VlJEYTkjbVLtLoBIRgk3WpFb0tZv+mgUimlaSmXdfzqA2e7pbl6ch3iJBYiGcZzwKJr0SThji2W14YfYijARFIHu5+nDq7QezHwt+2OdcuGcYtdMEio9iUXlSCtAeF4tN2W1aDkP5yG4XiRaDJUxP2Ug+OrJbzDwI8Z//LTZk/SYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acku0zgvSZMcQsK0BlJPmlhEDyKmOzgZhgo172Tr05s=;
 b=Vc2di99MSq3kqWo7Jlb+1STVChZAcyMzL4g2tPSds/0RucoHddH7FT47bexSE2RWjqqQMzWEM3TiRex2dboYPIek1KTCjTvoEIp3wBpGFoOYKdGvKFnISHb0pTpRgI4aiGtHYwcv6pzm1+a1ZsWdKJgU0UEsRFccNbZbztkmYl1psdnhapLp/KFBU3LaMooFHEzNm5HRV+Sw4XkQoZN5uk8z4CtP8H7OeOGYqoBEzzcFOj4YfKNz88aK6Dg/8kM81gXQ83LkVv9VgGzEH88drMbZzNBv7q+vdNydR07WHnx/d+qRqT3iMTR8Z0bxI2lyf7lpEF2axLDmUg2y3Vl8Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by PH7PR11MB8551.namprd11.prod.outlook.com (2603:10b6:510:30d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 11:23:42 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%5]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 11:23:42 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
CC: Simon Ser <contact@emersion.fr>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "G M, Adarsh" <adarsh.g.m@intel.com>
Subject: RE: [RFC 0/5]  Introduce drm sharpening property
Thread-Topic: [RFC 0/5]  Introduce drm sharpening property
Thread-Index: AQHaXzje+hY9B6aMtUSnlRX/VsGgnrELFMOAgAFLpoCAAEeTAIAbEMyAgAAFrYCADDAggIAAZWIAgAFBewCAFdX10IAASicAgAF6xQCAgocaMA==
Date: Wed, 19 Jun 2024 11:23:42 +0000
Message-ID: <IA1PR11MB646781A7C9F0BF8C9CC5C5DDE3CF2@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20240214112457.3734871-1-nemesa.garg@intel.com>
 <8Ma-GlU3bFAuSPpFhGbYYuXQ8OeeDjMK9WiWO6KP-4pPO41fLnLrgABkRfhjHY6XlIh5u67vcEbD8ejDq7-zo5BXf-too0Pt7oTDhWCOPlU=@emersion.fr>
 <IA1PR11MB6467A91412978DE0FFCAB50FE34C2@IA1PR11MB6467.namprd11.prod.outlook.com>
 <20240216103620.33deabb1@eldfell>
 <IA1PR11MB6467F801FFB564769E357EA9E3232@IA1PR11MB6467.namprd11.prod.outlook.com>
 <uL84QKNtst1cp9uG3HqNAqEpJS2pT07qxwufONZx8Zq3t665BwY15fHRm3cZxMtiecQlPlNTs9srrmlIzRKmRYItWUv6cQbDEkms8eUT84Y=@emersion.fr>
 <IA1PR11MB6467C642ABBD54BD82DF46B9E32B2@IA1PR11MB6467.namprd11.prod.outlook.com>
 <20240312162600.7358e146@eldfell>	<20240313113638.3ff61e4f@eldfell>
 <IA1PR11MB646705FED711C1F129E5C5E3E3342@IA1PR11MB6467.namprd11.prod.outlook.com>
 <20240327132916.43f83069@eldfell> <20240328120456.1447f2a6@eldfell>
In-Reply-To: <20240328120456.1447f2a6@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|PH7PR11MB8551:EE_
x-ms-office365-filtering-correlation-id: 66ab03ab-12d4-40a3-81d6-08dc9052469c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?DBNIcUPpWEhYHiGaba7GvO7vdLHJ+fqC9bxndlX0wA75zMEunB/imSJkcju0?=
 =?us-ascii?Q?qu0z0lE8cKZGrMKPZrpLe3giC8fuFhC+Sb9F8lVRkyTge8YoStyAasnj4yr3?=
 =?us-ascii?Q?51mvG1pdA1WGromf7V3L9a8KihgVbAo+xpBg+kFQB9jWQTNJrMp3RrIxk4ST?=
 =?us-ascii?Q?GkbZjQNrG/bmj55B8CGw4io9AUKW3iHJjKwbzgZG75ddSD+mpTJICeQN2x1W?=
 =?us-ascii?Q?txkCCFa/4wWZ63YjwBny2wR2dhGh+Bzd7BYdSWzNXN9gDnuyBqOLicTaCFCW?=
 =?us-ascii?Q?XgtCMnn0CUBpc7xog+H84O0BBLdAJOf7ZtnC1S4GjC9REuC0/JZ+6OWazky7?=
 =?us-ascii?Q?wNbCxd6jVkcYePu+nxRfxm34nzzDvrHZaV98DDMkOEwMt3w6l0hMysTWYtTq?=
 =?us-ascii?Q?OiXQDfOkDKuVYue48nMO6HAFd2Mz9wLA68L1qowvJEEMDj7BW7gwe/9iEb5J?=
 =?us-ascii?Q?pD7gNynG+q+O/YCHh4JQ8Nq20SpDzfVG1C7x6Ej8eplRnnJRPLdPH/S+mvUR?=
 =?us-ascii?Q?krwTSytHLA+CWwLrfyDcIgqqGz5kTWDteNDMkL+Vs1jwF9v5wnhYumKNV8Xw?=
 =?us-ascii?Q?dVK5TGsrzhEYaTROK9MmKV4Eqa+4EzQMgrJSyLIhQwg/qVNHsIplQGNizJEm?=
 =?us-ascii?Q?VnPfCu8YwdT4Olx3/uxKPO7cfAFQlbu+iFJGa6UoUDJeNqjb6snXJv4fYKoi?=
 =?us-ascii?Q?DMswLyKjGcEKgFv22KezCi9bLol60tjqANpeBHz5Nkn8rTRw7r0wWQjcS+4u?=
 =?us-ascii?Q?9O0tKCRDqU3Sz3Q6b8IGCYciUuzX7WKnanG+0OK89jjVoy29ickGma7JyQ8V?=
 =?us-ascii?Q?c02Yru1y3fY+fErCE09VX4WPdYPm5T4LLPtzksZeLIPHflsHJucDV5T68Wyp?=
 =?us-ascii?Q?GCE07JvyGganbJFSttMB6SaHcrWK4H0CRTrmDIg76CZX+2Uof/gGW+HuJwKo?=
 =?us-ascii?Q?bdQX0DbTYeCKLgYMnQfF47CslyAdsCjcqxGKRRDK+G/xE64wnPzBz1PYNnqw?=
 =?us-ascii?Q?aJuV406fJURz+VeKucf0hcABrl1dH5PN0Gh4mDFt3Q6VnOCGSWIJDsd8YS7o?=
 =?us-ascii?Q?msNLHPsqget5jpDnPks1vqPMCdbZY8cW0TdpzvPRBmrub4Z1RZPCMf4ZaUN3?=
 =?us-ascii?Q?YTFixK5vIEBCvMohGy/PEMVKQk035xpt5sOv5312wD7ReXcUf9Se9V36s1nX?=
 =?us-ascii?Q?L0Lmh1znpPZFQtCeShj+7+oi8vZxLmfJrVjIRMkeaTeTtO/p1tHaJ87Q3613?=
 =?us-ascii?Q?SA747bqCRy9rNQUEznPLBtqdnNwEMEaiQM5AbzxmYVeIkmMqdgrujdrAnoo+?=
 =?us-ascii?Q?h1wqci+lFResVNSMf0kJq3fq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AkfBhqGzBrXmH8fbX4xSxl3IcPUryinI5sFL7UUW0/RrS5AI4clFhDgsmKBp?=
 =?us-ascii?Q?FkJi3+wAF+Erfb6rZLULCL+zaK0rPWNpTSwXKSugOQqjJDjrCGI/UuXj5YJZ?=
 =?us-ascii?Q?cTJWLLgXerYnPj/Hhob/F/YDZtaErjBk4Hvr6JRpMq6TdRIT9o4WCHs1iu0i?=
 =?us-ascii?Q?sT/dgXdnU5c/W6L/Guo4CEOqElB8Di3kWIJXDJUZeT5paRcOudFCcCb7HZps?=
 =?us-ascii?Q?u0BOVMHFrFI/mxQQC+pci340nmcgQisTcSOvRLSTKepsGDOXrLX9n6S/fZNF?=
 =?us-ascii?Q?KLSM/Eg1GK6w4S2vnfjPaRILCZlWd1Pzndr6CozB+dJJhwht57ahp85lB0jf?=
 =?us-ascii?Q?GbbrqvS1RDfHSjBk9dVLEjOE0RPEzTLK+fPRYWwTGJV12Gfc436AfHKX7UvX?=
 =?us-ascii?Q?/w5WELJ3aJcf2b8f1Cj5g1CegYMHu9MiIGA0O0e2gKhM/HEmc+IKc8Ccku3T?=
 =?us-ascii?Q?5nqK5r3KlIhlZzayMt7hHp6QGSa821ODyOCEdv9CSLU4wlDEQ2LmYOx4f7VR?=
 =?us-ascii?Q?t+HZxh1Ihbigwro8qHWz+eOfLyku6k8W3BAvpFmlHE/segpyyU0QBdREdtCU?=
 =?us-ascii?Q?yoern7XXs+SD5ZrUmzln/aJThFrkXwETLdHCIzOLkWUoVo8AMSZOt3Sdr7/E?=
 =?us-ascii?Q?myedRb05SUT/jvLgxWbgkOi2OknstO5N8jGBQzJHk5B2ryTBGc48YLQHChL0?=
 =?us-ascii?Q?O154VId2d2I1LO8zwHL9zWDDaOMsLfWgYc1JRGC2k8/6AxM8+vpXIhGWhOVz?=
 =?us-ascii?Q?B/Hygv35Ms5XXfYZZqO+s4Ie/ZuqTnjkoNxS6T9ApO0HLKya8TO2aHBsSOat?=
 =?us-ascii?Q?RY2JRofamkVWt59vm5dWIbrqi4Z7vGUV2irX9agGZ5ZUH7vxmrqeIvy/HrWq?=
 =?us-ascii?Q?YI1Gmr924LspEoIb2JZGYzOUfe4T/ejcbNPBpVkq+yJsQHitrgBVbfrR5co6?=
 =?us-ascii?Q?DIpnS4SB/6HmjXw35NAUg/J9v9+MsSS0ZnUdCsaZSgf/Gl2XX8jLD05xlQ0L?=
 =?us-ascii?Q?N5JOe23lk9jooEd1h7SdxHTaplXNZEDod2YmTNZNs/q4+ppUNCzL7zKWrfMB?=
 =?us-ascii?Q?ReJCvyCTphSgez+3v1TdHvN+O5mrah2bLg39fPRAFxnkTgudDHUKztXl50+q?=
 =?us-ascii?Q?mrBKR2ntYJAqM/AIXxhdBbDEua1RzUY9YrCo8W2/8nSgRYg23Sk0hB+wT+WL?=
 =?us-ascii?Q?UMENCJ7z2uXhIWBYg6qTBh6s2hBnkHRbj2aNhWYgYELXOpRqrn9qPs5l8NAP?=
 =?us-ascii?Q?dRtZS0rs9K+UQ7z1XmHXInqciNhyG6w47VTe9F2NtrGL6HlHkpFOd+o1ZaOV?=
 =?us-ascii?Q?Zv1gPsnJ6tUMCTsNk4TxbFStH0GFWCvp7RDXEfFmLvpOqQ7sOoGktps7ETZL?=
 =?us-ascii?Q?p+ddjNaV4SjqKmZhgI0lA8SmGbJ5kaQUTcavPjdnHUUYkMeLd2LV3bPBg5QY?=
 =?us-ascii?Q?pMt0/xmRrkuzLJUQBDgk0G4FSuk/lIxb1hTZ/MBDwkz2Rob93lSX05R4ESne?=
 =?us-ascii?Q?fawvIa8eZvlqpeI81yaK28HMnJ0djUc48a6xrREqYbs8tKNLx0wDUnd6NzVp?=
 =?us-ascii?Q?rjBirI1DBNTudVcoW+LUH0znaGDjPiPAiQKF6DuQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ab03ab-12d4-40a3-81d6-08dc9052469c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 11:23:42.5882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UYcxedDr5Dp2Dea7BBHZOKtLosrauHmQdG4coS8kwcyaebQnWMSSiS6EpPcGNlQVLh0qpLeRDnVmUFT8CvtHgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8551
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
> Sent: Thursday, March 28, 2024 3:35 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>
> Cc: Simon Ser <contact@emersion.fr>; intel-gfx@lists.freedesktop.org; dri=
-
> devel@lists.freedesktop.org; G M, Adarsh <adarsh.g.m@intel.com>
> Subject: Re: [RFC 0/5] Introduce drm sharpening property
>=20
> On Wed, 27 Mar 2024 13:29:16 +0200
> Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:
>=20
> > On Wed, 27 Mar 2024 07:11:48 +0000
> > "Garg, Nemesa" <nemesa.garg@intel.com> wrote:
> >
> > > > -----Original Message-----
> > > > From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> > > > Sent: Wednesday, March 13, 2024 3:07 PM
> > > > To: Garg, Nemesa <nemesa.garg@intel.com>
> > > > Cc: Simon Ser <contact@emersion.fr>;
> > > > intel-gfx@lists.freedesktop.org; dri- devel@lists.freedesktop.org;
> > > > G M, Adarsh <adarsh.g.m@intel.com>
> > > > Subject: Re: [RFC 0/5] Introduce drm sharpening property
> > > >
> > > > On Tue, 12 Mar 2024 16:26:00 +0200 Pekka Paalanen
> > > > <pekka.paalanen@haloniitty.fi> wrote:
> > > >
> > > > > On Tue, 12 Mar 2024 08:30:34 +0000 "Garg, Nemesa"
> > > > > <nemesa.garg@intel.com> wrote:
> > > > >
> > > > > > This  KMS property is not implementing any formula
> > > > >
> > > > > Sure it is. Maybe Intel just does not want to tell what the
> > > > > algorithm is, or maybe it's even patented.
> > > > >
> > > > > > and the values
> > > > > > that are being used are based on empirical analysis and
> > > > > > certain experiments done on the hardware. These values are
> > > > > > fixed and is not expected to change and this can change from
> > > > > > vendor to vendor. The client can choose any sharpness value on
> > > > > > the scale and on the basis of it the sharpness will be set.
> > > > > > The sharpness effect can be changed from content to content
> > > > > > and from display to display so user needs to adjust the
> > > > > > optimum intensity value so as to get good experience on the scr=
een.
> > > > > >
> > > > >
> > > > > IOW, it's an opaque box operation, and there is no way to
> > > > > reproduce its results without the specific Intel hardware.
> > > > > Definitely no way to reproduce its results in free open source so=
ftware
> alone.
> > > > >
> > > > > Such opaque box operations can only occur after KMS blending, at
> > > > > the CRTC or later stage. They cannot appear before blending, not
> > > > > in the new KMS color pipeline design at least. The reason is
> > > > > that the modern way to use KMS planes is opportunistic compositio=
n off-
> loading.
> > > > > Opportunistic means that userspace decides from time to time
> > > > > whether it composes the final picture using KMS or some other
> > > > > rendering method (usually GPU and shaders). Since userspace will
> > > > > arbitrarily switch between KMS and render composition, both must
> > > > > result in the exact same image, or end users will observe unwante=
d flicker.
> > > > >
> > > > > Such opaque box operations are fine after blending, because there=
 they
> > > > > can be configured once and remain on forever. No switching, no fl=
icker.
> > > >
> > > > If you want to see how sharpness property would apply in Wayland
> > > > design, it would be in step 5 "Adjust (settings UI)" of
> > > > https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/co
> > > > lor- management-model.md#compositor-color-management-model
> > > >
> > > > To relate that diagram to KMS color processing, you can identify st=
ep 3
> "Compose"
> > > > as the KMS blending step. Everything before step 3 happens in KMS
> > > > plane color processing, and steps 4-5 happen in KMS CRTC color proc=
essing.
> > > >
> > > > Sharpening would essentially be a "compositor color effect", it
> > > > just happens to be implementable only by specific Intel hardware.
> > > >
> > > > If a color effect is dynamic or content-dependant, it will
> > > > preclude colorimetric monitor calibration.
> > > >
> > > >
> > > > Thanks,
> > > > pq
> > > >
> > > >
> > > > > Where does "sharpeness" operation occur in the Intel color
> > > > > processing chain? Is it before or after blending?
> > > > >
> > > Thank you for detail explanation and link.
> > > Sharpness operation occur post blending in CRTC ie on the final
> > > composed output after blending . Yes Pekka you are right as per the
> > > diagram it is done at step 5  "Adjust (settings UI)").  I  will also
> > > document this thing along with documentation change.
> > >
> > > > > What kind of transfer characteristics does it expect from the
> > > > > image, and can those be realized with KMS CRTC properties if KMS =
is
> > > > > configured such that the blending happens using some other
> characteristics
> > > > (e.g.
> > > > > blending in optical space)?
> > > > >
> > > The filter values are not dependent/calculated on the inputs of
> > > image but depending on the blending space and other inputs the
> > > blended output gets changed and the sharpness is applied post
> > > blending so according to the content user needs to adjust the
> > > strength value to get the better visual effect. So tuning of
> > > sharpness strength may be needed by user based on  the input
> > > contents and blending policy to get the desired experience.
> > >
> > > > > What about SDR vs. HDR imagery?
> > > > >
> > > The interface can be used for both HDR and SDR. The effect is more
> prominent for SDR use cases.
> > > For HDR filter values and tap value may change.
> >
> > Who will be providing these values?
> >
> > The kernel driver cannot know if it is dealing with SDR or HDR or
> > which transfer function is in effect at that point of the
> > post-blending color pipeline.
> >
> > If the UAPI is one "strength" value, then how can it work?
> >
> > Maybe the UAPI needs more controls, if not providing all "filter and
> > tap" values directly. Maybe all the filter and tap values should be
> > provided by userspace?
>=20
> Actually, is the hardware just doing a convolution with a filter defined =
by the
> driver?
>=20
> Convolution algorithm (it is a formula!) is pretty standard stuff I belie=
ve. If the
> hardware is actually doing convolution, then the driver really should be =
exposing
> the convolution operation. Then people can choose to use it for sharpenin=
g with
> the Intel developed kernels, or for custom effects with custom kernels. E=
veryone
> would win. Convolution is also something that other hardware vendors coul=
d
> implement.
>=20
> A convolution filter would fit very well in the new KMS color pipeline de=
sign for
> post-compositing operations, too.
>=20
> Is the sharpening element doing something similar to the unsharp masking?
>=20
> I suppose users might want different strength based on what kind of conte=
nt is
> the majority on the screen. That makes it something that a Wayland compos=
itor
> would adjust automatically based on Wayland content type (similar to HDMI
> content type), for example.
>=20
>=20
> Thanks,
> pq

Hi Pekka,
=20
Thank you for the feedback and suggestions. Based on the discussions in Hac=
kfest(2024 Linux Display Next) and community feedback we were exploring var=
ious solutions from the user-space side and come up with a looking glass so=
lution. Below is the link for mutter MR:
https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3665
=20
There is a sort of convolution along with other optimizations which are wit=
hin the hardware and the user-space should just control the extent of sharp=
ness. This value will be received in the driver and appropriate programming=
 should be done based on respective hardware design.
Also as agreed it should be fine if sharpness is applied post blending or i=
f we drive a single plane use-case.
=20
In cases when hardware doesn't support sharpness due to various reasons  we=
 can implement the generic shader using some open source algorithm. This ma=
y not match pixel by pixel with hardware but should be ok if hardware appli=
es post blending.

Thanks and Regards,
Nemesa
