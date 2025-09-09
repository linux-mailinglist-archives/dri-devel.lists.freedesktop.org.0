Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA4DB507FD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 23:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC99210E7F5;
	Tue,  9 Sep 2025 21:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="V+Glw4xP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669A910E7F5;
 Tue,  9 Sep 2025 21:20:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rK7C2axKKJ43gbR4gesGU8di3YlmU+uBNPOcUvtaRX8oyYls1s59JXWBQjmE3lq0Ky37/S//SpZfpQONIxJMv72AosTH1yRi1FODapVL5rVfM1ILu9Ti6GT94qp9N/1D4b6LbvrayZ4XqB+NuEbN0GLaCuQn7vkkseIl/Ss9g6OmZAEjRMwDQ4ZkZnJkz6cgmrtZdOZbNNsYVc+rYTy0V/EkfY7bUJPXj9slpYYBdtFkQx4+O1v09ksx+iVg8XAXCUSZYJQnlDUAAUCQs0Q58fxH/Fu9Z/MkOXbPN7Ya1bhsjvbrlSIpf5cCEujihVIbvK8TlFZ5GspAZqjOQ/SeQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejeKvgKxM5rW202LkEZMVywTo6wVO1dyxBQgYkGtaHQ=;
 b=G0ydYUQrNg/RY50KVrpz2i4lzjuHN38g36oupJUbqCOPirP2kuvLdXSggy+UFQpJZS+LhXrDMef1vXYimApKwPL8sS6sVxCwMVNOsD/4yqnDcDnL6418a8vzmuhK5ZVBOmsFFvQZFykgKI+XtkfExzGO7WB+erb0qL45cG7zMxVHNuuFIJ04CB+rihplB20YatGRSpyghP/28prqSfxw3NyXxhh/lryzCkmdGJb0/Pwv2gGYR+iEFK+pwYiI96zaV0KkBxUPw8FJeEeuiDvFWtTMjlsmMGeNREcmqqRFzgN5UDZdeQ+LRlO0RcDFJ9C52r/zhQBHtYBJw3fDg3x1Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejeKvgKxM5rW202LkEZMVywTo6wVO1dyxBQgYkGtaHQ=;
 b=V+Glw4xPZ7PbwU97bkBYxCY8BudyEq0zJu82SQPOXnP89frN+PPDmtLGAkiqH1h553TIRdI7ZL3pyRUY81jhv+5pPcNHMjCHcCr4tjuqbm5lnPb9Tizah5XhE9NSbP4QHE5MREarzkF88lQ9uabBvKU3Ce6AnSCM0EP9hV5bjpnVzQNR+cxt1fht4jQJ2GXPwc4FfqCAIYRvEU6CR35kcvY/WGR+1qbmI4MdQfrBUlcMyIb2XYGZIo3HEk2uOLjdvCVxOcdbCrXeV+KvyMWHJ66U8jwhrAhWv6YIJ/Twj7gwosuxpl2vibuFlazTnhmZVVZYR5tjlYM4a/rrMu6O9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14)
 by MN0PR12MB6031.namprd12.prod.outlook.com (2603:10b6:208:3cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 21:20:51 +0000
Received: from DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515]) by DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 21:20:51 +0000
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
Subject: [PATCH v3 1/5] nova-core: bitfield: Move bitfield-specific code from
 register! into new macro
