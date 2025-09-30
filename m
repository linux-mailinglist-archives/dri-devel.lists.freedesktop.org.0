Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FF7BAD052
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025D910E5C2;
	Tue, 30 Sep 2025 13:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LWWDn8ND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013003.outbound.protection.outlook.com
 [40.93.201.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E2810E5BE;
 Tue, 30 Sep 2025 13:17:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhj9+mbE221MlNff//8C87B4vIY10CpGmXo77RoypvJ1ac3LZMKIrZBpA66aoRhGEuXtqvQvaDBZIdmyHkw/ofwpN05QXPRwGmaebnY7mgr9ttvOv8wrNDQ7rguC4eeMblQK13I5B7GD0RNlziyXsRd0wh8aUyzJmh03euKlP3vU6irUNbesYgICbBAuXz+gr3UPdDyhSRSIkF4fMTTP6PFmCB8pla6xCeNx4ieI6YH89ydJXzBzTevyjDhyC4Gii37Cy8KtzOzQlFnbq8soO8nBW8LQ5PVVKFbHDKbr7eK5swMye5OmPIveyBu5/+rMK0zDX46IbmmDG5c/+oyq8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uHqf/9Azr67kP3Ox8NEwsHcLIda6V0EXy3i6U8YSns=;
 b=lphIGJCPBeEBg0I9PLnRyHPsTXlyY2D3UN4wlgNuzlZJpxZ8vwvQjlMuxsT6PGW0r9FuivDrr/rIJ4tnaigLo429JI7of6kiJOf8yFLqE8llngYl5jnenqWXBt9drrX8DmW/ye1Ss369xo0YTHsMwnJbzt/7jt9ykNs5rOq2B9E4wrpshxcNFFJ2NRj8iZASBThT3gLO0rtK4c37TFaSPBT6uDHQCozpRrAaAAcqvPENeIXp1bFjkjALH36gndWq4SsszhGnF1tO9YIMACdtKYjJs2taC6Ks44DkU3IW0c0XG1bPfokrVvc4xUgKitv3w1JkbqMd6eeRR3jySaxdOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uHqf/9Azr67kP3Ox8NEwsHcLIda6V0EXy3i6U8YSns=;
 b=LWWDn8NDa65+p/shiq3q2GYUAqv8ecH8SaKI23LNvC7XfEsrkZRHkp9iDtVCyMUKgcvOyfHCvxUAyXbmNDiYSMv8KrARSX3/H2p7TYxSMlaAH4Soc1lDtxD/5+F4OKmxJd4uOtF8b1y/CfYr2t+A+LYD4so7jA5o0Fhj8UPsxkeRmzMak0IIIgKlADhJUpJBhwJiAgmxpopbSBrM5+12gLu+tQ/7goMYz1zyQD4cObhFmT6VocFytudIIIP4gyPwytH42hoZUv7wu09mFFIg14KNUh8LgKbwqL4JhRfbCR/z/LVyEQm42/ptCc4uQE3tks/6IUqRau/TZdbd2ewKEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Tue, 30 Sep 2025 13:17:54 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:17:54 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v3 11/13] nova-core: falcon: Add support to check if RISC-V is
 active
