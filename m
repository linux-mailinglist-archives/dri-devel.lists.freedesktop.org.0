Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FA1103027
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912CD6E9F4;
	Tue, 19 Nov 2019 23:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 605 seconds by postgrey-1.36 at gabe;
 Tue, 19 Nov 2019 14:27:52 UTC
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F0D6E060
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 14:27:52 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 2/6] gpu/drm: ingenic: Avoid null pointer deference in plane
 atomic update
Date: Tue, 19 Nov 2019 15:17:32 +0100
Message-Id: <20191119141736.74607-2-paul@crapouillou.net>
In-Reply-To: <20191119141736.74607-1-paul@crapouillou.net>
References: <20191119141736.74607-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1574173065; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MQ6ngIJWRLOuCG2cCCxYITwp5Aw0SISHe37jQ3RI/Pw=;
 b=SiFDBZHxjXdT1eI0TcxM94DEsZd4E8+JXQ04hm8SG9wAVuYKPITQfTvTLM/zKWBI7YVXFw
 dDlgmHlDctrIE2GsVuGcRPlU1x7rAZ3fOEq+H4SSJmfA31tnn/ue9ou5UBw4rxD6rhj4q6
 ye6BlbGju0I/3eFJunLnjDm2N29zdMA=
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgaXMgcG9zc2libGUgdGhhdCB0aGVyZSBpcyBubyBkcm1fZnJhbWVidWZmZXIgYXNzb2NpYXRl
ZCB3aXRoIGEgZ2l2ZW4KcGxhbmUgc3RhdGUuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWls
IDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdl
bmljLWRybS5jIHwgMTUgKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbmdl
bmljL2luZ2VuaWMtZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5j
CmluZGV4IDJlMmVkNjUzZTljNi4uNmRjNGIwNmU3ZTY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmlj
L2luZ2VuaWMtZHJtLmMKQEAgLTM3MSwxNCArMzcxLDE3IEBAIHN0YXRpYyB2b2lkIGluZ2VuaWNf
ZHJtX3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJc3RydWN0
IGluZ2VuaWNfZHJtICpwcml2ID0gZHJtX3BsYW5lX2dldF9wcml2KHBsYW5lKTsKIAlzdHJ1Y3Qg
ZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSA9IHBsYW5lLT5zdGF0ZTsKIAl1bnNpZ25lZCBpbnQgd2lk
dGgsIGhlaWdodCwgY3BwOworCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gc3RhdGUtPmZi
OwogCi0Jd2lkdGggPSBzdGF0ZS0+Y3J0Yy0+c3RhdGUtPmFkanVzdGVkX21vZGUuaGRpc3BsYXk7
Ci0JaGVpZ2h0ID0gc3RhdGUtPmNydGMtPnN0YXRlLT5hZGp1c3RlZF9tb2RlLnZkaXNwbGF5Owot
CWNwcCA9IHN0YXRlLT5mYi0+Zm9ybWF0LT5jcHBbcGxhbmUtPmluZGV4XTsKKwlpZiAoZmIpIHsK
KwkJd2lkdGggPSBzdGF0ZS0+Y3J0Yy0+c3RhdGUtPmFkanVzdGVkX21vZGUuaGRpc3BsYXk7CisJ
CWhlaWdodCA9IHN0YXRlLT5jcnRjLT5zdGF0ZS0+YWRqdXN0ZWRfbW9kZS52ZGlzcGxheTsKKwkJ
Y3BwID0gZmItPmZvcm1hdC0+Y3BwW3BsYW5lLT5pbmRleF07CiAKLQlwcml2LT5kbWFfaHdkZXNj
LT5hZGRyID0gZHJtX2ZiX2NtYV9nZXRfZ2VtX2FkZHIoc3RhdGUtPmZiLCBzdGF0ZSwgMCk7Ci0J
cHJpdi0+ZG1hX2h3ZGVzYy0+Y21kID0gd2lkdGggKiBoZWlnaHQgKiBjcHAgLyA0OwotCXByaXYt
PmRtYV9od2Rlc2MtPmNtZCB8PSBKWl9MQ0RfQ01EX0VPRl9JUlE7CisJCXByaXYtPmRtYV9od2Rl
c2MtPmFkZHIgPSBkcm1fZmJfY21hX2dldF9nZW1fYWRkcihmYiwgc3RhdGUsIDApOworCQlwcml2
LT5kbWFfaHdkZXNjLT5jbWQgPSB3aWR0aCAqIGhlaWdodCAqIGNwcCAvIDQ7CisJCXByaXYtPmRt
YV9od2Rlc2MtPmNtZCB8PSBKWl9MQ0RfQ01EX0VPRl9JUlE7CisJfQogfQogCiBzdGF0aWMgdm9p
ZCBpbmdlbmljX2RybV9lbmNvZGVyX2F0b21pY19tb2RlX3NldChzdHJ1Y3QgZHJtX2VuY29kZXIg
KmVuY29kZXIsCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
