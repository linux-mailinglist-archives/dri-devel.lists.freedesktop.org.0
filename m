Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 818CB7EDA90
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 05:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B7210E0B5;
	Thu, 16 Nov 2023 04:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11011004.outbound.protection.outlook.com [52.101.47.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568E710E0B5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 04:04:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8X1YInVCvKgnjwMxeMNzmjVM5LIY2jdYvF+PNnC5ATy6J0ZJTEDyJzwxnq7HyvcMwNDGHc3yQF0fY8Ts1vmV5HUP5GskrbN9EyaByJOM00bPParTQ8IiGQr1hDcAOU/VjcLMF7T3J79CdQWZgTOCK63OYrx+1ROlajXaV0J9lkvFt8FN7669UWcX9xmO187GBcJr/tcY/J2OTcd9bGBaHzjdV3hyAdVviDW5jCTypeAB6PLIBjM1N2zC6jVUDXyl2eCfrCctqip2ERHhcKndTx7Me2XZx8LDboSry8vVwbI4Bd9PwblhSyQGS88B2EnqARxcrXBAKwzhn7Ww4+GSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqOpWDpIjpz7JLEQs3en4srKYpI0tTJ0kmu/3j6aPv0=;
 b=R8SZEerQB5ekm4czvsTC+bBwrFBxlwvaDIOeYkN8y47hked+7ayGYnhGDbEHK1IeWas7yEDEwsLzKQbZeaAJ1iw3f4ZiCPLWgEiBT8afvcmZP0SlDfPg21w2Ztxudjogppx0FTecqvivio4Ut9KK1OnRRl9mZfLeNul0DPc9Pa3+UrVWCrhsczT9kyeTBmg6kT+kPIe2U3Io49Xfn+GM3pWM7cENJsHL3pwFsJxWc4Fixh0ropkC1bZpF4NP6O2XHFGDW63zzpf5ua1XOyLElpYLVsb/RU9aCHIQCK6ALhdL3IrL81OiFsXsPiuu4ZbA5X6lxYwxYqjS1tXW0Z1gzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqOpWDpIjpz7JLEQs3en4srKYpI0tTJ0kmu/3j6aPv0=;
 b=YIAoyq/88JXJQCqcroWqVbbWufLgi8D9+aw3bspuUDoo8CqTHQTZRFjti8mlOZ0/bwqEdaKeXolc5f8HeovvsyBfK5Zkqur6hZLs3xfkRrldK0H5YyeAwoK00wB/OV7+kg0ajaeV2k/El84BJSupABAH+BSBIImqBRzHbYl+FAk=
Received: from IA0PR05MB9832.namprd05.prod.outlook.com (2603:10b6:208:404::6)
 by LV3PR05MB10360.namprd05.prod.outlook.com (2603:10b6:408:1a3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 04:04:10 +0000
Received: from IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::7e24:8821:d736:fbb5]) by IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::7e24:8821:d736:fbb5%5]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 04:04:10 +0000
From: Zack Rusin <zackr@vmware.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "javierm@redhat.com" <javierm@redhat.com>
Subject: Re: [PATCH v2 0/5] drm: Allow the damage helpers to handle buffer
 damage
Thread-Topic: [PATCH v2 0/5] drm: Allow the damage helpers to handle buffer
 damage
