Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 895B0292513
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 11:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44E86E900;
	Mon, 19 Oct 2020 09:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770057.outbound.protection.outlook.com [40.107.77.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D18E6E900
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 09:58:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQJIDKLrfe1mKNSfP2wt9DAJMVqNJz4OSNX5+IaZRtBGcxir5K4yPPI6kUr+ODtuy2IFDaojY5dmw7dMTqDpW1Pw3DLnNaLtfShJCv7uMD0QzsFtfWlUS51B1msi+lIPmoAKAsuFcvUh2L/Xgs/Si0Vfnc9JekyhyDbsvPA8dphHy3i25vygscUGJXHF0bJc/Ddd0nLpH/SteBazMPLXCiA0tyec45NcONTyXd5rl9bf80JR8TQ4uXe4neoIyrlB9ppLH4t1R0jq4lYA8p2wsdM451A8W4THcE8aMiY0TFkd3av2p3055+16RrZ0gPMIYPF6+EqiHvhmMybB6CMwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgtrXoTVOhWF1i+0kbOKW0XqAvqAg7DG3bLROYlXhBQ=;
 b=YOaHgfwIrOlYFxYk8LAXbNQS1SslSJPMI4rYPXW/yjNHjBtVJXkKKZPxRHAd0pa2+qjulWn1srpXAF49f1gvT6kqeTD1lt0nuoXZTajTqrG+gknwmEzITKbA3YWfpt0qQVf3PXzONzoN/S8XjMEBNr732/qtjW+SWdQ7alO5MehUxPFEVGszMRCGGN63jpCy5P/83eDxmeclThE2kkEEpSF/2H1Zr+fdO9U5Kz+Ey8Uwq7SwVviycQz0sZgXTxKa+oxOwrNfQqumbu5m5YtJG01iNbfg6fhbuxil/VFu2t4KqTr2WgeP1Urw2XTyOauGuakml95BgT6Zidcrmgx/Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgtrXoTVOhWF1i+0kbOKW0XqAvqAg7DG3bLROYlXhBQ=;
 b=B59DQmQG7MsvMtzDn6uhRD5VRFM6Q6pTSA1dPmBuFKrV1ohz3vLEwwgNBhdVxxMQXQ42hivxpu61GptPss7yzU8RuYyN6YfzgEf5KDwzmCkF2aLGxQpkcZHTkWyOpNFW1Bom0i8d7uVfICEB5FZGbWOR90zqsfWVUsb1PxTW4Rg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Mon, 19 Oct
 2020 09:58:45 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 09:58:45 +0000
Subject: Re: [PATCH 3/5] drm/ttm: use new move interface for known system->ttm
 moves
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201019071314.1671485-1-airlied@gmail.com>
 <20201019071314.1671485-4-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <56b0352e-b884-8b87-500c-c1e24081f10b@amd.com>
Date: Mon, 19 Oct 2020 11:58:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201019071314.1671485-4-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.11 via Frontend Transport; Mon, 19 Oct 2020 09:58:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ee30b976-f594-4b76-a7a6-08d874159121
X-MS-TrafficTypeDiagnostic: MN2PR12MB4061:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4061409A1F21ECC8400BBBDE831E0@MN2PR12MB4061.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XatFsk+psrGgWRMBBejhsBCtn1+JB4u4wXOIkR9fMHcBR7g8usvV9PC5o0FI73f9Ez8rGEly/wzk7UXoCzQktj1eHfBqhIqqZASqr/w4tQarn6OUF/GSqJDyYPA05y7HaDLyXUelNglyhFFA7K9oYRE1IS78JPjVNs7+iWIa3foG/ti/uZJZPk3sEGsXhrrRcpzyknRaLN9JZ+4umXkCSl7B32AVn0JzyF5jtLpF086/CcExSNfdq3mWBZUQyWE9eOxdu3OSrBwjTtsg9a4h6cJUKKJ+Fe3Wn8/jP+zlm5TD+MdDQ5gXRJz1dD8ZzSYF5buG23ZifqZqgGBsvxlKZh9lMPTtQNeFjlx//6Nzb+4snqt2dzxr3fBXv3A80DPg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(8936002)(83380400001)(2906002)(52116002)(8676002)(5660300002)(316002)(31686004)(4326008)(66476007)(66556008)(36756003)(31696002)(66946007)(86362001)(478600001)(6486002)(16526019)(2616005)(186003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: M//BChQ+zWk7U7rYNpe1ABPxc6DZO4UZngNJe32H2S4DZMMb1RS6huX1GJyAtm+rQdEmP+nkwCkBNS0vkqNdt6axgtDQQoXfMiTvAQYV0l+XQ0+7yANxgFAiQuApjpZ7NGwXW0L6L0Iod6u3+S283qyEW2JzGvm3yRxJ0foJ1PZ4DPXcwc87sooY+TYdbF4yNbKu03AutijoxKHFHCUM4KGUvNx5g8TwbMhdu7FeOQ0yFIl2ujLywd16yRbtLQjWa3FRBBH4Yfa5Ohut2XsHhsAAYBtORXsf4dOwADW1DWPECV3x8zH9hUORxqw449/ndVY9epBwEexolI+SNtQ3W1aHIHvijMc19HoiQWRy0eJi4QY+1rUGJuwJp947O68pbIbAAoFlECvJ+EqXVDe4Ljd1Owmdfkej+BYGBthopomam2AFtIxwj27K2SNQpZzbhOGpCl2RIc7ReE6I/Ukzye9YVm6DdbgNA616Z5ne6n1PvoyVHeoctpiLlWY4RwIwxgmOuzQwyL6iLMd5G8CgHrslS6ceAejmp8HKHWJWdj2ypzWVxQPBYdUWWFkKfiEyHYqV8wVQfsKZHYG6FeV6OrtpvGnUiDIaTXef95JErrKoCJMv5leTyNWyxlvjARTtHg/arvsnudoqZ70/0yUgoH6aFQj8FGeF/Xm7DE+Y7oUDbsYNJlEJHEB0X41vMD2/Rev+I5LsVBmDvYY09t776w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee30b976-f594-4b76-a7a6-08d874159121
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 09:58:45.3460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CG2qSHBzfRsA1THS+bpnkYi/vUVOPEHUe9zZx3XTj7FLIojGGo3xBsn4jrFEKQh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061
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
Cc: rscheidegger.oss@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTkuMTAuMjAgdW0gMDk6MTMgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gSW4gYWxsIDMgZHJpdmVycyB0aGVyZSBpcyBh
IGNhc2Ugd2hlcmUgdGhlIGRyaXZlciBrbm93cyB0aGUKPiBibyBpcyBpbiBTWVNURU0gc28gZG9u
J3QgY2FsbCB0aGUgYXBpIHRoYXQgY2hlY2tzIHRoYXQuCj4KPiBSZXZpZXdlZC1ieTogQmVuIFNr
ZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxh
aXJsaWVkQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYyB8IDQgKystLQo+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9iby5jICAgIHwgMyArKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5j
ICAgICB8IDMgKystCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgICAgICAg
fCAxICsKPiAgIDQgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IGluZGV4IDhjZGVj
NThiOTEwNi4uZjhjOWQ2NmQzZWY3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYwo+IEBAIC02MDEsMTEgKzYwMSwxMSBAQCBzdGF0aWMgaW50IGFtZGdwdV9tb3Zl
X3JhbV92cmFtKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wgZXZpY3QsCj4gICAJ
fQo+ICAgCj4gICAJLyogbW92ZS9iaW5kIG9sZCBtZW1vcnkgdG8gR1RUIHNwYWNlICovCj4gLQly
ID0gdHRtX2JvX21vdmVfdHRtKGJvLCBjdHgsICZ0bXBfbWVtKTsKPiArCXIgPSB0dG1fYm9fbW92
ZV90b19uZXdfdHRfbWVtKGJvLCBjdHgsICZ0bXBfbWVtKTsKPiAgIAlpZiAodW5saWtlbHkocikp
IHsKPiAgIAkJZ290byBvdXRfY2xlYW51cDsKPiAgIAl9Cj4gLQo+ICsJdHRtX2JvX2Fzc2lnbl9t
ZW0oYm8sICZ0bXBfbWVtKTsKPiAgIAkvKiBjb3B5IHRvIFZSQU0gKi8KPiAgIAlyID0gYW1kZ3B1
X21vdmVfYmxpdChibywgZXZpY3QsIG5ld19tZW0sIG9sZF9tZW0pOwo+ICAgCWlmICh1bmxpa2Vs
eShyKSkgewo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Jv
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBpbmRleCA0Y2NiMzMy
OTAxNGIuLjYzYmFhOTM2Nzg1MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2JvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Jv
LmMKPiBAQCAtOTI3LDEwICs5MjcsMTEgQEAgbm91dmVhdV9ib19tb3ZlX2ZsaXBzKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wgZXZpY3QsCj4gICAJaWYgKHJldCkKPiAgIAkJcmV0
dXJuIHJldDsKPiAgIAo+IC0JcmV0ID0gdHRtX2JvX21vdmVfdHRtKGJvLCBjdHgsICZ0bXBfcmVn
KTsKPiArCXJldCA9IHR0bV9ib19tb3ZlX3RvX25ld190dF9tZW0oYm8sIGN0eCwgJnRtcF9yZWcp
Owo+ICAgCWlmIChyZXQpCj4gICAJCWdvdG8gb3V0Owo+ICAgCj4gKwl0dG1fYm9fYXNzaWduX21l
bShibywgJnRtcF9yZWcpOwo+ICAgCXJldCA9IG5vdXZlYXVfYm9fbW92ZV9tMm1mKGJvLCB0cnVl
LCBjdHgsIG5ld19yZWcpOwo+ICAgCWlmIChyZXQpCj4gICAJCWdvdG8gb3V0Owo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX3R0bS5jCj4gaW5kZXggZDZmNDJmYmM4MWY0Li45NDM3ZDI5MjQ4ZmQg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+IEBAIC0yNzUsMTAgKzI3NSwx
MSBAQCBzdGF0aWMgaW50IHJhZGVvbl9tb3ZlX3JhbV92cmFtKHN0cnVjdCB0dG1fYnVmZmVyX29i
amVjdCAqYm8sCj4gICAJaWYgKHVubGlrZWx5KHIpKSB7Cj4gICAJCXJldHVybiByOwo+ICAgCX0K
PiAtCXIgPSB0dG1fYm9fbW92ZV90dG0oYm8sIGN0eCwgJnRtcF9tZW0pOwo+ICsJciA9IHR0bV9i
b19tb3ZlX3RvX25ld190dF9tZW0oYm8sIGN0eCwgJnRtcF9tZW0pOwo+ICAgCWlmICh1bmxpa2Vs
eShyKSkgewo+ICAgCQlnb3RvIG91dF9jbGVhbnVwOwo+ICAgCX0KPiArCXR0bV9ib19hc3NpZ25f
bWVtKGJvLCAmdG1wX21lbSk7Cj4gICAJciA9IHJhZGVvbl9tb3ZlX2JsaXQoYm8sIHRydWUsIG5l
d19tZW0sIG9sZF9tZW0pOwo+ICAgCWlmICh1bmxpa2VseShyKSkgewo+ICAgCQlnb3RvIG91dF9j
bGVhbnVwOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiBpbmRleCAyOTcyNjY1MmZlZjcu
LjM5ZTAzZDk5YTM3NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191
dGlsLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiBAQCAtNjQs
NiArNjQsNyBAQCBpbnQgdHRtX2JvX21vdmVfdG9fbmV3X3R0X21lbShzdHJ1Y3QgdHRtX2J1ZmZl
cl9vYmplY3QgKmJvLAo+ICAgCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gK0VYUE9SVF9TWU1CT0wo
dHRtX2JvX21vdmVfdG9fbmV3X3R0X21lbSk7Cj4gICAKPiAgIHN0YXRpYyBpbnQgdHRtX2JvX21v
dmVfb2xkX3RvX3N5c3RlbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQkJCSAg
ICAgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgpCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
