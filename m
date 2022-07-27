Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 185A65833A9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 21:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BEF10E023;
	Wed, 27 Jul 2022 19:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DCCC45AF
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 19:31:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eb+u0oBQhG2F5iEkVD4k0M0Nwjtz8y9m/aeCtEBxcReDwHFBGVvHPpJhUHEjtjxwPiH0HI7gsl0dNU6THaEFbeACGdjsTD53xM8eJD/OOlSSWppSjc1oWC4nHCgFAx0cuTN4c9MtdERESF0PccUgDLIdhd+1e1jiROubJfrxM6ifm4Ll8pC3gCtdITUd1LSKJh1TvLKSp9mbj4pwA5XIwdQJWNERzTXq9XBx042bu7FUWo1WdBy9JfrV/BhReDEj/54lULjIM6DtQXnwiE+Z8r8lT0knPS6Yt0f5VaHK2OKmt3pc+8GnhTdZ5qCzPvXtc5M28sos7LfeLw6YHmNz4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5+ovCiC7lK8HbTXf2PkSvEiHUTn1HpuR6UTIjaKdxk=;
 b=PL2BOxSdzQAFmtNOleXLnz86RcJQ5pPSaVRPOGDOhtR7QxqunBU7XcVvE/srHr8j0Ap+c4gqLMF7/LjZQAEpLGOUZsjVZYMfzRvkujWzJ+LquQ3p5sP/I/tgmJVwGwsSTUi3mqGi16sTZuMZ/OEMDYFvWV2K0mxdHBKiCZHr9qOcChNfsQ3+P24WTiMVOC77X0f4i4mEY+IVLSDoQo6Bnq4HgTdxOsgkS5RYvLRGAoWMTS1+1Zz5O4Z9Lni9/TRFECdFPbgIVA3UhsmLje57qfWkdDJ0b0ZzkeE2JSsc+f6F8dYIzcDjkLfCz7ZjhEMapbZrARNI7toLaVQNXPVuaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5+ovCiC7lK8HbTXf2PkSvEiHUTn1HpuR6UTIjaKdxk=;
 b=FQFuRifaRiLbzTHlBQlFG1G3Lnekfq66nMqOqasDrFonRJLwM8v/gkQ8a720pEiKFt/93IakM892BRPCwl4HTc42K1sDaECjjLbVbNOBE9ds9xd75gr9i05SHhULlwkKGwrd2RaDjlhkUfZBCKoMn0N/IZI1A9OwJhIWpYahcHk=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by CY4PR05MB2823.namprd05.prod.outlook.com (2603:10b6:903:a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Wed, 27 Jul
 2022 19:31:34 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02%3]) with mapi id 15.20.5482.001; Wed, 27 Jul 2022
 19:31:34 +0000
From: Zack Rusin <zackr@vmware.com>
To: "willy@infradead.org" <willy@infradead.org>
Subject: Re: [PATCH] mm: Fix a null ptr deref with CONFIG_DEBUG_VM enabled in
 wp_page_reuse
Thread-Topic: [PATCH] mm: Fix a null ptr deref with CONFIG_DEBUG_VM enabled in
 wp_page_reuse
Thread-Index: AQHYoe1RKhd5Y0c55Eq/h/lKR2Msm62SmSsAgAAB74A=
Date: Wed, 27 Jul 2022 19:31:34 +0000
Message-ID: <66333fb601dfd3e487e856156988d91c05d94d9b.camel@vmware.com>
References: <20220727191407.1768600-1-zack@kde.org>
 <YuGQ9tJPUcqnqvAV@casper.infradead.org>
