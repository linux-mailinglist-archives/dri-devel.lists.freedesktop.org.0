Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BCAABA06F
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 17:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE9610EB06;
	Fri, 16 May 2025 15:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="geu2eAou";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="geu2eAou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F40F10EB06
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 15:58:46 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=w+PYNTWu1787PdVHyNexkCCcKyflNjGMdMxg1uovxnJB7QAwwwaLyUbeBXBE55BfwxiG+pFWV7zpvjG41qgzAcF9bV6LMYBpHbTLkYP1JSIIwVKsjHDoGWfvc7L6V1NMo3a9QlwHkzwC0bXiocUSoNQKTjgw66UxR2iEbtd1Txn6mSZPcurI7R7Bv9qU+7Wynk8cFChJcypCmz+0Pe4qxBIQ3KLE66JUdPqbOIUkQDofmPtIyT5V7fsctrG1yIEi6Ae0cCBBTqS4VCE4cL9HqqhNt9935UCNNZuaKjolVCMemMAsRTvTEYIHywnvtOp+stswxW1MZWmFc3v/o4kU0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ml67F+u65lcFIrArOHCOeTijf0BiMVStJoyDsP/4V2Y=;
 b=OmJHkPO5HM0oYVShAD95z+9t/Zfo3bwpN3cftNuhqCvd+fdDavnWfCN92YqVguLcmyeFwYa3SeBo05q4fztsxSsnf3efRrQOm4ZeW1fKRqQPDq4LkAYROKnCDmw8bsCqXakDNoZxoA8OPz0Y26iKe0z5O5SKqCJT+5nxVYvsH6zMuMSjyyn2JSSNTsGFpbl93RJTNWNUYENIMl0AZAceMIeqdei8o45xOsfXvQ1hjQR7ZbRwZF6ZQfQteEL9Su9OB70cL9Rv4dcfwJC79eIcdnwKnZP4TxIF1SZlHy8ouFjuvrLrU3dQS4oD1eWsuE6NNqidxK8JR02ANdDPDadWzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ml67F+u65lcFIrArOHCOeTijf0BiMVStJoyDsP/4V2Y=;
 b=geu2eAouf9JY8wwDdNDD8WYZA5iABTH0Q1Giw5WoALq7SYlvyZ4SegzZnVWqv4VeaXHsBFdtlZnvPuQ1bA2/woxq7t++pu93LnZzaicun7IQ/5Sncj+FInvEZMRVZLqGVzJjDh/CCIOAVSy0Kv/twR53qlpY/Q7Y+Lh+wnWutBE=
