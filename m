Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AZrBE58pWm6CAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:02:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE421D8041
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6E810E4AC;
	Mon,  2 Mar 2026 12:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Me5OfLps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7257110E4A9;
 Mon,  2 Mar 2026 12:02:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggpkCihLoIABHi5S5REZq6o8sY3f0z8naKOUUnxQdhOUFdrPb7GrfaPRhZLsk8qZx7D8I8+Bi/xDzQh+j8Q6wLZlznTWucdXWkC3ZADbHC+j/Jw0iZRWxSPGY7enHTR4T7ILvNCnD0x/Jx0ghBEFEsZtxlzqhJ9aZ6rkuv+ONl+2UCir0slsVp0OyJq3sQeDK+5eYW2xk5C2ovGmMX0WIrb3syW07ZiGWFx7n0gyBRRvP7HYMc+Hkn2e5GrbXPq3Q0d0U8yI4oPbkr/drfli+/J8r6i3J6HZbYG3yVDpUMx8KiKl+ypYf7xvveIsDJsxEc5Rtd/XWlpAsF4FmVXBEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQSkIEqoKYUC5kMLdAeiugT5uVYo8+4HoRwksnLIED4=;
 b=j8KNkHbE+lJO0fQG5zTTnRjX6jOKh64FqCmh6TpFKqr32KWTr+dmQWBx8ak6J9aGS9hi71ZBRyvjRU94jUjSH9PpD6hY4+imY4iJESWnk9OkpU41UmyWn/dpVhb5lrzi9PYPfXXj0qjDNi4AOs+gxlT48MTDn8XnL9rGXSvLJMHdgApwDFs4I6q0gcOvyNKeZS9knUhAuclUu2ayKBv7Zk6rBE6qL1ULB/5V5snU+CdeSInLcE2RHL/d+gwFZrOejKENBsdWpStDCJctbeg8RWV91n12IQPTT15iqrmPWaHOcNRxkwuyWHRsCE7NKqe6emYF14GAh0YfQGVFww0GQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQSkIEqoKYUC5kMLdAeiugT5uVYo8+4HoRwksnLIED4=;
 b=Me5OfLpsBh6Cp07ZllRjnshtoXvaAJBIWy98H/mtK/tB0BNEZOz1XMxHL1FnqZ/ZUWzLKox7PtJTKT8a3CBkynd8CQyzqHiRV5B1bgy+v8nkoKtXklnWhdf+QbDcf/HIfc3zHA6xJFV71/l0N5frnlPhJT8EUUD3Cxb1D0nLIhQ1oveLbqC1v1/gQs4/Y/tICopuwKXSJJsl9u7h3QOm4NaqDP1+1VS5hfeFDg/mEJH1G7WhoONvFgVn4YFFZC4TO7eCTKAmPYdBo7u2xf2WkjWnQXhlI1YtCqhQMMrb9H91ChvK3AP2RUdWPx8gsIO2sdlg6Ewwv3rIwazjGh/8Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV5PR12MB9827.namprd12.prod.outlook.com (2603:10b6:408:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 12:02:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 12:02:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 21:02:07 +0900
Message-Id: <DGSA4HXRD9AL.ETVNJUYQ66XX@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Dave Airlie" <airlied@redhat.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Andrea Righi" <arighi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, <alexeyi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <joel@joelfernandes.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v8 07/25] docs: gpu: nova-core: Document the PRAMIN
 aperture mechanism
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
 <20260224225323.3312204-8-joelagnelf@nvidia.com>
