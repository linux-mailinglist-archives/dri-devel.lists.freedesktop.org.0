Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDCyE5LpnWlDSgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 19:10:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B1A18B08C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 19:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7685F10E609;
	Tue, 24 Feb 2026 18:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="oRX2hDD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011071.outbound.protection.outlook.com
 [40.93.194.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0598E10E606
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 18:10:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=se7IRQx2ZGE3txAodMGwg7Fi1UALW/3n2nCfmU1eDITndytVYv8ZDh4oc8AvFsLro7xq30QKskPuYV8rCl83lxv1ozGRbveN6/a9MM/YRi2cWSe73GuI2tqiPD3/4O10ky3SDF+6pGSqwkXf3diSLQB/70kcgCnGxhNhnDHVrIC3GNwtRCJv/+PPltYgpCIsoqXAmvzphxDlcmDN3/MnUtJm4C3tYSuFpg9qq/+Jljcmzl8r+CKB1zt3V96NuFdhf1Zi0Kb3ZC+XtGogO/sf5/9NeUABjxPkU+4AtMWp/HFIzVMtvS9OJiuICTNixjSlSHNOTy5NNNZaR+6EQbduHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeUlg7NjZtNWNtDj74dqXt4wXlDChBcKMEBObPZcSgY=;
 b=dSwbPjHVNxx53AR0/8Yo8oLRMO/h5Nid/PLr3ibwdfmKdtg1k6I748ki6MRkX2PPAU9vfsCSbOKYTCt7XhXWP7Q9p4YVFXDcuvPVHWL4OTac1Yz1kW3TW9Weush7FPcMSXa2KUBPq+2WypoADiMjSA+K+Hje9QE/hUntBvKe+5Y4Q8zHS2xzN7sKWqEWhLE7f76hsJQJoWnge+zW7knMmrWeZa79EywQo7Fu6fQ0oUVllzgpq1FFWmks1fNhLo7+rHTazjbro4Pgmt8EWKWAOiLHaOfQTyN7d0m8LRx/rHdX3nQXoemQl/Dp79SmQLQoozfKNxY3gJ7C8a3V2+9Whg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeUlg7NjZtNWNtDj74dqXt4wXlDChBcKMEBObPZcSgY=;
 b=oRX2hDD8jxE3gZlKXnWGcc2GGIUrqXqecATq0K4XcVVlQOXsL/+dF0DT3tJX01Tc2Fq30btGR8R8Bak6vJ5kACoGbdtlzBgYB2SDtPvZ6/ajYCJbEItEr3Ix7NzMjsw2EfTFmHmzTRrU2fT6aQ1HOebA4STo1Q6k8960yOTtlk4=
Received: from BN9PR03CA0240.namprd03.prod.outlook.com (2603:10b6:408:f8::35)
 by SJ0PR10MB4560.namprd10.prod.outlook.com (2603:10b6:a03:2d3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 18:10:15 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:f8:cafe::93) by BN9PR03CA0240.outlook.office365.com
 (2603:10b6:408:f8::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 18:09:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 18:10:14 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:10:12 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:10:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 12:10:12 -0600
Received: from [127.0.1.1] (antonios-thinkstation-p3-tower.dhcp.ti.com
 [128.247.81.112])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OIABBY3186529;
 Tue, 24 Feb 2026 12:10:12 -0600
From: <a-christidis@ti.com>
Date: Tue, 24 Feb 2026 12:09:19 -0600
Subject: [PATCH 5/5] clk: keystone: don't cache clock rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260224-gpu_dts-v1-5-cc5ddffe140c@ti.com>
References: <20260224-gpu_dts-v1-0-cc5ddffe140c@ti.com>
In-Reply-To: <20260224-gpu_dts-v1-0-cc5ddffe140c@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Frank
 Binns" <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-clk@vger.kernel.org>, Antonios Christidis <a-christidis@ti.com>,
 Michael Walle <mwalle@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Randolph Sapp <rs@ti.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771956611; l=1520;
 i=a-christidis@ti.com; s=20260224; h=from:subject:message-id;
 bh=XWb4lYciqZHqhuRtlQ+BlN6Z9yVOpfrn1pVfXsByYdY=;
 b=fzcxTnxIl6gejSl/x6aY5NpHtpHrpRCGT5DgKRqQ/TC7/6pltbaXFxfOE4VCjakyS4DgcS6Vd
 9c+PRKdgEJxCumyYT7JZS/eCKKeoVZF1x6kV5mWHNTtpgFCFpGWkD/2
X-Developer-Key: i=a-christidis@ti.com; a=ed25519;
 pk=HcbNQnPnde8WLoob9CZpry+ZyXrXg5+wessZiBGMaFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|SJ0PR10MB4560:EE_
X-MS-Office365-Filtering-Correlation-Id: c598abb3-06db-4a5d-572c-08de73cff559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEZDYWZaSEo5VEoxbkNKcHg3Y0M2YXFwWlRhN2hiTzIvZGp5eGwxQ0wrN3dO?=
 =?utf-8?B?TEtnT2lnbGdvMVFFQkRnT1ZoM1BiMDUxcFMxN2sydURJb25XbTlUbm5CZWFK?=
 =?utf-8?B?NmJjYlcrTmxHeE5hTjV2YUJiZ3RLRW5sS2x3cnM3akNiQ1hUd2YzK1U0TmNW?=
 =?utf-8?B?OGdxYUt1dnN1V2VrWnZDbFBIcUlVRytpbFFVTFlPSCtHYXJOT05rQmZxYi92?=
 =?utf-8?B?ZXVzUjdKc3hMcjAvSXZ6Y29wZkdMWk96am5BcW41NDRhWmNORkRJOVRZd0JX?=
 =?utf-8?B?RUdpcVhRVDlSM0NBa05CUnlLS0swdlJQRjljaXBmdENPd2FmZnN1QTI3WFli?=
 =?utf-8?B?b1RYS0Z2UGQ2bFNsbVhCclVaTDhFa3R5d3ZWTVpWSERYZXJySXJaZzV4L3RB?=
 =?utf-8?B?VDA3czlNQU8xaGkreURmQ1V2RHJNMFA5U2tmUUQ5UEROUGNiVmJpem5vQ21V?=
 =?utf-8?B?M3FyakJMWjkxUUx4K0ZXZktKNzVSRkhsRkZpS0dwNkFNaFp5dTZOMnYrSjRV?=
 =?utf-8?B?aEVBdXE1UVRzL3hnVWFyWno0YXpQL2J4VXlhajJJSmt1Vi91RDRvR2lJdEUv?=
 =?utf-8?B?ZW9rVkY2R2d2M1p2OGpGTmxxbjdZQ20zS01pNjhjREVxL3d6TlE0MlFzK2ty?=
 =?utf-8?B?d2dWeTJpRGN0S2c5LzN5MlU1SHVrUFpkNk8rajZhdk5uaDVyaFVWNjl2TnBY?=
 =?utf-8?B?Vk1DalJSR05TYVpUcjhrOE42OGNNbmFiWml2a09ITitBNjlkVlFEZDZyNUZE?=
 =?utf-8?B?VW5oOXBSZGw2bDY4bTZsbDdtTVlZWHo3MU5LcldmQytrNUdtclRCZG1pNzdz?=
 =?utf-8?B?RndFZFd4d2xzdXQzNnR0VjJXNTdNamk0T1NUUnBMenBhdUttNEZOWlk2aHg2?=
 =?utf-8?B?WDVGTW1IRk9QWFVWMVhRcit3Y3dHZjJhNWNxMnpiaUZrVjFtQ2xYTFFIaGU4?=
 =?utf-8?B?SmN0bDEyQmJUOFJNYnB1c1lSaEI2UEYvUXRmMjRQcU05aW1NdmxWL1NCMlJE?=
 =?utf-8?B?UnArd0FTd3I4OGVpV2FFOVZGb1BKZndJQW1hcnBYRitFUng0RWdibEhSZEts?=
 =?utf-8?B?QnB1SjlJWHM1YVdnWUpUSDA1RmZwNWxPL1ErRWhYbzIxYXNXejFZRk91UzVJ?=
 =?utf-8?B?L1FnbnZrdnVySVo4clZwaE5FQW1rZS9VWGZVdlY2QkpQR2l1N1VQdFpBcVZH?=
 =?utf-8?B?clJaYnVjd2xsWVJkZUhuS0xBTzI3WW5zZnRDZzlCeHU2MDkzWXJKci9VcXlq?=
 =?utf-8?B?YURNWGpFRG12S3FESzJlL3pkRUx3dUs1OEFVM2h2Q3laRi9nMmxOK2x0MmNn?=
 =?utf-8?B?Zko0N1VFaTB2aURET1JXR3pGWDVwSlRBMUV5WG9sTFQwS0t1aG04NmlTKzd2?=
 =?utf-8?B?QlFrbEthLzRFeGViLzZCYTh4VXFRQTJxRUdSSmVtTGRZMzdXbkkxNGhSb2Zr?=
 =?utf-8?B?U3hBb0tNbFVYYVNTVXAxeTAvL05FVVNRZDNBQk4wb0JiQmFHcDdYK1Q1YVl1?=
 =?utf-8?B?ZHNIQjFocmQ3MVphSW5aSGdtd1kxTUVHUytIMGU5Y29aLzRxY0RLQW10UWg1?=
 =?utf-8?B?QzMyNTFzRnBTSE8xaFJoR25lejZSd0h1OUQ1UXFrM2tTQThOZE1kOTEvYVYv?=
 =?utf-8?B?YjMwWTN0VjlWRC8xVVd1c2VxTVAzMldkVVlqRnNnZDN6YTJCNnBjVXAyV01J?=
 =?utf-8?B?RlFCdUNYYU1NWkE4V1pFVmtXczl3ZlRNSmdJOXJYV0tXL3k3QlhGS1daVDJy?=
 =?utf-8?B?UThINzQ5NkV1TlE4MUQrMUQ2L3phUENaV3NDa0lVM3dJTTFmNUFwZHE1YTRD?=
 =?utf-8?B?KzA5bVVUQmtrcVYxUHhtdUF6ZitETDhZb2F4Rk9XVkFiU0Y4cUZ3cWxtdy9t?=
 =?utf-8?B?R3VUdS9sZWc2dWRSVEFaVFZqTFRLeUsvaWZsbGxGYVF1QnIxTlU2NEN3Y0FC?=
 =?utf-8?B?SXh6NElwcGxydlZWQTN1Yll4M2pjUWRqRmpQRzBMVEFXQTZIRzBHTGxDaUlO?=
 =?utf-8?B?Mmp3NDZmemtPc3IxdzhxU3BtektHdFYwTHJoTkNHZEJRSkJPaGRPWTRtNXp2?=
 =?utf-8?B?dmFra0V3amg0dDBGbHZuM3RERlNUSnBZRmNWckZEaE94WlJmQnhJa1lORVMz?=
 =?utf-8?B?N2tJYWoycCsrb1VGL3UyRWZuTVA5QXcvdUgwN05nd0cwallJZW1LSExTNDdL?=
 =?utf-8?B?T1ZxS1ZPMC95MHpkeDU1YnJWa2NNZU9pMlFUa25CcVd3bGNTT3pqUHU3bFdz?=
 =?utf-8?B?ZGpQVGZoU3kvNU9LckRKaDNCWGJBPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RkpBt6BM+eew0JtJXDRvCh5b9qryHsZoe8VkN2J6mU03Nu5ojnTGrTMZYHpYCoeq4I5a1AqejcKXkwpwgRE7gVNQvTIIpc21s8HfSPNC/7NruzQYQU5EOw/041XFZaN9dRLvlVf0Vn5ObjNBDoGASg/BbmTsPVxnZW5o0zINEKoK8lDd/CkDmNBwsiPO/gbiH6xow9I3yz5i5sV5R8iG3XBerngZLisqO4YOwcDmHxt4AiOp+5DsbSrSW3qliA7roISMoRkSZfkLQ7YVto42D4YTyRiJovYlXbBRCxO5x6wAnFY++ahlPOpJ5ltBugerhC9MtzYAy3RjxP51R76BVLUKL+Oh2sm1fNmPZIGtSIcRGNx219K/6X6VhcV3JlAmHYQYBTRVapLQkhUXOm4Pf8I2ejVMaDJeXNp7ji5Xx+MXUvezHoPn1zySKh40BajU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 18:10:14.3680 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c598abb3-06db-4a5d-572c-08de73cff559
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4560
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nm@ti.com,m:vigneshr@ti.com,m:kristo@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:ssantosh@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:a-christidis@ti.com,m:mwalle@kernel.org,m:khilman@baylibre.com,m:rs@ti.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[a-christidis@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,imgtec.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,baylibre.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a-christidis@ti.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ti.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C2B1A18B08C
X-Rspamd-Action: no action

From: Michael Walle <mwalle@kernel.org>

The TISCI firmware will return 0 if the clock or consumer is not
enabled although there is a stored value in the firmware. IOW a call to
set rate will work but at get rate will always return 0 if the clock is
disabled.
The clk framework will try to cache the clock rate when it's requested
by a consumer. If the clock or consumer is not enabled at that point,
the cached value is 0, which is wrong. Thus, disable the cache
altogether.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Randolph Sapp <rs@ti.com>
Reviewed-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 drivers/clk/keystone/sci-clk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 9d5071223f4c..0a1565fdbb3b 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -333,6 +333,14 @@ static int _sci_clk_build(struct sci_clk_provider *provider,
 
 	init.ops = &sci_clk_ops;
 	init.num_parents = sci_clk->num_parents;
+
+	/*
+	 * A clock rate query to the SCI firmware will return 0 if either the
+	 * clock itself is disabled or the attached device/consumer is disabled.
+	 * This makes it inherently unsuitable for the caching of the clk
+	 * framework.
+	 */
+	init.flags = CLK_GET_RATE_NOCACHE;
 	sci_clk->hw.init = &init;
 
 	ret = devm_clk_hw_register(provider->dev, &sci_clk->hw);

-- 
2.34.1

