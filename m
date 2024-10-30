Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD01D9B7015
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 23:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4A710E818;
	Wed, 30 Oct 2024 22:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Vpen1JfB";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Vpen1JfB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9D110E815
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 22:54:55 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AAF2Aunbl/0Biyig/B1lYi427HpSrUJlTdBMFN5a080NiShTU0qtuRqooCeEKCkYxl0kko39F3YUFQkJYeIQWYcvjslyvBA36CliC7CP5dQmlbGhfjdxb5p496i2w6R1lQCXdtlpmRm3hbmvuGEHLqlpXNBymCfE/yC3CRNLwYmKl3TEbHN3McUXGXc0FTSOHmAgcx9hg0PPAvBAjm9ZjF5rJdj4oMcFgTErxqNScwkZzXdmD4vDsyEAAsB+Ab4F5Eck6MXUyRd8gB5o9UtB7dkBS2mSN+oD0Mea2qwJXvAqSgElWEu28eYPFqdbOq1L4CnweHsMtn71kopcltLe3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KS2RNOydT5j2+tNeEKwfMthtF+ZmUygKnhu6t3Stf38=;
 b=OpCd6yHUhz00sD6jq7O5AJm9k42lMdsnbC/x4ORz8ZuE4w7hXQpD8HE0CvlzvtbSl7nTowZWuJ2Jxjip5/kz14p0nt0z+PCO+BBZvPAgkCl3IEJHdlUPffef8GnDyXT8ysfT7v6YYKqANa5GH28RsByvSWVHGYG7Yvjtizq+oCzzXyHdq+G4fAiTfIVgquHbluJrw5MNCvaVY6xa7fTWO8WPbd9PkZZzoce7FynWFSo5AMoZjcaHlshu49NfrcSa3dv4ihF+2jYu1km/iM6SgeOTjZdopTnQ8pLX+8S4sLnf4/r7yR7ydMBNKKCIah16+2IG+UTxDB5GamYYu8ahhA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KS2RNOydT5j2+tNeEKwfMthtF+ZmUygKnhu6t3Stf38=;
 b=Vpen1JfBLIAzYXFfEjDI89yIEzS8ihScfD11VFfsfStjz79+EeSgJ1PDkO+RHHDaM5bZ6PeEOb+J4vPtP7Ap+BMsEtze0Gp8PBMuMpkrF9FFznxr8Mrz5QpSaatkHXEhQzWPt2ngPPbtgCqeAwO8v4iolTG5E8mA5j+D+s8Yv/0=
