Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D985A22D47
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C93310E956;
	Thu, 30 Jan 2025 13:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="VEtf7jeq";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VEtf7jeq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBE510E956
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:09:41 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=srh4V5DkHhJk1KdQgug8kReWqGvIQoC9JDjY55KozFs9cR2oTOCeWo9v9il019mQPwdz097DEfJN96j4mPM9XsvlKFvLoGGvFIJ4Fqh9YDj6hk9Ql/TcJviFFd8sL2MctRSkLVYtf6RH7KSNBDFK20nn4LkfzmvfuHQAhF56E6q34P6D8Mo0+I/EVKe3xKcr/smdjMuQliVeOfo02B026bErWEKdsg6tLGrQL8xjmQhMu9GDcSEZFHGLgO9mt+vhkqBBK32m7jTT3hk7Ve+H+FZgjDrM6cHJ725KD+9jfcTibVd7k5FsbQwFbULwSyCLvLFcsUsSynj5jad83sHfWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2m56lOHH8UulQ7MMklUAstnsFv7n5nolYYlANPWQmgU=;
 b=LCvqr0I0UatFZjQWng+2qJRYOhg3SrGjH7EMe7RDLo5JrCglJ8liouHtuBW9eDsk+LDoYu5aNm+DsWvpne83phF+WTgfcm4KZkzKKbcpX6FsMjadMk8cBtJCRRfJqhCmany8m/cqf7IyamY7s91KNzofLllYKS0V+GmzOy/CvCBHwXhTNIBZjFB4kW4oE/ehpGjQUroCOwqwJ/oNut3ipK7qHPb/ngV+iy30biHCrHVwtlwZ34OaG9NHcc2exTNQZNdIrsE7u7gSgM62jRHFmZyg/yg2lYJNTa15lvDDFBuBgq6ypRDLDNsvUZrmoPCLTDysZvksREbHTIFJUbpCNg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=0
 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2m56lOHH8UulQ7MMklUAstnsFv7n5nolYYlANPWQmgU=;
 b=VEtf7jeqe9QvQxz8Fkqj/nsCF/FUdHUmnqf0JUbhX+6uvRYtjT59H2oW9DXLRuMfGv9/fGaR7NOF7RuQ/2WsNmpuoUDGK9gi1Bj9Q/crv5WL7LB5VfJ+R64MtVuevLSEwduHQ4CRFRr8bMCHpJnm2Wdc00sOkICYgyacl/YHjwY=
