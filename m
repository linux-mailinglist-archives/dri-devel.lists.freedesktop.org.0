Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 701044D5CFE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 09:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE2510E326;
	Fri, 11 Mar 2022 08:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A0210E326;
 Fri, 11 Mar 2022 08:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1646985982; x=1647590782;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sP1BLHbw3Lr4ylz/W17EEnNydHOOsQ7UB7d755qVXzw=;
 b=nPxsO/t03ml6bRCM/FScQn4HhB6mcOfuflklJkeNyVQgM10BYWpqsUga
 N0TOjaKrTrKziqZ+7IR9yZ5NlcA6u/zOoBpkQR2A3ZRxWveZTAtCCvgSk
 8Ona3FKxZOdD4wNucdCrPX48ECvpx1Bn5T7Pr5N2bKH7ahhq5ybiaZAbU A=;
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 08:06:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWfYIsD7clEhdmem/yxxmuzlfpTb9gCHN7/3zQgvwcUF4C5kEBI8+SIAF2SKWuQphyjYLi31eqYh8FsyFoTwb7E80xjDcWci/+9D+ZwS1Vr8MZRB38HmSjNAfkKVUeEbEttN4AbtYMFNyVMX3Q95FCugl8UZPFOQs9uEKR80rYDaJXSBC2t/HmjM9QufMKoqMA8StjU2g55xLaLbhGabsJQZ5aGxgxGWyNBtqMmQFbgGGZaHcaQjQkGy5MJ0JQlLifDSt42aYkg4KKVct0YocfiQeP8xWARX+dWv/GrL2mFdoW/rSJi4dAacTtsS13Ns7ToopqrzKWq/oX5GCH7hJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sP1BLHbw3Lr4ylz/W17EEnNydHOOsQ7UB7d755qVXzw=;
 b=R8EGVxkc7txSIKBqhYXLvX+C0pmffwU/GwyNPqNsnA79Fyi6jt5C+DXCHbV9r3U1NY5OOKw8UirY6w1aniT7TIHYSzI5DdfC3wJHimbKC5WaCvruIA9kwybFTW1fF2shq8Oo5repdDejDhVzfPCT3eTadFRzXK1wkIWPlJpMgEzZYdrn2KbxZjpJWYMVQvIiFi22pz6AomIlnwKwLcoo9rM2XPvKnP5qg3aFC+pNzzgeC13ujF5OHId8IGxDcsrPd2HOhM/rRqSIVhhTlMD5b6wSLdhZ10ChtM0NGKhDTo9YMlk7TQSKuRm2Gh3wYHpe23IStXBAPyMJ0vuNOwjhog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:163::15)
 by MW2PR02MB3788.namprd02.prod.outlook.com (2603:10b6:907:a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Fri, 11 Mar
 2022 08:06:17 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::198b:e44b:f8af:4635]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::198b:e44b:f8af:4635%8]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 08:06:17 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: Stephen Boyd <swboyd@chromium.org>, quic_vpolimer
 <quic_vpolimer@quicinc.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>
Subject: RE: [PATCH v5 1/5] arm64/dts/qcom/sc7280: remove assigned-clock-rate
 property for mdp clk
Thread-Topic: [PATCH v5 1/5] arm64/dts/qcom/sc7280: remove assigned-clock-rate
 property for mdp clk
Thread-Index: AQHYMw1MIykDpUV2rUqySF9PFnA3Zay16aiAgAPtSVA=
Date: Fri, 11 Mar 2022 08:06:17 +0000
Message-ID: <BN0PR02MB8173F2E408848216D489D503E40C9@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646758500-3776-2-git-send-email-quic_vpolimer@quicinc.com>
 <CAE-0n51bfqWs8yOiyQ-A_bEQ7CZSqavz8epcFEWYyZxxoRYFHg@mail.gmail.com>
