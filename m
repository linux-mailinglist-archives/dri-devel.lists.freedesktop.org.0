Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48052A742
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 00:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DFD6E193;
	Sat, 25 May 2019 22:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30446E193;
 Sat, 25 May 2019 22:41:55 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id z6so12791517qkl.10;
 Sat, 25 May 2019 15:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wDArQINw8ELzPUebApXhBW7+seMGLb3SgCZP5Ql0H6Y=;
 b=F8+JkM3oTWhfrSZUlvaJNEUGa9sNlkfwZvORKEWTr7kuoNtceTbsyDLBu/3CvvkD2t
 mH8qAa2OMMFFt/E0s8aZXUdoONKsV2TlY8/vQ1yVLYW5iFlbOEw/Uj4rgMUJoE85OAng
 FOO4XUtKorLJIkRyJSZqoyfnTHa4sdvJp/pExdtmvjoL1R2zZoHzGUmmOIS3HQM7Gi4l
 FwEeZDp+V3+y0P5RszMZ763HKDreFIbDcMnqd/9Cu05D3PueDTNOIELgiSyDULsYg2vU
 /dqi9Zte39kUbumTvg7z950Oby8nGfTrn2IgJL9rhstil7LhZc5YIu016YpmS2Kr1jVh
 k3kw==
X-Gm-Message-State: APjAAAWLAIef6oMQrMcxs0k1UsnBd7Pc4gYEMgnC2X7STS+Nx/TorhkO
 m7w+F+8KjcovHfaGYlCSy78=
X-Google-Smtp-Source: APXvYqyXPBVykIL2KpussrJZpxhkHFac4dvDwxIUAid2H7bdyEU0KfSHanMxbufvVupcl/HnWpiRDA==
X-Received: by 2002:ae9:e50f:: with SMTP id w15mr3645373qkf.297.1558824114925; 
 Sat, 25 May 2019 15:41:54 -0700 (PDT)
Received: from athos.fios-router.home
 (pool-173-68-20-215.nycmny.fios.verizon.net. [173.68.20.215])
 by smtp.gmail.com with ESMTPSA id 102sm1576876qte.52.2019.05.25.15.41.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 15:41:53 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: bskeggs@redhat.com
Subject: [PATCH 2/2] drm/nouveau/disp/nv50-: fix center/aspect-corrected
 scaling
