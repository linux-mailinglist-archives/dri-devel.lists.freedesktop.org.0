Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F91A77F70
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8D810E606;
	Tue,  1 Apr 2025 15:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="OnZAAlld";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OnZAAlld";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2043.outbound.protection.outlook.com [40.107.104.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86CC10E603
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 15:49:03 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xIQd4igO0PKC8lEiIOinUIhyCHXpgH09I+mzvCrwPAyFzb2YNfX+yqyEMoRC+l5bSOTDHgO+4El6wt6RwpXtjoqrjC3Nemrgg3lyOsnViQj4Sy8r+eo62txhNEYf3gNS3MVeKe88S5RIdYS0BICFO6LD0pn6CyQ1iKLH0fzqEsFhTXUbiLzngoflo0TC33Ps7J8yzMk/WP78mBotNbJOPCQ57w8RP71KYSc3tsQ0Rgcaz0+0OVu4VmORQMLKKsEXrwAYyuotCWxF70DrY5cEM1NXP6bau3SAPc7T1Ybx12RReQLAsNaAnMfUu7wO8pHFq7Jwqth3cijURPa8orf8LQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvTmlLFGFBXELu+Vla4RX6T96PC61Jm/CYBH+45OSJ8=;
 b=Px7PjkXLLFK5DPkqzR+2ZnaxGPZJaPq8406xxG1+WRgHPz3trfQetBZjd01Ekugjkk8fXK5s9gk3nwFUkM48rjPO4cK/t8tRyv70TkxdmHLSenlZhYirfep4FSxph04BzinwHsNogGFCucCYW71AVcZaeVxq5bYWnSSlycxwHG7n4G48rMY9SL+9K4ENi7Ni9xjH9peSYhqCJvkv9yHymI63+JefGJ51WDiYokHqSL0UqcKzKQR5SlZSTguyJMXsQAfoicWbBGy/dMgnTywRaZt6rMSy109VRO2Y2cAJ2f2mzqdTzJP7idug70TDQKB9j2ox9Ijw0etNmVdlwFT9lg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvTmlLFGFBXELu+Vla4RX6T96PC61Jm/CYBH+45OSJ8=;
 b=OnZAAlld4PaDEkZ21jBCUrZQjfj0kwJv9A6j+NGRxw1oB0pNTigEVnzQMpbhJvm1Y4s4d3tT3+FlIFdg+NdGLD5Pc1JSnP7ZKhvlZXk6dk3CsuI3790unu902l2NJkhGKZOdun2LOZ2i2Urb4ylcwn2f11FYNCEVCZW5yd09SVA=
