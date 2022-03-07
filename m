Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0204A4D03AC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 17:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D82E10E040;
	Mon,  7 Mar 2022 16:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C42B10E00D;
 Mon,  7 Mar 2022 16:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1646669145; x=1647273945;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nZXLDzFPdi3U7KAMu2hlTvrnDOXf3uZQ1SR/w89LsjQ=;
 b=zsVdItO2VMukzTGclWeejnYo4LKkoShrpmE5rOJwnqjByXg6EfidPiSP
 rgIDcbgNFlY36JIupTDpvQTD+ohgAx6XIgGCN6Rbjj1XWeQ30FPKUhWHl
 OIDK7u/X1hI/plpKB3NLXua1RdCRSGEWSUnSiPBS/rqGXEY9ODIwu/jR+ c=;
Received: from mail-bn1nam07lp2049.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.49])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 16:05:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLHuMgOYquqePxMDgF1bRie/Rfs+mq40vx4YS+tfTcfpEdllHD63Y0Mz2+QMDQPFpZap/PkA1PAI7dPhM23QZd6wnFrKHHET5Yl3TU3+AM30fuEfd8pn3ya1GhJs5eWJTb+HMVwLfCnow9uWg9qm44SBGcqrkBtaPD1NY7L9I+9LV3b0QPWksuU9NMCyaZSobnu0Lj7P1/08w3oPwNPz9Pqq4Ov2ydREm574yPpQ6vH8bb8QADSFC8W82m+PN8WY1rdPEPtP0FF752klC+aeD9LbgnoIGMKFHdL2SjDwZESYUJeBcsyPQa8q4DuZ0Ttcx+FbUAOZCqcGVG9WnVsSHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZXLDzFPdi3U7KAMu2hlTvrnDOXf3uZQ1SR/w89LsjQ=;
 b=iKhK4uaZ6i2y2g1tSxMrod64ON4ySSwKJIH01uc+K2xFhvOl+x9MygI4sx5YC0sabqBERiQlBAppr8Dt0u8+cE2CfwZLIsV7CoSNyTCtw86IGi1tH2P5b2/ONms1TYn+alFBoFyCnnfEAtrBOyKbP0XMQG3P1A9eS4i1KBSGaPUJhKGTIJZYRHp8pt9iPqZD3FPBJ4kroyu5mVky5K6mW5x9IetZWwaf8pqWuj9VauzIaAbMsqbS4M/3YnMCHaOUPxz7eHuAKvHcEDNoWweNI+702IDZHWV1PjH/gqVERFYrtObbLC+vbg/AWTatxwI1b5/5Vn4D4+Ji7bW4oP+lqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:163::15)
 by SA0PR02MB7449.namprd02.prod.outlook.com (2603:10b6:806:e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Mon, 7 Mar
 2022 16:05:37 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::198b:e44b:f8af:4635]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::198b:e44b:f8af:4635%7]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 16:05:37 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, Doug Anderson
 <dianders@chromium.org>
Subject: RE: [PATCH v4 4/4] arm64/dts/qcom/sm8250: remove assigned-clock-rate
 property for mdp clk
Thread-Topic: [PATCH v4 4/4] arm64/dts/qcom/sm8250: remove assigned-clock-rate
 property for mdp clk
Thread-Index: AQHYLuK1nG/wArgP6UGgx/KZFUbfsqyuVUAAgAABtYCAAAVGgIABaW+AgAAGOACABE55IA==
Date: Mon, 7 Mar 2022 16:05:37 +0000
Message-ID: <BN0PR02MB81739261DB51A8BD9629ADA8E4089@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJpqkK8q7g8q56rfiOO22ykxgycJTpSJKHuhcqGk05nsVzA@mail.gmail.com>
 <CAE-0n53jGQcn=NThrrW92NL-cry8yrFErdSYTHHEHWW48b3xbg@mail.gmail.com>
 <CAA8EJpoEpn2RPByeDkaGPUX+OC7tvbEw4k78Gd+RKs02jpzG1w@mail.gmail.com>
 <CAD=FV=WZUSuNa0Ei_0ByjHRdsJ7smhD+uVghs28NzNGvGp0LwQ@mail.gmail.com>
 <CAA8EJpq7XEy2C5=80HMHcy3wvB2CJetyQhcjQRcTtEafauy91g@mail.gmail.com>
