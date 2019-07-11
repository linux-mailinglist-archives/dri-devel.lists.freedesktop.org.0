Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DBB660CF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 22:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718156E288;
	Thu, 11 Jul 2019 20:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589D76E272
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 20:45:04 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id u17so3492593pgi.6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 13:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MLdzftGH/gFul7iiOHMklLGxy/NCS/NGh67QDWN64SU=;
 b=DQzD/oovczYWEk2euQdvyMOLPS6wv98EQ3pKsuJyISL+Xok87kOiYzATfVB5xtuynP
 aFb1C0ma20UANA6yVutqf7xgH1tWCDoCbc0boPMw1IdRYGLRvCzUSAjkolzImkEZLdjG
 UD+RRag1NLT70Atu4Emd4PaPMMk86E/z4CANqN5jQ6I4avXNqxgZfh2e0jHtlwDG9i/h
 1AdqwB5fGsplwv7xPCPtsJJuiKNaUK3DAbV3CW3JCnf75oU637orFjip0VoQ4mV/kCIu
 WNbsZD80KjdxbhKXOpN4rDGXGj7ESVxEkAb2Q4P7AOEcRG/mJl0vgacXbYnQsWTXVeIW
 jXfQ==
X-Gm-Message-State: APjAAAVYbrBLUrSLoQzzUbeiRbMxckqfqeJrrwLvGY7i3cxqbUurolxe
 lMvTBdzm1yJJQK/nTlVPjNmN8g==
X-Google-Smtp-Source: APXvYqwroM5R2J8TNfLYHSWaQlIk+XkN1UktVue3p11E50fR61dSB3pcJ91/MyRyFDfLxvoJmMQjww==
X-Received: by 2002:a63:c20e:: with SMTP id b14mr6295215pgd.96.1562877903778; 
 Thu, 11 Jul 2019 13:45:03 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id f17sm5320110pgv.16.2019.07.11.13.45.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 13:45:03 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v6 3/3] drm/panel: simple: Use display_timing for AUO b101ean01
