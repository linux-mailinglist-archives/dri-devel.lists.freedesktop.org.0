Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3D8C59DA3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 20:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DAF10E941;
	Thu, 13 Nov 2025 19:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.b="u5neOFeT";
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="u5neOFeT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023142.outbound.protection.outlook.com
 [40.107.162.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E7310E93A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 19:53:23 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EJcOXMBO1JWmswabSjDzLl3oELwAm/fAtkhogAUy4X5Ngp5YOGM5tPL7jLYdCcX/k5v24wuUMn7KsNbtueewHfobY0kihq2/i0PoTIs7FaQbKfqi86Mu0bcmfm+EOn9YtWtZlEBLhYDdTs2SIS5i5Y9c9P2IgN040Yim+1pJ37nOsZbgX8EbASsEJ/6TzpnhmD0kysT/SpHYMBr19yw1aZjMRHjEtM3YD1HJV8579B9fMoBUdYAj5UXMZ8g5r0eDQutXahzmSmp0zW8TRWVZUt4Fah5E+Ssr7qegg5tUWNNQKODM4f7xthvKTHiPPirs3/tnUJsqZ4ZZGG4we0JJow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vh71gZtD+E4jnemvRnY8PKvtl8HkMSJnKEDcHrrfeEs=;
 b=aMr9QpgCMcqQOTcdSxuUaFvs98yqg3N4tTcpXtw0NCRjNsdCKm94CFb9FVIdWVOONCTOZxV1tCP97XpAgZcyw3bNb/PWP/WIGiFCPGZPBnp7GAx1dmi96rckJ5lUkP8hSKUdS9SZ24Mcl+2mDUQ/kHcUinjtrPU7yDCZ8m4ecnyMzj/C8kZRpE4KCmhxP6KlQzpmOoRLcC58jnKnSjfDhYdiXuIvyDn3v8YKxSqnwLqcS+uANIpeSaakKPVA7KBDrLhKJ4X+LVbH7tJuOClyTkSNjEwtHi5gsPrVtzq2FiQbd0UZSB5+nMmajPqFQlivqiK3VBwvLI7FofKmC9H5IQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.87) smtp.rcpttodomain=amd.com smtp.mailfrom=seco.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=seco.com; dkim=pass
 (signature was verified) header.d=seco.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vh71gZtD+E4jnemvRnY8PKvtl8HkMSJnKEDcHrrfeEs=;
 b=u5neOFeTtm4cxDpl9LwNC63ALY47grN9zKi54sCzsS77JjWiSmozCtefZul5OpB9qav9j2fmRBOsclnLDK/+SebJwgt6ig+imeTJEZFhYmt5Zq3QrxgW7ZF3lQtMz/VdQCQczscewpWL/ObC7amJMfLJxo4Rr2sy90lklcn4KYAUi/vilRPs9ZOOaAq58nLIo6X9I2COeUHa6b8UVmt6tIKsTVQTDJGuqzU699LLZthNyloUyapgl9PywrK/6GBMyH65EI7GZOTMEoe7++iaF1U+Re91gub7i3YssRDEbQ8TghmO2nVd+eBggFSWFB1et0S59Lbjhz9F73iWdeGD2w==