Received: from DUZP191CA0032.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::10)
 by PAXPR08MB7351.eurprd08.prod.outlook.com (2603:10a6:102:229::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 13:09:32 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::91) by DUZP191CA0032.outlook.office365.com
 (2603:10a6:10:4f8::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.17 via Frontend Transport; Thu,
 30 Jan 2025 13:09:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Thu, 30 Jan 2025 13:09:31 +0000
Received: ("Tessian outbound 83dd09e0dcef:v560");
 Thu, 30 Jan 2025 13:09:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7b400613d63ec69c
X-TessianGatewayMetadata: VSAmLKlWnLhiRjJ88sYYxwV3E/087YtXkI2ETyHNmZz0s6pgKb0Wt7kugnahbTaXAACkAMVQpQmctwHjHhlCmPPOT6XrnLGxtp1juXi1gJkt31z+nd1BNgKLVmJ+ksdCe9lFsTlW+iBZbVQkEvw1YXRpu+p+upxAuuB1IC08beOdY+h/7Zw12gO5HFzDnTxAIsloove+MDOAE3aigYp2zQ==
X-CR-MTA-TID: 64aa7808
Received: from L50fde0fa5474.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9487BD72-E5A8-4AAC-9322-4FDCA1E08802.1; 
 Thu, 30 Jan 2025 13:09:22 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L50fde0fa5474.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 30 Jan 2025 13:09:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvjIXnUgKloQ0qLL8PKRBygzL4tcdRSOI0XZQw51HwKD95efMEjepJAH40AEAbxBwmtP0Knk6SpsTR9DHx3GeulbD9M37AEmndr5OMcY/FziJYIO2NVSA3hW4YTv4Y9Uh09ZuBgNuxbaFpE/HAjj9KNB5OIq4pUnli2aohgvk+d3sm5fY1vaNCQtcEe92nGvvgqZdGB76yQBeOMsgUoM9c/e+G9YPUYgLvcJa1gmADoy6ndEMz3OfNMFR+B84+1I2qDbyUXcEPK36ipTfxR3Pg2T+SunBQT9DwxXj0zGFTsm41/5bNePds1AfIUrohRQXVe0ImRZhEW+ezGjSmP1dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2m56lOHH8UulQ7MMklUAstnsFv7n5nolYYlANPWQmgU=;
 b=cpx222QOBPZ0/IAVm6Tyh4TQlZFeA/VTeEv102BbCFNbTudh/EupNXbvqme4eC/mpdsWLYIxswYgH7Zt82RYtRN4r6x9VZuFhI+r+npJS8h7NzXsqLU3TvBMeSiQBFf1nUozJtYMSC00g4MQGHV8rqYYYxDsO4HzY4zeUzDfme7toN7vZzW/4IAhxwl/WiHX5krBknMcjpTjSueYijWCanYTP/FblxQ2MkKWE3y8vYP3jJbX1l3UNWKXydPy92+JnD5TfoSkLGbGo8z6vbD+SIVZ0X1zKxAdZHptDeUujmVvam+ERZXIBC4zCMZpjTVtBgEsJWVqQEGohvYINKTZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2m56lOHH8UulQ7MMklUAstnsFv7n5nolYYlANPWQmgU=;
 b=VEtf7jeqe9QvQxz8Fkqj/nsCF/FUdHUmnqf0JUbhX+6uvRYtjT59H2oW9DXLRuMfGv9/fGaR7NOF7RuQ/2WsNmpuoUDGK9gi1Bj9Q/crv5WL7LB5VfJ+R64MtVuevLSEwduHQ4CRFRr8bMCHpJnm2Wdc00sOkICYgyacl/YHjwY=
Received: from DU7P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::28)
 by AS8PR08MB6103.eurprd08.prod.outlook.com (2603:10a6:20b:296::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 13:09:18 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::9d) by DU7P194CA0024.outlook.office365.com
 (2603:10a6:10:553::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.17 via Frontend Transport; Thu,
 30 Jan 2025 13:09:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 13:09:18 +0000
Received: from AZ-NEU-EXJ01.Arm.com (10.240.25.132) by AZ-NEU-EX06.Arm.com
 (10.240.25.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 13:09:11 +0000
Received: from AZ-NEU-EX06.Arm.com (10.240.25.134) by AZ-NEU-EXJ01.Arm.com
 (10.240.25.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 13:09:11 +0000
Received: from e121164.cambridge.arm.com (10.2.10.32) by mail.arm.com
 (10.240.25.134) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 30 Jan 2025 13:09:10 +0000
From: Florent Tomasin <florent.tomasin@arm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J . Mercier"
 <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong Wu
 <yong.wu@mediatek.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <nd@arm.com>, Akash Goel <akash.goel@arm.com>, Florent Tomasin
 <florent.tomasin@arm.com>
Subject: [RFC PATCH 5/5] drm/panthor: Add support for entering and exiting
 protected mode
Date: Thu, 30 Jan 2025 13:09:01 +0000
Message-ID: <d41f08f356d9fa01f497e8b8f95f1bed069be464.1738228114.git.florent.tomasin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1738228114.git.florent.tomasin@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: DU6PEPF00009525:EE_|AS8PR08MB6103:EE_|DU2PEPF00028D04:EE_|PAXPR08MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: bebc99a4-1a29-4ba6-9335-08dd412f5639
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?HA6Lf3Fd1cosTEW30JBzJCKUlt5KVA43YGocTeMzYLqnb5ahWcjJox5GXtke?=
 =?us-ascii?Q?aT9JPst0/8jj4szX5r/pjSUpwlN/pfokCNIyEIlP64WVB7neWmBHYQZVmMgm?=
 =?us-ascii?Q?bv2Qec2ukbB40YaAJktHaAav73DPSOe64CDBqKsZfGyumqrP9/59dUKJJ19o?=
 =?us-ascii?Q?a8d5cMIepKBdFficUTSoS1708Bu9XGiob4jrL0YI6GnBXVQQJO33zgCSiRs9?=
 =?us-ascii?Q?XiNUknRgl6oSsyofu2tqVb7mOBD4r0AtPo64vgTYlM8EUtuZ5iMiydqqBsUb?=
 =?us-ascii?Q?FbJFlz5CP11Og4IDcRRo+1LLHlCe8X0YTKKHn01D2Py0JFj2DRc17MS/x8NA?=
 =?us-ascii?Q?Co09JcFX7RbZ9XmvkPU6RIHmkGr9bPLhoaVTKXseSbRaB8zQC8Skk2sLYp9u?=
 =?us-ascii?Q?9NtgBgYiUZK8q0WWevt6OzxivSzGiRPLoqWL6qbzu7cy9kAx2AsAeRvsetLU?=
 =?us-ascii?Q?Z5iw7t/iIrYfAAZ5Q1K8Mew567MW71CGPx+4oo9GHXXDRBF+EXVU6YyUHc8y?=
 =?us-ascii?Q?0n/XsTX77WcSvDY97Ok8keIar4av7wlL76bp6tBWj9YLdUcu+wkkJgVkXV9J?=
 =?us-ascii?Q?xyWiEUcPCdPn1Jwv4aKKYdPVRyFVpzO1SqbFMXeyXyhmO5cnnYu9lOwohi6d?=
 =?us-ascii?Q?280ilYGqKgo7vwZtkZiPrSY++Ib+evUbdv24b500sVNYz/o48ZXsyLGugBGk?=
 =?us-ascii?Q?K+4UfivnBGkW0bNl4F9Ov4nZAuN9S78t/X+NnLK9ssuzznUDdocBhUq0jrmZ?=
 =?us-ascii?Q?7SEkkZyTJE1rLF15ZetOzYMtg5vrb4aumBAYbwKnCFkuyOynzxMAhcrwuujx?=
 =?us-ascii?Q?UNECjG7f9QUnz2NqJYv3dxjuQqFGUN3IW8AEvK6xj5a5M/zJBLf0Yz0Y0xxI?=
 =?us-ascii?Q?Sk4pqInXPHq5rzTDFT3YnbzPanIf1FNvHomE97tLWOQ/yHhpOjM828GW/FFy?=
 =?us-ascii?Q?5qPvG4eRDAttYlxehGN+faX7uPKZkK2iuPZ6LWEry17bG0y76/iByOiLHzCV?=
 =?us-ascii?Q?O5edlbItxfh7PcNnrPPR1Mb5lS5zjZcOYFQxSEM3dV1Fe5rLDS06Lgk74LBO?=
 =?us-ascii?Q?mzUciy3VvTgJ7pmDpsESWfQ9RxYCmw/uB9zvKl8Z83H2v8K5wb70l+fBm4TB?=
 =?us-ascii?Q?NkHMDZ0B0K+hV3cbzLqA8XmHHgjUx+475zWhRjXHmPofRdctPXFA5OXWsYQ1?=
 =?us-ascii?Q?SA236Q8lgbN/fZS8zE26OZ9v6K/CTw6TyCUQGaAZ4f9g9+XloY0xiYJY/xew?=
 =?us-ascii?Q?2JbmIetw/HJOWrs6yc/IjO2nJhgA+PbW5YkKrnM4mOehRF/qbAcBDAKC0B05?=
 =?us-ascii?Q?5fXJZlsWa95qRYYIy4R0cP5bU3WQd7l76ykml3nvVzcdytju9SRJWkwtko0k?=
 =?us-ascii?Q?J80P0jzlfoLJr3FDN7Um8WTLKw/JLMfXiK0ni2vRUsVUompyM40jE+D2mhdW?=
 =?us-ascii?Q?K0KQpREJqVdrSa7eh62djgDytqQ7BENPIf2/l6dLGso736jZPYJGswOLummw?=
 =?us-ascii?Q?a16ZVKyJTYSHXek=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6103
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:553::28];
 domain=DU7P194CA0024.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 22477e1f-8c48-47fb-c3c8-08dd412f4dcc
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|30052699003|1800799024|14060799003|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xIjaFU90thmh7gvm2ufhWA3OCEg59+YGehtAVWU4QKzXtB/9rmq9ds6JRmQJ?=
 =?us-ascii?Q?flImPHBpvNszJ+RBS2obbanvcZIGfc5IYtVs4mW6Xda8WQ72hfD7jY1avBQX?=
 =?us-ascii?Q?MHQ/xEpqMunTWKy61+UCAiltfyVs9Hgp+WHgECrJGZajzJ3++zb9KzHybHha?=
 =?us-ascii?Q?YnO4gUrwlj5ab15vSxvOOnFwyLd8wiY3MiW0vFVO6eVm/one27SrYp/p8k+h?=
 =?us-ascii?Q?+gVA95PA7r2C2TG1R9rC9z8tjcIoYvF/CK423y3OCYOPCBDI7Fhb8suZpcve?=
 =?us-ascii?Q?M7WOzwY4q6GuLV4poAZy4EOw+uqDd0GUbpkjuUPIpcU8HjQdOeS0Hkmej1yP?=
 =?us-ascii?Q?t8WLVsTxgziBGo8Gnh3/Q5jhpXToBrAxdbPBB49y0TkhW89wgnYHb72/reYX?=
 =?us-ascii?Q?/Lct1Yl/aXZKGoZWupxj7B6kj4WXqaFIJ5rIclichGG0XGK+o/mwwSqfgepq?=
 =?us-ascii?Q?/aL2jAaRrkGfdgMqfV7pQNr8xvxD/Rg8GTSSHQtaXPi6jWxztUCm7q26GzjZ?=
 =?us-ascii?Q?SgCftlFOgDjWu4cJhXFqqW7EhQOUUqVbeiFwafxTViAwl/qWZIWD0grkwLda?=
 =?us-ascii?Q?E3D7g3SlcBu2SZqQUIGPcRvWAx4xYiDO5BpEYyhDq/DU5vzJ0u+9X2Lt7EXk?=
 =?us-ascii?Q?3MRt/nabj6+XG5CYmiXFysPRDb8nbwcv1Sj9DhE8w/JCIk9iAfwgJz0fMAVI?=
 =?us-ascii?Q?MlTf3z5kY4ztjhT5h4G9iA85T4K8LFU0jlsY3wLn/kJxrz9o5Tql9rK/M10F?=
 =?us-ascii?Q?LaUh6Fx4FcZO+VNafWdlXeP2rg1xSg3MkbLrNZAvjWN9O3YZVlOlzVv/IVhv?=
 =?us-ascii?Q?Nzm8IkviXIun7ikzauhRP3rP3EioLQTb+WukbI6nH4Jp+oXTE/eyk5VHIJNt?=
 =?us-ascii?Q?xGQj4lhn8m8k5FXo1rLFg8IusVUm6YbwUoIaBLRolaUi7Wi1vooC9zX688HE?=
 =?us-ascii?Q?EbpWROZQdpMREzYtMsjPm3dGixdb/+XtIVCAROi2ejfIBj794vtycsWga8CA?=
 =?us-ascii?Q?WTqZbwJeO0CchwxwVk/Ga0gvm/qBKrU3sZf3mBTrZdL3UxrtS6sNG0/FL+9S?=
 =?us-ascii?Q?IuodE5vm1nRobX78FDBw66WVC6iqJ7Vf924GCBqK9IAEus256tU32uVjKg34?=
 =?us-ascii?Q?Nu5Lc1gVW6J2O9cuQ5kC7J1hMdTzUhCUKB9VbigY3xcqidV+zuWsTfCKrbKV?=
 =?us-ascii?Q?VVt2MWfBUhTy0xQQADnA2Ak+D0xzj4OxdnNa2PvFKah17GHp8U9YeIqZdOnW?=
 =?us-ascii?Q?vgzVbrWJTHEmQbL8Sc44RIRwhYPxkGJb5RulTtAykgZqTkeY9qCk1eRnOnTT?=
 =?us-ascii?Q?1yBc5+LmqBnZl/54tom9FaaTf0fa2SlYECfkKJ8hZKHj1jzv9KPhZQ6LqRLX?=
 =?us-ascii?Q?RUEmegIJV0PQrsOPz8oEnN1gdBWPu/xN1WTxHY9mdLixMH1EiSU5oyn+pawX?=
 =?us-ascii?Q?St4bHvcqlixK/5OuObDd5kiC0Cpgn1OXxPTGMqwLS6kOHxWmoBdyLefN/lxD?=
 =?us-ascii?Q?QC5u7gGmmHTsTwM=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(30052699003)(1800799024)(14060799003)(376014)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 13:09:31.3610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bebc99a4-1a29-4ba6-9335-08dd412f5639
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7351
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

This patch modifies the Panthor driver code to allow handling
of the GPU HW protected mode enter and exit.

The logic added by this patch only includes the mechanisms
needed for entering and exiting protected mode. The submission of
a protected mode jobs is not covered by this patch series
and is responsibility of the user space program.

To help with the review, here are some important information
about Mali GPU protected mode enter and exit:
- When the GPU detects a protected mode job needs to be
  executed, an IRQ is sent to the CPU to notify the kernel
  driver that the job is blocked until the GPU has entered
  protected mode. The entering of protected mode is controlled
  by the kernel driver.
- The Mali Panthor CSF driver will schedule a tick and evaluate
  which CS in the CSG to schedule on slot needs protected mode.
  If the priority of the CSG is not sufficiently high, the
  protected mode job will not progress until the CSG is
  scheduled at top priority.
- The Panthor scheduler notifies the GPU that the blocked
  protected jobs will soon be able to progress.
- Once all CSG and CS slots are updated, the scheduler
  requests the GPU to enter protected mode and waits for
  it to be acknowledged.
- If successful, all protected mode jobs will resume execution
  while normal mode jobs block until the GPU exits
  protected mode, or the kernel driver rotates the CSGs
  and forces the GPU to exit protected mode.
- If unsuccessful, the scheduler will request a GPU reset.
- When a protected mode job is suspended as a result of
  the CSGs rotation, the GPU will send an IRQ to the CPU
  to notify that the protected mode job needs to resume.

This sequence will continue so long the user space is
submitting protected mode jobs.

Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.h |   3 +
 drivers/gpu/drm/panthor/panthor_fw.c     |  10 +-
 drivers/gpu/drm/panthor/panthor_sched.c  | 119 +++++++++++++++++++++--
 3 files changed, 122 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 406de9e888e2..0c76bfd392a0 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -196,6 +196,9 @@ struct panthor_device {
 	struct {
 		/** @heap: Pointer to the protected heap */
 		struct dma_heap *heap;
+
+		/** @pending: Set to true if a protected mode enter request is pending. */
+		bool pending;
 	} protm;
 };
 
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 7822af1533b4..2006d652f4db 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1025,13 +1025,19 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
 	glb_iface->input->progress_timer = PROGRESS_TIMEOUT_CYCLES >> PROGRESS_TIMEOUT_SCALE_SHIFT;
 	glb_iface->input->idle_timer = panthor_fw_conv_timeout(ptdev, IDLE_HYSTERESIS_US);
 
-	/* Enable interrupts we care about. */
+	/* Enable interrupts we care about.
+	 *
+	 * GLB_PROTM_ENTER and GLB_PROTM_EXIT interrupts are only
+	 * relevant if a protected memory heap is present.
+	 */
 	glb_iface->input->ack_irq_mask = GLB_CFG_ALLOC_EN |
 					 GLB_PING |
 					 GLB_CFG_PROGRESS_TIMER |
 					 GLB_CFG_POWEROFF_TIMER |
 					 GLB_IDLE_EN |
-					 GLB_IDLE;
+					 GLB_IDLE |
+					 (ptdev->protm.heap ?
+					 (GLB_PROTM_ENTER | GLB_PROTM_EXIT) : 0);
 
 	panthor_fw_update_reqs(glb_iface, req, GLB_IDLE_EN, GLB_IDLE_EN);
 	panthor_fw_toggle_reqs(glb_iface, req, ack,
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index e260ed8aef5b..c10a21f9d075 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -573,6 +573,9 @@ struct panthor_group {
 	/** @fatal_queues: Bitmask reflecting the queues that hit a fatal exception. */
 	u32 fatal_queues;
 
+	/** @protm_queues: Bitmask reflecting the queues that are waiting on a CS_PROTM_PENDING. */
+	u32 protm_queues;
+
 	/** @tiler_oom: Mask of queues that have a tiler OOM event to process. */
 	atomic_t tiler_oom;
 
@@ -870,6 +873,31 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
 	return NULL;
 }
 
+static int glb_protm_enter(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface;
+	u32 acked;
+	int ret;
+
+	lockdep_assert_held(&ptdev->scheduler->lock);
+
+	if (!ptdev->protm.pending)
+		return 0;
+
+	glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	panthor_fw_toggle_reqs(glb_iface, req, ack, GLB_PROTM_ENTER);
+	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+
+	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PROTM_ENTER, &acked, 4000);
+	if (ret)
+		drm_err(&ptdev->base, "FW protm enter timeout, scheduling a reset");
+	else
+		ptdev->protm.pending = false;
+
+	return ret;
+}
+
 static void group_free_queue(struct panthor_group *group, struct panthor_queue *queue)
 {
 	if (IS_ERR_OR_NULL(queue))
@@ -1027,6 +1055,7 @@ group_unbind_locked(struct panthor_group *group)
  * @ptdev: Device.
  * @csg_id: Group slot ID.
  * @cs_id: Queue slot ID.
+ * @protm_ack: Acknowledge pending protected mode queues
  *
  * Program a queue slot with the queue information so things can start being
  * executed on this queue.
@@ -1034,10 +1063,13 @@ group_unbind_locked(struct panthor_group *group)
  * The group slot must have a group bound to it already (group_bind_locked()).
  */
 static void
-cs_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id)
+cs_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id, bool protm_ack)
 {
-	struct panthor_queue *queue = ptdev->scheduler->csg_slots[csg_id].group->queues[cs_id];
+	struct panthor_group * const group = ptdev->scheduler->csg_slots[csg_id].group;
+	struct panthor_queue *queue = group->queues[cs_id];
 	struct panthor_fw_cs_iface *cs_iface = panthor_fw_get_cs_iface(ptdev, csg_id, cs_id);
+	u32 const cs_protm_pending_mask =
+		protm_ack && (group->protm_queues & BIT(cs_id)) ? CS_PROTM_PENDING : 0;
 
 	lockdep_assert_held(&ptdev->scheduler->lock);
 
@@ -1055,15 +1087,22 @@ cs_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id)
 			       CS_IDLE_SYNC_WAIT |
 			       CS_IDLE_EMPTY |
 			       CS_STATE_START |
-			       CS_EXTRACT_EVENT,
+			       CS_EXTRACT_EVENT |
+			       cs_protm_pending_mask,
 			       CS_IDLE_SYNC_WAIT |
 			       CS_IDLE_EMPTY |
 			       CS_STATE_MASK |
-			       CS_EXTRACT_EVENT);
+			       CS_EXTRACT_EVENT |
+			       CS_PROTM_PENDING);
 	if (queue->iface.input->insert != queue->iface.input->extract && queue->timeout_suspended) {
 		drm_sched_resume_timeout(&queue->scheduler, queue->remaining_time);
 		queue->timeout_suspended = false;
 	}
