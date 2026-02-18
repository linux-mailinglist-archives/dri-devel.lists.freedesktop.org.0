Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNt9O1stlmmlbwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EDC159E32
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C567210E66F;
	Wed, 18 Feb 2026 21:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z+1z0E9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011035.outbound.protection.outlook.com [40.107.208.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D0D10E66E;
 Wed, 18 Feb 2026 21:21:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lm9zWkw5nKfyDehwyNqUptjK+x6o+7J50bfKIpjaFqd7kar/d1CbjZFQWV243JoCm+xaIZOiUeKqlrtxlJ90jg4Tdl/PPaYONeAjKq3hTdxFMtWU61u8EjF/AzSn07ohGuobYvUVBc/3m1QsHD558QFh5WtFnCJipCwL0QNgf5caLY7wgUeMGqUM9XmUY3tIllQafwpE/SuU547bwHgn882jgppDx0vFsC9s4yjTR0Ez6+OJwy83AkIloseHPRSN03M8z8XOc+/vHLKT3f0Ja+Z/BXOQP2UwSboY9/Kv1h46dNnf9gD38sVnYXoE/xQoicZt2mm7elGbt1DL4GF+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3kncOcQpD92IiZPyG98LLINEN1ssI9ZcSDi/UEFtQs=;
 b=yL44sVP3OaRFe0gbByJDWlgummaHhHhG8Rorly9jjeYO/I5auD4OmBX0fd00JaaVIrfyWBeXAy0V7X/w1Wyk8UUEkDSKghK7csEFColopGUg6VXpTXHa5hKBIZFDGnJRZmkX22U82gLxwyVBzLdFeZX6Q5NoPa7LXvAK9FD2fWwtZSz0D8VzktXpnNxvmqAZnri+oJdnZN3EC7SM8x8urIyxpOS39XthcH3gUNh46BKbr8xK9GHqeAO2JRCcnUJqobMCIY8W7fuXeW1w6MTuwH2mlcPOkZvmk+LhV/UF6jcx8p/08NvsKjrTWJ5nWRUrazFtOj/v/0F7D+BcYe9ntQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3kncOcQpD92IiZPyG98LLINEN1ssI9ZcSDi/UEFtQs=;
 b=Z+1z0E9hvEmVsFEpH/4ZuykOzGnyC2yTKO83WqKUv48I3g9d04LXqf0EiOsUIrdeqcjTztHGFCtCPjgdns6l68xJ39L2Ue3hgtEAT+cclIzMTHK7rpCJ2Lz+gjywMEz4wtg8l06GNC66cc+PiFKKkMUWmbqewBmeF51NEgV27WJ4zoMzco7xzWvXBi8u2T4jQyRc7CPHOqar3QnWlYks0sgwV9kUS75p0roPK0G/8dCUOa2OFbev01Y/o3vlyZMYdRtDS/RHKs9uNq/E6EXoDWZAw1H+aIbVbMJBUlmeS7RGQm08jWlgDJgp/y0CiZ0r/n1hfbAwsAk6H8wBs/uDGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:21 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:21 +0000
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
Subject: [PATCH v7 10/23] nova-core: mm: Add TLB flush support
Date: Wed, 18 Feb 2026 16:20:07 -0500
Message-Id: <20260218212020.800836-11-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::26) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: 179fc581-440a-4f47-9a6d-08de6f33a96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DCIdncn2iLJ3kC3viV+LtHRkjiUaXmN9WqjZ3MT7rAAx4qt42iVPBLI0YyPE?=
 =?us-ascii?Q?8vj9ntfNxNk3sMMf9xKPt8JI/VU88WmOMcbBlGmrYM4tMWuudtwOmWcr9RWH?=
 =?us-ascii?Q?6aKFEhIvOoGnwnpDjNANk6xpVRavX6IDlIAAu1pymHkGzcUoarzdL4lVXkEh?=
 =?us-ascii?Q?MpBysc7eXFFX/t0Kn+//+gmwE3aj0FUF6khpjupXcAOXxVqe3OLLmXK5aVAH?=
 =?us-ascii?Q?Vi9Vh8L+BDu4WrCXZCaNq8CcVVkdY7O6obuFStz6JCPHDhM1XK8wG9gjM99v?=
 =?us-ascii?Q?TLwfnwM0NipVu0HV6Jv2/Thh0OoB43OQXox/IA5Sy7+YXRku4bIR7zhLM/yO?=
 =?us-ascii?Q?zAqEP6TEdrsWESoYKL2Ig9MYxU00P2b/CSSxJlK3q1QfIparl+zzOdYHt978?=
 =?us-ascii?Q?N1b97jf4eT7iiZI77aPUTwh05GovdPfGJ1FEsQVFhvMrRlUw/bB0J/rlNPmi?=
 =?us-ascii?Q?EbJXqB4D5n90F+/3v27VYTBv3XuQ/IiBR12eSXYg7b3MSy4T/ujcIxw6SV59?=
 =?us-ascii?Q?D/MA24ydb7Q3yxMRW+Qj8oQ6OoIxqVgmLgnBe5HAkAnG+OpvdrsMLev1xnyF?=
 =?us-ascii?Q?QTMzfrjlkWBD5hYJk9NJAy03TJqwhW+Trvo1PdWrdnda9dWir+oqGqECRuPg?=
 =?us-ascii?Q?HHEVhj3nO/W23Yz4jpw5UBLDlmB8RVMrAKDRQJZfB4RJupdBDZlk9sAS2Ngo?=
 =?us-ascii?Q?rWHOhnz7diWpbHF8xxO1FGUwVlA09QxrYAZ4U1ucZ9S66lx4nOrNrsyQaFrr?=
 =?us-ascii?Q?8n4YCnpcsCnSS+NzFT3RwQYELmCP3URzm/+hLcywBEXdX9imdUd8AkWiCzS0?=
 =?us-ascii?Q?ez+BhqBJySrEaG/6s2Iwx6WYywHGov650NiTP3697ESrk/Yd33TBp7K0tklm?=
 =?us-ascii?Q?opYQI4uQp6ib6zHll7ZSSs1V6TsoyoPxSJUCG3Ixd4uKzEDcYNQzhECIeEdB?=
 =?us-ascii?Q?RMzDOvgLUWg3mUmU9q9PbvzmXk5Day/R9TAVCIBry7SKar1Xt0m2RRm+7VFr?=
 =?us-ascii?Q?2PLTUXq3d15OaHU0pbjVJU5JkDqvfIIyqSWoyuYUhFY9NglH6C3/EOYH0HXi?=
 =?us-ascii?Q?LKnrAni+GvG9rLqec5EI23UwHWGgaYFhTxcT1SNMLb498qZ/pgyVPVxnS3pK?=
 =?us-ascii?Q?+oZsB17I/850KBSSaRz/e++aPNZTTmiii3hfnWzPWLaLCUAMLTF+0wdTJh3S?=
 =?us-ascii?Q?9X+lPwny5WNCuWasHfN8qcq630BqOmZowJ5a5dKVMJDrfqTIT9t4stRCidgD?=
 =?us-ascii?Q?AZ7C0MOMPCcYCVEfbpy81OfwT5APUxAVU9l1Bv7vJL7578HMN1kYNoaPRT6J?=
 =?us-ascii?Q?TJAIjM4qpOQAWJzmSfd62tpKzPDBzKCmcWIS/gq3Cx8S39fOR6gtQ4C84pRU?=
 =?us-ascii?Q?aa4XH9otJOSnTpyOnclFWmULMJwhHpuZqGiYlayKIhcfwgt6BkqLBQS1i7WQ?=
 =?us-ascii?Q?wnVhPd68Q4oBj7zs5MkZDPlFS2SWpKlG3mOylX+2uGnBvO4iOAilbwMLPnVd?=
 =?us-ascii?Q?YlcbxAgzSumftzovQVFDVf8aiFv8ullZhdzv1UW2xRkd0TlqEAQfHWbb4bn3?=
 =?us-ascii?Q?6xraB8bKPKiRkCvMu/o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?20cHxl35fiwHUbP5n07ArgeGN1zPDYmjIHkKt6oDa0U9PNsTP72IP0+FXtSl?=
 =?us-ascii?Q?vifazNMB2i+KdObzd8y39MQZ+eqTenXxx+pQ2UjOoKaPN2xHTRRCyqcg20Z6?=
 =?us-ascii?Q?5DafGmiBjfG4pLZH2kaimBmvYDNUUw5pTh1WS5oiYinxZg/8EoVoQsUFUIZD?=
 =?us-ascii?Q?FKM8JCxZ3W+6B4N8UUUXSW0n0JviESYAvAIbbMD4f9Q+B6Fh/fzDIIkNPRem?=
 =?us-ascii?Q?k0iD0fNqD1SFJZOEBI1wpkxduey/Hpp1wqVUUMrIecRBZRag0+n74XkR9LzQ?=
 =?us-ascii?Q?XfmjD0Qc5frNU2vx97POVIqpsZhEGflukTjkWoRO4yKkc7Sy3chNoeUxZ5iE?=
 =?us-ascii?Q?UvOsEeidK/Q49dkFIPchrSMejCm2ehVT/u3BxcL4aZgsJqXDs5RAwsomsy54?=
 =?us-ascii?Q?YqUSehz3Vk6eJw6G7NF7CYWCnbD6GcIKuND6tWI8/se3mfXgVeT6mpuUy6X2?=
 =?us-ascii?Q?oE3A8uS6rAP6zcUYs6Kdj8HPCfp5eUjvF88wgpBjvinfxrG3PnlcAhMcu9f6?=
 =?us-ascii?Q?RPvWgMqvtZ+gsVkenubqOJpTCOlarbr+0rawblhjZSwVqYpRnS1oo/2jgVxx?=
 =?us-ascii?Q?rNv7PpVXKksvfv1HCV0/RgisfEY+bvh8wWjc/OA3HvQwPmFIBSqAi1btG4Nz?=
 =?us-ascii?Q?WKf5emwhiThxb9c9PiOlraN3kkeIOOt6ImZwQ6sexEPC8zPb47c1zGZa9TJn?=
 =?us-ascii?Q?/piw7ZD80SsV6bOLZep5bP0F4+BTzYZn/GxSAXFCp66zHA0BjlmbgMQlj7kA?=
 =?us-ascii?Q?ng4MdPX2TviRWwsuAV93KQ0jlp/iofcyOmxzv9keQlZwq3rNF/6qQO9SD5Xj?=
 =?us-ascii?Q?7LGnVEPiCZ95uLI7RHs40SdhlSMhNkuZ1mSBrEMkzg1KVseziw3UBAvQQNoa?=
 =?us-ascii?Q?ofs4lZEJnOjqYKAhLZZXdD2uDr30d0yVttpZ3TnEoLgpkWApBsrAsnRGdgwu?=
 =?us-ascii?Q?XNpe+euvvWzai8hAdm5QQvp2ve+7W/IVVSRH81tjV6Gqt7PLVZqKdhM+pQ7Y?=
 =?us-ascii?Q?OWD9UTlKsnBnumthCpTf5p0LNXRcwJQ/YNun95aN2brkAtiWiJj7+3YcSLUH?=
 =?us-ascii?Q?6fb9+YIH26wSAVNZEJzY9chOu5WxLOCUS5JThkh/fy1VJbbg/hgFAnZO0ubL?=
 =?us-ascii?Q?wO3+3pmVx5mLwLl2nyVD0OebrV3mbV/Vh825zXZMFZEqtb+LEmi5BmzVwSBK?=
 =?us-ascii?Q?hTzWRd9oknjkB7g8791ogRZzmnpWJj4kehoiY41PqeSbsMWkhmYwbH+EYo0p?=
 =?us-ascii?Q?yv+61aPR1s9NkgijekSC/S7I5CJc2o40xhcMPgEndslBul5rlYHniaaj+zaA?=
 =?us-ascii?Q?xMUHJwy6jJW8W2aMj0lDaxKie+uEooero0NvI+sgecCdTk5jc3DsyWiB4fTG?=
 =?us-ascii?Q?moafXQM6tQ0La0jJBTOysSUefu0y+hL8bK3yvBlIYF3VhaQwCCyHFBY6H+gg?=
 =?us-ascii?Q?aaAJ6RUwr3HcuDETMbV0OKQ4hph7MJNlqEJNOxDLORWpyxSv6orBAH8qiBwv?=
 =?us-ascii?Q?1EewdBCnQSsAZa29T1UU4cFBg2l4lYtemDZNqfT4h0rHMIiwr10xY2jK9p0S?=
 =?us-ascii?Q?fzRbFkvLjS8uWTftl41toTguoze/IFKXFeY1lBvkAJ+v1I0SQh0kvGx8T7LO?=
 =?us-ascii?Q?AvP1xQqG3bFW/DtrDsbWL2yVamrseQFIPGVbjpUYJcO3fkG4k8SeMJwr/eSA?=
 =?us-ascii?Q?qrWINKdEv6wzVMP1Di+5/TNWWcISrLtZLkS1HPNh274oG3R8HVWEBeWFCD+a?=
 =?us-ascii?Q?RNDT1tKbcQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 179fc581-440a-4f47-9a6d-08de6f33a96b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:21.6910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPPOt1qMpdTnu568EfGLffTtcBcVxewSfXxQhOa9UdZNorty4i4XMtU45ee804dmSt6b9rMEHqna0prcGCXCiA==
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
X-Rspamd-Queue-Id: A0EDC159E32
X-Rspamd-Action: no action

