Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNZhL5u0cGndZAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 12:12:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1276255C53
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 12:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A017510E755;
	Wed, 21 Jan 2026 11:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="nv30+p5w";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nv30+p5w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013002.outbound.protection.outlook.com [52.101.72.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A462B10E1C6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 11:12:21 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WG8vqiX6zkwuRK6RVOb44m/d3HfZ2MNG/RAPqmOpA51+5h5pat+V9zGJvUjjEI66Dh4kv/jSXVliLEImdRvzhbbvKrSa55KkOvLTtSAAp4Dp7g7h3Q8zdL5b0pBoHPpiskq2pagCDUbxcCPJaZu7IbGrFqPpgwmFMHqsyQDuSYlCC4YsZvYCTFX3sK7OfdJd9WSBAfZWeRlRODgW1DNCmYCmPph8tjAy7Q70tg0wD4dUU92aX6qUI8y76B4HJp8fnDPwAEv47SPT0F4xONkNmQc+0PjL+LgKL7tyx26XBHSecJok0+0yoH/ua3MITELssR5OGuB7DHfsWR2WGA/bMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sO3wmF6ONBXBei5ym3T4J1wjbvU9emWP6jlXLXRcWk=;
 b=Pwz04oLer/L/67ANBrC06y4kpewXEAKYlPBJ1PxiQh+dI+QnDZto8ham8i3S5s9wqnrWMwnMqApX1Om6OWaKXr0rERF1TkSVGGY0Fmq0PUPeEeScgH0/79j0DaH4MJeOyB4V1GGXWw1aqoL//dBSd/4LSC7fTyYBMSXzgf+zotQR4VUaiK8kr/o68rquy7UF6++YRE0ifB9N2upSVnJFpy2f/gPi2dNlKhp2wI9+3w/YefnVWgV/YF4kdCRqBybYWqaw6hpMxoVfr2c15sscN4FDoS0ctt5NpnhBEz7qElkx+oRMM84ulvP1Q4WFRr95/eLmgKsQpbaDVINVg7fMsg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sO3wmF6ONBXBei5ym3T4J1wjbvU9emWP6jlXLXRcWk=;
 b=nv30+p5wF0JANLG4ZX5+yvTOhjkTdsceZBgzlzDqSDqY5NCjTTOjIgip9ZiaihN5ZOc8CJgtNK7N1M7dCn4jU03ObvLAV60xuyNEC3VjC493DHEC7oM9ms8/Vcg4wE/tAlvpvL/d4bJ5BsschdWm8dGI4s8zLdc0fSoWqFjhHZs=
Received: from DUZP191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::14)
 by VI1PR08MB10300.eurprd08.prod.outlook.com (2603:10a6:800:1bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 11:12:07 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::7f) by DUZP191CA0015.outlook.office365.com
 (2603:10a6:10:4f9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 11:12:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via
 Frontend Transport; Wed, 21 Jan 2026 11:12:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asvdo2gEtnFmzva+LW7aSMncdUjMSgLgqL/av5ODqlNQcHl3AzoPOjbMLL58BtJl/F2LRTzhyWQ31CP46zjJKNFhuAw/OdOFJS//4Ctrg1kJd1JCNy4lYJkRR/caEUhXHRKKxpK17OxvlYR+OWLsT5DCJdFW1mHjLjvxeo5d5b/MYz7bV+Rslkd3wXI6++nJMRIE5C6ogNBrAwKs2Wq5QxjVPqvBtQa26yhUdRbldV8Va8yf1B2PpGEGyVfCCh534QcoqNKesoGQ8dF6axTfTVW25UoLXrMhitv24HwFxOWSPiw8GLfulsM4XU5sVc6VTmh9hNCrcGd7GKrvEG7zBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sO3wmF6ONBXBei5ym3T4J1wjbvU9emWP6jlXLXRcWk=;
 b=EzI0hJgSuaFck2vrHrBBhXu7QhwAHv17tmkTlemR9y1SgNhCD0727+ZbKs8fDxfnxu67UGkLmR9gl1z9MCQyB6yDjgZR/3jVwead3luA8VbJMkqML4BT/Yw1Z07PhJKkkzuBHEp4A2/eHvR7RX8nDU30G6q3m7do/KoQWV4yHuiTUquUHk4HGeVJ9415nci4VDWRnL1JVf5dJihOibBLUGrdgzrG2wOISbcMB6P9HD5G7Tfa6uiPPHBtzSDEhyRVG3ITzaNPQ4FnKTkM0stxbs0Fpy5IHCRWGU0ucCUfedamomZypZWJk7Ytm/6B2gUozfhdHfKXhvPD2w79roLnDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sO3wmF6ONBXBei5ym3T4J1wjbvU9emWP6jlXLXRcWk=;
 b=nv30+p5wF0JANLG4ZX5+yvTOhjkTdsceZBgzlzDqSDqY5NCjTTOjIgip9ZiaihN5ZOc8CJgtNK7N1M7dCn4jU03ObvLAV60xuyNEC3VjC493DHEC7oM9ms8/Vcg4wE/tAlvpvL/d4bJ5BsschdWm8dGI4s8zLdc0fSoWqFjhHZs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by AS2PR08MB10084.eurprd08.prod.outlook.com (2603:10a6:20b:648::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 11:11:03 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499%4]) with mapi id 15.20.9499.005; Wed, 21 Jan 2026
 11:11:03 +0000
