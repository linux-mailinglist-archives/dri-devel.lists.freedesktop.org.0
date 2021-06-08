Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDD639F49B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 13:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBBB6E131;
	Tue,  8 Jun 2021 11:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2056.outbound.protection.outlook.com [40.107.101.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0E06E131
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 11:05:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjwJSSM+DBLd3fuPQ/X3YnpBETcoZVj1BLYwZRKz7LV2cdPpqGHgadXbZWOs3RRl1VYbP3nMQSLQPpJ7X6effIgEf7bzgbZJzSvavkYOCkBY/SCnt11nuArBj4PPfMSCpe13JR9d2ODGZT3O5wN3ol5+zTDdhSG1kYwg+uS9YWOdGVdf2FNkZSiiz6zPfRE5teb2fQKxA3xq7dQ3k6poLmKc8+drPUS79w8Ut8q3LgRUQHDcQ4fTgVwES4f/bq5vOKRIT8Jw9chloLcFRsI2ADtccHlnltZNXwigXQD1mkZSr72Fbx2yNfiFu2isSzpyZRAVeU2Bn4bMMIRR9cn8gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1C+MOoPzFHHByr/Cy7gdFtWCgZ8x4UXGMXoroLGoJg=;
 b=jmWaGPAEnO/aMDWofFi+LjmuuSLTUW+5nlVb9kWC5jO7JrNNAJZbswxDtRhtsBP4UAX2r0TLtKD7CfyM7+kft/VnBnmD7bbP2yJ8y75lcc3VQjWm/oFZvwDOSBTcKjxpSBn9VUU+FmCFgx9PjjhNBCbcV4z2lGhgIunpj6o8KvvtJP1G/Ley0st9tNZDqo/1mLS1H+Z+05ZXrS1EQeulRoZOV6kxdgzVJmgKnmPRm3PipLHJSPwj1bJ2Bn3829VIOKJlrAORxJ+utYkF87IgdwFpSg/C5oEWruesOSfDIQg70h2Bx78ON+iU2j8rjMwnarrPICY+BN/tQhIA23oMkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1C+MOoPzFHHByr/Cy7gdFtWCgZ8x4UXGMXoroLGoJg=;
 b=jdYwdr4uJYjlo5HKbYJ0HGngIPYvXh40XEqvHhQdqyon+mBDh6yDE2A3bq4ywXobGhudU1QIWwrCYbHBQjgQtae8ldYRbXV1iNGJT3C3i/TFjbCCaM5QUscERcdgFO2djzL72BfR/Ejyw6qoiOuCcQwtYQ4jGLDYhuwb3sI4DYA=
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MW2PR12MB2522.namprd12.prod.outlook.com (2603:10b6:907:f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Tue, 8 Jun
 2021 11:05:51 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::f07c:dc0f:e7e8:416c]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::f07c:dc0f:e7e8:416c%4]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 11:05:51 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Das, Nirmoy" <Nirmoy.Das@amd.com>
Subject: RE: [PATCH] drm/ttm: fix deref of bo->ttm without holding the lock v2
Thread-Topic: [PATCH] drm/ttm: fix deref of bo->ttm without holding the lock v2
Thread-Index: AQHXU8F6/0L3kgI9dUig1glZkYsD7qr43R6AgA+zR4CAAXR7YA==
Date: Tue, 8 Jun 2021 11:05:51 +0000
Message-ID: <MWHPR12MB12487CBA517FDAA83AF470FAEC379@MWHPR12MB1248.namprd12.prod.outlook.com>
References: <20210528130041.1683-1-christian.koenig@amd.com>
 <aa17b7d5-1c44-4d2b-431f-5f361481f039@linux.intel.com>
 <279b72f6-cf27-c1bb-370e-a04348387105@gmail.com>
