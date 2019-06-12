Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC66433A0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7F589503;
	Thu, 13 Jun 2019 07:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7225989242
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 21:48:27 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id v80so14869054qkb.19
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 14:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=Nvc8GP9MwpE1zr8t87gJ0fcpzOb0fXOQ5uqc0xW6/0Q=;
 b=tkqC2cjn7Ym2Yh3WcPTPWZwdFOTFnaA9302amuJVtDL3WJC8eaC95U4LMtvOvFMQPG
 rb5wkhdJeQFShj9pbaWpbspX3I2knXhoNK/aaLkyOiCZ39EW5CapVat0i2NACbH17fWd
 zgHUzfjAwld7XA/oY4QAT5DTyD3+auurNjssYxH9/Av0+7TZ7hU77TkQxU3gp1cOy8HS
 Q7vyhPre9hSI0Y1nJf3zF77he1hxNJsqKKGtyURrAkFo3VsKodayiAm/8y9w6hJOq6Ur
 tfgpk3DUAmEsWWaO5MeyEb2Rp0dZcWkGNlGGUVAjvnAjugEm7Yvko4qC6dFPQISc3wxY
 UADw==
X-Gm-Message-State: APjAAAXtw2ljDzWqB76BeBd4qYDSUKZudJ2CaMlSyNOUVqHnyBlm0KEu
 ZqkTZD6ic/h3kWdLyZYjerb6iu00Jw==
X-Google-Smtp-Source: APXvYqzJMmozSfx8Q7fCQKl2L3GsUVSJaTVVNbazAW0PNFqqQSITm9ChmjEnGQZnnfUdU/X3pecvZB1HbQ==
X-Received: by 2002:ac8:1087:: with SMTP id a7mr58423448qtj.141.1560376106489; 
 Wed, 12 Jun 2019 14:48:26 -0700 (PDT)
