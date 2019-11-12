Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C58F9150
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 15:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0659D6E45D;
	Tue, 12 Nov 2019 14:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0246E9F4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 14:01:59 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a17so2422233wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 06:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=MrWmg4S4QVjfl7ElzvbNo6Dq6sBDPaTcM04xou8JMbE=;
 b=WWYr3Dybw8Wi0V+Tcaha+ZO98DfOBA4wOaghuwHj0hw4zBEaH1mNh0VOpmMbSWdu6P
 YsDYIAcip8UeSME53c4MEXzTizLhKpyWS77rm1EP4S1DsBdgHfm+CbJoBxtUx5S2hvHo
 Du3JwJqt2eEUNBk+yqUe0DkwKGUzSB/hNqJz4DYsWZw1xBJuGGySORRxTSFx34GuGLUy
 rQo9sXn4+1qBJUnVsD77GuegWfM1BkTmBb1bF8E3z66whyqWxjbmS5EkVVkchGjzK3O2
 dlkMV29hDGmYhWOkma6c/j2kcO9lFQUaJTvoX9ich88x+notH9DwINF77UVkkiG+Mzkn
 +aVA==
X-Gm-Message-State: APjAAAU6evKDkeI/hwTMXAuUEsgflkvd333VhaCYLvrmD/QX2l0EaRZ3
 07xmmNzjM16nbx9e2+qxx8Ppsw==
X-Google-Smtp-Source: APXvYqwg1um6jg+/qODyeIAqZsG4VJkK0RglxJrSmFgE3PAxS7h90PQ/gBE97aZORkW05LcpoYTR5w==
X-Received: by 2002:a1c:984b:: with SMTP id a72mr4286085wme.78.1573567317930; 
 Tue, 12 Nov 2019 06:01:57 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id l4sm3059222wme.4.2019.11.12.06.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 06:01:57 -0800 (PST)
