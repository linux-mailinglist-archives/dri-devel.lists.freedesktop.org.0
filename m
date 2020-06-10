Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3269D1F5DA3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 23:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537FF6E865;
	Wed, 10 Jun 2020 21:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4236E830;
 Wed, 10 Jun 2020 21:19:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZacHXsFT9EO3kKJxfpFe/47VCe56/nDxswtMQflVeDRWG2S14Gcl0hRlhBQjyNqcjsdrkupsfQ7oK7Pij3RaDIJnnGHFub3FzojWVwA253nVkqBw1j//J8CDITJVG3r+dfzBVCOxReb8BH94IRTPU+SsotmA3N1NA4QyfzDt2pf683/9CDQYqiYhfpVZv4eHKhWI1MfPj/PTlcF0nuLMTVct9cwcGf72wjlpZR1tDkEtb3vrsROg+7MWGrQJoXlo9ieMywhyr5B/f0Qy4YAK7jfGjXjD96kB+t28H+etOFfpQpNEGLV4nq2/z7fA3FQ/FJIrV0oKgMPT3XcAxtiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4evMwxF4jkC/JuQ+oEMeXg/rTLikBtACtc8+pWRjXA=;
 b=boBTvgqTeC21Wq0I6yGbm5hseZ70nQGA3fnubWmyHzXB6FAwXjdZpAjWsD7y80SKdmgINHnLmGbCsSJZ6zmXeKkV4X+v+YZd6cQXayrdAbUpvZKDUPEkl3FXiP7TmWhqgkTtB1fGtfg+nZEQcs7j5LwiUeFFBUJoCiHgnup9fgaYRtHyiJ/pprUy6A33pw+hhCFqTGH16D66xOUuUUp9/Ak20pWd2d+68bx+i857nAo0XjPOp96kZ8j+mOfV/HIK2aJRINgD+Wwb2XzkqfXKsL5WoHzYpg+vMcUof5P8l8cIFsS8JExQ4RTqjgXb4h2jwMhPgFu6ZJIiMoIUeUhm1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4evMwxF4jkC/JuQ+oEMeXg/rTLikBtACtc8+pWRjXA=;
 b=HNhEkiZx7wnTaPqr6wcXefVATNQgqUzU7sW2SE3djHzBEWao8dMt2qj5RiyFWSr5FkEHCXeBhhGIhGF8TqEpOZOran0Orj9s/f1WmbJM8KMzAgMFA/rTVB5Z7J7YxELjwxnXd4Hzzh5CdnthL5KvwbQzxI4FV1Wz2dudLRN/J3M=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB3850.namprd12.prod.outlook.com (2603:10b6:5:1c3::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.21; Wed, 10 Jun 2020 21:19:23 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df%2]) with mapi id 15.20.3088.018; Wed, 10 Jun 2020
 21:19:23 +0000
Subject: Re: [PATCH 1/6] drm/ttm: Add unampping of the entire device address
 space
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <f36c1fa1-bbee-477a-9cb2-ed2726f27eef@email.android.com>
 <eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org>
 <b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com>
 <ce6f6109-67df-e3d0-d56e-3f5c27df40a0@amd.com>
 <20200610153020.GZ20149@phenom.ffwll.local>
 <715ad9d4-7763-382e-237e-8daab42eff46@shipmail.org>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <52eec123-3fb1-843d-4ede-1fa0daeaa8ce@amd.com>
Date: Wed, 10 Jun 2020 17:19:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <715ad9d4-7763-382e-237e-8daab42eff46@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::20) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3ee0:2de:8925:fc4b:27b0:2560]
 (2607:fea8:3ee0:2de:8925:fc4b:27b0:2560) by
 YTXPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Wed, 10 Jun 2020 21:19:23 +0000
