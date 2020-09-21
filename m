Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F23272283
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 13:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D6F6E293;
	Mon, 21 Sep 2020 11:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC88D6E282;
 Mon, 21 Sep 2020 11:28:59 +0000 (UTC)
IronPort-SDR: vXso0hWPVgLTIxleLsKvE+TEVMS72RyET3YbvYCtYwrfR7UbepoqUKD0n8M/nKm2JhbIwXqyiB
 JeFt4gS4g1tg==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="157738378"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="157738378"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 04:28:59 -0700
IronPort-SDR: s7hs4Y7lbsg3WTpW66uF69pCthoQcDhhQ0betjZ3UCl3b3hYzMB/u4wkwIohFnc4IZm7SPQ+sx
 2KNrxLpUHr7w==
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="454009428"
Received: from karthik-2012-client-platform.iind.intel.com ([10.223.74.217])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 21 Sep 2020 04:28:56 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 8/8] drm/i915: Enable async flips in i915
Date: Mon, 21 Sep 2020 16:32:10 +0530
Message-Id: <20200921110210.21182-9-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200921110210.21182-1-karthik.b.s@intel.com>
References: <20200921110210.21182-1-karthik.b.s@intel.com>
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 Karthik B S <karthik.b.s@intel.com>, dri-devel@lists.freedesktop.org,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5hYmxlIGFzeW5jaHJvbm91cyBmbGlwcyBpbiBpOTE1IGZvciBnZW45KyBwbGF0Zm9ybXMuCgp2
MjogLUFzeW5jIGZsaXAgZW5hYmxlbWVudCBzaG91bGQgYmUgYSBzdGFuZCBhbG9uZSBwYXRjaCAo
UGF1bG8pCgp2MzogLU1vdmUgdGhlIHBhdGNoIHRvIHRoZSBlbmQgb2YgdGhlIHNlcmllcyAoUGF1
bG8pCgp2NDogLVJlYmFzZWQuCgp2NTogLVJlYmFzZWQuCgp2NjogLVJlYmFzZWQuCgp2NzogLVJl
YmFzZWQuCgp2ODogLVJlYmFzZWQuCgp2OTogLVJlYmFzZWQuCgp2MTA6IC1SZWJhc2VkLgoKU2ln
bmVkLW9mZi1ieTogS2FydGhpayBCIFMgPGthcnRoaWsuYi5zQGludGVsLmNvbT4KU2lnbmVkLW9m
Zi1ieTogVmFuZGl0YSBLdWxrYXJuaSA8dmFuZGl0YS5rdWxrYXJuaUBpbnRlbC5jb20+ClJldmll
d2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIHwgMyArKysK
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCmluZGV4IGMwZTBjODk5Mjk4Mi4uNWJiMDI5Y2ZkNDQw
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXku
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwpAQCAt
MTgwMDQsNiArMTgwMDQsOSBAQCBzdGF0aWMgdm9pZCBpbnRlbF9tb2RlX2NvbmZpZ19pbml0KHN0
cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KQogCiAJbW9kZV9jb25maWctPmZ1bmNzID0gJmlu
dGVsX21vZGVfZnVuY3M7CiAKKwlpZiAoSU5URUxfR0VOKGk5MTUpID49IDkpCisJCW1vZGVfY29u
ZmlnLT5hc3luY19wYWdlX2ZsaXAgPSB0cnVlOworCiAJLyoKIAkgKiBNYXhpbXVtIGZyYW1lYnVm
ZmVyIGRpbWVuc2lvbnMsIGNob3NlbiB0byBtYXRjaAogCSAqIHRoZSBtYXhpbXVtIHJlbmRlciBl
bmdpbmUgc3VyZmFjZSBzaXplIG9uIGdlbjQrLgotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
