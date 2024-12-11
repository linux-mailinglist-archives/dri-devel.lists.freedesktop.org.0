Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BA29ED2BC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 17:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049C510EBBB;
	Wed, 11 Dec 2024 16:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Bb2evrXD";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Bb2evrXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44DF10EBC2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 16:51:25 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nnsryV8jupNF5myHKaB9g+SD3yRFDimjufPqLipDqOh7/WIElgBwSj5SNUzIwcnHLfO5uI6hLEmTCpqaj12ViYCjAiJ3Pq44/XDle/17vlCIoAjs5Q2bGxkdV5PwY8w0rMJWWGomU4aTcSPjVlwMH4zbzq88DyhzKXG858H48/1HEfFtKQnbyXdWeTp0LtKmnmaZuIxDNffp3Hkvhx2GID89V2Mev8LAxaDuT+Szsnsd4kkDq7ZQyfNf9ErLTR6z3DIGWXgwVCt/M8J9WHZQD2omy/OyMXIZG54wYpiYVTcTBuvL6Nfz6lVneRVE9fK989soPnP9RZ+g8BY/2t109w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZuRX+eUV6aIwFRo4Jc2T3cXWMzxDhQduw5WQ3Mm9EU=;
 b=BSXaPmm4EQOTZvKiad/Upmb8aLGuVTRsdJUViX7X+sQEaInQlmRN384MpD5QpV7VqOj7MpfQdnu1P4dOtiS5pJ6k+WY8R5eqZZ+rcjojQRvDNn0d2AGj3G2P4o4jY5beYIy5TgXeF8o9JzX9MEFmViR4ocPN355xjOiyGwynHMFjrrTwNnazkeRBbpIC/S47OmLzB11sxABGyVVk6dsoSvtGwuJTTFvbthQjqwdDByMW+8MFUu1GwqC+AD3+ZyShMmzLQ3gf34OiInYbJJDz/05blvMmPm2YhV3knR6CAd11XbCcHT15XOKhk5SKFyyDrLTZeHdFhJf5zW7KmOCGIg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZuRX+eUV6aIwFRo4Jc2T3cXWMzxDhQduw5WQ3Mm9EU=;
 b=Bb2evrXD1qw1DKeSRAzVITnWnKPAo2alR45Ollzkm5WmHhYxmrdFBFe2RcE8rpOgCp0haeJgObU6KftPh3j/p2pkJ34yn4xmcdzDYFjLqGWENC4gkTg6x+DDgMHNtr5MLbdTjif11Ovle/TIdAsBVSLKvf5D0uFW9IlV9eEcNYQ=
