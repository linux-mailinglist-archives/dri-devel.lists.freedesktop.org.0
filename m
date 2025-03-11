Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED84CA5C35B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 15:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2E110E1E2;
	Tue, 11 Mar 2025 14:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mV+6cT2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0B010E18E;
 Tue, 11 Mar 2025 14:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741702330; x=1773238330;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CX1xrx6nffAsj5Di0ivFC5Y9Ux3r4lLEoUK0b1mHB/g=;
 b=mV+6cT2cLCfB0/0+UEuhncRYY5PHyFj94aMCVrUEWB9PYUcLfmPCRPpl
 4oiF47X09uA8oQeK2ynt3BMnj4klaEe1Dg0t3npS7XRWAG1BqGoc1POfl
 77aoTltvnFljj7u2AjfqlbKK6TwXgTuLu4ybQtqqw3cN5LlJR4Az7pCXW
 vznvBl8YBBQt0KlwgFtsSBZX0cy+s/T4TeRCywgcMNoYHwDLYEbrJ6DPF
 ErnrmWqx7yGP3d6YaG7EbZ4NcHX8mCFHWuZbn4y+2r/RhhrGtnGTvtryl
 +9c0WVP+AFmUjP91jywEdWQpuSG1r2hA1srnt+7dKosAWV7j7L+qr6Gl7 g==;
X-CSE-ConnectionGUID: 0AUuNeQ2S4K4EMbWVZ3x0g==
X-CSE-MsgGUID: j66Dbq5jScm6AghsQfJeig==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42462382"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="42462382"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 07:12:09 -0700
X-CSE-ConnectionGUID: g3TxVMXgSC6ZnhH2zrlvug==
X-CSE-MsgGUID: hLB9MSSSQd20Y0GlYu0BkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="124945773"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 07:12:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 07:12:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 07:12:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 07:12:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCoipXvVa5mns5kC3RnJQZPmZAsx+FAjAP/OGF+8cStns6gD5E9C3nOaYc5uQpAUopuK6Du4Ynfvm+AJWp0s670mzPWeRQ+9pXNDHba6habhKLrpqTqcAxG9xG1/cIM9lcRP8LOsMc1ge9LC7f4ETXw8tt6bYZ6LNC55UGZS9g3VdIwGbAshpoBhI5PTZO+RufWTG+q8KQ9YyEjM3+SDRZR/st9QOvOmDCerDGYIO20B3njfG/EofJ5LYB5ilH2+aXNgueXGRMKQNf44kfSbz1RcT/GZV9aZsiXqy7ztkOQJRXOLg6/0Ro6J2+rtWFwkFyOH/opxtxCu/ftXzl95BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZJQUqLzALGFE8MLjY6kF7x6P5z09WRHDJ0JXvr1Hrk=;
 b=iGw92GhhfiKA08HA67S1yMPEHNsBRrc4Rs3gnYNgvxOkw4KlyNUOJWiCI/m5wWLfwvRttcU3v6iPYi6HMtVnzOGmp3ADyfCbMWhoIZtlbPgTnLHmvYslWbdp9npaoFf/rSJsB+oNXEEnveD4AOSPLFCvPTRUsIGInpQvv1RzJendi7wtu5TZjL0cpKY57FRq9ccI92QHfo0Sb1A8IxsyZ6Wo0TALaFBqtLBnwHC7ZGHi9pczpRQKQQ4dvH49OHBJROhEhGQBpoH3KUO3haUKe6NWYSAnVQVHHko/hhdU1F6q7WQhHhxQllRmvbO+m0DqMolL0V4BAb948hM08zCWGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 14:11:22 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 14:11:22 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Zhang, Jianxun"
 <jianxun.zhang@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults
Thread-Topic: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults
Thread-Index: AQHbkeCBSGJ7q++dn0eBzBKtzeyYB7NtXoMAgACalFA=
Date: Tue, 11 Mar 2025 14:11:22 +0000
Message-ID: <CH0PR11MB544407DDD988B9B66C0E501BE5D12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250310171834.78299-1-jonathan.cavitt@intel.com>
 <20250310171834.78299-5-jonathan.cavitt@intel.com>
 <Z8/BHmPM6h/agrvX@lstrano-desk.jf.intel.com>
