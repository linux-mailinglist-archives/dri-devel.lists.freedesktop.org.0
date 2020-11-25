Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC882C45B8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 17:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4786EA50;
	Wed, 25 Nov 2020 16:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839006EA4B;
 Wed, 25 Nov 2020 16:48:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpHB03PYfyOwOZ3jR2NV1CyXpLvfsX2egbr3MbqOb+xq7JfSWAGMu1yuboZdoeSQRGu0rzqgVPdAUusY/TNx+xpr+tyAqHu+oDm2rOOUwSiAVtIIysqgH3PMTwNs2OGLfdBop42DTBb0XlOgHlMYc6o8CKEanhjKTWJnsRdOckkobO1706pruc4zDtD4TvUM1ogGf0aWT3pgkv25XuxWgcQAgLCLFf/baCwcCquFzULlzKo/CJz4LZEm56a3udzLjies6jlfQo4wprhHIYpcNRxU5vfR5TDwY3gaXMtCUn2p10/RStP4pi6TXuHJX+CIg5rcnDB+ZxTS7QssTg5mkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMF0ch6aJjVR9iJvhGAq9/GH0SDcu7DdhI15zFwXorE=;
 b=AspakeDbqTQsHz1Z/H5MU4v6gM7FkAHhnJ+wM9U1BRKXIHIKtEFpUL/+GG5Ta9i9piyOWCGXcSgaZI4dwSQHGNX7Phky4buWBiKYudI34Bushhg56KSIeWCejF8uE2SNRbYkfXv7rAaQJemHLtCJJsCsuK8TN+Abcy5vVxQ8k+XCvYE2d39ENGUZR4kOb9Kw9ntObcNXNXPtS1g8B6w9BfcStNyIMrhMcq1beguXoMRTKFTMixiX5JtjmEhUM2HZkL7J3+Ln+fLOvjaWxEZHh6IqsBi/rx/jGahSRGWsMSS+KRo70yujqT3PjMP9D+d+1CXcIgbSlIbKhkWO+xLaGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMF0ch6aJjVR9iJvhGAq9/GH0SDcu7DdhI15zFwXorE=;
 b=0aGagFiP4syLfVfUsZJO0QPtOKOs0TDaO+85sji3orvz3LtJqGSErdyEWITZCsv5+Hx+VmLk24BV+f1+lyvLn6kRp3g5nKhuaymrgdyeALAMfGUVn+llDtGsKrEIPTfGQTwyN5NlJmAjyncSjt5JWNK+ZwQ0AqB8YE/SVfLQNdo=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB4219.namprd12.prod.outlook.com (2603:10b6:5:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 25 Nov
 2020 16:48:40 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3589.031; Wed, 25 Nov 2020
 16:48:40 +0000
Subject: Re: [PATCH 3/6] drm/scheduler: Job timeout handler returns status
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alexander Deucher <Alexander.Deucher@amd.com>
References: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
 <20201125031708.6433-1-luben.tuikov@amd.com>
 <20201125031708.6433-4-luben.tuikov@amd.com>
 <ee1e75b4-a028-5eba-6d7e-9d6cee8bd3a0@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <6ca11fb3-4254-8610-10f9-bb209fddec1e@amd.com>
Date: Wed, 25 Nov 2020 11:48:47 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <ee1e75b4-a028-5eba-6d7e-9d6cee8bd3a0@amd.com>
Content-Language: en-CA
X-Originating-IP: [108.162.131.176]
X-ClientProxiedBy: YTXPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::29) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.5] (108.162.131.176) by
 YTXPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Wed, 25 Nov 2020 16:48:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a852105f-2bab-447c-d1c6-08d89161f672
