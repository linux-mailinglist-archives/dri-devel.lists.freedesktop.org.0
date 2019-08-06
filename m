Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F5845AD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCAF6E62E;
	Wed,  7 Aug 2019 07:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BC36E31E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 07:50:29 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id j11so32938328otp.10
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 00:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=kWFJ9VXWY9elnW+Cpayl7VN+eLgA38VWzMzPMfOSo/4=;
 b=OI9BvScvQZVeQj1RGA5c8zZwjHZepFsmdghTgRLnA7kvJt8Ar2hk6tXQZ6B5e+rcV5
 ST6X56EijvyhzXS7aIb8Any4aO/x7e90wq+PDnd/UsI9eB566q1L9F27dwgjriecxtCu
 N9OGPi0rhR7pgajXE6f8DgPiiw/YN3px924GXe6m9C1c18THvgQxtO2F+RBnp2zutOEJ
 K8e8PwyHZu1sJaiEBJzVlWei027JgnurgVxyq4uRTq4RqXiqQhqbw0kCMCJMsQ+kCwkD
 FIHaivdVmbeBi2SAMnT5VGFBtWgqEldCsAFCFkKXvwCJ0Mobz0zsVdsCjZ+P4gUN7e3T
 Zw5w==
X-Gm-Message-State: APjAAAVzdadITHP1uWBpKY3la0ILmy4aIgj1WjcFxFjxmANmwpqNG2nY
 nIAUFUzlqnm10WkqWZPanFpGmQ==
X-Google-Smtp-Source: APXvYqy2hlvgRI1T/Tn9lMwpCjyMQ41DUBhpPKmBl6Yh+3BnU14/PszBmVh19Kd3ubPgWPa1wTIdiQ==
X-Received: by 2002:a9d:5787:: with SMTP id q7mr2061375oth.75.1565077828501;
 Tue, 06 Aug 2019 00:50:28 -0700 (PDT)
Received: from eggly.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id g6sm28504405otl.50.2019.08.06.00.50.26
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 06 Aug 2019 00:50:27 -0700 (PDT)
Date: Tue, 6 Aug 2019 00:50:10 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@eggly.anvils
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCHv2 2/3] i915: convert to new mount API
In-Reply-To: <20190805182834.GI1131@ZenIV.linux.org.uk>
Message-ID: <alpine.LSU.2.11.1908060007190.1941@eggly.anvils>
References: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
 <20190805160307.5418-3-sergey.senozhatsky@gmail.com>
 <20190805181255.GH1131@ZenIV.linux.org.uk>
 <20190805182834.GI1131@ZenIV.linux.org.uk>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=kWFJ9VXWY9elnW+Cpayl7VN+eLgA38VWzMzPMfOSo/4=;
 b=pOEUKjHZrG9frTrjhAHloZ07xJ3LROaCTkRB9MivU7GBayjsVbeU6wMMDGVhhLdu2P
 ImdbTERwKFKukEw/kJrzyN4wlCnm1R6QN+XHy33VfJzQKySBEx/ibsMY+0xu2ZglMEaJ
 3l/2WR7I8VtuWCjUEJWoPvM1Fmcz4cCWzCaFEafICEUOsKNXop7K8jAwLixrkq6QOJtJ
 c2F3FxbUvarZfm/gKoC98fkt7c2PQpQHNqgri2uGvWagH7CrRLfVy9Zrkn/cCFpElw++
 Ab9wA1mMgC2J08lGAS8gqUkXdhIgAvg/eWTfBX/s9anS7JZq2FeYqcuJq1M61EBREiPN
 fXng==
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

