Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D3EACB296
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B37310E0B1;
	Mon,  2 Jun 2025 14:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="IFycN3Pv";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IFycN3Pv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012020.outbound.protection.outlook.com [52.101.71.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0EF10E0B1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:33:43 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SqVhgGv5eOFeD3kVc6y21vWiHCMBpc0FWoWTfSFoNlHal1lxo0Hf+g64MT+hkK31zVNLCJ8k/ZPiS3qJMfSXptxbkVeuM7F+pdrABApNIo11Was3PIN/EDBov3a49TqNdyAUODC1+1w4uIvDBLIn3WkYSlMLX0NNyjuOzmBgskRSzNsH6EggWNIg22XuCK2T2RL8+XwstjpRvJDc2+8sRvlBl2oP61ue0dksqU3D045hFSfyLeK5nlnjjhP6Mw+7s2GoXChUBlLP33YoiXXjfYHL9OPSlQlBi/9uC81dUUCq5KrwUqPDwCasXu/K5AcPb7lGnXqkP6Jh+u3RN7zioA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPyN0IB1fwWZBDAjZTiK5ynQ4xSdQsNhwyrSUci/32M=;
 b=r5VluDCckQPzMGwZXI/7CPiB+WTxsapglLp1fyX38wo9W3g86VeFe2dyF4+vePSQ5o2ykktzm8ElKnd+vBCe7aOKweRJPsUjcFkybpkotKTbMW/F6NUFVOJADge1fDX/3RuovV50FqYBp7cz+rWYQNM6VZCoT1CUK+uk1SXvtzzrGQbDI1aItHZfhWsm54qdC42F3DuuF2FETDfASVTrTV+0pzFL65liOSZyp5es8fuO9BJTPTHAcHsoBUyA2rb5t+9czDegMFKWOn0OGMgOxFl7K0JzPQ8oXZZ07j+W21lue1R9AMfRXGvk01OKLrv/1LHWxhzb3JjU/UHhwchQXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPyN0IB1fwWZBDAjZTiK5ynQ4xSdQsNhwyrSUci/32M=;
 b=IFycN3PvRB0G9rSt0ux/mehrQa7yF25c5XwwxoF95UQDjND6EhM+/z9VlsHyG0E2CPvUJk8ZC6nN3v65z4Nv+9ZX2CcyL4eo6hiORpbDuLEeTQb/pJKbJYlJ8JykiEQvQ1+PXNBjJJVwmZJFnLmugwZkdMRQNtpsWYMV8SsP0g0=
Received: from PA7P264CA0144.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:377::12)
 by DB9PR08MB7534.eurprd08.prod.outlook.com (2603:10a6:10:302::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 14:33:35 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:102:377:cafe::25) by PA7P264CA0144.outlook.office365.com
 (2603:10a6:102:377::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.31 via Frontend Transport; Mon,
 2 Jun 2025 14:33:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:33:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NeMuwGIvkMfglAdyLrrgUo3S64CexIeyAE9iIMOwSpkavHW3C9h6itd3DhRr69EYYf4k19NMS8At/2tqLn+TgZXoJRMKuXGyDs7mz1njtDVc4BEZEQfM5eXAOx+vp3fYJbE9TfNH5KNHod4RQx8JTMwDD5j/dOVo0IR69WH5g/FtJKcTRZd1KZJ4eqR6f7pAwe+WqyMkTbjv1F0PJUYI4w2CjhzSStSZJ8kcOAcW0d0guwZWODBz7awUScQzKVbE+yw5mRLEQlR/TK4tTv/5V0DMC0zkwHCSB4zfDgnDnk+B38B8bWg5DlFQr7Fs0ghIJfoP7DKfXbzDLDwztip2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPyN0IB1fwWZBDAjZTiK5ynQ4xSdQsNhwyrSUci/32M=;
 b=WNTXjlN6UmO7AoBTtEz5WIUNLYsoUZD6dq4anYsgzRlv7zq1EvBzTCPbqrwHm1kqfhI6QIti4nDaEjd/vFt1l42Grasn9pIqAcUbcm5xXGQ8CmrECZHRSL+4zY8IIjc7Cub+E2mhIIbkL5kEDK9SEEGRjQsNIWttoKfXCck887oMz98uP+nTCjVHeWGWDQ0ia9XcH3i1GnlKFOhKYyABJe5SBX1Giuya84qqzQRLcDQ0A1vB524wU2a4xwCxnXGLlVo5a9SCa0ZrIF/Ax3PgHVuasohdgXYu0c0o3BROH48XT4TLbRGL0T075dDDfmgcBV3ylos4Ac/4s9WGh7VLsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPyN0IB1fwWZBDAjZTiK5ynQ4xSdQsNhwyrSUci/32M=;
 b=IFycN3PvRB0G9rSt0ux/mehrQa7yF25c5XwwxoF95UQDjND6EhM+/z9VlsHyG0E2CPvUJk8ZC6nN3v65z4Nv+9ZX2CcyL4eo6hiORpbDuLEeTQb/pJKbJYlJ8JykiEQvQ1+PXNBjJJVwmZJFnLmugwZkdMRQNtpsWYMV8SsP0g0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB10809.eurprd08.prod.outlook.com
 (2603:10a6:150:158::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:32:52 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:32:52 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/7] drm/panthor: Add GPU specific initialization framework
Date: Mon,  2 Jun 2025 15:32:09 +0100
Message-ID: <20250602143216.2621881-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602143216.2621881-1-karunika.choo@arm.com>
References: <20250602143216.2621881-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0069.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::46) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GVXPR08MB10809:EE_|AMS1EPF0000004E:EE_|DB9PR08MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad48aa3-021b-40fb-bdb7-08dda1e27452
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?d9VKkWafBEETni0DXLykNEpmI+BOzw3CNIwaNiT1DYoOKLRKpsIxEjwn3+Gx?=
 =?us-ascii?Q?K1iR5WILfSrho7D+q+WB9LUNs7zxbsgH9s/bJWsy08z1GPvBHK0kfoDUbRcT?=
 =?us-ascii?Q?O2XeuMOo2oD/okqNouU8QGxD4/GpuGcg0gQvteFmbcykJH/UHXRYCJbXDj4l?=
 =?us-ascii?Q?jGx1TGyo6gDNY0fAOt7/wikoTHn5WKABi2fcSs7282xGDws4YO4EU0xgR8bq?=
 =?us-ascii?Q?u5P0W8qWEu0mjFuJUz2/OdAD92pQ3XpGy4vhtYN0jkWy8U5hHl7yT2rja283?=
 =?us-ascii?Q?5bF4IXmWr3mDzu+LoKu3yOFYbkXJQ6K0BryQO4eyXI8bXJG+GVa3B/TD0Uo9?=
 =?us-ascii?Q?KhULqLY8k8Kl3lJQRbjV3cqNTQUjeLb6hwSfUi+XpZUG77MA7Xla7Kpe1vy9?=
 =?us-ascii?Q?Egn+SR+TxEhJA+1z75Sa0bVfPGhGCmQwrx/bYGKq/tBUyMA3zeG4h+ljX/lZ?=
 =?us-ascii?Q?1N9fg3OZ9u5BXfCekLF2qzp9OQNGyh0P2ExiH+ioo5q+ZEkigsHbAmWNzKvX?=
 =?us-ascii?Q?XKPcmSnOdtFvoGRqiXjMNvI7dBOoxqbr5WeTL5bmlPNIFBLTiv8N4zNCIhRR?=
 =?us-ascii?Q?+3GEt5xdzJTgO4dlQgJSnS4Enz2PQpNwKGvU7XXoOjwwNH+7bUv66ogaVyz7?=
 =?us-ascii?Q?e/dGRYrFkyd2EH83dT32syTFnfDeYs3qCZyHWJ0td4VxbIZt3uTIa2+31fhm?=
 =?us-ascii?Q?kOz6BnofDt9re/nK3yOhkHgUg2MGamLi9j86keUVyCKBiOr93rM0iyuhTU3g?=
 =?us-ascii?Q?hCZDXXA+bF0El0KLveCnJqwkLhZZ5tELQoZWRVN91GRneLyNqtzhpKNq3aFi?=
 =?us-ascii?Q?JZNcXT1z4KrBvDWrhN6B4+VYFyfl/QIi28yYvKCLdlltitUhHG0aUB/Wm5j4?=
 =?us-ascii?Q?ZmKUeLqMfiFZCgbi1yzMJNGLP0EqbCKRfdvfEYfbXJS8aGrDCQsFJgdIVJNE?=
 =?us-ascii?Q?yOBbEOUFEL02ocUVrd8iFk+GXC/rtjHJCTpCv4L+W/7siwsyC6NA2j+UxtcA?=
 =?us-ascii?Q?0Q6CK6DGJHnDncFWMoap5shuLHUybZU4+FcfnvzDMVQe3aIrf85kevi+83CC?=
 =?us-ascii?Q?vEWP9U7d5jlnq+QS9LQ/PHsVyovTZlpjA5oT3pfALxBMCgVMqksWWp3oLXr5?=
 =?us-ascii?Q?fOOtSraD36EZNmYAYI5Rj743LnNGJGyYFg70YbibSV5acqg8FRHZzRprhi1m?=
 =?us-ascii?Q?8mFnjvFMtvwfCCS69bvwPlHxZqwNyMIeR3Zn28Lo2lgyBkxT/XSw262ztJdF?=
 =?us-ascii?Q?svFdLXFYkybHQzzqCwCxDRAiOX7U5YtsjS9JOUWMcAsacOcRrghktZjBfAZu?=
 =?us-ascii?Q?HfAtw43643dphZ8/CbfZoaoi1RuPe0BvL3CfUzHZhnQQXxI+0s5kegAHdisa?=
 =?us-ascii?Q?jJH0ixVk7s1TUSh7A+vflPiZo29EPY1p9giRA4U9WmSLCNqd0Jj4gwNn/jus?=
 =?us-ascii?Q?ZYrDdLzH9Mw=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10809
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 66d0fa9c-92cf-4ce4-2290-08dda1e25b5e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|14060799003|36860700013|35042699022|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yXiElzCg2x4jrAJ3+hSuc3EhDTc6Lf/PWsZiTpXE65lMpRg1RwOjeTNuoLGi?=
 =?us-ascii?Q?JpKN/4Eplf+bcGOWSIJctd9Xh0yf+4onyAucpuV3s1SNu6sPTsGIXuyKbihM?=
 =?us-ascii?Q?8f83u9e39FygV/ohZ5mPvFBSaowVDEBYbTC4QLBVPesSwQmQ01AijmTcOXLv?=
 =?us-ascii?Q?QjVgARdit9VtCFPmSKM2CCXe8Y/qFNpUQelICdchXkSittXpk73+j+ame7o2?=
 =?us-ascii?Q?wrSfXb3eDDKd61vqx2n3VzAkJIu/FvbCf2OaRfO9cMKC532XHUfn1oegmZTu?=
 =?us-ascii?Q?ubHQ3rX/62tW0Ema5N71at8lZwe/57tC0l+Z1soaPexhSeyWrvdMjHFlytfI?=
 =?us-ascii?Q?Bl7a+S87APkbYQXckYuLpif1exj44XoEvsTsFaiDs69AUovY366ilD72WqsK?=
 =?us-ascii?Q?zIHOQJS5eKMPLpji6BUf1i+QXWi7e2LrYMTZMaNkJf4s7oa+oKaRivFlVBsy?=
 =?us-ascii?Q?z04SGx4svhEfq416QVA8HD59HREtwsjxqYh+mPEhhNbR84HP9Myn2R/ygWPO?=
 =?us-ascii?Q?bgi1jIit712n2CcWHkMSAWSfe6S8exWZqle8qmtxqlEuSNCKnG4G0wGq+PuZ?=
 =?us-ascii?Q?ay4iIfIM79+0Aia8bb1t6hpKVf+6hEu6CFmA9LnMj/9cnioe7k5nT4Gq1d4+?=
 =?us-ascii?Q?kpf7RQSF7TCtZ/Jk8yWUiyYU3jCS/lBNk2NWijp+sffUdc8mBcRCpoJAS5I1?=
 =?us-ascii?Q?ywBeRkQwAZAFJcZMw/O98Dw8DWQxVdziZFfHRegeogIpdHC4lWqG0yU9eZEd?=
 =?us-ascii?Q?1BPdcHIwGoPUrfs+r5eJ4R/+ieKUTuaP+Tjfv2ypJdb+C8uQynopq2Ss5+tB?=
 =?us-ascii?Q?b/QmxfCCt7B1fpj7XysywCwLcBvTK2cLtsJX/+qlu4FkiCl33CiwVsnFiRTq?=
 =?us-ascii?Q?b50P7/Jdi21QTWiLkgg/J1y4lM8K+iVAxl0mFCEeST2DWGbTcXiH+ABDWGRl?=
 =?us-ascii?Q?KvcEZe8hl8pW1ZPL/vs5tYeuq5BJ3Dyxr04DPAbI7gpTCkDmzejqrGlwXb2r?=
 =?us-ascii?Q?YuFPRHTnNbQXqLYlcw2g8qpxLobZak4jRfS01xaCOzPMHCrXTE0efGuSd9Jm?=
 =?us-ascii?Q?V1RpxrIwxmpV93m9uAv2WwI0JPwLUUwIqxe+5afjh85s1EO7+CtA4e5JwJgC?=
 =?us-ascii?Q?Myva1QhWDsTjRGhOD2k6BbF10r1xjapDufW1DFLZywoGxgzh0/cXoXANgIXp?=
 =?us-ascii?Q?BZHTV9wsfTGageVQDA1hcAELtE7HuGJvp9TvgycmWT7Yga4wJdkP0IteqSpE?=
 =?us-ascii?Q?NPHfrQMztkurIL4HnIS8JM+ptAkQ7dYuf9nc5OA/azqKmdFGx7ThCMnhZ9JD?=
 =?us-ascii?Q?4BoG52995VMNVxm9hcUAaUE68YsrcUyfV0aAbSZCdJhc7r9Z1EQLbW3shNrr?=
 =?us-ascii?Q?oorF8Ghl6U3QDokL+lhZwQZKrLtkSP6AaRxNiKrSPrkl2DdECEPHbMMYu4hY?=
 =?us-ascii?Q?8CbcVe3pJy+TSbZfyYbMDE4Hr/975ehdxNojcX8YFOOF9KOavY1Gr1rRsTId?=
 =?us-ascii?Q?ldR12teyvww+KgzET4WN3CD1QWeJDQePdxzm?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(14060799003)(36860700013)(35042699022)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:33:34.1530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad48aa3-021b-40fb-bdb7-08dda1e27452
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7534
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

