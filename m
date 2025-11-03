Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92A7C2B185
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 11:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7FF10E3B4;
	Mon,  3 Nov 2025 10:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="XXw1UYbx";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Ei365nRe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1277 seconds by postgrey-1.36 at gabe;
 Mon, 03 Nov 2025 10:36:36 UTC
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107AB10E3B5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 10:36:35 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A36bpAO1169018; Mon, 3 Nov 2025 10:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=DW8r4KcywHXyWxirJg0YZLjMcoBjwwTKJHYH4T0E+gM=; b=XXw
 1UYbx0SoXBbv5zauUFc3mxIobP1v9QNe8uJ4y3JZBWdlycQV+aTyHvDukeyZY8Oi
 XJZJ0WTOgRuwmae3cEry7NWxQCYhQeiraLNdtr9zCX3caIHAu7ERLqNgTfh75dvf
 89Qxp/4nPmgMcbIVHRxzd053Qvrb5MIYbsvNDD6s4yGAWICFFjwJgHHV7hFTxn4e
 E6mdz5B6G6BdR0T7FOKqEof3Ti5ZIm0Vwk/6PaSvaj+KM3YHiiV2xxSrlkb//vP5
 F9PAQG1wG7g15kVVVyBRbzsUmM9YUJ5mGzaBrrUIHLGoIFmndhaIPAUYuujWOerL
 vwMSjQDZqxih1eFLTVQ==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazon11020109.outbound.protection.outlook.com [52.101.195.109])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4a5b5w9bxq-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 03 Nov 2025 10:14:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSu1++zkIEbuVwTXcjd7XoyxXTRxGUz3eiimMCo7IZPor/3o+gCHeFXF4M7JNHjKMHpZHtZgdK7jNtFiveBeoQtHmyVI7e1NN5bx15JmqkpdQ2lLoTuWL4HA85LqcbVaNUzFrdKQPZpf++Yi2B9bNyt4P74t70Fj0eQycEnJ3iMK1FrBeWbr9XlBG9v1Tm8M0fAXT1G/C6Wrcg5rQFp8p9Y/DN4Tvzv4wXBhanOvjLdaq9imaNUCH/PFzlA3ak9mMV6etYaP2joFWqbB1C64Ix+hsncsL4MBRmk2m6nRXrehmSxa2yKFQkRxjfbPsLwnJoJ6wxYX8+HGXJ/UMjxi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DW8r4KcywHXyWxirJg0YZLjMcoBjwwTKJHYH4T0E+gM=;
 b=ZDpzZ+OyhzzHk7wJh4UlK85YwzqKEIkYVGNog5HpuBb+wKrawlBHgQAMoyyzV2fBYe6D2YfhB3M3+Fa+07RAsJpBJ0upN++dZ9TFPOQ+uA+7aW6DGnLULBo7ZE1MpKv+rky+j1N5yXUogAH/ViIA9aeGkl5cS7hYbqFCFNz6s8xBUgaIv3j/R5u+tjuMky4ri8FVBPNLAizaURWmkjOzncXUqP73Jy9l27TV5mU5vJdzQkvDWYyhfF22F2zdIAvtACRrt6DlCJO5hXgft0vYMUZsw+9EOMDfHL8Kp1p2UO+N1f7+aSeNPIKDOvTluywf9TzETWEFdB+exnXR5CW3Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DW8r4KcywHXyWxirJg0YZLjMcoBjwwTKJHYH4T0E+gM=;
 b=Ei365nReUmNIiBWQsGIKSiltO/50iXY3JGrCeXyuzdylvqdTdSuhpin3dtTxaB2Mbqn4dpt5HXg0U4NcJuUoHHJJqR4i/vw2aqmOV3RVO4ve1Q7YGG3Uy5BpCaRVUikDy54bzBULwWLR1XLbTuPFqT1zfkusDL7oHs+lY/wdHU8=
Received: from CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:19a::5)
 by LO9P265MB7393.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 10:14:53 +0000
