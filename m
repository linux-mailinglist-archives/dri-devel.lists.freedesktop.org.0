Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980A9161682
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 16:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABC36E983;
	Mon, 17 Feb 2020 15:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639F96E077;
 Mon, 17 Feb 2020 15:45:16 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a6so18988543wme.2;
 Mon, 17 Feb 2020 07:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+IMDOmFylD8uY29srTPJeuhzvALvSmjHT6oldeZvGlc=;
 b=LhUrZ5r+Hh5Ypw/NTckBaw4la+jkk5dnSovmwQ+mxJTUPxUWl9t9MbKSZCKcJ9+cbe
 y/5m8Pd/y4d83Uy8NeOKeuAGy1f68QeJgKox2UdF6yQ2fGjibOGs6Jp/CbEA94CuJLc5
 0Y1cy/wJYUqSgjmJ7R9qLH0AAB5RTdn9YBV2Nn0DnxBNvsIEeEYZLMkiEkyG1Hfdc+gW
 ohE8fDd0+DI7boKQxErueU/hgpGFkwAHhZ4KdjWei5dQqE9lF5o2EY/uJTdpU96qzjnl
 pF3N8zsowUplkELdewoc3gv5u261pIZGZG4zCdfhRoJawy3ja0O9L+pMLpnMXh6CQj++
 8VbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+IMDOmFylD8uY29srTPJeuhzvALvSmjHT6oldeZvGlc=;
 b=gfqQiwe2gaFTlpYQfYByAkY191dSpsV7mntO+RkbCnqhMca4YFu2+PHTOcm4dACioB
 ABqSDFT1egH/RakEPWT7YCd5Kchybcq6To5/cvsVOhIiRXorV0JaLVMaNaREhdrHxucn
 WP1st/CiSbdQIEc4GsVCwh53ThMlea9DmhKsuMebV6HeeHXJ0wOZ9edpwQHqHnhJZDER
 Sr8lrfzOxCLzpp/NIGutH7jAt7VH+ynObmH47LCWaaN0T3Slxivf+OP0a2HicLWewKyX
 IL/eih7rMur8uX9/n/qUJfbdZbpDVmpzKgTdFjaM0sASdtRKQgAU6qzGf0ukM98PcWoc
 MLtg==
X-Gm-Message-State: APjAAAUZxrt8Amhtc4sXC8BAWqDkaF5y2t6D+iW0FguRNUpB986Ey4eJ
 WS1bYIlRYSl3fwnjyloWPuca9pwI
X-Google-Smtp-Source: APXvYqzwzcqOuX6mDbw5hwvhy07pOTJEJrMbcblybJM071pMDEkY0YwtF2pDWB7YbLXWi2/ItUl3fA==
X-Received: by 2002:a05:600c:211:: with SMTP id
 17mr22731033wmi.60.1581954314747; 
 Mon, 17 Feb 2020 07:45:14 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:180d:d2d6:6ff9:a6cb])
 by smtp.gmail.com with ESMTPSA id r6sm1372658wrq.92.2020.02.17.07.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 07:45:14 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: [PATCH 2/5] drm/ttm: remove the backing store if no placement is given
Date: Mon, 17 Feb 2020 16:45:06 +0100
Message-Id: <20200217154509.2265-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217154509.2265-1-christian.koenig@amd.com>
References: <20200217154509.2265-1-christian.koenig@amd.com>
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

UGlwZWxpbmUgcmVtb3ZhbCBvZiB0aGUgQk9zIGJhY2tpbmcgc3RvcmUgd2hlbiBubyBwbGFjZW1l
bnQgaXMgZ2l2ZW4KZHVyaW5nIHZhbGlkYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCAyMjkyMDVlNDk5ZGIuLmE1NmNiMmEyYjRhZCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCkBAIC0xMjI1LDYgKzEyMjUsMTggQEAgaW50IHR0bV9ib192YWxp
ZGF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCXVpbnQzMl90IG5ld19mbGFnczsK
IAogCWRtYV9yZXN2X2Fzc2VydF9oZWxkKGJvLT5iYXNlLnJlc3YpOworCisJLyoKKwkgKiBSZW1v
dmUgdGhlIGJhY2tpbmcgc3RvcmUgaWYgbm8gcGxhY2VtZW50IGlzIGdpdmVuLgorCSAqLworCWlm
ICghcGxhY2VtZW50LT5udW1fcGxhY2VtZW50ICYmICFwbGFjZW1lbnQtPm51bV9idXN5X3BsYWNl
bWVudCkgeworCQlyZXQgPSB0dG1fYm9fcGlwZWxpbmVfZ3V0dGluZyhibyk7CisJCWlmIChyZXQp
CisJCQlyZXR1cm4gcmV0OworCisJCXJldHVybiB0dG1fdHRfY3JlYXRlKGJvLCBmYWxzZSk7CisJ
fQorCiAJLyoKIAkgKiBDaGVjayB3aGV0aGVyIHdlIG5lZWQgdG8gbW92ZSBidWZmZXIuCiAJICov
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
