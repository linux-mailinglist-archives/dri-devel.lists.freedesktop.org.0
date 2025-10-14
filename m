Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD2DBD8844
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 11:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D0C10E59B;
	Tue, 14 Oct 2025 09:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Ru21CcwH";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ru21CcwH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013040.outbound.protection.outlook.com [40.107.159.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C995610E59A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:44:57 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rFmeo+RN+kmLry2sjHzWYaIQD5MPEjMtBErd57HHfDf0G/EcjakEV3fuy9NEbh9/RTKNheaBpKYgXAkqahNKns5vH8iF2rVg1z2kc7SMMQs3u0vaE9/xMFXHhPC4QQ3FBzPq3WPVd+oGGTEepfydcv/LMCAntskUFO0ReyqBgNHZY7qIvb3qJ0WBmlSPa/bV2fcs7xwQijZYSXcbOlAl5JKLS67p2N3GzDcA+4fsoZyWqMGk7JcdZ9MWdyycxYwFsYnS9ls1jWUTJBf/w01CvUDTdjo+Dn9mjkiusTbRyvUpNfi1dlIMAXQjJQIClK2N6fQm02Fygy1AZvwivVjHWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZtG4djRjwn3yd7lKDT8XDd+n7rVeE6lacQWVRDKk6E=;
 b=a9JF0kVAEfpmFC21rYMX6bd20087ooVJBcMeaJgrSO9vOeym6SyPfxkOD2oW+OGnJRWKxUb2l14rnYB99oory0GOjBX8+yHI6lpshLPyiqEY+vTgyQHYtFSdiBPjAzFD4vKpQcHyTJVhh/FpxVvXOWgwLIg4GbYV1PxTK+G/TmT+pXrA9xcMHXeyC5vWsjZk7UFJ+axE7TGDfxAjytpwPyIG9wB0co01CQADgoV0z+uyUN9c+bTna/HMEL7K2di7zKeh76uWEP3WuwuLihIi9GDSL2wskSMra5IiP4jdDndoxqqAcqUjUx8pQdA0EakX5A5cTBpnTdhuX3biPKL4aw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZtG4djRjwn3yd7lKDT8XDd+n7rVeE6lacQWVRDKk6E=;
 b=Ru21CcwH7E0s/RAVAxozm2R3oriVCUMkZBMZREuvS4mrurDe/arpr+wbY+iZYV+Z7/qQ/jEZ0g8dVCVaJeGkfHB+/MpuKq7bM8y1M9ie0PWpVd6MKQizJhilE4qGHhvCAfWCnFbroMOq0Cd+CyZkhuhsxgSMcaouxhoozQ2vuww=
