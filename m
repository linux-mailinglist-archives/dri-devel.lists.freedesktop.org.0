Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385C8B076B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8516E314;
	Thu, 12 Sep 2019 04:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A74C6E0E8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 17:35:27 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id h17so19526899otn.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 10:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TEfrk6KvUm4zkJzNEnqhME9vQpfgK19PybX3jXtohZo=;
 b=Ndm2UMYvQDjoRmCq7qgTgm+8k3Z0QDF9Ytxcfk2tGtKqkiQ7zIS2lpBl8mfDq4mYeG
 4MW6nHiEdA7Mx9Y1/8jhwT8F7J63hoMhUADmKjWvmPko5XwYik2i2LWZGvV19FKX1aqV
 kCWftEfUXLQrAH3pPExy4ZVlCgFyZgixqxbAWcEnSwqYIO59q+eChToikB+Zjcw2V7MU
 3O7VvUNCCbTMmaRyHIk9/U7+VZLPPYYLZE/d6nBS8mzbNXsqtshK8zD6s+dk1Rg6LVaa
 +dhTBognS5F2q3Nq+t6weTEEh+avaNtXvnhS7Y3B9MHBfWgFiOMkt+wja5+a0gmIL93N
 +dBw==
X-Gm-Message-State: APjAAAUPWNs0UtM7X2xpR+nYvwacFrniOr05h5LIT0SVyq98biwL9wZy
 dQcJVFpLxfrIyZhOSEwFmdx1OAMvuErcQoBFlaYtDg==
X-Google-Smtp-Source: APXvYqw3z/39J3ppM7jVmY15tndaCB9Zdaqc203+jWogzJDkjqR8oemXGl5cld6feJSozj9QyZvIBinE9kz+zlDrRX0=
X-Received: by 2002:a9d:6a95:: with SMTP id l21mr4192885otq.127.1568223326279; 
 Wed, 11 Sep 2019 10:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190829212417.257397-1-davidriley@chromium.org>
 <20190910200651.118628-1-davidriley@chromium.org>
 <20190911051240.2k2olzsc3xnqaggl@sirius.home.kraxel.org>
In-Reply-To: <20190911051240.2k2olzsc3xnqaggl@sirius.home.kraxel.org>
From: David Riley <davidriley@chromium.org>
Date: Wed, 11 Sep 2019 10:35:15 -0700
Message-ID: <CAASgrz3rA-i3AjT3UuG7gPTHzdHppNLR3C0j23DEgqxivXtPmg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/virtio: Rewrite virtio_gpu_queue_ctrl_buffer
 using fenced version.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TEfrk6KvUm4zkJzNEnqhME9vQpfgK19PybX3jXtohZo=;
 b=Ss3lFDmf2x1zmO1RCvXlfUtFdYVJh0kNCj3udMihFRoZiN/GWtF+/4KvyzEQubX/KW
 iBu3xQLy7jsvT6xaWVkJLfsbEL/t5g94+kfe3NqgjagfCJbtbHrjENvnn8uOMcZFuWca
 +zDutqYLaEIojaveCLCcZw7YstXFgG9iDo2/M=
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
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSB3ZXJlIGJhc2VkIG9mZiBvZiAgTGludXMnIGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxk
cy9saW51eAptYXN0ZXIgZnJvbSB5ZXN0ZXJkYXkuCgpJIGNhbiByZWJhc2Ugb250byBkcm0tbWlz
Yy1uZXh0LgoKT24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMTA6MTIgUE0gR2VyZCBIb2ZmbWFubiA8
a3JheGVsQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDE6
MDY6NTBQTSAtMDcwMCwgRGF2aWQgUmlsZXkgd3JvdGU6Cj4gPiBGYWN0b3IgZnVuY3Rpb24gaW4g
cHJlcGFyYXRpb24gdG8gZ2VuZXJhdGluZyBzY2F0dGVybGlzdCBwcmlvciB0byBsb2NraW5nLgo+
Cj4gUGF0Y2hlcyBhcmUgbG9va2luZyBnb29kIG5vdywgYnV0IHRoZXkgZG9uJ3QgYXBwbHkuICBX
aGF0IHRyZWUgd2FzIHVzZWQKPiB0byBjcmVhdGUgdGhlbT8KPgo+IExhdGVzdCB2aXJ0aW8tZ3B1
IGRyaXZlciBiaXRzIGFyZSBpbiBkcm0tbWlzYy1uZXh0IChzZWUKPiBodHRwczovL2NnaXQuZnJl
ZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYykuCj4KPiBjaGVlcnMsCj4gICBHZXJkCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
