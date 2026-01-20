Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLOSG0Tpb2lhUQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220E84BB0F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4152D10E699;
	Tue, 20 Jan 2026 20:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="blT8Xdvh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013056.outbound.protection.outlook.com
 [40.93.201.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAEF10E6ED;
 Tue, 20 Jan 2026 20:44:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZA1DHHPQhVrRe3yiT8s7YeG8obRtVQyh3czPNmtRuZTw32V1XGsFfyp9bE76raBGNgdM7lBtKY5lGUwLB9uKq0wILFX3nXIiJ23/h88ci6spgJuNuJTDudNCxMVniTZ/djlpaFr7FBApywJSFkurX8jkQFPwxWmclBiiTcNsldzyKSlxv5ErKaBKc/M5OeD9H4NBZGzhbn3/b5N6/RNDwprf/7WWHSIuTRh6cYVrNQr3axqvNCzn/uq0KPrKOYOlJdeCGi2/xIPQZ5vL56RT8/RyLzbZ/uZQu+VHY0Ww5ubu1U0uSl9NaIWaucYFiSG2mpA0rMWXwCTtOD5XAfiMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PomTm1iOEgO20nycd1szNoCYqeZgpfISaUbKMSUnqLw=;
 b=rqwkgcxVLZCAi59DPoMTkcaLJSUW8chau5VkiiFYwuQFSUZX0ydjCeYS9Wen3j+U9XmT28mOP2KtLR1yFYvvkGsAgW55bJUg/hKsyh/GbM6oCBOX9jOiv+2daNqC2xdAc3yOcgXbl/itrwYYQVjpJ0fWxzb09r2hJExvPTyX8oIRtRM+lVs9a1jm1m+zsreNQYtjUt+raNOu1dIsadrg5WLg//AFhCuoNBJsfs8vfjs4blRZLI9zS+CXUUaH/XOaEheYqdVY1STM28C+Fj74uINmxKPli79uNBScAWD9yS/l4uVnB42QsIkQEfO1hiic6EpmasaZCzDnb6TBJv0EMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PomTm1iOEgO20nycd1szNoCYqeZgpfISaUbKMSUnqLw=;
 b=blT8XdvhVBggSaIYaDtjqsNqnyKDXpdJncEew4qWAfaTH2wsLFrHIa1McEofwzMCua15mMSsnVdPkoXMYmnMdAxdPZuR0sfXqvpwDMOfxD1SagEUwZhuP/lioSh0jytnZtYirYgPpsrdO9jerG3jzz7HdtcwUFg+MxnJrGdehrNYR4T7Ab0WB/5PQDErWLvS94e/OO81D2SZNuT6i80mJbTos/J52jaApTTlx/BiLRfwDwSHU843FwK0451+CtvLQYnT4LxFbUxVgaxFiGKF9PzfeRn4xaGTYTXkYDiF2yrzJreMf7njHM/XQzZmW7P8/pQGGqV9qmY1jFnAvRNq0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY1PR12MB9651.namprd12.prod.outlook.com (2603:10b6:930:104::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.13; Tue, 20 Jan 2026 20:44:34 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:34 +0000
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
 Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH RFC v6 25/26] nova-core: mm: Use usable VRAM region for buddy
 allocator
Date: Tue, 20 Jan 2026 15:43:02 -0500
Message-Id: <20260120204303.3229303-26-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR12CA0019.namprd12.prod.outlook.com
 (2603:10b6:208:a8::32) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY1PR12MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a611a1-a55b-4abf-89b2-08de5864b7cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6m3x5IBQPfADy9nFW4J1NJ0JuoI76F9S/OVVg/r3FKY20OvxLP6+TxEPaeTt?=
 =?us-ascii?Q?U3r0ozfF9JST+WqH+pR//XCjB4oJ6MeDRIF6U7zAZMic6o0mu2Dnjyw25UOq?=
 =?us-ascii?Q?i0lLx8YAprYhf7uRArNydDWGDRnz+dWNOyKUeYxFLj5cxyFsjzrehOO4Ni2o?=
 =?us-ascii?Q?arb5NyfL068XoMV1RKNNrgfNBJf48SYtJMZxyw+HadoM0W3fTIQGzVegNf4B?=
 =?us-ascii?Q?ZNyIlWkMeNqxTZYx+gt3yTOi+g64yIRUtZqyqto4TLosFoOCmmas3NfxNPM9?=
 =?us-ascii?Q?b8fPrC2g2BwC9jeND0rtLgo2l/G6iIwmsGMKZp5bJmTSmOcFCBMv25oW0kVM?=
 =?us-ascii?Q?p21XKId5jTGrhPlA0TomcFo5tDjd+MzjKTV2snqA5kL8SGLDsqbcJHl1J4kZ?=
 =?us-ascii?Q?XemxIOrvOayZWShkqXJP072903akw0eHaaL94mIv0EAHISY7GadJLpLb/oWO?=
 =?us-ascii?Q?EGmyaUFytRJ9vlUGIHh2Xr8mQjzooMO39u86Lx4Y31fP0lp++QxhVqHoou96?=
 =?us-ascii?Q?KubgnepnLeYjHqPT+pgUS8+ZGiIqQeoEpFBfzOlnLMVUHGKykKE16c21bz4g?=
 =?us-ascii?Q?kPELbeGSmf2Vcx0XSYIBjaBavuNLsn//F5LgNgAbK36tTAZQZ+aSphVZz+SX?=
 =?us-ascii?Q?f/MDRKQRdl5od85HZ7M2BQd3eRuwRYX1gFG8LwZWTlDvGlgw8bsLo/en72Py?=
 =?us-ascii?Q?OW8Xgdwx9XY0OkSt/e/3LdE3OFCrZKyHszx6mAcaqzX665654AymZFKYQuo4?=
 =?us-ascii?Q?UCk0h05qsm1GeiYNnj9TX6plKBbG+G8JWSuvFxLqZqqbtlF74EqdIbdZwOB2?=
 =?us-ascii?Q?byMZroUPGTSoszdi5REfkO56mcaPnJSHfUt87LFowqfEEejtYpZATm0TkSCa?=
 =?us-ascii?Q?jVzeW/UHqbyiTUIktNLMOlSN3ncFk5AU+XypKtuzRU+7IhIhAnu2ZASlkgtP?=
 =?us-ascii?Q?fLkDAqiIxo+9+s1GwUUuYpNAx+oEhGGGhYhyTemSwckMN45QEYaI8UWfRC7O?=
 =?us-ascii?Q?rd0DWgj3WoJ8Yxj1zYE91lkWOs15XXNd505DC7FvOlux9bqGFoigsxoPk0c9?=
 =?us-ascii?Q?3nIOygAITPBdMvMRebyTzI+PdbAPeo99hfzIovQLBIrt7y2wQeXaaYVQ/Xec?=
 =?us-ascii?Q?GbSsMOBQ75WtM1cFqSa7HtyR8tZSRsFDlm/AtnYqKpBr03qUg2kq7IXLDX/c?=
 =?us-ascii?Q?SGuK/BP32PT8gwEWUJJKt7L5vUde5UVVue2CXSjYbaDqMSVG2+NmINKylyav?=
 =?us-ascii?Q?OYdq4mMsVCZOjbI5RAzc0tmnCGlUJlzJnvEzuAGkXrZX2OC6sAJrsTBxnu83?=
 =?us-ascii?Q?JamPAFvt7THnIBHcVeVgYfmB+wDzUg4rDq4MimcuwkmQ3bLajJr84UyClcLW?=
 =?us-ascii?Q?E/EIHgMxZm9Zn2aszObVCkMRFdApuxtLQkraKcQ+8BUseGuXhFeAVIDew3ok?=
 =?us-ascii?Q?XQ43JITqNuona8yP3rDCQGYoRITlDrxBeZ7e4cYUNYKEXOn635uoLU/ucWHe?=
 =?us-ascii?Q?3/HG6bJxr7OO7WcMLTjtKAASBxIHudipF2VTeFa+QikvIOrM9RZcSWJr+uTT?=
 =?us-ascii?Q?ssxER53iHGVDwJRg2K0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9lj9cc4pFVOGfbMy6n4l4hm/ShXpl7PZONOWTfBRnvyeiSmyt2T4rWG8CQSN?=
 =?us-ascii?Q?aTveLP0bBb0COOquy+sRTC2F5026J81UUX6ZwEZDkf6o3XkPTIm3cUHnICoK?=
 =?us-ascii?Q?K+/DAU3MwEQ5oYAXMs41yZv6lgyFva6foKZlfa+8pOOrRhc5aiERD87KuGii?=
 =?us-ascii?Q?7v0L6abf5dhlkOaVcjjkOp+GlecDndhqBZmvZRZHGefZ4limnso9p1wfSox6?=
 =?us-ascii?Q?PSqNMY8Tn1ZvzhzW1kSeW6b8PmEiddMRmNm/ahkcGn7el4Gl68EwWwH2jq3M?=
 =?us-ascii?Q?VE6D7UzoGV8RSNhr1DPC+1HfREgfDn6xBK5flJWJI2fX5ARCxq7ZY8xa6CPf?=
 =?us-ascii?Q?lBb9XdYAmfrDiz36IePflC7/Y8I7nQSseMZsC3CGncnnhmRG3oBJugOaewzK?=
 =?us-ascii?Q?jhSSWt/25ICBBYGAsivYIiwfUt2RHMrY37ApvvLWVcIIoslBkBZNomF0CQ7I?=
 =?us-ascii?Q?nvhtmErtkdGgD1BidOZFIRF5qHJIQ33IFyvFH+fkso9eIQVdJbBA3PZU3Jg+?=
 =?us-ascii?Q?JMa0cnlFm31quBsKLMIZwHrL1mxtSzhNrHtGCgSzT0+4GWdahpeTqX4IS8PM?=
 =?us-ascii?Q?REAjfJ8Qu4xalocESN66Y6wExxuSkji+2P/tm2SyTlnXZ/N8c8RloNPlCQ0p?=
 =?us-ascii?Q?+X/LJhJO1a17ghE/IISnGXL37xRTJwoM4RkfMGunTDpQQHk8mx4lf47dUfsl?=
 =?us-ascii?Q?F2wqP3NiLCJYuNq+9d+39R2SMImNKXViAPuwyORUyfLdNmctjqhMJZT2ios/?=
 =?us-ascii?Q?3PqC6wV1zZHczk1dWTFoRyxFXguH1KEQ8PQoxpFI59xUFsMWCY7mzRi//9Qv?=
 =?us-ascii?Q?8keeI7WYvdTn8ifARFEAjA2BxtuxoMv6cRgQI40vmd8/aB/bkp6AQad7LXDH?=
 =?us-ascii?Q?0S/LtTvm+xnZfT8jdFbTnr5YUoFANIE07ijzKPh/DUo/pYoaI15saVxfouMq?=
 =?us-ascii?Q?4jrNSA1wbVJ/cJ59Wpr64VIl8nYwMH9oG/B6OrlqHhWk5E5GxmiJQT2p66Rx?=
 =?us-ascii?Q?zPRGWFUNo6u/jefpYXiY46n5xTUFMbcwshcLc5nDwl+fjGpe5Qp1Z1tCRXwX?=
 =?us-ascii?Q?vHEa49yHIuhMQV95N0W9MtiBgo3DSOKTWXehn5VSpEIStjKe7wH4Y4wPuN0d?=
 =?us-ascii?Q?8Dfr1YDV5c5ysHrL5Ts+QgoB6MRUvHycopl5ara1RtcQQnp2jMExsmWxRoVg?=
 =?us-ascii?Q?40R4xowmv/AjM2oOK+1IJW9AH8QvuHfDtCTJXn8qouc8A5MP9eqSIZmNWqEL?=
 =?us-ascii?Q?YBaRb4KA1gCQUZcBsfaasylGx1+Dcn1SSzvrWAR6jPM6nHcwbFQv5N100qZ5?=
 =?us-ascii?Q?ePoo1qbtRwv5b6/wKzQkSMtw7ikOzAFGjjQhYc8YlzQEOZxpWep3Le3wyiO+?=
 =?us-ascii?Q?3GTNrt4r4MMckQMQovqdl1s+yd9LXrKNvbh9q4h0JFRRLmr8t6o7Fp5yw+zl?=
 =?us-ascii?Q?vHfhY3gwi948+trpa1EkJ6vfNlVQvDywgwUoc7ETiBaVMjtg50v+fC0bNtub?=
 =?us-ascii?Q?auXXyDWPZk2dOV7CuehVe6B+AqeGGG72b4sAcuivjII0KNtGrMbi8zxCQAwm?=
 =?us-ascii?Q?L957ZgHGBDqybWP7R+lmvL9WQscybbkPb2CsXhy3bzgiID/cveXXZbZIm+7D?=
 =?us-ascii?Q?0chNUQW/Chak7hUFBnPlmSxK1EZk++FUikhozmTjdTiXUPvcdqRI0e/fF2V6?=
 =?us-ascii?Q?nNSvh1RSmRsHYsRoQecIXOoAv/PxzdlzH3JDc8dVMl6YEjyU08yWO7lRjCBy?=
 =?us-ascii?Q?ZvClK+9evA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a611a1-a55b-4abf-89b2-08de5864b7cd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:33.9787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqFll4Hr7pfrljO+amAX8Ws+k8kpmnwYpM6bhvuWCTQkWrZPcSO0bEDBRWyPvQNulxZiiLcHnwYZKHSGZNndPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9651
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 220E84BB0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The buddy allocator manages the actual usable VRAM. On my GA102 Ampere
with 24GB video memory, that is ~23.7GB on a 24GB GPU enabling proper
GPU memory allocation for driver use.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs          | 62 ++++++++++++++++++++++-----
 drivers/gpu/nova-core/gsp/boot.rs     |  7 ++-
 drivers/gpu/nova-core/gsp/commands.rs |  2 -
 3 files changed, 57 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index a1bcf6679e2a..dd05ad23f763 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::cell::Cell;
+
 use kernel::{
     device,
     devres::Devres,
@@ -7,7 +9,7 @@
     gpu::buddy::GpuBuddyParams,
     pci,
     prelude::*,
-    sizes::{SZ_1M, SZ_4K},
+    sizes::SZ_4K,
     sync::Arc, //
 };
 
@@ -28,6 +30,13 @@
     regs,
 };
 