Date: Tue, 12 Nov 2019 15:01:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/4] drm/msm: fix memleak on release
Message-ID: <20191112140155.GJ23790@phenom.ffwll.local>
Mail-Followup-To: Johan Hovold <johan@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-s390@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 stable <stable@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Dave Airlie <airlied@gmail.com>
References: <20191010131333.23635-1-johan@kernel.org>
 <20191010131333.23635-2-johan@kernel.org>
 <20191030100146.GC4691@localhost>
 <20191112104001.GP11035@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112104001.GP11035@localhost>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=MrWmg4S4QVjfl7ElzvbNo6Dq6sBDPaTcM04xou8JMbE=;
 b=ax6nC2UjJtb1u8+MWf7et5sm8f0kIu4FeoVmwb6B7m7QoYHoTqVObl+BovSgMMSj/Y
 9LZMJ3Q78YAesg8YG9NjW3ZTkADp/BoA9hw5aPkSBeQjZwSPGeuvAWEUC2HqA3ZoZqfo
 ZkBPnLF64sC+ifwhNdox79S20LdCKzVH6cupY=
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
Cc: freedreno@lists.freedesktop.org, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>, stable <stable@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMTE6NDA6MDFBTSArMDEwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IE9uIFdlZCwgT2N0IDMwLCAyMDE5IGF0IDExOjAxOjQ2QU0gKzAxMDAsIEpvaGFuIEhv
dm9sZCB3cm90ZToKPiA+IE9uIFRodSwgT2N0IDEwLCAyMDE5IGF0IDAzOjEzOjMwUE0gKzAyMDAs
IEpvaGFuIEhvdm9sZCB3cm90ZToKPiA+ID4gSWYgYSBwcm9jZXNzIGlzIGludGVycnVwdGVkIHdo
aWxlIGFjY2Vzc2luZyB0aGUgImdwdSIgZGVidWdmcyBmaWxlIGFuZAo+ID4gPiB0aGUgZHJtIGRl
dmljZSBzdHJ1Y3RfbXV0ZXggaXMgY29udGVuZGVkLCByZWxlYXNlKCkgY291bGQgcmV0dXJuIGVh
cmx5Cj4gPiA+IGFuZCBmYWlsIHRvIGZyZWUgcmVsYXRlZCByZXNvdXJjZXMuCj4gPiA+IAo+ID4g
PiBOb3RlIHRoYXQgdGhlIHJldHVybiB2YWx1ZSBmcm9tIHJlbGVhc2UoKSBpcyBpZ25vcmVkLgo+
ID4gPiAKPiA+ID4gRml4ZXM6IDRmNzc2ZjQ1MTFjNyAoImRybS9tc20vZ3B1OiBDb252ZXJ0IHRo
ZSBHUFUgc2hvdyBmdW5jdGlvbiB0byB1c2UgdGhlIEdQVSBzdGF0ZSIpCj4gPiA+IENjOiBzdGFi
bGUgPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICAgICAjIDQuMTgKPiA+ID4gQ2M6IEpvcmRhbiBD
cm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5vcmc+Cj4gPiA+IENjOiBSb2IgQ2xhcmsgPHJvYmRj
bGFya0BnbWFpbC5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvaGFuIEhvdm9sZCA8am9oYW5A
a2VybmVsLm9yZz4KPiA+ID4gLS0tCj4gPiAKPiA+IFJvYiwgU2VhbiwKPiA+IAo+ID4gU2VuZGlu
ZyBhIHJlbWluZGVyIGFib3V0IHRoaXMgb25lLCB3aGljaCBpcyBub3QgeWV0IGluIGxpbnV4LW5l
eHQuCj4gPiAKPiA+IFBlcmhhcHMgRGFuaWVsIGNhbiBwaWNrIGl0IHVwIG90aGVyd2lzZT8KPiAK
PiBBbm90aGVyIHR3byB3ZWVrcywgYW5vdGhlciByZW1pbmRlci4gVGhpcyBvbmUgaXMgc3RpbGwg
bm90IGluIC1uZXh0LgoKV2VsbCBtc20gaXMgbWFpbnRhaW5lZCBpbiBhIHNlcGFyYXRlIHRyZWUs
IHNvIHRoZSB1c3VhbCBncm91cCBtYWludGFpbmVyCmZhbGxiYWNrIGZvciB3aGVuIHBhdGNoZXMg
YXJlIHN0dWNrIGRvZXNuJ3QgYXBwbHkuCgpSb2IsIFNlYW4sIHRpbWUgdG8gcmVjb25zaWRlciBk
cm0tbWlzYyBmb3IgbXNtPyBJIHRoaW5rIHRoZXJlJ3Mgc29tZSBtb3JlCm9kZGJhbGwgcGF0Y2hl
cyB0aGF0IG9jY2FzaW9uYWxseSBnZXQgc3R1Y2sgZm9yIG1zbSAuLi4KCkFsc28gK0RhdmUuCi1E
YW5pZWwKCj4gCj4gSm9oYW4KPiAKPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2RlYnVn
ZnMuYyB8IDYgKy0tLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUg
ZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9tc21fZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZGVidWdmcy5jCj4gPiA+
IGluZGV4IDZiZTg3OTU3ODE0MC4uMWM3NDM4MWE0ZmM5IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL21zbV9kZWJ1Z2ZzLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9tc21fZGVidWdmcy5jCj4gPiA+IEBAIC00NywxMiArNDcsOCBAQCBzdGF0aWMgaW50IG1z
bV9ncHVfcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlsZSkKPiA+
ID4gIAlzdHJ1Y3QgbXNtX2dwdV9zaG93X3ByaXYgKnNob3dfcHJpdiA9IG0tPnByaXZhdGU7Cj4g
PiA+ICAJc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSAqcHJpdiA9IHNob3dfcHJpdi0+ZGV2LT5kZXZf
cHJpdmF0ZTsKPiA+ID4gIAlzdHJ1Y3QgbXNtX2dwdSAqZ3B1ID0gcHJpdi0+Z3B1Owo+ID4gPiAt
CWludCByZXQ7Cj4gPiA+IC0KPiA+ID4gLQlyZXQgPSBtdXRleF9sb2NrX2ludGVycnVwdGlibGUo
JnNob3dfcHJpdi0+ZGV2LT5zdHJ1Y3RfbXV0ZXgpOwo+ID4gPiAtCWlmIChyZXQpCj4gPiA+IC0J
CXJldHVybiByZXQ7Cj4gPiA+ICAKPiA+ID4gKwltdXRleF9sb2NrKCZzaG93X3ByaXYtPmRldi0+
c3RydWN0X211dGV4KTsKPiA+ID4gIAlncHUtPmZ1bmNzLT5ncHVfc3RhdGVfcHV0KHNob3dfcHJp
di0+c3RhdGUpOwo+ID4gPiAgCW11dGV4X3VubG9jaygmc2hvd19wcml2LT5kZXYtPnN0cnVjdF9t
dXRleCk7CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9y
YXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
