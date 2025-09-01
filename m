Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C75EB3E725
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 16:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4996310E282;
	Mon,  1 Sep 2025 14:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="Jh9BPJqE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11022096.outbound.protection.outlook.com [52.101.66.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC35810E282
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 14:30:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aT8K2Z0Yn7RuaBkLn2dQKtU0lKgsONP64QH1N7CIbyVgaTCp36d0K9JNOxJsNbB7bgtg3ZtC7etlrTcBttKFUlNiNNaJoMt6Vl6avJ/He2/7qocsCJcRJioAmwpMftOQRdS1o9oV0IqSDz05HOcwCmpdvz64XuF76sGvXFDxtg7mDKqXBKbGXsFHEfuJWn1WNbMCrIpXRK4U/Lyjq8hGdQOx9nY/XIAibjYw54GF5+GkeROjBBD9XxH3kTMPLK23d0EoMf7D53y3sd/IDArxMXAVmr8pbwaqX/qdUCWsIVIDM2uoqY4jyN58XeTlz5UBE9NkxgFj/vLrfLq5F+DiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRJN9fAjYfqPnExIOlhOKybFjOdBWjBBk840gDeG16I=;
 b=tPqDMnRRa3Jj4vM90OKb0XzsK+B+az/VL0+atpQImVlu/5j9JauVwJ0smJCGSd52icDsdH87y9LsOY6KHBIpI1oZi/XobqrVYKjjznDwf55a42lcFkciZnB4PqVqZRawVXvL/edVALS6tAh2wWbllFGd/ewUKa8qIxE3PzIYqcpaTS5vYMPHp6hOXycXW2AvTSwQ0Pl5yNEu1SYwmTt97pLTGH9WcW2RbN9gGYryA2uadXT+ce/ii0H/TDCHYsTXp8q2aa/MIU9xKMW3dRkqAJWnr7FC3SN1tQivoF97EoNvoujDj3YGPvj9FuA0KrhsPGk1tqa7Rj5OKkWKhrw+Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRJN9fAjYfqPnExIOlhOKybFjOdBWjBBk840gDeG16I=;
 b=Jh9BPJqEH2TUmdMvCwE60c8poPFMvbyT+M/Okle8LhQmLh1MZOznktJMeQvUHMlYL4ZtlxjPryB4mJME3vdXXEWlMn/uLE0VntJ7/bq1T1/RekYHarbtp+ggjKR1YSbrL4uPH9GJBIiQbguR+Den2d50/ozja+St0m5baZh4rx3DFQdNJHmrNsA7p1SRlpL3QCywiGtqUXU6+XjTI8Ohhh7Cbt8x2Z0UfqXKdJ06r3Mlg2SYgcQMA6kR571SonhObXW5KWseToAweAksVNBletF0RXbJ420X8emJXdwqGejOej0EwFbQzC5NAHdjT2XIWolyHWvS/sJ1qi3Jxac1Dg==
