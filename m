Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA13CBEF627
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 08:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD7410E042;
	Mon, 20 Oct 2025 06:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="hUmOZiUZ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hUmOZiUZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013002.outbound.protection.outlook.com [40.107.159.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404F810E042
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 06:01:10 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CMDYvYS/s8AX1DGMnU7x7+xk+6p0gzEg56+hrOKrDEgg25suiNqDY+Ou/As29OQDezzLO9L5sMjFxc3nsjrdf2o9d+nX9NjWPxC/S8+TD8cVAGg/zAYG/CIjCw7ajMJUsetUaoOlT+uOt68aRiHJ6yfvnQoTHBM0gZaJcSRHGti6d3tcYSY3qLSLU1kw9kBrRLNhSRrQRXp7hacqWwQgf0lK3bUohhXLC/Vn/iUGMDsRx4tncGdO0VhOx48+OP6jTDYEx1h1cTbKkBbzx+NapU4lNdP6VVMTkMuRtjKdsBKUHJ7NBiG9kdNzqKkAate373+NyQ5KbUmXy2LnNob8sQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jn+XmCRJLt9tlCU0IdiZJhBKWSGEOD3QHM4hynLYN2w=;
 b=O7vejjbivptzAePtgPOb6rLHUC84leGWEZhhBQaj7RBIiwYiT3hzAfEN3vfBTFN39ycxolBbJdAoUWAmtjWe1+uYtoo2Xa5zmjCS88qyVDOG3zFv1i74nBz3zzzKfHaXulbH52Rc6xNtlmY0IOQJBGB9pBGQd7MM5eCOqSmR7zZQlDyA4lN+zwu6eo0AOUNFY+WRPqheUkqJPB2N66Z4ciEevG3zO6mrDALn0SrA8g2rFlT2y4NX3zofB+IGdUFR/kXwrLL8SJTYJajO5zTX/lY3/jVyEnTYsl2a3bNNDuxJx5Q2fUHLWLz7GaB3dRzGJz7vMHotPU/oRbkzz9Lucw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn+XmCRJLt9tlCU0IdiZJhBKWSGEOD3QHM4hynLYN2w=;
 b=hUmOZiUZcTFSyeWt3IJM9KjbsFHMJLS1eQR8qx3mWspjtDZArfrq2vSXn6nvcx3pTuAyNd7nSIkEokl2Jt7scnioVX3YSAV9LLyL+Crfo4k+N6Toq2ZnIAXpaaE0XCv7uktTX9f3PzgnEMqfupD5f2eJZFtgJV2VxnHDGYmsNU0=
