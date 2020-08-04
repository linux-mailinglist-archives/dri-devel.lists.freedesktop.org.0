Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 768F023B8D6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 12:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA35D89F1B;
	Tue,  4 Aug 2020 10:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E42E89F1B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 10:34:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9FJNL11rSs9ii2V3qwOea0a15ln9zI/FkBNTSKK1WoNOCKiIsaXgF8P42go3Yhi+rmmNZd6kXJlstjIh09JqlLdiL7gbk8+RlH31geugFY4wV2qVWTKW6KIOcxPZD3mZxGgEyjZy5ZVTZLYnrxGSNMV4Nnwi6Vxwu6DYQYXUWY/hAuwTaWGOd+WxiOYJlwLKptpLCnvXWsAGOMpt3yBFSDETviBDKj3Ifp/vV/16xCc+EwBT1AI8MnAG07nh1P9CJPVCBpTdH7HMnX6sKZPaSsQc5wOVK/3CgH1E+qr5mUo2zmRQeqCE/Uoi+BBwpPAPX3ZjX3a1CXO1J0WvSHySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFh5+5jtqxWQjoDWS4txjZWhzvckx9NthM7EMd4C2uM=;
 b=iuvH3fgopdNvjAwOmZJ4ddEuxq7plLOz9gg7uFBicgSSsarLxxSAJmmtHcXybzQbR8J+qm1Y/2+/TWbAR9aKtgB1UvwuPWBs2Qp2yobnatLMD7izPyIJPu0MDXPLcMDGVH6r/y28BYe9upRzCeu7Mwrxv5VaEXNv+WdHlP9rNaIubNSnXb4wt0kWDYEro6ZRjwm5IqOWqYYKc7BLWP8ji4Ajb+21EK8Kg3f/Jwsq47eUTqkvT1LiNiggjrLAzw/YPDa54+a5rQ7rFYZDZvUvePiEN9J2YRPF2BKuMVj0ufAKojrk03/NeLedp9ANuA3ETKaNrdq1rElrn+n5dSLBtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFh5+5jtqxWQjoDWS4txjZWhzvckx9NthM7EMd4C2uM=;
 b=xxEE/zIzIQMLdoBqOLU/vOuR8Vyubd2Rh/HFCSdN6tN+ZdNBqah6eJd3Ul/aCT97nd1i62hw+YV+rytxPZ0QGcicIP8US85x+EoI617QCYyfFpkbRw1V5Tc6Eea2LUPKJvbaQLE9xTRpfCnB+KArG25cBKru7y9Xyfo2WpjsaAM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Tue, 4 Aug
 2020 10:34:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 10:34:33 +0000
