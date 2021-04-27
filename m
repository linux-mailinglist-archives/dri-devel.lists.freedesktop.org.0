Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC75C36C193
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 11:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8F96E92A;
	Tue, 27 Apr 2021 09:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B68D6E929
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 09:20:27 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n2so5537369wrm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 02:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qm2F088UQNMNyW0Vmb8+hr1UPrlvXjrn+pu54h1Ytnc=;
 b=bg/jsUQbIKrdZ9DmiTEtqhQ0MRAaBJpuDSG1nptwgu0H9xLxybOUsWP5W3xfNUWuP4
 jiFoaGuwC02Bs0umcQgS2tzs5k2bAZTIvWmiysrHx2vxEOkAwCI2d2FvoZCM2nZqjOff
 SIQCWMbZisu9i+60VofiJQ36oaBztzniAHf7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qm2F088UQNMNyW0Vmb8+hr1UPrlvXjrn+pu54h1Ytnc=;
 b=ZPzHAqC/1IWKTffk1gixwb779Yyhg36jGJqcOjSJEzuMmJIwA1obfnKptWUUcJ89iW
 wGMRBQMg1GHflXCLEFnWIz2om5QU2zQPLHh+NvASjjRcDirLZAqn1ykMT+h1uiAVfdP5
 LH8Lfe/iR6qcYTikYW8d4++ayv6109dxQETqmHWNBH+IrPoVHE6NIy86BEVb8JeSaO8g
 C7emA6FfglaT9FjGOxoPkA+RmEvqmnXhERHSdRSnpsK3/iyeUoQCHFBhyeYL7IbUmvcE
 MsSzowMfVtRNIB2lm76pL/dtVvo6ao1Fx+eNklWAIMDY9rx/dCemuW4XIMzylXbRZM5d
 oY0w==
X-Gm-Message-State: AOAM532PdiyukKnWwfG+hx6xQEjibFR2u8WCXx4L0jwrNzSENY8MxqIa
 RLF7ATpcx6KEq70sCHdVqjjSn6Kzom7f5Q==
X-Google-Smtp-Source: ABdhPJxs1AGSu6rzENrdE0L+jjPD7uX0+z+GMCIuMhi3W/M1AqpxFi26cW4c4dhxGaUCoSdaHH3tng==
X-Received: by 2002:adf:8046:: with SMTP id 64mr27440671wrk.176.1619515226357; 
 Tue, 27 Apr 2021 02:20:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r24sm1939816wmh.8.2021.04.27.02.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:20:25 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/8] drm/i915: Don't set allow_fb_modifiers explicitly
Date: Tue, 27 Apr 2021 11:20:13 +0200
Message-Id: <20210427092018.832258-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
References: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Karthik B S <karthik.b.s@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Manasi Navare <manasi.d.navare@intel.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UKCmNvbW1pdCA4OTA4ODBkZGZkYmUyNTYwODMxNzA4NjZlNDljODc2MThiNzA2YWM3CkF1
dGhvcjogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgpE
YXRlOiAgIEZyaSBKYW4gNCAwOTo1NjoxMCAyMDE5ICswMTAwCgogICAgZHJtOiBBdXRvLXNldCBh
bGxvd19mYl9tb2RpZmllcnMgd2hlbiBnaXZlbiBtb2RpZmllcnMgYXQgcGxhbmUgaW5pdAoKdGhp
cyBpcyBkb25lIGF1dG9tYXRpY2FsbHkgYXMgcGFydCBvZiBwbGFuZSBpbml0LCBpZiBkcml2ZXJz
IHNldCB0aGUKbW9kaWZpZXIgbGlzdCBjb3JyZWN0bHkuIFdoaWNoIGlzIHRoZSBjYXNlIGhlcmUu
CgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
Q2M6ICJWaWxsZSBTeXJqw6Rsw6QiIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6
IE1hbmFzaSBOYXZhcmUgPG1hbmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+CkNjOiBKYW5pIE5pa3Vs
YSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgpDYzogIkpvc8OpIFJvYmVydG8gZGUgU291emEiIDxq
b3NlLnNvdXphQGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29u
LmNvLnVrPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpDYzogRGF2ZSBBaXJs
aWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBLYXJ0aGlrIEIgUyA8a2FydGhpay5iLnNAaW50
ZWwuY29tPgpDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDIgLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kaXNwbGF5LmMKaW5kZXggNGJiYzgxZDhkNjQ5Li5kMmM2OTU5MTkwYWIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCkBAIC0xMTczMSw4
ICsxMTczMSw2IEBAIHN0YXRpYyB2b2lkIGludGVsX21vZGVfY29uZmlnX2luaXQoc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmk5MTUpCiAJbW9kZV9jb25maWctPnByZWZlcnJlZF9kZXB0aCA9IDI0
OwogCW1vZGVfY29uZmlnLT5wcmVmZXJfc2hhZG93ID0gMTsKIAotCW1vZGVfY29uZmlnLT5hbGxv
d19mYl9tb2RpZmllcnMgPSB0cnVlOwotCiAJbW9kZV9jb25maWctPmZ1bmNzID0gJmludGVsX21v
ZGVfZnVuY3M7CiAKIAltb2RlX2NvbmZpZy0+YXN5bmNfcGFnZV9mbGlwID0gaGFzX2FzeW5jX2Zs
aXBzKGk5MTUpOwotLSAKMi4zMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
