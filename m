Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9914E2DBF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 17:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2C910E3D8;
	Mon, 21 Mar 2022 16:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B9510E3D8;
 Mon, 21 Mar 2022 16:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1647879701; x=1648484501;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DQljcbJhRnMX/NnxrAp+hABj2GlYAfRVVTrS7+aby0U=;
 b=kHq8y9kw5zeottQVV8irKo5djhOfgSRGwyCX2lkpaTsB+/E6gE+XAsk3
 KtcSwm2hGarqzdsbLdq/YmvSo+fCXSkAOlJ7EaQSJyQHMrSlEHNUX7DUG
 95lKsK2u7LbxjNCgEwHJDXjyfBIflI7nzFBX1wk5asqkG2ObfJnIebxi0 0=;
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 16:21:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnUBNb31pvBxSDSTBy2Y8ylc2It4ssWmR7cQaiduBRo4RHGEWIkgMkEBNEa2d830H9yi6bGYKThfsnRSl+1fKbFyj+iJv7wqi1O5O/sxq5PWuCnkbmHJBrpCZeRT0ulpmWyqP7lnoDZoNlTfQIwzo0j+L6Q0KYbxPeNO/lBCtoU31bp8q0He30YR7eCSQZ8G/yWhreOac4vVBpGN7U8eKpk7lPUeBvkyPTfKAm6bfZ6JJk56PIqZ8gMheuDr+J3hZonJdLLbLNCOPzT1vc5KDe8TYEHRKv7UWZinAqkaWl+nsAt6EtNLyGUQlxquLV6/+ZYeUlnaxK7GnWyYWDPp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQljcbJhRnMX/NnxrAp+hABj2GlYAfRVVTrS7+aby0U=;
 b=jv9lBAYKXfSwTzKWf+tRZtv+2cYLnMNK3XzE5lXqBR7c73sPQPlfXUiRy4NO6AmQbAkEHyi7JmfpfNEJ4KLLQpZ1Fca7lrtxJDGS2plWLoozoDuqyPI66iIh4I75+L7AMn/DIW1i9dvetg5jO3Ie+KIXjFChOvYLT4C2Lz4ajoIbCFTh/HzM4kk19VxuSlkxSuha+R+DLkmb9zy499UNfdlmbJ2DdSeLLwRVGrnEaGfjFbLLJ7zZhcdYJXOY9Mw6WoyQG0pCTUmfJ1DqytRFMUz/60fQtPhVSdu2ogMucwyA3uziW3w5wbbAwrOCIsSK8wRvIG72sQpyl3bQHbrp4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:163::15)
 by SN6PR02MB4415.namprd02.prod.outlook.com (2603:10b6:805:a7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Mon, 21 Mar
 2022 16:21:36 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::8135:e90b:883:4853]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::8135:e90b:883:4853%5]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 16:21:36 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: Stephen Boyd <swboyd@chromium.org>, quic_vpolimer
 <quic_vpolimer@quicinc.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>
