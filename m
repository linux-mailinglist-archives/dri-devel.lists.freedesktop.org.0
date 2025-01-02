Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5329FF735
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 10:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A9B10E3C5;
	Thu,  2 Jan 2025 09:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scioteq.com header.i=@scioteq.com header.b="luEBTI/J";
	dkim=pass (2048-bit key; unprotected) header.d=mail-dkim-us-east-2.prod.hydra.sophos.com header.i=@mail-dkim-us-east-2.prod.hydra.sophos.com header.b="nDIPQBER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rd-use2.prod.hydra.sophos.com (rd-use2.prod.hydra.sophos.com
 [18.216.23.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE1210E3C5
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 09:04:53 +0000 (UTC)
Received: from ip-172-21-1-173.us-east-2.compute.internal
 (ip-172-21-1-173.us-east-2.compute.internal [127.0.0.1])
 by rd-use2.prod.hydra.sophos.com (Postfix) with ESMTP id 4YP14N1yLNzlVjd
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 09:04:52 +0000 (UTC)
X-Sophos-Product-Type: Gateway
X-Sophos-Email-ID: 21affbd1b7ff405d8f875131033b4a88
Received: from PR0P264CU014.outbound.protection.outlook.com
 (mail-francecentralazlp17012050.outbound.protection.outlook.com
 [40.93.76.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by relay-us-east-2.prod.hydra.sophos.com (Postfix) with ESMTPS id
 4YP14M02GTzFpVR; Thu,  2 Jan 2025 09:04:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvD0CGs8r2VGl4rSK0CNdkVX09/oJxVoMA14+EUvwbOhloXlue9sQiYy9c3Tce4ua5aHciMCT1cNTAAyEGBSFK8uVGkpxqpmSMgA5wffnvzRKfNmx/APC4Grdv6CQBkthBb+LGTd204Qj4Vr3om0P2lxcCt34pkDtN2dGn/hW3cxjBfgor7CS8uT8IsKN0fZnJxkxRI34mKTAW5PcZbQ9KOsvux9x/L+Nr0xL6lRp2hUqmSeA35Ypn2gfxNbGY8hOyL2RFRp7mcHpSBFWbiW9XBwA8PZatd/7OZ/NBwrII64juRxE93M3CKBUj0Vrhe4UNlsp+E3gxghBqXopJZpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nap2GuNxyJ2Iyr7SF746wB6qQtEf4Pow6DD3p07d8No=;
 b=WX0Av7Kl7USgW08xvnIpYbZkF9kxtH+cZ4bwkAMmT7LEZ9k7ij8XCY/1/3vWtaC9oLDvMPTBxzJB4qeBOMgohnCwGXDnUzbvySmxoNVLSHv973vADfaEneacG3xB8BBTpZH/Gwl4bLhKzLjA16XloKVOEyCmWaJDJlk3BQlxDj0z6BCAQO4XfqTRj1sAeR3MowF0QmsQn/im7pf8auEHDXQOmi3ADHonxUzWaDxnm0AZCM6Th/oo0i2JCk/0vi4DqvLZ2Z5RunXy6BCzvHKKrN2izlqYCki5W3LQ00SFhx+NrYYXNa4MdyrA5NB0aGg62kx7T/u/8dL9/+qldTW3Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=scioteq.com; dmarc=pass action=none header.from=scioteq.com;
 dkim=pass header.d=scioteq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735808687; 
 s=sophose3b6b7cefe1d4c498861675e62b33ff6; d=scioteq.com;
 h=Content-Type:Date:Subject:CC:To:From;
 bh=Nap2GuNxyJ2Iyr7SF746wB6qQtEf4Pow6DD3p07d8No=;
 b=luEBTI/JboMQ8Bb66rmva5Zys1BDVls50eu2WbVT0aMw94aqejdgUwBquVRf8iEK
 xiVyHNhZ4iOMmYBzymrb3pchV9tZo19VfzcVb/t9QAAxJoyoSS3LcUm4w82RXzxCLO3
 rHw5YI1hBxgsEzyJlvSGT5KUXMUD+D/ntBny7G0HO0yBLfob0a0W1nFnpfooU5VCNGS
 ZObPCa1esAbm/ap6QxHda+7H60B04zrXbhiueQmbRGD4DAZVsBzdShiWpwiU9Ha+U7Q
 +EQ6TPVPAGiKWqOj8CFv43K09100h2FsbUYxsajLyVMe+0isbJTQBKlld7mhJWJur3h
 Q8WZYHIQoA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735808687; 
 s=v1; d=mail-dkim-us-east-2.prod.hydra.sophos.com;
 h=Content-Type:Date:Subject:CC:To:From;
 bh=Nap2GuNxyJ2Iyr7SF746wB6qQtEf4Pow6DD3p07d8No=;
 b=nDIPQBERBp/ltEJR6Qb0P3CsiPER6gfLdnVsqP78sQLeSgtme2GqoRe/zsQD3yE/
 vysVaCUW7fIweYwKaCxb8/iSzuBcwqnNcZwrbzqJo6XbI7AmTlEy2PnQTWG3Ivah91A
 i38g6yWCVasEuQuDB802oWzNEYbDn4qgmxSibPCYSJRfo0gJW61jtZ9tWyWYpJuBWOJ
 5CNAq6z5BVIsTyypXHOV7ol2qFDC+2if91y54K62f7QHdzaDsw7uPAOfSlaJeEFgcOZ
 0viVgPBuAH99MbrwhvJN9zdZxOdnhkzz2qMYcp46iPR593EX/bwVwj3OUYQ2AVV41vS
 04WRftbM9w==
Received: from PASP264MB5297.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43b::20)
 by PAZP264MB2686.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Thu, 2 Jan
 2025 09:04:48 +0000
Received: from PASP264MB5297.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3de1:b804:8780:f3cd]) by PASP264MB5297.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3de1:b804:8780:f3cd%5]) with mapi id 15.20.8314.013; Thu, 2 Jan 2025
 09:04:47 +0000
