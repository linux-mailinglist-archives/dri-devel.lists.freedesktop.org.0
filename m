Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 526D62B4DA3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE01D6E0A2;
	Mon, 16 Nov 2020 17:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51DF6E04A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:22 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j7so19654430wrp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wySX8cNvv9NUCsmEXsR0JBc7XJM0MHUH49ItqBshbVE=;
 b=hy+U4SAx16PrqlnuxVW5U1xQBAKZb2kMB+JBT6jHCWWzrxWoYMTf/gpOSUnZWvRMBJ
 AV+gpm5PS/9qVYSDg82yYZi5O9uwFTk2UVpOOUA9Q4MvdxOld2ijiYRGuvNm5GalEDxs
 H1hQ4gnyxx6Zs2PHS9F7KXqSpGHsvqpezLeVqbrX7w7HPqWJrC6g6I8U9OhtKkHHHTNk
 cOjr9HODR3ivsTKLy9slgduBPEMGw2/z1aGzX4m9gECM8l81Ti37Trf+2hA7dZT2Qof5
 NdJl4WjDbuuwMbqraBU2i1ZcGYRv6BvOUBLindgX0mkRR8iLqZ6+d2hsFvh9ewzYucNv
 wZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wySX8cNvv9NUCsmEXsR0JBc7XJM0MHUH49ItqBshbVE=;
 b=DlBVuGssVvkbbf9LprRL2ePt0763kaByZUa4SyQVaXEiqNQArD2Tw7GpVwGRlmmeIs
 vXBeoRTkQ8MCfEbvfU1xhWFJLR3Yler9S2huWs/7x/NxxgChdujCzx08tVMBRzUOSMq5
 yjoc3ns+ZyXC0Au/eeQNeaqp9wHty6C+rRh2bJrlmTk9bi9sS32M/8X5y9xrjHkCK5Mp
 PQB6CqRoNl2KBf4FT4omk+lRLofqBS3fSurVqqB5GOo0HoP9HsQNK1hWBTnykblVqaR/
 Mc7EhaAUzAhvM6rSv5tKep6oOXoRmFICdBfZfmxXJxYIl9Jyj1NosRzBu/4mcJtgt5Pt
 sllg==
X-Gm-Message-State: AOAM533wHdgXGxsqrXt5/bMnuRw599Vt6MYVaeXroy4OFABV4kQW6dTO
 caRkGKbyzbJo6MEz6RKf1QO+tQ==
X-Google-Smtp-Source: ABdhPJz2NVpodSO80ODErNsO8Nnc8xpQNlSxjZjIgamuTY2aDdtYen+IQPe6zyftuY2DtfotFd1Ybw==
X-Received: by 2002:adf:eb4d:: with SMTP id u13mr19723606wrn.146.1605548481587; 
 Mon, 16 Nov 2020 09:41:21 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/42] drm/armada/armada_overlay: Staticify local function
 'armada_overlay_duplicate_state'
Date: Mon, 16 Nov 2020 17:40:32 +0000
Message-Id: <20201116174112.1833368-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfb3ZlcmxheS5jOjMyOToxOiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yIOKAmGFybWFkYV9vdmVybGF5X2R1cGxpY2F0ZV9zdGF0ZeKAmSBb
LVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5v
cmcudWs+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
ClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfb3ZlcmxheS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybWFkYS9hcm1hZGFfb3ZlcmxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9h
cm1hZGFfb3ZlcmxheS5jCmluZGV4IDMwZTAxMTAxZjU5ZWQuLjYzNDZiODkwMjc5YTAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX292ZXJsYXkuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9vdmVybGF5LmMKQEAgLTMyNSw3ICszMjUsNyBAQCBz
dGF0aWMgdm9pZCBhcm1hZGFfb3ZlcmxheV9yZXNldChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkK
IAl9CiB9CiAKLXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKgorc3RhdGljIHN0cnVjdCBkcm1fcGxh
bmVfc3RhdGUgKgogYXJtYWRhX292ZXJsYXlfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lKQogewogCXN0cnVjdCBhcm1hZGFfb3ZlcmxheV9zdGF0ZSAqc3RhdGU7Ci0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
