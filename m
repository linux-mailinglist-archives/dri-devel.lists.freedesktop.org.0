Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8D6965824
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 09:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2758410E824;
	Fri, 30 Aug 2024 07:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="rrZsoGPj";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rrZsoGPj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4B110E62E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:20:58 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cl+88vJBs4HXXwRzFJkXS2EEsriIDcWBVyz2Ag5QFPZy3RbsRu8WdivQwk/6aJ4PdrlABy8oIfL98N0NJ2y4Z2QyWw3u7NSUXKXZ75ukcKhFpfQtH3hyE8jzIId4xaCtIFJ25ahP+JZi1T1/7VDzQKGK4ExZlN4T6Ij3WgT15b1DJuDKf5sH77T2Sf4kzp5WF7jyl7opKdl9kZ2ZOO5ub9r+nFPcc5k77aRUcx80NXj5KSZi3CwORlBci2QZ4lwyOxhkf46g3FFCx1ZZV2xBFJa1Hh/EDbozT3PvVj6Ee0eY3W9l0wDTNezEOfyXdEsngTURr1vcPa5eM2m4esd6pA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0k9NVxE5LX3jGRcLjg5D+saJC+P2D6zZKRNUnyZpuQ=;
 b=JqwQKIzcmymmzHubTqjvODjeskacOsjX1XWgBp4MSW2lGRFFfQz2kZpPnOXLEsbmRm1EkzHsFJwGsE1ig+jNBuPP5w25EL05Y3/BK0r1XBGT+08AemMpc60jJk2mYP9uIE+vOue6isYUrXIBXdhopie+yHLh7VCMOYrqivpLbvcSaE+3u9HmVoCnO9eDHqw2ur7Rk2CA92GQoTyqcro7rJwnHm01ZPxYxnhswOfPE5GCmjA9GYsZXZkYeB/ZhRmZQK/qCmfO8qQo9WhDRWtEOSQSN0J3zhLmNivsQ16zy9O3rzCkN/IXLzYmm5Sn2a00n2a70YPmcFUEyPrS015KQw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0k9NVxE5LX3jGRcLjg5D+saJC+P2D6zZKRNUnyZpuQ=;
 b=rrZsoGPjTeqgwazFoqsIn2tkOyDyAZqHwYQ5sACP6PIi2xMuEx8vyZ5Fbk96qpjzWD4jJSOwyFZ5rC8upMnOtIvO7Yth+PLjw9wcBR94Gya0hSx8AmcscXhUN3RDPBUUOrJ9/GrX6UNLyp3FBy4UiIvAd2eznPpdfgd1bKPAEoE=
