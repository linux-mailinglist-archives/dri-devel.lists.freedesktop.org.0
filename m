Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BE7A08569
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 03:39:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB74710EF7A;
	Fri, 10 Jan 2025 02:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Yp7PTUKP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8157210EF7A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 02:39:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGMe5z02GZ/1kS4jLf2w3qQ5HlfqmvhDdgvbmr7GFKDI8oT2s0j0fIPc/Q4f9eThnhdprnM7Yz/WdPlQVWa5XrCewOGb2GItmSn0G9//a21tr9L3o9rMDrEuAEUJBd3lpQ6YuM2Ucw7gqAEyQNTEibxHKaTbAhXwiLTb2bc3XegBgfPL7KuE16jzMFAZ9ia0SLFJwHLe3hbK1fbo54bx6uSjlaL9NK/BLkRYUSig1CAXeJmLcFE58fcWPUdv0eVl8jnzjO19h9SapYdcHf0E+snxbFiwRF+vVDyUO4a0gfu3j80Ak3AueCYaXrsqq2xE+QmgRLrdCqXUgBcn5LlX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vlhn43xrkguj5LbI/3EDGnh1910244IOMvpVvfqDSVE=;
 b=V2L28QGScf3pDVXEUj7OHmiyJ8Bsr7dYT+UUeZBDk6mbroYZ5H34l3uWH+Wl0JGPrr1HsiyI+blmfXQneKQ97YBr0JRHpYoEBZFCEstK1cCGt9uHfyEP3oid64LqMo9T6UEl5sMffW3BQvFpUjP7Eu9ZQTCOVrjNxgnpb2u13vuz4SWfnZNw/Fps2Th5+ZAUBS/l7a3QFYpc+N15qH+hLwU08BlgQwf1Pfjr8PjyYGjDR8WiGGtxIQpCvfCJFPaaogHOdXYxChZOsLBy2h+eHA3TxVZJun0rTUmIW6LFxrDg4yfeX56LA/mTBNYpDt63NhHlh+vdWTPD+O98ILhD7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vlhn43xrkguj5LbI/3EDGnh1910244IOMvpVvfqDSVE=;
 b=Yp7PTUKPNWOFo/nKmzGzbma+q9bGlEBg+lQdPM/IlF54gR1URMP2L//tB/9mjMZHSbh/uRzAxn0WOSiNOF0CKw5Sl8R8yT7uVblRvZ1/lVQqVNIyuvB+kCUbhjVkq4UrJn30c9DRv0Hsd3u58HuKYj+P1NNuYQNtBVH1fY6L8T8=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 02:39:02 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%4]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 02:39:01 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "lyude@redhat.com" <lyude@redhat.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "imre.deak@intel.com" <imre.deak@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Subject: RE: [Patch v3 0/2] Fix drm RAD print
