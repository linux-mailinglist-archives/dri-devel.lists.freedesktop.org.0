Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBB528C44
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 23:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020ED6E081;
	Thu, 23 May 2019 21:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB976E081
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 21:19:46 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y10so5463213lfl.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 14:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDS3Ns71UvqAxo/Ziy/UlngEZ1rvpeIhNyX6PGvAAp8=;
 b=TSHMJCBuxEAkMR48fZJ+ieOTBmIjWOon3hMcaK/l6TVniiGoMc6V1fOKGpee4CFQaT
 8XCKQFHcaVWPidFe9w0jEf4DcPz4dYV/CBjA9IqLodjhA2Ky7v49kvluA5X1fH/O/Ss+
 9YmDCjhemaO78ZEHjKdhzCybUARgY8+7/+etAj7D7+zTE+NC7HOlP+/V/+0Ts19Wo+WO
 tMfAWrlmDtt6/8AndF5KZ+gENOq9LxH7esvTszL+gYzcpJZJWesv8nuLyUdHGDgiq0Od
 h2RXUsNt/8JBiH/wvl3QAYHjxQXwxc57P14OPoXOgo4ouYQGq2jAtPWNatDC3vuxzwvJ
 LmmQ==
X-Gm-Message-State: APjAAAUu22qyW82ANh67ffJb3Jg51htF0LMkxNBaceuNe5zF7ZtsWSZT
 Tve3veV/TrCt3zHfTk0r2vNFvhH3Aqs=
X-Google-Smtp-Source: APXvYqy6VLlrqtSBgDKruEPUG8QmyCnNa3kzg8z00xcm8/Y1lZqKVECJPtB3UHkcADUXQdlDQVnPNA==
X-Received: by 2002:a19:cdcf:: with SMTP id d198mr9580028lfg.115.1558646384551; 
 Thu, 23 May 2019 14:19:44 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178])
 by smtp.gmail.com with ESMTPSA id u7sm133001ljj.51.2019.05.23.14.19.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 14:19:41 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id h19so1342832ljj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 14:19:41 -0700 (PDT)
X-Received: by 2002:a2e:9f41:: with SMTP id v1mr12462152ljk.66.1558646380884; 
 Thu, 23 May 2019 14:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190523100013.52a8d2a6@gandalf.local.home>
 <CAHk-=wg5HqJ2Kfgpub+tCWQ2_FiFwEW9H1Rm+an-BLGaGvDDXw@mail.gmail.com>
 <20190523112740.7167aba4@gandalf.local.home>
 <CAHk-=whFJqTOk0mSxJGeh38ZxDksgRaMrNV8hqTngiuokyJzew@mail.gmail.com>
 <20190523133648.591f9e78@gandalf.local.home>
