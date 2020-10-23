Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E28296EEA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DA26F56C;
	Fri, 23 Oct 2020 12:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEE66E5D2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:23:01 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k18so1287567wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fm+L1OZ5vnKeOGH1XwjpH65CAXQE2qGCwQHeV0BfCbo=;
 b=I4RFwd2eW9iNL5qH7GC2GN+bOEbVbW0io2ha60AXzDjB/0yYw4W1JK6yrbHeRAL0iY
 ISW+gqIaC+vP2a2lhS4YPj3Em5r0tFkHvuJ7lEUT60inNY0XgrlVSxFy5WXKshps7csM
 du6jwmFk8hHJwEqDf96AP/6FrBQrEHzL9do1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fm+L1OZ5vnKeOGH1XwjpH65CAXQE2qGCwQHeV0BfCbo=;
 b=HDLxHFHeHpBri6SjNGhG67upoDIH8vL9j4QWBLGRDwX8GSBpi8rpc4fPMFop1nz0hs
 mz9xW4H2Nqx0PxjPGiP66Vj/249z85KVK5i4gGWmS/9vzrPE0DeFCt+6rINhJTfDz5Bc
 jJFCsBI1ivu1+5spHwmF/2Huxh0KAJ03ds51YmfhzLDKW+OvntyL8/eTxY3ewExazjru
 pePW7CoTFmUs39Hdld5KuGjBJXyV2P4WaW9TDgFTxlfeCxCwFYZhg9WRJXNWVSe7Alo4
 oGt4ZZK2kxjDygdjhuhWwXSlsfry4PBaTOvPzElE9Vr9nT0o2k6krARahQ6w2NgQsIIc
 mqXQ==
X-Gm-Message-State: AOAM533YHwNuzxNGNtMBlW4rUhHy3WGEtleolkSXI+2KSBoFstLcjzAQ
 cDNWtwBbopGBP4jkztT1GnqQY85xcrdtvXYk
X-Google-Smtp-Source: ABdhPJyGjziGYIZ7LCrUaPvnmjitFLFb8BHzU6RIkZE3cezG0NmOKu92ESUHVoVpHKIYbtJBpxbBNA==
X-Received: by 2002:a1c:7409:: with SMTP id p9mr1939536wmc.167.1603455780340; 
 Fri, 23 Oct 2020 05:23:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:22:59 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 33/65] misc/habana: Use FOLL_LONGTERM for userptr
Date: Fri, 23 Oct 2020 14:21:44 +0200
Message-Id: <20201023122216.2373294-33-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-mm@kvack.org, Pawel Piskorski <ppiskorski@habana.ai>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ofir Bitton <obitton@habana.ai>, Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Tomer Tayar <ttayar@habana.ai>, Omer Shpigelman <oshpigelman@habana.ai>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Moti Haimovski <mhaimovski@habana.ai>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgYXJlIHBlcnNpc3RlbnQsIG5vdCBqdXN0IGZvciB0aGUgZHVyYXRpb24gb2YgYSBkbWEg
b3BlcmF0aW9uLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+CkNjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KQ2M6IEFuZHJldyBN
b3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBKb2huIEh1YmJhcmQgPGpodWJi
YXJkQG52aWRpYS5jb20+CkNjOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4K
Q2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxp
YW1zQGludGVsLmNvbT4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzogbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5v
cmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogT2RlZCBHYWJiYXkgPG9kZWQu
Z2FiYmF5QGdtYWlsLmNvbT4KQ2M6IE9tZXIgU2hwaWdlbG1hbiA8b3NocGlnZWxtYW5AaGFiYW5h
LmFpPgpDYzogT2ZpciBCaXR0b24gPG9iaXR0b25AaGFiYW5hLmFpPgpDYzogVG9tZXIgVGF5YXIg
PHR0YXlhckBoYWJhbmEuYWk+CkNjOiBNb3RpIEhhaW1vdnNraSA8bWhhaW1vdnNraUBoYWJhbmEu
YWk+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogR3JlZyBL
cm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IFBhd2VsIFBpc2tv
cnNraSA8cHBpc2tvcnNraUBoYWJhbmEuYWk+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29t
bW9uL21lbW9yeS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21tb24v
bWVtb3J5LmMgYi9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmMKaW5kZXgg
MzI3YjY0NDc5Zjk3Li43NjdkMzY0NGMwMzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWlzYy9oYWJh
bmFsYWJzL2NvbW1vbi9tZW1vcnkuYworKysgYi9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21t
b24vbWVtb3J5LmMKQEAgLTEyODgsNyArMTI4OCw4IEBAIHN0YXRpYyBpbnQgZ2V0X3VzZXJfbWVt
b3J5KHN0cnVjdCBobF9kZXZpY2UgKmhkZXYsIHU2NCBhZGRyLCB1NjQgc2l6ZSwKIAkJcmV0dXJu
IC1FTk9NRU07CiAJfQogCi0JcmMgPSBwaW5fdXNlcl9wYWdlc19mYXN0KHN0YXJ0LCBucGFnZXMs
IEZPTExfRk9SQ0UgfCBGT0xMX1dSSVRFLAorCXJjID0gcGluX3VzZXJfcGFnZXNfZmFzdChzdGFy
dCwgbnBhZ2VzLAorCQkJCSBGT0xMX0ZPUkNFIHwgRk9MTF9XUklURSB8IEZPTExfTE9OR1RFUk0s
CiAJCQkJIHVzZXJwdHItPnBhZ2VzKTsKIAogCWlmIChyYyAhPSBucGFnZXMpIHsKLS0gCjIuMjgu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
