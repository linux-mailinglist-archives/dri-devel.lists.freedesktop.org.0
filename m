Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 711A586CF5D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 17:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DFC10E1F2;
	Thu, 29 Feb 2024 16:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QP7iWI/1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB0F10E53A;
 Thu, 29 Feb 2024 16:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709224442; x=1740760442;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aWm+L/QPDBb8eD4+xivVm+Vx8beKNhMbYKG/xplPWB0=;
 b=QP7iWI/14p/LiekxQ7PuhIpIUUd60E1hzAIoSkkQr9OrsJYC32fSNotP
 81jw8p7jemeiNLpfyJvBD4AkFGB5w2tgpae2oIZczofQNo5TYsRPHbea6
 WbuzQt4gSVp4RH8dbW3MyT4zRMn/mlr4DlDap8o88jDewvGe3gH15S4vH
 fcLL2BJ5PWgNnT0w3ZzEVXDf9FceuGTFQfYwmNIbDdv9UySN4ZENuNQJC
 VwebzTCFxJcGva+JQQCd5/kjy1Wsm6jF0GVluZaNWsqfXj5kMxL2EojCO
 9XCTDF2KQrku1mSHXOsAYtRkPIcZ0cej6TEsmKzjdBiUy+miLmiH5bSAi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="26169197"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="26169197"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 08:34:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8121347"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 08:34:00 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 08:34:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 08:34:00 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 08:33:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkEEKZXPR/1KQXNvl45u7oRZJtC81bOWrHcQ2D+v4U+fNhPs++yEOImhjsQA96yHUkJy5OesCJTrcaWk859sQ29J6gAllSwwExAca190QLq7a0DFgS29Mzn7y9HkVkLYccUL5365LKqcbgmqSruubgEFvo0JzgKl5L3sutPSyNdU8IXUXqrnkPxmMQP4mo2kqZtlJZBIaTkOyhnoQs07H7THw1da1mxAVNLLliNoxwhF+YgZ4Opdeo5qSHMxSNDKl8/9dJ9zJogvBoDInDSQeTdHxHnIX5pRdzGK45yIUv/e5nnmtVsfUQtOEhInmNV1Ls/BsHp8YvFIjlqZCGK2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWm+L/QPDBb8eD4+xivVm+Vx8beKNhMbYKG/xplPWB0=;
 b=QsQKGmOcoVGuPWqJ92LPw06sAjwm6VR2mPbzD1ibzvgwfroh6HCJIDgybdbC/ZKcAGvcHN8rJqMSKMyeJysnbgbat3eQOX0MMWs1sXd3IkC01xtV/tsNItT4MMrGPtZnVKTab6tEyMkJmfg93z0qem4F1/Rxd0WLsGZ7/9KOulhOLNkXe9hVn0SDuYdaK7RK5at4wCHwcajN/S+8xca97NKR2r7r2cmBsxH49YFJdGK8vh1spFw4KbwKOxfdZ5wNjO3oX0GrGhzuLKfw+QzRmYaxFH+KsRwQVOJ3S++o+CCQvuT9Bm6kpeAINjyG8ZObxB3EZJlaxE+A/Hsocivmgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by SJ2PR11MB8499.namprd11.prod.outlook.com (2603:10b6:a03:578::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.12; Thu, 29 Feb
 2024 16:33:56 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::27fc:befb:9a38:279]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::27fc:befb:9a38:279%4]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 16:33:56 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v12 2/8] drm: Add Adaptive Sync SDP logging
Thread-Topic: [PATCH v12 2/8] drm: Add Adaptive Sync SDP logging
Thread-Index: AQHaalTHRUKmBtobpEGD2AqjrUtCWbEhIfcAgABjHEA=
Date: Thu, 29 Feb 2024 16:33:56 +0000
Message-ID: <IA1PR11MB6348DD3317E4B9D860E426CCB25F2@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240228143823.2762595-3-mitulkumar.ajitkumar.golani@intel.com>
 <87msrj8sjx.fsf@intel.com>
