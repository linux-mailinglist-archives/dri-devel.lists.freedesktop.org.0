Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3384C4D8767
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 15:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E8A10E300;
	Mon, 14 Mar 2022 14:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D050510E300;
 Mon, 14 Mar 2022 14:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1647269483; x=1647874283;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c3aUFcp72/NYZ6c2fphWfjAz6wlQBfRdlWr/+v6wUco=;
 b=i/CGGTQzeVpR6ENXABPUNMyHpQqnuxHviA29VB00UqtnJAbBxw/HuStV
 s2PSb+QCjJWq6WDu4fztyHwqFz2V9n7SGWm66OWZARkzpQmJ6AmfVLzAL
 9SgK02ZhAIu++rOvkhew/FsGCaVuJ3hW2YFpJyehXLT+imVedibAo6+he I=;
Received: from mail-sn1anam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.48])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 14:51:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W22Fp487wZc7Xl+TmdIxy2wxdl3uCKp0zThJs83eqHS5uHcn3ZSvefLu7RRjaOp5iKlsVkg1IcbCQQyRydSctXNFiy0ynwllsIeu2wko9ME/CFfezZeYuGg9n4tQ5ZsWtKjTutpp1gGqy9d/KMQtdQmSbhXfLtz8ZbpDZAfTEjB5pWPedQd8YonDus0KO+lz7WX6tDY8Tw8zTG7zyeHpH7MFX9MazzkWT/TDf9zKZMADjQ7NEiYVZKXtQK6r6tbdpJD4otthsJfDQkB8Wd5B+2AjKFPvD2eREZXWFPhAz+eS5Ki+TiqK0Xvon97UJ2W5eOMnpIiBDV6cKlGKzYKoBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3aUFcp72/NYZ6c2fphWfjAz6wlQBfRdlWr/+v6wUco=;
 b=OFOXmOAsDpRov72lFzLZUOwvLHcHXyVQOVhx2EKgWf5gcKLADkJUZEi1XOh+OEOmWKxT/POrqd+l83mK0NNFacsqCQRYx+R8yH4wZf+LpKgGMDlQjoIttyVv7UYmzIJjsxsDZlAQKIXUXYtGe8XAAa39FvBnc1UVbwKWoio+ffyymm4D1S/OO7q0N0jdwv9r4eiKO6xo6KdP0JD/7TcVePDdeqoNqrn5O4h1x2e0JgviILlLX5BfBhxAJl71PTGTu9n3fXISQdgKa5MJqWTs28c0H9p99cufHbaNvYkl6XE10dk1UdD/hzSBTqZbz1ASigeL9UlMYCjWdQMr3fKkww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:163::15)
 by BN7PR02MB3953.namprd02.prod.outlook.com (2603:10b6:406:ff::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Mon, 14 Mar
 2022 14:51:20 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::198b:e44b:f8af:4635]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::198b:e44b:f8af:4635%8]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 14:51:20 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>, quic_vpolimer
 <quic_vpolimer@quicinc.com>
