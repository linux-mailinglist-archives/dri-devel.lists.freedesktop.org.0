Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0F3BD8823
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 11:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51B910E1F5;
	Tue, 14 Oct 2025 09:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="co/Lowk9";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="co/Lowk9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E35B10E1F5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:44:30 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TVjoogX7LXrxisM8WG7xoJoQJOMWynUgmlN17IlLg+mdPT2QFwZTBsuPekdMfYGs2IYjSpAzUs5bDwsY5uI7jj2mrd/xflbFnqVjVh4iU790C+F41QIAAg/hTvyuWaEcN92XTQtugjYQ78By+Ex/NqmNJOkboMBFxvT4KAdA0Rb4bfFdSSnjKC0iBLNzTL8yp+tapkd3H08r3nx9qwQ6/EGmIHHd01b9dypamdso26M1tbXkJ4B9/8rf0xDZqvCxXLv54MQaLrWxxLM8yxBtSGAaF7VgN3KQAdMQ6StcKlw+L9mPYghPMGjC1ZA8jEVwoWWUt5s5eVONIxcNFL40ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvlvIBdF/1rX5X824m/BBL2q/BVGBabFOAz5LaDvi8I=;
 b=rTXjNATeE0xyuXNvjogbB47mhnPTZnNHEt7UJNem/wcA1j38JMe+sLuM5BHOr5UnFWkMT6AYhfg773lZvNvJx6X1/qEjEU+GBdvuPi//nJqgQK6Eiwvxwc7ucpwXWgiNrfZRP91RfdSzjVpYPXnaxXWNgWCSV38U+TvIB5PHGrxBpIOO8HT6buZducqevBXrUFusuBvHdGXPbt4sLMGeKS2bq6BQ+yPkxqD6uZtlzgSAYC4WvEDJuV1PoMxPdges6jdK6GSppB9xfmZZAGbr4XToXshcwHgSWp8F36PNkUhzFjUuZ57iLFMoGp/WKEeWz4G/MPSMbFppztrsu9/Jpw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvlvIBdF/1rX5X824m/BBL2q/BVGBabFOAz5LaDvi8I=;
 b=co/Lowk9lpN6LIaG2+QADCOeNaYQg200oPE9QiMIcNGlaQgmURCaXc5Wv/HWZSijDVyZeLfyRd8et9SQ9JCdMhCet+wNwjZDqhm04du9/D1rsExNuxcN0yNCP3ofkQrz2wqQyOglBMdzv/x5n/CX0lIFLu8DEcZhX5bjiFhDbUE=
