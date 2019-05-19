Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CA1226EB
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 16:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67CC8921E;
	Sun, 19 May 2019 14:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B0D8921E;
 Sun, 19 May 2019 14:01:00 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h11so8742645ljb.2;
 Sun, 19 May 2019 07:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BqFLTvPSgbRKsqQRRn81LCNwQTExLn73l1blnCeSUsg=;
 b=hcbHZ4nXEJC457/j4xm/gaOqeg74KcGyfdK77fMvuquU12NtHNetFqb3uLwzoF7dHJ
 AjvylSD7tIugdLYpLpUfULQZGyycUd9RhMURCUBLZr2aRCCqMhgOffKvlEgd1w6sZKkT
 rpikQspWKT3/IpRfXD+bO0qsa71NUHVXMM3LufpRugMkAtheaqpRzidk7egaIuNZRJHv
 CNlYA5fEgkmBvBWFpuTCzNiq8F/YpcckzLag1GECbKU2F/bSGk7rzD/+CM4IXPbATz7F
 TZMHz+KJqjnFXcdy62m3wjcnGxotFerjCrtesqqbYhextJOUR6cMPwsKs+mGF3p2ngxz
 4ekA==
X-Gm-Message-State: APjAAAWq+4pfNK0zdpShA+A9IwsE6teWdRBqdpgJ7HULBjjpMAFWAnNL
 pljy3yW/vBSegFLmA+JXEhjJ2Gg9
X-Google-Smtp-Source: APXvYqyEkc2iDb4plN3aCVa28MWognt0C70QoYtaHhpfWW3dFB6p00kQ3mKpZfNZokEeDjAVqDDRww==
X-Received: by 2002:a2e:96d9:: with SMTP id d25mr32905322ljj.78.1558274458669; 
 Sun, 19 May 2019 07:00:58 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 k18sm3153572ljk.70.2019.05.19.07.00.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 07:00:58 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Ben Skeggs <bskeggs@redhat.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/4] drm/nouveau: drop use of DRM_UDELAY
Date: Sun, 19 May 2019 16:00:41 +0200
Message-Id: <20190519140044.22142-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519140044.22142-1-sam@ravnborg.org>
References: <20190519140044.22142-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BqFLTvPSgbRKsqQRRn81LCNwQTExLn73l1blnCeSUsg=;
 b=eD/EKuipTeQMSSstF1G7dcfSwAKHp+gf80zGmx5D6JO0kKOlTOnvTNEhEYU86rJ73M
 m8LgJY15Uy96R3I56gE5MNiQZXyis2FjNfN+NKTW3UWdQbS62GEKvKHShr8IuoVf9CVY
 qaTr5Nlckd6B2zIRAvgH77MRu+UtwmEDRpAg1EeNHv28KP5mQ8DDOnPbDbGyE6l95fnF
 vmL0AMtUwIxQzZgkhD/fmysvFrb8p+4fUMMVrYB0BQo0h0vPAuzIDQmvpyfnjDR6qrsM
 SSIcfKWMMw/Of4BJUwkQ2zDjJwbmHRXR8Vb1TUu+2VRxxB9OOAwyT4OKsVYqcFjJaCWI
 GriQ==
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERSTV9VREVMQVkgaXMgYSBzaW1wbGUgd3JhcHBlciBmb3IgdWRlYWx5KCkgYW5kIHRvIGJl
IGNvbnNpc3RlbnQKY2FsbCB1ZGVsYXkoKSBkaXJlY3QgbGlrZSBpbiBtYXkgb3RoZXIgcGxhY2Vz
LgpUaGlzIGF2b2lkcyB0aGUgbmVlZCB0byBwdWxsIGluIGRybV9vc19saW51eC5oIHdoZW4gd2Ug
bGF0ZXIKZHJvcCBkcm1QLmggdXNlcyBpbiBub3V2ZWF1LgoKU2lnbmVkLW9mZi1ieTogU2FtIFJh
dm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQu
Y29tPgpDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2RtYS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9kbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1hLmMK
aW5kZXggMDc4ZjY1ZDg0OWNlLi4zYzQzMGE1NTBhNTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1hLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9kbWEuYwpAQCAtMTE4LDcgKzExOCw3IEBAIG52NTBfZG1hX3B1c2hfd2FpdChzdHJ1
Y3Qgbm91dmVhdV9jaGFubmVsICpjaGFuLCBpbnQgY291bnQpCiAJCX0KIAogCQlpZiAoKCsrY250
ICYgMHhmZikgPT0gMCkgewotCQkJRFJNX1VERUxBWSgxKTsKKwkJCXVkZWxheSgxKTsKIAkJCWlm
IChjbnQgPiAxMDAwMDApCiAJCQkJcmV0dXJuIC1FQlVTWTsKIAkJfQotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
