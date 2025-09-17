Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE929B81714
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 21:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE9210E1D5;
	Wed, 17 Sep 2025 19:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBhyquJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9549E10E009;
 Wed, 17 Sep 2025 19:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758136315; x=1789672315;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OCZ+sZcQN/7ZZm7m8Wz+lq4Nx8jQ3LUS1cLwkcfUTTc=;
 b=jBhyquJJXpkkyAryjp+qPXu69Pd1IZpVMwCuOKvikLKq93S3K3uxdTQk
 WDHMHOx5Enu39zMY43ZXZvxg1f+1qg3tmSukKAg3eBsncqV5AQth1aWf/
 u+8VaWzOTVLiTJ2i5NGyxgouTZ5eFAkz3RGcdr9yTPZYMiZo4j838ZOs6
 /IO9P4dm1lzMWESZ0u8fX3IjovNhG1FZg0awXEAi2iJ1d1WWMn5ZQyiV3
 bZCW0/dZmqjZuvtDyg4CTvMUz39mA7Nk9GwP8T5vPWb05UxRlBdssDRMH
 6t/2O+wuCaWeYbU3ug0iRVUupVqmFz+UgGan+Ce/dGpw9y3PpRBOC36gn A==;
X-CSE-ConnectionGUID: Tubja/H4QTWXWXzyJT+xWQ==
X-CSE-MsgGUID: hN9fVfsESDuvRoEFX4TeUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60522485"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208,223";a="60522485"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 12:11:53 -0700
X-CSE-ConnectionGUID: UzooBrFlR8C6yN3TINXgoA==
X-CSE-MsgGUID: sT86BvbKQN6UyAA6/PuAUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
 d="scan'208,223";a="175778317"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 12:11:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 12:11:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 12:11:51 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.34)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 12:11:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ck8ff28iH4l8mRPYT52ZWpgwn0b+WM8IZScJJLCO8Gzxjgmks06ibsQBJJd7lGW+GOeKXvHRIwscfDcD6B9IWVcmyhpF3iNSYv94iqC5dIDJPu4Bf1lizbHAHIpmEqXYVBxi+l7/lRBwOlfllGEmXnKYF7lQReKf7LgYXmDqLR+vdLItI5NAisvKkcOQsiW6o1Y5IBfujIxxvnFSaJ1iAOYeLqjRCUJWaUQgLfou3fFGU61IZboDbJMDRgwF+meC1YBI+R1B3KTYS0AFr3SkSvY12/13R30fVp0Svj0k8E8xrEE3vx3jIAr48EPjHai05BoBlsLen5Plhermn6lrgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoIqFzB3xlQOIEF469CYjNzWb9TFXh8DWLkPVymFlc4=;
 b=YL1prmzVJ5u4LOHt089G7jeiXFD5/VcBFTmp+4JuNkytiHffmoV2MHSre8kPM3GvjIZy1e3eH9eG8p3/KTj9zKCnSlLlDZLdQXmSZej27qQTEeuMEIcGdgTyKOsds4JQmJ/jxuxSJ/j/7wKaXVo+I9rUwELhm6twm+XFOq8tssK9mtyz29ueed0wAU0uy5BMM77k00qnuUpIiiah/g3HbWB1UGdt8Ju3/FD0EZLlV+RO6ciZeoVhRrdTDDahzEkl3jZfj9/22TqQgG933T3E6p3B+lz5+N1L314gl6NqRWDJhkIuBar3rpIGP0mkwH3g7cn3/OGNHGcgxLNaHr+8Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8541.namprd11.prod.outlook.com (2603:10b6:806:3a9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Wed, 17 Sep
 2025 19:11:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 19:11:48 +0000
Date: Wed, 17 Sep 2025 14:11:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Christian
 =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "=?utf-8?Q?Micha=C5=82?=
 Winiarski" <michal.winiarski@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>, David Airlie
 <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Michael J . Ruhl" <mjruhl@habana.ai>, LKML <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 00/11] PCI: Resizable BAR improvements
Message-ID: <xb4jlxyfmrj6xxqznipt7fhlaycuooap44pqjf7pgqyytv2u7b@g6s3pveyjezp>
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
 <wqukxnxni2dbpdhri3cbvlrzsefgdanesgskzmxi5sauvsirsl@xor663jw2cdw>
 <fafda2a3-fc63-ce97-d22b-803f771a4d19@linux.intel.com>
 <fl6tx5ztvttg7txmz2ps7oyd745wg3lwcp3h7esmvnyg26n44y@owo2ojiu2mov>
 <f1ba313f-74c2-ae63-ac80-4a35e53477b4@linux.intel.com>
Content-Type: multipart/mixed; boundary="pwnu35ie5kqxosb3"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1ba313f-74c2-ae63-ac80-4a35e53477b4@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0124.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: ad391d94-9825-41e1-92b2-08ddf61e0d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|4053099003; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Q0lQvBxt36gXceCx1yMC1xc4ExdgpVOQgUi0FCpdLmwEyP6EWehkeZONag?=
 =?iso-8859-1?Q?B/KokUjZpu+6vG551QpNztzd2Mxbcb/LqspS4WmFt+QV680x02JfZSyDCc?=
 =?iso-8859-1?Q?4nhb4GBW9bb+EFTBy4EnsXb1yipwXXPPyUNaeUuWvW6XJijaABC1Kl1CHw?=
 =?iso-8859-1?Q?gkX+nKiOayWtfBYcnXdhQnKKY4IQMrqn42W6lPVFYHKKM3/cmSVHJCNI0H?=
 =?iso-8859-1?Q?6sURWu7pNyDgnd/A8Rqt2l8URktYXAfkqvVxwEolveDrHAMdlaUjl1O8CN?=
 =?iso-8859-1?Q?MqkDSMKQiGHJZ6SfJgWjt8ipOfyk7Mevtt7sAwBJ/fdUwcjkleUXRnq0n3?=
 =?iso-8859-1?Q?bTQBhMOHmLvXmp+npa+FFpxML6ByWN6znRcQ7g8Yn/GlbGDiGnT2lrmo2x?=
 =?iso-8859-1?Q?RRwCHbDqKdySBxS7f8VRjRri1k65ZJJ7D75JhigMWlj2Sf1iBuc6Tlxn4H?=
 =?iso-8859-1?Q?B9z27dm+RL3sAmLKXqXIbcFv5uPIN2XjGhm5YKUjk5LDmlejumU4IzWXmI?=
 =?iso-8859-1?Q?9+AH/+H5AmN/kfb+Izy92RNx6MdUZ2ulU+Fsyrl9aTCTF1VRxEZiok0kjT?=
 =?iso-8859-1?Q?FTHBx7QF6IZ8DIT5oeLaSFA7vpg9InnkH1+z5BJObR5l8fe/Hrrqx7SYcL?=
 =?iso-8859-1?Q?VDX/isDe/yju+/3bb4XcZw/cOClb4dOwQ4ceabt4N413eJscZMYfkq/kFn?=
 =?iso-8859-1?Q?cANz/DZdiPUoxqQaK3tZCDjMPFaE1/NZLrwlD2ahY8utEiYx9BOFh/Dlco?=
 =?iso-8859-1?Q?cQKn6CyepytpGirJKaxs1kTmnQsxyJ2QGUlKrboYgRGHbn8el+fRdKLyA6?=
 =?iso-8859-1?Q?3aekDqi9DfxtnsohLGUubFDbltW+YaHg6+BOz6r8ScmYRSmvl5dBul68No?=
 =?iso-8859-1?Q?2/oGrp/jzup3TqQp2XLLZHqyql7apMZT0g8k6mqLgHLKO7lh2cx7C5A1RV?=
 =?iso-8859-1?Q?hsOiyBaH36qWEHkN/GICC6TUFZrEdZZ8lkt15FrQgn/fJWW/DRyvNUBQly?=
 =?iso-8859-1?Q?91+oZwagT2Ej116vL6Uy05zx48aKMfh3R+ahyYnfEt5KadyVso/kJ++RG4?=
 =?iso-8859-1?Q?ZNnDAoueI+F/xyQFWcNOdhw8iXPgifj3BK3sanQiC/kA0u6t3B0XVyAHHh?=
 =?iso-8859-1?Q?iukoqVbcqOP4uo2FM1Qj2VQw7689qT0E+V/b7VUwz8RCgLGEb3D2FGZNJh?=
 =?iso-8859-1?Q?jxGDRAFQo4v2UqWrBPSxJLsEOLktW8pftCdblLt/xg0+yROfhOy7LIEB/E?=
 =?iso-8859-1?Q?JSwxRlyRrohNKC7rVZBzMlq2sAfmikzvUORA1ED1/OBFOz09hIogC5gc9B?=
 =?iso-8859-1?Q?gxc9dnmnoVa6l2K8Wu7GdkJNpja/ZcoVPRL3fUOmaMfMbIauk5IpgBaiMY?=
 =?iso-8859-1?Q?f9+ByT+an0JsRavbaljIQLxF9uPVQ1Y178fl00Fas8YaEyWnwCmeYH1dXZ?=
 =?iso-8859-1?Q?UKfyjcEPSYEqp0ia?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(4053099003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/oXimzD91GSQCsu1FN8U9F2Re79xtzpPmtMDoutb4cDbRgxObOoBl5W1zS?=
 =?iso-8859-1?Q?PJ25ATvKo2BoO5o/gdd8daSPYLatQpHV6oS1fzIadgD9cElhlIEA/7520y?=
 =?iso-8859-1?Q?56IdM44rLQ1GZcdbTu1tbHhRXr7yyRl03SD0lpTpXBluCo2scT0+zUPPRA?=
 =?iso-8859-1?Q?PQGj77SLmtMmTyxaBl4PRyk8sRbVaIE9CUNlsxStyOA9JJjLufbbnuScky?=
 =?iso-8859-1?Q?FuDc0VrIqXQYSRT310d4MYzUvA6r/DWFm9Jia5q6wwlT6dJNQjriW4X6DP?=
 =?iso-8859-1?Q?VhuJCR6rbYdDtRp2H6EuhmyVqjkhiKlBgpqo9SvWWrtA3teVCUvml35PTg?=
 =?iso-8859-1?Q?CKFSSqWj0CelcwOEOg21T/v3rzMFNOxO5ah+tL47XAB4/P7tjeTBDDFfza?=
 =?iso-8859-1?Q?o3iH+Z/mRbZrMIvMfSVy/oMZusijHeTeV9BCBh56ACJgtnbBPN3FrIMgsh?=
 =?iso-8859-1?Q?hGnXasPqSmXpAytZD0/hymcceFPRWNzIKvlfdZ+Vu8Gc+CfQu+M0pRB3NB?=
 =?iso-8859-1?Q?wnSHgyefh8ZACWXLzjle3wqj9mVDwlHFQqYagvfRJH8KplvKrYBWUcvLQQ?=
 =?iso-8859-1?Q?U1d896T9s58nO9YkGeairn4qDIZVrapO4DyR+VAFGca99EQzMRbD/Ic+S1?=
 =?iso-8859-1?Q?DD88KwJLt5pjY1+4PhkR2677yW0Mnyf+aQaG1uyPCFUX08c4I/pYr6pOMU?=
 =?iso-8859-1?Q?u7i2folgVSNqt874uEkb5zFW50M4HCzhju8tFt4cZEmhoZfa+MUeTRHXxD?=
 =?iso-8859-1?Q?Li5IYCTxCXMOf7gKDRQ7f5MsUJlGzVmLPbstiKNL+Ab0uZkq7XCsaN+C0r?=
 =?iso-8859-1?Q?DtFyi21DzIddbpERZmWrn5sdjqAdgd82f8B2Vuygj3jWWxZuVRXrDlP7dd?=
 =?iso-8859-1?Q?saaInMw9gyE8Z2b7IeLZ3CoYDXOKEWFJ9O6XZIjYeoeNSmyM2Ze0oAe1Q7?=
 =?iso-8859-1?Q?uFuv0DQut66V1k1OHDel1FPcyRtuovYsI+heA2HaETBI8qPIQsnhpnJ9LX?=
 =?iso-8859-1?Q?LYmBPWn2TOLY1yvdtTqaqV5bZyCMyetUE18jYtMdJ82eY2qRaKoizCRU5c?=
 =?iso-8859-1?Q?5EMSizl7d1UjT/a6z8uKvo+piDv/xn+TwcPHianZfwAIZF41OBGAcqiO7d?=
 =?iso-8859-1?Q?zp1dLh/ISsKpijTl0xwlayfIcqkccVm29RikA152sLRwYWcbjg6L9wTUqb?=
 =?iso-8859-1?Q?+NCJj7OKgN9cRwlpxIYQ3VFqsewFvq1Obt1B2Tfkmho+kocUC3FIqpvven?=
 =?iso-8859-1?Q?g/r0GF7G3hufcQnJnID/ahE73/mcG7T/hBRmyu1qlBfKdMFuuHwyMRjGUx?=
 =?iso-8859-1?Q?jWYDrcQx2WqSf7XSoxmxJ8AE0oufp5x5GKkdVP1Wc7XaaLaXPqNvMU/cNF?=
 =?iso-8859-1?Q?0nA7hvSWKOD0z3qw5rIYRcibAJBifM62H1izjSqX/bCGKqOnYwTo2o4rdr?=
 =?iso-8859-1?Q?rka56npJfk/tjRye4rD1kH3PsIWvoDly49x7nF1AG8hl2qXud8HUs/RQXe?=
 =?iso-8859-1?Q?4iUg30gmg+hLJ5UDMwnxa3Evn67n9UzvZ9tUeFCkb32Q2/aTrqDGbTyyaA?=
 =?iso-8859-1?Q?dXcAerk9qtDtN0jNROuBeCQOeUe8M6r6IMvPnBcXxJFFYI2t2cJFG1jEra?=
 =?iso-8859-1?Q?GBF85bY2H/nWI0IHxC6nAMBHMIp9BfYLhgPdjvfi8SebvVc71SiYCB4Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad391d94-9825-41e1-92b2-08ddf61e0d0c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 19:11:48.8266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeKfllr+242yNxean0XN2yuXTsnDpKwOg6jLoJOR/UDDSuwnMbvtb0DrWTFOSTY7hdOnTmUQjDzFiWxa9G3+4A14lTa75oU90l05K0XUVzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8541
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

--pwnu35ie5kqxosb3
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Sep 17, 2025 at 04:00:10PM +0300, Ilpo Järvinen wrote:
>On Tue, 16 Sep 2025, Lucas De Marchi wrote:
>
>> On Mon, Sep 15, 2025 at 08:24:06PM +0300, Ilpo Järvinen wrote:
>> > On Mon, 15 Sep 2025, Lucas De Marchi wrote:
>> >
>> > > On Mon, Sep 15, 2025 at 12:13:47PM +0300, Ilpo Järvinen wrote:
>> > > > pci.c has been used as catch everything that doesn't fits elsewhere
>> > > > within PCI core and thus resizable BAR code has been placed there as
>> > > > well. Move Resizable BAR related code to a newly introduced rebar.c to
>> > > > reduce size of pci.c. After move, there are no pci_rebar_*() calls from
>> > > > pci.c indicating this is indeed well-defined subset of PCI core.
>> > > >
>> > > > Endpoint drivers perform Resizable BAR related operations which could
>> > > > well be performed by PCI core to simplify driver-side code. This
>> > > > series adds a few new API functions to that effect and converts the
>> > > > drivers to use the new APIs (in separate patches).
>> > > >
>> > > > While at it, also convert BAR sizes bitmask to u64 as PCIe spec already
>> > > > specifies more sizes than what will fit u32 to make the API typing more
>> > > > future-proof. The extra sizes beyond 128TB are not added at this point.
>> > > >
>> > > > These are based on pci/main plus a simple "adapter" patch to add the
>> > > > include for xe_vram_types.h that was added by a commit in drm-tip.
>> > > > Hopefully that is enough to avoid the within context conflict with
>> > > > BAR_SIZE_SHIFT removal to let the xe CI tests to be run for this
>> > > > series.
>> > > >
>> > > > There are two minor conflicts with the work in pci/resource but I'm
>> > > > hesitant to base this on top of it as this is otherwise entirely
>> > > > independent (and would likely prevent GPU CI tests as well). If we end
>> > > > up having to pull the bridge window select changes, there should be no
>> > > > reason why this does have to become collateral damage (so my
>> > > > suggestion, if this is good to go in this cycle, to take this into a
>> > > > separate branch than pci/resource and deal with those small conflicts
>> > > > while merging into pci/next).
>> > > >
>> > > > I've tested sysfs resize, i915, and xe BAR resizing functionality. In
>> > > > the case of xe, I did small hack patch as its resize is anyway broken
>> > > > as is because BAR0 pins the bridge window so resizing BAR2 fails. My
>> > > > hack caused other problems further down the road (likely because BAR0
>> > > > is in use by the driver so releasing it messed assumptions xe driver
>> > > > has) but the BAR resize itself was working which was all I was
>> > >
>> > > is the hack you mention here to release all BARs before attempting the
>> > > resize?
>> >
>> > Yes, the patch added release of BAR0 prior to resize. The existing xe code
>> > in _resize_bar() already releases BAR2.
>> >
>> > During resize, if the first loop in pbus_reassign_bridge_resources()
>> > (called from pci_resize_resource()) finds the bridge window closest to the
>> > endpoint still has a child, it results in having empty saved list because
>> > all upstream bridge windows will then have a child as well.
>> >
>> > Empty saved list is checked after the loop and
>> > pbus_reassign_bridge_resources() returns -ENOENT without even trying to
>> > assign the resources. The error is returned even if the actual bridge
>> > window size is large enough to fit the resized resource.
>> >
>> > The logic in pci_resize_resource() and pbus_reassign_bridge_resources()
>> > need some other improvements besides that problem, but I likely won't
>> > have time to look at that until completing the fitting algorithm changes.
>> > I'd actually want to add pci_release_and_resize_resource() which would
>> > take care of releasing all the resources of the device (obviously driver
>> > must have its hands off all those BARs when it calls that function). With
>> > the current pci_resize_resource() API, handling the restore of BARs in
>> > case of failure is not as robust as I'd like to make it.
>> >
>> > > > interested to know. I'm not planning to pursue fixing the pinning
>> > > > problem within xe driver because the core changes to consider maximum
>> > > > size of the resizable BARs should take care of the main problem by
>> > > > different means.
>> > >
>> > > I'd actually like to pursue that myself as that could be propagated to
>> > > stable since we do have some resize errors in xe with BMG that I wasn't
>> > > understanding. It's likely due to xe_mmio_probe_early() taking a hold of
>> > > BAR0 and not expecting it to be moved. We could either remap if we have
>> > > have to resize or just move the resize logic early on.
>> >
>> > Great. If you have any questions when it comes to the PCI core side code,
>> > please let me know.
>>
>> I moved the resize to happen before anything else in xe. However when
>> testing I noticed a scenario failing without involving the driver.
>> With and without this series I still have the same pass/failure
>> scenarios:
>>
>> Tests executed with a BMG. Just after boot, BAR2 is 16GB.
>>
>> 1) If I resize it via sysfs to 8GB and then load the driver, it resizes
>> it back. Resize from sysfs works too. No change in behavior.
>
>It's expected that resizing smaller size -> back to the original works
>through sysfs because the upstream window pins won't prevent reacquiring
>the same or less space.
>
>But the way resize is called from current xe code, sizing even to a
>smaller size fails because BAR0 pins the closest upstream window,
>resulting in -ENOENT as explained above. I don't see fixing this on core
>side as priority because I plan to rework the resizing code anyway and
>resizing to a smaller size doesn't seem overly useful use case.

that was not what I saw: for me it works without any additional patch if
all that is needed is to go back to the previously acquired large space.

In  other words, this works for me today with no extra changes:

# echo 8 > /sys/bus/pci/devices/0000\:03\:00.0/resource2_resize
# lspci -v -s 03:00.0 | grep -i mem
         Memory at 83000000 (64-bit, non-prefetchable) [size=16M]
         Memory at 4000000000 (64-bit, prefetchable) [size=256M]

# modprobe xe

# lspci -v -s 03:00.0 | grep -i mem
         Memory at 83000000 (64-bit, non-prefetchable) [size=16M]
         Memory at 4000000000 (64-bit, prefetchable) [size=16G]

>
>> 2) If I do "remove the bridge via sysfs and rescan the bus"[1], it fails to
>> resize (either automatically, on rescan, via sysfs, or loading the xe
>> driver). It just stays at 256M.
>
>This is because the larger resource sizes are only calculated on the
>actual resize call which occurs after the bridge windows were already
>sized on rescan to the smaller size. At that point, the critical bridge
>windows are already pinned in place and thus cannot be relocated to free
>area I assume there would be somewhere within 4000000000-7fffffffff.
>
>> The only thing that brings it back is a reboot. /proc/iomem shows this:
>>
>> 4000000000-7fffffffff : PCI Bus 0000:00
>>   4000000000-44007fffff : PCI Bus 0000:01
>>     4000000000-4017ffffff : PCI Bus 0000:02
>>       4000000000-400fffffff : PCI Bus 0000:03    <<<< BMG
>>         4000000000-400fffffff : 0000:03:00.0
>
>>       4010000000-40100fffff : PCI Bus 0000:04
>
>This pins 0000:01:00.0's window in place. And also prevents enlarging the
>siblings.

