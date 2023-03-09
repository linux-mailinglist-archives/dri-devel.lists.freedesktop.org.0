Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C14B6B1AA1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 06:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6E710E027;
	Thu,  9 Mar 2023 05:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY4PR02CU008-vft-obe.outbound.protection.outlook.com
 (mail-westcentralusazon11012000.outbound.protection.outlook.com
 [40.93.200.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB2010E027;
 Thu,  9 Mar 2023 05:14:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIbeQM/wgEDpqZtSsSmgrnqsa2tFUxEs2bUUUDoqcu9AhnvjOKyNRTLvRSjBUBHux76sonoVwf+xxCNV1JNsmnlfg4274FphEfx8h+gsvHoNyLcxLcgK1JyH1rb4m9oqNiy5pQf/9SOEPM4oftllExu6P22Uu1Gj+aP87jbOsMupW77dAWOaq0bnEFok/w8pT8z1QNSMk5fxLS8cIF5rwVZYx7qdru1Yb82URikbQko44BtedurvTvNikH7YUemtD3JIy/g8dKKjGaG+iQiyBzh/rttfdn7oBtXErjy+oBQx0tWIlc0LUpg9a7XEOLToT+qIrMytU8EAR+tBuV6hPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QczafhcDoccBp9Cp6B7ikdcc6sn7UoesSfJTwA1fo3g=;
 b=RXewGex/ItRU9/11J52xXkc59UQtNsS36yaPb59E9RtmAv6OaC8Zl9FtSo3PuFqqJSDoVy17U3LUx1yxzIgdRuZ6IFvNp9seXHQ1qiCf3cSKqw236AjciygZednhVc8hKTrDWC8SIIEcIZoPrwxoMWnKbe6A8iq2THkjU771wIlenllv7B8fwbC/dKUqQU4z3KuxD4YmE+Wf3094y/0Xe7+Z3z6MDkgpmLtjjsDBcLBhCtQhgG2AwffRO46w1OUS0OajlXa8o2lAVPM2VoI1yzjStDOktdo/MImhrZL4BuT7RD81kCX1MKXLJu5RGm2U0F/gNXR9cs4mt2QsJ/2Qqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QczafhcDoccBp9Cp6B7ikdcc6sn7UoesSfJTwA1fo3g=;
 b=eESrExqi7gGV12wUSkOx0kIPg2abmc0L2OJ0KdXWXbNRnQG03J/Qc13f+z25DhiJVcunL7dukH5TtD4riSG3jHhE3NdLn9smKuVwja4W/fHhi+UQeKnefLw0zJxnHZB3dCk+H//ph3yELXJZt0U3xdc1RrQqt/dQruiMegQa/eM=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by CY4PR05MB3447.namprd05.prod.outlook.com
 (2603:10b6:910:59::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Thu, 9 Mar
 2023 05:14:50 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7%8]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 05:14:50 +0000
From: Zack Rusin <zackr@vmware.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 9/9] drm: move ttm_execbuf_util into vmwgfx
Thread-Topic: [PATCH 9/9] drm: move ttm_execbuf_util into vmwgfx
Thread-Index: AQHZS09/txQe14sNKkKTzUIFpMWF9a7wYzeAgABBxgCAAVCIgA==
Date: Thu, 9 Mar 2023 05:14:49 +0000
Message-ID: <40318db5b88601e42e68a94115da2bdcf6e18db8.camel@vmware.com>
References: <20230228083406.1720795-1-christian.koenig@amd.com>
 <20230228083406.1720795-10-christian.koenig@amd.com>
 <b4beeee4b2a004938adc6c502443f7b3311aad50.camel@vmware.com>
 <6933b07b-af79-5350-b161-12ee73732b30@gmail.com>
In-Reply-To: <6933b07b-af79-5350-b161-12ee73732b30@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|CY4PR05MB3447:EE_
x-ms-office365-filtering-correlation-id: 1b70608d-757f-4099-6fef-08db205d352b
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OVcFFBsvD36AHLT4CuoZWcSuL/UpQeC6trVkvwCu6Zdnp3HoVea+yr35dHNdir3b4lwThogsmCEp0Im+GbVGSAib9VRR6SYArmI258GFno5eW5oC1C52AoxfSBB7MB9oHwYbxrcGp8ICnyrqz6XQZB/Fx0DiMzIYociELtALM/gC76/6B3aiSkIwM2UaDV4GPPlodqupiIYg5qbLbRwuJA6z8xHBIWXTHM+DbX569WZ3XHprzbg/6fTV806004rCZWgHTMJ3/86ucC8s/XG+IigQpyzY12rFDlDJhM0qrq64AYPmrqdGr3ttEO/s/is9dmKc6BCwjgYcm4eLBB5up7UmX7oj9G3UFhIYRGvOyTcLfIvzSBvP2o4Z3QWOUkjyTlfQ6haX9sb6at1wUNsDh7LfasdczBcR49jDveDPJeRM4XfS5s+ZBSpVK8r0ik+tH6TzOgbiSN2fkVnd+JYhIrSaHuAiW3QlYJNNYo/Wy7v77tOKyVF6+nqn/b6nJ4O+4WOUDrjLED3m3OUGZHlYkzt5k+mF58qWHSFVCYB25JnFBypec/+XhxIdop/TBFYnuQCFf9GqHHB4mNlmp5RFrTffAoj9JeolY7YpWxPHUDfkcRRjzSRU13drORPEAJGEw4dXSh0P/52xB6NJ/vL49A9ylodIb/z9tHvTQYqSvW7GPcaUUAwNywLeRcZopnvBkZglQcjPp+TDjAEKsu89/sWIV5obVOdOO10CguvKfeNAlZNjjUWRtHzNzqtbceMT8JnuehjYz6lFBmx9ZjSkbQCZ17MsuxTUMmXdTuAEhfY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199018)(66446008)(6486002)(66946007)(66574015)(91956017)(71200400001)(478600001)(6506007)(6512007)(2616005)(107886003)(186003)(86362001)(54906003)(8676002)(4326008)(36756003)(66476007)(110136005)(26005)(66556008)(76116006)(316002)(5660300002)(2906002)(64756008)(41300700001)(38070700005)(38100700002)(8936002)(122000001)(17423001)(156123004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzhETE94eUVOQStQYWdUQnFnL0VKZUg0M2VYWkpYRmJnTStyV0h2Wjk4Znpl?=
 =?utf-8?B?SW9DVzhVYTdRSFZPVnNOT2h5TjBvT0tvMzRzZUVLSFlIakFLRU1EQUxqREVt?=
 =?utf-8?B?UjE3SVlLYWtUaDRwRW5lNHpPbGp0KzZpS2ZyaEtJaGlkZjBzdGhQUjJ5a0Vo?=
 =?utf-8?B?eUxBWU5CTGJLU0R6eTlyaXE3N0h5VW5Zd3cyV3hGZzhDd1o0dklxT0laNThB?=
 =?utf-8?B?Q2gwT0ZBMTFEeUpoelc0cU9OUkQ1b09rdlpTeUQ4TUZmcktRVW1XUHVuWEd3?=
 =?utf-8?B?eXdjV3dxc2FHNEV3M1Y0TmVaWi9LVWNXT3NGZmpvb09Jb0VRRDluUkJJZXVE?=
 =?utf-8?B?blJJL0pJSFo2eVYyMVBIRWwzOCtMZzJFaWVZUXBDM3VpSnQyMXZIUzRyeGY4?=
 =?utf-8?B?SEZtbVBxMkZIQ3k2S2JuM2FWcHhwL2JicHFmM1M4WTdiOVpoSnc0aHY0eC80?=
 =?utf-8?B?ZTA3QkttWTVLajJ2eXY1bnFaeXoxMkZlTG9zem9TT05qWUd3YWNzbDFsNjVy?=
 =?utf-8?B?WEUzckdOdWxHalUzNWV2V09mN3ZIU1hJdG8zTjNWMjFXT2huVzdtczhrejRh?=
 =?utf-8?B?c1RSVkl1aWtROHlUdUFPbGxqTXVOVHFjRFJpdXBjZmhqaklsNWtuTlBNVHo2?=
 =?utf-8?B?b3ZwbktLbExHRlBHZlhRZExEeERGWDh0QWo5bGlVZmI2Q2dOU2JtQUtVT0VL?=
 =?utf-8?B?bVJqK0R0eFlPM2xqRUE4bmV3Q1QrZkRVMWpQTWRJOUprNTRMU2hLWXVCUFNw?=
 =?utf-8?B?ZGk5NVBmT0lRZjZLQzlmRlFaQ05WdlRPNVVBWXZ4RjVMV3R4bmFFemZYYjFH?=
 =?utf-8?B?eTZldiswalhoTHdyMGxZS3JsQkJjR0lDbjhibG9reUtGQmtyNTFzWmk1WExr?=
 =?utf-8?B?WGswSnczVTh5N0ZueUMwUjJJK3ZzbHRPbjRqSGlUUzd6TlQxZ0U1ODZ3WVNG?=
 =?utf-8?B?cktCVVhIbjltb0JyQ3pqVjRKeS8wKzBRcm11RndJT2ZyYW1qVFZSUm1ETWNo?=
 =?utf-8?B?eUJqS2d1V3pBb0tqZVUxZWMvRG5Xd2ZDang0cnVYLzUvKzNrNitFVDUwWkhn?=
 =?utf-8?B?WWk5YU1td1gzNlF4Qzdva0lMN1U4a05CYnZ6VHV2QjRNS3M4NEIxdGswSmNK?=
 =?utf-8?B?bjBVZVZIOVgyQmx5UUhxWTVIaDRkdksvSmFmWWVVd3N4NHNydHNXOHIvcWJp?=
 =?utf-8?B?b294UjJ4Q0ZwQlg3ZFdoaUVIUkdFMmtwVm9QbHBVd0duN20vZ3hnOUt4SkxH?=
 =?utf-8?B?K2JCdHgyWXBHUURydGR2THRpcXMxUUF1SFgyM0x4UUVhT2hCdGlZUUplUVJN?=
 =?utf-8?B?MTRFUDdKUkxycFJkTXZXT213c1RJS0pMY1BndDJrOW1JdFFqaWpRUjNHalpN?=
 =?utf-8?B?U3FyY1VLZzFaMy91cEY0ZkV3czRQa2Y4Ykh0Y1RkWWVBZm14NzlKaGRyMHNK?=
 =?utf-8?B?YWFwL2tsYnhxbnIySjMvUTEwMkZaSjd4V0ZEOWpBZnVaczNOU0tJYzl0Wm1D?=
 =?utf-8?B?a3hzWTN6SFVsUFhjKzBtUEtXSU9ldFZjRE9PdUhHY0paUVRaV0NtUWVaeVd6?=
 =?utf-8?B?OTJ5RlZiWkpmRzZ4eVJKQnYxS1VBSlRIWDg2ZU5vT3JFdnpRKzdLU1VGb0xo?=
 =?utf-8?B?YjRIUkR3NHQrRGw4eDFNUGRhMlVRRkZEazR1K0JLRDExYUZmckhiSjQrZFgx?=
 =?utf-8?B?SCsrNUFLb3daQTFyaGNzYjBNWERETXpoZUhLck50ZEs4ZnlwQnhjYVZONWcv?=
 =?utf-8?B?U3YrZWNJR2FiN3BvaXRsSk4reGNTRXhURHJDQzhNZ0lEU3luMkNyNzRJRHQx?=
 =?utf-8?B?Z0pOUkI3a0FPQ25PZlFWeENoWmJOSmhiUzlubVBXcVl1MTQxUkZuSkNCbURp?=
 =?utf-8?B?TEJRQ3dyN3BpeTFobGdxbTZYdmxuaEZpdE9aVG9aYXlvQzY5Y0k2UjVXRkRN?=
 =?utf-8?B?dE5qRXBlLzRnejBxdjNiVXgyTEdEL2N4TXlyZTFzVjJPRHl5eHVOVjZnNlZ3?=
 =?utf-8?B?Z3pvczhYai9EeGtiNU5Mbm5IRUpaNXdKMXd4TUFhVkFRQVo0Y3dubTcwb3Vk?=
 =?utf-8?B?SDB4czBLVU5tUXZvNWdkQWFrMkQzMkFNQXRhVEZ6VTJyNHBCaHJpYkZlQXdF?=
 =?utf-8?Q?pMpnmFJIhToUrexuT5lS54wim?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B86D47D8DD725541B79E9FD3692268D6@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b70608d-757f-4099-6fef-08db205d352b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 05:14:49.8987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QPhfMX9fQyNsox1+dVl7ZkN1DZqQeHDRS+gub56Nz8FEPsVA8UjOlJoaZkxa3ZbcvImQ0ASNuqcYOiPtTbMYAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR05MB3447
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
Cc: Martin Krastev <krastevm@vmware.com>, "dakr@redhat.com" <dakr@redhat.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 "arunpravin.paneerselvam@amd.com" <arunpravin.paneerselvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTAzLTA4IGF0IDEwOjEwICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiANCj4gQW0gMDguMDMuMjMgdW0gMDY6MTQgc2NocmllYiBaYWNrIFJ1c2luOg0KPiA+IE9u
IFR1ZSwgMjAyMy0wMi0yOCBhdCAwOTozNCArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToN
Cj4gPiA+IFZNV0dGWCBpcyB0aGUgb25seSByZW1haW5pbmcgdXNlciBvZiB0aGlzIGFuZCBzaG91
bGQgcHJvYmFibHkgbW92ZWQgb3Zlcg0KPiA+ID4gdG8gZHJtX2V4ZWMgd2hlbiBpdCBzdGFydHMg
dXNpbmcgR0VNIGFzIHdlbGwuDQo+ID4gSXMgdGhpcyBiZWNhdXNlIHZtd2dmeCBwaWdneWJhY2tz
IGJ1ZmZlci1pZCByZWxvY2F0aW9ucyBvbiB0b3Agb2YgdHRtDQo+ID4gdmFsaWRhdGlvbnMgb3IN
Cj4gPiBkaWQgeW91IGp1c3QgZmluZCBpdCB0b28gaGFyZCB0byBwb3J0IGl0IG92ZXI/IEknZCBw
cmVmZXIgdG8gYXZvaWQgdHRtIG1vdmVzIHRvDQo+ID4gdm13Z2Z4IGFuZCBhdCBsZWFzdCBoYXZl
IGEgY2xlYXIgaWRlYSBvZiB3aGF0IHdlIG5lZWQgdG8gZG8gdG8gcG9ydC4NCj4gDQo+IEkndmUg
anVzdCBmb3VuZCBpdCB0byBoYXJkIHRvIHBvcnQgaXQgb3ZlciBiZWNhdXNlIHZtd2dmeCBkb2Vz
IHNvbWUNCj4gc3RyYW5nZSB0aGluZ3Mgd2l0aCB0aGUgdmFsaWRhdGlvbiBjb2RlIGhlcmUuDQo+
IA0KPiBJZiB5b3Ugd2FudCB3ZSBjYW4gdGFrZSBhIGRlZXBlciBsb29rIGF0IHRoaXMgdG9nZXRo
ZXIsIGJ1dCBJIG5lZWQgdG8NCj4gZmluZCBzb21lIHRpbWUuDQo+IA0KPiBBbHRlcm5hdGl2ZWx5
IGp1c3QgdGVsbCBtZSBob3cgdG8gZG8gaXQgYW5kIEkgd2lsbCBhZGQgdGhhdCB0byB0aGUgcGF0
Y2gNCj4gc2V0IDopDQoNCkkgZG9uJ3Qgd2FudCB0byBob2xkIHVwIHRoZSBzZXQgKGl0IGxvb2tz
IGdvb2QgYnR3KSwgYmVjYXVzZSBJIGhhZCB0byBsb29rIGF0DQpzb21ldGhpbmcgZWxzZSB0b2Rh
eSBhbmQgdG9tb3Jyb3cuIA0KDQpXZSBvdmVybG9hZCB0aGUgdmFsaWRhdGlvbiBsaXN0cyB0byBk
byBxdWl0ZSBhIGJpdCBtb3JlIHRoYW4ganVzdCByZXNlcnZhdGlvbnMNCnRob3VnaC7CoA0KDQpU
aGVyZSBhcmUsIEkgdGhpbmssIGZvdXIgc2VwYXJhdGUgdGhpbmdzIHRoYXQgbmVlZCB0byBiZSBy
ZWZhY3RvcmVkIHRoZXJlDQooQ2hyaXN0aWFuLCBmZWVsIGZyZWUgdG8gc2tpcCB0aGlzIHNlY3Rp
b24sIHRoaXMgaXMgbWFpbmx5IGZvciBWTXdhcmUgZm9sa3Mgb24gdGhlDQp0ZWFtKToNCjEpIFJl
bG9jYXRpb25zIC0gdXNlcnNwYWNlIHVzZXMgdGhlIGlkJ3Mgb2YgdGhlIGJvJ3MgaW4gdGhlIGNv
bW1hbmQgc3RyZWFtLCBidXQgb24NCnRoZSBrZXJuZWwgc2lkZSB0aG9zZSBpZCdzIGFyZSBkaWZm
ZXJlbnQgKG9yIGluIHZtd2dmeCB0ZXJtaW5vbG9neSBnZW0gaWQgIT0gbW9iDQppZCksIHNvIHRo
ZSBidWZmZXIgaWQncyBpbiB0aGUgY29tbWFuZCBzdHJlYW0gbmVlZCB0byBiZSByZXBsYWNlZCwN
CjIpIFJlc291cmNlIHZhbGlkYXRpb24uIHZtd2dmeCBzcGxpdHMgdGhlIHVzZXJzcGFjZSBvYmpl
Y3RzIGludG8gYnVmZmVycyBhbmQNCnJlc291cmNlcyAoc2hhZGVycywgc3VyZmFjZXMsIGNvbnRl
eHRzKS4gVGhlIHJlc291cmNlcyBhcmUgbm90IGJ1ZmZlcnMgYnV0IGFyZQ0KYmFja2VkIGJ5IHRo
ZW0uIEEgc2luZ2xlIGJ1ZmZlciBjYW4gYmFjayBtdWx0aXBsZSBkaWZmZXJlbnQgcmVzb3VyY2Vz
IGFuZCBzb21ldGltZXMNCnRoZSBrZXJuZWwgaGFzIHRvIGFjdHVhbGx5IGFsbG9jYXRlIGEgYnVm
ZmVyIHRvIGJhY2sgYSByZXNvdXJjZSBhbmQgYXR0YWNoIGl0IHRvIGl0DQooaS5lLiBpbiBjb21t
b24gdGVybWlub2xvZ3kgYnVmZmVyIGlzIHRoZSBtZW1vcnkgYW5kIHJlc291cmNlcyBhcmUgcGxh
Y2VkIGluIGl0KSAuDQpOb3cgdGhpcyBzaG91bGRuJ3QgYmUgaW4gdGhlIGtlcm5lbCBhdCBhbGws
IHRoZSByZXNvdXJjZXMgc2hvdWxkbid0IGhhdmUgYmVlbiBrZXJuZWwNCm9iamVjdHMgYW5kIGlu
c3RlYWQgd2Ugc2hvdWxkIGhhdmUgbGVmdCB0aGVtIGNvbXBsZXRlbHkgdG8gdXNlcnNwYWNlLg0K
MykgQ29oZXJlbmN5IHRyYWNraW5nLiBXZSB1c2UgdmFsaWRhdGlvbiBsaXN0cyBhcyBhIGNlbnRy
YWwgcGxhY2UgZm9yIHRyYWNraW5nIHdoaWNoDQpibydzL3Jlc291cmNlcyBhcmUgdXNlZCBpbiBh
IGNvbW1hbmQgYnVmZmVyIGFuZCB3ZSB1c2UgaXQgdG8ga2VlcCB0cmFjayBvZiB3aGljaA0KYnVm
ZmVycy9yZXNvdXJjZXMgd2lsbCBlbmR1cCBkaXJ0eSB0byBpbXBsZW1lbnQgY29oZXJlbmN5Lg0K
NCkgQ2VudHJhbCBwbGFjZSB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIHJlbG9jYXRpb24vdmFsaWRh
dGlvbiBub2Rlcy4NCg0KV2hlcmUgd2Ugd2FudCB0byBlbmR1cCBpcyB3aXRoIDIgY29tcGxldGVs
eSBnb25lIGZyb20gdGhlIGtlcm5lbCBzaWRlIGFuZCAxLCAzIGFuZCA0DQpyZWZhY3RvcmVkIGFu
ZCBjbGVhbmVkIHVwLiBJIHRoaW5rIHRoZXJlJ3MgYXQgbGVhc3QgNCBzZXBhcmF0ZSBwYXRjaGVz
IHRvIHRoaXMgcG9ydCwNCnNvIGl0J3Mgbm90IGEgdHJpdmlhbCB0aGluZy4gV2Ugd2lsbCB0YWtl
IGEgbG9vayBhdCB0aGlzIG9uIEZyaWRheSBpbiBtb3JlIGRldGFpbCB0bw0Kc2VlIHdoYXQgd2Ug
Y2FuIGRvLg0KDQp6DQo=