Received: from AM9P195CA0023.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::28)
 by GV1PR08MB10669.eurprd08.prod.outlook.com (2603:10a6:150:167::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 22:54:48 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::2f) by AM9P195CA0023.outlook.office365.com
 (2603:10a6:20b:21f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20 via Frontend
 Transport; Wed, 30 Oct 2024 22:54:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Wed, 30 Oct 2024 22:54:48 +0000
Received: ("Tessian outbound 99870d44e01c:v490");
 Wed, 30 Oct 2024 22:54:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3d5412f84220f916
X-TessianGatewayMetadata: XsGE7xrCKjTeo1U+9Vw0lzhmGLzhnALo+Gt7jV5buLgAiueOLJi1P51iJ1nva9YFOxLSgCv2lswPDGN19IHOOKwNyC8j3yYbz9N7JUIf8zP8AvdxAwpA1kLhv4pc+NEsEK4pYqX2MS8Ipyc8AB86DonfA/6E5ZIJl1wrij3dgjc=
X-CR-MTA-TID: 64aa7808
Received: from L7320d669fc95.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C8A8A916-5F83-4A23-BA8B-08292EC32A9B.1; 
 Wed, 30 Oct 2024 22:54:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L7320d669fc95.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 30 Oct 2024 22:54:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nflYbtHZWpmU+lkovnr34/p4MtfSz6RXEKO20WnRTfcrP06ijUPocymU7fyQigICLOhufbM+RGdaSnH3dk/p7hz0wELMApstZHN3YAAdxzTXt1gdXPVOgyCRpiswtMKFPd8WjA5TrSW69gH+KJBZ+nDDgkYxrUGjgNrCDHC3r/0pEsGP1W9xK6wIRaH6FvItFAAx2NQZtYvCqptMo23ggdHhpHkmpEy9tJyEow1XC6VDC3DIg2uVRiizz0pObH4yLvRzAUt00hfYHQ5u//krBvMSuJjULd8P1Zzuu8mgPW1vdiqFxOBydAPBBI0+0HXwadMpQtg9SMCUp5Pgc6CtKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KS2RNOydT5j2+tNeEKwfMthtF+ZmUygKnhu6t3Stf38=;
 b=v0j0L3oh/nvNl7DHXtbfOYFmykNv6B1+l3/y6MydDPKz3i4nRFPk4zB2Xr7CQwfv3Pr+ZAdDodBpldpl8Q+Q90znSO5nDzajxmjmEMAIB5fCcKqzgml0DYz1XsE6MPN38CImYn/VP1Zhccp2Bb7PsLtKrvXQDviYBzMbraplEywyb3ABz6pV6qC5SFYKa62329oZPXM0JKEwwKdVby78erYJ8rIWAoBlLhjGFT6PVoY36mIpXkYIakHplNLvCSROjheC8ra/Qlf3WE5Y9tMeUhOZs/kd0PprhY1yABs/6kD8wRht6RH9WekBugYNg2bUtuVo0ywjobz3wJZgtUeaJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KS2RNOydT5j2+tNeEKwfMthtF+ZmUygKnhu6t3Stf38=;
 b=Vpen1JfBLIAzYXFfEjDI89yIEzS8ihScfD11VFfsfStjz79+EeSgJ1PDkO+RHHDaM5bZ6PeEOb+J4vPtP7Ap+BMsEtze0Gp8PBMuMpkrF9FFznxr8Mrz5QpSaatkHXEhQzWPt2ngPPbtgCqeAwO8v4iolTG5E8mA5j+D+s8Yv/0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by AS8PR08MB6182.eurprd08.prod.outlook.com (2603:10a6:20b:291::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 22:54:37 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%3]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 22:54:37 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com, florent.tomasin@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH v2 3/3] drm/panthor: Prevent potential overwrite of buffer
 objects
