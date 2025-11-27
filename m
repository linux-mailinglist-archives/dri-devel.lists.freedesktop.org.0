Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49DAC8D4B7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 09:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D5C10E771;
	Thu, 27 Nov 2025 08:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="LeqCSpUL";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LeqCSpUL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013017.outbound.protection.outlook.com
 [40.107.162.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7E410E771
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 08:13:23 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QQFRim2UmZeYv1PHdeeTtE0WCAn/9Df30vNAtHc6NJpQoA/pc2dpbFaeveVxJy92JFdadptjij6zCvIM+ZhvVoXM+/p9k6MZVmVzBKl5i+x9SXzQbbwsQcfASgIdW6YkTzy6IOBYfJus+aT2t/fibPdnxo9Wus7CtKs8S7pCgXS48gVznsPiF63PmycGe6d0U3cxvnFT9dXIMSrfH80E1DCrKx1hY5z/4NF7dNPMhWM8YSH504XBqC0Xx13dtrm99uSqfFk+gTvCATfYrN2uzo/VgjlKEgrtWI7PwsC8nFuI0JSI0TIh1GBZGjHuTkKydFyomA9SQ9173uJfS0NWDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bOyWpwsCRMOqhZIdF/KaKmGmCLGYjvkBeRK50W0npg=;
 b=rfskuZk7hm5moaG4ei3vlCCRF6H6S9dND60qFqLngPuqQP1+aiYgdDx/XzK1qKNei5NBnDvqMDha9uCxj/oODjMzvYLDwfnjTGDrHQ8lWsWFGFiS76nDgrowmrmcvUPFRxRBJuy6h1WDZBI1lbs8Nqv4hurny/1YvhiHwcUMyN1NqEcJRFzzKU0uPc3gHulG+oen3a8YWD9zgrSrgY1/XsdhEmJtl1zLkCPtEdncXf1uWRYlsWocU2R7QEG/Cn9C6Zr0ua2bOPdrNd0TumB2JDviXiPxOhDqH/ii/SSeVEdHBro2+lYq78KY8IkVLIO6OO5puzA6nFisnudReCAwfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bOyWpwsCRMOqhZIdF/KaKmGmCLGYjvkBeRK50W0npg=;
 b=LeqCSpULAPyCFbwPC3QIFEvL7lnaUJhpu3Ek8h5p2tLuDp4RpGSbwd15G86psjP4y16k1up9yly08YDKX9yveP2djsKJ86zpljmgCldrEXxgvb0nY/q8Tq2UMfyU2yugik0Wppy+IzKg6FHD8Cp0tBAy8Zvq3nsOHFtIqMT0Ub8=
Received: from DUZPR01CA0215.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::9) by AS4PR08MB7501.eurprd08.prod.outlook.com
 (2603:10a6:20b:4e5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 08:13:19 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::3e) by DUZPR01CA0215.outlook.office365.com
 (2603:10a6:10:4b4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Thu,
 27 Nov 2025 08:13:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7 via
 Frontend Transport; Thu, 27 Nov 2025 08:13:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AV1f+vNxtnjJzwbarNeAuv/BxOgf8iOaK+lR/fHgOEc5uID0+q9dDjIurbRzeBfTY814acfKXGUa1q3j8S/UuZlMfGjKQuHb1sQd9SiIu5SYA+N6JdQixj1zL3u4/ew0/R2/HCoQ5Bt4FeojgmfbtmZSkxwaujrt0+PtH4ugdkRRNNA6MooVSnEuYiORuRAPmCuJcZK+KdAM7fQ+HsMdw2e/0SDS8cTq0j9Q3K35ke6S37HXdPdUwJ2IH7iT+U9F+dDY2+Gj1S/wpu5MLyUHHhi8OF4udHJ8zEb3Ww4B3z8soHOr+QbLuzH/xukhgN6fWiJlqTQBQCkZJg5NQ2x+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bOyWpwsCRMOqhZIdF/KaKmGmCLGYjvkBeRK50W0npg=;
 b=Mkn7AZViJd+uTidr9v1fW/SalpYMJlqUmn+mpjgelYQbxNnaxwakWSVIl9UhRjbTEGTF2UAMo5rEcON2OfSz7K9ENUaAnBMsqVxsbuvOlDLhT+XldAfarPHcgmsGpIphC+y+MIQusdFvTL1eP/BWHYhiQ212snJIpHpd6iL007WaER4ovo6TPNj0xUxyuiiCxZXcrjEWSIoEahzeFCVoHZ2pIJnFTMG99Fq6R2EBbVkYGtF/iObyUnI4VcJLw+PXkupkG7FiQ3v7keoJ9rceE4bvKj7JOrzqKH5WB/RLZKK0JXAi1a5mrtg1BVS3kYR8UTCFlr4zl44wFmxd8EPJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bOyWpwsCRMOqhZIdF/KaKmGmCLGYjvkBeRK50W0npg=;
 b=LeqCSpULAPyCFbwPC3QIFEvL7lnaUJhpu3Ek8h5p2tLuDp4RpGSbwd15G86psjP4y16k1up9yly08YDKX9yveP2djsKJ86zpljmgCldrEXxgvb0nY/q8Tq2UMfyU2yugik0Wppy+IzKg6FHD8Cp0tBAy8Zvq3nsOHFtIqMT0Ub8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by PAVPR08MB9329.eurprd08.prod.outlook.com (2603:10a6:102:305::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 08:12:43 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 08:12:43 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH] drm/panthor: Prevent potential UAF in group creation
Date: Thu, 27 Nov 2025 08:12:39 +0000
Message-Id: <20251127081239.3744766-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0251.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::22) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|PAVPR08MB9329:EE_|DU6PEPF00009528:EE_|AS4PR08MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: a621b109-1169-4fa8-f862-08de2d8cd240
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Bvxoggi38h2NTEnJc02RVYSZxv51Zk0okx5TPzCrfFDKLj1E0MYOCTwI06Gs?=
 =?us-ascii?Q?leF5MfMQMBcIFz8zjN6sEfG/oF0nGaeP7KWj/Uqn1/5LPVd/ViMCb53PS4BO?=
 =?us-ascii?Q?hhhdsVT/yprLdCl/GAm2afn3DVyxzpDt1Me8Znoo0G0PAybSTBzee54IQfxS?=
 =?us-ascii?Q?T3jL32PlUtqqJPq/6i+f5Tvg0IXyDTNRiUn084VJOC3cq0SHEC+jMaL3vtYd?=
 =?us-ascii?Q?uB4seXs6iPTQCFWj0rYO/xH5LG56lU8Q52hl07BRA1h9rfVJXalms7ETTWxn?=
 =?us-ascii?Q?1xy8/7iL8RWEJgpshTL/0kE6uAHAz7o+aNDnT5FaBnyW3DT+OxNHa09nK5EI?=
 =?us-ascii?Q?AS2n+/+znV0DDygI8OiXvTAXkxcjszujzqzn3/nQ6YMfBH8QBjofznyWKFtm?=
 =?us-ascii?Q?w0jdGmIH23F/PMcglNqxQ7BDhrgh8xJ74++wKlDlGIE/76It7YnipiMOhCUh?=
 =?us-ascii?Q?SgxWvihdlgUb4s+pJ/hj7YvVuQ2/1CDJOkMQhIYlIrreceSwCAItiB6Rv7Nc?=
 =?us-ascii?Q?B3qSPtUgeshhFt7+mEml6FMQOMrctoTKH2Yac8adir9oJU0v/sNP4tIacbYr?=
 =?us-ascii?Q?JyebZWHsdg2427X63eHV5oy/30jJUxZ0il7tBZROh1MYLwGHkDVSJbW8fX/Z?=
 =?us-ascii?Q?CFX9NK5iR9uqSbHiLsBhAuv+XyDoc92hHEzSDm3bAbWRfqymDDBS8Xt9Hs8J?=
 =?us-ascii?Q?Sn5E/C99KX0gAR2/Rw8Lwlm83/MyTCBssNlihroxaz9Cg1yk+KBsrDKxGGaC?=
 =?us-ascii?Q?JvaYF+/TxYSH6eDkcg8acLzdl8Bx8++YsFLxIFWEvomhNp58dOyxzm14LzGH?=
 =?us-ascii?Q?LeJ8Sf+xzyCaXzD9+MzTLSMcXU4Hk5AJrDcAnn2+Xkej29pDzqZSa/IU490p?=
 =?us-ascii?Q?jFQwdA2gM1y24+QbNorhleRngjM8HWhY/9UoPtUBSpREL8Sx4SOgpEcF1RUE?=
 =?us-ascii?Q?mstequUY7q6Y3umtR2oZTIyC9UgcxXjp+lfgtmf7ac4V1janTdMGdGoLwcqV?=
 =?us-ascii?Q?shrDr97mjYU7RPRFW1H5lTD09ljF3OghnaVIEAoo41HJAWtIjhVn1EU44elm?=
 =?us-ascii?Q?cV57+/tBj+n1xVC8Y2uCfgRNxqD7OdGcLejEihtHSMTiLSPzU1uprWgoZukE?=
 =?us-ascii?Q?aFsNOfMjQqJBRvqYvp1aOaO33ap01BTSfS917OmInpcSVYXJToMeMIL19x2P?=
 =?us-ascii?Q?iqwZbgl+T/zWpdbVUzzST38kJgXj5qghpEG5d3Y1DcVnQwCXK50wo8uEAF+a?=
 =?us-ascii?Q?/5dgZ+OARRsu6Z1zgWMrQjVaIacqKfqKbYXNT7VMMr+7yfYIRIjVCviPJgCy?=
 =?us-ascii?Q?F+ShdFciwuWg7PvGPr+BD388opeQEd1q+L2vy/I7lWg90LfvPajCYnF296zk?=
 =?us-ascii?Q?Y/D2CRhp33DQ0VxIMvD9smNVyumghlszMKbQpJY5Gg0sBaP7NBZyHNRZkG7X?=
 =?us-ascii?Q?Pst205txA/SrG4qj/kp5kWNLao0T9nYX?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9329
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1f21c4a4-b025-48fd-ab65-08de2d8cbd43
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|14060799003|1800799024|35042699022|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6aDUF65uwhg99d7tkcHR7PJfrdd+qJbDkAbl5n/jnwlb0JlOvnvsrKQHVKzY?=
 =?us-ascii?Q?yG5Td3k7W6LbbqoNf11fRsnTfKtU+l8pRygNBfTPgsoe/Rp87UXX0dEGjeoL?=
 =?us-ascii?Q?2H2w54/ql91JNH9wvKHjRz639gZUkZlm2p0qKy1OAj1PML1MNXO718P3DiYG?=
 =?us-ascii?Q?iWghAK5r6wO5PXL01ZyYqHqPRx1IAs1fYqx8/DsnGFRk0lCLgrn/bWZ7XDdS?=
 =?us-ascii?Q?HbyQva2MdYiZ6gxk3p9n4DEoBcgAqvFJTKkDgAH4o12yNMMrroBOJoQ5WwoZ?=
 =?us-ascii?Q?xxnNHbNrsoU8C9F3MKCcI7QRmT/2uu60+QmfHCymnHkinDUhHK2g59s/+Ala?=
 =?us-ascii?Q?CezXiOQdol0rr00QL080Ng7YrtJbsxeLTsDAz7BiLtxT8zJLGDu5f4xHxW1z?=
 =?us-ascii?Q?E/nrGWd47MBBHTb6kRM2T18kijt4JRtYH+56qEPM37xZnhFUielI2L6Sgltx?=
 =?us-ascii?Q?X7pCcgf5sMPE8SDwXjUu1vcqpJjy7OIDJXhle/61dEgiYBgADXvMtoJrG8fG?=
 =?us-ascii?Q?B9/2tW16RaKqqGnMI3DwZghThsh/zwmhYZFqrYNd61brc5mkrIO1csFHktuZ?=
 =?us-ascii?Q?7QR/n9/Tzc559028YrIRb6Kbm6wbATy1l+VVd9MQqT1wRDksNkhBx+10fuwY?=
 =?us-ascii?Q?dKZyRW1OKT7htHWb21zxNnAZIuE/WWn/rdB8IaIIRkvZgsJEQPHLPZr4ZfF1?=
 =?us-ascii?Q?aIbwdRU8eZHb3cJYN5OS/7jqPAzAdSHYUjC0zdinZ6v39s73VCxvtuld64uh?=
 =?us-ascii?Q?gDIhqNAx3idZVB3dVNUZ3LLdODlja9qmqsXiAzSuR7TO6Htt0y5seKPoNrII?=
 =?us-ascii?Q?48QPwpyGqUddXvpO2+laPPql4Kce7792InWsLzVeTCqdj+3Cq1SkRo5RSsUh?=
 =?us-ascii?Q?KsYNrHwl0m5eUf0BwbQ3Lm0FuT386CXNEkgSqAuYmKCkI77Q81G41qcTXTrl?=
 =?us-ascii?Q?utf2demBhiiTHHEQsTISxQ0gPjchRa96/SczWF224O3tBiuQqzc6D1s/IhAF?=
 =?us-ascii?Q?ep31bnxT9HxNMNdAcNEa1iOXscrDKC/FVT0lI1I4y+f8M6+M+FZsFnv14r9v?=
 =?us-ascii?Q?+rXakZoUbbjCyfM1r45L/iaCgzBcdEEhvlK/B6xIzp8qPJwNcC/odLUi2NkY?=
 =?us-ascii?Q?XvcAay0ZgOl2HLjipeHHLU8R02c+70WcMiceUUXhTLfc6bNMe2xbrkQ5okHy?=
 =?us-ascii?Q?ncxV8DKiLrhumzYRP46JVlfrosG4XnNCVCVfEwN5JqRHbU+hD4eBPUSGxwjN?=
 =?us-ascii?Q?kNfXgRvWzTmoKzJAO8pNOrxARP+I/1GbJ0kxpAI/Bz3FiSTyPpQOGv8B8pLw?=
 =?us-ascii?Q?W4ZiYcIQxJJi6L8MKdnKFgxmvkk8HoyrDUneNQQagiABUIow4Ka0B1IduFDP?=
 =?us-ascii?Q?pm1g5FWaDbsFf60WgcHnnYskns6H56iqA8TdQ43AMzSdOZjSdtPai7YKd0lJ?=
 =?us-ascii?Q?yAfljzory5Fus34cjlzP/WprusgaU5SxHWRPEyxnKaLFHPY7ku1oJ6EjMtDi?=
 =?us-ascii?Q?qE4w5vEe9xgM0E2wPDsZKRlzqIUipMND2sIcDDqjujFOBTJBUuVcWFpokdBL?=
 =?us-ascii?Q?uCXqNteUaH1ZOiHPo8I=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(14060799003)(1800799024)(35042699022)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 08:13:17.8368 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a621b109-1169-4fa8-f862-08de2d8cd240
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7501
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

