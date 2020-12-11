Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6146A2D93E9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695816E07F;
	Mon, 14 Dec 2020 08:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978566E203
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 19:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=HBfnftZnbBrqQ2L8AVQLmkUI6WPMZLgfMtK+X7BxoY8=; b=HhzXululOSOrfvp/5YAOmPtSYq
 Kknf7NDUIJ8zqpvoHdy/Sj9Qsqc6FB0Kzf9iV9JR+K72F2AuOAVD2FzdsSzP/0rZxWImjIFDbY9YD
 EZYIe8VF0oTe/fPNAzMvQShkoFkY7kGDl8sAl2q6A4WWSS2VsE/JMijPnamd030yjtG5Ecr+ii4Of
 WQ8mfaiiYZ3ZptXiLmYi9BHV4Ymno7gPWn6n+FqeRTMIvJS/UVZKqjuY6CceaOtD8iG9TzTrULsgA
 ibXM0NsfbXMgqMWvaDqZbnFZfPUN5JAvny0SyF3khm2I10p6gDDNwl6HjJEbY02KcM7JBvKLVRZuN
 0B/t38Xg==;
Received: from [2601:1c0:6280:3f0::1494] (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knoOD-0008PD-Te; Fri, 11 Dec 2020 19:47:42 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next] drm/rockchip: cdn-dp-core: fix function not used when
 not PM_SLEEP
Date: Fri, 11 Dec 2020 11:47:36 -0800
Message-Id: <20201211194736.7908-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:41 +0000
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IGJ1aWxkIHdhcm5pbmcgd2hlbiBDT05GSUdfUE1fU0xFRVAgaXMgbm90IGVuYWJsZWQuCgou
Li9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLWNvcmUuYzoxMTI0OjEyOiB3YXJuaW5n
OiDigJhjZG5fZHBfcmVzdW1l4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1mdW5j
dGlvbl0KIHN0YXRpYyBpbnQgY2RuX2RwX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCgpGaXhl
czogN2M0OWFiYjRjMmY4ICgiZHJtL3JvY2tjaGlwOiBjZG4tZHAtY29yZTogTWFrZSBjZG5fZHBf
Y29yZV9zdXNwZW5kL3Jlc3VtZSBzdGF0aWMiKQpTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAg
PHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KQ2M6IFNhbmR5IEh1YW5nIDxoamNAcm9jay1jaGlwcy5j
b20+CkNjOiBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPgpDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9jZG4tZHAtY29yZS5jIHwgICAgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQoKLS0tIGxpbnV4LW5leHQtMjAyMDEyMTAub3JpZy9kcml2ZXJzL2dwdS9kcm0vcm9j
a2NoaXAvY2RuLWRwLWNvcmUuYworKysgbGludXgtbmV4dC0yMDIwMTIxMC9kcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvY2RuLWRwLWNvcmUuYwpAQCAtMTEyMSw2ICsxMTIxLDcgQEAgc3RhdGljIGlu
dCBjZG5fZHBfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlCiAJcmV0dXJuIHJldDsKIH0KIAorI2lmZGVm
IENPTkZJR19QTV9TTEVFUAogc3RhdGljIGludCBjZG5fZHBfcmVzdW1lKHN0cnVjdCBkZXZpY2Ug
KmRldikKIHsKIAlzdHJ1Y3QgY2RuX2RwX2RldmljZSAqZHAgPSBkZXZfZ2V0X2RydmRhdGEoZGV2
KTsKQEAgLTExMzMsNiArMTEzNCw3IEBAIHN0YXRpYyBpbnQgY2RuX2RwX3Jlc3VtZShzdHJ1Y3Qg
ZGV2aWNlICoKIAogCXJldHVybiAwOwogfQorI2VuZGlmCiAKIHN0YXRpYyBpbnQgY2RuX2RwX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
