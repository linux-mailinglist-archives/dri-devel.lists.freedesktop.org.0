Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D673446336
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 17:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0157489A5D;
	Fri, 14 Jun 2019 15:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D089889A5D;
 Fri, 14 Jun 2019 15:46:32 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id i2so1196202plt.1;
 Fri, 14 Jun 2019 08:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=KRgtgULPK891tOGG5t4dUW4/Zs8Jf3twwJrLAvaHXCM=;
 b=k0dyOcq3/1144WNKaqlyAeB8hYcfqD7YLik0FUFRcC5Uk5VjFNbY7T5Z8qtzNRIawC
 19OOa3ur+3Ru8oSh1o14HUqKS5GcrCdTfCGZY0+uHm6qkZmV17H3aLDyYajmKx9qJHIw
 fDIiAk0GkdPxYSTd9xi0cMV4aoaOKSXiPltErKQEOLOqDUUJ4Ckhpz/sC/Tty0tfULYJ
 ajkJ7cazcyaPctuWrDFeBZVOiz7snXWAzGNGUKwPsbJg3kQ/c7BXLlG/N1l0yTYqbx0h
 jZRqygRRzhi6fH9VTLY1TLUkPzhjJUXXQ3FwNIPSZ615knleeR2HsHG4xcyspvDKwTVS
 qfFQ==
X-Gm-Message-State: APjAAAVpbnIoD0Atv6MiJEvo0wXyEI/taI3cdxvbaIJLLV1nQby2un6P
 BpuPpTiyVhhb9J4+tSFyuY4=
X-Google-Smtp-Source: APXvYqwiq+8hGeYQ6L6Er98x3qaWhr3zME6PrQeoyZkRUO5Spda7XFFJhNph3wuEpCh6CNK8gyW1Eg==
X-Received: by 2002:a17:902:b705:: with SMTP id
 d5mr57674507pls.274.1560526722616; 
 Fri, 14 Jun 2019 08:38:42 -0700 (PDT)
Received: from localhost ([2620:10d:c090:180::1:b330])
 by smtp.gmail.com with ESMTPSA id w36sm7563630pgl.62.2019.06.14.08.38.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 08:38:41 -0700 (PDT)
Date: Fri, 14 Jun 2019 08:38:37 -0700
From: Tejun Heo <tj@kernel.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [BUG] lockdep splat with kernfs lockdep annotations and slab
 mutex from drm patch??
Message-ID: <20190614153837.GE538958@devbig004.ftw2.facebook.com>
References: <20190614093914.58f41d8f@gandalf.local.home>
 <156052491337.7796.17642747687124632554@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156052491337.7796.17642747687124632554@skylake-alporthouse-com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KRgtgULPK891tOGG5t4dUW4/Zs8Jf3twwJrLAvaHXCM=;
 b=o3Lri5DsGsWuggMDg29Bi3ENUTlvH+3GmvfvzTZGh2sF3pkpez5DNm8bBAnAUaEWZZ
 3c1JTmWV/+H4DwAEWKuf8SIhFlrkKgyxGA08WQUxcLuuBDucCsPpX5ou261vea4IAUD4
 WQYvESfcDZvmL6S+6IRwxsPQuEsCTmLfTKe3hQlII+Ia2XdlgWmUu3rLDCHGq83/HVlt
 NK28IS/TYC5hON8cjCk4En/YfFspE72vU+HJ/iEGlOPHFGTMVicpAIpXo9xI/uzf5A0u
 364X1XL7JKHiGgzJ2Q9GwBwCLBz0Bd91qQovHCccul8GepD3nt7DLEeGJOYTE9baEEe6
 mZyA==
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpPbiBGcmksIEp1biAxNCwgMjAxOSBhdCAwNDowODozM1BNICswMTAwLCBDaHJpcyBX
aWxzb24gd3JvdGU6Cj4gI2lmZGVmIENPTkZJR19NRU1DRwo+ICAgICAgICAgaWYgKHNsYWJfc3Rh
dGUgPj0gRlVMTCAmJiBlcnIgPj0gMCAmJiBpc19yb290X2NhY2hlKHMpKSB7Cj4gICAgICAgICAg
ICAgICAgIHN0cnVjdCBrbWVtX2NhY2hlICpjOwo+IAo+ICAgICAgICAgICAgICAgICBtdXRleF9s
b2NrKCZzbGFiX211dGV4KTsKPiAKPiBzbyBpdCBoYXBwZW5zIHRvIGhpdCB0aGUgZXJyb3IgKyBG
VUxMIGNhc2Ugd2l0aCB0aGUgYWRkaXRpb25hbCBzbGFiY2FjaGVzPwo+IAo+IEFueXdheSwgYWNj
b3JkaW5nIHRvIGxvY2tkZXAsIGl0IGlzIGRhbmdlcm91cyB0byB1c2UgdGhlIHNsYWJfbXV0ZXgg
aW5zaWRlCj4gc2xhYl9hdHRyX3N0b3JlKCkuCgpEaWRuJ3QgcmVhbGx5IGxvb2sgaW50byB0aGUg
Y29kZSBidXQgaXQgbG9va3MgbGlrZSBzbGFiX211dGV4IGlzIGhlbGQKd2hpbGUgdHJ5aW5nIHRv
IHJlbW92ZSBzeXNmcyBmaWxlcy4gIHN5c2ZzIGZpbGUgcmVtb3ZhbCBmbHVzaGVzCm9uLWdvaW5n
IGFjY2Vzc2VzLCBzbyBpZiBhIGZpbGUgb3BlcmF0aW9uIHRoZW4gdHJpZXMgdG8gZ3JhYiBhIG11
dGV4CndoaWNoIGlzIGhlbGQgZHVyaW5nIHJlbW92YWwsIGl0IGxlYWRzIHRvIGEgZGVhZGxvY2su
CgpUaGFua3MuCgotLSAKdGVqdW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
