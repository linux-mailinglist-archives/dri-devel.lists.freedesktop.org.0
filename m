Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id y8pWF4WHoWmTuAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:01:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45521B6DEE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880CF10EB11;
	Fri, 27 Feb 2026 12:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cU0aobxn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010011.outbound.protection.outlook.com [52.101.85.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495F410E182;
 Fri, 27 Feb 2026 12:01:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UszfX0r+5zcHbE7X5AfdsSP3D8AHBBfVYhlshm981i6ydYNETu470RLj3cP66K1tMUY5Xn2H/fHoPEOBFouJYSzXcaWwIIn5Q9q9NQXy/cifQiOzafhsPuyzYz5LClxx/SctHs9/f+bIlM9/U/n+5TLRa09bjLxoE0GBje9JNoOko8xhbP1EBPdLdcjdYEEYXH25whJWlgf92D4ycnduSEtpUzd1Lni+clD5HDrOd6mBrrP3hAyydKP3ar5uoE7OXm38tVSKoQ0M8YqVUysjh1huivzMtQnvJPrs/3YqpUIAjgv/R9l6SWD9DXvX6j9lf95+bxGogyiwowpbcXHPyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmSgibAXmXRkqELuPcyy1Z5lEk543pdckWPhOv9lALw=;
 b=CAxqQ11Qc2gafuXvKuALrF2hrO5I1z9Xpo9czJGF9jKdIMS/5mTf3aSMxitRL7n/WOIJRYv9eyH9suJ0uU8kW++df6abVlLnfjqxT0G8qkdT5qN3/35WDplGLV1y71L70TX5aXTu0Kog3wi2OW89Utt/SAoAhuY24JaHnmAuVpbPIcCQRex+WiMGqHoW7PvnNbI9+fszzVLE9AYwirhU9P5MdBvQSjR/aHQY8yFaNxcj9TnWaT9Pjfw400SKtIEzU+u+n6eSz+eCZjjAEWNQNmFqOHDfdQlJXdOjuS6fU3eZrC0rsu8CxlIIrp1h6YjU9M7rA+qENhtzrtxkWC8ZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmSgibAXmXRkqELuPcyy1Z5lEk543pdckWPhOv9lALw=;
 b=cU0aobxnik7Myy2kozbk8JvRiumcXyu3EYF+zpp0PuGOVWpQYhU79px0NViIWsL/dS3+g4H2+fqAOGaVh+r1PhxC2DNjMb08caNzgJ/Pqd1xAx9PTZQKgy+X1cpIXwWQCcH6LXWi73VGm3CQ8PeHsthtzLiQSFfM91o87hae+jId9Nn+7usotoZNReF0zr/RpC2+n3M/8LLibud0craBDHHN3FO9mmZyXDBPU/nvGDWqq/TXtSOa1pgkk1654FYwf6s09/XERSgeF0X0s1Ow6Vs9lDeqYliPqg+kVYObkULrbIs3NM+dVAhrTfTfHFWx40U+Uq9t/psfMKXEYCNPjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7028.namprd12.prod.outlook.com (2603:10b6:510:1bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Fri, 27 Feb
 2026 12:00:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 12:00:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 21:00:53 +0900
Message-Id: <DGPQ7XDZ95N6.176S6MGHWWUCW@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Bjorn Roy
 Baron" <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Dave Airlie" <airlied@redhat.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>,
 "Alex Deucher" <alexander.deucher@amd.com>, "Christian Koenig"
 <christian.koenig@amd.com>, "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang
 Rui" <ray.huang@amd.com>, "Matthew Auld" <matthew.auld@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, "Lucas De Marchi"
 <lucas.demarchi@intel.com>, "Thomas Hellstrom"
 <thomas.hellstrom@linux.intel.com>, "Helge Deller" <deller@gmx.de>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Andrea Righi" <arighi@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, "Elle
 Rhumsaa" <elle@weathered-steel.dev>, <alexeyi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v11 4/4] rust: gpu: Add GPU buddy allocator bindings
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
 <20260224224005.3232841-5-joelagnelf@nvidia.com>
 <DGO4BIQ6MQ9Y.KB3JJQI71ETU@nvidia.com>
 <eff888d1-2caa-45bd-a611-e5772ee94e1b@nvidia.com>
 <DGOJDXWDOJD0.2J6NENL44SQJJ@nvidia.com>
 <3161a017-a9f8-465c-b4dd-fef085d75b98@nvidia.com>
In-Reply-To: <3161a017-a9f8-465c-b4dd-fef085d75b98@nvidia.com>
X-ClientProxiedBy: TY4P286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: 544f301f-e9fe-4ead-a23f-08de75f7ddcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: JbKSEXqkditTYlKNcbIwDpv02JWrNGLgLGLx2PRfcL3bm2Ak9rkX+HO6JC4tsxw3okoc4J9PNryafXQLe5eVJoHyVJkLxyw3DTB5P48G4nfPE1yArkXdyjPq/ZUnD7pdYAHJc2PmJCw3vkOvM+1ibR3bLg40Y9rfySE7eAkbgguTtbzm4KfywFIfVds8FDGxYAqRViez7rqvsUvqE7YZdLczbgRn5v9+oueBpkicOve57OmTY4wZs1AXOtLEwMm4OJLgdlasOP0taCNHDhUZl3/5qeou3vMJHnkH7HT+TOTr/4A20gvkuKvjS4B1qJij+1paYczlnbIjl/bJGn6y6t18TxWXzWtOXD0k7XXnJ88lpOlXBnoHF6OipFfB3zwGt4kFwLOwtgPEJCK+xDtXfCpKrAEt18Rtr9x9Apeija4DjmUc2WazESOS2x6XQnqL37wrq+fDEHe6KzI+idGB2f90FHBufpG8p6ZDBoRnxdkAesbSYHeZPRA7b/oSY2rf14lK9nYM3afb6ey1gfcssfcnjPsKtGqy2K/fQBjkOgFUgyfF6hxp6EO5RYC60ZrCnWm+ojaEq3OKuOG9cTpkdbyqaSJRvLIcI6Mvwo1xphvZbUSV0739XZ/QhyWnSFZmsFpwM3MLK70IiaMznAapr6pycI32+PRpX/yi9f+pIFKT0iL232mIQhx+IIdk2REUO+DmX4OvIMBoD2asuN4I7ngV7TBC091Bdmz0wFGv6BU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmtPM2ZCNjlOSG9keHZZT09JeGgrcmplbWM2OUw1UGRPcDVxbWczQkFXcTlx?=
 =?utf-8?B?a2tmOFUvVVUwY21nM3pTSzczWlk4SmtHM3R0SkJIeHFobjhiZDF2SlB1ZS9B?=
 =?utf-8?B?R2tGQ25MejlYU0puTEtDbnNRcnowc1JPbFdFUVBsMjFMMlo1Q1had09naFo4?=
 =?utf-8?B?Z0FPVkU1cEdxUmtCTE9QMkxJUE5jRkxmakhIY01jYU51Sk9ZZndvdGQzN3do?=
 =?utf-8?B?LzBSOEZBQUYwSVJ4T3VhVm1CS3BURVZpd1plRm0vZFlaejRJZXJlam5JWWpT?=
 =?utf-8?B?cG9Zbzk5UVlIMHZaazFmd0tTM05XRnZNd08wbjhGZUVrT1RKbytJRjdCajVh?=
 =?utf-8?B?RWhKaXFkbUpKR3pjWFRheEVSOUZvUXJqMjgzWFIzdGRORUE5TTQ2ZTBsbGVp?=
 =?utf-8?B?VnV4QkkxMFJrYUFRb3RDM3U5emV2U2N3YTlLVTJsTkg1eGV0RVl0bW92ak04?=
 =?utf-8?B?ZmFxa1BndkxvVDZNajcxSUZGWGVib2VLb0p2anE2NW5qRk8yZFlQTzJNTU0y?=
 =?utf-8?B?Skw5RUF0akU5NE9aTXN5OGF6MUNaREl4M2wrWHN5VmZVejZEMHlLcHB6WFEy?=
 =?utf-8?B?SzlWdkVsbGFoV3FrMUdxYVN0N1RmNkNUMGI2eHQzTm1YL2N5R3VyZnB4NUpV?=
 =?utf-8?B?ZFpIYjhoVEJZVTg1RVdqUVQxbWJ0akRmV1daUmtkQ2IyandhMklXbzM2Tzhk?=
 =?utf-8?B?WWExRzFPcUpjMzlaQytmVVpsUERBcmlGaEI3Tm51cDRxV3dQMlliRXh5UkR4?=
 =?utf-8?B?NTB1d2RITnpBcjhmOVVZcWNLeEx1RTE3VnpNa2E5eXhERXB5YkRscythOWNX?=
 =?utf-8?B?dml4WU9zcWYrMjlCWlUvNzVMM0tEalc1cFBsaTBTanFERGsyZUlaR000Q0Vx?=
 =?utf-8?B?OUlsekNsb3FJak1sK1ZENDNDM2FUMjZ6Ylp2YXVydWdwbjAzalE3WWlCRjFo?=
 =?utf-8?B?a0xsTjhLRkx5MTNqU3AwUnh5TFdqL0NndUNwUDJuWkQwZHVnbzNSQUhEaVdt?=
 =?utf-8?B?dDB1eFRtb1FrTHVhSXhEMEVhNVdyVFdwY21GNTJxV29tVVBwd1VzQjRMRkg1?=
 =?utf-8?B?UmU2TEM4WXpYcklBRTN1YVErejV3UFlqRzdlNENaem9sWFpuN1BJUFRNSXc5?=
 =?utf-8?B?bjZLSHVEbmFVSncwR2RLZHUxRkZpdlUyUHhHZ0E3T2xwU2lqVU1BWmNDSVh5?=
 =?utf-8?B?NGlyRjc5Q3R6U1NHQmlTRXE0K0FkWmRxSmZUaUd6WUFzbkorckpYMWFHWkJC?=
 =?utf-8?B?QlNzYU11WXlhTE9XL1JVTDBOd0xMazNqRHUxV2pMK3F4dUVjazRrd0VDVHZZ?=
 =?utf-8?B?ZmREUjY1U0ZPUkYybTNRVnFvM08vV2F4bEszQXhoRE9STG5rUVMyaHVTRmYy?=
 =?utf-8?B?TW1pWkROaVBURTB5NHdiUmk0N1dHMklONTYyNDU1cGtETWhCamhUbGF2Q01R?=
 =?utf-8?B?WUpXMXFWUkJ5Sm1BdnRjazJXWCs1QTQxTHZZMHRRWjArRStuOGtsYWdGRUE4?=
 =?utf-8?B?T1NsRXVuM3krbVBsUEFGRmpqZ1lQeDlnUGdZd1FBUXFZZEdjUEhkSGVuM0Na?=
 =?utf-8?B?TTk4c2NYR0lzUWl6VGo2R2RzNlo2UjJDZlFrYTh2L0NwR241VUJMMk84UWxY?=
 =?utf-8?B?TkhEbnZNN0lra3hZWE9vRUtGTE9VNXBOaWIvRk92bmg5Y1cxdlk1dDdzdWhk?=
 =?utf-8?B?QUhsTUk1NjdncWw4TzhNVzhUNGRPMHRpNFM5TWdYa3BjVG1BcFFVVGRwdVA2?=
 =?utf-8?B?U2hzZytaZWo1dXNvWWZOeVZJUklUSUZkZXBzeDVudmk2QWdUUW41WDJycXlz?=
 =?utf-8?B?TjlRcTRLS0JZbW03L0FsSTBnRDB3K3lyaTdaRHZoZDJBSFd5ZzBsdVJVYXVN?=
 =?utf-8?B?QjYvV2w1VmhrS0FCMk1kM3RiSVlqRll3cU5WTC9SdlQ4TDN2SHRxNEdaVWJ3?=
 =?utf-8?B?blFTdkl6VU8xNk14OGZXaVJPYXFJdWxVV1lSTWlYYXJwMGt2Tm96NWVad1VN?=
 =?utf-8?B?U21nWFBLVWlkc2dJODBORWlVUHp5aWM5cXk0aEhwd3Y4NklOR0hBYWJ4OGZp?=
 =?utf-8?B?NHpRaG5mL3ZxYjlPSmczYTlnU2VudDd5angrMzY0a25BNnRPYjNIUWh0VTJU?=
 =?utf-8?B?dlNZd0pSTjVIazM4THFxa1k5ZjlKTmJ2bVMwOFRmYi9abDIwRHBnUDJPUGt2?=
 =?utf-8?B?aHp2NTV4OHRTNGNROEc0Z1Y4RnNSZmZaQU9SY2JEc1YrM1FHbXk5Wm1ZdXZY?=
 =?utf-8?B?b3pyRXdRN2FBR1hMN0xNWlc2TjVpUDRTejJUQkRWMmNabEZnTWFkRjg5eXpl?=
 =?utf-8?B?YjB0MHNqSW9VZXVzL1Z4OHlRZ09JRm5VRm9aTDJMUmI2dG9TcytIc2kwWGor?=
 =?utf-8?Q?cs/HoqauCbduCUjQ9SB2Gfb7qf2ViTZbzeLIFUEF0DDni?=
X-MS-Exchange-AntiSpam-MessageData-1: tHQ+soE4LzCBpA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544f301f-e9fe-4ead-a23f-08de75f7ddcc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:00:57.3726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVEb8itbIthP8k07ALULCUsyyb5z2E8WzwJHilF4oc9FoSdRV1cs23AELAI5/fhn6IXKWD8xUwtGHq+B7w4uMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7028
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,gmail.com,weathered-steel.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E45521B6DEE
X-Rspamd-Action: no action

On Fri Feb 27, 2026 at 6:42 AM JST, Joel Fernandes wrote:
<snip>
>>=20
>> And the job of `alloc_blocks` is also simplified:
>>=20
>>     let (start, end) =3D match mode {
>>         GpuBuddyAllocMode::Range { start, end } =3D> (start, end),
>>         _ =3D> (0, 0),
>>     };
>>     let flags =3D mode.into_flags() | u32::from(flags) as usize;
>>     // ... and just invoke the C API with these parameters.
>>=20
>>> if the C allocator evolves its flag semantics (new combinations become
>>> valid, or existing constraints change), an enum on the Rust side would
>>> break. It's simpler and more maintainable to pass combinable flags and
>>> let the C allocator validate -- which it already does. The switch to
>>> `impl_flags!` will work for us without over-constraining.
>>=20
>> The evolution you describe is speculative and unlikely to happen as it
>> would break all C users just the same. And if the C API adds new flags
>> or allocation modes, we will have to update the Rust abstraction either
>> way.
>
> How/why would it break C users? Currently top down + range is silently ig=
nored,
> implementing it is unlikely to break them.
>
> I also wouldn't call it speculative: top-down within a range is a natural
> feature the C allocator could add right? By modeling modes as a mutually
> exclusive enum, we're disallowing a flag combination that could become
> valid in the future. That's fine for now, but something to keep in mind a=
s we
> choose this design. We could add a new RangeTopDown mode variant in the f=
uture,
> though. That said, I've made the switch to the enum as
> you suggested since it is cleaner code! And is more Rust-like as you poin=
ted.

Ah, I thought you were talking about new flags - the case you are
quoting is different, and indeed more concerning. I guess if things were
to change in that direction we would have to move top-down into its own
flag and update our users. But for now we should try to support the
existing actual semantics as closely as possible, and without any
surprise if possible - what you get is exactly what you get, without
anything swept under the rug (the silent masking done on the C side
freaks me out a little bit tbh ^_^;).

Should top-down become a flag, our current API also wouldn't become
incorrect - it would just be incomplete in that it doesn't support the
new use-case until we update it, so thankfully that wouldn't be a
critical issue.
