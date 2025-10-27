Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89119C0F324
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8807D10E4E7;
	Mon, 27 Oct 2025 16:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="RG5EeWFB";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RG5EeWFB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7134510E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:14:20 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sghCdPHVJW5XJHagtOWtW5cKwQ0p6qdDwIwRSwxPR3/dJ3kttlrfMC0ilCBEG1QsOXirooE5fVXXxfSUiAkJQFm27tR9t90R5ODeL2hXZWWvmiBO8HglUGtu5xHBT2sBHC+uaLODBdl5AAAERWLtJBqO/sgwH/S2pifKvCUFC6hFQ5SlnjEnux7DjZvkb3HHV9KlUkPKrZTZvpRAsoiypWNqQw0/eTxQQU8Pn7ZSNax2FPVzxbjn1fUwh084c/8ahYLn0pPibmRhPjsZTsXx9hlyQfr3FvAXt9mL7vGEHiMTCXEYeZujJb+hIJRnrYuIuv1HuLpnJTm9z3KLGjJdvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zn2YdCLgGNEnnzpHiNJ/Epr5k2AZPwdy7K9SGWKkaPc=;
 b=iJfgM4x3t6mDbA2uuikJkZrG95UHDq5K/u3ySyLjiyGP0pCPYO7EhYxkR0unlSARguvk4zbPOPdFuQOQ3Fwv1ofe/hycJlZnZGvEYnvlFrgN+FHFCv0UVmWN8dtRq1tQ6tCoD1pV5V6kLhxem8ENxTGnYViZq7iI6H7rgTb9AcEogI+Sdw2aDbLXMWpvad1inQtZ4yF9fZJfNNqDvSlSoNPBvILIO1hIAviGB8KikJlwCnoWg2N8ITA4AZK2Ghp+/foWezkJigfhcdJ/tWOLkSEK1Hy2WyeiydsqNR8IkH4/ZCEahbuPJ8FtLSuf6hgUuJXdlCYh2KId2WS1huDTvQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zn2YdCLgGNEnnzpHiNJ/Epr5k2AZPwdy7K9SGWKkaPc=;
 b=RG5EeWFBAmeoO0wp9mMM19CBoBPTCD3ZC+W1wlnZYHyclWsEw4wC3ZdZ/3QH6ga4rPUQdPvESs9spz+C0uwAa93hiOnk2ESRQKGkAi1E2DOqCJM0+clUMd9SLcS9wUhZjiVALqlnqYUJ+Le5upDo8Br9Kgq6e1T+703WT4ttTMQ=
