Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D165ACB299
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9ED910E538;
	Mon,  2 Jun 2025 14:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="k7wwiHCn";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="k7wwiHCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAB610E0B1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:33:44 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RK+aBVllDDdOJpLt4APBxggKX/FThBH+jUmMNyqq+EEOgDikLweJGkwmvXER2ZfvV58tUt/7HICR1RHhVpD2C9AMtTuCltkF000xZjoVBWriwNDtLtinMoCXck2wmRmYj1exDhwV/J6J6Bahg1csnHkcgxQbFm/+XvQFuSWppQIYZCSTAcI81noVAsDi9zNvbYrq+UZP9VSULY1vUPG90RVVAUci/dAF22AOWZuf7K/PrLRiK0ZDyxb6OjbCo98DfhMPcs1mMd/EMMS3uQc2Bu8b7VxwtA4+/DkysJZ3ll13oBVrdG6sOyAsWZdcvT4ygpIMkqI6Ua/Sxm6FMh0FQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYSRkCNnaGAKA+FBxg2i44JxbDRqCedCP8l/aG2+2KU=;
 b=kDwnmJEPBLcpPHMsmt/O74SCl5zCU59pCnnfv4Bj7vUEu7fGmOO5dG57Qb7dw4UQv+CyeJwmjGMOMxuSDZj3JWiIiLLNKHoZ2H/sxfhIj2A5cmBq7s3hiCt3jJPsXyG6CTeGWmxvHI4gGI2aAVBrMPes/Tt0dgDZ2m9khtTcm7Lyp/BP1PwUuXt6MKf5mIB8nSB0CHxmanr/fT8Jc+E5fgVduasvsyg2bpak2w5tNYLQUc17Kthuv2Uy9JphKWRMGi7K6vkS7ViWIQol5YYeSgmDPvyBEshnAidnAmx9tKoc5H1GbcjcJKgtoLrZv66AgWcrVX3eRzsGRPsR7K7btg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYSRkCNnaGAKA+FBxg2i44JxbDRqCedCP8l/aG2+2KU=;
 b=k7wwiHCnvZDawn9sERmxikwCBlgCxwXmh/WhAZn6hglHVkbztJ4HUiaieaRvs2KVKqBJZv22BVFZP5+wZMMU85MltB9GjmXChVYk00KlpK1QepWbj0eby7ao9OiRgsKBHZBRaf8LQUzswGKHPE+rd5fa1s8gfcqRlxy5fsxqz1I=
