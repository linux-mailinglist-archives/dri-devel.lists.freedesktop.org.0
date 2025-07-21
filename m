Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2731DB0CCB3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 23:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8594E10E5B5;
	Mon, 21 Jul 2025 21:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="JjHsYSMC";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JjHsYSMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3DD10E3C9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 21:36:17 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=owMGJg4vBaECFPhNUt2VZKzSgD8VcBfSKWhEofmDH83vdkawXlRjP/la1HmRA3jkSSRyCx7/vmczW5Ya+cH827YJ5cVtqJ2mQggwibxCoBuBuiMHd52AMcIuzAS4DkrdqK7a2/fdxs8yskmJS3KY0Y6EVJC8wkqO5CWhFEr7Yw237CE6blak1UgM/+Djfc25zmSzWN0vwaE1Gvcr6ZsiIiUMGf1a+DZu0fwqnf9hzHWNZAPOQ2VHxTePAu6obJIddoVazmhUosx7qMPCiXgayMYhlFAwk9SlCBcmHQ+jDhwjeZbiMVeAT/tbRAWS2n37zKx6/11/Xg/hLLaOU2DTlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnDPdtmQ4QttZBhdX7+qdYuLHfwwoOeiE2tEQBrTpsw=;
 b=vnPlO/vA3DzeuPkXWyYKg+kZvafdsBZ4+PuWTrpigSyEGqtlHG6M5rkUwVC0gYFLYlkiGLex9wlVG6GH5QUDclDtYhXZdOJ6bylR+n49ErQV4tRmfnDpAV47yhZ8bLaFb5D69xW6GT8OUEMLQ6zuMiAteO7yylanLD7Y4K37L1rjCMw26+pbMh2lhjD0AeksNn2XBWxOQwa7WJvLdo4ORH6u97cgKVF6QO+ibf519GrpdUysig4bVsSOHrw72luVHBCZXqiJXSVo8EoColtAHCOIsnQgU9ZRsp03hQqWjJLb+YSAskLMKOQVmBlbAQQX43OMOS3Srkl+XkM//zDqRA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnDPdtmQ4QttZBhdX7+qdYuLHfwwoOeiE2tEQBrTpsw=;
 b=JjHsYSMCmzuSj9FM5QSGEilEJTR2TXwAos9e8pWQGSKcowRbgFbS/8tkHjHUnprAmXY4/3r9wZPXSRGOfO1Y9/EU/IvnjehdRgwym+d7QlkASU6YTd5vQwXZVk0+H+Nf/f0mMzhXmjHcI/F93uhTAdByYpD0kXihT2ZO7WtW/iw=
