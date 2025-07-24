Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36068B10A7C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 14:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEDA10E205;
	Thu, 24 Jul 2025 12:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="dw929Kzd";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dw929Kzd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012031.outbound.protection.outlook.com [52.101.66.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770AA10E210
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 12:43:18 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VGU+csmTicL23zQvMQ7NyCnUCuG+p2utt+odkf3+/JwT4nOgUd8HK+EdPnQrg+x/7gNN5sZHkUly5k9FlL13k8uW7+cQQDrWuLS/GA5c2O86kDEDBS1xkG40EbqB/070dkX7VLDiXOxMVXIxzDefw20z1H96J/OGd4U58BwucqvCYmK/JT0JYoCr5tu/606iJ1GiDkPBSFJEUAAdp0MRE2PmLr16AMmeNSulYUhNHDBFmojH1pPRt52/6DVwahklqNDcAetdOrbUE56wSytRIDePWHRjkWrQ+YDUFrS6XdIxywunwnbbeXU1mi0NNjjm5GGB0Bv0N/fd+f5InNVAiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mjgVoDuFVFbCu37TmdReHBn3HfnSCYbKodLzFSwml8=;
 b=nuzJleL7w5B82g4c4CRQ4ozSJSIZM4baZ61T0vly6YSk+F0dQQU4yVNIbOlbr526qCKMxh8oT8Cha8YmKlWpFhRvFkOFyNUjgIbIqBibgolFrFhSrpOAgkWxbe9VtU3RtNPE5MyTHYcgSNf4+5dB4RTbJxlh+EibLpw+b2PNlQgkQ48u3RGVWz/+79ilRaobS0Oy1QahxnWt/3wGrrw91V4SOA82+d9h38g/BAPPZlCqNwvTIC1nOvQ+xUKiYEdCWV34FRjjOGORReY17QG6XeDTjcb4EtlQdnPXHJetg03lGjCW5E6rx7lRB3DUF0umArZ1DPacdA6iJU2hbWrN0A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mjgVoDuFVFbCu37TmdReHBn3HfnSCYbKodLzFSwml8=;
 b=dw929KzdcY59wpDStetyezZLcci2F8FXaOL/Pj6kmEbCc4sH5V/kQnVRtVOZUoubhC2eGsrnXMQhjPeRl+NpYfJsQ72nwA+JDNFz7vBRtT9EIqbE91+jxlfpEZ5qER+wNez9DDHwJzNroinSFbvHxCtgEZ830YYCDAf+BTy0C+A=
Received: from AM0PR04CA0142.eurprd04.prod.outlook.com (2603:10a6:208:55::47)
 by DB9PR08MB6650.eurprd08.prod.outlook.com (2603:10a6:10:26d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 12:43:13 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:208:55:cafe::96) by AM0PR04CA0142.outlook.office365.com
 (2603:10a6:208:55::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 12:43:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.1 via
 Frontend Transport; Thu, 24 Jul 2025 12:43:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4PUgcYy5TmMZhNh++O08lDzqct8T6gV+bD5iLiLYwC5Cjq7nROhk9/SyzmS7ijy3h33Em74NBjo5HxnDCQi2gguk375KZRneM4jqE/z/NLIy5knNzdp9x5IeORAz0WMuOEEE3B8V6QoVb4W0RX4Zqz7BKdskcCfLErX9eozMUmvZLO0oKpE4uilEg+tXZi0xHQZT7Bd9Sg/UEs50VvMqi2kFMOgkmIKclhbFB3DUd8M3ixU83F+t/bmwIswt37Ym0T92591v3RfuhRLDQmPj9bhTvnwc8gytXjPjFBO7pNN+WBdK0zFu8DVns+CbeSvkwJ91fGoyUJ4RoaLK7wVow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mjgVoDuFVFbCu37TmdReHBn3HfnSCYbKodLzFSwml8=;
 b=hS7fm8jFurZM1gvYji8VtuCBlhj2ENDvkRnchPGcVGw6dpjiodzduIduJLf7dH/icE3mGg50zKV9qGWBKl+eZVTDhqX0dvkoTWW8WDFHO/ekb2jslooSr+FlYEYgeChd1nIoOwH7x5IzNQnl5o6xzCU1Smu+xvCzMCb0VBY2HEi0t+7Kjp/j2XLQvuRhV41Dt4DLwA1b7ZoS1iDLQeeqOPyZp1KR3qKJmHoeZnEbmqjGI9O/477YCv4qL/P2Z76Pyw1HWC60SLTN/tT2wPMX9ayCj1zaNqHxMTl9VpBpRIpiwwJhe8f+9hsuWH0EcARF7SB/R+oaZkElJ5QMaFKcRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mjgVoDuFVFbCu37TmdReHBn3HfnSCYbKodLzFSwml8=;
 b=dw929KzdcY59wpDStetyezZLcci2F8FXaOL/Pj6kmEbCc4sH5V/kQnVRtVOZUoubhC2eGsrnXMQhjPeRl+NpYfJsQ72nwA+JDNFz7vBRtT9EIqbE91+jxlfpEZ5qER+wNez9DDHwJzNroinSFbvHxCtgEZ830YYCDAf+BTy0C+A=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GVXPR08MB11183.eurprd08.prod.outlook.com
 (2603:10a6:150:1fc::16) by DU0PR08MB8496.eurprd08.prod.outlook.com
 (2603:10a6:10:403::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 12:42:39 +0000
Received: from GVXPR08MB11183.eurprd08.prod.outlook.com
 ([fe80::3bae:b721:e01e:9c90]) by GVXPR08MB11183.eurprd08.prod.outlook.com
 ([fe80::3bae:b721:e01e:9c90%5]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 12:42:39 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v8 4/6] drm/panthor: Add support for Mali-Gx15 family of GPUs
Date: Thu, 24 Jul 2025 13:42:08 +0100
Message-ID: <20250724124210.3675094-5-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724124210.3675094-1-karunika.choo@arm.com>
References: <20250724124210.3675094-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0236.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::15) To GVXPR08MB11183.eurprd08.prod.outlook.com
 (2603:10a6:150:1fc::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GVXPR08MB11183:EE_|DU0PR08MB8496:EE_|AM4PEPF00025F98:EE_|DB9PR08MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 48906410-823c-433f-853c-08ddcaafa691
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?2pjVgxYGGI4EY/qoLNmR6uhl9wo7d1VYJc7Bgn2xwSoYgo/EmZKXecFTp7s6?=
 =?us-ascii?Q?p/Ax/Gh7YICInXbewd+R96/EBcNmskLG4DAYM23Gfw/ppkb6ui92ya1Ujt+Z?=
 =?us-ascii?Q?7Jh5MeEP+3M1AIp/D1bH7GuzGisLbTK+A2dyPXA8u0aMAPYlLi60nuXxIjuk?=
 =?us-ascii?Q?xgHuMAtscpXcEBv7t6k62F3q5G6WEE4RWO1DJkdUua98ihqg1elNqOTLn98H?=
 =?us-ascii?Q?68s+oAg9WBV9LVXh7n3YsK/02yZeUv4e36+0LpPX/jlzjd7F92B1rSutrHSS?=
 =?us-ascii?Q?xzUCEA/6n1bJc93HpKALvbKpMQVFQjd6VWi1CKA19FRKgLhuNe1ZjZXjnHym?=
 =?us-ascii?Q?iSUe+nAJdrfrJiIFd3eRDc/8lEG29VJzrtnyAq4DxTzHqOEt0WQkyuXD0nQI?=
 =?us-ascii?Q?om0u3LponZABd/qmlR74u9K0rhTOl3+R3EBsiXmKshkISgS7XdeF0YaDXNpr?=
 =?us-ascii?Q?3WEQ/v1EngT/r6wgYccaPWFE6GLRMfNxTLj/4y9eL87cE8bnB+qMJ/CUbnnV?=
 =?us-ascii?Q?h3FwXB+5Gq599Af8+efYSDeQBqQz0TDo8laR8ZVtl6W+88kFAv78Ca900cCM?=
 =?us-ascii?Q?qLMgNdtayg9ZW2+0EwIHL4FzHKHR2m2IT+5zUNO/S/AJwynOWNxv7+T0JVd2?=
 =?us-ascii?Q?9621FAXtIQCP9DCRs1lrr7XVlF9y/lwUaUUz6yJlyXFi1hE/4lEoJwpIcjRp?=
 =?us-ascii?Q?YivOA7fxv9Gw9ifQFoSPp9gHv5tA40WCa+eFa1ovm43eZ/Dc0HVS3yoeheeu?=
 =?us-ascii?Q?4zapfOsKgkfNSTLUYud41eTHCyT5A8HcNL+1eiUMbx6y+LCNYwcy0Mjxp6df?=
 =?us-ascii?Q?dYnkVqkDoSyQQGg0BvyphE7UyAI5hI9ENOilxC67nyUGQ71A5gscfTRYP3JT?=
 =?us-ascii?Q?VLumgOE81M2ItZ8bi13boue9lPx/kZwAfRwcrMvecA7UpuJU7akmfMO9qWCR?=
 =?us-ascii?Q?6R3PEZLoSl7tWhdPk9hUX4oNjja0cNUyLq4xwjGPewM07nPvKIT6GQsXPoo5?=
 =?us-ascii?Q?hlX+Dnop05094rLNuamvT90xXSBtEItFgJs1T3aNjLXH23KmcRfbRtF0CK0s?=
 =?us-ascii?Q?8anYf1J9fyOoR6CY6X8/fZ8cOgboFRz8ZggXxBD+cA8NNLz68o2nurVo0iGj?=
 =?us-ascii?Q?a+ZBS150OqYa9yb0tOVGJuiqSaNvMcjqy9PSEb4l+e/XeZtExUBNnDiqLvDD?=
 =?us-ascii?Q?slTUb1pXVZp/XvpTvd9XtEGZtvfOTwZuobhF8pBTGy8rWpqgHycHlxcPKZvW?=
 =?us-ascii?Q?l10rZYOeDmpCzFoVxLbtBMj8RgVldbF9MtRUergUZPmWwSksj7hSi9e8Jr/+?=
 =?us-ascii?Q?MT8WUf1fghY/WFX9fb/1ly3Uy0hqBju1GsV6uKtm4by0MhIwJQNVd3zKGIem?=
 =?us-ascii?Q?eaj36GnnlwMJbqKwF/L7zyNJwdcZTIfLg9bPwUhMqt6YOtOBmQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:GVXPR08MB11183.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8496
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4bc9a289-70d6-4507-3909-08ddcaaf9318
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|36860700013|376014|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iZYLj5PtCDI2aLr6ayNsvK2SwTjUMEJaykC5MvjCEba51087pJgp7zNnIR9x?=
 =?us-ascii?Q?3op8o5tBINsSIHPicM+uMBD+5wjkrpcYgs2T0iueKiF6ishjPFw8zhfa36sA?=
 =?us-ascii?Q?Q1PsP0PvJtMjGXwUkt/g0ABCNoCXtcH19wE9mTzxLx7PRxDKlJE6M0OJOV+d?=
 =?us-ascii?Q?LIq+zOFLieutvWWo8iSkY6/2ztipXvR0Z88TsOs65JR9WjC1uFACKcj0gclk?=
 =?us-ascii?Q?3KrmKFRg0D4rRWMe9g48VZ6YMMeuzJQXGozI41OzcxpJeDQ0XR+Zz+MAAtbW?=
 =?us-ascii?Q?My7Gqj4dLrZwaQMsKr2g+rtxvBcsWrVjsqTpynATY9nP/D4kzErygl67q46i?=
 =?us-ascii?Q?jhUFha80Wbh5WzDJDKKb8NHyiWvigiP5+Wr1m/Aa1kI/4dGf2L/dXIseV+Ty?=
 =?us-ascii?Q?ZFBwYAeGltxn2tCNqPyJKksaKerofwJJLMtCsubxmis+g1NdCX0YwpIvEcaU?=
 =?us-ascii?Q?C5Ocj8g9lB6qBFzTeedzONmGGTMzlpRX2VMJqhqZTlP5+NWTbevsvTp2yuK6?=
 =?us-ascii?Q?o9GaLjzHKL0rFDQRD7xHzK0u2zHLFev7GnZozG5pI0BnlqdbfrwAFOpvUbOk?=
 =?us-ascii?Q?9oKlobb5ijAtFcELfi504DvT/D8JjmiQVxlOPUzGOTeMzvsvvshFN+bgOpe9?=
 =?us-ascii?Q?NPbRolpgbfQfq7Os+Z0Jy/L9menvK1/C9PmSL0H0CcIy+0zw3833DIOyxmv5?=
 =?us-ascii?Q?JzSIy1L+dQ6dOc1FhI+XGLTMkpSWlu99985rwG4i/kB4Y9bUnSozoOBuL0pl?=
 =?us-ascii?Q?vVB1gQpNWWRYlItslt0Wt3fifccYQnMcZLOnxmeTtAxJseU2gTBJCCUKCpgO?=
 =?us-ascii?Q?hQZGzgZyz8/vI7jYwxyqGwhUgSMFZyigFizYw8LL+lk2cjBA8D/BJk02FyM0?=
 =?us-ascii?Q?dTRhOCXWTDhpCLzKNtsZ+r7MmfkdFofZSx7oa/nvu9nbpyQH/f2mrJzrHPdP?=
 =?us-ascii?Q?YRy4ZTVdLlOOmn8ob69rmkVWk0l5N5BNfs82iJyRyIpMu4IW3/Etv523eu5A?=
 =?us-ascii?Q?7RDVtryvW70UFSG+WxXyESeapwpfv5YHOqhodpm1pZkmSvIIhnGJywrHcBxN?=
 =?us-ascii?Q?Ffj1a7V0YjclMzwIbpmKo0UGGSNCYIE67qUtc7shtB57UAnGRvIgKVJbqP3L?=
 =?us-ascii?Q?LcY9UOG7wylzSY579i4gvt1V5VlHFV1NLJgV7E70+42TaQNz38rpc+2yGJzB?=
 =?us-ascii?Q?af7AQyhsczBoT5P+1+wrnZw/CWR7VOkEzaEMbFl21gg1X1E+atnr6RUtoSom?=
 =?us-ascii?Q?TrThm5rDP/8IES6M3Yd7z5GqnqZaEjJNnSmdWxHf9fCbEdNOrtb82CYCMX2I?=
 =?us-ascii?Q?HmVWkCVqkfJ13+03VuYmjoSUPAfINfhzFRX68ybSQdb9XSIqRA5psJBY+6Rn?=
 =?us-ascii?Q?R9FpdH8cfB87ZgIrT9ebDjHIjf1I04xE7UIBYZ4KeEnaalALHn3DoUPDAUgW?=
 =?us-ascii?Q?Fe5nk/BGOEbkShEja8GogyiAvhh6QRndYbArkxw2HPFkcDo7J3mA6g=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(36860700013)(376014)(1800799024)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 12:43:11.8230 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48906410-823c-433f-853c-08ddcaafa691
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6650
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

Mali-Gx15 introduces a new GPU_FEATURES register that provides
information about GPU-wide supported features. The register value will
be passed on to userspace via gpu_info.

Additionally, Mali-Gx15 presents an 'Immortalis' naming variant
depending on the shader core count and presence of Ray Intersection
feature support.

This patch adds:
- support for correctly identifying the model names for Mali-Gx15 GPUs.
- arch 11.8 FW binary support

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c   |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c   | 15 +++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h |  3 +++
 include/uapi/drm/panthor_drm.h         |  3 +++
 4 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index b7b454d16f12..fa6e0b48a0b2 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1404,3 +1404,4 @@ int panthor_fw_init(struct panthor_device *ptdev)
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 6d2ad3c8cb5e..8c041e1074a1 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -13,6 +13,9 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 	const u32 gpu_id = ptdev->gpu_info.gpu_id;
 	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
 						GPU_PROD_MAJOR(gpu_id));
+	const bool ray_intersection = !!(ptdev->gpu_info.gpu_features &
+					 GPU_FEATURES_RAY_INTERSECTION);
+	const u8 shader_core_count = hweight64(ptdev->gpu_info.shader_present);
 
 	switch (product_id) {
 	case GPU_PROD_ID_MAKE(10, 2):
@@ -23,6 +26,15 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 		return "Mali-G310";
 	case GPU_PROD_ID_MAKE(10, 7):
 		return "Mali-G610";
+	case GPU_PROD_ID_MAKE(11, 2):
+		if (shader_core_count > 10 && ray_intersection)
+			return "Mali-G715-Immortalis";
+		else if (shader_core_count >= 7)
+			return "Mali-G715";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(11, 3):
+		return "Mali-G615";
 	}
 
 	return "(Unknown Mali GPU)";
@@ -53,6 +65,9 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
 	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
 	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+
+	/* Introduced in arch 11.x */
+	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES);
 }
 
 static void panthor_hw_info_init(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 48bbfd40138c..8bee76d01bf8 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -70,6 +70,9 @@
 #define GPU_PWR_OVERRIDE0				0x54
 #define GPU_PWR_OVERRIDE1				0x58
 
+#define GPU_FEATURES					0x60
+#define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
+
 #define GPU_TIMESTAMP_OFFSET				0x88
 #define GPU_CYCLE_COUNT					0x90
 #define GPU_TIMESTAMP					0x98
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index e1f43deb7eca..467d365ed7ba 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -327,6 +327,9 @@ struct drm_panthor_gpu_info {
 
 	/** @pad: MBZ. */
 	__u32 pad;
+
+	/** @gpu_features: Bitmask describing supported GPU-wide features */
+	__u64 gpu_features;
 };
 
 /**
-- 
2.49.0