Received: from AM0PR03CA0008.eurprd03.prod.outlook.com (2603:10a6:208:14::21)
 by VE1PR08MB5855.eurprd08.prod.outlook.com (2603:10a6:800:1a2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:33:38 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:208:14:cafe::88) by AM0PR03CA0008.outlook.office365.com
 (2603:10a6:208:14::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.22 via Frontend Transport; Mon,
 2 Jun 2025 14:33:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:33:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRNdiP8rz0xwzVLWoKesBkRblslvrcQcLUVkfbqZ0RbaJSp6d/Ns4m8Fpel/GgJVSq0GWL6xLzkwqRQmwMrfqGJ9Zf4hK5L7+uWCJF9ZGzKCozkOi+mNR+spNBkAHvjjfBJwY+IlLMwo5+od1WYeI/+1YzLWHG8s8OL4OYv11Ly5mJXDXDAO7AjTdlbdYBlM9AwToIfVLI0vTGC4jLDalAkkjYHwhoGcotW5a3Qe8NUG+YUSo87fkY1kb1BNRpJ1inliGyh8CAp7YCUDpaXt04cMiEzpBhgc5FsnJEUQOV8fCL1gjbGJT4IcjLX6xlcJ0jBChLyaHJeUfuzWcSsjKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYSRkCNnaGAKA+FBxg2i44JxbDRqCedCP8l/aG2+2KU=;
 b=yXFOuxLomaZnQffjcDw2aoLD1kNcQ+WICk5q6kewvxnB7Op/hjaKRB+Eodhywbx2Bk8hJOBAnNGHYA2AdIGEiH/8rkKOI5nXLJ+jy99W6qWdKsOVaZWYfS4sF3uFFCKgi73uJsiXAW5wRqSRNlT9AOMDSQ2nLslbC50x3KbGe538MAt/1LmWldrSrJPOTghNV5QbLbYRF/xf6XaABYlRYhgLyFQNqk0/UBderRf992gbp3//36Rv5+4jVtDs/jl+8yJpyNZns7fnz9nzqFrYAPkKqZY7NU2JxGEMYNVIkVCPSVgIC6wRuMQaEcIKGUz7rsHcvhaT6IE2TwlEtp8CGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYSRkCNnaGAKA+FBxg2i44JxbDRqCedCP8l/aG2+2KU=;
 b=k7wwiHCnvZDawn9sERmxikwCBlgCxwXmh/WhAZn6hglHVkbztJ4HUiaieaRvs2KVKqBJZv22BVFZP5+wZMMU85MltB9GjmXChVYk00KlpK1QepWbj0eby7ao9OiRgsKBHZBRaf8LQUzswGKHPE+rd5fa1s8gfcqRlxy5fsxqz1I=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB10809.eurprd08.prod.outlook.com
 (2603:10a6:150:158::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:33:06 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:33:05 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] drm/panthor: Simplify getting the GPU model name
Date: Mon,  2 Jun 2025 15:32:11 +0100
Message-ID: <20250602143216.2621881-4-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602143216.2621881-1-karunika.choo@arm.com>
References: <20250602143216.2621881-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR03CA0048.eurprd03.prod.outlook.com
 (2603:10a6:803:50::19) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GVXPR08MB10809:EE_|AM4PEPF00027A65:EE_|VE1PR08MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ca8931-b900-4517-5ff6-08dda1e276d2
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ELk/60kXWbV+gdPdMLyfKUkZ5fbKOUq3V2Eczuo+lbLfeI5yS4HIrQ4lEGzT?=
 =?us-ascii?Q?8ivHSjph+Xq6hLQdTsroGvmKr+vxTR2Mxrknr0VtH+u06/8R7KDbrbpiJyXG?=
 =?us-ascii?Q?Gz/HpqV+u8gt2gxNdabrU3DSTjxDUXVyVGVGkGUZe/OpKRuT4JJHHZQD9FWX?=
 =?us-ascii?Q?6X+nPdEpLu3ZwAXFpXNeQjWc4OsH0m3ym2jHjnkxza6xjFYyhNf190AzICzJ?=
 =?us-ascii?Q?YOBi4echV9fqGxBgIXTuxndcN/RtX4LRwd+Ncq5FudmlL0MgWVqmGi9MOzp6?=
 =?us-ascii?Q?tUJ7JimNRTyN08cMvguWydToOuTdjMG2JBsAlURpd1t6f6hu6AOrl10mxd05?=
 =?us-ascii?Q?dDoSoH024QoIwAJ6+UeG8DDzcXZE7flP75km8fhHp5Qqt928b9x+LY64poK2?=
 =?us-ascii?Q?7YcVKZtvUCVLHvApA+5KpFcqxFClhizTVGzD6GpBaZgw8izlADNAYUS7/DQX?=
 =?us-ascii?Q?kdwMaN2My5/NeLNif/K0RDbbPqyrhgupi1vxXe1Z6v9fvlGjptsG9PkZoO4G?=
 =?us-ascii?Q?k6wTBAiuecWfiR1R+s7EWmtM5ZxQ8Az19o7jMRMPtlj+OzgxX105Y88XQqHs?=
 =?us-ascii?Q?cxbIcLgRCkQ4AALaJWGYtGcK7i2VDDZ+lPEMw7d7hFG3y2T6x540Xd+so16h?=
 =?us-ascii?Q?GgOzdsVQAYgz86cd0G/ZP0jbtHIFV8Wu4fFCzA1wZnscL0XdZNkObLZV23k/?=
 =?us-ascii?Q?567zaNNrxmGTbjskb1hEjtjq6GU9t5DkdMvlwUfJStSAiGLHaRomz+hzY1Ve?=
 =?us-ascii?Q?yk6huBrjSLVtevEFZ5Vt7f/Tcd67Ff4J0nLwxKBKiTjvk2/l3rmcDfZQosuP?=
 =?us-ascii?Q?6VMjuXYSZRjfaUp+8SyFFz2doeeSBsl7ZUZ711JmJQIxFOnTGw0e2qu4XVUS?=
 =?us-ascii?Q?el9NImVdzLAhf8NCYVM77zkvkkgFksn17AKRfg1ZlYSQO+xK05kBMlca9xRp?=
 =?us-ascii?Q?p29hSzZHmnox+r2g9TuWKmzGv4WvCltRkPut/HZYUs1HlbC+NUydiO5exD92?=
 =?us-ascii?Q?Z5ubCcIvkBSLJJbRmBIklnY+nQPceX9Vx/T3DP9xjt3wxN27dSNGfNGYQSiT?=
 =?us-ascii?Q?cKCLSDNcv6kYXwU3CgYQvzviKwkT2SowfSxxfMQdPJjtRq5fxZtyc4gpjPaR?=
 =?us-ascii?Q?/Bl0yd4GWqe+RVG0rheMFgIcTw8V1dGm8Qnq89GJBwpfn8evqkyg6wXMVQwS?=
 =?us-ascii?Q?rB0GwqE25k3REfa83/mscapcWJxzL9GV+v7/TuXhd78iU8/EsgOv3wcZ876E?=
 =?us-ascii?Q?sbXp3PLHmsW63ikVO3LXaaoPPn7x+2XMx+h965UjTSRSnquaNPB4lP36vrfC?=
 =?us-ascii?Q?kaMNWcqfeRXWQ/xGKv2ehE01KvtbmII0xhM3KvGGGn5Wu3ZKM1GD1Ag3cXz9?=
 =?us-ascii?Q?Q1hmccCutEiushY69TjDy8RSutMiIb60k2qMQursKdcsjc/JSw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10809
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: cd6c7465-a08b-4cb6-e39e-08dda1e26343
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|82310400026|1800799024|35042699022|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XWoKxGIhtnGV+NPtBEUjmvwjuja3RU7dYsyfN/i6jo6ATEWSEUFXyVkUCDF/?=
 =?us-ascii?Q?wcDHZpwhMeRA6yt5f+KMVuxmtkANFB266sN3qZDm0Sh241e9O/8eKZCdQTuw?=
 =?us-ascii?Q?oHWe9Y4y8vwH71rk011nWNGeFq43EMVH0lqRIz0ahpLDlnuY1/dxHCcsEHG4?=
 =?us-ascii?Q?kZ81HOs8MVnx4TsEq1Nb3t3Pli81iQLSW5OP8RPbHKXso1iSNIygSnupLukJ?=
 =?us-ascii?Q?KMi9i0IPR/LRwS0mYmO7/x+A8X4CkJGzj9Gc2Oar/za7Py98AGNCjlh1/00W?=
 =?us-ascii?Q?4kTu7aYWJUsTAA5/Qiv/d7nIQ7kUOuNwDdXfJgVoNKG9t5RfCZ0XJ3euSQMj?=
 =?us-ascii?Q?/R3fox6XqdO03SvPg8a23o2Dh7pAal9svUYq9MxTP4Izn5bunsOnUXOiyOIy?=
 =?us-ascii?Q?FQcDKNXh1nOsQjLTAsgf5iRlXJekKdEjmenZfWQR09a52wHczlpUyBs2tj+L?=
 =?us-ascii?Q?FXUtoxBfRfxtcLpmpCN79ejIQZLxUKk+2/nfu6pseh3JmREclwx44jqNLNqL?=
 =?us-ascii?Q?FFE21C97XLHYZKi15YN6/tLO4G9fGipHdBRvYzkLqnOkAbvw66PV2ceYw5pD?=
 =?us-ascii?Q?9w6G/89yXKqRgrRpofczaHaZqk12Bw4XZjNNWF/HJcP626nEhLf9jrpu4QGc?=
 =?us-ascii?Q?E7geBcMnA4ZfT8DPVaWmFnwpO5H/hFaH4A3S+nvY9bSfXtDeyoJbRd4m9jEO?=
 =?us-ascii?Q?Amyma6kvjxW9CnoA4gOfgVkbq/jRFFhDtMk4/Rm3g+gWG6m/rfUFfzY7xztR?=
 =?us-ascii?Q?OSGUtaAHatYq2uU4D5Wc+3P4y3IDQz95fc3yG/vMpKmOcN0Kg6FWe1qA1i14?=
 =?us-ascii?Q?ReLp7ey1skqQ2N4qir9FgDA6cQP4rb5Vl3RPnW+6Typw/LVQcJPvFh+HyIqP?=
 =?us-ascii?Q?vMBkSB0VaSqkWWaaDxT1TS2/fnJ2a/888LDN8pjGCTjpwS9wsO8ckMNwJvdh?=
 =?us-ascii?Q?+xnV0hRq5b8Cv7WCfAPF/tQDO0/GUryGiGXliJizlUvwjcQSFle+9ETo6W5h?=
 =?us-ascii?Q?yVVoCBHlRb1Bpvwim0920+bJvMVKhWiepdtSDjH0T+UyhM/ju9mWjQYhX+L5?=
 =?us-ascii?Q?0gBLpTzGjESfWXblaE4YHLWjHvyTVSuNUSW0bCtXEiVRN95Vb7FM8UK99uMC?=
 =?us-ascii?Q?YthftKp5crIMaDUqlX5YQiXnAGOFpDJVd+xuYyLO6GVA1FVKD1eWLiy47Mm7?=
 =?us-ascii?Q?1n1QqipeK2vszX6bS+qDglS7snE41QRjRLZBQYFe3uVmpInFzHpU4l9U6Qwp?=
 =?us-ascii?Q?d5M2Bux9Kxp8CBovUW41fzY3iIB9WbzHF1Zm3UZVKJ9rFZRJidnII1eox4At?=
 =?us-ascii?Q?yiBYzkQ3J57mEjIznx5WxL+9njlP38UhXnED731MIxemlIEN4z3ySEhr3S54?=
 =?us-ascii?Q?mjn3aCoEgb9rF7xyq3fR/Hr/Sk0jlM5uoTpfXQM2pG4yrSst4nS0y6oZfh98?=
 =?us-ascii?Q?6k7uUHkfK7g8CBngrb2Jn1lhVcXihQAPXgpHGGVM31Lv/hoRGfqn2pbIyXCO?=
 =?us-ascii?Q?I3ROkCzPDyf7jHDE1RW70qXuLsuyIHMSTVNO?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(82310400026)(1800799024)(35042699022)(36860700013)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:33:38.3720 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ca8931-b900-4517-5ff6-08dda1e276d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5855
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

This patch replaces the panthor_model structure with a simple switch
case based on the product_id which is in the format of:
        ((arch_major << 24) | product_major)

This simplifies comparison and allows extending of the function to
accommodate naming differences based on supported GPU features.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_hw.c   | 63 +++++++-------------------
 drivers/gpu/drm/panthor/panthor_regs.h |  2 +
 2 files changed, 19 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 576cda231c1c..421f84fde7d0 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -5,40 +5,6 @@
 #include "panthor_hw.h"
 #include "panthor_regs.h"
 
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
 static void panthor_gpu_info_init(struct panthor_device *ptdev)
 {
 	unsigned int i;
@@ -65,29 +31,34 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
 }
 
+static char *get_gpu_model_name(struct panthor_device *ptdev)
+{
+	const u32 gpu_id = ptdev->gpu_info.gpu_id;
+	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
+						GPU_PROD_MAJOR(gpu_id));
+
+	switch (product_id) {
+	case GPU_PROD_ID_MAKE(10, 7):
+		return "Mali-G610";
+	}
+
+	return "(Unknown Mali GPU)";
+}
+
 static void panthor_hw_info_init(struct panthor_device *ptdev)
 {
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
+	const char *gpu_model_name = get_gpu_model_name(ptdev);
 	u32 major, minor, status;
 
 	panthor_gpu_info_init(ptdev);
 
-	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
-	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
 	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
 	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
 	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
 
-	for (model = gpu_models; model->name; model++) {
-		if (model->arch_major == arch_major &&
-		    model->product_major == product_major)
-			break;
-	}
-
 	drm_info(&ptdev->base,
-		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
-		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
+		 "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 gpu_model_name, ptdev->gpu_info.gpu_id >> 16,
 		 major, minor, status);
 
 	drm_info(&ptdev->base,
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 48bbfd40138c..e7a81686afdb 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -19,6 +19,8 @@
 #define   GPU_VER_MINOR(x)				(((x) & GENMASK(11, 4)) >> 4)
 #define   GPU_VER_STATUS(x)				((x) & GENMASK(3, 0))
 
+#define GPU_PROD_ID_MAKE(arch_major, prod_major)	(((arch_major) << 24) | (prod_major))
+
 #define GPU_L2_FEATURES					0x4
 #define  GPU_L2_FEATURES_LINE_SIZE(x)			(1 << ((x) & GENMASK(7, 0)))
 
-- 
2.49.0

