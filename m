Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5C5343452
	for <lists+dri-devel@lfdr.de>; Sun, 21 Mar 2021 20:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3786E2B6;
	Sun, 21 Mar 2021 19:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690064.outbound.protection.outlook.com [40.107.69.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572C16E2B6
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 19:16:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=comCdDjOLRk3E4jVUYAmiNd0MoVvIJ2P6wJbGjSRKgwMfOyNfKu3DIeJyDAkw2PkGwacf3mEA3GRrNoVPh3ru6le/Fbi84jN1ZaxGsG7plrkYZhsTKnuTK5LcOyjA8v6EcJICt8iIEIMbnpb+4fMghyJ16CsS7kYHNEwKhvqvXUHVFQi0EmmErRMtAmLoLyMydEQDMXo3cm/q0fItuPIxqDn10isu+Gh1q2XIO6Xi1JacDqpHaoGkko0noqD1RWM8WekREPYAurxjpieHEkHPWr1gkph3lFXTwkLudx3eM4JYnkSguCL7cz8GOf9bFAVtc+ANI43vOf4qgpJpjLxaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjM8O2lWFUtZPbVWt02xBFj86Y5y7FwGgQEIKJp95Zk=;
 b=ZO6v8mh9B6bitGAvUWU9eshlSdJ6csr5OGyPCKkSsCBKY+QO3earP/P2l1g2oEbjVOxRiEDLbGqNlUFkDVzH7l5oncRUVsWr8nFcx1wZWoNRx1+Stj1fPK0JdASpnNWxKWK6EjvzgCZ9l/bfKQuoislcv0N06aTMY8RwIAy8EmEU6ETI7gvbASAf437NbfqdszEs0DF46NuXIkNCNT+KbOaJaLnd+6QR0D6ewbfFCZqPzJ9FYtxchXfk0uGZhvAZNW+HAF3yHg0o3abTIxYoE9JLPlXmZNGJFbZGs7snFlHqpobLKTRG9roH8I3QXD6I2eqQDMNZEGpHUWeJo9EoAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjM8O2lWFUtZPbVWt02xBFj86Y5y7FwGgQEIKJp95Zk=;
 b=zLJGdhuZ5lzAR2xlwA751Y7h9eZwIueeVGr5VqWpVSaGbMCQsII/lPLww3po2KX27u2QyUbK258G5BrhTf6Viju8syyjmANH+5Lzy0pGf59LlRC4LPZcaU0mKtHwhZdswMilN7745vC38+KzU5OyEG1q/rngAuXB33cqEyo3ZvU=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6125.namprd05.prod.outlook.com (2603:10b6:208:ca::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.14; Sun, 21 Mar
 2021 19:16:43 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::88de:ad34:82d7:a02e]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::88de:ad34:82d7:a02e%6]) with mapi id 15.20.3977.019; Sun, 21 Mar 2021
 19:16:43 +0000
From: Zack Rusin <zackr@vmware.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: Re: [PATCH] drm/vmwgfx: fix spinlock initialization in
 vmw_driver_load()
Thread-Topic: [PATCH] drm/vmwgfx: fix spinlock initialization in
 vmw_driver_load()
Thread-Index: AQHXHhcUZDWNar+TT0Kv8wjit7U0+qqO0UGA
Date: Sun, 21 Mar 2021 19:16:43 +0000
Message-ID: <9D182DCF-22A0-47B5-BCC7-ED59BD411B54@vmware.com>
References: <20210321145649.2948-1-penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20210321145649.2948-1-penguin-kernel@I-love.SAKURA.ne.jp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
authentication-results: I-love.SAKURA.ne.jp; dkim=none (message not signed)
 header.d=none;I-love.SAKURA.ne.jp; dmarc=none action=none
 header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7169f149-f6e5-4c88-39cc-08d8ec9ddce2
