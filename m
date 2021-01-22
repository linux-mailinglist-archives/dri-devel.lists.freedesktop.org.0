Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7BD30143B
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jan 2021 10:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F46F6E167;
	Sat, 23 Jan 2021 09:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F606E9F6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 14:29:24 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10METMJZ093282;
 Fri, 22 Jan 2021 14:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=g0QuitolDljZfbBvlVxSLx1B37DZ0uNAmWAKjYyHWHU=;
 b=oKMWolquiNGb3Zq/yDzTf9B6b8RerCyrcz8nzG7vUbNcey69V7WTD2xv2dknu8njYxD8
 m1KwPB8oITy3I3MbDjWyzAmdUgknULeZymBTnIcxso/ChnKG0pYFvZwwXVgfjupABYCY
 AqPz3LkjoOoIpaCUoyTzzuGY5IDCxBOW3seAFSpY7pQoa4JAjmCEiSoFL/Jb+cRLUxOw
 cJJeKnGyrLk4qDfpAx3uqyJYJvmXBZ+PyrGTftRQLXV0iDSIMEDsMHZTf1kwJnMwavIZ
 eo+vS0TxwvlIDStrHoN9YMFbmM+kifPlRboycfQxh3AeUurSoi48tVr4g96q/juSKQ2a ZQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 3668qrmabg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 14:29:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MEQ7xD061012;
 Fri, 22 Jan 2021 14:27:21 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2059.outbound.protection.outlook.com [104.47.37.59])
 by aserp3020.oracle.com with ESMTP id 3668rhntsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 14:27:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewMhhzWEDxr9zC2+bN69uo+kPJ293hMFEp86t+eMPXKelDG9oekgF+7AwNKjyA+4D7lVcbgy09tXjkou6iPlm+qs8BFRtdoFZobfyb2xJFwQHYyq/n3sEubFYhnuf3LHszfK98eUddCtsdJh8DvuyUslq4LIXxb41mD9oWKhMX1dLHXQGWxC89pT9JmFZOeAUm8KUBp+vnWKZ4TGP3Iqp5BD9kQ3JyLDfpFGgnnIFImn0PCx8YbY3cYWz24i3j6LttLp45GR4lM5t+07Hc4Q2umJtZYkJhBrxF0bbHE+yJhmBrFVS6+mSUiHJO0u1YlnLCUZ0sgLWpyEEHD4T7CheQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0QuitolDljZfbBvlVxSLx1B37DZ0uNAmWAKjYyHWHU=;
 b=Ym5LlDm3Gh4TtItbC5GanGLnSrnFdhQMtOj13U0JYO8JIpUN5Uwu+H18g4CxZOh+TsV62s7qYtO1r/RLtX0uAaPA/PSo8quyL/1+ff1QBJytg6qTcwQl1+3J4/EyGzvQ9ncbhA5GP4XPX5qe/oJFORPn5iKZPNu5BJsitF2lrVDiOXUk6h9jxBaaxqkMwl2R+JutERsoQ8qAWXxBuTJZsP9qPAbM/VWP3tiFIeUPJqYXJoF8Qg28ueX+j6ho6Bv7E+kg71aspA06Glwl3gitirf1OwsrjHaENtPw15+TTKQekalhrzBH6946w+KfE3piMgG2jh4mLf30DeNpTjzaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0QuitolDljZfbBvlVxSLx1B37DZ0uNAmWAKjYyHWHU=;
 b=lCu8JqrZiAQ5g8RNK3D5VVtNs+czODrOw7Ltv/GawSvkS9ocJ5uNh/r6Th9V2vxrxcWwbXeaUEqOZ81uh93gPyJ4eWy80JUGf/tv4MdQ87TQqTjFrJuGqp2IPAWTYTt4QTcObrGqZ8/UkMJMEtcJJPCKRU7/YUSgok4aI8bpKqw=
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
 by BY5PR10MB4049.namprd10.prod.outlook.com (2603:10b6:a03:1b2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Fri, 22 Jan
 2021 14:27:19 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::6da8:6d28:b83:702b]) by SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::6da8:6d28:b83:702b%4]) with mapi id 15.20.3784.015; Fri, 22 Jan 2021
 14:27:19 +0000