In-Reply-To: <20190523133648.591f9e78@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 May 2019 14:19:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=whATjcpjVmTtM-MJw=XWY9kxq2xc67wA4_UkmVgF1mf2Q@mail.gmail.com>
Message-ID: <CAHk-=whATjcpjVmTtM-MJw=XWY9kxq2xc67wA4_UkmVgF1mf2Q@mail.gmail.com>
Subject: Re: [RFC][PATCH] kernel.h: Add generic roundup_64() macro
To: Steven Rostedt <rostedt@goodmis.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zDS3Ns71UvqAxo/Ziy/UlngEZ1rvpeIhNyX6PGvAAp8=;
 b=H4gjzqmptwunXRqYKn250eOT7ZJCydxukVmu4abj4LD8/gbMEVOPhuM7deCH1oNhln
 IhAnoulFRb3ISTB2HVOGL4lwyjS9ysrUvrNhplgIj/dCVrMGGG7bNKPjDw5bsLNtt6oh
 ZXbn+4T7bsuWw2xhN1jJiH7ToSUE6NWp3vTNg=
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-xfs@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTA6MzYgQU0gU3RldmVuIFJvc3RlZHQgPHJvc3RlZHRA
Z29vZG1pcy5vcmc+IHdyb3RlOgo+Cj4gPgo+ID4gT2YgY291cnNlLCB5b3UgcHJvYmFibHkgd2Fu
dCB0aGUgdXN1YWwgImF0IGxlYXN0IHVzZSAnaW50JyIgc2VtYW50aWNzLAo+ID4gaW4gd2hpY2gg
Y2FzZSB0aGUgInR5cGUiIHNob3VsZCBiZSAiKHgpKzAiOgo+ID4KPiA+ICAgICAgI2RlZmluZSBy
b3VuZF91cCh4LCB5KSBzaXplX2ZuKCh4KSswLCByb3VuZF91cF9zaXplLCB4LCB5KQo+ID4KPiA+
ICBhbmQgdGhlIDgtYml0IGFuZCAxNi1iaXQgY2FzZXMgd2lsbCBuZXZlciBiZSB1c2VkLgo+Cj4g
SSdtIGN1cmlvdXMgdG8gd2hhdCB0aGUgYWR2YW50YWdlIG9mIHRoYXQgaXM/CgpMZXQncyBzYXkg
dGhhdCB5b3UgaGF2ZSBhIHN0cnVjdHVyZSB3aXRoIGEgJ3Vuc2lnbmVkIGNoYXInIG1lbWJlciwK
YmVjYXVzZSB0aGUgdmFsdWUgcmFuZ2UgaXMgMC0yNTUuCgpXaGF0IGhhcHBlbnMgaWYgeW91IGRv
CgogICB4ID0gcm91bmRfdXAocC0+bWVtYmVyLCA0KTsKCmFuZCB0aGUgdmFsdWUgaXMgMjU1PwoK
Tm93LCBpZiB5b3Ugc3RheSBpbiAndW5zaWduZWQgY2hhcicgdGhlIGVuZCByZXN1bHQgaXMgMC4g
SWYgeW91IGZvbGxvdwp0aGUgdXN1YWwgQyBpbnRlZ2VyIHByb21vdGlvbiBydWxlcyAoImFsbCBh
cml0aG1ldGljIHByb21vdGVzIHRvIGF0CmxlYXN0ICdpbnQnIiksIHlvdSBnZXQgMjU2LgoKTW9z
dCBwZW9wbGUgcHJvYmFibHkgZXhwZWN0IDI1NiwgYW5kIHRoYXQgaW1wbGllcyB0aGF0IGV2ZW4g
aWYgeW91CnBhc3MgYW4gJ3Vuc2lnbmVkIGNoYXInIHRvIGFuIGFyaXRobWV0aWMgZnVuY3Rpb24g
bGlrZSB0aGlzLCB5b3UKZXhwZWN0IGFueSBtYXRoIHRvIGJlIGRvbmUgaW4gJ2ludCcuIERvaW5n
IHRoZSAiKHgpKzAiIGZvcmNlcyB0aGF0LApiZWNhdXNlIHRoZSAiKzAiIGNoYW5nZXMgdGhlIHR5
cGUgb2YgdGhlIGV4cHJlc3Npb24gZnJvbSAidW5zaWduZWQKY2hhciIgdG8gImludCIgZHVlIHRv
IEMgaW50ZWdlciBwcm9tb3Rpb24uCgpZZXMuIFRoZSBDIGludGVnZXIgdHlwZSBydWxlcyBhcmUg
c3VidGxlIGFuZCBzb21ldGltZXMgc3VycHJpc2luZy4gT25lCm9mIHRoZSB0aGluZ3MgSSd2ZSB3
YW50ZWQgaXMgdG8gaGF2ZSBzb21lIHdheSB0byBsaW1pdCBzaWxlbnQKcHJvbW90aW9uIChhbmQg
c2lsZW50IHRydW5jYXRpb24hKSwgYW5kIGNhdXNlIHdhcm5pbmdzLiAnc3BhcnNlJyBkb2VzCnNv
bWUgb2YgdGhhdCB3aXRoIHNvbWUgc3BlY2lhbC1jYXNlIHR5cGVzIChpZSBfX2JpdHdpc2UpLCBi
dXQgaXQncwpwcmV0dHkgbGltaXRlZC4KCiAgICAgICAgICAgICAgTGludXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
