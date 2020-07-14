Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4D921E6B4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 06:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4186E8AE;
	Tue, 14 Jul 2020 04:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760041.outbound.protection.outlook.com [40.107.76.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCED76E519;
 Tue, 14 Jul 2020 04:09:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrEstTj00AvtBNge3o9kJizYFecfkDbxYl9LrO/WrBF5+36M6vqnUBn8gv6i8Y3agxBybPUF55ACRulqAt6QyF9tlYxB+kOUk/oONJyrmEbYtDYXZ4OpzU0vbwqNIYOl5eTtQhdPDMPPrv8RwmYf2iv2tkjLexmECX5bKLjcguhdp572pAVb5UmFBBYW4hhQGBOH0C8XqaxPS+76z0W/3mvqjX6FwwDVg1iWJftxSZJKmN1hyUzRCYGhlOQ80X0KKtAWVbAcjLjD5j6KwlE8KxZ+6bPozjAVrKaiOplcu963AAAZKG/6JlefsVV4mpgRfvCbjIIyUnqPLbmTwSaPZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h02ElK9NRtznYYpJuJ3DRrggC3R+7X/CANqB6aDyeig=;
 b=PV5rmOj8plAU96yBOqT4cSteVhpm2v2ZQJz7CNRuvzFvz2MvP+Cf+8l9k4RoX1h9JXtvbTNsOqksEmOb3F1U0H0GXjiVTU8uh7SFH8KaGS+zQJTGp+kQB8NZPRu4gkqjSnPuQmBDVVsu1C6l0TKqcFn/woSkkE72puyRQNQ/zQHnlVx7lHsFGQpIav/MRcDiCXb97VnBN1Ofg86ca2XsKx32HUi9OzwDyxQFghzTiL359PPLbpHl1hu8OAgy2Wn+p2dcLfWPVf/GA4bemyIrcuf4RI3eVAY+Z9iuZ2waaqfumTBdO+G6HPrsJhFU8pr+etoGh2Vyj0ZQMCSPHguVKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h02ElK9NRtznYYpJuJ3DRrggC3R+7X/CANqB6aDyeig=;
 b=SB8xrV2bp+O0rcPKaHQvi6IYj8ebdxJlqrJmziI3AKRlO3/5/eLv8oigpp24jDIuGu2qus8XGAT/uRA6Wpg46FBqwbfZqsnctiuGZS60+dHlLro3vn0xIlgJbPG7IxfonZFy48WSrp4KOijBRPooa2F9bx3zQZxysgA66kyNOEs=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB2407.namprd12.prod.outlook.com (2603:10b6:4:b4::24) by
 DM5PR1201MB0057.namprd12.prod.outlook.com (2603:10b6:4:5b::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.23; Tue, 14 Jul 2020 04:09:44 +0000
Received: from DM5PR12MB2407.namprd12.prod.outlook.com
 ([fe80::9c20:aa3e:1b50:7ce5]) by DM5PR12MB2407.namprd12.prod.outlook.com
 ([fe80::9c20:aa3e:1b50:7ce5%4]) with mapi id 15.20.3174.026; Tue, 14 Jul 2020
 04:09:44 +0000
Subject: Re: [PATCH 1/1] drm/amdkfd: Add IPC API
To: Dave Airlie <airlied@gmail.com>
References: <20200714031435.13362-1-Felix.Kuehling@amd.com>
 <20200714031435.13362-2-Felix.Kuehling@amd.com>
 <CAPM=9tzjQGg2OMrptD6qJv0yEvY+S7mS6oXNxe21UoWk+6-Ung@mail.gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <4245d340-f4f6-eeb5-40a6-3afd7754852c@amd.com>
Date: Tue, 14 Jul 2020 00:09:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAPM=9tzjQGg2OMrptD6qJv0yEvY+S7mS6oXNxe21UoWk+6-Ung@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: QB1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::23) To DM5PR12MB2407.namprd12.prod.outlook.com
 (2603:10b6:4:b4::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.53.25) by
 QB1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:2d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.20 via Frontend Transport; Tue, 14 Jul 2020 04:09:44 +0000
X-Originating-IP: [142.117.53.25]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 89532f7c-95db-42fb-b1c9-08d827abbd6f
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0057:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0057DE118311AD23C5B24A8C92610@DM5PR1201MB0057.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lzOfNaHjjFpYQ0xRho+ByR/WF23vJwwGMgQGnTol0ngjy9MZ3I3gRc0MzXF79P2OTLTquROWu/hlgnof9Gb5VerkLba6OQkixpMhxMSeysv0SloceCM69zr/LCwz42zylZds0xnMBb+bR9RVN52HZhRVp2PS89kLh4Mni3mQQyqmFwngUC4cvqwrwql01caik3BeLak1asYaAVZg0sszEQoUk0lAwyWNvwngNQ6NghcdKGeXWp3QzLua64/7TeOZOgMgEjWguNPlefxkLEqq/SFtDD7qnkiL24b+QsMlEx+0OlYgXzwXo4Yl5ZA2FZbLnEC8qptSbjE+1g9O98WflPDJVaOk0ZCsiYYhkfp0U20CI4XRq9f8vdXH8KYAAvCGakuscbUKe6xXrUuhTLGEO8bcVMVfIwx7jNIaMMy92GYKWIylwOrUYAaGswSo+pfuFSXNRi7gA7UtXColK1LZfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2407.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(6486002)(26005)(4326008)(16526019)(186003)(2906002)(478600001)(44832011)(66556008)(16576012)(66946007)(66476007)(316002)(86362001)(52116002)(966005)(54906003)(31686004)(8936002)(83380400001)(956004)(8676002)(36756003)(6916009)(5660300002)(31696002)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: FdX/cn0zYCiz14u93My9ngppravOXo3ZvYMNXxAL3uW40PgUyzlON537KoOXHOGQK+WlKRK1fcxG/AQgVTJoJgV4rpv+wSK28Or+DykWNL+Zyar6zd8pnpAzWH3+CKGDkR2cQsOklS0tz/hjAdtKMXkpZivB/YyblKLqFUcE0isNwtJNBXM4WWLMXuCJVupTm8O2vQOg5yRDjY88C3GdVjqPO6bEbmvtKQPvYg+cmYuovAM79ny49FfqsixtyJIjO4d3glI+zNFIKTNvfg2rsjb2HIryktOQ0B6ucm0XnhOMwOmG8LJZpirMIWD06KzhSFc+gPIj5RWeR2lK4VNcRCdaX8UkheNl4eNhn8LW9LvOdn8UxKRwbASK8aqRCUMLR1JmkL52ZMDdo8rikXYsTQ8OwQGQc2dAYLj6GeXxugg2Y8Xv0DtCBnAu39wM17wr/FbSnxCmw4XEc5kPCpM3SCRbwFVTaqqm6NXHPjJewS/FMUZJ9Pj1jRqTCMZyyNm3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89532f7c-95db-42fb-b1c9-08d827abbd6f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2020 04:09:44.5329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSfRsbrH+jwsaOuh4/KvxGJxxTHdTjkyCjBJV7bhuF6C7JaclXkg9fP3uW/sZ52pV+/wmOmxHHVfS65AwqXF7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0057
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMC0wNy0xMyB1bSAxMToyOCBwLm0uIHNjaHJpZWIgRGF2ZSBBaXJsaWU6Cj4gT24gVHVl
LCAxNCBKdWwgMjAyMCBhdCAxMzoxNCwgRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFt
ZC5jb20+IHdyb3RlOgo+PiBUaGlzIGFsbG93cyBleHBvcnRpbmcgYW5kIGltcG9ydGluZyBidWZm
ZXJzLiBUaGUgQVBJIGdlbmVyYXRlcyBoYW5kbGVzCj4+IHRoYXQgY2FuIGJlIHVzZWQgd2l0aCB0
aGUgSElQIElQQyBBUEksIGkuZS4gYmlnIG51bWJlcnMgcmF0aGVyIHRoYW4KPj4gZmlsZSBkZXNj
cmlwdG9ycy4KPiBGaXJzdCB1cCB3aHk/IEkgZ2V0IHRoZSBob3cuCgpUaGUgIndoeSIgaXMgY29t
cGF0aWJpbGl0eSB3aXRoIEhJUCBjb2RlIHBvcnRlZCBmcm9tIENVREEuIFRoZQplcXVpdmFsZW50
IENVREEgSVBDIEFQSSB3b3JrcyB3aXRoIGhhbmRsZXMgdGhhdCBjYW4gYmUgY29tbXVuaWNhdGVk
CnRocm91Z2ggZS5nLiBhIHBpcGUgb3Igc2hhcmVkIG1lbW9yeS4gWW91IGNhbid0IGRvIHRoYXQg
d2l0aCBmaWxlCmRlc2NyaXB0b3JzLgoKaHR0cHM6Ly9kb2NzLm52aWRpYS5jb20vY3VkYS9jdWRh
LXJ1bnRpbWUtYXBpL2dyb3VwX19DVURBUlRfX0RFVklDRS5odG1sI2dyb3VwX19DVURBUlRfX0RF
VklDRV8xZzhhMzdmN2RmYWZhY2E2NTIzOTFkMDc1OGIzNjY3NTM5CgpodHRwczovL2RvY3MubnZp
ZGlhLmNvbS9jdWRhL2N1ZGEtcnVudGltZS1hcGkvZ3JvdXBfX0NVREFSVF9fREVWSUNFLmh0bWwj
Z3JvdXBfX0NVREFSVF9fREVWSUNFXzFnMDEwNTBhMjlmZWZkZTM4NWIxMDQyMDgxYWRhNGNkZTkK
Cgo+Cj4+ICsgKiBAc2hhcmVfaGFuZGxlIGlzIGEgMTI4IGJpdCByYW5kb20gbnVtYmVyIGdlbmVy
YXRlZCB3aXRoCj4+ICsgKiBAZ2V0X3JhbmRvbV9ieXRlcy4gVGhpcyBudW1iZXIgc2hvdWxkIGJl
IHZlcnkgaGFyZCB0byBndWVzcy4KPj4gKyAqIEtub3dsZWRnZSBvZiB0aGUgQHNoYXJlX2hhbmRs
ZSBpbXBsaWVzIGF1dGhvcml6YXRpb24gdG8gYWNjZXNzCj4+ICsgKiB0aGUgc2hhcmVkIG1lbW9y
eS4gVXNlciBtb2RlIHNob3VsZCB0cmVhdCBpdCBsaWtlIGEgc2VjcmV0IGtleS4KPj4gKyAqIEl0
IGNhbiBiZSB1c2VkIHRvIGltcG9ydCB0aGlzIEJPIGluIGEgZGlmZmVyZW50IHByb2Nlc3MgY29u
dGV4dAo+PiArICogZm9yIElQQyBidWZmZXIgc2hhcmluZy4gVGhlIGhhbmRsZSB3aWxsIGJlIHZh
bGlkIGFzIGxvbmcgYXMgdGhlCj4+ICsgKiB1bmRlcmx5aW5nIEJPIGV4aXN0cy4gSWYgdGhlIHNh
bWUgQk8gaXMgZXhwb3J0ZWQgbXVsdGlwbGUgdGltZXMsCj4gRG8gd2UgaGF2ZSBhbnkgZXhhbXBs
ZXMgb2YgYW55IEFQSXMgaW4gdGhlIGtlcm5lbCB0aGF0IG9wZXJhdGUgbGlrZQo+IHRoaXM/IFRo
YXQgZG9uJ3QgYXQgbGVhc3QgbGF5ZXIgc29tZSBzb3J0IG9mIGZpbGUgcGVybWlzc2lvbnMgIGFu
ZAo+IGFjY2VzcyBjb250cm9sIG9uIHRvcD8KClN5c3RlbVYgc2hhcmVkIG1lbW9yeSBBUElzIChz
aG1nZXQsIHNobWF0KSB3b3JrIHNpbWlsYXJseS4gVGhlcmUgYXJlCnNvbWUgcGVybWlzc2lvbnMg
dGhhdCBjYW4gYmUgc3BlY2lmaWVkIGJ5IHRoZSBleHBvcnRlciBpbiBzaG1nZXQuCkhvd2V2ZXIs
IHRoZSBoYW5kbGVzIGFyZSBqdXN0IG51bWJlcnMgYW5kIG11Y2ggZWFzaWVyIHRvIGd1ZXNzICh0
aGV5IGFyZQozMi1iaXQgaW50ZWdlcnMpLiBUaGUgbW9zdCByZXN0cmljdGl2ZSBwZXJtaXNzaW9u
cyB3b3VsZCBhbGxvdyBvbmx5IHRoZQpleHBvcnRpbmcgVUlEIHRvIGF0dGFjaCB0byB0aGUgc2hh
cmVkIG1lbW9yeSBzZWdtZW50LgoKSSB0aGluayBEUk0gZmxpbmsgd29ya3Mgc2ltaWxhcmx5IGFz
IHdlbGwsIHdpdGggYSBnbG9iYWwgbmFtZSBJRFIgdXNlZApmb3IgbG9va2luZyB1cCBHRU0gb2Jq
ZWN0cyB1c2luZyBnbG9iYWwgb2JqZWN0IG5hbWVzLgoKCj4KPiBUaGUgcmVhc29uIGZkJ3MgYXJl
IGdvb2QgaXMgdGhhdCBjb21iaW5lZCB3aXRoIHVuaXggc29ja2V0cywgeW91IGNhbid0Cj4gc25p
ZmYgaXQsIHlvdSBjYW4ndCBwdHJhY2UgYSBwcm9jZXNzIGFuZCBmaW5kIGl0LCB5b3UgY2FuJ3Qg
d3JpdGUgaXQKPiBvdXQgaW4gYSBjb3JlZHVtcCBhbmQgaGF2ZSBzb21lb25lIGFjY2VzcyBpdCBs
YXRlci4KCkFyZ3VhYmx5IHB0cmFjZSBhbmQgY29yZSBkdW1wcyBnaXZlIHlvdSBhY2Nlc3MgdG8g
YWxsIHRoZSBtZW1vcnkKY29udGVudHMgYWxyZWFkeS4gU28geW91IGRvbid0IG5lZWQgdGhlIHNo
YXJlZCBtZW1vcnkgaGFuZGxlIHRvIGFjY2VzcwptZW1vcnkgaW4gdGhhdCBjYXNlLgoKCj4KPiBU
byBtZSB0aGlzIGlzbid0IHNlY3VyZSBkZXNpZ24sIGl0J3Mgb2JzY3VyZSBkZXNpZ24sIG5vdyBJ
IGdldCB0byBmaW5kCj4geW91J3ZlIGxpa2VseSBzaGlwcGVkIHRoaXMgaW4gImRvd25zdHJlYW0i
IFJPQ20gYWxyZWFkeSwgYW5kIGhhdmUKPiBjdXN0b21lcnMgcnVubmluZyBpdC4KPgo+IE1heWJl
IHNvbWVvbmUgd2hvIGtub3dzIHNlY3VyaXR5IGNhbiBhY2sgbWVyZ2luZyB0aGlzIHNvcnQgb2Yg
dUFQSQo+IGRlc2lnbiwgSSdtIG5vdCBjb25maWRlbnQgaW4gd2hhdCBpdCdzIGRvaW5nIGlzIGlu
IGFueSB3YXlzIGEgZ29vZAo+IGlkZWEuIEkgbWlnaHQgaGF2ZSB0byBhc2sgc29tZSBwZW9wbGUg
dG8gdGFrZSBhIGNsb3NlciBsb29rLgoKUGxlYXNlIGRvLiBXZSBoYXZlIHRyaWVkIHRvIG1ha2Ug
dGhpcyBBUEkgYXMgc2VjdXJlIGFzIHBvc3NpYmxlIHdpdGhpbgp0aGUgY29uc3RyYWludHMgb2Yg
dGhlIHVzZXIgbW9kZSBBUEkgd2UgbmVlZGVkIHRvIGltcGxlbWVudC4KClRoYW5rcywKwqAgRmVs
aXgKCgo+Cj4gRGF2ZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
