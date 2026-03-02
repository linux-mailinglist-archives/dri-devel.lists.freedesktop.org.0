Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMWUKso4pWnt5wUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 08:14:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD851D3B72
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 08:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509ED89322;
	Mon,  2 Mar 2026 07:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bSmF+qb8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5171C10E443;
 Mon,  2 Mar 2026 07:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772435655; x=1803971655;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tzPrmrKKY9NDQ9cBY76psP11lJ2XCNEIE3v5mchLOV4=;
 b=bSmF+qb89Llk83xa7eNKx4q58U/8xr5Ne49a9cMi/auHC7Ep9Q5g8IxP
 9RmxKsaaHDpp0ozK2Mwz7nSDZga91gb5dPuvhQJlL/4hfMhQuPw1ZvdHh
 j58U8Hhb2bS7SEiA1m1FuJnQk4f0E38G6OKdRvc32W2l11Qb9Sxj3Tjzy
 ueWe7VU/R0PkZg8z1I2Ky9AnDDxKrUxmsu6UluctEFPGRGekM0TMARwKY
 ob9SwTqEiYulfR5QVckE+KkLbgL2WsTGL5hE/oP+3ArlX9PO1V7vLRc0h
 0PZ7ZrBYAhcTAp9JjR0qaDgO91TjIEa0Rz6ZV/Khe4cQls+8xRYnSUC2Y Q==;
