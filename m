Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42BCBA237
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12766E054;
	Sun, 22 Sep 2019 12:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd4a.google.com (mail-io1-xd4a.google.com
 [IPv6:2607:f8b0:4864:20::d4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A306E04A
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 06:38:59 +0000 (UTC)
Received: by mail-io1-xd4a.google.com with SMTP id e14so6033565iot.16
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 23:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XOGsKwy33nriWO2piNArgCsTjyMNHJTJvDyvFgo5s6U=;
 b=sffZ8sJe+4HoTZx7C/gQS3Sg7ViNGvZ36oQihnLCx83fPExbsNzv8BBGlNrQzcbHm0
 pICVae5xIeT+gqEQc8fY9uSmBOuVi8OzP27/nsf3cvJfvv56Ncb3p2pNk/keiTOfvfwa
 J4hCAUzjVl2D70BFS+e9sZVextknZgTXNnww4nqcX4dda+MX0LRKSuXyrG1Qnx32QyUI
 SJXvMdYiwX4tHCFuyTd0pucd46hJK0EyYrVHzcxGsaqMDA+wwnJAg2p/vK8qqbgIyA1J
 B/Dz0OoKB7rDr8sg7QCFZ4x5VyMObNvYuG1UhEzhi//CBBOLUUP56WTzhcYP8qF22bPy
 k+HA==
X-Gm-Message-State: APjAAAXRMdPCMO/ZsuGmfkl53EcVfAqlQX3j0phDX+Gis+6YpRa+kJd5
 vlNbL71MDvzqI/KwyLvCwbS0zcutIrxeKU4WktfaMA==
X-Google-Smtp-Source: APXvYqyhYc2gzw2zw7hNHJ45JP5rJlx8noEcdat85g5q14wTmwmkyJ6JmxX9AzFR4w2ah2LgF306gHYAybhUcuUrVrOySQ==
X-Received: by 2002:a0c:9792:: with SMTP id l18mr12691255qvd.79.1569025161226; 
 Fri, 20 Sep 2019 17:19:21 -0700 (PDT)
Date: Fri, 20 Sep 2019 17:18:42 -0700
In-Reply-To: <20190921001855.200947-1-brendanhiggins@google.com>
Message-Id: <20190921001855.200947-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190921001855.200947-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
Subject: [PATCH v17 06/19] lib: enable building KUnit in lib/
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=XOGsKwy33nriWO2piNArgCsTjyMNHJTJvDyvFgo5s6U=;
 b=Sgz7213+qbN86RpnjYxwE7eAvRTa0YN6r1fXC9nQwi+bQLfmJ0RS4WpN0N81z/odi6
 XGU7gCUSbBUdgle5NaqiHXybHGODmoKDWh/0HAkn64T1Co7SCCYmXUpCIrrnRh6Jb2Ll
 XjhlpTMqtnLolZQwP4aDBcCgL59XhMxAa5lJCd2J1Bs9Ujfs0mesiC80xjKZ798sbyV+
 vVOclVVTpXfND0vcjZ+oQRPMBJniMNy5trFLGfHLvvfXmpzxMSeWVg1bhaD800YWS3Zv
 cO7oaTS4ubnNeNZIACnRD79K40w8Hjvmr0YhQlHzIcQKEkRRSV52zVfDjQ/PSTjPN9NX
 xkxQ==
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Tim.Bird@sony.com, linux-um@lists.infradead.org, rostedt@goodmis.org,
 julia.lawall@lip6.fr, kunit-dev@googlegroups.com, richard@nod.at,
 torvalds@linux-foundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S1VuaXQgaXMgYSBuZXcgdW5pdCB0ZXN0aW5nIGZyYW1ld29yayBmb3IgdGhlIGtlcm5lbCBhbmQg
d2hlbiB1c2VkIGlzCmJ1aWx0IGludG8gdGhlIGtlcm5lbCBhcyBhIHBhcnQgb2YgaXQuIEFkZCBL
VW5pdCB0byB0aGUgbGliIEtjb25maWcgYW5kCk1ha2VmaWxlIHRvIGFsbG93IGl0IHRvIGJlIGFj
dHVhbGx5IGJ1aWx0LgoKU2lnbmVkLW9mZi1ieTogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGln
Z2luc0Bnb29nbGUuY29tPgpDYzogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+
CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogTWFzYWhp
cm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KQ2M6IEtlZXMgQ29vayA8
a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgotLS0KIGxpYi9LY29uZmlnLmRlYnVnIHwgMiArKwogbGli
L01ha2VmaWxlICAgICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2xpYi9LY29uZmlnLmRlYnVnIGIvbGliL0tjb25maWcuZGVidWcKaW5kZXgg
NTk2MGUyOTgwYThhLi4xYzY5NjQwZTcxMmYgMTAwNjQ0Ci0tLSBhL2xpYi9LY29uZmlnLmRlYnVn
CisrKyBiL2xpYi9LY29uZmlnLmRlYnVnCkBAIC0xNjgxLDYgKzE2ODEsOCBAQCBjb25maWcgUFJP
VklERV9PSENJMTM5NF9ETUFfSU5JVAogCiAJICBTZWUgRG9jdW1lbnRhdGlvbi9kZWJ1Z2dpbmct
dmlhLW9oY2kxMzk0LnR4dCBmb3IgbW9yZSBpbmZvcm1hdGlvbi4KIAorc291cmNlICJsaWIva3Vu
aXQvS2NvbmZpZyIKKwogbWVudWNvbmZpZyBSVU5USU1FX1RFU1RJTkdfTUVOVQogCWJvb2wgIlJ1
bnRpbWUgVGVzdGluZyIKIAlkZWZfYm9vbCB5CmRpZmYgLS1naXQgYS9saWIvTWFrZWZpbGUgYi9s
aWIvTWFrZWZpbGUKaW5kZXggMjljMDJhOTI0OTczLi42N2U3OWQzNzI0ZWQgMTAwNjQ0Ci0tLSBh
L2xpYi9NYWtlZmlsZQorKysgYi9saWIvTWFrZWZpbGUKQEAgLTk2LDYgKzk2LDggQEAgb2JqLSQo
Q09ORklHX1RFU1RfTUVNSU5JVCkgKz0gdGVzdF9tZW1pbml0Lm8KIAogb2JqLSQoQ09ORklHX1RF
U1RfTElWRVBBVENIKSArPSBsaXZlcGF0Y2gvCiAKK29iai0kKENPTkZJR19LVU5JVCkgKz0ga3Vu
aXQvCisKIGlmZXEgKCQoQ09ORklHX0RFQlVHX0tPQkpFQ1QpLHkpCiBDRkxBR1Nfa29iamVjdC5v
ICs9IC1EREVCVUcKIENGTEFHU19rb2JqZWN0X3VldmVudC5vICs9IC1EREVCVUcKLS0gCjIuMjMu
MC4zNTEuZ2M0MzE3MDMyZTYtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
