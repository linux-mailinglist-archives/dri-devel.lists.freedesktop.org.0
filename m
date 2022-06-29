Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B50575601AE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 15:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FAD10F653;
	Wed, 29 Jun 2022 13:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3736E10F64B;
 Wed, 29 Jun 2022 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1656510516; x=1657115316;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PFEA1dVqukxtcNBOrGRlUtw+K2Pxnyan+f5JTI6Pfo8=;
 b=Xu7ZLu0TRaR/UhcazbZqJ1K3FdbFoY+XDj9zhBspjdG3P/sAX7Qf2Zhr
 hJcZRzG48HnvkfrCf9dw2E6F6oW7e7vKGG+vn8J3Sw3dA6b5kSqnEVWrD
 9IoO5vSC+ANKvl5K8LrkQYWDV69gEKX8mFlNsOnnDDLZpxc0kC9LbCExv Q=;
Received: from mail-dm3nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.43])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 13:48:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4d0HBBR6BNm47y2XCsJTK+nsx4XtvPGUP6DL1nl1cMn/XZoMTNVJKdr4ZHsI4YsjeHvnsH47vPfRtGidmG5x32860Yxd0mQHsaO+BJDxPV0PUqrBwOWxtQWAKRpQoNf3BgkdrszDiLLMurnv1LbgfUpAQOSWh0HhE6QCrTtQAIj+DHpF3Gng1tzJtBsqsf4kue4gEglgF83riXjzJRHoPDWVpY6ZhiZ95Ws+eooCrpblw5+KdkMn98DZtg+ceYPneXb3YKngbSUHwzD/PPFdxuRjd1vgBved0cu80yslJqbOsqS6nSwCPygR6l3FBMYZJGH8FxKNAv6WhPEdY2yEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFEA1dVqukxtcNBOrGRlUtw+K2Pxnyan+f5JTI6Pfo8=;
 b=YjWD8eZNyD/sfuJ3/rHYZXJ9k+uBxlSj1MpWOjjI+unWKSCBraPA/HsW0Usvw7GoPgNL8bqjSY7+IDhwWqOx+4wZzn4mefs8p0CCJZDk7gsFv8Rl6fdIZcdn58uOgv5evzm63yGD7Jl+kotPSeS7ZJ42gNzJQs9Oic1DJOZvW1SH8JjEwlPzTysf1V7M3cLuDfmTdV19GR+Q2z2DkjGlqx2nZfuU/woHabxO1BMGhbeecZGsQGBx19LxDGGX4viy4KJJcsQ8k/desSN7FtAzFS39X3JX8foyiWK7Gno+kIah9x4wmRIFm9w4QsTWvLZ2rfa/TSwh32yFqLZ2dML+Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by BYAPR02MB5510.namprd02.prod.outlook.com (2603:10b6:a03:99::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 13:48:31 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::29ab:75ef:34fd:3c13]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::29ab:75ef:34fd:3c13%7]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 13:48:31 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Vinod
 Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [v3 3/5] drm/bridge: add psr support during panel bridge enable &
 disable sequence
Thread-Topic: [v3 3/5] drm/bridge: add psr support during panel bridge enable
 & disable sequence
Thread-Index: AQHYhV08HBFSXtN9PUa/vDcUTFIPR61aNzqAgAw73pA=
Date: Wed, 29 Jun 2022 13:48:31 +0000
Message-ID: <MW4PR02MB71863059F56CA1A32C4E1655E1BB9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <y> <1655808800-3996-1-git-send-email-quic_vpolimer@quicinc.com>
 <1655808800-3996-4-git-send-email-quic_vpolimer@quicinc.com>
 <47324fb3-c0d1-4839-8db1-c819c7389de7@linaro.org>
