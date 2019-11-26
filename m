Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A187910A14B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 16:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FC56E422;
	Tue, 26 Nov 2019 15:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740087.outbound.protection.outlook.com [40.107.74.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E596E422;
 Tue, 26 Nov 2019 15:36:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1aeA4n8WpsFUOCf8wcZFSPJFGiUOTIOMQVkPXNbIR3Nj2+nfYAYiQKRqPWPRiggXT6WfJmjkNGnOEj9EwCEvBuoSz30+f4AqeG+x//GZymh3irAuNa5eYfyrWIyf1vqUK0Ge1mQ0SNRzuFNNE3FWtqswuZpHCHyd7rmrlMX7YEEu9fESQYO1AaakNSy9U4n5ovsguKwK4Po7C208MVOA/XpUrrpI5KDn+mAtOEQksyv/d262xRWn5/bMHT+ibj0SHHsILxTdIhczYa/NlJowgQUlVPGG7ZLeQpQQ8vFl7YPgCRKjtoYoW7mNCenRxVOj7BuDv6ArGEnmkBdETx0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZTWD/ufDWxBd29tSRjvLSeRS2MIx53f7I1PP/j/yb0=;
 b=KkYO9lRPX7r6IAs2GNzYip3qpvpbEumOnD3Vf6cM9gKIn2OaebFxEwHSB6w9Hd9ToyJi2cq9HUAou1w+Q5nMsbnGrDhFz2c1g4rwsK9IsrroYelfaeKdixwr8acd8AUtzwsJ/KL5eIqK90UhQq9jMOi9c8+ma70Tbdp+E+qNovfk/qE6TlKrEkZsEUB8hUOFxcf5vC5tG3efRUJgffrWeaYVqrRtwzqSYWa1BMAN7pSB9NAz5mVGJky//RrQyx/Qpobl5CtkgI3ggBrqemgaar+VczIva7u16ibGphlunNxYCDcRih2zXCe5gg00oHkM0NSCP041lTVjUiUdvF+K2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1421.namprd12.prod.outlook.com (10.169.206.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Tue, 26 Nov 2019 15:36:46 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80%12]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 15:36:46 +0000
Subject: Re: [PATCH v3 1/2] drm/sched: Avoid job cleanup if sched thread is
 parked.
To: christian.koenig@amd.com, Steven Price <steven.price@arm.com>
References: <1574691041-5499-1-git-send-email-andrey.grodzovsky@amd.com>
 <93c692cb-5306-e024-57f1-463402cb2c44@arm.com>
 <c75aff45-2fc6-47da-34e0-a179f1ce5e9a@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <cdd5de63-ca5a-19c1-0ef3-02916a2655d1@amd.com>
Date: Tue, 26 Nov 2019 10:36:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <c75aff45-2fc6-47da-34e0-a179f1ce5e9a@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::25) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ef03d27e-3aa9-42e5-868b-08d7728671f7
X-MS-TrafficTypeDiagnostic: MWHPR12MB1421:|MWHPR12MB1421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB142146D1871145CCE639A18CEA450@MWHPR12MB1421.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0233768B38
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(199004)(189003)(305945005)(6306002)(6486002)(2906002)(31696002)(186003)(8676002)(6512007)(58126008)(81166006)(81156014)(14454004)(86362001)(25786009)(6916009)(316002)(478600001)(26005)(6436002)(4326008)(31686004)(2870700001)(6246003)(7736002)(53546011)(36756003)(66476007)(386003)(65806001)(2486003)(66574012)(52116002)(6506007)(229853002)(6666004)(99286004)(66556008)(8936002)(45080400002)(23676004)(76176011)(66946007)(65956001)(47776003)(11346002)(2616005)(5660300002)(3846002)(966005)(50466002)(14444005)(446003)(66066001)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1421;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ymFWjSr8rT8A3EQUypMM6qn7kG06wccPdJ1mpsN/iijoM0Ku/I5RsFXGzlWOHfZVpTZUAbv+vGUbc1dOG3e1smWJce31ppIyD5/Tj0IZsgPeysgt1pJfEzo9dg7x4a8dnrwrzGa1fZ/eQbwxbvitx7kU9ZeOW548cDyofDalMPeHGOfUt9mvZKbXVAK5Ham6AQnToE0DdANKgREA2uHGaPHP4q3Vl6bT0nf64MFfuJQYziZpD2eqw6fv+oW/mnQuqueCV5+txz1HGn27flS9Niuh81NgIV8VTnvn5BKiRax5fjCe9VRXShKKWQ+2wILLBfBvM6iRIZEdnd9pDKVBpCJTRKvLgWwqqtUG/XEzsuX1pU8JMrpnTuyK8KzBdIzY9WMFPISBhNy8I4LpdbpZv5QYd4tGaw9wYO5KAmhUUiO3oStrRryFDktxvG9wcQpN7+Zbjszftkq+3xYNPDh1HVmU3JgqNGljS2aBWwge8aA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef03d27e-3aa9-42e5-868b-08d7728671f7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 15:36:46.1804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TD8IQxUUATQ3X3hqyLirg58j2xGuJrW1eW4mR7RAFW2FjrBeoCSLJMrjqWcheeOwu4azSDa17RT365jzqLntTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZTWD/ufDWxBd29tSRjvLSeRS2MIx53f7I1PP/j/yb0=;
 b=wiBIa88tJu+8zAox8TKzA0t9+C0bPNkU2R9gt8WPvAQ7gOu+z1LOIqB1BhoryLt1jo2ViWc9MxBaZVfDQZN/f/vb3pZK6d/LbeNLK8Ah+j5hVkR0TBgILAse90kfcaAOhocLoulEMTcXUggMmAE7Ts5fhFcpU+pdmb5bw2fLG1g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Emily.Deng@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzI2LzE5IDQ6MDggQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjUuMTEu
