Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399BB944D8C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 16:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3033710E97A;
	Thu,  1 Aug 2024 14:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGtJ4kLB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4A710E976;
 Thu,  1 Aug 2024 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722520828; x=1754056828;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gRoQFN4Jvnm+b6n+o+L7bGLXjoK/1LhCWM4bQ9ZkJ9k=;
 b=gGtJ4kLBi6XmzPD9o1zY4ES0Xa096/fRHS1wh/t4ZZyG0FbbCfQpt8Dq
 cC0ltgSDcLStstVsXfrs7CYnOvuuIzYttHifdQfGq8hI85yudIU8Iw+Nh
 QgJ67eS91cQd6PRpoXACt/mL4H8IoGRmyjvjpFNJjuk7CQFnh74ALL/W0
 Z5VK+aI5VTIVFaKdkhW95t+9wfIxt6cIwvq02+/GB1kxrynHNvTYhC6HZ
 JISMGe0mcpNJp7dIueEFRrdJSccgC6nt0ZGof82xw2baE0bxL7tYX37fk
 Cimy0H0JUO2bGomkmTEQ4wex2n2TgOv4+zOwPz4kkbeAxK9v4rGYsoWTW A==;
X-CSE-ConnectionGUID: GqeRKX2RTdW5qJQ8GE45GA==
X-CSE-MsgGUID: zP+avaxuRO+SV/WWPa+9wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24334381"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="24334381"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 07:00:27 -0700
X-CSE-ConnectionGUID: 8VmG3JhcQmadpEs9YaS6TA==
X-CSE-MsgGUID: a7tYnQGlSvub8HWfIt7pgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="54691720"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 07:00:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 07:00:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 07:00:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 07:00:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 07:00:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6MJ2/+n8G5lUfcdTSkBEl2eYSKe4JRWO3WaHGS3h+KIUS5UCkk3KTbvGQdyb2t5156LRh4GGCnxda0DOdoYP+nmoFpgQqNAgIZSTIi7H4eZbGQTSc9FG7BNDCPQ5v+rhMT1xR8v/TYKP0wDaxLU1l6uDIeDo5v23ubm7mV1P5XiaL2d2WwGYfBnxHr5RI5WigmSrGeWGtuesayRMw4XM2Y4Q78xGfK9bxoSfuD3roY3nsSTDSjJ9jfcLouSy7mmt8sE2lepYXhyvwhgt6gyagJKsH2j0LZ+aD5hl1Ipt966XlVGwVx0ZNe/XTlzNuXKIPgi/JeuDRTNBnaWphQAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qxvp6XkLWIqWT3j0y4L/Svn7j09fD53BSgeBNUWjFXg=;
 b=MbYJaAP0y10ZOdZoKdOnE3bZsV/8+0uBRjJn4VT4gk+CGEx9c4gYCXAoShqStxpuSpWo8jFOVASu37BdN4ToPDnQqGc6qOp5f0Es4dnvCsYRj3+820mdeOmQfJgZbiBZ03fFg2YnwzLeVEcD+1CMfmNEmLNJw7Yt4JGwYU7pCjPBseU9yv99vK/2w0LbHjdZvqCX1bnYi346xzy4jrl/fjl484yyeefsUPLMvp9+g5AD4nPQYaFtLQmSrv6fCtqgZRcg0n4GkyEbZTUqE59SvLrATENcDWmlQaBDgHxfwy/wPGf/4dSqubOmKmQKSGp7U2bA/12aQ2Zh6OiI2Ebnbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB5778.namprd11.prod.outlook.com (2603:10b6:806:23f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.23; Thu, 1 Aug
 2024 14:00:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 14:00:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump printer
Thread-Topic: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump
 printer
Thread-Index: AQHa45EhF36izAgqe0C6OeukODdQmbIRZ+xAgAAdMICAAOhMMA==
Date: Thu, 1 Aug 2024 14:00:21 +0000
Message-ID: <CH0PR11MB5444838A9E768A2E4D990E24E5B22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240731213221.2523989-1-matthew.brost@intel.com>
 <20240731213221.2523989-3-matthew.brost@intel.com>
 <CH0PR11MB5444E19C7B2423D654F3B2AEE5B12@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ZqrQn8BwrVdXtdjG@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZqrQn8BwrVdXtdjG@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB5778:EE_
x-ms-office365-filtering-correlation-id: 3b7f5562-1c90-45a3-7ceb-08dcb2324887
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?cwzRYL9DU1EtHUO2l/SFnH8S7TJeTztcu1se4U9+bWpHyaz06cVy/lbrtqyE?=
 =?us-ascii?Q?fMDHFflJO6Jza0rsB+LXAMMP4jlbrk0wVyTfTnBkDh0lNXhYqiOHwbmPqeBg?=
 =?us-ascii?Q?25XNc5wCWzTaW0scpGKeJ2ZJRBchB3Oviz+zAXS99kkeM25etm8TMoU44O69?=
 =?us-ascii?Q?uVjS7xWiX6M/LSLIKp4qSwRZzHdF5cjo/VKH4Xk4KpbwYtb3Xt6DtvOUUCRk?=
 =?us-ascii?Q?U/7Ykdg3s7zBX0Qa9za3HdrB30WS38u5uswVsL9vUbTLWVYjUWjl1pBttvo9?=
 =?us-ascii?Q?4X9fm1ZUj+332FtJ1gZthhhTWcwfWCHSao3fJnbEV8JFEoYgLEzMvc8XhOlk?=
 =?us-ascii?Q?Br22s9xtrWTD9/S3paeGjlu4xTjMrF/VaW2royfTKq98RrqX2e2kq2Ie68hj?=
 =?us-ascii?Q?GAGWCMBK4TApps3DHTv6fVQrLZqvQW6KZwJst+o+cbIRvUQ3LI+laCrg4Xoh?=
 =?us-ascii?Q?xfsCqIhRynGkvvbID9gcYxhYpHa5yUfQnR14F783FUtCJ9WKG8R2B36GzRkP?=
 =?us-ascii?Q?0pHCTOH9cwDjmc9bDN56dcNJzw9dyN64rHAw4riUqvMztlJgfvPCg71Leur2?=
 =?us-ascii?Q?GxF2A26bKTI/SR7vamIcsMj1mjShZnZwQtEFsG6mmZU+RXz/uFSJdIB1GNLs?=
 =?us-ascii?Q?iSQ3ybIW3qoTrNkYv/rLbl8pa4YmfMmXL6VrZggbicZMGKQ+EPbBKB7hN1u7?=
 =?us-ascii?Q?PdrJ6/San4QMttuKo17Y9SPas0aNfKlZnjL0w2Np9lPjCa7YleLYaafzqWJl?=
 =?us-ascii?Q?J82cdnzfuwIr76hqHIGpWP5B8qo66LBhk8Txgv9qBZZ7AQE+yzyzuDO78Qto?=
 =?us-ascii?Q?bg2z25uE1+v7s0EmBlkgYzM9vOeLqFNvCIbX1R4R7LAHIgnr1rA7mzUpVvG/?=
 =?us-ascii?Q?Nz1ePDZYxLUetGRGd0jU9maxdHshu9ryE/jsh57All2E5P5+ZzJPk9dqvDXU?=
 =?us-ascii?Q?HWT82DFPVrKOyCE4bztftirLvMxCbPAKa/bXRm8W86filPo/5BAQLiCuRbJM?=
 =?us-ascii?Q?hB1jYPh0LHBfPqoVFuNiq5JE/J+eekvQsfUkL/8NZB0thRmclegi8u86qnIP?=
 =?us-ascii?Q?wRJZbbDIbEV3Vr0qH7zP4qoeO4B4HGNoJPRLSBXIIUg12/ey+lIm0v4ux3bG?=
 =?us-ascii?Q?vWJZN8wIj2x7GS/lNwuspQAX/zt78ALseZE16cfeXgVJH3iz3e83L1+fUPFA?=
 =?us-ascii?Q?JSbCN6lxw+qgf5rU5+tpoJDMVp18RN53tokbNLZQeNudkwf244JXtgrTnuKA?=
 =?us-ascii?Q?0tKhMmvXFF1Dc96RdfMgb4QaXIlpd2IOluxXAUxC0mpsNkBwP+UdLZC4/ltD?=
 =?us-ascii?Q?o0Rua6aCnFaApw2MTJJdVG70gpCuZOx3SRFshUsB90ihAEBhvBv1L75Q3VPf?=
 =?us-ascii?Q?0R6LaE0LafgQ0HMds6gjrHwEz4JO/jjDL5n/dTNvlxBfnMTG+Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G5zz+G7zWBhONN0dcJe+4l92pXApBhk5vJ/ITf3SH7UAcIwG2UVB4n+6BOX2?=
 =?us-ascii?Q?XJO6NsScvot+OP9+bvAKo1WxGmCD7ZWEJ9swkuCZMv8BhbL/2sp/lCTA5x0o?=
 =?us-ascii?Q?ORtitMLES8E7gtG9l1eodYU9YguhD84yBEj3YlSUw5C9sxBt6oYroxnZmcVd?=
 =?us-ascii?Q?9rqZh4kt/IsCiyi1hFrTCPrC+IAUCpg746JSGUl63OZh82WzEf/zOwPMDSp7?=
 =?us-ascii?Q?V5Czn+9Xf1AczY4Fb2uG/4z0DCQog6m4h/I/otS5VmPAQGvXgS6jzsV0M80J?=
 =?us-ascii?Q?o6BeRsxS/ximls/OTXCz4MQrwmZbznS/+F5DFavIwcSBMRdKg7Sh6ni5nUVh?=
 =?us-ascii?Q?ws0bwdzB29dPrPgVdG/0PnM+TR5Iq0n+092h6trDG5QVhZ/aLdvgf7BOJ2fs?=
 =?us-ascii?Q?zowdtJBhltI6yk+X9VYJmBBMCzptHFps+DFIREVrLFMfGmrogED7SNis34Cd?=
 =?us-ascii?Q?c6pJHsUJlhjZn886lHEWCUGXS77Wqg6G3chFYvQdn3HYw4+FBs6kkC/0Vmmo?=
 =?us-ascii?Q?XrlpYjR4BRYtNjudSZbcLJZGkksDCTiIs59GddytxY65yN3mPHsN4g6D8S3z?=
 =?us-ascii?Q?6L5ulnKpIwRDe7mfDYl+AMx7KJVJ6XNfDToDVqGNOgFjIrAqoWn6y7GFBS8n?=
 =?us-ascii?Q?Yp5LO5wA4KNKEBXFjJnp/r8dHbPPAq0X328Wf3OgdYZE52uS8QVp4JLpXQOx?=
 =?us-ascii?Q?cyL7IukFpDcvdJTH4U9j3IFCE6aUPBFc0pLxZz4d9K3vUJHrgozJVZfgtq/9?=
 =?us-ascii?Q?PbcL80zufE4XTTQgL620aeT3W1qSfOsrZ0ay5pOymzEoTBYxkFwROVV9wm/5?=
 =?us-ascii?Q?905K5StElj0Jeb+GzwJJaYc5mR+aQqmQyqbp7wmZ+uBCdbsQ5KhRj5Ki74hk?=
 =?us-ascii?Q?QoOmTL5bbt33fOyTfO/qn41DSUHuUvDkwKra3ev11F3GNp/j+CTa7ynciAqh?=
 =?us-ascii?Q?TOFuiNhTstGteedSdRJbKsbE5YNJ7lWPlUEk024dbDi3vUvV8Q2QgxbP02fA?=
 =?us-ascii?Q?0z9EPKYxGuJ2Ou7mKJfYqXvFcXyQS+U293t8U9OI3OckGBhVjvd24I7kOTRs?=
 =?us-ascii?Q?tT6RbR0C2tJPnvWutn/CNXpdgibLHuRORpf9OqAB530jBrWEQpYAH4ZluTL1?=
 =?us-ascii?Q?O+TCjO+VZ2Tx3+7sM85JrgV/WxCrgTwh2xfdQakz7ZBto4zBwQ+e1HM56LDH?=
 =?us-ascii?Q?OKhG/xYa4ay/daIdnd0p6U3pA0fHZuH2fneeY6BeOS+AhR1qD4WUQtpf1sOW?=
 =?us-ascii?Q?/xgii6GYwKshEOruOkCQIpcHib9KqsaKxcwiJ5fMf1mWat/1NWfIFV0iDXeJ?=
 =?us-ascii?Q?m+EX8vxn3XmTiBIUk8keBlsND3IS9P9c2xL7QfhBe58wRL7RwzU5y8tCeVlg?=
 =?us-ascii?Q?b9wy9qJhwNneWI8AtZi3gXrfEUMR3j/0KbU7o9fkOZ0tENpV46mJMp7Ylh1h?=
 =?us-ascii?Q?WzQMXNrvr0b2YRdoF2nTlu6HUyNH+yElRyTO04+1zo6A08ENvksSTmwsaVKE?=
 =?us-ascii?Q?DFULdeuKS6Y003bUkPiBcx2RT+qyBYdGzCZO4SxY8clZFVHd6ma5dt8+LBYY?=
 =?us-ascii?Q?PK4CxuAelEgirSXIg5oLIFGzaguBOagL+6a5qKdgMHACl+P6US5fWArJoyo/?=
 =?us-ascii?Q?4A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7f5562-1c90-45a3-7ceb-08dcb2324887
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 14:00:21.4501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YgEXq8g2tNS3Iu6/9cK48SErCJJLvIZCZzDEWX27y9qoKJEHufbHJxinNX2Two0MYVLg8pTuLMW5LwZ5lJjYgUS7Pz9OwaUUXuSThSULYZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5778
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
Sent: Wednesday, July 31, 2024 5:03 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org; maarte=
n.lankhorst@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump pri=
nter
>=20
> On Wed, Jul 31, 2024 at 04:22:03PM -0600, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ma=
tthew Brost
> > Sent: Wednesday, July 31, 2024 2:32 PM
> > To: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > Cc: maarten.lankhorst@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@inte=
l.com>
> > Subject: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump pri=
nter
> > >=20
> > > Useful to determine size of devcoreump before writing it out.
> > >=20
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >=20
> > It seems this patch prevents us from copying strings into the data fiel=
d if the data
> > field hasn't been initialized.  I'm not certain if it could ever be uni=
nitialized at this
> > point, but I recognize it as good practice to check just in case regard=
less.
> >=20
>=20
> That's not the intent. The intent to call the print functions with NULL
> data so the printer can calculate the size of buffer required to print
> out all the devcoredump data.

So if iterator->data is NULL, you want to NOT copy into it?
-Jonathan Cavitt

>=20
> Matt
>=20
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > -Jonathan Cavitt
> >=20
> > > ---
> > >  drivers/gpu/drm/drm_print.c | 13 ++++++++-----
> > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.=
c
> > > index cf24dfdeb6b2..a1a4de9f9c44 100644
> > > --- a/drivers/gpu/drm/drm_print.c
> > > +++ b/drivers/gpu/drm/drm_print.c
> > > @@ -100,8 +100,9 @@ void __drm_puts_coredump(struct drm_printer *p, c=
onst char *str)
> > >  			copy =3D iterator->remain;
> > > =20
> > >  		/* Copy out the bit of the string that we need */
> > > -		memcpy(iterator->data,
> > > -			str + (iterator->start - iterator->offset), copy);
> > > +		if (iterator->data)
> > > +			memcpy(iterator->data,
> > > +				str + (iterator->start - iterator->offset), copy);
> > > =20
> > >  		iterator->offset =3D iterator->start + copy;
> > >  		iterator->remain -=3D copy;
> > > @@ -110,7 +111,8 @@ void __drm_puts_coredump(struct drm_printer *p, c=
onst char *str)
> > > =20
> > >  		len =3D min_t(ssize_t, strlen(str), iterator->remain);
> > > =20
> > > -		memcpy(iterator->data + pos, str, len);
> > > +		if (iterator->data)
> > > +			memcpy(iterator->data + pos, str, len);
> > > =20
> > >  		iterator->offset +=3D len;
> > >  		iterator->remain -=3D len;
> > > @@ -140,8 +142,9 @@ void __drm_printfn_coredump(struct drm_printer *p=
, struct va_format *vaf)
> > >  	if ((iterator->offset >=3D iterator->start) && (len < iterator->rem=
ain)) {
> > >  		ssize_t pos =3D iterator->offset - iterator->start;
> > > =20
> > > -		snprintf(((char *) iterator->data) + pos,
> > > -			iterator->remain, "%pV", vaf);
> > > +		if (iterator->data)
> > > +			snprintf(((char *) iterator->data) + pos,
> > > +				iterator->remain, "%pV", vaf);
> > > =20
> > >  		iterator->offset +=3D len;
> > >  		iterator->remain -=3D len;
> > > --=20
> > > 2.34.1
> > >=20
> > >=20
>=20
