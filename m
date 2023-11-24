Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E14527F7548
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 14:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A0210E7F1;
	Fri, 24 Nov 2023 13:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::706])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3D010E205
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 13:33:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgU6fHpBAdJ4HUGFJRxjXV/uCsmlSxRZS4INAu1KxPzNBrfNJz41RmNRAxRBK3rK9Vnc5uhuEZXTycNXiHm6gtmXnVL9JyT84QRAFUxCaujjHrJr3L8duRXgjyIul5mws0m7hTjXhNh0ojCHYHZZE5Wgmqpx9tfF0cIMxXFLg1VkhOU0riyK8tFEcuss4Wh4UGOJD/tkVrF5b0RQQqZ+sWKqDfyOyZTcJtZCfbiwLC/Fbl5N/PkCfsA7zPcX7NBeMbFVDS2cASNDOVE9Bm9fGdKI4Ci2x9oXp1zDrb2IqAfpNEtY0lGkXdyPEPprTLBfFJ8CWjzcqH5es8uzWNJO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lIZdW6hDu6pQBGUNeQPpp/lEkPIb6wdG+T0lOoZpuk=;
 b=RYQzAVMpi4YzMq1X9yNJZ1sxGNjtYmnFfjOylwUeiLckcRsHWurz4GsN/RldueCH3yN3uzWAN/ZNizlfBCjCGaDu3eAMtISBhqYxtT2ZqmCgC01grX3e1RrDj5ZKqULMDfJtvixLaeA9EwZ/PADaOAVWzARni8NmMhsvdccQu2wMP37Lms4dNUwL/62/BZAjiuXwi+ZjUuJyYdF12HgfjBQuj/ZLDYjZpERheF54TzA6ZGjxuzkm2A4XCTnZpunrxWU7vkG3MR6q8hSC3MyoEeXupRhKVUNzZNkJi059B2C75ZCbFVXGDavTT2rXPczEvQoSHmn+pfRWIBxZt7F//A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lIZdW6hDu6pQBGUNeQPpp/lEkPIb6wdG+T0lOoZpuk=;
 b=jkVtFdg8UQ9v2x1iTVsH52AzuB+IehRmBmSubRURCfqMVIoanx4loArzU3yA8d6UVUyQnyAbir1D1+1nprY5h7mhLCnsysw2uZ0iETW/ingQ/pQEm7hIEjIyzFXsMmZb75gQ2Tr9a+TEKzRRBzC74SiJcpfC+hbVpf8mwx4U3pQ=