In-Reply-To: <YuGQ9tJPUcqnqvAV@casper.infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 682e61f3-0057-468b-135b-08da70069da9
x-ms-traffictypediagnostic: CY4PR05MB2823:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jJoKRX1nlZ6zv61umP0nE10c99eXDqFtWCDKceiwI+ZUwb8z4g2ENkozb+kLwqhY4/oS5NmmhVAlKdTPrXk9gSsafOkyc/Vkq7xkl9HswGaE5OT7tZ4bH5/+zWfPY2XfnyJ/uhxspEPE62jEybnWFUbVs6jagm8THWdWcLKVyclrymU6YctWf+dA7mx8tI7t3Bmdv9G2bn1N8pwRTDnfA9M6zHpLZcBcVjt+BRjcunRswnMWgmwQkMBV3A3C6oV56UBFWexyogFLNNz7jIF+3h7ThjNmZHt1NAakGk0SFIsMklBnsXI0eRMymtzmS6S6y4iPJELygVTgAXJ8jQVhGqC3opEXd2OKB5Ej0zMWwn/8M0n9pm2mUW8u3zjUh82gMI0q5VKpkqARal/BPLhDsY9UAsGb2n4S8aJrpC65toT1CjjQLNPuByRYhnqgTeR3lb2uv1iBxV1XQTyM8jyoeKYguE1m9y/35VBXcmYs7L6t7yPYyKxB0zA2sLJKZizIQjzPl2vpwO4q05p5gRVOKrw9YlLp00HWaNEMCNyW6mGQ+DIxX12SlLVGQW/XWd0uh6KhWhixGyJfXdawyOGiqiod2F+F/9BIaf3Pl4+3fMj85MO7vaKfj7zArHJx+mdZpYHuryltGRBoehYXAh5olZ/dE7S1iO0bKq9adCe4LD+8lcNDW7idpjwHOf9d1FaRbqTD9Zu/sGXntwgBK6A1BDRrpaRAEFcjHO/Ff2//xG6z9tiRjE3JkTKc1FzCKk+oM5XJpySPtrE33PlENUDh5C8eI+MlTtE0Dc2uWpiNuxVe0xjBEt2nxr54mwlbzXgpbJfpUYTmBPWQFJZun1jKJ75YP7e9jkLgR1U/JRLxdUM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(86362001)(6486002)(71200400001)(478600001)(6506007)(26005)(6512007)(38070700005)(41300700001)(38100700002)(122000001)(186003)(2616005)(83380400001)(36756003)(7406005)(5660300002)(8936002)(2906002)(4744005)(7416002)(91956017)(76116006)(66946007)(4326008)(66556008)(66446008)(66476007)(64756008)(8676002)(54906003)(6916009)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTFocWR4UVJpVXBwQXg4MnRydjlwVWxRRWg3T3RDVWkxNVZCdWo3ckMzQzI5?=
 =?utf-8?B?V2xUTXJkY0VSQnlPMXV0U3RBdmJ3RW0va2tFSlZTbTFUYXZIblN0bXQ1UVZR?=
 =?utf-8?B?OTJteUo0ZWVzYTl3QmlOMjdYUVUwRmd6WEdsc29GNXRCd0xtVExyL3RSV1di?=
 =?utf-8?B?ZFppbVR3Nm42TE1ka1dXaVhjSUZhNXhIWFhxWk82REtkUUZkNmhQeXdxNUt2?=
 =?utf-8?B?aGtGMFU1VlFXRThhYzFlUTMxU2dyVFV6ZitUc05jdFBCTzNlSjNDUEdnY1FK?=
 =?utf-8?B?SnFGWXV0cjN4NS9FbGRSY2VPcHMwdnluQitTdUpaaVU0aGgrQ3BGQnF3NXZp?=
 =?utf-8?B?dVlPc2RRL0l4aHdxbGtma1VlMWI3TENwMVJ2MHRGQzRCR3JKcitYUzc3YnZC?=
 =?utf-8?B?Y1MwaXUxWlpjYzNpaW0vQU4zVDQ5ZFBlOEg3QVRyb2tLTnQ0K1Bkb3FEUWor?=
 =?utf-8?B?ekJ5eWpjK0FFRXo5ckxrRHFodlQxZFNsYlVKZVpoVmx0ZEQ1WEpjZENlbldT?=
 =?utf-8?B?UFl6T29ZZHp3YlZUayt0VnFueDRFMFdCZjZoeFRSVWREazkrb0NCLzhqb3FO?=
 =?utf-8?B?TEVnTjlIKytrV3U2YzNwWDloRm9MT0E2QkErWjVwRGhlS1NJMHZLMkVTaEJ5?=
 =?utf-8?B?MXNWMmtFc0NOMytEL1ZXKzRRN3lWOGlSdWJ5MFVsSGdmMFkyaXF0M293MEdx?=
 =?utf-8?B?dldtVjFINDh0ZlNIWEJoRENKK1M5b3RQaEtVMWxEeThaK0M5dFUyUTF4SzIw?=
 =?utf-8?B?dFlnMFBBOXAwa0M0TnNpQldkV1V5UXVFQ1plVmYzNzBNMEkvVWZLSTNWWmk5?=
 =?utf-8?B?NTBzeWY4T0dGTWtZVFZoOW5kdzdsbkxxSHhJWHIybXRUY0NDUWpDb1E1TTd0?=
 =?utf-8?B?TTdEbXdxbENjUUZXcEV5NlFFc3NJTFptWnBPQ3B5RndiMUcydjFpdjlzY1ZN?=
 =?utf-8?B?M3ErV1QzYTdKZlo2YnU1SDN2QmdhSUVBS3h6K2h3Q3RGbnBwdGxUY1liQ1Zm?=
 =?utf-8?B?SGxsYXNJUnJubTBBVmQ0Qk9oenhHKzNjUjlLSDJtQmo0K29rK0tRK3FXWmxU?=
 =?utf-8?B?d3ovdnoxVFZOT2ZZYVN6dXc5WFZLQVJaNmd0OUdBcUpQei9MbFB6YmRJWERn?=
 =?utf-8?B?Q0VadWg0ZCtGMXZPTXZhb0I0b0FCRTkrV1ZtUFJWWWR0cFZjamhjMEh2UmdI?=
 =?utf-8?B?dTAweTRzM21IejFxTmJTYnhmcWhJVTJtZU5IMGVvUXFNdXA2RkMrU2o0Slhr?=
 =?utf-8?B?bHFmL1ZkcnBURXpTRGxsUEpyREtmMFRld1pMRWRTaU1mWU1QL1diVXJTbWpZ?=
 =?utf-8?B?RFk2ZXZLcXhHKzY0QVpCTUprbGFsRUhwb0xnU1MrNjBBYkk3UnAzczl3bWxN?=
 =?utf-8?B?dnFtVjBqSXJza3JWT3F1QWZyRFFYODV6N2dnbktWZ1hBa3ZpMk1FM0x0TlR2?=
 =?utf-8?B?Z3lZREZaVlM0WFdKU1NULyswYzI5Sm5ReTU4VG1INEJLK2ZYU0VJWkpCdnRv?=
 =?utf-8?B?L3VYbnJqQUJMTXRqejgwbW16cWZCWWRDSzVTVGNHTUlVZ3hDQmNleE9QUU03?=
 =?utf-8?B?RDhlSTJPWFZUMTJ4bm51OXdQNkNYZDFob0s2UGJGblU2OE1Qd1dSaTNEUDRC?=
 =?utf-8?B?cnpMRzdNQ1l2RkJ3cWl2SnFHdkFXZHJ6YUxma05tc3o1T3FxVFM5bzFab0RJ?=
 =?utf-8?B?dDIvUHRwYVJ4aTVpelkwWE5UUkNrRlUzWDAxTW10L0dHcGhrc0xPVnZHcnhm?=
 =?utf-8?B?eWVrejZRWHZCeDYrTkVqcVJvZnFYZHkrZExUbU1OdTI4TzRWMWJ6dERkWFVq?=
 =?utf-8?B?NkJJc1MwMk1jK3pRaVJ4YlFNa2ZXcmRNMVZiY1RoZ0pQMzdkbVRBaHdPdzBo?=
 =?utf-8?B?U2dtN1ZBSzBFZmdDSUV6WEN0L09vR3pQOUk2d2xXeFR4ZkZyajZoZlZORUhz?=
 =?utf-8?B?eXVZS3ZhdllrLzBmdm1OTXB5UHlmeVpkaS9oSUNpTUcvcGVBdTJxZ21lMGVr?=
 =?utf-8?B?OHRSdFlCVEFyZzNMYVNJYitBcTk1OEdvVkUxUHpCQ2JWdU9IdnppTzhWTWx4?=
 =?utf-8?B?NThFNlRFMFdlcm1UWHM1TTlFOWdkQ3Eyd2FEaU16SEcrSmZDd0w0NzcwdVdO?=
 =?utf-8?Q?8WiasyZrNdpqo9Kj+ssCvSrkO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3A11782F1251F49B2A7BF5DA3F3D9DE@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682e61f3-0057-468b-135b-08da70069da9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 19:31:34.3095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ny2B/qk038lyaLJ04HsD1hJB1U6RzRIGV1zPlz1oAuU+fznWfObtaoub7pEcVdUNA8gFoStDC7oSbz3d3g6XSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR05MB2823
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
Cc: "linmiaohe@huawei.com" <linmiaohe@huawei.com>,
 "jack@suse.cz" <jack@suse.cz>, "david@redhat.com" <david@redhat.com>,
 "neilb@suse.de" <neilb@suse.de>, "shy828301@gmail.com" <shy828301@gmail.com>,
 Michael Banack <banackm@vmware.com>, "mhocko@kernel.org" <mhocko@kernel.org>,
 "dhowells@redhat.com" <dhowells@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "khalid.aziz@oracle.com" <khalid.aziz@oracle.com>,
 Nadav Amit <namit@vmware.com>, "hch@lst.de" <hch@lst.de>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 "aarcange@redhat.com" <aarcange@redhat.com>,
 Martin Krastev <krastevm@vmware.com>, "jannh@google.com" <jannh@google.com>,
 "hughd@google.com" <hughd@google.com>,
 "zhangliang5@huawei.com" <zhangliang5@huawei.com>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "rientjes@google.com" <rientjes@google.com>,
 "pedrodemargomes@gmail.com" <pedrodemargomes@gmail.com>,
 "riel@surriel.com" <riel@surriel.com>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "shakeelb@google.com" <shakeelb@google.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "songmuchun@bytedance.com" <songmuchun@bytedance.com>,
 "surenb@google.com" <surenb@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
 "zhanghongchen@loongson.cn" <zhanghongchen@loongson.cn>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "oleg@redhat.com" <oleg@redhat.com>, "minchan@kernel.org" <minchan@kernel.org>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "guro@fb.com" <guro@fb.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTA3LTI3IGF0IDIwOjI0ICswMTAwLCBNYXR0aGV3IFdpbGNveCB3cm90ZToN
