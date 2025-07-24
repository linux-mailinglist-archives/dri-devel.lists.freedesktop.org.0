Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 934EDB10A7E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 14:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E382610E210;
	Thu, 24 Jul 2025 12:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="evokwnzu";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="evokwnzu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7BB10E205
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 12:43:24 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yS8+BaPuE2lTGBa4GXtqCkGKVZxe/5EOe3TM2xhP/r5N4R0wm4/cNHR7W1JZhHGAKm5c9RcEjKc09GC2g4UtQQQz437u4Au89wKIVRFP6W7aD/yoRDtQ6gtR8S+t8IZiUQEOdqNYeB7v/0tEaBqonWzRgCpv0MpBBBSSmkmajDQZXSIX4TMSpaKfq+JTIyrTlG1IwE7UQPIaPF8HKjQnbRbrUYxbbsFO/EZmBv5hl/TG71pUvrTrMhBeGCyAhUFJ1UZkDURvVKkDXN2cbM1NuIqAGRfLKKvzbee7W4a5PVc3lJQ03BHeBZxtqceqYdQXrySsW0+tuSEBc0piph4qPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJQcNPdKMvMtqaaWfPFvJq4Z1kD/AiYbpLKkLfQNcfE=;
 b=hBVr9nKvzbUM5s8emQHy/1DhVjmd8FOczock5r+WnK8Jpdv2vmOB3fTtlUVuHl2cw0t/+R4NmMrYZaOY0EpsoZeMAEi3Hspxwh+dsWBeIM0vSbQFuI6fAJdlM6ZP8k/83cBDJUDUqDT4Pm8GosvR0GrAxwGgeM2Idtmubaz3b9k2UIwSQDkEHLSKLevC8cD+EpbaxfhmZ4HagKEiXKjBU4vSaGxbBWCDfN+oAYMU2IIZrFmHx9y5U02srKYyRgVhGCuo30tW9yVtuPEfo4zxhEX81Y6DoSfPTsI8eCXvS+bD0kzOy7hIglvWvTFtuqIjHKkOBN4S/eCXa/vmZM/HOQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJQcNPdKMvMtqaaWfPFvJq4Z1kD/AiYbpLKkLfQNcfE=;
 b=evokwnzuFMDMwQcJYQ5877bq71bGSU9oLZ0/xSDheGWbHO9Cfq0AfYB8MVbC5ipGNj4Rdv+7GEaFTXeS8eJeuPMnRrmliUgnIkD6Qf5vsBzKT8jpINbljxGEjhCSJPIe9QwGA77Nz+HjiBKwK6T2cqLerzs6sHtuY4o/dUevxqQ=
