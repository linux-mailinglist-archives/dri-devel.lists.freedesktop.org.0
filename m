Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202E919F181
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 10:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741996E02B;
	Mon,  6 Apr 2020 08:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41AE6E02B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 08:25:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYgpGJn9Sh/WMGRQfi+yTuQKlJR5kIQvu/6h0aGem6Hh4o1ZmCLlYo0XAXYWX5d0k/iMXIwwEy29Aj+g7LHH72IyZdwWKmg3Pof1t0HUVKPlFppBJSU+h3qLSlOnp3nKcbIZE9d4kG3R5phf1TnXtGfSshbT8NaQAR44tLsIa2LxASVsZ9Xs7YbfIwFIGlgxsAPIsM4jd4sT/q88S6WOQEUkfxLPRNgAJYP/xLU4VSCcPEzDhoaOtu11jG9RzmpK/9+Izt5fvPwNjQQcxGe5F0odNoYvmdEISjlN87tEpmHhRzRXndnuqJKwmr7Wneng8Wbwl8cmH69+/JITwrDurA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/sJkh3W61XG8QOKmQC02OpMrRbOhPXFZumczdMZ71A=;
 b=R8knyQ18dii9hx3sM4leNrpUbHkRFpYNwFB7gn0VobMAuBry/viIYJiZWcdFQuZgWj3Vg5xsBKrYJIv8vypkS+Hderq2FHrZLcgqvlye/oPEFLoC5pGfnhObYm9QyKOzMZU7PzxqItnzGVDtgLZkZ584tgcAbtoCjfYRZuOpkIiA1uPHOgsmyyQZgBHOr4yj8ahRxE2y7Doy/tNLHGQlD/tKerU9Bkd2H9/NIw0isyI8Nd2HqHzUGinbCznG89kebUIrd2lnpoUdMyLLwXaVQPtoChsNKgyn9VwYNDdqhjOSU5os3RjS61aw2CikBcxBK9ge97QAbX8Q3o/IArF/Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/sJkh3W61XG8QOKmQC02OpMrRbOhPXFZumczdMZ71A=;
 b=JWrf0TPxS9cjqhPAZhH4VKMIXhsqj5aSFYpLJId7urVxm4gj9systJG2tuTGGeNH7WOaLSJtk6vILNSIs04uWEU+Py5d+MjsC1V8T9Dsu5asgVJavWwdPiWxrEsQPCxDkknzhaznP7xen7iKgpMYEdFYBpigEcJIw54SPA9xH0E=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB2841.namprd12.prod.outlook.com (2603:10b6:5:49::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Mon, 6 Apr
 2020 08:25:27 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2%4]) with mapi id 15.20.2878.018; Mon, 6 Apr 2020
 08:25:27 +0000
Subject: Re: [PATCH] drm/mm: revert "Break long searches in fragmented address
 spaces"
To: "Das, Nirmoy" <Nirmoy.Das@amd.com>
References: <20200330123425.3944-1-christian.koenig@amd.com>
 <c124b5d1-efc6-e826-2387-9f9ad06d1df0@gmail.com>
 <20200331091618.GM2363188@phenom.ffwll.local>
 <158564641293.18289.1145145659054294433@build.alporthouse.com>
 <CAKMK7uGNxhZB9Fd3i7rGK42pAgoJACRoR_NrrXF6rfCFkrg4GQ@mail.gmail.com>
 <158566075049.18289.17918401274396829066@build.alporthouse.com>
 <547dca13-bd62-9319-ee44-6894ee1b60af@gmail.com>
 <158573119432.5852.5430250256131238311@build.alporthouse.com>
 <95c061fb-6189-855d-bde9-57d4c2d99aff@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <78ee7ee3-3c19-1411-5e56-e2c49a657981@amd.com>
