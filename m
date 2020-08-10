Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2A82405B6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 14:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF28C89B98;
	Mon, 10 Aug 2020 12:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E6D89B98
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 12:20:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BouMjC3WNsdXZQBsluICaicSJFRYJ0jVGuY3fX0+0Bpe2IBL0DQF8JyqLAZbScQeIIdMlkDyKGCHbnK7e4cCuolgvH43tl6bKpI5gcErz9RIaNFT4CbQk3gUH4priLBhxqG5ZHmhxMMpU7ounfIfd4/kBip06N5J6OysHktQP/AMP54jjOGH68P7TfN3j588yKAweS5z09JPAzCem3j+tD1cAMq+OCs93hn9qHZk3ZW4cHjj7ejKb22+I8BinsDh/Ba/aBUBAqayClSV5gLyFhweLK895pgcsDrnCuCX/qHawVldc2t8XQ+KZ4UtbwHrX0xOlEjf5wHzM/CpKn+/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+cdzEXi9c+HzV8Vius5uwsqJDEI4tHzZ2yny39PSrw=;
 b=gK0wGXpuhyyhZNFUKFSocbUz0LJdkyF4kizqsyfVf4ZRIZpoHe/Wb/SExYQoLuB4r87VZ323IYRdbdYrJInJEiMnr9rIyGwAIjRp01LmOTY6bLjUZN/yrV0Yf3s0i1jlA0I6Sos7KPp4NFxRokMBErKwdSAaT8wQRKJN+RdiYPsif9uVnwAHihtZ6RVgXCazluVjR21PnaK5clHki07tHG90XqPeWRKVaMoRQuXe8ii2fgH1ZR7/0jzFcufXo0JF8C6shwg44LREShxH+WnGfNxUDf4Gdoj/oDC2WntgpF0irP8E2/LZAcUx5GLBcy3ckpJnK04t+mtL/2Fge0Y2tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+cdzEXi9c+HzV8Vius5uwsqJDEI4tHzZ2yny39PSrw=;
 b=fNiR0gDtRnuJ2unODXPMEdDUhzvVcQYvc8Z40XgKG1PBLAUFL9uSNEXOH2lMfk+y8GZ8kiVdeHg54/HTbVGZ6PSLa3WOqILPDHN2+ywx1/eav39DLCI8KD77hlsUEZd9ZicOaiYU3c0q89yTZfbHdlx2QQ71D5wu0z0EHHURMW8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3998.namprd12.prod.outlook.com (2603:10b6:208:16d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 12:20:27 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 12:20:27 +0000
Subject: Re: [linux.git drm/ttm]: NULL pointer dereference upon driver probe
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: Roland Scheidegger <sroland@vmware.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>
References: <230cc360-89b9-bb39-ee7e-d68ac037345f@i-love.sakura.ne.jp>
 <e5822548-4373-5020-eb3a-9d6144b74d25@amd.com>
 <be670819-20d0-0757-a0f9-20054a527e77@vmware.com>
 <33c4495c-7fb5-f075-b30b-9ab9bdd4ce32@amd.com>
Message-ID: <e4055371-5a78-0b32-9e1f-d17d865cbb8c@amd.com>
Date: Mon, 10 Aug 2020 14:20:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <33c4495c-7fb5-f075-b30b-9ab9bdd4ce32@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0130.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::47) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0130.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.15 via Frontend Transport; Mon, 10 Aug 2020 12:20:25 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7e636f8e-950b-4a94-133f-08d83d27c383
X-MS-TrafficTypeDiagnostic: MN2PR12MB3998:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39985D70B5449F78533ADC5C83440@MN2PR12MB3998.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yhAKWbnWYsqyZOaJ11N/HGkdnz2rWLQmIfNOc7f4a+Xs0pCzCB8DD78UOggltNPw8hRQoEzSBLn9W8iNjrkZtZuereeOIUaSHIk3QjtJhCO+DNhF27DhnMROkGTOCce4nA8r75pYlkPWAgvZOh5nPRH8mW/EgbsUeonPgiLy07GXShXvqzu6mVugeVdOf4m2RlTOPehBrm0yXBHebOEAPGqZsMsO6H9VcWD0/btXYJV48W780/XPCagnBqTkL24Vcw5XX3/tcIxeMH23g4CbD0MqHjjuCI0Jjk6MS3TH0ua/Bc5giCousFyArBgiojdC16Va5PJQ68ClOYvgQSXspZ2WBn1xRlO8NwpFUZniQoUOmamsaLCN6ngIVQP2UiqO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(31686004)(16526019)(186003)(316002)(66556008)(5660300002)(8936002)(66946007)(2906002)(2616005)(478600001)(66476007)(6486002)(110136005)(54906003)(31696002)(83380400001)(36756003)(52116002)(4326008)(86362001)(6666004)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 1oIo1g1YJGL7GCwFtOg7312fVPhNo2ma6jBBq175myFFSvmvAUhkACnxD78Swoi1q3UNQBtbqhhDfhYY/pNvRQLIKdkeuWJPRdOU96QfCCv6Oh/QwMyUf6cGU2JRMUhaMQ6eRth4OPkg74Ua8z9U5lEHV6MvTWmZtPoBAr0ocKuypZrP6xyDu7kRv4kfMmiR0hBVNY9qR09f7BQ5c5YAG56aaBaaELPfl9NLsXjb5zdxLD43F+n+LS9TyZPKrpnwIg28ksVu2bCQuGMWSbMDfO3CGxZTGEeuVYDoZLbLjkObx7nkL3yLexWYs5BjIFxqzC24aqBNeLVawezK49FUvLhyw4Ky1UwGv9uKqPyLOV0+iqAtLR4IbBXyjcpi1Tz4KDplaUxLIiXzF17GST+KLrbfQBH7qxlvOFxMWi7g3a4SXbF1KiQ7dvfO73suF9YmuL9+xj3mpStB13lVZjvgWw7yY14ql/5Ze3GrnBo3uUSkupotrivG1c/Rm+Zu8GY8+jxiraO63DDRr9ILVTglLX0Szp36hlj5HJ2sNm+sdTVPM8OzGY4lUQ7GjkG2HBtot3/l6y0CvarduYVQDeSJt5Lh8T5vxWBl2PI/Qh9/CrE30K6F6saqwwjEcaB2ZV2U1gRD/s99UET1Al58A9u5Qp/XNA3VonS9m8bIBTSNGAEaJKsWeWzfyeTU/Otlnij+hD3H6M3vJRZeC2FtoI8IWw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e636f8e-950b-4a94-133f-08d83d27c383
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 12:20:27.1708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7SAhdcXd3eYKN9kcOI63SS8bz1YQ/rXBul5YyNMd++wdlqk1CPrCqiscAMY/Us6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3998
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
Cc: David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDcuMDguMjAgdW0gMDk6MDIgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFtIDA2LjA4
LjIwIHVtIDIwOjUwIHNjaHJpZWIgUm9sYW5kIFNjaGVpZGVnZ2VyOgo+PiBBbSAwNi4wOC4yMCB1
bSAxNzoyOCBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+PiBNeSBiZXN0IGd1ZXNzIGlzIHRo
YXQgeW91IGFyZSBmYWNpbmcgdHdvIHNlcGFyYXRlIGJ1Z3MgaGVyZS4KPj4+Cj4+PiBDcmFzaCAj
MSBpcyBzb21laG93IHJlbGF0ZWQgdG8gQ1JUQ3MgYW5kIG1pZ2h0IGV2ZW4gYmUgY2F1c2UgYnkg
dGhlCj4+PiBhdG9taWMtaGVscGVyIGNoYW5nZSB5b3Ugbm90ZWQgYmVsb3cuCj4+Pgo+Pj4gQ3Jh
c2ggIzIgaXMgY2F1c2VkIGJlY2F1c2Ugdm13X2JvX2NyZWF0ZV9hbmRfcG9wdWxhdGUoKSB0cmll
cyB0bwo+Pj4gbWFudWFsbHkgcG9wdWxhdGUgYSBCTyBvYmplY3QgaW5zdGVhZCBvZiByZWx5aW5n
IG9uIFRUTSB0byBkbyBpdCB3aGVuCj4+PiBuZWNlc3NhcnkuIFRoaXMgaW5kZWVkIGRvZXNuJ3Qg
d29yayBhbnkgbW9yZSBiZWNhdXNlIG9mICJkcm0vdHRtOiBtYWtlCj4+PiBUVCBjcmVhdGlvbiBw
dXJlbHkgb3B0aW9uYWwgdjMiLgo+Pj4KPj4+IFF1ZXN0aW9uIGlzIHdoeSB2bXdnZnggaXMgZG9p
bmcgdGhpcz8KPj4gTm90IHJlYWxseSBzdXJlIHVuZm9ydHVuYXRlbHksIGl0J3MgcG9zc2libGUg
dm13Z2Z4IGlzIGRvaW5nIGl0IGJlY2F1c2UKPj4gdHRtIGxhY2tlZCBzb21lIGNhcGFiaWxpdGll
cyBhdCBzb21lIHBvaW50Pwo+Cj4gSSB0aGluayBzbyBhcyB3ZWxsLCB5ZXMuCj4KPj4gwqAgVHJ5
aW5nIHRvIGZpZ3VyZSB0aGlzIG9uZSBvdXQuLi4KPgo+IFByb2JsZW0gaXMgdGhhdCB3aGF0IHZt
d2dmeCBpcyBkb2luZyBoZXJlIGlzIHF1ZXN0aW9uYWJsZSBhdCBiZXN0Lgo+Cj4gQnkgZGVmaW5p
dGlvbiBCT3MgaW4gdGhlIFNZU1RFTSBkb21haW4gYXJlIG5vdCBhY2Nlc3NpYmxlIGJ5IHRoZSBH
UFUsIAo+IGV2ZW4gaWYgaXQgaXMgYSB2aXJ0dWFsIG9uZS4KPgo+IEFuZCB3aGF0IHZtd2dmeCBk
b2VzIGlzIGFsbG9jYXRpbmcgb25lIGluIHRoZSBTWVNURU0gZG9tYWluIGFzIG5vdCAKPiBldmlj
dGFibGUgYW5kIHRoZW4gYnlwYXNzaW5nIFRUTSBpbiBmaWxsaW5nIGFuZCBtYXBwaW5nIGl0IHRv
IHRoZSBHUFUuCj4KPiBUaGF0IGRvZXNuJ3QgcmVhbGx5IG1ha2VzIHNlbnNlIHRvIG1lLCB3aHkg
c2hvdWxkbid0IHRoYXQgQk8gYmUgcHV0IGluIAo+IHRoZSBHVFQgZG9tYWluIHRoZW4gaW4gdGhl
IGZpcnN0IHBsYWNlPwoKV2VsbCBJIHRoaW5rIEkgZmlndXJlZCBvdXQgd2hhdCBWTVdHRlggaXMg
ZG9pbmcgaGVyZSwgYnV0IHlvdSB3b24ndCBsaWtlIGl0LgoKU2VlIFZNV0dGWCBkb2Vzbid0IHN1
cHBvcnQgVFRNcyBHVFQgZG9tYWluLiBTbyB0byBpbXBsZW1lbnQgdGhlIG1vYiBhbmQgCm90YWJs
ZSBCT3MgaXQgaXMgYWxsb2NhdGluZyBzeXN0ZW0gZG9tYWluIEJPcywgcGlubmluZyB0aGVtIGFu
ZCBtYW51YWxseSAKZmlsbGluZyB0aGVtIHdpdGggcGFnZXMuCgpUaGUgY29ycmVjdCBmaXggd291
bGQgYmUgdG8gYXVkaXQgVk1XR0ZYIGFuZCBmaXggdGhpcyBoYW5kbGluZyBzbyB0aGF0IAppdCBk
b2Vzbid0IG1lc3MgYW55IG1vcmUgd2l0aCBUVE0gaW50ZXJuYWwgb2JqZWN0IHN0YXRlLgoKVGls
bCB0aGF0IGhhcHBlbnMgd2UgY2FuIG9ubHkgcmV2ZXJ0IHRoZSBwYXRjaCBmb3Igbm93LgoKQ2hy
aXN0aWFuLgoKPgo+IENocmlzdGlhbi4KPgo+Pgo+PiBSb2xhbmQKPj4KPj4KPj4+IFJlZ2FyZHMs
Cj4+PiBDaHJpc3RpYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
