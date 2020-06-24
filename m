Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C64C0206A6D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 05:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87236EAB0;
	Wed, 24 Jun 2020 03:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6252B6EAAE;
 Wed, 24 Jun 2020 03:12:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3ee+/DOov4qVp3NYaWnuwYqCm8xWcmgoUtUfPvywFL7wbYlBa4hePvONNl80Se57kbkkjiQdSbOhH/+xUybUQYgavtzHrk88W4uMkgPfXiJV//6naLM51SxwNxpCttb89QfOmasxvz0uSEVMspoSdLk1Ncaq8rkpyb9HclToqEN8nf1KxQB12ALSdLW00J/wtGWsEvI7EWu89AdxlSquLw4eHqxucFxJCkY0KvmGRrV3sEuaJnv80ZbAkEUZvGvaQwCez3nQOa1pkT1jN6Dc0OwaFYbfLgfbqSWj+gJEdkK+VXqRHw1mIFS3FvyLeyfqNdrs9tCKiawkOPxVFS+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNC9KOniH84uScYSRh6zupbgEhIyfc0ro9YoJDrwnzI=;
 b=bbft6FCz0mghxtapVDttTIagO3MUkAc/p4Pb3DSaMDPvLC1pA019+2oRETl72F7wcOsFkbL7RWdmgXeMUkNEaD5mTYsdt77tSUs77FN2SYQq5wikjWM5W1RzUPfpIpK0mXT9W3d53HWED9pQKW/ua5Y/8US4KplD2vLcM0I1foJ01cWe0ahCyHYjV8CpBaz0xrzsE7r6ewsz7EoI+wgmZU3ROKlxb9be+ZBRxBJgZ1oPp+sx8X9PE1mfv6+3/05MpY3O2RqIljNVhDfbfPhudnqenyCB76M2EUOWkVXoqipCnFhfqsSQt9RykfHsVT3EvWPEJlZx0ELgcZjCNMX+/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNC9KOniH84uScYSRh6zupbgEhIyfc0ro9YoJDrwnzI=;
 b=sFaK+KpAK2aRbhj/Zi7EMfiRF20gYaIeCtqFYMWnkGDVLABb/uePGrX0GjC2Jjyulg3NhcO5JnSQw5fJZDqMtcQa9wqh5iG6KSgjALOG70zRgGFA6qicU6EaSUIUCNqcbhaQY7gey2IB9gJHmePf7lFldV91n70VkBSSpZxY2+8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB4057.namprd12.prod.outlook.com (2603:10b6:5:213::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20; Wed, 24 Jun 2020 03:12:35 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf%3]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 03:12:35 +0000
Subject: Re: [PATCH v2 6/8] drm/amdgpu: Unmap entire device address space on
 device remove.
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-7-git-send-email-andrey.grodzovsky@amd.com>
 <ec7dc51a-231f-f9e7-6082-5aad02965c67@gmail.com>
 <CADnq5_Oz_858bq-PRc=DsL62=TiqFaONw4qARK8NVbUVzMfuCw@mail.gmail.com>
 <20200623102203.GK20149@phenom.ffwll.local>
 <1bd67cd4-abd3-a6a8-e109-aea9752fff48@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <7765bbd7-9841-442c-dbc5-194c2f9e944e@amd.com>
Date: Tue, 23 Jun 2020 23:12:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <1bd67cd4-abd3-a6a8-e109-aea9752fff48@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0122.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::31) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:f841:dc76:7c07:f4bf]
 (2607:fea8:3edf:49b0:f841:dc76:7c07:f4bf) by
 YT1PR01CA0122.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 24 Jun 2020 03:12:34 +0000
