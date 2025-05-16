Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59D0ABA077
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 17:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BE810EB12;
	Fri, 16 May 2025 15:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="PhkEs3NL";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PhkEs3NL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013060.outbound.protection.outlook.com [52.101.67.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6136210EB12
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 15:58:59 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IIkLhjMFbxyLGKdi2tE8M9UFcwZ6Sb0fho7XpOyfQDAr8CJpN+CBgB5Mtwyn/eqALFs+hFFrYmJCkW9KuluKY3buYn59FJjlCXwCjlekPe6rCfb6u1m8qiKIKzkZUBNafU+YUUK/QcgnjHV4B08dsS5jLDma240MPkChtWvBH+V+DQinlCblqavWBXJwDcFTFRYaQUY1bbaVxSN+2gfOWFlFxk76dpIUN4PqhDmI4BEdV9bJ5XfbMjXPekMVQDw6p5PUMRGKLi4fst358DfiS6QvsNbxiCS6EftjWR9UmV0Kd9mEXQ4XdDaH7h0Ld8HxM5oFmavweQ6i4DfQWZCTTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZotHG/NiHZdV7jEQZVPj2JqaAhiLixdocbppNgllw8=;
 b=CS6BmieYLoR5uWHa08RVNd20CwMgtXvcU67dwt189HvVIhiFk+v1W2CPStMpBHEs1tuNkVzK7c9jAj6A1fclqDMRzg5eDxz1tKg8mJPnq+Qzbf6M7tY29O6VWBuXrEvQJpT4L9Mohc5Ids8+rKyNXbs3tcHX41rMy7Muy1T5p+JgwhBxMTyOeMRb0qKBBohMk1e7Zut04C5FuFyqI6hVyANRQbth70n9M6U0iEUxD9QFXoXrIPhRTEni4YJnwCfbCYq93VDo0UTL3k4DP0VtJekQaA+K7XqkIKWTcNpSJJNKDp4NAfLElE4FJzAdGwsbHHPpsLWEFv1vJ+IzYUHzkA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZotHG/NiHZdV7jEQZVPj2JqaAhiLixdocbppNgllw8=;
 b=PhkEs3NLBWinQf6Sou7/ypmrVRkpGNIRAmTrafhoSPhBtQpmhg3XkKbRr1qgKsbqm7fIpsf8YqCKjNnYKgP9krffzAcbq9zTjm2yM1VHrUgnEVkRFDwveMRN1N0Gav8gtuudh6uhkFz9RQNCJF+ddaBhh+tWFPG0Y/fCuH0cgE4=
Received: from AM0PR03CA0030.eurprd03.prod.outlook.com (2603:10a6:208:14::43)
 by DBAPR08MB5573.eurprd08.prod.outlook.com (2603:10a6:10:1a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 15:58:51 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:208:14:cafe::77) by AM0PR03CA0030.outlook.office365.com
 (2603:10a6:208:14::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.17 via Frontend Transport; Fri,
 16 May 2025 15:58:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27
 via Frontend Transport; Fri, 16 May 2025 15:58:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubSWNFL2jGmmhkhKyBfuivXA2BXQX9qJYo4EZ4DaNSrAHhN4WdST/lOzJU2zHyanyUHlzQbZW0WRwT5/D6/BZ7j16IVyjmIOGD4nKeiK6Lg2KI8mqeUdhcDGPBXW53vnsrIAvVpqhdObAAf/yNmh18y767+SibwH2oP87xDP46+HIHdpOd8I76/K2iHf4IU5OOKQT+y8+TAXdRuduuhipycASgSKsFbHy56VmUnrV5V+oMgcadnwajsjqmSOZI/wQ2bdOxuuAjoflvTObZ0YlR3mNZypWFJ5ywb0il854gZRhIKGm9/2Zy/BwM/oVs3MM0Hvq7u7/30IdVp8XLlCdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZotHG/NiHZdV7jEQZVPj2JqaAhiLixdocbppNgllw8=;
 b=TC9h77uYTf2TBkpX3A/6TcTkCL916+PRGOBou3h9UK7i4r6rw0SjrcBJ7MP3iL9gTnxLBTbLXaX9ky/vnmLdytnisY/dlnVLm0lhKRCQPB30/mMNUgrc82rTxasjGML/K0K+jBteBciRYxkI8E2oE8CmMB2irDl5CIv5Drb6agVDFC37tK77Y0tT8yQK8fxGQwxnIxSfbLSRR0Ga7D5nICyy6H0rS5SEKDUdFBkkkQtwAhTTOrlXd5RBLs6dxENq3KlQgeVBr13tpDu1eUFB/g7pGSGUVBuJ5oUDxo0eSSNdNJtMxPgsQj5fIU4fBGdJ5V9Z8LVQJE+cP7zzP9o52A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZotHG/NiHZdV7jEQZVPj2JqaAhiLixdocbppNgllw8=;
 b=PhkEs3NLBWinQf6Sou7/ypmrVRkpGNIRAmTrafhoSPhBtQpmhg3XkKbRr1qgKsbqm7fIpsf8YqCKjNnYKgP9krffzAcbq9zTjm2yM1VHrUgnEVkRFDwveMRN1N0Gav8gtuudh6uhkFz9RQNCJF+ddaBhh+tWFPG0Y/fCuH0cgE4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by VE1PR08MB5837.eurprd08.prod.outlook.com (2603:10a6:800:1a9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 15:58:17 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 15:58:17 +0000
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
Subject: [PATCH v4 7/7] drm/panthor: Expose the panthor perf ioctls
Date: Fri, 16 May 2025 16:49:41 +0100
Message-Id: <d196bcce96cf0e3672905c3cb0336505728ddc52.1747148172.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1747148172.git.lukas.zapolskas@arm.com>
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0304.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::12) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|VE1PR08MB5837:EE_|AMS0EPF0000019E:EE_|DBAPR08MB5573:EE_
X-MS-Office365-Filtering-Correlation-Id: c73a1eb5-6317-45c4-6048-08dd94928c0a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?K0YyMFdKbWdCMU5YVjNDRUNZSEYwczVWbzB1emtrSG4yVWNZU0Vra2hWZ2lQ?=
 =?utf-8?B?bk5VQkRhY1p3WXRTMndaWGxCWmNNRktiMkNNOW5BaW43RmVGbnRlbDlRMjJ2?=
 =?utf-8?B?OXp2NUdyS0pmdTJVZDFkUDFHKzVPeVJoYTBISElZNkltZHpvNUFVM2JxVitR?=
 =?utf-8?B?VXhJWXRBVG13TElsRDhzYmwxY2VNTC96cmdLY1YvVHZ5ZFplREh4VXFUdzlJ?=
 =?utf-8?B?MCtQbzM1UmYrYXpIaGFkTytQY1JlVzNoNHlveW1tYlI0dVovbXljVlFjTXRq?=
 =?utf-8?B?cUNSekJwZUwxMGtIYk1UWW1Qb2NWNm5sdWxta1U4Z0Nzdkd6S1VkNUQrYmJB?=
 =?utf-8?B?Mk9WdC90Zlc0TlNSYmlzWXFBM1ZFTnlycFd1NzZxYWc2QzZnSDFIeDdRYVg4?=
 =?utf-8?B?VjZrcDNndGhHSGN3UFU1V2dCS0lHR2grc1FQc043eS9QdWVnUWNEVCs3M0hM?=
 =?utf-8?B?Mm0vTnlYVGpscTVtS1VsWVRmb3FNV3lKRGpHTm0zelcrT3JqV3lSUlIvbWN2?=
 =?utf-8?B?MVh5UVlJUlN3OXdlVGd2d3BKQVk5NnNkWVk3aFdHUE1qR1RHWXJqdHpEKzRI?=
 =?utf-8?B?NWNBNVNHZVNyNU10RkZzRkp5cGxJOXdSdy9Ncm10eTNSdE1oVHhYNkNPRWFM?=
 =?utf-8?B?U05pRnpCamFNbkNUV2V6ZkNMSUFoMHo2Wm1rempEcTA1dklvVHBZS29wVngr?=
 =?utf-8?B?TmpGYlhUYWZaVlB5OWJQVDlza2J2eUFNN01keWZuL1Vob3BaS0NBNTZkQXBG?=
 =?utf-8?B?bnEzdW9QcEg5VFAxclZJSzh4RXhabzVIMVFPNUlrbkl5bUUyZ2dRWnBiemFv?=
 =?utf-8?B?c2crZzRDeFd6cm1Da1Vkdk5zR3VLN1BvQ1RCSEtWMC9teGFnczVaMkxxSDR6?=
 =?utf-8?B?QnV6L0R2eFRQRmlpdGcxYldhZXZrSzNpeEkyb0JDM1VFeUVVaCsxN2NscHd0?=
 =?utf-8?B?QVEyVDB5SHgraVF2Z0V3eUI0Vy95Y0RiaVlqQUx5Q2w2MU5ZNHBQdGdVZE5J?=
 =?utf-8?B?UVZ4L2xFQWcyRlhRajUxeWcxYWE5anZBc2ZXWGFtallSK2hLK0Y0Q1k0MDhn?=
 =?utf-8?B?RVRtK1NwQlg5OUlWdkZUUVQrNmVkbllOZkhXSmVWNTlNbzBiQVV4QmoxMk1x?=
 =?utf-8?B?Y25INEhJVlMwK1ExNW1xZDlSb0tuV0dEeXVoUGdNUEU0RUpzUUNvUHdMM1pQ?=
 =?utf-8?B?U3ZGc3A1ZjMwR1BJOUpXQjhKWHNWWU5DRHhCa0xVVjAxU1lObVg0YWFTWmZR?=
 =?utf-8?B?Vmc0b0V2TnJqdFJZSzZoVlpXNmhKVzEzR3BGeGdqaEluY0pXSjdtenhCTkE0?=
 =?utf-8?B?dFNwZGNpUUZXSk9vc3U1OTRGdzFkK1FMVTNvMDFXRDhlaXB2RHQ1RUpLV0pH?=
 =?utf-8?B?QXpndlZjVkQranRzUWNqeWpnN09DelVjMVFZdGQ4WW5ROUx2Y21IRnFyTjZj?=
 =?utf-8?B?T3BPbGlWQTBjdDREd2tQV09kNXU0V2wrdjVoN21JanJPZ1JBV25YY0J4NEhr?=
 =?utf-8?B?NUZWRXRaLytweUVteVB0R0cwQ2RiMzArblF3REVBSG0zc1MrQmh3Qk1DeE5E?=
 =?utf-8?B?bllQWVM3aVpKMktnQWVvTUg0ODhGTkc2bVQ0bFl0UWthekhGU1BoWDlmaW1O?=
 =?utf-8?B?dDVCeUp3WWdZMWpCQmZFK0puTmRxTnV2SFlubkhPUDBEUThaT2RxVVBzOEJH?=
 =?utf-8?B?aS9kZHRtcjlDcVZia1d4S09aZjFpOVRwMzFUMVY5TWRvRXVsRkxwei9oWHV2?=
 =?utf-8?B?UDBteWt4SThIZ3lSVXhxdCtKYjVLNjZTSUdTUmxxUzl4Tmc1V21FUU10K204?=
 =?utf-8?B?dVhYekxJN3VnVzg5VVVucmFRajRVak1kWnVBemxWOURVdjFmdXNUMFBlQU5T?=
 =?utf-8?B?QTk3dzJxQitKRmlxYWJRRGs4akRJZjlxNFVNM0p2U3ZPbDZFTE0wbmt0dmxC?=
 =?utf-8?B?QnFGZENqbWtnTWhJTmdKOFRYdHJYaFJneC9UaDNEVHBBeE8zQnZQR1JuWFVx?=
 =?utf-8?B?V2hZU2U4bzFnPT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5837
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6b7b07c2-d25b-450e-3741-08dd94927909
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|35042699022|14060799003|82310400026|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnZLbkdvRDJFdzRjSTBOZGQvdmlzZHZHWURFMHhQQ1U5SW5xd1A1dHc5bVQv?=
 =?utf-8?B?Y25FQ1VKQm5mSGh1VlRIeVBQb0VsU1dZeTYrSDZ6VFdIaVA3TUJpQjZSMkZx?=
 =?utf-8?B?a2NvMlBUOHhXbmpEcUI3Z3R3UDNMN1pOZExsYnZESUM5VmloeWVjUVVJaEwy?=
 =?utf-8?B?ZlpncURlUHhrUXFmblFiTEZFT2dQWEJaYUpBajgwZ28rc1Z1cUc4K1J3dFRu?=
 =?utf-8?B?Q25lZGJjbDczSzlVYkxIZ1AyS0VNNXR4VDNQVm9vTzJsMi9iMDlYTEw2Njdh?=
 =?utf-8?B?clJNbEZWb0hUWmgwaXlKU0JlMjhWOUZxSVFKdHZUYWt4WU41WURXdU1hMHhu?=
 =?utf-8?B?RTJ6RXpBWWxvSzg2b2JqTmxjVGJNM1J1Wm5JMUhLM0lPUVFlclkvdGF4TVFY?=
 =?utf-8?B?VUdXbG1kNGRkZ0dIZUFRVVcxTDRBU1NkandDN0M1Sjg3SXc4SGk2S05ZbThB?=
 =?utf-8?B?Y0tqWFc3S2JRa2U4NzVibkhLTmNZNUQ4L0VoVjEyNkxnaUlGZW1DZmtnQmkx?=
 =?utf-8?B?b0ZsQjNYWDMyRnFEaE16anVaU2poeURQbVJyTmxPS2taSFYwUk5BZ2h3bmNU?=
 =?utf-8?B?eHRmS2pONm1SRmFDZzZ1WDQ0RGdZcGxGeUZ1VWxGdGg2ZGNqaVdsOVExNWUv?=
 =?utf-8?B?Zmw0Q28vaURsRmpJZ0JlRFJyQ2tlL28zMEV3WmtyaU9Va3kzK3dsK3dDT2ti?=
 =?utf-8?B?VzZCdTRKenIxRnRSdVZVTnV3ZVhtdGlyNDNDY2lrU1BZK0l3RWFhNjc5eWZm?=
 =?utf-8?B?V1VtZTBkMmwzSEtSNzYyUXhLUml3VENmN1oxbHRUajNjVDJSWGliOUxSNTAr?=
 =?utf-8?B?eFRGUm1qZk1Cejkzbk4wZ1gxTFIvMGFWeUQ2eEJFcWJZY1VJUkZjaW43K1BW?=
 =?utf-8?B?R09pNE1pQS9OSlpua1ZrYVJPV3VxSGxSSUwzTjFqS2JDYmk4Y0J0TzgwbzNv?=
 =?utf-8?B?Qy9aYU04QkQzYjA3a0J6N2hDRGJtMVpUSS9obkxvaW1WQW9PRTV1Qk9tNWJn?=
 =?utf-8?B?aU5oQVBRS0NFV1BNMjdqZzdyYng5OGZReTQ2U2Roc1k3VEljTmNTaVR4RGI2?=
 =?utf-8?B?eFA4S09SVzVoMVZtUERaY1ZwWTBIenB2L0YzdFVQT3FaWkZNZXFKTnY3MFBo?=
 =?utf-8?B?bkdZa3dYZEM1M2trdHh3UjZ3WjN6WmVqT0g0S3AxL1NkTUVRVDBTQVFycHRv?=
 =?utf-8?B?ejlxZnNMNzZzek5NbnI5REhDc3ZHVk0zd3FPN2prRTUxSndRdDhCSEFrZXc5?=
 =?utf-8?B?OEhmZnZYenV0eFcycVkxaFVrWVFsVCtpZXUyTWZtUzJVS0p2YzAvaEdZMmlQ?=
 =?utf-8?B?UFRHc1IvU2dVQnNFZDlvdWp6VjVIaVdEZUVsN2R2RnhDcnZTRDNoV3Bia2lD?=
 =?utf-8?B?RGRqYXo5dmlkL3BDbjhTSDZodHBkVUJzWnZQT0pTZHZGQmFYdHpJS1Q2U2xY?=
 =?utf-8?B?cGFuRC9PQjQweFJuajcrb0FLa0V6SFNhd2UrRGwvM1Y4MU1ISlZCdjF2Tmw1?=
 =?utf-8?B?QkdCMDRRYnVJdi9JSWtuN1lzTy9FUm9meWpuSG5yZkViWTNHUmt3dTNsZkpT?=
 =?utf-8?B?RDlXVWp3MHFhSi8yOUVNcmVQa0gxUnN6MkROM2Uwby9ZU0VmZkx2b1ZhTjBH?=
 =?utf-8?B?S0hpMk8xZVFOUE0wSkpydHRkV2RxSDlQODhwWUJKQ2VaN0llREVaNGFhZXVz?=
 =?utf-8?B?YnV0c3FBOUllVEUvVWd3UERRNGlERkxtWnZ6cjh4bjNTaWZnS3crcVJkcjBF?=
 =?utf-8?B?bWFQc0dnQkpISlJaUnd3ek1Bck5Xd2N5Uk84UzJxeFBzZ3R2dGhBTEtHcW81?=
 =?utf-8?B?UDZERDhHanNvVjhLc3VaUDBRTFA4MTNXWGVmcnBTWHYxa0ZzTFgwblA1TXdt?=
 =?utf-8?B?UW9pOGF1YTc4bU9zQ0ZoSUNkNGVHemZnM2dNaXA5elBENmZZdVg4aXhlWUtL?=
 =?utf-8?B?Sk95dkRJUDFuTW81a24wVDArNmYzdTE3WHh1c09UQjEzSDkxNDR4ME9xaHNu?=
 =?utf-8?B?MitYT3p1WSt1cjE3dml4NGVhTFhseWhNZHlkUUVIckY3dFNaa2hTU2tnY2l6?=
 =?utf-8?B?UUR4QTkxRnJDS2tENjN0UEpBTnUwUVN6VExxUT09?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(35042699022)(14060799003)(82310400026)(1800799024)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 15:58:49.1105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c73a1eb5-6317-45c4-6048-08dd94928c0a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5573
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

This patch implements the PANTHOR_PERF_CONTROL ioctl series, and
a PANTHOR_GET_UOBJ wrapper to deal with the backwards and forwards
compatibility of the uAPI.

The minor version is bumped to indicate that the feature is now
supported.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 141 +++++++++++++++++++++++++-
 1 file changed, 139 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 4c1381320859..850a894fe91b 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -31,6 +31,7 @@
 #include "panthor_gpu.h"
 #include "panthor_heap.h"
 #include "panthor_mmu.h"
+#include "panthor_perf.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -73,6 +74,39 @@ panthor_set_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 kern_size, const v
 	return 0;
 }
 
+/**
+ * panthor_get_uobj() - Copy kernel object to user object.
+ * @usr_ptr: Users pointer.
+ * @usr_size: Size of the user object.
+ * @min_size: Minimum size for this object.
+ *
+ * Helper automating kernel -> user object copies.
+ *
+ * Don't use this function directly, use PANTHOR_UOBJ_GET() instead.
+ *
+ * Return: valid pointer on success, an encoded error code otherwise.
+ */
+static void*
+panthor_get_uobj(u64 usr_ptr, u32 usr_size, u32 min_size)
+{
+	int ret;
+	void *out_alloc __free(kvfree) = NULL;
+
+	/* User size shouldn't be smaller than the minimal object size. */
+	if (usr_size < min_size)
+		return ERR_PTR(-EINVAL);
+
+	out_alloc = kvmalloc(min_size, GFP_KERNEL);
+	if (!out_alloc)
+		return ERR_PTR(-ENOMEM);
+
+	ret = copy_struct_from_user(out_alloc, min_size, u64_to_user_ptr(usr_ptr), usr_size);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return_ptr(out_alloc);
+}
+
 /**
  * panthor_get_uobj_array() - Copy a user object array into a kernel accessible object array.
  * @in: The object array to copy.
@@ -176,7 +210,12 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_setup, shader_enable_mask), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_start, user_data), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_stop, user_data), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_sample, user_data))
+
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -191,6 +230,24 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 			 PANTHOR_UOBJ_MIN_SIZE(_src_obj), \
 			 sizeof(_src_obj), &(_src_obj))
 
+/**
+ * PANTHOR_UOBJ_GET() - Copies a user object from _usr_ptr to a kernel accessible _dest_ptr.
+ * @_dest_ptr: Local variable
+ * @_usr_size: Size of the user object.
+ * @_usr_ptr: The pointer of the object in userspace.
+ *
+ * Return: Error code. See panthor_get_uobj().
+ */
+#define PANTHOR_UOBJ_GET(_dest_ptr, _usr_size, _usr_ptr) \
+	({ \
+		typeof(_dest_ptr) _tmp; \
+		_tmp = panthor_get_uobj(_usr_ptr, _usr_size, \
+				PANTHOR_UOBJ_MIN_SIZE(_tmp[0])); \
+		if (!IS_ERR(_tmp)) \
+			_dest_ptr = _tmp; \
+		PTR_ERR_OR_ZERO(_tmp); \
+	})
+
 /**
  * PANTHOR_UOBJ_GET_ARRAY() - Copy a user object array to a kernel accessible
  * object array.
@@ -1339,6 +1396,83 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
 	return 0;
 }
 
+#define perf_cmd(command) \
+	({ \
+		struct drm_panthor_perf_cmd_##command *command##_args __free(kvfree) = NULL; \
+		int _ret = PANTHOR_UOBJ_GET(command##_args, args->size, args->pointer); \
+		if (_ret) \
+			return _ret; \
+		return panthor_perf_session_##command(pfile, ptdev->perf, args->handle, \
+				command##_args->user_data); \
+	})
+
+static int panthor_ioctl_perf_control(struct drm_device *ddev, void *data,
+				      struct drm_file *file)
+{
+	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
+	struct panthor_file *pfile = file->driver_priv;
+	struct drm_panthor_perf_control *args = data;
+	int ret;
+
+	if (!args->pointer) {
+		switch (args->cmd) {
+		case DRM_PANTHOR_PERF_COMMAND_SETUP:
+			args->size = sizeof(struct drm_panthor_perf_cmd_setup);
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
+			args->size = 0;
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_START:
+			args->size = sizeof(struct drm_panthor_perf_cmd_start);
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_STOP:
+			args->size = sizeof(struct drm_panthor_perf_cmd_stop);
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
+			args->size = sizeof(struct drm_panthor_perf_cmd_sample);
+			return 0;
+
+		default:
+			return -EINVAL;
+		}
+	}
+
+	switch (args->cmd) {
+	case DRM_PANTHOR_PERF_COMMAND_SETUP:
+	{
+		struct drm_panthor_perf_cmd_setup *setup_args __free(kvfree) = NULL;
+
+		ret = PANTHOR_UOBJ_GET(setup_args, args->size, args->pointer);
+		if (ret)
+			return -EINVAL;
+
+		return panthor_perf_session_setup(ptdev, ptdev->perf, setup_args, pfile);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
+	{
+		return panthor_perf_session_teardown(pfile, ptdev->perf, args->handle);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_START:
+	{
+		perf_cmd(start);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_STOP:
+	{
+		perf_cmd(stop);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
+	{
+		perf_cmd(sample);
+	}
+	default:
+		return -EINVAL;
+	}
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1409,6 +1543,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(PERF_CONTROL, perf_control, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
@@ -1518,6 +1653,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
  *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
  * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
+ * - 1.4 - adds DEV_QUERY_PERF_INFO query
+ *       - adds PERF_CONTROL ioctl
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1531,7 +1668,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 3,
+	.minor = 4,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
-- 
2.33.0.dirty