Add TLB (Translation Lookaside Buffer) flush support for GPU MMU.

After modifying page table entries, the GPU's TLB must be invalidated
to ensure the new mappings take effect. The Tlb struct provides flush
functionality through BAR0 registers.

The flush operation writes the page directory base address and triggers
an invalidation, polling for completion with a 2 second timeout matching
the Nouveau driver.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/mod.rs |  1 +
 drivers/gpu/nova-core/mm/tlb.rs | 92 +++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs   | 33 ++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/tlb.rs

diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
index c88b7b7b6975..eafd56964b1b 100644
--- a/drivers/gpu/nova-core/mm/mod.rs
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -6,6 +6,7 @@
 
 pub(crate) mod pagetable;
 pub(crate) mod pramin;
+pub(crate) mod tlb;
 
 use kernel::sizes::SZ_4K;
 
diff --git a/drivers/gpu/nova-core/mm/tlb.rs b/drivers/gpu/nova-core/mm/tlb.rs
new file mode 100644
index 000000000000..466c7731323e
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/tlb.rs
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! TLB (Translation Lookaside Buffer) flush support for GPU MMU.
+//!
+//! After modifying page table entries, the GPU's TLB must be flushed to
+//! ensure the new mappings take effect. This module provides TLB flush
+//! functionality for virtual memory managers.
+//!
+//! # Example
+//!
+//! ```ignore
+//! use crate::mm::tlb::Tlb;
+//!
+//! fn page_table_update(tlb: &Tlb, pdb_addr: VramAddress) -> Result<()> {
+//!     // ... modify page tables ...
+//!
+//!     // Flush TLB to make changes visible (polls for completion).
+//!     tlb.flush(pdb_addr)?;
+//!
+//!     Ok(())
+//! }
+//! ```
+
+#![allow(dead_code)]
+
+use kernel::{
+    devres::Devres,
+    io::poll::read_poll_timeout,
+    new_mutex,
+    prelude::*,
+    sync::{Arc, Mutex},
+    time::Delta, //
+};
+
+use crate::{
+    driver::Bar0,
+    mm::VramAddress,
+    regs, //
+};
+
+/// TLB manager for GPU translation buffer operations.
+#[pin_data]
+pub(crate) struct Tlb {
+    bar: Arc<Devres<Bar0>>,
+    /// TLB flush serialization lock:  This lock is acquired during the
+    /// DMA fence signalling critical path. It must NEVER be held across any
+    /// reclaimable CPU memory allocations because the memory reclaim path can
+    /// call `dma_fence_wait()`, which would deadlock with this lock held.
+    #[pin]
+    lock: Mutex<()>,
+}
+
+impl Tlb {
+    /// Create a new TLB manager.
+    pub(super) fn new(bar: Arc<Devres<Bar0>>) -> impl PinInit<Self> {
+        pin_init!(Self {
+            bar,
+            lock <- new_mutex!((), "tlb_flush"),
+        })
+    }
+
+    /// Flush the GPU TLB for a specific page directory base.
+    ///
+    /// This invalidates all TLB entries associated with the given PDB address.
+    /// Must be called after modifying page table entries to ensure the GPU sees
+    /// the updated mappings.
+    pub(crate) fn flush(&self, pdb_addr: VramAddress) -> Result {
+        let _guard = self.lock.lock();
+
+        let bar = self.bar.try_access().ok_or(ENODEV)?;
+
+        // Write PDB address.
+        regs::NV_TLB_FLUSH_PDB_LO::from_pdb_addr(pdb_addr.raw_u64()).write(&*bar);
+        regs::NV_TLB_FLUSH_PDB_HI::from_pdb_addr(pdb_addr.raw_u64()).write(&*bar);
+
+        // Trigger flush: invalidate all pages and enable.
+        regs::NV_TLB_FLUSH_CTRL::default()
+            .set_page_all(true)
+            .set_enable(true)
+            .write(&*bar);
+
+        // Poll for completion - enable bit clears when flush is done.
+        read_poll_timeout(
+            || Ok(regs::NV_TLB_FLUSH_CTRL::read(&*bar)),
+            |ctrl| !ctrl.enable(),
+            Delta::ZERO,
+            Delta::from_secs(2),
+        )?;
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index d0982e346f74..c948f961f307 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -454,3 +454,36 @@ pub(crate) mod ga100 {
         0:0     display_disabled as bool;
     });
 }
