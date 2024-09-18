Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB6B97B870
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 09:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E6110E549;
	Wed, 18 Sep 2024 07:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="bLdga7WL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK2PR02CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11010039.outbound.protection.outlook.com [52.101.128.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A847910E526;
 Wed, 18 Sep 2024 03:28:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qt3gqu7vj4FgarT/RMGxwCmf/uo5t3Bltmt+ICuhye/0wPYsN6reeO2/1aX9SkpS36o8Z9cemStoPJltiG/gYv5J5MPBCOAS0q+2iiLs06PxafVn+bayk1lAEice9nwK7/pJLFGKr2u1HFIEbLgpmRIMPdVdSF0vBKOnpYO4WIqvB8DPGOIYR4/wc2oOPvqUs770nBwJUdskCbx17NRVXOyhWAphoKQNQpwL0xLY3vJp9h+9J9oaVwNevjBG39ZldMKmmXii22ZGMHOq+Spgn8TTEc9ehzgusJVj5UjOUfOFH6MyQW72LW/JalJLwsJn2GEa15y9NXyrqnb6LSWMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7K1UD5a3SFEk0QjJrP/vl1mJZwRWK7g0Jq24QwT+DY=;
 b=zMSTOic6Fc+AkfiEHu+X4m2wmF38kOjRuBVCoT6nikxpuO9WXoUtvZ0DV2N6q92LsfEmk3T8HKDl9yOg7uT45ZyeOeq0nmWZ4QMVFoQo/9WAS8NrTelM6XEtmSaOss2OihtCsig32UvmyzvBg6uJGGXr6+Acbkq4NOWOCVKIyMGpfr6Umos4tUr9PEvX/QyzoWt0I3Z03l5dFNpCXmXYz6aa4bhk4hJa+fbifqZrSgOi72Ek6HY0eJriHHzpaRy/XF2Aabv8/qdkfZomsfz3l9o8yo0DvNhqxZfHXxbUDo51lZHJAIA0x8B5zej/GwnI8pbRw6belINRTFIfPxUj2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7K1UD5a3SFEk0QjJrP/vl1mJZwRWK7g0Jq24QwT+DY=;
 b=bLdga7WLIZavi+uADsvijHWmRVDgQiWnocrbgFZeHtdT6jUGOaM9hAlP/wKDYBJVH6rBS1dV8ZJvTYkt6e5cbtws9YZFA3nNs9sALn/AP9YtGU2F9ahWu6lk74hbcRcFlnGmpQ21n/gwLPDjcReOAy33pOc6fhUjBv/M5iYLI2ym1aOQY+thPTqSVUValghUWJ1jCtZwntgaMfqV1s68WiA7nNa7mdB/gnhHWlbAnFEnYvm4Dkhq9HdY+sEMGoECdilBpnirJwL2zI15kPXAXEXDTWIy5xfNs3qSqzMlHVp9sVvy3jBWGrTDgkfclesAWDnEKSTWuG1VqFsMQOWuHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by JH0PR06MB6809.apcprd06.prod.outlook.com (2603:1096:990:4c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 03:28:14 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 03:28:14 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com, Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] drm/i915/hdmi: Convert comma to semicolon
