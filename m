Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 239DE72841
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 08:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE0F6E450;
	Wed, 24 Jul 2019 06:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680043.outbound.protection.outlook.com [40.107.68.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4736E450
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 06:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QULe5mMgLIazlB3F9FtP5OuZy11e2DKbGrHm/bM/nEQWsUcrg9B64XIZ4cfjz1bSvjeqx3I0nv3y9Vfc1AhTti5vV8Ryd8eueH7oJFVImlLy4s1rCDMsStIfqaP+65G7RhMAySJ2/vqhPBbN1sTpQl78KrBybO5EV9OafBsHVambiZU9U2Tx/VLfW+MAH66kYOLvQWAk4iMsm+ETB73f6guCSqkSuyszIa17wRODgONyQGc/Gt027MSSTX3R/P9Yzk8JuC/Tdxk/bFCoB2LBnKfw5ttrrbMSlv8Euj58GXmh5/d+386GoUt4dsMYsJ5UoHipYHQVBAV1EJcHJ1Ko6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDkOa3GrHj29tQmzt6ZKGcrKe6qQlI1Gj5EBFXQHn7o=;
 b=Xl24FbHgRqjRYCOwRk1NLDj5ynf6zcV7hob0ZC6qiTmCxtwJkf9MOqhRMDF+QeXXIxd8j8/C3LAje0z7kvgzg1Uh8H+jYAkvLncHpc6FP8QaItiTpffhHrWLUDsdzSTy3QgsA0FSkR9Pt1V8/c0jWgAlKuW066sXhjRURAiLa+S/pFegfTtafjEp1K7UCA/vvd0GnPX+t+yGrNWrq8P+yczXTQaGD+dW/8xVinq2uRLlLSkJSnGjtI8MZM3qlFTEy4JtVGjPqrpM7pVQ8dPBRMAkuKEtR1yk9uMjkHM6TIZxVkApKeK+7Unh0f15ZxH6GGxc/5y64HbNViqDx45CjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR1201CA0024.namprd12.prod.outlook.com
 (2603:10b6:301:4a::34) by MWHPR12MB1310.namprd12.prod.outlook.com
 (2603:10b6:300:a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.17; Wed, 24 Jul
 2019 06:32:24 +0000
Received: from CO1NAM03FT022.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by MWHPR1201CA0024.outlook.office365.com
 (2603:10b6:301:4a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.15 via Frontend
 Transport; Wed, 24 Jul 2019 06:32:24 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT022.mail.protection.outlook.com (10.152.80.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 24 Jul 2019 06:32:23 +0000
Received: from [10.65.99.155] (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server (TLS) id 14.3.389.1; Wed, 24 Jul
 2019 01:32:21 -0500
Subject: Re: [PATCH] drm/syncobj: extend syncobj query ability v2
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Chunming Zhou
 <david1.zhou@amd.com>, <dri-devel@lists.freedesktop.org>
References: <20190723142114.24688-1-david1.zhou@amd.com>
 <fe5bff32-b7b4-e388-61e7-950b0125d8fc@intel.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <f2633335-6b0a-65b7-61c3-02cf7a14ac25@amd.com>
Date: Wed, 24 Jul 2019 14:32:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <fe5bff32-b7b4-e388-61e7-950b0125d8fc@intel.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(2980300002)(428003)(199004)(189003)(31696002)(305945005)(50466002)(426003)(36756003)(65826007)(81156014)(47776003)(6116002)(126002)(81166006)(68736007)(7736002)(476003)(58126008)(65806001)(110136005)(478600001)(446003)(8936002)(53546011)(2616005)(11346002)(336012)(8676002)(316002)(65956001)(16576012)(26005)(31686004)(186003)(23676004)(16526019)(5660300002)(356004)(3846002)(70206006)(4326008)(70586007)(6246003)(2870700001)(486006)(53936002)(67846002)(2486003)(64126003)(76176011)(2906002)(6666004)(229853002)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1310; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4cc625a-327e-4e4b-fdd4-08d71000b05d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR12MB1310; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1310:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1310088FB3A5DDBF2661EDDAB4C60@MWHPR12MB1310.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0108A997B2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: hqGtIr7CmLPnGZcD56f5irbmC+HK8YGYF8VC2KQ7tFrMf5FQan8VhLrZjITBZ6DNGHZisdzMq9H1/ZW4gDlGecJtEnbkwCUXRkwgap0r73C3+sDD3zNCdo4b/05uuLBkdW1M+AfWTaZLgFk7hxl/9UeFneIlM4gW7GlG3a26dGoS/AyMC9QusC88u6bypGge9MPOkU1hKQd4yjBw7fxBTh20ItRNGWjsjsqe/8o2jhwTCkIXsINLezyv8Iu8+ERj/4f+1uROZJj41b9H6/lY2SMyijQf35fGD/CZnEveBO+eIU1sAfsYGXpy4K5sppS5np9LDXQZXE6UNfDiQrYie04SjtR4BURmfIn6X6d5pMU7Zl+I4ZWFPWy5gILqc60GdG8HYen9hSdOyUMzUSAdp5yGFEo5hL6Ro20GtHlxzIE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2019 06:32:23.9068 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4cc625a-327e-4e4b-fdd4-08d71000b05d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1310
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDkOa3GrHj29tQmzt6ZKGcrKe6qQlI1Gj5EBFXQHn7o=;
 b=0Vpw6kyU94I8uVkJAyAiiDkohvwDt7YhWU7eD5KtfVowZkbvnJ5WnBlfudUzI36W56TU+cDNYc/Z7Te7EnNbKI9uDkBKnG8n5dH2r+wgdHXG2vTDkieGGfKsN8wbhu4/WtrCCCiLonxrPoUH3l+Epza/lg6pUpppOfKih5bG2ug=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDE55bm0MDfmnIgyNOaXpSAwMzoyMCwgTGlvbmVsIExhbmR3ZXJsaW4gd3JvdGU6Cj4g
T24gMjMvMDcvMjAxOSAxNzoyMSwgQ2h1bm1pbmcgWmhvdSB3cm90ZToKPj4gdXNlciBzcGFjZSBu
ZWVkcyBhIGZsZXhpYWJsZSBxdWVyeSBhYmlsaXR5Lgo+PiBTbyB0aGF0IHVtZCBjYW4gZ2V0IGxh
c3Qgc2lnbmFsZWQgb3Igc3VibWl0dGVkIHBvaW50Lgo+PiB2MjoKPj4gYWRkIHNhbml0aXplciBj
aGVja2luZy4KPj4KPj4gQ2hhbmdlLUlkOiBJNjUxMmI0MzA1MjRlYmFiZTcxNWU2MDJhMmJmNWFi
YjBhN2U3ODBlYQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBh
bWQuY29tPgo+PiBDYzogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50
ZWwuY29tPgo+PiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29t
Pgo+Cj4gUmV2aWV3ZWQtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGlu
QGludGVsLmNvbT4KClRoYW5rcy4KV2hpY2ggYnJhbmNoIHNob3VsZCB0aGlzIHBhdGNoIGdvIHRv
PwpJcyBpdCBPSyB0byBwdXNoIHRvIGFtZC1zdGFnaW5nLWRybS1uZXh0PwpPciBzaG91bGQgaXQg
Z28gdG8gZHJtLW1pc2M/CklmIGRybS1taXNjLCBJIG5lZWQgeW91ciBoZWxwIHRvIHB1c2ggaXQg
c2luY2UgSSBoYXZlIG5vIHBlcm1pc3Npb24gdG8gCndyaXRlLgoKLURhdmlkCj4KPj4gLS0tCj4+
IMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIHwgMzQgKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLQo+PiDCoCBpbmNsdWRlL3VhcGkvZHJtL2RybS5owqDCoMKgwqDCoMKg
wqAgfMKgIDMgKystCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTUg
ZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNv
YmouYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+PiBpbmRleCAzZDQwMDkw
NTEwMGIuLjNmYzhmNjZhZGE2OCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9z
eW5jb2JqLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPj4gQEAgLTEx
OTcsNyArMTE5Nyw3IEBAIGRybV9zeW5jb2JqX3RpbWVsaW5lX3NpZ25hbF9pb2N0bChzdHJ1Y3Qg
Cj4+IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPj4gwqDCoMKgwqDCoCBpZiAoIWRybV9j
b3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfU1lOQ09CSl9USU1FTElORSkpCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVPUE5PVFNVUFA7Cj4+IMKgIC3CoMKgwqAgaWYgKGFyZ3Mt
PnBhZCAhPSAwKQo+PiArwqDCoMKgIGlmIChhcmdzLT5mbGFncyAhPSAwKQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+IMKgIMKgwqDCoMKgwqAgaWYgKGFyZ3MtPmNvdW50
X2hhbmRsZXMgPT0gMCkKPj4gQEAgLTEyNjgsNyArMTI2OCw3IEBAIGludCBkcm1fc3luY29ial9x
dWVyeV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAKPj4gKmRldiwgdm9pZCAqZGF0YSwKPj4gwqDC
oMKgwqDCoCBpZiAoIWRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfU1lOQ09CSl9U
SU1FTElORSkpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVPUE5PVFNVUFA7Cj4+IMKg
IC3CoMKgwqAgaWYgKGFyZ3MtPnBhZCAhPSAwKQo+PiArwqDCoMKgIGlmIChhcmdzLT5mbGFncyAm
IH5EUk1fU1lOQ09CSl9RVUVSWV9GTEFHU19MQVNUX1NVQk1JVFRFRCkKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiDCoCDCoMKgwqDCoMKgIGlmIChhcmdzLT5jb3VudF9o
YW5kbGVzID09IDApCj4+IEBAIC0xMjkxLDIzICsxMjkxLDI5IEBAIGludCBkcm1fc3luY29ial9x
dWVyeV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAKPj4gKmRldiwgdm9pZCAqZGF0YSwKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChjaGFpbikgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgZG1hX2ZlbmNlICppdGVyLCAqbGFzdF9zaWduYWxlZCA9IE5VTEw7Cj4+IMKgIC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9jaGFpbl9mb3JfZWFjaChpdGVyLCBmZW5j
ZSkgewo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghaXRlcikKPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9wdXQobGFzdF9zaWduYWxlZCk7Cj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFzdF9zaWduYWxlZCA9IGRtYV9mZW5jZV9n
ZXQoaXRlcik7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCF0b19kbWFf
ZmVuY2VfY2hhaW4obGFzdF9zaWduYWxlZCktPnByZXZfc2Vxbm8pCj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBJdCBpcyBtb3N0IGxpa2VseSB0aGF0IHRpbWVs
aW5lIGhhcwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHVu
b3JkZXIgcG9pbnRzLiAqLwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYnJlYWs7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChhcmdzLT5mbGFncyAmCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX1NZTkNPQkpfUVVFUllfRkxBR1Nf
TEFTVF9TVUJNSVRURUQpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwb2lu
dCA9IGZlbmNlLT5zZXFubzsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfY2hhaW5fZm9yX2VhY2go
aXRlciwgZmVuY2UpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGlmICghaXRlcikKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYnJlYWs7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBk
bWFfZmVuY2VfcHV0KGxhc3Rfc2lnbmFsZWQpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbGFzdF9zaWduYWxlZCA9IGRtYV9mZW5jZV9nZXQoaXRlcik7Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIXRvX2RtYV9mZW5jZV9j
aGFpbihsYXN0X3NpZ25hbGVkKS0+cHJldl9zZXFubykKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogSXQgaXMgbW9zdCBsaWtlbHkgdGhhdCB0aW1l
bGluZSBoYXMKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKiB1bm9yZGVyIHBvaW50cy4gKi8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBvaW50ID0gZG1hX2ZlbmNl
X2lzX3NpZ25hbGVkKGxhc3Rfc2lnbmFsZWQpID8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGxhc3Rfc2lnbmFsZWQtPnNlcW5vIDoKPj4gKyB0b19kbWFfZmVuY2Vf
Y2hhaW4obGFzdF9zaWduYWxlZCktPnByZXZfc2Vxbm87Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIH0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9pbnQgPSBkbWFfZmVuY2VfaXNf
c2lnbmFsZWQobGFzdF9zaWduYWxlZCkgPwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGxhc3Rfc2lnbmFsZWQtPnNlcW5vIDoKPj4gLSB0b19kbWFfZmVuY2VfY2hhaW4obGFzdF9z
aWduYWxlZCktPnByZXZfc2Vxbm87Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9m
ZW5jZV9wdXQobGFzdF9zaWduYWxlZCk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwb2ludCA9IDA7Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4+ICvCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KGZlbmNlKTsKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHJldCA9IGNvcHlfdG9fdXNlcigmcG9pbnRzW2ldLCAmcG9pbnQsIHNpemVv
Zih1aW50NjRfdCkpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gcmV0ID8gLUVGQVVMVCA6
IDA7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS91YXBpL2RybS9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmgKPj4gaW5kZXggNjYxZDcz
ZjlhOTE5Li5mZDk4N2NlMjRkOWYgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJt
LmgKPj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm0uaAo+PiBAQCAtNzc3LDExICs3NzcsMTIg
QEAgc3RydWN0IGRybV9zeW5jb2JqX2FycmF5IHsKPj4gwqDCoMKgwqDCoCBfX3UzMiBwYWQ7Cj4+
IMKgIH07Cj4+IMKgICsjZGVmaW5lIERSTV9TWU5DT0JKX1FVRVJZX0ZMQUdTX0xBU1RfU1VCTUlU
VEVEICgxIDw8IDApIC8qIGxhc3QgCj4+IGF2YWlsYWJsZSBwb2ludCBvbiB0aW1lbGluZSBzeW5j
b2JqICovCj4+IMKgIHN0cnVjdCBkcm1fc3luY29ial90aW1lbGluZV9hcnJheSB7Cj4+IMKgwqDC
oMKgwqAgX191NjQgaGFuZGxlczsKPj4gwqDCoMKgwqDCoCBfX3U2NCBwb2ludHM7Cj4+IMKgwqDC
oMKgwqAgX191MzIgY291bnRfaGFuZGxlczsKPj4gLcKgwqDCoCBfX3UzMiBwYWQ7Cj4+ICvCoMKg
wqAgX191MzIgZmxhZ3M7Cj4+IMKgIH07Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
