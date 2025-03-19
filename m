Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA27CA68C6B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 13:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F6010E34C;
	Wed, 19 Mar 2025 12:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKlwptpz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E42110E147;
 Wed, 19 Mar 2025 12:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742386151; x=1773922151;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pHSA6fpKqVVDWL32FjlTDlhVaGvkZtujEMyrCiqnVJ0=;
 b=RKlwptpzIXMwvyP5f5WfDO4v/wNtwMThMmetqdIiMX6OBPxm4I/VsJ9/
 vr/r03H56arGLAechv+Cdtz/UCdfvskMXKq4Rmn0iR8+XZz1oo9mdFs66
 LFuqIEshM8tN4qApnkM1yuouR+V9jpVl7VARcWvmbDhEDYpluOkbpRsVe
 kaE7QS7LAd5xgv61IjKZsbVW/b39MnKBWcnUihjoFjcoZoWpWIuNlFzFo
 J83/i9+1bZCn+laOvMQyb6CL02Ci79/IKZh5GFW1a3KAqFRakRcKKoLMV
 WvK9e+b/x0WYGS9nHbOnJum7qVNS4n/WamDi6hxwm+65zzloPYHCMoKmC g==;
X-CSE-ConnectionGUID: rDB3OEYdSWOWzk4ax8iX+w==
X-CSE-MsgGUID: 35nbiYnDRZy9UN8YBzL2Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="47349773"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="47349773"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 05:09:10 -0700
X-CSE-ConnectionGUID: kJvj4IBJQw2EBlHrtnEbmQ==
X-CSE-MsgGUID: 5Om1MniqTfyTJWmrcxrQcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="122524348"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2025 05:09:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Mar 2025 05:08:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 05:08:37 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 05:08:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZiRfyBOcfdUPMYJuNZBREEvi8xv/PFGICvXk2mOtWWw34cYMl0slF+5d+wxBc5guRSXAiP0bnMDji+olZXZGJf4iRcf3IOcDMn33kT18Owj62vJk850FeJFmBlbAX1ry4L9Wn2akCbvWIaBzSVMXE+flkstK15c6B0y1Lxvhm2DGBf/W8+cKnjxYdQPghyDQZR0lpMjf0fPk+DWY77Yt+I0/fSmiRLYCMG1RblIlda4HZfAJ6HjTMCCxHV+NREnGtVjf/B/MbrXjA24eYf+YFRdHbqXnu2/hLmjuAPP9weX2lIzQSx/b6/7l65vWU/zkclt3eOLhLVrxBt3UVfVTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dP8nUbb5tPpj8F1bk4/EBs6l82dTZ42G9wsqbN5+Ja8=;
 b=fhbsvNxqRBMeq7d1uOz7IXkyp36GHgPG6RE3BS3S0cFUMdVATNIvCyO+oTEFGbg11HqjY4J+sJHmbJtwtgNJjfIFvp4wDrOlhV7YH4PjRL34ntMGnLGsFOoLYkeafXHyhyoQ53BqK5+b5UG4Y89P71qjwRjnUk3UvNX4oIoY+xTBe3bq8q3v3ZAg4RUZ30aQ7UGH7U+AOs7QiwgV5LIsbUq1hcN5CI7V6PlIqRnnPbOwtuOUv/sce/ez0zxDsLYaasA4O3RMfE/VsLbd9FYLjUzjYbUxXoBP3wrj2Iuo1da2/TR0s3DZS4pcKQu+Y2KH8HC33bSC0WoWFRXSh1NmNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS0PR11MB7624.namprd11.prod.outlook.com (2603:10b6:8:141::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 12:08:15 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 12:08:15 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Thread-Topic: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Thread-Index: AQHbcZ6G7w9j1lfJu02jbAwOIME0fLNLZHIAgAFIb4CAALFTgIAAw7qAgAJZP4CAEMRZAIAAGCkAgBlP9DA=
Date: Wed, 19 Mar 2025 12:08:15 +0000
Message-ID: <IA0PR11MB7307CCBB82AF958121A6B3A9BAD92@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com>	<20250217120808.708b9b4d@eldfell>
 <c423efcb-5ab8-41c2-af0a-621007c6175d@intel.com>
 <20250218181819.11ca41ab@eldfell>
 <cd095fd7-3043-402a-9e21-c0c85c53f8e3@intel.com>
 <20250220175047.412ee8d4@eldfell>
 <95a3e35d-2c5e-4861-b7bf-f38815a44e14@intel.com>
 <20250303112010.469b9685@eldfell>
In-Reply-To: <20250303112010.469b9685@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DS0PR11MB7624:EE_
x-ms-office365-filtering-correlation-id: 154f897c-36ba-4c92-afb9-08dd66deba91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?aIBpAvDv/NVX8jU+3lSAbVz05MqcnQpHR1Dx9hVTqeY+eF6lhJAiyUXN/Ina?=
 =?us-ascii?Q?XObJrBO11AIMnQqaS+KWdR3Xn92hiuq3CTRYK0enC+IjFnHH8x7dDHM/jo7+?=
 =?us-ascii?Q?EYpcHTJN00xrFzh20tJ26Q3vtP5oloqV6bbRJBI1hq88iinLZkSVK6nT5psn?=
 =?us-ascii?Q?SKf/moEpHS/JygLQaD1Pxik8uL02iEHdr1qmLhJ8ye2OkTH4m+jxCH1Nb8dl?=
 =?us-ascii?Q?e/D50W9y9vo0U5uCFkSQfcgysvfdj4ofwHP0n2W0cSPsibc3z2okCn85FhHw?=
 =?us-ascii?Q?AyisiNQITckdv/ozM0kUJhyLbAV+HnWx4LoGTVMii5Q5mQD83PvFe2GVCNIb?=
 =?us-ascii?Q?rDyFr5NTVSlzs6wriX8DobODgDPasjLyPC3kBMXuz5Edny/CTHyb9pUNQx3R?=
 =?us-ascii?Q?CZq5IbKzxJZ+MGMHY8Q6cfkL5reqx3r4UW3f/tyKawe5FHji1cBqShhE0QxX?=
 =?us-ascii?Q?L/91f+DW2q6aSKluGo6YfUyZP2PvpZ3KhxitNfmIZuFKwnFyFHobzTASw0PU?=
 =?us-ascii?Q?+XLV9pUH/qedugbX3QFjB0Pjrlf6Bx11m6fAE7kYaADjLC4btSa+1g6/OW1y?=
 =?us-ascii?Q?zFsI7dlrzAoGzacFfY3KQyM/0J6QN4eoxhDS0BoY0u3xdfdS9vIWiJRytpsM?=
 =?us-ascii?Q?wgRrQ/LqXz7BgUYJ00tLrRVLtiBqa/aHWYDKefklvMH/OeNzaOzxA3STndzC?=
 =?us-ascii?Q?eeHOSEdMXYfIF8cQ/5DtpUHiB7COIYn6G/JrrlOeThWFE/owAxrrdds4FwxK?=
 =?us-ascii?Q?5EuGzfabXzfIjGwZc/pXz8IBkpSAKhGKbelkBXSikrpvltC10MBR5YL4g5rv?=
 =?us-ascii?Q?3iNk9Mcd936YuTy5VM+i7vmT9CReY9YszfIbHKQ1QDOhFyjRpUSeDob8VVAU?=
 =?us-ascii?Q?yivX/0DdhzMeucRd67Hpx/UONAtFEwkqGh2Y7jESikYYl0AOGaL/7wvBj+o1?=
 =?us-ascii?Q?3W6H4FsqCUkinmtDZNNaCpZrTv1hsyuiNw79I2c5AfWrnBfw4HZnLtZTt5MX?=
 =?us-ascii?Q?Vw1Wj18Aylu7/7nu0W4k+Uyq/vQOTYsxAyW5/2BtA3XVgIQUcHY6qz2ey41B?=
 =?us-ascii?Q?CcZfmYiU/Qp8DYShQ5QJIlMTocKvw2csFMrkVimlnC8s+P1X97YgCRWtfUx1?=
 =?us-ascii?Q?lLE9zDub209D+AAJfiG9n/bEfMYU1uW5xPuBUlV8t2oOlbfK+nHAam1ZLN7z?=
 =?us-ascii?Q?JF71HHEUEdhZG8cSqBNc4y+8TnulM+eIe0mhjZKjtb5MQhc2E+e5zKwotgGl?=
 =?us-ascii?Q?XG+ahYzXtWkysZwah7T2SSvmJr2IStJG/SOJ58lX61ihOvMvQmFN+0DABCKn?=
 =?us-ascii?Q?8hCRW50S+QO85OurILVZrQ9VWhS5GKp/AvVhOWNw/8/KRS7kRDQvkd1CaR8f?=
 =?us-ascii?Q?x5dDHWqlYiV1Z14GwtoB+3QLvqUXcLBGjZHAjMDgdMnvFBvD2cigVg8jWwk/?=
 =?us-ascii?Q?fY9DwwdlmyOh1fyNc2zqLvcSED0Fu3y4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KJiVjuAWtyeGYTA/yreu1yGMfxsmmcigQ+TSThpx6UJq/GcTIEDiZfHx+RiE?=
 =?us-ascii?Q?eBjwRL/jwLIHxSoNJB5r3MywyXb18G/An7mqkDJhF8hgPSgzcl4tw+TxF+bI?=
 =?us-ascii?Q?tfC3w3wIiy/JCnX/of1k3UXM/G8Qv/LHvLAwKhbr0R7gPkmJGLopDB0j+7S7?=
 =?us-ascii?Q?wd8Q/hHudjtUeqQO3bgA3rbUWJWgMICihpBeTjmBX6tYf5SucADuZ+bt0Ym5?=
 =?us-ascii?Q?8wy+Jlke91+mVkgrh4XZRLKq2ZJ3DuhhZwF1XC0eIJk+PJG6q+Ofb1qSc4bl?=
 =?us-ascii?Q?K2KSSM0Rg0bz/F4jW1mRimfQv9bojqZpYDvOsuqC0Jgkw3Jdsack5d/19ZKg?=
 =?us-ascii?Q?8h4yzXxroBJnTzrs2ZljgyzyvLmB5w6j4zl+e49FtDxfVvVVTtT2r2ahHrOa?=
 =?us-ascii?Q?DO0UNpM1+aLzy76VxpeXR4aeY9XIoFmYdqQ+taXH1N+gQme+OLU5zpsdYaXO?=
 =?us-ascii?Q?TwLy5j/ldkxfj0HnQ3YFlB7vrb8BiGfXlVuiX/DXADOMIt6dHSMzxydl3hJt?=
 =?us-ascii?Q?YzJu/picmmmiqlntqHhVwBRJXQSeDNi/42SP1MJPSoHJBu3uR95xXgt7USnN?=
 =?us-ascii?Q?yqxKtL3uowKPB+ZOout0kc6r52rS7ye9fGbvtEaZQv2rnjMSEoYzX4pCEK4e?=
 =?us-ascii?Q?R20uCrlM0MWINcFs2kFb6dqWrElYBp5jPBNrMy40vtB3oeZUbwYQXmLIrU2M?=
 =?us-ascii?Q?DNpje482ikXlY4xonkfvVaNhtiv3WSadXE2Ywh2XbAjkCciy5nVoHXVNkUgN?=
 =?us-ascii?Q?QdHT0tGd1lfvtNpRsZIVL6wlIwab8FP7+jA4zQbSpdnVz7mf4vp4gHflLzrp?=
 =?us-ascii?Q?Gdaje7FQRUQa1q57NWQFApSW6XucIuEjsyBACNbdD4akl55o77ciIWS57BHl?=
 =?us-ascii?Q?DaH6cP8qnFEiLFG4C0BKrcw4Ow6KeeS4ovql3WQZ/lcVEPciZy1MGH53YGjD?=
 =?us-ascii?Q?iWY+MiJTFh3i36Q5lnzvGCdvipuqgq/QaPx7Atqmet1HgTcgA0vLwmmpu9/7?=
 =?us-ascii?Q?g0LsUs1kx/VLY0vEbnCO2oEQ522iKXhwCpa9wC1LaC10UOkro45kV5Ejlsfs?=
 =?us-ascii?Q?Zt4aWsNcNY7NgHgaVFQF6ip0kGw7sj16VuVQEFWtDIqCPMoD4PmczJkwKLi6?=
 =?us-ascii?Q?SKCpGMHpxGo12CcGhwjGp6VWEdRtN6WzlbIidxMNLNNDuXzkoIhIY7W7Zf28?=
 =?us-ascii?Q?hMIXElPrF0tM856kFlwY3XV6rN3n9i97jyzuEvGo+jgW5yRXk+yNbneFUdVE?=
 =?us-ascii?Q?9Op9mKPSPkLbGxzdKL24zaDAXWwg3DFmMQsVACCVsAmjcwuWwhSVnzPn11R1?=
 =?us-ascii?Q?mynLI2L5McsqYWxQpjUxpZbm7/9UdllluO9UHYh5VKRxjpAlqJC9vIPSiqPl?=
 =?us-ascii?Q?sPgt5qXBnDcQAS0S/Fkr0s7Gs9wF90dnAr7RZFGCBzK40YMq6r//lXwECkRe?=
 =?us-ascii?Q?Htw0xnTvicFdoNzbbIjnY9JCMAKPgLRl55y1avpTUC79ezwmVi/AHK9aDDIn?=
 =?us-ascii?Q?vyKvG1pD/ZuvrNe1w7Qo3uaGOvOgzGbwN/fErrJZ7jPm2NzcV49U6Byyz8IJ?=
 =?us-ascii?Q?Xjt9mg+NAtG6wUaxdHlkg8L7mHEZ6CNqscB778Sc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 154f897c-36ba-4c92-afb9-08dd66deba91
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 12:08:15.4998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7+7WC9PnTkuPtuBmjfnSVBD/NUcZ3Kl6q/gtxc+tFlTXwZDO7/NTxwa68dqmAfUy/QGbLYw+PalF1Tbg6RIuzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7624
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

> On Mon, 3 Mar 2025 13:23:42 +0530
> "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
>=20
> > On 20-02-2025 21:20, Pekka Paalanen wrote:
> > > On Wed, 19 Feb 2025 09:28:51 +0530
> > > "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
> > >
> > >> On 18-02-2025 21:48, Pekka Paalanen wrote:
> > >>> On Tue, 18 Feb 2025 11:13:39 +0530 "Murthy, Arun
> > >>> R"<arun.r.murthy@intel.com> wrote:
> > >>>
> > >>>> On 17-02-2025 15:38, Pekka Paalanen wrote:
> > >>>>> Hi Arun,
> > >>>>>
> > >>>>> this whole series seems to be missing all the UAPI docs for the
> > >>>>> DRM ReST files, e.g. drm-kms.rst. The UAPI header doc comments
> > >>>>> are not a replacement for them, I would assume both are a
> requirement.
> > >>>>>
> > >>>>> Without the ReST docs it is really difficult to see how this new
> > >>>>> UAPI should be used.
> > >>>> Hi Pekka,
> > >>>> I also realized later on this. Will add this in my next patchset.
> > >>>>> On Tue, 28 Jan 2025 21:21:07 +0530 Arun R
> > >>>>> Murthy<arun.r.murthy@intel.com> wrote:
> > >>>>>
> > >>>>>> Display Histogram is an array of bins and can be generated in
> > >>>>>> many ways referred to as modes.
> > >>>>>> Ex: HSV max(RGB), Wighted RGB etc.
> > >>>>>>
> > >>>>>> Understanding the histogram data format(Ex: HSV max(RGB))
> > >>>>>> Histogram is just the pixel count.
> > >>>>>> For a maximum resolution of 10k (10240 x 4320 =3D 44236800)
> > >>>>>> 25 bits should be sufficient to represent this along with a
> > >>>>>> buffer of 7 bits(future use) u32 is being considered.
> > >>>>>> max(RGB) can be 255 i.e 0xFF 8 bit, considering the most
> > >>>>>> significant 5 bits, hence 32 bins.
> > >>>>>> Below mentioned algorithm illustrates the histogram generation
> > >>>>>> in hardware.
> > >>>>>>
> > >>>>>> hist[32] =3D {0};
> > >>>>>> for (i =3D 0; i < resolution; i++) {
> > >>>>>> 	bin =3D max(RGB[i]);
> > >>>>>> 	bin =3D bin >> 3;	/* consider the most significant bits */
> > >>>>>> 	hist[bin]++;
> > >>>>>> }
> > >>>>>> If the entire image is Red color then max(255,0,0) is 255 so
> > >>>>>> the pixel count of each pixels will be placed in the last bin.
> > >>>>>> Hence except hist[31] all other bins will have a value zero.
> > >>>>>> Generated histogram in this case would be hist[32] =3D
> > >>>>>> {0,0,....44236800}
> > >>>>>>
> > >>>>>> Description of the structures, properties defined are
> > >>>>>> documented in the header file include/uapi/drm/drm_mode.h
> > >>>>>>
> > >>>>>> v8: Added doc for HDR planes, removed reserved variables
> > >>>>>> (Dmitry)
> > >>>>>>
> > >>>>>> Signed-off-by: Arun R Murthy<arun.r.murthy@intel.com>
> > >>>>>> ---
> > >>>>>>     include/uapi/drm/drm_mode.h | 65
> +++++++++++++++++++++++++++++++++++++++++++++
> > >>>>>>     1 file changed, 65 insertions(+)
>=20
> ...
>=20
> > > Hi Arun,
> > >
> > > sure, it may be by hardware design, but the UAPI must specify or
> > > communicate exactly what it is. This seems to be the recurring theme
> > > in all the remaining comments, so I trimmed them away.
> > >
> > > A generic UAPI is mandatory, because that's KMS policy AFAIU. A
> > > generic UAPI cannot key anything off of the hardware revision.
> > > Instead, everything must be specified and communicated explicitly.
> > > It's good if AMD has similar functionality, someone from their team
> > > could take a look so you can come up with an UAPI that works for both=
.
> > >
> > > Dmitry Baryshkov tried to ask for the same thing. Assuming I know
> > > nothing about the hardware, and the only documentation I have is the
> > > KMS UAPI documentation (userland side, not kernel internals), I
> > > should be able to write a program from scratch that correctly
> > > records and analyses the histogram on every piece of hardware where
> > > the kernel driver exposes it. That means explaining exactly what the
> > > driver and the hardware will do when I poke that UAPI.
> >
> > Hi Pekka,
> > Sorry got getting back late on this.
> > I totally agree that the UAPI should not be any hardware specific and
> > have taken care to get rid of such if any.
> > Here we are just exposing the histogram data and what point is the
> > histogram generated is out of the scope.
>=20
> It's not out of scope. Understanding exactly at what point the histogram =
is
> generated in the KMS pixel pipeline is paramount to being able to use the
> results correctly - how it relates to the framebuffers'
> contents and KMS pixel pipeline configuration.
>=20

While working around this comment, it looks to be quite challenging to
address this comment and agree that this will have to be addressed and is=20
important for the user to know at which point in the pixel pipeline configu=
ration
the histogram is generated.
I can think of 2 options on addressing this.

1.  Have this documented in the driver. Since this can vary on each vendor
hardware, can have this documented in the drivers or ReST document.

2. Maybe have a bitmapping like we have it for histogram_mode. Define=20
user readable macros for that.
Ex: CC1_DEGAMMA_HIST_CC2
In this case histogram is between the two color conversion hardware block
in the pixel pipeline.
This macro will have to be defined on need basis and define a u32 variable
for this bit manipulation.

Please let me know your opinion on this.

Thanks and Regards,
Arun R Murthy
--------------------
> As a simple example, if the histogram is recorded before CRTC GAMMA
> processing, then changing CRTC GAMMA will not change the histogram. Or, i=
f
> the histogram is recorded after CRTC GAMMA processing, then changing CRTC
> GAMMA will change the histogram as well, assuming the content stays the
> same. This makes a fundamental difference to how the histogram results sh=
ould
> be looked at. Userspace needs to know whether the differences in the
> histogram over time are caused by changes in the content or by changes dr=
iven
> by the userspace itself.
>=20
> In the CRTC GAMMA example, it's not just whether changing GAMMA directly
> changes the histogram. GAMMA also changes the units on the x-axis of the
> histogram, are they optical or electrical for instance.
> Those units are important, too, because the ideal target histogram has a =
very
> different shape depending on the units.
>=20
> > I feel the rst documentation as suggested is missing and is creating
> > the gap. Can I go ahead create the rst documentation and then repost
> > the series and then we can continue the review?
>=20
> I'm not sure why you are asking? Of course, I guess.
>=20
>=20
> Thanks,
> pq
