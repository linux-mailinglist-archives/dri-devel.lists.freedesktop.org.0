Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 894FE286D39
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 05:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A942F6EA1A;
	Thu,  8 Oct 2020 03:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4374B6EA1A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 03:39:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzMkEHquCAgwEqZudIN9Y5l4AqTTjOlIU0Sn18ncqEzRaagO8p/KIdsEm3tTHw5/GjR8Zgj4lIgGBpwHyWxB3ZQQ5Zf354HDJoE0GIDfAO9SdW2ZKlGQusTddbDVHaH0CUxgweffOgsiOrSDM8F6/l4lSmm53Qqi295xjoN/UqAb1AMuy6MdE53Wdi3J9y4nMAtCzt2A7uC/7JotiPJa2noga9DB6V7c8GWNwZqTzyMqQEbSsBaMBB1DCwUxHPE0MqykO3da0BOVi6dQ26L5AF19WPVwlqVYzZqHe8PnU26arxmm41dcaT5G7rYfa6mD19lqd4RzvG/V+lTeKEd/jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbMHunQMjjpnwds65i4cWIkV1tWHSqQIOmtGOgGEtjo=;
 b=lpa88ILayguSLF1ql+hGUlIAhLPGqoyESYHf5tPGXzwUWxNEZi1oVrU9RrqdYwk3BItrTytAWEnwmv/Y7nQFn8bIOcVSORp4e4nGqAg5bY5YmwVTwz+LbGNZSVKt+fY7e51NvOH0q7Z1hS6btY5ltYPRaIw6PNPGWgeW2vwdPr1UtsIROtUbFokzlZtCy0ycHajB8jMNdlklbaX4DyeOzSPtZkv5N/g4SYOTG6zwjoseUuNiu1V7ibVITItzpVhxF8R2328SrGe6mB6KIXndchTKr1Wob9zCEeN882M/cueYiEw4q2P7VPzXPmwdk/3E/XhSpwbthAcRvGJ6dkvlBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbMHunQMjjpnwds65i4cWIkV1tWHSqQIOmtGOgGEtjo=;
 b=RkaSk3Q8CE492m0bAgq+wNvFwfBG3HI+Ba66kVpxSbMR/gCH0+x3lIHzi8SFjHfU8MNH682M2WOTvoelodF8gQZxFePnxq2ouBUh/RVeb9m88enmgec1l3m1M001wkSOz6OEaHa99RyqjnGLESOXtDynDi2Wn1qje1YLKUH4doo=
Received: from BL0PR05MB5186.namprd05.prod.outlook.com (2603:10b6:208:8f::18)
 by MN2PR05MB6765.namprd05.prod.outlook.com (2603:10b6:208:182::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.11; Thu, 8 Oct
 2020 03:39:33 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::6499:fc85:5382:1f06]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::6499:fc85:5382:1f06%3]) with mapi id 15.20.3477.011; Thu, 8 Oct 2020
 03:39:33 +0000
From: Zack Rusin <zackr@vmware.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 2/5] drm/vmwgfx: move null mem checks outside move notifies
Thread-Topic: [PATCH 2/5] drm/vmwgfx: move null mem checks outside move
 notifies
Thread-Index: AQHWm3SjRWutc+lksUyowU3oR/jlGqmNElsA
Date: Thu, 8 Oct 2020 03:39:33 +0000
Message-ID: <893ABDF1-45F8-42B8-AD1F-0064625F2046@vmware.com>
References: <20201006000644.1005758-1-airlied@gmail.com>
 <20201006000644.1005758-3-airlied@gmail.com>
