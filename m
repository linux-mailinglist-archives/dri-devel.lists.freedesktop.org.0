Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2D62864DB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 18:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5EB6E95E;
	Wed,  7 Oct 2020 16:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDD26E959
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 16:44:47 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e17so2959841wru.12
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 09:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P02GBIE7m0UGj1Ja16VfRtl1rny8rrQDbz10f0cDTbo=;
 b=jOfg2aPb+p2PctbbcpGPk2VTV8x+SKSCmFeHr5kNnGpMzP9+KndzTdMPcmKSmVIBOL
 Sn8AtpmXpRju+60FUKJKw5WoTBtH4QSJvymhz/0+3ZeCxQuRUo3jPklVq4Ib9EuOwEj2
 sPoeQoG2BgasR1J/L7Iui7jQ8XopY468hCzwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P02GBIE7m0UGj1Ja16VfRtl1rny8rrQDbz10f0cDTbo=;
 b=cuZaj4zMM+81TAr6yGlCw/lsY8p2VuHkJ9gRpEIuS1R/0AxvDFiQjzpOP30MuLYJVd
 BOfHCPbWQbT5e2NWiGW7KGbcFRUmmtmQHV2TaG78Jhi5iYUCY5OEh+sSyZOiBe8G7zPc
 nOg4DJ8ikBqAz0oHKwZmGeVAUuySfRtYXv7gAN0KEOwU10l2K2qwVPQRoFeBXmJVs5KZ
 7kvrq/HUjSLSTJN/07XLVQcaOTepvFQandBA+RLO6q21jJMJ0bVvTSDv8f1NAdHFbt+a
 QEaBD6j+Enb1edB7NwPmtRcSuIqLTo2lmK4RrLugDofzl3KRffcmKyylrVZfTk1Vw3hK
 1B/w==
X-Gm-Message-State: AOAM533xdf3Ul6+EArg/ukqtGPZIBQ6E9ZP4Fxqj0u/D8kYDXzVwgVl/
 jKn6v2kNjjZXsCHQlHbKC8/QBpXKr+RzcSPq
X-Google-Smtp-Source: ABdhPJzCDfyCaOqONShrGzC8VJoQgNBmutXD42q/UwtrqERpH1arTrrensBhgkJDw5zkDOp6xBcjVA==
X-Received: by 2002:adf:ba4f:: with SMTP id t15mr4383017wrg.335.1602089086053; 
 Wed, 07 Oct 2020 09:44:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z191sm3332280wme.40.2020.10.07.09.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:44:45 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 09/13] PCI: obey iomem restrictions for procfs mmap
Date: Wed,  7 Oct 2020 18:44:22 +0200
Message-Id: <20201007164426.1812530-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-pci@vger.kernel.org,
 linux-mm@kvack.org, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyB0aHJlZSB3YXlzIHRvIGFjY2VzcyBwY2kgYmFycyBmcm9tIHVzZXJzcGFjZTogL2Rl
di9tZW0sIHN5c2ZzCmZpbGVzLCBhbmQgdGhlIG9sZCBwcm9jIGludGVyZmFjZS4gVHdvIGNoZWNr
IGFnYWluc3QKaW9tZW1faXNfZXhjbHVzaXZlLCBwcm9jIG5ldmVyIGRpZC4gQW5kIHdpdGggQ09O
RklHX0lPX1NUUklDVF9ERVZNRU0sCnRoaXMgc3RhcnRzIHRvIG1hdHRlciwgc2luY2Ugd2UgZG9u
J3Qgd2FudCByYW5kb20gdXNlcnNwYWNlIGhhdmluZwphY2Nlc3MgdG8gcGNpIGJhcnMgd2hpbGUg
YSBkcml2ZXIgaXMgbG9hZGVkIGFuZCB1c2luZyBpdC4KCkZpeCB0aGlzLgoKUmVmZXJlbmNlczog
OTBhNTQ1ZTk4MTI2ICgicmVzdHJpY3QgL2Rldi9tZW0gdG8gaWRsZSBpbyBtZW1vcnkgcmFuZ2Vz
IikKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+
CkNjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KQ2M6IEtlZXMgQ29vayA8a2Vlc2Nv
b2tAY2hyb21pdW0ub3JnPgpDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5j
b20+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogSm9o
biBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgpDYzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xp
c3NlQHJlZGhhdC5jb20+CkNjOiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgpDYzogRGFuIFdpbGxp
YW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CkNjOiBsaW51eC1tbUBrdmFjay5vcmcKQ2M6
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtc2Ftc3VuZy1z
b2NAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IEJq
b3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+CkNjOiBsaW51eC1wY2lAdmdlci5rZXJu
ZWwub3JnCi0tLQogZHJpdmVycy9wY2kvcHJvYy5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL3Byb2MuYyBiL2RyaXZl
cnMvcGNpL3Byb2MuYwppbmRleCBkMzUxODZiMDFkOTguLjNhMmY5MGJlYjRjYiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9wY2kvcHJvYy5jCisrKyBiL2RyaXZlcnMvcGNpL3Byb2MuYwpAQCAtMjc0LDYg
KzI3NCwxMSBAQCBzdGF0aWMgaW50IHByb2NfYnVzX3BjaV9tbWFwKHN0cnVjdCBmaWxlICpmaWxl
LCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIAkJZWxzZQogCQkJcmV0dXJuIC1FSU5WQUw7
CiAJfQorCisJaWYgKGRldi0+cmVzb3VyY2VbaV0uZmxhZ3MgJiBJT1JFU09VUkNFX01FTSAmJgor
CSAgICBpb21lbV9pc19leGNsdXNpdmUoZGV2LT5yZXNvdXJjZVtpXS5zdGFydCkpCisJCXJldHVy
biAtRUlOVkFMOworCiAJcmV0ID0gcGNpX21tYXBfcGFnZV9yYW5nZShkZXYsIGksIHZtYSwKIAkJ
CQkgIGZwcml2LT5tbWFwX3N0YXRlLCB3cml0ZV9jb21iaW5lKTsKIAlpZiAocmV0IDwgMCkKLS0g
CjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
