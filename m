Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDVvEigsnmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04B318DDE8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEA410E6FF;
	Tue, 24 Feb 2026 22:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IIkjH8Xt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011021.outbound.protection.outlook.com
 [40.93.194.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B6710E6E3;
 Tue, 24 Feb 2026 22:54:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8PcMRPKpQhQik5lQe0+6f1Qhr8oPnlu5QK/txN5UcQD+0UPNzol7PrcYgBO6ThQUyxWebmV8TFKDc1BB/FIfmWuXNG326FDzp2+ldpuw5XZefDFrKnCFSOV5iqLmfTYPV7Tcla+tb7vSy2nfI7NGQCv8zOLlMr0GQ4Dm+52DGuRf0JiByHqagmUikvswt5QpVCej5faZ+4TNmd0cahYwGVFGB17ItqVZYrN/r8avYVEPBknB/YYD13jUsoOa/az+K/r2CctmN6AwjZEBQFm7zSl1melhFw7ENylxDOKZKX189VJ4TIvmO8o34vQcKEDedsC0EpjKjWRhKzvvXBqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9APCXBK2CiR2XMzfWD5aY5NmYIj7orB++57uXHt5TQ=;
 b=ODjL9ddAXk8gdmTKeo+hLygB8BQNOCJtjX0hZGo/HdQPWUVtwogBjKdFy00fd3k/g5zuTNAZTy3MFCb8VKNl5ctUkjKcgvcORpvA38Jwd2y02TF2gUVHtJH20nnX3XnfzNjzsYOlWWV3KxLLQ8kBSQeGDTwDemA+q5mZO2lOpul29yngPZ4zEpRn8vTIqYbVK0rRYjr6g31Ooz4/Ax9pDEnDLivlpbPiweb+vTNgpo3t202/ZxhH2OnOqQFZ8qhY0Sx+4xwxRmwpmawpCAroI7j0BsEfBeWt/zMrNyyn/XALQT1ziTYy1IXUh0T+GlPwr9LSUqVpBhIhdu7VeLK52g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9APCXBK2CiR2XMzfWD5aY5NmYIj7orB++57uXHt5TQ=;
 b=IIkjH8XtiZKkrhq1Fmn0FRLMUvPclYu66JpQuikV2CSJk3zEYukv8NfkS1XuWFCg9J7snyIqNU+AN4ypZwdDCml1NxV04C+E3jonu+8RekKaKmA8eR8ijMjWdY8NP68n8hLU37pT696larGrw4YJAmIozO6eQAMbG5pcTVB+PuhS++G6SEAvDO6lOS+7IxYdNEi/7fpM6pnF6KO82gDJsrcpQQsRch4wEVkf2UCB4hdCQLmc8FdOJA+p8E1mscJXCQr4tg4jAtTOY+vUK7Af3rU9pmsEkiwWx9ChoJ6Ic5Mzt5hDwv2L0PjgnsEt4ICmvUckbhvx1B9bPHKNNpt+BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:54:19 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:54:19 +0000
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
Subject: [PATCH v8 25/25] gpu: nova-core: mm: Add PRAMIN aperture self-tests
Date: Tue, 24 Feb 2026 17:53:23 -0500
Message-Id: <20260224225323.3312204-26-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:207:3c::21) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0def32-68bc-4b98-af40-08de73f7a4cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F/ygQZ33q5lBIT1kDoWl1xMWIGE2znAyt5Y1f9eL9ppFFQy5BP1xJEW5QCFr?=
 =?us-ascii?Q?NtDfCd3JcWK1o5TlP2v1R4Q0f1R/lS0bhK/nzQe6NYw43djdog2J5hGAHYgo?=
 =?us-ascii?Q?zclJU3WBlVppbWBBGoz5caqwVSsD91TjLjtQKDNYNq0ApBsnRTfesg7/7YQ3?=
 =?us-ascii?Q?8Ie++JtaSJ1hffbbfXyJZmV6xdZ2TOzp2vZp9PkoQxoeThYnGJptiZsiqUfR?=
 =?us-ascii?Q?Jns3gNULPCL/WCohxkf0uhqL1cl3MfTFOUiFy0Dt4ik0nyheqEBmKzmD0eY3?=
 =?us-ascii?Q?sKVmC/CatU+yKRLFB3gLhoZb+s4bgsli+jgC9XvhkHG0X/ypOWf82HXAS+Db?=
 =?us-ascii?Q?tWMF4so89LoFVwhU0aPNoRAHi6LTelT4wv/PIqv2ye6pSeJn3IHTvmIyH2HA?=
 =?us-ascii?Q?c7fwELqxq1kwWj6YHvtVRRMgxH8UDv9KYi+vlN4+c8tJVeFSOuLjALapJhM4?=
 =?us-ascii?Q?jsI3j5wBoEWyVEep1vTaHWhS1erEilz+d9HuVJyBydMwtQxLtKTqJ5sagcX+?=
 =?us-ascii?Q?Nqy4yaykzBcIJL3Ihe7rM85UU0LIuXTiNDZUc8Digk2wdj5z7ieQV/PC5uQL?=
 =?us-ascii?Q?4aK/axeC0q3uVNZied0bxRqAhA2o/fWkf/bpMOcl47XfPu1GVEU4gVbBqPFd?=
 =?us-ascii?Q?wLh9s5493tHhFjJ/k5fN3A4RNrYGbmndfRUBlsLFdcnHxISgbdIl7c3yhxte?=
 =?us-ascii?Q?rw9IQtub8mTtXZccv3CbWUSX3w8fLd6JxcxJOolaq/n3q4ncsKwcaRWT9BY7?=
 =?us-ascii?Q?CyZnnjsda9eE2JrB9VdtxerKhADdChXrrmeRivt8MAZlqUbZs2Wharbm2x8k?=
 =?us-ascii?Q?OPoZxdFnBOy2Qom1K+9yFpX8mZGI3EvcgJ2kdN6ArjMvvQPP1zFUwd33NfEV?=
 =?us-ascii?Q?qsnycFbrzqHGGQMDn8dodlTdWheqxD4PcVmzgdc/V30VQgQp7RrgvCIOPKqv?=
 =?us-ascii?Q?MV4br75+9rdqr2m2srDbY4tOgo63XpxlfzSRbYAP2LCbF5BwF+Hx1dMo4yck?=
 =?us-ascii?Q?8+9bGD7gZ+SyOvSF80FyHCoerA6eSRdqCFYyXn2gxbaMx0K+F/F0MchLezYT?=
 =?us-ascii?Q?a/kCJXZjTVrTj4jUt6NYouNhJrezfs4uEAWNM6dMHI1anzLDN24Tm7iEDeQE?=
 =?us-ascii?Q?/pzYYctPNvPlCQcs+zTjYuQdkyL5x6ln7nyZ4NjrMUuoGwRUglZVNX71ewsx?=
 =?us-ascii?Q?khSKGoVXUfNJGxqyMxiQzsGFyfgHa4Po4FpOBIH7yjd1i/CexAJ8Ei3XV+g6?=
 =?us-ascii?Q?GntyX67bexG80V6z1P4VjP5g5j+cKu/+wgXs7RPTdRkw63w0BidIL1yE403d?=
 =?us-ascii?Q?Etzi9DbwMuarS56qLP2FVEp3mVu9fSJMaOnCaTyhHily511S9/xhLPy64VXA?=
 =?us-ascii?Q?BMyieGlWGpF+ysLMBv/5p50u+q4/bXGb7trGXqXOyQnOiW0f/fnxm127vEPq?=
 =?us-ascii?Q?v1wecDKIU3ZEoAgv44sv21aFrhWvJjbDqPn7gxi+e0ZCn2ZBELmMlNAByv6U?=
 =?us-ascii?Q?rcXqsXgI0TwYuTpvNxLY2TjBdaoDAl0STWMgFgQfVORpA8oSrfI5msvN8wc7?=
 =?us-ascii?Q?HfhUlNxiiIgSpy697hQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gD0PDlssN+kR8LOKa3Y4v3Su3J6UtRsAbUFbCLaQVZQOaYcNi20jTOohUl4u?=
 =?us-ascii?Q?Jo2hpXtkSmMy34CmRHLr9JgycXsXBsToXCXaVIvA3eWDWQ+20BSYf+DN5FVY?=
 =?us-ascii?Q?fjZ72td+RVCYbZiOWuX9pbnzpB5WeQSjESsyOddmTZdv9yuAb+lqmAioPQ6R?=
 =?us-ascii?Q?hf+ctWkxGxD4JDu3vwJJMz+y7/sGb4z3+UASKZz8DUZjsLAfh8N8G5OlMPcM?=
 =?us-ascii?Q?e9AOeRjZodyVVeM1BhiSw67BMeUo6JvvY8m/bkaGwPPj53Ye1rd8aCjM0jTK?=
 =?us-ascii?Q?sOpgHnKK9CtJyPNbtd+1PS7CpZs9wJzfGnWWnuaHiIb+gyDUh+hZHlRS3F7k?=
 =?us-ascii?Q?Qhn5NzDAL0xzYqr6Lsgmpago4HqtfSoVM1AflAauMmLrvdnVIEUuGx93xCmT?=
 =?us-ascii?Q?KPbOUmlAff371DpH4JFXuhi4bWjiMjag4V0Xhp9JHLVIknE/HJe3oBJaEJV+?=
 =?us-ascii?Q?t45iXEcooJB3w8hdwL0JEHJzu1kEoIIiskzzfwEwCnyD4ZBA7b8BNkz7LC7T?=
 =?us-ascii?Q?UVmj1e9BFTw7ATvCCj2A5y2L4oB0ToC0jjWrLDE/2dg6DQchqz3PAOTszlN5?=
 =?us-ascii?Q?4vcez1EvRuA2nlc6le/R0UOp/uxB3yB8a5yADMqCgDxhaTEWzsERfi1/xTW/?=
 =?us-ascii?Q?v1x/nkX05fLhh3xJ2q2xKKc9uofB44sdeZ/08ZO0F2hSA5/zu/mA09MdO5x4?=
 =?us-ascii?Q?SMq54oa1gaRVgX68V5DOS3JfoMpMpyQD6/LFyd93mems+ewREkvzm/IDP6GP?=
 =?us-ascii?Q?y0fqFotiCaj6noIQJxJ91MPPO3U2l29XlVdNURd3t9dxElIv/QZNTFecb6qQ?=
 =?us-ascii?Q?GI7hesGvxD3EI3OS1blz7uzE9S6889Lrb1TE+dxnreI90/9C/rFHPag265v/?=
 =?us-ascii?Q?lGli+KYnXoLRzCcpxlowVL2kl0C9ZvZvgIP37tioeImUp/89CsQA7YFDC+VA?=
 =?us-ascii?Q?t89DrLzOtEWy78/NbcDeCAEfCFxC4pQwKqHT2EfIM/AGPCbLmeYGwZuLo2MX?=
 =?us-ascii?Q?//pz0OWHtWG6zMfltg5gibdrCLB7sgsv1kHkXWW3TUlJ4/4aOU3yrnIgwc5y?=
 =?us-ascii?Q?s1iEzabinIdjZku5xc5DOirn1H0Y8Ueq4E3yyRKHPNnAtf4hKpSIwDHhq9/u?=
 =?us-ascii?Q?gq7oTJJW2A/GMuzxyrJcT+1k+CPuB50iCIoBW3ba9leRe5jV/SCq49tnwemq?=
 =?us-ascii?Q?n6oUYky3NVuld410Q0xe4jDazmhuO+QPjbMI6cO/uVwUPIqoREP8CO07kjs+?=
 =?us-ascii?Q?Wwqgh8KgE0ynmKEzlRzGueugOvHZZlTIwZ2X+Ibxeup8Wcpsz/3seotitbTi?=
 =?us-ascii?Q?Is1p2RsGhcC59P/a0vWdW5nxYBT099ar1c0lkF236QkA14zMrsz4KB83zH+2?=
 =?us-ascii?Q?cVF34z+Eny0WKBNVDqVsSIkCuWqwmYPL1k10qmYbVIDvVwL7q/YvMxvbmCBi?=
 =?us-ascii?Q?JxZCgx/MWKXL7nxrPtiVgF+vopTrTMeQLT6fVH3Gy7GgB+U1mg6i1JVkOS4p?=
 =?us-ascii?Q?BzeEsvwT2wfANDWGdhCbzH6Z9NxaE7jnnHy5kOCCpHefD1zswvk+/5ruKDzV?=
 =?us-ascii?Q?YfZR9mdTPNiouEXcQ5IwpBmNCISW6kQiKQUNKOvb6XHrH3NwsZX4dlv3EOBs?=
 =?us-ascii?Q?PfC/nLKsWDAhZMGqcZQ40OEY01JU0wcu9NtJxHhIn6kKD4EcpoS1GwUa9k17?=
 =?us-ascii?Q?gq/JnkdxnNVhmgTAOV3EoAsvK9KwJgHm160RFn28sBEMYDJH1T5IZyxBrdB+?=
 =?us-ascii?Q?dz78nFuO6Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0def32-68bc-4b98-af40-08de73f7a4cf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:54:19.3800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkOcuYRL2owFvJDaQGIoO7d+RHBrjq0xp1GfEjAXzKZ1tLk+QNUvk6HkJDtgJEbx/dIyeQJN84UILUklnmy/YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885
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
	NEURAL_HAM(-0.00)[-0.928];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F04B318DDE8
