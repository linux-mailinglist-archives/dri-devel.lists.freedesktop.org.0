Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF97203992
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 16:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0476E17B;
	Mon, 22 Jun 2020 14:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8345F6E819;
 Mon, 22 Jun 2020 14:32:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gp28cjR+K00hCZWOkubxY9S1zuu2Fr5bwfRKKV0BRUkqsXs7sLoP0NLzCMwXa7LpLRDTnFnk9fM8vNTfOTkv5+aYJA5jFc088fQkhcSu2Z5aYk8X3/2x8pPuEIsKRLoI2c25PX8WVbLzOOWDuLJ94eSB5iCWAeqwdO+plE2KKygVyHoN65axkCrwaK4rHH/4SsfQ3eheRbZAQlsoI95GUNbuwI5+LSY1LawNi2ndmCQe+ii5dngwgv4gXdlZ3i7eQk+D+fVk9WwJrmvw9WYq8b0rg3U3Me34au9OPgAgYjVEJtyF3eMV6If5AitdRY5w4/LLhY39eBmm/56nQwg6Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TusdrKDfMgvrotMko4+zD+ZVicBidEYSpBeoocSAP0=;
 b=UniLnSLjfUGL4lp24KMP6M1ra9NlYQL8qr3eb+0qdJome+Ol0HRO0yCdP7mGWBEQ1nXETOvIXoWLf9yJ352UrekALtJTv7Pd8B2+Oj67tOnPfZLGLo6WFlUJPB/810JD75XA3PKaodRxdfZqLerewTvRYRdx04Vmu1jhlWZQhG7GcCAJKh+J8SuNsQsOfXDOJTYehcxyPc7hqd0IMdm0d+mjGmqAJLf+i7f8m02hIvnU1/h/yF3F/38mzj0Kv/HklA6X/neQKh7xunlcMSp3QP1b83/U6fH3LrXgxFA7f0QhYaJM7uARf7p0XifJGrO8qaDqmNUXAIjbmfMrj36i2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TusdrKDfMgvrotMko4+zD+ZVicBidEYSpBeoocSAP0=;
 b=tlX8oI3xC405ZNdJdcLwnuyxV5veWkZeEbmi/xDyzGdtq42t/h0OSvg4fvBTZiKmPx6j20GJSnxNGZIJQPmet7jhFB/VgDWa2jIetQ0R2ZNctk/5m77XapQDXbMi9s02VFNcwNBA4PbXndvaGMdSZ0t+oua0jPBrgZj9zjPF53s=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB3210.namprd12.prod.outlook.com (2603:10b6:5:185::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22; Mon, 22 Jun 2020 14:32:43 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf%3]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 14:32:42 +0000
Subject: Re: [PATCH v2 1/8] drm: Add dummy page per device or GEM object
To: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-2-git-send-email-andrey.grodzovsky@amd.com>
 <6809de08-2035-edda-ebd2-05e7f77a1068@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <cda48298-1e0b-7cad-7979-6d5c2f99ef94@amd.com>
