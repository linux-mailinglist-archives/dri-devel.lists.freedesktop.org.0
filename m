Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EhTG5EMeWnyugEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 20:05:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E9A99990
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 20:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5867710E5B1;
	Tue, 27 Jan 2026 19:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N98JrFoH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB3810E5AD;
 Tue, 27 Jan 2026 19:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769540747; x=1801076747;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KoUMMtd6jWkgtD10WeCoT5rcbThyslwY1pR3KBXQ1b4=;
 b=N98JrFoHmjfrx0iPE08vHCQeo2L2oJzwcDipzfr+ykpXtDbgxYjdrOJO
 8665xsVaZOzqn0r6E8xICkNvUngxfKsWCA8cLgNXboed96JUirHekY0na
 ejB6Ffrw+kKBcbbohBbolFj1KuVdNcGQcpXofEc6feU6Hm1acdMyAWjXR
 Znrm8CSzqhbrEDNRnnxTCAiJspJhA5/F73uriloYjNNSZruO1Aiojfrti
 dkehhywo0hdVbjKkzTIVBk5L7qAx+Af2gZjLkpuewd7GyxspN6YCtBl10
 kMbNqWZSoJTQ7A9hZFHev+gsN6obu2RhPsLWj4UXxqGJ31QpK/Et8nl+y w==;
X-CSE-ConnectionGUID: HFPiZO2YSOG0g8Xg4P7baQ==
X-CSE-MsgGUID: axLPkZoSTtiV2deTxAv1dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70802777"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70802777"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:05:47 -0800
X-CSE-ConnectionGUID: 5agpNC48TMOovTg1qHsuIw==
X-CSE-MsgGUID: 0B6vECb7RLWCbcU2PH3n2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="231011980"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:05:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 11:05:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 11:05:46 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 11:05:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPHxMI63qgmu3hEfhI2dh6o5Lp0YSDVvF1W8xJBu3YS3weQ6w1ExvAPivZnniamBm4tXNf/gKOKmPRnijk7+793bZQNDPSq9Ga7jsg8YllP4DY4C7NAbgrxxIQqtMb6yasKH17OQ4kIVBjnQPbUTjnnfYI35UueRXo6DOxa90U/p/joCBQ/AuYuFLfiU2jtZL9OFE86eap8uLutxGg9ofuBVXpLaWkJZ5JqXJ4awxLlBERSNO7sP3bK7I9+umK7Uvdkmaao51lYdYjJbZlohIXEkIhFyHIRV7XQXMWfpXIRbRNuK/zcFK+Gfh4KpbO/Wy8YLSiIZwaNWj0U3KuLzWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L33ZahoEyGlNphzb11n3JungW7v4VzNWVp0ybjq8NxQ=;
 b=JrfiYsrTHLdekRhdhl9jk4PKETiolh3+LJYHKYR50q6zxvjoKCOIs61YkUCjA2XUWc4r4e83ne+Pz/ADhz4i2tjMNTvO21wHSSH9GLvwRmZj4IS3BUiKRp4X9rN2EgLhMWlkaVEgrsOrHahtaEINzKqPmF+sFNbcp97/7eyQfCkMi2uBjCQXz0DBxbwAS0NFgkWSjlStWJn81gk7Fq+Gl2krCP3azYzzCyeaLoa5VDB+PABR/SlLt51gHORaAcQkIkkLagzn+jMfy0vpHQRTFpMYfEEY6sFX2ILqgE1LPPIWpHak4dR7xkznuAqw4MnbGuHlybqZEPW2IgoU/3qyEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6972.namprd11.prod.outlook.com (2603:10b6:806:2ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 19:05:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 19:05:38 +0000
Date: Tue, 27 Jan 2026 11:05:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <leonro@nvidia.com>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH v2 0/3] Use new dma-map IOVA alloc, link, and sync
 API in GPU SVM and DRM pagemap
Message-ID: <aXkMfztIe4zRsz0L@lstrano-desk.jf.intel.com>
References: <20260123215907.1643088-1-matthew.brost@intel.com>
 <20260123224146.GB1641016@ziepe.ca>
 <aXP8B/tAuJO1hfx1@lstrano-desk.jf.intel.com>
 <20260124002610.GC1641016@ziepe.ca>
 <aXjtvj/2AZxY1MwO@lstrano-desk.jf.intel.com>
 <20260127183701.GI1641016@ziepe.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260127183701.GI1641016@ziepe.ca>