Received: from AM6PR03MB3943.eurprd03.prod.outlook.com (2603:10a6:20b:26::24)
 by DB3PR0302MB9088.eurprd03.prod.outlook.com (2603:10a6:10:431::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 13:33:56 +0000
Received: from AM6PR03MB3943.eurprd03.prod.outlook.com
 ([fe80::99e4:a3b2:357f:b073]) by AM6PR03MB3943.eurprd03.prod.outlook.com
 ([fe80::99e4:a3b2:357f:b073%3]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 13:33:56 +0000
From: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge: adv7511: fix crash on irq during probe
Thread-Topic: [PATCH] drm/bridge: adv7511: fix crash on irq during probe
Thread-Index: AQHZ/s62hk/4Z/WPZUOXpSut5Jd0ALBMFAYAgAAHvoCAPZxSgA==
Date: Fri, 24 Nov 2023 13:33:55 +0000
Message-ID: <xrkbvhyrx4tts326xgrx4lv424k5kyn76fo4dktl5cfntvkat7@nelnll2oypt6>
References: <20231014-adv7511-cec-irq-crash-fix-v1-1-3389486c8373@bang-olufsen.dk>
 <20231016081444.GD23177@pendragon.ideasonboard.com>
 <gczlvtbnch2a3yjke5ltzes66ozb4hz77hstjh5irgzql57y7y@aez4d26675lc>
In-Reply-To: <gczlvtbnch2a3yjke5ltzes66ozb4hz77hstjh5irgzql57y7y@aez4d26675lc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB3943:EE_|DB3PR0302MB9088:EE_
x-ms-office365-filtering-correlation-id: 16d83301-49b9-4096-7e86-08dbecf201dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ir2unFTj1ohBEMyO0H0MDI6YDIlJG5t2EiVzgHtDecwZj8FmQrRHTzQSOzoxjkU5ujpVsRkOPkukCjXRg3ypJBi7r+VGi+GTBd0/ATr+x6RTlFIo7U3+uvym1jV42FElg4PHKOVt/pu6Of2zUfqBw/IP+9oUzE+ZJfp01SldIQQakm7fUgbyBa+CJfji02c+O4iB9nP/pvTV3wtIYy8pmanJdeLy//7P8Iwrd30OepGO4ckw4qII4VCdkNmTNAXl2cIu91+iGFjo55LMpoTs3+PhkJceLA3tewSv06/7u6/djleIyEqNwHzKlgHUnx/tnCf3uFR0HuTlOjIHkBJU7/7jBr4OK2UY+O9OaFFr/GV6UaeJL9RTqVcdXen4y7huvP8wKK2ASJXE8u3EJDUr+u2BHtscSXIncysYLrkoeQFnw7BCeq4zK1LajKOxkNfqSUxgBH4pYGnpOjEqhGpZ1Z/JT3k1lK5Odofrbbo+WJFM4hfGnBquhFWp8nSR+TQm53b1+IiULaMy0bpQU23XhVc+m2L38aNXgB5ZX0eqgYPEDPqX9tLC4zK812FyyeGN70r5+GcCxJcyP6n8M8Zx6GOYAwZMB9zCLsWmBn6ulhOYwoyhpYXNj1+HPUqJEsz0pWJrkh1QkHdggIP3enDQeSXfSBlzpMbQ1EuRoLyTR4U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB3943.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(396003)(376002)(346002)(39850400004)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(85202003)(41300700001)(107886003)(26005)(38100700002)(6512007)(9686003)(85182001)(122000001)(83380400001)(6506007)(66574015)(478600001)(6486002)(71200400001)(91956017)(6916009)(316002)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(76116006)(33716001)(2906002)(8936002)(8676002)(4326008)(86362001)(38070700009)(7416002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M21PeUxkMlFTRmlTZUcra3FhTkdvUitmV1hSZUc0ZWp6R0F2alJKbjNrSkxZ?=
 =?utf-8?B?WFVjSnlqMXZHYnAycnRna3RTblZ4M09OQ0RRNTlBY1FFLzYwTjhZMGwyMy90?=
 =?utf-8?B?QjNoTUFKZTJGbmlGdjY4aFBMOE5rMkZ4dkJvMGpTQmJ5MDNnWG1Gbjdhdkgz?=
 =?utf-8?B?UkNWL2VHblBML25jT1pQZ0lQMmZwc29CQ01kaVpzVzNiYk8wczFXNUZEZ2JL?=
 =?utf-8?B?U1UzSmFRM2pJM2NJb2JxbTNIZ1NFcklTckVnUWZKeE5Ld2tNTWxJTFVzQTMz?=
 =?utf-8?B?NkdwSzl5bnVFYjZwdm1yZFRtMzhWK1VDUlg2MnRhT2pWYnp5N2JzbEpYVnhu?=
 =?utf-8?B?aENFRUNpOFozSWRUNFhmMXYwaTdsU0dTM0xJbVlxMW9zcms1eFhkU3ZPbjQ2?=
 =?utf-8?B?R09oMGJWTTJSOCt1RytWOCt1dGJmUjRYbG9FZ2hBNGp2NEhUeTRnVmMvSzZm?=
 =?utf-8?B?SEdTL21iMXprSk9wakIzQTVFZFgxSVpsekZPN3p4VXExaDAyZ3lvZE8reVhp?=
 =?utf-8?B?SEV3bC9pNG1hWS91NVRpeDUvUWlic2Q5VjJqZElSeElXVlZJRlZmcWE3cTJV?=
 =?utf-8?B?QldxYTlWWHFXUWVhNGhKVW56c1BXTzJBQ01rcmMzUXNGM3lvODhaODhFZkJu?=
 =?utf-8?B?OVhDdXNLQjIyWkEzZnpKOGl5RlRRWlF0Njdyb2NacWx6NDBMWmZkdW9kQzNU?=
 =?utf-8?B?blZlRFlWbE9BSytnbWwxR0gvNXpYOUpaa2JRV2U3VzU0M0d5MU5HNlZubzY0?=
 =?utf-8?B?V2IyZnlUK3BMdnBXeEVCQVczWUU1ZVpsM1psVE4wTW0rZ1A4UkF0VTREQXgz?=
 =?utf-8?B?QlpjNGNDNTJzYXVMcmt4NDRUMU1jeU5tRC9aSVpZZTBBVktmdDRBVEFvMzkx?=
 =?utf-8?B?OGtianpZR0VPL01TQUNKeWlySXZOM3dERldJVDdoem92VVRTOWhtZ1hLNzRJ?=
 =?utf-8?B?YjVDMmlYZk5zNC8xanEvQU1lVnZyMm5IWmFGR2hybGlHajRVeHFyb3pRblpD?=
 =?utf-8?B?bTduT1RnSjZWU0lFS2ZjL1FSY2lpdzg2MmI0K3BZeXErbGg5VVAzSU9FeHdS?=
 =?utf-8?B?bFJvVGxEREFKSGpTeUV2N3V5UlFDcmJPUmhVMXVRc2NYdWU3Ynp1T082SDlz?=
 =?utf-8?B?NkNFbnFHYjNYK3Y1Y2d2ZVl2bE5SUlcvWDRQemVwWFpJeEU1b3dsakhiQkNX?=
 =?utf-8?B?bnA3MlhMbjdQamEwZE0yemRYRzJqY2RkajFmbCs3WVpyMWVJazZLWVgrSFZH?=
 =?utf-8?B?MjRoenNQR3A0WkZ0ZlI5ZFVHT3dyS3cxMytEWnMwTmNFTVdqc2twN0hpdWVP?=
 =?utf-8?B?Lzk2OENuUWJqdkdaMTF6OWpmMFlsZVpLTUlkdVprSEllQWVRQTFRMzZHcGpa?=
 =?utf-8?B?WS9yb3lpdGc4K0RwQ1pQVERURjN2YU1aSUNreDRRQ2VuRHRxTVRNRHVmdGly?=
 =?utf-8?B?NjJ1NXordmJIR25NbTJXbXNrajVIMU1TRTdLUGxjS1BHa1VERWN5amdOR09O?=
 =?utf-8?B?Z3Z2SGtiYitmRXVEK0dWZUhBZEdaN1I3b1JadTFSZFJhMEJqV2hBL1g0QlM2?=
 =?utf-8?B?QjNob1IyRlFmeVZHTzFRcDdtZjBCa0lPQ3pvWHNNSytqaTF1ajVqK2xabHNE?=
 =?utf-8?B?V2xkQW01MWVjWlhTWHJRcnNnMjErWEdReEYyUGNTSXZlZXcvRnV1UVFqTDlz?=
 =?utf-8?B?RU0xNHNucE5qMWN0VG1Ib25PUGdLK0NPNUNoUE9kTWJPOVNZNk9vYmhYZ2RL?=
 =?utf-8?B?WGJlaHVnemVUWFkxbkdpakgxWU1LWDA5NEZHYldHZi9tRnpyZEcySjd5ME91?=
 =?utf-8?B?MlJkN2FQWnpZbmU5aEFUbDc5Q2JvNFlENXM4YUdEVWw4Njd2QWdQbUx2Yy9m?=
 =?utf-8?B?RytWcTVLTUErektzODQxTmxpWlliWUdvWDR1cXRlYVBzRkhmRDFjSWVrbDYz?=
 =?utf-8?B?VW9wU0M5bUJvWGVSUTNTVVhDenYycDlZUGQxWFI5bHpUSzVwa01HMXYvQVV2?=
 =?utf-8?B?S1F4d0w3NGpWR0dqOWpWeGtPTHJDMWl2VlFwVndSbzBYdVpPSmFkeXUzN0Q0?=
 =?utf-8?B?Z3BrZEZ2a29tamJTZ2FnTmd5dm9TM2xkV2FkR3JIbDV0THBOZmd0bjJWYVpI?=
 =?utf-8?B?dDBmNkdFaWZQaUUyZFArN1JvTmVneTcrU1BsdURHQmZzcjhESSs5T0tqQlk4?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D5360D3E71A414680DA946B1058A00B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB3943.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d83301-49b9-4096-7e86-08dbecf201dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 13:33:56.0464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NjvkvmePf48UmxvEhNChf9EaF8w7a/Y3IP3uNqwdCWNnMzpmG17I+r26a8W0Nq5DrYia56rdtq6Fd0E+Jj6zAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9088
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Archit Taneja <architt@codeaurora.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Mads Bligaard Nielsen <bli@bang-olufsen.dk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Hans Verkuil <hans.verkuil@cisco.com>, Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhpcyBpcyBhIGZyaWVuZGx5IHBpbmcgdG8gZ2V0IHlvdXIgZmVlZGJh
Y2sgb24gbXkgcmVwbHkgYmVsb3cuIEkgZG9uJ3QgdGhpbmsNCnRoZSBGaXhlcyB0YWcgaXMgaW5j
b3JyZWN0IGhlcmUuIFBsZWFzZSBjb3VsZCB5b3UgdGFrZSBhbm90aGVyIGxvb2sgYW5kIGxldCBt
ZQ0Ka25vdyBpZiBJIGNhbiByZXNlbmQgd2l0aCB5b3VyIFJldmlld2VkLWJ5Pw0KDQpLaW5kIHJl
Z2FyZHMsDQpBbHZpbg0KDQpPbiBNb24sIE9jdCAxNiwgMjAyMyBhdCAxMDo0MjoyN0FNICswMjAw
LCBBbHZpbiDFoGlwcmFnYSB3cm90ZToNCj4gSGkgTGF1cmVudCwNCj4gDQo+IFRoYW5rcyBmb3Ig
dGhlIHF1aWNrIHJldmlldyENCj4gDQo+IE9uIE1vbiwgT2N0IDE2LCAyMDIzIGF0IDExOjE0OjQ0
QU0gKzAzMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+ID4gSGVsbG8gQWx2aW4sDQo+ID4g
DQo+ID4gT24gU2F0LCBPY3QgMTQsIDIwMjMgYXQgMDg6NDY6MTJQTSArMDIwMCwgQWx2aW4gxaBp
cHJhZ2Egd3JvdGU6DQo+ID4gPiBGcm9tOiBNYWRzIEJsaWdhYXJkIE5pZWxzZW4gPGJsaUBiYW5n
LW9sdWZzZW4uZGs+DQo+ID4gPiANCj4gPiA+IE1vdmVkIElSUSByZWdpc3RyYXRpb24gZG93biB0
byBlbmQgb2YgYWR2NzUxMV9wcm9iZSgpLg0KPiA+ID4gDQo+ID4gPiBJZiBhbiBJUlEgYWxyZWFk
eSBpcyBwZW5kaW5nIGR1cmluZyBhZHY3NTExX3Byb2JlDQo+ID4gPiAoYmVmb3JlIGFkdjc1MTFf
Y2VjX2luaXQpIHRoZW4gY2VjX3JlY2VpdmVkX21zZ190cw0KPiA+ID4gY291bGQgY3Jhc2ggdXNp
bmcgdW5pbml0aWFsaXplZCBkYXRhOg0KPiA+ID4gDQo+ID4gPiAgICAgVW5hYmxlIHRvIGhhbmRs
ZSBrZXJuZWwgcmVhZCBmcm9tIHVucmVhZGFibGUgbWVtb3J5IGF0IHZpcnR1YWwgYWRkcmVzcyAw
MDAwMDAwMDAwMDAwM2Q1DQo+ID4gPiAgICAgSW50ZXJuYWwgZXJyb3I6IE9vcHM6IDk2MDAwMDA0
IFsjMV0gUFJFRU1QVF9SVCBTTVANCj4gPiA+ICAgICBDYWxsIHRyYWNlOg0KPiA+ID4gICAgICBj
ZWNfcmVjZWl2ZWRfbXNnX3RzKzB4NDgvMHg5OTAgW2NlY10NCj4gPiA+ICAgICAgYWR2NzUxMV9j
ZWNfaXJxX3Byb2Nlc3MrMHgxY2MvMHgzMDggW2Fkdjc1MTFdDQo+ID4gPiAgICAgIGFkdjc1MTFf
aXJxX3Byb2Nlc3MrMHhkOC8weDEyMCBbYWR2NzUxMV0NCj4gPiA+ICAgICAgYWR2NzUxMV9pcnFf
aGFuZGxlcisweDFjLzB4MzAgW2Fkdjc1MTFdDQo+ID4gPiAgICAgIGlycV90aHJlYWRfZm4rMHgz
MC8weGEwDQo+ID4gPiAgICAgIGlycV90aHJlYWQrMHgxNGMvMHgyMzgNCj4gPiA+ICAgICAga3Ro
cmVhZCsweDE5MC8weDFhOA0KPiA+ID4gDQo+ID4gPiBGaXhlczogM2IxYjk3NTAwM2U0ICgiZHJt
OiBhZHY3NTExLzMzOiBhZGQgSERNSSBDRUMgc3VwcG9ydCIpDQo+ID4gDQo+ID4gSXNuJ3QgdGhl
IGlzc3VlIG9sZGVyIHRoYW4gdGhhdCA/DQo+IA0KPiBJIGRvbid0IHRoaW5rIHNvLiBUaGUgc3Rh
Y2t0cmFjZSBzaG93cyB0aGUgY3Jhc2ggaXMgaW4gQ0VDIGhhbmRsaW5nIGNvZGUsIHdoaWNoDQo+
IHdhcyBhZGRlZCBpbiB0aGUgYmxhbWVkIGNvbW1pdC4gQSBzdGF0aWMgYW5hbHlzaXMgb2YgYWR2
NzUxMV9pcnFfcHJvY2VzcygpDQo+IHN1Z2dlc3RzIHRoYXQgdGhlIG9ubHkgb3RoZXIgcGxhY2Ug
d2hlcmUgZGF0YSBjb3VsZCBiZSB1bmluaXRpYWxpemVkIGlzIGlmIHRoZQ0KPiBocGRfd29yayBp
cyBzY2hlZHVsZWQ6DQo+IA0KPiAJaWYgKHByb2Nlc3NfaHBkICYmIGlycTAgJiBBRFY3NTExX0lO
VDBfSFBEICYmIGFkdjc1MTEtPmJyaWRnZS5lbmNvZGVyKQ0KPiAJCXNjaGVkdWxlX3dvcmsoJmFk
djc1MTEtPmhwZF93b3JrKTsNCj4gDQo+IC4uLiBidXQgdGhpcyBoYXMgYSBjaGVjayBvbiBicmlk
Z2UuZW5jb2Rlciwgd2hpY2ggc2VlbXMgdG8gaGF2ZSBiZWVuIGludHJvZHVjZWQNCj4gaW4gYSBz
aW1pbGFyIGZpeCBoZXJlOg0KPiANCj4gfCBjb21taXQgYTFkMDUwM2QyNmVhMmVmMDRmM2YwMTNk
Mzc5ZThmNGQyOWMyNzEyNw0KPiB8IEF1dGhvcjogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5w
aW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+IHwgRGF0ZTogICBUaHUgTWF5IDE0
IDAwOjMxOjA3IDIwMTUgKzAzMDANCj4gfCANCj4gfCAgICAgZHJtOiBhZHY3NTExOiBGaXggY3Jh
c2ggaW4gSVJRIGhhbmRsZXIgd2hlbiBubyBlbmNvZGVyIGlzIGFzc29jaWF0ZWQNCj4gfCAgICAg
DQo+IHwgICAgIFRoZSBBRFY3NTExIGlzIHByb2JlZCBiZWZvcmUgaXRzIHNsYXZlIGVuY29kZXIg
aW5pdCBmdW5jdGlvbiBhc3NvY2lhdGVzDQo+IHwgICAgIGl0IHdpdGggYW4gZW5jb2Rlci4gVGhp
cyBjcmVhdGVzIGEgdGltZSB3aW5kb3cgZHVyaW5nIHdoaWNoIGhvdCBwbHVnDQo+IHwgICAgIGRl
dGVjdGlvbiBpbnRlcnJ1cHRzIGNhbiBvY2N1ciB3aXRoIGFuIGVuY29kZXIsIHJlc3VsdGluZyBp
biBhIGNyYXNoIGluDQo+IHwgICAgIHRoZSBJUlEgaGFuZGxlci4NCj4gfCAgICAgDQo+IHwgICAg
IEZpeCB0aGlzIGJ5IGlnbm9yaW5nIGhvdCBwbHVnIGRldGVjdGlvbiBJUlFzIHdoZW4gbm8gZW5j
b2RlciBpcw0KPiB8ICAgICBhc3NvY2lhdGVkIHlldC4NCj4gfCAgICAgDQo+IHwgICAgIFNpZ25l
ZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVh
c29uYm9hcmQuY29tPg0KPiB8ICAgICBBY2tlZC1ieTogTGFycy1QZXRlciBDbGF1c2VuIDxsYXJz
QG1ldGFmb28uZGU+DQo+IHwgDQo+IHwgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pMmMv
YWR2NzUxMS5jIGIvZHJpdmVycy9ncHUvZHJtL2kyYy9hZHY3NTExLmMNCj4gfCBpbmRleCBiNzI4
NTIzZTE5NGYuLjJhYWEzYzg4OTk5ZSAxMDA2NDQNCj4gfCAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTJjL2Fkdjc1MTEuYw0KPiB8ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvYWR2NzUxMS5jDQo+
IHwgQEAgLTQzOCw3ICs0MzgsNyBAQCBzdGF0aWMgaW50IGFkdjc1MTFfaXJxX3Byb2Nlc3Moc3Ry
dWN0IGFkdjc1MTEgKmFkdjc1MTEpDQo+IHwgICAgICAgICByZWdtYXBfd3JpdGUoYWR2NzUxMS0+
cmVnbWFwLCBBRFY3NTExX1JFR19JTlQoMCksIGlycTApOw0KPiB8ICAgICAgICAgcmVnbWFwX3dy
aXRlKGFkdjc1MTEtPnJlZ21hcCwgQURWNzUxMV9SRUdfSU5UKDEpLCBpcnExKTsNCj4gfCAgDQo+
IHwgLSAgICAgICBpZiAoaXJxMCAmIEFEVjc1MTFfSU5UMF9IRFApDQo+IHwgKyAgICAgICBpZiAo
aXJxMCAmIEFEVjc1MTFfSU5UMF9IRFAgJiYgYWR2NzUxMS0+ZW5jb2RlcikNCj4gfCAgICAgICAg
ICAgICAgICAgZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50KGFkdjc1MTEtPmVuY29kZXItPmRldik7
DQo+IHwgIA0KPiB8ICAgICAgICAgaWYgKGlycTAgJiBBRFY3NTExX0lOVDBfRURJRF9SRUFEWSB8
fCBpcnExICYgQURWNzUxMV9JTlQxX0REQ19FUlJPUikgew0KPiANCj4gU28gYXNzdW1pbmcgdGhh
dCBpcyB0aGUgY2FzZSwgSSBhbSBub3Qgc3VyZSB3aGljaCBGaXhlczogdGFnIEkgb3VnaHQgdG8N
Cj4gb3RoZXJ3aXNlIHVzZS4gV2hhdCBkbyB5b3UgdGhpbms/DQo+IA0KPiA+IA0KPiA+ID4gU2ln
bmVkLW9mZi1ieTogTWFkcyBCbGlnYWFyZCBOaWVsc2VuIDxibGlAYmFuZy1vbHVmc2VuLmRrPg0K
PiA+ID4gU2lnbmVkLW9mZi1ieTogQWx2aW4gxaBpcHJhZ2EgPGFsc2lAYmFuZy1vbHVmc2VuLmRr
Pg0KPiA+IA0KPiA+IFdpdGggdGhlIEZpeGVzOiB0YWcgdXBkYXRlZCwNCj4gPiANCj4gPiBSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFz
b25ib2FyZC5jb20+DQo+IA0KPiBLaW5kIHJlZ2FyZHMsDQo+IEFsdmlu
