Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F035D908E97
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 17:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A5310E27D;
	Fri, 14 Jun 2024 15:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJ6RQ7iF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A4910E27D;
 Fri, 14 Jun 2024 15:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718378641; x=1749914641;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9kZoVEd/xQZMFQXoMuWm4jfibeDRPMeCLEjezOFsOBs=;
 b=RJ6RQ7iFl+z3hT9Qj4ti1LALTTeEgr3Nh7vQ4BaFolFE+oX+WLSyB2w2
 /RGqSme60uwz/q/nmbw5n5I8uP+EWMCc8LgQ4JfhgYBeCCvXaONZF54aE
 +LwTlFe8onXo+wcAOHQpYCKmtzSklBtCdgn81ErOq9qY0P4BdkaLTA1t5
 8bZaWGyKtZGrgfYWmqjsCjZhRq45zRjLOjn1VWIqXLX3VmFslsSWlof+2
 zx7QcnmibSvJ+QmXk7vjwfBwDpUQE69HiHss6FQO47ZXu8SMliRqrUE/9
 2MKhKGCbxRw/uBjR/uMAQQ4Jlpg6tsUnbc3IMVzP0653K5T5nUYsn+Bg0 Q==;
X-CSE-ConnectionGUID: iU3Nd5uIRteP1GoOqNnHfQ==
X-CSE-MsgGUID: wdCmEQsfR9ic0jUSt2ZKig==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15142967"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="15142967"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 08:23:59 -0700
X-CSE-ConnectionGUID: TcPiQjj8QF6jKN/wN0E7ow==
X-CSE-MsgGUID: Al/Tt99ySHimXaa8sVT0vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="71727364"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 08:23:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 08:23:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 08:23:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 08:23:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EW/NsgdBypuOFzw8jwyspq37bhHVeZ2EsjzuXGIievTUbsMSfbvFl9YVACOGlUM5WbQ77kr8mxRAFROgAsb8FE4/k5pVnCCl/yZgwYrrVztD87wHbrBpPLAR9NjRYH+3MKthroWsQnP+7WSIj3znG5BrML+2JseABP875CTUibbmuSxst89xzxuivIS6EJrs6KCHsmKXw8UaLz/5Mz/pw0NhSq7S8W90f7MPh8d6qrWrfkNENt0dY+96KFz3fjmx1fa+TJWEYFIICTKM0yHmh6mW1Wtd6VU2Q2tCig8sGFW/jh+sTkwG1fmJ2kvF6H2jXSijcHtdXhqY4sfDQgaPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6h3sVcLZZldpMMcpT9ueQ0sgPKpcjL1Oftk/bdIkejU=;
 b=hoTqZsoF706kGB/hve330XyI89cPIBGunjm1QB24b0AzSnMByL14VxGE8wrW5UyXd0wGKPE1p23dvaxNPJuhLCNor4tl4nf29FpgEesXABhXgyAnCxeCxz6a26CENZ1f45MM9NKHPG4xxKZT3tC87dtD2hyLlCQuHXvRO4VjDPfnzPagdpXq3SgFBTcZGRR7xkVZ7nw8K0mIaPrehazjxatyVO80HN2g4ToLN4XBoZ1LI5qXp45cMx4BHYnIEcgLkNSzr3y6wG2+fzmnGkCaDuX2jUXLKx+GeKBHOnzkYywOo770Ay+QxtZYMynL3eTZMZ/Ud53d3qFmjlVPJNL9NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB7422.namprd11.prod.outlook.com (2603:10b6:510:285::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.26; Fri, 14 Jun
 2024 15:23:56 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7677.026; Fri, 14 Jun 2024
 15:23:55 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, "Harrison, John C"
 <john.c.harrison@intel.com>
Subject: RE: [PATCH] drm/i915/gt/uc: Fix typo in comment
Thread-Topic: [PATCH] drm/i915/gt/uc: Fix typo in comment
Thread-Index: AQHavm6e/jycwN/fd0WB4vYJ6UVqzLHHYHBA
Date: Fri, 14 Jun 2024 15:23:54 +0000
Message-ID: <CH0PR11MB54440CF4CB01809F00A1B0D4E5C22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240613222837.552277-1-andi.shyti@linux.intel.com>
 <ZmxgEZe5ztpBzUYb@ashyti-mobl2.lan>
In-Reply-To: <ZmxgEZe5ztpBzUYb@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB7422:EE_
x-ms-office365-filtering-correlation-id: 4943c591-5b36-4122-187a-08dc8c860102
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|366013|376011|1800799021|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?lM9+YW6V8TIbCSrv8FL7fnvxqBHPD9MTqYr6SI6V/GkpXz+MlI88S93k/lqC?=
 =?us-ascii?Q?LWaGkNYBwviJihO6CQAEU/Y+phXtsBQB7VaKRvQP7yl+PCbfJkxf+7iqQ6yH?=
 =?us-ascii?Q?IqdxiAC8RfibW61LUCqNKYh6UgzHjPb8ICnmovjqHun44QMHQrehQKXXjNPL?=
 =?us-ascii?Q?ItqS5Uh5ESaMq5Uh6v9Nv3Gr9G+7MaP4SqdG12MpTLILRmuoeoZg2Q3PmwIA?=
 =?us-ascii?Q?54jMRcZ5GrYYZ4RfyT5uRHyh0CwhzH7iXeDi5y9Emp/pz8V7WW4Cm8yiRA91?=
 =?us-ascii?Q?NNkPKKvJW2yqfvWXa0ZV+EicDk7W1vxRxNgvki9jvRz1cgP7DJBSWSC/6eok?=
 =?us-ascii?Q?AH8D+hIfA50yCyRFZlbKFQC7Y6r0IulgZ1bFsY6JeGeLTRc7voLrvyI8+MOY?=
 =?us-ascii?Q?TkcfRgsdIZ6xHi9+YFSG3pnJE1mzYEnJ2x1eOcP/ksT63kDJmC7pHUT+DfRM?=
 =?us-ascii?Q?/jjk/QMFb/5CYN2gNOK0/IiYuQ2K4qZDUpkZTAEpZO+PkE3T2G7gxjtB1wit?=
 =?us-ascii?Q?/XGp2wVF6AOvFWjJi59uG2TVaPxc1dS/GK0iPm8j3GiCLwQYkb9buJuAWbGx?=
 =?us-ascii?Q?Q3afWP9avTAjvcFtsbqmeZVh9hdvY59MAjHuUGjyT+CHMMep/WWt+rITXgcL?=
 =?us-ascii?Q?aP8d6E4MAGHYdabK6i8nc4Zu0yXJ4ZezoRPCVYCibjYashFsB0eM7qldb2Oz?=
 =?us-ascii?Q?VNr5oWyHvKkvLmVZDO0FY19jc8JseV6v96LRHGH9B5bwganbddb5MTxYzW1S?=
 =?us-ascii?Q?4Os1CsneAHilkbn8QZl3r92/PC+6neRSIG5JqOVOLZfU+z4Qjzol4CBohckW?=
 =?us-ascii?Q?9jKWmne5/jo/olR9XYVdqUg5Bvlt9nmmafTAe4IeA9AKe24Pfdz/whsVO3d1?=
 =?us-ascii?Q?novwE6KXVQ8eIxwFTQzquvycfnXshlU9yAE1ostNe0Hf8OTpzoP8sOl+axK7?=
 =?us-ascii?Q?k0TRZC81U2FyFM8BTzMrtZTrribhjG6hnzxsa6P6bUNytHAITCH75YZMuIVT?=
 =?us-ascii?Q?W67v0FBgtUokuL8CbZfMG7ymgmbLoj5sIIxS1dOJeIjA3kigliZBa1mDKeIJ?=
 =?us-ascii?Q?BEdJHv/xNYCCRND3b+93jlur1xqPq5JxUbh9ykAdCdbidjy9n9PvpyPsfvl0?=
 =?us-ascii?Q?t1QsIBa5ZYH297duNvh/m/63A0Dd0nkeCJwfELRSdTY1W2o0v79gT0fIRmlY?=
 =?us-ascii?Q?jOFBzyUdhunL7tUCwdTn0Ab2nzcUJqbuTOEEQqGhbEs7ZT6k6ehx8RHcITc/?=
 =?us-ascii?Q?wz+VAW5crwDcmfO5Bes+cHszP4DNEClfCmoecA1KEjakbqtZpuvLGQFghDvx?=
 =?us-ascii?Q?TPxeQUhTEZPUFqXNEuarS9necf7sCyUZY2YMObA/d9JKV0JAf/Sn0JizyDys?=
 =?us-ascii?Q?SJC9oOw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7mtPvlFZCoQ449phY0oR61jn7E2bNy8h9oaa2c6fOScs1F851JVl6yAbyHxY?=
 =?us-ascii?Q?a7Mfavll+SDH2SZfL9nMkWy4GF0alNEe5j9cr1ZZXfE3jYApe4MAs/dyvyAS?=
 =?us-ascii?Q?uroFM4yJmXYUmWi8hkN8sY+ugE9fVwFa9yAxJQIBLb4MbZ90223u0efMrZY3?=
 =?us-ascii?Q?tLG+t63nl8OIKzFS8e3Gq0vOCqrMWlafO1GjSxF7fGWCPheBo2983XEhpC+k?=
 =?us-ascii?Q?S4uvFuzYvD71i32XMSugVk4aYdJ50GseKNJqeQe+2jv+0363jjC6QPUHzpa8?=
 =?us-ascii?Q?qUqa4gAmT7MZ3US/WwXywllj3hmNmIe9ccMEd3eEhadKfX8gXqwwbiXlw4kx?=
 =?us-ascii?Q?gshhD5NCCliU6WCmIFjWWwFlKPctJFqsRi8IH+cHbLHFXT4xVtDWMeMaR7nI?=
 =?us-ascii?Q?IuvGLKtoRhly6lvvA5XGfgXRQnzLw28afpkkDZ0yDa132nY86607pv77aLIS?=
 =?us-ascii?Q?q6lrS0RPM11l0IldeH2jbhwsDxMy/pM9C2kMjR94I0usBiBEPCvjTp/SWPop?=
 =?us-ascii?Q?dDJGbUv7Y0u2TNRm3YMn66U5YkSw9kxdSvV0yC9qGb8Mpyowj+uRpBOizWEH?=
 =?us-ascii?Q?vF+tkuO/zHN68oXzWuTzIIJw9dXHAdXK2QZZZsISkPEUYSplJwhdMwHHyxjf?=
 =?us-ascii?Q?BvuKrWZq7Uoj7Sbsp6xvQb0+WVK2fF9CHG3n1Bi5hCfEohmffWYHIBdHHkKa?=
 =?us-ascii?Q?8SN8W8VPMwlCi5X6PDe/dmBbciQWb9A4o2Q6C8CTWSpflIV2eUm0AuNPwJ4U?=
 =?us-ascii?Q?E2MC7Rg/tWeef1t4mMeBT9CU6GpBIHCTh96srtjIDqBYwgNWMSbGdw/3zhgn?=
 =?us-ascii?Q?hjjywKdGZ48Jhv8bIqk5+7MD2w0cx0CbwogV6sE6HixiZyKCs4j4KUMycExC?=
 =?us-ascii?Q?cVedYoIbuVcmFVFl8nVeEz4LzrYHRvv3Y0gLfbinLWEoLKe/OtC5U76ZJJtg?=
 =?us-ascii?Q?uzaqHE113sLUpw/salDoSepIKQl37QLy5ICFfcKzboEFP6n2fofHwEgW9QPd?=
 =?us-ascii?Q?r+YyajY1bHkgTAYS+A2Lg6emUiGUWJJMbva21T7FdzKcTBGcNmS4tnXGzoT8?=
 =?us-ascii?Q?iN6DD7MC2mTMWS/imTOhYBAIqTLki0pLNnKRRAmmPcVpJhxlq5Orj4pJOgvh?=
 =?us-ascii?Q?iDRUJpyTZevXO1CvD9rUfeCU2RgYll0PHiBf3nSxaCx/q4jpJnlQCApSjA2T?=
 =?us-ascii?Q?Ko6fXvE8fGTPGs0rCVTCYtat44fxecpCbcCkeJo1mWCTEYEtj/UKsPKwl06J?=
 =?us-ascii?Q?3MfOTbHOFje4MKbLCreZB4D3sO7zhwzi3voAO8yeFOzT15++5/x7dCGqTzVP?=
 =?us-ascii?Q?KeKGWIsQcmV4fkgjj83m3QG9x4ZUR50rWhZdczMEeZBSBG6/ZlOPyR20HoGB?=
 =?us-ascii?Q?jVDC2IViilk0iyvMmsbDGg94WGp6+f8tsdz/i+fLi0YthfJwpAMz12W+qghA?=
 =?us-ascii?Q?XQ4MoER8Ev6hQVr+ljqxPeii2xRq4eDZymy2DGDwoTWiSs8Uk8e9Xv73kr4D?=
 =?us-ascii?Q?rYOEt7kpgPxcbLjzdSOglLLyRgP71paxMOlm2cw+d+hVRqByrTsAR4w1LO1/?=
 =?us-ascii?Q?ybFq6+K+4zk/ZVZatN4jlMoYQWWfKeUA5Gd1yTWf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4943c591-5b36-4122-187a-08dc8c860102
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 15:23:54.9980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YcvmWJdkE0z18hP5nWVjHoPwSpAXYgWPIRkq/X3a4HFLtwhwpjs3TiFlYbyYtDdFJTYWiucFoj0K6HlFyg2pE8ornbEyOXVKezh4eQefrtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7422
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
From: Andi Shyti <andi.shyti@linux.intel.com>=20
Sent: Friday, June 14, 2024 8:22 AM
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>; dri-devel <dri-devel@lists=
.freedesktop.org>; Harrison, John C <john.c.harrison@intel.com>; Cavitt, Jo=
nathan <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/i915/gt/uc: Fix typo in comment
>=20
> I guess sparse and potential CI errors won't minimally relate to
> this patch.

Yeah, I don't see how a change to a comment could ever be related
to any CI errors:

Reviewed-by: Jonathan Cavitt
-Jonathan Cavitt

>=20
> Adding also Jonathan in Cc :-)
>=20
> Thanks,=09
> Andi
>=20
> On Fri, Jun 14, 2024 at 12:28:37AM +0200, Andi Shyti wrote:
> > Replace "dynmically" with "dynamically".
> >=20
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/=
drm/i915/gt/uc/intel_guc_fwif.h
> > index 14797e80bc92..263c9c3f6a03 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > @@ -295,7 +295,7 @@ struct guc_update_scheduling_policy_header {
> >  } __packed;
> > =20
> >  /*
> > - * Can't dynmically allocate memory for the scheduling policy KLV beca=
use
> > + * Can't dynamically allocate memory for the scheduling policy KLV bec=
ause
> >   * it will be sent from within the reset path. Need a fixed size lump =
on
> >   * the stack instead :(.
> >   *
> > --=20
> > 2.45.1
>=20
