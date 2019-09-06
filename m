Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FA7AB4E2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 11:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C650B6E1B3;
	Fri,  6 Sep 2019 09:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C4C6E1B3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 09:28:26 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z9so5674862edq.8
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2019 02:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=GNNbQmbK5UhO9ZUVhEOetPG8zRwleKfA4jhI33/8TU0=;
 b=ZyzWqIiL7qBXUDwdssI5Gw5ru7/NudGrTNDXjuEVLjomJHFH5WkMas/XTP3I8+opli
 ruDiC/7QzsIIJavE8S79erai2VWgU5mVHxxylcSvp7PWF29dyk8YR8ZJP/1kExdTF+fr
 QUtCOo0q7rsqnRp3ESCAqOcl0r71lVIDgofVTrX2PldGR/NuDndCCduS11/3zuupMfN0
 4NCtmmpRbzSwCgQfHtsQ1PqL4RDvmUTeSZDpvKEyhcVP7YaSJ2xQJFebgPJBDdq9FlEb
 QNMK6ax97w0cB+XCOym1wUKXo807QU8+qIusqafmWC7vdu+0iq1keuMFed9cT0AzjpE/
 ibGA==
X-Gm-Message-State: APjAAAW+2NjvQfg4jM1lErU7XDSoJuQBqCvOFWfgAiMUE87wClNbW8QR
 Ux6L1fp3MiF/qN/cgWfoMcX55A==
X-Google-Smtp-Source: APXvYqzvNHKVF1DtkhbBk3Ccj5GxQyE8Y/xTKM22dqiWPvNR9GziwZI8xQCfdzFV2KAjjyMQozMdaA==
X-Received: by 2002:a50:fd95:: with SMTP id o21mr8357393edt.6.1567762104929;
 Fri, 06 Sep 2019 02:28:24 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id t22sm841138edd.79.2019.09.06.02.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 02:28:24 -0700 (PDT)
Date: Fri, 6 Sep 2019 11:28:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/vram: Add infrastructure for move_notify()
Message-ID: <20190906092822.GD3958@phenom.ffwll.local>
References: <20190906085214.11677-1-tzimmermann@suse.de>
 <20190906085214.11677-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906085214.11677-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GNNbQmbK5UhO9ZUVhEOetPG8zRwleKfA4jhI33/8TU0=;
 b=RKdOH7Xkx8E0aeQTEm0N7/oQWI9qgTqRroN4ARm3dz0SXRayLQSXDAapuTyJOp/Q7R
 nUpkDHydajl4a0wZMm2Q1cO0vUOpE4FBro3u78leYsPMFixbMVbJrKto4yEOclr+oei/
 61zPMehCd/X8OITtMxP4cK/FO0PXdCKsgIseQ=
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
Cc: feng.tang@intel.com, dave@stgolabs.net, rong.a.chen@intel.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, maxime.ripard@bootlin.com,
 kraxel@redhat.com, ying.huang@intel.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMTA6NTI6MTNBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhpcyBwYXRjaCBwcmVwYXJlcyBWUkFNIGhlbHBlcnMgZm9yIGxhenkgdW5t
