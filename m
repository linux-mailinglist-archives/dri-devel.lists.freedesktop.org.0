Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B8026D524
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 09:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB9A6EAE1;
	Thu, 17 Sep 2020 07:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0C16EAE1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 07:50:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtN9J6g67k4rLxABgl/uCHOLwpY6yXssOvCxG6f/0nMH/HwvziLNmzyVBcXmZmKTlMAXIxyJBvWrwp8WdKr/UtRRMRiIGAJIuK4ii/0Hpzmm8ambyaDaHgyCBhocQRHhAWUpWYytghqIzPLy0fjNvpQAfZYE1UpeOrenK8U+0rJQtf4qca0x4RLN91GKHKH6s3MrtphbFCSZwaZG8Dq+KCVinBwyDAp+Eepp8nahKsishLwNrfkJ252HdaTnpsulKp+p8n31YMeGdTElSRetVkhbdHeCHc66s5H8p3ZEP+3jlnYUSoQfob0GgTycglWDGgTW+qzVv9uwIEB2XD3smw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niMxo3hKfXuAmFukHVY+rCXwtk8/jxQl6kp/McUuero=;
 b=kSN7r8FYSJWKnKU2QBtWm8qCKDVmGJwB4R58YR3V5EntNe9Mwl/G705HHfbF7AKzLglErm+txCmth53EXhM6YW9mulT4vDHt5p73JQVv94FyZrzML+f+3VqgGdRn1BxCb1WJQP6EX62VMFT7KH14Zn9QaActE5mX1MnjsbPBL+VmjR30KhoX/mfLMkndj6qKUlabZsqw3VWDQDAjvh07H88u/74czV3twyy70YmstHba4UEgHExR9as8Fnws79pzQC1fh4aocaiW4vc50L7KDz0jcQKcJTE5ZW7tRWESCTTR6TpRBRx6r89gC1aQc+YKudzU9L0a9+HPOFzf1brFkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niMxo3hKfXuAmFukHVY+rCXwtk8/jxQl6kp/McUuero=;
 b=0DMfHwAZFf0TXAuIvo6F1y7TNDYO/RRb6cpQ/089gyLqpRvdlS0SArEvOnFZiKTwszAjKQ1QlxwB0tdzgk/l6fvWgBq2KO08vd3U4yg/lnjEHKE4GE1u7WAMfP+bQlJjh0RZG7sAMKRSMLDpjL34NKjnlP9+B51+mfQb9Dbnp3c=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4518.namprd12.prod.outlook.com (2603:10b6:208:266::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 07:50:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 07:50:39 +0000
Subject: Re: [PATCH 5/7] drm/ttm: add a simple assign mem to bo wrapper
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200917043040.146575-1-airlied@gmail.com>
 <20200917043040.146575-6-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1ae9d49a-4ece-28d4-8eb6-21b9799538d5@amd.com>
Date: Thu, 17 Sep 2020 09:50:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200917043040.146575-6-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0101CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0101CA0049.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend
 Transport; Thu, 17 Sep 2020 07:50:38 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 641758b5-c118-43d8-71cb-08d85ade5e90
X-MS-TrafficTypeDiagnostic: MN2PR12MB4518:
X-Microsoft-Antispam-PRVS: <MN2PR12MB45181A903E69601DF4F055D0833E0@MN2PR12MB4518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NeIFgerfKJ75SXnXyxl57yrVvQVGDW79mp4n7N6gq4OtlFkNcjqaWrmgqawdrIUbY+7tLXj/jJL0dEYvUmSTCkRZngAIfKxADUde/louZ7BV17H9b6XCvuh7/hS/qpyRUFqI4QE6zY3uIY5qBkR1aRByDiReChMK9JisRonbWHcBEPZ4f7HKCrcsBm6iBlU6D+H4wQATtmsrIsIBmUFuQiYfJbIv5j5khF3lXHHoCQjdbkb8HlkeZ4TCjI9JF+AgU3B43nswr67f7vV2TTsgWBacEbcr2aWb2UgpOqUs4AAJb3WSXD3t7w6ha2xiNg3qRKSqlUGNjK1M6FwMkiO6cCUNWGr61pCOz8kbY3C5V9ayO6LAIGHqet2t1sf79kpt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(6666004)(8936002)(86362001)(16526019)(316002)(8676002)(31696002)(186003)(52116002)(83380400001)(2906002)(36756003)(5660300002)(66946007)(66574015)(6486002)(66556008)(31686004)(478600001)(2616005)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: b2PR9pWQlgzvNS4AJjDybE1mxFSskP01EehlUC6B049V/KEUGA/uNNOJh2udnoDYpue3kP+mHugx5pdk4b2rYu6kZXioBwfZQs4zHKWk5qf/j/YL+50+zhSaOdC5aPsmMg0ODgXtifNpo8zMlqfCmUqjtA4MZLO4Z1nPC9DKpjxGAYzHm9SKq7RBNNf26IiJatzVoIaXRBbUYd12cWqQcDop+0G2JIyVcPvJrhIYWszuJ9BS9GAls7he2mG4xQF/HzAG2izzQ/dYepZCAsKIINQuZSMgk+b4L2AUV/S/hDODfYahE6oykdS9DQMNLvTdG1UnFHgwpwE7J5KxAmIL0NvwEiwrqMbAZdlJSHjdGRYNp568G3Nl0oQusxRNfepljEtWXf/cRTPIX6KtDzmja5F5x0zc3yCs1yQv4J/4PfU3E6iE0fWdXKRRmrTqDme0BEPOBwzfeTd93rzCnYc5RmzyEHgF+0Ad1hQ3aWIYZFaS9tvp7Og8upZYXGg/kMrMLldRcOpus8fWsnYD1J0fpictG4dqJoxsmSPz67fGR+A5E8r/iLRZjeSFV9rEWLHpfcS8GDEgqgqL/hgK8du1rL8n1ZupSdXaCgQH46wqjOG7BYVKT+Os2WoGVbnmVOWZdtDpvHN+A71lmEa1YBgnSy1K48ImpNmMHDtGWbpDl/Fx/vn+aTeMSC9cp6voSr/wOPmFcBs1G4sN9bPlSj4Ebw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 641758b5-c118-43d8-71cb-08d85ade5e90
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 07:50:39.0218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zqp1nVp30DJ57xOKvGaOxvaN9+zvfnwPA4lRNL4Vbj+PQy7de/l4Zac0EKE778nC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4518
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDkuMjAgdW0gMDY6MzAgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyBwYXR0ZXJuIGlzIGNhbGxlZCBpbiBh
IGZldyBwbGFjZXMsIGp1c3QgY2xlYW4gaXQgdXAuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9ib191dGlsLmMgfCAxOCArKysrKystLS0tLS0tLS0tLS0KPiAgIGluY2x1ZGUvZHJtL3R0
bS90dG1fYm9fZHJpdmVyLmggICB8IDEwICsrKysrKysrLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dXRpbC5jCj4gaW5kZXggOTE5NDg5ZjZhNWEzLi41YThkNzdlZjUwNGYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm9fdXRpbC5jCj4gQEAgLTg3LDkgKzg3LDcgQEAgaW50IHR0bV9ib19tb3ZlX3R0
bShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQkJcmV0dXJuIHJldDsKPiAgIAl9
Cj4gICAKPiAtCSpvbGRfbWVtID0gKm5ld19tZW07Cj4gLQluZXdfbWVtLT5tbV9ub2RlID0gTlVM
TDsKPiAtCj4gKwl0dG1fYm9fYXNzaWduX21lbShibywgbmV3X21lbSk7Cj4gICAJcmV0dXJuIDA7
Cj4gICB9Cj4gICBFWFBPUlRfU1lNQk9MKHR0bV9ib19tb3ZlX3R0bSk7Cj4gQEAgLTI5OSw4ICsy
OTcsOCBAQCBpbnQgdHRtX2JvX21vdmVfbWVtY3B5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Ym8sCj4gICAJbWIoKTsKPiAgIG91dDI6Cj4gICAJb2xkX2NvcHkgPSAqb2xkX21lbTsKPiAtCSpv
bGRfbWVtID0gKm5ld19tZW07Cj4gLQluZXdfbWVtLT5tbV9ub2RlID0gTlVMTDsKPiArCj4gKwl0
dG1fYm9fYXNzaWduX21lbShibywgbmV3X21lbSk7Cj4gICAKPiAgIAlpZiAoIW1hbi0+dXNlX3R0
KQo+ICAgCQl0dG1fYm9fdHRfZGVzdHJveShibyk7Cj4gQEAgLTUzNSw3ICs1MzMsNiBAQCBpbnQg
dHRtX2JvX21vdmVfYWNjZWxfY2xlYW51cChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+
ICAgewo+ICAgCXN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2ID0gYm8tPmJkZXY7Cj4gICAJc3Ry
dWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4gPSB0dG1fbWFuYWdlcl90eXBlKGJkZXYsIG5l
d19tZW0tPm1lbV90eXBlKTsKPiAtCXN0cnVjdCB0dG1fcmVzb3VyY2UgKm9sZF9tZW0gPSAmYm8t
Pm1lbTsKPiAgIAlpbnQgcmV0Owo+ICAgCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqZ2hvc3Rf
b2JqOwo+ICAgCj4gQEAgLTU4Miw4ICs1NzksNyBAQCBpbnQgdHRtX2JvX21vdmVfYWNjZWxfY2xl
YW51cChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQl0dG1fYm9fcHV0KGdob3N0
X29iaik7Cj4gICAJfQo+ICAgCj4gLQkqb2xkX21lbSA9ICpuZXdfbWVtOwo+IC0JbmV3X21lbS0+
bW1fbm9kZSA9IE5VTEw7Cj4gKwl0dG1fYm9fYXNzaWduX21lbShibywgbmV3X21lbSk7Cj4gICAK
PiAgIAlyZXR1cm4gMDsKPiAgIH0KPiBAQCAtNTk0LDkgKzU5MCw4IEBAIGludCB0dG1fYm9fcGlw
ZWxpbmVfbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQkJIHN0cnVjdCB0
dG1fcmVzb3VyY2UgKm5ld19tZW0pCj4gICB7Cj4gICAJc3RydWN0IHR0bV9ib19kZXZpY2UgKmJk
ZXYgPSBiby0+YmRldjsKPiAtCXN0cnVjdCB0dG1fcmVzb3VyY2UgKm9sZF9tZW0gPSAmYm8tPm1l
bTsKPiAgIAo+IC0Jc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICpmcm9tID0gdHRtX21hbmFn
ZXJfdHlwZShiZGV2LCBvbGRfbWVtLT5tZW1fdHlwZSk7Cj4gKwlzdHJ1Y3QgdHRtX3Jlc291cmNl
X21hbmFnZXIgKmZyb20gPSB0dG1fbWFuYWdlcl90eXBlKGJkZXYsIGJvLT5tZW0ubWVtX3R5cGUp
Owo+ICAgCXN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqdG8gPSB0dG1fbWFuYWdlcl90eXBl
KGJkZXYsIG5ld19tZW0tPm1lbV90eXBlKTsKPiAgIAo+ICAgCWludCByZXQ7Cj4gQEAgLTY3Myw4
ICs2NjgsNyBAQCBpbnQgdHRtX2JvX3BpcGVsaW5lX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibywKPiAgIAkJdHRtX2JvX2ZyZWVfb2xkX25vZGUoYm8pOwo+ICAgCX0KPiAgIAo+IC0J
Km9sZF9tZW0gPSAqbmV3X21lbTsKPiAtCW5ld19tZW0tPm1tX25vZGUgPSBOVUxMOwo+ICsJdHRt
X2JvX2Fzc2lnbl9tZW0oYm8sIG5ld19tZW0pOwo+ICAgCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggYi9pbmNsdWRlL2Ry
bS90dG0vdHRtX2JvX2RyaXZlci5oCj4gaW5kZXggNzg0NmRmYTUwN2Y3Li4yNWNjOTMyZDYzZjEg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+ICsrKyBiL2lu
Y2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiBAQCAtNTM5LDYgKzUzOSwxMyBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWxfdW5sb2NrZWQoc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibwo+ICAgCXNwaW5fdW5sb2NrKCZ0dG1fYm9fZ2xvYi5scnVfbG9j
ayk7Cj4gICB9Cj4gICAKPiArc3RhdGljIGlubGluZSB2b2lkIHR0bV9ib19hc3NpZ25fbWVtKHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gKwkJCQkgICAgIHN0cnVjdCB0dG1fcmVzb3Vy
Y2UgKm5ld19tZW0pCj4gK3sKPiArCWJvLT5tZW0gPSAqbmV3X21lbTsKPiArCW5ld19tZW0tPm1t
X25vZGUgPSBOVUxMOwo+ICt9Cj4gKwo+ICAgLyoqCj4gICAgKiB0dG1fYm9fbW92ZV9udWxsID0g
YXNzaWduIG1lbW9yeSBmb3IgYSBidWZmZXIgb2JqZWN0Lgo+ICAgICogQGJvOiBUaGUgYm8gdG8g
YXNzaWduIHRoZSBtZW1vcnkgdG8KPiBAQCAtNTUyLDggKzU1OSw3IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCB0dG1fYm9fbW92ZV9udWxsKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAJ
c3RydWN0IHR0bV9yZXNvdXJjZSAqb2xkX21lbSA9ICZiby0+bWVtOwo+ICAgCj4gICAJV0FSTl9P
TihvbGRfbWVtLT5tbV9ub2RlICE9IE5VTEwpOwo+IC0JKm9sZF9tZW0gPSAqbmV3X21lbTsKPiAt
CW5ld19tZW0tPm1tX25vZGUgPSBOVUxMOwo+ICsJdHRtX2JvX2Fzc2lnbl9tZW0oYm8sIG5ld19t
ZW0pOwo+ICAgfQo+ICAgCj4gICAvKioKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
