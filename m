Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902F58A5C9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 20:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1ED6E5AB;
	Mon, 12 Aug 2019 18:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D45C6E59E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 18:24:56 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id 191so66743830pfy.20
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 11:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XDtrvkw0RFhKlN+LitTFqDIh4jTE9hk9LUw2Z5/BXjo=;
 b=VBxsUlWD1yDVL40J07bFSX+pT9pU7kmiDsLcRa5sUANDQVjwR9u1kLV/XdLNZmRAzF
 cq/Pj1G14HxGadGcmVRvXhrgxAMHKF6FBk+SriL/1itcbjdr/hqUzajrEy3ngWwrIFvK
 dnFw54DAzjFb1/72ABrsvo6K8xCt5ji+aOL7gyK4ArVW8m9fu9vEuWPQykeGDgvOwTa1
 9b2tWkor0Px8iUz8ZwiyWvSRewcLEPsRFKMM4LCoM40Oy6rguOSqGOyG1it8z1I0tJ0o
 OYe8Rxebkq6nJy6dex1Bkwc1zRrITrNbsCpCfjvaKd+CZHPJuD9TZNWxM5voSee83ajA
 pDfA==
X-Gm-Message-State: APjAAAXhn1nQuX34E0xW2ZX2sT8EItOnNRWhDSmR6YG1sf8tny+eicu1
 doXdcLNdBw1rD9HIjCO1fctewBT+nS+lliaHgm9hjQ==
X-Google-Smtp-Source: APXvYqxojx8ZAclLIuaCdYnMNf57BJdquOeV+3jxKMDZqemroKozL9g2ej9A9l9TB9EWj+QedGRVRvM2JXu6kLXD8V2awA==
X-Received: by 2002:a63:fe52:: with SMTP id x18mr32603743pgj.344.1565634295264; 
 Mon, 12 Aug 2019 11:24:55 -0700 (PDT)
Date: Mon, 12 Aug 2019 11:24:09 -0700
In-Reply-To: <20190812182421.141150-1-brendanhiggins@google.com>
Message-Id: <20190812182421.141150-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v12 06/18] kbuild: enable building KUnit
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=XDtrvkw0RFhKlN+LitTFqDIh4jTE9hk9LUw2Z5/BXjo=;
 b=Ac+IVyvk7parVxP2zH0uEVQKxR0ydkkSBoXdSfu6yTKAkHTUbHxzBAVJSs/41U/W+1
 q/YatPQqWA+RWEYP82fguAlLV+fLGTo46TX/ZZJftwBdAcJ6HgP8V4O05CrdFClEIc0+
 rOnN4FLNTcMxTMlJC9Vyb2s//YDejC9bkwHAwoQuDnN/ipNdDwP464Ix9QVO/9i9s7Zh
 3mCvvV+ZIxY7d/r2HpEWZRBnPGmFfx/oXxzr3p9KP80V4xAzziJYzk7/qh8u4S4qz4J/
 yFL4wqLruRhlh4n1ddmkBTvfGDu7jfPITZaKXRpIf+n1o8kmNZAL1VtOwqX/GZ+qXvSE
 Q4LQ==
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
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 Michal Marek <michal.lkml@markovi.net>, richard@nod.at, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S1VuaXQgaXMgYSBuZXcgdW5pdCB0ZXN0aW5nIGZyYW1ld29yayBmb3IgdGhlIGtlcm5lbCBhbmQg
d2hlbiB1c2VkIGlzCmJ1aWx0IGludG8gdGhlIGtlcm5lbCBhcyBhIHBhcnQgb2YgaXQuIEFkZCBL
VW5pdCB0byB0aGUgcm9vdCBLY29uZmlnIGFuZApNYWtlZmlsZSB0byBhbGxvdyBpdCB0byBiZSBh
Y3R1YWxseSBidWlsdC4KClNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhp
Z2dpbnNAZ29vZ2xlLmNvbT4KQWNrZWQtYnk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2Fo
aXJvQHNvY2lvbmV4dC5jb20+CkNjOiBNaWNoYWwgTWFyZWsgPG1pY2hhbC5sa21sQG1hcmtvdmku
bmV0PgpSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KUmV2aWV3ZWQtYnk6IExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNv
bT4KUmV2aWV3ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KLS0tCiBLY29u
ZmlnICB8IDIgKysKIE1ha2VmaWxlIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9LY29uZmlnIGIvS2NvbmZpZwppbmRleCBlMTBiM2VlMDg0ZDRk
Li40Nzg4NmRiZDZjMmE2IDEwMDY0NAotLS0gYS9LY29uZmlnCisrKyBiL0tjb25maWcKQEAgLTMy
LDMgKzMyLDUgQEAgc291cmNlICJsaWIvS2NvbmZpZyIKIHNvdXJjZSAibGliL0tjb25maWcuZGVi
dWciCiAKIHNvdXJjZSAiRG9jdW1lbnRhdGlvbi9LY29uZmlnIgorCitzb3VyY2UgImt1bml0L0tj
b25maWciCmRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCmluZGV4IDIzY2RmMWY0MTM2
NDYuLjM3OTVkMGE1ZDAzNzYgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBA
IC0xMDA1LDYgKzEwMDUsOCBAQCBQSE9OWSArPSBwcmVwYXJlMAogaWZlcSAoJChLQlVJTERfRVhU
TU9EKSwpCiBjb3JlLXkJCSs9IGtlcm5lbC8gY2VydHMvIG1tLyBmcy8gaXBjLyBzZWN1cml0eS8g
Y3J5cHRvLyBibG9jay8KIAorY29yZS0kKENPTkZJR19LVU5JVCkgKz0ga3VuaXQvCisKIHZtbGlu
dXgtZGlycwk6PSAkKHBhdHN1YnN0ICUvLCUsJChmaWx0ZXIgJS8sICQoaW5pdC15KSAkKGluaXQt
bSkgXAogCQkgICAgICQoY29yZS15KSAkKGNvcmUtbSkgJChkcml2ZXJzLXkpICQoZHJpdmVycy1t
KSBcCiAJCSAgICAgJChuZXQteSkgJChuZXQtbSkgJChsaWJzLXkpICQobGlicy1tKSAkKHZpcnQt
eSkpKQotLSAKMi4yMy4wLnJjMS4xNTMuZ2RlZWQ4MDMzMGYtZ29vZwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
