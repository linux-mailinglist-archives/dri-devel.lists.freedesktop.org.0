Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A3D155ED5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 20:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987326FD78;
	Fri,  7 Feb 2020 19:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C4F6FD71;
 Fri,  7 Feb 2020 19:51:11 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id j20so252254qka.10;
 Fri, 07 Feb 2020 11:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vuO2RgQIhRHrPoIOS6P9hpIDp5H+sQisyjrPWS+rotU=;
 b=tiIDrcsLW836k++hg9Aw0QrmZf71n1Zhzv0MOCFnmL++agdzWXgdl7+5zUe5wdyyhD
 lw+fo9oQTc+Nrf2X812Mg0a2B7UBcE8UmJcY/NKFKudrG+zr4PuZ3/fvgFf+MzYQmJEw
 EGCKoTZVwt2e2Mgr0KkGbSfAYHItyFCUwJ9Gf1+YtyGgDXhdgGtacBZD+exjCg6SeE+5
 6BpwgoyRmSkf2q+zShOU5mc36mdOtL2H9NkhvAAB7O3HSj5qJ4XDGbHwsx+ACfK/vSAy
 VCa0Ir5m+pcF5yw+VsE5TcEOJSBgm24z3A03DG65lWM/0eoneKk3DzPX+cKmwqRKL9Xi
 iGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vuO2RgQIhRHrPoIOS6P9hpIDp5H+sQisyjrPWS+rotU=;
 b=uTzTYbOeEJxHdPDoOFJYYkN8cyjSVGI1M3kTtyjdEYik3Uh2+hbos8/kTRuCfv+H7a
 u5tobQkJEjir3vKDa3cgdyXad4nZP3EyqCF/XNfLEk1Ehfp1i0sEm8WJfqrxS7hWjsJM
 F52GFbagIb9yguHhX7hnoIADsJuCGMTdTgk0KqggUtRe+2NwSuwEpvRSjhcEhfRKJpIx
 hrl4r2NRS3YGImygOKdVzVbDWxgLaWYIlJa7Sw0P9qdf3ID60Mcb4U/vle3nqRqfzpBW
 im/DU6I/YkgsR8Y9dUE3/uDx8CSvpZP6uqEFY2jjRdAdxBlFyaJP4jsPHcm/6xEJ0Pru
 VRvQ==
X-Gm-Message-State: APjAAAXuIn+gUKo4ea+5XYsEBJD2jAsCESkf9thOx+rhpryZKV+asFwI
 ABXp3PHeFVGkO3lBOYQ5VN5aWm6M
X-Google-Smtp-Source: APXvYqwcvKM4XqtLBNpp1gzixUU4c2qPVCAd3yaUUGdKvtZHXadujAcMp+7Ge8EGMAKQw2ZO2Vh3Cg==
X-Received: by 2002:a37:6346:: with SMTP id x67mr526597qkb.476.1581105070703; 
 Fri, 07 Feb 2020 11:51:10 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id w16sm1752226qkj.135.2020.02.07.11.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 11:51:10 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/15] drm/amdgpu/fence: move debugfs init into core amdgpu
 debugfs
Date: Fri,  7 Feb 2020 14:50:48 -0500
Message-Id: <20200207195058.2354-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207195058.2354-1-alexander.deucher@amd.com>
References: <20200207195058.2354-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gb3JkZXIgdG8gcmVtb3ZlIHRoZSBsb2FkIGFuZCB1bmxvYWQgZHJtIGNhbGxiYWNrcywKd2Ug
bmVlZCB0byByZW9yZGVyIHRoZSBpbml0IHNlcXVlbmNlIHRvIG1vdmUgYWxsIHRoZSBkcm0KZGVi
dWdmcyBmaWxlIGhhbmRsaW5nLiAgRG8gdGhpcyBmb3IgZmVuY2UgaGFuZGxpbmcuCgpBY2tlZC1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYyB8IDMgKysrCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYyAgIHwgMyAtLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCmluZGV4IDg0YzVlOWYyM2M3Ni4uYmNkMTBkYWE2ZTM5
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKQEAgLTEy
NDUsNiArMTI0NSw5IEBAIGludCBhbWRncHVfZGVidWdmc19pbml0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogCQlkZXZfZXJyKGFkZXYtPmRldiwgImZhaWxlZCB0byByZWdpc3RlciBkZWJ1
Z2ZzIGZpbGUgZm9yIFNBXG4iKTsKIAl9CiAKKwlpZiAoYW1kZ3B1X2RlYnVnZnNfZmVuY2VfaW5p
dChhZGV2KSkKKwkJZGV2X2VycihhZGV2LT5kZXYsICJmZW5jZSBkZWJ1Z2ZzIGZpbGUgY3JlYXRp
b24gZmFpbGVkXG4iKTsKKwogCXJldHVybiBhbWRncHVfZGVidWdmc19hZGRfZmlsZXMoYWRldiwg
YW1kZ3B1X2RlYnVnZnNfbGlzdCwKIAkJCQkJQVJSQVlfU0laRShhbWRncHVfZGVidWdmc19saXN0
KSk7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVu
Y2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jCmluZGV4IDNj
MDEyNTJiMWUwZS4uNzUzMTUyNzA2N2RmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZmVuY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZmVuY2UuYwpAQCAtNTAzLDkgKzUwMyw2IEBAIGludCBhbWRncHVfZmVuY2VfZHJpdmVy
X2luaXRfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCiAgKi8KIGludCBhbWRncHVfZmVu
Y2VfZHJpdmVyX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7Ci0JaWYgKGFtZGdw
dV9kZWJ1Z2ZzX2ZlbmNlX2luaXQoYWRldikpCi0JCWRldl9lcnIoYWRldi0+ZGV2LCAiZmVuY2Ug
ZGVidWdmcyBmaWxlIGNyZWF0aW9uIGZhaWxlZFxuIik7Ci0KIAlyZXR1cm4gMDsKIH0KIAotLSAK
Mi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
