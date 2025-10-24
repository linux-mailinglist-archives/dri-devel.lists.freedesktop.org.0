Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C66C08081
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 22:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D17910E225;
	Fri, 24 Oct 2025 20:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Dg+8qIYm";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Dg+8qIYm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C3410EB32
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 20:22:08 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=X6Ob28R+faH/rlO+jtzap2BZIbVBP4ESZyOkGCSLoJEAydunWGVNptnyDUlYspn0Ms1Uwru9sP+qLFgDLrcgRWaviM6F5PmITgcW4YZ/KpYQPoqbI4n+XTVVGAmIHemgm6HXLQ3bp4qzph25Wi/8QvXuNRJNqciAP3ukgxWPYXaI9NJGOV7J1Guwy5WMAaCNVVaXVyMJHn0ugK6GAGG+lvI/zjh3RIbj+QuHXBBpVUisgdHTT1ajc6c2URiXLmiFTLOlqLsXUArItiHyimrkKCT9O0SuKlOuqQBIiyCETanPovE9N86rKiQuOUlTtcHAb4KBhknybvCsdDJgacBIIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNRNVo77zgNnztlSw16Enyd75GeV/yMVHigKmnYeuFA=;
 b=IqV6ocwpiCL1SjYlmqtRntkP3qVnJE+ZKXgCdsvCOUSA5SfY4wxPZR6sdoPFS2bxWTuRvUv94+si26VJqOwgWYLZvGjHKDiXh8kQFZx9NAm5W+gN/AYEsN4RluDbetQotLscNzuXgKBxGiVGw6w/sctoB5wnPK04SpqI1+QIVWJGJ85RRxBEKAZ9U0R/VyRXn3lc1ovS4vPKxTMDD7Vre9NuhcQxNHCkBNUslC1yWCixiclZ6y9qjI7vvqhXNKvGDqCyHZPMSI16DXI55OpgKqM6NmfP4R4kB8bepKzmWchCOjYTF7sx3qwBh10z1Ql9aOMxnKgtua9DhXBfJTyw3A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNRNVo77zgNnztlSw16Enyd75GeV/yMVHigKmnYeuFA=;
 b=Dg+8qIYmXQfmq3BG8ws7xGfNSxSgcuHcknwDe6hh9PT2AWHTjIUmvyd823Tu0S9hDsyWij+nOKU+Kg4fPSjzEe15Vtc74qpM3oYzPEz3Mbd14gREy/CopbCBMZsSW/ANbAQ126ELcLF0/krHjHvMgiimE1KRs9SOqjWntmRNxx4=
