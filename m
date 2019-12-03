Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 953BE1104CA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 20:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725AF6E0BB;
	Tue,  3 Dec 2019 19:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F2C6E0BB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 19:10:56 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id o22so1443009ybg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 11:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jmkfl8Nvhi9yjoE5Ny/aYlex7Xh670PGW+8t9l6OxqA=;
 b=R/cCsTol9z4QGDTvAa3x+J+a64oCUL8FVbz4dv0BNKM4dxMjOAFewLQgrToyQaIu1c
 0M3AJGvRxDhBqsbns3WuB7PUB+QhOSyvGabobh85WebQOGM/g42e13gDZTq0Csq6hT0j
 rdJNIQ+6MC3ODeIQ+O1ij+nx1v2U4xntak443p6DHUMKi+XWAYDRKL1+ohy9l27sVQxs
 httW1HkOpPNlrhCHwGebWkigYSUqXtPLpSMuf5TrzyYHLyIXY8ey2Hjy7VAs+BNvC9Ft
 9oE7PvM/synVXbKQMQhNIVuGfNs/M7JTSFk9tCgXFi23ApEIwW/N9Msqmi4VDN7WDsVP
 hElA==
X-Gm-Message-State: APjAAAWmprc00Zoj1qYU2bGWzCYnp2JZ87HEhLSJdmMmYk/xJ4w1uuiF
 ArXlBBuR8C/AHiXHS3vUWW6aGSiGC0C4ZA==
X-Google-Smtp-Source: APXvYqzUXEyc4hpYEmvQLovqjDfKVVHNKGdCtA25VvStlej2OeBNeNDbnAYSpLCoTkKssFQMoo/qhQ==
X-Received: by 2002:a5b:a88:: with SMTP id h8mr5557864ybq.185.1575400255857;
 Tue, 03 Dec 2019 11:10:55 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id p1sm2046019ywh.74.2019.12.03.11.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 11:10:55 -0800 (PST)
Date: Tue, 3 Dec 2019 14:10:54 -0500
From: Sean Paul <sean@poorly.run>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm: Funnel drm logs to tracepoints
Message-ID: <20191203191054.GA162979@art_vandelay>
References: <20191010204823.195540-1-sean@poorly.run>
 <242462f0-ac8d-ab8a-e567-74678da3f68f@suse.de>
 <20191015191156.GW85762@art_vandelay>
 <20191015200233.GK1208@intel.com>
 <CAKMK7uE_DiXH_Gz6JBObv_Fs7cUhkH1wTVw4LDx2GZVueqYAPA@mail.gmail.com>
 <20191016160557.73b634c9@eldfell.localdomain>
 <d6b47400-c254-4f6b-5fac-59693571dee0@suse.de>
 <20191017102216.20f98533@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017102216.20f98533@eldfell.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jmkfl8Nvhi9yjoE5Ny/aYlex7Xh670PGW+8t9l6OxqA=;
 b=LZUrnSYqrGBbkY5XJaFbG/5HHEaqXIfPcuD4ikdjew4jha352yYsaHAcvzAfDGQAlc
 r0k1zzoGxrTSUsPDQABrYhQUyVImN+PF7U3u7T1BnIPRP0GLyfqSuT3WX3KJt1sp7JWz
 AxIflXzGUJ5uwGDGHsgE+Njgmk92by03gKgJe9JgduYt8SshYmJtvW0VxqxDN86qwhbD
 haRKsNAcBb7LpzhjeOl6WuRx6I/s2tGsKNXalV36Jf9i0TT8oM08mRFC1+j6DtyLxGAK
 VODrmhkKLbMfxjVuXB8c0IAR1dwFt/kHAGQloMxbe5zDLNgbtGFAcftT8W7/SiY12n1M
 m0tQ==
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTA6MjI6MTZBTSArMDMwMCwgUGVra2EgUGFhbGFuZW4g
d3JvdGU6Cj4gT24gV2VkLCAxNiBPY3QgMjAxOSAxNToyMzo0NSArMDIwMAo+IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToKPiAKPiA+IEhpCj4gPiAKPiA+IEFt
IDE2LjEwLjE5IHVtIDE1OjA1IHNjaHJpZWIgUGVra2EgUGFhbGFuZW46Cj4gCj4gPiA+IHNwZWNp
ZmljYWxseSBiZSBhdmFpbGFibGUgaW4gcHJvZHVjdGlvbi4gU28gYSBuZXcgZmlsZSBpbiBzb21l
IGZzCj4gPiA+IHNvbWV3aGVyZSBpdCBzaG91bGQgYmUsIGFuZCB1c2Vyc3BhY2UgaW4gcHJvZHVj
dGlvbiBjYW4gcmVhZCBpdCBhdCB3aWxsCj4gPiA+IHRvIGF0dGFjaCB0byBhIGJ1ZyByZXBvcnQu
Cj4gPiA+IAo+ID4gPiBUaG9zZSBzZW1hbnRpY3MsICJvbmx5IHVzZSB0aGlzIGNvbnRlbnQgZm9y
IGF0dGFjaGluZyBpbnRvIGEgYnVnCj4gPiA+IHJlcG9ydCIgc2hvdWxkIGJlIG1hZGUgdmVyeSBj
bGVhciBpbiB0aGUgVUFQSS4gIAo+ID4gCj4gPiBIYXMgdGhpcyBldmVyIHdvcmtlZD8gQXMgc29v
biBhcyBhIHVzZXJzcGFjZSBwcm9ncmFtIHN0YXJ0cyBkZXBlbmRpbmcgb24KPiA+IHRoZSBjb250
ZW50IG9mIHRoaXMgZmlsZSwgaXQgYmVjb21lcyBrYWJpLiBGcm9tIHRoZSBpbmNpZGVudHMgSSBr
bm93LAo+ID4gTGludXMgaGFzIGFsd2F5cyBiZWVuIHF1aXRlIHN0cmljdCBhYm91dCB0aGlzLiBF
dmVuIGZvciBicm9rZW4gaW50ZXJmYWNlcy4KPiAKPiBUaGUga2VybmVsIGxvZyBjb250ZW50IGlz
IG5vdCBrYWJpLCBpcyBpdD8gSSd2ZSBzZWVuIGl0IGNoYW5nZSBwbGVudHkKPiBkdXJpbmcgdGhl
IHllYXJzLiBUaGlzIHdvdWxkIGJlIGp1c3QgYW5vdGhlciBzaW1pbGFyIGxvZyB3aXRoIGZyZWUt
Zm9ybQo+IHRleHQuCj4gCgpPaywgc28gZ2l2ZW4gdGhlIG1vcmUgc3RydWN0dXJlZCB2ZXJzaW9u
IG9mIHRoaXMgc2V0IFsxXSB3YXMgbm90IHdlbGwgcmVjZWl2ZWQsCmFyZSB3ZSBhbGwgY29tZm9y
dGFibGUgZ29pbmcgd2l0aCB0aGUgZnJlZWZvcm0gYXBwcm9hY2ggaW4gdGhpcyB2ZXJzaW9uPwoK
U2VhbgoKWzFdLSBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2
ZWwvMjAxOS1Ob3ZlbWJlci8yNDMyMzAuaHRtbAoKPiAKPiBUaGFua3MsCj4gcHEKCgoKLS0gClNl
YW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
