Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 278664BD80
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 18:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DE06E43B;
	Wed, 19 Jun 2019 16:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3F56E439;
 Wed, 19 Jun 2019 16:06:00 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id a15so50552wmj.5;
 Wed, 19 Jun 2019 09:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=QnIo78t5W1Gwc/Ed22c06o2PpI9rVwOMpfIfdBlBAj0=;
 b=g7jlOKcWcCuQIzMD7PtNYJVRO9VAK2ZxdQi4+cxjMr2G1NiMUwx0mZ+jsbzwEqCKKb
 Oidd2jZCcUQem60J+TC8Z92zXCkrMCSOw5wQDgwfV+Gj5lA0TndW1yLfyIyyDItYBpu8
 iv4i3QIWn0pKk1e8g66jYaSy7H1U/NbYO0jFz0TMaP4yCBQcK/fROYHzN2OR1ZsOjAyp
 ffRkrq8oWkgvIkBIaB855zb4Er0JmY/pykKgthJXbnlO/tH/qA3Rpif0ke4mVsxDWwEA
 4oHrh5Fu7hQOu5I5c47Y9ZA3zlMLEWWIy2eLhoDq5qlW2yCjyhCOzzcjg2+XJEcvTVpz
 8cVw==
X-Gm-Message-State: APjAAAXw9GR1uIhUlNFt29UtYjLAcrRftRjc0/ZvxWtqLHGQu5/Pfbhe
 xzvv9TeaPMiPQGtEYVENNcgRZqYt
X-Google-Smtp-Source: APXvYqxC3rj63yBeP+vJBr+vQPsML3vAkK9+kOiqKimAk31N/EnG5kuFT4yjt1JAtDfL9d8z2iHLFQ==
X-Received: by 2002:a1c:cb43:: with SMTP id b64mr9376752wmg.86.1560960358899; 
 Wed, 19 Jun 2019 09:05:58 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id h84sm2100021wmf.43.2019.06.19.09.05.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 09:05:58 -0700 (PDT)
Date: Wed, 19 Jun 2019 17:03:53 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [RFC] Exposing plane type mask and handling 'all' planes
Message-ID: <20190619160353.GE1896@arch-x1c3>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=QnIo78t5W1Gwc/Ed22c06o2PpI9rVwOMpfIfdBlBAj0=;
 b=DeXvO8nc9n4bLm4y5nb8YmOZuyTTKqi8nUs/66VKYUR5mMTQdIomJf6Nltafxr7zrV
 s6T2K0xZ9JfVPBxEp3Lr903e/rM6flssYkYnQYlgU6JBbF3BklgVJd4AcaHmPU6hxTsF
 NTlJjJ9FIM0mE8DXTC4+IrPM9xoE13moavyxzX6+2PaLTZNYc82VUgnkcX8TzcgWw57w
 OXSy799Tjm3WJqPrWX1sXwFvASVf3Zqg375l2A80+FbDvdC2mVEnh1IZ5rPUcxV2oQb+
 7au1geG4UdDPgryhycTxrHFbEEp6WN7FaOisRMqHhcI0Zlo1weXumz0hOV7rDBJeVxNI
 B87Q==
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
Cc: Miguel Casas-Sanchez <mcasas@chromium.org>,
 Alexandros Frantzis <alexandros.frantzis@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKUmVjZW50bHkgSSBoYXZlIGJlZW4gbG9va2luZyBhdCBpOTE1IGFuZCBpdHMgcmF0
