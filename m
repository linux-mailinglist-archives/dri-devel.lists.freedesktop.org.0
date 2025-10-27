Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2626C0F333
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FD810E4EC;
	Mon, 27 Oct 2025 16:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="JD56mDJX";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JD56mDJX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011046.outbound.protection.outlook.com
 [40.107.130.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B3910E4E5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:14:26 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BI6zni8criVubK1r5hvT+mLLMio7qGgQd5mCxzNk/7gE0NuGXWdkjU85wk+CcQxrRn3RSoawpBiVFKriZ6NQr5BpB8WgXOpuxfzM9jjaCKi6DIXWxICTCWaCRgCJE5cvOfXw+DiPzqpqTajfEj8znbKKqvAs8ytjS7rH5zFx+eM0c7MZGI9t/gd0M9Zsd0ED76JMVu1SYmH034KfH3suNleIHHTZXnz7r1VZjetG/Uxzuf8cgdu5hEGGU+TNCGYyPXg5/PECwU5UEKVL2fS3IfX3MZEb5DayGN5uj+mpn1FJ+oG1xVzFsdoyjLb24I+j7yr8HfClq+SItiSytomrKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0eKVkUWXerV0tOkFuSJNfFVaOYVZ1fZHVlNL48LgrJI=;
 b=Ft5t53XKcVDy0HHOjR6cBodZfkm5OKnMzqK5HdlXE2xCGChW2nq5+eqKwwZHmNmC8SZ22tI4kfcZMoV5jLfOoUWXH60U6LtYnX35RF0JMl0TzIXgwkRg1GO5tN2Bl8jy1n9auiTJkPSyaSOMh/aWmq3WP/hmwTkCFMWtGd3dtjgLOPxp8k5SBonx4qZDD8JX5nZrtqmpTMSnlBBZfvvoGOmnmL8yfyDgUFY4cYzCc4AIESoqckoLgJOusqvPA2a+cOrXQ0SHVJx9G9UAj/Jv+KU7CJ38NFv+to0eoheJlrsktwBFxeV4riqeOn0/81PJ+79oxZF3BXVpk0ajKyt24g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eKVkUWXerV0tOkFuSJNfFVaOYVZ1fZHVlNL48LgrJI=;
 b=JD56mDJXQjbwhbJSiroU3CSQ1xe028X8O25R2pdPMisulbxpfdVMBKYSpEY88mp7wDwK7rBuCT00P8niOjdLnSqLnH9RA07Xji8VT96i9PaTdcLWZ5/ZL9raEDObUFM1HGLcL7IhllN668sCilx2Z7RUkupG6g4Uiyxp6rLDkX0=
Received: from DU7P251CA0028.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::12)
 by AS8PR08MB6327.eurprd08.prod.outlook.com (2603:10a6:20b:31a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 16:14:20 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::b0) by DU7P251CA0028.outlook.office365.com
 (2603:10a6:10:551::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.17 via Frontend Transport; Mon,
 27 Oct 2025 16:14:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 16:14:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2l3LMyhb5qvkWJaSVyOUU4O2YGgNVgIeNaMHZ81lPXykJAsvq9fbp/3NVF9tbRrGv12Mkbkt8DU7oGHdePr/bsWSSpLbXXIZ4tNlqZ6wszLTeHCbrZDIY7e2uQw8Wf6eZ1GKl24oyy7thTMqXUU1bEqatXDDuj5hIrLRcl/NMBj23ZCxNGsyIL/+cAl4UzHOqN0DV2hvTxsNC2iIWxC+7rWcd2jy5rwDcpz74urvlB5KfxNYfRvmNuozntNS0jhLE6jndy5d33t7YJeNfZfebXqcCa9F3u7UEmGX/a4j5zO5/yehZmNJcfqutstWjBPOB8LRXj0BvTf876EE8UnIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0eKVkUWXerV0tOkFuSJNfFVaOYVZ1fZHVlNL48LgrJI=;
 b=cgr96xI2yOCHVMOAWafVomkSxepRIN3fHlfDX5uwWN6neHqWgdFBDuZXfPUgL5ourpbhpzimgKkPbbLq1Rnmf62bo5k73vDVdF1uPFXywfSCohS+LZgJeMEe1zCHGAnUkNf5FVWPDza0N9I8swJ7ePeZrcB3hwwb4qMlD48OY1ZeHYbVm3W0sIS3Il5zhyhLdPAWDWYcLn/qa8V2GT52rKZuvCkm/LbBidy9yCQAvYOfWv4M9kFteZqkxAJLW2WCubOgzwtTFI3PeMYEHg2hksJSoG1fuKB/+I8g751+M8pN8Lp7Ynebxonzsg94fNRjHsPiH8cKo4swj+iKWFgrGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eKVkUWXerV0tOkFuSJNfFVaOYVZ1fZHVlNL48LgrJI=;
 b=JD56mDJXQjbwhbJSiroU3CSQ1xe028X8O25R2pdPMisulbxpfdVMBKYSpEY88mp7wDwK7rBuCT00P8niOjdLnSqLnH9RA07Xji8VT96i9PaTdcLWZ5/ZL9raEDObUFM1HGLcL7IhllN668sCilx2Z7RUkupG6g4Uiyxp6rLDkX0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GV1PR08MB8498.eurprd08.prod.outlook.com
 (2603:10a6:150:82::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 16:13:47 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:13:46 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/8] drm/panthor: Support GLB_REQ.STATE field for Mali-G1
 GPUs
Date: Mon, 27 Oct 2025 16:13:32 +0000
Message-ID: <20251027161334.854650-7-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251027161334.854650-1-karunika.choo@arm.com>
References: <20251027161334.854650-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::20) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GV1PR08MB8498:EE_|DU2PEPF00028D0C:EE_|AS8PR08MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 953e4c76-df8a-4fb6-a563-08de1573e220
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?HyKOL2DqQSxRWLjnKRI5sQpcAfMGy7RQXyAVWoY+A/kmyOVMUleYeIAdOwxC?=
 =?us-ascii?Q?T22OtESiFIqfZrXzDURhjJ+ZKpj2tWnNVjcB3lIexEmjRPxh3RLuf5s8yHXf?=
 =?us-ascii?Q?q5XRlWa/OBnzFSOrIn2SnBab1WozvEdeMRCyLFmQfT4QxDxgGcpSGheI58gT?=
 =?us-ascii?Q?nrxUhtXNEJYnM76ESnUKyhp716GAHZvkCdrR1E8xOqW/OM5EoXI6SlBcvb3W?=
 =?us-ascii?Q?kVqMeNmTWOzSaQIS+Fz5VIq/QrVt9PQfQP/G4IOrOO05ztq+tkg9u0UVz4dB?=
 =?us-ascii?Q?S632oUxKqo5wkYrBC7kaA7mwuj9IqxDB3c/EMakc+C4VMTlbUvHap3LqMfu6?=
 =?us-ascii?Q?RhPXlBVxQIFI2I/xjeW+qoH6xSVwYuM5pBoCgnXpkOXJfcxHi80Fl1KnNZhE?=
 =?us-ascii?Q?fG9qVyuIRK/4MebQSRRvqJy3t+CQcHPmgVHsaqUwXTCl76t5TXAixkHnomOR?=
 =?us-ascii?Q?QDjnHFzrQ3+0MMieEhzi9q2nfiPtPbwvtYIGl+1RyFozrxX5puGDwwWyShKx?=
 =?us-ascii?Q?DeCcWkX2p7S7vUGGvKFDxvXhpQZz2n0v5PuDtS/7IDKZJw1cTsSfDjqO+oiP?=
 =?us-ascii?Q?dG47O61bOGfoMiRNUsNk5ZQ+sF/lco/48I+7vyh6kt7G5a8YjYIcamjcUeGp?=
 =?us-ascii?Q?77TJUAjVSNrx6xq5L4byUz4X0XAzuPOqciZtjG9W46FLENqrm5sVidg7ECfl?=
 =?us-ascii?Q?b5nxvNaiRK5xCxdTK/AxbrKzDDe8z9YGyZzgzICEOHO59CJm+cVhh08UsLlW?=
 =?us-ascii?Q?8P0O4zePqoHkEf60UZCsKN0VuN3J4PSQv8PBIOJwLoAB5NbjCQlxQDYgWyHF?=
 =?us-ascii?Q?2DEnyGhu2TtNTC/vfRSV33EJ2eI12MrqrHSKG+O8t+RPCZQVvM9RacVDLZ1o?=
 =?us-ascii?Q?W5wqrqrkVTAEjXeB/HlojbzjiYzH2OjeKGlJSN7hSyI4TFORkHBZhx0+PXCN?=
 =?us-ascii?Q?OsFp1cI1zHnzufkuLB+QowXHZ82z4mrvFYSu1zM3Wjm2IyLG+K4475qDrXw+?=
 =?us-ascii?Q?PDt6rNEJH1MgELIA+GCnkiPSzuEYfFAL74qfIYbRvU4Ur1gM0FMFAcrYrT7q?=
 =?us-ascii?Q?Vd5rMQq12w9dkUwbcguFfFlFBCbynjVw1StknlWy94w2ymgVdKk51cCjZ2BZ?=
 =?us-ascii?Q?hme+JfkJz9UKl/uxApKQ0lRv0NOziYLAM5XjBzKSQWt7MCwMYHamfiSArZS+?=
 =?us-ascii?Q?5N5xrx2RFD8Hfv80uCBRWCnL4j/Y97/QG9TlTxCqoZuyCDspwsFjFNjsaSgT?=
 =?us-ascii?Q?8Yy3jphSBDsfRfwa8srtsdg/tV31cZ7ATTxYb4vux1QdNAj3ZHc+7XuAlv8p?=
 =?us-ascii?Q?9IQ+8DZ3h/g8Q3mVKwM+iwGChEL8NCeFaRKQHE7ZtY+W6aV+KinUmD0Co6qv?=
 =?us-ascii?Q?m+dlC9iS3geHSOTkt9iqY41E9y+URe2zrDTEqQQqip/rkdlXH5xbpv6wf6Fn?=
 =?us-ascii?Q?WMLO1E5/fmT1yiD8wK/Ktgxxz7H8KK7o?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8498
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 88bc59d6-9363-4914-875f-08de1573cead
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|35042699022|1800799024|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qze9E9m47Abnr6tOTrl5xT7K0lgR8WAIHcQHRcDzi8q+9ZvCnZMcZSa7iwU7?=
 =?us-ascii?Q?jkReTHTPYJZoEERRIByu9vUs1W9c/x6J3v7R3mABG39jzfRQey8ZqNws673m?=
 =?us-ascii?Q?XevdVxzideQeKZ7Pt/k3TE8ocC2y1Sr5nJZpwjfhF8kV2kJGm54EnlPlXn8R?=
 =?us-ascii?Q?X0hYsl5ukTVgGzKPJpYkdENNev5CJAd7vEfcdNZ2bVOapcDXlxSAWfxsQ24+?=
 =?us-ascii?Q?MeP2rsIJuHwGwWaUjEbnokQJIGsyMzZ5EJlm9JaNMOPT26GN0JOjaJ1QXjrf?=
 =?us-ascii?Q?qVvyK3tBTNYdyESmccf17AAfwsvwBxgtuTaDvu1UzdZ7ahyOA8ic8RByvmgr?=
 =?us-ascii?Q?k3ibr7/RVz/TgrHwJyy8MWTvbbzmk8c6I3xUwJRwgD4H4CWOTU7AaFzxmB6M?=
 =?us-ascii?Q?o2n74wQIesy+0zXF21f8oTFkCdvP3GWctSUFBd+jzVk7x5ndJ/vCBhpl9mRE?=
 =?us-ascii?Q?LvYyR7G09AAl7Eg8cPK8LKMgfXgmyHdkigyc4Qbh4cS2eE5je+kBNEcECKS5?=
 =?us-ascii?Q?qd7uKLtvqzhG/gPYjMdq5PKLNxZkm2IRx+gV/bPBYGSSXFcWADbjyz8tFmyg?=
 =?us-ascii?Q?WXlat21P50llZ7nAV4Lc8LjyC5lnySI0RSVprqw9npgdclTMEfbOTzeZKwWu?=
 =?us-ascii?Q?7ewbCvuaR1a9ybfWYOR/YqDGXaBAqYZd7P1LjznIFcDNdOhC3lZ2v7qx7LN9?=
 =?us-ascii?Q?HUhq7W3/oNMxHuScP0p5DFnmkzwhqHV3/LwKRtLCLTDA05RooP5djZ0DwTwQ?=
 =?us-ascii?Q?ScPXdwZpAoV1X/JcOv6x0Wfdl/Fa3aX2pKFUA4+IqM6Z/Vnszhvg8PObB+ZL?=
 =?us-ascii?Q?waSXM5xNBoUsXuwiFahwDMKhJj7D7EGEqwf2bY/gjDnVUKL6ucYWZY5FGTF1?=
 =?us-ascii?Q?l4tSv3qQr2YznkoFz3Dptx6WM5ImLINzaEh7VUe4CKy2/Xt4Flg3OrxcL+Gq?=
 =?us-ascii?Q?tGMDExlq1jhIosDH50l/V/LdpyEG835JgEdNdfe5ktHTeB1DgFtdhFxgIEsZ?=
 =?us-ascii?Q?s9THeYke3tJ5N16AL4Sm/oQChAtn63D1Susp+9DPOoYtQd0c3sFRj3+U4/M2?=
 =?us-ascii?Q?txde4qQvoOVL3DFxXw0uZ7pdQCXFxwpYGbX+O1shiXTvK5LxlcdBa51heWZP?=
 =?us-ascii?Q?7Lt/54Xp6gBREGvYH5J9MPJPh7QnATPfwMW9GrKFSlFIeFce35F+bSWcSK44?=
 =?us-ascii?Q?NCpbWQzs7VXTLS3KwY6sX56kQyCzKNFnQGa8osele6v+jleb4W+SZmaB8xfO?=
 =?us-ascii?Q?cjv9OU/ttRm1fxOJHCT8aeIo8tuNGNCLMYwOb6bInqaEjFJi39bM1o/I6/9y?=
 =?us-ascii?Q?Asd07QFcypW05aAHEJ3mNWMUtDnUBKwxUOmcQRebsiPfdl/0HMEqtM91OpVq?=
 =?us-ascii?Q?UWZ0ioTbz5sZXZDUdtRk3mGSSVtZO5wmqNQU6zQYDFS6Rd9Vb6hrhG5fJNZW?=
 =?us-ascii?Q?fe17C5lY1X1H4xkRJneCamcGXlYWTD+chdbSW/xNa2NIu6BfX7Dvejnts3nP?=
 =?us-ascii?Q?3eleKw59OtZtF4igFyuXpmmj/lkucPadYZFDAvioC6+dm3QHh8+c4Vs2KR3d?=
 =?us-ascii?Q?l9PSsiK5kq4yX8i9s3o=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(35042699022)(1800799024)(36860700013)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:14:19.1324 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 953e4c76-df8a-4fb6-a563-08de1573e220
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6327
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

