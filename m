Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD7622FB4
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 11:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD17892D7;
	Mon, 20 May 2019 09:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A50892D7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:07:12 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id gn7so2258599plb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 02:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5cW/Ykas8y/ulbRnNYCc1U7OJGD9GTeKEiiivcIo+lE=;
 b=kjS/JT4T40ul+hrUHlMC8vo/FgFpQFQpB+8JR8VWHGqE1Sk40RbxcZ0SBzt39/VkbZ
 uOhf8fOpqJ5zyKdg4+2L6IWcdigUOXVyvS/Kc1GmzlpllRQdglZzZJZRIfFefLDNpUOI
 ibgfdOV2BVADK6YDH+k92kREGIdmEcikcwyq7urcxgratBlUD6SF5rJCcYk8guQ+aeh1
 z/SzToqWR2VgNp5BwOmyN4Uh1cAqgymTbk6GnWQUzPGCM/shtLxUE1KsmRqTFlgWzdD1
 DNq8I7QASqDWCT2NDV/6y7pQK8w7mGL+uv5sWU6pbLzrFDTCECzMk4nFpPSWe+O9B2Os
 cESg==
X-Gm-Message-State: APjAAAUpgDD0eYo9WMwDfsLOLBV7cZHscN8W8s/nF6ecPJq8ziVDLc6W
 hNcl0R1+AU5Uz+g9xSP2SKhP/A==
X-Google-Smtp-Source: APXvYqz8pwdU8mC+t3ZXYb6Q+Pg04mL44SIkX5k3pYjBHVjtKxFYa0Qa7kCCe3U/5VkpdkgVqE12iA==
X-Received: by 2002:a17:902:2a07:: with SMTP id
 i7mr76936917plb.125.1558343232148; 
 Mon, 20 May 2019 02:07:12 -0700 (PDT)
Received: from localhost.localdomain ([183.82.227.193])
 by smtp.gmail.com with ESMTPSA id d15sm51671614pfm.186.2019.05.20.02.07.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 02:07:11 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v10 00/11] drm/sun4i: dsi: Fixes/updates (A33 reworked!)
