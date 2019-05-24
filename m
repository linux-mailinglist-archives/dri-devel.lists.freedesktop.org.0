Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4479B2B3FF
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA7A89A0F;
	Mon, 27 May 2019 12:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57F66E03C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 02:32:36 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id w7so3521327plz.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 19:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mN/NXs4p7vHqDk7rTpmOP13LGQmOSI+Gshg9r4qyd1M=;
 b=ECwpx6bqMdItFQ97SXxROtuUSi4GZBphCheaBfeiB20y2gmOdgfvAJHEG1zev1J4d8
 JVMq8Gd0Z1aCDuJbf03cZ1n1c/MkeHSV6EvjkiaP6zt9dClWRV0tEKVr2H7SRHW5TQHM
 Ob1p0WbXoV6hdJG1j81wwfXX1qe/SI5YRlvSzTb6mIIYHlPbUpgkQJT60DZarHr0+I7+
 1B2fjPL1l2vcqGZq0Aiy+NJdFOah+V7EULOL1oaURbyrMZOQ9X4AqnKJfpdOPoi9lng1
 oRCphFS8fwro8ZGGuemO0KKIMhXU0+Q172V4A+tOSiuJbp+2zfoLizN+/GLVonrCWur6
 vALg==
X-Gm-Message-State: APjAAAVqlG4pQ4vpYRfIAuvhKlvEiswQ/Slmi4g51tFXAw32XECPEt3g
 k6P0W/ER0jMa/cqwLkEoCnW5cxMQwME=
X-Google-Smtp-Source: APXvYqygkdPnjJQzopiBCTMKEpkzXahl5pfibl6+5ljhQnCmYhOciGLy7S+iRFBKOt6V+36EX1ok3Q==
X-Received: by 2002:a17:902:b205:: with SMTP id
 t5mr53350395plr.314.1558665156301; 
 Thu, 23 May 2019 19:32:36 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
 by smtp.gmail.com with ESMTPSA id a26sm803923pfl.177.2019.05.23.19.32.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 19:32:35 -0700 (PDT)
Date: Fri, 24 May 2019 10:32:22 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com
Subject: [PATCH] drm_edid-load: Fix a missing-check bug in
 drm_load_edid_firmware()
Message-ID: <20190524023222.GA5302@zhanggen-UX430UQ>
References: <20190522123920.GB6772@zhanggen-UX430UQ> <87o93u7d3s.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o93u7d3s.fsf@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mN/NXs4p7vHqDk7rTpmOP13LGQmOSI+Gshg9r4qyd1M=;
 b=bmnk0FGTthU8bpOEtEMJ2JLGJQ0K3KS/kp9cCpL9SDdg+SMeoauGDG41UP9H5XRh34
 9OJ1nU3MoZO8SoAGGhCUWosmEdiNJKmHb/NQrnDG61zi/RDoDW38Vd8QyDiF8LU4RVW6
 FrzliAYF+kiJDKtsb7kSqfIpAG7H/rELoWj7/TFc9wluWhH4ldnjPjtcxZlAGFyXu5i2
 SmsY8BixiQpx4KIhaX5Ou/yipZdFIlC1w3f1glKkOLV1ZQUx1LAQMTPm1MFG/Dr9YfxS
 zO0lOIF8ZqYWjM+A+8MupS1Ri5ASW2xt6a1tcrE/L/voTVLRpjUlNM7YDEtLkknN9OYl
 ThuA==
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gZHJtX2xvYWRfZWRpZF9maXJtd2FyZSgpLCBmd3N0ciBpcyBhbGxvY2F0ZWQgYnkga3N0cmR1
cCgpLiBBbmQgZndzdHIKaXMgZGVyZWZlcmVuY2VkIGluIHRoZSBmb2xsb3dpbmcgY29kZXMuIEhv
d2V2ZXIsIG1lbW9yeSBhbGxvY2F0aW9uIApmdW5jdGlvbnMgc3VjaCBhcyBrc3RyZHVwKCkgbWF5
IGZhaWwgYW5kIHJldHVybnMgTlVMTC4gRGVyZWZlcmVuY2luZyAKdGhpcyBudWxsIHBvaW50ZXIg
bWF5IGNhdXNlIHRoZSBrZXJuZWwgZ28gd3JvbmcuIFRodXMgd2Ugc2hvdWxkIGNoZWNrIAp0aGlz
IGtzdHJkdXAoKSBvcGVyYXRpb24uCkZ1cnRoZXIsIGlmIGtzdHJkdXAoKSByZXR1cm5zIE5VTEws
IHdlIHNob3VsZCByZXR1cm4gRVJSX1BUUigtRU5PTUVNKSB0bwp0aGUgY2FsbGVyIHNpdGUuCgpT
aWduZWQtb2ZmLWJ5OiBHZW4gWmhhbmcgPGJsYWNrZ29kMDE2NTc0QGdtYWlsLmNvbT4KUmV2aWV3
ZWQtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Ci0tLQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkX2xvYWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZWRpZF9sb2FkLmMKaW5kZXggYTQ5MTUwOS4uYTBlMTA3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkX2xvYWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWRfbG9h
ZC5jCkBAIC0yOTAsNiArMjkwLDggQEAgc3RydWN0IGVkaWQgKmRybV9sb2FkX2VkaWRfZmlybXdh
cmUoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAkgKiB0aGUgbGFzdCBvbmUgZm91
bmQgb25lIGFzIGEgZmFsbGJhY2suCiAJICovCiAJZndzdHIgPSBrc3RyZHVwKGVkaWRfZmlybXdh
cmUsIEdGUF9LRVJORUwpOworCWlmICghZndzdHIpCisJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0p
OwogCWVkaWRzdHIgPSBmd3N0cjsKIAogCXdoaWxlICgoZWRpZG5hbWUgPSBzdHJzZXAoJmVkaWRz
dHIsICIsIikpKSB7Ci0tLQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