X-ClientProxiedBy: MW4PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:303:8f::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4b31e8-cc9d-4f7d-4d06-08de5dd70e99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?38JobqB3lKBe9U+GqF8tl0bKhwCTmGLP8rxDhhmbXZIOUC3sRqnGIX/n/Duz?=
 =?us-ascii?Q?0z4JsfiYz71xwp1XlsbCLO+YrrCOLZ7/uEocqk3+peuW52VYOMLB7uqu3QRs?=
 =?us-ascii?Q?YZWx+44oq/j8aY+CVEEN1a+7RWk99syedr2EyVMSxtImDqzgRxO7j3Kq3dY/?=
 =?us-ascii?Q?e7NJADCYhEKGGQq1eiRzoemyweJU6TCh5p6mdLTCpz47J7VMO3tOIMM2UaZq?=
 =?us-ascii?Q?f1+EhM2w1RPt3BbJrL8JjT4vdz0Ojv2pt4QcXg1YSOtsqReVMKueoAeyMMLN?=
 =?us-ascii?Q?av8pTODQyUae+scJ5Pfyyjh3WpiKJMqlmzfuARqOX/V0fmjmkoDvmf7Apce7?=
 =?us-ascii?Q?6fSDfkzooc7ER6eUWz4+Yf6EDWZxiwTvx0deM5mROxUfCiJJklVVY798Nbnl?=
 =?us-ascii?Q?AKZQ9X6a6Q/v6cEgOLe8jeeAtLROpJqFnMWakK6q6UyLKP6czgE9RAFkGswq?=
 =?us-ascii?Q?jBP78LaMu7WaDqP2FQrtH7Yyr9v2mdsxJ9O+Mb4USyfoKaS7yxO5eAa7G/xk?=
 =?us-ascii?Q?rmRvsUBaRIurI2BYw8Vyt6GgMk0ub+8z1NIkDMsVdrSb1IhV4WYQA4tYWBsk?=
 =?us-ascii?Q?FEnENeOGT1C+Cp+5dXpo30P1b2cSo9HShswoOgJKNzMLPz9XkEIgcvrnDmqc?=
 =?us-ascii?Q?t7X0wo5HHSRDxyxSrnGlByp3G/Whsfm5Z51CIQz83HSVcPmzn730Xy84jw8p?=
 =?us-ascii?Q?UUFMnnfsrAEKKbHwd1g+Oa6cgJxRGhrHMxV2/bXr/UCBwo8/CZKVXJSmEXmR?=
 =?us-ascii?Q?tkNdj3rsaCAMizlWTiCat8ZCFuIYLm9aM7f6LOCgYWN6MBEoQ3IkVd64UdrV?=
 =?us-ascii?Q?V30qXAiHEq3w9tN/x0NFwQG65HqCH7kY2Qu6kUQhxspdPWEC1Xwd06BPO7pT?=
 =?us-ascii?Q?z1d4WFIx911nr4mfpicP5rBvuGeDp9wVCAChynoTDfFk05Jk+p9AYmh8eclP?=
 =?us-ascii?Q?C/eBacfGkqBGyjKzVuQp2vc4QAp5enLyFJSoUJZZqSqQGxTRvEt9dIYC0eCa?=
 =?us-ascii?Q?xcwqlMW/el5AswAm0mWNHhKLu9wikf/SIyfqeQ49221953dut3PY2HUBMdnx?=
 =?us-ascii?Q?KE2PMItMQoFPxFFIO6bxPLLxwQC6Yl/FwQMvojmtnOAh733xL+DYKc/o3Uh+?=
 =?us-ascii?Q?s7wik+Bspd+k5hDkRjn7I2bEwR/jDkm5Y8ACC+N9+8iQP5jrvS0m+J2QOXJq?=
 =?us-ascii?Q?55pfsU6Jyw5bWW6R9rJqRyOtqxLZr0crrGbiKKbC+2Sxik88BjqBcVkXd4OR?=
 =?us-ascii?Q?ynbfbSRtp4s271gsstUdrafw6e+dwbCVwSYV3swoGONVKW2Bz1aTxhhrfZfu?=
 =?us-ascii?Q?7fpyPI6yEiLZwRpKVIPXenbIEkEyS+iGqqgWYkkHzo8AD+bRCc9noJSfAi9K?=
 =?us-ascii?Q?hjA8hhkKyC/6LRhyKDpE/V0nAmb9KdkXjKqRLoXRrKfijmi2wSibq6Enu+mT?=
 =?us-ascii?Q?rOC2OUkU0c2zR4fgo2lC9OiJjtYm9exI7B2nIw2KmSU30exs+lt8M9pbABjl?=
 =?us-ascii?Q?VsKnnDWqwV0oMvfIrmGR9468S+hGVdxp9LiNu+6mM22hDyzKGWwgK6vs/r5x?=
 =?us-ascii?Q?jNgPCMALVaM/JAzkQoQp+yuZy8/4L2TPquMRW8q/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?df6knJKUG08BQY9D2oRZ2Ccr5k+PiMMb6pbg+rXIzNn8tFQJtv2S8VDDm/Cx?=
 =?us-ascii?Q?hBkfviqnUO7RrIZmBC4EETntRZ8ycnHUwO2f6vyN1ahuIlTH1Hy5sdqL5Eem?=
 =?us-ascii?Q?kWccDZa9jGRjt7lcbVpjjIDoi494k9NMriyqofkUqQbIyg0w3JeMBVO384gs?=
 =?us-ascii?Q?+Y5glDbWZ3czZXjMpfrA6yxPrlLyEDDpc7YPS3NERUhXMw5wqAVcG14RaSCJ?=
 =?us-ascii?Q?6tK8kUEDKzevb85CSykTkb1VNqmpyV+5Wu0bmXDro4/bM36Bhk7hASyhQPJr?=
 =?us-ascii?Q?007rJPQJN7UQILjYa6sFPZmwvRavv/4rwpxVWrJ5IJgPxbhD7ogGo4V1n/g6?=
 =?us-ascii?Q?8WSyZe/G/Y4HsbwuxOtjiipMxDq3UUD8OUp6hi5PJxMG9Qrz4+aZ7lvfonG3?=
 =?us-ascii?Q?3T6Yq4//Zhmd5U+h7E3kEkMlCSt94c4tcj9VfDOriu2A4TD/qqBAjh01PMo7?=
 =?us-ascii?Q?zvIKGcQ9qdsNy7M50vLJQ1qdl0N/q/axzSUO0K+06wlM8MfIaPN+JlNlfBXA?=
 =?us-ascii?Q?4EnJKPcOFk4Hq2skooaUKsNiqO/l5zFIc5lLoVuUAYvpqOjDYVnXeg4cBNXj?=
 =?us-ascii?Q?QPOgNhIaCI8eFM0ZTalC9IzdKmkC4xXhO5PM9Z4rx2QnknmPszvFZsN2lpDo?=
 =?us-ascii?Q?K0Ds7jgNJgdD9ugu/u7gQ7JRcuWk08SffZStA9MDrM7VLvlcjFlnFRbA+c/l?=
 =?us-ascii?Q?XBX0f0qqUsNkwSScp1w2lDT0YSQ7HKaJrFcKCAFXeSK2QR+gVrSZNbgCJ6vY?=
 =?us-ascii?Q?KsSHr3adWFhJUX4MiAZkssjakAf7Ewz2RuiSnpVYJuDnLgqKDOHPmjXVZt5/?=
 =?us-ascii?Q?EN1d5XazermnZPdFYQDhbx4lcr6H3J6on0YXiBdp1GJlu5xd4YOExS1VlRfR?=
 =?us-ascii?Q?DzRB+2hTHLFCwIZ8KZJ7qjgpgSiC651kPldt3orllYMhSbRprk4wAl5nkQwt?=
 =?us-ascii?Q?tfutxeKdpX7foHdoP5TbUQ5fZpX9mau2pu7zXhli1p8H832TlRxRbwQUTcRc?=
 =?us-ascii?Q?+slQYKUMuiTq9v2kc4k+SCIKRI6z9F7i6hRhpbnOL1rm1RE9lo55sj4GCPeX?=
 =?us-ascii?Q?Pe+ssABOf1X028AZHJK19/IkoBeoD/ut3j9OAcui/9XhPkbmVLHG5UWBpzDm?=
 =?us-ascii?Q?mz1Wywst9n/Hf+Qky6WvumYeHMyvWI9YfopuirZkMXxdEtv42qejyZON0FEr?=
 =?us-ascii?Q?nX3rY3yAppptNBc0mRArVuA/8F129RpEWjJBX4XKx9hUHWAhiG1B1Myap9Dj?=
 =?us-ascii?Q?Fv62t5iFxaiLXD16REVj8JP78JRjkvtWQbZ1eMk+x4kCvp44YI6GMqk9VOTn?=
 =?us-ascii?Q?zWreIcB6Ivae4b5H3Uajr4LzGsPJ3v3S8ZswWsRREmCvCHKZlW4UbCLveLKe?=
 =?us-ascii?Q?Lh3jEj7+4+mMp9xtzdKhc52bz8ILceWcSINvEXJwU2TXmV1TCVY+qyvZv1sG?=
 =?us-ascii?Q?qvFRDO4X21d2PYtuE2Sw/UW5fId5Byy/3JyMuqxs6HfCGIdkDy7+oTs8d4Tf?=
 =?us-ascii?Q?I4WfwOVwvIb4neQez9D3IRXXjQYz+jLfB1QtWaBIX1ol//lu6yIp3oFYGSkL?=
 =?us-ascii?Q?KLLuUKqFQ1UZ6qdLbHEge/glAvXaoowZaZC0aCBF4f73qpBj6bhJ8Rtnd/K9?=
 =?us-ascii?Q?rLyOZyrO+0/WMSorU7go1kXpEX72dP29lSoGy+3ssLIyJ6O1LU/NOtuqTNDg?=
 =?us-ascii?Q?nT1CGfKYHOUp4bbqBroCN1xiyGIMadimEOJHNH95qgYIBVNZxeOY2AbhDiNO?=
 =?us-ascii?Q?6usah3TUvA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4b31e8-cc9d-4f7d-4d06-08de5dd70e99
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 19:05:37.9581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVkNtMJQ8wrdwN80v5DYD14mX9S4wE3YI5WPY/XS4ovnWxWIIYM/s61YD249o+4veOOz7EEci2fv/deu+9vsaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6972
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lstrano-desk.jf.intel.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A3E9A99990
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 02:37:01PM -0400, Jason Gunthorpe wrote:
> On Tue, Jan 27, 2026 at 08:54:22AM -0800, Matthew Brost wrote:
> 
> > That will likely work for dma-buf, let me see if I can convert our
> > dma-buf flows to use this helper. But it won't work for things like SVM,
> > so it would be desirable to figure out to have an API drivers can use to
> > iova alloc/link/sync/unlink/free for multi-device or just agree we trust
> > drivers enough to use the existing API.
> 
> SVM should be driven with HMM and there is a helper in
> hmm_dma_map_pfn() for this.
> 

Ok, I'm not sure if that will exactly fit how our SVM code is structured.
> Yonatan posted a series to expand it to work with ZONE_DEVICE PRIVATE
> pages but it needs a refresh
> 
> https://lore.kernel.org/linux-rdma/20250718115112.3881129-1-ymaman@nvidia.com/
> 

A brief look, this isn't all that far off from ideas we have in DRM with
ops in the pagemap (DRM pagemap) though to handle P2P mappings. We are
also forward looking to not just DMA connections but high speed fabrics
too. The thinking there was make high speed fabric API look like dma-map
iova alloc/link/sync/unlink/free but let DRM pagemap op pick between the
dma-map API and high speed fabric API based on connection and wrap
everything into DRM common layer (GPU SVM) to map the pages.


> If there are other cases it would be reasonable to discuss enhancing
> hmm_dma_map_pfn().
> 

Let me wrap my head around this one and get back to you. Something to
think about.

Matt

> Jason
