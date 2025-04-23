Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8B7A99BB8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 00:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DA810E6FC;
	Wed, 23 Apr 2025 22:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A+KKvdaV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC8C10E423;
 Wed, 23 Apr 2025 22:54:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3bsYi49UQXRGl2pF4xuW4giabjDtA9t9UB9hvHAJnbU4WLhP3zYZxYIqVlJfaRAvO9Mu7USU+GlsDOZr8/21371sZNAVhmehukszzmdY11YdMCQL9OEnv/0oGb/4MuPx27einBhiWOKYp4OgtbozfgO5iXGGEnUr5cI3kxPL8WCqriJydPcwcocJGhJKwVTtojKUutEd4Tf0p2MBniGMWTE15PJzwcMQEqYN4ZzE6BwAiEGi81Yb2IFiPSw7+itrVr6RqzxHkOMW/xTtAs29DTdXabO2/LhZQuJeBLxrKFY6a0Mk75MdmbyKZcNDAg4NSBSe2t+78J1xDKFFNK4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y994U7+TcIAKV9fxjMdP/rqenZcngHwAXEJkiwjNgmU=;
 b=mtsnSWtYdCPATeMG28k5nSbD1CzRKf1NoZCaPONynPlJIkM3OZECTJe0r7pi80S0g+/psfkjT8XewayhEKxgWmE6Ah5GB2qxc/G3SYoMwoJ9RfGfyGZQeJbbgFfOn1gluFspYEqJltpueGUBVpfL8wuEuSAOdnGSmBV0F41b+bSh5cj3ygLxWRgbCLPWg+qmSdhggipG8LWnhEB7dksP5LHH83+DQTVcUWg6Awl8n1akTYUp6IPp7gT7FY0pJER+mgPGyR7uNB1lA1qyyFao62+XVt1tnDrjvq6r5qgp6BUUFEy12FShgmCBRe7eQ6nyAcpeuZSMuVRx4FSbJb1xvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y994U7+TcIAKV9fxjMdP/rqenZcngHwAXEJkiwjNgmU=;
 b=A+KKvdaVTDTJbdFc0ncm8AGeLsAK0IJE/5cXqkV9MoT28uIgAJ5yViZe5nPK8iFzYritCU3swmwrG/YI4OG15LY9qiaUE8zwzMMte+D1Do7LhzP2uUGeNEFUDHR+fvfkzunN6QVvYJSXh7G0SFVl7scg4rjuq2o9gJULAR0wtNQ/5p/u0+HN0Es7HWiyjPUTqgpRw3FwwWDbbP0V9TKeId436SFHLDX0+JSNHbyN/WpmsBtUVmiD/qo6StR+O/SxdOFZihBh+0rFEYmOFvK33HNfjp145hZzmIlW+wUZgSUbqN2U7C5MxjBCsltyDkVN0mVhQIPEyJhmsbdibYtwiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Wed, 23 Apr
 2025 22:54:28 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 22:54:28 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH 5/6] gpu: nova-core: Clarify fields in FalconAppifHdrV1
