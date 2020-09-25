Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6938F278B64
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 16:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660636ED1A;
	Fri, 25 Sep 2020 14:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7489F6ED08
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 14:55:47 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id r7so3993567ejs.11
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 07:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Z7XU+yP/bsBujqhXnfycnuQH2YIpNZad/xq6b1YCXms=;
 b=KNli49Ln1KnsYE3G1lc4MItVdHzB3s4PEZPzSm2hM6qZNSGYrt8iXLkilUM22GuJ2V
 2crT8LIyzt2FybSyc/VWFVHRbaGLEXhFy8KjWrKL8bO3vcuzcVj3BZAEykP3HDLu7p4Y
 9STplIIolY46Zexn2ZlC1e2nZxuKmXW7UuYXRKB+0+typgvPyBjcnAOlt/72SYw+97j8
 uTuFNaQDv6mu2l8XFuxUYz2KV+Mwx2xthuujhow1Z+2YmC9EI3JGwnTwZQrAEJMd2vna
 Oa65YnqfwQzc0bOcBW2nfWf5azSpH/GLNToVi4J6VhqeCcbW3JCpmvns27akV0IHoR8r
 hE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z7XU+yP/bsBujqhXnfycnuQH2YIpNZad/xq6b1YCXms=;
 b=Mw4owPhomUBdwBpQETaY4+niVaBAyLVF8uL+qY+hIQXx/KDrsvtuLfh5JX1XldkMrQ
 lfWeEtX1GqAvi2Qjz4wfWVPubifKPNYg8fY7xR0LxZp/IYeRgHALAS7VEcORXvMe0y7y
 XQCmvoGx38FWA72mUE3cmClyKcYOdVD+y708wnuoBW90ZBjl8uFnXWPg//ME1KVOqxvY
 d887XG3QErYFTP+W8heiBJ01iPtHpI9uaxZVPk2G3lnDAEUNOkkW5WG6DqPiKtWDMAJh
 3oawzKHjHVQhCvfjM+3xwWNRjkyTqSFle/I0A1ci2xCvtnSmT8LgI4+pIopQ90rD7neM
 9IrQ==
X-Gm-Message-State: AOAM533BKa+aSLkfruldbh5WdshfLgGsA+jjKtp7wZQ7vi9pS4iOj3ko
 EW1nqataXsWHhl59ACDRVmAxqwvbj+A=
X-Google-Smtp-Source: ABdhPJzyqbCSY7OD3g4ksLeRgQrmB7rDS7Rp/nCh3vNv0ftZzif2KhzWmPM0jOblEoORrFtmNF+78g==
X-Received: by 2002:a17:906:194b:: with SMTP id
 b11mr2991700eje.159.1601045745915; 
 Fri, 25 Sep 2020 07:55:45 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c75e:403f:87d4:6d00])
 by smtp.gmail.com with ESMTPSA id lo25sm2029990ejb.53.2020.09.25.07.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 07:55:44 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	ray.huang@amd.com,
	airlied@redhat.com
Subject: [PATCH 5/5] drm/ttm: remove fault callback
Date: Fri, 25 Sep 2020 16:55:40 +0200
Message-Id: <20200925145540.1214-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925145540.1214-1-christian.koenig@amd.com>
References: <20200925145540.1214-1-christian.koenig@amd.com>
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

QW5vdGhlciBvbmUgYml0ZXMgdGhlIGR1c3QuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm9fdm0uYyB8IDIyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvZHJtL3R0bS90
dG1fYm9fZHJpdmVyLmggfCAgMyAtLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjUgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKaW5kZXggOTkxZWYxMzJlMTA4Li44N2VlOGYwY2EwOGUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwpAQCAtMjkwLDI4ICsyOTAsNiBAQCB2bV9mYXVsdF90
IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKIAl2bV9mYXVs
dF90IHJldCA9IFZNX0ZBVUxUX05PUEFHRTsKIAl1bnNpZ25lZCBsb25nIGFkZHJlc3MgPSB2bWYt
PmFkZHJlc3M7CiAKLQlpZiAoYmRldi0+ZHJpdmVyLT5mYXVsdF9yZXNlcnZlX25vdGlmeSkgewot
CQlzdHJ1Y3QgZG1hX2ZlbmNlICptb3ZpbmcgPSBkbWFfZmVuY2VfZ2V0KGJvLT5tb3ZpbmcpOwot
Ci0JCWVyciA9IGJkZXYtPmRyaXZlci0+ZmF1bHRfcmVzZXJ2ZV9ub3RpZnkoYm8pOwotCQlzd2l0
Y2ggKGVycikgewotCQljYXNlIDA6Ci0JCQlicmVhazsKLQkJY2FzZSAtRUJVU1k6Ci0JCWNhc2Ug
LUVSRVNUQVJUU1lTOgotCQkJZG1hX2ZlbmNlX3B1dChtb3ZpbmcpOwotCQkJcmV0dXJuIFZNX0ZB
VUxUX05PUEFHRTsKLQkJZGVmYXVsdDoKLQkJCWRtYV9mZW5jZV9wdXQobW92aW5nKTsKLQkJCXJl
dHVybiBWTV9GQVVMVF9TSUdCVVM7Ci0JCX0KLQotCQlpZiAoYm8tPm1vdmluZyAhPSBtb3Zpbmcp
IHsKLQkJCXR0bV9ib19tb3ZlX3RvX2xydV90YWlsX3VubG9ja2VkKGJvKTsKLQkJfQotCQlkbWFf
ZmVuY2VfcHV0KG1vdmluZyk7Ci0JfQotCiAJLyoKIAkgKiBXYWl0IGZvciBidWZmZXIgZGF0YSBp
biB0cmFuc2l0LCBkdWUgdG8gYSBwaXBlbGluZWQKIAkgKiBtb3ZlLgpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJp
dmVyLmgKaW5kZXggODY0YWZhOGY2ZjE4Li45ODk3YTE2YzBhOWQgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19k
cml2ZXIuaApAQCAtMTkwLDkgKzE5MCw2IEBAIHN0cnVjdCB0dG1fYm9fZHJpdmVyIHsKIAl2b2lk
ICgqbW92ZV9ub3RpZnkpKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJCQkgICAgYm9v
bCBldmljdCwKIAkJCSAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlICpuZXdfbWVtKTsKLQkvKiBub3Rp
ZnkgdGhlIGRyaXZlciB3ZSBhcmUgdGFraW5nIGEgZmF1bHQgb24gdGhpcyBCTwotCSAqIGFuZCBo
YXZlIHJlc2VydmVkIGl0ICovCi0JaW50ICgqZmF1bHRfcmVzZXJ2ZV9ub3RpZnkpKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqYm8pOwogCiAJLyoqCiAJICogbm90aWZ5IHRoZSBkcml2ZXIgdGhh
dCB3ZSdyZSBhYm91dCB0byBzd2FwIG91dCB0aGlzIGJvCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