X-Rspamd-Action: no action

Add self-tests for the PRAMIN aperture mechanism to verify correct
operation during GPU probe. The tests validate various alignment
requirements and corner cases.

The tests are default disabled and behind CONFIG_NOVA_MM_SELFTESTS.
When enabled, tests run after GSP boot during probe.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs       |   3 +
 drivers/gpu/nova-core/mm/pramin.rs | 161 +++++++++++++++++++++++++++++
 2 files changed, 164 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index fba6ddba6a3f..34827dc2afff 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -396,6 +396,9 @@ fn run_mm_selftests(mut self: Pin<&mut Self>, pdev: &pci::Device<device::Bound>)
 
         let mmu_version = MmuVersion::from(self.spec.chipset.arch());
 
+        // PRAMIN aperture self-tests.
+        crate::mm::pramin::run_self_test(pdev.as_ref(), self.bar.clone(), mmu_version)?;
+
         // BAR1 self-tests.
         let bar1 = Arc::pin_init(
             pdev.iomap_region_sized::<BAR1_SIZE>(1, c"nova-core/bar1"),
diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core/mm/pramin.rs
index 04b652d3ee4f..30b1dba0c305 100644
--- a/drivers/gpu/nova-core/mm/pramin.rs
+++ b/drivers/gpu/nova-core/mm/pramin.rs
@@ -290,3 +290,164 @@ fn drop(&mut self) {
         // MutexGuard drops automatically, releasing the lock.
     }
 }
