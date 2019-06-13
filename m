Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD2245629
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050C789872;
	Fri, 14 Jun 2019 07:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0A18930F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 22:34:12 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id e7so383911plt.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=fhW1GX7remjs81G+bm5ttCdAu6C2vugZvVnklwydC+E=;
 b=peYWruhfx/KWkIxccLetUudbRnZXq8kET1hWz5RpV0b/mdDZQuCl6wpG0IYRFB6aLa
 JMCk518yg2lFUGKYxQkHxEBn3bTNRwPmABVvA4J9Dsd5DIeE58MCDSyfljZ6yYR5s10a
 M5/bvlWE16IOCUoB4p0G2QZa4EcYlkEt8WJkz4jTKz8bOsTkNTsl7fzAaUbzEPHlM1a0
 sk+tw3ulxGX6WVkCQLw4k/ajVcAFp+HHyAoivdBAEfb5wjefUApHirCctY3hmT2PCoxB
 ofcMedLkdlC+4a6hzNLIB3VrfWRCxZSJj/i/0QwRVkZndHbpyJxrw3I1FrqW2mU7ylO7
 Q+DQ==
X-Gm-Message-State: APjAAAWKWVVMZWcdU3rjghQHaLYmY56/G1AcViSolFXyCZXa8oPrgK4w
 gG8WQ9lYWsIhEapCkAIXbHZWG6TQyg==
X-Google-Smtp-Source: APXvYqxa9Xtwo7UxarcBonvAJZhkfNfXSMdC9caTJicxJ68u2r0YFaGYL8amFfGcqgiWPj9i9B6I976OVw==
X-Received: by 2002:a63:31d8:: with SMTP id
 x207mr31012219pgx.403.1560465251712; 
 Thu, 13 Jun 2019 15:34:11 -0700 (PDT)
Date: Thu, 13 Jun 2019 15:34:05 -0700
Message-Id: <20190613223408.139221-1-fengc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v5 0/3] Improve the dma-buf tracking
From: Chenbo Feng <fengc@google.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=fhW1GX7remjs81G+bm5ttCdAu6C2vugZvVnklwydC+E=;
 b=vhZllg9maQh/sutXE6shnbCLNUnYp04MtK5t9uFyrUBT+S7FLXAsLBeCE5V5LRxz4B
 ClUduRinRB3yzpaw8b18iXtzA5+47pEbFuMHXdoikHLhzAYrmvKom99d8TWmvC5O56Dv
 8SOHAJ2hQtsYz0uVdv4uODGpym/mheWtk5+IdHAXlOaYaohhwRm0hIvbHX8VI+MaMAW8
 R8TVQaClY4M4wxzX0xftjdqNsCMs5BXNSZrlyANg+wZJ7i5cGknzvPPh9q6FCDJlOSoJ
 Yjf+UKKZXkLHZ9PcuJc9veypiNiwErtnGY2eM5OmtkSQpvqjhPvQmDIMdWTXpp4MsmoM
 4xmA==
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
cGlkL21hcF9maWxlcy4KCkNoYW5nZSBpbiB2NDoKKiBVcGRhdGVkIHRoZSBjb21taXQgbWVzc2Fn
ZSBhbmQgYWRkZWQgc29tZSBjb21tZW50cyBmb3IgdGhlCiAgRE1BX0JVRl9TRVRfTkFNRSBpb3Rj
bAoKQ2hhbmdlIGluIHY1OgoqIEFkZCB0aGUgbWlzc2luZyBrZnJlZSBmb3IgdGhlIGRtYS1idWYg
bmFtZSBpb2N0bC4KCkdyZWcgSGFja21hbm4gKDMpOgogIGRtYS1idWY6IGdpdmUgZWFjaCBidWZm
ZXIgYSBmdWxsLWZsZWRnZWQgaW5vZGUKICBkbWEtYnVmOiBhZGQgRE1BX0JVRl97R0VULFNFVH1f
TkFNRSBpb2N0bHMKICBkbWEtYnVmOiBhZGQgc2hvd19mZGluZm8gaGFuZGxlcgoKIGRyaXZlcnMv
ZG1hLWJ1Zi9kbWEtYnVmLmMgICAgfCAxMjIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0KIGluY2x1ZGUvbGludXgvZG1hLWJ1Zi5oICAgICAgfCAgIDUgKy0KIGluY2x1ZGUvdWFw
aS9saW51eC9kbWEtYnVmLmggfCAgIDMgKwogaW5jbHVkZS91YXBpL2xpbnV4L21hZ2ljLmggICB8
ICAgMSArCiA0IGZpbGVzIGNoYW5nZWQsIDEyNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQoKLS0gCjIuMjEuMC4xMDIwLmdmMjgyMGNmMDFhLWdvb2cKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
