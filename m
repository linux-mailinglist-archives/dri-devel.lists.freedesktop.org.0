Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D5D22E54
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE89C8925D;
	Mon, 20 May 2019 08:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A25B89255
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:22:25 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w11so22519380edl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 01:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SbM4kkl5EWVc1Lud+LN0uVoCMIXyfC33Tfm6rZ3mnEI=;
 b=Jnyv7SD758KplV1AamRgLFDkLa85ctrpLIDOc64FA6AdGZYdSC1doM3n8npN5hdA+y
 3j8iwPuMdqG6YtOE6jMOKciyMJSKI3L5xjPkV9f36T59kmL23OfpB9CWcrlA3Hoh2KUS
 CKYtX7lYOueEEGCGinfh9leDMu/YP1wpvukwQij7/i+TUPu1t3bJsODvAKAS6Qzw/g7z
 GQPuKfya+P98psvDRy4G9YcpWhNML+BLDmbea6zi1+cDXr+Bn03fHm4UyPqvVZh3GXxx
 MfFNJ9gjQ7zLnkqQ0f04HHjsFx/Oe0gjNmuCVstKlkpvzcw5x03KVRGXpjTIwxOuAmHT
 glpg==
X-Gm-Message-State: APjAAAU/IDj/esu0xD4a1Be9zC3+q87t080EPSu+LBU/WCovGaQ/CNW6
 NDSJAQfZsEAPVRYXgww5SL2WV/Xjwwk=
X-Google-Smtp-Source: APXvYqxqPql4lZWwJLVOFFGLuWmPeQWFMGasN2gXQcRCWWC75MWt4Ank1BJS5Y0nm96pOu/UVBpZqQ==
X-Received: by 2002:a17:906:e0c5:: with SMTP id
 gl5mr57097610ejb.212.1558340543985; 
 Mon, 20 May 2019 01:22:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t25sm3021263ejx.8.2019.05.20.01.22.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 01:22:23 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/33] dummycon: Sprinkle locking checks
Date: Mon, 20 May 2019 10:21:44 +0200
Message-Id: <20190520082216.26273-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SbM4kkl5EWVc1Lud+LN0uVoCMIXyfC33Tfm6rZ3mnEI=;
 b=SW60b7nIdATIPrwIWT9oaGpKEoAZHbdQlROc0UqUsAS10sCqELdn+dY7HDkmX5YTds
 yZ5phBYpFJyDH5V9PQPmkhmxB7CtZmaxADWsHNnsI9mYQppWf25NMEL5tGf9F4QVcodj
 8X4ejWbghPqnUvuMd2Uq38ikh4YOZRHHgb8IY=
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
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXMgcGFydCBvZiB0cnlpbmcgdG8gdW5kZXJzdGFuZCB0aGUgbG9ja2luZyAob3IgbGFjayB0aGVy
ZW9mKSBpbiB0aGUKZmJjb24vdnQvZmJkZXYgbWF6ZSwgYW5ub3RhdGUgZXZlcnl0aGluZy4KClNp
Z25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzog
QmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzog
SGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnPgpDYzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CkNj
OiBOaWNvbGFzIFBpdHJlIDxuaWNvbGFzLnBpdHJlQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy92
aWRlby9jb25zb2xlL2R1bW15Y29uLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vY29uc29sZS9kdW1teWNvbi5j
IGIvZHJpdmVycy92aWRlby9jb25zb2xlL2R1bW15Y29uLmMKaW5kZXggNDVhZDkyNWFkNWY4Li4y
MzUyYjRjMzc4MjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vY29uc29sZS9kdW1teWNvbi5j
CisrKyBiL2RyaXZlcnMvdmlkZW8vY29uc29sZS9kdW1teWNvbi5jCkBAIC0zMyw2ICszMyw4IEBA
IHN0YXRpYyBib29sIGR1bW15Y29uX3B1dGNfY2FsbGVkOwogCiB2b2lkIGR1bW15Y29uX3JlZ2lz
dGVyX291dHB1dF9ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iKQogeworCVdBUk5f
Q09OU09MRV9VTkxPQ0tFRCgpOworCiAJcmF3X25vdGlmaWVyX2NoYWluX3JlZ2lzdGVyKCZkdW1t
eWNvbl9vdXRwdXRfbmgsIG5iKTsKIAogCWlmIChkdW1teWNvbl9wdXRjX2NhbGxlZCkKQEAgLTQx
LDExICs0MywxNSBAQCB2b2lkIGR1bW15Y29uX3JlZ2lzdGVyX291dHB1dF9ub3RpZmllcihzdHJ1
Y3Qgbm90aWZpZXJfYmxvY2sgKm5iKQogCiB2b2lkIGR1bW15Y29uX3VucmVnaXN0ZXJfb3V0cHV0
X25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIpCiB7CisJV0FSTl9DT05TT0xFX1VO
TE9DS0VEKCk7CisKIAlyYXdfbm90aWZpZXJfY2hhaW5fdW5yZWdpc3RlcigmZHVtbXljb25fb3V0
cHV0X25oLCBuYik7CiB9CiAKIHN0YXRpYyB2b2lkIGR1bW15Y29uX3B1dGMoc3RydWN0IHZjX2Rh
dGEgKnZjLCBpbnQgYywgaW50IHlwb3MsIGludCB4cG9zKQogeworCVdBUk5fQ09OU09MRV9VTkxP
Q0tFRCgpOworCiAJZHVtbXljb25fcHV0Y19jYWxsZWQgPSB0cnVlOwogCXJhd19ub3RpZmllcl9j
YWxsX2NoYWluKCZkdW1teWNvbl9vdXRwdXRfbmgsIDAsIE5VTEwpOwogfQotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
