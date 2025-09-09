Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F12AB507FB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 23:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6957810E08D;
	Tue,  9 Sep 2025 21:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qacH/Mx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE8F10E08D;
 Tue,  9 Sep 2025 21:20:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyOMEWYviplsr0Tbj81jZx37DXSMokMcasG4tz0EiuOLEZO2YoVIBh73O7hCOA5wuKc9J2ZjRl0KC1fHdYtMlp53hbxcRFZFqcfuOWNnvyNnX1TeakfIpynxmA+c7eVymbKt5udPaaW20Dps9givyxtnsNfN8q7VpPVeU/OY+0naToJ6R0+KuWEkPSubTHhwVJOCezGNEfl4F07M8NCwfr87zaKfmBP6/NwHEhXcy5z2ek93rdAmvrNTHp+pKLphaKrtigUDtwN0B7P0REhIlZGEgbUayszsrypNqm2ubqHo0sk9JLNeRq0iR2pLNxN8a+U/v2GDiGuqQ61CMfu+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfWbaaHOWmHnWTkKJdIk3L0GHnvnDyVtjGQ05z6lwrA=;
 b=b5Pf6mwZkciUfXRXOFH0skzF0vmHZunLCyJSB41kq43x+k0JAcwEagDiXVfuGDG0OecoYI2UBZivRw7e+ApEq82qC16/nC3tSH65W+rLMiTz4wUd1OCmKHOKlBk8i32Wr4ZJF1Ym3D3QHBiZYjTMhQEuH/qcLcQGUO9Zv1ZQmQwpB5Mz631ScPutS7a5BnRNntWYu5/oOwGUBEX+kZaZORSfCIWeYIQvhMKWM/hUEX+C6/IEYIL9kn9puuPtT+O7TyxPMhh3X3EZ+Am6s9ieHFBB7q/DEsbv+Do6ur8ZgCYrNf77curXYiM/TLJKQng+gI0Yj9IyiAit+Mff6Bb3Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfWbaaHOWmHnWTkKJdIk3L0GHnvnDyVtjGQ05z6lwrA=;
 b=qacH/Mx4Psw8Pih7EhKsut3Wi90kCfkLugxez/nNDdRp+sZ2bvGttqCAwsIbH4GYXIcGn2SRGpzQa/Ohtp9KAaL/2Pd9QcC7A185ixMLm+tWS7dGXLSdrJlG38cTcICDFXcmmtK1IRV8dAVxdt3fBx0/y07Q/qGZd+qQ6270IW61I1PbqbZq7SZ2FRt6a1p1tiRprwxHgP68zILcQECO92Wj+umUBMXu/ZoOFWIPGlZkg4zh5lk+R4zFo6d4L/UpfN+ufA+tSZEn58od53SouYGrFC/4JnI6m+KA9AWTQpkJDy7P0wQfi5w5szzJs/1Y0865djNxuVfxK30WbQsb4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14)
 by MN0PR12MB6031.namprd12.prod.outlook.com (2603:10b6:208:3cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 21:20:49 +0000
Received: from DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515]) by DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 21:20:49 +0000
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
 Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH v3 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Date: Tue,  9 Sep 2025 17:20:34 -0400
