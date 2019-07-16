Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 390F06B728
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13786E255;
	Wed, 17 Jul 2019 07:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E665A6E0D2;
 Tue, 16 Jul 2019 11:11:25 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id g15so9284333pgi.4;
 Tue, 16 Jul 2019 04:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=tG4oN7QUyXBM9ONfLmraVG6pWQWDU28XTB/o4iOsC64=;
 b=D0AzuL5zA1dK0HW/ruLw+UpnHGyw3QkQHCOf9dhfEM2anlaNmW1LKo5E8Fq6hXJbt5
 thVxDWUVHYlxEAaMkn2BMvtbVQ/OaWlvEmTezmKsJOc11mtlfECg9NF/aIBRhkJzLG97
 XwKejRE2BG9EXb4qpOvhMB17txCjiB7yV8tVcHh3wsFzc5LCXCTikAD7U+fgufBzYxcB
 lnPYbIpTHySaAlkQRPD71NjnEX0T7cu66FRArJnJpjY1hor2+EeRo6h1Av5eVWRmRL3/
 zbwcsBi4xOdWqjME5nqXxRRYDfBNvAXMc58fMZ5LmgCkT2T3W9Q29aFKfp1I+Q8F8JWZ
 H2fw==
X-Gm-Message-State: APjAAAXgXYfP/cu2sG3SpVBkpHGAWAbXWD9TmCJxIYxDyweFFSP4F1Dq
 Adscr7NpGFg0equjztFOuq3eBDG2c9c8CzP/
X-Google-Smtp-Source: APXvYqwPS+CFG1iax9c+LnijjFVPtOXpIKUde+Ow5kW1GvzLjT6mFfO0E6b+5ySl1KmmSCkZDEJPCQ==
X-Received: by 2002:a17:90a:3401:: with SMTP id
 o1mr35150615pjb.7.1563275485431; 
 Tue, 16 Jul 2019 04:11:25 -0700 (PDT)
Received: from ubuntu ([101.198.192.11])
 by smtp.gmail.com with ESMTPSA id i9sm16978531pjj.2.2019.07.16.04.11.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 04:11:25 -0700 (PDT)
Date: Tue, 16 Jul 2019 04:11:22 -0700
From: JingYi Hou <houjingyi647@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com,
 David1.Zhou@amd.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: fix double fetch in
 amdgpu_ras_debugfs_ctrl_parse_data()
Message-ID: <20190716111122.GA35069@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=tG4oN7QUyXBM9ONfLmraVG6pWQWDU28XTB/o4iOsC64=;
 b=lCtz0JYSz/PN5ckXRERy5AhE//7W2BwCQ5+3jNGJLYSoc6xU4cGFZVKPCTcwZPDPde
 ZMAQNppd4iZ/2+BxXt9OqQAob7W24AQe8KeMnseH7Ix83ZM5Kl9it6WcPSTJLmMErMz/
 jKY4LWMLzCGtGDexq48mmnbjGK1AFtrvOOUoYnTRXteWT+KVoBoCGshkqRYACoPC7D1K
 COyc+MfsbAinmNXL/VXcywePCUgFKvch/hWkefQpW1jj5Q5CbEGGACfPr5Fm+Bsn4/XU
 Er41rmbDvQBW/5uOwpmYCUfFmefUg3m1GGvywEZnR3K0rufXC1kTEVNbp5TeB/DzZcZY
 e6gQ==
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfcGFyc2VfZGF0YSgpLCBmaXJzdCBmZXRjaCBzdHIg
ZnJvbSBidWYgdG8KZ2V0IG9wIHZhbHVlLCBpZiBvcCA9PSAtMSB3aGljaCBtZWFucyBubyBjb21t
YW5kIG1hdGNoZWQsIGZldGNoIGRhdGEKZnJvbSBidWYgYWdhaW4uCgpJZiBjaGFuZ2UgYnVmIGJl
dHdlZW4gdHdvIGZldGNoZXMgbWF5IGNhdXNlIHNlY3VyaXR5IHByb2JsZW1zIG9yCnVuZXhwZWN0
ZWQgYmVoYWl2b3IuIGFtZGdwdV9yYXNfZGVidWdmc19jdHJsX3BhcnNlX2RhdGEoKSB3YXMgY2Fs
bGVkCmJ5IGFtZGdwdV9yYXNfZGVidWdmc19jdHJsX3dyaXRlKCkgYW5kIHZhbHVlIG9mIG9wIHdh
cyB1c2VkIGxhdGVyLgoKV2Ugc2hvdWxkIGNoZWNrIHdoZXRoZXIgZGF0YS0+b3AgPT0gLTEgb3Ig
bm90IGFmdGVyIHNlY29uZCBmZXRjaC4gaWYKZGF0YS0+b3AgIT0gLTEgbWVhbnMgYnVmIGNoYW5n
ZWQgYW5kIHNob3VsZCByZXR1cm4gLUVJTlZBTC4KClNpZ25lZC1vZmYtYnk6IEppbmdZaSBIb3Ug
PGhvdWppbmd5aTY0N0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Jhcy5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKaW5kZXggMjJiZDIxZWZlNmIxLi44
NDVlNzNlOThjZDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAg
LTIzMyw2ICsyMzMsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfZGVidWdmc19jdHJsX3BhcnNl
X2RhdGEoc3RydWN0IGZpbGUgKmYsCgogCQlpZiAoY29weV9mcm9tX3VzZXIoZGF0YSwgYnVmLCBz
aXplb2YoKmRhdGEpKSkKIAkJCXJldHVybiAtRUlOVkFMOworCisJCWlmKGRhdGEtPm9wICE9IC0x
KQorCQkJcmV0dXJuIC1FSU5WQUw7CiAJfQoKIAlyZXR1cm4gMDsKLS0KMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
