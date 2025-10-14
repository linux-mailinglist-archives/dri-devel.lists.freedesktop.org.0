Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA609BD883B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 11:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DCB10E596;
	Tue, 14 Oct 2025 09:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="N4YotU3l";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="N4YotU3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013001.outbound.protection.outlook.com
 [40.107.162.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C08910E596
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:44:53 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HsQxdFzHe6253BvWu4//0OcVEAHvYwRJuDyu+oSHC63v6yv25ZuEEmVHLD/qXBQ51rD2UzjvMy89LBEsoeYRdUzzwzFvKaldtDB08p4ovx7HVMULDYnkVO9E2ImbYRqkNRYH3rxcR2A40GVkRwAavpkwhFpu7qvI3xI3PdZNM/NgrNubDEGprWhRfdbxSzz0m7l/fR0mBiGo6ls33WAkOsfqfaSs5yl6+iNZ9+SjIBGDytgSfkILcCy2zA1WoOUEt73DzipgZ2W4Kyw0V1YlHrfkm2XqbtVODlLdJWW00mQFXi2pLFwnAyjhU9ATmbFHHd2a2cbgO14TWSsbbO5tvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiX0pIsoSkBZoRCmlPPwtA/U/0uvT14tJcmjT/YqG7I=;
 b=p6W3h7UyxvBVxpsOYCv2fc8j9vY4L4wX/OApHkX/zzxx4RQDVC1dUIxdc7u9HO4SwvGq8pGCKQL2LjtdCq4AA9dQbnO2onE8xWc9HOccteycMG5Cw4oOsBILd5inuTln5Q9eIJzJCq92lEJm0OYY9VyB+havNabYWXT0MIzcjgADU1DjFsBKpxpRJWkwzKbdYVrOL6XD1lJAeoEri9aW64TXE/3vOqI4BTeUiQLWFrD1rJBwItP2Ex7liMLf+oWglJNEnm8Oc/IRjT9Nv+TL4fHXaUvTPRMNGEWPMmtN6RoRMdcEItkz7r9uYeuwmMhqurD9ihG3Zb2eSXhJs+KrIA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiX0pIsoSkBZoRCmlPPwtA/U/0uvT14tJcmjT/YqG7I=;
 b=N4YotU3luAVrznKpfnxfuYYNK6R7xn75jUs7B7B6Yq70LRWzaH0Z5vfsfJ8WMKx3PUxPkKvC45dn+i4GXd3SWmQtUwTucXSPuqlbwOzxslpHxoAcFUvy2RaUh7sFEJM/WMTCQbk6vTiLrL2P7HGqm8k63IK5PSXS3R+3xPn7I/w=
Received: from DU7P190CA0019.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::15)
 by PAVPR08MB8799.eurprd08.prod.outlook.com (2603:10a6:102:32b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 09:44:49 +0000
Received: from DU2PEPF0001E9BF.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::db) by DU7P190CA0019.outlook.office365.com
 (2603:10a6:10:550::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Tue,
 14 Oct 2025 09:44:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9BF.mail.protection.outlook.com (10.167.8.68) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7 via
 Frontend Transport; Tue, 14 Oct 2025 09:44:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEuBB2SHvhdejA7Z3aUDDZ+yaW5ro29Xx3DNh/7JBDlPNqGVkcDKip7wEuWXsSoU53mjNrvHgRBs49WBlRAhATpPD5LpjljufL3IFilej5HIst2o4SO0+R+zKXTH+ftYr78tZ4YLhiICUhg6/XTL6vRyO6eWfvHJRuIydAdkicmXo4kVIJhGIG979XbqqXEZ5N9iuGq+7eckK1iUF4RxTqLFQELWk+tR9cZbu94lA0+1e0RTp9/3l/srddsJmPH0ota+ksqBg/wczjf3goyLe0Pt+kfBBzFuWO5hvmHH6t7AM9nz6casVQmETeSBv3sh6qz+u2FCcQkR/MIgnkV5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiX0pIsoSkBZoRCmlPPwtA/U/0uvT14tJcmjT/YqG7I=;
 b=bRE8Xj3uZhZUXY6c2WilaIGUjh6nBFUAYml+/L8ptaBCFZQ4UM1f2lGtVIM2KOTaeo44qMFqsU7JtsRGhSrHUCBbzekOjFLLkkXaMR0nJl7nGldF/oumw3gacoIOSJzrF6OJT+Amy3fSUpZelbv8y65sJsjBf20WsFZnxc+q22xlnBE89dumJmKm7HYKEHtKzSZjrH6HkZrie5bgHbaxW3kl80fqK9RrW2mPg46NmB+xaS+87urT051uGGQ9dWb+8Ostj7/NcRkbCt13fq6fgpGPlY4sxuH+gDlojCsC3izXS+2z6rD4aGRn8U25k8793ZJxD4FiNh89N10Pus1Zyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiX0pIsoSkBZoRCmlPPwtA/U/0uvT14tJcmjT/YqG7I=;
 b=N4YotU3luAVrznKpfnxfuYYNK6R7xn75jUs7B7B6Yq70LRWzaH0Z5vfsfJ8WMKx3PUxPkKvC45dn+i4GXd3SWmQtUwTucXSPuqlbwOzxslpHxoAcFUvy2RaUh7sFEJM/WMTCQbk6vTiLrL2P7HGqm8k63IK5PSXS3R+3xPn7I/w=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU2PR08MB10039.eurprd08.prod.outlook.com
 (2603:10a6:10:49d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 09:44:14 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 09:44:14 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/10] drm/panthor: Implement L2 power on/off via
 PWR_CONTROL
Date: Tue, 14 Oct 2025 10:43:33 +0100
Message-ID: <20251014094337.1009601-7-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014094337.1009601-1-karunika.choo@arm.com>
References: <20251014094337.1009601-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0403.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::13) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU2PR08MB10039:EE_|DU2PEPF0001E9BF:EE_|PAVPR08MB8799:EE_
X-MS-Office365-Filtering-Correlation-Id: e792c95e-ebb4-4770-b2e0-08de0b06511f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?d6/E5X2F4snNp+WQK1Lc/0zFSgJvB7N/FN+lnPCLqe0AyuUIvMB4agSUmJzF?=
 =?us-ascii?Q?043+v9WhBhKT9gW1ZTZzE0EfaiAizJQT3L2iMRIyjP9CjzSHkgICQjGbPIkU?=
 =?us-ascii?Q?jh5XT1CCBzsuzjZzgy6EKgkXOH0izUoZLTvtdEqfqiA1Ojov2rL9PfYZdd6Z?=
 =?us-ascii?Q?kUIvnCM8Y4V8sBxBPtNWgKCUXLIp/AoUmxswy99MyPBb5xS0mPOXQBZA9BqJ?=
 =?us-ascii?Q?kTzvolpflK8UsvAFYuhSY/QGWC2XR8hOS5lQFx5l24A48q91vwggq0Vu+RQa?=
 =?us-ascii?Q?uH5+MY62JLpvOs0caAFcaIZZucyM0oRFLhWrzmlcBAvPbOs71Hq5lBm9uoR2?=
 =?us-ascii?Q?PAXunBYUszXFHjh1OLdIIk2kAhXN5Lpp+Sp9gDvePL0RZ5Hr51Os7+RlzHRR?=
 =?us-ascii?Q?DSMGKQ2byfDTKZEGAwWQrTkWyU7YrtK7v1qIGyd6PyTXxlG8R5Epw++WFzIB?=
 =?us-ascii?Q?3QhryNEXVYXJZ/9HAi50IGAeuKYokLqTilaDz8U3drAnNMVP1qeLDSHz1zob?=
 =?us-ascii?Q?3h2Mfui5Resn+joaS/tY8GSY2I7ku7nVC787P/4Zuy4qytAC2Zn+zsE1IEil?=
 =?us-ascii?Q?rYdbB1H2oCl6Zi0b+MFsLW66SK+eEbHImJx42DYtNU8ZG4iInwF2XRPlJ806?=
 =?us-ascii?Q?2WhTJ9iAecn9VUu2/kXa6l+luCUXUnfDMzu0S3scckFDmrby3bJkJkYPE15s?=
 =?us-ascii?Q?7JZC1tqUpia4cXOt6j0KZa9ElImj57tHjzr+vCJ1JgVfi1UR5Lg5dcqDpbZE?=
 =?us-ascii?Q?wQNQCEwEGg/oO7o4RvUoze0E0Hukg1JGHvIy3EzEyWZkoj8QGJ0eX+IpxAv0?=
 =?us-ascii?Q?nm7WkLQ4fhrY+gYuFVMD/oAbr8aOwGC7YuQlYtegA3SE7EL/t17ch2bYroO5?=
 =?us-ascii?Q?B7pLUoSP1JweVB4S+73fJrBAu0DX77uAody+hyTSl0LWG4OXehmwbMVqAZg0?=
 =?us-ascii?Q?imjiH9Rkmiv08PzlJ7ZqZNMH4hgk2uGPAbtkctmL6RalI5ZgvtaO8JHIMmqM?=
 =?us-ascii?Q?pK2+obUe1N8CG7YGU0bVt/XFCV7SNENn7Ktj05k9DTDcqepoio6rSWykuf/J?=
 =?us-ascii?Q?/91k5i5lPDEXksFC46Bk5yZTPYBsFSAe7mgs6Ow437O5uIVTUgB0eibF7FTo?=
 =?us-ascii?Q?Gl/kTCxAzZdgclMNoJ4xRiBZBRVzmkxT2pJDrW4neRFrYb5IfrmD4xwOroYB?=
 =?us-ascii?Q?jaeRQ/pR/lMunW/YIpiJGslPWZMRQrp4vwsDhKjfKAEDcaR9MVwB8VFT4muo?=
 =?us-ascii?Q?+qV8ZvrPEDFdO9pCKpUNW6TYPNzCMJvpWPPfqB09MCOQ8ajkEI6bJYtaKitA?=
 =?us-ascii?Q?5ZBXk3fCLGaBj0NiDZBjRB/Rr1ZShmc7/452S3JR1voGaq9mtS8/i8K9x5mh?=
 =?us-ascii?Q?TLesuoz0BA7nTGwXGmXuSafgsw+RCXvaSfFDg8974oKA1/vWAQRYPDixat64?=
 =?us-ascii?Q?Uk/J5vIAlMIau4kRZSWJH6YaoCTRXZHa?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10039
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3c1219e7-3d01-4d71-2898-08de0b063b5c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|35042699022|14060799003|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jAi+GUlCm6BnhU0D7Qrj6oirL2uH/yh2uQ57cCOWB6qHTdNhXNH/j2uqozfM?=
 =?us-ascii?Q?8l+fD2RlV2qFZEcDoHZIVzeM1o5z9Co9B2mty4Fxb42wnB/ePQXYMRRGCXXs?=
 =?us-ascii?Q?ooUzVoSAZq9U92KplbEuJd4aYgcu/xCC5quiPw11UAGHvqFLH9qVWjwn1c8R?=
 =?us-ascii?Q?3jRUpONhxWxLdv+m3wCN8ZM1+Z3xaPyorJKXCpdOQXT/JwifYXJvbp8S7sNi?=
 =?us-ascii?Q?GT9gQfLTQF1lwS7B4C9QacR8Rpx8+Dql0aYvPNMYFlch93B4fHavc+6R7/Ej?=
 =?us-ascii?Q?FIMPhzH8jS5cz4VgSBGad4C4UEwrBQJbQea2Hdof6xCFN+cBx6cbR6a777iQ?=
 =?us-ascii?Q?2ozBAA9ELa1VAN9YNgAVtCGNnjH6g9z5vg0qfBMe+zDgI0wED+1E5jNNy7xM?=
 =?us-ascii?Q?ivJZoPVWyodN7LXsebusow2nSf7VdwZgh/+uKzt8tVAIq+Os7DZxV9H5OJp1?=
 =?us-ascii?Q?WhQE7n6ZERc7Mbm34EkbLZU4PAnpnJhtavvX99yXNrGWNiNTd3AQIPGqQtr1?=
 =?us-ascii?Q?Ly1kiqZ8iViO02YXitograWerZ0LHJCBKKtwUXUlLgJxCv3misO6tMcjzuLH?=
 =?us-ascii?Q?nAMohzuk+b7E7k1xfycUMqskHdVwQdhBf9TbEjTy4jJ//q65PzjpzJ1dMGy+?=
 =?us-ascii?Q?YmRyp7nOPoctQNbHwi3fw+f1m6UldbEXXNQiP2qpPGZhqsJFyy8LY6hJWwwX?=
 =?us-ascii?Q?IJ8w5rUE0SXAVW0Lk+hwmj0X6Hg2Rq0ixJYjns8HHF7vVPQKCL7heC8D7Xcm?=
 =?us-ascii?Q?tW0THk42Y7AueFOr/p0LO4pyuDZ97caj2XGmnDwY1cI+L11jLhs6JK6yalKt?=
 =?us-ascii?Q?PkZjQZO4kCk/+GDW0oGpmBYMZNy1qXXxmkbc1X59emObSaNSweM6t4KBSZnH?=
 =?us-ascii?Q?A0llmBeYwf/FO9GJayuIKl9HR5a+500/AF8KwKIds1Veu327qVtrLIAKc4IT?=
 =?us-ascii?Q?qEoZJ3ZGXctLVN9eL1rR41ab+A8Qqys5FM6mYx/ygs+71+T4W46k8nN72SPP?=
 =?us-ascii?Q?IHhEqf/IWbYXk3QcPtwQ2otd0+Juuiw2tZ8DWRnTguu8zuZk2SPlPXKGTRSP?=
 =?us-ascii?Q?yz3aeefgcBZLNfkR5LIFzfPj/Mq6WmN+/PEay4mri0ZFJz5y+TB/EmNvPWW9?=
 =?us-ascii?Q?hE9CIvVS++Y6KSGPJxg0RJdVlGBrp9KH1xJiomX0b9Cpc/3YupwjeI63VAbD?=
 =?us-ascii?Q?zNjAVhLMTfDRauqEQvNPgzbMHkqq7XqJaNbR0K3m4KZhmVwo32Lkxe8jcynR?=
 =?us-ascii?Q?9CvCFcb6qT8xfhf4wX9OC3C7LRzFB5l576SRXaRApgqQwNT/P8ezX9FbXlPI?=
 =?us-ascii?Q?NUipDwlLwdfRIP3YUf9sOdF93s+0ymLbPFzHanhgcDIZ2uXR9WXZfMEARSIs?=
 =?us-ascii?Q?b0Ktn5COeAOsiw/bAMFtryl9ez5VjHE5rW3/obw7/aaAuR33tvgSoHlfqqIv?=
 =?us-ascii?Q?/uMtjfsHsXecl8k6K8w/fvW4Ue79ML907A0/qxolvmYcFUW3bGHZtWspPJam?=
 =?us-ascii?Q?Pxlfzx2fAIu5gdAn4H8y/4e2dzYNcmJQ7JWIiuFX2eVzhgjCXxKOx8RgFeIP?=
 =?us-ascii?Q?Y9ffxvspB8SXBlD9ge8=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(35042699022)(14060799003)(376014)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 09:44:49.0843 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e792c95e-ebb4-4770-b2e0-08de0b06511f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8799
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