Date: Sat, 25 May 2019 18:41:49 -0400
Message-Id: <20190525224149.4652-2-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190525224149.4652-1-imirkin@alum.mit.edu>
References: <20190525224149.4652-1-imirkin@alum.mit.edu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wDArQINw8ELzPUebApXhBW7+seMGLb3SgCZP5Ql0H6Y=;
 b=hn7RAbnLiunf11fW5kbXqZdnJ3Q4jMMcbeykzhp1vnr7ES3JUdXYw71CU24/qTDbFQ
 7nRYNrTcZThibjx3hAjGHNs4Ss+j8bQgkGKmPU3KxbvnbfuRDFbZiqIdwO4T2oUht2S5
 ZlaLyAz7BhwgB0wcxdGWaoDn3ogpeuB/LZmotVVRW+/OA+fowCfiNBgaVrEWBDqV4USf
 yv6/C0zAljsXTUrsSZ+sVT9CSN2feulEOxcVqJq+8pCtia0rc38L9F30mUd2mfr1VANL
 BlmmuFn7clIHLgcVNMiVuuSrd6XddO4C8Hx47f5Gk4hkWGF35jIPQiV9KqaJdRUb1RBE
 s3Nw==
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJldmlvdXNseSBjZW50ZXIgc2NhbGluZyB3b3VsZCBnZXQgc2NhbGluZyBhcHBsaWVkIHRvIGl0
ICh3aGVuIGl0IHdhcwpvbmx5IHN1cHBvc2VkIHRvIGNlbnRlciB0aGUgaW1hZ2UpLCBhbmQgYXNw
ZWN0LWNvcnJlY3RlZCBzY2FsaW5nIGRpZCBub3QKYWx3YXlzIGNvcnJlY3RseSBwaWNrIHdoZXRo
ZXIgdG8gcmVkdWNlIHdpZHRoIG9yIGhlaWdodCBmb3IgYSBwYXJ0aWN1bGFyCmNvbWJpbmF0aW9u
IG9mIGlucHV0cy9vdXRwdXRzLgoKQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5v
cmcvc2hvd19idWcuY2dpP2lkPTExMDY2MApTaWduZWQtb2ZmLWJ5OiBJbGlhIE1pcmtpbiA8aW1p
cmtpbkBhbHVtLm1pdC5lZHU+Ci0tLQoKVGVzdGVkIG9uIGEgMTkyMHgxMjAwLW5hdGl2ZSBzY3Jl
ZW4gd2l0aCBhIDY0MHg0ODAgbW9kZSAoZ290IGxldHRlcgpib3hlcyBvbiB0aGUgc2lkZSkgYW5k
IDcyMHg0MDAgbW9kZSAoZ290IGxldHRlciBib3hlcyBvbiB0b3AvYm90dG9tKS4KCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkLmMgfCAyOCArKysrKysrKysrKysrKysrKysr
KystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkLmMKaW5kZXggYWM5N2ViY2U1YjM1
Li5lMjIwNzk5MGQzY2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3Bu
djUwL2hlYWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkLmMK
QEAgLTE2OSwxNCArMTY5LDM0IEBAIG52NTBfaGVhZF9hdG9taWNfY2hlY2tfdmlldyhzdHJ1Y3Qg
bnY1MF9oZWFkX2F0b20gKmFybWgsCiAJICovCiAJc3dpdGNoIChtb2RlKSB7CiAJY2FzZSBEUk1f
TU9ERV9TQ0FMRV9DRU5URVI6Ci0JCWFzeWgtPnZpZXcub1cgPSBtaW4oKHUxNil1bW9kZS0+aGRp
c3BsYXksIGFzeWgtPnZpZXcub1cpOwotCQlhc3loLT52aWV3Lm9IID0gbWluKCh1MTYpdW1vZGVf
dmRpc3BsYXksIGFzeWgtPnZpZXcub0gpOwotCQkvKiBmYWxsLXRocm91Z2ggKi8KKwkJLyogTk9U
RTogVGhpcyB3aWxsIGNhdXNlIHNjYWxpbmcgd2hlbiB0aGUgaW5wdXQgaXMKKwkJICogbGFyZ2Vy
IHRoYW4gdGhlIG91dHB1dC4KKwkJICovCisJCWFzeWgtPnZpZXcub1cgPSBtaW4oYXN5aC0+dmll
dy5pVywgYXN5aC0+dmlldy5vVyk7CisJCWFzeWgtPnZpZXcub0ggPSBtaW4oYXN5aC0+dmlldy5p
SCwgYXN5aC0+dmlldy5vSCk7CisJCWJyZWFrOwogCWNhc2UgRFJNX01PREVfU0NBTEVfQVNQRUNU
OgotCQlpZiAoYXN5aC0+dmlldy5vSCA8IGFzeWgtPnZpZXcub1cpIHsKKwkJLyogRGV0ZXJtaW5l
IHdoZXRoZXIgdGhlIHNjYWxpbmcgc2hvdWxkIGJlIG9uIHdpZHRoIG9yIG9uCisJCSAqIGhlaWdo
dC4gVGhpcyBpcyBkb25lIGJ5IGNvbXBhcmluZyB0aGUgYXNwZWN0IHJhdGlvcyBvZiB0aGUKKwkJ
ICogc2l6ZXMuIElmIHRoZSBvdXRwdXQgQVIgaXMgbGFyZ2VyIHRoYW4gaW5wdXQgQVIsIHRoYXQg
bWVhbnMKKwkJICogd2Ugd2FudCB0byBjaGFuZ2UgdGhlIHdpZHRoIChsZXR0ZXJib3hlZCBvbiB0
aGUKKwkJICogbGVmdC9yaWdodCksIG90aGVyd2lzZSBvbiB0aGUgaGVpZ2h0IChsZXR0ZXJib3hl
ZCBvbiB0aGUKKwkJICogdG9wL2JvdHRvbSkuCisJCSAqCisJCSAqIEUuZy4gNDozICgxLjMzMykg
QVIgaW1hZ2UgZGlzcGxheWVkIG9uIGEgMTY6MTAgKDEuNikgQVIKKwkJICogc2NyZWVuIHdpbGwg
aGF2ZSBsZXR0ZXJib3hlcyBvbiB0aGUgbGVmdC9yaWdodC4gSG93ZXZlciBhCisJCSAqIDE2Ojkg
KDEuNzc3KSBBUiBpbWFnZSBvbiB0aGF0IHNhbWUgc2NyZWVuIHdpbGwgaGF2ZQorCQkgKiBsZXR0
ZXJib3hlcyBvbiB0aGUgdG9wL2JvdHRvbS4KKwkJICoKKwkJICogaW5wdXRBUiA9IGlXIC8gaUg7
IG91dHB1dEFSID0gb1cgLyBvSAorCQkgKiBvdXRwdXRBUiA+IGlucHV0QVIgaXMgZXF1aXZhbGVu
dCB0byBvVyAqIGlIID4gaVcgKiBvSAorCQkgKi8KKwkJaWYgKGFzeWgtPnZpZXcub1cgKiBhc3lo
LT52aWV3LmlIID4gYXN5aC0+dmlldy5pVyAqIGFzeWgtPnZpZXcub0gpIHsKKwkJCS8qIFJlY29t
cHV0ZSBvdXRwdXQgd2lkdGgsIGkuZS4gbGVmdC9yaWdodCBsZXR0ZXJib3ggKi8KIAkJCXUzMiBy
ID0gKGFzeWgtPnZpZXcuaVcgPDwgMTkpIC8gYXN5aC0+dmlldy5pSDsKIAkJCWFzeWgtPnZpZXcu
b1cgPSAoKGFzeWgtPnZpZXcub0ggKiByKSArIChyIC8gMikpID4+IDE5OwogCQl9IGVsc2Ugewor
CQkJLyogUmVjb21wdXRlIG91dHB1dCBoZWlnaHQsIGkuZS4gdG9wL2JvdHRvbSBsZXR0ZXJib3gg
Ki8KIAkJCXUzMiByID0gKGFzeWgtPnZpZXcuaUggPDwgMTkpIC8gYXN5aC0+dmlldy5pVzsKIAkJ
CWFzeWgtPnZpZXcub0ggPSAoKGFzeWgtPnZpZXcub1cgKiByKSArIChyIC8gMikpID4+IDE5Owog
CQl9Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