Date: Wed, 30 Oct 2024 22:54:07 +0000
Message-Id: <20241030225407.4077513-4-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030225407.4077513-1-akash.goel@arm.com>
References: <20241030225407.4077513-1-akash.goel@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::13) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|AS8PR08MB6182:EE_|AMS1EPF0000004D:EE_|GV1PR08MB10669:EE_
X-MS-Office365-Filtering-Correlation-Id: a58fa9d0-0560-4c17-594c-08dcf935daea
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?TWwCSVWdraMvxI7DEBJ9CAUb44PdD88Gz14xfTH7p6ucP0UYZIXQV626EZwK?=
 =?us-ascii?Q?cu4cIwj3lKydc8lXv7nzq6iQyUXPUcaiVtpo7gi3cO+MrYy0EkfpbJH5dqF6?=
 =?us-ascii?Q?l8kSy+519qfMgkelNaBHnWfQ8uYuLuPQ9kOzn+exc4R7r4Lgd/Swq+DVlIVn?=
 =?us-ascii?Q?XpJxZVotvQYAW8lRtQahrHeb3PHWQhQfMYbgfx44Bi8esG+oChcwSxI2l+Yj?=
 =?us-ascii?Q?IPcto1TBnFIY/v0XUsf6xM0Kglcx7tZJmM1YjmvEGPUVL6IcgGmh0K0/4JfP?=
 =?us-ascii?Q?cysehJbWuH1jot0zajDoGf33bQPCuZNEeG/RJs2R3K4bLHM6XNtdKyLEuZjo?=
 =?us-ascii?Q?hgUej2PFaibMCdp0aSGOxb4BwN7IStLJqCLo7vHRZBnNJLVvQDjsOR+G7tKM?=
 =?us-ascii?Q?nevFJwro3NskI303dAPxq+Ni/Li7Cu3QyB5SDBMSQvLxS0Y5muQHag8uGX41?=
 =?us-ascii?Q?jI2Yqe5Yn0Xq5erZ1oDtJpw8JwMhNH6G6JCGScuCZrmU5hQcd9ZcOhsQw0YH?=
 =?us-ascii?Q?ucFcDusdzWSpNNv6vZ7ZkV4M0KtKfMxJi9E8i3FQCSLfysjS76cQekRXkohk?=
 =?us-ascii?Q?+IP7Cf9UTh8gjtvVX/Z5dUQWKuI+xe7VNHNcBa9pKmfZpDgfxZkGFvlzI8gk?=
 =?us-ascii?Q?cPRzdTsYZLk4+NPHxm+XlMMZten8stCL2THxM7q3Hb5T2p9SwXGcq6P3FMBN?=
 =?us-ascii?Q?JmoZwBUOu70FDNXL9toCpQK+eOQ0jzaNRBuyNaJxOoV7RI29m/c9k9vL4Yo7?=
 =?us-ascii?Q?dOnlSMULiWY9K0Eg20ax/SES5Crn9qv5Q6JamPmBrBcYhOyp8IpMQnfPiGYY?=
 =?us-ascii?Q?o+/quxMkwp5Dp4teGzc1FgZzG+cXONPFNmmGal+rAp0MPyrJON3uDJMhvYr9?=
 =?us-ascii?Q?GTbNU/f7QGaQ4aK2TqSkFA3MKYa5fXVNXvYG5GLmtv3oMC+7HmV5q6w7NZIn?=
 =?us-ascii?Q?cmMPchY7T6sn4fXvMHvaSVBC2+kQdu8eGmOXQp1dOulZML2b7rkxvPVgxV4p?=
 =?us-ascii?Q?7UGn0A5TCihl9D/VLOOMco2Yj4EmmeJRpX+/V9csWTIV+3QNxPe6f68XRevW?=
 =?us-ascii?Q?rItPnTS5wuchd0xzkeSDhMK3Xh+OjSvPKoeQJdYvCW1TmBIzP5J88a9+AB1q?=
 =?us-ascii?Q?J5fsh2wuWFtzwAh4fLepP3w8cAfRmOUaGedt+2gsEjW8Ar/zd3zJqnE20elT?=
 =?us-ascii?Q?xQO6GPTzHHGTobYOWviXt+2DPZzteGMfod91gtRt6O4pBIWKh3YXAZPyK4Y6?=
 =?us-ascii?Q?ls+TSuOLHWV+OnKq3HfGfIgqYFzCAGTh+BWxBB2pguy7NDJY9pT13vcQyMhE?=
 =?us-ascii?Q?XLFLhSo6Vm1eOZNPJz5X0a0B?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6182
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:415::16];
 domain=AM9PR08MB6982.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f5d2057f-6cab-4575-5725-08dcf935d4a1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|35042699022|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D8zRuh3wcJd8Ekgi6mXY9c0bDTbtzG2PfYVZ6uABY9IEUEwz+tpdV8vHxUNr?=
 =?us-ascii?Q?8Kn6osp+OS63feAy7nJyy1cTh8S1olnVpU4QpTAGO4D0aT3WAsTTgd2p36s0?=
 =?us-ascii?Q?FraaiQxdMpoY0rtdPkTds0bjPj4LB8j/2JCLOhe+IOqHWJOOtyq+3TrPpZQy?=
 =?us-ascii?Q?J1bOezYC02vd0xES7eUfx7CMOA7VH6WhyJBmUa/2oGCSsquAdeFcAHbNq18S?=
 =?us-ascii?Q?ZLrSmypZ8pqlHyXeSbXEZVwddpaA+a4UD9/LkSbpB0cO5ho5yXC/DcWMz9LD?=
 =?us-ascii?Q?0aX6XF8UKTgGAlZyx2SGkZ4BBfnqXtYOVT8EcfTN4TlyfKEBr1HuT+qqVKzC?=
 =?us-ascii?Q?SmhLIcI7QvvfkGWkJ2bjArrsewSWoJH1KDdQqGVRdz4mw1P/rbalnYQN8Upq?=
 =?us-ascii?Q?TADiW5i39ZaPBpS0jnWn5w8OdzUuRZBFDjKgof6SiTiwH2ATRZPRq6Bxi5LM?=
 =?us-ascii?Q?yqXHN00pTJQORDvFBGvTGkBRIqWYVqtYd5N65LMC4GlPmEws89r4+FM6U6U8?=
 =?us-ascii?Q?NvwdnqmK5xK5lo20IQWPUT7Nd2crretOVLoGig4l8NENsjmbv6B5R0fZoD/+?=
 =?us-ascii?Q?W4NbFDzZhksCwbNNRQVpVAEQXm9DD433KiCLs1bT2MWxDWkt+Lr0ztQzKzTU?=
 =?us-ascii?Q?I/bNvF8hTjwEjJUbfdcmnWgKqK1QsAI4aVLfGn7+wXVHtms/URBhR+J9wKH8?=
 =?us-ascii?Q?injuJcyMKjf7UfJDAUZusOioi5O3i9KXpZkjRm+0Du1/U60aZKU0dotql4Pd?=
 =?us-ascii?Q?CerIiSOEv8w1cjdmIfBsJrIYJWlb2wDm6G/Ohrv+YaPFv/saDJIK6/WVSpZN?=
 =?us-ascii?Q?p/0asprTacUTzrbMDDCgbO1t/+/loC2U1CxI7HuPFtspzSpVcsG1P4RR600i?=
 =?us-ascii?Q?2yHN8QEacsE4DSOtrWqEypwb9eQaPMiK/xM0H/YgSRSopns5JvZzNgM/eItw?=
 =?us-ascii?Q?/oQbgJ1BFdy7n16lDlEdyThEqqlegf4Qwo9+2OGJ5Lh9nXU72M6/7NgbA/en?=
 =?us-ascii?Q?1+mc+XPc6o9PjHOeVUoatQXV+o1VOwY4yhpd77LNppgfRJmE25PVZ1HJBXRp?=
 =?us-ascii?Q?5isX/HGdpeX+/B/wDruwrLB7kIZpMn0bMFMQCvc8XfO34D8Cy6Ci2KyC0D3F?=
 =?us-ascii?Q?U3EbRTNMAEcaGTzI0sKe4HBv2XQxZRThko7/ArQsb7e+otWu3ypHGEDNHGms?=
 =?us-ascii?Q?CAb5RpkZyaCt7MiYY64o8uHA2ES8N6KbzQlbEIUFlsDFdcFAJxvFmnMg3zk0?=
 =?us-ascii?Q?vdFOayaiQ/TyTleDyF5XY9FJksyguYpEWdbPr0cdWjMY34zXkDWTyA1OPwno?=
 =?us-ascii?Q?2KMEWLfbQ4BIHltApnVY2t3Eg5CJL811D3+JfU5nwMF42zv7BGGfl84EYLLx?=
 =?us-ascii?Q?chVfSYDEFtjpYWAhydKUdrmR7LctqoV/gSlS5gYGzxM7Oj1yYw=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(35042699022)(82310400026)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 22:54:48.0673 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a58fa9d0-0560-4c17-594c-08dcf935daea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10669
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

