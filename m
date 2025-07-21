Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85302B0C26E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7334710E517;
	Mon, 21 Jul 2025 11:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="X+CUwAfF";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="X+CUwAfF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596A610E4FF
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:14:33 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vQQes68ZEOXl6TGkuC62crfgNF/+2FZnxTfqcwHZ3TOJE7csKQ49J4On5DXrdI8Tk+vqb/efGZsL8Ucu2+/MuJMHVE7WxJMyLy3dv+8qxqbwkikgAIahw+DLh2itwqzPEy58G09ZpE8PlUR9wtW+uKg+FcQ5J5Q7WGx2miGaIaBQuaeibiJx2r9wukwtJnGqrRq7dl/8zHWcUkxIUtDI5OkiVKvcAQgr0tv3Q2b0cXBqwZqvRyPO5Sk02cOyAxO8NQifVuqG+eoBsd2ylf1JWa/COg7B8EkPrXL0V/8NHad24R26EQOAAk5kHGwqvA5igW3syDsJAEjsITfaEcpZSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkFWZIDme/PHdFL0JQcYW8/sdurQckEzJNe+naho+YA=;
 b=S24kgCjQi1+F4bWHYlsiZvcf8rZ33VF4zRx+NMIIf33jxu/F2Mc7qT5oNBFi8t5L/rxAO13t6v8nm1yrSOSJPOlWSlvTtyF/kTu3lQvmfmdcRmyDssoKefqJwLnWXZyc6uCgV8XFSBefMzA180La1qHGF6IrsfXPkPvqC4p0KTKzzI8NXhuK65KVIy6CjhGCmJGUkKe9O1SSAAIuA4CKmSws0OInGqljlW5M+qT6yx8J6rVyRf3WxxTCsxGkVuByY1u7omvqK+8HoQTpjj93prRPYmsHi3QlNJSamJ8+QHV/hThW381A+qx4wrehgKgnPXO/tT16sy7NwiIiieQ8DQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkFWZIDme/PHdFL0JQcYW8/sdurQckEzJNe+naho+YA=;
 b=X+CUwAfFKvS6b5UrWwPS4t/IydX0/iJrgXxQSBKKfgWX7ZepQhpkJy7z2s2VV/k6RaZhihkEQ4UGkBReDY2FHjIrR6EuiLZhdJqXCnsIKn4puL3bKQsXcxUh9LxdijzDiaik8J2IPEb6vW7Pt86GGxk026uLhkbTVYv49xMcjTk=