In-Reply-To: <Z8/BHmPM6h/agrvX@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: jianxun.zhang@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB6885:EE_
x-ms-office365-filtering-correlation-id: 3c275ee2-eeb3-461a-b99e-08dd60a69a5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?NItGwHx5e8hwuwr5VExuu/OmeIfCKiahn6hCXdS4izh0ocEV0NohwWvY38J5?=
 =?us-ascii?Q?xdOWTXyQT8KJv8mQrxfvoC3hcu7wOH8khx6P4w96/tg8149KpMOPHoHrO2tr?=
 =?us-ascii?Q?1lJ97UhPEuZfT7jf+0WOIOnIu5vIh0UBHoSUIaQY5qhqzWAoECffilr/2hls?=
 =?us-ascii?Q?V70Ffa1ETFns14u8ewkdLCpvTTIDwQy/A2eysoGX82aFIQmmjkcergOY5T/E?=
 =?us-ascii?Q?+x3kOuYGApkhyyFdTfuyWidn9qOMKqnpTqaf3J81FmwsTN+WeXOFB8cE3u3h?=
 =?us-ascii?Q?Dk/SPW570zDyU9SBmfi6peggoq1JJ60hCOlm6zswrFjccPnNFHHyE8d+D4Vm?=
 =?us-ascii?Q?d+w0v+e+W0DQy2bwOVvIQDbi/RyqXoChhH5K/3o6qNVqWyimlvx815dJ9DbG?=
 =?us-ascii?Q?HAVHIcYKUjuSGdo88fTttCVXhBvlAWzEaBzprcOwv6bNIhvH+AQRenqKRmZG?=
 =?us-ascii?Q?+4nSPkcO0LMohBssU3omOQgkEcqqZ5HxHKf+G5VrB10ztjfC9nkLfb/Q49mD?=
 =?us-ascii?Q?F1XNzxiUyfo4tqDrYnudClqQHhcSvm21Ob/igVBor06WV/1pnEJsJdx2b6Sa?=
 =?us-ascii?Q?fAGeVQfLvYYoMYgnD3PxSROEbY68nZR/Dnyf2h+raq0PYHSFwrkhJSrTe9Ug?=
 =?us-ascii?Q?/Qs7D4v1b52osPFb/29/+bh8R5ShCoREBJARc5zdu2YJMWPSDz60Un5KCBlZ?=
 =?us-ascii?Q?j0j0oAJuTkrit6Ft/T0YvsbHmdEgbXptNsvL4g3yaJGtpCrxTwo6c8xuQWmC?=
 =?us-ascii?Q?Y499IqlYUN1RzLqDRBkiOtmmr7yBuFFQFxTKhyuJoJ900WSZyXGbAL0uGn9l?=
 =?us-ascii?Q?jJzpyI+yNMtgChNfr4mvXUYyoik8c2YvcYUt1rSSpZjwAPvfO2L+7gM4lAL2?=
 =?us-ascii?Q?vTpDSVbZRenbUgEi9sj1gqdJS2m4W5AyBUkrmhSnCkI9COvl93Fop4TU3AdW?=
 =?us-ascii?Q?qDTlbr9O147S/m7WAawcUymv/SMNQqXD/DrElHe3STFZCn+ncMR74sz8Am4n?=
 =?us-ascii?Q?hWinDpJY6yKr5dDFwHv8AkbTFSILMkxJCvwu3vANAFwTqioTLYWCwayxoYUq?=
 =?us-ascii?Q?NZXBb40USkdQQ6DqfB7ROK6OxUMHIzGCG+bD5t/yDGXxXFAKd5UNIajtdzAU?=
 =?us-ascii?Q?/TAuu5MAuc/9rHwAE688w6yDoSLklSb2l8KmBB9pJbzSmkLBKvkgkJy4M5V4?=
 =?us-ascii?Q?1KeUhvZR9tAHjiJc1DlU5z/DZiFUMjpCpjRvZ8lkUkGif9H4fpinvhz/rfY1?=
 =?us-ascii?Q?HijoveCMGlKd7+8iq2PR6GKf2AvsdxZaAXGleLpj2As1QiRZ9YO86ECwf451?=
 =?us-ascii?Q?CZSrvXUkkevbq4hcEm9oW343xDaTXvyENRFW7KUinOyVWkKW83IURwr77Zc9?=
 =?us-ascii?Q?M66XvJkZP9UHWriPfHvBvXubsSE4SDG9QV7J1WLvcX43b4nXs1i0D4cFlLwy?=
 =?us-ascii?Q?LYMInrCK3TwUAKzyLOIt+jBCrgUzqoRR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QyUrSiyifdRXuaKN7jfEXyecIW6qwRzR0DGVtjnooyl68sMMyEKP5N2lr3//?=
 =?us-ascii?Q?Acf1qqI3NT2Kz7VlRK5liFblYNXcL3RS/naomBnn3hltL8RIK3RN+S5NpVwJ?=
 =?us-ascii?Q?cSfXdRkC1RxYsDpDNzP5eseiKmeyYmmhw4KAxWv2ejzUp3tsSvdRSYgWpZkA?=
 =?us-ascii?Q?t8M5qjcjYjwd+nERI4w55XSc6719OhiaU1nSkY/BDHIaUlAAI85gvYTCtkAs?=
 =?us-ascii?Q?VtUHwLuyFK9S4Tjg43lAp6Rt5PoBDAPbo7WOWk+WCCiGp6yKHH4nG5K8MVQ6?=
 =?us-ascii?Q?I+5DPQsdYxk1noNG5GheoLrjfEsNqdF6G+XV0kjSjXNLBAUR97XIFoxkTFls?=
 =?us-ascii?Q?FgBiz9A9yb8r6rED9x6s+O83aLpo85XecUAxmyvlzTkbewGQRjWFoze9BoLx?=
 =?us-ascii?Q?JXTJKJMCAImf6v8PgUqVnCE0zMXW05ZFi7a7LqG12SXshPw3DRZjgDtB2fIf?=
 =?us-ascii?Q?pb+sbn6psVapeRZUqTFaBxQTZPDFNh35ACCrhS+r0a3hcRhLGWGS2LhNnV/T?=
 =?us-ascii?Q?nKBqr+pFq6BSSKdWUqwiGAppiu27bUCcqdGEBraVcHoQkJ0C/8HlQKQgUcl1?=
 =?us-ascii?Q?ao3WJ8EoFV5rXhYSOliXIjEEYYEIg5+g3q8wFLFFokIpPZsDoUwLiJUEmeTn?=
 =?us-ascii?Q?1NhknFvgrZzWI7tnd41ITkj6Cue7cGkK+4Jfvy4Kt320ciCR9/m5mEVj1Vp9?=
 =?us-ascii?Q?wgCQy9VV30RsUBkK7fiFRjYw79Wyc9Iexk5s5CvYM05p0KW/79nbm7FhRyvz?=
 =?us-ascii?Q?YGl10kFhRC1l3hPvXCwSAMCoUa6bZhPfeYFgTXaAL59J074gtgQRur0qpt3A?=
 =?us-ascii?Q?3O9s2cdE93pyjyaAPsfrdWbwO0sMOsL8SHTosUyDuswIRVvBQ08tSs9Jm7LZ?=
 =?us-ascii?Q?za8gJdkwApMyWODT5WKfxe2szdEbehBQb0F8RoV4IMtIlToDAq5g1drA1lGB?=
 =?us-ascii?Q?v+9C0jr6wAfLXpWq1ha54X9X/SZ3Rec6okP6sudnqQ3iYhrb/ndxS2VwvqUd?=
 =?us-ascii?Q?bD8P4rCIadiUGMZtai/h+6VXLQQlx8qt389PFi77iX/2GTjbzMPTfd48kBtF?=
 =?us-ascii?Q?UKeQV83/8QJzyufNHM28voPdmzXzZQ6WFCKm+2lLfZjdCaThar50h5xJg7UH?=
 =?us-ascii?Q?mZRfpYMTzRWGK/VpxcmMoB1KNMZDwTrlSPwXgpR/qms25+3DD6jmUUrFY08I?=
 =?us-ascii?Q?jaIV58gxvtFjJKJNhnYK4bWBbg7SNqqbDeA4Qdi6Sjmpwb5vj6RbyQCZUZLT?=
 =?us-ascii?Q?lcMaS6OsC2RN2xQf4Bzhdvs+vPwY8TSQDiS3mK8muYP3KVtBVrGy3P+n8RUZ?=
 =?us-ascii?Q?zJBdVqXEk67cwuglByVYWARIIBiRfCFPFuB5wfUmBna4y2hdwOamvLBh0eWQ?=
 =?us-ascii?Q?iDQCCah1f/3aLMoTo9DdDqzTStw9CkchNMBr8Aso5GJgEbgKPyxcwBq+kvPm?=
 =?us-ascii?Q?w3B/i/M16VlljhElfZ32IYZNFLJdQCaTNZsM9P7xFboMo/NRFlUvLOOElVeG?=
 =?us-ascii?Q?OzlV1MA0kcOO/mA46+lwG4pgoGtj4qLWAv7H+26OBBwLmdr8lhzSikLr5U0+?=
 =?us-ascii?Q?hBz6LihNPAoK6k3nOMNyFPHf+FXwASL2MdDjEaJ4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c275ee2-eeb3-461a-b99e-08dd60a69a5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 14:11:22.6913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uzQACTYEsF/hokt+rJqkxC0yqV1U1s9p40M6zTfKd2SLn6H5+l3xkRuz8gg+ENJgj1PW0PWlHBjKZeWtzlAqQeLyTDY0sNoXSF0RQMc3vkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6885
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

