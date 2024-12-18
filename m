Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1F9F6893
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 15:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E3310E1B6;
	Wed, 18 Dec 2024 14:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BzEZEd0K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9163610E1B6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 14:35:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lh3tI/jG79k7RaSSnx17JtxxkXJ3tGByhwnlrrV+//cePSQCCcerWwa8JpE6RVsL+Zszom6FDgf/nmCChkp0wyl0MLzoobEhZ6trN17sr4QFMxPbVstPEtGmgkqdsgeYUN72dBtWUcXAQWq9hRSVGoFcBk0kDpxAdhICkVSFktKxZCJpuZD9ikPwjKMiZXOBiYP+IJOG3T1HjdSEY7cHxLKmaZJSAgRuHAFrPhBg4o1MLAS/PM8VcpChnaEywJ8GhzvCRgLgPrKHpbUrfG8+cgFRjWPJZvCb+7bozY21IrgbPbZF1XdJmRFEkMZSCqTz9YBAnoGZxEkVxEd8JeZbOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d04tUj1fBaKPNxbCf7pqh9vZzyd7zG+CIcaOg5lUCRc=;
 b=TjU1KcViwpgoFqZCepxaI/0L75GdwmQYl+piq0S3RgQm/065x9z+mtRHfBL5npN/NKfg67di21I42ZdhWPq6pixOd17O+5521i+RKIiu7ubkWuARs4FUSnrR3N+lbckjjqqWPz0RYurKs5AfIqh4+jb90441OYHunZMv99ElWeli5x5B6amXK3e2FXRsbELFuJ6a+3qXv4c1/OFtlseiLtNZcdDLORPzaskVPtT0yi+1jBDQC1qYdv2nl2gkIfrBayKGv/2rCK6eQMnIutWJgMUkl6UEsBdJK6mNL9J2FxRSA9Wam994cUU7+YOIl8TSTpjO2HXRb7iFedQK8BMNOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d04tUj1fBaKPNxbCf7pqh9vZzyd7zG+CIcaOg5lUCRc=;
 b=BzEZEd0Kfpn6YaE0Na63jZSrs6cyb/b3Wq6YdkcHZxUzQQeK5ZHOuenPNdmeDKtTlD4n1JD8OnyunEZz9Eq5IIpEcooUW0tmYD2oEpYXaF4z4NCuEGiHBfsIgdkrxjDCKtgY+g57PgbaOcj/Dt1Q6B9pm3Z729/mXK8m3ElsPj8=
Received: from BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 by SJ2PR12MB8942.namprd12.prod.outlook.com (2603:10b6:a03:53b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 14:35:00 +0000
Received: from BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::fe76:56e0:4c10:9a3c]) by BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::fe76:56e0:4c10:9a3c%3]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 14:35:00 +0000
From: "Sagar, Vishal" <vishal.sagar@amd.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "Klymenko, Anatoliy"
 <Anatoliy.Klymenko@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "Simek, Michal" <michal.simek@amd.com>
Subject: RE: [PATCH 01/10] drm/fourcc: Add warning for bad bpp
Thread-Topic: [PATCH 01/10] drm/fourcc: Add warning for bad bpp
Thread-Index: AQHbRi9UWUUHhEgKcUWmCkWx6YjrqrLWRD9wgBW1C4CAAC1p4A==
Date: Wed, 18 Dec 2024 14:35:00 +0000
Message-ID: <BL1PR12MB596972D7D77F48C6BD91DFEA9C052@BL1PR12MB5969.namprd12.prod.outlook.com>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
 <20241204-xilinx-formats-v1-1-0bf2c5147db1@ideasonboard.com>
 <BL1PR12MB596954886CC5E28EC8E735BA9C372@BL1PR12MB5969.namprd12.prod.outlook.com>
 <02da12fe-4d94-4a40-86b6-6dad28588843@ideasonboard.com>