oh. I see my mistake. I removed 0000:04:00.0, but then we still have the
PCI Bus, so it's still pinned. If I rather remove its parent, then it works
with your additional pci quirk:

# echo 0 > /sys/bus/pci/drivers_autoprobe
# echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/remove
# echo 1 > /sys/bus/pci/rescan
# # BAR2 is back to 256M as it couldn't resize to max
# lspci -v -s 03:00.0 | grep -i mem
         Memory at 83000000 (64-bit, non-prefetchable) [disabled] [size=16M]
         Memory at 4000000000 (64-bit, prefetchable) [disabled] [size=256M]

# echo 1 > /sys/bus/pci/devices/0000\:02\:02.0/remove

# # with my additional patch in xe (attached), but doing via sysfs also
# works
# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
# dmesg 
...
xe 0000:03:00.0: [drm] Attempting to resize bar from 256MiB -> 16384MiB
xe 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: releasing
xe 0000:03:00.0: BAR 2 [mem 0x4000000000-0x400fffffff 64bit pref]: releasing
pcieport 0000:02:01.0: bridge window [mem 0x4000000000-0x400fffffff 64bit pref]: releasing
pcieport 0000:01:00.0: bridge window [mem 0x4000000000-0x4017ffffff 64bit pref]: releasing
pcieport 0000:00:01.0: bridge window [mem 0x4000000000-0x44007fffff 64bit pref]: releasing
pcieport 0000:00:01.0: bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
pcieport 0000:01:00.0: bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
pcieport 0000:02:01.0: bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
xe 0000:03:00.0: BAR 2 [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
xe 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: assigned
pcieport 0000:00:01.0: PCI bridge to [bus 01-04]
pcieport 0000:00:01.0:   bridge window [io  0x8000-0x9fff]
pcieport 0000:00:01.0:   bridge window [mem 0x83000000-0x840fffff]
pcieport 0000:00:01.0:   bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]
pcieport 0000:01:00.0: PCI bridge to [bus 02-04]
pcieport 0000:01:00.0:   bridge window [io  0x8000-0x9fff]
pcieport 0000:01:00.0:   bridge window [mem 0x83000000-0x840fffff]
pcieport 0000:01:00.0:   bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]
pcieport 0000:02:01.0: PCI bridge to [bus 03]
pcieport 0000:02:01.0:   bridge window [io  0x8000-0x8fff]
pcieport 0000:02:01.0:   bridge window [mem 0x83000000-0x83ffffff]
pcieport 0000:02:01.0:   bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]
xe 0000:03:00.0: [drm] BAR2 resized to 16384M