In-Reply-To: <20260224225323.3312204-8-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0078.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV5PR12MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: aefbff18-1d92-4fd7-671e-08de785388d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: EHZ2xaNyMK53A9EBOaf6dvT4cXKc/LMiOn4S/qKTkEUJpLU4G28pvhEwvew6VVRiaqtguNPVRy5jXwrbK59EWwELNm7VuIUcbsAu7WAGzHsCt2e421eIXw15SFr2yGr1vY2IsMIKrDow9hvQH9SItjhilE/gikyIufmFsEhiPkeUETyVHp4dZ1TPajTtYoGKfhQlWQYtETcfaBFyAeQ17SYpZEd2c1jHdWJ4zQGLE5C0QKELdG2UD0THPfip8jghn1cT+ATbyJkZWgYNQVKwdAHothTD9GbETdjtjOS2Wq0YpIY+83TcuTlVEL4/j1tMf35oRlqmpmolUArvB5PaWV6pKEqwahTWutSsi1NbJz3oBGnxhOFS32IbRbi6EFmTbS95H6Tkf77wNIu01GVbjJi53JvdMnYdbrVFVmAjGZKlThX0ZuIiDFlNjehIbL6sSu+yUEc56aUPLLpqLyd2ihSXJJnR/pj99blN4iOJz0I+Iv5wsZ4UhE23JQFdlJ7mfjc6bewjXopLnL+dq+Arquxx+fYKXIqAJglRCKGeOZkPVg/I5emIXrrAN5Dc+k/J6Lb88fUtiyfzcUYxmGKex+ChVvaERMxR7B2LdGCW4PKCNdgCneYhM0ElwR+gOx0YFtyX6noBv+xTWcqfn9W8OnbAS/GpuUgWLVtuMuKFRoy2EUeFgu38RGlizamlgX38r6ve2l+N356uYjoaDyOpJVhnjCDY0aVBwpg4aCURUaM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0tjTTJtMlpFbExHM2xIU1R5YXUybXN5TkVzSThpaG4zSVBFMU8xNWluUDV3?=
 =?utf-8?B?UWVoYWtLRWlZUjdlZjAzTnNTZHNJYi9EYy9CV1FSdTAzN1JNVTdjQUM0NEh3?=
 =?utf-8?B?MzhHWStYeE1xSzJwS01JNTQ4Q1VVRUdyWXpxcjRnanNwTXdyLytXQzJvbkFl?=
 =?utf-8?B?Z2JOL3lLYXhWL3cwaG85T2ZEYjFudEpPN2JvTE9nd2VIdGNjYS9KRkl0Vzdk?=
 =?utf-8?B?bGpjSFh3TEJyU1NDdVpoRDY3S2pJbzRzQkcxQWFpcUhyeHlYaTZaemJMdE9k?=
 =?utf-8?B?ZGlEaFFSc0FnTFVEaW1QQnMwRE1WRjNhMjZFUXFYMFhodVRNNnNmbERKS0l3?=
 =?utf-8?B?RS9pQklqTkxFcDBhUU9qK2R1SHZQS0poektrZFlsY0xSWmJRR0JZajJIcE1n?=
 =?utf-8?B?KzN3cHlYbmg2dnJpQTRLWFZQWi9ZZ0xGTnhRSnVDL0JHdzFZbEtwWTZSRHZW?=
 =?utf-8?B?T29HUnNmVS9RT1ZNZ0VlY3oyQzlsM01vdlBsbFJKdSszOENHZGxSdXVsd2ls?=
 =?utf-8?B?OFZxUnVWZ0o4NENUMzhYWGpyOWtoZHpCZ2diRFIvWHUvLzUxV2VMUERxUjN5?=
 =?utf-8?B?NHlqNWpFVWxsQjlNRUVGcVZUQkJtVktaaFdLbXRBak5LNHhoS0w5QWl3cWtz?=
 =?utf-8?B?VWpVVG9OQUNSU2cwOVpTRHM4bmlXQzZEV3FUaUNmQ0ZLMU9UZkxFVmJnSC81?=
 =?utf-8?B?T0hvL2MzNVo4MnVNUXFwcmhFQmVXVmdhc3h0WEpSaHcxcFNxckpJNVA2OXdx?=
 =?utf-8?B?QVphaFU0Q1BFTGs2SjhCZThkVE5qT09KSTJmdXdBN2RtUVJhNGNCZExpeSs2?=
 =?utf-8?B?SCtnOW9kcTZ1UnI2M2pVV0xIUEZGV25xS1RSQjMyZVJqQkhZdjhkZ0lPd093?=
 =?utf-8?B?c3RMVHl0QjdFT0crOEF4aXdHL0R0UXdYSk1rb1YvMEhpMzh4RlQ4TVpCT3JV?=
 =?utf-8?B?SHBsSkhwOFJmLzFXZUFYbU9RcGJESG5MaXdlTUxvNzFDbkhscU1BY3pPOVhh?=
 =?utf-8?B?cUlBdG5TR2lpM0h6QmJKL2ZNNlM2NTZyZ1FsdnQyQ3JRd1pobGdmOHBuSGhO?=
 =?utf-8?B?K2hxT1E2MmRjbEwyVFNPa1R1ZnJzY1FhNTd2OXNMQ1pFc0JyVlA5b0NESGRj?=
 =?utf-8?B?WFR4TUVaQ1hTRk5pcVZ6eUc5ZEpPUndJa2RyYTFIbnl1di9aVlpnNWFQK3I0?=
 =?utf-8?B?UDd2UmNVR2F1U0h3TEpFNmovTnVId3RhMGNncXdYYnpJVFhhQVppUnZScmhj?=
 =?utf-8?B?TERneGZNNWpGbEFhWGcrbnNuaDlXaHBzK3k2emo5aktFZ1c3bGpYcmdFQ0ZE?=
 =?utf-8?B?d3ZSVW9BU2dDV0RzMVFLL1NQbEk1RTE3dm8xcXlmREoyQktZMkxFYjdFMHp6?=
 =?utf-8?B?Vk9yTmJjY1BpZXYyK3dka0hBVWQwK3R3RmdiSWJxclR6VE9QaGNFaVVjcDRw?=
 =?utf-8?B?dTcvVFJWZjl6UTE1Q0JYSFBSaXcxbnk2STNpQXhOTG9XVWZPUHJOOGxaSTFz?=
 =?utf-8?B?akRLUFNicWFsQXhMV2ZrZXFndVoyK0wzSGRudU96QVlEeG5aTnhvWWdGd0lE?=
 =?utf-8?B?b05QV0h4Z3pPNHlIZzdzMXBtaGFNTkFxR2pJNC9XU0F1WHFmZHNoTEpOVWdu?=
 =?utf-8?B?OEFKUzVxa2VQc3JlMzlhdjY1S2taSWJuaWFnRVl2dS9tMVBvZHArL3ZTeHhY?=
 =?utf-8?B?L2pKSVBLWU1WQmxXUXc1aVlrU0tWS0dkVU8va0NQeGdHdEs3dyt4dm11eWVv?=
 =?utf-8?B?TVk3aUxWcDBsdEZhS2Q1eStZUkN0dEMvc3ZQZnBlVUpuQ2ZtRDVtbjZXOCtq?=
 =?utf-8?B?VDRuZUVHbER2QWJHak56SkRTWUhZNGVTTTJwWEVlRW5WZ2U1RVNBQmtJOHM4?=
 =?utf-8?B?N0NEREd0YU1qdDhZMEdYdDhjelFZVmp1N20yUitESGt2Uk82ZW82aEtsV3E4?=
 =?utf-8?B?aWZQWitxM052NXpiZGdSQWVacEcwUUxNWklVaXlCdEVrQXhiYjJKY21IdVFq?=
 =?utf-8?B?RzRUVDV3QWlpdzBrcHE5RjFiRjBMc0tvWTVuNWVjeDZsSjNCQkVXMzd3a1Vq?=
 =?utf-8?B?QVFCWUp2WnNsbVVRNEhvOTkwclA0Z3AraHNGUnlGeVhOOXY4Nlc2VnI2cGNW?=
 =?utf-8?B?MnRjM0laaVZPb2dlSXUxWVU5RkVBaFZ5L3JtL3BOOVFrTEpvYVA3ekh0MTYr?=
 =?utf-8?B?akhLd0cyVWFJRFhENGdiaXVRM0NmNzU3NEszN2Z4N1dsK0hDUEJ3VjdBREdI?=
 =?utf-8?B?Wm5RQlluNld0cW5CRmY0RkJNcnJWajhlZmEvVHF5emZwN2FqN0NOWGtDRUZt?=
 =?utf-8?B?WnRKc25qeTFGMVdSUWdKZXo4OXl1bC9VR2M5VnJpL0pZRXREODRpdkdKb3dq?=
 =?utf-8?Q?bNYq3DLaSQudkAQovqnBn/2daTFxk/132GfJTd9b4jvRo?=