x-ms-traffictypediagnostic: MN2PR05MB6125:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB6125FA6FDB90B431174FA974CE669@MN2PR05MB6125.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j/m9fE4+A9gLJGGn1neT0dWL0Jba/PkKD5EFCuCiAUgvNFX//ZJ/l+cnyKrgdnE84EPupQWXLMfse4nJK1pva9CZbSG5dCYuAwh0hibCljZOvDDdnMSWdIG+G0OonIPHlJhvSgVXsk25CGiRGMcoCGmTnu4c8jOhcnthQvI2EYpgjH5BDQJVwxjjV5BIuAWaijjX8wzVPF0EujGAnLN5Z82rPbKpJ6AgrcYcIGzTZ6ZgY/nqCnapDvn3h+AiWkWtjOZ2i0Kn6obQqgVsC77S8Ef75AzFvRbD1vM9KPlFam3CvwyM1CLhv5eovpSnhNX69xWTmMjNXGQgeih9KR8e4Tf9LxX/lyyhISMZJAq8tDrKPvhdEBlP2y2ZpAtBiXAvXEUja0RpTGxGIylYMCNxBXgILORRQ9l/EPsVlyABoRSs7cER1C4QZllnV4wcjiFhxnI6bhaIBpMkfighoGXKXHbh57nLPZedrNiSr7Zex01i2KVa3SFGYvFfzKLvQI90gRwAe2RxplvrKlrII6lckSWO7fIKKi0AqmD4TKLFAO5a+nplHs+5Rqn1t8zpUXBRalwUjc98z6tMfIDuEbxZu4p3oURDLuknI67d0M3uvz0rJiluFt4/lr+JFxtmpfLaI/IEgmaYWP7QixrXAXgB9IhKeYgwIknafJwSk7xRSBrdavnNWuefYB+no5fVaIw9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(6486002)(83380400001)(4326008)(6916009)(91956017)(38100700001)(5660300002)(76116006)(66446008)(2616005)(66946007)(66476007)(8676002)(66556008)(64756008)(186003)(316002)(2906002)(53546011)(54906003)(4744005)(36756003)(26005)(86362001)(6506007)(33656002)(8936002)(478600001)(6512007)(71200400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZDZYQmNBVTJQaS9TdWRZL2J1Z2ZQTlRtQU5HTWxVajlSazVEVWdHTk50UWJk?=
 =?utf-8?B?UnlCY2ZjdmJhZVhYOE9oUUVTcS9sR1NaR0hoNFZBMUJVSUlIRGhrSkZxQlVD?=
 =?utf-8?B?T05rVmxmZk1DdzYxZ0lZaHppSmcreW1SZHgwdkI1NDRTWDhEWFlJTHZ5d2ll?=
 =?utf-8?B?ZGJod3F5dUVmM3VmRVJ1Zi9STWxxaSs3RUhlZlFUVUdwcXhsQ3NLcUFWYTcw?=
 =?utf-8?B?Z1FycUc5OGNLS0F2R0tOVXB3V0YzMzIyMlEwRk5wYVdQS1dOYjdrT0pWSi9K?=
 =?utf-8?B?OVkzb3hVa0dqbGpyUzJRSTY0TzFKWDlIMFBaT1FvWGZDZG5qVytkWXhRMmhQ?=
 =?utf-8?B?OHROcGdyWm4yc01GTHNUdkFlZFFIeXl6ejlvQmR0bmw0NVVyN0JrZVZtUDB2?=
 =?utf-8?B?Qnh1QVhldFY0MjN4clIwdCtBd1AvRHZzdmJ2a2hMVEVQclI0dXZxTEpoV1V1?=
 =?utf-8?B?MXhpUktkUFlHT0o4TXBsOVV0d2xtc2pydFBiaDlwbGt3UWFuTVFUYitjRHhr?=
 =?utf-8?B?bHcwOXVHVk5jRmhuVStsSWs3ZE9wenpQaDZJNWVSTmFINUJWNzNFUVdPUkdl?=
 =?utf-8?B?V1hrWmRXS2VyTEZpYWR3OEI4azNDVWJUQkFTWEJ3dzd5WE1COTI2VGRSeGx1?=
 =?utf-8?B?RXpqRWJsaUNWQ1NIKzh6dGJqL0NQVzFCYkpYeXRRUVVDZUV6MnViYkxwaVUr?=
 =?utf-8?B?dVJhbmFQT3ptNkRBVHdHVVpNYVk3NG9BKzNabFdBcURnLzM3U0FlaklnN3g3?=
 =?utf-8?B?KzczZEdDdXBCaU1USFFaNnMyK1lHN1h4Nk52YlRIcUE2YTdSNlF0NUlpY0tv?=
 =?utf-8?B?akNKZFNld01tNkppQTh1NDZxWGhjVERIbElpTnQzUkxFQXJOSGJyalFTbHRv?=
 =?utf-8?B?TzdSdk5EWE16MGUyeXhuZm5yYm1kdERyRjdGbzhJclpYdjN1YlQ0UkUzQllV?=
 =?utf-8?B?ZWMzVVgyM1h5QTk1WFZ4eEoyZ3ZGWGxpcEJwMFBWMEx5elhDRTRhK1Z0MHRT?=
 =?utf-8?B?ejdUckE5Y1VMbVJIU3FVZXl3djFEMGZqQzEwNVZBdEZJajluMDVFZkVNZVlu?=
 =?utf-8?B?V0l2cFN1VDd2TzZrcERvRXRQZDFXaXBxMEZkb213YmZud1QxMjJiUk50a01C?=
 =?utf-8?B?aTM5VGtVWFIvL3FSRGlaelV1aG94Q2hqakZLU1Q3ZzZYb2dNU0pSYUpsNkxo?=
 =?utf-8?B?L0hxTFFDemR1Z0VKU3hhemJBdVI4T0U2Tm8xbVRJNTN5TGVQYW5yRGZWSEtO?=
 =?utf-8?B?VEQxaUc3eXZrbXRUK2lUcTR6dU1OM3ZNSTJVWmN4aCtaWFhRRVhaMXhPNjZ0?=
 =?utf-8?B?U1BrNzlRSm1WUmZlMWNqaXZkbWcxRElBQy9MZGNZSWdxWXNSTlduODhmanlD?=
 =?utf-8?B?MzBRYTNtcjlkNkpuaGtnK3ppbXVGaDJtWjEyRjYzRVlzcSsvUnAzam1LU2Z6?=
 =?utf-8?B?R1pRZHlFZVUxeWxNMzFDdjlYUmlTVzQ2WnJoUTJhMW5mUVZPYWpURTB3V3RF?=
 =?utf-8?B?Vys0dmtFU0lsQU5PTXd1WXhBQW5PazNZRDRPRndOWjlCb2Uyb0VleU40R3dQ?=
 =?utf-8?B?TnU3SmdlTnhqS0VtMko0eHJjNUFDdmRULzNGTFR0d0VJUncwK1lWNE53alJB?=
 =?utf-8?B?SVlqZFZkQk9BeFpqTHoxdFZGNzhORWR1UlpNcXhYNjBjbk9RSHlXa0hXMWtv?=
 =?utf-8?B?ekhhdExibDhMYVVaZ0Z4UmtmMjBQNEJHWWVIeWI5Q0lkY1FRL09zYlBvQVlE?=
 =?utf-8?Q?DaE9rHudpk0HK+wNj8q4y+VbWtGeM6BVVhpEi9L?=