Date: Wed, 12 Jun 2019 14:48:20 -0700
Message-Id: <20190612214823.251491-1-fengc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v4 0/3] Improve the dma-buf tracking
From: Chenbo Feng <fengc@google.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=Nvc8GP9MwpE1zr8t87gJ0fcpzOb0fXOQ5uqc0xW6/0Q=;
 b=CFM+cxWoFmc9yDaNAE7a83xL7QFc9YTm1d3r0nGLutm/L7bwWMBMO/aYW9Ra3qxdIg
 DMoSKbZYPeOkVh4OZ3+668Tk2w5UmyTTlkms1/5jmALJ7X+IObkO8Y5KjoEewfwX9Y6l
 VBpfeqgLaz9T5oEt0oI6y/GAYj3vNyxCEFokMn3QdfbjONa3EkMiAuIKq6cpUYxvKHy4
 ox3tNpown9wxbafp0LInWBMQ9cPPxXkDLJ+RRWZMV+7123cYpGR8fexyAbfcJArrXKwv
 7datDbOhW8PT5e76rXmxX+ezn2jyGWHURYaH2J2CuDXNhDAuMUtaAlR/LJVIqj81itfg
 qScg==
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
Cc: kernel-team@android.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5LCBhbGwgZG1hLWJ1ZnMgc2hhcmUgdGhlIHNhbWUgYW5vbnltb3VzIGlub2RlLiBX
aGlsZSB3ZSBjYW4gY291bnQKaG93IG1hbnkgZG1hLWJ1ZiBmZHMgb3IgbWFwcGluZ3MgYSBwcm9j
ZXNzIGhhcywgd2UgY2FuJ3QgZ2V0IHRoZSBzaXplIG9mCnRoZSBiYWNraW5nIGJ1ZmZlcnMgb3Ig
dGVsbCBpZiB0d28gZW50cmllcyBwb2ludCB0byB0aGUgc2FtZSBkbWEtYnVmLiBBbmQKaW4gZGVi
dWdmcywgd2UgY2FuIGdldCBhIHBlci1idWZmZXIgYnJlYWtkb3duIG9mIHNpemUgYW5kIHJlZmVy
ZW5jZSBjb3VudCwKYnV0IGNhbid0IHRlbGwgd2hpY2ggcHJvY2Vzc2VzIGFyZSBhY3R1YWxseSBo
b2xkaW5nIHRoZSByZWZlcmVuY2VzIHRvIGVhY2gKYnVmZmVyLgoKVG8gcmVzb2x2ZSB0aGUgaXNz
dWUgYWJvdmUgYW5kIHByb3ZpZGUgYmV0dGVyIG1ldGhvZCBmb3IgdXNlcnNwYWNlIHRvIHRyYWNr
CnRoZSBkbWEtYnVmIHVzYWdlIGFjcm9zcyBkaWZmZXJlbnQgcHJvY2Vzc2VzLCB0aGUgZm9sbG93
aW5nIGNoYW5nZXMgYXJlCnByb3Bvc2VkIGluIGRtYS1idWYga2VybmVsIHNpZGUuIEZpcnN0IG9m
IGFsbCwgcmVwbGFjZSB0aGUgc2luZ2xldG9uIGlub2RlCmluc2lkZSB0aGUgZG1hLWJ1ZiBzdWJz
eXN0ZW0gd2l0aCBhIG1pbmktZmlsZXN5c3RlbSwgYW5kIGFzc2lnbiBlYWNoCmRtYS1idWYgYSB1
bmlxdWUgaW5vZGUgb3V0IG9mIHRoaXMgZmlsZXN5c3RlbS4gIFdpdGggdGhpcyBjaGFuZ2UsIGNh
bGxpbmcKc3RhdCgyKSBvbiBlYWNoIGVudHJ5IGdpdmVzIHRoZSBjYWxsZXIgYSB1bmlxdWUgSUQg
KHN0X2lubyksIHRoZSBidWZmZXIncwpzaXplIChzdF9zaXplKSwgYW5kIGV2ZW4gdGhlIG51bWJl
ciBvZiBwYWdlcyBhc3NpZ25lZCB0byBlYWNoIGRtYS1idWZmZXIuClNlY291bmRseSwgYWRkIHRo
ZSBpbm9kZSBpbmZvcm1hdGlvbiB0byAvc3lzL2tlcm5lbC9kZWJ1Zy9kbWFfYnVmL2J1ZmluZm8K
c28gaW4gdGhlIGNhc2Ugd2hlcmUgYSBidWZmZXIgaXMgbW1hcCgpZWQgaW50byBhIHByb2Nlc3Pi
gJlzIGFkZHJlc3Mgc3BhY2UKYnV0IGFsbCByZW1haW5pbmcgZmRzIGhhdmUgYmVlbiBjbG9zZWQs
IHdlIGNhbiBzdGlsbCBnZXQgdGhlIGRtYS1idWYKaW5mb3JtYXRpb24gYW5kIHRyeSB0byBhY2Nv
Y2lhdGUgaXQgd2l0aCB0aGUgcHJvY2VzcyBieSBzZWFyY2hpbmcgdGhlCnByb2MvcGlkL21hcHMg
YW5kIGxvb2tpbmcgZm9yIHRoZSBjb3JyZXNwb25kaW5nIGlub2RlIG51bWJlciBleHBvc2VkIGlu
CmRtYS1idWYgZGVidWcgZnMuIFRoaXJkbHksIGNyZWF0ZWQgYW4gaW9jdGwgdG8gYXNzaWduIG5h
bWVzIHRvIGRtYS1idWZzCndoaWNoIGxldHMgdXNlcnNwYWNlIGFzc2lnbiBzaG9ydCBuYW1lcyAo
ZS5nLiwgIkNBTUVSQSIpIHRvIGJ1ZmZlcnMuIFRoaXMKaW5mb3JtYXRpb24gY2FuIGJlIGV4dHJl
bWVseSBoZWxwZnVsIGZvciB0cmFja2luZyBhbmQgYWNjb3VudGluZyBzaGFyZWQKYnVmZmVycyBi
YXNlZCBvbiB0aGVpciB1c2FnZSBhbmQgb3JpZ2luYWwgcHVycG9zZS4gTGFzdCBidXQgbm90IGxl
YXN0LCBhZGQKZG1hLWJ1ZiBpbmZvcm1hdGlvbiB0byAvcHJvYy9waWQvZmRpbmZvIGJ5IGFkZGlu
ZyBhIHNob3dfZmRpbmZvKCkgaGFuZGxlcgp0byBkbWFfYnVmX2ZpbGVfb3BlcmF0aW9ucy4gVGhl
IGhhbmRsZXIgd2lsbCBwcmludCB0aGUgZmlsZV9jb3VudCBhbmQgbmFtZQpvZiBlYWNoIGJ1ZmZl
ci4KCkNoYW5nZSBpbiB2MjoKKiBBZGQgYSBjaGVjayB0byBwcmV2ZW50IGNoYW5naW5nIGRtYS1i
dWYgbmFtZSB3aGVuIGl0IGlzIGF0dGFjaGVkIHRvCiAgZGV2aWNlcy4KKiBGaXhlZCBzb21lIGNv
bXBpbGUgd2FybmluZ3MKCkNoYW5nZSBpbiB2MzoKKiBSZW1vdmVkIHRoZSBHRVRfRE1BX0JVRl9O
QU1FIGlvY3RscywgYWRkIHRoZSBkbWFfYnVmIHBvaW50ZXIgdG8gZGVudHJ5CiAgZF9mc2RhdGEg
c28gdGhlIG5hbWUgY2FuIGJlIGRpc3BsYXllZCBpbiBwcm9jL3BpZC9tYXBzIGFuZAogIHByb2Mv
cGlkL21hcF9maWxlcy4KCkNoYW5nZSBpbiB2MzoKKiBVcGRhdGVkIHRoZSBjb21taXQgbWVzc2Fn
ZSBhbmQgYWRkZWQgc29tZSBjb21tZW50cyBmb3IgdGhlCiAgRE1BX0JVRl9TRVRfTkFNRSBpb3Rj
bAoKR3JlZyBIYWNrbWFubiAoMyk6CiAgZG1hLWJ1ZjogZ2l2ZSBlYWNoIGJ1ZmZlciBhIGZ1bGwt
ZmxlZGdlZCBpbm9kZQogIGRtYS1idWY6IGFkZCBETUFfQlVGX3tHRVQsU0VUfV9OQU1FIGlvY3Rs
cwogIGRtYS1idWY6IGFkZCBzaG93X2ZkaW5mbyBoYW5kbGVyCgogZHJpdmVycy9kbWEtYnVmL2Rt
YS1idWYuYyAgICB8IDEyMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQogaW5j
bHVkZS9saW51eC9kbWEtYnVmLmggICAgICB8ICAgNSArLQogaW5jbHVkZS91YXBpL2xpbnV4L2Rt
YS1idWYuaCB8ICAgMyArCiBpbmNsdWRlL3VhcGkvbGludXgvbWFnaWMuaCAgIHwgICAxICsKIDQg
ZmlsZXMgY2hhbmdlZCwgMTI0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgotLSAKMi4y
MS4wLjEwMjAuZ2YyODIwY2YwMWEtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
