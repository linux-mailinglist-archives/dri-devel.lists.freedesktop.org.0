Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C8D1103A1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 18:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD326EA40;
	Tue,  3 Dec 2019 17:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4F06EA41
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 17:37:17 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id o22so1312728ybg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 09:37:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UBWGlnwv4Vv3lZO/zfX1A8+cvPWGrGOAfy9S3S5HX8I=;
 b=aR7wlGwvevH69MMAkK6FBafwQaac40IM0Qza314Gh5O6f140YANxb8aC48lMajYb42
 cKAi/HI0W9DE9LK9VLgIIovN+7mU2wh53T2fe5jk37cYNyPKBrEl5nzBc8XJy1ITcys7
 QYob4LF/ypaLPyZb/iKl9VwYoI3ydbH7NvZOL3ewArjAbhm8djnBL4wI/Lw7Aqwdvvvm
 FRnyAll+SfBVeBytkadKTQsvGWhOg52iMsYNckpvPfdaCVEM6agz3H/NDdwxGorumbYj
 Yx9OlMHVlpOVJHUl1j82xkJC+7j7EEQutGeGAJJMVgOG/f4AMK7H524l6hmpgmjK1qig
 SuNQ==
X-Gm-Message-State: APjAAAWmUhwoAQFKR/O0bH9MJo7pnlp+1ACjgaTQY+PqoVFxgdm1CIZk
 E4LocB3B2DuN7nZGfD82/6CnpJ8qxvrq6Q==
X-Google-Smtp-Source: APXvYqzKkH47uFrEbPlnVN2ni6vYohlGrLaKhFWLORav+baal7eEhNZjav1pddjTgLy/0PuQ4ChJ/g==
X-Received: by 2002:a25:dec1:: with SMTP id v184mr5045858ybg.62.1575394636041; 
 Tue, 03 Dec 2019 09:37:16 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g190sm1729426ywf.41.2019.12.03.09.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 09:37:15 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ramalingm.c@intel.com
Subject: [PATCH 04/11] drm/i915: Don't WARN on HDCP toggle if get_hw_state
 returns false
Date: Tue,  3 Dec 2019 12:36:27 -0500
Message-Id: <20191203173638.94919-5-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
In-Reply-To: <20191203173638.94919-1-sean@poorly.run>
References: <20191203173638.94919-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UBWGlnwv4Vv3lZO/zfX1A8+cvPWGrGOAfy9S3S5HX8I=;
 b=bnkpDUyLuTywW2KNOURTlo5ZwpG4Anq4dv4h9mS5B5m0+zct+NLsuvMgkqgRA402q1
 8/tOOWcYf4bsHybeYkUrm4J6CCHuJtJGrC2OxnmiAzhXTkV6Uvzs0jYM14tCM8yHHBCj
 ALMMEwftNBjPg1JooyQdqktcx4NZ257pjkbvElXerp2e+tQ/h0BVe2ow7HNZKysJY+/y
 Xfl+sJjqKUFht0+b5xob20EvMJYlE55EWCfqe5Y0+819vvztIVwic/fHgAGXz3kE40wK
 bdtJd/QOoBHf20YlT3RF2cX2twAbJqobsc3YWLSUEJHKODZmjtAgoyQRiwT72d5h/YWL
 XP6A==
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpOb3cgdGhhdCB3ZSBjYW4g
cmVseSBvbiB0cmFuc2NvZGVyIGRpc2FibGUgdG8gdG9nZ2xlIHNpZ25hbGxpbmcgb2ZmLAppdCdz
IGxlc3Mgb2YgYSBjYXRhc3Ryb3BoZSBpZiBnZXRfaHdfc3RhdGUoKSByZXR1cm5zIGZhbHNlLgoK
T25jZSB3ZSBlbmFibGUgTVNULCB0aGlzIHdpbGwgYmUgYSB2YWxpZCBleGl0IHBhdGggYW5kIHdl
IHdhbnQgdG8gbWFrZQpzdXJlIHdlJ3JlIG5vdCBzcGFtbWluZyB0aGUgbG9ncyBuZWVkbGVzc2x5
LgoKU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RkaS5jCmluZGV4IGU4YWM5OGE4ZWU3Zi4uY2EyODkxM2E0YzlmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMKQEAgLTE5ODMsNyArMTk4
Myw3IEBAIGludCBpbnRlbF9kZGlfdG9nZ2xlX2hkY3Bfc2lnbmFsbGluZyhzdHJ1Y3QgaW50ZWxf
ZW5jb2RlciAqaW50ZWxfZW5jb2RlciwKIAlpZiAoV0FSTl9PTighd2FrZXJlZikpCiAJCXJldHVy
biAtRU5YSU87CiAKLQlpZiAoV0FSTl9PTighaW50ZWxfZW5jb2Rlci0+Z2V0X2h3X3N0YXRlKGlu
dGVsX2VuY29kZXIsICZwaXBlKSkpIHsKKwlpZiAoIWludGVsX2VuY29kZXItPmdldF9od19zdGF0
ZShpbnRlbF9lbmNvZGVyLCAmcGlwZSkpIHsKIAkJcmV0ID0gLUVJTzsKIAkJZ290byBvdXQ7CiAJ
fQotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