Received: from AM9P192CA0006.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::11)
 by DU0PR08MB9323.eurprd08.prod.outlook.com (2603:10a6:10:41e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Mon, 21 Jul
 2025 11:14:28 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:20b:21d:cafe::5b) by AM9P192CA0006.outlook.office365.com
 (2603:10a6:20b:21d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 11:14:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 11:14:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMWqodx1Xwce/81JGVT43hMPCvOXTqPlLpC2L2jeCUSR7UaPKZma7tIw6jg0Wg6vcrx9rEEkmEu6zQxizpyOpn9TwmBe1JEeCrH9O1UGK/N9RumYGrHD7jY93U+sW7p/HXKhqCmhlgnTHjg0A1ZEwGMT9AEXiDUt3Op1Sa6mSvJg2YVhh6Gi9JxGIVnK4VndcHOGMGVdNjvXENvbO1JwSh6pI0aOgDEZCE4Y0Y2M/hkvd903EQVhWkbGuyy4zd+YwoWfRY6qGyRy+mfJUt132ZGnP7Z9zFYohTggIIcHMdCT6+eXf0idV6isDZtI4fcgqMwVfRN/sphAcfy8PeqrBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkFWZIDme/PHdFL0JQcYW8/sdurQckEzJNe+naho+YA=;
 b=Bm5D8Y812W6cDLdkl52XlO0liC/3Ya3ImsaUTZmkloBm3lToobMF8bN96bzusa1Dz/wvi3/FbKtcKaR3Sp9o//Cxu9TwoFB7o0c1IIEztdP92LWMj624KqKM9tnCo+0P6nLZe02yVj6XoFiqZu5HUxtH7bMixgjMLkzQIPhiCt+5m9f317DmBEVleyGPm67i+BagE3ds4TA+LvbxVhhPtXdKHRyII7TFxqv5dERLUSfn+/aIsFyJCTQVczCuRyWzCPb6avtU60nSlsdJApr9/I5VBVdrz7mr4bATfC+NmkL4T7HFEclb3FCLFeAgd1WA+k4MSY0CHMyNWuLHRS+Zcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkFWZIDme/PHdFL0JQcYW8/sdurQckEzJNe+naho+YA=;
 b=X+CUwAfFKvS6b5UrWwPS4t/IydX0/iJrgXxQSBKKfgWX7ZepQhpkJy7z2s2VV/k6RaZhihkEQ4UGkBReDY2FHjIrR6EuiLZhdJqXCnsIKn4puL3bKQsXcxUh9LxdijzDiaik8J2IPEb6vW7Pt86GGxk026uLhkbTVYv49xMcjTk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB11012.eurprd08.prod.outlook.com
 (2603:10a6:150:1ff::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:13:53 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:13:53 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/6] drm/panthor: Add panthor_hw and move gpu_info
 initialization into it
Date: Mon, 21 Jul 2025 12:13:39 +0100
Message-ID: <20250721111344.1610250-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721111344.1610250-1-karunika.choo@arm.com>
References: <20250721111344.1610250-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::6) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GVXPR08MB11012:EE_|AM2PEPF0001C708:EE_|DU0PR08MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: b98ddfb8-c7d8-43a9-79ee-08ddc847c148
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Z39pxj3C0KloVbhWELvH01fVUvz0tvIHl6YVRFgSa93SA4FDIJmQtClAgQzg?=
 =?us-ascii?Q?vVdKqZMmTRBHPcZJmgE6h/5F5iMDdB8ZnhWso6GdShlA2qWLw8zbhA8Wp1gw?=
 =?us-ascii?Q?GTGI4HCgWbnq9eorTMQfyjGxPd2GkVihHdZ4EkDrIlS98q4m5+0yqltsyB2E?=
 =?us-ascii?Q?jjohwqkr0H3HfFc38tQbyIgQ+3H8o+mae+COH6qNnIUL1FuZdA+GTh8E9GpI?=
 =?us-ascii?Q?Gv/4un2RzIYTJpI/iVI6vZ04JV3n1gbLrfrkyGSQWSdH0mAQ3WymV4+oXpST?=
 =?us-ascii?Q?7k/FfFPrV5QGiqs7Ck+ZBFJ3tXd07FpS4YzLf8Sj+7GNlfR6phmkMUgaI/H3?=
 =?us-ascii?Q?7C/fTS8OnWzzcjkPXww06INQKp6thjSk7WO2qDlY03kt+Pq3cDrwTcb/mBys?=
 =?us-ascii?Q?YTmNNBA3kOeG0lyHpXbqm7iXdlQ3/3mIYhAPE6PynLPggNSf+RpLf1u0W0hF?=
 =?us-ascii?Q?ywpbXTxNmdgW56zQnyjGkH+CJm+/K7Vm9okpz6P7EfkMSQ5wg6bC1qIZed2l?=
 =?us-ascii?Q?mMk4DVrXbsambiWYsyIaobOCo2rjYylrRudsKoo6Y3XTQUHhAPszIM2rDKG/?=
 =?us-ascii?Q?mHLr33Te7z/j7kQ//UfEUD3kTEg45EPjhsGl2FMWM7dtZIY6EtClIt8YGmiI?=
 =?us-ascii?Q?lEmOMYuHl4N3AyvFYIWcbpSrycsVQCOco+cDwsPloe76CG7CCxIYgaXBhSyO?=
 =?us-ascii?Q?fOPP8PDNkLYt4wZDAe9eXWWa1wAXPavB02w+FCDUUINgWS9TBzqjNVOyowSH?=
 =?us-ascii?Q?UtYMM60betGweH2xzOg7OmglC8xZLEm2gRJm4b5lYt3mSjZRhcyQs1PsL0qz?=
 =?us-ascii?Q?WRsc4rSutslckpiH/BpDP3QAarCFrmk31l7EkcGCDKql/IwJ60AJo0S94VO2?=
 =?us-ascii?Q?5OEO5YXwcRNTses5wOTJwiVWWwNaKfH0BsncMt66xUg36iABuE9ZSb++4gnR?=
 =?us-ascii?Q?NYi5bz+7Jg/cECopE2qMnnZeIAOjLizSjDft7jRUb9mhL9/XLe+uxebI17s9?=
 =?us-ascii?Q?hSDXY2TuMkJrBTH94w4OchZW1PwZPr3GujB0WskMHTnn0DqaRJRb2lCMZJlQ?=
 =?us-ascii?Q?9j9di8rqxUe/PPJQ9oskmqrCJIymKwyHuhwt7FFeY/HjTLt8DRuM7MlNh0ga?=
 =?us-ascii?Q?6KS7BVeCRXRwcozUY9+kJ6QCmIzRpWWNPYeOqMCGwY8LCU2NiUaas+6lZ6sw?=
 =?us-ascii?Q?0fxAY23qQ/ic4P6SywZ2xl0PKsU/Lhb/lpGTu/6xNqJivMzhjR9V9oVwfGyT?=
 =?us-ascii?Q?Ohe3TyYLuV2hNE7qEXjCOr9m7dOjW2V+cQsUZBsP+jLRxHlQZe/u+IaoE3Qw?=
 =?us-ascii?Q?HtEm1Iyi4PbmJ+SjZxJmU6kwOdCLWp5D7/3sEuulVKxg9x+JJ/0qcYiwsek+?=
 =?us-ascii?Q?OUU/QLo1NUoQJdAFivbZQuKcr40561+1CwajsocvJ43FD03k2rXKghqln3qV?=
 =?us-ascii?Q?RHt/T/4FHQk=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11012
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 909c495d-1720-4473-67f2-08ddc847acff
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cKX9u7Hq/vcUhK/C0Tp4Id0Eh8TgeNLFebmJYAvvqPVFKWNh/n3q6qi0C/Yo?=
 =?us-ascii?Q?zEM4D+YDtQIEX3zSzhHDvfb5aFfV1rvj0y2MyzxQXc0ngWxXmBhPOpikBTBz?=
 =?us-ascii?Q?RnEQIfSU/9e8P+FwJZWXGEy9S6p0EeoieEp0dM4uaWBj0PbApzmp060uNkTl?=
 =?us-ascii?Q?o6eKzIw6Frp952xgVNe3uRH3ZteuGQWXB+bi7zqtOKnkGDNt38lctsUs6d4R?=
 =?us-ascii?Q?scAJuJc7NuoBPHkKaoaJjtpmRGq/o0jB954DsbdeJzhsUilfZz6Kmlsd1EEo?=
 =?us-ascii?Q?Zm7I01LdILypqIHyw/3kF7GzEwxKoSyBd4AqCvHgKtA2BVAHP/xZnGYWF662?=
 =?us-ascii?Q?EufiLJK4DAhB+p3KPD4xw5nrbwFRnMX5KULvpJ29BEya1RmFhGhFjsLAGq0P?=
 =?us-ascii?Q?KZWBzeYTe0H3XT58cNZVzMl72rbZqGFaT1UID5hhzvzpsaJrg6WEcXk33eAs?=
 =?us-ascii?Q?WbP1kpDWJp/XJMOVMM7wf5TrbJ9ec1k20bZGtLqiSEkWZTuIpPlWyagTHTIn?=
 =?us-ascii?Q?rrwKLM1nBJNFAOl9rRPqAhAq+vcvF7/Z/t9Fy/TNsVDPusBakjAd/YuOgH0k?=
 =?us-ascii?Q?iAj4dH6YZiF+3b/7qB8zUZWyaaSMtZsEdIT3zgTsJ1mFAMkuc2cYfkCUZlHh?=
 =?us-ascii?Q?AyItUpegLdv4XxUtGnyKlPQPT4+CLeGsb8p8U2NuBLdcbAoHHJiBX47S+QdD?=
 =?us-ascii?Q?XBMkh/yt1z8guy0VQhjJa+5LKscMVIOtZVLjjU92m8RcdY64JMoINl53F79O?=
 =?us-ascii?Q?qCZ8+h0JjOyGmAwI+srqOx5WEKYgoEECrJefG+ICsJHp7ifU7lZ3rKcH3yL4?=
 =?us-ascii?Q?r2TauuJ8db91WNma4RIYsBVBMlK8PBiSc0ndtE8ibZfg0NJNTmKNE0sR6zq3?=
 =?us-ascii?Q?ngVk8p5VTSRyrN+ATaRiHzx3P3u03mRdRupLU4bFt1JNbNmajpa13b+JXSXb?=
 =?us-ascii?Q?abkEEtrsMq1MPrB/4GlWrts1lEkjgyrdcYdDtISghYpxynYgZkk/vDxJK1Pw?=
 =?us-ascii?Q?qxaVk6yocjhgCbSO2AjOKSNucCEAyR+BQt0j7FkIV0rz6in6nRsqc/qOb5rV?=
 =?us-ascii?Q?F89D9TPd5vu4ydVOfNQ4g5+voH5K3bTZz6cBfBL9ONpmfu6D8iYifUMlhTxV?=
 =?us-ascii?Q?ilMTZ4APIsrBc+pBAvR/iZXyac04jwfhn3splDOf1SHs1yDEKIyZEe3vBpCZ?=
 =?us-ascii?Q?0exCT8nXdtZrqssO18U7vqntmZbPN9swPzzOXfdxOudRfVLHis271XIHjFXN?=
 =?us-ascii?Q?Gv8KUmyLHycLQ5zE0a5exDJYX/S5U0ZShqx4/CP0nKnWBRgZU94bu9dowWK9?=
 =?us-ascii?Q?2mf8OEDfEEbQiWjB3cPP9j+x2u3c7/knUZMQhG7T22b0lzv7EsHcg9zlpU6q?=
 =?us-ascii?Q?J+QGA3mLUTN/u6kgNTnRhvXhK2Uc2sqqTnpqC4Ebnlkq9bfc/RXdxWACIQvX?=
 =?us-ascii?Q?HWaxqkmQ0MLmbtUs4l8q1bw+SSshKi2tGLLgBOXFcnim1bx0f0zpSp05SUlN?=
 =?us-ascii?Q?j9LHwWs83nko716B2YFGyMMIVPecUyVfEe6i?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(14060799003)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:14:26.6420 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b98ddfb8-c7d8-43a9-79ee-08ddc847c148
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9323
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

