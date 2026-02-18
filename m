Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCnCImktlmmlbwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3A1159EE2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9EE10E69F;
	Wed, 18 Feb 2026 21:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eeCOyDlI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011066.outbound.protection.outlook.com
 [40.93.194.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCD910E68A;
 Wed, 18 Feb 2026 21:21:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0tPEUDr+2Fw9do3CCSTiKCaoowDrtSz67XkBKjFD0ttz0kT7QRx4WNcRYSDR+HEg3JetZj7sZLPPz+OkhbLN9KN5gvG9Qbz0HtpceEUEagGWh9d1mBqUN5mldGA+FEg9ST1c06czA7ZiyehaEOF77r54JIvrIcF//Noh5TlJD2LN0q2UW48mPiAKlarAETA2grFHpvh5mSjVXyAX2JrTk1f90AdxZ5S+aslcy2YmLYS/Sj/fBGOSyku1QCrWoLC/gjfJm9rlmqxpQQnPLCimyyhNiNp+BuCS5pLZPKYxe3GbGj5hEmnb4waZhzwUG+4rrPfaQzqzbyfMuHtJaJpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCl4nMLQZZHghyVD438Ee7ruSVmIeeR60o5/thkoSzI=;
 b=r5dLLQz8PCOam1kCpoWyjfnqG1hmJDcD2md6ZLoAJ8K7RmeTVMVGhQBFc3y7rCdskLNICcidbpKDCQ2Zj4JLarWNRmWEEiEdPhIPPfjOXEyptT9BkXqImVO1AupMSMArEcV9ZYCrhRK0QQxompoW4+E339FJ0UdIArdywMzdtSVTeDebyzlnY4cZxPut77rq3QOgqE5BlIF7z+EQbM1KnkqE77DbAjAvIp8R8E2CTt6dkE3GrZz1LrkYbyo8t/RgwTr1y13/fLCSQxEbrlqOmsU0K6wZNZHpWYMH0xb0J+pcXWl0WOiE0+zpGUW5h8kXNNhAgdEmD2UyPDRGjsFDVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCl4nMLQZZHghyVD438Ee7ruSVmIeeR60o5/thkoSzI=;
 b=eeCOyDlI5WJSkvGDz5+BF98f5PkCFP/apHfctWIFRG6i1gDRG1LAUmTaLhUL65bMfySkRaTz3Eu7mnezMC05VcCXCMMcksRXR1camkVSwPDmfSe3RNR6B6WO5yzW7oCNnvCnkS21mSZT/zkdZD5yyrS8t55X6/z8Da4CeBMHe67ECaxl2ARA242b1HbKjyLb5YkVwWp8SJc7ZBtTKB7Ex/AZgHVnGkzcfcPQPDhK+SqIHtVCnwuHFh2QIs/IQ3E2013XTmhFmB/0r4nWfPueZHB3vHrKaIiUzq/jL0+RZCF8HDRkFOoKkM5+lOxVvsUsSuAwn5+F2m9P5eFMo+Idkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:34 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:34 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, Nikola Djukic <ndjukic@nvidia.com>
Subject: [PATCH v7 18/23] nova-core: mm: Add BAR1 memory management self-tests
Date: Wed, 18 Feb 2026 16:20:15 -0500
Message-Id: <20260218212020.800836-19-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:408:fd::20) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f122583-c959-429c-bb47-08de6f33b133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xnpl/3s/nlQTjxZZAyxnxKJr0ebiBKfTReYAt9x6QKTsEtSOJxBbn+0eAYtA?=
 =?us-ascii?Q?zrlbWQynsVJD8G4hk1rlffzpRwghdcGV/IbsehlksLiiMB+VKyYph9L+kYLe?=
 =?us-ascii?Q?EBl6VYpSqDFkDh9zuGNoARp405jvTBmbtTY0rxZfm9sTgo/EsRvC0Ldq2P/s?=
 =?us-ascii?Q?66/IFhEU68XhiCrKzc1uaW8nbRoC/3+Blmb5vFN6axKeY6xN+Ij6J/D4mmJr?=
 =?us-ascii?Q?zHEBcxHu2zHiyit+Qa/9PDOhxYhh9/PKGUml9+/CTWvsM1J6VjiF56w1s0lJ?=
 =?us-ascii?Q?wwOOwHK92SWwDDLPTgw7W6iy/22J7jkpVTxGDGaVK842shC/cO8aDwhkfIVO?=
 =?us-ascii?Q?eAlqTzAaFwyJRSlEkAzjZHDfTfjm8l0GXePc0DdGFtEXbNmUDdHQ5WKAsauu?=
 =?us-ascii?Q?SsP3TAkbKn/vm3QUWVJfKnqPzXumjaHsKTGF0pR+w50WN5LmBRK2ntu6Iuio?=
 =?us-ascii?Q?mC/pOLum9+aTazNnfXFWP+0846lvISafJBcHghVh5udIqhzNm/MgsZ6pMrP7?=
 =?us-ascii?Q?AoS9spHKjklMdnrjd0YsqJ5kb28GAeLrAnmOxrM+HpZZrUykBNiwsujdW+JO?=
 =?us-ascii?Q?kS0DGnIDQEi6Hhxivi67P/bxgzotd1McYi/VlwIOEu73uU2bULWqr/QtuoDI?=
 =?us-ascii?Q?cXEqC5EKoeOP7TP0+LeQn48555FTeAd+rgGaciUfH2YMlnISA4EDAcJtLdkn?=
 =?us-ascii?Q?bhGJAGnlrwS/J2mFtR1sfrV3oL68HFFd0Iwgjg5lnKllk4coDJbSWlHVCr2X?=
 =?us-ascii?Q?octWFInjq2ODym6XU32u8fBQZ8a3egqgnHH6k2nb09jdVg9d3y1omo6JGkHM?=
 =?us-ascii?Q?3em3e7eGsytknbgr3LG2S0+OTU0wuWNdkVrIqolFNi3qWGpCmeQ08HCLegqY?=
 =?us-ascii?Q?l718TCsizZCiXU2VC5M9m6JTUosgRZWbHNeByxOwCMLYSVr4/RvzPn7j3Jg/?=
 =?us-ascii?Q?GOA22t5Q/yYz3R29vgEKeXqs+i7buq/JbwZKnOG3vbztt6y20QSp8CCT5oFm?=
 =?us-ascii?Q?NgiIYNnrGERigarwy8mQ9LCRbvRryrunwi4NunSI6n2MZ5CZEwrsiuYJ+Nkl?=
 =?us-ascii?Q?XLyvWur2b8GHQY5ykxb8RqwPl7X2BTJeeRbItRuGajw5dgqk85dTL/2Mdj4o?=
 =?us-ascii?Q?hn+6vIUTSZWFXbp/K4IxFJUkYO5lxFnxh6uKVoMMFEhlePLDYKqwA6L03SJ6?=
 =?us-ascii?Q?itJN8uas4OiwoowzdzPw7YvLPK9UVP5pdXusT3z1y/ahiR+NWrR+RDOvX3ty?=
 =?us-ascii?Q?U9n3xf4u93mqvJdxSCrW1v31FikrNQg0R0PeInqhI4sc97c5R75eOkTFaE6A?=
 =?us-ascii?Q?x7HAx8/FpowrpuqtygB4jQRneIYCU+x6NLABSqDLfdVSg01JHFt/0mQh7DOV?=
 =?us-ascii?Q?aMVJ7rXd7XfBa7I/5tPBBn/BSG+4cXCkBtJTuFyrJ8iWRitOTD4fJiOtfXOn?=
 =?us-ascii?Q?XBrpBj6y4X4ka7rDNHVnn8fj2HNASWrNkq5OP0Qlvl1wYYK2mvKcWyUIN9eD?=
 =?us-ascii?Q?yu2g0cbonXIdM304HH9yV3T24kCGxixRDs42XeXOj1JKbXYCSbcLed+3Yym9?=
 =?us-ascii?Q?FWk93V3QQJR4vgi/C6U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K3noChqc971cFDscvD2WH1Jv5NvEVFNsg2lpwQyXkipmBPhBSTuZRwXD9P/m?=
 =?us-ascii?Q?08irb70KIH8H9XvVaxBNZLH39zt+FpkGG3ys7rNsJeElNflZRjeT8GfIX55D?=
 =?us-ascii?Q?Kl0mwuq7cMJC6lL6vX25NDF0ryX9M9jwMZ0uDwS2iVVeZtZOQ/TJQlwpm/7D?=
 =?us-ascii?Q?XXVPTgtA/3VYdndyR91tMB5n5DcIQQsYaRgDscFw43H0EYlzstcpkwNaXV3S?=
 =?us-ascii?Q?xU2LNYgR2cgU6YPAUciAkS4CvT7fa1muQSWJhPu/U9tWL1QzfGZ4CHoZvfKI?=
 =?us-ascii?Q?P634SR8k9faFpULrq/ZTI2uR3T8XMHbBlwiw5bpJQdpVpHSvp9z1wIKXNulb?=
 =?us-ascii?Q?+Cv54o40IPkKqlfcpr5AzwOb0B5+qENk/fAtjho6yR6PFPB0KeMO67ag1JrK?=
 =?us-ascii?Q?QMzEazxXRvNPaBMi2tEIOPnv96ogv2aQpZttoGoDcIqCbMiCikrLEhu8540l?=
 =?us-ascii?Q?TQVyxv/NOIICXSo5rSFb+2tdreI5uY9Bxpr2mNKPLsBXRSzU7vqNHarkjXV2?=
 =?us-ascii?Q?0ChP9aulcMG8eakpW1ebnBt/mWHY3t/nFH6bO7o0lhZFNK5mhLqcH+lBmOWI?=
 =?us-ascii?Q?I7SJV9FgUOmYN8z9D/Vcd6pUg18MUXIR6436rOFR/1TC7Bh7mpr+tzkrtcJp?=
 =?us-ascii?Q?MixQeAdsf75yiK562JPxPXUG1k/u7r+mxo5UCJKQ2MyCgk10cn+mrsd3xS8K?=
 =?us-ascii?Q?a0MJdBSAtGYZbbPbf2opKyB0DWewltvJWFH0UJPWN71DR7nrjTx2Fx6Aa32f?=
 =?us-ascii?Q?BquqYgZTq1uQhO/2RkSfWgPfIKliiMGZxP2C8H+TMW9LXfqbJKBqx4pquUNG?=
 =?us-ascii?Q?u95MBNNwGnMbaesjEO2Cholx0kJq0+HxaF1D2EJUDmpQdg6CQ3AYnRvf4F60?=
 =?us-ascii?Q?ukaHMt9Runc/jXGF9fjHaQrdt9FHy6jUcd7OhC46VSaKMv9IbCWWjJOwqNoh?=
 =?us-ascii?Q?VzD6tL8CQRA4SCvTKO4ke89lVm2jqE5txQemXNd4BqheyVMGV+fQq0lhQTQO?=
 =?us-ascii?Q?pd7hXU/kUKphT1OhQMSVbN7uPVA9TY/YjX2HZRhGYFWV2ytvv550a4MuTBU5?=
 =?us-ascii?Q?LVZuFZKuVNFZhbbngSSpLXdp2LI+EO1yeOgjEASu3jrXQjVvOCxQ9kXuSV5+?=
 =?us-ascii?Q?IASe3XBt6NVH1BKxfwiYaJdysioZjnf3yemDI52ZmjsL+CclwYQuQQxQzS8T?=
 =?us-ascii?Q?ITTVXzPBkp4dScWf7OFghrWsFRrYbogDRXVosCfXBQv89N2px9ARVQ/N63VA?=
 =?us-ascii?Q?rGDr+76/AloZ3FhZSqTGvYpZGoiAZYHwcKUggber0DXN1X/xbCp9BMVktRss?=
 =?us-ascii?Q?D2XQQOMoXsovGwwCB9Hlad9Mx7Ms5WfBZ6h6P3025Z7y2vFsWL/bpTI1d66x?=
 =?us-ascii?Q?fTMv12Zj22xQLD88LimftwZNnCY70LuH4gHUl+QYUM0K+oiXpURFrgafavD5?=
 =?us-ascii?Q?4+uZ+fbJX35ddIQSWaRZh92ox7SOXmogX7QoaxkWogG+EuH1LSPpQJURGVgV?=
 =?us-ascii?Q?4DMSKpt2n7KbAC5MkluhKhLy4WI1ILMtPI7dr1kWjk2LLKVcedVXzhgf2hQ9?=
 =?us-ascii?Q?LQFZzlsBRCI5MWZNhKrTO2CBpEV6dhay9Pw8dUgeKUUuAZePFSWzTqL6nHeL?=
 =?us-ascii?Q?n2qWapRp2WazxJopYGZm86l1Uc7F/kZjahJaKcsisajdNPizzimUJFLd6FoC?=
 =?us-ascii?Q?kyI3/jpCyq3B11VGff4hMySwOFhxQsS3j4cimIlH20dV5WzEPjBK2pXTuLjE?=
 =?us-ascii?Q?Rt6+PsqZ4Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f122583-c959-429c-bb47-08de6f33b133
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:34.1850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYRxowaXF/2v04tQi8GW1fWPcmZwNhq28dFvtjCJP7fZzrGpbZk5Pfc3WUyLK7n0EavsPX/fyTICiJnX9P0/cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999111
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[53];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 3A3A1159EE2
X-Rspamd-Action: no action