Date: Tue,  9 Sep 2025 17:20:35 -0400
Message-Id: <20250909212039.227221-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909212039.227221-1-joelagnelf@nvidia.com>
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR10CA0024.namprd10.prod.outlook.com
 (2603:10b6:408:e0::29) To DS0PR12MB8044.namprd12.prod.outlook.com
 (2603:10b6:8:148::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8044:EE_|MN0PR12MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1a8fb1-3d5c-48ec-61d2-08ddefe6c0be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JWeH/bbxxW4B+fR0yG4yTn0lp5I3HZaXKTTa6yJ9nuje8D1Kd7SQPohvwNnJ?=
 =?us-ascii?Q?vIWcXiONr7j+aFsatYGgnNdJvGF/aM/irLW6breSTXODf9/L9ES690keMUt4?=
 =?us-ascii?Q?8KBRbapiaBl85T7jwR76WnrRmCLeTAZmfo5xx9xDJ938kLRXHgMTS9TEWj/g?=
 =?us-ascii?Q?RbVslj5+KpY68UInyAkk6x5MXNjm/3EsrqsU0J76F5DZV1d9uK3aSGye+r9w?=
 =?us-ascii?Q?mPqU9aipj8kEpKMqi+gDKdRu82bKms8680oduOxw3fBpcEm2nU5olSU4xQYh?=
 =?us-ascii?Q?KPfd25fREnPUi8KF/L36+CeEv6u5mUTiPnKA7MAQZGt7IQuGC4tD7yqnVFLo?=
 =?us-ascii?Q?n3jdfNu6MsNxev8E9jVzBFnYJ44zeIttud9vzAbPriOvBxSo0a2sN+ad6oJ7?=
 =?us-ascii?Q?dirig+L93hWqK05Pj+JFLoUtoI4dEgRHPfK+XnEMxj+mFh2o+VM+bsaf5f7D?=
 =?us-ascii?Q?JBBcc0rvpJ5aFmZiX0+dAYsEFnPZC8RsB/ICAV7AJFcFpiZ9e7HyVLQ1ubvl?=
 =?us-ascii?Q?0Pbm0Gy6EoHZoBAin0xvfEXNCf1U0+i87yc8Pu0nAbZBSMXseCwdss7KDCEC?=
 =?us-ascii?Q?sqwHiuWGrxI8KcTKyWKPjeYxOpLM35I1KyjL2OdViYNQeWYWSDRgMbiyEiyY?=
 =?us-ascii?Q?1wcwzrAMusUWSE2STgHrfxjcZld0bjoVhk79gPDiXxfm3L55rH4PyKNVg7SP?=
 =?us-ascii?Q?KoqE8wwCSPaDSDe+ORmZW5uC2XjTLiHwS/HxbSoJgUpCmQcjCWDAO9JEviuZ?=
 =?us-ascii?Q?rGplPWJFlrCQm6qIULI4tK7qXlbFPZxhawPsW0evO3DefvuMmYPdukRz5QD4?=
 =?us-ascii?Q?vvV+kb9JnZfPE/uItXNQKqbya9pOAeG694BBMqAUmcQrvt39tiapCJMsXXgB?=
 =?us-ascii?Q?nE007CUO7Pq7CF3C/L2iCwn1q8fMhirAf3UrYuKb6l2+c7RebsRPq8MI9OTC?=
 =?us-ascii?Q?AofYsQw5CEGlyc02Xl2DkFM+8GjSygbtq5YJpdCH/JppI5OgIr2h6xoBuf0j?=
 =?us-ascii?Q?ToIZUNJK1X/HPMQIqrPf65cccmqPyIcPNblpNqTwD1DifOxmdadqBu05Pb8o?=
 =?us-ascii?Q?RwP9uwefWHMUzpJTj0TO/3VZhNmcZMbYw0sw3tIXs7YSCqLxQVsxoNzJ6NBs?=
 =?us-ascii?Q?pEZBtgJcuKYFM7WQe2fqZdHaer9Jb8TngiKVZ9evCsQKPcmkN5jtOB5PyxBQ?=
 =?us-ascii?Q?TGD/zan0ksDYDJUbAz/b4tmGc88vjI8njwfXE7rh2EiFJnCL3aHmLOjLBktL?=
 =?us-ascii?Q?uMID2C69Qwj1bZbSDvhMe0B3POjdqtp4/Fi3ft14tfhdaJ7Kv3pE6X3cWM5t?=
 =?us-ascii?Q?EN7+KsDYZ9/ADIrlHqZFjp/d2aNE56djsMkCzljqYBA9gb1mYQ+LaLg5Vxwc?=
 =?us-ascii?Q?zyUn2kG13B8ILG/4yV2QKgvjs+tuZI2mXoXasl8EP8TQRW5afbmX4cXjAw/c?=
 =?us-ascii?Q?cee8PCTGU90=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8044.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?86oKCxGxwMjCAZ08TIKj4hA4tF0GMp+xwvKxR/k2lqKgyWqLTtbDWjJMYlQm?=
 =?us-ascii?Q?ZiRNd1mLW4RrXLQzZDr93rMQq/fcYH7opf2tjhWArnAznf1o4BndnnlFFLNR?=
 =?us-ascii?Q?UFDrDM8iVlv//a6dmMG75Xt6NP0hpYwf8Y2Dx/W8DIoEoHnoyy+1gbhDzEwz?=
 =?us-ascii?Q?FDutxZQ3VVNVIx+9FqNf2ALqWUKqRebzlkOAkcS/Q55FYo6DxIOmv4GGtReK?=
 =?us-ascii?Q?V9NhZl10wkjnQdqa0ICt1ekedvnZLbCChnCrvIQdDCcxV1uscogWvzCE3/Fz?=
 =?us-ascii?Q?p2vCZgQd8DP7JU4xdLaa1Jhtc01DqqzWBj52Yzh3j7NL6srEV+Rw0X+3Bza0?=
 =?us-ascii?Q?ENnwZIy779OD3SD5A23l8VOo22YGDE2vJc6RXvRzDLfl118tr5qgt6eAlrDV?=
 =?us-ascii?Q?LrDwxbZRYRKbAc/HIAurqTN/QoX0mj3XNDGb3QI21jnfWGCPixtjjz8SeDQ2?=
 =?us-ascii?Q?p69y6J5zKj2SxGe7cB9VlnkhctpUcqTSYoTo408ghaH9GHEXfHwdezMV5IF3?=
 =?us-ascii?Q?b/DJDfgeJ+WpqBZvxPtXXZZOF8sTo60j9Faj5EgHIa0o6S45besOFaP/ZSLd?=
 =?us-ascii?Q?DfVLkW9cyLTrqJ7414NUGcjMrHC+i95STaTNovD7rqfXd2DukEIlCLdlbCu0?=
 =?us-ascii?Q?poEWfDSJdb+oLvJcSPYlLM7neDQve3lhHUccK10AWWAOTiGQyMt5vFGYOL/O?=
 =?us-ascii?Q?D9tcTZ3mP4dm+J++OZy1yIdLWzGBZBckd7+wRL7PWmiqBdVEQFI8HCDqQmMR?=
 =?us-ascii?Q?qU8mY5esbJ1hQKWW1pq0jtOP5uLDSJQPIDyEWNounQRY/+rHPpxBSW/71iE3?=
 =?us-ascii?Q?U0m/7gz3lC1qGxlLYNjCNsW9mj13FxTt30gihGV5/bHL9OaaLIMDmO9WRkGd?=
 =?us-ascii?Q?xCkmWJAfhbmho4I2/NFof+E+7SuQOqSWIgvaUCa1/Z+MAxV9z8I9505PIxTo?=
 =?us-ascii?Q?qGY9RfL7byqBHjXaSqihtYeMtdWcQfIcN0vC1F+zpm2NDcbuswDY8HSISa8j?=
 =?us-ascii?Q?Bl2n6WKvymwiWJWVH1B5b4hLFl2UQJN63qtPmv09biykSvHQShA6yUgFIjh8?=
 =?us-ascii?Q?Hb3nEkb6VNRPdB/1VXj+fg5GH3DOr2Jr3Lz2nrzsqL8CTuU/tn8Hsv6Az67q?=
 =?us-ascii?Q?BgbYTFvsfuHg7Q6qa8agrtM6SD6tnep4j2wgswsLB17hXKw7FOPf0No6l7qo?=
 =?us-ascii?Q?nt9mlTCW4i4yoNxYIRMJBn5dyYBcYO/bhDUJuKPMYW9fvje6Q8yh/E9ARKHc?=
 =?us-ascii?Q?28wF6Gt54nThzXvIxetDdiAP82rDEkNew1834XbmoVqNWtB7RxczYnp+5+SA?=
 =?us-ascii?Q?qyTAfJBkIwJ3yHOlGqqPNY19UcL397mv8t15pN/fCxvPoLUP3efZLrDF/4wi?=
 =?us-ascii?Q?fZrAWwF9ng4MsNNPnNtGW48OVmx0yNPkTPqaAME7xpQY+oPtI7aYzONlOaQE?=
 =?us-ascii?Q?S7yioEF0NwrlMEuSReZ3uewxRM2ieOM4wycGHtCm9obhCWZaDTbkExPl96jq?=
 =?us-ascii?Q?vhy47SIRc4N9uwmOmDAXYLIPGpPgfE9xbg2OmIq/F8u5RoHdCPlYYPU1ks8/?=
 =?us-ascii?Q?iiLigwG1n7P9YaJfdy74M9JzfbpK1xbdpLbuHk8S?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1a8fb1-3d5c-48ec-61d2-08ddefe6c0be
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 21:20:51.3265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzHQNnOVfbn/pfALr+8JLPIwoIqXXBupF+XDc0+zzHwY1A7SukiiJeZLCtyegfujvjCHDEnQmgrkjeVTBbrUXA==
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

The bitfield-specific into new macro. This will be used to define
structs with bitfields, similar to C language.

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs    | 314 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs   |   3 +
 drivers/gpu/nova-core/regs/macros.rs | 259 +---------------------
 3 files changed, 327 insertions(+), 249 deletions(-)
 create mode 100644 drivers/gpu/nova-core/bitfield.rs

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
new file mode 100644
index 000000000000..ba6b7caa05d9
--- /dev/null
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Bitfield library for Rust structures
+//!
+//! Support for defining bitfields in Rust structures. Also used by the [`register!`] macro.
+//!
+//! # Syntax
+//!
+//! ```rust
+//! #[derive(Debug, Clone, Copy)]
+//! enum Mode {
+//!     Low = 0,
+//!     High = 1,
+//!     Auto = 2,
+//! }
+//!
+//! impl TryFrom<u8> for Mode {
+//!     type Error = u8;
+//!     fn try_from(value: u8) -> Result<Self, Self::Error> {
+//!         match value {
+//!             0 => Ok(Mode::Low),
+//!             1 => Ok(Mode::High),
+//!             2 => Ok(Mode::Auto),
+//!             _ => Err(value),
+//!         }
+//!     }
+//! }
+//!
+//! impl From<Mode> for u32 {
+//!     fn from(mode: Mode) -> u32 {
+//!         mode as u32
+//!     }
+//! }
+//!
+//! #[derive(Debug, Clone, Copy)]
+//! enum State {
+//!     Inactive = 0,
+//!     Active = 1,
+//! }
+//!
+//! impl From<bool> for State {
+//!     fn from(value: bool) -> Self {
+//!         if value { State::Active } else { State::Inactive }
+//!     }
+//! }
+//!
+//! impl From<State> for u32 {
+//!     fn from(state: State) -> u32 {
+//!         state as u32
+//!     }
+//! }
+//!
+//! bitfield! {
+//!     struct ControlReg {
+//!         3:0       mode        as u8 ?=> Mode;
+//!         7         state       as bool => State;
+//!     }
+//! }
+//! ```
+//!
+//! This generates a struct with:
+//! - Field accessors: `mode()`, `state()`, etc.
+//! - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
+//! - Debug and Default implementations
+//!
+//! The field setters can be used with the builder pattern, example:
+//! ControlReg::default().set_mode(mode).set_state(state);
+//!
+//! Fields are defined as follows:
+//!
+//! - `as <type>` simply returns the field value casted to <type>, typically `u32`, `u16`, `u8` or
+//!   `bool`. Note that `bool` fields must have a range of 1 bit.
+//! - `as <type> => <into_type>` calls `<into_type>`'s `From::<<type>>` implementation and returns
+//!   the result.
+//! - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
+//!   and returns the result. This is useful with fields for which not all values are valid.
+//!
+macro_rules! bitfield {
+    // Main entry point - defines the bitfield struct with fields
+    (struct $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
+        bitfield!(@core $name $(, $comment)? { $($fields)* });
+    };
+
+    // All rules below are helpers.
+
+    // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
+    // `Default`, `BitOr`, and conversion to the value type) and field accessor methods.
+    (@core $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
+        $(
+        #[doc=$comment]
+        )?
+        #[repr(transparent)]
+        #[derive(Clone, Copy)]
+        pub(crate) struct $name(u32);
+
+        impl ::core::ops::BitOr for $name {
+            type Output = Self;
+
+            fn bitor(self, rhs: Self) -> Self::Output {
+                Self(self.0 | rhs.0)
+            }
+        }
+
+        impl ::core::convert::From<$name> for u32 {
+            fn from(val: $name) -> u32 {
+                val.0
+            }
+        }
+
+        bitfield!(@fields_dispatcher $name { $($fields)* });
+    };
+
+    // Captures the fields and passes them to all the implementers that require field information.
+    //
+    // Used to simplify the matching rules for implementers, so they don't need to match the entire
+    // complex fields rule even though they only make use of part of it.
+    (@fields_dispatcher $name:ident {
+        $($hi:tt:$lo:tt $field:ident as $type:tt
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+            $(, $comment:literal)?
+        ;
+        )*
+    }
+    ) => {
+        bitfield!(@field_accessors $name {
+            $(
+                $hi:$lo $field as $type
+                $(?=> $try_into_type)?
+                $(=> $into_type)?
+                $(, $comment)?
+            ;
+            )*
+        });
+        bitfield!(@debug $name { $($field;)* });
+        bitfield!(@default $name { $($field;)* });
+    };
+
+    // Defines all the field getter/setter methods for `$name`.
+    (
+        @field_accessors $name:ident {
+        $($hi:tt:$lo:tt $field:ident as $type:tt
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+            $(, $comment:literal)?
+        ;
+        )*
+        }
+    ) => {
+        $(
+            bitfield!(@check_field_bounds $hi:$lo $field as $type);
+        )*
+
+        #[allow(dead_code)]
+        impl $name {
+            $(
+            bitfield!(@field_accessor $name $hi:$lo $field as $type
+                $(?=> $try_into_type)?
+                $(=> $into_type)?
+                $(, $comment)?
+                ;
+            );
+            )*
+        }
+    };
+
+    // Boolean fields must have `$hi == $lo`.
+    (@check_field_bounds $hi:tt:$lo:tt $field:ident as bool) => {
+        #[allow(clippy::eq_op)]
+        const _: () = {
+            ::kernel::build_assert!(
+                $hi == $lo,
+                concat!("boolean field `", stringify!($field), "` covers more than one bit")
+            );
+        };
+    };
+
+    // Non-boolean fields must have `$hi >= $lo`.
+    (@check_field_bounds $hi:tt:$lo:tt $field:ident as $type:tt) => {
+        #[allow(clippy::eq_op)]
+        const _: () = {
+            ::kernel::build_assert!(
+                $hi >= $lo,
+                concat!("field `", stringify!($field), "`'s MSB is smaller than its LSB")
+            );
+        };
+    };
+
+    // Catches fields defined as `bool` and convert them into a boolean value.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
+            $(, $comment:literal)?;
+    ) => {
+        bitfield!(
+            @leaf_accessor $name $hi:$lo $field
+            { |f| <$into_type>::from(if f != 0 { true } else { false }) }
+            $into_type => $into_type $(, $comment)?;
+        );
+    };
+
+    // Shortcut for fields defined as `bool` without the `=>` syntax.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
+    ) => {
+        bitfield!(@field_accessor $name $hi:$lo $field as bool => bool $(, $comment)?;);
+    };
+
+    // Catches the `?=>` syntax for non-boolean fields.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
+            $(, $comment:literal)?;
+    ) => {
+        bitfield!(@leaf_accessor $name $hi:$lo $field
+            { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
+            ::core::result::Result<
+                $try_into_type,
+                <$try_into_type as ::core::convert::TryFrom<$type>>::Error
+            >
+            $(, $comment)?;);
+    };
+
+    // Catches the `=>` syntax for non-boolean fields.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
+            $(, $comment:literal)?;
+    ) => {
+        bitfield!(@leaf_accessor $name $hi:$lo $field
+            { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
+    };
+
+    // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt
+            $(, $comment:literal)?;
+    ) => {
+        bitfield!(@field_accessor $name $hi:$lo $field as $type => $type $(, $comment)?;);
+    };
+
+    // Generates the accessor methods for a single field.
+    (
+        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
+            { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
+    ) => {
+        ::kernel::macros::paste!(
+        const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+        const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+        const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
+        );
+
+        $(
+        #[doc="Returns the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        pub(crate) fn $field(self) -> $res_type {
+            ::kernel::macros::paste!(
+            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
+            );
+            let field = ((self.0 & MASK) >> SHIFT);
+
+            $process(field)
+        }
+
+        ::kernel::macros::paste!(
+        $(
+        #[doc="Sets the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
+            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
+            let value = (u32::from(value) << SHIFT) & MASK;
+            self.0 = (self.0 & !MASK) | value;
+
+            self
+        }
+        );
+    };
+
+    // Generates the `Debug` implementation for `$name`.
+    (@debug $name:ident { $($field:ident;)* }) => {
+        impl ::core::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+                f.debug_struct(stringify!($name))
+                    .field("<raw>", &format_args!("{:#x}", &self.0))
+                $(
+                    .field(stringify!($field), &self.$field())
+                )*
+                    .finish()
+            }
+        }
+    };
+
+    // Generates the `Default` implementation for `$name`.
+    (@default $name:ident { $($field:ident;)* }) => {
+        /// Returns a value for the bitfield where all fields are set to their default value.
+        impl ::core::default::Default for $name {
+            fn default() -> Self {
+                #[allow(unused_mut)]
+                let mut value = Self(Default::default());
+
+                ::kernel::macros::paste!(
+                $(
+                value.[<set_ $field>](Default::default());
+                )*
+                );
+
+                value
+            }
+        }
+    };
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 4dbc7e5daae3..eaba6ad22f7a 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,9 @@
 
 //! Nova Core GPU Driver
 
