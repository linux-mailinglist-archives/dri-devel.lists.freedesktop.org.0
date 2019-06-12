Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DABBE427E1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 15:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E198952F;
	Wed, 12 Jun 2019 13:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB5C8952F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 13:44:21 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5CDdtcW012666;
 Wed, 12 Jun 2019 13:43:11 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 2t02heumw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 13:43:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5CDeB0N038051;
 Wed, 12 Jun 2019 13:41:11 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2t0p9rvenc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 13:41:11 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5CDf64d025367;
 Wed, 12 Jun 2019 13:41:07 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 12 Jun 2019 06:41:06 -0700
Date: Wed, 12 Jun 2019 16:40:57 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/mcde: Fix uninitialized variable
Message-ID: <20190612134057.GE1893@kadam>
References: <20190612133038.5522-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612133038.5522-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9285
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906120093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9285
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906120093
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=13DeyiWWSqICag3GrfQje4UwUYiMYyzOrQqvgi39M/E=;
 b=Vh37hBIFFlGpA/8AuwCaEWRjxeLeqx7U7spMuUekaayQADjONbYSQTVzPub6mQygmEIn
 gVGj8dAwEwOjhcBTWaAcJn/dWVYTdKnlhCfV0TC3PgxZi9wV8gwnM9a5fQHxLwtui2qu
 ji4sd/v7Xv/JY+9MxeVDXjJtneaB0QjiQPQi5KvfyvL0BfC/ksjQqnF7FPNdP2BlyOZG
 XfpV/suOY0UWbeGh+DfN9mU1cgSV/93TtfLrvToLPcAjfNkLDMvqPCufclFdtmgREuN9
 EtgAgncGquhPEY44UQImslS+rAgz3Vd7JRWyT6R4fkio4EBFrQLzAridR46UT7yCLm40 Ng== 
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDM6MzA6MzhQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBXZSBuZWVkIHRvIGhhbmRsZSB0aGUgY2FzZSB3aGVuIG9mX2RybV9maW5kX2JyaWRn
ZSgpIHJldHVybnMKPiBOVUxMLgo+IAo+IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4u
Y2FycGVudGVyQG9yYWNsZS5jb20+Cj4gQ2M6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJA
b3JhY2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlq
QGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHJ2LmMgfCA0
ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tY2RlL21jZGVfZHJ2LmMKPiBpbmRleCBiYWY2M2ZiNjg1MGEuLmJjMTFjNDQ2
ZTU5NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYwo+IEBAIC0zMTksNyArMzE5LDcgQEAg
c3RhdGljIGludCBtY2RlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlz
dHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ICAJc3RydWN0IGRybV9kZXZpY2UgKmRy
bTsKPiAgCXN0cnVjdCBtY2RlICptY2RlOwo+IC0Jc3RydWN0IGNvbXBvbmVudF9tYXRjaCAqbWF0
Y2g7Cj4gKwlzdHJ1Y3QgY29tcG9uZW50X21hdGNoICptYXRjaCA9IE5VTEw7Cj4gIAlzdHJ1Y3Qg
cmVzb3VyY2UgKnJlczsKPiAgCXUzMiBwaWQ7Cj4gIAl1MzIgdmFsOwo+IEBAIC00ODUsNyArNDg1
LDcgQEAgc3RhdGljIGludCBtY2RlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gIAkJfQo+ICAJCXB1dF9kZXZpY2UocCk7Cj4gIAl9Cj4gLQlpZiAoSVNfRVJSKG1hdGNoKSkg
ewo+ICsJaWYgKElTX0VSUl9PUl9OVUxMKG1hdGNoKSkgewo+ICAJCWRldl9lcnIoZGV2LCAiY291
bGQgbm90IGNyZWF0ZSBjb21wb25lbnQgbWF0Y2hcbiIpOwo+ICAJCXJldCA9IFBUUl9FUlIobWF0
Y2gpOwoKVGhpcyBkb2Vzbid0IHdvcmsuICBJZiAibWF0Y2giIGlzIE5VTEwgdGhlbiAicmV0IiBp
cyB6ZXJvIHdoaWNoIGlzCnN1Y2Nlc3MuCgo+ICAJCWdvdG8gY2xrX2Rpc2FibGU7CgpyZWdhcmRz
LApkYW4gY2FycGVudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