aGVyIGludGVyZXN0aW5nIHBsYW5lcy4KCkluIHBhcnRpY3VsYXIgbmV3ZXIgaGFyZHdhcmUgaXMg
Y2FwYWJsZSBvZiB1c2luZyAzIHVuaXZlcnNhbCBwbGFuZXMgYW5kCmEgc2VwYXJhdGUgY3Vyc29y
LW9ubHkgcGxhbmUuIEF0IHRoZSBzYW1lIHRpbWUgb25seSAxIHRvcC1tb3N0IHBsYW5lIGNhbgpi
ZSBlbmFibGVkIC0gbGV0cyBjYWxscyB0aG9zZSBwbGFuZTMgb3IgY3Vyc29yLgoKSGVuY2UgY3Vy
cmVudGx5IHRoZSBoYXJkd2FyZSBoYXMgYW4gZXh0cmEgcGxhbmUgd2hpY2ggd2UgZG8gbm90IHVz
ZS4KClRoZSBjdXJyZW50IERSTSBkZXNpZ24gZG9lcyBub3QgYWxsb3cgdXMgdG8gZnVsbHkgdXRp
bGlzZSB0aGUgSFcgYW5kIEkKd291bGQgbG92ZSB0byBhZGRyZXNzIHRoYXQuIEhlcmUgYXJlIHRo
cmVlIGFwcHJvYWNoZXMgdGhhdCBjb21lIHRvIG1pbmQ6CgoxKSBFeHRlbmQgdGhlIERSTSBwbGFu
ZSBVQVBJIHRvOgogLSBleHBvc2UgYSBtYXNrIG9mIHN1cHBvcnRlZCB0eXBlcywgYW5kCiAtIGFs
bG93IHVzZXJzcGFjZSB0byBzZWxlY3QgdGhlIHR5cGUKCjIpIEtlZXAgdGhlIGV4cG9zZWQgcGxh
bmVzIGFzLWlzIGFuZCBsZXQgdGhlIGRyaXZlciBvcmNoZXN0cmF0ZSB3aGljaAogICBvbmUgZ2V0
cyB1c2VkLgogLSBmbGlwIGJldHdlZW4gY3Vyc29yL3BsYW5lMyBiYXNlZCBvbiB0aGUgdXNlLWNh
c2UvQVBJIHVzZWQsIG9yCiAtIG9wdCBmb3IgcGxhbmUzL2N1cnNvciBmb3IgYXRvbWljIGFuZCBs
ZWdhY3kgbW9kZXNldCBjb2RlIHBhdGgsIG9yCiAtIG90aGVyCgozKSBFeHBvc2UgcGxhbmUzIGFu
ZCBjdXJzb3IsIHdoZXJlYnkgdXNpbmcgb25lIG9mIHRoZW0gIm1hcmtzIiB0aGUgb3RoZXIKICAg
YXMgdXNlZC4KIC0gaXMgdGhpcyBhbGxvd2VkIGJ5IHRoZSBtb2Rlc2V0IHNlbWFudGljcy9wb2xp
Y3k/CiAtIGRvZXMgZXhpc3RpbmcgdXNlci1zcGFjZSBoYXZlIGZhbGxiYWNrIHBhdGg/CgoKUGVy
c29uYWxseSwgSSB3b3VsZCBsb3ZlIGV4aXN0aW5nIHVzZXItc3BhY2UgdG8ganVzdCB3b3JrIHdp
dGhvdXQKbW9kaWZpY2F0aW9uLiBBdCB0aGUgc2FtZSB0aW1lIG9wdGluZyBmb3IgMiB0aGlzIHdp
bGwgY2F1c2UgYSBzZXJpb3VzCmFtb3VudCBvZiBjb21wbGljYXRpb24sIGFuZCBpbiBjYXNlIG9m
IDMgdGhlIHdob2xlIHRoaW5nIHdpbGwgYmUgdmVyeQpmcmFnaWxlLiBTbyBteSBjdXJyZW50IGlu
Y2xpbmF0aW9uIGlzIHRvd2FyZHMgMS4KCk9wZW4gcXVlc3Rpb25zOgogLSBEbyB3ZSBrbm93IG9m
IG90aGVyIGhhcmR3YXJlIHdpdGggdGhpcyBvciByZWxhdGVkIGRlc2lnbiB3aGljaCBkb2VzCm5v
dCBmaXQgdGhlIGN1cnJlbnQgRFJNIGRlc2lnbj8KIC0gVmVuZG9yIEtNUyBzcGVjaWZpYyBVQVBJ
LCBpcyBmcm93bmVkIHVwb24uIFNvIGlmIHdlIGFyZSB0byBleHRlbmQgdGhlClVBUEksIGRvZXMg
dGhlIGN1cnJlbnQgYXBwcm9hY2ggc291bmQgdXNlZnVsIGZvciBvdGhlciBIVz8KIC0gRG9lcyB0
aGlzIGFwcHJvYWNoIHNvdW5kIHJlYXNvbmFibGUsIGNhbiBvdGhlciBzaGFyZSB0aGVpciB2aWV3
IG9uIGEgCmJldHRlciBhcHByb2FjaCwgdGhhdCBhY2hpZXZlcyB0aGUgZ29hbD8KCklucHV0IGFu
ZCBpZGVhcyBmcm9tIHRoZSBJbnRlbCB0ZWFtIGFuZCBEUk0gY29tbXVuaXR5IGFyZSB2ZXJ5IG11
Y2gKYXBwcmVjaWF0ZWQuCgpUaGFua3MKRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