Content-ID: <8F92CEE87B29B24599E34DA81E481498@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7169f149-f6e5-4c88-39cc-08d8ec9ddce2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2021 19:16:43.1609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rkAJR8NqKxiwzIqjJ1j1oPw4ccUbXsBEMyveSjldoSOmzQ08u4ZSn3LZBqljQ/kqSAJPc4F7cPzaXl6ElcjHhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6125
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gTWFyIDIxLCAyMDIxLCBhdCAxMDo1NiwgVGV0c3VvIEhhbmRhIDxwZW5ndWluLWtl
cm5lbEBJLWxvdmUuU0FLVVJBLm5lLmpwPiB3cm90ZToNCj4gDQo+IFNpbmNlIHZtd193cml0ZSgp
IGZyb20gdm13X2RldGVjdF92ZXJzaW9uKCkgZnJvbSB2bXdfZHJpdmVyX2xvYWQoKSBjYWxscw0K
PiBzcGluX2xvY2soJmRldl9wcml2LT5od19sb2NrKSwgc3Bpbl9sb2NrX2luaXQoJmRldl9wcml2
LT5od19sb2NrKSBoYXMgdG8NCj4gYmUgY2FsbGVkIGJlZm9yZSB2bXdfZGV0ZWN0X3ZlcnNpb24o
KSBpcyBjYWxsZWQsIG9yIGxvY2tkZXAgZ2V0cyBkaXNhYmxlZC4NCj4gDQo+ICBJTkZPOiB0cnlp
bmcgdG8gcmVnaXN0ZXIgbm9uLXN0YXRpYyBrZXkuDQo+ICB0aGUgY29kZSBpcyBmaW5lIGJ1dCBu
ZWVkcyBsb2NrZGVwIGFubm90YXRpb24uDQo+ICB0dXJuaW5nIG9mZiB0aGUgbG9ja2luZyBjb3Jy
ZWN0bmVzcyB2YWxpZGF0b3IuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUZXRzdW8gSGFuZGEgPHBl
bmd1aW4ta2VybmVsQEktbG92ZS5TQUtVUkEubmUuanA+DQo+IEZpeGVzOiA4NzcyYzBiYjU4YmJm
OThhICgiZHJtL3Ztd2dmeDogQ2xlYW51cCBwY2kgcmVzb3VyY2UgYWxsb2NhdGlvbiIpDQoNClRo
YW5rIHlvdS4gSSBoYXZlIGEgYml0IGRpZmZlcmVudCB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggaW4g
bXkgdHJlZSwgSSBmaXhlZCBpdCBhZnRlciBUaG9tYXMgbm90aWNlZCBpdCBsYXN0IHdlZWsgYnV0
IEkgd2FzIHdhaXRpbmcgZm9yIHRoZSBwaW4vcmVzZXJ2ZSBkaXNjdXNzaW9uIG9uIHRoZSBsaXN0
IHRvIGZpbmlzaCBiZWZvcmUgcHVzaGluZyBpdC4gSSBhcG9sb2dpemUgaXQgdG9vayB0aGlzIGxv
bmcgdG8gZ2V0IGl0IHVwc3RyZWFtZWQsIEnigJlsbCBnZXQgdG8gaXQgdG9tb3Jyb3cuIEnigJls
bCBtYWtlIHN1cmUgdG8gQ0MgeW91IG9uIHRoYXQgc2VyaWVzLg0KDQp6DQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
