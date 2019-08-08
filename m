Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F0387393
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FD16ED0C;
	Fri,  9 Aug 2019 08:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09BC6E889
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 15:54:36 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id d17so120649959oth.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 08:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=1sg8blSc4ktjYIlt+M6GsnZLOv8BJShN+hn4djS78FU=;
 b=en5dxTt9tWsiKlM6BF5mLsusm3KxgxKxWt4OnUhjEZtJlIx8QlCSwshKhKgPOQpePz
 g+7m8iofGqqkeIlw6ViXLxFeduHV7moO7jDo8CmyjJJO9zqHFiD0HCLxGKVY0Uz009jb
 veg0OsteANObC36vqZkXI56tVi/pN2rV1LHOxpll5sdqNuGc1T/XwEio1sO2ervFK8D8
 szDIE2uAuxeaLVs0shJCNP7ocobph4IaBkyROI91wQgsHsed7hV125gQ15xGR0w+KdmL
 SdrT6D6nN2x9uwhfpwNovewbaGJ+RUr27+9DcG3aNc87DhQXB0/HCj2VTsO2Wu8/SpPz
 T2Rw==
X-Gm-Message-State: APjAAAXb667vNBZPJNxTyCB/PB7gmN7Yvnyl8wqHXvEx3EKhilUpHBYH
 5DCSh3BTc7dpqclRjg7Ji4pf+g==
X-Google-Smtp-Source: APXvYqxx6/FJYqhLJnvLciidKkcc3FlpTPip8iGEIy8CrynVdPXCprALbLDJgDY0Mq5eplxkiyU7pQ==
X-Received: by 2002:a9d:6150:: with SMTP id c16mr12962711otk.21.1565279675432; 
 Thu, 08 Aug 2019 08:54:35 -0700 (PDT)
Received: from eggly.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id q11sm29370290oij.16.2019.08.08.08.54.33
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 08 Aug 2019 08:54:34 -0700 (PDT)
Date: Thu, 8 Aug 2019 08:54:16 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@eggly.anvils
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCHv2 2/3] i915: convert to new mount API
In-Reply-To: <20190808012314.GK1131@ZenIV.linux.org.uk>
Message-ID: <alpine.LSU.2.11.1908080813380.12321@eggly.anvils>
References: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
 <20190805160307.5418-3-sergey.senozhatsky@gmail.com>
 <20190805181255.GH1131@ZenIV.linux.org.uk>
 <20190805182834.GI1131@ZenIV.linux.org.uk>
 <alpine.LSU.2.11.1908060007190.1941@eggly.anvils>
 <20190807063002.GG6627@lst.de> <20190808012314.GK1131@ZenIV.linux.org.uk>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:00:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=1sg8blSc4ktjYIlt+M6GsnZLOv8BJShN+hn4djS78FU=;
 b=mIYi4WLdXWIumYUeDN6cnMSHjo105PssVlySrSrAVFJKfZh7TG7G1RZKLuO0anDBNn
 Gpnfx6gn2opmmlvwQseCzMTgVv+uXDvkLCMriVnjJhLokn6wtZyLTMn2gOBWAr9LCuPf
 G4kK+52fIKN7be4D1f3ZhgCD800bY35k9o3y+zvQd444Ef03+RM4DOdnt8SHstppzGiH
 igaYPm42NustljaIDod+NbLxlQCR6takH+feS2j2eSO0d4pYYq7DYt5tQ6WSls8gUiD5
 tMdLP7V8Dq+rN8oZTwJ0TW37Oc06Dcxd+8TDUXqz56XIavRmx6HCagDr9ou5ZZUJh1hz
 e8Qg==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA4IEF1ZyAyMDE5LCBBbCBWaXJvIHdyb3RlOgo+IE9uIFdlZCwgQXVnIDA3LCAyMDE5
