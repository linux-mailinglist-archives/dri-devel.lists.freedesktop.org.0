Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDbWBlwnlmnxbQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 21:55:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE59C1599FB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 21:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFB610E624;
	Wed, 18 Feb 2026 20:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dlnKW7en";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013003.outbound.protection.outlook.com
 [40.107.201.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7981A10E61B;
 Wed, 18 Feb 2026 20:55:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAssJNpxZklbd6cRFOTw++L1UyyjfyrxAawcDSwlFw6Yr2EHCSEu6q/d464npxHzM+/q6YJJOPNCu7PxqC5ReaPXLCKxEPhAOYyZtS5eg7X0HuSLuk1vcd8RRP7A14fkTRHQQvcZS4wZJ4HVE9d4xNNIsROuwG+QB4iKgL/Tk7S7WYJA89sd5UV1RgkdbZEU4NILRsORJsV2+xtqMvqgHRUWhDL12uAULl2J1W13vmMKFtLqHCxHDktrQahsoTuIANJzRxhViKDSaRtn6h8S19GX/VxwUEGuQfh6uzOqR1qlA4fz30UPNDnzCRwIp92z0FMC63B/aKiFbhMQMQF2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZwLlnyczL5nCRy3+acxczWxb5kW3Bjc1qBN+QlpghI=;
 b=ljKoUkJVynJmHjZTHv+dMr263XoAAydSOtZdb8dO8wqFPkRdaasjk+Na43OA8LTVvq/5hCxcPrXd7+p+s/zLdlf2Gk4TdhmGwSuZAlBAFdWL342YtlP3EQX+m2HSzPpCog3cF+X5T+5VbOgMfpLKRQg/Kg7nhZR4k5S3E+N/yHFwvnpEQW5fFzded95EooKeGjfRblRP+m/+9DBk7fLtCP0jqeskwRyEBHeAYUxlSlyruKAbMAjxLxTbNut2vY3E86kdmdeqK+tHRs0hgMozZHjvZYErU8gnnZ6YwPq879BkdWZ4tdmFGAkruDNgNqkCT0sKoCYTYCAJKuGGZoDXpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZwLlnyczL5nCRy3+acxczWxb5kW3Bjc1qBN+QlpghI=;
 b=dlnKW7enz1khZ7eraHwroSzMlDWJm+a+9AwwS4cngNN2KZcrUqfKqKMBz3nj6NkIiGPaMvgt8lCdQJm+Bv1ShnMRU4mTdkAYSi6Q7xG2QVpB+9jvlUrbpHT8o/atMgOrpsqFHEaVzdC51j0K+/f7SSDnuJB3xsvRdl2n9zxGkEBo/CjUnW9IOZL6bmXsQWlDy7NRhzUuvhE/4BtIUxngaMUoTjDvwhQz3aV1m7dYojTDUqg49GWV518rC0lGNwWBbzYRNHb7Mc+Vq1RPOQfrNPUG6Rm8P0c7KNDEPM5hnRa8Pz1SyKTbD67HC9FEunX3ZS2dquIk9RLk0Ie25dxPhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.14; Wed, 18 Feb 2026 20:55:48 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 20:55:48 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v10 4/8] rust: ffi: Convert pub use to pub mod and create ffi
 module
