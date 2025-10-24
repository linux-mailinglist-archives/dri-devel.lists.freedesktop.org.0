Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3B0C0808C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 22:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6040410EB39;
	Fri, 24 Oct 2025 20:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Re9SC8Z/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Re9SC8Z/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53ED10EB36
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 20:22:13 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=deM+9k7/C2bWhwPq3mCleNJtJ4DShZmZJYVdkKuZiGyox40G3S+WDUUDnOXYxQmjJK8NqRuLKs/Itvf1PKyQJf+Ts+YikaY41uV0rPwYoKlc5a6uvSaDeyCpo/zfJXZnixhri0/DaUeRFy0ci3eToJYKrg3gUhx66KAbdt7SwHA4afYiL8aPNC4Xbrz5td6EBK67iXgFVVqzRhS3LkLK3GZjSn2b1056SszXs+xmSoug++DyrSTSFNWy0we5ZwWe88QdzfRcG8SLcD2R/0r8bD0JQ17HC3OeDoP2sXhYek1QEYQ0ekJdodvyqvz+CVdAwPey4re+iYvYLvAo+qvveA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCDRmdbdCbdECXFPwUHuHAZk/hnTwJlbnZbnB2pkvtY=;
 b=LMNKZ1ws1eOWldA9/iXOpb7k5OoVtMBObQ2wU/Pp0zqc4FgIRTd1yEhPg61J8aucPyhwCBgKz3gs+2sAdM8sauu1E2xpmf6yMAbSw9EdZivSx2/jUpWGaF2pVuPCgCyrWyHWqjFzYo+F6rSo0Q43Bu2QYd1/ixqu8jHksw+lnz1BxokWz+YFAjYEIJI27v2vsrzdeFjcnX4JODyscf6Bbq4r0+NXLPwgVGXqlqCSCdAfcXnDTDQYcq8gO6i3008/97Suh+Z38LMBE/FniG7RwKd+t50I4tcc0vJbIhZwAEvBsTKetKZzyKYo71/lavtZjOwKA/yHvcFFyMGvgzKRjg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCDRmdbdCbdECXFPwUHuHAZk/hnTwJlbnZbnB2pkvtY=;
 b=Re9SC8Z/thdF77xWTGIiw1BDtJRuMdA1Um9vyVTaaRfNsTX24grf4RM9mJNwFQTdvjbe0JQ5nby72P8IaCWmD71kKOsItTdrQe4VrRJHhdGyLJjcWtkZuv2a+WGeJvcD34kNe7zcG5di980eLHFXLUGz+5JlEVrwwPHkbn4M2/A=