In-Reply-To: <87msrj8sjx.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|SJ2PR11MB8499:EE_
x-ms-office365-filtering-correlation-id: 03a6b25e-891c-4531-c62e-08dc39443971
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FANtoGnTKE+AaUZzFfo4F8evunfFfmptaUtUqrA6lYYyk4O/CninsNlUOujoGkBGvIVPRvVRjn2pFPUwKi8CKzfLg08SfxiyCEDbt4QWAtKj6r8H/GLvoZRXu/bJtV/IR+8FCzqUMwn4qeLPOpxF9/gp4hYEfY/LANMTo7u5niwIk7hrzhsZ5TvN7HCDM+HmXgK4AWcGuQTibs0B4MrBJXa3Yjq/CmFhulaRnk9Jv3Ny85eRBgVRKFS7Dwtp3uQyQS27llzMuCCJ2Pyr3JGf3Dc5lzjA5Wf14Aw20bYFHA9BTIfnr5VE2hzoh8QEbB78OvOgIc7/3L8gv3iLHBd+HGBjNcoKP9SxkPmIiA0RH2Sfd4cq9LQeH1s/ZQLZRjbkHRLGo6plMa7lOMe91GcUepYLfr2xoSRBrLJtZf8sA/WKdj++vrWDE4fDuNb6thLZsMxLFk0Jepg4/ntf4BdNUKjQjs7kXaw9CjcOwuPOXSbuQivuYTnSQ5Y8vAvOWULmPBkeJ/Tos8SUkZh6Fn5LJQBKyzNxY//8khb9BCpj9xh8rDwbtW57WK4YBTJqFGPQZuNHA8UqPfSIQUwQAZRd3b/sbQwpMuf0J2ie/PLd2P5gtK1qnkoy69/ZfZj79ZJkX4+U5jhjKs0jx4Q2VRsLtO2XvlguSMGCmtcGWH5wOCPgcVzHnylVYaYN5a1BEwjlEMqIbrCa9bzi4WDO7UNEiXYhkNht0Dp4fZxRzTTnvFI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ukh8VILi/fji4D2VfNKvM94Lf1ABLomPKneWfpwJD12Pa0saY7wZdSThNsae?=
 =?us-ascii?Q?+cLu5zmxeX/jT/9cd5nY939bRHv204GkKaV9n71yLHDsH2jYfz9Aas1aQR/R?=
 =?us-ascii?Q?mlsAMk3Ix29n7p4mISvWVvYuCmoNu6SK7F8cnVMqxDg5Riqt+XTMTV/81t1E?=
 =?us-ascii?Q?MxUKtnd2uLWCDIwOkzeCCmIH4eH8FN2lgOLh9acZb3y6iXLo6WZgCq5ceyON?=
 =?us-ascii?Q?UNTe8BMM3h08uyPzAC0ntOUgIk8x/TFUuTPBhSNONPuFvLNeg+Md5uEELLpn?=
 =?us-ascii?Q?3NwkCAx5c67NYb3WEHqfqMMcQoZPI7SFgNqX6f8NkPU8+lg96QAKxDatczKq?=
 =?us-ascii?Q?HyXqbLjemq9z+2CyDocLLFDUiwRE2g3smI9a3kk/cciCcDAAZDhGuozFSpOw?=
 =?us-ascii?Q?N3pJSFs95PEMETrIHOgJgSWJkf0qzqJJ0YNcNBHBToArIFZ1zcMU1jPqtrdE?=
 =?us-ascii?Q?d96F/tJiEBpmdbXUmnIs2KuyzxajKhPBpVwBl5Y4uJZB5x7kvhscfseacZtI?=
 =?us-ascii?Q?pQYs8BCxWbvbwr36GoUKhiS2edwH+IMWGrC/463a+q55i8lRBgYVxdRCmY+n?=
 =?us-ascii?Q?H5CIp+inoeZdECk2W3ScWS7QIqrpaYVzRM5lDUg4OdW+VkMgi9zSFTjbpdA6?=
 =?us-ascii?Q?UbPUkMIFrdnJr03O/1dWtr++F2zlJoE4IHjG3JzC54ed30IKKBBskIQ97hgI?=
 =?us-ascii?Q?nHloIq4E4N5KV7IJetJObxGavZRYUKpZQ5pL84i/XGtEsjT9CHqirLWJnHlN?=
 =?us-ascii?Q?ux6C4Ra+kKBRym06nCrR1FmpV9gOdD+FJ458x50uzY/xVyy2pteTu8mBPXaV?=
 =?us-ascii?Q?3Icv6mvqmaLcMumhNijwDgkuKYLEEtgbbGkSncY0ZZOIOR+T4vIrkzRAXwF9?=
 =?us-ascii?Q?vPv03WP5LTlxUQ3YmK0nfbtcmvcRCa8ntySbf0IaPOyu0dzalArN0c9iRHG8?=
 =?us-ascii?Q?wvwSwQNrdEbfX0SrqTmKWR6kecEOlvCP7Wcl+yIe5FYWoKRPXtFHxMfhrOKC?=
 =?us-ascii?Q?D6YNrwWtIUm3fkXb5lXDbfip4Y1M/ZRPNbDfgULEmQC8aVgj2F46GEkk+uTU?=
 =?us-ascii?Q?2TW+RbXkgwzSlFLXw6Hs4mGwpz6LRQnrxyWWxDpgLq/NkwHmjrVZ55F1S8u4?=
 =?us-ascii?Q?G/okLdluMLEsLA8UsIOGClTnuM7egIWDgs4KmeH3Nw6/izMAEqTyGG5GQ7h/?=
 =?us-ascii?Q?i1p4sLKO/PM2YCTw3+9q7DXpX4A+MPEbyaiNgmUYxVkPanYRscf2qfuX7Ene?=
 =?us-ascii?Q?0ViaHpvilQVayaS6kpw5KvDniTK+yytTPm8rHfKNt0dafk1So0MqhSuVx1NT?=
 =?us-ascii?Q?pWtfYd6UcqGowrWTPoK4VbCV+olhX3CBHI0kP6TRdVHBNPZdiODa1bJ+pR9k?=
 =?us-ascii?Q?nSaU9OPlOsUYpOFEDPsYo6+TXFEJ7BXoPog6+JMcE/Oxp35tuL2/id4M/rE4?=
 =?us-ascii?Q?mC/yFUepQYtGJBxQ+AvpJzq3UmPVavs6qPZyGXTkJ9uACqT9zL2uzG1+JRYU?=
 =?us-ascii?Q?kX5+G5RQIaXqVVCWtNF2nGL20zlOsJJjFcdClUIKMWkv4g0bGymeaO/wugc0?=
 =?us-ascii?Q?bchGi8Xch3gAVBKxfz1UB9sHzvJgWMzswwbTSxSIKxoPSPrB3xGct0opX1dW?=
 =?us-ascii?Q?tJX6TpV+P9yDyzaORK8O7ns=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a6b25e-891c-4531-c62e-08dc39443971
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 16:33:56.3672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chQaMGMVd7cNTNktRJyoaUtR42sI1LYMUnEf0wbCX7QryhKzlxAUsKTWoFC1Hz/uvJtiQTWAsUks1Osvk7Ax/E7Mb5yUykV1nZakhWVtmEvEMZdKc3iFtmxTbAN3TQI9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8499
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
> Sent: Thursday, February 29, 2024 4:08 PM
> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>
> Subject: Re: [PATCH v12 2/8] drm: Add Adaptive Sync SDP logging
>=20
> On Wed, 28 Feb 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> wrote:
> > Add structure representing Adaptive Sync Secondary Data Packet (AS SDP)=
.
> > Also, add Adaptive Sync SDP logging in drm_dp_helper.c to facilitate
> > debugging.
>=20
> To be honest, the division of patches is a bit weird. There's no reason t=
o change
> i915 here, is there?
>=20

Hi Jani,

Thought behind this was to use the function where it was defined. But no wo=
rries, I have split it with new patch series floated.

Regards,
Mitul
