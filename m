Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D88B42C35
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 23:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED0A10E123;
	Wed,  3 Sep 2025 21:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GVKmGmdB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69C410E123;
 Wed,  3 Sep 2025 21:54:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgsecjCOoIZwp6Fq8TPTZtR1hmh1QrMOYE66Of9khEVbnvXrSFZGFrC4HFLlkpR+rRSD5B9eDrcY/bf9VFNXTO0u4AeLADVNDGFf1ZNYADYElUTGpXC+V7bAAv70eXMMxZfRei1fhE5eNR2jrOYQxlXuNJETdUYgPar2fH8OryKX63qli4Y460GfCs/bBI7+qPU4lsu0Xzdt5Cv7jl9enHcZReGmTUQYetv7mb/4VHsd9H5BT29vXPhzHVppVrvD/sjLu5HYjQ/d+PZRhvvq4tWapA4bIvcFjHqt9glM6yGKWEWfA8E7+l562ogn0XoUx+2FX8rpZMboUdrTWdBodw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49POCJ8SkacIZeoGoRFs3ktZGKNL7Zdo8QXYdv7C8OY=;
 b=JGl3C9g6r9sqbAZPoyBnh9wD3euNNby4ps0JhATES/e56EzMbf0jzZRUCbXMS1LYg4t5wb6qzXGBHgBGkiP8+3kMwM0R+NWQnpLHj+B3yjen/BVCtzRb2Xg/eVIiZ/KtQw9KmQEZEpT7/xldg0ViXisrKtuO5VhLDQXqvABWm14cootEX3pgfuxof5GcmpUp14zBT/JUwp0Ah4E2QsQFtx+aDaSzyeT/dSVQPEEiUcfhalpdOZri+spIEXESSohWalT//2uT5f/ni+K5cNpn4nwm8/s6Pyrz9h+Mfu9Z2NrTKtcmlnJf87It8YZRDfeH6Dmm/d9ghev4rdmbdoDr0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49POCJ8SkacIZeoGoRFs3ktZGKNL7Zdo8QXYdv7C8OY=;
 b=GVKmGmdBmmbCO3KVI6ClY2pAGAF6zL282PlhrLMo3mLFzI3Z9Kaf7C3VZvRt5ifbXJiS+j/wYsFhWdUho72908INDuRQTPFWk1Fk2WapaNZBeGJR09PheaNGB+FIKXokZiMZHNuhZd/s80PFWnw6P2785TFXPy5KapXueed+zet2HYG71J+Xu4zV1HBYRnpNTRtn8eWfKq+CaW9hhem9m+rBF6uJw0ZgvxHV9Vauza0WLSwaXsy27DsSuRYbFcU9VcsFGvLcLqnDmdKDQpHs+vE7j8eWbatWMl9rwrqKQT1KGbWz5Gy0CaDqnEPstXMac1JdZRCNDNrWRRcr9/OK/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS2PR12MB9589.namprd12.prod.outlook.com (2603:10b6:8:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 21:54:32 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9073.021; Wed, 3 Sep 2025
 21:54:32 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: [PATCH v2 0/4] Improve bitfield support in Rust
Date: Wed,  3 Sep 2025 17:54:24 -0400
Message-Id: <20250903215428.1296517-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0058.prod.exchangelabs.com (2603:10b6:208:23f::27)
 To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS2PR12MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c656da-980b-4998-a129-08ddeb347731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vHCGUE5FpYYNxcISjfFUvzH2NkfrXQCPqjn9JVtlnXkexriYkvkIc9kN0eJs?=
 =?us-ascii?Q?fTpNTqS4cXMZfFETObeD+mn08PkmXpI891x1FySotMvfHb0XQVOhtYAN1tA4?=
 =?us-ascii?Q?lu7PwRMC8Hjxgw5tAvbiIxkZMojTdqe6SIp8j+WjHNQPlzgUMe2RTALKr4lK?=
 =?us-ascii?Q?G5du0JL5XDvIRNIRQqoervcSPzTdK0mU2t9urp+4wfD35RoKcWqVlAQaDbRI?=
 =?us-ascii?Q?ekiVCTQkPR5WTOBFNoQjoi/vjE2wcPN0jWHT8yFzlajeQleaerW1yTrCZTrY?=
 =?us-ascii?Q?jPbv34Lp7+4qfRQTSFzVysYb/glvoN6TByQ+h74eQ7htrACb0LwkhJTnoMKw?=
 =?us-ascii?Q?dbyvRu8ccLoTEX7K+qHX9JMvZB/La9laOUvYkC+/8mCts4QJrVqKlJBrw8NG?=
 =?us-ascii?Q?gp4Y5xC99X+j3zgow+wwtp5dN0euy2uyUOpUAVC8R6RExDSO2kjfaO7os7MR?=
 =?us-ascii?Q?gsAzmwHhZNdmP4LX5taoLk+6RWASDLZCRJAvyqwnn41JcLmzrjVAILC/fbah?=
 =?us-ascii?Q?XXaT4G0UQFy2edWk4PFu735BvGXGOg3JI+2wP6bwg+TFYu/Q3Rqfyo2LnH5G?=
 =?us-ascii?Q?2qavhKcz/ciMGwHMGUNyZK8G1gKCm2l/sURj6Tn+SUXw3HvG2DEvUpgjrlCL?=
 =?us-ascii?Q?cq9b/fR41wyx5q51hq1qXRrVRV6d/Icb0h4VnvwMmAWZ6sUfkfPQTPO5WQJ6?=
 =?us-ascii?Q?QFvwJfy6zQU+u1AmUJmzjHpWMo5LgML9CqcARo6XrPethcluAjwzLcBRpKdK?=
 =?us-ascii?Q?i65PBcHLuYsDNxCP5qk8nzQ4JN7dNLhHjcJvuoF9VrR1ZJARimSb9FgmIwOP?=
 =?us-ascii?Q?dp0CRPrKvLlCGN4YigkXfojajna8GKlz2t4zK+KJUub40Jcj+Pipb14Bl8Qi?=
 =?us-ascii?Q?PJ4t+zqooyxdWPOt+q5EB4/ypf7k48P0OSVP4as2fk/ZDO+fb2Z5XP5Imv5Q?=
 =?us-ascii?Q?utFF2uLzrwc7KcNaXqYIYkPBQ7CdGMUKHOnTLhaphHOiILqALmpHvMjFl4Zk?=
 =?us-ascii?Q?4bbVuyeB7CevzhFb1z5nGMZ2Cu3uRLbwf3M28jNnGX5VUDJThXsM4jGES1Q8?=
 =?us-ascii?Q?I6MMJYWrfQyaD9n9i+5Y3Z2CH/nJyZu6MlBbL67KwtP2xN/773cbX0PDJJEc?=
 =?us-ascii?Q?Z6V/+tmOz3zgSlT8XxcJ+H1SSPH7Qnc8AJ2419+qhLj8kkKzdxWKXEd/M+Df?=
 =?us-ascii?Q?JjohG4WsG5kvhe3+3zdsXNqEaeca6EJw4IZUIXu3nB7foIYk66KNkJOXuwf1?=
 =?us-ascii?Q?Ij3WlVrP3YorYtLce8y6WKneA7hZpqxHY90Vz7kAj39gQZSumqCuRgSDjcJ9?=
 =?us-ascii?Q?GIEgMTIWwBsQ/mh9ycvjM/tQduKhFJXwxy0X4WiGAQTlzez9ohKFJ+zW/HjO?=
 =?us-ascii?Q?NAlOkuOcmXPax3IbFrmVPmYNweD6C+tY3q6Nl4csmamSnQT/Kg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q6usgMzqG+HQJmGsyQz0DHJzUvtY7YxMvXHsiJy9AspI7DNzEbVa84GM+hVn?=
 =?us-ascii?Q?K0CIc9hFpQGGTiga0TtmxclUUVCRPmq8/uePayzt4ubix9fcGjbGs1uoEjSh?=
 =?us-ascii?Q?YxsfV8KF+AgGItAHfIxRlUB3o4xdMazvsZ6fxcitKftDRue0s8fRztvQwE/s?=
 =?us-ascii?Q?AcyuS3duuE6PUyCnqx2V3Bu1RRqO+ZfncEDseqAWDeXUZ0kUCTeCiCJxJY4a?=
 =?us-ascii?Q?58CtebMvKr+Gi9Q5o/zyH8+NutO+fjO+bY/Du1sxC+pqTzXMlZawWm75cUIV?=
 =?us-ascii?Q?kW9S+yO0PwyDUkojrTjHFiBtjIlOSj1SqzlT8eao6TB7jhBg2A+LgrSob/QT?=
 =?us-ascii?Q?3JCGq7g9n3ZwgEJ/eRvsMVzXJ0jqfiRfS6Io5VHI7PK4p4rYK42L+pSYmBDN?=
 =?us-ascii?Q?spgaBgrX+S913uY0rjisYBn+WAh4maJB7nRp/ILys1mk856JsWAVmhGJticd?=
 =?us-ascii?Q?l1kkEAZiaIp13u0TkwKOhM0+aFm3/QQTB0QTextBT/Gj1sZTSBuLDab9WMFg?=
 =?us-ascii?Q?zzAyOii02qbtqlP3tkZpaekZCjxvLWe5kzt2rRVc5ZpCmAQgc4a8hlhflc+f?=
 =?us-ascii?Q?gMY4Pbj2f7++I8zfpDIImzzURiA6Q0l8jht+eaaoxqvOuAdQoWNa1bWj+eYJ?=
 =?us-ascii?Q?cr/OmAb0d3bdAOtkBiKU8jdzJH+euRx/EnkI8kkIjR8nBiYG9bI9yb/Znl+0?=
 =?us-ascii?Q?mXUjqlbsnBzGEZkm6/ZlHtj754tqcj5DxnhyxmeTOAUcYH36jSyUdoo1BdN8?=
 =?us-ascii?Q?58cKCqR2xxUR14XufvOGRae6AFXy33Z6tbkZQXHGpnsxsS7UdVeTIJx7twGm?=
 =?us-ascii?Q?MUNxukdoc6agoHVyRQ8moAVprrj7ew7fKYiuYQN5agexceDZHKRYcQTq5YBR?=
 =?us-ascii?Q?+vp9eSdrGdsOXsVyD35hmOj10BmnD+zQte4x6HTb+A4MdwW9r5SdwVmUY+nF?=
 =?us-ascii?Q?C1DgGsXSynNzvTNo550eqSADMKxB/bC+CEP/T55qvYHCCnXilN/wJuwAT+f4?=
 =?us-ascii?Q?NhEYAHB2E4QStQ9Km3cH2oTEXKAbNXR7uREEWK1SK2eZxeHLcC/gk6SQwXmQ?=
 =?us-ascii?Q?np09zE20xV5a+zX+Dgz7ta9HVvFNHN/zjIwcbWTGdpssvRAGSWxvEQjmJm9M?=
 =?us-ascii?Q?HgMj9m+i8a3SwQM9G2UYRMzR0h+Voprc8vCR90PcvIab7xHq879xq4fKfDzn?=
 =?us-ascii?Q?FJzIQBguSHvDOKzmdlcoSF9/Uti0xjL0+1vYwtUTaJRntdBonHozJk/Z8J/w?=
 =?us-ascii?Q?oC4K3X066pfANf7zk6Ue0X9fr4CzIAdCX8XkUCI+cDvs+weDpwtLLfJpW4nJ?=
 =?us-ascii?Q?P99wPvQdcsnkcuEvdOdw5YGwoQ6m9zVqyBoH28Od41yxMsLhXF4bTK0eWJwG?=
 =?us-ascii?Q?9yy5S4BHCfOTQIopvpybjy5zjM5ky3Kbb7C7u984DN3KL5lfyrux8hjLgjHP?=
 =?us-ascii?Q?xQKr4grG6aMKDWEp9ItzKtWLxiru4conHyuzF1kNptxbI3Pu3Kl5gCAE+tJW?=
 =?us-ascii?Q?IORe5hZb22T2iVLU6rfeK4bQhZWaAT1lOotNhiodCcwEv7W4PoRtoFxGDkhi?=
 =?us-ascii?Q?2ImGU9sKwP5LNwS34slI4qX2+lihr7L6W4NIITmT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c656da-980b-4998-a129-08ddeb347731
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 21:54:32.8486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PyjZrVYtix6Ww+jUOLea/eDm7OygLjv6unIVgrG21UzYwM0Ssz3EaW7pF9DS1bbke9XZtNMdBBVN45xmFLk6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9589
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

These patches extract and enhance the bitfield support in the register macro
and introduces a new macro called bitstruct which allows to define Rust
structures with bitfields. This is extremely useful as it allows clean Rust
structure definitions without requiring explicit masks and shifts.

See [1] for an example of code I am working on.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/patch/?id=76797b31facae8f1a1be139412c78568df1da9f3

v1 of the patches is at:
https://lore.kernel.org/all/20250824135954.2243774-1-joelagnelf@nvidia.com/

v1->v2:
* Use build_assert in bitstruct
* Split move and enhance patches for easier review
* Move out of Nova into kernel crate for other drivers like Tyr which will use.
* Miscellaneous cosmetic improvements.

Joel Fernandes (4):
  nova-core: bitstruct: Move bitfield-specific code from register! into
    new macro
  nova-core: bitstruct: Add support for different storage widths
  nova-core: bitstruct: Add support for custom visiblity
  rust: Move register and bitstruct macros out of Nova

 drivers/gpu/nova-core/falcon.rs               |   2 +-
 drivers/gpu/nova-core/falcon/gsp.rs           |   3 +-
 drivers/gpu/nova-core/falcon/sec2.rs          |   2 +-
 drivers/gpu/nova-core/regs.rs                 |   5 +-
 rust/kernel/bitstruct.rs                      | 281 +++++++++++++++
 rust/kernel/lib.rs                            |   2 +
 rust/kernel/prelude.rs                        |   2 +
 .../regs/macros.rs => rust/kernel/register.rs | 339 +++---------------
 8 files changed, 347 insertions(+), 289 deletions(-)
 create mode 100644 rust/kernel/bitstruct.rs
 rename drivers/gpu/nova-core/regs/macros.rs => rust/kernel/register.rs (70%)

-- 
2.34.1

