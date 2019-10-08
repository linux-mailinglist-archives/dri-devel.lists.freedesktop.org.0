Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829D1D080B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4166E914;
	Wed,  9 Oct 2019 07:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D666E10F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 12:43:19 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x98CefEN020734; Tue, 8 Oct 2019 14:43:09 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vegn0r90j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2019 14:43:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B1EB4100034;
 Tue,  8 Oct 2019 14:43:06 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8A61C2BC16D;
 Tue,  8 Oct 2019 14:43:06 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 8 Oct 2019
 14:43:06 +0200
Received: from localhost (10.201.20.122) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 8 Oct 2019 14:43:06
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <ville.syrjala@linux.intel.com>
Subject: [PATCH v2] drm: atomic helper: fix W=1 warnings
Date: Tue, 8 Oct 2019 14:42:54 +0200
Message-ID: <20191008124254.2144-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-08_05:2019-10-08,2019-10-08 signatures=0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=CYU1xh4x/15+0eiT1SpidubsI6JpkOmwy2DOuRIf9xs=;
 b=jp/vqwuDHm2N7FaOW7AyrwvRExI9ccdYVx9S5lKIOv957wQT7S14Gb2SHMQNmH7hAWuO
 9IYvQdW2zYVaOtu0KERNG4ViqiPZ3LTEwnFVbdF4/qy1n4OUwmj3u7I9lULufQS6qW1N
 ONbYEJwX8jJ46nJC033d2Ur8pM4JIU8KV7OuNB+zi/gnLs1nz6RvDmjaBMBaLRDiAyMW
 tz4rJMJCEseuGRqfz7rK1zx0S5vXR7v09UFBB6RtiGMS8wESapKLJVe5I0aTbleH6oP7
 WFNNEnz0QWGQN47NQMzwsz/iVhzjDcUjPJrlK7beZg2dCBCM+0MyTrSDvGZkH8QsTBnT tA== 
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RmV3IGZvcl9lYWNoIG1hY3JvIHNldCB2YXJpYWJsZXMgdGhhdCBhcmUgbmV2ZXIgdXNlZCBsYXRl
ciB3aGljaCBsZWQKdG8gZ2VuZXJhdGUgdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgd2FybmluZ3Mu
CkFkZCAodm9pZCkoZm9vKSBpbnNpZGUgdGhlIG1hY3JvcyB0byByZW1vdmUgdGhlc2Ugd2Fybmlu
Z3MKClNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBz
dC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oIHwgMTcgKysrKysrKysrKysrKyst
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9hdG9taWMuaCBiL2luY2x1ZGUvZHJtL2RybV9hdG9t
aWMuaAppbmRleCA5MjdlMTIwNWQ3YWEuLmI2YzczZmQ5ZjU1YSAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9kcm0vZHJtX2F0b21pYy5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9hdG9taWMuaApAQCAtNjkz
LDYgKzY5Myw3IEBAIHZvaWQgZHJtX3N0YXRlX2R1bXAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
c3RydWN0IGRybV9wcmludGVyICpwKTsKIAkgICAgIChfX2kpKyspCQkJCQkJCQlcCiAJCWZvcl9l
YWNoX2lmICgoX19zdGF0ZSktPmNvbm5lY3RvcnNbX19pXS5wdHIgJiYJCQlcCiAJCQkgICAgICgo
Y29ubmVjdG9yKSA9IChfX3N0YXRlKS0+Y29ubmVjdG9yc1tfX2ldLnB0ciwJXAorCQkJICAgICAo
dm9pZCkoY29ubmVjdG9yKSAvKiBPbmx5IHRvIGF2b2lkIHVudXNlZC1idXQtc2V0LXZhcmlhYmxl
IHdhcm5pbmcgKi8sIFwKIAkJCSAgICAgKG9sZF9jb25uZWN0b3Jfc3RhdGUpID0gKF9fc3RhdGUp
LT5jb25uZWN0b3JzW19faV0ub2xkX3N0YXRlLAlcCiAJCQkgICAgIChuZXdfY29ubmVjdG9yX3N0
YXRlKSA9IChfX3N0YXRlKS0+Y29ubmVjdG9yc1tfX2ldLm5ld19zdGF0ZSwgMSkpCiAKQEAgLTcx
NCw2ICs3MTUsNyBAQCB2b2lkIGRybV9zdGF0ZV9kdW1wKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
IHN0cnVjdCBkcm1fcHJpbnRlciAqcCk7CiAJICAgICAoX19pKSsrKQkJCQkJCQkJXAogCQlmb3Jf
ZWFjaF9pZiAoKF9fc3RhdGUpLT5jb25uZWN0b3JzW19faV0ucHRyICYmCQkJXAogCQkJICAgICAo
KGNvbm5lY3RvcikgPSAoX19zdGF0ZSktPmNvbm5lY3RvcnNbX19pXS5wdHIsCVwKKwkJCSAgICAg
KHZvaWQpKGNvbm5lY3RvcikgLyogT25seSB0byBhdm9pZCB1bnVzZWQtYnV0LXNldC12YXJpYWJs
ZSB3YXJuaW5nICovLCBcCiAJCQkgICAgIChvbGRfY29ubmVjdG9yX3N0YXRlKSA9IChfX3N0YXRl
KS0+Y29ubmVjdG9yc1tfX2ldLm9sZF9zdGF0ZSwgMSkpCiAKIC8qKgpAQCAtNzM0LDcgKzczNiw5
IEBAIHZvaWQgZHJtX3N0YXRlX2R1bXAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRy
bV9wcmludGVyICpwKTsKIAkgICAgIChfX2kpKyspCQkJCQkJCQlcCiAJCWZvcl9lYWNoX2lmICgo
X19zdGF0ZSktPmNvbm5lY3RvcnNbX19pXS5wdHIgJiYJCQlcCiAJCQkgICAgICgoY29ubmVjdG9y
KSA9IChfX3N0YXRlKS0+Y29ubmVjdG9yc1tfX2ldLnB0ciwJXAotCQkJICAgICAobmV3X2Nvbm5l
Y3Rvcl9zdGF0ZSkgPSAoX19zdGF0ZSktPmNvbm5lY3RvcnNbX19pXS5uZXdfc3RhdGUsIDEpKQor
CQkJICAgICAodm9pZCkoY29ubmVjdG9yKSAvKiBPbmx5IHRvIGF2b2lkIHVudXNlZC1idXQtc2V0
LXZhcmlhYmxlIHdhcm5pbmcgKi8sIFwKKwkJCSAgICAgKG5ld19jb25uZWN0b3Jfc3RhdGUpID0g
KF9fc3RhdGUpLT5jb25uZWN0b3JzW19faV0ubmV3X3N0YXRlLCBcCisJCQkgICAgICh2b2lkKShu
ZXdfY29ubmVjdG9yX3N0YXRlKSAvKiBPbmx5IHRvIGF2b2lkIHVudXNlZC1idXQtc2V0LXZhcmlh
YmxlIHdhcm5pbmcgKi8sIDEpKQogCiAvKioKICAqIGZvcl9lYWNoX29sZG5ld19jcnRjX2luX3N0
YXRlIC0gaXRlcmF0ZSBvdmVyIGFsbCBDUlRDcyBpbiBhbiBhdG9taWMgdXBkYXRlCkBAIC03NTQs
NyArNzU4LDkgQEAgdm9pZCBkcm1fc3RhdGVfZHVtcChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBz
dHJ1Y3QgZHJtX3ByaW50ZXIgKnApOwogCSAgICAgKF9faSkrKykJCQkJCQkJXAogCQlmb3JfZWFj
aF9pZiAoKF9fc3RhdGUpLT5jcnRjc1tfX2ldLnB0ciAmJgkJXAogCQkJICAgICAoKGNydGMpID0g
KF9fc3RhdGUpLT5jcnRjc1tfX2ldLnB0ciwJXAorCQkJICAgICAgKHZvaWQpKGNydGMpIC8qIE9u
bHkgdG8gYXZvaWQgdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgd2FybmluZyAqLywgXAogCQkJICAg
ICAob2xkX2NydGNfc3RhdGUpID0gKF9fc3RhdGUpLT5jcnRjc1tfX2ldLm9sZF9zdGF0ZSwgXAor
CQkJICAgICAodm9pZCkob2xkX2NydGNfc3RhdGUpIC8qIE9ubHkgdG8gYXZvaWQgdW51c2VkLWJ1
dC1zZXQtdmFyaWFibGUgd2FybmluZyAqLywgXAogCQkJICAgICAobmV3X2NydGNfc3RhdGUpID0g
KF9fc3RhdGUpLT5jcnRjc1tfX2ldLm5ld19zdGF0ZSwgMSkpCiAKIC8qKgpAQCAtNzkzLDcgKzc5
OSw5IEBAIHZvaWQgZHJtX3N0YXRlX2R1bXAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0
IGRybV9wcmludGVyICpwKTsKIAkgICAgIChfX2kpKyspCQkJCQkJCVwKIAkJZm9yX2VhY2hfaWYg
KChfX3N0YXRlKS0+Y3J0Y3NbX19pXS5wdHIgJiYJCVwKIAkJCSAgICAgKChjcnRjKSA9IChfX3N0
YXRlKS0+Y3J0Y3NbX19pXS5wdHIsCVwKLQkJCSAgICAgKG5ld19jcnRjX3N0YXRlKSA9IChfX3N0
YXRlKS0+Y3J0Y3NbX19pXS5uZXdfc3RhdGUsIDEpKQorCQkJICAgICAodm9pZCkoY3J0YykgLyog
T25seSB0byBhdm9pZCB1bnVzZWQtYnV0LXNldC12YXJpYWJsZSB3YXJuaW5nICovLCBcCisJCQkg
ICAgIChuZXdfY3J0Y19zdGF0ZSkgPSAoX19zdGF0ZSktPmNydGNzW19faV0ubmV3X3N0YXRlLCBc
CisJCQkgICAgICh2b2lkKShuZXdfY3J0Y19zdGF0ZSkgLyogT25seSB0byBhdm9pZCB1bnVzZWQt
YnV0LXNldC12YXJpYWJsZSB3YXJuaW5nICovLCAxKSkKIAogLyoqCiAgKiBmb3JfZWFjaF9vbGRu
ZXdfcGxhbmVfaW5fc3RhdGUgLSBpdGVyYXRlIG92ZXIgYWxsIHBsYW5lcyBpbiBhbiBhdG9taWMg
dXBkYXRlCkBAIC04MTMsNiArODIxLDcgQEAgdm9pZCBkcm1fc3RhdGVfZHVtcChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnApOwogCSAgICAgKF9faSkrKykJCQkJ
CQkJXAogCQlmb3JfZWFjaF9pZiAoKF9fc3RhdGUpLT5wbGFuZXNbX19pXS5wdHIgJiYJCVwKIAkJ
CSAgICAgKChwbGFuZSkgPSAoX19zdGF0ZSktPnBsYW5lc1tfX2ldLnB0ciwJXAorCQkJICAgICAg
KHZvaWQpKHBsYW5lKSAvKiBPbmx5IHRvIGF2b2lkIHVudXNlZC1idXQtc2V0LXZhcmlhYmxlIHdh
cm5pbmcgKi8sIFwKIAkJCSAgICAgIChvbGRfcGxhbmVfc3RhdGUpID0gKF9fc3RhdGUpLT5wbGFu
ZXNbX19pXS5vbGRfc3RhdGUsXAogCQkJICAgICAgKG5ld19wbGFuZV9zdGF0ZSkgPSAoX19zdGF0
ZSktPnBsYW5lc1tfX2ldLm5ld19zdGF0ZSwgMSkpCiAKQEAgLTg3Myw3ICs4ODIsOSBAQCB2b2lk
IGRybV9zdGF0ZV9kdW1wKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fcHJpbnRl
ciAqcCk7CiAJICAgICAoX19pKSsrKQkJCQkJCQlcCiAJCWZvcl9lYWNoX2lmICgoX19zdGF0ZSkt
PnBsYW5lc1tfX2ldLnB0ciAmJgkJXAogCQkJICAgICAoKHBsYW5lKSA9IChfX3N0YXRlKS0+cGxh
bmVzW19faV0ucHRyLAlcCi0JCQkgICAgICAobmV3X3BsYW5lX3N0YXRlKSA9IChfX3N0YXRlKS0+
cGxhbmVzW19faV0ubmV3X3N0YXRlLCAxKSkKKwkJCSAgICAgICh2b2lkKShwbGFuZSkgLyogT25s
eSB0byBhdm9pZCB1bnVzZWQtYnV0LXNldC12YXJpYWJsZSB3YXJuaW5nICovLCBcCisJCQkgICAg
ICAobmV3X3BsYW5lX3N0YXRlKSA9IChfX3N0YXRlKS0+cGxhbmVzW19faV0ubmV3X3N0YXRlLCBc
CisJCQkgICAgICAodm9pZCkobmV3X3BsYW5lX3N0YXRlKSAvKiBPbmx5IHRvIGF2b2lkIHVudXNl
ZC1idXQtc2V0LXZhcmlhYmxlIHdhcm5pbmcgKi8sIDEpKQogCiAvKioKICAqIGZvcl9lYWNoX29s
ZG5ld19wcml2YXRlX29ial9pbl9zdGF0ZSAtIGl0ZXJhdGUgb3ZlciBhbGwgcHJpdmF0ZSBvYmpl
Y3RzIGluIGFuIGF0b21pYyB1cGRhdGUKLS0gCjIuMTUuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
