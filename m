Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB21E4F60C1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 16:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46FC10E02C;
	Wed,  6 Apr 2022 14:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D756610E02C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 14:10:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVyQoRHps+dbmqGu1DlTtZ45xVsSScwMtIITCMccpJ+Ih96Mt6KWGi54qwfgjBp98IgWaaLOyApHrAb75KzYnqmMrVHkA04+TorLu0+qe2C7M7BTbA057rzv033aOeKe5pcFGou5eI3jDXXtExpghF9q/DM7Pcx+2+EIjIpruEOMrst6MCE4HN5wGSAF7b7v75VYcZ7WSBIH8BNygDlct6BSVCmyFe4h2hQjr3WY0Hz+pQp/Ew8fQn3oHy27LkMRFSrwWr5SLMqZoDZaZaKmcwG/5stlJg8+Hn6Yd1fDoUasHYthvtuA+2HQjZ0fko4jYX7XKm9Tkx/F1/yY4e0KCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s31oRNUGSXW3fp+lVRPxYu3KQwdKl1f9B1Cknn8Oc6U=;
 b=ZRTdZJ3Nldr2LnzZlTBEn4zNeVxTosrIcdEBOY3VzKrV1VGTkZiUUsu+kMt+iisnMj7M9xnKv/V3ib/2MwhqMaH5YyIdU3iZ5iOGzmj5ASDtOzPuIrNJJ2wMdfr+raSWw1dibqbOkk29mn6uFX9pC/El7sOq8E1143evnBDPu8KmkN7EGFgkJ+/5DTZvqOdnmjzdXBuKG6nTfXnwiYEGYoC2YHrNrj/oPMpUANK+n5HQBRuDLjVfmw4fj5XuPAJCEAPln8YT45nf+lm01FQD3XuT1gEd/RUadQgxaR9Y4EyYLrHxD/COrEiOESJ7osuL9m48s1IStmUaqtidDzI8sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s31oRNUGSXW3fp+lVRPxYu3KQwdKl1f9B1Cknn8Oc6U=;
 b=jWGSRbuNeSYd/+CBieo45aV/E/w5vUe+7cMjoru74MDNd+j6wvMAGJ+nmcgEesn9E390QO4In3Fz7+GztpnSTFeHpZ6ZmdXEXdGywn00xZic3jTDUuu1BOclNTcN4KtcDFe+hGvVgc+yllPKRTjlxU/k513SYoFcheOuhGKmg/g=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by BN7PR05MB5857.namprd05.prod.outlook.com (2603:10b6:408:36::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Wed, 6 Apr
 2022 14:10:17 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c0e9:29ea:8618:834c]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c0e9:29ea:8618:834c%3]) with mapi id 15.20.5164.007; Wed, 6 Apr 2022
 14:10:17 +0000
From: Zack Rusin <zackr@vmware.com>
To: "michel.daenzer@mailbox.org" <michel.daenzer@mailbox.org>
Subject: Re: [PATCH] drm/atomic: Convert a warning to dbg atomic printk
Thread-Topic: [PATCH] drm/atomic: Convert a warning to dbg atomic printk
Thread-Index: AQHYSFDL1w9LOO3EfUqTzTYgFMJQ1azhj04AgABebICAAKK8AIAAXvwA
Date: Wed, 6 Apr 2022 14:10:17 +0000
Message-ID: <b904d6755e2c039963b3076e12e2fb085e399353.camel@vmware.com>
References: <20220404182115.18849-1-zack@kde.org>
 <4f5cd810-39e1-1c1f-4dd0-480fd6689d5c@mailbox.org>
 <5752c3fd9f901a722e3ea9210127118ed22c97b4.camel@vmware.com>
 <3254a42f-c922-f17a-97f6-35466c735d40@mailbox.org>