X-Originating-IP: [2607:fea8:3edf:49b0:f841:dc76:7c07:f4bf]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 66276790-3775-4d4e-4262-08d817ec7180
X-MS-TrafficTypeDiagnostic: DM6PR12MB4057:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4057B43E3C6820C447B51882EA950@DM6PR12MB4057.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HUIc1+iShFUcZcAqeZx9GIOOjC5S7goOgFbEkeAoWws+0S5t840kao3oGLtyUPEkAEB9woMOiI4KkltnUrRtRIA1baUC4OI+MgA3ocimVsL/bXWe1PQ5IHIPs2gS6RRe1sE0fozv2pCdlFiJCmTofNQ7vG3gQ2hTiPuAwafabwpbharSGorJtNwlFVZbBLMz24Dtny+kRRzY0WQmvujhs4xEXZgSa9VI72f4yGJliWfRCu9sdy5sYQx2XxTmW6d/wJQ4omB3/0FMSgWA1Q4U2BGD/clcHKpew5x4kJCq3Z3o4bbxVLHbHkxnJNyb8c3BWEk9493Q6yJFT4zEqi+0UHmv4+US/YGA6sUvKD9JZ3XBHNhyloUfNzvY2zUX6Ccb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(83380400001)(66574015)(36756003)(31696002)(478600001)(86362001)(31686004)(16526019)(53546011)(186003)(52116002)(66476007)(66946007)(66556008)(4326008)(8936002)(5660300002)(8676002)(54906003)(110136005)(316002)(6486002)(2906002)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: GjjS4BoK8Wnxde+jNymFzh0s+hXiBdU/SpYmzFp3mugwxupdZ23yCu2G4LHqaBVulpwwbrq6dcNxnEuHybvrzJRkYS32v6RQl5HCQqmPnLKPCzu+ZFT07eWOpl0JfPht8mbEvxIn0I3oF6JmN5VBB1nikqZtrKqrQT+pLyXXNC0yURbBnUzKuLJ0HaTc/4KbyUQWUkdlqusJyDlLxlLz8BzcFgAXSLuhXWK5Y5aVGrRShHUJGvRDwCWzTVpF7BgF5YnITrprA3OE0jZzkxDZhyjJuxYrfVyrd29YqvfdESwNZtrlRfI4upf6uSLohnD1fcAjCm98pq5m5rPYV3D+VIBKq0xvJJGR9xAx1pXHbPp9G/N+4t/RlsgKf1yAOY/gczP0s+Rj/Qp3X4n+FuL1PQ8djPrNZRc14DhOc1dL0eFiPl2BWRHRdTn8QddPhZb/G7JrzEpdm0PUEo9miktcaqGuH+JlviZYJPFIzcg81k+E2JIVWn1F8cCEDITOj4B7kCC22/F7l1/OEcKt9663UyQS8vNMCnAuX+0ALvRpUWc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66276790-3775-4d4e-4262-08d817ec7180
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 03:12:35.8230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1jtcmdg96/z1P4mtzeHuafRY4/ZCA/z7qPQVF+L0SCorUgdqUQCM23qZu8R/SeTqb6rJ3DnbTKsMpFo2QMRxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4057
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMjMvMjAgOToxNiBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAyMy4wNi4y
MCB1bSAxMjoyMiBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+IE9uIE1vbiwgSnVuIDIyLCAyMDIw
IGF0IDAzOjQ4OjI5UE0gLTA0MDAsIEFsZXggRGV1Y2hlciB3cm90ZToKPj4+IE9uIE1vbiwgSnVu
IDIyLCAyMDIwIGF0IDM6MzggUE0gQ2hyaXN0aWFuIEvDtm5pZwo+Pj4gPGNrb2VuaWcubGVpY2h0
enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPj4+PiBBbSAyMS4wNi4yMCB1bSAwODowMyBzY2hy
aWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+PiBVc2UgdGhlIG5ldyBUVE0gaW50ZXJmYWNlIHRv
IGludmFsaWRhdGUgYWxsIGV4c2lzdGluZyBCTyBDUFUgbWFwcGluZ3MKPj4+Pj4gZm9ybSBhbGwg
dXNlciBwcm9jY2Vzc2VzLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpv
dnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4+PiBSZXZpZXdlZC1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4+Cj4+Pj4gSSB0aGluayB0
aG9zZSB0d28gcGF0Y2hlcyBjb3VsZCBhbHJlYWR5IGxhbmQgaW4gYW1kLXN0YWdpbmctZHJtLW5l
eHQKPj4+PiBzaW5jZSB0aGV5IGFyZSBhIGdvb2QgaWRlYSBpbmRlcGVuZGVudCBvZiBob3cgZWxz
ZSB3ZSBmaXggdGhlIG90aGVyIGlzc3Vlcy4KPj4+IFBsZWFzZSBtYWtlIHN1cmUgdGhleSBsYW5k
IGluIGRybS1taXNjIGFzIHdlbGwuCj4+IE5vdCBzdXJlIHRoYXQncyBtdWNoIHVzZSwgc2luY2Ug
d2l0aG91dCBhbnkgb2YgdGhlIGZhdWx0IHNpZGUgY2hhbmdlcyB5b3UKPj4ganVzdCBibG93IHVw
IG9uIHRoZSBmaXJzdCByZWZhdWx0LiBTZWVtcyBzb21ld2hhdCBzaWxseSB0byBjaGFyZ2UgYWhl
YWQgb24KPj4gdGhpcyB3aXRoIHRoZSBvdGhlciBiaXRzIHN0aWxsIHZlcnkgbXVjaCB1bmRlciBk
aXNjdXNzaW9uLgo+Cj4gV2VsbCB3aGF0IEkgd2FudGVkIHRvIHNheSBpcyB0aGF0IHdlIGRvbid0
IG5lZWQgdG8gc2VuZCBvdXQgdGhvc2Ugc2ltcGxlIAo+IHBhdGNoZXMgb25jZSBtb3JlLgo+Cj4+
IFBsdXMgSSBzdWdnZXN0ZWQgYSBwb3NzaWJsZSBiaWtlc2hlZCBoZXJlIDotKQo+Cj4gTm8gYmlr
ZXNoZWQsIGJ1dCBpbmRlZWQgYSByYXRoZXIgZ29vZCBpZGVhIHRvIG5vdCBtYWtlIHRoaXMgYSBU
VE0gZnVuY3Rpb24uCj4KPiBDaHJpc3RpYW4uCgoKU28gaSB3aWxsIGluY29ycG9yYXRlIHRoZSBj
aGFuZ2VzIHN1Z2dlc3RlZCB0byB0dXJuIHRoZSBUVE0gcGFydCBpbnRvIGdlbmVyaWMgCkRSTSBo
ZWxwZXIgYW5kIHdpbGwgcmVzZW5kIGJvdGggcGF0Y2hlcyBhcyBwYXJ0IG9mIFYzICh3aGljaCBt
aWdodCB0YWtlIGEgd2hpbGUgCm5vdyBkdWUgdG8gYSBjb250ZXh0IHN3aXRjaCBJIGFtIGRvaW5n
IGZvciBhbm90aGVyIHRhc2spLgoKQW5kcmV5CgoKPgo+PiAtRGFuaWVsCj4+Cj4+PiBBbGV4Cj4+
Pgo+Pj4+PiAtLS0KPj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMgfCAxICsKPj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+
Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYyAKPj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPj4+
Pj4gaW5kZXggNDM1OTJkYy4uNjkzMmQ3NSAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+Pj4+PiBAQCAtMTEzNSw2ICsxMTM1LDcgQEAgYW1kZ3B1
X3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4+Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOwo+Pj4+Pgo+Pj4+PiDC
oMKgwqDCoMKgwqAgZHJtX2Rldl91bnBsdWcoZGV2KTsKPj4+Pj4gKyB0dG1fYm9fdW5tYXBfdmly
dHVhbF9hZGRyZXNzX3NwYWNlKCZhZGV2LT5tbWFuLmJkZXYpOwo+Pj4+PiDCoMKgwqDCoMKgwqAg
YW1kZ3B1X2RyaXZlcl91bmxvYWRfa21zKGRldik7Cj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqDCoCBw
Y2lfZGlzYWJsZV9kZXZpY2UocGRldik7Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
