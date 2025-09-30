Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F17BAD04C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3DF10E5C9;
	Tue, 30 Sep 2025 13:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IvRLy4h1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011012.outbound.protection.outlook.com
 [40.93.194.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5320210E5DB;
 Tue, 30 Sep 2025 13:17:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCW1O4ONAd1j/mZzVirb2Fm/NbTU3EKDm3+7FZmYCHUpDzYRP5NxSi2gQDlrJD+P8HSYCV7/YeY2wz1iIPwBH1B7FT/fILBuyXXvMCgo7M1AHvxzisJtqebNYH7EUxaedWgU+xJvS2zFrC9AAf5WduOkp7JtPZBzl8dpRqbOhRgsKlNOj5G5ZvjlDbqBOvr9X2HAicQAD73GSMdhP8O/eWoIHBYdzQE9dCyY8xGj1kfpVfGMA0M89Of2OXevtp0UdN33sIdtLhe/SJpY9BKugdrLxP4V7GHIJKXrlLik8N6UG3miKiYRFjoVzJJGhijNwji5eHq6E3+ZTPN738xBEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXlfGYkOva5UCDXro/xhoe7zd3bOSvt9PGxYPsHzLOk=;
 b=auJD/jyMl1qQ89MucdPp0qLTmFuirNQJxuRymidt+GSS2u26/KqDnKZhHIzaK4afHbOo5aKptY/HEIM7q2SSDWjUR57YJilUMSbPmcgGNOJTQpEhGfCHamZ5Kn1bpRNghsK5LFg60blGYYQPgBmplBeZrFZ6uYQuMIU4LnGuh8YencA2ZuURYkq1ZUuixlB/symp1gFOEF0QpNnX/QHSrqX6QiE14OH+ECHUr/qu8Q/iAtO01zwaFHf6vFcBLqg+g3+Ijq7JGJBxf/j98js0itzltZ5B3tcJGVwNFPmTAguVyOMWB62GHNm+KQDxcZoVKgsMH4fPOKOVJxExyye0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXlfGYkOva5UCDXro/xhoe7zd3bOSvt9PGxYPsHzLOk=;
 b=IvRLy4h1P6rUrJF6ULdq0+g20E57L97ezDJ9smg8mC8BLoCnWjspc2y0e5T/UnlGZh96HCtgfbLb7pPWCBcoFn36QXN2zEe2hR6uT0RLhKwZeU7WNtQgF1in+DERgjZDo6lDY5tmJIYmeP6XhUCvjo2efAD/un7pqopKFZMiatrwupmh9MVaUst6MwvT+Jah0Nnq4S/PMtpt3nDe2ImUQNIQ8lGtECxWxqpBrKUw8RLf3+8UeHbSDUawOmp7SLbQ6XY7bb1RnHEaWXr6pdR9336SDdD3xJJBYEeCUXXn1jIAChIeLaLw0Wf/hoCI277p0gEqF79qDcHztnBniDlPzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Tue, 30 Sep 2025 13:17:49 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:17:49 +0000
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
Subject: [PATCH v3 10/13] gpu: nova-core: gsp: Create RM registry and sysinfo
 commands
Date: Tue, 30 Sep 2025 23:16:43 +1000
Message-ID: <20250930131648.411720-11-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930131648.411720-1-apopple@nvidia.com>
References: <20250930131648.411720-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0088.ausprd01.prod.outlook.com
 (2603:10c6:10:1f5::16) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7875e9-b8a1-4e05-edc0-08de0023c069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BxW/qyyWN51WxlF9dVG68nbQ4rHzbiimZ76b8ORpV6KXtTbso+SA6EVssSSl?=
 =?us-ascii?Q?v+mWpYDAxWyuX9kmpL6XsyCfeXPEJwJ94BX4lCv4Wh8kG86vrMEBnNU0i4yX?=
 =?us-ascii?Q?ePxdYU7S8cOfucIzyFH61JZF9PkD5lSFXZNIYyPRwkvDjUcEYJk32szGL57m?=
 =?us-ascii?Q?oOmvgykw0vMVSobq30ols+EB9XWxH7WyWmh+i52uqNexc8xw3kXmOpmyIJCh?=
 =?us-ascii?Q?bzIeQzdWDRb7v+PPIIaUGdxxg3Enri3qJP7i3zuIEJ1UnY8lI+PeBDkH/YfM?=
 =?us-ascii?Q?oeiFJ5dKQy12+zctjS3oRsQzfWJDRv8zavC90tMMCbDrexRqeD1xXLriFExH?=
 =?us-ascii?Q?rOSGvOTr4CV+gfHurxxtfpwQ+2+LhxutORmdZ5OqejqbH3HFAPbHiZl2LeNG?=
 =?us-ascii?Q?E78rwQI+u/p/flU2e12C5Jxx7VwGwwMuQkZO6bUl9/S85080mrKK9wZaU/TY?=
 =?us-ascii?Q?1BevXmD0DIIVY4M7p+cgiKbwZ0oxhVDuPU8icKnFxKNZ9CVdUQLHb9gtnaJq?=
 =?us-ascii?Q?2JJxovkuD29MeekQq0K84r/UbkAoZNdSR4/IjacA7Ly17YmbKBeOBZkWsD0O?=
 =?us-ascii?Q?2eTVzgpvOzkFX9gYeiK4yyeJDooln3abwUkKGBb5w4Bp6ADyyZOwNP4DTBOq?=
 =?us-ascii?Q?nGyUlbluRIGUaN/6CMaD2Sb5BaylAHDthtzjTD3iWYxtXv4MiVknhLBpWIVy?=
 =?us-ascii?Q?K2srg3vYRbjVAKL8TJnZCOLtvj1NbBAQa/xSnZmX4UgaUY3IIr32PzBf8VUe?=
 =?us-ascii?Q?rKCkxXH/sPY08E5Fegd5rL9EcPDZYhSTrQqL0oBHpDyRpYvRdiDFSY4eGnRi?=
 =?us-ascii?Q?8p6SBFa9QmcHrEXwweDVVfek9Zld3j8dMXzNX8H+0lcOgNvzM+F/6BEiAdkv?=
 =?us-ascii?Q?DRqyfJmXuNHLHpeTVSmQklP58DBxQeAej3CTJkh70yKpeyWv1KsNQFlBpByH?=
 =?us-ascii?Q?SQNSaC9fjAbZMf2JtpHpNG/1veoqilwzWD0Y2qUcl027290Z6ZK6QuNxmmIo?=
 =?us-ascii?Q?KUj2ZiCrqvRdjqpGdSwNIPXOCthN1u2fPnmbAto7Q5qsd+HzZUQp9G4EO3Ur?=
 =?us-ascii?Q?Q3CrGYkVlFGHHw+STpXXpBH+YGn2gqo5tBH7ujFeY4NttnE8XdL47JWY5Gw8?=
 =?us-ascii?Q?OCzlp5GHAmMqYNzlk+GIj3c1GrQbUfcXErqMLoPTLehaIcp380Tzjo7X6ck8?=
 =?us-ascii?Q?CMY7j242iykFpa4TsMfNy2zLjCQCQWIYxWbpZfDqNPjMx49OUP2Izc0mZ7Mf?=
 =?us-ascii?Q?BQfpou+u7iB1chAQYr4i7jvvoiIyO23Dd7ko+UMMKI8aNPvAdco1vi6ZYPEI?=
 =?us-ascii?Q?UBL3jqcPdt4rhtR56PhjuOEqM4gcMQjsc/2piXK0mnEVj/619yqSbx77Q0OY?=
 =?us-ascii?Q?5hNDBPBeyqWN6zFDD1oQ5lWGRECgyqLW62V5o2sCJunOe4VeHioIK5GgP/t8?=
 =?us-ascii?Q?nYVPLOUBlVcOa1lE9tBa/AvQZWBh4apZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hgkAdotgNlD2fEgrvysDM2j3Oqi8MqhXG/8p/9Fd7b3hHgSqNlgL81ZqH9Ia?=
 =?us-ascii?Q?inCK9FkKWNN4t/cSvskksI+ZSZBvafCJ1XSuTSHIT0KiOWVyThiVwGIpewI8?=
 =?us-ascii?Q?8QjGXNs/uQ/fxUMeYgPU9D5BUNDhDkAM7AjVU7IMLeZLuePr61Ia5Qe62KJw?=
 =?us-ascii?Q?I8VTaOM3wOFp5K2A89CI0LI6w4sOCemabu1igwTJdqZVS5xQCWoVlzFG0hba?=
 =?us-ascii?Q?IJrTziDFJDbNe14cului5EaKD3j9m1Va3/edQTZh73FXni8ZSDgkVSNwuiGA?=
 =?us-ascii?Q?hTO+QaRoHevxWvceqLfP0URuW/m0Ou41yOLGyaKrmyulj9qaVRnfg3qdrev6?=
 =?us-ascii?Q?3xMKqDGn8eEx49/PsSdKU5L+bqLu7ZXeItSRMlNSIJG/wI/LkGbjc/QkWQDl?=
 =?us-ascii?Q?7TK4ql67dPVBmr+5cqw2hjXvMNrjw7b2KSBsuj542lT29JH+ddyFrdl8lOkG?=
 =?us-ascii?Q?HJfVCEL2UEFCt3bBb2yFyDuHqVZI0LpcBRCVQn5aesd/Zdqlv5XFThDv20qY?=
 =?us-ascii?Q?J8IiMuAHnzjgqlCVE11AKC9JgCjeKrhSd6WKjLcdYSwUgB4EgNfUgxZnU5gv?=
 =?us-ascii?Q?n6zJL7G2WdGX3a8xm1OfuWgPJbnEk+EUeA838kgOXlfDFaOPFbhEotTu6jVM?=
 =?us-ascii?Q?GQeqSEYyM3NFXtrTTPaopFZk19gOHIbMn3iudldKXwwt1bNokSyBwFtcS5QH?=
 =?us-ascii?Q?lRRA9t235rEqJxh6u9hHOBqEDNYgFztN1fXSIO9y9Y7Ur1SpeQ/jD8wuIH5B?=
 =?us-ascii?Q?vH7M0U1lOrY3b5Q87BBX6aBM0D0AdsFn6GGKjMMpkIYWq35LFtD+00Y2AMeY?=
 =?us-ascii?Q?Yiaofhp1noKfp4BgvMURxWPUfCMQXQ7dNG9Afrzf7XZKlEOe700JKwuoWtw6?=
 =?us-ascii?Q?D271zijKEUSpzR7KUXAJvCSWEJpJAfUIpX7VXNG4KyvwFZmqaxBihzHoVud+?=
 =?us-ascii?Q?7m8IOMdPCF6JCjTq6O+UIrtXD66d2mGBAdr1Rowawb3BfDknDLyW4SCAR1V6?=
 =?us-ascii?Q?oIE97uZgqxf6vzLkrZDIb9bxawOBnSbWzv6IE8rOE9/8vIPs1+IkPbF4qWtr?=
 =?us-ascii?Q?M9u7CCCVAwuLX5X+/4/tRms1ha6jrLjsf+oUh+NdRgd3ArddX50w/5TKD8Ii?=
 =?us-ascii?Q?4HYcG7FgpEo46oJsEpIvv4A0lSoXIOauE1mU2juos+WVNsi3qV92PYq+jyXC?=
 =?us-ascii?Q?kcgsDCYBxc+mVXwXJy5y1xQJCefCq95rF4U5QuAblJAoPoJDKUbuyxo5Kafq?=
 =?us-ascii?Q?uG1TBdEchFoZPLNfYH5uY480y5oBF5ZDZnsRZDMf+/MsdHiV8y7/FIY3vOJD?=
 =?us-ascii?Q?WJF/J9WiysTwOVL9hwmId+/ZjPfZpJDFFKdQPlSAGbGUx+Toc9jf0nsxWCwc?=
 =?us-ascii?Q?Rvwt8gn9ET8pLMt9At5BA0aljCqTtvPe6DBFJnpp5LWZ+ge3TVvfbpGGsiz+?=
 =?us-ascii?Q?paFjOfIbO0x+MPIwLfXFA0qqb3ZDDRwVTpGDMXUmjmEd2Bu3i/xkB56apLka?=
 =?us-ascii?Q?Kg9sSvXtCkyoOsOs8vebouiOV5WgnFE7JqbqWlL0gCX+H8v+kBpS0+a+rqsB?=
 =?us-ascii?Q?tn5acxaHovK/mCvJkrKIi3J3VBr5FGyX6IsvXric?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7875e9-b8a1-4e05-edc0-08de0023c069
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:17:48.9509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HykMosksqTAxc5bRaA6QaP6mXNi37K8xQZ6kMj1U8Rh2CMXatjXfjaMWkRyxGuK2n4c1SLKz1MWqO4ltd0gDLA==
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

Add the RM registry and system information commands that enable the host
driver to configure GSP firmware parameters during initialization.

The RM registry is serialized into a packed format and sent via the
command queue. For now only two parameters which are required to boot
GSP are hardcoded. In future a kernel module parameter will be added to
enable other parameters to be added.

Also add the system info command, which provides required hardware
information to the GSP. These commands use the GSP command queue
infrastructure to issue commands to the GSP which is read during GSP
boot.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>

---

Changes for v3:
 - Use MsgFunction enum
 - Rename GspCmdq to Cmdq
 - Rename GspCommandToGsp to CommandToGsp
 - Rename GspMessageFromGsp to MessageFromGsp
 - Split bindings into separate patch

Changes for v2:
 - Rebased on Alex's latest tree
---
 drivers/gpu/nova-core/gsp.rs          |   1 +
 drivers/gpu/nova-core/gsp/boot.rs     |   6 +-
 drivers/gpu/nova-core/gsp/cmdq.rs     |   1 -
 drivers/gpu/nova-core/gsp/commands.rs | 101 ++++++++++++++++++++++++++
 drivers/gpu/nova-core/sbuffer.rs      |   1 -
 5 files changed, 107 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/commands.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 9e5dd9e5a316..1d5544d9dfb4 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -22,6 +22,7 @@
 use fw::LibosMemoryRegionInitArgument;
 
 pub(crate) mod cmdq;
+pub(crate) mod commands;
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 1d2448331d7a..0b306313ec53 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -16,6 +16,7 @@
     FIRMWARE_VERSION,
 };
 use crate::gpu::Chipset;