In-Reply-To: <20201006000644.1005758-3-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 777dbf1a-7738-4ef4-0f34-08d86b3bc560
x-ms-traffictypediagnostic: MN2PR05MB6765:
x-microsoft-antispam-prvs: <MN2PR05MB6765344F8DBC121BFEB6D220CE0B0@MN2PR05MB6765.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TJAaNArqoZo5GDcjCd8vC7Mj27Mlg5TJl6mHcc89W+aG3JQ5jcjXznNzEGwSnqY52BfpLz3PokS6uYBkLLLCgsWL6aKl21JvIZ2ALD5emyuscPP7izv8gcSc/M7Vpcs5DoUy2sz99s0pq05wd/+az7bMpiRzrj4CdvImR7CoyEdONjZVwfBpV1EH576ImmmayPZivcM4tP+SAlrX/DCWs+HmfQu/LiU3LJnExgg29xCs2f+X/UKydawccznpB3v8aFI8BTOmFVtze4VPmBW7a2wEHhOrs0TmzB7HEoTbz0nZq1OP0RuwV1TIhFLJpKRYJ9q7shirYtHW7pExfZFZtw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR05MB5186.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(8676002)(6512007)(478600001)(26005)(5660300002)(6916009)(186003)(86362001)(71200400001)(6506007)(6486002)(54906003)(53546011)(558084003)(8936002)(2906002)(64756008)(76116006)(2616005)(91956017)(4326008)(316002)(66556008)(66946007)(66476007)(66446008)(33656002)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: VtPo1gcVjc17fb9S7yxV/yGwlXKrNl37B7YA/gdccTzwU2KiJOFd7fnsjHOJm+QnbW631Eqdtf7YDPIael3WG0NgaGvtXyc5PgDJfyXsub49Rnf5q6Iz7XUqcZsKf+/arv2TIzgWNwAnlCVJ0DfCnbyHM4MOk52o0PdMD0JCBbjhdj0fbjP3JgkQubSNNEq3H6lQOXuTkyq6K+ippbX4WbYp+uQzPpAy+QY8JtTr064og4JQTXSYA1aL4zx+ERBnRmJeXVCcOxB0t+2QJzI/wXCumXxvVbCSNZVAkpyBiYHDu+PT/kqSJmzDljpZsaw4C7yE2MHIGQHYVIBbURJMU37oRMfSx5XkaSrgaVZQTxcTUmVraQKlj3JI9LeICj7XIZQr0icSFmMNH71lSku5WXCu0r79h173C9p878kMmET1eQk4IjiDc2cv0VgF8eKuTY2piGgaD+sclzcZ/72hIzq0cV8Q92wbxQ4W9WMrKcIKvuRWTFtR8nawpxyHe73vObKvUWwU9AytqDVgU9kHKLzBFJW2zBZMYt3JnG5Xn9KiZsYURVBg1Ca90W5UcujIx5ddrK/qafST5enIPCxwO6Wwgg8CNShZGfmrBP/yYXdIUTGkRsJUH9cTjDI98sJDhYzn0lgUGbNgj4cZKmitnQ==
x-ms-exchange-transport-forked: True
Content-ID: <29BCC5B3B5E8674CA0F5802471382E95@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 777dbf1a-7738-4ef4-0f34-08d86b3bc560
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 03:39:33.0555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /CqedB6qZLoelkIuSVs2EtvzXAzW8euqhlxtK4XhyXAuJGt/HvwzbaKwTQu0Q4qIaRtkKRmdppJsUsFlAYJNZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6765
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
Cc: "rscheidegger.oss@gmail.com" <rscheidegger.oss@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+IE9uIE9jdCA1LCAyMDIwLCBhdCAyMDowNiwgRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwu
Y29tPiB3cm90ZToNCj4gDQo+IEZyb206IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+
DQo+IA0KPiBCb3RoIGZucyBjaGVja2VkIG1lbSA9PSBOVUxMLCBqdXN0IG1vdmUgdGhlIGNoZWNr
IG91dHNpZGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRo
YXQuY29tPg0KDQpUaGF04oCZcyBhIG5pY2UgY2xlYW51cC4NCg0KUmV2aWV3ZWQtYnk6IFphY2sg
UnVzaW4gPHphY2tyQHZtd2FyZS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
