Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 337EB6F3AB
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jul 2019 16:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635E089B0C;
	Sun, 21 Jul 2019 14:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6836089B0C;
 Sun, 21 Jul 2019 14:29:34 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id s1so10110461pgr.2;
 Sun, 21 Jul 2019 07:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=yHWPM2A483B1PZNTU1st8pnTTNAs2xN+6BFUgiVJMFo=;
 b=K3q4ndBbxcP7ZKd4eOVivrShUjj1YPV9SlzHBNQT0wm+CWVIPIb5F2KtlSjWY2n0SI
 LOlFs6xaZUNECkYSddu02vpkmSvDfVTncmgzySukvNbSVlCRq4bkqP1/FWOVXrIig7dT
 bPyuWp0xNYQkYlTbeMuMySiBvAOWteoNejh0GqpAM5VoZLixaYRoY40Ft+aUQ3Om3E++
 /TgaY9TzybBWz9AN294U37PEPSJjl9Pxlhp40mj1X9hxYX1FnNr4nPgMCfsk88Djczl+
 kXExhX0HdPggsjgHUc3n9IikDaHk/XfNrtbsmu1GkUUfCoy8xfLw0P+ADnuE6C/Qhz8T
 Ny4A==
X-Gm-Message-State: APjAAAUKgbZlBCCax+V4z3BbnoGWuPn1YII50s8hIwJZqbvVkRd26yqI
 QMpTRAYi0AEfQcBAH35Rnuc=
X-Google-Smtp-Source: APXvYqzJ70me8/YjG3iag5xCr5rToFb+3rKTVc2TFFdtKiTWAwKoD3L82P9u1aIVc3eW5aPZcOgdXg==
X-Received: by 2002:a63:e20a:: with SMTP id q10mr65587674pgh.24.1563719373649; 
 Sun, 21 Jul 2019 07:29:33 -0700 (PDT)
Received: from localhost ([121.137.63.184])
 by smtp.gmail.com with ESMTPSA id t9sm3493825pgj.89.2019.07.21.07.29.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 21 Jul 2019 07:29:32 -0700 (PDT)
