Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3698348284
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 21:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671756EA87;
	Wed, 24 Mar 2021 20:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86B06EA81;
 Wed, 24 Mar 2021 20:05:28 +0000 (UTC)
IronPort-SDR: 4xVeCsnHO0xmXcok1cbW1mKotN5FbQEN8dP05wpJNM1/ISnYrer812MZQ0xTSAgRoCD0ElF8dK
 Wr7ZrNxbK25A==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="188482329"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="188482329"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 13:05:23 -0700
IronPort-SDR: IyR7p/rJEmw3JWpmj8u5tHSZ+DVTgYSWfQsjn9QJQltwashHBAhqrNakpG6e+3hHRx1Hpe5+t8
 ub7EZPVgDtSw==
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="391423639"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 13:05:22 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915: Move Wa_16011163337 to
 gen12_ctx_workarounds_init()
Date: Wed, 24 Mar 2021 13:05:01 -0700
Message-Id: <20210324200502.1731265-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210324200502.1731265-1-lucas.demarchi@intel.com>
References: <20210324200502.1731265-1-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+CgpUaGlz
IFdBIGlzIG5lZWRlZCBpbiBhbGwgZ2VuMTIgcGxhdGZvcm1zLCBtb3ZpbmcgaXQgdG8KZ2VuMTJf
Y3R4X3dvcmthcm91bmRzX2luaXQoKSBhbGxvdyB1cyB0byByZW1vdmUgdGhlIGR1cGxpY2F0ZWQK
aW1wbGVtZW50YXRpb24uCkFsc28gYWxsb3cgdXMgdG8gcmVtb3ZlIHRoZSB0Z2xfY3R4X3dvcmth
cm91bmRzX2luaXQoKSB0aGF0IGFmdGVyIHRoZQpXQSBtb3ZlIGFib3ZlIHdhcyBlbXB0eS4KClNp
Z25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29t
PgpSZXZpZXdlZC1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfd29ya2Fyb3VuZHMuYyB8IDIwIC0t
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfd29ya2Fyb3VuZHMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX3dvcmthcm91bmRzLmMKaW5kZXggM2M2MDlhZGNh
MmVlLi5hZWI1ZmI1NGZiMGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2lu
dGVsX3dvcmthcm91bmRzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfd29y
a2Fyb3VuZHMuYwpAQCAtNjk2LDEyICs2OTYsNiBAQCBzdGF0aWMgdm9pZCBnZW4xMl9jdHhfd29y
a2Fyb3VuZHNfaW5pdChzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUsCiAJd2FfbWFza2Vk
X2ZpZWxkX3NldCh3YWwsIEdFTjhfQ1NfQ0hJQ0tFTjEsCiAJCQkgICAgR0VOOV9QUkVFTVBUX0dQ
R1BVX0xFVkVMX01BU0ssCiAJCQkgICAgR0VOOV9QUkVFTVBUX0dQR1BVX1RIUkVBRF9HUk9VUF9M
RVZFTCk7Ci19Ci0KLXN0YXRpYyB2b2lkIHRnbF9jdHhfd29ya2Fyb3VuZHNfaW5pdChzdHJ1Y3Qg
aW50ZWxfZW5naW5lX2NzICplbmdpbmUsCi0JCQkJICAgICBzdHJ1Y3QgaTkxNV93YV9saXN0ICp3
YWwpCi17Ci0JZ2VuMTJfY3R4X3dvcmthcm91bmRzX2luaXQoZW5naW5lLCB3YWwpOwogCiAJLyoK
IAkgKiBXYV8xNjAxMTE2MzMzNwpAQCAtNzI4LDE3ICs3MjIsNiBAQCBzdGF0aWMgdm9pZCBkZzFf
Y3R4X3dvcmthcm91bmRzX2luaXQoc3RydWN0IGludGVsX2VuZ2luZV9jcyAqZW5naW5lLAogCS8q
IFdhXzIyMDEwNDkzMjk4ICovCiAJd2FfbWFza2VkX2VuKHdhbCwgSElaX0NISUNLRU4sCiAJCSAg
ICAgREcxX0haX1JFQURfU1VQUFJFU1NJT05fT1BUSU1JWkFUSU9OX0RJU0FCTEUpOwotCi0JLyoK
LQkgKiBXYV8xNjAxMTE2MzMzNwotCSAqCi0JICogTGlrZSBpbiBnZW4xMl9jdHhfZ3RfdHVuaW5n
X2luaXQoKSwgcmVhZCB2ZXJpZmljYXRpb24gaXMgaWdub3JlZCBkdWUKLQkgKiB0byBXYV8xNjA4
MDA4MDg0LgotCSAqLwotCXdhX2FkZCh3YWwsCi0JICAgICAgIEZGX01PREUyLAotCSAgICAgICBG
Rl9NT0RFMl9HU19USU1FUl9NQVNLLAotCSAgICAgICBGRl9NT0RFMl9HU19USU1FUl8yMjQsIDAp
OwogfQogCiBzdGF0aWMgdm9pZApAQCAtNzU1LDkgKzczOCw2IEBAIF9faW50ZWxfZW5naW5lX2lu
aXRfY3R4X3dhKHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2luZSwKIAogCWlmIChJU19ERzEo
aTkxNSkpCiAJCWRnMV9jdHhfd29ya2Fyb3VuZHNfaW5pdChlbmdpbmUsIHdhbCk7Ci0JZWxzZSBp
ZiAoSVNfQUxERVJMQUtFX1MoaTkxNSkgfHwgSVNfUk9DS0VUTEFLRShpOTE1KSB8fAotCQkgSVNf
VElHRVJMQUtFKGk5MTUpKQotCQl0Z2xfY3R4X3dvcmthcm91bmRzX2luaXQoZW5naW5lLCB3YWwp
OwogCWVsc2UgaWYgKElTX0dFTihpOTE1LCAxMikpCiAJCWdlbjEyX2N0eF93b3JrYXJvdW5kc19p
bml0KGVuZ2luZSwgd2FsKTsKIAllbHNlIGlmIChJU19HRU4oaTkxNSwgMTEpKQotLSAKMi4zMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