Received: from DB9PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:10:1da::31)
 by DB8PR08MB5354.eurprd08.prod.outlook.com (2603:10a6:10:114::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 06:01:06 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::8) by DB9PR05CA0026.outlook.office365.com
 (2603:10a6:10:1da::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.15 via Frontend Transport; Mon,
 20 Oct 2025 06:01:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7 via
 Frontend Transport; Mon, 20 Oct 2025 06:01:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jya+LkEMMuMmh/pkPyHxuPhOE6e0+egHdFlS7jyaUwWZN/Z53hjzywCIS2AcRg+nb9vY42fTr/UoHw1E+9i4b5XnEz4qli7DGC7zDiS9iPUaK+BTK+f1+D+8sloUmnKYAZC2gZM8lXsgyAVsdtu8DFdDIg1AsLjC26fgZJ2tj6ZyIJNpu0BPS8q7WXPYR2G9rLAx7aH62cGHttVf6ZGksZtuEEL3cSzkjxEAYBZATfjpHYgx4sCzOZQw/pwWtAhi9RN3VIFJu4M/CGvJ0qNLJBJB5eOFyjCw/cLZOrau5WLyDYyzAYq1HZGm0oIEwLE4Ot2U41PwJehZpO3Mh0HkSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jn+XmCRJLt9tlCU0IdiZJhBKWSGEOD3QHM4hynLYN2w=;
 b=d2lXcXF7/DOMXKQjzWdqHmQzwjI4kq9cXscClpZHN86y5CjRR87CSYf63u3vLBop3lqosTrcoqYMhXTDiDtruF3p+ZXNX9IjANY7kADiqvg8rx5myGmNERApF2woG3EvST+ulYSpnAlBT00izQlt47Cmg9891dHplBgIcTF1mQFLFOMieJ7uiP10pNz1nvehVsAcZXNxzYmnJe7Lm6Uie6JX5HLbydbnS/uBOyr3V4uhjLMa6wVPlk0nTRc6Qv/gTlxFRetGxit2z7J1RaCkyUEDiZxUQLB/KNPfA0EsSxYSq+85Q58JEfZqVQSrCcDWt2eLaYZKmXZ+YiMSXf4jDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn+XmCRJLt9tlCU0IdiZJhBKWSGEOD3QHM4hynLYN2w=;
 b=hUmOZiUZcTFSyeWt3IJM9KjbsFHMJLS1eQR8qx3mWspjtDZArfrq2vSXn6nvcx3pTuAyNd7nSIkEokl2Jt7scnioVX3YSAV9LLyL+Crfo4k+N6Toq2ZnIAXpaaE0XCv7uktTX9f3PzgnEMqfupD5f2eJZFtgJV2VxnHDGYmsNU0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by PAVPR08MB9212.eurprd08.prod.outlook.com (2603:10a6:102:307::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.14; Mon, 20 Oct
 2025 06:00:31 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 06:00:31 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH v2] drm/panthor: Fix kernel panic on partial unmap of a GPU VA
 region
Date: Mon, 20 Oct 2025 07:00:28 +0100
Message-Id: <20251020060028.1262648-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0432.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::23) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|PAVPR08MB9212:EE_|DU6PEPF00009524:EE_|DB8PR08MB5354:EE_
X-MS-Office365-Filtering-Correlation-Id: aa085df5-0c3b-45b6-4973-08de0f9e0dfa
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?wcg1Z4AuyNQjx2v+yVR7rbxXxeE9oRRdOdR0v4znNIve78BrXJml0oQNFtJs?=
 =?us-ascii?Q?JIBqQNT408Jw0wDdw7vmCr7v7IBz0aGqOf5nbO/sxR4d6mvh6JyxPf//11Rp?=
 =?us-ascii?Q?3pXIoZU2xHILj0bM+O7RQrMJcMoW6nPsQY5HgNjvER9L1PfqRkjwVfH5FDex?=
 =?us-ascii?Q?ylSr0R+0EevXjZIFgg5Y3nku0ZVDhSuGPl3ztjMl/QJWfe3JljB54B0a/Ett?=
 =?us-ascii?Q?LdV3xRBsVjUr0GdggHqQ1m+7clIRSmfrV0Gn+UZ3/038Stky4uFaXOzsanpT?=
 =?us-ascii?Q?b4sUOLOrz8covLnZ1+PpvjdOimphqPOYuYa7kbccHcYv0JcN96SlSu2utrP9?=
 =?us-ascii?Q?k2tDKIWAI+4515OUW+aiU23IemV/AAPBL1DIIjpjBdAVRXI637g0RFkKh+9f?=
 =?us-ascii?Q?1s77BKOCm8mwlYjYmd5+HQWTVIoGIHKp/qnGBp7tz4CJ21M0LMjRziIRO2ZW?=
 =?us-ascii?Q?hlH7Y0tv9rgUR9VWnsKw65xJc+sCRRgOCz+JqGXal2+3AVwLPCSYw2+IAsdp?=
 =?us-ascii?Q?AmMPIoFWtp8M48RMOnO8VqmMp5P06K8gnbLfytE1LfK+NdplgrnaBTybhn6d?=
 =?us-ascii?Q?aKGouLf0Yn5mxFWCUjdUWVq/O30okZ4kXfzQcR5oknRndCL/2lJHC68SluXj?=
 =?us-ascii?Q?C9NJm8kTiRN6ahI0ax8wLGE5bS9kAhZJGlkAhklrAM+k5Y699w7g3orjP6rJ?=
 =?us-ascii?Q?eXPM5UqKIyWmImvj4yFJaOPvQeynzM3l9m0cyNdNfU2Qh4OcOQRbW5QgzSPm?=
 =?us-ascii?Q?qKzyuPvbE+pGjyBXMcgTR3TVoG4PE+pvNoTy1smXBsss/NnVE39Sm56el8dx?=
 =?us-ascii?Q?A4skbzKOLBXq95gJqOUkqyO62XRoG6NtOqjU3uXfnLO1ycORKHAzSzUfWGmf?=
 =?us-ascii?Q?EoybTkIDzppM4xe8oop0xBnH5VMyjX0vEey6jZ5NhIje/c9jjtiIfYtYjx8m?=
 =?us-ascii?Q?FRrH8mHl14108aCJS8EXnN0iSwTjr93OZfGf05cVw0aCXZKtRCoLQatqqABC?=
 =?us-ascii?Q?J+TmW7vjaLxoG28t5FDyP4/2qwPOH1eKejO1a8ky3ur8eYZ08gl/uwWzsoz0?=
 =?us-ascii?Q?PYzqHjjwU9/AbNJeh1RDmcbj6AClxNpmUZtPTtOIMlXsaK6N/0L1/jfJxR4/?=
 =?us-ascii?Q?VmWszqPCDfdylUA/aLMjUjDoYZ7a54CwA0d+bE2/u0r4DcV3Ku+cTfUmyvpd?=
 =?us-ascii?Q?wtSrWlS+gW/LQFdXjNodow1g3Yxkeoo8EKvPoEWi+vj7XLFZMmUJE1nJBFdX?=
 =?us-ascii?Q?QT2oDv/XoY44A25YfGI+WXPPDh3MUsjmfXIyOvNP6yPIl73jyEdSnWVwwX5o?=
 =?us-ascii?Q?WWOeyEjmcj0VU6ed1nLO+S5Rn/LbuyL+zNpRKBdL7eOiGaJs8CW7LgvEf9M6?=
 =?us-ascii?Q?4PAR61aFTh6X9Yhd5wNCSLlhBpIJQBN9PiQBi1BBoeh+nNVeCfIhpzQYvA/A?=
 =?us-ascii?Q?SwglYlbu4KK19meLyusW516tH/Hy05T4?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9212
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 86deaebe-e721-4e3e-2267-08de0f9df9c1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|1800799024|376014|14060799003|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VLQqXQkCcf3kO2JWv7QGIJMZy84jyZLna7WavaXx7wdH86+GPK1hR71Kw1GZ?=
 =?us-ascii?Q?YCbZVZgypdOpKBGp4tOm+K69Q37kRYRcRPgVU3xwH80DAbYdZBbqUNUmUCRO?=
 =?us-ascii?Q?+sR2lIxSHlSJ6diUs9TJLZp/WO0j3i+cpHOoQkPjKTep6IG3yuSoRoDa//Ai?=
 =?us-ascii?Q?gWClL/OlHRv73WQi4wta2sfN6T36z+lxnMnNVZMThkcySST0kbk4wdMxlrAi?=
 =?us-ascii?Q?dvhWNyMPk1fXZHwYnP0nyiK8NNrSs4prc0wdYpCQHj/0y73vKM/FWm1kFER8?=
 =?us-ascii?Q?J0c4ujQpsmQTRMMbx4ga3gElwJzsW8H4tJPQOXFWwg48DcbFPE3aVv/TWDIr?=
 =?us-ascii?Q?TUZTkE4Yj7NOsi4jq48OnQCzLhC7CwEHgBGuIdtw1t8HEuUyKlAFsSgHJ0l1?=
 =?us-ascii?Q?MHN++Bli1vKuJ8vzsvFZLRgksfU1FgNovV/CIn4TgWia6MZq2RBOraIXSBju?=
 =?us-ascii?Q?Yo4DdapRR2zrTLdB9vQuJ+st/2DB4dty7eWqDo1znhMSTaHzSOyfafASWgpV?=
 =?us-ascii?Q?L3sAmXZRT+CIJYhFC3gTHOrqaUPl+yD1yh7ntrl0R2TWCD6ba+bFM/bOBfs4?=
 =?us-ascii?Q?LJghLuueefJnF+pArJzHbxUHd7zD5ju1Q4nLcEVScFoXEry00RQJOiBQL7GB?=
 =?us-ascii?Q?yBa2HF7mYv09lnLktVGbq685pmOVpSZHebtFaYD3KH+69pQppO1HmDtYs+t3?=
 =?us-ascii?Q?Vd9/3cYojxT9YHEus12pFtqZcAMcPxZqR/arw2dyYaBhnHc9+hwovJUAFJcJ?=
 =?us-ascii?Q?U2W4gtaYEeDA6b27tP7K4fIRqFdrNr7mMA5vLNbOam1E86ntUsQMBEmga4vg?=
 =?us-ascii?Q?DJEdE3NTFAHkSJTmE3P3WxGaXcGQHbr0EJ7sEUHxqrRjJNp4SZzYsfSib5R+?=
 =?us-ascii?Q?9U/m5dq4WhORBCNcRQ7mt2fAiiLr9nZ885d2ozeiVM24BuQ8JG0/CHrHqqMR?=
 =?us-ascii?Q?FvGcC4T6BYpvwQr8QKrXPJO1gLP4VBqYspZAtPIb27U9m2EU34biwF2lKAx2?=
 =?us-ascii?Q?f0QKoSN/NbltTvxdiEyYVtjSpaxyqsdVhkCJIohsYJD1nLr5Mm4pfdDJ9PmM?=
 =?us-ascii?Q?/HmTuCLO4hEbJhAAyBnUV4jQr4JFCql7hDtcTsPbKG32we9uwdntN+ymd0MV?=
 =?us-ascii?Q?LcktfPoyj0OOEvqitC6eZp82VJyf4wjl+PWfSCQv1LYen8LKx8UAjm3CrDKB?=
 =?us-ascii?Q?ANdsiad2oYh4cHr/l0X3qULJ2jBLXVb3vRfhQ/vvDmc69Sex6hYaHcqIuKfn?=
 =?us-ascii?Q?MBlNteoF/wTd98kyRDWtxc50AFj/ZO5rE5N8cZ4WvUezgX576vBUnxCFh+3t?=
 =?us-ascii?Q?KmNJlv6RQG51b9jiaX6sUAcaLh32J7prJDEh2ngM/h0Ji9aE86XxNNJr53DW?=
 =?us-ascii?Q?MO1s5zF3tIGt8D1CrDIlVtFnlFx3c5UoOylSFcd4UyDuAq5m/IetHJ+Y4eQy?=
 =?us-ascii?Q?EhkYekT8qEQPBO5feluhKtj3ecMxjbFjcRbWmV6FZDT9rIIL+4RQlcEXotYb?=
 =?us-ascii?Q?GPqGZF9jXK1uoa/xdR4nuarBQWF0s18rXZRYYI45Tf2OIpDxzgxwltQb3IHl?=
 =?us-ascii?Q?Q5Yvy5Kf+x0vfUbjwPM=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(1800799024)(376014)(14060799003)(36860700013)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 06:01:04.5915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa085df5-0c3b-45b6-4973-08de0f9e0dfa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5354
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

