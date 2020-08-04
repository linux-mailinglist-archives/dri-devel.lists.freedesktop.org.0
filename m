Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBF223B962
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 13:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C88F6E450;
	Tue,  4 Aug 2020 11:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750044.outbound.protection.outlook.com [40.107.75.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCB66E1B1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 11:18:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4YKcuIVvOqkdTN5AMTErrjTsjpl9hb/LsF7DbfzNLnGHJ05LJvJXRzk/YsFatfLtFyiYh/RjpgE9CRjtfiig4ot69o3+KCGxnYp0brB6vtItHjACOwQnSFspXJUsdPeupim/YqOm3dPw+pXjdF30ng6Rl+Up+GEmaXmBjkHIZ/0wvc9s9x9DH36tjgEjXMFNCjFiUZAxYaJzbfzxHBBROQ6m//cbL7goXPJPuaRAkoBwegYTTGBdX8konRBbFCOhMuZoP6LLgzKCKkEHTMUCpjPwMW83CDDWaA/s7cIGWbGlGmMPuZJ5b2/TA2yTMBRqQyQqCj44T+Ejv47uAIuzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvDYYwgaFXCzj7tTBU3otJ78qhAIS1AdZt6tgD+B+To=;
 b=nWW/P0BeDN3lwVOkPZRrwbiw0U89691nzRegw7lmX9YxAG53X1sukVJpSQGOd6EdyrfBEtuH1lwD0rb4S7nsqlfTsSmK9nCHpcqLW3oBukUW/bnCybx1i6GAHkSxIiumPyg3Do0bYOhSQVyQqyC424WYly8uyT1XJccEVIehEeXmo2x6MN0vUQsqvNlJwJ27XhbGywzNCYbAPHwfh7Z7alF9wvUPrPctEUCJL+KRbe05BSP5uAQmLEDDbqh6NGq653KsRPiSMcQVBo++SRJR8Q1gnwzuRCX66L+zo/1pV+hhqEOrkpLyBy1T/i4fhW+hhLj5ssQgAwVGzb2YAYFG6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvDYYwgaFXCzj7tTBU3otJ78qhAIS1AdZt6tgD+B+To=;
 b=B3TXchkpXMbkktBAuG5k2sMah4lj9TpzUCY5aayWbt8bVOvP8WrhGPQVGPuXgyiG7hfswbz2PHNbAlv7udXfHD85xb6Kry8OiwIE6wkK4nqQMYD6R3eANZw+9RmWQtQtvf+Qp2jBYY06sWKWpOnZTSEIoTjTnqIZJXKO9shpWDk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Tue, 4 Aug
 2020 11:18:49 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 11:18:49 +0000
Subject: Re: [PATCH 25/59] drm/ttm: make some inline helper functions for
 cleanup paths. (v2)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-26-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0c714033-96a3-58cb-af6f-c8a20018a08f@amd.com>
Date: Tue, 4 Aug 2020 13:18:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200804025632.3868079-26-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0105.eurprd03.prod.outlook.com
 (2603:10a6:208:69::46) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0105.eurprd03.prod.outlook.com (2603:10a6:208:69::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.16 via Frontend Transport; Tue, 4 Aug 2020 11:18:48 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 12cfc2ff-9e8d-4175-173f-08d83868295a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4111:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41111D2BDE4F6B488A0083F2834A0@MN2PR12MB4111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n6mIN4cY5LsA4jNDF22i98I1O1PJGE8AlqYtxb9ft/NIoxW0pt7Ry+zERAJyidzp8VqxGc9Noo8Mo+pYARdGKnyR79tQ+9NReBD/aJIltzhSCr7t37cJL6oNM6LQmIEkMjOa4bDIDWtyk6htwrBWcHwMjsdGFgE7UWFILDruyytvqAHLSr7CO8MnKMfjFlxKNhBsPylZWJYOo07CFSekpzJ+NdLMmkl/41fm06sI4m0WUykW+MpR1bi+/k9tnp9fayiAfy/E0p4m+CHiXDj4q2ieEPaMTio0x4Q29lpQ5xS27CNEcBx9RS0XVtFHRNDZPXgoCEdEtGpk/3MPohUUYXJZTBoyLmz6I4/K7CXAY2C8uz5D+n3rQ2e4EEMEjQN/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(4326008)(8936002)(66556008)(31696002)(66476007)(8676002)(5660300002)(36756003)(66946007)(2616005)(31686004)(2906002)(6666004)(478600001)(86362001)(6486002)(316002)(52116002)(16526019)(186003)(83380400001)(66574015)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: b89y7D9fqDzJlxTo0RVn4Xhruz2pXeY49e3tGpeM6wW8IC4dw1NLUz3eSkXqPo62TWApyBMboiymNwYzHYiuEwFpjY5zEPGTrFr/tGZWxPFOS1s7rPXoEwIR7IOhJS6JWYa2iay8/Cq2RxXSCfgei4L+R51EX/q3aH39cE8SHmJ7zPryQ7o554DENYZ5PALCwAP9eI0Cqj4FqznLDRHgMN7cY0hlj49kiyII0AypoaK8mvaJlBaH73Yl5J8TQwu3Mqu4cfsS2CEVmcSq49TkpssHMJ9hdCPCFTmEhiIUk9IvYu0kud3xb5PTfNSX9aJbTnc/KOKrsDKkNZGO+wIJGIR2F3gOtRZmFPakE70JpihKHXG30K4ARO7gr9xo2QPgLesS8degRgqYAQy54AMyPhnpBSD3zvt6r+p/VX7iaunTUXpxDjD7BOp5p8h4KBxlXqQIJwaUrFv/OaBbdt3o6uQWLZpdI2qIIsJ19+umwC+YRpZdpJLCR89y0UG+WrehHJDfihW+yfil+YVN88OY4raJvXkF426z5ZaHAb9r/bKZn9AVVDQIxiAsM2lS5UE2A6dBsqF/UiL720h7ik5b8h+Aeq5Kvw828EDE9Tbj/3k9en8bLCmtw0h6TA914fVuaTf1mZsXMc/9i/zutwglx+jyN/yLOwnAXmpwj5sbOLtBNkgKkC+pzT+TTYVaWZWhnpi3BKitSaXIxXhigcZ1nw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cfc2ff-9e8d-4175-173f-08d83868295a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 11:18:49.6798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nY6YtsbgiweaIk3btTZ2PtFTf3+lbIH14PzWjgx3MbF+tdOnSBKrhiHXix7k9q7a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDguMjAgdW0gMDQ6NTUgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhlIGRpc2FibGUgcGF0aCBpcyBqdXN0IHRl
bXBvcmFyeSBmb3Igbm93LCBpdCB3aWxsIGJlIGRyb3BwZWQgb25jZSBoYXNfdHlwZQo+IGlzIGdv
bmUgaW4gYSBsYXRlciBwYXRjaC4KPgo+IHYyOiBhZGQgZG9jcy4KPiByZW5hbWUgdG8gdHRtX21l
bV90eXBlX21hbmFnZXIgbmFtZXNwYWNlCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8
YWlybGllZEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
by5jICAgIHwgIDYgKystLS0tCj4gICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIHwg
MjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IGluZGV4IGFm
MWIxYzNmNmVkMi4uMTI3YTBiNjJiZjk4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gQEAgLTE0
NjgsOCArMTQ2OCw3IEBAIGludCB0dG1fYm9fY2xlYW5fbW0oc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYsIHVuc2lnbmVkIG1lbV90eXBlKQo+ICAgCQlyZXR1cm4gcmV0Owo+ICAgCX0KPiAgIAo+
IC0JbWFuLT51c2VfdHlwZSA9IGZhbHNlOwo+IC0JbWFuLT5oYXNfdHlwZSA9IGZhbHNlOwo+ICsJ
dHRtX21lbV90eXBlX21hbmFnZXJfZGlzYWJsZShtYW4pOwo+ICAgCj4gICAJcmV0ID0gMDsKPiAg
IAlpZiAobWVtX3R5cGUgPiAwKSB7Cj4gQEAgLTE0ODIsOCArMTQ4MSw3IEBAIGludCB0dG1fYm9f
Y2xlYW5fbW0oc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVuc2lnbmVkIG1lbV90eXBlKQo+
ICAgCQlyZXQgPSAoKm1hbi0+ZnVuYy0+dGFrZWRvd24pKG1hbik7Cj4gICAJfQo+ICAgCj4gLQlk
bWFfZmVuY2VfcHV0KG1hbi0+bW92ZSk7Cj4gLQltYW4tPm1vdmUgPSBOVUxMOwo+ICsJdHRtX21l
bV90eXBlX21hbmFnZXJfY2xlYW51cChtYW4pOwo+ICAgCj4gICAJcmV0dXJuIHJldDsKPiAgIH0K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCBiL2luY2x1ZGUv
ZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiBpbmRleCA1NDhjMjcyOTRjNjQuLjQxYmZhNTE0YzI5
ZCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4gKysrIGIv
aW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+IEBAIC02ODAsNiArNjgwLDMyIEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9zZXRfdXNlZChzdHJ1Y3QgdHRt
X21lbV90eXBlX21hbmFnZXIgKm1hCj4gICAJbWFuLT51c2VfdHlwZSA9IHVzZWQ7Cj4gICB9Cj4g
ICAKPiArLyoqCj4gKyAqIHR0bV9tZW1fdHlwZV9tYW5hZ2VyX2Rpc2FibGUuCj4gKyAqCj4gKyAq
IEBtYW46IEEgbWVtb3J5IG1hbmFnZXIgb2JqZWN0Lgo+ICsgKgo+ICsgKiBJbmRpY2F0ZSB0aGUg
bWFuYWdlciBpcyBub3QgdG8gYmUgdXNlZCBhbmQgZGVyZWdpc3RlcmVkLiAodGVtcG9yYXJ5IGR1
cmluZyByZXdvcmspLgo+ICsgKi8KPiArc3RhdGljIGlubGluZSB2b2lkIHR0bV9tZW1fdHlwZV9t
YW5hZ2VyX2Rpc2FibGUoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4pCj4gK3sKPiAr
CW1hbi0+aGFzX3R5cGUgPSBmYWxzZTsKPiArCW1hbi0+dXNlX3R5cGUgPSBmYWxzZTsKPiArfQo+
ICsKPiArLyoqCj4gKyAqIHR0bV9tZW1fdHlwZV9tYW5hZ2VyX2NsZWFudXAKPiArICoKPiArICog
QG1hbjogQSBtZW1vcnkgbWFuYWdlciBvYmplY3QuCj4gKyAqCj4gKyAqIENsZWFudXAgdGhlIG1v
dmUgZmVuY2VzIGZyb20gdGhlIG1lbW9yeSBtYW5hZ2VyIG9iamVjdC4KPiArICovCj4gK3N0YXRp
YyBpbmxpbmUgdm9pZCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9jbGVhbnVwKHN0cnVjdCB0dG1fbWVt
X3R5cGVfbWFuYWdlciAqbWFuKQo+ICt7Cj4gKwlkbWFfZmVuY2VfcHV0KG1hbi0+bW92ZSk7Cj4g
KwltYW4tPm1vdmUgPSBOVUxMOwo+ICt9Cj4gKwo+ICAgLyoKPiAgICAqIHR0bV9ib191dGlsLmMK
PiAgICAqLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
