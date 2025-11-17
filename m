Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8B4C62A57
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 08:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8694D10E2DC;
	Mon, 17 Nov 2025 07:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jm9xRAFg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011016.outbound.protection.outlook.com
 [40.93.194.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D0810E2DC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:05:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVsENvm+BpDwVCaOsBadYPkexSetL2p2BglGonA5n+cFaZtGQM3vOc28Tpnb0g0u7c8XsCVlYPOEfp0s6i1yu40FbsAL2geG2kddT8rUut4ZjQnnLQa4aJzuUiwDJWuynMrR02TfjQHo0cSgN9SFPRD766CV3jb/9AlZrftMKb4Zl3rQyvQYC7FWm/SQ20/CIKhOgcArnYRWbIm4S5Bekd77RsJYy7reillR29iPYMynoIDRp456VFM0RVMgymmuJjUvwGRkvXR9zQskZuuDbgijvQpet8ccDUCLWJSG2JaziQBgpvKhwJeMxMPYvso+yBp6fSvzxqHXJA9MI5E61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTykqG25MyVMc7s9NwoOaGXZqjx7typ1N9+hyvyzR04=;
 b=MuQ5rZkEhKole8BLzCPttDHw5pVLH1QMaaVkJhoFb6WUW82Imb4MBmC/k8hTSiNhZX5TbBw3BRy4xTh9YWFHDHhmny7EYrYDgOq7RnUHBBxR8vzbneRqBHhBeImfxUJnk/VfNukIFtsjNh9Dju7kvQMB0XsvZFtrxNXYd3hk7+cC6Kfh1+ziZkse8jXxInIySvDqHi6T2bRgbSX8Yoyjhq9XqesNCMAJqNxCLY/KGFRTg6XJyt1FW7Iex5OcauI5OWHAZo9I+nle7WQHF6OeRRteUoirAX1bSCa94e60iJHq+OZI5iiGNymnDAuhakwoxxuspdpOgMD+rkIz2dY4iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTykqG25MyVMc7s9NwoOaGXZqjx7typ1N9+hyvyzR04=;
 b=jm9xRAFgVP8jxHLYpIGaONN5y4a5iZraGwZJw4MV59W5DXyE5JbrcHk3+JjC1Gis7mdJLiRj5Kp7LYa7SxUQ/EgOc1W2Fvdo5p0FcHLwFnnQXNjWr0AWGdefedgcCyqdIW0xdkNxb57OttsPiZ4gULdftOxTX7DQtQf6M7XDYdY=
Received: from SA3PR12MB7922.namprd12.prod.outlook.com (2603:10b6:806:314::12)
 by BL1PR12MB5803.namprd12.prod.outlook.com (2603:10b6:208:393::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 07:05:32 +0000
Received: from SA3PR12MB7922.namprd12.prod.outlook.com
 ([fe80::9b6:464:1a68:ed47]) by SA3PR12MB7922.namprd12.prod.outlook.com
 ([fe80::9b6:464:1a68:ed47%6]) with mapi id 15.20.9320.019; Mon, 17 Nov 2025
 07:05:32 +0000
From: "Katakam, Harini" <harini.katakam@amd.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, "Simek, Michal" <michal.simek@amd.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, Michael Tretter <m.tretter@pengutronix.de>, 
 "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mmc@vger.kernel.org"
 <linux-mmc@vger.kernel.org>
Subject: RE: Recall: [PATCH 2/3] dt-bindings: dma: xilinx: Simplify
 dma-coherent property
Thread-Topic: Recall: [PATCH 2/3] dt-bindings: dma: xilinx: Simplify
 dma-coherent property
Thread-Index: AQHcV44WwCgQ60w/FUSS7sA0fIX6QbT2b+YAgAABTKA=
Date: Mon, 17 Nov 2025 07:05:32 +0000
Message-ID: <SA3PR12MB79228A5BDA4C1E7631CC21229EC9A@SA3PR12MB7922.namprd12.prod.outlook.com>
References: <SA3PR12MB7922952E6DE5C156FED760519EC9A@SA3PR12MB7922.namprd12.prod.outlook.com>
 <64bc3888-2121-4593-b6e2-e77b02a98e9b@kernel.org>
In-Reply-To: <64bc3888-2121-4593-b6e2-e77b02a98e9b@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-11-17T07:02:35.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR12MB7922:EE_|BL1PR12MB5803:EE_
x-ms-office365-filtering-correlation-id: d9cf729d-9e92-44e3-f184-08de25a7b2f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?OVhxS2FFenFrVUhObnJrR3BjSmRnc1V6WDlTclExZi96TWZmK3I2UVFwVll2?=
 =?utf-8?B?UG1rRjhDQkdQSWNxTzlmVms2dFBzc01hMmQyOGlNMm9NMWdpVHZJZkJVa29F?=
 =?utf-8?B?VHB6TDBmUjk4ZzA3cHgvcVN2ekUwZ3BlaE9GOFdnYWlPU1VoWllQODVOSG5h?=
 =?utf-8?B?TytDSjJNMGV2alJBQ3JxYlplK0QwWk1sa0tNNXBSK0lMZEc4QXBFZHBaNEp5?=
 =?utf-8?B?ZXkvTGhmdHpmcW9SdWg2TWNIeURTYnZmUDJmcVVINjdHY21XblR3dXNFeldr?=
 =?utf-8?B?ZmN1SHFKNzBjY1BkdWhxWHB4TGxIbGV5YVg3OXVwbmRkL2RDL255TzV3NEJ3?=
 =?utf-8?B?amNua1NLQUFtMEMxcitBUTJlSVB0K3JWTDJTWFZzMnlJeGRhYURDU1FQNFZN?=
 =?utf-8?B?MTFENno0SGV3aGhYZ0k4WEU2WjBjZU51M2k3cDRoQzZrTFN5WlVxN3hib3hJ?=
 =?utf-8?B?aVBtbTg4WUF0a1NuTUJnM21nYVVUdkR1QzRTN3FUL0hQM2VtK2x1dEZJWDR5?=
 =?utf-8?B?RmlyTG82dUNVOEd0RWdYV3RoelNLVXM4aGNSK2c5ZkVFQlYwTXlOWlI4SVRj?=
 =?utf-8?B?dUZzQ0h2aVk0VXREbjg2SURiMGtSbWxuelByazQxcGtCSXVmZ3N2YWtnaWR1?=
 =?utf-8?B?QllSZzFicG94ZWY5YnBUVnhZc2ZETnBMblRzU2VDTmxnSW9OV0RIQ29DTVV4?=
 =?utf-8?B?U0dzcC9FOEdZbXA3QkpLREJIaFpENU5Uc1M5S3Jwdy80aHRtZStTREFnTW9T?=
 =?utf-8?B?QWJDc0ZwbWpUVmNsUDBwWmRkTnprVVlDRmNzbTd0TUoxWWJrU2dxK0taa2pE?=
 =?utf-8?B?Nyt6RUxySCtkbmIwNWRabm1EeDBOT3p3c0g0RUtraDdncUMyR3NaVGxrZHdr?=
 =?utf-8?B?QWFPcTVrMW9qOGJTVnMwU2JXT0lCVEwySTZjRzQ0SWdLYkNLYWx5YkJuRDF1?=
 =?utf-8?B?V3BrWFZzOU03em92bW4vTzJJbXAvQzlFREczTUpUMmprcjBBRWdMNHRXcWRQ?=
 =?utf-8?B?dGR6VjdGVC9NWE0ydzhtZnZPek9kMXNjQnpTR2NPREFHKy9NZXhZUGNybjU1?=
 =?utf-8?B?bjFuWktESXU4VmV1WENVbU11Y1p0akxNcXhpcjJJL0VrRXFLZkFGVmtBWEM4?=
 =?utf-8?B?NnZheFRDNHA5dTJONXRKTC9YS0JKekNVNG9Xb3FEa2JaZnhlL3NzU1NRWWs1?=
 =?utf-8?B?TFRLcUFCaU5tdGdGRHJDOEt2dmR0YWd2MXIyeTNvcmpYUi9OdmJaUTBSYlpx?=
 =?utf-8?B?eG5CUWpWRFF5MXUxdUVpd2J1OEUzc3MrYWl2U3k2N2Y4SFB4K1lwRnBMVDhD?=
 =?utf-8?B?d3ZlT2Y1cjg2UXpIM1I2S25pWFdFS2hUelZZRmtkUm5mNFc1NjY5ejdkcHE5?=
 =?utf-8?B?b0tFOGx1bGR0b21xUXc2c1RCNU9ubzdlYit5WlY2TkxIOTBFa1A2endLR3p3?=
 =?utf-8?B?Ymk3ZG9SR3k4ZWhrZGRpd0EyTUN2WCtLREUwS0dia2RWc3Zkbi9QVWlROVIw?=
 =?utf-8?B?YkxYRDliRElUdFVIamdTMVE1K1RjazFBSlpWNE9hdnVkVVhKcDVDYTZYUUZV?=
 =?utf-8?B?enN6WWN6a2l2TmlhQW1nc2ZGRWMrQ2htTW1uMG04a3E3MWRoWUNNMjJkSUE2?=
 =?utf-8?B?emxsN29WYmFlM3FRRjBoUEZZdkRmYmhWbGVNVWN1VzdLSUxSNDE4dStVL2lr?=
 =?utf-8?B?Umt3MVllKytFTGUzOWJzUHIyaDl6YzNKVmhZZGUvSEV5OXZWNnNpRzF4NDZC?=
 =?utf-8?B?aExrVTlWSm5NejZPOUlTVzFnMVFrWnRQOThaRkJjMHgyOWN4TXNJa3JpMkJu?=
 =?utf-8?B?a3BZdHlrVlN6TUluRWJpbnE5SFpncHJSdDQxL0RkcktMS3lkVjZQeGhQdWkx?=
 =?utf-8?B?WWVDcWNBR0cxSWxKNFgrN1AwV3lqVXlnVHhwQTRtaHlmZTZwQXdKYlhPempj?=
 =?utf-8?B?NkJLWGI4QnZLb0c0YzQvZ2hoYXl2YVVYYjQxMTEzZHVldmtEbmh2UzU0cHB1?=
 =?utf-8?B?M3RtbE5rZko1Y0w1UjBkeXFDeUd0ZldLV0trWk5hSFBsNTYrWjJYRVIvUThq?=
 =?utf-8?B?Y3ZxWDREejdjSUExcHF1T2h4U1lNYWtsQUlsZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR12MB7922.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SS9xWHZsK0NldWN2b0FtU3lxeHp2WFNVbTRSd1JDdGFOalpZRUJadzY2Z2Mx?=
 =?utf-8?B?WXIxS25xbFIydjRVTm1lN1U2TzVrVUh6ZEZjQUh5amN6UW5OakNVbE11VjdK?=
 =?utf-8?B?UmVLa0MyOEhDZ1NXMjRabHpRcEFlcWw4YS9CQ1FLdU9rZVd6SHRuSkJyRVNu?=
 =?utf-8?B?YVlYUThWT1pDRW8zUXdYSzc3am42ZGdTa2JVTFJPV0hHMmxTbE8vQWVhMUt1?=
 =?utf-8?B?NkRxTnhuQStBbWowQXFmNTB2RU1GUTV4amh2SE5EeVhBSkkzN0tFaDk3clRl?=
 =?utf-8?B?aUtxdmVnY04vWWlSek9hdmc1TmNKejFLditRVTdUR0RSbXlveCtPQ0gvZHc0?=
 =?utf-8?B?UWhMbE12c3orOVNWc3g0NEdlV0M4Z0NCMkVaTnlwZHNxNlQ2b3kyNmVpa05y?=
 =?utf-8?B?VUMxY0xkaGJjVkkyMEtTUjVycWl4Sit0aEpUS0xrLy9tOGxNZndzWUIzcTZK?=
 =?utf-8?B?VDkvbFJyaVhQMmw5NEFPdlpsSFZGZU1QV0RoNWdSV0Z5L3NtRmVNR2p3Vlpn?=
 =?utf-8?B?QWUrTW9HMEFnRWJyK1dUdEhwK3J4UkNOcGJ3cFY5bHVwL1dmTlhodTB2UWZL?=
 =?utf-8?B?RGVuK2hVSW15R3lWVGJmV1JPV3JhaW1YNnUwcGVlNWNrSjhBNnVqL2NlVWQ4?=
 =?utf-8?B?cjJZVmo5Z2FhanlNVmpLWnAveThPWTFQZSs2RTVoZmZHVjNWTklVRWRlenJV?=
 =?utf-8?B?U1hYK1Q5ZitYdWJzLytLRFptayt2TjhvRTVSM3pVWTFFVDdLL0hXVTJPN011?=
 =?utf-8?B?YTczTXFDdjMvVnQ5VEMyQlY1TkdwdndDNFJzdGxZN3JFdWU2R1dMQ3JIQ3VQ?=
 =?utf-8?B?MXdNN2VkaDVvYWVseDRjeW1XSC9lN1EveVFhbERTQk00aE0xcHptT0kwT1E1?=
 =?utf-8?B?U1dmdnlocE9qODdxYU9FQ2Vvc3hCdVF2elowRW01b0lKblVFekxqeW5XWW8v?=
 =?utf-8?B?Y3FPOUg0Q2VHYmh2TUZMYkczcUpHNlJ0MnREdHQ3d1labDhmM084SFNpY0dv?=
 =?utf-8?B?WldSREszWGFpbVIxRTN2emlsb2hsYnZTTU01R2IxSGxqV0RMODA1eGJnMjdq?=
 =?utf-8?B?NFhvdWlsU2puUEpaMk0vNkphVTE5bjQ4VDZWUU9FVnAxYUxhaThha3lnYkFj?=
 =?utf-8?B?b0Fybi9uOFNWdkp0Vjd6Ykhwd3BJRWNCc2g1Vjh0UTl0WnZINkpka0phK0JV?=
 =?utf-8?B?UTV0NnorYXVaMFhmZFovbWduV1M5b01QVzJSTGRqdm5rYjI0RllaL213WlZZ?=
 =?utf-8?B?cFpCTEpFcVNXc3dDR0RKOVFqb1p0OVlxTGFTTVpzclFGaVFEYzA2ZTI2Ynhk?=
 =?utf-8?B?V3dwMDhmWm43VTNvNzI2bCtvVTROK3poNTJoTW9waWlDSXhtdEh3eDQyUGdK?=
 =?utf-8?B?dS93cWF1KzN5bUlYaXFzL1BUOUtFTVJaOWFZL0JUeGJuVjdUSkpNN0h5UVFX?=
 =?utf-8?B?YTBtYVFNdi9uWnFVdk84UnhadlNobXErc1I0TGQ3MjUzTFYzcDRiMG9zUmxp?=
 =?utf-8?B?VGcxUVV2TW9HVzlYOFJ3eWxGNzZQRjJSUncxNkVKVERZclBmUVFxZWRjQW5J?=
 =?utf-8?B?SlMxZm40QkUrRGI3eGRMSWwyY2tmb28xeTBQZHdPeVFOTldvQ21pK1d2K0gr?=
 =?utf-8?B?anpRL05kYnBnQ0pGVS9FejFOWEtwRWk0N0UxNmNaL3hXNk44ejAyTmMyVGti?=
 =?utf-8?B?OXoyZm9ISXI0T2dEYkVQaUNPeGFGU0w2NGNsTmdta3JkOWF6Qy8wUHR4S1pi?=
 =?utf-8?B?YWJjZVFIbFg1WFhVcS9zVFNVVEdML2pDYVltVlFidDltTWtycTJ4Rnc0NG1w?=
 =?utf-8?B?bzNYbGFxczh0ejhQckFKZDVvcGc4TGVWRjMxd0Z1ajZSbFJWRlhWajl5SDBq?=
 =?utf-8?B?UkhJYzVZU3M2bFhxVThTMU1LTlNZRWVzdGRkem9qR3paMm52MkNIazVYZkdL?=
 =?utf-8?B?TytJSXZkdjVNVDVWUk9VeCtXblJtUXQyNXRxb1BNSVdRUmZuU1VVOGJVYmM4?=
 =?utf-8?B?c3h1dklwZFVTWVM3dW9uNXNVL3dBeHBYclg1Ky94dDZiNlUxUFJmSHdKL2dz?=
 =?utf-8?B?RWRlZ0haZlJFL1pkQlMxaDJISW9tZTRVQWxwWkFHTC9ad3NnQ0VQS09mY3Ez?=
 =?utf-8?Q?UE1I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7922.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cf729d-9e92-44e3-f184-08de25a7b2f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 07:05:32.5189 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w9oZ+1L4AtIRqftO0/QPqBJHNcBlM6nS4T1iwUwrn4uUpWCOXzl0oe0YjNRNHzfU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5803
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
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMTcsIDIwMjUg
MTI6MjggUE0NCj4gVG86IEthdGFrYW0sIEhhcmluaSA8aGFyaW5pLmthdGFrYW1AYW1kLmNvbT47
IEp5cmkgU2FyaGENCj4gPGp5cmkuc2FyaGFAaWtpLmZpPjsgVG9taSBWYWxrZWluZW4gPHRvbWku
dmFsa2VpbmVuQGlkZWFzb25ib2FyZC5jb20+Ow0KPiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21h
aWwuY29tPjsgU2ltb25hIFZldHRlciA8c2ltb25hQGZmd2xsLmNoPjsgTWFhcnRlbg0KPiBMYW5r
aG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT47IE1heGltZSBSaXBhcmQN
Cj4gPG1yaXBhcmRAa2VybmVsLm9yZz47IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPjsgUm9iDQo+IEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yDQo+IERvb2xleSA8Y29ub3IrZHRAa2Vy
bmVsLm9yZz47IFZpbm9kIEtvdWwgPHZrb3VsQGtlcm5lbC5vcmc+OyBTaW1laywNCj4gTWljaGFs
IDxtaWNoYWwuc2ltZWtAYW1kLmNvbT47IFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8u
b3JnPjsNCj4gTWljaGFlbCBUcmV0dGVyIDxtLnRyZXR0ZXJAcGVuZ3V0cm9uaXguZGU+OyBQYW5k
ZXksIFJhZGhleSBTaHlhbQ0KPiA8cmFkaGV5LnNoeWFtLnBhbmRleUBhbWQuY29tPjsgZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IG1tY0B2
Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFJlY2FsbDogW1BBVENIIDIvM10gZHQtYmlu
ZGluZ3M6IGRtYTogeGlsaW54OiBTaW1wbGlmeSBkbWEtDQo+IGNvaGVyZW50IHByb3BlcnR5DQo+
DQo+IE9uIDE3LzExLzIwMjUgMDc6NDcsIEthdGFrYW0sIEhhcmluaSB3cm90ZToNCj4gPiBLYXRh
a2FtLCBIYXJpbmkgd291bGQgbGlrZSB0byByZWNhbGwgdGhlIG1lc3NhZ2UsICJbUEFUQ0ggMi8z
XSBkdC1iaW5kaW5nczoNCj4gZG1hOiB4aWxpbng6IFNpbXBsaWZ5IGRtYS1jb2hlcmVudCBwcm9w
ZXJ0eSIuDQo+DQo+IERvbid0IGRvIHN1Y2ggc3R1ZmYuDQo+DQo+IEl0IGRvZXMgbm90IHdvcmsg
YW5kIGp1c3QgY3JlYXRlcyB1bm5lY2Vzc2FyeSBub2lzZS4NCg0KU29ycnkgZm9yIHRoZSBub2lz
ZS4gV29uJ3QgaGFwcGVuIGFnYWluLCB3YXMgZml4aW5nIHNvbWUgaXNzdWVzIHdpdGggbXkgbWFp
bGJveC4NCg0KUmVnYXJkcywNCkhhcmluaQ0KDQo=