IGF0IDA4OjMwOjAyQU0gKzAyMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gT24gVHVl
LCBBdWcgMDYsIDIwMTkgYXQgMTI6NTA6MTBBTSAtMDcwMCwgSHVnaCBEaWNraW5zIHdyb3RlOgo+
ID4gPiBUaG91Z2ggcGVyc29uYWxseSBJJ20gYXZlcnNlIHRvIG1hbmFnaW5nICJmIm9iamVjdHMg
dGhyb3VnaAo+ID4gPiAibSJpbnRlcmZhY2VzLCB3aGljaCBjYW4gZ2V0IHJpZGljdWxvdXMgKG5v
dGFibHksIE1BRFZfSFVHRVBBR0Ugd29ya3MKPiA+ID4gb24gdGhlIHZpcnR1YWwgYWRkcmVzcyBv
ZiBhIG1hcHBpbmcsIGJ1dCB0aGUgaHVnZS1vci1ub3QgYWxpZ25tZW50IG9mCj4gPiA+IHRoYXQg
bWFwcGluZyBtdXN0IGhhdmUgYmVlbiBkZWNpZGVkIHByZXZpb3VzbHkpLiAgSW4gR29vZ2xlIHdl
IGRvIHVzZQo+ID4gPiBmY250bHMgRl9IVUdFUEFHRSBhbmQgRl9OT0hVR0VQQUdFIHRvIG92ZXJy
aWRlIG9uIGEgcGVyLWZpbGUgYmFzaXMgLQo+ID4gPiBvbmUgZGF5IEknbGwgZ2V0IHRvIHVwc3Ry
ZWFtaW5nIHRob3NlLgo+ID4gCj4gPiBTdWNoIGFuIGludGVyZmFjZSBzZWVtcyB2ZXJ5IHVzZWZ1
bCwgYWx0aG91Z2ggdGhlIHR3byBmY250bHMgc2VlbSBhIGJpdAo+ID4gb2RkLgo+ID4gCj4gPiBC
dXQgSSB0aGluayB0aGUgcG9pbnQgaGVyZSBpcyB0aGF0IHRoZSBpOTE1IGhhcyBpdHMgb3duIHNv
bWV3aGF0IG9kZAo+ID4gaW5zdGFuY2Ugb2YgdG1wZnMuICBJZiB3ZSBjb3VsZCBwYXNzIHRoZSBl
cXVpdmFsZW50IG9mIHRoZSBodWdlPSoKPiA+IG9wdGlvbnMgdG8gc2htZW1fZmlsZV9zZXR1cCBh
bGwgdGhhdCBnYXJiYWdlIChpbmNsdWRpbmcgdGhlCj4gPiBzaG1lbV9maWxlX3NldHVwX3dpdGhf
bW50IGZ1bmN0aW9uKSBjb3VsZCBnbyBhd2F5Lgo+IAo+IC4uLiBvciBmb2xsb3cgc2htZW1fZmls
ZV9zdXBlcigpIHdpdGggd2hhdGV2ZXIgdGhhdCBmY250bCBtYXBzIHRvCj4gaW50ZXJuYWxseS4g
IEkgd291bGQgcmVhbGx5IGxvdmUgdG8gZ2V0IHJpZCBvZiB0aGF0IGk5MTUga2x1ZGdlLgoKQXMg
dG8gdGhlIGltbWVkaWF0ZSBwcm9ibGVtIG9mIGk5MTVfZ2VtZnMgdXNpbmcgcmVtb3VudF9mcyBv
biBsaW51eC1uZXh0LApJSVVDLCBhbGwgdGhhdCBpcyBuZWNlc3NhcnkgYXQgdGhlIG1vbWVudCBp
cyB0aGUgZGVsZXRpb25zIHBhdGNoIGJlbG93CihidXQgSSdkIHByZWZlciB0aGF0IHRvIGNvbWUg
ZnJvbSB0aGUgaTkxNSBmb2xrcykuICBTaW5jZSBnZW1mcyBoYXMgbm8KbmVlZCB0byBjaGFuZ2Ug
dGhlIGh1Z2Ugb3B0aW9uIGZyb20gaXRzIGRlZmF1bHQgdG8gaXRzIGRlZmF1bHQuCgpBcyB0byB0
aGUgZnV0dXJlIG9mIHdoZW4gdGhleSBnZXQgYmFjayB0byB3YW50aW5nIGh1Z2UgcGFnZXMgaW4g
Z2VtZnMsCnllcywgdGhhdCBjYW4gcHJvYmFibHkgYmVzdCBiZSBhcnJhbmdlZCBieSB1c2luZyB0
aGUgaW50ZXJuYWxzIG9mIGFuCmZjbnRsIEZfSFVHRVBBR0Ugb24gdGhvc2Ugb2JqZWN0cyB0aGF0
IHdvdWxkIGJlbmVmaXQgZnJvbSBpdC4KClRob3VnaCBteSBpbnRlbnRpb24gdGhlcmUgd2FzIHRo
YXQgdGhlICJodWdlPW5ldmVyIiBkZWZhdWx0IG91Z2h0CnRvIGNvbnRpbnVlIHRvIHJlZnVzZSB0
byBnaXZlIGh1Z2UgcGFnZXMsIGV2ZW4gd2hlbiBhc2tlZCBieSBmY250bC4KU28gYSBsaXR0bGUg
aGFja2VyeSBtYXkgc3RpbGwgYmUgcmVxdWlyZWQsIHRvIGFsbG93IHRoZSBpOTE1X2dlbWZzCmlu
dGVybmFsIG1vdW50IHRvIGdldCBodWdlIHBhZ2VzIHdoZW4gYSB1c2VyIG1vdW50IHdvdWxkIG5v
dC4KCkFzIHRvIHdoZXRoZXIgc2htZW1fZmlsZV9zZXR1cF93aXRoX21udCgpIG5lZWRzIHRvIGxp
dmU6IEkndmUgZ2l2ZW4KdGhhdCBubyB0aG91Z2h0LCBidXQgYWNjZXB0IHRoYXQgc2htX21udCBp
cyBzdWNoIGEgcmFnYmFnIG9mIGRpZmZlcmVudAp1c2FnZXMsIHRoYXQgaTkxNSBpcyByaWdodCB0
byBwcmVmZXIgdGhlaXIgb3duIHNlcGFyYXRlIGdlbWZzIG1vdW50LgoKSHVnaAoKLS0tIG1tb3Rt
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbWZzLmMJMjAxOS0wNy0yMSAxOTo0MDox
Ni41NzM3MDM3ODAgLTA3MDAKKysrIGxpbnV4L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1
X2dlbWZzLmMJMjAxOS0wOC0wOCAwNzoxOToyMy45Njc2ODkwNTggLTA3MDAKQEAgLTI0LDI4ICsy
NCw2IEBAIGludCBpOTE1X2dlbWZzX2luaXQoc3RydWN0IGRybV9pOTE1X3ByaXYKIAlpZiAoSVNf
RVJSKGdlbWZzKSkKIAkJcmV0dXJuIFBUUl9FUlIoZ2VtZnMpOwogCi0JLyoKLQkgKiBFbmFibGUg
aHVnZS1wYWdlcyBmb3Igb2JqZWN0cyB0aGF0IGFyZSBhdCBsZWFzdCBIUEFHRV9QTURfU0laRSwg
bW9zdAotCSAqIGxpa2VseSAyTS4gTm90ZSB0aGF0IHdpdGhpbl9zaXplIG1heSBvdmVyYWxsb2Nh
dGUgaHVnZS1wYWdlcywgaWYgc2F5Ci0JICogd2UgYWxsb2NhdGUgYW4gb2JqZWN0IG9mIHNpemUg
Mk0gKyA0Sywgd2UgbWF5IGdldCAyTSArIDJNLCBidXQgdW5kZXIKLQkgKiBtZW1vcnkgcHJlc3N1
cmUgc2htZW0gc2hvdWxkIHNwbGl0IGFueSBodWdlLXBhZ2VzIHdoaWNoIGNhbiBiZQotCSAqIHNo
cnVuay4KLQkgKi8KLQotCWlmIChoYXNfdHJhbnNwYXJlbnRfaHVnZXBhZ2UoKSkgewotCQlzdHJ1
Y3Qgc3VwZXJfYmxvY2sgKnNiID0gZ2VtZnMtPm1udF9zYjsKLQkJLyogRklYTUU6IERpc2FibGVk
IHVudGlsIHdlIGdldCBXL0EgZm9yIHJlYWQgQlcgaXNzdWUuICovCi0JCWNoYXIgb3B0aW9uc1td
ID0gImh1Z2U9bmV2ZXIiOwotCQlpbnQgZmxhZ3MgPSAwOwotCQlpbnQgZXJyOwotCi0JCWVyciA9
IHNiLT5zX29wLT5yZW1vdW50X2ZzKHNiLCAmZmxhZ3MsIG9wdGlvbnMpOwotCQlpZiAoZXJyKSB7
Ci0JCQlrZXJuX3VubW91bnQoZ2VtZnMpOwotCQkJcmV0dXJuIGVycjsKLQkJfQotCX0KLQogCWk5
MTUtPm1tLmdlbWZzID0gZ2VtZnM7CiAKIAlyZXR1cm4gMDsKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