This patch introduces panthor_hw and moves the initialization of the
gpu_info struct into panthor_hw.c in preparation of handling future GPU
register and naming changes.

Future GPU support can be added by extending panthor_gpu_info_init()
with the necessary register reads behind GPU architecture version guards
if the change is minor. For more complex changes, the function can be
forked and the appropriate function will need to be called based on the
GPU architecture version.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_gpu.c    |  95 -------------------
 drivers/gpu/drm/panthor/panthor_hw.c     | 113 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  11 +++
 5 files changed, 130 insertions(+), 95 deletions(-)
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
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index cb7a335e07d7..5e2c3173ae27 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -37,40 +37,6 @@ struct panthor_gpu {
 	wait_queue_head_t reqs_acked;
 };
 
-/**
- * struct panthor_model - GPU model description
- */
-struct panthor_model {
-	/** @name: Model name. */
-	const char *name;
-
-	/** @arch_major: Major version number of architecture. */
-	u8 arch_major;
-
-	/** @product_major: Major version number of product. */
-	u8 product_major;
-};
-
-/**
- * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
- * by a combination of the major architecture version and the major product
- * version.
- * @_name: Name for the GPU model.
- * @_arch_major: Architecture major.
- * @_product_major: Product major.
- */
-#define GPU_MODEL(_name, _arch_major, _product_major) \
-{\
-	.name = __stringify(_name),				\
-	.arch_major = _arch_major,				\
-	.product_major = _product_major,			\
-}
-
-static const struct panthor_model gpu_models[] = {
-	GPU_MODEL(g610, 10, 7),
-	{},
-};
-
 #define GPU_INTERRUPTS_MASK	\
 	(GPU_IRQ_FAULT | \
 	 GPU_IRQ_PROTM_FAULT | \
@@ -83,66 +49,6 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
 }
 