Received: from DU2PR04CA0194.eurprd04.prod.outlook.com (2603:10a6:10:28d::19)
 by VI1PR08MB10244.eurprd08.prod.outlook.com (2603:10a6:800:1bd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 12:43:20 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::51) by DU2PR04CA0194.outlook.office365.com
 (2603:10a6:10:28d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 12:43:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21 via
 Frontend Transport; Thu, 24 Jul 2025 12:43:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMA6/MZNlwgdgn4yOLt4KOqoXMENuzaQaZGBsu+9vYRc7jeuBmDQEtAIf2aw2azD3w+AaD0jOvuD+eFOb6Tt5K0WHfFabVh3yD/WIBspXgYuX997P9h+x4Uyx1MYxvf1FdKseixhwz2HheWTlyE6mNLCzby/72T5TTV8VFy0mbC6ibmomWtMYvPdPLylJ6XofGHxTsGR6desGjfzIp60xpRoPGU2yN9me82H5wMpeCoL0+Goxhekp2unpViMLKR5Pd+nl4J9Tfimq0DiAJcndctnU+2f3qE3akHSh7+XMS0sCNKDvAmIO0ceP/0TUBovpkUAazaB3TJbwtvL8DE+1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJQcNPdKMvMtqaaWfPFvJq4Z1kD/AiYbpLKkLfQNcfE=;
 b=kDweAR0f+7t0zDQlyJ9ENmRyHxiS+Noj+q5F7++qg9+BBBCaAbX+n7sfqKp4tGSXjPANnOkrzOuCsxf2GldcC4xJ/set16Av43Yq/nqbd2gNiSGifu+VBuJaYWSCcpTc4o++D91tzuo+FvxCWx7e66fk5wqEMsSHN9wIn6dVs08+tm71bbPJS+Kxs3b6IanS9yVAjSKM9Px+JpZMEqZtakPaTrqbks7BwrFvFz+c3Xeg4OpfBSlhc+ZSx8FCNL1HhShhxomLMvowD3BBcPJZ122NTs7dFMAehsq8UqZZJZ3QYokhe3wBqe9nQcIs7oDo5M/qpN1WkRvwdChXo/A1Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJQcNPdKMvMtqaaWfPFvJq4Z1kD/AiYbpLKkLfQNcfE=;
 b=evokwnzuFMDMwQcJYQ5877bq71bGSU9oLZ0/xSDheGWbHO9Cfq0AfYB8MVbC5ipGNj4Rdv+7GEaFTXeS8eJeuPMnRrmliUgnIkD6Qf5vsBzKT8jpINbljxGEjhCSJPIe9QwGA77Nz+HjiBKwK6T2cqLerzs6sHtuY4o/dUevxqQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GVXPR08MB11183.eurprd08.prod.outlook.com
 (2603:10a6:150:1fc::16) by DU0PR08MB8496.eurprd08.prod.outlook.com
 (2603:10a6:10:403::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 12:42:45 +0000
Received: from GVXPR08MB11183.eurprd08.prod.outlook.com
 ([fe80::3bae:b721:e01e:9c90]) by GVXPR08MB11183.eurprd08.prod.outlook.com
 ([fe80::3bae:b721:e01e:9c90%5]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 12:42:45 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v8 6/6] drm/panthor: Add support for Mali-Gx20 and Mali-Gx25
 GPUs
Date: Thu, 24 Jul 2025 13:42:10 +0100
Message-ID: <20250724124210.3675094-7-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724124210.3675094-1-karunika.choo@arm.com>
References: <20250724124210.3675094-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0482.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::7) To GVXPR08MB11183.eurprd08.prod.outlook.com
 (2603:10a6:150:1fc::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GVXPR08MB11183:EE_|DU0PR08MB8496:EE_|DU2PEPF0001E9C0:EE_|VI1PR08MB10244:EE_
X-MS-Office365-Filtering-Correlation-Id: e7430866-ba7e-47a1-9804-08ddcaafab3c
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?RJxRjhaIPFnDTJaaLQZgZE6DOIRz1Bkz8Pazix+THlAPtDpLJD+X3Y514Rat?=
 =?us-ascii?Q?YIyJoy9sCe5tJL3+F5y6M/AMU3+tSTlsfWHr6qVxWHlUtlq8TV+CtmxWbH3N?=
 =?us-ascii?Q?UAsCHz3e9ZaSI02s4+AhQHw1QjOtCIS/htIsfRODUt1/gWdbkbljlSAPwYab?=
 =?us-ascii?Q?GPQ6UovSBT1r3c5daRao6tAM+edba476u1QEouvgpkjd7UNA76ivNPZTuOdO?=
 =?us-ascii?Q?VoVevNIIXGqJC6wJ3P76Qds+me0j6dea9g4n78FqG+2Aj6wcpY9nKl6HyOwb?=
 =?us-ascii?Q?kR/SVOFgEjCnnZHkoLQmuaO8I+sAxL5cPdKgJRd6FGVjyPuCUnjmTHev0YMt?=
 =?us-ascii?Q?580lxJUb9EupaG4wQjzAaKkwfV3WDCdqnQ+xllztZW9ZNS1RzxRJWHITwDuk?=
 =?us-ascii?Q?PXAuXey74YFDr1cAmL94dhqiiK7mgM5mCW8YAsVeNpUwhF9DjXOgLW6ajIE/?=
 =?us-ascii?Q?Gk/xTEFv0oXj828zEFJYEr2Pw/5cYcLiT2s7DyyUlqY8SoNnrAL7qp9fw6iG?=
 =?us-ascii?Q?D9EtEhvedc7Gb6AOhjaLAiqnlSHUMECFWLgkKbpyjDvj4lA1KgHlUZvK+jX2?=
 =?us-ascii?Q?1gpfE/lLvGOoC1Y/yH/HUrBFuZeCCr7BwXVUtBM5JPDQw3oeZsfROKRGv2eC?=
 =?us-ascii?Q?INfe6pMJSuSVzDE034f8Welv7yS7ZCrliOuyZNO3CHzY+/9C6X5deFt8rXN/?=
 =?us-ascii?Q?CtFsf4mHqzluRClgSoq8TQlATpkC72rNZO3INAxc+SJerLeL97uQyW1wCWmu?=
 =?us-ascii?Q?gkdRONm4swxrwu+e5U0nBTT+rxao7jw9AEc3hupJtlL8ISxh4jXZ3eXgsa+Q?=
 =?us-ascii?Q?lxQA1W3bhBracy3u5FAXJkAbhGxymQlUWovdEN4twDlKBqJx16F2tYx+Brh6?=
 =?us-ascii?Q?LoPvad21GjcUGllbUaiYHzsIQ3v4B4plGpEAUVaCdgPQ5QwhL1d9RjOk/mDc?=
 =?us-ascii?Q?w4GqGKihW9G2puGrEUAY/J8K8lUAQ3FGF6sms4TuUYBbhcY78cZIskdR2Ylz?=
 =?us-ascii?Q?6ogHuS1k3q2O+EB5Xaq7fFerbvax1LvePd0A93Pk+zo18YRgVojyEEYYZFIt?=
 =?us-ascii?Q?O1LRLXPaxrb+V6QYTtvZk4j8DvL1lP0x5jsSLBW/iVpSGH4Qi3Y/J+vpcOml?=
 =?us-ascii?Q?Eik7p0OgmDtjL0iH3sRwntFpvrlUgmAldg6wyUCxpD7CpQJ2VPoCW3j3N4wN?=
 =?us-ascii?Q?1rBDlMSS0eLl2oiiuSocW24Q/3XVdCE9ng/A47LTwUQkP+M+XQdQq/1MuPfc?=
 =?us-ascii?Q?e73/YAuV5nC4AOPl3anu3Xg7ZJtaa8UUR9fB0m37tKdHhIuT5ezXAV//mBPS?=
 =?us-ascii?Q?JKHE4tAI6oDf8mKaCntfQZOX3G3Lve9edaPTxR8R/0/+c6mFB7ry5VS3fNOi?=
 =?us-ascii?Q?VxBMBTJYALR107cf0waFK0FKJzwFh58XoP0i4ThSuNHQFWLcLlmDbEgX8/mx?=
 =?us-ascii?Q?1VKtoCgMaWc=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:GVXPR08MB11183.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8496
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e9c9485d-3bcb-4191-c9b9-08ddcaaf96c5
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|14060799003|376014|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jUZECLjpnyzeF7U/9lN1nJKzwc1XoD+PeWm5LwtJ8CoOyzrPEn2XmkiN28+o?=
 =?us-ascii?Q?YNSiHm2nS1edAgTtj5ja5mGfLrrSS2F4YqCDDhp49S5vIM1NyvTkBkaOvPV/?=
 =?us-ascii?Q?DCdci5jqXe6cR39Ds2BkDNDFu/Q1v83A5aYofAW7/87RFbgyZl7Q8BtBXgL4?=
 =?us-ascii?Q?I1Eii6YLIZsxfG8tmpWuq58tQW4e6WtwbdeQ1GebFV2Vzplux7viuk+2smVI?=
 =?us-ascii?Q?M7W0KLPv6QyIcwdbcgsBoywnQOpjUGqrAhGijWuhCO4ieA3q38ZyH2WfwRlo?=
 =?us-ascii?Q?/oqCo6hnUAq+PPAD5se1HXdACI/YXOWf5M4b9e0wYkNmDHpkiKRdMzLUURxq?=
 =?us-ascii?Q?V055DTczVPtmoetOMvB8C3RwQz1aLVnAYbZdPZG3WI+DcYgJR2aSKxnbfpc2?=
 =?us-ascii?Q?U7R5El7KjyEVOwCmtrGECRFRqof7jVcXJVqhj/8Q5ae9YjZy/mySbAC8wJsW?=
 =?us-ascii?Q?oJOH+Rr0XObvh+LT09Y1riZohvAmOX6lYceAj/w5rHGPIAx7xC9OUpP03khX?=
 =?us-ascii?Q?nHb6m35lEDEJreJaHlNmZ5+L9CswCUIQtVpeXJuBr5ghXwb+OpqK7fIYEwWa?=
 =?us-ascii?Q?SHSt5q7Zv48wJFIR97mPGqtsmRrw+KPnFoW0qP+siyHaEP4Cp2Q/9OCaybfR?=
 =?us-ascii?Q?ufRPu1BeqiBC/YhjlzW7aPzwPkyoH3sTJ+SqCc1+9xWQ9LB1TWRud9QSxXNF?=
 =?us-ascii?Q?z94hXNB1GwtjS35Mlk5pP+Mmw/AKTzgZQy9mo8rcq7OjeGXfsY5ByeVMDvMY?=
 =?us-ascii?Q?707y3+4hegdYStpzPWo29WiIaA3IdzKDMSLoCQiNamfa1gAmqwg+z+jvp+h0?=
 =?us-ascii?Q?55EDKxODZhfeqgFE1EjPRpQdG5UH74ocu6sXfIxoqqBzvNUee/EKoir7TzSz?=
 =?us-ascii?Q?Qo0ELlpuuIi0MIJRj44H1fZf3NrPxAkvUx9Cze1sGGocy0R7ZUdAtj8WnbZ2?=
 =?us-ascii?Q?AbRol4vMsHNi/3dIXGMSjQ/xSdIc9inAsUlkRvNAIVPsWrVhYQhOo+nV9O6f?=
 =?us-ascii?Q?zscJBFy3elwPl76nhCFEzNng0RrlK4STYtJfGJ1k6CJWhHXboOXNEz/g1jAv?=
 =?us-ascii?Q?cHE1sqPbcz/76CzZDar9OqQ5cOVWtynEnfyYk4H6LxpjsR32M5QnXN0CsKhL?=
 =?us-ascii?Q?ub+paz1kxMRRCRSmTxsgQbqCMoV/wFyshMgv55MzoKt1fB62C2jWTCAk3kb1?=
 =?us-ascii?Q?uQRmg7wz1QxvxLNuOog1OxjqyIFmlN+odaH8dQRqr9C27ZWBcNgjzt8ICOx9?=
 =?us-ascii?Q?Viy3B6SPDMgHyv11rlUnA87OeDtAu0XkP48UnfNsV0VY7TUOYVP+H/+wC/fB?=
 =?us-ascii?Q?JfWQv0DZv7hRK8eL7jOGkDMw+mcERG+hFpZn0vebUcg2GVKQ4dN7I2JNL5l9?=
 =?us-ascii?Q?krsYAkUoO74hHgxun8Fmnu50gxvDyh6mWqztRuqg7oKpbFVARZSe9gu0rj9W?=
 =?us-ascii?Q?RO4xlPljOEqgH1vCM16y6HYFX8HCEyfIDUcUDPhYWwfLVZGQjfhqkh1TeGlO?=
 =?us-ascii?Q?mkeug66t6kiClRPgg+ZVro1EQfRhmi1Urfru?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(14060799003)(376014)(36860700013)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 12:43:19.6361 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7430866-ba7e-47a1-9804-08ddcaafab3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10244
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

