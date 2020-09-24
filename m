Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702F2276F91
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 13:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2966E200;
	Thu, 24 Sep 2020 11:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EF56E200
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 11:12:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kr7vl9qSHF9AfUFg5Ai4aJSKOzQAmNlYQne2rmZuB2aUORrCOM/8KNJtN/XS4WhhRkPdX5lfw9PWWmicR91Jgf1QT7P6pAbVfyxpmY27xzhOlkWjgFqONCQJ/aVW7MsSoVksSXtoh10JbRM187bQg9VD0vZn9d6niOeZKcpcKu5lP9yHW8mcLzQqeRO1frhseUv6tmdOX7WTR6t6ffixeHfu2O9isJXViaXWBLvU0nVkmKunY7LhXpe/19gouelcxNmY21IxxMvWDM+89a3pcFuK3z5tCcMcThSlXNOBT72ZVhO+UJBwVJWvawavkHtc5AN7mGq0CNWkdMQMpBtVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4OdtdCo4LwDqFtsS3Rxv/d8OnUVUTzBR0wQsFdUJ48=;
 b=Ut6NIydEa80G3N+D6P3Fj5LnqZ8ztc6Yr6RYrUd5hL9w5iGjZ4jPLkApsuBH6MfzuhMSGGeAc5F9QzN0jKz2tFYGN8yfu6raasNE0JbfIOTDg89FDbvgbATUXpj1pLh1DMhgkbUVekAkEiOa8sFYj24pXTH2AmUurnthWlaWB13MoYxwoqJogEwL3DmVVNNGUj/OxF3i9a1sYzubhZDm67hnK+Mac7nm0okpJJ60KVPU8xNY4s6Noav6OyCtx6rG3hBdZIpzEBSi7H/8fyL++g1ejfEptMayMW/zrQeBWY+NfN/VWfbiN3+MRutcFFuCGKUwF67KmACPPPEO9EkE2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4OdtdCo4LwDqFtsS3Rxv/d8OnUVUTzBR0wQsFdUJ48=;
 b=LZ4CrSHwhF+zaHA5DlArUp6DNAZqEqLKWkj/OGQfVPmMdpzpkBDX6E7/lkTnSBF2gBdKRNN84EfACJW5jXndRLDsIurKguqvatSIb8UZ9GnageApxZYAsF4szojJBpi1gtGO1ekwYfeVPpzYb02/B3uGFdwavHFvyjSgbL4qku0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Thu, 24 Sep
 2020 11:12:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 11:12:31 +0000