Date: Sun, 21 Jul 2019 23:29:30 +0900
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hugh Dickins <hughd@google.com>, David Howells <dhowells@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next] mm/i915: i915_gemfs_init() NULL dereference
Message-ID: <20190721142930.GA480@tigerII.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=yHWPM2A483B1PZNTU1st8pnTTNAs2xN+6BFUgiVJMFo=;
 b=A/dM8JvSApyy0k2jvqWLMGfriCPKzB08cruBW99KLNKiKTAghXcZHNG33tD6/5fIrL
 TJx99kczxZfm2Y3Bd9eRykoMlCkxEKTyw4S9nAsQoSEgYGy47zlWzVa/8mtROXUXYNld
 fK/1iVE2Qqbb9db8cHw/9GiBg9JHAhXlrH4DU9IsjTcepZgAr47Z1Qk4GohtQAbbwTI6
 WLjxPNKrfU9E9RNUYuhk9/j343Ur1Q36lnrtwEtj5Je17F6AXTACPBPHjT9kcrXcz4IG
 dtnxEWfOZeVlYwtj/Kbc7LAAgAvfw38MkDGFF26gBGbyPyt/BPwlUeh7TYhi+tlCx226
 ZstA==
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
Cc: linux-mm@kvack.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpNeSBsYXB0b3Agb29wc2VzIGVhcmx5IG9uIHdpdGggbm90aGluZyBvbiB0aGUgc2NyZWVu
OwphZnRlciBzb21lIGRlYnVnZ2luZyBJIG1hbmFnZWQgdG8gb2J0YWluIGEgYmFja3RyYWNlOgoK
IEJVRzoga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVzczogMDAwMDAwMDAw
MDAwMDAwMAogI1BGOiBzdXBlcnZpc29yIGluc3RydWN0aW9uIGZldGNoIGluIGtlcm5lbCBtb2Rl
CiAjUEY6IGVycm9yX2NvZGUoMHgwMDEwKSAtIG5vdC1wcmVzZW50IHBhZ2UKIFBHRCAwIFA0RCAw
IAogT29wczogMDAxMCBbIzFdIFBSRUVNUFQgU01QIFBUSQogUklQOiAwMDEwOjB4MAogQ29kZTog
QmFkIFJJUCB2YWx1ZS4KIFsuLl0KIENhbGwgVHJhY2U6CiAgaTkxNV9nZW1mc19pbml0KzB4NmUv
MHhhMCBbaTkxNV0KICBpOTE1X2dlbV9pbml0X2Vhcmx5KzB4NzYvMHg5MCBbaTkxNV0KICBpOTE1
X2RyaXZlcl9wcm9iZSsweDMwYS8weDE2NDAgW2k5MTVdCiAgPyBrZXJuZnNfYWN0aXZhdGUrMHg1
YS8weDgwCiAgPyBrZXJuZnNfYWRkX29uZSsweGRkLzB4MTMwCiAgcGNpX2RldmljZV9wcm9iZSsw
eDllLzB4MTEwCiAgcmVhbGx5X3Byb2JlKzB4Y2UvMHgyMzAKICBkcml2ZXJfcHJvYmVfZGV2aWNl
KzB4NGIvMHhjMAogIGRldmljZV9kcml2ZXJfYXR0YWNoKzB4NGUvMHg2MAogIF9fZHJpdmVyX2F0
dGFjaCsweDQ3LzB4YjAKICA/IGRldmljZV9kcml2ZXJfYXR0YWNoKzB4NjAvMHg2MAogIGJ1c19m
b3JfZWFjaF9kZXYrMHg2MS8weDkwCiAgYnVzX2FkZF9kcml2ZXIrMHgxNjcvMHgxYjAKICBkcml2
ZXJfcmVnaXN0ZXIrMHg2Ny8weGFhCiAgPyAweGZmZmZmZmZmYzA1MjIwMDAKICBkb19vbmVfaW5p
dGNhbGwrMHgzNy8weDEzZgogID8ga21lbV9jYWNoZV9hbGxvYysweDExYS8weDE1MAogIGRvX2lu
aXRfbW9kdWxlKzB4NTEvMHgyMDAKICBfX3NlX3N5c19pbml0X21vZHVsZSsweGVmLzB4MTAwCiAg
ZG9fc3lzY2FsbF82NCsweDQ5LzB4MjUwCiAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1l
KzB4NDQvMHhhOQoKUklQIGlzIGF0IDB4MDAsIHdoaWNoIGlzIG5ldmVyIGdvb2QKCkl0IHNvcnQg
b2YgYm9pbHMgZG93biB0byBjb21taXQgMTQ0ZGYzYjI4OGM0ICh2ZnM6IENvbnZlcnQgcmFtZnMs
CnNobWVtLCB0bXBmcywgZGV2dG1wZnMsIHJvb3RmcyB0byB1c2UgdGhlIG5ldyBtb3VudCBBUEkp
LCB3aGljaApyZW1vdmVkIC0+cmVtb3VudF9mcyBmcm9tIHRtcGZzJyBvcHM6Cgo9PT0KQEAgLTM3
MzYsNyArMzg0OSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VwZXJfb3BlcmF0aW9ucyBzaG1l
bV9vcHMgPSB7CiAgICAgICAgLmRlc3Ryb3lfaW5vZGUgID0gc2htZW1fZGVzdHJveV9pbm9kZSwK
ICNpZmRlZiBDT05GSUdfVE1QRlMKICAgICAgICAuc3RhdGZzICAgICAgICAgPSBzaG1lbV9zdGF0
ZnMsCi0gICAgICAgLnJlbW91bnRfZnMgICAgID0gc2htZW1fcmVtb3VudF9mcywKICAgICAgICAu
c2hvd19vcHRpb25zICAgPSBzaG1lbV9zaG93X29wdGlvbnMsCiAjZW5kaWYKICAgICAgICAuZXZp
Y3RfaW5vZGUgICAgPSBzaG1lbV9ldmljdF9pbm9kZSwKPT09CgpTbyBpOTE1IGluaXQgZXhlY3V0
ZXMgTlVMTAoKCWdldF9mc190eXBlKCJ0bXBmcyIpOwoJc2ItPnNfb3AtPnJlbW91bnRfZnMoc2Is
ICZmbGFncywgb3B0aW9ucyk7CgpGb3IgdGhlIHRpbWUgYmVpbmcgdGhlIGZvbGxvd2luZyAob2J2
aW91cyBhbmQgd3JvbmcpIHBhdGNoCmF0IGxlYXN0IGJvb3RzIC1uZXh0OgoKLS0tCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtZnMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2dlbS9pOTE1X2dlbWZzLmMKaW5kZXggMDk5ZjMzOTdhYWRhLi4xZjk1ZDllYTMx
OWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbWZzLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtZnMuYwpAQCAtMzksNiArMzksOSBA
QCBpbnQgaTkxNV9nZW1mc19pbml0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KQogCQlp
bnQgZmxhZ3MgPSAwOwogCQlpbnQgZXJyOwogCisJCWlmICghc2ItPnNfb3AtPnJlbW91bnRfZnMp
CisJCQlyZXR1cm4gLUVOT0RFVjsKKwogCQllcnIgPSBzYi0+c19vcC0+cmVtb3VudF9mcyhzYiwg
JmZsYWdzLCBvcHRpb25zKTsKIAkJaWYgKGVycikgewogCQkJa2Vybl91bm1vdW50KGdlbWZzKTsK
LS0tCgoJLXNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
