Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FBD4FBF00
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 16:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA5510E0CF;
	Mon, 11 Apr 2022 14:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B82610E0CF
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 14:24:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2ULhKxTZwh4pPmumwpkjDolQjqjtyHw2wzl4aN+6wopMwxa8MJRGrNyKeNDmaz7USxFqPPcRhX24Ikg5vJ4FTfO7kXmPD5Bpzaj7FkavkiTgiFIVBIvP2uG4WE1OUVyGhjGrTLGvT1o8DPX1bOtyc5bRX4HwQcwRp1usBAgMzv1TuBycI0cts4N24i2TqTr4lBAkGz3N+pHvx8KMZPNGgcQw21OybUAGUyfmuLbkhZz4rZJWlk5wsYidx5dOMxQoUW/f/KPEiW6cxFf6p6iM+Uuc3vUg6RU54bXvjbQ9WrbDkpsdtxuirj9cqH91E8lfGN/iYL2gK/Ozy8r3eK8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoaEPC1HTWsWGBGU7EBCSmMSj0fIHbFPwrFwUm5OY7I=;
 b=mahISi8y6+IKJss5Qo8kA8KHqbBQ3ZVzgxfR3VM9EhngH+TPnYIpfozShThZBbFrc7P3dEWCTWC/Eb5cS9cwZYABQ/M8qqTdYC56j8o/ZczdNw+JTK2Fnh1Pol03aGuyU0JcyLfkX/IGPbCFLxQB+DtzJ+7kIPyFmGdTIsqKS62OAnHkXnD5XmPQ23QApH2stUWH9DnkseotWJ4vtzfyQ3gJZWHN0Wn9XgiGQedYKsZWP2hzoasf2k8VsKJtmpGt7xflPgDgE1fwBEf9xjL9+LbEuD11X2/8LLzuhmojB9ev0tNxbUJbQYEH+lhmQ+n76hqtktjmt9+77bWIATo21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoaEPC1HTWsWGBGU7EBCSmMSj0fIHbFPwrFwUm5OY7I=;
 b=xx/V6parllov/wfLtEe+HbfKI110OVi2hFsODep8Xl5UntLKe84MUQuytk1vhL877XkMHOoC+q4B8wvi1hll/QdFptSk7Ov3cXRPh0DIQ+d5Om0+O0Ep+K8DUdHYZf7wSJLYFphIkrCDU3cTkiWNkYdqbGikOjD1NrDNO8g+bsA=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by DM6PR05MB6539.namprd05.prod.outlook.com (2603:10b6:5:127::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 11 Apr
 2022 14:24:26 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c0e9:29ea:8618:834c]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c0e9:29ea:8618:834c%3]) with mapi id 15.20.5164.017; Mon, 11 Apr 2022
 14:24:26 +0000