Date: Mon, 22 Jun 2020 10:32:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <6809de08-2035-edda-ebd2-05e7f77a1068@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: BN6PR1101CA0015.namprd11.prod.outlook.com
 (2603:10b6:405:4a::25) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:6818:fffb:5b06:bef1]
 (2607:fea8:3edf:49b0:6818:fffb:5b06:bef1) by
 BN6PR1101CA0015.namprd11.prod.outlook.com (2603:10b6:405:4a::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Mon, 22 Jun 2020 14:32:41 +0000
X-Originating-IP: [2607:fea8:3edf:49b0:6818:fffb:5b06:bef1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f51945b9-4e2e-4718-e825-08d816b91f80
X-MS-TrafficTypeDiagnostic: DM6PR12MB3210:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3210E06DFDEF1BD150E7F4BDEA970@DM6PR12MB3210.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WEUt03gzlMXASmJoKHDZtO7ulQYFHwJ9ZwUua7LloiwbrK4yJNlTTmuXc9ozwfWr6I9LyhTO7n/rkwpt9c7vdNC43uY7Si6CYrLvW2P2UFaIHbMLLWq7YYVB8ZYYVqjVJ26BvXYr5UNlWwsf3W2I72AoER9sLlW5wIen6tHx77PoUXuGGlsbVAmngDxKnExrZ+cj9jqI4f68jw1TVbUrklZ1FiDkGuffvKaH2YlLFdt7Hm3TPwkseRQzbo5a4KDSVHVhNqJQsr9X6B5ex7kXx/jqkn09ccwroHS1BjAHORr1AcWs8lHLuTcCOkETWzlYOkOuXpTTr/gDGB3GwxYXZU10a3UBPmsVH2BCrMe34ITWYT+bZeGhznSd0bwW5pe/DiIr3OVrbUm5C9h3F7fQd/0TidC2GOB43qBDr4NFJ9LbJJvyP1l/SciqxQksUkqgTqF37917XO3ymK0w/fUEOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(31686004)(53546011)(66574015)(2616005)(16526019)(186003)(52116002)(6486002)(8676002)(86362001)(316002)(5660300002)(36756003)(4326008)(478600001)(8936002)(83380400001)(31696002)(66946007)(66556008)(66476007)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: r1qQU5KkgLJ1u0O9Mo6UNiMjLBiFisbt0Xy3VveXmoq9W9jh/5GdHi/8VKSJtNRPKp/0RW2Or+ezDW2MguObHxWH9gWJ1Hc0h6W0XAABxBsm30HLlINUYCDZI8X6sCIDOHOimRVCcy1DQTL0xeKnGtE/AOsbeDjZlJgRSm/wX0YFaEm0EOqY5HYYcNhTbQAYabfjFmkHlwnaqTBbq8A8nvBlN8z13wb9QXlDb6KtQRPHn1qbu3BjWYvNPBXH+zlNvfTXvHAjrAwSybA8/7zai0h8ThLMXffIkdsrOVtmYO/yQBkUuzHKXg64lOVEMZalol91Q9X4efRuY47nBygOS67bSYmyi8wZMPB6XIC7/FzLqXpiItrTr6OxUkA5Qx4bdNJNkKupJyF8WjyYhtPfFHyThA9RKNDEizrYpSCegFT2t5l8QXGxvBZeiJkKvHccFr3F8Om4zdUOejiGnY+0jZiTJa+hD5f5GTe4GqaWgKzci2GkBLSA/RUxfY39GE/itsDqxmWP1BUVWQ1MwNdXls0JD6MZTD8czuGp2fWt38qIGM6zloWhxuiJT9S43VoV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f51945b9-4e2e-4718-e825-08d816b91f80
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 14:32:42.7930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJw2042tfa/wU7Co3hWxMnZ76Maq4XDz4jv+XzCo9mYywVqZLGcDASSuEp7TrUAtNBfsjy9/L1Z+eVoflQoJRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3210
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

Ck9uIDYvMjIvMjAgOToxOCBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAyMS4wNi4y
MCB1bSAwODowMyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+PiBXaWxsIGJlIHVzZWQgdG8g
cmVyb3V0ZSBDUFUgbWFwcGVkIEJPJ3MgcGFnZSBmYXVsdHMgb25jZQo+PiBkZXZpY2UgaXMgcmVt
b3ZlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9k
em92c2t5QGFtZC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuY8Kg
IHzCoCA4ICsrKysrKysrCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyB8IDEwICsr
KysrKysrKysKPj4gwqAgaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaMKgwqDCoMKgwqAgfMKgIDIgKysK
Pj4gwqAgaW5jbHVkZS9kcm0vZHJtX2dlbS5owqDCoMKgwqDCoMKgIHzCoCAyICsrCj4+IMKgIDQg
ZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9maWxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwo+PiBpbmRl
eCBjNGM3MDRlLi42N2MwNzcwIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zp
bGUuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwo+PiBAQCAtMTg4LDYgKzE4
OCwxMiBAQCBzdHJ1Y3QgZHJtX2ZpbGUgKmRybV9maWxlX2FsbG9jKHN0cnVjdCBkcm1fbWlub3Ig
Cj4+ICptaW5vcikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfcHJpbWVf
ZGVzdHJveTsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgICvCoMKgwqAgZmlsZS0+ZHVtbXlfcGFnZSA9
IGFsbG9jX3BhZ2UoR0ZQX0tFUk5FTCB8IF9fR0ZQX1pFUk8pOwo+PiArwqDCoMKgIGlmICghZmls
ZS0+ZHVtbXlfcGFnZSkgewo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVOT01FTTsKPj4gK8Kg
wqDCoMKgwqDCoMKgIGdvdG8gb3V0X3ByaW1lX2Rlc3Ryb3k7Cj4+ICvCoMKgwqAgfQo+PiArCj4+
IMKgwqDCoMKgwqAgcmV0dXJuIGZpbGU7Cj4+IMKgIMKgIG91dF9wcmltZV9kZXN0cm95Ogo+PiBA
QCAtMjg0LDYgKzI5MCw4IEBAIHZvaWQgZHJtX2ZpbGVfZnJlZShzdHJ1Y3QgZHJtX2ZpbGUgKmZp
bGUpCj4+IMKgwqDCoMKgwqAgaWYgKGRldi0+ZHJpdmVyLT5wb3N0Y2xvc2UpCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBkZXYtPmRyaXZlci0+cG9zdGNsb3NlKGRldiwgZmlsZSk7Cj4+IMKgICvCoMKg
wqAgX19mcmVlX3BhZ2UoZmlsZS0+ZHVtbXlfcGFnZSk7Cj4+ICsKPj4gwqDCoMKgwqDCoCBkcm1f
cHJpbWVfZGVzdHJveV9maWxlX3ByaXZhdGUoJmZpbGUtPnByaW1lKTsKPj4gwqAgwqDCoMKgwqDC
oCBXQVJOX09OKCFsaXN0X2VtcHR5KCZmaWxlLT5ldmVudF9saXN0KSk7Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1l
LmMKPj4gaW5kZXggMWRlMmNkZS4uYzQ4MmU5YyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9wcmltZS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+PiBA
QCAtMzM1LDYgKzMzNSwxMyBAQCBpbnQgZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUoc3RydWN0
IGRybV9kZXZpY2UgCj4+ICpkZXYsCj4+IMKgIMKgwqDCoMKgwqAgcmV0ID0gZHJtX3ByaW1lX2Fk
ZF9idWZfaGFuZGxlKCZmaWxlX3ByaXYtPnByaW1lLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBkbWFfYnVmLCAqaGFuZGxlKTsKPj4gKwo+PiArwqDCoMKgIGlmICghcmV0KSB7Cj4+ICvC
oMKgwqDCoMKgwqDCoCBvYmotPmR1bW15X3BhZ2UgPSBhbGxvY19wYWdlKEdGUF9LRVJORUwgfCBf
X0dGUF9aRVJPKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICghb2JqLT5kdW1teV9wYWdlKQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSAtRU5PTUVNOwo+PiArwqDCoMKgIH0KPj4gKwo+
Cj4gV2hpbGUgdGhlIHBlciBmaWxlIGNhc2Ugc3RpbGwgbG9va3MgYWNjZXB0YWJsZSB0aGlzIGlz
IGEgY2xlYXIgTkFLIAo+IHNpbmNlIGl0IHdpbGwgbWFzc2l2ZWx5IGluY3JlYXNlIHRoZSBtZW1v
cnkgbmVlZGVkIGZvciBhIHByaW1lIAo+IGV4cG9ydGVkIG9iamVjdC4KPgo+IEkgdGhpbmsgdGhh
dCB0aGlzIGlzIHF1aXRlIG92ZXJraWxsIGluIHRoZSBmaXJzdCBwbGFjZSBhbmQgZm9yIHRoZSBo
b3QgCj4gdW5wbHVnIGNhc2Ugd2UgY2FuIGp1c3QgdXNlIHRoZSBnbG9iYWwgZHVtbXkgcGFnZSBh
cyB3ZWxsLgo+Cj4gQ2hyaXN0aWFuLgoKCkdsb2JhbCBkdW1teSBwYWdlIGlzIGdvb2QgZm9yIHJl
YWQgYWNjZXNzLCB3aGF0IGRvIHlvdSBkbyBvbiB3cml0ZSAKYWNjZXNzID8gTXkgZmlyc3QgYXBw
cm9hY2ggd2FzIGluZGVlZCB0byBtYXAgYXQgZmlyc3QgZ2xvYmFsIGR1bW15IHBhZ2UgCmFzIHJl
YWQgb25seSBhbmQgbWFyayB0aGUgdm1hLT52bV9mbGFncyBhcyAhVk1fU0hBUkVEIGFzc3VtaW5n
IHRoYXQgdGhpcyAKd291bGQgdHJpZ2dlciBDb3B5IE9uIFdyaXRlIGZsb3cgaW4gY29yZSBtbSAK
KGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjctcmM3L3NvdXJjZS9tbS9tZW1v
cnkuYyNMMzk3Nykgb24gCnRoZSBuZXh0IHBhZ2UgZmF1bHQgdG8gc2FtZSBhZGRyZXNzIHRyaWdn
ZXJlZCBieSBhIHdyaXRlIGFjY2VzcyBidXQgdGhlbiAKaSByZWFsaXplZCBhIG5ldyBDT1cgcGFn
ZSB3aWxsIGJlIGFsbG9jYXRlZCBmb3IgZWFjaCBzdWNoIG1hcHBpbmcgYW5kIAp0aGlzIGlzIG11
Y2ggbW9yZSB3YXN0ZWZ1bCB0aGVuIGhhdmluZyBhIGRlZGljYXRlZCBwYWdlIHBlciBHRU0gb2Jq
ZWN0LiAKV2UgY2FuIGluZGVlZCBvcHRpbWl6ZSBieSBhbGxvY2F0aW5nIHRoaXMgZHVtbXkgcGFn
ZSBvbiB0aGUgZmlyc3QgcGFnZSAKZmF1bHQgYWZ0ZXIgZGV2aWNlIGRpc2Nvbm5lY3QgaW5zdGVh
ZCBvbiBHRU0gb2JqZWN0IGNyZWF0aW9uLgoKQW5kcmV5CgoKPgo+PiBtdXRleF91bmxvY2soJmZp
bGVfcHJpdi0+cHJpbWUubG9jayk7Cj4+IMKgwqDCoMKgwqAgaWYgKHJldCkKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIGdvdG8gZmFpbDsKPj4gQEAgLTEwMDYsNiArMTAxMyw5IEBAIHZvaWQgZHJtX3By
aW1lX2dlbV9kZXN0cm95KHN0cnVjdCAKPj4gZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IHNn
X3RhYmxlICpzZykKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9idWZfdW5tYXBfYXR0YWNobWVu
dChhdHRhY2gsIHNnLCBETUFfQklESVJFQ1RJT05BTCk7Cj4+IMKgwqDCoMKgwqAgZG1hX2J1ZiA9
IGF0dGFjaC0+ZG1hYnVmOwo+PiDCoMKgwqDCoMKgIGRtYV9idWZfZGV0YWNoKGF0dGFjaC0+ZG1h
YnVmLCBhdHRhY2gpOwo+PiArCj4+ICvCoMKgwqAgX19mcmVlX3BhZ2Uob2JqLT5kdW1teV9wYWdl
KTsKPj4gKwo+PiDCoMKgwqDCoMKgIC8qIHJlbW92ZSB0aGUgcmVmZXJlbmNlICovCj4+IMKgwqDC
oMKgwqAgZG1hX2J1Zl9wdXQoZG1hX2J1Zik7Cj4+IMKgIH0KPj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9maWxlLmggYi9pbmNsdWRlL2RybS9kcm1fZmlsZS5oCj4+IGluZGV4IDE5ZGY4
MDIuLjM0OWE2NTggMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9maWxlLmgKPj4gKysr
IGIvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaAo+PiBAQCAtMzM1LDYgKzMzNSw4IEBAIHN0cnVjdCBk
cm1fZmlsZSB7Cj4+IMKgwqDCoMKgwqDCoCAqLwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fcHJp
bWVfZmlsZV9wcml2YXRlIHByaW1lOwo+PiDCoCArwqDCoMKgIHN0cnVjdCBwYWdlICpkdW1teV9w
YWdlOwo+PiArCj4+IMKgwqDCoMKgwqAgLyogcHJpdmF0ZTogKi8KPj4gwqAgI2lmIElTX0VOQUJM
RUQoQ09ORklHX0RSTV9MRUdBQ1kpCj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBsb2NrX2Nv
dW50OyAvKiBEUkkxIGxlZ2FjeSBsb2NrIGNvdW50ICovCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2RybS9kcm1fZ2VtLmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtLmgKPj4gaW5kZXggMGIzNzUwNi4u
NDc0NjBkMSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCj4+ICsrKyBiL2lu
Y2x1ZGUvZHJtL2RybV9nZW0uaAo+PiBAQCAtMzEwLDYgKzMxMCw4IEBAIHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCB7Cj4+IMKgwqDCoMKgwqDCoCAqCj4+IMKgwqDCoMKgwqDCoCAqLwo+PiDCoMKgwqDC
oMKgIGNvbnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyAqZnVuY3M7Cj4+ICsKPj4gK8Kg
wqDCoCBzdHJ1Y3QgcGFnZSAqZHVtbXlfcGFnZTsKPj4gwqAgfTsKPj4gwqAgwqAgLyoqCj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
