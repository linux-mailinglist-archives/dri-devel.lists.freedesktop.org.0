Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A689532C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 14:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA3610FD05;
	Tue,  2 Apr 2024 12:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gnry5jzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2121.outbound.protection.outlook.com [40.107.95.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA93C10FD0A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 12:36:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqOI8to5S4HZ6AL8k3P5qHTGRxlJCVae+KXng+NpzZWd3M6z4TQU/utZBBtK8WunsvqXZlKrooR43gB0DZAYN3Kbc0D4XQkI0Ix112tWDxiYt9zQ+m7ULY0mtwQmvHQJyHXklIKVPyLohzR2YYkqQggNq8a4CxD1HOQgZa9X1vLSEsdhOo7I99GbQj+rmem1dXSr6mFk383HLT+E6xfrko2GCZPTwmB4iGOtcxtJdYohY0HEhdui1D7aTxyft5pY2H1h4PrzDnlqKSnnsIcAaoyhFk/tqXNA2GBMnE7wAyazUnJMsv/L24+/xwPmUayxF+hcJWUecaHEYbmninRzUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYbdJj/pBPw/uVhhjJC7/rLhnpYa4y3txEoj82lxIHE=;
 b=QbzkjiZcnZ+Je+8tKyVniLVilhj8UeWzQKAvmcCLHAdvFobkvb11CtMJjx7n363Af62XXwqNH27D7eC/nacLSaNNgAHFxt9gTHNT01qK6K4JVtWB9AfzOY5xvmmHKCQJMkE5fj2XZQoesXsQ/bzKsfNYxare9wUX+0gPRSsXd7ggR+hRERFJECuLqPiSj7E0zgc78iAca+YnFyX8QYFyPgJwGw1eQlpzmmj6K0jxP4eOaK3hLTNCV3wvBkwVHrlLgTcycmXwD8JO+BhPA/l2eJz1Fhif2oQm2n5+tPo3mFN/AdpzzXkUV2Cq8tkuIdPGLAiPbv/SaHpyNLxM52peZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYbdJj/pBPw/uVhhjJC7/rLhnpYa4y3txEoj82lxIHE=;
 b=Gnry5jzFrssIYpn6a/PZVj+5cFMq4Z6txnBImQhY+i413Hrp0xtmg9fEGYjWqnpX98JTsd/OquxOpEL5s6vIAtGCeI57xgXGuK7WfDQyrJPzJF0jciM/ILH9zuKJUBgtYzN7TbsNYkgTPQr2F/TCSdz/XWtkCUDmwA1Om/iUOT7H/0Jr2OIr5S+95piK0q2Jbz0rrlZ/FFwDMrQlKMZm/kTIl+N/cgKIwAE4gvYwkzC4QYxK1FdTSVn45Y+802TceUrJYyPSCViAAlDhbd+GmjCtydJeOZ9YFiNrFwi2VB0ZbhSd02p5sijaERzt3XLoK0Ms2YGvsxEH89peS6PcLw==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 12:36:42 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::ae74:c645:b13d:3d8c]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::ae74:c645:b13d:3d8c%7]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 12:36:42 +0000
From: Akhil R <akhilrajeev@nvidia.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: "davem@davemloft.net" <davem@davemloft.net>, "robh@kernel.org"
 <robh@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
 Jon Hunter <jonathanh@nvidia.com>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, Mikko
 Perttunen <mperttunen@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "linux-crypto@vger.kernel.org"
 <linux-crypto@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v6 3/5] crypto: tegra: Add Tegra Security Engine driver
Thread-Topic: [PATCH v6 3/5] crypto: tegra: Add Tegra Security Engine driver
Thread-Index: AQHaedbyTqDDO44+YUOWKfWU3w8p3rFM/XcAgAgBdCA=
Date: Tue, 2 Apr 2024 12:36:41 +0000
Message-ID: <SJ1PR12MB63394D2C8C5329DE4B9B937FC03E2@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <20240319082306.34716-1-akhilrajeev@nvidia.com>
 <20240319082306.34716-4-akhilrajeev@nvidia.com>
 <ZgVCxnI0sZcE04io@gondor.apana.org.au>