+/// Parameters extracted from GSP boot for initializing memory subsystems.
+#[derive(Clone, Copy)]
+struct BootParams {
+    usable_vram_start: u64,
+    usable_vram_size: u64,
+}
+
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
@@ -270,6 +279,13 @@ pub(crate) fn new<'a>(
         devres_bar: Arc<Devres<Bar0>>,
         bar: &'a Bar0,
     ) -> impl PinInit<Self, Error> + 'a {
+        // Cell to share boot parameters between GSP boot and subsequent initializations.
+        // Contains usable VRAM region from FbLayout and BAR1 PDE base from GSP info.
+        let boot_params: Cell<BootParams> = Cell::new(BootParams {
+            usable_vram_start: 0,
+            usable_vram_size: 0,
+        });
+
         try_pin_init!(Self {
             spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
                 dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
@@ -291,18 +307,42 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
 
-            // Create GPU memory manager owning memory management resources.
-            // This will be initialized with the usable VRAM region from GSP in a later
-            // patch. For now, we use a placeholder of 1MB.
-            mm: GpuMm::new(devres_bar.clone(), GpuBuddyParams {
-                base_offset_bytes: 0,
-                physical_memory_size_bytes: SZ_1M as u64,
-                chunk_size_bytes: SZ_4K as u64,
-            })?,
-
             gsp <- Gsp::new(pdev),
 
-            gsp_static_info: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)?.0 },
+            // Boot GSP and extract usable VRAM region for buddy allocator.
+            gsp_static_info: {
+                let (info, fb_layout) = gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)?;
+
+                let usable_vram = fb_layout.usable_vram.as_ref().ok_or_else(|| {
+                    dev_err!(pdev.as_ref(), "No usable FB regions found from GSP\n");
+                    ENODEV
+                })?;
+
+                dev_info!(
+                    pdev.as_ref(),
+                    "Using FB region: {:#x}..{:#x}\n",
+                    usable_vram.start,
+                    usable_vram.end
+                );
+
+                boot_params.set(BootParams {
+                    usable_vram_start: usable_vram.start,
+                    usable_vram_size: usable_vram.end - usable_vram.start,
+                });
+
+                info
+            },
+
+            // Create GPU memory manager owning memory management resources.
+            // Uses the usable VRAM region from GSP for buddy allocator.
+            mm: {
+                let params = boot_params.get();
+                GpuMm::new(devres_bar.clone(), GpuBuddyParams {
+                    base_offset_bytes: params.usable_vram_start,
+                    physical_memory_size_bytes: params.usable_vram_size,
+                    chunk_size_bytes: SZ_4K as u64,
+                })?
+            },
 
             bar: devres_bar,
         })
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 75f949bc4864..a034e2e80a4b 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -150,7 +150,7 @@ pub(crate) fn boot(
 
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
-        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
+        let mut fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
@@ -252,6 +252,11 @@ pub(crate) fn boot(
             Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
         }
 
+        // Populate usable VRAM from GSP response.
+        if let Some((base, size)) = info.usable_fb_region() {
+            fb_layout.set_usable_vram(base, size);
+        }
+
         Ok((info, fb_layout))
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index d619cf294b9c..4a7eda512789 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -191,7 +191,6 @@ pub(crate) struct GetGspStaticInfoReply {
     gpu_name: [u8; 64],
     bar1_pde_base: u64,
     /// First usable FB region (base, size) for memory allocation.
-    #[expect(dead_code)]
     usable_fb_region: Option<(u64, u64)>,
 }
 
@@ -242,7 +241,6 @@ pub(crate) fn bar1_pde_base(&self) -> u64 {
 
     /// Returns the usable FB region (base, size) for driver allocation which is
     /// already retrieved from the GSP.
-    #[expect(dead_code)]
     pub(crate) fn usable_fb_region(&self) -> Option<(u64, u64)> {
         self.usable_fb_region
     }
-- 
2.34.1