Received: from DBBPR09CA0010.eurprd09.prod.outlook.com (2603:10a6:10:c0::22)
 by DBBPR08MB10819.eurprd08.prod.outlook.com (2603:10a6:10:53a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Thu, 29 Aug
 2024 10:20:52 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:c0:cafe::aa) by DBBPR09CA0010.outlook.office365.com
 (2603:10a6:10:c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20 via Frontend
 Transport; Thu, 29 Aug 2024 10:20:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 29 Aug 2024 10:20:51 +0000
Received: ("Tessian outbound bc251c670828:v403");
 Thu, 29 Aug 2024 10:20:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dace276c30686136
X-CR-MTA-TID: 64aa7808
Received: from La424c04fb085.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7375C9BD-4F74-4E14-8ED0-61E3CD6DEBE9.1; 
 Thu, 29 Aug 2024 10:20:45 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 La424c04fb085.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Aug 2024 10:20:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4o4ok83yE9K246Fhq2e51dOo9D2gMbDLeiYtpvUNPginrJ0XcmemOM5Dp+dKI/i2r8rd7KNBdAezRUvx1T6a+vF4dqxFNgnebPkF+ME14g5R6ZVxkuiFUVkGoHymzzJwkJE6RyjrmEp7Kg1ewy49A6zNqVlsG9wcTR/QWUoedO8SvqM2vGN+wHrq32b1x1YNqfFe/CB4YLJaS0LmNQZg+pPGnJxQRBvARMd63rL7+XpQIB1rdaJw6l72XEyOKgcmd6dG2Isqc1gl3/qS0abvFH/m32vpufCAn3J+q3DxhPMT7l9zP2ejQA8I3Lf8sj4E9HeoVLBk2YGP3s5cBOgqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0k9NVxE5LX3jGRcLjg5D+saJC+P2D6zZKRNUnyZpuQ=;
 b=xgJ9qnn0SFLBlWFzWRX8W0sJ+vcWWB8s4CRLAb/n/Qp1OHuiSqgLsDQlyQvHnVZ6TPwymMKzXe4Ei1lxONEg8oJ0lhcvz2J8JqCzENG+WlegYL4xQ1XLv0TpQUi5hnbMiozxRwYa4VzAA3O0gjuH6IXbvS10tm9lfYqwjFnmoh4+Pq+D9ZGZumX5G76xTomxE/pqPHxXjx7YC9xN+MSvppogMmiwFDQBUwyIhtC1ph4A7gQoS1F9XcIo3wANKdzvTfO0Fy4ZqSczeOmYrwmLsKTVczMh1TbDcC9h04qLQ6C9TzEr4Wm86522d7wPNRLvO2yPLDXy3aMUSiiIdISBqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0k9NVxE5LX3jGRcLjg5D+saJC+P2D6zZKRNUnyZpuQ=;
 b=rrZsoGPjTeqgwazFoqsIn2tkOyDyAZqHwYQ5sACP6PIi2xMuEx8vyZ5Fbk96qpjzWD4jJSOwyFZ5rC8upMnOtIvO7Yth+PLjw9wcBR94Gya0hSx8AmcscXhUN3RDPBUUOrJ9/GrX6UNLyp3FBy4UiIvAd2eznPpdfgd1bKPAEoE=
Received: from DUZP191CA0046.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::15)
 by AS8PR08MB8157.eurprd08.prod.outlook.com (2603:10a6:20b:54e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Thu, 29 Aug
 2024 10:20:42 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::ac) by DUZP191CA0046.outlook.office365.com
 (2603:10a6:10:4f8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20 via Frontend
 Transport; Thu, 29 Aug 2024 10:20:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 10:20:42 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 10:20:41 +0000
Received: from e122338.kfn.arm.com (10.50.2.57) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server id 15.1.2507.39 via Frontend Transport;
 Thu, 29 Aug 2024 10:20:40 +0000
From: Yulia Garbovich <yulia.garbovich@arm.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <liviu.dudau@arm.com>, <rosen.zhelev@arm.com>, <nd@arm.com>, Yulia Garbovich
 <yulia.garbovich@arm.com>
Subject: [PATCH] drm: drm_fourcc: adding 10/12/14 bit formats
Date: Thu, 29 Aug 2024 13:20:38 +0300
Message-ID: <20240829102038.2274242-1-yulia.garbovich@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8D:EE_|AS8PR08MB8157:EE_|DB1PEPF000509E8:EE_|DBBPR08MB10819:EE_
X-MS-Office365-Filtering-Correlation-Id: 752c0902-9440-420c-f122-08dcc8144265
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?cnSDlFhXzQwwBuND+N3sNqvmjPwHp7IQyn9HIhB4Czdd7XiBXb9AvQZeXER2?=
 =?us-ascii?Q?M35ZkQ+4IybZqN/VD+EIvNvsf2op5E7JugOgHNmhzaI0XYRq+1uA8XN+L8nt?=
 =?us-ascii?Q?kYGG5b8+ZWP8VyWMEBH4CwV5R7cpZTXZTTQNDywy+SdY1w1USb/EHM57EeOT?=
 =?us-ascii?Q?Or9hijDi4L1z1UeOv4vZz/yg3bR7dx2kgvcbwxgCKoMgNeMoTVdHIQn/gUIA?=
 =?us-ascii?Q?K34flwi2pTlp3FnE0VBQedp+TQOdC8hrGUnDvAFjjZdM2Jm1rXR040k1SFwC?=
 =?us-ascii?Q?GcchJmQD/HmLJdRVoH03b6j10/KsptAV5X1z59HbTxiceowfiQvu8iApnJhW?=
 =?us-ascii?Q?PggBjE4tjkQWPEMQWTqFtZl+pyFq+Q/YN5Fpbpf+LBvglwSrTo71YAzC1YKq?=
 =?us-ascii?Q?7T55y/G5kuzR8wkkKvoRMi3MJqQ6irrvRG3tO2NcfS11XgqZMiBzo+WqMT6o?=
 =?us-ascii?Q?Yuhc4yYcNYRzabX8jte1+hPTDWV4xzZbvxsgvQRZVUxJALlU9NQE99CKKSEI?=
 =?us-ascii?Q?xnIpdxhByYsIpC4SxvaSrOCQQgJTBK/HYEIdNEdldgWwUOu5J0qlOKUaP76J?=
 =?us-ascii?Q?77q5nKo/PmCZ3PBJ3EISu2fT2OF8O5RzC7oja68wZHedbiN6a20MrruHSLrD?=
 =?us-ascii?Q?AEd/zCUPLWBRqmG7PtFnv83yCHpCs1M8NGslgGHJSAnF2dbNPoXIedXVFTI5?=
 =?us-ascii?Q?XHxr843dmsLiFQCteI9yqeOtgKSWJkz8ObOjdfppwqTdXwTEHIZGxqkNaX6h?=
 =?us-ascii?Q?We5oHh9jRrZJjI1w7yyLkNRSlXkT8fnj1LNqdTNBzGU4qkuHrfngWCtHq4dq?=
 =?us-ascii?Q?Toy//ERFpiK6HkFuBtPyPWxp6M+9LWojCotbKXrMXaCEF+N85ik993Oz6bTI?=
 =?us-ascii?Q?HzgZenW+o0cRw4KRSBCwlci1TVLHwzZsuaxlAGGPbeUil8YypCOkE50EOJGV?=
 =?us-ascii?Q?hFYZu9jxYd6vz98O6IV2IelmIMVf+oHcTV2SHwOG3ovrUVp7RqsRZ8WK2dUQ?=
 =?us-ascii?Q?Nd/Kvl6gtyJB79j9FIVxA4LmuWsFuXviIEU4W77FqGMKowAWgNHYVr5QNt5l?=
 =?us-ascii?Q?nddeQ0LdJaXFwdhlx3hP8jvBhCR5lfR2CLGbTICoRzUdDxmDTLIL9rHRhyuk?=
 =?us-ascii?Q?p2xfi1aO/YbdPxZFfDZbfbCvu4Hv7VwLJVxaU9pV6IL+KQ1oItV0aU9rdvJm?=
 =?us-ascii?Q?8BklJpg2RbKJMw1qWHt2Itvl2+rKQNcoKS4emVoAaCJnxB7vrGK0PtFX9IHO?=
 =?us-ascii?Q?ej/4v0v19aNd57Ks1NMbou0b4W3EnTANirHQBiK8uLrrWn/m1RLpO5/2sPtz?=
 =?us-ascii?Q?tbf8nGkiQM5RJkFmr7CayRzATlRC42DXXOxEOWhEKDGOFrbEzfDeq0ufruwD?=
 =?us-ascii?Q?e0CtUd+miPC3vBHdWoZ6B3vEjts6EQNr1mw1cLRHsI6kAfMgJPM6+oY/JRwH?=
 =?us-ascii?Q?uc5Z4YYVlBPyszGULk6ufE0EEuDYEg3Y?=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE; SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8157
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:4f8::15];
 domain=DUZP191CA0046.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 14ead515-6646-4aac-22d4-08dcc8143cf5
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|35042699022|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SHobqMvAuxRbLXPVavtIM4Iwtzr5EgyK/CyJ9j1irSRYDTNVpnfUWbzfq8PH?=
 =?us-ascii?Q?zfLAY8D5zz+8ab8T+ZHrPN2nOfY/YkM8RzSVf15W2H6hXxPTXUaD92wf8jkO?=
 =?us-ascii?Q?rIubzSQZPgSsg+In0pF3YYWnjv1s3s7sAHM4crzy4He4l3OoviKG3W59wFzd?=
 =?us-ascii?Q?WuXaP6VmkiJ0DxuCOMRfkTMC3rst/bSdRtlX4QCz80a5n0r4EP9JhZcOT/wp?=
 =?us-ascii?Q?4QpgoVBQ7suSdp89A7odpEXoFlZFXUUPFlM1ownFVGyD4QTRuYhC/4bFhHI3?=
 =?us-ascii?Q?QKIb5cr/mNdR164bpAQsOnywMUjc5mKRAGf5ZlntTQzYaN7r7ew6rtbbw7ta?=
 =?us-ascii?Q?wGHmcglGBdc4toxhFnPAOLKJB3WwJbRH7A+DGNJHdstd/YraV2WdALFYCbLp?=
 =?us-ascii?Q?yrK4o1dkfr9t2BhUA1UwSVCo5ymk2kl+pYQ/DWyhl31q9qpSbslAIpJjyg4q?=
 =?us-ascii?Q?UgqB07Yxbg2l0ekg0Mg94dtgZ5JseWGVBQ/xah0ctRi/mV5Tf0Ba76chWAF5?=
 =?us-ascii?Q?vGyEKNwVfsznwh8REt2UGfBthGLWkX0Wg4yCz1CVM+x5H0ZGP7HFMHTaHzHU?=
 =?us-ascii?Q?TdJmKlKiOSnkZrpokEMieCVns5xKg//C9i0b4H45GUMd7nKH8XPOgwO1Cavt?=
 =?us-ascii?Q?I6WsfqO/mnIk2pXILAa5n1gxPbF9haFl4c8jNQdPkoYQYeQUvnHchOu3n2Qi?=
 =?us-ascii?Q?oAnsQHZNHsPTGlb0XZm/ZnIJ9BRdfKgyQcS5KzyKv8ugx7yYkT9+8CNHuSoN?=
 =?us-ascii?Q?fHqlxamxjiwlDNetTDstC55sP76OUwDJjEINGwo6/fAcnDOY+7SAXCER7RTF?=
 =?us-ascii?Q?IbkyeLv+Hn0zuJalvMLNnQ5IUn9CUFJucYmdd7ad8woco/psux/TJRBzXPFx?=
 =?us-ascii?Q?Sc8OwVPSUv+lX3f6QwbJoHu9k96g7rMOlwGd1RD/pdVn1zblAqIOboviAdaL?=
 =?us-ascii?Q?wOCf9JFGf+EivBJQM7t9s4JEimZZhgPjrLSwpzla/OmJDPpBOKMrj6U+gpAo?=
 =?us-ascii?Q?ImqICTJVTKvmih9m3ViZROncUNMCx5tMmi/zA7UvpCnK+cO2Byo7sPe2S2OQ?=
 =?us-ascii?Q?QtlS26YExt320yQpo2iInJINHnwfhKU3AwKzPMNFGOoV58lM/BBpKv1MbhCC?=
 =?us-ascii?Q?yGuZHtU2jTVQAs5vEI3jAX4mxg46/gQgpjqcL31InvZnwfoXM451iEeGj7QG?=
 =?us-ascii?Q?uuqq11Uym0UbcR5TEvaMU8s4AZeKKGFYDd2MZtRXqgIxPl+b+kuqVvy49ZcN?=
 =?us-ascii?Q?kc8iXj2EzMK/bg+eVEu9SEB9oOx5pDpNucuabpiHs6WPs+1h8sITEfFxoDYE?=
 =?us-ascii?Q?Oy2UsDLNtnhsgx2SGD1hMx0caupLm5eQVgK7Ob+HXi/ZOeDtM/VV9oI7vfE7?=
 =?us-ascii?Q?FQkKtMqVQdCJ3SEbek6JMDCmwvyE8qM1U+fTpa6wiYyX7M4PgM8g0zCJDnFW?=
 =?us-ascii?Q?kuDFFrx9g3uZYiwonipOIoohJiI4NBf7?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(36860700013)(35042699022)(82310400026)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 10:20:51.8021 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 752c0902-9440-420c-f122-08dcc8144265
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10819
X-Mailman-Approved-At: Fri, 30 Aug 2024 07:15:39 +0000
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