X-MS-Exchange-AntiSpam-MessageData-1: 3j/8irnjDjYBAw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aefbff18-1d92-4fd7-671e-08de785388d2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 12:02:10.7983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EoH2NBMXiRIsxiucUyLtxcYIQfneAJWcMEjA+ogdy9edihuW/Ka9sCTwOcWKJYTszD6BK+0VYSH9SbIp3mr6Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9827
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
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,gmail.com,weathered-steel.dev,joelfernandes.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AFE421D8041
X-Rspamd-Action: no action

On Wed Feb 25, 2026 at 7:53 AM JST, Joel Fernandes wrote:
> Add documentation for the PRAMIN aperture mechanism used by nova-core
> for direct VRAM access.
>
> Nova only uses TARGET=3DVID_MEM for VRAM access. The SYS_MEM target value=
s
> are documented for completeness but not used by the driver.
>
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  Documentation/gpu/nova/core/pramin.rst | 125 +++++++++++++++++++++++++
>  Documentation/gpu/nova/index.rst       |   1 +
>  2 files changed, 126 insertions(+)
>  create mode 100644 Documentation/gpu/nova/core/pramin.rst
>
> diff --git a/Documentation/gpu/nova/core/pramin.rst b/Documentation/gpu/n=
ova/core/pramin.rst
> new file mode 100644
> index 000000000000..55ec9d920629
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/pramin.rst
> @@ -0,0 +1,125 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +PRAMIN aperture mechanism
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +.. note::
> +   The following description is approximate and current as of the Ampere=
 family.
