Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8210C2C44F3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 17:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7086EA25;
	Wed, 25 Nov 2020 16:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19996EA23
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 16:25:47 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 1so2695122wme.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 08:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S5C08Hy1XMQFC0buOh9jSFHuZ0iwVVw80p1E5iRWSvg=;
 b=jVHAscAYlfUZpaUDcWeAN+ImydgMtSo0J4j+H0r2qtoN4JmJx9Vve4jifNb53zuGqi
 Ho1AFwAoWORedY91OsjnrVbKw6hwQJ2Kv5B8EMyK5Y7KSllnc5Cw2fu9iTZNFFbiKE7V
 xTc7fqCfuiYJbUWlEUEfD8UXGnYqpwS8fW1sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S5C08Hy1XMQFC0buOh9jSFHuZ0iwVVw80p1E5iRWSvg=;
 b=XdYNy4N6S1n+RnWnEdz2JCqlfmAbtApWUJFUW3hOvOW9zPsEkozHd3xxRSs0ANJhYW
 YEFfj/Ja7aKentA1ql38l2okEHA/IBls2PBOXka9kSlDTlAH/BYN3/Tx86X6QoK5fDht
 Y9gH8YdxpNF1axes0+Sv56Hmz9umemj0BVPBRfCXPaCeHZb2X6KDchjeJD7IVEPPBwUy
 rqoyrhdM2CAvYDZzJGH0p5ZeWxCprl5pvMllvxVtZDnZKmZqKvB6P3PWB7CKTCb0LfD8
 1ymat4wWCsvRpnudHw8z6tYf83M1Mx74WzPSLRUZA7Nv6y1AOy9VszYwdK05HdcbKxoA
 dX6A==
X-Gm-Message-State: AOAM53183CKhQsx0DHTyMtjbRLsiXqZZmGLsIHTDc4roeDCJY0yGEOtm
 yGzKQFJ4LlBm9DRcyvIIIG5sGuOAM4Qo/Q==
X-Google-Smtp-Source: ABdhPJxvYwNleTXWY/S3WavDz5/k2r0sp2h9zjamdvz+WUc8Vx3B5vSrofONxe4Fcqlg5PcbCQYGaQ==
X-Received: by 2002:a7b:c3ce:: with SMTP id t14mr4768131wmj.170.1606321543202; 
 Wed, 25 Nov 2020 08:25:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a21sm4855187wmb.38.2020.11.25.08.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 08:25:42 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 3/3] locking/selftests: Add testcases for fs_reclaim
Date: Wed, 25 Nov 2020 17:25:31 +0100
Message-Id: <20201125162532.1299794-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125162532.1299794-1-daniel.vetter@ffwll.ch>
References: <20201125162532.1299794-1-daniel.vetter@ffwll.ch>
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
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dave Chinner <david@fromorbit.com>, LKML <linux-kernel@vger.kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, Qian Cai <cai@lca.pw>,
 linux-fsdevel@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UgSSBidXRjaGVyZWQgdGhpcyBJIGZpZ3VyZWQgYmV0dGVyIHRvIG1ha2Ugc3VyZSB3ZSBo
