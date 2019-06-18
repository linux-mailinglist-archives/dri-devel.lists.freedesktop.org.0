Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FA349790
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 04:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE34C6E0CC;
	Tue, 18 Jun 2019 02:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606356E0CC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 02:42:01 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d17so8510953qtj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 19:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=IVz6BAknW6t/cZoUe0OsXuR9J6By+25KR1QWnphRfwQ=;
 b=GWNwNqyel+Xu2JRvvKx36CH67abTa8A525oWltp4zEpZrKoKR8XZBcENqzyLQGIlI4
 7wY/HLRc2vfx35GY0910xZywcOv8d78anv3Q9PK2nBmvub2KduJZQgnzY3j4xMveeRh2
 n+dGozfhlyISfjNQvEaqjhiG0Z2oEwIWayiL6k8qdHX9U6Z9JeDYSKyki6Om5Xe9OaLF
 7LLsOqpJbi2ENA9mCZ8PIVt1sPHIRAerb4am4w94q7PA2NmvkTOw07yhK63QHHawY4fy
 sHFbmS+H4AqX4uB5UJyA1FtLAJyYnOtHB3aJibSGTendmWjgnJUqzNGpjvqhwlA8JjIy
 WK0w==
X-Gm-Message-State: APjAAAVtzpyx7s6/4ovIoB/910VHX6P/W12euP8bHvPReFoWPJAEJ6fA
 1LDQomIEYwK9j8bqmXs+FFw=
X-Google-Smtp-Source: APXvYqxmov6aRqBgVgEHQVi8PRdHCcaCQsKljpg1j8I85jrk0Kp3f23uBl6FNdvQ3E04Jdsdhxi0sA==
X-Received: by 2002:ac8:3345:: with SMTP id u5mr99447735qta.219.1560825720545; 
 Mon, 17 Jun 2019 19:42:00 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id j184sm7209111qkc.65.2019.06.17.19.41.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 19:42:00 -0700 (PDT)
Date: Mon, 17 Jun 2019 23:41:55 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Brian Starkey <brian.starkey@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simon Ser <contact@emersion.fr>
Subject: [PATCH V2 0/5] drm/vkms: Introduces writeback support
Message-ID: <cover.1560820888.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=IVz6BAknW6t/cZoUe0OsXuR9J6By+25KR1QWnphRfwQ=;
 b=uyNS/GgoiPmcE5pagyeBrTmsGE9qnYmNPJTsBX8mwc/tslW/kqrSuhBYGFUSP776cf
 7RcDrg+2k+HBRegVEYZg9OEcra+jV5ZBehCwxdonN5aKo+n5Rw8ygsCRkFLQDbsJXncZ
 h9hcfuP0L/BQVpvAN8bYNyj9AcpsDpI3jrVjdb9lbJdI+OYCzSqm8FQIAyNKHEU5v2qT
 59rJVJKWtZO0CubKK0FgtYUR1iBN/rCLZgU9DVvH1709zbnf/fKH9l7+jd2v3M04REqW
 DF8X0emOJktfBVF6ui9grAPjVfcHhrfHAzJn10KGAAAQ8jRWHid8ONlGrl3UWN9T4XMe
 r3jQ==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBpbnRyb2R1Y2VzIHRoZSB3cml0ZWJhY2sgc3VwcG9ydCB0byB2a21zLiBB
cyBhIHByZS13b3JrLAp0aGUgZmlyc3Qgc2V0IG9mIHBhdGNoZXMgc2VwYXJhdGVzIHBhcnQgb2Yg
dGhlIGNvZGUgaW5zaWRlIHZrbXNfY3JjIHRvIGEKbmV3IGZpbGUgbmFtZWQgdmttc19jb21wb3Nl
cjsgdGhpcyBjaGFuZ2UgYWxsb3dzIHRoYXQgb3RoZXIgcGFydHMgb2YgdGhlCnZrbXMgdGFrZSBh
ZHZhbnRhZ2Ugb2YgY29tcG9zaW5nIGZ1bmN0aW9ucy4gTmV4dCwgdGhlcmUncyBhIHBhdGNoIHRo
YXQKZW5hYmxlcyB0aGUgdmlydHVhbCBlbmNvZGVyIHRvIGJlIGNvbXBhdGlibGUgd2l0aCB0aGUg
Y3J0YyB3aGVuIHdlIGhhdmUKbXVsdGlwbGUgZW5jb2RlcnMuIFRoZSBmaW5hbCBwYXRjaCBhZGRz
IHRoZSByZXF1aXJlZCBpbXBsZW1lbnRhdGlvbiB0bwplbmFibGUgd3JpdGViYWNrIGluIHRoZSB2
a21zLiBXaXRoIHRoaXMgcGF0Y2hzZXQsIHZrbXMgY2FuIHN1Y2Nlc3NmdWxseQpwYXNzIGFsbCB0
aGUga21zX3dyaXRlYmFjayB0ZXN0cyBmcm9tIElHVC4KCk5vdGU6IFRoaXMgcGF0Y2hzZXQgZGVw
ZW5kcyBvbiBEYW5pZWwncyByZXdvcmsgb2YgQ1JDLCBzZWUgaXQgYXQKaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MTczNy8KClJvZHJpZ28gU2lxdWVpcmEgKDUpOgog
IGRybS92a21zOiBNb3ZlIGZ1bmN0aW9ucyBmcm9tIHZrbXNfY3JjIHRvIHZrbXNfY29tcG9zZXIK
ICBkcm0vdmttczogUmVuYW1lIGNyY19lbmFibGVkIHRvIGNvbXBvc2VyX2VuYWJsZWQKICBkcm0v
dmttczogUmVuYW1lIHZrbXNfY3JjX2RhdGEgdG8gdmttc19kYXRhCiAgZHJtL3ZrbXM6IFVzZSBp
bmRleCBpbnN0ZWFkIG9mIDAgaW4gcG9zc2libGUgY3J0YwogIGRybS92a21zOiBBZGQgc3VwcG9y
dCBmb3Igd3JpdGViYWNrCgogZHJpdmVycy9ncHUvZHJtL3ZrbXMvTWFrZWZpbGUgICAgICAgICB8
ICAxMCArLQogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jb21wb3Nlci5jICB8ICA2OSArKysr
KysrKysrKwogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jb21wb3Nlci5oICB8ICAxMiArKwog
ZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYyAgICAgICB8ICA4MSArKy0tLS0tLS0tLS0t
CiBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NydGMuYyAgICAgIHwgICAyICstCiBkcml2ZXJz
L2dwdS9kcm0vdmttcy92a21zX2Rydi5jICAgICAgIHwgICA5ICstCiBkcml2ZXJzL2dwdS9kcm0v
dmttcy92a21zX2Rydi5oICAgICAgIHwgIDE4ICsrLQogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmtt
c19vdXRwdXQuYyAgICB8ICAxMiArLQogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19wbGFuZS5j
ICAgICB8ICA0MCArKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX3dyaXRlYmFjay5j
IHwgMTY2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAxMCBmaWxlcyBjaGFuZ2VkLCAzMTUg
aW5zZXJ0aW9ucygrKSwgMTA0IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS92a21zL3ZrbXNfY29tcG9zZXIuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS92a21zL3ZrbXNfY29tcG9zZXIuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS92a21zL3ZrbXNfd3JpdGViYWNrLmMKCi0tIAoyLjIxLjAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