Add support for the GLB_REQ.STATE field introduced in CSF v4.1+, which
replaces the HALT bit to provide finer control over the MCU state. This
change implements basic handling for transitioning the MCU between
ACTIVE and HALT states on Mali-G1 GPUs.

The update introduces new helpers to issue the state change requests,
poll for MCU halt completion, and restore the MCU to an active state
after halting.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v3:
 * Fixed missed CSF_IFACE_VERSION check with pathor_fw_has_glb_state().
v2:
 * Reduced MCU_HALT_TIMEOUT_US to 1 second.
 * Wrap the CSG_IFACE_VERSION checks for v4.1.0 with
   panthor_fw_has_glb_state().
 * Removed use of undefined panthor_fw_csf_version() MACRO.
---
 drivers/gpu/drm/panthor/panthor_fw.c | 89 +++++++++++++++++++++++-----
 drivers/gpu/drm/panthor/panthor_fw.h |  7 +++
 2 files changed, 80 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index e6c39c70d348..fb1f69ef76fb 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -33,6 +33,7 @@
 #define PROGRESS_TIMEOUT_SCALE_SHIFT		10
 #define IDLE_HYSTERESIS_US			800
 #define PWROFF_HYSTERESIS_US			10000
+#define MCU_HALT_TIMEOUT_US			(1ULL * USEC_PER_SEC)

 /**
  * struct panthor_fw_binary_hdr - Firmware binary header.
@@ -317,6 +318,13 @@ panthor_fw_get_cs_iface(struct panthor_device *ptdev, u32 csg_slot, u32 cs_slot)
 	return &ptdev->fw->iface.streams[csg_slot][cs_slot];
 }

+static bool panthor_fw_has_glb_state(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	return glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0);
+}
+
 /**
  * panthor_fw_conv_timeout() - Convert a timeout into a cycle-count
  * @ptdev: Device.
@@ -996,6 +1004,9 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
 					 GLB_IDLE_EN |
 					 GLB_IDLE;

+	if (panthor_fw_has_glb_state(ptdev))
+		glb_iface->input->ack_irq_mask |= GLB_STATE_MASK;
+
 	panthor_fw_update_reqs(glb_iface, req, GLB_IDLE_EN, GLB_IDLE_EN);
 	panthor_fw_toggle_reqs(glb_iface, req, ack,
 			       GLB_CFG_ALLOC_EN |
@@ -1069,6 +1080,54 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
 		drm_err(&ptdev->base, "Failed to stop MCU");
 }

+static bool panthor_fw_mcu_halted(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	bool halted;
+
+	halted = gpu_read(ptdev, MCU_STATUS) == MCU_STATUS_HALT;
+
+	if (panthor_fw_has_glb_state(ptdev))
+		halted &= (GLB_STATE_GET(glb_iface->output->ack) == GLB_STATE_HALT);
+
+	return halted;
+}
+
+static void panthor_fw_halt_mcu(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	if (panthor_fw_has_glb_state(ptdev))
+		panthor_fw_update_reqs(glb_iface, req, GLB_STATE(GLB_STATE_HALT), GLB_STATE_MASK);
+	else
+		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
+
+	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+}
+
+static bool panthor_fw_wait_mcu_halted(struct panthor_device *ptdev)
+{
+	bool halted = false;
+
+	if (read_poll_timeout_atomic(panthor_fw_mcu_halted, halted, halted, 10,
+				     MCU_HALT_TIMEOUT_US, 0, ptdev)) {
+		drm_warn(&ptdev->base, "Timed out waiting for MCU to halt");
+		return false;
+	}
+
+	return true;
+}
+
+static void panthor_fw_mcu_set_active(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	if (panthor_fw_has_glb_state(ptdev))
+		panthor_fw_update_reqs(glb_iface, req, GLB_STATE(GLB_STATE_ACTIVE), GLB_STATE_MASK);
+	else
+		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
+}
+
 /**
  * panthor_fw_pre_reset() - Call before a reset.
  * @ptdev: Device.
@@ -1085,19 +1144,13 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 	ptdev->reset.fast = false;

 	if (!on_hang) {
-		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
-		u32 status;
-
-		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
-		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
-		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
-					   status == MCU_STATUS_HALT, 10,
-					   100000)) {
-			ptdev->reset.fast = true;
-		} else {
+		panthor_fw_halt_mcu(ptdev);
+		if (!panthor_fw_wait_mcu_halted(ptdev))
 			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
-		}
+		else
+			ptdev->reset.fast = true;
 	}
+	panthor_fw_stop(ptdev);

 	panthor_job_irq_suspend(&ptdev->fw->irq);
 }
@@ -1125,14 +1178,14 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
 		 */
 		panthor_reload_fw_sections(ptdev, true);
 	} else {
-		/* The FW detects 0 -> 1 transitions. Make sure we reset
-		 * the HALT bit before the FW is rebooted.
+		/*
+		 * If the FW was previously successfully halted in the pre-reset
+		 * operation, we need to transition it to active again before
+		 * the FW is rebooted.
 		 * This is not needed on a slow reset because FW sections are
 		 * re-initialized.
 		 */
-		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
-
-		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
+		panthor_fw_mcu_set_active(ptdev);
 	}

 	ret = panthor_fw_start(ptdev);
