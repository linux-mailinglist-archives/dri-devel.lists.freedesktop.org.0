Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMABBu5Uiml9JgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 22:43:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FC7114E3C
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 22:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA3310E48B;
	Mon,  9 Feb 2026 21:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tfjvg39e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012070.outbound.protection.outlook.com [52.101.53.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411DB10E384;
 Mon,  9 Feb 2026 21:43:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRI4xQpbysHXCyRPSSF9Yz5EORUPOmkyFdI8xD/SOyPrp8ru4z5ZQn0uEk1dPeg95r8Dqab3hpfIHxxvyF24CjK+ENtK9ITdUtk0OId5Xfgc+9r9bgRjKxXxNgukjZ4Xx0M7dn6Fcj8rDSZmAsE1pXEKg9N76XnGlIb5cQky1l3KfBkNmQNEvdEbaXlP4/gG3mTYjCC7K41mBnuFc0LhDU6Qk/1PZ4OnoprFRPEvhCJIsu0Iapap4wRFKO43N9/6IjiNQOpTzvUj0HC35j+EetBlwoohXpRiebpZ0o3sRHAtzrtot9xMhxWol3ZGLK5Ayg5JsyMu3NMNXVREgeIHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYg+NhnaRjVvl67L+v6irOh+Xuh0izLvEXjJpDKBpXg=;
 b=UpB6/IWeFNgsNFCqaF+p+ro09ZLzNUDMUOUJDZcdo5VpsTsaRwT2f5OplVbx2ggrAgJG5t3jwRGQ8A3jO+ay2os788neRr4bth3mQEwdiGXUoQToGTT6sirsmUqEnK1EpEyqJAt33myHeOkOPVhgX45yLVKGrbGhqd9Qz/ZbiseaMGiwPJ4jlIz3YUUmkLBI1gNhedP4IdjPpCNQYE6+YC8q8KT0DGQWK6K5dbjfSC/GC1Ay6ZtXZGnB+QKgsbqmoeeKevsJhg5jVdIXP9GVNKk23p4TlsqAKLn/wY3w/VO9MuF9v9xpZG+6eqR9gjZyukETucLh4G2bVFL2D4P0uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYg+NhnaRjVvl67L+v6irOh+Xuh0izLvEXjJpDKBpXg=;
 b=tfjvg39emfavRJlfKW1yNgYVRmGcNivmP9d+R7gTZ+qi9ExzGkLZhACAr6lg6L9RNRjL8vAWnX5Jkh0WZ9dXSaPd1gIE8JBhz3MveSTFZP0woi3Mrk5Me3uDQwwtyGKBXrK3KGSCMYdI/e6DX2fWkArn95lER3Xa01zhlC1ptyIM7lN21aN9JSMB6g0dB5Vexzr5sU9uKGMRxFHB/V/bCm+cJB3qrVLATQBQy86oXoayyffMn1t2Z/YZTl7vu4cth70yF+q3zCDC3P6aO7pS7SeKrtz36JKbsVIsw/L5Cspw9v+ydemYuRmrfyAfR/IynYBtbthEWcCYYnP8PR/CCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA1PR12MB8948.namprd12.prod.outlook.com (2603:10b6:806:38e::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.18; Mon, 9 Feb 2026 21:42:55 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 21:42:55 +0000
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
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH -next v8 1/3] rust: clist: Add support to interface with C
 linked lists
Date: Mon,  9 Feb 2026 16:42:44 -0500
Message-Id: <20260209214246.2783990-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209214246.2783990-1-joelagnelf@nvidia.com>
References: <20260209214246.2783990-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0072.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::17) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA1PR12MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce8e621-97a1-4b96-8a8e-08de68242f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nvYfOdztJhB4ibMUJ9NPpXlZhLVQNLRY2lCcoimPtrIsVVf0b52QNbXP5M/p?=
 =?us-ascii?Q?F5TjWvJOF2VLiGX0/sLRfa9utcA3u60LHnm96jhMkh5jltAR6ofsE127hAyS?=
 =?us-ascii?Q?Y3/itXUdXc+FrUH6dOLqjgzF5RQBgcVCGwjDnLRshVdFcHFZj84ivQvDaNFW?=
 =?us-ascii?Q?PZNWwEGVcvVjt8WK1Mh2z0AEOZKEeltBOG86oMLCO+K73tEbV8OhY979SDE/?=
 =?us-ascii?Q?tCj8BsWYK5RKvedKE3OqaPGOyGQnYSfckxNof3mej635McMlwq+HUvXUOAeD?=
 =?us-ascii?Q?Q5mc0Bs06/U+79itePGkWw30eYeJzvA4BVdBHV8/mCIPuNciD+67Hc7ug9DS?=
 =?us-ascii?Q?ZtECzxsY68qQ6qsb752/MAkLo32Q4VhKdLDpVj79pT/pbRyMrOPulaFqoEvq?=
 =?us-ascii?Q?+/YlZCtalVXYOexxFkJN5tIKHUuvAFq162Y0LO7IS1qP+z1r4QHqnj0KYR4E?=
 =?us-ascii?Q?9rRbTOKGxdjwvhWjJfq5sLviHClXS73cOfRF+Ld9PNDA3U0NOy4p3BKdNr44?=
 =?us-ascii?Q?UdVet51zzvF7YBlPrUf44ecwosb1avT4jloO8nRTbU7BDAHKlGWDRFNHtB4R?=
 =?us-ascii?Q?UtPDulWAG7VNOocpLhpGre9ZJJwk9rtuNRDeSJua7e38tKVV4cJ/ACVQKtrT?=
 =?us-ascii?Q?U4+BaaCYgFzaVrxgEfY6FBb02TVX0OS2o35Uw8se2lRqY7XrHLrjQvt+Sg8q?=
 =?us-ascii?Q?2qQnH4y4gFXPKnmj1Bjn/u513/EQLVyfwinZqZF+SOLPkKCI9IvIe1iQyZpy?=
 =?us-ascii?Q?W+bvp/cbqO3Jrm3u4PBoMCjLbO6ivv4kYVrNQU1KzTpaW496Ahe+nBC+ybi1?=
 =?us-ascii?Q?5Y8o+aME6VGq/EDsslOkTxYyhXZZH3yN/GWIWu2hP1SO1okRngrnxVuaPdng?=
 =?us-ascii?Q?ONvn0t60eBfpVusVAGrgLiCC1GN7C7KeUO5HZkJNL55RBAydRLqgEvYHCP+l?=
 =?us-ascii?Q?VMuFSYtBykGjf48fpNHWb9aFQzAL1GEWZC4StOokZC8o/D5vs1Hu+4nGiQXr?=
 =?us-ascii?Q?reT2JVqYQB0hiIcUKdtCZDGtSSCc30bNUYvF5be42yTXnrH9sICAdOklu2cq?=
 =?us-ascii?Q?yBmK2it1NX8pnWszLLb9DpJVl0HsXSyP0dYwGAicETWBgx5DkQWRoLKg9PXe?=
 =?us-ascii?Q?JRwCQNpkT7wvaQygcPtNU0ZOyJ0/QKQaYBR4ascd+ltw7Svae82lVAtARbBw?=
 =?us-ascii?Q?Sb+DxLnRORHc+90pJMEfLtayyV9E/YcCxekzAZr5o26Lvef7XWf6Ewd6wvKB?=
 =?us-ascii?Q?UclC/jbSCvnbJ0qwtVJ8mIcZ701j+UdBoomHAf0eYjQMsrtWxqfidgXv3MF8?=
 =?us-ascii?Q?G2QY1UhUfgk4eWMnJk11RUEIqf0tfRZDHR9x/eWGZrXh8Hkm4xlQfCQhhA5M?=
 =?us-ascii?Q?U+M38woD/JzVi1kBLFjvtJprkVGklFjh1MN7s5rn/C0RzJWZuK5KQUj9sJDq?=
 =?us-ascii?Q?4q7106ePcAeC0WPxjQdeeKaxBcxTM4r5jaUxvgCgOsSd/aJ8Hl6hNhVaOGCC?=
 =?us-ascii?Q?Q6shK8WuEQcOZ1XAjlvEPyQr8SWe7GrHcCammHJh0ajZYJWi+MpMMP3nd8l/?=
 =?us-ascii?Q?Hc78pdzRcptUEVsVrO8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pzWa/AILdfVMLo8KSRHOA6sjWI1E+26GpH7P/ajpwf6x5IC0ZqKbmx8TBLMH?=
 =?us-ascii?Q?+BgLk1jOCaCIm7aQoc8uhkvrhr138rOMjKJCja+Wbs3W3cVh9UUq/jmOCNLl?=
 =?us-ascii?Q?0wvBNSn33M663ir2T17+US/h3ezHl8EFkPe632j7kBFPOdl8d/Mg9+zOy5mC?=
 =?us-ascii?Q?q2Ledcb22E6eEH8hlUiXQzHc0396i9gKV+HLJB0yesuFd06shEdq2yIctSgI?=
 =?us-ascii?Q?RT+zHpwM6ax9oWTngYQ56qfeQ+DBIY/UmeMFAoAmOVM6i5ZUZaj/nALT4+wv?=
 =?us-ascii?Q?4pA93lKDrWGL51f7OY3gk4wlUEIgoFBRsj6l2Ou910cUDktjHlEp3HkFTvqJ?=
 =?us-ascii?Q?ZLYyuUZKaE05txEz2xDYcZlRyv4Ld29t5zKXLfnlY/PK+Z8G5ZgYtLUdffWs?=
 =?us-ascii?Q?eNJXkP7S2yzNbXfxZq+tu9yG4Kn+h3bZTR88Hcsmp+XkWvy5zkCPoXseOKAg?=
 =?us-ascii?Q?nhQuIpZ+RqslmS20eWQme9IoArCQFhEkpP6CqDfbnlCN711YRKbJG/NTZR3j?=
 =?us-ascii?Q?+vum1Irx/d1N0wdNZ38fwpYUQug1VK20sWB9i8A4PBwKc1oSVYaqfyy6LIkz?=
 =?us-ascii?Q?rmS8p8AFU4AzvfOg1Q7QhRX3+46eo9BCbvrMAA4smnRymJHFl3uWC2Qj/gHp?=
 =?us-ascii?Q?3waY7zuzC+Q0X4SZ7G9c9vCaODgtZrtQzs2hx4WrY72wD2FuehigtUmriTE6?=
 =?us-ascii?Q?b8W1yDdtktI+Pl2QRvPaVnm06Gn9/4Kkw3soS6YLSbex6iqWpAX5693CMyB2?=
 =?us-ascii?Q?izpPCVDzZfskr48miqU6y6CQ/lXeGsUy1FqF6qBq2vJg8a0r0KzFqgnq7C3q?=
 =?us-ascii?Q?I3UMS5MTtdDXXDCivH9az34GWk6OgUgzX8y56Dhfe9F4fykP6/OYi2j5N8HA?=
 =?us-ascii?Q?kQcsTG0aaI1uc9u1btYA0aGP/TwbjyLAqWZcv2OwviBBAkGgqCH2t4QY/Mgh?=
 =?us-ascii?Q?aVoTCsvdDJsSlOIw5IK7LWEWQ2a5CjI37AMWiv0kqxkiiIvhc/VTii1gd8xc?=
 =?us-ascii?Q?PfTf1m2/ZK1Cy6OyGP+6yANO7K3uD1bcTtCfMBBGoAQ3llXLuIVIbDDpR6ZO?=
 =?us-ascii?Q?WN0OaMfXeP6ch82ECqb420BfvvPfhauXJc8NgxTISTaIZNqSPmgSc2sqedbG?=
 =?us-ascii?Q?0zKjzyciu26Yjc5ZEXrqBn2ru1HfQiLc4Fq6YL54b+vuOHBN78dlPOyHlp/3?=
 =?us-ascii?Q?MScerwiqLohzXN5gUS77My/NrMr9zkR6uFWmJBlVCCVh/b/Ix6hvklo/Z1zT?=
 =?us-ascii?Q?CdQB89kTHoGYU7tDahhPk8MraUXdE9g8ZGUlsdK5yaPT1M/XVRXqvlMAoVWv?=
 =?us-ascii?Q?jrzznU/KQ9LF4Pax9TKMyp5kjq8QMSSNXPAeRGeXFCSjD4fvTAzMcHTv20wt?=
 =?us-ascii?Q?uhcDJZcL+tP2zjW+EudTpjAIPDDogizNR2c+5QJtG1Er5cYI0GTNP016o37C?=
 =?us-ascii?Q?tlLp0MXJ4mhpZ3nNcOJIRbsClLDKL6/p9uJyxLg/WUn1BMkAukbLlO/psneM?=
 =?us-ascii?Q?rO665XsTKY1fdU0G3M+Nq5krVHIUjk9DjfEl05xDUKPltg+fdT/pfQ6Em0pX?=
 =?us-ascii?Q?AMjCla28QmPxpv6O8WGsshWTBo4JwH+DARUSffsgWqZuzZWAaEqiP8NQzpzO?=
 =?us-ascii?Q?MzPQ9k14v0a1CrlL1tGF9/fnRvIpciUR7Y5U0fiNklg/AtafyuFgKWaU29kM?=
 =?us-ascii?Q?n2G2bLnfv58LxSmH8FHcpRlj8h2u0XCzkfwwjG0sgM34za9XfZXqu7ANaAVI?=
 =?us-ascii?Q?VC652p/Ctg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce8e621-97a1-4b96-8a8e-08de68242f4b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 21:42:55.6579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5Xz/UI/zJl2Z8Mz3n3OyubobqjiUpOe4M4puiYrn2TkgEsIE9RYo75K2XCAXHw+cdDmCwQCv/L115hZNPpusA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8948
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
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,auristor.com:email]
X-Rspamd-Queue-Id: A4FC7114E3C
X-Rspamd-Action: no action

