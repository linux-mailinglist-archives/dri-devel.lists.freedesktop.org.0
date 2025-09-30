Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19646BAD3BF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F19810E2BE;
	Tue, 30 Sep 2025 14:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kQkEbaLz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010043.outbound.protection.outlook.com [52.101.46.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A23D10E2BE;
 Tue, 30 Sep 2025 14:45:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUJTB9uMJWso1RcFl3SnVwWL/cAFQfuZ6VRuyJNJKRS9ilzvZDa1kUhtsNBgL6eiJxxywwTIFFRRnE24QK6+5z2qq2dsBb34/kxF3JLTCF1pViRPpG6T1hp/NXWEifpnEZcNSr96RKIyN4AXdkB1/Nhs+mzsT4C0UORWBd7s73QiBEA0hfLD8w1Qs9UZtoAibPmiiFS8IIj60CBCfGWJMQ0jrIXSArciDfndG+xMd6qAaWIlYgyMaYnh1kAPDvHi6SClA1p6k6IJ4tXJCWTRqifgbEAGSCyIMcXxAMNr5RA931HJNd2rsIPGsEvy2CUd5udEyH+4p3ue/U/ams1UVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqKI4QERBARX2snlbdVeWslZF9sWJPzYbr+oyarpQ4k=;
 b=WtKhUEWT+UXF66o4EF9zRnTFJqYPeo3qyJDYBHlplwBPdqrLotU870Ajr4aQurBQhuxEKU7Mcm4EhZQ8NYb/XwCJFjQ+zM5lkGNvrU3RNLuOZgJcwAbJ44Zf/I/Yq1RxtD/FQZpMtp6Ho86ueZPKbZ/rIhDm7CnGFDPbCK9HTgVJENayZwfzAK+ui2EqqftAAiqgZTqtsgHtUe8XLa6w4voHmoJbCGAOokxJQlBe3vppIpkaF6W+sibmetzdc0396heKoChScZceLFswy7Exo8TK6uZeby+F3V93S53+klfRYR7VkxoPhXtDEMjk7E7EKe6MUqNw45j48n3/awxdlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqKI4QERBARX2snlbdVeWslZF9sWJPzYbr+oyarpQ4k=;
 b=kQkEbaLzFAAv5vYzw4FMmCzwxjjH7cvaXmVi0HVDWrDX3P3SkmcNRjkD0vZx2psoOq7rgB2T76GxUEtrEwrlOifnZYY9WgxnUWr4zkOLPTyvKsfQ0HrhoxsYpTXweec6AyGHGfm4AnGcTIZ47p2eER8HpGw1GQxGt1ISitxorluhZHhSWbvOV06KUEcChodeKZD/PFQYQlOGiqthDEir58qm73uOAwvV68uIUTmz2oChpQUYSIdq8r1fioqkRDHgGljsyC9Ioo5Bpke+6WRVMmSseExI3thXde+ktVonfTmEeFbQbG3J2GT3NdMLq2RJUJwWlPpfBQRt48KJtV7pAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 14:45:45 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 14:45:45 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
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
 Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: [PATCH v5 0/9] Introduce bitfield and move register macro to
 rust/kernel/
Date: Tue, 30 Sep 2025 10:45:28 -0400
Message-Id: <20250930144537.3559207-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P223CA0013.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::15) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: a0512bfc-fe17-41b4-26d8-08de003009a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yig/GBG7jkvKhlWFMPa+3mel8CzVzwYXmN6KgRQUPB574rZRcwNeJTl/HCjo?=
 =?us-ascii?Q?zMl+kAjKLvmRYA0y7DrPSDU9TADrjnQp0DxpUNQ1RtrTcYdT7Zt1Mc/U+vSJ?=
 =?us-ascii?Q?UNAcyEtHHBtOFiuGDK/5kGrjK35uQY3NJogryrieqlm1+OJoRvJOz5C2H00s?=
 =?us-ascii?Q?9Xkbgya3HF1psC+++AKHDS6bSTV6CT1t3ByKstInvweoWTD4Bmk0hPoFRJ59?=
 =?us-ascii?Q?f9MiPl5/7y1WB7v4W2KfnTiuX+O+3cDXY7dL++ifBReH0cYOt6AWIeKE8qeL?=
 =?us-ascii?Q?IxBzo/cxCT6otcr0jI7nmxAFHBL6nJ0o+oqDksChdOg9kQ+j0NTM4uhFwv6N?=
 =?us-ascii?Q?lgwZeUtvueQsud0Fsr2EMptUIwTzDiAokDtFDPdq9h6K+jafSFCT5/gboahN?=
 =?us-ascii?Q?LiLxe7X6XpIeqKaYVa/N1G/PoG8H0GnBN7ArJUoc4svCRPebeJ5YgYCTbUoP?=
 =?us-ascii?Q?dKnCSKEAwLYRLuiYBzElRPZum83A82+mJa1DpIceiBnaHibZ+wqXAhbAm46/?=
 =?us-ascii?Q?C7JCEvYw56u85saRYCcoj+87MU2eS4cWTx4Yc7ArA9mLGGseFgL7ToiMN3O6?=
 =?us-ascii?Q?Yf/fvODV3yaYKVQASlmYHj7AhjWXU7H9F6XC1O4KuOEc79wEy2CJvmJQJ+FP?=
 =?us-ascii?Q?g+DLdX7q8ZcmTj6JYtDO409oxyh7SsXLivbuCeHysSWFuaoBpiwNwpbYCqFJ?=
 =?us-ascii?Q?7j2aRo9rwa1bKIhaEBHP1W2nvxaSNLGt78a4sV0TcAUNYzBI3Pu8cE5sVqCA?=
 =?us-ascii?Q?F2Kb6CrJSnVbojuRNyY6A1EpK3DJ/+7g5LRqJgsc+22rZXB5yX/UxlYsa5L2?=
 =?us-ascii?Q?4SWfn9tVsnAmP1L8twx6MwpppEch8JFr6NFYaBhkjVMsj03eGaMKfnoSbMg0?=
 =?us-ascii?Q?eNwtbgmFxRXztLBd0lKd0aLnhYnodTjwqTIrt+a5V8dV+nJC4C+lgqN4ymPd?=
 =?us-ascii?Q?DlNbUvv8r5CVhAdoNm6F83fXs5C6eIVObBng31ku28th1NLr5+DTaSOCS1dk?=
 =?us-ascii?Q?S7e62h67N5qPOTgMnbB4kv3wp/LbcBHlmV0aO85EhD8Pw9ie8zoyKSjVwgxQ?=
 =?us-ascii?Q?QcX9aieAwfx2h23yx9uIIM4hKYE2OVQZOsCnS1ahdQGXP4PAvH4kuWmyc5ei?=
 =?us-ascii?Q?gYNGF8fe26zwAPmV6tFtX072i2Vc+e6a9sENGw98w73hRu0EaaSzDvKY3H3J?=
 =?us-ascii?Q?wkbvkSMJ74E39Cc9jM3V5EiGBw9SMr4iju2K9El11CNUQoXBpnrKcNMEQJR8?=
 =?us-ascii?Q?apQD+tZqniVdCzir+sgPR1itIluT3ets6VCO/JKfuuJFoaxdNPe9zpn0zNEi?=
 =?us-ascii?Q?2om2nXol+Xojrt2eGBPpnYePva63TPztezG2S6Ml7a6gvP/unILDa2sTFT5C?=
 =?us-ascii?Q?2GBmMLuL2SQ87e0mNZGqKHuWMZXo/YqAuPcV0V7whFegYRWbGVdp0tWzIB07?=
 =?us-ascii?Q?z6p3h+AfsntZPANDZ+NyWe0qo5zOKP/kP1dlQCmFU38M6L07W8XVeg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?75fr8lJSGc4XexzjucTRBJGuLNgNyybDmz0AcuUyZxffOPRVr9G0euMqJkNh?=
 =?us-ascii?Q?HoSdpuHg557NUh0EGAG4TzXxDvQaXQQ8tZbu6umx5DeyOnffb+hv1+V2mGuQ?=
 =?us-ascii?Q?EE0AHBSNrR4gEzxBVopR7rjdAARbqmVyBb51UVX4qo2Lk8HZEumItlrn+1cb?=
 =?us-ascii?Q?nfOWevmnQZos1EARlxImq8SFFf7FSpg96OipduEHi/29ddOp3bbPKpu9nDUf?=
 =?us-ascii?Q?PCxO5lo0VlNHvv46y4JCmOoilGNDSrlC+bjyon2UWtR/UYtuOs9TbfwYYbvH?=
 =?us-ascii?Q?vsLhMbog3+yP2t8iOJSsn8bErdFbvu1cxHc7aI9yRjej4cPqsEh3VzL9gZdi?=
 =?us-ascii?Q?9CH1g3+tXpGg6kyqlAIFgZNjatBVNGIIhGWimjJb9uliLtv49x+GXeEBDkzg?=
 =?us-ascii?Q?a0tYqV8JV1VXD8Tu9PILNWrFHG+iNM5yhj6f+0gWsnW5DCNCPUcBJ49IY5nu?=
 =?us-ascii?Q?kwWyk6i+GHV4Hpe/8QjXdA/cLEwzbKtQHMcwlVx1xYkwscl01etD+Qrvby2T?=
 =?us-ascii?Q?6nixAvloIjb6nB1yOauYtGu7jKLbdzL2YoqyPBBPkezzcxB34ATvz3IfijfI?=
 =?us-ascii?Q?I8oP1IH35p6YsC/fd6dHICEXdC5OHZFXBDM9dO9/Lm4UdAnreiIekgYkIv0J?=
 =?us-ascii?Q?z1PQVWQ/tr+2Qbu0KAoQnro+clFVIEKSQlImkYzGkX5DjXUjm/r+xAlgiWsk?=
 =?us-ascii?Q?u4ulEbWfJ1iVbTMdo2rarjlAgEadRCBa+phXkS9frA7YevsMTLtS7PhqKgA0?=
 =?us-ascii?Q?jksN0A0vIvnklAg1GKmJ20+s5N/RJ0A3TsPAu0Yi9Qg2me1tXsiJiuAo1LuF?=
 =?us-ascii?Q?w0CkkExEqX4Tw93w6YSmO7YZ6SVRJD2bHrz5q7y8VRaypk46sA/Fi0BoxfaE?=
 =?us-ascii?Q?gxuCqxKbxthCKPGvIM+tVUbaQJ0SNGNBgNaPkcmufkdIaME6WfWpgX79bcM3?=
 =?us-ascii?Q?S1RLRCvetNr13/qZ07cnc2FUHhdwAQWFezjS42Vfo1waGTYVK/BjDrY84MsW?=
 =?us-ascii?Q?ya1xqR9WpAtI0jEdPxR7VAoX2w67ZxfpVHtMDqnbrnekGxf34tZHStU4HnED?=
 =?us-ascii?Q?y1JHP2CA7h2go7hpIPYULdL8ghSHNcZgQx+D31fNkw8IzSfQrx723AeAmV0m?=
 =?us-ascii?Q?7KdjXeymo41I0AUmvcrzFnTrHapo0EVWr/HhVpaE/BW2kXYaDRlqVGDoNZ68?=
 =?us-ascii?Q?sP7vNYym2FG0LMsM8y2TUriwhfz3JATmw81mQozabJCz/bfBlyBnSfVpenVA?=
 =?us-ascii?Q?Z4f7CF9fhvulqBRXpmoRZThGgszvvhp+hf9dH3UCOYNAyqaO/Nv4dE4VX8Wv?=
 =?us-ascii?Q?ptu0c2xz+UXOaSzshh5XR0G26MkvDGogxZFjb5zCPPv2EFz5FL3IwOm9CV5C?=
 =?us-ascii?Q?QR6oLtUYK44yqBcgFU4nuqkpMA/VxxroPBY7ydVR4fNNNkvzQzguFdgltX/b?=
 =?us-ascii?Q?3cSmrDqaapneD9yBOiddRuq5S1edhXeU08mHhImdqycqz5Z0ku3lWmJuIR37?=
 =?us-ascii?Q?AWFQHSilqRLJpcD1aNnUFdU31mjw11jUUD3/ItALSnjrGfp9umk2UB4D+P66?=
 =?us-ascii?Q?tBPGoDky70EgWn+HYil2mmUAsYpsjWkK29WBtNmO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0512bfc-fe17-41b4-26d8-08de003009a7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:45:45.5180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HRk8mhsLgmMSYDOsoE/iLimViEIzMBAP/uTzM6j3VdMRIzxeVbuYASN/bVEzXXiCI6q+Q/7ofzxJHARXW4hPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8475
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