@@ -1170,6 +1223,10 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 		if (ptdev->fw->irq.irq)
 			panthor_job_irq_suspend(&ptdev->fw->irq);

+		panthor_fw_halt_mcu(ptdev);
+		if (!panthor_fw_wait_mcu_halted(ptdev))
+			drm_warn(&ptdev->base, "Failed to halt MCU on unplug");
+
 		panthor_fw_stop(ptdev);
 	}

diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index 6598d96c6d2a..a19ed48b2d0b 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -214,6 +214,13 @@ struct panthor_fw_global_input_iface {
 #define GLB_FWCFG_UPDATE			BIT(9)
 #define GLB_IDLE_EN				BIT(10)
 #define GLB_SLEEP				BIT(12)
+#define GLB_STATE_MASK				GENMASK(14, 12)
+#define   GLB_STATE_ACTIVE			0
+#define   GLB_STATE_HALT			1
+#define   GLB_STATE_SLEEP			2
+#define   GLB_STATE_SUSPEND			3
+#define   GLB_STATE(x)				(((x) << 12) & GLB_STATE_MASK)
+#define   GLB_STATE_GET(x)			(((x) & GLB_STATE_MASK) >> 12)
 #define GLB_INACTIVE_COMPUTE			BIT(20)
 #define GLB_INACTIVE_FRAGMENT			BIT(21)
 #define GLB_INACTIVE_TILER			BIT(22)
--
2.49.0

