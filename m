Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA0B265CD4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EF96E99F;
	Fri, 11 Sep 2020 09:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66D16E038
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 12:35:25 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 135462F4C83CA4C34600;
 Thu, 10 Sep 2020 20:35:18 +0800 (CST)
Received: from [10.174.178.248] (10.174.178.248) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 10 Sep
 2020 20:35:13 +0800
Subject: Re: [PATCH] drm/mm: prevent a potential null-pointer dereference
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <nirmoy.das@amd.com>
References: <20200910023858.43759-1-jingxiangfeng@huawei.com>
 <f6c93d83-b47d-a004-8da9-92305024c4b7@amd.com>
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Message-ID: <5F5A1D80.2060902@huawei.com>
Date: Thu, 10 Sep 2020 20:35:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <f6c93d83-b47d-a004-8da9-92305024c4b7@amd.com>
X-Originating-IP: [10.174.178.248]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDIwLzkvMTAgMTY6NTgsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMTAuMDku
MjAgdW0gMDQ6Mzggc2NocmllYiBKaW5nIFhpYW5nZmVuZzoKPj4gVGhlIG1hY3JvICdERUNMQVJF
X05FWFRfSE9MRV9BRERSJyBtYXkgaGl0IGEgcG90ZW50aWFsIG51bGwtcG9pbnRlcgo+PiBkZXJl
ZmVyZW5jZS4gU28gdXNlICdlbnRyeScgYWZ0ZXIgY2hlY2tpbmcgaXQuCj4KPiBJIGRvbid0IHNl
ZSBhIHBvdGVudGlhbCBudWxsLXBvaW50ZXIgZGVyZWZlcmVuY2UgaGVyZS4KPgo+IFdoZXJlIHNo
b3VsZCB0aGF0IGJlPwoKSW4gY3VycmVudCBjb2Rl77yMdGhlICJlbnRyeSIgcG9pbnRlciBpcyBj
aGVja2VkIGFmdGVyIGVudHJ5LT5yYl9ob2xlX2FkZHIuCglUaGFua3MKPgo+IENocmlzdGlhbi4K
Pgo+Pgo+PiBGaXhlczogNWZhZDc5ZmQ2NmZmICgiZHJtL21tOiBjbGVhbnVwIGFuZCBpbXByb3Zl
IG5leHRfaG9sZV8qX2FkZHIoKSIpCj4+IFNpZ25lZC1vZmYtYnk6IEppbmcgWGlhbmdmZW5nIDxq
aW5neGlhbmdmZW5nQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1f
bW0uYyB8IDcgKysrKystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21tLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX21tLmMKPj4gaW5kZXggYTRhMDRkMjQ2MTM1Li42ZmNmNzBm
NzE5NjIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYwo+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX21tLmMKPj4gQEAgLTM5MiwxMSArMzkyLDE0IEBAIGZpcnN0X2hv
bGUoc3RydWN0IGRybV9tbSAqbW0sCj4+ICAgI2RlZmluZSBERUNMQVJFX05FWFRfSE9MRV9BRERS
KG5hbWUsIGZpcnN0LCBsYXN0KSAgICAgICAgICAgIFwKPj4gICBzdGF0aWMgc3RydWN0IGRybV9t
bV9ub2RlICpuYW1lKHN0cnVjdCBkcm1fbW1fbm9kZSAqZW50cnksIHU2NAo+PiBzaXplKSAgICBc
Cj4+ICAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gLSAgICBzdHJ1
Y3QgcmJfbm9kZSAqcGFyZW50LCAqbm9kZSA9ICZlbnRyeS0+cmJfaG9sZV9hZGRyOyAgICAgICAg
XAo+PiArICAgIHN0cnVjdCByYl9ub2RlICpwYXJlbnQsICpub2RlOyAgICAgICAgICAgICAgICAg
ICAgXAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gLSAgICBp
ZiAoIWVudHJ5IHx8IFJCX0VNUFRZX05PREUobm9kZSkpICAgICAgICAgICAgICAgIFwKPj4gKyAg
ICBpZiAoIWVudHJ5KSAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICAgICAgICAgICBy
ZXR1cm4gTlVMTDsgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgIG5vZGUgPSAmZW50cnktPnJiX2hvbGVfYWRk
cjsgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICBpZiAoUkJfRU1QVFlfTk9ERShub2RlKSkg
ICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICAgcmV0dXJuIE5VTEw7ICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+PiAgICAgICBpZiAodXNhYmxlX2hvbGVfYWRkcihub2RlLT5maXJzdCwg
c2l6ZSkpIHsgICAgICAgICAgICBcCj4+ICAgICAgICAgICBub2RlID0gbm9kZS0+Zmlyc3Q7ICAg
ICAgICAgICAgICAgICAgICBcCj4+ICAgICAgICAgICB3aGlsZSAodXNhYmxlX2hvbGVfYWRkcihu
b2RlLT5sYXN0LCBzaXplKSkgICAgICAgIFwKPgo+IC4KPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
