Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7431C29250F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 11:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D536E8FE;
	Mon, 19 Oct 2020 09:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760083.outbound.protection.outlook.com [40.107.76.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0277B6E17E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 09:57:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipz2iTrLO63GcqYfLCDptWWXFLbUB+GrBhCGqesthYQNrF7k8EoNn7W3Lrv6WcHv7vkzFRFQbdLGqvqmJnIlwuEw5T7TcX3SbDCLuCwIPPME0gb5glc6uwQh7J/o3Tuccmr0GghutER2OJ6r++rP1NSSTJ6CwJm2ToIJVbWY59KLvPfagk6diMao8nxLbva11IUWRhg7JDaioxyUVB8O4UbbieEoB0Bdzpt44imew8Sl+P+OI8FiCLkTcnDhylNG/rLisY7lORPklH82koRhBSFprHQO6kHIpBa0InnHBd09pguWLjvaLLiexGNEwUEVOI0ZzUIp/kjC2dFRUtW9jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1pGk3l8bpsUyUvQL4TKkFD7lvCLEFLqbG3BEHQK8lY=;
 b=Hvh7rx2cHuOwGrrf+uP7syds13N9q5brHcYUeJGISFjpCdU6G1sBBRsLDxea85Ok+u1jDbSc22A1EMEDdPThG7yk2hv9wcnamj6NDITwB1aiTMp9/xljHeTaLBcmUuROQCRkt5OfHiBxsXp4LzXq6fE+zLp9QFzO0oaVcpgGXMN4D0RqVchMxtuMEJ/Cpj9qsv5H7+mGdPbvxPVFZtIrx+pMuVeCY9ovV9jFLZYGDMk09eWVTfO0zUQkd9GA6m42azvRvZ0OzjZACZMQRJGoPAWThSqvRhazm0QaidUlWEVzIZsOQ8U3CSSt8ze3RxlrqB6uJjDKk8id9BwsmYdfuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1pGk3l8bpsUyUvQL4TKkFD7lvCLEFLqbG3BEHQK8lY=;
 b=2GnLpGSto0IWxsxFT3oRU29IMAL7xCL8P2rRhIyuhlN1tviYv2+f/JaWs40cKauPHrT+3ATJtowQoU5LgJ8uHG7Nw2PrXodByPCkAb6Kx7xFIVk5PQHmZrW2wsynJfdQM1xtvktpKIy/9KGJCnN+M5uHW3VkwokZQ/De3VwmPE8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Mon, 19 Oct
 2020 09:57:49 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 09:57:49 +0000
Subject: Re: [PATCH 2/5] drm/ttm: split out the move to system from move ttm
 code
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201019071314.1671485-1-airlied@gmail.com>
 <20201019071314.1671485-3-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <37623345-9ad1-8bc7-9dd0-7c2de09dc3e3@amd.com>
Date: Mon, 19 Oct 2020 11:57:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201019071314.1671485-3-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.10 via Frontend Transport; Mon, 19 Oct 2020 09:57:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7b69186d-5c82-48ec-31c8-08d874156f9b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4061:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4061773BCCA13AF4DE470089831E0@MN2PR12MB4061.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i4c6rUiLdiqYhvsTr3SUunIEojKE18XarCbbpAEDgf+z1j6wzof0nPs9RuvxeCCGELwqqVj0tnq0Mgic0ptH4gDjBKfGYd6FUNIljX6LYG9k0b+pBCBQsxmUbHMSZ2pQ3NX6ojZMbrwHLraghtelMQRz49vwgeU6xX+L+5KEmBG93iUxOxrtHx1Y8tKVKZXuLaSySZ3QCTbFU+YY+CK3hvXDpMFd+yDiJUhUOOYMIhdfOpiR4HjBWlxHg/BTXyQPPI7OxqSjt820giJNLbltSXNPVA7vmv8je3qqzpaAu8KEjmi/bhleYGKi6JXV9KnYN6aawjTXG+aN1oa92Zy9tuuxVfGYZXy6wX6hlEWmhDmEzAuySF7z/gU4k083nnQN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(8936002)(83380400001)(2906002)(52116002)(8676002)(5660300002)(66574015)(316002)(6666004)(31686004)(4326008)(66476007)(66556008)(36756003)(31696002)(66946007)(86362001)(478600001)(6486002)(16526019)(2616005)(186003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: XxsALw9XXFzW7ey+OabBd/YVy8uyT/1A7W0hL2y9Pvg4E25MaVMc/tY17Rcky5DPXCTKY/RPFzZCRhccFBo+P95n5EYkXOHrzUbNKQcwWqSXF+yLwHVTolxBWLgiJ5J4w7hdbEDlkLsrr1pFP9gqPHov0HpldzflBs8D0Ic8bSpNSnKw/cdiD2gaan+Y2l/Yfgci2LtZlJa/P1ZF/CstpsTNebFlJ7pRfIDT3raLt0itczEjzNLOjB1VgIK5Uy+/nhXW6uYScN+gT54zimf9lQcYYcubQ9cE9QAwrSNaroHJG0ynQeJhMaADl/JeY5vIvnxkIsqgVQOPst9GHA0BwG9nJQpfjRbZwXcsb5mgvP6PkkpDu/8ohy0yHBns6xCVZOuIJE7p/vMwIYys7ISEdw+OEdTsMJFnzh3dLMFTHa4pdrRLg4tZCpdn3oGZ5sG/ZcPx0ZQbIPcjksGfNr7r1254DOI9w2xn3cz7pRsv+c8eaUnrx2QtyT9H+egNgHiAOLEtDZiSomjG8N/jgwRyPI4CTY20R4cShJg46/zEczDaxggQrprLAGFGPln7HM+L/hKiH4T+ma8HhEhA6oz9hBFXKvuir5CoYM7WVZYyiAKcI3AybFLpruVzLOq39n08MjKe9lDV3UxPM5F8ZhK6X1iUYZsKL4MQ0scjfWBchhyMmbGRXHpwJx6kRaGRYURJhBWFgFUrDsnhQ4zhoHxFdQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b69186d-5c82-48ec-31c8-08d874156f9b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 09:57:49.4318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fV6D6/0/s1Wkeobo+gbGy8YLmnfx53krpMvXymZ1LObcGAq1zEcz4D/u5lVQVxk
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
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IEJlbiBTa2VnZ3MgPGJz
a2VnZ3NAcmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEBy
ZWRoYXQuY29tPgoKTWF5YmUganVzdCBjYWxsIGl0IC4uLm1vdmVfdG9fc3lzdGVtKCksIGJ1dCBl
aXRoZXIgd2F5IFJldmlld2VkLWJ5OiAKQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyB8
IDM4ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191
dGlsLmMKPiBpbmRleCBhMzZjNjE1YmRmMjQuLjI5NzI2NjUyZmVmNyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9ib191dGlsLmMKPiBAQCAtNjUsNiArNjUsMjggQEAgaW50IHR0bV9ib19tb3ZlX3Rv
X25ld190dF9tZW0oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIAlyZXR1cm4gMDsK
PiAgIH0KPiAgIAo+ICtzdGF0aWMgaW50IHR0bV9ib19tb3ZlX29sZF90b19zeXN0ZW0oc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiArCQkJCSAgICAgc3RydWN0IHR0bV9vcGVyYXRpb25f
Y3R4ICpjdHgpCj4gK3sKPiArCXN0cnVjdCB0dG1fcmVzb3VyY2UgKm9sZF9tZW0gPSAmYm8tPm1l
bTsKPiArCWludCByZXQ7Cj4gKwo+ICsJaWYgKG9sZF9tZW0tPm1lbV90eXBlID09IFRUTV9QTF9T
WVNURU0pCj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJcmV0ID0gdHRtX2JvX3dhaXRfY3R4KGJvLCBj
dHgpOwo+ICsJaWYgKHVubGlrZWx5KHJldCAhPSAwKSkgewo+ICsJCWlmIChyZXQgIT0gLUVSRVNU
QVJUU1lTKQo+ICsJCQlwcl9lcnIoIkZhaWxlZCB0byBleHBpcmUgc3luYyBvYmplY3QgYmVmb3Jl
IHVuYmluZGluZyBUVE1cbiIpOwo+ICsJCXJldHVybiByZXQ7Cj4gKwl9Cj4gKwo+ICsJdHRtX2Jv
X3R0X3VuYmluZChibyk7Cj4gKwl0dG1fcmVzb3VyY2VfZnJlZShibywgJmJvLT5tZW0pOwo+ICsJ
b2xkX21lbS0+bWVtX3R5cGUgPSBUVE1fUExfU1lTVEVNOwo+ICsJcmV0dXJuIDA7Cj4gK30KPiAr
Cj4gICBpbnQgdHRtX2JvX21vdmVfdHRtKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4g
ICAJCSAgIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4LAo+ICAgCQkgICAgc3RydWN0IHR0
bV9yZXNvdXJjZSAqbmV3X21lbSkKPiBAQCAtNzIsMTkgKzk0LDkgQEAgaW50IHR0bV9ib19tb3Zl
X3R0bShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCXN0cnVjdCB0dG1fcmVzb3Vy
Y2UgKm9sZF9tZW0gPSAmYm8tPm1lbTsKPiAgIAlpbnQgcmV0Owo+ICAgCj4gLQlpZiAob2xkX21l
bS0+bWVtX3R5cGUgIT0gVFRNX1BMX1NZU1RFTSkgewo+IC0JCXJldCA9IHR0bV9ib193YWl0X2N0
eChibywgY3R4KTsKPiAtCj4gLQkJaWYgKHVubGlrZWx5KHJldCAhPSAwKSkgewo+IC0JCQlpZiAo
cmV0ICE9IC1FUkVTVEFSVFNZUykKPiAtCQkJCXByX2VycigiRmFpbGVkIHRvIGV4cGlyZSBzeW5j
IG9iamVjdCBiZWZvcmUgdW5iaW5kaW5nIFRUTVxuIik7Cj4gLQkJCXJldHVybiByZXQ7Cj4gLQkJ
fQo+IC0KPiAtCQl0dG1fYm9fdHRfdW5iaW5kKGJvKTsKPiAtCQl0dG1fcmVzb3VyY2VfZnJlZShi
bywgJmJvLT5tZW0pOwo+IC0JCW9sZF9tZW0tPm1lbV90eXBlID0gVFRNX1BMX1NZU1RFTTsKPiAt
CX0KPiArCXJldCA9IHR0bV9ib19tb3ZlX29sZF90b19zeXN0ZW0oYm8sIGN0eCk7Cj4gKwlpZiAo
dW5saWtlbHkocmV0ICE9IDApKQo+ICsJCXJldHVybiByZXQ7Cj4gICAKPiAgIAlyZXQgPSB0dG1f
Ym9fbW92ZV90b19uZXdfdHRfbWVtKGJvLCBjdHgsIG5ld19tZW0pOwo+ICAgCWlmICh1bmxpa2Vs
eShyZXQgIT0gMCkpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
