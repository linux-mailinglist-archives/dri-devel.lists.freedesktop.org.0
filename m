Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D940323AC
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2019 17:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2105589722;
	Sun,  2 Jun 2019 15:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FFB8999A;
 Sun,  2 Jun 2019 14:13:41 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q17so9042959pfq.8;
 Sun, 02 Jun 2019 07:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w9PH2k6rPB87/EEGusf4NGVLGYsoLDBvNH1XesU5MSE=;
 b=tF0JBnFYQCsSn4KgowioMjmXZwjE5pogMiHk3rSVPx7jF17rHLR5Sl4h/vzCZO5Rtz
 JGSEIjGDECrLXyT40ewgJf0FNLz+xdp/mXdzO0vcjXpcZCg5PNaphuE+U+GENjgaDEHv
 A3tTiadJqMd7h8Jx9aaBP9a04rhhA4LDPgjgvkv35mnOafrIU7kaaxFT7eiPwfHXF1Of
 KDrgdAqAglfzbOmygJ2VM6SOgYAO48vrh+j8T8xDdKQwUGmGaQ7T3EH+ypU4DHJYc/aw
 jLNhut3oM0IJTJevJjWaOGivh0Roi/HgQT6QzK2K0E/ZDWzGneyD7q2II3S37qJzeQeM
 /OCg==
X-Gm-Message-State: APjAAAUTcMEp/1nPJIcSk+1G/USffJAzIuOxo7EntAH5sHRwV/V7D89p
 MFVTUo4FYz+uggAEwans3XA=
X-Google-Smtp-Source: APXvYqzpaRyuh5gQli++xqEgVoQRrE1rPqttbhI9uhh1SUA8jrKDVOtdKqsjDKH3Ewbwo8eiC0WG0Q==
X-Received: by 2002:a65:530d:: with SMTP id m13mr22569795pgq.68.1559484821083; 
 Sun, 02 Jun 2019 07:13:41 -0700 (PDT)
Received: from localhost.localdomain
 (119-18-21-111.771215.syd.nbn.aussiebb.net. [119.18.21.111])
 by smtp.gmail.com with ESMTPSA id x66sm12533278pfx.139.2019.06.02.07.13.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 07:13:40 -0700 (PDT)
From: Rhys Kidd <rhyskidd@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 2/2] drm/nouveau/bios/init: handle INIT_RESET_END devinit
 opcode
Date: Mon,  3 Jun 2019 00:13:15 +1000
Message-Id: <20190602141315.6197-3-rhyskidd@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602141315.6197-1-rhyskidd@gmail.com>
References: <20190602141315.6197-1-rhyskidd@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 02 Jun 2019 15:00:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w9PH2k6rPB87/EEGusf4NGVLGYsoLDBvNH1XesU5MSE=;
 b=PaIRevF6X9EwLo4tynO/oQYZRBcG85PvvyQLyKkXdp6vLjcnIUH5UpsmZLz4KjTSBK
 hms704ygyRWoFPRI63ehIjsVCPvsOsoLL/AGv2aj3Mda4muSyDjZjdLokpCixSZp4ahG
 qlAtxyFvBrQMPKJWe18dzIzQFmAOLj+AU3DvdTYo7PkHk0cbmUPxrnna1QjVzTad/gOQ
 nrWhRxa14WLuw3btqxPJvpBCUuBlBc4O4MmyrqQ1XI4zXU21DvHZq1m0yqutKddyMBjH
 gtoHj2K6RggWYFSgNfu5ixkSbo2dtTPZLaqkqci6yyFWWYqFXhrf2EcOBYyeQxJTEwcW
 f+tw==
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
Cc: Rhys Kidd <rhyskidd@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmFsIHRoYXQgdGhlIHJlc2V0IHNlcXVlbmNlIGhhcyBjb21wbGV0ZWQuCgpUaGlzIG9wY29k
ZSBzaWduYWxzIHRoYXQgdGhlIHNvZnR3YXJlIHJlc2V0IHNlcXVlbmNlIGhhcyBjb21wbGV0ZWQu
Ck9yZGluYXJpbHksIG5vIGFjdHVhbCBvcGVyYXRpb25zIGFyZSBwZXJmb3JtZWQgYnkgdGhlIG9w
Y29kZS4KSG93ZXZlciBpdCBhbGxvd3MgZm9yIHBvc3NpYmxlIHNvZnR3YXJlIHdvcmsgYXJvdW5k
cyBieSBkZXZpbml0CmVuZ2luZXMgaW4gc29mdHdhcmUgYWdlbnRzIG90aGVyIHRoYW4gdGhlIFZC
SU9TLCBzdWNoIGFzIHRoZSByZXNtYW4sCkZDT0RFLCBhbmQgRUZJIGRyaXZlci4KClNpZ25lZC1v
ZmYtYnk6IFJoeXMgS2lkZCA8cmh5c2tpZGRAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252a20vc3ViZGV2L2Jpb3MvaW5pdC5jIHwgMTMgKysrKysrKysrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9iaW9zL2luaXQuYyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jpb3MvaW5pdC5jCmluZGV4IGE1NGI1ZTQx
MGRjZC4uNDlkMDk1MDNjZDMxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL3N1YmRldi9iaW9zL2luaXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmtt
L3N1YmRldi9iaW9zL2luaXQuYwpAQCAtMTk0NSw2ICsxOTQ1LDE3IEBAIGluaXRfcmVzZXRfYmVn
dW4oc3RydWN0IG52Ymlvc19pbml0ICppbml0KQogCWluaXQtPm9mZnNldCArPSAxOwogfQogCisv
KioKKyAqIElOSVRfUkVTRVRfRU5EIC0gb3Bjb2RlIDB4OGQKKyAqCisgKi8KK3N0YXRpYyB2b2lk
Citpbml0X3Jlc2V0X2VuZChzdHJ1Y3QgbnZiaW9zX2luaXQgKmluaXQpCit7CisJdHJhY2UoIlJF
U0VUX0VORFxuIik7CisJaW5pdC0+b2Zmc2V0ICs9IDE7Cit9CisKIC8qKgogICogSU5JVF9HUElP
IC0gb3Bjb2RlIDB4OGUKICAqCkBAIC0yMjcyLDcgKzIyODMsNyBAQCBzdGF0aWMgc3RydWN0IG52
Ymlvc19pbml0X29wY29kZSB7CiAJWzB4N2FdID0geyBpbml0X3ptX3JlZyB9LAogCVsweDg3XSA9
IHsgaW5pdF9yYW1fcmVzdHJpY3RfcGxsIH0sCiAJWzB4OGNdID0geyBpbml0X3Jlc2V0X2JlZ3Vu
IH0sCi0JWzB4OGRdID0geyBpbml0X3Jlc2VydmVkIH0sCisJWzB4OGRdID0geyBpbml0X3Jlc2V0
X2VuZCB9LAogCVsweDhlXSA9IHsgaW5pdF9ncGlvIH0sCiAJWzB4OGZdID0geyBpbml0X3JhbV9y
ZXN0cmljdF96bV9yZWdfZ3JvdXAgfSwKIAlbMHg5MF0gPSB7IGluaXRfY29weV96bV9yZWcgfSwK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
