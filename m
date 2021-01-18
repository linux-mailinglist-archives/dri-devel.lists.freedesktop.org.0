Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DA22FA83C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 19:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116C46E563;
	Mon, 18 Jan 2021 18:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C576E454
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 18:03:41 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g1so17931179edu.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 10:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VE5dS/K6+mlA/xDSWx/xrkP+6TV7zHaZLCQABHwVPBc=;
 b=niIgAQftt+iRc9Z5Rd0ZBVUIJw+UnBiAL1ORdEAfqHO9a3jOkKW/kVL/UQJf3qOkiT
 aQuAMpm4E8xW0tAf+FTZhBcS8TpfwbxbMHmtQvV6ox9DjnFFkpHa/JKdk+xwsHj9Qj+D
 cM8SLBciAm3LEIcZKQpCr1tQ/WaAlYG2wKbkB04LYXwoxacAgZLi7VtgwrRAKD2A7HrS
 7S7FGTCZuhB1FIMEgUg4dvnL9kt3D/cvHKofVbYo8nGxBBGMEk2Gc/u/YoVJ9MHfSQnp
 Nhf/onJWCx/BAjrrtB5CaACnqxsTPDzlW8F0r4mH5Z40zPMQtA99bhdLoFeHYjDZ4ego
 e1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VE5dS/K6+mlA/xDSWx/xrkP+6TV7zHaZLCQABHwVPBc=;
 b=aEQJYJNWqOrUsNzJ2feIfx/MD1bViiSmPJ+6BG+tGzkn9wcO/7W+koHl9O+BtmvV16
 8nm/6f+DeeFaLZ+PIJs43T/edFbeVVfOEG6CWKMZFGaXL2j7dWMv3txxRtHNyuE9sjq+
 QotIU2h3qEJaXJQW4OoiZUZLgPAAS0jyqi304II5IGSg+JZDgx2P3CvJNrJ56GtmK0BS
 Kz46mC4Wv1x+IeKgo/z7vo5g1SlPvi3rG4qju4LXHA7eU4BWrVlLGwBvWRJmo+OpM0o/
 UyNhL3s4i8OSAQKIRcGyght0cXtrmc2WUtB30HkIvKFKQ3EQAj7OTDZyUsXD0OqlPibm
 /ccg==
X-Gm-Message-State: AOAM532RKQK9sLtWpfnV+RW8hFFDCLpnbWurHfqHW+xKxCu/MvdjwivC
 Uu3d83cKS6Vr1CCADTDLHkzl58Aj60c=
X-Google-Smtp-Source: ABdhPJzjLHgUaYzajBP6OisVZojLERChVEt+qJ0CvomcPa+ueUUtHlwwBcFkDZX4N3CTwjnZZqvZ3w==
X-Received: by 2002:a05:6402:3116:: with SMTP id
 dc22mr480138edb.325.1610993020444; 
 Mon, 18 Jan 2021 10:03:40 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4449:7b65:bfa0:95f5])
 by smtp.gmail.com with ESMTPSA id x5sm10651160edi.35.2021.01.18.10.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 10:03:39 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/syncobj: make lockdep complain on WAIT_FOR_SUBMIT v2