Message-ID: <3171dfa9-94d4-4024-a1d4-035995d8c79d@arm.com>
Date: Wed, 21 Jan 2026 11:11:01 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/9] drm/panthor: Part ways with drm_gem_shmem_object
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com, nd@arm.com
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-6-boris.brezillon@collabora.com>
 <f55ecaa7-0695-4cdc-94f4-4769e1b72bb0@arm.com>
 <20260112151714.4461d045@fedora>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <20260112151714.4461d045@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0504.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::11) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|AS2PR08MB10084:EE_|DU2PEPF0001E9C6:EE_|VI1PR08MB10300:EE_
X-MS-Office365-Filtering-Correlation-Id: 438fd1f7-f4ba-42ca-856d-08de58ddea4e
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?RVcrYk9nd3pjMmxiQ1I0NE5LcE42V3lhT1NXenBHbk5PZ1U5ejVFUTg5d0ov?=
 =?utf-8?B?RVBlM2w1VnZlanoxNWJXUnFMVFJvOXBVUXJFN2RrdVo2Ym9XelJRakFSYVpP?=
 =?utf-8?B?bHoyQ1FYODgxL2hzdlcwVGlXQS85MmJWNTd3OVpNY3ZhWnVONThmK052bW5o?=
 =?utf-8?B?NGh3RG9hMitZRUxxTDhpRHVBaGtrcU9pMUR1cXdVNy9XdHNGR2JPTkd3alRL?=
 =?utf-8?B?SmFjNDdoanRvWDFkS2Ntb3UwVWFjVnRJRC9rZlI2MEJUK21QR3MwcWRROEQ4?=
 =?utf-8?B?WHc4OTU2TUtkSVN4aXA5Mms0ZUVJZlVTZ1ZNMENSYUxJQzBsYU83ZjRET0gx?=
 =?utf-8?B?YzNsM0xWOFF3d0ZtVlJpM1BjaWhGUHM1QnhpWHdiYTBCc1RJczB6SEtaTzFk?=
 =?utf-8?B?eno3YUtrd1JLN0ZOVm0xOTVhUFpaZmY5MEp0UnA0UjV2OUIwMGwyZnR6WUtw?=
 =?utf-8?B?ZGJRM1JReFFIUXhnSTY2U0dTMVBkOTQzRGlHYXZDVHJTYndOcDhvK1o1a1FT?=
 =?utf-8?B?N3dDL0hRN2VTaDZkOUtUckNrMXM0QU4vSEpjOVY5QS9LNGFuQnRWQy80MjNJ?=
 =?utf-8?B?aGwrejNrQmZOeS8wSnpNdUJ5ZUVialNaZnNQdkt6WEFvK2pYSC9jNXlhTW1w?=
 =?utf-8?B?b1VmRlR5d1RTR0JZdWNoZ2NtenEwbHI4b2tKZmNRT3RoNWZDWFlCMHlra0Mx?=
 =?utf-8?B?dXhVUDdDdW5rOFJwNUJZakpaQ1hxR0VLV3NZNHZzcnJSNWI4K1JDdTBnOTlE?=
 =?utf-8?B?azAxSjRXanRuU01GZGJBY0h4Ri93d0tRTjFOaU95UG05L2dhWWNUTXZqY0Zh?=
 =?utf-8?B?SjZFdnUyR1V3WmRUdzVmT2R1dFh4eGNyOWRCVGtoeWp1N2RvUmhxSjNrRGRM?=
 =?utf-8?B?Y2JUQ3A2bzJnckJFcE5qSWUwNFJoNGR2NWVrbGtsajd2V3VlVTA5VlR6b0E0?=
 =?utf-8?B?T0orMXBBczBBdlRMVWNRQmJENUlYSk5wME9UaWl0bTF0RjBpZGxKQ2Y0c1VL?=
 =?utf-8?B?c29sUHgwWERjYmxrQ2JMNHlSdVRkL2VsZ0lySFBycG45M3NHZSthajg1RG96?=
 =?utf-8?B?ekdKMm8yWi95YnBZcWtPS2FWR21ob0h4QTdYSzZEWnd6VDNCdzc4YkxPSGVL?=
 =?utf-8?B?REZLb28zWmpIcmJqbGdlaUpITzgvUlNZZk1rZVhUQVBaeUI1bFUwbzZCbFA3?=
 =?utf-8?B?Z0JSQVd6YUdjelBsTEZ1bmJtWTVMbzExd0J5dGIwNFNkTTFkd3ErN0JLbXRB?=
 =?utf-8?B?VWhFNktXL2RXWUM1c2Qra3F3bUphNlI5WnhIR203bVVHMHgrS1liREdIQXI0?=
 =?utf-8?B?K2RNdmtXVFBlVnVyTGZ1Ui9qdFRuUk9KUmh1Q2NIejFpQkJSNVF0OGJTUGhy?=
 =?utf-8?B?T0srR0lxMnowZ1ZJUVgzSmNhVWhBUDN6Y2poby9JMHRqRnk4NjBWdy9PV3ds?=
 =?utf-8?B?a1lPOUFIWEd4YkZ2RkdTVFBsUjVSWDJUdzhhWms1ajhyenMyRUZJV2hUSmxj?=
 =?utf-8?B?dkhwZGkzSE1FY2Q4c3B0dGxmUm51R0NmRWZVQVV4WGZqMEE0ckgyRTdLMVpN?=
 =?utf-8?B?bllEUHJxSFJZU2xSQUdQVXd6a0dlUTlZTzFBdi9Dc1M4cHl2ek9xZ04yMkVD?=
 =?utf-8?B?WVE1eGZZVHl2Y0k4NXJjODhxZEk4bXlMTXMwL2pmS2VsbmtPTEFVOTlxWVFL?=
 =?utf-8?B?ektsNGd3QUREOHBQV0N3WXBvSm04RkJjang4b2djN3VzSnNGUXk0T21HSEhY?=
 =?utf-8?B?NkY5VDhoNTY1cnlZQ0RIUWZpOWc5M0R3MGcyUzNDL0pvU1MwbENPSW5jV0Jp?=
 =?utf-8?B?aldmbTFaYXJLeUZDcWVWUnlRZzFJRkxjMHU0bUk0N0VRWkNwY3FQSFNVUyt3?=
 =?utf-8?B?L05BVUc2eGd4QUVIYm1ZRC9wUzExakJyNlNaNzJ2WVh0cmc5MFZLUjJ3SENF?=
 =?utf-8?B?eDIyRzRPbWdvM0ZYdkxvb2FnL1VsZC9FY2ZDMDZ1SjltdTV2YUEyY2REdDNa?=
 =?utf-8?B?dm9iakcvUUZ5QVEwT2llRlNiZzBHcjlQcjUxOWsvV2oyN3FxQTVnWk1xVnc4?=
 =?utf-8?B?MWtlek0xRkdKZnV1NyszL2hqUVhsUVVqcGlHaENJVlZDeHVQd1I3V2J3aVlx?=
 =?utf-8?Q?Ncp0=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10084
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 46a4d82e-4356-41b0-6d7c-08de58ddc3f0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|376014|82310400026|7416014|1800799024|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1d2dU5ReFljTkcra2dtdXoxcjlEZlNDdndIQjlCQjhiRFB6bTYxWWwvK3Rt?=
 =?utf-8?B?bkhsVUVna3pNbXlLTFhvcHVXMHlmUE16emMzZjRvVG83RTJUblpuT1dkQXpm?=
 =?utf-8?B?cnhPNmNCWHUwbkhvYi9VYlVXUzNpdkVwR2IwNmE3S3NpUHBMQzhhbVF0aUtK?=
 =?utf-8?B?SEtTTW1sQUJIcFlnUnpxNUVPYmhtd2w2OWhiOXB4R1ZHYWNTaHdFV1Y2VVQy?=
 =?utf-8?B?U1BCUi85RTd3S3AwcXcvWXE1T0xCSytTNERxMmR0QzZicGd5bU5aaW05emJn?=
 =?utf-8?B?ZDlpRDlXVnkrVml4RURJMWRDRi82eXlNWEJuRjBNcjFFTkxndTZmajdFVVA1?=
 =?utf-8?B?MXY2SmxaaG9oc1lLZWJia2dkakVMc1NnQThzU0J0UlRhNm4rbE9lK2hRWStS?=
 =?utf-8?B?Z1hvS2p1dlJQR1EvSWs4d2FIc3A2dTUvOG85M2Q3cVhzRjFFU21YZjRKUytp?=
 =?utf-8?B?N2VYazdVZXFsYVg1R0RQUXdKRUt5ZDY5QVNDV2RQSDZnaU9Oajl1Y0hBQXlD?=
 =?utf-8?B?RkluY1c1QWl5djNGeC83QkdvNmR4bmt2bzFBalVveExSakcwU3JSUno0NUZh?=
 =?utf-8?B?ejl1Tk5CaEhTRE1oQnB3YlhvaTBDbVJITU5pckUzV0NZTVZEZnd0NzEzSnNW?=
 =?utf-8?B?WkFzSUp3UVVPRVlYWUVKNExwc1orVTZnbTFsdjJUK1NXd29zU1UrNjNwQktC?=
 =?utf-8?B?Z3VoY2NLNlF3MXdOekVaRHhYVkR2MVdCM21Mb1Qwa0FVNW9xZ3I5all6TW80?=
 =?utf-8?B?M3EyVkQ3WXFwWmRWbjRQSG9zbWhKRjRiOW9MZWtYcVV6MUFPOFI0aHFUTXBm?=
 =?utf-8?B?dTZpckFldXo5M016VGZrR01aVXFhRnJ1YklHcnRIdGM5UUxPNWNGQkVPNk1m?=
 =?utf-8?B?NWNXVTBObWpTU1V5dTZxbDVvYUMzVkNMd1BXWVNuanJWTXpBWkFBMEtUWkNu?=
 =?utf-8?B?emNTY1Azd0U5dUcybkhETzAzM3BWNmVhVloxU29lTHRZQ3FEdC9WQUhraWdJ?=
 =?utf-8?B?dTFjdjlKMlpOOUl3czByRmNuV2Rad29SVjdvUHNxN0x4eEtIZjRrWkhRemt3?=
 =?utf-8?B?dm5HUEY3RG1QOHFXTWx1MmRpOXI1RVU0eDlJSmpCNnJtalBvWkNBbFd4OU5K?=
 =?utf-8?B?eGlWNTZFOWdiMWZmYnVjbXlReGRBeEN5ck9WWHdoYmRkd0h4QStZMXYwRGdT?=
 =?utf-8?B?a2ozUFVQYVZOckdBOG5TUjgwb1hGVTJ5VWF2bm5vdTI2ZDZjeWxGa0V0RUhD?=
 =?utf-8?B?NEZJRnN6L2JyejduTjRXa2gvTUkvL1l0b1Fta2NkcWhoZS92c3BCZmhkZDZ2?=
 =?utf-8?B?dFVaeCtXa2tLeEhiUlRIZzZLRFgvZzRBWlY1M0NIbzFYeFlaZDhsUS9FYmtS?=
 =?utf-8?B?NDlhYTIwYkU3N1RzTUU5V3FGRlp3bjJBR0xESjFxTHhTVW1INWRHeUFKN3kr?=
 =?utf-8?B?T1B5VEgvZWpzanVhUGdPVko4eDhLQSt5YWswTzlDai9sOG1OYWVPTTF4ekxr?=
 =?utf-8?B?aEkrWFlQUnhKZk1CaWFRZkpmUGJCNE9BM2VwU1NLUEhyRC9XRnc1dEJhNWxq?=
 =?utf-8?B?VmhmaDlMMmtnU3c3aytZcGdFU1ZFUFFDRjhFK1JWN0t4bWZ5cXhmNEY3eFQ5?=
 =?utf-8?B?RW1GV3JpUHg1VElaWlNRS3Q0MTVYZEd1OVBwQkpJV3Y0Q3NVL1pXNllGNGNp?=
 =?utf-8?B?cE1tWnhYLzA2USs4bm85NnlSY3d6R3RMYlh2eFhSbGozb2FMdkNlNFRwNXU2?=
 =?utf-8?B?SkZQUWx3R2ZUaHNhWTJVaER5NGtZYmt6K1YyQXhZekppK1kwd1BqK2YzNDFG?=
 =?utf-8?B?MjJsOHNlb1Z2MU1NS2xoaGl4VUVzUzZMcHJGRGpBTnlwd0tSbGRJS3pjQzR3?=
 =?utf-8?B?UjJ3aEt6ZnorYUxXb3dqd1JBTzgyTUcvVS9IQlNNVVY2TkMwYTR0blI3RDk1?=
 =?utf-8?B?Ky9RRjA1SHpIRGlBa2VHYUVrdWcxZG12eWh3REVqWUpCSzFHaUo3ZmYvaStD?=
 =?utf-8?B?TVJBcVppcDJ0YjNHU29xZkgrd1BDWFdGelc2aExaTEVxWHlEMnZ4L1BDbTZh?=
 =?utf-8?B?QlNiTGR0R2t3V1lhbG1UblhKKzZTZDNyOWhhM0lEKzBPN0FxbGJpcUxRN3E5?=
 =?utf-8?B?NzR6L203YzN3Mmh6aC9Yd3RPRVpNMDFOYVVqbFJQQnduVVF0b2J5RmllRkdv?=
 =?utf-8?B?ZEVkSERyb1lSV0NOeDlYdzZQM3ZrRUdjcTROdkRpUDFjT1FGMGhDM0VWemta?=
 =?utf-8?B?Rm9ublc0RC9pTGo4NkJCTG1HcE9BPT0=?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(376014)(82310400026)(7416014)(1800799024)(35042699022)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 11:12:07.4109 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 438fd1f7-f4ba-42ca-856d-08de58ddea4e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10300
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,m:nd@arm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[akash.goel@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,intel.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,arm.com:email,arm.com:dkim,arm.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akash.goel@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1276255C53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Boris, Steve


On 1/12/26 14:17, Boris Brezillon wrote:
> On Mon, 12 Jan 2026 12:06:17 +0000
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 09/01/2026 13:07, Boris Brezillon wrote:
>>> While drm_gem_shmem_object does most of the job we need it to do, the
>>> way sub-resources (pages, sgt, vmap) are handled and their lifetimes
>>> gets in the way of BO reclaim. There has been attempts to address
>>> that [1], but in the meantime, new gem_shmem users were introduced
>>> (accel drivers), and some of them manually free some of these resources.
>>> This makes things harder to control/sanitize/validate.
>>>
>>> Thomas Zimmerman is not a huge fan of enforcing lifetimes of sub-resources
>>> and forcing gem_shmem users to go through new gem_shmem helpers when they
>>> need manual control of some sort, and I believe this is a dead end if
>>> we don't force users to follow some stricter rules through carefully
>>> designed helpers, because there will always be one user doing crazy things
>>> with gem_shmem_object internals, which ends up tripping out the common
>>> helpers when they are called.
>>>
>>> The consensus we reached was that we would be better off forking
>>> gem_shmem in panthor. So here we are, parting ways with gem_shmem. The
>>> current transition tries to minimize the changes, but there are still
>>> some aspects that are different, the main one being that we no longer
>>> have a pages_use_count, and pages stays around until the GEM object is
>>> destroyed (or when evicted once we've added a shrinker). The sgt also
>>> no longer retains pages. This is losely based on how msm does things by
>>> the way.
>>
>>  From a reviewing perspective it's a little tricky trying to match up the
>> implementation to shmem because of these changes. I don't know how
>> difficult it would be to split the changes to a patch which literally
>> copies (with renames) from shmem, followed by simplifying out the parts
>> we don't want.
> 
> It's a bit annoying as the new implementation is not based on shmem at
> all, but if you think it helps the review, I can try what you're
> suggesting. I mean, I'm not convinced it will be significantly easier
> to review with this extra step, since the new logic is different enough
> (especially when it comes to resource refcounting) that it needs a
> careful review anyway (which you started doing here).
> 
>>
>> Of course the main issue is going to be getting some proper testing of
>> this (especially with the shrinker added).
> 
> For the shrinker, the best I can propose for now is extending the
> IGT tests I've added. For close-to-real-usecases testing of the shmem ->
> custom transition (this commit), making sure the g610 jobs we have in
> mesa CI still passes is a start. If you have other ideas, I'd be happy
> to give them a try.
> 
>>
>>>
>>> If there's any interest in sharing code (probably with msm, since the
>>> panthor shrinker is going to be losely based on the msm implementation),
>>> we can always change gears and do that once we have everything
>>> working/merged.
>>>
>>> [1]https://patchwork.kernel.org/project/dri-devel/patch/20240105184624.508603-1-dmitry.osipenko@collabora.com/
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>   drivers/gpu/drm/panthor/Kconfig         |   1 -
>>>   drivers/gpu/drm/panthor/panthor_drv.c   |   7 +-
>>>   drivers/gpu/drm/panthor/panthor_fw.c    |  16 +-
>>>   drivers/gpu/drm/panthor/panthor_gem.c   | 696 ++++++++++++++++++++----
>>>   drivers/gpu/drm/panthor/panthor_gem.h   |  62 ++-
>>>   drivers/gpu/drm/panthor/panthor_mmu.c   |  49 +-
>>>   drivers/gpu/drm/panthor/panthor_sched.c |   9 +-
>>>   7 files changed, 666 insertions(+), 174 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
>>> index 55b40ad07f3b..911e7f4810c3 100644
>>> --- a/drivers/gpu/drm/panthor/Kconfig
>>> +++ b/drivers/gpu/drm/panthor/Kconfig
>>> @@ -8,7 +8,6 @@ config DRM_PANTHOR
>>>   	depends on MMU
>>>   	select DEVFREQ_GOV_SIMPLE_ONDEMAND
>>>   	select DRM_EXEC
>>> -	select DRM_GEM_SHMEM_HELPER
>>>   	select DRM_GPUVM
>>>   	select DRM_SCHED
>>>   	select IOMMU_IO_PGTABLE_LPAE
>>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>>> index 52c27a60c84a..90e9abc22d9e 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>>> @@ -19,6 +19,7 @@
>>>   #include <drm/drm_debugfs.h>
>>>   #include <drm/drm_drv.h>
>>>   #include <drm/drm_exec.h>
>>> +#include <drm/drm_file.h>
>>>   #include <drm/drm_ioctl.h>
>>>   #include <drm/drm_print.h>
>>>   #include <drm/drm_syncobj.h>
>>> @@ -1457,7 +1458,7 @@ static int panthor_ioctl_bo_query_info(struct drm_device *ddev, void *data,
>>>   	args->create_flags = bo->flags;
>>>   
>>>   	args->extra_flags = 0;
>>> -	if (drm_gem_is_imported(&bo->base.base))
>>> +	if (drm_gem_is_imported(&bo->base))
>>>   		args->extra_flags |= DRM_PANTHOR_BO_IS_IMPORTED;
>>>   
>>>   	drm_gem_object_put(obj);
>>> @@ -1671,8 +1672,7 @@ static const struct drm_driver panthor_drm_driver = {
>>>   	.major = 1,
>>>   	.minor = 7,
>>>   
>>> -	.gem_create_object = panthor_gem_create_object,
>>> -	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
>>> +	.gem_prime_import_sg_table = panthor_gem_prime_import_sg_table,
>>>   	.gem_prime_import = panthor_gem_prime_import,
>>>   #ifdef CONFIG_DEBUG_FS
>>>   	.debugfs_init = panthor_debugfs_init,
>>> @@ -1822,3 +1822,4 @@ module_exit(panthor_exit);
>>>   MODULE_AUTHOR("Panthor Project Developers");
>>>   MODULE_DESCRIPTION("Panthor DRM Driver");
>>>   MODULE_LICENSE("Dual MIT/GPL");
>>> +MODULE_IMPORT_NS("DMA_BUF");
>>> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
>>> index a64ec8756bed..f135cf2130b8 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_fw.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
>>> @@ -627,7 +627,6 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>>>   		u32 cache_mode = hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_MASK;
>>>   		struct panthor_gem_object *bo;
>>>   		u32 vm_map_flags = 0;
>>> -		struct sg_table *sgt;
>>>   		u64 va = hdr.va.start;
>>>   
>>>   		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_WR))
>>> @@ -665,11 +664,12 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>>>   		panthor_fw_init_section_mem(ptdev, section);
>>>   
>>>   		bo = to_panthor_bo(section->mem->obj);
>>> -		sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
>>> -		if (IS_ERR(sgt))
>>> -			return PTR_ERR(sgt);
>>>   
>>> -		dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
>>> +		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
>>> +		if (drm_WARN_ON_ONCE(&ptdev->base, !bo->dmap.sgt))
>>> +			return -EINVAL;
>>> +
>>> +		dma_sync_sgtable_for_device(ptdev->base.dev, bo->dmap.sgt, DMA_TO_DEVICE);
>>>   	}
>>>   
>>>   	if (hdr.va.start == CSF_MCU_SHARED_REGION_START)
>>> @@ -729,8 +729,10 @@ panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
>>>   			continue;
>>>   
>>>   		panthor_fw_init_section_mem(ptdev, section);
>>> -		sgt = drm_gem_shmem_get_pages_sgt(&to_panthor_bo(section->mem->obj)->base);
>>> -		if (!drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(sgt)))
>>> +
>>> +		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
>>> +		sgt = to_panthor_bo(section->mem->obj)->dmap.sgt;
>>> +		if (!drm_WARN_ON_ONCE(&ptdev->base, !sgt))
>>>   			dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
>>>   	}
>>>   }
>>> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
>>> index 4b3d82f001d8..0e52c7a07c87 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_gem.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
>>> @@ -8,9 +8,11 @@
>>>   #include <linux/dma-mapping.h>
>>>   #include <linux/err.h>
>>>   #include <linux/slab.h>
>>> +#include <linux/vmalloc.h>
>>>   
>>>   #include <drm/drm_debugfs.h>
>>>   #include <drm/drm_file.h>
>>> +#include <drm/drm_prime.h>
>>>   #include <drm/drm_print.h>
>>>   #include <drm/panthor_drm.h>
>>>   
>>> @@ -44,7 +46,7 @@ static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
>>>   
>>>   static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
>>>   {
>>> -	struct panthor_device *ptdev = container_of(bo->base.base.dev,
>>> +	struct panthor_device *ptdev = container_of(bo->base.dev,
>>>   						    struct panthor_device, base);
>>>   
>>>   	bo->debugfs.creator.tgid = current->group_leader->pid;
>>> @@ -57,7 +59,7 @@ static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
>>>   
>>>   static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
>>>   {
>>> -	struct panthor_device *ptdev = container_of(bo->base.base.dev,
>>> +	struct panthor_device *ptdev = container_of(bo->base.dev,
>>>   						    struct panthor_device, base);
>>>   
>>>   	if (list_empty(&bo->debugfs.node))
>>> @@ -80,9 +82,9 @@ static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
>>>   #endif
>>>   
>>>   static bool
>>> -should_map_wc(struct panthor_gem_object *bo, struct panthor_vm *exclusive_vm)
>>> +should_map_wc(struct panthor_gem_object *bo)
>>>   {
>>> -	struct panthor_device *ptdev = container_of(bo->base.base.dev, struct panthor_device, base);
>>> +	struct panthor_device *ptdev = container_of(bo->base.dev, struct panthor_device, base);
>>>   
>>>   	/* We can't do uncached mappings if the device is coherent,
>>>   	 * because the zeroing done by the shmem layer at page allocation
>>> @@ -112,6 +114,208 @@ should_map_wc(struct panthor_gem_object *bo, struct panthor_vm *exclusive_vm)
>>>   	return true;
>>>   }
>>>   
>>> +static void
>>> +panthor_gem_backing_cleanup(struct panthor_gem_object *bo)
>>> +{
>>> +	if (!bo->backing.pages)
>>> +		return;
>>> +
>>> +	drm_gem_put_pages(&bo->base, bo->backing.pages, true, false);
>>> +	bo->backing.pages = NULL;
>>> +}
>>> +
>>> +static int
>>> +panthor_gem_backing_get_pages_locked(struct panthor_gem_object *bo)
>>> +{
>>> +	dma_resv_assert_held(bo->base.resv);
>>> +
>>> +	if (bo->backing.pages)
>>> +		return 0;
>>> +
>>> +	bo->backing.pages = drm_gem_get_pages(&bo->base);
>>> +	if (IS_ERR(bo->backing.pages)) {
>>> +		drm_dbg_kms(bo->base.dev, "Failed to get pages (%pe)\n",
>>> +			    bo->backing.pages);
>>> +		return PTR_ERR(bo->backing.pages);
>>
>> This leaves bo->backing.pages set to the error value, which means a
>> future call to panthor_gem_backing_get_pages_locked() for the same
>> object will return success. Unless there's some 'poisoning' that I
>> haven't spotted this looks like a bug.
> 
> That's a bug, I'll fix it.
> 

I ran into this bug, during the stress testing, which resulted in a crash.


Unable to handle kernel paging request at virtual address fffffffffffffff4
KASAN: maybe wild-memory-access in range 
[0x0003ffffffffffa0-0x0003ffffffffffa7]
Mem abort info:
   ESR = 0x0000000096000006
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x06: level 2 translation fault
Data abort info:
   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000084026000
[fffffffffffffff4] pgd=0000000000000000, p4d=0000000088a6d403, 
pud=0000000088a6e403, pmd=0000000000000000
pc : nonblocking_page_setup+0x90/0x108 [panthor]
lr : nonblocking_page_setup+0x8c/0x108 [panthor]
sp : ffff80008bdd7a80
Call trace:
  nonblocking_page_setup+0x90/0x108 [panthor] (P)
  panthor_gem_fault+0x84/0x218 [panthor]
  __do_fault+0x78/0x3d0
  __handle_mm_fault+0xe20/0x23a0
  handle_mm_fault+0x10c/0x438
  do_page_fault+0x234/0x958
  do_translation_fault+0xa0/0xd8
  do_mem_abort+0x68/0x100
  el0_da+0x54/0x1d8
  el0t_64_sync_handler+0xd0/0xe8
  el0t_64_sync+0x198/0x1a0


First the call to panthor_gem_backing_get_pages_locked(), from 
blocking_page_setup(), failed due to low memory.

panthor_gem_fault() returned VM_FAULT_RETRY as mmap_lock_held was 0.

Then the crash happened inside nonblocking_page_setup() when
panthor_gem_fault() was called for the 2nd time.


Made the following change locally to avoid the issue.

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c 
b/drivers/gpu/drm/panthor/panthor_gem.c
index 6e91c5022d0d..b31a4606a8c6 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -234,7 +234,7 @@ panthor_gem_backing_get_pages_locked(struct 
panthor_gem_object *bo)
         if (IS_ERR(bo->backing.pages)) {
                 drm_dbg_kms(bo->base.dev, "Failed to get pages (%pe)\n",
                             bo->backing.pages);
-               return PTR_ERR(bo->backing.pages);
+               return PTR_ERR(xchg(&bo->backing.pages, NULL));
         }



Best regards
Akash