-static void panthor_gpu_init_info(struct panthor_device *ptdev)
-{
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
-	u32 major, minor, status;
-	unsigned int i;
-
-	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
-	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
-	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
-	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
-	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
-	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
-	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
-	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
-	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
-	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
-	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
-	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
-	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
-	for (i = 0; i < 4; i++)
-		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
-
-	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
-
-	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
-	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
-	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
-
-	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
-	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
-	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
-	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
-	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
-
-	for (model = gpu_models; model->name; model++) {
-		if (model->arch_major == arch_major &&
-		    model->product_major == product_major)
-			break;
-	}
-
-	drm_info(&ptdev->base,
-		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
-		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
-		 major, minor, status);
-
-	drm_info(&ptdev->base,
-		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
-		 ptdev->gpu_info.l2_features,
-		 ptdev->gpu_info.tiler_features,
-		 ptdev->gpu_info.mem_features,
-		 ptdev->gpu_info.mmu_features,
-		 ptdev->gpu_info.as_present);
-
-	drm_info(&ptdev->base,
-		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
-		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
-		 ptdev->gpu_info.tiler_present);
-}
-
 static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	gpu_write(ptdev, GPU_INT_CLEAR, status);
@@ -205,7 +111,6 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 	spin_lock_init(&gpu->reqs_lock);
 	init_waitqueue_head(&gpu->reqs_acked);
 	ptdev->gpu = gpu;