Received: from AS9PR0301CA0019.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::29) by GV1PR08MB7345.eurprd08.prod.outlook.com
 (2603:10a6:150:20::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 16:51:16 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:20b:468:cafe::d2) by AS9PR0301CA0019.outlook.office365.com
 (2603:10a6:20b:468::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via Frontend Transport; Wed,
 11 Dec 2024 16:51:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 11 Dec 2024 16:51:16 +0000
Received: ("Tessian outbound 2d228e31de9a:v524");
 Wed, 11 Dec 2024 16:51:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7264bd6342dbc3ec
X-TessianGatewayMetadata: /ZD/i4uMS2m2bTcn5403529Z8gtSYuYgnzwSa5tdkE3zoVyRw6wqn2PpzSmgZSzLdN53VmoHnjZepKb2xoKFWW51+nEYu3/hynctHZ6s1JBUsYAItHWtegQbbEcUUGdsNroC9n1n2fNor0MB6CHOnLFxKfQy/t2sG6AI27ejRGw=
X-CR-MTA-TID: 64aa7808
Received: from Ld853ad558fcb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4DAAD5A8-5FFB-40D0-B08C-B43E21D8230F.1; 
 Wed, 11 Dec 2024 16:51:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld853ad558fcb.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Dec 2024 16:51:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obj4/R5EUpv6AJzU77+HYKRrEmRzKcqQngfjHdGy42Tvmv6azrfFMwAPaJKxvmpgO/LCziPT0WfISUMJ+OT3SVlzl5snLgSVscK9E4j02Q/k2RsoM+ucPmTAEZmuJDj40kxwht79fFWLlqZkdb49Hy7j+YWYnxjuuAAlv5Z/YuW1WqZW670HlQAPrG1aAe+hwF2PlHC+aa9hdWbkVGP9ZOOJ0n6rvxbVxasxKt7oZEE4dGy6W0FKp/YSuTt2V8No9VecLjErg3pv2qvBzDHEEieebw56dK3w43RwF4scH5jMxmuR76VItsZy1Kwmuq6qcw+PHwhYQ17gf52Jt5E4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZuRX+eUV6aIwFRo4Jc2T3cXWMzxDhQduw5WQ3Mm9EU=;
 b=n2nDHpPU/BAMKvVn0sQ3jAsz8BV14FQbzXjEU6mmD2V+bJOVshYicCKE3N7klDYPukGVCL+vi+MQPmSgdZjtrhQYpr2zwHRqXPShoBKrVFHLPGda8txdTEfSv6tfK8/Yd4J2heEcjFeAMshcMkdo02e2cbWJYX4qsM1I5SgFakwvHAg/nvKLkXPw0+OBx+vArOIrzr6KUznMSCJyDF71SCCXRUqJJTl3i4Oumy3DeP/tcr65Kk98KthJ1eQYo+zPzr8N/RVmDOZ6JHl+6dms2aVTmC6wnUnNPcoIL/kizsaYBDV+YKtBvlErHivojkj7O2/F9knGZAsdCFfU1H140Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZuRX+eUV6aIwFRo4Jc2T3cXWMzxDhQduw5WQ3Mm9EU=;
 b=Bb2evrXD1qw1DKeSRAzVITnWnKPAo2alR45Ollzkm5WmHhYxmrdFBFe2RcE8rpOgCp0haeJgObU6KftPh3j/p2pkJ34yn4xmcdzDYFjLqGWENC4gkTg6x+DDgMHNtr5MLbdTjif11Ovle/TIdAsBVSLKvf5D0uFW9IlV9eEcNYQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3317.eurprd08.prod.outlook.com (2603:10a6:209:42::28)
 by DU0PR08MB8422.eurprd08.prod.outlook.com (2603:10a6:10:406::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 16:50:59 +0000
Received: from AM6PR08MB3317.eurprd08.prod.outlook.com
 ([fe80::e42a:494c:6581:1897]) by AM6PR08MB3317.eurprd08.prod.outlook.com
 ([fe80::e42a:494c:6581:1897%7]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 16:50:59 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [RFC v2 5/8] drm/panthor: Introduce sampling sessions to handle
 userspace clients
Date: Wed, 11 Dec 2024 16:50:21 +0000
Message-Id: <20241211165024.490748-6-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211165024.490748-1-lukas.zapolskas@arm.com>
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0082.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::15) To AM6PR08MB3317.eurprd08.prod.outlook.com
 (2603:10a6:209:42::28)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3317:EE_|DU0PR08MB8422:EE_|AMS1EPF0000004B:EE_|GV1PR08MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf19867-1f72-4707-c1b0-08dd1a040774
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?iVueNGWKsox5QPfdG+byGGBOn8+YhLWd64zWCU19koXM4lRlUqN1xS+Z2/Nw?=
 =?us-ascii?Q?jSuqHqFwXvgck2+69wUzoWMXEYqJGorXGCpEZcdxxZ6MpLwt3z5nO7cNfq7p?=
 =?us-ascii?Q?zqqEGrnbhLiRWF9xFHB+BeVtGY+DDC5yuqmTCUWAnuRT2wNjw5GUjKPmCAz1?=
 =?us-ascii?Q?shbyXB3EGsH8gfY3b+pBplYSwrqN02ybF6m3UgXBBz/2AM0wcgjC54UScIYL?=
 =?us-ascii?Q?NtAbsMXIwjIMoPlxac6ARtuFDjKk5CL7Gy+5KwqHThihFNXmVGghM4TFCfIr?=
 =?us-ascii?Q?cdDAUxlbcZaVxoE0uyVReb9U77yCPDbGSbPCXtIRUU85iqo3i2fcaPtwI5GH?=
 =?us-ascii?Q?g5lWc/SuAeV28AYP6k4OF1pcP2giXaz/7AqLkpfnwjB8AkhvqwSolQ8AQJRC?=
 =?us-ascii?Q?+JFo54kCWp49VaEqfWO0s+3xkSBu8+ChE2vEC67gyS8aztvmQN99sT3pMbe0?=
 =?us-ascii?Q?QAXt2RllFVLcdo9cJrrGEo2iLPfyrQefpWNU5hOE54ably/3m0OWls+Jcsix?=
 =?us-ascii?Q?tYQ1hNd/kAHqxsBlb4G+Ppz5qbWNH/NhINycblo8QKEFFSbmplnwPrXCBanX?=
 =?us-ascii?Q?GQXO/PYvb6WpZA4/P/6P7PzkS00q3oBcfpTw2LzkX+zG+57p0tSAGYdWg2nd?=
 =?us-ascii?Q?h75e+qw3/r5piBgRaZ3mmofxJmPAz1yrUo6LiVrtLePwvHEY0vQtZkbKHkzu?=
 =?us-ascii?Q?+TKF0/Atrvsi7RRxWX2SNzx76TjVCfzO9IerQRkcEGhaKgcFLiEFAo3a4EKW?=
 =?us-ascii?Q?DMKd/iGS0pQ9+z18r2VRntYn5sTA+iqczfJFdm90bm5Z/AIIfxtXsrJRTXOv?=
 =?us-ascii?Q?2f1Njk9H2QRaOIxCtNnQSQwY5JQxl7bDwWFjvRbKHtnu7aqiiqUxASXjyqDi?=
 =?us-ascii?Q?fwMrL01TNEsEZ0J6TvCxW0g8ZtIwO/s5ldIr44Kb43vLS5wrgZcsuFk/PlNp?=
 =?us-ascii?Q?CntGT9E3JTq89QRrse19NY5vGqbolh/lL8cOQVmg1LYmoDBKfcizDEehSllO?=
 =?us-ascii?Q?yynJHfGNlg4Sjfl0btJSD5YfF7WIF8pppwoZaBODllQOa6/lpkEW/UUT44n3?=
 =?us-ascii?Q?h+jZX+PqyefQ0ULTFyI5IeQHQgBA31WYWLfvlXW/Gl46b01Co8boPmMNQtA7?=
 =?us-ascii?Q?6+uM1vkVU/JDPpPcWa2WoB7Vm9iubBxED+nii2sRPO9oan3zNoJRBDami17Y?=
 =?us-ascii?Q?xJPVXS6mfEgskwQ0EpyO4gIZlPp3BrJsjrli9zzbUSd5ojCtNq6vdCZjNko5?=
 =?us-ascii?Q?Pa70fN1YVqSXSrhIlwvwShsw2WRBJM5B1kT8uYE3U8qr+5oWUCsFpL6Up6rt?=
 =?us-ascii?Q?eI3rH1jhmdjIOe9zjtoPY9VPPH1bC3173CgxlEAF+k8uYg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3317.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8422
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:209:42::28];
 domain=AM6PR08MB3317.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2b8dc574-f29b-488f-3699-08dd1a03fd56
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|14060799003|36860700013|376014|30052699003|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4q/q2U2l6VV0IuWVKnpwsQXQKWGksmwzixnEMwk7Td4Q0/6U1A5SGM2WhlFN?=
 =?us-ascii?Q?Frb7gjPQBC2GjZZ1H3CdBS9RyRnxRTBHGY0dtEyuCf7fsz2RHgxV79O+4AhD?=
 =?us-ascii?Q?HKY3DDcwNtemQj7RgH6bUXP9og9vQX2SusLdaGtfuPDVRVfkqdNYAFqw0ii0?=
 =?us-ascii?Q?EJSLdHQL/2w+4klOG1wtxW8T4Vpv1i7ba1RtKxPmQrodu3/L4XdVyimDbmTH?=
 =?us-ascii?Q?GwrCC2NarlwD9B7vCWwL5wgHNtIyiptDdyBChh01CzjLMm4GGbXjQpwMH5kD?=
 =?us-ascii?Q?069/BxX9rpLnfTM5ToRjsCORkfE59xmQJzvqSqCkr9CKKQUYz6SUuMUtqpVe?=
 =?us-ascii?Q?/2opuriRp+PYdYb9+5djbXc3xUR+zK03d9l10AbRKN//bQl1lWOU/fTXQKY6?=
 =?us-ascii?Q?osw38f/P7hwevBFNEaqLtEegqIz5A8DFt01ECQd7iaUjfH8CojH4bio6ezC3?=
 =?us-ascii?Q?7uIgWdmMpqiZ3d0GXNI0RVPUO5H0+2lAHewOoFJzIJM9AsNLRZRsP6GUXOG8?=
 =?us-ascii?Q?QcMmNTNOMtldcV5TmD+klUqr0ZT8+ueIlvWijKhxaH7lT0TWQzDZr6iWExTS?=
 =?us-ascii?Q?tONiw7X0+5bQEGwse+au60z5AFmKPU0iHTB+wUmooekB2R52ahpIqUvmBZoE?=
 =?us-ascii?Q?r/jYe9rAd/h+N37DnJNfka87CbXOtho5OGT9fjwXhRzkO2QmArKMqWIjU613?=
 =?us-ascii?Q?F3Fxn7XiQR4xADZ1/cVHM+EdoLYr0O4wN0hgTLh+p4Jt7XUcZ7q4NtWGRsaG?=
 =?us-ascii?Q?bPseu67nvvfKmGDPhmIOeIm73rqJlXs0PD2ebcPRuJTnnRyyb1foCaTQnJRO?=
 =?us-ascii?Q?hTd/72wG9huSwElElMjZHOEF9nXR4V0mjXaF8W9Q7BngnCFKi2pNhuYmetVE?=
 =?us-ascii?Q?9uMaaqxG62osWzh/ANu3fHluxeo8HAVj/syAvgRAYxmWwCRYh29PEElQ7dWX?=
 =?us-ascii?Q?3nMr8TNKlJejbWDReNd+axnozDjb7nz4MJpGGyRlkqUInUkXP+DwIVX7M5kS?=
 =?us-ascii?Q?sMU2j6rNRdTa9rXZqC6FcThhFvVciSf8WAV/JPNPYvZXLKEV4gSOrvIHJ6ER?=
 =?us-ascii?Q?+/k8USYcq1p+8gSdFeIZfb5vvGCU0aCotp37GJS9tXx9WPvkq9WKpTZAuanm?=
 =?us-ascii?Q?jh/Xy7GiPHcGlVLw/5kwW6ZvrhRyVOCkPto2S+u3xO0kF/3jhelOMyqYQTRd?=
 =?us-ascii?Q?5era6OoeeJ7btiT7AXxjS6dRUAKRh3fRhW9jqnLEoFw67LHDpALzSdUeXMXy?=
 =?us-ascii?Q?Ib4q2saXQbQ+/WFGGNo3P6D1W0x32tnU+3qbAsSrXFhJJFiFV1KSGw1tlCSX?=
 =?us-ascii?Q?Up7yBjmx5cepNmTyMljFtDMa6AGG3hQPRrKCj3k2cBsMAJQgFITUbfPwku3T?=
 =?us-ascii?Q?1R5RDVEivB3JbDfgy1kuFBhbvx5wd7xiYvymQYPneIlOJl8MM+ZgVeXexBgN?=
 =?us-ascii?Q?D6PfEkJzF5OFyITfjaC+/fI9KNU28YJO/er6DWpqBk7kt65J9zyvBQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(1800799024)(14060799003)(36860700013)(376014)(30052699003)(35042699022)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 16:51:16.2668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf19867-1f72-4707-c1b0-08dd1a040774
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7345
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

To allow for combining the requests from multiple userspace clients, an
intermediary layer between the HW/FW interfaces and userspace is
created, containing the information for the counter requests and
tracking of insert and extract indices. Each session starts inactive and
must be explicitly activated via PERF_CONTROL.START, and explicitly
stopped via PERF_CONTROL.STOP. Userspace identifies a single client with
its session ID and the panthor file it is associated with.

The SAMPLE and STOP commands both produce a single sample when called,
and these samples can be disambiguated via the opaque user data field
passed in the PERF_CONTROL uAPI. If this functionality is not desired,
these fields can be kept as zero, as the kernel copies this value into
the corresponding sample without attempting to interpret it.

Currently, only manual sampling sessions are supported, providing
samples when userspace calls PERF_CONTROL.SAMPLE, and only a single
session is allowed at a time. Multiple sessions and periodic sampling
will be enabled in following patches.

No protected is provided against the 32-bit hardware counter overflows,
so for the moment it is up to userspace to ensure that the counters are
sampled at a reasonable frequency.

The counter set enum is added to the uapi to clarify the restrictions on
calling the interface.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.h |   3 +
 drivers/gpu/drm/panthor/panthor_drv.c    |   1 +
 drivers/gpu/drm/panthor/panthor_perf.c   | 697 ++++++++++++++++++++++-
 include/uapi/drm/panthor_drm.h           |  50 +-
 4 files changed, 732 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index aca33d03036c..9ed1e9aed521 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -210,6 +210,9 @@ struct panthor_file {
 	/** @ptdev: Device attached to this file. */
 	struct panthor_device *ptdev;
 
+	/** @drm_file: Corresponding drm_file */
+	struct drm_file *drm_file;
+
 	/** @vms: VM pool attached to this file. */
 	struct panthor_vm_pool *vms;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 458175f58b15..2848ab442d10 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1505,6 +1505,7 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 	}
 
 	pfile->ptdev = ptdev;
+	pfile->drm_file = file;
 
 	ret = panthor_vm_pool_create(pfile);
 	if (ret)
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index 6498279ec036..42d8b6f8c45d 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -3,16 +3,162 @@
 /* Copyright 2024 Arm ltd. */
 
 #include <drm/drm_file.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/panthor_drm.h>
 
+#include <linux/circ_buf.h>
+#include <linux/iosys-map.h>
+#include <linux/pm_runtime.h>
+
 #include "panthor_device.h"
 #include "panthor_fw.h"
 #include "panthor_gpu.h"
 #include "panthor_perf.h"
 #include "panthor_regs.h"
 
+/**
+ * PANTHOR_PERF_EM_BITS - Number of bits in a user-facing enable mask. This must correspond
+ *                        to the maximum number of counters available for selection on the newest
+ *                        Mali GPUs (128 as of the Mali-Gx15).
+ */
+#define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
+
+/**
+ * enum panthor_perf_session_state - Session state bits.
+ */
+enum panthor_perf_session_state {
+	/** @PANTHOR_PERF_SESSION_ACTIVE: The session is active and can be used for sampling. */
+	PANTHOR_PERF_SESSION_ACTIVE = 0,
+
+	/**
+	 * @PANTHOR_PERF_SESSION_OVERFLOW: The session encountered an overflow in one of the
+	 *                                 counters during the last sampling period. This flag
+	 *                                 gets propagated as part of samples emitted for this
+	 *                                 session, to ensure the userspace client can gracefully
+	 *                                 handle this data corruption.
+	 */
+	PANTHOR_PERF_SESSION_OVERFLOW,
+
+	/** @PANTHOR_PERF_SESSION_MAX: Bits needed to represent the state. Must be last.*/
+	PANTHOR_PERF_SESSION_MAX,
+};
+
+struct panthor_perf_enable_masks {
+	/**
+	 * @link: List node used to keep track of the enable masks aggregated by the sampler.
+	 */
+	struct list_head link;
+
+	/** @refs: Number of references taken out on an instantiated enable mask. */
+	struct kref refs;
+
+	/**
+	 * @mask: Array of bitmasks indicating the counters userspace requested, where
+	 *        one bit represents a single counter. Used to build the firmware configuration
+	 *        and ensure that userspace clients obtain only the counters they requested.
+	 */
+	DECLARE_BITMAP(mask, PANTHOR_PERF_EM_BITS)[DRM_PANTHOR_PERF_BLOCK_MAX];
+};
+
+struct panthor_perf_counter_block {
+	struct drm_panthor_perf_block_header header;
+	u64 counters[];
+};
+
+struct panthor_perf_session {
+	DECLARE_BITMAP(state, PANTHOR_PERF_SESSION_MAX);
+
+	/**
+	 * @user_sample_size: The size of a single sample as exposed to userspace. For the sake of
+	 *                    simplicity, the current implementation exposes the same structure
+	 *                    as provided by firmware, after annotating the sample and the blocks,
+	 *                    and zero-extending the counters themselves (to account for in-kernel
+	 *                    accumulation).
+	 *
+	 *                    This may also allow further memory-optimizations of compressing the
+	 *                    sample to provide only requested blocks, if deemed to be worth the
+	 *                    additional complexity.
+	 */
+	size_t user_sample_size;
+
+	/**
+	 * @sample_freq_ns: Period between subsequent sample requests. Zero indicates that
+	 *                  userspace will be responsible for requesting samples.
+	 */
+	u64 sample_freq_ns;
+
+	/** @sample_start_ns: Sample request time, obtained from a monotonic raw clock. */
+	u64 sample_start_ns;
+
+	/**
+	 * @user_data: Opaque handle passed in when starting a session, requesting a sample (for
+	 *             manual sampling sessions only) and when stopping a session. This handle
+	 *             allows the disambiguation of a sample in the ringbuffer.
+	 */
+	u64 user_data;
+
+	/**
+	 * @eventfd: Event file descriptor context used to signal userspace of a new sample
+	 *           being emitted.
+	 */
+	struct eventfd_ctx *eventfd;
+
+	/**
+	 * @enabled_counters: This session's requested counters. Note that these cannot change
+	 *                    for the lifetime of the session.
+	 */
+	struct panthor_perf_enable_masks *enabled_counters;
+
+	/** @ringbuf_slots: Slots in the user-facing ringbuffer. */
+	size_t ringbuf_slots;
+
+	/** @ring_buf: BO for the userspace ringbuffer. */
+	struct drm_gem_object *ring_buf;
+
+	/**
+	 * @control_buf: BO for the insert and extract indices.
+	 */
+	struct drm_gem_object *control_buf;
+
+	/**
+	 * @extract_idx: The extract index is used by userspace to indicate the position of the
+	 *               consumer in the ringbuffer.
+	 */
+	u32 *extract_idx;
+
+	/**
+	 * @insert_idx: The insert index is used by the kernel to indicate the position of the
+	 *              latest sample exposed to userspace.
+	 */
+	u32 *insert_idx;
+
+	/** @samples: The mapping of the @ring_buf into the kernel's VA space. */
+	u8 *samples;
+
+	/**
+	 * @waiting: The list node used by the sampler to track the sessions waiting for a sample.
+	 */
+	struct list_head waiting;
+
+	/**
+	 * @pfile: The panthor file which was used to create a session, used for the postclose
+	 *         handling and to prevent a misconfigured userspace from closing unrelated
+	 *         sessions.
+	 */
+	struct panthor_file *pfile;
+
+	/**
+	 * @ref: Session reference count. The sample delivery to userspace is asynchronous, meaning
+	 *       the lifetime of the session must extend at least until the sample is exposed to
+	 *       userspace.
+	 */
+	struct kref ref;
+};
+
+
 struct panthor_perf {
 	/**
 	 * @block_set: The global counter set configured onto the HW.
@@ -63,39 +209,154 @@ void panthor_perf_info_init(struct panthor_device *ptdev)
 	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
 }
 
-int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
-		struct drm_panthor_perf_cmd_setup *setup_args,
-		struct panthor_file *pfile)
+static struct panthor_perf_enable_masks *panthor_perf_em_new(void)
 {
-	return -EOPNOTSUPP;
+	struct panthor_perf_enable_masks *em = kmalloc(sizeof(*em), GFP_KERNEL);
+
+	if (!em)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&em->link);
+
+	kref_init(&em->refs);
+
+	return em;
 }
 
-int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf,
-		u32 sid)
+static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panthor_perf_cmd_setup
+		*setup_args)
 {
-	return -EOPNOTSUPP;
+	struct panthor_perf_enable_masks *em = panthor_perf_em_new();
+
+	if (IS_ERR_OR_NULL(em))
+		return em;
+
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_FW],
+			setup_args->fw_enable_mask, PANTHOR_PERF_EM_BITS);
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_CSG],
+			setup_args->csg_enable_mask, PANTHOR_PERF_EM_BITS);
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_CSHW],
+			setup_args->cshw_enable_mask, PANTHOR_PERF_EM_BITS);
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_TILER],
+			setup_args->tiler_enable_mask, PANTHOR_PERF_EM_BITS);
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_MEMSYS],
+			setup_args->memsys_enable_mask, PANTHOR_PERF_EM_BITS);
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_SHADER],
+			setup_args->shader_enable_mask, PANTHOR_PERF_EM_BITS);
+
+	return em;
 }
 
-int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
-		u32 sid, u64 user_data)
+static void panthor_perf_destroy_em_kref(struct kref *em_kref)
 {
-	return -EOPNOTSUPP;
+	struct panthor_perf_enable_masks *em = container_of(em_kref, typeof(*em), refs);
+
+	if (!list_empty(&em->link))
+		return;
+
+	kfree(em);
 }
 
-int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
-		u32 sid, u64 user_data)
+static size_t get_annotated_block_size(size_t counters_per_block)
 {
-		return -EOPNOTSUPP;
+	return struct_size_t(struct panthor_perf_counter_block, counters, counters_per_block);
 }
 
-int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
-		u32 sid, u64 user_data)
+static u32 session_read_extract_idx(struct panthor_perf_session *session)
+{
+	/* Userspace will update their own extract index to indicate that a sample is consumed
+	 * from the ringbuffer, and we must ensure we read the latest value.
+	 */
+	return smp_load_acquire(session->extract_idx);
+}
+
+static u32 session_read_insert_idx(struct panthor_perf_session *session)
+{
+	return *session->insert_idx;
+}
+
+static void session_get(struct panthor_perf_session *session)
+{
+	kref_get(&session->ref);
+}
+
+static void session_free(struct kref *ref)
+{
+	struct panthor_perf_session *session = container_of(ref, typeof(*session), ref);
+
+	if (session->samples) {
+		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->samples);
+
+		drm_gem_vunmap_unlocked(session->ring_buf, &map);
+		drm_gem_object_put(session->ring_buf);
+	}
+
+	if (session->insert_idx && session->extract_idx) {
+		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->extract_idx);
+
+		drm_gem_vunmap_unlocked(session->control_buf, &map);
+		drm_gem_object_put(session->control_buf);
+	}
+
+	kref_put(&session->enabled_counters->refs, panthor_perf_destroy_em_kref);
+	eventfd_ctx_put(session->eventfd);
+
+	devm_kfree(session->pfile->ptdev->base.dev, session);
+}
+
+static void session_put(struct panthor_perf_session *session)
+{
+	kref_put(&session->ref, session_free);
+}
+
+/**
+ * session_find - Find a session associated with the given session ID and
+ *                panthor_file.
+ * @pfile: Panthor file.
+ * @perf: Panthor perf.
+ * @sid: Session ID.
+ *
+ * The reference count of a valid session is increased to ensure it does not disappear
+ * in the window between the XA lock being dropped and the internal session functions
+ * being called.
+ *
+ * Return: valid session pointer or an ERR_PTR.
+ */
+static struct panthor_perf_session *session_find(struct panthor_file *pfile,
+		struct panthor_perf *perf, u32 sid)
 {
-	return -EOPNOTSUPP;
+	struct panthor_perf_session *session;
 
+	if (!perf)
+		return ERR_PTR(-EINVAL);
+
+	xa_lock(&perf->sessions);
+	session = xa_load(&perf->sessions, sid);
+
+	if (!session || xa_is_err(session)) {
+		xa_unlock(&perf->sessions);
+		return ERR_PTR(-EBADF);
+	}
+
+	if (session->pfile != pfile) {
+		xa_unlock(&perf->sessions);
+		return ERR_PTR(-EINVAL);
+	}
+
+	session_get(session);
+	xa_unlock(&perf->sessions);
+
+	return session;
 }
 
