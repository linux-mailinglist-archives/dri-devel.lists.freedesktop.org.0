Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCPkNtsonmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:40:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBDE18D813
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D65C10E639;
	Tue, 24 Feb 2026 22:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tPuitM++";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013043.outbound.protection.outlook.com
 [40.107.201.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B388A10E630;
 Tue, 24 Feb 2026 22:40:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhpGCaaCiPosdTI+Hzgb7xgxXLHDacsFVeCmwQSGU5zvx1BLUW/eig7WNpCRP0mZ82CPAC6ZAe/e1UD9N932PMEeIjSC0LQhnc/CskHjSz6qsxmKRiNOsirQjYBoaVII9EpgAMCw6Z0lMSB8asFihkNrzJgW6XuU9SE8GmS2ojxyaSMaLr0GoQgsjcN8C2khc5gLFWPqNC84kzl0uw00G2ZLulucLoiPsaBeIQlC2N/XRG0WiTBvGN13FnAihPsKaQEPvwVWJdZSPf+vOEUMuKL0YQ2MdQz0qDzvblFKtrMiRhW3Zz1IT7SUPpxRuIb3QefqqC9S25LaNf1vd/fK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTKgckHqENZNSWGfsHIpHTsn7t6tLd8/f+Yki4Kw6eE=;
 b=FEp4CtbmzsYizzL0Iw4uwZdp92NitusFwsxZA2EqhGavv9GtyxIfayz1hA/0sNssk5wWiGWU2ONzloQCG1HpG9H2VpydTfnoP44g7MiX2VYa5Kwus6S3xNBriVUlbpSJH5i/ydShLKNl8ejTnzwuaq6/q6DQDoqC4DB57pE4gv/Mo24Q+4GHPyaLWc+MGZz+Asc0ZQLkpUkaLQ3geHTLq9cheAgQfLRTgB6s4PQu75fbfvPqWrFOIYV7cp4aOVLQNWO4APUjyXKe07Im6qCsjHGCBypwZkLgojsC3pTtZOK3qNrjuDYTuYVZrtDOBun7sOobQ/vtITALg4hrMeveFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTKgckHqENZNSWGfsHIpHTsn7t6tLd8/f+Yki4Kw6eE=;
 b=tPuitM++B+au/z3cfN3JVdjs6RftXtI9mGOUFEEeOu8juAFXfNpW5qkUbXoZv5ytO/K/ewlqfDE5mj08/eeNhrpTb/NwvNJdZ91xOL/UID8wdE8HZlyDJdkTsKXWM1MA5MksxqYBOM+S/ZO5kRYHae3jkqPi+KfvxyH7YrQqZvXLEYRzA0FmcgVRX8i+hn5d3YxxXz5zK88EYGH6biejXFkW8kGMH6vKuGnP10guRMNpw1ipnYz+fTYRVuON9ZPIeH3zs4jV/jOE4mkHzspo7oDXlW+51mRTsc9Zz2mO5FmZgJ2LzXgJf8OhAbV9HweOAkKwU/O/uJ4JZkJgPLP9Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB7816.namprd12.prod.outlook.com (2603:10b6:510:28c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:40:13 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:40:13 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 Helge Deller <deller@gmx.de>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [reference PATCH v11 1/4] gpu: Move DRM buddy allocator one level up
 (part one)
Date: Tue, 24 Feb 2026 17:40:02 -0500
Message-Id: <20260224224005.3232841-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224224005.3232841-1-joelagnelf@nvidia.com>
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:52c::31) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a36273c-9472-4f7c-00f8-08de73f5acbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XkHSaJiRxfVP0PpJo0ODVy38XXoOia4Jklh4VX5jajtt9y7EvfP219HtajQ7?=
 =?us-ascii?Q?KxMlNtkSK3isco3zB7lEQxCDaZNCJrmAcFA04TU29JxKPt3Pt9z+Esj8EUft?=
 =?us-ascii?Q?JfReq5vsavAZfeBFN7OkDZhnQWuxYd4XmXFjvn3XlMXUMpb+9j4+Bla1pPq6?=
 =?us-ascii?Q?8yVq8Xl/WDy/YWaynkvwSErTIlNuZ/A1XL7PqllLGC4BTu4Hq+HOxCcg5oyV?=
 =?us-ascii?Q?RMoUCMSOO2ONYY3c6BgTtXQ+CcZIlEDUHHm0FoX9UiVzQ2oEl6oH8GHmCyPM?=
 =?us-ascii?Q?aN+19hT/jwIsZMoYVClMzANGoiiA7ozZltcxXBwCzo7CxBYst0TxP2yDG2X5?=
 =?us-ascii?Q?F+R/5T155HUyFcZOwFOwNFts73zf3mHiDM20ImqcJtCQkPNyI1THESH9MIIE?=
 =?us-ascii?Q?gMK7wVTlDK6Rz39IPvS3m1tlTOvvm1h0kIgKiwqkut5ywfZSVNf37tG4d1IW?=
 =?us-ascii?Q?3ipz5YGqSD5XJx7LBKFVDOywiFheI/ZuLP2nx8kVz6P85aHaPGda4PJO3pZ4?=
 =?us-ascii?Q?kR2v9YOvTPqMRr+0hds8/Vici5kO4Y6w2F/iehRgEgMasERtPckOwyO9Fphd?=
 =?us-ascii?Q?7ecYpdMyn0RCZZiYBVxJ+7JXRg768W6w/uxeV4jMDPVSnYk18DITudgphhNo?=
 =?us-ascii?Q?ruxE7ujtYAiCB/HwlC+HhAhhw1MbEdpMP1XYZ9d8MEP6xg0yDatiWvYwAZWJ?=
 =?us-ascii?Q?xbP1Z2QKoR/gACnO3ZouqWYoXj0L24fjh7iSbUzFkUv+UopgnVUSQrC7XZTA?=
 =?us-ascii?Q?SCWsfvowPaDtuz8xud9tszS7xJCVpUCMZZQrzh2wfR8NKd5IdLEixfE/YxmY?=
 =?us-ascii?Q?eBKIIZGMxiVV2DzQ824Www56yWZZ4oKuLuvYHwnTVE6G36DQvcQT++3Wrdmf?=
 =?us-ascii?Q?xkQekO2qBgjhiGuFyysjKzR+vdF2UizkPvYUt6kB6cn6ZwP5Sa+YxSQh+lKX?=
 =?us-ascii?Q?/5qo9QDwHSEKwyIxKRBarimxX+3kdWyDa0D3kKHHWYp30HHbEEQASpAxnAoH?=
 =?us-ascii?Q?u0AVxfbcLRRWnQ+0cBCRV15BplTTSsgKwYmATLuQrZtaBQ4LCmCVnnu4TIeu?=
 =?us-ascii?Q?KbXxJzfZ7zqgdheqP0K49xC/8/NaCiYbNRu77s8YLyIZLr6cVZIlFoBDcvSC?=
 =?us-ascii?Q?ccz4Kn35JDAnnv3Bm9ktPfW1vSgENXYzUPTvGWrCVIPraE64ElEr4wI/Tcy+?=
 =?us-ascii?Q?hR2mQ6I9r28vpZ2nbg3tlag4wY6nnHSVgSUBR9h75K+IhZAQ4qA7+FTcdbwa?=
 =?us-ascii?Q?OQTHUIY9OB5raVUXVg0lxg4y7Z+4U4XrJl3i3CVXm0iTc0tSTRhwjfN0v6Pu?=
 =?us-ascii?Q?AVmwajgGrh2lUEuu0ac25RdwY9JtrXcPQgplAVYGHKUq1tYKl2GZFYXSc7sc?=
 =?us-ascii?Q?uQbrzmEmtWiOMAVrxBcggBioV6tQNf9E9nlO1uALXAe9w/Xi1Ev1ti+V99fC?=
 =?us-ascii?Q?AchGQZ6hzRtPIIPOPG2d+/QVRbi9I84EPipiN8LiczFu98jBANHMvFSQVFdY?=
 =?us-ascii?Q?7WA93H4ZIpW/tfsABf6S+UMKwz4DYDx/a50+UmEzH6vMnfdWNYGw26bOUIEd?=
 =?us-ascii?Q?85NYj3VwOECxcmvujvU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cMmORnjn7ixxF8m8b7NYYBsmhdq4hg7jGVcpylWptnzfVmEPP98jHU1TQu+S?=
 =?us-ascii?Q?5vTW6aIZ2Fbl10ygZFJ2sYnvH92cU8qapzkC9h404PBrTKKKyo9ANWbImtsz?=
 =?us-ascii?Q?Q57go+DfzZiNkn0+p9QSZvBbsOrMLex14YV6ftmLIHXQsO+u3XPCUhPeMqBq?=
 =?us-ascii?Q?Hzy1YHm0U+uELrSEadTZw+izpDVcE4OszSs17JO30mCXgm+ITPA5kcpTeUp6?=
 =?us-ascii?Q?AVEQ6U4DPoXQN06GxNwGJ7ZN+wZRvW7xUrNDgvd9WsqPENpk3IvlZDtjnTy7?=
 =?us-ascii?Q?myL6+lsFgMVQfsVadBPQN5ROGDFg3vV5PAPOIaRml5uJzQ8s9osoIrC1lS/U?=
 =?us-ascii?Q?9CHCcZGByX4xSWiQU9aGDcDYxLAHZ/iwMpTGF/S1do3epZ2yXGhQDd+6V/xv?=
 =?us-ascii?Q?y4ROao2D32XksGgZ0M2ZMree2/GNlP7elV/UNemYmTUnMUteUKlljJlKGXC4?=
 =?us-ascii?Q?D8jxpn735l7+4pJelmOP6LlBP3AZ5o7fYdDzkG1ECrd8I+TISxjVUWYOa4YX?=
 =?us-ascii?Q?v7LmQHr7pn6MwYvRvlp/ZnHn+MwbP6Mw9I3rV+avj3B6IBjzIFitQKSJvmnd?=
 =?us-ascii?Q?C6XtDLgeTeAYb6oTUajvTfLtiXOSGb7K/W0l7CS+maTcsV0QB2mB8vLjYvUj?=
 =?us-ascii?Q?gTLcB/keCjLupW3QRo09t+t+y5t6CmHtMJK1VJlmN72J9ClzbhFkFD/qk9Fc?=
 =?us-ascii?Q?60xoJ/G2bWFpi2YNMshmo6SaXLm3MOJglAfLu0uNgsfjRA6B53KlpIlABP6l?=
 =?us-ascii?Q?5jbH/KuXXvHEwaMsF4Cahk0D1oo8RykPqONPSVccjEJsaYjmNUHrkInhW9pA?=
 =?us-ascii?Q?zsxmMwmh9QYkbrt2q/caTagtXt89DmcT33F7Xhe7WK2n5pUcC4bUGV0Slhle?=
 =?us-ascii?Q?vonf75sKf0n62EyJWBOlNcBMUlFm0wnWJxlJXH1yEr9O+nuUlavheluClUy1?=
 =?us-ascii?Q?9N09vBdbAWfpUvIR88qjKM/N7GEOfKRELtHPxy1Yp7crKcvc/E+mo/7+ZC19?=
 =?us-ascii?Q?wEAHUxkBLFOqOnn6cigTmL1zmkBu/JeOjrp3oHsM/npM17lrnCjb26Ep1gA3?=
 =?us-ascii?Q?HuTVNWSW00ML3L3ioKFgBjMQOZEAa4u7+wegIwdjzAZStnC9DB/HA9jLJBoo?=
 =?us-ascii?Q?0sFxD3I8WfKGSquoCZ/dYqhDGmEhbGYPcX3m5OxSDag93/Aev8Ggbk9wJ4wz?=
 =?us-ascii?Q?gAsSssl/K2ZnBKLKRhF/W8CgR87McaDxqk1cuncCv0W5pRH+YhN+20JVVHvc?=
 =?us-ascii?Q?pJy72dQIDErtR92qoUEVwKpw/9mhUOqHvyVxhTXYysxIPVKwESScUwH9i3Xn?=
 =?us-ascii?Q?/ndBA+VkxarpWo5wteN4mSojLb+OcLlXc4U0kND2uz64GgBJm3TDPZmITZbc?=
 =?us-ascii?Q?L50aGza1Dml2EOi7uCvB5ghD81ToYqawTkz5+kR++El1La4OIlDj1zkMHQ3h?=
 =?us-ascii?Q?OJrIFI+UMxHl+gz1rX0H3PKkwhUFKmU1IemfuVGu8pSAXSD60pmbQgQm9QTf?=
 =?us-ascii?Q?YSYBxa4twIOcinwPOoWhecjpP3IwjIfJMTNK1r3Vu/UnD5j7MMwxm5Ko8A+Q?=
 =?us-ascii?Q?yjyui0ji2Bg5XFhdDKbftRXgqzHjVNhQ32rRu/Od5E8Nq/U9dgs5h88Hfxzs?=
 =?us-ascii?Q?GlUGKfu3XV5BT26FHSgAALMhm4v9s7RmES1gBZGwm2pJpx2ljBAhKpG5zoS1?=
 =?us-ascii?Q?jEJWp9F1IEc6jOnyBURO28ZzE/9ESxwMjQ9iknH+4XAa08sSXrhTWhEU5ABO?=
 =?us-ascii?Q?sXoznjRP+Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a36273c-9472-4f7c-00f8-08de73f5acbb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:40:13.7043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LfdBTflOvp0GG6P6rzkfNODFKIrSrOrGi1ETEMRzPpYR0yKtm3EpG5ClamAFNshvF3MiCKpiAEt97/A2XrBjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7816
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
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,vger.kernel.org,nvidia.com,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,weathered-steel.dev,joelfernandes.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[57];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.949];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 8DBDE18D813
X-Rspamd-Action: no action

