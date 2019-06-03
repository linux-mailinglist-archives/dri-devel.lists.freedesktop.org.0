Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20697325B8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 02:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF34F897C8;
	Mon,  3 Jun 2019 00:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB46E897C8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 00:40:28 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id s57so376410qte.8
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2019 17:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sbi5g+zu+1YF3iHGyrsGAgMJlNj3i2840gu1pAJKyYY=;
 b=kT7lL37IL0jTLC/sWStX7FtcphusZi0MvNHfP8/113kOiMyzxBy9pMMKMpDWvV+Qpc
 nzua3ti0VSP8WVUP6S1ocG6Qb2WngYs78zRp4a1CgiTN72my8PTGCDwDlI2MpdWuURON
 JHaq/xEuLZ6NHO3uUBxamD+xybJNEisxRjq8DbHi7+/f5X/GdwkftoCyXvLNvg81SJXK
 4JWn36Lew8+UpEq78C0ttA7EOriJZgJt+wflVpQ7cT0TcIE/M0/CodzGO5epEImcBF0t
 f/DL/vd9wcsrwygoyHBalZdYPNy0SCH4wEBhvUZWV6g/DKVqmojswClMGPE09HAkqn2k
 FcdQ==
X-Gm-Message-State: APjAAAV+9XDtJWAjoiMgw75nL3LQeERKcrErRq/6GDtpqqOHHUggL3tG
 wM1CceIXBvdqE049Mz3/9so0YeJFsYY=
X-Google-Smtp-Source: APXvYqxqSh628yfh64NLhxk+mPVIsmdm0l4RmMq0TlfQJLI8nwChLYIdm0nNeCPvAXK2KDhnuySv1Q==
X-Received: by 2002:ac8:2454:: with SMTP id d20mr20443776qtd.266.1559522427705; 
 Sun, 02 Jun 2019 17:40:27 -0700 (PDT)
Received: from athos.fios-router.home
 (pool-173-68-20-215.nycmny.fios.verizon.net. [173.68.20.215])
 by smtp.gmail.com with ESMTPSA id t8sm1432609qtc.80.2019.06.02.17.40.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 17:40:27 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 02/10] util: fix MAKE_RGBA macro for 10bpp modes
Date: Sun,  2 Jun 2019 20:40:10 -0400
Message-Id: <20190603004017.7114-3-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603004017.7114-1-imirkin@alum.mit.edu>
References: <20190603004017.7114-1-imirkin@alum.mit.edu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sbi5g+zu+1YF3iHGyrsGAgMJlNj3i2840gu1pAJKyYY=;
 b=in74wzX28yYO6R8SGDWtah9NzId5JwkvlqDUJeU5jYu4zJF4NVMnKE84T4qcsa/8iJ
 fcTeMY3I/fKo9H6IJ4XMwKbUI064zbm9jWHoRtIdPn3v9hz0lFsflkEQpiFowbj7mrUM
 dWmU6PmugMbL17/F1LpDFhtbfcOtRfa3hlDtfJL6mGSHBv1v+U/GLteFl/FvkYC9ZdJ3
 3eiIu7RJyA+/Bx2fDh5J4HSkBus3wbM6poGvU2hjzmPCuCFKyW1Q95JqGLBvXmmuM9Tk
 nuxuKl16N6FdozNuMA07dg/dcgLuPucpWhynvjUjx3HsLm6ArXuSdkqTdpSuBVxGxWvi
 WHEg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbmVlZCB0byBzaGlmdCB0aGUgdmFsdWVzIHVwLCBvdGhlcndpc2Ugd2UnZCBlbmQgdXAgd2l0
