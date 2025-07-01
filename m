Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2DBAEEBB7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 03:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717D110E23F;
	Tue,  1 Jul 2025 01:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hxkbgezk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2074.outbound.protection.outlook.com [40.107.100.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282D810E23F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 01:03:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXprk6cy8LkyYplWciu0byZgFMRHI4jMe7iKmnSd036696Me0vOdqdeQgnxUgjcBkJMu7sbsdYLE7pDe1kSr9YMygsUumoYiF3k7PYuoU3b1e28xYX9GtXtYBWZNB6BYZDQMGS6iI+Zi7JKWG/9y0EQVVvTIwGNLehHxXcmYlSDSeyJN9TYZi6lt6yMWZyGmHSCjUzp+OA6Nj8HCm2QCd3anvG5lR63eAtoac2D0H6NZN4rk8kh06dXVwToPvUpTxy9w+HGVhzN5CpWxRk/tiaVIB3t3mSDQBCtkQam32+VRZtlcqOobCXdbh5nB/lKGJ6Rz5sTxU7gGQgHb+/bIfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2h6sOdoEjalrFQ0GkHXBp2e3UUan3z32TFixfLOoG2g=;
 b=rGwVacCoqYZ1bZXiGo4eaLvn2YvzBWUPU5BXtgcC0UsxSst7khZ8Hao0zCBTgYhw5fpsH/vIEp8/gJX96vTTWG8iTT8pVbSMehCQfoXmBZvr4DSjqLDl2aKTnUcBjt6FRVWx+Ue/ETGloMKJl2o5WNc4+ujvzRcjS+87gQXvnsS/07/asTcc3ykPMaavQjoI0S8GhjDdui/DA7p4szd+SCLQXRfMD75CW/dnGjquq1Rc5v29gRju5JBipJthcMQpumUN69tdNz8h4AqtmNCCQQWaX7hy5WYY+8zXKHsR1aoygIiIV7XUDy0fU19QBDP4TFf+mmPmEpo4QCUXOZoUWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2h6sOdoEjalrFQ0GkHXBp2e3UUan3z32TFixfLOoG2g=;
 b=hxkbgezk62ia0ft9tuGhVVPrWX7aJVoP6VJLeFjW9EqyXcfUZ0FsAQPC/yOmBbZeiLTrAYBcBk8+Q+0ZsJvLooM95NrfhskUtA2+pDr/3cjj3RJxItKSryRZ2BeQ57jCa9fdsYbT9LJobBM7kDuVpFgYBzBI55SOIs3JNrwicys=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by PH7PR12MB5733.namprd12.prod.outlook.com (2603:10b6:510:1e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 01:03:24 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076%7]) with mapi id 15.20.8835.027; Tue, 1 Jul 2025
 01:03:24 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Mike Looijmans <mike.looijmans@topic.nl>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, David
 Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 "Simek, Michal" <michal.simek@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Thread-Topic: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Thread-Index: AQHb53L5eS0Zbjv6x0+FvyDSoajsQrQXUQ+AgAQK6QCAAAUPgIAAbGUAgACob4A=
Date: Tue, 1 Jul 2025 01:03:24 +0000
Message-ID: <MW4PR12MB7165259AD14396697AE2A0D1E641A@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <20250627181911.GF24912@pendragon.ideasonboard.com>
 <42af6260-c8af-42e1-a9bb-adfaaabf0190@topic.nl>
 <20250630082123.GA23516@pendragon.ideasonboard.com>
 <21227b4e-d345-4e12-bbfb-b2ab5330d0d2@topic.nl>
