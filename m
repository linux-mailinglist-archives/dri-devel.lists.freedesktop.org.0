Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13C3AB2ED
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E325B6E191;
	Fri,  6 Sep 2019 07:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80BA6E071
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:18:15 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id m9so1524453pls.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 09:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8QjjqDFW2as8gsE3MNwHPLPN76USmssxyGkKOBC9D3E=;
 b=sqbPBMfiIcm9jZk+JTga/MHcTZiYM9XMYrVbLmbQrCQCTtNe2fiFlt1HieVbDH5d3F
 7kqPQxdt4BdBuKFOxqqIiTeG8vanPoXoKY9iFDCFcry4s4Re/hkEGuIz7swZlij8dEau
 m8JuPDokaserLg3Odt4SUD1cfwKQUtycmHBUXHc+HiG8dLQq6z4F4PwYza+cxfs/w4jg
 uBeCRdyndT3miuWMhC+mIN+gCj1qCiiu4O5Alz26nVH9OQ23NFboOn2hXZytYQpCn3BJ
 IahyAGzicqmRtfd1eUAxwFIk0sVyiJfILCpZphL1PuO2F4VMmYY3GJqPU/+LBME50VcT
 ZWcA==
X-Gm-Message-State: APjAAAUvsEk2hfaWXwBUwcxFJpsrIlZtvnSf7Ilk9aIIFb409oKst9RL
 yJJj5f2y3HOnGGN6lAf5Z5ubfA==
X-Google-Smtp-Source: APXvYqyin58dfoGmkrcR+0oj6G4rVylfKjqkSHZX5WE/1JHerRC2GQAUjkfl3U9yKFWbfii5zbbXyA==
X-Received: by 2002:a17:902:8a87:: with SMTP id
 p7mr4384259plo.240.1567700295503; 
 Thu, 05 Sep 2019 09:18:15 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:14 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 12/18] mailbox: reset txdone_method TXDONE_BY_POLL
 if client knows_txdone
