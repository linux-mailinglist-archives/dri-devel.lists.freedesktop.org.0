Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7E023B2F5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A69A6E3B8;
	Tue,  4 Aug 2020 02:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B2A6E3BB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:57:44 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-Qu_lPv7SONmZsAiH5cTlhw-1; Mon, 03 Aug 2020 22:57:41 -0400
X-MC-Unique: Qu_lPv7SONmZsAiH5cTlhw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A425A8017FB;
 Tue,  4 Aug 2020 02:57:40 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04AFF8AD1C;
 Tue,  4 Aug 2020 02:57:38 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 24/59] drm/ttm: pass man around instead of mem_type in some
 places
Date: Tue,  4 Aug 2020 12:55:57 +1000
Message-Id: <20200804025632.3868079-25-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClRoaXMgbWFrZXMgaXQgZWFz
aWVyIHRvIGNsZWFudXAgdGhpbmdzCgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGll
ZEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAxNCArKysr
KystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCBkYTg4ZWE2Y2I4MTQuLmFmMWIxYzNmNmVkMiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jCkBAIC03NjksMTMgKzc2OSwxMiBAQCBzdGF0aWMgaW50IHR0bV9tZW1f
ZXZpY3Rfd2FpdF9idXN5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYnVzeV9ibywKIH0KIAog
c3RhdGljIGludCB0dG1fbWVtX2V2aWN0X2ZpcnN0KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2
LAotCQkJICAgICAgIHVpbnQzMl90IG1lbV90eXBlLAorCQkJICAgICAgIHN0cnVjdCB0dG1fbWVt
X3R5cGVfbWFuYWdlciAqbWFuLAogCQkJICAgICAgIGNvbnN0IHN0cnVjdCB0dG1fcGxhY2UgKnBs
YWNlLAogCQkJICAgICAgIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4LAogCQkJICAgICAg
IHN0cnVjdCB3d19hY3F1aXJlX2N0eCAqdGlja2V0KQogewogCXN0cnVjdCB0dG1fYnVmZmVyX29i
amVjdCAqYm8gPSBOVUxMLCAqYnVzeV9ibyA9IE5VTEw7Ci0Jc3RydWN0IHR0bV9tZW1fdHlwZV9t
YW5hZ2VyICptYW4gPSAmYmRldi0+bWFuW21lbV90eXBlXTsKIAlib29sIGxvY2tlZCA9IGZhbHNl
OwogCXVuc2lnbmVkIGk7CiAJaW50IHJldDsKQEAgLTkyNCw3ICs5MjMsNyBAQCBzdGF0aWMgaW50
IHR0bV9ib19tZW1fZm9yY2Vfc3BhY2Uoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkJ
CWJyZWFrOwogCQlpZiAodW5saWtlbHkocmV0ICE9IC1FTk9TUEMpKQogCQkJcmV0dXJuIHJldDsK
LQkJcmV0ID0gdHRtX21lbV9ldmljdF9maXJzdChiZGV2LCBtZW0tPm1lbV90eXBlLCBwbGFjZSwg
Y3R4LAorCQlyZXQgPSB0dG1fbWVtX2V2aWN0X2ZpcnN0KGJkZXYsIG1hbiwgcGxhY2UsIGN0eCwK
IAkJCQkJICB0aWNrZXQpOwogCQlpZiAodW5saWtlbHkocmV0ICE9IDApKQogCQkJcmV0dXJuIHJl
dDsKQEAgLTE0MDksMTQgKzE0MDgsMTMgQEAgaW50IHR0bV9ib19jcmVhdGUoc3RydWN0IHR0bV9i
b19kZXZpY2UgKmJkZXYsCiBFWFBPUlRfU1lNQk9MKHR0bV9ib19jcmVhdGUpOwogCiBzdGF0aWMg
aW50IHR0bV9ib19mb3JjZV9saXN0X2NsZWFuKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAot
CQkJCSAgIHVuc2lnbmVkIG1lbV90eXBlKQorCQkJCSAgIHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFu
YWdlciAqbWFuKQogewogCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBjdHggPSB7CiAJCS5pbnRl
cnJ1cHRpYmxlID0gZmFsc2UsCiAJCS5ub193YWl0X2dwdSA9IGZhbHNlLAogCQkuZmxhZ3MgPSBU
VE1fT1BUX0ZMQUdfRk9SQ0VfQUxMT0MKIAl9OwotCXN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdl
ciAqbWFuID0gJmJkZXYtPm1hblttZW1fdHlwZV07CiAJc3RydWN0IHR0bV9ib19nbG9iYWwgKmds
b2IgPSAmdHRtX2JvX2dsb2I7CiAJc3RydWN0IGRtYV9mZW5jZSAqZmVuY2U7CiAJaW50IHJldDsK
QEAgLTE0MzAsNyArMTQyOCw3IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2ZvcmNlX2xpc3RfY2xlYW4o
c3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJZm9yIChpID0gMDsgaSA8IFRUTV9NQVhfQk9f
UFJJT1JJVFk7ICsraSkgewogCQl3aGlsZSAoIWxpc3RfZW1wdHkoJm1hbi0+bHJ1W2ldKSkgewog
CQkJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsKLQkJCXJldCA9IHR0bV9tZW1fZXZpY3Rf
Zmlyc3QoYmRldiwgbWVtX3R5cGUsIE5VTEwsICZjdHgsCisJCQlyZXQgPSB0dG1fbWVtX2V2aWN0
X2ZpcnN0KGJkZXYsIG1hbiwgTlVMTCwgJmN0eCwKIAkJCQkJCSAgTlVMTCk7CiAJCQlpZiAocmV0
KQogCQkJCXJldHVybiByZXQ7CkBAIC0xNDc1LDcgKzE0NzMsNyBAQCBpbnQgdHRtX2JvX2NsZWFu
X21tKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1bnNpZ25lZCBtZW1fdHlwZSkKIAogCXJl
dCA9IDA7CiAJaWYgKG1lbV90eXBlID4gMCkgewotCQlyZXQgPSB0dG1fYm9fZm9yY2VfbGlzdF9j
bGVhbihiZGV2LCBtZW1fdHlwZSk7CisJCXJldCA9IHR0bV9ib19mb3JjZV9saXN0X2NsZWFuKGJk
ZXYsIG1hbik7CiAJCWlmIChyZXQpIHsKIAkJCXByX2VycigiQ2xlYW51cCBldmljdGlvbiBmYWls
ZWRcbiIpOwogCQkJcmV0dXJuIHJldDsKQEAgLTE1MDUsNyArMTUwMyw3IEBAIGludCB0dG1fYm9f
ZXZpY3RfbW0oc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVuc2lnbmVkIG1lbV90eXBlKQog
CQlyZXR1cm4gMDsKIAl9CiAKLQlyZXR1cm4gdHRtX2JvX2ZvcmNlX2xpc3RfY2xlYW4oYmRldiwg
bWVtX3R5cGUpOworCXJldHVybiB0dG1fYm9fZm9yY2VfbGlzdF9jbGVhbihiZGV2LCBtYW4pOwog
fQogRVhQT1JUX1NZTUJPTCh0dG1fYm9fZXZpY3RfbW0pOwogCi0tIAoyLjI2LjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
