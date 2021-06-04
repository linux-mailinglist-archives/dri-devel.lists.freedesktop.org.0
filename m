Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6400F39C66A
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 08:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2636F382;
	Sat,  5 Jun 2021 06:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2124.outbound.protection.outlook.com [40.107.100.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCF46F89B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 18:37:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fqljh0/9gh3A6pYT92d0OvjDIduz5/ZkQKm33x0eE8YDm1O+RcJcntBkrNCjNmjQdED8iZOT9Bo1/8Ln674f6sLxQPWodSynJYGkqiY2XvyymK/0hDOJjs02LZHMKlDf6u94/LVSjFJrftjHChIN1VdXoGB2YQCOrMrCWgljY7haiPo95QUOXi+xZoBOFVeIAGjq1wlT3CngibzVUD/xKQFz4L5RCuKTwfC5NovO34orIt01PWB3XZ/MP1A4kNSjJ8RkAXGn9+pDfrW+UJRmxlFthH1ougt862qo34N2qO3E/56qf+MFsJPY6MeVvZpFO7vV2Ann4AMre3jfOPBQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uwxf20RdeKztXzn/NN2UNpD1zS83YW3DoLF3gNY+o2Y=;
 b=C3tsk6Cx8bWcBDJYJgDAg9i4kfpEM/z70TQrqjsrw8bu5YCRK9R6xF9xEQTa9YffgNpxy/8Ih3xkix1W4SpelErRgo/vhvPKyVerFk2PFeoPwkvcfhRKZhodQAQTRvWY4vA2RG1glmMu4ZsGx3cd3s5biVyzO/Co5K04sclkUjjDOE0xD26DWiNth1XhpoVk4DNjMNvZ8PKM3XFdpYccG6ln02Z38F9mVXdjpylEXnAnYCI+vszJQwunbbU48pYjT4yji0MclyqC00Ntx/ouleLTx77Lf3s5+YdDJ0B7Zd2XW/vrTYrEtbaFdHv5uF522qob1EgSPQXWC3PILJFW6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uwxf20RdeKztXzn/NN2UNpD1zS83YW3DoLF3gNY+o2Y=;
 b=VywXSLWnW8WZX+7881qf1lW3/Zi5IwTb5YrlYncsPygxvZ32UynrsVd5TABOlVvNO9+BDAZotkuVReBxUE4TDNkCa0H2Z7q064rlOgQjUb1Wh1ALnYq58vhaDWWwdtt4whmunecvr18WC94N/ZHmVSAYlGZ9O1gYxIyDpn5cfQw=
Received: from BYAPR21MB1270.namprd21.prod.outlook.com (2603:10b6:a03:105::15)
 by BYAPR21MB1352.namprd21.prod.outlook.com (2603:10b6:a03:115::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.5; Fri, 4 Jun
 2021 18:37:51 +0000
Received: from BYAPR21MB1270.namprd21.prod.outlook.com
 ([fe80::a966:8542:afd9:a20d]) by BYAPR21MB1270.namprd21.prod.outlook.com
 ([fe80::a966:8542:afd9:a20d%5]) with mapi id 15.20.4219.014; Fri, 4 Jun 2021
 18:37:51 +0000
From: Dexuan Cui <decui@microsoft.com>
To: 'Matthew Wilcox' <willy@infradead.org>, 'Wei Liu' <wei.liu@kernel.org>,
 vkuznets <vkuznets@redhat.com>, 'Vineeth Pillai'
 <viremana@linux.microsoft.com>
Subject: RE: [bug report] Commit ccf953d8f3d6 ("fb_defio: Remove custom
 address_space_operations") breaks Hyper-V FB driver
Thread-Topic: [bug report] Commit ccf953d8f3d6 ("fb_defio: Remove custom
 address_space_operations") breaks Hyper-V FB driver
Thread-Index: AQHXWW3L3fJJ2e+zW0y7P8+sYVIpAqsELH/A
Date: Fri, 4 Jun 2021 18:37:49 +0000
Message-ID: <BYAPR21MB1270A0B5CEDBA1C0D2E290EBBF3B9@BYAPR21MB1270.namprd21.prod.outlook.com>
References: <87v96tzujm.fsf@vitty.brq.redhat.com>
 <20210604130014.tkeozyn4wxdsr6o2@liuwe-devbox-debian-v2>
 <e5c90203-df8c-1e72-f77d-41db4ff5413f@linux.microsoft.com>
 <MW2PR2101MB0892518BB763E7D8137E2590BF3B9@MW2PR2101MB0892.namprd21.prod.outlook.com>
In-Reply-To: <MW2PR2101MB0892518BB763E7D8137E2590BF3B9@MW2PR2101MB0892.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=e3e14d2c-76e6-49f6-9a7e-5e8853c34ff5;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-06-04T18:11:36Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [2601:600:8b00:6b90:7151:7539:d190:d1d5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fc3ac79-77b7-4616-e07c-08d92787dc32
x-ms-traffictypediagnostic: BYAPR21MB1352:
x-ms-exchange-transport-forked: True
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-microsoft-antispam-prvs: <BYAPR21MB1352B45A6211B60FCAC4C2A7BF3B9@BYAPR21MB1352.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TtRFbztUlDV0ZuA68gVp6ZrAJZD7HwSmYTD26zzlgY/jiKfuzGF+Y3PR0OJQY9d4TWSh+9q0uze7/7Ga65r1Ha7W12xbvICd7ESnysulVlSS/057bRjEA8xp1yCDpW6HWBoxNAS5WFqKZ1qUuXb2m1ojAOs4A1tgAkSK38ikPGUoKmuztOZhL3nqw/YreUNAi1FHj/ZdOxh6aa3hNWyLFIibgyiJnPdIGGvmC+SXYXCeRBKHSr+tMT3DeYZxCFirfWFqyqtvKtI7C/KPvGcRKghXh/WQFoiIt0hy8ZKKmT40fv/QMTFQXyWvjuKBg/mIKuvc7Z0LCts+oHa6ggo4fKnBiOsVDjT2VNK+Kv1Sd0fWxHX1awA4iVNLMUgJXQMlSqa2w9OzH/yLP+DUYgnsSxMp2rqeSiWq0OGXSEWg1V361jPQE5d5gx8dheeBjRVebUUsZGaUO7JL+HDx0sXEfYgkdsJb9g/SLhcpivpArWO6h+5/zxSjZbIpExYBJnoxRhlKpW7NGiN5ppZaVQfHaQbbs4+RLbVX0E6n1yf//ep2qLB4/xf/kCu7psiW5GRoKG09ihJ5dLGDy8VnpvR99Q1+ODUfYBdVw/k4R2coEkVFc/PTIA8m4p6mh0kYgqYygvCq63HEEmr/oIrXM5gBl5ADpO7t/eyw78JScQK2HlxIHIZmATuGWlex/owBjs69bo2VhL8A8DuZ6ss0xXp1kSlysQP+tEU+yVvylPNU0aCA8Ge6SpVAMZJoR0xGw2YrNqOfsjs9hGQZNay5MKFzVg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR21MB1270.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(122000001)(9686003)(52536014)(8990500004)(38100700002)(76116006)(316002)(186003)(55016002)(2906002)(6506007)(478600001)(86362001)(64756008)(66556008)(66476007)(966005)(5660300002)(4326008)(82960400001)(66446008)(10290500003)(110136005)(54906003)(7696005)(107886003)(71200400001)(82950400001)(8676002)(83380400001)(66946007)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cksrelRBNllVVlRaejk3NDE4Z1V1NGJHYXo5ekVTTFRSUHYzd0JScnppaWJl?=
 =?utf-8?B?OHMwR3h5WWJFVjRxQnl1UzR2bWdRRTNMSTNYTEVJZXM1RFBOUmtjenZPYjJq?=
 =?utf-8?B?dmdDQ3FiRFRmRHFBMHk5R2JJQ2tMYVpLaHNDNzhwd2Q5UkNvNERCOTNuWVRN?=
 =?utf-8?B?aUQ5SWRXWEtjN203WDdjc1VLUVlHcklJWU95TnQwYWJRcGpHQzdHdTF1MWVu?=
 =?utf-8?B?aHFqS21DMERNTU1UclM0dzZYNmtnSUdTUjkrL0ROa1VoOTB1bys4eTdnWjBo?=
 =?utf-8?B?ZTZaWFp2dWYzN2tOaE9QSGtyRWN1cGRVRHgwYXh1WVpYcWFNNFl5NFVHTGN6?=
 =?utf-8?B?WitHamFRVkI1RGNDaDRaTk5Hcmt2Z2hKQmNzUXZEeDVYaVdBeUlDM29EOHBl?=
 =?utf-8?B?aVpZZHp6QkdLNWkwMElacGxTTzhwQjg0RlZzRHJaTXI5eExZVURuR0hLT0kw?=
 =?utf-8?B?UVF5QWNGRXp1bXZMdXhKL2VjVnJQempSSldDNXVyZlhyL2VGVWxIWUVSVzg5?=
 =?utf-8?B?dm02ZTJsWUxkQnppL0VBeVRuNklid2JyUzFkVURCUGhrN21objk2VjZUUmhL?=
 =?utf-8?B?b2xDay9RbURjKzNyaVc1UlM3RE5tdDhXckk0dC9Fc2R3WjdwaW53KzVQVCtW?=
 =?utf-8?B?LzdoK1lFWVRNeGtOMkhTMUVPbERxcEFQUngxOThmdmpvbDFBWWwzNDVpZWVy?=
 =?utf-8?B?T3VkQVVpMzFYdk9FVkgzaWt0UzJpM0NHVzdUdWkrc0g0d3ZxOFlxc1dNNkJh?=
 =?utf-8?B?aVdseG9tVHZkZ2NVYTlTUkEwdDNQc0prN0EzWmxmd2ZUTmVqUXVNZU45S2hU?=
 =?utf-8?B?V3lUd3JQSE5NS3dha0RnZGhPVk4vQzVQelBPUlZtQk1rYkVtRnFNU21mTHVy?=
 =?utf-8?B?aFp0cU0rRDkwSjVKbVBrS3g3enRvbytWMFp4eUhIaWJ3TFFvdGpqSWVUcllx?=
 =?utf-8?B?UDlRM09tZ2hJRnJRREVLU3RRM092UDg0aU5MOUttdHcvVHhHSWhXeXViSm42?=
 =?utf-8?B?L1BoQnE1c3JtTU9yNEQ0KzdsbUZRMGZ6MjBWeTJyQnZDaThFdm5UZ1RUM1c0?=
 =?utf-8?B?Uk53YnhnYVc1amtrNXY1d0dYWUNnOVJETCtYRXh6dXBSTGl1Z3B3RW5MdVdl?=
 =?utf-8?B?N0RHdHU2ZVh2a0JueDA3VFJ3VnlyMlFzMlhkZW55UXVqTGV1QWxTMko1Q09z?=
 =?utf-8?B?VU5Rcy8rOXVKcGh4L0FiN2tra3hTK0lhSnJJUElJUkRWV1JYTTl4UGp3dU9L?=
 =?utf-8?B?WlNzTzNtREZxTUwzY2VsYTFlNk0vNS9JYU9SbHUxcHM2RHhoV1R2TmxsZHMx?=
 =?utf-8?B?eSs5UWhBcTl6RjcyVk5aSUs3SzFxZDBkUTA5QStFZTNyTFdzZUEvQ3pZb2Q3?=
 =?utf-8?B?TWdBYkdNYlIrTDZsNWhZSFlmVk1XMGwraTRraFNoYXg2OGtxS2k4VnF1NTc5?=
 =?utf-8?B?V3p6WTJBZ2hGRlY1N2RKYy9PNUN6OVExQmwxc2k3SUpYdTBnWU9nMXFsdHJ5?=
 =?utf-8?B?bFJROEphRW5BenNwWHJOVW5Dczg4NE84eFZLM0p0S2tmRG5JYWhPWjlpSzJQ?=
 =?utf-8?B?cWhMTnJYN2hPZElJREVXbTVGSHAzL1hRY3NNNWxla3QxdzlVUy9QZHR3NEZT?=
 =?utf-8?B?NGVadXl4aUpzZWplbFUxMVZDOEhObkZsajlKV1JmdFM1OVpxOUZmSnFpM3Na?=
 =?utf-8?B?eWsyUDkvQms3V25oRW5sdjBsdGJPTU1HZ1o3REFlTmpCcTRhQ1dicmhVeDhT?=
 =?utf-8?B?YVBJSW5zZC81V0ZVZW8yL2Nya0JXV0x1OGF1b0RGVDFHRTRGRnlyUnlZRmVP?=
 =?utf-8?B?UXdNOU5CYS9wTE1vREZlM09RRWtWNlNuOGtXd0kvd1lRM3EyOHR5WDVXLzRH?=
 =?utf-8?Q?JIhiybqtZUjIB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR21MB1270.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc3ac79-77b7-4616-e07c-08d92787dc32
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 18:37:51.6566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uDC510luxQRou1XZaugSjUP0e7p7ZUwWRVxmxBYzEqn1kVqlOyvzFy7+E9jt4mx+9H1HIssdXhaKcQv/V00gsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1352
X-Mailman-Approved-At: Sat, 05 Jun 2021 06:48:03 +0000
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
Cc: "'linux-hyperv@vger.kernel.org'" <linux-hyperv@vger.kernel.org>,
 Michael Kelley <mikelley@microsoft.com>,
 "'linux-fbdev@vger.kernel.org'" <linux-fbdev@vger.kernel.org>,
 "'dri-devel@lists.freedesktop.org'" <dri-devel@lists.freedesktop.org>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBEZXh1YW4gQ3VpDQo+IFNlbnQ6IEZyaWRheSwgSnVuZSA0LCAyMDIxIDExOjE3IEFN
DQo+ID4gPj4gLi4uDQo+ID4gPiBJJ3ZlIGhlYXJkIGEgc2ltaWxhciByZXBvcnQgZnJvbSBWaW5l
ZXRoIGJ1dCB3ZSBkaWRuJ3QgZ2V0IHRvIHRoZSBib3R0b20NCj4gPiA+IG9mIHRoaXMuDQo+ID4g
SSBoYXZlIGp1c3QgdHJpZWQgcmV2ZXJ0aW5nIHRoZSBjb21taXQgbWVudGlvbmVkIGFib3ZlIGFu
ZCBpdCBzb2x2ZXMgdGhlDQo+ID4gR1VJIGZyZWV6ZQ0KPiA+IEkgd2FzIGFsc28gc2VlaW5nLiBQ
cmV2aW91c2x5LCBsb2dpbiBzY3JlZW4gd2FzIGp1c3QgZnJlZXppbmcsIGJ1dCBWTQ0KPiA+IHdh
cyBhY2Nlc3NpYmxlDQo+ID4gdGhyb3VnaCBzc2guIFdpdGggdGhlIGFib3ZlIGNvbW1pdCByZXZl
cnRlZCwgSSBjYW4gbG9naW4gdG8gR25vbWUuDQo+ID4NCj4gPiBMb29rcyBsaWtlIEkgYW0gYWxz
byBleHBlcmllbmNpbmcgdGhlIHNhbWUgYnVnIG1lbnRpb25lZCBoZXJlLg0KPiA+DQo+ID4gVGhh
bmtzLA0KPiA+IFZpbmVldGgNCj4gDQo+IEFzIE1hdHRoZXcgbWVudGlvbmVkLCB0aGlzIGlzIGEg
a25vd24gaXNzdWU6DQo+IGh0dHBzOi8vbHduLm5ldC9tbC9saW51eC1rZXJuZWwvWUxaRWh2MGNw
WnA4dVZFM0BjYXNwZXIuaW5mcmFkZWFkLm9yZy8NCj4gDQo+IE1hdHRoZXcgaGFzIHJldmVydGVk
IGNjZjk1M2Q4ZjNkNjoNCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9DQo+IDBiNzhmOGJjZjQ5NTFh
ZjMwYjBhZTgzZWE0ZmFkMjdkNjQxYWI2MTcNCj4gc28gdGhlIGxhdGVzdCBtYWlubGluZSBzaG91
bGQgd29yayBub3cuDQo+IA0KPiBUaGFua3MsDQo+IERleHVhbg0KDQpIaSBNYXR0aGV3LA0KV2l0
aCB0b2RheSdzIGxhdGVzdCBtYWlubGluZSAxNmYwNTk2ZmMxZDc4YTFmM2FlNDYyOGNmZjk2MmJi
Mjk3ZGM5MDhjLA0KdGhlIFhvcmcgd29ya3MgYWdhaW4gaW4gTGludXggVk0gb24gSHlwZXItViwg
YnV0IHdoZW4gSSByZWJvb3QgdGhlIFZNLCBJDQphbHdheXMgc2VlIGEgbG90IG9mICJCVUc6IEJh
ZCBwYWdlIHN0YXRlIGluIHByb2Nlc3MgWG9yZyAiIHdhcm5pbmdzICh0aGVyZQ0KYXJlIGFib3V0
IDYwIHN1Y2ggd2FybmluZ3MpIGJlZm9yZSB0aGUgVk0gcmVib290cy4NCg0KQlRXLCBJIGhhcHBl
biB0byBoYXZlIGFuIG9sZGVyIE1hci0yOCBtYWlubGluZSBrZXJuZWwgKDM2YTE0NjM4ZjdjMDY1
NCksDQp3aGljaCBoYXMgdGhlIHNhbWUgd2FybmluZ3MuIA0KDQpBbnkgaWRlYSB3aGljaCBjaGFu
Z2UgaW50cm9kdWNlZCB0aGUgd2FybmluZ3M/IA0KDQpbICAgODcuNDQ2MTI5XSBCVUc6IEJhZCBw
YWdlIHN0YXRlIGluIHByb2Nlc3MgWG9yZyAgcGZuOjE1MTgwNw0KWyAgIDg3LjQ0ODIzOF0gcGFn
ZTowMDAwMDAwMDRmOTgyMjcwIHJlZmNvdW50OjAgbWFwY291bnQ6MCBtYXBwaW5nOjAwMDAwMDAw
ZGNmNjgyOTAgaW5kZXg6MHgwIHBmbjoweDE1MTgwNw0KWyAgIDg3LjQ1NTUwNl0gYW9wczpmYl9k
ZWZlcnJlZF9pb19hb3BzIGlubzpmOSBkZW50cnkgbmFtZToiZmIwIg0KWyAgIDg3LjQ1NTUwNl0g
ZmxhZ3M6IDB4NTdmZmZjMDAwMDAwMDAwKG5vZGU9MXx6b25lPTJ8bGFzdGNwdXBpZD0weDFmZmZm
KQ0KWyAgIDg3LjQ1NTUwNl0gcmF3OiAwNTdmZmZjMDAwMDAwMDAwIGRlYWQwMDAwMDAwMDAxMDAg
ZGVhZDAwMDAwMDAwMDEyMiBmZmZmOWZhODExYzRhMjgwDQpbICAgODcuNDU1NTA2XSByYXc6IDAw
MDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMGZmZmZmZmZmIDAwMDAwMDAw
MDAwMDAwMDANClsgICA4Ny40NTU1MDZdIHBhZ2UgZHVtcGVkIGJlY2F1c2U6IG5vbi1OVUxMIG1h
cHBpbmcNClsgICA4Ny40ODc0OTFdIE1vZHVsZXMgbGlua2VkIGluOiAuLi4NClsgICA4Ny40OTE1
MDRdIENQVTogNiBQSUQ6IDEzODggQ29tbTogWG9yZyBUYWludGVkOiBHICAgICAgICAgICAgRSAg
ICAgNS4xMy4wLXJjNCsgIzENClsgICA4Ny41MzMyMDRdIEhhcmR3YXJlIG5hbWU6IE1pY3Jvc29m
dCBDb3Jwb3JhdGlvbiBWaXJ0dWFsIE1hY2hpbmUvVmlydHVhbCBNYWNoaW5lLCBCSU9TIDA5MDAw
OCAgMTIvMDcvMjAxOA0KWyAgIDg3LjUzMzIwNF0gQ2FsbCBUcmFjZToNClsgICA4Ny41MzMyMDRd
ICBkdW1wX3N0YWNrKzB4NjQvMHg3Yw0KWyAgIDg3LjUzMzIwNF0gIGJhZF9wYWdlLmNvbGQuMTE4
KzB4NjMvMHg5Mw0KWyAgT0sgICAgIDg3LjUzMzIwNF0gIGZyZWVfcGNwcGFnZXNfYnVsaysweDFh
Yy8weDc3MA0KMG1dIFN0b3BwZWQgQ3JlYVsgICA4Ny41MzMyMDRdICBmcmVlX3VucmVmX3BhZ2Vf
bGlzdCsweDEwMS8weDE4MA0KdGUgZmluYWwgcnVudGltZVsgICA4Ny41MzMyMDRdICByZWxlYXNl
X3BhZ2VzKzB4MTg2LzB4NGMwDQpbICAgODcuNTMzMjA0XSAgdGxiX2ZsdXNoX21tdSsweDQ0LzB4
MTIwDQogZGlyIGZvciBzaHV0ZG93WyAgIDg3LjUzMzIwNF0gIHRsYl9maW5pc2hfbW11KzB4M2Mv
MHg3MA0KbiBwaXZvdCByb290Lg0KWyAgIDg3LjUzMzIwNF0gIHVubWFwX3JlZ2lvbisweGQxLzB4
MTEwDQpbICAgODcuNTMzMjA0XSAgX19kb19tdW5tYXArMHgyYTIvMHg1MDANClsgICA4Ny41MzMy
MDRdICBfX3ZtX211bm1hcCsweDdkLzB4MTMwDQpbICAgODcuNTMzMjA0XSAgX194NjRfc3lzX211
bm1hcCsweDI3LzB4MzANClsgICA4Ny41MzMyMDRdICBkb19zeXNjYWxsXzY0KzB4M2MvMHhiMA0K
WyAgIDg3LjUzMzIwNF0gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YWUN
ClsgICA4Ny41MzMyMDRdIFJJUDogMDAzMzoweDdmMjJiNDlhNzU2Nw0KWyAgIDg3LjUzMzIwNF0g
Q29kZTogMTAgZTkgNjcgZmYgZmYgZmYgMGYgMWYgNDQgMDAgMDAgNDggOGIgMTUgMjEgLi4uDQpb
ICAgODcuNTMzMjA0XSBSU1A6IDAwMmI6MDAwMDdmZmQ1NmM0ZjJiOCBFRkxBR1M6IDAwMDAwMjA2
IE9SSUdfUkFYOiAwMDAwMDAwMDAwMDAwMDBiDQpbICAgODcuNTMzMjA0XSBSQVg6IGZmZmZmZmZm
ZmZmZmZmZGEgUkJYOiAwMDAwNTU3ZjcyOTllMjAwIFJDWDogMDAwMDdmMjJiNDlhNzU2Nw0KWyAg
IDg3LjUzMzIwNF0gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAwMDAwMDQwMDAwMCBS
REk6IDAwMDA3ZjIyYjM2NTIwMDANClsgICA4Ny41MzMyMDRdIFJCUDogMDAwMDU1N2Y3Mjk5ZWRm
MCBSMDg6IDAwMDA1NTdmNzI5YWJmYzAgUjA5OiAwMDAwMDAwMDAwMDAwMDA1DQpbICAgODcuNTMz
MjA0XSBSMTA6IDAwMDAwMDAwMDAwMDAwMzQgUjExOiAwMDAwMDAwMDAwMDAwMjA2IFIxMjogMDAw
MDU1N2Y3Mjk5ZWRmMA0KWyAgIDg3LjUzMzIwNF0gUjEzOiAwMDAwMDAwMDAwMDAwMDAwIFIxNDog
MDAwMDU1N2Y3MWNmNjk2OCBSMTU6IDAwMDA1NTdmNzFjZGJlMTANClsgICA4Ny41MzMyMDRdIERp
c2FibGluZyBsb2NrIGRlYnVnZ2luZyBkdWUgdG8ga2VybmVsIHRhaW50DQpbICAgODcuNTMzMjA0
XSBCVUc6IEJhZCBwYWdlIHN0YXRlIGluIHByb2Nlc3MgWG9yZyAgcGZuOjE1MTgwNg0KWyAgIDg3
LjUzMzIwNF0gcGFnZTowMDAwMDAwMGNmOTY0MDk4IHJlZmNvdW50OjAgbWFwY291bnQ6MCBtYXBw
aW5nOjAwMDAwMDAwZGNmNjgyOTAgaW5kZXg6MHgwIHBmbjoweDE1MTgwNg0KWyAgIDg3LjUzMzIw
NF0gYW9wczpmYl9kZWZlcnJlZF9pb19hb3BzIGlubzpmOSBkZW50cnkgbmFtZToiZmIwIg0KWyAg
IDg3LjUzMzIwNF0gZmxhZ3M6IDB4NTdmZmZjMDAwMDAwMDAwKG5vZGU9MXx6b25lPTJ8bGFzdGNw
dXBpZD0weDFmZmZmKQ0KWyAgIDg3LjUzMzIwNF0gcmF3OiAwNTdmZmZjMDAwMDAwMDAwIGRlYWQw
MDAwMDAwMDAxMDAgZGVhZDAwMDAwMDAwMDEyMiBmZmZmOWZhODExYzRhMjgwDQpbICAgODcuNTMz
MjA0XSByYXc6IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMGZmZmZm
ZmZmIDAwMDAwMDAwMDAwMDAwMDANClsgICA4Ny41MzMyMDRdIHBhZ2UgZHVtcGVkIGJlY2F1c2U6
IG5vbi1OVUxMIG1hcHBpbmcNClsgICA4Ny41MzMyMDRdIE1vZHVsZXMgbGlua2VkIGluOiAuLi4N
ClsgICA4Ny41MzMyMDRdIENQVTogNiBQSUQ6IDEzODggQ29tbTogWG9yZyBUYWludGVkOiBHICAg
IEIgICAgICAgRSAgICAgNS4xMy4wLXJjNCsgIzENClsgICA4Ny41MzMyMDRdIEhhcmR3YXJlIG5h
bWU6IE1pY3Jvc29mdCBDb3Jwb3JhdGlvbiBWaXJ0dWFsIE1hY2hpbmUvVmlydHVhbCBNYWNoaW5l
LCBCSU9TIDA5MDAwOCAgMTIvMDcvMjAxOA0KWyAgIDg3Ljc0NzUyM10gQ2FsbCBUcmFjZToNClsg
ICA4Ny43NDc1MjNdICBkdW1wX3N0YWNrKzB4NjQvMHg3Yw0KWyAgIDg3Ljc0NzUyM10gIGJhZF9w
YWdlLmNvbGQuMTE4KzB4NjMvMHg5Mw0KWyAgIDg3Ljc0NzUyM10gIGZyZWVfcGNwcGFnZXNfYnVs
aysweDFhYy8weDc3MA0KWyAgIDg3Ljc0NzUyM10gIGZyZWVfdW5yZWZfcGFnZV9saXN0KzB4MTAx
LzB4MTgwDQpbICAgODcuNzQ3NTIzXSAgcmVsZWFzZV9wYWdlcysweDE4Ni8weDRjMA0KWyAgIDg3
Ljc0NzUyM10gIHRsYl9mbHVzaF9tbXUrMHg0NC8weDEyMA0KWyAgIDg3Ljc0NzUyM10gIHRsYl9m
aW5pc2hfbW11KzB4M2MvMHg3MA0KWyAgIDg3Ljc0NzUyM10gIHVubWFwX3JlZ2lvbisweGQxLzB4
MTEwDQpbICAgODcuNzQ3NTIzXSAgX19kb19tdW5tYXArMHgyYTIvMHg1MDANClsgICA4Ny43NDc1
MjNdICBfX3ZtX211bm1hcCsweDdkLzB4MTMwDQpbICAgODcuNzQ3NTIzXSAgX194NjRfc3lzX211
bm1hcCsweDI3LzB4MzANClsgICA4Ny43NDc1MjNdICBkb19zeXNjYWxsXzY0KzB4M2MvMHhiMA0K
WyAgIDg3Ljc0NzUyM10gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YWUN
ClsgICA4Ny43NDc1MjNdIFJJUDogMDAzMzoweDdmMjJiNDlhNzU2Nw0KWyAgIDg3Ljc0NzUyM10g
Q29kZTogMTAgZTkgNjcgZmYgZmYgZmYgMGYgMWYgNDQgMDAgMDAgNDggOGIgMTUgMjEgLi4uDQpb
ICAgODcuNzQ3NTIzXSBSU1A6IDAwMmI6MDAwMDdmZmQ1NmM0ZjJiOCBFRkxBR1M6IDAwMDAwMjA2
IE9SSUdfUkFYOiAwMDAwMDAwMDAwMDAwMDBiDQpbICAgODcuNzQ3NTIzXSBSQVg6IGZmZmZmZmZm
ZmZmZmZmZGEgUkJYOiAwMDAwNTU3ZjcyOTllMjAwIFJDWDogMDAwMDdmMjJiNDlhNzU2Nw0KWyAg
IDg3Ljc0NzUyM10gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAwMDAwMDQwMDAwMCBS
REk6IDAwMDA3ZjIyYjM2NTIwMDANClsgICA4Ny43NDc1MjNdIFJCUDogMDAwMDU1N2Y3Mjk5ZWRm
MCBSMDg6IDAwMDA1NTdmNzI5YWJmYzAgUjA5OiAwMDAwMDAwMDAwMDAwMDA1DQpbICAgODcuNzQ3
NTIzXSBSMTA6IDAwMDAwMDAwMDAwMDAwMzQgUjExOiAwMDAwMDAwMDAwMDAwMjA2IFIxMjogMDAw
MDU1N2Y3Mjk5ZWRmMA0KWyAgIDg3Ljc0NzUyM10gUjEzOiAwMDAwMDAwMDAwMDAwMDAwIFIxNDog
MDAwMDU1N2Y3MWNmNjk2OCBSMTU6IDAwMDA1NTdmNzFjZGJlMTANCg==
