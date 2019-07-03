Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6035F3AB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4B26E2C2;
	Thu,  4 Jul 2019 07:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037A36E17B;
 Wed,  3 Jul 2019 17:32:42 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d1ce6b90000>; Wed, 03 Jul 2019 10:32:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 03 Jul 2019 10:32:42 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 03 Jul 2019 10:32:42 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 3 Jul 2019 17:32:40 +0000
Subject: Re: [PATCH 19/22] mm: always return EBUSY for invalid ranges in
 hmm_range_{fault,snapshot}
To: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe
 <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
References: <20190701062020.19239-1-hch@lst.de>
 <20190701062020.19239-20-hch@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <85c88d71-2c25-38ff-a4a3-bfd66fff72b7@nvidia.com>
Date: Wed, 3 Jul 2019 10:32:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190701062020.19239-20-hch@lst.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1562175161; bh=h5APIAGCLtc3sbvDunYYsjAxWo0bLP7WU/0gBEeeI0w=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=jFQPczeoa9GgO31iCc1i+leEDWlzjjir863TTILBB/y92fjmJ/f1sRLtX+VAJ+7kT
 w92vvah6B8huA4GwU+UVeQT0gcXzN2h0pOn1OhPiqQgIiYhz+alEB4KdiyBILqdNjF
 iPKpJwcfB8ejE/ycfI+hpo2hU5HhQCvtjkyBzaQyOAlSWgEb0SBv3a75TxnJ6bQu96
 N0rQy1PEp6S5xBst7hP92U8L+tvob0E2tubrjAKpvUgVgwpry+THodovSht9UYcLga
 YagJXvoKcVLlFOE7Nc+UP4wF3Mu6pxJqPDNSCJG6taQO+xhoGrUVb+lnZnXTS7ATQt
 SJRIeqmOivyvQ==
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
Cc: linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMzAvMTkgMTE6MjAgUE0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IFdlIHNob3Vs
ZCBub3QgaGF2ZSB0d28gZGlmZmVyZW50IGVycm9yIGNvZGVzIGZvciB0aGUgc2FtZSBjb25kaXRp
b24uICBJbgo+IGFkZGl0aW9uIHRoaXMgcmVhbGx5IGNvbXBsaWNhdGVzIHRoZSBjb2RlIGR1ZSB0
byB0aGUgc3BlY2lhbCBoYW5kbGluZyBvZgo+IEVBR0FJTiB0aGF0IGRyb3BzIHRoZSBtbWFwX3Nl
bSBkdWUgdG8gdGhlIEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlkgbG9naWMKPiBpbiB0aGUgY29yZSB2
bS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KClJl
dmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+CgpQcm9iYWJs
eSBzaG91bGQgdXBkYXRlIHRoZSAiUmV0dXJuOiIgY29tbWVudCBhYm92ZQpobW1fcmFuZ2Vfc25h
cHNob3QoKSB0b28uCgo+IC0tLQo+ICAgbW0vaG1tLmMgfCA4ICsrKy0tLS0tCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9tbS9obW0uYyBiL21tL2htbS5jCj4gaW5kZXggYzg1ZWQ3ZDRlMmNlLi5kMTI1ZGY2OThlMmIg
MTAwNjQ0Cj4gLS0tIGEvbW0vaG1tLmMKPiArKysgYi9tbS9obW0uYwo+IEBAIC05NzQsNyArOTc0
LDcgQEAgbG9uZyBobW1fcmFuZ2Vfc25hcHNob3Qoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCj4g
ICAJZG8gewo+ICAgCQkvKiBJZiByYW5nZSBpcyBubyBsb25nZXIgdmFsaWQgZm9yY2UgcmV0cnku
ICovCj4gICAJCWlmICghcmFuZ2UtPnZhbGlkKQo+IC0JCQlyZXR1cm4gLUVBR0FJTjsKPiArCQkJ
cmV0dXJuIC1FQlVTWTsKPiAgIAo+ICAgCQl2bWEgPSBmaW5kX3ZtYShobW0tPm1tLCBzdGFydCk7
Cj4gICAJCWlmICh2bWEgPT0gTlVMTCB8fCAodm1hLT52bV9mbGFncyAmIGRldmljZV92bWEpKQo+
IEBAIC0xMDY5LDEwICsxMDY5LDggQEAgbG9uZyBobW1fcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9y
YW5nZSAqcmFuZ2UsIGJvb2wgYmxvY2spCj4gICAKPiAgIAlkbyB7Cj4gICAJCS8qIElmIHJhbmdl
IGlzIG5vIGxvbmdlciB2YWxpZCBmb3JjZSByZXRyeS4gKi8KPiAtCQlpZiAoIXJhbmdlLT52YWxp
ZCkgewo+IC0JCQl1cF9yZWFkKCZobW0tPm1tLT5tbWFwX3NlbSk7Cj4gLQkJCXJldHVybiAtRUFH
QUlOOwo+IC0JCX0KPiArCQlpZiAoIXJhbmdlLT52YWxpZCkKPiArCQkJcmV0dXJuIC1FQlVTWTsK
PiAgIAo+ICAgCQl2bWEgPSBmaW5kX3ZtYShobW0tPm1tLCBzdGFydCk7Cj4gICAJCWlmICh2bWEg
PT0gTlVMTCB8fCAodm1hLT52bV9mbGFncyAmIGRldmljZV92bWEpKQo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