>
>It would possible, though, to release it and still use sysfs to perform
>resize on 0000:03:00.0 as removing 0000:04:00.0 doesn't require removing
>0000:03:00.0. But...
>
>>     4018000000-40187fffff : 0000:01:00.0
>
>...This resource pins 0000:00:01.0's window in place. AFAIK, it cannot be
>released other than by removing 0000:01:00.0 which results in removing
>0000:03:00.0 as well, thus making it impossible to perform the BAR resize
>for 0000:03:00.0 through sysfs anymore. Catch-22.
>
>Could you test if the attached quirk patch helps. Maybe it could be
>considered as the interim solution until the bridge sizing logic becomes
>aware of the resizable BARs. To use a quirk to do this feels hacky to me,
>but then it's hard to point out any real downsides with that approach
>(other than having to quirk it).

it does help. Probably needs this in the commit message:

Link: https://lore.kernel.org/intel-xe/20250721173057.867829-1-uwu@icenowy.me/

and then possibly add the other PCI IDs for upstream ports as well.

>
>You'll still need to manually release 0000:04:00.0 but the BAR0 on the

As mentioned above, I needed to release its parent for that to work.

I have the xe patch on top of drm-tip as well as on top of this series
(attached). Conflicts are easy to solve, but I may split this patch to
avoid the conflicts to be able to merge it soon and propagate to stable.

