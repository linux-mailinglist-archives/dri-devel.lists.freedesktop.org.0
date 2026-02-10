Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHYONA7Ai2l6aQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 00:32:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ED811FFBD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 00:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BF110E109;
	Tue, 10 Feb 2026 23:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mxm89hoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012063.outbound.protection.outlook.com
 [40.107.200.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0516310E0EC;
 Tue, 10 Feb 2026 23:32:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LE0WZVWOSdkVH0mJ3mh8gYcSLexTsd1mWVtXyJQhXtqXiwYtxH0Gd67fO51/Ib+3ujTB4l0YZYm5VJ6e8i4BKK+Js3F46Z1ZVHQnkmFG9/fyq+MS7N9RU1ltv7AiUDmB2kgETdTnmqC+LqAO41dHB5Bk4nPEBqMAncZ2RhAb7a7ltj/ltw0N+BIEIa0Gn4tzI5tP4RCK1i55xyTYSnPBFNuUvTqoq3BQkzKZCs47itMKe0Qa80W2hOWDu3UuXPdqJJN9mu9lvMSlsxm8tL8DniC0paR4uSNuuH1L56zWkuClsrhOAit1oauHxH7oRqFNckjqH1MXJxmKxsdCt+Gnbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOJQXGzX+uvqCHDbDkj4GNIs0GyhcSmpfnhGgACVfh4=;
 b=GxekN4fhLKhb7JWPnAPiZosHfz4Y7FwAwLwmP6NW/OihnF3mxzDS5FfgA43hW883IRnnmJv4nuxjHgTLuVRpFiUcNJeFYmWlts1TIwSlkcw047mCmFXaNQ1NbJOPXF+ngdT4RI0w9/wYAoZeuFc8Q1G/fsCbauIHk8jcp9n6Kag+H82fTJIt3S370YCkaYImFdF9mIsQw5T5TqCRK2hQ7BxraC+pCqgIpEphgQ8QO3rPO3D8ID5sV4jjxVz121uFVsGY+bSz+t4B+gylXGugj+ehBKDNBiG1fHgcdhW0q+l2coqI6hsDx/Ojxv5xhN+IKBWhhgoDv1R8atCLASskUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOJQXGzX+uvqCHDbDkj4GNIs0GyhcSmpfnhGgACVfh4=;
 b=mxm89hoTmfiYEI8a2v8z3acrvQGCj4z+O33MWBQY0KRHA4YoOK4Z4YTgFmlM2d4+5xIsXohXgcSePyk9lHGU0lmOu0FO47Zr9qt61981a9xhH8+MzQ0sMvudoJIawyHR16ySoXIOhy9ynQg3Q1S8Bf4Hapj+8aHR865as2rVyguH5btonj3dn1FH3sWLCLBOBaccnAHPmqFnD0AgeZ2/8lJVC5wBYd6PR3ZV+aw6hIvR6PHgdmxKhn88r8i/H7LE3rR/ukfbie0Pv9zzl0fP+j4e2IVtThNZzWrWRrM4uxgxBpugg8xS93rawyqqQxUqSnkPnLxhSIVKZj9h0snNrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA1PR12MB8586.namprd12.prod.outlook.com (2603:10b6:208:44e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.10; Tue, 10 Feb 2026 23:32:16 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 23:32:13 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
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
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 David Airlie <airlied@gmail.com>, Edwin Peer <epeer@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH -next v9 0/3] rust: Add CList and GPU buddy allocator bindings
Date: Tue, 10 Feb 2026 18:32:01 -0500
Message-Id: <20260210233204.790524-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: IA4P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::13) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA1PR12MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: e3515ae2-a85b-4325-169b-08de68fc9e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c8ptM8krcdsa3sFGBHmxdNBBAucgLV/QyeYMjR7vR48XVF0g84/nWEzZL2XG?=
 =?us-ascii?Q?TU+1YjfG6eZGmLeRuY69B3vwPOLeBzybTqHTVFz9zAw8wG+T5lMh5QgDuJmC?=
 =?us-ascii?Q?KqVDkFP5wWxqi9D1rqCfNFjARn1bn3Ihw95abpzs6duRUq7QCkCAziWURNVS?=
 =?us-ascii?Q?05vNHJeJyoAMGVVBxEzWZN4oHTkmz5gcojCFiODDftf8vaRu5hnTpYHfzwum?=
 =?us-ascii?Q?HFLCawZjlJRu3uCwgJDfLlp9NCSk1CwmudlBfeyChdTcfMYcn4I2RgPYd/Ub?=
 =?us-ascii?Q?HwGmrdTwPts32H5tNAGP6hPMnILRf50HK4WH2i8cHyJoQqci1QRqBzKj2X3c?=
 =?us-ascii?Q?8oNxHRcFip7FFnAvEg/Mu5lfI+p5RZCHBtLtLrjrK6uPj8Znez9h7fs5Tev7?=
 =?us-ascii?Q?YfLaotUXgr5PBuAdqeb4bMmButC4fZoA+wHUVbJk9b2BLPRk5VPlC1nT48Sx?=
 =?us-ascii?Q?9h4gGSxme7w4w5mTdBcHAio6IuUWjMDtKuRH03vIhLQSbeC9qoDbHxe79E53?=
 =?us-ascii?Q?kNVa68gdzKUGbB+nfZG9IvKMpD6efWbjK/LkynaM7iSev8YZaD6j6rCfGLkO?=
 =?us-ascii?Q?paljErD+TVZpQL8rFspLj5JJjdsUZO07Elcs3SOm7mZUikdl4nql/fS3zVGW?=
 =?us-ascii?Q?XRKNRWOBw4gvrZjmBlWmciWbAukmJ7edll6pxbyGtVnB/6gW5zukyuHq6D/2?=
 =?us-ascii?Q?UVYwfgjF1HRanrLMDcpTZ64vxsJPz5w42TmjerhBbaI7SWSUIYjZD80IO4nu?=
 =?us-ascii?Q?uW6+SWMc9guWzqLzdQBUjYnQxNW0cna1OPZsCq+SrPmkKRWdfFWFLmMu8IyP?=
 =?us-ascii?Q?v+6DCBfU1L4JkcaHe/QaHx+l0B7iqz710GHa9QLLg6Q4dMiOag3DmHC/cXOe?=
 =?us-ascii?Q?7VaoXM0ioHl1Wl1vxcws0JNM+FvTX/m7fxMrGJCxFpIxkA8C+rO5EyhjWaAy?=
 =?us-ascii?Q?t1hX1lGfIgOWClHXBWnNu6r4tJHvj5n9xGhJnlRXbLPghBXRkGVqucI8drqj?=
 =?us-ascii?Q?GBY6pHhrl9bp7F0SnWHz+alXWH/7MmhJ+s/o0Y27hhnvPPKwbuHzylYHr3Be?=
 =?us-ascii?Q?D65zyO6x2/Kza05S8Yzsty2pLH8Cx3tlm7FUOIhmhEiLoyhJHTTmRslAK8C9?=
 =?us-ascii?Q?GOIbYWHF4sWFYSv3+zVihr/P6EL8P7vj3Wlhj4nFXsqbyRgrOtZxxmYEDQVj?=
 =?us-ascii?Q?lowfSeNScbcvnruwPoyEQzD8nmmpC5/eC8PUPfaoFLEaMdZGglVoBcy/2Gxc?=
 =?us-ascii?Q?hGvFo/k1+pqSNwXN9548fsf6iUwq/HTHLSHJ5IbYS5o/Kgzb37vM5R1VU69F?=
 =?us-ascii?Q?vcJEWath069mikLwcmCY4TjdwXBqrkrLHiXA5wxDisGrYvDWIz+c7toQfA60?=
 =?us-ascii?Q?znQNlszJU5bAL/0tW21UbjxaRAU1/aT+5+DXJ0mIBZ6rMhQGsi7YI0NtWV4g?=
 =?us-ascii?Q?TfrSpYbAlZDJ94MGO4dNuz53wltM4uA3/9AC8bvOdqf2Mt2fr/naEaA2c3Yk?=
 =?us-ascii?Q?3WnFCA4QUHTTT4bNcVOpORWSDnvvUEZnuSvmB5bl/kJhIcmsqQ3LhrAG5Mjz?=
 =?us-ascii?Q?GAYHJQWQz0kM0VaQj54=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p9ev4ZNY85NfybWhcCOm5bMn8WvKKtmO7c3wjvvkxE6xkq1Hv9UufifniUQ6?=
 =?us-ascii?Q?CV86Yax6MlzMt/mSjinKZtU+KvacxLnC+0np2+RC4mqQFZJSo8VZRBhRvOsX?=
 =?us-ascii?Q?GDMWc7FNdsce/Nkl4by/jm08vMP6/3j/wI82eh3vGwFqM1gwypIm1gqrhsd7?=
 =?us-ascii?Q?Z8QNY/Q1MHIOZu+6EqtkTP7MTXZ9j1AzK9+2N7jJeWNBhp+9pF6iDe4KBwYJ?=
 =?us-ascii?Q?1YK7GbgL0X4pukI4SemPk42MisS123xa8zfcHIfbKYWYquAY1BoW63Z09l52?=
 =?us-ascii?Q?1hKTFJ+Huwby9rQLpISESKeuiTEajNtRCa+gNYjAgNooYIYoJ3lfr7xIRIv9?=
 =?us-ascii?Q?jCxk9O418YowRQhOJSosErBHjMj2D4IeyDDreeP83ijm9CBzBAQV+zhaQcIP?=
 =?us-ascii?Q?ab9Lq+tG9MolNawKUnmzSW5WEk49a+W7CWiMyxJxYS4oX802wAcwHpaNUgbm?=
 =?us-ascii?Q?Bwuy3lXqL1u3nQzb8JjBUmnIVbSEjIRN4d7f7k3YAhbrOJ+Lo5gvuXPHFAHh?=
 =?us-ascii?Q?a3f0n5yaeKPuGgFn+GvfDoZ/53yXU6FeRiKcCNKK4U8IWdQm3pT2MI6xEGpy?=
 =?us-ascii?Q?UXSsCFImrRJCOKIpEJKxvA4GcDNJ1X7ECUg/9hWoxyzqhDBXSKA5o1RCsXOM?=
 =?us-ascii?Q?gD/z14o+h838i6V0yGX+tvaln2KcwkV/eaIkJtNXWX5DmVrVhetEJp4IPlDd?=
 =?us-ascii?Q?7edHWIX3HNvmalobghyrdPk20gb0u6em20NBKnfguwzeI/hQHyBGDulGocJQ?=
 =?us-ascii?Q?cgQ2VNtoWcfcXe5fEIEPdBkhmmQoTBhIUwncLktDCB5sCYczX/xR+qNURks3?=
 =?us-ascii?Q?bjzVIE6JoYmr/Ynv4Z43Cp6qCbOMzdMl+UN8X7bnd4JLKGk+JkPMBOb5kHgj?=
 =?us-ascii?Q?dmTVAFqzcvH2s/91+R9KtxWPT3TInU3b0N+ggjVvUFbMAmWaJjvhC4olZkeG?=
 =?us-ascii?Q?P8eA1NQiZ65SZH4GkOyqncdRW5DEwAL/BQyRp7ov5q7PJhvQVrRLvyGBEE+P?=
 =?us-ascii?Q?uaSmK+OQArBFkoYFus/A3SYsbWtX0p+63JnDA6YdXxaU7reghAeX3plH/ZZs?=
 =?us-ascii?Q?ggzY6H9IWFX6+IuLsX9uQgnLlDc7uFDgeISzXe481khkBkVumqR9NZZOUt1j?=
 =?us-ascii?Q?jo2qELHf1WfDUDSHpuul8kL/luxH/QIlQtiOMmftptTuef3dffoJyhmdlr9V?=
 =?us-ascii?Q?JiYsYaHB91hDrRUInIyKUv0c4qg/aIBF0lmOdFWsAy2QNwWds6hQEI6sjRqz?=
 =?us-ascii?Q?uZa2mlKyVl6QwHFEhGxBKKYV0SWl4yKyrubg8lVNQ/7H14pc3K6hcmppAhtR?=
 =?us-ascii?Q?Aixhc2XtNkNvIvs5wPbHnsOizUn8mHBDJpxDw4YALpBUvhasdYdYdXHTPPG1?=
 =?us-ascii?Q?SA6YQqBZWXapdymJjtlAKAluU59vA/GXh1mOAcl4y5fNSQsD6EARt5S7Asnv?=
 =?us-ascii?Q?HUiIkfVJsBE10ZoeqEYowyXPDimG8tIT2vxisvxVB/jkauEvUF9ma51lwXP3?=
 =?us-ascii?Q?5eUctX1yipywM8I+D1Jm7yRqU6ad5/bBlfEQ/K0SF4QdWKKXL2t3o4TaAnwL?=
 =?us-ascii?Q?gl/DHf11nWFUGDziSdsxejIF8uO4PjSKe9kAPzdaY4k4oFhle3Ti/eHk5Byz?=
 =?us-ascii?Q?XcPyDiI0PrzMhBpfCs0gU8UMvHlSeh3ACwfzrPc6mckrDkcE+q8kOlUjXz7w?=
 =?us-ascii?Q?VHg7eYXQ84saHMziGSioEfI/l0QH2f9WJskenKxTKgNz0MTFDtWQdeVh3q17?=
 =?us-ascii?Q?qOR1mOqwfA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3515ae2-a85b-4325-169b-08de68fc9e91
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 23:32:13.6257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5gWcML4Ic5BLoyh/EB1tQIxfwqbk6KS52Pe7Fg38WMsjzLBpJqu89Z3DJW0PrZM1VnDqseD0MHaQMNYGyUJKSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8586
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
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 25ED811FFBD
X-Rspamd-Action: no action