Move the DRM buddy allocator one level up so that it can be used by GPU
drivers (example, nova-core) that have usecases other than DRM (such as
VFIO vGPU support). Modify the API, structures and Kconfigs to use
"gpu_buddy" terminology. Adapt the drivers and tests to use the new API.

The commit cannot be split due to bisectability, however no functional
change is intended. Verified by running K-UNIT tests and build tested
various configurations.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
[airlied: I've split this into two so git can find copies easier.
I've also just nuked drm_random library, that stuff needs to be done
elsewhere and only the buddy tests seem to be using it].
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 Documentation/gpu/drm-mm.rst                                | 6 +++---
 drivers/gpu/Makefile                                        | 2 +-
 drivers/gpu/{drm/drm_buddy.c => buddy.c}                    | 2 +-
 drivers/gpu/drm/Kconfig                                     | 4 ----
 drivers/gpu/drm/Kconfig.debug                               | 1 -
 drivers/gpu/drm/Makefile                                    | 3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h                | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c                     | 2 +-
 drivers/gpu/drm/i915/i915_scatterlist.c                     | 2 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c               | 2 +-
 drivers/gpu/drm/tests/Makefile                              | 1 -
 drivers/gpu/drm/tests/drm_exec_test.c                       | 2 --
 drivers/gpu/drm/tests/drm_mm_test.c                         | 2 --
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h                | 2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h                  | 2 +-
 drivers/gpu/tests/Makefile                                  | 4 ++++
 .../{drm/tests/drm_buddy_test.c => tests/gpu_buddy_test.c}  | 4 ++--
 drivers/gpu/{drm/lib/drm_random.c => tests/gpu_random.c}    | 2 +-
 drivers/gpu/{drm/lib/drm_random.h => tests/gpu_random.h}    | 0
 include/{drm/drm_buddy.h => linux/gpu_buddy.h}              | 0
 20 files changed, 19 insertions(+), 26 deletions(-)
 rename drivers/gpu/{drm/drm_buddy.c => buddy.c} (99%)
 create mode 100644 drivers/gpu/tests/Makefile
 rename drivers/gpu/{drm/tests/drm_buddy_test.c => tests/gpu_buddy_test.c} (99%)
 rename drivers/gpu/{drm/lib/drm_random.c => tests/gpu_random.c} (97%)
 rename drivers/gpu/{drm/lib/drm_random.h => tests/gpu_random.h} (100%)
 rename include/{drm/drm_buddy.h => linux/gpu_buddy.h} (100%)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index f22433470c76..ceee0e663237 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -526,10 +526,10 @@ DRM GPUVM Function References
 DRM Buddy Allocator
 ===================
 
