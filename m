Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE6B4D875A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 15:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4CF10E24F;
	Mon, 14 Mar 2022 14:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8528E10E23D;
 Mon, 14 Mar 2022 14:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1647269391; x=1647874191;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0X+0KKf1N+/dIRJR/8VQ3Sal+kCsOS50B7Mh5Yo5CtE=;
 b=iIHSv3CzCKxYUR38Zk51+pFbRZNRmUOk45I/iofe9fixH6DPa+4ulsL3
 VDNCc3gpqu4d5YonDHn9I9kjxWqipihD4omi3lR8gxyBG8Y85KXOsR/g3
 HzS2S+jS/pvVaExN0mLBHcuNCJLqDwnv1f3dAS4aKL54ijD0q4VQzv2BW E=;
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 14:49:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPgu8YLi/L4EeXRoCV+umd7zW+SM/iC0OLYLx7ihLxcwxD0xLBrHOhzNYibSNpw0ocDxhBqbyTZSeGYDdFLn4gONsL8UZPC8IdiWdtHQSGefJ7xiBnJwHXjcZblnVAuus1CZ7up/nVTGit3umMizQgcSls9qxub711OhyeHKOTfJL/1GNQadTrnypo7CXqKiA2ifi0mUh8sqZ6kcxu/aK4i+xSSWGuinnlp7eBUFoyIIvc8IJxKQoLo83VJKRoq8zxzMKE/e+oXXjaRKK5rwBP2zUSqHEMyLhhNa+kvw+JZTbsjJcXUiep4pXII+TSUxoihfynvGiEBLsAujHFI0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0X+0KKf1N+/dIRJR/8VQ3Sal+kCsOS50B7Mh5Yo5CtE=;
 b=XjbqhJNiNS7wP90hf4XwlyNUh8vjCtlR7t0WrEy3mv4tcDUuDOUQy7xnGBbhZKfjKX0e9aPy1nXZOvNneYdI1TLZgQJppeD/PYnCRV0NI3oztFYHk/F6S0aJ6AdokzOtli5R3giEg6BdtxMyqbCuk9jU6iNvTOleA4OB/+RjIscy4PGf5p/UtpRjbAhEYDXmqBXL26gnbRswNntBGoeN4C9KhYdfaGgmQ9QO37UdCU5cmI0r89MsqAZFRN4/Kfo6mwBkSbg/7B2pwBbnYbCxRJG5IFsaXq6MJAwkYEHjERh9qM3K8XZ7IJTKhhQsHkFSXERJCyJroh2woh2VvPA5yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:163::15)
 by BYAPR02MB4696.namprd02.prod.outlook.com (2603:10b6:a03:43::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 14:49:48 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::198b:e44b:f8af:4635]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::198b:e44b:f8af:4635%8]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 14:49:47 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, quic_vpolimer
 <quic_vpolimer@quicinc.com>