All CPU mappings are forced as uncached for Panthor buffer objects when
system(IO) coherency is disabled. Physical backing for Panthor BOs is
allocated by shmem, which clears the pages also after allocation. But
there is no explicit cache flush done after the clearing of pages.
So it could happen that there are dirty cachelines in the CPU cache
for the BOs, when they are accessed from the CPU side through uncached
CPU mapping, and the eviction of cachelines overwrites the data of BOs.

This commit tries to avoid the potential overwrite scenario.

v2:
- no change

Signed-off-by: Akash Goel <akash.goel@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gem.h | 10 ++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.c |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index e43021cf6d45..4b0f43f1edf1 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -46,6 +46,16 @@ struct panthor_gem_object {
 
 	/** @flags: Combination of drm_panthor_bo_flags flags. */
 	u32 flags;
+
+	/**
+	 * @cleaned: The buffer object pages have been cleaned.
+	 *
+	 * There could be dirty CPU cachelines for the pages of buffer object
+	 * after allocation, as shmem will zero out the pages. The cachelines
+	 * need to be cleaned if the pages are going to be accessed with an
+	 * uncached CPU mapping.
+	 */
+	bool cleaned;
 };
 
 /**
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index f522a116c1b1..d8cc9e7d064e 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1249,6 +1249,11 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 
 	op_ctx->map.sgt = sgt;
 
+	if (bo->base.map_wc && !bo->cleaned) {
+		dma_sync_sgtable_for_device(vm->ptdev->base.dev, sgt, DMA_TO_DEVICE);
+		bo->cleaned = true;
+	}
+
 	preallocated_vm_bo = drm_gpuvm_bo_create(&vm->base, &bo->base.base);
 	if (!preallocated_vm_bo) {
 		if (!bo->base.base.import_attach)
-- 
2.25.1

