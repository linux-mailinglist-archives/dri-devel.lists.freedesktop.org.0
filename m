Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C334D0804
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EA56E909;
	Wed,  9 Oct 2019 07:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A69899A7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 12:05:23 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id d1so17197984ljl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 05:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t1XvNBeL5bYKnc6NbbptU+vm2vXQBBrTO687+/k8huo=;
 b=sZ79vHnaktDaRU9NEtX+x9eVRO7zAjxqVTHRhxHdx8UJbwlIlJOYzqPgu5pQfJv+2W
 7+lnrKx4mSS7ce2v0/tbRqEjqqoVq+JgGot1QaH/v5Y3renpmDCW5qMiFoJUM8UggokL
 AQjg0Yau68hl8bpWo1sj0ZvLOTlCFxdbKMGN2zoqBT0X5E0E3lvLyWMuLGUDM39DZAmL
 0XneeDoDawdET9ElLX1W/hBApN1p6C0AtxMni6eSNG2pPbttlIHMRshPQlLEoV/CSOle
 0Xt+q01baRfALTLSIO3MLBhEfPeVfGdYkfiaPsCPhQHGLHeMZgEN9lRLZA/c1V+rj5dU
 BbDA==
X-Gm-Message-State: APjAAAWWfqnd8jzyBQwj+97devTNIp/8hSecRxFc3oS0i9mTocDU2i/G
 duF1xxioj3b5jni2qKXM33ErPMS5e0dQZC7H
X-Google-Smtp-Source: APXvYqwr3eVj5VGcs9c4XwSP3Lzo4ODiUPJZt5VqFcpdr7xw+mtUtMYtWeZVNZS+BWY7vjjUDAVqgQ==
X-Received: by 2002:a2e:9d16:: with SMTP id t22mr19624221lji.207.1570536321581; 
 Tue, 08 Oct 2019 05:05:21 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id z18sm3918033ljh.17.2019.10.08.05.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 05:05:19 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 2/4] backlight: pwm_bl: eliminate a 64/32 division
Date: Tue,  8 Oct 2019 14:03:25 +0200
Message-Id: <20191008120327.24208-3-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
References: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t1XvNBeL5bYKnc6NbbptU+vm2vXQBBrTO687+/k8huo=;
 b=ELuDRuvEPbxHn+tPF2h2RxCruUdG8zM+LbvVMlIluH8Z/3Nz3rM48QruNf6Jjzt6Qx
 s+T3vGwTXw/HUazqjiUT8y6NaXwohlIowNQCdfwlwMsrwKqKmMOt9HlxSOwPJeCD4YOl
 uaNX5F5hIsDxJs3FYKG+NK0+p/NucTLWFjocY=
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

bGlnaHRuZXNzKjEwMDAgaXMgbm93aGVyZSBuZWFyIG92ZXJmbG93aW5nIDMyIGJpdHMsIHNvIHdl
IGNhbiBqdXN0IHVzZQphbiBvcmRpbmFyeSAzMi8zMiBkaXZpc2lvbiwgd2hpY2ggaXMgbXVjaCBj
aGVhcGVyIHRoYW4gdGhlIDY0LzMyIGRvbmUKdmlhIGRvX2RpdigpLgoKUmV2aWV3ZWQtYnk6IERh
bmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6
IFJhc211cyBWaWxsZW1vZXMgPGxpbnV4QHJhc211c3ZpbGxlbW9lcy5kaz4KLS0tCiBkcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L3B3bV9ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKaW5kZXggY2M0
NGEwMmU5NWM3Li42NzJjNWU3Y2ZjZDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L3B3bV9ibC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCkBAIC0x
NzcsNyArMTc3LDcgQEAgc3RhdGljIHU2NCBjaWUxOTMxKHVuc2lnbmVkIGludCBsaWdodG5lc3Ms
IHVuc2lnbmVkIGludCBzY2FsZSkKIAkgKi8KIAlsaWdodG5lc3MgKj0gMTAwOwogCWlmIChsaWdo
dG5lc3MgPD0gKDggKiBzY2FsZSkpIHsKLQkJcmV0dmFsID0gRElWX1JPVU5EX0NMT1NFU1RfVUxM
KGxpZ2h0bmVzcyAqIDEwLCA5MDMzKTsKKwkJcmV0dmFsID0gRElWX1JPVU5EX0NMT1NFU1QobGln
aHRuZXNzICogMTAsIDkwMzMpOwogCX0gZWxzZSB7CiAJCXJldHZhbCA9IGludF9wb3coKGxpZ2h0
bmVzcyArICgxNiAqIHNjYWxlKSkgLyAxMTYsIDMpOwogCQlyZXR2YWwgPSBESVZfUk9VTkRfQ0xP
U0VTVF9VTEwocmV0dmFsLCAoc2NhbGUgKiBzY2FsZSkpOwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
