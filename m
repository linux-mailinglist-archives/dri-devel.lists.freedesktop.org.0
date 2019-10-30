Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 493FAE9C69
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 14:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBAF6E9C9;
	Wed, 30 Oct 2019 13:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BCC6E9C9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 13:36:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJ2TIbb/U6hrHDk32Dix4iA6RYDeCHdZBQ8tq+NZRRVbKGWD78wZXshx4qcm7VB12okdSkXNHKjaeCmQnuRTaTmftlsCQ4T6ljrw7CCn6iGXY7ie2uuEjW8LmlZGwBv1OY3be7LBedFFIOwIB/LNoMb+9W4/aKPnEmT7CruiRmwJGpY/2ElF3GkOScdnKDegEyPjm52jnVVva33Ouj5X5HCVucsdp/8woGftZGSZQTTFRe7ByTiO++/TRUsgxneLhXrqG3U0y7ow7KJ3l5qJRA2Y9LP6OpPjcn1HKV6bPmt4wOVacuOAQFeTMYFTtj7xzz2qNw5T3un97OdD3vtPjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aN0VleDSXUjx3LymmtsJEwlLFtz7H3Uei29kHfXAr+Q=;
 b=WU3LgP5zwadkhdk5yv9kZ+f/UkuMicxo/ng8kRM0k3CLcFoM51W4PMoFelIMMqj+Lupw+VOhrzYkOKG9+tMLsmxkeHlOAkZJ48eMvnIeM0u3U3hYF/tZ9NBbqGE5tLYfL0KV9EbJWvzVQpVQzI6izI3A+qEN6NvdOy7M5O6AEsQd/LvO4w5IOl0drzxoGLrae8thdkflXhuexRogTTew7XiJ5xM31DIloKgdO5Rz4f/4xwXdWM3yS3VhvU/bO5xGJ8Msf4WEJ6S7WpPBqan6tXhg4YyWG55p3X8T1EIehuqj14WaA65hMih9868BS0Mr2TBDTq8raQDMz3SO/KD7mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Wed, 30 Oct 2019 13:36:41 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2387.028; Wed, 30 Oct 2019
 13:36:41 +0000
From: Harry Wentland <hwentlan@amd.com>
To: zhong jiang <zhongjiang@huawei.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/amd/display: remove redundant null pointer check
 before kfree
Thread-Topic: [PATCH] drm/amd/display: remove redundant null pointer check
 before kfree
Thread-Index: AQHVjsYF6IMKJatV60G8yg8AJh6PZKdzMJAA
Date: Wed, 30 Oct 2019 13:36:40 +0000
Message-ID: <723f11bc-9a65-bce6-9c0f-2ef2dbe7a1db@amd.com>
References: <1572400673-42535-1-git-send-email-zhongjiang@huawei.com>
In-Reply-To: <1572400673-42535-1-git-send-email-zhongjiang@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
x-clientproxiedby: YT1PR01CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::26)
 To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a1b991e5-dbac-44d7-3512-08d75d3e3206
x-ms-traffictypediagnostic: CY4PR1201MB0120:|CY4PR1201MB0120:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0120856831BEEDA42EC8BC3D8C600@CY4PR1201MB0120.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 02065A9E77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(81166006)(71200400001)(4744005)(102836004)(54906003)(4326008)(7736002)(81156014)(110136005)(305945005)(53546011)(316002)(52116002)(6246003)(6506007)(8936002)(66556008)(66446008)(64756008)(25786009)(76176011)(5660300002)(478600001)(6512007)(66946007)(66476007)(386003)(486006)(71190400001)(186003)(8676002)(99286004)(26005)(36756003)(2906002)(31696002)(6486002)(6116002)(3846002)(6636002)(14444005)(256004)(6436002)(229853002)(31686004)(11346002)(446003)(476003)(2616005)(66066001)(4001150100001)(14454004)(58126008)(65956001)(65806001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0120;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5G4lZBSHFW9SJO1LWXg01p2np2wlom9LhpK5tEkIbc485WEbHhC9bnyyJxT4rdHZ+flKV+Fvyn5A3j0o3HbKFe1tCe9XgDP4RQRC6E/MSOy2448wyQkCtpgwlR5+qbw9HAzRKs5sj/PoegKZvcx8pY5O/mPcz39mJWZ6rNUWvHxPYKsRgbvz4woWjRAWpsmX/9wqjeFEtzXaIZWhV4BhFznrtB175iZFFPHd8iD0dwdCj8I4kUwEJqbn/KMaToxnreffcMgLLXrHMXYQefskk/3iVGoo0tDx8VQCeHmiGyMgX1G88/sHIdHwiP2+BM+rKM2ep+KTm/MoEsmgUxNd3vW/gcsg4AGirrHw4x4hEAIwnZUV4JWQMumhE5Ei2Ph6jj8ejb9CRqTxdC/S1SSZ86X/S0+GIWmXxcHvFFwJJJUv04II77DhY0ytXOQyToLp
Content-ID: <4AAD7E9224D2294EB9757B417C585CF9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b991e5-dbac-44d7-3512-08d75d3e3206
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2019 13:36:40.9525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3rrJfvfa1mqQTayHtF1s5+m3gAQzV7fUprMMia3Cz9nytlwaxqhOy3WkFxNC0AQtVeaRPLUvAKZ33F3nOG27HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0120
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aN0VleDSXUjx3LymmtsJEwlLFtz7H3Uei29kHfXAr+Q=;
 b=B/1+lG88oaFjjMuU48p1YFSD4mw4dvLTM6GGGvuxASvnuR3oCr3E1FVRYxPsGeSD4lAbFxqHxWax3aWV7FR4EASh3P+gZn6MuEEPLb7UPSmuw2m8HsSjq16KmYqwCCzike2gm6FBfErzxl/Z/wzITz1iqia0axSgdzKjEn72OX4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0yOSA5OjU3IHAubS4sIHpob25nIGppYW5nIHdyb3RlOg0KPiBrZnJlZSBoYXMg
dGFrZW4gbnVsbCBwb2ludGVyIGludG8gYWNjb3VudC4gaGVuY2UgaXQgaXMgc2FmZSB0byByZW1v
dmUNCj4gdGhlIHVubmVjZXNzYXJ5IGNoZWNrLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogemhvbmcg
amlhbmcgPHpob25namlhbmdAaHVhd2VpLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRs
YW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KDQpIYXJyeQ0KDQo+IC0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2hkY3AvaGRjcF9tc2cuYyB8IDQgKy0tLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9oZGNwL2hkY3BfbXNnLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaGRjcC9oZGNwX21zZy5jDQo+IGluZGV4IGNm
NmVmMzguLjZmNzMwYjUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9oZGNwL2hkY3BfbXNnLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2hkY3AvaGRjcF9tc2cuYw0KPiBAQCAtMTc0LDkgKzE3NCw3IEBAIHN0YXRpYyBib29sIGhk
bWlfMTRfcHJvY2Vzc190cmFuc2FjdGlvbigNCj4gIAkJCWxpbmstPmN0eCwNCj4gIAkJCWxpbmss
DQo+ICAJCQkmaTJjX2NvbW1hbmQpOw0KPiAtDQo+IC0JaWYgKGJ1ZmYpDQo+IC0JCWtmcmVlKGJ1
ZmYpOw0KPiArCWtmcmVlKGJ1ZmYpOw0KPiAgDQo+ICAJcmV0dXJuIHJlc3VsdDsNCj4gIH0NCj4g
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