Received: from CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3e50:ef31:dd73:3bd2]) by CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3e50:ef31:dd73:3bd2%5]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 10:14:53 +0000
From: Alessio Belle <Alessio.Belle@imgtec.com>
To: Matt Coster <Matt.Coster@imgtec.com>
CC: "lkp@intel.com" <lkp@intel.com>, "airlied@gmail.com" <airlied@gmail.com>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "m.wilczynski@samsung.com" <m.wilczynski@samsung.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Binns
 <Frank.Binns@imgtec.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 "mripard@kernel.org" <mripard@kernel.org>
Subject: Re: [PATCH] drm/imagination: Optionally depend on POWER_SEQUENCING
Thread-Topic: [PATCH] drm/imagination: Optionally depend on POWER_SEQUENCING
Thread-Index: AQHcPQHA3HbUnCHWTUa0HnuxBeDRT7Tg216A
Date: Mon, 3 Nov 2025 10:14:52 +0000
Message-ID: <5c40dbf6bbb9cb6806e6d08664709b5cf934ec36.camel@imgtec.com>
References: <20251014-pwrseq-dep-v1-1-49aabd9d8fa1@imgtec.com>
In-Reply-To: <20251014-pwrseq-dep-v1-1-49aabd9d8fa1@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB5009:EE_|LO9P265MB7393:EE_
x-ms-office365-filtering-correlation-id: e9569711-ea1c-4bfa-e069-08de1ac1d48d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Y3ZOamdKVmFQdHFIYnR6YU1OOGR3YnR1OWt2ZWhwbEMxU3hEd0t3a2lWL0xW?=
 =?utf-8?B?TFlmc1UrQW1NaGR6Qm80VFl3cG1KOXRpcTNqR1FjZnhoZWtsY2luajJVTStH?=
 =?utf-8?B?dDlJRk1ja1NpQkR4RHJrRHlGY3N4NWM4MFF3amd3dDdUYVhISEVHMGlxUW5l?=
 =?utf-8?B?VS9VWGtKOWVSOFEwM21HUGRuSzhXTmR3bmIzck9EVkxvd1lSdkErSXFNd0U0?=
 =?utf-8?B?VHpaK1dTN3Q3dDIwRGNVUDhCa1Bqa3ZRczYxZUtzR1pwOC9BNnFpR1RYd1Y5?=
 =?utf-8?B?MVRNODcxY2VmenZvdU5za2ZzMnpVZVAweEVKWWdFSWQwc2xRdThJbDNROTlU?=
 =?utf-8?B?NWlIN00wUWlYaGNyUStsdXJqeU9CNTJ0dkt1cHcrbGpMOUNDaDVsVkhmY3hZ?=
 =?utf-8?B?SU5WM0JoV1FjQ1pIMDR2ZU16bCtBNWR2QnpPbGlaUzNOaityemZtd2lZRStO?=
 =?utf-8?B?d3VVMnduTnc0UE5BV1JZaG8rQkZXMkZzem10bExGbGo4V0hlWERNOXFHdUcv?=
 =?utf-8?B?THlIUy9hSWt6TlZ6d0hvZzQySlFNeVRPMVBNdDFtVnlkMDA4elhUNlhkVzB6?=
 =?utf-8?B?YkpiMjVsUDNSN0dWakVnQk13MExPa292RVdkZGNqS01jK1dSODFQdFZ3U3hR?=
 =?utf-8?B?clFLbzFiLzR0NUgrR045V2hhTDN3Q2RmN1VrdG9VYVhXSE5BRmM3UGI5MTNW?=
 =?utf-8?B?Z0p6djlnbGtEQ3Y1cHc3enVjYjJaV09IV2l1cmI1Z3U5OVdKSmVNUlhoTXNl?=
 =?utf-8?B?MnZYZCtRTzMwYXdybGd0S1RTTGk1ZXFHS3F4bEtYTkR2bElWVXlBVFNoZmht?=
 =?utf-8?B?TFpTNjFVQjhGQ0RycUZPbkY1ZkNITVlUUThvdVVyUFNZejRwNjR6MU1aTlQ3?=
 =?utf-8?B?WFFqVEpyTjdaZ2NNRm13eHpkQTROOWZ1V2VrZ3VVdGpRV3ZSN0hnYnNveTZm?=
 =?utf-8?B?TjhxRVdPdEV0aS9kV0M0cE96VDNNWG15a2FYTEwrSkxOaWZ6Y3htb2R4dGcv?=
 =?utf-8?B?QVE0UXpSRXZjUnRPdlZPSkVxNjhtQUsxajJURE45OXNKVktrRDdaamlIZ1pV?=
 =?utf-8?B?T0pNSjNKa0FObkVjOGVHVnVBZjY2Ry9Ea0RGZTZNZlgzWVZNbUF5SU1xZzNu?=
 =?utf-8?B?eDdsQWEveWFOQVpqL1dmQjRQM1poRFhqVVdCbENZVlRjUE5EeTNEQnd5NWJt?=
 =?utf-8?B?V2VtZUlObllBWUtSVFg0MVB3YVQ1TFUzVmZpZmdWMVd3SzMwUFpPaUo2dDRa?=
 =?utf-8?B?UHk0dWVzZ3FRTUVwZC83QmJ1NUVna215c1FwZ1d5WE9XZlZxV0hHemY0THRK?=
 =?utf-8?B?SlF0UW01SHI0SitENmswY0lyRVgxcnBSanNkUVc5ZUxZdTRhRUZJTzFXamM1?=
 =?utf-8?B?NUM0dU4xMWQzOFJkY3NHZjZWMUFRKzB2NHEvR3pTeEdwWGt3MFNreDFaemFO?=
 =?utf-8?B?SE5NZzFuU0N2MFlUU0FtUm84Znc2MGRUT1V5Q2NxY3h1cXRhS240VjNEcXNZ?=
 =?utf-8?B?Z0x5WnpYd1dJRklJaE96QzIwU0tDc3g4cUV0SFg4cW1uNERPMktZbXF1NXl6?=
 =?utf-8?B?bUNSL3owVjRIWjR1WWFpQ3lYeTdCU1BBVWN1SzFremFpRVFUN1BOdUV3KzBq?=
 =?utf-8?B?MDh3ZXNpZy9IMmJPSlMvMU9QajZueTB0NjR4aUt2cUMwRjlvM2RrNXA4dFJ3?=
 =?utf-8?B?NGhvUFJjdUZKeVBwS2p0elhlVHBaSU9nTm9VMFlUU0lMUGdISHJGZWtFQzgw?=
 =?utf-8?B?aC9uSm14VEIwTWhrMzJPY1ZsempIajUxMjNGRzBDV0Qrem9PQldvNEt0a3Qx?=
 =?utf-8?B?VDBsS2RzOWNZb3ZFME9kc3VRWEJ2akVNeDBxNVNycmVRUDBYMXJmTjBGcW0y?=
 =?utf-8?B?dUVKSFg5NmdnY2tyOG9XZnFtM2xFT25ZRStvNWkvRjBRNE1IY3RNQlFUMXZI?=
 =?utf-8?B?VFQ1THR3VTNVRXNIOWVPQ2lORGg5MjN6azZoVjkyY09EckNIa2swa2JuSHFt?=
 =?utf-8?B?TUN2dGhXUmR0aVdYL1YxY0pJbmZqQWhKK3NpRGV3VS9NSm9wbTNoU0tLSWZY?=
 =?utf-8?B?UUR1Ylk1bFZqdC9abE9LdVFYNjJUZ3cxUEdZZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZytnS1lWcWtudjk3OGFkNVJmMFR6bm9NNVVCNTd5K3hDcmszajhMM25rQU9u?=
 =?utf-8?B?SEtuL25PMXMrL0thU3RQL1BuMWdabExnMzJoYTN4RWFPRkhJeTVQR0t2czdI?=
 =?utf-8?B?Y3pEbmtjU1ZOSkFjWExreDlvL2dYelZaK2JvSmc0cEUzcjZLeGtOQzVMZWRD?=
 =?utf-8?B?YTBtaHJjbzRwa0VjVW9OQUwycHJrYWZvNkZZUG5Bc0d3TzkydmZhWGNZSUkz?=
 =?utf-8?B?UHZkY0p1NCtrNkRNTUZpTGJqUDhDZGMzV25vVTNITmEyQlUyTjBOVGR1cGx4?=
 =?utf-8?B?TEJrd0xtUjcvVzJxQmNNVXo5T1V1QWVPSHJFTFBYdjAxOHc5NzJOUFB4Mlky?=
 =?utf-8?B?SVR2VUVscmxjNmtkRWNqL3FUUkEvcHNCMW5EaDEyVXBXdm9DZWoxMzNWN2FT?=
 =?utf-8?B?TlIzN3VPUTVIK3hsUW1LZkpSM210bjJ2aThzVWZWRHFqeEJMajZmaGtSUyta?=
 =?utf-8?B?OTNQVXJyT241OHl2SFBibURsRGlNb1RIOWY0b3ZHbXZtWUdCY0t1SHFCTXhV?=
 =?utf-8?B?bTVyWjFRMmRtYkloeTl6cXN1MWV0MGtreTA2cCtqeXJzNmtEL3JIaS9HUndZ?=
 =?utf-8?B?MXQ2bTNPcUM3TmhYUFFwVHhRWVloSzE1QVVmZXpkTkpuZEtaak01c000d0hU?=
 =?utf-8?B?emJhTmpzeWFTS21NOHVHWHh3a3ZaS0pWeERFOVltKzNDZ21wMDgrSDU5ZURk?=
 =?utf-8?B?eXIwRnhRNlRkbk9UNVFwblAxNTlBTkxzMHV6TEkvb016UEVkZzk3MnUydnFY?=
 =?utf-8?B?c1k0bWRzSHpCUStiV1phR1pzNUtqZ09jZkkvM3gvNGVzQlB6dThKdEFBMVM1?=
 =?utf-8?B?L0NKYTJuQlJIdmt5cFpYK0lFa21LNmNJL21MZnAySzRSTFNRcnJYb0Z2V2dE?=
 =?utf-8?B?b0hWQmFZWk42dmNpYWxVK21QUHg3Nk41WDFSVVMzc3huSUhRSVhwaE8ySXFN?=
 =?utf-8?B?eng4OUFBQ2R2ZnVwMnZONW5mMXRhWDlzMGNsV2R1V2JOcTFrVzA3NjYyM2V4?=
 =?utf-8?B?Tjk0eFJBdSsydytpVWNQV2p5cG5IZFJEMHVUSGhHWmtxOElBK2tQckFvS1JD?=
 =?utf-8?B?VlRxL09rVmNHcXN0WHViMjR4KzNzdWQ1SWIrekQ5bCtyV05Zd0Z3Wm04UUky?=
 =?utf-8?B?M1BwNUtxZUhzOEJsTTNBZThIWnNDOHo2cklEeGlCQXdzNUpJZmFvZ1BBY2hw?=
 =?utf-8?B?QkJOcUNuNjdVQ2poZVVGRTkzSTZDeUk1eVcrNWNRZ3JIcFJtVVNESUZVOHVO?=
 =?utf-8?B?YTJrY1JZU0pSZ1gxTm5OcG1rcTEvN28wRXJEOExORXg2YzhQSmZXd01neStX?=
 =?utf-8?B?cFA0eFJBT2Zyak0xUkZvMnh2MjNsRTYyRzlqVEF4anpVK0l5YTlIQWVGUVFE?=
 =?utf-8?B?ZVBCc3I1dlg3ajFQdkRjVFo2OUk5blpJZDRjOW1IdDdTaFJxQ1VNcUlMUi96?=
 =?utf-8?B?NlNnNjB2b29oTm9wcDd2VnJJMjBHRXlZK0diZG9DVzBpZ3JSRUhtdTBZd3dJ?=
 =?utf-8?B?ZkN4QzhkVEcyWnpvYzc0c2tYN2t3cGRkQzY4MzR6dTZnejJsZ3IzVHIwMXBl?=
 =?utf-8?B?eTFGSTdhV2JaU29USTk1ckxOOGZrK1BMRzdocXNxQ0Jrbm1JYWFyNjl2dlBr?=
 =?utf-8?B?YU5ENVlHOGw3TGpxZzlSN2lIV0FOcndvbHlQaWZJRHN3RnNNQ0M3Nm9rb3d6?=
 =?utf-8?B?b1FpK0U1Q3lEZTROSlQvbUcxL1hGbkVBbDFpZzlUZmU2WFY5cVZiVERCSWx0?=
 =?utf-8?B?a0tPWjhweDRHbC80ZFg0bGFPSVVPSUp1ZCtBMTJSb3ZxbGVCUWxnSWx6QVlu?=
 =?utf-8?B?S2RnekJ5aENxT2tqS1VJYURua1BrVE9xMVdlcXhKRlVYM3BLU1cxcHBoT3lm?=
 =?utf-8?B?SUJmNmFNeWxjb0NLbkUybmNhT2FiSkcvc1lma3I4VFRjRFZrV1U1SU4wQVd4?=
 =?utf-8?B?MFdacldhOUxoUFJlY3JCQ1NBK3pKQlR2VTdEbHBUVStyL1hNUWxoM21Cd1lR?=
 =?utf-8?B?UWRWY2NLa0VNVWxpU2lnNVhENFVpRUlSTk8wRFltUURMaXZSL2JXWGYvYmFn?=
 =?utf-8?B?SndnL1A3MEdFeTRLWWlsVDc0QmRIOEJVM1RLMzNPS2traDlHQzJ0WmYreHNJ?=
 =?utf-8?B?RWhxM0xMSDEyakZQdWZqcmo1VlVJQUpiUzJGbjdQR2hZTnZnV2VmYjVBYzRp?=
 =?utf-8?B?bWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB6C2C9CF3ED0D4DB1F235456F84DEF8@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e9569711-ea1c-4bfa-e069-08de1ac1d48d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 10:14:52.9623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tTzv+S7+9ADIDMar2CsF87jfsScRjiwwmfvB41J/Lb7moEV9X+Yr1jFrFyiFI4WosozUjnMCHD7jRKdFcE2bSins3gPJ+wsWasVA3iGlGbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7393