In-Reply-To: <47324fb3-c0d1-4839-8db1-c819c7389de7@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cec1e6ea-e4a1-4243-4a39-08da59d60daa
x-ms-traffictypediagnostic: BYAPR02MB5510:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UBdJ8lk4wi38nCknUQfvJiTmGwIKvzPOx/uxxqvhoSy5u1MtnP3ofojkDkLrOr++/TeiC0FOaphnBhJg0hzCSIepSjUb4RF96uwct4ed1bs/327OjgpffZdgCcgveN5ec4hBoPfjeIT8t/A+ji3AgnMzOB+pg+BpRadYi8Qwrf+7SAPD/C23QrjpW+6kzbpQ7kq+hnwdROp1bBKiq2LGBvVp9zHk0QgjctesebG1Chm7yAunHjvicSC3PS8t85JQjutddc2/9eKiI+Q5fCfTMt+pZofPOPSr4JtTWiNgTVJrB7B7ke4ompnQx0zN9H5Xa2G9MsY1lOmA/PvVjhfTL9fbgveHPUkCxOgqwnZSCO9+9dcp3HMkXPkK7XUq7u5DcQSYfJncLbC3Mt61XfkW4ahYCDFVmylTfpDnByqnvCqoFYgCf8je/Ak72zVYfI9pedOAZoIFPz6S27mC7FT0+abUEiPJy5fdOkt53pqu4qnezkicqynT2i1xVpwvaznE2vrkcVMGQUXxutYktH/fAXQbwicQPf14msusXyaG3psazqtMi/mytu+xVyX04o6jpfKcAgXwp11PsTSEIVYCjc3jJCCNfTYpDWB5P0iTCQ6lhGObXB5CTLVinsW4Puonx73uo0rb8obM07tJBZDRt96lZSh4Yol9wKnvMga1XjI2J13BsI4zg6/0Wegf2m92Jsvwm/PDB7vmuC5Whv679vCw34Brd0H9ta07X/R1gpQAlaufTe5fxEAHuxFRtQXj8KnrMD/14xMDZDohJl2PXcZ1kfhbwqGE+/wxXsGl+SA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(86362001)(38070700005)(52536014)(66556008)(66946007)(33656002)(9686003)(6506007)(41300700001)(4326008)(26005)(64756008)(66446008)(8676002)(8936002)(66476007)(5660300002)(83380400001)(76116006)(2906002)(71200400001)(7696005)(107886003)(54906003)(110136005)(38100700002)(55016003)(122000001)(478600001)(186003)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlZUWW5oRTVoYzFVQXJUT0ZpMWhNbHBycFpHTGErMEI4RUtyMDYzdUFxQmxM?=
 =?utf-8?B?eFcwZDI3ZndQNkx1NWd1SHdaWHhjS01IZG9GMVlKZlZvc3JrRlpraTVnZ1I3?=
 =?utf-8?B?REpvVUYxOUZOV2xaNUFOMlhQMExkd3FOc29GNE9hZDNEdW41V0gwVk5iVlR4?=
 =?utf-8?B?TjZFakhzbFZnVCtqU3V1YzBqOVl5ZkZHQ1hhc1V4RHprdE1TaVFLN0RFSUpB?=
 =?utf-8?B?aGhsTzVKdC92aXc4R2pSaFJnaHByNTVRREVjY3U4eXYwV0tNTW5ZaXI1cWls?=
 =?utf-8?B?WEduRVVFdm80Ly93MS9QMnIvWnB0dHpUSXZFbUZka0lPcFpFK2RYSGRUQTJv?=
 =?utf-8?B?MENhc1k4cFJKa0g3L3pvNU9GNHpvWk1SRk4ra091UUYxTzEwRWk4dTJmeVRx?=
 =?utf-8?B?UkVWMHkzZDFZVmZBSjg1bVp1QzYvZmQ4aVdRbDQzWnZZSkxxbVJzeXM1MUxJ?=
 =?utf-8?B?MXpoMDBFTkhLZTU0b20zTndteXlUdWpWRmJucE5YOHlTbzg2czFDNnpUaXJJ?=
 =?utf-8?B?S04rbDJERE5obXR4TytCN2kwa2pwZjNLVWJuajA4OGFJVEVIM05WdmpxUkZC?=
 =?utf-8?B?NjNZb3NOdjhOcFViRmZYYkwwaEhaeit5L1Vxc0ppL0FRNTBjL3lkWUg1QTFi?=
 =?utf-8?B?d0Fqd0U2ODZtNXlYemVRdHNBN3V0dkZwNWlZK1FnSjlIWjdXVUw0eU8wdEVC?=
 =?utf-8?B?T3dHNlJRZUFUZzlmVkhoMGtNRGU0Y0lyM1BuWlhUNnE1c0FBRUQ5dWgyODcy?=
 =?utf-8?B?ekdaRXB2amsvMG0xbm9lTlRnTURvQVIrc3ZWSzR0UlNWS25GVDBGaXF6NjF6?=
 =?utf-8?B?QUxHN0Rzd1cwNklxcDEvUDBEZFN3YitZc1JzMDNuNzFyV2J4Z21JdDN3MVN4?=
 =?utf-8?B?UitscnUyaVRxNEsyZzNPWVpMVXM5NGlsVWpZd1JJdGVJMVErbDBJOHZMT0Y2?=
 =?utf-8?B?TkJmdmpyZE52UXczVU9tQ1k1ZVFndnpNeUIyYU9ub0N6cU5FT1dPbmh0VGZ6?=
 =?utf-8?B?NWp0cVVnTU01VVhYNEJuMVRxVUdnZ0RPeE5ZbkxCWWk0cDdZVDMrVWFRY0xs?=
 =?utf-8?B?SWp1VTBXc0Zhd2p6TmZpWXRJd3NRZ041TzI5bjhwREFlYVBBQ0NxbVZ6eUdn?=
 =?utf-8?B?WE5YY2tDUC9BOUFvRi84MmRZaHBFc1k2Q2wyMFUvVU1nYXM1T0V3ZldwMmlF?=
 =?utf-8?B?Vit1UlhQQ2ZkZ08rdlo5RkFudnRhOGRQdXEyMVFrNGRQeUlmZ01nL0JSWEFu?=
 =?utf-8?B?T2J6SEJoRWxlUlN6WVMwcVh4U3QxYWFzYnh5cmpwRzZNRXBHTHM1QlJNK2xv?=
 =?utf-8?B?dVNXWlE5UDRZVDhpMHdnbG1VbUhFeDkzL2kveXlxeExsTnFlVnhxbmFCQmtP?=
 =?utf-8?B?djcyWlZzM21YNk5vdDlUeXlwUXFLWUREZnZTSE02eE44Q1VBcjN3bkJleVhl?=
 =?utf-8?B?ZC9MeGNaNTNXL2FCYzdBL0Q5U2FOR2RaejFaY1prVkRmOFhEYjFkYkRqMnFS?=
 =?utf-8?B?WlBVWEF4Qzl4bjB2VkxNSE9PVjJWZXJNZW5ZKytMYmdiMmxDNmZBVk9wY2lt?=
 =?utf-8?B?WUxrRWx5VmxlcnFKNG9pMkdicWdHOVM4NnlSUnhyRWE3NHFtZ0ZCNkFzZXho?=
 =?utf-8?B?T3JEenBveWV5cWxqREdSYW9pd2FqU3hBdWY3bDFHRUc5WUw4OWhHTnNjOUlO?=
 =?utf-8?B?STJUbXZTR012bVpocDc5dVppUnM0bmZUYUdxei9nMnlMTDhKbnlaTWlrN0xR?=
 =?utf-8?B?dDlWdGE0YmVydkVEZmxTSEdQV0tsYVJTaWNZTU9wUTdXQXdaT1NFdzF5Y21L?=
 =?utf-8?B?K2xyODgzbDB1ZjBCK2hTRkRkUytrM2JqOFpQdUxOVkRGNzdNdU03MUtCM1dE?=
 =?utf-8?B?Sll4V09MUEtERHl0WHgvR21vaHRkaUlERHMzKzFSRUl6WlVTRVRobm1FL3RU?=
 =?utf-8?B?ekhuWWpPK3lzTzE3UmNzNDNlMWdGUVluQitQc1MyY2EwZXZsUjlPUlp1MUw4?=
 =?utf-8?B?RkhZS1FxdmZ6bWFKOVJqWitEc3BrL21VcVowNjlmOHBGOW12WldlQ1Q2WDVq?=
 =?utf-8?B?Y1Uwc1Yram5rWVMvbDV5ZUdNbkljV2oxVXRubFVqRElPbVdoeW9WYlpRZnNI?=
 =?utf-8?Q?nS5kstARnzZjoOf64yBW+unEH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec1e6ea-e4a1-4243-4a39-08da59d60daa
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 13:48:31.3170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zlarr30supl3swhVakqaIEvN3O4jvefELN33qcPoPzAACT91++bWBFft9utkmNCn79OcOXoWX7JhSIlPD3jXwclh4cfIdx22HWXRZPHnyQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5510
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LA0KDQo+T24gMjEvMDYvMjAyMiAxMzo1MywgVmlub2QgUG9saW1lcmEgd3JvdGU6
DQo+PiBUaGlzIGNoYW5nZSBhdm9pZHMgcGFuZWwgcHJlcGFyZS91bnByZXBhcmUgYmFzZWQgb24g
c2VsZi1yZWZyZXNoDQo+PiBzdGF0ZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTYW5rZWVydGgg
QmlsbGFrYW50aSA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6
IEthbHlhbiBUaG90YSA8cXVpY19rYWx5YW50QHF1aWNpbmMuY29tPg0KPj4gU2lnbmVkLW9mZi1i
eTogVmlub2QgUG9saW1lcmEgPHF1aWNfdnBvbGltZXJAcXVpY2luYy5jb20+DQo+PiAtLS0NCj4+
ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jIHwgMTAyDQo+KysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDk4IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvcGFuZWwuYw0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMg
aW5kZXggNTlhMzQ5Ni4uNmIwOWFlMCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvcGFuZWwuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jDQo+
PiBAQCAtNDEsNiArNDEsNDAgQEAgc3RhdGljIGludCBwYW5lbF9icmlkZ2VfY29ubmVjdG9yX2dl
dF9tb2RlcyhzdHJ1Y3QNCj5kcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+PiAgIAlyZXR1cm4g
ZHJtX3BhbmVsX2dldF9tb2RlcyhwYW5lbF9icmlkZ2UtPnBhbmVsLCBjb25uZWN0b3IpOw0KPj4g
ICB9DQo+Pg0KPj4gK3N0YXRpYyBzdHJ1Y3QgZHJtX2NydGMgKmJyaWRnZV9kcm1fZ2V0X29sZF9j
b25uZWN0b3JfY3J0YyhzdHJ1Y3QNCj5kcm1fZW5jb2RlciAqZW5jb2RlciwNCj4+ICsJCQkJCQkJ
c3RydWN0DQo+ZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpIHsNCj4+ICsJc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvcjsNCj4+ICsJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5f
c3RhdGU7DQo+PiArDQo+PiArCWNvbm5lY3RvciA9IGRybV9hdG9taWNfZ2V0X29sZF9jb25uZWN0
b3JfZm9yX2VuY29kZXIoc3RhdGUsDQo+ZW5jb2Rlcik7DQo+PiArCWlmICghY29ubmVjdG9yKQ0K
Pj4gKwkJcmV0dXJuIE5VTEw7DQo+PiArDQo+PiArCWNvbm5fc3RhdGUgPSBkcm1fYXRvbWljX2dl
dF9vbGRfY29ubmVjdG9yX3N0YXRlKHN0YXRlLA0KPmNvbm5lY3Rvcik7DQo+PiArCWlmICghY29u
bl9zdGF0ZSkNCj4+ICsJCXJldHVybiBOVUxMOw0KPj4gKw0KPj4gKwlyZXR1cm4gY29ubl9zdGF0
ZS0+Y3J0YzsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHN0cnVjdCBkcm1fY3J0YyAqYnJpZGdl
X2RybV9nZXRfbmV3X2Nvbm5lY3Rvcl9jcnRjKHN0cnVjdA0KPmRybV9lbmNvZGVyICplbmNvZGVy
LA0KPj4gKwkJCQkJCQlzdHJ1Y3QNCj5kcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkgew0KPj4gKwlz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOw0KPj4gKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
cl9zdGF0ZSAqY29ubl9zdGF0ZTsNCj4+ICsNCj4+ICsJY29ubmVjdG9yID0gZHJtX2F0b21pY19n
ZXRfbmV3X2Nvbm5lY3Rvcl9mb3JfZW5jb2RlcihzdGF0ZSwNCj5lbmNvZGVyKTsNCj4+ICsJaWYg
KCFjb25uZWN0b3IpDQo+PiArCQlyZXR1cm4gTlVMTDsNCj4+ICsNCj4+ICsJY29ubl9zdGF0ZSA9
IGRybV9hdG9taWNfZ2V0X25ld19jb25uZWN0b3Jfc3RhdGUoc3RhdGUsDQo+Y29ubmVjdG9yKTsN
Cj4+ICsJaWYgKCFjb25uX3N0YXRlKQ0KPj4gKwkJcmV0dXJuIE5VTEw7DQo+PiArDQo+PiArCXJl
dHVybiBjb25uX3N0YXRlLT5jcnRjOw0KPj4gK30NCj4NCj5BcyBJIHdyb3RlIGVhcmxpZXIsIHRo
aXMgc2hvdWxkIGJlY29tZSBnZW5lcmljIGRybSBoZWxwZXJzLg0KPg0KDQpZZXMsIHdpbGwgbW92
ZSBpdC4NCg0KPj4gKw0KPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfaGVs
cGVyX2Z1bmNzDQo+PiAgIHBhbmVsX2JyaWRnZV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0gew0K
Pj4gICAJLmdldF9tb2RlcyA9IHBhbmVsX2JyaWRnZV9jb25uZWN0b3JfZ2V0X21vZGVzLCBAQCAt
MTA4LDMwDQo+KzE0Miw5MA0KPj4gQEAgc3RhdGljIHZvaWQgcGFuZWxfYnJpZGdlX2RldGFjaChz
dHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQ0KPj4gICAJCWRybV9jb25uZWN0b3JfY2xlYW51cChj
b25uZWN0b3IpOw0KPj4gICB9DQo+Pg0KPj4gLXN0YXRpYyB2b2lkIHBhbmVsX2JyaWRnZV9hdG9t
aWNfcHJlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQ0KPj4gK3N0YXRpYyB2b2lk
IHBhbmVsX2JyaWRnZV9hdG9taWNfcHJlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdl
LA0KPj4gKwkJCQkJc3RydWN0IGRybV9icmlkZ2Vfc3RhdGUNCj4qb2xkX2JyaWRnZV9zdGF0ZSkN
Cj4NCj5UaGlzIG11c3QgYmUgYSBwYXJ0IG9mIHRoZSBwcmV2aW91cyBwYXRjaD8NCj4NCg0KWWVz
LCBpdCBzaG91bGQgYmUgbW92ZWQgdG8gdGhhdCBwYXRjaC4NCg0KPj4gICB7DQo+PiAgIAlzdHJ1
Y3QgcGFuZWxfYnJpZGdlICpwYW5lbF9icmlkZ2UgPQ0KPj4gZHJtX2JyaWRnZV90b19wYW5lbF9i
cmlkZ2UoYnJpZGdlKTsNCj4+ICsJc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSA9
IG9sZF9icmlkZ2Vfc3RhdGUtPmJhc2Uuc3RhdGU7DQo+PiArCXN0cnVjdCBkcm1fZW5jb2RlciAq
ZW5jb2RlciA9IGJyaWRnZS0+ZW5jb2RlcjsNCj4+ICsJc3RydWN0IGRybV9jcnRjICpjcnRjOw0K
Pj4gKwlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9jcnRjX3N0YXRlOw0KPj4gKw0KPj4gKwlj
cnRjID0gYnJpZGdlX2RybV9nZXRfbmV3X2Nvbm5lY3Rvcl9jcnRjKGVuY29kZXIsIG9sZF9zdGF0
ZSk7DQo+PiArCWlmICghY3J0YykNCj4+ICsJCXJldHVybjsNCj4NCj5XaHk/IEFuZCB3aHkgZG8g
eW91IGFzayBmb3IgdGhlIG5ldyBjcnRjIGZyb20gdGhlIG9sZCBzdGF0ZT8NCj4NCg0KSWYgdGhl
IHByZXZpb3VzIGJyaWRnZSBkaXNhYmxlIGFuZCBwb3N0X2Rpc2FibGUgY2FsbHMgd2VyZSBpc3N1
ZWQganVzdCB0byBlbnRlciBwc3IsDQp0aGVuIHRoZSBwYW5lbCBwb3dlciBhbmQgYmFja2xpZ2h0
IHdpbGwgc3RpbGwgYmUgb24uDQoNCldlIG5lZWQgdG8ga25vdyB0aGUgcHNyIHN0YXR1cyBvZiB0
aGUgb2xkIHN0YXRlIG9mIHRoZSBjcnRjIHRvIGRlY2lkZSB3aGV0aGVyIHRvDQplbmFibGUgdGhl
IHBhbmVsIHBvd2VyIG9yIGp1c3QgZWFybHkgcmV0dXJuLg0KDQpvbGRfc3RhdGUgaXMgdGhlIGF0
b21pY19zdGF0ZSBvYmplY3QuIFdpbGwgY2hhbmdlIHRoZSB2YXJpYWJsZSBuYW1lIHRvIGF0b21p
Y19zdGF0ZS4NCg0KPj4gKw0KPj4gKwlvbGRfY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X29s
ZF9jcnRjX3N0YXRlKG9sZF9zdGF0ZSwgY3J0Yyk7DQo+PiArDQo+PiArCS8qIERvbid0IHRvdWNo
IHRoZSBwYW5lbCBpZiB3ZSdyZSBjb21pbmcgYmFjayBmcm9tIHNlbGYgcmVmcmVzaCBzdGF0ZQ0K
PiovDQo+PiArCWlmIChvbGRfY3J0Y19zdGF0ZSAmJiBvbGRfY3J0Y19zdGF0ZS0+c2VsZl9yZWZy
ZXNoX2FjdGl2ZSkNCj4+ICsJCXJldHVybjsNCj4+DQo+PiAgIAlkcm1fcGFuZWxfcHJlcGFyZShw
YW5lbF9icmlkZ2UtPnBhbmVsKTsNCj4+ICAgfQ0KPj4NCj4+IC1zdGF0aWMgdm9pZCBwYW5lbF9i
cmlkZ2VfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQ0KPj4gK3N0YXRp
YyB2b2lkIHBhbmVsX2JyaWRnZV9hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlk
Z2UsDQo+PiArCQkJCQlzdHJ1Y3QgZHJtX2JyaWRnZV9zdGF0ZQ0KPipvbGRfYnJpZGdlX3N0YXRl
KQ0KPj4gICB7DQo+PiAgIAlzdHJ1Y3QgcGFuZWxfYnJpZGdlICpwYW5lbF9icmlkZ2UgPQ0KPj4g
ZHJtX2JyaWRnZV90b19wYW5lbF9icmlkZ2UoYnJpZGdlKTsNCj4+ICsJc3RydWN0IGRybV9hdG9t
aWNfc3RhdGUgKm9sZF9zdGF0ZSA9IG9sZF9icmlkZ2Vfc3RhdGUtPmJhc2Uuc3RhdGU7DQo+PiAr
CXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciA9IGJyaWRnZS0+ZW5jb2RlcjsNCj4+ICsJc3Ry
dWN0IGRybV9jcnRjICpjcnRjOw0KPj4gKwlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9jcnRj
X3N0YXRlOw0KPj4gKw0KPj4gKwljcnRjID0gYnJpZGdlX2RybV9nZXRfbmV3X2Nvbm5lY3Rvcl9j
cnRjKGVuY29kZXIsIG9sZF9zdGF0ZSk7DQo+PiArCWlmICghY3J0YykNCj4+ICsJCXJldHVybjsN
Cj4+ICsNCj4+ICsJb2xkX2NydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9vbGRfY3J0Y19zdGF0
ZShvbGRfc3RhdGUsIGNydGMpOw0KPj4gKw0KPj4gKwkvKiBEb24ndCB0b3VjaCB0aGUgcGFuZWwg
aWYgd2UncmUgY29taW5nIGJhY2sgZnJvbSBzZWxmIHJlZnJlc2ggc3RhdGUNCj4qLw0KPj4gKwlp
ZiAob2xkX2NydGNfc3RhdGUgJiYgb2xkX2NydGNfc3RhdGUtPnNlbGZfcmVmcmVzaF9hY3RpdmUp
DQo+PiArCQlyZXR1cm47DQo+Pg0KPj4gICAJZHJtX3BhbmVsX2VuYWJsZShwYW5lbF9icmlkZ2Ut
PnBhbmVsKTsNCj4+ICAgfQ0KPj4NCj4+IC1zdGF0aWMgdm9pZCBwYW5lbF9icmlkZ2VfYXRvbWlj
X2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkNCj4+ICtzdGF0aWMgdm9pZCBwYW5l
bF9icmlkZ2VfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4+ICsJ
CQkJCXN0cnVjdCBkcm1fYnJpZGdlX3N0YXRlDQo+Km9sZF9icmlkZ2Vfc3RhdGUpDQo+PiAgIHsN
Cj4+ICAgCXN0cnVjdCBwYW5lbF9icmlkZ2UgKnBhbmVsX2JyaWRnZSA9DQo+PiBkcm1fYnJpZGdl
X3RvX3BhbmVsX2JyaWRnZShicmlkZ2UpOw0KPj4gKwlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAq
b2xkX3N0YXRlID0gb2xkX2JyaWRnZV9zdGF0ZS0+YmFzZS5zdGF0ZTsNCj4+ICsJc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyID0gYnJpZGdlLT5lbmNvZGVyOw0KPj4gKwlzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGM7DQo+PiArCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGU7DQo+
PiArDQo+PiArCWNydGMgPSBicmlkZ2VfZHJtX2dldF9vbGRfY29ubmVjdG9yX2NydGMoZW5jb2Rl
ciwgb2xkX3N0YXRlKTsNCj4+ICsJaWYgKCFjcnRjKQ0KPj4gKwkJcmV0dXJuOw0KPj4gKw0KPj4g
KwluZXdfY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19jcnRjX3N0YXRlKG9sZF9zdGF0
ZSwgY3J0Yyk7DQo+DQo+VGhpcyBkb2Vzbid0IHNvdW5kIHJpZ2h0IHRvby4NCj4NCg0KVGhlcmUg
aXMgYSByaXNrIG9mIGNydGMgYmVpbmcgZGVhbGxvY2F0ZWQgaWYgdGhlIGRpc2FibGUgY2FsbCBj
YW1lIGR1cmluZyBzY3JlZW4gb2ZmLg0KVG8gYmUgb24gc2FmZXIgc2lkZSwgd2UgYXJlIGdldHRp
bmcgdGhlIG9sZCBjcnRjIGFuZCBjaGVjayBmb3IgdGhlIGFwcHJvcHJpYXRlIGNydGMgc3RhdGUu
DQpJIGJlbGlldmUgdGhlIG9sZF9zdGF0ZSB2YXJpYWJsZSBuYW1lIGlzIGNhdXNpbmcgYSBjb25m
dXNpb24uIEkgd2lsbCBjaGFuZ2UgdGhlIG5hbWUgdG8NCmF0b21pY19zdGF0ZS4NCg0KPj4gKw0K
Pj4gKwkvKiBEb24ndCBkbyBhIGZ1bGwgZGlzYWJsZSBvbiBQU1IgdHJhbnNpdGlvbnMgaWYgbmV3
IHN0YXRlIGlzIHNlbGYgcmVmcmVzaA0KPnN0YXRlICovDQo+PiArCWlmIChuZXdfY3J0Y19zdGF0
ZSAmJiBuZXdfY3J0Y19zdGF0ZS0+c2VsZl9yZWZyZXNoX2FjdGl2ZSkNCj4+ICsJCXJldHVybjsN
Cj4+DQo+PiAgIAlkcm1fcGFuZWxfZGlzYWJsZShwYW5lbF9icmlkZ2UtPnBhbmVsKTsNCj4+ICAg
fQ0KPj4NCj4+IC1zdGF0aWMgdm9pZCBwYW5lbF9icmlkZ2VfYXRvbWljX3Bvc3RfZGlzYWJsZShz
dHJ1Y3QgZHJtX2JyaWRnZQ0KPj4gKmJyaWRnZSkNCj4+ICtzdGF0aWMgdm9pZCBwYW5lbF9icmlk
Z2VfYXRvbWljX3Bvc3RfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0KPj4gKwkJ
CQkJc3RydWN0IGRybV9icmlkZ2Vfc3RhdGUNCj4qb2xkX2JyaWRnZV9zdGF0ZSkNCj4+ICAgew0K
Pj4gICAJc3RydWN0IHBhbmVsX2JyaWRnZSAqcGFuZWxfYnJpZGdlID0NCj4+IGRybV9icmlkZ2Vf
dG9fcGFuZWxfYnJpZGdlKGJyaWRnZSk7DQo+PiArCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpv
bGRfc3RhdGUgPSBvbGRfYnJpZGdlX3N0YXRlLT5iYXNlLnN0YXRlOw0KPj4gKwlzdHJ1Y3QgZHJt
X2VuY29kZXIgKmVuY29kZXIgPSBicmlkZ2UtPmVuY29kZXI7DQo+PiArCXN0cnVjdCBkcm1fY3J0
YyAqY3J0YzsNCj4+ICsJc3RydWN0IGRybV9jcnRjX3N0YXRlICpuZXdfY3J0Y19zdGF0ZTsNCj4+
ICsNCj4+ICsJY3J0YyA9IGJyaWRnZV9kcm1fZ2V0X29sZF9jb25uZWN0b3JfY3J0YyhlbmNvZGVy
LCBvbGRfc3RhdGUpOw0KPj4gKwlpZiAoIWNydGMpDQo+PiArCQlyZXR1cm47DQo+PiArDQo+PiAr
CW5ld19jcnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRfbmV3X2NydGNfc3RhdGUob2xkX3N0YXRl
LCBjcnRjKTsNCj4+ICsNCj4+ICsJLyogRG9uJ3QgZG8gdW5wcmVwYXJlIG9uIFBTUiB0cmFuc2l0
aW9ucyBpZiBuZXcgc3RhdGUgaXMgc2VsZiByZWZyZXNoDQo+c3RhdGUgKi8NCj4+ICsJaWYgKG5l
d19jcnRjX3N0YXRlICYmIG5ld19jcnRjX3N0YXRlLT5zZWxmX3JlZnJlc2hfYWN0aXZlKQ0KPj4g
KwkJcmV0dXJuOw0KPj4NCj4+ICAgCWRybV9wYW5lbF91bnByZXBhcmUocGFuZWxfYnJpZGdlLT5w
YW5lbCk7DQo+PiAgIH0NCj4NCj4NCj4tLQ0KPldpdGggYmVzdCB3aXNoZXMNCj5EbWl0cnkNCg0K
VGhhbmsgeW91LA0KU2Fua2VlcnRoDQo=