Hello!

These patches extract and enhance the bitfield support in the register macro in
nova to define Rust structures with bitfields. It then moves out the bitfield
support into the kenrel crate and further enhances it. This is extremely useful
as it allows clean Rust structure definitions without requiring explicit masks
and shifts.

See [1] example code using it.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/patch/?id=76797b31facae8f1a1be139412c78568df1da9f3

v4 of the patches are at:
https://lore.kernel.org/all/20250920182232.2095101-1-joelagnelf@nvidia.com/

v3 of the patches are at:
https://lore.kernel.org/all/20250909212039.227221-1-joelagnelf@nvidia.com/

v2 of the patches are at:
https://lore.kernel.org/all/20250903215428.1296517-1-joelagnelf@nvidia.com/

v1 of the patches are at:
https://lore.kernel.org/all/20250824135954.2243774-1-joelagnelf@nvidia.com/

v4->v5:
* Added 2 hardening patches to catch the misuse of the API.
* Limited access to the inner value of the struct.
* Fixed kunit tests
* Addressed feedback from lots of folks (Miguel, Alexandre, Yury, Danilo).
* Added Alex tags to most patches.

v3->v4:
* Rebased on -next.
* Added more test cases.
* Added support for fields larger than the struct
  (ex, using 'as u32' for a u8 struct.)