This patch provides an initialization framework for multiple Mali GPUs
by introducing a GPU support look-up table. Each entry contains, at
minimum, the architecture major version of the GPU, and may optionally
provide feature flags and register offset overrides.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/Makefile         |  1 +
 drivers/gpu/drm/panthor/panthor_device.c |  5 ++
 drivers/gpu/drm/panthor/panthor_device.h |  4 ++
 drivers/gpu/drm/panthor/panthor_hw.c     | 65 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     | 60 ++++++++++++++++++++++
 5 files changed, 135 insertions(+)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 15294719b09c..02db21748c12 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -8,6 +8,7 @@ panthor-y := \
 	panthor_gem.o \
 	panthor_gpu.o \
 	panthor_heap.o \
+	panthor_hw.o \
 	panthor_mmu.o \
 	panthor_sched.o
 
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index f0b2da5b2b96..81df49880bd8 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -18,6 +18,7 @@
 #include "panthor_device.h"
 #include "panthor_fw.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
@@ -244,6 +245,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 			return ret;
 	}
 
+	ret = panthor_hw_init(ptdev);
+	if (ret)
+		goto err_rpm_put;
+
 	ret = panthor_gpu_init(ptdev);
 	if (ret)
 		goto err_rpm_put;
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 340a5ef09477..5b617ab781a5 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -26,6 +26,7 @@ struct panthor_device;
 struct panthor_gpu;
 struct panthor_group_pool;
 struct panthor_heap_pool;
