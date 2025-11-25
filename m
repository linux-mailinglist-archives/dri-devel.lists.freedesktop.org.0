Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE44EC850B6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 13:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF2A10E3D6;
	Tue, 25 Nov 2025 12:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="QOQJ3QNq";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QOQJ3QNq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C169210E3D6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 12:57:08 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eTwtvWDl4/547+e/KoDJtolaCpDdK7aKzvHiYu1qG6KW5wE8ZV3qaXHZRuR6XoXW7bvC67zRqH0bH3emW1ulHvlQmXK3WYWF85ruuwO+LU0gB8eHZtPJBGJhn86gzJb279/ANvlTAOx8B0fwN3MY4EuONFhBCioC8KA820eeWsIo5izA5QpGr6+Fv3GqvpHvoOVZT45sE2I8gbFsvUsm99SgViFKCf59xNm6Ch/X94wVavorc8j7a7OOaHch35ssV+3le/CQ2oeqcq6+o22LekKVObhD9xLAPjuoyczYOwmFdj9iX2Gl0vP5VZVcmsrh/2sJlGkXXsz5GE8dt9WKMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wS6PRtgAhNisREd/aoz1oCMA9jgqJamgFreItyyyK8=;
 b=xA+SxZ9g+9OO11kMDnEz4pEyE5fbUsLJXOjifGQF5Qh2tdW5vEGT/ACrVobmocHssmH00RFPm5/BvWq2PDBg/+t+tabNDJhdNOWAHgVoTmhGw+fvV/EJjrUcvq5miKSLxg3ih//7/3nNGl7IloVsnrEE/Fc9RQB9+Z3MWkZD1dzBaZbmFZod9pcrZQ0XAAg0622HEq2yztiPVaDNyxO+rBIgMaJM4/sVERQSzwjWMJk3n8ux5effPDBYJiTSuwqv7OfYOuXSvTx0fYWIaIkdgQ4pa7Da8G9Qo+5xgU4zHJ2VSO6HJWqFN6p7qfX7njn/BvWEJ+6QqxfJuc57IyGzRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wS6PRtgAhNisREd/aoz1oCMA9jgqJamgFreItyyyK8=;
 b=QOQJ3QNqZQv6q/aIcTlIZtMDB3JD/qd+oHkvAFZ0zGuI0Jcyru4lf6n4XC+Y6OU8Mato2hFE5in32mYaUw3SZsdkc/AGhP1RJdgUG5VCjVE5Zp+Wgjn1zdj5E9epdJ93HlO7ukoR1XzVkCcWkdsiSCcFiMXvieADLxae/wrKO54=