YXZlIHRlc3RjYXNlcwpmb3IgdGhpcyBub3cuIFNpbmNlIHdlIG9ubHkgaGF2ZSBhIGxvY2tpbmcg
Y29udGV4dCBmb3IgX19HRlBfRlMgdGhhdCdzCnRoZSBvbmx5IHRoaW5nIHdlJ3JlIHRlc3Rpbmcg
cmlnaHQgbm93LgoKQWNrZWQtYnk6IFBldGVyIFppamxzdHJhIChJbnRlbCkgPHBldGVyekBpbmZy
YWRlYWQub3JnPgpDYzogbGludXgtZnNkZXZlbEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IERhdmUgQ2hp
bm5lciA8ZGF2aWRAZnJvbW9yYml0LmNvbT4KQ2M6IFFpYW4gQ2FpIDxjYWlAbGNhLnB3PgpDYzog
bGludXgteGZzQHZnZXIua2VybmVsLm9yZwpDYzogVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSA8
dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4KQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91
bmRhdGlvbi5vcmc+CkNjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+CkNjOiBs
aW51eC1tbUBrdmFjay5vcmcKQ2M6IGxpbnV4LXJkbWFAdmdlci5rZXJuZWwub3JnCkNjOiBNYWFy
dGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogIk1hdHRoZXcgV2ls
Y294IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBQZXRlciBaaWpsc3RyYSA8cGV0
ZXJ6QGluZnJhZGVhZC5vcmc+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KQ2M6
IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+CkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnCi0tLQogbGliL2xvY2tpbmctc2VsZnRlc3QuYyB8IDQ3ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9saWIvbG9ja2luZy1zZWxmdGVzdC5jIGIvbGliL2xvY2tpbmctc2Vs
ZnRlc3QuYwppbmRleCBhODk5YjNmMGUyZTUuLmFkNDdjMzM1OGUzMCAxMDA2NDQKLS0tIGEvbGli
L2xvY2tpbmctc2VsZnRlc3QuYworKysgYi9saWIvbG9ja2luZy1zZWxmdGVzdC5jCkBAIC0xNSw2
ICsxNSw3IEBACiAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4KICNpbmNsdWRlIDxsaW51eC93d19t
dXRleC5oPgogI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+CisjaW5jbHVkZSA8bGludXgvc2NoZWQv
bW0uaD4KICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L2xvY2tkZXAu
aD4KICNpbmNsdWRlIDxsaW51eC9zcGlubG9jay5oPgpAQCAtMjM1Nyw2ICsyMzU4LDUwIEBAIHN0
YXRpYyB2b2lkIHF1ZXVlZF9yZWFkX2xvY2tfdGVzdHModm9pZCkKIAlwcl9jb250KCJcbiIpOwog
fQogCitzdGF0aWMgdm9pZCBmc19yZWNsYWltX2NvcnJlY3RfbmVzdGluZyh2b2lkKQoreworCWZz
X3JlY2xhaW1fYWNxdWlyZShHRlBfS0VSTkVMKTsKKwltaWdodF9hbGxvYyhHRlBfTk9GUyk7CisJ
ZnNfcmVjbGFpbV9yZWxlYXNlKEdGUF9LRVJORUwpOworfQorCitzdGF0aWMgdm9pZCBmc19yZWNs
YWltX3dyb25nX25lc3Rpbmcodm9pZCkKK3sKKwlmc19yZWNsYWltX2FjcXVpcmUoR0ZQX0tFUk5F
TCk7CisJbWlnaHRfYWxsb2MoR0ZQX0tFUk5FTCk7CisJZnNfcmVjbGFpbV9yZWxlYXNlKEdGUF9L
RVJORUwpOworfQorCitzdGF0aWMgdm9pZCBmc19yZWNsYWltX3Byb3RlY3RlZF9uZXN0aW5nKHZv
aWQpCit7CisJdW5zaWduZWQgaW50IGZsYWdzOworCisJZnNfcmVjbGFpbV9hY3F1aXJlKEdGUF9L
RVJORUwpOworCWZsYWdzID0gbWVtYWxsb2Nfbm9mc19zYXZlKCk7CisJbWlnaHRfYWxsb2MoR0ZQ
X0tFUk5FTCk7CisJbWVtYWxsb2Nfbm9mc19yZXN0b3JlKGZsYWdzKTsKKwlmc19yZWNsYWltX3Jl
bGVhc2UoR0ZQX0tFUk5FTCk7Cit9CisKK3N0YXRpYyB2b2lkIGZzX3JlY2xhaW1fdGVzdHModm9p
ZCkKK3sKKwlwcmludGsoIiAgLS0tLS0tLS0tLS0tLS0tLS0tLS1cbiIpOworCXByaW50aygiICB8
IGZzX3JlY2xhaW0gdGVzdHMgfFxuIik7CisJcHJpbnRrKCIgIC0tLS0tLS0tLS0tLS0tLS0tLS0t
XG4iKTsKKworCXByaW50X3Rlc3RuYW1lKCJjb3JyZWN0IG5lc3RpbmciKTsKKwlkb3Rlc3QoZnNf
cmVjbGFpbV9jb3JyZWN0X25lc3RpbmcsIFNVQ0NFU1MsIDApOworCXByX2NvbnQoIlxuIik7CisK
KwlwcmludF90ZXN0bmFtZSgid3JvbmcgbmVzdGluZyIpOworCWRvdGVzdChmc19yZWNsYWltX3dy
b25nX25lc3RpbmcsIEZBSUxVUkUsIDApOworCXByX2NvbnQoIlxuIik7CisKKwlwcmludF90ZXN0
bmFtZSgicHJvdGVjdGVkIG5lc3RpbmciKTsKKwlkb3Rlc3QoZnNfcmVjbGFpbV9wcm90ZWN0ZWRf
bmVzdGluZywgU1VDQ0VTUywgMCk7CisJcHJfY29udCgiXG4iKTsKK30KKwogdm9pZCBsb2NraW5n
X3NlbGZ0ZXN0KHZvaWQpCiB7CiAJLyoKQEAgLTI0NzgsNiArMjUyMyw4IEBAIHZvaWQgbG9ja2lu
Z19zZWxmdGVzdCh2b2lkKQogCWlmIChJU19FTkFCTEVEKENPTkZJR19RVUVVRURfUldMT0NLUykp
CiAJCXF1ZXVlZF9yZWFkX2xvY2tfdGVzdHMoKTsKIAorCWZzX3JlY2xhaW1fdGVzdHMoKTsKKwog
CWlmICh1bmV4cGVjdGVkX3Rlc3RjYXNlX2ZhaWx1cmVzKSB7CiAJCXByaW50aygiLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1c
biIpOwogCQlkZWJ1Z19sb2NrcyA9IDA7Ci0tIAoyLjI5LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