+
+	if (cs_protm_pending_mask) {
+		group->protm_queues &= ~BIT(cs_id);
+		ptdev->protm.pending = true;
+	}
 }
 
 /**
@@ -1274,7 +1313,7 @@ csg_slot_sync_state_locked(struct panthor_device *ptdev, u32 csg_id)
 }
 
 static int
-csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
+csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority, bool protm_ack)
 {
 	struct panthor_fw_csg_iface *csg_iface;
 	struct panthor_csg_slot *csg_slot;
@@ -1291,14 +1330,14 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
 
 	csg_slot = &ptdev->scheduler->csg_slots[csg_id];
 	group = csg_slot->group;
-	if (!group || group->state == PANTHOR_CS_GROUP_ACTIVE)
+	if (!group || (group->state == PANTHOR_CS_GROUP_ACTIVE && !protm_ack))
 		return 0;
 
 	csg_iface = panthor_fw_get_csg_iface(group->ptdev, csg_id);
 
 	for (i = 0; i < group->queue_count; i++) {
 		if (group->queues[i]) {
-			cs_slot_prog_locked(ptdev, csg_id, i);
+			cs_slot_prog_locked(ptdev, csg_id, i, protm_ack);
 			queue_mask |= BIT(i);
 		}
 	}
@@ -1329,6 +1368,34 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
 	return 0;
 }
 
+static void
+cs_slot_process_protm_pending_event_locked(struct panthor_device *ptdev,
+					   u32 csg_id, u32 cs_id)
+{
+	struct panthor_scheduler *sched = ptdev->scheduler;
+	struct panthor_csg_slot *csg_slot = &sched->csg_slots[csg_id];
+	struct panthor_group *group = csg_slot->group;
+
+	lockdep_assert_held(&sched->lock);
+
+	if (!group)
+		return;
+
+	/* No protected memory heap, a user space program tried to
+	 * submit a protected mode jobs resulting in the GPU raising
+	 * a CS_PROTM_PENDING request.
+	 *
+	 * This scenario is invalid and the protected mode jobs must
+	 * not be allowed to progress.
+	 */
+	if (drm_WARN_ON_ONCE(&ptdev->base, !ptdev->protm.heap))
+		return;
+
+	group->protm_queues |= BIT(cs_id);
+
+	sched_queue_delayed_work(sched, tick, 0);
+}
+
 static void
 cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
 				   u32 csg_id, u32 cs_id)