Received: from AS4P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::11)
 by AS8PR04MB8754.eurprd04.prod.outlook.com (2603:10a6:20b:42d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.12; Mon, 1 Sep
 2025 14:30:11 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::8e) by AS4P190CA0018.outlook.office365.com
 (2603:10a6:20b:5d0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Mon,
 1 Sep 2025 14:30:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Mon, 1 Sep 2025 14:30:10 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com (40.93.81.78) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 01 Sep 2025 14:30:10 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PA4PR04MB7806.eurprd04.prod.outlook.com (2603:10a6:102:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Mon, 1 Sep
 2025 14:30:06 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9094.011; Mon, 1 Sep 2025
 14:30:06 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: dri-devel@lists.freedesktop.org
CC: Mike Looijmans <mike.looijmans@topic.nl>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Date: Mon, 1 Sep 2025 16:29:02 +0200
Message-ID: <20250901142958.843678-3-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901142958.843678-1-mike.looijmans@topic.nl>
References: <20250901142958.843678-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.cb04edf6-4f97-4f30-891a-5e11da8a5e1f@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM8P251CA0009.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::14) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PA4PR04MB7806:EE_|AMS0EPF000001A7:EE_|AS8PR04MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: b147be14-2dea-4387-f6a6-08dde9640e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?9MGvqKtUnOCp/Ri+uIitcDIudPc78wG4rA2L2KR8OwuefqcOfxnmcxoE/gOV?=
 =?us-ascii?Q?eehBkvUIqbkN4MiW6nFfjKN4ALqGjmpaMNOqX7bvoOZ2FT6rhEo/JsCkuwAH?=
 =?us-ascii?Q?VtfZa2coFbwE7tYTgPX0MfgGsvAxg8+20vy427XxiHbu/lgaqEKmDNwnBnvq?=
 =?us-ascii?Q?MkU2vZn42qePZWLOyWbpauA7jO5xRqMMXdaw7pa6EnkH1+aA6JlYH+O6EQ06?=
 =?us-ascii?Q?oXFtqfU2dKQf9px++77QO9RpNK1rbT8DRRDZ2ujOuNod/JXBJCkbNJniO8Mm?=
 =?us-ascii?Q?qyeX+Hm06omTIzR0TW9A9ikF06dwiM9WFkYJdcGVR0dCclyVVsN2ODMtOP6+?=
 =?us-ascii?Q?KKViPsOXo1Vb7QXDOHMGhJv5hiWzPyan5jBD7Pghl3ZEj1qvNcIWrkWeNY9d?=
 =?us-ascii?Q?a8DHo+/CumMHxULWdDNMxe4fgm+UxZb2UnyRTqte6jfWxEoIVAGme9nTYubo?=
 =?us-ascii?Q?7+iloskElaOpoKln0k6eOJju1eNEvIKQwES9V/7i0M5UwYA6Ceg8YUCcFR1T?=
 =?us-ascii?Q?5PsqP6zIvmCfKqMx2pr5imOI8PuSQay361hLupcdeb6TQXJzzJcZqaEn+YpW?=
 =?us-ascii?Q?/AOHgvrnUS9YbacobkIoh7elaNKmkdylYd1OP1UwcmyZAdLg1cnim94jHYJU?=
 =?us-ascii?Q?RD98ITO9Ku9gQdEG6PXuZUTf2lNBpYEZZZEyuqybySVFaSkXPMwVrhMIBBLg?=
 =?us-ascii?Q?xSuYbycIRHcVkhKaEF0j/gVi02CuLslpjjt9vsFGrDQTq01pFehyxBd5AMkA?=
 =?us-ascii?Q?cdFCwa2mrbcbPLBVUiBlHx0DTnzVBe4NncUcLsFzvuBRi3Eg+aBv5LQA65px?=
 =?us-ascii?Q?1qkX/jQiMqc3rsaYMzAzfRQH8253okw7rkE95gR/S0npuJTfEUUzlkFuL2Lf?=
 =?us-ascii?Q?HNhL7kWKUajnJZU3yBgO18FKwrQSBQBQl9yC5Vd5UBAoaWVHDXTHY40IZHha?=
 =?us-ascii?Q?UYXnxgMGOP9d2jR72JuQ2GCaActcLQXa/x0laZqp7KJfeX08uENsNcdV8k/K?=
 =?us-ascii?Q?suflqi3gPu10dAyILwqMbG3b1UPWHuDe77IYwV7H9eNesiwp0DseZ05jV5sH?=
 =?us-ascii?Q?FtR5+oXpk86x2T7E2ZioIinl8LgxOgHVyfxRbO8lB47gZr62xES+eCZn+FD2?=
 =?us-ascii?Q?089W+QYlSP6k+w8KAprwzad12GM6WXXwsbZY/GlVku21at6zVadEXUWNapKI?=
 =?us-ascii?Q?R89xIagYEnvGjT5sxysMocFuCihQGQaxrEo2g4Kqk0hqGErzDhOfvHoIL1wU?=
 =?us-ascii?Q?Xh5G5HVykASpyYvJZqmUs6aRGQnsAGj7cRCNnwc7E/XfHHck+k71cN0PUAQE?=
 =?us-ascii?Q?eI75K/kzPsF5CAxMJtgDqkYG+7lV7gXp8J/VhAJtZmi0K/EHfv3xdCYot/TP?=
 =?us-ascii?Q?X6qZsRKacqcfrGdUajAMHn0GuC0xTafaSmBssuPqTgailpK+BQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7806
X-CodeTwo-MessageID: f8240959-76de-4951-b40c-89f601fc58e9.20250901143009@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c1147f6a-eb14-49d9-a6ec-08dde9640bac
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|36860700013|14060799003|1800799024|82310400026|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nxIUvcmYlTGn54rbelbfGPzeMuFMVzJJ/ion8lWO3iIaJHIneEb61LWIeHbL?=
 =?us-ascii?Q?xG0nZfEyNnSFcCK0GtBEqYB0TQFysCJlBPJb9k/vhaXcTGzOoSmv/m4prhj7?=
 =?us-ascii?Q?x75G+RRwWMJnav4L9c2qFsr0e+DemaaVxRIxTkXlPj6dLzM5x7no/HAY69pw?=
 =?us-ascii?Q?SFpmHJzvE+fs+/3+zF9GhJpyJyBArV9Ot5lcyFd0yHCyepdt7qjeCbvJgm8k?=
 =?us-ascii?Q?OCaBzbZhnQbYzYgOLOMtfx4R/B3HorRZJAxliuTuGeG5Bk7LC/IPM3oUnXj8?=
 =?us-ascii?Q?XHf1nrG3GKjPo5cGVApCYfEbBnk8nG3Z9dusVRR1i+onymKM5JMoB+E73E8N?=
 =?us-ascii?Q?W5lGsRQqHTPf3Wx1a+2vE/dkBmx6Ko1At7AjYp4/8YN4LnNhppozeDtziSdc?=
 =?us-ascii?Q?fHixD7E4gTo8FZYdf5nYHk/Jh315re6YLE8vwpUJc+xaXXBZBYz2gbjNs6GS?=
 =?us-ascii?Q?d9Qmn/g2vPXAZuPhJasJN+UOBDto/Dr64HQ89GzOH17PX7pADdVoXJXtgNwa?=
 =?us-ascii?Q?osKSh2NIGqA7AcaddqwvGSxfVJBmG+WfS/lAQP993NJmeuRGqUP171D3uGN8?=
 =?us-ascii?Q?ME7+3yy40pKeW3byy4BfL8malX58y7duMCsRfde+knLPMQuouNLI5/BhcuFp?=
 =?us-ascii?Q?7RvzCj/+RyW8KKajOoMAhFumtQEbtS5xNs2lLIqiX+DZMdtDQu0/mUB29oqW?=
 =?us-ascii?Q?l/9nnmG/Uk3yef0BBytdBqNSj4Fjo5jYrHpU0Hm00QTHyb/TF1ApF2xEd2ak?=
 =?us-ascii?Q?JeDavC5OjG9CAZgyhaTGBDOCNgAoQBBOr5Ttj2J/siiB6yCWt546qrPV4goM?=
 =?us-ascii?Q?kUgy9doLXNX/APFOvhBCXZMoPDanLNwyl5idrkh4AWNp2pUN91t0X7U9n2pC?=
 =?us-ascii?Q?Dy+RyyfX17qKNoYEg24+ahSgOlVsTSq3nTnmWDU8gWEBXmRvLThWFaPYzZNk?=
 =?us-ascii?Q?T4Nq97Ks3QSjr6dMhrWEaMTT/SYlW1lB2t3jiVfstTcWnlkWodapxcl0RDWj?=
 =?us-ascii?Q?slvdVqN+yjshIeBF9Tv2sBAijwG/xUWdE04n3yjKvOZTIS3riZ9hzGvgHMdJ?=
 =?us-ascii?Q?JTG3v2NGs8NzguCyT67XYRBrPlh79k29cOVusZDtEpvLcJJc20nEZBc8ALka?=
 =?us-ascii?Q?043v1B9vegW9hlHoc9SL1equRaDUIDhtacmLnhuc1jLrxllDGHTBt06fSqf7?=
 =?us-ascii?Q?0tgb4NC/e4XqS0wp5pjdfEfuQCiuN73VytQfEL+aa++REEapSMH2R1cqHRRg?=
 =?us-ascii?Q?YW0d7zAodFLLsZrmdWIg/qp0d1N92J/a+r5KFo3kVxpLNqi9PTUIILzx9U4u?=
 =?us-ascii?Q?MMJzkdESqh6CQUnLntDFzF3ql2+5Cf/iQiEkQRSHh1PPcLZlYYF8t0LrYcJP?=
 =?us-ascii?Q?KltADMoVcv4QwM5tu3xGCFBH+JbJN7j21WuyruT6CyBEdUTZXbuiDvN75hdG?=
 =?us-ascii?Q?b57uWV5jI8jbPzWp6EI/a67fJptilp7z?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(35042699022)(36860700013)(14060799003)(1800799024)(82310400026)(7416014)(376014)(13003099007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 14:30:10.6431 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b147be14-2dea-4387-f6a6-08dde9640e8f
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8754
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

The tmds181 and sn65dp159 are "retimers" and hence can be considered
HDMI-to-HDMI bridges. Typical usage is to convert the output of an
FPGA into a valid HDMI signal, and it will typically be inserted
between an encoder and hdmi-connector.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

Changes in v4:
dev_err_probe, this_module, of_match_ptr
Use fallback compatible
Add vcc-supply and vdd-supply

Changes in v3:
Lower-case hex values and use defines for EYESCAN registers
Remove equalizer code (unlikely to be used)
Remove attributes (no longer useful, undocumented)
Fix build for 6.17 kernel
Use devm_drm_bridge_alloc
Sort includes and add linux/bitfield.h
Check chip type and complain on mismatch

Changes in v2:
Use atomic_enable/disable
Use #defines for bit fields in registers
Allow HDMI 2 compliance
Filter modes on clock range
Use cross-over pixel frequency instead of manual overides
Devicetree bindings according to standards

 drivers/gpu/drm/bridge/Kconfig      |  11 +
 drivers/gpu/drm/bridge/Makefile     |   1 +
 drivers/gpu/drm/bridge/ti-tmds181.c | 401 ++++++++++++++++++++++++++++
 3 files changed, 413 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfi=
g
index b9e0ca85226a..753177fc9b50 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -430,6 +430,17 @@ config DRM_TI_SN65DSI86
 	help
 	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
=20
+config DRM_TI_TMDS181
+        tristate "TI TMDS181 and SN65DP159 HDMI retimer bridge driver"
+	depends on OF
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	help
+	  Enable this to support the TI TMDS181 and SN65DP159 HDMI retimers.
+	  The SN65DP159 provides output into a cable (source) whereas the
+	  TMDS181 is meant to forward a cable signal into a PCB (sink). Either
+	  can be set up as source or sink though.
+
 config DRM_TI_TPD12S015
 	tristate "TI TPD12S015 HDMI level shifter and ESD protection"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makef=
ile
index 245e8a27e3fc..f4b5089e903c 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_DRM_TI_SN65DSI83) +=3D ti-sn65dsi83.o
 obj-$(CONFIG_DRM_TI_SN65DSI86) +=3D ti-sn65dsi86.o
 obj-$(CONFIG_DRM_TI_TDP158) +=3D ti-tdp158.o
 obj-$(CONFIG_DRM_TI_TFP410) +=3D ti-tfp410.o
+obj-$(CONFIG_DRM_TI_TMDS181) +=3D ti-tmds181.o
 obj-$(CONFIG_DRM_TI_TPD12S015) +=3D ti-tpd12s015.o
 obj-$(CONFIG_DRM_NWL_MIPI_DSI) +=3D nwl-dsi.o
 obj-$(CONFIG_DRM_ITE_IT66121) +=3D ite-it66121.o
diff --git a/drivers/gpu/drm/bridge/ti-tmds181.c b/drivers/gpu/drm/bridge/t=
i-tmds181.c
new file mode 100644
index 000000000000..e7761b2f32be
--- /dev/null
+++ b/drivers/gpu/drm/bridge/ti-tmds181.c
@@ -0,0 +1,401 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TI tmds181 and sn65dp159 HDMI redriver and retimer chips
+ *
+ * Copyright (C) 2018 - 2025 Topic Embedded Products <www.topic.nl>
+ *
+ * based on code
+ * Copyright (C) 2007 Hans Verkuil
+ * Copyright (C) 2016, 2017 Leon Woestenberg <leon@sidebranch.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc.h>
+#include <drm/display/drm_hdmi_helper.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+MODULE_DESCRIPTION("I2C device driver for DP159 and TMDS181 redriver/retim=
er");
+MODULE_AUTHOR("Mike Looijmans");
+MODULE_LICENSE("GPL");
+
+#define TMDS181_REG_ID		0
+#define TMDS181_REG_REV		0x8
+#define TMDS181_REG_CTRL9	0x9
+/* Registers A and B have a volatile bit, but we don't use it, so cache is=
 ok */
+#define TMDS181_REG_CTRLA	0xa
+#define TMDS181_REG_CTRLB	0xb
+#define TMDS181_REG_CTRLC	0xc
+#define TMDS181_REG_EQUALIZER	0xd
+/* EYESCAN registers don't appear to deserve separate names */
+#define TMDS181_REG_EYESCAN_E	0xe
+#define TMDS181_REG_EYESCAN_F	0xf
+#define TMDS181_REG_EYESCAN_15	0x15
+#define TMDS181_REG_EYESCAN_17	0x17
+#define TMDS181_REG_EYESCAN_1F	0x1f
+#define TMDS181_REG_AUX		0x20
+
+
+#define TMDS181_CTRL9_SIG_EN			BIT(4)
+#define TMDS181_CTRL9_PD_EN			BIT(3)
+#define TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE	BIT(2)
+#define TMDS181_CTRL9_I2C_DR_CTL		GENMASK(1, 0)
+
+#define TMDS181_CTRLA_MODE_SINK			BIT(7)
+#define TMDS181_CTRLA_HPDSNK_GATE_EN		BIT(6)
+#define TMDS181_CTRLA_EQ_ADA_EN			BIT(5)
+#define TMDS181_CTRLA_EQ_EN			BIT(4)
+#define TMDS181_CTRLA_AUX_BRG_EN		BIT(3)
+#define TMDS181_CTRLA_APPLY			BIT(2)
+#define TMDS181_CTRLA_DEV_FUNC_MODE		GENMASK(1, 0)
+
+#define TMDS181_CTRLB_SLEW_CTL			GENMASK(7, 6)
+#define TMDS181_CTRLB_HDMI_SEL_DVI		BIT(5)
+#define TMDS181_CTRLB_TX_TERM_CTL		GENMASK(4, 3)
+#define TMDS181_CTRLB_DDC_DR_SEL		BIT(2)
+#define TMDS181_CTRLB_TMDS_CLOCK_RATIO_STATUS	BIT(1)
+#define TMDS181_CTRLB_DDC_TRAIN_SET		BIT(0)
+
+#define TMDS181_CTRLB_TX_TERM_150_300_OHMS	1
+#define TMDS181_CTRLB_TX_TERM_75_150_OHMS	3
+
+#define TMDS181_CTRLC_VSWING_DATA		GENMASK(7, 5)
+#define TMDS181_CTRLC_VSWING_CLK		GENMASK(4, 2)
+#define TMDS181_CTRLC_HDMI_TWPST1		GENMASK(1, 0)
+
+#define TMDS181_EQ_DATA_LANE			GENMASK(5, 3)
+#define TMDS181_EQ_CLOCK_LANE			GENMASK(2, 1)
+#define TMDS181_EQ_DIS_HDMI2_SWG		BIT(0)
+
+/* Above this data rate HDMI2 standards apply (TX termination) */
+#define HDMI2_PIXEL_RATE_KHZ	340000
+
+enum tmds181_chip {
+	tmds181,
+	dp159,
+};
+
+struct tmds181_data {
+	struct i2c_client *client;
+	struct regmap *regmap;
+	struct drm_bridge *next_bridge;
+	struct drm_bridge bridge;
+	u32 retimer_threshold_khz;
+};
+
+static inline struct tmds181_data *
+drm_bridge_to_tmds181_data(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct tmds181_data, bridge);
+}
+
+static int tmds181_attach(struct drm_bridge *bridge, struct drm_encoder *e=
ncoder,
+			  enum drm_bridge_attach_flags flags)
+{
+	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
+
+	return drm_bridge_attach(encoder, data->next_bridge, bridge, flags);
+}
+
+static enum drm_mode_status
+tmds181_mode_valid(struct drm_bridge *bridge, const struct drm_display_inf=
o *info,
+		   const struct drm_display_mode *mode)
+{
+	unsigned long long rate;
+
+	rate =3D drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+
+	/* Minimum clock rate is 25MHz */
+	if (rate < 25000000)
+		return MODE_CLOCK_LOW;
+
+	/*
+	 * When in HDMI 2 mode, the clock is 1/40th of the bitrate. The limit is
+	 * then the data rate of 6Gbps, which would use a 600MHz pixel clock.
+	 */
+	if (rate > 600000000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static void tmds181_enable(struct drm_bridge *bridge, struct drm_atomic_st=
ate *state)
+{
+	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
+	const struct drm_crtc_state *crtc_state;
+	const struct drm_display_mode *mode;
+	struct drm_connector *connector;
+	struct drm_crtc *crtc;
+	unsigned int val;
+
+	/*
+	 * Retrieve the CRTC adjusted mode. This requires a little dance to go
+	 * from the bridge to the encoder, to the connector and to the CRTC.
+	 */
+	connector =3D drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
+	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
+	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
+	mode =3D &crtc_state->adjusted_mode;
+
+	/* Set retimer/redriver mode based on pixel clock */
+	val =3D mode->clock > data->retimer_threshold_khz ? TMDS181_CTRLA_DEV_FUN=
C_MODE : 0;
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+			   TMDS181_CTRLA_DEV_FUNC_MODE, val);
+
+	/* Configure TX termination based on pixel clock */
+	val =3D mode->clock > HDMI2_PIXEL_RATE_KHZ ?
+				TMDS181_CTRLB_TX_TERM_75_150_OHMS :
+				TMDS181_CTRLB_TX_TERM_150_300_OHMS;
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRLB,
+			   TMDS181_CTRLB_TX_TERM_CTL,
+			   FIELD_PREP(TMDS181_CTRLB_TX_TERM_CTL, val));
+
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
+			   TMDS181_CTRL9_PD_EN, 0);
+}
+
+static void tmds181_disable(struct drm_bridge *bridge, struct drm_atomic_s=
tate *state)
+{
+	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
+
+	/* Set the PD_EN bit */
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
+			   TMDS181_CTRL9_PD_EN, TMDS181_CTRL9_PD_EN);
+}
+
+static const struct drm_bridge_funcs tmds181_bridge_funcs =3D {
+	.attach		=3D tmds181_attach,
+	.mode_valid	=3D tmds181_mode_valid,
+	.atomic_enable	=3D tmds181_enable,
+	.atomic_disable	=3D tmds181_disable,
+
+	.atomic_reset =3D drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
+};
+
+static const u8 tmds181_id_tmds181[8] __nonstring =3D "TMDS181 ";
+static const u8 tmds181_id_dp159[8]   __nonstring =3D "DP159   ";
+
+static int tmds181_check_id(struct tmds181_data *data, enum tmds181_chip *=
chip)
+{
+	int ret;
+	int retry;
+	u8 buffer[8];
+
+	for (retry =3D 0; retry < 20; ++retry) {
+		ret =3D regmap_bulk_read(data->regmap, TMDS181_REG_ID, buffer,
+				       sizeof(buffer));
+		if (!ret)
+			break;
+
+		/* Compensate for very long OE power-up delays due to the cap */
+		usleep_range(5000, 10000);
+	}
+
+	if (ret) {
+		dev_err(&data->client->dev, "I2C read ID failed\n");
+		return ret;
+	}
+
+	if (memcmp(buffer, tmds181_id_tmds181, sizeof(buffer)) =3D=3D 0) {
+		dev_info(&data->client->dev, "Detected: TMDS181\n");
+		*chip =3D tmds181;
+		return 0;
+	}
+
+	if (memcmp(buffer, tmds181_id_dp159, sizeof(buffer)) =3D=3D 0) {
+		dev_info(&data->client->dev, "Detected: DP159\n");
+		*chip =3D dp159;
+		return 0;
+	}
+
+	dev_err(&data->client->dev, "Unknown ID: %*pE\n", (int)sizeof(buffer), bu=
ffer);
+
+	return -ENODEV;
+}
+
+static bool tmds181_regmap_is_volatile(struct device *dev, unsigned int re=
g)
+{
+	switch (reg) {
+	/* IBERT result and status registers, not used yet */
+	case TMDS181_REG_EYESCAN_15:
+	case TMDS181_REG_EYESCAN_17 ... TMDS181_REG_EYESCAN_1F:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config tmds181_regmap_config =3D {
+	.reg_bits =3D 8,
+	.val_bits =3D 8,
+	.cache_type =3D REGCACHE_RBTREE,
+	.max_register =3D TMDS181_REG_AUX,
+	.volatile_reg =3D tmds181_regmap_is_volatile,
+};
+
+static int tmds181_probe(struct i2c_client *client)
+{
+	struct tmds181_data *data;
+	struct gpio_desc *oe_gpio;
+	enum tmds181_chip chip;
+	int ret;
+	u32 param;
+	u8 val;
+
+	/* Check if the adapter supports the needed features */
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
+		return -EIO;
+
+	data =3D devm_drm_bridge_alloc(&client->dev, struct tmds181_data, bridge,
+				     &tmds181_bridge_funcs);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	data->client =3D client;
+	i2c_set_clientdata(client, data);
+	data->regmap =3D devm_regmap_init_i2c(client, &tmds181_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
+	/* The "OE" pin acts as a reset */
+	oe_gpio =3D devm_gpiod_get_optional(&client->dev, "oe", GPIOD_OUT_LOW);
+	if (IS_ERR(oe_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(oe_gpio),
+				     "failed to acquire 'oe' gpio\n");
+
+	if (oe_gpio) {
+		/* Need at least 100us reset pulse */
+		usleep_range(100, 200);
+		gpiod_set_value_cansleep(oe_gpio, 1);
+	}
+
+	/* Reading the ID also provides time for the reset */
+	ret =3D tmds181_check_id(data, &chip);
+	if (ret)
+		return ret;
+
+	/*
+	 * We take care of power control, so disable the chips PM functions, and
+	 * allow the DDC to run at 400kHz
+	 */
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
+			TMDS181_CTRL9_SIG_EN | TMDS181_CTRL9_PD_EN |
+			TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE |
+			TMDS181_CTRL9_I2C_DR_CTL,
+			TMDS181_CTRL9_PD_EN |
+			TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE |
+			TMDS181_CTRL9_I2C_DR_CTL);
+
+	/* Apply configuration changes */
+	if (of_property_read_bool(client->dev.of_node, "ti,source-mode"))
+		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+				   TMDS181_CTRLA_MODE_SINK, 0);
+	if (of_property_read_bool(client->dev.of_node, "ti,sink-mode"))
+		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+				   TMDS181_CTRLA_MODE_SINK, TMDS181_CTRLA_MODE_SINK);
+
+	/*
+	 * Using the automatic modes of the chip uses considerable power as it
+	 * will keep the PLL running at all times. So instead, define our own
+	 * threshold for the pixel rate. This also allows to use a sane default
+	 * of 200MHz pixel rate for the redriver-retimer crossover point, as the
+	 * modes below 3k don't show any benefit from the retimer.
+	 */
+	data->retimer_threshold_khz =3D 200000;
+	if (!of_property_read_u32(client->dev.of_node,
+				  "ti,retimer-threshold-hz", &param))
+		data->retimer_threshold_khz =3D param / 1000;
+
+	/* Default to low-power redriver mode */
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+			   TMDS181_CTRLA_DEV_FUNC_MODE, 0x00);
+
+	if (of_property_read_bool(client->dev.of_node, "ti,adaptive-equalizer"))
+		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+				   TMDS181_CTRLA_EQ_EN | TMDS181_CTRLA_EQ_ADA_EN,
+				   TMDS181_CTRLA_EQ_EN | TMDS181_CTRLA_EQ_ADA_EN);
+	if (of_property_read_bool(client->dev.of_node, "ti,disable-equalizer"))
+		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+				   TMDS181_CTRLA_EQ_EN | TMDS181_CTRLA_EQ_ADA_EN,
+				   0);
+
+	switch (chip) {
+	case dp159:
+		val =3D 0;
+		if (!of_property_read_u32(client->dev.of_node,
+					  "ti,slew-rate", &param)) {
+			if (param > 3) {
+				dev_err(&client->dev, "invalid slew-rate\n");
+				return -EINVAL;
+			}
+			/* Implement 0 =3D slow, 3 =3D fast slew rate */
+			val =3D FIELD_PREP(TMDS181_CTRLB_SLEW_CTL, (3 - param));
+		}
+		if (of_property_read_bool(client->dev.of_node, "ti,dvi-mode"))
+			val |=3D TMDS181_CTRLB_HDMI_SEL_DVI;
+		break;
+	default:
+		val =3D TMDS181_CTRLB_DDC_DR_SEL;
+		break;
+	}
+
+	/* Default to low-speed termination */
+	val |=3D FIELD_PREP(TMDS181_CTRLB_TX_TERM_CTL, TMDS181_CTRLB_TX_TERM_150_=
300_OHMS);
+
+	ret =3D regmap_write(data->regmap, TMDS181_REG_CTRLB, val);
+	if (ret < 0) {
+		dev_err(&client->dev, "regmap_write(B) failed\n");
+		return ret;
+	}
+
+	/* Find next bridge in chain */
+	data->next_bridge =3D devm_drm_of_get_bridge(&client->dev, client->dev.of=
_node, 1, 0);
+	if (IS_ERR(data->next_bridge))
+		return dev_err_probe(&client->dev, PTR_ERR(data->next_bridge),
+				     "Failed to find next bridge\n");
+
+	/* Register the bridge. */
+	data->bridge.of_node =3D client->dev.of_node;
+
+	return devm_drm_bridge_add(&client->dev, &data->bridge);
+}
+
+static const struct i2c_device_id tmds181_id[] =3D {
+	{ "tmds181", },
+	{ "sn65dp159", },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, tmds181_id);
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id tmds181_of_match[] =3D {
+	{ .compatible =3D "ti,tmds181",  },
+	{}
+};
+MODULE_DEVICE_TABLE(of, tmds181_of_match);
+#endif
+
+static struct i2c_driver tmds181_driver =3D {
+	.driver =3D {
+		.name	=3D "tmds181",
+		.of_match_table =3D tmds181_of_match,
+	},
+	.probe		=3D tmds181_probe,
+	.id_table	=3D tmds181_id,
+};
+
+module_i2c_driver(tmds181_driver);
--=20
2.43.0


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
