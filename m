Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF89BC9C0BF
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 16:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C8D10E682;
	Tue,  2 Dec 2025 15:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U99TrAV5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BAA10E67F;
 Tue,  2 Dec 2025 15:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764691041; x=1796227041;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5YRT3fekqoGe18AV5UMq3lUr9rmSdoDUVsB150I1uSs=;
 b=U99TrAV5BDMSS836RmekiJETQwFKRQjMUhjzUhpi9R+SGyCCO8CrjUUK
 U9Xp5/HjKCfgfdbmlnwnpQ2hqb0RGiYNNbxtVT7fc8xGWXD0RztksrWu+
 d7hg/lXZjURirRN5DSEPWdT8VZ7A1DLlUPVUL6YbqmDauXkFHBkymbck3
 404FIu4OjkgNacHNKvs+p+BV6x/gAUr6H0Tfiwv0YOHsV9e6bMRiZ2BDq
 Xg42AFBNSVx0KlR107j94XZqSwPOpdj/h+2Ub3FMBw04Y1wsdfEz6Rqs2
 Bgzv5Q6WGGaimoHEVpSWs0/jByo5HWy+Rt80fbA2ZAuNIyzJOq4i19c+5 w==;
X-CSE-ConnectionGUID: F6FXscVdS723Xpi+GYgdIQ==
X-CSE-MsgGUID: YjX5RErtRt+dOqvRc8XQ5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="78127580"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="78127580"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:57:20 -0800
X-CSE-ConnectionGUID: zPzsmbj9Q/O3q1nWR57IXg==
X-CSE-MsgGUID: KAwYbFklS5CodFmePWyPDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198874129"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:57:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 07:57:19 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 07:57:19 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 07:57:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j19H58Cr2YNVbL/CgDzlKtnChamggoSidsniM7nHGzRE9uo5PHA7KHVGBE9RcduIYpAK+bRhoHrUUTvwf1KV2AWXQTLUspKCaW0H2nBhQNWNmCyDz3UNUyT66icnYFCqfKGXTBVIIn3IiDIRM3lb5i1X9DOCM23kt5H6YD9awUvzs2tDbcqWNVE9WSKdyRIUktMeuUdKrPp+jY0j6rF1Bn4Z/uIG9BfyvU70B4ctbXlBTMl/E3aTOL+JspsuT3/ZtXbfhVvgF6W6HMkeXfyEwVAusNDg7FYcrYA11SQrkunyDcpklLZkW72rvKRfq9u2u0dDPDkgC6JSsi3PtpVhjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pq5HZMcEjDSPrAx7tZc7w84giFC+ZxGM0FCEm46O8tY=;
 b=I4myv3atUetV7Bo3cR5Qk0ChAoiKLiORL4x+QSN7I7uTpY1B9HTz4JmcMOF/vCl0WghXbw3Dk5+WJtBJl4wu6dGj5zQmjiOeuTDjU3DBMAe5z5MjCz+NF0u4a/TFNmun3P8aMLHXU4t9pvj6GCV8I2WtbLeZX9rSvyJbfh6iLWEaWzPNp+pM2Qkh4be7yLRd7HBGO1ciHSvfzq19ydxIuO9jWMHY5VWuIMUyijG9Sufocbf67gLssfzI+L92COcC7TJYxFg3ZX0Vcyn2E5XgGJiUP3tteFe3PQMjqICzoXcpmKCw3YMUPLOB1t/n5mwzcOVG1qtqKYmLx2TYLfg5SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5125.namprd11.prod.outlook.com (2603:10b6:510:3e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 15:57:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 15:57:17 +0000
Date: Tue, 2 Dec 2025 07:57:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/8] drm/xe: Use dma_fence_check_and_signal_locked()
Message-ID: <aS8MWTnmjmEkn6YG@lstrano-desk.jf.intel.com>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-6-phasta@kernel.org>
 <aS3uycB40j2CptOf@lstrano-desk.jf.intel.com>
 <e2799662727a10b77b77ceb2fc2cdabe27537e3e.camel@mailbox.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2799662727a10b77b77ceb2fc2cdabe27537e3e.camel@mailbox.org>
