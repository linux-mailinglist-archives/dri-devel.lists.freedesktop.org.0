Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23183427270
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 22:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2987E6E103;
	Fri,  8 Oct 2021 20:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD606E103
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 20:40:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8IUc8BdzoOifd27L/Z6fZWdohon1oUaGWS6yfJ1SB88/paVoZAR+m4+KNDNvINR8UoofYynM90AE9h7HpV709j0axqFDv3RYEq3Nsjc7bBDrSC2tKNO/ofqUDQmo49gwh5+jD2YVjrvuSpwe0SGULHbiWeFQKQVxs4BAB/uMFrKBcPsA2Vf0obXugcXQqeyQYu1ExMrnkvIwFn3LuInF+ZeLAElSkL5oUNb6cNOtHf0QR8Ne7H0FKgoaVfQWxwj/mAnjIPMDcpetTXvt0dOX10uUZWtCrBpNLdF7DPdJu37bJ1Gtyjtyn1GDsAQ/DI8mPYlHrgJdgJqzQQOXuOOmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCEYMWQ5VzWi3v3QG2MrRqBg+nSdfsXmLWREIbt7oHU=;
 b=feWyoGE/rBT4ZnBmfCmgkSgJNIfCohC31FejjwvIBu6yATtim5PDt4bLv8pm5xyGj9g7m+a0IOreMdKHXX9Kx7HoIjY3X8uDYUSoG30y3AkJ5jB+lRn+CA12wbvIpuXM+kjB+6uQIuGtzxxDLGsot14GnyDGleYYGe5SwiHjr+AaC9hWkqMYA9LxtpsFyV4w+f20cwDIr1dINnZCdeB/Nh6MsO5ZMp99nScJ5nw2WQ2ysBClscK7IriXDgXoM/9bN3t8uGqJqt5Px/vYOWWR5hBV4ZApOuyQcaRS2vuA4BIdjDZAAs6d8m7ilZzNpmU9fI7fQAHix2soZeGtyxnKQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCEYMWQ5VzWi3v3QG2MrRqBg+nSdfsXmLWREIbt7oHU=;
 b=sthbnYSFs4Um8RvfVVsqB1gDeL+RoeVZbYfivE4pFQweQnhzkfWJ4I4O22aFo/qFW40zInJb7xK92k75Jb8nSDcV3hhXK+r0qbCtw3fEEMWzgrGDe35pWFCxYmqr0cBwFEhyng4BUJKgGO8biugZ0TVa1Z0VXBDgjjEspoRePf0=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6111.namprd05.prod.outlook.com (2603:10b6:208:c1::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 8 Oct
 2021 20:40:29 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::611d:3cfb:e99a:b768]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::611d:3cfb:e99a:b768%7]) with mapi id 15.20.4608.008; Fri, 8 Oct 2021
 20:40:29 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
CC: "christian.koenig@amd.com" <christian.koenig@amd.com>
Subject: Re: [PATCH 0/5] drm/vmwgfx: Support module unload and hotunplug
Thread-Topic: [PATCH 0/5] drm/vmwgfx: Support module unload and hotunplug
Thread-Index: AQHXvGph9gw8C8/5FkWZqC6NMx9TmqvJjTwAgAADZAA=
Date: Fri, 8 Oct 2021 20:40:29 +0000
Message-ID: <dbfb505f1034a2d725d76e30a26d2da0a850dd41.camel@vmware.com>
References: <20211008173146.645127-1-zackr@vmware.com>
 <7abe3906a814e40786da5cd5d45a7b826e262d8e.camel@linux.intel.com>