X-Originating-IP: [2607:fea8:3ee0:2de:8925:fc4b:27b0:2560]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e1244d7d-16ed-4f05-f482-08d80d83f2c0
X-MS-TrafficTypeDiagnostic: DM6PR12MB3850:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3850F34CD1FC6A11AF6C93EAEA830@DM6PR12MB3850.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PY+buNk/aQ4VdgeXOBCe/C6wjT8yr9DbqvOVdCYjZS6D5Wrd/RjRGFElA/Bv345iptz+ncUo+dv+KTLiHdDJt8UKJ9Rs82Zy2Kz/PqSH6jRNIC4JWWpeXBn6UUkCftQBMZ4MR+jbSSJSC2Kh7a22hLqdsypEOSmxxnSaIypXJMDJ4w9wQFnVOwZyQPGUuAvqWmurZ+7h86JhWTHzhj0xKV0d95JDOcfvs41dnyBE8v1dT/jhRTw0GBo4WuedajrGYKoR9zooJKa2kawHsKPY23e1o8BlbuGzo34cRIF3icfmKu6sXXuKF3b8VHbr/YwregZBE2HQRC4eL0VrACTdhpGQlmSfi1DHEG7a0umcmjJsFxBNX2z9v3C+NqkJvceT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(8936002)(6486002)(83380400001)(478600001)(2906002)(53546011)(5660300002)(16526019)(6636002)(66574014)(186003)(2616005)(31696002)(54906003)(31686004)(36756003)(316002)(66946007)(110136005)(66556008)(66476007)(52116002)(4326008)(8676002)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: dswGy/uvyaz98iT/imkZfx94lEASNRusx/k2p3jRuSKA5pYgwWDwL8DXo3ArKKHkxCXfKxRY2frYVkydOVOzh97a7mvuHUrjRDoZOGKd4b8VrHq5+2HNfkYIIr1/M57a6V2ljocdjpRMrbWQh6RpcYhsAsqnFR1JMtNNtKiYLaQd5mO4IWe272X1k6NxirI1zao5NLJl7AAW/rrKf3Y5wCunqWRzTBRCE9ot9W9C8tmRPFc+AR2DI7fq0bkn3YPIHTqaf+rr8gW8/IkSqLPzXfAt62hNejMPMDg8drrth+cy+b6V3P2m991bL8JT9TpL4YcC31TUDGapMSZlaV7ocMaUSHevHnfOCl1iUsLHuyp3tv+hemwHCT7M70Qtu0Ggtc3hWkjERif4XwELWkBcPbDtvgQ7ZLKXikOjuVhnQNw/2McJBIi9rU8qJqo4zDEPNFJ2NXOFGb9Stlhi50hcT2uLgc3Vzu+HMDspopwA31yZpv1lBE8yAtadxc+qIXpMjygIsbauMf0eBSXC9Dcf3frOQF/PLJWwzPOvDJSmmZA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1244d7d-16ed-4f05-f482-08d80d83f2c0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 21:19:23.8678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqtuC6dkfKzsNkBISgytgsCxOAmSENw5cD4qXqQQvcvwHT1YBmnyfIS0hbiC5RV3caaoooeyYW9Q2lFMngemQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3850
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "michel@daenzer.net" <michel@daenzer.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMTAvMjAgNDozMCBQTSwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSB3cm90ZToKPgo+
IE9uIDYvMTAvMjAgNTozMCBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4gT24gV2VkLCBKdW4g
MTAsIDIwMjAgYXQgMDQ6MDU6MDRQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+
IEFtIDEwLjA2LjIwIHVtIDE1OjU0IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4KPj4+
PiBPbiA2LzEwLzIwIDY6MTUgQU0sIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgd3JvdGU6Cj4+
Pj4+Cj4+Pj4+IE9uIDYvOS8yMCA3OjIxIFBNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPj4+
Pj4+Cj4+Pj4+PiBBbSAwOS4wNi4yMDIwIDE4OjM3IHNjaHJpZWIgIkdyb2R6b3Zza3ksIEFuZHJl
eSIKPj4+Pj4+IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPjoKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+
Pj4gwqDCoMKgwqAgT24gNi81LzIwIDI6NDAgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
Pj4+PiDCoMKgwqDCoCA+IEFtIDA1LjA2LjIwIHVtIDE2OjI5IHNjaHJpZWIgQW5kcmV5IEdyb2R6
b3Zza3k6Cj4+Pj4+PiDCoMKgwqDCoCA+Pgo+Pj4+Pj4gwqDCoMKgwqAgPj4gT24gNS8xMS8yMCAy
OjQ1IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4gwqDCoMKgwqAgPj4+IEFtIDA5
LjA1LjIwIHVtIDIwOjUxIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+PiDCoMKgwqDC
oCA+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IAo+Pj4+Pj4gPGFuZHJleS5n
cm9kem92c2t5QGFtZC5jb20+Cj4+Pj4+PiDCoMKgwqDCoCA+Pj4+IC0tLQo+Pj4+Pj4gwqDCoMKg
wqAgPj4+PiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jwqDCoMKgIHwgMjIgCj4+Pj4+PiAr
KysrKysrKysrKysrKysrKysrKystCj4+Pj4+PiDCoMKgwqDCoCA+Pj4+IGluY2x1ZGUvZHJtL3R0
bS90dG1fYm9fZHJpdmVyLmggfCAyICsrCj4+Pj4+PiDCoMKgwqDCoCA+Pj4+IMKgIDIgZmlsZXMg
Y2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pj4gwqDCoMKgwqAg
Pj4+Pgo+Pj4+Pj4gwqDCoMKgwqAgPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYwo+Pj4+Pj4gwqDCoMKgwqAgPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvLmMKPj4+Pj4+IMKgwqDCoMKgID4+Pj4gaW5kZXggYzViNTE2Zi4uZWFlNjFjYyAxMDA2NDQK
Pj4+Pj4+IMKgwqDCoMKgID4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+
Pj4+Pj4gwqDCoMKgwqAgPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+
Pj4+PiDCoMKgwqDCoCA+Pj4+IEBAIC0xNzUwLDkgKzE3NTAsMjkgQEAgdm9pZCB0dG1fYm9fdW5t
YXBfdmlydHVhbChzdHJ1Y3QKPj4+Pj4+IMKgwqDCoMKgID4+Pj4gdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvKQo+Pj4+Pj4gwqDCoMKgwqAgPj4+PiB0dG1fYm9fdW5tYXBfdmlydHVhbF9sb2NrZWQoYm8p
Owo+Pj4+Pj4gwqDCoMKgwqAgPj4+PiB0dG1fbWVtX2lvX3VubG9jayhtYW4pOwo+Pj4+Pj4gwqDC
oMKgwqAgPj4+PiDCoCB9Cj4+Pj4+PiDCoMKgwqDCoCA+Pj4+ICtFWFBPUlRfU1lNQk9MKHR0bV9i
b191bm1hcF92aXJ0dWFsKTsKPj4+Pj4+IMKgwqDCoMKgID4+Pj4gwqAgK3ZvaWQgdHRtX2JvX3Vu
bWFwX3ZpcnR1YWxfYWRkcmVzc19zcGFjZShzdHJ1Y3QKPj4+Pj4+IMKgwqDCoMKgIHR0bV9ib19k
ZXZpY2UgKmJkZXYpCj4+Pj4+PiDCoMKgwqDCoCA+Pj4+ICt7Cj4+Pj4+PiDCoMKgwqDCoCA+Pj4+
ICvCoMKgwqAgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW47Cj4+Pj4+PiDCoMKgwqDC
oCA+Pj4+ICvCoMKgwqAgaW50IGk7Cj4+Pj4+PiDCoMKgwqDCoCA+Pj4+IC1FWFBPUlRfU1lNQk9M
KHR0bV9ib191bm1hcF92aXJ0dWFsKTsKPj4+Pj4+IMKgwqDCoMKgID4+Pgo+Pj4+Pj4gwqDCoMKg
wqAgPj4+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBUVE1fTlVNX01FTV9UWVBFUzsgaSsrKSB7
Cj4+Pj4+PiDCoMKgwqDCoCA+Pj4+ICvCoMKgwqDCoMKgwqDCoCBtYW4gPSAmYmRldi0+bWFuW2ld
Owo+Pj4+Pj4gwqDCoMKgwqAgPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKG1hbi0+aGFzX3R5cGUg
JiYgbWFuLT51c2VfdHlwZSkKPj4+Pj4+IMKgwqDCoMKgID4+Pj4gKyB0dG1fbWVtX2lvX2xvY2so
bWFuLCBmYWxzZSk7Cj4+Pj4+PiDCoMKgwqDCoCA+Pj4+ICvCoMKgwqAgfQo+Pj4+Pj4gwqDCoMKg
wqAgPj4+Cj4+Pj4+PiDCoMKgwqDCoCA+Pj4gWW91IHNob3VsZCBkcm9wIHRoYXQgaXQgd2lsbCBq
dXN0IHJlc3VsdCBpbiBhIGRlYWRsb2NrCj4+Pj4+PiDCoMKgwqDCoCB3YXJuaW5nIGZvcgo+Pj4+
Pj4gwqDCoMKgwqAgPj4+IE5vdXZlYXUgYW5kIGhhcyBubyBlZmZlY3QgYXQgYWxsLgo+Pj4+Pj4g
wqDCoMKgwqAgPj4+Cj4+Pj4+PiDCoMKgwqDCoCA+Pj4gQXBhcnQgZnJvbSB0aGF0IGxvb2tzIGdv
b2QgdG8gbWUsCj4+Pj4+PiDCoMKgwqDCoCA+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4gwqDCoMKgwqAg
Pj4KPj4+Pj4+IMKgwqDCoMKgID4+Cj4+Pj4+PiDCoMKgwqDCoCA+PiBBcyBJIGFtIGNvbnNpZGVy
aW5nIHRvIHJlLWluY2x1ZGUgdGhpcyBpbiBWMiBvZiB0aGUKPj4+Pj4+IMKgwqDCoMKgIHBhdGNo
c2V0cywgY2FuCj4+Pj4+PiDCoMKgwqDCoCA+PiB5b3UgY2xhcmlmeSBwbGVhc2Ugd2h5IHRoaXMg
d2lsbCBoYXZlIG5vIGVmZmVjdCBhdCBhbGwgPwo+Pj4+Pj4gwqDCoMKgwqAgPgo+Pj4+Pj4gwqDC
oMKgwqAgPiBUaGUgbG9ja3MgYXJlIGV4Y2x1c2l2ZSBmb3IgTm91dmVhdSB0byBhbGxvY2F0ZS9m
cmVlIHRoZSBpbwo+Pj4+Pj4gwqDCoMKgwqAgYWRkcmVzcwo+Pj4+Pj4gwqDCoMKgwqAgPiBzcGFj
ZS4KPj4+Pj4+IMKgwqDCoMKgID4KPj4+Pj4+IMKgwqDCoMKgID4gU2luY2Ugd2UgZG9uJ3QgZG8g
dGhpcyBoZXJlIHdlIGRvbid0IG5lZWQgdGhlIGxvY2tzLgo+Pj4+Pj4gwqDCoMKgwqAgPgo+Pj4+
Pj4gwqDCoMKgwqAgPiBDaHJpc3RpYW4uCj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IMKgwqDCoMKgIFNv
IGJhc2ljYWxseSBjYWxsaW5nIHVubWFwX21hcHBpbmdfcmFuZ2UgZG9lc24ndCByZXF1aXJlIGFu
eSAKPj4+Pj4+IGV4dHJhCj4+Pj4+PiDCoMKgwqDCoCBsb2NraW5nIGFyb3VuZCBpdCBhbmQgd2hh
dGV2ZXIgbG9ja3MgYXJlIHRha2VuIHdpdGhpbiB0aGUgCj4+Pj4+PiBmdW5jdGlvbgo+Pj4+Pj4g
wqDCoMKgwqAgc2hvdWxkIGJlIGVub3VnaCA/Cj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBJ
IHRoaW5rIHNvLCB5ZXMuCj4+Pj4+Pgo+Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+PiBZZXMsIHRoYXQn
cyB0cnVlLiBIb3dldmVyLCB3aXRob3V0IHRoZSBibyByZXNlcnZhdGlvbiwgbm90aGluZyBzdG9w
cwo+Pj4+PiBhIFBURSBmcm9tIGJlaW5nIGltbWVkaWF0ZWx5IHJlLWZhdWx0ZWQgYmFjayBhZ2Fp
bi4gRXZlbiB3aGlsZQo+Pj4+PiB1bm1hcF9tYXBwaW5nX3JhbmdlKCkgaXMgcnVubmluZy4KPj4+
Pj4KPj4+PiBDYW4geW91IGV4cGxhaW4gbW9yZSBvbiB0aGlzIC0gc3BlY2lmaWNhbGx5LCB3aGlj
aCBmdW5jdGlvbiB0byByZXNlcnZlCj4+Pj4gdGhlIEJPLCB3aHkgQk8gcmVzZXJ2YXRpb24gd291
bGQgcHJldmVudCByZS1mYXVsdCBvZiB0aGUgUFRFID8KPj4+Pgo+Pj4gVGhvbWFzIGlzIHRhbGtp
bmcgYWJvdXQgdHRtX2JvX3Jlc2VydmVyKCkvdHRtX2JvX3VucmVzZXJ2ZSgpLCBidXQgd2UgCj4+
PiBkb24ndAo+Pj4gbmVlZCB0aGlzIGJlY2F1c2Ugd2UgdW5tYXAgZXZlcnl0aGluZyBiZWNhdXNl
IHRoZSB3aG9sZSBkZXZpY2UgaXMgCj4+PiBnb25lIGFuZAo+Pj4gbm90IGp1c3QgbWFuaXB1bGF0
ZSBhIHNpbmdsZSBCTy4KPj4+Cj4+Pj4+IFNvIHRoZSBkZXZpY2UgcmVtb3ZlZCBmbGFnIG5lZWRz
IHRvIGJlIGFkdmVydGl6ZWQgYmVmb3JlIHRoaXMKPj4+Pj4gZnVuY3Rpb24gaXMgcnVuLAo+Pj4+
Pgo+Pj4+IEkgaW5kZWVkIGludGVuZCB0byBjYWxsIHRoaXPCoCByaWdodCBhZnRlciBjYWxsaW5n
IGRybV9kZXZfdW5wbHVnIGZyb20KPj4+PiBhbWRncHVfcGNpX3JlbW92ZSB3aGlsZSBhZGRpbmcg
ZHJtX2Rldl9lbnRlci9leGl0IGluIAo+Pj4+IHR0bV9ib192bV9mYXVsdCAob3IKPj4+PiBpbiBh
bWRncHUgc3BlY2lmaWMgd3JhcHBlciBzaW5jZSBJIGRvbid0IHNlZSBob3cgY2FuIEkgYWNjZXNz
IHN0cnVjdAo+Pj4+IGRybV9kZXZpY2UgZnJvbSB0dG1fYm9fdm1fZmF1bHQpIGFuZCB0aGlzIGlu
IG15IHVuZGVyc3RhbmRpbmcgc2hvdWxkCj4+Pj4gc3RvcCBhIFBURSBmcm9tIGJlaW5nIHJlLWZh
dWx0ZWQgYmFjayBhcyB5b3UgcG9pbnRlZCBvdXQgLSBzbyBhZ2FpbiBJCj4+Pj4gZG9uJ3Qgc2Vl
IGhvd8KgIGJvIHJlc2VydmF0aW9uIHdvdWxkIHByZXZlbnQgaXQgc28gaXQgbG9va3MgbGlrZSBJ
IGFtCj4+Pj4gbWlzc2luZyBzb21ldGhpbmcuLi4KPj4+Pgo+Pj4+Cj4+Pj4+IChwZXJoYXBzIHdp
dGggYSBtZW1vcnkgYmFycmllciBwYWlyKS4KPj4+Pj4KPj4+PiBkcm1fZGV2X3VucGx1ZyBhbmQg
ZHJtX2Rldl9lbnRlci9leGl0IGFyZSBSQ1Ugc3luY2hyb25pemVkIGFuZCBzbyBJCj4+Pj4gZG9u
J3QgdGhpbmsgcmVxdWlyZSBhbnkgZXh0cmEgbWVtb3J5IGJhcnJpZXJzIGZvciB2aXNpYmlsaXR5
IG9mIHRoZQo+Pj4+IHJlbW92ZWQgZmxhZyBiZWluZyBzZXQKPj4+Pgo+Pj4gQXMgZmFyIGFzIEkg
Y2FuIHNlZSB0aGF0IHNob3VsZCBiZSBwZXJmZWN0bHkgc3VmZmljaWVudC4KPj4gT25seSBpZiB5
b3UgaGF2ZSBhIGRybV9kZXZfZW50ZXIvZXhpdCBwYWlyIGluIHlvdXIgZmF1bHQgaGFuZGxlci4K
Pj4gT3RoZXJ3aXNlIHlvdSdyZSBzdGlsbCBvcGVuIHRvIHRoZSByYWNlcyBUaG9tYXMgZGVzY3Jp
YmVkLiBCdXQgYXNpZGUgCj4+IGZyb20KPj4gdGhhdCB0aGUgZHJtX2Rldl91bnBsdWcgc3R1ZmYg
aGFzIGFsbCB0aGUgYmFycmllcnMgYW5kIHN0dWZmIHRvIG1ha2UgCj4+IHN1cmUKPj4gbm90aGlu
ZyBlc2NhcGVzLgo+Pgo+PiBGYWlsdXJlIHRvIGRybV9kZXZfZW50ZXIgY291bGQgdGhlbiBhbHNv
IHRyaWdnZXIgdGhlIHNwZWNpYWwgY2FzZSAKPj4gd2hlcmUgd2UKPj4gcHV0IGEgZHVtbXkgcGFn
ZSBpbiBwbGFjZS4KPj4gLURhbmllbAo+Cj4gSG1tLCBZZXMsIGluZGVlZCBhZHZlcnRpemluZyB0
aGUgZmxhZyBiZWZvcmUgdGhlIGNhbGwgdG8gCj4gdW5tYXBfbWFwcGluZ19yYW5nZSBpc24ndCBl
bm91Z2gsIHNpbmNlIHRoZXJlIG1pZ2h0IGJlIGZhdWx0IGhhbmRsZXJzIAo+IHJ1bm5pbmcgdGhh
dCBoYXZlbid0IHBpY2tlZCB1cCB0aGUgZmxhZyB3aGVuIHVubWFwX21hcHBpbmdfcmFuZ2UgaXMg
Cj4gbGF1bmNoZWQuCgoKSWYgeW91IG1lYW4gdGhvc2UgZmF1bHQgaGFuZGxlcnMgdGhhdCB3ZXJl
IGluIHByb2dyZXNzIHdoZW4gdGhlIGZsYWcgCihkcm1fZGV2X3VucGx1Zykgd2FzIHNldCBpbiBh
bWRncHVfcGNpX3JlbW92ZSB0aGVuIGFzIGxvbmcgYXMgaSB3cmFwIHRoZSAKZW50aXJlIGZhdWx0
IGhhbmRsZXIgKHByb2JhYmx5IHVzaW5nIGFtZGdwdSBzcGVjaWZpYyAuZmF1bHQgaG9vayBhcm91
bmQgCnR0bV9ib192bV9mYXVsdCkgd2l0aCBkcm1fZGV2X2VudGVyL2V4aXQgcGFpciB0aGVuIApk
cm1fZGV2X3VucGx1Zy0+c3luY2hyb25pemVfc3JjdSB3aWxsIGJsb2NrIHVudGlsIHRob3NlIGlu
IHByb2dyZXNzIApmYXVsdHMgaGF2ZSBjb21wbGV0ZWQgYW5kIG9ubHkgYWZ0ZXIgdGhpcyBpIHdp
bGwgY2FsbCAKdW5tYXBfbWFwcGluZ19yYW5nZS4gU2hvdWxkIHRoaXMgYmUgZW5vdWdoID8KCkFu
ZHJleQoKCj4KPiBGb3IgdGhlIHNwZWNpYWwgY2FzZSBvZiBzeW5jaW5nIGEgZnVsbCBhZGRyZXNz
LXNwYWNlIAo+IHVubWFwX21hcHBpbmdfcmFuZ2UoKSB3aXRoIGZhdWx0IGhhbmRsZXJzIHJlZ2Fy
ZGxlc3Mgb2YgdGhlIHJlYXNvbiBmb3IgCj4gdGhlIGZ1bGwgYWRkcmVzcy1zcGFjZSB1bm1hcF9t
YXBwaW5nX3JhbmdlKCkgb25lIGNvdWxkIGVpdGhlciB0cmF2ZXJzZSAKPiB0aGUgYWRkcmVzcyBz
cGFjZSAoZHJtX3ZtYV9tYW5hZ2VyKSBhbmQgZ3JhYiAqYWxsKiBibyByZXNlcnZhdGlvbnMgCj4g
YXJvdW5kIHRoZSB1bm1hcF9tYXBwaW5nX3JhbmdlKCksIG9yIGdyYWIgdGhlIGlfbW1hcF9sb2Nr
IGluIHJlYWQgbW9kZSAKPiBpbiB0aGUgZmF1bHQgaGFuZGxlci4gKEl0J3MgdGFrZW4gaW4gd3Jp
dGUgbW9kZSBpbiAKPiB1bm1hcF9tYXBwaW5nX3JhbmdlKS4gV2hpbGUgdGhlIGxhdHRlciBtYXkg
c2VlbSBsaWtlIGEgc2ltcGxlIAo+IHNvbHV0aW9uLCBvbmUgc2hvdWxkIHByb2JhYmx5IGNvbnNp
ZGVyIHRoZSBvdmVyaGVhZCBib3RoIGluIHJ1bi10aW1lIAo+IGFuZCBzY2FsaW5nIGFiaWxpdHku
Cj4KPiAvVGhvbWFzCj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
