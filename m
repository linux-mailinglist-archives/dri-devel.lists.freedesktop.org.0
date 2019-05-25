Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D2F2B412
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF02089B5F;
	Mon, 27 May 2019 12:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41076E169
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 17:59:43 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id z28so7204472pfk.0
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 10:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=uwSYiRPVFEjQuM0sSyZ+kLnllnNTFI6WD6DgQoN9mU0=;
 b=VFkNBbn0mP7ASETA/7M+Rg/Zmd1m+gfgM7FPey3fXOo1AJMI6eMCoqUYJjSlxw8Zgu
 cg8UszoIEpZmPOh4rBUwFBx2Hd4B1h3nOr6f1/08GS5KD1c5ymB8LNG98qNpOF+TtXG4
 f8TdBEKFfky8E3gvcJVA240T14xTYmOS6NvwkdwvY4+iMj4fQfci6+Z8B+NpD4PTlBif
 +et/0wZFU7WfOD0i672Dkyd8hhQDVWF5Cqtebv96W4ZF8zlOi7DF881qxIhrG5og1/9r
 kd4xjNUefc2bDpjP9FHqr3Beq0yLNnZWSR6rw9P5deSLttGg24g58uUFStXDQZvjbTaZ
 9KMQ==
X-Gm-Message-State: APjAAAWTk9laPwJfSS96EpY6kRLlS8ASFE6SK7tclWLXks03kKho6eJD
 2wc+pW8nXuchdtCleeNimF8=
X-Google-Smtp-Source: APXvYqxIYOz6qPCXV0hkYRbakdXEMJw/cSeGknOs+gkiAXX+J1xDezn9slFmKxF017nCeWGgpOg06Q==
X-Received: by 2002:a62:5103:: with SMTP id f3mr123729284pfb.146.1558807183602; 
 Sat, 25 May 2019 10:59:43 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.92.73])
 by smtp.gmail.com with ESMTPSA id b18sm10017130pfp.32.2019.05.25.10.59.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 10:59:42 -0700 (PDT)
Date: Sat, 25 May 2019 23:29:37 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Marc Zyngier <marc.zyngier@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: analogix_dp: possible condition with no effect
 (if == else)
Message-ID: <20190525175937.GA29368@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=uwSYiRPVFEjQuM0sSyZ+kLnllnNTFI6WD6DgQoN9mU0=;
 b=m9n2OcAr4oPaQmt5EaECUwWw7q8oAO9NOKTzgtcL5yv9sn0wqLtljcj0twRuahROqC
 hZvgNOUEomUSjZVNMerY0cJFYsJIohHQuWm2sbkQZA99SWXbrBvYMvH73dQV8FWs/P20
 C/9EU96S743OTEfZoOjK/LS9Xmtq1nxz2hELM4oZUWGsxXyH3fta2Ky9VLme4akuow12
 8bUmsdWH0D5HwcggJ2uCehbSJ3T9O3i3rPmkIP+gCTO5g0tCKxv3PHWfBmn3jkKi92y4
 JfmHAbLmOd40HnM7FXZ9ljrT+pbRcBbkYAwOBbGJxm6y2Z6CyaDo3OxiAgoZgrKhom87
 SFzg==
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

Zml4IGJlbG93IHdhcm5pbmcgcmVwb3J0ZWQgYnkgY29jY2ljaGVjawoKLi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYzoxNDE0OjYtODogV0FSTklORzoK
cG9zc2libGUgY29uZGl0aW9uIHdpdGggbm8gZWZmZWN0IChpZiA9PSBlbHNlKQoKU2lnbmVkLW9m
Zi1ieTogSGFyaXByYXNhZCBLZWxhbSA8aGFyaXByYXNhZC5rZWxhbUBnbWFpbC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMgfCAyIC0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jCmluZGV4IDI1N2Q2OWIuLmNmY2Qx
NTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhf
ZHBfY29yZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhf
ZHBfY29yZS5jCkBAIC0xNDExLDggKzE0MTEsNiBAQCBzdGF0aWMgdm9pZCBhbmFsb2dpeF9kcF9i
cmlkZ2VfbW9kZV9zZXQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKIAkJdmlkZW8tPmNvbG9y
X3NwYWNlID0gQ09MT1JfWUNCQ1I0NDQ7CiAJZWxzZSBpZiAoZGlzcGxheV9pbmZvLT5jb2xvcl9m
b3JtYXRzICYgRFJNX0NPTE9SX0ZPUk1BVF9ZQ1JDQjQyMikKIAkJdmlkZW8tPmNvbG9yX3NwYWNl
ID0gQ09MT1JfWUNCQ1I0MjI7Ci0JZWxzZSBpZiAoZGlzcGxheV9pbmZvLT5jb2xvcl9mb3JtYXRz
ICYgRFJNX0NPTE9SX0ZPUk1BVF9SR0I0NDQpCi0JCXZpZGVvLT5jb2xvcl9zcGFjZSA9IENPTE9S
X1JHQjsKIAllbHNlCiAJCXZpZGVvLT5jb2xvcl9zcGFjZSA9IENPTE9SX1JHQjsKIAotLSAKMi43
LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
