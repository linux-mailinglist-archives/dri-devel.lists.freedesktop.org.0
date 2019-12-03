Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F182C1104C4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 20:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBEF6E0E0;
	Tue,  3 Dec 2019 19:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690057.outbound.protection.outlook.com [40.107.69.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F04A6E878;
 Tue,  3 Dec 2019 19:10:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPxOR2JTcdSORYozyWKhfFJrp6hdu3LjHEWbUAwXToP2DADLdc7IpGyLnUOo8j0ZBGsaXah9kCotzlfEx10CO8b/syxbANq9d49I0OII8ZSLIhjKyUeT8vFXK21XSLdEBcoRys7BtmcgolpaCknhFTfuXCMC0uD+ZSgGpJ8/mCTFBPMMJMMrWRiQgO7TakbpQMq5glcwCAY5ABh4dCTRKoSyzkkx3kovlPT2sBZUJKKNKG1OlIAJyVNzQ8I5Fx314dkDsoINz3qas+7dObB7S9RL31Nd9l3w2+tTeeWK/q1owUlMc8gZD74PlaPwMY3kqKu1LQiPwZItKI4fp0K8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDQU7M1EXql5QHpO+wtzNdLIIENcYwZeXJ30BB7kT+o=;
 b=ocir0jxERfvQVe/SCENdjPtruekEnAZA2WFknloKCpptGzP2obIDb4ZIbrK06ORgL+wCSbNyRlt44xNM315rdbg08wBQVfENNdJER8bl3u2erkrBPBn4Aa37OLuIeVh67wwwXGe2XMdedBm5b0u3NHuvP0NgalghuBlwPLaOdxFkrNFto0qJV7Do3lAZN+MJbRgw7OTyjlhvrYGjyeJ2Yv8E8EiH+OFoXicsqL5/5mZTlJoaWG49LN2Vn+cSIz6dpQYlLGmroPz2RTlnD5FKg9P+g5ZiBsg8vqoiXN5zpuVra8ty3KMTCMSOcgAZgg5BV5PjkbNwQKqYWy+q+7NPqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1472.namprd12.prod.outlook.com (10.172.56.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Tue, 3 Dec 2019 19:10:08 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80%12]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 19:10:08 +0000
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
To: "Deng, Emily" <Emily.Deng@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <b8b716a7-e235-38b2-ea6d-0a21881fa64e@amd.com>
 <MN2PR12MB2975CA8858F21FDF325C33FE8F440@MN2PR12MB2975.namprd12.prod.outlook.com>
 <MN2PR12MB2975F38D8FB87D9812E0B0C88F430@MN2PR12MB2975.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <40f1020c-fccf-99f9-33ff-f82ef1f5f360@amd.com>
Date: Tue, 3 Dec 2019 14:10:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <MN2PR12MB2975F38D8FB87D9812E0B0C88F430@MN2PR12MB2975.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::46) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 00f349b6-9a47-4ee0-81c0-08d77824697c
X-MS-TrafficTypeDiagnostic: MWHPR12MB1472:|MWHPR12MB1472:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB14726BB00555118BFF28A49FEA420@MWHPR12MB1472.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 02408926C4
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(199004)(189003)(13464003)(36756003)(58126008)(110136005)(316002)(14454004)(478600001)(54906003)(3846002)(6116002)(86362001)(2870700001)(305945005)(2616005)(52116002)(31696002)(7736002)(14444005)(2486003)(23676004)(11346002)(446003)(186003)(76176011)(386003)(6506007)(53546011)(99286004)(26005)(2906002)(6436002)(6486002)(229853002)(6246003)(66946007)(5660300002)(66476007)(66556008)(65956001)(4326008)(6636002)(8676002)(31686004)(25786009)(6666004)(50466002)(6512007)(81166006)(81156014)(8936002)(66574012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1472;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uDm3gYmVaybWSBqUR/x5xzn2vwCI0u/d2PMhKkukJ/KHV8leSQxh5r6k231vISmOA4obB5bjtr/KyXOgV144u0J1bYuP9cA/EnXJ/miiwJJv7JN06SryyjReLgWhp/JtHbHWCiPfcG2KBW4O84xhJNdGb/QjWGzWiTArnQIcgILUP2lfI5CJ/+zesOf9gecuWDzRhjcbrKXf3qEfiCBZSFS4zrF16/kzHmsMSptCH0dB7UydlH3LpHQ1dDgG/BPs+4UIu71JVpEwF3I2kGQgTLIj0QY4ztX3+E3NaNVcEDrNyeDYy9T0y4EIl1DQRnWtl5BqkWfvY7tAgoxePc/ch01f18TejAYe0BKWkXQH4xJIXB7B8Sc9sKdHPpguA1oNPIP2c4SBDsGYM4OYGfTdlmJgPh/7WWJjWo54KHbRaiLLn/G3OEkVAEe4plO266JXFqSWWITfWqFJa7go90FuiaiicAcmgECiXIPDkBshMw4ZHRTkFUdEsPlHf0XiGyWe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f349b6-9a47-4ee0-81c0-08d77824697c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 19:10:08.2986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwdI9Xw8xb+MWX4vwXJ5x2U99+uNQgbnwAi8hTfRVcZTGbHd2WAFiUmTBnhXJVMh7RMTM7ibhYj5coy58r5EZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1472
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDQU7M1EXql5QHpO+wtzNdLIIENcYwZeXJ30BB7kT+o=;
 b=NjVQ+4YSJ+I/rBqoAhYJdwC0+z7XPJ24CnDcuKQ03jiaw/+kAiZrzhT1T7S9g6Wd/VetPBQ3BnR46RLGTK5xPrSBTNWvInWhya0+P1TnseBsQiouwu6agKkSI4F2ejmH019nzqd/c4+xkLQ17WH1xUKpp9wX6zV0E9joGUEd7H0=
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
Cc: "steven.price@arm.com" <steven.price@arm.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WWVzIC0gQ2hyaXN0aWFuIGp1c3QgcHVzaGVkIGl0IHRvIGRybS1uZXh0LW1pc2MgLSBJIGd1ZXNz
IEFsZXgvQ2hyaXN0aWFuIApkaWRuJ3QgcHVsbCB0byBhbWQtc3RhZ2luZy1kcm0tbmV4dCB5ZXQu
CgpBbmRyZXkKCk9uIDEyLzIvMTkgMjoyNCBQTSwgRGVuZywgRW1pbHkgd3JvdGU6Cj4gW0FNRCBP
ZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQo+Cj4gSGkgQW5k
cmV5LAo+ICAgICAgU2VlbXMgdGhpcyBwYXRjaCBpcyBzdGlsbCBub3QgaW4gYW1kLXN0YWdpbmct
ZHJtLW5leHQ/Cj4KPiBCZXN0IHdpc2hlcwo+IEVtaWx5IERlbmcKPgo+Cj4KPj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogRGVuZywgRW1pbHkKPj4gU2VudDogVHVlc2RheSwg
Tm92ZW1iZXIgMjYsIDIwMTkgNDo0MSBQTQo+PiBUbzogR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRy
ZXkuR3JvZHpvdnNreUBhbWQuY29tPgo+PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEtvZW5pZywKPj4gQ2hyaXN0aWFu
IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBzdGV2ZW4ucHJpY2VAYXJtLmNvbQo+PiBTdWJq
ZWN0OiBSRTogW1BBVENIIHY0XSBkcm0vc2NoZWR1bGVyOiBBdm9pZCBhY2Nlc3NpbmcgZnJlZWQg
YmFkIGpvYi4KPj4KPj4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1
dGlvbiBPbmx5XQo+Pgo+PiBSZXZpZXdlZC1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQu
Y29tPgo+Pgo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+IEZyb206IEdyb2R6b3Zz
a3ksIEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT4KPj4+IFNlbnQ6IFR1ZXNkYXks
IE5vdmVtYmVyIDI2LCAyMDE5IDc6MzcgQU0KPj4+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsKPj4+IEtvZW5pZywgQ2hy
aXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBEZW5nLCBFbWlseQo+Pj4gPEVtaWx5
LkRlbmdAYW1kLmNvbT47IHN0ZXZlbi5wcmljZUBhcm0uY29tCj4+PiBTdWJqZWN0OiBSZTogW1BB
VENIIHY0XSBkcm0vc2NoZWR1bGVyOiBBdm9pZCBhY2Nlc3NpbmcgZnJlZWQgYmFkIGpvYi4KPj4+
Cj4+PiBQaW5nCj4+Pgo+Pj4gQW5kcmV5Cj4+Pgo+Pj4gT24gMTEvMjUvMTkgMzo1MSBQTSwgQW5k
cmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+Pj4gUHJvYmxlbToKPj4+PiBEdWUgdG8gYSByYWNlIGJl
dHdlZW4gZHJtX3NjaGVkX2NsZWFudXBfam9icyBpbiBzY2hlZCB0aHJlYWQgYW5kCj4+Pj4gZHJt
X3NjaGVkX2pvYl90aW1lZG91dCBpbiB0aW1lb3V0IHdvcmsgdGhlcmUgaXMgYSBwb3NzaWJsaXR5
IHRoYXQgYmFkCj4+Pj4gam9iIHdhcyBhbHJlYWR5IGZyZWVkIHdoaWxlIHN0aWxsIGJlaW5nIGFj
Y2Vzc2VkIGZyb20gdGhlIHRpbWVvdXQKPj4+PiB0aHJlYWQuCj4+Pj4KPj4+PiBGaXg6Cj4+Pj4g
SW5zdGVhZCBvZiBqdXN0IHBlZWtpbmcgYXQgdGhlIGJhZCBqb2IgaW4gdGhlIG1pcnJvciBsaXN0
IHJlbW92ZSBpdAo+Pj4+IGZyb20gdGhlIGxpc3QgdW5kZXIgbG9jayBhbmQgdGhlbiBwdXQgaXQg
YmFjayBsYXRlciB3aGVuIHdlIGFyZQo+Pj4+IGdhcmFudGVlZCBubyByYWNlIHdpdGggbWFpbiBz
Y2hlZCB0aHJlYWQgaXMgcG9zc2libGUgd2hpY2ggaXMgYWZ0ZXIKPj4+PiB0aGUgdGhyZWFkIGlz
IHBhcmtlZC4KPj4+Pgo+Pj4+IHYyOiBMb2NrIGFyb3VuZCBwcm9jZXNzaW5nIHJpbmdfbWlycm9y
X2xpc3QgaW4gZHJtX3NjaGVkX2NsZWFudXBfam9icy4KPj4+Pgo+Pj4+IHYzOiBSZWJhc2Ugb24g
dG9wIG9mIGRybS1taXNjLW5leHQuIHYyIGlzIG5vdCBuZWVkZWQgYW55bW9yZSBhcwo+Pj4+IGRy
bV9zY2hlZF9nZXRfY2xlYW51cF9qb2IgYWxyZWFkeSBoYXMgYSBsb2NrIHRoZXJlLgo+Pj4+Cj4+
Pj4gdjQ6IEZpeCBjb21tZW50cyB0byByZWxmZWN0IGxhdGVzdCBjb2RlIGluIGRybS1taXNjLgo+
Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92
c2t5QGFtZC5jb20+Cj4+Pj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPj4+PiBUZXN0ZWQtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdA
YW1kLmNvbT4KPj4+PiAtLS0KPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVk
X21haW4uYyB8IDI3Cj4+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+PiAgICAxIGZp
bGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX21haW4uYwo+Pj4+IGluZGV4IDY3NzQ5NTUuLjFiZjljNDAgMTAwNjQ0
Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+Pj4+IEBAIC0yODQs
MTAgKzI4NCwyMSBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfam9iX3RpbWVkb3V0KHN0cnVjdAo+
Pj4gd29ya19zdHJ1Y3QgKndvcmspCj4+Pj4gICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4+Pj4K
Pj4+PiAgICAJc2NoZWQgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IGRybV9ncHVfc2NoZWR1
bGVyLAo+Pj4+IHdvcmtfdGRyLndvcmspOwo+Pj4+ICsKPj4+PiArCS8qIFByb3RlY3RzIGFnYWlu
c3QgY29uY3VycmVudCBkZWxldGlvbiBpbgo+Pj4gZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYiAq
Lwo+Pj4+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7
Cj4+Pj4gICAgCWpvYiA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmc2NoZWQtPnJpbmdfbWly
cm9yX2xpc3QsCj4+Pj4gICAgCQkJCSAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiwgbm9kZSk7
Cj4+Pj4KPj4+PiAgICAJaWYgKGpvYikgewo+Pj4+ICsJCS8qCj4+Pj4gKwkJICogUmVtb3ZlIHRo
ZSBiYWQgam9iIHNvIGl0IGNhbm5vdCBiZSBmcmVlZCBieSBjb25jdXJyZW50Cj4+Pj4gKwkJICog
ZHJtX3NjaGVkX2NsZWFudXBfam9icy4gSXQgd2lsbCBiZSByZWluc2VydGVkIGJhY2sgYWZ0ZXIK
Pj4+IHNjaGVkLT50aHJlYWQKPj4+PiArCQkgKiBpcyBwYXJrZWQgYXQgd2hpY2ggcG9pbnQgaXQn
cyBzYWZlLgo+Pj4+ICsJCSAqLwo+Pj4+ICsJCWxpc3RfZGVsX2luaXQoJmpvYi0+bm9kZSk7Cj4+
Pj4gKwkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdz
KTsKPj4+PiArCj4+Pj4gICAgCQlqb2ItPnNjaGVkLT5vcHMtPnRpbWVkb3V0X2pvYihqb2IpOwo+
Pj4+Cj4+Pj4gICAgCQkvKgo+Pj4+IEBAIC0yOTgsNiArMzA5LDggQEAgc3RhdGljIHZvaWQgZHJt
X3NjaGVkX2pvYl90aW1lZG91dChzdHJ1Y3QKPj4+IHdvcmtfc3RydWN0ICp3b3JrKQo+Pj4+ICAg
IAkJCWpvYi0+c2NoZWQtPm9wcy0+ZnJlZV9qb2Ioam9iKTsKPj4+PiAgICAJCQlzY2hlZC0+ZnJl
ZV9ndWlsdHkgPSBmYWxzZTsKPj4+PiAgICAJCX0KPj4+PiArCX0gZWxzZSB7Cj4+Pj4gKwkJc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsKPj4+PiAg
ICAJfQo+Pj4+Cj4+Pj4gICAgCXNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9j
aywgZmxhZ3MpOyBAQCAtMzcwLDYgKzM4MywyMAo+Pj4+IEBAIHZvaWQgZHJtX3NjaGVkX3N0b3Ao
c3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCwgc3RydWN0Cj4+PiBkcm1fc2NoZWRfam9i
ICpiYWQpCj4+Pj4gICAgCWt0aHJlYWRfcGFyayhzY2hlZC0+dGhyZWFkKTsKPj4+Pgo+Pj4+ICAg
IAkvKgo+Pj4+ICsJICogUmVpbnNlcnQgYmFjayB0aGUgYmFkIGpvYiBoZXJlIC0gbm93IGl0J3Mg
c2FmZSBhcwo+Pj4+ICsJICogZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYiBjYW5ub3QgcmFjZSBh
Z2FpbnN0IHVzIGFuZCByZWxlYXNlIHRoZQo+Pj4+ICsJICogYmFkIGpvYiBhdCB0aGlzIHBvaW50
IC0gd2UgcGFya2VkICh3YWl0ZWQgZm9yKSBhbnkgaW4gcHJvZ3Jlc3MKPj4+PiArCSAqIChlYXJs
aWVyKSBjbGVhbnVwcyBhbmQgZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYiB3aWxsIG5vdCBiZQo+
Pj4gY2FsbGVkCj4+Pj4gKwkgKiBub3cgdW50aWwgdGhlIHNjaGVkdWxlciB0aHJlYWQgaXMgdW5w
YXJrZWQuCj4+Pj4gKwkgKi8KPj4+PiArCWlmIChiYWQgJiYgYmFkLT5zY2hlZCA9PSBzY2hlZCkK
Pj4+PiArCQkvKgo+Pj4+ICsJCSAqIEFkZCBhdCB0aGUgaGVhZCBvZiB0aGUgcXVldWUgdG8gcmVm
bGVjdCBpdCB3YXMgdGhlIGVhcmxpZXN0Cj4+Pj4gKwkJICogam9iIGV4dHJhY3RlZC4KPj4+PiAr
CQkgKi8KPj4+PiArCQlsaXN0X2FkZCgmYmFkLT5ub2RlLCAmc2NoZWQtPnJpbmdfbWlycm9yX2xp
c3QpOwo+Pj4+ICsKPj4+PiArCS8qCj4+Pj4gICAgCSAqIEl0ZXJhdGUgdGhlIGpvYiBsaXN0IGZy
b20gbGF0ZXIgdG8gIGVhcmxpZXIgb25lIGFuZCBlaXRoZXIgZGVhY3RpdmUKPj4+PiAgICAJICog
dGhlaXIgSFcgY2FsbGJhY2tzIG9yIHJlbW92ZSB0aGVtIGZyb20gbWlycm9yIGxpc3QgaWYgdGhl
eSBhbHJlYWR5Cj4+Pj4gICAgCSAqIHNpZ25hbGVkLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
