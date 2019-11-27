Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5782E10B27A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 16:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359CB6E2E5;
	Wed, 27 Nov 2019 15:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720085.outbound.protection.outlook.com [40.107.72.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65346E093;
 Wed, 27 Nov 2019 15:33:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cO/vCfKgQPXs12aosjBKITkWLCIqVDKQt3NIuN+ASw7gU49aOeUhd8FaFrEhfpml2H/8byriC2SVcpxuyU8CToudoLB3qsz7G72rr8GV87AlrOEMUqzp2yLIZGUFbbNxZYDklm+0A9JFIB9HS3A6WCEgzAvOWtX3CQu06r6qZPL4yOQOmdoB822Lmg9UQgTrNXlQaoN9IwdfI591rT3N621ukcbmqVftCJPTcuJr6XT5K1mBbod7MrHWeW5kvi6oznaaO8t0Geu9U4l2miC2gFWniDWwvfefO5vIJqPtE936n4FJFPTU0j/3BH4cVgiNoG11rDOJf40kmYOPXvYeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpbWlo5DlmmA/97V+wMtggkhIqiq2ewp2qZ4JGcAMss=;
 b=DPtZUkjCtNzv2Uu9tCrCe+FnK8mynITQubMzX48S6cW16iE5redul2bcLe2mhUPkK1n+O2bAO+LwE3kE38FssVJ/OJJG0lm6nH8uHdG/RH7/5CB0yfokZIOhTd3v0G4wuUSvo9ytXbboBc9WwgGD4Ytid2iS+HN9jG1UhNyqxi/Amkq1QrcuaOCgdupwkC04qEYGiC2DhnHAOgV8l6IofJg4IQ9Nt5qQadtiImjMwZcI09o0e04SOaCaBml+65T+KJ09I4wVUCM0M3KIPyF55hpDrPYKN0QGQZnUGnT9MBx1Wt8ergGeb0gaN+6sgk6Xd/w0sCKRe2vXK5lym+MCMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1629.namprd12.prod.outlook.com (10.172.49.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Wed, 27 Nov 2019 15:32:57 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80%12]) with mapi id 15.20.2495.014; Wed, 27 Nov 2019
 15:32:56 +0000
Subject: Re: [PATCH v3 1/2] drm/sched: Avoid job cleanup if sched thread is
 parked.
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
To: christian.koenig@amd.com, Steven Price <steven.price@arm.com>
References: <1574691041-5499-1-git-send-email-andrey.grodzovsky@amd.com>
 <93c692cb-5306-e024-57f1-463402cb2c44@arm.com>
 <c75aff45-2fc6-47da-34e0-a179f1ce5e9a@gmail.com>
 <cdd5de63-ca5a-19c1-0ef3-02916a2655d1@amd.com>
