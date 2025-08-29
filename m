Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8F0B3C1C9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBCC10E230;
	Fri, 29 Aug 2025 17:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wz5qmlQB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CF010E1CD;
 Fri, 29 Aug 2025 17:33:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8VmpBncJhcS39XVlC9MqS9tkmOkmQfxIbdnytc+MX5NdLxO95ci8tWH7LXmqTcdxUfqbM2ppwsLrqGeIB14R9E/VgrYcWgn1S6SClUjlkZNEdlyeo+aECziaT7OjeBGimSyTYWDMasVnjqumeNqLELdJETHBZp2lWyQ9gHAQOaVKgsArMz8RxPYBu2bTswOauzh2RtA7EM3jpB60PNw8hchv1MXemdu26vX7ouYe4mViJdMpIE3qbqwkGX1Z0oCdFqQrc7X0azhp7/WyC3J6DgJqlkqsWMXzVu8YvPw4YZXMJA0owlPM6q9rxpcDzi8fMhy9dCRaVgtW2vvQQIMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1anHuG72/wRByIvWt+Hqm0klR9dtR5fpGMf4S6qQYzk=;
 b=VuQJCGmQ38E2r9ZFLo4N4VeNHlQxGoqV+kj71qkk1AcoViSbxegPXxo8aKW/p35Tw2cxsoeLGAFJHMgz9Wgin6d1kgpB0I2PIjSY2gjuV8fetGLfa7vEtkNvbIvm1dLH0/HhB1Ol8Hjr1xZV9ue7DwiL26MjMjcjqct82DPpkKlMEN4acGG3AVzPw7msQ8YsG1soDpTivzK3mwa8Ng3A0Rz3QexzXNzR4AD7aAJHHw9GGECwjUoA+N0t9OJelyIAj+GB/7GweUgch9mUN0vgx98QgdRKCnB2iZHxUWSnVlPEQom986hzYuQ8LVI50f6FLKFoMg2mddjY8DR1i1hwaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1anHuG72/wRByIvWt+Hqm0klR9dtR5fpGMf4S6qQYzk=;
 b=Wz5qmlQBLf/B2gHWVghzx43nq4vFyOMV/umf2UU+t1jh9VF6PWS+7GaK2/JTSPPBw5G6h0vyL9uSZPhlHDO+5aaFCuPHfmuJgTs2hmGkgiCFRNlxyHxjvuBg/QBCdmmSF35xpZrdooHn+rtxiT966ZJ1eVXWs8fvUdGNZGvj+zzyLG6fsBNzKLrq+v+DmTMDJA+hQ7uBM8b9mCAA7RqGGIVDNu8LI2Y3P+G8oF8ZhHMM1dfJDULlu09ILwYu8xlobyvuSvce637chaQ1cDVkrACl5cBJhgXweMPC8OxoyLoKAaRDyHiGeFgHNsVCIHwsd1sSjBUdm4uVskYtaycSPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Fri, 29 Aug
 2025 17:33:15 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:15 +0000
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
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: [PATCH 04/17] nova-core: falcon: Move dma_reset functionality into
 helper