Received: from AS9PR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::28) by DB5PR08MB10216.eurprd08.prod.outlook.com
 (2603:10a6:10:4a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:48:58 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:540:cafe::d9) by AS9PR01CA0015.outlook.office365.com
 (2603:10a6:20b:540::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.39 via Frontend Transport; Tue,
 1 Apr 2025 15:49:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 1 Apr 2025 15:48:58 +0000
Received: ("Tessian outbound eb3c789b7dfa:v604");
 Tue, 01 Apr 2025 15:48:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7dd1ecdedb246179
X-TessianGatewayMetadata: vFCsPqN8ugEg4uIN2s7M04GkcpuDo58kKuxLYsoxecjnElJym7hcZgqwrBRW2jb7Xvi8x+cqg0MgEZsHZyIiEVNbmzFSxpXWsmYefZW0y3xrsXf3Je7YI5hHRFOYEIthCHALQv0Bd4bkqFGgFDqfU5WrcAe9deRF8aUOwZ/f3DNjAZjIt+LBFJjVpb0DT0JnEEIris8aC1SZ/VwqLdx77Q==
X-CR-MTA-TID: 64aa7808
Received: from L44f6bdaecad9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A5567325-4CDA-4DC1-884E-CCA9F47B57B7.1; 
 Tue, 01 Apr 2025 15:48:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L44f6bdaecad9.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Apr 2025 15:48:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3uuO3iObpV4ajbskJjGj3eiI5BU1cgqsngr+OQwV8vDnxsS8YzMIbog9NoJa+GNlQYiuQruplmzy0L/mXY10c4sOrYh8T5Z1tuo3xiSapMmCjehiWbF2NCaCnuoAHxUoU3LI43cepKgTLexqP0IlTTo4wPK1u/2S0XLXSTpdPRx4y+3WpvoqrMh0IxIKak6NJmTxrIIURzj7yHctuvXR0oyTgn5pnwIEVTUJ/6o31twIJqt0IwJZhPQZvQHazNOaXTwgFrGpLwHVKLEow+vO7OSRONNrPqK0FRcsBTxVpjyx6f1NH5tVLyZrzge9Wiq4GNeRlYYUNfH4To7DUZGRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvTmlLFGFBXELu+Vla4RX6T96PC61Jm/CYBH+45OSJ8=;
 b=r9Qtcn1da33oRYyOsamYGf9OQSvAtoe9JohuuwBhzbzZAdmPYMz02uqW4LYV+TZh2LsqTKIeuFnxwzan/U6oP6BNEp9mj8422t7/PZY3Bsw1pRks8olkBCyN+gzc8lhBDNpRQqxaintpvB5wX84NVX6r0nHqVpmnWou/n0D2BIUwiNc1I9lWkToZUo1fCj615dAYNB6Srnsf5K9hbxiBENko1DqUqvOvxZLqbCU2JatLmYSBVx4PG6qG2PifQ6tjanxTlSVx3QxkBeQoI4dmqlQtwT/TsnOqjCWuOFzjvrsBzgwbeNXQGluMwUFJ9zkglgshpbiJxrL+jxZAQ1rFaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvTmlLFGFBXELu+Vla4RX6T96PC61Jm/CYBH+45OSJ8=;
 b=OnZAAlld4PaDEkZ21jBCUrZQjfj0kwJv9A6j+NGRxw1oB0pNTigEVnzQMpbhJvm1Y4s4d3tT3+FlIFdg+NdGLD5Pc1JSnP7ZKhvlZXk6dk3CsuI3790unu902l2NJkhGKZOdun2LOZ2i2Urb4ylcwn2f11FYNCEVCZW5yd09SVA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU0PR08MB8279.eurprd08.prod.outlook.com (2603:10a6:10:40d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:48:43 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 15:48:43 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v3 4/7] drm/panthor: Introduce sampling sessions to handle
 userspace clients
Date: Tue,  1 Apr 2025 16:48:19 +0100
Message-Id: <b24aa8b8929cf6a53e897b18cb9c13075b2062fe.1743517880.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1743517880.git.lukas.zapolskas@arm.com>
References: <cover.1743517880.git.lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0250.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::12) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|DU0PR08MB8279:EE_|AMS1EPF0000004C:EE_|DB5PR08MB10216:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f83366e-d78a-40c3-4490-08dd7134b788
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?M711jmkWrXT8bukkSTbeg0kq4ymEQE7zaCWlmryt6R9vbVWthn64zCIuahlr?=
 =?us-ascii?Q?m/eVjwGhOM0rrMnEFlYO21tGbuC4uasUOTF+UbC6FmyG32Jrzd2FczmUdOO6?=
 =?us-ascii?Q?67II59tiuHpmWg6h/0J7enQ6XdnGMbPhFH49al5+zjt2ErGPGu0KMiqN7drt?=
 =?us-ascii?Q?hn37wtXIdfS0R2L7LjZpSFO/tfYlDVNhfwqOF7Lr3mo/GgZKdcDax3nlZmOh?=
 =?us-ascii?Q?Uwe1zk4wOyu9zcFgdzc+hVbJC5XMUxdur2MmFbd2hjvnnz6S0wHrcaEfWgU7?=
 =?us-ascii?Q?gaGDRyBuEyrA1wESIXweD4PvoS443XA/iQyorxPT6hssVeARmKY8Erz3jKYJ?=
 =?us-ascii?Q?wmYostB6wfesa2IxQbBgnGpaIoG3+NdVce7IHq5W7nsFUqc4rB60cOsUpHCX?=
 =?us-ascii?Q?1NngGFNH2pax3I1krzwjSNVNQN0VO8oBf4POS37CziW9Lzd2LxXoa28RNAV9?=
 =?us-ascii?Q?vyzVy5o2qPJGRIIZRgn3L+3e7d0dGR1z7hAylKqCNB7uNd1iWIy5h+3oMsKR?=
 =?us-ascii?Q?jWLsKSaLNkuPfAOk/ArfgmL1rgzq7v/OqJC2laMW7qzXEeRgm5D145LW1TWc?=
 =?us-ascii?Q?lh/iPV7+GgsUjc96Rukys6PLgW3R5ZxywbQiooM+UThQDrzIPIWkt9CeOtdZ?=
 =?us-ascii?Q?84u9bGplYjDHAOPyJvuyE60SSIIwSEWO320WMqKrOq6tLq966gZht4bPV3kE?=
 =?us-ascii?Q?pQoe25W8Ws5WWOo4+wiSf5g1upIQPeopfElbvJ0TMZrtvDVQtVrhBOGI0khW?=
 =?us-ascii?Q?8W+6qHKzxJtP+HmwgpY4F7B3mf1KvpZ0Jy+WH5/PyfjeAkGesODkgodbXAxa?=
 =?us-ascii?Q?U5V6Ox0hblytnCrDrtsON8SYRQUdS/hSH70VBO+4Dsmml0A2IH5v4yNjZcmn?=
 =?us-ascii?Q?cx/bn3vE2ecMPcIgMNHsqLLn87c2ylm7wmZcTi4v5hYIEimd/aYvwyYeGVvO?=
 =?us-ascii?Q?WwANauLrwiA/TJThLjo6sfIPy2t2s7qrbC1H1BeTVM5k0vB7TyN60x5yvtUy?=
 =?us-ascii?Q?V2Ng1yVyZRrdhGDPFkcuwG6g9edm84i7UJIv+QxazV1tkAcbbLSH0+Ek80hY?=
 =?us-ascii?Q?He31QUT1d+RGez/ewo5qynCyrpWYP0tOCYLHGFBdQqfFvhRavqvtfIBQFVAv?=
 =?us-ascii?Q?LFJmwmNx0cQknL+JoeFnwaoPdjKEg+3LgKmtEIbIIMbMGCp+aSoGpLWeRAHH?=
 =?us-ascii?Q?6FscFy/KAgGQtkaGn31deuKOt2n5ySBx8nsQgWyUmRDOHdDtKB6B6PBHkI96?=
 =?us-ascii?Q?M9aaE4VH8CWB+Lmq97oWE63JjeVY9ecuXITrx43tGY8o6+1LXTnIbPyRkjZF?=
 =?us-ascii?Q?g6txPeOeHM3Mu8nnppdxlMnJVo9N2cA/cC5NfJn/vHjqnG0+l0MnowF3AQhE?=
 =?us-ascii?Q?pSkcM7clVbZZ0KOuQb4S+NJVlBsCZkVXy2ay+ALIgnSO0Mc1odRLJnlOVOqZ?=
 =?us-ascii?Q?jVau4TzRgrM=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8279
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:5c::16];
 domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 01a195a9-cef7-4837-7423-08dd7134ae8f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|14060799003|376014|35042699022|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P5w+mY1MlX4xpr7w882Q7qEYo8s2Ea3sjCNrnxjeKSxwPsQeRZggi/raPufl?=
 =?us-ascii?Q?jcpkYTwsxmkbrvkylCdB0LRZr97Ajl+7Xaxk3lJQn8Y+RvQXY4aZD2afcJLi?=
 =?us-ascii?Q?0qf7CA0ueLy9+ZmHdZHvFbuBb+Ka6tLYlFD0+K0wFgVrRMI7n/j8/PCT/eE2?=
 =?us-ascii?Q?nzlfzrE5e1bH+1QuukEWEdwp+vVOelhsS/IpczfkE8SHsOKgU65lXu7BB0Ue?=
 =?us-ascii?Q?bOnbRJA13YttgtKybH0YUQujT7PYBhXwbnc4pIelYPUghP5WxHS0Ul1iWAiw?=
 =?us-ascii?Q?BGGDb21kBioNG64VnyccRCxaiQAeCLy/wztN5fqdQVu67FcIIlpuTVnRncHG?=
 =?us-ascii?Q?+Jqr7ol1gvh4eg83IGSvCpkx4N7nyJ0mMKOOZXK46jhtS6lok173j1JT9Oh5?=
 =?us-ascii?Q?OtK6Tz8LeZNEMpbznpymRsr6id8/9gpATmplba+e8epljopg/8QuHQPP7rmE?=
 =?us-ascii?Q?pV3i5YQWqhWc03vEqtvWVzrMH/iH6cu2zEra0C1uhWEpUZDi1JKVgu5PkBqM?=
 =?us-ascii?Q?87WTFecOSvwaP18fQi2HoVyWqXTu0LEA6h7HdqGBqGJyfGIFrnNv2XBF82pU?=
 =?us-ascii?Q?SWwo4P8arsY1SyrQ2rTp8sUTjKjUv9U3oP6Q6Naxz2VrozdXR8FYIuWZgpiI?=
 =?us-ascii?Q?2x+rFIysk7q7+dL3FGgV8qfQe6+Nu63GtdcRqesMQzAVkSg9TxmAOcOlDozx?=
 =?us-ascii?Q?4NIcgOAdK1vYVSXv0vUpPvPnBEllpYFpb5OHosez/QHm4XtmQyf+1tU9WomU?=
 =?us-ascii?Q?dIg9AUE6Gmw6LTnvFITAvV0gdxOIQdksGsGmf+bbI8h44StG9zJw7jVkkWx1?=
 =?us-ascii?Q?G+EmnEA3nFHqUAYA+e0RwBwrWsMqTMKRyD+mqy39XsFVj8tIT1M26srsLcwM?=
 =?us-ascii?Q?9EsZQanC5z+SdRRc1pxXyGre3L+1qOa9/dKvv8xM+31F/OmLdxqmbIgKGLHa?=
 =?us-ascii?Q?0l9qTGv/zXxSY/X+fbvb1JBjH3yfwaKe6W5UmwB0XF3kIuO0Y/e688ttmdvQ?=
 =?us-ascii?Q?BwiyYriXDBQuJ9T+cVyjPSpeezi+5jjFlOMEx8zdkPu34BG7Zq271lMkzMz7?=
 =?us-ascii?Q?BUsx2OaycQRY+/6/D4yqNAnl1Sj+gTT5nkhsS9fFHUfiIuMfDrPezfT0Kw5S?=
 =?us-ascii?Q?VS8ZmPghnVOAy4DoqcK9lmQokD/cfDE2hKAYPgR7j+/XfykiLugTxz+pCImG?=
 =?us-ascii?Q?fvWBnGFycG5f8QERigWGMAut+ZZeN2n3EAP9FGc9rebMXGEqaRnT48TPUkiD?=
 =?us-ascii?Q?kH4jS5GbC7nFSUqy6do2tHMD/Vjb+hO6jkQ+yZtA0PyO0fVdPvNo/Rud/0jM?=
 =?us-ascii?Q?VnbFV9rfBuVgdsQYsvwtCH2KDyPCR5bsFEp5WLr7v3V0/gzI+GEkkrK/m/z5?=
 =?us-ascii?Q?y37fqh//GVOI4Ut5l9kj4ugJdw5leVan2f9QlhSyjgiXSvHgEjvBglwQG1Nf?=
 =?us-ascii?Q?mC17JLG9NOJ2d/EumrHHslicxKmrpqLryBwyTa+DPqQKM9vhq47prq6xGCMX?=
 =?us-ascii?Q?lhjkkn5ZNxjbfqRZ73XQ/CO54TXmasowX1rQ?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(36860700013)(14060799003)(376014)(35042699022)(1800799024)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:48:58.7252 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f83366e-d78a-40c3-4490-08dd7134b788
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10216
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