X-Authority-Analysis: v=2.4 cv=KrdAGGWN c=1 sm=1 tr=0 ts=6908809f cx=c_pps
 a=hpQ/3Ung3HVHgdEV7Ti16Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=dkdM1tVOqM7zQlyInTkA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: _dVdBiG5D1q13A0YmztbW-x2owuIhpET
X-Proofpoint-ORIG-GUID: _dVdBiG5D1q13A0YmztbW-x2owuIhpET
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA5MyBTYWx0ZWRfX1pkSLEYjwkuc
 SWugemR8NuBT5m5KWAzQfpLGlGxjklui1YRX9M/KHJyLYzvrMYgFx99JzsLa3qXwUPmEikfv9dj
 ynJjSrdBnKCbyiF6LRV7iZ7JHt+wrtnVS48DVCA4tct/5NDBts5BidEE2zBUfSFTzc2fyuOK5dS
 QPoAl2UrymKMw+DG77xK898lF0h5XFih78g0/uW/awGSiwCdmRC8YP7aHMI+4m59zP/mJKzplVh
 cWcMcgqpe8Nx4QXApm86zoHGv0F1XIb2m843KAXdJ/Sy91YTEyYmk23L8MlPyJeVn7Z2RHWJ7/u
 EUCrE72rWuGdxXV6eX1sMgXCxSzVTRzLf7cnPKVA5M8N/cVG8eius/IYBttA5Q0UCt4PPnAruLe
 5x69n5X6+g1X2IsZtz0ZB0XHdmnY1w==
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