Received: from AM5PR0601CA0074.eurprd06.prod.outlook.com (2603:10a6:206::39)
 by AM0PR08MB5411.eurprd08.prod.outlook.com (2603:10a6:208:181::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:22:09 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:206:0:cafe::a2) by AM5PR0601CA0074.outlook.office365.com
 (2603:10a6:206::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.15 via Frontend Transport; Fri,
 24 Oct 2025 20:22:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Fri, 24 Oct 2025 20:22:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSSx9W6RhqY/6xjFGT+fD7GBIy8i15xvLk3xgyNU/vdfNvwU3m9SzCF9w5NangPZGw/H8rB+A7XQA/xMHKE++bOc3EuZ8Wojk523p10Dl9tnWRgGMtC3iylEgiZx/e5YzpvKDrG5/Qod7z+mIzKYTFI0iJCKtj7wAXAVHXnU2Ly5LsCFSL/V42ZkRnicB0iMxLlEQztsBSjHAZCz3acdXtTOGPWTMajCPMjkgQxaW3ak7fG7Tp5MPVhXDTN/2/h2l51EoAl0pTc01DlyARE2LnyvCteh9ByBm1BWr589/Y0sxFLkXUNHH8V0X/h5g+LwSWqn4+vQhfVVpzRkyvalxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCDRmdbdCbdECXFPwUHuHAZk/hnTwJlbnZbnB2pkvtY=;
 b=qVEueNB3rOpHveMWXZ6HeoYWIOJj5OcVreCsF500n0TaFO0H/RALgFAKBtwFKENdDmFQauJFOupuL8ykEmxyAJyXICVRzQzgXY5DsaW0TFL9U/lcei7uH5QIqG/5+5cSRVA+fIh1861Ve3pTHSF3ZTWcNZwD/gfaBWE4yRvchKqZ1WtREhRXsqhX23jwEbLTQxrZGoY6mdUpe6xbR0RwaFRuRI1Q8DsF2tjmZRbQGT/UCbF+0X1Nt+ysjFytr34t3VgDohQaa+gPSdViwKPHRdJDKEgqGgVcOpkOBSQVC0Lv8rxr/+OG5FUOp64xgDxMAjeN71DQBL0mi2A+DeI0fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCDRmdbdCbdECXFPwUHuHAZk/hnTwJlbnZbnB2pkvtY=;
 b=Re9SC8Z/thdF77xWTGIiw1BDtJRuMdA1Um9vyVTaaRfNsTX24grf4RM9mJNwFQTdvjbe0JQ5nby72P8IaCWmD71kKOsItTdrQe4VrRJHhdGyLJjcWtkZuv2a+WGeJvcD34kNe7zcG5di980eLHFXLUGz+5JlEVrwwPHkbn4M2/A=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU0PR08MB8929.eurprd08.prod.outlook.com
 (2603:10a6:10:464::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:21:36 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 20:21:35 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] drm/panthor: Add support for Mali-G1 GPUs
Date: Fri, 24 Oct 2025 21:21:17 +0100
Message-ID: <20251024202117.3241292-9-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251024202117.3241292-1-karunika.choo@arm.com>
References: <20251024202117.3241292-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0516.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::9) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU0PR08MB8929:EE_|AMS0EPF0000019D:EE_|AM0PR08MB5411:EE_
X-MS-Office365-Filtering-Correlation-Id: b0fc139d-1b90-42c5-9257-08de133b01a7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?KAOA6C/2jx0e0XpjgNcpVYlbLxpW7PBdK2hJqSbedMp0KsHKwsEyEnmvoBIM?=
 =?us-ascii?Q?ViTlXu07S0ASSmbxtpQxoquFsBziHnSPjlp6QfylYBWlbMda1oHWTVhT2xdA?=
 =?us-ascii?Q?aF1I8rrGj6iJO/T1A6hpx0PbGR4Krf1AbFi/iE1/QT+3Xyo9zhQBgaYgE0/r?=
 =?us-ascii?Q?g0J26D+j7fhvtcbUbaYuQY6PELAyd5SYmqGTAigXSL3vKIFFux1KoE9UmuoE?=
 =?us-ascii?Q?zAR/ac8bVKutwv680nj+2FJCdi21+HMBcOVGfC6LCqLzNaU+IKVQIeEUR7ah?=
 =?us-ascii?Q?O+UT6zh+rOs0tWBtf5YPo1vVjumJfQpT+U+63sDRvCyyqMOEJ/GEsdajvxw9?=
 =?us-ascii?Q?id7qqXg44gfFkRAz5S3SLUc2gkeE+0VfDqqDX2vn6LoR4o6aACcGPLhQs9If?=
 =?us-ascii?Q?MnCkQdEIY9FOIHxLqRYu0W9+2KKZWKfJWxseDg0QQ7hAv3PuwXUA9GMy3xiK?=
 =?us-ascii?Q?hGUTgSty3lWT2LjZ2HtR7q/aOVbx/TytJNrtSx9TRABrYpp0HiZE/tkQjODH?=
 =?us-ascii?Q?B6hpBquY7TdOhNfhmmU77Ff48/8+BlWEQ30/R5k9QlLYconLvCtP2/Afb2B+?=
 =?us-ascii?Q?oG/89myMvOH+31VsQ4h4/RC1/AH7CuPnVLhBTRvuOkAGRrh3IF89kkTs8Na3?=
 =?us-ascii?Q?/mS2EtLPsvDSZc7YmLn+nounKEiBeaO+02MAgZzFBMcwbWN4VSr590MLaSYN?=
 =?us-ascii?Q?DX+7t/F1w06qSS89Qdi+Y1lVGPmDbczx1+alPRCXRMMugbBFdkwH2Q9DTbZB?=
 =?us-ascii?Q?4QBcmiDhY2EY2rrgfU7zi82qD9xJui5i143X9F7GdWKTQu9+vqoCzRSODmx1?=
 =?us-ascii?Q?KW3zktVp+pxW6I2to2uU8LOgVesZywwBir41zQi5cAZC7hKUveiJ9lCKM+HZ?=
 =?us-ascii?Q?L2aDMh61lVWnN7CwIa25dQ+B7PsCrzRts6Cfm2bZqLML7/zjulkpGQtqcgfZ?=
 =?us-ascii?Q?rYX/Rr6q2OVVp5D9Z5M7UmH5+fmZX/U3HQoR2Lm8x/Rbt0wcSNN/5K0KyCKD?=
 =?us-ascii?Q?wrBFebUjl8htBI2+O6Y9kYoEBDwGof4hwpJFWZ9oXNx9+FOhitfcULWPRgrP?=
 =?us-ascii?Q?HYIOK16MV5jqav8B44ks15aj1MLZavid8KCm+NljkBktJURAxdE8uREATQJS?=
 =?us-ascii?Q?BawhAXOi3mm7GERSsSeNHkpBG/om1dM4PY4LEN5njeQbFq7QNleLuoOw2nrg?=
 =?us-ascii?Q?O+HMXyn2CjUZddOUs9YDqLjc2lsRzVI7mXGZ54pfiqyiOhUkcQ+XfSgRTi28?=
 =?us-ascii?Q?/UA5/1vBkmpUVAN1/n/WZUB4PZ4FY9iU+dzAS94ZPNNt4lnVPa1IwUSkaCts?=
 =?us-ascii?Q?EaWKInOX6Nvu4XFcoN1QJ4cXtprSbKPo6m/8zSnf0UKDI5ReZce8x7RNK1Bj?=
 =?us-ascii?Q?eEPZ5AsE6D26vBtyQjojeV6INuxHbiLjxAJX4vGz/RuDHdHsGwqQzFTrYQkX?=
 =?us-ascii?Q?iPXViVendjzXFYt+qZKHxflyfZ8ZRZuY?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8929
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 68866de7-213b-4442-9809-08de133aee13
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|82310400026|14060799003|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DdlDKI7S2rvVp/Y76DluFLQ/Aab2JLvCXJlrRD45alk0cUg/uUM3EXilR09X?=
 =?us-ascii?Q?5366iUdghtKY9xc9bl9ag6a7c1QU3yjW6dF7/5pkXR+++Z04eNceudvskZ4c?=
 =?us-ascii?Q?I0puHlXDG5OS1DI3gBW7pm1pQjcBv39bA9iKiUynboo2iLyQaOQcB3mkaBa9?=
 =?us-ascii?Q?fK+X2PSnkIo78CiYJrFrwsJKJUGWHi8cIxIEqR9TR2+ccY6EOrJegAVT667g?=
 =?us-ascii?Q?azOGlwAQ6VohnozVxfZsLdAcV6UGDrWpsYJ1SL4eh1C/Q+Ew4zLnlM+tVJbK?=
 =?us-ascii?Q?PQmZho5xFo3J35d3VxYnz5vBb0rMYvlvy61+RKNQuM5CN0cK9525m1l/LNLe?=
 =?us-ascii?Q?cBafKflFqdCBkHneWuWuLUr5e2Rx2oO2pxQ9C1XuV9D8gTGdg5GUwrT9w1XJ?=
 =?us-ascii?Q?Im0v+Hxrj458lzH+mTi99+QRYcvfKH+/B3qX90RMwT7Mn2K8T1TgVv6M6EY9?=
 =?us-ascii?Q?SsKQ+4chXa0USa61jg5d/Pb1KLyuaU/Z8fGIrrNa5FAKOig1/SkK3Bc9Mxd7?=
 =?us-ascii?Q?aoU6zIODHPKADcHAeqCCLXGQEqgh0C8gZEYk8j2NXL1nO9SHKCbJ2+v0HFgb?=
 =?us-ascii?Q?tglAX+tPcpQPur2eykgDiiM73fy30AxfWimBPY4ADYoPtYTQiqzzhww0kzBH?=
 =?us-ascii?Q?CLkQCtxQO8FLdAutqUNa+GFoOwufcbZa4PBVOveXvaVIk4rB0aPxgV+SxSKy?=
 =?us-ascii?Q?8Pp0eLZCc7UIme4j+ObqgN8jchxPkh9GaWhzDEiEgneqdv9O8zPG5zf1K829?=
 =?us-ascii?Q?S1qWnUYDXTKaRRpiMWaXATLCSiZrHHba++EsbGgMK1CRM6Im0+UFAdOB1vqZ?=
 =?us-ascii?Q?VwaltrTO5iU6JEiKrupZP8XRsTTGEBKwCgL5P3On+hnu+oEb1T/93jpZ+9vl?=
 =?us-ascii?Q?2fqM/H5JMimGcZEr7mKlhoBmFVLezdqVjFXcPJTGndWIIjKIgrxuYGt7DcNK?=
 =?us-ascii?Q?tEdY0KWaViKldInrj6yliU5s8FtUYNqLKuZuPsOqzhnRAqf50u3mtIeloiMd?=
 =?us-ascii?Q?oc4qU6/1ADn9RRV532pNYCUv/DS/niRYVFAYaPqVP3Aa7G48HkqnYOtL52HJ?=
 =?us-ascii?Q?+WmRVczCfbvZQFYG+kWYYBu6nrzpzDAxu7UH8yVT2uWXJGD8srF5S1cnu8K5?=
 =?us-ascii?Q?6vITJuafSJZ/NsIfrZFr/Yfo5RWVnwv5rZr51vNIYUdMpIPgnJktyksX6p30?=
 =?us-ascii?Q?82ZY0Xtu4YNIFjO0cB9LMAC/FcyVZypNHC6INMizjcOs074ne6deJCl+1RZC?=
 =?us-ascii?Q?MJsqKUEar41QL/MRFfXSYHgfaOkt+qqoxPwOOy2st+JiXsm5AG/MrikulUTT?=
 =?us-ascii?Q?wB9j8rmqBc4yF33iKSIcVRBpmzIA8C3s0pUwJPAo74XV1Jj4mRFnsp0QFDIO?=
 =?us-ascii?Q?8EcvthDOacjQn564ny/om7wtV/HkIFDiKwV37BC9MyEB3yh3GK++FkdczEa3?=
 =?us-ascii?Q?lYfY/x4Xmgoc1xgQeCD9EEpPBpjmoUfkVbtat8Yy86wbjrKIDfKbPLQZy4NX?=
 =?us-ascii?Q?MsC737XpeiV/11UiZo0Xn5y6yBAJp2NJwBAJxdzeVWUfEG6ONt0W1/wm9Bge?=
 =?us-ascii?Q?H84IUbwBoNi41A6lmzw=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 20:22:08.4072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fc139d-1b90-42c5-9257-08de133b01a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5411
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