v2->v3:
* Renamed bitstruct to bitfield.
* Various suggestions to improve code (Alex, Yury, Miguel).
* Added reviewed-by tags from Elle Rhumsaa.
* Added KUNIT tests including tests for overlap.
* Added F: maintainers file entry for new files under BITOPS.

v1->v2:
* Use build_assert in bitstruct
* Split move and enhance patches for easier review
* Move out of Nova into kernel crate for other drivers like Tyr which will use.
* Miscellaneous cosmetic improvements.

Joel Fernandes (9):
  nova-core: bitfield: Move bitfield-specific code from register! into
    new macro
  nova-core: bitfield: Add support for different storage widths
  nova-core: bitfield: Add support for custom visiblity
  rust: Move register and bitfield macros out of Nova
  rust: bitfield: Add a new() constructor and raw() accessor
  rust: bitfield: Add KUNIT tests for bitfield
  rust: bitfield: Use 'as' operator for setter type conversion
  rust: bitfield: Add hardening for out of bounds access
  rust: bitfield: Add hardening for undefined bits

 MAINTAINERS                                   |   7 +
 drivers/gpu/nova-core/falcon.rs               |   2 +-
 drivers/gpu/nova-core/falcon/gsp.rs           |   4 +-
 drivers/gpu/nova-core/falcon/sec2.rs          |   2 +-
 drivers/gpu/nova-core/regs.rs                 |   6 +-
 rust/kernel/bitfield.rs                       | 804 ++++++++++++++++++
 rust/kernel/io.rs                             |   1 +
 .../macros.rs => rust/kernel/io/register.rs   | 317 +------
 rust/kernel/lib.rs                            |   1 +
 security/Kconfig.hardening                    |   9 +
 10 files changed, 870 insertions(+), 283 deletions(-)
 create mode 100644 rust/kernel/bitfield.rs
 rename drivers/gpu/nova-core/regs/macros.rs => rust/kernel/io/register.rs (72%)

-- 
2.34.1

