Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E264B0C231
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B878010E26E;
	Mon, 21 Jul 2025 11:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="K1mdZU/m";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="K1mdZU/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011060.outbound.protection.outlook.com
 [40.107.130.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A5810E26E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:08:36 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ckx1Mtxc9DH/OvxrSjBa8Hil5AK6RQ5UdEEyhJWoNHTxvnwXmnEwUxXFxavrLWHoNg8QpiDtJAnCqoy761e1OKwCfaWBmmJ/PKYhZAG4DPot1G/9P3tNxPRNm5AGFPNqZ8qyzOZip+emySVfRmcskPWo5wGkhsJgueSR4kl8TcIbELZR6L5cg0CCqn28LXhJGC0iOZGCcQpbnrhcCPNrYIXnujsNNS4wUsU5WRSE2xEHS2/JuLwbcse8qqrRiokRUCcrK/C7nKKTuomOjXS4RWh7IEdkVKAtXHJyD58CribwtshHizDtlHWiXG4fMo4vN7Ck8Y7cm0xXhLMMIymWBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgnvO+9d7K+G84VCRRBWzaaYSigvxs/CeK31nvsCRKc=;
 b=Uk+AlQSfg/Xxg/9UXAlbbcFhtWPG4FZ3yBX2itqIGbgGySBT9RPnBg0Y0mDy7nrqGIOk/HtQDFpKvJ+FPI9ezzuuNIGe+1d8VSleKbI8tSZwDHt90c1lu/FRqRXKsfsqXW8OGSa++8MSehPOSkDNGRwnX5WiGPdXOLUrtQ+U+yRLaysn+Km/Y32eQnw+8eeoG0d9rVCVjkC4ICOcMZ/CvI5/3/UE3auL6iRzKXAj+dcOUbeJoZKAyQP/z98FGgNxqlGHCUpLPFhFuwshbjnYknb/wpA7SDhEoSyCLWd1SjW/i0ziU0mq6DmOycvulOqlvCMQB/O8QwuCGagnDO2Mag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgnvO+9d7K+G84VCRRBWzaaYSigvxs/CeK31nvsCRKc=;
 b=K1mdZU/m25r0SlEJnE1gsDGRh+hkX/a7qAsPeZdfsgTSN6GG6hEbjIXVSUw6WjN7gu1OsjkMHzY+zm0OKn3C3S7vKP0p3XiQYSBafNEe8WbwR5UDsVK6FGni7deI+6dvuk2pJvpBJozYv3J9/tBAhNq6jwNa3JjGPYtZBrhn3wE=
Received: from DU2P250CA0001.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::6) by
 DU0PR08MB7906.eurprd08.prod.outlook.com (2603:10a6:10:3b2::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.30; Mon, 21 Jul 2025 11:08:31 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::29) by DU2P250CA0001.outlook.office365.com
 (2603:10a6:10:231::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 11:08:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20 via
 Frontend Transport; Mon, 21 Jul 2025 11:08:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udNP1JJbXJ1YXfzJ4LJpYemL7rS1Or3MgbDaAk4oxCDDkfctNKUXV8BYZDMggOQrtdyoiGOBva28TIfMQvX1JE/ozAewhL5Yko/rIKOmXB6NS6I7FeD7m8brV3UEPaJqvXWgS0JbmMqK3WvhJ8RrCuRvvUbDHTDJibarBbid93sZVrk/wwamkaT/06GWIPERW8VAfshsC7v5TjkSrr1xSkgU9bxncysO4rh/uFE6F9fkLwLXqBo8wn594InBXguyZ2orq3VBCOoqTVfLr0X6s2/2seISQ7A6WJ9/nYqut34YtLQm2YF2q66iRP0C1Kqg1bayxaZLQQEXaS8rdqmfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgnvO+9d7K+G84VCRRBWzaaYSigvxs/CeK31nvsCRKc=;
 b=XIx8/lvPaLxjGOxoZYdpPOs7RRnEc2XW0BswYQWJniEKmjA7SxJTUsRjFA/mZEQgETugIGwtfeAL1xPy3YDtx0sm2l4DVwX5yGS0jsytEg3kDuIobm4BPc2yxvaOJWMVf1xIuCM5AdXf5ZqnIDyv/qZ2ORgnTeL4KZpWWx4w5RXed+5PLSdD/IBHE17/iCvQhDT8n3uf8U7ph+qhE4lDaYoMEpgNYRMLnv/WhwE36AYjG+vZjAcD2A5POauqzQAQ53U/JO95IKsGDtpiXtPIY82ZgszBH1ddfsV57Lq68YVab4PMvLafn4nD+GhI81fsS7V//kYwS9GnxazCcZZUgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgnvO+9d7K+G84VCRRBWzaaYSigvxs/CeK31nvsCRKc=;
 b=K1mdZU/m25r0SlEJnE1gsDGRh+hkX/a7qAsPeZdfsgTSN6GG6hEbjIXVSUw6WjN7gu1OsjkMHzY+zm0OKn3C3S7vKP0p3XiQYSBafNEe8WbwR5UDsVK6FGni7deI+6dvuk2pJvpBJozYv3J9/tBAhNq6jwNa3JjGPYtZBrhn3wE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS4PR08MB7904.eurprd08.prod.outlook.com
 (2603:10a6:20b:51f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:07:57 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:07:57 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] drm/panthor: Make MMU cache maintenance use FLUSH_CACHES
 command
Date: Mon, 21 Jul 2025 12:07:24 +0100
Message-ID: <20250721110725.1595387-6-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721110725.1595387-1-karunika.choo@arm.com>
References: <20250721110725.1595387-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0049.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::13) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS4PR08MB7904:EE_|DU2PEPF0001E9C1:EE_|DU0PR08MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: 87393aee-549c-4718-21f4-08ddc846eda4
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?bt7yep9ciuR6x/Cx4+POAwhqPLy2+so/az9QHETGPZQp5Pn/p6DW3+k4rE8+?=
 =?us-ascii?Q?WsFk+GiWuWovtszsTjuuJwkv4FrpLow2yT0NsNBpxAKcZFhTqn75ghI8svfL?=
 =?us-ascii?Q?7WwtADIM36EoaOOTZ94lna02o5ezauZnI8O5wA3OZHiNyfoTP5PTtjijR9YJ?=
 =?us-ascii?Q?YloAyH8GDHiI9JEt1kc7eT8x91D5qlXiIPvqQpm6EDywXK5UBCeQHnWCf5FZ?=
 =?us-ascii?Q?Bev0TOvk1gzamEkD8gxH00Gm1I9sEKixG9u3qs5KL2tqkpEe5XYAKNgr6ruG?=
 =?us-ascii?Q?m03cl9pfl2FxJUSfuAPQNfcERiSCElCLWIDTmfPLECW2jCEv9Kn3nZedMo9d?=
 =?us-ascii?Q?X7PvLYa9SOBsnHmjCx14Zj4h6rwl0Fb8gZZkuc9eDLodUstg9OwXipluNAsF?=
 =?us-ascii?Q?SlzuxNkFDUTh9aXEVoZtViUR78IKT2tT9xkVqsIdavvTnh5N4Luin69eac47?=
 =?us-ascii?Q?dEfGA1Gf/Cj/FPukqvRAvUiGiWctArEUl5aE/KZGqsGwHGeH+2nkkPzP0u4u?=
 =?us-ascii?Q?LOpLeclcJm0Cw65MMN2/M9c7kpPEtLG0KqLI8CqltUk3u+LCI1b9sZ9kwAqZ?=
 =?us-ascii?Q?LykcDg7gzg0R8JFyZlmlZzOD5kQh9i2J83MAuyY/W+xHBCa9S0s5feqdLK6J?=
 =?us-ascii?Q?7WjNaCKHMXyYFhkxazSMDlv1MYOpwD1sAk9EPP2hisfh4B3Cuve8xApcSaSg?=
 =?us-ascii?Q?KZJcFXRrtXWSQoDqfAAvgYblnrD6rXeOtWYtwytswQcUIdyE/WTFE1AgbokF?=
 =?us-ascii?Q?6vcHdKV5t1TU/S4uzrOEXsXImbi2DJMISkvplqxTBrlAGS6I1aBE/so/vXgc?=
 =?us-ascii?Q?9zNZa0gLkWqbqzpy8YDAzNf0rJdjfqwBEUtccVbX+Nr7YBZf8cRObsp9nLGj?=
 =?us-ascii?Q?zHrUlDceIBOQpXnM8RgxYna5BRq97d3BoYs8jE4FndBUQjpbjG6DS0mfQyjo?=
 =?us-ascii?Q?E6zSOEUH9PW6r4V/rPtp490eHNiNvdcQFH0b1RjEbgzVHR5LmFBuz4VcWLIO?=
 =?us-ascii?Q?NFkkMALaC+eaf45p6xrw6qF4hTAtDyARvnu4Up9uuOrmj/acQXWB4evsjw97?=
 =?us-ascii?Q?VUAygTv9GF06SBEHiseERL+idd8DzdURyoi3KDOELtE44xBm4um2DlNVMeHg?=
 =?us-ascii?Q?LYB9xgaVtugiNi9wkLcLSqodEMi1p2A12ppRTZ03ZKvkjdxfiRi77W+xidet?=
 =?us-ascii?Q?njdhsezJ99380GrMgZZ5wxg5hbCqotqYpoDgQWmYOn4x+t+I4s++JEADH0sv?=
 =?us-ascii?Q?pjejxSZdr22SMCK8HpD/m3Ocnr77nr06TSk9udfYl1RmtYPwTnZdQtbyHM8O?=
 =?us-ascii?Q?JuK0NOtUBZjZwoa1n/Fc5RvwiJyd8vCZq9ehDD2PBUGcX8Mpgfj/2RoVDQST?=
 =?us-ascii?Q?08WZ3gk3xFgl5sYDfEuurwSuy4OFjmJPVMnREZImLm9oMCe9lg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7904
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e533e174-c8d4-4e4d-3ced-08ddc846d93d
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|14060799003|35042699022|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wXwpC7OVgvQJxnRi1YyU1mXR+q/SaSP7J0nHTx/UqQSNRxHXxU/XNG6cNscS?=
 =?us-ascii?Q?gAHuddJtHGDZsY8sIuzOur/6H5JyC+mNraZdiqLrbLzaJOJH8KjTGAgXwJRx?=
 =?us-ascii?Q?0u2PBVv2TYonInWrWbRYuN2Zzs/A6gMHVbL/kDW9B6EEufw69VP4IH48JNIJ?=
 =?us-ascii?Q?kH55h0mpwSfpPUB/FyXmQpqHI99YqOrfpA+XnqA5n7XfhhVMGD6fuMO/3vF5?=
 =?us-ascii?Q?3237tiXSgZ69/GUYbZW9cAOSNcN0SdTF6iGnouaSAwLpkcEnNy08twAv4QW9?=
 =?us-ascii?Q?3ropCfLj88Byl53Q80/7N/i/Lw8LD4U1n4WnpGoBc2F+ssUJaeOhHnURtkEq?=
 =?us-ascii?Q?7vnuWVptk6Om37dLSPlNuWwl3VXujwVukEfsV637FpgEQDarxnwLxL6tf56w?=
 =?us-ascii?Q?oEkeCo5KNIasTrvHD1UtVSVrdIXnB8zOyWKv0EoCShafQjsQQjtKSpuW++5F?=
 =?us-ascii?Q?bbkHotR+LgTSG6N8vdfPcmGccGF5crAMi0IoCCc63ZG702MjWeF8QHif76eL?=
 =?us-ascii?Q?I5Uvxhaj03bInxe8dKyaDnRAFJqbeaRXtC/wVKNRptXWrqQ2pJE6TJErgnQc?=
 =?us-ascii?Q?rGeWsPqn9ToNg49Bw22BnZNbtJST7cv9tVrqG9qdsc2O/wNyED200m5v+LyF?=
 =?us-ascii?Q?XHmJJzW+MrwFljPPtBA6dEbu/Jz1+M1QcsbI0fAabsGRIT8uLqYoLDk9stAL?=
 =?us-ascii?Q?xk/zXWvMGMU4Q7nYTxOlECTZvSXwHyV0IC/nmfUN0UqKgckzsJO1jMBCw2sH?=
 =?us-ascii?Q?mqoQBM0ChWPlnZwmPfQoQi0hgexnd6oGJNA0OBgsfupOUlm6y7vITtfC1i0D?=
 =?us-ascii?Q?W6V1Youbiz7J3KC47jStIdqtHTSvO/zPgYhO5uiMPcQ5sB5MHfme6NbHeFD/?=
 =?us-ascii?Q?xcrIkfYilCNbTTB7CZoPwEgJBjSVKlFuioU6UyWra8kg2j3t5G5wR2t97BkO?=
 =?us-ascii?Q?XNNxIKEyVrpgnRBAkTx6a2YMzBaAkWipaOtTxOvQM8Qmf4z+oM/l1OQElsF1?=
 =?us-ascii?Q?JWNDbQv8eQIfhBxAdXFHy0vGsCKuXS0boWzGETmGUlL/VvYrZhM1vDd9ONYB?=
 =?us-ascii?Q?4uXiPViHRXSiBi9wnfnZOeXzal+srqNsrzpHmBGJZytrtUkVEXHSj/4QMnQ0?=
 =?us-ascii?Q?yUiqsGuzQSO2FmM7ZofHZR9eR6QhpmkWr6nnUCOFUVWQ/36/2EfjqHRg9MDK?=
 =?us-ascii?Q?/6IUj9RccMi00Y4hVXw3VYuH5A+VlTM1IhoZO8IAxjCVtZD2iNDKSEviT+fV?=
 =?us-ascii?Q?L8BbGme/PoqKip2AR6FQSljgb1hy703jXtd0tfgBOz4ja0neRZbgQkufE4/9?=
 =?us-ascii?Q?Qh4KxuG37Chuxbd+HmHeaWbuKwRdH8GopsM7UZZ0/AnK3tSkZR5xb0KkzJZB?=
 =?us-ascii?Q?YuKP8T2E0LumOQ9TnrulkRgWOxbCc8NPRMjHi4vVQV3ujWNh0V2wXFFWYzl1?=
 =?us-ascii?Q?384wy4wCr6KZaElY1at7kNQuwJrdMNbduV/EziauWEAwxgYpfHQJ3/CBtflI?=
 =?us-ascii?Q?Rfq+sKpwHMwe56f0hLbtAvJn+FjbFr1ZU39L?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(14060799003)(35042699022)(1800799024)(82310400026)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:08:31.5578 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87393aee-549c-4718-21f4-08ddc846eda4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7906
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