From: Zack Rusin <zackr@vmware.com>
To: "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Subject: Re: 5.18 vmwgfx seems to break booting VirtualBox VMs
Thread-Topic: 5.18 vmwgfx seems to break booting VirtualBox VMs
Thread-Index: AQHYTYGHtZBezSHFMEi22ECSmBgwWKzqxK2A
Date: Mon, 11 Apr 2022 14:24:26 +0000
Message-ID: <84c30eb2dcdc330ea54aa1fedba9ae0eb0826068.camel@vmware.com>
References: <2bd4b06e-7577-d7d7-5f2e-264005b316a1@redhat.com>
In-Reply-To: <2bd4b06e-7577-d7d7-5f2e-264005b316a1@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db63b341-cba5-472e-b5cf-08da1bc6fb6b
x-ms-traffictypediagnostic: DM6PR05MB6539:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <DM6PR05MB65393A7331355EB55E4320DDCEEA9@DM6PR05MB6539.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GGg8L1vUxPOdJpJhdBw4CeFqNCgAsasT9TNms4plRMHbetXvm8pdwPK29Tu3Qtkx8R7A6R8jlvUwK7sZX5+eXHdka9v35Mg+hdsQRlVfwQYiA984DuqGrwdupKjW3ZlqQSu9ZJdMqHtQpXXpTCHx/Em44/4vqpxQCCLunGAl7LwyvmQp8jmI+n1EoTsK6bbPPotxMUaqBF4hwxJZ75fC5mQ6bJbrVKQw6ehFW4/RirGaTCg5NCh18y8epZCLXoz0xetaipOCL3l8eQkLfAZNymza1Zvb0qq466BsxXLJt8NeL0rPnGlMMAwR3NhLBMq1zkXJ675uqbxiBrMjNJN7GQj824OFnsdDC4o+9c1Q+VsQOSHVN7tk9Mg8j2P8A/tIpVLdiofBjCQxr5J2/8Gl6qtWNoOd1dgPB3hOF6hc5pQh1uczdB923TvSG8hfvsq9AY9Gz30ttfU9a/TYkmN5UwgB5PdFf/5YJwA2FS0BtajeiXPclZ4dm2YRm5hg6n89ihy+tdbQ4I3BlDP8gZv36SKvgH3B2XWXu2pOEEG8SWRGHs41r6miWozgRX8nCPp/gykRbPY2GcfID6SaDmjTezT/fXeyixDwAQgOqIREVh22cGP7jS60Dqn0Rt+6vmZy467/+rh/FzI8PFeP/xiS0TPT8UFqOPMQfenkZ+m5JUGNDvKxpGWP6MjHvBo/OlxtJVYNdRWN2N3VST1fC354P8xLWUzKobX03roTMv1agC0V9a6bHVAX/l77hikZPKbk+kNx5N4mOJtaklQvYO27iXKo0ag2ZFc9BKcxJP5n7HO2jyu3/4tebJre6+Qe2GGN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(316002)(6636002)(110136005)(38100700002)(36756003)(2906002)(8676002)(64756008)(66476007)(66446008)(66556008)(66946007)(76116006)(508600001)(86362001)(966005)(6486002)(71200400001)(91956017)(38070700005)(45080400002)(5660300002)(2616005)(26005)(8936002)(186003)(6506007)(83380400001)(6512007)(40753002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTNlb1FybllOQUUyb2ZhbS9tVFBCUjlFeldSaHVzVGZLZUF0YTVYcWtROGw4?=
 =?utf-8?B?Ti9naWhhMUprZFgxMXNUV2JYbUJub1BTWXRQT09YdzZ0NjIvV05qRy9FNTJk?=
 =?utf-8?B?QXN2c1ljS0J1ZFI4UWRtbGtMNmFLNTBtazJyVHBDNzVBQlBGaXh0MC9vdVk2?=
 =?utf-8?B?Rjl3M2krMzFWWXJQS002OXdiQmZLVGg2MGtvd0RUZ2QrZlpyaWNuWm9MUkZl?=
 =?utf-8?B?NjBNSlNLUDM2cjk3cXBRT05naHE4bmVoWEJhM3c3a28wM0JBUllTeXBqbkFS?=
 =?utf-8?B?Vk9uOS9vNmw3UFZwZGF6ck40TXRUa2Q1VlkvVVNPckxPV1haa1ZMSm0zb2FQ?=
 =?utf-8?B?RjhpZHlBNWFWSUpVc0N4cE1CU21rNFBEcmRmTUM5RFN1cU5YZkhqMEd2RUtW?=
 =?utf-8?B?UjllSjkwcU9Ub1JrWXFSNWY2bG8xNUd2WlBOTkN3VXRaTFdnWnVBZE9DR0p4?=
 =?utf-8?B?TUZLZEZoUHpIa0tEdmY2R3BMUTFpRW04MjZLQ0Fsd0k0bUFCNTd1VWNHK2FI?=
 =?utf-8?B?RmYzeU93SzUxaWVSMUE2Z28yL0ZlY1BpWTN3TWtOWTBjMVBXTWszeHBQYzE3?=
 =?utf-8?B?Nm9OTWhoK1FpQjQzaVRoaVpFMmt1aXVIM1p3aUVmZ3pjRGhOTVdmZ1JnUkE1?=
 =?utf-8?B?NmtTTkFVVHlFSU1raVdvNXBQa21wdDlvNnpPRVAzSkRmSEgrTi8ybERybHF6?=
 =?utf-8?B?WnpRdmlBVkVlZ3VuSHhuTTV2T3I3T2krSGkwU3luTHBYL2h4VGp1Wjl5TUVC?=
 =?utf-8?B?bmpKRDhTYTdXemVKS2RQUG5vd0cvV2loTkx6UTdUckcyclYwbEY2R1RzdUlh?=
 =?utf-8?B?QWRTbEpOY1gzVU52QXNxalhrR2xZbUxxUFFyVTZpR3QraldxcFlVNUpoVEpF?=
 =?utf-8?B?UXFIM1IyY21GRW1TaTUrQkRNMElEVnFlRzl6WjBtSFJFSzFBQVpkaHdlZ2Rs?=
 =?utf-8?B?ZW56cHVhZXFtbUV2UU5YMStacFFnWEU2TUt4cHNsY2xCWGtWakRHT3JEQjlT?=
 =?utf-8?B?VWFjeUxRWDcxNjBoa3NsUzNnNFVhdDJYYmh2cmRUNkVTcFhlS21saUNnYjhK?=
 =?utf-8?B?Rlo2V25laEdzV01tVTdVV0U4MUpVOUwydGczY3RUUlMyMWtWemttMzhnVlFY?=
 =?utf-8?B?U0lydW5RcjBlZm82WGpocnVxWm5yRUlFK1VkZDdrTC9Ub1ZlWDRCM2duc3Nn?=
 =?utf-8?B?Tm9xUy9sNVA4bVRMcXpvZVFCZitrNHBoQ0IvTU00bFlXWlJRL1RiZHBDb3RU?=
 =?utf-8?B?NVYzY3RRSGxZcVFKcGRIdzBNZmRWTG1PRzhpZWI2Rm04TzQvOHYrNm5UeVRm?=
 =?utf-8?B?Z3lSMjZNd1VFK1E1MHJWQzR6ajFpZjNyYVNSeEI1U3Npc1ZmL0dUQ3RFWWtQ?=
 =?utf-8?B?SzZ2a2NRUzU1Y2lRS0RrdU5relhNajVSK1NsOC9vRkNZZjFyN29TZStNTDNE?=
 =?utf-8?B?RWdWaS9kbUtGY1prUlJ5Y005V1NNUzlxL2RiQWU5MU9FK004MC82UFFOYW9z?=
 =?utf-8?B?YkgrbE9UR2VyVUxON09VSmdCVGREc3lKRm95SVQybE0weXpITEpYdE9oYk9x?=
 =?utf-8?B?b1lJK1Q0ZXZXbW5GdWhCSlQ0dlVrWmd5YkdobWpSd0NIYWdMYkdRdE5Pd3Bq?=
 =?utf-8?B?RStXK2UwcDRwQVdUUTEyNG1aYk1tei9lQm9kR3BJYVo1SEVWWHg0Wmc5cXgr?=
 =?utf-8?B?K3N3OENCQlozT3FPejJHZm9VR2paaVg2NktzNHp2S0RaUW9vLzVic2RjbzQ3?=
 =?utf-8?B?MVhuSmVZUFhhMi9mMHV5NWVHbVZ3TnVjWUIzdjNKM3h4MUJPU3NaM3hCZ3Ru?=
 =?utf-8?B?UXdCOVNnMCtKY1NKSnBFaGFpc21UVno0czJjWE9MWFp2UnFCZG5qRkdVZW9L?=
 =?utf-8?B?Y0EzbWhLalRuKzh0T1RjTlJmQnBvZVFRdlF1WG1oMEsvQTdLSkpDQ2I1V2ti?=
 =?utf-8?B?U1lEeVhuaWliUmZQNVlUelZPTUNvZStoRkJCN2ZtZFg3RTY0eEx2S2psSEZY?=
 =?utf-8?B?OHM1Mmk5VG9VOGdHK2hHSXJrNENzTFRndlRlRFBUUldKeWtKaDdtcW9sYzda?=
 =?utf-8?B?cExmb3c2MXJVeWlrUFpRejU0MEJRRlVvN1lBdEZHR1hYbE5nR2VWNTA0dTJC?=
 =?utf-8?B?NVpHaFhMdk04NHpKZDI5Qk5lSGZUSXpybzdjU3BaM2ZmWEhOcXZhaDh1dFpH?=
 =?utf-8?B?OUpDUEgxdTdrelQwTVJISk83Q0pwTllFNEwyMmx1NmkyYklUcnZPTmRQS3dH?=
 =?utf-8?B?VjhTak1Qa1N2emJlNHJST1JyUGlRbEdlUTJrTDV3dVJmOTVmY2hvWmFzVHZa?=
 =?utf-8?B?M0QvRXpYNXRpY1NQOTN4Y2hSb0gxU0xFTWRBd1hncUZlaWRaZEw5dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79E5DA2F57B6184A9823C2958635F50C@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db63b341-cba5-472e-b5cf-08da1bc6fb6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 14:24:26.1492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tWsPZmoPCvjYt3HuAe+ILXyFoJn4/MB05kCrcILZWIxJyYMgv4jZjYzV1N+zcKj41+Wo94qx+1CqL+NE5WVPSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR05MB6539
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

T24gTW9uLCAyMDIyLTA0LTExIGF0IDEwOjUyICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOg0K
PiBIaSBBbGwsDQo+IA0KPiBGZWRvcmEgaGFzIHJlY2VpdmVkIGEgYnVnIHJlcG9ydCBoZXJlOg0K
PiANCj4gaHR0cHM6Ly9uYW0wNC5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJs
PWh0dHBzJTNBJTJGJTJGYnVnemlsbGEucmVkaGF0LmNvbSUyRnNob3dfYnVnLmNnaSUzRmlkJTNE
MjA3MjU1NiZhbXA7ZGF0YT0wNCU3QzAxJTdDemFja3IlNDB2bXdhcmUuY29tJTdDMzY2NGRkZmUy
NTMzNGIxNjEwOTEwOGRhMWI5OGE2YWYlN0NiMzkxMzhjYTNjZWU0YjRhYTRkNmNkODNkOWRkNjJm
MCU3QzAlN0MwJTdDNjM3ODUyNjM5NzE5MzgyNDgwJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5
SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJ
Nk1uMCUzRCU3QzMwMDAmYW1wO3NkYXRhPUdwa015Nk91UFcwNmYlMkZ6aiUyRkJHem9xOHhUOHBO
c0U2S3RIME1Udk41Rm9BJTNEJmFtcDtyZXNlcnZlZD0wDQo+IA0KPiBUaGF0IEZlZG9yYSByYXdo
aWRlIFZNcyBubyBsb25nZXIgYm9vdCB1bmRlciB0aGUgVmlydHVhbEJveA0KPiBoeXBlcnZpc29y
DQo+IGFmdGVyIHRoZSBWTSBoYXMgYmVlbiB1cGRhdGVkIHRvIGEgNS4xOC1yYyMga2VybmVsLg0K
PiANCj4gU3dpdGNoaW5nIHRoZSBlbXVsYXRlZCBHUFUgZnJvbSB2bXdhcmVnZnggdG8gVmlydHVh
bEJveFNWR0EgZml4ZXMNCj4gdGhpcywgc28gdGhpcyBzZWVtcyB0byBiZSBhIHZtd2dmeCBkcml2
ZXIgcmVncmVzc2lvbi4NCj4gDQo+IE5vdGUgSSd2ZSBub3QgaW52ZXN0aWdhdGVkL3JlcHJvZHVj
ZWQgdGhpcyBteXNlbGYgZHVlIHRvIC1FTk9USU1FLg0KDQpUaGFua3MgZm9yIGxldHRpbmcgdXMg
a25vdy4gVW5mb3J0dW5hdGVseSB3ZSBkbyBub3Qgc3VwcG9ydCB2bXdnZnggb24NClZpcnR1YWxC
b3guIEknZCBiZSBoYXBweSB0byByZXZpZXcgcGF0Y2hlcyByZWxhdGVkIHRvIHRoaXMsIGJ1dCBp
dCdzDQp2ZXJ5IHVubGlrZWx5IHdlJ2QgaGF2ZSB0byB0aW1lIHRvIGxvb2sgYXQgdGhpcyBvdXJz
ZWx2ZXMuDQoNCnoNCg0K