Received: from AS4P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::11)
 by PAVPR08MB9403.eurprd08.prod.outlook.com (2603:10a6:102:300::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:22:01 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::70) by AS4P190CA0002.outlook.office365.com
 (2603:10a6:20b:5de::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 20:21:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Fri, 24 Oct 2025 20:21:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLhXlMpD9WieMt6aJwDdTYLg8DWU2J67G4oeGjt/0xiE98QvTDb4s5KqPuXFfGh0WlVeNbkPPpoFPIYcF8gptwm9f/yWx3sEDcTgcUmiCORmKjgObAwKllki/XIGWCgkg1oXG09sFB5CEnSb2uz6EoXsuKj1K4+DOtdaaPOkVVE9AYMsrIyNFDr8oJf4n8/j6q2BEYXlnJDSPCwBIsV9KwCqlq1DWFatNENOhVGPTSrgcALqsd7x1qv4r6SfCLJBKMu1EUpDoFDwxBeZ3J7JNopjRs26aejv3xA6EsyplPmAkRJKrSTgl821E08gMpX1d+omPGwI7fi7fESoYvhzIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNRNVo77zgNnztlSw16Enyd75GeV/yMVHigKmnYeuFA=;
 b=uzbLcNR22uG8wq7+ZXpO4JDooy2hwUvh/hmsrHdb6qy6Bscxyr447Iu67tnUrmbIKUO5pVEXwjZgASNgtYaJWql3dmh9GQOW89mjoeILlVTsa+VnizjQFSUQOOpHrABSGOWFKYlip14PmBNvHjPT5GSH3D4wWVkAay5T7v0SiAgF4IMZds4tVCF7yoi/+VVCT3RIbJHbLExRziCCC/RVuzytevRY3Axk2Km/OD2Qb9x+PA/oHytRoIEi01HWL0gMfe9ujqLI3bVXYDi/eepoChhswuCK0hvsCIO2AErEpAqGdF1pc/8XNwlzqpsVPxNof1g2URRRnYINVur8EQK+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNRNVo77zgNnztlSw16Enyd75GeV/yMVHigKmnYeuFA=;
 b=Dg+8qIYmXQfmq3BG8ws7xGfNSxSgcuHcknwDe6hh9PT2AWHTjIUmvyd823Tu0S9hDsyWij+nOKU+Kg4fPSjzEe15Vtc74qpM3oYzPEz3Mbd14gREy/CopbCBMZsSW/ANbAQ126ELcLF0/krHjHvMgiimE1KRs9SOqjWntmRNxx4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU0PR08MB8929.eurprd08.prod.outlook.com
 (2603:10a6:10:464::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:21:27 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 20:21:27 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] drm/panthor: Add architecture-specific function
 operations
Date: Fri, 24 Oct 2025 21:21:11 +0100
Message-ID: <20251024202117.3241292-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251024202117.3241292-1-karunika.choo@arm.com>
References: <20251024202117.3241292-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0090.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::30) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU0PR08MB8929:EE_|AMS0EPF000001A1:EE_|PAVPR08MB9403:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a24dd6-d4ac-4396-8f35-08de133afca0
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?sns+7DQnd7Wv/MmaUarprWdlh/1u1DHx7PVHu8GMBIUqjBeAUEVykamLZ8aA?=
 =?us-ascii?Q?IUPIasrZhZyguBobvHMS1aoMEulBTxtFU6aYZB2y2qzxo/oKej+qFopl8psx?=
 =?us-ascii?Q?D6rkc0no85qh8jWNpScLnBG1riuUlEKunJza0X1Rqq7R0B4ALNAE9shun0uE?=
 =?us-ascii?Q?vcT4G+yBo7gKgw9d/EcfMf4K5WBourz0ufdccvfsz3bOBHUu6vEQnewZJp6P?=
 =?us-ascii?Q?fYjlsvUcyaFgVhdSV8cr27zhCPk3jFntkYQXomhTMgRSz2mQTfauRBtHLdw0?=
 =?us-ascii?Q?hOSLDvcBDhD+GucrwhsgN6oQZhxzAeeGFCxuF744gToSJzMAjJuWHyb3x6sf?=
 =?us-ascii?Q?etjmj6jE1csm/cR3VflYMyJ+dCeVYFebpmnFOxLxJA1ca/qEyeV+Cr6JWcIG?=
 =?us-ascii?Q?b6KflUPXnGov0mN9n/WnXOIzs2BJgbLftl60Z0dePdC3YXTMYQPzDupq57Nz?=
 =?us-ascii?Q?6wo3k5kLeoq9U75nyWR6+IzQC5lt7gZD5ywGgO4nP0lgiJ1/MhGpYO2o0cCg?=
 =?us-ascii?Q?pjMvZWk18GM6C2Rqdxv7HZlK62EryyipoyUMAnfUeaTZdZ/AJbJrPMedlzGH?=
 =?us-ascii?Q?Hej8+rTV262HyZm+GoVPKZdfeO6nURxtzrqOnXQdBtxYqRhFfEl0jtjXYcwT?=
 =?us-ascii?Q?isav+tu5RJqxJ3KMMRh+w4M3W9xr1aj43vBf2EmP7CQd2Gr/FytjMKRTW7WC?=
 =?us-ascii?Q?sFKvtWREAXScX2pPRcd4jRAjXcS80L/BhBHsbbcj5W2tgphYc1lpZySVlGvE?=
 =?us-ascii?Q?PtLWQ+OkUw6OKVVB5KbC96gdqasPoCTGg4GqtgflZkomxdRVj6NqWthJDa6B?=
 =?us-ascii?Q?3AphuqgQ4gjKwf+GAv8Vy7aWqSYGHyeDtrDiPYGko1fDgDX++2759lWV+6/z?=
 =?us-ascii?Q?LpkSrFjvxlCHVphwv3X1HULzJv2N77DzQ6uwp34ihdeGgQcJ8J/+Y4S4VjBj?=
 =?us-ascii?Q?Z79g4OKHBndMzlu2duP4jFkAilU6bV/W57wMB8ngR9s/GzQnnUBidkkGSssC?=
 =?us-ascii?Q?ToGRt+6LuXZ07roMv0jpZmaR4RSWy/gamjKBPrI0g5HbI3RiVbYybyrBbfN5?=
 =?us-ascii?Q?LWOXWCt0pxrF0i5g474i4s2EjWn7BwOgY6wh8tRvoxWtrHcNssiR+6ScNoMR?=
 =?us-ascii?Q?e4efO9FrkaQFAEN9eiknsVvmx3iktKGEYWd0mXhNoMAFY55PNnXHb7c2dHFM?=
 =?us-ascii?Q?H8XlRwxiWduuFllcV42/choWTZjUv4LbjPougu2xvg2oxmxvUfIZ6HS2nlOn?=
 =?us-ascii?Q?v1zM5p/rW3kINXxZOPurY0I4hdmHXdtaMhIM8vJ3OktdJHm9kuj1x0p4K+wq?=
 =?us-ascii?Q?n4AHBqGpFJB/uxEJesMJ/eWnCMFgbqo6L9nNDNtgQkE4B20kikXn89UmfcKg?=
 =?us-ascii?Q?TgihyV64Z7WmGH4kwZ5F4khdAtoiHfv8fPpXkFHFbOnE4KJSlfOm2RgpOXTM?=
 =?us-ascii?Q?BQ/KyV8Hvz9DvJQ+SkdBj9aybqk2PunU?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8929
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 67c0ba07-b18d-47d1-8159-08de133ae922
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|1800799024|14060799003|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oFGyF+fzOWhKHJIvDrANQJqcrlZlZa0pIYtPXBDPgW0GkxE+kP4HHbwcRZfi?=
 =?us-ascii?Q?7mhns6JdUHlpoSJhOz8cB/GnWAbSD3h15HRSui8Jqw97X/18rYSBUFaE2Mka?=
 =?us-ascii?Q?2rhlGpQZfH5+AqIBV1oGIx3jqezJEZq0mo8mGeoO1b1PX1nbyokPoXzx9446?=
 =?us-ascii?Q?3nMGh2mrKPmWRBPgmFs1U/KeM4AiRiH11dlHatixRgrV+m/REByIS4Nj4JxE?=
 =?us-ascii?Q?gUtv4+Q/r280QDEjIANc1ChO8QkfrXBy+BYHBC4HWnGREuJ6eE/hDRIYEqBM?=
 =?us-ascii?Q?MW6NjRkrQkLde55NgNASD6d2uxR7ZeWDo174lbsLlK8UiB9hQeFhXkoYom+U?=
 =?us-ascii?Q?c3lC2X2uU1a812nqalaBBz+GZ1F3KeFo69g37DISME0zgbjOQGkAhNS8eJV0?=
 =?us-ascii?Q?KBeFhbUQq+UKCo66o2LGW2Hn+4tmj5yqHfjuuYYlHg0GPbv7sAdqwF4UFEtq?=
 =?us-ascii?Q?NvO35QSIMMR4uoqtJXJrT6z+cEUO7TCArkHACTbO6Lk6CeczfP1loGKarOGj?=
 =?us-ascii?Q?D8KTAGFdXclAHOaFTZnRLbSydQSE+qgJ3f6A56g/eZGvt/W/5EvsLmD5nM7e?=
 =?us-ascii?Q?GeTq3py85zxVfhNv//FbXqusiV/Su5CyhGlZDOHidOdwORHwSruy7sqa/NnV?=
 =?us-ascii?Q?3+xzumyB/H5tnRyH2kLmvQqZmaXk+mP9VFYQ4I9BxVpAX0U6OVi5X4r13a5P?=
 =?us-ascii?Q?8BjeQQQNqqXDX23dZo1E4SdoM+rqPUiQ9SXVyZvNl4mi7O2RWuLRsVyBTyGc?=
 =?us-ascii?Q?XWYqTlFuDMBMbayYMwAfniL/N2FWCI8WHmLN8ZGeeErbcDy7NFGWLXeNneVS?=
 =?us-ascii?Q?K+6MYrIH+KiLmrK2cnop1u/bF2VQsOJI6X8VkxcJ0NwBWjZdXdYx2X1o5TXI?=
 =?us-ascii?Q?1268hk07Kw+JgumdBzH354zLpsh1h5Zgj3/dbXQnLzNl1pGXQfvSWXLujk1F?=
 =?us-ascii?Q?uWYFQBxq8JSYC0aUDzXlJO4SIkEGQj5OzlVCoq4M8taslJxFl+D+/ZMi0UEK?=
 =?us-ascii?Q?bzY2N1D5NscrjaWJzBElBPYOrqEQmLYrtQnxPQDsbH5EFOiSJtftdjqlCcqF?=
 =?us-ascii?Q?b0dBZATynxIlyF+JHB+y/1RDt9rxVAW2hBIIfTwZdr7PCGYSe3DxS8xs5oyU?=
 =?us-ascii?Q?sneZdY2FZyFpE8+0BteeRJ4iEOTCE1R3WnlgDx4427j3ND/IHO2i/VrjwQVC?=
 =?us-ascii?Q?cUgkdbUAOcnevzVK/HlFfRMjXg9ME93ruh0flReDY0rJkVqQkWTuo3gFJQUk?=
 =?us-ascii?Q?fPSCSOlvxjqpZsoy1JlubcSmWwdiE6g8SBlVVh9TF9Hnn1qkzQ607NfqPd36?=
 =?us-ascii?Q?7JJpwBx0wbv8MAbJFN5zcaKbU0oIeKLUvhnaQUuaJlzSbKwDUUrULkoc3D4Z?=
 =?us-ascii?Q?ne3HG3KX4Qjge1MmYATkvCLCIZwybw+A7sOCKzU3NpPkp5lM+YEkkI4sySpX?=
 =?us-ascii?Q?Z3aeXu5As7RXal3CMONIhGxaS/hk3EP59rrA47NhV8Mku3iC5ZgXiZCRcwB9?=
 =?us-ascii?Q?vAmuzUmlSURs1YZmrsnAOLJDqA+WaQO02O/Xguc/tQL9/IhhcuxrrnYMywco?=
 =?us-ascii?Q?nMoFKT1HnfN/x5Qgg+Y=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(1800799024)(14060799003)(82310400026)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 20:21:59.9569 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a24dd6-d4ac-4396-8f35-08de133afca0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9403
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