aCBhIG5lZ2F0aXZlCnNoaWZ0LiBUaGlzIHdvcmtzIGZvciB1cC10byAxNi1iaXQgY29tcG9uZW50
cywgd2hpY2ggaXMgZmluZSBmb3Igbm93LgoKU2lnbmVkLW9mZi1ieTogSWxpYSBNaXJraW4gPGlt
aXJraW5AYWx1bS5taXQuZWR1PgotLS0KIHRlc3RzL3V0aWwvcGF0dGVybi5jIHwgMTkgKysrKysr
KysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvdXRpbC9wYXR0ZXJuLmMgYi90ZXN0cy91dGlsL3Bh
dHRlcm4uYwppbmRleCBjODRmZWU1YS4uOGJkZWJkMmMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3V0aWwv
cGF0dGVybi5jCisrKyBiL3Rlc3RzL3V0aWwvcGF0dGVybi5jCkBAIC02MCwxMSArNjAsMjIgQEAg
c3RydWN0IGNvbG9yX3l1diB7CiAJICAudSA9IE1BS0VfWVVWXzYwMV9VKHIsIGcsIGIpLCBcCiAJ
ICAudiA9IE1BS0VfWVVWXzYwMV9WKHIsIGcsIGIpIH0KIAorc3RhdGljIGlubGluZSB1aW50MzJf
dCBzaGlmdGNvbG9yKGNvbnN0IHN0cnVjdCB1dGlsX2NvbG9yX2NvbXBvbmVudCAqY29tcCwKKwkJ
CQkgIHVpbnQzMl90IHZhbHVlKQoreworCS8qIEZpbGwgdGhlIGxvdyBiaXRzIHdpdGggdGhlIGhp
Z2ggYml0cy4gKi8KKwl2YWx1ZSA9ICh2YWx1ZSA8PCA4KSB8IHZhbHVlOworCS8qIFNoaWZ0IGRv
d24gdG8gcmVtb3ZlIHVud2FudGVkIGxvdyBiaXRzICovCisJdmFsdWUgPSB2YWx1ZSA+PiAoMTYg
LSBjb21wLT5sZW5ndGgpOworCS8qIFNoaWZ0IGJhY2sgdXAgdG8gd2hlcmUgdGhlIHZhbHVlIHNo
b3VsZCBiZSAqLworCXJldHVybiB2YWx1ZSA8PCBjb21wLT5vZmZzZXQ7Cit9CisKICNkZWZpbmUg
TUFLRV9SR0JBKHJnYiwgciwgZywgYiwgYSkgXAotCSgoKChyKSA+PiAoOCAtIChyZ2IpLT5yZWQu
bGVuZ3RoKSkgPDwgKHJnYiktPnJlZC5vZmZzZXQpIHwgXAotCSAoKChnKSA+PiAoOCAtIChyZ2Ip
LT5ncmVlbi5sZW5ndGgpKSA8PCAocmdiKS0+Z3JlZW4ub2Zmc2V0KSB8IFwKLQkgKCgoYikgPj4g
KDggLSAocmdiKS0+Ymx1ZS5sZW5ndGgpKSA8PCAocmdiKS0+Ymx1ZS5vZmZzZXQpIHwgXAotCSAo
KChhKSA+PiAoOCAtIChyZ2IpLT5hbHBoYS5sZW5ndGgpKSA8PCAocmdiKS0+YWxwaGEub2Zmc2V0
KSkKKwkoc2hpZnRjb2xvcigmKHJnYiktPnJlZCwgKHIpKSB8IFwKKwkgc2hpZnRjb2xvcigmKHJn
YiktPmdyZWVuLCAoZykpIHwgXAorCSBzaGlmdGNvbG9yKCYocmdiKS0+Ymx1ZSwgKGIpKSB8IFwK
Kwkgc2hpZnRjb2xvcigmKHJnYiktPmFscGhhLCAoYSkpKQogCiAjZGVmaW5lIE1BS0VfUkdCMjQo
cmdiLCByLCBnLCBiKSBcCiAJeyAudmFsdWUgPSBNQUtFX1JHQkEocmdiLCByLCBnLCBiLCAwKSB9
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
