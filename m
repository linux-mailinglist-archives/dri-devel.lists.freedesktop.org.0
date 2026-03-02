Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMJ9CqM4pWnt5wUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 08:13:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 906951D3B3E
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 08:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E929D10E446;
	Mon,  2 Mar 2026 07:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRnU7QlK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8587510E444;
 Mon,  2 Mar 2026 07:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772435615; x=1803971615;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q+IGxVI7iF6WFS2mSjan47QguNhdY3+I7V5+k6RJGBE=;
 b=eRnU7QlKwhUuD4wx4grA/i1xMkVf4eDNMSijX0zl7Zg4X6VV27AT984R
 GKSPI1fPv/v+P7okk8VisuLUxx8z0bk4h83tk6TTUuugHtFwVm28mi/7C
 iHGVrlzuMUgUeyBKIIhtLGdfvrHPAoOK5Er/02P+cly9NFS7qGwvvNYgB
 6kH5SEkdfWL0l+CNQvjydRe1OQ0FZmqdasHRNZTKmG+jDP7mXUExFEuL2
 7InoH4E9LI1VBhV0yJa38HOEq6ozQNLKVPC2f3QEKo38YHU8/RNQYtGUW
 ewMvoioWCdzzlCYpi1MxnRnRIV7SgFdWSBxhQix0/AUFJXz/u1u/hsycz w==;