Received: from AS4PR09CA0021.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::19)
 by GV2PR08MB7954.eurprd08.prod.outlook.com (2603:10a6:150:a8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 09:44:50 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::5) by AS4PR09CA0021.outlook.office365.com
 (2603:10a6:20b:5d4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Tue,
 14 Oct 2025 09:44:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Tue, 14 Oct 2025 09:44:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiPJ5d+cVq7Uhi5KQrpEm6FHE7NkjpcfuXEgPb5+QwuMSJd8JS1nLjM+PpNJu4hE/kMVzDYqpPF1wZIDwUvieMQavwoIE7jYmMEsDzSiIyH9/s2TBC0ZPBy+o0G1DhOqsQI9vfM8UCH1rT9ohQzsS5/pY/4/FQikLDczKhN7arIHh09NHlyiZ/Jq5ZzKFL6WJHV7UM9Yhlb8+r+5m3ENLD9dNO7cVz6AmnpsxSbRTkDUa+d2oBpw3OUh1DUyQ3iTNnkj4E2FcGnUbRt7STDptY9/6ZRJJ5JdIL+YAOI++kutkChD3+YzIbnBeK50V5qDu717ZfGUqsrjm37Kp4elTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZtG4djRjwn3yd7lKDT8XDd+n7rVeE6lacQWVRDKk6E=;
 b=ijCspA3/y3L6w7uILSbZh0Td22mcVtwCIQyHH1Te+H3GAZSNVnzlzCKiRGivSZ6NI+TfbjrBv6Nq2FWXDU+3sTsE06rCXqVzkwf1rfV69rDaqfzfkWBzlZ+B3Ks/llFFs4XGSkmh8vJDAQenQF+prrsdajAC6BjveOIGvbFt0FwEvRBxYq0KK/YOs8gnn/p+riojjWFft05nu5oRb+eMeRUduEyEolEcSbgidz3slb35/6hRs2PwyqurFpCh1gaCcBuU0OKg5qr8fOurZD2f7Y66/wtu5quwVw0setBVFd4h6WdRO0/JmEd6YfcKECmoYlPyL0uDZx7AJNLCHqsqag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZtG4djRjwn3yd7lKDT8XDd+n7rVeE6lacQWVRDKk6E=;
 b=Ru21CcwH7E0s/RAVAxozm2R3oriVCUMkZBMZREuvS4mrurDe/arpr+wbY+iZYV+Z7/qQ/jEZ0g8dVCVaJeGkfHB+/MpuKq7bM8y1M9ie0PWpVd6MKQizJhilE4qGHhvCAfWCnFbroMOq0Cd+CyZkhuhsxgSMcaouxhoozQ2vuww=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU2PR08MB10039.eurprd08.prod.outlook.com
 (2603:10a6:10:49d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 09:44:16 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 09:44:15 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/10] drm/panthor: Implement soft and fast reset via
 PWR_CONTROL
Date: Tue, 14 Oct 2025 10:43:34 +0100
Message-ID: <20251014094337.1009601-8-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014094337.1009601-1-karunika.choo@arm.com>
References: <20251014094337.1009601-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0111.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34c::13) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU2PR08MB10039:EE_|AMS0EPF000001B0:EE_|GV2PR08MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: ad44fe9c-7088-49cf-a41f-08de0b0651af
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?w8g5ByT1ymhR6BrVIDHbCzxNcufas90AZex6jY4SHTACsvC6Jy0uAwVyqgOM?=
 =?us-ascii?Q?QGuWorQHqr0stvgUeatmgYFqY3BxQeshOmHe2IG0DeztjRT99zwKmzYgNyzR?=
 =?us-ascii?Q?tvB1Y1iZI/ydx9LfWUCfJPw7d9VH9faTtjCYfkjQxtqp4Hopc+AkO2ypIOhe?=
 =?us-ascii?Q?f6MPfDHN1pl/ArUG4muIvAQWYg0imtElcB7sgAbd8q6a5DGJ4DJO0unws6Hy?=
 =?us-ascii?Q?CK29LXOfvvns50jEVeF3UhilMF/Dn54Z2pMVYwqaPjlU0/T3HkxWDn0gk9XU?=
 =?us-ascii?Q?HOL3VDHQCa5QIaELj2fcPVLGr3GkjIBPMb7WHVKUfe0qWW2ImoTUq35wrXQ2?=
 =?us-ascii?Q?yjYWSVoscHNQBdptWMoBrO6i6btzHBAcXEw0j7X7DRZF+pbbZLG4oyOMqd65?=
 =?us-ascii?Q?Zr50H0tn5u9ef99M8u3raZlh+c/YvlJoSgDW6uE+6fmsPIqxB7bx73LYB7e5?=
 =?us-ascii?Q?pLbCqKMHCna2Fm7gid5CZTeChyipJwim5srtbpISdug6aXANIzj3OHYkKKef?=
 =?us-ascii?Q?S0Y5NHIdxQxk3APFvkahwxyDciUSKpA5bgqejXM9+tgyOpFlvQWlZz5dpoGt?=
 =?us-ascii?Q?03sjxxH6ybZPYHxidCx02utXZ4VC6Gg5/Vl2wG3hXwdvipmhlUE/SiiyUJeQ?=
 =?us-ascii?Q?jM2P0bKczUi/K1wnzmx2psS+LnII9+VG5rPlzXMnyntXEEhCt6AjIuc3DaLF?=
 =?us-ascii?Q?kAOeNQGPbLTrhgJux+S9w9qR/1ivDe4CqnI8aSgGK85jNqkdtagsdpmNWJt0?=
 =?us-ascii?Q?aWXt0Ovfo1YncmKuPWgHkWAkqt1vtkuSJwt4tGsqj9PXekh/FkCuOFFBuPed?=
 =?us-ascii?Q?e1FXYZYo33gR1x5og7VgIv5zz0TVfs+YwwmRDVeCpIIDbQ2VE8lfkNGx2dJ0?=
 =?us-ascii?Q?M7EIndsXXYvI+OgrE3H8rLPfkPwqe4z7dVaH84dTSGeTp/OzudeVAg5koffh?=
 =?us-ascii?Q?pqT1frP/s7T4n174gd5LubAlX2VoNZDnNmpe5NFgrdtzk+3tF3wsTcMzg9Tb?=
 =?us-ascii?Q?Hs+ee2NLlM6UxonSVBIKaYoolrc4BB+aQvON5Z8C2UrlM1+9NgQ0GpATPVZv?=
 =?us-ascii?Q?XFbR48lfBgqEPZYpRttPTjthIxQkXE7PU0e7xyq4d5eWguWY13zXnZg1T0nx?=
 =?us-ascii?Q?Pc6OqoK8g86OO94VPC2alGNoS0Qz35l7xgkwvyFee3wu5rIcwXefepQcDrPk?=
 =?us-ascii?Q?5l61CwHK4w3HrbxQxzShLMlXvzeR/ctFEVDOxjQM2vUgG/JCnRdZSFfm8kTG?=
 =?us-ascii?Q?fknmB/Eg9es49QNgRYRQHKjCni6wCKuvrbmRPVhTZtDNHcnP+VSmIJJpos/6?=
 =?us-ascii?Q?Y7KC2DT9/u5o0w/rTgzT1Q/u3kUhMhcK+jqkdMpcS6e9uuK6zzu7txDkQV8b?=
 =?us-ascii?Q?ZwUty7v/KxOW28XYhAZpuy7beK2Mxlexk+1zmMsFYAk6wosSPNP3XwLv8F+r?=
 =?us-ascii?Q?6zlzLdn9jfGqcp9i3QEo2el8jJNXPbuF?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10039
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0a409d64-10c3-4630-a762-08de0b063d1e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|14060799003|35042699022|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aruVsY8dM+erZ14ipVEAEQg7YuEihHbwdIDiQL6mSfzqL2marQ3OrdQpROPG?=
 =?us-ascii?Q?fGSAcPn/GUCHcrv6m7jY+Rde3UH1xc6s5qzoE01CMwv1qm5tzEka6e06tvNz?=
 =?us-ascii?Q?R5Cz3NE+lX/HkxGAHSAqaq/lawwEjeyrQwnDnyZQBRCe7/IAQFtYO+bXe/VB?=
 =?us-ascii?Q?kF3Ex6tUV11KQfgiboGAqDyYwu2vwwIRT+rS8RX2jC0N8VbERECyn+TWc3Zg?=
 =?us-ascii?Q?DcproyckSKgi1wE7O1ps6KoFv2fnIi5nU6FmGpUOCsaUuUJ+hc/ye/bagiJx?=
 =?us-ascii?Q?wcFIoB9Xe8BHtsxrXFuRKTsIhHI13mk7vJTN6X6NMCBRmU6eeYUd9jKp6UBG?=
 =?us-ascii?Q?/xhuRxHzcmJGt+KgflWIE1NH06MWPz9hfYTGLf2ke6HEXZDWlH8K/kQHWFbr?=
 =?us-ascii?Q?4U5GDOHfpErt1yFUMs0DEouxblyg/pBtQ7ywPcZE3mYiDp7Pr19hTNMVeJP+?=
 =?us-ascii?Q?Ab9U6M7bAkPI2EbOU7OEDFAGnRUmKXa0OwekJaVz88mMsyJUvP3SlGtwAlup?=
 =?us-ascii?Q?/FsQvM5owE/KhfnMBm7mAoH4ij8YXv5OboDCplxrVUXNqslqI9PS7LbJM5/Z?=
 =?us-ascii?Q?ATUSxFQXl6rUMe6zKO21qn/TqN77mNr5X2uDMd0+YNmaqvr68a/vFod9EJ5X?=
 =?us-ascii?Q?hh+g8hBo5sRrlKyyFI+XbfDStsHMNbhGKb6bD8GooP4RdCypJSBzKVxSjjzg?=
 =?us-ascii?Q?DCfmZSzra8HTJIKc8QJcl4kN+9XvfEnBn+xAaSvQ/nTdkj6+J8mmMkEwycTt?=
 =?us-ascii?Q?XdNRY68eUJ5hoBEMiODledDqCbesOiOpAptIztEEmTb6mCu0J0FZ9y/EQLr6?=
 =?us-ascii?Q?j07EGssftdbdyZZdwse4sismmDfc1zMgzjJ+r/LkJ5avhl46lgIWId6N/AJe?=
 =?us-ascii?Q?ZCqYdkSIsKH6bjQloOq3gb7x+qz/yNQ93nnezHnjm4XWqeyv2gx80MWKDl+F?=
 =?us-ascii?Q?kFofyW/hR1xR+fHpJrurKZ+UX7PZGT27aMcpxZrupfiDSP7C9qfWgxyO2jEZ?=
 =?us-ascii?Q?VYCuZZt/MM46k+VAdqoJhp7rzdYcTCHvNmmEU5mJiWcEj5Frv2XxKl8W0Bch?=
 =?us-ascii?Q?U/+6S4a6/5xngxIj/AcYuL0ub+XnU072/pKAPw/JWBWN4j0MPQpCoY6sDwxA?=
 =?us-ascii?Q?svMKYL2lTStUZAgb9Ia992RQyjzJ0im2ercvW8X6DXRLuYkikJWLvnjAKqdY?=
 =?us-ascii?Q?sBxlm+yE0Knb9uRJP6EEdUYwam/IiNV9na9rduuYeJ9evvBRsF758EkC+3h/?=
 =?us-ascii?Q?M7ufZlx2FnYlpLo8U/yIsbBB5h53MtviKLkofSyhoDz27kaJQRShhRguYZc9?=
 =?us-ascii?Q?VF2g/TeRvDwEnGDlApfHx2Xd8hcz79nms+ldbtf9J5g8GZd316BlT//KjnEr?=
 =?us-ascii?Q?ssuEutQOqY7keoXGZEzD0Ujtey5nmt/ttfsDrrbrXoy1Y3GmKHEiIf4Dkzm3?=
 =?us-ascii?Q?tYLlVU0rEc16Jx0GPVSfKoqUi6IvGMNan/K/T9rqWmsuuqIWARrfMLcteVVW?=
 =?us-ascii?Q?uoQEIAtQRyX6FvcHIxt2+zi6dqMFRQnNq8GySzYpaExWrrtN++mB2BdUJs8S?=
 =?us-ascii?Q?biEYsRvHSQ6+w+NI37c=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(14060799003)(35042699022)(376014)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 09:44:50.0445 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad44fe9c-7088-49cf-a41f-08de0b0651af
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7954
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
for both RESET_SOFT and RESET_FAST operations with timeout handling and
status verification.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_pwr.c | 62 ++++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_pwr.h |  2 +
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
index 594181aba847..ecb278824d06 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.c
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -3,6 +3,7 @@
 
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
+#include <linux/cleanup.h>
 #include <linux/iopoll.h>
 #include <linux/wait.h>
 