Thread-Topic: [Patch v3 0/2] Fix drm RAD print
Thread-Index: AQHbYwiHFvhKOkLcUUuffXriO2WYQbMPSqRw
Date: Fri, 10 Jan 2025 02:39:01 +0000
Message-ID: <CO6PR12MB54890DB57EA99299CEC7021BFC1C2@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20250110023618.66401-1-Wayne.Lin@amd.com>
In-Reply-To: <20250110023618.66401-1-Wayne.Lin@amd.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=c742a6e0-ed5a-46a3-890d-2c5b809db9a6;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-01-10T02:35:51Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|CH2PR12MB4198:EE_
x-ms-office365-filtering-correlation-id: 9d70eca1-3d05-4f29-a3f4-08dd311ff146
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MUZVWnc1QTdFV3hsalRqRTB1SUpOK3dVQzNWajdlWU1SWldEM3Z3WmtTY0JM?=
 =?utf-8?B?ditzSlRDb3l5MEtXS05haEZqaUdzVkM1L0hBbkM1ZVk0d0NiMllhTjBjb3p4?=
 =?utf-8?B?K1JoV1VlTkFtdzh0V1RsanVyVmUvN2kxTUpwY0xjVnBOSWZWVVo4VEdrSzNT?=
 =?utf-8?B?RE43REVJSm5QcUhRbHdTM3JaaDdEczU4ZEhzdFptZzcrTXJIejlHNHVYaFox?=
 =?utf-8?B?eEROdXk2Vi9oQWljdnY1VnR5WlBtUlhYaXRNaHBQT2N3ZmZTQ0JDNHh2TGdN?=
 =?utf-8?B?UzhVNFdEVFNKbUR6TGtyWC85RUtUY1dwU0pmNVdjOVRLd2U5a2VFdDJJSVdx?=
 =?utf-8?B?VnE3RGJtbFVBd25VTVFPb1JEVWNESS93UHV5bXJOTlJYd1Z5NzhVaDluNUM0?=
 =?utf-8?B?R25zcXVyYjBkUDRHdXRCZUZHc2hwdmprSjA0ZVo3MU9HQlJINnc5YW5KTXd2?=
 =?utf-8?B?VUZKY3FvalhuVTRqbmdFV281WTN5V3ZhenJlVC91dmNNc2lLbnFndXYvb3Jh?=
 =?utf-8?B?Ry9wVVRhUldscGtNTE5QNXI1M1FXditsYXJJeHFBVE5SaS85RDE4cTh2NmM4?=
 =?utf-8?B?QzZpWnBFQWNvRloyN0xjNGxWc0ttVTdhZDY2Z1V6b0N6bnQvSmx1MnRER3pP?=
 =?utf-8?B?bjB0UkdEWkRmUDRackZUM2k1ZUR2d2VnMDE0ei85VFVHZFRGbE90aURmWXQ4?=
 =?utf-8?B?eGp2OUpWSGp6MU0yWEVudnEzZVNGNDcvSk9UTTJ4UlB5dy9sbTA5WWZpTTN4?=
 =?utf-8?B?a25WMzNJcElPSnFGRC9lNHNFU3B5T250WUIrTE5WN0x2SFByOVlwbFZLaVJ2?=
 =?utf-8?B?THEvSFdFYzl2NE1JU1Q4bjFuYlNUcTQxdlF2TFp1a3kxcTIzVTM1TlJBNlZv?=
 =?utf-8?B?SFphdTBObU9IMFlCdElGRVV2VnE1ZGpRNUhsc2VjY3hNK0orNzAzM2l5YUlV?=
 =?utf-8?B?VzJGNVI1SVpNcllCVnRneXc4SzMvYnVLUHEvb09LQlNicHJjVFVqV1VSVHRn?=
 =?utf-8?B?Qy83SFdqanQxNmZaZlVRZTlXNkF6VTkvQjlVYzQyRExzZWJHR0c1TmJpL01G?=
 =?utf-8?B?cEc1c1pXRy9vVEVDQ3ZGdEo1Sk1qWVVTWFBHd0tkTFFnUi94eVRTRXNoVnJq?=
 =?utf-8?B?SlZYNWVuRzdBaFA4LzBnR1FxbUcyUjVyUkQxS2YzeTEyS2NHT3NHKy91VCsy?=
 =?utf-8?B?YjVSZjFjVGJsNVV2dW5nZWtGNTY4ZHR4MlFZLzQwbGtFZTAxZkY4VEM0ZmxW?=
 =?utf-8?B?ZUEwSldUSjZWNFZJS3JacXI0aDRoUGFMbitwVXRXdVE3TGZ4SEM4R2VpdDNw?=
 =?utf-8?B?cm1zMnUvS29JdFBVbmVuemppNHpBM2ZuRXpRM2VIQmh4MkxFQ2MrSEhXc1NC?=
 =?utf-8?B?U1NJS3RlUElFM3hWMVlhWCs1UFB5RkNkOVBzL2VpRkZxZ2JSOFJ1QVZvdktx?=
 =?utf-8?B?bHEyejU2VDZTOHB3Y3I1L1U3Y00rS3haUzlra1hTL1cyVnEzc2xnWWlqNG1F?=
 =?utf-8?B?U1VSZ3lEUFVLbW1oYTkyNUVldWJkYVcvcHFvSnkzaVp4WEhnUnJQaDhHM0FD?=
 =?utf-8?B?V3JZSTdVQ2psOTlHdnFlUTY4aEZCbWVhUC9xYXV2aW5IMk9mUGRQdU5YbXln?=
 =?utf-8?B?aUZnZlhVa2VTUHUrYXhTc3E5Nm8vSDRPTUV4TGNDTm85U2tZK2RVWitHVzFQ?=
 =?utf-8?B?cDVOanJOdFhMYTVzUkJyQWtSaFVLQ3kzQzR0N1N3enNGMXFteUVhRUIwUG1S?=
 =?utf-8?B?ZlZhOEpvSnRWMVBFam83WlRPL0VZNmtEMFVrTUVheHdSYUhZZUlDY0p2aHJN?=
 =?utf-8?B?dmRob0VjcFh3TGxSY0hRRGZ0MDRQa3ppWXBEMzRWeTl6djBEZWs3YW4xNkdj?=
 =?utf-8?Q?yA0rO89L4p7pw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjNXL3IwQmRNa3FZalJ0d3lFckFZN2tadUM3K3ZlRHd2T3ZMZEZsSDdaMlN1?=
 =?utf-8?B?QnZpcW9BQkpnRWFIZmVNdDZWWkNFczA2RmowN1gxRWtIQ1ZiV25NQmgrR0I2?=
 =?utf-8?B?WGE0RFRmYTNGYWFCUFZIZlByWUorY21yUS9uREtoT0diTFVPQVFJamFNdjVa?=
 =?utf-8?B?MjdHMmpjbEdsVWIwTzRFbkRzZ01TcDBaZTRDQ2cyY0dyMFo2WjM1YjU4Yity?=
 =?utf-8?B?K0U5dzNkSE5MSS84dXM5enNIdFF4ZWRhNm9KemIwTDlpcFg2UGtuYW5ieXY0?=
 =?utf-8?B?dXUwVnRyQWJ5R21iNzdsYWJ5YTl1RXk3L2t6VTluMExqTFFZZlRSUktCdnQx?=
 =?utf-8?B?NU5TYnpUaXdDSzE3RUt5QmFaVDh0YndUTTF4WmhkQ1lTLzh4MGh1Mm05UnJJ?=
 =?utf-8?B?cmdLc0Q4N1pGYXBLL1puRHFDK3Zra25Wb0FjcjlHMk9CdjAybmkwTDEreXdH?=
 =?utf-8?B?cGhGWms3ek04RGRwS2U2MmhNc2NRQ2V5ZFk5VkZWTDdwTEVoTlg3RXlJWHNM?=
 =?utf-8?B?ZzdGdllhdUlzOXFtTG1kQis4eXRBM1N6UDZ5enZ5TzBYNlpVYXZrMjIvMFR4?=
 =?utf-8?B?Nzc0WWJ0Z00vTFU2dXlxakNzMlI1RUQ2aUtXQUE0M3h2WmpHTk5QRjZmU1hN?=
 =?utf-8?B?R291VzArNmRPaHJwYXk0NXFobmc4ZHEwdytsUHRWQ0dWRUdiWW9qT2FvUnhl?=
 =?utf-8?B?UUZnaERuampCV0lrVzFLb3dXVnNqK3JETjlCcWt0eVlxcG1xYzc2Wi9rWVEw?=
 =?utf-8?B?QXo2SW5tc1lRRzNlZDNRR3V5K091WFdZYVEwWnJhSWJET1JsTFBleE1pbTRz?=
 =?utf-8?B?Qi9zazkvSG14a0l3dGxNcExvU0t3cUVpemF1UU5pRHdUY1pCQ2EvVTJDbWQ1?=
 =?utf-8?B?c2NCK0VrNHBuM0RockVYb0ZYNFF3U0NvcWtFQ094TXhGYW1rMGNiRFNJWUs5?=
 =?utf-8?B?K1VOLzlWZktxUjV0WktQdmhGNi8vcnZUQ0pxUEQrS3F4eVZGUXV2cVQyNDlv?=
 =?utf-8?B?b0xyVFNWRGpRVkdibjhKN1N5QXltVVRZYlZJaFRUMmh0aVJvRTBLbmh5bVdF?=
 =?utf-8?B?QzI5alRaVGgzMUd2N1lRT21oQ0dwNnRxVng5bEFoVm5BekJKcTE1b3FlYUU2?=
 =?utf-8?B?c1ZiZVBXUEtUSDh1d1VFNkZSOTF5Wk82L0FFUlFIaHlSekhwMjJGaVpqbys0?=
 =?utf-8?B?RzFyejZ3ZVM4UWFScVZqRUMyZk1xWWh0WXdLN0lZWGNKQnhRUjIrN3RkUUs4?=
 =?utf-8?B?SGorUnFCZXNkTjFOZTh6REFNSVBPMXllYzRqYzJyKzVzVjlMS3JCckh3SU5u?=
 =?utf-8?B?aU9rN1VFSUhXRld4ait0QUFuenhYU0RsU3JRRDdSeXNsRFBlSlZwbEdzUG9E?=
 =?utf-8?B?ZWtVNmkrWCtDSTI1aXQ2TWFOSVd4TVdOaVhtRGtDNld3NE51WEVLRlpJK05Y?=
 =?utf-8?B?Vi93WEt5Sk4rR2VMQnU1ZWFPTHg1U3A3cVVINW5ocVpYK25mbFlhZEFBejVM?=
 =?utf-8?B?OEhZYzhVYS9RUlpkdVg3WENzK3ZJT1FYekpXbm5UMThpRUtzSDV4cy8xb3Zr?=
 =?utf-8?B?c0dqbnZ6YmwxQWpGaldvaFdXeFlpMHV6TEN1cWxFQXJIMzQrZzBtUUlaeHZp?=
 =?utf-8?B?TlJiQ2puRnNYcjRNOERHemxqMEJsUFJ1QzlBbDZrdWJBTGdPS3YxOEgxaWVo?=
 =?utf-8?B?U0h6byt6Rm80UEQ2QitrNURoSFBUT1VOb1F2V3A0RnRCbmVtb2lKZVZZYTVO?=
 =?utf-8?B?anFWMThoUzE0N1pRZmZocC9vMk1paFJjNGQ1NnZZVEZJRkxRYTczbmQvKzA1?=
 =?utf-8?B?aGM4ZTltT0xSTXlDcjUyTjN5eDZSY3B0ZFNaYWFlSCtHSjNiSXRvd29OS1J0?=
 =?utf-8?B?QzFsOU9ZaytuSk9DMVdmYndGdFlIU3lwdSs2Z3pkdkNaSlhHRFFuR29OUWVs?=
 =?utf-8?B?dFJMaWpRUXBRNDcyVmt3aEhSR0dQby8wVlpyeWVUdXdWR1p4K0NRL1BFWWxt?=
 =?utf-8?B?K0pRRW9HS1VtT1BMeUhEYWU5Rk9pT1J6S3hDUmpONDlmcFgzMFZOaTRQRTFz?=
 =?utf-8?B?YWNFc2EvWDIram5FWldOWHhQejVCaWFZS0FnVnN6Wkw0UjU0YUdsbGdEaEMz?=
 =?utf-8?Q?shy0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d70eca1-3d05-4f29-a3f4-08dd311ff146
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 02:39:01.7559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E7lFLF8uxSCCka8e855+No6zbb9NY6PhYKcSZo3CijzxpZJ+BLMWm+zSifivoBfOUPZptQ0nY/Hx6T7jachJIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198
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

