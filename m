Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD9F69BB8C
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 20:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EF010E067;
	Sat, 18 Feb 2023 19:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0719.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::719])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2F710E067
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 19:13:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpxZKKFDyxK9yq6OAPdleBG7PZmkxVwuUoRnYvpPu8gKc3m2xk2Q8OzVAWrrFS4kVfiso0DziiM+9/i3euwj6B5b5V9o9uNr6hfcflLAHquvvaS4gKqbINrFI3p2/9+PmopRxGl5A+hg1Zno+eiCk3T8PdFMghjQdQ8MVC96Xtzopb66J/xlQZswKBXtna7sztpsQj6KouIg1CEn0lSU4ObFteiIoknTEhrQ80894D/bGiHZQMQ4osDKhJspHM66tycKd9E1XvefDW6YUtWe45fBnEEqldkXyuE34zLMXoYa2TVcD8mfUwV2+8l9sWpnde8qv9nzFjfGu2jQM25Jig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gb09JnJaVj1lMsxx0vEnMuasvs402JFO/jzxMNTZcgM=;
 b=Oig0BxaAaqzs1QXisTOOf1sNfXpVQqIXEATmWyLP9SK48Pjwac7jEsV2ks1jVfw6qW7iujy98HxthAQEWgQx19xYaWReJCypj3Q27vtQh0etb9eVa0yKUNzfeVgMwfqvRXyPb6T9b7JySoEhb/JWEyC/VGEomFTKb257kpCLECqNayK7Up0fyM63i/lnAgIrsQ1rZRI+CdCaEE6w4em3rwo/eddoM1YhX+MgbArV1plQNfeE/ysK3mgCMy8dcJd+E+NZtp14x+TMLOzBCJ405GFdzNvNLd+PFBfyYJsH40Qj/QL9hcwVRO4d6ZYBe9NIxjJyjB68kw8JYuTCUMwIrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gb09JnJaVj1lMsxx0vEnMuasvs402JFO/jzxMNTZcgM=;
 b=ms8zWwHMN1mlnh/iG02hlj2wsm4vaL3PtDcL1aM2TvrfoMr/Ln1XtKaRlJRg4On7zHWulwcSd9VyblBNiuyInv0dgu6kEW1t9tqo1mBmjAIqy0hSMCc6H6IpEqRKPTqOG+CIdk7gcKR0pU2lfaIxKr2DRLH9YNq/WNl+vFFCFkxH3fSEe89k/xZ4ZG81UQvECL8j4jnSYqqqiKtkQRdhvEz7HrMYFYcWOjXCOLqZxOLx3Tt1HHpWU/FoiL/Dap9/wrD9dwYy6RTOmcEmAvLqoQDYcUqhquB7uhM1EB9n9T8i7eqaSkYibT+BUQS8pHzzHJi81dJYIWE7Oln8xPVYDg==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by AS8PR02MB7269.eurprd02.prod.outlook.com (2603:10a6:20b:3b0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Sat, 18 Feb
 2023 19:13:39 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::e0f2:c1f2:4da0:b37a]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::e0f2:c1f2:4da0:b37a%3]) with mapi id 15.20.6111.018; Sat, 18 Feb 2023
 19:13:39 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Oded Gabbay <ogabbay@kernel.org>, Stanislaw Gruszka
 <stanislaw.gruszka@linux.intel.com>
Subject: RE: [PATCH 01/27] habanalabs/gaudi2: increase user interrupt grace
 time
Thread-Topic: [PATCH 01/27] habanalabs/gaudi2: increase user interrupt grace
 time
Thread-Index: AQHZPyLmp/Hf26ABY0ye791o3LL3U67Ra6EAgAA61wCAA3N78A==
Date: Sat, 18 Feb 2023 19:13:39 +0000
Message-ID: <DB9PR02MB66194B31DE64604DB4746D6FBCA69@DB9PR02MB6619.eurprd02.prod.outlook.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230216105350.GC2849548@linux.intel.com>
 <CAFCwf11FFkt7uSs9LBfx7D+6bgk648P=4GX3i+qEEy1b7ZXTKQ@mail.gmail.com>