Subject: RE: [PATCH v5 5/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
Thread-Topic: [PATCH v5 5/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
Thread-Index: AQHYMw1OBhsy/Tz+FESywpD+hB9Cmay1uHeAgAlGcOA=
Date: Mon, 14 Mar 2022 14:49:47 +0000
Message-ID: <BN0PR02MB8173C4634F3738916E5A4334E40F9@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646758500-3776-6-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJprgJvOGCU_PvAHCNoMvSam8QV4x9N2ZEm+oer5d7B-cPA@mail.gmail.com>
In-Reply-To: <CAA8EJprgJvOGCU_PvAHCNoMvSam8QV4x9N2ZEm+oer5d7B-cPA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 582bab18-02fd-4d10-bdf9-08da05c9e2e9
x-ms-traffictypediagnostic: BYAPR02MB4696:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BYAPR02MB46967930F33F0B53F7F7D564E40F9@BYAPR02MB4696.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4HqrMcoMyHxOEL6RmZp5EO5cCVRuxZmWiBXW0yhZOB2IdK7Sv4voUBaWw5jR5T4uABeQwZfGDJh5bK08B5KkJtSKr6tmZ6+kA69S2rqfNDRNj7ikARIAjJQvNqsGhLe6YHC8Y8lAKmQ2rO1hc/Gm/bLVUf+1FO9RCTscEUeRrD6BNwPUBX05AW8QEY7q+oS7NVFsNd4LgDy3ulhv2CYJFBmLg6QfeaGZKnemFLTW1o/xB4HAYplne95N83ftMM5bj45tOPmixexz2YB4Z7Ow1zix4xEfjy0RmBwd+o3PSmu9UAVfuyFo1Jui7wPCq8UUhJRlR9UrXPFxA+FGVI+sDqEjhWWJm/OjBuvGYWGmHOs8Mac/bKNf7SLdJOYXTR7KeNq80kKV19Wm1rCZ5NOwLDWCjd5q4cX69YrIviRQu5DCT/lc/h6S8Ic1DWo0T6sKPi4N6YKrYIpbmEIVxuS9iyYl0TCc4JYaKzPapff/brRs0DK+escAjOMqGzS27Sy/S/HwXP7JXrwedfe1HrXhVeq4AaoVUqxpgwlrT0ZdmSoh3d3rbRS56D4feXxMeafOmlUYBov398FxZYqpGmpgn+RtufQKdaQrGc8MTIr6UJh4ZaY2Rn25AVXD7+FG6fllAZHSUer1sSdyIytBF90gYHzNozhnCPLa+5mOodM0e+nrQym3Xauz6kgnjwlvi4OB0Ztz6oFbi8CFPO/N9V3PYw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(66556008)(38100700002)(64756008)(508600001)(66476007)(83380400001)(54906003)(66446008)(110136005)(4326008)(316002)(8936002)(76116006)(8676002)(52536014)(66946007)(71200400001)(6506007)(7696005)(9686003)(33656002)(107886003)(38070700005)(186003)(26005)(53546011)(5660300002)(2906002)(86362001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzY0WmIvUW12S2gxS0l6K1NpaXZONXRtZVFuajB1Nk1NMzBIZVVLUm1LSDc3?=
 =?utf-8?B?WnlhZXp0TUxsaHdoQk1NT3VuNUlaVHhiTFlPRm51cnBUL2pPNVNpSWkxaDBB?=
 =?utf-8?B?Z2w0S1FDVTNOeFZNb2Ruc3RldGhCQmNCSHUxWE5DL3BjZGdyYWcwMGd6WjhF?=
 =?utf-8?B?YXFaeWhHYSs3M3grcVNMck9sYzNBcDZLMDg3ZnlVWHJFaE9aZmVBaHY5bzVr?=
 =?utf-8?B?TmZGZ0pSTE9YNzBnVkVzaWdUYmlNMmFWN2FOcmNnS3A4SForMFBJaDJNQVFN?=
 =?utf-8?B?bmdlNXdCZ2xzQ0hoYXZoaEx0d0NTei9kaW9vQ3ZZcWhsZWVuNDNOUXZzMjl2?=
 =?utf-8?B?Ris0Zjd0TnRuREdMeTZGbmtOTVlRZURTWkxjV2dzRS9hTlNkRXZIQ2QvdjBw?=
 =?utf-8?B?UjhuaEw4ZlJuUmZweGRNUzkvVm9JRkQ1WTZYTWZOV0lic2pWMmxFR0NSYWNv?=
 =?utf-8?B?REl2U1ZoMkRrWGJvZGJxN0lnOE0vMlNYVVF0K3ppaE9jSnZFOEVmSjVhVnZP?=
 =?utf-8?B?c1o4L3pIMUVGYlpVYlVSd3BpekRjS2lFN3JSbHBXZ0o2OC8zRmxHbWkrY0RS?=
 =?utf-8?B?QlVRRDdmWEVOMXI0bnppeFJjRkY0UnVWSEdLS0dycDFxcFEyblA5VG5PMFp4?=
 =?utf-8?B?WXVWK29YSlJWQXhaYTU3d1dzL3NlZGdSM2wzQU91bHYrMXBYNm55SFBQd1Vs?=
 =?utf-8?B?RUNnUTQyeVdPRTRFS3JaL3BVb1VUdXEvWVkwa01SQlROL0x2SXJVMEhKdkJq?=
 =?utf-8?B?SDhFcmx2OGltbisvVXRSRDcwSXh3VmJGVnRnVEpSQlQrS1J0Z3gwVCtJQ3B6?=
 =?utf-8?B?d0lrUzJPa0tDU1BzUFg5UlNTTi9ubWNsS0NJcEovL3hHVkhERFJJVndhb1hN?=
 =?utf-8?B?dGFHaWhCbE1NRjYwLzJuZ2Nra3MvazN4ZHNXWFA0bXNsaEg2bDU0TzkvNjNz?=
 =?utf-8?B?cXFpU0NUSmdrWGhQNVFQN25Gd3JVbkFQTUVUZnBPaW1KemFkN01GbnFEKzVE?=
 =?utf-8?B?MWdhQkZqWS8yS3N6bWI4OStlLytTTmpoUFcwOENKSlRGZUg0UEtzdi9Ga0NI?=
 =?utf-8?B?dS9MNU5Mejlmc3Z5N3BjMkJpMnhVWEtIc0JyMkd0eWlyR3B1MjEvLzd6ZVBX?=
 =?utf-8?B?MWEzN3FVS2Y1d29Rc0pNRHNza0tFbk0vckZLbDBNRWZKcXkrRG9YVnNlVEhl?=
 =?utf-8?B?TkN1QTFHdU1SU1U2VjliN1NubVk3MXFjSXlROW42NUQ2YnNUTUZTTGoxU2pv?=
 =?utf-8?B?bXVleURIVjR0UStYRWNqcFJ0ZkwzekJVNnl0K0NpVUh2Y2hNY2U1NmdzdXUr?=
 =?utf-8?B?VHRBcDVmV2p3TnZVTmljM3hSU2RqS21jSnV3ZjJ1ZDZLbDlGZm5GLzRtVld4?=
 =?utf-8?B?cFhEK3hSUGFTdlFIamtWdUNtTFpCd3B3WmMwR3VCcWF0aEdvYXJUSW15cEh4?=
 =?utf-8?B?YnU2aEtQUExlNGFYcXJHWUJXamlBaXhLc2dzUHdJNWFBZWxlVmNBNWJYWWdr?=
 =?utf-8?B?Wi8xdXFZbXlZSVE3ZTAxcjZnR0ZTMTM2KzNmWkROSEtaMlV2UmdzVWczdXd2?=
 =?utf-8?B?N29yN3EydXRqbDMrVml5VUN6QlV3WXJoQk45cmhVQ0E1eGUrS2NvRUZMaGJ1?=
 =?utf-8?B?clRKaHp3eXhvdk1uR2xmT3NlVGZ5bTZLU1BzTVJIa1A0WDl5UndUcEVreHZZ?=
 =?utf-8?B?SDNkeGdFbnVHOEhmOEVENHdlKzVOenVEdHc1L09RU1Y1UDlsYnhyTHo2aTEx?=
 =?utf-8?B?V0MzOXd0MDA2bFZIZ1lkL1liYUZZNUhzV3Y2MUc2bGhkZlhLa0gzcVNwSytX?=
 =?utf-8?B?UWtheitWWjdwNkVUUU1VcjkyYWdVR3lCZHVSMi9lMW00cEpsZ1A2cy9MaStz?=
 =?utf-8?B?cU8va1E5U0x3NGNoWkpzdFp5cVkybWVMNkVUa3ZJVnVMa045bElleTJ4YVAx?=
 =?utf-8?B?SVFQL205RUd1Wm9ESTF6V2ZDVUliVWtrZ01HZjk2R1FwNHZWb2dMUDd3RjJB?=
 =?utf-8?B?cWpvVndMdUp3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582bab18-02fd-4d10-bdf9-08da05c9e2e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 14:49:47.9256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VWE2MxPWifrX7tMHPnPo2K8C4MpU6UA6/MhczvO2CnR81041/CjaNRGfLVyJOqSdT8QthpSlCIhk59qQTiVXau7A/qTAiupvbU085w1W1xc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4696
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCA4
LCAyMDIyIDEwOjQwIFBNDQo+IFRvOiBxdWljX3Zwb2xpbWVyIDxxdWljX3Zwb2xpbWVyQHF1aWNp
bmMuY29tPg0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtYXJt
LW1zbUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgcm9iZGNsYXJrQGdtYWlsLmNvbTsgZGlhbmRlcnNAY2hyb21pdW0ub3JnOw0KPiBzd2Jv
eWRAY2hyb21pdW0ub3JnOyBxdWljX2thbHlhbnQgPHF1aWNfa2FseWFudEBxdWljaW5jLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSA1LzVdIGRybS9tc20vZGlzcC9kcHUxOiBzZXQgbWRw
IGNsayB0byB0aGUNCj4gbWF4aW11bSBmcmVxdWVuY3kgaW4gb3BwIHRhYmxlIGR1cmluZyBwcm9i
ZQ0KPiANCj4gV0FSTklORzogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBR
dWFsY29tbS4gUGxlYXNlIGJlIHdhcnkNCj4gb2YgYW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBh
bmQgZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+IA0KPiBPbiBUdWUsIDggTWFyIDIwMjIgYXQgMTk6
NTUsIFZpbm9kIFBvbGltZXJhIDxxdWljX3Zwb2xpbWVyQHF1aWNpbmMuY29tPg0KPiB3cm90ZToN
Cj4gPg0KPiA+IHVzZSBtYXggY2xvY2sgZHVyaW5nIHByb2JlL2JpbmQgc2VxdWVuY2UgZnJvbSB0
aGUgb3BwIHRhYmxlLg0KPiA+IFRoZSBjbG9jayB3aWxsIGJlIHNjYWxlZCBkb3duIHdoZW4gZnJh
bWV3b3JrIHNlbmRzIGFuIHVwZGF0ZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFZpbm9kIFBv
bGltZXJhIDxxdWljX3Zwb2xpbWVyQHF1aWNpbmMuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMgfCAzICsrKw0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2ttcy5jDQo+ID4gaW5kZXggZDU1MGY5MC4uZDk5MjJiOSAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMNCj4gPiBAQCAtMTIyMSw2ICsx
MjIxLDcgQEAgc3RhdGljIGludCBkcHVfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdA0K
PiBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkNCj4gPiAgICAgICAgIHN0cnVjdCBkcHVfa21z
ICpkcHVfa21zOw0KPiA+ICAgICAgICAgc3RydWN0IGRzc19tb2R1bGVfcG93ZXIgKm1wOw0KPiA+
ICAgICAgICAgaW50IHJldCA9IDA7DQo+ID4gKyAgICAgICB1bnNpZ25lZCBsb25nIG1heF9mcmVx
ID0gVUxPTkdfTUFYOw0KPiA+DQo+ID4gICAgICAgICBkcHVfa21zID0gZGV2bV9remFsbG9jKCZw
ZGV2LT5kZXYsIHNpemVvZigqZHB1X2ttcyksDQo+IEdGUF9LRVJORUwpOw0KPiA+ICAgICAgICAg
aWYgKCFkcHVfa21zKQ0KPiA+IEBAIC0xMjQzLDYgKzEyNDQsOCBAQCBzdGF0aWMgaW50IGRwdV9i
aW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0DQo+IGRldmljZSAqbWFzdGVyLCB2b2lkICpk
YXRhKQ0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICAgICAgICAgfQ0KPiA+
DQo+ID4gKyAgICAgICBkZXZfcG1fb3BwX2ZpbmRfZnJlcV9mbG9vcihkZXYsICZtYXhfZnJlcSk7
DQo+IA0KPiBZb3UgbGVhayBhIHJlZmVyZW5jZSB0byB0aGUgb3BwIGhlcmUuIFRoZSBmdW5jdGlv
biByZXR1cm5zIGEgdmFsdWUsDQo+IHdoaWNoIHNob3VsZCBiZSBkZXZfcG1fb3BwX3B1dCgpLg0K
PiBNb3Jlb3ZlciBqdWRnaW5nIGZyb20gdGhlIGRldl9wbV9vcHBfc2V0X3JhdGUoKSBjb2RlIEkg
dGhpbmsgeW91IGRvbid0DQo+IGhhdmUgdG8gZmluZCBhbiBleGFjdCBmcmVxdWVuY3ksIGFzIGl0
IHdpbGwgY2FsbA0KPiBjbGtfcm91bmRfcmF0ZSgpL19maW5kX2ZyZXFfY2VpbCgpIGFueXdheS4N
Cj4gQ291bGQgeW91IHBsZWFzZSBjaGVjayB0aGF0IGl0IHdvcmtzPw0KDQpjbGtfcm91bmRfcmF0
ZSAgd2lsbCBnZXQgdGhlIG1heCBmcmVxdWVuY3kgaW4gZnJlcV90YWJsZSBpbiBjbGsgZHJpdmVy
IGFuZCBpZiB0aGF0IGZyZXF1ZW5jeSBpcyBtaXNzaW5nIGluIG9wcA0KdGFibGUgaXQgd2lsbCB0
aHJvdyBlcnJvci4gU28sIEl0IHdpbGwgYmUgb3B0aW1hbCB0byBnZXQgbWF4IGZyZXEgaW4gb3Bw
IHRhYmxlIGFuZCBzZXQgaXQgYmFzZWQgb24gdGhhdCBmcmVxLg0KPiANCj4gPiArICAgICAgIGRl
dl9wbV9vcHBfc2V0X3JhdGUoZGV2LCBtYXhfZnJlcSk7DQo+ID4gICAgICAgICBwbGF0Zm9ybV9z
ZXRfZHJ2ZGF0YShwZGV2LCBkcHVfa21zKTsNCj4gPg0KPiA+ICAgICAgICAgcmV0ID0gbXNtX2tt
c19pbml0KCZkcHVfa21zLT5iYXNlLCAma21zX2Z1bmNzKTsNCj4gPiAtLQ0KPiA+IDIuNy40DQo+
ID4NCj4gDQo+IA0KPiAtLQ0KPiBXaXRoIGJlc3Qgd2lzaGVzDQo+IERtaXRyeQ0K