In-Reply-To: <7abe3906a814e40786da5cd5d45a7b826e262d8e.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.0-1 
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b32f2503-16e7-4222-459c-08d98a9bddd3
x-ms-traffictypediagnostic: MN2PR05MB6111:
x-microsoft-antispam-prvs: <MN2PR05MB6111A4BEFFA6C934D880137BCEB29@MN2PR05MB6111.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q4SEtVfN4nlQOIMVHJ2/bunKu7Hk0/mhASREapYG1ERm5EOu2eg9TW0hrCICWlzhKGPOQZK5Ivw4G3iokVX2b8KVURoMduW4dkK3gNrSGxurOJ4CGSmE2NZxkkzCPey7w3gz3neKQY/k9AVJ4cfhVCQx3GOtx5hzUfjKBfzdMewNC6cLNcJNFIrq20O1jblXJRBNdOvTY79BHmV9Aok6y6rtZMasUVPE+vQNXOfAKDxHJZ8BgZoG/wb+YNywc4LMl2o4hg89yE0mOr+aiiyeEoQG9/EDFfNyA5iTvd1GNU7FrSJyCRvLogmzfZZ3LJ5kJi9IWDZcVf4BwEHh+P73XuuJh2Msog5etWvY4mpHdusEXBM5NzuMLQZV0xnJF8DhU05V0kmGoKeGH8eIb2w1o3vtug61qGa1cv9VEKY3dWtl2J7bcvLr9XMi5km5bmcOesCFEhnm4w2JqOGkBZ1WlcndRGURv0GaDRYokrzkZyhNxOrzzefKh8zEl4xUyfRmvzKoGnaVFgtbWwXVEUzUOjePr3mcmhPI/Mt3+r0rGKtk7yEPdG38ONLChFui2Rn6SmsvVDtc6SxRofvEgwtFLG4X4ZEY29LJUVJ8sOwGcZ5HtlfEB6jnNakQVVaneipqBlsA3l3iA9+kSdUXIbkpUdEcDmc7giqOR13IhR8JCXy8xnlHB10vxthtgyAlpV1xvyA+/wGJNZHTDrlB0/xSmQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(66946007)(71200400001)(26005)(186003)(86362001)(966005)(76116006)(91956017)(2616005)(66574015)(83380400001)(110136005)(122000001)(5660300002)(508600001)(6486002)(2906002)(66556008)(38100700002)(316002)(66476007)(6506007)(4326008)(66446008)(64756008)(8936002)(38070700005)(36756003)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MW5aOFV4R0RDazkvTzNnUkNzWC8rK0FZQzV0eStpSk9YZGZVcHErSzczUVUz?=
 =?utf-8?B?YXZvNDFZUGV4MXdaZC8wK0lDUmNhZTY4RTNWbWQ1djBYbWRHYTAwZ1dSYjhs?=
 =?utf-8?B?TTU5ZHZoWEZENWJQRE1SZlVKNWhBZDJqK2M4UEtGMlU3TjBaejRrWHhNUWxN?=
 =?utf-8?B?d25JMmJXYnRSdWtuWmtraDdQZCt4d3R6U2xRWVY0NlNvUXE0QmNaMGJqenZD?=
 =?utf-8?B?azBEbE91YmlRc3dlQWQrNDJ3RkRUa2hBVmhZUXJFSEdqV1lySjM5V3lPOFVt?=
 =?utf-8?B?a0YxQ3h5WjB2ZWM3UnlxMTdPUnJUbm00WWFxMkNoUmVQRkNIaGZNRFJWTmZC?=
 =?utf-8?B?YjVvMjhUQzRNV3RFV3NmRzVaaWNPWFRhZFBBL2psR3ZrT2xBVkpSM0RzT1pJ?=
 =?utf-8?B?aFUwcVR0N2U0bW5TbnJ3OFZ3UTBBM2pxMy9KYkhuZnV1SXlEcndodjBYd1Vk?=
 =?utf-8?B?c2ZrRDFDeElzWEVGOE0rT2V5eG9VckxhVlpsaFBJZzNURkFhZW1jZEJrbVZQ?=
 =?utf-8?B?OUk3OUNnY3kxQkJwSnRGNVQ1dU43U01HWGw1Z082b3pQUXI0d0ZOK1R3R25n?=
 =?utf-8?B?OUtua0xrOHI2ODJTVllnVEg0a0tmWkRycVZqYmNRV3JqejVkb0xEcUZMcU1s?=
 =?utf-8?B?QWRlakxUdWdHaXFRWFB1TnNJNXEwcjNEOC9MQWEySUJ1K01sWE1MWVZobURn?=
 =?utf-8?B?VU9rbFF6WmQ2dnFsRzhQZkRGMzhRM3k0UjkyL1N5V2VCWXVTRnNVcDlSaUEw?=
 =?utf-8?B?cm40THArOVAzbTdySUZBRlhxUVRJUmZMekpLSlpLMWQ4TzNHT0ppVHJ3RC8w?=
 =?utf-8?B?aG14NlFFRjhZVFVORzNsNE0rZE9JeWErZkN6bC90YUZjWGhzV2NOMVVZdTFF?=
 =?utf-8?B?c2YzZ21LYnJZRDZ0bGdFdTNjQnk2UlJUWDF0akx5ZUxHRVFSTnYwaXBzM1Ra?=
 =?utf-8?B?aGJFVlc5a1FZUHJXYnRpK3RQaE11YjBLc0duUkJPTC95aWJ4cEU2VFYrZGdJ?=
 =?utf-8?B?eFN1QmVhTk1EdE1MRDVtQmQra3BsVHpaOFAxTDBVMy9zVVB0cWk5RjZCYlFj?=
 =?utf-8?B?WDc1cWhybG9KeStXL2pIdkdqSjYzWGxuN2xxZDVHK29XVkcxNW4zcC81OXU5?=
 =?utf-8?B?OU9RYWpRRWRVcVpMQkxWRmJWWVBEVUZ2ZmxQNlZ5QlA0eUI1QlBBaEVRbEFK?=
 =?utf-8?B?cTYzZWNnRUl1LzVPbmlzYkxPMUx3a3d0UzZhb2Z3VGd4MlJpUDJNUjlPMUZn?=
 =?utf-8?B?K1RaNTczcnhKWWcwY2FwU2hKV3BrUzRHMnBNVE5JaFlJTTRmcHd5NkdHL3VI?=
 =?utf-8?B?OEJJWWtsOHM3eEN6TlJjK2lZMXFWWHlidThtZHRVSlpKNFZDWFlhZmpDQlRz?=
 =?utf-8?B?cjlZZTZUQWFWeXJFQmYzVGxKcVRkQ3ROZndUb2g5ZFdCVTIxbk1TckpSM2lx?=
 =?utf-8?B?UU95V1dZNmtDRll3ODB0L3l4WTFNdHFhWFl6MVUydmRSMU9hc0drTW5HZU9w?=
 =?utf-8?B?eHVvYnEvaERWalNBY2UwNnU5OHhrTTZ2SVd2d2p6ZzlSNkVMQTVmanFZcmZa?=
 =?utf-8?B?R0pNRGtrVXdabU1keGMvU0hJakFJanFQRWdpSWRaUUM5SlViaTFMeVhUNEZT?=
 =?utf-8?B?cGlqRlVzT1R4R2x6cC9YSE9MQjliMm1wN3BHanE0UFRtN1VFVVVVdFlSSzNU?=
 =?utf-8?B?bENKOWdLMVp3R09FVFVILzdkQ3ljU3V4RjRYR2xqa2tOVEhBVnl2Q2czMUFo?=
 =?utf-8?Q?X1ZIVKIZaVCqw9EchNX+cs0ls40ULhhYjAgd3w0?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C18BA755710D704893EC3B7A5C5A8ED3@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b32f2503-16e7-4222-459c-08d98a9bddd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 20:40:29.4381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qf8VWcvuEXAxUGNaHMmTYDKqMreICOUVtvdZcM0cLTvn7RT5fmuFptWYsCrBqj7HLPI9ttlLxkyuOztjgdi66w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6111
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIxLTEwLTA4IGF0IDIyOjI4ICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToNCj4gT24gRnJpLCAyMDIxLTEwLTA4IGF0IDEzOjMxIC0wNDAwLCBaYWNrIFJ1c2luIHdyb3Rl
Og0KPiA+IFRoaXMgaXMgYSBsYXJnZWx5IHRyaXZpYWwgc2V0IHRoYXQgbWFrZXMgdm13Z2Z4IHN1
cHBvcnQgbW9kdWxlIHJlbG9hZA0KPiA+IGFuZCBQQ0kgaG90LXVucGx1Zy4gSXQgYWxzbyBtYWtl
cyBJR1QncyBjb3JlX2hvdHVucGx1ZyBwYXNzIGluc3RlYWQNCj4gPiBvZiBrZXJuZWwgb29wcydp
bmcuDQo+ID4gDQo+ID4gVGhlIG9uZSAidWdseSIgY2hhbmdlIGlzIHRoZSAiSW50cm9kdWNlIGEg
bmV3IHBsYWNlbWVudCBmb3IgTU9CIHBhZ2UNCj4gPiB0YWJsZXMiLiBJdCBzZWVtcyB2bXdnZngg
aGFzIGJlZW4gdmlvbGF0aW5nIGEgVFRNIGFzc3VtcHRpb24gdGhhdA0KPiA+IFRUTV9QTF9TWVNU
RU0gYnVmZmVycyBhcmUgbmV2ZXIgZmVuY2VkIGZvciBhIHdoaWxlLiBBcGFydCBmcm9tIGENCj4g
PiBrZXJuZWwNCj4gPiBvb3BzIG9uIG1vZHVsZSB1bmxvYWQgaXQgZGlkbid0IHNlZW0gdG8gd3Jl
YWsgdG9vIG11Y2ggaGF2b2MsIGJ1dCB3ZQ0KPiA+IHNob3VsZG4ndCBiZSBhYnVzaW5nIFRUTS4g
U28gdG8gc29sdmUgaXQgd2UncmUgaW50cm9kdWNpbmcgYSBuZXcNCj4gPiBwbGFjZW1lbnQsIHdo
aWNoIGlzIGJhc2ljYWxseSBzeXN0ZW0sIGJ1dCBjYW4gZGVhbCB3aXRoIGZlbmNlZCBibydzLg0K
PiA+IA0KPiA+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
DQo+ID4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVs
LmNvbT4NCj4gDQo+IEhpLCBaYWNrLA0KPiANCj4gV2hhdCBwYXJ0IG9mIFRUTSBkb2Vzbid0IGFs
bG93IGZlbmNlZCBzeXN0ZW0gbWVtb3J5IGN1cnJlbnRseT8gSXQgd2FzDQo+IGNlcnRhaW5seSBk
ZXNpZ25lZCB0byBhbGxvdyB0aGF0IGFuZCB2bXdnZnggaGFzIGJlZW4gcmVseWluZyBvbiB0aGF0
DQo+IHNpbmNlIHRoZSBpbnRyb2R1Y3Rpb24gb2YgTU9CcyBJSVJDLiBBbHNvIGk5MTUgaXMgY3Vy
cmVudGx5IHJlbHlpbmcgb24NCj4gdGhhdC4NCg0KSXQncyB0aGUgc2h1dGRvd24uIEJPJ3MgYWxs
b2NhdGVkIHRocm91Z2ggdGhlIHR0bSBzeXN0ZW0gbWFuYWdlciBtaWdodA0KYmUgYnVzeSBkdXJp
bmcgdHRtX2JvX3B1dCB3aGljaCByZXN1bHRzIGluIHRoZW0gYmVpbmcgc2NoZWR1bGVkIGZvciBh
DQpkZWxheWVkIGRlbGV0aW9uLiBUaGUgdHRtIHN5c3RlbSBtYW5hZ2VyIGlzIGRpc2FibGVkIGJl
Zm9yZSB0aGUgZmluYWwNCmRlbGF5ZWQgZGVsZXRpb24gaXMgcmFuIGluIHR0bV9kZXZpY2VfZmlu
aS4gVGhpcyByZXN1bHRzIGluIGNyYXNoZXMNCmR1cmluZyBmcmVlaW5nIG9mIHRoZSBCTyByZXNv
dXJjZXMgYmVjYXVzZSB0aGV5J3JlIHRyeWluZyB0byByZW1vdmUNCnRoZW1zZWx2ZXMgZnJvbSBh
IG5vIGxvbmdlciBleGlzdGVudCB0dG1fcmVzb3VyY2VfbWFuYWdlciAoZS5nLiBpbg0KSUdUJ3Mg
Y29yZV9ob3R1bnBsdWcgb24gdm13Z2Z4KQ0KDQpEdXJpbmcgcmV2aWV3IG9mIHRoZSB0cml2aWFs
IHBhdGNoIHRoYXQgd2FzIGZpeGluZyBpdCBpbiB0dG0gQ2hyaXN0aWFuDQpzYWlkIHRoYXQgc3lz
dGVtIGRvbWFpbiBidWZmZXJzIG11c3QgYmUgaWRsZSBvciBvdGhlcndpc2UgYSBudW1iZXIgb2YN
CmFzc3VtcHRpb25zIGluIHR0bSBicmVha3M6DQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAyMS1TZXB0ZW1iZXIvMzI0MDI3Lmh0bWwNCkFuZCBsYXRl
ciBjbGFyaWZpZWQgdGhhdCBpbiBmYWN0IHN5c3RlbSBkb21haW4gYnVmZmVycyBiZWluZyBmZW5j
ZWQgaXMNCmlsbGVnYWwgZnJvbSBhIGRlc2lnbiBwb2ludCBvZiB2aWV3Og0KaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMjEtU2VwdGVtYmVyLzMyNDY5
Ny5odG1sDQoNCnoNCg==