From: Jesse Van Gavere <jesse.vangavere@scioteq.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: ADV7511/13 implementing atomic ops and bus formats
Thread-Topic: ADV7511/13 implementing atomic ops and bus formats
Thread-Index: AdtZbi8EHgRPTTpYSqu6qWF3rjBzcwBWKoWAAIs1GzA=
Date: Thu, 2 Jan 2025 09:04:47 +0000
Message-ID: <PASP264MB5297BCB83AB9AC42FFB8F4F5FC142@PASP264MB5297.FRAP264.PROD.OUTLOOK.COM>
References: <PASP264MB52976B917B5F002234D72DDEFC0F2@PASP264MB5297.FRAP264.PROD.OUTLOOK.COM>
 <rh4xzo2cxciakrmaiw6bm4hfx6qwf4zj7bqwdzzdovt7rp4wrl@ir34ydimkp25>
In-Reply-To: <rh4xzo2cxciakrmaiw6bm4hfx6qwf4zj7bqwdzzdovt7rp4wrl@ir34ydimkp25>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=scioteq.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PASP264MB5297:EE_|PAZP264MB2686:EE_
x-ms-office365-filtering-correlation-id: fa49da29-0dab-4e52-a72d-08dd2b0c81a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?UOtWiIsNG6pKiq0yfXVTm4IKlahrqRCdUdNp+66MZR2LaleuWEgra85sxJ8n?=
 =?us-ascii?Q?CYiNoG7U0XW3C5cMt0Jp5IBuG206L5zcSn0/Syzm++Wsf+4ety/KkX9Qzs94?=
 =?us-ascii?Q?n6pIrbIhPowKYwk42pI1H22XbJLs4VDu6LQWqWRmRYpgKjZJ8MXlZ3ctMKgW?=
 =?us-ascii?Q?jA5WLmRmN3lz34zsrIVFziveZAHwPkjx5c7LVeyJxduUz+2rpYk78J43+v6S?=
 =?us-ascii?Q?nrNzoaimVFvchjyeQbYD1fparHivqjj29JcsevK9oSoVrOB3Ep15aoPnQj04?=
 =?us-ascii?Q?FS8WgVgyda0yzneJC3IVHEH5/Q4F5ZDx/LaYGUpTM6mrZjPM/nHr5n31Vm8R?=
 =?us-ascii?Q?7v4DtSTb+w0KsSVWB5LbO5oDLQ+nku0T1eeGjQLOWKOP96UBI/R6wgWQTiX1?=
 =?us-ascii?Q?HFECkA8Um17+5eYY9E6ASG1b0yuwzc2JXA9aojnM46Bt0GclGYj5OaZMd0ER?=
 =?us-ascii?Q?qEwp+jqQxvuf9x2mO0k61zmJjiF4T8Z3z2tULvju0k3O5YM2hWprMHF+4OWd?=
 =?us-ascii?Q?MNsICbOVN+fjhIYpZH8lmOBQTO/S+cejakBGDCYSgcrqj/kLds/ZtUhHatx0?=
 =?us-ascii?Q?JLAq3MPTgY+bE+olUcQXY6pVCQ11Igr0ZsJj/ihkjOPdQEaDDDBv9lZ7X68v?=
 =?us-ascii?Q?cg/EQM/8IMRm7hfKPqgWxF2bFEwMB0V0Dzqgr+IbPP3rLyl1VAppb/QCKDNi?=
 =?us-ascii?Q?cF56gyhhK28R5UGV44eJzIzhpVlfToID56T5OkgVuu8e4wogAlGWZMxmp9go?=
 =?us-ascii?Q?I9+E3J4ntjis+xko12R7YIlFJ45GmmABO8v6MW3FLuG+HEwqhL1WiyHwFBMj?=
 =?us-ascii?Q?CBbahya8KJNgeXeg8JXTQcazNqPSs+p6JuEJenMSXY5jdSOa+qBCy8kQ/gX2?=
 =?us-ascii?Q?Bwt8wCUMkqIvl8jN4jxWGtcZmO/EwPg7aaWZX14+v3e8dEOvLVxy/dF3ng/f?=
 =?us-ascii?Q?xxxRZ0Ou9hkWId74UdP++5kFt/5WhYDAfrvzkcNkb9I/AAYJ+9wvq1Ed1taj?=
 =?us-ascii?Q?KnsgLmgAjwavjoiaxsZPsjFCjRi/s2n/A9sgYpuPZXBKRPoKQds/eOScS0Cx?=
 =?us-ascii?Q?X3IcucbVdzfpd/b8Af84oD4tUW5U/2Me+SupRLHlhAvVFssreqBZWa/4F7aK?=
 =?us-ascii?Q?BNZrYDRcXx8hFbUwuCEwHJu2nk73sqvuPhxI2AetS1U3Ca0ywPCHDyy+j9Kz?=
 =?us-ascii?Q?+2JcFEh5ZBkv0uQZt2+JwZXu5OByGSWxUJRXCSy/+MdH9xjR31yf3EOPFdP+?=
 =?us-ascii?Q?1W+cNF1+RhSvSuWlYZy28RcctTG5g4q98S4y0FAY+B2Jko/JdsYjgwTrZQ+Q?=
 =?us-ascii?Q?6LJOtN2aTLSv7vB8L380J5uCp6JBx7SCUvUwDL32JeEy3HXyWuNbSOKOmbcF?=
 =?us-ascii?Q?9vP3SqIHqhcGFc9LDj5kti4PL6MOLEICanvXLI0sEt9idDbtG68qfKzLvPP5?=
 =?us-ascii?Q?6q8pR2EWMcDgLScjc5o00OUtjJCkivKR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; 
 IPV:NLI; SFV:NSPM;
 H:PASP264MB5297.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE; 
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+1Lxc0mHOwQz4DhMD+A/4txCASmkhTlFnEzIzU4Zi/MTTtSbinQxguh2GLmt?=
 =?us-ascii?Q?xWPhggNzHcN5GPJfuvV9zxJg2Q+iAjMOn0c7lteAVhKErVO2dF3xdo8auuht?=
 =?us-ascii?Q?roo4hcc0SupPST4GUoPjzyj5kzpA12txkqHhLK1g35IGT50c9pbI17dKchUD?=
 =?us-ascii?Q?ej1O2I0j5w8gl6R1I5emyBo4nrCaXn6OGmoMFQD6kpNSaCtnKZHtYbG2NYiS?=
 =?us-ascii?Q?n1VppOCoYVW4mMZhySPca5eUoDL++8D7prXZsqjMIhtkpXOURlkm0pCh+3h2?=
 =?us-ascii?Q?aYXDNXGxI/v4iqE9Jalm2hb8rplJO2XUz04lNH10vg8LWi3xsDKECCReN4ks?=
 =?us-ascii?Q?9wLazqP3FsPb2vMlQviNkwQCLqpiBLXj52miyK0PkFelKfatexUpiG/UZrLH?=
 =?us-ascii?Q?NBQ55gUkQF7T4gwfJqRRqkErAw9z33ZOHZZTlDOLPwPWZPZ5R+z/9cqgWKp0?=
 =?us-ascii?Q?kprwjX6ba6XVUGm0LBu01pfiSLiMu0Jx26yVXtODFA7D00fvT7RuqvovxtVM?=
 =?us-ascii?Q?EgxjZth0crP/FdnWBb910mzA3i6U5Gn5W+2LOLMD2hllL8HLIj1ZQmL7OjfE?=
 =?us-ascii?Q?zEG/7gmz2ZP/K/LROMpFqz8UqO7Nx+s2b8MFtgrfrQ3OyrytDe+CYUph9pZG?=
 =?us-ascii?Q?XLfPmBtzsJHiXHcBlXaMk4p4/aZNMKKdLS8eeRKSfEg52ydXjUn5TUix+Ugj?=
 =?us-ascii?Q?zf3LCLQci9/ovW7ULESOWyqTotm4GOhuXMP9fTHJri6dqeaadtmXIynyyusr?=
 =?us-ascii?Q?sObURkWdoCftKurEhdvizVXFyl7Qrz2Vny2PcuRrcrjp2Ryd6rRmSlqKr1Ja?=
 =?us-ascii?Q?cUOzFv9c3gewiSQJl7t7Xavs6rBfXVJsFZmcV3wrIvU1blDnLXpAyU71c+GR?=
 =?us-ascii?Q?v4esy0xAcmS0jvPv8z6/wb1P7atEgYCS+Jkmj0eQ8m0kAy3CI/BxhIzrD9F0?=
 =?us-ascii?Q?MIqqv7AyWe89HdgztXzYozfx9+yoSwLHKSpc/JQ326LAWihBzhO7CmbF3g2N?=
 =?us-ascii?Q?AXkvVSX3yWhRFf6qtCh2c3mHkhRbqQHoef0O2fnfNla1w3Ay5t5dV1i78fsF?=
 =?us-ascii?Q?PTMh/Wwt3U+26eGvIGh87ErVhIXUJxE9PPiLGMN2rCXX1P1fKs7d6Pojuo2Q?=
 =?us-ascii?Q?xrqwMmDpIXGEOVtVihx+2/B/GRshrnMwwyDgjkDSa5PHPHv8CNZ+guJq5/vk?=
 =?us-ascii?Q?2GPkYl9RB54Z/fqX2b1r68nQdllbJLacExjSfvecyQguHYQ9G2QbrcRRZfNT?=
 =?us-ascii?Q?A92RlkThAOiz32RMgjpshKfjhD8IDqBagMx/qR8mMgsuI/so4hVZEcBsy7LT?=
 =?us-ascii?Q?A32xyt4gwoxbzVHczb4ccDJh2e5arGFDz5EjWiZgi+cwC5NtOaiy67mdVgii?=
 =?us-ascii?Q?mmX3z+Nnhyu3jH4QayAsnhphbf1O8bbn+6/uOmaOievSt/oFiXnbFf8CGZAa?=
 =?us-ascii?Q?8Yrn39kRlMMRCsODMglRVsILJpUQpYl/+pA928qPPWw9jDmFV52qy59RTxDA?=
 =?us-ascii?Q?8U8we1dnDaINU+GekY3S6/ze0m9ts2OGh0HYOWdFCsTxk6SmnwcZojcd6PLL?=
 =?us-ascii?Q?+seaDU34Lf53bydGofhbDZ0j77Uw95OgN8zlMEvif/ycpMAe7z6l4nHJxBak?=
 =?us-ascii?Q?cg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TisJ/bQERi7KrAlion8PzIFivZ7p+IH4GUkmyFNwQtDm9JkgNqWCuitDIMCY8ckXe8wZgz0uTjysJB6pNpUfjhYKnvsQGGxvOj4NzUajvTd9JvIseA/2Gw90KY08RewpwbIDirQ18xvphJVrLuhxPCS//C2WKFqH13bZKP9CbOeKv5ZkEtQF1Z4AwX/XteAKuXVZxdcBpcESASrFHvIWT/0ZaynDMlYu/UGu+Yx7GVvu0YMyFparFbVe2hVA3mEyIu63yq1Wl507fFmiIniT8kmpV0mZtvaHOSVWjR94HjiAIVcxrjpTPp0zxJku3YoDLSsXsCNcyvALcV+oLrA8fodmgXXOeqbSf+UZXoH45BAORtlYWaTESbFljegVnpFKE7GiIHXH2u+iSy+CsHxAyXWsp38x72lJt5b4/LwsKQk2j3OpRMro8hLhRFLxj+N7GBZjvGvYQ72M5Xnr7vaDkUQOnUfNkt63vrzg433CZJPYqmqr1Bawha3ImqoNgO4+WbSpS3dGFwJsskeUxN8lV/tSedQLk5pJtF8xuBAHxDXz7wQXTr9N2IWt9GC3Dc5TcNJnsFThrR2/OXxGfgBmR1Ia69x0OlvAeQsMvWMnaLuhPlp5NgvUPSYdP4kcJkrW1MfP82BiLLKRGxCLdBiFEsuKn5RtOzAurZO2vHecqS8=