In-Reply-To: <02da12fe-4d94-4a40-86b6-6dad28588843@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=b4c9fbba-49d3-4d2c-ae1d-413594e26aa1;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-12-18T14:31:32Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5969:EE_|SJ2PR12MB8942:EE_
x-ms-office365-filtering-correlation-id: 1f3c0441-9f9f-47e7-9405-08dd1f712711
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QmE4K1hkNXFnaTNyODFPMVl2dEdrV1p5WXRNUm8wd1NiTDlXOEx3L09SYnVu?=
 =?utf-8?B?Z1pEbVc0Mk5YSVVKdTJsNnBtNlhFS3FaSGo3TlRKV2REaXNrYnVib2VlS1lM?=
 =?utf-8?B?MCtRbGN4Q0RkVzk3RGtCbzNNUzl4QTNPQW54ZHUvL3I0VjdlWENxbjJRUENo?=
 =?utf-8?B?TXJKRGZmNnVma2dXRkRFZmtmRWp1ZHo4UXdlL3RHZ3hNTUhtbmgreGR6ZkQ2?=
 =?utf-8?B?UytWOVhmSDVFY3ZjOGU3emJqVDJTNEZpSFRSS2NCNTE1VGgxRXhiWU8xeEdF?=
 =?utf-8?B?S2lVMmZCMHErUmttd2l2Vjk1Uzg3bGhPblJtN3hIRjlpaXZIdlJ6UVRWK1U0?=
 =?utf-8?B?RlNkckVwSUZya21nTE0rdHR6UHBRR05LNjc4eCs4MXJnMkE4NTFvRnZ5Y0Jo?=
 =?utf-8?B?U0tqODBpK3IwZGdwbVh5M0ZTaGZIdkxkVFZ4blRMY0I5cnVJWWpOMHB5c2RX?=
 =?utf-8?B?TmZtU2lqWnJGSGlUek9acGdMVnlIK0dRRVM2NTIzSVJLN21Nd0dHdU5XaXJE?=
 =?utf-8?B?aEp6bDY3SW5vS1VCYkIybDF2QWJLUU5oTGsxcDJNbGVsRHJmRlVDcDhqSjJk?=
 =?utf-8?B?aC9mTTVwY3pmcVIxMTUyWHlHblF4eXkyampVNGp5UzU2cnk2eG9DSUtudFdp?=
 =?utf-8?B?Yzh4OWFwNjAyL0ZTNEFrdEFYTlphZjVCYndBcC9Yd2dxYlFSd2Q3ek8zSHE1?=
 =?utf-8?B?YkRGVTAzWHFYdXk5NStKUDZYYVFVNWhmT00zbzE5d1RHckwyOHVqZE1jKzNY?=
 =?utf-8?B?RWtEOVYzTjNZenpPN0dlYzAyc2l2UWhSdm5uSkY3TjBNYXVmelQxQW9NcGZD?=
 =?utf-8?B?emxmUE13cENBU0JtQVBaK3ZraVFJYjJhNThDWE5FbnZRaGNQN0ZBTFVBMXVi?=
 =?utf-8?B?TmVPNmREcUwxU1BFZmJ1TDhqZzJWK1Nkd0ZaUXBrSU5YZUhlWW9MRnlZcVQ5?=
 =?utf-8?B?VjAvVXQ4b0lsVW1wMVNkQXRKMWQ5UXB4Z3JYODl1NGxCaUlldTlua2VNUWZ6?=
 =?utf-8?B?cWpuWS95VzhpZXdqcmY5YmF1d1U0QXdRaW1xNGt5N0o4UkhvK3dvczBkUDNO?=
 =?utf-8?B?TW9uelovRzNjbHpHVE5leDRvZ1FndVlKYnMra21IaFFFN0thT2FnVEpxS0Vm?=
 =?utf-8?B?RHNwak52V3dMb2dRckpHL2c0OE96SEF0blVwWnJaUndPTzJmVXJNV2Z0SFk0?=
 =?utf-8?B?bkw3dDluZkVkV2J3OWtSVjBHalpPamRSVmdyTE9MVnZSYVFmS1N5U0NoMzJS?=
 =?utf-8?B?a2F5YkkwbHc4YXRGZmJ5RmVWV0YxdkFFOEJOUmlWeUJLeElsaHFiRHYwQkhj?=
 =?utf-8?B?ZnFiSFFadXJVRFlHUVBqWTZZaGVTQzBJa1ZWL09ZL2JRQVUrdlo5Vk5Ld1Y1?=
 =?utf-8?B?elR6eEVobzBoQmpuRFJSTm04R0Q2QnhvcjhRb2pEcjVwbmN1ZW44U3lyYjhU?=
 =?utf-8?B?TGNlY2xDQTNhd0N0S3ZVcTN1a1pvQjE5Y1RBWml0S3dRaUZrR1dOTG1mRmNq?=
 =?utf-8?B?cWhvM28rMXVLaE1QaTVXdStHa1kvWDFTbE42VUJXZVh5NVBsRmFjMDBZQmhz?=
 =?utf-8?B?NzZjRkpQdSs3ckRBdkw1WkVJNk5NS3Q1SnBSSlNGTThabWoxbGVpTmVMcTl4?=
 =?utf-8?B?RU9GM01BR09GemdPRzF0RU5XK2dVUzViVXI2Vk9MWGZsNHRLaGNKT0dVMGN4?=
 =?utf-8?B?T042ZVZqRGlJR3hYVWhQc0ZmOGxYSlVFcjRRcUxTbXo4UDEwM3FNeWk5SnNK?=
 =?utf-8?B?SnpIVEt5b2hPZS8vR1pPc2dZWk1FcDA1OXZzNGtQR3ZWWkJBM24rOHV0MFBC?=
 =?utf-8?B?ZUl4b1V3OXN6YnpINVpDL1IzSmJZZXlZOGZaSVQzWE9UR3Jpakw1V2tDSGVE?=
 =?utf-8?B?L0NubVd5UW1kNTBrN2lYZ1U2b1NWUVVIcUhRcXVETGZvMWpObTRQQ1hHcnVV?=
 =?utf-8?Q?7v0g1ES5NN/fIMkv9vqYsa8QIoMWdkjN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5969.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zi8rOG1KdS9LV3ppdzNVbGFoTUVYbFdSTTIxbGN0RnVHUVZvSk01VFgvN1ZN?=
 =?utf-8?B?cUYvZmorN3JsRHhSaTdWTUJBMnVxektFVTU0SUxBUFVVKy9idkNwWE9kTkI3?=
 =?utf-8?B?VUUzR2VFdDdDd2tXTXRKTkxNQjNvWlU0V2lTaU42aU1tSXIxTFdMcFJpb2Z4?=
 =?utf-8?B?UXJWRldMdy81b3hPVGh4QzJadHM2Ni9iMlA4TmVyYXRaSDJBenJEMGF6V284?=
 =?utf-8?B?Vm9XRFNMYnJ0V2lXbEZhRVdxam1FOVR5VEVFdHo4eGUwbjYrbVdFZlMyYURi?=
 =?utf-8?B?bnd5cVNGSHo5c1VoRys4bkFkMWVIZUIxRFN5bkRvM2MzbjkwcUNGT0tKdkZo?=
 =?utf-8?B?UHZ0TUh0emNIcFh1WUdoVGxpQVR5MzFqZzJ5L1QrVytGVWRZcXhkaFFpUXE3?=
 =?utf-8?B?T09LNmk3V1RJZEFoTUwzYlpXdDVqV2tEc2k0dnpsMGltMGZLSVp3eG1nM2lQ?=
 =?utf-8?B?Ym9xbjgvblNERnZMZWxueUNCaG5aVVdqaWlZMkNQMVV3K1FRS0YvLzBzVkIx?=
 =?utf-8?B?WG0zUXd0a0pFQURFQ0s3ZEdGQnBSdmQxdlo5TG5WUGZLVHA2b01XS0tKYlp6?=
 =?utf-8?B?L0N4dmZZdWU0d1J3cFN0Y1FOVWZ0OXJPY1Y3MFlNUzBOYVpuaTJvdit2cXlZ?=
 =?utf-8?B?dmU1Z2lZY0dFaGdvL2pxeHlNS0ZGajEybFNOQS92UElFSEc4L1NjSHBmeitM?=
 =?utf-8?B?Q29FeS9TSC9pM3JTc29aSzVoQ29ONXJnWHBIamdSNWkyWEdmNWZ6VVEvUjZY?=
 =?utf-8?B?S1dTNkQ1S1FzVzE4UWYwWi9TbU5NMDlzZjB4RzIzQU5GQjlwbXBER1JvYjIx?=
 =?utf-8?B?clhUdHBSdHc3a0s1KzFhOXVEMWljSVRVRW1uU3FkNVZzRXhYL1YrVVprcEVm?=
 =?utf-8?B?cnBBdm16VlNQZVQ2aUdBV1g1cWgrMlBVNWRlNEVWcGRXYndoTG81NERhOWdm?=
 =?utf-8?B?N3paTm5PT3VBNmJ5T0RESENkc0NxTVJuSS96LzNMNDZ6V2MrMnlBV1RvNDRr?=
 =?utf-8?B?QVo5UzNGbzd4eVpYdDZIS3p1aTk0SlNNRkw4L3ZOY0VYMVJJak9WanY0NVBy?=
 =?utf-8?B?cW0yODdBY1p4NHArWGw4NGdkUjM1cldmQThydFh6REV1dEJodG9HNUY4ZHkz?=
 =?utf-8?B?MldGdC9zWGY3RktiMFR3MmpyczJ6T3pqTXhickxxc2l2QmxjSVVUNC9NdEZE?=
 =?utf-8?B?NEhCeTFuMkRpMnltb3Nocm5FaUlya0o5NmFKRjd5QTNZekszM1FwR3NuSE5Y?=
 =?utf-8?B?UFhsQ2hpV3NYWkJ6eVpFVElMNlZIejRCblZqL2Y5akZKeVlMUHRxU01hZGtC?=
 =?utf-8?B?QkN6Rjk5amE3eCtCZ1BwVzgra2tpdFBZUUdmSlVaVzFYK1htQytoNXRRY3Y4?=
 =?utf-8?B?S3RneHFuUFVHbE1tMUFWL0hzS0FRc0RwbGtnQTVURVh3QzRJMTdZN1p6K0sw?=
 =?utf-8?B?QThZbnlzUjQ4MjVMR0V3NnV0ZE9FR0lJclVqTTIxem9ZVk1Eek44TkhxNkZ6?=
 =?utf-8?B?SWpMWUx6bU1MY1Z4V2VPUVVHOHRoV0xSMjl6ZU4xdXl6cTdtTzhlWjVEYkZP?=
 =?utf-8?B?MHFtZVJQbnB0VXJWcVhNODczL0lzMmRlcGhZUFhEdnZrWVBhNzJsRExsWEZC?=
 =?utf-8?B?N2FRMkkvVkJxK21PajEzaGV5c3BURFFSdkk0bWhBeTBQRU9rMlhVK0FlWWEx?=
 =?utf-8?B?aVJqWVhJaHhHbFE5K3VKQnhzYklkSXFoOWpkUlFOMVNUVTUrTDJiY3BySjMw?=
 =?utf-8?B?MjRrOWdVZHhmd3VzdzhmeFhlbVAveHcxdXQ0MHJDc3g1UW1oNXRxdEt1emlW?=
 =?utf-8?B?d3MvNndNR3hJZEJ2ejJ1c3pXb2lOeURxUnd5MmdzWldKd0JRdmhmam16WmR2?=
 =?utf-8?B?OXFoTDJXdzR1d1RQUjMvcExNNFBvVkRqU3VxalhFNDh6YjMzV3hWQTVkbzJs?=
 =?utf-8?B?bE5tdjdnZmZTVThqY1RvcmxraDlQdXhMR2paVWlDME5ZS2YzdWYyNmtsODdH?=
 =?utf-8?B?QkFIWjlPZzNzNlhtUTVJN3F6TGorZGpOWFNrbzc3UU82d0RlSTRCSEZQZVVI?=
 =?utf-8?B?Z05FWU0ySnhidnVVcElNWkVsRTdNTGViYlBWOE1Mb0pDNGdlUUlwVjFOcnpN?=
 =?utf-8?Q?q+JI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5969.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3c0441-9f9f-47e7-9405-08dd1f712711
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 14:35:00.3319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IdiuRkZQP96uHHVAI8nTsG4l5yhigkrGIprtpZzBTJYLHZieSvPF0NV6ii9jCXNp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8942
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGkgVG9taQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFRvbWkg
VmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIERlY2VtYmVyIDE4LCAyMDI0IDEyOjQ5IFBNDQo+IFRvOiBTYWdhciwgVmlzaGFsIDx2
aXNoYWwuc2FnYXJAYW1kLmNvbT4NCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS0NCj4ga2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmc7IEtseW1lbmtvLCBBbmF0b2xpeSA8QW5hdG9saXkuS2x5bWVua29A
YW1kLmNvbT47DQo+IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb20+OyBNYXhpbWUgUmlwYXJkDQo+IDxtcmlwYXJkQGtlcm5lbC5vcmc+OyBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47IERhdmlkDQo+IEFpcmxpZSA8YWlybGll
ZEBnbWFpbC5jb20+OyBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+OyBMYXVyZW50IFBp
bmNoYXJ0DQo+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+OyBTaW1laywgTWlj
aGFsIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwMS8xMF0g
ZHJtL2ZvdXJjYzogQWRkIHdhcm5pbmcgZm9yIGJhZCBicHANCj4NCj4gSGkgVmlzaGFsLA0KPg0K
PiBPbiAwNC8xMi8yMDI0IDE4OjI2LCBTYWdhciwgVmlzaGFsIHdyb3RlOg0KPiA+IFtBTUQgT2Zm
aWNpYWwgVXNlIE9ubHkgLSBBTUQgSW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9ubHldDQo+ID4NCj4g
PiBIaSBUb21pLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgcGF0Y2guDQo+ID4NCj4gPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWku
dmFsa2VpbmVuQGlkZWFzb25ib2FyZC5jb20+DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1i
ZXIgNCwgMjAyNCAxMDozMSBBTQ0KPiA+PiBUbzogU2FnYXIsIFZpc2hhbCA8dmlzaGFsLnNhZ2Fy
QGFtZC5jb20+OyBLbHltZW5rbywgQW5hdG9saXkNCj4gPj4gPEFuYXRvbGl5LktseW1lbmtvQGFt
ZC5jb20+OyBNYWFydGVuIExhbmtob3JzdA0KPiA+PiA8bWFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPjsNCj4gPj4gVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBEYXZpZCBBaXJsaWUNCj4gPj4g
PGFpcmxpZWRAZ21haWwuY29tPjsgU2ltb25hIFZldHRlciA8c2ltb25hQGZmd2xsLmNoPjsgTGF1
cmVudCBQaW5jaGFydA0KPiA+PiA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPjsg
U2ltZWssIE1pY2hhbA0KPiA8bWljaGFsLnNpbWVrQGFtZC5jb20+DQo+ID4+IENjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1hcm0tDQo+ID4+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBUb21pIFZhbGtlaW5l
bg0KPiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT4NCj4gPj4gU3ViamVjdDogW1BB
VENIIDAxLzEwXSBkcm0vZm91cmNjOiBBZGQgd2FybmluZyBmb3IgYmFkIGJwcA0KPiA+Pg0KPiA+
PiBkcm1fZm9ybWF0X2luZm9fYnBwKCkgY2Fubm90IGJlIHVzZWQgZm9yIGZvcm1hdHMgd2hpY2gg
ZG8gbm90IGhhdmUgYW4NCj4gPj4gaW50ZWdlciBiaXRzLXBlci1waXhlbC4gSGFuZGxlIHdyb25n
IGNhbGxzIGJ5IHByaW50aW5nIGEgd2FybmluZyBhbmQNCj4gPj4gcmV0dXJuaW5nIDAuDQo+ID4N
Cj4gPiBJdCB3b3VsZCBiZSBnb29kIHRvIGFkZCBhbiBleGFtcGxlIG9mIHBpeGVsIGZvcm1hdCB0
aGF0IG1heSBjYXVzZSB0aGlzIGlzc3VlLg0KPg0KPiBJbmRlZWQsIHRoZSBkZXNjcmlwdGlvbiBp
cyBwZXJoYXBzIGEgYml0IGxhY2tpbmcuIEknbGwgY2hhbmdlIGl0IHRvOg0KPg0KPiBkcm1fZm9y
bWF0X2luZm9fYnBwKCkgY2Fubm90IGJlIHVzZWQgZm9yIGZvcm1hdHMgd2hpY2ggZG8gbm90IGhh
dmUgYW4NCj4gaW50ZWdlciBiaXRzLXBlci1waXhlbCBpbiBhIHBpeGVsIGJsb2NrLg0KPg0KPiBF
LmcuIERSTV9GT1JNQVRfWFYxNSdzIChub3QgeWV0IGluIHVwc3RyZWFtKSBwbGFuZSAwIGhhcyB0
aHJlZSAxMC1iaXQNCj4gcGl4ZWxzIChZIGNvbXBvbmVudHMpLCBhbmQgdHdvIHBhZGRpbmcgYml0
cywgaW4gYSA0IGJ5dGUgYmxvY2suIFRoYXQgaXMNCj4gMTAuNjY2Li4uIGJpdHMgcGVyIHBpeGVs
IHdoZW4gY29uc2lkZXJpbmcgdGhlIHdob2xlIDQgYnl0ZSBibG9jaywgd2hpY2gNCj4gaXMgd2hh
dCBkcm1fZm9ybWF0X2luZm9fYnBwKCkgZG9lcy4gVGh1cyBhIGRyaXZlciB0aGF0IHN1cHBvcnRz
IHN1Y2gNCj4gZm9ybWF0cyBjYW5ub3QgdXNlIGRybV9mb3JtYXRfaW5mb19icHAoKSwNCj4NCj4g
SXQgaXMgYSBkcml2ZXIgYnVnIGlmIHRoaXMgaGFwcGVucywgYnV0IHNvIGhhbmRsZSB3cm9uZyBj
YWxscyBieQ0KPiBwcmludGluZyBhIHdhcm5pbmcgYW5kIHJldHVybmluZyAwLg0KPg0KDQpUaGlz
IGxvb2tzIGdvb2QgdG8gbWUuDQoNClZpc2hhbA0KDQo+ICAgVG9taQ0KPg0KPiA+Pg0KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJk
LmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYyB8IDcg
KysrKysrKw0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4gPj4NCj4g
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZvdXJjYy5jDQo+ID4+IGluZGV4IDE5M2NmOGVkNzkxMi4uZTg0YzRlZDY5Mjhj
IDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jDQo+ID4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMNCj4gPj4gQEAgLTQyOSw2ICs0MjksMTMg
QEAgdW5zaWduZWQgaW50IGRybV9mb3JtYXRfaW5mb19icHAoY29uc3Qgc3RydWN0DQo+ID4+IGRy
bV9mb3JtYXRfaW5mbyAqaW5mbywgaW50IHBsYW5lKQ0KPiA+PiAgICAgICAgaWYgKCFpbmZvIHx8
IHBsYW5lIDwgMCB8fCBwbGFuZSA+PSBpbmZvLT5udW1fcGxhbmVzKQ0KPiA+PiAgICAgICAgICAg
ICAgICByZXR1cm4gMDsNCj4gPj4NCj4gPj4gKyAgICAgaWYgKGluZm8tPmNoYXJfcGVyX2Jsb2Nr
W3BsYW5lXSAqIDggJQ0KPiA+PiArICAgICAgICAgKGRybV9mb3JtYXRfaW5mb19ibG9ja193aWR0
aChpbmZvLCBwbGFuZSkgKg0KPiA+PiArICAgICAgICAgIGRybV9mb3JtYXRfaW5mb19ibG9ja19o
ZWlnaHQoaW5mbywgcGxhbmUpKSkgew0KPiA+PiArICAgICAgICAgICAgIHByX3dhcm4oInVuYWJs
ZSB0byByZXR1cm4gYW4gaW50ZWdlciBicHBcbiIpOw0KPiA+PiArICAgICAgICAgICAgIHJldHVy
biAwOw0KPiA+PiArICAgICB9DQo+ID4+ICsNCj4gPj4gICAgICAgIHJldHVybiBpbmZvLT5jaGFy
X3Blcl9ibG9ja1twbGFuZV0gKiA4IC8NCj4gPj4gICAgICAgICAgICAgICAoZHJtX2Zvcm1hdF9p
bmZvX2Jsb2NrX3dpZHRoKGluZm8sIHBsYW5lKSAqDQo+ID4+ICAgICAgICAgICAgICAgIGRybV9m
b3JtYXRfaW5mb19ibG9ja19oZWlnaHQoaW5mbywgcGxhbmUpKTsNCj4gPj4NCj4gPj4gLS0NCj4g
Pj4gMi40My4wDQo+ID4NCj4gPiBSZWdhcmRzDQo+ID4gVmlzaGFsIFNhZ2FyDQo=