Date: Wed, 18 Sep 2024 11:28:04 +0800
Message-Id: <20240918032804.9269-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|JH0PR06MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: ca23810d-109f-4ff2-d321-08dcd791ee22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|1800799024|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?klWnS5AYRECK60k1YPsOePz5zMUqTzkfK/FaGSGw4ivo2otC73xGkHotV7DL?=
 =?us-ascii?Q?KCXl+qF7meRAUJJBm1pJxyPnQaIi9Yb4S0nj+ASyhYBbytAu6hEs0ZeLlKdi?=
 =?us-ascii?Q?Qovp+x5onnvzU79X4PJXzLZpMLkmHUFEUsLfJoK2toy+iDLFdpp7EdevTn9d?=
 =?us-ascii?Q?o87LnTiF6iUXi2+nFJXcpeC9wHoyQSIfDvoH2ky5Jlm2SIo2FBLr37Sg9prp?=
 =?us-ascii?Q?UnYeGG1yKvy6fytMb5BEkcTQ6h4URZeLDHxS03pj+67wlH4G6lnSJbJof5OU?=
 =?us-ascii?Q?B0RzGd64RiI+WTyPAMMKPqEJRHEFsIABeWUQiQO561wXSQXzwshy+j2ZA54y?=
 =?us-ascii?Q?LQguMpfwRbEjD84gTyk+O2oZ2Fi/iUEveStPo1MRGNN1S6SQCUq721KHgL60?=
 =?us-ascii?Q?+aAmwIf6DYSe9xRKYcfhooVQIIbhDrdyBM0hMTufrTSHNlXqEdQHfuD3Pt09?=
 =?us-ascii?Q?lazMIfPsKudYkkI5aCnyLVcXktRr8ybza/cl9p8NNuQdlBCmbqdFBLOE/A7D?=
 =?us-ascii?Q?ltLoH+8wnNoT0EFwJIqxNACfkPm5O5XMyfYtL15h23/Qo/Crrb40MTFmgyPx?=
 =?us-ascii?Q?XYr1tXL9VrMe3lXAXSiN5RRTAZuQvDiLY9ekH8g801QJXcu/a4fmHucR7X54?=
 =?us-ascii?Q?mrk4dCyZsTVUS/bUWEtbwqg9lenrP3+p/UmTaqZNGSyFU9RqhfDs+xzkToNq?=
 =?us-ascii?Q?TqcHa3s1zP64GBPwAYqDfe853wBt4ndyjir0+JlQfvPB6L+XTTLY6aaXg0Es?=
 =?us-ascii?Q?4huw6PZtuuo56eMuqeZpF9MN727AhLouAUUoJ0sWde6j416wSKAQonfU8u6E?=
 =?us-ascii?Q?SrCQY1UTqkSg5pDTGVb5++2MXv9br3L1K0w7qR2hLyFvRRx6gS4UWHlWGB9h?=
 =?us-ascii?Q?CaK1ZgpllcLMrnL/XiTqJhU3NRuXb9aMyY6Grm23DeE1gfvxjRdKkXMyx68/?=
 =?us-ascii?Q?unRWMAgSYs7fr+R6HpAVka9DuJiiCI/ySA70WLkvCFNIZM/d4LuXyJz87TQG?=
 =?us-ascii?Q?CiqvpUqQh0rRauX/diOYwpgmlz7/XM6UvKLI4iUhXTFx+MeRkrhSRdicKoFa?=
 =?us-ascii?Q?5x6N4VlIk4l1dMaZ9s/R6dmOV2sxDgG7Qwr9hmB6Ex80tJ+yQ5Ib2O9Y+LqN?=
 =?us-ascii?Q?mFYw3b4yNUDmu7SIGy+Xl1P+kRISTyvuDWdAqf+8y3FBIksq6AufxEDpiOQ0?=
 =?us-ascii?Q?prQpjnkK4d4UUTr3oDugH4jNgWTXpNdJggLF7TBYHb6T8tzGpZsIauHmiGZV?=
 =?us-ascii?Q?YQ3WTretd3SOAofp35sEGN/Zj8b0D4bASlipaelmXkcoZs7DSMATltE6WuKf?=
 =?us-ascii?Q?SbR/wMia5wVUhs0SwzuEwZ59y4S5QJRXOrYamXKlF8vLrXl1RwOgL+VM4ZFK?=
 =?us-ascii?Q?05gB8QcS2UMj0wCN4qGthUJT8IEcFzjc//+LkXbT4Q1xUEqngg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5899.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F05NJVWlxVkKevJZVX9RMaBQKNg5Hi5OcTIm52oRfz6Wf8FCsgCYM7rTRI6g?=
 =?us-ascii?Q?fCgBFNo1YCqnPndRwUsYomtA3vNnYTPQ31fzAvqH0+RrkOfw1CazuJr9Olu1?=
 =?us-ascii?Q?MoGR1ft5LCUgC4J2NxGKs59UKqUtJd6EgsyjcPudhDIGY0r0pY+YdLCdCYaC?=
 =?us-ascii?Q?nTZqm9M3kr+PyuOMnafESzemODOjqWaPk9P0ESRYhHfWQ6eMQEKVqeYEodx1?=
 =?us-ascii?Q?QSqC8tptB8SV8sGN2A5BrF8sEbNbAYac3hbIbELQp6y62wsRR4nuzPZ5gALK?=
 =?us-ascii?Q?j4Aqr4x7UUhKzQapT3hUXZfupvOZ1sMLeZE2mX4tyWAt7v2mvjzb80NeLs9k?=
 =?us-ascii?Q?g4vnNqh74yYQ8eBRQjwH0MRGnzVhunaha9FIHK/1mg2wSLrWGF67trsPKePt?=
 =?us-ascii?Q?CFeFcauuNBmwjPrWFuCD8As5aBJiCsslS7KIL2V+WxelfPJnA9cjvwaG0NJ1?=
 =?us-ascii?Q?+nDerq0OFyCBmTurTZHmf3Q6AMFf472A6QrxedWUsXtYUTUFQpZECcRydJwv?=
 =?us-ascii?Q?PN1aU0iQ3RXA8cvomDRsKxQf7pNesOdUeTxF2fvH7EErmCE+IsUJ+oNMlQxP?=
 =?us-ascii?Q?nCb6F+Av3cmIX8lmOWYJd5ecV/Movtq5u3M4e/ElsfMkO5EaCbokrnNtheXY?=
 =?us-ascii?Q?7toT1OWDQCZs/G8/X6+4fJNz59FIpxqoFV2oxtQN5QyqTq6hMPvIpoRLCoyz?=
 =?us-ascii?Q?8inalbKKE6fk/jKtIF+9BVXTP47Wh4j5xKC35MocYdZpgBKY1kgf8bIYwvK+?=
 =?us-ascii?Q?r7RJ9ZhmUmAFYwBIvq3lvuEl5cFR0KY1DGteXcTykGl8eyHHnGSvlYMJLzX9?=
 =?us-ascii?Q?5Q09OsosGgPZfR/uPUcQxB2PXjmHYsTYyQU+OCkQbucWg4y2EcBrCf92YcJK?=
 =?us-ascii?Q?k7IwhHypPPHvBW356X/w4npa1/8PVFMui3kXDU0pYzCBgPxx9nUjK2g4cP2P?=
 =?us-ascii?Q?XlIkFVDNMfwVC+BJT2Mrv6JHx1EnA1DfId3xvwgzIb2AtjRUSIIGKjCRy8HX?=
 =?us-ascii?Q?Y+0sSGEUI4aXIZRXr1uO3A1d2XR2Vc5HBdwVYUrV9NlDvdG8QyoapZwa7H/M?=
 =?us-ascii?Q?R8N4/WCB8gjoXAFF6MfLFzqCtDifAMnt0FRjIucfWVzJwYz67OaVEm7LmF/f?=
 =?us-ascii?Q?IQjJn/w/3UdQMPGVRmV44hUkW1tP2L18BiXn6zyPgffciSozRqEX8uex6AGS?=
 =?us-ascii?Q?PuMmRx1UT8zs4B8WNfZCIFC5LQ2wikeQF6jheH07hAebdZZQMqDTZ7tNObCG?=
 =?us-ascii?Q?99chMa7Q8+eEe0NYhzuvtNot6qPelTprjq3zdlHmt3yHmuANZlbRf6eCYBir?=
 =?us-ascii?Q?sN6vBjVcbwG0QZorLvRBPuZs8N/RIs7LGtPka/iEI4+H8N1SpO3+M/csMBWa?=
 =?us-ascii?Q?q7iSaQK8h0HuoL5gzirDAQNLrD5+GKiHn6q3HBd0G9KltjuIjCvxfUjDuS5r?=
 =?us-ascii?Q?G842OwqtWSbP/+caq5Qn3AJeVGGR1gq99tKj0TOSUp2Bb8Fgo2jIpFG9HpjQ?=
 =?us-ascii?Q?n6g1IS5774w5DRQyXfPF6TD6UDntff80Fx845qteYyqgEhnjiaG56S5S0ntT?=
 =?us-ascii?Q?IuorPpfLSTF6i8C0hSsTqUopvk/YGWvaV2XhYx/F?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca23810d-109f-4ff2-d321-08dcd791ee22
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 03:28:14.7397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAkhBcQU1CFowRhtuOR1ykTGQ1VKs+C+EWCrB9rqKp1dCNfF1LhsGt+lkyw0Fr/z9axfW5qo1HyxmPTsb0Xxjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6809
X-Mailman-Approved-At: Wed, 18 Sep 2024 07:19:16 +0000
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

To ensure code clarity and prevent potential errors, it's advisable
to employ the ';' as a statement separator, except when ',' are
intentionally used for specific purposes.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index cd9ee171e0df..f2dce9896a48 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1310,8 +1310,8 @@ static int intel_hdmi_hdcp_write(struct intel_digital_port *dig_port,
 	memcpy(&write_buf[1], buffer, size);
 
 	msg.addr = DRM_HDCP_DDC_ADDR;
-	msg.flags = 0,
-	msg.len = size + 1,
+	msg.flags = 0;
+	msg.len = size + 1;
 	msg.buf = write_buf;
 
 	ret = i2c_transfer(ddc, &msg, 1);
-- 
2.17.1