Date: Mon, 20 May 2019 14:33:07 +0530
Message-Id: <20190520090318.27570-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5cW/Ykas8y/ulbRnNYCc1U7OJGD9GTeKEiiivcIo+lE=;
 b=D19AjoC0eMZThH2guQSI02LbCXWxIu9yFHbIFGyjKVoGdpanTTC1WH7LHFeWV3LN9c
 d+yGjqnD+B5OyZm2YFjaXIFqcJ595lDsnFX1pVaqXzeFzILB+N3gsgqf8ztcbrMrnWiF
 9sRtvb5LzYCHUKcbV/RZZSIPazKFf+S+J4nbg=
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
Cc: bshah@mykolab.com, powerpan@qq.com, Vasily Khoruzhick <anarsoul@gmail.com>,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW9zdCBvZiB0aGVzZSBpc3N1ZXMgYXJlIHJlcHJvZHVjZWQgd2hpbGUgc3VwcG9ydGluZyBBbGx3
aW5uZXIgQTY0Ck1JUEktRFNJIFsxXSBidXQgdG8gY29uZmlybSBpdCB3aXRoIG90aGVyIFNvQyB0
aGlzIHNlcmllcyBpcyByZXdvcmtlZApvbiBBMzMgc2luY2UgdGhlIGNvbnRyb2xsZXIgdGVzdGVk
IGl0IEEzMyBhcyBvZiBub3cuCgpTaW5jZSB3ZSBkb24ndCBoYXZlIHByb3BlciBldmlkZW5jZSBh
bmQgZG9jdW1lbnRhdGlvbiBmb3IgZHNpIGNvbnRyb2xsZXIKaW4gQWxsd2lubmVyLCB0aGVzZSBj
aGFuZ2VzIGFyZSBtb3JlIGxpa2VseSB0byByZWx5IG9uIG5ldyB3b3JraW5nIEJTUApjb2RlcyAo
ZXZlbiB0aGUgaW5pdGlhbCBkcml2ZXIgd3JpdHRlbiBhcyBwZXIgdGhpcyBydWxlKS4KCkFsbCB0
aGVzZSBmaXhlcy91cGRhdGVzIGFyZSB0ZXN0ZWQgaW4gImJhbmFuYXBpLHMwNzB3djIwLWN0MTYi
IHBhbmVsCm9uIEFsbHdpbm5lciBBMzMsIHRoZSBzYW1lIHBhbmVsIHRpbWluZ3MgYXJlIGF2YWls
YWJsZSBpbiBwYW5lbC1zaW1wbGUKaW4gbWFpbmxpbmUgdHJlZS4KCkNoYW5nZXMgZm9yIHYxMDoK
LSByZXdvcmtlZCBwcmV2aW91cyAiRml4ZXMvdXBkYXRlcyIgcGF0Y2hlcyBvbiBBMzMKLSByZXdv
cmtlZCBwcmV2aW91cyBBNjQgRFNJIGZpeGVzIG9uIEEzMwotIGFkZGVkIHByb3BlciBkZXRhaWxl
ZCBjb21taXQgbWVzc2FnZXMgd2l0aCBsb2dzCi0gdGVzdGVkIG9uIEJQSS1NMk0gYm9hcmQuCkNo
YW5nZXMgZm9yIHY5OgotIHJlYmFzZSBvbiBkcm0tbWlzYwotIHVwZGF0ZSBjb21taXQgbWVzc2Fn
ZXMKLSBhZGQgaHN5bmNfcG9yY2ggb3ZlcmZsb3cgcGF0Y2gKQ2hhbmdlcyBmb3Igdjg6Ci0gcmVi
YXNlIG9uIG1hc3RlcgotIHJld29yayBvbiBjb21taXQgbWVzc2FnZXMKLSByZXdvcmsgdmlkZW8g
c3RhcnQgZGVsYXkKLSBpbmNsdWRlIGRycSBjaGFuZ2VzIGZyb20gcHJldmlvdXMgdmVyc2lvbgpD
aGFuZ2VzIGZvciB2NzoKLSByZWJhc2Ugb24gbWFzdGVyCi0gY29sbGVjdCBNZXJsaWpuIFdhamVy
IFRlc3RlZC1ieSBjcmVkaXRzLgpDaGFuZ2VzIGZvciB2NjoKLSBmaXhlZCBhbGwgYnVyc3QgbW9k
ZSBwYXRjaGVzIGFzIHBlciBwcmV2aW91cyB2ZXJzaW9uIGNvbW1lbnRzCi0gcmViYXNlIG9uIG1h
c3RlcgotIHVwZGF0ZSBwcm9wZXIgY29tbWl0IG1lc3NhZ2UKLSBkcm9wcGVkIHVubmVlZGVkIGNv
bW1lbnRzCi0gb3JkZXIgdGhlIHBhdGNoZXMgdGhhdCBtYWtlIHJldmlldyBlYXN5CkNoYW5nZXMg
Zm9yIHY1LCB2NCwgdjMsIHYyOgotIHVzZSBleGlzdGluZyBkcml2ZXIgY29kZSBjb25zdHJ1Y3Qg
Zm9yIGhibGsgY29tcHV0YXRpb24KLSBjcmVhdGUgc2VwYXJhdGUgZnVuY3Rpb24gZm9yIHZibGsg
Y29tcHV0YXRpb24KLSBjbGVhbnVwIGNvbW1pdCBtZXNzYWdlcwotIHVwZGF0ZSBwcm9wZXIgY29t
bWl0IG1lc3NhZ2VzCi0gZml4ZWQgY2hlY2twYXRjaCB3YXJuaW5ncy9lcnJvcnMKLSB1c2UgcHJv
cGVyIHJldHVybiB2YWx1ZSBmb3IgdGNvbjAgcHJvYmUKLSBhZGQgbG9naWMgdG8gZ2V0IHRjb24w
IGRpdmlkZXIgdmFsdWVzCi0gc2ltcGxpZnkgdGltaW5ncyBjb2RlIHRvIHN1cHBvcnQgYnVyc3Qg
bW9kZQotIGZpeCBkcnEgY29tcHV0YXRpb24gcmV0dXJuIHZhbHVlcwotIHJlYmFzZSBvbiBtYXN0
ZXIKCkFueSBpbnB1dHM/CkphZ2FuLgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvNTc4MzQvCgpKYWdhbiBUZWtpICgxMSk6CiAgZHJtL3N1bjRpOiBkc2k6IEZp
eCBUQ09OIERSUSBzZXQgYml0cwogIGRybS9zdW40aTogZHNpOiBVcGRhdGUgc3RhcnQgdmFsdWUg
aW4gdmlkZW8gc3RhcnQgZGVsYXkKICBkcm0vc3VuNGk6IGRzaTogRml4IHZpZGVvIHN0YXJ0IGRl
bGF5IGNvbXB1dGF0aW9uCiAgZHJtL3N1bjRpOiB0Y29uOiBDb21wdXRlIERDTEsgZGl2aWRlcnMg
YmFzZWQgb24gZm9ybWF0LCBsYW5lcwogIGRybS9zdW40aTogdGNvbjogRXhwb3J0IGdldCB0Y29u
MCByb3V0aW5lCiAgZHJtL3N1bjRpOiBkc2k6IFByb2JlIHRjb24wIGR1cmluZyBkc2lfYmluZAog
IGRybS9zdW40aTogZHNpOiBHZXQgdGNvbjBfZGl2IGF0IHJ1bnRpbWUKICBkdC1iaW5kaW5nczog
c3VuNmktZHNpOiBBZGQgVkNDLURTSSBzdXBwbHkgcHJvcGVydHkKICBkcm0vc3VuNGk6IHN1bjZp
X21pcGlfZHNpOiBBZGQgVkNDLURTSSByZWd1bGF0b3Igc3VwcG9ydAogIFtETyBOT1QgTUVSR0Vd
IGRybS9wYW5lbDogQWRkIEJhbmFuYXBpIFMwNzBXVjIwLUNUMTYgSUNONjIxMSBNSVBJLURTSSB0
byBSR0IgYnJpZGdlCiAgW0RPIE5PVCBNRVJHRV0gQVJNOiBkdHM6IHN1bjhpOiBiYW5hbmFwaS1t
Mm06IEVuYWJsZSBCYW5hbmFwaSBTMDcwV1YyMC1DVDE2IERTSSBwYW5lbAoKIC4uLi9iaW5kaW5n
cy9kaXNwbGF5L3N1bnhpL3N1bjZpLWRzaS50eHQgICAgICB8ICAgMSArCiBhcmNoL2FybS9ib290
L2R0cy9zdW44aS1yMTYtYmFuYW5hcGktbTJtLmR0cyAgfCAgNDAgKysrCiBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgIDkgKwogZHJpdmVycy9ncHUvZHJt
L3BhbmVsL01ha2VmaWxlICAgICAgICAgICAgICAgIHwgICAxICsKIC4uLi9wYW5lbC9wYW5lbC1i
YW5hbmFwaS1zMDcwd3YyMC1pY242MjExLmMgICB8IDI5MyArKysrKysrKysrKysrKysrKysKIGRy
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMgICAgICAgICAgICB8ICAgNyArLQogZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uaCAgICAgICAgICAgIHwgICAxICsKIGRyaXZl
cnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jICAgICAgICB8ICA0NiArKy0KIGRyaXZl
cnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5oICAgICAgICB8ICAgNCArLQogOSBmaWxl
cyBjaGFuZ2VkLCAzOTMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYmFuYW5hcGktczA3MHd2MjAtaWNu
NjIxMS5jCgotLSAKMi4xOC4wLjMyMS5nZmZjNmZhMGUzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