+
+/// Run PRAMIN self-tests during boot if self-tests are enabled.
+#[cfg(CONFIG_NOVA_MM_SELFTESTS)]
+pub(crate) fn run_self_test(
+    dev: &kernel::device::Device,
+    bar: Arc<Devres<Bar0>>,
+    mmu_version: super::pagetable::MmuVersion,
+) -> Result {
+    use super::pagetable::MmuVersion;
+
+    // PRAMIN support is only for MMU v2 for now (Turing/Ampere/Ada).
+    if mmu_version != MmuVersion::V2 {
+        dev_info!(
+            dev,
+            "PRAMIN: Skipping self-tests for MMU {:?} (only V2 supported)\n",
+            mmu_version
+        );
+        return Ok(());
+    }
+
+    dev_info!(dev, "PRAMIN: Starting self-test...\n");
+
+    let pramin = Arc::pin_init(Pramin::new(bar)?, GFP_KERNEL)?;
+    let mut win = pramin.window()?;
+
+    // Use offset 0x1000 as test area.
+    let base: usize = 0x1000;
+
+    // Test 1: Read/write at byte-aligned locations.
+    for i in 0u8..4 {
+        let offset = base + 1 + usize::from(i); // Offsets 0x1001, 0x1002, 0x1003, 0x1004
+        let val = 0xA0 + i;
+        win.try_write8(offset, val)?;
+        let read_val = win.try_read8(offset)?;
+        if read_val != val {
+            dev_err!(
+                dev,
+                "PRAMIN: FAIL - offset {:#x}: wrote {:#x}, read {:#x}\n",
+                offset,
+                val,
+                read_val
+            );
+            return Err(EIO);
+        }
+    }
+
+    // Test 2: Write `u32` and read back as `u8`s.
+    let test2_offset = base + 0x10;
+    let test2_val: u32 = 0xDEADBEEF;
+    win.try_write32(test2_offset, test2_val)?;
+
+    // Read back as individual bytes (little-endian: EF BE AD DE).
+    let expected_bytes: [u8; 4] = [0xEF, 0xBE, 0xAD, 0xDE];
+    for (i, &expected) in expected_bytes.iter().enumerate() {
+        let read_val = win.try_read8(test2_offset + i)?;
+        if read_val != expected {
+            dev_err!(
+                dev,
+                "PRAMIN: FAIL - offset {:#x}: expected {:#x}, read {:#x}\n",
+                test2_offset + i,
+                expected,
+                read_val
+            );
+            return Err(EIO);
+        }
+    }
+
+    // Test 3: Window repositioning across 1MB boundaries.
+    // Write to offset > 1MB to trigger window slide, then verify.
+    let test3_offset_a: usize = base; // First 1MB region.
+    let test3_offset_b: usize = 0x200000 + base; // 2MB + base (different 1MB region).
+    let val_a: u32 = 0x11111111;
+    let val_b: u32 = 0x22222222;
+
+    // Write to first region.
+    win.try_write32(test3_offset_a, val_a)?;
+
+    // Write to second region (triggers window reposition).
+    win.try_write32(test3_offset_b, val_b)?;
+
+    // Read back from second region.
+    let read_b = win.try_read32(test3_offset_b)?;
+    if read_b != val_b {
+        dev_err!(
+            dev,
+            "PRAMIN: FAIL - offset {:#x}: expected {:#x}, read {:#x}\n",
+            test3_offset_b,
+            val_b,
+            read_b
+        );
+        return Err(EIO);
+    }
+
+    // Read back from first region (triggers window reposition again).
+    let read_a = win.try_read32(test3_offset_a)?;
+    if read_a != val_a {
+        dev_err!(
+            dev,
+            "PRAMIN: FAIL - offset {:#x}: expected {:#x}, read {:#x}\n",
+            test3_offset_a,
+            val_a,
+            read_a
+        );
+        return Err(EIO);
+    }
+
+    // Test 4: Invalid offset rejection (beyond 40-bit address space).
+    {
+        // 40-bit address space limit check.
+        let invalid_offset: usize = MAX_VRAM_OFFSET + 1;
+        let result = win.try_read32(invalid_offset);
+        if result.is_ok() {
+            dev_err!(
+                dev,
+                "PRAMIN: FAIL - read at invalid offset {:#x} should have failed\n",
+                invalid_offset
+            );
+            return Err(EIO);
+        }
+    }
+
+    // Test 5: Misaligned multi-byte access rejection.
+    // Verify that misaligned `u16`/`u32`/`u64` accesses are properly rejected.
+    {
+        // `u16` at odd offset (not 2-byte aligned).
+        let offset_u16 = base + 0x21;
+        if win.try_write16(offset_u16, 0xABCD).is_ok() {
+            dev_err!(
+                dev,
+                "PRAMIN: FAIL - misaligned u16 write at {:#x} should have failed\n",
+                offset_u16
+            );
+            return Err(EIO);
+        }
+
+        // `u32` at 2-byte-aligned (not 4-byte-aligned) offset.
+        let offset_u32 = base + 0x32;
+        if win.try_write32(offset_u32, 0x12345678).is_ok() {
+            dev_err!(
+                dev,
+                "PRAMIN: FAIL - misaligned u32 write at {:#x} should have failed\n",
+                offset_u32
+            );
+            return Err(EIO);
+        }
+
+        // `u64` read at 4-byte-aligned (not 8-byte-aligned) offset.
+        let offset_u64 = base + 0x44;
+        if win.try_read64(offset_u64).is_ok() {
+            dev_err!(
+                dev,
+                "PRAMIN: FAIL - misaligned u64 read at {:#x} should have failed\n",
+                offset_u64
+            );
+            return Err(EIO);
+        }
+    }
+
+    dev_info!(dev, "PRAMIN: All self-tests PASSED\n");
+    Ok(())
+}
-- 
2.34.1

