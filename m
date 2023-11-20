Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B327F0A9C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 03:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EBD10E208;
	Mon, 20 Nov 2023 02:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR02CU002.outbound.protection.outlook.com
 (mail-westus2azon11010002.outbound.protection.outlook.com [52.101.46.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6508810E208
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 02:49:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnQJQJjbX9aDZPrWNJpYEi77nNSzn21pb7jm0C+TabVVPnxxnxPdc2NpFWOPUtgkJ6loSCzFKIRSLjV8vzUrnFiwQrRAqLlOsipKdnkryT75NEU5UXFZXPeObMncJTo6gqXuuPtrKHTixkc9F0xnPqfyKifrh7JdBTBdALNmw1zlH0SeiENL1JNZT+KG7Zg2P3/znquAOMYS2vjzosw4eipkhL9bET1MJ501msXEPW7eTkSrSeWN2G2wHnnMajIHe5VvSfsgVtOAO1mJxD9S3fwYp7Pkq4WuoasGRAcZIYGpjCLgkWINJzg0Wdu5am2E6MOH0DKFTty48O/LmAnfug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wjFoJgfUxRI5csw/FH5HmU3FSBNadWs2HYeQph58Eg=;
 b=TEm7DuiXdQNswJm75AZStffmBaN6iIrPIewh11IYua9EPkKMEIimgFWu3qa5PUVi97PuZkb06KoyxlGPvdAmTAcoGIdDPsKtHlDjzbJ0C1brBZC9VxxXM1rc66NB9kC/w1GKhW6JEJPcUgFD3uawVRZJxMYcGmbuA3eAOUqNcdPUa8neRGB5m7UedtwIw7Zu4nPV66bbjxqSQ82m3fKrT5vA9hvIde8gXLH2ERHE15cfD67pvoncfC/Xllh1eJ3VODa91aqv+cBJELmYNvjMt8RgeJMchei2Qt5pPJspzyJvuQP5DyulLbeyk13hceVUHgCe/Wbv2SeDNhiJ9UoOGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wjFoJgfUxRI5csw/FH5HmU3FSBNadWs2HYeQph58Eg=;
 b=LYfwyt7xncdXJO/Q61cZCKDFd4eueMacG7YratLPC5DP0Ch7eYQhiruXWotEZnkxdAGiqW4OC/5RUAqPCsMtzoEdlNJVtzXlT1uPU4eB2P+6KSXBkWyf9J3knSQC2mcJVWIRtmDn/N8MwbM2eee+rW6AsX6miivPoWRRCRGXu44=
Received: from IA0PR05MB9832.namprd05.prod.outlook.com (2603:10b6:208:404::6)
 by SJ0PR05MB7471.namprd05.prod.outlook.com (2603:10b6:a03:282::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 02:49:19 +0000
Received: from IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::7e24:8821:d736:fbb5]) by IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::7e24:8821:d736:fbb5%5]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 02:49:19 +0000
From: Zack Rusin <zackr@vmware.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "javierm@redhat.com" <javierm@redhat.com>
Subject: Re: [PATCH v3 0/5] drm: Allow the damage helpers to handle buffer
 damage
Thread-Topic: [PATCH v3 0/5] drm: Allow the damage helpers to handle buffer
 damage