This series provides CList module for interfacing with linked lists, GPU buddy
allocator bindings for physical memory management in nova-core and nova-core
Kconfig change to select GPU_BUDDY.

The clist patch (patch 1) is independent and go through any tree. The other 2
patches depend on the DRM buddy code movement patch as a prerequisite, a
version of which is now in drm-misc-next:
https://lore.kernel.org/all/20260206003451.1914130-1-joelagnelf@nvidia.com/

Based on linux-next.

The git tree with all patches can be found at:
git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: clist-gpu-buddy-v9-20260210)

Link to v8: https://lore.kernel.org/all/20260209214246.2783990-1-joelagnelf@nvidia.com/
Link to v7: https://lore.kernel.org/all/20260206004110.1914814-1-joelagnelf@nvidia.com/

Joel Fernandes (3):
  rust: clist: Add support to interface with C linked lists
  rust: gpu: Add GPU buddy allocator bindings
  nova-core: mm: Select GPU_BUDDY for VRAM allocation

 MAINTAINERS                     |   7 +
 drivers/gpu/nova-core/Kconfig   |   3 +-
 rust/bindings/bindings_helper.h |  11 +
 rust/helpers/gpu.c              |  23 ++
 rust/helpers/helpers.c          |   2 +
 rust/helpers/list.c             |  17 +
 rust/kernel/clist.rs            | 320 +++++++++++++++++++
 rust/kernel/gpu/buddy.rs        | 537 ++++++++++++++++++++++++++++++++
 rust/kernel/gpu/mod.rs          |   5 +
 rust/kernel/lib.rs              |   3 +
 10 files changed, 927 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/gpu.c
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/clist.rs
 create mode 100644 rust/kernel/gpu/buddy.rs
 create mode 100644 rust/kernel/gpu/mod.rs


base-commit: fd9678829d6dd0c10fde080b536abf4b1121c346
prerequisite-patch-id: 51e9eb2490026debebe75b8a0a9ce0c3991cd580
-- 
2.34.1