Received: from AM9P192CA0015.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::20)
 by AS8PR03MB7013.eurprd03.prod.outlook.com (2603:10a6:20b:23f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 19:53:20 +0000
Received: from AM2PEPF0001C709.eurprd05.prod.outlook.com
 (2603:10a6:20b:21d:cafe::41) by AM9P192CA0015.outlook.office365.com
 (2603:10a6:20b:21d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Thu,
 13 Nov 2025 19:53:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.87) by
 AM2PEPF0001C709.mail.protection.outlook.com (10.167.16.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Thu, 13 Nov 2025 19:53:19 +0000
Received: from outmta (unknown [192.168.82.132])
 by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id
 82A122008058D; Thu, 13 Nov 2025 19:53:19 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (unknown
 [40.107.159.73])
 by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 893A3200C4FE3; 
 Thu, 13 Nov 2025 19:53:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqK8rM6ZFV68ESTC0tY9eYT5vP3zeVHsJ/HNotVwsNPm+8+PGz+OJ1u35NIMj05vSn9J27H2CW42WW9DYHqRnwARuqIBiTLzbbtGEB3XGR0OQGSGslKmw0aHwEU4jzUEF1PH3fjVhgmqF8BpHlr6r6zCjjWfCk75jito3sz83yJYSxQ9se+ndcHbVJugk3UAbvQSJFgtGPY8Sexo+YiUWHR4UqGicejb1424YJBcdQNRrcINEyCW55MM7arD0UfiLBkHb1l6vaSoBWcJEgXWMc1GAeCE2XhdHcoRNjSmh8cgqmQ6rVIbcJaSYk6S/O7aLWZxr+cQLZ225TdaFpQ1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vh71gZtD+E4jnemvRnY8PKvtl8HkMSJnKEDcHrrfeEs=;
 b=AIs4sR9BhZdY87QqiMYTVugvPtnDWDF0Zial+2gZgipYFmEAw9Dald7MFNGCQFrK4vi4/DxdEDI1Sgn5pkwi1yQsrQnd/O4Mg7iP89bCgx76j90wHk56ZKW9xsT2NxXCALfXmlwywuGB6EgLLUVgbNjq0R9oJ6TVguMEs9kC5ibwecj6RJdSJTxn+A8b1ZWo9Zt8LI1z4rNYylpeqMNOqjmZuTTz6Q9L/wUlSfd7Qe4ecT/LJ+qt5wdcYZ00jTMXJmN005KX8gMbJw3AHQ/L4XNWn5DIj5TCHzUaD/foAOjr5vTDGsFjVmbF7XB2clyPtCFA8yDWMo4h1h+kBFr35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vh71gZtD+E4jnemvRnY8PKvtl8HkMSJnKEDcHrrfeEs=;
 b=u5neOFeTtm4cxDpl9LwNC63ALY47grN9zKi54sCzsS77JjWiSmozCtefZul5OpB9qav9j2fmRBOsclnLDK/+SebJwgt6ig+imeTJEZFhYmt5Zq3QrxgW7ZF3lQtMz/VdQCQczscewpWL/ObC7amJMfLJxo4Rr2sy90lklcn4KYAUi/vilRPs9ZOOaAq58nLIo6X9I2COeUHa6b8UVmt6tIKsTVQTDJGuqzU699LLZthNyloUyapgl9PywrK/6GBMyH65EI7GZOTMEoe7++iaF1U+Re91gub7i3YssRDEbQ8TghmO2nVd+eBggFSWFB1et0S59Lbjhz9F73iWdeGD2w==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com (2603:10a6:102:329::6)
 by AS8PR03MB8595.eurprd03.prod.outlook.com (2603:10a6:20b:548::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 19:53:16 +0000
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce]) by PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce%4]) with mapi id 15.20.9298.010; Thu, 13 Nov 2025
 19:53:16 +0000