YXBwaW5nIG9mIGJ1ZmZlciBvYmplY3RzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X3ZyYW1fbW1faGVscGVyLmMgfCAxMiArKysrKysrKysrKysKPiAgaW5jbHVkZS9kcm0vZHJtX3Zy
YW1fbW1faGVscGVyLmggICAgIHwgIDQgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92cmFtX21tX2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV92cmFtX21tX2hlbHBlci5jCj4gaW5kZXggYzkx
MTc4MWQ2NzI4Li4zMTk4NDY5MGQ1ZjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV92cmFtX21tX2hlbHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92cmFtX21tX2hl
bHBlci5jCj4gQEAgLTk4LDYgKzk4LDE3IEBAIHN0YXRpYyBpbnQgYm9fZHJpdmVyX3ZlcmlmeV9h
Y2Nlc3Moc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgCXJldHVybiB2bW0tPmZ1bmNz
LT52ZXJpZnlfYWNjZXNzKGJvLCBmaWxwKTsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgYm9fZHJp
dmVyX21vdmVfbm90aWZ5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gKwkJCQkgIGJv
b2wgZXZpY3QsCj4gKwkJCQkgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbmV3X21lbSkKPiArewo+ICsJ
c3RydWN0IGRybV92cmFtX21tICp2bW0gPSBkcm1fdnJhbV9tbV9vZl9iZGV2KGJvLT5iZGV2KTsK
PiArCj4gKwlpZiAoIXZtbS0+ZnVuY3MgfHwgIXZtbS0+ZnVuY3MtPm1vdmVfbm90aWZ5KQo+ICsJ
CXJldHVybjsKPiArCXZtbS0+ZnVuY3MtPm1vdmVfbm90aWZ5KGJvLCBldmljdCwgbmV3X21lbSk7
Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgYm9fZHJpdmVyX2lvX21lbV9yZXNlcnZlKHN0cnVjdCB0
dG1fYm9fZGV2aWNlICpiZGV2LAo+ICAJCQkJICAgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKQo+
ICB7Cj4gQEAgLTE0MCw2ICsxNTEsNyBAQCBzdGF0aWMgc3RydWN0IHR0bV9ib19kcml2ZXIgYm9f
ZHJpdmVyID0gewo+ICAJLmV2aWN0aW9uX3ZhbHVhYmxlID0gdHRtX2JvX2V2aWN0aW9uX3ZhbHVh
YmxlLAo+ICAJLmV2aWN0X2ZsYWdzID0gYm9fZHJpdmVyX2V2aWN0X2ZsYWdzLAo+ICAJLnZlcmlm
eV9hY2Nlc3MgPSBib19kcml2ZXJfdmVyaWZ5X2FjY2VzcywKPiArCS5tb3ZlX25vdGlmeSA9IGJv
X2RyaXZlcl9tb3ZlX25vdGlmeSwKPiAgCS5pb19tZW1fcmVzZXJ2ZSA9IGJvX2RyaXZlcl9pb19t
ZW1fcmVzZXJ2ZSwKPiAgCS5pb19tZW1fZnJlZSA9IGJvX2RyaXZlcl9pb19tZW1fZnJlZSwKPiAg
fTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmggYi9pbmNs
dWRlL2RybS9kcm1fdnJhbV9tbV9oZWxwZXIuaAo+IGluZGV4IDJhYWNmYjFjY2ZhZS4uN2ZiODcw
MGY0NWZlIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV92cmFtX21tX2hlbHBlci5oCj4g
KysrIGIvaW5jbHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmgKPiBAQCAtMTUsNiArMTUsOCBA
QCBzdHJ1Y3QgZHJtX2RldmljZTsKPiAgCSZ0dG1fYm9fZHJpdmVyLmV2aWN0X2ZsYWdzCj4gICAq
IEB2ZXJpZnlfYWNjZXNzOglQcm92aWRlcyBhbiBpbXBsZW1lbnRhdGlvbiBmb3IgXAo+ICAJc3Ry
dWN0ICZ0dG1fYm9fZHJpdmVyLnZlcmlmeV9hY2Nlc3MKPiArICogQG1vdmVfbm90aWZ5OglQcm92
aWRlcyBhbiBpbXBsZW1lbnRhdGlvbiBmb3IKPiArICoJCQlzdHJ1Y3QgJnR0bV9ib19kcml2ZXIu
bW92ZV9ub3RpZnkKPiAgICoKPiAgICogVGhlc2UgY2FsbGJhY2sgZnVuY3Rpb24gaW50ZWdyYXRl
IFZSQU0gTU0gd2l0aCBUVE0gYnVmZmVyIG9iamVjdHMuIE5ldwo+ICAgKiBmdW5jdGlvbnMgY2Fu
IGJlIGFkZGVkIGlmIG5lY2Vzc2FyeS4KPiBAQCAtMjMsNiArMjUsOCBAQCBzdHJ1Y3QgZHJtX3Zy
YW1fbW1fZnVuY3Mgewo+ICAJdm9pZCAoKmV2aWN0X2ZsYWdzKShzdHJ1Y3QgdHRtX2J1ZmZlcl9v
YmplY3QgKmJvLAo+ICAJCQkgICAgc3RydWN0IHR0bV9wbGFjZW1lbnQgKnBsYWNlbWVudCk7Cj4g
IAlpbnQgKCp2ZXJpZnlfYWNjZXNzKShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBzdHJ1
Y3QgZmlsZSAqZmlscCk7Cj4gKwl2b2lkICgqbW92ZV9ub3RpZnkpKHN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqYm8sIGJvb2wgZXZpY3QsCj4gKwkJCSAgICBzdHJ1Y3QgdHRtX21lbV9yZWcgKm5l
d19tZW0pOwoKSXMgdGhpcyBpbmRpcmVjdGlvbiByZWFsbHkgd29ydGggaXQ/IFdlIGhhdmUgYSBn
cmFuZCB0b3RhbCBvZiAxIGRyaXZlcgp3aGljaCBpc24ndCB1c2luZyBnZW0gKHZtd2dmeCksIGFu
ZCBJIGRvbid0IHRoaW5rIHRoYXQgb25lIHdpbGwgZXZlcgpzd2l0Y2ggb3ZlciB0byB2cmFtIGhl
bHBlcnMuCgpJJ2QgZm9sZCB0aGF0IGFsbCBpbi4gSGVscGVycyBkb24ndCBuZWVkIHRvIGJlIGZs
ZXhpYmxlIGVub3VnaCB0byBzdXBwb3J0CmV2ZXJ5IHBvc3NpYmxlIHVzZS1jYXNlICh0aGF0J3Mg
anVzdCB0aGUgam9iIG9mIHRoZSBjb3JlKSwgdGhleSBjYW4gYmUKb3BpbmlvbmF0ZWQgdG8gZ2V0
IGNsZWFuZXIgY29kZSBmb3IgbW9zdCBjYXNlcy4KCkZvciB0aGlzIGNhc2UgaGVyZSBpZiB5b3Ug
Zm9sZCB0aGlzIGluIHlvdSBjYW4gdW5leHBvcnQgMyBFWFBPUlRfU1lNQk9McwooNCB3aXRoIHRo
aXMgcGF0Y2ggaGVyZSksIHdoaWNoIEkgdGhpbmsgaXMgYSBuZWF0IHNpbXBsaWZpY2F0aW9uIG9m
IHRoZQpjb21wbGV4aXR5IGV4cG9zZWQgdG8gZHJpdmVyIHdyaXRlcnMuIEp1c3QgcHV0IHRoZSBu
ZWNlc3NhcnkgZGVjbGFyYXRpb25zCmludG8gYSBkcm1fdnJhbV9oZWxwZXJfaW50ZXJuYWwuaCBz
byB0aGF0IGRyaXZlcnMgZG9uJ3QgZ2V0IGF0IGl0IGJ5CmFjY2lkZW50IChsaWtlIHRoZSBvdGhl
ciBkcm0qaW50ZXJuYWwuaCBoZWxwZXJzIHdlIGhhdmUpLgotRGFuaWVsCgo+ICB9Owo+ICAKPiAg
LyoqCj4gLS0gCj4gMi4yMy4wCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
