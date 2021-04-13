Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE93F35DBA0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 11:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDF46E2C0;
	Tue, 13 Apr 2021 09:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD24289C3F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 09:49:14 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 o9-20020a1c41090000b029012c8dac9d47so896250wma.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 02:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=adyH3SPpnboMOl3tkCszQtpvrgJSywQm0ZH8RlH4qpQ=;
 b=e8UhRrLqNTUrFPuMFAXUBvVteWBxdOrRbJeCAHWhnEL6Wrkt8PoRymRYQcfBSungG7
 OpzJx737ywzd6HMAPXT7ahprk31KhCmLyfCYLI5nlahCGHhaFVVLdMjSEolVBbzX/xCY
 4ZZ7MUOp/CfF9RlkOwYZuPw8cYfJ815yOhhew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=adyH3SPpnboMOl3tkCszQtpvrgJSywQm0ZH8RlH4qpQ=;
 b=mX/FhVT6kosYCjzfTnu3F49JlECm3ar9u+7Gzqu8EkdouEglG1alHuu/RiEdOXtAvv
 m6+zrmPyDdejGy8KKxcmafJ1lXrqyn1Hi3kVBxkCtVekRARAHQ0sBUSrxd+BJvQ4Uxxk
 qf72P4Hd4YbiBC6EPEQc1SjbZwGRrt8WjyVVxrypmVC32d7rK+NJkv/ac4+6CR80/+4w
 kJk8snHaP7ffswjR9FSSwVdg5rx3NtcZlrbZpbpYMhBBCkdeYY1GKBW+bQrB/FW1VM8N
 cuVOl0eQCJYsE3UU+4xk+I5acB9tqJd9vcPnb4R+ffdhUNxV+hI0redMQTbQ1vU25QIc
 kKwg==
X-Gm-Message-State: AOAM532jygDoau/FKt5wG/LlhtMdMxdrt7L8RacNg3ODKILCQDbcZLzy
 HONS8sXzmGayKCtnPYu8ycpgFPUigxPvsw==
X-Google-Smtp-Source: ABdhPJxxNj5eWGHzgr0XAqGc6CAkLj9GwU3yqOYuaNmpFWO3dyqAkaFWnToV5HyZBbziVYNBAXDf0Q==
X-Received: by 2002:a1c:3182:: with SMTP id x124mr3243309wmx.41.1618307353370; 
 Tue, 13 Apr 2021 02:49:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 64sm1956458wmz.7.2021.04.13.02.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 02:49:12 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/12] drm/i915: Don't set allow_fb_modifiers explicitly
Date: Tue, 13 Apr 2021 11:48:55 +0200
Message-Id: <20210413094904.3736372-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
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
eS9pbnRlbF9kaXNwbGF5LmMKaW5kZXggZGU4NTQ2YTQ2ODcyLi4yZDFhYTM1YWRiMGEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCkBAIC0xMTczMiw4
ICsxMTczMiw2IEBAIHN0YXRpYyB2b2lkIGludGVsX21vZGVfY29uZmlnX2luaXQoc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmk5MTUpCiAJbW9kZV9jb25maWctPnByZWZlcnJlZF9kZXB0aCA9IDI0
OwogCW1vZGVfY29uZmlnLT5wcmVmZXJfc2hhZG93ID0gMTsKIAotCW1vZGVfY29uZmlnLT5hbGxv
d19mYl9tb2RpZmllcnMgPSB0cnVlOwotCiAJbW9kZV9jb25maWctPmZ1bmNzID0gJmludGVsX21v
ZGVfZnVuY3M7CiAKIAltb2RlX2NvbmZpZy0+YXN5bmNfcGFnZV9mbGlwID0gaGFzX2FzeW5jX2Zs
aXBzKGk5MTUpOwotLSAKMi4zMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