Date: Fri, 29 Aug 2025 13:32:41 -0400
Message-Id: <20250829173254.2068763-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829173254.2068763-1-joelagnelf@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0214.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f5900f9-6195-49b4-4563-08dde7222290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nnZYqqKBYb/LTprW18Bc25gMfk6FaP/tTdh+oPhjzGmOawURU9umpZR7z1l/?=
 =?us-ascii?Q?b61LEmmkHapdC2FGXPz8EdIUwpZ9maGhB/j5HTJZMPukPyuEZZJgWxY/RYuA?=
 =?us-ascii?Q?YUAFo3JOlWc+BEVpKPe+CoMOSRQ/iiUts5kXrVr6zBFZTJ/NR6GdQt4idm4l?=
 =?us-ascii?Q?EW0yc/SRFrmFYIW8gJMOdZNJ3oj4rWwqqZAqNqpdhY2wkf2kkvniU0dMx6kW?=
 =?us-ascii?Q?H+fzonNIQwDH2l8O1SNWsN/RGGUmgnt4bT/yVkqXsb1yNxDkcyVy414NhHFl?=
 =?us-ascii?Q?nKav9dVbDwwTRwvid/Tsf5wlS9hr+sUV8+waVN/cDMQruIQSE69tP2e2UFPZ?=
 =?us-ascii?Q?F4X11SKSoH5ZHjwzH/6qnqs7HUAaU9ytfUWunJrk0UUljZ97PhFSyLZ0kYyT?=
 =?us-ascii?Q?qMm5goOjcjnCYwFNim0VgF2Xd81mjZ9re0MutZYej3cZDxP+AMagtl8deGAA?=
 =?us-ascii?Q?2nLieQ+ifvlv5ELhUZ6rlgTyIgSzafQq9NVVcFcy1yQo5Ly2EdqGOosv64KA?=
 =?us-ascii?Q?TIA2906LesT/ETbAvZNt4k895zzVY9iA1416UCmsRm1Pi+idpjB+8GiB7IPn?=
 =?us-ascii?Q?9reo1bjT2mLVpgSk9VTuRxGZspDV9zeakmzqRUxHfkJ9is639HifY/ycx7bn?=
 =?us-ascii?Q?A+YwhqN2jJQ2bvxYWvy5xE3kXEDjvfp4iFBUqtve4H5Y5eQtTTdYXpsEXqGP?=
 =?us-ascii?Q?gVHeN6RndYFHMkdqpCN4A/qT1K8anysvkkmkDj68/DF6HqygUSCpx7jwQ8fP?=
 =?us-ascii?Q?V87mW4TBao/AZ1iI+CnA+m0N35O9FAbesXpctmQYPLicpIwJaagOniloTk1D?=
 =?us-ascii?Q?RetNbIlTsCLpkQJXb6xMyjLOTToCIhh7I2Pk9ZP8WG1du5bc0RweIXZ3/Csp?=
 =?us-ascii?Q?QJ9CA8vBJEXzjb0iZde8a52eKvKtUKxS/h9sT8wgfzjTAR4KbjJtEpcjts3n?=
 =?us-ascii?Q?kcaCBfU6JY2NIDeyH2M3Ev+o3XP/5/C05bMBJkSWKA2XEfe4NB5jy5aDgRIn?=
 =?us-ascii?Q?IDpT3E0yJ+N2NyjiB0/2OYZY0CBVWBwYFqyVG4cwtLtDkaKptW923CTveaNu?=
 =?us-ascii?Q?Yvn/TioL5XcIB6adxKqVkt+U26nQnNJ2mALQWXDPX5sjpCVyA6D99O52PGFB?=
 =?us-ascii?Q?N65vx9AwAhjEac8wMRUcwhKeX4qJtpiq3+uZUKDT6cPnKNfc9S0lEmtGO3Qa?=
 =?us-ascii?Q?g5IwH6UvGvWrqQ0DdpY9HO9eOItAiR6fXocXvz1QJLXVbxkqM9D1+0si/Lvs?=
 =?us-ascii?Q?N3/n9ZbP60sJmvC5hJ8BFXPmTVPI9ZG2lWwAuZPZv7JGXDuhPhg35nQENSwj?=
 =?us-ascii?Q?/09tq24wIwXTMFynQCFTcMO65D9GcTsbGxIHgfynFhb1Ro8ugMrjTWlv2HYH?=
 =?us-ascii?Q?vn6dkhMgRl1ySg8eWLW9DlEUGMSCdjKvb6lVHJ94dktrDtRdH9KTdfxscrYd?=
 =?us-ascii?Q?8YJHylrw+6o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2f8zbpRzlsEb7F6EjLe/C0w4N6zR4Lia5SXCg4UPbG9OeLr3VHEXkZ+/YvRn?=
 =?us-ascii?Q?00DC2zY3BOAsS9YSx6I70FxtBPAu2vawqw31x34abUC7VSIwVi+gCSjs0uf9?=
 =?us-ascii?Q?RrZc9D5mZVAC/0Se7evo1zb5Z6qigKoVI/HcUjnwsfPynR14dnCdy1hkdFqv?=
 =?us-ascii?Q?pZvfmphmiqVAE9ITlXqvUA+TX7A+1XyN7TELjC6lGAzjsaV1qMcwez4/uEsa?=
 =?us-ascii?Q?+xComkKfM8DumWCpyhv7wqIGawRAou7Ap4BgiEdZFjoSkFDZJLAn9QGZWbFI?=
 =?us-ascii?Q?bby+Ht9WJUTrD66b1s5k3/QqNCSB1aJ1UGMIqT+2O+OYJMloJWBJ/7LabVul?=
 =?us-ascii?Q?gnX8BWVJ/8H+mV6A+C6eLBr4pNUKWoGh2eL2Q+6teT+hWXaHQNhmGKNYxrzl?=
 =?us-ascii?Q?sItKYDhBvb2ltjHZ8rJMouB8IuKFaMeRiqjuIhHP70iCfBzoGIpw4jfLi0yt?=
 =?us-ascii?Q?KpDqMFxyEGqCkry5xwNWB8buUhg0sEkTqk/EPwWBfjvFKy8yn4olj4ho+JAj?=
 =?us-ascii?Q?N2agQ7lOIzd7/UwXEFtmxrPPS+Oo9kTw3tRnllVGPKm+kPHCMhOouJuvDiiH?=
 =?us-ascii?Q?sVqqfZ7T5jsj64hENplhnbaawOYr/IF2jCcTFzB6gf62qeCs3dvS5a/XHZ1I?=
 =?us-ascii?Q?De8wWrTCyNc/+LQ3ELnKc36bvn6CVF7UzcmpXvuBINckaTeq9Juov8tvLKSX?=
 =?us-ascii?Q?OwWTUNx2KS5Pkhjpb9bEgpozDl0m9I+2pfzX6wJ2cN+fRUPWtzK/RqxR4ttu?=
 =?us-ascii?Q?Vu6bx136fOAEpo3XbTIeh3nHX1lplqiRSKbqDK52QjM6gcxkJiJRY/1I5Ap2?=
 =?us-ascii?Q?PHEf97xqmYGnpEsD2ln4EeYAGLoBFUQ09qK4bEBy8vy598GAVzTdoxgh6/SE?=
 =?us-ascii?Q?NfJ2qDLqXHZHxLWAV5mSV5Vu9WIEOiIDzNd3bzHg8gR2BgpkdneEZ3hmAN4C?=
 =?us-ascii?Q?wWS6N3vzzxy3WhZR3M5Di6xJXg5LQC1bu5CWj0jpsZA4Jh04jJYQ9uY56FIu?=
 =?us-ascii?Q?MyMJ3S8xEmKPEXKUSJL0P3VJP0JZKIwYRdh+3V6gv6N7EuwL+0PXUkjtNKBJ?=
 =?us-ascii?Q?xV131Gr8qpz+RaEtkovbNF/N1V1NCFJvjW/QE01T7Firo8Xb1OoAz7hMCSa0?=
 =?us-ascii?Q?Lw9ZhYKzxQUNVsi4ffiy3593ju4YEXyxGqILBOfqylANYq3E33JBlkPjwzEs?=
 =?us-ascii?Q?bWl+REDq9gD8NsmCYH0DARSsntyk9/HVyJi1AihiWmbs+l0w2CKQ6VUzbPlQ?=
 =?us-ascii?Q?NRxKTJk6s1DQ08ZDzeYOEAulCVSa5TOK9hgd0wRg/V/+fD8nvNLZH6XT25Nc?=
 =?us-ascii?Q?q7dlwMPqig/HsTCrFtVOnp74GfoBOrBgJtPbBttwSAtzK/oT72B2QvLnQmPV?=
 =?us-ascii?Q?E60JsqLg/JCaDDXmykz56L4a6xL+PdlxYT+Nmn7PTmlUAc0ADGpTxVVjVdir?=
 =?us-ascii?Q?HfIOaL6ejXemQEoOUuk+/jfscnPzRA/LwlHHxVm1KY8tPFLwZ3rJalQYT2gp?=
 =?us-ascii?Q?ejUd6RDhqsARK5zDJ6mIrBknmU65XE8DzgUq29REHF9eLJVdtGvMk4VMzCs+?=
 =?us-ascii?Q?VXrQlESYtoGfSR3M7BLzQp0AhLAAKFIHL8dIumV8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5900f9-6195-49b4-4563-08dde7222290
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:15.2431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8C6ewTAVpCVK0/S5kXeyojJ+eCH60OgIU5QX9erpK1NCZ122J7nabw97b5olbA8LWLUk9l+9AJ1CV1EOM0DH9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017
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

Move dma_reset so we can use it for the upcoming sequencer
functionality.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 054be6c094ba..7fbf909cae08 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -377,6 +377,12 @@ pub(crate) fn new(
         })
     }
 
+    /// Reset DMA-related registers.
+    pub(crate) fn dma_reset(&self, bar: &Bar0) {
+        regs::NV_PFALCON_FBIF_CTL::alter(bar, &E::ID, |v| v.set_allow_phys_no_ctx(true));
+        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+    }
+
     /// Wait for memory scrubbing to complete.
     fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
         // TIMEOUT: memory scrubbing should complete in less than 20ms.
@@ -527,8 +533,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
     pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
-        regs::NV_PFALCON_FBIF_CTL::alter(bar, &E::ID, |v| v.set_allow_phys_no_ctx(true));
-        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+        self.dma_reset(bar);
         regs::NV_PFALCON_FBIF_TRANSCFG::alter(bar, &E::ID, 0, |v| {
             v.set_target(FalconFbifTarget::CoherentSysmem)
                 .set_mem_type(FalconFbifMemType::Physical)
-- 
2.34.1