This commit address a kernel panic issue that can happen if Userspace
tries to partially unmap a GPU virtual region (aka drm_gpuva).
The VM_BIND interface allows partial unmapping of a BO.

Panthor driver pre-allocates memory for the new drm_gpuva structures
that would be needed for the map/unmap operation, done using drm_gpuvm
layer. It expected that only one new drm_gpuva would be needed on umap
but a partial unmap can require 2 new drm_gpuva and that's why it
ended up doing a NULL pointer dereference causing a kernel panic.

Following dump was seen when partial unmap was exercised.
 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000078
 Mem abort info:
   ESR = 0x0000000096000046
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x06: level 2 translation fault
 Data abort info:
   ISV = 0, ISS = 0x00000046, ISS2 = 0x00000000
   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
 user pgtable: 4k pages, 48-bit VAs, pgdp=000000088a863000
 [000000000000078] pgd=080000088a842003, p4d=080000088a842003, pud=0800000884bf5003, pmd=0000000000000000
 Internal error: Oops: 0000000096000046 [#1] PREEMPT SMP
 <snip>
 pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : panthor_gpuva_sm_step_remap+0xe4/0x330 [panthor]
 lr : panthor_gpuva_sm_step_remap+0x6c/0x330 [panthor]
 sp : ffff800085d43970
 x29: ffff800085d43970 x28: ffff00080363e440 x27: ffff0008090c6000
 x26: 0000000000000030 x25: ffff800085d439f8 x24: ffff00080d402000
 x23: ffff800085d43b60 x22: ffff800085d439e0 x21: ffff00080abdb180
 x20: 0000000000000000 x19: 0000000000000000 x18: 0000000000000010
 x17: 6e656c202c303030 x16: 3666666666646466 x15: 393d61766f69202c
 x14: 312d3d7361203a70 x13: 303030323d6e656c x12: ffff80008324bf58
 x11: 0000000000000003 x10: 0000000000000002 x9 : ffff8000801a6a9c
 x8 : ffff00080360b300 x7 : 0000000000000000 x6 : 000000088aa35fc7
 x5 : fff1000080000000 x4 : ffff8000842ddd30 x3 : 0000000000000001
 x2 : 0000000100000000 x1 : 0000000000000001 x0 : 0000000000000078
 Call trace:
  panthor_gpuva_sm_step_remap+0xe4/0x330 [panthor]
  op_remap_cb.isra.22+0x50/0x80
  __drm_gpuvm_sm_unmap+0x10c/0x1c8
  drm_gpuvm_sm_unmap+0x40/0x60
  panthor_vm_exec_op+0xb4/0x3d0 [panthor]
  panthor_vm_bind_exec_sync_op+0x154/0x278 [panthor]
  panthor_ioctl_vm_bind+0x160/0x4a0 [panthor]
  drm_ioctl_kernel+0xbc/0x138
  drm_ioctl+0x240/0x500
  __arm64_sys_ioctl+0xb0/0xf8
  invoke_syscall+0x4c/0x110
  el0_svc_common.constprop.1+0x98/0xf8
  do_el0_svc+0x24/0x38
  el0_svc+0x40/0xf8
  el0t_64_sync_handler+0xa0/0xc8
  el0t_64_sync+0x174/0x178

Changes in v2:
    - Add R-bs and fixes tags

Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
Signed-off-by: Akash Goel <akash.goel@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 6dec4354e378..7870e7dbaa5d 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1175,10 +1175,14 @@ panthor_vm_op_ctx_prealloc_vmas(struct panthor_vm_op_ctx *op_ctx)
 		break;
 
 	case DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP:
-		/* Partial unmaps might trigger a remap with either a prev or a next VA,
-		 * but not both.
+		/* Two VMAs can be needed for an unmap, as an unmap can happen
+		 * in the middle of a drm_gpuva, requiring a remap with both
+		 * prev & next VA. Or an unmap can span more than one drm_gpuva
+		 * where the first and last ones are covered partially, requring
+		 * a remap for the first with a prev VA and remap for the last
+		 * with a next VA.
 		 */
-		vma_count = 1;
+		vma_count = 2;
 		break;
 
 	default:
-- 
2.25.1

