Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE3C9B0424
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 15:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B069010EAD7;
	Fri, 25 Oct 2024 13:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="ZWEgli3y";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZWEgli3y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2071.outbound.protection.outlook.com [40.107.249.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB7210E0EA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 14:55:15 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mEYu5cQaSALHuOwa8Ris5FviKRbkItVlZYeHZISZRWHlICpLY7iKPCoCRjFsdUwoOdCL9xsAN+BrSco8LMhdWLVdn/6cPVRWHeX8xL7hxdMEgAuSDhlfFUfaFQpTYh+3Mj9guW1OExNDwSWExhI3O+rgOJt47Q/aUR7y0bB2nW4a1RnXnGYjRxPD8DETewE2nGXbhV1X0XNy515um2pVXqbMZnICKbNJeMcnwqkAqnQyxzOpF6W3YAU+M/vURqE8o6+HopjIi5UJBIA6ihvXN6eVsTPHn3FwQjTg6zZeNIdsPjjBfKbdZHYDpHB/sZmxV6hYqEg59+M2iDedc3lF0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6ZeSwAQSamrB2cR294FVChtktsrCelRH9urLxMHwVU=;
 b=yQ/2+7VgC98MUM+uR8psC0PP8nLWcITnSzeQBlL8L4mj/+qik3bICaQCLp6raAfO1IHU3HPD9bNWXYp4gnqyGfEf3F3oqX4B8FyWWn/dArWHwtVda/hBGGShM1cqZp2On9QIHpxENbPr7N4rxf78iHjefiCiSwRpjuudeKqRHBodsJgQbxrL46pwbyROWit/Gs8r7zIZCMY93BC4thfxo+rGS1SShD70qZrt2HNy+tcpg5n/J4cJeaqICqFs7V20sdM6hLAXEHZSTLbOjaWRv1El7Rot01CSc7BevOO8vQIeOFw837zXm51ReaAgIKO4P87+kDYfHCVNgGO3+J3ptw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6ZeSwAQSamrB2cR294FVChtktsrCelRH9urLxMHwVU=;
 b=ZWEgli3y3d6OCRN1PTdBqEKXOiS1hA3/3WaD6phwhSidRIFHRsnT6NWu4YG0jdQvKZuADBce7Lz79KWLsvoT7abdRAYZ522im6CJqw2O5aG7XdIt3rK+cWbvSw0bGY9YVvRMvNmT0yVK8SudjhpDr+nUUv1Med8GRqyyy+5aPoQ=
Received: from MW4PR03CA0007.namprd03.prod.outlook.com (2603:10b6:303:8f::12)
 by DU0PR08MB9251.eurprd08.prod.outlook.com (2603:10a6:10:41a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 14:55:07 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10b6:303:8f:cafe::a5) by MW4PR03CA0007.outlook.office365.com
 (2603:10b6:303:8f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
 Transport; Thu, 24 Oct 2024 14:55:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Thu, 24 Oct 2024 14:55:04 +0000
Received: ("Tessian outbound 99870d44e01c:v490");
 Thu, 24 Oct 2024 14:55:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 45a0a018f56e3c6d
X-TessianGatewayMetadata: 5xcGNrjZyIrsIvYsheUjfctmuVkcjhbzp0TiZl0YQDJfoCLiE5km++5aWrwFm5OJcnk0wLbQobtkG/pCbIt3LtYXaoxofmf9wSTJ+is4K4d+slPJ/D81JuK7Xk6daoub1+yLtrIAIeStr2OxKO0cwtULpqnd4BUWm8lrhOkFFKQ=
X-CR-MTA-TID: 64aa7808
Received: from L4633a9386ab5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9B6C49F9-6694-4ED0-B99F-EB95789D90FC.1; 
 Thu, 24 Oct 2024 14:54:57 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L4633a9386ab5.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Oct 2024 14:54:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRBWXBIF9coQp+uZPu0NGIKa/VYfZni9husuOgqh+4ORQLB9HSo5+CyBFhkGzwOAh522LT5msJ7YSv/ILXz1ZrHpYJuSH+lgmtG9FA+NnT792wwrKgqXRjOMd3KSq+xKyixDw0grDKFZ+u+HEONaYjkPtbUqotxJxeDcQKMMi5y3mtSQO/JcTgHqtOHnIP4omVO387NSalP4VgR03r4a2c+NbKb4DFFYTFvGQte8DkcCqaIfMIVAcir07ANsZGcP/E4xnzKRqlIn9uv3qa6sLaIQ0DUuQhUlbn6wzeGbMyUOV2o3FDDOKwXOl6Q5OzZEzcTttF8TQ/4FbZze4mWirA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6ZeSwAQSamrB2cR294FVChtktsrCelRH9urLxMHwVU=;
 b=ZSBcl7RhzCQ4eX1LZ4CQlbxD6cS1mEfevXrMnk6HFW/pnmp8PONSApB+tla8RXxuM/WbqrYfUV1nK2uq+GWe4aYPD0QBSxfHkWu1EL/1tYNuxmlAunP+Jf4XBIQwGRpE76qC76ViEBHar9YefsmN88q7wkSQfvjOdPFyNO3g3IIL40X3byiOPtKAyi1mwpn6B6ceCUFkiM7LniROY/AAzWnKc3WuvLvt8q8UgaVAiP9xPJB/CZ3fPeul5i8Vnb4d4f8/mpoRb5CYAZiEvh0yn18o9hQezihgH0SDNIOfnp4LWoSdf2zgm/Y65OyIqtqat+ozeK3AJv9Prd4Go3vdLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6ZeSwAQSamrB2cR294FVChtktsrCelRH9urLxMHwVU=;
 b=ZWEgli3y3d6OCRN1PTdBqEKXOiS1hA3/3WaD6phwhSidRIFHRsnT6NWu4YG0jdQvKZuADBce7Lz79KWLsvoT7abdRAYZ522im6CJqw2O5aG7XdIt3rK+cWbvSw0bGY9YVvRMvNmT0yVK8SudjhpDr+nUUv1Med8GRqyyy+5aPoQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by PAVPR08MB9650.eurprd08.prod.outlook.com (2603:10a6:102:31a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 14:54:55 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%3]) with mapi id 15.20.8069.016; Thu, 24 Oct 2024
 14:54:55 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com, florent.tomasin@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH 0/3] drm/panthor: Coherency related fixes