>switch should be gone thanks to the quirk. When both of the window pins
>are gone, I think the resize through sysfs should work.
>
>> And dmesg shows this for the rescan:
>>
>> [ 1673.189737] pci 0000:01:00.0: [8086:e2ff] type 01 class 0x060400 PCIe
>> Switch Upstream Port
>> [ 1673.189794] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x007fffff 64bit pref]
>> [ 1673.189808] pci 0000:01:00.0: PCI bridge to [bus 00]
>> [ 1673.189824] pci 0000:01:00.0:   bridge window [io  0x0000-0x0fff]
>> [ 1673.189834] pci 0000:01:00.0:   bridge window [mem 0x00000000-0x000fffff]
>> [ 1673.189856] pci 0000:01:00.0:   bridge window [mem 0x00000000-0x000fffff
>> 64bit pref]
>> [ 1673.189878] pci 0000:01:00.0: Max Payload Size set to 256 (was 128, max
>> 256)
>> [ 1673.190164] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
>> [ 1673.193531] pci 0000:01:00.0: Adding to iommu group 16
>> [ 1673.196997] pcieport 0000:00:01.0: ASPM: current common clock configuration
>> is inconsistent, reconfiguring
>> [ 1673.197061] pci 0000:01:00.0: bridge configuration invalid ([bus 00-00]),
>> reconfiguring
>> [ 1673.197421] pci 0000:02:01.0: [8086:e2f0] type 01 class 0x060400 PCIe
>> Switch Downstream Port
>> [ 1673.197452] pci 0000:02:01.0: PCI bridge to [bus 00]
>> [ 1673.197463] pci 0000:02:01.0:   bridge window [io  0x0000-0x0fff]
>> [ 1673.197468] pci 0000:02:01.0:   bridge window [mem 0x00000000-0x000fffff]
>> [ 1673.197482] pci 0000:02:01.0:   bridge window [mem 0x00000000-0x000fffff
>> 64bit pref]
>> [ 1673.197497] pci 0000:02:01.0: Max Payload Size set to 256 (was 128, max
>> 256)
>> [ 1673.197503] pci 0000:02:01.0: enabling Extended Tags
>> [ 1673.197660] pci 0000:02:01.0: PME# supported from D0 D3hot D3cold
>> [ 1673.198411] pci 0000:02:01.0: Adding to iommu group 17
>> [ 1673.200258] pci 0000:02:02.0: [8086:e2f1] type 01 class 0x060400 PCIe
>> Switch Downstream Port
>> [ 1673.200289] pci 0000:02:02.0: PCI bridge to [bus 00]
>> [ 1673.200299] pci 0000:02:02.0:   bridge window [io  0x0000-0x0fff]
>> [ 1673.200304] pci 0000:02:02.0:   bridge window [mem 0x00000000-0x000fffff]
>> [ 1673.200317] pci 0000:02:02.0:   bridge window [mem 0x00000000-0x000fffff
>> 64bit pref]
>> [ 1673.200333] pci 0000:02:02.0: Max Payload Size set to 256 (was 128, max
>> 256)
>> [ 1673.200337] pci 0000:02:02.0: enabling Extended Tags
>> [ 1673.200470] pci 0000:02:02.0: PME# supported from D0 D3hot D3cold
>> [ 1673.201059] pci 0000:02:02.0: Adding to iommu group 18
>> [ 1673.202761] pci 0000:01:00.0: PCI bridge to [bus 02-04]
>> [ 1673.202774] pci 0000:02:01.0: bridge configuration invalid ([bus 00-00]),
>> reconfiguring
>> [ 1673.202782] pci 0000:02:02.0: bridge configuration invalid ([bus 00-00]),
>> reconfiguring
>> [ 1673.203024] pci 0000:03:00.0: [8086:e221] type 00 class 0x030000 PCIe
>> Endpoint
>> [ 1673.203060] pci 0000:03:00.0: BAR 0 [mem 0x00000000-0x00ffffff 64bit]
>> [ 1673.203064] pci 0000:03:00.0: BAR 2 [mem 0x00000000-0x0fffffff 64bit pref]
>> [ 1673.203069] pci 0000:03:00.0: ROM [mem 0x00000000-0x001fffff pref]
>> [ 1673.203077] pci 0000:03:00.0: Max Payload Size set to 256 (was 128, max
>> 256)
>> [ 1673.203209] pci 0000:03:00.0: PME# supported from D0 D3hot
>> [ 1673.203770] pci 0000:03:00.0: Adding to iommu group 19
>> [ 1673.205451] pci 0000:03:00.0: vgaarb: setting as boot VGA device
>> [ 1673.205454] pci 0000:03:00.0: vgaarb: bridge control possible
>> [ 1673.205455] pci 0000:03:00.0: vgaarb: VGA device added:
>> decodes=io+mem,owns=none,locks=none
>> [ 1673.205534] pci 0000:02:01.0: PCI bridge to [bus 03-04]
>> [ 1673.205543] pci_bus 0000:03: busn_res: [bus 03-04] end is updated to 03
>> [ 1673.205787] pci 0000:04:00.0: [8086:e2f7] type 00 class 0x040300 PCIe
>> Endpoint
>> [ 1673.205848] pci 0000:04:00.0: BAR 0 [mem 0x00000000-0x00003fff 64bit]
>> [ 1673.205867] pci 0000:04:00.0: Max Payload Size set to 256 (was 128, max
>> 256)
>> [ 1673.205872] pci 0000:04:00.0: enabling Extended Tags
>> [ 1673.206012] pci 0000:04:00.0: PME# supported from D3hot D3cold
>> [ 1673.206528] pci 0000:04:00.0: Adding to iommu group 20
>> [ 1673.208271] pci 0000:02:02.0: PCI bridge to [bus 04]
>> [ 1673.208284] pci_bus 0000:04: busn_res: [bus 04] end is updated to 04
>> [ 1673.208291] pci_bus 0000:02: busn_res: [bus 02-04] end is updated to 04
>> [ 1673.232003] pcieport 0000:00:01.0: Assigned bridge window [mem
>> 0x83000000-0x840fffff] to [bus 01-04] cannot fit 0x2000000 required for
>> 0000:02:01.0 bridging to [bus 03]
>> [ 1673.232009] pci 0000:02:01.0: bridge window [mem 0x00000000-0x000fffff] to
>> [bus 03] requires relaxed alignment rules
>> [ 1673.232016] pci 0000:02:01.0: bridge window [mem 0x01000000-0x01ffffff] to
>> [bus 03] add_size 200000 add_align 1000000
>> [ 1673.232020] pcieport 0000:00:01.0: Assigned bridge window [mem
>> 0x83000000-0x840fffff] to [bus 01-04] cannot fit 0x1800000 required for
>> 0000:01:00.0 bridging to [bus 02-04]
>> [ 1673.232025] pci 0000:01:00.0: bridge window [mem 0x00000000-0x000fffff] to
>> [bus 02-04] requires relaxed alignment rules
>> [ 1673.232027] pcieport 0000:00:01.0: Assigned bridge window [mem
>> 0x83000000-0x840fffff] to [bus 01-04] cannot fit 0x2000000 required for
>> 0000:01:00.0 bridging to [bus 02-04]
>> [ 1673.232031] pci 0000:01:00.0: bridge window [mem 0x00000000-0x000fffff] to
>> [bus 02-04] requires relaxed alignment rules
>> [ 1673.232036] pci 0000:01:00.0: bridge window [mem 0x01000000-0x020fffff] to
>> [bus 02-04] add_size 200000 add_align 1000000
>> [ 1673.232077] pci 0000:01:00.0: bridge window [mem 0x4000000000-0x4017ffffff
>> 64bit pref]: assigned
>> [ 1673.232080] pci 0000:01:00.0: bridge window [mem size 0x01300000]: can't
>> assign; no space
>> [ 1673.232082] pci 0000:01:00.0: bridge window [mem size 0x01300000]: failed
>> to assign
>> [ 1673.232090] pci 0000:01:00.0: BAR 0 [mem 0x4018000000-0x40187fffff 64bit
>> pref]: assigned
>> [ 1673.232103] pci 0000:01:00.0: bridge window [io  0x8000-0x9fff]: assigned
>> [ 1673.232129] pci 0000:01:00.0: bridge window [mem 0x83000000-0x840fffff]:
>> assigned
>> [ 1673.232131] pci 0000:01:00.0: bridge window [mem 0x83000000-0x840fffff]:
>> failed to expand by 0x200000
>> [ 1673.232136] pci 0000:01:00.0: bridge window [mem 0x83000000-0x840fffff]:
>> failed to add optional 200000
>> [ 1673.232192] pci 0000:02:01.0: bridge window [mem 0x4000000000-0x400fffffff
>> 64bit pref]: assigned
>> [ 1673.232196] pci 0000:02:01.0: bridge window [mem 0x83000000-0x83ffffff]:
>> assigned
>> [ 1673.232200] pci 0000:02:02.0: bridge window [mem 0x84000000-0x840fffff]:
>> assigned
>> [ 1673.232202] pci 0000:02:02.0: bridge window [mem 0x4010000000-0x40100fffff
>> 64bit pref]: assigned
>> [ 1673.232204] pci 0000:02:01.0: bridge window [io  0x8000-0x8fff]: assigned
>> [ 1673.232206] pci 0000:02:02.0: bridge window [io  0x9000-0x9fff]: assigned
>> [ 1673.232241] pci 0000:03:00.0: BAR 2 [mem 0x4000000000-0x400fffffff 64bit
>> pref]: assigned
>> [ 1673.232250] pci 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]:
>> assigned
>> [ 1673.232259] pci 0000:03:00.0: ROM [mem size 0x00200000 pref]: can't assign;
>> no space
>> [ 1673.232261] pci 0000:03:00.0: ROM [mem size 0x00200000 pref]: failed to
>> assign
>> [ 1673.232272] pci 0000:03:00.0: BAR 2 [mem 0x4000000000-0x400fffffff 64bit
>> pref]: assigned
>> [ 1673.232280] pci 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]:
>> assigned
>> [ 1673.232289] pci 0000:03:00.0: ROM [mem size 0x00200000 pref]: can't assign;
>> no space
>> [ 1673.232291] pci 0000:03:00.0: ROM [mem size 0x00200000 pref]: failed to
>> assign
>> [ 1673.232302] pci 0000:02:01.0: PCI bridge to [bus 03]
>> [ 1673.232304] pci 0000:02:01.0:   bridge window [io  0x8000-0x8fff]
>> [ 1673.232309] pci 0000:02:01.0:   bridge window [mem 0x83000000-0x83ffffff]
>> [ 1673.232313] pci 0000:02:01.0:   bridge window [mem
>> 0x4000000000-0x400fffffff 64bit pref]
>> [ 1673.232321] pci 0000:04:00.0: BAR 0 [mem 0x84000000-0x84003fff 64bit]:
>> assigned
>> [ 1673.232336] pci 0000:02:02.0: PCI bridge to [bus 04]
>> [ 1673.232339] pci 0000:02:02.0:   bridge window [io  0x9000-0x9fff]
>> [ 1673.232345] pci 0000:02:02.0:   bridge window [mem 0x84000000-0x840fffff]
>> [ 1673.232349] pci 0000:02:02.0:   bridge window [mem
>> 0x4010000000-0x40100fffff 64bit pref]
>> [ 1673.232356] pci 0000:01:00.0: PCI bridge to [bus 02-04]
>> [ 1673.232359] pci 0000:01:00.0:   bridge window [io  0x8000-0x9fff]
>> [ 1673.232363] pci 0000:01:00.0:   bridge window [mem 0x83000000-0x840fffff]
>> [ 1673.232366] pci 0000:01:00.0:   bridge window [mem
>> 0x4000000000-0x4017ffffff 64bit pref]
>> [ 1673.232471] pcieport 0000:01:00.0: enabling device (0000 -> 0003)
>> [ 1673.233508] pcieport 0000:02:01.0: enabling device (0000 -> 0003)
>> [ 1673.233692] pcieport 0000:02:02.0: enabling device (0000 -> 0003)
>>
>> # echo 9 > /sys/bus/pci/devices/0000\:03\:00.0/resource2_resize -bash: echo:
>> write error: No space left on device
>>
>>
>> [1] # echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/remove
>>     # echo 0 > /sys/bus/pci/drivers_autoprobe
>>     # echo 1 > /sys/bus/pci/rescan
>>
>>
>> I can share the xe patch so you check if it at least fixes it in your
>> test scenario.
>
>Ah, one thing I didn't remember mention is that in my case the BAR is
>already at its maximum size, so to test the resize is working, I made
>the target size smaller, not larger. (I understand this might not be very
>helpful in your case but I was only interested that resize code still
>works after this series).
>
>-- 
> i.

