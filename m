Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FA07005B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 14:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F218970B;
	Mon, 22 Jul 2019 12:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9312C8970B;
 Mon, 22 Jul 2019 12:59:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l2so35231074wmg.0;
 Mon, 22 Jul 2019 05:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9JJUI9r4ZBuzXrXAQha3xxQKaLqKLDcjdWLwv+exu9I=;
 b=bOl8J2b7PQ1sTpMdsVWpFcdwD1c9erpB4YtgLTr2xMsXW5HTOqlc7zSeKF9QlkNfQt
 ipT+DId+6cOuCSGzhU7nLSu+et7Hoa32Cex5RN3/lHfkEdCAMAizTYopsDFOEIzpZm6v
 KIRdD35uoADBpHaEwO8pIozbTis9MZCye0o0ORtrojj3nGMIq76M2IoJCzfUXLxLrC6R
 PTqV8uA6P4HBVGslltoH/Zm/rIVodmvd7emAlt+hNSnM0v2iCOwqdi15EDeo+noeeaA2
 FVPRfs88hoXy56FNn7Bv+9mGuTn2RD58DldabUiABoJhyN/4HUGDP04LD7BTEGzH+euu
 BTkA==
X-Gm-Message-State: APjAAAUm5DMWAk/I8lCixULhhIzseORVxX5ghiOLdaVAxj7UZp5UX/TA
 PgPt7RiIEhxAmMjZaW8qFRdu2knx
X-Google-Smtp-Source: APXvYqxI51XXsyPEIwbrvg6mudJqo9ppu7d/fQJ3ISu6uZcofATkrXnkCMxIudn0gwZK6Xj4WqCHBw==
X-Received: by 2002:a1c:2c41:: with SMTP id s62mr63871981wms.8.1563800380115; 
 Mon, 22 Jul 2019 05:59:40 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:a512:9eca:e79f:c420])
 by smtp.gmail.com with ESMTPSA id e3sm35877754wrt.93.2019.07.22.05.59.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 05:59:39 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/syncobj: fix leaking dma_fence in drm_syncobj_query_ioctl
Date: Mon, 22 Jul 2019 14:59:38 +0200
Message-Id: <20190722125938.43308-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9JJUI9r4ZBuzXrXAQha3xxQKaLqKLDcjdWLwv+exu9I=;
 b=S+Qt9eZWWjl/+qPfm6nVCAAXRC8hjyzKTA7TYKkin/zvVrYi0lx56IIogha6Z0CO5n
 9vKxMSNf+LjvlziuDNAea2MS3dauTH/tsqRIA1bxOgG6wTmU6p0mBRYvMId5fwonoEoR
 C8xqZ/h/GgsHO8mJ8hQJwBF3ohG9RB0QnTrLcN5FRAb1NUhBAeN95ul/7h2ABn8m3Iqt
 A9LSAa5/rksenF9BUV8Zi87GRVWXIhkd31qm8Sd0cFey/wQK4/MTteqpvOibmcj71SZ8
 1mDJgRSr/ZMtwSAvsJtjd5DonuIHcuf6/0TkOxbABbN0z+yr19QCG4YUDI1yhLtnFsOK
 OlZQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbmVlZCB0byBjaGVjayB0aGUgY29udGV4dCBudW1iZXIgaW5zdGVhZCBpZiB0aGUgcHJldmlv
dXMgc2VxdWVuY2UgdG8gZGV0ZWN0CmFuIGVycm9yIGFuZCBpZiBhbiBlcnJvciBpcyBkZXRlY3Rl
ZCB3ZSBuZWVkIHRvIGRyb3AgdGhlIHJlZmVyZW5jZSB0byB0aGUKY3VycmVudCBmZW5jZSBvciBv
dGhlcndpc2Ugd291bGQgbGVhayBpdC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNv
YmouYyB8IDEwICsrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwppbmRleCA3NWNiNGJiNzYxOWUuLjE0Mzhk
Y2IzZWJiMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKQEAgLTEyOTgsMTQgKzEyOTgsMTQgQEAgaW50
IGRybV9zeW5jb2JqX3F1ZXJ5X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRh
dGEsCiAJCQlzdHJ1Y3QgZG1hX2ZlbmNlICppdGVyLCAqbGFzdF9zaWduYWxlZCA9IE5VTEw7CiAK
IAkJCWRtYV9mZW5jZV9jaGFpbl9mb3JfZWFjaChpdGVyLCBmZW5jZSkgewotCQkJCWlmICghaXRl
cikKLQkJCQkJYnJlYWs7Ci0JCQkJZG1hX2ZlbmNlX3B1dChsYXN0X3NpZ25hbGVkKTsKLQkJCQls
YXN0X3NpZ25hbGVkID0gZG1hX2ZlbmNlX2dldChpdGVyKTsKLQkJCQlpZiAoIXRvX2RtYV9mZW5j
ZV9jaGFpbihsYXN0X3NpZ25hbGVkKS0+cHJldl9zZXFubykKKwkJCQlpZiAoaXRlci0+Y29udGV4
dCAhPSBmZW5jZS0+Y29udGV4dCkgeworCQkJCQlkbWFfZmVuY2VfcHV0KGl0ZXIpOwogCQkJCQkv
KiBJdCBpcyBtb3N0IGxpa2VseSB0aGF0IHRpbWVsaW5lIGhhcwogCQkJCQkgKiB1bm9yZGVyIHBv
aW50cy4gKi8KIAkJCQkJYnJlYWs7CisJCQkJfQorCQkJCWRtYV9mZW5jZV9wdXQobGFzdF9zaWdu
YWxlZCk7CisJCQkJbGFzdF9zaWduYWxlZCA9IGRtYV9mZW5jZV9nZXQoaXRlcik7CiAJCQl9CiAJ
CQlwb2ludCA9IGRtYV9mZW5jZV9pc19zaWduYWxlZChsYXN0X3NpZ25hbGVkKSA/CiAJCQkJbGFz
dF9zaWduYWxlZC0+c2Vxbm8gOgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
