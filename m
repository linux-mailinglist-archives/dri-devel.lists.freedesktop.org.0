Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095AEB1DBAB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 18:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E2D10E893;
	Thu,  7 Aug 2025 16:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="d6Pc9UnH";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="d6Pc9UnH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013052.outbound.protection.outlook.com [40.107.159.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C171A10E892
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 16:28:00 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YjiWWAv8mVEuyZua5l0dVK6rGVoZp03HRvJDHOarbAQG2jLEHAN9LEuuoe2VASWgf4n8KVwGopJfV1RHL91iQP3TcPbZP8NVLfgapjkPHOHdmSLnVcx9hf0IvHmCdAc9ddyLjG5plSQkO5LauYxOVWfj+2E48vF42ekXbE66FhYDxm6/FVAhkW8OmfsBDbJVAd1ncY7agNq59y7Sy10M3VAFDylYi1TI6FEtFst2EA6KaIfA5liyOSv/LuaQjrvY7JkZcj81iVIzvJgJUK/dlOr2wyEN2J5OJ1zXfR3o0DKwA2boLE4Z4VGkjKt2acQKErEdqwg6jhaExD3dmmSnPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUs28UoSJOnec1LakISrYkPOT7k6uFeYEAAL0w78y2U=;
 b=Ud8M9Pi3LxN4boJdNeUW+/G+VVeopJ+kjujJpQAhH8uoxyX6Nijj11sAyNgzZEx5kPA4YORFbmTAGOuURWKp9zfZYFOqBFzOAqZwCjYZenbCI+NQQpkDAbjfULJeg7BURKrlcy5bkBkrk2/w6VLzWOuHSO1NPnz7F0W4YlqEZPHZMCLer5XocE+fZTiyrs+sYOXLnBt/p88bTqkgu70rUFuWjinE5cjTZboFvKzXPURA/ZOgYpN6gtn68XaH28Ib9hQkUMtheEA2joz/8R1QrRFpqJlGVwuBYwDs2lSjPu7GVnr+GvOWlYhFJ6RerDV9HgUVomUNCFT2n3VsPFFfcg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUs28UoSJOnec1LakISrYkPOT7k6uFeYEAAL0w78y2U=;
 b=d6Pc9UnHe32PKe4PV1ealuuOY+MFot5oYfKLpH73Q3L6KbDwigPc2ruzPDSLHQVLplHnA25NHrZ2pHQyRRdVBu0VrY8KXY9zfxGSEQ/O2p3Itrs4pbi9i5HzvWMgjxlvRdaXQh3Zfxu4z3yoegWTA5BMP8fOSRlJEdNQZ/8fD5I=
