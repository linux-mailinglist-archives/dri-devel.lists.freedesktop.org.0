Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62529B0422
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 15:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A7410EAD8;
	Fri, 25 Oct 2024 13:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="dgXwylta";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dgXwylta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2072.outbound.protection.outlook.com [40.107.249.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0DA10E0EA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 14:55:21 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=N1VjrfRYV9STJMoQgGVs+8iAPtJ2QJDxo2duzIykSJFrZihp/JaxwMbMt46805uYB1kuiieqgmucz++U9dzvjtjqwLWIrBfgZoyilLFMIu8kdUarRIg+myEPVcIMwJUAy5fj6lfNa7PEY0WlCWtP/zAcBNZYu1ky6Ef+yYsX74SWUR6KtLoLi6sLGDbqCHL9o1dWgy59wWS8dLHsXnYy5Hy1aOvmsUMhA/9/NzQIN6hrm0twAc6eFjBGtzK3f3Sigi4WWDnDzxsoJ3ubZpUSpA/lmVzDrw3Kpc546kCEJek0DSelXW9k3TBzW04grh4gNh0fS7spM1bzRi9n3ujZOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWEtEPyiOmxtlOJjv6s9XyE2N03ec/56aFKp9m4srrY=;
 b=MKoCjK7vlofCHNFoMAnKhdOdwG/eKnqVG0Ao62XYioAwUTQCTpkD1zcdCxcAVHCMhGXkUEUYuiWkFtZ12qViaLs4rm3LZ+r9AqGdru/4Sur8KjUwLvE6kIi1VHjc/iZXZ1UFC0ClgRjB/swDOQgcHvRLqe+lpnlC3Rms1BXRC+sQADDhqVRlLlBlNwINNVjwNIELTHPrh4kke2ain8CH1jBD3Jn9h2BzNQMPwOLZ16mOCa1TKyIl63gEAUyFdbb893e2KyyG//VtKMXtxZntkoxU3wrsvFvL0OLQdqlf85UnnVPrJqoai0jG/Trm+wytnkM1mGQb8VdvSiM4xddowQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWEtEPyiOmxtlOJjv6s9XyE2N03ec/56aFKp9m4srrY=;
 b=dgXwyltazcrBualPIvzEFHAq8cBWWjZ5S6UTF3qiIjhCqnyYdx5ZaQcWpg2h8be+4UnRjdOvHpd/aJpwfxWhPRiRO85JTTjfbsUMjK+TeHBeYqNG+psTdSTKR9iEApjABr/wCKf35QFbr5EaYgB3uKP9GQa42havHGiybxqhYCg=
Received: from DU6P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::13)
 by PAXPR08MB6701.eurprd08.prod.outlook.com (2603:10a6:102:132::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 14:55:14 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::76) by DU6P191CA0022.outlook.office365.com
 (2603:10a6:10:540::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Thu, 24 Oct 2024 14:55:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14 via
 Frontend Transport; Thu, 24 Oct 2024 14:55:14 +0000
Received: ("Tessian outbound 4a86a9c66651:v490");
 Thu, 24 Oct 2024 14:55:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 35d0c8f192506e5f
X-TessianGatewayMetadata: 9yoxV4jJXpW60vB3dhXQ1yF25K7+h/mv4p4bpmaTD3YiMIZUJCw95BZpJeRR0/fs0O1vJObZaMr/r02iLed41nLl+oiuN9G6t9aEljnP5icJ67JIAvgwpztXVPwdaUa4XSADMVQBELXGR16fNmQmVoZIOQl1O+AAUpB/8QL5o2g=
X-CR-MTA-TID: 64aa7808
Received: from Lb20fe2b11398.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 749673E5-863D-4275-B6D0-40521E1E5FEE.1; 
 Thu, 24 Oct 2024 14:55:02 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb20fe2b11398.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Oct 2024 14:55:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6lTnsSHNsbFW/SNTfmPJs+5P4zbWGJFzlURuEgBM3oWN1HKt9cIHyGOJIRqQvrkaoyzebeCczW53aDV4sq+LLXC0Vhn7/m7dMtkWdYMKVXv6gVJ1QN2x/qkpMV6ztB65pOmY9On/nDia1RFmiEJw9z17NHuc4opKnsRuXBpEHGjjkRu05eYoDN8HqLqnV8ajII+egUqPTORSftHTSopbt5rao8XnV2gpfeRnDcC8nAy5Y4Pp+t1nFEExB12+E+oBezSc30QfATDX429mzuNeq+0iBxPsVIQqyREw0doxF2ddty9wKIQjmNu/jdX677OEsoWYZHgYgjiTPKMKZ5fdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWEtEPyiOmxtlOJjv6s9XyE2N03ec/56aFKp9m4srrY=;
 b=hnt7xjvJlaTfI7VMBIMCZXMhT7sCbOYN0Cuv9kAx07l/Mkhfhvu/jezHe0JFUahUtwrrFL+KSWUex8tpI23XpGI7YeDEDBZtimzWFTBSPDvRFyLH/Pg72XiZcKh7Wkd+EgZFXnoD4IDyEkAIYA9kTxoRQF9aI5OO/xefSImuT2rq+rwy8yVWyT3wx3W8k9+vwOstMs9Sh5BUoWYIKr1ydBTVvrEJH9xQHUoOVB54MnqaAMWfR4MELB71XH5J6Rq1YwxfdKisnRIoGWj+MFxzkV7x2viYi63GNCy3E9odeR8xhH9yh7XwaNl0OLbpfXwfyRErjpwpHfkg+CiVfi3e5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWEtEPyiOmxtlOJjv6s9XyE2N03ec/56aFKp9m4srrY=;
 b=dgXwyltazcrBualPIvzEFHAq8cBWWjZ5S6UTF3qiIjhCqnyYdx5ZaQcWpg2h8be+4UnRjdOvHpd/aJpwfxWhPRiRO85JTTjfbsUMjK+TeHBeYqNG+psTdSTKR9iEApjABr/wCKf35QFbr5EaYgB3uKP9GQa42havHGiybxqhYCg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by PAVPR08MB9650.eurprd08.prod.outlook.com (2603:10a6:102:31a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 14:55:00 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%3]) with mapi id 15.20.8069.016; Thu, 24 Oct 2024
 14:55:00 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com, florent.tomasin@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH 2/3] drm/panthor: Explicitly set the coherency mode