In-Reply-To: <279b72f6-cf27-c1bb-370e-a04348387105@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.134.244]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef76558b-0cdd-446e-8d00-08d92a6d6113
x-ms-traffictypediagnostic: MW2PR12MB2522:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR12MB2522255580535E7EA237E8BBEC379@MW2PR12MB2522.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DWGgMGwOyRB+A91+uj4OLUWo6a7jdcj/BaD9WzHdYykNfYHZ91KbD5KTqgIOTW1mVEFAMhiBZsuEqu3bFGoq0rJLRd4R9G0Vzr2j3lsNkDcFNOs/y1sj4ES2km/zWhGzwKNYCIITePA7lOWvLUxRjM08ozrFUubr+vWVbLTAn+dbWHRQwKBq9tgR1Ndo6oa3BsWjyWBoLCW/3oQhgSAgedq4sVTHgWgu6PIfRcsaxFsPunRaTTcoIE0N8/WiO93OJCDwsZ7m9Kg6rIOytVkvBjaXKaVrUnUO4YT8V/CbDNGGAsmerd6IoaubYT3wEyRN4YsRKrI9skqWUW349kiVLu5yxY6HSLWzCw0EaEw/W1I3jMzRRijw6vCtj2E2I9p0WkQuhyghp2B1nnQ8nEaLwbs0Q+m7DL+937LcHtff9A6HXUqnm49IRh2nDeKHK0iT6lYCMheNTMIPYYPxEodIlbobZA5Gwu3dpIbCQSeGAGbcB6GytAdlNEoL7+yWT/VlW0alXjpXyD8Gpcuudkrn/MDz12hgXW57XM9pIYJYrGMqvcAmZoK5Y6ZPDh2Bv10XiDBKVvlFPkAi2vm9CrAGOjBQgZGH5a1JYM8HyY4SPks=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(86362001)(6636002)(2906002)(9686003)(55016002)(8676002)(7696005)(33656002)(38100700002)(6506007)(53546011)(5660300002)(52536014)(186003)(66574015)(122000001)(66476007)(71200400001)(76116006)(316002)(66556008)(64756008)(66946007)(110136005)(4326008)(66446008)(478600001)(8936002)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlJyN1J1RXUzdEdyTXYrMjBJaklnVGlOaGRFbXlhUlJuWXJFS0tYNDBNdkJN?=
 =?utf-8?B?SlNkeXQvbUpKaTFRSVBJNkVJanVwdzgzVFJKQXozTFJKNlFqTS9GaC9NUy9h?=
 =?utf-8?B?Smt5TTh4RnBscVBROWc3cm1tSDA0Q2U3TUZ2cktNSUhiNjdNd0pjdkRmbENt?=
 =?utf-8?B?QmdhSmxqMlhYSTFLaGgyWGpLcHhaWWFxRlg1Y3UxMEU3NzEwcW5xUU4rV1cx?=
 =?utf-8?B?LzdOMC96OGxySnhRQWFLMzM0bC9rQmZyL3ZjWVlJSkp0b0lOZGZlMm5QSWhW?=
 =?utf-8?B?M0NRN0p2MFpwaTRoRFhwVkZtVElwMjUrdVcwV0RLclEwa2tRNWN1bFBqU3Ra?=
 =?utf-8?B?ZGVrTHFVSFBOeHdxdlRsS1VFWHJMUDdjRWdNWTJsN1hQbFc1Slhha1VOQkNw?=
 =?utf-8?B?ZDZvTm5YMlVvY21ZU2htQm9Eem1nZHF6T0pyOFROMjVzb1pwN1lmcXJsYUNB?=
 =?utf-8?B?c2czUFExZlgyZVVVUWkyOGhuN0dEeHA2ZzAwakRSaU40N1FIMVZsMy8xaXhY?=
 =?utf-8?B?RTJnZVg5MDRYUDc2NXRadkhuMEhXSUVxWkRMdU41UEswQzFFOTRBa0h3ZDk4?=
 =?utf-8?B?ZTljQ1plVXdhYmpCQWQ3WTRGQmhtWFJlR2VLRGlERjVZV1h6b3YzNitnNmlK?=
 =?utf-8?B?clQ0K2lNM3pyb2ZYbkRYMUtQdXdreFpMVWhZcWpDeko2WXlDMjhqNVlBVFhS?=
 =?utf-8?B?cWNoODc1L0M3b3RsM3Npc1lUZ2RlbzNRVmdURHlqRFJ6YzNEelZUSmdrS2tB?=
 =?utf-8?B?Q2JTTi82ODRvQnhObzRlZkZYaFNJYTh1RDBSdkZTcXJUOTdVQ1h3c25UREF6?=
 =?utf-8?B?QmtEbTRrUE5jN3NIdk50UWFPS1JMa2VRTVp6bzI0Tk5JZDdLWWpKU2NZYlVv?=
 =?utf-8?B?YWJ4ZThKNTFFRDdlTUk3MU85WGdwV3pOSTNTYjI3WkRINnRTZmMvMThMbVVX?=
 =?utf-8?B?bmVmT05UMW00SmZpczYxbmZBSHRZNDRnaTc5NkNxWXV2Ri9XR1ZJS2p0ZVNO?=
 =?utf-8?B?L0xmY1NTSkZQaWNrN1lQengwaENHL1orTDcvRFNadmUxcDNSeGVxbjBZMUNj?=
 =?utf-8?B?eVlpenhGdGlMeTJnOUN4eG16blQwR0J1THdVRjBodU5JTWNOY3lCdmF4WHZu?=
 =?utf-8?B?ZHdxK0UzdTQ1bGpmeEN4NkFDSHBMRmM5NGx5MHdCZW8yWUhJZFdkYW5tQlhE?=
 =?utf-8?B?OEVFMVFYR2YrZ1Nva3RLNkl1UE9mV0k4RU5JSkE1c2JTNE5sa3U1SEVyUGU3?=
 =?utf-8?B?OG9FNmFMd3cxK1ZJU3RJcjlXMkxFcmtValVoMHpEYmJiMzAxYlNNT29tVnpw?=
 =?utf-8?B?SlpaWWl4MjY0dHBzQVpmRERqTzVqbkgzUlg4OW4rSmIvZHNJc0ZLcXByeFlI?=
 =?utf-8?B?akRkRVVoM2VjOW10S1lqdnYwUUNuaDdXUTBwSXlkS2pYam4reDdxRGZ0TWd5?=
 =?utf-8?B?SUJtazZESmlVUU1xaEpwZ2RMbFk5N1lDdnlxVG5hQytFSGNhRGNFeDFqajBG?=
 =?utf-8?B?ZkcxVDdqajR4VkZILyt5TGU4WXNEbm9ZWkgwREdKR0E2ZWJHVnhRT1hDVGJJ?=
 =?utf-8?B?Qit5MVdPYnF1YWJWL200TVg0MmtvR1g3TlRxODN4V3VPMXgrVEVHK0s4ZFlS?=
 =?utf-8?B?bWF1Z1FTS3A3bGRUbjB1aWF3bXNKVmFIM2dKNkdFVno1RFpNUXhUVWMrUThI?=
 =?utf-8?B?WS9rd0xaK2dXVVVmVlBwUkhUL1BYSVJWM0lRNWNxQi9CdDBRZml4OFR2c0VP?=
 =?utf-8?Q?uJ+6/E4LJWRtecW+xe//oCDGQXaWZCJFfsEuzlk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef76558b-0cdd-446e-8d00-08d92a6d6113
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 11:05:51.6759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EXedw2Gai146cxj5DrTMs4yMR15lLx1vf7WYzK7VCLz3jkC7yCeJmKPgCAcvyunettwI9le3MPfrbiH8yEIXGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2522
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
Cc: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCBmb3IgbWUuDQoNClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0Bh
bWQuY29tPg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IA0KU2VudDogTW9uZGF5LCBK
dW5lIDcsIDIwMjEgODo1MiBQTQ0KVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+OyBEYXMsIE5pcm1veSA8TmlybW95LkRh
c0BhbWQuY29tPjsgSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+DQpDYzogVGhvbWFzIEhl
bGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KU3ViamVjdDogUmU6
IFtQQVRDSF0gZHJtL3R0bTogZml4IGRlcmVmIG9mIGJvLT50dG0gd2l0aG91dCBob2xkaW5nIHRo
ZSBsb2NrIHYyDQoNCg0KDQpBbSAyOC4wNS4yMSB1bSAxNTowNiBzY2hyaWViIFRob21hcyBIZWxs
c3Ryw7ZtOg0KPg0KPiBPbiA1LzI4LzIxIDM6MDAgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6
DQo+PiBXZSBuZWVkIHRvIGdyYWIgdGhlIHJlc3YgbG9jayBmaXJzdCBiZWZvcmUgZG9pbmcgdGhh
dCBjaGVjay4NCj4+DQo+PiB2MiAoY2hrKTogc2ltcGxpZnkgdGhlIGNoYW5nZSBmb3IgLWZpeGVz
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5o
ZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPg0KPiBIbW0sIE9LLCBidXQgdGhpcyBkb2Vzbid0
IGZpeCB0aGUgc3dhcHBlZC1iby1ub3Qtb24tbHJ1IGFuZCANCj4gdW5wb3B1bGF0aW5nIGZyb20g
c3dhcF9ub3RpZnkgaXNzdWVzLiBBcmUgeW91IHBsYW5uaW5nIGEgZm9sbG93IHVwIA0KPiBwYXRj
aCBmb3IgdGhvc2U/DQoNCkFzIGRpc2N1c3NlZCBpbiBhIHNlcGFyYXRlIHRocmVhZCB0aGlzIG5l
ZWRzIHRvIGJlIGFwcGxpZWQgYXMgbmVlZGVkIHdoZW4gdGhlIERHMSBicmFuY2ggaXMgbWVyZ2Vk
Lg0KDQpYaW5odWksIE5pcm1veSwgUnVpIGNhbiBhbnlib2R5IGdpdmUgYmUgYW4gcmIvYWIgc28g
dGhhdCBJIGNhbiBwdXNoIHRoaXM/DQoNClRoYW5rcywNCkNocmlzdGlhbi4NCg0KPg0KPiBUaGFu
a3MsDQo+DQo+IFRob21hcw0KPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jwqDCoMKgwqAgfCA1ICsrKystDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9k
ZXZpY2UuYyB8IDggKy0tLS0tLS0NCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGluZGV4IGNm
ZDBiOTI5MjM5Ny4uZWJjZmZlNzk0YWRiIA0KPj4gMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
DQo+PiBAQCAtMTE3Miw3ICsxMTcyLDEwIEBAIGludCB0dG1fYm9fc3dhcG91dChzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgDQo+PiAqYm8sIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4LA0K
Pj4gwqDCoMKgwqDCoCBpZiAoIXR0bV9ib19ldmljdF9zd2Fwb3V0X2FsbG93YWJsZShibywgY3R4
LCAmbG9ja2VkLCBOVUxMKSkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVCVVNZOw0K
Pj4gwqAgLcKgwqDCoCBpZiAoIXR0bV9ib19nZXRfdW5sZXNzX3plcm8oYm8pKSB7DQo+PiArwqDC
oMKgIGlmICghYm8tPnR0bSB8fCAhdHRtX3R0X2lzX3BvcHVsYXRlZChiby0+dHRtKSB8fA0KPj4g
K8KgwqDCoMKgwqDCoMKgIGJvLT50dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFHRV9GTEFHX1NHIHx8
DQo+PiArwqDCoMKgwqDCoMKgwqAgYm8tPnR0bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdf
U1dBUFBFRCB8fA0KPj4gK8KgwqDCoMKgwqDCoMKgICF0dG1fYm9fZ2V0X3VubGVzc196ZXJvKGJv
KSkgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChsb2NrZWQpDQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkbWFfcmVzdl91bmxvY2soYm8tPmJhc2UucmVzdik7DQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIC1FQlVTWTsNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9kZXZpY2UuYw0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9kZXZpY2Uu
Yw0KPj4gaW5kZXggYTFkY2Y3ZDU1YzkwLi4zZDljNjJiOTNlMjkgMTAwNjQ0DQo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9kZXZpY2UuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fZGV2aWNlLmMNCj4+IEBAIC0xNDMsMTQgKzE0Myw4IEBAIGludCB0dG1fZGV2aWNl
X3N3YXBvdXQoc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYsIA0KPj4gc3RydWN0IHR0bV9vcGVyYXRp
b25fY3R4ICpjdHgsDQo+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChqID0gMDsgaiA8IFRU
TV9NQVhfQk9fUFJJT1JJVFk7ICsraikgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bGlzdF9mb3JfZWFjaF9lbnRyeShibywgJm1hbi0+bHJ1W2pdLCBscnUpIHsNCj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3QgbnVtX3BhZ2VzOw0KPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50MzJfdCBudW1fcGFnZXMgPSBQRk5fVVAoYm8tPmJh
c2Uuc2l6ZSk7DQo+PiDCoCAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghYm8t
PnR0bSB8fCAhdHRtX3R0X2lzX3BvcHVsYXRlZChiby0+dHRtKSB8fA0KPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvLT50dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFH
RV9GTEFHX1NHIHx8DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Ym8tPnR0bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU1dBUFBFRCkNCj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsNCj4+IC0NCj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnVtX3BhZ2VzID0gYm8tPnR0bS0+bnVtX3BhZ2Vz
Ow0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSB0dG1fYm9fc3dh
cG91dChibywgY3R4LCBnZnBfZmxhZ3MpOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAvKiB0dG1fYm9fc3dhcG91dCBoYXMgZHJvcHBlZCB0aGUgbHJ1X2xvY2sgKi8NCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFyZXQpDQoNCg==
