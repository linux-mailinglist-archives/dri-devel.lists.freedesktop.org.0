Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BCFB0778
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813C36EBBB;
	Thu, 12 Sep 2019 04:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53576E0E8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 18:14:10 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id c17so4172736pgg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 11:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QeCkq8O6sVKFyd/945VFVyHWjibGiHNZAw/pssnAllE=;
 b=eFGYIto/c845BLznFfDhag7OZQtm+zkyJpWgnzniiHzBbw0EIfanVjO3JPcm6YMTI8
 vD7gf6YFtT1dS2OqY8fge8OXkaO4wV/FMHhO+ZA/h9ZpaZVRFQ0TIQ9iOel15CEvgv3U
 iJhwPeH5aJp9h5Y3QxVO7H5prbMvM3GgjI+sFAaJSv1WlIQUI4C+ysHXJCZ97JmimusP
 Qn268zL6jOo9M1ixZHQaLvcoe6n41KYzMKokUjTN6XFreU+tI5euvnXAqV6meMvMIHpt
 3P2Aho5vAr4/xCS7ZpihfFFYLZqNHfPsp2HlKajrqjH4GINV0RmPDURA0prui5Zk546j
 TrOw==
X-Gm-Message-State: APjAAAVpLSkrEHmGRn5vRytOKBLXM0N1b3HRcmFydolj+J+J5PouoGqj
 hENFDN8vWtJgckrNKOAtZhZn8h89LlQ=
X-Google-Smtp-Source: APXvYqw2YMboZHNEz3lO+hmTQMf8RZ0yNwApdiKl8X00zTdruij3p8IG09Q5F3leuHLIUyGCjDM6/A==
X-Received: by 2002:a62:1c16:: with SMTP id c22mr45606019pfc.10.1568225650053; 
 Wed, 11 Sep 2019 11:14:10 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
 by smtp.gmail.com with ESMTPSA id a13sm31056059pfg.10.2019.09.11.11.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2019 11:14:08 -0700 (PDT)
From: David Riley <davidriley@chromium.org>
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH v4 0/2] drm/virtio: Use vmalloc for command buffer
 alllocations.
Date: Wed, 11 Sep 2019 11:14:01 -0700
Message-Id: <20190911181403.40909-1-davidriley@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
In-Reply-To: <20190829212417.257397-1-davidriley@chromium.org>
References: <20190829212417.257397-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QeCkq8O6sVKFyd/945VFVyHWjibGiHNZAw/pssnAllE=;
 b=I0SjecpohOXAuX41i+C8/iUqI2Ta/6iJL/5++KgCgax3VgHtodgZSCGi7o9EreJyrD
 XN0LgK6zJ5+788K+EAIjt5svypU/Lzsd2QUfTjt+P+eZTKhp+EFx4sOxnOi/RLxhKSNl
 kPHqBgZR/n6Pnn3u/zAydjw5VQM4t4SSuZetI=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlcnNwYWNlIHJlcXVlc3RlZCBjb21tYW5kIGJ1ZmZlciBhbGxvY2F0aW9ucyBjb3VsZCBiZSB0
b28gbGFyZ2UKdG8gbWFrZSBhcyBhIGNvbnRpZ3VvdXMgYWxsb2NhdGlvbi4gIFVzZSB2bWFsbG9j
IGlmIG5lY2Vzc2FyeSB0bwpzYXRpc2Z5IHRob3NlIGFsbG9jYXRpb25zLgoKdjE6IEluaXRpYWwg
dmVyc2lvbi4KdjI6IFByb3Blcmx5IGFjY291bnQgZm9yIG51bWJlciBvZiBmcmVlIGRlc2NyaXB0
b3JzIHJlcXVpcmVkLgp2MzogUmVtb3ZlIG9mZnNldCBoYW5kbGluZyBmb3Igdm1hbGxvYydkIGJ1
ZmZlcnMuCnY0OiBSZWJhc2Ugb250byBkcm0tbWlzYy1uZXh0LgoKRGF2aWQgUmlsZXkgKDIpOgog
IGRybS92aXJ0aW86IFJld3JpdGUgdmlydGlvX2dwdV9xdWV1ZV9jdHJsX2J1ZmZlciB1c2luZyBm
ZW5jZWQgdmVyc2lvbi4KICBkcm0vdmlydGlvOiBVc2Ugdm1hbGxvYyBmb3IgY29tbWFuZCBidWZm
ZXIgYWxsb2NhdGlvbnMuCgogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMg
fCAgNCArLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMgICAgfCA5OCArKysr
KysrKysrKysrKysrKysrKy0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA3OSBpbnNlcnRpb25zKCsp
LCAyMyBkZWxldGlvbnMoLSkKCi0tIAoyLjIzLjAuMTYyLmcwYjlmYmIzNzM0LWdvb2cKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