-DRM Buddy Function References
------------------------------
+Buddy Allocator Function References (GPU buddy)
+-----------------------------------------------
 
-.. kernel-doc:: drivers/gpu/drm/drm_buddy.c
+.. kernel-doc:: drivers/gpu/buddy.c
    :export:
 
 DRM Cache Handling and Fast WC memcpy()
diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index 36a54d456630..c5292ee2c852 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -2,7 +2,7 @@
 # drm/tegra depends on host1x, so if both drivers are built-in care must be
 # taken to initialize them in the correct order. Link order is the only way
 # to ensure this currently.
-obj-y			+= host1x/ drm/ vga/
+obj-y			+= host1x/ drm/ vga/ tests/
 obj-$(CONFIG_IMX_IPUV3_CORE)	+= ipu-v3/
 obj-$(CONFIG_TRACE_GPU_MEM)		+= trace/
 obj-$(CONFIG_NOVA_CORE)		+= nova-core/
diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/buddy.c
similarity index 99%
rename from drivers/gpu/drm/drm_buddy.c
rename to drivers/gpu/buddy.c
index fd34d3755f7c..4cc63d961d26 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/buddy.c
@@ -10,7 +10,7 @@
 #include <linux/module.h>
 #include <linux/sizes.h>
 
-#include <drm/drm_buddy.h>
+#include <linux/gpu_buddy.h>
 #include <drm/drm_print.h>
 
 enum drm_buddy_free_tree {
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index d3d52310c9cc..ca2a2801e77f 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -269,10 +269,6 @@ config DRM_SCHED
 config DRM_PANEL_BACKLIGHT_QUIRKS
 	tristate
 
-config DRM_LIB_RANDOM
-	bool
-	default n
-
 config DRM_PRIVACY_SCREEN
 	bool
 	default n
diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index 05dc43c0b8c5..3b7886865335 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -69,7 +69,6 @@ config DRM_KUNIT_TEST
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KUNIT_TEST_HELPERS
-	select DRM_LIB_RANDOM
 	select DRM_SYSFB_HELPER
 	select PRIME_NUMBERS
 	default KUNIT_ALL_TESTS
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ec2c5ff82382..5c86bc908955 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -78,7 +78,6 @@ drm-$(CONFIG_DRM_CLIENT) += \
 	drm_client_event.o \
 	drm_client_modeset.o \
 	drm_client_sysrq.o
-drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
 drm-$(CONFIG_OF) += drm_of.o
@@ -114,7 +113,7 @@ drm_gpusvm_helper-$(CONFIG_ZONE_DEVICE) += \
 
 obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
 
-obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
+obj-$(CONFIG_DRM_BUDDY) += ../buddy.o
 
 drm_dma_helper-y := drm_gem_dma_helper.o
 drm_dma_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_dma.o
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
index 5f5fd9a911c2..874779618056 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
@@ -24,7 +24,7 @@
 #ifndef __AMDGPU_VRAM_MGR_H__
 #define __AMDGPU_VRAM_MGR_H__
 
-#include <drm/drm_buddy.h>
+#include <linux/gpu_buddy.h>
 
 struct amdgpu_vram_mgr {
 	struct ttm_resource_manager manager;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index f65fe86c02b5..eeda5daa544f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -5,7 +5,7 @@
 
 #include <linux/shmem_fs.h>
 
-#include <drm/drm_buddy.h>
+#include <linux/gpu_buddy.h>
 #include <drm/drm_print.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
index 4d830740946d..30246f02bcfe 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.c
+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
@@ -7,7 +7,7 @@
 #include "i915_scatterlist.h"
 #include "i915_ttm_buddy_manager.h"
 
-#include <drm/drm_buddy.h>
+#include <linux/gpu_buddy.h>
 #include <drm/drm_mm.h>
 
 #include <linux/slab.h>
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index d5c6e6605086..6b256d95badd 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -5,7 +5,7 @@
 
 #include <linux/slab.h>
 
-#include <drm/drm_buddy.h>
+#include <linux/gpu_buddy.h>
 #include <drm/drm_print.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_bo.h>
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 87d5d5f9332a..d2e2e3d8349a 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -7,7 +7,6 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_atomic_test.o \
 	drm_atomic_state_test.o \
 	drm_bridge_test.o \
-	drm_buddy_test.o \
 	drm_cmdline_parser_test.o \
 	drm_connector_test.o \
 	drm_damage_helper_test.o \
diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index 3a20c788c51f..2fc47f3b463b 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -16,8 +16,6 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_kunit_helpers.h>
 
-#include "../lib/drm_random.h"
-
 struct drm_exec_priv {
 	struct device *dev;
 	struct drm_device *drm;
diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
index aec9eccdeae9..e24a619059d8 100644
--- a/drivers/gpu/drm/tests/drm_mm_test.c
+++ b/drivers/gpu/drm/tests/drm_mm_test.c
@@ -16,8 +16,6 @@
 #include <drm/drm_mm.h>
 #include <drm/drm_print.h>
 
-#include "../lib/drm_random.h"
-
 enum {
 	BEST,
 	BOTTOMUP,
diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
index e4c95f86a467..96ea8c9aae34 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
@@ -5,7 +5,7 @@
 #ifndef TTM_MOCK_MANAGER_H
 #define TTM_MOCK_MANAGER_H
 
-#include <drm/drm_buddy.h>
+#include <linux/gpu_buddy.h>
 
 struct ttm_mock_manager {
 	struct ttm_resource_manager man;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index a71e14818ec2..babeec5511d9 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -6,7 +6,7 @@
 #ifndef _XE_TTM_VRAM_MGR_TYPES_H_
 #define _XE_TTM_VRAM_MGR_TYPES_H_
 
-#include <drm/drm_buddy.h>
+#include <linux/gpu_buddy.h>
 #include <drm/ttm/ttm_device.h>
 
 /**
diff --git a/drivers/gpu/tests/Makefile b/drivers/gpu/tests/Makefile
new file mode 100644
index 000000000000..8e7654e87d82
--- /dev/null
+++ b/drivers/gpu/tests/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+gpu_buddy_tests-y = gpu_buddy_test.o gpu_random.o
+obj-$(CONFIG_DRM_KUNIT_TEST) += gpu_buddy_tests.o
diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/tests/gpu_buddy_test.c
similarity index 99%
rename from drivers/gpu/drm/tests/drm_buddy_test.c
rename to drivers/gpu/tests/gpu_buddy_test.c
index e6f8459c6c54..b905932da990 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/tests/gpu_buddy_test.c
@@ -10,9 +10,9 @@
 #include <linux/sched/signal.h>
 #include <linux/sizes.h>
 
-#include <drm/drm_buddy.h>
+#include <linux/gpu_buddy.h>
 
-#include "../lib/drm_random.h"
+#include "gpu_random.h"
 
 static unsigned int random_seed;
 
diff --git a/drivers/gpu/drm/lib/drm_random.c b/drivers/gpu/tests/gpu_random.c
similarity index 97%
rename from drivers/gpu/drm/lib/drm_random.c
rename to drivers/gpu/tests/gpu_random.c
index 0e9dba1ef4af..ddd1f594b5d5 100644
--- a/drivers/gpu/drm/lib/drm_random.c
+++ b/drivers/gpu/tests/gpu_random.c
@@ -6,7 +6,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#include "drm_random.h"
+#include "gpu_random.h"
 
 u32 drm_prandom_u32_max_state(u32 ep_ro, struct rnd_state *state)
 {
diff --git a/drivers/gpu/drm/lib/drm_random.h b/drivers/gpu/tests/gpu_random.h
similarity index 100%
rename from drivers/gpu/drm/lib/drm_random.h
rename to drivers/gpu/tests/gpu_random.h
diff --git a/include/drm/drm_buddy.h b/include/linux/gpu_buddy.h
similarity index 100%
rename from include/drm/drm_buddy.h
rename to include/linux/gpu_buddy.h
-- 
2.34.1