>From 948a49f01df54b3435861138a0eae85bb2c3f1f3 Mon Sep 17 00:00:00 2001
>From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
>Date: Wed, 17 Sep 2025 15:24:53 +0300
>Subject: [PATCH 1/1] PCI: Release BAR0 of an integrated bridge to allow GPU
> BAR resize
>MIME-Version: 1.0
>Content-Type: text/plain; charset=UTF-8
>Content-Transfer-Encoding: 8bit
>
>Resizing BAR to a larger size has to release upstream bridge windows in
>order make the bridge windows larger as well (and to potential relocate
>them into a larger free block within iomem space). Some GPUs have an
>integrated PCI switch that has BAR0. The resource allocation assigns
>space for that BAR0 as it does for any resource.
>
>An extra resource on a bridge will pin its upstream bridge window in
>place which prevents BAR resize for anything beneath that bridge.
>
>Nothing in the pcieport driver provided by PCI core, which typically is
>the driver bound to these bridges, requires that BAR0. Because of that,
>releasing the extra BAR does not seem to have notable downsides but
>comes with a clear upside.
>
>Therefore, release BAR0 of such switches using a quirk and clear its
>flags to prevent any new invocation of the resource assignment
>algorithm from assigning the resource again.
>
>Due to other siblings within the PCI hierarchy of all the devices
>integrated into the GPU, some other devices may still have to be
>manually removed before the resize is free of any bridge window pins.
>Such siblings can be released through sysfs to unpin windows while
>leaving access to GPU's sysfs entries required for initiating the
>resize operation, whereas removing the topmost bridge this quirk
>targets would result in removing the GPU device as well so no manual
>workaround for this problem exists.
>
>Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Link: https://lore.kernel.org/linux-pci/fl6tx5ztvttg7txmz2ps7oyd745wg3lwcp3h7esmvnyg26n44y@owo2ojiu2mov/
>Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>---
>
>This feels quite hacky to me and I'm working towards a better solution
>which is to consider Resizable BAR maximum size the resource fitting
>algorithm. But then, I don't expect the better solution to be something
>we want to push into stable due to extremely invasive dependencies. So
>maybe consider this an interim/legacy solution to the resizing problem
>and remove it once the algorithmic approach works (or more precisely
>retain it only in the old kernel versions).
>---
> drivers/pci/quirks.c | 20 ++++++++++++++++++++
> 1 file changed, 20 insertions(+)
>
>diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>index d97335a40193..98a4f0a1285b 100644
>--- a/drivers/pci/quirks.c
>+++ b/drivers/pci/quirks.c
>@@ -6338,3 +6338,23 @@ static void pci_mask_replay_timer_timeout(struct pci_dev *pdev)
> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9750, pci_mask_replay_timer_timeout);
> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9755, pci_mask_replay_timer_timeout);
> #endif
>+
>+/*
>+ * PCI switches integrated into some GPUs have BAR0 that prevents resizing
>+ * the BARs of the GPU device due to that bridge BAR0 pinning the bridge
>+ * window it's under in place. Nothing in pcieport requires that BAR0.
>+ *
>+ * Release and disable BAR0 permanently by clearing its flags to prevent
>+ * anything from assigning it again.
>+ */
>+static void pci_release_bar0(struct pci_dev *pdev)
>+{
>+	struct resource *res = pci_resource_n(pdev, 0);
>+
>+	if (!res->parent)
>+		return;
>+
>+	pci_release_resource(pdev, 0);
>+	res->flags = 0;
>+}
>+DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, 0xe2ff, pci_release_bar0);
>
>base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
>-- 
>2.39.5
>