Subject: Re: [PATCH 06/45] drm/vmwgfx: move null mem checks outside move
 notifies
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-7-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b3646d27-dcbf-4e17-f222-a312e927ed36@amd.com>
Date: Thu, 24 Sep 2020 13:12:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-7-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR05CA0095.eurprd05.prod.outlook.com
 (2603:10a6:208:136::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR05CA0095.eurprd05.prod.outlook.com (2603:10a6:208:136::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend
 Transport; Thu, 24 Sep 2020 11:12:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94136bfb-bd79-495c-3e7a-08d8607abb36
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:
X-Microsoft-Antispam-PRVS: <BL0PR12MB235344B2046B18EEDBD705BC83390@BL0PR12MB2353.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HTU9feyxHOMHrV86wnHpyISc1lYnC2qwivhHPbZSNxr3Y7lpShGK8QmfFbvFlcWX+zVqWFte2jpecAtJoY3810Vd7NnkwkWOWB6kGqKps9b5dXJoOQOKcqlw/p8z/GGI+TB7T5RMqh/3RulgOmGo81PCaInHfYsM9K8OAJ/0cV3x5holkSeDbZetoj65/cluZBhx0X2tgEVigwwjSUYymBq/HtjZg6aZv0aBMbFJD1agnIo7MKHZzbvgvqcOvijhWm0ruAmCDlnrX2OzgnUNKAmoQpnUw+0kNha7NgaXQpAFxpJXst+HHj8Wmr4Zwy2Joc6XTx8Az5P4nJWkM6Q0tHMczoXTLroA6g1btNanMslL543emgqhQh9hXga7Bh1v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(66556008)(66476007)(66946007)(31696002)(186003)(36756003)(16526019)(2906002)(6666004)(83380400001)(86362001)(31686004)(66574015)(8936002)(478600001)(4326008)(6486002)(5660300002)(316002)(2616005)(52116002)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: vcYePGBMtjAW7OMOvdDnRN5JH2x1PCEnxt+ZRslgWMG52q+PhfAuvSS6xIwXWYgWadqHIJxVtrJuGGtBNt+n39y1WiiKQpWnXbmh0w1S7aHbSXyQxOqcFslI/m2mUwAPF/7RHQUav0WRAwQu9vVA1jKXZA+NB748d1kRVBlpjFqrX3do8nba/Ax9yeo3ZmgHUp8PHTq4s4kdJBzicdB9Svst47flJN+Q3C8/Z8jCmmxj/C6QZHhkENIcY56fvKNS/h/nU4Sz1HygcDNbIDQsOQCIY03+PO7N3WWWrt/8jQDVuojFzm6yRZimPe2qoQ8BpaltJhxCUdMgR7lZG1iI2hwdH66MkI2Nm3wtCEAH5M8lRYOA830HLbGFYlv8bt1c0jqnIwN1iBaTeEqp2EisZj/fFAlypuF3RrfAHWAYM446oXCopSXTCGbuMtwf+DCa5fhJwM49zIKa84bvHbAayfsphoqju8bp7Qk2POsmjcGs6xjBk7UMfEPbU5zwS7AUrxRwLGrbo2EszW/Pi/kmF9x7tyAFUmYsLhKtoEHoOxdzGGhfY0GDF1EGduGq+QY0kq+RT6kPX7MZ/c5xHe2+aSze5+u6J7BsykI3W3z60YkRME3yk6mURk5h3WOKbARKy93eWZPOfbto5LpaAX5lZ4jWS8D1WhhK+wm2W2dmkCJi7X7MEOhg9dVNpHyccd8Mfp5EvhlfASjUnl+QPKRTew==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94136bfb-bd79-495c-3e7a-08d8607abb36
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 11:12:31.7775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDKLc5Ny07CfUhmwvnGS+U8Xxn6JvEoDAlxhNbGpyuYwMTgHqjoBM2QUj787TdMy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2353
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
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gQm90aCBmbnMgY2hlY2tlZCBtZW0gPT0gTlVM
TCwganVzdCBtb3ZlIHRoZSBjaGVjayBvdXRzaWRlLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBB
aXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KCkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfYm8uYyAgICAgICAgIHwgMyAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X3Jlc291cmNlLmMgICB8IDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X3R0bV9idWZmZXIuYyB8IDIgKysKPiAgIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9iby5jCj4gaW5k
ZXggYTFmNjc1YzVmNDcxLi5iMDlmNGYwNjRhZTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2JvLmMKPiBAQCAtMTE5MSw5ICsxMTkxLDYgQEAgdm9pZCB2bXdfYm9fbW92ZV9ub3RpZnko
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIHsKPiAgIAlzdHJ1Y3Qgdm13X2J1ZmZl
cl9vYmplY3QgKnZibzsKPiAgIAo+IC0JaWYgKG1lbSA9PSBOVUxMKQo+IC0JCXJldHVybjsKPiAt
Cj4gICAJLyogTWFrZSBzdXJlIEBibyBpcyBlbWJlZGRlZCBpbiBhIHN0cnVjdCB2bXdfYnVmZmVy
X29iamVjdD8gKi8KPiAgIAlpZiAoYm8tPmRlc3Ryb3kgIT0gdm13X2JvX2JvX2ZyZWUgJiYKPiAg
IAkgICAgYm8tPmRlc3Ryb3kgIT0gdm13X3VzZXJfYm9fZGVzdHJveSkKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X3Jlc291cmNlLmMKPiBpbmRleCA1ZTkyMmQ5ZDVmMmMuLjAwYjUzNTgz
MWE3YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9yZXNvdXJj
ZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfcmVzb3VyY2UuYwo+IEBA
IC04NjcsNyArODY3LDcgQEAgdm9pZCB2bXdfcXVlcnlfbW92ZV9ub3RpZnkoc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICpibywKPiAgIAltdXRleF9sb2NrKCZkZXZfcHJpdi0+YmluZGluZ19tdXRl
eCk7Cj4gICAKPiAgIAlkeF9xdWVyeV9tb2IgPSBjb250YWluZXJfb2YoYm8sIHN0cnVjdCB2bXdf
YnVmZmVyX29iamVjdCwgYmFzZSk7Cj4gLQlpZiAobWVtID09IE5VTEwgfHwgIWR4X3F1ZXJ5X21v
YiB8fCAhZHhfcXVlcnlfbW9iLT5keF9xdWVyeV9jdHgpIHsKPiArCWlmICghZHhfcXVlcnlfbW9i
IHx8ICFkeF9xdWVyeV9tb2ItPmR4X3F1ZXJ5X2N0eCkgewo+ICAgCQltdXRleF91bmxvY2soJmRl
dl9wcml2LT5iaW5kaW5nX211dGV4KTsKPiAgIAkJcmV0dXJuOwo+ICAgCX0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jIGIvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jCj4gaW5kZXggZmM2OGY1NGRmNDZhLi4y
Zjg4ZDJkNzlmOWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
dHRtX2J1ZmZlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1
ZmZlci5jCj4gQEAgLTcwNyw2ICs3MDcsOCBAQCBzdGF0aWMgdm9pZCB2bXdfbW92ZV9ub3RpZnko
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIAkJCSAgICBib29sIGV2aWN0LAo+ICAg
CQkJICAgIHN0cnVjdCB0dG1fcmVzb3VyY2UgKm1lbSkKPiAgIHsKPiArCWlmICghbWVtKQo+ICsJ
CXJldHVybjsKPiAgIAl2bXdfYm9fbW92ZV9ub3RpZnkoYm8sIG1lbSk7Cj4gICAJdm13X3F1ZXJ5
X21vdmVfbm90aWZ5KGJvLCBtZW0pOwo+ICAgfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