From: Chuck Lever <chuck.lever@oracle.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: possible IO map leak in drm/gem
Thread-Topic: possible IO map leak in drm/gem
Thread-Index: AQHW8AK5GbeC5YWAi0OD1HsTLRIw3qoyKM2AgAAE9QCAAYeXgA==
Date: Fri, 22 Jan 2021 14:27:18 +0000
Message-ID: <49ED0F3F-FC66-4751-AC6F-5AD396AD1849@oracle.com>
References: <632F0FCB-8719-4E8B-B35A-DC0A2DF49369@oracle.com>
 <86bd5aff-ca8a-517f-1474-1be1d26255ae@suse.de>
 <357F7DBD-B7E3-4AEF-ABD4-7E7234F7DF1E@oracle.com>
In-Reply-To: <357F7DBD-B7E3-4AEF-ABD4-7E7234F7DF1E@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [68.61.232.219]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05ebc48e-6447-460c-8c39-08d8bee1d333
x-ms-traffictypediagnostic: BY5PR10MB4049:
x-microsoft-antispam-prvs: <BY5PR10MB40497A072D7A4BC406CD924393A09@BY5PR10MB4049.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GFg1shWd1mBa5QxByW7JyVGDVkMm0u8iFUvXqY0nagu2XyxYFG6qBuAf6+MopeylLtekAiiDxhIBYzFZf3tLf3tsQeu/frk0jaCqG4omDAORKDqkuEL3pbkbg+J6KcVqjPETjFVs8d89ZTcCgkloCet5tdmZLP+5fw8AVxzXRfPrYzpdJ3rLOskFVY/7JmXE6nvq9Cc/tuXPf8/ywRr12bhc8myV8rTbDbxwszimXE7QSqcfZfqcatV4i4TFkK+g1kruqFeZIVM3DMTIklKIyASmbIlCoiiTPT0BN0PF8rOLIzfr5KHqWQ9kZg3UfOcHAKu4Bh7PHn8VdeimJhw/0zKMpXWIHaX1hvt7mIyQniR0z4yNhPeQyX8I935Yk3gek7MENikHtlk/7/twOuTg8dFT+HA/t+r35JyBAv8gpBky4PHNUkWSmCuV6prbkEhTLrq7BF9a9NdFQCh67S3tIIbroASZ7qoKO0sN8Xpq+pwqGqfEscUw5wB0yhMrFmKa+E/7cj0S/OBIgvQ9MVW49Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4688.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(376002)(346002)(366004)(8676002)(8936002)(6512007)(186003)(86362001)(26005)(44832011)(2616005)(53546011)(6506007)(478600001)(966005)(33656002)(4326008)(316002)(83380400001)(5660300002)(91956017)(66946007)(76116006)(66476007)(36756003)(64756008)(2906002)(66556008)(66446008)(6916009)(6486002)(71200400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UmsydklNNzNmbmFxclhxam5MK21uRkh3Um5Hc3FCaG81Sk1QRFlKNHF2emVB?=
 =?utf-8?B?ZnU3SzRkTkZaVlArVjdJRlZ2TUdMYnZUNzVDQzlaQXVWck1IWDhjVlpka2ZE?=
 =?utf-8?B?L0MrM3pPK3ozdmc2cU16WXZrNENZZXdKc20rSElDUlFybDBneGwxelJVQmtz?=
 =?utf-8?B?QnB2VlE3Y2tWaEVrVWRjc1FoR09aU0cwRDZ3VGZ4MDFjMVpDS1IyMDYxeVNt?=
 =?utf-8?B?QlJ5dzZyUTFzRlNEVm16RlFZeXpYOW11YlJGT01RWUkxazZUZUgvVUpObmk2?=
 =?utf-8?B?amwrdU5XK05hVkVMRWYvbDlEdjNQMGNpUDREUHpacTBQZ2VFVGQ4U0pkT2NY?=
 =?utf-8?B?UzJveVVqNCtDbEFwcm9Uc2NxSWdoN1JLRGVGWWdyNW5mN2NTc3pXb1JlZlND?=
 =?utf-8?B?L1ZxNUsrcVgzRHlBWEg3aEVTTzhVcEVzNjJpNWg5VHdJbnR4bmpGT1FGeUVk?=
 =?utf-8?B?TUF4ZWxORU5GZVNoR2s3U29ZTDhjbEh6MHY5ZFhQRFd1K0o2SVVNckp1Q0Nm?=
 =?utf-8?B?WmwxZjByOTBYdTVEL0toSFJacXBubFlCTzd0WS9iR3drM1FpbE5ZblFKVWVi?=
 =?utf-8?B?d3NXQkV1UzE4TS82eFR0dE5qVHhtdDMrQy96VnRHT2FRbDh5SkVzSGN0NEsv?=
 =?utf-8?B?Qlp1UkFmV0JQWTVHOHMyL2pPNWYyT0x3RnU3WUxZRzdhU093Wm5odTRwSWpy?=
 =?utf-8?B?RnBjbERWSE1FS09wSUF1dmxkRGw2OFh0UGpGRGM0L2FxNnpXQmh0MUZYR1ZS?=
 =?utf-8?B?ZVRpbTVVZEN3aEZWdmQ0amcrUGlCMlhqSzZxcVVqUWRqQ3doWVY4L1BXdlBJ?=
 =?utf-8?B?N2xuNVJ6UFRQanNpVjhxeGJvaFlheXJhbWZOR1pKM2FGVE5ZOStiWFFyZkdz?=
 =?utf-8?B?T3RwVlRmMmRHV1lvQ08relVrQ2syTHJJWjd1S2RyR1Fua0ordFp6bzFiSTJ0?=
 =?utf-8?B?aHh6YWl3RStYdkw0MWZaOGpCSFlmVlJQVTlWd293ZDZsRmFNUDFEbVdSaVlD?=
 =?utf-8?B?dTlwNytVQ2dqTzU1azN6NG9wb2sySXpZWUp5enZkUlVrek8zbzNBWGRId2pX?=
 =?utf-8?B?aU5tMCtMMHVqei9qWkpVdWxSN3BHZ0dzay9rdGt6STE2Z1diTmtySUZrMTc0?=
 =?utf-8?B?SFBldlBIOXpBY0pkU3NrUXBLMEZvcmh5YWpRWFpwYlFocjc5L3JlaFBTdVZW?=
 =?utf-8?B?OWJWeWxnaTM5MWVaWlZOcTFqZ3UyblprY25MSlUvS3ExdU1kbHUwQTlTMkVr?=
 =?utf-8?B?UDVGc2RwSkMwaHE2Ui93NWNyV21EN2xISHBoY1pUZldhVE5zcEJjTnBaVEgz?=
 =?utf-8?Q?+0+WqPXAI+3/l7c4oH3AKNnrTpg1cIEDRB?=
x-ms-exchange-transport-forked: True
Content-ID: <96D3D42F1A63134CB0797EA153CFB12D@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ebc48e-6447-460c-8c39-08d8bee1d333
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2021 14:27:19.1761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tHxFepdUS9WFrSG8HVWGKWpaRUf9ngh0uVu5st2xNK43va3Qe0Va8LRG+9DLUaJPxSbh/Avcc+kSBhp7SxcnZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4049
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9871
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9871
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101220081
X-Mailman-Approved-At: Sat, 23 Jan 2021 09:38:10 +0000
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gSmFuIDIxLCAyMDIxLCBhdCAxMDowNSBBTSwgQ2h1Y2sgTGV2ZXIgPGNodWNrLmxl
dmVyQG9yYWNsZS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gSmFuIDIxLCAyMDIxLCBh
dCA5OjQ3IEFNLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6
DQo+PiANCj4+IChjYydpbmcgZHJpLWRldmVsKQ0KPj4gDQo+PiBIaSwNCj4+IA0KPj4gdGhhbmtz
IGZvciByZXBvcnRpbmcgdGhlIGJ1Zy4NCj4+IA0KPj4gQW0gMjEuMDEuMjEgdW0gMTU6MzUgc2No
cmllYiBDaHVjayBMZXZlcjoNCj4+PiBIaSBUaG9tYXMtDQo+Pj4gSSB3YXMgbm90IGFibGUgdG8g
ZmluZCBhbiBhcHByb3ByaWF0ZSBtYWlsaW5nIGxpc3QgZW50cnkgaW4gTUFJTlRBSU5FUlMsDQo+
PiANCj4+IFRoYXQgd291bGQgYmUgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4g
DQo+Pj4gc28gSSdtIG1haWxpbmcgeW91IGRpcmVjdGx5IGFzIGNvbW1pdHRlciBvZiByZWNvcmQg
Zm9yOg0KPj4+IDQzNjc2NjA1Zjg5MCAoImRybS90dG06IEFkZCB2bWFwL3Z1bm1hcCB0byBUVE0g
YW5kIFRUTSBHRU0gaGVscGVycyIpDQo+Pj4gSSd2ZSBub3RpY2VkIHRoYXQgc2luY2UgcHV0dGlu
ZyB2NS4xMS1yYyBvbiBteSB0ZXN0IHN5c3RlbXMsIG92ZXJuaWdodA0KPj4+IG9uIGFuIG90aGVy
d2lzZSBpZGxlIHN5c3RlbSB0aGUgbG9hZCBhdmVyYWdlIHNlZW1zIHRvIGdyb3cgYXMgdGhlIHJl
c3VsdA0KPj4+IG9mIGEga2VybmVsIHdvcmtlciB0aHJlYWQuDQo+PiANCj4+IEVhcmxpZXIgdGhp
cyB3ZWVrIEkgZml4ZWQgYSBjb3VwbGUgb2YgbGVha3MgaW4gdGhhdCBjb2RlLiBDb3VsZCB5b3Ug
cGxlYXNlIGFwcGx5IHRoZSBwYXRjaCBhdCBbMV0gYW5kIHJlcG9ydCBiYWNrIGlmIGl0IGZpeGVz
IHRoZSBpc3N1ZS4NCj4+IA0KPj4gSWYgaXQncyBhIHNlcGFyYXRlIHByb2JsZW0sIEknbGwgdGFr
ZSBhIGNsb3NlciBsb29rLg0KPiANCj4gVGhvbWFzLCB0aGFuayB5b3UgZm9yIHlvdXIgcXVpY2sg
cmVzcG9uc2UuIEkndmUgaW5zdGFsbGVkIHlvdXIgcGF0Y2gNCj4gb24gb25lIHN5c3RlbSBhbmQg
aXQgbG9va3MgcHJvbWlzaW5nIGFscmVhZHkuIEknbGwgbGV0IGl0IHNvYWsgb3Zlcm5pZ2h0Lg0K
DQpBbGwgc3ltcHRvbXMgYXBwZWFyIHRvIGJlIGdvbmUuIEZ3aXcsDQoNClRlc3RlZC1ieTogQ2h1
Y2sgTGV2ZXIgPGNodWNrLmxldmVyQG9yYWNsZS5jb20+DQoNCg0KPj4gQmVzdCByZWdhcmRzDQo+
PiBUaG9tYXMNCj4+IA0KPj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8y
MDIxMDExODE0NDYzOS4yNzMwNy0xLXR6aW1tZXJtYW5uQHN1c2UuZGUvDQo+PiANCj4+PiBJIHVz
ZWQgInBlcmYgdG9wIiB0byBzZWUgd2hhdCBpdCBoYWQgZ290dGVuIHVwIHRvLCBhbmQgaXQgYXBw
ZWFycyB0aGF0DQo+Pj4gaXQgd2FzIHNwZW5kaW5nIGxvdHMgb2YgdGltZSB3YWxraW5nIGFuIGlu
dGVydmFsIHRyZWUgb24gYmVoYWxmIG9mDQo+Pj4gbWVtdHlwZV9yZXNlcnZlKCkuDQo+Pj4gVGhl
IG1vc3QgZnJlcXVlbnRseS1vYnNlcnZlZCBzdGFjayB0cmFjZSBzZWVtcyB0byBiZToNCj4+PiAg
ICAga3dvcmtlci8zOjEtMjM1NSAgWzAwM10gNjA5NTAuMTUwOTI4OiBmdW5jdGlvbjogICAgICAg
ICAgICAgbWVtdHlwZV9yZXNlcnZlDQo+Pj4gICAgIGt3b3JrZXIvMzoxLTIzNTUgIFswMDNdIDYw
OTUwLjE1MDk0Mjoga2VybmVsX3N0YWNrOiAgICAgICAgIDxzdGFjayB0cmFjZT4NCj4+PiA9PiBm
ZmZmZmZmZmMwYzY2MDgzDQo+Pj4gPT4gbWVtdHlwZV9yZXNlcnZlIChmZmZmZmZmZmEwMDVmOWQ1
KQ0KPj4+ID0+IF9faW9yZW1hcF9jYWxsZXIgKGZmZmZmZmZmYTAwNWFhYzEpDQo+Pj4gPT4gdHRt
X2JvX3ZtYXAgKGZmZmZmZmZmYzA0MGYyNjYpDQo+Pj4gPT4gZHJtX2dlbV92cmFtX3ZtYXAgKGZm
ZmZmZmZmYzA0MmM1Y2QpDQo+Pj4gPT4gZHJtX2dlbV92bWFwIChmZmZmZmZmZmMwNTA2YTdmKQ0K
Pj4+ID0+IGRybV9jbGllbnRfYnVmZmVyX3ZtYXAgKGZmZmZmZmZmYzA1MjM3NDEpDQo+Pj4gPT4g
ZHJtX2ZiX2hlbHBlcl9kYW1hZ2Vfd29yayAoZmZmZmZmZmZjMDQ5YTM0YSkNCj4+PiA9PiBwcm9j
ZXNzX29uZV93b3JrIChmZmZmZmZmZmEwMGRkOTJlKQ0KPj4+ID0+IHdvcmtlcl90aHJlYWQgKGZm
ZmZmZmZmYTAwZGRlNDYpDQo+Pj4gPT4ga3RocmVhZCAoZmZmZmZmZmZhMDBlMjJjNCkNCj4+PiA9
PiByZXRfZnJvbV9mb3JrIChmZmZmZmZmZmEwMDA0MTkyKQ0KPj4+IEkgc2VlIGEgcmVndWxhciBj
YWxsIHRvIG1lbXR5cGVfcmVzZXJ2ZSgpLCBidXQgbmV2ZXIgYSBtYXRjaGluZyBjYWxsIHRvDQo+
Pj4gbWVtdHlwZV9mcmVlKCksIHRodXMgSSBzdXNwZWN0IGEgbGVhayBvZiBJL08gbWFwcyBpbiB0
aGlzIGNvZGUuDQo+Pj4gLS0NCj4+PiBDaHVjayBMZXZlcg0KPj4gDQo+PiAtLSANCj4+IFRob21h
cyBaaW1tZXJtYW5uDQo+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+PiBTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KPj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPj4gR2VzY2jDpGZ0
c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0KPiANCj4gLS0NCj4gQ2h1Y2sgTGV2ZXINCg0K
LS0NCkNodWNrIExldmVyDQoNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
