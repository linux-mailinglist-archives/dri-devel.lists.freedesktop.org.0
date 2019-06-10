Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B33C095
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 02:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1571F89170;
	Tue, 11 Jun 2019 00:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x34a.google.com (mail-ot1-x34a.google.com
 [IPv6:2607:f8b0:4864:20::34a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B551890EB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 23:52:04 +0000 (UTC)
Received: by mail-ot1-x34a.google.com with SMTP id v1so5581068otj.23
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 16:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=M35jpHh+HUdAc93UKOjDO7JbyHiHSckhQH2gYDGobXY=;
 b=IJrBkjG6o0iC8UHBNBnFRL9ovQtBt9jfWZuIAYf7wuTMzOQdmV40HSgaJ0G+C14jSW
 6WpV55mIj7PTFaHWZC+Qp5cA1IM7mNEpc4hu5iE29Qk7He2KQz4VxmpF+gF7REpcYhX+
 N+yN7shLCSlv95h2IfcMoQgTK+J8zF5Ww8aw2+bIwVjMMKL7kuVDvXiVHOzToOJeLY4t
 ZX8XhZBENoQQxoQsrDl/QZDZPD29PKxJuBJ7DVXnyyxt2arXAh7XnjCSnB6tkrCP4Nbr
 MHeia4zxUNH3gkDrqAHhAUpl1CJNyZSj9bw2cPAZiz4mWAw8j9aqXUpEm8bXQ/s9wsLH
 DzYA==
X-Gm-Message-State: APjAAAXiDIsD0SYzfQKLsuluI+lDpYMmRHh1EEcG1jE4mP68pLkrcgbG
 CR+FJ6Juum6JamJgw8JO4LnyS6nGEg==
X-Google-Smtp-Source: APXvYqz5HVmvYAuUjwPj5rFsB8gNIYhrw9pY5CGqSimzEyfTZABC92Z+V648M/PgUJEFOqt/y8mKBWL+1g==
X-Received: by 2002:aca:f4ce:: with SMTP id s197mr14299094oih.45.1560210723679; 
 Mon, 10 Jun 2019 16:52:03 -0700 (PDT)
Date: Mon, 10 Jun 2019 16:51:58 -0700
Message-Id: <20190610235201.145457-1-fengc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [RESEND PATCH v3 0/3] Improve the dma-buf tracking
From: Chenbo Feng <fengc@google.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 --validate@google.com
X-Mailman-Approved-At: Tue, 11 Jun 2019 00:29:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=M35jpHh+HUdAc93UKOjDO7JbyHiHSckhQH2gYDGobXY=;
 b=V/8aJ9BoljeksjjbvJVkvok+M4cu/Zi4V0ZnLJks3J17Tx2XIcaTwiX2OC2jFldJme
 KtkOvG/qkTOvKgG2G4oUhsML/44UixS0oT25mPxx6sNem5IhlTl9fXvMHG3FeDtzuh6+
 i5DJbsd1R1JO0xdAtlSwPayiik4d7p211BflfA2sTdbuizialJPgbaXXaCVmmQyVcQvx
 /zkGhwsZYFcDGZJQ05AMGyhdh6EZEVMIoq+/8ujnk8LODnw1l8q9MC2zgSZ1/H9AuOfC
 vwCVF8fqu/yTnwv7wJAWEtxrUpxU5ldhDJZq7B95WXQK+9nRo53DeEdaPqFbZKUCTgi+
 danQ==
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
cGlkL21hcF9maWxlcy4KCkdyZWcgSGFja21hbm4gKDMpOgogIGRtYS1idWY6IGdpdmUgZWFjaCBi
dWZmZXIgYSBmdWxsLWZsZWRnZWQgaW5vZGUKICBkbWEtYnVmOiBhZGQgRE1BX0JVRl97R0VULFNF
VH1fTkFNRSBpb2N0bHMKICBkbWEtYnVmOiBhZGQgc2hvd19mZGluZm8gaGFuZGxlcgoKIGRyaXZl
cnMvZG1hLWJ1Zi9kbWEtYnVmLmMgICAgfCAxMjIgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0KIGluY2x1ZGUvbGludXgvZG1hLWJ1Zi5oICAgICAgfCAgIDUgKy0KIGluY2x1ZGUv
dWFwaS9saW51eC9kbWEtYnVmLmggfCAgIDMgKwogaW5jbHVkZS91YXBpL2xpbnV4L21hZ2ljLmgg
ICB8ICAgMSArCiA0IGZpbGVzIGNoYW5nZWQsIDEyNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQoKLS0gCjIuMjEuMC4xMDIwLmdmMjgyMGNmMDFhLWdvb2cKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