Introduce architecture-specific function pointers to support
architecture-dependent behaviours. This patch adds the following
function pointers and updates their usage accordingly:

- soft_reset
- l2_power_on
- l2_power_off

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v2:
 * Updated includes for panthor_hw.h to allow static inline function
   pointer accessor functions instead of MACROs.
 * updated l2_power_off function signature to void instead of returning
   int as we have no way of handling a failure in this case.
---
 drivers/gpu/drm/panthor/panthor_device.c |  5 ++---
 drivers/gpu/drm/panthor/panthor_device.h | 18 +++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_fw.c     |  4 ++--
 drivers/gpu/drm/panthor/panthor_gpu.c    | 11 ++++++++---
 drivers/gpu/drm/panthor/panthor_gpu.h    |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c     | 10 ++++++++--
 drivers/gpu/drm/panthor/panthor_hw.h     | 18 ++++++++++++++++++
 7 files changed, 56 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 81df49880bd8..224a9237a2cc 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -18,7 +18,6 @@
 #include "panthor_device.h"
 #include "panthor_fw.h"
 #include "panthor_gpu.h"
-#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
@@ -141,8 +140,8 @@ static void panthor_device_reset_work(struct work_struct *work)
 	panthor_sched_pre_reset(ptdev);
 	panthor_fw_pre_reset(ptdev, true);
 	panthor_mmu_pre_reset(ptdev);
