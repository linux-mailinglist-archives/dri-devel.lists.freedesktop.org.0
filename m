Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFC2A77F6B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F61A10E5FF;
	Tue,  1 Apr 2025 15:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="ZB4XxlhL";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZB4XxlhL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011054.outbound.protection.outlook.com [52.101.70.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8717C10E5FD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 15:48:52 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SbPx3Hf998mSku/fUNo3GUDYJfVNjye6c1Jx0APYldiNvpyrPKBs54BmUDMC4O+eXdfMY2O5w5PWZzQP8UqTdmojVe+SMJ2AfBxcnxwYR35yG5AtzEKcDJTx4vbnphab6HKMWUIJgSLLVdwmX0RgYKqG6kZ+hJj/K/Ie1n1ozq9qxuVnjZjnSFfKPNC5OwG0yLDVevDldHwiMcFYAtSQ02hpGnr5swC1JlkTdnhNweTDAWfW18+ZdUZBOFU0hyesJbMyNwLKByk0jcWfA7Iz4X71981B7x/pVRubN1cPUsMCWRnMgloh8UbF+4QtgKQAPtQyflOOI4VoyfgdlqIR3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKToYnsnhK/atjtQcUyS+m3lGaKZADzK4Xhkt3mZuVo=;
 b=PoQUD+RTTPvyMnQXMD60GpLSxTMpE+8tuHE2Oc70wu+f0t01tZfszp+38lOtbY+P9iY5FT5kT5ODGo97ysMF+jAh2NK8HMTPw7Gl4Wp9nKzBo9DUYILnY1qbqvX5cALSInxE95WkKa4C0HXKTTom4mZeHTbWmPY0eclFvV4utf1ujrwRw+enSZOKTq+zjObEke8HdTwxXWkcoiR1APmNFdFaDv6Wf7AQmCu89v6plgbp61YmzJzDhulvcz9cLTGw+vKf3h7eoqgCMrFDjBbvPvxQPbEoB09qTHeghemwiJrquDKnajgCk0w3RjPuODxWB5ASbCj6Pe38lPp9/adn8Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKToYnsnhK/atjtQcUyS+m3lGaKZADzK4Xhkt3mZuVo=;
 b=ZB4XxlhLBJzUytrgYqaEHiYB5nHTNaTFSoJ1iZh/P0dCn7o4B/4W7EWXOTr9tz/Sh7pkXFeT6GeM4Cqmj6eL0mLJfAB2eagtTFuVsHlaeCh+1DZwHaBlWCOZJTKaTgD2qwylGPn9OR+LwQWJCM03w/NAbCvGKFl/fNHlUbsjIps=
Received: from AM0PR10CA0132.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::49)
 by AS2PR08MB8647.eurprd08.prod.outlook.com (2603:10a6:20b:55e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Tue, 1 Apr
 2025 15:48:46 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:208:e6:cafe::df) by AM0PR10CA0132.outlook.office365.com
 (2603:10a6:208:e6::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.39 via Frontend Transport; Tue,
 1 Apr 2025 15:48:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 1 Apr 2025 15:48:46 +0000
Received: ("Tessian outbound d933a9851b56:v604");
 Tue, 01 Apr 2025 15:48:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3fdee01f070c5258
X-TessianGatewayMetadata: zdau7lNxuKT/PBcDwz3JCS2lj63ukJ2jrJIWxTaUjM4J6d/6vgGv2Uba6bRv7oVwjPrFR7AVbtJd2w2lXo0EC7ypRf38cXS0EBPE8gRernDiHiVlJ4Fv6w5eUk61eC8BtMmtjqw2Kz7GPm42uGpB0DedA5fQQA6MXUpJUpWUmae+F/l/q0nIP+VWkx+pkSzP3TzAnnKjhnU+Noi4B2eyuw==
X-CR-MTA-TID: 64aa7808
Received: from L12314321001d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A8011DF0-7E90-4AE2-B5FE-6DADAC91EE5E.1; 
 Tue, 01 Apr 2025 15:48:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L12314321001d.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Apr 2025 15:48:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSx1CPoRt16r07GY7pWLzthTJMdFmrhOJY53q3dMq4FHZahsLE8CoEey/1+bpyGDgEVMTdTnqPjegb/wT/XPXeUMyoywCEazb2t7wVJMvSfaO2inGYQ79K1IU6e+O4e1Q5Gy5KAjKlYj4eEZ+sGaXLxlQN7f//vJ/Nx71srbCNj7z+U2druhY/VUOk/+Su0IE+W/5y/yChHlwEvq7HhL1FwwD+Atj4JSVLoV2hTzwAw4A+UWh4M0csElGJUbSXAYNTBmfSzd563jETc1hNHj9tF+7L1Ow+nTeiXgX8zQQWJ+/wJg+uzXrFqIvlyvbxtHvlTNSIeqmY+KPk+WCZM6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKToYnsnhK/atjtQcUyS+m3lGaKZADzK4Xhkt3mZuVo=;
 b=IQJHJzMawE3owv7ibm8XZ5HwRvxl5ZHCzxPXJWWTvgk5o6v+ra7w319dnhnzfxG+JaiuolZ9Ps0qS5AgWzWDUH/xSl+OGMMj2lquNpaKRof+01mjMyoggF5Bzbd0v8y/FcJJ+oxnJ6IGxCypgbGQjY0CSQyGRCfn+C+SrRFS9RaiWDOukNXR3ZQycdW20Bsvt4QqLMrj6ZfF712POI3BTON0Xz9S83SwY7jWSrje8IzGVtdgzSd1UyvhVaK+TyIP3FuzJG9z0MfOoVY7yusTlrfUPvS6A5SJVxTKE2BGVIrBz3uh3FCpXZ9YiCHlK7jkm+aUWcDZMpd1bNmUIUNXtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKToYnsnhK/atjtQcUyS+m3lGaKZADzK4Xhkt3mZuVo=;
 b=ZB4XxlhLBJzUytrgYqaEHiYB5nHTNaTFSoJ1iZh/P0dCn7o4B/4W7EWXOTr9tz/Sh7pkXFeT6GeM4Cqmj6eL0mLJfAB2eagtTFuVsHlaeCh+1DZwHaBlWCOZJTKaTgD2qwylGPn9OR+LwQWJCM03w/NAbCvGKFl/fNHlUbsjIps=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU0PR08MB8279.eurprd08.prod.outlook.com (2603:10a6:10:40d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:48:38 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 15:48:38 +0000
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
Subject: [PATCH v3 2/7] drm/panthor: Add DEV_QUERY.PERF_INFO handling for Gx10
Date: Tue,  1 Apr 2025 16:48:17 +0100
Message-Id: <203e6c8f7e82068fd570896a4302757247980c09.1743517880.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1743517880.git.lukas.zapolskas@arm.com>
References: <cover.1743517880.git.lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0047.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::16) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|DU0PR08MB8279:EE_|AMS1EPF00000049:EE_|AS2PR08MB8647:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d15991-82d6-42d8-6e96-08dd7134b05f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?T25hd2lVMkV4dFcvNnU0eGZVd0Z3Tnc0UUxYelRCY2wxY2FPOEpkSVNETm91?=
 =?utf-8?B?NExsaGhmT0RtRXVqbXk0RDFGU2JjNVkvTDJ5L2laSTFicno2ZWwyeERPN2Vm?=
 =?utf-8?B?N1p4UWN0VzYybXdoSGUwZlpoS1BJMnB6ZEQ2RTdjWFBYNnZndjYxbW9XZjg4?=
 =?utf-8?B?NFZNYUEvZlpCajg5Y1BnYzZtUUxKVSsvREM1YmxrTU9lTlZGR2dqeTFPVGlL?=
 =?utf-8?B?L3NnNkJjd2tHVGp5dUtDc2UvampvVjRrNUFtWnVZRWMzOU5KUkpNd3JiVDVE?=
 =?utf-8?B?Qzh4d3RZcndkTTZJTVJJQ29zditwVzdrV1J5WUNyUVdkM201eldqd3AyRjEy?=
 =?utf-8?B?bE13c2Z5cGc4NW1rS1ZBZExVam96KzI3SGNseWJ5SEhGcW51cGNSeVROVGQx?=
 =?utf-8?B?ZmR0NW01OEFDRlk3cVErOUJFT25ETmNYUkl6RGozZkZuSXVubkhBVktqNC9Z?=
 =?utf-8?B?VlNiLzNqdS9HcTcvSDJaV1FWZjR2ZWJFOS8yODBVdnhYeUFlUWNIRWczQmJn?=
 =?utf-8?B?MW1ZMXhNS0JZbGpGTWJkSnhRYWQ4WGFDZnNGMlV0TVZIVDhKSHJvcU5MWVdP?=
 =?utf-8?B?KzlqcEgyZVNxS1RjT2ROSEZpUE8wRmtFMms5RXQ1aXlvWnZjSWNZVC9jVUUx?=
 =?utf-8?B?c0wrdXViZ0ZmckF3T1g2V2lrYjE1aGUvWGdsWTY1cXErNW1DN0RtUzRBbjcv?=
 =?utf-8?B?VHViQ0NxZXJXaFQyVTgzRU5pbmVZSkE4L0VXaU8rUzNqTmR0dUNHYzhBSDJs?=
 =?utf-8?B?VnpsbVZ5VWJPNmdNQzdIVmp1ZVZNZDkzVUpHUFpRRkNsWjZOZVJabFVaZlMw?=
 =?utf-8?B?ajR5a2JrVUtZNHVxRnRia3p0YmllMWJaZjhPbEt3NnhXamFaZXo1ZXN6SzVT?=
 =?utf-8?B?eHUxSFFNS0lwL0tiRmdscUhRK3hBeHVVdDhCWGgxcGIwUzJxNUNaVVluZXBU?=
 =?utf-8?B?UlVqNDM4eUhlQzArYUVQSDd3RnRJZWJwNjFLbDFERi9memxVTmNQQlpIdDdT?=
 =?utf-8?B?N3dvUlBzVVBFOVlPUFVrYVIzSE9RRytOZHdWRWxMM1BpVnNlLzRWYzNmdk1F?=
 =?utf-8?B?bllMMkdhVUdQbzhLQ0RDLzFIUitGQndEdWFoRUhVQmNObHNhTnB1VUhKVGFP?=
 =?utf-8?B?YXMxQUVDeHNPdFdKWXpCTnBBZjRrSGtORmUzNFM5YkdtY3FIMXZsRFBNQkxu?=
 =?utf-8?B?UEk5ZkJuM2IwWllGUGZYdjRrSkFmZG5TVmpjdzNMbS9IUEhZcy9HRHJwMWZr?=
 =?utf-8?B?a0RsLzNNRUVFV2FaR3MzcVE3cmNqeHZ3ZkFEdUdPc1ZiQ25ta0hzb1NQckFo?=
 =?utf-8?B?MCtBazFyczVyb1lyYXhrOHEyZ0lhTUhZSXJXUWdPUjRxRWxLYUtaVklnK3R3?=
 =?utf-8?B?NUZiaS9pTk90NDFicVdydkJUbzNqL2o2QjRWWmxnQ1dJNll4Nnd1WlJmM2I4?=
 =?utf-8?B?OC9ibmQxZzc1c0hGbHc3cWpVVnBiUjlvVzhseGEzS1NZSVVjaDI0S3I0L3lS?=
 =?utf-8?B?YXFtYnB5V1pYMlRIalpsYWwrSXlleXlsL2wzRFhJOWFtYkloUEFCTzZXbzBW?=
 =?utf-8?B?T2t4ajFVT2VXNyswYW5qcHFTbElzaWdzaUhDdG5PUnA3TWlsQzdTaktZT1Bu?=
 =?utf-8?B?UCtmYnh6UFBkb1B3T2owTU54cXptbDhpYm5WSVBVT3p3b2p0eHpWNWx2NEY3?=
 =?utf-8?B?K1M3R3ZPTUpSdTZ5ZWhOMDBDTk1IMndxbjJPeTc3SDlOMG1xQTkrQ0FrVW9w?=
 =?utf-8?B?T3RTWURwdVFMbzI0bE15T1JyVmN5dFBCMU9tMXhCTnFNbkF5Q1Q2ZW1NMU51?=
 =?utf-8?B?RjhnUlpVaWpWWWN5L1krUEcrQXVEbUtuVzFRUkVwV2lxL0ZXV3FwYWxGT3VV?=
 =?utf-8?B?NGhDb1poQy9TbEs1QjczZVgzdzlKNEd5cFdWWE1wbVVCSDJIdTZWVm0vb2FN?=
 =?utf-8?Q?+SEC48H7oXA=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8279
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:5c::16];
 domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 22075fad-1163-4046-218e-08dd7134ab1e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|35042699022|14060799003|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlA3eXpMZy9xTEE3WXlCTFpYVDFUZWprenF1Y09nY0h6ak5nRnhnNG83bjdW?=
 =?utf-8?B?N3dMcDJsank2WSsrMURGYkpvYTFBSys4TUFZL1hVVGhST1JzZjRraU9iaWR6?=
 =?utf-8?B?RGJrdGJIT2hrK0s4L0JGQlk2U0lESWhoZjhkdUdlZ2ZGNkYwQUVqTnBXN1Nk?=
 =?utf-8?B?L3pOcGhIZEp6bWhwWGFzQ1BuT3NXbjBzeW8yVFI1YVE3bG10a2dzMEY4ZWtB?=
 =?utf-8?B?L2pYamZSYVIzc3UrUlV5M3Y0ZjExanUyNjBEaGJqeTU4VVFIWUlNcVVCVWo5?=
 =?utf-8?B?WC9XWmlGVHc1Uy9sQ1pCRmRSVGs0SC9jMEFYSzR3TmxZRWVsNCsrVU9zU3Z1?=
 =?utf-8?B?citMTGZlZWxmM1gvdmZlWDh1dVNsT3Z3RUYydWFEWVo1djRzWU9GcmFuV1VL?=
 =?utf-8?B?MHlMZy8vdWZrTFlCL1BkMnhiMkdEaGpiaTU5NFlxWHQ4eDhmRjREQU5IUUta?=
 =?utf-8?B?bVhydGIxSEZ2aG9DdmlocnlacDh4VFJhSlZEb0M3KzhqOHB1N2FyczNaZ3dj?=
 =?utf-8?B?MFFkOFdmUTZuZnBOd296aGZ6QXUydDBSUFdzcFRkSC9OcHFKc0lqOWo0Q1JP?=
 =?utf-8?B?TDNTdmdhM2dGYzczbXUvS2o4VkMreTFEQ1p2dkYzdFBnT01iSS93VjFWN0F4?=
 =?utf-8?B?bE1peVRzQlVoRDlCS1dvZ0FRRWJybFdVU2szelZwOVlDN3BQbTZoL0pHeENk?=
 =?utf-8?B?eG5ySGhQR0EyY3BFT2FEM1VOYUpPbGdFby9XdW1nOElVV1UvOU9WUEIxZnpV?=
 =?utf-8?B?VzRRb1JDT0xsOHhrSzdDOExiWVB5YkJ3ZS9iWDdpMmxIMGh0WG9TT0pPNGs0?=
 =?utf-8?B?NkEwZmwyRUVxeGpQMEZ1WkRsS1pNOXgxL3JDTTJKaXVkSXNtSTlXSjhkVk5U?=
 =?utf-8?B?R1h0blVsN1NPUDJQV05saFZPSU9wMFd2NjZad1kzTmFPZmZqb2FEZ3ZQcXBq?=
 =?utf-8?B?L0FOa3ZhK2Q5RWZrRSthU2twMnMxczJvcHBQZUFGMUREaGR3bXhUYWd0dDRF?=
 =?utf-8?B?QkdxbkJmZjBiMzZhcTVxa24vL2U4eFdkSmFQNXluNlFmWXd6OXdrRDEvU1N4?=
 =?utf-8?B?aWc2bzhnYmZuVnU1YStUOUJkV0g1VkkzUHo0S3dPcjU5RmNiaUU0UGUvT1Ry?=
 =?utf-8?B?VGhiWWZ6cU9veGhBblBRNWc2RGtmUnZxc3IraTRLUWt4YkEvWVU4cytsYzBh?=
 =?utf-8?B?Q0dML0l6SGVPQ2VwTDFvem9BQ3FySjdLY01ZSk1UeTN5blpJOExMMUJCRUJo?=
 =?utf-8?B?Vm9hVDZIV29HZXBYZHp3Z2VHMlF4aHNqOVlKdXZDYnE4cFRVbEZEcGhuM3NP?=
 =?utf-8?B?RzMvUWhvUFUrdkZ5UHF6WGtuTmlSNVJtM0MyNkc1SFdDR1RXdkJxLzRqUmVr?=
 =?utf-8?B?dlFvRzdXd3ZuZXBKOWJSZ3M4SDFDRms1M1dGSStOVVdzQUZ1d0ZGUm8va0Jq?=
 =?utf-8?B?VkxYRkszY2xMM3dJY2Zjc0t4ei9Jc3BIaEdvRDZIbk9kY1pwRUhmU0ROcXNM?=
 =?utf-8?B?eXAyejVGcVgrcDl0RWxRY283MEQ0dHJ1QjVPbzcxOVNLWnVWdDhndUFqMkZ2?=
 =?utf-8?B?NzVhaFpuT2pYb2RtMTllZUZoakhJTCs5Y2F3UVh6WnZISXV2dXpFZkJrZmhT?=
 =?utf-8?B?QmJ3dHJJQW9Xa2hZZlJyQlJzcFFZQVBraUM1VlZWakU1cDh6T1czcUMyUG9Y?=
 =?utf-8?B?VDFPL3FjTjFkem1laFZhSHpoOFZvaS9yM0lmRCtJd2RESkZoTWR4c2FuVW4r?=
 =?utf-8?B?YlBLWE15K0UxRVV4WU1VbFZvNVpFMGM2L1BGc2JrWld1MTllUTJ4OU1CN1V4?=
 =?utf-8?B?TmxMbVVNQkd4OUd1YkhIYWx6d2NYZ1dEd1hKZXYvMDRtWmFQaXdDamptVDZk?=
 =?utf-8?B?OEdVZy85dlNteGhFSHQrSDllRXpCUzZ3elRGS09oMTk4Q3gyY1EvWVhJVk5o?=
 =?utf-8?B?enhnSGxRc2NESGdxNXlReVF5R1MxS25aY09FaTBqbTVRSzBFZzk0aG9mUmtR?=
 =?utf-8?B?V2daMEZUbnk1TTEwK2NsTGZSYStaRmcwcmJWdkV4ZTVIU1FZYTNCbXBuRDVS?=
 =?utf-8?B?N0lYMGFLMGx3bFArMU5scENxbDRRaS9IbnRrZz09?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(35042699022)(14060799003)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:48:46.7135 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d15991-82d6-42d8-6e96-08dd7134b05f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8647
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