Date: Mon, 6 Apr 2020 10:25:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <95c061fb-6189-855d-bde9-57d4c2d99aff@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:208:55::36) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR05CA0023.eurprd05.prod.outlook.com (2603:10a6:208:55::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20 via Frontend Transport; Mon, 6 Apr 2020 08:25:25 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1254c1d7-03cf-4278-2df3-08d7da040f55
X-MS-TrafficTypeDiagnostic: DM6PR12MB2841:|DM6PR12MB2841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB284183E6BA88F98966CD517D83C20@DM6PR12MB2841.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 0365C0E14B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(37006003)(31686004)(316002)(478600001)(4326008)(54906003)(66556008)(6486002)(6862004)(36756003)(16526019)(66476007)(66946007)(2616005)(6636002)(53546011)(186003)(6666004)(31696002)(52116002)(86362001)(81156014)(5660300002)(2906002)(8676002)(81166006)(8936002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aoJ8qmKhw24T0iCuQVYaDlYtGSt28GNRsANiCjvDVWUnz5Mjzn274d8avsYdkorpSghqzw3ge3EOsUH2cjtK/0Fd36ZMWLaZEir0bM2khS96Z6tlNWTL7qbW+sz4J7jEd8tpNcDRVoJ/bFbGeE0vdbKm5Le2pqy/7nnxsM5+aRxrvzGVW2cnMXJGEFnuXezPRWU7ub60p7q3o1IdyyEVg9ktm/B9ccTiG6/jGpsjeJCTo826WI++xqP+a2q7OW2UQoGVx7V7T0iC7CGZMdd6YiboELHjig4Rf5ACIMjazielHepTU1aGWKo6ctB8SgpNze2E3zHhmp5qLDRp+nDyubZ7xDKISufwuqR6kbV1/5zEJu9QhrZ36OFAPoF+SLGlYXVicTrVgQDpJB5bLKv3cedN9n3p34uFYA3pqqiPpyhFXmmbyVSLdBAb9/uUbjKw
X-MS-Exchange-AntiSpam-MessageData: LT9dusreYGi32IO9BgtsC1AgIJ90kldmH/8ITEi7K1VhPAd+rQ+MwJ9KA0apvVeLa/SUurzrjJQXOlx6N6gIBZw9u/fGmGJ2RuL378zro4boE49qmBb5hCOBOyWsSFbdXR0GLgB/IoCHGDr76vKSKKnjfKQwzGAMibX04iyQGaiN72s4ftLq37iFxq1ERyTQeh0Ez8apspoN5pl7/kfcaQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1254c1d7-03cf-4278-2df3-08d7da040f55
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2020 08:25:26.9951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2m58pNygRqjTY7FXHWNsOy0EOO5eis2g//65aMDK8X4Ez9CgpmEl6zacnonmnNng
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2841
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FkZGluZyBOaXJtb3ksIHNldHRpbmcgYnVuY2ggb2YgcGVvcGxlIHRvIEJDQ10KClRoaXMgYnVi
YmxlZCB1cCBpbiBvdXIgaW50ZXJuYWwgdGVzdGluZyBhcyB3ZWxsLiBOaXJtb3kgbm93IHdhbnRz
IHRvIAp0YWtlIGEgbG9vayBhdCBpdC4KCkFtIDAxLjA0LjIwIHVtIDExOjE3IHNjaHJpZWIgQ2hy
aXN0aWFuIEvDtm5pZzoKPiBBbSAwMS4wNC4yMCB1bSAxMDo1MyBzY2hyaWViIENocmlzIFdpbHNv
bjoKPj4gUXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDIwLTA0LTAxIDA4OjI5OjM0KQo+Pj4g
QW0gMzEuMDMuMjAgdW0gMTU6MTkgc2NocmllYiBDaHJpcyBXaWxzb246Cj4+Pj4gUXVvdGluZyBE
YW5pZWwgVmV0dGVyICgyMDIwLTAzLTMxIDExOjM4OjUwKQo+Pj4+PiBPbiBUdWUsIE1hciAzMSwg
MjAyMCBhdCAxMToyMCBBTSBDaHJpcyBXaWxzb24gCj4+Pj4+IDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+IHdyb3RlOgo+Pj4+Pj4gUXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDIwLTAzLTMxIDEw
OjE2OjE4KQo+Pj4+Pj4+IE9uIFR1ZSwgTWFyIDMxLCAyMDIwIGF0IDEwOjU5OjQ1QU0gKzAyMDAs
IENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4gW1NOSVBdCj4+Pj4gV2UgYWxsb3cgdXNl
cnNwYWNlIHRvIHBvaXNvbiB0aGUgZHJtX21tIGF0IHJvdWdobHkgOEsgaW50ZXJ2YWxzLCBhCj4+
Pj4gc2VhcmNoIHNwYWNlIG9mIDM1YiB3aXRoIHR5cGljYWxseSBPKE5eMikgYmVoYXZpb3VyIGFu
ZCBlYWNoIG5vZGUKPj4+PiB0cmF2ZXJzYWwgKHJiX25leHQvcmJfcHJldikgd2lsbCBpdHNlbGYg
YmUgY29zdGx5LiBFdmVuIG91ciBzaW1wbGUgCj4+Pj4gdGVzdHMKPj4+PiBjYW4gZ2VuZXJhdGUg
YSBzZWFyY2ggb2Ygc2V2ZXJhbCBtaW51dGVzIGJlZm9yZSBvdXIgcGF0aWVuY2UgcnVucyAKPj4+
PiBvdXQubwo+Pj4+IEFueSBkcm1fbW0gdGhhdCBhbGxvd3MgZm9yIHVzZXJzcGFjZSB0byBjb250
cm9sIGFsaWdubWVudCBjYW4gYmUKPj4+PiBhcmJpdHJhcmlseSBmcmFnbWVudGVkLCBoZW5jZSBh
IHJhaXNlZCBleWVicm93IHRoYXQgdGhpcyBzZWFyY2ggCj4+Pj4gd291bGQgYmUKPj4+PiBhbGxv
d2VkIGluIGF0b21pYyBjb250ZXh0Lgo+Pj4gV293LCB0aGF0IGlzIGluZGVlZCBxdWl0ZSBhIGxv
dC4KPj4+Cj4+PiBXaGF0IGlzIHRoZSBjcml0ZXJpYSB1c2UgZm9yIG9yZGVyaW5nIHRoZSB0cmVl
PyBKdXN0IHRoZSBzaXplIG9yIGlzIAo+Pj4gdGhhdAo+Pj4gc2l6ZSthbGlnbm1lbnQ/Cj4+IFRo
ZSB0cmVlIGlzIGp1c3Qgc2l6ZS4gQWxpZ25tZW50IGlzIGEgbGl0dGxlIHVzZWQgcGFyYW1ldGVy
LCBidXQgdGhlcmUncwo+PiBhIHJlcXVpcmVtZW50IGZvciB1c2Vyc3BhY2UgdG8gYmUgYWJsZSB0
byBjb250cm9sIGl0IC0tIGFsdGhvdWdoIGl0IGlzCj4+IHN0cmljdGx5IHRoZSBvbGRlciBpbnRl
cmZhY2UsIGl0IGlzIHN0aWxsIG9wZW4gdG8gYWJ1c2UuCj4+Cj4+IENvbnZlcnRpbmcgdGhlIHRy
ZWUgdG8gW3NpemUsIGZmcyhhZGRyKV0gd291bGQgaGVscCBmb3IgbWFueSwgYnV0IG9uIHRvcAo+
PiBvZiB0aGF0IHdlIGhhdmUgem9uZXMgaW4gdGhlIGRybV9tbSwgc28gc2VhcmNoLWluLXJhbmdl
IGNhbiBiZSBhYnVzZWQgb24KPj4gdG9wIG9mIHNlYXJjaC1mb3ItYWxpZ25tZW50Lgo+Cj4gVGhl
IGRpZmZlcmVuY2UgaXMgdGhhdCBzZWFyY2ggaW4gcmFuZ2UgaXMgbm90IGNvbnRyb2xsYWJsZSBi
eSAKPiB1c2Vyc3BhY2UsIGJ1dCBhdCBsZWFzdCBmb3IgYW1kZ3B1IHRoZSBhbGlnbm1lbnQgaXMg
dmVyeSB3ZWxsIAo+IGNvbnRyb2xsYWJsZS4KPgo+Pj4gTmV2ZXIgbG9va2VkIGludG8gdGhpcywg
YnV0IG1heWJlIHdlIGhhdmUgYSBsb3cgaGFuZ2luZyBmcnVpdCBmb3IgYW4KPj4+IGltcHJvdmVt
ZW50IGhlcmU/Cj4+IEEgYml0IC0tIGFsaWdubWVudCBpcyBzbyByYXJlbHkgdXNlZCBpbiBwcmFj
dGljZSwgb3B0aW1pc2luZyBpdCB3YXMgbm90Cj4+IGEgY29uY2VybiwganVzdCBzb21lb25lIGVs
c2UgaGFzIG5vdyBub3RpY2VkIHRoZSBwb3RlbnRpYWwgZm9yIGFidXNlLgo+Cj4gV2VsbCB3ZSBk
byB1c2UgYWxpZ25tZW50IHJhdGhlciB3aWRlbHkuIElJUkMgd2UgY2FuIGhhdmUgZXZlcnl0aGlu
ZyAKPiBiZXR3ZWVuIDRLIGFuZCAyTUIgYmFzZWQgb24gdGhlIHRpbGxpbmcgZmxhZ3MsIG1lbW9y
eSBjaGFubmVsIGNvbmZpZyAKPiBldGMgZXRjLi4uCj4KPj4gVGhleSByYW4gYSB0ZXN0LCBnZXQg
Ym9yZWQgYW5kIGNvbXBsYWluZWQgdGhhdCBpdCBkaWRuJ3QgcmVzcG9uZCB0byBeQwo+PiBmb3Ig
YSBsb25nIHBlcmlvZCBvZiB0aW1lIGFuZCBmcm9tIHRoYXQgZGVyaXZlIGEgcHJvb2Ytb2YtY29u
Y2VwdCAKPj4gdGVzdCB0bwo+PiBzaG93IGhvdyBpdCBjYW4gYmUgdXNlZCBieSBvbmUgY2xpZW50
IHRvIHVwc2V0IGFub3RoZXIgOnwKPgo+IEFuZCBhcyBmYXIgYXMgSSBjYW4gc2VlIHRoYXQgaXMg
YSByZWFsbHkgdmFsaWQgcHJvYmxlbSB3ZSBuZWVkIHRvIGZpeC4gCj4gR2l2ZSBtZSBhIHNlY29u
ZCB0byB3cml0ZSBhIHRlc3QgY2FzZSBmb3IgdGhpcy4KCk5pcm1veSwgY291bGQgeW91IHRhY2ts
ZSB0aGlzIGZpcnN0PyBJJ3ZlIGNhbWUgdXAgd2l0aCBzb21lIHZlcnkgcXVpY2sgCmFuZCBkaXJ0
eSBjb2RlIGZvciB0aGlzIGZvciBvdXIgbGliZHJtIHVuaXQgdGVzdHMuCgpQaW5nIG1lIGludGVy
bmFsbHkgYW5kIHdlIGNhbiBjaGF0IGFib3V0IGl0LgoKVGhhbmtzLApDaHJpc3RpYW4uCgo+Cj4g
VGhhbmtzIGZvciBwb2ludGluZyB0aGF0IG91dCwKPiBDaHJpc3RpYW4uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