> +   It may change for future generations and is intended to assist in und=
erstanding
> +   the driver code.
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +PRAMIN is a hardware aperture mechanism that provides CPU access to GPU =
Video RAM (VRAM) before
> +the GPU's Memory Management Unit (MMU) and page tables are initialized. =
This 1MB sliding window,
> +located at a fixed offset within BAR0, is essential for setting up page =
tables and other critical
> +GPU data structures without relying on the GPU's MMU.
> +
> +Architecture Overview
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The PRAMIN aperture mechanism is logically implemented by the GPU's PBUS=
 (PCIe Bus Controller Unit)
> +and provides a CPU-accessible window into VRAM through the PCIe interfac=
e::
> +
> +    +-----------------+    PCIe     +------------------------------+
> +    |      CPU        |<----------->|           GPU                |
> +    +-----------------+             |                              |
> +                                    |  +----------------------+    |
> +                                    |  |       PBUS           |    |
> +                                    |  |  (Bus Controller)    |    |
> +                                    |  |                      |    |
> +                                    |  |  +--------------+<------------ =
(window starts at
> +                                    |  |  |   PRAMIN     |    |    |    =
 BAR0 + 0x700000)
> +                                    |  |  |   Window     |    |    |
> +                                    |  |  |   (1MB)      |    |    |
> +                                    |  |  +--------------+    |    |
> +                                    |  |         |            |    |
> +                                    |  +---------|------------+    |
> +                                    |            |                 |
> +                                    |            v                 |
> +                                    |  +----------------------+<--------=
---- (Program PRAMIN to any
> +                                    |  |       VRAM           |    |    =
64KB-aligned VRAM boundary)
> +                                    |  |    (Several GBs)     |    |
> +                                    |  |                      |    |
> +                                    |  |  FB[0x000000000000]  |    |
> +                                    |  |          ...         |    |
> +                                    |  |  FB[0x7FFFFFFFFFF]   |    |
> +                                    |  +----------------------+    |
> +                                    +------------------------------+
> +
> +PBUS (PCIe Bus Controller) is responsible for, among other things, handl=
ing MMIO
> +accesses to the BAR registers.
> +
> +PRAMIN Window Operation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The PRAMIN window provides a 1MB sliding aperture that can be reposition=
ed over
> +the entire VRAM address space using the ``NV_PBUS_BAR0_WINDOW`` register=
.
> +
> +Window Control Mechanism
> +-------------------------
> +
> +The window position is controlled via the PBUS ``BAR0_WINDOW`` register:=
:

This repeats the sentence of `PRAMIN Window Operation`. Let's remove
that sentence.

> +
> +    NV_PBUS_BAR0_WINDOW Register (0x1700):
> +    +-------+--------+--------------------------------------+
> +    | 31:26 | 25:24  |               23:0                   |
> +    | RSVD  | TARGET |            BASE_ADDR                 |
> +    |       |        |        (bits 39:16 of VRAM address)  |
> +    +-------+--------+--------------------------------------+
> +
> +    BASE_ADDR field (bits 23:0):
> +    - Contains bits [39:16] of the target VRAM address
> +    - Provides 40-bit (1TB) address space coverage
> +    - Must be programmed with 64KB-aligned addresses

This reads a bit like filler - let's turn this into a single sentence,
of just keep the first point - the other two are deducible from it.