This change adds the IOCTL to query data about the performance counter
setup. Some of this data was available via previous DEV_QUERY calls,
for instance for GPU info, but exposing it via PERF_INFO
minimizes the overhead of creating a single session to just the one
aggregate IOCTL.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/Makefile         |  1 +
 drivers/gpu/drm/panthor/panthor_device.c |  5 +++
 drivers/gpu/drm/panthor/panthor_device.h |  3 ++
 drivers/gpu/drm/panthor/panthor_drv.c    | 10 ++++-
 drivers/gpu/drm/panthor/panthor_fw.h     |  3 ++
 drivers/gpu/drm/panthor/panthor_perf.c   | 55 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   | 15 +++++++
 include/uapi/drm/panthor_drm.h           |  1 +
 8 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 15294719b09c..0df9947f3575 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -9,6 +9,7 @@ panthor-y := \
 	panthor_gpu.o \
 	panthor_heap.o \
 	panthor_mmu.o \
+	panthor_perf.o \
 	panthor_sched.o
 
 obj-$(CONFIG_DRM_PANTHOR) += panthor.o
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index a9da1d1eeb70..76b4cf3dc391 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -19,6 +19,7 @@
 #include "panthor_fw.h"
 #include "panthor_gpu.h"
 #include "panthor_mmu.h"