Message-Id: <20250909212039.227221-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:408:e0::27) To DS0PR12MB8044.namprd12.prod.outlook.com
 (2603:10b6:8:148::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8044:EE_|MN0PR12MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 146af52d-ef83-4806-758f-08ddefe6bfa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U//ioP813+LEgqfJxcYRHHNu7wD7mJGvxRZcehVnhDUeCC3zmtkKR7DrkVdJ?=
 =?us-ascii?Q?sqsylwtGvs0R7dU1CLa3ebjlb1+w4TqOaYSqafZuXqExUUpdbIufp34YRjOR?=
 =?us-ascii?Q?/fWASA1NuZpoKwvdI9D6VAGktNdLiPBzFmo+TbN1xe/H2tp+66xNGmCyni76?=
 =?us-ascii?Q?Cc8m17ZCGNhN0N1nzb2BFboNsPDbf1m6ntgrkRCkTW1QpqAp1/cmLNvqnYj0?=
 =?us-ascii?Q?5ZQI8+ksi2Bpja2LWH+goyHnkDEMutPDKK2Kw4fzYW136x4rSQzMIU6lFrtr?=
 =?us-ascii?Q?tQKCbQPNDL7B4nw/UUxaMM6XK355n4npU5/129JB60r/FVa/zjEuqqwV0zNJ?=
 =?us-ascii?Q?AxvI92XB15/GCcGp8JiG1UxygkZ2bcUG1QN8rMY1fpH7AlaPcA2Fl/Dex/Rg?=
 =?us-ascii?Q?6Ng7mFpMBujI9o5i6o230SnjlMerPYxzBaT+z6T8EFOUr8R7r6YKhx7deB+0?=
 =?us-ascii?Q?QWKfuwsZCVBc6LE1ZNnZXnFj+LfOliIF1yzHUsvb/JmSISrMCDlW4XyYaQxd?=
 =?us-ascii?Q?867Egjvjv3l9FxXpu4FBfs3zzmTYWWkbZ7IB6rqBJEf1HBzTbLzcuKX+g/6Y?=
 =?us-ascii?Q?pQ5T/mzCawHA+FU2NXlip3xXL0FWIZ3TtEePs4uyuwyXlbVV7E6HWE6HlpoA?=
 =?us-ascii?Q?CH/px8Y/deNtG+1cTu+E+sDKrKFsRA6VrbXv7pon64W8rSr7Ko7D4hHVWpIF?=
 =?us-ascii?Q?FxMSxKg8I5gzpwGUw1ecdT7GTNmpQ3LG+M8G5uK858wBX6p7cvvbE7J340d5?=
 =?us-ascii?Q?1CiDEw5ZV8mffDFzcxaj6pPt+GNjG5qRpfoaukAMBemAuNU5jYM+Xul0AGaL?=
 =?us-ascii?Q?aadKt+IS9bd5bsaduu38iq4g3IpWGm3b4fjsnz9er+3zz9CLxZZvbwAOnjnh?=
 =?us-ascii?Q?JgYbAlXgShZBVgdujXvwHwxNnzads21XL3JJ0uCoc36dI1UxwcFIausu1OOW?=
 =?us-ascii?Q?aQWy3MlNg4uxLnl/v40rN4jyvHV6KtFUXA1rbo2k4vhDp19+IcMjyp07GAVH?=
 =?us-ascii?Q?9l0+1NyzqohGzHqjDbbSQi2VUDAgaz781GqkHOKBQw66dau+gmuEJnNF6j/G?=
 =?us-ascii?Q?bzkjwB+Afl+2W7x9Om974y5JwvVJZNy+2WKghQk8tZt2V5t8cLErdYat6djI?=
 =?us-ascii?Q?dZTmwyQoCZkxfRYnJoNKxn5922EdjVUXpySfMrTs4s3F7OyX2Hf8haBLr6FS?=
 =?us-ascii?Q?J8cIUPa1JRlQE7T5JEjs6LavEIi/o3v3kCV0NwLTjyKHH8TU6tR5rA4UqQus?=
 =?us-ascii?Q?fA1x9Xw1CTeXELpR8FkZKXUT4+7EoMEqvkZP0rzV0smBV4UoXQcqPOAWvJHd?=
 =?us-ascii?Q?FdOhfdILfDzgo5fx65jWfFerDifb5DIhUNPpa9kuM6+JfCaDyZwG0wcFFFmv?=
 =?us-ascii?Q?lgUqWJmQLo5QrEuYerjzJYHmPsscc4nu0Fi3PpRQA4T6K4aJqaqY5QXVsV5C?=
 =?us-ascii?Q?+XJn2bqHZtI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8044.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?//Pn0CjPG+5ztpdWIC02oxVZFqDB/M+F7Aw566t84QQUNFzpnaSOybrw1hbH?=
 =?us-ascii?Q?l0CzhKHW4UXla1fFH1dLCaF/0Cbt5ewNyqwmrIGNgTZxFtWemIWksmR0YR4K?=
 =?us-ascii?Q?ySLZ8QA8Wjm+vTB/QBQ99n3kaGpN3NB/q3NlNJmZMN6HPDDjHc0ftHDnw37k?=
 =?us-ascii?Q?iumrafmJAa/TcT1OfDKFH47dtv8TCYS7vyixD4pxsGILEQ0/aQm7IyZ7oEJh?=
 =?us-ascii?Q?WdsyQE3dfsqPY9XWe+12H6r0aPE9gafWztP5xarptNrHBPZjV2Wpw4gosMxo?=
 =?us-ascii?Q?GCSCsTfieOoJBSyE+RA0Uq4Uu6N4+oT1A0OD8cjFx6+Jafb2pl6WISHmbO8l?=
 =?us-ascii?Q?tpfrl7NbJoqY/mjHbgG2RcPGWg5VTXRHTDewI6vFmsLKcr0mUosAjN667kIK?=
 =?us-ascii?Q?3K31SdpCUnRQHG++miOjOLWzOC2c0dBz75iWiCtP11FaVxnzVc1kXckaFGc0?=
 =?us-ascii?Q?hMmzHGIkrLzVu4sgS6bOrEW8CiqLZ5FhV7Ty4pag+ivngptZ1G9OH/In0AdS?=
 =?us-ascii?Q?46iPXDo8MhJRbJnjXGRtqNXvUcE0p+naT5PmQis5BCxMd7Gitty/++I6Xmt/?=
 =?us-ascii?Q?MCcMuAmVtwy20Yrdpm7DigDXxX+rIj5oFNUt026v6UiPnW9wLsgOZ3epKadu?=
 =?us-ascii?Q?Eb5VQWb0pDAbdLuHAAkta9QgzigyjmsFRwAKu3qJzvn4Z/pohC3eh7hoTWeM?=
 =?us-ascii?Q?3WQg2dm6v/3TVmOkRkoBkFbVMIoz1pfxUZH+I/RLUhMuGKQQM+gXR2fQSe1Z?=
 =?us-ascii?Q?rkaDygYDdBZx2u4kYIuMtLuCwjLRIUuYJ0BqzGDYZRG3uyQH38jm15dysTUk?=
 =?us-ascii?Q?U82Aj4P4yZfHNsYXC4z7a7euJnoOO9sXEbtqFf9uDZNRYMiVwf5rGyWttxM1?=
 =?us-ascii?Q?7lmPQPH/QgVp1iG6z9Gi1mSMWmrO2xUh+lWn30F1dW4P6uRasNEzcnyGIu+u?=
 =?us-ascii?Q?OEog312x37JAcrmGK6oQPjuwtDNpD+ndXf+d4Gme+iKSJzRXKytsbQjJfN0O?=
 =?us-ascii?Q?9cwhYc5s6WY+0ofbjLikoGTENYuo1h+s1XvqXSbjcoEfcIjBAxyCDJH9ZFtr?=
 =?us-ascii?Q?7ahaHlXbLHkYw/Zf+DOfU+XGOrdPAynktbrXcds24tdtPsJyY/qD3Q/lgLkN?=
 =?us-ascii?Q?HGJs4z4vuAEcafxAqLuSD+KOaXYhaMts2lotjvSykYArHvVcsI9D8o2l/xTt?=
 =?us-ascii?Q?xgCPyiqZn3Y9wiK5YPwLwxfwJVJODEJns1d95FSVNpEOEGp+hBbLfQTOHGiK?=
 =?us-ascii?Q?skMut/F5AYd2jjSKcgySfZeg0+2mSBNYTqMX3Qljs7kcJhkDtfgWTPktvrgE?=
 =?us-ascii?Q?7hANK6CIr+uU3ttKn5/f39hO2k5VmiWmOmMVftUfwBI+EUAVvQD6Wm73RrYt?=
 =?us-ascii?Q?j+NxIYA3ncwliSf9a2dIXr+d1LF1COcRhB7nKDbmNt7W6x6WiayiPppGNVdg?=
 =?us-ascii?Q?TqterPj3JTUvChVAyKzQcHP3GHL+gkNtBdSk+EcT5l+ItI15F7zvIJXuAQcm?=
 =?us-ascii?Q?DzJpnyr5qsJ0CifPynLfWTsEWpmZDb7tanI++2dQ5QQEWB8xc5Yraolz5YL6?=
 =?us-ascii?Q?VxcAlJ828GhnduAmWZcm0k07t5OudnjE5zTtQ2Z1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146af52d-ef83-4806-758f-08ddefe6bfa3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 21:20:49.5032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Op2w3UOschJUKy/iG+EEHAMXFuvRbzRDwtgH51L/uL9jcRUvk1wu99TcXAbqb71JzaJ2XTkRrlcctO00QAzs7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6031
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

These patches extract and enhance the bitfield support in the register macro in
nova to define Rust structures with bitfields. This is extremely useful as it
allows clean Rust structure definitions without requiring explicit masks and
shifts.

See [1] example code using it.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/patch/?id=76797b31facae8f1a1be139412c78568df1da9f3

v2 of the patches is at:
https://lore.kernel.org/all/20250903215428.1296517-1-joelagnelf@nvidia.com/

v1 of the patches is at:
https://lore.kernel.org/all/20250824135954.2243774-1-joelagnelf@nvidia.com/

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

Joel Fernandes (5):
  nova-core: bitfield: Move bitfield-specific code from register! into
    new macro
  nova-core: bitfield: Add support for different storage widths
  nova-core: bitfield: Add support for custom visiblity
  rust: Move register and bitfield macros out of Nova
  rust: Add KUNIT tests for bitfield

 MAINTAINERS                                   |   1 +
 drivers/gpu/nova-core/falcon.rs               |   2 +-
 drivers/gpu/nova-core/falcon/gsp.rs           |   3 +-
 drivers/gpu/nova-core/falcon/sec2.rs          |   2 +-
 drivers/gpu/nova-core/regs.rs                 |   6 +-
 rust/kernel/bits.rs                           |   2 +
 rust/kernel/bits/bitfield.rs                  | 661 ++++++++++++++++++
 rust/kernel/io.rs                             |   1 +
 .../macros.rs => rust/kernel/io/register.rs   | 289 +-------
 9 files changed, 698 insertions(+), 269 deletions(-)
 create mode 100644 rust/kernel/bits/bitfield.rs
 rename drivers/gpu/nova-core/regs/macros.rs => rust/kernel/io/register.rs (73%)

-- 
2.34.1

