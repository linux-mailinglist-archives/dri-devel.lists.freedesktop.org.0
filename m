Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB94BB054
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 11:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5A16E29B;
	Mon, 23 Sep 2019 09:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B51F6E283
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 09:03:12 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id p15so8231898plq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 02:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XOGsKwy33nriWO2piNArgCsTjyMNHJTJvDyvFgo5s6U=;
 b=mCmqEWhBQhgYJ9LgCxWYyN6ZBgkwRr5MRwdjKW/ASiPK/Q6BkqmMQYL5UJbQXqjMp9
 auj+7KP9Ee9ZXDbtsHXGKpktcaGh5JVkKezHJBvsVdUCjEIoZltg8MoneJ8i3YJxHaGY
 rO6qaGWYwx0K7kLMlqeVC+dSRTsghNaprX8ZrLm1gIjBQTmFsezD/gYacfNBIGEZobPe
 3ZGM9dRjJPtXvmPCDO5QCxtW7i14wrm/3kHXWAoCQ0ez+utMt5wrwubZcoPJIpQ+oxTz
 GlNDCMIzpS7kFAzGD1P7hKW+ekiXZBwZd8ghhlx2QYnqBgirLokm5d3C7y7Ax7v2rYoH
 MGyA==
X-Gm-Message-State: APjAAAXbefqKGExBAu1pqGI5XjszvUM85YcLWIckiP2lzkiVtPGQNm6I
 ZhT9QZHiHpBUSJhNjN/VoHF4hCKxS3TALC92ez/mwg==
X-Google-Smtp-Source: APXvYqzPRotA6TcjcX/eTkfjXx25mpD2OMLyTf6QgkxdyJUJa9UIamvT/GMsn5DUGJ9PJn3SfTrUnBsJoEKeNcvlLPCGJQ==
X-Received: by 2002:a63:487:: with SMTP id 129mr20038096pge.14.1569229391177; 
 Mon, 23 Sep 2019 02:03:11 -0700 (PDT)
Date: Mon, 23 Sep 2019 02:02:36 -0700
In-Reply-To: <20190923090249.127984-1-brendanhiggins@google.com>
Message-Id: <20190923090249.127984-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190923090249.127984-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
Subject: [PATCH v18 06/19] lib: enable building KUnit in lib/
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
 b=mXwU3V+FKUnh7EtzAXbRnlZt2+BzJmB577hg6dqpFKOKINBCJBmvRik9rFAxq7U+qO
 TO0IOP0HXoyq8DF7tcv4Sw+6NqcncbBlNZVLRB8IOXvGFZ0CWPFt4kXJJChXfj9wBeNA
 0TpQP7PWhwIPyTm2Gvducq6BRZOoHrZRa7PqdUHdEfIXSk96rGhb3YAwcsbnk5YIb2Ti
 bX6SvK1My90wFNd8GD19pxUe8PZqqKKMf81AvYg2RnSLQ8ZsSFI/pi79xHLq30VOWit5
 QBQZfbVkBRE5rAq+LH+AiH06ldWe0Thzohs2GTDYLqrvN+Dn8kr/3CaAjx6BiYzLYdRE
 ec8g==
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
