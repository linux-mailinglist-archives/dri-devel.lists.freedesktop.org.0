Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6154B093A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93526EBC3;
	Thu, 12 Sep 2019 07:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F3C6E0D9;
 Wed, 11 Sep 2019 18:32:05 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 7so20945975ljw.7;
 Wed, 11 Sep 2019 11:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=osLb1I6IiQ2BmJysQ2eAtNr8jj+efIn6W4VanYf9QGY=;
 b=R/sKvExqFFjuBgr7YbHHKZ8YyGfn5svFzGXeJqfRH5yetYQfl1c0Tj/FXfGQA5Pswg
 oW3pWpYPQ70qcEV6Bh8+VFLF6eO0dbHSs3OMfqFyOcej941ti0H2mfbhtol9p0YKtE+s
 vJCGYXZr7Tn6i6qhLf2kSImpV/zjLJynZtkolWUOFBxuUX3S54SkiS+3Y0hLzd2xD9bM
 RProD+Wv5uAiZeAMfNC89eDxumiygGVU0s1mPTt+8LGznNQLptlUYk4ReVWmrWgvcGPt
 JbOnKFFNkvIRtum3DFcw1zbmc95H0zA+jhGQGmbblP5mgwjSmkoDrSYbQy2QfPjJcNtZ
 cPdw==
X-Gm-Message-State: APjAAAUhAvMT2AZbjTg9NPh0lqJ2ZXgGFh7A2USmiKPu7KxAb81TkQsB
 cgKkL+EjJGeDOzYEi82WPRor7JTahvD4e9qPow==
X-Google-Smtp-Source: APXvYqyCsoJ6mzrOoMT8NBKAi3ATYgRzIfZ1hK0slPZgZIy1MyQ9VeF6irlc5ltIEgvnyeNHUIKcwsZY/jpbV/IbDLU=
X-Received: by 2002:a2e:9881:: with SMTP id b1mr6584914ljj.134.1568226723574; 
 Wed, 11 Sep 2019 11:32:03 -0700 (PDT)
MIME-Version: 1.0
From: Gabriel C <nix.or.die@gmail.com>
Date: Wed, 11 Sep 2019 20:31:37 +0200
Message-ID: <CAEJqkghRENck2NNCoxFccdph6EwAhMsBAszjkx2cj6Krrkoi8g@mail.gmail.com>
Subject: [Regression] 5.3-rc8 suspending from X broken with amdgpu
To: LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=osLb1I6IiQ2BmJysQ2eAtNr8jj+efIn6W4VanYf9QGY=;
 b=PMYQlJr4db2/2U22T74KWGNQW5mdUGVyjgpKLcqJfnorAewoVIcQKwl1BzqDNkRD/U
 cxRrYsZ+5fbA2rw3jGvtH6kbMcHDLEQRziuX1fV/qeeviWc9mjeu9Go/K8Q+4BKkOQh3
 fCj8F4eTrGHyzDNZV1KSZaWrXjz7vSLKirSFrboYihd0hx3wGLfZCHqXfmABfpXdyxwL
 hE3YLN0H2HgIbNATx0z0UPk8S/uV2rgr+OrOLuqmPzk48V6NG2h2DjXzFv9AXAv2nk4t
 fIs85Xp7Ik+r6SVG6UZXj8iXV3yt0UYBJtyj28VPO8UmefhkEWY6cChbMI/TuWpR4r53
 Fv3g==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpJIGFtIHRlc3RpbmcgbGF0ZXN0IHJjOC9MaW51cyBnaXQgdHJlZSBvbiBteSBuZXcK
QWNlciBOaXRybyA1IChBTjUxNS00My1SOEJGKSBMYXB0b3AuCgpUaGUgYm94IGhhcyBhbiBSeXpl
bjcgMzc1MEggQVBVK1JYIDU2MHggaHlicmlkIEdQVShzKS4KClN1c3BlbmRpbmcgKCBjbG9zaW5n
IHRoZSBMaWQgKSBmcm9tIHR0eSB3aXRob3V0IFggdXAKaXMgd29ya2luZyBmaW5lLCBob3dldmVy
IHdpdGggWCBydW5uaW5nIGRvaW5nIHRoZSBzYW1lCmRvZXMgbm90IHdvcmsuIFRoZSBkaXNwbGF5
IHJlbWFpbnMgYmxhY2suCgpJdCBzZWVtcyB0byBiZSB0cmlnZ2VyZWQgZnJvbQoKIC4uIGRjbjEw
X2h3X3NlcXVlbmNlci5jOjkzMgpkY24xMF92ZXJpZnlfYWxsb3dfcHN0YXRlX2NoYW5nZV9oaWdo
LmNvbGQrMHhjLzB4MjI5IFthbWRncHVdCgpUaGUgZG1lc2cgaXMgd2F5IHRvIGJpZyB0byBwb3N0
IHRoZXJlIHNvIEkgdXBsb2FkZWQgaXQ6CgpkbWVzZzoKIGh0dHA6Ly9jcmF6eS5kZXYuZnJ1Z2Fs
d2FyZS5vcmcvTml0cm81L2RtZXNnLm9uZS50eHQKbHNwY2k6CiBodHRwOi8vY3JhenkuZGV2LmZy
dWdhbHdhcmUub3JnL05pdHJvNS9sc3BjaS5ubnZ2LnR4dAogaHR0cDovL2NyYXp5LmRldi5mcnVn
YWx3YXJlLm9yZy9OaXRybzUvbHNwY2kudHh0CmNvbmZpZzoKIGh0dHA6Ly9jcmF6eS5kZXYuZnJ1
Z2Fsd2FyZS5vcmcvTml0cm81L2NvbmZpZy5uaXRybzUtNS4zLXI4Z2l0CgpJIGRpZG4ndCB0ZXN0
ZWQgYW55IG90aGVyIHJjWCBrZXJuZWxzIHNvIEkgY2Fubm90IHRlbGwgaWYgYWxsIGFyZSBhZmZl
Y3RlZCwKYnV0IDUuMi54IGtlcm5lbHMgYXJlIHdvcmtpbmcgZmluZSBvbiB0aGlzIGJveC4KCgpU
aGUgZGlydHkgc3RhdGUgb2YgdGhlIGJ1aWxkIGlzIGJlY2F1c2UgdGhpcyBwYXRjaCwgd2hpY2gg
Zml4ZXMgdGhlCk5WTUUgZGV2aWNlIG9uIHRoYXQgYm94OgogaHR0cHM6Ly9sa21sLm9yZy9sa21s
LzIwMTkvOS8xMS81NjkKCklmIHlvdSBuZWVkIG1vcmUgaW5mb3MgcGxlYXNlIGxldCBtZSBrbm93
LgpBbHNvIEkgY2FuIHRlc3QgYW55IGtpbmQgcGF0Y2hlcy4KCkJlc3QgUmVnYXJkcywKCkdhYnJp
ZWwgQwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
