Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A382C6994
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 17:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A0D6EE5F;
	Fri, 27 Nov 2020 16:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1486EE59
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 16:42:09 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x22so5629286wmc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 08:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rOg+qp39SVj5WC86VkdFnTzL9jP06PEcpQhmqKQ3t14=;
 b=KobUOV0hD77WVAdN6sE1FCbuddcx+Y7JofzkUlxRd9nWy9jlHdO1T8SsUttmc9LdEH
 18FkNkVd0nL6VbYr5rOcMNJq8lcpuHF9LitOz/7CtQcZOgTCuvVk9HlpE337IvJ3CeQo
 TbfkBVcsC/WpwsEsC3qnjZtZkVocnIVEGrM9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rOg+qp39SVj5WC86VkdFnTzL9jP06PEcpQhmqKQ3t14=;
 b=OJXKk7hk2q83LHXSQq8W5WZMtFlcOJJuP7S+Hb9J+Lx47DMyXUQNwjfhQ5FIKIkgTG
 Frl2NVwva2q1v28+s1ISR5N4g0YnjehfKaXLpfM2ZS6bQTyobZRi8iEHwmBhXUnkVR9L
 FvX5SeGBhiiqbpX1zWQfdiwKWP5+B4k9Xk/xOvM31Bd0ni/4E64OzmXQ69ie+W/OJEwx
 Th/wOSA12j4VjzcGWW1AkfQaIy9zoq965O8znIcywijSSieuhgyPiw6VMLLDR3F3HyBC
 CFmiQ4BNNtYmt3RKee5JscroaQyPAY0zTtr9Hp+2DydRpQwdixBGjFuI3z6lafsgq+qb
 1BBQ==
X-Gm-Message-State: AOAM531YVybrU48VcD902gV66K1piZPDYnpd0Up9KFCuk1b8hSLlnH9P
 w74axje2GcHeiMoJHyjEddQNubPCL10nxA==
X-Google-Smtp-Source: ABdhPJzZvF4udC7vFRIpQiicdsquYnu262AHQt4sYjvK76p1I545qbyBbBNxGngNqssLcpNV9573Nw==
X-Received: by 2002:a1c:4944:: with SMTP id w65mr10125938wma.50.1606495328317; 
 Fri, 27 Nov 2020 08:42:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q12sm14859078wrx.86.2020.11.27.08.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 08:42:07 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 08/17] PCI: Obey iomem restrictions for procfs mmap
Date: Fri, 27 Nov 2020 17:41:22 +0100
Message-Id: <20201127164131.2244124-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
References: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-pci@vger.kernel.org, linux-mm@kvack.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyB0aHJlZSB3YXlzIHRvIGFjY2VzcyBQQ0kgQkFScyBmcm9tIHVzZXJzcGFjZTogL2Rl
di9tZW0sIHN5c2ZzCmZpbGVzLCBhbmQgdGhlIG9sZCBwcm9jIGludGVyZmFjZS4gVHdvIGNoZWNr
IGFnYWluc3QKaW9tZW1faXNfZXhjbHVzaXZlLCBwcm9jIG5ldmVyIGRpZC4gQW5kIHdpdGggQ09O
RklHX0lPX1NUUklDVF9ERVZNRU0sCnRoaXMgc3RhcnRzIHRvIG1hdHRlciwgc2luY2Ugd2UgZG9u
J3Qgd2FudCByYW5kb20gdXNlcnNwYWNlIGhhdmluZwphY2Nlc3MgdG8gUENJIEJBUnMgd2hpbGUg
YSBkcml2ZXIgaXMgbG9hZGVkIGFuZCB1c2luZyBpdC4KCkZpeCB0aGlzIGJ5IGFkZGluZyB0aGUg
c2FtZSBpb21lbV9pc19leGNsdXNpdmUoKSBjaGVjayB3ZSBhbHJlYWR5IGhhdmUKb24gdGhlIHN5
c2ZzIHNpZGUgaW4gcGNpX21tYXBfcmVzb3VyY2UoKS4KCkFja2VkLWJ5OiBCam9ybiBIZWxnYWFz
IDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgpSZWZlcmVuY2VzOiA5MGE1NDVlOTgxMjYgKCJyZXN0cmlj
dCAvZGV2L21lbSB0byBpZGxlIGlvIG1lbW9yeSByYW5nZXMiKQpTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IEphc29uIEd1bnRob3JwZSA8
amdnQHppZXBlLmNhPgpDYzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CkNjOiBE
YW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IEFuZHJldyBNb3J0b24g
PGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+CkNjOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6IEph
biBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGlu
dGVsLmNvbT4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKQ2M6
IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNA
Z29vZ2xlLmNvbT4KQ2M6IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0KdjI6IEltcHJvdmUgY29t
bWl0IG1lc3NhZ2UgKEJqb3JuKQotLS0KIGRyaXZlcnMvcGNpL3Byb2MuYyB8IDUgKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9w
cm9jLmMgYi9kcml2ZXJzL3BjaS9wcm9jLmMKaW5kZXggZDM1MTg2YjAxZDk4Li4zYTJmOTBiZWI0
Y2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL3Byb2MuYworKysgYi9kcml2ZXJzL3BjaS9wcm9j
LmMKQEAgLTI3NCw2ICsyNzQsMTEgQEAgc3RhdGljIGludCBwcm9jX2J1c19wY2lfbW1hcChzdHJ1
Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiAJCWVsc2UKIAkJCXJl
dHVybiAtRUlOVkFMOwogCX0KKworCWlmIChkZXYtPnJlc291cmNlW2ldLmZsYWdzICYgSU9SRVNP
VVJDRV9NRU0gJiYKKwkgICAgaW9tZW1faXNfZXhjbHVzaXZlKGRldi0+cmVzb3VyY2VbaV0uc3Rh
cnQpKQorCQlyZXR1cm4gLUVJTlZBTDsKKwogCXJldCA9IHBjaV9tbWFwX3BhZ2VfcmFuZ2UoZGV2
LCBpLCB2bWEsCiAJCQkJICBmcHJpdi0+bW1hcF9zdGF0ZSwgd3JpdGVfY29tYmluZSk7CiAJaWYg
KHJldCA8IDApCi0tIAoyLjI5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