In-Reply-To: <CAFCwf11FFkt7uSs9LBfx7D+6bgk648P=4GX3i+qEEy1b7ZXTKQ@mail.gmail.com>
Accept-Language: he-IL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|AS8PR02MB7269:EE_
x-ms-office365-filtering-correlation-id: c5beeba6-c65b-4b4c-57e8-08db11e43e23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yBcZ7Ibhqbtps58RG/lRpGkBjNfXOneGQ8WJM6GbGXSvlqF1M5slJkFjFkOHuCtMBHQVSHoCewFokyxpleYYHJo8M0KnxZF9miX19cmE1ldVsiD433sv9ntsXCymgWjDQrD1B+neiU2As5Cjx/AIDVlj+lzZ0FLFMXXPGNhNgqB0q44NN0QW/reJmaYIELXiPVMKLq7M1Pt+qT99nC2s71ED65TWI/Xxre2WzH1DZxROjWWqjmZ5zYxShvZVnS0OhQ4y++XMzaiVdt/RBN5qczgn1SuRbTz8QLWgAxFImi/vUdxPPo5XtrD1Ge3WZAEgNXpSg0a+ZOjFvdczA2sGDeUB/MD9tyW7H/0G18o3/83QJnGeOM4+swm8SUwJ9IY0yg19OF1K0kxR+0iw0kUoAAt8YVCFCVPsOFCX0F9ZAwI2jumegFE23RGsM4grRsLYy2GCk1Jyt6XdJ+mlLrrH52rk7dCRQm86Xw0Ls6Jil64fJTo6PHf3OBe3Zmiee5M5/DCyhQnj45Xg/u3ikZc0iUpyeLqqljT1HjAUOFzXl8SJO7kGRwuuOO6rHBjZbxg5Fb1SCtHFR+GLvbO5eMCXGA/nHsLDsnplABlCciurGoJcxx8f4Y2M8LylAMzAxjrMgfSh+F2qdZ2tnOibvVK47ZaS7Lu42M+Q95e1/6k1UraxrSfo61QNG3tbB52uD4CZdiuziP6LZxhXIWed1pFPjQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39840400004)(346002)(366004)(396003)(136003)(451199018)(66476007)(66446008)(66556008)(122000001)(186003)(26005)(33656002)(53546011)(7696005)(4326008)(9686003)(2906002)(6506007)(71200400001)(76116006)(86362001)(83380400001)(45080400002)(8676002)(55016003)(316002)(64756008)(478600001)(41300700001)(110136005)(52536014)(82960400001)(38070700005)(5660300002)(66946007)(8936002)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWlCNVh1citGZnVXcTVPc2lvazd5VmpDV0JDTmRLTDh5QTRKeFE5aXpWZWRp?=
 =?utf-8?B?VVpCMlpmNCs3RVl4OEJTeWRFN0VSVWVIYlNLTkl3MjNyMk0vYkoyNHM1U2Fk?=
 =?utf-8?B?T0dHd0QvR1ZHUFNxWUhHQXl3K0YzalU5WEYxeStBTHk0QUtETmdTOGJEdU9O?=
 =?utf-8?B?UTVVRlF3d0d2VGxZT1Z5Y0RUd2FPYWY5K0J3VnNydllqNGtxWkwvSGsvZDQw?=
 =?utf-8?B?NmR5SHFDYmdXRVVEeFZEVTBDRXlYQkg1Q3N4R3pKZ1Q0d21DRVV1UHd2SVlk?=
 =?utf-8?B?WWFMQ1FOMmlVaFdXLzJULytMMDFLRXRKV2dTQW45bkhpS0p4Y3MvMi9reXp2?=
 =?utf-8?B?a0dlZzVBeWdwWDQ4UHBuWk9adE8vRlo0ZENVb2Y5TGU5TjdYek5MOHExUm9p?=
 =?utf-8?B?ZUhJUlBJNTlVRHlTb1k5alVtRmp6d2ZNUmh4UXNRRjZOdFlSQ0FGZi9SOUl2?=
 =?utf-8?B?TVczS0tCR0ZHeEdoRTdGaVVOTjZVTFRzUHQwdTBJeDRXTzlKencwMGhFVjl3?=
 =?utf-8?B?MDJQaEhFa1ZiTlBuVHBuYThCVG1JNHRWdHBkdTVpRVUybW0zN2g1V045MFc1?=
 =?utf-8?B?UmFsVGtUMHBCTDVqR3I4ekRRbjBMMzByVERQY09YT1NlTW5NTE94cTdmb3FT?=
 =?utf-8?B?ME1mQzFLcDdsd2loY3F5SENtejNYb1ZMdS9MZmpRd1ZLY0FrOGg1cDFLbzhy?=
 =?utf-8?B?REczajcvS2VZVm84clZGY1NqMmgyalhwTzVDM2dPOUhIMERjc1MrbUZLcWg2?=
 =?utf-8?B?UndpbHdGekNqY1JQQThZS085RW1MbHgrYStpSUlYVzduQmt6MVVZdU5tM0c0?=
 =?utf-8?B?VHBEUHZTMXA3YUs1MWZWQ1RkdGEzbU1heDRCSWRFdkU1MTl1bWpvNHBNMjJZ?=
 =?utf-8?B?NUIwV2IvYTc5U2c3RzhJNWY4bjI1enVBM0NoN2Vqd01QSiswYXdQSmF6NUlo?=
 =?utf-8?B?c05rbzcxaVFvQlMvVk5Eb1lvSmdWSDBlM1M2TTVaTDhDZWJPU0FxTndtWDVh?=
 =?utf-8?B?cnlYeHRTay9XTHg1L0s0alpwNkJQRDZyOGIwTjc3SC9sRERBYlhJTjRuaUhm?=
 =?utf-8?B?cmtQZ1JRSzQ0MllUb2Z1cSsvMEVKYmYxNjVJdnpMdm9HSHMwM3RaTHZrZWpC?=
 =?utf-8?B?aGNyTllWVmFzY3ppakloa3hDamtpUStpWkpITGhZWUJlRnlHUm9BdWM0akZs?=
 =?utf-8?B?Q1ZQZ29scXVrWnd6WTNPVWxhRDZRdWxrNUkrdHEyMnR6blNzVlkvQVBramQw?=
 =?utf-8?B?VzFObG50eUU1VVNiZ29pWms5VGlXSTBvWXdKNmJFZ0ZHbUltdmNUQXozeXhn?=
 =?utf-8?B?NlA5VDVjUmd5dU9Kd3ROcTRQSlk4cWUveVl6Mm9HelhucGZCZnJJcVdVVzEv?=
 =?utf-8?B?aHJTaDFBQkc3OUFnblZnS0hOa2trTy9CWEk4cWM1a3U1dm44OUZCOEFGaE9R?=
 =?utf-8?B?OWdObFdoeENLaGFhM0h5SFBFQ0dBcTE1WCt2UlhudTFadERMRlVBaUdkSnlF?=
 =?utf-8?B?OE5EL1pMaGpIT3p5V0JsWFk2Mll6aVk0WUxNaHlLb3lUTDRxT3l4Q1lrYmNx?=
 =?utf-8?B?clk5aHd2Q2twUnF5MnlJelhteGhsY2drdExpdWVNaFhLSWM5SU9IOWNOdXk0?=
 =?utf-8?B?OU04UCtrYzFDZ1hQWEdNbXFWMytPcHpOZzNmWHhHTG9YVjE0ejdsUWxnYXEv?=
 =?utf-8?B?LzloNG1DUktJK09BelVTc1B1eVdEWUhQS0xoZ2JlQjY1WUdaRUNKcjFLSUdD?=
 =?utf-8?B?ekF4QWlvNVBhVlIzSTV5L0Y4L0RiZkhCa2dtbStOS2JBQVV1ZGVTV0FwU29O?=
 =?utf-8?B?U244enQ0aUN2NnAxL0krRE1nc0o1QlQrMzd2d0htMWhJR1pYNTc4LzNhTDl5?=
 =?utf-8?B?VFBWc0Q3VkNwTy94Vmx6YitQQUZlbWNtTlZmakFTaWM3VVFDVXJ3RTJpUDFq?=
 =?utf-8?B?QWh0T0JadHZGUWYrc0ljUlVOZVg2SXU4dmxQaGt0RDZOWURsTlluNm96ZVBz?=
 =?utf-8?B?U2E5QjNEWHJlaFlGU1BFU3VyemFKTXhURnV0a2RDSHp4RjlwWG1YZ1ZmWUFk?=
 =?utf-8?B?YTBNQXU0M1pFNjhmWHFJVm9vYXVhY1o3b05LR3ZBaWNDUmtYbEVXbU5Ga0Uv?=
 =?utf-8?Q?7wyJC9M/Kg6h1XwoDUtr2OZHr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5beeba6-c65b-4b4c-57e8-08db11e43e23
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2023 19:13:39.5619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: un1PGheuo5xboy38F5AtUXyagG/GZDEm9SQUuvHHhLcl91TuITz8wrnaVbNvfb6k/RbiSekVE0QuDE20Oq1Vaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7269
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBGZWIgMTYsIDIwMjMgYXQgMTY6MjQgUE0sIE9kZWQgR2FiYmF5IHdyb3RlOg0KPiAN
Cj4gT24gVGh1LCBGZWIgMTYsIDIwMjMgYXQgMTI6NTMgUE0gU3RhbmlzbGF3IEdydXN6a2ENCj4g
PHN0YW5pc2xhdy5ncnVzemthQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBPbiBT
dW4sIEZlYiAxMiwgMjAyMyBhdCAxMDo0NDoyOFBNICswMjAwLCBPZGVkIEdhYmJheSB3cm90ZToN
Cj4gPiA+IEBAIC0zMTc4LDExICszMTgxLDEyIEBAIHN0YXRpYyBpbnQNCj4gPiA+IHRzX2J1ZmZf
Z2V0X2tlcm5lbF90c19yZWNvcmQoc3RydWN0IGhsX21tYXBfbWVtX2J1ZiAqYnVmLA0KPiA+ID4N
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAvKiBpcnEgaGFuZGxpbmcgaW4gdGhlIG1pZGRs
ZSBnaXZlIGl0IHRpbWUgdG8gZmluaXNoICovDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSh3YWl0X2xpc3RfbG9jaywgZmxhZ3MpOw0KPiA+ID4gLSAg
ICAgICAgICAgICAgICAgICAgIHVzbGVlcF9yYW5nZSgxLCAxMCk7DQo+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgdXNsZWVwX3JhbmdlKDEwMCwgMTAwMCk7DQo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKCsraXRlcl9jb3VudGVyID09IE1BWF9UU19JVEVSX05VTSkgew0KPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihidWYtPm1tZy0+ZGV2LA0KPiA+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiaGFuZGxpbmcgcmVnaXN0
cmF0aW9uIGludGVycnVwdCB0b29rIHRvbyBsb25nISFcbiIpOw0KPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJUaW1lc3RhbXAgb2ZmZXN0IHByb2Nlc3NpbmcNCj4gPiA+
ICsgcmVhY2hlZCB0aW1lb3V0IG9mICVsbGQgbXNcbiIsDQo+ID4NCj4gPiBUeXBvIGluIG9mZmVz
dCwgeW91IGNhbiB1c2UgJy4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tY29kZXNwZWxsJw0KPiA+
IHRvIGNvdWdocyBzb21lIG9mIHRob3NlLg0KPiBUaGFua3MsIEknbGwgZml4IGl0IGluIHRoZSBw
YXRjaCBpbiB0aGUgdHJlZS4NCj4gDQo+IEBPZmlyIEJpdHRvbiBDYW4geW91IHBsZWFzZSB0YWtl
IGNhcmUgYWRkaW5nIHRoZSBjb2Rlc3BlbGwgdG8gb3VyIENJID8NCj4gVGhhbmtzLA0KPiBPZGVk
DQoNCkkgd2lsbCBtYWtlIHN1cmUgd2UgcnVuIHdpdGggdGhpcyBvcHRpb24gZnJvbSBub3cgb24u
DQpUaGFua3MsDQpPZmlyDQoNCj4gDQo+ID4NCj4gPiBSZWdhcmRzDQo+ID4gU3RhbmlzbGF3DQo+
ID4NCg==