-	panthor_gpu_init_info(ptdev);
 
 	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
 	pa_bits = GPU_MMU_FEATURES_PA_BITS(ptdev->gpu_info.mmu_features);
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
new file mode 100644
index 000000000000..3f7175cb0ab4
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#include "panthor_device.h"
+#include "panthor_hw.h"
+#include "panthor_regs.h"
+
+/**
+ * struct panthor_model - GPU model description
+ */
+struct panthor_model {
+	/** @name: Model name. */
+	const char *name;
+
+	/** @arch_major: Major version number of architecture. */
+	u8 arch_major;
+
+	/** @product_major: Major version number of product. */
+	u8 product_major;
+};
+
+/**
+ * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
+ * by a combination of the major architecture version and the major product
+ * version.
+ * @_name: Name for the GPU model.
+ * @_arch_major: Architecture major.
+ * @_product_major: Product major.
+ */
+#define GPU_MODEL(_name, _arch_major, _product_major) \
+{\
+	.name = __stringify(_name),				\
+	.arch_major = _arch_major,				\
+	.product_major = _product_major,			\
+}
+
+static const struct panthor_model gpu_models[] = {
+	GPU_MODEL(g610, 10, 7),
+	{},
+};
+
+static void panthor_gpu_info_init(struct panthor_device *ptdev)
+{
+	unsigned int i;
+
+	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
+	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
+	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
+	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
+	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
+	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
+	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
+	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
+	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
+	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
+	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
+	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
+	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
+	for (i = 0; i < 4; i++)
+		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
+
+	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
+
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+}
+
+static void panthor_hw_info_init(struct panthor_device *ptdev)
+{
+	const struct panthor_model *model;
+	u32 arch_major, product_major;
+	u32 major, minor, status;
+
+	panthor_gpu_info_init(ptdev);
+
+	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
+	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
+	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
+	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
+	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
+
+	for (model = gpu_models; model->name; model++) {
+		if (model->arch_major == arch_major &&
+		    model->product_major == product_major)
+			break;
+	}
+
+	drm_info(&ptdev->base,
+		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
+		 major, minor, status);
+
+	drm_info(&ptdev->base,
+		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
+		 ptdev->gpu_info.l2_features,
+		 ptdev->gpu_info.tiler_features,
+		 ptdev->gpu_info.mem_features,
+		 ptdev->gpu_info.mmu_features,
+		 ptdev->gpu_info.as_present);
+
+	drm_info(&ptdev->base,
+		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
+		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
+		 ptdev->gpu_info.tiler_present);
+}
+
+int panthor_hw_init(struct panthor_device *ptdev)
+{
+	panthor_hw_info_init(ptdev);
+
+	return 0;
+}
\ No newline at end of file
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
new file mode 100644
index 000000000000..0af6acc6aa6a
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_HW_H__
+#define __PANTHOR_HW_H__
+
+struct panthor_device;
+
+int panthor_hw_init(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_HW_H__ */
-- 
2.49.0

