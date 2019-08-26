Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9DC9D734
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 22:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34DF8800B;
	Mon, 26 Aug 2019 20:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDC88800B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 20:07:55 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t14so16296134lji.4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 13:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c92BjnNVgfZLXIOhyylGapSRsNCPw3Ef4tEA7baXWu4=;
 b=l7nahGtX27uIwl9aXWj8k0/j0JIsbTGwYTRigQCzGRPB+UrmDWgFdIDRGOmjNJ7gSM
 qJh48H3aiQYDGrqpoV6JuN+bbEo9KxFzDH4rNU0IZxwEFPBquzM4U/HqkOepRzgZH5Rq
 +I6JzPO9d2+kCp1OayvBFffRD9kyMalMgqhjjVifbO1JrJYOFtpTQ9s6eVzZQFQ03NY+
 LKAYZc1gSXIWDHn+pDq3w5TpSso5hLPOuV7e+LUBuVx0sMDAsbaIvJyTlwCWxpDnnlIU
 ejC1okGWHb6X+ezcLB2ajglx48dipyisj2gWOU+bU/E4nVFWBriaBcmWdrZUa9LCtfGt
 +26Q==
X-Gm-Message-State: APjAAAWHld6jiG9loiJ/KwYY1+hgN5rbOKUvzEiiwkBXjDFcR25pT54O
 onXHSfv4kglX7blv5Un1i91E5QVMUQii2MkfvmFs01+KmkmGcA==
X-Google-Smtp-Source: APXvYqwdVacdkkTIiNc4ej4zpP7wnFPalWn8AKBHdtMHls322lhjb0Nzh2G0ic8+a/WiIiu09L5/nD3J/b59IQOVLBA=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr4564513ljc.28.1566850073876; 
 Mon, 26 Aug 2019 13:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190822211518.5578-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190822211518.5578-1-christophe.jaillet@wanadoo.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2019 22:07:42 +0200
Message-ID: <CACRpkdb0CuPVby066zjqLX1rRuc6KDL7jvt3KaCpEWgEFvp+Mg@mail.gmail.com>
Subject: Re: [PATCH] drm/mcde: Fix an error handling path in 'mcde_probe()'
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=c92BjnNVgfZLXIOhyylGapSRsNCPw3Ef4tEA7baXWu4=;
 b=hwDOYcszyJaq1djxoAsdgpjbWsdRoqL2rImR8JYo1xsvaWTITMH1YxHFoOBwvqOrCl
 j/0Tu9nOLnidmXQ5JMdF5eCalrFwl0Wmma+QSb6T0rB6zcHnw/wys2fLX/R6tPBvjyND
 6OzpjAFOpH+p05WdCN+87pcKOvokk8AXb5B46UwNKSmu3smjEu+Hjm42BhXKsPmlXe/E
 mFuB572S+TVAYHaFvRHQjhwCf/1LikKsk/z2zlT13bZJ3HgaeFp7ORZAlUUBs3qZhu/n
 GJGutHBCfkjfRMKTG1ec4OeOGZ/nfPtICyw7rH1EYnqedHkCizIBj9RlYF+yUEsuRflI
 brDA==
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
Cc: Dave Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMTE6MTUgUE0gQ2hyaXN0b3BoZSBKQUlMTEVUCjxjaHJp
c3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4gd3JvdGU6Cgo+IElmIHdlIGRvbid0IGZpbmQgYW55
IG1hdGNoaW5nIGNvbXBvbmVudHMsIHdlIHNob3VsZCBnbyB0aHJvdWdoIHRoZSBlcnJvcgo+IGhh
bmRsaW5nIHBhdGgsIGluIG9yZGVyIHRvIGZyZWUgc29tZSByZXNvdXJjZXMuCj4KPiBGaXhlczog
Y2E1YmU5MDJhODdkICgiZHJtL21jZGU6IEZpeCB1bmluaXRpYWxpemVkIHZhcmlhYmxlIikKPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5h
ZG9vLmZyPgoKUGF0Y2ggYXBwbGllZCEKCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
