Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D9DAEBA4E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 16:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3CA10EA5F;
	Fri, 27 Jun 2025 14:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="osyeq6r9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9E510EA72;
 Fri, 27 Jun 2025 14:48:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQOMPGwWOSqPKSFBND3xEuquuU7zUfVbr934ZP8Ghj6Jf0qXs23g+ecaLqKAD3ctU/m1Tj6A7rkCk+WBSqk3HQKcSXPeF4wuZkkina8tkTyHVu26kWD1epSCy4v8mKJLpxNs5NTN/KscqtoVGCYXLQsSH5+1o6UrUc/x8+VrXLxP90+XGJzxWDsTDlY1ITK90f7dEDsspNcLkYVGdlhRMKkCmihUdjVQha8bdw+tluA3NSA6oK5Dlmr6fwC/WwQMomHGFoNtDmkC0ID1qF6YanbcKk+0kEv8aw/qZs6YB+5vqtpwILUfravinz4Z8jeUW9DwNU1/0fsod1c7JZPqKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fv+gIK74qAKWOWwtN/lmSP0dUXMe+35aqoeAPkTDxtM=;
 b=c5RaLeLyQ8yINx55iF1VJepbnJfLsc+QveMTWdzDw9F3HngVZVRCK3dDsUy2CfDv9xBjiVsXpVm1mCLCLe4qoZjUv/8FvzwqTQQEzhtJSLIJ0oWFNbdoRrKe4iK93950rssMc6xeL7lfXwOF8DI4dGzrNj1to+nPMUVVgVYwjlmpjt09Dq2Amdzd4BNBdC0H0GRVTiwM7ripnVlAw/Wh0M7sCQKnrnNTuR29ob4icUKMBsCEK2HNeiIAP6iatgEwesW0F/j+ADvSGOPrzvHDv4Qojpmyad1xeJn9IsCactQ7ve4hb2o1beSb6dHnicF8kRxKAFbb2+HDst4ILcfpwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fv+gIK74qAKWOWwtN/lmSP0dUXMe+35aqoeAPkTDxtM=;
 b=osyeq6r9aDA9fS7drcYS/F6ETpOq0HXwY8K3FWSI+u4RzrJtAUwfTEG7OIFuRm2VkTzOpMgWysWGSKaOCdbNJ7GK85HB3ibDSbybSUp1gwCKaW0ssb6ubndSpe90yDfUb31FAP312bdiZVxKE/YM6DY7RNa5VvV0OwWvzW+Pi9g=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by PH7PR12MB7019.namprd12.prod.outlook.com (2603:10b6:510:1b9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Fri, 27 Jun
 2025 14:48:45 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%7]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 14:48:45 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "long.yunjian@zte.com.cn" <long.yunjian@zte.com.cn>
CC: "Koenig, Christian" <Christian.Koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>, "Liu,
 Xiang(Dean)" <Xiang.Liu@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "yanzhen@vivo.com" <yanzhen@vivo.com>, "fang.yumeng@zte.com.cn"
 <fang.yumeng@zte.com.cn>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "xu.lifeng1@zte.com.cn"
 <xu.lifeng1@zte.com.cn>, "ouyang.maochun@zte.com.cn"
 <ouyang.maochun@zte.com.cn>, "mou.yi@zte.com.cn" <mou.yi@zte.com.cn>