+#[macro_use]
+mod bitfield;
+
 mod dma;
 mod driver;
 mod falcon;
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 754c14ee7f40..945d15a2c529 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -8,7 +8,8 @@
 //!
 //! The `register!` macro in this module provides an intuitive and readable syntax for defining a
 //! dedicated type for each register. Each such type comes with its own field accessors that can
-//! return an error if a field's value is invalid.
+//! return an error if a field's value is invalid. Please look at the [`bitfield`] macro for the
+//! complete syntax of fields definitions.
 
 /// Trait providing a base address to be added to the offset of a relative register to obtain
 /// its actual offset.
@@ -54,15 +55,6 @@ pub(crate) trait RegisterBase<T> {
 /// BOOT_0::alter(&bar, |r| r.set_major_revision(3).set_minor_revision(10));
 /// ```
 ///
-/// Fields are defined as follows:
-///
-/// - `as <type>` simply returns the field value casted to <type>, typically `u32`, `u16`, `u8` or
-///   `bool`. Note that `bool` fields must have a range of 1 bit.
-/// - `as <type> => <into_type>` calls `<into_type>`'s `From::<<type>>` implementation and returns
-///   the result.
-/// - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
-///   and returns the result. This is useful with fields for which not all values are valid.
-///
 /// The documentation strings are optional. If present, they will be added to the type's
 /// definition, or the field getter and setter methods they are attached to.
 ///
@@ -284,25 +276,25 @@ pub(crate) trait RegisterBase<T> {
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address provider.
     ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $offset ]);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
