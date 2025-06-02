Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C5BACB0B5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC9E10E52A;
	Mon,  2 Jun 2025 14:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="ZxGt6tV6";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZxGt6tV6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2044.outbound.protection.outlook.com [40.107.247.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AEF10E52A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:09:15 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DqKvkyshruuKwVE2OG7aN4ErcWNDf46RaY1NO8JT3iTiR6uiBWXjlppPBO66LU6OB3Zr7YiP9uGzcxFuN/hCyIGfsWrhhFtuA4x+OTOrtGk6Q9UWohK3ZrXJnHFfe5zTWMqAmcOWs62iuEeaCMwDz3cguXfu9ND6QptIteGlsTULrR98z35UIBq4dbeReRArPxRYplwbQCvlQ6qY/hV0Y26nGbA1CfCGMkcfSuQR4nc2jvFkVjZlAqJa7ot8DGzssqms8fmogBHshA596sd4ezgE8z38h97srEtu3YuguYlGQXJWQrJxrTMtx/FLabb8uYn8W0VhJZj1881voatyDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rDGmSdfteGoIfKuzX5uIALrHmiyn7prJje3zFECTP4=;
 b=WKjR50X4g+BC7BVgyxrEdLQFKASxlG3bHZ1YgbENOdloKVET1jRz082UJ5VCX4YOwTwyP1CF1I2h8ATN6weXK6vjmI+GifJ367bpHjjdTzoB3VU8ixRkk5A7JMENAx4sP33eliV1vhby2bvVLkTtopQceSzkQS4lY8LuDBj1H/konqcwtvwG+aah12PwTA8XwPUf0CcG7+vtScoKLCG3ZQW/5zIR/CF/MZgQdKgpg/Nfcr2vZz+UXDfO0oeMR1uu2nW8ay/b2GjoL8b7dEzu5yAuF3sx/Kn1Y8NOpjLn/1qlfZtNy+EOmwtXteZgZWaG7hEukWCFhbXL1ca4YsISTQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rDGmSdfteGoIfKuzX5uIALrHmiyn7prJje3zFECTP4=;
 b=ZxGt6tV64rQ+lLwn2EPLN68UuR/iDbxJ7sKtizaaOw35WxfIRS/VBW/1SuDqazk/x2UIvKeqAj5EvJBfvoxcE9+KTOCJH1hkqSGokOK7Co4Sz7tPdMhTkCBqHWw+3WmsfADjrAIMQvr+w3BNBv065zSzkwyF628fNuFLC+4w6wk=
Received: from AM8P190CA0028.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::33)
 by DBBPR08MB10410.eurprd08.prod.outlook.com (2603:10a6:10:52b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:09:09 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::93) by AM8P190CA0028.outlook.office365.com
 (2603:10a6:20b:219::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.24 via Frontend Transport; Mon,
 2 Jun 2025 14:09:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:09:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrejBah02MAMS1Vi6CUmMuiypKxhg948G4eBuMkp9BfQrg9fEYayIKRnRIiHXZw/2AXPac6qVxOrv+QD4hRvjT3hKayFTZZZFHVYrmlkX+6Qlm4hRE+F1I1U0jXZvKYCR9/49sqeVJP7IP8DeESKQ9RSYuxPNl0vw8NNpIi7MptkLFLQPkGeJ5GJ2oVLRoTXr71RNWJgMEhzMRAqi8ND4j/n1ymr69amxC8/rLjr8Pyqk1W3waufk/IzEXeUBh+5YjU8PvMiBpq1Hul7wThxUhBDfF/XgKF+DU+cTJYiwlOk74Q8+kEttiE5D6gn0ObBQKwiuvAbFSEyVOWEz8VTIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rDGmSdfteGoIfKuzX5uIALrHmiyn7prJje3zFECTP4=;
 b=nvc2BcakYn3jUeXQ1ekDZBZg7SsOSMjxcA3YUOGNuNd6uHCMBguM/QJVetnjM49v4TCis4N5CVvK+Z6pw0JRWWk+RW8EeNddXRzevWg8pcurnkk7VzpnbvZS5pbwBQli0D+w+4/w3rMsbOHcyLX8caDOJamsQMAFNGEqO9MQmxGAW2S1Y3Zx2V50f+oW26vP8pHxp9UxHaxbolNzifweieX30OL8U/R0bMBtcmofs1h5h42zrSYKB+KYL/OS0r/1Y2UTdaAwOTbx6eIfdFQuLuPp4dXvVu0+zbVKErplBABf8BMSHPk1D8t0XWyMTJSnH6jcTi+tNSmFBzYIXSK7Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rDGmSdfteGoIfKuzX5uIALrHmiyn7prJje3zFECTP4=;
 b=ZxGt6tV64rQ+lLwn2EPLN68UuR/iDbxJ7sKtizaaOw35WxfIRS/VBW/1SuDqazk/x2UIvKeqAj5EvJBfvoxcE9+KTOCJH1hkqSGokOK7Co4Sz7tPdMhTkCBqHWw+3WmsfADjrAIMQvr+w3BNBv065zSzkwyF628fNuFLC+4w6wk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB9018.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 14:08:29 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:08:29 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] drm/panthor: Add support for Mali-G710,
 Mali-G510 and Mali-G310