X-CSE-ConnectionGUID: aRSMh2KOTc+hy5iSnIf1Qw==
X-CSE-MsgGUID: nNee1/ZGRDmer1mp3+JS/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="91011027"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="91011027"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 23:14:15 -0800
X-CSE-ConnectionGUID: IR72hEmhSC65h1doGvg9Wg==
X-CSE-MsgGUID: rLS74I52SpOKVri+zhbsZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="215583584"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 23:14:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 23:14:14 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 1 Mar 2026 23:14:14 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 23:14:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7bslQzajOMo8KSFlnEqytTsL/97wVaNhYdDYLEmSYXTRxs8WliVO5Nmh39s4ZTW+/7J3AXILn/HHaB7Fn4/qJjc35wHIGSJ3uWaL4MSMRPjF9agqxQ8Va/lch2zvvM2JT0xO0mAu1MXCMGxZl9PfPGLQnoJtcasDPHM9xFCK/6kk8r2shMQqhOo/p/sATL/7D6nUcBPWf/Cf6MEGDlEmcwNtDU3KKat8Vgxeezvm5L5tv4b8RyiCojhskss1ZgHdMW3ofBPOwrxO7DTu85TrISYF3sApZ/Y4jv2/Aa2nJwrmEA1UUsdaKfQabP8kYlikgXy8VBMLqVkC2mTXMUAvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TB9F3IlVJFImWjb75tOkTzKyPqjBgUaoSGu3P1bKyM4=;
 b=V4/kwVv9xtGm0k0w/fZQLlQq010d2jCpE9tN4Da7tgDXbaqZ5ZHHWWLy5FnCwSrCzJR2n5sWi+m5Q0aMKQtqHmjKtrXwzbP685+UvUrtLxbuW1Dx+DqkzRCn7X+Dw93wKz6G/SEhCJyHNAtm2/CSJw4SJ8Yt1mGiRVcdycak6O4glPCjA2vcu1sf1NtP6qZM3rDe0haYDSd/oHvJnl4JuEN6TgcZ4V0MY+hUJRGgnt7bAbNSxtc93KtjnKp58N5/20DPzix/eC6zZyKx3EbN1mRVkm/DX8BNNm1JXtlsHQn+UmX9i53DJXmasVVgMmbgT4P4+T2D66PiKIqzDwITFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by LV3PR11MB8532.namprd11.prod.outlook.com (2603:10b6:408:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 07:14:11 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9632.010; Mon, 2 Mar 2026
 07:14:11 +0000
From: "Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>
To: Yury Norov <ynorov@nvidia.com>, "Nguyen, Anthony L"
 <anthony.l.nguyen@intel.com>, "David S. Miller" <davem@davemloft.net>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Andrew Morton
 <akpm@linux-foundation.org>, David Airlie <airlied@gmail.com>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, "Brost, Matthew"
 <matthew.brost@intel.com>, Paolo Abeni <pabeni@redhat.com>, "Kitszel,
 Przemyslaw" <przemyslaw.kitszel@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, Yury Norov
 <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>
CC: Simon Horman <horms@kernel.org>, David Laight
 <david.laight.linux@gmail.com>
Subject: RE: [Intel-wired-lan] [PATCH v2 3/4] ice: use bitmap_empty() in
 ice_vf_has_no_qs_ena
Thread-Topic: [Intel-wired-lan] [PATCH v2 3/4] ice: use bitmap_empty() in
 ice_vf_has_no_qs_ena
Thread-Index: AQHcqeGoc0Q9K7IyYk+o568YL22dMLWa1H5w
Date: Mon, 2 Mar 2026 07:14:11 +0000
Message-ID: <IA3PR11MB8986F3692384856A06EACA7DE57EA@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260302011159.61778-1-ynorov@nvidia.com>
 <20260302011159.61778-4-ynorov@nvidia.com>
In-Reply-To: <20260302011159.61778-4-ynorov@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|LV3PR11MB8532:EE_
x-ms-office365-filtering-correlation-id: c738a8a0-d44d-4e15-c8ec-08de782b4dc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700021|921020; 
x-microsoft-antispam-message-info: 4yv0Iy2Wi0SowEqQ0/IFJdSCsu+pVfeBFQ6CLn0yEKwNYSkeFu/FgYPF9k9Xx7397toPYuRRsKOJaDV+tYzqJgjKEbMgQavw+IvW6GzTMFuh+09qEPQiB3J5dVJkFk89rnkmwMNSrktQyPGrVUcbEegIBnFeiXqx5dw5ZjASwt2FjkBg9pXWwhHi66sFBYWiBBoqsxzZDmqwhF+LoBw+UoBUyzFzb2U91zvGE1bsdCD8emdu9Pme2Ngr5DcFcvY12eOv/xhHvfoJv6FC2RuCwVlD2JcOwE4MUhWxNpM9HSZPRU1DAQ/t5YvHzaWXcmFd4liTZkq3AMi6kcEMpQq5AhQ9/gpL+ovvpO8UbcwqVWITqVXw9d2EENB3SFyhPu4oq2bsyaLzyr/FmmPiPVAeLMXcy49c8MBH4yYF0RFK7/pjrvoQahInA+1e/rJfSZhgkkIad5VSytzy/ZSa1ABwuiCTSbT6F1d543pdEA/I2H8XCEbsKv3SPiUa8wAG4+PzSARgIUPG7xVyfqJi0v/0CLACQkbAW1vukL2MDeas3MGciUhUWQMveacNN7mULd52zRRiENqq71Q2kqkD1QDpLvZOPU97QQqeXXbQrl/hxb1a85iPQsfTQ4uvwyIEhksRcxuUccBkLAbn85b2brhDjH6afOE0EauW0RPXPoptpNEYSCce5ZYUVqArwTXwwtA06wpR+ZtT6m9SZ9oWjvryRKrPolxQuLWoQO03bRzX19dHw20+Gg9UPW0omFye5avuHm8nH79tJKIk8QkNlnv4dJyvmdcjHdNJu+4zD2oYsbMowis5fEiq3NixJKXulsI/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8986.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fMvAL6MZDcDJJJppyBbg2lCSvrMbvtXaCSWx3fcAtOW7P86U0f18jNNkxj?=
 =?iso-8859-1?Q?Szze7uByQQa789htd1KHlNIKq4flfH99zT0g1cBeCrQGzlyFpnCmmsv2Zz?=
 =?iso-8859-1?Q?/2Ef80Wl1mw9t8+FGuA6tWVgo0P0Ort3M9afgA2YtwTf/gKgv2wamWl/mH?=
 =?iso-8859-1?Q?Q3JhA1vE+Uy9WCzRFsYEJGNkfNqhiUoSk9S9onHvLelSn4qkJJBob6pnR7?=
 =?iso-8859-1?Q?jZzAbYwv3uQ9jbga5joUOsQtmklcIFrYMkWs/+HdzlvTQYrCdVA42knc9C?=
 =?iso-8859-1?Q?aW8u07iKcPURQKOze5nE+SoQ7HqW+VY9vnf563N2nXOkyYj/5oLAVwn8Hl?=
 =?iso-8859-1?Q?RchATuUEUp6eCvjXkJcex577f3h0YsPsv8FFhBlcaDcIlIxCBWfTOJN+zf?=
 =?iso-8859-1?Q?sxRH5E75+ql3w6VA4SXxLma/e4iW1AIYJkerpkHIGNi3BIiQAaoYhmUBIp?=
 =?iso-8859-1?Q?NTwppEvR+OjUwwNCZl7ZGvLAcNDZT6YepCw44DbwrSy8nDZIgBkgVVyLCQ?=
 =?iso-8859-1?Q?JyejQfNSKTJAsOytp7MxzfTuvhbRBn5hA02qyxz/9E6mjrxZytdzC+56h4?=
 =?iso-8859-1?Q?dq8nLZPeJG6jDYmrTR4PCl0Lch2TqnvH6QMWj9ZCMj0l0X/TUhmYHzYrXe?=
 =?iso-8859-1?Q?e975X+XrEnd9grJ+rm00WzKZmlwUEDZR5j1voGESaAjGNTdgZ8RQnht4L4?=
 =?iso-8859-1?Q?D9ADwXQcrRIU1bRZ4LHecyttzoGVv46IxcxKDg2GapRNSz23J6d8SuCji6?=
 =?iso-8859-1?Q?9b7BuiWzUjHfL7mtNiYREez//7yZW9Gcg56yDz//bPGH5I6tZ/NiKvkSIz?=
 =?iso-8859-1?Q?MAJQ4A1zEHXa+uu1oVam0QPfwHGxHcFJzBNHvbMh3XSW826d+cXPRQ70WS?=
 =?iso-8859-1?Q?Wy3f5hDVQJLpRUauC9wB2MVknR1n4RwfeSdrWvobkQL1v3A9+wGLgizEas?=
 =?iso-8859-1?Q?OyR0YmNiIqUuNvWagsxREbq1YXmsNxF8YDgeHDOxfIitgzOKh7lN2ksmMD?=
 =?iso-8859-1?Q?d1fC0Lrehz+F7vtgO04do2LHnMXzCd2iG56omOAoF4zTGTUdz3xc58vuHO?=
 =?iso-8859-1?Q?vuHenzFUHZ/Yd85chja9n8Oe/jf5fwmNVXGzWMBiyx6oXqOcV8hutnMZqw?=
 =?iso-8859-1?Q?ekIQiu0bmGW8bSK704DFeuT5zsXyZcknieXL6lngKnCIQ61iJEI6ZZvL71?=
 =?iso-8859-1?Q?j8Dx3OguXgCGZ20wFmGbjoeZuPRScW9rG3fvyILA1H+9osyUeYKGIhhtBW?=
 =?iso-8859-1?Q?3HYJ847fIw80yq89IWpFULjsc2v0tt/8a/YKh461p4CJxdKNWRUMiin7Mv?=
 =?iso-8859-1?Q?6yXJQHBOHAdAS1OQr5bBMrp3XFSg1ntXZTSxhJuVDOpPsY2yYNhmNBt/k1?=
 =?iso-8859-1?Q?8ecxds17TcGIaI6b1DYgEJ/uJGo+3sRVEf6RvxelrRP5qI21E+d4q9rOpx?=
 =?iso-8859-1?Q?Y8uAiTWtMhsoUc87YoNEIpDUCDu8mj52UWvQYl0Ik8Htsrb2D8en68IAsT?=
 =?iso-8859-1?Q?0x9Sr0ISF2+i+eE2TvZyBZXt8dRha0B3orDUW7k0PB1+pknGhS7LkqwZcH?=
 =?iso-8859-1?Q?BRTO/kRAeTowZPJl6HAPO7umVOeiPEPmfF7FchMCAhVAXVdOfgHDTVf3Ku?=
 =?iso-8859-1?Q?7r+g0nChPH6xfVyjQ/+zxNNMpUoXsmJGWPHjmT9wSRj3vXju3HTCdRL51q?=
 =?iso-8859-1?Q?qs2mU8mNobyogH3wV1khHRMAWH9sGBnmA9FzhR6pzgvTPctI6nYg0ubmHc?=
 =?iso-8859-1?Q?soEHWm5Zvs8Lx7rQdFz/RWl0CCxFKQeJiTTzWi1wPb6W6/yFv799UY79eS?=
 =?iso-8859-1?Q?+SCWZHiGNNUl5MlHkCFmVRkda2W74oI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c738a8a0-d44d-4e15-c8ec-08de782b4dc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 07:14:11.6686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JGkUtSRsk2jDMlAdg2uTQpEiMuAdokolCOdeuTAQVKumf+ETzFfP0IKxIQUGajY0SG6Tge1E9R4rqR7RrMZ1QQGZpGLphEtJs7tIdW8+cBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8532
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,intel.com,davemloft.net,linux.intel.com,lunn.ch,linux-foundation.org,gmail.com,google.com,kernel.org,redhat.com,ffwll.ch,rasmusvillemoes.dk,lists.freedesktop.org,vger.kernel.org,lists.osuosl.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aleksandr.loktionov@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 1AD851D3B72
X-Rspamd-Action: no action



> -----Original Message-----
> From: Intel-wired-lan <intel-wired-lan-bounces@osuosl.org> On Behalf
> Of Yury Norov via Intel-wired-lan
> Sent: Monday, March 2, 2026 2:12 AM
> To: Nguyen, Anthony L <anthony.l.nguyen@intel.com>; David S. Miller
> <davem@davemloft.net>; Thomas Hellstr=F6m
> <thomas.hellstrom@linux.intel.com>; Andrew Lunn
> <andrew+netdev@lunn.ch>; Andrew Morton <akpm@linux-foundation.org>;
> David Airlie <airlied@gmail.com>; Eric Dumazet <edumazet@google.com>;
> Jakub Kicinski <kuba@kernel.org>; Brost, Matthew
> <matthew.brost@intel.com>; Paolo Abeni <pabeni@redhat.com>; Kitszel,
> Przemyslaw <przemyslaw.kitszel@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Simona Vetter <simona@ffwll.ch>; Yury Norov
> <yury.norov@gmail.com>; Rasmus Villemoes <linux@rasmusvillemoes.dk>;
> dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org;
> linux-kernel@vger.kernel.org; netdev@vger.kernel.org; intel-wired-
> lan@lists.osuosl.org
> Cc: Yury Norov <ynorov@nvidia.com>; Simon Horman <horms@kernel.org>;
> David Laight <david.laight.linux@gmail.com>
> Subject: [Intel-wired-lan] [PATCH v2 3/4] ice: use bitmap_empty() in
> ice_vf_has_no_qs_ena
>=20
> bitmap_empty() is more verbose and efficient, as it stops traversing
> {r,t}xq_ena as soon as the 1st set bit found.
>=20
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
>  drivers/net/ethernet/intel/ice/ice_vf_lib.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/intel/ice/ice_vf_lib.c
> b/drivers/net/ethernet/intel/ice/ice_vf_lib.c
> index c8bc952f05cd..772f6b07340d 100644
> --- a/drivers/net/ethernet/intel/ice/ice_vf_lib.c
> +++ b/drivers/net/ethernet/intel/ice/ice_vf_lib.c
> @@ -1210,8 +1210,8 @@ bool ice_is_vf_trusted(struct ice_vf *vf)
>   */
>  bool ice_vf_has_no_qs_ena(struct ice_vf *vf)  {
> -	return (!bitmap_weight(vf->rxq_ena, ICE_MAX_RSS_QS_PER_VF) &&
> -		!bitmap_weight(vf->txq_ena, ICE_MAX_RSS_QS_PER_VF));
> +	return bitmap_empty(vf->rxq_ena, ICE_MAX_RSS_QS_PER_VF) &&
> +		bitmap_empty(vf->txq_ena, ICE_MAX_RSS_QS_PER_VF);
>  }
>=20
>  /**
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