This commit prevents the possibility of a use after free issue in the
GROUP_CREATE ioctl function, which arose as pointer to the group is
accessed in that ioctl function after storing it in the Xarray.
A malicious userspace can second guess the handle of a group and try
to call GROUP_DESTROY ioctl from another thread around the same time
as GROUP_CREATE ioctl.

To prevent the use after free exploit, this commit uses a mark on an
entry of group pool Xarray which is added just before returning from
the GROUP_CREATE ioctl function. The mark is checked for all ioctls
that specify the group handle and so userspace won't be abe to delete
a group that isn't marked yet.

Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Akash Goel <akash.goel@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index b834123a6560..a6b8024e1a3c 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -779,6 +779,12 @@ struct panthor_job_profiling_data {
  */
 #define MAX_GROUPS_PER_POOL 128
 
+/*
+ * Mark added on an entry of group pool Xarray to identify if the group has
+ * been fully initialized and can be accessed elsewhere in the driver code.
+ */
+#define GROUP_REGISTERED XA_MARK_1
+
 /**
  * struct panthor_group_pool - Group pool
  *
@@ -3007,7 +3013,7 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
 		return;
 
 	xa_lock(&gpool->xa);
-	xa_for_each(&gpool->xa, i, group) {
+	xa_for_each_marked(&gpool->xa, i, group, GROUP_REGISTERED) {
 		guard(spinlock)(&group->fdinfo.lock);
 		pfile->stats.cycles += group->fdinfo.data.cycles;
 		pfile->stats.time += group->fdinfo.data.time;
@@ -3727,6 +3733,8 @@ int panthor_group_create(struct panthor_file *pfile,
 
 	group_init_task_info(group);
 
+	xa_set_mark(&gpool->xa, gid, GROUP_REGISTERED);
+
 	return gid;
 
 err_erase_gid:
@@ -3744,6 +3752,9 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct panthor_group *group;
 
+	if (!xa_get_mark(&gpool->xa, group_handle, GROUP_REGISTERED))
+		return -EINVAL;
+
 	group = xa_erase(&gpool->xa, group_handle);
 	if (!group)
 		return -EINVAL;
@@ -3769,12 +3780,12 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
 }
 
 static struct panthor_group *group_from_handle(struct panthor_group_pool *pool,
-					       u32 group_handle)
+					       unsigned long group_handle)
 {
 	struct panthor_group *group;
 
 	xa_lock(&pool->xa);
-	group = group_get(xa_load(&pool->xa, group_handle));
+	group = group_get(xa_find(&pool->xa, &group_handle, group_handle, GROUP_REGISTERED));
 	xa_unlock(&pool->xa);
 
 	return group;
@@ -3861,7 +3872,7 @@ panthor_fdinfo_gather_group_mem_info(struct panthor_file *pfile,
 		return;
 
 	xa_lock(&gpool->xa);
-	xa_for_each(&gpool->xa, i, group) {
+	xa_for_each_marked(&gpool->xa, i, group, GROUP_REGISTERED) {
 		stats->resident += group->fdinfo.kbo_sizes;
 		if (group->csg_id >= 0)
 			stats->active += group->fdinfo.kbo_sizes;
-- 
2.25.1