Add a new module `clist` for working with C's doubly circular linked
lists. Provide low-level iteration over list nodes.

Typed iteration over actual items is provided with a `clist_create`
macro to assist in creation of the `CList` type.

Acked-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 MAINTAINERS            |   7 +
 rust/helpers/helpers.c |   1 +
 rust/helpers/list.c    |  17 +++
 rust/kernel/clist.rs   | 320 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 5 files changed, 346 insertions(+)
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/clist.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 900fc00b73e6..310bb479260c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23204,6 +23204,13 @@ S:	Maintained
 T:	git https://github.com/Rust-for-Linux/linux.git rust-analyzer-next
 F:	scripts/generate_rust_analyzer.py
 
+RUST TO C LIST INTERFACES
+M:	Joel Fernandes <joelagnelf@nvidia.com>
+M:	Alexandre Courbot <acourbot@nvidia.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+F:	rust/kernel/clist.rs
+
 RXRPC SOCKETS (AF_RXRPC)
 M:	David Howells <dhowells@redhat.com>
 M:	Marc Dionne <marc.dionne@auristor.com>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index a3c42e51f00a..724fcb8240ac 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -35,6 +35,7 @@
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
+#include "list.c"
 #include "maple_tree.c"
 #include "mm.c"
 #include "mutex.c"