Date: Thu, 11 Jul 2019 13:34:55 -0700
Message-Id: <20190711203455.125667-4-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190711203455.125667-1-dianders@chromium.org>
References: <20190711203455.125667-1-dianders@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MLdzftGH/gFul7iiOHMklLGxy/NCS/NGh67QDWN64SU=;
 b=MhB4/1cUL+NhY0J5GWsbsrd3eTLDSU+tbUVIlifszTmidPxecNapqdD0z5bq8OPmcV
 BD68gn+Iz22nEW6WBNmOGATWc/CmyRFYE6uwNsJd4YRbbIoj+oXWV9pGjQI8zCvdS4eS
 GRdqJ9Y1/ZJi4k0YQnQV7MG0weCWBo9tc0g6A=
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
Cc: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, mka@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29udmVydCB0aGUgQVVPIGIxMDFlYW4wMSBmcm9tIHVzaW5nIGEgZml4ZWQgbW9kZSB0byBzcGVj
aWZ5aW5nIGEKZGlzcGxheSB0aW1pbmcgd2l0aCBtaW4vdHlwL21heCB2YWx1ZXMuCgpUaGUgQVVP
IGIxMDFlYW4wMSdzIGRhdGFzaGVldCBzYXlzOgoqIFZlcnRpY2FsIGJsYW5raW5nIG1pbiBpcyAx
MgoqIEhvcml6b250YWwgYmxhbmtpbmcgbWluIGlzIDYwCiogUGl4ZWwgY2xvY2sgaXMgYmV0d2Vl
biA2NS4zIE1IeiBhbmQgNzUgTUh6CgpUaGUgZ29hbCBoZXJlIGlzIHRvIGJlIGFibGUgdG8gc3Bl
Y2lmeSB0aGUgcHJvcGVyIHRpbWluZyBpbiBkZXZpY2UKdHJlZSB0byB1c2Ugb24gcmszMjg4LXZl
eXJvbi1taW5uaWUgdG8gbWF0Y2ggd2hhdCB0aGUgZG93bnN0cmVhbQprZXJuZWwgaXMgdXNpbmcg
c28gdGhhdCBpdCBjYW4gdXNlZCB0aGUgZml4ZWQgUExMLgoKQ2hhbmdlcyBpbiB2NDoKIC0gZGlz
cGxheV90aW1pbmcgZm9yIEFVTyBiMTAxZWFuMDEgbmV3IGZvciB2NC4KQ2hhbmdlcyBpbiB2NjoK
IC0gUmViYXNlZCB0byBkcm0tbWlzYyBuZXh0CiAtIEFkZGVkIHRhZ3MKClNpZ25lZC1vZmYtYnk6
IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KQWNrZWQtYnk6IFRoaWVy
cnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Ci0tLQoKIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDI1ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKaW5kZXggNjAyODA5ZjZkYTZhLi4yMjZmMDY4ZmI2Nzkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKQEAgLTU5NSwyMiArNTk1LDIxIEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBhdW9fYjEwMWF3MDMgPSB7CiAJfSwKIH07
CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBhdW9fYjEwMWVhbjAxX21v
ZGUgPSB7Ci0JLmNsb2NrID0gNzI1MDAsCi0JLmhkaXNwbGF5ID0gMTI4MCwKLQkuaHN5bmNfc3Rh
cnQgPSAxMjgwICsgMTE5LAotCS5oc3luY19lbmQgPSAxMjgwICsgMTE5ICsgMzIsCi0JLmh0b3Rh
bCA9IDEyODAgKyAxMTkgKyAzMiArIDIxLAotCS52ZGlzcGxheSA9IDgwMCwKLQkudnN5bmNfc3Rh
cnQgPSA4MDAgKyA0LAotCS52c3luY19lbmQgPSA4MDAgKyA0ICsgMjAsCi0JLnZ0b3RhbCA9IDgw
MCArIDQgKyAyMCArIDgsCi0JLnZyZWZyZXNoID0gNjAsCitzdGF0aWMgY29uc3Qgc3RydWN0IGRp
c3BsYXlfdGltaW5nIGF1b19iMTAxZWFuMDFfdGltaW5nID0geworCS5waXhlbGNsb2NrID0geyA2
NTMwMDAwMCwgNzI1MDAwMDAsIDc1MDAwMDAwIH0sCisJLmhhY3RpdmUgPSB7IDEyODAsIDEyODAs
IDEyODAgfSwKKwkuaGZyb250X3BvcmNoID0geyAxOCwgMTE5LCAxMTkgfSwKKwkuaGJhY2tfcG9y
Y2ggPSB7IDIxLCAyMSwgMjEgfSwKKwkuaHN5bmNfbGVuID0geyAzMiwgMzIsIDMyIH0sCisJLnZh
Y3RpdmUgPSB7IDgwMCwgODAwLCA4MDAgfSwKKwkudmZyb250X3BvcmNoID0geyA0LCA0LCA0IH0s
CisJLnZiYWNrX3BvcmNoID0geyA4LCA4LCA4IH0sCisJLnZzeW5jX2xlbiA9IHsgMTgsIDIwLCAy
MCB9LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGF1b19iMTAxZWFuMDEg
PSB7Ci0JLm1vZGVzID0gJmF1b19iMTAxZWFuMDFfbW9kZSwKLQkubnVtX21vZGVzID0gMSwKKwku
dGltaW5ncyA9ICZhdW9fYjEwMWVhbjAxX3RpbWluZywKKwkubnVtX3RpbWluZ3MgPSAxLAogCS5i
cGMgPSA2LAogCS5zaXplID0gewogCQkud2lkdGggPSAyMTcsCi0tIAoyLjIyLjAuNDEwLmdkOGZk
YmUyMWI1LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