Add self-tests for BAR1 access during driver probe when
CONFIG_NOVA_MM_SELFTESTS is enabled (default disabled). This results in
testing the Vmm, GPU buddy allocator and BAR1 region all of which should
function correctly for the tests to pass.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig         |  10 ++
 drivers/gpu/nova-core/driver.rs       |   2 +
 drivers/gpu/nova-core/gpu.rs          |  48 ++++++++
 drivers/gpu/nova-core/gsp/commands.rs |   1 -
 drivers/gpu/nova-core/mm/bar_user.rs  | 164 ++++++++++++++++++++++++++
 5 files changed, 224 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 6513007bf66f..d0d4177adb1b 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -15,3 +15,13 @@ config NOVA_CORE
 	  This driver is work in progress and may not be functional.
 
 	  If M is selected, the module will be called nova_core.
+
+config NOVA_MM_SELFTESTS
+	bool "Memory management self-tests"
+	depends on NOVA_CORE
+	help
+	  Enable self-tests for the memory management subsystem. When enabled,
+	  tests are run during GPU probe to verify page table walking, and BAR1
+	  virtual memory mapping functionality.
+
+	  This is a testing option and is default-disabled.
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index d8b2e967ba4c..7d0d09939835 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -92,6 +92,8 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
 
             Ok(try_pin_init!(Self {
                 gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?),
+                // Run optional GPU selftests.
+                _: { gpu.run_selftests(pdev)? },
                 _reg <- auxiliary::Registration::new(
                     pdev.as_ref(),
                     c"nova-drm",
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index e217e5c7cb32..f17bf1bf0b12 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -319,4 +319,52 @@ pub(crate) fn unbind(&self, dev: &device::Device<device::Core>) {
             .inspect(|bar| self.sysmem_flush.unregister(bar))
             .is_err());
     }
+
+    /// Run selftests on the constructed [`Gpu`].
+    pub(crate) fn run_selftests(
+        mut self: Pin<&mut Self>,
+        pdev: &pci::Device<device::Bound>,
+    ) -> Result {
+        self.as_mut().run_mm_selftests(pdev)?;
+        Ok(())
+    }
+
+    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
+    fn run_mm_selftests(
+        mut self: Pin<&mut Self>,
+        pdev: &pci::Device<device::Bound>,
+    ) -> Result {
+        use crate::driver::BAR1_SIZE;
+
+        let mmu_version = MmuVersion::from(self.spec.chipset.arch());
+
+        // BAR1 self-tests.
+        let bar1 = Arc::pin_init(
+            pdev.iomap_region_sized::<BAR1_SIZE>(1, c"nova-core/bar1"),
+            GFP_KERNEL,
+        )?;
+        let bar1_access = bar1.access(pdev.as_ref())?;
+
+        let proj = self.as_mut().project();
+        let bar1_pde_base = proj.gsp_static_info.bar1_pde_base();
+        let mm = proj.mm.as_ref().get_ref();
+
+        crate::mm::bar_user::run_self_test(
+            pdev.as_ref(),
+            mm,
+            bar1_access,
+            bar1_pde_base,
+            mmu_version,
+        )?;
+
+        Ok(())
+    }
+
+    #[cfg(not(CONFIG_NOVA_MM_SELFTESTS))]
+    fn run_mm_selftests(
+        self: Pin<&mut Self>,
+        _pdev: &pci::Device<device::Bound>,
+    ) -> Result {
+        Ok(())
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index a7778d5d9e32..bf9e3086565f 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -232,7 +232,6 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
     }
 
     /// Returns the BAR1 Page Directory Entry base address.
-    #[expect(dead_code)]
     pub(crate) fn bar1_pde_base(&self) -> u64 {
         self.bar1_pde_base
     }
diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index 74119c4d365e..5edaacf4c9d0 100644
--- a/drivers/gpu/nova-core/mm/bar_user.rs
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -152,3 +152,167 @@ fn drop(&mut self) {
         }
     }
 }