In-Reply-To: <21227b4e-d345-4e12-bbfb-b2ab5330d0d2@topic.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-01T00:52:11.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|PH7PR12MB5733:EE_
x-ms-office365-filtering-correlation-id: 03d37d33-7209-42f7-51a8-08ddb83b147b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aE81UTNOcC9wemFrODNTMGtWTTFETW9ibTJTeFVldjhFaGJFamNoZG9vRWZs?=
 =?utf-8?B?R0xGVlBtaWpQdDVyRUVrQjJOWi9UVFFMVy91YTRrTXpXT0c1eVRVNmFIaXU4?=
 =?utf-8?B?Smd3Q2YwSC9IYVFXYklSbzZBdERxaHZSMDdVL0dveU1Lb3krYkVwUmRVS1U3?=
 =?utf-8?B?VmFhdG5jcWxhWHZSbGx2QjBWWjFTcjlSaXR3VWRIakNXZ3hkd2NPSytwRkpm?=
 =?utf-8?B?clUxV2xLVkszcHdIaVkzSVVTU3YwYXZBQlpSTUUwRVVMYWdBYW5pa244RVhm?=
 =?utf-8?B?cy80YUJ4M0hsRjdMNStDYTc4N3ZzR0VtWGRUaHZlK0NsbXJLWXdPOUhqcWt3?=
 =?utf-8?B?cnFDQ3FBaEZxb0tXTnFTS1VnblVKeng1b2Y0STljNkQ1UDZsd3VQdDNpOGd0?=
 =?utf-8?B?MTJUSHduSDA1RUdLcmU2WmY4aXpkdVZJNUhTV2xCZWxUYWFCTDBIeHIzeDZT?=
 =?utf-8?B?VVlTUzYySzFvZ3JTK1VaelRMck02cnFPSkIvRWFiL1BsWlJuWC9EQmQyWU9F?=
 =?utf-8?B?VFRaZFViTnB0MzJiY3h3aDZyRW9RYUdoUlV3YytJWnM5NmtycjFvdE9abnVs?=
 =?utf-8?B?QXFSTEpSRUN1aGt6RktiS2pRdTJtcHIvYjVJK2R4bThLU1REK0p4Rm0yTC94?=
 =?utf-8?B?N3Ixbm5FOE9ObHgvKzk2TFZ1T0t2WER1cUx0RjEvTWFMOTBDU20zdVlIMi9H?=
 =?utf-8?B?OXpRd2JMc09pTzhNUjhHSXd3OUV3UWMzdkYzbnFQYlFqUE1qZFNZdDg5L21F?=
 =?utf-8?B?ek4yT0o4TnNkaDlscFArbnVBUnpuelhnY1Vya1Zkdy9STEhFbmlVdElHS1hE?=
 =?utf-8?B?QnBFSEsvNEUwMEQ3ZUt5c0huNmpjWjRIWVByV2hyWnlnL2JwWE9YdmFMQ1N3?=
 =?utf-8?B?b0ZaL012K2JkZGk4aWdJUlFIa21oeVBEb0JVcWtkN1RnMW1yNDRyUzY1M0kx?=
 =?utf-8?B?M1FoSllSV2x2cjVISitTWWxobGsrTkI0UWZiL2ZzekR3QjRuRzlQYnY4WXRo?=
 =?utf-8?B?ZDJ1NGRuSXJZbldLbkY1NjJOUlA4aUI4TE5nQm44QVVOTnNsSXVoV293SmpD?=
 =?utf-8?B?OGpkNjVaT0ZKZUdnY3ptVFlWV1U0c0J2dVZyWVdBd3RkeC9UdTN5T1RuVHlF?=
 =?utf-8?B?cXJTcVFSMUpobllXVHFERU03K2taQThudUkycHJnL3JJeVFUT3RPTkVBaE1M?=
 =?utf-8?B?UEpDYm9MS2dDS2RwelZjTXJPYlZwRzZJZHZnQXNMWFpCVVdtQ0Y5TEZnSTVv?=
 =?utf-8?B?SFFTNytleFdPYkZQL2tSZ2pNRE9JVHR5b1ZBME14RTJydTYyQy84OXAzYTJy?=
 =?utf-8?B?WGRNc0JQZ2NoQjJVZDJ6OVdyTGFKYjRzYWtNanJ0cmg1RVlFTUUzUHhhSFBk?=
 =?utf-8?B?UU5rVFFXSWZkYldVVTA0Vkw5aW8xdHd4SnFTTHlUaGRMWjgyYXhJN1ZlRElX?=
 =?utf-8?B?N0d1a0ZNcXFVa0FybG4yOUEyUUZSNEFRZ0xncnVMUE5kaUdhTnNVQmxVL05V?=
 =?utf-8?B?b1NMbUxKQ2xlbDNtMy82ZGgzQ1hML3ZpSUZpdEkyT1NJcEFSWHgxcldmemVJ?=
 =?utf-8?B?Mi9SRzBwc3RXYkFqTjZDK2lxaGhXTld3bHdCbmpML3hTa2FwVHI4U2hPSys4?=
 =?utf-8?B?aExpbUN0VG02VWJoeitXeUpuL0pvd2Uzcy9lbEp5bUo3Ty9JTGgxaU1NZ243?=
 =?utf-8?B?RVc1UklCNGM2eVhnTDd3SzVCTUJSN0dMMW9QS0xORzc2WVpIOXhPRUhtbUZp?=
 =?utf-8?B?R2QxQXE2Ny8yK3pvVU4rajRBQ3ptRDJUM3JnUzk3V0dzeEdIbHFuUnk1bXdL?=
 =?utf-8?B?bExURStRMWZmWHdVQzBnT1VTZUFNTFpFamNQOGppMHFJYW5McDRIbXVYb3lB?=
 =?utf-8?B?Q0lia0FyWGlHV2xnR2MzUFVycmNyMXVpc3BkWmN1bEIvaW5RUkFCOXZBR1E3?=
 =?utf-8?Q?1igRR73LzZE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGdWaXY5VExWK2RFSHZOc1h4VzFFUDd1YTU2SE45Nm4ySzM4RVJXSVl6V25U?=
 =?utf-8?B?T25qQzN5RXF2TUtFWXNlK21EcThFUFlyWllmM1Y4Z3V5YS9pZlZYVnJTTXRN?=
 =?utf-8?B?cjlvVHNJYSs5VnRTS0tEa3pneThndlFPZTZIMk5aSm5oR09yQTduTmJEdHNF?=
 =?utf-8?B?TUc1TEpKN0xXTE53SUZnMUw0WCtEUlZxU015ZDg5bC9PQ3hXc2pONG5NZGZh?=
 =?utf-8?B?UU42UzVrWXVyR2w2WmMxcWFUeWJHQWk0eXBLSitRbmVib2FMU0ovUjlFZ0lF?=
 =?utf-8?B?T2krcithd0pCVklTT0xDNjdoRzNGeUhYSGdPOTZlWEh2YWRvQktnTUpPSlEr?=
 =?utf-8?B?aW5oUTI5azZGcnVkM3BEZ2FBVmpHdFJ6TWl2bGVTMmtxSUpwTUdmTEhnWEFy?=
 =?utf-8?B?YkZUUDY5THhWSlhXNVlqQWVtSlMzUjRQcHlNU1JIVWNJVXdud3llcTROR3hP?=
 =?utf-8?B?TkRpZHNmdFo4YmFPeXkzMFovZmtTaXlGWlRTZDh6MTN2WTI0aVFxWEIyTXZr?=
 =?utf-8?B?Q0RpUFVoZHNidGVORnJWQnIxSnRRNFBzdERTcENvNy91RWxpVFdWRkl5Wmhx?=
 =?utf-8?B?RDFnWEl0dTRIamhGa3lWZjNuZ2RkeXpjb1l2elhlSmlLOXFRaHZsd3FXWURL?=
 =?utf-8?B?bUJPTkh6NmlUR3JtU0dNZ0xNUFZuR3BFNUwvNGhlSmxVa1ZOanFFTk9KS3Bs?=
 =?utf-8?B?bU5zK3pFRnlCelcvWmZFeENFaGpzTW9hWC9GZTllSWdJNkkvVi84emV2Q0Zk?=
 =?utf-8?B?S21CcHg0MFNvSkRuRmRrSGVsRnc1dXVmb1hSTFUxUHFoY2tibFJKUDV2UDEx?=
 =?utf-8?B?RHBxSnBsSlc3V1ZnY1N4d1l0N0NGdU1KVTlhN1FOK2podXpBbzM2Z1VaM3FZ?=
 =?utf-8?B?SVZVdFlNaURHcTFhdHEwYTdob0NOQzN4ekFGZGNqTHA0dXZxTmM4V21hdlNN?=
 =?utf-8?B?WG5jVXBFVXllaTNBKzFWZGQyNkNyTzVVOXJwYmZpdVJKMnpRMjlEei9uTmJV?=
 =?utf-8?B?d2k2K2pGaHpDb1orc3hBYUh0Y0gyWGJTWk5TNkhFZFV2RHZ4UWhvMENENENl?=
 =?utf-8?B?bmxtT3RuUUI2R0k4d0F1T28yaHpUR1I3Z21aSFpTTE5FYTAzcFNxeVg5MFF4?=
 =?utf-8?B?bEM3aVhiMjdRcmdUdDR0V3YrdlRBeEdqOFJubmhqUGoyVXp1UTl4TGhyWXl6?=
 =?utf-8?B?SXJORGZMTTJMQVZYeFF5eXVwbFlHR08rWi83Vjh2SVlxZHkyK1ErOHZCUUZC?=
 =?utf-8?B?N0JFOGMwRHUxQ1NUZDl0d2FJeTFXelAwY21KMzJEYThZM3k2NEVnc2huT1Nh?=
 =?utf-8?B?VHVDS3FIZG5FVGNuWEtzc25UbFVGWkR3K2lDYkVyUkpZdFpZdS9NKzNyS29N?=
 =?utf-8?B?NldXV2QvWDU4RFJCRWRiY0hZeFdOVkNUdXBNVW1jQTJnKzVHeVd5bVREcS9H?=
 =?utf-8?B?cEtkU1BneW9ZY0haaHU0d0RQTDJ5MGZQT3pYcy9NOTRVNEJkUHBObUtGSWZ6?=
 =?utf-8?B?aGZCQUZIZXVKK3dkVW9wVTB0TXpjWm1CbmF0MjdwV0lrbDNiNnVqbEdiVFZ3?=
 =?utf-8?B?SWJ6Vjc2ZXAzWUt4UEg0ZnBiWnVYZ3A3dzVtSTVDdEFLcEk3L3I0UjJybjJJ?=
 =?utf-8?B?bzJtUHExN3dSakdsNWZnZ2Y5MllBZzFmUEc1THlRK0YyZU1KNFFxTFFyZElq?=
 =?utf-8?B?VHNmWC9ZYnVBN1RVNmdFRUZnS3dFd0dKWmVZbGhrTVZ6MVp0b0ltMmN4SHFS?=
 =?utf-8?B?Vy95TGxWenV4QlBMUzFCczBHcFJvWnFTdEFTVHFmOXFFQ01jR3hyTlcvQ2JF?=
 =?utf-8?B?OTY2bkR4VnYxbmtIZzRXN2s0b2FEZVFnd1RNNGlzdjZVRXhXY0dId3pORlBN?=
 =?utf-8?B?ektaU3NBVDhsS0VvZXBxcytHZ240WGc0ZUd2WUlaMGYxcnYxcjJnWEdGbWUz?=
 =?utf-8?B?S1BQRXJEaVZqMFc4bVpSMmRVdjFHb1gycjBRSnp6a3BRSzBPS0NRU09KSG9p?=
 =?utf-8?B?Nk1RZWZtemFwaDF0aWF1U0xKcFNGYXBPY2Y2SFAzTTNUeHF0QlhLSHA4YVZy?=
 =?utf-8?B?ZmhHMS9SRXdUdGJ0c3orZ1pFdDNXOUdmRWZkUDJsRi8vc2loT2IyTkllellq?=
 =?utf-8?Q?5A08=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d37d33-7209-42f7-51a8-08ddb83b147b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 01:03:24.2227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lvv9gQinkFdyYaqnIvtw155J240pH1zaeDAIkdtlT0knc8BXHdQW+iZSaJoX1TZ2hH6R5bezTpcl2FC1GLTQ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5733
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
Cg0KSGkgTWlrZSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkcmkt
ZGV2ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxm
IE9mIE1pa2UNCj4gTG9vaWptYW5zDQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAzMCwgMjAyNSA3OjQ5
IEFNDQo+IFRvOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+DQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAZ21haWwuY29tPjsgTWFhcnRlbg0KPiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFu
a2hvcnN0QGxpbnV4LmludGVsLmNvbT47IE1heGltZSBSaXBhcmQNCj4gPG1yaXBhcmRAa2VybmVs
Lm9yZz47IFNpbWVrLCBNaWNoYWwgPG1pY2hhbC5zaW1la0BhbWQuY29tPjsgU2ltb25hDQo+IFZl
dHRlciA8c2ltb25hQGZmd2xsLmNoPjsgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+Ow0KPiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNv
bT47IGxpbnV4LWFybS0NCj4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtOiB4bG54OiB6eW5x
bXBfZHA6IFN1cHBvcnQNCj4gRFJNX0ZPUk1BVF9YUkdCODg4OA0KPg0KPiBDYXV0aW9uOiBUaGlz
IG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHByb3BlciBj
YXV0aW9uDQo+IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJl
c3BvbmRpbmcuDQo+DQo+DQo+IE9uIDMwLTA2LTIwMjUgMTA6MjEsIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6DQo+ID4gT24gTW9uLCBKdW4gMzAsIDIwMjUgYXQgMTA6MDM6MTZBTSArMDIwMCwgTWlr
ZSBMb29pam1hbnMgd3JvdGU6DQo+ID4+IE9uIDI3LTA2LTIwMjUgMjA6MTksIExhdXJlbnQgUGlu
Y2hhcnQgd3JvdGU6DQo+ID4+PiBPbiBGcmksIEp1biAyNywgMjAyNSBhdCAwNDo1MDo0NlBNICsw
MjAwLCBNaWtlIExvb2lqbWFucyB3cm90ZToNCj4gPj4+PiBYUkdCODg4OCBpcyB0aGUgZGVmYXVs
dCBtb2RlIHRoYXQgWG9yZyB3aWxsIHdhbnQgdG8gdXNlLiBBZGQgc3VwcG9ydA0KPiA+Pj4+IGZv
ciB0aGlzIHRvIHRoZSBaeW5xbXAgRGlzcGxheVBvcnQgZHJpdmVyLCBzbyB0aGF0IGFwcGxpY2F0
aW9ucyBjYW4gdXNlDQo+ID4+Pj4gMzItYml0IGZyYW1lYnVmZmVycy4gVGhpcyBzb2x2ZXMgdGhh
dCB0aGUgWCBzZXJ2ZXIgd291bGQgZmFpbCB0byBzdGFydA0KPiA+Pj4+IHVubGVzcyBvbmUgcHJv
dmlkZWQgYW4geG9yZy5jb25mIHRoYXQgc2V0cyBEZWZhdWx0RGVwdGggdG8gMTYuDQo+ID4+Pj4N
Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWtlIExvb2lqbWFucyA8bWlrZS5sb29pam1hbnNAdG9w
aWMubmw+DQo+ID4+Pj4gLS0tDQo+ID4+Pj4NCj4gPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0veGxu
eC96eW5xbXBfZGlzcC5jIHwgNSArKysrKw0KPiA+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKykNCj4gPj4+Pg0KPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGxueC96eW5xbXBfZGlzcC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2Rpc3Au
Yw0KPiA+Pj4+IGluZGV4IDgwZDFlNDk5YTE4ZC4uNTAxNDI4NDM3MDAwIDEwMDY0NA0KPiA+Pj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwLmMNCj4gPj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jDQo+ID4+Pj4gQEAgLTMxMiw2ICszMTIs
MTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB6eW5xbXBfZGlzcF9mb3JtYXQNCj4gYXZidWZfZ2Z4
X2ZtdHNbXSA9IHsNCj4gPj4+PiAgICAgICAgICAgICAgICAgICAgLmJ1Zl9mbXQgICAgICAgID0N
Cj4gWllOUU1QX0RJU1BfQVZfQlVGX0ZNVF9OTF9HRlhfUkdCQTg4ODgsDQo+ID4+Pj4gICAgICAg
ICAgICAgICAgICAgIC5zd2FwICAgICAgICAgICA9IHRydWUsDQo+ID4+Pj4gICAgICAgICAgICAg
ICAgICAgIC5zZiAgICAgICAgICAgICA9IHNjYWxpbmdfZmFjdG9yc184ODgsDQo+ID4+Pj4gKyAg
fSwgew0KPiA+Pj4+ICsgICAgICAgICAgLmRybV9mbXQgICAgICAgID0gRFJNX0ZPUk1BVF9YUkdC
ODg4OCwNCj4gPj4+PiArICAgICAgICAgIC5idWZfZm10ICAgICAgICA9DQo+IFpZTlFNUF9ESVNQ
X0FWX0JVRl9GTVRfTkxfR0ZYX1JHQkE4ODg4LA0KPiA+Pj4+ICsgICAgICAgICAgLnN3YXAgICAg
ICAgICAgID0gdHJ1ZSwNCj4gPj4+PiArICAgICAgICAgIC5zZiAgICAgICAgICAgICA9IHNjYWxp
bmdfZmFjdG9yc184ODgsDQo+ID4+PiBJJ20gYWZyYWlkIHRoYXQncyBub3QgZW5vdWdoLiBUaGVy
ZSdzIGEgY3J1Y2lhbCBkaWZmZXJlbmNlIGJldHdlZW4NCj4gPj4+IERSTV9GT1JNQVRfQVJHQjg4
ODggKGFscmVhZHkgc3VwcG9ydGVkIGJ5IHRoaXMgZHJpdmVyKSBhbmQNCj4gPj4+IERSTV9GT1JN
QVRfWFJHQjg4ODg6IGZvciB0aGUgbGF0dGVyLCB0aGUgJ1gnIGNvbXBvbmVudCBtdXN0IGJlDQo+
IGlnbm9yZWQuDQo+ID4+PiBUaGUgZ3JhcGhpY3MgbGF5ZXIgaXMgYmxlbmRlZCBvbiB0b3Agb2Yg
dGhlIHZpZGVvIGxheWVyLCBhbmQgdGhlIGJsZW5kZXINCj4gPj4+IHVzZXMgYm90aCBhIGdsb2Jh
bCBhbHBoYSBwYXJhbWV0ZXIgYW5kIHRoZSBhbHBoYSBjaGFubmVsIG9mIHRoZSBncmFwaGljcw0K
PiA+Pj4gbGF5ZXIgZm9yIDMyLWJpdCBSR0IgZm9ybWF0cy4gVGhpcyB3aWxsIGxlYWQgdG8gaW5j
b3JyZWN0IG9wZXJhdGlvbiB3aGVuDQo+ID4+PiB0aGUgJ1gnIGNvbXBvbmVudCBpcyBub3Qgc2V0
IHRvIGZ1bGwgb3BhY2l0eS4NCj4gPj4gSSBzcGVudCBhIGZldyBob3VycyBkaWdnaW5nIGluIHRo
ZSBzb3VyY2UgY29kZSBhbmQgd2hhdCBJIGNvdWxkIGZpbmQgaW4NCj4gPj4gdGhlIFRSTSBhbmQg
cmVnaXN0ZXIgbWFwcywgYnV0IHRoZXJlJ3Mgbm90IGVub3VnaCBpbmZvcm1hdGlvbiBpbiB0aGVy
ZQ0KPiA+PiB0byBleHBsYWluIGhvdyB0aGUgYmxlbmRlciB3b3Jrcy4gVGhlIG9idmlvdXMgIlhS
R0IiIGltcGxlbWVudGF0aW9uDQo+ID4+IHdvdWxkIGJlIHRvIGp1c3QgZGlzYWJsZSB0aGUgYmxl
bmRlci4NCj4gPiBUaGF0IHdvbid0IHdvcmsgd2hlbiB1c2luZyBnbG9iYWwgYWxwaGEgdW5mb3J0
dW5hdGVseSA6LSgNCj4gPg0KPiA+PiBXaGF0IEkgZ290IGZyb20gZXhwZXJpbWVudGluZyBzbyBm
YXIgaXMgdGhhdCB0aGUgYWxwaGEgY29tcG9uZW50IGlzDQo+ID4+IGlnbm9yZWQgYW55d2F5IHdo
aWxlIHRoZSB2aWRlbyBwYXRoIGlzbid0IGFjdGl2ZS4gU28gYXMgbG9uZyBhcyBvbmUNCj4gPj4g
aXNuJ3QgdXNpbmcgdGhlIHZpZGVvIGJsZW5kaW5nIHBhdGgsIHRoZSBBUkdCIGFuZCBYUkdCIG1v
ZGVzIGFyZQ0KPiBpZGVudGljYWwuDQo+ID4gQ29ycmVjdCwgKmlmKiBnbG9iYWwgYWxwaGEgaXMg
c2V0IHRvIGZ1bGwgb3BhcXVlLCB0aGVuIHlvdSBjYW4gZGlzYWJsZQ0KPiA+IHRoZSBibGVuZGVy
LiBUaGF0IGNvdWxkIGNvbmZ1c2UgdXNlcnNwYWNlIHRob3VnaCwgZW5hYmxpbmcgdGhlIGdyYXBo
aWNzDQo+ID4gcGxhbmUgd2l0aCBYUkdCIHdvdWxkIHdvcmssIGFuZCB0aGVuIGVuYWJsaW5nIHRo
ZSB2aWRlbyBwbGFuZSB3aXRoDQo+ID4gZ2xvYmFsIGFscGhhIHdvdWxkIGZhaWwuDQo+ID4NCj4g
Pj4gR3Vlc3MgSSdsbCBuZWVkIGFzc2lzdGFuY2UgZnJvbSBBTUQvWGlsaW54IHRvIGNvbXBsZXRl
bHkgaW1wbGVtZW50IHRoZQ0KPiA+PiBYUkdCIG1vZGVzLg0KPiA+IFRoZSBibGVuZGVyIGNhbiBp
Z25vcmUgdGhlIGFscGhhIGNoYW5uZWwgb2YgdGhlIGdyYXBoaWNzIHBsYW5lIGZvcg0KPiA+IGZv
cm1hdHMgdGhhdCBoYXZlIG5vIGFscGhhIGNoYW5uZWwuIEl0IHdvdWxkIGJlIG5pY2UgaWYgdGhl
cmUgd2FzIGEgYml0DQo+ID4gdG8gZm9yY2UgdGhhdCBiZWhhdmlvdXIgZm9yIDMyLWJpdCBSR0Ig
dG9vLCBidXQgSSBjb3VsZG4ndCBmaW5kIGFueSA6LSgNCj4gPiBJdCdzIHdvcnRoIGFza2luZyB0
aG91Z2guDQo+DQoNClVuZm9ydHVuYXRlbHksIHRoZXJlIGFyZSBubyBzdWNoIGV4cGxpY2l0IGZs
YWcgb24gdGhlIEhXIHNpZGUuIEFsdGhvdWdoLA0Kc29tZSBibGVuZGVyIG1vZGVzIG1heSB0dXJu
IG9mZiBwZXItcGl4ZWwgYWxwaGEgYXMgYSBzaWRlIGVmZmVjdC4gTGV0IG1lDQpjaGVjayBpZiBJ
IGNhbiBmaW5kIHNvbWUgdHJpY2sgdG8gbWFrZSBpdCBoYXBwZW4uDQoNCj4gWWVzLCBteSBwcm9i
bGVtIGV4YWN0bHkuDQo+DQo+DQo+ID4NCj4gPj4gKEZvciBvdXIgYXBwbGljYXRpb24sIHRoaXMg
cGF0Y2ggaXMgc3VmZmljaWVudCBhcyBpdCBzb2x2ZXMgdGhlIGlzc3Vlcw0KPiA+PiBsaWtlIFgx
MSBub3Qgc3RhcnRpbmcgdXAsIE9wZW5HTCBub3Qgd29ya2luZyBhbmQgaG9ycmVuZG91c2x5IHNs
b3cNCj4gPj4gc2NhbGluZyBwZXJmb3JtYW5jZSkNCj4gPj4NCj4gPj4+PiAgICAgICAgICAgIH0s
IHsNCj4gPj4+PiAgICAgICAgICAgICAgICAgICAgLmRybV9mbXQgICAgICAgID0gRFJNX0ZPUk1B
VF9SR0JBODg4OCwNCj4gPj4+PiAgICAgICAgICAgICAgICAgICAgLmJ1Zl9mbXQgICAgICAgID0N
Cj4gWllOUU1QX0RJU1BfQVZfQlVGX0ZNVF9OTF9HRlhfQUJHUjg4ODgsDQo+DQo+DQo+IC0tDQo+
IE1pa2UgTG9vaWptYW5zDQo+IFN5c3RlbSBFeHBlcnQNCj4NCj4gVE9QSUMgRW1iZWRkZWQgUHJv
ZHVjdHMgQi5WLg0KPiBNYXRlcmlhYWx3ZWcgNCwgNTY4MSBSSiBCZXN0DQo+IFRoZSBOZXRoZXJs
YW5kcw0KPg0KPiBUOiArMzEgKDApIDQ5OSAzMyA2OSA2OQ0KPiBFOiBtaWtlLmxvb2lqbWFuc0B0
b3BpYy5ubA0KPiBXOiB3d3cudG9waWMubmwNCj4NCj4NCi0tDQpUaGFuayB5b3UsDQpBbmF0b2xp
eQ0KDQoNCg==
