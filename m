Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E4F6CAA5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 10:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22616E342;
	Thu, 18 Jul 2019 08:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AA36E343
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 08:09:14 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k21so29375022edq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 01:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Iyfr5/1NYNdQhpDWPT06wuP/cAAoXegst7lt2IsF58=;
 b=NTTFQpU/JzIknQK0lP6KbrqKKKsHePb40zrcRlG2GB1Ff6QqZMV5ud8kJL5ApNbLY7
 Hxy6i0cEjP3+GTbXa/CfX9HCRQHoxcbZ3GvytxrV2imWQOmubZUzJYMNY9qaFcQqeaGc
 mr1h6TJ5fnPlMe6/qYC2PLPIgc2Ve4pBeg03rOiuDnBGBDThpfbe1fFeO1yUH56/RFKN
 yHXM9mnrH5k4bP7+OUUIXU1QQLE8a87oiEwmtsVitffZDwV6nzghsLS+K9lA1PeDexjy
 MfodylnpW0dZjpYQDxU3WlskzEnqsE1UcAfhcIZT2vQsTPeDRG0+oUuXludQxlZyzc0y
 52pQ==
X-Gm-Message-State: APjAAAUwOD04ORLEbP1mzi2GK1IDFcgtL2kRc/rKICFRRusGCQ0KWk1C
 V0WbZiWrFC9bQGQw7OWexO0=
X-Google-Smtp-Source: APXvYqykBiX6Jo5Tfwh9csgIjcDSqs9NfSDZzAEw+X4to7YWwbULxI67P9uCx6KZm68g1spWwShXGQ==
X-Received: by 2002:a17:906:6582:: with SMTP id
 x2mr12620386ejn.2.1563437352239; 
 Thu, 18 Jul 2019 01:09:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id l38sm7608440eda.1.2019.07.18.01.09.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 01:09:11 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH] vt: Grab console_lock around con_is_bound in show_bind
Date: Thu, 18 Jul 2019 10:09:03 +0200
Message-Id: <20190718080903.22622-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Iyfr5/1NYNdQhpDWPT06wuP/cAAoXegst7lt2IsF58=;
 b=Z7bNK0nfFW0N6BAI/rd5EED657okw9jUljgqrouABquv5zutt1fVG9cnzovdPvciis
 KmFVJJy3QcvbNE2hG6hzs11SjCaCGvNXExkjBAoy7FPPfdiQgzM2w8/Q6zsSmyUaMgdt
 r+fACRtZtYBPe+sS/se1+IEvfwhP/fSaBENKo=
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
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, linux-s390@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Adam Borowski <kilobyte@angband.pl>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Martin Hostettler <textshell@uchuujin.de>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jens Remus <jremus@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IHJlYWxseSBoYXJtZnVsIG5vdCB0bywgYnV0IGFsc28gbm90IGhhcm0gaW4gZ3JhYmJpbmcg
dGhlIGxvY2suIEFuZAp0aGlzIHNodXRzIHVwIGEgbmV3IFdBUk5JTkcgSSBpbnRyb2R1Y2VkIGlu
IGNvbW1pdCBkZGRlM2MxOGI3MDAgKCJ2dDoKTW9yZSBsb2NraW5nIGNoZWNrcyIpLgoKUmVwb3J0
ZWQtYnk6IEplbnMgUmVtdXMgPGpyZW11c0BsaW51eC5pYm0uY29tPgpDYzogbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzog
bGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9y
ZwpDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6
IE5pY29sYXMgUGl0cmUgPG5pY29sYXMucGl0cmVAbGluYXJvLm9yZz4KQ2M6IE1hcnRpbiBIb3N0
ZXR0bGVyIDx0ZXh0c2hlbGxAdWNodXVqaW4uZGU+CkNjOiBBZGFtIEJvcm93c2tpIDxraWxvYnl0
ZUBhbmdiYW5kLnBsPgpDYzogTWlrdWxhcyBQYXRvY2thIDxtcGF0b2NrYUByZWRoYXQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBTYW0gUmF2bmJvcmcg
PHNhbUByYXZuYm9yZy5vcmc+Ci0tLQogZHJpdmVycy90dHkvdnQvdnQuYyB8IDYgKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy90dHkvdnQvdnQuYyBiL2RyaXZlcnMvdHR5L3Z0L3Z0LmMKaW5kZXggZWM5MmYz
NmFiNWM0Li4zNGFhMzlkMWFlZDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdHR5L3Z0L3Z0LmMKKysr
IGIvZHJpdmVycy90dHkvdnQvdnQuYwpAQCAtMzc3MSw3ICszNzcxLDExIEBAIHN0YXRpYyBzc2l6
ZV90IHNob3dfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRl
ICphdHRyLAogCQkJIGNoYXIgKmJ1ZikKIHsKIAlzdHJ1Y3QgY29uX2RyaXZlciAqY29uID0gZGV2
X2dldF9kcnZkYXRhKGRldik7Ci0JaW50IGJpbmQgPSBjb25faXNfYm91bmQoY29uLT5jb24pOwor
CWludCBiaW5kOworCisJY29uc29sZV9sb2NrKCk7CisJYmluZCA9IGNvbl9pc19ib3VuZChjb24t
PmNvbik7CisJY29uc29sZV91bmxvY2soKTsKIAogCXJldHVybiBzbnByaW50ZihidWYsIFBBR0Vf
U0laRSwgIiVpXG4iLCBiaW5kKTsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
