Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38911F4110
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 18:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59F06E2D6;
	Tue,  9 Jun 2020 16:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700087.outbound.protection.outlook.com [40.107.70.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C436E2D6;
 Tue,  9 Jun 2020 16:37:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzODmaSWLp/5bMcu2k5gPJ4CWJOSmnjeeRpAF/YGMYP76lHaIwG3IagvwV6bJaLpdFhKM/olccuAl8J/SDL9XEXcQdnm7UaU5Xp8tn8GhSAgYzV6PVRmlvzVt0oJpwYqRmQysRnUliHe/JyBAEG9K70QlxP8qFhdLahNxcymwbqkcLo7Rd/TNtkxGO6QdLrElVS7/gyG1n5k6Fp72x/kEN3huNGXCM+EWKAszOHcN7KGOYbp/gb4OAgxKs9xmHYFH4dLt08I0cotfXmpUH1Ng0G23uaNNFCjLTPtJnsZj1e1cbUqOy7ugNAfDAmP0jUeDKc47/um3hoK9cbs/Es3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrpr2zhDpHiFDDC1IIyVk3LdjGhIqS2tLsmQ+JUFrj4=;
 b=XRdMkwJNMuA45NAp9mQY5yheyWpi6cK7+pz4CyAiGiTpOfMKX925QTLZKgEJWp+ryq2k9pGFrDw4gv3n52pqEJQA7sQpg/WFVhjPKJFyxn+R9zA6BsqNqBPtGOYxfH6Ry/Xa5LTgz2pylfi/YIclK+71ef9LrzuKOKfNSCApz5gwVVNmz+9jBB8qJEcSH3ecShPFY4WVKg8F5ya3xHqNICmkBUdiZigIcHLiAjO3q906UlvdFzkSo++PbHADUjjb8nOMfl3f0YVcuzxGErN18wjzChYhsogStfIIYbUWYMwgo+3iX8g4HLbnEsKqOz7KoOdYIk8a5N85r6f2q3Zj3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrpr2zhDpHiFDDC1IIyVk3LdjGhIqS2tLsmQ+JUFrj4=;
 b=VBZmL2EaSrk00aD2SDdlb2+/7ZBEsCaL5HZOJ/UnP3WzvMbu+cIAoGsPXxPZuY4ifhoBWBmEM1VK6ajc5POk5mgaq7snncuB2nW9QdIOcgyI4y5rk+G+EP4UEvHRadJlclce49rmYp6yL3GDeuw+UYdB8FbAydSBbsxv6m9yvig=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB2684.namprd12.prod.outlook.com (2603:10b6:5:4a::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.19; Tue, 9 Jun 2020 16:37:38 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df%2]) with mapi id 15.20.3088.018; Tue, 9 Jun 2020
 16:37:38 +0000
Subject: Re: [PATCH 1/6] drm/ttm: Add unampping of the entire device address
 space
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <1589050310-19666-2-git-send-email-andrey.grodzovsky@amd.com>
 <e293af59-99df-c147-68d6-8fa3ade38829@gmail.com>
 <3758b335-25b5-403c-5936-25d5fe714842@amd.com>
 <d297514f-a1c9-3bd3-a1e2-6921019a5d31@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <28460fd0-36e9-d38c-15b3-154e9dd45442@amd.com>
Date: Tue, 9 Jun 2020 12:37:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <d297514f-a1c9-3bd3-a1e2-6921019a5d31@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::37) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3ee0:2de:ccf1:f7f8:481b:7a24]
 (2607:fea8:3ee0:2de:ccf1:f7f8:481b:7a24) by
 YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Tue, 9 Jun 2020 16:37:38 +0000