No protection is provided against the 32-bit hardware counter overflows,
so for the moment it is up to userspace to ensure that the counters are
sampled at a reasonable frequency.

The counter set enum is added to the uapi to clarify the restrictions on
calling the interface.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.h |   3 +
 drivers/gpu/drm/panthor/panthor_drv.c    |   1 +
 drivers/gpu/drm/panthor/panthor_perf.c   | 699 ++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_perf.h   |  16 +
 4 files changed, 718 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 818c4d96d448..3fa0882fe81b 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -225,6 +225,9 @@ struct panthor_file {
 	/** @ptdev: Device attached to this file. */
 	struct panthor_device *ptdev;
 
+	/** @drm_file: Corresponding drm_file */
+	struct drm_file *drm_file;
+
 	/** @vms: VM pool attached to this file. */
 	struct panthor_vm_pool *vms;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 9d2b716cca45..4c1381320859 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1356,6 +1356,7 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 	}
 
 	pfile->ptdev = ptdev;
+	pfile->drm_file = file;
 
 	ret = panthor_vm_pool_create(pfile);
 	if (ret)
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index 7c59c8642b7c..62c27be4ca8b 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -2,13 +2,177 @@
 /* Copyright 2023 Collabora Ltd */
 /* Copyright 2025 Arm ltd. */
 