Subject: RE: [PATCH] drm/amdgpu: Use str_on_off() helper
Thread-Topic: [PATCH] drm/amdgpu: Use str_on_off() helper
Thread-Index: AQHb4lw4G5KyG6IgB0GqRGz4+ETU27QXICGw
Date: Fri, 27 Jun 2025 14:48:45 +0000
Message-ID: <BL1PR12MB5144C5766F6D12CE13206613F745A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250621112549751vVGpmB0y4iZLN_I_Dzik5@zte.com.cn>
In-Reply-To: <20250621112549751vVGpmB0y4iZLN_I_Dzik5@zte.com.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-27T14:47:45.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|PH7PR12MB7019:EE_
x-ms-office365-filtering-correlation-id: d5f88874-eab9-4c99-5396-08ddb589b797
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?YkcwQTg4eGhVa3lSNEs2cDdaZkJHOVVscmM4eXE0eTJ6ZkNQWEJYYUJEZUhr?=
 =?utf-8?B?cUlSUGNKSFhYVXM2TjJPT2txdXN3dVRnMUJtVkk3UEVRZUtTUjEvV1poL2Zn?=
 =?utf-8?B?bTd4VHNtN3RxazFNS2V3WU9HQk9XdzZTVTF5bmJXV0Fka0gxeWNTRGZlQkk2?=
 =?utf-8?B?UVlkN3VOY3BtL3NnQTVnNXgxYXlWRTNHTlZFOGFTekZUbVpEdkxWVWFtT1FZ?=
 =?utf-8?B?SHZHdzNWaUFiZ3V4aE1jMk5hMmZDUWMyd1JjRzdCRGl4S2JLZUMrMi9vRHpt?=
 =?utf-8?B?by8xM29NaWRTOEpmT0FQV0RHS0o4aVJvbVhyRXcxZzBkUkovSnhqa1ZSVTIy?=
 =?utf-8?B?R01GMW9JNEgvZWRvd2FjcExnbHcyY0pOemprcW1ZUmhLaXBocndha1YxdTQx?=
 =?utf-8?B?V3krL3lNQ2cvSUM3RnZFdkREbmlpdVJPb0Z5NzZnMFBWbjFXZ1hCRnlSNWp4?=
 =?utf-8?B?cXNZWDhLR1J1OG5ldjcxclJIR0ZISHBQUHlQS3ZlSXN5R0VPWlYwQmhML0pN?=
 =?utf-8?B?WjRGcWt2WHFaZGtPSGdEV2RjcFEwV2NlRS9mRUhLU3VMc0dnL3cxemVubXJm?=
 =?utf-8?B?YkwzUkh4N2FWNEtPZDBHSmlpTUtITGc0Qmx1T3FCMU96ZC9FSU40QW1kbWVv?=
 =?utf-8?B?VWtSK1kyVXBiWDRNRzQ0MVVPNVhVcjRRM1pmYVNhSnVFaGZUNTE3czhKQXo3?=
 =?utf-8?B?cHNNSEx3UjVDSnR0WVlySURCY2hoNFNNZE11N1Avcjgza3Jvc2dzR2V4Qndh?=
 =?utf-8?B?UTRPc2F3cnZ6NGV4UGpqUkVUMzF6YjYreE9iR0VSTUlmR3VKRGl3Y1hqYXpm?=
 =?utf-8?B?RUdKWFJwbXgwbjJ0MlowY1cvMlVvdUc2U21KclN0cG0rL1p6NEJOMDdrQjdy?=
 =?utf-8?B?YjBnMHBsd1o1aXVBQkJZRHZDVVN6VStnMHFZdUNMWWxsVk5wRUJpVHJQWVV4?=
 =?utf-8?B?NlBLeStNaWNHK0ZIRlFWaHh1MEIva2RObWVrSDJ4eXVnRGZCMXJqaUx5ZGR5?=
 =?utf-8?B?SnVwcHhZaDl2QkZ3Zk1uWEJmYWpzZXRKaDVFK0F2MXI2cE4ydGNnN3IzOWt3?=
 =?utf-8?B?aXRwM1JydlhSOWc5SlEwdWUyNThrYXVyaFl3b1Jlbld0Q1dqNkhUTkthdXc4?=
 =?utf-8?B?SXhWblNNTjNGSGt4aTJXUXlkd3ZGMmo3VFhPeEdXSGJaeFpqdXZoMGxjTFJ0?=
 =?utf-8?B?UEwzWHhyZXhqUjlzWjRYbWhTMTJ2S253WFpFbkswRXpseTNRU1Y0Q0FZVUdX?=
 =?utf-8?B?NGVxS2k1VjhSMVhENlJOc0JQWTJZMmorVzllZWVyalE3eE5kQmNDVEdPdkdE?=
 =?utf-8?B?QnZLT3V4clNIdGJ6V1FPRnczY1JEUTVXQzFvRFhvREFvazRvc24vUjJ1RlQ0?=
 =?utf-8?B?ejRuZ001eDEzWGZCWnhwb0MyaFVzblBwYU5Rb2xaNmF2NVk2M3ZhWHRUaXpF?=
 =?utf-8?B?ZFJ5S1kvOWtDRU1WZTNGaXNYenAxV0YyQlA2cDZhQ1JTSFRBR28vb24xRDNR?=
 =?utf-8?B?eGcybFRMTElSUzNTcHExaFlwL3RXK3RkcW9IS3B6WFVGRHYzRDc1LzhlTmEw?=
 =?utf-8?B?VFFQT0dtWi9rOHZGc25iRmg3REp0SnRQYUs1WlVGTnRJdjVoT3FDb0NSZFdG?=
 =?utf-8?B?WXJwa0hhRW4yc2J0Mk05cktFU0Nhbkdlb3dDbGszSHlCZFRublQzbERmNW0r?=
 =?utf-8?B?UUtTazlna0dwUDdjYkgreVNBWVE3Y2dKLzJVTlRhZ2E5ek9qeXp1QjgwQ2VN?=
 =?utf-8?B?eHUweVJuM2ZCWjZCb3pJZmJud21PREk4R2s5S1d5YU1ma2xHMlZ1bjI2NjVa?=
 =?utf-8?B?Mk1Obm5ZMVBjS2JmQU1XVno3TnFMWkxMa1kxeVFoZ2c4MXlRZHU4ZEU5NExF?=
 =?utf-8?B?NXNWUk1oMmY1YXlrRFZVdDB5dlU4WmxJNWppMC9BRksvT05NbmxBNGtUMzIv?=
 =?utf-8?B?aWlCL2FiVk5pbkhHQ3VnZ0htd3NNL1gzQ09xaGhNVi9zTXo0OWdpRkFEZExn?=
 =?utf-8?B?K2p6WTFNL3VnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djFjL05xU1R6RytIT09YUXpwazFTZGJwL1VBSWVxNEYvQzFPSk51VURSd1hC?=
 =?utf-8?B?UW5ReUFhOGVaVU8yb0c2YTkvT3JNSUdYS25yeGExQjVvRTRrT0Y2UU9MQzFR?=
 =?utf-8?B?aFN3dzBua2pkTi9rQVpjMHIzR3I5UmordWNKUlFNUUpvMTR6aW0xWkVyV3Rx?=
 =?utf-8?B?RlRhRHlwUi9OcGh6bkc2RGFKYjRjUUlTaG0xS0p5SUljaU9XRUdmSHcxRXJK?=
 =?utf-8?B?cEU5MndNRmtLWU5IQWVzZDkzeUpGTnJ2dDQ1VkRrNVZwZm9OTDlrckllaDJ4?=
 =?utf-8?B?Nk55bkdhNDBibzlTRWs2cHFla3FVcDZITm96eCtXdXo5NnJ5QitDSzhsS2VD?=
 =?utf-8?B?YVU5K2dUZ1NrdG9jSERuT0ZCWWJ1SkxxUHo5YmxPeWEwU1R4Y2xubGdDR25S?=
 =?utf-8?B?RlJPZGR2eVRkaFh2RDV0eWRxMnJOdHpzRUhFMWlrV0VqMFFQMkxKSHJmZS9V?=
 =?utf-8?B?VXFYVmJSbi9LenlQOWtWU2tPVzFleWlJSjhvU0NKdFlRTmVvWVVaeFZURHZQ?=
 =?utf-8?B?ZG5IUE1GS2xqMEVtOUt5VG4vZDRtQTVmRGthOStqUFBpb1gzbGVLZ1FHRmNJ?=
 =?utf-8?B?MmpqN3QwZXR5YnVlbzJQak8walY1ck1PYWc1SGFET3M5RWF4TTVZRm9veHFH?=
 =?utf-8?B?UEs3RUJrbGNOZWFwa1Y3SXJaZElUYjRMWDBlQVYyMUljM3ZnRTNWSHQ3Uytn?=
 =?utf-8?B?c01PNUcrbUF6a2ZlWTFFa3NCbzJhTk9JdnBsMnY0Qk92b2lMR2lMMVR4R2hz?=
 =?utf-8?B?WGs1aXZOdUR2S1l4MWhDeTZ6blRpYTgrYnVGL3MvOXZoL3JmUUJlblYvdWN4?=
 =?utf-8?B?ZXRQbHg0SHdtYUtENmhJNUJwRVpMRG5tVjBuSDZEV1hSSU5LVmNCS0NNaTQ1?=
 =?utf-8?B?MVJRVTZWbDRGLzhKYmZJZzNOMzFpZzBNVEczV3ZRanJmUlRodkR3T3NjZGN5?=
 =?utf-8?B?YlhEWWlwQklLa09TZnlyN3pMQmhvK1VoUHNoTzlmYTZ0SUxoajdjWmIyQUNa?=
 =?utf-8?B?dUNyTTY5cHB5c084M2ZpbzVhV1RVNUwwWFU0a091S3FKYjYrVm53OUtUUG9w?=
 =?utf-8?B?SW9Gd2UycDZNWEFXV0E3THRNeXZuSXRDYkJZYklJRGwyeUFYTG1jSWZ6TDNa?=
 =?utf-8?B?Y2JCQjNkOTRCai9nd05ueGhnYWl3OGV0UE1ycnZEZ0owNTU2anlvdVFXMGI0?=
 =?utf-8?B?c2R3SVptODhOK2RJUGptcnIwVjU3eDlOdVQzVGNLUy9WM0VNNFlaSmlkWXp6?=
 =?utf-8?B?UjNTamNzSXRmdkwxYmpRaDlaMUVocTc4ckcwVVd5U0dYS3dTOXhVQk4rU2xs?=
 =?utf-8?B?dG1KaDFhZG9BY2RCL1d6eFdJMmJHZ2lBZGdzUDFLOU9mMTAvSTZRTVcrY3R1?=
 =?utf-8?B?ek90NzlERFlvTzQybkZ4OHJ5clkwcUdHcmVBRDhhV1Vtd1dJNnJDQ3pFMXFT?=
 =?utf-8?B?alljazhhSWxlc3hPUnkzR1VEZzJvVFJlbHV4NHp2b0d0UlBpVGtNejhmNUd0?=
 =?utf-8?B?Q1E1dndBeEIwMWNSamFNZW1FQStDUzZQMnJ5Y0x3d2o5UEZob1hFVkZhWmJy?=
 =?utf-8?B?Nm9YcmJwQXlFTGxxR2gxYTd4UHE3amp3QStZWHkwU1Y2YVlLMnAyQkQ2MHNY?=
 =?utf-8?B?R2VnRWNqSkJLM3hhRDlZL3dyTjJmbnhzZmYwMktyZnZjbFowR25DMkttV2Qy?=
 =?utf-8?B?RnpLajJiSDFzRnZQQkMyQ2FrNW0wZlZOcmMzSHBCbHpLakR3bXRQV045eDFv?=
 =?utf-8?B?anhXNG1HVHZBUytXTk5wMTIvaWxQbWFwb1NKanM1d0Jxb1VGanJHSnZoVHN5?=
 =?utf-8?B?cFVuWVBpY1VaeDF1MFBIS2tXYkNyVkdKQ3ZDa2VWWXBWMHJWZ0czbklVaUZH?=
 =?utf-8?B?VnUzbHdpeW9GOVpERXFTdDAxTFB3V3NpSkVoby92aVlYVXVRY2N4TWNQTTU2?=
 =?utf-8?B?cjMyTXpPS2NWSmsvMzhUZXU3RW9adFFIR2ovek5tb25lK3lBSWZtbUtwSnlv?=
 =?utf-8?B?QmNMZGxQbHpJSldGR0xEZG9TZFlWU3AwdTc4bWNVU0tuZlJhOEp2V2xhMjR5?=
 =?utf-8?B?TThZdWhROVBnL1VXdU1iZkp0MkJFNm9ocC9GaEF4K3hzZG1wT3NjNFZwcTVT?=
 =?utf-8?Q?B7Mc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f88874-eab9-4c99-5396-08ddb589b797
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 14:48:45.1625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CC+s/uw/49TMG+iTYNvfSl78i3Vu5i4mCc4vGjyoCBbsw5Mk8G0kLzM8u+8Ekk6mMUyQiOWhRfGfOF/maNMTRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7019
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBsb25nLnl1
bmppYW5AenRlLmNvbS5jbiA8bG9uZy55dW5qaWFuQHp0ZS5jb20uY24+DQo+IFNlbnQ6IEZyaWRh
eSwgSnVuZSAyMCwgMjAyNSAxMToyNiBQTQ0KPiBUbzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4
YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KPiBDYzogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlh
bi5Lb2VuaWdAYW1kLmNvbT47IGFpcmxpZWRAZ21haWwuY29tOw0KPiBzaW1vbmFAZmZ3bGwuY2g7
IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBXYW5nLA0KPiBZYW5nKEtl
dmluKSA8S2V2aW5ZYW5nLldhbmdAYW1kLmNvbT47IExpdSwgWGlhbmcoRGVhbikNCj4gPFhpYW5n
LkxpdUBhbWQuY29tPjsgWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+OyB5YW56aGVuQHZp
dm8uY29tOw0KPiBmYW5nLnl1bWVuZ0B6dGUuY29tLmNuOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IHh1LmxpZmVuZzFAenRlLmNvbS5jbjsNCj4gb3V5YW5nLm1hb2No
dW5AenRlLmNvbS5jbjsgbW91LnlpQHp0ZS5jb20uY24NCj4gU3ViamVjdDogW1BBVENIXSBkcm0v
YW1kZ3B1OiBVc2Ugc3RyX29uX29mZigpIGhlbHBlcg0KPg0KPiBGcm9tOiBZdW1lbmcgRmFuZyA8
ZmFuZy55dW1lbmdAenRlLmNvbS5jbj4NCj4NCj4gUmVtb3ZlIGhhcmQtY29kZWQgc3RyaW5ncyBi
eSB1c2luZyB0aGUgc3RyX29uX29mZigpIGhlbHBlci4NCg0KSSBwZXJzb25hbGx5IGZpbmQgdGhh
dCB0aGVzZSBoZWxwZXJzIGh1cnQgcmVhZGFiaWxpdHkuDQoNCkFsZXgNCg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBZdW1lbmcgRmFuZyA8ZmFuZy55dW1lbmdAenRlLmNvbS5jbj4NCj4gLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNhLmMgfCAzICsrLQ0KPiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbWNhLmMgfCAzICsrLQ0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNhLmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYWNhLmMNCj4gaW5kZXggY2JjNDBjYWQ1ODFiLi5jM2M4OGQ4
ZTFjZTIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
Y2EuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNhLmMNCj4g
QEAgLTIyLDYgKzIyLDcgQEANCj4gICAqLw0KPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4N
Cj4gKyNpbmNsdWRlIDxsaW51eC9zdHJpbmdfY2hvaWNlcy5oPg0KPiAgI2luY2x1ZGUgImFtZGdw
dS5oIg0KPiAgI2luY2x1ZGUgImFtZGdwdV9hY2EuaCINCj4gICNpbmNsdWRlICJhbWRncHVfcmFz
LmgiDQo+IEBAIC04NzMsNyArODc0LDcgQEAgc3RhdGljIGludCBhbWRncHVfYWNhX3NtdV9kZWJ1
Z19tb2RlX3NldCh2b2lkICpkYXRhLA0KPiB1NjQgdmFsKQ0KPiAgICAgICBpZiAocmV0KQ0KPiAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+DQo+IC0gICAgIGRldl9pbmZvKGFkZXYtPmRldiwg
ImFtZGdwdSBzZXQgc211IGFjYSBkZWJ1ZyBtb2RlICVzIHN1Y2Nlc3NcbiIsIHZhbA0KPiA/ICJv
biIgOiAib2ZmIik7DQo+ICsgICAgIGRldl9pbmZvKGFkZXYtPmRldiwgImFtZGdwdSBzZXQgc211
IGFjYSBkZWJ1ZyBtb2RlICVzIHN1Y2Nlc3NcbiIsDQo+ICtzdHJfb25fb2ZmKHZhbCkpOw0KPg0K
PiAgICAgICByZXR1cm4gMDsNCj4gIH0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9tY2EuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9tY2EuYw0KPiBpbmRleCAzY2EwM2I1ZTBmOTEuLjgxZGNjN2ViYWMzYiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21jYS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tY2EuYw0KPiBAQCAtMjAsNiArMjAsNyBA
QA0KPiAgICogT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLg0KPiAgICoNCj4gICAqLw0K
PiArI2luY2x1ZGUgPGxpbnV4L3N0cmluZ19jaG9pY2VzLmg+DQo+ICAjaW5jbHVkZSAiYW1kZ3B1
X3Jhcy5oIg0KPiAgI2luY2x1ZGUgImFtZGdwdS5oIg0KPiAgI2luY2x1ZGUgImFtZGdwdV9tY2Eu
aCINCj4gQEAgLTUxOSw3ICs1MjAsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9tY2Ffc211X2RlYnVn
X21vZGVfc2V0KHZvaWQgKmRhdGEsDQo+IHU2NCB2YWwpDQo+ICAgICAgIGlmIChyZXQpDQo+ICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4NCj4gLSAgICAgZGV2X2luZm8oYWRldi0+ZGV2LCAi
YW1kZ3B1IHNldCBzbXUgbWNhIGRlYnVnIG1vZGUgJXMgc3VjY2Vzc1xuIiwgdmFsDQo+ID8gIm9u
IiA6ICJvZmYiKTsNCj4gKyAgICAgZGV2X2luZm8oYWRldi0+ZGV2LCAiYW1kZ3B1IHNldCBzbXUg
bWNhIGRlYnVnIG1vZGUgJXMgc3VjY2Vzc1xuIiwNCj4gK3N0cl9vbl9vZmYodmFsKSk7DQo+DQo+
ICAgICAgIHJldHVybiAwOw0KPiAgfQ0KPiAtLQ0KPiAyLjI1LjENCg==