In-Reply-To: <CAE-0n51bfqWs8yOiyQ-A_bEQ7CZSqavz8epcFEWYyZxxoRYFHg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74ca4225-01fc-4ef7-4ed8-08da03360502
x-ms-traffictypediagnostic: MW2PR02MB3788:EE_
x-microsoft-antispam-prvs: <MW2PR02MB3788529A65250F676F9019FBE40C9@MW2PR02MB3788.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iDm2+oDRLTfsHYRjICKDkWREy+SLtTfk7dyQCq1BEounYSmYP/nvXzR9rq2z1aLxVK8JhRbBwxy5lOyxKUDewlYX2bhC7vzHcPXziDR6gbZvG9F868v4V9CbfFxQaTjESqGNoUZWdOFD1yF2pghuZuwZJnzWugN4GXOYZ4vFOws2j0OrQUo5hTQsHaDNxdA90b5evr4DBAe6u0IYxcYF/eSm8xkXAyLGRd8ky8mZVort2wHt7BJBsnbCG6RhNVUUHG2wbs71BEOYJFvzcbTrAcf70HRxC/5dlhZLoGPDrLu5X7fw2pB44yLYR9RbKkEeEI2U0w0TP0M9mQ8tY4sc82NU1GTOqn62KFOQJc37NRSjhkbmfvjQsjwwuR/KCpkrJNH6gaCrK1sdKJHIhJBxXr4kHD1ZC/Eyb1o0afhytDHRVHhpP7UasXpTpUVX/DQ4M297Cf3aFZhtSDSpDqzPssAIxaPHzCNsL7NomFOYMvKDvkBNMKSGPlzKMImj4wM/jG+OR2QXBono69g7ZdtShgOMYfKnjoyhBmUt46E58IjGHEoFXwIIiaGyWEf6TiDV3CN61GyKg7WLZILO/I/2E+gMRdRiWpW8sgNoDGxXFQ5KteoaNn8XOTJWIpJNGcVS8Eg5NGUcAFXizbddWnUBELJ8fKkx33JIiTA0L80cCDzqVUpoBr0Ox1u5eR5tP5p2xn5PwaETinJ+PXeJTMhpTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(52536014)(6506007)(316002)(8936002)(55016003)(7696005)(26005)(2906002)(9686003)(186003)(38070700005)(110136005)(66476007)(66446008)(66556008)(86362001)(64756008)(38100700002)(71200400001)(76116006)(33656002)(122000001)(54906003)(508600001)(83380400001)(8676002)(66946007)(107886003)(5660300002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3VUQ0pLQXg1dDA2Wlg4emE2MWFlV1hIbFNCSWx0M2hKcUpDdU03SC9HcEpp?=
 =?utf-8?B?UG1EendFNE5zbmlDWWN0YXBJNnRxNnlCbWx6S1JUVCtyUkRWdTJ4dnNiVnRH?=
 =?utf-8?B?S2xCTFhDeGRqUjZ0Rld5OUZ6Z1hrUkx1TjZyK3BZRFMrcm1LRWUydWNUUkxC?=
 =?utf-8?B?YW5HYndXZWJ4eFVSN1hEYW1QT0pONHdwN3Vaa1NFcU5PdWVEWHJuM29FM3FH?=
 =?utf-8?B?R01tNnNQTkNMZVFGRExuVkJXak04TmMzSHM3VUhDVWZqTVk0a0NzMG9JSWlr?=
 =?utf-8?B?MzdGSFQzQmFLTDRkOHRwZWk2dXg3d2FWaW9MTEhzK3BwdWNRRnc5eS9qMk85?=
 =?utf-8?B?L0YwVEhzQ0djZW0rMDlUdFgrdW50ZHRFWDBTNGVZbjJ5aGhOdWdVNGdiQVZ0?=
 =?utf-8?B?L1BJaEZIMXN5RWhLMTc4N0l6eHJQUHorb3Y5NFh3RGlJY0Yrc3A2dnJxNFkr?=
 =?utf-8?B?K3BuWXI2Wk8vVU10NlVzY1ZQSlg2aDZMaFoyTThwU1hkZFJlNklDb1RWbXkw?=
 =?utf-8?B?cHQvK2o0bUpXMU8wUHdQLzRvVWQrYVQ4cUZ2a1FXYk9DeVhqNXJTN0srUjdG?=
 =?utf-8?B?b2tOVlc2cHdUOWoyNDRYWVBsbkJWZzV2cTZ2TTNycjNWWTR6MDF1ZVFjYzFz?=
 =?utf-8?B?Y3orQklKQSs3YlNsd21LZmRqUjVuR0krQXdzNTZMWFp3SW53WHhVVE53SWVo?=
 =?utf-8?B?VHZCQXcxVnkxa2o5OVF0RWxTWXcrUlQ4ZnlmejU4cEIvNU1vVmlSbVNEQWRo?=
 =?utf-8?B?RWl6OXB4NC9tNnFLdTBndlg4RVp5eHNmSjNWYzRqS2lVWGdNb29ITGkzRkt6?=
 =?utf-8?B?Ui9mOUZQQndCTmlXN205cStmZldDTm9SRnBnNjZYSWQrMHdtSUVYbU9zeXR4?=
 =?utf-8?B?YnZISzg2aWcvNXJGdmNPSlg1QURhd3N0WHhDRlBaYVd2NDNUQklpZlhzYitZ?=
 =?utf-8?B?UUNsMWdXaUhFM1Rid09jNjJjamNYd2tMNlc3SGJyd2t5WmhpTkNkMFFFTHY3?=
 =?utf-8?B?S2loRGlzQnB0cVdQSFQ1SmZtUHo0KzRmUDdWTkRBVFhvTUFiREdrOFVtRTJG?=
 =?utf-8?B?MkZPdUI3dzdOdjVNb1IxMkYyVFBZVVRubHY3bHBTUXMzazVQbGNOWEFKOUd0?=
 =?utf-8?B?SzlVVGl3UldubnVnb1JwODlBUGl3Lzh3SlQ5QTFYVWxJUXprNDlzNGdnTC9v?=
 =?utf-8?B?UTltSG44SUZUbXRtMlV2ZWFXZEhCZlo5K1J4SVltVkk0clExdW1Ocmp5ZHly?=
 =?utf-8?B?NzQ3OG55dGZxMk14Y25NTE03Q0lScVFGODNRdjNnQ0piTSsycDFDREt4NHNm?=
 =?utf-8?B?end2eWNsSmR2Zkk4N1ZzQ2t2OW0vZElOOXhpVXlndmNnU3RPWnVsQzBuaSsv?=
 =?utf-8?B?VlNMQisxUjVEOXdMRFNyL1ZpMjN5amVXM2hvMVNKdlBsSjJ1cnN6Nmt5WGtN?=
 =?utf-8?B?TjJ5NUlCaVlSWnhDM0JTVTRYZ0RoQ1Y5bzhGcGRkYUlGaExGOG05WFJMTkF4?=
 =?utf-8?B?NWJ4cDFYSGc1dVJrU2xNK2pLTnBCT1o2YWdMbW9EQVBGVU9JN1hjL2lRNUNY?=
 =?utf-8?B?K2syOGJVcGlRUmZRVGVWcmVLeFZJWHg4Y0xKSWQyV1pkQzM5Z204NjFxVmJW?=
 =?utf-8?B?c3pDS3RBY1p6aTlCYmN5blpMeVlwWUFNc3ZEZHdwYTdnVjRTT20rVTlNaEsr?=
 =?utf-8?B?TFJsUll1NE1yb2xjMmd1aHBmbU1TRU1RbXFCSkoxNVl4Zk1LRXk5OGFObGFQ?=
 =?utf-8?B?Q0FtaFAxNXkwRTllQ1ZzYUorL2RVMlFWMkt0cXpBVkNML0xyMWY0OStaakJY?=
 =?utf-8?B?QmVkd05mdlpPc291RzVMZWdxR2lsMy9uTE83bXBjdlVZNlA4NVNRSVduUzhM?=
 =?utf-8?B?THlXbWIxMUZCZWgyanpGeVF4VDd4U09rays2TG4xSkRES3paaGcyNTM0T2Vp?=
 =?utf-8?B?WHNQZzduSFBzNXFONWdqanBKWVl3eFk2R1ZZWGl1ZzVvNGFyUjZQcVFVZ2JL?=
 =?utf-8?B?bXU3bGNiQ1lmb3U3NGh2MVNPZE9ZMnVkVDFxMEluS29GZlBpL0l3eVVQTy9n?=
 =?utf-8?B?MTI5MGx3MXlPaHlYVVMrd3hKVmh6dndmb1Y3anRyV3d2T3RQZ3cwZ1pzVzMx?=
 =?utf-8?B?ZkVzQ3RRR1RUUDk3eHNxSVFvd3BNQ3lzQ1VsNnpIMDMrclhUNDZMNy9UM2hF?=
 =?utf-8?B?U29tUHpDT3RXdFJ1OURHWmVHTDhBM3dHQXNmcVIvTlJyYURSTnBXVnZUOHZD?=
 =?utf-8?B?ZkhvR1NuZU5WUmUrc2t5MnltY1VnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ca4225-01fc-4ef7-4ed8-08da03360502
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2022 08:06:17.2720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q6E7SprS7eGD5NKPr+lL1Sno5TQBnvEZot5UCfd0oYDmWKDSYdPOAyBeQaRg6vJhpvPebIBXGJJd5fgZWt9NvKFKjBY4St1HIysa34IEt1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3788
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dianders@chromium.org" <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlcGhlbiBCb3lkIDxz
d2JveWRAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDksIDIwMjIgMToz
NiBBTQ0KPiBUbzogcXVpY192cG9saW1lciA8cXVpY192cG9saW1lckBxdWljaW5jLmNvbT47DQo+
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOw0KPiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1hcm0tbXNtQHZn
ZXIua2VybmVsLm9yZw0KPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgcm9iZGNs
YXJrQGdtYWlsLmNvbTsNCj4gZGlhbmRlcnNAY2hyb21pdW0ub3JnOyBxdWljX2thbHlhbnQgPHF1
aWNfa2FseWFudEBxdWljaW5jLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxLzVdIGFy
bTY0L2R0cy9xY29tL3NjNzI4MDogcmVtb3ZlIGFzc2lnbmVkLWNsb2NrLQ0KPiByYXRlIHByb3Bl
cnR5IGZvciBtZHAgY2xrDQo+IA0KPiBXQVJOSU5HOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJv
bSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2UgYmUgd2FyeQ0KPiBvZiBhbnkgbGlua3Mgb3Ig
YXR0YWNobWVudHMsIGFuZCBkbyBub3QgZW5hYmxlIG1hY3Jvcy4NCj4gDQo+IFF1b3RpbmcgVmlu
b2QgUG9saW1lcmEgKDIwMjItMDMtMDggMDg6NTQ6NTYpDQo+ID4gS2VybmVsIGNsb2NrIGRyaXZl
ciBhc3N1bWVzIHRoYXQgaW5pdGlhbCByYXRlIGlzIHRoZQ0KPiA+IG1heCByYXRlIGZvciB0aGF0
IGNsb2NrIGFuZCB3YXMgbm90IGFsbG93aW5nIGl0IHRvIHNjYWxlDQo+ID4gYmV5b25kIHRoZSBh
c3NpZ25lZCBjbG9jayB2YWx1ZS4NCj4gDQo+IEhvdz8gSSBzZWUgZnRibF9kaXNwX2NjX21kc3Nf
bWRwX2Nsa19zcmNbXSBoYXMgbXVsdGlwbGUgZnJlcXVlbmNpZXMgYW5kDQo+IGNsa19yY2cyX3No
YXJlZF9vcHMgc28gaXQgZG9lc24ndCBsb29rIGxpa2UgYW55dGhpbmcgaW4gdGhlIGNsayBkcml2
ZXINCj4gaXMgcHJldmVudGluZyB0aGUgZnJlcXVlbmN5IGZyb20gY2hhbmdpbmcgYmV5b25kIHRo
ZSBhc3NpZ25lZCB2YWx1ZS4NCg0KRm9sb3dpbmcgdGhlIGNvbW1lbnQgb2YgU3RlcGhlbiwgaSBo
YXZlIGNoZWNrZWQgYSBiaXQgbW9yZS4gaXQgYXBwZWFycyB0aGF0IGNsb2NrIGRyaXZlciBpcyBu
b3Qgc2V0dGluZyB0aGUgbWF4IGNsb2NrIGZyb20gYXNzZ2luZWQgY2xvY2tzLCBkcHUgZHJpdmVy
IGlzIGRvaW5nIHRoYXQuDQppIGFtIHBsYW5uaW5nIHRvIGZpeCBpdCBhcyBiZWxvdy4NCjEpIGFz
c2lnbiBVTE9OR19NQVggdG8gbWF4X3JhdGUgd2hpbGUgaW5pdGlhbGl6aW5nIGNsb2NrIGluIGRw
dSBkcml2ZXIuDQoyKSByZW1vdmUgdW5uZWNlc3NhcnkgY2hlY2tzIGluIHRoZSBjb3JlX3BlcmYg
bGlicmFyeS4gSWYgcmF0ZSBkb2Vzbid0IG1hdGNoIHdpdGggdGhlIGVudHJpZXMgaW4gdGhlIG9w
cCB0YWJsZSwgaXQgd2lsbCB0aHJvdyBlcnJvciwgaGVuY2UgZnVydGh1ciBjaGVja3MgYXJlIG5v
dCBuZWVkZWQuDQozKSBubyBjaGFuZ2VzIGluIGR0IGFyZSByZXF1aXJlZC4gKHdlIGNhbiBkcm9w
IGFsbCB0aGUgcG9zdGVkIG9uZXMpDQoNCkNoYW5nZXMgOg0KYGBgLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NvcmVfcGVyZi5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfY29yZV9wZXJmLmMNCkBAIC0yODQsMTcgKzI4NCw2IEBAIHZvaWQg
ZHB1X2NvcmVfcGVyZl9jcnRjX3JlbGVhc2VfYncoc3RydWN0IGRybV9jcnRjICpjcnRjKQ0KIAl9
DQogfQ0KIA0KLXN0YXRpYyBpbnQgX2RwdV9jb3JlX3BlcmZfc2V0X2NvcmVfY2xrX3JhdGUoc3Ry
dWN0IGRwdV9rbXMgKmttcywgdTY0IHJhdGUpDQotew0KLQlzdHJ1Y3QgZHNzX2NsayAqY29yZV9j
bGsgPSBrbXMtPnBlcmYuY29yZV9jbGs7DQotDQotCWlmIChjb3JlX2Nsay0+bWF4X3JhdGUgJiYg
KHJhdGUgPiBjb3JlX2Nsay0+bWF4X3JhdGUpKQ0KLQkJcmF0ZSA9IGNvcmVfY2xrLT5tYXhfcmF0
ZTsNCi0NCi0JY29yZV9jbGstPnJhdGUgPSByYXRlOw0KLQlyZXR1cm4gZGV2X3BtX29wcF9zZXRf
cmF0ZSgma21zLT5wZGV2LT5kZXYsIGNvcmVfY2xrLT5yYXRlKTsNCi19DQotDQogc3RhdGljIHU2
NCBfZHB1X2NvcmVfcGVyZl9nZXRfY29yZV9jbGtfcmF0ZShzdHJ1Y3QgZHB1X2ttcyAqa21zKQ0K
IHsNCiAJdTY0IGNsa19yYXRlID0ga21zLT5wZXJmLnBlcmZfdHVuZS5taW5fY29yZV9jbGs7DQpA
QCAtNDA1LDcgKzM5NCw3IEBAIGludCBkcHVfY29yZV9wZXJmX2NydGNfdXBkYXRlKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywNCiANCiAJCXRyYWNlX2RwdV9jb3JlX3BlcmZfdXBkYXRlX2NsayhrbXMt
PmRldiwgc3RvcF9yZXEsIGNsa19yYXRlKTsNCiANCi0JCXJldCA9IF9kcHVfY29yZV9wZXJmX3Nl
dF9jb3JlX2Nsa19yYXRlKGttcywgY2xrX3JhdGUpOw0KKwkJcmV0ID0gZGV2X3BtX29wcF9zZXRf
cmF0ZSgma21zLT5wZGV2LT5kZXYsIGNsa19yYXRlKTsNCiAJCWlmIChyZXQpIHsNCiAJCQlEUFVf
RVJST1IoImZhaWxlZCB0byBzZXQgJXMgY2xvY2sgcmF0ZSAlbGx1XG4iLA0KIAkJCQkJa21zLT5w
ZXJmLmNvcmVfY2xrLT5jbGtfbmFtZSwgY2xrX3JhdGUpOw0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2lvX3V0aWwuYw0KQEAgLTE3NSw3ICsxNzUsNyBAQCBpbnQgbXNtX2Rzc19w
YXJzZV9jbG9jayhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LA0KIAkJCWNvbnRpbnVlOw0K
IAkJbXAtPmNsa19jb25maWdbaV0ucmF0ZSA9IHJhdGU7DQogCQltcC0+Y2xrX2NvbmZpZ1tpXS50
eXBlID0gRFNTX0NMS19QQ0xLOw0KLQkJbXAtPmNsa19jb25maWdbaV0ubWF4X3JhdGUgPSByYXRl
Ow0KKwkJbXAtPmNsa19jb25maWdbaV0ubWF4X3JhdGUgPSBVTE9OR19NQVg7DQogCX0NCiANCiAJ
bXAtPm51bV9jbGsgPSBudW1fY2xrOw0KLS1gYGANCg0KVGhhbmtzLA0KVmlub2QuDQoNCj4gDQo+
ID4NCj4gPiBEcm9wIHRoZSBhc3NpZ25lZCBjbG9jayByYXRlIHByb3BlcnR5IGFuZCB2b3RlIG9u
IHRoZSBtZHAgY2xvY2sgYXMgcGVyDQo+ID4gY2FsY3VsYXRlZCB2YWx1ZSBkdXJpbmcgdGhlIHVz
ZWNhc2UuDQo+ID4NCj4gPiBDaGFuZ2VzIGluIHYyOg0KPiA+IC0gUmVtb3ZlIGFzc2lnbmVkLWNs
b2NrLXJhdGUgcHJvcGVydHkgYW5kIHNldCBtZHAgY2xrIGR1cmluZyByZXN1bWUNCj4gc2VxdWVu
Y2UuDQo+ID4gLSBBZGQgZml4ZXMgdGFnLg0KPiA+DQo+ID4gQ2hhbmdlcyBpbiB2MzoNCj4gPiAt
IFJlbW92ZSBleHRyYSBsaW5lIGFmdGVyIGZpeGVzIHRhZy4oU3RlcGhlbiBCb3lkKQ0KPiANCj4g
VGhpcyBjaGFuZ2Vsb2cgc2hvdWxkIGJlIHJlbW92ZWQuDQo+IA0KPiA+DQo+ID4gRml4ZXM6IDYy
ZmJkY2U5MSgiYXJtNjQ6IGR0czogcWNvbTogc2M3MjgwOiBhZGQgZGlzcGxheSBkdCBub2RlcyIp
DQo+IA0KPiBJIHRob3VnaHQgZm9sa3Mgd2VyZSBzYXlpbmcgdGhhdCB0aGlzIGlzIGJhZCB0byBr
ZWVwPyBJIGRvbid0IHJlYWxseQ0KPiBtaW5kIGVpdGhlciB3YXksIGJ1dCBJIGd1ZXNzIGl0J3Mg
YmV0dGVyIHRvIGRyb3AgdGhlIGZpeGVzIHRhZyBiZWNhdXNlDQo+IHRoaXMgaXMgbGFyZ2VseSBh
IHBlcmZvcm1hbmNlIGltcHJvdmVtZW50Pw0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5vZCBQ
b2xpbWVyYSA8cXVpY192cG9saW1lckBxdWljaW5jLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogU3Rl
cGhlbiBCb3lkIDxzd2JveWRAY2hyb21pdW0ub3JnPg0K