Date: Thu, 24 Oct 2024 15:54:31 +0100
Message-Id: <20241024145432.934086-3-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241024145432.934086-1-akash.goel@arm.com>
References: <20241024145432.934086-1-akash.goel@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0061.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::7) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|PAVPR08MB9650:EE_|DU6PEPF00009526:EE_|PAXPR08MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: fa24655f-f43b-4079-4c65-08dcf43bddd3
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Or/4ow7xan+uJ/C0poaJc1me6yKt0bdWQxj3vKy5S++55rXy1q4qV1gKOElD?=
 =?us-ascii?Q?Qu2wgCNMSgGSO/0t1lPnVi+F+Afm8lhsdo+3JkA9NymKjpmtVsvWmnsQw+Zk?=
 =?us-ascii?Q?MpCPYNPVlDx2MfTGUFv7DwiI8qh/B7FU+Dno3nEyo4dnoS2o5ENEVn2MNUYp?=
 =?us-ascii?Q?Mf4hsihmMFypZ7oRP6fkjfALv1O5wK8EX1A/c+I8vXUSxJbTnHpbxs6dyVYt?=
 =?us-ascii?Q?y/HVXHcYoYHjLMGltUUN5X8/WfD0/iJAXmthDRIXpS1DeOnGmGbqF0cT46jx?=
 =?us-ascii?Q?MSMYy2ruPHPyVodmqSccc12kFKw5VmMkR05PJF9VVQ6S/gQ1ulxDKhBiOWLB?=
 =?us-ascii?Q?t4nOMAzSb6q2rr8hvoUR0fqwp9Qf27fHpQZowoj/mUxhDemq6rBOzZOZpj6J?=
 =?us-ascii?Q?GySimZ4z78KT/rLjGQLAe26+IQ+V1JCq/SZMOEsP8JscvK9BQyEa5dElWKe5?=
 =?us-ascii?Q?babU4D52CYz+IM/YhYLQFCyd3r4SHFLjtXcaSbsqql/7yRpGk3zWQJkIFglB?=
 =?us-ascii?Q?ETVXoLjOQQmFFq+q2z5//vV//H8JMa3c97GNn6mNPqvLEpGhhlOfxyW6Eo+g?=
 =?us-ascii?Q?bcTw3JHoqVKhZ+rVjxvbT5yo4xowarqlLq8RhmtFy4yPVxvWVwIJDfiyuoGq?=
 =?us-ascii?Q?B5KEKmYDFJl+2bKmD2NqereaS1aXCZvAq/qfuq/p14jTiAbehW5n8rg/4q9L?=
 =?us-ascii?Q?/oliSODJOl67O6H+V0Qqzi2ne8/gAumC753owF4/Xo62ek6RBJ4MhqCjRFlv?=
 =?us-ascii?Q?aKcNq5Fd9Xc3R4VwF6uygq8QqOCu6Ubm9HJ7e3KApT2JO16+xL36DxsD6Phl?=
 =?us-ascii?Q?xRy0eTWuc0cLzmgxSCuseHH7ddsdP0hxgN4aoKdnoDU5J7jVgDlhI3ja0svB?=
 =?us-ascii?Q?BGeD+VucfEDwVwfTUgcdBAz5lTxQ14nNf9tJx0i3WbmWRnV3kNC3VRZfFOva?=
 =?us-ascii?Q?d6ohTFOWp21uZ7ZUgv2MTBGu2PkLHUCvO7nyNXYSIUXR1pGsGL79eMU8F0By?=
 =?us-ascii?Q?Mnhm7fA6V9cBXcb4tXbi5YOUa8ekA75FmxQ0JOLvAu/GeDtDXsP80i6GYseo?=
 =?us-ascii?Q?ZHaJPiuB87swFKzu00Gp4Giv9zYAMXo4TNQ2ZbIBJT9IfZvEnZ+3l910yzMW?=
 =?us-ascii?Q?qCT+8ni0QrtYMnOCxGkEXKCyFkhent559DAPmvgJPC1fECs1yVZbxgOPpNnE?=
 =?us-ascii?Q?HYOJe/YQ1O8o7nL4wnq53MuxFu3PxhpONvEiWpVB6brKVJbP09kRLNmxiFiL?=
 =?us-ascii?Q?swH6FS2vSyCiqCR9Ax0B8GxrqI2yeb9kNyMgZ3B59PDHug0qWsBCmstyPIrM?=
 =?us-ascii?Q?zrc=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9650
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:415::16];
 domain=AM9PR08MB6982.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3af7d2f4-1823-4006-770b-08dcf43bd45c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0Nc6E8bfbkQuSyG/buWXZ7LozbTscUs9uU+qmbV5JLCkvxkvlteIzoDsXYMR?=
 =?us-ascii?Q?NLHq4BwQjWnuVclWC08+ChFeg8fwIP2WeFTu5xMRblRXz/mzdpJvsZP/jVBL?=
 =?us-ascii?Q?kYkTitrf0f4DsRkViru5C7o9y58zth/keqzLZGAu0wk6pxzbPUXVObX/cCVg?=
 =?us-ascii?Q?9GmW5wlf7pQUbCV+wmjIUlcVDDvLwPMG2grzqcKqhfTrg1ffzt1ufBk/tK47?=
 =?us-ascii?Q?wPXR/8ry3f3EIcEsQQbFAOwtQBPUTUCHH7TLNF8vbzO1RNvT/Mg0tkoPzWWn?=
 =?us-ascii?Q?uhplPEc7FeEH2DmvFUvaOD2gRX/qCTsZInLZnhskSVAraFagvqaAy+BlxRbG?=
 =?us-ascii?Q?c6Gjx+7/j3rboefEBuSSMw+wjPYwZcqwaJ6puUZ1RWIQnwX+Cn5z7r8R1uQV?=
 =?us-ascii?Q?nr/6xY6zgViqaBP8MOx346Di9pxJf28hUdnMs5poH0tEdEHrT9rZf4G2mtF5?=
 =?us-ascii?Q?6ehGYsPvFt0GBZXQajBsxza9Zs6+F7BcEXr1UOIHa+qpjRU/fVVbSjaNe4oV?=
 =?us-ascii?Q?lDxwOPLGwMjQ/TzScmK3HsIBrh8wRt3gpM5OeGaK1TIBgaOswvQgkJuCIKUF?=
 =?us-ascii?Q?swk4jFP7epW4bijF+znEUpBGVz2O6W15obToc2A48QJXPE2zOCqos4lQgyry?=
 =?us-ascii?Q?WvvmMneD5NaDb3A4IZ6qmo+GkdFCSJF/eB0BEmu0Nhm8HGmeAx3DbetOCqQ1?=
 =?us-ascii?Q?4zILkWB41B0x6y7y1NgAKTOfn1sYM32qYIOEaqrAeRRhZ632x6apHwi0RwRb?=
 =?us-ascii?Q?HiOxrRplst/RG2T3HZqZIQrMTYSr/Tidc3rS5hsoACfPjj9MNSQUTPXXmQwn?=
 =?us-ascii?Q?WGI0r2sl49Q4th958EO4xr/8aaplAzz9o+PFbTb/89rNdKzwEXGj72CK98Pb?=
 =?us-ascii?Q?bWiss6/XKYi7Uh+ZT1TYHqHBzfUXet8ugUswj3QXCtc1IJA0H8j01w0rjjZv?=
 =?us-ascii?Q?8L4pYf1pMdK+Pgg0m48yRJ5yu2/e9WbDQ4XcdZ6ZPj7P1rK41VLSUPaeE7jf?=
 =?us-ascii?Q?ZvsnkUQlKTBwBCdZdGYMpgoTSHwRHB8GqkyRcJhHwnRKRGJsi7ImnA2SCrQb?=
 =?us-ascii?Q?ePYfd4r3kKc9rUlxykpwzPY7SKjAgzdvFHLKcZpOLHo8iSoVDJUe6Fmrho9a?=
 =?us-ascii?Q?SEJsxlt58Nf4aPsSMKaKTLuDYxx7fI/buZRiIXMelz8BCMtwkCsd864tNF9w?=
 =?us-ascii?Q?FugL+kY17QRM8c85jk67mOe0bPdUoZ7toF3ufk0C8bAXahwjtETAmA7CwVd8?=
 =?us-ascii?Q?HfYxV7tY0F31JFQRubXVkAQWXttaAyY5NFTWByYFYsvTCi2WicA1vtIrjEcd?=
 =?us-ascii?Q?2d2m6q9ieVv9P7RNXZCBsk4wIYoju7emuJJWJ24g5nYE0WFBlLppkadW07y6?=
 =?us-ascii?Q?R5fj5RBhWu8zlfmU/BqqgoJNfdaeUfiWBrS+qEQh0ZWsLipUlw=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(35042699022)(36860700013)(1800799024)(376014)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 14:55:14.1471 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa24655f-f43b-4079-4c65-08dcf43bddd3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6701
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

