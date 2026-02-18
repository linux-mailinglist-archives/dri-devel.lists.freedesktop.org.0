Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCUVGFctlmm5bwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1061C159DFD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369C210E65E;
	Wed, 18 Feb 2026 21:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fHHDqb2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012064.outbound.protection.outlook.com [52.101.48.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9060B10E632;
 Wed, 18 Feb 2026 21:21:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djnkEqR7li8cFLkL5gQu+dLW0TIVIpWuqGUsTGl7XcI+UCzZShE1KPQD7dobGFttimkt+hfMma8+mCXzTynndnXSNC5rKPcZq66LAeHwFHrup2bdMQN5i6U4OrYjF5SS7OGETL3X5ks1Svus5znWmfo/j/7b0ooKxkhkM8fhq2kAvtUP1d1WOwoJYczhazQPQjPSaOp41WSa12dBJWVhM+KchKXBMuD1D3HVuAwGnI53IfFLwH61nZuxqG7Boyqf3D38UXJXZUT8uSwXP0fFX33nghBb6UQOHGsSgkPRpF66SzihyKXuQryVBKfNbxT/hoIv5ZVsQf081YigyNBnLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4tZ18WQZI7pLjM2fqO+4IeV6mqiYFjqZZxeqcdkr3o=;
 b=VI9M2rsBcO8Bp16O93UtrDZXuB1rhiAtksIZfVsrvN+8BRQj1sHL1GA4Sz9eIUpm/EpIUokQe6AAHOJ0PDErQl7OXrLywT4PsCEBXNpSYedzzVLXXpN3FgyVZKe2e59bVTh2L2WzWLC8iiTBT7FlPsOpBhzTxOcnAhyZIKOoKdCNpRdZoTJu3qtG1UhtXh8WWyY9urfGMmtEZ/sp/dUA7OYL5mk8lkgerDDH8go6OEFc6T3P9TkPbLuf+rBSIzO7+6nYvi2E7pZFfCFnzVWlUSrH06SVYbAmKk+fBlx9b7T7NWGNYK/4Om7awks389xuIiTWLxl9y0/RjGGhIofgbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4tZ18WQZI7pLjM2fqO+4IeV6mqiYFjqZZxeqcdkr3o=;
 b=fHHDqb2LU//X6Fvy6w6RPHNUvsxYqG37s8ILQhI1qCUk64HNRBJVL/B5NZOwg6406ix8zMyT7yR2yPTsgtS0d9nciuNRBsCD4Q3tK5J8LXEdyqtqS6WUODl2wVnUziTYwAo04SzXUzfHA+qJcCWabWGo+C7AeXWpa9NmphlYFU1wUdMV5gWi1Vxp48mKmAbLzTpNV41w0LhOJ5nv+UvmHc6rT3dD+VVGenU3DHDIG4rKA3gsTDJ/7Jrwlv5y5dFd7XK4FkZtrBYzu3mmHFShdo51JVNADYUb0wg8qCr6O5qeRtjW0BeKDp28D066J3aP9UfZDnIOA0GbKCEFRQeDMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:15 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:15 +0000
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
Subject: [PATCH v7 07/23] nova-core: mm: Add MMU v2 page table types
Date: Wed, 18 Feb 2026 16:20:04 -0500
Message-Id: <20260218212020.800836-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0008.namprd15.prod.outlook.com
 (2603:10b6:207:17::21) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: c0a2b8f9-cdfa-4785-d8d1-08de6f33a60a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UfPnU7CD8EO8TsSc62Uja6fHyAB3PZqhHAvhOjleWPtyhMinab23UEAAOQ2x?=
 =?us-ascii?Q?1y3qYodljujYUzo/ujk57Y5btKRxXOQ8+eDrol4z7FNNmTLCzTRBeq0N36+i?=
 =?us-ascii?Q?QCzQSGC+og/1h3qKvBJdi5uoEGgXh0jC8bv1nncLJxcE+7EUUpXZTVS5/g9+?=
 =?us-ascii?Q?TkdrsbYQJ2nlp07xlXiapfXvCugT1z4orIBr+/sl9sQsdXMduwfBKPNOHNOc?=
 =?us-ascii?Q?Y4+5f5ReiYQpzAOrP4Phmjgq/j7lUBDXIofa7Z9MxjUg/msmP5plqZZ/ivVh?=
 =?us-ascii?Q?jcmKIEMqeSOGj3c7T9aAZUtaMIOKZb/+9/9GXIaFPdf+QZhZVU4xeL4t79qO?=
 =?us-ascii?Q?gSxSJae6R5ua+4Vl8GQ5fWWCvfghlfwjdPfyX5nspKUs7wX5Dmz5eRb74hN2?=
 =?us-ascii?Q?VJYc4UByocGm15fheSfrQLwWo7YrZoFW2ntpz8uuSKaNnw1l/we2IVfPSLFd?=
 =?us-ascii?Q?spH/g6PxDTCpmGBHf8WHFeeLeusFLrx8TpD8JG0mlYAzIKwB6zD5ZqCNwjtI?=
 =?us-ascii?Q?t4ysVCOXw5cAujD4UI3vxLUtOQmnlsVldr40GtvpxgepAcNVXHT/tBR64D4H?=
 =?us-ascii?Q?bzxlQdPQDgE5Q14/ODvmykrDzJoEy9jO5UR5JBKRorDMqw7r3/3YmeuyQYvU?=
 =?us-ascii?Q?PPDiOvFtnfDBoWfBQXy32ImkbZYNCPWa1bqXaqokfkmt4+YdslbA8Oyod0xJ?=
 =?us-ascii?Q?bTISeiV/1FGvHifHPFYpYQmJAHLTPpK/SjiZaYCyOkd1+Cl4iLg5Towl9SKa?=
 =?us-ascii?Q?PMRp9+6OepXtbDUI9IbUp3lImOMwjkdiJBB7CF04Jiyeu7tUYlpPrtd+ELS7?=
 =?us-ascii?Q?dvlNKnbdb0avQkzrjA1BLRHcH1PjRUqw1A/Cz3OAY601j2k4yvRVkxe94u2h?=
 =?us-ascii?Q?RAaTzDvKoPlTIMOBzZmRKeQTHy1xuG6Br3WMP6F37+Y215djzwIqWUeq+Rpa?=
 =?us-ascii?Q?IUVLMb58i2Es/ei1QpAi6opoBW+r24e4aCyh+EjC/lCIUxOmuh+1/a69QRlR?=
 =?us-ascii?Q?SrWa0nzDgPbnJb6GTbMFmsWwYsrF4lriD2hKJR47EVHgId3HSjR1w9w6SHkU?=
 =?us-ascii?Q?2OgX4DPVKB6FNb0lqaZWULLgO2FdsdUXjnTRNdLTjN1BWloAEcz0Ld9V/yzQ?=
 =?us-ascii?Q?bNC+9ZTxHTs52vdlvfjFeypS/3xd5Ko2d4MSpnLHm4oWYwSrZYY0guogNs72?=
 =?us-ascii?Q?VjrCbMf1xzD0MeYNVKm4OrMgco43+zEFKm4yC7oOzjRQkhyEAUvGHIDYU7wD?=
 =?us-ascii?Q?wvbTbjJ9LEIMsprvoVQB1K8HfRh61HE4IOFrO8ip0ocUJJKOTmlTFC3uJSMJ?=
 =?us-ascii?Q?rnNkp6d3HvV4dNw/IlABjg9UIgtGxV1SyK02qs94Ky6hnaeJuDuZ/lY8T/65?=
 =?us-ascii?Q?EAUYkb3biMk2AKqGmFnVbizwCZ2AqLJesfA/Lll53sjbch699pzpZ2NnE8u1?=
 =?us-ascii?Q?VOBCAP2zT7JSMPY52tfgV+n/lyDAMbQA9MXSto3z2pEYRk6kJ+1ZxfUeDxLm?=
 =?us-ascii?Q?0KibriIM3ncX/lOgz/HpbgYibCON3QgVfzTxdMh4BItco205aWktq1Dv156N?=
 =?us-ascii?Q?kUAI6zO8tfkUiqlZ4I8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CHMNmtKVhg48NXOsBpK1b7hlb0uN/Aor7ru05vAFTTU2UN0LexPDCkMKYC3l?=
 =?us-ascii?Q?pja8sNCb9TTOFpS+xheze5zIAVSqHQcm/nw15NW3Pr2O/VKOyMeNvSk/5+XG?=
 =?us-ascii?Q?vaQtymgoZoCynvel0Zm5O2hDZUS3JjYdxPbA0HVUVqLOarUdG2bU9GSz+T/9?=
 =?us-ascii?Q?WA4sSRZeouWnbInmgjUnHMocbdxMySz6ImplrunGRp6D0iiGuit3C78DB9OU?=
 =?us-ascii?Q?3tnqdMazxQW0KVgniEzS9K9o7FnsvYpsH/xpZ1omMC9jIdrCgDUwCAifvMxm?=
 =?us-ascii?Q?n0p1IjB01R00s4PvMgLhr+3CLqvScZkp31iK/vFJbGy/6KF0SfzwbDASoEDf?=
 =?us-ascii?Q?3AQ4UgbN/+KfwIE8DChgifU7mc4qey4HlCgl7a4pTyqj2Yss5E+0rrQ2blMv?=
 =?us-ascii?Q?gyTH1wSznKNSrz2HCNixY2CH4dowco4Pl5qL3O4hKR+AMerI8n2+jrA7bEBg?=
 =?us-ascii?Q?V889vjXMqceMBOe6SvWelx2hnXRPGca2OnciexcNyxBxV+IrZsxpeUAJ3P14?=
 =?us-ascii?Q?ZetDzBVhOEGeuYbLc+P4LkcwgG/6HRFU5po6Zc6fzRXrAdtffRWjRzfuaT+q?=
 =?us-ascii?Q?HG529Xrz8qQ1ZmtgyNa9gJxGrzfNyAlu9ZPTdZ+pT2ea3rWcIEt9cDluWThp?=
 =?us-ascii?Q?HQSKvnahmCvyRWpvSZWPbEZrMHdDi26nc4TcwTG5Gs229wtNCVcclqYZ3pP7?=
 =?us-ascii?Q?ERikWWUkAavpqw4lW1+54AW79l8QW00yhit5kEdszfAFB4P7SCEqq2v6uDx7?=
 =?us-ascii?Q?uvlDlRSNoSjt2ngv+yhzZxW4M8ZTeMxdq6gb6dC5lgAKoNWQlqGGHD2PRLSH?=
 =?us-ascii?Q?L6dcNi3n3IMNnmI7fww1c+eej4FepSvq/sEr4E2IcAiH8wDQrM64A7naYYZw?=
 =?us-ascii?Q?yjq/6gGMYP9mIy8fBPA2nOExe5eSgm4Dl6QgRPA4vzglSrcvdHHgt/+nen/W?=
 =?us-ascii?Q?cu8lhvLEVcvE64LVFrsrf63DFZkDWUIDlT/vQSq7T6qfGfYG+6aERpb1Y43t?=
 =?us-ascii?Q?BQSckOYd4lngmU1EEYFG6i6j/bw6N5xpdbrBeaL9L8ylii/IjvC9dueTtv44?=
 =?us-ascii?Q?KHou58wTu5qFwZOLq/UImvrgbMi1XFdIU5Io7fsziHepcLSV0MTeKlxXFsBc?=
 =?us-ascii?Q?IxAZ0HHgA5SB9S0BrYSzTkAwyx+c3iCgLZ1mCdnp3Nh4og9jypXU7MbClWEF?=
 =?us-ascii?Q?6EoBs3wYkRp2fLABECvvxQRj9+unlOVzKtyBaK9PVewygezdjAHY23pn3vFw?=
 =?us-ascii?Q?wkSudRDAkcnWazt6zkt35roVFEJHlwMHG1XVlzACSmGp6k4mRtD+eNCG5ev7?=
 =?us-ascii?Q?D1ZCChEmhEoxXNyDl0Qd1fV1a1+hP/pnDIFXfUHPqWMMIrFIs/JSlIyWGW3r?=
 =?us-ascii?Q?9YfJ39Z25MnRGIsJem8wq90dk6q+GKLLhCdcKFgXp1zQ6RQDsjH8OZ5h77ru?=
 =?us-ascii?Q?uqt0RB4OLMJ7MkPPdZgMLCfOmK7nU4OoLCs6r7/yCJ266t+vJ6JXabWQx6I6?=
 =?us-ascii?Q?MLVN0tMDI0wfO5XBqKdkdWIxiknXAtw9ktWRxnnbdLWpe3aQ0U8bvWr1O83D?=
 =?us-ascii?Q?luTMsHWOAxQE+OPChqwAQEM+RO9mhuFQ97JGYA1CDPBQInKDcD072IwyZDo5?=
 =?us-ascii?Q?yXtCB87lg1L3ELCrY7YmEwV2P6s807VU94PXCG4NT3IzlaPWg4XeQkpRoqo/?=
 =?us-ascii?Q?Fu2nvmGR818BSJsqu5qiREj7pNT23qNPo0TMN7hMTRLdagQqDeoAPrlxaOr3?=
 =?us-ascii?Q?VCL2Ik5UBQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a2b8f9-cdfa-4785-d8d1-08de6f33a60a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:15.5257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSMzduwJj1RQqEq3l2yZMmwpwq44fiqjIM00mi7x0MY3r6eNP32d8Sg8wDUlhdqwMpLpckfCNDOKSVEK7XEpBg==
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 1061C159DFD
X-Rspamd-Action: no action

Add page table entry and directory structures for MMU version 2
used by Turing/Ampere/Ada GPUs.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/pagetable/mod.rs  |   1 +
 drivers/gpu/nova-core/mm/pagetable/ver2.rs | 199 +++++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/ver2.rs

diff --git a/drivers/gpu/nova-core/mm/pagetable/mod.rs b/drivers/gpu/nova-core/mm/pagetable/mod.rs
index aea06e5da4ff..925063fde45d 100644
--- a/drivers/gpu/nova-core/mm/pagetable/mod.rs
+++ b/drivers/gpu/nova-core/mm/pagetable/mod.rs
@@ -7,6 +7,7 @@
 //! - Memory aperture types for PDEs and PTEs
 
 #![expect(dead_code)]
+pub(crate) mod ver2;
 
 use crate::gpu::Architecture;
 
diff --git a/drivers/gpu/nova-core/mm/pagetable/ver2.rs b/drivers/gpu/nova-core/mm/pagetable/ver2.rs
new file mode 100644
index 000000000000..d30a9a8bddbd
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pagetable/ver2.rs
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! MMU v2 page table types for Turing and Ampere GPUs.
+//!
+//! This module defines MMU version 2 specific types (Turing, Ampere and Ada GPUs).
+//!
+//! Bit field layouts derived from the NVIDIA OpenRM documentation:
+//! `open-gpu-kernel-modules/src/common/inc/swref/published/turing/tu102/dev_mmu.h`
+
+#![expect(dead_code)]
+
+use super::{
+    AperturePde,
+    AperturePte,
+    PageTableLevel, //
+};
+use crate::mm::{
+    Pfn,
+    VramAddress, //
+};
+
+/// PDE levels for MMU v2 (5-level hierarchy: PDB -> L1 -> L2 -> L3 -> L4).
+pub(crate) const PDE_LEVELS: &[PageTableLevel] = &[
+    PageTableLevel::Pdb,
+    PageTableLevel::L1,
+    PageTableLevel::L2,
+    PageTableLevel::L3,
+];
+
+/// PTE level for MMU v2.
+pub(crate) const PTE_LEVEL: PageTableLevel = PageTableLevel::L4;
+
+/// Dual PDE level for MMU v2 (128-bit entries).
+pub(crate) const DUAL_PDE_LEVEL: PageTableLevel = PageTableLevel::L3;
+
+// Page Table Entry (PTE) for MMU v2 - 64-bit entry at level 4.
+bitfield! {
+    pub(crate) struct Pte(u64), "Page Table Entry for MMU v2" {
+        0:0     valid               as bool, "Entry is valid";
+        2:1     aperture            as u8 => AperturePte, "Memory aperture type";
+        3:3     volatile            as bool, "Volatile (bypass L2 cache)";
+        4:4     encrypted           as bool, "Encryption enabled (Confidential Computing)";
+        5:5     privilege           as bool, "Privileged access only";
+        6:6     read_only           as bool, "Write protection";
+        7:7     atomic_disable      as bool, "Atomic operations disabled";
+        53:8    frame_number_sys    as u64 => Pfn, "Frame number for system memory";
+        32:8    frame_number_vid    as u64 => Pfn, "Frame number for video memory";
+        35:33   peer_id             as u8, "Peer GPU ID for peer memory (0-7)";
+        53:36   comptagline         as u32, "Compression tag line bits";
+        63:56   kind                as u8, "Surface kind/format";
+    }
+}
+
+impl Pte {
+    /// Create a PTE from a `u64` value.
+    pub(crate) fn new(val: u64) -> Self {
+        Self(val)
+    }
+
+    /// Create a valid PTE for video memory.
+    pub(crate) fn new_vram(pfn: Pfn, writable: bool) -> Self {
+        Self::default()
+            .set_valid(true)
+            .set_aperture(AperturePte::VideoMemory)
+            .set_frame_number_vid(pfn)
+            .set_read_only(!writable)
+    }
+
+    /// Create an invalid PTE.
+    pub(crate) fn invalid() -> Self {
+        Self::default()
+    }
+
+    /// Get the frame number based on aperture type.
+    pub(crate) fn frame_number(&self) -> Pfn {
+        match self.aperture() {
+            AperturePte::VideoMemory => self.frame_number_vid(),
+            _ => self.frame_number_sys(),
+        }
+    }
+
+    /// Get the raw `u64` value.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        self.0
+    }
+}
+
+// Page Directory Entry (PDE) for MMU v2 - 64-bit entry at levels 0-2.
+bitfield! {
+    pub(crate) struct Pde(u64), "Page Directory Entry for MMU v2" {
+        0:0     valid_inverted      as bool, "Valid bit (inverted logic)";
+        2:1     aperture            as u8 => AperturePde, "Memory aperture type";
+        3:3     volatile            as bool, "Volatile (bypass L2 cache)";
+        5:5     no_ats              as bool, "Disable Address Translation Services";
+        53:8    table_frame_sys     as u64 => Pfn, "Table frame number for system memory";
+        32:8    table_frame_vid     as u64 => Pfn, "Table frame number for video memory";
+        35:33   peer_id             as u8, "Peer GPU ID (0-7)";
+    }
+}
+
+impl Pde {
+    /// Create a PDE from a `u64` value.
+    pub(crate) fn new(val: u64) -> Self {
+        Self(val)
+    }
+
+    /// Create a valid PDE pointing to a page table in video memory.
+    pub(crate) fn new_vram(table_pfn: Pfn) -> Self {
+        Self::default()
+            .set_valid_inverted(false) // 0 = valid
+            .set_aperture(AperturePde::VideoMemory)
+            .set_table_frame_vid(table_pfn)
+    }
+
+    /// Create an invalid PDE.
+    pub(crate) fn invalid() -> Self {
+        Self::default()
+            .set_valid_inverted(true)
+            .set_aperture(AperturePde::Invalid)
+    }
+
+    /// Check if this PDE is valid.
+    pub(crate) fn is_valid(&self) -> bool {
+        !self.valid_inverted() && self.aperture() != AperturePde::Invalid
+    }
+
+    /// Get the table frame number based on aperture type.
+    pub(crate) fn table_frame(&self) -> Pfn {
+        match self.aperture() {
+            AperturePde::VideoMemory => self.table_frame_vid(),
+            _ => self.table_frame_sys(),
+        }
+    }
+
+    /// Get the VRAM address of the page table.
+    pub(crate) fn table_vram_address(&self) -> VramAddress {
+        debug_assert!(
+            self.aperture() == AperturePde::VideoMemory,
+            "table_vram_address called on non-VRAM PDE (aperture: {:?})",
+            self.aperture()
+        );
+        VramAddress::from(self.table_frame_vid())
+    }
+
+    /// Get the raw `u64` value of the PDE.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        self.0
+    }
+}
+
+/// Dual PDE at Level 3 - 128-bit entry of Large/Small Page Table pointers.
+///
+/// The dual PDE supports both large (64KB) and small (4KB) page tables.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+pub(crate) struct DualPde {
+    /// Large/Big Page Table pointer (lower 64 bits).
+    pub big: Pde,
+    /// Small Page Table pointer (upper 64 bits).
+    pub small: Pde,
+}
+
+impl DualPde {
+    /// Create a dual PDE from raw 128-bit value (two `u64`s).
+    pub(crate) fn new(big: u64, small: u64) -> Self {
+        Self {
+            big: Pde::new(big),
+            small: Pde::new(small),
+        }
+    }
+
+    /// Create a dual PDE with only the small page table pointer set.
+    ///
+    /// Note: The big (LPT) portion is set to 0, not `Pde::invalid()`.
+    /// According to hardware documentation, clearing bit 0 of the 128-bit
+    /// entry makes the PDE behave as a "normal" PDE. Using `Pde::invalid()`
+    /// would set bit 0 (valid_inverted), which breaks page table walking.
+    pub(crate) fn new_small(table_pfn: Pfn) -> Self {
+        Self {
+            big: Pde::new(0),
+            small: Pde::new_vram(table_pfn),
+        }
+    }
+
+    /// Check if the small page table pointer is valid.
+    pub(crate) fn has_small(&self) -> bool {
+        self.small.is_valid()
+    }
+
+    /// Check if the big page table pointer is valid.
+    pub(crate) fn has_big(&self) -> bool {
+        self.big.is_valid()
+    }
+
+    /// Get the small page table PFN.
+    pub(crate) fn small_pfn(&self) -> Pfn {
+        self.small.table_frame()
+    }
+}
-- 
2.34.1

