Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E03210029A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 11:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAEC6E3C7;
	Mon, 18 Nov 2019 10:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6F16E30E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 10:36:00 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u18so16813924wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 02:36:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jjDLxOz7IsbnL7t2/1Ejysn56H4IEYN8ktzvCCiHtFg=;
 b=athOIc3w5R1g3ceO6fdEEimIzs3nG/5CCRnZOFFq7/UQ2V98tcBqBGW2BVFCEBxviF
 Sat2JKBNYU/jVy1nxytG3DzbpRDzU4DiNVpExtyR4CSyQrv6DaEkCVdbJpsrlRn1TU6k
 PwVVW9inB7DYT6jqeSaXQRItF+XmriL14UzOCESBJxQc04UWn6PsGw4cliBX9PwiqP2Q
 RMZgnxSKz2MtpHo3IZ4vkDhVsCFG492CUX8BNZS1L6BvIkIusN4SmTUhnFm1rLu/iRFp
 lwMBpc2GW+UWKPT11Ch1ziRWhevTlmil/mqidERJQHITc6ycXUnMVz0ynIUWRJ4WN362
 Io/g==
X-Gm-Message-State: APjAAAU1v+fZ8zT0RuiMqYmmZWWEj+oJX9hzKqxl0RiOfq4EjORbKGVW
 t+I16Sz9qVZ9YcFmJ+2+onNyclfgOTE=
X-Google-Smtp-Source: APXvYqxuf8Z1g6JRhix6c1l9qTmhAZvxcDDPcHNmw/YqNTYy8nEysXzPhnZ/YuoW4u1Ee+f/OudQtQ==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr29898342wmj.39.1574073358651; 
 Mon, 18 Nov 2019 02:35:58 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 02:35:58 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/15] xen/gntdev-dmabuf: Ditch dummy map functions
Date: Mon, 18 Nov 2019 11:35:34 +0100
Message-Id: <20191118103536.17675-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jjDLxOz7IsbnL7t2/1Ejysn56H4IEYN8ktzvCCiHtFg=;
 b=BXixQVq2k/7tC9dPX/bMsg1etG8/LX8ir3zvqVJdCRc9RkrCObDs6PrdHtTu/EuVbP
 kXNiyijwPNqrzOCCwygOzMmden/lVtzOEhP5DGJclsF+p6uup6MP4o7LzYQxt9v+bRE7
 Fh9x2wWvTXXnQf3phCJdqLRs5xDWQ/1s4FmnE=
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 xen-devel@lists.xenproject.org, Daniel Vetter <daniel.vetter@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyBubyBpbi1rZXJuZWwgdXNlcnMgZm9yIHRoZSBrKHVuKW1hcCBzdHVmZi4gQW5kIHRo
ZSBtbWFwIG9uZSBpcwphY3RpdmVseSBoYXJtZnVsIC0gcmV0dXJuIDAgYW5kIHRoZW4gX25vdF8g
YWN0dWFsbHkgbW1hcGluZyBjYW4ndCBlbmQKd2VsbC4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jp
cy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwotLQpBY2sgZm9yIG1lcmdpbmcgdGhpcyB0aHJv
dWdoIGRybSB0cmVlcyB2ZXJ5IG11Y2ggYXBwcmVjaWF0ZWQuCi1EYW5pZWwKLS0tCiBkcml2ZXJz
L3hlbi9nbnRkZXYtZG1hYnVmLmMgfCAyMyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDIzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2dudGRl
di1kbWFidWYuYyBiL2RyaXZlcnMveGVuL2dudGRldi1kbWFidWYuYwppbmRleCAyYzRmMzI0Zjg2
MjYuLmZlN2JkNjlkNjk1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5j
CisrKyBiL2RyaXZlcnMveGVuL2dudGRldi1kbWFidWYuYwpAQCAtMzQyLDM1ICszNDIsMTIgQEAg
c3RhdGljIHZvaWQgZG1hYnVmX2V4cF9vcHNfcmVsZWFzZShzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1
ZikKIAltdXRleF91bmxvY2soJnByaXYtPmxvY2spOwogfQogCi1zdGF0aWMgdm9pZCAqZG1hYnVm
X2V4cF9vcHNfa21hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZiwKLQkJCQkgdW5zaWduZWQgbG9u
ZyBwYWdlX251bSkKLXsKLQkvKiBOb3QgaW1wbGVtZW50ZWQuICovCi0JcmV0dXJuIE5VTEw7Ci19
Ci0KLXN0YXRpYyB2b2lkIGRtYWJ1Zl9leHBfb3BzX2t1bm1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1h
X2J1ZiwKLQkJCQkgIHVuc2lnbmVkIGxvbmcgcGFnZV9udW0sIHZvaWQgKmFkZHIpCi17Ci0JLyog
Tm90IGltcGxlbWVudGVkLiAqLwotfQotCi1zdGF0aWMgaW50IGRtYWJ1Zl9leHBfb3BzX21tYXAo
c3RydWN0IGRtYV9idWYgKmRtYV9idWYsCi0JCQkgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEpCi17Ci0JLyogTm90IGltcGxlbWVudGVkLiAqLwotCXJldHVybiAwOwotfQotCiBzdGF0
aWMgY29uc3Qgc3RydWN0IGRtYV9idWZfb3BzIGRtYWJ1Zl9leHBfb3BzID0gIHsKIAkuYXR0YWNo
ID0gZG1hYnVmX2V4cF9vcHNfYXR0YWNoLAogCS5kZXRhY2ggPSBkbWFidWZfZXhwX29wc19kZXRh
Y2gsCiAJLm1hcF9kbWFfYnVmID0gZG1hYnVmX2V4cF9vcHNfbWFwX2RtYV9idWYsCiAJLnVubWFw
X2RtYV9idWYgPSBkbWFidWZfZXhwX29wc191bm1hcF9kbWFfYnVmLAogCS5yZWxlYXNlID0gZG1h
YnVmX2V4cF9vcHNfcmVsZWFzZSwKLQkubWFwID0gZG1hYnVmX2V4cF9vcHNfa21hcCwKLQkudW5t
YXAgPSBkbWFidWZfZXhwX29wc19rdW5tYXAsCi0JLm1tYXAgPSBkbWFidWZfZXhwX29wc19tbWFw
LAogfTsKIAogc3RydWN0IGdudGRldl9kbWFidWZfZXhwb3J0X2FyZ3MgewotLSAKMi4yNC4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