Received: from DB9PR05CA0019.eurprd05.prod.outlook.com (2603:10a6:10:1da::24)
 by AMBPR08MB11654.eurprd08.prod.outlook.com (2603:10a6:20b:737::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 09:44:26 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::21) by DB9PR05CA0019.outlook.office365.com
 (2603:10a6:10:1da::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Tue,
 14 Oct 2025 09:44:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Tue, 14 Oct 2025 09:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aV4K2i30cxjR/xbTgK5NSnHGh80rJ6Nrd8F+RLcCeVv9q7OVgjCiVsfnOmvpuNoYTdMBoeuCI1KzFNQKIxXzjobm2mYRbLEVxUsBsfjsk560QWs3d9XlPah70wRP9wuE/G9XcqyCkzDXlOPeofnweg/+zapG2KVTHkHwRnah7eGgBkFJbv9M522eM1/NuEcC74q5Gl1PCyW75puwm7NNjs/x9KXwropuoQom2XUbGXTrn+6WiRBKgE5gPG0I8SIMth+XR58pTe/BIG3GAWA2jqE8+3GEcJOwgCPu/7Ve1E4hYXbbqNHlEsN8NpxpFdyzY4Xmb+6Dx3gEnSyHGboErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvlvIBdF/1rX5X824m/BBL2q/BVGBabFOAz5LaDvi8I=;
 b=prRdKf29B/OFjo7RSGHR1BU+cCx0qIebG+6N1oWb9aiiqkue3YIuVRFOyvkb0SBJH+EwaS6gTCJJjY68PqhWQ6/2PZFW4IO9dHGlsLB2qzjlWhpf3xvJip5EKsa/2Ket6dE28fa8zJNAmgN9l0Ltvi5EFDYPrpA/r3gEMZQRkSdxRHvIoVeXDjieTVBOnZegdU3WuLutgF54DqvJWFCE/XmL0LRVQbH8cCqda9zUwsRpwLmVI00EN0UazlRFncxFNI1XvLdr7/LnDiEtm4ysRLQIe6nMtqaPPPIrHGyRdxoTOc+OnVHKhKOLw7B5/kYIZtMsn+Z+5AMFg8L+4LgH4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvlvIBdF/1rX5X824m/BBL2q/BVGBabFOAz5LaDvi8I=;
 b=co/Lowk9lpN6LIaG2+QADCOeNaYQg200oPE9QiMIcNGlaQgmURCaXc5Wv/HWZSijDVyZeLfyRd8et9SQ9JCdMhCet+wNwjZDqhm04du9/D1rsExNuxcN0yNCP3ofkQrz2wqQyOglBMdzv/x5n/CX0lIFLu8DEcZhX5bjiFhDbUE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB6677.eurprd08.prod.outlook.com
 (2603:10a6:20b:39a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 09:43:54 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 09:43:53 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/10] drm/panthor: Add support for Mali-G1 GPUs
Date: Tue, 14 Oct 2025 10:43:27 +0100
Message-ID: <20251014094337.1009601-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0018.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2df::9) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB6677:EE_|DU6PEPF0000B622:EE_|AMBPR08MB11654:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c686a4-6537-4d92-8694-08de0b064354
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?uE20O3Oc1H/b8GBWuRD1qhFRSjaDL5wRK1b8t1aF8RspLbtSmAN+XaaMBLKF?=
 =?us-ascii?Q?TCSmYlbUSoNC1u4MsXNUDrqXwcFor8IzABRhInOVdLY1aaRNJNbtvQ27EA5Q?=
 =?us-ascii?Q?hClGj95jEa1SFgJVEtY1yDUuDtOo7PN09tWwDQWUlByC+VeNhWOVi7J82Dee?=
 =?us-ascii?Q?l94v8ebo4khR7a6SNZSJ75vJojTB3smTKE1z0eu8Gk26Vc6OKOq8QL5DA2fH?=
 =?us-ascii?Q?Sap67TSSaK96q972oJb6lLylrmYmrRk2MrOG0v8EoyHigfdoAbALfEDq/Nbb?=
 =?us-ascii?Q?5NQaDghXaySX7P3tqvEgkPK5GC9kHFQSlwWQY74L5KJd2SOVE4vMnbbyS3b7?=
 =?us-ascii?Q?BAf7QFOMwykLuFNX0VRr4gqh3EqTxDXI2dTrSbxVzugghXb+vdjAZcRVEhuU?=
 =?us-ascii?Q?EatFNFrI2qO46+CK1uTsQDnSSkVJD9uwBMr7LtZ1IxbZjnPT81hrPqhUPAa+?=
 =?us-ascii?Q?A5QI93JGgnYPcPuuoO2BMyNpES9EvLeYNYtR+Qte6JFept0CA/FXRCEzXLLF?=
 =?us-ascii?Q?2TJYYyGJRJT+LMUSJtOVD60DKgQUl/y7bgBSouuZEtJZeFkOq6T3UZ7LPvVC?=
 =?us-ascii?Q?RS7Jv+rngSAfMa3VuVcVgPrYdvIt2JSwUP32UolkSIu10E1Mt49MT/y9cSfD?=
 =?us-ascii?Q?6xFfllrM6XivQUPHEgTkC5P+QzTDjiPQ0yiUEVB2QCCHn/FQ9jiLBloydKIg?=
 =?us-ascii?Q?js6UOVQBKwk0xEyQu4hDohVGKi5X0SAZYQEWOmtGDkM6GYIjXjttpYp2TIGH?=
 =?us-ascii?Q?G7/j2yCdnTDb8WYsk5qSDJIypd7rCyX0waNsyuikTvMT4A/oXcbhREiJIsUB?=
 =?us-ascii?Q?MZLBUkdzL6Ndz5AfJyPcFIeNnYJHDm5itiG7rcqL7iQsHJWpNeMO/xhKnWcc?=
 =?us-ascii?Q?cOJNts60phy+Iwg4WULmZpYMzB6LADXS3GFJNtiD8UgOlyqcX/lGKecNjOQj?=
 =?us-ascii?Q?Z6Dxa4gdajkWgFbdzauol9L0ZmGQll3nRCrxQq7K41Y8mB8O1m1gsdRSi7jM?=
 =?us-ascii?Q?hJ5EQp/+8dbKoWu2SDFBwTjY7MRS9flLHgFMaQw7ZZVqfFA/3+fmVhZUYAjB?=
 =?us-ascii?Q?PBgWz0nhivKJ0iHBrctRD6BF3laXsDUXXxYS9diSilU8ozr3rXqEX7U6QtqP?=
 =?us-ascii?Q?0ggTsPKNh0a7ForAknAf/nwt7Ue3DasCATEKSA0UayISExy1XUFLacNUWpUF?=
 =?us-ascii?Q?8m8yEM38xGjlECMnC0va53+SKhWwqKZ6F9MjGUcIhgcl/xQpDrsBVsVrb4Zz?=
 =?us-ascii?Q?/3a0EbrjUGS8dxrSbq7hF5RV2PymGmjnb+TUsKEyElirinfMfbYu0Pj2skhy?=
 =?us-ascii?Q?oYN/oVYJIXIvPvSoqBqAQdEqZJc1V8CQY8BBAGTOmyR9DA5PcJOSa+eV0NsJ?=
 =?us-ascii?Q?x+ySzqNf/tTlI9PXl9kWs8agCIamTmC8L4m7qFvdm9KSNtBb3PCR+Fl0x6gE?=
 =?us-ascii?Q?yc6xoG//KgjZl7hK/C2TfEF2qQ/YPmGk?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6677
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4075f9b7-18d8-4cc9-21a9-08de0b062f74
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|14060799003|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g6b8redSNJWluxOfhtsog9xxll+ecQ1jgaLqm2itsMeVUciwqFyKb9tQcFRa?=
 =?us-ascii?Q?kLiFDumLXLP/NfGm+vmzz1Ork40HC7zw5cqRZmmxeyy4Cz+7AryBpU/ZQ06V?=
 =?us-ascii?Q?LTlDfXnw7SqleJ/X5sdDk22Q1CSKkGF+DK0BrTw8wKmP0Jb7C0qE8uQ1gcli?=
 =?us-ascii?Q?L1PHgZhgdk5LT8YeTIskgt48Kb7wINdUJMtBz6HZXIFTgfAgXuhfRG5fcdE6?=
 =?us-ascii?Q?biexoYy4B7BF0R5IZvRRZchcOlSDFGdbl//vSNyQHn42CsSb/E44ju1k/4pP?=
 =?us-ascii?Q?+9Q6s8smbNTPmhV0+r+Gcut/s4WP5QbIJnnSmcSh0G4XT8+XiVv9oIQcaww9?=
 =?us-ascii?Q?gnKnXmQ4p0qJgYRbjXDLojp9NBlvEVg2ft87Teer9mFe2Biav+JQ4gKDKYkz?=
 =?us-ascii?Q?WKtOFBrxxu/xuo1E/QPuLnpM2e7qz6IBfPTLtd+KZWL7uxgIxo0U7umZ0qAi?=
 =?us-ascii?Q?GlC73of2WSyBRk12Uv757sSZnrBIbQ2arkh8B7ZdRPP3p/QEYfH0kmmgGg79?=
 =?us-ascii?Q?oRhonvSxh/57m8KELHHgIaUhElEp5YVmUU/hnf6GThTkV32dvbuZHjoA7tK4?=
 =?us-ascii?Q?OkhKf34++xa92h1uXDYhVzb3WupKVIa9d0jxEkYcElNdwpDL1yAAS77cp+Gb?=
 =?us-ascii?Q?Gt5U668zjKwYZi85AbRc1CIiSTJ1GbdRwUz1ynr7DABUAoHLQcJm7hPj0iVK?=
 =?us-ascii?Q?DMjYZfOYtCx2EusZrOeGXoOlYMvDBuzkP+iFtEl60V45L1byIume+PewikEe?=
 =?us-ascii?Q?yjujEe5jH3ssTOdvhxpC9M4cGzfJGdBT5vRu2XRObF1uuwOUkfceZ77qvX49?=
 =?us-ascii?Q?gFV2LkWj0sSEhWN/JHwnWMFXjOFGwss0RM+eGgc+Ku8b7PYeRbpde7zROCqM?=
 =?us-ascii?Q?3jwHWtWV9VS7wlmrkjxzIkoaT/IOdW2Uh6m/5ovTimFYiMSdgjguWnBtx6FF?=
 =?us-ascii?Q?wbAOqTmVHxVjbOQeh1KAaGi4xQ3etdLdyCSAv9FVoNudbqPZttLzC8u8kVOz?=
 =?us-ascii?Q?EjTdnDZudBvcz2qb/TJK/X+h++il0xlkEl54fWuELYt6kHPbHfjE+689vf59?=
 =?us-ascii?Q?Z6+DUcfDGcG6AA8S14GCWdBeAOn5u4bP70FOT7KcLp3rlPMyFo39osL/x2de?=
 =?us-ascii?Q?qXOpfOO7/KXcSq0uZ5BvtMviCoPPJI4MQxNiwiolo+gSkWYenB1dWf0H9wzF?=
 =?us-ascii?Q?b0INm5C1ZloZrsfcSxmMkp66Sy1QnPodstl1HPoELiaf0CNZRUQGBmC8FZ7J?=
 =?us-ascii?Q?/qygepWem/g5YFy01mh+z7sCadHhXM/pTc/K3h18f4LAim55sWcPVnGnmEeF?=
 =?us-ascii?Q?wdlC11kNB1fKXtvosuwv6PrtFFR9x0LMXsozeVVyV26zV3WgGXfCNcLDfz1D?=
 =?us-ascii?Q?DCMpTSnqzh94xY723DO5qqkZ2LBdbACLCQZ/oUeqB2ebAEeuzSeXGWAUyG+L?=
 =?us-ascii?Q?0QgndXeetIukDwcdu4IVNBU61mH7GdjiiIPM0dFEOo2ykK1KeNxP9znOxzVB?=
 =?us-ascii?Q?er7Lf8Du7T6lTYYSkBAtDg/UQ5kGtMqG26f2m2w2TjyTRAE6X8GlVOUp5uqn?=
 =?us-ascii?Q?dFIvK4TBesLrjffxRNw=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(14060799003)(376014)(82310400026)(36860700013)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 09:44:25.9381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c686a4-6537-4d92-8694-08de0b064354
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR08MB11654
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