+struct panthor_hw;
 struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
@@ -122,6 +123,9 @@ struct panthor_device {
 	/** @csif_info: Command stream interface information. */
 	struct drm_panthor_csif_info csif_info;
 
+	/** @hw: GPU specific data. */
+	struct panthor_hw *hw;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;
 
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
new file mode 100644
index 000000000000..4dbe23df0c4c
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#include "panthor_device.h"
+#include "panthor_hw.h"
+#include "panthor_regs.h"
+
+static struct panthor_hw panthor_hw_devices[] = {
+	{
+		.arch_major = 10,
+	},
+};
+
+static int init_gpu_id(struct panthor_device *ptdev)
+{
+	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
+
+	if (!ptdev->gpu_info.gpu_id) {
+		drm_err(&ptdev->base, "Invalid GPU ID (0x0)");
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
+int panthor_hw_init(struct panthor_device *ptdev)
+{
+	struct panthor_hw *hdev = NULL;
+	u32 arch_major = 0;
+	int i, ret;
+
+	ret = init_gpu_id(ptdev);
+	if (ret)
+		return ret;
+
+	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
+
+	if (!arch_major) {
+		drm_err(&ptdev->base, "Invalid arch_major (0x0)");
+		return -ENXIO;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(panthor_hw_devices); i++) {
+		if (arch_major == panthor_hw_devices[i].arch_major) {
+			hdev = &panthor_hw_devices[i];
+			break;
+		}
+	}
+
+	if (!hdev) {
+		drm_err(&ptdev->base, "Unsupported GPU (arch_major 0x%x)",
+			arch_major);
+		return -ENODEV;
+	}
+
+	ptdev->hw = hdev;
+
+	return 0;
+}
+
+bool panthor_hw_supports(struct panthor_device *ptdev,
+			 enum panthor_hw_feature feature)
+{
+	return test_bit(feature, ptdev->hw->features);
+}
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
new file mode 100644
index 000000000000..1a3cbc5589fd
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_HW_H__
+#define __PANTHOR_HW_H__
+
+#include <linux/types.h>
+#include <linux/bitmap.h>
+
+struct panthor_device;
+
+/**
+ * enum panthor_hw_feature - Bit position of each HW feature
+ *
+ * Used to define GPU specific features based on the GPU architecture.
+ * New feature flags will be added with support for newer GPU architectures.
+ */
+enum panthor_hw_feature {
+	/** @PANTHOR_HW_FEATURES_END: Must be last. */
+	PANTHOR_HW_FEATURES_END
+};
+
+/**
+ * struct panthor_hw_regmap - Register offsets for specific register blocks
+ */
+struct panthor_hw_regmap {
+
+};
+
+/**
+ * struct panthor_hw_ops - HW operations that are specific to a GPU
+ */
+struct panthor_hw_ops {
+
+};
+
+/**
+ * struct panthor_hw - GPU specific register mapping and functions
+ */
+struct panthor_hw {
+	/** @arch_major: Architecture major to match against */
+	u32 arch_major;
+
+	/** @features: Bitmap containing panthor_hw_feature */
+	DECLARE_BITMAP(features, PANTHOR_HW_FEATURES_END);
+
+	/** @map: Panthor regmap */
+	struct panthor_hw_regmap map;
+
+	/** @ops: Panthor HW specific operations */
+	struct panthor_hw_ops ops;
+};
+
+int panthor_hw_init(struct panthor_device *ptdev);
+
+bool panthor_hw_supports(struct panthor_device *ptdev,
+			 enum panthor_hw_feature feature);
+
+#endif /* __PANTHOR_HW_H__ */
+
-- 
2.49.0

