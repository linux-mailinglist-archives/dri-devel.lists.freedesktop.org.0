Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F246671BB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 13:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDCC10E2E5;
	Thu, 12 Jan 2023 12:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU001-vft-obe.outbound.protection.outlook.com
 (mail-centralusazon11012004.outbound.protection.outlook.com [52.101.63.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C9810E2E5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 12:11:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nImmDhsW0n6dB7kaOQClKabn+Se1/9HlkZtmWWX8gjnmlxtiUoPqcqLFoKcFU8foRFp3TdKUUtMrjEzFsy3NdFHsga1uC6Qf1MxU6wkOdpQbKFVev/B1p19s5MUzJqomTpFKv+hDT5L0rv2VtLSfB+8N1p6j4fXJF1Ftcg7HXufGaGklAU3gOyJiL+YS2l+IywbkMpD4plKfH90+QJ9gUIh0s4A/N5C/Hiy4mv29IMoUFFlcQRnH+ov3+OsGOUEnMgRyBPV4nGCdttdPkHb1+1rfWh3Pc8erxKcoN7SMs8XSgZ7ybCFGVcYvIiisnvGQItnliqZaCjn2klGscKcomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cq4o6m7RSc0FZw237767NQbsANs6+ytiTjIPMYFxhQ=;
 b=dM81Khncp2GQ3eqUTrPsIDYxHKp6cn1lt6PYL9UlGyEB2z4hkGwdOwupYop3hvOlRrFpLWIxxwnmO0fP449AAey/pSyG8+N1YNM2AOuFZSYtmtTNXHm5KjDruCqk2G+uwNYdAGzFFSLG3GqjtKvfLeOWSMCXIm7LLqYp8dYyTPC1Yze0Dxm+YQC64e5Z+ap3oKXmzwosD9hO4DLDazliXi3RzH9vghfrv8WOHaAvY4lInI2mhp43YTIZ0xE+l3UVwi+KGUDaF+q0z4jS9UgIz1EW/AtdrDmLai+DMkb3wMtWaUrSU/l8HvycS2CN0k0WvHxC2mzTweSTumLK+BG3pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cq4o6m7RSc0FZw237767NQbsANs6+ytiTjIPMYFxhQ=;
 b=xZTbvwn5/M1lKdfNtQtoTpnonbCVdb3Pn7kiizBR/Bz51UgWKeb6NCUKGnqVNBXEc5ZEmwrwipuQ75oB1JJEvrJnAc31Nw0roup6MDCg2KaGMZpKg2FFJ5hSDwm0o+M64DkzzwBlBcVb6GbXS2XEkGk+wQ1krB74vmV69Cr8gWU=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by PH7PR05MB9060.namprd05.prod.outlook.com
 (2603:10b6:510:1fc::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 12:11:34 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::fd1f:6b2f:b0e2:4be1]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::fd1f:6b2f:b0e2:4be1%5]) with mapi id 15.20.6002.013; Thu, 12 Jan 2023
 12:11:33 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/ttm: Fix a regression causing kernel oops'es
Thread-Topic: [PATCH] drm/ttm: Fix a regression causing kernel oops'es
Thread-Index: AQHZJeUxtd0q8fthTE+QwzueLOOliq6aW4WAgABWtYA=
Date: Thu, 12 Jan 2023 12:11:33 +0000
Message-ID: <341c50e2531279e79f57073aa80988b96154536d.camel@vmware.com>
References: <20230111175015.1134923-1-zack@kde.org>
 <e3844067-5bb3-8c5d-bc8f-3ac4c42a3801@amd.com>