Date: Wed, 23 Apr 2025 18:54:01 -0400
Message-ID: <20250423225405.139613-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423225405.139613-1-joelagnelf@nvidia.com>
References: <20250423225405.139613-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:408:ff::11) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: efb3dd48-6f67-4967-62d0-08dd82b9cd98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yx56Xg0xnEuZVMgDpAWIryQhz7qGtmW3fDQ8pK6xWZ0udm3Kt6o47zC4s3xK?=
 =?us-ascii?Q?oAV1AffrzxoTAG5yd78gueGhK2DkfAuNPTsjqNqbtd+wSUpQ0cF/GUDN0Hzg?=
 =?us-ascii?Q?g0I6IHyPvzm3JHs9HrfcVCiCDDmUZpc9HizaHASIflnQ+utxbwzFcBwjLYlt?=
 =?us-ascii?Q?rvIDjLxTw+2noD55OrpW5vjYrX2EdxJeSp6tXUZ/6VLpBKCQrWlr8xF/aJWx?=
 =?us-ascii?Q?YuhsHmE2LLY94xdtL3WxGDPkGw1kNMNFRwccnCxPhGsGV+Xs6NoDxCYJeqdL?=
 =?us-ascii?Q?krxNIAK+fwFUgi/2lIsKxHIS0HCiLllMTNHL1dM3e8Bvm1759x2dZ48FoWtc?=
 =?us-ascii?Q?KN3r5vTWy1t70AP+cDVNFBITWxdG7jug9V+V/ci2jw3fYU2N5JYKQyumpL/s?=
 =?us-ascii?Q?xyujxrET8OWhvH7o9I3FgsuQZ9F0qxGAA9UgtQrpGg9fsWwuero812d3yZkF?=
 =?us-ascii?Q?l4J43f0BLgcMciob+JPbN3rYEAuPyLUpgM+brtJ6QHCD7NSkiZ3iMMJ0Aox/?=
 =?us-ascii?Q?NUIjTbOLW0u0bMXUUjEv5juCGo0HKZSmBE4/CnuO8qGVp/S8uE34yrQEnKB6?=
 =?us-ascii?Q?7WOMZAZ6945M5cCMnbq01xoXDbm4zHDT4d6zcC9HAiYVPRjZYEX5cGDMP5Mq?=
 =?us-ascii?Q?HJSEHCokajnwxQdY7UP5cSgxZNSCB0B42pNkLS8CHxqXuy8nwSeJDiQJeSTf?=
 =?us-ascii?Q?MtVpLItXfchEtBB7fMWrlGn6DH9Do5qc1VbHnw2ikCRYu5kN8Scpc+kYm9Mj?=
 =?us-ascii?Q?u2FR9+QctGtWgz6jEzEJpElKjJR57gKRcOWEisW1uGCuBSOBgaw1crEk82Zj?=
 =?us-ascii?Q?tnelQNoe/DzYtPRiyqNSEa5PWb+tqc/nI/wCGE3DKTIigm7rXq4aBaVk/yo3?=
 =?us-ascii?Q?w8xOi8i1+Uku3jO0fj0wbjjWUA0YCTMdFnkBRw/TvqIP8GKN9ztDyEcsjHO/?=
 =?us-ascii?Q?0KONQkC2/XIB1tAB1HECju7uCK0+pEYew1qpOURQLWR8eA0xYkCu3HY8jZNC?=
 =?us-ascii?Q?b1J8o8Re33cQjJYikCPDnP6ssqUUhaFpF/hOTix/dxmqqr/oW8GNdNyCo9TC?=
 =?us-ascii?Q?FvwjcDtFXReRSBTmRhu6HYVDT7V7Wqhqze+Ye5aYHDTeTicNPF+Sn3yU3+md?=
 =?us-ascii?Q?J4tMY7mEeSFNFg9Z0aUQoa9kt37wRVAK83+deFXj54yvFTQXm/81GLcxwAMN?=
 =?us-ascii?Q?LprAK9SEj0cYRTqHdCD6d1aieMO3gq8Lbrh1e3k8vg9RVTqGvGub+8Cs2icq?=
 =?us-ascii?Q?HM2suMnIA9JJXOj5woeBujLanEtmMF9lypE+TDJJNO3OkBsd2a3RYdBY3yAh?=
 =?us-ascii?Q?5tfUoKs/ttaNc4aniSec5rk+AJaDEfxMf/FQuXj6r2FMrLci9Uf9YvifPVrq?=
 =?us-ascii?Q?cfXrdIZ+4QrflL5nKuxvnaQ6Sr1BgmGsoCxRtL0+l7yTfeNA7X7KetO/ag7Z?=
 =?us-ascii?Q?SrvmxjK/ct0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?owXf0XnL3zKqnV6GSFXz+y94bkcjxYJpIRd1KOKYyIhdJ4gBYXorI1CLyUNP?=
 =?us-ascii?Q?VsVTNUAU9irIgNdRL8HGk+BUMWUX8e3Mo/DYCgod6IW3r1b/mUaFnkU1/qhw?=
 =?us-ascii?Q?YYChrlcdx0UFNZjzoPEkD5yijxkYVxvDoSz+oQYYLT/1Uky+4hsmNJLwuUad?=
 =?us-ascii?Q?S94PXjWh8MhZzfoUI19k3wjFUDoc+2CjQujn6imgqwRP2t4Gi95O+DlqQzZQ?=
 =?us-ascii?Q?z8xmHi0x8h691VHBW/3i2GQRgZ6QYV0lwN7BvhUxItzjKRZfsHGC48noGLJl?=
 =?us-ascii?Q?v5S/CY438QY6lSSwmKj+nWTquZp1upHr8ZScluT5RQ9DmZ/zB4LZRh3YGB3V?=
 =?us-ascii?Q?8cNVNuUBXW0eBzA0HKtAi+Hsian620S60tkTxHwLXJDNbYgKEvll9EVP0OJ0?=
 =?us-ascii?Q?F1lYeCAO04xo5K86/Gro3hpL+4VgqTZIa9VihSoOYUvkUQiws1Bg+W+pgFwQ?=
 =?us-ascii?Q?cLh6ptbRt9EnaAfdshxc8/6YBtHXFxt7xAWFQSjUNUAJUP3Sk3eQVS6Ti0AN?=
 =?us-ascii?Q?Ke8ER+cwIbgl1TYowcrVc6XxiDLsfdbOU7icZh7wqk7G13l+8bVVEnwfqDq/?=
 =?us-ascii?Q?9ZVy3TqgSbPPoHCGjGbVp/nh/UvY5l6WX000rkrbpxHHFXJcHiwBpXXZ8K7r?=
 =?us-ascii?Q?nOZjA8LOt0FXBxBv4LUn27lpgGETl6AcrNwtvsWMqGy6Gb7c/PK2lGyaYF7o?=
 =?us-ascii?Q?fECqSzB/5NIUmhXxlzd3QumyvGbOjz8JisBBWajYFLppadXIIIOO8aFOW0hl?=
 =?us-ascii?Q?7+D2LYogSB/UcQhVdnpgFcbopdyYBQmscSn2ihYtjp8QpqCgAb5aeVcBH1Tj?=
 =?us-ascii?Q?FsFzsJ+8FlrQotfu45J1DJ6EuR4mdG9mU1tXn/dRFNG0aEdJ1KTYJWPXn4Ea?=
 =?us-ascii?Q?vzxbYs2VPjnUubhLI3/xAm0AtWmZvHHhXT2AbcHp/+98nF5Es4x7GUWwQqjv?=
 =?us-ascii?Q?1rwUE+U9SyH6Q7dEwcoTAyxRHxsymJg903Nd4leHy8xDRyRn9w9oH5EMUWXh?=
 =?us-ascii?Q?mjdUttGEgTbwhB5+6J1wjpzkSN6CkyU06cHNJpZKOzpBcNiGmr9rycBEWUvy?=
 =?us-ascii?Q?Rvbw/kzvW/x1Y/Aod0/zttmJTUNL9QaLL0a0gltrswxin+KhuVFnlZ+nyHyU?=
 =?us-ascii?Q?iuKMJPUN7CpUa4pdtQXXGtDulG+VwFv3ANEJslGYUgof1iDDw1k86BAZVS1f?=
 =?us-ascii?Q?9h/i7LM/pfayKWotre7sK8AImQ3AvUwVcZdBANuinV/Kg3hde420SbHPW1lA?=
 =?us-ascii?Q?FY+BXjWgcHviqeZcnsoHrU24v4FkvBdhdEdBV2wApZPAn5zUKJqdQYWJTc/f?=
 =?us-ascii?Q?26ypDzj3YKBY/gXf20G6q/Nl0GKEIDjdrXZrfDwiHHAlwwdD533l9aR8iS5R?=
 =?us-ascii?Q?1hNelsNpU38IVAD3RpFk0Et2OD6GwlaccWM8Z5cavQ52h8hZpWbP+8tR5WrD?=
 =?us-ascii?Q?pochjIsUn3pWvEb8ZInVWADWz1NyeTI6vopKZvBbOrOthjUVR67Pkb9UMA6P?=
 =?us-ascii?Q?TiphiDmvSjKen6X+qWDnOnBP2iF5DUtXM0+Yzgfa5gh9t9fqldybDhMpFqKt?=
 =?us-ascii?Q?qqyqA3IuQRjzKKLzvUoZ4UItLMlo6a80rQ4iahvE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb3dd48-6f67-4967-62d0-08dd82b9cd98
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 22:54:28.7644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F28RgFymL/SgAuysnwVVWr4Za4+95ZmJwfd3Ct912JUiLdBpj+aZwgJAkUslJxMwqG8tBZeh3dt/7hlzPNF2GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841
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

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec.rs | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 664319d1d31c..79c21db9d89d 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -29,11 +29,14 @@
 
 #[repr(C)]
 #[derive(Debug)]
