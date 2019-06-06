Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FE43809C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 00:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA22F899DE;
	Thu,  6 Jun 2019 22:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E366899DC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 22:28:04 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id h10so5506435edi.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 15:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1I9sMdTtsYXfYIr7rVQo1r0PCEJ8mmlZIw88kpA45qo=;
 b=Np+0uv5GKrc6lmo+Cb6MKdS6QlJDrEA+x3g7/a3hrtdwUbpWc3rIBTBnv4XbHP2hqs
 LLY0ToCzRNoKd1YJveipv5SYOVs5EPKBJquAsMA/7boU4g+iIM68JfQDxI1UYxOYQHcU
 cTokHIzXQ69IEyeWLTxVYhm6XYY/NLCm2oXTqIogeETU/yjmI4WFhQg1gYM4aBjYeO7e
 KuShHDLsgaX9p/GaoY7B2lpnwaaS8rp2wJGWIr2mZk3lDaPOKcFfR+K/j4pLwuMWGBdq
 SzE+cD8YYkuGxUcrQaTQ/s1WfqmrK1524SxPA7yr99iGfOinrz6OyRSiEBUnZD0d5Nnl
 nhjQ==
X-Gm-Message-State: APjAAAVRJMWhkVSb6xAuiS6vSEt/C1cHTG5mkWutUTCfKAE8XhlgbRNL
 j5HXXreTYHNAivCD7fn53GAYNxuHybk=
X-Google-Smtp-Source: APXvYqxiiMZqnvdDmL931VmKRhN7LSyDzl2GZzvV8oVEahTGrMuMjIiyY4uJDXKCXzAAqWjT2bK41A==
X-Received: by 2002:a17:906:9256:: with SMTP id
 c22mr2586191ejx.172.1559860082918; 
 Thu, 06 Jun 2019 15:28:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z10sm54228edl.35.2019.06.06.15.28.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 15:28:02 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/10] drm/vkms: Use spin_lock_irq in process context
Date: Fri,  7 Jun 2019 00:27:43 +0200
Message-Id: <20190606222751.32567-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1I9sMdTtsYXfYIr7rVQo1r0PCEJ8mmlZIw88kpA45qo=;
 b=W/P2DUxM1+fk501VS2enDT/x/9MRepLNdmC+DjnJS7FOkNqL/TmL8hH4MUMuQjgd5c
 GGcqzqKEVS7xNebz2Gi6eqYc6Tk1q7ESAOCDhJRhU5/FW4XIIpVS+u3YbBT44C+qKlZm
 Bo768jZpwi7zoYOwJH04phINqZmXzzY7CRMlA=
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Shayenne Moura <shayenneluzmoura@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHdvcmtlciBpcyBhbHdheXMgaW4gcHJvY2VzcyBjb250ZXh0LCBubyBuZWVkIGZvciB0aGUg
X2lycXNhZmUKdmVyc2lvbi4gU2FtZSBmb3IgdGhlIHNldF9zb3VyY2UgY2FsbGJhY2ssIHRoYXQn
cyBvbmx5IGNhbGxlZCBmcm9tIHRoZQpkZWJ1Z2ZzIGhhbmRsZXIgaW4gYSBzeXNjYWxsLgoKQ2M6
IFNoYXllbm5lIE1vdXJhIDxzaGF5ZW5uZWx1em1vdXJhQGdtYWlsLmNvbT4KQ2M6IFJvZHJpZ28g
U2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IEhhbmVlbiBNb2hhbW1l
ZCA8aGFtb2hhbW1lZC5zYUBnbWFpbC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYyB8IDEwICsrKystLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS92a21zL3ZrbXNfY3JjLmMKaW5kZXggNjY2MDNkYTYzNGZlLi44ODNlMzZmZTdiNmUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3JjLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3ZrbXMvdmttc19jcmMuYwpAQCAtMTY3LDE2ICsxNjcsMTUgQEAgdm9pZCB2a21zX2NyY193
b3JrX2hhbmRsZShzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiAJdTMyIGNyYzMyID0gMDsKIAl1
NjQgZnJhbWVfc3RhcnQsIGZyYW1lX2VuZDsKIAlib29sIGNyY19wZW5kaW5nOwotCXVuc2lnbmVk
IGxvbmcgZmxhZ3M7CiAKLQlzcGluX2xvY2tfaXJxc2F2ZSgmb3V0LT5zdGF0ZV9sb2NrLCBmbGFn
cyk7CisJc3Bpbl9sb2NrX2lycSgmb3V0LT5zdGF0ZV9sb2NrKTsKIAlmcmFtZV9zdGFydCA9IGNy
dGNfc3RhdGUtPmZyYW1lX3N0YXJ0OwogCWZyYW1lX2VuZCA9IGNydGNfc3RhdGUtPmZyYW1lX2Vu
ZDsKIAljcmNfcGVuZGluZyA9IGNydGNfc3RhdGUtPmNyY19wZW5kaW5nOwogCWNydGNfc3RhdGUt
PmZyYW1lX3N0YXJ0ID0gMDsKIAljcnRjX3N0YXRlLT5mcmFtZV9lbmQgPSAwOwogCWNydGNfc3Rh
dGUtPmNyY19wZW5kaW5nID0gZmFsc2U7Ci0Jc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmb3V0LT5z
dGF0ZV9sb2NrLCBmbGFncyk7CisJc3Bpbl91bmxvY2tfaXJxKCZvdXQtPnN0YXRlX2xvY2spOwog
CiAJLyoKIAkgKiBXZSByYWNlZCB3aXRoIHRoZSB2YmxhbmsgaHJ0aW1lciBhbmQgcHJldmlvdXMg
d29yayBhbHJlYWR5IGNvbXB1dGVkCkBAIC0yNDYsNyArMjQ1LDYgQEAgaW50IHZrbXNfc2V0X2Ny
Y19zb3VyY2Uoc3RydWN0IGRybV9jcnRjICpjcnRjLCBjb25zdCBjaGFyICpzcmNfbmFtZSkKIHsK
IAlzdHJ1Y3Qgdmttc19vdXRwdXQgKm91dCA9IGRybV9jcnRjX3RvX3ZrbXNfb3V0cHV0KGNydGMp
OwogCWJvb2wgZW5hYmxlZCA9IGZhbHNlOwotCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAJaW50IHJl
dCA9IDA7CiAKIAlyZXQgPSB2a21zX2NyY19wYXJzZV9zb3VyY2Uoc3JjX25hbWUsICZlbmFibGVk
KTsKQEAgLTI1NCw5ICsyNTIsOSBAQCBpbnQgdmttc19zZXRfY3JjX3NvdXJjZShzdHJ1Y3QgZHJt
X2NydGMgKmNydGMsIGNvbnN0IGNoYXIgKnNyY19uYW1lKQogCS8qIG1ha2Ugc3VyZSBub3RoaW5n
IGlzIHNjaGVkdWxlZCBvbiBjcnRjIHdvcmtxICovCiAJZmx1c2hfd29ya3F1ZXVlKG91dC0+Y3Jj
X3dvcmtxKTsKIAotCXNwaW5fbG9ja19pcnFzYXZlKCZvdXQtPmxvY2ssIGZsYWdzKTsKKwlzcGlu
X2xvY2tfaXJxKCZvdXQtPmxvY2spOwogCW91dC0+Y3JjX2VuYWJsZWQgPSBlbmFibGVkOwotCXNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJm91dC0+bG9jaywgZmxhZ3MpOworCXNwaW5fdW5sb2NrX2ly
cSgmb3V0LT5sb2NrKTsKIAogCXJldHVybiByZXQ7CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