-	panthor_gpu_soft_reset(ptdev);
-	panthor_gpu_l2_power_on(ptdev);
+	panthor_device_soft_reset(ptdev);
+	panthor_device_l2_power_on(ptdev);
 	panthor_mmu_post_reset(ptdev);
 	ret = panthor_fw_post_reset(ptdev);
 	atomic_set(&ptdev->reset.pending, 0);
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 1457c1255f1f..2026cc6532ce 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -20,13 +20,14 @@
 #include <drm/gpu_scheduler.h>
 #include <drm/panthor_drm.h>

+#include "panthor_hw.h"
+
 struct panthor_csf;
 struct panthor_csf_ctx;
 struct panthor_device;
 struct panthor_gpu;
 struct panthor_group_pool;
 struct panthor_heap_pool;
-struct panthor_hw;
 struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
@@ -532,4 +533,19 @@ static inline u64 gpu_read64_counter(struct panthor_device *ptdev, u32 reg)
 	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us, timeout_us,	\
 			  false, dev, reg)

+static inline int panthor_device_soft_reset(struct panthor_device *ptdev)
+{
+	return ptdev->hw->ops.soft_reset(ptdev);
+}
+
+static inline int panthor_device_l2_power_on(struct panthor_device *ptdev)
+{
+	return ptdev->hw->ops.l2_power_on(ptdev);
+}
+
+static inline void panthor_device_l2_power_off(struct panthor_device *ptdev)
+{
+	ptdev->hw->ops.l2_power_off(ptdev);
+}
+
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 9bf06e55eaee..6b91c3cb6678 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1184,7 +1184,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 	ptdev->fw->vm = NULL;

 	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
