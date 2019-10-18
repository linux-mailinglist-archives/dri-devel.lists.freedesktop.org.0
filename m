Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44640DC1B9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 11:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB07A6EB0C;
	Fri, 18 Oct 2019 09:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396AC6EB0B;
 Fri, 18 Oct 2019 09:50:07 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Oct 2019 02:50:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,311,1566889200"; d="scan'208";a="195420728"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.74])
 by fmsmga008.fm.intel.com with ESMTP; 18 Oct 2019 02:50:00 -0700
Date: Fri, 18 Oct 2019 17:46:56 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V4 4/6] mdev: introduce virtio device and its device ops
Message-ID: <20191018094655.GA4200@___>
References: <20191017104836.32464-1-jasowang@redhat.com>
 <20191017104836.32464-5-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017104836.32464-5-jasowang@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
 mst@redhat.com, airlied@linux.ie, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, cunming.liang@intel.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
 gor@linux.ibm.com, intel-gfx@lists.freedesktop.org, alex.williamson@redhat.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, parav@mellanox.com,
 zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDY6NDg6MzRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiArICogQGdldF92cV9zdGF0ZToJCUdldCB0aGUgc3RhdGUgZm9yIGEgdmlydHF1ZXVlCj4g
KyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKPiArICoJCQkJQGlkeDogdmlydHF1ZXVlIGlu
ZGV4Cj4gKyAqCQkJCVJldHVybnMgdmlydHF1ZXVlIHN0YXRlIChsYXN0X2F2YWlsX2lkeCkKPiAr
ICogQGdldF92cV9hbGlnbjoJCUdldCB0aGUgdmlydHF1ZXVlIGFsaWduIHJlcXVpcmVtZW50Cj4g
KyAqCQkJCWZvciB0aGUgZGV2aWNlCj4gKyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKPiAr
ICoJCQkJUmV0dXJucyB2aXJ0cXVldWUgYWxnaW4gcmVxdWlyZW1lbnQKPiArICogQGdldF9mZWF0
dXJlczoJCUdldCB2aXJ0aW8gZmVhdHVyZXMgc3VwcG9ydGVkIGJ5IHRoZSBkZXZpY2UKPiArICoJ
CQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQo+ICsgKgkJCQlSZXR1cm5zIHRoZSB2aXJ0aW8gZmVh
dHVyZXMgc3VwcG9ydCBieSB0aGUKPiArICoJCQkJZGV2aWNlCj4gKyAqIEBnZXRfZmVhdHVyZXM6
CQlTZXQgdmlydGlvIGZlYXR1cmVzIHN1cHBvcnRlZCBieSB0aGUgZHJpdmVyCgpzL2dldF9mZWF0
dXJlcy9zZXRfZmVhdHVyZXMvCgoKPiArICoJCQkJY29uZmlncmF0aW9uIHNwYWNlCj4gKyAqIEBn
ZXRfbWRldl9mZWF0dXJlczoJCUdldCB0aGUgZmVhdHVyZSBvZiB2aXJ0aW8gbWRldiBkZXZpY2UK
PiArICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQo+ICsgKgkJCQlSZXR1cm5zIHRoZSBtZGV2
IGZlYXR1cmVzIChBUEkpIHN1cHBvcnQgYnkKPiArICoJCQkJdGhlIGRldmljZS4KPiArICogQGdl
dF9nZW5lcmF0aW9uOgkJR2V0IGRldmljZSBnZW5lcmF0b24KPiArICoJCQkJQG1kZXY6IG1lZGlh
dGVkIGRldmljZQo+ICsgKgkJCQlSZXR1cm5zIHUzMjogZGV2aWNlIGdlbmVyYXRpb24KPiArICov
Cj4gK3N0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3BzIHsKPiArCS8qIFZpcnRxdWV1ZSBvcHMg
Ki8KPiArCWludCAoKnNldF92cV9hZGRyZXNzKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsCj4g
KwkJCSAgICAgIHUxNiBpZHgsIHU2NCBkZXNjX2FyZWEsIHU2NCBkcml2ZXJfYXJlYSwKPiArCQkJ
ICAgICAgdTY0IGRldmljZV9hcmVhKTsKPiArCXZvaWQgKCpzZXRfdnFfbnVtKShzdHJ1Y3QgbWRl
dl9kZXZpY2UgKm1kZXYsIHUxNiBpZHgsIHUzMiBudW0pOwo+ICsJdm9pZCAoKmtpY2tfdnEpKHN0
cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTE2IGlkeCk7Cj4gKwl2b2lkICgqc2V0X3ZxX2NiKShz
dHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZHgsCj4gKwkJCSAgc3RydWN0IHZpcnRpb19t
ZGV2X2NhbGxiYWNrICpjYik7Cj4gKwl2b2lkICgqc2V0X3ZxX3JlYWR5KShzdHJ1Y3QgbWRldl9k
ZXZpY2UgKm1kZXYsIHUxNiBpZHgsIGJvb2wgcmVhZHkpOwo+ICsJYm9vbCAoKmdldF92cV9yZWFk
eSkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1MTYgaWR4KTsKPiArCWludCAoKnNldF92cV9z
dGF0ZSkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1MTYgaWR4LCB1NjQgc3RhdGUpOwo+ICsJ
dTY0ICgqZ2V0X3ZxX3N0YXRlKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZHgpOwo+
ICsKPiArCS8qIERldmljZSBvcHMgKi8KPiArCXUxNiAoKmdldF92cV9hbGlnbikoc3RydWN0IG1k
ZXZfZGV2aWNlICptZGV2KTsKPiArCXU2NCAoKmdldF9mZWF0dXJlcykoc3RydWN0IG1kZXZfZGV2
aWNlICptZGV2KTsKPiArCWludCAoKnNldF9mZWF0dXJlcykoc3RydWN0IG1kZXZfZGV2aWNlICpt
ZGV2LCB1NjQgZmVhdHVyZXMpOwo+ICsJdm9pZCAoKnNldF9jb25maWdfY2IpKHN0cnVjdCBtZGV2
X2RldmljZSAqbWRldiwKPiArCQkJICAgICAgc3RydWN0IHZpcnRpb19tZGV2X2NhbGxiYWNrICpj
Yik7Cj4gKwl1MTYgKCpnZXRfdnFfbnVtX21heCkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsK
PiArCXUzMiAoKmdldF9kZXZpY2VfaWQpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldik7Cj4gKwl1
MzIgKCpnZXRfdmVuZG9yX2lkKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwo+ICsJdTggKCpn
ZXRfc3RhdHVzKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwo+ICsJdm9pZCAoKnNldF9zdGF0
dXMpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTggc3RhdHVzKTsKPiArCXZvaWQgKCpnZXRf
Y29uZmlnKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHVuc2lnbmVkIGludCBvZmZzZXQsCj4g
KwkJCSAgIHZvaWQgKmJ1ZiwgdW5zaWduZWQgaW50IGxlbik7Cj4gKwl2b2lkICgqc2V0X2NvbmZp
Zykoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAo+ICsJCQkg
ICBjb25zdCB2b2lkICpidWYsIHVuc2lnbmVkIGludCBsZW4pOwo+ICsJdTY0ICgqZ2V0X21kZXZf
ZmVhdHVyZXMpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldik7CgpEbyB3ZSBuZWVkIGEgLnNldF9t
ZGV2X2ZlYXR1cmVzIG1ldGhvZCBhcyB3ZWxsPwoKSXQncyBub3QgdmVyeSBjbGVhciB3aGF0IGRv
ZXMgbWRldl9mZWF0dXJlcyBtZWFuLgpEb2VzIGl0IG1lYW4gdGhlIHZob3N0IGJhY2tlbmQgZmVh
dHVyZXM/CgpodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi8wZTJhZGFiNmNm
Mjg1YzQxZTgyNWI2Yzc0YTNhYTYxMzI0ZDExMzJjL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5o
I0w5My1MOTQKCgo+ICsJdTMyICgqZ2V0X2dlbmVyYXRpb24pKHN0cnVjdCBtZGV2X2RldmljZSAq
bWRldik7Cj4gK307Cj4gKwo+ICt2b2lkIG1kZXZfc2V0X3ZpcnRpb19vcHMoc3RydWN0IG1kZXZf
ZGV2aWNlICptZGV2LAo+ICsJCQkgY29uc3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9vcHMg
KnZpcnRpb19vcHMpOwo+ICsKPiArI2VuZGlmCj4gLS0gCj4gMi4xOS4xCj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