In-Reply-To: <CAA8EJpq7XEy2C5=80HMHcy3wvB2CJetyQhcjQRcTtEafauy91g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7788190a-f04f-4a8d-4833-08da005451d9
x-ms-traffictypediagnostic: SA0PR02MB7449:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SA0PR02MB7449E233CF4455C930FDF497E4089@SA0PR02MB7449.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cirsqqv2z9UDIaeT/db+n1yc+4OA3DtGsK5wGORm6VBQjFrCscTD/vxI/K6JRCKrp0/SVXN1rEdaXr2PrJ8/EU9sYYGbKmF2oE8oHnGAntuDhe5s57qCBGiJeHadq6OujaNjfRXUAZA9dD7OFq7+9GX7PvUFukfGDasGznARujrmvbKjFpLwvu+XWPjtX10CdKFepfoRa0QlTf+YWiXy5r7E6byuFxZxVlUZFnnbV1oUuJm5l6Mz8wd7Nli6L2qfTSx4uGdWgO2pFzvrWD9WlwgtWdlqK7SrxVcilaOuil6o1N3ACGDdg/t4khMp/YsMtRNE1WBDqWUGZNMIoPWH+85FFHTI7A4S51EPE0nolc1yWWjDIeWHT6krV2P4vEPmitSVPXnDXFe4e6xAUg/WvKoAHw4NKMJI+oK+yribbZdIw9FS18aEwvXF92/DWLg+/yl930HCL2/j9NtH5FbzZm1yhfRxd0opIhTpTP3X8wS1TB8aEJDbkr+D/QKIH2SK/g9CmqV2KWSIstUBD8124I8cdU/Z5n+T1pmOz+vUdO/m3dwpbWy2yNMEeMM8ZRijaC5siL99TJTU8SC46kFrEg3xFLbkz3IbHe+0+uvMAV6Gm7o3rZk16Vue2dI66LgkdAuAGTBhRxn2evyo/AnkivG5ncAuchNjJgz+gBQdZQohq8t4MV5rjEoLuwO7esauN9cIGMynbJk3RvGBeja0ug==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(110136005)(55016003)(52536014)(54906003)(8936002)(33656002)(83380400001)(8676002)(6506007)(316002)(122000001)(508600001)(38100700002)(9686003)(7696005)(53546011)(4326008)(186003)(107886003)(5660300002)(26005)(66946007)(76116006)(64756008)(66446008)(66556008)(66476007)(38070700005)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0lLUytuSUUvQVE5cFZtdlhacGdhT2R0aWFuZ0tobmpmOWlPbUlzRW5vQ3FW?=
 =?utf-8?B?YzRaakdUS1E1QXR6RWNqMHhyeWNjNUlJNHprbC9RdXpLc3VTYUpjZUlYeC9H?=
 =?utf-8?B?Ry9JUkczNm9BTXJmeFlvRGdUWVMvMTQ4UWl3ZlVBbXdZc2dwU0pIa0l4RVZO?=
 =?utf-8?B?Ukgvb2NDQzlDV0hjVU85VW9wSlZQTVAzSFBtV0JVazJQZkhRV1hRUXF4T1li?=
 =?utf-8?B?TXNFNkRsMjdLT3JDOFoya2ZrZE01K3dWNlRLei9QZTFwaTBZSEdVM0R3WFd5?=
 =?utf-8?B?TmZTeVZxNmFyc2duUHR4YjNjK1QyU3A3V3R0d3BLTnV2VmY5Qm5HUUV4ZzdQ?=
 =?utf-8?B?SnlUYzgwL0YxdHJFQmVQQ1NPWXdIZjd3Y3RJSS8wYVRPMHV1amJ5NEZ3dHZp?=
 =?utf-8?B?QU0xc3kyRHVCME5KcWhVcXVlb1ZuMndRQzkrbnZBZTgrRVRzSkVaRFBoMUhS?=
 =?utf-8?B?Nk1YdTFkTytaV3ZWZUpaRmliTjh5MnJjN3NDZ1lRV0NWVnZFWkk2N0d5eWxi?=
 =?utf-8?B?T0FUeXBKMWEyVDl3U2J5U0lpOW5reHdQc2tXeTdqbUYyakozV2N6ZlJnTitx?=
 =?utf-8?B?QnhzOUhuK0haSjN5R0ZYUzM4YUxTanRsYWs4YzR0NVlWcDVyTjFtemxlYU1z?=
 =?utf-8?B?UTRXckwrM29CUkMxOVdiS3d0bDgyVEZBdTFKUXh6bVVLd002QVI3d2lMVDhl?=
 =?utf-8?B?M0ovOWQ3dHk1cHpibWI0Y2dYRkk1VCtXN2lpZDNyOENXN0ZsZEdKWXFWU2xx?=
 =?utf-8?B?Q001b3o3Z0cyZFVaNzUxd3BMaC9UQ3h6V1dDSXhZY0IrUTFET2h0TXFvcHZH?=
 =?utf-8?B?SUdZd3N0RFFrT2FndVlzZUQxcnJ1bFAydllFLytkckxtUHJVR2lWcVZ0blpV?=
 =?utf-8?B?R2IvM09rc2NxbmpxTktDRjJkalFxUzNKTzF0Q1QzWmgzNlQ0T1ptZDQ5dDZQ?=
 =?utf-8?B?dXFhTDhLaGR3MmRPRlg3dG5nSXQxSjVIUlFzeXZJZit2VWgvRGZqbmtrdXJE?=
 =?utf-8?B?YVRWL0NrRFI4VkZFbmkzN2lKY3V2UkQwd09kM2Q0a25EWHB3c2hXKzdqeStk?=
 =?utf-8?B?SU5jUENFbG1ZWlFuZ0sxNjFqZEorMlBDc0ZSOWdoa0t0MnFGY04vQm9jUTAr?=
 =?utf-8?B?dUFzVlN1ODVhWGxjWnZ3VkNVbm1HNm1Yd1RJWkJGZXBvZkFFTnB2aGxNZm40?=
 =?utf-8?B?OURPeVR2U2JnNVIxdEpTb3RMdWVFYmowc1paM2dPakFWTVExVU1FaU9uSDVS?=
 =?utf-8?B?d0hVanZ0L3BYV0VuZW5memxZb2JVMEFBZmhvQ3NwVW9ZSTYwN2srcjV1M1B3?=
 =?utf-8?B?M3ZEYnBKOHFoU1pzN1hob1ZCa1ZLMU10c2d3VTJYbmJUdnZNS2Yza2RiMVBI?=
 =?utf-8?B?cE9SWWpOZFFZMmFyVFNEdlhqQWYyZU5vOUI0TEwxRENZRmZBTWlKRzkrc29n?=
 =?utf-8?B?TWtwODZWZXQ0dWYxM2ZDOVZnWE9ya3RFK0pSZkVTbVFFMHdVbGoxYS8xSXV5?=
 =?utf-8?B?UXMzR3ZWQ3UyQ010aG4yVFFPNS93eGszYTdGT0xSU2RZd1lNS0E5akJaZDRM?=
 =?utf-8?B?bCtxQzFMY0FkYzRxc1ZPYUMxU3djS0NQaGRwLzBUejdzYkJzaXhQY2Zvemc2?=
 =?utf-8?B?WXFzZGt0K3hTWE1TOTJCUHg1WnlZY3NLY3BoY011ZlJ3ZER0NTVSV1U2emZs?=
 =?utf-8?B?M2hteUpIbDJTQ0hGOEVUZlVnb29mRnNKM0hvRnhjSHhyTVdPWDl2NlIrL1Vu?=
 =?utf-8?B?L1JGcjV3d3J4Qm45SlQxZjA0Tzg2aXlYM2ViV2xld2libGZBTnA2UVFiaGpS?=
 =?utf-8?B?ODhLVDIrOUFjYXBOV3A4TlR5WDFMODNEb1pPelVGWnNNVHN2elpmc1Q3QXNp?=
 =?utf-8?B?N2VMRm1RUmlZeWhKdG4zRjY4OXFRT3Fwamh0WjlxSWNwcW9JN3c5SXBTcXVs?=
 =?utf-8?B?cFVMajZ1UDdPR0p1UlBPOTFQeEVxZXNiRlJEYjNEbi84anNPY1czbDhXdlZs?=
 =?utf-8?B?SFdFNjVPWnRyeFpmYjJKQVdkSDlaMnhkdURiV0tobGRjSUlpc3d6NVFQTFBU?=
 =?utf-8?B?VW9DT2RlVXhLbmpuSnJ6YVBrdCs4U3JXSWFoRVJWWVpUUWR4VnZPVkNzUnQ0?=
 =?utf-8?B?U2Y2MUljYTdkQzBoc3VCNnhiQ1JYejJhTlNyTDBWVi9OUE1LRjFMRkg5aGxG?=
 =?utf-8?B?emxGTkhKV0pDb3pOYms5MGNEcFRjM2ZjZlNvL0xWUFNpeTBSUnBLbkhKQVZV?=
 =?utf-8?B?eFJWcXdhdk05R2JsU1dtTFlqazNBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7788190a-f04f-4a8d-4833-08da005451d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 16:05:37.5231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 28oXDb57J8BAEdqLE8FJlq3dcVGPAwda2wFqOZAY2gKGXtb+HY7RkTCEzjKKFx5LvhAYuLJoXXjvRT4YQSZek7DwwSTWqcYLcVVhngVh6Fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7449
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 quic_vpolimer <quic_vpolimer@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBXQVJOSU5HOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21t
LiBQbGVhc2UgYmUgd2FyeQ0KPiBvZiBhbnkgbGlua3Mgb3IgYXR0YWNobWVudHMsIGFuZCBkbyBu
b3QgZW5hYmxlIG1hY3Jvcy4NCj4gDQo+IE9uIFNhdCwgNSBNYXIgMjAyMiBhdCAwMDo0OSwgRG91
ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPg0KPiB3cm90ZToNCj4gPiBPbiBUaHUs
IE1hciAzLCAyMDIyIGF0IDQ6MTYgUE0gRG1pdHJ5IEJhcnlzaGtvdg0KPiA+IDxkbWl0cnkuYmFy
eXNoa292QGxpbmFyby5vcmc+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IE9uIEZyaSwgNCBNYXIgMjAy
MiBhdCAwMjo1NiwgU3RlcGhlbiBCb3lkIDxzd2JveWRAY2hyb21pdW0ub3JnPg0KPiB3cm90ZToN
Cj4gPiA+ID4NCj4gPiA+ID4gUXVvdGluZyBEbWl0cnkgQmFyeXNoa292ICgyMDIyLTAzLTAzIDE1
OjUwOjUwKQ0KPiA+ID4gPiA+IE9uIFRodSwgMyBNYXIgMjAyMiBhdCAxMjo0MCwgVmlub2QgUG9s
aW1lcmENCj4gPHF1aWNfdnBvbGltZXJAcXVpY2luYy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+IEtlcm5lbCBjbG9jayBkcml2ZXIgYXNzdW1lcyB0aGF0IGluaXRpYWwgcmF0
ZSBpcyB0aGUNCj4gPiA+ID4gPiA+IG1heCByYXRlIGZvciB0aGF0IGNsb2NrIGFuZCB3YXMgbm90
IGFsbG93aW5nIGl0IHRvIHNjYWxlDQo+ID4gPiA+ID4gPiBiZXlvbmQgdGhlIGFzc2lnbmVkIGNs
b2NrIHZhbHVlLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IERyb3AgdGhlIGFzc2lnbmVkIGNs
b2NrIHJhdGUgcHJvcGVydHkgYW5kIHZvdGUgb24gdGhlIG1kcCBjbG9jayBhcw0KPiBwZXINCj4g
PiA+ID4gPiA+IGNhbGN1bGF0ZWQgdmFsdWUgZHVyaW5nIHRoZSB1c2VjYXNlLg0KPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+IEZpeGVzOiA3YzFkZmZkNDcxKCJhcm02NDogZHRzOiBxY29tOiBzbTgy
NTAuZHRzaTogYWRkIGRpc3BsYXkNCj4gc3lzdGVtIG5vZGVzIikNCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IFBsZWFzZSByZW1vdmUgdGhlIEZpeGVzIHRhZ3MgZnJvbSBhbGwgY29tbWl0cy4gT3RoZXJ3
aXNlIHRoZQ0KPiBwYXRjaGVzDQo+ID4gPiA+ID4gbWlnaHQgYmUgcGlja2VkIHVwIGludG8gZWFy
bGllciBrZXJuZWxzLCB3aGljaCBkbyBub3QgaGF2ZSBhIHBhdGNoDQo+ID4gPiA+ID4gYWRkaW5n
IGEgdm90ZSBvbiB0aGUgTURQIGNsb2NrLg0KPiA+ID4gPg0KPiA+ID4gPiBXaGF0IHBhdGNoIGlz
IHRoYXQ/IFRoZSBGaXhlcyB0YWcgY291bGQgcG9pbnQgdG8gdGhhdCBjb21taXQuDQo+ID4gPg0K
PiA+ID4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25nLg0KPiA+ID4gQ3VycmVudGx5IHRo
ZSBkdHNpIGVuZm9yY2VzIGJ1bXBpbmcgdGhlIE1EUCBjbG9jayB3aGVuIHRoZSBtZHNzDQo+IGRl
dmljZQ0KPiA+ID4gaXMgYmVpbmcgcHJvYmVkIGFuZCB3aGVuIHRoZSBkcHUgZGV2aWNlIGlzIGJl
aW5nIHByb2JlZC4NCj4gPiA+IExhdGVyIGR1cmluZyB0aGUgRFBVIGxpZmV0aW1lIHRoZSBjb3Jl
X3BlcmYgd291bGQgY2hhbmdlIHRoZSBjbG9jaydzDQo+ID4gPiByYXRlIGFzIGl0IHNlZXMgZml0
IGFjY29yZGluZyB0byB0aGUgQ1JUQyByZXF1aXJlbWVudHMuDQo+ID4NCj4gPiAiQ3VycmVudGx5
IiBtZWFucyBfYmVmb3JlXyAke1NVQkpFQ1R9IHBhdGNoIGxhbmRzLCByaWdodD8gU2luY2UNCj4g
PiAke1NVQkpFQ1R9IHBhdGNoIGlzIHJlbW92aW5nIHRoZSBidW1wIHRvIG1heC4NCj4gDQo+IFll
cy4gJ0JlZm9yZSB0aGlzIHBhdGNoJy4NCj4gDQo+ID4NCj4gPg0KPiA+ID4gSG93ZXZlciBpdCB3
b3VsZCBoYXBwZW4gb25seSB3aGVuIHRoZSBkdXJpbmcgdGhlDQo+ID4gPiBkcHVfY3J0Y19hdG9t
aWNfZmx1c2goKSwgYmVmb3JlIHdlIGNhbGwgdGhpcyBmdW5jdGlvbiwgdGhlIE1EUCBjbG9jaw0K
PiA+ID4gaXMgbGVmdCBpbiB0aGUgdW5kZXRlcm1pbmVkIHN0YXRlLiBUaGUgcG93ZXIgcmFpbHMg
Y29udHJvbGxlZCBieSB0aGUNCj4gPiA+IG9wcCB0YWJsZSBhcmUgbGVmdCBpbiB0aGUgdW5kZXRl
cm1pbmVkIHN0YXRlLg0KPiA+ID4NCj4gPiA+IEkgc3VwcG9zZSB0aGF0IGR1cmluZyB0aGUgZHB1
X2JpbmQgd2Ugc2hvdWxkIGJ1bXAgdGhlIGNsb2NrIHRvIHRoZSBtYXgNCj4gPiA+IHBvc3NpYmxl
IGZyZXEgYW5kIGxldCBkcHVfY29yZV9wZXJmIGhhbmRsZSBpdCBhZnRlcndhcmRzLg0KPiA+DQo+
ID4gRGVmaW5pdGVseSBmZWVscyBsaWtlIHNlZWluZyB0aGUgY2xvY2sgdG8gc29tZXRoaW5nIHBy
ZWRpY3RhYmxlIGR1cmluZw0KPiA+IHRoZSBpbml0aWFsIHByb2JlIG1ha2VzIHNlbnNlLiBJZiBp
dCdzIGp1c3QgZm9yIHRoZSBpbml0aWFsIHByb2JlIHRoZW4NCj4gPiBzZXR0aW5nIGl0IHRvIG1h
eCAoYmFzZWQgb24gdGhlIG9wcCB0YWJsZSkgc2VlbXMgZmluZS4NCj4gDQo+IFZpbm9kLCBjb3Vs
ZCB5b3UgcGxlYXNlIGltcGxlbWVudCBpdD8NCj4gDQo+ID4gSSB0aGluayBhbg0KPiA+IGVhcmxp
ZXIgdmVyc2lvbiBvZiB0aGlzIHNlcmllcyBzZXQgaXQgdG8gbWF4IGV2ZXJ5IHRpbWUgd2UgZGlk
IHJ1bnRpbWUNCj4gPiByZXN1bWUuIFdlJ2QgaGF2ZSB0byBoYXZlIGEgZ29vZCByZWFzb24gdG8g
ZG8gdGhhdC4NCj4gDQo+IFllcywgdGhpcyBpcyBjb3JyZWN0LiBCYXNlZCBvbiB0aGUgY29tbWVu
dHMgSSBoYWQgdGhlIGltcHJlc3Npb24gdGhhdA0KPiB0aGVyZSB3YXMgYSBzdWdnZXN0aW9uIHRo
YXQgdGhlIHBsYWNlIGZvciB0aGUgY2FsbHMgd2FzIHdyb25nLiBNb3N0DQo+IHByb2JhYmx5IEkg
d2FzIGluc3RlYWQgcHJvamVjdGluZyBteSBvd24gdGhvdWdodHMuDQo+IA0KSSBoYWQgZGlzY3Vz
c2VkIGludGVybmFsbHkgd2l0aCB0aGUgdGVhbS4gVHJhZGl0aW9uYWxseSwgbWRwIGNsayB2b3Rl
IGR1cmluZw0KcHJvYmUvYmluZCBpcyByZXF1aXJlZCB3aGVuIGRpc3BsYXkgaXMgdHVybmVkIG9u
IGluIGJvb3Rsb2FkZXIgYW5kIHBlcnNpc3RzDQp0aWxsIGZpcnN0IHVwZGF0ZSBpbiBrZXJuZWwu
IEFzIGluIGNocm9tZWJvb2ssIHRpbWluZyBlbmdpbmUgd2lsbCBiZSB0dXJuZWQgDQpvZmYgZHVy
aW5nIGRlcHRoY2hhcmdlIGV4aXQgYW5kIGFzIHRoZXJlIGlzIG5vIGRpc3BsYXkgdHJhbnNpdGlv
biBmcm9tIA0KYm9vdGxvYWRlciB0byBrZXJuZWwsIG1kcCBjbGsgY2FuIGJlIHZvdGVkIGJhc2Vk
IG9uIHRoZSBjYWxjdWxhdGVkIHZhbHVlIA0KZHVyaW5nIGZyYW1ld29yayB1cGRhdGUgYW5kIGRv
ZXMgbm90IHJlcXVpcmVkIHZvdGUgZHVyaW5nIHByb2JlL2JpbmQuDQoNClRoYW5rcywNClZpbm9k
Lg0KPiAtLQ0KPiBXaXRoIGJlc3Qgd2lzaGVzDQo+IERtaXRyeQ0K
