Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114C49D1360
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 15:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F62C10E4EB;
	Mon, 18 Nov 2024 14:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tuO13/cM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1214510E4EB;
 Mon, 18 Nov 2024 14:42:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGAW62dn8tfPPEmOWnOVJvesoT/ya7M8Vg6HS/nmk5Va7YJ/jsVrQo13xUWLNEjEdrSyCHf2CnMWllr3HTzjXIkUhMDOlH1oO4+EF01cVG704I/napwQQamhx1ZVIrMbXtljgkt5r2GM2vrm7WYqM6D4TY5dH4TAvldjRyiWayFoHsLI0O0OX7vYmn+aWEA2qotGHqKxinNtW3oJv2iN5jsclRMsQk9LQSSDLJq7sho0JLazqHMXSJeVjzBG4tGwvKnjGY1YS4H7S4gKKJSBSzeQV6MfF7x+Mm5+nuh8lp6qyV1qJDfpAgkQHu26LtEhzzTqZrbyhlHztP526IusgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0ZDChJl0eC44oxCBQR3kV1yM6qA4x50k+IeDimZ+1A=;
 b=T7u4MFBYQsatoYIG3xWaBKE7BWRHV6xzdBq6lrPEv29hKI09iR49O5TG0i4PpiMfWQ0owRGz9Y8moxcfRBPhBcEtqcjoO7ADMsVqYt6WskEsbZIzByq44aE/cMDwSj0bI9LQEeowG0UZArd+mhHNCjrWk9KDfJb2u6M6SdOA7bltnza48SO6IfQx/QJNvgHQouhxzYzZoMNX8r8tEe2fiPbQdTopeJcFwXUGGJw0RABc7OVeXvZS4UikGrMm2sXdlKKY6gu4YBZeWBtGHQ2wcETys+MxExLi3J7tW7Wk+jCENSZdDVWNy6x4uftM48uFvvPADMgR0eN14lon1xwpCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0ZDChJl0eC44oxCBQR3kV1yM6qA4x50k+IeDimZ+1A=;
 b=tuO13/cMbB0ccZz8hEN613Q8ucADBf/Qbn6HKWgToXgMCQRNYNdHSJQuouNBhRf09hLQulokkXDs5C9WBVmhw7BnoetfQpHqu1z5Bnu9iq70GH8vouJHqvRQ9X1/3S8eRssbGEvjjzc/4sxR+DpCBAJ/ItoDuYl29pft3OpnT4Q=
Received: from SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7)
 by SN7PR12MB7275.namprd12.prod.outlook.com (2603:10b6:806:2ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 14:42:29 +0000
Received: from SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b]) by SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b%5]) with mapi id 15.20.8137.027; Mon, 18 Nov 2024
 14:42:29 +0000
From: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v8 2/5] drm: make drm-active- stats optional
Thread-Topic: [PATCH v8 2/5] drm: make drm-active- stats optional
Thread-Index: AQHbN+JU77xFcciAp0KH7mukcyooorK9F84AgAAIPzA=
Date: Mon, 18 Nov 2024 14:42:29 +0000
Message-ID: <SA1PR12MB8599CDDA83AB1D37313482DDED272@SA1PR12MB8599.namprd12.prod.outlook.com>
References: <20241116044452.5925-1-Yunxiang.Li@amd.com>
 <20241116044452.5925-3-Yunxiang.Li@amd.com>
 <e917bc49-11fc-4f6c-b003-8015f53c0caa@igalia.com>