Message-ID: <fbd1ce27-8c77-46c8-9a27-633d910215eb@seco.com>
Date: Thu, 13 Nov 2025 14:53:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Mike Looijmans <mike.looijmans@topic.nl>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <80ca3ab4-da77-4fb5-94f4-0d1d9acc7fa1@ideasonboard.com>
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <80ca3ab4-da77-4fb5-94f4-0d1d9acc7fa1@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:74::25) To PAVPR03MB9020.eurprd03.prod.outlook.com
 (2603:10a6:102:329::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAVPR03MB9020:EE_|AS8PR03MB8595:EE_|AM2PEPF0001C709:EE_|AS8PR03MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: c640a4de-6929-46f5-155c-08de22ee4b86
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?NUV3NFBrb2MzbFNLSDNoS1BkMEJXajQ0QXl1RklaOWV1RDVNY3RhUm9MMTZk?=
 =?utf-8?B?Q0lxbTdhNGhIMzJLeGp2R3IrdjI4UmFZQnhoV2RVdTZMVmpxcFQ0cUZZWmdD?=
 =?utf-8?B?bDFSZDZoUEJzbHV0UHdlVDFzT3ZaaDJLOTlEWFRkY3JmRDhoVGxabjVwaUl1?=
 =?utf-8?B?STFjaG5FcHZsTFlIUU9kUnZmQmRDTmhkWkY4K0twZmtUYUs5OWZKTkgyVVJX?=
 =?utf-8?B?Nmc5dlF3bFdzWWF1ZVVwdi9BL0ZHdXd3clY0ZkYrTGtIb2xIbW1YQ1VqeU5m?=
 =?utf-8?B?bGgySU13R1cwUFRvV1JaUUVHMXNGaElqZ2RDUy9uL29BUndTZnlSc29oUTIv?=
 =?utf-8?B?UlhtcFlwUGFmUzhOamtaN2QvaHM3ZnlCclEyZUkyQXNJVUt1bkFQbjZTVEho?=
 =?utf-8?B?K0pxUHlraFBkb1Zwb01jSXNzUXlQRFZxbi82dTAwVnJVWnFSSjYyY3pRL0tl?=
 =?utf-8?B?N1hrdVRzZ09pMTVVWkNBZDkycEFNa24vS0JnQXEwcEFYNU1QVjR6OEh0VnBZ?=
 =?utf-8?B?ZDNvOE9UNWJDd1UxN2RtTFBiTW02ZG0rU2tUdnVVUjJFUmFVSm5wa3hodDhV?=
 =?utf-8?B?aGdCUjJSd1BZSzYzcVRkOGd6MGY4d3VCVkhwWFhGQkR6RnFkWW0zRURZSDRy?=
 =?utf-8?B?RitGdjNwTlpZdE5TV0ErNjkwM1pPRTB6KzZNM05COUZ3MHFKcEFjRHRmYUwz?=
 =?utf-8?B?d3pQc2tLb25WaDlNd3E4bUZkd2tsUHdpdkdxTklIenFGd1lHallNUm9ib3c5?=
 =?utf-8?B?RmNPbVhqNFdWaTJwYnZ3eGxlNUd0OUlUSVNHWGlWK2k4YlNVYS9menB5c3hR?=
 =?utf-8?B?SHJHWHVoeUZoYzZ1YUJObWlrQ1h5UEg5TU9hdjY4UWV0cjd5UEFiVUt1eWIr?=
 =?utf-8?B?R0E3b1FtMFlLOUJDOVd2M0cvb0k1NEpCbWlVVG00dHFlTFJqQjZvRFJSVG5S?=
 =?utf-8?B?M3h1QlduMmdmTytrL0Nrenp3RHRneTZnNURDdmV3d3lWa3I0d0VRK2ZWc3lV?=
 =?utf-8?B?aUl4ZGMyeTBQdVpLUGZCbUlGOG9TSG53SG5mc01PcDJqUmkwZGtXZU9MZkVq?=
 =?utf-8?B?WitwbGxxNUdMcE56ZzgzbnpHSS9CSEgyUjBTd01nOVhTUmJsc3Nmdlp5elRL?=
 =?utf-8?B?U1A1a2xKUWRWMUxrQ2pKODRmNVg4Y3h0cVVORm51S2pva1Q2Unc2cHFlOFJs?=
 =?utf-8?B?b1R5aDhoOGkxdy9DTStMdlE1S3k3RmtLM3Z6ZGNaeGs5emFYdm5oU0U5N0Jk?=
 =?utf-8?B?b2ptUVhrR3B3aW12K1p0WkdRTEhhQXlFOHJ0MEoySEhuRTY3Uy9FSExMaTBX?=
 =?utf-8?B?L1pMZXUwbGhjQ0EvcGNDWjhiR0I2cWt3eE5rVlBPNno4eW9VYTIzY1FJeGlN?=
 =?utf-8?B?TWNLdkplU3pKUHdtMVdZcEJNby9mSHBXWFlwcVRFZWtGSlJEblpaOFExYUFB?=
 =?utf-8?B?NHIyMjZMVHBEMFZ5RWtoYWxWN3FWcjJpNlVXWnl2Nms3OExDUFJEYllXczc0?=
 =?utf-8?B?RkVOK3VQcEZFSjA1SnllTnQ2eTl3LzFFdzRCNEtaSFQvUlQrQ3NBYytVMWpo?=
 =?utf-8?B?UGZnRThNK0NodXZJclY4NTVWUGRqWGRmcDhwNXlweVpXbzNHdGs1N1RKYU13?=
 =?utf-8?B?VDE1QUNSMFFjTldDNUxGNGdXMG81UERLb0hVTXpLbUszeFpvNlo1MEVha0V5?=
 =?utf-8?B?Z0hENHkyQjEwVDh4QitQZExvdkU3TmUrcjQyUEcwZzFIbVFrdnJwc1NIMm8r?=
 =?utf-8?B?bWVmNlR1YVdTTGx5dityamlqRnNTMHVWU1IwY3pXR01kOXJuM3JSQkx5M2Nj?=
 =?utf-8?B?TWxreEFPRzVqNlFaUE9PdXVOcXM5dlhFVFFSRVZNRDBBUDZPTHdJRWY1d1BZ?=
 =?utf-8?B?Tmh6VTRWNmtBcFFsL0YyZVNmakN4eHNaOVUrRVorZUI0U21nb0lNaWpsR09j?=
 =?utf-8?Q?C0Wc9n2kVr6aeHBpbUJ+NJxtV0jofwjy?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAVPR03MB9020.eurprd03.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8595
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 992d3063-f30b-4511-7f20-08de22ee4941
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|35042699022|7416014|1800799024|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmJSU05oNSt0VXRUd1B0Rk0xUWlpQlBUcmVuU0RvOGg0S3pzUGFWN2FacWM2?=
 =?utf-8?B?ZzZWRGtJclkveTlXcFZaWEZxMlQvMGJ2VldWdzh2MDJjNmJWaXgzVHF0TlI1?=
 =?utf-8?B?M1I4ZjF2RXpIUDl0WSszNnMzN3d6OXFvMXZHMFdOd3VsZTRvTW10dUNJWTJL?=
 =?utf-8?B?MkRPZ3FtU3V5d1lQVVJOUnRqc3hqa1lCVklZdjF4cU5HK1F5T2J5VW1jMmh6?=
 =?utf-8?B?UzIxd3E4RVNtWnIxRTlZbUFIOTlmVlZ1a3hSaE05VUpPb21BUWY5Wm9ScXJl?=
 =?utf-8?B?bTNXK0tyVncrMnhPN2N6amg0bXJYbWpIZlRPVGJXRHVXSEFRME9mc3QxMGtY?=
 =?utf-8?B?VXdJYnVuTVREaU1aOGJxQ1FRbnl2K1BGNmQ5RGxxUjlsQWt4YXFJU0I4WTZM?=
 =?utf-8?B?YjJJVXdQb0djUk5KcTcxTHRVaTVxdXFKRWZRK0NvbzllaVhIaHMvQ2FqRTJI?=
 =?utf-8?B?Z0VsczJjcXZteFQyQ3ZhQkJpSGJYYnRoYndseVBDemU2UlF6V2pBZ3IzWUM4?=
 =?utf-8?B?YTRubXdZa1lOL1plVjNBbkxqLy9XYU4yOXo5WTErSHZ0L3RHUUpiVUphbzFG?=
 =?utf-8?B?KzhZQk9HQ2JOQXY3Y1dSV0hIdzZJSitGOW5BbGRqdTFoU09xVkpvTmc4Y05h?=
 =?utf-8?B?cTRLMi9KM0ozVityT0doeFdEVElXRmVYZjl2YXJjRDVmNmxmS3V5cE9mMHRZ?=
 =?utf-8?B?emRlR0lVaXpvTTVhTjJ4TGF2eDkrSFhZMGdRcGFXMkRQYTRaSDg0NzdHdHMw?=
 =?utf-8?B?MTBlUGt0Und5UldLZy9KODNpSFUzOU90dFlUVU5RWHUvSlI3bXRsT2dkSjFD?=
 =?utf-8?B?UzFkVy9JbHNwNi9iVURlRG5TbWFRWGRlSStuWkp1bEd4aFZDWDBsMTE3VjVD?=
 =?utf-8?B?NWFLR2dTOGpCOGNIaUp3VDVUSUxpUFp2UTkrRENkTnRQZmdXQkVLeFplQ0dV?=
 =?utf-8?B?cEVYUWpvSHg4emNZU0lQQTNwdUJkZWcwYUNTV21HRWpqWGhiZ1hiMGNvYlRZ?=
 =?utf-8?B?L2phaWNsV2FLSGxXMExwOE54K1FCVmZjS21jRklGYXdXOFg0TjdJRmNEMEJM?=
 =?utf-8?B?RVlWUjh0R084KzhGV3ZqN0k2K1BuM252N3ZuN0FZWjVVQTM4QjFOblFoaGpp?=
 =?utf-8?B?SWpUWWdiNCtLZi83TnlITEhEeWtZdm9pbDdzWmt1dDhaTnowOWRIMmwxRUhL?=
 =?utf-8?B?blRLWHdmNGgxNUg1YVJJMEZpaEpleXhRME05dmxZUHArNDNTR0dHanhSMWVk?=
 =?utf-8?B?eC9pdEZXRFdHUnN1RWdBTTZ3Q2FCYWVucTR2UFVlK0Q3a1NFRlpEODlDcjR6?=
 =?utf-8?B?Rjl4UTZOeHZWaVIrWnhEZ1F1VTlUcXdLeU9kVXpKTkFRUUw2cTVSd3h2eHFH?=
 =?utf-8?B?Tithem1vZUllNmg3VXl0aGVCNEVTUGlKSWZ5dm1paURaa3hBZDhQeGV6TVFJ?=
 =?utf-8?B?bjF0TUdiQmFyRHVCaVgvbTNEcU9oQW8rTGxsWG1oRFZjTkplZFZSYzE3dDBJ?=
 =?utf-8?B?OWQ1bnVKZW9pVEQ2T0NUZXcrV2UyOWU4S1NXNUY2R210VnB2SkhDSVBOOTcx?=
 =?utf-8?B?NG9uZTFJSE5HbTVoQkNCZ0VpSlRlTmVRVXBBbXNnMHoyRVZKZHFhUy9VVGxs?=
 =?utf-8?B?MHpiSlUrM2RGUHJTWGxHUStQWWNpNS9Sb0JPVHdmSGpFcnhMVlJBTnkvb3Uz?=
 =?utf-8?B?RzJwaDNxOGdpc0Y1dVRHTkFhYTMwU1lrQTM1bDB5Ni93aVdySm1wYzQ3bnpK?=
 =?utf-8?B?ZkxFd3hHTUFhYm55dkt2LzY1M1BlS3gySWdTalhlRU5qS2lmQXpyS01kM0Rt?=
 =?utf-8?B?OHdQNnhDNVdxN1ZrYTdDczRpeWgxdCszVFh1OHBaT04yZFl0aCtQQjdaR1I2?=
 =?utf-8?B?clZ0ajI3NHpQYTFEa1l4b2FTeDdiV3h0ckdaa3VqejVPZXM3REdlb2ZXYlBj?=
 =?utf-8?B?aVN6UEN2RmU0REszRDBzUXhFQ2dnVGpUa3hZWTdvWlRhZUIwZ2FpQnFrQTZ6?=
 =?utf-8?B?ZnVvRm1yMDRFRCtnVk83QXQydndqVGQ0TkVJamN4Kzd1dDFOS2E0ZFNRbWVt?=
 =?utf-8?B?QUNjb2RmU2hEU3NISHA4cndmUjl3TytGRVFoa3ZTbU1zT0RxK0d4Qk9rbnRn?=
 =?utf-8?Q?WSuY=3D?=
X-Forefront-Antispam-Report: CIP:20.160.56.87; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:repost-eu.tmcas.trendmicro.com;
 PTR:repost-eu.tmcas.trendmicro.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(35042699022)(7416014)(1800799024)(36860700013)(14060799003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 19:53:19.7356 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c640a4de-6929-46f5-155c-08de22ee4b86
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733; Ip=[20.160.56.87];
 Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7013
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

On 11/5/25 04:51, Tomi Valkeinen wrote:
> Hi,
> 
> On 27/06/2025 17:50, Mike Looijmans wrote:
>> XRGB8888 is the default mode that Xorg will want to use. Add support
>> for this to the Zynqmp DisplayPort driver, so that applications can use
>> 32-bit framebuffers. This solves that the X server would fail to start
>> unless one provided an xorg.conf that sets DefaultDepth to 16.
>> 
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>> 
>>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> index 80d1e499a18d..501428437000 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
>>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>>  		.swap		= true,
>>  		.sf		= scaling_factors_888,
>> +	}, {
>> +		.drm_fmt	= DRM_FORMAT_XRGB8888,
>> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>> +		.swap		= true,
>> +		.sf		= scaling_factors_888,
>>  	}, {
>>  		.drm_fmt	= DRM_FORMAT_RGBA8888,
>>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_ABGR8888,
> 
> I did some testing with this.
> 
> With current upstream, I can't start either weston or X. Weston says
> XRGB8888 not supported, X says modeset failed.

You have to configure X to use 16-bit color. e.g. set DefaultDepth 16 in
your screen section. That will cause X to use RGB565, which is
supported.

--Sean

> But we do have XRGB8888, on the VID plane. VID plane is even set as the
> first plane (perhaps intentionally, to have XRGB8888 on the first
> plane?). However, for VID plane, we set DRM_PLANE_TYPE_OVERLAY and for
> GFX plane we set DRM_PLANE_TYPE_PRIMARY. According to docs, these plane
> type flags are legacy, and are ignored by userspace that supports
> universal planes. So, both Weston and X should work, but don't.
> 
> Out of interest, I tested switching the plane types the other way
> around. This made weston start, but X still doesn't. So apparently
> weston does use those flags, and they're mandatory. I'm a bit surprised
> that X doesn't start. So having the first plane as PRIMARY with XRGB8888
> still wasn't enough for some reason.
> 
> With this patch, both weston and X start.
> 
> According to Anatoliy: "The ZynqMP DP blender ignores per pixel alpha if
> top plane alpha is enabled (which is always the case in the driver). So,
> AR24 is effectively treated as XR24 by the hardware". So should we then
> remove the alpha formats from the driver, as they are effectively not
> supported?
> 
>  Tomi
> 
> 
> 
