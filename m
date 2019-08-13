Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C298E6BE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C026E8F6;
	Thu, 15 Aug 2019 08:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77906E0EF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 11:03:49 +0000 (UTC)
Received: by mail-qt1-x84a.google.com with SMTP id 41so93679536qtm.4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=8XQAtQU5Jlu+LsGTeIXfkeaCQsZPIsgrkBYJbMGoesk=;
 b=JFe3WsyopcIZtTBiQtYHBao+Udp1c/OlBUm6fPMqutlTj4kOpePDizoAUvefzabg9q
 UfnO0F4FMd4uscV57szy4/TL5yxUJCT6KIA/CzBcz/jGrfzuSI/g5VkdamNkW7GhfMBr
 8j3YTefAWs7NogSnIkSyPRj04tL4SWp5CHJNpVd7q7aU/IK0WPLNSDKpKvRDT2nhIRSY
 UgZYpDgwlr6SbMs/hTKSIqRiaLz5btCx/Fd5ylYWOoFmjb791T14xjqMOQWpOH11AW1j
 ZLh1VVqsEtuMMHcOPtL/4qBwPzVKh3AtrgsYuPSGNbh5Hg886rl0fva3N/1nrDK2wTT1
 oFpQ==
X-Gm-Message-State: APjAAAWkDmPYB+qVjkdLrH/e3cbzWpG9clGmmFK7E7KCGhq9r8lQ5RuR
 epVPc0Vn2AbdCfAsRUqAuox6syutSa73a81LL3yat6Wo6E4GZ+9qmcK4M/yg6CWegr6M52nQc35
 61dIxDyg9EsZEXNu9NVJYnLPbGaYp2mFjeK6+T5vPmyVsXNfdgK982GJ+1VL8HvVc/03ftnbLAA
 ==
X-Google-Smtp-Source: APXvYqyDDzweTJoOpSrCJBhYFA2bPdcntFbwhRbcFvhSWKkyE6mKScSn8KJ6qn2GtAZSopDoFcKlju1Uov8=
X-Received: by 2002:ae9:f812:: with SMTP id x18mr26524005qkh.290.1565694228612; 
 Tue, 13 Aug 2019 04:03:48 -0700 (PDT)
