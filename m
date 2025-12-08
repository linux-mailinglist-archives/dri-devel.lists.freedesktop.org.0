Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB92CADD97
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 18:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C35E10E1BE;
	Mon,  8 Dec 2025 17:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="bq32Xe+N";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bq32Xe+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013001.outbound.protection.outlook.com [52.101.72.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D2610E1BE
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 17:16:04 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FzGPO36eMzq4ZsU6eh6HSPCg3TJOCbCoUhqHYSUQcMC77FhT15k2k+7JnCzPTYfYqxAr3iqvXF0gAHtrAwvwlwFWh0ehPDzK9rPqUjBD+5giLeNKiUx5yO5CQcBs313HO6dBXC5DkVGYa7DvIxoxDXWrJ8vvuBAgpPxf+H+14o7vN9TWZlwQrj2deZvmrkbVMAyZ6OVU84Ji6+xcM1wrMBYJ3McHFqNxzNsVDMEmMmRGni/Qj1JVGhQ4m6Ja5/QxeZ8n0IbYBDj+iF5O2zT7kqwnzPV9ku0Xu01OgLRIPvX7AlSknKgzk5OroCvag4BpAlGAMVz/XStacQrQTO+nHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EdfnnjvBHzv8Zj1Ndr7HjDuyN8bjycWYb69dNUu9F4=;
 b=hhESCZCOzpC65VhJ2Dy5wzTqnTU6ubTLagZ7Pb9ueVEBO07RT8mIm+WXsrNmzAJ/eg4kzaSgrVJGEK05/50V8gVLdBU4Cpctts9+7WmTvLWrYk5dnBAFXO6NrzKvgc9XIpzAw9TO3Ui1ec6lSLckrvp8xw/GTQg6dta+Ve87R0QFXufC427a8/zx1vbBfD3kSZG07pwKqDb778Q3JX5VY+fSeaRzPQMFVMcsE1YzQoxcrt8UIWlE2fNThZiB96pVB8FXbfQoFGLtJi5oPBS9Vayxpc6mKLcMjcoQrYOe26lQULj/X6PP6M3NBeXJoapuSc/581ovwmxvaKn1VSTmiQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EdfnnjvBHzv8Zj1Ndr7HjDuyN8bjycWYb69dNUu9F4=;
 b=bq32Xe+NheAzf7BZBtc+wcuZq0ZgsUNkorHX4LsZ6fcPpT9LGIr93xaFw7MhSrI9AmWFa/S7BJY6XGAcGTuEY2aOn3QpwQqXdTK2mr3+NHLOSEgnc8QvEh2GcML8LWSy+bSwyMVEK4dk04XaXUGpYmoU5CVpeVwz+agtQaiDEws=
Received: from DU7P250CA0022.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::6) by
 GVXPR08MB10962.eurprd08.prod.outlook.com (2603:10a6:150:1fb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 17:15:58 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::a5) by DU7P250CA0022.outlook.office365.com
 (2603:10a6:10:54f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 17:15:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 8 Dec 2025 17:15:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iP9Kp41rD99fX2O6SRGoYyXCWxl1P6ClgtsiZ2oOPly/Rbyma/IGoQg3XKN9N1S2UXKW/9ClRMCqymR6kxjGSSYQxxUgL57CNCXgcSTP+3Q0zTLGo4O743P/oQmrRgS+Z7+j8Pj3jVSoTpxXiE5DW6mvZoK2ZVftbhiF3uQnwLzSlkrtzpPJMjLyt2Eh30jvfGLtPhZCXXtiHJYsHJyZyYgvlNf4JeMWZvkltIyqayMVCCQ3BDNdZcKTOQc+BwYrcW1lAOTPl73aJvEyKfVp6Iv2BxFK6H5woTHEKs3W9UIzOV/RzEuRb2qRBhe0U22tpzwfifu6Mp+oRR9ZSl00XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EdfnnjvBHzv8Zj1Ndr7HjDuyN8bjycWYb69dNUu9F4=;
 b=vNF6HkHcgANv2c1CFVDjcfAbC9L0iGVVj2++uVbHqQjf5OcoqKK9kKAYwhBDy7O3dCDNTBUfLOSGZGSqhK8JcLgJxXRAd/Y8DfCh+i/ykAVvNZHij+2ArHe1SyPOacW733zCXUphgByhJ70ABpb3DlK/Ivipf7mibs4WxkNGPyogYmWyJchzIG9/n4lMpezmQMDwinnrfvJKw+JF3y2j7uWKpjKqXXmT6saAkIYhnm9Uk6J1lAn9WRaY61EnzR3NMPETJloELM46oTsRJt2/cxYvSUtIaPv5Ux/utFGGFMQqXLDNoo72JOb2NB/oTTb5vHFl9G5PfHY6NyCJMprduA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EdfnnjvBHzv8Zj1Ndr7HjDuyN8bjycWYb69dNUu9F4=;
 b=bq32Xe+NheAzf7BZBtc+wcuZq0ZgsUNkorHX4LsZ6fcPpT9LGIr93xaFw7MhSrI9AmWFa/S7BJY6XGAcGTuEY2aOn3QpwQqXdTK2mr3+NHLOSEgnc8QvEh2GcML8LWSy+bSwyMVEK4dk04XaXUGpYmoU5CVpeVwz+agtQaiDEws=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB8610.eurprd08.prod.outlook.com
 (2603:10a6:20b:564::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 17:14:55 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 17:14:55 +0000
Message-ID: <4363e055-c1f9-49c6-81dd-c2e5f8307310@arm.com>
Date: Mon, 8 Dec 2025 17:14:53 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panthor: Add tracepoint for hardware utilisation
 changes
Content-Language: en-GB
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com>
 <20251203-panthor-tracepoints-v1-1-871c8917e084@collabora.com>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <20251203-panthor-tracepoints-v1-1-871c8917e084@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0491.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::10) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB8610:EE_|DU2PEPF00028D0B:EE_|GVXPR08MB10962:EE_
X-MS-Office365-Filtering-Correlation-Id: eae27d87-a142-4d7a-1654-08de367d73fe
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Q2FKNVdIOE5temdEd2tyQzRCdlhBU1BkWC8yMnN3TkpFWDB6Uk9lRkd2dU1R?=
 =?utf-8?B?MmlYY2xKV2FmbW96WDY1cTg0UTNhQUJWZjZoZVIvc0doZnM5elB5VFNBNWFE?=
 =?utf-8?B?RWRwcVM1OEJ1V0hHZk5sRHZ0YnZsS1E1cGZWcHc4MkRKb1lhMGxUMlg0TEJk?=
 =?utf-8?B?d3JqTWVZNGtYd3ZSM1Bjb0lWNVJGVE5iaU4vZldqRXBXRkd6MWlnck5FRmdF?=
 =?utf-8?B?dmRxZEIvcGdQa0g2VENFNysrd0tJbjM2bjFSWVhPSmdXY2w1K2lvYjRhcmFx?=
 =?utf-8?B?L1J5dnFOMXlLTld1bjJhUEovMjlpR2NvdTlRWXhDWE95VjNjQXlvY0QvMGpW?=
 =?utf-8?B?YzkzSnJReCtxYXRjbHduRVQ5OGt3NGROcklJTVp3NStJOEdOeGlHT3I3RWll?=
 =?utf-8?B?NDhSTmJndFdqVTl1cVc0c0JYUkEzK2RXK0hKVVl0blhQYjlxeWVnZk5YTUl4?=
 =?utf-8?B?dzBqaklVV0F3RnZEU1cwMnk3NHEzZ0tlWElBeE1ydUNpcGdzWmR6U1p2eWRq?=
 =?utf-8?B?cmY5MUdEejdqRUdRblduOUhlWFVoRERFc2xWOTRmMVRZVjRQLzR5enR6dEhI?=
 =?utf-8?B?MHlkUmk1TkVCenBoTzNHQ3RWN2dsbEFOdVM3dWxvQmIwT0RnYTY4QU9tTWVm?=
 =?utf-8?B?TVpOVk02VWNlTFlCS2hBVzFIdVUxc0hodlVDdjU3MmxvMjNEaHF0Q055bkFR?=
 =?utf-8?B?NG5LVVJMdDFwRmYvUzNxM01RS1gyeURqYjQ0QXRnbU91eGRBZGRhbzFsZTEw?=
 =?utf-8?B?Mm5FZktzZUZHU3RHYmo5WnVjMzJHNlZxckJXb0Z2dysreGNsS1BqWnRCNExw?=
 =?utf-8?B?MEY4QzFyMDd2YzFqcUM1L2lya0hkQ0oxUGFkc3FLR1I4Z1Z6REc3NFliTm9x?=
 =?utf-8?B?QlBZdTFXNFIrVDdnS2dnVjJBVjJUaG4yeVJHSUwrUk9kbXBBc09Qd3FvaFZS?=
 =?utf-8?B?akoyWkcrMDY0cUh6RHVIT1VNMDRBK0F0RmtlZy9rdTdEbnZVUEtPMHM3d1By?=
 =?utf-8?B?amd0aERpM0lHYWJIRGQrWndScWQ0MCtsQ0FJMkxFbVNXQkc4S1RWdTZyWjU1?=
 =?utf-8?B?MXBrRjl1aW13cUpHaVY1Z1g1ZDZ6Ync3cW5JREl1cHBSOC9waVdzWGUxbFd0?=
 =?utf-8?B?V1gwUnVzb3lmTjFZU1R0ejZKK2h5WkxCSlNBcGYzalhxMWU3aWRJZHdBdHgy?=
 =?utf-8?B?Z2FpN3M1Q0R2K2ZrTEVqVzRRNkdkdndKb1lpcFd5b3ZTTndFVlZHZDMwZytp?=
 =?utf-8?B?VzZpN1Vza3dxT0owb1phQVBJaGlnd0dpbVFRenViZldPYXZYZ3gvam1ZU1ZJ?=
 =?utf-8?B?ZEJINVlySkNRREtqbTM2SnV4T3hleVRkcEZoOUZ6S3ptbFhqTHdONEN2ZXlv?=
 =?utf-8?B?ckZkRmV3ZmpiZHFLZTBtZkxOK09tNXlJWEwydHJwSlp4ZXcweHRsa1JnaWdK?=
 =?utf-8?B?SHBiQlJMZkdjYXRTc2tETEQ5WXVjR0lUSGRnQTBZZWx2Nkt4N3NpaXVuWkYy?=
 =?utf-8?B?cmVSR1lEbk5qcDJLZ0VDRERjNitvQmNVb2ZtOWVWV1FKNUNINVN1WkllL2Ns?=
 =?utf-8?B?Vng2bll0VXA4bnQ5NzlZSk1XQy9PZ0s2WEx2NVRpYngzNXo4VzdWLzZRWEIv?=
 =?utf-8?B?S3g1NlFLWWJ6SnZvTlNCSGE3V3JDN3VLNWd4OS9nekFSMHVTdFRnTHNHTVBm?=
 =?utf-8?B?c0wrK2swZjB5WE9YcnljdDZPdkNkeDd2WlUyYXZQd09sWFBNd0JlczhOMEJv?=
 =?utf-8?B?SGVqMlc5WEIvN1B3d3pCNnE0Rmk4eURJVFlUNkdZRUxSNys5NlFZcS9NalBE?=
 =?utf-8?B?TmNDZ3ZPT0NpVlV6NVVEcTYrT0VzT1FFVHpEaHNCYitqZWpmR0VPU3FLOG9x?=
 =?utf-8?B?TzVpSzg3T08wQkVKcEpwRTgwM3JpaVJGMnE1Zm1CNHVieGtJdHNIbGhMc2lI?=
 =?utf-8?Q?oyX0MdpPDrIYcR6mQB7GgFAW/is+dGkI?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8610
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6d0764b7-8c68-46cb-80e2-08de367d4ea4
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|82310400026|1800799024|36860700013|35042699022|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjU4LzlmU1JpdnlFTm41SnhPcnY5c2twQXVpNTdSa2FMbGVBT09QeWhiVkZa?=
 =?utf-8?B?bU94dk9lajhGVjZiQTdRamxuc0VycDdzYlpzQ3FGVElxdzZJZVkwaEJVSlJB?=
 =?utf-8?B?OFF6bXI4Z0Y0UnFkN1V4VHNYdmRDU3RJYy9lb2RsQnJEUW1KRDFqQ04zMWJw?=
 =?utf-8?B?a3pVUzc0K3hOOFBmU1NHTHVscDdiZDd3WlFKQmx3eGRsVyt2TkNJN2dsYXI3?=
 =?utf-8?B?Y2VsdlhRN1FORnlhd2ltWnZMd3RXZ21WSk5SSUVFT1Q3b2pXV3dGeC9TeGt1?=
 =?utf-8?B?R2F1djd0V2ZaS1BDOHVmTWRzN1dkMjMxWFN3OU5qaFNJd2E1aXlYMk5GWVdQ?=
 =?utf-8?B?SGY0MlpmVGJkSi8xMmloY0R1SFRKN3hqTzV6NmFUUWt3WVpZY1RJYmdTWnUw?=
 =?utf-8?B?ZjI0VnFiME1Ia2ZvSU85UmY3Qm5QRmdqNzNHZjI0VXo2aHFPSmtnbis2dzYv?=
 =?utf-8?B?c25uK3QrWVBxZkZTUjdrRCtaY3Vtbzl1V2xMbjUrdE5wT3UrK1I4ZEU2NVBk?=
 =?utf-8?B?dGxqbzVmQVFWVmhDNVhKc2FoK3FiQ1RHVFpuenlwM0N5amMrV1ZKeVBjcENL?=
 =?utf-8?B?bHVlcWtIV1lmaTRXaHhpd3RMc25NR1ZSTDRpcHhRL0tPTGVwTmh4ZkZRWVNu?=
 =?utf-8?B?Vzl6NlhiMkd3NGUxbHZtczR2b3pOUURvdVdFMng0RUxIL1YvdkZlakhSUnZF?=
 =?utf-8?B?SlI0UnlDQnhpZm52K3J3RUlNSGVpZVQxSDlEWDI1SUl5dEd4Wk0vMmRrZ25m?=
 =?utf-8?B?S3BFOVA0c2o5RC9BREVRaTRPWkVLSXk1dDJ2Q21CZXJvTExLMzR2Q1o3Z1pV?=
 =?utf-8?B?cjJXMXFWZFFpSUhOcDQ2WjV0WGM4SWpSVVBSbktpR0dZZHpKRi94cmVNNTkw?=
 =?utf-8?B?N1QrdmIvWnhJc0pCek91eHVFeC9Gb3diVEtvK0cyVEhDSkZlNVhaMW43amh5?=
 =?utf-8?B?ZjN5TXY1V1BLZDBiaU5ySXBIT01aTjdWa2lZeGVYUWlDUDlhSkZrUEhrWmFG?=
 =?utf-8?B?VnRiQkR4YWM4dHB1dlFhVmNPdWxKdXBNYzQrVU9DQzVaRmQ5TkkrRVhBOEhy?=
 =?utf-8?B?c3AvL1d5Qld6OUcxY3RjM2w5aUpBRDVLc3FJRHE4by9SWmpoU0JFZ3FuNWNs?=
 =?utf-8?B?YzJyc2RkWUYvbG5pSEtIdnFQRDV2UnpVMHN3MHhqRTF6Smp6S0dtdmdOUGZv?=
 =?utf-8?B?Z2F5RFdjVnAzS0dRWkl0QUlucVVWR2hOQ3dTWHo2d2tsbTI1LzJIS0dscVNk?=
 =?utf-8?B?VmdVZE5HWFZMNC9oQlQyL0xkcVI1dzFtWjZFN0JKMXNzWU1DZXhUOUJ3dkd5?=
 =?utf-8?B?cXJ2cmF6UXlxRFpvMFhUdXowWUtOVG4wbzF3U3BZbUloRUNmUW1wanhlL1hP?=
 =?utf-8?B?THhrWUVzSjBhMDcvYzU0UjVZeVVQYU1GeERiUWxWTXpsODJaaW9YSUcvRGpV?=
 =?utf-8?B?U1lNUk9ablAzMGNMV2xXWCtQY0w2eXpEbVJiOVRJZUxyaU5EWmFySU1qanVK?=
 =?utf-8?B?M0M1c2xCQ0ZwL1R6RytncWJnTHhndHlEdE9vQUtBSDl2bk53Q3lFY29pR2dy?=
 =?utf-8?B?ZUd4TWpTTW5qMCtiekErOWZwNkNRcW04WTVwcTdYWDJzNkdoMnA2dzBqcWhQ?=
 =?utf-8?B?UndlVUFHR3RQQXlycHpGR1lSNE5XUUxMeUVpaGR5cGdia04yUGFpVlZFdCtj?=
 =?utf-8?B?ZU9pRWxkRlBZeVpxMzRkQ0pCNHhiUkpUYmtSWHlYd1hZc011ZmpiRFNFQlFs?=
 =?utf-8?B?L0FhWVZLNEM4SEVMZXMyZFordzdQOG5udENiYzY1UGNRdk45OXpCTE45ZU0y?=
 =?utf-8?B?ZmNOdnFyaXJoZ3RKeEtPT0xqWmpjeE8wRUQvUXBZanNCellXc1RpYjFhbjdQ?=
 =?utf-8?B?TnNlNTRtb01NUWdiUVcwSE9JbGs5b3p5TmZRRUloa0xzc25RdkFqaXRLUWxR?=
 =?utf-8?B?UzJ6ZWI2dElDNk9oWFJua2pwdGYrUlNyaDJiTEhURDZNWUsxMDRwbnIzdm9L?=
 =?utf-8?B?bTBaZUw4QnlYd05nMEowVUoyRDgwbEt3RGpxWTZwNm1LVk1hZ3FobHNqb3FO?=
 =?utf-8?B?Yzc4THF0ejM1QU9WYUh3YTZrdzdaNXdQNEZMbjdlSjUwdTdleXIwWEdobFRk?=
 =?utf-8?Q?YvTc=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(82310400026)(1800799024)(36860700013)(35042699022)(376014)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 17:15:57.6752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eae27d87-a142-4d7a-1654-08de367d73fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10962
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

On 03/12/2025 13:56, Nicolas Frattaroli wrote:
> Mali GPUs have three registers that indicate which parts of the hardware
> are powered and active at any moment. These take the form of bitmaps. In
> the case of SHADER_PWRACTIVE for example, a high bit indicates that the
> shader core corresponding to that bit index is active. These bitmaps
> aren't solely contiguous bits, as it's common to have holes in the
> sequence of shader core indices, and the actual set of which cores are
> present is defined by the "shader present" register.
> 
> When the GPU finishes a power state transition, it fires a
> GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
> received, the PWRACTIVE registers will likely contain interesting new
> information.
> 
> This is not to be confused with the PWR_IRQ_POWER_CHANGED_ALL interrupt,
> which is something related to Mali v14+'s power control logic. The
> PWRACTIVE registers and corresponding interrupts are already available
> in v9 and onwards.
> 
> Expose this as a tracepoint to userspace. This allows users to debug
> various scenarios and gather interesting information, such as: knowing
> how much hardware is lit up at any given time, correlating graphics
> corruption with a specific active shader core, measuring when hardware
> is allowed to go to an inactive state again, and so on.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  1 +
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  9 ++++++++
>  drivers/gpu/drm/panthor/panthor_trace.h  | 38 ++++++++++++++++++++++++++++++++
>  3 files changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index e133b1e0ad6d..a3cb934104b8 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -548,6 +548,7 @@ int panthor_device_resume(struct device *dev)
>  			    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
>  	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_ACTIVE);
>  	mutex_unlock(&ptdev->pm.mmio_lock);
> +
>  	return 0;
>  
>  err_suspend_devfreq:
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 9cb5dee93212..8830aa9a5c4b 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -22,6 +22,9 @@
>  #include "panthor_hw.h"
>  #include "panthor_regs.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include "panthor_trace.h"
> +
>  /**
>   * struct panthor_gpu - GPU block management data.
>   */
> @@ -46,6 +49,7 @@ struct panthor_gpu {
>  	(GPU_IRQ_FAULT | \
>  	 GPU_IRQ_PROTM_FAULT | \
>  	 GPU_IRQ_RESET_COMPLETED | \
> +	 GPU_IRQ_POWER_CHANGED_ALL | \
>  	 GPU_IRQ_CLEAN_CACHES_COMPLETED)
>  
>  static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
> @@ -97,6 +101,11 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
>  		wake_up_all(&ptdev->gpu->reqs_acked);
>  	}
>  	spin_unlock(&ptdev->gpu->reqs_lock);
> +
> +	if (status & GPU_IRQ_POWER_CHANGED_ALL)
> +		trace_gpu_power_active(gpu_read64(ptdev, SHADER_PWRACTIVE),
> +				       gpu_read64(ptdev, TILER_PWRACTIVE),
> +				       gpu_read64(ptdev, L2_PWRACTIVE));
>  }
>  PANTHOR_IRQ_HANDLER(gpu, GPU, panthor_gpu_irq_handler);
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_trace.h b/drivers/gpu/drm/panthor/panthor_trace.h
> new file mode 100644
> index 000000000000..01013f81e68a
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_trace.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2025 Collabora ltd. */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM panthor
> +
> +#if !defined(__PANTHOR_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
> +#define __PANTHOR_TRACE_H__
> +
> +#include <linux/tracepoint.h>
> +#include <linux/types.h>
> +
> +TRACE_EVENT(gpu_power_active,
> +	TP_PROTO(u64 shader_bitmap, u64 tiler_bitmap, u64 l2_bitmap),

nit: if you want to add tracing can we also add the device name as
well? Something like:

  TP_PROTO(struct device *dev, ...),
  TP_ARGS(dev, ...),
  TP_STRUCT__ENTRY(
          __string(dev_name, dev_name(dev))
          ...
  ).
  ...

This will help differentiate the device it is originating from in
a multi GPU situation.

Kind regards,
Karunika

> +	TP_ARGS(shader_bitmap, tiler_bitmap, l2_bitmap),
> +	TP_STRUCT__entry(
> +		__field(u64, shader_bitmap)
> +		__field(u64, tiler_bitmap)
> +		__field(u64, l2_bitmap)
> +	),
> +	TP_fast_assign(
> +		__entry->shader_bitmap	= shader_bitmap;
> +		__entry->tiler_bitmap	= tiler_bitmap;
> +		__entry->l2_bitmap	= l2_bitmap;
> +	),
> +	TP_printk("shader_bitmap=0x%llx tiler_bitmap=0x%llx l2_bitmap=0x%llx",
> +		  __entry->shader_bitmap, __entry->tiler_bitmap, __entry->l2_bitmap
> +	)
> +);
> +
> +#endif /* __PANTHOR_TRACE_H__ */
> +
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE panthor_trace
> +
> +#include <trace/define_trace.h>
> 


