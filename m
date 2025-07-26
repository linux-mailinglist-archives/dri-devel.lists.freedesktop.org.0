Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E05AB12B77
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 18:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5214B10E2B5;
	Sat, 26 Jul 2025 16:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4NvfLP/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D40110E2B5;
 Sat, 26 Jul 2025 16:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753547655; x=1785083655;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9xgCUtwZ875r6/kPSRMhV9FHBGpoCO7pCKpB0XCd7RA=;
 b=d4NvfLP/f/DVyVARtvX4mgJvb/JB8Y4DFlWiXgN4d+j6+UrYwzIhA+cy
 Egyh6ATsvcKX1PC4rF88J1g/bXWU/gJ6vpW3lNI1rImNjojOe94yWf2tS
 2zvqYcr54p60/KJBUTNzWFNLk0VxYui4ASpDPLNgp06fXEq3/L5s7PO8x
 QCnm5RLdDm+T0yU2+C4CHoPCJCvIeHuXNS+vQNN7l8l+BQ/bDdPjvz4Tx
 x3AbB0Ak0e2ph1yjo1MMGoNE23Z6CK7GahZAOWLUCxwYXbYXajD7+genT
 JUoTBSWsDw+FaIx3Athhgrzbv7OysvykNjQ05DKqz/pMSzLgaecOhFBzw Q==;
