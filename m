Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E754DB8BE8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84766F57F;
	Fri, 20 Sep 2019 07:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F466F860
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:06:33 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id j19so2249679lja.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 07:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k4SJ+eSfjSAP63ushly3GU0Efl4ebkKBMuWTSOkSqS8=;
 b=duWib8OTB2uABFRSXkQiA9nkYx28bzdufPlp+0yEqBQXdN2xNqwgkvTQFiD0e2FP5g
 Sn8Y8k3KeVwVpJB3kwJk9knKDVjsPYQcBK2xqhwtalKKdJpiLqMy14LiuqqqLKcd3B3n
 TVVADyQxUa96vfQxHvpmLGQc8jGxn225la9nV6MgejSePox03tZisW0/J80e4KulBEP6
 2KO1o1hEwcSwDjgUCCR8CvZ2w09LiVqNV6rVauNfZqgYIBIeIVFBc0YeRAJSiN9HVruT
 Fwn+XaLmP/IamEhf0GaoEyFk9XbHPqw5TFwrOHynBKazVZsLFoayMIWbiIEk4riag/9N
 8GxA==
X-Gm-Message-State: APjAAAUE2WcfnMb99lmHPHmXwXu7wEO7Sjf5jinjtnJSqNJ3Cb71Rqdj
 0b+R6b6UqzlPJfzAt/DXpNOJtw==
X-Google-Smtp-Source: APXvYqzlHJRhLqL82K2xKbtjAXAMpinhzWwpvMBA7qVfJ7tNQ26aw9X0BviaTA3hpMKKf3q8cAewtQ==
X-Received: by 2002:a2e:934f:: with SMTP id m15mr5586940ljh.101.1568901991526; 
 Thu, 19 Sep 2019 07:06:31 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id h3sm1687886ljf.12.2019.09.19.07.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 07:06:31 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 3/5] backlight: pwm_bl: drop use of int_pow()
Date: Thu, 19 Sep 2019 16:06:18 +0200
Message-Id: <20190919140620.32407-3-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k4SJ+eSfjSAP63ushly3GU0Efl4ebkKBMuWTSOkSqS8=;
 b=W4FhrPJAR9Dqgs5qFA5Pl22WVgeXGbokdSlE6Xjl8ev+AwkvtlovQkmnKhocbnMFdS
 81B7iYoNdsvMs2yQlsvxAdJGvvAKDR0FvjYPLiSIbpwUt9AMKu8kvddB2vIg68Gs3TZA
 XspHxRzEPQhGFNCyXRy2eUNIWhGekZOWx5Sfw=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHNjaGVkdWxlciB1c2VzIGEgKGN1cnJlbnRseSBwcml2YXRlKSBmaXhlZF9wb3dlcl9pbnQo
KSBpbiBpdHMgbG9hZAphdmVyYWdlIGNvbXB1dGF0aW9uIGZvciBjb21wdXRpbmcgcG93ZXJzIG9m
IG51bWJlcnMgMCA8IHggPCAxCmV4cHJlc3NlZCBhcyBmaXhlZC1wb2ludCBudW1iZXJzLCB3aGlj
aCBpcyBhbHNvIHdoYXQgd2Ugd2FudCBoZXJlLiBCdXQKdGhhdCByZXF1aXJlcyB0aGUgc2NhbGUg
dG8gYmUgYSBwb3dlci1vZi0yLgoKV2UgY291bGQgKGFuZCBhIGZvbGxvd2luZyBwYXRjaCB3aWxs
KSBjaGFuZ2UgdG8gdXNlIGEgcG93ZXItb2YtMiBzY2FsZSwKYnV0IGZvciBhIGZpeGVkIHNtYWxs
IGV4cG9uZW50IG9mIDMsIHRoZXJlJ3Mgbm8gYWR2YW50YWdlIGluIHVzaW5nCnJlcGVhdGVkIHNx
dWFyaW5nLgoKU2lnbmVkLW9mZi1ieTogUmFzbXVzIFZpbGxlbW9lcyA8bGludXhAcmFzbXVzdmls
bGVtb2VzLmRrPgotLS0KIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIHwgMyArKy0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L3B3bV9ibC5jCmluZGV4IDkyNTJkNTFmMzFiOS4uYWVlNjgzOWUwMjRhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYworKysgYi9kcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9wd21fYmwuYwpAQCAtMTc5LDcgKzE3OSw4IEBAIHN0YXRpYyB1NjQgY2llMTkz
MSh1bnNpZ25lZCBpbnQgbGlnaHRuZXNzLCB1bnNpZ25lZCBpbnQgc2NhbGUpCiAJaWYgKGxpZ2h0
bmVzcyA8PSAoOCAqIHNjYWxlKSkgewogCQlyZXR2YWwgPSBESVZfUk9VTkRfQ0xPU0VTVChsaWdo
dG5lc3MgKiAxMCwgOTAzMyk7CiAJfSBlbHNlIHsKLQkJcmV0dmFsID0gaW50X3BvdygobGlnaHRu
ZXNzICsgKDE2ICogc2NhbGUpKSAvIDExNiwgMyk7CisJCXJldHZhbCA9IChsaWdodG5lc3MgKyAo
MTYgKiBzY2FsZSkpIC8gMTE2OworCQlyZXR2YWwgKj0gcmV0dmFsICogcmV0dmFsOwogCQlyZXR2
YWwgPSBESVZfUk9VTkRfQ0xPU0VTVF9VTEwocmV0dmFsLCAoc2NhbGUgKiBzY2FsZSkpOwogCX0K
IAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
