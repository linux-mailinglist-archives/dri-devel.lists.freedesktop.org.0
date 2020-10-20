Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C3029390F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 12:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F66F6EC48;
	Tue, 20 Oct 2020 10:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00286EC45
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 10:20:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyGij2acd15+vv73c33TVwrrLguhOfr2gtN97GPVJbeVD0qmntY4Kwdz0wKDMm9ntJn0gvbRsVcCcRDjqpgPuGMVrgd7CzSY3gF6IhzyIDvU9m6vjkNDrkKXGjff3vpFXQTgfsaUtbr/wmmCBMWvCK0Uf3KeWdbgks1c6xswprs6q9Ty2cmDullDHuYAvZCaLgXnRiNIngq570zNLX8990dJAv5MC01xISs/YtPmTtd6VlS5tnKiQ4tTDCqGBi2UFCMbYEmdlzw0HWRHVO5UcKyS3JFLD+dVDDCpcfQTgKPolsgucKwttkKzKKqLOD7uvohpQNMbIASUfktVN8sJ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIxtqnzHk8Tc0VtwSGFTfyyc+hz4/O1R+braFYYj7kg=;
 b=hFDWlhzoy5xJHMfxjYzCLYaBb0oliX2yWL0+/B4DfSpwPryyxHZfY4Qv72bLfUgAY7nEn5Mza6NGoo4h14sYOOrVxksJWM4vWNUalI3uUMMZbERzwW3iTPdymwgyedChSZzWOoydjvSrBcCG7C7TLyjVTx2v3Vs4X6IYWrmQ3JuaUNUVyT4YdYrb3z2/XI2xjdrjDKrOdeovo/pjRSFyKczaUkj1iYpvmb1ESUcWG1E4Hg7VdV1Ft0BxghmZI8/6TIR/6RKKusVqVRxgDujzKBKMdwFVutZZo2dvV5BI2p7p9gxMAAi/w1+RXPRDf/sUIExG+nHmF0UfQjrmxyxlFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIxtqnzHk8Tc0VtwSGFTfyyc+hz4/O1R+braFYYj7kg=;
 b=Rxa+a3wPcwrmRDEm3bj4mMyUqF++4q5KebT9CGegqo3oxUbH9lSgKeoAvJPfiGImaPSoqv1ddW1SpQqUjkVfCc49uOkBmZlrf6LHrmYf6aeLltnVQslYPMe79+HNN4/xoxNp+2zwngkl8IOqdc/FAxjGdo7WDqFsohxMpr7bNUg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 20 Oct
 2020 10:20:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 10:20:39 +0000
Subject: Re: [PATCH 1/7] drm/ttm: move some move binds into the drivers
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201020010319.1692445-1-airlied@gmail.com>
 <20201020010319.1692445-2-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <54966de9-5cb0-43a3-9cb0-37cce05ec977@amd.com>