X-CSE-ConnectionGUID: xrhDIxRKRRyxr6XX3Y6zTQ==
X-CSE-MsgGUID: Snz6+Yr4Tq+b9s9dbckbIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55556131"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55556131"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 09:34:14 -0700
X-CSE-ConnectionGUID: kawU25I1RB+3fhAwSchsvg==
X-CSE-MsgGUID: /jhncsKhR0yzrJiwYW/a5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166983140"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 09:34:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 26 Jul 2025 09:34:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sat, 26 Jul 2025 09:34:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 26 Jul 2025 09:34:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjMxn2LUhjtDp5ARTA+1hBILhhaheX75Cgo1l8WTpbc2PUf7MfZaWkYg59ugqKmlSAUXzqiKcaUfyOV0uaW5JEriM9msHcMe6H82X97CM9QCA1g4OIvN4KARoLcjADZLctbCaydXV/eeV2N2ca4z9mp3SKH+S/0q+pPIDwkyHWQMpufZsFCuDhFX+RaYa/aMzOh25vW5OTk7FwFRSPylYZriWsRp0PnG2mxd9KNQmudsQjWMsVVNbdOF74OHngZsWbeXDwYneQAicVo27n4zv3id36GLEpOUAkv5EVRAgYN+3zy0a3Ag01DH5OD8AyQI/xUPxnM/NU33MQrDDGpoIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRmXozOlhBiNaQqPaeTvDZbfx/WmpZZDbINKhgE5MjU=;
 b=rUu878C2+G8hvN/+VBFSLXQaOmkhCssLaBR9bpCvh5PUZmyoIT/VUFLwAAl15UBdabdJHkCXjHYC7AjTfjWxclSh5m5FtdP1RmeD/LQyUcSR7yeVXGedIO3ivcLhf9qEe04BXFDxeA/OTe16NyjoIsm2QuuHeUn2ulM/UzXPTc+20RMtNASyLSDOBalyJqSlCs3AU++6bEIgyhwOAo2zmGmjHEqekC/3Xuab2uP7XlPcnxd8RgVmEO7bR+j0uzzbFxTHx8fQPpBTlniVujQs356jN/CsSLHDzw7Oxjz9O88SWyPluQhQtxlfvX+XYQeO2Nt9wmJ2ywmuVpYFn/Jvbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CO1PR11MB4769.namprd11.prod.outlook.com
 (2603:10b6:303:95::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Sat, 26 Jul
 2025 16:33:56 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.8964.023; Sat, 26 Jul 2025
 16:33:56 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Harry
 Wetland" <harry.wentland@amd.com>
Subject: RE: [PATCH 00/28] Enable Pipe writeback
Thread-Topic: [PATCH 00/28] Enable Pipe writeback
Thread-Index: AQHb/SGX/Qb6FjhXuUGWAZD7j/iBG7REWn+AgABBNFA=
Date: Sat, 26 Jul 2025 16:33:56 +0000
Message-ID: <DM3PPF208195D8D58E1837C7E9783CDC1C3E358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <moagnjfwotoyisjfymvftkm3ndlifgxgjg2b6e74nm3pbityow@us2zmsccovwh>
In-Reply-To: <moagnjfwotoyisjfymvftkm3ndlifgxgjg2b6e74nm3pbityow@us2zmsccovwh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CO1PR11MB4769:EE_
x-ms-office365-filtering-correlation-id: 0023ee14-d8f2-4bc5-6f81-08ddcc62377d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?cpx5ndhpw0rW0+ny1f18gQoYG3k8n8KrFgwM66LwSexmj2hJwQnO98PCm5pr?=
 =?us-ascii?Q?J9B+tELHooAJ9bvuW1edIsFQtTN+EnWpDijBsEgA0nUu8IPdCWd+a6itXqeq?=
 =?us-ascii?Q?jhQLMi+BqZf0WhZl6JENws6IxuzqOjaqC5aoCyL/vAn5wsU5P5BSToKFcpow?=
 =?us-ascii?Q?chAk/kaugZVCD9cKjGHCzBb8civ1G+xeBWlxO5ne6b3AppPH9rCFpsEOxril?=
 =?us-ascii?Q?xfhmkdCe6uYMt9/ReE70ywynPov9E/W+gr2BtaQrj9B9quD1QyCHaT+j0Eh5?=
 =?us-ascii?Q?hPoDiABHxUM5CBAfZLISzIH9g14BAA0FUWoLJS221hvAoDYsjlzXUCXm320O?=
 =?us-ascii?Q?2h/h950XO0X62YoJj6lZktDox4/8LCYpM54D25ir9MDuVAoODK+RwmcQHBF8?=
 =?us-ascii?Q?JtkGvNBI5mHIyM2S7mn/05Bd1m+dY23r5fKvL6b+kKC6NsJ6R65889IzI4xL?=
 =?us-ascii?Q?shPrGM+zJ2WTKbS7jkxpYkQl4aWjaLepnZqv7M1wHqZb75ow7JEsHQwwikM5?=
 =?us-ascii?Q?BEku+c9zuxtJs/lxNOyO91gtadoAdKkCaHYi4Hi76Tw/bHNW08CqbiXvZjQL?=
 =?us-ascii?Q?MCjUELo+oYJMFABi43U+qcNFAX6XWw2iCbajziKuHmMyNOojXpkJIblpD9zu?=
 =?us-ascii?Q?sPPBUU2SsNPx6FwMquh2CMqVBwecGlKa+o97RucW9mCYeuEJaMq+z83yxGNA?=
 =?us-ascii?Q?yQ19RBG/USajhf2ZTOT2E8HP1qxsF+CjficOwI0lDg9VFrmNcG+3nh20A3ur?=
 =?us-ascii?Q?364TkkJXifyv77JeHVT6SDW6hnl/9k57RqOy0PlFhBDK1Ygx7iMGOulye+OA?=
 =?us-ascii?Q?Nfdrwb3lX+2jfTRMCxfr+KqXAqQA0EdvUdslShDUciVIOTMqPrTQ/kTLcmfO?=
 =?us-ascii?Q?JskckTVAmwJGL7NZtgQotefzC6QBbTwrYVcLupSK9RW7zqLF/pOJVtY/c8sw?=
 =?us-ascii?Q?5Xtzm8GMYgODFt7hRqO1UEYaF3Cara2TwzjjgsPoXHd2NKoLdQXyIjwdeDbB?=
 =?us-ascii?Q?M4jSSaku/ZedfehJc5LDHXVOYurU5QW2xAOsSrRxIhut0feX+5pBbocqFvhv?=
 =?us-ascii?Q?rKfwdjF4BCByRK//6r/fDpmhO+C7K6bJhhwW2KSYMpf9+NaGQ2tMl3NkaEKb?=
 =?us-ascii?Q?qc84w3USZr5XW3LBSTCMKmO+6DeJCvPkAK3u1XcY2BX5eLODcHL+oN7pSgUo?=
 =?us-ascii?Q?CqHddZqJGe2Vqm/duEN3+60LH1l372DkTmXk8MzFyKrT/6EGd3jMHdeb1mSH?=
 =?us-ascii?Q?Nd9AfQageWBdaBFz86lgqGxOIYuaFeZxYw7TZelc/Tgk5kQiIaBoix8VDxnk?=
 =?us-ascii?Q?ZNLKXg1y6PW84igTJEKIAm480jCvzWmHrxrNvtU0yEb5hKRJswsQXjGlRGNi?=
 =?us-ascii?Q?Ntf9A/M3XDKqbRVkxXErkB1B5scdiilUKZIORrAnp9iLH3PoD08BD7LbpEAC?=
 =?us-ascii?Q?aAkkPGyXq8d9Gy/ujm6CQkV+Ck2LV8o6mlba0kLFDxVX5+fKHQ5pmu0iIlU6?=
 =?us-ascii?Q?+auVqCVJKf/Qquw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GQSHwToz7hmq9BUnRVYKApy10GIcxFxN48TPpgH3POBvPPd7rDfIOFZrUhRo?=
 =?us-ascii?Q?X8v4QApxFsp9ZHiFmOAzVGZ41gc0NXUQOrefHMEMPAs/B9r16S7XnN21VOk/?=
 =?us-ascii?Q?Ulxg6bzfk/ADkBJoXxggKn34acf0xswS+KH033fmTjFvuM8w2YQfTH1eeE8e?=
 =?us-ascii?Q?zhKROJxq8zIDMFtUidKJSuyDpvhJhzs64gEmXRG9+xXDT4wzlDkHQKhyiJek?=
 =?us-ascii?Q?iJY3Py9CYodhSaofymQml85MtV0jd2fmOY3bN1WNJ69R4psWism3r4kI9yUs?=
 =?us-ascii?Q?khV77Ta8ZhMWfxVoMrM/zPfV9pcJf3+wGgzBHNXbTjhlR6I6ZeBbDzg7GDMm?=
 =?us-ascii?Q?jtQ4MGn1u/UACOnGJ8zmGyEJEXe1oI30yKrAKGkOeoyRkAhJ1GifMFLCNMg+?=
 =?us-ascii?Q?bgFp861aM+dJYZ2UOzpG/gAtZzQj4+y6AuXrLJdXZ+dyYnyMMrLnYOjY6UGN?=
 =?us-ascii?Q?CFddncpaQrTIMjfD1P8LTWdZCVP3D+epqK7pAcQHEI2GD/VZ5AMDOG6kaUt6?=
 =?us-ascii?Q?RHLALG2sHX7X2noRrMfPdThTEUHY1VawboyijLLrns0sIBn8AoUy3gMJ5F1V?=
 =?us-ascii?Q?g2tKnIBN6qT/P1nOdB4ePPArt/8YPA5yzNtYy4ZGyAIqjk0NW+lhtpo0//Gm?=
 =?us-ascii?Q?0k8L1zZIsx4+ckeJV8xAWNqaHvq5QARTs/nk/I+bb+5KgOk+hEGas1W8H+aX?=
 =?us-ascii?Q?TWjv+GLQGYqiKnwOFrdoFumun1se6uLui2hK5ycr2HohOUTSjnkSEMjIYUdy?=
 =?us-ascii?Q?kl+imZemzFlDcykvsA5s1SAf0zcL0M1+5OPtOtgLFMxxzRNluSKhhmerUhlS?=
 =?us-ascii?Q?ahhWYRa6wfVuSQSC7A6jFABog+0fM0zt1mvJr3Vg1o/62CVrakbEyHTAR8M0?=
 =?us-ascii?Q?7d8XZf+A/Mdu4H0Xb9WDLqwJJKfWJ87D27DT/WCiLqYFERiiZdBZDvEdTsHS?=
 =?us-ascii?Q?JTyJEgcZmvMcxpr4Llm3Z+at4sa235ozXie3YJEWZ062Ic8DAJ/8eg48/8pq?=
 =?us-ascii?Q?LKpcPvOUPn7Dk8N6pY5UbIh314fL0rVScvqf4I4kIVSXpEZlgo/TLDMOEg6v?=
 =?us-ascii?Q?inHi8DLi6qvXd6TWhMDiScwetJf925uJ1GpkChBT/N/ldREUbmXuHyHrr549?=
 =?us-ascii?Q?+X15uhQeSuJGFeubVaEOZJZI8c7f5iCmkJ7Nx8K9H2K8+IANow0un5sZTOIR?=
 =?us-ascii?Q?NNsu2DZfWjknh5Yfg4UmvEpbdtcd0XmTz8L0rdCAYFrkPHv9YgRN7Ap1Xjeo?=
 =?us-ascii?Q?UxFTLUdu/dpwVBXF/ZcG8B99FW0A5n5Dje6ykL7U629hv0hLhvZJM6DWmXmf?=
 =?us-ascii?Q?AKg+4xqxpTsxxq+ruPKCSEWiSOdPaM0Ctq+aeK5ih/q19XEbyG13OrnqQxSK?=
 =?us-ascii?Q?oWKPa6BcSzD/AXqgPHl6m4qMCjyjq82eoIRGS+aAgVGeudYMbstMfD1uqGR6?=
 =?us-ascii?Q?UOVkTglXiZuwcNr3ftUwWTZ3OTDlzLRW8oxcw8aIQ+ZMKFf6TTfqPA5qOxD3?=
 =?us-ascii?Q?exhj99nXXQ/qVMWPPznjLsl+CRVTtCE+jbWxLLHEdlgVuBLRHC0KvS8M46iY?=
 =?us-ascii?Q?qoaQY/hiSRB27P0Wzd5gZDA7gD9SY7lRrF8Ssq8j?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0023ee14-d8f2-4bc5-6f81-08ddcc62377d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2025 16:33:56.5700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QBY7nmwDusooNmxnU4fSMCJydwQtF1n3LC+eO7cIBhjcvkZiulGhGGlJJx+Ote8V86wr/DvFxk90eeB67ah8xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4769
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
> From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Sent: Saturday, July 26, 2025 6:10 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; inte=
l-
> gfx@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>=
;
> Murthy, Arun R <arun.r.murthy@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>; Harry Wetland <harry.wentland@amd.com>
> Subject: Re: [PATCH 00/28] Enable Pipe writeback
>=20
> On Fri, Jul 25, 2025 at 10:33:41AM +0530, Suraj Kandpal wrote:
> > This series aims to enable pipe writeback functionality on ADLP where
> > it has been tested. The plan is to slowly accomodate all supported
> > hardware after this functionality is tested on them.
> > This series also brings change to drm core but not in a drastic way.
> > We introduce a helper which lets drivers have their own preallocated
> > conenctor keeping the connector in drm_writeback_conenctor blank.
> > This lets driver have more control over their connector but still use
> > the drm core queues for job creation and signalling. Some new helpers
> > have been added to aid drivers so that derivation of drm_connector
> > from drm_writeback_connector and vice versa becomes easy for drivers
> > that will use this helper since it won't be as straight forward as
> > wb_conn->connector anymore. Driver not using these API will not be
> > affected in anyways.
> > This series enables the triggered captured mode where we need to
> > trigger a capture.
> >
> > Cc: Harry Wetland <harry.wentland@amd.com>
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> >
> > Suraj Kandpal (28):
> >   drm/writeback: Add function that takes preallocated connector
> >   drm/writeback: Add a helper function to get writeback connector
> >   drm/writeback: Define function to get drm_connector from writeback
> >   drm/i915/writeback: Add writeback registers
> >   drm/i915/writeback: Add some preliminary writeback definitions
> >   drm/i915/writeback: Init writeback connector
> >   drm/i915/writeback: Add function for get_writeback_connector
> >   drm/i915/writeback: Define the get_connector_from_writeback hook
> >   drm/i915/writeback: Add function to get modes
> >   drm/i915/writeback: Add hook to check modes
> >   drm/i915/writeback: Define encoder->get_hw_state
> >   drm/i915/writeback: Fill encoder->get_config
> >   drm/i915/writeback: Add private structure for writeback job
> >   drm/i915/writeback: Define function for prepare and cleanup hooks
> >   drm/i915/writeback: Define compute_config for writeback
> >   drm/i915/writeback: Define function for connector function detect
> >   drm/i915/writeback: Define function to destroy writeback connector
> >   drm/i915/writeback: Add connector atomic check
>=20
> You are adding hooks one by one. Are you sure that the series is bisectab=
le?
> In other words, the driver must work (aka must not crash) after each comm=
it.
>=20

Reply wont be a issue since the init call to connector is way later which w=
ill not cause bisection issue

Regards,
Suraj Kandpal

> >   drm/i915/writeback: Add the enable sequence from writeback
> >   drm/i915/writeback: Add writeback to xe Makefile
> >   drm/i915/writeback: Define writeback frame capture function
> >   drm/i915/writeback: Configure WD_STRIDE reg
> >   drm/i915/writeback: Configure WD_SURF register
> >   drm/i915/writeback: Enable writeback interrupts
> >   drm/i915/writeback: Initialize writeback encoder.
> >   drm/i915/writeback: Define the disable sequence for writeback
> >   drm/i915/writeback: Make exception for writeback connector
> >   drm/i915/writeback: Modify state verify function
> >
> >  drivers/gpu/drm/drm_writeback.c               | 123 +++-
> >  drivers/gpu/drm/i915/Makefile                 |   1 +
> >  drivers/gpu/drm/i915/display/intel_acpi.c     |   1 +
> >  .../drm/i915/display/intel_crtc_state_dump.c  |   2 +-
> >  drivers/gpu/drm/i915/display/intel_display.c  | 178 +++--
> >  drivers/gpu/drm/i915/display/intel_display.h  |   4 +
> >  .../drm/i915/display/intel_display_debugfs.c  |   3 +
> >  .../drm/i915/display/intel_display_device.c   |  29 +-
> >  .../drm/i915/display/intel_display_device.h   |   2 +-
> >  .../gpu/drm/i915/display/intel_display_irq.c  |  10 +
> >  .../drm/i915/display/intel_display_limits.h   |   2 +
> >  .../drm/i915/display/intel_display_power.c    |   4 +
> >  .../drm/i915/display/intel_display_power.h    |   2 +
> >  .../gpu/drm/i915/display/intel_display_regs.h |   1 +
> >  .../drm/i915/display/intel_display_types.h    |   1 +
> >  drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   3 +
> >  drivers/gpu/drm/i915/display/intel_opregion.c |   2 +-
> >  drivers/gpu/drm/i915/display/intel_pmdemand.c |   3 +
> >  drivers/gpu/drm/i915/display/intel_vdsc.c     |   4 +
> >  .../gpu/drm/i915/display/intel_writeback.c    | 686 ++++++++++++++++++
> >  .../gpu/drm/i915/display/intel_writeback.h    |  23 +
> >  .../drm/i915/display/intel_writeback_reg.h    | 142 ++++
> >  drivers/gpu/drm/xe/Makefile                   |   1 +
> >  include/drm/drm_modeset_helper_vtables.h      |  59 ++
> >  include/drm/drm_writeback.h                   |  21 +-
> >  25 files changed, 1238 insertions(+), 69 deletions(-)  create mode
> > 100644 drivers/gpu/drm/i915/display/intel_writeback.c
> >  create mode 100644 drivers/gpu/drm/i915/display/intel_writeback.h
> >  create mode 100644 drivers/gpu/drm/i915/display/intel_writeback_reg.h
> >
> > --
> > 2.34.1
> >
>=20
> --
> With best wishes
> Dmitry