MTkgdW0gMTc6NTEgc2NocmllYiBTdGV2ZW4gUHJpY2U6Cj4+IE9uIDI1LzExLzIwMTkgMTQ6MTAs
IEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4gV2hlbiB0aGUgc2NoZWQgdGhyZWFkIGlzIHBh
cmtlZCB3ZSBhc3N1bWUgcmluZ19taXJyb3JfbGlzdCBpcwo+Pj4gbm90IGFjY2Vzc2VkIGZyb20g
aGVyZS4KPj4gRldJVyBJIGRvbid0IHRoaW5rIHRoaXMgaXMgbmVjZXNzYXJ5LiBrdGhyZWFkX3Bh
cmsoKSB3aWxsIHdhaXQgdW50aWwgdGhlCj4+IHRocmVhZCBpcyBwYXJrZWQsIGF0IHdoaWNoIHBv
aW50IHRoZSB0aHJlYWQgaXMgc3R1Y2sgaW4ga3RocmVhZF9wYXJrbWUoKQo+PiB1bnRpbCB1bnBh
cmtlZC4KPj4KPj4gU28gYWxsIHRoaXMgZG9lcyBpcyBhdm9pZCB3YWl0aW5nIGZvciBhbnkgY2xl
YW51cCBqb2JzIGJlZm9yZSBwYXJraW5nIC0KPj4gd2hpY2ggbWlnaHQgYmUgYSByZWFzb25hYmxl
IGdvYWwgaW4gaXRzZWxmLCBidXQgaWYgc28gbGV0cyBhdCBsZWFzdAo+PiBkb2N1bWVudCB0aGF0
Lgo+Cj4gTm93IHRoYXQgeW91IG1lbnRpb24gaXQgdGhhdCBpcyBpbmRlZWQgd3JvbmcuCgoKSSB3
b3VsZG4ndCBzIGNhbGwgaXQgd3JvbmcgYnV0IHN1cGVyZmx1b3VzIGluIGN1cnJlbnQgY29kZSBh
cyBpbmRlZWQgCm9uY2UgdGhlIHRocmVhZCBpcyBwYXJrZWQgdGhlcmUgd2lsbCBiZSBubyBzdWJz
ZXF1ZW50IGNhbGxzIHRvIApkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iIHVudGlsIHRoZSB0aHJl
YWQgaXMgdW5wYWNrZWQgYmFjaywgaWYgZm9yIApleGFtcGxlIHdlIGRlY2lkZSB0byBjYWxsIGRy
bV9zY2hlZF9nZXRfY2xlYW51cF9qb2IgZnJvbSBhIHdvcmsgaXRlbSAKd2hpY2gga2VlcHMgc2No
ZWR1bGVkIGl0IHdvdWxkIGJlIG5lZWRlZC4KCgo+Cj4gVGhlIHJlYWwgcHJvYmxlbSBpcyB0aGF0
IGluIHRoZSBtYWluIHRocmVhZCB3ZSBtYW5nbGVkIHRoZSBjYWxsIHRvIAo+IGt0aHJlYWRfcGFy
a21lKCkgaW50byBkcm1fc2NoZWRfYmxvY2tlZCgpIHdoaWNoIGNhbiBiZSBjYWxsZWQgaW4gCj4g
YXRvbWljIGNvbnRleHQuCgoKV2hlcmUgaXMgdGhlIGF0b21pYyBjb250ZXh0IGluIHdhaXRfZXZl
bnRfaW50ZXJydXB0aWJsZSA/IEkgc2VlbSBubyB0byAKc2VlIGFueS4KCkFuZHJleQoKCj4KPiBJ
IHN1Z2dlc3QgdG8gcmV3b3JrIHRoaXMgc28gdGhhdCB0aGUga3RocmVhZF9zaG91bGRfcGFyaygp
IGFuZCAKPiBrdGhyZWFkX3Nob3VsZF9zdG9wKCkgdGVzdCBpbiB3YWl0X2V2ZW50X2ludGVycnVw
dGlibGUoKSBjb21lIGZpcnN0IAo+IGFuZCB0aGVuIGNhbGwga3RocmVhZF9wYXJrbWUoKSBvdXRz
aWRlIG9mIHRoZSB3YWl0X2V2ZW50X2ludGVycnVwdGlibGUoKS4KPgo+IFJlZ2FyZHMsCj4gQ2hy
aXN0aWFuLgo+Cj4+Cj4+IFN0ZXZlCj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpv
dnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+PiAtLS0KPj4+IMKgIGRyaXZl
cnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgMTAgKysrKysrKy0tLQo+Pj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgCj4+PiBi
L2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+PiBpbmRleCBkNGNjNzI4
Li42Nzc0OTU1IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5j
Cj4+PiBAQCAtNjM1LDkgKzYzNSwxMyBAQCBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iKHN0cnVj
dCAKPj4+IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkKPj4+IMKgwqDCoMKgwqAgc3RydWN0IGRy
bV9zY2hlZF9qb2IgKmpvYjsKPj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4+
IMKgIC3CoMKgwqAgLyogRG9uJ3QgZGVzdHJveSBqb2JzIHdoaWxlIHRoZSB0aW1lb3V0IHdvcmtl
ciBpcyBydW5uaW5nICovCj4+PiAtwqDCoMKgIGlmIChzY2hlZC0+dGltZW91dCAhPSBNQVhfU0NI
RURVTEVfVElNRU9VVCAmJgo+Pj4gLcKgwqDCoMKgwqDCoMKgICFjYW5jZWxfZGVsYXllZF93b3Jr
KCZzY2hlZC0+d29ya190ZHIpKQo+Pj4gK8KgwqDCoCAvKgo+Pj4gK8KgwqDCoCAqIERvbid0IGRl
c3Ryb3kgam9icyB3aGlsZSB0aGUgdGltZW91dCB3b3JrZXIgaXMgcnVubmluZyBPUiB0aHJlYWQK
Pj4+ICvCoMKgwqAgKiBpcyBiZWluZyBwYXJrZWQgYW5kIGhlbmNlIGFzc3VtZWQgdG8gbm90IHRv
dWNoIHJpbmdfbWlycm9yX2xpc3QKPj4+ICvCoMKgwqAgKi8KPj4+ICvCoMKgwqAgaWYgKChzY2hl
ZC0+dGltZW91dCAhPSBNQVhfU0NIRURVTEVfVElNRU9VVCAmJgo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqAgIWNhbmNlbF9kZWxheWVkX3dvcmsoJnNjaGVkLT53b3JrX3RkcikpIHx8Cj4+PiArwqDCoMKg
wqDCoMKgwqDCoCBfX2t0aHJlYWRfc2hvdWxkX3Bhcmsoc2NoZWQtPnRocmVhZCkpCj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIE5VTEw7Cj4+PiDCoCDCoMKgwqDCoMKgIHNwaW5fbG9ja19p
cnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOwo+Pj4KPj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYW1kLWdmeCBtYWlsaW5nIGxp
c3QKPj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9uYW0xMS5zYWZl
bGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wMiU3
QzAxJTdDYW5kcmV5Lmdyb2R6b3Zza3klNDBhbWQuY29tJTdDZTgxYTgyNGE1Zjk4NGY1MWJjMTkw
OGQ3NzI1MDNhMjUlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdD
NjM3MTAzNTYxMjIxMjk4NjkxJmFtcDtzZGF0YT10VzlYdXB0N2FzY1ZQT2xIeEgwcEhHY2JVQXJW
eVRhNVZUbGUwMTZBY0dnJTNEJmFtcDtyZXNlcnZlZD0wIAo+Pgo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
