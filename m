Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E793C096
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 02:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEBB8917E;
	Tue, 11 Jun 2019 00:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435F289125
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 00:02:33 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id q2so6638680plr.19
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 17:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=M35jpHh+HUdAc93UKOjDO7JbyHiHSckhQH2gYDGobXY=;
 b=aJ0kypT7QLZvwrxNlyWDyZZ9qEMEP2GFPcYc7wl0e6afIf3q98bEx0vYzRoY/iPvy6
 pbXeQxlrNGxqQtpUYSvRFGHJyE2gyd8aFVeR4G+Fru4Nf2GWXPdHWGamY3uTujvywWXT
 JW5afkeARs4cuV57+ygH53EIr++prkr4DRH5ghhBmBiw2UiUVKkXIKdVcFTsoVDYU2E7
 +3mBq/OJ929+nYKtjot0rDlZGBgfI/YEbu5DHjPZ/ztVxef0FQ8irL0DxG+vAolNpiFI
 ASXgv4LGxdDmvfqz0lXHhEdutSdiryXSCYs+c+f4W0ZVGUnjlFrnUKWxFyOx8MeVORIf
 mRKA==
X-Gm-Message-State: APjAAAXivoVIBSctBX6Lp+Nv9M7QlF28WojLd+0K5Wp0Bcgl3MTO2TNR
 /qGq+oxMIixtr1AquSJwJOCbCsBjCA==
X-Google-Smtp-Source: APXvYqyfLWy8/cRwYnRZm5yHmhPI6BbqzCZmmDpXbOdd4TYiHsQMuSPBN5pfybvxaruojFUflETihkyrWA==
X-Received: by 2002:a63:6105:: with SMTP id v5mr17769974pgb.312.1560211352554; 
 Mon, 10 Jun 2019 17:02:32 -0700 (PDT)
Date: Mon, 10 Jun 2019 17:02:27 -0700
Message-Id: <20190611000230.152670-1-fengc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [RESEND PATCH v3 0/3] Improve the dma-buf tracking
From: Chenbo Feng <fengc@google.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Tue, 11 Jun 2019 00:29:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=M35jpHh+HUdAc93UKOjDO7JbyHiHSckhQH2gYDGobXY=;
 b=kmOt5FFcxJJcGbgX/KhbCPUkNJRtfC5SMHXTm1h8fiJNch0lsXUvnJM+rymoJnYK+M
 /9i448oQsz9LkakuACRu2808YeoiGQWVOXnOaRsyISwhCPK8dP9o1miiBce5frGWE16z
 eGHzXgV/sirfWV3aYlwKlCVRz8JLalQNNdlrgqf9Kk4okfh7+/qEmYCsVmvDyQQYCeq5
 eHBMKdhUJ4uO5yV4bLwIo6RYC+dEkR71ldwMuJ4oc5OgIdl0EfB1YFOsZhanV9n4KLVA
 PxmWWkH9kRJjk7Cph1crz80X/0wZ+pmtVZn24/1sSr59fSCDJU9Md8pOSeNyHY/QtHrB
 lvsg==
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
