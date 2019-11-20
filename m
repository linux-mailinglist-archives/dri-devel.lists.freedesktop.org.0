Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5111037B9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 11:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F656E1BC;
	Wed, 20 Nov 2019 10:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998846E1BC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 10:39:17 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t26so7221934wmi.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 02:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j6ysrjagD3NpLTHnQ8chDmjUJwaFAnwzaHzzGZvSeUc=;
 b=HtP31mfwj+WX2JeAAUmleTOpwCXlstLRqQRfMsSpqNAdC883egzMc4fYUzzYmQBgfp
 rN6VPx4qSyldKbMF/XSWUvyNVt1Z295T5+1LoKiK1ocv6eouhVQxqBAGyqEhCVEgNs1v
 4MDTr37YCEPD1QZS8HiIUyonmXy4ptWYIGVJrorcXnX7tvsJVL1LuxealovrDxIjqrat
 d7+R+GxpF14pqhvk+A33dBRNQ5W0+fBTi7o0+dgY83xL2VbbUUb30PO1oedt1ODF+Yg8
 b1Jyh3/b+nB8iYQmwkH+v8yRyADRlPcYsAPDf3cJlE2ktCnTnBtCPW7lzZQgML6XQbVH
 pWvA==
X-Gm-Message-State: APjAAAWPg5UurqvTbFuSyCBlo/kDjMxjTVk0YLJYgv13BkhqE8TBshS1
 IbMFEC3+tdUX9hk3JfzU9Wzc8A==
X-Google-Smtp-Source: APXvYqybYN6itClQv5yh6XW7ct7lUvO7Tsili2r3HS5lt24w9JS192/CmT5EJBZHCzoP2K8rpAWW3Q==
X-Received: by 2002:a1c:1b86:: with SMTP id b128mr2399209wmb.127.1574246356211; 
 Wed, 20 Nov 2019 02:39:16 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 91sm32779576wrm.42.2019.11.20.02.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 02:39:15 -0800 (PST)
Date: Wed, 20 Nov 2019 11:39:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191120103913.GH30416@phenom.ffwll.local>
References: <CAKMK7uF7G_H3ZvMpFkqKdGXc5H8P=vAtfoREksJJyysQmxOYzQ@mail.gmail.com>
 <20191113135145.itdsbojzrj5elzvu@sirius.home.kraxel.org>
 <20191113162729.GQ23790@phenom.ffwll.local>
 <20191115093738.kdi4qopah6hvntrb@sirius.home.kraxel.org>
 <CAKMK7uGq7-SpFrEXE2OJhnv66vxtJSifvSg4NUTFhLentQJ31w@mail.gmail.com>
 <20191115105601.i7ahtapysv4j7mn7@sirius.home.kraxel.org>
 <CAKMK7uHNOF5pAWCbQ1-eFWcxEOZmOoKOYL450ZJd7TOeVhMvjw@mail.gmail.com>
 <20191118104026.zg5pt5yg2wkulmrr@sirius.home.kraxel.org>
 <20191118164927.GF23790@phenom.ffwll.local>
 <20191120080532.hjjjddxrsikozlpq@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120080532.hjjjddxrsikozlpq@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=j6ysrjagD3NpLTHnQ8chDmjUJwaFAnwzaHzzGZvSeUc=;
 b=VmEx2AZA9weg1ptxcxUZbaNFcr3Yc1AGYpIZ/N1by4TJjHn0k17r77Rd6Iv4SY8A8T
 N3bF9wpniMFSsfUBTHe41nSWntFSqNbJbH8q2eWDFiTJ/1aTnga0M0xWI7yMoseq6i0X
 QoGvQ2WtimiwCQAHBdi6RnriXidZL4enN3aG4=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDk6MDU6MzJBTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiAgIEhpLAo+IAo+ID4gPiBJIGNhbiBzZWUgbm93IHdoeSB5b3Ugd2FudCBhIHByaXZh
dGUgYWRkcmVzcyBzcGFjZSBmb3IgZWFjaCBvYmplY3QuCj4gPiA+IERvZXMgdGhhdCBpbXBseSB3
ZSBuZWVkIGFuIGFub25faW5vZGUgZm9yIGVhY2ggZ2VtIG9iamVjdD8gIE9yIGlzCj4gPiA+IHRo
ZXJlIHNvbWUgbW9yZSBsaWdodHdlaWdodCB3YXkgdG8gZG8gdGhpcz8KPiA+IAo+ID4gSSBoYXZl
IG5vIGlkZWEgd2hldGhlciB3ZSBjYW4gZ2V0IGEgYWRkcmVzc19zcGFjZSBzdHJ1Y3Qgd2l0aG91
dCBhbiBpbm9kZQo+ID4gKGFuZCBubyBkaXNhc3RlcnMpLgo+IAo+IEFueXRoaW5nIGJ1aWxkaW5n
IG9uIHNobWVtIGhlbHBlcnMgc2hvdWxkIGJlIGFibGUgdG8gdXNlCj4gb2JqLT5maWxwLT5mX21h
cHBpbmcsIHJpZ2h0PyAgU28gYWxsb2NhdGluZyBhbiBpbm9kZSB1bmNvbmRpdGlvbmFsbHkKPiBk
b2Vzbid0IGxvb2sgbGlrZSBhIGdvb2QgcGxhbi4KCk5vdCBzdXJlIHRoZSBzaG1lbSBoZWxwZXJz
IGZvcndhcmQgdGhlIG1tYXAgdG8gdGhlIHVuZGVybHlpbmcgc2htZW0gZmlsZSwKc28gbm90IHN1
cmUgdGhpcyBpcyB0aGUgZ3JlYXRlc3Qgd2F5IGVpdGhlci4KCj4gR3Vlc3MgSSdsbCBnbyBsb29r
IGF0IHR0bS1sb2NhbCBjaGFuZ2VzIGZvciBzdGFydGVycyBhbmQgc2VlIGhvdyBpdAo+IGdvZXMu
CgpJIHRoaW5rIGZvciB0dG0ganVzdCBjb25zaXN0ZW50bHkgdXNpbmcgdGhlIG9uZSBwZXItZGV2
aWNlIG1hcHBpbmcgZm9yCmV2ZXJ5dGhpbmcsIHdpdGggYWxsIHRoZSBmYWtlIG9mZnNldHMsIGlz
IHByb2JhYmx5IHRoZSBxdWlja2VzdCByb3V0ZS4KTWF5YmUgYWxzbyBmb3IgZm9yIHNobWVtIGhl
bHBlcnMuCgpJJ20ga2luZGEgbGVhbmluZyB0b3dhcmRzIHRoYXQgd2UganVzdCByZXN0b3JlIHRo
ZSBmYWtlIG9mZnNldCBldmVyeXdoZXJlLAphbmQgZG9jdW1lbnQgaG93IGl0IHdvcmtzLiBVbnRp
bCBzb21lb25lIGNvbWVzIHVwIHdpdGggYSByZWFsbHkgYnJpZ2h0CmlkZWEuCi1EYW5pZWwKLS0g
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