X-Originating-IP: [2607:fea8:3ee0:2de:ccf1:f7f8:481b:7a24]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5f049f91-6727-42eb-86c4-08d80c936c14
X-MS-TrafficTypeDiagnostic: DM6PR12MB2684:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2684CD80F47B642CC905D241EA820@DM6PR12MB2684.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ss0doW9iHKvzam/ih5Tk3xdhcuIGXoynq3weM5cwQt+P7iz75YvhWhJim+yZgsbVI2yQzLReRaXOjL4/60csymOnND/iEny/bngwuu4RfvvFiZlICzu5FE3ahzTYFPhjlzt7OsPd3uSaFtSzXqrxTex/zJXwEVIuBPeCLIC/jgov9G93c5Bch5ayoZ86ud+XJW89jRbC4bhVDHXpYAkAdPE0QcUwzOzAo3k5XMwYjFyEw4vuu/O7sYbAHvIU3kNvq5Epq6+ubb0Y9qeaILhUb5LWg5DzZdft6YpDXkLW9eAKruPrVllcj9vm6irHWPfGiHidGiusEblzu5y3Mrpis8PAAS0qNdiv/YRu6nk0wXWhZxybmf0kfMBb/4hN8rwP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(31686004)(316002)(2616005)(5660300002)(478600001)(6486002)(6666004)(2906002)(36756003)(4326008)(66556008)(31696002)(8676002)(16526019)(52116002)(186003)(66574014)(86362001)(53546011)(66476007)(66946007)(8936002)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 8VA7u32hlOjh7FWoLwZtlbxMFNOPSyqt7ybr+E2zFFxqaK1faEqM4D9b6jTL9+UqP1H2NMaQCma6tDMZFNlMUaAYZC3FPc6r8lD6QW97VaI14JEKHtXN9e+NgXlaWuknlHNNO6TZo+Cl3gloihjO/U9TCBBjab4Jx6JL7MbuvXridtxoqXgbVl4XslgQOa2933tTQAm4MWUo0xgQYJwGbgYDznsPUysF2pKR+baMwwG2kQCPM7oAauzPutfxiHBBDDTkNA8g2bgeP3lZ+7veh9kO2bU96ESQjC5CWqxmTV53l6ooXne6CyvEc4ZqsuFl8RopONHWMx6MzTTzMwGkyItBsp8AssVV0f2NoQgV42hoilTdlnhxrqeZrtD81tji/qiS6SSJjCMUHECuuENUjbi7SODbNWxSS21NYZlIQ7DvfN3U3UJaSPP0rH7d8iviBba0SIirvCtIZMb3gxvvB+pXL0f4wMptoLSkSUIFcFT0r0EFncOMogtvHEaG4HccefeNdV8J/LaaELD5hITBhxny1x8n1sw3fv64QdEJtKw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f049f91-6727-42eb-86c4-08d80c936c14
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 16:37:38.8086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhRp1CpaDMeFmUSly1+RaLjH2h4bwz6sj3/DAJZg6U3PCnnAE1wxkoO3zwmM7SN9ZocdY7g8RVJrLL+UmEKhXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2684
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvNS8yMCAyOjQwIFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDA1LjA2LjIw
IHVtIDE2OjI5IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Cj4+IE9uIDUvMTEvMjAgMjo0
NSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDA5LjA1LjIwIHVtIDIwOjUxIHNj
aHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6
b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqAgZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uY8KgwqDCoCB8IDIyICsrKysrKysrKysrKysrKysrKysrKy0K
Pj4+PiDCoCBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIHzCoCAyICsrCj4+Pj4gwqAg
MiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAKPj4+PiBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+PiBpbmRleCBjNWI1MTZmLi5lYWU2MWNjIDEwMDY0
NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+Pj4gQEAgLTE3NTAsOSArMTc1MCwyOSBAQCB2b2lk
IHR0bV9ib191bm1hcF92aXJ0dWFsKHN0cnVjdCAKPj4+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8p
Cj4+Pj4gwqDCoMKgwqDCoCB0dG1fYm9fdW5tYXBfdmlydHVhbF9sb2NrZWQoYm8pOwo+Pj4+IMKg
wqDCoMKgwqAgdHRtX21lbV9pb191bmxvY2sobWFuKTsKPj4+PiDCoCB9Cj4+Pj4gK0VYUE9SVF9T
WU1CT0wodHRtX2JvX3VubWFwX3ZpcnR1YWwpOwo+Pj4+IMKgICt2b2lkIHR0bV9ib191bm1hcF92
aXJ0dWFsX2FkZHJlc3Nfc3BhY2Uoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYpCj4+Pj4gK3sK
Pj4+PiArwqDCoMKgIHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuOwo+Pj4+ICvCoMKg
wqAgaW50IGk7Cj4+Pj4gwqAgLUVYUE9SVF9TWU1CT0wodHRtX2JvX3VubWFwX3ZpcnR1YWwpOwo+
Pj4KPj4+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBUVE1fTlVNX01FTV9UWVBFUzsgaSsrKSB7
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIG1hbiA9ICZiZGV2LT5tYW5baV07Cj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIGlmIChtYW4tPmhhc190eXBlICYmIG1hbi0+dXNlX3R5cGUpCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdHRtX21lbV9pb19sb2NrKG1hbiwgZmFsc2UpOwo+Pj4+ICvCoMKgwqAg
fQo+Pj4KPj4+IFlvdSBzaG91bGQgZHJvcCB0aGF0IGl0IHdpbGwganVzdCByZXN1bHQgaW4gYSBk
ZWFkbG9jayB3YXJuaW5nIGZvciAKPj4+IE5vdXZlYXUgYW5kIGhhcyBubyBlZmZlY3QgYXQgYWxs
Lgo+Pj4KPj4+IEFwYXJ0IGZyb20gdGhhdCBsb29rcyBnb29kIHRvIG1lLAo+Pj4gQ2hyaXN0aWFu
Lgo+Pgo+Pgo+PiBBcyBJIGFtIGNvbnNpZGVyaW5nIHRvIHJlLWluY2x1ZGUgdGhpcyBpbiBWMiBv
ZiB0aGUgcGF0Y2hzZXRzLCBjYW4gCj4+IHlvdSBjbGFyaWZ5IHBsZWFzZSB3aHkgdGhpcyB3aWxs
IGhhdmUgbm8gZWZmZWN0IGF0IGFsbCA/Cj4KPiBUaGUgbG9ja3MgYXJlIGV4Y2x1c2l2ZSBmb3Ig
Tm91dmVhdSB0byBhbGxvY2F0ZS9mcmVlIHRoZSBpbyBhZGRyZXNzIAo+IHNwYWNlLgo+Cj4gU2lu
Y2Ugd2UgZG9uJ3QgZG8gdGhpcyBoZXJlIHdlIGRvbid0IG5lZWQgdGhlIGxvY2tzLgo+Cj4gQ2hy
aXN0aWFuLgoKClNvIGJhc2ljYWxseSBjYWxsaW5nIHVubWFwX21hcHBpbmdfcmFuZ2UgZG9lc24n
dCByZXF1aXJlIGFueSBleHRyYSAKbG9ja2luZyBhcm91bmQgaXQgYW5kIHdoYXRldmVyIGxvY2tz
IGFyZSB0YWtlbiB3aXRoaW4gdGhlIGZ1bmN0aW9uIApzaG91bGQgYmUgZW5vdWdoID8KCkFuZHJl
eQoKCj4KPj4KPj4gQW5kcmV5Cj4+Cj4+Cj4+Pgo+Pj4+ICsKPj4+PiArwqDCoMKgIHVubWFwX21h
cHBpbmdfcmFuZ2UoYmRldi0+ZGV2X21hcHBpbmcsIDAsIDAgLCAxKTsKPj4+PiArwqDCoMKgIC8q
VE9ETyBXaGF0IGFib3V0IHR0bV9tZW1faW9fZnJlZV92bShibykgPyAqLwo+Pj4+ICsKPj4+PiAr
wqDCoMKgIGZvciAoaSA9IFRUTV9OVU1fTUVNX1RZUEVTIC0gMTsgaSA+PSAwOyBpLS0pIHsKPj4+
PiArwqDCoMKgwqDCoMKgwqAgbWFuID0gJmJkZXYtPm1hbltpXTsKPj4+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKG1hbi0+aGFzX3R5cGUgJiYgbWFuLT51c2VfdHlwZSkKPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB0dG1fbWVtX2lvX3VubG9jayhtYW4pOwo+Pj4+ICvCoMKgwqAgfQo+Pj4+ICt9
Cj4+Pj4gK0VYUE9SVF9TWU1CT0wodHRtX2JvX3VubWFwX3ZpcnR1YWxfYWRkcmVzc19zcGFjZSk7
Cj4+Pj4gwqAgwqAgaW50IHR0bV9ib193YWl0KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgaW50ZXJydXB0aWJsZSwgYm9vbCBub193YWl0
KQo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIAo+Pj4+
IGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+Pj4+IGluZGV4IGM5ZTBmZDAuLjMx
MzM0NjMgMTAwNjQ0Cj4+Pj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+
Pj4+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPj4+PiBAQCAtNjAwLDYg
KzYwMCw4IEBAIGludCB0dG1fYm9fZGV2aWNlX2luaXQoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJk
ZXYsCj4+Pj4gwqDCoCAqLwo+Pj4+IMKgIHZvaWQgdHRtX2JvX3VubWFwX3ZpcnR1YWwoc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7Cj4+Pj4gwqAgK3ZvaWQgdHRtX2JvX3VubWFwX3ZpcnR1
YWxfYWRkcmVzc19zcGFjZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAKPj4+PiAqYmRldik7Cj4+Pj4g
Kwo+Pj4+IMKgIC8qKgo+Pj4+IMKgwqAgKiB0dG1fYm9fdW5tYXBfdmlydHVhbAo+Pj4+IMKgwqAg
Kgo+Pj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
