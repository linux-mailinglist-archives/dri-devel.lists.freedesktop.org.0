Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C62CE11039F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 18:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249B26EA3B;
	Tue,  3 Dec 2019 17:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77646EA3F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 17:37:12 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id h126so1635060ywc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 09:37:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5RS+iM/8Pmfn6MpQu7z1NjYnwPdtK2Ar3CetwZVrW2g=;
 b=emRcteZ3Ypg5sZN/1LE+9WSxwlinGBfFnjvta8WK90IhlkxzT2+YCLxtIOhsdjTTY+
 f2Uk5Cu9ytCfZbzgI1pyRZUZCRTv9AscZho+hcuThwrSW9oB49eFz0pax/Cqo6vKgI6A
 90hGd2EBoQv/rchjYNr+DnXGbjw1WIrOaZF4q8xNBYzeK2/ZTu4EtZpo3S7on+z4XrvA
 us9J/ZPoR7plgtbBxiHlckYHZkKNaxSFcHcWiZJVZpTuKZsbVUCSviiv4+yAIzMD7JK3
 hqxyjnGgGViO/dUEoRw7ph2e8ktWg9nHZFQIo1jGcLtj4HQrQlgQBqzXVUjEpz4vszga
 /pZQ==
X-Gm-Message-State: APjAAAUYTBP5bBy7Zfe5kv6AYtO3p8oDUSBTReqi7vXU0LHwEM0D2a0q
 2HoFCyOXydrsYBcFW1ZW9lUDfbG2WucWAw==
X-Google-Smtp-Source: APXvYqy6hNUL7CTqpboW/YMRNd11R7bjZGZhsCjUK3Lmf1H/sFSH/bqlZtRf4fJLBnU6sGxoiT76gw==
X-Received: by 2002:a81:4bd1:: with SMTP id y200mr4983901ywa.94.1575394631862; 
 Tue, 03 Dec 2019 09:37:11 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g190sm1729426ywf.41.2019.12.03.09.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 09:37:11 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ramalingm.c@intel.com
Subject: [PATCH 03/11] drm/i915: Disable HDCP signalling on transcoder disable
Date: Tue,  3 Dec 2019 12:36:26 -0500
Message-Id: <20191203173638.94919-4-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
In-Reply-To: <20191203173638.94919-1-sean@poorly.run>
References: <20191203173638.94919-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5RS+iM/8Pmfn6MpQu7z1NjYnwPdtK2Ar3CetwZVrW2g=;
 b=FRUmH04bVZo7IFI3jxMpLzrJ643A59AfWyQ6Z6zHqAlMxHtWf9NdhM9Ycd8w3tOKTb
 8Yk4/4KMfFECAUCg5GDJ4sfJHinyXCCpp+iW/I/OjZpnNsbLnHj523ya4DJhuqfp9nCn
 /6ufaeOzMYiDVNL/wdbYoLXs216xCUdGDOUArQmkrEIdj4/MngnXZvbw3lneaihpWu25
 YZ09tjHt1dzRmhX3FbdXVWmsSmdrAatDXxUWlZldFMtcM8PA1X78XJdxcfYPD+U14K5u
 35seMN8J7eiqHTyltWfFHbwOleV+01vMrONfYu44h7CEv3FcuSjoUYxEQnnZDXgJmpwQ
 uuPA==
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

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpDdXJyZW50bHkgd2UgcmVs
eSBvbiBpbnRlbF9oZGNwX2Rpc2FibGUoKSB0byBkaXNhYmxlIEhEQ1Agc2lnbmFsbGluZyBpbgp0
aGUgRERJIEZ1bmN0aW9uIENvbnRyb2wgcmVnaXN0ZXIuIFRoaXMgcGF0Y2ggYWRkcyBhIHNhZmV0
eSBuZXQgYnkgYWxzbwpjbGVhcmluZyB0aGUgYml0IHdoZW4gd2UgZGlzYWJsZSB0aGUgdHJhbnNj
b2Rlci4KCk9uY2Ugd2UgaGF2ZSBIRENQIG92ZXIgTVNUIGFuZCBkaXNhcHBlYXJpbmcgY29ubmVj
dG9ycywgd2Ugd2FudCB0byBtYWtlCnN1cmUgdGhhdCB0aGUgc2lnbmFsbGluZyBpcyB0cnVseSBk
aXNhYmxlZCBldmVuIGlmIEhEQ1AgdGVhcmRvd24gZG9lc24ndApnbyBhcyBwbGFubmVkLgoKU2ln
bmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyB8IDEzICsrKysrKy0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMKaW5kZXggYjUxZjI0NGFkN2E1Li5lOGFjOThh
OGVlN2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRp
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYwpAQCAtMTk1
MiwxMyArMTk1MiwxMiBAQCB2b2lkIGludGVsX2RkaV9kaXNhYmxlX3RyYW5zY29kZXJfZnVuYyhj
b25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZQogCWk5MTVfcmVnX3QgcmVn
ID0gVFJBTlNfRERJX0ZVTkNfQ1RMKGNwdV90cmFuc2NvZGVyKTsKIAl1MzIgdmFsID0gSTkxNV9S
RUFEKHJlZyk7CiAKLQlpZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSAxMikgewotCQl2YWwgJj0g
fihUUkFOU19ERElfRlVOQ19FTkFCTEUgfCBUR0xfVFJBTlNfRERJX1BPUlRfTUFTSyB8Ci0JCQkg
VFJBTlNfRERJX0RQX1ZDX1BBWUxPQURfQUxMT0MpOwotCX0gZWxzZSB7Ci0JCXZhbCAmPSB+KFRS
QU5TX0RESV9GVU5DX0VOQUJMRSB8IFRSQU5TX0RESV9QT1JUX01BU0sgfAotCQkJIFRSQU5TX0RE
SV9EUF9WQ19QQVlMT0FEX0FMTE9DKTsKLQl9CisJdmFsICY9IH4oVFJBTlNfRERJX0ZVTkNfRU5B
QkxFIHwgVFJBTlNfRERJX0RQX1ZDX1BBWUxPQURfQUxMT0MgfAorCQkgVFJBTlNfRERJX0hEQ1Bf
U0lHTkFMTElORyk7CisJaWYgKElOVEVMX0dFTihkZXZfcHJpdikgPj0gMTIpCisJCXZhbCAmPSB+
VEdMX1RSQU5TX0RESV9QT1JUX01BU0s7CisJZWxzZQorCQl2YWwgJj0gflRSQU5TX0RESV9QT1JU
X01BU0s7CiAJSTkxNV9XUklURShyZWcsIHZhbCk7CiAKIAlpZiAoZGV2X3ByaXYtPnF1aXJrcyAm
IFFVSVJLX0lOQ1JFQVNFX0RESV9ESVNBQkxFRF9USU1FICYmCi0tIApTZWFuIFBhdWwsIFNvZnR3
YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