Received: from AS4P189CA0059.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::29)
 by AMDPR08MB11388.eurprd08.prod.outlook.com (2603:10a6:20b:717::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 16:14:17 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:20b:659:cafe::7e) by AS4P189CA0059.outlook.office365.com
 (2603:10a6:20b:659::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Mon,
 27 Oct 2025 16:14:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.0
 via Frontend Transport; Mon, 27 Oct 2025 16:14:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwEz/px1lGSUTF8Z8xW+dVTJ60MPnaqLciqsqlvc6/GgKCqTbeF8XJE6OHCQA18CiWI5JIRxJij2jFIsDw02Y1SR/vBlGKyCLCV9IOqS4D0xvAEYthxJjhl58HS6U7TEJIGKKYKGT4q8APHNijDob90xt/YhUCFvlioyUaRz6HPUhkQc0lUH5KoPCkYYejwDTambdrBy6KSrV0TzU2PsidAmlyszV8K2ufMC1uJGPkPLtgul7cHW4S+uaAcXO61qH6/NMo7fZoX1iTd9T45IifRRFJjZIrCeuCD8kNJ+SHWGwaum9XnOCld16BfvIjEoBQJ+0X9/ac0jxPFmIOUIhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zn2YdCLgGNEnnzpHiNJ/Epr5k2AZPwdy7K9SGWKkaPc=;
 b=d0bqBhhhuZsrIuiuW0EbWHI/0sQ+nu86NTjsFYDAd2MvSZUov4T9hH/vcaz9nhqI2y0KDS6tmmmfPL4Cz3RyIFLIkZX9YMiJWJ6IT7xLYFyuuHIECDqDsVzzctvp+32SGZI6t4ewseuDmsmZtIOJG7QlYePz/z+PwOMDD20dxXNx0dX9no8lACf9x+oSm2wusGIGCwb3lT94YK8eDw28IyGUzGD5mG16ElsWjS1Uivnx0rP3ARTaPzNnoMO9ILkxHhBftrviPQdGKmfugZcfLnFye+/sOGXeNx5Owb7s5a6QEl1GIpbeO0rCAOIHzGzxtz//+3vlbZmFNjftcm2Q3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zn2YdCLgGNEnnzpHiNJ/Epr5k2AZPwdy7K9SGWKkaPc=;
 b=RG5EeWFBAmeoO0wp9mMM19CBoBPTCD3ZC+W1wlnZYHyclWsEw4wC3ZdZ/3QH6ga4rPUQdPvESs9spz+C0uwAa93hiOnk2ESRQKGkAi1E2DOqCJM0+clUMd9SLcS9wUhZjiVALqlnqYUJ+Le5upDo8Br9Kgq6e1T+703WT4ttTMQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GV1PR08MB8498.eurprd08.prod.outlook.com
 (2603:10a6:150:82::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 16:13:45 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:13:45 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/8] drm/panthor: Implement soft reset via PWR_CONTROL
Date: Mon, 27 Oct 2025 16:13:31 +0000
Message-ID: <20251027161334.854650-6-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251027161334.854650-1-karunika.choo@arm.com>
References: <20251027161334.854650-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::17) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GV1PR08MB8498:EE_|AM4PEPF00025F9B:EE_|AMDPR08MB11388:EE_
X-MS-Office365-Filtering-Correlation-Id: 23cb3482-ed50-4426-7acc-08de1573e135
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?FD8/drGXfEh3TMGxWCb2yXkASi+GZtD0yHFkp12VHkRzPzpCLD+gVPgEYC82?=
 =?us-ascii?Q?GIpH98cLsXUEgjfN39+o2tXL1LVnpBeD1bdhVKW0Ttrv28VHSdf+b+ux44oz?=
 =?us-ascii?Q?bTDfWZMuB6Xh4I9hzI2UBlc6uanIgFROY9cggSWAEMqh4iZBIQenckJp0Rk7?=
 =?us-ascii?Q?HMj7JuRl+9IRNGRKlF6hBehFjkZHVdeqNKWravga3L4T48byQrKWZelSDGLu?=
 =?us-ascii?Q?i+tWFSZiseMRUIf2ul3wyqHgYqDlUsauuiSm3GHfmJrP7e67vu8+ad9eZiwL?=
 =?us-ascii?Q?TgQuEi79CVSIzoLxipPZ8O7tIfmgIrm9xn6sIhpVlMitXX42xrtfer3547Gj?=
 =?us-ascii?Q?F4HmR6UgLLpGO2cSXkenKEEDS7GPtnXTCoYojJDJOcwM08G2C7tOJU4X5lez?=
 =?us-ascii?Q?ZifvQSx+9fjPb00UrnxGgimO0duq8mWE5BHs50OEYm1cO9sixu2tbWK2WA9q?=
 =?us-ascii?Q?Oq3ZEXi/yrgr031c1oDzF58H3Du1PrbEhynHifvx70WzjeWNg/4jkMde7RP6?=
 =?us-ascii?Q?jj0mZnfUxkZNf6uqFd8BsnGV1evkZ7yUwuiiCBR5P8BzSvoeKUC0zTA0N5fu?=
 =?us-ascii?Q?Pk8MlLZZr8oLs4KMWQNpt1/8A7GibX18DXH6vO4a/Q71E74Ez7pA7pFyzsym?=
 =?us-ascii?Q?XsiveCXbxFTpQirDdQu5R8G5nL4v96+HqFu/kPFvK37VLS/PlZ4FQbr5SsLc?=
 =?us-ascii?Q?1EaAs7Q1+qhpBaeYafSeF3HP18K27aoRYRoCddzgOa9AjZvZmBLdUqt6BArL?=
 =?us-ascii?Q?oeR5LMRTGlZSjr7u1ysAfFHAyQkLsFXHeodxggveMp6uXxHGUb3/dzeHFyg5?=
 =?us-ascii?Q?pERYw32AeVFewGr/1o9YAM77J9cGoibNuBPHk0ymC0C6h0Vya+VBlZrJKTcg?=
 =?us-ascii?Q?E04kFZtNhgDlPNhhyHz6oBfzOkFLorTl40Rbvs0jhUrvypi1KkQqrYqapwvX?=
 =?us-ascii?Q?ku5EKSdHY4f1nK+XkNt5nzZB5BMd7vQRLf9hg9311L/BUneaNSljh8h9cPKn?=
 =?us-ascii?Q?DnQlwssHWTPUF1dzPm8YV2rHOQi7bBzm5ET1fvsjGTmu8qMjF/q3Dcj817k6?=
 =?us-ascii?Q?NXJvIfnBA4rjlloHJ/n97nIa6k94M9WJg7m/SCAkT/oG+sLdIGVqJCgUUyYr?=
 =?us-ascii?Q?L888s87MnApWTV5sKZD19UVjuipoxeENCX9oselknfGZOkUdCe/Cgrpv52AT?=
 =?us-ascii?Q?f4SzQvp45Ono5qW6DoLpgA1vsnjlpLu5xRKVwisvUUH3/kUyv83ALIxGIAHV?=
 =?us-ascii?Q?maXMFBDxe8t72P5mNxPMpTS2vjorOcR0Z+VtE429oQEzOISQKqxmxMiFbyhe?=
 =?us-ascii?Q?v1iXjJVP/L3LT5CZQkX6nqD3aMDhMYk61DZ5rX6Ct5ZaFlfRESNO9lF79YHF?=
 =?us-ascii?Q?jdlLp6IbPfjwwdLpTJ/SVWYvcSBQ8oZNM5PpCeJaTgcmSHZ9rbAIfBTTCf5p?=
 =?us-ascii?Q?GoRqSL0J+PniiEXadX9Vr7s9aF4yq49V?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8498
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 52de17bf-16f6-4845-17e3-08de1573cdd4
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|35042699022|14060799003|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HonTDMz9PLiMwpguvA2KTOTZboKxWvs/sTZvcDTsOXgT82fhHuF39EuZmwFR?=
 =?us-ascii?Q?vV4Auiky3bS3KZVXPJa6ObEYnAGtW0RjtH+5gQVooXV4tliLMkeQEXUXbU2A?=
 =?us-ascii?Q?z11NbFBbBWvM4Ap0JTmNRrjBBXn8rrfkbbtGGP5nz5czkSF/9Jn7+59uc3ml?=
 =?us-ascii?Q?hY9vEx2jBwaMKKJqCsMNtNEyq2Aocd9kLlefiNTSy5nViHmq9iu2V5kHpG7o?=
 =?us-ascii?Q?vNttzy5OdAnz3lRSdH1NNowTnPu5gbTinttNIlLWfvIK3xijsqsy1Bw1hzqi?=
 =?us-ascii?Q?TZrrfST3h2yb8US8Q72Bvx2qFyfBC4WP9QY+E4NtGJXx5HsKATLp3dnBfxDS?=
 =?us-ascii?Q?95e5Jw9VozaSHbp0UuQL0SiexIitXCuOdhrgCPS8UXCSZqr68frRpOJccN2g?=
 =?us-ascii?Q?8qxLGHRrfl1XItK1e4kSp7HC1c79p8A6OCU1tXXFDEnjtfr5R22E+XURhw5+?=
 =?us-ascii?Q?Olbz2PnTHQSLnsi98YKdiCcwM2Q6tfBH4VBAxjjeDOtW1U6zbmVYqVQ3VKvJ?=
 =?us-ascii?Q?6cEoJS9fL/grxtWhzMRGIxDzUH5lIPzF52wjpyGnFxRoyOfOIIL/+E+GcQN8?=
 =?us-ascii?Q?8bVSg62+tewQijR2TUtLlo3UtEpFXIGXTsx8cHuzStAQp/CMwxBDnPeEIflp?=
 =?us-ascii?Q?UC9nyrwRU2W1m+zN18Q5HcOAuxbPyusbFJ1r/osNZdEmHnTs8weBc4IlWvW0?=
 =?us-ascii?Q?pLFVyPpbx3wPODGfU+QgdpC8hley7YnpMaGx/r2ZYcbT8G/opjg/fWNPzxx2?=
 =?us-ascii?Q?5V7UydJzxYZ/uDopXbNk/Mrfhy+cKYO3LbPI+p3LSqdReb1zKbPbqc1Wbgft?=
 =?us-ascii?Q?tFZ/q4naf5GPzJPgDjtlSkjFL1ITCjp25rLRL4FfD7Sn92aNZCz4QtM6kWOp?=
 =?us-ascii?Q?KQ6rn5Cfb3j+rhPRNVODue+jdtdx0LXZO3xtI8PsMehJDQugeDTP1e1XoUa1?=
 =?us-ascii?Q?8y8IuDf5dIuT5SMB3x/0ukxYpwRPsn5tnkUV60rfLapVz4nWlhIuUJEcGlEa?=
 =?us-ascii?Q?rZPYagtBpd9GQfp2ED7GodEvVc/6BL/MUr+003xJVfbLb7xDbeb2aeg6yy7P?=
 =?us-ascii?Q?ZRHn4+o4yI8yZ6QJlOQwvZYedkZkHRube4irKF6It6XTNWrBtugUTbq8b41m?=
 =?us-ascii?Q?W3B3gQr8TkB/MYIvuE0kf1ChE07/95EnoPTrei5uqab1KG4BXgtzH3OOqlb8?=
 =?us-ascii?Q?lAvhMNxNIwGeIGE9yUeqm5I5CkkOAZDRVwm1ogGzps5JKrF6Ky284JP3kLfr?=
 =?us-ascii?Q?nEtB4NXXrvOE31qxWzW5U9OaoGofC2bElA9qa9Ews0QicY2pPQcUtlFJ9J4X?=
 =?us-ascii?Q?MFdRL7XxhuyavfT80mX58qrzqK894VtCtFMKwQB64i1E44AVJuNSjjWBdV4i?=
 =?us-ascii?Q?6V4DOYMpMk/MTWIRBU1MprLzL7oMsrafvzrCSGcPp1tT0pvSIIAqooDrKED0?=
 =?us-ascii?Q?iQxv899rmt0K+xVioGn2WrE0S8xq5sNgNM7cFmZtTDtZX4MRMcwzQuj79rvr?=
 =?us-ascii?Q?cs5eN9Pqdv65EGtVE4oKWw7e+3ikHMwGVIXexi4tAwaKlDcPBdT4NIglfX37?=
 =?us-ascii?Q?j6QUABBepJJcUihRWbI=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(35042699022)(14060799003)(82310400026)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:14:17.6034 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cb3482-ed50-4426-7acc-08de1573e135
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11388
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