Received: from AS4P250CA0005.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::16)
 by PA4PR08MB7482.eurprd08.prod.outlook.com (2603:10a6:102:2a6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Tue, 25 Nov
 2025 12:57:02 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5df:cafe::6c) by AS4P250CA0005.outlook.office365.com
 (2603:10a6:20b:5df::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Tue,
 25 Nov 2025 12:57:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.0 via
 Frontend Transport; Tue, 25 Nov 2025 12:57:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAYwUofXA1AcddeWu/jYXTN+fB11nslspW3aLvJlTT0OF2qHC1ahc96p2DvqELdwazXUHrr5Kxl7swboz6whFPMtBjqKRpcydANEy1b5d1SoPveYrn7rF1ZBC3fkODz/Vcguwje2/NgI4uJ2JRFnyEbVP4G0UGvvSbuulaDeH0tN6IliH5JbZ7R0N9tqL7j5pEe528IgfOJ9FPGlwNa9Lq0qvJkBELb1ol9vrkH/W+qvP4/r+d3WRUVHDnWEsuPocruJFKv94rf7JSiqUrx8Bqs1S4ujhL+Sm0n/68vOVmXS0FQawFjtpgFhH/N3JNGsFcefryw7frL0S9s55wyvwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wS6PRtgAhNisREd/aoz1oCMA9jgqJamgFreItyyyK8=;
 b=dlGaHpdJlmHFBlnZzvotsKBd2b0sDdSzVZ8dQtZYmgtpqZUllxlJj+aj6yH0XZ6g3iSywSzbwc0nCW8b1+itMShieuQPBkoKkS+P8zG4lUYJdcSuCCfoEhpnL3CmrV5sutnI+Rz8pnK0N5VAhzYilmZmxMUbNB3ButqzfFCihl6aOGiizcWgu+sWc+5LoB4bAvpKKWm7ADyO69zfuSUwo5+2nkPTxZDPiaMZE/X6GWxqV+VpLB2eDa0sgwG6HtH4p2XPbwC5zMSrcR7nEv45ZCFTqAOJ399EeAIr1ZnUpZ3a70Jwnp7WGssbvx7yFHYRk+qW9JDpwjstEbq4ZRIWww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wS6PRtgAhNisREd/aoz1oCMA9jgqJamgFreItyyyK8=;
 b=QOQJ3QNqZQv6q/aIcTlIZtMDB3JD/qd+oHkvAFZ0zGuI0Jcyru4lf6n4XC+Y6OU8Mato2hFE5in32mYaUw3SZsdkc/AGhP1RJdgUG5VCjVE5Zp+Wgjn1zdj5E9epdJ93HlO7ukoR1XzVkCcWkdsiSCcFiMXvieADLxae/wrKO54=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB3PR08MB8937.eurprd08.prod.outlook.com
 (2603:10a6:10:43c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 12:56:29 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 12:56:29 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/8] drm/panthor: Implement soft reset via PWR_CONTROL
Date: Tue, 25 Nov 2025 12:55:45 +0000
Message-ID: <20251125125548.3282320-6-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125125548.3282320-1-karunika.choo@arm.com>
References: <20251125125548.3282320-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0112.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::15) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB3PR08MB8937:EE_|AM4PEPF00025F96:EE_|PA4PR08MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: feb28709-baa7-489b-fc0f-08de2c222063
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?49PPti3nfPlz9o700nCik9vOx6SKFYh22thTvKzLTO34pT0jNOpMxu7c6NP1?=
 =?us-ascii?Q?/vz4ktOLvwqv/47g7ieQQL1s006GENofxT9kNUjXtv4DrBcUUzX9x41oS8Gd?=
 =?us-ascii?Q?wDRG7C/H6yvC/mCkdmUW4QmpjCIHkyI4sput9ihZ9/EqibnQmoh+X0pM8oQS?=
 =?us-ascii?Q?jmUDhpbweWKtThe8G5NJ+8ipgwnWUM12AUYQaTnGcmrycB5CuDpxuc4oCJ3M?=
 =?us-ascii?Q?Vj1Sy5JabkOhOMwZO26zwOpBxi8s9jIgUqtJCRG/tw3JvPGnaMzvhHTaJUPI?=
 =?us-ascii?Q?QNcJNs/k8UuUCdBfRHu/BESW231o4NMXDLvo2OUdAmqIS4oTvz/g9XKq3D0w?=
 =?us-ascii?Q?d0i04J6pyd7+Io3Cnuvl9aCQ9WXjZi+IVn28vhumDVYp77X/prrWIGQscmOW?=
 =?us-ascii?Q?yuncYOHvRPRDepgTm3YcuPWi40uPo+n6hp+ONQsLpJBNYW/FVQEYqsgBZ69h?=
 =?us-ascii?Q?vAXdpuAFrP3EweS+wd7bZTLyYXiFujtTEf1pYtVFaSrtXW2gAh6u9N8NN3lu?=
 =?us-ascii?Q?r/68nSWSHj1VB0CtQCyKTll0GnRkBjclph6pfLxb/sQtsa0KQU69xl0eOH7+?=
 =?us-ascii?Q?2KYSrqBUx/r7k1ALyQ2xE4FbChnS/ce6vFDNu8MdjCqbLjBsQwGix4FK5oRJ?=
 =?us-ascii?Q?wNSzQycCUCzesm5WytmTRZOef0JXHyaMtKFHCouHg7bg0U5WRIileJUQ4JN1?=
 =?us-ascii?Q?bP92g4qvKOloi0MgAR+bDoW06dd/WTmRwwtGFI8C7ykfIA+NyRi55S9+FUSM?=
 =?us-ascii?Q?JFdccwfBCGfPr3VbtzN8C7UkxzgPzch8X93gIq2ppG1UI8G01kFliIYaiFPm?=
 =?us-ascii?Q?/fGilZxqT9IvGSq7SVKtL93/gaygPfBxnhsaF5JAn7Xrm/aNeHdGArPb/7wd?=
 =?us-ascii?Q?e7B3YXjdTxy/AMcWGqd5pjgy8tfBXvcs7hcOrpU18LvXGjoq2Cpirs+2z7Lc?=
 =?us-ascii?Q?dNryWSO6LYJTAdc0uXHcLrW0w/CkF491keXIR3eKmQE00kHzwYL82nvjME9+?=
 =?us-ascii?Q?LlFx8vwuIMHzsDYs9Uc4LEd9HBehco6sIczjybeM5n3cW4mKj8xnrV5VSfSv?=
 =?us-ascii?Q?ldigjqcKfcSgUEBQLXYv4IHl+7LgTOXOxotr+mZNYflaV/qbC6X2J1gwe3Gt?=
 =?us-ascii?Q?oDzDYSruB+NrzZnDhqWosK40tylEJiBE5izwEfknVPzyE5NVWTT3ARrSCoPF?=
 =?us-ascii?Q?nFDvlb8VF43631/om1qVGJNmloF3L3JFGM/66Lieem9zIa/IH1P8kGVoAwV2?=
 =?us-ascii?Q?OY78RQKeMTr7eYm0/T5zRoS/cHYjQ4vme744jMQyxE1pZMnrfLdx9EC90T7B?=
 =?us-ascii?Q?hYGsKlo+6EbKGHFR7JNiDlrSUW1+MGAwFOnNmired/VgU5F/d+N6rQbonw2U?=
 =?us-ascii?Q?2PcyJbttmKJNwdX7+a4zkKmxBrRtxSGA4KwEt/eU9kPi/JLUexLqb+U8wSS0?=
 =?us-ascii?Q?ugfvwWYP45sWrDcSCKxeebkHwzSb36yJ?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8937
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9ee131c1-965a-4acc-63f2-08de2c220cd1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|1800799024|82310400026|376014|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b4F8rfwMF2QjjymWsh/2zbxyMuv/VhnUWWRMIPRABpiQYIjzFw1FgDN/DTqL?=
 =?us-ascii?Q?RpBTZKz5goeJeG4P8lBW2ZgaQ3tsTHC5HsR+TrjvheiW552lkvXxQy2+LslZ?=
 =?us-ascii?Q?MkY3Dhg6d1oGSl6kcuJ9EGcJ9ek7ruyS3wDqjxDP+79/lmzUXuXmpw9mEjQz?=
 =?us-ascii?Q?LIJ6qkkhVJUsGhKjqyl2W+fM/nY0qcEmzSMM9avRDMGG19W856V9+lVgxIRD?=
 =?us-ascii?Q?kxCQinC6Oyl3TnnmpsHIIKA+evQ/BdPrcof1TNcMO8TMZ9EX6Q5ROzA4TZSf?=
 =?us-ascii?Q?K4GpepujC0Od5Lq2mjJgR0z7zlu6yXztI+2Lr/wkkvU/r4B05WcJ52bgKYGV?=
 =?us-ascii?Q?773pXlr0Yjvw6paljMh3iyB90E3Z+JqKrMslLkTInsRjQE0rxdctw6okDoTU?=
 =?us-ascii?Q?ZeZnjZ4KR5QiTfUprg+qHbWAciho83ZVCsTbwG566T4XWOpwbk3iOiDMrmwU?=
 =?us-ascii?Q?sWaBKjw+lXl3XeQgGD0HIhSetDzzWyLrN7LbmysHTwJD2FaOp6Vy3AbqS95n?=
 =?us-ascii?Q?9NCD5m3BpBvz/GXJ5LWs61Iha6FsrM8nENLpxiHR289ooFOSVzJhEPOQzwD+?=
 =?us-ascii?Q?wnYMrK1Pl++IwiDQNwe9ajBSoN4TryaYskvXnN2LCvVY9HzQo0Kql3rlWapG?=
 =?us-ascii?Q?A2hpK6lCYgfNKOQki48YQvf/WXVSggGwRvrVsMBKy788bTKoQOHbVbtFHQ0r?=
 =?us-ascii?Q?jtnOdz/E3T3IfZgEk+Q3MpbyLeR3OOdJQZt2SQJRtEl/N1YIpFw4sEAiPN+/?=
 =?us-ascii?Q?t7rdz44C7GAVgZ4xCuNVFVz3r6YFjg3hLXL8g/Q+yGBBD7HVHcFfJiXDCTIa?=
 =?us-ascii?Q?SZSFP4LREI1rxa4S9qQzwQmQ9w3kFir25HZApFln+Bbe4CA3vEv5O5I2rCLF?=
 =?us-ascii?Q?zI/A4YY1wR37TBzqoD8wi7ig0MWlVhkl3IrZsbLZz2zFCOMp/2zHhUZVfc42?=
 =?us-ascii?Q?innHXawzyjeFLzV3aloEDqm7ODXLIo2UsbGU5iZYtMWCmeHTkRD6nU9AcUxw?=
 =?us-ascii?Q?cO3QzHePO3ZolexUZezfWG3bHYiR0UtBrwQ05VDepeueKs1h4kc23C+rcUpi?=
 =?us-ascii?Q?Mw4QxWbUtUs75nere+z8/YYpaiwBVC/7v3PgNZA+G30N3Q+jCUY6op/rXENp?=
 =?us-ascii?Q?JA74gx/es33IsM1gJ99BZAs5Uq7m5RKGZR9mXExsNIPfcMMlNYRLrr3hEMWu?=
 =?us-ascii?Q?Ray7yxceEjkfLkoo8IyOw5q9rWluySujMD9cniRS3kcFR8WHYVZseVa2XJX3?=
 =?us-ascii?Q?KHzGiod1hFRg7nHfHKAJO1wPjOf9t3/94efEpa6BelxL+1VWWUmTXIZ/0rqc?=
 =?us-ascii?Q?E/IPJSbLpDdyGaFYrViRvRmTKXssIp1Dkg3zVly7yUJMneW6rG48pBIvARo6?=
 =?us-ascii?Q?qXn3IXtzfBwRJQBg+ipbqOzjsesXix7nBxYYRa6ZYzjxGPSeO4ET/L9lEfZh?=
 =?us-ascii?Q?xvkDrgEtoKuO0sXG0cqcen4axPPviR87pRVU3na3cLAGM9dHPEXVm0spnERZ?=
 =?us-ascii?Q?4Zh3NGSAnedjRn17yyeWtbs1J86k0JkaFg60P9oFmSTjKYj+1R24rDsp/KAk?=
 =?us-ascii?Q?jWBT7cT53zeBuYfeXXU=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(1800799024)(82310400026)(376014)(36860700013)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 12:57:01.6274 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feb28709-baa7-489b-fc0f-08de2c222063
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7482
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