Add support for Mali-G1 GPUs (CSF architecture v14), introducing a new
panthor_hw_arch_v14 entry with reset and L2 power management operations
via the PWR_CONTROL block.

Mali-G1 introduces a dedicated PWR_CONTROL block for managing resets and
power domains. panthor_gpu_info_init() is updated to use this block for
L2, tiler, and shader domain present register reads.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v2:
 * Removed feature bits usage.
 * Check panthor_hw_has_pwr_ctrl() to read the correct *_PRESENT
   registers instead of reading reserved registers on newer GPUs.
---
 drivers/gpu/drm/panthor/panthor_fw.c |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c | 35 ++++++++++++++++++++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 9ba10ab1d7c0..031d23166c18 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1500,3 +1500,4 @@ MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch14.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 09aef34a6ce7..29c7a6e60300 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -3,6 +3,7 @@

 #include "panthor_device.h"
 #include "panthor_gpu.h"
+#include "panthor_pwr.h"
 #include "panthor_regs.h"

 #define GPU_PROD_ID_MAKE(arch_major, prod_major) \
@@ -28,12 +29,25 @@ static struct panthor_hw panthor_hw_arch_v10 = {
 	},
 };

+static struct panthor_hw panthor_hw_arch_v14 = {
+	.ops = {
+		.soft_reset = panthor_pwr_reset_soft,
+		.l2_power_off = panthor_pwr_l2_power_off,
+		.l2_power_on = panthor_pwr_l2_power_on,
+	},
+};
+
 static struct panthor_hw_entry panthor_hw_match[] = {
 	{
 		.arch_min = 10,
 		.arch_max = 13,
 		.hwdev = &panthor_hw_arch_v10,
 	},
+	{
+		.arch_min = 14,
+		.arch_max = 14,
+		.hwdev = &panthor_hw_arch_v14,
+	},
 };

 static char *get_gpu_model_name(struct panthor_device *ptdev)
@@ -81,6 +95,12 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 		fallthrough;
 	case GPU_PROD_ID_MAKE(13, 1):
 		return "Mali-G625";
+	case GPU_PROD_ID_MAKE(14, 0):
+		return "Mali-G1-Ultra";
+	case GPU_PROD_ID_MAKE(14, 1):
+		return "Mali-G1-Premium";
+	case GPU_PROD_ID_MAKE(14, 3):
+		return "Mali-G1-Pro";
 	}

 	return "(Unknown Mali GPU)";
@@ -107,12 +127,19 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)

 	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);

-	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
-	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
-	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
-
 	/* Introduced in arch 11.x */
 	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES);
+
+	if (panthor_hw_has_pwr_ctrl(ptdev)) {
+		/* Introduced in arch 14.x */
+		ptdev->gpu_info.l2_present = gpu_read64(ptdev, PWR_L2_PRESENT);
+		ptdev->gpu_info.tiler_present = gpu_read64(ptdev, PWR_TILER_PRESENT);
+		ptdev->gpu_info.shader_present = gpu_read64(ptdev, PWR_SHADER_PRESENT);
+	} else {
+		ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
+		ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
+		ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+	}
 }

 static void panthor_hw_info_init(struct panthor_device *ptdev)
--
2.49.0