+
+// MMU TLB
+
+register!(NV_TLB_FLUSH_PDB_LO @ 0x00b830a0, "TLB flush register: PDB address bits [39:8]" {
+    31:0    pdb_lo as u32, "PDB address bits [39:8]";
+});
+
+impl NV_TLB_FLUSH_PDB_LO {
+    /// Create a register value from a PDB address.
+    ///
+    /// Extracts bits [39:8] of the address and shifts it right by 8 bits.
+    pub(crate) fn from_pdb_addr(addr: u64) -> Self {
+        Self::default().set_pdb_lo(((addr >> 8) & 0xFFFF_FFFF) as u32)
+    }
+}
+
+register!(NV_TLB_FLUSH_PDB_HI @ 0x00b830a4, "TLB flush register: PDB address bits [47:40]" {
+    7:0     pdb_hi as u8, "PDB address bits [47:40]";
+});
+
+impl NV_TLB_FLUSH_PDB_HI {
+    /// Create a register value from a PDB address.
+    ///
+    /// Extracts bits [47:40] of the address and shifts it right by 40 bits.
+    pub(crate) fn from_pdb_addr(addr: u64) -> Self {
+        Self::default().set_pdb_hi(((addr >> 40) & 0xFF) as u8)
+    }
+}
+
+register!(NV_TLB_FLUSH_CTRL @ 0x00b830b0, "TLB flush control register" {
+    0:0     page_all as bool, "Invalidate all pages";
+    31:31   enable as bool, "Enable/trigger flush (clears when flush completes)";
+});
-- 
2.34.1

