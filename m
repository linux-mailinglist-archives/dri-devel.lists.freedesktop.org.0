Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 865479C4AB9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 01:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10EB10E1B0;
	Tue, 12 Nov 2024 00:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01on2109.outbound.protection.outlook.com [40.107.239.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAD210E1E8;
 Mon, 11 Nov 2024 12:09:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ug0cZXXRttjOq24OZkVVHsuyxsKz38wgl00dYwqoi5+ln/slxDYRR6bpm3VLymkBvAZgZfktRUVGujxtyEM+amYwOp7tLVlrFzHV9ghGE0Y0ZlTdTytxQanQm8M+Uk1ngFJTB/S5eBtJbtRhTQQuGpt5RLe5Qdl7S0mBKW3LPa/p3UCckju+5XQFmrAD6AoD1UH5DOB2UuHv09F2oq5kyYyW8DRwHQcAw7sbH6fhQdgAM45vhRvyKAuMejrFSFkH0SvRlnvGzVu46kUR8zqAc7Rm//urgSPPIJEDE45Z1u8jx8nTidGVynk8FhU8cE9R1i2aYMF7m6+068k+4aFDRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPVH8SNEG3ba863ZYhtWW5xiYUWfQgpqBMM0+rSIZH4=;
 b=miUdeqdB5zhnXHZBdvVjLIWzWw3/kO0XCYzkIbebw+ONhzgcJ5fZIXaa9YAhuKmc8QWrph15v8CfwgH/8SepEgqSx7nSPyLzS3h67MTGjN1U89jmmimP07wHvKK4tXsMdebYcCjkHsvHefYJuyRwWt1sw5MHSCdu7MorMlnoXQk6rNeOXt3Ufz5QapY37RDIP2VjxsYyhH9/4zIcHjIrUVCbUuXhXoa6RaVEIPZkUZ4qUL3HM7a/q1FALnbALR9irEMJNHf7PDnUjpU6jChl/nlGYE/JKSJP9mVQ5Xx0DxjWGeau/k2+DGVb4gNLfZthAr/YY/edCZyVyRZ+TklWvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1171.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a1::5)
 by PN2P287MB0675.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:15d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 12:09:48 +0000