Add helpers to issue reset commands through the PWR_CONTROL interface
and wait for reset completion using IRQ signaling. This enables support
for RESET_SOFT operations with timeout handling and status verification.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v2:
 * Dropped RESET_FAST implementation as it is not currently being used.
 * Renamed reset_completed to reset_pending to align with underlying
   logic and fixed the logic of its callers accordingly.
 * Improved readability of panthor_pwr_reset() and removed inline
   ternary expressions.
---
 drivers/gpu/drm/panthor/panthor_pwr.c | 50 +++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h |  2 ++
 2 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
index cd529660a276..4edb818c7ac4 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.c
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -3,6 +3,7 @@

 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
+#include <linux/cleanup.h>
 #include <linux/iopoll.h>
 #include <linux/wait.h>

@@ -31,6 +32,8 @@

 #define PWR_RETRACT_TIMEOUT_US		(2ULL * USEC_PER_MSEC)

+#define PWR_RESET_TIMEOUT_MS		500
+
 /**
  * struct panthor_pwr - PWR_CONTROL block management data.
  */
@@ -75,6 +78,43 @@ static void panthor_pwr_write_command(struct panthor_device *ptdev, u32 command,
 	gpu_write(ptdev, PWR_COMMAND, command);
 }

+static bool reset_irq_raised(struct panthor_device *ptdev)
+{
+	return gpu_read(ptdev, PWR_INT_RAWSTAT) & PWR_IRQ_RESET_COMPLETED;
+}
+
+static bool reset_pending(struct panthor_device *ptdev)
+{
+	return (ptdev->pwr->pending_reqs & PWR_IRQ_RESET_COMPLETED);
+}
+
+static int panthor_pwr_reset(struct panthor_device *ptdev, u32 reset_cmd)
+{
+	scoped_guard(spinlock_irqsave, &ptdev->pwr->reqs_lock) {
+		if (reset_pending(ptdev)) {
+			drm_WARN(&ptdev->base, 1, "Reset already pending");
+		} else {
+			ptdev->pwr->pending_reqs |= PWR_IRQ_RESET_COMPLETED;
+			gpu_write(ptdev, PWR_INT_CLEAR, PWR_IRQ_RESET_COMPLETED);
+			panthor_pwr_write_command(ptdev, reset_cmd, 0);
+		}
+	}
+
+	if (!wait_event_timeout(ptdev->pwr->reqs_acked, !reset_pending(ptdev),
+				msecs_to_jiffies(PWR_RESET_TIMEOUT_MS))) {
+		guard(spinlock_irqsave)(&ptdev->pwr->reqs_lock);
+
+		if (reset_pending(ptdev) && !reset_irq_raised(ptdev)) {
+			drm_err(&ptdev->base, "RESET timed out (0x%x)", reset_cmd);
+			return -ETIMEDOUT;
+		}
+
+		ptdev->pwr->pending_reqs &= ~PWR_IRQ_RESET_COMPLETED;
+	}
+
+	return 0;
+}
+
 static const char *get_domain_name(u8 domain)
 {
 	switch (domain) {
@@ -428,6 +468,16 @@ int panthor_pwr_init(struct panthor_device *ptdev)
 	return 0;
 }

+int panthor_pwr_reset_soft(struct panthor_device *ptdev)
+{
+	if (!(gpu_read64(ptdev, PWR_STATUS) & PWR_STATUS_ALLOW_SOFT_RESET)) {
+		drm_err(&ptdev->base, "RESET_SOFT not allowed");
+		return -EOPNOTSUPP;
+	}
+
+	return panthor_pwr_reset(ptdev, PWR_COMMAND_RESET_SOFT);
+}
+
 void panthor_pwr_l2_power_off(struct panthor_device *ptdev)
 {
 	const u64 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
index 3c834059a860..adf1f6136abc 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.h
+++ b/drivers/gpu/drm/panthor/panthor_pwr.h
@@ -10,6 +10,8 @@ void panthor_pwr_unplug(struct panthor_device *ptdev);

 int panthor_pwr_init(struct panthor_device *ptdev);

+int panthor_pwr_reset_soft(struct panthor_device *ptdev);
+
 void panthor_pwr_l2_power_off(struct panthor_device *ptdev);

 int panthor_pwr_l2_power_on(struct panthor_device *ptdev);
--
2.49.0