In-Reply-To: <ZgVCxnI0sZcE04io@gondor.apana.org.au>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6339:EE_|SA1PR12MB6824:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DNfHKKo2+Yd/jP5vB9+nH6MNz6T1sL4WSPn1+wzzthHnhOfgyfT7fyB6v77bipI9hQZupKJvDlZo5OcJ5bmhivQ2VH9zTwQsTXBgdxJygYFALRdsep3Yv+j54Z03jZ5HDZM4RBBdiybf+anrJ2k0h8mFLPQksN4WjOrKW1SIwuJrJG8280lErJRn57eEWADRYnDVdiEV4Q4Z8hW05omdHcokKJaziREUUN1MEhXe+9n/k5LThTmr5hBMOtW3J4s1SZaXmJt5dGZMwLAob8oQtpNOInODeXEGS9gUyq2y2b5RuqkBhkVSxdx8I+HOAVuPFg5LeWX4obppZeL0ft6fL3cr2tknIb2Wj3nGaZyLRmCgdRcFSJgNMAW2H4wob++D5lfu0YbXGTdxbSw1DNnnnNAPZdZNgU51YJ2AM4DnHbKEp78CqpLCeojhRHV0xLCZ/IbF30BBH5JtCTP7jITQ1Zch1ZbpbHQ5yMJ72Y0jUElp7UpKP4tH2RhoLTn66zjLjPDqWr6/0js17+srdO2XdX+iTAJLNFDfDI5rpiDfocRzEZLj7vCpjNy8L0qcEDtFcpfAl9NXu1R+4qAHCGCFxcRMJplJA80H8zJORwUfUWSO1Cf3PP/a4hSkO0ChKxOMkrKoMigB1EdKxdRl9JhxPFmEeGt6hNYXcBfe72WfJlw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR12MB6339.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3jC8nFDWBKiERIYVE/NeAuDSbXfdW0s1o7rjbrY38kj5+B8ZxLOQhCXX90ve?=
 =?us-ascii?Q?GgZZE00bsxaMXXWuARzUF8GcVzxm76rblhtKZx6oi+ywc+RkT54iRO+tegYx?=
 =?us-ascii?Q?OKDDTgEHKST9RhqKSzwkAXt4WCdfgPCT4rwjPDnppf5t7aYazEU85fVShOSa?=
 =?us-ascii?Q?jCeK3ZlYD6Hu9v72gSsH0n2QU6FIJEV6FtvobzA77bJlRWL0iKiNOT1EWpog?=
 =?us-ascii?Q?AxLAOp7aBCMRwKE6e9oNfUeCkBO8td+Y8isuKL299Htz4Fl6OSoeT97VCM3l?=
 =?us-ascii?Q?vhP+yMH3/bdNKrs+JBftFOqskEycuxlZA6ar0dYkxkAtSCgoIABb8Rl82e8d?=
 =?us-ascii?Q?yGtEynmDA2ZWca9r11GWnZ3JPK0Ze8JCxtNFI6pWnSrElTbbgDuuTWG+hh9X?=
 =?us-ascii?Q?/hxbqfPtFp+UlIgKqy9UwvbSmA0rSRAth9TBU7/1J/FGdKG/+vHoFLOSDAIO?=
 =?us-ascii?Q?xsgFSf76MTpT0VQXWo5sGCsa7hACY7A/Q8r379TlbFacaVfxRyONHe9ESnVC?=
 =?us-ascii?Q?wfHzho0g4G2x/xEj/plpV8tZepqDKKDWYyg6J+6KvIJjspUytax6KvuYFh8t?=
 =?us-ascii?Q?TeP2on30xWgbwpgfXDvCVJUCQCDEcbwv5nesq+ylkeb4tcMVakIxV75QwxIS?=
 =?us-ascii?Q?bSkg2cOm5D0XcWbWj8ShII3isEDUwYr2dKpnSLO0txZpGuehWEKYIiKXlg1f?=
 =?us-ascii?Q?nGsaTYOHrJ1mNFeZJmsJyaAjsYycWn7x+Dy4qSFEvug5HZSJZkMsPIvoT90g?=
 =?us-ascii?Q?ec2AAP53quTcapYeFwS5wuzgRXqm7Tsjo1V0cIW92N1S8loMr04NNLgsMZA6?=
 =?us-ascii?Q?2MIa2AYSf1a/YZVGSdgKytEqmjx7Q5xRYNF0dHskUj3mw1/BC70LCHnQSbpK?=
 =?us-ascii?Q?ftil+RrgypeRvhYhhY+mWkGOJY8Z74mt89cbm1a0nvra1VmmgaPL/7n40vV3?=
 =?us-ascii?Q?0iLXikDOko8AGzWfRJXN0nncjf5e2IctzvsMgFw2kjQFmJhKUKgyf8TInpa2?=
 =?us-ascii?Q?gS62Y8wyV7F6KGw4BKumQ2tkiQ6fRDcg7pRx26aVM3OM///MFlEt4leGmG7y?=
 =?us-ascii?Q?NNkov3BpTGlFd4Gni/4k0Sp+MG/Y4Qb7bACAGfh1J2uKQF6epmK8v3wyganH?=
 =?us-ascii?Q?so5bgFqRsC1I82m66wFsBL+U59gdtV8QBrCzeyHn0GMYKVgaiInJzxo6Ww1H?=
 =?us-ascii?Q?tmGmu0u5FO1D6BpUArZRm0dd1Q504Nu2sPM9SA5C4u3IW2pGxHPK39A+k9oV?=
 =?us-ascii?Q?YGQz0lZYCEVdqMHH+IWyNw2p3Cr9d/lrZeg3CEz3of1Gueq7IrI84ADrTesy?=
 =?us-ascii?Q?ybnNAgnq6LHGJ5W7xpco0hYEFxX8GEVBuFzWmVe/OQdtGhrZm+xB3uUApol8?=
 =?us-ascii?Q?fS42jT8uDmeWccXpzjoV4OvTXSesbub91T/NSwtsZoBVHqhO0N7bKHi5U1ro?=
 =?us-ascii?Q?NnITW+DD/1us3mwU4SpTtTNe3IDYUGCSfxTmb4bdXkPlQYsCS40jwOCW7ZWz?=
 =?us-ascii?Q?8658uvHqk3ou53hrz49aRsBYJppVAv8NmRZsBaSmu8nM9sB7KACNxSL63WSa?=
 =?us-ascii?Q?HOGSdVNA/2S1ce3WfUXWur92ghxfHYF49mSsm+iU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f855cb73-98f0-401e-a3bb-08dc53118cb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2024 12:36:41.9949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XEtx3b4EPU+NhxQPQvKhs/j/b4pD5kJhcnbWDAF2FebJaDNJqMCPlf0RKOIvB7qxLFbeZr6mD3NaHh9huSksbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824
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

> On Tue, Mar 19, 2024 at 01:53:04PM +0530, Akhil R wrote:
> >
> > +struct tegra_sha_reqctx {
> > +     struct ahash_request fallback_req;
>=20
> This doesn't work because ahash_request is dynamically sized.
> So you'll end up clobbering the rest of the struct if a fallback ends up =
being used.
>=20
> You should place the fallback_req at the end of the reqctx and set the re=
qsize
> based on the fallback reqsize.
>=20
Should I set the reqsize as below in sha_cra_init()? Seeing this in other c=
rypto drivers.

        crypto_ahash_set_reqsize(ahash_tfm,
                        sizeof(struct tegra_sha_reqctx) +
                        crypto_ahash_reqsize(ctx->fallback_tfm));

Regards,
Akhil