+
+/// The header of the Application Interface table, used
+/// to locate the DMEMMAPPER section in the DMEM (see fwsec.rst).
 struct FalconAppifHdrV1 {
-    ver: u8,
-    hdr: u8,
-    len: u8,
-    cnt: u8,
+    version: u8,
+    header_size: u8,
+    entry_size: u8,
+    entry_count: u8,
 }
 // SAFETY: any byte sequence is valid for this struct.
 unsafe impl FromBytes for FalconAppifHdrV1 {}
@@ -169,14 +172,14 @@ fn patch_command(fw: &mut DmaObject, v3_desc: &FalconUCodeDescV3, cmd: FwsecComm
     let hdr_offset = (v3_desc.imem_load_size + v3_desc.interface_offset) as usize;
     let hdr: &FalconAppifHdrV1 = unsafe { transmute(fw, hdr_offset) }?;
 
-    if hdr.ver != 1 {
+    if hdr.version != 1 {
         return Err(EINVAL);
     }
 
     // Find the DMEM mapper section in the firmware.
-    for i in 0..hdr.cnt as usize {
+    for i in 0..hdr.entry_count as usize {
         let app: &FalconAppifV1 =
-            unsafe { transmute(fw, hdr_offset + hdr.hdr as usize + i * hdr.len as usize) }?;
+            unsafe { transmute(fw, hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize) }?;
 
         if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
             continue;
-- 
2.43.0