+use crate::gsp::commands::{build_registry, set_system_info};
 use crate::gsp::GspFwWprMeta;
 use crate::regs;
 use crate::vbios::Vbios;
@@ -105,7 +106,7 @@ fn run_fwsec_frts(
     ///
     /// Upon return, the GSP is up and running, and its runtime object given as return value.
     pub(crate) fn boot(
-        self: Pin<&mut Self>,
+        mut self: Pin<&mut Self>,
         pdev: &pci::Device<device::Bound>,
         bar: &Bar0,
         chipset: Chipset,
@@ -139,6 +140,9 @@ pub(crate) fn boot(
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
+        set_system_info(&mut self.cmdq, pdev, bar)?;
+        build_registry(&mut self.cmdq, bar)?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 2fd6b31db9e9..5580eaf52f7b 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -247,7 +247,6 @@ fn notify_gsp(bar: &Bar0) {
         NV_PGSP_QUEUE_HEAD::default().set_address(0).write(bar);
     }
 
-    #[expect(unused)]
     pub(crate) fn send_gsp_command<M: CommandToGsp>(
         &mut self,
         bar: &Bar0,
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
new file mode 100644
index 000000000000..69df8d4be353
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::build_assert;
+use kernel::device;
+use kernel::pci;
+use kernel::prelude::*;
+use kernel::transmute::AsBytes;
+
+use super::fw::commands::*;
+use super::fw::MsgFunction;
+use crate::driver::Bar0;
+use crate::gsp::cmdq::Cmdq;
+use crate::gsp::cmdq::CommandToGsp;
+use crate::gsp::GSP_PAGE_SIZE;
+use crate::sbuffer::SBuffer;
+
+const GSP_REGISTRY_NUM_ENTRIES: usize = 2;
+pub(crate) struct RegistryEntry {
+    key: &'static str,
+    value: u32,
+}
+
+pub(crate) struct RegistryTable {
+    entries: [RegistryEntry; GSP_REGISTRY_NUM_ENTRIES],
+}
+
+impl CommandToGsp for PackedRegistryTable {
+    const FUNCTION: MsgFunction = MsgFunction::SetRegistry;
+}
+
+impl RegistryTable {
+    fn write_payload<'a, I: Iterator<Item = &'a mut [u8]>>(
+        &self,
+        mut sbuffer: SBuffer<I>,
+    ) -> Result {
+        let string_data_start_offset = size_of::<PackedRegistryTable>()
+            + GSP_REGISTRY_NUM_ENTRIES * size_of::<PackedRegistryEntry>();
+
+        // Array for string data.
+        let mut string_data = KVec::new();
+
+        for entry in self.entries.iter().take(GSP_REGISTRY_NUM_ENTRIES) {
+            sbuffer.write_all(
+                PackedRegistryEntry::new(
+                    (string_data_start_offset + string_data.len()) as u32,
+                    entry.value,
+                )
+                .as_bytes(),
+            )?;
+
+            let key_bytes = entry.key.as_bytes();
+            string_data.extend_from_slice(key_bytes, GFP_KERNEL)?;
+            string_data.push(0, GFP_KERNEL)?;
+        }
+
+        sbuffer.write_all(string_data.as_slice())
+    }
+
+    fn size(&self) -> usize {
+        let mut key_size = 0;
+        for i in 0..GSP_REGISTRY_NUM_ENTRIES {
+            key_size += self.entries[i].key.len() + 1; // +1 for NULL terminator
+        }
+        GSP_REGISTRY_NUM_ENTRIES * size_of::<PackedRegistryEntry>() + key_size
+    }
+}
+
+pub(crate) fn build_registry(cmdq: &mut Cmdq, bar: &Bar0) -> Result {
+    let registry = RegistryTable {
+        entries: [
+            RegistryEntry {
+                key: "RMSecBusResetEnable",
+                value: 1,
+            },
+            RegistryEntry {
+                key: "RMForcePcieConfigSave",
+                value: 1,
+            },
+        ],
+    };
+
+    cmdq.send_gsp_command::<PackedRegistryTable>(bar, registry.size(), |table, sbuffer| {
+        *table = PackedRegistryTable::new(GSP_REGISTRY_NUM_ENTRIES as u32, registry.size() as u32);
+        registry.write_payload(sbuffer)
+    })
+}
+
+impl CommandToGsp for GspSystemInfo {
+    const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
+}
+
+pub(crate) fn set_system_info(
+    cmdq: &mut Cmdq,
+    dev: &pci::Device<device::Bound>,
+    bar: &Bar0,
+) -> Result {
+    build_assert!(size_of::<GspSystemInfo>() < GSP_PAGE_SIZE);
+    cmdq.send_gsp_command::<GspSystemInfo>(bar, 0, |info, _| GspSystemInfo::init(info, dev))?;
+
+    Ok(())
+}
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index bde80cc3fa63..5acfd005a86b 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -159,7 +159,6 @@ fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
 
     /// Ideally we would implement `Write`, but it is not available in `core`.
     /// So mimic `std::io::Write::write_all`.
-    #[expect(unused)]
     pub(crate) fn write_all(&mut self, mut src: &[u8]) -> Result {
         while !src.is_empty() {
             match self.get_slice_mut(src.len()) {
-- 
2.50.1