Cj4gT24gV2VkLCBKdWwgMjcsIDIwMjIgYXQgMDM6MTQ6MDdQTSAtMDQwMCwgWmFjayBSdXNpbiB3
cm90ZToNCj4gPiBGcm9tOiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0KPiA+IA0KPiA+
IFdyaXRlIHBhZ2UgZmF1bHRzIG9uIGxhc3QgcmVmZXJlbmNlcyBtaWdodCBub3QgaGF2ZSBhIHZh
bGlkIHBhZ2UgYW55bW9yZS4NCj4gPiB3cF9wYWdlX3JldXNlIGhhcyBhbHdheXMgZGVhbHQgd2l0
aCB0aGF0IHNjZW5hcmlvIGJ5IG1ha2luZw0KPiA+IHN1cmUgdGhlIHBhZ2UgaXNuJ3QgbnVsbCAo
b3IgdGhlIHJlZmVyZW5jZSB3YXMgc2hhcmVkKSBiZWZvcmUgZG9pbmcNCj4gPiBhbnl0aGluZyB3
aXRoIGl0LiBSZWNlbnRseSBhZGRlZCBjaGVja3MgaW4gVk1fQlVHX09OIChlbmFibGVkIGJ5IHRo
ZQ0KPiA+IENPTkZJR19ERUJVR19WTSBvcHRpb24pIHVzZSBQYWdlQW5vbiBoZWxwZXJzIHdoaWNo
IGFzc3VtZSB0aGUgcGFzc2VkDQo+ID4gcGFnZSBpcyBuZXZlciBudWxsLCBiZWZvcmUgbWFraW5n
IHN1cmUgdGhlcmUgaXMgYSB2YWxpZCBwYWdlIHRvIHdvcmsNCj4gPiB3aXRoLg0KPiA+IA0KPiA+
IE1vdmUgdGhlIFZNX0JVR19PTiwgd2hpY2ggdW5jb25kaXRpb25hbGx5IHVzZXMgdGhlIHBhZ2Us
IGFmdGVyIHRoZQ0KPiA+IGNvZGUgdGhhdCBjaGVja3MgdGhhdCB3ZSBoYXZlIGEgdmFsaWQgb25l
Lg0KPiANCj4gTWVzc2FnZS1JRDogPENBSGstPXdoX1RyZ05tNnZ6Nz03Q2dacHByMFVyWjlUd0x5
YjNkZ1BYeUctdz1hOGtKUUBtYWlsLmdtYWlsLmNvbT4NCg0KQWgsIGdyZWF0LCB0aGFua3MuDQoN
CnoNCg==