X-CSE-ConnectionGUID: WPuOZ3NeQi2pKdGgD5SlXQ==
X-CSE-MsgGUID: 61rK45s5SHqWfdb/Xs4TEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="91010966"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="91010966"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 23:13:35 -0800
X-CSE-ConnectionGUID: HWs5pAjDS32bZIU4sg5Gdg==
X-CSE-MsgGUID: bqpseasQQ0yY0iuOA4cqAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="215583501"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 23:13:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 23:13:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 1 Mar 2026 23:13:34 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 23:13:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJU2iD25e5wkAl4qmqx6A6Mwsao2Gze8fKyZQYSWY88zlN8TKXNXJ/envtjAjDDGLiIPdRwIVUPNFc9WwnWJcRAiQAV2S3pudIlt3VUp7dS399uiwFvAlMKhzcL5/CZVtC+irUoZ+Z6mDW3d3GdubJYjqzcUicnTDfj3OTXPGyU4RraXDKKPVBb3xcDm5Jg71d4vUKTBR8pkeN10tF/H8WlDlS9gpEV6tcd8k+tqOVSDiR49bxLSnXW0IidSzplalKb/btU94rvgLJEvdvdDDOj5tuZSiDepj3AVBtI7aSLP5ZtRzSEQ5Zp6Dm/3hlbMSJhSSxBbbTqCpxTP9wKCkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuMpsHzoI2qzIR5nVG3/zzrXzxl/G8V1KHk+p+F9dXE=;
 b=CKrFb0KlXfDyMJr2EoCvmWqmEWddfbqyH3gVr+zxQNZNwBzeoOz+8F2po3uc5kQFhLEgAMwbwCJBpf4DyJv9FQVZjob8Mzi2TR5EoasPJEL1aonQKgEOB/3s1mXiLjRjkJ9+B8CrfCkTFrE126EfJTqkCWxIutiBc9UmMmclGcXI9Sqz2yUi0d6/m3hWbsP8yP2bZ81DWXmymXSBcRZML+e3BqCc+62wwrnXnz3ffYSLY39O3MFTJ4p94qJ42K6nNlfdUxywhYahJDuB0VP7GcW96bw+LA+7dGTKMrpnzNSi5x2cT8vIAYO7ZBnMkOEIyZmswh8LpWAX7DNUtwfF0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by LV3PR11MB8532.namprd11.prod.outlook.com (2603:10b6:408:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 07:13:31 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9632.010; Mon, 2 Mar 2026
 07:13:31 +0000
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
Subject: RE: [Intel-wired-lan] [PATCH v2 2/4] ice: use bitmap_weighted_xor()
 in ice_find_free_recp_res_idx()
Thread-Topic: [Intel-wired-lan] [PATCH v2 2/4] ice: use bitmap_weighted_xor()
 in ice_find_free_recp_res_idx()
Thread-Index: AQHcqeGkrqtZK2cTxEqjY9lXXtRNEbWa1E3A
Date: Mon, 2 Mar 2026 07:13:31 +0000
Message-ID: <IA3PR11MB898640438994A551D1233770E57EA@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260302011159.61778-1-ynorov@nvidia.com>
 <20260302011159.61778-3-ynorov@nvidia.com>
In-Reply-To: <20260302011159.61778-3-ynorov@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|LV3PR11MB8532:EE_
x-ms-office365-filtering-correlation-id: 6f44d308-026b-4973-5494-08de782b35b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700021|921020; 
x-microsoft-antispam-message-info: QhuxEvOOLLSMeCnjMhqu2JwjQGE7IuBvANVyJnSecF/xrgU6/b9gwjCWYhPr8iJpV+UzobW39f/KlGOnF3GY6zmNuBP+0V5HFsKIfC2kX7dk10OiE1GoR/3T7fme5/0gmGlEsuiKe7k2YBwDQTj2qZxoOxbgTmeS3pldWGw0+2B1QQcklaXzXCUnwTtbHJ+UjUGleB6uKK4+xm8AT0uxIF+/ujMSusW4+jLL0jlfldtqTbV8K3PoBT7MYEH+9LjSOeSRzoc5iPlnQZvcumLGBpwIkYpsSoet3zjqGquUQmpoZyf3OUbN+JyIgcZVdzlreeOkeEfUHn4wnCFUhOUpbWkDV2nsGC9E5V61fANwUEiiH2GwI9i2JXFcpmJnbIkMJncgRTuaye9uadgkML05lHSyNc6TjhBHioxwhGSNIbfdh4FnCbtWkdX9jztvobicR+F95UvXvOkqpZt8gNZsCV954l9rXUA/iWQKtVM2/N2YRtwQ7VMhzPScem8LPCr/l/bJsgCRL8auWR40Z7jFaQeYXMo1ENiVTN5AyKQUX09HU2nAcS1IiPUKo/Vy5kYoDk6kOXIkfF/i1hU1wKqZheXfCJ/BfuiT/cB/86PL+cMQ9RxrWScevSkduYn1wQZPohY/XuHH01cqgPtxIRygpmrvWDSmRyFMol1aZZ8peVIdncueJy5OsM06J5phRlau4hrpurEUsUVPXhWftuj6s2/hR87IIHH1/ULbt0DrWjCTXfNhejqvot7TrTG2/TBvrGhNezayp5RTB03ZrpY1llbJYYiWCYn3i++F+freF0tvuX6ZxY9AYkRNz0PWbfZX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8986.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/Ls7W7nKvoW9zKVWDBusz42U4mNX5WNShgeZwF1i5Fcfs4jiXgQvsBRQiS?=
 =?iso-8859-1?Q?i4IoL/Q60j5tqJik9hospy2UJu9MvyLgia+U+tb679quel0GVa1c5lXQpi?=
 =?iso-8859-1?Q?RsfiPfNpthgaPqOiALyWFX+vLKj5vZvYHzOt5LxoMjCOHitY1GsMZt+N0v?=
 =?iso-8859-1?Q?tnwwMOuZXklLYeaEuqQ0n3yCJbnFwElITmCMx0YdJXVrc1hFfLq4Brwy2Z?=
 =?iso-8859-1?Q?Kc0xjAsEGS2WmheXARitke8WqL8t6mmSD2nHQ5E3G5Q6WeGn7ukia3URmP?=
 =?iso-8859-1?Q?N1tDoMEG2ey+ZtJIOJHevELLVm0hhKQcqNVg1U0nJcGMEuPuKStbrGgOkR?=
 =?iso-8859-1?Q?coTOAic49wvkq2HGmpKbGthWGf2Ymh6mGve4qdEKFcN/cIj9ZA5FK1tfmD?=
 =?iso-8859-1?Q?kXrX8Tvu4zrWVNzum5fDI8t7bXFeSZWP+t3wIgLq47tTAytAymt8tAJMjm?=
 =?iso-8859-1?Q?AFHm/FsMbZkRnvW9E2dunZXe9tvr3VNjAxA+HX/i3tx6ZP0KnRR1CVWxPK?=
 =?iso-8859-1?Q?XWXmyov4V7Ylr/6WVS0HzGz/kNBL4OY/KCyiw5qfT0zqN4C3wmdVD/j1Ha?=
 =?iso-8859-1?Q?J1ZhkWETF6h0ChetAJtxmR9OJOyEWAw2ZVTqZigTaqeVJ3+A6Cy5izSWva?=
 =?iso-8859-1?Q?Y+fDtmcXkfqDITvCryZII+D1m2qU3M0qv5dmUB+fmwgsAiQVOyeK5qjy9Z?=
 =?iso-8859-1?Q?Bg+ggp3+wIaJBAbNbI1/2uyXE+7MOfMp6s1Ojtv1bYWyajooy8mexr60eo?=
 =?iso-8859-1?Q?o8C6/5DltHw7fZJChfI5RMiMWeDhbd6M+k78o3YB8VeCUBTewhdEytOP90?=
 =?iso-8859-1?Q?OUsizJUirkzRbDh0Y5o0Ay5q6z9F8Ep6BfhnPVCjW0s059Z67UrnFSiINf?=
 =?iso-8859-1?Q?dTKESJLG8zPc+2BBE03WqBS9LJpS6v4FN5i5yEnc2eNkzGmbp9LXc8HqMj?=
 =?iso-8859-1?Q?lvjUm92/K37dd07+XEyvcYL2ImkeujgEuU8A0LqRpiPton9BbJX4hmDiCM?=
 =?iso-8859-1?Q?sbj+4E6+rbYbkifAdiyzDOt2cZMS2BWo2KpEFhKL9+P+X54K70Uo9RIQ45?=
 =?iso-8859-1?Q?cykNMby0sZQip0LBE88hv98AvxzHT5GntCxasI5fDsefErCeYEIHbPSjmU?=
 =?iso-8859-1?Q?8czgVtTqmPiIOh5tY1GFF8ywGRj8JG0XxOanDbmMjGwslOfDtOrEW0NTCG?=
 =?iso-8859-1?Q?ZhvbxBgMKS5lvX72DXbHmqwzNE/K/fVonsIp1XemEQrMTAwkeirXS58xh5?=
 =?iso-8859-1?Q?xwajWq25XjxRaheRO/dH+rqnK60JsgPGESHg1sLN5VCQ08ODWpCkfmWfpb?=
 =?iso-8859-1?Q?u6jVcxZZn7ht9qvjbHLGXopkZlcGStu1u54Q5yvRJn4qvJ3z3Yc6+0JHe9?=
 =?iso-8859-1?Q?i1532igYFNCTvcRPHBkyy5FnrNYUSd3MOfNL0tYrSIRcSj0DPI1H6VBHPU?=
 =?iso-8859-1?Q?Ks4MEpM6OnM6Ue/kG9V0mjxcACqbN1wdNt9sRIeOWstmyyezMJKftKAE7R?=
 =?iso-8859-1?Q?VCO1aqrkr1q1+tso4y2XB/qC9IeA+TwgdmhDsstrsVTF5oujSrYIx38Z5Q?=
 =?iso-8859-1?Q?lDBD2ZSC2j0zNNK7xWkycglFaL7OTOn1vmjOleHjEGwR98dW9G9jWIFJRQ?=
 =?iso-8859-1?Q?eG5iu9vfSns3yw9wcl4FItYqVwkTbwJvYW9GyTdykX9HJ/vtvIc2AJu69T?=
 =?iso-8859-1?Q?GJqL6biDmxyYYl+EbTA//mMMrbBy+jLknp/RIIMUUPmbeUqGlnsVlIVAAW?=
 =?iso-8859-1?Q?XW40k1iKhDaImbB/UpJtTHQE9yixNMZTlFDFj5MP/uNdYFYNG0ZGPfPXJt?=
 =?iso-8859-1?Q?K9LyoX0p3aFbsx3nEupRqENgSGaD97M=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f44d308-026b-4973-5494-08de782b35b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 07:13:31.2803 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wyo4rh+jAXzsp8uqSTkkqHD/tGPKoy6YCvhsyMoXpNi+ODiCsAnABi5lDRoh1goYlJ6PUmvC8xpJA5rmAg2jzIpXfwY0vr8XfMEc6wMXzO8=
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
X-Rspamd-Queue-Id: 906951D3B3E
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
> Subject: [Intel-wired-lan] [PATCH v2 2/4] ice: use
> bitmap_weighted_xor() in ice_find_free_recp_res_idx()
>=20
> Use the right helper and save one bitmaps traverse.
>=20
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
>  drivers/net/ethernet/intel/ice/ice_switch.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/intel/ice/ice_switch.c
> b/drivers/net/ethernet/intel/ice/ice_switch.c
> index bb0f990fa2c6..6a5875bd9c6b 100644
> --- a/drivers/net/ethernet/intel/ice/ice_switch.c
> +++ b/drivers/net/ethernet/intel/ice/ice_switch.c
> @@ -4984,10 +4984,8 @@ ice_find_free_recp_res_idx(struct ice_hw *hw,
> const unsigned long *profiles,
>  			  hw->switch_info->recp_list[bit].res_idxs,
>  			  ICE_MAX_FV_WORDS);
>=20
> -	bitmap_xor(free_idx, used_idx, possible_idx, ICE_MAX_FV_WORDS);
> -
>  	/* return number of free indexes */
> -	return (u16)bitmap_weight(free_idx, ICE_MAX_FV_WORDS);
> +	return (u16)bitmap_weighted_xor(free_idx, used_idx,
> possible_idx, ICE_MAX_FV_WORDS);
>  }
>=20
>  /**
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