Received: from AM8P251CA0013.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::18)
 by DU0PR08MB9201.eurprd08.prod.outlook.com (2603:10a6:10:415::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 16:27:56 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::c8) by AM8P251CA0013.outlook.office365.com
 (2603:10a6:20b:21b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.16 via Frontend Transport; Thu,
 7 Aug 2025 16:27:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Thu, 7 Aug 2025 16:27:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZ00DAfa3AHBLgnsZkhdwEJxqaOClTSF1X2x0m/wFyWwccgcKXy1CdqgHi4kj7HMS6GHRynPnCVtgpmwA4ggEiQ/KLAogQmn3S6lzFOVLAWSTLSeHYOC7ZOgKCi+3Si5mHPo1Nd2RbGqqMjBeaWZWsxmVXh/N0o1fpdovkdAkeMCVMbbP52wd2KDIfvFqHIMvboAe4Kc09/tOFyMg3Zxjk1MMtEG6EnD4dKo1qgKl/v0SNgX2jNsU76I2hPO7SOVD4t8oR1hp2Xt0wp7oP7IbykSIrKoSOR7B2M7bg22jAGmYJeH20qz1WN6K8uZw/D/EoobkvfeMI08/miJWLxksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUs28UoSJOnec1LakISrYkPOT7k6uFeYEAAL0w78y2U=;
 b=vqUshTLfjP6k4ExEzVRdxbxpESSAQHSsNG7MLE1ezKVvQ14f6WHGeJoj1Zp0Mo0SvMi9Yc+QTzfTYTKFmQxF+FyWk5n29TNVSQm/tYEJfZqpKTXQSecly1btJ3Yaa+5jba9Pst762Yb1p9K8ov+Fzp+i7B1itPxOZlQfixNcZIXv8ifjY+QUFiTkcsqXvtqhCT1SxISwpvuizY/j9QBqeYh4QrU8LzQNHNuTOz8qFPySH2GVN2AUimpQ6aWlx91J2o/aX4sCrrv52ROdUCVZV2bjxpKF2DMKqcWW0bFlXEtiwWuKnvWWL4gyznakaNu6mkU1/jqTHDbGeNZuecUNHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUs28UoSJOnec1LakISrYkPOT7k6uFeYEAAL0w78y2U=;
 b=d6Pc9UnHe32PKe4PV1ealuuOY+MFot5oYfKLpH73Q3L6KbDwigPc2ruzPDSLHQVLplHnA25NHrZ2pHQyRRdVBu0VrY8KXY9zfxGSEQ/O2p3Itrs4pbi9i5HzvWMgjxlvRdaXQh3Zfxu4z3yoegWTA5BMP8fOSRlJEdNQZ/8fD5I=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB9443.eurprd08.prod.outlook.com
 (2603:10a6:10:45b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 16:27:23 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.9009.016; Thu, 7 Aug 2025
 16:27:23 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v9 7/7] drm/panthor: Add support for Mali-Gx20 and Mali-Gx25
 GPUs
Date: Thu,  7 Aug 2025 17:26:33 +0100
Message-ID: <20250807162633.3666310-8-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807162633.3666310-1-karunika.choo@arm.com>
References: <20250807162633.3666310-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0129.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::8) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB9443:EE_|AM3PEPF0000A78E:EE_|DU0PR08MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: fe910b80-ffcb-4032-2a01-08ddd5cf5d8c
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?LT9HTqCo1mYs3Y8aA/pGYHtcutU4j52oED0i3f2AeBIAbEQTxEFJE5jHQQwd?=
 =?us-ascii?Q?UlyXtt92to4jptYcCE8VRaVdxG348i/FTNPwLHtfZ3auaG8nIcpLHUFNCsVh?=
 =?us-ascii?Q?JSqd80vRZA8yVaLtTpLQ60pQ3T2HJpafNNcpZrRpJ9LfiT+C4zeqzVwwsXXQ?=
 =?us-ascii?Q?fd8ZuyrZV6D/T+pHPxXOXG2ivT6yg1AJPXlXmGdlNU02VbIQZQxREexDL1QE?=
 =?us-ascii?Q?IwrtS4exCX6/TBLOYby6AXHK1xJJB6/QXerI4TBxs0ngWy6MahtG0txaZHgP?=
 =?us-ascii?Q?u9QseVS3tOQWK7P2UmPAkYJinI1BptHaEdwKl00iF7kRbkkPlaAfD6A0Nfo4?=
 =?us-ascii?Q?AcYERQx6aY+HBfTcfmrhuPOwDfjLbwGhJeouVuReZYYFWlfZUynfPjY4qDC5?=
 =?us-ascii?Q?yWMz3ipdIIok4oQ8Oh+/wx/BS3dkGwHJl9zr1b9B1MtOym2GenO/lawwBAvK?=
 =?us-ascii?Q?IiVLMoizJY6Ed7Ox9dzf+Lrf+xq51Z6bogrIweGtNHzF/atnjupC51kZuIsz?=
 =?us-ascii?Q?ILU1qVuP59e1qx4BfNqXleEP94UUfJmm+XL6XCKuFeb2jdrI/uqHC3zHH9f+?=
 =?us-ascii?Q?aIDrF1Jx73CvRcpyV1GNsAKIlYoAcrwx2h74KOfNR5lWEi/zdwl4+3qvNLtN?=
 =?us-ascii?Q?jTvAj+YcNm7mWK+xxRin/5wPiRh9UrA4H8eIjPrOq1bLMRXeQZRiRXrUq5ug?=
 =?us-ascii?Q?dcMvGFS/INaTPA/cyghvFq45CxZtTEJ86HxotfFhdzDdJRhhfKYd0bE1Tpa3?=
 =?us-ascii?Q?9/IjdsuRGnwhvF/8H/1nOc5xWuaHGg0bA9da6YIsEbwa69Abtn8AzIT/pRnA?=
 =?us-ascii?Q?lB3dDI/Sz1ne7jBXwvpL+eYAIfbHtD+aGssC+tyfWCF1OywyQfF46urizCQd?=
 =?us-ascii?Q?HHUGqq6NvkiX0BOKkg3OQatCVsbf6RsuhcgzhngBuMXuC4t15IsQ3S61mCWi?=
 =?us-ascii?Q?J7XZWqQHItS03Nwopbs7D+crB5cMD/kjrt1FKNcr6+zVx9JGsAUYZusqRD1T?=
 =?us-ascii?Q?mwthJa9jufeA5FNs6pFf4YFdx5Q+TkpryJAKXyHglcBcJ5d41MR6Jdh4r9oM?=
 =?us-ascii?Q?Qpwj2bMbCKXgLXUx7m/c9fHjU0LpNHeLuzZPGXBCUKPkdnNexVc0LZpOcjvv?=
 =?us-ascii?Q?WWEJJxiHJcFaOmN2eIeNAdVo1scYDbWdwDiq9Gv2YMaX+kwP7s89MOwFKzux?=
 =?us-ascii?Q?yIJJEz2XhBGs0BvQK3VLC1h1dyzSC1fID2060FAKcowWa3uwqybr3zIQum6B?=
 =?us-ascii?Q?LmwT1Z9EvBm28WlaIk36RBomoWU9xNrV7u88BcMyMbTChkR2UGkch4wpfAXW?=
 =?us-ascii?Q?qTup/Aj5+HhI5oyA9gxVxbD0HNOZ8OkFTNOVg7jHPw9ZeN2ZXbGY63tuzvDk?=
 =?us-ascii?Q?wutbeEId7Rd4uTdTsiBscLsbCIkWPMAvNvv14uUk7MYEdrIbVkfJ9hOqBF8b?=
 =?us-ascii?Q?mZkytuTLBl4=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9443
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fb8cfa2c-9e64-4f7b-b949-08ddd5cf4a38
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|35042699022|376014|82310400026|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yB1v4R9dvQoQtFJ1don8WLfL5J9B9aaAQYyfmhhWQxqVFBU/kPJnDY3sFUhb?=
 =?us-ascii?Q?7aTSK7JR3h5e6dnblodgMnuNsa775OH0mvGrTTIkXXXBBopcIhK7LJDZB06x?=
 =?us-ascii?Q?ZWFO/fQVRgbQTNk7NbVkCywWj949xhWJaBR10zYQvNvmqE0u60QlIQn/Jd8u?=
 =?us-ascii?Q?S/hcR7GYV5SlLwyyQpUQ7kcGdaZa9f/4bD60xJCCpMTzw/O+6F9t5e36kXb4?=
 =?us-ascii?Q?2OCc7o/k2CKgZleMuFYzPIdU7PAf62uSAURJEtdimbeTBSy/gtlEIo3yqbeS?=
 =?us-ascii?Q?6BcYre6mSoBV6uhs4t9KYrLg55jQkBm1Wz5PjBtXmJJbp70FqL8/fFxkWx+R?=
 =?us-ascii?Q?j9Hd9sSY8m0OiugdVptGfIEiOrKf+pD6edEnaJvAQMNmNvc4OqZhF5MKIkNB?=
 =?us-ascii?Q?eqo4ORSCiKWOMd6GUvyi1IkLE6jIQQDuQxdQnQO+ggRTMN5mgqtlBJfiyO2+?=
 =?us-ascii?Q?f/ZwyhfEM/Pi+EVGd6TtXNkVnxVtthjxKY3fKvNKCGmM8jArj/ErfHYIsgyI?=
 =?us-ascii?Q?hm8nQaO+RoZVmqdBt3iL3o1u1SLyt+lhVjD4pLQC863kiQGZIRI3BI3umVz6?=
 =?us-ascii?Q?sH30b/CYWr/t9eWGWFOQG02CKKj11Yx+SBZ8vQyBGqdn4emZ3T1ZAh824/Jf?=
 =?us-ascii?Q?DFGbBSYtSdSCsyF52k1U5VeoLB7D5/vr5UKJQwiDozwbZzLwA8GvHsGH4gCX?=
 =?us-ascii?Q?GPt0iPHhFIKIrEM+U9+s+G6DSDuhaYOMU7AlJ8LBqHSeZZ7MCa4zLheRD38e?=
 =?us-ascii?Q?8rbGMhDaeq4vARN67D8sXuCjZCuM8sD6Wn0EGrZSQgk9dRT8jsXYGSx0xnv1?=
 =?us-ascii?Q?j80QrE5BLcrtTIRjvsrbhk/tAjvsIMrhAAWuf8VBshhEFeLPod69ghQbOzmD?=
 =?us-ascii?Q?/kUnYSdFGLJrENM7vEr+RakHSNvdBPGOohjSrD/pBWmUnlp2gCPs+ljK5yiV?=
 =?us-ascii?Q?6cgq/DWBPzBs/sY9l+8OFkNW09AWWmRQFcnKpFU5xrOh/rdKOp9hUsX9FU36?=
 =?us-ascii?Q?6wJU+eLRl8oxpyNK7f9IjHSwdGkQ0fx5x/szp2Fez2pYHf7BER2Yaa2Obqpn?=
 =?us-ascii?Q?E2yqrBVY2g9k61Y2IayVd8+0hgP7n4e1oSngxyxN/0Rrqg9B/f/GxSNl2Gwb?=
 =?us-ascii?Q?c4yidCvzKLQarOV3tIbyWfvsnTjV089K5FKh0+1cNlJiVBnHhIY1rWFSqoID?=
 =?us-ascii?Q?rxhy5BHeWXEV0YwJII4SX6DwRpmGL4mpUdJX18JONLKJhsZS5Tp9xl+KpyAu?=
 =?us-ascii?Q?+C4JB3yeeIyv6NTVLN0TEwwEkVEAM+0IbBv/frY4ew/YT7FdIqSA2mtIMeTv?=
 =?us-ascii?Q?XXgzO6jZd0AwuJc+30d0TT0LduCPK8Ts9HxTkS1CYaEHSLA6HgSF8hu+8z0q?=
 =?us-ascii?Q?ylqDA1+qyNSWi93Pj9cKIJrMg68PVrvdyuA3humyn2+Gb6idm9GRFxaBRxtg?=
 =?us-ascii?Q?XxTZdNdzFqsH0YXFC5pLnuJ5UhNx3UUzI3UI2J3QZBYIIFQbIF1tNS/wlK6q?=
 =?us-ascii?Q?ErIyEVX+62ypsEQG7COp5SqdlYwp+lLNWIT9?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(35042699022)(376014)(82310400026)(36860700013)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 16:27:55.9972 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe910b80-ffcb-4032-2a01-08ddd5cf5d8c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9201
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

This patch adds firmware binary and GPU model naming support for
Mali-Gx20 and Mali-Gx25 GPUs.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c |  2 ++
 drivers/gpu/drm/panthor/panthor_hw.c | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index fa6e0b48a0b2..9bf06e55eaee 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1405,3 +1405,5 @@ MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 8c041e1074a1..4f2858114e5e 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -35,6 +35,24 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 		fallthrough;
 	case GPU_PROD_ID_MAKE(11, 3):
 		return "Mali-G615";
+	case GPU_PROD_ID_MAKE(12, 0):
+		if (shader_core_count >= 10 && ray_intersection)
+			return "Mali-G720-Immortalis";
+		else if (shader_core_count >= 6)
+			return "Mali-G720";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(12, 1):
+		return "Mali-G620";
+	case GPU_PROD_ID_MAKE(13, 0):
+		if (shader_core_count >= 10 && ray_intersection)
+			return "Mali-G925-Immortalis";
+		else if (shader_core_count >= 6)
+			return "Mali-G725";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(13, 1):
+		return "Mali-G625";
 	}
 
 	return "(Unknown Mali GPU)";
-- 
2.49.0