@@ -313,7 +305,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_array $name @ $offset [ $size ; $stride ]);
     };
 
@@ -334,7 +326,7 @@ macro_rules! register {
             $(, $comment:literal)? { $($fields:tt)* }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
     };
 
@@ -356,7 +348,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!($idx < $alias::SIZE);
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
     };
 
@@ -365,241 +357,10 @@ macro_rules! register {
     // to avoid it being interpreted in place of the relative register array alias rule.
     ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
         static_assert!($idx < $alias::SIZE);
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
     };
 
-    // All rules below are helpers.
-
-    // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
-    // `Default`, `BitOr`, and conversion to the value type) and field accessor methods.
-    (@core $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
-        $(
-        #[doc=$comment]
-        )?
-        #[repr(transparent)]
-        #[derive(Clone, Copy)]
-        pub(crate) struct $name(u32);
-
-        impl ::core::ops::BitOr for $name {
-            type Output = Self;
-
-            fn bitor(self, rhs: Self) -> Self::Output {
-                Self(self.0 | rhs.0)
-            }
-        }
-
-        impl ::core::convert::From<$name> for u32 {
-            fn from(reg: $name) -> u32 {
-                reg.0
-            }
-        }
-
-        register!(@fields_dispatcher $name { $($fields)* });
-    };
-
-    // Captures the fields and passes them to all the implementers that require field information.
-    //
-    // Used to simplify the matching rules for implementers, so they don't need to match the entire
-    // complex fields rule even though they only make use of part of it.
-    (@fields_dispatcher $name:ident {
-        $($hi:tt:$lo:tt $field:ident as $type:tt
-            $(?=> $try_into_type:ty)?
-            $(=> $into_type:ty)?
-            $(, $comment:literal)?
-        ;
-        )*
-    }
-    ) => {
-        register!(@field_accessors $name {
-            $(
-                $hi:$lo $field as $type
-                $(?=> $try_into_type)?
-                $(=> $into_type)?
-                $(, $comment)?
-            ;
-            )*
-        });
-        register!(@debug $name { $($field;)* });
-        register!(@default $name { $($field;)* });
-    };
-
-    // Defines all the field getter/methods methods for `$name`.
-    (
-        @field_accessors $name:ident {
-        $($hi:tt:$lo:tt $field:ident as $type:tt
-            $(?=> $try_into_type:ty)?
-            $(=> $into_type:ty)?
-            $(, $comment:literal)?
-        ;
-        )*
-        }
-    ) => {
-        $(
-            register!(@check_field_bounds $hi:$lo $field as $type);
-        )*
-
-        #[allow(dead_code)]
-        impl $name {
-            $(
-            register!(@field_accessor $name $hi:$lo $field as $type
-                $(?=> $try_into_type)?
-                $(=> $into_type)?
-                $(, $comment)?
-                ;
-            );
-            )*
-        }
-    };
-
-    // Boolean fields must have `$hi == $lo`.
-    (@check_field_bounds $hi:tt:$lo:tt $field:ident as bool) => {
-        #[allow(clippy::eq_op)]
-        const _: () = {
-            ::kernel::build_assert!(
-                $hi == $lo,
-                concat!("boolean field `", stringify!($field), "` covers more than one bit")
-            );
-        };
-    };
-
-    // Non-boolean fields must have `$hi >= $lo`.
-    (@check_field_bounds $hi:tt:$lo:tt $field:ident as $type:tt) => {
-        #[allow(clippy::eq_op)]
-        const _: () = {
-            ::kernel::build_assert!(
-                $hi >= $lo,
-                concat!("field `", stringify!($field), "`'s MSB is smaller than its LSB")
-            );
-        };
-    };
-
-    // Catches fields defined as `bool` and convert them into a boolean value.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
-            $(, $comment:literal)?;
-    ) => {
-        register!(
-            @leaf_accessor $name $hi:$lo $field
-            { |f| <$into_type>::from(if f != 0 { true } else { false }) }
-            $into_type => $into_type $(, $comment)?;
-        );
-    };
-
-    // Shortcut for fields defined as `bool` without the `=>` syntax.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
-    ) => {
-        register!(@field_accessor $name $hi:$lo $field as bool => bool $(, $comment)?;);
-    };
-
-    // Catches the `?=>` syntax for non-boolean fields.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
-            $(, $comment:literal)?;
-    ) => {
-        register!(@leaf_accessor $name $hi:$lo $field
-            { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
-            ::core::result::Result<
-                $try_into_type,
-                <$try_into_type as ::core::convert::TryFrom<$type>>::Error
-            >
-            $(, $comment)?;);
-    };
-
-    // Catches the `=>` syntax for non-boolean fields.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
-            $(, $comment:literal)?;
-    ) => {
-        register!(@leaf_accessor $name $hi:$lo $field
-            { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
-    };
-
-    // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt
-            $(, $comment:literal)?;
-    ) => {
-        register!(@field_accessor $name $hi:$lo $field as $type => $type $(, $comment)?;);
-    };
-
-    // Generates the accessor methods for a single field.
-    (
-        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
-            { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
-    ) => {
-        ::kernel::macros::paste!(
-        const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
-        const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
-        const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
-        );
-
-        $(
-        #[doc="Returns the value of this field:"]
-        #[doc=$comment]
-        )?
-        #[inline(always)]
-        pub(crate) fn $field(self) -> $res_type {
-            ::kernel::macros::paste!(
-            const MASK: u32 = $name::[<$field:upper _MASK>];
-            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            );
-            let field = ((self.0 & MASK) >> SHIFT);
-
-            $process(field)
-        }
-
-        ::kernel::macros::paste!(
-        $(
-        #[doc="Sets the value of this field:"]
-        #[doc=$comment]
-        )?
-        #[inline(always)]
-        pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
-            const MASK: u32 = $name::[<$field:upper _MASK>];
-            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            let value = (u32::from(value) << SHIFT) & MASK;
-            self.0 = (self.0 & !MASK) | value;
-
-            self
-        }
-        );
-    };
-
-    // Generates the `Debug` implementation for `$name`.
-    (@debug $name:ident { $($field:ident;)* }) => {
-        impl ::core::fmt::Debug for $name {
-            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
-                f.debug_struct(stringify!($name))
-                    .field("<raw>", &format_args!("{:#x}", &self.0))
-                $(
-                    .field(stringify!($field), &self.$field())
-                )*
-                    .finish()
-            }
-        }
-    };
-
-    // Generates the `Default` implementation for `$name`.
-    (@default $name:ident { $($field:ident;)* }) => {
-        /// Returns a value for the register where all fields are set to their default value.
-        impl ::core::default::Default for $name {
-            fn default() -> Self {
-                #[allow(unused_mut)]
-                let mut value = Self(Default::default());
-
-                ::kernel::macros::paste!(
-                $(
-                value.[<set_ $field>](Default::default());
-                )*
-                );
-
-                value
-            }
-        }
-    };
-
     // Generates the IO accessors for a fixed offset register.
     (@io_fixed $name:ident @ $offset:expr) => {
         #[allow(dead_code)]
-- 
2.34.1