Subject: RE: [PATCH v6 1/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
Thread-Topic: [PATCH v6 1/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
Thread-Index: AQHYN7JpyaIUkUBnYkOtfqwew+UyfazEF5wAgAX3NtA=
Date: Mon, 21 Mar 2022 16:21:35 +0000
Message-ID: <BN0PR02MB8173BBD2C02F5DFBEBE94E40E4169@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
 <CAE-0n51vfoOK_6B0yAvws32MtLQ1SvBPoQPHBFE14TLzZFUZaw@mail.gmail.com>
In-Reply-To: <CAE-0n51vfoOK_6B0yAvws32MtLQ1SvBPoQPHBFE14TLzZFUZaw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b73241c4-5651-4355-f15f-08da0b56dedf
x-ms-traffictypediagnostic: SN6PR02MB4415:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SN6PR02MB4415AA0AACF80A61A6AE80B3E4169@SN6PR02MB4415.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Vld2Lk5llwVeeqhCdZfrjKX+hllqGIs9wvHIJjLJFaeUaTLdCzWHKz8KCPG44ZiGzYkptkfCTtWLD9GGc2HNnpAl82SPEmBt/WKC5ue7BTm0Vpm+7DYiUlnvE/0t+vLRMgAYTwn5QWDJFRdtGGCslal4PiPLXL3hcHr9ON/ioUpr0h252ZM2RTEbwhpXAuonYvfDqxpxI99xdcCAuTKHyhY5Sko7I/1uIh9nrtrtVVbZA0iFjXaaFo9Jgx4uVIPOV9IyPKCnE9SSQVnX64F8Q5xC8MHPBfrq9OfJ36tOzNIYqHUTaI/TAhWwEJRdXCtYaWRxSSFG7veYta8nq2xb+DfBMDuMFJzpNYVgGPSM/HYw+BNoAdu8uKzRE0jpeoehHDoZ8+Fi2C6kA7N1ihjGghBiBIRJstkW3P9aGYuJEuNDu0MNP80UdKzfQYywgsfx5hbDaxEdc5ly3HMIVYi72iSDhiw9G1c3IgDKl3pb/Jihqu5zWnw0yhHvz0PYRRhkvJg+afCSw9u/PlvtrtRLN4kNFITNhtEvX8joHJyOgwwuad/C54Omnd0i1BgCuDWK+PJaIFrfNJmEZtXjwgS+SDvwbXnmKV7silNyaNussBg/n8dQwT8o0237eywwLPjYilEVdrGzHpg/+That9nvMTJfpZ35qsu+QUCbpVa04ilmn0VEsHCuNVAnqjw3ND7p5W0kEJS9ymbeERDHHTbrQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(83380400001)(9686003)(53546011)(4326008)(64756008)(66946007)(66556008)(66476007)(66446008)(8676002)(76116006)(26005)(110136005)(54906003)(186003)(86362001)(55016003)(38100700002)(52536014)(8936002)(122000001)(71200400001)(38070700005)(33656002)(6506007)(7696005)(2906002)(5660300002)(316002)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SllUSlRLTk8rMURkaVBJazI4ME16ekhwQlhJNnAvSzNETUk2K0hZVytXUHFE?=
 =?utf-8?B?NmtVUHF3K3o4U2ZNMVFSQ2U5aFFPaTI4Q3dpbW5iWW5JQ25EVlVjcmtZa0di?=
 =?utf-8?B?Wm16Z3AxdTJFaVZ6dHk5dWROelRuMFJyM2lxN1hTdkJZeTdBS1YzM1ZldXV4?=
 =?utf-8?B?WFUzY0JmOVBTZFJiT1NkQmUvcnBTa0NOcG1OWGpnQ3hvUkJQZ2xyTlhiM3Zr?=
 =?utf-8?B?cytidDFSMnZyNmFCdjRUeEZiazRQOVZTWHFPbUUwQUlXMkNxVVBoRExEcjZJ?=
 =?utf-8?B?WHlHdTE0V1Z2VFVxcVhJNURGNTFwL0p1Zncxby9pcytHdVkyVkhObDcrSTdh?=
 =?utf-8?B?VnVjYk94VHpwL1NOWG5KUVJ1MGVicnBQc0pYRnVlSWFJRnRUbmx1SU1jVHhs?=
 =?utf-8?B?aCtlcklOYWd5TFBzT1NqazBPUzg1NTh2aWNSbkJzeXcwUitvY3B1T0NEWTRX?=
 =?utf-8?B?cS84TEJPSUk0VElJSVY0Y0tWL21oYWFNUk5LMmlobGdQZUtKMWNTQVkzTWFG?=
 =?utf-8?B?MCttdE1LYzU5dU5QQzA1aUN2bjVrN1RmYktHOGpGbjFuMXVYa25JVUJpY0Yw?=
 =?utf-8?B?c0ZDS2tyNDhVUmR0Z2RQZGdsUDhmWEFzalh2akhXVlZCSDExV0xrRnhWTDBB?=
 =?utf-8?B?ZWlRbTdnVnpiU2l4K09QbjJXZFZ3ZDF0WUlKRVpZbFRnVElvOUNtY3JjWkIr?=
 =?utf-8?B?ZExHZEpHblExTXNCa0FSSmx0b1RnUnMvQnBSSGxzY2t0SFdPQTdWQ3NKc3Ey?=
 =?utf-8?B?S3dkbDFvY0Rhc1ZGZFZlbm53UzJydWozTStHOUpMemZnQ2ZSVGk5SGlnOGc5?=
 =?utf-8?B?OFJpMWhhMmdySG05eThuTE83dERkNlVScmRZWjBQVCtmVVhSRjNETVRGM3Zk?=
 =?utf-8?B?ZUFQT3prai9lcTdkTTJ6YnNiQ3d0L3RmT2sxcDNXWFR5V1JYVGtkMjlObmM5?=
 =?utf-8?B?clVDUlJzR3dtNVQ2dTdUdnJSN05haSswMlFEUVFDdW1JYi9KMWttZTZWNmJ1?=
 =?utf-8?B?bzRDd0liME1yL0lHYWJOVGNuejZ6NVRPTWlrWWF1emN0OGRDYXdhQWNtanQz?=
 =?utf-8?B?UGdWZ2xRVWp1V0RqNDZVbkVyL2grb2N2MEFCUmRJT2sxamcveUQwZmRza3VS?=
 =?utf-8?B?NWJraGltVmc3VVBsZk1ScTNtWFRNc0dML25TVzdncDlEcUdQZTBOQXMxVnNO?=
 =?utf-8?B?b2FUZ2hnNng2MERXVlVWK2xsMVo0VmFsdHRCYWNUZkZ2OXZNVXRNejN5SEcr?=
 =?utf-8?B?YTBUSW5lYWRKMURvajZqOFNQK1hEWHcrbmJMcDcwUzNUeHJsamVaS2M4Q1p2?=
 =?utf-8?B?UWpURkJOczZ6N09RWlg4RVBrZ1B6c2M0cmJLUkRabElSeXduZjY4R3Q5b3hU?=
 =?utf-8?B?WDdJeUN3MVZncWxISklaYUFPLzhXeWMzbS8wc0EySHJ0cFlxdkt2WU81cWx0?=
 =?utf-8?B?aHI5OFZyb1EyQ0UxUEw4NnhCTlFkMEt1QUs3ZG9UVEdZMWlHbFJRaWd6M1FC?=
 =?utf-8?B?QnkwaDE0V1duTXRVT1hCN0RDY0dQaEgxc1pocGVabHg1dTdINy9SdlUrUWx0?=
 =?utf-8?B?aTJqWGhsYkFJUlRBWTFtWTlFVTJRT29iZVlMU1BxTTBxbVRyQ2tEYzJNZGRD?=
 =?utf-8?B?Sm5LbUt4bnFnMjI5TFd0OERyd3lGQkFSSUFlM0N3Rit6NEtXMThwazdTRmNr?=
 =?utf-8?B?bjBocmVjQ0xxdUVvNy96VGxlMHo4VVRhQ2N1aVFnYVhTN3o1d2xUNm84UFNu?=
 =?utf-8?B?RjJOWTlJRzNHckowazNKSFJlTEdYZjVZYmRaanpWbEtvekdVZkc0b3hpZldm?=
 =?utf-8?B?eE56REVjdUtGOVJYSUc3NkUrOHpENWp0Qyt4b0VFdUJEMjVtblU4elV2dngz?=
 =?utf-8?B?cGdHM1RPc1B3Nm9UVXV2azNSb3JQb0EzNnBmRGVWdXJMTXJWQ1QzUHJiUVZ6?=
 =?utf-8?Q?JP416N3K+ep0XIdIS832YetXlqaU8wzF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b73241c4-5651-4355-f15f-08da0b56dedf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 16:21:35.9564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iavX5ws6SILA3VehhZOCNS/AXrcSdn4BiqYoyoH7TBknzKMVKTwnHOkflB5AxQQrdxghAAA4phS58XuyBG2EhG3nqSqprkDv1HKeZhiMhkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4415
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
Cc: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 quic_kalyant <quic_kalyant@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dianders@chromium.org" <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlcGhlbiBCb3lkIDxz
d2JveWRAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDE4LCAyMDIyIDI6NDEg
QU0NCj4gVG86IHF1aWNfdnBvbGltZXIgPHF1aWNfdnBvbGltZXJAcXVpY2luYy5jb20+Ow0KPiBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsNCj4gZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtYXJtLW1zbUB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHJvYmRjbGFy
a0BnbWFpbC5jb207DQo+IGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZzsgZGlhbmRlcnNAY2hy
b21pdW0ub3JnOyBxdWljX2thbHlhbnQNCj4gPHF1aWNfa2FseWFudEBxdWljaW5jLmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NiAxLzVdIGRybS9tc20vZGlzcC9kcHUxOiBzZXQgbWRwIGNs
ayB0byB0aGUNCj4gbWF4aW11bSBmcmVxdWVuY3kgaW4gb3BwIHRhYmxlIGR1cmluZyBwcm9iZQ0K
PiANCj4gV0FSTklORzogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFs
Y29tbS4gUGxlYXNlIGJlIHdhcnkNCj4gb2YgYW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQg
ZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+IA0KPiBRdW90aW5nIFZpbm9kIFBvbGltZXJhICgyMDIy
LTAzLTE0IDA3OjQ2OjUzKQ0KPiA+IHVzZSBtYXggY2xvY2sgZHVyaW5nIHByb2JlL2JpbmQgc2Vx
dWVuY2UgZnJvbSB0aGUgb3BwIHRhYmxlLg0KPiA+IFRoZSBjbG9jayB3aWxsIGJlIHNjYWxlZCBk
b3duIHdoZW4gZnJhbWV3b3JrIHNlbmRzIGFuIHVwZGF0ZS4NCj4gDQo+IENhcGl0YWxpemUgJ3Vz
ZScuDQo+IA0KPiBXaHkgaXMgaXQgaW1wb3J0YW50IHRvIHVzZSBtYXggZnJlcXVlbmN5IGR1cmlu
ZyBwcm9iZS9iaW5kPyBEb2VzIG5vdA0KPiBzZXR0aW5nIHRoZSBjbGsgcmF0ZSBkdXJpbmcgcHJv
YmUgbWVhbiB0aGF0IHdlJ2xsIG5ldmVyIHVzZSB0aGUgbWF4DQo+IHJhdGU/IERvZXMgaXQgc3Bl
ZWQgdGhpbmdzIHVwIGR1cmluZyBwcm9iZT8NCg0KV2UgbmVlZCB0byB2b3RlIG1kcCBjbG9jayBk
dXJpbmcgcHJvYmUvYmluZCBzbyB0aGF0IHJhaWxzIGFyZSBub3Qgc2V0IGF0IHVuZGV0ZXJtaW5l
ZCBzdGF0ZSBhcyBwb2ludGVkIG91dCBieSBEbWl0cnkuDQpTaW5jZSB3ZSBkb250IGtub3cgd2hh
dCB3aWxsIGJlIHRoZSByYXRlIHNldCBpbiBib290IGxvYWRlciwgaXQgd291bGQgYmUgaWRlYWwg
dG8gdm90ZSBhdCBtYXggZnJlcXVlbmN5LiANClRoZXJlIGNvdWxkIGJlIGEgZmlybXdhcmUgZGlz
cGxheSBwcm9ncmFtbWVkIGluIGJvb3Rsb2FkZXIgYW5kIHdlIHdhbnQgdG8gdHJhbnNpdGlvbiBp
dCB0byBrZXJuZWwgd2l0aG91dCB1bmRlcmZsb3dpbmcuDQoNClRoYW5rcywNClZpbm9kIFAuDQo=