This patch series extends the Panthor driver with basic support for
Mali-G1 GPUs.

The v14 architecture introduces several hardware and register-level
changes compared to prior GPUs. This series adds the necessary
architecture-specific support infrastructure, power control and reset
handling for Mali-G1 GPUs.

Patch Breakdown:
[Patch 1-4]:  Refactor panthor_hw to introduce architecture-specific
              hooks and abstractions to support the v14 architecture.
              These patches introduces architecture-specific HW binding
              for feature bits and function pointers.
[Patch 5-7]:  Adds basic L2 power on/off and soft reset support for the
              PWR_CONTROL block introduced in v14.
[Patch 8]:    Update MCU halt and warm boot operations to reflect the
              GLB_REQ.STATE changes in v14. This ensures that the MCU is
              properly halted and the correct operations are performed
              on warm boot depending on the FW version.
[Patch 9]:    Align endpoint_req with changes introduced in v14, where
              the register is widened to 64-bit and shifed down by
              4-bytes. This patch adds the necessary infrastructure to
              discern the correct endpoint_req register to use.
[Patch 10]:   Enables Mali-G1 support on Panthor by adding HW bindings
              for v14 architecture.

Kind regards,
Karunika Choo

Karunika Choo (10):
  drm/panthor: Factor out GPU_ID register read into separate function
  drm/panthor: Add arch-specific panthor_hw binding
  drm/panthor: Introduce framework for architecture-specific features
  drm/panthor: Add architecture-specific function operations
  drm/panthor: Introduce panthor_pwr API and power control framework
  drm/panthor: Implement L2 power on/off via PWR_CONTROL
  drm/panthor: Implement soft and fast reset via PWR_CONTROL
  drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs
  drm/panthor: Support 64-bit endpoint_req register for Mali-G1
  drm/panthor: Add support for Mali-G1 GPUs

 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |  18 +-
 drivers/gpu/drm/panthor/panthor_device.h |   8 +
 drivers/gpu/drm/panthor/panthor_fw.c     | 123 ++++-
 drivers/gpu/drm/panthor/panthor_fw.h     |  27 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    |  13 +-
 drivers/gpu/drm/panthor/panthor_gpu.h    |   1 +
 drivers/gpu/drm/panthor/panthor_hw.c     | 107 ++++-
 drivers/gpu/drm/panthor/panthor_hw.h     |  50 ++
 drivers/gpu/drm/panthor/panthor_pwr.c    | 581 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h    |  25 +
 drivers/gpu/drm/panthor/panthor_regs.h   |  79 +++
 drivers/gpu/drm/panthor/panthor_sched.c  |  22 +-
 13 files changed, 1019 insertions(+), 36 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.h

-- 
2.49.0

