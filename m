Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C01AC42EC
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 18:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4909B10E328;
	Mon, 26 May 2025 16:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ErOFB573";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011024.outbound.protection.outlook.com [40.107.74.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655A010E328
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 16:20:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQn99iw+hpkmQZbjF3/W13LY/NzMchHo6o0jGpkfCRgQg5foYd6atdnYpT79ZU/zQE55s+IpvkOwnnSxH2cEK2kglwEl08OO3rk4sAXc4lcxghdgNiKLvzvzkYx98yCIpGHPdU+224rqc4/XaRPXRtiAmXC8NF5gKqMb3CbOXQuMBuz4cuHdb8r3lqDpIB6rZOiWhZAQWkoAz6j8GehsrKL3vPVvbjmyDbAgYWSFylkFtSz2DExe9ljb+1AnwQ1Dv/AmYUNG11Aj8oG9fhpY3AsJp9Hp1VSnYDUH6nTfP7kD3PQv8yvCASvt5QDOUivdkLKExUBbDB5JdKjIj4FjjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuAOLe1u5BYcU0SXCzbwj6vfU8D8fj6Za0R2bnV/hLo=;
 b=CTbEseq6f53gjgwzkzA91S3PaYcwDu7fo9Ae4HWa7ez7pqawoIlDXkw9EAKv1FMAc0wUdOkg8ALetVOpY1PdgvWGHsTqNhwVXB/BI+rZL8i6XDQJiFmIc0VKls036lRBaMJ16IjOdOd9yd25DDVBgvJi9wogpynxMS4BEb/7VIJ1GpuP+mxBZDsZyVTzUlYVPEshg3by1aEqb2PPz3QlVryoB41E7wYHfOXZrTXvtSuBnfs2sdV+SSg+u+EGfyrDiQErwxT32nzOrisIHc3U8EUIpEu9aUiO4wY5R/XSJe5qcOsOZcUIJrdGgvOVizGRz0+S0nE5EcsH0EutstHxtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuAOLe1u5BYcU0SXCzbwj6vfU8D8fj6Za0R2bnV/hLo=;
 b=ErOFB573bvnbIaaoGjUiU9XmkQwXHN5aQZK+H1hEGZ6JJtFx0c+xsyEGVr9n2VMyGVbC3ihYGa4oZ0/hNb90F+g39ao6OCQ8uSVqshlzz9unsJCdvsz6d/tyA5v7X7+uzVEjY+X9lZNVYvejk93q4kFODRFUcXzW/rR7R988kBs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB5941.jpnprd01.prod.outlook.com (2603:1096:604:b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Mon, 26 May
 2025 16:20:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 16:20:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJhIENhbmFs?=
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dmitry
 Baryshkov <lumag@kernel.org>
Subject: RE: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
Thread-Topic: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
Thread-Index: AQHbxs9ir1hJF42rS02+yM7B24cENLPcIpWAgAOfSiCAAArFgIAFWXjw
Date: Mon, 26 May 2025 16:20:29 +0000
Message-ID: <TY3PR01MB113466FD9CE2BA104C3C9E1CE8665A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
 <174778079318.1447836.14176996867060604138.b4-ty@oss.qualcomm.com>
 <TY3PR01MB1134687A2A762FE803EFA04F28698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAO9ioeUf_nQXfP490fDx0Ord55z6EsR+3SOhcee2B-ymewkuCg@mail.gmail.com>
In-Reply-To: <CAO9ioeUf_nQXfP490fDx0Ord55z6EsR+3SOhcee2B-ymewkuCg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB5941:EE_
x-ms-office365-filtering-correlation-id: 5a43556b-5b4a-410c-40f5-08dd9c713b42
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eXE0bFo1SFdjZURmSnJLQ3JGcFk2ZVE0VUFzMXdOd0VQakV4UnFiRnIvUndw?=
 =?utf-8?B?VlhHSmVvWUowWFhPN0k1TlQ2RDhUc1VPcHpyTmdiamtqaUFMK3owWHFnWDV4?=
 =?utf-8?B?QUsxdGU0TkJ1OHJSQk1vZmx6UEpoVkprR2w2R3crZDNjam9Ec2JmUkRIN09D?=
 =?utf-8?B?dkFvS3E2RVAyeTdxb3lCMWFtbjliZ0xqYUpMWWtBeTNjYWdncVhkUGx5dzBJ?=
 =?utf-8?B?eGd4WEJ3L0VGTVlDZVAvcTR4S2hoRzhBQXBSMDdsbmFuSFJIYmRpWTFUVkNC?=
 =?utf-8?B?YWhJdzVUb1ZFQmRTNjdPbm5WSGxyMHhUV1Nhd1BhNk9paXA4ZlYrWklYSEpy?=
 =?utf-8?B?b0tXdGdJNG5Qb2JNWnU3MUF5bnN6SzBkUlc2d1pLVm9CdmFXbG1FYWYzUE1I?=
 =?utf-8?B?bEduR1RnK0VhMTNlY1BKVWp6YTZUL0lEd0d3SFFzVTZYbFd1c3ZQeG1CYWpH?=
 =?utf-8?B?bXZKTjBRM09pMVhPb0NqNkZ0dkgvZDNKaTFXUHU2MlpmMEF4TXRCT0FYclZl?=
 =?utf-8?B?a053Y0E2Q3REcVJhK3VQeHFaQWJzYUJqdDJxOUhxeUJFUDJJQ3BxNzVsTWV4?=
 =?utf-8?B?b2I1eXhUS3hPQzhtd2RFU05HRUlUZzdKeWIxSFF0N08xeDhaU0VzZGYwdkNJ?=
 =?utf-8?B?dUVzT21Na3p3ekhZM01MalI0Vzl3VWdXNHB4ek5GWEg0dFIwZUJGMGZEbitz?=
 =?utf-8?B?ckxlOUlFZEE4d25KTGhseU1lUGtvV0xZbUxJUlJHR1dsdkF5a2JaSXdxSFdo?=
 =?utf-8?B?OWIyVmNubzlDSnhVMVZtN0o3TlpDeERZdGg4UEdWZldTdFlNRkg1Q1ZzMFpY?=
 =?utf-8?B?dmZkSDZIRVZIQWllaVZRNHE4eDdydi9vU0JaZHNTcnhrOEVjRmZqVjhmaEpK?=
 =?utf-8?B?aExoc2VnL0t1dkVkRm5WRm03a3RrTlVZTTRJZ1ZxOU1RZllYL1NkSDJMajhL?=
 =?utf-8?B?MkpDdkl1d1gvdHQrY09jMHFmVTEraFNJcm9vTXlYaGdHZFROVHM4STNGRkdY?=
 =?utf-8?B?U2NPcHkrUGtHZzRNbkhLWUxtY2hkaHpzOEQwbzZ0SzE4WmUzSG9yay9VZG1V?=
 =?utf-8?B?MGsrWWdSZlQxRGtuSzY2SHhUM1ZkRWtLTjNQd1BBTU9INHFPc0Nkd3E5eE1F?=
 =?utf-8?B?QzhYeVdYTlhOaDNKWTdQV1hmb01Ed0ZmajMrV0YxbzRLRTkvNmN4ajNKOFhZ?=
 =?utf-8?B?VlRmc2Q4ZHk1NUxLV0ZMUXc0V1VrcDFBRnR3bGNvUWRpMU1GOXFnMDFUa1Ri?=
 =?utf-8?B?RVNOR3RVT3oydjlZSnBJWWFuQWNzajZjMEV2MERoakZlZ2l3bXR4Slh1b29a?=
 =?utf-8?B?dFNVRmFjZlFqSkE4WnU1alkvR0NsSDdhZ2g4QndlNXRSb0c3dmU0S290ZGRU?=
 =?utf-8?B?VmF6NUFwZzJCbE00NENRNGVPQzV1ODgyS0w3UTB0YmZRUFBUdkVOdEgvckJ4?=
 =?utf-8?B?MGZUczVUbGxFUC9pd1hFc3psRDcvaFVkckRUZ0ZNQkNUbExrOTNicUxjM1A2?=
 =?utf-8?B?T2lRR09KVldXaFRVTGdvRWNpK3hwL1htUnpFTmdIMGVTUzdaSTdPdmVpZHlr?=
 =?utf-8?B?eXRPWStCTDR5YUFVK3JsSjNjNUN5ZUlnSWdpQUd6UCswTmgwMm4vdjdVS3hV?=
 =?utf-8?B?VktTL25lLzNRbXBqN01FK05SRWVlUnpZRnkzSUZwQ0VJTXkzUUJzWkJmaVl3?=
 =?utf-8?B?aWFMSVlzZGdabTNHS28zSlpLK0g1NVNtQlRDQXc0ZG83V1g3eld2UHE1SC9m?=
 =?utf-8?B?cytDRTNIOGMvakxrN25nRVRGRmx4VkdheXZ0d2V2Tkt5RkM4TU9XM2FJYi9Z?=
 =?utf-8?B?c1Z1bHl4ckg3S3oxOE85OGNVR0xMOHlrenFqS1pKaWVSR29pRkVSZjRaczE0?=
 =?utf-8?B?dUlseTBBcXBrdEJ6aFFmRkxHMkJpZC9FUUI1cGxublJvdlNUalhCcE5kK3lU?=
 =?utf-8?B?eDg2VWxzYnFRYWNQV1U3bkh1SVA2Um40N2FaQ0l0dUt1VGtHWlViNVhtclNI?=
 =?utf-8?Q?xgks25m36kJITGlUgI/+ArZjZMlm4Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckcxOWpKcy9zRUt0Tk9LaFFHRU80OG1nczF3Y0dQUnByVmdKcktvMHVXVHpk?=
 =?utf-8?B?aVdLcGo0Vy9LemxKL2cvSkJLRktHMVBsQ1BmSm5rM2NYYXlvSkIxa2NmakpG?=
 =?utf-8?B?SmNZOTNoTEpaVkQrdHJvcjFidXRtaU9SelV6Nm5EOEdoamV5ZTk0cm9zd2k5?=
 =?utf-8?B?Q2t4eitWYVdTNGlDYzhMZHNQVlM3a2o0enlEemx0QzZBNDVlYzlyWWd1bGtn?=
 =?utf-8?B?Y3RtQW9oYjRBYmt6RWlpd3ZlTTcvbWVPekhZZ0huVjRuTFRCNGxiNUNreldF?=
 =?utf-8?B?UTc2UUIvQkxLUG1EL1cwTDNxcTJkMXlDRmd4WEJJY1l3d1hqTGltbGFEZlhl?=
 =?utf-8?B?SVp6WXBEOXEwYnl3MFpFTXN5WUhtSFpCQVRiLzF5ZWV6WGRZSDZuZDk5OWNX?=
 =?utf-8?B?alRUL0c3KzB5TC9IeE1XQTdnQXRidmUrQndxbXM2eDJGSVBVQWkwWHdrZExM?=
 =?utf-8?B?T0RNazcxblA0MmNhMG92ZmlKSUN1MHJMVk5JQURveDQ0NXRHL1puK3ZRY1I4?=
 =?utf-8?B?Nm10V01NQjZOUE1ZZDZ6bWFjcjk5RVBiVDRpeVc0SXAxSjVuY2ljUGlraVVY?=
 =?utf-8?B?WlArOEJIbDBRY3VQZFk1Z294OGp4MnI3a29XQ1dBRHlPdm5BYTIrdStIYlJJ?=
 =?utf-8?B?YkxTaFZ1eXMvTnRmZ1RZZUR1RlNuUjBtVXE0Y01nRUwxZW1xcjRoc2dHaXgw?=
 =?utf-8?B?S3MxKzY1STRld0dHQVhjbWxDRHpieHlWV1FFaUdHYzg3MTVsczEyUjBMTHN5?=
 =?utf-8?B?aTNNRlJtTkNFOTBsZEJET3cweFJCNjFCa29QSG43cjdvd25jQTUyVmZneGsv?=
 =?utf-8?B?US85SFBKVzZIYVFVVi92UVh2RFdabFpLUm1LdmtzR3hCb1A0S3AzQTZBQ1Ni?=
 =?utf-8?B?eWg4Y1RocHorM0NBUHNKRUVpQmJtYU1sY2Fwb1ovZnMvWUJYYlhzc2NFTi9t?=
 =?utf-8?B?cVZWUE9QRjRkWkZIOExoa0ovOWpMR1dJeWg0R1ZlMjlXTS9FS0lvN1Q3ZjVa?=
 =?utf-8?B?U05XclErQi84R29KZExqUldUSENHQmJROXhVMVhsVnZlUkZqMHJGd1pDRHFO?=
 =?utf-8?B?Vzl6Y25NL0xzNUc5eUVaeFZLb2pKdVZ0d1FJNWRycnNlTTJDeU5JOHdUVkxE?=
 =?utf-8?B?bW91czFCbVdKbGpycm1pSTl4WlVVUjFaUS92dUxpUXd5OGI0K05UWVc2Sk1R?=
 =?utf-8?B?dnVYKzR2bnRhUTdNUVU1UnNtd2RiUUpzT1JpdFR6d3lFQ2Z6RHJ3N1ZRN0JB?=
 =?utf-8?B?NkYrVUFhQkZHcTVGL05pQXZXaHJIODZmdVNJV00wZm1WdUJyUC9UUkxVaXVh?=
 =?utf-8?B?WlFnbEllckpGSjdsOXU2ZnlRanlmb0o1ZTBxb1ZKaDlTeURIczVDR0ZCZE9w?=
 =?utf-8?B?dk9nSUxiSjE2WWdCeDdhQ2FNQVRDa3NNR1J0V1Zjd3ZCWFUrdHV2NFYzZ1ND?=
 =?utf-8?B?bTd5UkZDRDFhdkZMUGxaWkUxUWhCMnNvT2NjdTM0bkZKQ3pJcGlpNnREYWVO?=
 =?utf-8?B?Vkg4b0tCTkUyZTArQXZkRW12S3FtZXVnWEJIbTIrQitHcWhNMFVBQW9RUEk0?=
 =?utf-8?B?Ymo0K3A4d3g1eXJjQ0g0aW9yVmgyWTZ6c3Nja0pmUEJqanNmbkFXbVFZRFB3?=
 =?utf-8?B?L1h1TXNwbGRJZmVqeXdxZ0hzL1ZwWUJPK3dDcENlNWdMWFRyaHJFRkR5cTF4?=
 =?utf-8?B?U2EvSURhSnJYTUdaZHBLMUVha2g4Q042Ni9DTWRESXd0R0FVcVJDRXI0aTAv?=
 =?utf-8?B?QjhDNDErYzlDdStGN01YV0N2Zk9pcTA0TTJYZ252QWtvU2U3enNPMkVvVElO?=
 =?utf-8?B?Rk45eGRYT1NKVUY3YVdqK0dSVDJ1Q08zV0dESUt3OTJxMDV3N015Ti9JeUth?=
 =?utf-8?B?cThqbEpZTlhSeHhWMW1MSkttME1BK1NGNnp6Sk4zSHRScUs4YXBQdUtFbG5U?=
 =?utf-8?B?VC92S2tramNISDNNVGhZNkFDVTBFYWVoNW42SmRQWjBmNzRVVXpRTG9BblZ0?=
 =?utf-8?B?UHZJSDhaTlRUWmJuV1BvWUJlZlVCcWRaRkFHNm1MbzBPSHNMaDhOTUd1RzRs?=
 =?utf-8?B?cnVrOTI1N1ZsZ0ZIL1JXdHAvNjhTSmlnNFdvdENZV1NkM2lGcnY5MjEwUGZl?=
 =?utf-8?Q?k9KD4XYHcr/HHUptYJZpzF1PR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a43556b-5b4a-410c-40f5-08dd9c713b42
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 16:20:29.5848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZO5bo2AjlDxe/zsxO47XpRi9rUOsjh08HGSA0PtoD4m+YqAQI/3b0RaSel2KfMBZqr+qFaV32oRLdAOfTv6zv2qIP9BLUmIxBUMB1fXYXiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5941
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

SGkgRG1pdHJ5IEJhcnlzaGtvdiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+
DQo+IFNlbnQ6IDIzIE1heSAyMDI1IDA3OjM3DQo+IFN1YmplY3Q6IFJlOiAoc3Vic2V0KSBbUEFU
Q0ggdjYgMDAvMTBdIGRybS9kaXNwbGF5OiBnZW5lcmljIEhETUkgQ0VDIGhlbHBlcnMNCj4gDQo+
IEhpIEJpanUNCj4gDQo+IE9uIEZyaSwgMjMgTWF5IDIwMjUgYXQgMDk6MTcsIEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBEbWl0cnkgQmFy
eXNoa292LA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgc2VyaWVzLg0KPiA+DQo+ID4gTG9va3Mg
bGlrZSwgQWZ0ZXIgdGhpcyBwYXRjaCwgd2hlbiBJIGNoYW5nZSByZXNvbHV0aW9uIHVzaW5nIG1v
ZGV0ZXN0IGl0IGlzIG5vdCB3b3JraW5nLg0KPiA+IE1vbml0b3IgaXMgc2hvd2luZyBvdXQgb2Yg
cmFuZ2UvTm8gc2lnbmFsIG9uIFJaL1YyTCBTTUFSQyBFVksgY29ubmVjdGVkIHRvIEFEVjc1MzUu
DQo+ID4NCj4gPiBOb3Qgc3VyZSwgSSBhbSB0aGUgb25seSBvbmUgZmFjaW5nIHRoaXMgaXNzdWU/
DQo+IA0KPiBJIGhhdmUgYmVlbiB0ZXN0aW5nIHRoZSBzZXJpZXMgb24gZGI0MTBjIC8gYWR2NzUz
MywgYnV0IHNvbWV0aGluZyBtaWdodCBoYXZlIGNoYW5nZWQgYmV0d2VlbiB0aGUNCj4gdGVzdGlu
ZyB0aW1lIGFuZCB0aGUgcHJlc2VudCB0aW1lLiBJIHdpbGwgdHJ5IGNoZWNraW5nIGl0IG5leHQg
d2Vlay4NCg0KSGF2ZSB5b3UgdGVzdGVkIEhETUkgd2l0aCBhbGwgdGhlIHN1cHBvcnRlZCBtb2Rl
cyBnaXZlbiBmcm9tIHRoZSBFRElEIHVzaW5nIG1vZGV0ZXN0Pw0KT3IgdGVzdGVkIGp1c3QgMSBu
YXRpdmUgcmVzb2x1dGlvbj8NCg0KQ2hlZXJzLA0KQmlqdQ0K