This patch adds common helpers to issue power commands, poll
transitions, and validate domain state, then wires them into the L2
on/off paths.

The L2 power-on sequence now delegates control of the SHADER and TILER
domains to the MCU when allowed, while the L2 itself is never delegated.
On power-off, dependent domains beneath the L2 are checked, and if
necessary, retracted and powered down to maintain proper domain
ordering.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_pwr.c | 390 +++++++++++++++++++++++++-
 1 file changed, 388 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
index d07ad5b7953a..594181aba847 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.c
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -23,6 +23,14 @@
 	 PWR_IRQ_COMMAND_NOT_ALLOWED | \
 	 PWR_IRQ_COMMAND_INVALID)
 
+#define PWR_ALL_CORES_MASK		GENMASK(63, 0)
+
+#define PWR_DOMAIN_MAX_BITS		16
+
+#define PWR_TRANSITION_TIMEOUT_US	2000000
+
+#define PWR_RETRACT_TIMEOUT_US		2000
+
 /**
  * struct panthor_pwr - PWR_CONTROL block management data.
  */
@@ -59,6 +67,302 @@ static void panthor_pwr_irq_handler(struct panthor_device *ptdev, u32 status)
 }
 PANTHOR_IRQ_HANDLER(pwr, PWR, panthor_pwr_irq_handler);
 