Subject: Re: [PATCH 06/59] drm/ttm: use a helper for unlocked moves to the lru
 tail
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-7-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <06f8ad09-ae3f-60e8-da3d-0cad42968146@amd.com>
Date: Tue, 4 Aug 2020 12:34:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200804025632.3868079-7-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: ZR0P278CA0027.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 ZR0P278CA0027.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Tue, 4 Aug 2020 10:34:32 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: be7db06f-0763-4567-0b62-08d83861fa04
X-MS-TrafficTypeDiagnostic: MN2PR12MB4254:
X-Microsoft-Antispam-PRVS: <MN2PR12MB425477F5918DA255C193F43A834A0@MN2PR12MB4254.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jtD6gJvtCT99XYMxAAOPCNgxU+B38O9ZvJYPhcEByQNcMRTQsOPWVquOs3b7vIEPrVohvVbWBZMNlTd1isaipJgt6pglvZIGAzLkTmvcyuo5LxvijyXzp/KVyqlzKX+8CFqJuhRPxPyB+sh34NfFWZaBmM9YPPAp6DkGWNgdTp+mc0eovV5oFIvpZWTt+UYXIoU4IJcrPTGs/7b8N9YwKYf5oHS6VQ/ELTf2p+xOh2gxiPJE4Mgwdxn2qF8TB0sGWLm41M9/sZUlpHr1HdRovezlqB3zgVlvvUg5YyQ0SR1VPbpLK3qlZGp9XbE2adJUKCGXNVnlJv/9CF/pXSXPGISDetECvlT+FB98p0GOaE8+FN2D+UrmJa9JJruBHXIl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(66556008)(36756003)(66946007)(31686004)(16526019)(66476007)(186003)(8936002)(31696002)(66574015)(6486002)(83380400001)(52116002)(4326008)(2616005)(6666004)(316002)(86362001)(2906002)(478600001)(8676002)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 1JL0VXsvOscoF4uXcx0m/nsIwOBPywT+ZpRbt6tSe60a2NjjrbbTbzKdEgMwGPxMTksGv3E56QyT3xog/hqa3FL7BZ7mjQ3sa696oT4g8pzsZyyLvz2kjqVhPgaWLne74hZCdXRb29DeQDuHeP3jXhsjf/6dvyEL5btM9UdvW1w9GuWoMzrcPJqGu3FDatJDn403v3xIaLFDMgI2fF0FH3nxTNVq/GxeSBynfvvNHGnc6C1ptu2nGveMrDr/qIdCVxnjYG2cWffiZhSSzth6WCG105P7paORK9qJ0WDy1Zzy6X9zPL1Rcfq87G4FnUL1iGTjXDNm+pfI4h84xN0aSu/LRb66xkkH5BjyXhGrLtAlnoF01EWVy0t1VoL+7Uxz5CCMBL62++HNa0FDTXX5AHkWIBAaBvKr4rn/0AFw9hqSmk6d0uoxjbptEoy51uYP1RWdSAOiNCGAjYscrJU9O9TPhrCBaPWAFiStf19n3IMyyfl+1JAJsqhutAWcrBeJKGhTh3Dhl3L1CaaaScdYrtcCy6L9rg+NJ3bOqd9dflPllgiclLSalqM0g1hVfrEpNv65ERXPt7tqFH0xQIoVV26AO6Fn3oZZXkoq8EVnc+RkY42dvxmle2xeQaQSMv3zEr8JFQFGeusX5a1qViXY6zK0KgoY8ysByA3133lcaWY33HU5PCuHTIS0mWz7WUngxBo8HaVk9uVlegRqtTpsCw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7db06f-0763-4567-0b62-08d83861fa04
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 10:34:33.2336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiAFMTr5v4tX7Jp9hsCoxq5LXRX0y4TPLlhp9sF1Fb2jL1Qi5oc4QgKAYajKt/Cz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDguMjAgdW0gMDQ6NTUgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhlIHBhdHRlcm4gd2FzIHJlcGVhdGVkIGEg
ZmV3IHRpbWVzLCBqdXN0IG1ha2UgYW4gaW5saW5lIGZvciBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6
IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMgICAgfCAgOCArKy0tLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fdm0uYyB8ICA0ICstLS0KPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVy
LmggfCAxMSArKysrKysrKy0tLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
LCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IGluZGV4IDcyMWZmNTQ2YmY0
Ny4uMmI0OTAzNzIzMWViIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gQEAgLTExMDMsOSArMTEw
Myw3IEBAIGludCB0dG1fYm9fbWVtX3NwYWNlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
Cj4gICAKPiAgIGVycm9yOgo+ICAgCWlmIChiby0+bWVtLm1lbV90eXBlID09IFRUTV9QTF9TWVNU
RU0gJiYgIWxpc3RfZW1wdHkoJmJvLT5scnUpKSB7Cj4gLQkJc3Bpbl9sb2NrKCZ0dG1fYm9fZ2xv
Yi5scnVfbG9jayk7Cj4gLQkJdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWwoYm8sIE5VTEwpOwo+IC0J
CXNwaW5fdW5sb2NrKCZ0dG1fYm9fZ2xvYi5scnVfbG9jayk7Cj4gKwkJdHRtX2JvX21vdmVfdG9f
bHJ1X3RhaWxfdW5sb2NrZWQoYm8pOwo+ICAgCX0KPiAgIAo+ICAgCXJldHVybiByZXQ7Cj4gQEAg
LTEzMjAsOSArMTMxOCw3IEBAIGludCB0dG1fYm9faW5pdF9yZXNlcnZlZChzdHJ1Y3QgdHRtX2Jv
X2RldmljZSAqYmRldiwKPiAgIAkJcmV0dXJuIHJldDsKPiAgIAl9Cj4gICAKPiAtCXNwaW5fbG9j
aygmdHRtX2JvX2dsb2IubHJ1X2xvY2spOwo+IC0JdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWwoYm8s
IE5VTEwpOwo+IC0Jc3Bpbl91bmxvY2soJnR0bV9ib19nbG9iLmxydV9sb2NrKTsKPiArCXR0bV9i
b19tb3ZlX3RvX2xydV90YWlsX3VubG9ja2VkKGJvKTsKPiAgIAo+ICAgCXJldHVybiByZXQ7Cj4g
ICB9Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCj4gaW5kZXggZDdhNjUzN2RkNmVlLi40NjhhMGVi
OWU2MzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPiBAQCAtMzA4LDkgKzMwOCw3IEBA
IHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHN0cnVjdCB2bV9mYXVsdCAqdm1m
LAo+ICAgCQl9Cj4gICAKPiAgIAkJaWYgKGJvLT5tb3ZpbmcgIT0gbW92aW5nKSB7Cj4gLQkJCXNw
aW5fbG9jaygmdHRtX2JvX2dsb2IubHJ1X2xvY2spOwo+IC0JCQl0dG1fYm9fbW92ZV90b19scnVf
dGFpbChibywgTlVMTCk7Cj4gLQkJCXNwaW5fdW5sb2NrKCZ0dG1fYm9fZ2xvYi5scnVfbG9jayk7
Cj4gKwkJCXR0bV9ib19tb3ZlX3RvX2xydV90YWlsX3VubG9ja2VkKGJvKTsKPiAgIAkJfQo+ICAg
CQlkbWFfZmVuY2VfcHV0KG1vdmluZyk7Cj4gICAJfQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS90dG0vdHRtX2JvX2RyaXZlci5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+
IGluZGV4IGMyMGZlZjRkYTFkMy4uNzk1OGU0MTEyNjlhIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
ZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiArKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2Ry
aXZlci5oCj4gQEAgLTY1OCw2ICs2NTgsMTMgQEAgc3RhdGljIGlubGluZSBpbnQgdHRtX2JvX3Jl
c2VydmVfc2xvd3BhdGgoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIAlyZXR1cm4g
MDsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW5saW5lIHZvaWQgdHRtX2JvX21vdmVfdG9fbHJ1X3Rh
aWxfdW5sb2NrZWQoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiArewo+ICsJc3Bpbl9s
b2NrKCZ0dG1fYm9fZ2xvYi5scnVfbG9jayk7Cj4gKwl0dG1fYm9fbW92ZV90b19scnVfdGFpbChi
bywgTlVMTCk7Cj4gKwlzcGluX3VubG9jaygmdHRtX2JvX2dsb2IubHJ1X2xvY2spOwo+ICt9Cj4g
Kwo+ICAgLyoqCj4gICAgKiB0dG1fYm9fdW5yZXNlcnZlCj4gICAgKgo+IEBAIC02NjcsOSArNjc0
LDcgQEAgc3RhdGljIGlubGluZSBpbnQgdHRtX2JvX3Jlc2VydmVfc2xvd3BhdGgoc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKPiAgICAqLwo+ICAgc3RhdGljIGlubGluZSB2b2lkIHR0bV9i
b191bnJlc2VydmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiAgIHsKPiAtCXNwaW5f
bG9jaygmdHRtX2JvX2dsb2IubHJ1X2xvY2spOwo+IC0JdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWwo
Ym8sIE5VTEwpOwo+IC0Jc3Bpbl91bmxvY2soJnR0bV9ib19nbG9iLmxydV9sb2NrKTsKPiArCXR0
bV9ib19tb3ZlX3RvX2xydV90YWlsX3VubG9ja2VkKGJvKTsKPiAgIAlkbWFfcmVzdl91bmxvY2so
Ym8tPmJhc2UucmVzdik7Cj4gICB9Cj4gICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
