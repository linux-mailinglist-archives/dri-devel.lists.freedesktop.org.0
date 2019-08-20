Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C096D2F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 01:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE74C6E8DF;
	Tue, 20 Aug 2019 23:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0756E8D9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 23:21:10 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id n9so192881pgq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 16:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XDtrvkw0RFhKlN+LitTFqDIh4jTE9hk9LUw2Z5/BXjo=;
 b=c2OAfWuXEqiP8IvfRaS92KZVFpEP8p235YQJ9eF9S5t0PNUXSB7kuYAxW30PQj61jN
 Ld/JguNecXs28o83rr8/eANhWN0teHe3e6L56zfdtTsHl9BL9HTKhu25XcBF/t7Pv1xl
 BNxRPbasZv7bEZjOoa8hqnvm7spYP0eGrkyFcMPzzGVCuI0F4l8csbVdjrsKftCJ0WCM
 m6DebEv91HZ3ujWRDJ3Y0Q8s675qtYJ3sQuYxMq+pwBcU6HZKPuj0gq3TGPrbF7Bh3tJ
 MTJV6rjCpuhjvPH5dj2+AJWewOn2Pw4DHBG6Y/xCbKFiD70IeEQFD3Pe/4nYSNbcr/we
 cS8g==
X-Gm-Message-State: APjAAAUJfFOQAG0NlD/qMLGp6YI8rwAmgMirlgRdHBgo2FmLbxJUPQpc
 8tfkYToYfnkYL7BwoLPFL2iwhCNAntbJqAwE5olu6A==
X-Google-Smtp-Source: APXvYqwnRfaDdNNQbwqYi1sBE/pq+1Vm1Sa6tTF8ExzVh/t1i5vgUriUWM0c3aCP4jWc1mxnMQ3Gtejv3fCq1fQ0LkUxoA==
X-Received: by 2002:a63:460d:: with SMTP id t13mr26021274pga.205.1566343269803; 
 Tue, 20 Aug 2019 16:21:09 -0700 (PDT)
Date: Tue, 20 Aug 2019 16:20:34 -0700
In-Reply-To: <20190820232046.50175-1-brendanhiggins@google.com>
Message-Id: <20190820232046.50175-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190820232046.50175-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v14 06/18] kbuild: enable building KUnit
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
 b=GfB79yRsARKNmez787qOELsZmZ3ww5c5KdNG+MLM0ZkalMFVMmzyjPSn7wZeKhOphO
 BJWZzy7YmkXN9/UgkFTtef1jj4+FlXlngojqX89H7vuOPC0dYVsNdB9owDKZLENOO6L5
 mxaSuOLfjrFzQEiAZ9YZ1XMnJWlLFr+j5jaqMZyZSETAJxRVYZ3vcpGhrvvLt0+24Fkg
 GZ+bfBrp0EHb5FcC7VXGQ67bGympCSJmn5xE411lPMKlT0PWqRWUEwUdiREWT5Re1UX4
 RFh+MSnWSjrJ6WwkjZADkd8PAGH3yovb64iBwHH4kCoaMcvhoh9Vu+pgfCSgkklmMJmE
 GyDw==
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