Date: Wed, 18 Feb 2026 15:55:02 -0500
Message-Id: <20260218205507.689429-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218205507.689429-1-joelagnelf@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0046.prod.exchangelabs.com
 (2603:10b6:208:25::23) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 706e51a3-7a4b-465f-9f7d-08de6f3017a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zssyTVB82iiiAR9soVJtJnQoRqSPg5tYKCt6iS1AoLsONzxOzGwjLSJU4Z+n?=
 =?us-ascii?Q?IRHz6B0SiwIXIJC0pUyVzBU62ivNq6lyvCz/BWatRPI+qkd5zCRg9/GL8cOt?=
 =?us-ascii?Q?cJSmIyewdwvPpeWkdrwp8ZErrBtoh+JFYhpY/WWAELzJq/86MHNt/zrwagvp?=
 =?us-ascii?Q?+9bbiYNU5K5iKwJTJvnE5vyh73jKCm2CNz77o2OXvaVwuKQxYSkA/sECeVT7?=
 =?us-ascii?Q?ludPA2JZ7emXwFg+NswBx6utIIKVniTomMUdb6ACU7DLbSQlZj5j0DHshZ7r?=
 =?us-ascii?Q?t7pi09ABHaWlM8gkOfAPw9u5Sz90BZaozYYGzJsl3KyqHmWsyDVPDkNWNjnD?=
 =?us-ascii?Q?7XL+9R1H0vmlFhMwNv3ZFANhcD1YKW1/QB/xPjL1GqFBC2EaWqED8/QmUmGc?=
 =?us-ascii?Q?BTxTifCooVbvAZYV79u68WJGKhBZxnrBqwl3mY3xxmeQlb4UngrCmkIiEc8/?=
 =?us-ascii?Q?pA83cHAxYyIa7RVQvc3dfiyyFSZoTKFZDCJTD41Ihz+GI3sgXIxbArkQ99lp?=
 =?us-ascii?Q?wRWpn0uMU5C1MDWGDilOmDqL1gLPQugtQih8vmP5DbZJeYOhdOc2DfGCR5ra?=
 =?us-ascii?Q?C5tvjPT1wyp2r/QAtD5cyiyM9o2Et2jlzg223bm60ELmyu8JioVw0x0VfJfx?=
 =?us-ascii?Q?8EiOQehjMf0ImkYo1ol4ozpVgwTqn4KmeL2uONjk/sB1iqVBzuZKcJKzoRiO?=
 =?us-ascii?Q?499yunM6+eYzn5Zp1SgYSS/e6Fi1hQ2f+gUfOVpgzAk3ZYvYnM7rwyZvIf8e?=
 =?us-ascii?Q?+4Zzoh+MDtIw+0aRMhSX0g2LBJd/a4qHxt4mpE6TN3HRP7a49vDe1gE7+1am?=
 =?us-ascii?Q?ohOpvpkacHY6Hh5N6tyk2JC8gmdrfKi8OKYcEcYAXjvdOdeN2TK8m3P9dpoR?=
 =?us-ascii?Q?XfL2A7jJwJuJ7WV4MarpCjTM0b75BqrESaqjdUtIETzi6XBbE5q/MsCQIebg?=
 =?us-ascii?Q?eRMaFojnuz7sQfHnGkaAJtre3sypWT0U2fmVTQutP/ezgrCn8nHRkDYUYL7z?=
 =?us-ascii?Q?VV4WSKvZKa0XRxFZ54AoP7LIj6yxelEiuX6I6petJK2xHAazEUm1PJrX5ABB?=
 =?us-ascii?Q?1TFOwMzH8XrNKUQ85sbPnPUovCs3enWrkhqvhzUWVkI5UszKv3hf1snMYezJ?=
 =?us-ascii?Q?ym9DZ25W1SLBGCwQGZ/4Zn4cmA6MXgmNxyttX/YTwAB9QyNJe50s4HcpaoAH?=
 =?us-ascii?Q?eOH8nik+LMUVu8skG1B9LnfcjybxKkvOKqip+VgpSknX+5yN+Yn64lP/gyEk?=
 =?us-ascii?Q?SPC8D9TwZxalmMhb3TikT42sMyTYQgW9ieHtUG2rd0nH1SyKa5d8L1qKnWZc?=
 =?us-ascii?Q?1QBuerUu1+1kg8/9udRy6c2jupzFm3pjiEo/W3tk0omALBJgZNWyUx9YY25r?=
 =?us-ascii?Q?sKyxVepsgU6QabRQRb8oY4E/i4ucQ3jsFnOtmu70FtUBeqqqa1EcTde0hjMC?=
 =?us-ascii?Q?tSIoAciI0AQ2cepLOyNOu46z5Vjk6RD05H+NylTFXQmB23yDbW/jZRm2eVGM?=
 =?us-ascii?Q?JYdDEL1JGhhGXT6oGHb9rySd8ANNEQk5MD7Numb4pb++1zCWj2f/YGyaor9j?=
 =?us-ascii?Q?WXZfZLsTd+fqJS+N8YHYtzOtSv1MMZScxCUWDoR83MI/96XLs6ImMSy4cNbQ?=
 =?us-ascii?Q?fg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ugh2iMlQvGmI/vuShGkoSb/CDUpQkrrW5R9varqbE/Lm4s0baXw7O2a6MwR1?=
 =?us-ascii?Q?1MW1QqjUnW8Bp7yFBbEJSNhfBWzQzdFfUj3rGxrVS+6Dc3QTIaPaeWRvwS3N?=
 =?us-ascii?Q?5ac0Y393kz8S6pLvmxLoltXsK7T0qP/FSXY20gd4hzZ+yHd89Mvs8iqTF9Zo?=
 =?us-ascii?Q?SBL/9O1KApXpDCnI1IhoPovKdvU3bqJ6ULD/KbFX/zvbhM/IJ3UNTqmV8RSR?=
 =?us-ascii?Q?0TZBwaLWG9MEdqtNKWCx3F1f6q0wqhbT5FX2sS2Wo901h0n0cPV5TIGzFpVJ?=
 =?us-ascii?Q?rH/9Srp9krdi8HQw5Dsa4pzZ9Y5jD3eB69zhisHrO5/4vcCrLI8ZSfAbbklw?=
 =?us-ascii?Q?HhVdxxtP4dvYDa5T+K80LU2b1q6O43Y4lj4URpa8zEyam8fvQTInbG7t/8xk?=
 =?us-ascii?Q?0nxTHScpwxhDMJigrWClGCMVIqvf36l5+6l+JjqaqN0FS7cSgWQWjpcaKSbr?=
 =?us-ascii?Q?zRHk4PNuYiNSFwh9hRElCmX2KAXoHgDyIsXOwZu65RdwFxrPrybyLnRwW6d0?=
 =?us-ascii?Q?IT+YeweAgy2vZObXYVbIoUsA46FyV+xjnLkiZSb638yyPn7RS7Yd67nFh1HA?=
 =?us-ascii?Q?divyT2yN2zdKOko2kPxJcQgO4d9HaiPBg8Ej6xby+6DiYgNKlK3wuYqWC38A?=
 =?us-ascii?Q?u5h2xEcWp5xFn5tmH2lplK67ujyZ1hZsDLQi9LH0Hi9R6HitLuIkHd6HkOEz?=
 =?us-ascii?Q?wZhHcNby3c+gOTdIQjkQ51TQcXJ88eTumCUudgCq+25TRqeya/xGcHCP4+fM?=
 =?us-ascii?Q?uvQ/yDcF2BUGsNgjMX7UPqtAYx0s1YgGVxt91qVs7AsVI8Zp900frUeCcWqr?=
 =?us-ascii?Q?z/hAOf2nNGrR/JAyrccoOWVpbkpnEdoGQwfHciCMc3mY6c+R2ej1BTa28mum?=
 =?us-ascii?Q?4FDSdmeDPumliBW9DAkpgozmZ9yIvTF7qQxUV+FOon2qsbMXckGVRBidm0RL?=
 =?us-ascii?Q?rPq56aXjO79oHgGOE0ivdPlepWuYg1fNaLo/ysDJ9n9JEPkEKSodkcUyQxzn?=
 =?us-ascii?Q?ppueHq6EIChdj8jBB6I8BzmXMcXU2yzOTddH6mesC15fi89CVXE7p0jB7Yst?=
 =?us-ascii?Q?HJc9R7o4heWCu/Fk0B6DQTorfLmr376PAEr7Q3JNsjREEBqzfLaPkpbwZtLX?=
 =?us-ascii?Q?pi0a631YI3ZZfdEgTjaBX+BYI8BOSWSS5cSRwrSmlabbpFubaj37IZyV06QK?=
 =?us-ascii?Q?Dw+eSHDIe2wRaAKMDg8BR5sfXKQRMGqc0SQrD0dw8qDogWZNVW3RdzbygCx/?=
 =?us-ascii?Q?iV/yxQ2OrSj8UAYmwyPunC2fDGFe+JEhVBMc2HyETsiGNgs0ScW2VSfCKoyN?=
 =?us-ascii?Q?L7U6m6ymYwKQECqA2Zlo+2FESAN5v8h3vXf/RbByzr3K92gxhT2prhvoBzMr?=
 =?us-ascii?Q?6vihO5WOudc5ctVVEff1p9qcW68J20Vx5R5m/q9l4RtP7RXxo5N2+oXdxnhN?=
 =?us-ascii?Q?rnrbrunIVYWa58d1HywqHIY8KN9yizZ5nKxWdLdkXm0zT0+UtyiC0lGVUHe1?=
 =?us-ascii?Q?ePzldeLT1YGjwepgPVYKCadl65cAo45m62GYKAw86lfh8le6xLiF/NcQMwZW?=
 =?us-ascii?Q?I8Wx2WYThmJYfMHJERMg03QPPVJ7/UFnt4JM2yWKmJYlbCy48Y5oGeBG0WiB?=
 =?us-ascii?Q?srrxTnzqrZzS0kacxLsUPRRf2QW+UCg4Au5ADL4Z4TbSWJnBeEfCLCDIUQMN?=
 =?us-ascii?Q?BFD155vm/8d7XEWetw4hZspfcOFv2efIva8GEoVuVT77H7+bh1YmCMAi8EwX?=
 =?us-ascii?Q?KkKaf23Aqw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706e51a3-7a4b-465f-9f7d-08de6f3017a3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 20:55:48.1098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYPCuzYihN9q26qpOQvUBeKCiHCjrmnlgY03o4Bzcdo62r59lSZG49s+7aPdz485DUGRRErKYDhc2NnFBpILtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: BE59C1599FB