Adding the following formats
     - DRM_FORMAT_RX106
     - DRM_FORMAT_GXRX106106
     - DRM_FORMAT_RX124
     - DRM_FORMAT_GXRX124124
     - DRM_FORMAT_AXBXGXRX124124124124
     - DRM_FORMAT_RX142
     - DRM_FORMAT_GXRX142142
     - DRM_FORMAT_AXBXGXRX142142142142

They are useful for communicating Bayer data between ISPs and GPU by emulating GL_R16UI and GL_RG16UI formats
Signed-off-by: Yulia Garbovich <yulia.garbovich@arm.com>
---
 drivers/gpu/drm/drm_fourcc.c  |  8 +++++
 include/uapi/drm/drm_fourcc.h | 61 +++++++++++++++++++++++++++++++++--
 2 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 193cf8ed7912..cd5f467edfeb 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -170,6 +170,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_R8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_R10,		.depth = 10, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_R12,		.depth = 12, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_RX106,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_RX124,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_RX142,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_RGB332,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_BGR233,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_XRGB4444,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
@@ -200,6 +203,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_XBGR8888,	.depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_RGBX8888,	.depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_BGRX8888,	.depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_GXRX106106,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_GXRX124124,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_GXRX142142,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_RGB565_A8,	.depth = 24, .num_planes = 2, .cpp = { 2, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_BGR565_A8,	.depth = 24, .num_planes = 2, .cpp = { 2, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_XRGB2101010,	.depth = 30, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
@@ -219,6 +225,8 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_ARGB16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_ABGR16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_AXBXGXRX106106106106, .depth = 0, .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
+		{ .format = DRM_FORMAT_AXBXGXRX124124124124, .depth = 0, .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
+		{ .format = DRM_FORMAT_AXBXGXRX142142142142, .depth = 0, .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_XRGB16161616,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_XBGR16161616,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_ARGB16161616,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 84d502e42961..30d0f4b6247a 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -146,6 +146,24 @@ extern "C" {
 /* 12 bpp Red (direct relationship between channel value and brightness) */
 #define DRM_FORMAT_R12		fourcc_code('R', '1', '2', ' ') /* [15:0] x:R 4:12 little endian */
 
+/*
+ * 1-component 16 bpp format that has a 10-bit R component in the top 10 bits of the word
+ * in bytes 0..1 with the bottom 6 bits of the word unused
+ */
+#define DRM_FORMAT_RX106	fourcc_code('R', '0', '1', '0') /* [15:0] R:x 10:6 */
+
+/*
+ * 1-component 16 bpp format that has a 12-bit R component in the top 12 bits of the word
+ * in bytes 0..1 with the bottom 4 bits of the word unused
+ */
+#define DRM_FORMAT_RX124	fourcc_code('R', '0', '1', '2') /* [15:0] R:x 12:4 */
+
+/*
+ * 1-component 16 bpp format that has a 14-bit R component in the top 14 bits of the word
+ * in bytes 0..1 with the bottom 2 bits of the word unused
+ */
+#define DRM_FORMAT_RX142	fourcc_code('R', '0', '1', '4') /* [15:0] R:x 14:2 */
+
 /* 16 bpp Red (direct relationship between channel value and brightness) */
 #define DRM_FORMAT_R16		fourcc_code('R', '1', '6', ' ') /* [15:0] R little endian */
 
@@ -157,6 +175,27 @@ extern "C" {
 #define DRM_FORMAT_RG1616	fourcc_code('R', 'G', '3', '2') /* [31:0] R:G 16:16 little endian */
 #define DRM_FORMAT_GR1616	fourcc_code('G', 'R', '3', '2') /* [31:0] G:R 16:16 little endian */
 
+ /*
+ * 2-component  32bpp  format that has a 10-bit R component in the top 10 bits of the word
+ * in bytes 0..1, and a 10-bit G component in the top 10 bits of the word in bytes 2..3,
+ * with the bottom 6 bits of each word unused.
+ */
+#define DRM_FORMAT_GXRX106106	fourcc_code('G', 'R', '1', '0') /* [31:0] G:x:R:x 10:6:10:6 */
+
+/*
+ * 2-component  32bpp  format that has a 12-bit R component in the top 12 bits of the word
+ * in bytes 0..1, and a 12-bit G component in the top 12 bits of the word in bytes 2..3,
+ * with the bottom 4 bits of each word unused.
+ */
+#define DRM_FORMAT_GXRX124124	fourcc_code('G', 'R', '1', '2') /* [31:0] G:x:R:x 12:4:12:4 */
+
+/*
+ * 2-component  32bpp  format that has a 14-bit R component in the top 14 bits of the word
+ * in bytes 0..1, and a 14-bit G component in the top 14 bits of the word in bytes 2..3,
+ * with the bottom 2 bits of each word unused.
+ */
+#define DRM_FORMAT_GXRX142142	fourcc_code('G', 'R', '1', '4') /* [31:0] G:x:R:x 14:2:14:2 */
+
 /* 8 bpp RGB */
 #define DRM_FORMAT_RGB332	fourcc_code('R', 'G', 'B', '8') /* [7:0] R:G:B 3:3:2 */
 #define DRM_FORMAT_BGR233	fourcc_code('B', 'G', 'R', '8') /* [7:0] B:G:R 2:3:3 */
@@ -229,11 +268,29 @@ extern "C" {
 #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
 /*
- * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
- * of unused padding per component:
+ * 4-component, 64bpp format that has a 10-bit R component in the top 10 bits of the word in bytes 0..1,
+ * a 10-bit G component in the top 10 bits of the word in bytes 2..3, a 10-bit B component in the top 10 bits of the word
+ * in bytes 4..5, and a 10-bit A component in the top 10 bits of the word in bytes 6..7,
+ * with the bottom 6 bits of each word unused.
  */
 #define DRM_FORMAT_AXBXGXRX106106106106 fourcc_code('A', 'B', '1', '0') /* [63:0] A:x:B:x:G:x:R:x 10:6:10:6:10:6:10:6 little endian */
 
+/*
+ * 4-component, 64bpp format that has a 12-bit R component in the top 12bits of the word in bytes 0..1,
+ * a 12-bit G component in the top 12 bits of the word in bytes 2..3, a 12-bit B component in the top 12 bits of the word
+ * in bytes 4..5, and a 12-bit A component in the top 12 bits of the word in bytes 6..7,
+ * with the bottom 4 bits of each word unused.
+ */
+#define DRM_FORMAT_AXBXGXRX124124124124	fourcc_code('A', 'B', '1', '2') /* [63:0] A:x:B:x:G:x:R:x 12:4:12:4:12:4:12:4 */
+
+/*
+ * 4-component, 64bpp format that has a 14-bit R component in the top 14 bits of the word in bytes 0..1,
+ * a 14-bit G component in the top 14 bits of the word in bytes 2..3, a 14-bit B component in the top 14 bits of the word
+ * in bytes 4..5, and a 14-bit A component in the top 14 bits of the word in bytes 6..7,
+ * with the bottom 2 bits of each word unused.
+ */
+#define DRM_FORMAT_AXBXGXRX142142142142	fourcc_code('A', 'B', '1', '4') /* [63:0] A:x:B:x:G:x:R:x 14:2:14:2:14:2:14:2 */
+
 /* packed YCbCr */
 #define DRM_FORMAT_YUYV		fourcc_code('Y', 'U', 'Y', 'V') /* [31:0] Cr0:Y1:Cb0:Y0 8:8:8:8 little endian */
 #define DRM_FORMAT_YVYU		fourcc_code('Y', 'V', 'Y', 'U') /* [31:0] Cb0:Y1:Cr0:Y0 8:8:8:8 little endian */
-- 
2.34.1