In-Reply-To: <e3844067-5bb3-8c5d-bc8f-3ac4c42a3801@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.2-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|PH7PR05MB9060:EE_
x-ms-office365-filtering-correlation-id: 57ded57c-489f-47ea-b05a-08daf4962597
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RaCvSaTC6LO4/mgP4l3z/zZelLaiXUgKjDKhJ2ivQNfoP0r4xF7si16Qp0cJtvlhw4lvrW7a5EslZXttJbCHB9cuvrrkaWwKMm28GU7hgf3RhTz9AerY2RaX+DFlGJr33feHjaLgrefH1q341GBBe+dVYnDldcPHt6WnLd7NyZgsw2FqwEB/zB3gzO/6FPENynpcLT2gkf+JmN7Vce8zkFClImT+bgAnaRxPfrZdR6nY6G6s/YE/I7arB4Zzuhgzy5cCnCKhxDRGjV+LLI54Zg7tWsFlFvigD8RHF41TO8M5NsJIqjLx1yQdlFXTY3UoBiYc4kNq9FfAQPQpX6UPFQ1bhOzTqkTDHRSXDGrsIdefUj5QhvWPDHpTVJsUR1wcAGOJIhRZXYTfGVuZBLSLjSSW80aJpFWUJYO6InxwQf4miP5jTOHLXPGYasMaZfSwJDQTkUxjL2neOYanYnQ5PU0KIp7s3SZpjaOHjAvY6GBJdhG39AxRh7kKzl7FPKPRK9E++yADM6Q9XumeAt8+w82j5H6elNzP69FKYk5gmOi1oGjG6bS6WhZ+PPTQYjnoQLU7dqRreAQty8ZXzEDhnM7X3lnb75ncF5501uIcRwkGZ4WjposUGl7Qdu0PegzGE7W8HUtAjGwN2SoTtXyQE/F8EEM7UwHjYf/e6KGk2r9qfQmANpThK3mt5oW8TIFZnQCizeQ9FPOVGrm3ZWV7cnTDpmI7ir/JPo4+JghOuA++7zXCy0PTIDwMm9CnX9fM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199015)(6506007)(122000001)(38100700002)(107886003)(2906002)(2616005)(6486002)(4744005)(38070700005)(186003)(6512007)(71200400001)(5660300002)(26005)(478600001)(316002)(86362001)(8936002)(36756003)(76116006)(41300700001)(66446008)(66556008)(8676002)(54906003)(110136005)(66476007)(66946007)(4326008)(64756008)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWhITmlKY1JHdE1nL3N5MVIrZ29CbzhXakFpdlUzNW9heGExaHkxMzNGRURM?=
 =?utf-8?B?RndXOExlUmY0cnp4YkdBQ0VHUG52SkdlMjlIWER0UmhMbUVrRnVlQjgzcUZN?=
 =?utf-8?B?Ty9Hb2NOalo3R1FaV05uY1prSGhCSzFTWEZ0REFtNm16QmExSVk5UmdjMTFD?=
 =?utf-8?B?L2pvVm5tOEw5Y1pFOUdQalRmZVdIbDBuRE1vQ0twZ0RoWjB0ZW5QK3B1ajZK?=
 =?utf-8?B?eUNKbGZKNkErOGg4aUdNUkpybFRDTGNRUzAvdEQwdTRPYXUwTnhCNjRhVGxB?=
 =?utf-8?B?cHd2aUtPMENhRjgwaWdOZGpiWEk2ejhNbUZZanBkTXlpNXpjTGxwV25TL00y?=
 =?utf-8?B?SnBtVk9laVNDYkxmdzFNYWk5Q21sUFNhVFU0c1E3b1hMZUVwKzRaajk4c3pJ?=
 =?utf-8?B?eGE0YXY0allnRUwwN2lqS2JVYXhES3g4M1R2QS9MMDNETjNLbXJUcFRaczFV?=
 =?utf-8?B?Mlg2TThqQjMrbmRzRjlkQkFDWFV6NDNwbS9jVEZsYVV3WDc5OXJ2RGRYRjVQ?=
 =?utf-8?B?Y3hjUUlSR2ZsZGNIZnNZNjkxM2xEeEZ0WmlVdUl5Z0FlL2dBdCttUGZCWFJV?=
 =?utf-8?B?VnBXUmdBZk1qbGhsZTdPZ1hRZWNjZDJkRnVyZVBBc0pFRHJ5RTNUWkJ2Z0s5?=
 =?utf-8?B?RUM0MG93VDFTTTNic0dXbmhMTzhtM2QxdjhBVWt5TkNuS205TFBXZzF0YjZj?=
 =?utf-8?B?RWtWU2x2aTJydTV1aURTWVByYjlaa1JmYzNFU0xITFI4M2dCQWFtandmb0cr?=
 =?utf-8?B?aUJXbVhUajUxeVZ5eDZGVW12ckxOSW92dUo0MTZXYjU2ck9jVDR1RlJPOEZV?=
 =?utf-8?B?MXNSWjVtRkh3US81ay8xZmU3bnc4ZTE0U2k2TFZkOWZrKy8rVU1hZnBBYVp4?=
 =?utf-8?B?QU1SUkttWE40Y2ZFV1Z3d0dnbzhPSXJQWnJmYnd0QnluNFJtOU1OL1lNWjh2?=
 =?utf-8?B?R3lZQ2dCVzY5UWo4M3JlcW55V1VBVzVpM0o5OGpCMWlxUEJZYWpSclpLck9l?=
 =?utf-8?B?WDVzRHc4RjJGZVMwQjIzS0hJUmRHT1hSUG15NFlFRHRIWkNXUUtXdERsRk5K?=
 =?utf-8?B?SzRTeVQrMm1Qem5HblM1WE9XR1p0Vk4xcXVEeHNUT1VrZ2tYVDIxekFMVUl6?=
 =?utf-8?B?OFVEdTVzSHV6TmpRNUZjYWloODNjQ3g4S3hUb3pZT1Myc2Vmbm0zSHEwWXhX?=
 =?utf-8?B?RXVzNmU5N3JzdmVJTWh2dlMrQWNSR2xFZWUrcytmWHUzS0NqT1R0TVFIQ1Nm?=
 =?utf-8?B?RlQxaVVvNXZXNGlWMUNielNBQmhPd01oc3V0UE9sa1VWbjlkTjdPdkZ1cWhU?=
 =?utf-8?B?dE1XVFZzeWMyUFRJUGUydHNJeDBySHk4MTJhMyt3dnM0SXJpemJoaHFEajRI?=
 =?utf-8?B?V29DQlY3aGVhSVJGTDBKQXB4TWJSandLK1pLOFk0UjVwVjk3MWwzSEVUblpw?=
 =?utf-8?B?QWE2UnNpSm5GaFY2MmRlTUhwN1lVNmZ4WmZMUW5NYVhkR2duV2c4V0JjUCto?=
 =?utf-8?B?by9VWEdBRWxXNkxtbFhLZ2IvYm94SndBVytyQVRQTEoveCs4R2FiK0RIanJL?=
 =?utf-8?B?VW15dS8ydkJ4Q0liS2hoaTd6bXVNckdsN2pzWDFMSjZMcXZ2ZVU0aUkvakhX?=
 =?utf-8?B?Sk1wUk5UVndaNDlpNHJPTFd3ZmJNbHJ0Yjhha1lOTTBFOHdBd3VEYjVaSXBH?=
 =?utf-8?B?SnpVb291azcwanZqeU9uYyt2TGxCQ1FVUXh6aDFKeFdjZU8vWlJqdFJjaHRt?=
 =?utf-8?B?UDlKQzFZVDRmQzlxMWpDWVQrci9BbkdWdFBwQlF1YUszUFRFdEhTaGQ5VkFQ?=
 =?utf-8?B?YUlhd1J3MFJsemNjWVJ5ZWhqbHR1cUYzOU5VeFdOTlNwaTFVRjFWTGViS2c5?=
 =?utf-8?B?U1diKzd1anBycWQ0dzViRDc5SFdUbjlWMHd4ME9ZNTU0UjlVZVBtTzVxUVlB?=
 =?utf-8?B?VjlyYm9pcEdxQXFCZmlCcVJudE5PeXlHUUlMUTV0azBXeUVDa3hXVFh0TG9w?=
 =?utf-8?B?cGdMU20yak90UnRadnd1ZFN0clhsZlF6dGN2V2pKVVMvR042U2t2ZmR1SmpM?=
 =?utf-8?B?cGRGT3QzWEVtU0JtRFNaRzkvN2lIeWVmNDJUOXhoanB1TXRMWm9kaTFyZitM?=
 =?utf-8?Q?c8blwzZEyLNwOM3HTT7O/4FE9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21ED98EC6A17F6488CFDD9A7916DF2BE@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ded57c-489f-47ea-b05a-08daf4962597
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 12:11:33.8691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CVcZ7zXhbcRJJvRbb9eN3ly9/N3s6J99fufgHrkbe0c1PotGDVmlnqKYmjzKwIUqWWHh3ggKfF7d/7XAYIkm9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR05MB9060
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
 "Amaranath.Somalapuram@amd.com" <Amaranath.Somalapuram@amd.com>,
 Michael Banack <banackm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTAxLTEyIGF0IDA4OjAxICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiAhISBFeHRlcm5hbCBFbWFpbA0KPiANCj4gQW0gMTEuMDEuMjMgdW0gMTg6NTAgc2Nocmll