Date: Thu, 24 Oct 2024 15:54:29 +0100
Message-Id: <20241024145432.934086-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0271.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::7) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|PAVPR08MB9650:EE_|DB1PEPF00039231:EE_|DU0PR08MB9251:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb64cba-1124-41e3-53e3-08dcf43bd827
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?FRwrQb3hEfsBvKe+jpQttu4i/NDDbnvk/6SO/dOd/vKYagZDwo9uLSr1SywA?=
 =?us-ascii?Q?v/PM/XpXAo6ehKr+LqpgxwMHsV8FJJ0YVYKTsq35R9wBY8k6cmghcyQ+eZvs?=
 =?us-ascii?Q?0GnlJ8bL+6nuUz9eGIRdR0jz2fdpAJJ8fDwWUw/varpbGz/9J8Yar5i2tHw9?=
 =?us-ascii?Q?rozqj8lTNZ8mKWoAH3mJlBoKOLFwLMExwKpVUeuFBt22o7fVzpra9sH2TgAw?=
 =?us-ascii?Q?wY4MJ1rx/Bau6Is3Th61loXUmnI6x1AMgzjJRLkA0VEAAdx136r9anAB4i2V?=
 =?us-ascii?Q?iX2d8RlAHxHpNXpc8LX+FivZSo5fbxJFFjVVxFIn0v1nl+vaVaO+6SR0zoFi?=
 =?us-ascii?Q?GEwf3HCJ0LjrpoOWEM5Tk9vpEtT/8qcwBqmVqWT+725/BP9+HpNClDEot5KH?=
 =?us-ascii?Q?Ojlq/JNlalBZ/BUPBwq8k6bMucsiTuXbKp/EmE8Bzo183KeGYEVrLTB2l66S?=
 =?us-ascii?Q?ii7oAaDs32IToX0swBVbKQ+/vxFw86xSaSwXc6u34E0DXQfCagymqT0Cc94G?=
 =?us-ascii?Q?PhJEQnerOJ5ydfxaG0emQkrBtt8n07uCT3g5BFqOBwcDdkXKNWKfaDpXAITx?=
 =?us-ascii?Q?h6XcMe/OO/KzzoO1iz3NYi1kWv4gRhdpF8KCTvxT8fa6ijewK+lgBWeqeI2o?=
 =?us-ascii?Q?qhi5ilQ0jPg68qK0E96iGDy71bG/6yz9IeiLY+TcsB/NUf3gH7Y1Kxf0Cyps?=
 =?us-ascii?Q?TXf0neWB18qfZEUy9Fz6/6q5j+i7Z4W4MTpQRpA2FdIGiEnh9rujIzoIeG0w?=
 =?us-ascii?Q?r5Im/lXVbhZT6M+URDRdGBwyzK+AH8bs24TiL3amd8jvk+8j26d6L+DwndKg?=
 =?us-ascii?Q?lo8MiARcKEniQOy20YgkF8OPsCoJpVZ5ASzfuQE5YDJyEU4XtQwM/IQ56+8w?=
 =?us-ascii?Q?XmwF9yA0t4Ce6NQcpeybH70aFfl8w7c+av8UTB+X9iQ7a6zEXaToCSFzYnfY?=
 =?us-ascii?Q?xjXWejl+AIGj3QeVtXdhDDYbtLeeZA61EGyQU0kAHBvi+RQprFK3gRlVIrEc?=
 =?us-ascii?Q?QD+nJboC8p0FbBLeoei+Er5zMl3ezzJYm4Xq+zEXWOM5RzIile5MAW08KEhu?=
 =?us-ascii?Q?t5DfJpM+pKnWTfKoZK48D16724HS5B4DR0MdBYMJ0Vy552cHwfyulpuYJxxB?=
 =?us-ascii?Q?Kg4txCcTh95EixkrTjBPaWuEOmeqgJh5K5hp7KRjssL3noVTBJOhRJxVb3S0?=
 =?us-ascii?Q?0nLKX27DgZRT4LNOjb0BCOc7hOqXAvRjTsoKUTLyz4G4dsxBPgTXP3PnwQI2?=
 =?us-ascii?Q?HnvwM+HUM04SQW59zq7xnzcTxfe+jMC3+d/tVpIsDX3PzgpU9Q2pIaLfHz73?=
 =?us-ascii?Q?J1LjQUTtKbK1j3hg9svzAgIT?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9650
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:415::16];
 domain=AM9PR08MB6982.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3bc5e371-ed0f-47eb-b4b0-08dcf43bd252
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|35042699022; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A4bjXePYbyKu9EHUAcJfk5nFfqosP2rKBJEqwOiO6YACFrlyQfbuCIeld4pV?=
 =?us-ascii?Q?B1/wL7g92T+W2733eANPzgJe+E2TeFh902ys5b71ITRTcGQzG0NPqBWkl9Ra?=
 =?us-ascii?Q?JJwscgTYJxV+k7fibdSc22r2TbZEc+nnuplsf0qlgP/37MLK6ln/tJsrru8r?=
 =?us-ascii?Q?q8DVE9nw4E+QDSY6ICG4MIZmu4A2TLoSFrLyYzjwpsNCBmLNcmavyf1TiH4q?=
 =?us-ascii?Q?Chq1cLraqEzbIz5+wCdPOJuM/haKVleRkFV3u7uGS959f3clQN0g34/fWbiu?=
 =?us-ascii?Q?7fvspsN6YQQCLWPndxSZK84mIkyeFU6AUXIZnOOea/824vuh4S0CwZcsoQFR?=
 =?us-ascii?Q?rt4eWUFpB52jDJYuTJuJ24+El2wyxlgjsh5Ft+KsVDRRff5nXhBKc8TbI53X?=
 =?us-ascii?Q?xeGhwgWLgoezqdBraiiFkNgLkFet/n3UF3nCQC2zKGuUQniYxycTK5BUiWyn?=
 =?us-ascii?Q?K3nw7u17Qo5KOG+tELNBHC3jxyfRQJZNaC1ndi8cBb8oXGpsH26yZdL8u4kb?=
 =?us-ascii?Q?sYhZtViKBs8VDQES/xGVp/CqQKHP9bLu8lkJZQ9SGmyNsVR6yCxZ4yPavOF2?=
 =?us-ascii?Q?gizo7UUsayPQEVeUSYAmLHnNEomLK6fMohx56ExkHLKnSH4IplBq9zeUi78g?=
 =?us-ascii?Q?YiLlwiwhhgCSQBHk9GYloa2yMEpKBLu+94qbOqw2agr+X0LBkaZR84rFYyZD?=
 =?us-ascii?Q?A7J5bpJF3Ecr8uRlxiqtBaTaaorC0Hf/BwmySDCDyOSxF7SOM6z9pavc/Aeg?=
 =?us-ascii?Q?eNPoQv75LUozZZ/esxpjwSFjIY9cJeYdTiZPR2y+MhMP1zCJfpRqH+eBTDgn?=
 =?us-ascii?Q?0/plsgnYAB7xEeWwW5V5GZssZYp6irahcW85AJt0kqDhxZCSnfMNdUXK97bx?=
 =?us-ascii?Q?kbwtxkruCPgVovrQlJqOmIIoKMmEpXg64WEg6rVP6oILQaIn271OLTeiebY5?=
 =?us-ascii?Q?+LWG977VeZAv4EgCNxPeNmGBpXD3AfJY2LgXhm11Zw16FXHEpC8a04OEzVga?=
 =?us-ascii?Q?m1t7OhfdB84pGLt2CxfF287jPRyarSgp1pxZnh0eZZF/EtAz3NW/6GTYf9rQ?=
 =?us-ascii?Q?dwWn6aDpv9XUnLADMGvqibbFqJ3T7PIp7jrVumlstpqk9IeQtG32Pl7zg0u/?=
 =?us-ascii?Q?ARxmmHBLLNjp8BuWalM4pWLVS+YtiCZfA3GnjwcFRV4ghGl0N5A7XRk8Fsai?=
 =?us-ascii?Q?Ce94sUTRJr4u/ZLugLYoj+25rVyu6kHR5lXuiudquHMKrkucn9MfToo1KdpS?=
 =?us-ascii?Q?R+mJdZesBfkx2NUTfzxAEdfbmD+17vOUNiVwW5GxvHxCxubFcJPtjcqW9X+t?=
 =?us-ascii?Q?Lqcrf162idnK24Q5kpsEOtmvwt6aaqcJ6GPFhkNAAc2nFaF/mJN9Hivzj0Sz?=
 =?us-ascii?Q?UQ6RYnlzg+EonNMEAlX16fLBsVilOFIrREyHT1ArU8Z8e8dozA=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 14:55:04.6002 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb64cba-1124-41e3-53e3-08dcf43bd827
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9251
X-Mailman-Approved-At: Fri, 25 Oct 2024 13:32:50 +0000
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

This patch series contains 3 cache coherency related fixes for the
Panthor driver.
- The first fix, regarding the Inner-shareability, is mandatory to
  ensure things work on all platforms (including Juno FPGA) when
  no_coherency protocol is selected.
- The second fix regarding the coherency feature/enable register is
  required to avoid potential misalignment on certain platforms.
- The third fix, regarding the potential overwrite of buffer objects,
  has been prepared speculatively & it may not be required in practice.
  Please provide feedback on it.

Akash Goel (3):
  drm/panthor: Update memattr programing to align with GPU spec
  drm/panthor: Explicitly set the coherency mode
  drm/panthor: Prevent potential overwrite of buffer objects

 drivers/gpu/drm/panthor/panthor_device.c | 22 ++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.h    | 10 +++++++++
 drivers/gpu/drm/panthor/panthor_gpu.c    |  9 ++++++++
 drivers/gpu/drm/panthor/panthor_mmu.c    | 28 +++++++++++++++++-------
 4 files changed, 60 insertions(+), 9 deletions(-)

-- 
2.25.1