In-Reply-To: <3254a42f-c922-f17a-97f6-35466c735d40@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10c31cc4-409d-45bd-dc1f-08da17d72d67
x-ms-traffictypediagnostic: BN7PR05MB5857:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <BN7PR05MB58570A73F831C301ADCF5C00CEE79@BN7PR05MB5857.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tN20QpGrJbmTNLGJMS/DakUTe9jUx7RuwJrn1DII5970gHVU4iXy6To1fdsLvk14cSj7nUS3a+Q+sFPUraw0BpmEsOJPiAWGOo/YMfojNtZoTfhOJ4WAyrdpt9bB5lwHwkn+vcDfRUc0yo99joX38OwG2GteNB9TD8QwNNB8ZlELrNVLkIElQNcmhtp5qmwU9mCjN5ZinXpXgbF03r3vti7aFZRJ68LxciuwarmZYzD6toXVyykH8pk3qW9lPXvmkOcO7RldZ9A61AdYTECMxOQ4wmu5MF72AgkKUylggHwm1R5jfy43qf/ySt2ogUjj28FKLeqf1vb2wvVtjpJQA8amSjH0g/SWbulHRErhS8u3Nm+aAaBlL/CVyAMwdUwelViH82Lei/xJTSuWn06KPQe3MKUJjXgOuR+RCbaayrP4qa2Uh/exP9Bicu6r3FrZmlhZ0EI21m6lGjNR42ZfEpmIsiEmY2i4AizHLRZLhhSSp9ZJCK+vgNU6zgw6hk/RzZIChWO1mLt+tCQZxIwWl29uadORyK/ukF/rccNqa9mkUR6Y2ARJZYgMIQ8/KZmfuBQzTfLa87mqCshcitB1ugyd0jpxNrabEBz6rbEd4RW0qFltVXUft/VIJK313Ot1MYQp0TjyCZ3Vwh67NObvevkiHHSbh/Ul8opus/Jo3Nn9e/SThE8XNXdibfSAdyXO6K9rLJQYdkT2bXsk45SIMQlImjH3UlOKP7GUgi8NlDsISwzuxZpKmJcF2QhS1JpN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(66446008)(38100700002)(66946007)(4326008)(5660300002)(66574015)(66476007)(508600001)(6512007)(76116006)(8936002)(64756008)(6486002)(8676002)(83380400001)(122000001)(71200400001)(66556008)(53546011)(2906002)(36756003)(186003)(2616005)(38070700005)(6506007)(54906003)(6916009)(316002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3JEdUZIbDZQaWVrLzJCUThBYkM2RDBkd1JQQXhhRkhnRW5ZZjFNcTNNbEdP?=
 =?utf-8?B?UFpjNlB2Mi81cmYrZXNhVWJxS1ZFMDd2SHp6a1dFTXluYkJNb24vek1nOVRp?=
 =?utf-8?B?OEpyVDdmMzlDMTU4LzBwQXllVDM5eVAyYXNDY0xPUzJqYUozbk1rUGRXcG53?=
 =?utf-8?B?OXpFZVZLeG5PU2J5MlFGYWQxVUN1ZzBEaElDbVFoWktEZ0I3WnJRT3M0dEhD?=
 =?utf-8?B?ODdvVTRqWnlqLzlHa3g4YVBiUEh5ak5KckcrdC9yYmNpOHhBN2RLb3JLR1Nl?=
 =?utf-8?B?R2k3T1VwVGlxYUY3d24ra1ErQjF5RHNSa3Y3c3dFK3YrZVRnb2xwbGVZVm5w?=
 =?utf-8?B?WDBJR0E4eEZMM3Z2YjVCVXJsYXlpekZNb1BkNFhMdmNQcnZmMXJSTHprSkNp?=
 =?utf-8?B?K2o1VVhzcHVjMjM2Zmo1dFBUV3NGa1BrY1RtNmpoYXBHbWcvd0R2QnhtZ09G?=
 =?utf-8?B?TE81SFV3K1JGNkI2VkJ6bXV6Sm5BdDR5MU1SbkhST2g3VFRRSE1XWHVGdlB3?=
 =?utf-8?B?SFdGMEJqUHlqSEtQejM3RUlVNzVnakp0VjVBU3VKOFozMUNkUi9GeHNLR3po?=
 =?utf-8?B?UlNzS3ZqekY3VmdXNE96c093cm5YdDRQRGIwbSsybWxxYUNzUFdjc3kwM0d3?=
 =?utf-8?B?K253M0paeFBiQUhwelBpRmRLZkpBNTZ6cWMwY05HM0NEUVY2L3l6aTFmWDRC?=
 =?utf-8?B?RE51WElSSUk4MVU1M2dkbXoxbisxUG13UXlVa0x1bmdDMjRZeFZEUm90RWVv?=
 =?utf-8?B?QmJWZjM1MFVTVzNEb2UvOWhTcVlKWXd6SGcwWlNiQVFpcVVrZlg1Vmt3OWZu?=
 =?utf-8?B?L2FLSFRUSWlkYVg1QU5MQS82MnU4M1BKUklUZ3NDNTBQSVpoa0w3WWgzdW9G?=
 =?utf-8?B?aTNWT0NLZ2RLTWpQdjl1bk8wY1ZDbVU3eXdNckJVaDhsWWdva0g3T2hmV2Rq?=
 =?utf-8?B?UzdWdWppVXJxeTZDLzgrZ0g2d1hGRGVYWmsvQlJxSWc3Z3FwTXU2M1FVNXJE?=
 =?utf-8?B?VXVkYy9vZHlCSjI2c3RBRlJXSFFpN2hIUFFVakVuc2lDUjJZK0dzLzN4UkJr?=
 =?utf-8?B?TDE5M1dOMldBQVhETU1CUlk5ZjRkcmVURDdaQUorODR5c0ZPbUQ3UHF2Vllo?=
 =?utf-8?B?M1J3ZEc4cmF4SWpxZnEwYmNaRFZxVm04Tm5uWFFWMUpxU2lDaGJxMlNrYXpy?=
 =?utf-8?B?NTdjUUp3MjlqU05mTzNCbzJjdVM3cmVEQ3ZEdEhFMHVMamp6TDNkRndDQnhq?=
 =?utf-8?B?ZisrOGRsOG5rRFh0N2x2NHk5NVJkZU0yNytXUUdkeXNpYlZKVXBEenIvS051?=
 =?utf-8?B?aFlYcHpENGFObXI5bWU5N1dGbWVwTkNzNnhmWjRGMmY0TlNKamR5VzNoK0tO?=
 =?utf-8?B?NHVFNnl0Y281UjJKOVhEN0tNQXRjd3drZDFsdGd6UWVvUTNmR2FqUTlPOFhK?=
 =?utf-8?B?bG1nNklFWjhBMGc2QUFEc3lsS1JDY0FOYXFCZkIvekN5RjNIQ2g5RTlIeS9K?=
 =?utf-8?B?UjN2dkRvTmo3VSt5aS9pVEhXY08zS2FRaXVpNm56dC9HWk8zcDRUWVB6Wm9k?=
 =?utf-8?B?QTh3NFZEM1dEaGJ3a3lGT2tqS29xay9IMG1sU0MralJ1eGNPNVROWm5JK0JG?=
 =?utf-8?B?cWhMVFhmMGFabXpmcXV5bkRGV1llQ0FHcVJiRFNJbXZYcVdnWm1QZmhRb0pB?=
 =?utf-8?B?MGxkeWhhTzZyV2RjYi9qdEg3MW53ajlzUmlVVEc1cnQ1UFhQbndLZE5MVWpE?=
 =?utf-8?B?WmJVZnVCT2tKKzZjZ2g3dWFyNVdNOVJKRVZveWN5dEJMd25VRjVvcFk2S0t0?=
 =?utf-8?B?UHNVZy8vZ3UrYlF2NTVncm54eUJKOUhqWVdpR3BWZTBlMUhmMStlZkwzUGJl?=
 =?utf-8?B?aEVIcVVZQ3liQ1pQdHhUUlNUa3EyeUNuc2x6TTJRRjhrZ3V0K29GWC9LaWxx?=
 =?utf-8?B?SHdpUkZGVmI5UjZVREJUWjZmT01Yc1VGUFhhZEViZ1hKT3BCckxjYy9Pd2Q5?=
 =?utf-8?B?RWNRM0huSUFRdjJsRkltQnZvUmJYUU1xOEVGcmt1a0JDa3prNk1nc01TNmln?=
 =?utf-8?B?bm5kbkVsWmxZNHZUOVlLSitSR2JVM0VoUnoyNzJKTEhnOUlkVnNnMzg0MSty?=
 =?utf-8?B?Y2pxMnhadjBDbFlCNmUyWFhUWEVhT1FKdFo5UlN0MmxweUdoTHBVTEYzWTFN?=
 =?utf-8?B?Z1M0eUNBNmpuUXVhcjVHb2R4SkNaY0o0QlVDTTNGYktXK05pcEowOTFIRDJ5?=
 =?utf-8?B?T25wQytsRm8yOFRQMHI3U1dGTFF0NS9CSXpjeUxrWHAydTh0eVA0cFEyc25L?=
 =?utf-8?B?ajdPdDVUdkxoRXlGWkR3WW5rem05V0ZtemZpYTlXQTVvYUdtTGNrdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6989DA01AE3784D8F46D3CFF3E10053@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c31cc4-409d-45bd-dc1f-08da17d72d67
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 14:10:17.3066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 75QYHEUN/wRXx9z5Lo65Fei5WdPRN7puDXyZB0NvW/YK4epNjUT4uzLN4XuCJ7u9t/jSNxawl0v7XBy5pkjPjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR05MB5857
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Martin Krastev <krastevm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTA0LTA2IGF0IDEwOjMwICswMjAwLCBNaWNoZWwgRMOkbnplciB3cm90ZToN
Cj4g4pqgIEV4dGVybmFsIEVtYWlsDQo+IA0KPiBPbiAyMDIyLTA0LTA2IDAwOjQ3LCBaYWNrIFJ1
c2luIHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAyMi0wNC0wNSBhdCAxOTowOSArMDIwMCwgTWljaGVs
IETDpG56ZXIgd3JvdGU6DQo+ID4gPiBPbiAyMDIyLTA0LTA0IDIwOjIxLCBaYWNrIFJ1c2luIHdy
b3RlOg0KPiA+ID4gPiBGcm9tOiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0KPiA+ID4g
PiANCj4gPiA+ID4gQnkgZGVmYXVsdCBlYWNoIGZsaXAgdGltZXMgb3V0IGFmdGVyIDAuMSBzZWMN
Cj4gPiA+IA0KPiA+ID4gMTAgKiBIWiBpcyAxMCBzZWNvbmRzLCBub3QgMC4xLg0KPiA+IA0KPiA+
IFllYSwgc29ycnksIHRoaXMgZW50aXJlIGNvbW1pdCBtZXNzYWdlIGlzIG5vdCBjb3JyZWN0LiBJ
J3ZlIHNlbnQNCj4gPiBvdXQgYQ0KPiA+IHZlcnkgb2xkIGRpZmYgd2l0aCBhIGxvZyB0aGUgYmVz
dCBJIGNvdWxkIHJlbWVtYmVyLiBJIHJlY2FsbCBvdXINCj4gPiBjb252ZXJzYXRpb24gbm93IGFu
ZCBpaXJjIHdlIHNhaWQgdGhhdCBtYXliZSBhbiBpbnRlcmZhY2UgdGhyb3VnaA0KPiA+IGRybQ0K
PiA+IGF0b21pYyBjb2RlIHRvIGVuYWJsZS9kaXNhYmxlIHRoaXMgZXJyb3IgaXMgdGhlIHdheSB0
byBnbyBidXQgYWZ0ZXINCj4gPiBsb29raW5nIGF0IHRoaXMgYWdhaW4gSSdtIG5vdCBzdXJlLiBN
b3JlIGJlbG93Lg0KPiA+IA0KPiA+ID4gPiBhbmQgYSB3YXJuaW5nIGFib3V0IHRoZSB0aW1lIG91
dCBpcyBhZGRlZCB0byB0aGUga2VybmVsIGxvZy4NCj4gPiA+ID4gVGhlDQo+ID4gPiA+IHdhcm5p
bmcgaXMNCj4gPiA+ID4gaGFybWxlc3MgYmVjYXVzZSB0aGVyZSdzIGFub3RoZXIgZmxpcCBjb21p
bmcgcmlnaHQgYWZ0ZXIgYnV0IGl0DQo+ID4gPiA+IGNhbg0KPiA+ID4gPiBxdWlja2x5IGZpbGwg
dXANCj4gPiA+ID4gdGhlIGxvZywgZS5nLiBtaXNzaW5nIDIgZmxpcHMgZXZlcnkgc2Vjb25kIG92
ZXIgYSAyNCBob3VyIHNwYW4NCj4gPiA+ID4gd2lsbA0KPiA+ID4gPiBhZGQgYWJvdXQgMTcyIHRo
b3VzYW5kIGxpbmVzIHRvIHRoZSBsb2cuDQo+ID4gPiANCj4gPiA+IEFzIHdlIGRpc2N1c3NlZCBi
ZWZvcmUsIHdoaWxlIHRoaXMgbWlnaHQgYmUgdHJ1ZSBmb3IgdGhlIHZtd2dmeA0KPiA+ID4gZHJp
dmVyLA0KPiA+ID4gZm9yIG90aGVyIGRyaXZlcnMgdGhpcyBtZXNzYWdlIGluZGljYXRlcyB0aGF0
IGVpdGhlciB0aGUgR1BVDQo+ID4gPiBodW5nLCBvcg0KPiA+ID4gc29tZXRoaW5nIGVsc2Ugd2Vu
dCB3cm9uZyBzcGVjdGFjdWxhcmx5LiBBcyBzdWNoLCBJIHRoaW5rIHdlIGRvDQo+ID4gPiB3YW50
IHRvDQo+ID4gPiBzZWUgdGhlc2UgbWVzc2FnZXMgYnkgZGVmYXVsdCBmb3Igb3RoZXIgZHJpdmVy
cyBhdCBsZWFzdC4NCj4gPiANCj4gPiBJJ20gbm90IGdvaW5nIHRvIGFyZ3VlIGZvciBvciBhZ2Fp
bnN0IHRoYXQgYnV0IEkgYW0gY3VyaW91cyB3aGF0J3MNCj4gPiB0aGUNCj4gPiBwb2ludCBvZiB0
aGUgbWVzc2FnZS4gVGhlIG1lc3NhZ2UgaXMgYmFzaWNhbGx5IHNheWluZyAic29tZXRoaW5nDQo+
ID4gY291bGQNCj4gPiBwb3NzaWJseSBoYXZlIHdlbnQgdmVyeSB3cm9uZyIuIE9LLCB3aGF0J3Mg
bmV4dD8gRXNwZWNpYWxseSBpZg0KPiA+IHRoZXJlJ3MNCj4gPiBubyB2aXNpYmxlIHByb2JsZW1z
IGFuZCBpdCdzIG5vdCByZXByb2R1Y2libGUuIEV2ZW4gaWYgaXQgd291bGQgYmUNCj4gPiByZXBy
b2R1Y2libGUgdGhlcmUncyBub3RoaW5nIGFjdGlvbmFibGUgZnJvbSB0aGUgbWVzc2FnZSBpdHNl
bGYuIElmDQo+ID4gdGhlDQo+ID4gc3lzdGVtIGhhcyBubyBvdXRwdXQgY29ubmVjdGVkIGFuZCBu
byB1c2VycyBhcmUgY3VycmVudGx5IGxvZ2dlZCBpbg0KPiA+IGFuZA0KPiA+IHdlIG1pc3NlZCBh
IGZsaXAsIGRvZXMgaXQgbWF0dGVyPw0KPiANCj4gSSBkb24ndCB0aGluayB3YWl0aW5nIGZvciBh
IDEwIHNlY29uZCB0aW1lb3V0IGlzIHRoZSBhcHByb3ByaWF0ZQ0KPiBiZWhhdmlvdXIgaW4gdGhh
dCBjYXNlLiBXaGlsZSBhIEtNUyBDUlRDIGlzIGVuYWJsZWQsIHRoZSBkcml2ZXIgbmVlZHMNCj4g
dG8gbWFrZSBpdCB3b3JrLCBpbiB0aGUgd29yc3QgY2FzZSB2aWEgYSB0aW1lciB3aGljaCB0aWNr
cyBhdCB0aGUNCj4gQ1JUQyByZWZyZXNoIHJhdGUuDQoNCldoYXQgaWYgaXQgaXNuJ3QgYSBkcml2
ZXIgYnVnIGFuZCBpdCBqdXN0IHNvIGhhcHBlbnMgdGhhdCB2bXdnZnggaXMgdGhlDQpvbmx5IG9u
ZSB0aGF0J3MgcnVubmluZyBvbiBzb21lIHNwZWNpZmljIHN5c3RlbSB3aXRob3V0IGEgZGlzcGxh
eSBsb25nDQplbm91Z2g/IFdpdGhvdXQgYmVpbmcgYWJsZSB0byByZXByb2R1Y2UgaG93IHdvdWxk
IHlvdSBrbm93Pw0KDQo+IA0KPiBUaGUgZXJyb3IgbWVhbnMgdGhhdCBlaXRoZXI6DQo+IA0KPiAq
IEEgZmxpcCBhY3R1YWxseSBkaWRuJ3QgY29tcGxldGUgaW4gMTAgc2Vjb25kcy4NCj4gKiBUaGVy
ZSdzIHNvbWUga2luZCBvZiB0aW1lIHRyYWNraW5nIGlzc3VlIHdoaWNoIHJlc3VsdHMgaW4gdGhl
IHRpbWVyDQo+IGZpcmluZyBhZnRlciBsZXNzIHRoYW4gMTAgc2Vjb25kcyAob2YgdGhlIHN5c3Rl
bSBhY3R1YWxseSBydW5uaW5nKS4NCj4gDQo+IEVpdGhlciB3YXksIGl0J3MgYW4gaXNzdWUgd2hp
Y2ggc2hvdWxkIGJlIGZpeGVkIHJhdGhlciB0aGFuIGp1c3QNCj4gc3dlcHQgdW5kZXIgdGhlIHJ1
Zy4NCg0KV2l0aG91dCBiZWluZyBhYmxlIHRvIHJlcHJvZHVjZSBvciByZWFsbHkgY29uZmlybSB0
aGF0IGl0J3MgYW4gYWN0dWFsDQpwcm9ibGVtIGluIHZtd2dmeCBJJ20gZ29pbmcgdG8gbGVhdmUg
dGhpcyB0byB5b3UgdGhlbi4gSSdkIGJlIGhhcHB5IHRvDQpsb29rIGF0IGl0IGFnYWluIG9yIGhl
bHAgb3V0IGluIGFueSB3YXkgSSBjYW4gaWYgeW91IGZpbmQgYW55IHByb2JsZW1zDQp3ZSBjYW4g
ZG8gYW55dGhpbmcgYWJvdXQuDQoNCnoNCg0K