W1B1YmxpY10NCg0KSGkgTHl1ZGUsDQoNCkNvdWxkIHlvdSBoZWxwIHRvIG1lcmdlIGlmIHBhdGNo
ZXMgYXJlIHJlYWR5IHRvIGdvPyBUaGFua3MhDQoNClJlZ2FyZHMsDQpXYXluZQ0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFdheW5lIExpbiA8V2F5bmUuTGluQGFtZC5j
b20+DQo+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSAxMCwgMjAyNSAxMDozNiBBTQ0KPiBUbzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogbHl1ZGVAcmVkaGF0LmNvbTsgV2Vu
dGxhbmQsIEhhcnJ5IDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPjsNCj4gaW1yZS5kZWFrQGludGVs
LmNvbTsgdmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb207IExpbiwgV2F5bmUNCj4gPFdheW5l
LkxpbkBhbWQuY29tPjsgV2VudGxhbmQsIEhhcnJ5IDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPg0K
PiBTdWJqZWN0OiBbUGF0Y2ggdjMgMC8yXSBGaXggZHJtIFJBRCBwcmludA0KPg0KPiBUaGlzIGlz
IHYzIG9mIFsxXSwgd2l0aCB0aGUgZm9sbG93aW5nIGNoYW5nZXM6DQo+DQo+IC0gTW9kaWZ5IGRl
c2NyaXB0aW9uICJkcm1fZHBfbXN0X3RvcG9sb2d5X21ncjo6bXN0X3ByaW1hcnkiIHRvDQo+ICAg
IiZkcm1fZHBfbXN0X3RvcG9sb2d5X21nci5tc3RfcHJpbWFyeSIgc28ga2RvYyBmb3JtYXRzIGl0
IHByb3Blcmx5IChMeXVkZSkNCj4gLSBBanVzdCBjb2RlIGZvcm1hdCAoTHl1ZGUpDQo+DQo+IENj
OiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+DQo+IENjOiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBDYzogSGFycnkgV2VudGxhbmQgPGh3
ZW50bGFuQGFtZC5jb20+DQo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPg0KPg0K
PiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNDE4MzIvDQo+
DQo+IFdheW5lIExpbiAoMik6DQo+ICAgZHJtL2RwX21zdDogRml4IGRybSBSQUQgcHJpbnQNCj4g
ICBkcm0vZHBfbXN0OiBBZGQgaGVscGVyIHRvIGdldCBwb3J0IG51bWJlciBhdCBzcGVjaWZpYyBM
Q1QgZnJvbSBSQUQNCj4NCj4gIGRyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9kcF9tc3RfdG9w
b2xvZ3kuYyB8IDMxICsrKysrKysrKysrKystLS0tLS0NCj4gIGluY2x1ZGUvZHJtL2Rpc3BsYXkv
ZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICB8ICA3ICsrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDI4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPg0KPiAtLQ0KPiAyLjM3LjMNCg0K