This commit fixes the potential misalignment between the value of device
tree property "dma-coherent" and default value of COHERENCY_ENABLE
register.
Panthor driver didn't explicitly program the COHERENCY_ENABLE register
with the desired coherency mode. The default value of COHERENCY_ENABLE
register is implementation defined, so it may not be always aligned with
the "dma-coherent" property value.
The commit also checks the COHERENCY_FEATURES register to confirm that
the coherency protocol is actually supported or not.

Signed-off-by: Akash Goel <akash.goel@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 22 +++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gpu.c    |  9 +++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 4082c8f2951d..984615f4ed27 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -22,6 +22,24 @@
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
+static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
+{
+	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
+
+	if (!ptdev->coherent)
+		return 0;
+
+	/* Check if the ACE-Lite coherency protocol is actually supported by the GPU.
+	 * ACE protocol has never been supported for command stream frontend GPUs.
+	 */
+	if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
+		      GPU_COHERENCY_PROT_BIT(ACE_LITE)))
+		return 0;
+
+	drm_err(&ptdev->base, "Coherency not supported by the device");
+	return -ENOTSUPP;
+}
+
 static int panthor_clk_init(struct panthor_device *ptdev)
 {
 	ptdev->clks.core = devm_clk_get(ptdev->base.dev, NULL);
@@ -156,7 +174,9 @@ int panthor_device_init(struct panthor_device *ptdev)
 	struct page *p;
 	int ret;
 
-	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
+	ret = panthor_gpu_coherency_init(ptdev);
+	if (ret)
+		return ret;
 
 	init_completion(&ptdev->unplug.done);
 	ret = drmm_mutex_init(&ptdev->base, &ptdev->unplug.lock);
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 5251d8764e7d..1e24f08a519a 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -77,6 +77,12 @@ static const struct panthor_model gpu_models[] = {
 	 GPU_IRQ_RESET_COMPLETED | \
 	 GPU_IRQ_CLEAN_CACHES_COMPLETED)
 
+static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
+{
+	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
+		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
+}
+
 static void panthor_gpu_init_info(struct panthor_device *ptdev)
 {
 	const struct panthor_model *model;
@@ -365,6 +371,9 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
 			      hweight64(ptdev->gpu_info.shader_present));
 	}
 
+	/* Set the desired coherency mode before the power up of L2 */
+	panthor_gpu_coherency_set(ptdev);
+
 	return panthor_gpu_power_on(ptdev, L2, 1, 20000);
 }
 
-- 
2.25.1