Thread-Index: AQHaF8XhF3+4IU0LGkihWLK/H/28urB8VFkA
Date: Thu, 16 Nov 2023 04:04:09 +0000
Message-ID: <a16a61582f90a5b490fb7681b44864a4801c830a.camel@vmware.com>
References: <20231115131549.2191589-1-javierm@redhat.com>
In-Reply-To: <20231115131549.2191589-1-javierm@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR05MB9832:EE_|LV3PR05MB10360:EE_
x-ms-office365-filtering-correlation-id: 99742fab-e917-4742-1eb1-08dbe6591611
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CmXhMANAiAHuQngj7l0C/d0N4E7kjxNV84l2NfbkkVxCu7TZ5rW7fuXHV6qbyffBaFAN+o8AEEPjvA+wx84yAwcNRcLQVle1ENgqTpLHx1tImS2xAxSTPWCC0L2DTN2w9+I5mlALqAskfQUvDev/a3eJFN1IoXmIkAvWHJlxqQ/WNH/DEYj2O2qQiG3WgqPQRs/FofABT5KS2vpEl7VHxOp3ubX8+QboS1Oj23NhoGlZCniuQozxRV8Kow25KYdDQVXku/lDX6xWhqnkcDO/b8PfYDpdFUBirjmNPmHWL/cIDsKNveE7xuLFrA1kpmAjN28ZaMR02cMp6B6zykShdSC2KozLjvcPw2QigXTXF/cYW2K4qxAoFxBRev24uNvjLUdurNjzmX3/ApHlxlk9WG9tUbRN4fCE8z7Nfo2SMXw0BLl+iXbjF5UbA5hUg6xQV2saQcaLWRvVLYyYiPSqwQcpnxjw+nSapJiwxT9mLPZD1j3BZGgMdJdVlWtuFBKSyr+sIVZWbazPy+I3SN7VcYqveEoFeA99W8UspyI0SRt57a7H9oppv9A9ZJQmF+yhSSNmqu+uoREwgFogixTiPpku3RzkUAqylz/ZIDVE/Xb+2DZTixNizEYpJCLQuMGPhU9M2cN4ZCuPi4wuv+5SahbvMul28+pgdwct6SZpohOtxUXs8zedUwxVFF8/tuqT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR05MB9832.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(4001150100001)(122000001)(2906002)(38100700002)(86362001)(7416002)(5660300002)(4326008)(8676002)(8936002)(41300700001)(83380400001)(2616005)(76116006)(66946007)(316002)(36756003)(91956017)(110136005)(66556008)(54906003)(6512007)(26005)(64756008)(66446008)(66476007)(6506007)(45080400002)(71200400001)(6486002)(478600001)(38070700009)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnFEeTNOSEpXWXVxaHZCWS92UGxuTkdoMS84azNpRzB5LzBycXluZGExMFV1?=
 =?utf-8?B?VUd1eS9WZGZlUjE4eWZkT1VvRUJRUXArVFdmZXQzQ1h1QzI2eWVsMTB4TEE4?=
 =?utf-8?B?WDQ0V3NjS2p3YXcwSDUwMTY0RFo0TmVydzV1a3h0aXVLUW4zOWRWdjhxaGcr?=
 =?utf-8?B?WWdka1VrQy9rcWZUM2diRTBRYThXRzQ4dXdGWGZuRUtrS3lHVVd0ZS84aTdz?=
 =?utf-8?B?Q3RNVEMzK3Y1UmVDeVdEcldhM0htQW1BMWxXQ04zQVEwMklGZWRlSStlSnR1?=
 =?utf-8?B?VkZFQmIwa3RCZWFwd2tzZjBMZDFqSmZ0RVpIdmYvbGJCZGhLNGltTCs1WUdG?=
 =?utf-8?B?bmRLQ0VoaDVRQzNDU3k3dWE2bE9KVnlzTWJONFFXQWpoZnRKVkdodGpYNGdM?=
 =?utf-8?B?bGJwOFhadjVMUXd4QmJORlM0d0dnblJ4L1hiQ1RnSFV0WVVwb3NKcHlGdlB5?=
 =?utf-8?B?QzBWYmpPcVhIcDdHd09ORTZ5V1Z6QTViUnBiN08zVEp2THBnWms1TjhCMXli?=
 =?utf-8?B?b3dtUS9VVUo4YmlGQTE0b3RXWlRVUGtMVDdqbXRTdWZra2ZKeVpxUkxJMVRJ?=
 =?utf-8?B?WjV1bTBRRE14REtKRUQxQ2hCT2J4YjUyWFBOMTlFeFl4RmtrZTRCTjloRWFh?=
 =?utf-8?B?ZXljQjhua212dnczdU8wb1FBUVNOdE1OclNkY01Ca3BMeVdreEQ1aE9LS1ox?=
 =?utf-8?B?KzE0NlBqMTNJMEQ5QkQvNzg0T2JKbjd1SHY5bkxTbHhiVmNJYjFSbVFnbkR3?=
 =?utf-8?B?UkdEd0dYejlqcmlGRWQ0bXpqVjBCZlVJcnRjdDJCdkxNZzVVSEM0UW12S3BX?=
 =?utf-8?B?Mi9tVTdJdm1WVXRyRkxhVlp1RHFGR1dnTktXempyRGVmWjQ1WDk3TFpscXUr?=
 =?utf-8?B?WjVMYjhKNEI5UUFZdmN0QjF6VDZnckozQ2QxZzhMN0ZKVEhRa0E3M05DdEd3?=
 =?utf-8?B?TnBYelhBNzZDd2xvdVJxRzNCNTNLYTl4c3BEVXhUcXpjVWduU3lhYldMbnk3?=
 =?utf-8?B?Q2hTdWpSb0l6V0ZldzdQUjJSaU9RS29UdktmRGxBZ2pRR1dhbzJEQ1AzUFl4?=
 =?utf-8?B?VEFlanlqcERkNXRjNlVzMlBXNEtnazRMOHJ4ak5xOGtvWnpYVkZZRkwrVjhU?=
 =?utf-8?B?R0Y4bnphTkZxZXlLM0Y2UVBIZTNGT3c4dEJmdnUxaHhBMGduWVQzREV2WjM1?=
 =?utf-8?B?ZndYay9FRGlVZHNXdDkyRmU1U0pFbG5oUks2MGlkSVJLSDVXeEh2ODZtVVA4?=
 =?utf-8?B?K2Ryb2J5WVBWZGgva1RMYW9BWTdCUHZZU3I5M1F4NFNtYUd1UjZhT0M5c0Nh?=
 =?utf-8?B?ZDVjLzZ4UzJ5L2NGWEpJakpUTnVEbjVCRC9XVFBTK1R5UGhUeFRXV04ycTZy?=
 =?utf-8?B?KzJoT2J0bStNQ01YUUM5cGRDcmRpQkVLNGRmSnlvZ0kxK2NGNWlBVm1hS3Zz?=
 =?utf-8?B?NXVvYm1Pekp5STFXNEFLSG93YmV2aklqNkQyU0ZDeUltY012VEdodDdVV0pq?=
 =?utf-8?B?RjZxV2Q2RElLemJmVUFyOVJYNlRvb0cvWStqblBMSEQzcjIzQWtsdnRQUUNJ?=
 =?utf-8?B?QmFqQlpPK2cydzY5eU1XdVdSUWRMOElXWUN1MnVxQ29DeHpVdHlyUkcwVmNH?=
 =?utf-8?B?YVIxVmNLc3JIMW14OU9RRFhuT2VCRm04ckxsSWJaU0Nka1ZRdlVxZzdnSnlP?=
 =?utf-8?B?VHJJUVZnZWRVQ2NldWNNSDh2d3VhdXFmZDVoTUNFQm9ndnJSbmd0UzdUZkNy?=
 =?utf-8?B?MDBtY29sNWl1ZnhESUs3V2RieFZGZnQyWUJ0alYzZVhST3l5alVsaWhNU0d0?=
 =?utf-8?B?aUFxVWNQMkdLVUxFb1BYTDNCV04ySURPS01oQW9JbmZ2U3hsaENUUXZ3M2p1?=
 =?utf-8?B?TFNyRmNEblJhQjNNV295bTVPTEdTZW5neWVqQTRGc0dUZVhYNmZxdHFWMWpF?=
 =?utf-8?B?TndKaStlTnlGM3JNRTh6SkdZRmRucVp6eE96TzlwQnVsbXlVRGdTQTNHTnlU?=
 =?utf-8?B?SDNZeklBcHRIMCsveTFLUGFpOFVRYVNTYXBydzJiQnlCNjJweVBPNDVvaktk?=
 =?utf-8?B?VFhqMi81SGYrNDdlMHI0UWNoZkRMQzlqUGF1UzdkWEZZSHdQREloMTVHbi81?=
 =?utf-8?Q?203ZdRWz4IccKRriWOkIE4iaX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE4AC92E6A156B45A6ECB149BA68232D@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR05MB9832.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99742fab-e917-4742-1eb1-08dbe6591611
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 04:04:09.9243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q8vrMbtPnsKVMnnmwsRnflDHZHsj/VV2UqIAdDLYoNlXPw4V1KX3zoVua019bEyILMjdSognzfUtXIV1relfNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR05MB10360
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