-void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf) { }
+static size_t session_get_max_sample_size(const struct drm_panthor_perf_info *const info)
+{
+	const size_t block_size = get_annotated_block_size(info->counters_per_block);
+	const size_t block_nr = info->cshw_blocks + info->csg_blocks + info->fw_blocks +
+		info->tiler_blocks + info->memsys_blocks + info->shader_blocks;
+
+	return sizeof(struct drm_panthor_perf_sample_header) + (block_size * block_nr);
+}
 
 /**
  * panthor_perf_init - Initialize the performance counter subsystem.
@@ -130,6 +391,399 @@ int panthor_perf_init(struct panthor_device *ptdev)
 	ptdev->perf = perf;
 
 	return 0;
+
+}
+
+static int session_validate_set(u8 set)
+{
+	if (set > DRM_PANTHOR_PERF_SET_TERTIARY)
+		return -EINVAL;
+
+	if (set == DRM_PANTHOR_PERF_SET_PRIMARY)
+		return 0;
+
+	if (set > DRM_PANTHOR_PERF_SET_PRIMARY)
+		return capable(CAP_PERFMON) ? 0 : -EACCES;
+
+	return -EINVAL;
+}
+
+/**
+ * panthor_perf_session_setup - Create a user-visible session.
+ *
+ * @ptdev: Handle to the panthor device.
+ * @perf: Handle to the perf control structure.
+ * @setup_args: Setup arguments passed in via ioctl.
+ * @pfile: Panthor file associated with the request.
+ *
+ * Creates a new session associated with the session ID returned. When initialized, the
+ * session must explicitly request sampling to start with a successive call to PERF_CONTROL.START.
+ *
+ * Return: non-negative session identifier on success or negative error code on failure.
+ */
+int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
+		struct drm_panthor_perf_cmd_setup *setup_args,
+		struct panthor_file *pfile)
+{
+	struct panthor_perf_session *session;
+	struct drm_gem_object *ringbuffer;
+	struct drm_gem_object *control;
+	const size_t slots = setup_args->sample_slots;
+	struct panthor_perf_enable_masks *em;
+	struct iosys_map rb_map, ctrl_map;
+	size_t user_sample_size;
+	int session_id;
+	int ret;
+
+	ret = session_validate_set(setup_args->block_set);
+	if (ret)
+		return ret;
+
+	session = devm_kzalloc(ptdev->base.dev, sizeof(*session), GFP_KERNEL);
+	if (ZERO_OR_NULL_PTR(session))
+		return -ENOMEM;
+
+	ringbuffer = drm_gem_object_lookup(pfile->drm_file, setup_args->ringbuf_handle);
+	if (!ringbuffer) {
+		ret = -EINVAL;
+		goto cleanup_session;
+	}
+
+	control = drm_gem_object_lookup(pfile->drm_file, setup_args->control_handle);
+	if (!control) {
+		ret = -EINVAL;
+		goto cleanup_ringbuf;
+	}
+
+	user_sample_size = session_get_max_sample_size(&ptdev->perf_info) * slots;
+
+	if (ringbuffer->size != PFN_ALIGN(user_sample_size)) {
+		ret = -ENOMEM;
+		goto cleanup_control;
+	}
+
+	ret = drm_gem_vmap_unlocked(ringbuffer, &rb_map);
+	if (ret)
+		goto cleanup_control;
+
+
+	ret = drm_gem_vmap_unlocked(control, &ctrl_map);
+	if (ret)
+		goto cleanup_ring_map;
+
+	session->eventfd = eventfd_ctx_fdget(setup_args->fd);
+	if (IS_ERR_OR_NULL(session->eventfd)) {
+		ret = PTR_ERR_OR_ZERO(session->eventfd) ?: -EINVAL;
+		goto cleanup_control_map;
+	}
+
+	em = panthor_perf_create_em(setup_args);
+	if (IS_ERR_OR_NULL(em)) {
+		ret = -ENOMEM;
+		goto cleanup_eventfd;
+	}
+
+	INIT_LIST_HEAD(&session->waiting);
+	session->extract_idx = ctrl_map.vaddr;
+	*session->extract_idx = 0;
+	session->insert_idx = session->extract_idx + 1;
+	*session->insert_idx = 0;
+
+	session->samples = rb_map.vaddr;
+
+	/* TODO This will need validation when we support periodic sampling sessions */
+	if (setup_args->sample_freq_ns) {
+		ret = -EOPNOTSUPP;
+		goto cleanup_em;
+	}
+
+	session->sample_freq_ns = setup_args->sample_freq_ns;
+	session->user_sample_size = user_sample_size;
+	session->enabled_counters = em;
+	session->ring_buf = ringbuffer;
+	session->control_buf = control;
+	session->pfile = pfile;
+
+	ret = xa_alloc_cyclic(&perf->sessions, &session_id, session, perf->session_range,
+			&perf->next_session, GFP_KERNEL);
+	if (ret < 0)
+		goto cleanup_em;
+
+	kref_init(&session->ref);
+
+	return session_id;
+
+cleanup_em:
+	kref_put(&em->refs, panthor_perf_destroy_em_kref);
+
+cleanup_eventfd:
+	eventfd_ctx_put(session->eventfd);
+
+cleanup_control_map:
+	drm_gem_vunmap_unlocked(control, &ctrl_map);
+
+cleanup_ring_map:
+	drm_gem_vunmap_unlocked(ringbuffer, &rb_map);
+
+cleanup_control:
+	drm_gem_object_put(control);
+
+cleanup_ringbuf:
+	drm_gem_object_put(ringbuffer);
+
+cleanup_session:
+	devm_kfree(ptdev->base.dev, session);
+
+	return ret;
+}
+
+static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *session,
+		u64 user_data)
+{
+	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
+		return 0;
+
+	const u32 extract_idx = session_read_extract_idx(session);
+	const u32 insert_idx = session_read_insert_idx(session);
+
+	/* Must have at least one slot remaining in the ringbuffer to sample. */
+	if (WARN_ON_ONCE(!CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots)))
+		return -EBUSY;
+
+	session->user_data = user_data;
+
+	clear_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
+
+	/* TODO Calls to the FW interface will go here in later patches. */
+	return 0;
+}
+
+static int session_start(struct panthor_perf *perf, struct panthor_perf_session *session,
+		u64 user_data)
+{
+	if (test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
+		return 0;
+
+	set_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
+
+	/*
+	 * For manual sampling sessions, a start command does not correspond to a sample,
+	 * and so the user data gets discarded.
+	 */
+	if (session->sample_freq_ns)
+		session->user_data = user_data;
+
+	/* TODO Calls to the FW interface will go here in later patches. */
+	return 0;
+}
+
+static int session_sample(struct panthor_perf *perf, struct panthor_perf_session *session,
+		u64 user_data)
+{
+	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
+		return -EACCES;
+
+	const u32 extract_idx = session_read_extract_idx(session);
+	const u32 insert_idx = session_read_insert_idx(session);
+
+	/* Manual sampling for periodic sessions is forbidden. */
+	if (session->sample_freq_ns)
+		return -EINVAL;
+
+	/*
+	 * Must have at least two slots remaining in the ringbuffer to sample: one for
+	 * the current sample, and one for a stop sample, since a stop command should
+	 * always be acknowledged by taking a final sample and stopping the session.
+	 */
+	if (CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots) < 2)
+		return -EBUSY;
+
+	session->sample_start_ns = ktime_get_raw_ns();
+	session->user_data = user_data;
+
+	/* TODO Calls to the FW interface will go here in later patches. */
+	return 0;
+}
+
+static int session_destroy(struct panthor_perf *perf, struct panthor_perf_session *session)
+{
+	session_put(session);
+
+	return 0;
+}
+
+static int session_teardown(struct panthor_perf *perf, struct panthor_perf_session *session)
+{
+	if (test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
+		return -EINVAL;
+
+	if (!list_empty(&session->waiting))
+		return -EBUSY;
+
+	return session_destroy(perf, session);
+}
+
+/**
+ * panthor_perf_session_teardown - Teardown the session associated with the @sid.
+ * @pfile: Open panthor file.
+ * @perf: Handle to the perf control structure.
+ * @sid: Session identifier.
+ *
+ * Destroys a stopped session where the last sample has been explicitly consumed
+ * or discarded. Active sessions will be ignored.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf, u32 sid)
+{
+	int err;
+	struct panthor_perf_session *session;
+
+	xa_lock(&perf->sessions);
+	session = __xa_store(&perf->sessions, sid, NULL, GFP_KERNEL);
+
+	if (xa_is_err(session)) {
+		err = xa_err(session);
+		goto restore;
+	}
+
+	if (session->pfile != pfile) {
+		err = -EINVAL;
+		goto restore;
+	}
+
+	session_get(session);
+	xa_unlock(&perf->sessions);
+
+	err = session_teardown(perf, session);
+
+	session_put(session);
+
+	return err;
+
+restore:
+	__xa_store(&perf->sessions, sid, session, GFP_KERNEL);
+	xa_unlock(&perf->sessions);
+
+	return err;
+}
+
+/**
+ * panthor_perf_session_start - Start sampling on a stopped session.
+ * @pfile: Open panthor file.
+ * @perf: Handle to the panthor perf control structure.
+ * @sid: Session identifier for the desired session.
+ * @user_data: An opaque value passed in from userspace.
+ *
+ * A session counts as stopped when it is created or when it is explicitly stopped after being
+ * started. Starting an active session is treated as a no-op.
+ *
+ * The @user_data parameter will be associated with all subsequent samples for a periodic
+ * sampling session and will be ignored for manual sampling ones in favor of the user data
+ * passed in the PERF_CONTROL.SAMPLE ioctl call.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data)
+{
+	struct panthor_perf_session *session = session_find(pfile, perf, sid);
+	int err;
+
+	if (IS_ERR_OR_NULL(session))
+		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
+
+	err = session_start(perf, session, user_data);
+
+	session_put(session);
+
+	return err;
+}
+
+/**
+ * panthor_perf_session_stop - Stop sampling on an active session.
+ * @pfile: Open panthor file.
+ * @perf: Handle to the panthor perf control structure.
+ * @sid: Session identifier for the desired session.
+ * @user_data: An opaque value passed in from userspace.
+ *
+ * A session counts as active when it has been explicitly started via the PERF_CONTROL.START
+ * ioctl. Stopping a stopped session is treated as a no-op.
+ *
+ * To ensure data is not lost when sampling is stopping, there must always be at least one slot
+ * available for the final automatic sample, and the stop command will be rejected if there is not.
+ *
+ * The @user_data will always be associated with the final sample.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data)
+{
+	struct panthor_perf_session *session = session_find(pfile, perf, sid);
+	int err;
+
+	if (IS_ERR_OR_NULL(session))
+		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
+
+	err = session_stop(perf, session, user_data);
+
+	session_put(session);
+
+	return err;
+}
+
+/**
+ * panthor_perf_session_sample - Request a sample on a manual sampling session.
+ * @pfile: Open panthor file.
+ * @perf: Handle to the panthor perf control structure.
+ * @sid: Session identifier for the desired session.
+ * @user_data: An opaque value passed in from userspace.
+ *
+ * Only an active manual sampler is permitted to request samples directly. Failing to meet either
+ * of these conditions will cause the sampling request to be rejected. Requesting a manual sample
+ * with a full ringbuffer will see the request being rejected.
+ *
+ * The @user_data will always be unambiguously associated one-to-one with the resultant sample.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data)
+{
+	struct panthor_perf_session *session = session_find(pfile, perf, sid);
+	int err;
+
+	if (IS_ERR_OR_NULL(session))
+		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
+
+	err = session_sample(perf, session, user_data);
+
+	session_put(session);
+
+	return err;
+}
+
+/**
+ * panthor_perf_session_destroy - Destroy a sampling session associated with the @pfile.
+ * @perf: Handle to the panthor perf control structure.
+ * @pfile: The file being closed.
+ *
+ * Must be called when the corresponding userspace process is destroyed and cannot close its
+ * own sessions. As such, we offer no guarantees about data delivery.
+ */
+void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf)
+{
+	unsigned long sid;
+	struct panthor_perf_session *session;
+
+	xa_for_each(&perf->sessions, sid, session)
+	{
+		if (session->pfile == pfile) {
+			session_destroy(perf, session);
+			xa_erase(&perf->sessions, sid);
+		}
+	}
 }
 
 /**
@@ -146,10 +800,17 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
 	if (!perf)
 		return;
 
-	if (!xa_empty(&perf->sessions))
+	if (!xa_empty(&perf->sessions)) {
+		unsigned long sid;
+		struct panthor_perf_session *session;
+
 		drm_err(&ptdev->base,
 				"Performance counter sessions active when unplugging the driver!");
 
+		xa_for_each(&perf->sessions, sid, session)
+			session_destroy(perf, session);
+	}
+
 	xa_destroy(&perf->sessions);
 
 	devm_kfree(ptdev->base.dev, ptdev->perf);
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 8a431431da6b..576d3ad46e6d 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -458,6 +458,12 @@ enum drm_panthor_perf_block_type {
 
 	/** @DRM_PANTHOR_PERF_BLOCK_SHADER: A shader core counter block. */
 	DRM_PANTHOR_PERF_BLOCK_SHADER,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_LAST: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_LAST = DRM_PANTHOR_PERF_BLOCK_SHADER,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_MAX: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_MAX = DRM_PANTHOR_PERF_BLOCK_LAST + 1,
 };
 
 /**
@@ -1368,6 +1374,44 @@ struct drm_panthor_perf_control {
 	__u64 pointer;
 };
 
+/**
+ * enum drm_panthor_perf_counter_set - The counter set to be requested from the hardware.
+ *
+ * The hardware supports a single performance counter set at a time, so requesting any set other
+ * than the primary may fail if another process is sampling at the same time.
+ *
+ * If in doubt, the primary counter set has the most commonly used counters and requires no
+ * additional permissions to open.
+ */
+enum drm_panthor_perf_counter_set {
+	/**
+	 * @DRM_PANTHOR_PERF_SET_PRIMARY: The default set configured on the hardware.
+	 *
+	 * This is the only set for which all counters in all blocks are defined.
+	 */
+	DRM_PANTHOR_PERF_SET_PRIMARY,
+
+	/**
+	 * @DRM_PANTHOR_PERF_SET_SECONDARY: The secondary performance counter set.
+	 *
+	 * Some blocks may not have any defined counters for this set, and the block will
+	 * have the UNAVAILABLE block state permanently set in the block header.
+	 *
+	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
+	 */
+	DRM_PANTHOR_PERF_SET_SECONDARY,
+
+	/**
+	 * @DRM_PANTHOR_PERF_SET_TERTIARY: The tertiary performance counter set.
+	 *
+	 * Some blocks may not have any defined counters for this set, and the block will have
+	 * the UNAVAILABLE block state permanently set in the block header. Note that the
+	 * tertiary set has the fewest defined counter blocks.
+	 *
+	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
+	 */
+	DRM_PANTHOR_PERF_SET_TERTIARY,
+};
 
 /**
  * struct drm_panthor_perf_cmd_setup - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
@@ -1375,13 +1419,17 @@ struct drm_panthor_perf_control {
  */
 struct drm_panthor_perf_cmd_setup {
 	/**
-	 * @block_set: Set of performance counter blocks.
+	 * @block_set: Set of performance counter blocks, member of
+	 *             enum drm_panthor_perf_block_set.
 	 *
 	 * This is a global configuration and only one set can be active at a time. If
 	 * another client has already requested a counter set, any further requests
 	 * for a different counter set will fail and return an -EBUSY.
 	 *
 	 * If the requested set does not exist, the request will fail and return an -EINVAL.
+	 *
+	 * Some sets have additional requirements to be enabled, and the setup request will
+	 * fail with an -EACCES if these requirements are not satisfied.
 	 */
 	__u8 block_set;
 
-- 
2.25.1