Message-ID: <b3835ff0-15f0-ead4-0255-3d93fc560c77@amd.com>
Date: Wed, 27 Nov 2019 10:32:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <cdd5de63-ca5a-19c1-0ef3-02916a2655d1@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7e6a1d04-c004-4f39-0e78-08d7734f1366
X-MS-TrafficTypeDiagnostic: MWHPR12MB1629:|MWHPR12MB1629:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1629BF181F37DE6E2BA61CBDEA440@MWHPR12MB1629.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 023495660C
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(199004)(189003)(66574012)(11346002)(81156014)(65956001)(966005)(8676002)(47776003)(6512007)(6436002)(6306002)(8936002)(3846002)(2870700001)(36756003)(229853002)(6116002)(66946007)(81166006)(14454004)(2906002)(6486002)(50466002)(5660300002)(86362001)(26005)(76176011)(478600001)(58126008)(6666004)(6506007)(53546011)(386003)(14444005)(31686004)(305945005)(99286004)(7736002)(66476007)(66556008)(186003)(45080400002)(6916009)(316002)(25786009)(65806001)(66066001)(446003)(2616005)(6246003)(4326008)(31696002)(23676004)(52116002)(2486003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1629;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qAXKJ7p0gcu2F3QQtfK5VTNgosDsBp/wLwxv+ydDuvK0ZTJn7NhtXVqJR1IjiVbVJ5gP6pq9XvTMTItgBhp6tEULV3RGvmtQeOhIxYMat6uB/0DxOYf3CCCF+m+gjkMkUZkmZJwy5PTe6RhOqVGb0vKr3sKHNWzcp27i0JjbsOisefyT6jt78lOj/X2ODjpaE5gX81CNpztR3pH+Jq9f0l/XeBA2vNfd8RI3tQolFE1pW8xNZwPZJpMzygYqakGlflZVZJV62wCXlexFHW7Bx8wMSuYJ4qk16P7kwAliK4Y7A+Xi48/rQTzzsh10lHpOrZZfLePe0z76SNJpRQelX8jy0B9WBNiMIohH4dJ8nTMt8p8n8bWG74d8NXNrutBHe9B4vAaZuMkmPRt2t7vs2Ki0oRoFYCSDRh+52qVSwlWpXwOQpo1x+jVfVAAjn+6KYUxPXxpUfvyDIuK0OacAzcNrs5Y3qCZCSIqryuLD5Ks=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6a1d04-c004-4f39-0e78-08d7734f1366
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2019 15:32:56.6058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uX/MXgCl8ORPpqKQtzC0V4ALDpEfAjt7dF3V5d6AZtZHnCIt0+GCY1fPpko5PB4KM95EfKSnIuhGYImmoJg+7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1629
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpbWlo5DlmmA/97V+wMtggkhIqiq2ewp2qZ4JGcAMss=;
 b=BPnGEjxJ68hkDsaPc5L7Sgt7PzHh+rdoNf55K3SLMgRv0573qKRnxHAm12ikHmUadl7iyFEbk8h4mRSgHuz2Rbj6YJmMggQpOmDwEwE6hVQYOyfhbHjgvoqW7d5CgQDYcxMBvQNizO+MZ4zQP4bZv44Rbsxvj6U2J2OtbEKcGjM=
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

UGluZy4uLgoKQW5kcmV5CgpPbiAxMS8yNi8xOSAxMDozNiBBTSwgQW5kcmV5IEdyb2R6b3Zza3kg
d3JvdGU6Cj4KPiBPbiAxMS8yNi8xOSA0OjA4IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+
PiBBbSAyNS4xMS4xOSB1bSAxNzo1MSBzY2hyaWViIFN0ZXZlbiBQcmljZToKPj4+IE9uIDI1LzEx
LzIwMTkgMTQ6MTAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+IFdoZW4gdGhlIHNjaGVk
IHRocmVhZCBpcyBwYXJrZWQgd2UgYXNzdW1lIHJpbmdfbWlycm9yX2xpc3QgaXMKPj4+PiBub3Qg
YWNjZXNzZWQgZnJvbSBoZXJlLgo+Pj4gRldJVyBJIGRvbid0IHRoaW5rIHRoaXMgaXMgbmVjZXNz
YXJ5LiBrdGhyZWFkX3BhcmsoKSB3aWxsIHdhaXQgdW50aWwgCj4+PiB0aGUKPj4+IHRocmVhZCBp
cyBwYXJrZWQsIGF0IHdoaWNoIHBvaW50IHRoZSB0aHJlYWQgaXMgc3R1Y2sgaW4gCj4+PiBrdGhy
ZWFkX3BhcmttZSgpCj4+PiB1bnRpbCB1bnBhcmtlZC4KPj4+Cj4+PiBTbyBhbGwgdGhpcyBkb2Vz
IGlzIGF2b2lkIHdhaXRpbmcgZm9yIGFueSBjbGVhbnVwIGpvYnMgYmVmb3JlIHBhcmtpbmcgLQo+
Pj4gd2hpY2ggbWlnaHQgYmUgYSByZWFzb25hYmxlIGdvYWwgaW4gaXRzZWxmLCBidXQgaWYgc28g
bGV0cyBhdCBsZWFzdAo+Pj4gZG9jdW1lbnQgdGhhdC4KPj4KPj4gTm93IHRoYXQgeW91IG1lbnRp
b24gaXQgdGhhdCBpcyBpbmRlZWQgd3JvbmcuCj4KPgo+IEkgd291bGRuJ3QgcyBjYWxsIGl0IHdy
b25nIGJ1dCBzdXBlcmZsdW91cyBpbiBjdXJyZW50IGNvZGUgYXMgaW5kZWVkIAo+IG9uY2UgdGhl
IHRocmVhZCBpcyBwYXJrZWQgdGhlcmUgd2lsbCBiZSBubyBzdWJzZXF1ZW50IGNhbGxzIHRvIAo+
IGRybV9zY2hlZF9nZXRfY2xlYW51cF9qb2IgdW50aWwgdGhlIHRocmVhZCBpcyB1bnBhY2tlZCBi
YWNrLCBpZiBmb3IgCj4gZXhhbXBsZSB3ZSBkZWNpZGUgdG8gY2FsbCBkcm1fc2NoZWRfZ2V0X2Ns
ZWFudXBfam9iIGZyb20gYSB3b3JrIGl0ZW0gCj4gd2hpY2gga2VlcHMgc2NoZWR1bGVkIGl0IHdv
dWxkIGJlIG5lZWRlZC4KPgo+Cj4+Cj4+IFRoZSByZWFsIHByb2JsZW0gaXMgdGhhdCBpbiB0aGUg
bWFpbiB0aHJlYWQgd2UgbWFuZ2xlZCB0aGUgY2FsbCB0byAKPj4ga3RocmVhZF9wYXJrbWUoKSBp
bnRvIGRybV9zY2hlZF9ibG9ja2VkKCkgd2hpY2ggY2FuIGJlIGNhbGxlZCBpbiAKPj4gYXRvbWlj
IGNvbnRleHQuCj4KPgo+IFdoZXJlIGlzIHRoZSBhdG9taWMgY29udGV4dCBpbiB3YWl0X2V2ZW50
X2ludGVycnVwdGlibGUgPyBJIHNlZW0gbm8gdG8gCj4gc2VlIGFueS4KPgo+IEFuZHJleQo+Cj4K
Pj4KPj4gSSBzdWdnZXN0IHRvIHJld29yayB0aGlzIHNvIHRoYXQgdGhlIGt0aHJlYWRfc2hvdWxk
X3BhcmsoKSBhbmQgCj4+IGt0aHJlYWRfc2hvdWxkX3N0b3AoKSB0ZXN0IGluIHdhaXRfZXZlbnRf
aW50ZXJydXB0aWJsZSgpIGNvbWUgZmlyc3QgCj4+IGFuZCB0aGVuIGNhbGwga3RocmVhZF9wYXJr
bWUoKSBvdXRzaWRlIG9mIHRoZSAKPj4gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkuCj4+Cj4+
IFJlZ2FyZHMsCj4+IENocmlzdGlhbi4KPj4KPj4+Cj4+PiBTdGV2ZQo+Pj4KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4+
PiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pgo+Pj4+IC0tLQo+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5j
IHwgMTAgKysrKysrKy0tLQo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Nj
aGVkdWxlci9zY2hlZF9tYWluLmMgCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3Nj
aGVkX21haW4uYwo+Pj4+IGluZGV4IGQ0Y2M3MjguLjY3NzQ5NTUgMTAwNjQ0Cj4+Pj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+Pj4+IEBAIC02MzUsOSArNjM1LDEzIEBA
IGRybV9zY2hlZF9nZXRfY2xlYW51cF9qb2Ioc3RydWN0IAo+Pj4+IGRybV9ncHVfc2NoZWR1bGVy
ICpzY2hlZCkKPj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2I7Cj4+Pj4g
wqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Pj4+IMKgIC3CoMKgwqAgLyogRG9uJ3Qg
ZGVzdHJveSBqb2JzIHdoaWxlIHRoZSB0aW1lb3V0IHdvcmtlciBpcyBydW5uaW5nICovCj4+Pj4g
LcKgwqDCoCBpZiAoc2NoZWQtPnRpbWVvdXQgIT0gTUFYX1NDSEVEVUxFX1RJTUVPVVQgJiYKPj4+
PiAtwqDCoMKgwqDCoMKgwqAgIWNhbmNlbF9kZWxheWVkX3dvcmsoJnNjaGVkLT53b3JrX3Rkcikp
Cj4+Pj4gK8KgwqDCoCAvKgo+Pj4+ICvCoMKgwqAgKiBEb24ndCBkZXN0cm95IGpvYnMgd2hpbGUg
dGhlIHRpbWVvdXQgd29ya2VyIGlzIHJ1bm5pbmcgT1IgCj4+Pj4gdGhyZWFkCj4+Pj4gK8KgwqDC
oCAqIGlzIGJlaW5nIHBhcmtlZCBhbmQgaGVuY2UgYXNzdW1lZCB0byBub3QgdG91Y2ggcmluZ19t
aXJyb3JfbGlzdAo+Pj4+ICvCoMKgwqAgKi8KPj4+PiArwqDCoMKgIGlmICgoc2NoZWQtPnRpbWVv
dXQgIT0gTUFYX1NDSEVEVUxFX1RJTUVPVVQgJiYKPj4+PiArwqDCoMKgwqDCoMKgwqDCoCAhY2Fu
Y2VsX2RlbGF5ZWRfd29yaygmc2NoZWQtPndvcmtfdGRyKSkgfHwKPj4+PiArwqDCoMKgwqDCoMKg
wqDCoCBfX2t0aHJlYWRfc2hvdWxkX3Bhcmsoc2NoZWQtPnRocmVhZCkpCj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiBOVUxMOwo+Pj4+IMKgIMKgwqDCoMKgwqAgc3Bpbl9sb2NrX2lycXNh
dmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7Cj4+Pj4KPj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlz
dAo+Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+IGh0dHBzOi8vbmFtMTEuc2Fm
ZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZy
ZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDIl
N0MwMSU3Q2FuZHJleS5ncm9kem92c2t5JTQwYW1kLmNvbSU3Q2U4MWE4MjRhNWY5ODRmNTFiYzE5
MDhkNzcyNTAzYTI1JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3
QzYzNzEwMzU2MTIyMTI5ODY5MSZhbXA7c2RhdGE9dFc5WHVwdDdhc2NWUE9sSHhIMHBIR2NiVUFy
VnlUYTVWVGxlMDE2QWNHZyUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPj4+Cj4+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
