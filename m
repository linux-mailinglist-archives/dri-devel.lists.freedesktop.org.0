Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F0FB3736A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 21:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EED010E1DB;
	Tue, 26 Aug 2025 19:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EuxkneF3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2069.outbound.protection.outlook.com [40.107.95.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC30810E1DB;
 Tue, 26 Aug 2025 19:53:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VW6zQ3Q10daqdtr7oKrSJwYXsRNHw23C1ZGaxw+8Ia305dpPAq2GbXQUPq6Iskiwo6ELbu2rJzpIYieQvy7llER1bAmGtMdg9GRxs6S0D9Fm4r4SNhMbofThTf9H9s1I/Cy+7AK2WEjIB73CclnOz7o61VE9Oe+dWywujlxdZ7aGRow627YRGjGEAjzKEZ1RBZLvR7iwo3We/daL4ymmpNAUjTq2HTT0xIExbxoIDXJ72alIBl6IESw633jodSPSJe98wNdXW7dyr6UZagD4JSdl/EdzjtSZQr4aR285hrrd0cKogGHqvWk5NWfAiw93NIsuwdfXWnDkPyvlj4OJtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+v9OUkqdOsGkNDtUEQH7RrZj2PenaWBdsxpw871h00=;
 b=pbm/yTCDbcv2rgaXwt7aD8cK/bxaqPzdWsBPZ7lzrVaWHGtf5v3f25yMMj7KM+TYnXHtzXD8MUQwlWkJqOK28wqPsFx4bTbpG4jYZLisaDDlK/rY9PlkpterVdElaYYOMA/j16AXt9elSghK5L1ZXCBGCwfl0KOHSYiZuKdbXqgZE7KXOPUucfYJN2BDmZYvq4Dr0S05FnF/fT4jy2NtlJhsRhezmN58mfieGf3XYzjrNsGvvmv8EimM7FbJnDvd3A9dAMLYs0Q5Npf5dcAnYMm6DTTlH96qRD1sQNUX7umwNGdajBW90NnRbOuFrfabr/kW0uJuJrhfhmCyw8FVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+v9OUkqdOsGkNDtUEQH7RrZj2PenaWBdsxpw871h00=;
 b=EuxkneF3FTxfXtAFtW3LrTJhn6rFU4nmqtAmI+zcKlyByOQLQxCBp9/sFYUE1W/okE7Qp/wwFVr0bloRSz7QP0T/HxnFRhz/I2gkFhNe0YK1kGT9j5vwkfru792hCNOXHi/aoay5v9CaNOiwjVou3um2ZZNKd4RLi+75eyHMZWxpqK52AKovUCksjkrQXA/b5IwbBQQbP+voqaeD+QSaR7ECcshdTYc6lRM3CvoXIZuX27qpRj3UC6ux2+gSq/cV+QdbaL8bWCiR78GRtvLdsfTDVRGQUrFvyrS1DqjG/yZYfhf/t0j0WjQzj4tSOAYIke6G++Td6dpJpkaiM4H5Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3SPRMB0011.namprd12.prod.outlook.com (2603:10b6:806:31a::7)
 by LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 19:53:38 +0000
Received: from SA3SPRMB0011.namprd12.prod.outlook.com
 ([fe80::3228:78a0:2b93:2cd5]) by SA3SPRMB0011.namprd12.prod.outlook.com
 ([fe80::3228:78a0:2b93:2cd5%7]) with mapi id 15.20.9052.012; Tue, 26 Aug 2025
 19:53:38 +0000
From: James Jones <jajones@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, James Jones <jajones@nvidia.com>
Subject: [PATCH] MAINTAINERS: Update git entry for nouveau
Date: Tue, 26 Aug 2025 12:57:16 -0700
Message-ID: <20250826195716.1897-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::28) To SA3SPRMB0011.namprd12.prod.outlook.com
 (2603:10b6:806:31a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3SPRMB0011:EE_|LV5PR12MB9828:EE_
X-MS-Office365-Filtering-Correlation-Id: d8359d44-60ca-471e-8ad0-08dde4da3f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HxEkv1k86Z31K7wvOE4vdZjtptwucGYUe6rJ2D+zT5rxNLMl3B3uRogqhidO?=
 =?us-ascii?Q?L5oAUgRh3v5VhfeTg1q6ghLkOKJI/D9apXLXfRLYySUbHbbUlh0Yx7O8UK3+?=
 =?us-ascii?Q?T+6c6l7bxjwX8jcftd6xoCh+/JhKeFaU5NC61aUG2tS8WtyUAj8q9vmh00rJ?=
 =?us-ascii?Q?7ZQyugW/ipAv93qdraVJqfjbhMWbKjCYxLUSHtv/U2a1Wj6Vn++93G83mZYK?=
 =?us-ascii?Q?8J2ZpmooTqpteKLT/TJsoPYFg8zcr2vbg+WtJTKfUwFx0MCywc4+B2zzCFQE?=
 =?us-ascii?Q?T84MAU9JpLul/gFfri3WBgqXGUZlRK8mZW8iahTLjyiRFj03yG6REwpAX7UV?=
 =?us-ascii?Q?azYQRlRXoEi+fYPrLz5ERLu14SJtXwQOLoSxc18xfxjpQlC7cUkNGHxAMbyt?=
 =?us-ascii?Q?v0R2Irn0NOYTEJTyVuHXK86/7ZS9zPDUze7MycMLTyIO1OnlPCtn/dC6+N9C?=
 =?us-ascii?Q?mO5Y//JKZAw9a2ycWTF8XvMTjeQ7WlHBteHNIa0OtHqZbPsIjv6p200AAkU8?=
 =?us-ascii?Q?InBxoLNOn0FOwmRDhxW2aQKPzk7ZdKJ00YJ4CHQeUHQxVxVqK3OHTb+K6RIX?=
 =?us-ascii?Q?qxNoyi3BogfriO5wPG3RcLo53B5DYpR7Gon4KMy72nHU2lwdyJqgM076BwpT?=
 =?us-ascii?Q?v3w7X0MHP103UlHWzCE3vJZ+8ozZW/ky+UrearlfYk58JqILrKfJ3CDih1zq?=
 =?us-ascii?Q?kpqdpmQLEKIcwlEbhbEDYFSFAtsuL5dqo7udOtZ5PrIAjGcodH0CSOQSQixC?=
 =?us-ascii?Q?OkekYG+9N/ySEm5/C/zVx2qtqQoV9l8f5/slW0nWZvLmVvcbrV8cHMAFQO6I?=
 =?us-ascii?Q?7aORl3y9lIKIaE+dXzNKk+k/u6+aAu3QfeQdkMBx6KhVnqBS3qRQV0vjzj4Y?=
 =?us-ascii?Q?Vq7Uo+xlDF82INQzPLHUGSdl+0ZyAqcb2MKn+mZjRwamjd9NbqkDc9JP7uTn?=
 =?us-ascii?Q?lo5tkYot8Ld6E1nnILrZG63ogof1eLInSS7P+fcvMTn1WLTy4+PfUocwkUuF?=
 =?us-ascii?Q?Alm8jiNwFw7pDUV8sYq+ZMr3CgVezSpn+2wpavtCCJg5pbTQi5lIyszG1gwT?=
 =?us-ascii?Q?h2lRSIbNmr0u5TCxTs3Zn8bjvumChyKpd2wiiEwFm2n9H0U2uJxhkN8OqcFa?=
 =?us-ascii?Q?RdlnGtAwVjPIVV9QYUEDaF4aW8FeJgnAk99iSm3E0gooDZKpbdyI87Pdhi4k?=
 =?us-ascii?Q?cH9lD/Hws17LyBYu65ozjWrH5N59NJaqrWJjIMW/erIoacc9dWr18dHzStD5?=
 =?us-ascii?Q?Lp5dC22UcZ4Zq0ZsF3yu0j8brZWM0t6j8mLeBjN9y97KrsttrmhkGD8xJtEk?=
 =?us-ascii?Q?ppjaJioH7fgb+l4sTvD6sPVxLr4WkaLkTBwPqIKCXmR0A6SAdVATv8OAg5OW?=
 =?us-ascii?Q?HIxQLgKkNXzN6Dik6VrXVePokuEbpQokMsxR0vzoPBXP7uDHEldl2nbWtp2K?=
 =?us-ascii?Q?NjOzUwsBUTA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3SPRMB0011.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VmCK/xEA8n6mo3BGAwUKhZOo6DaplgyMee9nJoTbureiCJj3h5LMWq7ERmme?=
 =?us-ascii?Q?40Mv1IN1zgFddyRJC/IX93h3Wxiwzk3RFK73QXsyKWvr4VfuvtqDOTukEJ1D?=
 =?us-ascii?Q?0oY43eKQODHAg20w4/Z6ycDceTNNnpv8vudpcXMRMbTqOfbpHmhbXzJRPznQ?=
 =?us-ascii?Q?Z0kNoJ58FLjYZ4jgR7yf08XkgEplh84py+c8C/P0o6YQ9KP+dLww0LK35+Qi?=
 =?us-ascii?Q?vCwKe9BwEmboDwd9xJAAvGOyZevaRgbF+8tbbJHlW4hkBeEop1DqcPXiXnh6?=
 =?us-ascii?Q?FsqiIqHmjt93tRfLpAqW4ERP/eTELFZAHLvF2nayDYWzIAZ3QSw0mN0tKcoS?=
 =?us-ascii?Q?40EWHmqfi4Fo+WuZXW7yXRLekZ8Z1+NO4V6AJ5HYdoChGF9b3By2N5i06e/i?=
 =?us-ascii?Q?IuTU1mvsojkNp1s7S4j8HJbMaJA0Av1fg6fV/ixELJ2Fbps8UQKRt5vQ1YcE?=
 =?us-ascii?Q?paM3xdl0wZMJ3TxaNEVuK83kFhc41YGnueW7efZo5IkqvH1AM0Xyg79n1ikt?=
 =?us-ascii?Q?crXuCBjE1Wgotn5q6TaDaWwc7Rjy9cLP5brbKar+KsJ54jnoEWPCRuYIffNA?=
 =?us-ascii?Q?hNUvv5GEvt0T8ObzMSP4tq9HdYS11Qc71ouRTYVtc8CLfu28G0KdWPcSFJjm?=
 =?us-ascii?Q?JXBcByuyFy8CIQg2CbYD3kQjrrZGuFaKJMWhdTAka1lAz4gG/ap5mCzl31a3?=
 =?us-ascii?Q?Wr+X6mUWh1eXzz+PNY4ulYfff/Vy3/0OuXG+pmAukaMBxae1nN9xUNPtaHWG?=
 =?us-ascii?Q?BjC5YHV+1M9Kc5xkIp4A+kbgjZCHc5AEORS6Ue3b1dVJSPiJjPVXS4bsmq+n?=
 =?us-ascii?Q?qvEdizjTy2P3JY58BxybBxuEn2cWk2qB9Wn8Avf8vJtSvrF9pSEatkaEFPdd?=
 =?us-ascii?Q?0dyBzsXuH2SwM5iP25gAKo4TVO7krOQ0wvFWK9qTOi9UsH+spFPSnySYrJ/9?=
 =?us-ascii?Q?kNRWoxcbYQn5BwnqCHVTJhQJqRLuEKQa9hQdyfF/Ppd7yzetb/v7869lX7NG?=
 =?us-ascii?Q?wOctO0tDin/XYekY5LS+EbPcWuEUJn21aSBjLbF3SQ5dWCresOFGXoDfBUbX?=
 =?us-ascii?Q?N8inw64+SpZAlChmw16eYGnGnXw6zhE+wbtiZB4f/gA6hwuwmlzlwwDNNBOC?=
 =?us-ascii?Q?i0LRdz1GL0U5JUDSkzNTxQqA6WzgKINOxzI9TSN0grmwzfK8rDeRrfRUe6Ro?=
 =?us-ascii?Q?isUxcvHIt42kAoSGAuiCYu0laBmShl7WgJUMCgBM61SJFqeXnMSCsD6fNlUd?=
 =?us-ascii?Q?7ySRIolVY3d6kkGvsqMB8MQ2oahD1hLkubfCpW7mYfm5Zuh7hlC7EE8IidGO?=
 =?us-ascii?Q?QnMzr+0SZZlVuBU1xiCsTQHMI/1r3QSuhHgkZKVjunOQFqcVLlgw1Iq8cf/K?=
 =?us-ascii?Q?fiYTQd+7AuO45cBCLSBzoAb3LorhIR1FsjbmM+ZDHoJoZoi4YaQHCoAxTMh4?=
 =?us-ascii?Q?DtxpqZURRHzv+urX1qLohO5KuOHEP+mH+/ZHMTk0ZOTF6LyK4HnJx5KmTq11?=
 =?us-ascii?Q?zYq0fLt+Bqo1I9EaNaE0uwIKFhW5Lj8yJSNblbsxN0ZtcyKGAffy57hgghUQ?=
 =?us-ascii?Q?45E3ASmYlAxHyfPnStAISrDM5eqVB3HTCDwdvtWP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8359d44-60ca-471e-8ad0-08dde4da3f8f
X-MS-Exchange-CrossTenant-AuthSource: SA3SPRMB0011.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 19:53:38.6057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHspAXaZs4MZGF7fzaOSE0o9jjxkadZNmO01FhbQCY7nwPLPlN4yMQXAAcr7zm82ERwvBKtuO/bDPLPeIagr6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9828
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

The gitlab repository previously associated with
the nouveau module has fallen out of use. The
drm-misc tree here:

https://gitlab.freedesktop.org/drm/misc/kernel.git

Is now where most nouveau-related patches are
applied. This change updates the MAINTAINERS file
to reflect this.

Signed-off-by: James Jones <jajones@nvidia.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3f1c4af3f8e0..f94e115a8d32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7820,7 +7820,7 @@ Q:	https://patchwork.freedesktop.org/project/nouveau/
 Q:	https://gitlab.freedesktop.org/drm/nouveau/-/merge_requests
 B:	https://gitlab.freedesktop.org/drm/nouveau/-/issues
 C:	irc://irc.oftc.net/nouveau
-T:	git https://gitlab.freedesktop.org/drm/nouveau.git
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/nouveau/
 F:	include/uapi/drm/nouveau_drm.h
 
-- 
2.50.1