In-Reply-To: <e917bc49-11fc-4f6c-b003-8015f53c0caa@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=504e957e-6b6a-4a15-8632-411411cdf8b4;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-11-18T14:41:19Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8599:EE_|SN7PR12MB7275:EE_
x-ms-office365-filtering-correlation-id: 9f3ff5d1-7a63-4fbd-6d31-08dd07df3a25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WWRvclY0L3BMZzRTeDlLaDN6WWZDbEFoR0ZuYTBkSU1CTnVRN3RnQm4zRHZp?=
 =?utf-8?B?ZEpGV3dRSTNoNSs3OXR0Nk5MVmdFLzk0MjRBdWFmRXFBNWNGREFaODlBYjcv?=
 =?utf-8?B?U2ZET1d4M2V5cTRKZWVRN1Vyc1dzT21UMnFQeHZqTDBKdm9ucWltYUwzTUxM?=
 =?utf-8?B?eENUZ2tITVhlU2dCQUI5clJSVUZEcGhnMU9HKyt2UU55MVNCWS96U3B2OFpR?=
 =?utf-8?B?YW5nODlSNERXTHBHOEo2L01vcEhyVVZwMHl1RGxrMW9JY21uZWVZUEo3STNs?=
 =?utf-8?B?ckVUZTlMUUk1eGFOM3VlMUdvRUpnSGZ2UEJtVGhHYUVJUE96a0ZyUWh2ekNm?=
 =?utf-8?B?NVNFUEhLNVVTT0I5NkhXeFFuS29NVGd1WmN6Nk5YUmtla2N5blhOZ2gwWDMy?=
 =?utf-8?B?VUM2QUhFc1VQZTR3QnpiZ3pUMDFDNUlYcXZYZU9EdG5FOUptMkJHcnp4bEht?=
 =?utf-8?B?N0o0TnJwckIwQlE5V3JiMm8rTW1zQTJIekRiUGtYWXg1czhWWVNiUGJLUWJk?=
 =?utf-8?B?a0VaUUlLd1FoRGxwWXE5U2RwemZ3K1ZOamxVdGg0MzRUMlM5QWhCVFVBQk5U?=
 =?utf-8?B?QWdjY0szMUl5YzFIeU9ONGtYdFFEMHM5VFFHcFVHL3FUUzZIcGhhV3NlZTVk?=
 =?utf-8?B?RjB0eXVSbFVHL0dSTHFqdjd1NHA4YmlRcjVTTnJnempPOVI4OEE2TklvampG?=
 =?utf-8?B?Vm1sU3FXWlNlNEUxVzRhcXVncGExTndleWJqS2hDNkgrVUhLTy9jUlVEYVBC?=
 =?utf-8?B?NVZkOFJQMXFGMkNnT1Q1Z0ZIVExTZSt2OEtXSXg1MVJveFhYUWkxY0N0L1pO?=
 =?utf-8?B?RnI1QUVFL25RNC9oL2NKOHhnVjNpYXZxM3NYWW5lb21WNUtTSEd0ZEpyME52?=
 =?utf-8?B?N1lnMmRCN25QR1NPOVNIditHWnIwSi9qK3JCQ0JHaW1GZ3hQaDR6N3BMYUNK?=
 =?utf-8?B?cUJOVEVtbVljZjMwa1ZnT3EwSWUwV0JOYzFZV3lRMTh6WWl5c2YzbmxSdDB5?=
 =?utf-8?B?bW45cFZwbUVjNEErZEtwOVV4Ny9aK0hnbkNuSC9YMXkvQllMdnBZSHZ3OFQ5?=
 =?utf-8?B?SGNIaVF0RFRteTM3Y3NBZ0tpTWRCUXlNV095dExDenl2Vkc2OUtVSW5FdjU5?=
 =?utf-8?B?aUJzbWZQV0FrS0lRazBPWXpidE52RVFQNXhOYmhYWHRIREV3a3AvWTdYY0I0?=
 =?utf-8?B?YzhZc0dSK25WMVhIRW1tZWlEUHM1cWdiYk96bk0zMVJpSkMva2E4T2ZlUnAy?=
 =?utf-8?B?dVZqS3FFczdmOGVYMjd6ZjUxN29Zcm9jVm9TcGkzSU5kUnYzMWdPNHZPZFZY?=
 =?utf-8?B?ZDR3VXN2TnF4dGIxQlI5MlA1Z1RkbEJITWJqWVJmZ2xDL2NPTDhVU2VCSU5C?=
 =?utf-8?B?L2Rrc0VDaHlCVW80T1NwNDBxalE0NVVuWXNtaWNNeVdMS1lyUEFFbjJ4dEND?=
 =?utf-8?B?TGM1UlFzTzZ3Rlh0OHlXdmlQeHRCVjN2MWpLd2lxZ0YzMUxpZmE0ak1OM0ZS?=
 =?utf-8?B?N1pmZUh0UUFJSnM5RmJkTmxZa0lCUEFKc2FQSXlSRWFZamFWNUptVnl6emQy?=
 =?utf-8?B?aDd2ODZqanp6NWc4WW56c0JOLzRLK0IxOWsvbFJVYTVmb3NJRUFGbk45NHJT?=
 =?utf-8?B?QVdCaFZ2TkxhcjliS3AxOWNjT1BZNlY5MGUxOFEvb09zaEE0RG9YeTNXWHMy?=
 =?utf-8?B?WHR4WENUWlU1SVcwNmtTWU5YUnhqd3dxRy9vamJhSmhrL0pVazlJTWxHUXA4?=
 =?utf-8?B?NklPOWp4Rk8rZmROVlg5SFNxNkFuTzlLYTY5emlxbllCUXNrNkJ5WU9zYzZF?=
 =?utf-8?Q?LRcpocIx1nVU1jZ/Pj5zpkOnLlawloX7Qn2eo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8599.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEg1cEpyc0hBMjROL3RweTRGRDA4dGdBNk5yWWZYS1U0SUVpQytqNm5lT3Vj?=
 =?utf-8?B?aEZISUl1b2svSUs0WGVWUjFtb2wwOGJXUDB1Ri8xSnR3d1JCRmlrbkFqYkQz?=
 =?utf-8?B?WithcjI2TXJ6N1lVa3hsOGMvQXRaNkhsL3M4b2RJc096YjNMV0ZTWHdzZHdH?=
 =?utf-8?B?cFhrblc2OTVQWFhBcVpuM0Npd21BUUlKellROFBnM1M3T1ZBbW1MRzFobHBL?=
 =?utf-8?B?TjU0Q2VWaUZuWDJmeG5KNVpNbmpUSk42SXpOTFZGL25SVmk0ekJlelhLaUd3?=
 =?utf-8?B?K1BtRmkvQlF1VFJFUnRaWW9wUlMyM2k5NTNiakdsV25rc3MzMUJHd0ZDMjVP?=
 =?utf-8?B?eTdMU1JzVk0vSnE5MkVjT25ScnYvU2ZISkg4WFRyNkpWN3p4T204RHJaNmZC?=
 =?utf-8?B?Y25NWjdKVE10djlkaDBua2pEMDlhM3N6SlZDWnFqa2pEWHNQeGZmZjZXUEVH?=
 =?utf-8?B?M2VWRE5EUzdTNUpyVnRMNWdWcXFYRG1adkpWR085bFpUc3ZZMXB1NEVaejNx?=
 =?utf-8?B?aTV4OS95dlpsTzNyZE1FL1hQdmFsME5NaE5KWWJCci9VVGRkNWpBbm1lYkRu?=
 =?utf-8?B?QTRRZytTRjVnZHdhc0xCc3g4bVJaSkg1eGltQkN4SlZERS92ckZFSHlWdDVF?=
 =?utf-8?B?Z0h5d0U1aXJiYlR3YWZKTmNZblJJYmpBRnl3TFBscXZXdmxaMWZJN3pqMDBI?=
 =?utf-8?B?WEJTTU13UkZ1VitWUmhaOXRRMTFOMEJZWlZJY3ppNFI1UVYvRDlTTnBFWlV2?=
 =?utf-8?B?YXJEMmYvSlZHcUo0MHAwK3h2RktsK245c2NIWjZYV2RDN1BWT0x6ZjVlckhu?=
 =?utf-8?B?T3pYNDE4dWQ4RmRmWEh1M283NUhqc2x0SGptc1MrT2s1SS9pb2xPbHV1THZJ?=
 =?utf-8?B?ZENKbGRBaW5zaDJBUUZ0VFBSWDR6WTBYczE2S3NBUmNRSFJlWmVkS1l3UlZv?=
 =?utf-8?B?RUpGM1hJdDEwYnkvdWtrSjlaRnN3ZEVqY0tHMXlLbTBjTUV2NWRzeFpuWU1Z?=
 =?utf-8?B?MWtGdEdyTjhNWE9NSnk4UjhYUW9tL0JhNGhMaXorclo1Tm9PZ3Nkd3Z5RXVo?=
 =?utf-8?B?MVh3VEV5WFVsTnpnZjhLN0I2MzZ1eVRGK2phY2JXc01VU29BUjF0WE1vNWFN?=
 =?utf-8?B?MnRpMHp3Z0hvYUVBalAvZlE2M21lQWpENzZzSms4T1hFeEExd1RCK0JmZ2xu?=
 =?utf-8?B?eTlGMlFmU2xhejkwZE15TlMzWDlQakxTZ2VrOTIxM3ZXcDRmV0VFQk8yN2dO?=
 =?utf-8?B?a0hyNSszZHp5Sk1wbFBGKytWZEc4UlE2VkZyOTBZeDF6YlV3VDArYlNqV084?=
 =?utf-8?B?ZmtDdDM5cXdKdWxuc2Z1T2dva1kxd3ppMFk3LzhNbm1lUmlFblo3dllsUHVW?=
 =?utf-8?B?UmNEaWd4cmU2M1JxRzdxRkdyeEVKdXdiaDNPb0dNdlBvMXlDc29PaHZnRFlZ?=
 =?utf-8?B?dmdvVWJXTUJPQjZGQTRya2E5RFlqZVdrUGMyMDFvMmNQNEh3Tm1WZVdrV3NX?=
 =?utf-8?B?dWtNa2FaYndBaFpxZEZhVkNLZHdWMlVtTXNLMVpMWXE5Ly9FYi9JTWwwVENM?=
 =?utf-8?B?VWhaSzZGMEtCeU9wdldUYTJJaHNlK2wxTnFwSHo2QnFNN2V0dWFoMVY4WnNj?=
 =?utf-8?B?NGVrWWg0UW81cjU3TmVLK2FlbmhSMU1KbTRWTGFFQ0p6RHJyYzNoUUZZWnpF?=
 =?utf-8?B?bWVMZ2xnZXhlazhKOUhXZWs0T1JoWUlMRGRwcXpLblo0RlJTK0lGMGZVRnVX?=
 =?utf-8?B?Z0tOWm9hQVJPMUFDdGtLVktMcWwzNnJ5Lzl0bVdOMXVkdW9WY3dlc0E3Yk5x?=
 =?utf-8?B?UE9ad1pGMnlxTktVUHNMZ0tsTm9sVFpIRHZYMHpJc09CbTBjbWg2WTJTcG4y?=
 =?utf-8?B?L0NaUVVlekVYRnlsMHB0blNEdFhXRm9Oa2tidGlTZmxoOUV3ZGN0aUFVVG54?=
 =?utf-8?B?T0haUTVPUUthb1RiWWIvVXNNU0s3NTdWOXVXRFl5TmVQWjBFNUswNTVRNll3?=
 =?utf-8?B?K2loYVpkWGhpOW1WV2dCNndMVnNnUnU3VWU0R3dhUzg3UTFXbXlKbzBpZ05m?=
 =?utf-8?B?VmR2VTE4NUx2MUh4bEFqZkhpaEJrWkdYQTRPQTZrcUNMRklVUnI3MWJ5V3pE?=
 =?utf-8?Q?bzXo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8599.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3ff5d1-7a63-4fbd-6d31-08dd07df3a25
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 14:42:29.0901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U+lv5E5wdxXiDh3iBuZjmjP4RX/szwoJK0RtdY2ya8BcmoC3YMGZLiuARw78ZDXeuo8p9mYVSD3dMuOunxsGhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7275
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

W1B1YmxpY10NCg0KSW5kZWVkIEkgaGF2ZSwgdGhhbmtzIGZvciB0aGUgcmVtaW5kZXINCg0KVGVk
ZHkNCg==