-#include <linux/bitops.h>
+#include <drm/drm_gem.h>
 #include <drm/panthor_drm.h>
+#include <linux/bitops.h>
+#include <linux/circ_buf.h>
 
 #include "panthor_device.h"
 #include "panthor_fw.h"
 #include "panthor_perf.h"
 
+/**
+ * PANTHOR_PERF_EM_BITS - Number of bits in a user-facing enable mask. This must correspond
+ *                        to the maximum number of counters available for selection on the newest
+ *                        Mali GPUs (128 as of the Mali-Gx15).
+ */
+#define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
+
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
+	/* Must be last */
+	PANTHOR_PERF_SESSION_MAX,
+};
+
+struct panthor_perf_enable_masks {
+	/**
+	 * @mask: Array of bitmasks indicating the counters userspace requested, where
+	 *        one bit represents a single counter. Used to build the firmware configuration
+	 *        and ensure that userspace clients obtain only the counters they requested.
+	 */
+	unsigned long mask[DRM_PANTHOR_PERF_BLOCK_MAX][BITS_TO_LONGS(PANTHOR_PERF_EM_BITS)];
+};
+
+struct panthor_perf_counter_block {
+	struct drm_panthor_perf_block_header header;
+	u64 counters[];
+};
+
+/**
+ * enum session_sample_type - Enum of the types of samples a session can request.
+ */
+enum session_sample_type {
+	/** @SAMPLE_TYPE_NONE: A sample has not been requested by this session. */
+	SAMPLE_TYPE_NONE,
+
+	/** @SAMPLE_TYPE_INITIAL: An initial sample has been requested by this session. */
+	SAMPLE_TYPE_INITIAL,
+
+	/** @SAMPLE_TYPE_REGULAR: A regular sample has been requested by this session. */
+	SAMPLE_TYPE_REGULAR,
+};
+
+struct panthor_perf_session {
+	DECLARE_BITMAP(state, PANTHOR_PERF_SESSION_MAX);
+
+	/**
+	 * @pending_sample_request: The type of sample request that is currently pending:
+	 *                          - when a sample is not requested, the data should be accumulated
+	 *                            into the next slot of its ring buffer, but the extract index
+	 *                            should not be updated, and the user-space session must
+	 *                            not be signaled.
+	 *                          - when an initial sample is requested, the data must not be
+	 *                            emitted into the target ring buffer and the userspace client
+	 *                            must not be notified.
+	 *                          - when a regular sample is requested, the data must be emitted
+	 *                            into the target ring buffer, and the userspace client must
+	 *                            be signalled.
+	 */
+	enum session_sample_type pending_sample_request;
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
+	 * @accum_idx: The last insert index indicates whether the current sample
+	 *                   needs zeroing before accumulation. This is used to disambiguate
+	 *                   between accumulating into an intermediate slot in the user ring buffer
+	 *                   and zero-ing the buffer before copying data over.
+	 */
+	u32 accum_idx;
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
+	/** @control: The mapped insert and extract indices. */
+	struct drm_panthor_perf_ringbuf_control *control;
+
+	/** @samples: The mapping of the @ring_buf into the kernel's VA space. */
+	u8 *samples;
+
+	/**
+	 * @pending: The list node used by the sampler to track the sessions that have not yet
+	 *           received a sample.
+	 */
+	struct list_head pending;
+
+	/**
+	 * @sessions: The list node used by the sampler to track the sessions waiting for a sample.
+	 */
+	struct list_head sessions;
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
 struct panthor_perf {
 	/** @next_session: The ID of the next session. */
 	u32 next_session;
@@ -51,6 +215,118 @@ static void panthor_perf_info_init(struct panthor_device *ptdev)
 	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
 }
 
+static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panthor_perf_cmd_setup
+		*setup_args)
+{
+	struct panthor_perf_enable_masks *em = kmalloc(sizeof(*em), GFP_KERNEL);
+	if (IS_ERR_OR_NULL(em))
+		return em;
+
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_FW],
+			setup_args->fw_enable_mask, PANTHOR_PERF_EM_BITS);
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
+}
+
+static size_t get_annotated_block_size(size_t counters_per_block)
+{
+	return struct_size_t(struct panthor_perf_counter_block, counters, counters_per_block);
+}
+
+static u64 session_read_extract_idx(struct panthor_perf_session *session)
+{
+	/* Userspace will update their own extract index to indicate that a sample is consumed
+	 * from the ringbuffer, and we must ensure we read the latest value.
+	 */
+	return smp_load_acquire(&session->control->extract_idx);
+}
+
+static u64 session_read_insert_idx(struct panthor_perf_session *session)
+{
+	return session->control->insert_idx;
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
+	if (session->samples && session->ring_buf) {
+		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->samples);
+
+		drm_gem_vunmap_unlocked(session->ring_buf, &map);
+		drm_gem_object_put(session->ring_buf);
+	}
+
+	if (session->control && session->control_buf) {
+		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->control);
+
+		drm_gem_vunmap_unlocked(session->control_buf, &map);
+		drm_gem_object_put(session->control_buf);
+	}
+
+	eventfd_ctx_put(session->eventfd);
+
+	kfree(session);
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
+{
+	struct panthor_perf_session *session;
+
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
+}
+
 /**
  * panthor_perf_init - Initialize the performance counter subsystem.
  * @ptdev: Panthor device
@@ -88,6 +364,421 @@ int panthor_perf_init(struct panthor_device *ptdev)
 	return ret;
 }
 
+static size_t session_get_user_sample_size(const struct drm_panthor_perf_info *const info)
+{
+	const size_t block_size = get_annotated_block_size(info->counters_per_block);
+	const size_t block_nr = info->cshw_blocks + info->fw_blocks +
+		info->tiler_blocks + info->memsys_blocks + info->shader_blocks;
+
+	return sizeof(struct drm_panthor_perf_sample_header) + (block_size * block_nr);
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
+	if (ret) {
+		drm_err(&ptdev->base, "Did not meet requirements for set %d\n",
+				setup_args->block_set);
+		return ret;
+	}
+
+	session = kzalloc(sizeof(*session), GFP_KERNEL);
+	if (ZERO_OR_NULL_PTR(session))
+		return -ENOMEM;
+
+	ringbuffer = drm_gem_object_lookup(pfile->drm_file, setup_args->ringbuf_handle);
+	if (!ringbuffer) {
+		drm_err(&ptdev->base, "Could not find handle %d!\n", setup_args->ringbuf_handle);
+		ret = -EINVAL;
+		goto cleanup_session;
+	}
+
+	control = drm_gem_object_lookup(pfile->drm_file, setup_args->control_handle);
+	if (!control) {
+		drm_err(&ptdev->base, "Could not find handle %d!\n", setup_args->control_handle);
+		ret = -EINVAL;
+		goto cleanup_ringbuf;
+	}
+
+	user_sample_size = session_get_user_sample_size(&ptdev->perf_info) * slots;
+
+	if (ringbuffer->size != PFN_ALIGN(user_sample_size)) {
+		drm_err(&ptdev->base, "Incorrect ringbuffer size from userspace: user %zu vs kernel %lu\n",
+				ringbuffer->size, PFN_ALIGN(user_sample_size));
+		ret = -ENOMEM;
+		goto cleanup_control;
+	}
+
+	ret = drm_gem_vmap_unlocked(ringbuffer, &rb_map);
+	if (ret)
+		goto cleanup_control;
+
+	ret = drm_gem_vmap_unlocked(control, &ctrl_map);
+	if (ret)
+		goto cleanup_ring_map;
+
+	session->eventfd = eventfd_ctx_fdget(setup_args->fd);
+	if (IS_ERR(session->eventfd)) {
+		drm_err(&ptdev->base, "Invalid eventfd %d!\n", setup_args->fd);
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
+	INIT_LIST_HEAD(&session->sessions);
+	INIT_LIST_HEAD(&session->pending);
+
+	session->control = ctrl_map.vaddr;
+	*session->control = (struct drm_panthor_perf_ringbuf_control) { 0 };
+
+	session->samples = rb_map.vaddr;
+
+	/* TODO This will need validation when we support periodic sampling sessions */
+	if (setup_args->sample_freq_ns) {
+		ret = -EOPNOTSUPP;
+		goto cleanup_em;
+	}
+
+	ret = xa_alloc_cyclic(&perf->sessions, &session_id, session, perf->session_range,
+			&perf->next_session, GFP_KERNEL);
+	if (ret < 0) {
+		drm_err(&ptdev->base, "System session limit exceeded.\n");
+		ret = -EBUSY;
+		goto cleanup_em;
+	}
+
+	kref_init(&session->ref);
+	session->enabled_counters = em;
+
+	session->sample_freq_ns = setup_args->sample_freq_ns;
+	session->user_sample_size = user_sample_size;
+	session->ring_buf = ringbuffer;
+	session->ringbuf_slots = slots;
+	session->control_buf = control;
+	session->pfile = pfile;
+	session->accum_idx = U32_MAX;
+
+	return session_id;
+
+cleanup_em:
+	kfree(em);
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
+	kfree(session);
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
+		return 0;
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
+	if (READ_ONCE(session->pending_sample_request) == SAMPLE_TYPE_NONE)
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
+	if (!pfile || !perf)
+		return;
+
+	xa_for_each(&perf->sessions, sid, session)
+	{
+		if (session->pfile == pfile) {
+			session_destroy(perf, session);
+			xa_erase(&perf->sessions, sid);
+		}
+	}
+}
+
 /**
  * panthor_perf_unplug - Terminate the performance counter subsystem.
  * @ptdev: Panthor device.
@@ -103,8 +794,14 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
 		return;
 
 	if (!xa_empty(&perf->sessions)) {
+		unsigned long sid;
+		struct panthor_perf_session *session;
+
 		drm_err(&ptdev->base,
 			"Performance counter sessions active when unplugging the driver!");
+
+		xa_for_each(&perf->sessions, sid, session)
+			session_destroy(perf, session);
 	}
 
 	xa_destroy(&perf->sessions);
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
index e4805727b9e7..89d61cd1f017 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.h
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -7,10 +7,26 @@
 
 #include <linux/types.h>
 
+struct drm_panthor_perf_cmd_setup;
 struct panthor_device;
+struct panthor_file;
+struct panthor_perf;
 
 int panthor_perf_init(struct panthor_device *ptdev);
 void panthor_perf_unplug(struct panthor_device *ptdev);
 
+int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
+		struct drm_panthor_perf_cmd_setup *setup_args,
+		struct panthor_file *pfile);
+int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid);
+int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data);
+int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data);
+int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data);
+void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf);
+
 #endif /* __PANTHOR_PERF_H__ */
 
-- 
2.33.0.dirty