Thread-Index: AQHaGtcr0MrbJic62k+7yYZdqWm+tbCCgqEA
Date: Mon, 20 Nov 2023 02:49:18 +0000
Message-ID: <477e78dc2fe31372d3b4e270b4ef82d9bae22705.camel@vmware.com>
References: <20231119105709.3143489-1-javierm@redhat.com>
In-Reply-To: <20231119105709.3143489-1-javierm@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR05MB9832:EE_|SJ0PR05MB7471:EE_
x-ms-office365-filtering-correlation-id: 1939a44a-e70b-4b92-ef47-08dbe9734adc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZTe1uMDJ8BhxjYt1hUqpt+Hwap4lLWFoTiCbivkdCGSxKx0J0BL2ghbwt7iG3UuWgZSi1UldjCPl6KHzwL+e5wkqnfqSjCV5zfCxqaKSe00sAPNzWX4LeHjow5dN1N9yMGvOtkbThKv36Hg3KICNkRgmiDyX0j4PqferMTv1K+N8PZSju+n9Ne0xmrUDGKKuxTWkG4k9jniU/nHc19FI4mluD2KUfKNP1Krk+Iy5sIET4antnNKacRi/oks6bwdTr92zyLXoDNkT/6bBjB4WfD4TVFxEgCx8G2xxqfTxV/Fx0iXhOFEcp8nS+wi+XB77Y/PIMZQ0NpcEA4E6Ok+VzJKdc5QY2H4/r1zP1z1phxIXWcGV+WUr58WKU2e5DbS92jOBQN/UctndAc0ywriuWiaD4/JKWSoiJy2rGFau1KeKuJxYTbGUupYNQ/8MJvDvjbeeuYHj43ZcbRVPb/RivXq2iyqsbuSvX7y7AdJyRzdGyJ484utXdugSf2p2zYFshCvHUlG6bn7MHDdOCyzJyh/xktxHW5E9cPh9OPasIWgQ7jIDJypzicZfD2eenkNwRLAHZiq/np0r+UYsq7xrhifj+hVoTg1Dyw/wm5xeSX3sYdLWeQdJ+c2PEfIDPpcgWkBJZTp/yvJqTs5w/a+uP31SPdK5fq2Rw+vNg8+LjFRnJzAsVvNWMbLsW0fjIZgZJqMALDqWM+cfZJ9wWepdVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR05MB9832.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(346002)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(2906002)(4001150100001)(8676002)(4326008)(8936002)(316002)(5660300002)(7416002)(86362001)(38070700009)(36756003)(2616005)(83380400001)(122000001)(26005)(71200400001)(45080400002)(6512007)(6506007)(38100700002)(478600001)(6486002)(966005)(66476007)(110136005)(66556008)(66946007)(76116006)(66446008)(54906003)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ym50eEVOeVB2NVBDdFhndE5yR1NxWFhLc2NEQkxzNk91MDEzUU9YK3JGTjAr?=
 =?utf-8?B?a1o1d3MvUVRwQXRqTXRsN2JpUkJZYWpnMDdsaXM1Ylg1T1lLTU5PWDM5am8x?=
 =?utf-8?B?dG5SUTVDUlZuYlhFODRrMnd4VFNhbFo1RjVvZnkyZkIrYjFQMUhacGtoWklJ?=
 =?utf-8?B?QzByd3ZnaC9RamNTYy83dDZRQVppMXU1Z1dYU1Y5bjRQSjBpaG1idUhvZGZD?=
 =?utf-8?B?Uk9Fam1NNFFON0w2dlpRdDZkQ21FVTlYQ2J0eXd2OHR1SHp3V3F0anlGT3pD?=
 =?utf-8?B?VkUzL0QyRldtZWtNMnB0azVuSUdETHJXdlp5T0Y2T0FFQ3RFaU9rR1FVYmFL?=
 =?utf-8?B?OXZ6M0d0RTh6Yit6UU9ROG5EOWcxSE0zYVR5dCtDSTlDWEtuMlRLNjcyWUI5?=
 =?utf-8?B?VTJtaFlSRUlYdWVYTDYwb0ZTcmhrNnEvYmYwdXJ6Z1I2bWpVOVJLelRvU0t1?=
 =?utf-8?B?Q1gwcTJzZmJ2bVJpRkwrVm1oYyt0TklQV1c5SmI0dEQvdFNQQnk0MU9uSlc1?=
 =?utf-8?B?VFR0OWowZGxXY0lCQjROSlFDSGFQSW1vSVdaTmxhYi9VTk0wUWtoa2t3N2Vq?=
 =?utf-8?B?Y0FPNDMrNWp3RTJnZC9tQ2tFY3ZKU3VlRE0xek0wZUtNQzg5MTBsVTZlUGtj?=
 =?utf-8?B?S1NQcWc1czI5UXZhVU90djZ3WHF5czFGQWliTWVXV3ZmTGFVQXlReEhwNzJW?=
 =?utf-8?B?UkhtOGQ1MTRZVjd1d3B3ZHRMK3IxN1NiSXE2Z2NaUlhZUC9IRExsaEVNTkpn?=
 =?utf-8?B?K0IzNy8xVEYvUloxNkZ2ZUUrbk5LeFA5bHg2R2hheVFjQjlucXNvdy83Ylc0?=
 =?utf-8?B?Tmw0NnRJYzNVK1M0bUpuRGVheUFrSURRKzNXSU5LYUF5R2JDRk9pbzAyVWFa?=
 =?utf-8?B?NUFuMVcwNElwMDdkU1FoQmVacEFzQlAwRGRCci9yRWFHQzIyOEljK3hoYjBl?=
 =?utf-8?B?TmZYZ0ZVRG9pdE9oaGtEeXdkYm1yaUdxajhkdlp6NDdFQnpwbFVlcXF4c3FF?=
 =?utf-8?B?bWF5a1J0dGN2VFMyUk82WDNZckNaNk5hRVNnVzRHRlAySGpOR2JUNTZJL3Qw?=
 =?utf-8?B?QjliRTlXeEhUNkR0SUdrSW10WHp4MXVLTmRyeEVyQnI0N3cvcHBCWTNQNkdR?=
 =?utf-8?B?TzRaSHNmTG96TXNTWjJFYUNTbG9sbEFMazd2S2t1dTdaamhEeWhZczY3UTVF?=
 =?utf-8?B?ajVMWXJZZmp3RXJZcFNsanVQS2hwWS9kOXFLa29MRm9UOE9iT0NLWmJjNVpQ?=
 =?utf-8?B?ODIzeXB5RERJQkRJbTB6aHdtRXVrUG53OE5KM00xM3JDeXJXWUQxOSswYUdN?=
 =?utf-8?B?ejdHUFR0N2plMDJDS1lHdWZwSTFqTE4wRUpKM1RlQjZMUm1WdnVYQllkbG1i?=
 =?utf-8?B?RmZnbDRrRjZ1RTRCcmcvd3JqYnJOY2dQWS8yTmJPTlo2STE4aVRGWGxQbnlo?=
 =?utf-8?B?NlBmeFowQWJybFJ5QXlxL1A2eU9Ib2M5VVVkbVcwLytYdnA2cDgzZTk3TXEr?=
 =?utf-8?B?WXljZVdrM2VXMXB6dXhucEZ3S1FORW1TV1U3K2NzNnpKZVlqSHhpOE95c1ZJ?=
 =?utf-8?B?V09PbHZpRTBTUnNheGh2elAwVmFWeWd0L2ZnbHdFZHI3STgvRWliVkFJbVZy?=
 =?utf-8?B?ZUZobi85c1Fock1XeXUyNjVqTEJQSjFmNmZwYXc3ZVJXdGhmYXhuUFJTekpX?=
 =?utf-8?B?NEVjQ1BCUjV0UHV4cDkxTThiNG5MMGlUY3RUckphOW15bW03eTBsWXdLZzZq?=
 =?utf-8?B?VWhjMVoxdXBzZ3ZBekRJOTNNbHNNanNqZzdtNTE0S0xGUDBjYkgvWjc0ZVd3?=
 =?utf-8?B?MnYrNzd3QlZPdVVRSllkZzB3bUxRQUplN3YrYy83cGxHY2htWEo5Q1NxSXlS?=
 =?utf-8?B?ZVJkS0UySTNhWVFyWlB2T0FvcmFrSzdGY3lsWG5Wa1ROdFgvUGlkQmFQR3Bv?=
 =?utf-8?B?MFpXN200OVNWNXU1MnYrWXhySURURXVyVGFlRUdFbkJxdVprbGJrbmJPcWtK?=
 =?utf-8?B?bXYrbXNTNjlZaCtsNmJWejVZUy9sWWpNK1QwN0lvQ0wvSFlObGdDVDQ5RUNZ?=
 =?utf-8?B?T3NEOGxqVVUzL2t3clR4c0hGWjdMemJERWZZaDBRZkRNZFdlM01ackRDaUl1?=
 =?utf-8?Q?DjgWWboaHzkMaQ74DYxwwouzV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <98F88E65C15AC54EBC8D38C450D18212@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR05MB9832.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1939a44a-e70b-4b92-ef47-08dbe9734adc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 02:49:18.9489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vdqIHWaIKshCVSxV2Vc1OLIy5c4d/PHqq83gzZPCphrKMBz1xXmooWzdIBrm5qkf+T80gS4m/mp78mz+fb4Prg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB7471
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
Cc: "kraxel@redhat.com" <kraxel@redhat.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "belmouss@redhat.com" <belmouss@redhat.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "nunes.erico@gmail.com" <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyMDIzLTExLTE5IGF0IDExOjU2ICswMTAwLCBKYXZpZXIgTWFydGluZXogQ2FuaWxs
YXMgd3JvdGU6DQo+IEhlbGxvLA0KPg0KPiBUaGlzIHNlcmllcyBpcyB0byBmaXggYW4gaXNzdWUg
dGhhdCBzdXJmYWNlZCBhZnRlciBkYW1hZ2UgY2xpcHBpbmcgd2FzDQo+IGVuYWJsZWQgZm9yIHRo
ZSB2aXJ0aW8tZ3B1IGJ5IGNvbW1pdCAwMWYwNTk0MGE5YTcgKCJkcm0vdmlydGlvOiBFbmFibGUN
Cj4gZmIgZGFtYWdlIGNsaXBzIHByb3BlcnR5IGZvciB0aGUgcHJpbWFyeSBwbGFuZSIpLg0KPg0K
PiBBZnRlciB0aGF0IGNoYW5nZSwgZmxpY2tlcmluZyBhcnRpZmFjdHMgd2FzIHJlcG9ydGVkIHRv
IGJlIHByZXNlbnQgd2l0aA0KPiBib3RoIHdlc3RvbiBhbmQgd2xyb290cyB3YXlsYW5kIGNvbXBv
c2l0b3JzIHdoZW4gcnVubmluZyBpbiBhIHZpcnR1YWwNCj4gbWFjaGluZS4gVGhlIGNhdXNlIHdh
cyBpZGVudGlmaWVkIGJ5IFNpbWEgVmV0dGVyLCB3aG8gcG9pbnRlZCBvdXQgdGhhdA0KPiB2aXJ0
aW8tZ3B1IGRvZXMgcGVyLWJ1ZmZlciB1cGxvYWRzIGFuZCBmb3IgdGhpcyByZWFzb24gaXQgbmVl
ZHMgdG8gZG8NCj4gYSBidWZmZXIgZGFtYWdlIGhhbmRsaW5nLCBpbnN0ZWFkIG9mIGZyYW1lIGRh
bWFnZSBoYW5kbGluZy4NCj4NCj4gVGhlaXIgc3VnZ2VzdGlvbiB3YXMgdG8gZXh0ZW5kIHRoZSBk
YW1hZ2UgaGVscGVycyB0byBjb3ZlciB0aGF0IGNhc2UNCj4gYW5kIGdpdmVuIHRoYXQgdGhlcmUn
cyBpc24ndCBhIGJ1ZmZlciBkYW1hZ2UgYWNjdW11bGF0aW9uIGFsZ29yaXRobQ0KPiAoZS5nOiBi
dWZmZXIgYWdlKSwganVzdCBkbyBhIGZ1bGwgcGxhbmUgdXBkYXRlIGlmIHRoZSBmcmFtZWJ1ZmZl
ciB0aGF0DQo+IGlzIGF0dGFjaGVkIHRvIGEgcGxhbmUgY2hhbmdlZCBzaW5jZSB0aGUgbGFzdCBw
bGFuZSB1cGRhdGUgKHBhZ2UtZmxpcCkuDQo+DQo+IEl0IGlzIGEgdjMgdGhhdCBhZGRyZXNzZXMg
aXNzdWVzIHBvaW50ZWQgb3V0IGJ5IFRob21hcyBaaW1tZXJtYW5uICBhbmQNCj4gU2ltb24gU2Vy
IGluIHYyOg0KPg0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmkt
ZGV2ZWwvMjAyMy1Ob3ZlbWJlci80MzA4OTYuaHRtbA0KPg0KPiBQYXRjaCAjMSBhZGRzIGEgaWdu
b3JlX2RhbWFnZV9jbGlwcyBmaWVsZCB0byBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlIHRvIGJlDQo+
IHNldCBieSBkcml2ZXJzIHRoYXQgd2FudCB0aGUgZGFtYWdlIGhlbHBlcnMgdG8gaWdub3JlIHRo
ZSBkYW1hZ2UgY2xpcHMuDQo+DQo+IFBhdGNoICMyIGZpeGVzIHRoZSB2aXJ0aW8tZ3B1IGRhbWFn
ZSBoYW5kbGluZyBsb2dpYyBieSBhc2tpbmcgdGhlIGRhbWFnZQ0KPiBoZWxwZXIgdG8gaWdub3Jl
IHRoZSBkYW1hZ2UgY2xpcHMgaWYgdGhlIGZyYW1lYnVmZmVyIGF0dGFjaGVkIHRvIGEgcGxhbmUN
Cj4gaGFzIGNoYW5nZWQgc2luY2UgdGhlIGxhc3QgcGFnZS1mbGlwLg0KPg0KPiBQYXRjaCAjMyBk
b2VzIHRoZSBzYW1lIGJ1dCBmb3IgdGhlIHZtd2dmeCBkcml2ZXIgdGhhdCBhbHNvIG5lZWRzIHRv
IGhhbmRsZQ0KPiBidWZmZXIgZGFtYWdlIGFuZCBzaG91bGQgaGF2ZSB0aGUgc2FtZSBpc3N1ZSAo
YWx0aG91Z2ggSSBoYXZlbid0IHRlc3RlZCBpdA0KPiBkdWUgbm90IGhhdmluZyBhIFZNV2FyZSBz
ZXR1cCkuDQo+DQo+IFBhdGNoICM0IGFkZHMgdG8gdGhlIEtNUyBkYW1hZ2UgdHJhY2tpbmcga2Vy
bmVsLWRvYyBzb21lIHBhcmFncmFwaHMgYWJvdXQNCj4gZGFtYWdlIHRyYWNraW5nIHR5cGVzIGFu
ZCByZWZlcmVuY2VzIHRvIGxpbmtzIHRoYXQgZXhwbGFpbiBmcmFtZSBkYW1hZ2UgdnMNCj4gYnVm
ZmVyIGRhbWFnZS4NCj4NCj4gRmluYWxseSBwYXRjaCAjNSBhZGRzIGFuIGl0ZW0gdG8gdGhlIERS
TSB0b2RvLCBhYm91dCB0aGUgbmVlZCB0byBpbXBsZW1lbnQNCj4gc29tZSBidWZmZXIgZGFtYWdl
IGFjY3VtdWxhdGlvbiBhbGdvcml0aG0gaW5zdGVhZCBvZiBqdXN0IGRvaW5nIGZ1bGwgcGxhbmUN
Cj4gdXBkYXRlcyBpbiB0aGlzIGNhc2UuDQo+DQo+IEJlY2F1c2UgY29tbWl0IDAxZjA1OTQwYTlh
NyBsYW5kZWQgaW4gdjYuNCwgdGhlIGZpcnN0IDIgcGF0Y2hlcyBhcmUgbWFya2VkDQo+IGFzIEZp
eGVzIGFuZCBDYyBzdGFibGUuDQo+DQo+IEkndmUgdGVzdGVkIHRoaXMgb24gYSBWTSB3aXRoIHdl
c3Rvbiwgd2FzIGFibGUgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZQ0KPiByZXBvcnRlZCBhbmQgdGhl
IHBhdGNoZXMgZGlkIGZpeCB0aGUgcHJvYmxlbS4NCj4NCj4gQmVzdCByZWdhcmRzLA0KPiBKYXZp
ZXINCj4NCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSBGaXggdHlwbyBpbiB0aGUga2VybmVsLWRvYyAo
U2ltb24gU2VyKS4NCj4gLSBBZGQgYSBwYXJhZ3JhcGggZXhwbGFpbmluZyB3aGF0IHRoZSBwcm9i
bGVtIGluIHRoZSBrZXJuZWwgaXMgYW5kDQo+ICAgbWFrZSBpdCBjbGVhciB0aGF0IHRoZSByZWZl
ZmVyZW5jZSBkb2N1bWVudHMgYXJlIHJlbGF0ZWQgdG8gaG93DQo+ICAgdXNlci1zcGFjZSBoYW5k
bGVzIHRoaXMgY2FzZSAoVGhvbWFzIFppbW1lcm1hbm4pLg0KPg0KPiBDaGFuZ2VzIGluIHYyOg0K
PiAtIEFkZCBhIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgLmlnbm9yZV9kYW1hZ2VfY2xpcHMgdG8g
c2V0IGluIHRoZSBwbGFuZSdzDQo+ICAgLmF0b21pY19jaGVjaywgaW5zdGVhZCBvZiBoYXZpbmcg
ZGlmZmVyZW50IGhlbHBlcnMgKFRob21hcyBaaW1tZXJtYW5uKS4NCj4gLSBTZXQgc3RydWN0IGRy
bV9wbGFuZV9zdGF0ZSAuaWdub3JlX2RhbWFnZV9jbGlwcyBpbiB2aXJ0aW8tZ3B1IHBsYW5lJ3MN
Cj4gICAuYXRvbWljX2NoZWNrIGluc3RlYWQgb2YgdXNpbmcgYSBkaWZmZXJlbnQgaGVscGVycyAo
VGhvbWFzIFppbW1lcm1hbm4pLg0KPiAtIFNldCBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlIC5pZ25v
cmVfZGFtYWdlX2NsaXBzIGluIHZtd2dmeCBwbGFuZSdzDQo+ICAgLmF0b21pY19jaGVjayBpbnN0
ZWFkIG9mIHVzaW5nIGEgZGlmZmVyZW50IGhlbHBlcnMgKFRob21hcyBaaW1tZXJtYW5uKS4NCj4N
Cj4gSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzICg1KToNCj4gICBkcm06IEFsbG93IGRyaXZlcnMg
dG8gaW5kaWNhdGUgdGhlIGRhbWFnZSBoZWxwZXJzIHRvIGlnbm9yZSBkYW1hZ2UNCj4gICAgIGNs
aXBzDQo+ICAgZHJtL3ZpcnRpbzogRGlzYWJsZSBkYW1hZ2UgY2xpcHBpbmcgaWYgRkIgY2hhbmdl
ZCBzaW5jZSBsYXN0IHBhZ2UtZmxpcA0KPiAgIGRybS92bXdnZng6IERpc2FibGUgZGFtYWdlIGNs
aXBwaW5nIGlmIEZCIGNoYW5nZWQgc2luY2UgbGFzdCBwYWdlLWZsaXANCj4gICBkcm0vcGxhbmU6
IEV4dGVuZCBkYW1hZ2UgdHJhY2tpbmcga2VybmVsLWRvYw0KPiAgIGRybS90b2RvOiBBZGQgZW50
cnkgYWJvdXQgaW1wbGVtZW50aW5nIGJ1ZmZlciBhZ2UgZm9yIGRhbWFnZSB0cmFja2luZw0KPg0K
PiAgRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgICAgICAgICAgICAgfCAyMCArKysrKysrKysr
KysrKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMgICAgfCAg
MyArKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyAgICAgICAgICAgIHwgMjYgKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9wbGFuZS5jIHwgMTAgKysrKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
Znhfa21zLmMgICAgfCAxMSArKysrKysrKysrKw0KPiAgaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmgg
ICAgICAgICAgICAgICAgfCAgOCArKysrKysrKw0KPiAgNiBmaWxlcyBjaGFuZ2VkLCA3NyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+DQoNCkxvb2tzIGdvb2QuIFRoYW5rcy4gRm9yIHRo
ZSBzZXJpZXM6DQpSZXZpZXdlZC1ieTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4NCg0K
eg0K