--pwnu35ie5kqxosb3
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: attachment;
	filename="0001-drm-xe-Move-rebar-support.patch"
Content-Transfer-Encoding: 8bit

From 353ab1ff93a483154273cd2ded85e5f2190bcedb Mon Sep 17 00:00:00 2001
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Mon, 15 Sep 2025 14:36:28 -0700
Subject: [PATCH] drm/xe: Move rebar support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Create a xe_pci_rebar.c to contain the logic about resizing the lmembar.
Trying to do a resize later inside xe_vram is way too late. At that time
the BAR0 will already be mapped for register access and the driver would
need to remap to continue working.

All the rebar logic is more pci-specific than xe-specific and can be
done very early in the probe sequence, resulting in messages like below,

	[] xe 0000:03:00.0: vgaarb: deactivate vga console
	[] xe 0000:03:00.0: [drm] Attempting to resize bar from 8192MiB -> 16384MiB
	[] xe 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: releasing
	[] xe 0000:03:00.0: BAR 2 [mem 0x4000000000-0x41ffffffff 64bit pref]: releasing
	[] pcieport 0000:02:01.0: bridge window [mem 0x4000000000-0x41ffffffff 64bit pref]: releasing
	[] pcieport 0000:01:00.0: bridge window [mem 0x4000000000-0x41ffffffff 64bit pref]: releasing
	[] pcieport 0000:01:00.0: bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
	[] pcieport 0000:02:01.0: bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
	[] xe 0000:03:00.0: BAR 2 [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
	[] xe 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: assigned
	[] pcieport 0000:00:01.0: PCI bridge to [bus 01-04]
	[] pcieport 0000:00:01.0:   bridge window [mem 0x83000000-0x840fffff]
	[] pcieport 0000:00:01.0:   bridge window [mem 0x4000000000-0x44007fffff 64bit pref]
	[] pcieport 0000:01:00.0: PCI bridge to [bus 02-04]
	[] pcieport 0000:01:00.0:   bridge window [mem 0x83000000-0x840fffff]
	[] pcieport 0000:01:00.0:   bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]
	[] pcieport 0000:02:01.0: PCI bridge to [bus 03]
	[] pcieport 0000:02:01.0:   bridge window [mem 0x83000000-0x83ffffff]
	[] pcieport 0000:02:01.0:   bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]
	[] xe 0000:03:00.0: [drm] BAR2 resized to 16384M
	[] xe 0000:03:00.0: [drm:xe_pci_probe [xe]] BATTLEMAGE  e221:0000 dgfx:1 gfx:Xe2_HPG (20.02) ...