@@ -31,6 +32,8 @@
 
 #define PWR_RETRACT_TIMEOUT_US		2000
 
+#define PWR_RESET_TIMEOUT_MS		500
+
 /**
  * struct panthor_pwr - PWR_CONTROL block management data.
  */
@@ -80,6 +83,42 @@ static void panthor_pwr_write_command(struct panthor_device *ptdev, u32 command,
 	gpu_write(ptdev, PWR_COMMAND, command);
 }
 
+static bool reset_irq_raised(struct panthor_device *ptdev)
+{
+	return gpu_read(ptdev, PWR_INT_RAWSTAT) & PWR_IRQ_RESET_COMPLETED;
+}
+
+static bool reset_completed(struct panthor_device *ptdev)
+{
+	return (ptdev->pwr->pending_reqs & PWR_IRQ_RESET_COMPLETED);
+}
+
+static int panthor_pwr_reset(struct panthor_device *ptdev, u32 reset_cmd)
+{
+	scoped_guard(spinlock_irqsave, &ptdev->pwr->reqs_lock) {
+		if (!drm_WARN_ON(&ptdev->base, !reset_completed(ptdev))) {
+			ptdev->pwr->pending_reqs |= PWR_IRQ_RESET_COMPLETED;
+			gpu_write(ptdev, PWR_INT_CLEAR, PWR_IRQ_RESET_COMPLETED);
+			panthor_pwr_write_command(ptdev, reset_cmd, 0);
+		}
+	}
+
+	if (!wait_event_timeout(ptdev->pwr->reqs_acked, reset_completed(ptdev),
+				msecs_to_jiffies(PWR_RESET_TIMEOUT_MS))) {
+		guard(spinlock_irqsave)(&ptdev->pwr->reqs_lock);
+
+		if (!reset_completed(ptdev) && !reset_irq_raised(ptdev)) {
+			drm_err(&ptdev->base, "RESET_%s timed out",
+				reset_cmd == PWR_COMMAND_RESET_SOFT ? "SOFT" : "FAST");
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
@@ -407,9 +446,30 @@ int panthor_pwr_init(struct panthor_device *ptdev)
 	return 0;
 }
 
+int panthor_pwr_reset_fast(struct panthor_device *ptdev)
+{
+	if (!ptdev->pwr)
+		return 0;
+
+	if (!(panthor_pwr_read_status(ptdev) & PWR_STATUS_ALLOW_FAST_RESET)) {
+		drm_err(&ptdev->base, "RESET_SOFT not allowed");
+		return -EOPNOTSUPP;
+	}
+
+	return panthor_pwr_reset(ptdev, PWR_COMMAND_RESET_FAST);
+}
+
 int panthor_pwr_reset_soft(struct panthor_device *ptdev)
 {
-	return 0;
+	if (!ptdev->pwr)
+		return 0;
+
+	if (!(panthor_pwr_read_status(ptdev) & PWR_STATUS_ALLOW_SOFT_RESET)) {
+		drm_err(&ptdev->base, "RESET_SOFT not allowed");
+		return -EOPNOTSUPP;
+	}
+
+	return panthor_pwr_reset(ptdev, PWR_COMMAND_RESET_SOFT);
 }
 
 int panthor_pwr_l2_power_off(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
index a4042c125448..2301c26dab86 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.h
+++ b/drivers/gpu/drm/panthor/panthor_pwr.h
@@ -10,6 +10,8 @@ void panthor_pwr_unplug(struct panthor_device *ptdev);
 
 int panthor_pwr_init(struct panthor_device *ptdev);
 
+int panthor_pwr_reset_fast(struct panthor_device *ptdev);
+
 int panthor_pwr_reset_soft(struct panthor_device *ptdev);
 
 int panthor_pwr_l2_power_on(struct panthor_device *ptdev);
-- 
2.49.0