T24gTW9uLCA1IEF1ZyAyMDE5LCBBbCBWaXJvIHdyb3RlOgo+IE9uIE1vbiwgQXVnIDA1LCAyMDE5
IGF0IDA3OjEyOjU1UE0gKzAxMDAsIEFsIFZpcm8gd3JvdGU6Cj4gPiBPbiBUdWUsIEF1ZyAwNiwg
MjAxOSBhdCAwMTowMzowNkFNICswOTAwLCBTZXJnZXkgU2Vub3poYXRza3kgd3JvdGU6Cj4gPiA+
IHRtcGZzIGRvZXMgbm90IHNldCAtPnJlbW91bnRfZnMoKSBhbnltb3JlIGFuZCBpdHMgdXNlcnMg
bmVlZAo+ID4gPiB0byBiZSBjb252ZXJ0ZWQgdG8gbmV3IG1vdW50IEFQSS4KPiA+IAo+ID4gQ291
bGQgeW91IGV4cGxhaW4gd2h5IHRoZSBkZXZpbCBkbyB5b3UgYm90aGVyIHdpdGggcmVtb3VudCBh
dCBhbGw/Cj4gPiBXaHkgbm90IHBhc3MgdGhlIHJpZ2h0IG9wdGlvbnMgd2hlbiBtb3VudGluZyB0
aGUgZGFtbiB0aGluZz8KPiAKPiAuLi4gYW5kIHdoaWxlIHdlIGFyZSBhdCBpdCwgSSByZWFsbHkg
d29uZGVyIHdoYXQncyBnb2luZyBvbiB3aXRoCj4gdGhhdCBnZW1mcyB0aGluZyAtIGFtb25nIHRo
ZSBvdGhlciB0aGluZ3MsIHRoaXMgaXMgdGhlIG9ubHkKPiB1c2VyIG9mIHNobWVtX2ZpbGVfc2V0
dXBfd2l0aF9tbnQoKS4gIFN1cmUsIHlvdSB3YW50IHlvdXIgb3duCj4gb3B0aW9ucywgYnV0IHRo
YXQgYnJpbmdzIGFub3RoZXIgcXVlc3Rpb24gLSBpcyB0aGVyZSBhbnkgcmVhc29uCj4gZm9yIGhh
dmluZyB0aGUgaHVnZT0uLi4gcGVyLXN1cGVyYmxvY2sgcmF0aGVyIHRoYW4gcGVyLWZpbGU/CgpZ
ZXM6IHdlIHdhbnQgYSBkZWZhdWx0IGZvciBob3cgZmlsZXMgb2YgdGhhdCBzdXBlcmJsb2NrIGFy
ZSB0bwphbGxvY2F0ZSB0aGVpciBwYWdlcywgd2l0aG91dCBwZW9wbGUgaGF2aW5nIHRvIGZjbnRs
IG9yIGFkdmlzZQplYWNoIG9mIHRoZWlyIGZpbGVzLgoKU2V0dGluZyBhc2lkZSB0aGUgd2VpcmRl
ciBvcHRpb25zICh3aXRoaW5fc2l6ZSwgYWR2aXNlKSBhbmQgZW1lcmdlbmN5Lwp0ZXN0aW5nIG92
ZXJyaWRlIChzaG1lbV9odWdlKSwgd2Ugd2FudCBmaWxlcyBvbiBhbiBvcmRpbmFyeSBkZWZhdWx0
CnRtcGZzIChodWdlPW5ldmVyKSB0byBiZSBhbGxvY2F0ZWQgd2l0aCBzbWFsbCBwYWdlcyAoc28g
dXNlcnMgd2l0aAphY2Nlc3MgdG8gdGhhdCBmaWxlc3lzdGVtIHdpbGwgbm90IGNvbnN1bWUsIGFu
ZCB3aWxsIG5vdCB3YXN0ZSB0aW1lCmFuZCBzcGFjZSBvbiBjb25zdW1pbmcsIHRoZSBtb3JlIHZh
bHVhYmxlIGh1Z2UgcGFnZXMpOyBidXQgZmlsZXMgb24gYQpodWdlPWFsd2F5cyB0bXBmcyB0byBi
ZSBhbGxvY2F0ZWQgd2l0aCBodWdlIHBhZ2VzIHdoZW5ldmVyIHBvc3NpYmxlLgoKT3IgYW0gSSBt
aXNzaW5nIHlvdXIgcG9pbnQ/ICBZZXMsIGh1Z2VuZXNzIGNhbiBjZXJ0YWlubHkgYmUgZGVjaWRl
ZApkaWZmZXJlbnRseSBwZXItZmlsZSwgb3IgZXZlbiBwZXItZXh0ZW50IG9mIGZpbGUuICBUaGF0
IGlzIGFscmVhZHkKbWFkZSBwb3NzaWJsZSB0aHJvdWdoICJqdWRpY2lvdXMiIHVzZSBvZiBtYWR2
aXNlIE1BRFZfSFVHRVBBR0UgYW5kCk1BRFZfTk9IVUdFUEFHRSBvbiBtbWFwcyBvZiB0aGUgZmls
ZSwgY2FycmllZCBvdmVyIGZyb20gYW5vbiBUSFAuCgpUaG91Z2ggcGVyc29uYWxseSBJJ20gYXZl
cnNlIHRvIG1hbmFnaW5nICJmIm9iamVjdHMgdGhyb3VnaAoibSJpbnRlcmZhY2VzLCB3aGljaCBj
YW4gZ2V0IHJpZGljdWxvdXMgKG5vdGFibHksIE1BRFZfSFVHRVBBR0Ugd29ya3MKb24gdGhlIHZp
cnR1YWwgYWRkcmVzcyBvZiBhIG1hcHBpbmcsIGJ1dCB0aGUgaHVnZS1vci1ub3QgYWxpZ25tZW50
IG9mCnRoYXQgbWFwcGluZyBtdXN0IGhhdmUgYmVlbiBkZWNpZGVkIHByZXZpb3VzbHkpLiAgSW4g
R29vZ2xlIHdlIGRvIHVzZQpmY250bHMgRl9IVUdFUEFHRSBhbmQgRl9OT0hVR0VQQUdFIHRvIG92
ZXJyaWRlIG9uIGEgcGVyLWZpbGUgYmFzaXMgLQpvbmUgZGF5IEknbGwgZ2V0IHRvIHVwc3RyZWFt
aW5nIHRob3NlLgoKSHVnaAoKPiAKPiBBZnRlciBhbGwsIHRoZSByZWFkZXJzIG9mIC0+aHVnZSBp
biBtbS9zaG1lbS5jIGFyZQo+IG1tL3NobWVtLmM6NTgyOiAgICAgKHNobWVtX2h1Z2UgPT0gU0hN
RU1fSFVHRV9GT1JDRSB8fCBzYmluZm8tPmh1Z2UpICYmCj4gCWlzX2h1Z2VfZW5hYmxlZCgpLCBz
YmluZm8gaXMgYW4gZXhwbGljaXQgYXJndW1lbnQKPiAKPiBtbS9zaG1lbS5jOjE3OTk6ICAgICAg
ICBzd2l0Y2ggKHNiaW5mby0+aHVnZSkgewo+IAlzaG1lbV9nZXRwYWdlX2dmcCgpLCBzYmluZm8g
Y29tZXMgZnJvbSBpbm9kZQo+IAo+IG1tL3NobWVtLmM6MjExMzogICAgICAgICAgICAgICAgaWYg
KFNITUVNX1NCKHNiKS0+aHVnZSA9PSBTSE1FTV9IVUdFX05FVkVSKQo+IAlzaG1lbV9nZXRfdW5t
YXBwZWRfYXJlYSgpLCBzYiBjb21lcyBmcm9tIGZpbGUKPiAKPiBtbS9zaG1lbS5jOjM1MzE6ICAg
ICAgICBpZiAoc2JpbmZvLT5odWdlKQo+IG1tL3NobWVtLmM6MzUzMjogICAgICAgICAgICAgICAg
c2VxX3ByaW50ZihzZXEsICIsaHVnZT0lcyIsIHNobWVtX2Zvcm1hdF9odWdlKHNiaW5mby0+aHVn
ZSkpOwo+IAktPnNob3dfb3B0aW9ucygpCj4gbW0vc2htZW0uYzozODgwOiAgICAgICAgc3dpdGNo
IChzYmluZm8tPmh1Z2UpIHsKPiAJc2htZW1faHVnZV9lbmFibGVkKCksIHNiaW5mbyBjb21lcyBm
cm9tIGFuIGlub2RlCj4gCj4gQW5kIHRoZSBvbmx5IGNhbGxlciBvZiBpc19odWdlX2VuYWJsZWQo
KSBpcyBzaG1lbV9nZXRhdHRyKCksIHdpdGggc2JpbmZvCj4gcGlja2VkIGZyb20gaW5vZGUuCj4g
Cj4gU28gaXMgdGhlcmUgYW55IHJlYXNvbiB3aHkgdGhlIGh1Z2VwYWdlIHBvbGljeSBjYW4ndCBi
ZSBwZXItZmlsZSwgd2l0aAo+IHRoZSBjdXJyZW50IGJlaW5nIG92ZXJyaWRhYmxlIGRlZmF1bHQ/
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