As shown above, it happens even before we try to read any register for
platform identification. With that move, the BAR0 won't be in use by the
driver and it can be released prior to the resize, avoiding the
shortcomings of how pbus_reassign_bridge_resources() handles that case.
Improving pbus_reassign_bridge_resources() is something to be done, but
it wouldn't be able to fix this case since xe was already using BAR0.

Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: <stable@vger.kernel.org> # 6.12+
Link: https://lore.kernel.org/intel-xe/fafda2a3-fc63-ce97-d22b-803f771a4d19@linux.intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

---

Tested with some BAR resizes prior to loading xe and also with a SBR
which makes the BMG's BAR2 to come back as 256M when rescanning the bus
---
 drivers/gpu/drm/xe/Makefile       |   1 +
 drivers/gpu/drm/xe/xe_pci.c       |   3 +
 drivers/gpu/drm/xe/xe_pci_rebar.c | 123 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_rebar.h |  13 ++++
 drivers/gpu/drm/xe/xe_vram.c      |  98 +-----------------------
 5 files changed, 141 insertions(+), 97 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_rebar.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_rebar.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7a065c98a3b85..5a66d7a53d0db 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -95,6 +95,7 @@ xe-y += xe_bb.o \
 	xe_observation.o \
 	xe_pat.o \
 	xe_pci.o \
+	xe_pci_rebar.o \
 	xe_pcode.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 701ba9baa9d7e..6cc5e7b6901a8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -27,6 +27,7 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_pci_rebar.h"
 #include "xe_pci_sriov.h"
 #include "xe_pci_types.h"
 #include "xe_pm.h"
