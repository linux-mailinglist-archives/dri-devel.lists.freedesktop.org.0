Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C615337862
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 16:45:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A246EE1B;
	Thu, 11 Mar 2021 15:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2571D6EE19;
 Thu, 11 Mar 2021 15:45:48 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id 75so1879324otn.4;
 Thu, 11 Mar 2021 07:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Dj1b435OwL0C7Sqq7OdQpwXWVHQq3vgVpWO0wPZ5Dgo=;
 b=qiOeeCUDCA7u3TMTY13HPIUdlF6/asjAyl37ohmx/PGIOUfxluxExjOmgLe1NfbmpB
 UIBm3WO1Cy1R667E4Ba+sF08y5FgG6b4Bz+ZK+SCqO6eAmRRYBscVNpzB+qzDZUU1TC2
 1QPiyG4sRvjQbFdo/LQsFxxjdlnaaeGD0+54mMJX/kM76HJfH1c0UxW3g+OJRPD8mze+
 oeOjYpoHJv/a/hWpWtMgPkcukqQScgx+AUxT4G2c5W14Hni2npeaFd7Ua+hRjdohmdiA
 7+LRTDtZVgwWqAANl7YRcG4DSEZOBLjSYIkWjk67H+q+bmMImhvXEcEjCMg1Uiw1KkZ4
 RYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Dj1b435OwL0C7Sqq7OdQpwXWVHQq3vgVpWO0wPZ5Dgo=;
 b=L1A0QnI2ROs5iWQyLF7r4YLQ7OuZD3b6dXimJ57J2kAGaUVthc/bzbjuur57/k4ujV
 mYhtzU/PrhNYO3+NLFw0xbcPBeIbUkWP6tP5RO/9HuMs0t49jScxNonpt6XvWxbs4X+W
 02bCiT0W9lV8B6kmOjpYoqKlp8Yk8NlRomfDiRfK9mtgGqtnuvi2i7LU0meZS+edzWJZ
 6imlG8MQqO5d2dD8cfeSXywPwFFt9+6m2qqyDlQNhrZHOt4JkkMfY6aPeMywmlhaI5dW
 xdjABHQ3CFIepb9Xfe0H1XRvnuWVQ9qB/0XRq60aVNxts/93Vec/bVVMJdGVGpx1b5bC
 Kh9w==
X-Gm-Message-State: AOAM5329jsyE6pzuDyuI/QMcTwRmcNVt5IKv/HCaOPLQPeOZb8XXqXCB
 021HU4OTlpBRXgeu/Of44zzCunn6uhOjAfE1h/Y=
X-Google-Smtp-Source: ABdhPJwUO4kSw5whs+wB8MEk/HKoof0iWuMd4hKI17G1cVPP9pN1buIaDS2tD2VWbcF4ZrgnHpirBXzjw2RyQdgi06M=
X-Received: by 2002:a05:6830:408f:: with SMTP id
 x15mr7758055ott.132.1615477547483; 
 Thu, 11 Mar 2021 07:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20210209124439.408140-1-bigeasy@linutronix.de>
 <41d0f7db-c2b4-f618-42a7-da9f7cdb76b4@amd.com>
In-Reply-To: <41d0f7db-c2b4-f618-42a7-da9f7cdb76b4@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 11 Mar 2021 10:45:36 -0500
Message-ID: <CADnq5_Mzu4jePK50yzNH-vnH9tB-FUJuM_UcE2850hWM+p8yAw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/amdgpu: Remove in_interrupt() usage.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFR1ZSwgRmViIDksIDIwMjEgYXQgNzo1MCBBTSBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gZm9y
IHRoZSBzZXJpZXMuCj4KPiBBbSAwOS4wMi4yMSB1bSAxMzo0NCBzY2hyaWViIFNlYmFzdGlhbiBB
bmRyemVqIFNpZXdpb3I6Cj4gPiBGb2xrcywKPiA+Cj4gPiBpbiB0aGUgZGlzY3Vzc2lvbiBhYm91
dCBwcmVlbXB0IGNvdW50IGNvbnNpc3RlbmN5IGFjcm9zcyBrZXJuZWwKPiA+IGNvbmZpZ3VyYXRp
b25zOgo+ID4KPiA+ICAgaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29r
LmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJGciUyRjIwMjAwOTE0MjA0
MjA5LjI1NjI2NjA5MyU0MGxpbnV0cm9uaXguZGUlMkYmYW1wO2RhdGE9MDQlN0MwMSU3Q2Nocmlz
dGlhbi5rb2VuaWclNDBhbWQuY29tJTdDNjZjZmI0NDlmMGJhNDc1ZGQ3NmIwOGQ4Y2NmODdhODUl
N0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDg0NzE0ODc2
ODYyMjgzJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlq
b2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRh
PWcwNHNRb3F2Zmt1SHpwbGlnJTJGJTJCT3J1cXpteXlwSWhhcXJrS1UweGVJSjgwJTNEJmFtcDty
ZXNlcnZlZD0wCj4gPgo+ID4gaXQgd2FzIGNvbmNsdWRlZCB0aGF0IHRoZSB1c2FnZSBvZiBpbl9p
bnRlcnJ1cHQoKSBhbmQgcmVsYXRlZCBjb250ZXh0Cj4gPiBjaGVja3Mgc2hvdWxkIGJlIHJlbW92
ZWQgZnJvbSBub24tY29yZSBjb2RlLgo+ID4KPiA+IEluIHRoZSBsb25nIHJ1biwgdXNhZ2Ugb2Yg
J3ByZWVtcHRpYmxlLCBpbl8qaXJxIGV0Yy4nIHNob3VsZCBiZSBiYW5uZWQgZnJvbQo+ID4gZHJp
dmVyIGNvZGUgY29tcGxldGVseS4KPiA+Cj4gPiBUaGlzIHNlcmllcyBhZGRyZXNzZXMgcGFydHMg
b2YgdGhlIGFtZGdwdSBkcml2ZXIuICBUaGVyZSBhcmUgc3RpbGwgY2FsbCBzaXRlcwo+ID4gbGVm
dCBpbiBpbiB0aGUgYW1kZ3B1IGRyaXZlci4KPiA+Cj4gPiB2MeKApnYyOgo+ID4gICAgIC0gTGlt
aXQgdG8gYWRtZ3B1IG9ubHkKPiA+ICAgICAtIHVzZSAiYm9vbCIgaW5zdGVhZCBvZiAiYm9vbCA9
PSB0cnVlIgo+ID4KPiA+IFNlYmFzdGlhbgo+ID4KPiA+Cj4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