Add helpers to issue reset commands through the PWR_CONTROL interface
and wait for reset completion using IRQ signaling. This enables support
for RESET_SOFT operations with timeout handling and status verification.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
 * Picked up R-b from Steve.
v2:
 * Dropped RESET_FAST implementation as it is not currently being used.
 * Renamed reset_completed to reset_pending to align with underlying
   logic and fixed the logic of its callers accordingly.
 * Improved readability of panthor_pwr_reset() and removed inline
   ternary expressions.
---
 drivers/gpu/drm/panthor/panthor_pwr.c | 50 +++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h |  2 ++
 2 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
index 6dff5daf77d2..57cfc7ce715b 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.c
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -3,6 +3,7 @@

 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
+#include <linux/cleanup.h>
 #include <linux/iopoll.h>
 #include <linux/wait.h>

@@ -32,6 +33,8 @@

 #define PWR_RETRACT_TIMEOUT_US		(2ULL * USEC_PER_MSEC)

+#define PWR_RESET_TIMEOUT_MS		500
+
 /**
  * struct panthor_pwr - PWR_CONTROL block management data.
  */
@@ -76,6 +79,43 @@ static void panthor_pwr_write_command(struct panthor_device *ptdev, u32 command,
 	gpu_write(ptdev, PWR_COMMAND, command);
 }

