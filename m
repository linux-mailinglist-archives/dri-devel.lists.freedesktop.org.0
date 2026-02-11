Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDBAFC/wjGmSvgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:10:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E52127A18
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4C110E652;
	Wed, 11 Feb 2026 21:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vwxlpt/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011024.outbound.protection.outlook.com [52.101.62.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EDF10E64E;
 Wed, 11 Feb 2026 21:10:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHC0+bauQI9QiOmn1Nav/pWKqqFIhJFy1bOUsFMG3OX1YvlQtZhPF+Rwr+H8RJj/gZ5IaQ6cm4aBuMed8UVb29eaMuvI/QjC9MgdaOCBSkJ+3dT2HKLp9EgOBOkQ7XOGl7jxQbIFWH/0z/KCTd/8Kjgf62h7Vc+PFWBcvLaoa6bf8N8Us1gzZxEMbncC4GKC+Aqx6N5+HQGp61KF+3LzavYhbjRrt/VO8DcY2mmXR21RmWuy+XA4LxO55cR7GQTqLfXp+FNQ1fT0KxxZ8r5Y049LXz4Ijh7iXONXNTHLbmw/wNkKpXXa/yZZPXMqwun6iVmyJEr7J6XMzj3kIYOvzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7NItHoL8gxNs73+pSKuSEEB0crjNkdf0RUVsGEeAL8=;
 b=PLv9yIgB12QxCFE/QJ2JlNz9d2rlyvGVxVKn9TN1ZVsRQFqhz/xN9sp0rEf+wHQP7KoOhoWdlAnWmucYC74Kw8MEnK73hkd/PfMmTkHe8ynXjks/hDOznM2pgyHhX3BZGeCArdJUcXvQJ68xKWKs3XiwkGAVb93L+azfqyuG4VO9Frg6flu7sJwahwImrmyI8ebWGjh1+GRN9Wub+vuAij2EOop/gItvlC7HyjIrodz1tHI/Nl3koeykk28OCBe9cYWLjamLacQZhItQZkHhJkFjyGGaSXkHGtaogsq6X27qATxoiJ4MHJWmP2oVlyz+3LT59aorz7q+FHSqkSqSVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7NItHoL8gxNs73+pSKuSEEB0crjNkdf0RUVsGEeAL8=;
 b=Vwxlpt/2iXyTfyyMDAfewLXxAqp+jppFFLjsFzSGcjDBDDSbyEWwd8NqoIGP2Cem37KUnAxBTHioYHmjVugdzDy6InAQsaj0xi3sVT+3gOf1c+8ZsuVxm/d6pvVUP+UeEk4MHGtlNw6xBKjaUW/43i1/bT6XpKcZ4gtBcdhQ7FwClYcKHQ4OZPh8MyzeTb1ts2QyAT4U7FBPus+O+fR8HldtP3J3TScD9tTh8FiepiIh2SH6UHQEGFn7cSt/Sg1p/sTdq8oRGIKQFymmlVQyhMyGv0xy0ghYW3Ho/zUNwek3iV8+TfUOxv1TnkGTilcfC85ZQWU+poUvQolXfJaPHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ2PR12MB8737.namprd12.prod.outlook.com (2603:10b6:a03:545::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Wed, 11 Feb
 2026 21:09:54 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 21:09:53 +0000
Date: Wed, 11 Feb 2026 16:09:52 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH -next v8 1/3] rust: clist: Add support to interface with
 C linked lists
Message-ID: <20260211210952.GA3632639@joelbox2>
References: <20260209214246.2783990-1-joelagnelf@nvidia.com>
 <20260209214246.2783990-2-joelagnelf@nvidia.com>
 <DGB75XMWML8M.DFZY5L52EBQF@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGB75XMWML8M.DFZY5L52EBQF@kernel.org>
X-ClientProxiedBy: MN0PR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:208:530::35) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ2PR12MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: d00de529-7934-4f5d-7067-08de69b1e6d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jnCfBESEkoPfzjz5+hh3wcsyIKg3eZcatPaJlPKndk6phrh8IeMc+9qsUabg?=
 =?us-ascii?Q?H5Htigjt1YaHVqo934o06QAXXxg4W2DFUnEooHZUkPe/t3umtHS5nK82Jkpq?=
 =?us-ascii?Q?FIFBwKcbOqnwNMNQoE3AO++gbANLW10/0HvXb/I+dgY9xSqZq/qQz7fE6gAO?=
 =?us-ascii?Q?l96vT+3HU9g2JiPZGwiWV8MrXwJeA4PkwJdFLq1vFKx/fSzrJ7fnn8tlD0XF?=
 =?us-ascii?Q?nlcBoG4uTu7fRiF42cYjdCt8CeMvCTZXydcNwxrqvU+VXbYFaMm9rIByHU7l?=
 =?us-ascii?Q?WogZGedo3fkBY4oYmiMO4hfW8ONz01gqOOODOirBju0TXjr9tku9pDdKTjYD?=
 =?us-ascii?Q?8jOWM7sINMrg7pcJtSaOcvUz0W5Zfx1Ddv0m4UUc2AdWfAeTRO0OgL0IWvzw?=
 =?us-ascii?Q?C0PimN8+3gEy+Rq48fS+W11chLX8S7w9inIV0vkoEgG4hqi8pww2I8lVClht?=
 =?us-ascii?Q?bf1ZI74QmvAfQBCP9RWVNXdboJqwNQ60P+KXOjDt8dIaqWfp3YynZAs3fVO0?=
 =?us-ascii?Q?Hcsx8wBTFHltDAO7OC2vMenIPB7IK0ifgwWkYzd/VGTJRx27OUzGmJ/vaHNX?=
 =?us-ascii?Q?BkLdS9IIZh1//G5w9yuAjfrKuaZbuHRYegQpdntO7pf1OzQPsQ+fr1jFIBF0?=
 =?us-ascii?Q?2uor35lFiS7DyXgj5bvnHdlhv540h5rTFVsiCKOWCgs+GGNNdyx71GjWxBMG?=
 =?us-ascii?Q?pJX3HNvLhCyPCJNcWELKfzokMpWoyxa5qNQTQTnklWQUNEshGN7Q/0B09y/v?=
 =?us-ascii?Q?MJ8m1d/BC0nf434eLUFeF5ntSjxp3PPaHX4mp0WogPD/Qf+R01m3k723eSu+?=
 =?us-ascii?Q?0gVKvBA/Mmipaov2gVd5i71YiRX2Ytc4AczW9rjb0S0+xnjM3S+GyV+PhR2W?=
 =?us-ascii?Q?1lF+q2hZvXWouHCG5zqfKjbfl7942oh/zAhvIXQFGPvz8Fxuq3H39ljdpr3M?=
 =?us-ascii?Q?06yHwdmprSNfiA5oVjyZNY1fDELNipP1WqLirTL56h3sS/18oa4DHZ1G+sLf?=
 =?us-ascii?Q?U9NHXKo9AqHKgLmwlRbwEOoRRIa4vlFMvnUpTmdbNC6GS2v936ITUSgavKdO?=
 =?us-ascii?Q?KxAYICZpkQptdCHh9VJ1oggW7FP+Hhump6ZDCgt27vyaeh6P2y84i89OeLu7?=
 =?us-ascii?Q?Tf5Yu7acCdCnUiA1PPwbokwNwljQYEMPnBAKfRrPZv7KtHP080pWiq7yC5qm?=
 =?us-ascii?Q?aZMzyUHqpHspJlLk8XjzGbCrVrswuAvJJWrwZsHrWdzb/dJ/n7/BbzGL2j7i?=
 =?us-ascii?Q?aSWJuo4s//Rn5ckDyfxwMfKdMuYCFutdE0hnVedpMNMc23gTnI1Xaapx8XnS?=
 =?us-ascii?Q?VxkhfucK22qRui6rAeCs20RiumWBSAx9TXCX8Wz1YHTq4e72YcUxEt6o0UNJ?=
 =?us-ascii?Q?mz8OGlmWjCVgJELH3hhAHAVeu/NkyuoTzpJ71X6r9b//sElJYVto3QgUumH6?=
 =?us-ascii?Q?HAhcHiZRKQIKYmnwg7A/3ZO7/6rT+ZtXmqMTNi1urOUPA1rV1NOuDwrYCdVf?=
 =?us-ascii?Q?D2ZnntIaype3zzZv9ig7N2qW4AWQR3opTUD69Cfmqwgm5VBHW8gGGbprh5b0?=
 =?us-ascii?Q?rgXH+L1lGZV3boFOHdg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0O/U+DoOiK5nL7dqmD6Es7vEs0WKpE1JVB3SJ1eEv7I2ALDv8jcP/U8popgb?=
 =?us-ascii?Q?aApqb9AgYXEMpP2dsDLSsRH4e6Y9j+8Bvo/Ss+2l64gPfUFrfAXZFP54fb1b?=
 =?us-ascii?Q?NPgHA/HD1jGGgZPyalMrF9G5oeqbVLHtpWm6c51JKeGJku9EFpEA93F8O64i?=
 =?us-ascii?Q?HuO/aVR74XrlBHuL2ykxasjSuBrfPElTgOcPyAq87NzoGJPDNweMcOJ8l5U2?=
 =?us-ascii?Q?IzM9EgyY0aAS07q5jrR2/YDtrJ8f7hrsAhv72e37P7gQmrMXfAJK29m8fQXE?=
 =?us-ascii?Q?1GtNf/zPpglJpqmmlZTFdoA0LURysml634Sd80OSnwTipqsB40pSSoT2Gcrt?=
 =?us-ascii?Q?1KCnzQGbByuRvLUwEdLZXitr6Eobeesrgw9feEDcbZfDo4Jw85RegfSNprUt?=
 =?us-ascii?Q?jVb91H9dE4KSRbSGrb7V1odwOlOhTtSTE/o0W93sW30EWdnPPqf51iJ9usM3?=
 =?us-ascii?Q?iTn0oMQXJm4YfcAXHs0YhF0CUKTj8qj5WCAyDB8NGSC3LS2p9KgWSA3w1SCX?=
 =?us-ascii?Q?m2TEbQnbCWdh6HaPldkSmWistbUvSCyZ+95WgW8eJQyYbiY9xM2dP04+1g6z?=
 =?us-ascii?Q?E9V72sctzsaE8/qAnilKZP0pAdc7UDiHCnlNiUj84wbcJiiCThLKzXiU6Uce?=
 =?us-ascii?Q?KXchEZ7FPIC4rp8sHXMO3LOfb7/stVkyytMxq0GMDppVzcsKFtmLTFeCUf5q?=
 =?us-ascii?Q?ThWdr9XkaPErBIaoFjFcyV4vSxGfmmP3+C8HczEvi7Ikd0+ONewCWr70+ZBT?=
 =?us-ascii?Q?Oid2KOhaWIU3BrXebB6x1mQPliT24JF0KPcoUe2TpXud2EK4uPHRNWGktZzb?=
 =?us-ascii?Q?Dpc89obmom1FZ85Gc+L2l9e9dGiMdKq+EN+MjzosFucIohlSg/IppNpEQXrQ?=
 =?us-ascii?Q?JpP0lhDC1I+z4APkdFx5HiOTZfczXA3teP4ChW3bmNedG4NkgtAfiuNvESRo?=
 =?us-ascii?Q?VEvqA8bfVEc6OwtLj8iEd9gpx1TlT3mePvGHFoTiNNiC4AjEYP74sn5gLuW+?=
 =?us-ascii?Q?J8rPeW9bOkZ4/Hrwa0783bc5pNSQTHAfJWVCMEydr1y010Km7GXgOT1XvjJN?=
 =?us-ascii?Q?GeMGe8bqj8lH3ZUpBCKxWSDHf1qy+KYXoty64mcH9Kfw82uzpY9A5oQ4SDnp?=
 =?us-ascii?Q?hvYauRQCRHXIEqzappzIaUVj6KrfKQ+V/fu1SOnvJiIBlygs1mW2C/CsaYnW?=
 =?us-ascii?Q?bzVB+tvGzN1IN3i+54cyKEh6BT4yzgo4Ni/sG+V+lSfYtYTLrjLK+q4BiC7z?=
 =?us-ascii?Q?4I0p0dAmkmu1qk/B2vrJd8pLO8wYH25W8XEAUuhUx0EFZoUNn77snq9rzZhW?=
 =?us-ascii?Q?TMgtseiariR/0Ring3ZfdQghZfFy1Ql5ePHIDzqANrldh/Nd2IOadkXKJeav?=
 =?us-ascii?Q?fcW9S+FMNo43WGORKyHz3SkJSsQn9XqnT4bAaVuuglCru62iVO/N9Vuvjzhv?=
 =?us-ascii?Q?NHMaE4irO2VNPLMYhZJlFp7WBLFPHPXmqfE6YB0v0OQBWSTPD3t9MzsWfyb5?=
 =?us-ascii?Q?yF46oa/B6r4KNC0MSOhSOqpmSCEO1Frzqb9g2gBWseQBxO0QVfhqQPI5Xepz?=
 =?us-ascii?Q?UsfBq65zjga3MOlwtp03t5OTVMSP5Fqv/PU6BCcyB8JnF8Xi+EQXNMRuYPVN?=
 =?us-ascii?Q?bPeD1KilTqZCUK9uV09/tho943o+ABQ9Rr+8/cbKjTddTEG/0ajiM8vkZeFO?=
 =?us-ascii?Q?+gBGlwK1m8lglV6sa9fQZ5q3ojSCGGHHaavKwowoD0MRe1nw4L1Ydras8rCq?=
 =?us-ascii?Q?TBJ5Y4I4yA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d00de529-7934-4f5d-7067-08de69b1e6d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:09:53.8366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkCbhmDP0EEcyjHN3uiQF0rWTL1BjYHsGCXHlHQzLXWlFnFgawQU/8S5UlXBabuM3xrvnPb4VmYUtHRau5+1YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8737
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
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: D7E52127A18
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 11:07:37AM +0100, Danilo Krummrich wrote:
> On Mon Feb 9, 2026 at 10:42 PM CET, Joel Fernandes wrote:
> >  rust/kernel/clist.rs   | 320 +++++++++++++++++++++++++++++++++++++++++
> 
> I think we should move this under rust/kernel/ffi/ to make it obvious that this
> is FFI infrastructure.
> 
> > diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
> > new file mode 100644
> > index 000000000000..8aa72b5d54be
> > --- /dev/null
> > +++ b/rust/kernel/clist.rs
> > @@ -0,0 +1,320 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! A C doubly circular intrusive linked list interface for rust code.
> 
> Here and in the struct documentation, I'd suggest to clearly point out the
> use-cases, i.e. that this infrastructure is for FFI use-cases only and should
> not be used otherwise in drivers, etc

I am curious why we would not want to have drivers be able to use CList. I
thought that was the point of making it pub at the module/item level as well.
I think it is possible a rust driver may have a reference to a CList in the
future.

But I will update the current usecase above, as you suggested, good point.

thanks,

 - Joel