@@ -1566,6 +1633,9 @@ static bool cs_slot_process_irq_locked(struct panthor_device *ptdev,
 	if (events & CS_TILER_OOM)
 		cs_slot_process_tiler_oom_event_locked(ptdev, csg_id, cs_id);
 
+	if (events & CS_PROTM_PENDING)
+		cs_slot_process_protm_pending_event_locked(ptdev, csg_id, cs_id);
+
 	/* We don't acknowledge the TILER_OOM event since its handling is
 	 * deferred to a separate work.
 	 */
@@ -1703,6 +1773,17 @@ static void sched_process_idle_event_locked(struct panthor_device *ptdev)
 	sched_queue_delayed_work(ptdev->scheduler, tick, 0);
 }
 
+static void sched_process_protm_exit_event_locked(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	lockdep_assert_held(&ptdev->scheduler->lock);
+
+	/* Acknowledge the protm exit and schedule a tick. */
+	panthor_fw_update_reqs(glb_iface, req, glb_iface->output->ack, GLB_PROTM_EXIT);
+	sched_queue_delayed_work(ptdev->scheduler, tick, 0);
+}
+
 /**
  * sched_process_global_irq_locked() - Process the scheduling part of a global IRQ
  * @ptdev: Device.
@@ -1720,6 +1801,9 @@ static void sched_process_global_irq_locked(struct panthor_device *ptdev)
 
 	if (evts & GLB_IDLE)
 		sched_process_idle_event_locked(ptdev);
+
+	if (evts & GLB_PROTM_EXIT)
+		sched_process_protm_exit_event_locked(ptdev);
 }
 
 static void process_fw_events_work(struct work_struct *work)
@@ -2238,9 +2322,22 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 		list_for_each_entry(group, &ctx->groups[prio], run_node) {
 			int csg_id = group->csg_id;
 			struct panthor_fw_csg_iface *csg_iface;
+			bool protm_ack = false;
+
+			/* The highest priority group has pending protected mode queues */
+			if (new_csg_prio == MAX_CSG_PRIO && group->protm_queues)
+				protm_ack = true;
 
 			if (csg_id >= 0) {
 				new_csg_prio--;
+
+				/* This group is on slot but at least one queue
+				 * is waiting for PROTM_ENTER.
+				 */
+				if (protm_ack)
+					csg_slot_prog_locked(ptdev, csg_id,
+							     new_csg_prio, protm_ack);
+
 				continue;
 			}
 
@@ -2251,7 +2348,7 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
 			csg_slot = &sched->csg_slots[csg_id];
 			group_bind_locked(group, csg_id);
-			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio--);
+			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio--, protm_ack);
 			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
 						group->state == PANTHOR_CS_GROUP_SUSPENDED ?
 						CSG_STATE_RESUME : CSG_STATE_START,
@@ -2303,6 +2400,12 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 
 	sched->used_csg_slot_count = ctx->group_count;
 	sched->might_have_idle_groups = ctx->idle_group_count > 0;
+
+	ret = glb_protm_enter(ptdev);
+	if (ret) {
+		panthor_device_schedule_reset(ptdev);
+		ctx->csg_upd_failed_mask = U32_MAX;
+	}
 }
 
 static u64
-- 
2.34.1