Subject: RE: [PATCH v5 5/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
Thread-Topic: [PATCH v5 5/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
Thread-Index: AQHYMw1OBhsy/Tz+FESywpD+hB9Cmay3cL4AgAeOtJA=
Date: Mon, 14 Mar 2022 14:51:20 +0000
Message-ID: <BN0PR02MB817391C539C90651850391F6E40F9@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646758500-3776-6-git-send-email-quic_vpolimer@quicinc.com>
 <CAD=FV=WFairiQF2zWc637Z+H61rX4Ar-E9ufG1fMctEk9E_xTg@mail.gmail.com>
In-Reply-To: <CAD=FV=WFairiQF2zWc637Z+H61rX4Ar-E9ufG1fMctEk9E_xTg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08c9ce77-c977-4295-f4c2-08da05ca19d2
x-ms-traffictypediagnostic: BN7PR02MB3953:EE_
x-microsoft-antispam-prvs: <BN7PR02MB3953913C536BEE00093AE726E40F9@BN7PR02MB3953.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mu50VM9a3yQ5x3qLALOzY9rzcBP4zb1tfaitQKo4X62JIoWAzSLYNX6GgjazMQKh2cakjC89Io/ovVSOmhmKkOJYcAW0A1ZFShS7H5nWwzEy3VEoTuSg/GT/lYrYvOQ7LL+YA8BumRG6DpTsQWOfb3ickL4cJYACL4w3jkZryNi0HpVONSjH0RSctSSwgBVMLlywOcweV3yROs743vvS1XiccDReQC/2KBJNzzpy7Pxx4lrNIHp0snjtjt/KQwRB2wrUnG3gbvl7F6Oe7LAJQr/dj1J5ublxzS38ytg/8TWyeaSdN6EMR8Iv6qBOjHh0NKyInflSCgzGdte6WXsyEP8ZgN0W2yddMTvpT9H8rAvRIK3ijHgR1MX5SrSnG3tL2fkfLS6GA4/+kdPiTNvgHxtMa/DVvKoGVuZW72fosyjQnaHyx3ssM5wn9Y9J567l1tHmPk9+7Y5qBHaSz21bzFiR1quB3jh0ohP7dvnTDG0VyrbXqNHtPNf1FwJfr7vSNVCfQsEdbulZ7et7CrsR7n/02kPR+OG+Wo8OUxb559/vqv/qYLElzUpm5bhhQQ+fM/BMeMhwPQ03a/p+sImFSwwpdzYJaGmpPqhOjgN2WfY7j81zd/9N7xPaekXA3drN88LeJ/KbTfaxedVG+ALxlWE71AeiwPUOdL8fkwGTchGi87TprBFF1BmpLZrFM/EWpS3qFBpE8RJJYtr76PZRgA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(2906002)(71200400001)(38100700002)(52536014)(55016003)(38070700005)(316002)(5660300002)(6506007)(7696005)(8676002)(8936002)(53546011)(86362001)(107886003)(83380400001)(4326008)(26005)(33656002)(9686003)(76116006)(508600001)(110136005)(54906003)(66946007)(186003)(64756008)(66476007)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmhQSkNkQUQ2eTZ2dWlkL0d2K2JUMlZDR21LVE5Qa3N5emF6cnFiZlZ0dkVX?=
 =?utf-8?B?dW9XL1lmTTNXOEhWTXV0M3RmTXNzMjdtZHVDMGdZMXNCQ3ZNVmVaSHkrTzl1?=
 =?utf-8?B?SFFZKytYd3V0NHJSdXdqY1N1WjU1QnZucHRlOHJSaEliSzZodjhJMXplbm1V?=
 =?utf-8?B?RmtPL2k1bXpHQmNjVEtDNXZCM2s3M2FoKzB1TU5ZajNjaXdiNnlKYU9nRE9D?=
 =?utf-8?B?b2hGWmlId3RmYlhGbUJuaWYvQUVFRmJOQnFQd0RhQSs4b1c0OVhzYVhKVDNw?=
 =?utf-8?B?ZnlYdzZzc0xhTEVrZlMrekZxWUNwbmJxNXhoLzBTNmhaQTdTSEhrMklqeE56?=
 =?utf-8?B?YzhuTzNtbXJTUzBVbHJpZ2lKSWVwYUFEcDZ2ZXZXb0N0TUVObDJHL2R1aDZ3?=
 =?utf-8?B?d2xNSWhzMkFsZEgyN2ZKZmFvVDJsVkhnWFB5MFhjeHNDZnlqNzFoRGNuNnh0?=
 =?utf-8?B?RDluMHJSYTFUWTNnQlpUbExYMXFWMU5RQlE0QVdzemZ3RDQ5ZmUzbUZ0dmls?=
 =?utf-8?B?UnJKOExmMWNldTJaTEwxZDVaK05xNTQ3N3hkZVAwZllTL0gyMDZQR0FZTVNH?=
 =?utf-8?B?NGx1N3Y3VWc0ZFprWmNkQ3NiN1pFdGJJRngwWU5GQUE5WVFlZW1YOTNrQ1c4?=
 =?utf-8?B?Umh5WmF1eU40eXJrN1hteHVGVUllSmdkTmo1NksreXFLZGJRVmdkbDk2RHBC?=
 =?utf-8?B?VVZrZDJkMUlNd3ROdDMrMnFNM2lUTDNqa25tWll3V3oxWDR3T0c1LzRLOGNF?=
 =?utf-8?B?QlRXaE5yRVQ5VmJoc05Lbm8vdHRsNGMzQVFjN09jbzI2Wi8rSVRYd1BucmN0?=
 =?utf-8?B?MGJOVDkvUjZVeC9TWEgvNDBXUzE0dmU5cGpCMjFBeHBzS09DZnhndC9NWXEw?=
 =?utf-8?B?UzU1Q0tJdVRMaExmVDNFOXhITGtBWjZrYmR4SUJBZ0UrV3Jhb3dHMFNzNWMy?=
 =?utf-8?B?R0thNktING1xNzkrNXV5OGdlL2pMdW1qNGRSUWJlMGh5bE5CaXErU2IwSnRq?=
 =?utf-8?B?WkJpTHFXb29EWjVUNkVqSGxvbTVNMStxRWxxd2diWk1SMTBiK2N6MXR3WldF?=
 =?utf-8?B?M3J3UWEvUVF0enBadC9EWjJZTkNjUWtxWm41RzY5T2pidDFoYTkxOG0vRnFT?=
 =?utf-8?B?WmQvUHlmT3cyVTJuT2Q4aEJqQmk2YlRiNFFrR1kzTTdWd1JKTU11Ly9lb0RT?=
 =?utf-8?B?UVJIY3AyRHVBaDFPKzFvSmpJckZCSmtvVnYweUIxdzZNNGJJdDduRTdJR3pY?=
 =?utf-8?B?WDRZT1cwamNZUWhpS0c2amJtMWVQd0lMTDJuSjQ2ZERVdmQ1Sld5bENHUzlu?=
 =?utf-8?B?cmgyZTdtOTNXZmFSZlBPK0phTWZwd1ZWTDY4NCszY2tZV001Uzl2WlRmaCtZ?=
 =?utf-8?B?S2Y1NWNIRDRyOGFYdmx5cGhBN2N4Vk5iSjNhZTVTTUhKQUNENWVTaXdGRmRu?=
 =?utf-8?B?QU9UbFErZ2tMd0c1dFg3dHVJamNsV1lTM2ZlekE2dEhMMm5BQlh6Q3hYNnAr?=
 =?utf-8?B?dmhEL2g4dUI1aVk1VXZqblphM1lpT2d4ZVJMcmxtYlpWamtJSDB5NlM1Q3Ni?=
 =?utf-8?B?eDRZZ3JGeWM3aWZNTHBLbHV6Q1BXc0d5bzRzVHBaU1NEQXVEaXFZbHBiaDdS?=
 =?utf-8?B?L0RQQ0ZIeUJaOE9vbWg0eW1aODZCN0xOVjBCdU5JRlBVNGNQeEJsT2pOMVVX?=
 =?utf-8?B?SzdKWSsvamlFcm96eldTMU5RSzNZV2dNUUtvN2hla1RzaGxCRUNDUFRmeWpp?=
 =?utf-8?B?b01ZdUFKTnZrOXhHTlk2cWJ4MGVmWDJBeldyK2o2alVYZ3BKRnEyZEtucEth?=
 =?utf-8?B?ZWRnY1FtdDYrbTNUY05wU1dRbGZGZTJlTGRkUzRIV1M4NWlPRStJYWg0T2My?=
 =?utf-8?B?QTdRREJPTGlnN1JOekI5RG1zK2ZsRFJiTXpMd0J3SUxTeEpqeEpJOGE0WEpH?=
 =?utf-8?B?Y2UvNWxMQ2ZvaXdSdW1GWHVvc1dZRys4aGRXTUg5MzhtYU0wbExKWHl1ZEdG?=
 =?utf-8?B?RVJCenpMSzB3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c9ce77-c977-4295-f4c2-08da05ca19d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 14:51:20.0353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GJLO4HzDgiTRED+aZRCjPcx5bN4wMdEluVi/SwcPcGDCAGnZyDENy2OiKy1mpyEUNn81DLKzA2sicrE3SvtCO7tvkyYVliVeJMbVK5oHY7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB3953
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG91ZyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMTAsIDIwMjIg
MTI6NTUgQU0NCj4gVG86IHF1aWNfdnBvbGltZXIgPHF1aWNfdnBvbGltZXJAcXVpY2luYy5jb20+
DQo+IENjOiBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBsaW51
eC1hcm0tbXNtIDxsaW51eC1hcm0tDQo+IG1zbUB2Z2VyLmtlcm5lbC5vcmc+OyBmcmVlZHJlbm8g
PGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+Ow0KPiBvcGVuIGxpc3Q6T1BFTiBGSVJN
V0FSRSBBTkQgRkxBVFRFTkVEIERFVklDRSBUUkVFIEJJTkRJTkdTDQo+IDxkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZz47IExLTUwgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBSb2IN
Cj4gQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+OyBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJv
bWl1bS5vcmc+Ow0KPiBxdWljX2thbHlhbnQgPHF1aWNfa2FseWFudEBxdWljaW5jLmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NSA1LzVdIGRybS9tc20vZGlzcC9kcHUxOiBzZXQgbWRwIGNs
ayB0byB0aGUNCj4gbWF4aW11bSBmcmVxdWVuY3kgaW4gb3BwIHRhYmxlIGR1cmluZyBwcm9iZQ0K
PiANCj4gV0FSTklORzogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFs
Y29tbS4gUGxlYXNlIGJlIHdhcnkNCj4gb2YgYW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQg
ZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+IA0KPiBIaSwNCj4gDQo+IE9uIFR1ZSwgTWFyIDgsIDIw
MjIgYXQgODo1NSBBTSBWaW5vZCBQb2xpbWVyYQ0KPiA8cXVpY192cG9saW1lckBxdWljaW5jLmNv
bT4gd3JvdGU6DQo+ID4NCj4gPiB1c2UgbWF4IGNsb2NrIGR1cmluZyBwcm9iZS9iaW5kIHNlcXVl
bmNlIGZyb20gdGhlIG9wcCB0YWJsZS4NCj4gPiBUaGUgY2xvY2sgd2lsbCBiZSBzY2FsZWQgZG93
biB3aGVuIGZyYW1ld29yayBzZW5kcyBhbiB1cGRhdGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBWaW5vZCBQb2xpbWVyYSA8cXVpY192cG9saW1lckBxdWljaW5jLmNvbT4NCj4gPiAtLS0NCj4g
PiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jIHwgMyArKysNCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gSW4gYWRkaXRpb24gdG8gRG1p
dHJ5J3MgcmVxdWVzdHMsIGNhbiB5b3UgYWxzbyBtYWtlIHRoaXMgcGF0Y2ggIzEgaW4NCj4gdGhl
IHNlcmllcyBzaW5jZSB0aGUgRFRTIHN0dWZmIHJlYWxseSBvdWdodCB0byBjb21lIF9hZnRlcl8g
dGhpcyBvbmUuDQo+IA0KPiAuLi5hbmQgYWN0dWFsbHksIHRoaW5raW5nIGFib3V0IGl0IGZ1cnRo
ZXI6DQo+IA0KPiAxLiBJZiB3ZSBsYW5kIHRoaXMgZml4LCB3ZSBhY3R1YWxseSBkb24ndCBfbmVl
ZF8gdGhlIGR0cyBwYXRjaGVzLA0KPiByaWdodD8gU3VyZSwgdGhlIGNsb2NrIHJhdGUgd2lsbCBn
ZXQgYXNzaWduZWQgYmVmb3JlIHByb2JlIGJ1dCB0aGVuDQo+IHdlJ2xsIGNoYW5nZSBpdCByaWdo
dCBhd2F5IGluIHByb2JlLCByaWdodD8NCj4gDQo+IDIuIElmIHdlIGxhbmQgdGhlIGR0cyBwYXRj
aGVzIF9iZWZvcmVfIHRoZSBkcml2ZXIgcGF0Y2ggdGhlbiBpdCB3aWxsDQo+IGJlIGEgcmVncmVz
c2lvbiwgcmlnaHQ/DQo+IA0KPiAzLiBUaGUgZHRzIHBhdGNoZXMgYW5kIGRyaXZlciBwYXRjaCB3
aWxsIHByb2JhYmx5IGxhbmQgdGhyb3VnaA0KPiBzZXBhcmF0ZSB0cmVlcy4gVGhlIGRyaXZlciBw
YXRjaCB3aWxsIGdvIHRocm91Z2ggdGhlIE1TTSBEUk0gdHJlZSBhbmQNCj4gdGhlIGRldmljZSB0
cmVlIHBhdGNoZXMgdGhyb3VnaCB0aGUgUXVhbGNvbW0gYXJtc29jIHRyZWUsIHJpZ2h0Pw0KPiAN
Cj4gDQo+IEFzc3VtaW5nIHRoYXQgdGhlIGFib3ZlIGlzIHJpZ2h0LCB3ZSBzaG91bGQ6DQo+IA0K
PiAxLiBQdXQgdGhlIGRyaXZlciBwYXRjaCBmaXJzdC4NCj4gDQpNb3ZlZCBkcml2ZXIgcGF0Y2gg
Zmlyc3QuDQoNCj4gMi4gUmVtb3ZlIHRoZSAiRml4ZXMiIHRhZyBvbiB0aGUgZHRzIHBhdGNoZXMu
IEkgZ3Vlc3MgaW4gdGhlb3J5IHdlDQo+IGNvdWxkIGhhdmUgYSBGSXhlcyB0YWcgb24gdGhpcyBw
YXRjaD8NCj4gDQotIFJlbW92ZWQgZml4ZWQgdGFnIG9uIGR0IHBhdGNoZXMgYW5kIGFkZGVkIG9u
IGRyaXZlciBwYXRjaC4NCg0KPiAzLiBOb3RlIGluIHRoZSBkdHMgcGF0Y2hlcyBjb21taXQgbWVz
c2FnZXMgdGhhdCB0aGV5IGRlcGVuZCBvbiB0aGUgZHJpdmVyDQo+IHBhdGNoLg0KPiANCi0gQWRk
ZWQgZGVwZW5kZW5jeSBwYXRjaCBvbiBkcml2ZXIgcGF0Y2ggZm9yIGR0IHBhdGNoLg0KDQo+IDQu
IERlbGF5IHRoZSBkdHMgcGF0Y2hlcyB1bnRpbCB0aGUgZHJpdmVyIGNoYW5nZSBoYXMgbWFkZSBp
dCB0byBtYWlubGluZS4NCj4gDQo+IERvZXMgdGhhdCBzb3VuZCByZWFzb25hYmxlPw0K