+#include "panthor_perf.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -259,6 +260,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		goto err_unplug_fw;
 
+	ret = panthor_perf_init(ptdev);
+	if (ret)
+		goto err_unplug_fw;
+
 	/* ~3 frames */
 	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
 	pm_runtime_use_autosuspend(ptdev->base.dev);
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index da6574021664..657ccc39568c 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -120,6 +120,9 @@ struct panthor_device {
 	/** @csif_info: Command stream interface information. */
 	struct drm_panthor_csif_info csif_info;
 
+	/** @perf_info: Performance counter interface information. */
+	struct drm_panthor_perf_info perf_info;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 06fe46e32073..9d2b716cca45 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -175,7 +175,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs))
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -835,6 +836,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 			args->size = sizeof(priorities_info);
 			return 0;
 
+		case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
+			args->size = sizeof(ptdev->perf_info);
+			return 0;
+
 		default:
 			return -EINVAL;
 		}
@@ -859,6 +864,9 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 		panthor_query_group_priorities_info(file, &priorities_info);
 		return PANTHOR_UOBJ_SET(args->pointer, args->size, priorities_info);
 
+	case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
+		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->perf_info);
+
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index 6598d96c6d2a..8bcb933fa790 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -197,8 +197,11 @@ struct panthor_fw_global_control_iface {
 	u32 output_va;
 	u32 group_num;
 	u32 group_stride;
+#define GLB_PERFCNT_FW_SIZE(x) ((((x) >> 16) << 8))
 	u32 perfcnt_size;
 	u32 instr_features;
+#define PERFCNT_FEATURES_MD_SIZE(x) (((x) & GENMASK(3, 0)) << 8)
+	u32 perfcnt_features;
 };
 
 struct panthor_fw_global_input_iface {
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
new file mode 100644
index 000000000000..b0a6f3fca8a9
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2023 Collabora Ltd */
+/* Copyright 2025 Arm ltd. */
+
+#include <linux/bitops.h>
+#include <drm/panthor_drm.h>
+
+#include "panthor_device.h"
+#include "panthor_fw.h"
+#include "panthor_perf.h"
+
+/**
+ * PANTHOR_PERF_COUNTERS_PER_BLOCK - On CSF architectures pre-11.x, the number of counters
+ * per block was hardcoded to be 64. Arch 11.0 onwards supports the PRFCNT_FEATURES GPU register,
+ * which indicates the same information.
+ */
+#define PANTHOR_PERF_COUNTERS_PER_BLOCK (64)
+
+static void panthor_perf_info_init(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
+
+	if (PERFCNT_FEATURES_MD_SIZE(glb_iface->control->perfcnt_features))
+		perf_info->flags |= DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT;
+
+	perf_info->counters_per_block = PANTHOR_PERF_COUNTERS_PER_BLOCK;
+
+	perf_info->sample_header_size = sizeof(struct drm_panthor_perf_sample_header);
+	perf_info->block_header_size = sizeof(struct drm_panthor_perf_block_header);
+
+	if (GLB_PERFCNT_FW_SIZE(glb_iface->control->perfcnt_size))
+		perf_info->fw_blocks = 1;
+
+	perf_info->cshw_blocks = 1;
+	perf_info->tiler_blocks = 1;
+	perf_info->memsys_blocks = DRM_PANTHOR_L2_SLICES(ptdev->gpu_info.mem_features);
+	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
+}
+
+/**
+ * panthor_perf_init - Initialize the performance counter subsystem.
+ * @ptdev: Panthor device
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_init(struct panthor_device *ptdev)
+{
+	if (!ptdev)
+		return -EINVAL;
+
+	panthor_perf_info_init(ptdev);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
new file mode 100644
index 000000000000..3c32c24c164c
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 Collabora Ltd */
+/* Copyright 2025 Arm ltd. */
+
+#ifndef __PANTHOR_PERF_H__
+#define __PANTHOR_PERF_H__
+
+#include <linux/types.h>
+
+struct panthor_device;
+
+int panthor_perf_init(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_PERF_H__ */
+
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index c63cbdddde76..4d352008dffa 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -270,6 +270,7 @@ struct drm_panthor_gpu_info {
 
 	/** @mem_features: Memory features. */
 	__u32 mem_features;
+#define DRM_PANTHOR_L2_SLICES(x)		((((x) >> 8) & 0xf) + 1)
 
 	/** @mmu_features: MMU features. */
 	__u32 mmu_features;
-- 
2.33.0.dirty