Received: from AM0PR03CA0029.eurprd03.prod.outlook.com (2603:10a6:208:14::42)
 by DB4PR08MB8054.eurprd08.prod.outlook.com (2603:10a6:10:389::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 15:58:42 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:208:14:cafe::b1) by AM0PR03CA0029.outlook.office365.com
 (2603:10a6:208:14::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Fri,
 16 May 2025 15:58:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Fri, 16 May 2025 15:58:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kngt9HoRq0JpMfO1nRPKGkqCXFPbhCHHkVPH+qmzh6J9diqU5OI+iFVSH+ofHHt+Dt0i6j0PqosUXmR1OpUqYLlTZqpCZ0gP9n8V5Pabt5fpxVsyqnBOqJXDLCwVCCrNjGvls0XLAkN6ShKmxS3cwv4npxRCqRBMXtPYQ3wi/Rty3EaDaYZGnAtBAre9ux6ep99AU9l4wpU9+5dOelCKjDP7Th2sSp+cHnLqKwnH9wf9lxhxKOoCmjCR8z0H78pvsURus+Cpld1fWAwpavfbvetb83eOjsZ30La48NgjeLdimjfpuEUrcyaetX+hDPQaWtjmwadDnX7uQRNyIIkd3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ml67F+u65lcFIrArOHCOeTijf0BiMVStJoyDsP/4V2Y=;
 b=gXkoUCZ+QE8fYfgFBYjG0XhPK2hVfdjdlCcj4A2hf4MFUZURtamveBvI3xeEEwxlwOtboA2741+cUmKs77ehatM24Nej/y6hoayVry34lgCUw19SQq9ZxAZGCDQruNYCStXMZ3IBLzC9cZ70iB07pQonoSMPOmvEkE8YZaJQUNOLk8S3EWx/HHBtpYKItmy7vQ5xCFgIIVH06MrOza5Spc7JGEZnGXSprXJRadv7Fzef7f8p0rQV0lYZkAiJKqhw/lsPywS/bpKq9qe2MFJAHE8x9/2r4v6aVr0UbwZaBTXORtEckRkdTQj2b3Xn38FqipAFLVnDXGOf+yXz3Z6Y/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ml67F+u65lcFIrArOHCOeTijf0BiMVStJoyDsP/4V2Y=;
 b=geu2eAouf9JY8wwDdNDD8WYZA5iABTH0Q1Giw5WoALq7SYlvyZ4SegzZnVWqv4VeaXHsBFdtlZnvPuQ1bA2/woxq7t++pu93LnZzaicun7IQ/5Sncj+FInvEZMRVZLqGVzJjDh/CCIOAVSy0Kv/twR53qlpY/Q7Y+Lh+wnWutBE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU4PR08MB11174.eurprd08.prod.outlook.com (2603:10a6:10:577::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 15:58:09 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 15:58:09 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v4 3/7] drm/panthor: Add panthor perf initialization and
 termination
Date: Fri, 16 May 2025 16:49:37 +0100
Message-Id: <c53f9e012e148329a437013a812fc688e797a26b.1747148172.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1747148172.git.lukas.zapolskas@arm.com>
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0545.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::13) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|DU4PR08MB11174:EE_|AMS1EPF0000004D:EE_|DB4PR08MB8054:EE_
X-MS-Office365-Filtering-Correlation-Id: 68270f43-dc12-45a2-710a-08dd94928738
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?NZgiF1cTmL6WfXzeMvlTa2bJP6ea4AcOzaMroOC9k+4l8RJ6EacGf3UpW79x?=
 =?us-ascii?Q?xDlNBMMjNOAUhyv7YJGAGxzHhqj0yp0wWkBM9nLA5EB/4SKbOVvZ9DVwBbFv?=
 =?us-ascii?Q?flPAFMrm6iVTTnrB10DrgUWU41LM+qTcHMWwlrCscrkqGpdh5KyTbBjNX752?=
 =?us-ascii?Q?0rQok8YP2SrirQtjdBL4cmwGzYQSVx1xpebVgQkc421t3aZJRFSd4oDARdTn?=
 =?us-ascii?Q?8PtjyfMxPOyzP6SpwCAf3kmR8LSJ3s+RbrmBj/HswTW8v/d3u3n0aTslUYlH?=
 =?us-ascii?Q?MzW5kOPNoQqslVZZkCM/ZKKoz1qyPR+TZyWRT51uYAbYMSs2o7PmuF5r7tlA?=
 =?us-ascii?Q?ngeEmOB2KmkwZwRjseJRSbQSllA33l79Wn0ZpbYkATWm13zCwBoSj6lTDWU/?=
 =?us-ascii?Q?gdZhAwEUcaZXpVuuBEkRARAsxy7450BYFChwV0klc5jteOlz+Df3WkH35I5a?=
 =?us-ascii?Q?2M4FxuqWQSncAVHc0Qix/K3SKBfn81KE7M5KEDhgX0syYtBeE5mLxSrkky+u?=
 =?us-ascii?Q?w8qaUoaKfa7ZcHppBxxh0dXGqN+xdLCr28w6vw+EWLQ0gOFnlEoaCR8xbKIb?=
 =?us-ascii?Q?JK8Xsz7DAEFTpMoU2BW095Enk6UpISddr41BMSksV2oiZx1YgcvJCoh4UP5w?=
 =?us-ascii?Q?9o8iNWJ0AajRw2Yx7xkrsNCf4h+cIcVY8DYwN+EZ4KN25WyLO9m93Mc21VWa?=
 =?us-ascii?Q?+sfvvhjLWHT1HAx/FMKhBHt+9egBkoTy6yOg9b0lq9cTu3iv+oN7AKK3lIAX?=
 =?us-ascii?Q?DT7t/H5CnUjjJN2J2w/3B4dW4aM2buF6/p77B6UHCidoBX/Ho/cnVTPyS8iT?=
 =?us-ascii?Q?1aBrF6pNKr2d314SsS4yqYuDZPlHL9twkmycq1wSAUTlxn6h/QvnVmt1U0ea?=
 =?us-ascii?Q?PjBWnKRr7j4Oie9OqpkiO4rqLDZTJfn9RW28Dfnlfi5G2tApR/dKuMkdSLwa?=
 =?us-ascii?Q?vrYV9xirhTVuCFdBAK5jfpk3N1m3kA7d+xsGRiM07zvnIyqXaS9JKVsdlTbo?=
 =?us-ascii?Q?pSg+RsNwf7twsDW4UDxZXIqIMS6MvS3fkGRfumlyPu0ZmLXLGGszkBv6PRbp?=
 =?us-ascii?Q?lGwhqz0BGMiLIQ0kohvdzd4zy/uwxz7InuEA/qXgtDwnQHuXCb3RptLqClFz?=
 =?us-ascii?Q?1hVQMFLlHiZQsbp/CK2n4S+oiwEl9Xi6JJNdezvlEvuRTa8aAQSpRmoZswfo?=
 =?us-ascii?Q?yryA+n3gnPhNgjvR18QzDsBZLOPIUYbJMOzTBMTRgOLmAN0JF5eP5o3J1fvu?=
 =?us-ascii?Q?gqrLFowtKWvjOXeJSkbYSsqAP3AVbTOLWZYmA5ocCtxXI6m6TSlelTEkVBPa?=
 =?us-ascii?Q?nxhj6kVnicEr9pdEzVFHd4BmEVaEK7ive+wxJWPD4MA3fO+9XPuJ+r0DJI36?=
 =?us-ascii?Q?cbgiCw81qycpIz8U6JoDCk0fXoSFuMkkpiFZvPAl6lzAK7HW51qQr3/Y9bTQ?=
 =?us-ascii?Q?rNvPTOvy4Ks3qbjV6SOQeI7eurk8fBXu6hVypFbHEqi5EaxdmCHfSg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11174
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ed3d3578-d6e5-40c2-d414-08dd94927433
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|35042699022|82310400026|14060799003|36860700013|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xvgcIob+7LgonWm8NViVIQd7xKF3BrafcuLPMnhojsdrHAh35+ME5Rc6JT1H?=
 =?us-ascii?Q?VpKttlCLV6TiBO5VI5f8ovFWJo3gwegFKcGXmvdoUKBUB8/QjuolDwUBH68m?=
 =?us-ascii?Q?GRjIOL7+o9EMsn1nUhMFmJ+sGtBOVpULpxCQyrwp7PVspLQHh67LpAPkuARi?=
 =?us-ascii?Q?FWIWUDPDbsLiL4M/7qBeozF3hAbhCgb+byH88nXgIf4TDE9V3ab+9v+VJdVl?=
 =?us-ascii?Q?Ln4rvhiqrXh4gHwCdpwb4nI1aAI3to3qxNQX7b8mUPRtnztB6ractC3WUBpk?=
 =?us-ascii?Q?yvEMsEM0MrBfXBpWJMgME3SNCN53R4y0Gwl2PBfX35nnD1tXe1GF06qjrGtD?=
 =?us-ascii?Q?EcXoWDJuoG+l8E8XMugi0qnd6EJyQ1JNnx8Jm8OFKiV7V6FHxDwi5ww9fCQR?=
 =?us-ascii?Q?+gHTLUYPdT9p5Y08d7ElZGTl59vx/77CSHE/WLTzMTCnEb3OjnxiSyJOx3r3?=
 =?us-ascii?Q?ZSA2oVMLK5viT4yVQxFfuDiPSxJrtlCVfqDaLmVvobMqYlKqmtT/BkkXHZqj?=
 =?us-ascii?Q?gW1Xn81ERwU6s6T30FF0r51BnOrcc7BFiGcLljxN4b+w6Z2ROI6IZppunf+Q?=
 =?us-ascii?Q?sMFPyybknJaOPSXPx2gB46VmdYWaIUcYN14nTNnNCTeHKlnSDtkOb5bDMi07?=
 =?us-ascii?Q?gknMWZgh8jGjlVP0Uzk9f4xqnaBvnyPIo/xbTJ143Z7i8oFeS5DM4yPlAR2o?=
 =?us-ascii?Q?x9z6ZEwKtfTiZVg+BYID84lEz4mS8CJypU/tqQJcg/pJYqSepYGlkcnCvXsn?=
 =?us-ascii?Q?c5pUYl2yf54GYIplGJrvJgChymioY6m4K4TZfD4NHu8+frmGVSt8vwCriMmN?=
 =?us-ascii?Q?frFU8J3l+17EWMnGg2qDM5NxMoIUg9PfxspmsLKFiOWxs5XZOeSgLEW/8bTA?=
 =?us-ascii?Q?k0cbrtyhY080kobmV/APqmc7lY5f/LW+3nmFGRn/b+c3NEibJLovyV37E4DA?=
 =?us-ascii?Q?+ggaNZETUUj5n2dkoLlEcJf7Gc7uNw5AnuYTvrJmi+xmIyw0nmHKnW/GYvob?=
 =?us-ascii?Q?nKKpiyi70f7CKsZg9NqIamg3kKrLgrgcQHknrbWsuB+UeXDR8h0tBdvGylqU?=
 =?us-ascii?Q?pAb5ugvpLVYBZVpMPz2kcqFaaqgEE+6Z2HyX/oLH3nnr5vJfBKnCa39inQ8H?=
 =?us-ascii?Q?UZ7UzzOn8UysAhmsuCmRXbHkuMTJ/Bbpqhzs+ZH5g5dTYv2hc6LzSZkAmHiD?=
 =?us-ascii?Q?2I8ecwDDy8pVVH8/7pxAD/fjDtUdusyMZitBjx7X1YD79BGYMZaJVEuJPSXw?=
 =?us-ascii?Q?x37BYprlLvjtpc1o5JEvD3h3yGbXs/G4tGMXDyzB37Z/e/5IsQyZgsIhK2GS?=
 =?us-ascii?Q?CajPad2ThJq0ELNy6R2yfQtxr1zUd1T/GgsEn6jcIMOvc5gSwzn8NLtyWTWk?=
 =?us-ascii?Q?z3pra7YePCmCHiq1/HJU0WaZ4Forteae547gt9mk28YPA9AqNBP1nFLr2AbJ?=
 =?us-ascii?Q?HpJ5FjkX2AwdJauLBoUbpL6D+DAL8oIJggI28mq5scU/nud/8ac+CM58m6t1?=
 =?us-ascii?Q?7lSZA5ozaP9pXkeNR94B5VmC0IHieQJ5EhmT22TDxuxbjWDSxchnVvh4YQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(35042699022)(82310400026)(14060799003)(36860700013)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 15:58:41.0302 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68270f43-dc12-45a2-710a-08dd94928738
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8054
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