Received: from PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 ([fe80::12a8:c951:3e4b:5a8a]) by PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 ([fe80::12a8:c951:3e4b:5a8a%4]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 12:09:48 +0000
From: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
To: alexander.deucher@amd.com
Cc: tarang.raval@siliconsignals.io,
 Bhavin Sharma <bhavin.sharma@siliconsignals.io>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Roman Li <roman.li@amd.com>,
 Chris Park <chris.park@amd.com>, Leo Ma <hanghong.ma@amd.com>,
 Jose Fernandez <josef@netflix.com>, Ilya Bakoulin <ilya.bakoulin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Remove redundant condition check 
Date: Mon, 11 Nov 2024 17:38:27 +0530
Message-ID: <20241111120900.63869-1-bhavin.sharma@siliconsignals.io>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::13) To PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1a1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1171:EE_|PN2P287MB0675:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d7e42b3-7952-4d18-06a7-08dd0249bd09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j9L5HrVwNcqr1SDacY3/uwNEjHqt4Vr3+4ojDgoQLI3+BISmsuKqWvyTv3Qr?=
 =?us-ascii?Q?kjVsxGmf/06a630jTnLILV6fD/fAGZ+Ol6bPEa+sr3BLYHhe9u2BlV1LvJLJ?=
 =?us-ascii?Q?HXV5rb6Shc8LGiEuiJ4fLyvKN25opmav9dT4QjtppvuDL3sDBPE52WNqM+gt?=
 =?us-ascii?Q?w1Nc6V50Es/mFOoU32MJ4/MWAaWnX1Ph67AxSgFDhZdJHyuqIacFb/3Bh3+A?=
 =?us-ascii?Q?t6TAfH2R25Q1f5tzGSZ13VdO2/okF17sfnZreOoW19hxXzJy3hnCoDctNjhv?=
 =?us-ascii?Q?PBrLFkppYQB59mhQvZ/cQxJJQRCZRVaiiqlc2/4v0htEncNYkciZkuw6AX1B?=
 =?us-ascii?Q?EWEwPlM9+Vey/RJkpMZ1r2oE6Q1EKl/QoAiJ7taZ/1SL7rGQG6phFMbfKyiK?=
 =?us-ascii?Q?UgeC1eUZBruIiiKU+WsdUEoCTlhOzA0Qbni2AoLLkwp0NmmTzzUErNFp00ec?=
 =?us-ascii?Q?hK1tzd4Eq2FvOFEbNwPLqJ022xSwqhv0R+zMNGhTBpkQNwquqvnScuDy4MdY?=
 =?us-ascii?Q?lZBw/L+s2NNb7Y6LnQd4CgZyuwUa9EAw5/jOOOQ2fHKtZEIQlizQ3JPDCq5O?=
 =?us-ascii?Q?9I/otDsFjb8G+BQaAJ8VT4titWiXRqXMFxNzlmJNzKQO1QeyIesSszLzT1WU?=
 =?us-ascii?Q?MRsXCnHvnmQO0hzrvF4wFcpfPc7HYTGRiag3xZWcoBF37HvE8peEQYIVgbym?=
 =?us-ascii?Q?O1JHzSiIuJhtt1GAl91N/CYtjOP6qwBDA73Dht6WNKi+fcTuEioBzHZ/uB5x?=
 =?us-ascii?Q?DK2SZ8SVpUYKCdS5zHYRJs4+BX0ZlsNXeH/cPch49opWlHq5/G7tQy+2cVtA?=
 =?us-ascii?Q?Gp+SHB2gU6GTztagFTqU2/CZDCwiULn5XktanR5PZULb5Rb6JgyR2lA/aZdZ?=
 =?us-ascii?Q?VlbX83xCD/Em8Dy/yOydMKY/SoKhghR3DIpG+kc+4h8v/nOcRo2Ik7k3A3F+?=
 =?us-ascii?Q?X0YP6uh7M2V2wmfSkf3Kt8c5v6g2hnSt0baTz0RzOTu5MQw7XSG38dogBn2b?=
 =?us-ascii?Q?gMVF3pwTnHyMOMp0SdTTm62n1eR3puybBh6b5l8mMHKwXoKDORzPwrVq9cSA?=
 =?us-ascii?Q?cdGRV/jGmUKmeGQYLB5Crps1E1C7FSXYk4nY0WMiF8mMcV5gvzOu8nfiTSSm?=
 =?us-ascii?Q?E/1hHWoDqvW6ERb6opTD4s3EPoYpdZ87A0emMM0rjdUpyy3CkCu1fW0F8Bhv?=
 =?us-ascii?Q?UapnuJwVmcBwShRYsA8I6WF/u0sfwMPKVBLMjTpCdV/3ZyQdFQ+kgFGqnMCN?=
 =?us-ascii?Q?r40oQunRZHvRqZu7cOdmsUrJpvJGIzEhVoY9RcR5fp3ZTt2OQ4yEL1mVwbg7?=
 =?us-ascii?Q?tDb3mrLVNvHn5v2Go6Nm85yLzwOtqO+cJE6YYKFBLJz3klnvUPE6Ud5d7VeB?=
 =?us-ascii?Q?PJBtAhQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PN3P287MB1171.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lBt5+CvjZab391BNFqjLdmj68+tkoOXeiOL3zIpWpgEDyHEFCCxmtDvS813W?=
 =?us-ascii?Q?fzUfR/LgmV9izhhkjArjablOAc5hp53CwG3x082YnAzGddYKEfBXxfizFNAy?=
 =?us-ascii?Q?LK0pgaVNaBMOMXBCyvyB4Kg5FhLa0uMQkz+Wi88TC4HAVj0/yxPlZ71LEZN3?=
 =?us-ascii?Q?H3gSCY9F3hYw/xTH9yrsPFe/zUjqzSh365HgOs7v4qSyQt/d1UvlYXhEJJNc?=
 =?us-ascii?Q?nud6UNt+MGCh+amdZBGznrWI0eVLRobtSXIACq1fi6R+ol26hZAV7RAwT6Iy?=
 =?us-ascii?Q?WRYt5Fce+tO5lRwa7rrCXFLGlEbcCrNj3U34CNHovnDOKWTk0eZPBH7BLoDZ?=
 =?us-ascii?Q?Rs+JGEq+AQT4Lyxq3e0TT5cl56Lqef8b4Rn4cvRbcVKMqbdD/tZ0cvt8zoRI?=
 =?us-ascii?Q?5jd2h2JN8/3ZTayIdbQ3uGuv3MiyJkNJc2y50n/Fw81D6tqWTA99ZujoA1/q?=
 =?us-ascii?Q?BwkkQAFOk9mhGkbfXyCTt3wqLpzEhJqhBjiIHJI1zk4NaV5GrhU7OJVTE1E/?=
 =?us-ascii?Q?xxVH09wbBKu+Ibx8RiD4KLyD5S6gu3xMRuafY0p/5kUxsmeXtMzf8j9f0FyM?=
 =?us-ascii?Q?q0nqOt240Cex6tlqgk1CYt4qV+KTZeqGycH9vToznoPW7eO7M3yWG6fYbl0r?=
 =?us-ascii?Q?Zq0t7t+qzdt9fieLosBccd1rbLzNP3aOOcgOm8lH9S6liIIvySHiKmh4d+GA?=
 =?us-ascii?Q?LunmvSdG9g7zZ16BUnlrLo334st2HRes7ZBlb6aNPWLskWqF9ylzyDof1mEn?=
 =?us-ascii?Q?9NuLqlbzVbkC6o5yy8koIHr+9ma/zBOxssvNDHf5Uef6xEiqBJPnes22X4Of?=
 =?us-ascii?Q?Pr8NufS91yXsEeUbMW2+rqQC7CXoNFcMF3l+xWrHgeoA9g9yNHYMF7s/X3x0?=
 =?us-ascii?Q?FY22KbKo7RKoVu+Fl6+46qJWxAnP/WxJlFfBnhjgZlEQaiW+QRLAxm1V6dXp?=
 =?us-ascii?Q?DukvTwEMj+8GqUxzwgqcbs5CWeBTZO8EiMajCbLLvC5FhvnZVr7reSTcXXeF?=
 =?us-ascii?Q?eK/urEtMpYe5zTQQ34Vqboi7Ruj1EmhZ9HdLltMHOKskdAruI26elsoe9xRW?=
 =?us-ascii?Q?2/R0GolEJdUZ3+DBp+bvXiomADSnfpjnyjbSo6ZLxeihmqrTZ9jFgctAHipj?=
 =?us-ascii?Q?Q8M8x48kYnjbIabZ18wq/0+WTgOYMsDezCPs7Y2tC3/336Z0wOO51L/06hVQ?=
 =?us-ascii?Q?XWyrezOPr1I10v65QQIHjwPy/RsUxZplyY3v5OxmeYCCaldbBVcXCt11TZZ7?=
 =?us-ascii?Q?VO9HzBcM4JHCiMETxrFbZnYd+tygmyV614Vo5KP8eT8yvyEBUd9rHkezSPlp?=
 =?us-ascii?Q?oQ3SxkuSrV/+oj/bhjwyE0M0xG9vu45A9S3kYZHHoix4useh7u9l/GMOoczU?=
 =?us-ascii?Q?+jKy+2pKIU9IrJ3ioRtW2lgDs5K1Npr3rizO94Z8ChlB9zhMfwrfOC4262Sg?=
 =?us-ascii?Q?ueNv0ye2OBVVDTti90o4gWrP/w/0WtCSeUKTrKFEP5sGabY5l/2hxfJrpp8f?=
 =?us-ascii?Q?eKRC+QGFqA/Bl1N+2QZysVrVXZWQJ/mTHKJ86O+TxhwdZKDHErnhjhOeK7GV?=
 =?us-ascii?Q?7+LYDW97g0DAl66cCoACvA6kjjdO9GRpKzOcJjKGymHPTg3OyfaG+Bm2ZPmB?=
 =?us-ascii?Q?WhiKd4kGEGolEtAJ/sKjm7c=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7e42b3-7952-4d18-06a7-08dd0249bd09
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 12:09:48.5346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +W1Y61b2+i6cTZdt3lNBL0IoGx8cfBPIysV9aSKbABQpJSZslYxSG4XNnWco6V9HTVO7XtIw34uXzjPg3UD8j4L5hnq/m4RyaR/3uG7VUZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0675
X-Mailman-Approved-At: Tue, 12 Nov 2024 00:28:18 +0000
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

Bhavin Sharma (2):
  drm: amd: display: Remove redundant check
  drm: amd: pm: Remove redundant check

 .../display/dc/dml/dml1_display_rq_dlg_calc.c |  2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c   | 13 ++++------
 .../amd/pm/powerplay/smumgr/vega12_smumgr.c   | 24 +++++++++----------
 3 files changed, 17 insertions(+), 22 deletions(-)

-- 
2.43.0