diff --git a/rust/helpers/list.c b/rust/helpers/list.c
new file mode 100644
index 000000000000..4c1f9c111ec8
--- /dev/null
+++ b/rust/helpers/list.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Helpers for C Circular doubly linked list implementation.
+ */
+
+#include <linux/list.h>
+
+__rust_helper void rust_helper_INIT_LIST_HEAD(struct list_head *list)
+{
+	INIT_LIST_HEAD(list);
+}
+
+__rust_helper void rust_helper_list_add_tail(struct list_head *new, struct list_head *head)
+{
+	list_add_tail(new, head);
+}
diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
new file mode 100644
index 000000000000..8aa72b5d54be
--- /dev/null
+++ b/rust/kernel/clist.rs
@@ -0,0 +1,320 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A C doubly circular intrusive linked list interface for rust code.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::{
+//!     bindings,
+//!     clist_create,
+//!     types::Opaque, //
+//! };
+//! # // Create test list with values (0, 10, 20) - normally done by C code but it is
+//! # // emulated here for doctests using the C bindings.
+//! # use core::mem::MaybeUninit;
+//! #
+//! # /// C struct with embedded `list_head` (typically will be allocated by C code).
+//! # #[repr(C)]
+//! # pub struct SampleItemC {
+//! #     pub value: i32,
+//! #     pub link: bindings::list_head,
+//! # }
+//! #
+//! # let mut head = MaybeUninit::<bindings::list_head>::uninit();
+//! #
+//! # let head = head.as_mut_ptr();
+//! # // SAFETY: head and all the items are test objects allocated in this scope.
+//! # unsafe { bindings::INIT_LIST_HEAD(head) };
+//! #
+//! # let mut items = [
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! # ];
+//! #
+//! # for (i, item) in items.iter_mut().enumerate() {
+//! #     let ptr = item.as_mut_ptr();
+//! #     // SAFETY: pointers are to allocated test objects with a list_head field.
+//! #     unsafe {
+//! #         (*ptr).value = i as i32 * 10;
+//! #         // &raw mut computes address of link directly as link is uninitialized.
+//! #         bindings::INIT_LIST_HEAD(&raw mut (*ptr).link);
+//! #         bindings::list_add_tail(&mut (*ptr).link, head);
+//! #     }
+//! # }
+//!
+//! // Rust wrapper for the C struct.
+//! // The list item struct in this example is defined in C code as:
+//! //   struct SampleItemC {
+//! //       int value;
+//! //       struct list_head link;
+//! //   };
+//! //
+//! #[repr(transparent)]
+//! pub struct Item(Opaque<SampleItemC>);
+//!
+//! impl Item {
+//!     pub fn value(&self) -> i32 {
+//!         // SAFETY: [`Item`] has same layout as [`SampleItemC`].
+//!         unsafe { (*self.0.get()).value }
+//!     }
+//! }
+//!
+//! // Create typed [`CList`] from sentinel head.
+//! // SAFETY: head is valid, items are [`SampleItemC`] with embedded `link` field.
+//! let list = unsafe { clist_create!(head, Item, SampleItemC, link) };
+//!
+//! // Iterate directly over typed items.
+//! let mut found_0 = false;
+//! let mut found_10 = false;
+//! let mut found_20 = false;
+//!
+//! for item in list.iter() {
+//!     let val = item.value();
+//!     if val == 0 { found_0 = true; }
+//!     if val == 10 { found_10 = true; }
+//!     if val == 20 { found_20 = true; }
+//! }
+//!
+//! assert!(found_0 && found_10 && found_20);
+//! ```
+
+use core::{
+    iter::FusedIterator,
+    marker::PhantomData, //
+};
+
+use crate::{
+    bindings,
+    types::Opaque, //
+};
+
+use pin_init::{
+    pin_data,
+    pin_init,
+    PinInit //
+};
+
+/// Wraps a `list_head` object for use in intrusive linked lists.
+///
+/// # Invariants
+///
+/// - [`CListHead`] represents an allocated and valid `list_head` structure.
+#[pin_data]
+#[repr(transparent)]
+pub struct CListHead {
+    #[pin]
+    inner: Opaque<bindings::list_head>,
+}
+
+impl CListHead {
+    /// Create a `&CListHead` reference from a raw `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
+    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
+    /// - The list and all linked `list_head` nodes must not be modified by non-Rust code
+    ///   for the lifetime `'a`.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
+        // SAFETY:
+        // - [`CListHead`] has same layout as `list_head`.
+        // - `ptr` is valid and unmodified for 'a per caller guarantees.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Get the raw `list_head` pointer.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::list_head {
+        self.inner.get()
+    }
+
+    /// Get the next [`CListHead`] in the list.
+    #[inline]
+    pub fn next(&self) -> &Self {
+        let raw = self.as_raw();
+        // SAFETY:
+        // - `self.as_raw()` is valid per type invariants.
+        // - The `next` pointer is guaranteed to be non-NULL.
+        unsafe { Self::from_raw((*raw).next) }
+    }
+
+    /// Check if this node is linked in a list (not isolated).
+    #[inline]
+    pub fn is_linked(&self) -> bool {
+        let raw = self.as_raw();
+        // SAFETY: self.as_raw() is valid per type invariants.
+        unsafe { (*raw).next != raw && (*raw).prev != raw }
+    }
+
+    /// Pin-initializer that initializes the list head.
+    pub fn new() -> impl PinInit<Self> {
+        pin_init!(Self {
+            // SAFETY: `INIT_LIST_HEAD` initializes `slot` to a valid empty list.
+            inner <- Opaque::ffi_init(|slot| unsafe { bindings::INIT_LIST_HEAD(slot) }),
+        })
+    }
+}
+
+// SAFETY: [`CListHead`] can be sent to any thread.
+unsafe impl Send for CListHead {}
+
+// SAFETY: [`CListHead`] can be shared among threads as it is not modified
+// by non-Rust code per safety requirements of [`CListHead::from_raw`].
+unsafe impl Sync for CListHead {}
+
+impl PartialEq for CListHead {
+    #[inline]
+    fn eq(&self, other: &Self) -> bool {
+        core::ptr::eq(self, other)
+    }
+}
+
+impl Eq for CListHead {}
+
+/// Low-level iterator over `list_head` nodes.
+///
+/// An iterator used to iterate over a C intrusive linked list (`list_head`). Caller has to
+/// perform conversion of returned [`CListHead`] to an item (using `container_of` macro or similar).
+///
+/// # Invariants
+///
+/// [`CListHeadIter`] is iterating over an allocated, initialized and valid list.
+struct CListHeadIter<'a> {
+    /// Current position in the list.
+    current: &'a CListHead,
+    /// The sentinel head (used to detect end of iteration).
+    sentinel: &'a CListHead,
+}
+
+impl<'a> Iterator for CListHeadIter<'a> {
+    type Item = &'a CListHead;
+
+    #[inline]
+    fn next(&mut self) -> Option<Self::Item> {
+        // Check if we've reached the sentinel (end of list).
+        if self.current == self.sentinel {
+            return None;
+        }
+
+        let item = self.current;
+        self.current = item.next();
+        Some(item)
+    }
+}
+
+impl<'a> FusedIterator for CListHeadIter<'a> {}
+
+/// A typed C linked list with a sentinel head.
+///
+/// A sentinel head represents the entire linked list and can be used for
+/// iteration over items of type `T`, it is not associated with a specific item.
+///
+/// The const generic `OFFSET` specifies the byte offset of the `list_head` field within
+/// the struct that `T` wraps.
+///
+/// # Invariants
+///
+/// - The [`CListHead`] is an allocated and valid sentinel C `list_head` structure.
+/// - `OFFSET` is the byte offset of the `list_head` field within the struct that `T` wraps.
+/// - All the list's `list_head` nodes are allocated and have valid next/prev pointers.
+#[repr(transparent)]
+pub struct CList<T, const OFFSET: usize>(CListHead, PhantomData<T>);
+
+impl<T, const OFFSET: usize> CList<T, OFFSET> {
+    /// Create a typed [`CList`] reference from a raw sentinel `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure
+    ///   representing a list sentinel.
+    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
+    /// - The list must contain items where the `list_head` field is at byte offset `OFFSET`.
+    /// - `T` must be `#[repr(transparent)]` over the C struct.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
+        // SAFETY:
+        // - [`CList`] has same layout as [`CListHead`] due to repr(transparent).
+        // - Caller guarantees `ptr` is a valid, sentinel `list_head` object.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Check if the list is empty.
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        !self.0.is_linked()
+    }
+
+    /// Create an iterator over typed items.
+    #[inline]
+    pub fn iter(&self) -> CListIter<'_, T, OFFSET> {
+        let head = &self.0;
+        CListIter {
+            head_iter: CListHeadIter {
+                current: head.next(),
+                sentinel: head,
+            },
+            _phantom: PhantomData,
+        }
+    }
+}
+
+/// High-level iterator over typed list items.
+pub struct CListIter<'a, T, const OFFSET: usize> {
+    head_iter: CListHeadIter<'a>,
+    _phantom: PhantomData<&'a T>,
+}
+
+impl<'a, T, const OFFSET: usize> Iterator for CListIter<'a, T, OFFSET> {
+    type Item = &'a T;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        let head = self.head_iter.next()?;
+
+        // Convert to item using OFFSET.
+        // SAFETY: `item_ptr` calculation from `OFFSET` (calculated using offset_of!)
+        // is valid per invariants.
+        Some(unsafe { &*head.as_raw().byte_sub(OFFSET).cast::<T>() })
+    }
+}
+
+impl<'a, T, const OFFSET: usize> FusedIterator for CListIter<'a, T, OFFSET> {}
+
+/// Create a C doubly-circular linked list interface `CList` from a raw `list_head` pointer.
+///
+/// This macro creates a `CList<T, OFFSET>` that can iterate over items of type `$rust_type`
+/// linked via the `$field` field in the underlying C struct `$c_type`.
+///
+/// # Arguments
+///
+/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bindings::list_head`).
+/// - `$rust_type`: Each item's rust wrapper type.
+/// - `$c_type`: Each item's C struct type that contains the embedded `list_head`.
+/// - `$field`: The name of the `list_head` field within the C struct.
+///
+/// # Safety
+///
+/// This is an unsafe macro. The caller must ensure:
+///
+/// - `$head` is a valid, initialized sentinel `list_head` pointing to a list that remains
+///   unmodified for the lifetime of the rust `CList`.
+/// - The list contains items of type `$c_type` linked via an embedded `$field`.
+/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
+///
+/// # Examples
+///
+/// Refer to the examples in this module's documentation.
+#[macro_export]
+macro_rules! clist_create {
+    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) => {{
+        // Compile-time check that field path is a list_head.
+        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
+            |p| &raw const (*p).$($field).+;
+
+        // Calculate offset and create `CList`.
+        const OFFSET: usize = ::core::mem::offset_of!($c_type, $($field).+);
+        $crate::clist::CList::<$rust_type, OFFSET>::from_raw($head)
+    }};
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f4ee..fe711d34ca1e 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -75,6 +75,7 @@
 pub mod bug;
 #[doc(hidden)]
 pub mod build_assert;
+pub mod clist;
 pub mod clk;
 #[cfg(CONFIG_CONFIGFS_FS)]
 pub mod configfs;
-- 
2.34.1

