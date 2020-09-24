Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC502770C1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 14:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F26D6EAC6;
	Thu, 24 Sep 2020 12:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50F36EAC4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 12:18:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vko0Xi66d+fPZ521QBSXys8/3h0d0bWRSJEgRG5ZH6Et5VBsfw+oOqJoa4kU5XJtdxATHwOOzXCbc6Z+lHn12mIiEw3SOa1pbF+hnSDZGG0bk/hfz3tkBLpbrx56KR6L3SzLChTnbcXVwY9moARQ48lrnPWT1US2fQGvKxaom7vSYPJorm4D0nOaX2cdL7l7YdwBMhgE6XfQjzTRcMYpXY2uo1GDCJxjxrluMa6EpTfV8fdchekX7YDTehTX++/he7gtj+ZSfNouLQ6R4MddU37oFIeA1lClhR47RskDofjT2w7ObfBsBPjEfEmaLq1sX45T643+Mg2LZlafGG8pag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDhwHCGvbCIwJUd5HxwVpgihn1V45/lQHr1lrp9deEA=;
 b=ZCux+1XenuTPo9Bll8p2cGBDomKHZga+SvaVNAhldW7DpOC1Hvlcf7dI5Q0mVZx25+xWnS6+HutA4aGnwstvoBISkReJDeYCQ8Bk6VroO17QXvxiZS0cY5br//5wDM17y6Q66XdEcElvGP5o/vJzRHf9t4wCovKlc8n8Yg4tKQ+CHxj/ObSk1yN7uCRE8+n+m4yYI369M4PuYPNMbpK/O9sMQnY/zHgAcDvV1VTGcunbGjEDL8yAlefEnIy3TZ0iRMKSYD7SVWPLuVJ8tmip8i84jGuGz1sxgzlFTzlFFj1Q20hJrL+Ced3MBtrfpWUZxUkfeYiUpSIIsSTTDJW1LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDhwHCGvbCIwJUd5HxwVpgihn1V45/lQHr1lrp9deEA=;
 b=B1aQUWiEGm5qpF2jDDA27EPAPJvAKX2XFlZ8X95gzgV6WZA89+j7OHsPnFJbv4r/i9+9J2eVw/76eUn1HEbXNqxc8SZnVMmjtHZvO+J56L82/hiJGEq4Y7IdlnPJtLOX+TTS2gWddbfSch22n+qck8zduZm4KVcMJqUDvbj8QG0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Thu, 24 Sep
 2020 12:18:10 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 12:18:10 +0000
