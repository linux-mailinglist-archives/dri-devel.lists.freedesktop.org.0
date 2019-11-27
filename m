Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E407710B358
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 17:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61996E33A;
	Wed, 27 Nov 2019 16:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282E06E33A;
 Wed, 27 Nov 2019 16:33:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 08:33:00 -0800
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; d="scan'208";a="359547526"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 08:32:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/13] video: udlfb: don't restore fb_mmap after deferred IO
 cleanup
Date: Wed, 27 Nov 2019 18:32:00 +0200
Message-Id: <21cc1f07daffeddf4d59f2b444796c0216274c87.1574871797.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1574871797.git.jani.nikula@intel.com>
References: <cover.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Bernie Thompson <bernie@plugable.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVmZXJyZWQgSU8gbm93IHByZXNlcnZlcyB0aGUgZmJfb3BzLgoKQ2M6IEJlcm5pZSBUaG9tcHNv
biA8YmVybmllQHBsdWdhYmxlLmNvbT4KQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwpT
aWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgotLS0KIGRy
aXZlcnMvdmlkZW8vZmJkZXYvdWRsZmIuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3VkbGZiLmMgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L3VkbGZiLmMKaW5kZXggZmUzNzNiNjNkZGQ2Li4wNzkwNWQzODU5NDkgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvdWRsZmIuYworKysgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L3VkbGZiLmMKQEAgLTEwMzcsNyArMTAzNyw2IEBAIHN0YXRpYyBpbnQgZGxmYl9vcHNf
cmVsZWFzZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgaW50IHVzZXIpCiAJCWZiX2RlZmVycmVkX2lv
X2NsZWFudXAoaW5mbyk7CiAJCWtmcmVlKGluZm8tPmZiZGVmaW8pOwogCQlpbmZvLT5mYmRlZmlv
ID0gTlVMTDsKLQkJaW5mby0+ZmJvcHMtPmZiX21tYXAgPSBkbGZiX29wc19tbWFwOwogCX0KIAog
CWRldl9kYmcoaW5mby0+ZGV2LCAicmVsZWFzZSwgdXNlcj0lZCBjb3VudD0lZFxuIiwgdXNlciwg
ZGxmYi0+ZmJfY291bnQpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