Date: Tue, 30 Sep 2025 23:16:44 +1000
Message-ID: <20250930131648.411720-12-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930131648.411720-1-apopple@nvidia.com>
References: <20250930131648.411720-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0183.ausprd01.prod.outlook.com
 (2603:10c6:10:52::27) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b7ed66-3fce-4c80-e081-08de0023c3a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UU7KcqrK8g8sgEPaBBDVjLIo7xX7KRd7iJdxrwhK8yW84X5jBWZygpM2Wo6E?=
 =?us-ascii?Q?K6FFm7GmIGJQQz+Y5NOuov58RYPYa5pZpRAFC+lTAT2HanVdo2QttuaGElk4?=
 =?us-ascii?Q?6CaRDHX6b+HTpKkcrpd5DSfrAIW9jnlAK3iRS66e1hhdLHpmpyVGA9/bZo96?=
 =?us-ascii?Q?7FlX9azmYSzX87pwqjUnSnQf0yqQAfm9pk5fyLrSfVF3zE5YCnkaP43cwSAg?=
 =?us-ascii?Q?/HEbMy850+ixOWUAwhncplk2vxlamOY0TZ0DLx0Nr9ejKeZngD5DuOm7eGks?=
 =?us-ascii?Q?lOtUuYx8JgdGGP5V8WLZ+ko3KvkaTJBW83ac0SsXwMg0aoXc2zfV5xSBdET8?=
 =?us-ascii?Q?ahCPxxj/pXgbB8kFJZAJWWuTP3YT+xlBI+/TmLa6hbMB8SkONiVacSk5dhlg?=
 =?us-ascii?Q?O8MEI53M+JVoojRDfgxrDdshNHirdHH4h7pEKiHYswq9eYILz1aaZu/kmgjq?=
 =?us-ascii?Q?ziCOX5P24CkOXQy7D50LDZL+SUX8aNDpScgO3I/a+z/QoOH/5Uv2XdzGhSL+?=
 =?us-ascii?Q?lnuV0VpwjOFDO8lDlkf1r3Ppery2W0nb2da/cwRvBW/AmRkYhSgXVKc8R7P/?=
 =?us-ascii?Q?8OK64z316YhCEl9fil2Al20Re1cLmYNqKswuiKyP6zFy1jhihAhlwwdHTIri?=
 =?us-ascii?Q?mFIk7wqaQPOyulfFHvCILqt9LjjJj753ms29BG0eJhSaq9GEZyQC82NXyhsi?=
 =?us-ascii?Q?FAn2uqJcHpCDFKmX7gPncQZEj4/7LJFt6bz3+K/DqqGnb7IjqpfExuA64W1A?=
 =?us-ascii?Q?WdlOQocI2yweGqdfnhsev/Z10MmNNsYgRGwMbvlyNqZWltXRSlioS4xm1L8M?=
 =?us-ascii?Q?H4q1WnZWYHjGmY9VfCLhrAt4ex2Ybj34gddOHcYC7WLRcyyJV+dU5tVwAOXy?=
 =?us-ascii?Q?oIhfnHnZf8lsDdNGWYYl1lJoRcEOMidQnIedfyAlTCDGdizx69xwzevbwWs2?=
 =?us-ascii?Q?qRxL8aSfVTvKzCx6IAOMtAaVPGVXVmO+33YCX7aRC4ABkaSQm2fKx15Z1GW1?=
 =?us-ascii?Q?yidjI9cUS13J/5tyQ2jDgYuUUgsMeHSkwymnf7zvAwlLbTlRQ1xgwCKcsLtG?=
 =?us-ascii?Q?TL9MpzaVr7tUzBMrhLKhdhkxPGhXfR3pbD6GyadHMRetaHXtj30rvRWUZ5nT?=
 =?us-ascii?Q?YRsplJFrUx4gPlbW2exyjQGaklpxbqvcLC2dptbA9GFPblgM0j44ahi2VAgX?=
 =?us-ascii?Q?T7B0G6NsP/lo69o3HH/ih5lgzwPmfB0L4llOEYxSkdeaMj0KwjBPEbq6qAd5?=
 =?us-ascii?Q?4eAmXVuAzU7SkLz7iE/MRTD4rGSwPjbOlhMDAeBKiVhNtOcksuC9iZV0nHb0?=
 =?us-ascii?Q?HXviu3PpKupSWJdHfGm6RWxKpRIBKSikvAk0NYvjArPEpTA0cvbiF3HoTdOy?=
 =?us-ascii?Q?PjAEKoGoaBWWnGZ1rp7Cn7/2i8Cjm+AryVOzXZBe0gnXwXMCK/uO+wUs6jte?=
 =?us-ascii?Q?Sfwc3q/BcRgswaYxJ+emzl6DTuhWNDmK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zghxgvRKSJHkQkomyDYj5swP/ZkvfYBumWxZ6+0EeHjfZ7cmEcw4xML8QFaS?=
 =?us-ascii?Q?NzEErh3T2BYx3ZbyEwQAM+1ZsmspP0KqbSURNGowXydbglS5BvJ7GQYUBsJc?=
 =?us-ascii?Q?sct6iiLI2PGrujZX0PKxZpVQcaXEccDvvuZwlUMl3Q6RMdfrx6O0q+ThljLl?=
 =?us-ascii?Q?9LAqVPK8DE8FQjDIoqe9LWNacOqJf+cMmnz9WPYr+2W8Nl69y9u6ZRdrceEf?=
 =?us-ascii?Q?oaEvFb1evjuwnwNvrRxhqEniBQWasjugNA7d1gRB/+6mGRhJ5jJ+Ay8OBEQh?=
 =?us-ascii?Q?IBJ3SrppO+Lfp3ORIth+CJiq9SB3/xdSJZtFMxZQPhE+9YYtGhxUyBmC5lFC?=
 =?us-ascii?Q?+bhv0y+dr/IXv3itWmnmYQN7CYg5UZJp2rbxf0r8TbmNq0M2OM9nSNOF2E5U?=
 =?us-ascii?Q?dhpt3lDhkIg1Xd0wGaci6SyxLp+d/yw1DtCHvrx4rq+MONMH32uVpcrofGcV?=
 =?us-ascii?Q?SGo2ZP2XdQJ1/As8qLGFIBrK/bTXkp3ZCJyZ1fhWfyj8hcxZ3f0cmyfKFAfd?=
 =?us-ascii?Q?WrEige82tgeuIwBAn7t570kUn9+LdqARjClaZoiTroYyt/UwFFQgIwNsA7bp?=
 =?us-ascii?Q?m2OIogi1RyZSB+RldLrtoczYXoTh493kWpbMkLvif3Gny6+C7IGbeao9Y5XQ?=
 =?us-ascii?Q?I3YMjLbpjHJeYHvJEQhPirXX1ViOPmOwF2ac3i7frAzuKC0CCqv/90VLfpKE?=
 =?us-ascii?Q?KwQwNtoEOD+Ft0oHIzNFmqURbe0v9RWbrtyppnVaM/exOIHo7ZwZp08l9Z10?=
 =?us-ascii?Q?V9tBOQ5Q8Mut25WhTUFM33FRHfCVBgB7Gg8hVV/ge7xvy9KUoncYwJprSOyt?=
 =?us-ascii?Q?+CCXMNBxY9KQqWSBAyma7cVnUFwde02tgBq3QKgfVLJLgmJwcnLVLj9pEx37?=
 =?us-ascii?Q?1aJd2r5ex8k70mSzcUf/cT9ifniLNrccjkOY+5UPZ9MZ4DydwJP793sWmDKx?=
 =?us-ascii?Q?e5zjEdf78o66AhKFNCpGevQDRHvQ/vnyAP1ojWaLzih483L39/FBGhLXsfVY?=
 =?us-ascii?Q?pw05oypKfr/DEfVUxG7eS8MP9hc0hF6vYRAjm3dQvbhPOB1MTwFBMrESgpaL?=
 =?us-ascii?Q?GlrbCK7lwWbcsEIn7ds579ZEyTZDttZ20ZdJTlg1KtGvCgd4W+wXHReJnZys?=
 =?us-ascii?Q?/gX5nSVpfWiwP9xg1oCndHro1+1vJBalyaUyQLtpe5B6BDskSVHGluPOfnn6?=
 =?us-ascii?Q?caO0Z639KEegjeDG9biDwDCvSGSjE5hPphd/4Yji+HL80Qw9gx0GA++Y4wym?=
 =?us-ascii?Q?cCkdAA30ggjrhfhCjuYgPAczwl9uaQaDslO6pzIX920W1HosObt7+8Omgo/S?=
 =?us-ascii?Q?GvIGgTeV7oGU8EGLbfpSCT9sE4JunUJ27xL4j7xG+qVT+75C0RXHQQVbquFZ?=
 =?us-ascii?Q?d7j9GhtBdqrKJwlOskEURQ+kV3MrCh8XTSE58olMznkEkb+l6xoSlWh1CDpq?=
 =?us-ascii?Q?pEciDOyngL5iYoz4EkRFAFrY+6g5xXCleHT/V+uuVvdQQatNSvIX6ZvoWPeE?=
 =?us-ascii?Q?kcQi9Zce9qCNqkDc64t1FJbtBerT0nOg5xOYqBOrBz7yCiL4ROcsdBXP1dV4?=
 =?us-ascii?Q?ZNC0Bd064taIcAyo1JNEafzD2gTE4PGecN5efWNN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b7ed66-3fce-4c80-e081-08de0023c3a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:17:54.1686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yM1DFa8dWSYL7x3qExeP21MwXEnqfQzkHRuS941jK20epPrcsqTYKHh0gp5pK17m1tv2K4ecPHJuIOQ3v89V1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Add definition for RISCV_CPUCTL register and use it in a new falcon API
to check if the RISC-V core of a Falcon is active. It is required by
the sequencer to know if the GSP's RISCV processor is active.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/nova-core/falcon.rs | 9 +++++++++
 drivers/gpu/nova-core/regs.rs   | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 37e6298195e4..c7907f16bcf4 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -610,4 +610,13 @@ pub(crate) fn signature_reg_fuse_version(
         self.hal
             .signature_reg_fuse_version(self, bar, engine_id_mask, ucode_id)
     }
+
+    /// Check if the RISC-V core is active.
+    ///
+    /// Returns `true` if the RISC-V core is active, `false` otherwise.
+    #[expect(unused)]
+    pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> Result<bool> {
+        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
+        Ok(cpuctl.active_stat())
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 0585699ae951..5df6a2bf42ad 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -324,6 +324,11 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 
 // PRISCV
 
+register!(NV_PRISCV_RISCV_CPUCTL @ PFalconBase[0x00001388] {
+    7:7     active_stat as bool;
+    0:0     halted as bool;
+});
+
 register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalconBase[0x00001668] {
     0:0     valid as bool;
     4:4     core_select as bool => PeregrineCoreSelect;
-- 
2.50.1