-		panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
+		panthor_device_l2_power_off(ptdev);
 }

 /**
@@ -1363,7 +1363,7 @@ int panthor_fw_init(struct panthor_device *ptdev)
 		return ret;
 	}

-	ret = panthor_gpu_l2_power_on(ptdev);
+	ret = panthor_device_l2_power_on(ptdev);
 	if (ret)
 		return ret;

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index db69449a5be0..f6181462047f 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -218,6 +218,11 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
 	return 0;
 }

+void panthor_gpu_l2_power_off(struct panthor_device *ptdev)
+{
+	panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
+}
+
 /**
  * panthor_gpu_l2_power_on() - Power-on the L2-cache
  * @ptdev: Device.
@@ -344,9 +349,9 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
 {
 	/* On a fast reset, simply power down the L2. */
 	if (!ptdev->reset.fast)
-		panthor_gpu_soft_reset(ptdev);
+		panthor_device_soft_reset(ptdev);
 	else
-		panthor_gpu_power_off(ptdev, L2, 1, 20000);
+		panthor_device_l2_power_off(ptdev);

 	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
 }
@@ -361,6 +366,6 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
 void panthor_gpu_resume(struct panthor_device *ptdev)
 {
 	panthor_gpu_irq_resume(&ptdev->gpu->irq, GPU_INTERRUPTS_MASK);
-	panthor_gpu_l2_power_on(ptdev);
+	panthor_device_l2_power_on(ptdev);
 }

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
index 7c17a8c06858..12e66f48ced1 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu.h
@@ -46,6 +46,7 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
 				   type ## _PWRTRANS, \
 				   mask, timeout_us)

+void panthor_gpu_l2_power_off(struct panthor_device *ptdev);
 int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
 int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 			     u32 l2, u32 lsc, u32 other);
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index b6e7401327c3..092962db5ccd 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -2,7 +2,7 @@
 /* Copyright 2025 ARM Limited. All rights reserved. */

 #include "panthor_device.h"
-#include "panthor_hw.h"
+#include "panthor_gpu.h"
 #include "panthor_regs.h"

 #define GPU_PROD_ID_MAKE(arch_major, prod_major) \
@@ -20,7 +20,13 @@ struct panthor_hw_entry {
 	struct panthor_hw *hwdev;
 };

-static struct panthor_hw panthor_hw_arch_v10 = {};
+static struct panthor_hw panthor_hw_arch_v10 = {
+	.ops = {
+		.soft_reset = panthor_gpu_soft_reset,
+		.l2_power_off = panthor_gpu_l2_power_off,
+		.l2_power_on = panthor_gpu_l2_power_on,
+	},
+};

 static struct panthor_hw_entry panthor_hw_match[] = {
 	{
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 39752de3e7ad..2665d6dde2e3 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -6,10 +6,28 @@

 struct panthor_device;

+/**
+ * struct panthor_hw_ops - HW operations that are specific to a GPU
+ */
+struct panthor_hw_ops {
+	/** @soft_reset: Soft reset function pointer */
+	int (*soft_reset)(struct panthor_device *ptdev);
+
+	/** @l2_power_off: L2 power off function pointer */
+	void (*l2_power_off)(struct panthor_device *ptdev);
+
+	/** @l2_power_on: L2 power on function pointer */
+	int (*l2_power_on)(struct panthor_device *ptdev);
+};
+
 /**
  * struct panthor_hw - GPU specific register mapping and functions
  */
 struct panthor_hw {
+	/** @features: Bitmap containing panthor_hw_feature */
+
+	/** @ops: Panthor HW specific operations */
+	struct panthor_hw_ops ops;
 };

 int panthor_hw_init(struct panthor_device *ptdev);
--
2.49.0