+static u64 panthor_pwr_read_status(struct panthor_device *ptdev)
+{
+	return gpu_read64(ptdev, PWR_STATUS);
+}
+
+static void panthor_pwr_write_command(struct panthor_device *ptdev, u32 command, u64 args)
+{
+	if (args)
+		gpu_write64(ptdev, PWR_CMDARG, args);
+
+	gpu_write(ptdev, PWR_COMMAND, command);
+}
+
+static const char *get_domain_name(u8 domain)
+{
+	switch (domain) {
+	case PWR_COMMAND_DOMAIN_L2:
+		return "L2";
+	case PWR_COMMAND_DOMAIN_TILER:
+		return "Tiler";
+	case PWR_COMMAND_DOMAIN_SHADER:
+		return "Shader";
+	case PWR_COMMAND_DOMAIN_BASE:
+		return "Base";
+	case PWR_COMMAND_DOMAIN_STACK:
+		return "Stack";
+	}
+	return "Unknown";
+}
+
+static u32 get_domain_base(u8 domain)
+{
+	switch (domain) {
+	case PWR_COMMAND_DOMAIN_L2:
+		return PWR_L2_PRESENT;
+	case PWR_COMMAND_DOMAIN_TILER:
+		return PWR_TILER_PRESENT;
+	case PWR_COMMAND_DOMAIN_SHADER:
+		return PWR_SHADER_PRESENT;
+	case PWR_COMMAND_DOMAIN_BASE:
+		return PWR_BASE_PRESENT;
+	case PWR_COMMAND_DOMAIN_STACK:
+		return PWR_STACK_PRESENT;
+	}
+	return 0;
+}
+
+static u32 get_domain_ready_reg(u32 domain)
+{
+	return get_domain_base(domain) + (PWR_L2_READY - PWR_L2_PRESENT);
+}
+
+static u32 get_domain_pwrtrans_reg(u32 domain)
+{
+	return get_domain_base(domain) + (PWR_L2_PWRTRANS - PWR_L2_PRESENT);
+}
+
+static bool is_valid_domain(u32 domain)
+{
+	return get_domain_base(domain) != 0;
+}
+
+static bool has_rtu(struct panthor_device *ptdev)
+{
+	return ptdev->gpu_info.gpu_features & GPU_FEATURES_RAY_TRAVERSAL;
+}
+
+static u8 get_domain_subdomain(struct panthor_device *ptdev, u32 domain)
+{
+	if ((domain == PWR_COMMAND_DOMAIN_SHADER) && has_rtu(ptdev))
+		return PWR_COMMAND_SUBDOMAIN_RTU;
+
+	return 0;
+}
+
+static int panthor_pwr_domain_wait_transition(struct panthor_device *ptdev, u32 domain,
+					      u32 timeout_us)
+{
+	u32 pwrtrans_reg = get_domain_pwrtrans_reg(domain);
+	u64 val;
+	int ret = 0;
+
+	ret = gpu_read64_poll_timeout(ptdev, pwrtrans_reg, val,
+				      !(PWR_ALL_CORES_MASK & val), 100,
+				      timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base, "%s domain power in transition, pwrtrans(0x%llx)",
+			get_domain_name(domain), val);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void panthor_pwr_info_show(struct panthor_device *ptdev)
+{
+	drm_info(&ptdev->base, "GPU_FEATURES:    0x%016llx", ptdev->gpu_info.gpu_features);
+	drm_info(&ptdev->base, "PWR_STATUS:      0x%016llx", gpu_read64(ptdev, PWR_STATUS));
+	drm_info(&ptdev->base, "L2_PRESENT:      0x%016llx", gpu_read64(ptdev, PWR_L2_PRESENT));
+	drm_info(&ptdev->base, "L2_PWRTRANS:     0x%016llx", gpu_read64(ptdev, PWR_L2_PWRTRANS));
+	drm_info(&ptdev->base, "L2_READY:        0x%016llx", gpu_read64(ptdev, PWR_L2_READY));
+	drm_info(&ptdev->base, "TILER_PRESENT:   0x%016llx", gpu_read64(ptdev, PWR_TILER_PRESENT));
+	drm_info(&ptdev->base, "TILER_PWRTRANS:  0x%016llx", gpu_read64(ptdev, PWR_TILER_PWRTRANS));
+	drm_info(&ptdev->base, "TILER_READY:     0x%016llx", gpu_read64(ptdev, PWR_TILER_READY));
+	drm_info(&ptdev->base, "SHADER_PRESENT:  0x%016llx", gpu_read64(ptdev, PWR_SHADER_PRESENT));
+	drm_info(&ptdev->base, "SHADER_PWRTRANS: 0x%016llx",
+		 gpu_read64(ptdev, PWR_SHADER_PWRTRANS));
+	drm_info(&ptdev->base, "SHADER_READY:    0x%016llx", gpu_read64(ptdev, PWR_SHADER_READY));
+}
+
+static int panthor_pwr_domain_transition(struct panthor_device *ptdev, u32 cmd, u32 domain,
+					 u64 mask, u32 timeout_us)
+{
+	u32 ready_reg = get_domain_ready_reg(domain);
+	u32 pwr_cmd = PWR_COMMAND_DEF(cmd, domain, get_domain_subdomain(ptdev, domain));
+	u64 expected_val = cmd == PWR_COMMAND_POWER_DOWN ? 0 : mask;
+	u64 val;
+	int ret = 0;
+
+	if (!is_valid_domain(domain))
+		return -EINVAL;
+
+	if (cmd != PWR_COMMAND_POWER_DOWN && cmd != PWR_COMMAND_POWER_UP) {
+		drm_err(&ptdev->base, "Invalid power domain transition command (0x%x)", cmd);
+		return -EINVAL;
+	}
+
+	ret = panthor_pwr_domain_wait_transition(ptdev, domain, timeout_us);
+	if (ret)
+		return ret;
+
+	/* domain already in target state, return early */
+	if ((gpu_read64(ptdev, ready_reg) & mask) == expected_val)
+		return 0;
+
+	panthor_pwr_write_command(ptdev, pwr_cmd, mask);
+
+	ret = gpu_read64_poll_timeout(ptdev, ready_reg, val, (mask & val) == expected_val, 100,
+				      timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base, "timeout waiting on %s power %s, cmd(0x%x), arg(0x%llx)",
+			get_domain_name(domain), cmd == PWR_COMMAND_POWER_DOWN ? "down" : "up",
+			pwr_cmd, mask);
+		panthor_pwr_info_show(ptdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+#define panthor_pwr_domain_power_off(__ptdev, __domain, __mask, __timeout_us)            \
+	panthor_pwr_domain_transition(__ptdev, PWR_COMMAND_POWER_DOWN, __domain, __mask, \
+				      __timeout_us)
+
+#define panthor_pwr_domain_power_on(__ptdev, __domain, __mask, __timeout_us) \
+	panthor_pwr_domain_transition(__ptdev, PWR_COMMAND_POWER_UP, __domain, __mask, __timeout_us)
+
+/**
+ * retract_domain() - Retract control of a domain from MCU
+ * @ptdev: Device.
+ * @domain: Domain to retract the control
+ *
+ * Retracting L2 domain is not expected since it won't be delegated.
+ *
+ * Return: 0 on success or retracted already.
+ *         -EPERM if domain is L2.
+ *         A negative error code otherwise.
+ */
+static int retract_domain(struct panthor_device *ptdev, u32 domain)
+{
+	const u32 pwr_cmd = PWR_COMMAND_DEF(PWR_COMMAND_RETRACT, domain, 0);
+	const u32 pwr_status_reg = panthor_pwr_read_status(ptdev);
+	const u32 delegated_mask = PWR_STATUS_DOMAIN_DELEGATED(domain);
+	const u32 allow_mask = PWR_STATUS_DOMAIN_ALLOWED(domain);
+	u64 val;
+	int ret;
+
+	if (WARN_ON(domain == PWR_COMMAND_DOMAIN_L2))
+		return -EINVAL;
+
+	if (WARN_ON(pwr_status_reg & PWR_STATUS_DOMAIN_DELEGATED(PWR_COMMAND_DOMAIN_L2)))
+		return -EPERM;
+
+	if (!(pwr_status_reg & delegated_mask)) {
+		drm_dbg(&ptdev->base, "%s domain already retracted",
+			get_domain_name(domain));
+		return 0;
+	}
+
+	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
+				      !(PWR_STATUS_RETRACT_PENDING & val), 0,
+				      PWR_RETRACT_TIMEOUT_US);
+	if (ret) {
+		drm_err(&ptdev->base, "%s domain retract pending",
+			get_domain_name(domain));
+		return ret;
+	}
+
+	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
+
+	/*
+	 * On successful retraction
+	 * allow-flag will be set with delegated-flag being cleared.
+	 */
+	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
+				      ((delegated_mask | allow_mask) & val) == allow_mask,
+				      10, PWR_TRANSITION_TIMEOUT_US);
+	if (ret) {
+		drm_err(&ptdev->base, "Retracting %s domain timeout, cmd(0x%x)",
+			get_domain_name(domain), pwr_cmd);
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * delegate_domain() - Delegate control of a domain to MCU
+ * @ptdev: Device.
+ * @domain: Domain to delegate the control
+ *
+ * Delegating L2 domain is prohibited.
+ *
+ * Return:
+ * *       0 on success or delegated already.
+ * *       -EPERM if domain is L2.
+ * *       A negative error code otherwise.
+ */
+static int delegate_domain(struct panthor_device *ptdev, u32 domain)
+{
+	const u32 pwr_cmd = PWR_COMMAND_DEF(PWR_COMMAND_DELEGATE, domain, 0);
+	const u32 pwr_status_reg = panthor_pwr_read_status(ptdev);
+	const u32 pwrtrans_reg = get_domain_pwrtrans_reg(domain);
+	const u32 allow_mask = PWR_STATUS_DOMAIN_ALLOWED(domain);
+	const u32 delegated_mask = PWR_STATUS_DOMAIN_DELEGATED(domain);
+	u64 val;
+	int ret;
+
+	if (WARN_ON_ONCE(domain == PWR_COMMAND_DOMAIN_L2))
+		return -EINVAL;
+
+	if (pwr_status_reg & delegated_mask) {
+		drm_dbg(&ptdev->base, "%s domain already delegated",
+			get_domain_name(domain));
+		return 0;
+	}
+
+	/* Check if the command is allowed before delegating. */
+	if (unlikely(!(pwr_status_reg & allow_mask))) {
+		drm_warn(&ptdev->base, "Delegating %s domain not allowed",
+			 get_domain_name(domain));
+		return -EPERM;
+	}
+
+	if (unlikely(gpu_read64(ptdev, pwrtrans_reg))) {
+		drm_warn(&ptdev->base, "%s domain power in transition",
+			 get_domain_name(domain));
+		return -EPERM;
+	}
+
+	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
+
+	/*
+	 * On successful delegation
+	 * allow-flag will be cleared with delegated-flag being set.
+	 */
+	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
+				      ((delegated_mask | allow_mask) & val) == delegated_mask,
+				      10, PWR_TRANSITION_TIMEOUT_US);
+	if (ret) {
+		drm_err(&ptdev->base, "Delegating %s domain timeout, cmd(0x%x)",
+			get_domain_name(domain), pwr_cmd);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int panthor_pwr_delegate_domains(struct panthor_device *ptdev)
+{
+	int ret;
+
+	if (!ptdev->pwr)
+		return 0;
+
+	ret = delegate_domain(ptdev, PWR_COMMAND_DOMAIN_SHADER);
+	if (ret)
+		return ret;
+
+	ret = delegate_domain(ptdev, PWR_COMMAND_DOMAIN_TILER);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 void panthor_pwr_unplug(struct panthor_device *ptdev)
 {
 	unsigned long flags;
@@ -110,12 +414,94 @@ int panthor_pwr_reset_soft(struct panthor_device *ptdev)
 
 int panthor_pwr_l2_power_off(struct panthor_device *ptdev)
 {
-	return 0;
+	const u32 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
+	const u32 l2_pwrtrans_reg = get_domain_pwrtrans_reg(PWR_COMMAND_DOMAIN_L2);
+	unsigned long child_domain_mask = {
+		BIT(PWR_COMMAND_DOMAIN_SHADER) |
+		BIT(PWR_COMMAND_DOMAIN_TILER)
+	};
+	u32 pwr_status, child_domain;
+	int ret = 0;
+
+	if (unlikely(!ptdev->pwr))
+		return -ENODEV;
+
+	pwr_status = panthor_pwr_read_status(ptdev);
+
+	/* Abort if L2 power off constraints are not satisfied */
+	if (!(pwr_status & l2_allow_mask)) {
+		drm_warn(&ptdev->base, "Power off L2 domain not allowed");
+		return 0;
+	}
+
+	if (gpu_read64(ptdev, l2_pwrtrans_reg)) {
+		drm_warn(&ptdev->base, "L2 Power in transition");
+		return 0;
+	}
+
+	/* It is expected that when halting the MCU, it would power down its
+	 * delegated domains. However, an unresponsive or hung MCU may not do
+	 * so, which is why we need to check and retract the domains back into
+	 * host control to be powered down before powering down the L2.
+	 */
+	for_each_set_bit(child_domain, &child_domain_mask, PWR_DOMAIN_MAX_BITS) {
+		u64 domain_ready = gpu_read64(ptdev, get_domain_ready_reg(child_domain));
+
+		if (domain_ready && (pwr_status & PWR_STATUS_DOMAIN_DELEGATED(child_domain))) {
+			drm_warn(&ptdev->base,
+				 "L2 power off: Delegated %s domain not powered down by MCU",
+				 get_domain_name(child_domain));
+			ret = retract_domain(ptdev, child_domain);
+			if (ret) {
+				drm_err(&ptdev->base, "Failed to retract %s domain",
+					get_domain_name(child_domain));
+				panthor_pwr_info_show(ptdev);
+				return ret;
+			}
+		}
+
+		ret = panthor_pwr_domain_power_off(ptdev, child_domain, domain_ready,
+						   PWR_TRANSITION_TIMEOUT_US);
+		if (ret)
+			return ret;
+	}
+
+	return panthor_pwr_domain_power_off(ptdev, PWR_COMMAND_DOMAIN_L2,
+					    ptdev->gpu_info.l2_present,
+					    PWR_TRANSITION_TIMEOUT_US);
 }
 
 int panthor_pwr_l2_power_on(struct panthor_device *ptdev)
 {
-	return 0;
+	const u32 pwr_status = panthor_pwr_read_status(ptdev);
+	const u32 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
+	const u32 l2_pwrtrans_reg = get_domain_pwrtrans_reg(PWR_COMMAND_DOMAIN_L2);
+	int ret;
+
+	if (!ptdev->pwr)
+		return 0;
+
+	if ((pwr_status & l2_allow_mask) == 0) {
+		drm_warn(&ptdev->base, "Power on L2 domain not allowed");
+		return -EPERM;
+	}
+
+	if (gpu_read64(ptdev, l2_pwrtrans_reg)) {
+		drm_warn(&ptdev->base, "L2 Power is in transition");
+		return -EINVAL;
+	}
+
+	ret = panthor_pwr_domain_power_on(ptdev, PWR_COMMAND_DOMAIN_L2,
+					  ptdev->gpu_info.l2_present,
+					  PWR_TRANSITION_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	/* Delegate control of the shader and tiler power domains to the MCU as
+	 * it can better manage which shader/tiler cores need to be powered up
+	 * or can be powered down based on currently running jobs.
+	 */
+	return panthor_pwr_delegate_domains(ptdev);
 }
 
 void panthor_pwr_suspend(struct panthor_device *ptdev)
-- 
2.49.0

