Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B9A234654
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 14:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F5C6EA81;
	Fri, 31 Jul 2020 12:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81EA6EA81
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 12:58:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZH9SVNwdY0eHGjkawNgtHwDrqfky77sWd1e2tSry5Dc10s3fSVTDPJ72LqilMYELby8gAaW7EZLdzXmaWakt5df78j7o6a2JQHqKlDVbO4SfWZWuzATsQBfiuyoz4ze09UR9wzyIAu6rQ/FLvCP8J0SG0LSmBrACUbfAm1PjBw8x4iqc6j+ooNlCzoWpyNhRWbf9EXZ/aO28beSib8JAnzMmCVK+yh0cquEwuoW9E9BRnwCNhFE7fIQOQuRydUpfIB88ToCjh0yAtHMGp1aZgsXINOethFbjUKCSp5xxnyt+NrjFs4wn2x/72troHi/EY1TITnFtvSIaEoTTKRkqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQqm/VpiaMTBgKrr2NMwTcrwi9kPDIGp9OzKH+H6OTo=;
 b=Yq34udm2ScXKvmo66ErhYiU6xOyG9K5ahn8CuCfBlPpXQUYBkreMPEZydIR2MB8lZRr4LxNVY1845QweR9Bf0ln6ZymfU8y0BXFS/wQbzn98HfMwPRmJ9yjgcQvCT9ybPo57yRAL3WPhNFXw0CUZCSvBfFGuY0jgtCnvsulJ2kL2twvVTUIX8qI8m0LOKQYEizOjxmF4SmkXy/fLn5+uKwXYrdo316+bFyjJqHtCqh33Ih/rc2Feez8nZSR7Dr7DMTYVyGIjAjsBIjBSgBgO32Z3GBylVrBMw9DF0zygvRguovtw0iNW1XydOom9E+QiKa+dJoJNHkX8Ynhf+c1phw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQqm/VpiaMTBgKrr2NMwTcrwi9kPDIGp9OzKH+H6OTo=;
 b=N72WuzElQX4DomvV1f2nQY1QSzlErDxe/++BCkse9XlG6VwQ4QWJveFWtKUQfA8rkAqW/thk1+qRqg3lIaiBGR3UbXe/G7oqk/FoHhemOknoq2vha4QMNPeYrgJxbfXRuB51ABo4ij/eiyjOH/Dsych1HFUp3GA+MeWc1itryks=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Fri, 31 Jul
 2020 12:58:01 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 12:58:00 +0000