As the FLUSH_MEM and FLUSH_PT MMU_AS commands are deprecated in GPUs
from Mali-Gx20 onwards, this patch adds support for performing cache
maintenance via the FLUSH_CACHES command in GPU_COMMAND in place of
FLUSH_MEM and FLUSH_PT commands.

Mali-Gx10 and Mali-Gx15 GPUs also has support for the FLUSH_CACHES
command and will also use this by default going forward.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 4140f697ba5a..367c89aca558 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -29,6 +29,7 @@
 
 #include "panthor_device.h"
 #include "panthor_gem.h"
+#include "panthor_gpu.h"
 #include "panthor_heap.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
@@ -568,6 +569,35 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
+static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
+				       u32 op)
+{
+	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
+	u32 lsc_flush_op = 0;
+	int ret;
+
+	if (op == AS_COMMAND_FLUSH_MEM)
+		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
+
+	ret = wait_ready(ptdev, as_nr);
+	if (ret)
+		return ret;
+
+	ret = panthor_gpu_flush_caches(ptdev, l2_flush_op, lsc_flush_op, 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * Explicitly unlock the region as the AS is not unlocked automatically
+	 * at the end of the GPU_CONTROL cache flush command, unlike
+	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
+	 */
+	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
+
+	/* Wait for the unlock command to complete */
+	return wait_ready(ptdev, as_nr);
+}
+
 static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 				      u64 iova, u64 size, u32 op)
 {
@@ -585,6 +615,9 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	if (op != AS_COMMAND_UNLOCK)
 		lock_region(ptdev, as_nr, iova, size);
 
+	if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
+		return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
+
 	/* Run the MMU operation */
 	write_cmd(ptdev, as_nr, op);
 
-- 
2.49.0