YiBaYWNrIFJ1c2luOg0KPiA+IEZyb206IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+DQo+
ID4gDQo+ID4gVGhlIGJyYW5jaCBpcyBleHBsaWNpdGx5IHRha2VuIGlmIHR0bSA9PSBOVUxMIHdo
aWNoIG1lYW5zIHRoYXQgdG8gYXZvaWQNCj4gPiBhIG51bGwgcG9pbnRlciByZWZlcmVuY2UgdGhl
IHR0bSBvYmplY3QgY2FuIG5vdCBiZSB1c2VkIGluc2lkZS4gU3dpdGNoDQo+ID4gYmFjayB0byBk
c3RfbWVtIHRvIGF2b2lkIGtlcm5lbCBvb3BzJ2VzLg0KPiA+IA0KPiA+IFRoaXMgZml4ZXMga2Vy
bmVsIG9vcHMnZXMgd2l0aCBhbnkgYnVmZmVyIG9iamVjdHMgd2hpY2ggZG9uJ3QgaGF2ZSB0dG1f
dHQsDQo+ID4gZS5nLiB3aXRoIHZyYW0gYmFzZWQgc2NyZWVuIG9iamVjdHMgb24gdm13Z2Z4Lg0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+DQo+
ID4gRml4ZXM6IGUzYzkyZWI0YTg0ZiAoImRybS90dG06IHJld29yayBvbiB0dG1fcmVzb3VyY2Ug
dG8gdXNlIHNpemVfdCB0eXBlIikNCj4gPiBDYzogU29tYWxhcHVyYW0gQW1hcmFuYXRoIDxBbWFy
YW5hdGguU29tYWxhcHVyYW1AYW1kLmNvbT4NCj4gPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gDQo+IFNob3VsZCBJIHB1c2ggaXQgdG8g
ZHJtLW1pc2MtZml4ZXM/DQoNCklmIHlvdSdyZSBub3QgdG9vIGJ1c3kgdGhhdCdkIGJlIGdyZWF0
LiBPdGhlcndpc2UgSSBjYW4gZG8gaXQgdG9tb3Jyb3cuDQoNCnoNCg==