T24gV2VkLCAyMDIzLTExLTE1IGF0IDE0OjE1ICswMTAwLCBKYXZpZXIgTWFydGluZXogQ2FuaWxs
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
bGFuZSB1cGRhdGUgKHBhZ2UtZmxpcCkuDQo+DQo+IEl0IGlzIGEgdjIgdGhhdCBhZGRyZXNzZXMg
aXNzdWVzIHBvaW50ZWQgb3V0IGJ5IFRob21hcyBaaW1tZXJtYW5uIGluIHYxOg0KPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAyMy1Ob3ZlbWJlci80
MzAxMzguaHRtbA0KPg0KPiBQYXRjaCAjMSBhZGRzIGEgaWdub3JlX2RhbWFnZV9jbGlwcyBmaWVs
ZCB0byBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlIHRvIGJlDQo+IHNldCBieSBkcml2ZXJzIHRoYXQg
d2FudCB0aGUgZGFtYWdlIGhlbHBlcnMgdG8gaWdub3JlIHRoZSBkYW1hZ2UgY2xpcHMuDQo+DQo+
IFBhdGNoICMyIGZpeGVzIHRoZSB2aXJ0aW8tZ3B1IGRhbWFnZSBoYW5kbGluZyBsb2dpYyBieSBh
c2tpbmcgdGhlIGRhbWFnZQ0KPiBoZWxwZXIgdG8gaWdub3JlIHRoZSBkYW1hZ2UgY2xpcHMgaWYg
dGhlIGZyYW1lYnVmZmVyIGF0dGFjaGVkIHRvIGEgcGxhbmUNCj4gaGFzIGNoYW5nZWQgc2luY2Ug
dGhlIGxhc3QgcGFnZS1mbGlwLg0KPg0KPiBQYXRjaCAjMyBkb2VzIHRoZSBzYW1lIGJ1dCBmb3Ig
dGhlIHZtd2dmeCBkcml2ZXIgdGhhdCBhbHNvIG5lZWRzIHRvIGhhbmRsZQ0KPiBidWZmZXIgZGFt
YWdlIGFuZCBzaG91bGQgaGF2ZSB0aGUgc2FtZSBpc3N1ZSAoYWx0aG91Z2ggSSBoYXZlbid0IHRl
c3RlZCBpdA0KPiBkdWUgbm90IGhhdmluZyBhIFZNV2FyZSBzZXR1cCkuDQo+DQo+IFBhdGNoICM0
IGFkZHMgdG8gdGhlIEtNUyBkYW1hZ2UgdHJhY2tpbmcga2VybmVsLWRvYyBzb21lIHBhcmFncmFw
aHMgYWJvdXQNCj4gZGFtYWdlIHRyYWNraW5nIHR5cGVzIGFuZCByZWZlcmVuY2VzIHRvIGxpbmtz
IHRoYXQgZXhwbGFpbiBmcmFtZSBkYW1hZ2UgdnMNCj4gYnVmZmVyIGRhbWFnZS4NCj4NCj4gRmlu
YWxseSBwYXRjaCAjNSBhZGRzIGFuIGl0ZW0gdG8gdGhlIERSTSB0b2RvLCBhYm91dCB0aGUgbmVl
ZCB0byBpbXBsZW1lbnQNCj4gc29tZSBidWZmZXIgZGFtYWdlIGFjY3VtdWxhdGlvbiBhbGdvcml0
aG0gaW5zdGVhZCBvZiBqdXN0IGRvaW5nIGZ1bGwgcGxhbmUNCj4gdXBkYXRlcyBpbiB0aGlzIGNh
c2UuDQo+DQo+IEJlY2F1c2UgY29tbWl0IDAxZjA1OTQwYTlhNyBsYW5kZWQgaW4gdjYuNCwgdGhl
IGZpcnN0IDIgcGF0Y2hlcyBhcmUgbWFya2VkDQo+IGFzIEZpeGVzIGFuZCBDYyBzdGFibGUuDQo+
DQo+IEkndmUgdGVzdGVkIHRoaXMgb24gYSBWTSB3aXRoIHdlc3Rvbiwgd2FzIGFibGUgdG8gcmVw
cm9kdWNlIHRoZSBpc3N1ZQ0KPiByZXBvcnRlZCBhbmQgdGhlIHBhdGNoZXMgZGlkIGZpeCB0aGUg
cHJvYmxlbS4NCj4NCj4gQmVzdCByZWdhcmRzLA0KPiBKYXZpZXINCj4NCj4gQ2hhbmdlcyBpbiB2
MjoNCj4gLSBBZGQgYSBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlIC5pZ25vcmVfZGFtYWdlX2NsaXBz
IHRvIHNldCBpbiB0aGUgcGxhbmUncw0KPiAgIC5hdG9taWNfY2hlY2ssIGluc3RlYWQgb2YgaGF2
aW5nIGRpZmZlcmVudCBoZWxwZXJzIChUaG9tYXMgWmltbWVybWFubikuDQo+IC0gU2V0IHN0cnVj
dCBkcm1fcGxhbmVfc3RhdGUgLmlnbm9yZV9kYW1hZ2VfY2xpcHMgaW4gdmlydGlvLWdwdSBwbGFu
ZSdzDQo+ICAgLmF0b21pY19jaGVjayBpbnN0ZWFkIG9mIHVzaW5nIGEgZGlmZmVyZW50IGhlbHBl
cnMgKFRob21hcyBaaW1tZXJtYW5uKS4NCj4gLSBTZXQgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAu
aWdub3JlX2RhbWFnZV9jbGlwcyBpbiB2bXdnZnggcGxhbmUncw0KPiAgIC5hdG9taWNfY2hlY2sg
aW5zdGVhZCBvZiB1c2luZyBhIGRpZmZlcmVudCBoZWxwZXJzIChUaG9tYXMgWmltbWVybWFubiku
DQoNClRoZSBzZXJpZXMgbG9va3MgZ29vZCB0byBtZSwgdGhhbmtzIGZvciB0YWNrbGluZyB0aGlz
LiBJJ20gc3VycHJpc2VkIHRoYXQgd2UgZG9uJ3QNCmhhdmUgYW55IElHVCB0ZXN0cyBmb3IgdGhp
cy4gU2VlbXMgbGlrZSBpdCBzaG91bGRuJ3QgYmUgdG9vIGhhcmQgdG8gdGVzdCBpdCBpbiBhDQpn
ZW5lcmljIHdheSB3aXRoIGp1c3QgYSBjb3VwbGUgb2YgZHVtYiBidWZmZXJzLg0KDQp6DQo=