Date: Thu,  5 Sep 2019 10:17:53 -0600
Message-Id: <20190905161759.28036-13-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8QjjqDFW2as8gsE3MNwHPLPN76USmssxyGkKOBC9D3E=;
 b=HL27V+NYul1f+O0bmc6YkYSMF5euNDbYJl3hh04CdtFtjxmvNCYdhhn4rVKZ4mtbnC
 haoz4ZuRykOa1EVcbKBLOnulQom5g/1qMM4K3pUJqI9gyl8+8M7gUP3hdV27jiyNhaLP
 o/VZfks/pnLsAsEemsNEwt2UAy9aH5QMHPRsXyteaLVX8yuXtIU8Q7J3Kt0GHRGIjeu+
 6uqwAVSO0rrjztAQNUcFDtt/AS9X6aQBAlsAr+yR2VeRxvHvm5f4PTxaab1YLr0ySVHa
 WGR7mnvK9yLWmfNAcVoLZFMGqTS8ZaLoVAcycwWbcXSXF16pUzOt3ohlbzYqLRrORRPt
 DjoQ==
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU3VkZWVwIEhvbGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4KCmNvbW1pdCAzM2NkNzEy
M2FjMGJhNTM2MDY1NmFlMjdkYjQ1M2RlNWI5YWE3MTFmIHVwc3RyZWFtCgpDdXJyZW50bHkgdGhl
IG1haWxib3ggZnJhbWV3b3JrIHNldHMgdHhkb25lX21ldGhvZCB0byBUWERPTkVfQllfUE9MTCBp
Zgp0aGUgY29udHJvbGxlciBzZXRzIHR4ZG9uZV9ieV9wb2xsLiBIb3dldmVyIHNvbWUgY2xpZW50
cyBjYW4gaGF2ZSBhCm1lY2hhbmlzbSB0byBkbyBUWERPTkVfQllfQUNLIHdoaWNoIHRoZXkgY2Fu
IHNwZWNpZnkgYnkga25vd3NfdHhkb25lLgpIb3dldmVyLCB3ZSBlbmR1cCBzZXR0aW5nIGJvdGgg
VFhET05FX0JZX1BPTEwgYW5kIFRYRE9ORV9CWV9BQ0sgaW4gdGhhdApjYXNlLiBJbiBzdWNoIHNj
ZW5hcmlvLCB3ZSBtYXkgZW5kIHVwIHdpdGggYmVsb3cgd2FybmluZ3MgYXMgdGhlIHR4CnRpY2tl
ciBpcyBydW4gYm90aCBieSBtYWlsYm94IGZyYW1ld29yayBhbmQgdGhlIGNsaWVudC4KCldBUk5J
Tkc6IENQVTogMSBQSUQ6IDAgYXQga2VybmVsL3RpbWUvaHJ0aW1lci5jOjgwNSBocnRpbWVyX2Zv
cndhcmQrMHg4OC8weGQ4CkNQVTogMSBQSUQ6IDAgQ29tbTogc3dhcHBlci8xIE5vdCB0YWludGVk
IDQuMTIuMC1yYzUgIzI0MgpIYXJkd2FyZSBuYW1lOiBBUk0gTFREIEFSTSBKdW5vIERldmVsb3Bt
ZW50IFBsYXRmb3JtCnRhc2s6IGZmZmY4MDA5NzY4Y2E3MDAgdGFzay5zdGFjazogZmZmZjgwMDk3
NjhmODAwMApQQyBpcyBhdCBocnRpbWVyX2ZvcndhcmQrMHg4OC8weGQ4CkxSIGlzIGF0IHR4ZG9u
ZV9ocnRpbWVyKzB4ZDQvMHhmOApDYWxsIHRyYWNlOgogaHJ0aW1lcl9mb3J3YXJkKzB4ODgvMHhk
OAogX19ocnRpbWVyX3J1bl9xdWV1ZXMrMHhlNC8weDE1OAogaHJ0aW1lcl9pbnRlcnJ1cHQrMHhh
NC8weDIyMAogYXJjaF90aW1lcl9oYW5kbGVyX3BoeXMrMHgzMC8weDQwCiBoYW5kbGVfcGVyY3B1
X2RldmlkX2lycSsweDc4LzB4MTMwCiBnZW5lcmljX2hhbmRsZV9pcnErMHgyNC8weDM4CiBfX2hh
bmRsZV9kb21haW5faXJxKzB4NWMvMHhiOAogZ2ljX2hhbmRsZV9pcnErMHg1NC8weGE4CgpUaGlz
IHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSBieSByZXNldHRpbmcgVFhET05FX0JZX1BPTEwgaWYgY2xp
ZW50IGhhcyBzZXQKa25vd3NfdHhkb25lLgoKQ2M6IEFsZXhleSBLbGltb3YgPGFsZXhleS5rbGlt
b3ZAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogU3VkZWVwIEhvbGxhIDxzdWRlZXAuaG9sbGFAYXJt
LmNvbT4KU2lnbmVkLW9mZi1ieTogSmFzc2kgQnJhciA8amFzd2luZGVyLnNpbmdoQGxpbmFyby5v
cmc+ClNpZ25lZC1vZmYtYnk6IE1hdGhpZXUgUG9pcmllciA8bWF0aGlldS5wb2lyaWVyQGxpbmFy
by5vcmc+Ci0tLQogZHJpdmVycy9tYWlsYm94L21haWxib3guYyB8IDQgKystLQogZHJpdmVycy9t
YWlsYm94L3BjYy5jICAgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tYWlsYm94L21haWxib3gu
YyBiL2RyaXZlcnMvbWFpbGJveC9tYWlsYm94LmMKaW5kZXggNDRiNDlhMjY3NmYwLi4wNTVjOTBi
ODI1M2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWFpbGJveC9tYWlsYm94LmMKKysrIGIvZHJpdmVy
cy9tYWlsYm94L21haWxib3guYwpAQCAtMzUxLDcgKzM1MSw3IEBAIHN0cnVjdCBtYm94X2NoYW4g
Km1ib3hfcmVxdWVzdF9jaGFubmVsKHN0cnVjdCBtYm94X2NsaWVudCAqY2wsIGludCBpbmRleCkK
IAlpbml0X2NvbXBsZXRpb24oJmNoYW4tPnR4X2NvbXBsZXRlKTsKIAogCWlmIChjaGFuLT50eGRv
bmVfbWV0aG9kCT09IFRYRE9ORV9CWV9QT0xMICYmIGNsLT5rbm93c190eGRvbmUpCi0JCWNoYW4t
PnR4ZG9uZV9tZXRob2QgfD0gVFhET05FX0JZX0FDSzsKKwkJY2hhbi0+dHhkb25lX21ldGhvZCA9
IFRYRE9ORV9CWV9BQ0s7CiAKIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZjaGFuLT5sb2NrLCBm
bGFncyk7CiAKQEAgLTQyMCw3ICs0MjAsNyBAQCB2b2lkIG1ib3hfZnJlZV9jaGFubmVsKHN0cnVj
dCBtYm94X2NoYW4gKmNoYW4pCiAJc3Bpbl9sb2NrX2lycXNhdmUoJmNoYW4tPmxvY2ssIGZsYWdz
KTsKIAljaGFuLT5jbCA9IE5VTEw7CiAJY2hhbi0+YWN0aXZlX3JlcSA9IE5VTEw7Ci0JaWYgKGNo
YW4tPnR4ZG9uZV9tZXRob2QgPT0gKFRYRE9ORV9CWV9QT0xMIHwgVFhET05FX0JZX0FDSykpCisJ
aWYgKGNoYW4tPnR4ZG9uZV9tZXRob2QgPT0gVFhET05FX0JZX0FDSykKIAkJY2hhbi0+dHhkb25l
X21ldGhvZCA9IFRYRE9ORV9CWV9QT0xMOwogCiAJbW9kdWxlX3B1dChjaGFuLT5tYm94LT5kZXYt
PmRyaXZlci0+b3duZXIpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tYWlsYm94L3BjYy5jIGIvZHJp
dmVycy9tYWlsYm94L3BjYy5jCmluZGV4IDliNzAwNWUxMzQ1ZS4uMjdjMjI5NGJlNTFhIDEwMDY0
NAotLS0gYS9kcml2ZXJzL21haWxib3gvcGNjLmMKKysrIGIvZHJpdmVycy9tYWlsYm94L3BjYy5j
CkBAIC0yNjYsNyArMjY2LDcgQEAgc3RydWN0IG1ib3hfY2hhbiAqcGNjX21ib3hfcmVxdWVzdF9j
aGFubmVsKHN0cnVjdCBtYm94X2NsaWVudCAqY2wsCiAJaW5pdF9jb21wbGV0aW9uKCZjaGFuLT50
eF9jb21wbGV0ZSk7CiAKIAlpZiAoY2hhbi0+dHhkb25lX21ldGhvZCA9PSBUWERPTkVfQllfUE9M
TCAmJiBjbC0+a25vd3NfdHhkb25lKQotCQljaGFuLT50eGRvbmVfbWV0aG9kIHw9IFRYRE9ORV9C
WV9BQ0s7CisJCWNoYW4tPnR4ZG9uZV9tZXRob2QgPSBUWERPTkVfQllfQUNLOwogCiAJc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmY2hhbi0+bG9jaywgZmxhZ3MpOwogCkBAIC0zMTIsNyArMzEyLDcg
QEAgdm9pZCBwY2NfbWJveF9mcmVlX2NoYW5uZWwoc3RydWN0IG1ib3hfY2hhbiAqY2hhbikKIAlz
cGluX2xvY2tfaXJxc2F2ZSgmY2hhbi0+bG9jaywgZmxhZ3MpOwogCWNoYW4tPmNsID0gTlVMTDsK
IAljaGFuLT5hY3RpdmVfcmVxID0gTlVMTDsKLQlpZiAoY2hhbi0+dHhkb25lX21ldGhvZCA9PSAo
VFhET05FX0JZX1BPTEwgfCBUWERPTkVfQllfQUNLKSkKKwlpZiAoY2hhbi0+dHhkb25lX21ldGhv
ZCA9PSBUWERPTkVfQllfQUNLKQogCQljaGFuLT50eGRvbmVfbWV0aG9kID0gVFhET05FX0JZX1BP
TEw7CiAKIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZjaGFuLT5sb2NrLCBmbGFncyk7Ci0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