X-MS-TrafficTypeDiagnostic: DM6PR12MB4219:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB421995FF90BADD2BEF7C85A699FA0@DM6PR12MB4219.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SBw7AyvSxHz+ETZcDknJHoHTHK8iLBUOgVQh1sS3173RbFbTHBLjQzY1ueKHRGzTpqD48rAwByRsq3rwEJ3nZVr8l0fD3/MWWJO4MiEK3IrhWEMIzynQCglmm3X890MuwHO6VjEFsGI9gKCIVeArpSXLcfQwVI2Z27dB3aZQV0MuevS8dc9UU7k4W+Jri4tqpjyersNJ2ATuswZ8p4DBTI9IQLRCUINdlvyG639/4rCDzGM65rQGGW6E6hwtINGG4rOsJIrxFossmTcr0GOvRaLwL4LHG5Wu7EhQ7+QvabepM/sHpbkv/Bu/MN9d7Reo9hcDAkdoQG9swblLv6QmJuYFjZqlPYZyOIf+i8jUpCHtFiIAxbhL6lJUguJCKyP/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(4001150100001)(66556008)(52116002)(66946007)(55236004)(66574015)(53546011)(31686004)(31696002)(8936002)(66476007)(83380400001)(5660300002)(110136005)(26005)(86362001)(36756003)(16576012)(316002)(4326008)(8676002)(186003)(2906002)(44832011)(16526019)(2616005)(956004)(6636002)(478600001)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: FoR2rQLEwSINGD9zHbFRGCc64QDEPOn6DdGKmNqcBL+WHcLBgnd4v0kbrlvQTYDYt7MRNKJHyFc6Xh/XcEgwtgDS8MxP4fYWiiyOEEFzdgC2hwSrTiccDOYUH6HYsvhR1rV62hVB/ct89zv9RcHIyLN3+majVgdGha76yPdqY6IoInQHQ9T6p/iwheHwidbGZ2HNyAkXohkJHtzbLmTbThbzynQQ9r1oaXnLxrCXLDVRw0JEWG4sTxOkoIKz3cfSes5KZSdHjBih6oQOJaLDsFmKXFaAXIrGwxj9MN59rKwel3YaKCq5XQOotRcSTjHjOzvtLqRN02qvsCP3G7hrAPRCH2Y5GmA1DBrAQ6C4FvFG2d/aMecuTqSoZCYosuWmUs12vmo+eBtMyI8qERTjexyhFJPR2Y+lK9a3178IsfIuSOKtzmzbIJ1lZjwBqUOYs/lr1SnbCtdKV4dBvWU5dS5VBg+Xpjj3VL9Knl0k52tU6elGUm4VETrn9JxXEsQKL3tQAI43/v+/CXJG5PV/N3OrQmNt0MxB+lkE1RPltRvCOPoNGb4e4mEp4eLQpBvh55NmfcWvhblArOvkMdJUVhIpfUnBWtMgyIzlkFHyNfHaJ0v8Qjwwt2QoMRhyvcHd0otzx8jxMlbZuk268ZvXdMEbHwE9rk+nN5zlHZk/69Qxe+QyljcSLaiLUMB7k1cSkHkLEBc7gkZ4JFR1llasoX/jC/QztuRgYP8rBaYNbM6ZmQPzdMV9GctNWwEy8fwiY0iY84A8QrytpCq01m9L7J0AeO0lz+m9qHFfgG1f2Qw7TGTUcZD9O9ZVMzUMXHVbkSXFqIAm0C0iVNYzTNQaS9kfsv5xg5FdFjV0HHwjHcgSIy0lNRaR1NUcA8AD4YyYx4ta2O7PJdHDoMQaFCcjuA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a852105f-2bab-447c-d1c6-08d89161f672
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 16:48:40.7669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSitl0uz9SJ1WnAc7tjD2aD/yw64OBNPVMBZ2OI8JI82l0q0o5QjuXSNyiSsj8jN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4219
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
Cc: Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMS0yNSAwNDo1MCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAyNS4xMS4y
MCB1bSAwNDoxNyBzY2hyaWViIEx1YmVuIFR1aWtvdjoKPj4gVGhlIGpvYiB0aW1lb3V0IGhhbmRs
ZXIgbm93IHJldHVybnMgc3RhdHVzCj4+IGluZGljYXRpbmcgYmFjayB0byB0aGUgRFJNIGxheWVy
IHdoZXRoZXIgdGhlIGpvYgo+PiB3YXMgc3VjY2Vzc2Z1bGx5IGNhbmNlbGxlZCBvciB3aGV0aGVy
IG1vcmUgdGltZQo+PiBzaG91bGQgYmUgZ2l2ZW4gdG8gdGhlIGpvYiB0byBjb21wbGV0ZS4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogTHViZW4gVHVpa292IDxsdWJlbi50dWlrb3ZAYW1kLmNvbT4KPj4g
LS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jIHwgIDYgKysr
Ky0tCj4+ICAgaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oICAgICAgICAgICAgIHwgMTMgKysr
KysrKysrKy0tLQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9qb2IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYwo+PiBp
bmRleCBmZjQ4MTAxYmFiNTUuLjgxYjczNzkwZWNjNiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9qb2IuYwo+PiBAQCAtMjgsNyArMjgsNyBAQAo+PiAgICNpbmNsdWRl
ICJhbWRncHUuaCIKPj4gICAjaW5jbHVkZSAiYW1kZ3B1X3RyYWNlLmgiCj4+ICAgCj4+IC1zdGF0
aWMgdm9pZCBhbWRncHVfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpzX2pvYikK
Pj4gK3N0YXRpYyBpbnQgYW1kZ3B1X2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAq
c19qb2IpCj4+ICAgewo+PiAgIAlzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSB0b19hbWRncHVf
cmluZyhzX2pvYi0+c2NoZWQpOwo+PiAgIAlzdHJ1Y3QgYW1kZ3B1X2pvYiAqam9iID0gdG9fYW1k
Z3B1X2pvYihzX2pvYik7Cj4+IEBAIC00MSw3ICs0MSw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9q
b2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNfam9iKQo+PiAgIAkgICAgYW1kZ3B1
X3Jpbmdfc29mdF9yZWNvdmVyeShyaW5nLCBqb2ItPnZtaWQsIHNfam9iLT5zX2ZlbmNlLT5wYXJl
bnQpKSB7Cj4+ICAgCQlEUk1fRVJST1IoInJpbmcgJXMgdGltZW91dCwgYnV0IHNvZnQgcmVjb3Zl
cmVkXG4iLAo+PiAgIAkJCSAgc19qb2ItPnNjaGVkLT5uYW1lKTsKPj4gLQkJcmV0dXJuOwo+PiAr
CQlyZXR1cm4gMDsKPj4gICAJfQo+PiAgIAo+PiAgIAlhbWRncHVfdm1fZ2V0X3Rhc2tfaW5mbyhy
aW5nLT5hZGV2LCBqb2ItPnBhc2lkLCAmdGkpOwo+PiBAQCAtNTMsMTAgKzUzLDEyIEBAIHN0YXRp
YyB2b2lkIGFtZGdwdV9qb2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNfam9iKQo+
PiAgIAo+PiAgIAlpZiAoYW1kZ3B1X2RldmljZV9zaG91bGRfcmVjb3Zlcl9ncHUocmluZy0+YWRl
dikpIHsKPj4gICAJCWFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIocmluZy0+YWRldiwgam9iKTsK
Pj4gKwkJcmV0dXJuIDA7Cj4+ICAgCX0gZWxzZSB7Cj4+ICAgCQlkcm1fc2NoZWRfc3VzcGVuZF90
aW1lb3V0KCZyaW5nLT5zY2hlZCk7Cj4+ICAgCQlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQo+
PiAgIAkJCWFkZXYtPnZpcnQudGRyX2RlYnVnID0gdHJ1ZTsKPj4gKwkJcmV0dXJuIDE7Cj4+ICAg
CX0KPj4gICB9Cj4+ICAgCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVy
LmggYi9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgKPj4gaW5kZXggMmUwYzM2OGUxOWY2Li42
MWY3MTIxZTFjMTkgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaAo+
PiArKysgYi9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgKPj4gQEAgLTIzMCwxMCArMjMwLDE3
IEBAIHN0cnVjdCBkcm1fc2NoZWRfYmFja2VuZF9vcHMgewo+PiAgIAlzdHJ1Y3QgZG1hX2ZlbmNl
ICooKnJ1bl9qb2IpKHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpOwo+PiAgIAo+PiAg
IAkvKioKPj4gLSAgICAgICAgICogQHRpbWVkb3V0X2pvYjogQ2FsbGVkIHdoZW4gYSBqb2IgaGFz
IHRha2VuIHRvbyBsb25nIHRvIGV4ZWN1dGUsCj4+IC0gICAgICAgICAqIHRvIHRyaWdnZXIgR1BV
IHJlY292ZXJ5Lgo+PiArCSAqIEB0aW1lZG91dF9qb2I6IENhbGxlZCB3aGVuIGEgam9iIGhhcyB0
YWtlbiB0b28gbG9uZyB0byBleGVjdXRlLAo+PiArCSAqIHRvIHRyaWdnZXIgR1BVIHJlY292ZXJ5
Lgo+PiArCSAqCj4+ICsJICogUmV0dXJuIDAsIGlmIHRoZSBqb2IgaGFzIGJlZW4gYWJvcnRlZCBz
dWNjZXNzZnVsbHkgYW5kIHdpbGwKPj4gKwkgKiBuZXZlciBiZSBoZWFyZCBvZiBmcm9tIHRoZSBk
ZXZpY2UuIFJldHVybiBub24temVybyBpZiB0aGUKPj4gKwkgKiBqb2Igd2Fzbid0IGFibGUgdG8g
YmUgYWJvcnRlZCwgaS5lLiBpZiBtb3JlIHRpbWUgc2hvdWxkIGJlCj4+ICsJICogZ2l2ZW4gdG8g
dGhpcyBqb2IuIFRoZSByZXN1bHQgaXMgbm90ICJib29sIiBhcyB0aGlzCj4+ICsJICogZnVuY3Rp
b24gaXMgbm90IGEgcHJlZGljYXRlLCBhbHRob3VnaCBpdHMgcmVzdWx0IG1heSBzZWVtCj4+ICsJ
ICogYXMgb25lLgo+IAo+IEkgdGhpbmsgdGhlIHdob2xlIGFwcHJvYWNoIG9mIHRpbWluZyBvdXQg
YSBqb2IgbmVlZHMgdG8gYmUgcmV0aGlua2VkLiAKPiBXaGF0J3MgdGltaW5nIG91dCBoZXJlIGlz
IHRoZSBoYXJkd2FyZSBlbmdpbmUsIG5vdCB0aGUgam9iLgo+IAo+IFNvIHdlIHNob3VsZCBhbHNv
IG5vdCBoYXZlIHRoZSBqb2IgYXMgcGFyYW1ldGVyIGhlcmUuIE1heWJlIHdlIHNob3VsZCAKPiBt
YWtlIHRoYXQgdGhlIGZlbmNlIHdlIGFyZSB3YWl0aW5nIGZvciBpbnN0ZWFkLgoKWWVzLCBJIHdh
bnRlZCB0aGlzIHBhdGNoIHRvIGJlIG1pbmltYWwsIGFuZCBub3QgdG8gZGlzcnVwdAp0b28gbWFu
eSB0aGluZ3MuCgpZZXMsIGluIHRoZSBmdXR1cmUgd2UgY2FuIHRvdGFsbHkgcmV2YW1wIHRoaXMs
IGJ1dCB0aGlzCmlzIGEgbWluaW1hbCBwYXRjaC4KCj4gCj4+ICAgCSAqLwo+PiAtCXZvaWQgKCp0
aW1lZG91dF9qb2IpKHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpOwo+PiArCWludCAo
KnRpbWVkb3V0X2pvYikoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYik7Cj4gCj4gSSB3
b3VsZCBlaXRoZXIgcmV0dXJuIGFuIGVycm9yIGNvZGUsIGJvb2xlYW4gb3IgZW51bSBoZXJlLiBC
dXQgbm90IHVzZSBhIAo+IG51bWJlciB3aXRob3V0IGEgZGVmaW5lLgoKWWVzLCB0aGF0J3MgYSBn
cmVhdCBpZGVhLS1JJ2xsIG1ha2UgdGhlIGNoYW5nZSBub3csIGFuZCByZXN1Ym1pdC4KClJlZ2Fy
ZHMsCkx1YmVuCgo+IAo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+IAo+PiAgIAo+PiAgIAkvKioK
Pj4gICAgICAgICAgICAqIEBmcmVlX2pvYjogQ2FsbGVkIG9uY2UgdGhlIGpvYidzIGZpbmlzaGVk
IGZlbmNlIGhhcyBiZWVuIHNpZ25hbGVkCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
