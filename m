Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EAB606849
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 20:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A8410ECF5;
	Thu, 20 Oct 2022 18:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-westcentralusazon11010012.outbound.protection.outlook.com
 [40.93.198.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A8310ECA6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 18:37:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a//riFiPHe3gYVSlv/XEwJonQ7hnEwhx0TG8WwOFFK9qVywQbHTcETucNJgocgJ12a7Jnd2q5KsyyROLrzKv0YDYusfl74PjOzJSlQ+yyyce/By72Z7a1S8VRblDjTimGeTU5dKZqQ1CasJwclDL9bZtV3CXZ2OLeDQWBfyAtJAKnm3XTZARZXFzO3XDSvaRWapD5TtLnuN/w3VnyjlbVRAAehD8bQTcSd0N+uR5ZEJM/6AaNt9BcmEgKy3np6GPOr7XYlXzL4yj2imcaFn/fGrGF+0yKinZ1h/itWV6I2RW5lM2U0swQf2zA4ff0Q3d8qKFrijznI4RXeiat8mjMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5M5Ay1NLSSLINuXVTHCRPGp4i4AoQtyaJ5nlZMNW6Is=;
 b=meCmzk8h8Uq3CvhXJT4ANlBM8hJhNYGpASHYXAagL0CDXE2xg550ptDOXh7YAzYwpUEpXcHEiEGjUK6pnis4XB+l5XUdm3OQi+7lcz8U0VMRpLXygPq+9qSFJeXMHjPTrf8J0gn/P1hQ7Iu2hbybpkaZ4JCy0+t2NVPbNZ+Fw9OIrWFRwIwTtQZLI5i1ijdvby6yewvVmb13ITn3CWc6oduAAf3h42O8h5W4mC4Zrk1cp3I5U751I7TLINQ3s5wmbBPwa/hZGguRCror4CdzoFk3U1byg6Y3rV5Em1jdBGCZgTvOKfbGMdZXXL3/bGis9p2Tc8HqmFSHuTAVBClO9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5M5Ay1NLSSLINuXVTHCRPGp4i4AoQtyaJ5nlZMNW6Is=;
 b=qUnVluChP3w3tgExW6R1IGssBmbAmu28ufo2k3djcXAEZUMMJhjjeiFynoEztG/l8oN4CWzlhqeLWgELHhe/nr537rF0qoocCMn9RKQBon12fpmvoH27z5F5CH45nSkoT3r89vFzLnRab0BR1PPuKXsSe11VlhH9x7mUnIZ66xA=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by BY3PR05MB8874.namprd05.prod.outlook.com (2603:10b6:a03:3b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.16; Thu, 20 Oct
 2022 18:37:30 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::d893:b27e:529:35ae]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::d893:b27e:529:35ae%7]) with mapi id 15.20.5746.017; Thu, 20 Oct 2022
 18:37:29 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH v2 13/16] drm/vmwgfx: Port the framebuffer code to drm fb
 helpers
Thread-Topic: [PATCH v2 13/16] drm/vmwgfx: Port the framebuffer code to drm fb
 helpers
Thread-Index: AQHY5DXkr8VenVr6SEyLbuY9+6oWNq4W/hwAgACffIA=
Date: Thu, 20 Oct 2022 18:37:29 +0000
Message-ID: <737c5dd5e6593e43e5b6cd1aaf4d8a939756ec7c.camel@vmware.com>
References: <20221020034131.491973-1-zack@kde.org>
 <20221020034131.491973-14-zack@kde.org>
 <dce8c2de-0e2c-0b99-e30f-29411e8d6908@suse.de>