Subject: Re: [PATCH 12/49] drm/ttm: convert system manager init to new code.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-13-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3044391e-06ea-458e-48e3-edb18e13f4cb@amd.com>
Date: Fri, 31 Jul 2020 14:57:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-13-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0004.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0004.eurprd02.prod.outlook.com (2603:10a6:208:3e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.16 via Frontend Transport; Fri, 31 Jul 2020 12:57:59 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4bf39d59-b09c-400e-1f4b-08d835515a6e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4390034087A4431C0CB5BC7B834E0@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BHhCVuWjkBET6VhmFjQSQ4pYH4jEiki95N3yznIAUrmZsTcVcjcc+7dvbGlTAbzLH3QQParVqTWpZMahCTajjwcTBll/kzNtguqQWTsR8p0vZvGJTWpHRw4C7Y7RSRgDL92H+dSyCSexrVhcS+iSmj2GHxfElExLCPn6HS/L3Et/NdoZ2srUHs8vGO5TpmbVwmpymUz1xC34hM4qkhh3QSH29rWASTpdgBNrli06bATCaD13xe8BE4RPbxYDvZM4RvJZIW8GT5PB0fwvT0XHsJc0b8yaBIKGNWSboiPWqZkuX6q0JR5Cx4q5vpDtX4Rvh3dqJJULFFmOa7ZcEgXwZyBY4RAHLXiuzToS0uOLiUh7cMNxRUQh1DNawscApqvc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(6486002)(52116002)(2616005)(66476007)(316002)(4326008)(478600001)(66946007)(36756003)(86362001)(66556008)(16526019)(186003)(31696002)(5660300002)(83380400001)(8936002)(2906002)(8676002)(6666004)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: bxjjDcnDTJ/qi+tmp+LdJL3MJvF0hqUWnnlpaoM+bfV5mjBtgVQj38rX6Aw6wjZMN+NWJXOXUllv5LqTvhNAVSA4DBcu9EKEf+83FDqstfVGP1fdIR8MzrAJrbiXI8aSPcPwnF++3rDrsJg2ZeAQukvIAgCBWjXtMhATNLy69dXa+NnfrZ/bxGP8bLpQm0p5AynFgLue0aztF0wlvbLALM0qKHFgyaXmHqz1rGFDUV3qvUCLO+yHr/tkDV/ul3714xNboTcd+r/BwqyJXb1Tf3CzU9wLBvBPrDeNby/Fqbv6wSJ4bJ6ysozvNo7Y0DERj1jrNtHoGwcsEl1zNIKWK8rg7Vxjt2YMq8EBoeilWxu4fZtg2RXzk37YCinlAQhHLavFc5RZZwcxYA2rhcsfl5i6uME5g6zuc4DsZTKwhuVyX6876ZkXzkT09+EouvGv8iXL3Q8G2eOxrlkWH4LftbLOe3e/2FHXu5rXbqv/g+DjI0QNeJT8P8BoId7tZ55B1ZPCRe+O9B5cFgPt5k4L53refkgMAjvHdJyJ0aG+vdHzWDhwQmu0B8MOY3pqi9dl5Gk/CSsMByY+7DsFduNMpOy0B0Kj9/dvNVmm6a6xm5MS42hI7p9blKyHQnYxdHin22q1HP8XHtU8MCud1AQfZxPuhyZi8B28WZDl7O6YrwiQD0Y23g03pdSL1HEytkQvyZWHRptWOlF5IFvWxa1RbA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf39d59-b09c-400e-1f4b-08d835515a6e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 12:58:00.6640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezIyzCrSk6ZRh1d6TnNp+0fHl/5JBJNtbULFtFCaUz2OfQTWnEs2J0G9pkqTUvA1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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
Cc: sroland@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzEuMDcuMjAgdW0gMDY6MDQgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gUmVtb3ZlIHRoZSBleGl0IHBhdGgsIHNpbmNl
IHRoaXMgY2FuJ3QgZmFpbCBub3cuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWly
bGllZEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
IHwgMzAgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
MTcgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBp
bmRleCBhNjU4ZmQ1ODRjNmQuLjQ3NmU3NjhjNWJkMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+
IEBAIC0xNjQ0LDYgKzE2NDQsMjIgQEAgaW50IHR0bV9ib19kZXZpY2VfcmVsZWFzZShzdHJ1Y3Qg
dHRtX2JvX2RldmljZSAqYmRldikKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0wodHRtX2JvX2Rldmlj
ZV9yZWxlYXNlKTsKPiAgIAo+ICtzdGF0aWMgdm9pZCB0dG1fYm9faW5pdF9zeXNtYW4oc3RydWN0
IHR0bV9ib19kZXZpY2UgKmJkZXYpCj4gK3sKPiArCXN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdl
ciAqbWFuID0gJmJkZXYtPm1hbltUVE1fUExfU1lTVEVNXTsKPiArCj4gKwkvKgo+ICsJICogSW5p
dGlhbGl6ZSB0aGUgc3lzdGVtIG1lbW9yeSBidWZmZXIgdHlwZS4KPiArCSAqIE90aGVyIHR5cGVz
IG5lZWQgdG8gYmUgZHJpdmVyIC8gSU9DVEwgaW5pdGlhbGl6ZWQuCj4gKwkgKi8KPiArCW1hbi0+
dXNlX3R0ID0gdHJ1ZTsKPiArCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19D
QUNISU5HOwo+ICsJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7Cj4g
Kwo+ICsJdHRtX2JvX2luaXRfbW1fYmFzZShiZGV2LCBtYW4sIDApOwo+ICsJdHRtX2JvX3VzZV9t
bShtYW4pOwo+ICt9Cj4gKwo+ICAgaW50IHR0bV9ib19kZXZpY2VfaW5pdChzdHJ1Y3QgdHRtX2Jv
X2RldmljZSAqYmRldiwKPiAgIAkJICAgICAgIHN0cnVjdCB0dG1fYm9fZHJpdmVyICpkcml2ZXIs
Cj4gICAJCSAgICAgICBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiBAQCAtMTY2NCwx
NiArMTY4MCw3IEBAIGludCB0dG1fYm9fZGV2aWNlX2luaXQoc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYsCj4gICAKPiAgIAltZW1zZXQoYmRldi0+bWFuLCAwLCBzaXplb2YoYmRldi0+bWFuKSk7
Cj4gICAKPiAtCS8qCj4gLQkgKiBJbml0aWFsaXplIHRoZSBzeXN0ZW0gbWVtb3J5IGJ1ZmZlciB0
eXBlLgo+IC0JICogT3RoZXIgdHlwZXMgbmVlZCB0byBiZSBkcml2ZXIgLyBJT0NUTCBpbml0aWFs
aXplZC4KPiAtCSAqLwo+IC0JYmRldi0+bWFuW1RUTV9QTF9TWVNURU1dLnVzZV90dCA9IHRydWU7
Cj4gLQliZGV2LT5tYW5bVFRNX1BMX1NZU1RFTV0uYXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExf
TUFTS19DQUNISU5HOwo+IC0JYmRldi0+bWFuW1RUTV9QTF9TWVNURU1dLmRlZmF1bHRfY2FjaGlu
ZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsKPiAtCXJldCA9IHR0bV9ib19pbml0X21tKGJkZXYsIFRU
TV9QTF9TWVNURU0sIDApOwo+IC0JaWYgKHVubGlrZWx5KHJldCAhPSAwKSkKPiAtCQlnb3RvIG91
dF9ub19zeXM7Cj4gKwl0dG1fYm9faW5pdF9zeXNtYW4oYmRldik7Cj4gICAKPiAgIAliZGV2LT52
bWFfbWFuYWdlciA9IHZtYV9tYW5hZ2VyOwo+ICAgCUlOSVRfREVMQVlFRF9XT1JLKCZiZGV2LT53
cSwgdHRtX2JvX2RlbGF5ZWRfd29ya3F1ZXVlKTsKPiBAQCAtMTY4NSw5ICsxNjkyLDYgQEAgaW50
IHR0bV9ib19kZXZpY2VfaW5pdChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiAgIAltdXRl
eF91bmxvY2soJnR0bV9nbG9iYWxfbXV0ZXgpOwo+ICAgCj4gICAJcmV0dXJuIDA7Cj4gLW91dF9u
b19zeXM6Cj4gLQl0dG1fYm9fZ2xvYmFsX3JlbGVhc2UoKTsKPiAtCXJldHVybiByZXQ7Cj4gICB9
Cj4gICBFWFBPUlRfU1lNQk9MKHR0bV9ib19kZXZpY2VfaW5pdCk7Cj4gICAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