-----Original Message-----
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Monday, March 10, 2025 9:51 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Zhang=
, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.co=
m>; dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults
>=20
> On Mon, Mar 10, 2025 at 05:18:32PM +0000, Jonathan Cavitt wrote:
> > Add initial declarations for the drm_xe_vm_get_faults ioctl.
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  include/uapi/drm/xe_drm.h | 49 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >=20
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 616916985e3f..90c2fcdbd5c1 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -81,6 +81,7 @@ extern "C" {
> >   *  - &DRM_IOCTL_XE_EXEC
> >   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
> >   *  - &DRM_IOCTL_XE_OBSERVATION
> > + *  - %DRM_IOCTL_XE_VM_GET_FAULTS
>=20
> This should be a generic "get VM property" IOCTL, not a specific IOCTL
> that only retrieves faults. This allows for future expansion of the
> uAPI.

Question from @Zhang, Jianxun :
"""
But first of all, should we regard faults as a property?
"""
-Jonathan Cavitt

>=20
> >   */
> > =20
> >  /*
> > @@ -102,6 +103,7 @@ extern "C" {
> >  #define DRM_XE_EXEC			0x09
> >  #define DRM_XE_WAIT_USER_FENCE		0x0a
> >  #define DRM_XE_OBSERVATION		0x0b
> > +#define DRM_XE_VM_GET_FAULTS		0x0c
> > =20
> >  /* Must be kept compact -- no holes */
> > =20
> > @@ -117,6 +119,7 @@ extern "C" {
> >  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, st=
ruct drm_xe_exec)
> >  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_=
XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> >  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OB=
SERVATION, struct drm_xe_observation_param)
> > +#define DRM_IOCTL_XE_VM_GET_FAULTS		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE=
_VM_GET_FAULTS, struct drm_xe_vm_get_faults)
> > =20
> >  /**
> >   * DOC: Xe IOCTL Extensions
> > @@ -1189,6 +1192,52 @@ struct drm_xe_vm_bind {
> >  	__u64 reserved[2];
> >  };
> > =20
> > +struct xe_vm_fault {
> > +	/** @address: Address of the fault, if relevant */
> > +	__u64 address;
> > +#define DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT		0
> > +#define DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT	1
> > +#define DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT	2
> > +	/** @address_type: , if relevant */
> > +	__u32 address_type;
> > +	/**
> > +	 * @address_precision: Precision of faulted address, if relevant.
> > +	 * Currently only SZ_4K.
> > +	 */
> > +	__u32 address_precision;
> > +	/** @reserved: MBZ */
> > +	__u64 reserved[3];
> > +};
> > +
> > +/**
> > + * struct drm_xe_vm_get_faults - Input of &DRM_IOCTL_XE_VM_GET_FAULTS
> > + *
> > + * The user provides a VM ID, and the ioctl will
> > + *
> > + */
> > +struct drm_xe_vm_get_faults {
> > +	/** @extensions: Pointer to the first extension struct, if any */
> > +	__u64 extensions;
> > +
> > +	/** @vm_id: The ID of the VM to query the properties of */
> > +	__u32 vm_id;
> > +
> > +	/** @size: Size to allocate for @ptr */
> > +	__u32 size;
> > +
> > +	/** @fault_count: Number of faults to be returned */
> > +	__u32 fault_count;
> > +
>=20
> fault_count is implied by size.
>=20
> Matt
>=20
> > +	/** @pad: MBZ */
> > +	__u32 pad;
> > +
> > +	/** @reserved: MBZ */
> > +	__u64 reserved[2];
> > +
> > +	/** @faults: Pointer to user-defined array of xe_vm_fault of flexible=
 size */
> > +	__u64 faults;
> > +};
> > +
> >  /**
> >   * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE=
_CREATE
> >   *
> > --=20
> > 2.43.0
> >=20
>=20