In-Reply-To: <dce8c2de-0e2c-0b99-e30f-29411e8d6908@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR05MB3047:EE_|BY3PR05MB8874:EE_
x-ms-office365-filtering-correlation-id: e279b391-578d-49bd-9e38-08dab2ca24e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BgfBk46my8oogIHOwVnuX//eCO8u1kgLPAN1juHbprPxbgOiLumDcE3FDp7svODfiyRKQtxCxFvJ5lqQ1WmdGUGDG29qn3MVHL4ED+jbNlvR9U61BwxJrqjx4IKo019LDYNtag6Ci/YGnnB0NXuldoa4vlj+NuS6HkEeo6mIxLoV964vWYpPq+lgx4HaCkCvJGc3m0zyNuqUY+eaRvpWxH96Tg52xVHujzz+OXc5btvgfsEtWFs+2xy93kJxdtnTL8oGYDwshDu5TCKg0Eh0Zu6apcOG2DC6MV+w57ofhQY1cE8lSH53+rN+dPbWfjaEZrX4qCf4+gIliiK7+5/V2evJluCvqmvEykxappVdTfdFzhCql6D+exbLtUZElMypri2VN8eKB2qAF8g6iO60IywCaLd2tty2QiMZqb8fgli63BhYJSW32eO2uGRmPkochOUb4UZ9aeDqHWfvQhqVvs4avAj3fvPYM0y04XzsLjzkemIy6VV9lwfghSwX5yJ+KxQGI9Gdvs+YmoTqj3yXMVxqLwsPARrlkKDqit+yHE28LeaKS0tYDo2QfrbV8FZEJxoHkTMPUQ6r9CHYQpAxm63MP+rIf6uZ8lh0FCh9RCq8EJ7Zaz3sY4NhN7YRBg6dgDA7AIV+UCvnrgf5yQtU/7fd1oDKTWqQDm1xtVnmicIyoELZMazUM97T6pYFzIGS28RRZHC9CtB4qboErKShZTfBeKbRfQkgT3M3ysgZBzYbzeq+tb8+3fX8EyUeBm3jK2V2YbAuQlM3pgX+TRWeG5j28jcIMjWMsK7g3ao6wAWC7AwPVQoMQ/qyYV38cq7O
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199015)(8676002)(38100700002)(91956017)(122000001)(110136005)(76116006)(316002)(5660300002)(4001150100001)(2906002)(66446008)(66946007)(64756008)(4326008)(8936002)(41300700001)(54906003)(71200400001)(107886003)(6506007)(83380400001)(186003)(2616005)(66556008)(26005)(6512007)(6486002)(478600001)(38070700005)(86362001)(66476007)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1VTLzdPeU9rQ0xYTDg0OCtNL3pDRVF3SWVvN1ZPZ0hVcU1aanRRclVQMnhD?=
 =?utf-8?B?R2lsZVBkWnpsYVp4SGhTL3JJbHFTVTBSaWx5VkJZeW9acjNIM3Q3ZWxiYnNl?=
 =?utf-8?B?blgva1NDdWZLdmVHOUh3TEtiK3p4TzlVREp4dUdRMml5enpOK2lRcHBROHRv?=
 =?utf-8?B?ZGNLK1VzOGpLZ3NRek1KY2VVbENEV0dxbEpDL2I4dXBlMU9VanFuckg2NXhE?=
 =?utf-8?B?YlVEMVQrWFVSTWljdVdSMGo1K0gzWFpCREpTZk9iWnlpK0UyRXhRVjY4ZGlF?=
 =?utf-8?B?TmlUTFl2Y0NDTEpLaE80Y1NXMGVWRUsrNUxBdlJuWnowaXF2ekJjZHBTY1lt?=
 =?utf-8?B?VlpuRkVtQXN1Nzl2dUpCaHNzeDhoa01tczdSZWFlcWFuODdDZE9ZK01UZjI2?=
 =?utf-8?B?TmZSTFdmTi85T25ka2VoYUhkTXg4ZUpoOEphbFhSbXBiVmh2ZVpqZHV3T1Vx?=
 =?utf-8?B?d2pzZFU0UUFXcUdPSm45eFAveUFuVXVxZFJKdk1ZRkhIS1h5TmUrUHpDVmJ3?=
 =?utf-8?B?MUNyaGxzeUhOZXdscWFyQ0h5VHpqdm9QRWpqaFN0QWFKZno2MWJKSnduRm9F?=
 =?utf-8?B?Q3I0WERJZFNOZVBpWnh0Wm5tTm9aUW53N3dVY2hBSWNXQVRIMXJTUjRuOTJz?=
 =?utf-8?B?MEdTdWdCZ1ZEVzdMOHRLMHkwbGhGcHdJUmxhSU9OSll2RGh6amN2bnc5Nkk3?=
 =?utf-8?B?Y0d1a2wyTWViL04vNGJ3K0krdFhjWXluR0ZTR2p3NSsxWkNkRGI1eEpLWC9s?=
 =?utf-8?B?YnlaMkhTU1F3Qk1MZnh5dWNoRGllaC9ub1VzZlAwc2FqY2NwMzh2OWlWOUZi?=
 =?utf-8?B?N2ZVYlJIQ2xNMDdIU0F2RWFneis1dnZqRjBkZEhTTHd3eDJnaC9ieHl6eUNJ?=
 =?utf-8?B?TFdxbXE0N0NYTm9GTWo1MnVlTFowWDNCc2t3M3lWMXltUzhseW9XekZRVDg0?=
 =?utf-8?B?MTBuOVJhT0lpZGpPa1puMk15Qk9GNmRHanFTSW9kMGRtWDcwRWZzMTd0UVBI?=
 =?utf-8?B?NzQ4SGVPdW9BNUM5a2lEMDM2OGFSa0RiTXRzTE1Xb1M5bjRBZWZiY21Lc0lE?=
 =?utf-8?B?bWRFeG5kYmRwR0pVVmxTNmZ4VGFYeVExaWdLWHQ2QWo4bEljcGpSTzdFOFJM?=
 =?utf-8?B?Y3VMU1BUWE1xU3doaTVkUmtxQW1WdlY4VGJMTFdqWXhMczhQSVdDZXhwUFox?=
 =?utf-8?B?d3Zzeis4dEQxSndJZGdWaERIay9QS2N3Z2kwakdhSDNsOHh4cjFESTJUUEdJ?=
 =?utf-8?B?eFQyOFViaHltR005aTA1YjZrREJFYy82aHNZZEpiMUJ2b3g2TXgwdThOUlF5?=
 =?utf-8?B?UUl0UTVFanVNdDNuS21USUYxQzZkS000cXlqQWpGdDErZTNmVzNVRVVlelh3?=
 =?utf-8?B?MngzVlNQTGNNaEllUndOd09FSEFYOGFieG1Bd0ZaVWFseStGbTBSNkM5amFL?=
 =?utf-8?B?alhHM1RSbm04RkRvclZnRzE0SFh4dUtCUldQVW5HYUxxZVJKbUFxUDZKTHEv?=
 =?utf-8?B?b2drcit5K1g0YVp3SXBGRUlpb1JIUGpJa0RhN2F2N09ZbVh0TFdldWJ2MFYx?=
 =?utf-8?B?ckNubkRBUk5QdDNsUDlLdXZnUXpGL25TL1NOT1pzT0pIY0JGUDNBcDMvWlZ4?=
 =?utf-8?B?WGRzMG9SSHlTdjd2Y2k0K09iM0x0aE14OVdNQVZTRGF0R3BKZ09nNURvWmlC?=
 =?utf-8?B?ckNTMUxQN0FYWWw4UWU3dC81SG1qemZzMWJrNVEzVjJQV0s1YlpubHN6cEt4?=
 =?utf-8?B?ZVo0eUcxVlZOWW4zRFExdzBTc1ErSHZrU3diQkFhQ290RUgxMnNkUGpjSWU4?=
 =?utf-8?B?SE8xYnZQNmJYVE90RnUwVU9UVEt1MVlhSzl4OW84SVpWcEl4MjRPbHMrN0V4?=
 =?utf-8?B?eVd4RFF0dzk1YXdBZklIMWVtYXZIRGRWZTBpRmJFSWViOG55aGs1UWxrSGtL?=
 =?utf-8?B?ZTdHeUdVcWNRVXdCdnZWN0xjRmIxc1JyVnZqSld2bUVKekxSZ0dtVS9Ya1dH?=
 =?utf-8?B?dzJOSTFoVnYzWktndThiL1RRbDdyRm1yK2FIelNGek5nUXhseHd0Y3lSd2NJ?=
 =?utf-8?B?aFMvTWRCS04rcGl6UjYzenl3SEt0YXQ5SzRGekZ6TzRKdnRpbm1ES1NPeXlZ?=
 =?utf-8?Q?7uxtjLgBNf6eVA8V37TcTc42h?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5162194C68AD6740B28FC56089F20CD6@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e279b391-578d-49bd-9e38-08dab2ca24e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 18:37:29.8134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feYfLA9NMowcu1WWjX7OJSi2rE1rBeZaJmFOPhHEq+dumUrcLF/w/3QavdZ4cLWng5N408qQHDYmTcoODg05iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR05MB8874
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
Cc: Martin Krastev <krastevm@vmware.com>, Michael Banack <banackm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIyLTEwLTIwIGF0IDExOjA2ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gSGkgWmFjaw0KPiANCj4gQW0gMjAuMTAuMjIgdW0gMDU6NDEgc2NocmllYiBaYWNrIFJ1
c2luOg0KPiA+IEZyb206IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+DQo+IFsuLi5dDQo+
ID4gQEAgLTE2NzAsNiArMTY0MCwxMCBAQCBzdGF0aWMgaW50IHZtd19wcm9iZShzdHJ1Y3QgcGNp
X2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkNCj4gPiAgIAlpZiAo
cmV0KQ0KPiA+ICAgCQlnb3RvIG91dF91bmxvYWQ7DQo+ID4gICANCj4gPiArCXZtd19maWZvX3Jl
c291cmNlX2luYyh2bXcpOw0KPiA+ICsJdm13X3N2Z2FfZW5hYmxlKHZtdyk7DQo+ID4gKwlkcm1f
ZmJkZXZfZ2VuZXJpY19zZXR1cCgmdm13LT5kcm0sICB2bXctPmFzc3VtZV8xNmJwcCA/IDE2IDog
MzIpOw0KPiANCj4gVGhlIHByZWZlcnJlZCB3YXkgb2Ygc2V0dGluZyB0aGUgY29sb3IgZGVwdGgg
aXMgd2l0aCBzdHJ1Y3QgDQo+IGRybV9tb2RlX2NvbmZpZy5wcmVmZXJyZWRfZGVwdGguIFsxXSBO
b3RlIHRoYXQgaXQgaXMgdGhlIGNvbG9yIGRlcHRoOyANCj4gbm90IHRoZSBwaXhlbCBzaXplLiBJ
biB5b3VyIGNhc2U6DQo+IA0KPiBpZiAodm13LT5hc3N1bWVfMTZicHApDQo+IAlkZXYtPm1vZGVf
Y29uZmlnLnByZWZlcnJlZF9kZXB0aCA9IDE2Ow0KPiBlbHNlDQo+IAlkZXYtPm1vZGVfY29uZmln
LnByZWZlcnJlZF9kZXB0aCA9IDI0Ow0KPiANCj4gSXQncyBhbHNvIGEgaGludCB0byB1c2Vyc3Bh
Y2UuIFsyXQ0KPiANCj4gVGhlIHByZWZlcl9icHAgcGFyYW1ldGVyIG9mIGRybV9mYmRldl9nZW5l
cmljX3NldHVwKCkgc2hvdWxkIGJlIDAuIEl0IGlzIA0KPiBhIGZhbGxiYWNrIHRvIGZvcmNlIGEg
Y2VydGFpbiBwaXhlbCBzaXplLCBhcyBwcmVmZXJyZWRfZGVwdGggZmFpbHMuDQo+IA0KDQpBaCwg
dGhhdCBtYWtlcyBzZW5zZS4gSSdsbCBmaXggdGhhdCwgYnR3LCB0aGUgZGV2LT5tb2RlX2NvbmZp
Zy5wcmVmZXJyZWRfZGVwdGggPSAyNA0KcGFydCwgd2Ugc2hvdWxkIHByb2JhYmx5IGhhdmUgc29t
ZSBjaGVjayBpbiBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cCB0aGF0IGl0IGlzIG5vdA0KMjQuwqAN
Cg0KVGhhdCdzIGJlY2F1c2UgMjQgd2lsbCBpbnZva2UgdGhlIGJ1Z2d5IGNvZGUgaW4gZHJtIGZi
ZGV2IGhlbHBlcnMgdGhhdCBjb25mdXNlcw0KZGVwdGggYW5kIGJwcCBhbmQgd2lsbCBlbmR1cCBp
bnZva2luZyBkdW1iIGNyZWF0ZSB3aXRoIGFyZ3MtPmJwcCA9PSAyNCBhbmQgdGhhdCdzDQpzcGVj
aWZpY2FsbHkgZGlzYWxsb3dlZCBmb3IgZHVtYl9jcmVhdGUuIElHVCdzIGhhcyBleHBsaWNpdA0K
KGR1bWJfYnVmZmVyOjppbnZhbGlkX2JwcCkgdGVzdCB0aGF0IGNoZWNrcyB3aGV0aGVyIGR1bWJf
Y3JlYXRlIHdpdGggYnBwID09IDI0DQpmYWlscy4gQW4gZWFybGllciBjb21taXQgaW4gdGhpcyBz
ZXJpZXMgYWN0dWFsbHkgZml4ZXMgdGhhdCBzcGVjaWZpYyB0ZXN0IGluIHZtd2dmeC4NCkEgbG90
IG9mIGRyaXZlcnMgd2lsbCB3b3JrIGJlY2F1c2UgZXZlbiB0aG91Z2ggdGhleSBzZXQgcHJlZmVy
cmVkX2RlcHRoIHRvIDI0LCB0aGV5DQpjYWxsIHRoZSAgZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJy
ZWRfZGVwdGggPSAyNCBjYWxsIGRybV9mYmRldl9nZW5lcmljX3NldHVwIHdpdGggMzINCmJ1dCBp
dCdzIGRlZmluaXRlbHkgY29uZnVzaW5nLg0KDQo+IA0KPiA+ICsNCj4gPiAgIAl2bXdfZGVidWdm
c19nZW1faW5pdCh2bXcpOw0KPiA+ICAgCXZtd19kZWJ1Z2ZzX3Jlc291cmNlX21hbmFnZXJzX2lu
aXQodm13KTsNCj4gPiAgIA0KPiBbLi4uXQ0KPiA+IC0NCj4gPiAtLyoqDQo+ID4gLSAqIHZtd19m
Yl9kaXJ0eV9mbHVzaCAtIGZsdXNoIGRpcnR5IHJlZ2lvbnMgdG8gdGhlIGttcyBmcmFtZWJ1ZmZl
cg0KPiA+IC0gKg0KPiA+IC0gKiBAd29yazogVGhlIHN0cnVjdCB3b3JrX3N0cnVjdCBhc3NvY2lh
dGVkIHdpdGggdGhpcyB0YXNrLg0KPiA+IC0gKg0KPiA+IC0gKiBUaGlzIGZ1bmN0aW9uIGZsdXNo
ZXMgdGhlIGRpcnR5IHJlZ2lvbnMgb2YgdGhlIHZtYWxsb2MgZnJhbWVidWZmZXIgdG8gdGhlDQo+
ID4gLSAqIGttcyBmcmFtZWJ1ZmZlciwgYW5kIGlmIHRoZSBrbXMgZnJhbWVidWZmZXIgaXMgdmlz
aWJsZSwgYWxzbyB1cGRhdGVkIHRoZQ0KPiA+IC0gKiBjb3JyZXNwb25kaW5nIGRpc3BsYXlzLiBO
b3RlIHRoYXQgdGhpcyBmdW5jdGlvbiBydW5zIGV2ZW4gaWYgdGhlIGttcw0KPiA+IC0gKiBmcmFt
ZWJ1ZmZlciBpcyBub3QgYm91bmQgdG8gYSBjcnRjIGFuZCB0aHVzIG5vdCB2aXNpYmxlLCBidXQg
aXQncyB0dXJuZWQNCj4gPiAtICogb2ZmIGR1cmluZyBoaWJlcm5hdGlvbiB1c2luZyB0aGUgcGFy
LT5kaXJ0eS5hY3RpdmUgYm9vbC4NCj4gPiAtICovDQo+ID4gLXN0YXRpYyB2b2lkIHZtd19mYl9k
aXJ0eV9mbHVzaChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+IA0KPiBUaGlzIGlzIHRoZSBm
bHVzaCBmdW5jdGlvbiBmb3Igdm13Z2Z4JyBkZWZlcnJlZCBJL08uIElmIHlvdSB3YW50IHRvIA0K
PiBpbXBsZW1lbnQgZGVmZXJyZWQgSS9PIHdpdGggdGhlIGdlbmVyaWMgZmJkZXYgZW11bGF0aW9u
LCB5b3UgaGF2ZSB0byBzZXQgDQo+IHN0cnVjdCBkcm1fbW9kZV9jb25maWcucHJlZmVyX3NoYWRv
d19mYmRldiB0byB0cnVlLiBbM10NCg0KWWVhLCB3ZSBkb24ndCBuZWVkIGl0IGFueW1vcmUuIEJ1
dCBpdCBwcm9iYWJseSBpcyBhIGdvb2QgaWRlYSB0byBwcmVzZXJ2ZSB0aGUgb2xkDQpiZWhhdmlv
dXIgZm9yIHN5c3RlbXMgdGhhdCBkaWRuJ3QgaGF2ZSBndWVzdCBiYWNrZWQgbWVtb3J5IHN1cHBv
cnQuIEknbGwgYWRqdXN0DQp0aGF0LiBUaGFua3MgZm9yIHRha2luZyBhIGxvb2sgYXQgdGhpcyEN
Cg0Keg0K
