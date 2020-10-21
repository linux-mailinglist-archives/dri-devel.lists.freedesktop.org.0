Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB0D294AF0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 11:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5883A6EA92;
	Wed, 21 Oct 2020 09:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7776EA92
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 09:59:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldbFFjN+44VgnRZGCY9l91pqPp5S8W+oFxfA/k0R0HVaYYxZTRV+buLZcKoZkWT7Kfcwk1IEHrM6ii/+adnwGM69rTPi8Rh4guqImBa12r8Y5ySYJFmmsyg9K+v/LUywQnY7tIV6xIgN5pHYVVJpaG/mn/5vFRO7Ha2RhVyQUQFb2OSBaiD4F9eef4zqgYgXGhMaVJQvOjMgu/NC7RbQ7eelSwQeL1C9i68l03nka33ZWNMCGxgnaISu6EbE6gulmSsA2C1YVWzkOVhc1wVmOhqGMqH7IJ8bKiCyXdgEgpd05AuUeaIeL3QuB+k7Uz0N1G4j2mst3eOjEU9SIhSeTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxQFy7cM91GyffF8HsNbbxp0WP2p/jGwlyBE4JEkFIw=;
 b=Auqgij+Nb1sbM7L95E/tJ1iqxcV1NQpe/CaB/AEugl8yt0qL5KeGOEtNIG9Res6KucWWIqW7f5hLBEdXg2SPynkeNhhQEgg3mshOSs6lhpBniPOKl7PEnLSyqcxw3nejnTetRbt52eq9Vf+GKc+s3o6dkApIwr29V/sKPQi6NO5p3YdlNB906Kytvs2orfsTarzJp4FaGVyDQR1u4qq4mkTo8Lzt66kWndGU/92flTWba/8OIJX6norpwUvmpQD5K+fEsaL6xCVPJWc2I8Hp/q5fM5xb5UQ8CCJw80i/hFyNAuMGhr+j2DeMeSUxff8rfChmC0obbIyk+PQuDJtL/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxQFy7cM91GyffF8HsNbbxp0WP2p/jGwlyBE4JEkFIw=;
 b=vP7nvYS3fpOTTNl6d/ix5W9WPBYB5+ED+RkFV1fJKDf0hU/cEEkIfus470lpeX4q75iHQ14tPimp5xsTEnoc3VAoChp5UFCFUFLuw2YwSDfS0jAg5ARJqY2xOshDbI5d5QTEZKnj2ga1fNvxMhRR4pKG5BUYJcoWMsTle6Ni/vA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3886.namprd12.prod.outlook.com (2603:10b6:208:16a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 21 Oct
 2020 09:59:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 09:59:31 +0000
Subject: Re: [PATCH 2/3] drm/ttm: ttm_bo_mem_placement doesn't need ctx
 parameter.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201021044031.1752624-1-airlied@gmail.com>
 <20201021044031.1752624-3-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f3cd8b5f-5a89-ecce-9aa3-a329c0c0e524@amd.com>
Date: Wed, 21 Oct 2020 11:59:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201021044031.1752624-3-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0027.eurprd04.prod.outlook.com
 (2603:10a6:208:122::40) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:208:122::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 21 Oct 2020 09:59:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e856511f-4fac-41a8-2d3f-08d875a800ef
X-MS-TrafficTypeDiagnostic: MN2PR12MB3886:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3886FD8C2373C8E32A945788831C0@MN2PR12MB3886.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SBUoCJyLDnsAHH3r5PtNVytY0GXURvncRqMHD2WT4a4FBaWSmxiM6dFK+32/aVYUD2Gh9XyHLT3ua3h5kRzIpcZn7LG2LFQPtv2BkW4Lf1vA0CpC8z0NJF/1KtSM+E+X3H89QP46ciLgbVkNNgJFVPR1shH7wqvcoAg0RPkjppN+Y2SV91jSgbrLMSX7rgrjKoaasvsRcBUtDWsM/GubH12GL9+vPR/Kq1p46/g/TlivBa8p8i7RIWgVIo6DT6OT0/fANClpu8f65pQqxjln2VNRojJ7Me0wThTCaM1JhjEpCKjVRNEtR8A6Tdy7Q4YCt92D8lBBcti17mcxv3DgGIFsO5EoYsRX2D3ekp5g6vjGy3p0eB96Qsm8m339Wso9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(8676002)(6486002)(52116002)(478600001)(186003)(6666004)(31686004)(16526019)(31696002)(86362001)(2616005)(66946007)(83380400001)(8936002)(5660300002)(316002)(66556008)(2906002)(66476007)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: J2HDWi9wqeqCJJKT2QWgpu1jn3wJCJ9QGvnKKmh+aj7E2KpvtULNfKj6hZ1ko9lbbmdbbO8hwguyEokhvajqbRkbSKGO2Ka7wpjblVQDI5evNH9NDChoq8uUnQfourr9a2p8p+ZOH5nG33tjzEzxAejdHTsjw3/cyX4Sbimdti5n0XuYgF2TBpQ6SRQzJiu9nzza+ISg4rXF9/maNOCXDBQf5OwnKgurMfsoEXcdw7dFhP0d0GmmTtUqnc6PtFDt24T/ok96g6Hh74Ewep2XBrIg/n0eVQ4CfuTEg1mL3+dEmDhj8cq317sCt/LQu/fu0saG+jXYjwQqc1u0jAfbBWwP8xrNtgTMLvjOTGCWuxyFzZnKCJ32Aboj0NS+HXpvJiLBwuZ/mmNI+F6Ds4IpipIPIrs4/fjReH9P5s6smXmJ/QxPBBQIG3JeoG9DVL//TyFIWqds1MaNJGkSJ7Yyn4fNM/wfFFzCdYIQaDjLNghgV0NxNjhK69x0X0oygLFqRV6ldVgtSFR8iJOH40V397hB8KthRVg1PQqq07pkqW91G/W5VQ8dts37o8I5maKL92L8xf5+VeWO+O1eJ1XpiLCLbgXVeFexI4gh10NCnfFOXN02d9ly7xasc9BSxDVjsZ9nXs9ErMNONF8zT1y8qX/QA4JdQvy64W2iNRxzFJf03As6rvrfzvtLxXAHkjin12stBVJtdpJADKAazUEHqQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e856511f-4fac-41a8-2d3f-08d875a800ef
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 09:59:31.2540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FeQOx0GEYC4Z8ZUDBdzlMT7eWJ+Dw/1qh4LBGQ3YUrfrO3ET8VmhUs3Wqzucys6I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3886
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMTAuMjAgdW0gMDY6NDAgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gUmVtb3ZlZCB1bnVzZWQgcGFyYW1ldGVyLgo+
Cj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClJldmll
d2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0t
LQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDggKysrLS0tLS0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvLmMKPiBpbmRleCBlMmFmYWIzZDk3ZWUuLjViNDExMjUyYTg1NyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm8uYwo+IEBAIC04MzAsNyArODMwLDYgQEAgc3RhdGljIGludCB0dG1fYm9fbWVtX2ZvcmNl
X3NwYWNlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAgKiBAYm86IEJPIHRvIGZp
bmQgbWVtb3J5IGZvcgo+ICAgICogQHBsYWNlOiB3aGVyZSB0byBzZWFyY2gKPiAgICAqIEBtZW06
IHRoZSBtZW1vcnkgb2JqZWN0IHRvIGZpbGwgaW4KPiAtICogQGN0eDogb3BlcmF0aW9uIGNvbnRl
eHQKPiAgICAqCj4gICAgKiBDaGVjayBpZiBwbGFjZW1lbnQgaXMgY29tcGF0aWJsZSBhbmQgZmls
bCBpbiBtZW0gc3RydWN0dXJlLgo+ICAgICogUmV0dXJucyAtRUJVU1kgaWYgcGxhY2VtZW50IHdv
bid0IHdvcmsgb3IgbmVnYXRpdmUgZXJyb3IgY29kZS4KPiBAQCAtODM4LDggKzgzNyw3IEBAIHN0
YXRpYyBpbnQgdHRtX2JvX21lbV9mb3JjZV9zcGFjZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLAo+ICAgICovCj4gICBzdGF0aWMgaW50IHR0bV9ib19tZW1fcGxhY2VtZW50KHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAJCQkJY29uc3Qgc3RydWN0IHR0bV9wbGFjZSAqcGxh
Y2UsCj4gLQkJCQlzdHJ1Y3QgdHRtX3Jlc291cmNlICptZW0sCj4gLQkJCQlzdHJ1Y3QgdHRtX29w
ZXJhdGlvbl9jdHggKmN0eCkKPiArCQkJCXN0cnVjdCB0dG1fcmVzb3VyY2UgKm1lbSkKPiAgIHsK
PiAgIAlzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiA9IGJvLT5iZGV2Owo+ICAgCXN0cnVjdCB0
dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuOwo+IEBAIC04ODQsNyArODgyLDcgQEAgaW50IHR0bV9i
b19tZW1fc3BhY2Uoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIAkJY29uc3Qgc3Ry
dWN0IHR0bV9wbGFjZSAqcGxhY2UgPSAmcGxhY2VtZW50LT5wbGFjZW1lbnRbaV07Cj4gICAJCXN0
cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuOwo+ICAgCj4gLQkJcmV0ID0gdHRtX2JvX21l
bV9wbGFjZW1lbnQoYm8sIHBsYWNlLCBtZW0sIGN0eCk7Cj4gKwkJcmV0ID0gdHRtX2JvX21lbV9w
bGFjZW1lbnQoYm8sIHBsYWNlLCBtZW0pOwo+ICAgCQlpZiAocmV0KQo+ICAgCQkJY29udGludWU7
Cj4gICAKPiBAQCAtOTEwLDcgKzkwOCw3IEBAIGludCB0dG1fYm9fbWVtX3NwYWNlKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAJZm9yIChpID0gMDsgaSA8IHBsYWNlbWVudC0+bnVt
X2J1c3lfcGxhY2VtZW50OyArK2kpIHsKPiAgIAkJY29uc3Qgc3RydWN0IHR0bV9wbGFjZSAqcGxh
Y2UgPSAmcGxhY2VtZW50LT5idXN5X3BsYWNlbWVudFtpXTsKPiAgIAo+IC0JCXJldCA9IHR0bV9i
b19tZW1fcGxhY2VtZW50KGJvLCBwbGFjZSwgbWVtLCBjdHgpOwo+ICsJCXJldCA9IHR0bV9ib19t
ZW1fcGxhY2VtZW50KGJvLCBwbGFjZSwgbWVtKTsKPiAgIAkJaWYgKHJldCkKPiAgIAkJCWNvbnRp
bnVlOwo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