Date: Mon,  2 Jun 2025 15:08:09 +0100
Message-ID: <20250602140814.2559538-6-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602140814.2559538-1-karunika.choo@arm.com>
References: <20250602140814.2559538-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0063.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::14) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB9018:EE_|AMS0EPF0000019F:EE_|DBBPR08MB10410:EE_
X-MS-Office365-Filtering-Correlation-Id: 74086742-8307-4063-b568-08dda1df09e3
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ceUGsI4iIirggCRHJc8ja2Qa3YqhoTxLekWWpte0l/Mc7zQg3CvMOSQZyjSG?=
 =?us-ascii?Q?4ldPFjayNgCMCuNy43McvluuHfgmwS5MClHxAg4GKASYQRrpOHXpkb2vy6wK?=
 =?us-ascii?Q?myDa2xVQK8ELVKWAAmh/T2jZ0j8zsr+cPJWJvNPhtr5U/F6PHE1YGxOCvkGp?=
 =?us-ascii?Q?XZrh+3dkODsrBvDgdBzrJ8Hlb86aHUpE3AV70oEyS5TuP9QJ8+QA4SyctZmo?=
 =?us-ascii?Q?0jmxcPqPCSQfpGHp9DC54RlgFB0Efq6PcIYezwIL/fViF7YEN90Bx8XFiuf8?=
 =?us-ascii?Q?xKT6KtYoAGXFXdLY1ZLApe4YxGV6PsKjXaZEM/QUyPyYOGR+euWL3hZppaHT?=
 =?us-ascii?Q?KpC62Y8lrBj37qDIYy5NleNmVOULNG+0iGUdjvlnT/E1RV1BzJ+4h/jskGzk?=
 =?us-ascii?Q?GkJwu7mrNFgcI7Y0BHXvtwX1ePQkncOOEdhx+40gE+Uwh7M5nVXbkaQSi9P+?=
 =?us-ascii?Q?eFGs2Mx3cyVgJdcrtXHRhqXJ5FWWs3BkAGlMCJe4pVRPMh2HUDuDrRcldW5G?=
 =?us-ascii?Q?2yUmkMrQh831f8cBuxIfeicFjbU5icBpd99mclCTrGxe75zgSkCbJvkojKa2?=
 =?us-ascii?Q?8uuhYP9jphgg9zLuNpxlbua+gpcir3ebXGeeO4F/FjTrj2zVzAL+OKdCKlTy?=
 =?us-ascii?Q?Eg3wMozhBASeqr9+zp3tuQSfY7gAfghJ6RytnOnFFyUcJ9lCkpJPtTtLuseL?=
 =?us-ascii?Q?EYl7fVac8CD55zBX3UE0pwYM2Jf5RwFRzH06knvYSDGNXmf2BeOB1i/xZczw?=
 =?us-ascii?Q?2e3PDVF4VD7nzIDOv+jUAarQdCJfW0ocli5LKUkXOBPWIe+AxOK1jE4owAEZ?=
 =?us-ascii?Q?hJM4Au/3v0RWh4wGKcKOrEiyLdKM3cXFuaKOrln9MmyNus+LwXBjxIT+s2E1?=
 =?us-ascii?Q?lLAnQQZdNtOM7jL8vpohTiNvASdEyg+D717uKqnLR7lIfcmX4Zk+JlrYal8n?=
 =?us-ascii?Q?E9tyYQVO5gHHzBeT0SeX8jeaUZ9+Zs//row1pqa9pufpk/UJoVKsMrdif1/g?=
 =?us-ascii?Q?49zmlMWeSQg8vi4EfhIZkfGkuvuT+COFtfDl7uwFIA8u+Aly+UnA+kCGXrHp?=
 =?us-ascii?Q?C6evgvfPCU1NBkYJL8sDDWm84vWE5nK4lVu/m/zZFDFqt15lVZLxlGy0wBD2?=
 =?us-ascii?Q?pUxa8NdPF7neJs6c8A2JwV+0Q7hN6i/lwc2Po1laYQp3TMIXpykisE2gl8AH?=
 =?us-ascii?Q?jX117jmyc6fof9L0+pPhXsvAX8Uxvo/+KsgbR6EzeOfdCIRkw34AABjgmGp6?=
 =?us-ascii?Q?dK7kv5q7MPv5eWC9TlYjodR5BNJcN0/GqdS64t/m6w=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9018
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f429a9fb-b713-430f-23e1-08dda1def36f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|14060799003|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ETC/3JmhQYMYqiTxg6g/+Xwib4T3s80wTxW4AOEv/E+9RhUqvDlnH7AFWG9b?=
 =?us-ascii?Q?2vn8HPQquqC+Dkj2D41Hobcvzvm+xh1Iq5BrJnd6McP4+kUMwxrbCKu7zd19?=
 =?us-ascii?Q?g8FLwJDLFjeFMOA2UoLdtERdTC/w+HQDoHjz3GRUV//0JdJ+IWOPpMlRHNUH?=
 =?us-ascii?Q?jTWyWjRUAoxVeUqahtIkqWTVOfKXkb2iQ0nj/KQPEpCICcLn+bNTH8661T0v?=
 =?us-ascii?Q?+TgY9JRm5cqGv0qupu8KpIemQkteaYAv/HbsfFp/huQ0H4FD5kTKRerrqlnc?=
 =?us-ascii?Q?Nu1VFtEL/1uwB4HN8uINaKOAdhvySCyatHpzPEfiLAG/rek8qRqt6UFoUj4z?=
 =?us-ascii?Q?/cnnsdjoXmq3n3/HY3z39WFPgoX3MJtk+Tnyz35aE439SaMhTB4EzEzIvN8O?=
 =?us-ascii?Q?GcxoFLOacL+bmZxUyb7IV/D5WDtAtCAW5jsRT0dSvIIc3xSHG6qo88H/4V1N?=
 =?us-ascii?Q?yoJpDVvFVNleGKOwK6tyrYK7vzmeN7BAcjnzkLE1R33TYF7ISHmDUhAa4vrc?=
 =?us-ascii?Q?F6dTp6fXHcVhQbG5eySohHm5WiGJ1MpyMSucNQodELtYFoShjZra9yWHp+qh?=
 =?us-ascii?Q?3piMeOIlVPIGscOak8XvHx+KsuZSq7+1e/r/Xr9izPsnnmQvKQdw7TbLBMV5?=
 =?us-ascii?Q?SY4hs7v1Yi4ucKKTjkmbUYHlHiJ7uQMBHVpXnKGgm1ZBqngepzrwv9AHosyx?=
 =?us-ascii?Q?EcbR/ngcJcjF6McRPf8MRcZrC8u8npDD8mHH/ZcBIBm+vuIbbouBSbh1uaSU?=
 =?us-ascii?Q?98KYDNzPYknJIgRVR5e4Gmz1//OILGCRrFOYc7yUGyWDyiPX/NgnGkkqJCQR?=
 =?us-ascii?Q?6/A7CLZfbMbQsQygifSARY2wiEsqf1P/cUpbPF+PQLbTCDJ6H+eLZa3ARMFD?=
 =?us-ascii?Q?z4eaSJ4DRVUuvywE5Vuo0xeWb+E26xRDJ0wtDSnGbRu8FmewnChtHu8o5qO/?=
 =?us-ascii?Q?xO6mYe3JgvYUziT9EhAqTnEqovksW7TnvdhwCxURFZmdAYUlcVj7dAZzR/ND?=
 =?us-ascii?Q?f4Hpv9QFMl213I+islVpYOap4MKCDcmzg6XRszpOkqcHvcVjUsWq/G56tqbD?=
 =?us-ascii?Q?AC4xGDmWODaQdLOvgrcK75MgtwjCw4jb5/RRzUEXidOtOK4RucXelhNfEeGr?=
 =?us-ascii?Q?AoPtvDhFCahOc38hEyRvPHonGQAM40kY3opyBRB2+1Y2BO92jv2+sCZK20dz?=
 =?us-ascii?Q?oqEBiVE96hYEkTYbIZZLj65cR/MQjlkLOqa2LDX+vzHaI/GF3jWABmeTJ0QM?=
 =?us-ascii?Q?K9qtR3nhxzib0g3pkwDey9i0YgQrluW23wcSBqze8LuVgdChvE52b4pTEp4C?=
 =?us-ascii?Q?Tw9SD3t05+K57hjaVPZ5ir6fzkvVLRfuGUrpTamsaWod6srDbheNYZ3H/q1B?=
 =?us-ascii?Q?QRefh2+ZP+/UlwK2R6Y2IAlPVTxA4k+AfJ9UpXCFYU91SyhcdBraMDRZN4ZM?=
 =?us-ascii?Q?qngJSI3PumoV0H/W5wYYI42TpT3q5++5TP9hbnhnECa2c00kCL563VjyOQV9?=
 =?us-ascii?Q?VZMtN/RHj5DLGJZ/VslIYS274jlDb7v7UbAr?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(14060799003)(1800799024)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:09:07.1322 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74086742-8307-4063-b568-08dda1df09e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10410
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

This patch adds GPU model name and FW binary support for Mali-G710,
Mali-G510, and Mali-G310.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 2 ++
 drivers/gpu/drm/panthor/panthor_hw.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 36f1034839c2..b7b454d16f12 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1402,3 +1402,5 @@ int panthor_fw_init(struct panthor_device *ptdev)
 }
 
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 421f84fde7d0..5e423122cd4e 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -38,8 +38,14 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 						GPU_PROD_MAJOR(gpu_id));
 
 	switch (product_id) {
+	case GPU_PROD_ID_MAKE(10, 2):
+		return "Mali-G710";
 	case GPU_PROD_ID_MAKE(10, 7):
 		return "Mali-G610";
+	case GPU_PROD_ID_MAKE(10, 3):
+		return "Mali-G510";
+	case GPU_PROD_ID_MAKE(10, 4):
+		return "Mali-G310";
 	}
 
 	return "(Unknown Mali GPU)";
-- 
2.49.0

