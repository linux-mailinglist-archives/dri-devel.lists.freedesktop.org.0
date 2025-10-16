Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28273BE4167
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 17:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE4B10EA21;
	Thu, 16 Oct 2025 15:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KHGo8NYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012027.outbound.protection.outlook.com [52.101.53.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEB910EA02;
 Thu, 16 Oct 2025 15:02:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Re/gcK7+KedRJfvQ0y7N8CLJa5a1aQdkTGTuctn8qKUS37MRLsW6s57T8NEGyw06AUSOQXAkK5yZgRwaQJTYz34aQdPOtTV24tk5eUfJHSaLCcAeV35xuHQcvJ2+RVr2FkXvNIUrEKWmyOa9p4udT92+UOrGLWHNRXfHm/YE/DDeYQoLjvEwSoXpS5dsaoLkCEMx+mtY+g/O0zoewDpGnvgoGMya2HQjrBFdLL5ood0HaBOa8cZbJwfVK3ogniu0PtDRcgNvwO6P6RCI8HLUxKNyqOBfTDh0B8+MEmS3dBBkjAw/YcWW8ho5dfMwrYKfQyMB9vpOQmVgIsclyhnw2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwe+dIK5Pcgh90I58kjFySD2eZyBAH3kwiso7QikAHI=;
 b=yE5w0oLw1/3celfPjzTdCdFIvm5GKloyT/Xlng+oAfjUDxOPoaBCicFTJ6S0ySgiJje+Il5HRfj+iik/OgMNzOZKH6CwSkGrC66YClGbztalUC1dlmZZ5nsr+2IL+U80oHk3Cyhl+S3gi2u54XGtpjp69z60HAgtdayZXvS6jsYDXx14kKHcfdKsLTLk3SfizjhWgX+8y6uHSFhHg3cehnZ5Ws2XCWgDNVgvCwWg5EVB+i768SSB366y8q3HAjpxOGD13RTio/9TkHt7cbDtC3TgQ0fwzO23lF3jG06vibN1V9hCZ9l4klB4YdbXwaF51RDKYKDP0wBUTdNAtaXSWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwe+dIK5Pcgh90I58kjFySD2eZyBAH3kwiso7QikAHI=;
 b=KHGo8NYe1wjbLKs9SXLWWQmPfzFVMon2gwNBiq+sX2iPx+qrbyVgmRMroR2hB9/UT9+rmljlFIRmgCJRHnK4v1cwUYXp8TuPrGI5nasG7nglGLMt7gtCs7qUquxYg0TCKtNTcL+F7nI6tTeQOuem5tDvf7gx7KpcQWog8YlxwYCZm32gFbyXez8j5Tka1jvtsxDBh6K1+E4aaloQ0Hzg0KzJzknbOlUS2rwcDX1sP2L5DJRxBX1r+sxyQ0Jprg3EznD1A362atW5ui2Tn/YYVnvuz7nQInt/cGmmwN/nUUh9hAEdek3JcTWsapn7aR8P3TPlwz+F4aaBhxy6WZULww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL3PR12MB6380.namprd12.prod.outlook.com (2603:10b6:208:38d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 15:02:20 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 15:02:20 +0000
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
 nouveau@lists.freedesktop.org
Subject: [PATCH v7 1/4] gpu: nova-core: register: use field type for Into
 implementation
Date: Thu, 16 Oct 2025 11:02:01 -0400
Message-Id: <20251016150204.1189641-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016150204.1189641-1-joelagnelf@nvidia.com>
References: <20251016150204.1189641-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0017.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::22) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL3PR12MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 080ea939-cdfa-4970-fbe7-08de0cc50142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FSeAGnVzg/dLsw8L98r1J+6bLxb19ydCCnddFIlNwuHcbaAfjkVf12g37WPo?=
 =?us-ascii?Q?xGMMCgD2c2FphHfqf2xQ2cOJvzCZ6/oNejKXMh5Pzv1Z5McJulM1EjjncvsK?=
 =?us-ascii?Q?dw2//mz0vcpIBEvWMKc/ZGEGacaMYKKnilRtRscuVL1CeXzrN4pvkLCaUd08?=
 =?us-ascii?Q?0XJGM8LLV6EbaL2PEzUjsWU3M9BPYZ4bJheMrkvMYeFRtjxOait+GZVGBmmq?=
 =?us-ascii?Q?32jRdScXbKIZl10Yw8EwdjKC5daZA31wF7a30HGG3kKv6WKwLLKxD9uklAR7?=
 =?us-ascii?Q?R+MvJ/vkYKoRs9xOt95kotzFkJQIOkX10rnSPYNlrmAX1j3rZwwlVQVsq9ip?=
 =?us-ascii?Q?VB23EXZmTq3JjsFcSI1L+P5nRC0YCqcHNGb3tWn13ZGHXVLqwlnaPwz6bdPt?=
 =?us-ascii?Q?LXT7OTWEyTeOSpNUFGHTrhm5Fw0mT2PZ9UrokZ8HLHWsf6xM99PKKIzQRJwZ?=
 =?us-ascii?Q?k5JtQDxzJNLKDbgCzsHku0xQoDJslw/FCWX6GBebUtBsyrdZsY0ltBiocwN+?=
 =?us-ascii?Q?/DTWS/HYFFwObFT4qmxRT1HdieOBXUs36nB9o7gg7094GW5GjtnJD5PxDVGa?=
 =?us-ascii?Q?qnr3buYx7rX1yBTg7ititCiR4jin6bmr2DXLLMFrQ9RcPI9Pu1lhkGSrVToA?=
 =?us-ascii?Q?7XhsLxI8adJr321RQ6AHpp5AvnjHA1AWjwYtmAOXAOzLLDMnCy10u//pZ8iB?=
 =?us-ascii?Q?ZvOi/Vsw6D1I5OV1IUVv/3J/y6XZNmFo7IA3i3OnUrbbXQ6iUTygSnYD+gUM?=
 =?us-ascii?Q?0vbaC1kCbNRYdcj/WNDg21ZoWe18fv+9N+3z0S4hldnYu9iukrwTEOFzC4jw?=
 =?us-ascii?Q?Hmlnon/AjI93lR8hDjqPeRmzyJlA7cxTJ2KH4Z4AKZvNE88NiV3I82wATnGd?=
 =?us-ascii?Q?HcpKMOA5fzLQ+du4Gt5961YDwAi1fiFEs2pZE4wuFaG1qD8udEK1JrOgtqPK?=
 =?us-ascii?Q?KC9vj7K1m/nLSwk1ivoGSrENnSB4AU6KeNQtDRa03nYzhl6eU7iT2/yIb+nb?=
 =?us-ascii?Q?7FD8dyJmR/0PUrB5JMs7stYIPhcdu/U7it7kw6IXEQeSG3iv03/3kPrE9y2B?=
 =?us-ascii?Q?dusNvsqtc134XjPE+9kt1xeJDuVRoIGW+8RSDepN5ZKupmvAbIKpUCx9E4aW?=
 =?us-ascii?Q?KDqv5WUvCmQPshqxtduDhPEYzTFfN02Q87/s5nIzSf68a3M/aYrsoEW1dsvN?=
 =?us-ascii?Q?mYaVZzprbbcOnQ8iqZ/1swefgB6pjRrtt0WlxMhyvmpz+xKvNYFV95D2tR8j?=
 =?us-ascii?Q?QFgZ+UbDWALrRT56mfOhg0k4CFTAa7LeKbjjIRifMh7s1d0y18z7421syiud?=
 =?us-ascii?Q?bH6ZwPh2TmdSAy/18l+xkSSIrCDM6kSUxDOC/OwAEcCatRmTO/UJSgUlpCAE?=
 =?us-ascii?Q?DHetFBuXhbyGPdpFf4DnDjrp+fbCriDt5CvcWa/+5ltqad1JR6EQGJa7HfFZ?=
 =?us-ascii?Q?NkBlY8gePn12HNM9bMLoW6BptVimBuTf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QCDIx0CbVte2hBCFcHNl1aMnM6htzJ5QCyIFEZ4Alw471Ml1fnGhVeoGT3ys?=
 =?us-ascii?Q?HnmneHE+EG+X6MlaPoq50cavwMrXKBA+4Ctbtzwm2NA4CglmcT8yuuRPspbu?=
 =?us-ascii?Q?jds4qBDhbU7uMlKmTSMG7RGlbQJWU4qJUIZoKwbb/7Pa2OrYBR2sGuie5x8G?=
 =?us-ascii?Q?qoUkwyZ/yO3e3N8C15lrSRqBCzvRDJGi/v5uweYVW2QqC+YX2UZb/v/zv0n6?=
 =?us-ascii?Q?BRG6M/9MU7rc2l1WJUi/A0YNT01XU7H7XKabMELsRvul2q6rddF9jdvpnMgA?=
 =?us-ascii?Q?gnPxX3+Wb0b21DCsEWTT3Me4jQQwFkbMyfFItbCxpEamuecCREyCT3agOWYS?=
 =?us-ascii?Q?gimASIIwUdEJhXxyOLla2aD0syLTqvZIDPODv1tNm3pUSbGgQNbQIfTCbp4Q?=
 =?us-ascii?Q?Bnb2eDgm1wsAdMrjBIhUXKhi1QBKIPaktQluwqID2BDJBjZ0ybQYt9CpUR0m?=
 =?us-ascii?Q?GVFdQJ3tJFrrrztNX1hy7QHO3iPeOLclQozPA/om/CvlGK807aDKk+EDbA3Y?=
 =?us-ascii?Q?M76RQJBJxxC5bVK8TrqYxVboU4by+AoRwu4hq0lIqw60xwOxhN/a3ri5d+FK?=
 =?us-ascii?Q?w9vKZVITR2719sAdTIpo7XaZ1FnhR3sAW/c4ZcFDysDhmecfOJGIF9e03Jv+?=
 =?us-ascii?Q?6Ob2loQe3IC51jA71GZju2RiRH4pL+3/ycEGflF0QnFsZL3YgSMe+89ofvpJ?=
 =?us-ascii?Q?vpWdzRwiQVa54YY0azJRNXAP5wZpJ5wRmpqR1sFDYceHgl30W1E9pRisGUbe?=
 =?us-ascii?Q?abUq0g52m/7JhdBOZF1/D4cSzVYbSYmUE2OTkSQvwm8uykjudRKRP4k7in3E?=
 =?us-ascii?Q?To5Lqtk9IBAo7kKUzYvg5fPWNTtH6us2YnhD/qghzriDJ5z9EKratA9Awxrw?=
 =?us-ascii?Q?RiPdD6S3PU9t9isrKFE/Imt4WzQhgXYjWGNoK/HfECPRq4dkO8nZoFgnCUiK?=
 =?us-ascii?Q?aGXD730uSu4qFQE76NzxdtU11reql3sB1dSFGxyoCCqMoPwrptvu+7rFd1+/?=
 =?us-ascii?Q?kEjWvHhf9F6W3BsWIV+8hRDVl8Q6rMErtPO2Cm+efCJcO7qEfAOcWmilDQpP?=
 =?us-ascii?Q?nV/80FTua90coh6fCvj3BI8/e4OAlm2mki3hl2J4LbNin+Ydhu3Ad+VW3eye?=
 =?us-ascii?Q?swjuDRYMBZDAywJMUSmO/jRvu6SYjX8mBFtBVyYyxfria4Kc6JQI2GdSh4Af?=
 =?us-ascii?Q?OIQPFr8d2IEfBago4vnIGtOF5Ts6sK13iTXidbqxGLZwIy1N4HESXV2wd5C2?=
 =?us-ascii?Q?ttDi17StKMKGgwFBC9SVcICY2VUo0GSJqJmjIkgfZrEOG8Y9EWNLH2cHVZB5?=
 =?us-ascii?Q?pWqiVI58O55GWY3FsQfmOGrgBZUdAKJBA2aVZvsczCWHEjuvysSUyeL35yhB?=
 =?us-ascii?Q?SJ/R0LbTaduBNpgvkIcnTGvp6r2lJ89O2oYYs519n2JkfWnPkhy0U7MIRoXX?=
 =?us-ascii?Q?KHE+v/p4gEX2i8gFCArcWosuWgD+1mxdth2vrcqIlosShciIBuZXddrbLxAx?=
 =?us-ascii?Q?qMJwd9rHrd9RX3HMl9qOXEEh4Y20U6dlaRqOXyw9G+M1jUSpKAT1fHsTDHzL?=
 =?us-ascii?Q?KaBL41+rPQd2uyrlbJu9BgcJB2fvqMY88lUw18zJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 080ea939-cdfa-4970-fbe7-08de0cc50142
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:02:20.3834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWw4whjDuWLXBKiZygOvZfKM3GeF5WschcBOjBG6NciZp55MzSDyL5PHho6HA+Et0Ib1oyp7oDpxbG1IpUUFjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6380
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

From: Alexandre Courbot <acourbot@nvidia.com>

The getter method of a field works with the field type, but its setter
expects the type of the register. This leads to an asymmetry in the
From/Into implementations required for a field with a dedicated type.
For instance, a field declared as

    pub struct ControlReg(u32) {
        3:0 mode as u8 ?=> Mode;
        ...
    }

currently requires the following implementations:

    impl TryFrom<u8> for Mode {
      ...
    }

    impl From<Mode> for u32 {
      ...
    }

Change this so the `From<Mode>` now needs to be implemented for `u8`,
i.e. the primitive type of the field. This is more consistent, and will
become a requirement once we start using the TryFrom/Into derive macros
to implement these automatically.

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs      | 38 ++++++++++++++++++++--------
 drivers/gpu/nova-core/regs/macros.rs | 10 ++++----
 2 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 37e6298195e4..3f505b870601 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -22,11 +22,11 @@
 pub(crate) mod sec2;
 
 // TODO[FPRI]: Replace with `ToPrimitive`.
-macro_rules! impl_from_enum_to_u32 {
+macro_rules! impl_from_enum_to_u8 {
     ($enum_type:ty) => {
-        impl From<$enum_type> for u32 {
+        impl From<$enum_type> for u8 {
             fn from(value: $enum_type) -> Self {
-                value as u32
+                value as u8
             }
         }
     };
@@ -46,7 +46,7 @@ pub(crate) enum FalconCoreRev {
     Rev6 = 6,
     Rev7 = 7,
 }
-impl_from_enum_to_u32!(FalconCoreRev);
+impl_from_enum_to_u8!(FalconCoreRev);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconCoreRev {
@@ -81,7 +81,7 @@ pub(crate) enum FalconCoreRevSubversion {
     Subversion2 = 2,
     Subversion3 = 3,
 }
-impl_from_enum_to_u32!(FalconCoreRevSubversion);
+impl_from_enum_to_u8!(FalconCoreRevSubversion);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconCoreRevSubversion {
@@ -125,7 +125,7 @@ pub(crate) enum FalconSecurityModel {
     /// Also known as High-Secure, Privilege Level 3 or PL3.
     Heavy = 3,
 }
-impl_from_enum_to_u32!(FalconSecurityModel);
+impl_from_enum_to_u8!(FalconSecurityModel);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconSecurityModel {
@@ -157,7 +157,7 @@ pub(crate) enum FalconModSelAlgo {
     #[default]
     Rsa3k = 1,
 }
-impl_from_enum_to_u32!(FalconModSelAlgo);
+impl_from_enum_to_u8!(FalconModSelAlgo);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconModSelAlgo {
@@ -179,7 +179,7 @@ pub(crate) enum DmaTrfCmdSize {
     #[default]
     Size256B = 0x6,
 }
-impl_from_enum_to_u32!(DmaTrfCmdSize);
+impl_from_enum_to_u8!(DmaTrfCmdSize);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for DmaTrfCmdSize {
@@ -202,7 +202,6 @@ pub(crate) enum PeregrineCoreSelect {
     /// RISC-V core is active.
     Riscv = 1,
 }
-impl_from_enum_to_u32!(PeregrineCoreSelect);
 
 impl From<bool> for PeregrineCoreSelect {
     fn from(value: bool) -> Self {
@@ -213,6 +212,15 @@ fn from(value: bool) -> Self {
     }
 }
 
+impl From<PeregrineCoreSelect> for bool {
+    fn from(value: PeregrineCoreSelect) -> Self {
+        match value {
+            PeregrineCoreSelect::Falcon => false,
+            PeregrineCoreSelect::Riscv => true,
+        }
+    }
+}
+
 /// Different types of memory present in a falcon core.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub(crate) enum FalconMem {
@@ -236,7 +244,7 @@ pub(crate) enum FalconFbifTarget {
     /// Non-coherent system memory (System DRAM).
     NoncoherentSysmem = 2,
 }
-impl_from_enum_to_u32!(FalconFbifTarget);
+impl_from_enum_to_u8!(FalconFbifTarget);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconFbifTarget {
@@ -263,7 +271,6 @@ pub(crate) enum FalconFbifMemType {
     /// Physical memory addresses.
     Physical = 1,
 }
-impl_from_enum_to_u32!(FalconFbifMemType);
 
 /// Conversion from a single-bit register field.
 impl From<bool> for FalconFbifMemType {
@@ -275,6 +282,15 @@ fn from(value: bool) -> Self {
     }
 }
 
+impl From<FalconFbifMemType> for bool {
+    fn from(value: FalconFbifMemType) -> Self {
+        match value {
+            FalconFbifMemType::Virtual => false,
+            FalconFbifMemType::Physical => true,
+        }
+    }
+}
+
 /// Type used to represent the `PFALCON` registers address base for a given falcon engine.
 pub(crate) struct PFalconBase(());
 
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 8058e1696df9..1c54a4533822 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -482,7 +482,7 @@ impl $name {
         register!(
             @leaf_accessor $name $hi:$lo $field
             { |f| <$into_type>::from(if f != 0 { true } else { false }) }
-            $into_type => $into_type $(, $comment)?;
+            bool $into_type => $into_type $(, $comment)?;
         );
     };
 
@@ -499,7 +499,7 @@ impl $name {
             $(, $comment:literal)?;
     ) => {
         register!(@leaf_accessor $name $hi:$lo $field
-            { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
+            { |f| <$try_into_type>::try_from(f as $type) } $type $try_into_type =>
             ::core::result::Result<
                 $try_into_type,
                 <$try_into_type as ::core::convert::TryFrom<$type>>::Error
@@ -513,7 +513,7 @@ impl $name {
             $(, $comment:literal)?;
     ) => {
         register!(@leaf_accessor $name $hi:$lo $field
-            { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
+            { |f| <$into_type>::from(f as $type) } $type $into_type => $into_type $(, $comment)?;);
     };
 
     // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
@@ -527,7 +527,7 @@ impl $name {
     // Generates the accessor methods for a single field.
     (
         @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
-            { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
+            { $process:expr } $prim_type:tt $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
         ::kernel::macros::paste!(
         const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
@@ -559,7 +559,7 @@ pub(crate) fn $field(self) -> $res_type {
         pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
             const MASK: u32 = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            let value = (u32::from(value) << SHIFT) & MASK;
+            let value = (u32::from($prim_type::from(value)) << SHIFT) & MASK;
             self.0 = (self.0 & !MASK) | value;
 
             self
-- 
2.34.1

