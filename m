Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9C18ACF86
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 16:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AC6112B71;
	Mon, 22 Apr 2024 14:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="CVoS+AEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2076.outbound.protection.outlook.com [40.107.249.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0148B112B71
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 14:34:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPkSUY5y3k4KsKSLEFQGDJNrGziKZ97xKsqyVwklyHAkIIexMJfjFbeqKP+R/2hUqiYi+0PE8hjhx7zRPG+Uis+QW68EUOfb1DxFZN0LiRJspv+BDWnL5kubZkEgk807LkngdvQabHjcXKOAMuEcHvpDiyGqEBdP8oeTgA+ELC2YDxnbw5EOAXOUui+oFL1njvDQLzr8fLklVFnl+kGW6ruBrz6ITjWH7HqY04TY3URfStQOBaf/m5i86pZb8q95eRA8yOuinBQlfHUN/i4k6q3gNzeK7wX6bxVaG6z98m+5a8u9PLW/Iy8ziRccQa/FlEdDU+nlcsEqEQbUdEpPrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EATr0ba9cDTJVATWCDjfhdkGD121xlN0u/yahVns2zc=;
 b=f8S66jf3x70pcs7lT1mr0hZvUw96U//xUH7cbEc5QeBIEKAUyCg6BiB6JQIjI4aIF1X+7IDnI1N0Y4baGx8APsyMeMF0Nn7B2DiwGhl0z1MVS12aMw211ffDUoUD0CvoraYApQ7If6Lwh0aR4zF+kTk+ibgm28PZetaJumN9yklikYwut7v+t703OuSXZjlaOFAALGVTQOjk5k2nGBmNI8FWHTY+3EVWwQZWS4iBwHyjIhsKGlUtxFsjadx4k2P/7Mhx8dEFtsSVVrx0tHX0xrFXiIr5JURLfEH2xfrzON//2MVqZ9VkDc3VN6GDxDJM6aVuha6sGIa3buPUao5dnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EATr0ba9cDTJVATWCDjfhdkGD121xlN0u/yahVns2zc=;
 b=CVoS+AENt0wOtI2Q1KWdz2ty1SHXQFrO/JUBllAeG/110keSCnB120ErjvQEvePIh2PgCo4OohgVMreQdrcjvCaQFb1IW7zpmCVSDdGH1DIUvRVBVtJNmeiuqY+CIKSCMzC+WMGWl4HMJCkbENgeLTlQYDvRdPyUM2bXrRkq18A=
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com (2603:10a6:102:330::10)
 by PAVPR02MB9747.eurprd02.prod.outlook.com (2603:10a6:102:313::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 14:34:35 +0000
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::a909:d7c8:d64d:8c1a]) by PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::a909:d7c8:d64d:8c1a%4]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 14:34:34 +0000
From: Johan Adolfsson <Johan.Adolfsson@axis.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, kernel
 <kernel@axis.com>, Johan Adolfsson <Johan.Adolfsson@axis.com>
Subject: RE: [PATCH 2/2] dt-bindings: panel-simple-dsi: Add generic panel-dsi
Thread-Topic: [PATCH 2/2] dt-bindings: panel-simple-dsi: Add generic panel-dsi
Thread-Index: AQHakZjqxmgDfsPuIEK+T0Zct7BqebFupm0AgAWz0NA=
Date: Mon, 22 Apr 2024 14:34:34 +0000
Message-ID: <PAWPR02MB928111F5EEB4A46B56A89B239B122@PAWPR02MB9281.eurprd02.prod.outlook.com>
References: <20240418-foo-fix-v1-0-461bcc8f5976@axis.com>
 <20240418-foo-fix-v1-2-461bcc8f5976@axis.com>
 <c739a512-9a75-4f48-b5ef-801191c298f5@linaro.org>