T24gVHVlLCAyMDI1LTEwLTE0IGF0IDEyOjU3ICswMTAwLCBNYXR0IENvc3RlciB3cm90ZToNCj4g
V2hlbiB0aGUgY2hhbmdlIHVzaW5nIHB3cnNlcSB3YXMgYWRkZWQsIEkgbml4ZWQgdGhlIGRlcGVu
ZGVuY3kgb24NCj4gUE9XRVJfU0VRVUVOQ0lORyBzaW5jZSB3ZSBkaWRuJ3Qgd2FudCBpdCBwdWxs
ZWQgaW4gb24gcGxhdGZvcm1zIHdoZXJlDQo+IGl0J3Mgbm90IG5lZWRlZCBbMV0uIEkgaGFkbid0
LCBob3dldmVyLCBjb25zaWRlcmVkIHRoZSBsaW5rLXRpbWUNCj4gaW1wbGljYXRpb25zIG9mIHRo
aXMgZm9yIGNvbmZpZ3Mgd2l0aCBQT1dFUl9TRVFVRU5DSU5HPW0uDQo+IA0KPiBbMV06IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvYTI2NWEyMGUtODkwOC00MGQ4LWI0ZTAtMmM4YjhmNzczNzQy
QGltZ3RlYy5jb20vDQo+IA0KPiBGaXhlczogZTM4ZTgzOTFmMzBiICgiZHJtL2ltYWdpbmF0aW9u
OiBVc2UgcHdyc2VxIGZvciBUSDE1MjAgR1BVIHBvd2VyIG1hbmFnZW1lbnQiKQ0KPiBDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZw0KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxr
cEBpbnRlbC5jb20+DQo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxk
LWFsbC8yMDI1MTAxMTE4MDYuQ011bE5NS1ctbGtwQGludGVsLmNvbS8NCj4gU2lnbmVkLW9mZi1i
eTogTWF0dCBDb3N0ZXIgPG1hdHQuY29zdGVyQGltZ3RlYy5jb20+DQoNClJldmlld2VkLWJ5OiBB
bGVzc2lvIEJlbGxlIDxhbGVzc2lvLmJlbGxlQGltZ3RlYy5jb20+DQoNClRoYW5rcywNCkFsZXNz
aW8NCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9LY29uZmlnIHwgMSAr
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFn
aW5hdGlvbi9LY29uZmlnDQo+IGluZGV4IDNiZmEyYWMyMTJkYy4uN2U3ZmZiOWMyMjU3IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vS2NvbmZpZw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vS2NvbmZpZw0KPiBAQCAtNiw2ICs2LDcgQEAgY29u
ZmlnIERSTV9QT1dFUlZSDQo+ICAJZGVwZW5kcyBvbiBBUk02NA0KPiAgCWRlcGVuZHMgb24gRFJN
DQo+ICAJZGVwZW5kcyBvbiBQTQ0KPiArCWRlcGVuZHMgb24gUE9XRVJfU0VRVUVOQ0lORyB8fCAh
UE9XRVJfU0VRVUVOQ0lORw0KPiAgCXNlbGVjdCBEUk1fRVhFQw0KPiAgCXNlbGVjdCBEUk1fR0VN
X1NITUVNX0hFTFBFUg0KPiAgCXNlbGVjdCBEUk1fU0NIRUQNCj4gDQo+IC0tLQ0KPiBiYXNlLWNv
bW1pdDogZGI3NGIwNGVkY2UxYmM4NmI5YTVhY2M3MjRjN2NhMDZmNDI3YWI2MA0KPiBjaGFuZ2Ut
aWQ6IDIwMjUxMDEzLXB3cnNlcS1kZXAtMGMxNThhZDgwMjljDQo+IA0KDQo=