X-ClientProxiedBy: MW4PR04CA0306.namprd04.prod.outlook.com
 (2603:10b6:303:82::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: 58e8bf43-d6e3-4cdf-23c4-08de31bb77ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3ZtEG/s+roN1BAsQGKCYKAUPrDDA2ND+/LxLp9fcKZa3cdIg9h0DLL399J?=
 =?iso-8859-1?Q?e6dxg75l3X4gZn3UG6HyiklyiC+W/ykxNe5rnGY5SBWxm3FAZBg9dh6GeI?=
 =?iso-8859-1?Q?6hBGdHlW3xPBktPRVFTF/Oe89VqTkYx4LFVQ6ey7/nqFXTFAAim9G4VOHY?=
 =?iso-8859-1?Q?2Kq/TtTKyoacKlpDk7DUu30lAA5KQE5A/5CIKkUmEwoyTIdT85a6ZFsM6Q?=
 =?iso-8859-1?Q?wsK42JBjXGS635yMtXb4HBqaFsstLLGqfci5fMbuwkiey8ItBAzI51+otx?=
 =?iso-8859-1?Q?WxHoyqQ/DLgkdFFIw38DZpRQYBDfGA6jj6gJGE2ckbiQiSVSTJENOcIVSu?=
 =?iso-8859-1?Q?tF9ikNCWt37xAqRs9rlDxh6ogpp+RlNnPlkf0S5Ys39VscqeGTR3WoCaWr?=
 =?iso-8859-1?Q?KmYhwpa4Crc+y2DtAi39Dnok/yaI+DiXzaEtPKlqJ1UeW/XqNCobTX41LT?=
 =?iso-8859-1?Q?YouihqGNygRvjhIYEastl+IoKlH9G7GulBNyU/YY8XSu42OE7UBUZQsZzQ?=
 =?iso-8859-1?Q?cO8uuw7l2qv+ikTAzdtL4Su6CYgqeF/3iLuHmBStmlmUtZRdNIDQAVtyOK?=
 =?iso-8859-1?Q?xs7RLEKIjLIiyRHiaTJJohSaCRiypsjNo7dI6mCYHlwNJABKykQDW27Yh4?=
 =?iso-8859-1?Q?wGpxUKaZaPVTNN3E6PNTxafPiFaVPGxnQv20hWDEpBJb3hHu5ITrFfiyF9?=
 =?iso-8859-1?Q?iwAY4tdaqWSfL72rrhw1ElpRFZkHkhvQHsz+6xz8IkDWBOHfUq5ncrtRGU?=
 =?iso-8859-1?Q?Ed/IeF7N8AJw0sS+Khg1vOAbz/UGlJTWq4KF/BM/TYEYBGTLxvcSDe8QVI?=
 =?iso-8859-1?Q?jVhDYK5dKp/U7VBHQCBR/0bRZbBmCl00qmZDGBHq6QbCDy/sdjY9XgX6Tg?=
 =?iso-8859-1?Q?+Si5bORhWxsZfHn/On6HLKnG1ohfHaE6Do0p2ytQ+r1flDh+QLb5vh6+N5?=
 =?iso-8859-1?Q?SHqNNrx+xEJJrjDWmt5jY/Lda8lcZF7jh21jCtykUHxcg8XtotSGD+W/To?=
 =?iso-8859-1?Q?u6Bzc8YH/uvNE/75VgMJsxBxpWXLqKzD85bwTsTM3D53fjTzStotN6b3tI?=
 =?iso-8859-1?Q?VUW+s3BaZpYus/qF2AsKPYBD61zaIaChyAN/+sNfD0kHgd+uE1SDoW3xLS?=
 =?iso-8859-1?Q?r925ya3hgxQVmRsSf+DLB/CS8MW4fReKig2avFK0+F8sOYPs/kk/sVvXN/?=
 =?iso-8859-1?Q?akGNN7QVbXgW/M2FSS+3AiIps9PqH9QFwghquCxWQkgXcyxz6y9Id3g6sp?=
 =?iso-8859-1?Q?wnYxoesjSFUncOEVSx4hI0gqmbOo78miVIeBfB/x+AQVijd+ls8JamFT8n?=
 =?iso-8859-1?Q?Vwh7f8DXBLu/s31zV6b5johWBA5g7U4Sd/Nu3vbrCZJCvrE6bsavaIYtcP?=
 =?iso-8859-1?Q?EYwaNQWw/hRrzlRjERtT/70RTd8X/sdtf2KckLh7ySqcy0aj3J3hpLGFKk?=
 =?iso-8859-1?Q?xqI58tLT4ti3UCPb4g74BH196jK+gr2Hw+o7V3wU72DIIGnpKGexVCXSPz?=
 =?iso-8859-1?Q?FzwgpsjALcOCpRAKlmp8B/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ao/MHtlHo78BYM3lOJy67+8eYReg5PwPAJTxUf1b3yC8vRS/XY1TghX12e?=
 =?iso-8859-1?Q?q/neWH+jUe5wKDRQcWAsjTgnx2wz+wCSIjv7fdlFBfEatHTQ4Be+nv3b6Y?=
 =?iso-8859-1?Q?qECP84STZj2nXRVInkc/3yD2OOyWPyl+Cu+BTeLyfXd51Aku1ZgcmhWSiJ?=
 =?iso-8859-1?Q?hBulQlvms30+sMX87ED2rvxsnGLGbm5PqhgDeBRHBrFF4a3+lSj4YC7Adz?=
 =?iso-8859-1?Q?EOAKfILUCTgPcZn/AwI8TTnR0BB1MAG4gC6zo25MapubrorG1MEgfMbBTY?=
 =?iso-8859-1?Q?r1fcsu3uPcb8Gs0AKpuHO6FCYkvKusImZCCXNjtVbHpzksTSjHwPdzcGbE?=
 =?iso-8859-1?Q?qIyRdnzajeSVq0qHXMlt64/aboCZCto0g5inPSKJMmO5AbSoJpjvQxx7wT?=
 =?iso-8859-1?Q?/tbp1N0lVlgh0joYmrokmKpuJ687DJyQVy7bx1svFfHT9kb2kgHF1DBCjZ?=
 =?iso-8859-1?Q?upU6BjxEHRmnnjhT1cTRR7tlpRvjdKFfwDrDHMxsGlqgNPXPz1mYmyJWZs?=
 =?iso-8859-1?Q?bzFZbjVO6scRiJ369/5fYQcj7E5FI3XHsYboSLIsJpzfo4NBQenZLv12c2?=
 =?iso-8859-1?Q?c+IYiOS/IwY3lTf6CiKqw+C3859DeFg0IBpvqLlcbSzEnywGKrjvGVb6VE?=
 =?iso-8859-1?Q?VTZBM5SAWyz4J0oPH6YuREkm+vmvgOxXo1PjJgs0BKlKJ5eJDNkaQkpiKU?=
 =?iso-8859-1?Q?Qw5sOeo5vzhWcLJML7BOigdJxiz86eu97qqnYesDpAj5VZLmM0atprKtea?=
 =?iso-8859-1?Q?XCuZuL9MfnEEybuF5UdvKQlgKUfcq/J9oqYCLc//FWX1cW9OOkYS7q9pUX?=
 =?iso-8859-1?Q?/5tCWvKXQnyJzsf5TGqAWRwegcRtjVFiVFVonagCLbVKgVEAbqKa3ENFUY?=
 =?iso-8859-1?Q?plIBZxT32MNYWReJRk6SdvPn/GwtDq0YZPmgqYYIbtHdOc+9JLJx+ncuOL?=
 =?iso-8859-1?Q?xU0mZNVCBtQBLBpeCpk7ll334rXPtVqj53Xz3pQbZF3BP1hY9aCBzdlovQ?=
 =?iso-8859-1?Q?kZGks1HC68cyuOIgCZdrFj/R0gxRAyabmhfjBy+H/2VYp3g9fU0MlrUKe1?=
 =?iso-8859-1?Q?F6G0XIN95keqbYNUY3eT/27PAecNlH0ZwfLAJUi1AMYxEHnk4yiQSqVhYJ?=
 =?iso-8859-1?Q?9zND8x8FJBinn2nXLiumRfndZrUkz2MamM3WeWtj3pei8UDgTA72NIGrtI?=
 =?iso-8859-1?Q?CONaE33vHalqz0xiHSnvqa453Jz7PDTPpVf/LNJZPucq78nToSmgr6vsn3?=
 =?iso-8859-1?Q?QgothGeYx+7tKAmPCznS7RpjFsVyiR2x9ot12azaS/fIGP+4onNTr9e33R?=
 =?iso-8859-1?Q?TeCxtGhmtTy7bzQLLh0DyO/zQ8/Cn0kR80DyFxFB17owUj71tcFXq6/+l5?=
 =?iso-8859-1?Q?gvkB75fBPoAsNs3R7dhly7mInTAxCw91iVaBqecT6QNvSeCvj4zCmK4E9z?=
 =?iso-8859-1?Q?7sGe3eIhMzuiGYVbqS6WutSOUjTZPYt8I6fqtS5qdnfNv9gNh2m3+kSner?=
 =?iso-8859-1?Q?FeIqozHjTBVTJcbm2bO/PozTUmZp2bWL/KicmDVI2v6v888XItbOUjuKWH?=
 =?iso-8859-1?Q?KKTTTTgRb4iZGegkjgtWzulz7H2PoDTQnwxGOGYw0jV+zX+oQjIoO+zUqQ?=
 =?iso-8859-1?Q?Gh9SbhgJRpch2vhxmhhZ4UToboo8RDvBMCCcE9eWfxneJzEkQm1mwvnw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e8bf43-d6e3-4cdf-23c4-08de31bb77ed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 15:57:17.6155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKYyRHKIEIPzjh+r280rfdMmFGDtKR2HUElyeQTTzIWqhtAmFUU94lP8PhK8snqVYy/PwEVeCW1LjKIQqou0/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5125
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

On Tue, Dec 02, 2025 at 08:17:17AM +0100, Philipp Stanner wrote:
> On Mon, 2025-12-01 at 11:38 -0800, Matthew Brost wrote:
> > On Mon, Dec 01, 2025 at 11:50:08AM +0100, Philipp Stanner wrote:
> > > Xe is one of the few users utilizing the return code of
> > > dma_fence_signal() to check whether a fence had already been signaled by
> > > someone else.
> > > 
> > > To clean up and simplify the dma_fence API, the few kernel users relying
> > > on that behavior shall be ported to an alternative function.
> > > 
> > > Replace dma_fence_signal_locked() with
> > > dma_fence_check_and_signal_locked().
> > > 
> > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > ---
> > >  drivers/gpu/drm/xe/xe_hw_fence.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> > > index b2a0c46dfcd4..f6057456e460 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> > > @@ -85,7 +85,6 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
> > >  {
> > >  	struct xe_hw_fence *fence, *next;
> > >  	unsigned long flags;
> > > -	int err;
> > >  	bool tmp;
> > >  
> > >  	if (XE_WARN_ON(!list_empty(&irq->pending))) {
> > > @@ -93,9 +92,8 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
> > >  		spin_lock_irqsave(&irq->lock, flags);
> > >  		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
> > >  			list_del_init(&fence->irq_link);
> > > -			err = dma_fence_signal_locked(&fence->dma);
> > > +			XE_WARN_ON(dma_fence_check_and_signal_locked(&fence->dma));
> > 
> > I think XE_WARN_ON can compile out in certain builds. Best to leave warn on logic as is.
> 
> OK, will adjust.
> 
> > 
> > Also a little confused by this new helper... Doesn't
> > dma_fence_signal_locked already check if a fence is already signaled and
> > bail? Running out the door so I don't have time dig in here, but can you
> > explain?
> 
> Yes, that is what dma_fence_signal_locked() *currently* does. The
> series, however, is about removing that check from the default
> interfaces because barely anyone uses dma_fence_signal() et.al.'s
> return code. To simplify the interfaces.
> The 2-3 users who need the code get this new function. See cover
> letter.
> 

Thanks for explaination. This should work then with XE_WARN_ON refactor.

Matt

> 
> P.
> 
> > 
> > Matt
> > 
> > >  			dma_fence_put(&fence->dma);
> > > -			XE_WARN_ON(err);
> > >  		}
> > >  		spin_unlock_irqrestore(&irq->lock, flags);
> > >  		dma_fence_end_signalling(tmp);
> > > -- 
> > > 2.49.0
> > > 
> 