@@ -866,6 +867,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
+	xe_pci_rebar(xe);
+
 	err = xe_device_probe_early(xe);
 	/*
 	 * In Boot Survivability mode, no drm card is exposed and driver
diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.c b/drivers/gpu/drm/xe/xe_pci_rebar.c
new file mode 100644
index 0000000000000..3487845596d88
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_rebar.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_pci_rebar.h"
+
+#include <linux/pci.h>
+#include <linux/types.h>
+
+#include <drm/drm_print.h>
+
+#include "regs/xe_bars.h"
+#include "xe_device_types.h"
+#include "xe_module.h"
+
+#define BAR_SIZE_SHIFT 20
+
+static void release_bars(struct pci_dev *pdev)
+{
+	int resno;
+
+	for (resno = PCI_STD_RESOURCES; resno < PCI_STD_RESOURCE_END; resno++) {
+		if (pci_resource_len(pdev, resno))
+			pci_release_resource(pdev, resno);
+	}
+}
+
+static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int bar_size = pci_rebar_bytes_to_size(size);
+	int ret;
+
+	release_bars(pdev);
+
+	ret = pci_resize_resource(pdev, resno, bar_size);
+	if (ret) {
+		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
+			 resno, 1 << bar_size, ERR_PTR(ret));
+		return;
+	}
+
+	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
+}
+
+void xe_pci_rebar(struct xe_device *xe)
+{
+	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct pci_bus *root = pdev->bus;
+	resource_size_t current_size;
+	resource_size_t rebar_size;
+	struct resource *root_res;
+	int max_size, i;
+	u32 pci_cmd;
+
+	/* gather some relevant info */
+	current_size = pci_resource_len(pdev, LMEM_BAR);
+
+	/*
+	 * Handle force_vram_bar_size:
+	 * - negative: resize is disabled
+	 * - 0: try to resize to maximum possible
+	 * - positive: resize to specific value
+	 */
+
+	if (force_vram_bar_size < 0)
+		return;
+
+	/* set to a specific size? */
+	if (force_vram_bar_size) {
+		rebar_size = pci_rebar_bytes_to_size(force_vram_bar_size *
+						     (resource_size_t)SZ_1M);
+
+		if (!pci_rebar_size_supported(pdev, LMEM_BAR, rebar_size)) {
+			drm_info(&xe->drm,
+				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%llx. Leaving default: %lluMiB\n",
+				 (u64)pci_rebar_size_to_bytes(rebar_size) >> 20,
+				 pci_rebar_get_possible_sizes(pdev, LMEM_BAR),
+				 (u64)current_size >> 20);
+			return;
+		}
+
+		rebar_size = pci_rebar_size_to_bytes(rebar_size);
+		if (rebar_size == current_size)
+			return;
+	} else {
+		max_size = pci_rebar_get_max_size(pdev, LMEM_BAR);
+		if (max_size < 0)
+			return;
+		rebar_size = pci_rebar_size_to_bytes(max_size);
+
+		/* only resize if larger than current */
+		if (rebar_size <= current_size)
+			return;
+	}
+
+	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
+		 (u64)current_size >> 20, (u64)rebar_size >> 20);
+
+	while (root->parent)
+		root = root->parent;
+
+	pci_bus_for_each_resource(root, root_res, i) {
+		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
+		    (u64)root_res->start > 0x100000000ul)
+			break;
+	}
+
+	if (!root_res) {
+		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
+		return;
+	}
+
+	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
+	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
+
+	resize_bar(xe, LMEM_BAR, rebar_size);
+
+	pci_assign_unassigned_bus_resources(pdev->bus);
+	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
+}
diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.h b/drivers/gpu/drm/xe/xe_pci_rebar.h
new file mode 100644
index 0000000000000..c87aa58aee718
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_rebar.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_PCI_REBAR_H_
+#define _XE_PCI_REBAR_H_
+
+struct xe_device;
+
+void xe_pci_rebar(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index f182326688106..989cf705f1b17 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -24,101 +24,6 @@
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
-static void
-_resize_bar(struct xe_device *xe, int resno, resource_size_t size)
-{
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	int bar_size = pci_rebar_bytes_to_size(size);
-	int ret;
-
-	if (pci_resource_len(pdev, resno))
-		pci_release_resource(pdev, resno);
-
-	ret = pci_resize_resource(pdev, resno, bar_size);
-	if (ret) {
-		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
-			 resno, 1 << bar_size, ERR_PTR(ret));
-		return;
-	}
-
-	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
-}
-
-/*
- * if force_vram_bar_size is set, attempt to set to the requested size
- * else set to maximum possible size
- */
-static void resize_vram_bar(struct xe_device *xe)
-{
-	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	struct pci_bus *root = pdev->bus;
-	resource_size_t current_size;
-	resource_size_t rebar_size;
-	struct resource *root_res;
-	int max_size, i;
-	u32 pci_cmd;
-
-	/* gather some relevant info */
-	current_size = pci_resource_len(pdev, LMEM_BAR);
-
-	if (force_vram_bar_size < 0)
-		return;
-
-	/* set to a specific size? */
-	if (force_vram_bar_size) {
-		rebar_size = pci_rebar_bytes_to_size(force_vram_bar_size *
-						     (resource_size_t)SZ_1M);
-
-		if (!pci_rebar_size_supported(pdev, LMEM_BAR, rebar_size)) {
-			drm_info(&xe->drm,
-				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%llx. Leaving default: %lluMiB\n",
-				 (u64)pci_rebar_size_to_bytes(rebar_size) >> 20,
-				 pci_rebar_get_possible_sizes(pdev, LMEM_BAR),
-				 (u64)current_size >> 20);
-			return;
-		}
-
-		rebar_size = pci_rebar_size_to_bytes(rebar_size);
-		if (rebar_size == current_size)
-			return;
-	} else {
-		max_size = pci_rebar_get_max_size(pdev, LMEM_BAR);
-		if (max_size < 0)
-			return;
-		rebar_size = pci_rebar_size_to_bytes(max_size);
-
-		/* only resize if larger than current */
-		if (rebar_size <= current_size)
-			return;
-	}
-
-	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
-		 (u64)current_size >> 20, (u64)rebar_size >> 20);
-
-	while (root->parent)
-		root = root->parent;
-
-	pci_bus_for_each_resource(root, root_res, i) {
-		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
-		    (u64)root_res->start > 0x100000000ul)
-			break;
-	}
-
-	if (!root_res) {
-		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
-		return;
-	}
-
-	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
-	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
-
-	_resize_bar(xe, LMEM_BAR, rebar_size);
-
-	pci_assign_unassigned_bus_resources(pdev->bus);
-	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
-}
-
 static bool resource_is_valid(struct pci_dev *pdev, int bar)
 {
 	if (!pci_resource_flags(pdev, bar))
@@ -142,8 +47,6 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
 		return -ENXIO;
 	}
 
-	resize_vram_bar(xe);
-
 	lmem_bar->io_start = pci_resource_start(pdev, LMEM_BAR);
 	lmem_bar->io_size = pci_resource_len(pdev, LMEM_BAR);
 	if (!lmem_bar->io_size)
@@ -366,6 +269,7 @@ int xe_vram_probe(struct xe_device *xe)
 	err = determine_lmem_bar_size(xe, &lmem_bar);
 	if (err)
 		return err;
+
 	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
 
 	remain_io_size = lmem_bar.io_size;
-- 
2.50.1


--pwnu35ie5kqxosb3--
