Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98513896B2F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9532112973;
	Wed,  3 Apr 2024 09:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=armchina.partner.onmschina.cn header.i=@armchina.partner.onmschina.cn header.b="0vHVxdSg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 884 seconds by postgrey-1.36 at gabe;
 Wed, 03 Apr 2024 09:57:12 UTC
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2093.outbound.protection.partner.outlook.cn [139.219.17.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D5811297A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:57:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOwP9JR64fmaJAjDYXFB5LV3LoGkc8xirtgeAcuJoDYmXFkLIao9haGN1vV1ahhOn/ZKXV+9XI7TDvTS8QEOctdiQc2I74I7Erh0U1b7PBHj8nYl3EFkyCRpf5xZH0t73xKR6dcq+uwwKWT4IGEeVsBgcSIqTdBj9HMIFHaC9ODEdDDjUNIUCSOd7QxBIYSAkiGdFWrHqBaFpZj1WtnSUorJheZXfwYJ6YZGo57dBgnn0D89YatXWRyeCYZ0iLLTK/VbfivYSVUe3S7QZpHoWbzD2Djmt64XcA26EN4abInlnniqWXrQhsdS/LWQqBj41dvRcmP5WKoMwJwhQ0+8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTyVJAQqq3SRNwu3+tltlwo0lN8aZ2/rQGn+wy9X52I=;
 b=fgfycWPdiFm7BN6W7BlznII7wuICWwWkoER0OWcHbhqJXC4u76JX/XIpUZhtKklaNwXp9Mz61w9iUAxqKqO4sxPlTgLfe6E4VyYGPSxqQQcSmgwK8EWXoFBCDbbn8sWHxqPG6arL3KfCPCVGK1jJ4ni/J+RYD9QsO610zGszb4WU5CWQr2+tUps06MCEmJjW5/D0sHCuHgeWqpf3ZzHMYA5sG3y/MOzIUrDEfeXQuIyc9dl2kBRp0nqkLXweDBkNPATqNDhqDTIiMVaIncL9XLyhbBqO+1/yW8hEMHJC/DZkbgKjXxh9nz1uoNPhZkpeowhH/SHL0gdV+aXLprXKug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=armchina.com; dmarc=pass action=none header.from=armchina.com;
 dkim=pass header.d=armchina.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armchina.partner.onmschina.cn; s=selector1-armchina-partner-onmschina-cn;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTyVJAQqq3SRNwu3+tltlwo0lN8aZ2/rQGn+wy9X52I=;
 b=0vHVxdSgPj40pxd7b+nlMHETY6SXN5PFHaZK2PFb21xvyzkcU60z3Lx8u72DOrjSUwdlk8ddj5/xRG+LPNbCkgutYXy3nE87yslNeN/tfrX2tpadqI8En+4xDwV+O2tHfJLHJ9hJSbQ/PlpD+xeZnjDdWCr+On9L3cfeyct45H8=
Received: from SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:8::10) by SH0PR01MB0489.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 09:42:22 +0000
Received: from SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn
 ([fe80::a8b:92ae:1d6e:9206]) by SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn
 ([fe80::a8b:92ae:1d6e:9206%6]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 09:42:22 +0000
From: Dejia Shang <Dejia.Shang@armchina.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Toby Huang <toby.huang@armchina.com>, 
 Chengkun Sun <CK.Sun@armchina.com>
Subject: RE: About upstreaming ArmChina NPU driver
Thread-Topic: About upstreaming ArmChina NPU driver
Thread-Index: AdqAssmmBRyQVXogTfqqG4OiiK8pHwASGPiAASu4PEA=
Date: Wed, 3 Apr 2024 09:42:22 +0000
Message-ID: <SH0PR01MB063477C082587039033A6F27983DA@SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn>
References: <SH0PR01MB063461EBC046437C88A6AE84983BA@SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn>
 <20240328103205.seht2hbog3o4giv5@bogus>
In-Reply-To: <20240328103205.seht2hbog3o4giv5@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=armchina.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0634:EE_|SH0PR01MB0489:EE_
x-ms-office365-filtering-correlation-id: 4e07ae8e-9bfc-4899-0956-08dc53c25c8a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T98/UQCV8EMpEl5ufMKHozVyxVGArCyEDVPCrE8cfItcSg3v4etuOFwqayCU2yLqGgY/uH6K7FgLjleUTrvvKatL/LHlMpB7s0U+OEGkanVQ4Bm2q3gOUxbA+UIZHWhIBd+MAQ5qhkkogcqJLTCJSy7p7pm+6VaZ12I54SQtfsvhUWReS7kVKBxXe530LFO0cSo5DXUWRFdjkIMRi2Zm75jNTLsLCjcg9FPtBiEq0Xdh2HWbjpZfeHWC1ouIKzNxE8OpFo/APVP7pPc8+2J3z0bBq5xwCSqYjH25l5TcysOBIse6L5T/2ea5k/SxzzozRfpGTixEN2UAh5gg1O+g1wa6Oeftc/mDDUeAWWvvfJROFjSOBxhm1UuauVvF0/vyD0LJc3/YVzVEm8S2m1b6BteyhuZskNYj6mLlIxL6nvUqg8+dg6XQRZJSG6EOb1bsYDywdftMW5jP3Nn9rKiC5yJ72yKblSX2MlYUmRbphbu0hg+DojdWmbvZbX7o7GU1dfHs7T5+L/aJE9lBzmr6oeQfG8P9MoSpp/ncbVNx/SJELSuwfFhhjtZI0WSZZ0lL2yjz20eyg0FOOCeRDCI4Vno+C4mtbuIwYU7B5p333W9z66Xv6m3oXQSriJjSLM0b
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE; SFS:(13230031)(41320700004)(366007)(1800799015)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tlg1SllGVWdZUWk1dWs3djhaUFhuckw5SWE2MHV2RDlEUFFuN0xXaitJYnFW?=
 =?utf-8?B?ZDFKaVArNGJtcmtTRWFTaCtiZ3A0WnNaTVdXY0hiclpJeUQxemdNVm53V2xN?=
 =?utf-8?B?ZGM1Rk5RRWtma05aaGtOTE85Q0FyTmNCOEI3bDF5Q2xSa1YrOUo0cnZrTExJ?=
 =?utf-8?B?UVo4WHVqR3NVY0Q5R3R3RkJXblBIU0V0cmRrcXl0MmpMTUVYRkJYR0R0Y0Zh?=
 =?utf-8?B?UTdrRWQyQmxxSnNHMjBQdzdjdCt6Z3p2QWZjaUtlTnB5Z2Q1aDgxd3VuMXQ3?=
 =?utf-8?B?Q1lvSDBZSkdCdzF1TlIyb2wyM2o0WExRMjRkS1Jzby9kMWJPRzlJWVpzM1pZ?=
 =?utf-8?B?KzBHRFJhM2tDcUFuUUJKejNyUWZ0ZUhKTlBmZEtFRG4zQ3ZvSEQyMmprelhz?=
 =?utf-8?B?aURsUktTUWtyZWVuM3h6R0czT3IzYk45OGU1ODBDWWF6b2JWTmg1ZTI1eHpi?=
 =?utf-8?B?TWg2dkF2RXZUMW9wSXc1a2swdzFRVWwwSVdXbnBCd1ZPVGRBc0FNdkpDL1lk?=
 =?utf-8?B?WmFKUGN0d1B2NUk3L0F6UmtFaVVIaFVrN240OWswTFBGMmhXTUhXUmtKSGxr?=
 =?utf-8?B?ZXk2Q0dCcGZlWHd1YXVvV3N2bmE4ckM0NkRGMEMwb0tjUVZQTStBVXA1M0Na?=
 =?utf-8?B?MU05Qk9JeDBPTnFBQUpucTVjRldSMWloMmlRRm5OSkx3dytrc1RGV2pVNEc0?=
 =?utf-8?B?Y0x1eHlQK01aTTBpZmMrbXdmWXRnZWpocnBpdVdWUTVvdEFGcjNkU3JtNldL?=
 =?utf-8?B?Y0dhZm9nd21xTE5aejR1Qml5VzJWNTQrU3JsT0oya2RRczdIU3FJY2g1UlpD?=
 =?utf-8?B?T082WmRLd0o2Q2h3VWhSdHBvbE5ZNnIwbWJMK1hqSzd0WkdNN1l2Y2lmWGg4?=
 =?utf-8?B?OEFRTVFRbmpMcnNQWTNUMGFiamp1TFp3b3ExM2ZBTU53ZGc4bEV2TjRyamt1?=
 =?utf-8?B?UHBaUTFMT1dRaE5HQnpwOXNTMXptSGFVQkxPcXVVYzNMbjNseHBiajNKYmsv?=
 =?utf-8?B?aUhoK2p4M05iSDhrYXhFQ2d5SjliZ0dXMWZaWVFESTBJMHVYZlJuaVIwajZ1?=
 =?utf-8?B?YXQrR1BqdEhVSUlob3pLVEppY28weGZLaHdpS25sd2I4b2lhNm5qcnQ3UHZT?=
 =?utf-8?B?ZDRSRXJPcE1HbW16ZVhTQTl3ODA1OFRZcDB3aDQrejhWYlAzeEhqcW9JWXBi?=
 =?utf-8?B?Y2d4anRXV1dMYmVBTmVWOEJnZmNFVHM5MXNiWEFOc1hoVlFaWVFUVHJ2d0JK?=
 =?utf-8?B?ZS8vVTZPTlhRbFBmc2FaZExjNzlhcHVRZUhJaTM3RGFZM1lYMVBVUHhZNS85?=
 =?utf-8?B?VHVSZGU1MnhhWEN6MW1OSThiNWZncmpHWmY4RDlKV3lrcHhEcW8rSVl0R09j?=
 =?utf-8?B?UnU4aDNDaldrbFhXZU85Skd0Sk1Ud1FMd1NJSTlaT0xabkRhcDFUUlpHcGFL?=
 =?utf-8?B?c0xGZ0dVR3hUaEIwV0xUNHRBRFBXZzN4bW9yVjdRbHNuOWhjS29VQVVuWllY?=
 =?utf-8?B?WCtEMElkMVhpa2MwNWhsMThyTGpodldhNU5iZVBhUC9rM2dXVUN0OEgvZ0J5?=
 =?utf-8?B?d05QOXJpS1d6SzlQMjY2UklDT0ZvcEdVK0RKWWZ5ZTJObWtNOTA4TXlodXlS?=
 =?utf-8?B?MkROT1dkalBuV3crQnpqamtHL2R3Rlg2Tjl5OHZoaW1NcWRGS0dIQjR0aDNX?=
 =?utf-8?B?TFBKNVFXMmJMWlBNdTNkK284d3NXcEdrcHFFcTJ2aURNVDJGS2dLaHBKR1dV?=
 =?utf-8?B?SVJ4R2txU0FZcUMwbUNLZGd0aEUrdk1zWVZrdXFneEFBUUw5TWZWaTRmTndB?=
 =?utf-8?B?UlBjS2daRG02OUZxbmZ0OUZlUXFJSmp4YWZuSHMwelY4bWg2ZDVlZlJFKzhP?=
 =?utf-8?B?cm12SnQ0c3h0c01ReDJ4SEVNSFlESEw1d0c2WHRhZ0dlQmJIOFRTbkdwdHJT?=
 =?utf-8?B?RHAvTTEwa1VpOTNyc2ZZamR0VWlFS2p0SnN4SmtZeXMvbUcxSEVNUVhDWFVu?=
 =?utf-8?B?Umt4UE1PWDJTNWkvVi9tZUlSUnpIdVFWWVNZS0RFSUxBTGxtaGFDcDRTR2ZE?=
 =?utf-8?B?N0pvY3RHanAwL3NGd3RrVE83eHRkMkFlY2U5VTJHaklLdFpZZHcvSkJTeXdq?=
 =?utf-8?Q?U3CrNyhgDW2qLi5abbj62TdwQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: armchina.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e07ae8e-9bfc-4899-0956-08dc53c25c8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 09:42:22.0575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 58b271af-432f-4dad-9dee-571f404bc6a0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aOZZ8CEDku97AQQMaQbtnzVpN4RBRZtjPV2oLCQHizdrVlpOoz+DBftQx7MMikvxSA5lqrxFyFQK8SjrsvlzdBAXLFkeCfQt+aZU5lMWNgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0489
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN1ZGVlcCBIb2xsYSA8c3Vk
ZWVwLmhvbGxhQGFybS5jb20+DQo+IFNlbnQ6IDIwMjTlubQz5pyIMjjml6UgMTg6MzINCj4gVG86
IERlamlhIFNoYW5nIDxEZWppYS5TaGFuZ0Bhcm1jaGluYS5jb20+DQo+IENjOiBvZ2FiYmF5QGtl
cm5lbC5vcmc7IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFybS5jb20+Ow0KPiBhaXJsaWVk
QHJlZGhhdC5jb207IGRhbmllbEBmZndsbC5jaDsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZzsNCj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnDQo+IFN1YmplY3Q6IFJlOiBBYm91dCB1cHN0cmVhbWluZyBBcm1D
aGluYSBOUFUgZHJpdmVyDQo+IA0KPiBPbiBUaHUsIE1hciAyOCwgMjAyNCBhdCAwNzo0NjowMUFN
ICswMDAwLCBEZWppYSBTaGFuZyB3cm90ZToNCj4gPiBJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29u
dGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heQ0KPiA+IGJlIHByaXZp
bGVnZWQgYW5kIGNvbmZpZGVudGlhbC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lw
aWVudCwNCj4gPiBwbGVhc2UgZGVsZXRlIHRoZSBlbWFpbCBpbW1lZGlhdGVseS4gSXQgaXMgc3Ry
aWN0bHkgcHJvaGliaXRlZCB0bw0KPiA+IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3Ro
ZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvcg0KPiA+IHN0b3JlIG9yIGNvcHkg
dGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4gwqlBcm0NCj4gPiBUZWNo
bm9sb2d5IChDaGluYSkgQ28uLCBMdGQgY29weXJpZ2h0IGFuZCByZXNlcnZlIGFsbCByaWdodHMu
DQo+ID4g6YeN6KaB5o+Q56S677ya5pys6YKu5Lu277yI5YyF5ous5Lu75L2V6ZmE5Lu277yJ5Y+v
6IO95ZCr5pyJ5LiT5L6b5piO56Gu55qE5Liq5Lq65oiW55uu55qEDQo+IOS9v+eUqOeahOacuuWv
huS/oeaBr++8jOW5tuWPl+azleW+i+S/neaKpOOAguWmguaenOaCqOW5tumdnuivpeaUtuS7tuS6
uu+8jOivt+eri+WNs+WIoOmZpOatpA0KPiDpgq7ku7bjgILkuKXnpoHpgJrov4fku7vkvZUNCj4g
PiDmuKDpgZPvvIzku6Xku7vkvZXnm67nmoTvvIzlkJHku7vkvZXkurrmiqvpnLLjgIHlgqjlrZjm
iJblpI3liLbpgq7ku7bkv6Hmga/miJbogIXmja7mraTph4cNCj4g5Y+W5Lu75L2V6KGM5Yqo44CC
5oSf6LCi5oKo55qE6YWN5ZCI44CCIMKp5a6J6LCL56eR5oqA77yI5Lit5Zu977yJ5pyJ6ZmQ5YWs
5Y+4IOeJiOadg+aJgOacieW5tg0KPiDkv53nlZnkuIDliIfmnYPliKnjgIINCj4gDQo+IFlvdSBu
ZWVkIHRvIGdldCB0aGlzIGZpeGVkLCBvdGhlcndpc2UgcGVvcGxlIHdpbGwgZGVsZXRlIHRoaXMg
ZW1haWwgYXMgeW91IGhhdmUNCj4gc3VnZ2VzdGVkIGFuZC9vciByZWZyYWluIGZyb20gcmVzcG9u
ZGluZyB0byB0aGlzIGVtYWlsLg0KPiANCj4gUGxlYXNlIHRhbGsgdG8geW91ciBsb2NhbCBJVCBh
bmQgZ2V0IGEgc2V0dXAgd2l0aG91dCB0aGlzIGRpc2NsYWltZXIgZm9yIGFsbA0KPiBtYWlsaW5n
IGxpc3QgYWN0aXZpdGllcy4NCg0KTm93IGZpeGVkLiBJIGRpZCBub3QgcmVhbGl6ZSB0aGF0IGJl
Y2F1c2UgdGhlIHNlcnZlciBhdXRvIGFwcGVuZGVkIHRoYXQgZGlzY2xhaW1lci4gVGhhbmtzIGZv
ciB5b3VyIHJlbWluZGVyIQ0KDQpCZXN0IFJlZ2FyZHMsDQpEZWppYQ0KDQo+IA0KPiAtLQ0KPiBS
ZWdhcmRzLA0KPiBTdWRlZXANCg==