Date: Tue, 20 Oct 2020 12:20:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201020010319.1692445-2-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR07CA0021.eurprd07.prod.outlook.com
 (2603:10a6:205:1::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0021.eurprd07.prod.outlook.com (2603:10a6:205:1::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.8 via Frontend Transport; Tue, 20 Oct 2020 10:20:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e673ce86-0eb2-46f4-a911-08d874e1ca95
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-Microsoft-Antispam-PRVS: <BL0PR12MB491623578DEBC97E93B2A909831F0@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pWu1/VWc+i0+Z44WXqSTyrNPdg3+oakg0bKU+Z5J+1dY2RALP5gJGxJl8kxQB4jE2ZrRlfit1YcCd7HyGeriBIsZwaalQNFjDVKTEwMAiqp0cqlJNvczN/iTsAIzadRB4teJFk/0/QAdDlvAgKj41ZXbCwxNEORY5nR8/+XtFNKvwaZyY2kaGp39rEzhg/m/dBKADyrBRe+S1d3WBwtjYKj+TWgioO2j79qKI8b7XkBnlO2+BvjnuZLcsp0V9x6gFAhSM5rCfGa6uQQXpWIWzLv86hdDeJRYFbgwg/4fG1sTyN1gH75xh1KFdHrPBcFbi7RgkpXMa1sYXYq/S6TJh2a6beXSlRzS3rRNTYcZQjihQNFfnxzTNbq/pWBVv+PY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(83380400001)(5660300002)(6666004)(66556008)(66476007)(66946007)(6486002)(52116002)(2616005)(316002)(36756003)(478600001)(31696002)(31686004)(2906002)(186003)(86362001)(16526019)(8936002)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 0yELzpetEhUwestrEUkQW5Ai8nMYGOYACU015A83LeiB3p2F6vrjq7/7d3EK7hJD3RbpM7+o+Fz8fLUm6rp92mTyl3X7/UU+8g4iEMfeh9RcEYM/QlrfIzcjZYtzmwbAunk/znkRLeUyKDWSLI2TI4FMquc4kbffvLf3zalMATbHA5wnz3Kz2kZW4SxI8dkJhygTsP5gich8kWCLKe1vmk39qMuWadSs2y1bWadwOb/k/FDXASjL50/C7xMngaJjiIYCIw6L1EqGFPBJH73emT0E7QELQl6uf8egAnCKuzl8b4njb2+cZtSMF6YyE0KCG9TlCCycSI/eTNvXgAWdeHW/VXt3koshZ3WJwFYttF1An87if6y1u8r9qbmHwxOLlmpxiTbraCbwdi4jdPcNEkzjcZRm2PW2JvwhNNjeHJhpTlqBNkOjX0V3CagCqq0eOXn4tWWwr57Rl2Fhlifd3WbTUOjCG3QRwmvRJ/FoGFawd5fx6NRKHdzN+TAc9E9IuhdAYQ1MBBIjBBbjHJ882P9o9QD5fKiz0ICrubIaqpgX+YmuBzIoacM2QXZYcj7ah3MUspessIattlv5TPGyFW16kSTYcUlC+IqpGuYGRsRajLTJ59TuyO7pxKJNnfhcMPdlWpNeS81UycXjSBuSmMOrgCR1Vw6FUoqW4nd/cFfjuegnOcToKl9/++dIjajcpczd7cF9jwS9YMp3qKQhLg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e673ce86-0eb2-46f4-a911-08d874e1ca95
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 10:20:39.6320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zi6+47nzAVGEBpS0YuxVgvN17IpYjwoe/nKijY13hsL12SnUHs7pVeXWdwdoEGhY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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

QW0gMjAuMTAuMjAgdW0gMDM6MDMgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyBqdXN0IGdpdmVzIHRoZSBkcml2ZXIg
Y29udHJvbCBvdmVyIHNvbWUgb2YgdGhlIGJpbmQgcGF0aHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBE
YXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgfCAgNyArKysrKystCj4gICBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgICAgfCAxMCArKysrKysrLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyAgICAgfCAxMSArKysrKysrKy0tLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jICAgICAgIHwgIDEgLQo+ICAgNCBmaWxlcyBjaGFu
Z2VkLCAyMSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IGluZGV4IDkxYjIwYWEyMjk0ZC4uNGFmNDg5MTI2NGUx
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IEBAIC02MDUs
MTAgKzYwNSwxNSBAQCBzdGF0aWMgaW50IGFtZGdwdV9tb3ZlX3JhbV92cmFtKHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm8sIGJvb2wgZXZpY3QsCj4gICAJfQo+ICAgCj4gICAJLyogbW92ZS9i
aW5kIG9sZCBtZW1vcnkgdG8gR1RUIHNwYWNlICovCj4gLQlyID0gdHRtX2JvX21vdmVfdG9fbmV3
X3R0X21lbShibywgY3R4LCAmdG1wX21lbSk7Cj4gKwlyID0gdHRtX3R0X3BvcHVsYXRlKGJvLT5i
ZGV2LCBiby0+dHRtLCBjdHgpOwo+ICsJaWYgKHVubGlrZWx5KHIpKQo+ICsJCXJldHVybiByOwo+
ICsKPiArCXIgPSBhbWRncHVfdHRtX2JhY2tlbmRfYmluZChiby0+YmRldiwgYm8tPnR0bSwgJnRt
cF9tZW0pOwo+ICAgCWlmICh1bmxpa2VseShyKSkgewo+ICAgCQlnb3RvIG91dF9jbGVhbnVwOwo+
ICAgCX0KPiArCj4gICAJdHRtX2JvX2Fzc2lnbl9tZW0oYm8sICZ0bXBfbWVtKTsKPiAgIAkvKiBj
b3B5IHRvIFZSQU0gKi8KPiAgIAlyID0gYW1kZ3B1X21vdmVfYmxpdChibywgZXZpY3QsIG5ld19t
ZW0sIG9sZF9tZW0pOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBpbmRleCBm
ZWM3YTkwMTg2NWUuLjdlNjA0MzQwYjc4MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2JvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2JvLmMKPiBAQCAtOTMxLDkgKzkzMSwxMyBAQCBub3V2ZWF1X2JvX21vdmVfZmxpcHMoc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgYm9vbCBldmljdCwKPiAgIAlpZiAocmV0KQo+ICAg
CQlyZXR1cm4gcmV0Owo+ICAgCj4gLQlyZXQgPSB0dG1fYm9fbW92ZV90b19uZXdfdHRfbWVtKGJv
LCBjdHgsICZ0bXBfcmVnKTsKPiAtCWlmIChyZXQpCj4gLQkJZ290byBvdXQ7Cj4gKwlyZXQgPSB0
dG1fdHRfcG9wdWxhdGUoYm8tPmJkZXYsIGJvLT50dG0sIGN0eCk7Cj4gKwlpZiAodW5saWtlbHko
cmV0ICE9IDApKQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+ICsJcmV0ID0gbm91dmVhdV90dG1fdHRf
YmluZChiby0+YmRldiwgYm8tPnR0bSwgJnRtcF9yZWcpOwo+ICsJaWYgKHVubGlrZWx5KHJldCAh
PSAwKSkKPiArCQlyZXR1cm4gcmV0Owo+ICAgCj4gICAJdHRtX2JvX2Fzc2lnbl9tZW0oYm8sICZ0
bXBfcmVnKTsKPiAgIAlyZXQgPSBub3V2ZWF1X2JvX21vdmVfbTJtZihibywgdHJ1ZSwgY3R4LCBu
ZXdfcmVnKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+IGluZGV4IGVjNzEzZjBl
NTVlNS4uMjRlZjI1NjY1MjQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMK
PiBAQCAtMjc5LDEwICsyNzksMTUgQEAgc3RhdGljIGludCByYWRlb25fbW92ZV9yYW1fdnJhbShz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCWlmICh1bmxpa2VseShyKSkgewo+ICAg
CQlyZXR1cm4gcjsKPiAgIAl9Cj4gLQlyID0gdHRtX2JvX21vdmVfdG9fbmV3X3R0X21lbShibywg
Y3R4LCAmdG1wX21lbSk7Cj4gLQlpZiAodW5saWtlbHkocikpIHsKPiArCj4gKwlyID0gdHRtX3R0
X3BvcHVsYXRlKGJvLT5iZGV2LCBiby0+dHRtLCBjdHgpOwo+ICsJaWYgKHVubGlrZWx5KHIpKQo+
ICAgCQlnb3RvIG91dF9jbGVhbnVwOwo+IC0JfQo+ICsKPiArCXIgPSByYWRlb25fdHRtX3R0X2Jp
bmQoYm8tPmJkZXYsIGJvLT50dG0sICZ0bXBfbWVtKTsKPiArCWlmICh1bmxpa2VseShyKSkKPiAr
CQlnb3RvIG91dF9jbGVhbnVwOwo+ICsKPiAgIAl0dG1fYm9fYXNzaWduX21lbShibywgJnRtcF9t
ZW0pOwo+ICAgCXIgPSByYWRlb25fbW92ZV9ibGl0KGJvLCB0cnVlLCBuZXdfbWVtLCBvbGRfbWVt
KTsKPiAgIAlpZiAodW5saWtlbHkocikpIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm9fdXRpbC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4g
aW5kZXggZTRiZDM4MWE4OTYyLi5jOGNhNjY5NGNjMWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fdXRpbC5jCj4gQEAgLTY0LDcgKzY0LDYgQEAgaW50IHR0bV9ib19tb3ZlX3RvX25ld190dF9t
ZW0oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIAo+ICAgCXJldHVybiAwOwo+ICAg
fQo+IC1FWFBPUlRfU1lNQk9MKHR0bV9ib19tb3ZlX3RvX25ld190dF9tZW0pOwo+ICAgCj4gICBp
bnQgdHRtX2JvX21vdmVfdG9fc3lzdGVtKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4g
ICAJCQkgIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4KQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
