Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6AFA86164
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 17:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125B210EBF3;
	Fri, 11 Apr 2025 15:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="d2xd8k6b";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="d2xd8k6b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013067.outbound.protection.outlook.com
 [40.107.162.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22F810EBF3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:12:06 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=k44zLdKkTEjNrXwefULezQkXq00ob/otsfd4iG7kigyC/VeWrb1mbee0gDzIpa6IT+dPjymgUrd/PRzC95+Ec731rfauCmDDOYquFoyjLWn4zliTJUDs2bdA+PH0iaZ2fm4+NcsDmjxjxrfBS5pDmUqlIsYtghDdw7temnf/Qrt+jLipAmdUDWf2buVs8QcLzPX2l21EQUPkz/khbNXiWVyckU51r0GNTooOojK7DkgZ7WsHXv4Tl5xlizw1v5edvmZ7mnna9FI8VdXxeXzJ6cbaUMUQaEY3q6ubsCPWNO/921c2fpLm6lZBkkdBmcrxBkzWsjj8JubV1l7P9l0GSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fvkpd8ALZICGwIjuum5K9JyduarnEKpnP5I9c9O0Z6Q=;
 b=tekzNt2Bzt1V6kCfKInaO2uEoAW75/DkK25oHUjuyNwUWsGF5GPZaTdbzv+DSEmFap3d/jJLjPFdFyzAkJfly0/UT5tPPKay3MgAfho6h0jFDiScYre3HW0f12rsDZcXXRQeRwV5U1TwIXrBlWCtYSr9NcQT/DsyaFoLklAen2/Gs2le8AFc8Rgk9Ggzxi9v7waNE4l071wRT4fVa7CZG5yr2rQ3liv0+KuJI/NIzmTPxeQml5yR7/0NlbBN+Xq1fEHIUFfF1wwMfukbhd0t7Z4r+djTJZpPRQFwC2/ehiS1z+mWlSF9MkCcnTJDXS7wUViaDRKCk7myHg6Z/gQf6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fvkpd8ALZICGwIjuum5K9JyduarnEKpnP5I9c9O0Z6Q=;
 b=d2xd8k6bOhq8lO6+/YG6sUrDf2i1+YLYjXJTCfRkcZUzxB4Z+kkref55+dRIUYBmHLCQS8RrOTeoqqxPuQQQz5tEAUbTqp2jj4KglzaBPvzb80vetkdy7SafeQersk8JX9vajrAzk4GQTcyYeEjHL5Uif4xSvAjL+Irt8lnQR9A=
Received: from DUZPR01CA0330.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::26) by PAVPR08MB8846.eurprd08.prod.outlook.com
 (2603:10a6:102:2fe::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Fri, 11 Apr
 2025 15:12:04 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::35) by DUZPR01CA0330.outlook.office365.com
 (2603:10a6:10:4ba::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 15:12:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Fri, 11 Apr 2025 15:12:04 +0000
Received: ("Tessian outbound 15d661e369c7:v605");
 Fri, 11 Apr 2025 15:12:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d84af3ec1d4e0a1
X-TessianGatewayMetadata: sEexWM8Oc1InvJbQhkcTH63/wKPoYRH5wmRxMS1Y7aNo+5gy+Jb7FrTa9rPo5qRJcZmPc0DwFhQkk4fp0jZVbgTyPGlqp7LCqZel7Gy14M7PPueQyRlfM8MpcXCngbJNDLUKGNYddsYeRn+UzZ5caN0sdrD/LI84TwL4/gEwxHY=
X-CR-MTA-TID: 64aa7808
Received: from Lb428356dc278.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 62092D30-83D4-452F-9D51-17FFF333EE24.1; 
 Fri, 11 Apr 2025 15:11:57 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb428356dc278.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Apr 2025 15:11:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btCSUPhwwnh/kqIEjcrmwL2yywJl1RwSMJ4oFxBBwW1uQNiAR5adSQLu2vPa4wmPftFxM8Bfwqi9jeu9cIWDFX1aIB/ceqV33BHwbctkvsX5DD4IeNSGikcpuvYyiH4pyZHE0D6XN6oqRmKy/SzqbAXBvdeB3TaQzG7l4KqAKrPkdUKIZ696B1MST8HowhbtKW5VUGgA6W5yVi/vj91KI7rbQ/fcNWXaH2nHZnYBaEsJwftYhFF4D1j+lsVPHI6QvxghxKgIuTdeyIDqvCxO4gY1oDkE2zYJ9a+RhocNyX2FTMm02M3rfDLy0v6fWgVqqiQQ8eR/sShuedmFt434mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fvkpd8ALZICGwIjuum5K9JyduarnEKpnP5I9c9O0Z6Q=;
 b=xgcP+VaQWMFe8OdaY5DeMCngg2cJ00pjiGYTonjTLpqcaRiLMfg0tw5+scCOqEUKhJfmOOXX5m2Ptn7uqD+8WLdI64+skDBHgLvxvrqQ41BwOk71o2wDUjNVNWJ69NNbRSMBo+ir12xS+oz1r94FYLSZ8uVwvzcSAmDlxNBwyNNg8NiHdPPLIhEaHiB5Ux6ThAttneMuYYbP1L4KrBjU8jqHBuroJ3hEIeFrgaoc0/jDjgrIpqZSAxm8yVrc7Eu1mGmOc8ikFJVYzWvBMyYOJGkkHJ47T4fYRxpmrGlFez9BzJUIjNH92k6mmojUjh1aqSDx+/jvq4Sa94ghX5lG0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fvkpd8ALZICGwIjuum5K9JyduarnEKpnP5I9c9O0Z6Q=;
 b=d2xd8k6bOhq8lO6+/YG6sUrDf2i1+YLYjXJTCfRkcZUzxB4Z+kkref55+dRIUYBmHLCQS8RrOTeoqqxPuQQQz5tEAUbTqp2jj4KglzaBPvzb80vetkdy7SafeQersk8JX9vajrAzk4GQTcyYeEjHL5Uif4xSvAjL+Irt8lnQR9A=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GV1PR08MB7940.eurprd08.prod.outlook.com
 (2603:10a6:150:9f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Fri, 11 Apr
 2025 15:11:54 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 15:11:54 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/panthor: Add 64-bit register accessors
Date: Fri, 11 Apr 2025 16:11:38 +0100
Message-ID: <20250411151140.1815435-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0034.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::16) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GV1PR08MB7940:EE_|DB1PEPF00050A00:EE_|PAVPR08MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: 21bbb686-5a4b-4116-064b-08dd790b37a9
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?6D2UNq/bypkWx76wF10ZZRZKAmeqa6jz6cIz6IpftlWPcXsbdnGxFG8GVFNr?=
 =?us-ascii?Q?UEx1f90vqSBDdV7i6kDmRsN8m59MlBvwRJfMkerYfko/ugqPnD3wwQ+uEEXs?=
 =?us-ascii?Q?ePxU40e2dbvfkDykn/G1408vBCYczQGLriib/QWxCoPk4hh0SRKrnS5HW+bq?=
 =?us-ascii?Q?wcytXqWkkyC6vZ9+bjmeOw2w9yVoNzBV6pAE/g3PrnkA03GI11xm5SfkV5Kx?=
 =?us-ascii?Q?acT5MomSPFZYCRI6bGXsH0oiQvmVh3L4/+PHhoVwO4YkCGx+o8Tou1JSkt+Q?=
 =?us-ascii?Q?DWO1Zoed1gYrfyvXkJKrrRrprx0+oQwrEKHRuyWK5vLSFyqeJ3yKx/brR2FX?=
 =?us-ascii?Q?O0M/KeSS/heEypqXeHuKih0T2DXo3z8F6sYTRFKK7Wy5cqrQNHzUwmkztgR0?=
 =?us-ascii?Q?XUe4ZD3ACYKT7/gg6lYbA9UW86dx4lZJ1u3Be9UhfBsX1nseQS8q3M5Q96FS?=
 =?us-ascii?Q?2us1auZPEMlaZlbh3yI9fuEPeP9Q90R/SE2+DZhcOLMJDhShWU2JmUJLNO3T?=
 =?us-ascii?Q?Piscud0ZkVkLULKSLD5Z/EUt97YJcQtki0gTocOWdmOSWbx8kiA/sw36Ww4k?=
 =?us-ascii?Q?JO0buxzFkuDgSqBxxPmjsRYwoIkrJlP2my0ev5UxuH1GmEmSUCKE1dznW7zB?=
 =?us-ascii?Q?unsIBxKwr8HQ+C8TS/gSwFdSK819PwA4pZlgriuExsoTxfJz/bSoDhjhxYus?=
 =?us-ascii?Q?EQE/KU4M6qGq3hl0JzCvH+Fl4ft6W+ReX2/w0gnwWsEMbm/HKuVXDn0dwGzG?=
 =?us-ascii?Q?vRxExK3vZcodTtVuSUF83asVSYp3bC0c9dlvd0xDM6MvyvL3VhllIHPJAc9V?=
 =?us-ascii?Q?GZQMbr1cNo1XJKKN6jynOT48EdFOk9+ZscFZJw+ETLCLFF7Cqj2LnB+7QPes?=
 =?us-ascii?Q?vUmDW2v9BvOQvqcCjRgKIcxZ9/+0QRsLnqdg9T/uppcm1ZlszYIuq00Uv1/f?=
 =?us-ascii?Q?Ao5OIr5UVdYBBuAIAAfFGZHzKn5SNMXERf7CONyvX+IFzHy/7zrfbgYMnZXJ?=
 =?us-ascii?Q?lwDoTK3g+ndypSx3DqpjqB9JgNYCYJcWvesDhpo8JGxA4R1q8e52Icy2LTiK?=
 =?us-ascii?Q?lS9S5plLks6GwikSWT76MF77DTGVyXqXlYOMSshUqgj6U2/ivhxiLe95nv4F?=
 =?us-ascii?Q?M6ieddqdJGLxI1VhkNo8v4KtcS+CQlZ/JJIQ5xKheKD0mwXXmThXWznZ5Od5?=
 =?us-ascii?Q?WcuWv0j0wQqdAGttm4dNBGnJJCqj2/OpcpIa5nMX5KuFkUKCv8ScKkoTsA3v?=
 =?us-ascii?Q?QgAIMVlLjAScTrJxVVBCiGeFjgsiEG0IRlJ4zrHrJkbP7wEnS9AnCohO1wAE?=
 =?us-ascii?Q?OBcySGSy9sx/0FwOr1aSaGLnC3Q6kNDeFRK6uz6SNEDRcdySdXOvnEXS97NN?=
 =?us-ascii?Q?LIfIKdBlQGQBGNNNwXUEq9H8FXOITPkdhAcfPpLKZDmDRnl0h8js9p2DWnIT?=
 =?us-ascii?Q?gx49+Z9YDCk=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7940
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 13e81564-e369-4edc-a212-08dd790b318a
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|36860700013|82310400026|376014|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6q4QZre/w3EISSq6iS9UCgLSc76XeePzB14Ofb3rUWajX0iy4j8A0EZi2o8i?=
 =?us-ascii?Q?kBCf5DirfMSo+gvdVwGyFgsxs1SMyApM6fywIDahjM88BBFFaGrb99W5HQ53?=
 =?us-ascii?Q?JD45Z6O8QVbg9L3b/MtXBSzEMtq66ufy42ZVxnAyLpBVsOmk/bmNugJEb7WK?=
 =?us-ascii?Q?KKdEbfB4lizP1BWtr10ZXfH4FxZHhO2RpjMZe/TRjYV8sLDwJ5ZCKudMNvDa?=
 =?us-ascii?Q?PkiKaCH6mULkyG03aIV6oKC5XYZC+NKqO+yxEOUq0k3hPuN/xbT/m22L+PSi?=
 =?us-ascii?Q?KN2quWoFsak5fUO3gC2gRX/PXX1YbkVxIZhYORyD0rNly4xT80AnjA8Al4KS?=
 =?us-ascii?Q?IlS3aNtWs/ml/a3f4/ZxjM9OwUlUcKxPhk3ioBdMOfAvcx1ci4VY4T0geY8T?=
 =?us-ascii?Q?jr7TCztyNTpO/SLB3Oe0d6ICrzvRqc1KL1aTzrxv/8WjETVm49ggqhNfGCTV?=
 =?us-ascii?Q?a9SUDajq5NV1uqs+Z8WxLGAUUMhnMPJ3RcJ1K89MeXidNufiYBsOWtbjiyky?=
 =?us-ascii?Q?aGROGcwEOq3zY2/nZJ/DkUF8LzKF8AHDgHAsSArWT3XfPjhPlb8aMe1p5x5l?=
 =?us-ascii?Q?NRlo5LnK56XMF8V313F6WaWev9OymTFajLmTF4fZ98jIgB2qmvGeWqRl4Ec7?=
 =?us-ascii?Q?UbU9Whc77NsAJusRoXSuDxC3lBWbxv7ROXRDvQYQx6856mWTF8eGtWxSZwpl?=
 =?us-ascii?Q?FetbCsoW+3ke7gaYCJ4+ZVVM+WVu+mneT/Pil4ElMsWqYTCCUK7u9EYTjJzS?=
 =?us-ascii?Q?7eQhTFfwWaZDswpsfpXtQVYb2SYiUtEMHLZVVCy7jJInhNaW3PDIuhyuey+8?=
 =?us-ascii?Q?Esn50KApIOtD61aqKqw+8RTLJ3oJuIi9TXzV+CjZXrKWJ43tNX42+wLPqvmk?=
 =?us-ascii?Q?HuEx3jE9zG7nQ59nsfKPF1idCseDm2sJqp1GLTfJtxYGTsXXZIiXm6pL5/MR?=
 =?us-ascii?Q?4IGu/HSWUmHX4kgrxuEKEfmDaDXfBQFBG43gIHu2izUicefls9bJ9ZwZ4le4?=
 =?us-ascii?Q?RUKv05NQd8sgmFWsxlOSsnIcdl7c3ekyAecFPUGD0P55OEMWGNBstKpX4o2U?=
 =?us-ascii?Q?II/7ggn1DeuY9flbFyP4hY4kUxQpe4OO5GZ90TpMfMNTw2jWAUuo2LH+FAY8?=
 =?us-ascii?Q?E2x5MxN9TVoLAe+IMfq+/nqfnppNfj+4XM/lRwkuEt24boPuvEx20sFlAj1H?=
 =?us-ascii?Q?LTbmk02g2dvXIGgFlAvZUo/+l2wpytEKIEvli0gTBbHMdKxznNr1IQx8+jnj?=
 =?us-ascii?Q?E3y+khuaprBb4SLNmfhEg7qidaBcAlCW14vMJV+n4etb3+N48bv2vVRfTLsu?=
 =?us-ascii?Q?NHshZ7Jfmi2eLVCKYawoluoIrkjDDqU/ljtUWTFitcPl+zyN+IQck1YYvkUh?=
 =?us-ascii?Q?LlaF6fRjl2kgAop6DnFHOxHDN6d3ztmk/GFtn7Wv3HxlZ+ArIGZWaWDQqRb2?=
 =?us-ascii?Q?2VY9td3VIwyYr4BvymwacNhIP6ICBv8e3zsRmqaRhRBkv2DK2u6wq3/1oPUf?=
 =?us-ascii?Q?vL3VZYBLTw9fxC5M66pcg2letGqK66zY6bz3?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(14060799003)(36860700013)(82310400026)(376014)(35042699022)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 15:12:04.1591 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21bbb686-5a4b-4116-064b-08dd790b37a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8846
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

Hi all,

This patch series adds support for 64-bit and poll register accessors in
the Panthor DRM driver and performs a cleanup of the 64-bit register
definitions.

The first patch introduces new accessor functions to simplify and
standardize 64-bit and polling register operations. The second patch
refactors the existing 64-bit register definitions for improved clarity
and consistency.

v2:
- Updated padding of the poll functions as requested
- Removed *_HI register definitions and renamed *_LO registers
- Link to v1: https://lore.kernel.org/dri-devel/20250410163546.919749-1-karunika.choo@arm.com/

Kind regards,
Karunika Choo

Karunika Choo (2):
  drm/panthor: Add 64-bit and poll register accessors
  drm/panthor: Clean up 64-bit register definitions

 drivers/gpu/drm/panthor/panthor_device.h |  71 ++++++++++++
 drivers/gpu/drm/panthor/panthor_fw.c     |   9 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    | 142 ++++++-----------------
 drivers/gpu/drm/panthor/panthor_gpu.h    |  10 +-
 drivers/gpu/drm/panthor/panthor_mmu.c    |  34 ++----
 drivers/gpu/drm/panthor/panthor_regs.h   | 100 ++++++----------
 6 files changed, 162 insertions(+), 204 deletions(-)

-- 
2.47.1