Subject: Re: [PATCH 15/45] drm/ttm: push copy unbind into drivers.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-16-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <42ff7691-a5f4-94e6-e559-70906fc83f27@amd.com>
Date: Thu, 24 Sep 2020 14:17:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-16-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0701CA0032.eurprd07.prod.outlook.com
 (2603:10a6:200:42::42) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0701CA0032.eurprd07.prod.outlook.com (2603:10a6:200:42::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.16 via Frontend
 Transport; Thu, 24 Sep 2020 12:18:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 48236f5e-2150-4604-bc07-08d86083e65d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4094:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4094FE60AEEE505C645E3EBF83390@MN2PR12MB4094.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z8E/2NlLcg1qE0U/43rdorNzZ3jzEtPJuu+YbyaeUaBt7ZruMkCBmgAhmhta/QsWXkXFZe9lotl7MqVK/Jj0JOn932cwtv8Q/7a2Ji2v8C6EmQyokVGTADAwxBTLQxJyrg5l5c3cXk1i/jfMHKuy15LB19dxweVayA9bGC7RJ5ta9fDFXPNORkZnBewe+EBiNophg/EAO7U+FR5XTwDhtUoeMkwLtouPSuDbhu0LVprwKdYm5/YBkIqkXYcH/HJC/QuuNlCfiNuwufakZrKJjMZ7qurafi/O99T9+/VWFWoPT/2chXUuOCyn5jCPWNipD0KpxUiKjNLvnJsxBV7e1sBpZeI9ja+/At7xFsMzvuHmQImdRgJrlWiSGWiWAUUucquaHlA6ss6LlBMDaPAH9j4y0Lgu8hP7enaIQwoiG/GpF0sDqeR71brlSv2vO7gu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(2616005)(6666004)(36756003)(31686004)(6486002)(186003)(2906002)(16526019)(4326008)(52116002)(66556008)(86362001)(316002)(83380400001)(66476007)(31696002)(478600001)(66946007)(8676002)(5660300002)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4WjTX5//AJveE7ZRNGBi5OkizdCSrkli/J8iF1xIcu65ArxIulxfnn0EE4MBv5l/wP3taUcxGXkg1j4/yihuPdJjkxrpjMuFb0MEfLehE5a5tfCqsZ18wMJRmPGAJxGqdbhsIMafhKVMnxbMiU4XsgLrslCDaJiLl08jU6cGewzXsd/YxIo457WqNzyGsYqEwQq4kAkZRrGQzt5DGtO+s2zdceV9eqBLilfWB62JU7PDR11FS6fEzm9Xe4boTPmavQgnSYKFJCV9YIwqfQITq8iCMSPQsvnUpLU9lkX6fYYAij/M+TM8EP2uIi/5h59cHBekQE2OIAWdL4XbuhP+SOoI3scayPfqlY2J6qT78563qWXX+02QC17UZ4vSQ430nxHvqj2cvrsJv0Tk6A0zzgQKqz9XsVHOYz52yr2eG+m0O8ZBjRCE7//qKTsH/vTH/KS+fnrPrRWUPQZOvwrYBefz8Vf0XAv7TeXlcJhGcz59mp8A7+4YJxeQ1NJFzogTAlsbY6s0OYFCpBZLnifv7d/zqlcYq6FTmVu5xsiBXwUWI7pyfQPjT1J+5q01KnpV0zsYpdvObKUBwZs/nwjeB1e//QysMR28vYLEpexIGT1l6/q4ClEjE1judbOqjAii1Qr08NY4yuiuIOtXciwh2c5gNrXb657sbq1+NDNejY9yHjCnxE7H8kxqe6/X8DvCITO2Ms9nJB94wH9uDFVqBA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48236f5e-2150-4604-bc07-08d86083e65d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 12:18:09.9467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAreOS7687BqJkzWf/42dx5NAu/dRQRsOl13qCHVaGglEhyg6DN2rtL4ZpDykCrX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094
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
Cc: bskeggs@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDkuMjAgdW0gMDc6MTggc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyB1bmlubGluZXMgdHRtX2JvX21vdmVf
b2xkX3RvX3N5c3RlbSBpbnRvIDMgcGxhY2VzCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxp
ZSA8YWlybGllZEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdHRtLmMgfCA3ICsrKysrKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfYm8uYyAgICB8IDcgKysrKystLQo+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fdHRtLmMgICAgIHwgNyArKysrKystCj4gICAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3R0bS5jCj4gaW5kZXggZTIwY2UzODBmNjI3Li5kMTY1ZWRhY2MzNDcgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gQEAgLTY2LDYgKzY2LDggQEAKPiAg
IHN0YXRpYyBpbnQgYW1kZ3B1X3R0bV9iYWNrZW5kX2JpbmQoc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYsCj4gICAJCQkJICAgc3RydWN0IHR0bV90dCAqdHRtLAo+ICAgCQkJCSAgIHN0cnVjdCB0
dG1fcmVzb3VyY2UgKmJvX21lbSk7Cj4gK3N0YXRpYyB2b2lkIGFtZGdwdV90dG1fYmFja2VuZF91
bmJpbmQoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4gKwkJCQkgICAgICBzdHJ1Y3QgdHRt
X3R0ICp0dG0pOwo+ICAgCj4gICBzdGF0aWMgaW50IGFtZGdwdV90dG1faW5pdF9vbl9jaGlwKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgCQkJCSAgICB1bnNpZ25lZCBpbnQgdHlwZSwK
PiBAQCAtNTY4LDEwICs1NzAsMTMgQEAgc3RhdGljIGludCBhbWRncHVfbW92ZV92cmFtX3JhbShz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29sIGV2aWN0LAo+ICAgCX0KPiAgIAo+ICAg
CS8qIG1vdmUgQk8gKGluIHRtcF9tZW0pIHRvIG5ld19tZW0gKi8KPiAtCXIgPSB0dG1fYm9fbW92
ZV9vbGRfdG9fc3lzdGVtKGJvLCBjdHgpOwo+ICsJciA9IHR0bV9ib193YWl0X2N0eChibywgY3R4
KTsKPiAgIAlpZiAodW5saWtlbHkocikpCj4gICAJCWdvdG8gb3V0X2NsZWFudXA7Cj4gICAKPiAr
CWFtZGdwdV90dG1fYmFja2VuZF91bmJpbmQoYm8tPmJkZXYsIGJvLT50dG0pOwo+ICsJdHRtX3Jl
c291cmNlX2ZyZWUoYm8sICZiby0+bWVtKTsKPiArCj4gICAJciA9IHR0bV90dF9zZXRfcGxhY2Vt
ZW50X2NhY2hpbmcoYm8tPnR0bSwgbmV3X21lbS0+cGxhY2VtZW50KTsKPiAgIAlpZiAodW5saWtl
bHkocikpCj4gICAJCWdvdG8gb3V0X2NsZWFudXA7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfYm8uYwo+IGluZGV4IGE5NWQyMDhjNzZhMS4uMWU2YzI1NjFkNjkyIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+IEBAIC00Niw3ICs0Niw3IEBACj4gICAKPiAgIHN0
YXRpYyBpbnQgbm91dmVhdV90dG1fdHRfYmluZChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwg
c3RydWN0IHR0bV90dCAqdHRtLAo+ICAgCQkJICAgICAgIHN0cnVjdCB0dG1fcmVzb3VyY2UgKnJl
Zyk7Cj4gLQo+ICtzdGF0aWMgdm9pZCBub3V2ZWF1X3R0bV90dF91bmJpbmQoc3RydWN0IHR0bV9i
b19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fdHQgKnR0bSk7Cj4gICAvKgo+ICAgICogTlYxMC1O
VjQwIHRpbGluZyBoZWxwZXJzCj4gICAgKi8KPiBAQCAtOTE1LDEwICs5MTUsMTMgQEAgbm91dmVh
dV9ib19tb3ZlX2ZsaXBkKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wgZXZpY3Qs
Cj4gICAJaWYgKHJldCkKPiAgIAkJZ290byBvdXQ7Cj4gICAKPiAtCXJldCA9IHR0bV9ib19tb3Zl
X29sZF90b19zeXN0ZW0oYm8sIGN0eCk7Cj4gKwlyZXQgPSB0dG1fYm9fd2FpdF9jdHgoYm8sIGN0
eCk7Cj4gICAJaWYgKHJldCkKPiAgIAkJZ290byBvdXQ7Cj4gICAKPiArCW5vdXZlYXVfdHRtX3R0
X3VuYmluZChiby0+YmRldiwgYm8tPnR0bSk7Cj4gKwl0dG1fcmVzb3VyY2VfZnJlZShibywgJmJv
LT5tZW0pOwo+ICsKPiAgIAlyZXQgPSB0dG1fdHRfc2V0X3BsYWNlbWVudF9jYWNoaW5nKGJvLT50
dG0sIG5ld19yZWctPnBsYWNlbWVudCk7Cj4gICAJaWYgKHJldCkKPiAgIAkJZ290byBvdXQ7Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiBpbmRleCA4OTQ1NWYyZDNiYjYuLjEwZDI1
ZDNiODNmMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0u
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCj4gQEAgLTU5LDYg
KzU5LDggQEAgc3RhdGljIHZvaWQgcmFkZW9uX3R0bV9kZWJ1Z2ZzX2Zpbmkoc3RydWN0IHJhZGVv
bl9kZXZpY2UgKnJkZXYpOwo+ICAgc3RhdGljIGludCByYWRlb25fdHRtX3R0X2JpbmQoc3RydWN0
IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4gICAJCQkgICAgICBzdHJ1Y3QgdHRtX3R0ICp0dG0sCj4g
ICAJCQkgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlICpib19tZW0pOwo+ICtzdGF0aWMgdm9pZCBy
YWRlb25fdHRtX3R0X3VuYmluZChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiArCQkJCSBz
dHJ1Y3QgdHRtX3R0ICp0dG0pOwo+ICAgCj4gICBzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmFkZW9u
X2dldF9yZGV2KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2KQo+ICAgewo+IEBAIC0yNDksMTAg
KzI1MSwxMyBAQCBzdGF0aWMgaW50IHJhZGVvbl9tb3ZlX3ZyYW1fcmFtKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sCj4gICAJaWYgKHVubGlrZWx5KHIpKSB7Cj4gICAJCWdvdG8gb3V0X2Ns
ZWFudXA7Cj4gICAJfQo+IC0JciA9IHR0bV9ib19tb3ZlX29sZF90b19zeXN0ZW0oYm8sIGN0eCk7
Cj4gKwlyID0gdHRtX2JvX3dhaXRfY3R4KGJvLCBjdHgpOwo+ICAgCWlmICh1bmxpa2VseShyKSkK
PiAgIAkJZ290byBvdXRfY2xlYW51cDsKPiAgIAo+ICsJcmFkZW9uX3R0bV90dF91bmJpbmQoYm8t
PmJkZXYsIGJvLT50dG0pOwo+ICsJdHRtX3Jlc291cmNlX2ZyZWUoYm8sICZiby0+bWVtKTsKPiAr
Cj4gICAJciA9IHR0bV90dF9zZXRfcGxhY2VtZW50X2NhY2hpbmcoYm8tPnR0bSwgbmV3X21lbS0+
cGxhY2VtZW50KTsKPiAgIAlpZiAodW5saWtlbHkocikpCj4gICAJCWdvdG8gb3V0X2NsZWFudXA7
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