X-OriginatorOrg: scioteq.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PASP264MB5297.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fa49da29-0dab-4e52-a72d-08dd2b0c81a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 09:04:47.0922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f3e5b271-16f7-46b9-bdb3-4271ac933ef0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qzrEPsYWeysV7ngJNd1AgJ3KMiFDkP0JyeDVnROZXLhzC9CCReuCvF7w1ecpq50dIzjdLgC0fInJ0oavBMrgNjLARh9NFdL9Ht89vL2sxGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2686
X_Sophos_TLS_Connection: OPP_TLS_1_3
X_Sophos_TLS_Delivery: true
X-Sophos-Email: [us-east-2] Antispam-Engine: 6.0.0,
 AntispamData: 2025.1.2.83346
X-LASED-From-ReplyTo-Diff: From:<scioteq.com>:0
X-LASED-SpamProbability: 0.085099
X-LASED-Hits: ARCAUTH_PASSED 0.000000, BODYTEXTP_SIZE_3000_LESS 0.000000,
 BODY_SIZE_1000_LESS 0.000000, BODY_SIZE_2000_LESS 0.000000,
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 BODY_SIZE_900_999 0.000000, CTE_QUOTED_PRINTABLE 0.000000,
 DKIM_ALIGNS 0.000000, DKIM_SIGNATURE 0.000000, FROM_NAME_PHRASE 0.000000,
 HTML_00_01 0.050000, HTML_00_10 0.050000, IMP_FROM_NOTSELF 0.000000,
 IN_REP_TO 0.000000, LEGITIMATE_SIGNS 0.000000, MSG_THREAD 0.000000,
 MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000, NO_FUR_HEADER 0.000000, 
 OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000, REFERENCES 0.000000,
 SINGLE_URI_IN_BODY 0.000000, SUPERLONG_LINE 0.050000, SUSP_DH_NEG 0.000000,
 URI_WITH_PATH_ONLY 0.000000, __ANY_URI 0.000000,
 __ARCAUTH_DKIM_PASSED 0.000000, __ARCAUTH_DMARC_PASSED 0.000000,
 __ARCAUTH_PASSED 0.000000, __ARC_SEAL_MICROSOFT 0.000000,
 __ARC_SIGNATURE_MICROSOFT 0.000000, __BODY_NO_MAILTO 0.000000,
 __BOUNCE_CHALLENGE_SUBJ 0.000000, __BOUNCE_NDR_SUBJ_EXEMPT 0.000000,
 __BULK_NEGATE 0.000000, __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000, 
 __CC_REAL_NAMES 0.000000, __CP_URI_IN_BODY 0.000000, __CT 0.000000,
 __CTE 0.000000, __CTYPE_CHARSET_QUOTED 0.000000, __CT_TEXT_PLAIN 0.000000,
 __DKIM_ALIGNS_1 0.000000, __DKIM_ALIGNS_2 0.000000, __DQ_NEG_DOMAIN 0.000000, 
 __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
 __FROM_DOMAIN_NOT_IN_BODY 0.000000, __FROM_NAME_NOT_IN_BODY 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000, __HAS_X_FF_ASR 0.000000,
 __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV 0.000000, __HTTPS_URI 0.000000,
 __IMP_FROM_MY_ORG 0.000000, __IMP_FROM_NOTSELF_MULTI 0.000000,
 __INVOICE_MULTILINGUAL 0.000000, __IN_REP_TO 0.000000,
 __JSON_HAS_SCHEMA_VERSION 0.000000, __JSON_HAS_TENANT_DOMAINS 0.000000,
 __JSON_HAS_TENANT_ID 0.000000, __JSON_HAS_TENANT_SCHEMA_VERSION 0.000000,
 __JSON_HAS_TENANT_VIPS 0.000000, __JSON_HAS_TRACKING_ID 0.000000,
 __MIME_BOUND_CHARSET 0.000000, __MIME_TEXT_ONLY 0.000000,
 __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000, __MIME_VERSION 0.000000,
 __MSGID_32_64_CAPS 0.000000, __MULTIPLE_RCPTS_CC_X2 0.000000,
 __NO_HTML_TAG_RAW 0.000000, __OUTBOUND_SOPHOS 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __REFERENCES 0.000000,
 __SANE_MSGID 0.000000, __SCAN_D_NEG 0.000000, __SCAN_D_NEG2 0.000000,
 __SCAN_D_NEG_HEUR 0.000000, __SCAN_D_NEG_HEUR2 0.000000,
 __SINGLE_URI_TEXT 0.000000, __SUBJ_ALPHA_END 0.000000,
 __SUBJ_ALPHA_NEGATE 0.000000, __SUBJ_REPLY 0.000000, __TO_MALFORMED_2 0.000000,
 __TO_NAME 0.000000, __TO_NAME_DIFF_FROM_ACC 0.000000, __TO_REAL_NAMES 0.000000,
 __URI_IN_BODY 0.000000, __URI_NOT_IMG 0.000000, __URI_NO_MAILTO 0.000000,
 __URI_NO_WWW 0.000000, __URI_NS 0.000000, __URI_WITH_PATH 0.000000,
 __X_FF_ASR_SCL_NSP 0.000000, __X_FF_ASR_SFV_NSPM 0.000000
X-Sophos-Email-Transport-Route: opps_tls_13:
X-LASED-Impersonation: False
X-LASED-Spam: NonSpam
X-Sophos-MH-Mail-Info-Key: NFlQMTROMXlMTnpsVmpkLTE3Mi4yMS4xLjE3Mw==
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

Hello Dmitry,

...

> The atomic_check() function verifies if the passed set of changes (in the=
 form of drm_*_state) is valid from the driver's point of view. If you have=
 nothing to check, it's fine to skip the function.

...

Perhaps one last question on the use of atomic_check, this function is need=
ed for TIDSS so I got to implement something either way.
Currently I just have an empty function returning 0 there.
So I looked for something better and stumbled upon your usage of the drm_at=
omic_helper_connector_hdmi_check function
in this commit: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git/commit/drivers/gpu/drm/bridge/lontium-lt9611.c?id=3Dac4627c304e7a09=
068d0e2dba34d21e492649f8d

Would this be a good candidate for the atomic_check in adv7511 as well if I=
 pair it with implementing the additional necessary bridge funcs (char rate=
 valid, infoframe R/W)?

Thank you for your help.

Best regards,
Jesse