+
+/// Check if the PDB has valid, VRAM-backed page tables.
+///
+/// Returns `Err(ENOENT)` if page tables are missing or not in VRAM.
+#[cfg(CONFIG_NOVA_MM_SELFTESTS)]
+fn check_valid_page_tables(mm: &GpuMm, pdb_addr: VramAddress) -> Result {
+    use crate::mm::pagetable::ver2::Pde;
+    use crate::mm::pagetable::AperturePde;
+
+    let mut window = mm.pramin().window()?;
+    let pdb_entry_raw = window.try_read64(pdb_addr.raw())?;
+    let pdb_entry = Pde::new(pdb_entry_raw);
+
+    if !pdb_entry.is_valid() {
+        return Err(ENOENT);
+    }
+
+    if pdb_entry.aperture() != AperturePde::VideoMemory {
+        return Err(ENOENT);
+    }
+
+    Ok(())
+}
+
+/// Run MM subsystem self-tests during probe.
+///
+/// Tests page table infrastructure and `BAR1` MMIO access using the `BAR1`
+/// address space. Uses the `GpuMm`'s buddy allocator / to allocate page tables
+/// and test pages as needed.
+#[cfg(CONFIG_NOVA_MM_SELFTESTS)]
+pub(crate) fn run_self_test(
+    dev: &kernel::device::Device,
+    mm: &GpuMm,
+    bar1: &crate::driver::Bar1,
+    bar1_pdb: u64,
+    mmu_version: MmuVersion,
+) -> Result {
+    use crate::mm::vmm::Vmm;
+    use crate::mm::PAGE_SIZE;
+    use kernel::gpu::buddy::BuddyFlags;
+    use kernel::gpu::buddy::GpuBuddyAllocParams;
+    use kernel::sizes::{
+        SZ_4K,
+        SZ_64K, //
+    };
+
+    // Self-tests only support MMU v2 for now.
+    if mmu_version != MmuVersion::V2 {
+        dev_info!(
+            dev,
+            "MM: Skipping self-tests for MMU {:?} (only V2 supported)\n",
+            mmu_version
+        );
+        return Ok(());
+    }
+
+    // Test patterns.
+    const PATTERN_PRAMIN: u32 = 0xDEAD_BEEF;
+    const PATTERN_BAR1: u32 = 0xCAFE_BABE;
+
+    dev_info!(dev, "MM: Starting self-test...\n");
+
+    let pdb_addr = VramAddress::new(bar1_pdb);
+
+    // Check if initial page tables are in VRAM.
+    if check_valid_page_tables(mm, pdb_addr).is_err() {
+        dev_info!(dev, "MM: Self-test SKIPPED - no valid VRAM page tables\n");
+        return Ok(());
+    }
+
+    // Setup a test page from the buddy allocator.
+    let alloc_params = GpuBuddyAllocParams {
+        start_range_address: 0,
+        end_range_address: 0,
+        size_bytes: SZ_4K as u64,
+        min_block_size_bytes: SZ_4K as u64,
+        buddy_flags: BuddyFlags::try_new(0)?,
+    };
+
+    let test_page_blocks = KBox::pin_init(mm.buddy().alloc_blocks(&alloc_params), GFP_KERNEL)?;
+    let test_vram_offset = test_page_blocks.iter().next().ok_or(ENOMEM)?.offset();
+    let test_vram = VramAddress::new(test_vram_offset);
+    let test_pfn = Pfn::from(test_vram);
+
+    // Create a VMM of size 64K to track virtual memory mappings.
+    let mut vmm = Vmm::new(pdb_addr, MmuVersion::V2, SZ_64K as u64)?;
+
+    // Create a test mapping.
+    let mapped = vmm.map_pages(mm, &[test_pfn], None, true)?;
+    let test_vfn = mapped.vfn_start;
+
+    // Pre-compute test addresses for each access path.
+    // Use distinct offsets within the page for read (0x100) and write (0x200) tests.
+    let bar1_base_offset = test_vfn.raw() as usize * PAGE_SIZE;
+    let bar1_read_offset: usize = bar1_base_offset + 0x100;
+    let bar1_write_offset: usize = bar1_base_offset + 0x200;
+    let vram_read_addr: usize = test_vram.raw() + 0x100;
+    let vram_write_addr: usize = test_vram.raw() + 0x200;
+
+    // Test 1: Write via PRAMIN, read via BAR1.
+    {
+        let mut window = mm.pramin().window()?;
+        window.try_write32(vram_read_addr, PATTERN_PRAMIN)?;
+    }
+
+    // Read back via BAR1 aperture.
+    let bar1_value = bar1.try_read32(bar1_read_offset)?;
+
+    let test1_passed = if bar1_value == PATTERN_PRAMIN {
+        true
+    } else {
+        dev_err!(
+            dev,
+            "MM: Test 1 FAILED - Expected {:#010x}, got {:#010x}\n",
+            PATTERN_PRAMIN,
+            bar1_value
+        );
+        false
+    };
+
+    // Test 2: Write via BAR1, read via PRAMIN.
+    bar1.try_write32(PATTERN_BAR1, bar1_write_offset)?;
+
+    // Read back via PRAMIN.
+    let pramin_value = {
+        let mut window = mm.pramin().window()?;
+        window.try_read32(vram_write_addr)?
+    };
+
+    let test2_passed = if pramin_value == PATTERN_BAR1 {
+        true
+    } else {
+        dev_err!(
+            dev,
+            "MM: Test 2 FAILED - Expected {:#010x}, got {:#010x}\n",
+            PATTERN_BAR1,
+            pramin_value
+        );
+        false
+    };
+
+    // Cleanup - invalidate PTE.
+    vmm.unmap_pages(mm, mapped)?;
+
+    // Test 3: Two-phase prepare/execute API.
+    let prepared = vmm.prepare_map(mm, 1, None)?;
+    let mapped2 = vmm.execute_map(mm, prepared, &[test_pfn], true)?;
+    let readback = vmm.read_mapping(mm, mapped2.vfn_start)?;
+    let test3_passed = if readback == Some(test_pfn) {
+        true
+    } else {
+        dev_err!(dev, "MM: Test 3 FAILED - Two-phase map readback mismatch\n");
+        false
+    };
+    vmm.unmap_pages(mm, mapped2)?;
+
+    if test1_passed && test2_passed && test3_passed {
+        dev_info!(dev, "MM: All self-tests PASSED\n");
+        Ok(())
+    } else {
+        dev_err!(dev, "MM: Self-tests FAILED\n");
+        Err(EIO)
+    }
+}
-- 
2.34.1