Added the panthor_perf system initialization and unplug code to allow
for the handling of userspace sessions to be added in follow-up
patches.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  2 +
 drivers/gpu/drm/panthor/panthor_device.h |  5 +-
 drivers/gpu/drm/panthor/panthor_perf.c   | 62 +++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_perf.h   |  1 +
 4 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 76b4cf3dc391..7ac985d44655 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -98,6 +98,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
 	/* Now, try to cleanly shutdown the GPU before the device resources
 	 * get reclaimed.
 	 */
+	panthor_perf_unplug(ptdev);
 	panthor_sched_unplug(ptdev);
 	panthor_fw_unplug(ptdev);
 	panthor_mmu_unplug(ptdev);
@@ -277,6 +278,7 @@ int panthor_device_init(struct panthor_device *ptdev)

 err_disable_autosuspend:
 	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
+	panthor_perf_unplug(ptdev);
 	panthor_sched_unplug(ptdev);

 err_unplug_fw:
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 657ccc39568c..818c4d96d448 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -27,7 +27,7 @@ struct panthor_heap_pool;
 struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
-struct panthor_perfcnt;
+struct panthor_perf;
 struct panthor_vm;
 struct panthor_vm_pool;

@@ -138,6 +138,9 @@ struct panthor_device {
 	/** @devfreq: Device frequency scaling management data. */
 	struct panthor_devfreq *devfreq;

+	/** @perf: Performance counter management data. */
+	struct panthor_perf *perf;
+
 	/** @unplug: Device unplug related fields. */
 	struct {
 		/** @lock: Lock used to serialize unplug operations. */
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index 66e9a197ac1f..9365ce9fed04 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -9,6 +9,19 @@
 #include "panthor_fw.h"
 #include "panthor_perf.h"

+struct panthor_perf {
+	/** @next_session: The ID of the next session. */
+	u32 next_session;
+
+	/** @session_range: The number of sessions supported at a time. */
+	struct xa_limit session_range;
+
+	/**
+	 * @sessions: Global map of sessions, accessed by their ID.
+	 */
+	struct xarray sessions;
+};
+
 struct panthor_perf_counter_block {
 	struct drm_panthor_perf_block_header header;
 	u64 counters[];
@@ -63,14 +76,61 @@ static void panthor_perf_info_init(struct panthor_device *ptdev)
  * panthor_perf_init - Initialize the performance counter subsystem.
  * @ptdev: Panthor device
  *
+ * The performance counters require the FW interface to be available to setup the
+ * sampling ringbuffers, so this must be called only after FW is initialized.
+ *
  * Return: 0 on success, negative error code on failure.
  */
 int panthor_perf_init(struct panthor_device *ptdev)
 {
+	struct panthor_perf *perf __free(kfree) = NULL;
+	int ret = 0;
+
 	if (!ptdev)
 		return -EINVAL;

 	panthor_perf_info_init(ptdev);

-	return 0;
+	perf = kzalloc(sizeof(*perf), GFP_KERNEL);
+	if (ZERO_OR_NULL_PTR(perf))
+		return -ENOMEM;
+
+	xa_init_flags(&perf->sessions, XA_FLAGS_ALLOC);
+
+	perf->session_range = (struct xa_limit) {
+		.min = 0,
+		.max = 1,
+	};
+
+	drm_info(&ptdev->base, "Performance counter subsystem initialized");
+
+	ptdev->perf = no_free_ptr(perf);
+
+	return ret;
+}
+
+/**
+ * panthor_perf_unplug - Terminate the performance counter subsystem.
+ * @ptdev: Panthor device.
+ *
+ * This function will terminate the performance counter control structures and any remaining
+ * sessions, after waiting for any pending interrupts.
+ */
+void panthor_perf_unplug(struct panthor_device *ptdev)
+{
+	struct panthor_perf *perf = ptdev->perf;
+
+	if (!perf)
+		return;
+
+	if (!xa_empty(&perf->sessions)) {
+		drm_err(&ptdev->base,
+			"Performance counter sessions active when unplugging the driver!");
+	}
+
+	xa_destroy(&perf->sessions);
+
+	kfree(ptdev->perf);
+
+	ptdev->perf = NULL;
 }
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
index 3c32c24c164c..e4805727b9e7 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.h
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -10,6 +10,7 @@
 struct panthor_device;

 int panthor_perf_init(struct panthor_device *ptdev);
+void panthor_perf_unplug(struct panthor_device *ptdev);

 #endif /* __PANTHOR_PERF_H__ */

--
2.33.0.dirty