Date: Mon, 18 Jan 2021 19:03:34 +0100
Message-Id: <20210118180334.43714-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118180334.43714-1-christian.koenig@amd.com>
References: <20210118180334.43714-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFJNX1NZTkNPQkpfV0FJVF9GTEFHU19XQUlUX0ZPUl9TVUJNSVQgY2FuJ3QgYmUgdXNlZCB3aGVu
IHdlIGhvbGQgbG9ja3MKc2luY2Ugd2UgYXJlIGJhc2ljYWxseSB3YWl0aW5nIGZvciB1c2Vyc3Bh
Y2UgdG8gZG8gc29tZXRoaW5nLgoKSG9sZGluZyBhIGxvY2sgd2hpbGUgZG9pbmcgc28gY2FuIHRy
aXZpYWwgZGVhZGxvY2sgd2l0aCBwYWdlIGZhdWx0cwpldGMuLi4KClNvIG1ha2UgbG9ja2RlcCBj
b21wbGFpbiB3aGVuIGEgZHJpdmVyIHRyaWVzIHRvIGRvIHRoaXMuCgp2MjogQWRkIGxvY2tkZXBf
YXNzZXJ0X25vbmVfaGVsZCgpIG1hY3JvLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3lu
Y29iai5jIHwgNyArKysrKysrCiBpbmNsdWRlL2xpbnV4L2xvY2tkZXAuaCAgICAgICB8IDUgKysr
KysKIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMK
aW5kZXggNmU3NGU2NzQ1ZWNhLi5mNTE0NTg2MTUxNTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fc3luY29iai5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCkBA
IC0zODcsNiArMzg3LDEzIEBAIGludCBkcm1fc3luY29ial9maW5kX2ZlbmNlKHN0cnVjdCBkcm1f
ZmlsZSAqZmlsZV9wcml2YXRlLAogCWlmICghc3luY29iaikKIAkJcmV0dXJuIC1FTk9FTlQ7CiAK
KwkvKiBXYWl0aW5nIGZvciB1c2Vyc3BhY2Ugd2l0aCBsb2NrcyBoZWxwIGlzIGlsbGVnYWwgY2F1
c2UgdGhhdCBjYW4KKwkgKiB0cml2aWFsIGRlYWRsb2NrIHdpdGggcGFnZSBmYXVsdHMgZm9yIGV4
YW1wbGUuIE1ha2UgbG9ja2RlcCBjb21wbGFpbgorCSAqIGFib3V0IGl0IGVhcmx5IG9uLgorCSAq
LworCWlmIChmbGFncyAmIERSTV9TWU5DT0JKX1dBSVRfRkxBR1NfV0FJVF9GT1JfU1VCTUlUKQor
CQlsb2NrZGVwX2Fzc2VydF9ub25lX2hlbGRfb25jZSgpOworCiAJKmZlbmNlID0gZHJtX3N5bmNv
YmpfZmVuY2VfZ2V0KHN5bmNvYmopOwogCWRybV9zeW5jb2JqX3B1dChzeW5jb2JqKTsKIApkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9sb2NrZGVwLmggYi9pbmNsdWRlL2xpbnV4L2xvY2tkZXAu
aAppbmRleCBiOWU5YWRlYzczZTguLjZlYjExN2MwZDBmMyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9s
aW51eC9sb2NrZGVwLmgKKysrIGIvaW5jbHVkZS9saW51eC9sb2NrZGVwLmgKQEAgLTMxMCw2ICsz
MTAsMTAgQEAgZXh0ZXJuIHZvaWQgbG9ja191bnBpbl9sb2NrKHN0cnVjdCBsb2NrZGVwX21hcCAq
bG9jaywgc3RydWN0IHBpbl9jb29raWUpOwogCQlXQVJOX09OX09OQ0UoZGVidWdfbG9ja3MgJiYg
IWxvY2tkZXBfaXNfaGVsZChsKSk7CVwKIAl9IHdoaWxlICgwKQogCisjZGVmaW5lIGxvY2tkZXBf
YXNzZXJ0X25vbmVfaGVsZF9vbmNlKCkJZG8gewkJCQlcCisJCVdBUk5fT05fT05DRShkZWJ1Z19s
b2NrcyAmJiBjdXJyZW50LT5sb2NrZGVwX2RlcHRoKTsJXAorCX0gd2hpbGUgKDApCisKICNkZWZp
bmUgbG9ja2RlcF9yZWN1cnNpbmcodHNrKQkoKHRzayktPmxvY2tkZXBfcmVjdXJzaW9uKQogCiAj
ZGVmaW5lIGxvY2tkZXBfcGluX2xvY2sobCkJbG9ja19waW5fbG9jaygmKGwpLT5kZXBfbWFwKQpA
QCAtMzg3LDYgKzM5MSw3IEBAIGV4dGVybiBpbnQgbG9ja2RlcF9pc19oZWxkKGNvbnN0IHZvaWQg
Kik7CiAjZGVmaW5lIGxvY2tkZXBfYXNzZXJ0X2hlbGRfd3JpdGUobCkJZG8geyAodm9pZCkobCk7
IH0gd2hpbGUgKDApCiAjZGVmaW5lIGxvY2tkZXBfYXNzZXJ0X2hlbGRfcmVhZChsKQkJZG8geyAo
dm9pZCkobCk7IH0gd2hpbGUgKDApCiAjZGVmaW5lIGxvY2tkZXBfYXNzZXJ0X2hlbGRfb25jZShs
KQkJZG8geyAodm9pZCkobCk7IH0gd2hpbGUgKDApCisjZGVmaW5lIGxvY2tkZXBfYXNzZXJ0X25v
bmVfaGVsZF9vbmNlKCkJZG8geyB9IHdoaWxlICgwKQogCiAjZGVmaW5lIGxvY2tkZXBfcmVjdXJz
aW5nKHRzaykJCQkoMCkKIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
