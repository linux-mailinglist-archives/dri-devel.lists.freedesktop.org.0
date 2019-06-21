Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CB34FD9C
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 20:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42EF8996E;
	Sun, 23 Jun 2019 18:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED386E927
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 21:13:45 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id s184so5635612oie.9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 14:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9IUC+1FlEWN4tKm0SeOLpdninTmF6qp7MuCWQSXIRz0=;
 b=cKHmbjg4HPpXraSpT9pyViFRZO8N61bbQIHOHb/deSibEcPWuV7t69cQKPZhhQa8lM
 Kx2/cr/sDFgo9qs4styFV4Qn1GdMUAOApXljYXxJ8XrVE901DKIC9vFHk/rPXqXb1O9E
 Sg2MTX8mPF5X/q8F72UUcLdZt591t82mhdwFSfOXuyzftk9dRb8LUrm8SWwyTEpgz0gY
 Y9wuTj9xKuTRL33v7bN9eUOQp82c7v6j8hU7zy6eAa0b9QeIN7mt5xGwC6o/Xl3FGYof
 39Ovu2zP3KRGyDAZolzSUFlZLWDGy0b+3iZrut+tP1B+aRXdCfozpFzTpXMO4ZFxZ7dX
 KxbA==
X-Gm-Message-State: APjAAAUK/MqigPTAggQq5KVONfP4BcMWp9f9iW1Yunpi3jS3tGaBODlU
 CMkcpUtfTlDFczEYE+8312M5QuDXLgYEiYraInw=
X-Google-Smtp-Source: APXvYqyxyydXVSFfPulOIi8kVAD1JoXVYjMnHyrAQUKHmu3An8stQ4fEJaOVPKC1r0dPwGaIb3ZzO/3MuR63dIStNJk=
X-Received: by 2002:aca:edc6:: with SMTP id l189mr3939794oih.86.1561151624435; 
 Fri, 21 Jun 2019 14:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190527191552.10413-1-TheSven73@gmail.com>
 <20190621151500.cv57g3al5sadpcum@shell.armlinux.org.uk>
In-Reply-To: <20190621151500.cv57g3al5sadpcum@shell.armlinux.org.uk>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Fri, 21 Jun 2019 17:13:33 -0400
Message-ID: <CAGngYiU_drPPXAzY3W3duxxTcUXUASeuCu_wj8zmxvrasEDq8Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/i2c: tda998x: access chip registers via a
 regmap
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-Mailman-Approved-At: Sun, 23 Jun 2019 18:31:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9IUC+1FlEWN4tKm0SeOLpdninTmF6qp7MuCWQSXIRz0=;
 b=EgGximCk5VUAACKrAUkWk4HPsHG5TW9Q2kItYQxrZT4piz7tvdkA7ErNRpdUfgYTz/
 rApW/8A0zBwoaPh8gPyBvBXE4p4MQdQY5PVrXdPQpdzqHvi/Nxm65xy4BlmYu7862Ymy
 gdDEkEtwyRZhRDVCPOSOTHUxTXzQ3OZjn21yiAbjiYvXV/a92/NPBxtATIGFDdLzcxP4
 /9bhou2w+OKNEawob6PgVVubUkYgux8mIJOqchPDyvC8vLvZq3wC5ABvjCfkJWlUk/Km
 RsALukt/0D3l7eoRIbGbntdPp2gu4dXbDmkGZAWmnXxH0pBSEMT4iUeZm1lK7zCstle3
 du+w==
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
Cc: David Airlie <airlied@linux.ie>, Peter Rosin <peda@axentia.se>,
 dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTE6MTUgQU0gUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4
IGFkbWluCjxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gQW5vdGhlciBjb24gaXMg
dGhlIG5lZWQgdG8ga2VlcCB0aGUgZnVuY3Rpb25zIHRoYXQgZGV0YWlsIHRoZSByZWdpc3Rlcgo+
IHByb3BlcnRpZXMgdXAgdG8gZGF0ZSwgd2hpY2ggaWYgdGhleSdyZSB3cm9uZyBtYXkgcmVzdWx0
IGluIHVuZXhwZWN0ZWQKPiBiZWhhdmlvdXIuCj4KPiBJIHN1YnNjcmliZSB0byB0aGUgImtlZXAg
aXQgc2ltcGxlIiBhcHByb2FjaCwgYW5kIHJlZ21hcCwgYWx0aG91Z2gKPiB1c2VmdWwsIHNlZW1z
IGxpa2UgYSBnaWFudCBzbGVkZ2VoYW1tZXIgZm9yIHRoaXMuCj4KClRoYW5rIHlvdSBmb3IgdGhl
IHJldmlldyAhCgpJIGFkZGVkIHRoaXMgYmFjayB3aGVuIEkgd2FzIGRlYnVnZ2luZyBhdWRpbyBh
cnRpZmFjdHMgcmVsYXRlZCB0byB0aGlzCmNoaXAuIFRoZSByZWdtYXAncyBkZWJ1Z2ZzIGJpbmRp
bmcgd2FzIGV4dHJlbWVseSB1c2VmdWwuIFNvIEkKZHJlc3NlZCBpdCB1cCBhIGJpdCBpbiB0aGUg
aG9wZSB0aGF0IGl0IHdvdWxkIGhhdmUgc29tZSBnZW5lcmFsIHVzZS4KCkJ1dCBpZiB0aGUgY29u
cyBvdXR3ZWlnaCB0aGUgcHJvcywgdGhlbiB0aGlzIGlzIGFzIGZhciBhcyB0aGlzIHBhdGNoCndp
bGwgZ28uLi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