+static bool reset_irq_raised(struct panthor_device *ptdev)
+{
+	return gpu_read(ptdev, PWR_INT_RAWSTAT) & PWR_IRQ_RESET_COMPLETED;
+}
+
+static bool reset_pending(struct panthor_device *ptdev)
+{
+	return (ptdev->pwr->pending_reqs & PWR_IRQ_RESET_COMPLETED);
+}
+
+static int panthor_pwr_reset(struct panthor_device *ptdev, u32 reset_cmd)
+{
+	scoped_guard(spinlock_irqsave, &ptdev->pwr->reqs_lock) {
+		if (reset_pending(ptdev)) {
+			drm_WARN(&ptdev->base, 1, "Reset already pending");
+		} else {
+			ptdev->pwr->pending_reqs |= PWR_IRQ_RESET_COMPLETED;
+			gpu_write(ptdev, PWR_INT_CLEAR, PWR_IRQ_RESET_COMPLETED);
+			panthor_pwr_write_command(ptdev, reset_cmd, 0);
+		}
+	}
+
+	if (!wait_event_timeout(ptdev->pwr->reqs_acked, !reset_pending(ptdev),
+				msecs_to_jiffies(PWR_RESET_TIMEOUT_MS))) {
+		guard(spinlock_irqsave)(&ptdev->pwr->reqs_lock);
+
+		if (reset_pending(ptdev) && !reset_irq_raised(ptdev)) {
+			drm_err(&ptdev->base, "RESET timed out (0x%x)", reset_cmd);
+			return -ETIMEDOUT;
+		}
+
+		ptdev->pwr->pending_reqs &= ~PWR_IRQ_RESET_COMPLETED;
+	}
+
+	return 0;
+}
+
 static const char *get_domain_name(u8 domain)
 {
 	switch (domain) {
@@ -429,6 +469,16 @@ int panthor_pwr_init(struct panthor_device *ptdev)
 	return 0;
 }

+int panthor_pwr_reset_soft(struct panthor_device *ptdev)
+{
+	if (!(gpu_read64(ptdev, PWR_STATUS) & PWR_STATUS_ALLOW_SOFT_RESET)) {
+		drm_err(&ptdev->base, "RESET_SOFT not allowed");
+		return -EOPNOTSUPP;
+	}
+
+	return panthor_pwr_reset(ptdev, PWR_COMMAND_RESET_SOFT);
+}
+
 void panthor_pwr_l2_power_off(struct panthor_device *ptdev)
 {
 	const u64 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
index 3c834059a860..adf1f6136abc 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.h
+++ b/drivers/gpu/drm/panthor/panthor_pwr.h
@@ -10,6 +10,8 @@ void panthor_pwr_unplug(struct panthor_device *ptdev);

 int panthor_pwr_init(struct panthor_device *ptdev);

+int panthor_pwr_reset_soft(struct panthor_device *ptdev);
+
 void panthor_pwr_l2_power_off(struct panthor_device *ptdev);

 int panthor_pwr_l2_power_on(struct panthor_device *ptdev);
--
2.49.0