X-Rspamd-Action: no action

Convert `pub use ffi` to `pub mod ffi` in lib.rs and create the
corresponding `rust/kernel/ffi/mod.rs` module file. Also re-export all C
type definitions from `ffi` crate so that existing `kernel::ffi::c_int`
etc. paths continue to work.

This prepares the ffi module to host additional sub-modules in later
patches (clist).

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/kernel/ffi/mod.rs | 7 +++++++
 rust/kernel/lib.rs     | 3 +--
 2 files changed, 8 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/ffi/mod.rs

diff --git a/rust/kernel/ffi/mod.rs b/rust/kernel/ffi/mod.rs
new file mode 100644
index 000000000000..7d844e9cb339
--- /dev/null
+++ b/rust/kernel/ffi/mod.rs
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FFI infrastructure for interfacing with C code.
+
+// Re-export C type definitions from the `ffi` crate so that existing
+// `kernel::ffi::c_int` etc. paths continue to work.
+pub use ::ffi::*;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f4ee..0a77b4c0ffeb 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -62,8 +62,6 @@
 // Allow proc-macros to refer to `::kernel` inside the `kernel` crate (this crate).
 extern crate self as kernel;
 
-pub use ffi;
-
 pub mod acpi;
 pub mod alloc;
 #[cfg(CONFIG_AUXILIARY_BUS)]
@@ -93,6 +91,7 @@
 pub mod drm;
 pub mod error;
 pub mod faux;
+pub mod ffi;
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
 pub mod fmt;
-- 
2.34.1