Received: from PAYP264CA0008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11e::13)
 by AM8PR08MB6322.eurprd08.prod.outlook.com (2603:10a6:20b:361::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 21:36:12 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:102:11e:cafe::58) by PAYP264CA0008.outlook.office365.com
 (2603:10a6:102:11e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 21:36:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 21:36:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j44QNOLb70KWv5fmzy75quorCdMA5NgTFLlvyN673nAKpjv5QF2JyClySTDqJvDwwocJo7VZCQxZGMbdnG+XwNUfAv5IBZnaHaRMX0+OD3VNK+r0K3Jvps05BPeZpcR4kRNxHtqwWqKwgoI8nLzwJ4ZEdAJEXITYsousUsXHmw15Da0ULuLaM+gtCvMfw38eQDAXIWjpNp1njQPKA/dIJaR5fVbGIY28F6amPhEbQxU8LOHf1o6Oc81eD0r7KVoLPSFl4th8O2Yj4WtAIWRyFfXIhx16Ysuu14VJg6FOF7Gc36iInA+4UvsiZ8bRUiiPKJ/p7f0hagSdXSXQuYZ4DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnDPdtmQ4QttZBhdX7+qdYuLHfwwoOeiE2tEQBrTpsw=;
 b=FMT1iFJyFOEKwGc2q2FHVdjEL3Fpt15Tzp0cHXDzXGQlkF3AnsmGx11N17n3/jmqXfs0KeuXj9yQStgHp6VuRG4W3o6pysfX7pTMqDvgv9R4z72YKNvwDDY4esJlj+qYYBvdSEbBQS8wxR53eOpVr0c90XaN4uXLfxxcCEU7JJAQYetaFotqrqCjxZgZhQcg0uuEp8vTLSGpxU3ohEhyKahKozwME1Rj70OTMStl5wicFNADCW4d6ie/lDAYdpxrQwPXtzGe20c+0Fh9UfaFajoxZOqnx47qPB1tjDs99GRuewgeGltC9y82Z8B5H85C7bobPPa6HkdtT+GJUSQObg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnDPdtmQ4QttZBhdX7+qdYuLHfwwoOeiE2tEQBrTpsw=;
 b=JjHsYSMCmzuSj9FM5QSGEilEJTR2TXwAos9e8pWQGSKcowRbgFbS/8tkHjHUnprAmXY4/3r9wZPXSRGOfO1Y9/EU/IvnjehdRgwym+d7QlkASU6YTd5vQwXZVk0+H+Nf/f0mMzhXmjHcI/F93uhTAdByYpD0kXihT2ZO7WtW/iw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PR3PR08MB5611.eurprd08.prod.outlook.com
 (2603:10a6:102:85::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 21:35:38 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 21:35:38 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/6] drm/panthor: Add support for Mali-G710,
 Mali-G510 and Mali-G310
Date: Mon, 21 Jul 2025 22:35:25 +0100
Message-ID: <20250721213528.2885035-4-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721213528.2885035-1-karunika.choo@arm.com>
References: <20250721213528.2885035-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0312.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::20) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PR3PR08MB5611:EE_|AMS0EPF000001A3:EE_|AM8PR08MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: 450be490-2d22-49be-1d24-08ddc89e9c59
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?jA+dKqON9SCXg1y2B5rqjbHHiMI1oGxhnCSrwPgy1ZasJeOvLMZaUmlmYLFR?=
 =?us-ascii?Q?1PTnCeGy6GN0EBGYM2eq3Iu4PZlzp0HFeot0w2s1abb1YDl6weTdAEq8hvT1?=
 =?us-ascii?Q?FNR/qGakXr6vQ6wxWgoG46XaUjAaroIdVJZaipetRiZKbhgEi14TB7lFAPND?=
 =?us-ascii?Q?3pIvD1SRdNduuSybGx4ePE/ci36AddCcJMBQwj3EAKL4yXzMvDvMQGJZhpDR?=
 =?us-ascii?Q?H96701onsqUR/F00RKLneXYC005lLemxEsQLi1pycGu62Yf4O/DDppZ1a8C/?=
 =?us-ascii?Q?wJ2waWRAc0144QYIx9/Z8GDYlu8KMWbCSRe8wi/qulv2VC9lKifn+nfrPMCP?=
 =?us-ascii?Q?RpovdfeL2OQC0TlJtgDPmU0uN8YCDjjtwf1lNcC9TmEzpjM6yOYfB9TIlDGI?=
 =?us-ascii?Q?vyITVj3JwwhAcGlppErDMS9i5hYOk0YCH+0JkPM5J3eySKbIa5tq1RF3mHYl?=
 =?us-ascii?Q?ow/QERNAGLUa69Q3jCiR8NhtXV6JwXz61RZ9Ebhs0MY4lRDwp+UU87wB+kvf?=
 =?us-ascii?Q?iHci81JcOyZf8GxmbR/MXBOmS0zhoeNZ6cNKFnATKLfOqOjT9BgY516egFiG?=
 =?us-ascii?Q?FJejEBe2FdiJt7f1dKqiGnhpDw0IFCEr/dnIoHb8e9EJ7PEPU83Ta92hhjvX?=
 =?us-ascii?Q?EMmDJlm2l1MlRtDjVZLoEABBd0lsilCSY6qr2tMaOHEaXT8jOaWvqCD16IEy?=
 =?us-ascii?Q?Pp09+ESVsPpvQp8TlSfpGzkAEuf7DMB1IdkNJ6Rl4e/GWa6Ky0X/uAUjqPFp?=
 =?us-ascii?Q?kfwSK/a3DuZBVaURbWChT1iCe9aIX8mqQVZycm1KTRUJPCfECO9FKxDqOerM?=
 =?us-ascii?Q?Jww0oQFK6/PF4UvmAc+4GnCjatQW0zTaJZMeJd/EPMJW8StPKzMET4CIu6Ic?=
 =?us-ascii?Q?69gQkiaLlw4gecE2xdUdEIt0Qx9yc6cll7tfsYxftQ118CpsYv7Vr5ZV4IKA?=
 =?us-ascii?Q?zajuT5SD1H2JcBXZjF438b6ebXrRf6LIHbsPcLPTgiNgi7DYtXji/wanfYcH?=
 =?us-ascii?Q?azldd4yxSPkNzjh7eSrMZpNovlsa8X2s79fY0YB8id693dArj0u2z2PP7EdC?=
 =?us-ascii?Q?nJtNZXoCb9oryyTlIa5LEHHbsl6tBtGk/SJieoPhNCeKz9UP5Bzo0VWSwP7l?=
 =?us-ascii?Q?BdInPeQthc2LgN+6x/mDqgYJvN/t8Q71Q5Kt72Bdu4bdmqeo/cAXi2w588Rh?=
 =?us-ascii?Q?S0qqXmoUKbugvqMiIy+yroAinXbvAKjaLP5t8uMRbb+y2/FJ1SmKHV1RQcJn?=
 =?us-ascii?Q?LVrfx9P2Mp14A42sf6ai8I+TLns/rPd9hXm6q0rbZp/3yiY4hfnq3+b+IjKL?=
 =?us-ascii?Q?KelVm5Z4EqFsWlLK9uQo/SbxSAa7hEuOwBS6/ekMHzI0exD1aH3fBsfMiq2b?=
 =?us-ascii?Q?VvExIPiZrsbOE/q/c8Dgn3YpoAR7aw9/pyiDoCwzHQA4TyVToiP7ZPkI9E5F?=
 =?us-ascii?Q?3MurIAKcxzw=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5611
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: aebd8628-1f02-4970-9e20-08ddc89e8828
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|35042699022|82310400026|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YV8C9cen18z85kUM0LihV61zdo3ZGjonFBrjndpcx4X4vt+1ZizM3pV96Dsr?=
 =?us-ascii?Q?Dk3wdQu0KbK7eOO/5s232gZ1yEkJuke1CBFoZE71KBN4KuqwFOP5o1Rt3BEy?=
 =?us-ascii?Q?PvXy1bAs4bCeVi4tyqkjZNMvFR2mlNHwniWDMUo7x1OjwFYbFCHZ1r2rDGdm?=
 =?us-ascii?Q?LO7zq7azMw7jIEhwThKgCDlLs8fFEYilbvc9KDbNFixBrmOa44KtZt/t319y?=
 =?us-ascii?Q?MVSgb57f+dBwkzawW3Dt+WWZ7EopkxAftn7RoRHWuCMQazX2NIjzZvFFc+ky?=
 =?us-ascii?Q?QutQgGEfmNXo3KJVF2GUVUtPQvABs/ozrAtoDwTkG5zm/cAoRNhzG98Cpcq5?=
 =?us-ascii?Q?YTAHP7XYq4ZpRKrnsE3Q9+hpkfoBYExWfpG7ztkMy4EH9ugeoK0kBX2JfHo0?=
 =?us-ascii?Q?eYsoiRtVUmiCpjXFaSgn2z9709oYFUqjMAIRHD5nDGqZIkpFgZDf956EF1zf?=
 =?us-ascii?Q?m1FvJnKQhz7tv99McT5fdHqA83sKoV0z18wAdpC/WoZWEGmVkZlwtXpMlUhL?=
 =?us-ascii?Q?6uo2CqwJVWeDpM7uckNbYj2aEX/n7F1WadhkmruCGPzUWQQmKaIowOUrhN83?=
 =?us-ascii?Q?ubpHw8joGzhdI6BLj8loO9ETqGit5xI9UCOrrpb257wfN/3Rg8Chu7aQyym5?=
 =?us-ascii?Q?NjV788aAgnd6ky/xWKnGPRtkM5Q3OKFxABY0QNht2rVdqOfy6DokfZmobVpX?=
 =?us-ascii?Q?djw05utSnyJedAmBGC4PHClou9nZta+eqvk3d5mAeqzCP1PpEBaLBA+T0S5D?=
 =?us-ascii?Q?5QZes1w49t5l5OhqMfaxmJs0HchroH1HlYQZUuAAiN8iUioobrKEPXD9Jm2L?=
 =?us-ascii?Q?m0R1SDTjCzBempoeY1Yv2XkMTLATyJZl0sN64n4RVxPnwvKCxgNX8du1GKbY?=
 =?us-ascii?Q?Mo02MlQCgNhpUUuTUm02hpf1LP37Ny1tO0q7qq1/98Kb3I1wCwBRDQJ0qK9D?=
 =?us-ascii?Q?l0ZcVsxgwMmWoDeN2VQujE7SoQFDCTLfIEQ/zfiF1U8KpPxDJEbA7K1k+d/6?=
 =?us-ascii?Q?hRnKVR55VLnwFPguC1iOcc5C9mEL7W5GFYfCxgMQ64f7NlzpqoiY9pxJw8tQ?=
 =?us-ascii?Q?CzFwXT5l22lnkgHXpI/l90PD7731YiZGPjOQr1vtm/a6DyP0cAx4z3ud++OL?=
 =?us-ascii?Q?Imf5ynuMoHb3iNq59oM/HVWTw1AKV7SPSvSBo7tPnh4y8xfcu041yQ0ep53g?=
 =?us-ascii?Q?r0xUWNdfwXzZsAvU/gwbWmbiMXymozmjCiHDtyD0L68PDR5eEdm90i5kN7T2?=
 =?us-ascii?Q?wcCkCH6Lyj3MSJqOtzSqpl6J4AExXuVuJC55tAgaSk/ti0Nse1YKuDQH6RFQ?=
 =?us-ascii?Q?MAsmJ6g4LIaypM4m5LaQRUlvdcFHQjpdARlMkSi+jWyq7XqdqkDAjTywqLZL?=
 =?us-ascii?Q?ltdh5fchKqlKKYFXhvH+vKcfi4rUMF15xxx2xo1XhSdNKg4aoe1V5FbxMzLq?=
 =?us-ascii?Q?NA+KarMbjv45W7+0c1fXkNWmu2T4FK2/iZd06pVmvg2HrQidDs8rRagw3Qjc?=
 =?us-ascii?Q?/Xlqtuv0/8kXbDLGJBa6FtuxmPcf8CAERYJR?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(35042699022)(82310400026)(36860700013)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 21:36:10.9039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 450be490-2d22-49be-1d24-08ddc89e9c59
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6322
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

This patch adds GPU model name and FW binary support for Mali-G710,
Mali-G510, and Mali-G310.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 2 ++
 drivers/gpu/drm/panthor/panthor_hw.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 36f1034839c2..b7b454d16f12 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1402,3 +1402,5 @@ int panthor_fw_init(struct panthor_device *ptdev)
 }
 
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index f39010c0ca86..7f138974d43b 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -15,8 +15,14 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 						GPU_PROD_MAJOR(gpu_id));
 
 	switch (product_id) {
+	case GPU_PROD_ID_MAKE(10, 2):
+		return "Mali-G710";
 	case GPU_PROD_ID_MAKE(10, 7):
 		return "Mali-G610";
+	case GPU_PROD_ID_MAKE(10, 3):
+		return "Mali-G510";
+	case GPU_PROD_ID_MAKE(10, 4):
+		return "Mali-G310";
 	}
 
 	return "(Unknown Mali GPU)";
-- 
2.49.0