Date: Tue, 13 Aug 2019 13:02:34 +0200
In-Reply-To: <20190813110300.83025-1-darekm@google.com>
Message-Id: <20190813110300.83025-3-darekm@google.com>
Mime-Version: 1.0
References: <20190813110300.83025-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v6 2/8] dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
From: Dariusz Marcinkiewicz <darekm@google.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 hverkuil-cisco@xs4all.nl
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=8XQAtQU5Jlu+LsGTeIXfkeaCQsZPIsgrkBYJbMGoesk=;
 b=WONVccTIDftVGDULY91dHjvEzbQk3VhS9tlpsFUt/enibyOhbHo3b0DFcLewogMBDc
 xloAzgsKjOvC4JHqImA6XZqZ9jRNJ5EK4ZOiClT3bWa5BIHWdOsUPHw3sAG+6mNN+Wfu
 U8Abd4dxv6ucp2qlfEgK5xSyVYx2UF+yjDweJ+zWobe6kv0lykLYshfNTbDfIMe1Hfxn
 b+h7b0wcWnyH7KRBwS/M5bb+p26QB/Lh2KK1QgTroLTD2RlwxcRwJaSIJglkwTT8ESJp
 jRZAETsPoZjKR9LScyy1NPY89PdS90jvaEbg1HjVQGGD98Z3zzDrfnyPal6oeYj+jqDh
 +eyw==
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dariusz Marcinkiewicz <darekm@google.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBuZXcgY2VjX25vdGlmaWVyX2NlY19hZGFwXyh1bilyZWdpc3RlcigpIGZ1bmN0aW9u
cyB0bwoodW4pcmVnaXN0ZXIgdGhlIG5vdGlmaWVyIGZvciB0aGUgQ0VDIGFkYXB0ZXIuCgpBbHNv
IGFkZHMgQ0VDX0NBUF9DT05ORUNUT1JfSU5GTyBjYXBhYmlsaXR5IHRvIHRoZSBhZGFwdGVyLgoK
Q2hhbmdlcyBzaW5jZSB2MzoKCS0gYWRkIENFQ19DQVBfQ09OTkVDVE9SX0lORk8gdG8gY2VjX2Fs
bG9jYXRlX2FkYXB0ZXIsCgktIHJlcGxhY2UgQ0VDX0NBUF9MT0dfQUREUlMgfCBDRUNfQ0FQX1RS
QU5TTUlUIHwKCUNFQ19DQVBfUkMgfCBDRUNfQ0FQX1BBU1NUSFJPVUdIIHdpdGggQ0VDX0NBUF9E
RUZBVUxUUy4KClNpZ25lZC1vZmYtYnk6IERhcml1c3ogTWFyY2lua2lld2ljeiA8ZGFyZWttQGdv
b2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0
YWxsLm5sPgpUZXN0ZWQtYnk6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5s
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1jZWMuYyB8IDEz
ICsrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1o
ZG1pLWNlYy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWNlYy5j
CmluZGV4IDBmOTQ5OTc4ZDNmY2QuLmFjMWUwMDFkMDg4MjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1jZWMuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktY2VjLmMKQEAgLTI1Niw4ICsyNTYsOCBAQCBzdGF0
aWMgaW50IGR3X2hkbWlfY2VjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJ
ZHdfaGRtaV93cml0ZShjZWMsIDAsIEhETUlfQ0VDX1BPTEFSSVRZKTsKIAogCWNlYy0+YWRhcCA9
IGNlY19hbGxvY2F0ZV9hZGFwdGVyKCZkd19oZG1pX2NlY19vcHMsIGNlYywgImR3X2hkbWkiLAot
CQkJCQkgQ0VDX0NBUF9MT0dfQUREUlMgfCBDRUNfQ0FQX1RSQU5TTUlUIHwKLQkJCQkJIENFQ19D
QVBfUkMgfCBDRUNfQ0FQX1BBU1NUSFJPVUdILAorCQkJCQkgQ0VDX0NBUF9ERUZBVUxUUyB8CisJ
CQkJCSBDRUNfQ0FQX0NPTk5FQ1RPUl9JTkZPLAogCQkJCQkgQ0VDX01BWF9MT0dfQUREUlMpOwog
CWlmIChJU19FUlIoY2VjLT5hZGFwKSkKIAkJcmV0dXJuIFBUUl9FUlIoY2VjLT5hZGFwKTsKQEAg
LTI3OCwxMyArMjc4LDE0IEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9jZWNfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAocmV0IDwgMCkKIAkJcmV0dXJuIHJldDsKIAotCWNl
Yy0+bm90aWZ5ID0gY2VjX25vdGlmaWVyX2dldChwZGV2LT5kZXYucGFyZW50KTsKKwljZWMtPm5v
dGlmeSA9IGNlY19ub3RpZmllcl9jZWNfYWRhcF9yZWdpc3RlcihwZGV2LT5kZXYucGFyZW50LAor
CQkJCQkJICAgICBOVUxMLCBjZWMtPmFkYXApOwogCWlmICghY2VjLT5ub3RpZnkpCiAJCXJldHVy
biAtRU5PTUVNOwogCiAJcmV0ID0gY2VjX3JlZ2lzdGVyX2FkYXB0ZXIoY2VjLT5hZGFwLCBwZGV2
LT5kZXYucGFyZW50KTsKIAlpZiAocmV0IDwgMCkgewotCQljZWNfbm90aWZpZXJfcHV0KGNlYy0+
bm90aWZ5KTsKKwkJY2VjX25vdGlmaWVyX2NlY19hZGFwX3VucmVnaXN0ZXIoY2VjLT5ub3RpZnkp
OwogCQlyZXR1cm4gcmV0OwogCX0KIApAQCAtMjk0LDggKzI5NSw2IEBAIHN0YXRpYyBpbnQgZHdf
aGRtaV9jZWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkgKi8KIAlkZXZt
X3JlbW92ZV9hY3Rpb24oJnBkZXYtPmRldiwgZHdfaGRtaV9jZWNfZGVsLCBjZWMpOwogCi0JY2Vj
X3JlZ2lzdGVyX2NlY19ub3RpZmllcihjZWMtPmFkYXAsIGNlYy0+bm90aWZ5KTsKLQogCXJldHVy
biAwOwogfQogCkBAIC0zMDMsOCArMzAyLDggQEAgc3RhdGljIGludCBkd19oZG1pX2NlY19yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgZHdfaGRtaV9jZWMg
KmNlYyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCisJY2VjX25vdGlmaWVyX2NlY19h
ZGFwX3VucmVnaXN0ZXIoY2VjLT5ub3RpZnkpOwogCWNlY191bnJlZ2lzdGVyX2FkYXB0ZXIoY2Vj
LT5hZGFwKTsKLQljZWNfbm90aWZpZXJfcHV0KGNlYy0+bm90aWZ5KTsKIAogCXJldHVybiAwOwog
fQotLSAKMi4yMy4wLnJjMS4xNTMuZ2RlZWQ4MDMzMGYtZ29vZwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
