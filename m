Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B52B0229737
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 13:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA06389D83;
	Wed, 22 Jul 2020 11:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760053.outbound.protection.outlook.com [40.107.76.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B986C89D83
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 11:13:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jotUtUsk/6b6sr0v3PssF+uYQs6qWMlWxwdlKg1Yb368YzNf+8IJG5+qVFrANFG2eE2ftQuHqh2r0J74A0H6c+Rsb+JW3Jl54sCIfUJkZIl2Ngk9MQ4ztLsusSCIZvUjNgfW2OqKxyI0jRnZ7V38+NUeODL6FhayNZ1xpZNhCN9bGjqT4ziCnVEpZFMPKNwKVvb/MtTdDDzBLKQ6WalKoN/j5lJZEnL2LZ0Drgf8ImJo/1eFZ4DYnZsLUczEz6yf9v1jo9OObUEc8ZVrZeYA1oae8LoXF0YeaAsSarb454GzT1TcIwFWZw2eu6pcJ+kyYBvOYbnwMa5n6o0SDOBNxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDQU/DCxbuGOP+8whBHR2vg39vPgt3qrzb2Jba03O2w=;
 b=EBltx5RxJi/xVmWoGJvq9VCH35W0ZzL02WoxVsGaUIUozAGjNUU0MpFQGORGA9qE2Y/3gY1tUjuFtUGdp3RmtlEbXC0kHK4H3aWgNnWsker2GlK0rgC4XotQWEPFRh0znPzzyrCIyfzzYO8ppQbN/LyJJsCPc/sQ2egCqmZTXhQ4Qbqi8GrKht+6TG+PqeTonnpXO7h0Yxrix8Yvv1L55Yip7L6EJRysyq7lrA1ZebSczFx0qI/P5C7VGHVl8Lm03NCKM9vgQ+RcMDBuTu5Ow/S+cP4LQL2f9TS1+twi+DyKKWKmg0EWyC8snya6K9284Ueo/nch5SVfIDET0ZSduQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDQU/DCxbuGOP+8whBHR2vg39vPgt3qrzb2Jba03O2w=;
 b=CE8a6Wy/r8xLgmwDh4GJYhu/MCWUS7vKzZZZZLUnvEWHB3VTY1tjXKthyBI4EYaYomjwgaBFEioLrkGXsYvwroEp/vjYx8RkaAgab8s8zw1scBw3ydkphqWcUJj6R2IqEWFoCQ0nkwztCMobXVZvpV8lRFIP8jNpHznvh5F5c1o=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Wed, 22 Jul
 2020 11:13:52 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.021; Wed, 22 Jul 2020
 11:13:52 +0000
Subject: Re: [PATCH 06/11] drm/radeon: stop using TTM_MEMTYPE_FLAG_MAPPABLE
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200721073245.2484-1-christian.koenig@amd.com>
 <20200721073245.2484-6-christian.koenig@amd.com>
 <20200721092448.GE6419@phenom.ffwll.local>
 <8a602078-3dad-4158-6057-07427ea69d74@gmail.com>
 <CAKMK7uE5M8LkuXQp07jveuVz8ybfKW4yoGC4fxJgbG1+9uX_Wg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <64366e12-bdaa-a1e7-2fef-3c61d5142651@amd.com>
Date: Wed, 22 Jul 2020 13:13:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAKMK7uE5M8LkuXQp07jveuVz8ybfKW4yoGC4fxJgbG1+9uX_Wg@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.15 via Frontend Transport; Wed, 22 Jul 2020 11:13:51 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d92870f2-50e9-497e-6cf6-08d82e3050db
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4390F9348B40B0F98F6943A083790@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a4T2oOmgnAxVDPXVDU0xy1YXyDf4JYXhwDe7E8DN/lLiPck/eUSaOUH9yRfhX7X3A1WK5aiaBYQu8PlBWPLUdK8Iw44E+WoQqdYyf0qpGlipXow9QHk66R0dAQqu2zzdpvp1BubVb6Z+8KBDDqF56wNZClOybudUcx9odnVrat1U5gJx2OLC/W2wwMR7eH4ZIqW+QFC7m2P3Wyp6hqgS17V8d8K/Cpukrns+SLt2QIhI2SCdKQkvMMnS3ZjHqjS4kgBHgzWEml1y5Fosprltw7MHv2V+SgJkfORFGbC0M2rqFd6gciNgdoSoqU5jj/RVA6ImEQ0O7wSR8XT90YBDleHK7T/cxCg5C8nTmF/K5HUC6K3ZKlyvsv7cki+8jR2bEwU4AeIiRKCt3oz3mWyEBLb4bapCvsvEb5sDHrCPe8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(66556008)(66946007)(66476007)(8936002)(52116002)(31686004)(6666004)(6486002)(2906002)(8676002)(186003)(54906003)(86362001)(31696002)(16526019)(316002)(53546011)(966005)(45080400002)(478600001)(5660300002)(6916009)(4326008)(36756003)(2616005)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: v55wqOEjAQX+v7U6RHLalF5Gyz9P/Qj5VDEvvf1cZ27d/MXheWKXAZgaAYvr4EbFUQfFBmrCQcH5RvVxvFDTvphsM/1DwgFeGIPP0EUQF4qPy9EL5maQY2rcMlY3JMgN8VCYmGcxu07qRcQKv8PZOAfP2Gizy1gmN8mAIQvUIelExZ0VhrsgAqD9FVL3vmMua7sAIhPu3Fw88P8XEEGqMHayaeIlKPSBhMfROsvEg0z/50iB7BujXDE6ZhslWz9B6Ux/yOpPfgOOezpPNkhxjNr5KdzzuEOxpa/IWpQdsby7vNdX1gROy3qseLELUfTays09j3XvfHMQjFCbhdBLxVKVayh8Cou7cqLbPK8kgFoq0U8HpfZTkiboye+VhM+CZuiVP5XpkADgxPoblmJSI7cBvdEWgF37WX9preiYbOph/1XeyayKFv5MQ+Y7SVyhK/+dAIiCCyKx7tACeVa4T+qEv/VXnn4opMeAEV+Ec+S1y3DQY1bQYrH8PBXB7Gxpm3V3ZTQjC2IZdG31/kUh4V0IritretpAdObDk1N0Zavff1aD+M4iYUtwHHMefEzD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92870f2-50e9-497e-6cf6-08d82e3050db
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 11:13:52.4669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgF1AGNgqYLQAElsUgcAtrvSUPirBigQQ6Grxp51zIyWV85hv8JfMC/gQBjjaCAc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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
Cc: Madhav.Chauhan@amd.com, "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDcuMjAgdW0gMDc6MzQgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFR1ZSwgSnVs
IDIxLCAyMDIwIGF0IDQ6NDYgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxja29lbmlnLmxlaWNodHp1
bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IEFtIDIxLjA3LjIwIHVtIDExOjI0IHNjaHJpZWIg
ZGFuaWVsQGZmd2xsLmNoOgo+Pj4gT24gVHVlLCBKdWwgMjEsIDIwMjAgYXQgMDk6MzI6NDBBTSAr
MDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+PiBUaGUgZHJpdmVyIGRvZXNuJ3QgZXhw
b3NlIGFueSBub3QtbWFwYWJsZSBtZW1vcnkgcmVzb3VyY2VzLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4+IC0t
LQo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jIHwgMTMgKysrKy0t
LS0tLS0tLQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+Pj4+IGluZGV4
IDU0YWYwNmRmODY1Yi4uYjQ3NDc4MWEwOTIwIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fdHRtLmMKPj4+PiBAQCAtNzYsNyArNzYsNyBAQCBzdGF0aWMgaW50IHJhZGVvbl9p
bml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAo+
Pj4+ICAgICAgIHN3aXRjaCAodHlwZSkgewo+Pj4+ICAgICAgIGNhc2UgVFRNX1BMX1NZU1RFTToK
Pj4+PiAgICAgICAgICAgICAgIC8qIFN5c3RlbSBtZW1vcnkgKi8KPj4+PiAtICAgICAgICAgICAg
bWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7Cj4+Pj4gKyAgICAgICAgICAg
IG1hbi0+ZmxhZ3MgPSAwOwo+Pj4+ICAgICAgICAgICAgICAgbWFuLT5hdmFpbGFibGVfY2FjaGlu
ZyA9IFRUTV9QTF9NQVNLX0NBQ0hJTkc7Cj4+Pj4gICAgICAgICAgICAgICBtYW4tPmRlZmF1bHRf
Y2FjaGluZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsKPj4+PiAgICAgICAgICAgICAgIGJyZWFrOwo+
Pj4+IEBAIC04NCw3ICs4NCw3IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2luaXRfbWVtX3R5cGUoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCj4+Pj4gICAgICAgICAgICAg
ICBtYW4tPmZ1bmMgPSAmdHRtX2JvX21hbmFnZXJfZnVuYzsKPj4+PiAgICAgICAgICAgICAgIG1h
bi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19DQUNISU5HOwo+Pj4+ICAgICAgICAg
ICAgICAgbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7Cj4+Pj4gLSAg
ICAgICAgICAgIG1hbi0+ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFHX01BUFBBQkxFOwo+Pj4+ICsg
ICAgICAgICAgICBtYW4tPmZsYWdzID0gMDsKPj4+PiAgICAjaWYgSVNfRU5BQkxFRChDT05GSUdf
QUdQKQo+Pj4+ICAgICAgICAgICAgICAgaWYgKHJkZXYtPmZsYWdzICYgUkFERU9OX0lTX0FHUCkg
ewo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXJkZXYtPmRkZXYtPmFncCkgewo+Pj4+
IEBAIC05Miw4ICs5Miw2IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2luaXRfbWVtX3R5cGUoc3RydWN0
IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCj4+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICh1bnNpZ25lZCl0eXBlKTsKPj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgfQo+Pj4+IC0gICAgICAgICAgICAgICAgICAgIGlmICghcmRldi0+ZGRldi0+YWdwLT5j
YW50X3VzZV9hcGVydHVyZSkKPj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hbi0+
ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFHX01BUFBBQkxFOwo+Pj4gVGhlcmUgaXMgYSBidW5jaCBv
ZiBhZ3AgZHJpdmVycyAoYWxwaGEsIHBwYywgdGhhdCBraW5kIG9mIHN0dWZmKSB3aXRoIHRoaXMK
Pj4+IGZsYWcgc2V0LiBBbmQgcmFkZW9uLmtvIGRpZCBhdCBsZWFzdCBvbmNlIHdvcmsgb24gdGhl
c2UuIEFuZCB5b3VyIHBhdGNoIHRvCj4+PiBkaXNhYmxlIGFncCBvbmx5IGNoYW5nZXMgdGhlIGRl
ZmF1bHQsIGl0IGRvZXNuJ3QgcmlwIG91dCB0aGUgY29kZS4KPj4gVGhlIGtleSBwaW50IGlzIHRo
YXQgdGhlIGZsYWdzIGZvciBBR1AgYXJlIHRoZSBzYW1lIGFzIHRoZSBvbmUgZm9yIHRoZQo+PiBQ
Q0llIHBhdGguIFNvIG5vIGZ1bmN0aW9uYWwgY2hhbmdlIGF0IGFsbCA6KQo+IEkgbWlzcmVhZCB0
aGUgY29kZSBzb21laG93LCBJIGRpZG4ndCBzcG90IHRoZSB1bmNvbmRpdGlvbmFsIHNldHRpbmcg
b2YKPiBGTEFHX01BUFBBQkxFIGZvciBhbGwgVFRNX1BMX1RULCBpcnJlc3BlY3RpdmUgb2YgYWdw
IG9yIG5vdCwgc29tZWhvdwo+IHRob3VnaHQgdGhhdCdzIGFub3RoZXIgY2FzZS4KPgo+IFJldmll
d2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKQW5kIGZvciB0
aGUgYW1kZ3B1IHBhdGNoPyBPdGhlcndpc2UgSSBqdXN0IHBpbmcgQWxleCBmb3IgYW4gcmIuCgpU
aGFua3MsCkNocmlzdGlhbi4KCj4KPj4gVGhlIHJlYWwgaGFuZGxpbmcgb2YgY2FudF91c2VfYXBl
cnR1cmUgaXMgaW4gcmFkZW9uX3R0bV9pb19tZW1fcmVzZXJ2ZSgpLgo+Pgo+PiBDaHJpc3RpYW4u
Cj4+Cj4+PiBTbyBub3Qgc3VyZSB5b3VyIGFzc3VtcHRpb24gaGVyZSBpcyBjb3JyZWN0Lgo+Pj4g
LURhbmllbAo+Pj4KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgbWFuLT5hdmFpbGFibGVfY2Fj
aGluZyA9IFRUTV9QTF9GTEFHX1VOQ0FDSEVEIHwKPj4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFRUTV9QTF9GTEFHX1dDOwo+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgICBtYW4tPmRlZmF1bHRfY2FjaGluZyA9IFRUTV9QTF9GTEFHX1dDOwo+Pj4+IEBA
IC0xMDMsOCArMTAxLDcgQEAgc3RhdGljIGludCByYWRlb25faW5pdF9tZW1fdHlwZShzdHJ1Y3Qg
dHRtX2JvX2RldmljZSAqYmRldiwgdWludDMyX3QgdHlwZSwKPj4+PiAgICAgICBjYXNlIFRUTV9Q
TF9WUkFNOgo+Pj4+ICAgICAgICAgICAgICAgLyogIk9uLWNhcmQiIHZpZGVvIHJhbSAqLwo+Pj4+
ICAgICAgICAgICAgICAgbWFuLT5mdW5jID0gJnR0bV9ib19tYW5hZ2VyX2Z1bmM7Cj4+Pj4gLSAg
ICAgICAgICAgIG1hbi0+ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVEIHwKPj4+PiAtICAg
ICAgICAgICAgICAgICAgICAgICAgIFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7Cj4+Pj4gKyAg
ICAgICAgICAgIG1hbi0+ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVEOwo+Pj4+ICAgICAg
ICAgICAgICAgbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9GTEFHX1VOQ0FDSEVEIHwg
VFRNX1BMX0ZMQUdfV0M7Cj4+Pj4gICAgICAgICAgICAgICBtYW4tPmRlZmF1bHRfY2FjaGluZyA9
IFRUTV9QTF9GTEFHX1dDOwo+Pj4+ICAgICAgICAgICAgICAgYnJlYWs7Cj4+Pj4gQEAgLTM5NCw3
ICszOTEsNiBAQCBzdGF0aWMgaW50IHJhZGVvbl9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29i
amVjdCAqYm8sIGJvb2wgZXZpY3QsCj4+Pj4KPj4+PiAgICBzdGF0aWMgaW50IHJhZGVvbl90dG1f
aW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fbWVt
X3JlZyAqbWVtKQo+Pj4+ICAgIHsKPj4+PiAtICAgIHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdl
ciAqbWFuID0gJmJkZXYtPm1hblttZW0tPm1lbV90eXBlXTsKPj4+PiAgICAgICBzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldiA9IHJhZGVvbl9nZXRfcmRldihiZGV2KTsKPj4+Pgo+Pj4+ICAgICAg
IG1lbS0+YnVzLmFkZHIgPSBOVUxMOwo+Pj4+IEBAIC00MDIsOCArMzk4LDcgQEAgc3RhdGljIGlu
dCByYWRlb25fdHRtX2lvX21lbV9yZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBz
dHJ1Y3QgdHRtX21lbV8KPj4+PiAgICAgICBtZW0tPmJ1cy5zaXplID0gbWVtLT5udW1fcGFnZXMg
PDwgUEFHRV9TSElGVDsKPj4+PiAgICAgICBtZW0tPmJ1cy5iYXNlID0gMDsKPj4+PiAgICAgICBt
ZW0tPmJ1cy5pc19pb21lbSA9IGZhbHNlOwo+Pj4+IC0gICAgaWYgKCEobWFuLT5mbGFncyAmIFRU
TV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEUpKQo+Pj4+IC0gICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPj4+PiArCj4+Pj4gICAgICAgc3dpdGNoIChtZW0tPm1lbV90eXBlKSB7Cj4+Pj4gICAgICAg
Y2FzZSBUVE1fUExfU1lTVEVNOgo+Pj4+ICAgICAgICAgICAgICAgLyogc3lzdGVtIG1lbW9yeSAq
Lwo+Pj4+IC0tCj4+Pj4gMi4xNy4xCj4+Pj4KPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+PiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlu
a3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRl
c2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGZHJpLWRldmVsJmFtcDtkYXRhPTAyJTdD
MDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzJmYjAyMDBlZjMyZjRhZmNjM2UyMDhk
ODJlMDBlZjdkJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYz
NzMwOTkyODg0Nzk5ODg5OSZhbXA7c2RhdGE9OVZjbFJKN2UzeGZvaHNhTHNpVkY2WTgzYyUyQmtu
Y21ibzV1cW9lVjZ0VDlNJTNEJmFtcDtyZXNlcnZlZD0wCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