In-Reply-To: <c739a512-9a75-4f48-b5ef-801191c298f5@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9281:EE_|PAVPR02MB9747:EE_
x-ms-office365-filtering-correlation-id: 76ab9609-c298-45df-f44b-08dc62d954c1
x-ld-processed: 78703d3c-b907-432f-b066-88f7af9ca3af,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?WXgrOE9tY0tHQ3BqQmZBMmxvZUpvRHVyRTdTaHRYS2VjdDZ3Qk9JYWRKWm1l?=
 =?utf-8?B?VnZ4czJobGMraENKaUdDZ1lmM2tzZ25ZdENqRUlEaFdIVkVUQm5xSmQ1eUJK?=
 =?utf-8?B?bm45Qko1YnRLbldyaGh6QWtZemFnTkk5dUk2OTdzcTZ2S25YeXB4SjBOYS9K?=
 =?utf-8?B?S0lrTVM1Q2R6T0JlaXNOSGxpTEkwQkFaSjgxRFFNRktoZURTN0hUVmx1dDhi?=
 =?utf-8?B?MDZzVnJKakJBMmJwc3FHWWY0bVRYS1BPZHY3ZmZIUFJIV09oZCs5VW1CUnQz?=
 =?utf-8?B?NFpQUFE4NVJJVzN6YlVKNmhKL0NtVk1Fa0UycTdVNGc0aEpEbjBRV0llS2dB?=
 =?utf-8?B?Tkg4ck5CV3FEV1VsNTdMaDhjQTcrNjVVY3MrQlNsMXJTYmFUd1Yzenp0VkRX?=
 =?utf-8?B?YS9PTk4yakhDZi9vZTlZUkp6L2lmTWZXMnZORTNpZWJveFIxK3JXRlJ5UmJr?=
 =?utf-8?B?VGFFRk1aeVNORWsydmtMUkYwTkV2enJaQzQwZnd1WHBmR21Jdm8zTFhGL3Jn?=
 =?utf-8?B?UnkwODNiaGx4N1Znc0xTZkdyaTBHdllORW5qQ285MklSZzFESk9mL0hRMnFh?=
 =?utf-8?B?K01JRlNzcWp2TWlDRWhBVkxib2k2Sll3dlY0MGx2eklUMGwrQkxsSDN3ZEFx?=
 =?utf-8?B?S21DR2lSandyM3pyOStEaUVWU1NubkVDRnRSd3lvN2tORVFEeHhqSVlnWVRB?=
 =?utf-8?B?UVBCYzEyUThCNTNSRzBZL05ROEM1YVpVMXB3Mkl4cmJFWUtXYjdOcHl6TGRE?=
 =?utf-8?B?M29CMVFER01oZXFGVTFydmNEcnU4dVc3TEhhS1pOWC8yN2cyMk1ZN3MzZW55?=
 =?utf-8?B?VW8zTTdmallWd29ZbVNRbDdNTnM0cTBaV3czQlBkcjZFbDUyQzArU2lJV1or?=
 =?utf-8?B?cVZNakJNS3B5YWVUWkF5QTZWWTYyY1hTUUQ4b3ZDdVI1aDNLUDdCYmhMbWdL?=
 =?utf-8?B?SnNHTUthUGs0ZzN4ZjMxaU0vWS9Wd1dkRE53VE9wTlBRQ0dIYm01MmZ5UW1P?=
 =?utf-8?B?WGVyVlJhUXEzY0hEcGNRd3ZXUmVIUDVXTU0vV0p3WnpXUitVVWIxY2hxaVRw?=
 =?utf-8?B?N3NKYStCeWJGT3h4bUlWZDBaWlV1eS9Rc3JPUmtxU3h6a00vZVprWGorOW9p?=
 =?utf-8?B?VTdzczZDTlFGMHowc0VqWWFrL2pLamZSSnQ1Nk94UjE3V1hKNVVJVkhpa0Q2?=
 =?utf-8?B?L2dzdm1jakdWaWhhalovSGx2Qlc2b1JpL2dQT3lpSDNTRFlMZFFsVzM3UmZS?=
 =?utf-8?B?NThaTTF2UHh1eEhaL3I3MmdPRkFoUG42R1BFdFZ6T2llTWxVUHJoTnJ5UXcz?=
 =?utf-8?B?L3N1L2s4VUxWRG1yalpLUDMvRUNJei9ObmxkVWxSb0pPUHNOMTdkRE1peGVv?=
 =?utf-8?B?K3dUdkRxQUZlSURQQ3ZQdXJmRkFWd29MbGs3dnRUSHl4blZhdDFudGdpejBw?=
 =?utf-8?B?WUJuenh3encyTnNocmZLRXVSMURXWFdhK3prNFhhVk5wamdnNlBneFRSZ2pv?=
 =?utf-8?B?ejBpeUFPNVpqam9hUU1LWFVsL1ZBbkxPY2x6TThqbjRXZWF4dkJrS0pZT1N3?=
 =?utf-8?B?RjJkWDl4Vytlckplbm93WU9yTFhIR0l1cWtYUEd5eEJuL3ZYSFVqdVluYXRQ?=
 =?utf-8?B?ZzRIKzVDNzRNSnM5UUx5ZUpWaVRhaVU3Ry8yaUFqSzRRMTJKOG5DaitzMmJR?=
 =?utf-8?B?Mjl1cVd4NjNHcm5MbmxmdFBFcFFuMzJwQll1Tmt0WHdYSEN0UzZrRVZvcHNP?=
 =?utf-8?B?a2w4MndtVVFIcDhGRW9iMTB0MENRYTZ4Zys0TXdscE5XcktOY2hQZWpmTEd4?=
 =?utf-8?Q?kjFC/I5TYf+ROMy4NCu7r8TXAAw3FkN5/qNg0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9281.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007)(921011)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmNFVkt0QlhrTVNRZWdNZW1FN0pndzlLV1RSaVVzNHh2ZENIcSs0bFVzMHNP?=
 =?utf-8?B?WXliMkxRbTd6MmQ2UXpTT2RXRUdsNE5XM0JMb0lZODl0UjdobDk0U0xiZTNs?=
 =?utf-8?B?L3VDdzN0OGJvZnp3QnZ4OFpmWXRWWkRaTy8zZjVmS1FPQ2JkZUZDYjhhQ25C?=
 =?utf-8?B?dk9JOHJDSThTMEJwNjFjS3l2cTlCeEFYM3QxU0hodWtNUFZvNDdzd2RBamlS?=
 =?utf-8?B?TjJqM2xIMkpiUlMvZTdJc1U0R2JrNkJuOVllVUJ0WHJnQ1hsNC92cGtRQ0RP?=
 =?utf-8?B?U0RUcEJzN29DUmRsTmIxeWhYV0ZoSUdvQ0FoNjUyWjVkZ3lOWDdaNks1M2Rr?=
 =?utf-8?B?Z1E3a1pMcEFwT21WdFN1U1dKdVYwNlVPV1hXMFhFbmw0MUNDdUJYeGgyZkhL?=
 =?utf-8?B?QTQ0czhjekUrZGdvVGRqVmUxd2wwMWNsbnJpWmZ5b054bVpSbnllNEFnNElr?=
 =?utf-8?B?RWZzQkJSQjN0VmZqU1hMbzdrYXhDV0ZLdXpZWmNGcDRwMTlCSVozVkxwZ3ll?=
 =?utf-8?B?TDRGQzY4ZnA3QWxzQWFkVFhDcXowVjZnUlRRS3JhQ0ZqMkhNN1N4djJydnVt?=
 =?utf-8?B?TGFhMXA2OS9JZ1RjREVPb0R6bjVZdUVlZ1MxM2ppdkpVSlZ0V1VnTnpPb2Vv?=
 =?utf-8?B?Y3VuLzFOem42eWowaDBDVTl5MUR6bUxvQU4yeDhjSlRSQm9BSGt4MHIxMnZu?=
 =?utf-8?B?cnR6bFpqQVFRcEVRWk14ME1xekZjNmJoeTEvMlFncHFjbVVEVEVzOXVUK1Bl?=
 =?utf-8?B?OXVaMlg1akZKczRZYkYwTG9hQTVMVW1xUWdKTHNOYW5WVWxWcERFeWZHM3pI?=
 =?utf-8?B?ZmhhSnRVbHhzd0xBaHNHUks4VHhrcGRFSnJBdEd5NDNxWU03Y2I1UzQzSWRj?=
 =?utf-8?B?ZVdDNmducFZTOTZsWEZlQng0MVRKdEpONkt2ZG5LdGsydjVKRU8zN2FMNm9N?=
 =?utf-8?B?dEN6cXVrK0lYTVVQSkg5S2VzdDlPRHZ3Y2ZPQkhoT2c4N1lqaUtIWE4xcWRv?=
 =?utf-8?B?ejVPcnRra2RxRWRLOHcyeEtqYi9NUmhZNFJ2SmhSRnd3bTFoZXpuQ0J5aTgy?=
 =?utf-8?B?dEJXQk1OeVFwZGw5YWxxS3Q3SkFxR1ZpTGtkaTMrT2xQM0JSS1RzcW9yaXpy?=
 =?utf-8?B?cytISUI4WkpEQjJGZUR5VjkwZTgzYXlNYjFvK0V2ZlJJTGxwbS93WE1MbzNt?=
 =?utf-8?B?dTluaWdaOThNa21iaEFtWnlLcEFVVVBtM1RIOTJ2U0NQS1hVQ1ZSZis3YmNS?=
 =?utf-8?B?cEgyMCtYS2p3N2hqS0s0NVVWLzdSMUV1MENSVjlyZk9KZmdyK1ByWTJqY3Np?=
 =?utf-8?B?M1pMWW1MU3FvZWwrNDNKaVpEVnZiWWx5K0J4R0VWZ0VCbVFmbEN2eXFJRFVZ?=
 =?utf-8?B?ZksvT2hVQUZodE0yeXplWFRNOGR4NHdFU0tvREllam1uRnpLYVd6SHR2Q2pR?=
 =?utf-8?B?a243S3lCcXpiS01tM2xCR2U4azErTm9GMDNDSERGL3BlYlF4SWN3b1ZNQmlH?=
 =?utf-8?B?ZDU4TGJlZ0RnSVM5WWJnL1RnMDR5SUtmd29HUzFndUpsMGQyQ1E5bkE2UldJ?=
 =?utf-8?B?VWRMekRqWjVFMTF5d3hvWHFWL3FsWTlrQnhtVUFJcEorajBUQ0M2YWFjaXpP?=
 =?utf-8?B?RHhHZzUyQ2VraXdYVGd2dmJIMG04azcyOGRqNVEwSUk1SW9JSmRNZTFXMStB?=
 =?utf-8?B?bG5ObDVWaEd5ZHQ2WFNsRWJUR2JPVnVXUTVkZjV1UU44NkpVNU1jeVk5UWhk?=
 =?utf-8?B?RGxoV0Z6TU0rNGRZWEpvbmZhUlFJVXFCdlJIVERSMFZxamFRcWtxYnZTTnQ3?=
 =?utf-8?B?emE0eFl4Nk5NNkptQW9WNEpFN1ZwOTduNWsrcXdmWDZaYWxZcWwvOERic21C?=
 =?utf-8?B?dmVkRHhUZWF4aTBJWGlTbWZ1R0xVWUVpV2V2cUJ0MlF5RTZzYTJIK0phL2NX?=
 =?utf-8?B?d24xS1FKSTdDTnhqVkVzZ0g2U215UnNUa2dWbStMTldTSlB5M3FNMm9PQVZQ?=
 =?utf-8?B?ZStIaHNUUzczQnZXTndKRWZnWUpjNGQ4NDViQm9EK0RnVW5NVjd1bzJsd3Z5?=
 =?utf-8?B?REY0RjVnbEtxdlRKVzk4MDk5b0VIWmR5b1RjNUhpL2pOVDFJZXRXc2N3dndm?=
 =?utf-8?Q?5TUM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9281.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ab9609-c298-45df-f44b-08dc62d954c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2024 14:34:34.8940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C+7ZJ7ciSBHq8g5H+BM+AmKoReb7ea/OE3BEhIIoR5lLk2T+WwH/3N/6sCZz6Jin
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9747
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IA0KU2VudDogZGVuIDE5IGFwcmlsIDIw
MjQgMDE6MDUNClRvOiBKb2hhbiBBZG9sZnNzb24gPEpvaGFuLkFkb2xmc3NvbkBheGlzLmNvbT47
IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsgSmVzc2ljYSBaaGFu
ZyA8cXVpY19qZXNzemhhbkBxdWljaW5jLmNvbT47IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz47IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5j
b20+OyBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+OyBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT47IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+
OyBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBSb2IgSGVycmluZyA8cm9iaCtkdEBr
ZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBs
aW5hcm8ub3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgVGhpZXJyeSBS
ZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4NCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsga2VybmVsIDxrZXJuZWxAYXhpcy5jb20+DQpTdWJqZWN0OiBSZTogW1BB
VENIIDIvMl0gZHQtYmluZGluZ3M6IHBhbmVsLXNpbXBsZS1kc2k6IEFkZCBnZW5lcmljIHBhbmVs
LWRzaQ0KDQo+T24gMTgvMDQvMjAyNCAxNjowMSwgSm9oYW4gQWRvbGZzc29uIHdyb3RlOg0KPj4g
cGFuZWwtZHNpIGlzIHNpbWlsYXIgdG8gcGFuZWwtZHBpIHdpdGggb3ZlcnJpZGFibGUgdGltaW5n
cw0KPg0KPj8/Pw0KDQpJIGd1ZXNzIGEgbW9yZSBjb3JyZWN0IGRlc2NyaXB0aW9uIHdvdWxkIGJl
IA0KInBhbmVsLWRzaSBpcyBhIGZhbGxiYWNrIGluIGEgc2ltaWxhciB3YXkgdGhhdCBwYW5lbC1k
cGkgaXMgaW4gcGFuZWwtZHBpLnlhbWwgLi4iPw0KDQouLi4NCj4+IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLWRzaS55YW0NCj4+
IGwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL3BhbmVsLXNpbXBsZS1kc2kNCj4+ICsrKyAueWFtbA0KPj4gQEAgLTU2LDYgKzU2LDggQEAg
cHJvcGVydGllczoNCj4+ICAgICAgICAtIHNhbXN1bmcsc29mZWYwMA0KPj4gICAgICAgICAgIyBT
aGFuZ2FpIFRvcCBEaXNwbGF5IE9wdG9lbGVjdHJvbmljcyA3IiBUTDA3MFdTSDMwIDEwMjR4NjAw
IFRGVCBMQ0QgcGFuZWwNCj4+ICAgICAgICAtIHRkbyx0bDA3MHdzaDMwDQo+PiArICAgICAgICAj
IEdlbmVyaWMgZHNpIHBhbmVsIHdpdGggdGltaW5nIG92ZXJyaWRhYmxlDQo+PiArICAgICAgLSBw
YW5lbC1kc2kNCj4NCj4/IERldmljZXMgYXJlIG5vdCBnZW5lcmljLiBUaGlzIGlzIHZlcnkgY29u
ZnVzaW5nIGFuZCBjb21taXQgbXNnIGRvZXMgbm90IGhlbHAgbWUuIENvbXBhdGlibGVzICptdXN0
KiBiZSBzcGVjaWZpYywgc2VlIHdyaXRpbmctYmluZGluZ3MuDQoNCkkgZ3Vlc3MgSSBzZWUgdGhp
cyBhIGdlbmVyaWMgZmFsbGJhY2ssIHRoYXQgaGFuZGxlcyBhbnkgZHNpIHBhbmVsIGFzIGxvbmcg
YXMgdGhlIGNvcnJlY3QgdGltaW5nIGV0YyBpcyBzcGVjaWZpZWQgaW4gZGV2aWN0cmVlLCBzaW1p
bGFyIHRvIHdoYXQgcGFuZWwtZHBpIGlzIGluIHBhbmVsLWRwaS55YW1sDQpNYXliZSBwaHJhc2lu
ZyBpdCBzaW1pbGFyIHRvIHBhbmVsLWRwaS55YW1sIGlzIGJldHRlcj8NCg0KPkJlc3QgcmVnYXJk
cywNCj5Lcnp5c3p0b2YNCg0KQmVzdCByZWdhcmRzDQovSm9oYW4NCg0K
