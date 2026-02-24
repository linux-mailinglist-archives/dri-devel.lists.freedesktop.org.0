Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHceOZDpnWlDSgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 19:10:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463B718B084
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 19:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5116910E606;
	Tue, 24 Feb 2026 18:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="w7ALruof";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012000.outbound.protection.outlook.com
 [40.107.200.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E18E10E606
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 18:10:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1Jv6xmzphtVUIwo4vs4Pr65iWj7K4l87KvrMeM5EQm2eul6R0lRUTBiFu/T6ZI79DpRnZgvRVLzGC20tByzNhwvxKFGPsdeByD1CvPFAl7iA+pLwAJrKV/E7YBqQk5wadP+ftL8D+MeeOhoTx9zgJVlLUFdMWwSqWnHQupv/M4erhjsLHHpejE3vnH7AUHIoXkTXB9A1CYaW5vXQKyOm6nkqPaGMQO8SAN4MQBu0VBupiiV2tgH9cITWGpbEBUdQRvQorUrftSuLqgaYc5VxXEhsO507WTTtgd0EQnKsYMS7uA65SdkHOXfo4il9gG9DNcjTkFlte5F+oMCMxW8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUl0ngzA2RV5iJ33pdsiCcGN84uUtOnY3w5S1iJdwII=;
 b=kmaYAJnR7xUTZ0z5Kwr8kevmXDeMZV/jtEi4Om+lhPQxcj63NzjN1uSXEkujWlkGxbIsb4UKeGrRc3xKR10oBFsnfR7k9bdANiQvfJvRxQJfUyconVh1PYtk/pvb0Myueej6ayiHaBr2pFdJWjM0+vf/CNRaVm4ooAbTt7IN7H36nGI1YukZzqbbrqGABZ65WP9Pgi+YsuoVKRjOE18Nc1WgJ5BSLBCENNYy49P5oy35VtmH9gZHHOuya07IC/KZlXMOk1kDross2mCmjLp1GwXzktsaP3C/tBeJ4BIAoTudNczypWSqvb/m7RR7rjvyGwRvbT5BUZgcJ8zGWpHTEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUl0ngzA2RV5iJ33pdsiCcGN84uUtOnY3w5S1iJdwII=;
 b=w7ALruof/LggGwzUjzhtP4VsOm597VLtX0xlkpck8IBiDtCLK6aYnehMQMvcMzrczbCGsPLBSIYuiFEuarkXq3AlAfOjkRgfVnLnuG1m3X7x6DWKHMhhrVfQZ3CXbFPTC4MCbhBNshFZkCbo0bvdWrmXmR7Mw9SEwVzFBfl0cfk=
Received: from SJ0PR13CA0101.namprd13.prod.outlook.com (2603:10b6:a03:2c5::16)
 by SA1PR10MB6317.namprd10.prod.outlook.com (2603:10b6:806:250::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 18:10:15 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::40) by SJ0PR13CA0101.outlook.office365.com
 (2603:10b6:a03:2c5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 18:10:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 18:10:13 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:10:12 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:10:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 12:10:12 -0600
Received: from [127.0.1.1] (antonios-thinkstation-p3-tower.dhcp.ti.com
 [128.247.81.112])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OIABBX3186529;
 Tue, 24 Feb 2026 12:10:12 -0600
From: <a-christidis@ti.com>
Date: Tue, 24 Feb 2026 12:09:18 -0600
Subject: [PATCH 4/5] arm64: dts: ti: add GPU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260224-gpu_dts-v1-4-cc5ddffe140c@ti.com>
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
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771956611; l=1177;
 i=a-christidis@ti.com; s=20260224; h=from:subject:message-id;
 bh=Ot7p6z/Ml649hqGNrWu2pjyji01ZWEW103+bdN+XlrM=;
 b=PzW4Q7dYQVVLmjxwk/TJR/xZGoj42feykXBjc831xI9Bh9wyeoiIV76mSouJDUca/FkyzYLlq
 deKHcQeCux+BmsDlLd9n7l9sOMbomCD7jfe6OE0N1qizIom5qck3/JD
X-Developer-Key: i=a-christidis@ti.com; a=ed25519;
 pk=HcbNQnPnde8WLoob9CZpry+ZyXrXg5+wessZiBGMaFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|SA1PR10MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: 42cb82ea-a014-44ad-54c2-08de73cff48d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|1800799024|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlNIRzJkdXJ5QjZzVmkwQjRxdEdRK3hVTThxSEVRbi9iMEdQSTg5WjJUTjIv?=
 =?utf-8?B?WHRMV1NrNjM4WllMZWd5d1VHbEpJYUw0c3pQMUdEUXJZTWtqRUxFdjVQZUN0?=
 =?utf-8?B?NWFLRTdiMkM4TW5FSjA4REc1cXJrcTJ2K0V6cURYQUFhaE1vdEZRLzZSQW83?=
 =?utf-8?B?aENGdGhsNFc5K0Y4SDVMVHo3aEhvV2UvcFNnbDVtUzYrb3FNazZsV0RYQ0NB?=
 =?utf-8?B?Y3RCajh1VjRJNXNXb25MbklRUmlpNjduQTk5a2EvUXBHTGFPejVabzhzTEhU?=
 =?utf-8?B?RVhST3Y5RjBFWGlaa0hwTXNxTUV0VmxIVE8xclphV0ZuZnd1SUozZVdmbURp?=
 =?utf-8?B?eEJOaUYwTllReHAxVlY5SGJqYU5BTldDYUFQL1dXWWZhRGI0dVJodFRnSmh2?=
 =?utf-8?B?ME05R1hrZU9sUzlxeGlRa2hLaEN0NGtrbHpFRkV1RXpDYVN1R25Idmt4TFJj?=
 =?utf-8?B?Z1dQbmZkb0dWRFZDTHZpa0JOeFdNbTlDSkFLelRVd0ExVXFvU0tqV3hyLy83?=
 =?utf-8?B?OEhGcHNsYUUwdzJHK1VZYktmbE5sOWxtSXpkWnBFVzlISVliVXIxMmZ4ZDJs?=
 =?utf-8?B?dDBwa3Bnak0xMGZWOThsdWtjNm81cGJVK3FJRS8yeXd2NHk4MTFEUzZDV0w4?=
 =?utf-8?B?TnZWZDAwUU1aRW1XWGdNU2N1bHYwSldTR1BlcVlNQytqVklZUkRFTFpDRTFN?=
 =?utf-8?B?V2M0Z3J3NlRVNzVIQzIvQUpYTEVVMVRiWEN0L2pRWU0wR25xTnNuM3lWRXRi?=
 =?utf-8?B?cVdiS1RXdHBQS0dCVkI5dWNoR2xQMzMrZHpGZVRNMHltR0ZrTXJQbzhjR1Ja?=
 =?utf-8?B?ZmR4bVIxUjE0aHU5UmlqV2Z3VGVkd2RIVFkxNnhZMzVuSnAwN2NFY01tdW5U?=
 =?utf-8?B?RzlGK2ZpeDA0a2NkNHdla1JHZ1g4Z1h0dUpRa29UQnF4b0pLMkNrT3dOelNU?=
 =?utf-8?B?TzA2QktmVmlTTXhINCt4Ny83TTM5SEdEVUZEK04zKy96VHlFMVNHQ2MrdlFn?=
 =?utf-8?B?T0p6azlSdi90Wmtyczlla0k0bWZZNGQrdWtOQ3RrTzIrQXNXVkJ2VzcwaWI5?=
 =?utf-8?B?aVZkKzQwQ1IzQ2UwbXV4UjF3T2RxNFYvVXhCbjZXdGdyRU10Rm96N09yNUF0?=
 =?utf-8?B?RTRCQXdHRVR5Z0Y5Z1ZEZ0o2TFlVUENZMEZUK0NRajc1SmNqSjJmWExvYkg2?=
 =?utf-8?B?VXdTUGg4eXEzclZWUlZLWURLTXNtTndCUWQwRmU2UHhkWXBTSldiZVVpbW9S?=
 =?utf-8?B?LytJU2F2d0FEK1ZZMjd0enRFZUU4YjNlajkwcGNaVXp6eDlFRWJhTjZyUWlI?=
 =?utf-8?B?aDI0K3doNzBNWUQzbmpqRTNSeXlpRnE1VmxhdThTZVI1eHl2ajVmeTdtS2tp?=
 =?utf-8?B?OTlXZDgvWGpoZ1RVYUFBU3JoZjdyYU9LRHF2ek1rYXJrMEx5d0djRHJxRWtL?=
 =?utf-8?B?TFNXcGdoK3NOeHUzOUxPSDVnenVwbkhzekNIbFlsOEJZY25xWjRVNkZ6VTJt?=
 =?utf-8?B?eENKTUwxQ1hwTG9WV2ZCdEZMb3ZjMVcySzErNlFyOXpnT1lMbkVtaEtUM1c0?=
 =?utf-8?B?WXhuTFpmNzVpRXduV2RQOExmNERPSmpzQmZsOFNPVU5HUVdHUytmUVcxNHVF?=
 =?utf-8?B?NjExQmFxanI2YU4zWFpNS2F6SjJmd1hkVThsbGJJYlVWWm1kaVpDOWJ5elEw?=
 =?utf-8?B?TjY2T2hnS1ZKY1NvdW5od2c4ekEzSHFBd2hLL2VKV3Rqa2xjazJqUXRCbzRQ?=
 =?utf-8?B?YUN5RllkdWcreHVvcit4Y3VUVlE5YnNSQWpKQnp0V0VpRGhvUlYwTTRVb3pE?=
 =?utf-8?B?ODNSampTZjZsbk9FQWNmdFg2TFBhVU5GbTlHZXBEcFQ1MGtmc0Fqb1Fuclpz?=
 =?utf-8?B?c21aZXcvcHA2dU9hOERQUUVhOEV2VEZJaTNCbU5TMnJWYXhDS3k5UGxZMXpT?=
 =?utf-8?B?TnhhSjJMUS85QVdNd2J1UFhZVlFETXVzN01RRkNPOGhiT3pZNVNsbzE1Uzc1?=
 =?utf-8?B?enRteEUzVVE0RFlGM1pMNXRpQlFlUUdOR3J2NmFSY01iRVJpaDR5VHp4Nmkr?=
 =?utf-8?B?ais0TmlvZ2NZOUpOamFqRDh1ZnB3Z2NwS3h0empDWm5LZ2RXSE45NExGL05W?=
 =?utf-8?B?T2M5ZjdTTEh0djJYSmJhVnYrbEszcWhEZGV1MGt0T3htT0ZENXVRcFRXQnhJ?=
 =?utf-8?B?VWUzb0RwdnN0TmQ5TmFXcTYxaFhhMTVTLzAzd0QzVWU5aWVWUUI1b3Zqbksz?=
 =?utf-8?Q?abZdf/BosGWg8+PydjP5AVfe5lEzrcOl12DfQNo0XA=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: l6LVPHxeUWD7T8yWtMJHufj+Sk1WXmkbW5QWfM+V8KCg7RVIoJ9G1CcCaco77RmFKnPW4jM1f72B5EAVXaFOAgj0TyAHgueqUq0kMAKSaxlMBaPmcfgyG0Goc1a6qmymq5dPUMJAZNCC+gjBsc9/uDyzwhLgUG/Uo+64wCEy+ZALUJLQbZMw6ekqfLlHQgwFPIh0oyhMAT0fNp4hpGqluoTMSmxeNYwvu3uFJMip1bGlbb6X84k3Ttnqta+NZrkIFMpY5WG2Pht/9RYEmgGtvbjqpktY0N1B789tKGktRs17SpDSbYQGvbEBhFMwjHkLZlFSPgstkh0i//m/1vQnTT7IgVKVFZJdidwMLyVnoVTF7uiQ6ygXHwp3lXKf4iO3oAc2Rg3H86sshabgAU+U15xmF2Y4i2zJKblGvO3rt+sLeAmJ9LJ3diyXtRndq8ca
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 18:10:13.0212 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42cb82ea-a014-44ad-54c2-08de73cff48d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6317
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nm@ti.com,m:vigneshr@ti.com,m:kristo@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:ssantosh@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:a-christidis@ti.com,m:mwalle@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[a-christidis@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,imgtec.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,fd80000:email,1.204.247.208:email];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[1.203.113.48:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a-christidis@ti.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 463B718B084
X-Rspamd-Action: no action

From: Michael Walle <mwalle@kernel.org>

The J722S features a BXS-4 GPU. Add the node for it.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 0e1af2a69ca2..20f7474f986b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1110,6 +1110,17 @@ dphy0: phy@30110000 {
 		status = "disabled";
 	};
 
+	gpu: gpu@fd80000 {
+		compatible = "ti,am62p-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = <0x00 0x0fd80000 0x00 0x80000>;
+		clocks = <&k3_clks 237 3>;
+		clock-names = "core";
+		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>,
+				<&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+	};
+
 	vpu: video-codec@30210000 {
 		compatible = "ti,j721s2-wave521c", "cnm,wave521c";
 		reg = <0x00 0x30210000 0x00 0x10000>;

-- 
2.34.1

