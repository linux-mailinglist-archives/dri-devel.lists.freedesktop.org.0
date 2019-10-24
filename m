Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A55E2CC5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 11:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C396E190;
	Thu, 24 Oct 2019 09:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390806E190
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:02:45 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-zOYg5CV_OoW7eKDJkz-VIg-1; Thu, 24 Oct 2019 05:02:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 717E8107AD31;
 Thu, 24 Oct 2019 09:02:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A78F60852;
 Thu, 24 Oct 2019 09:02:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4968C9DB6; Thu, 24 Oct 2019 11:02:40 +0200 (CEST)
Date: Thu, 24 Oct 2019 11:02:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm/prime: Fix mmap fake offset for
 drm_gem_object_funcs.mmap
Message-ID: <20191024090240.jnmbo5ikivdbkbbg@sirius.home.kraxel.org>
References: <20191023222226.9064-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191023222226.9064-1-robh@kernel.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: zOYg5CV_OoW7eKDJkz-VIg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571907764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OC52AtNhWuLkLrBuxgl8m2VRgDottz0EfHS+qn69Fb4=;
 b=GOstst8yC/jLSm16vPcTCoTCZwMF+B3NV1pONLAABrxNuFuQaEe+sB0BXuHem0c9YW0AB9
 JgA0yR3jDIhHt3YFIrI37yfTp1vHaO6+/Gfzv58xgDRuhry/PbXz+R4OmKDlMbQq/50gYc
 XTtiOooW5RZAWo84PIvSVWq+UWx9Gsw=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDU6MjI6MjZQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gQ29tbWl0IGM0MDA2OWNiN2JkNiAoImRybTogYWRkIG1tYXAoKSB0byBkcm1fZ2VtX29i
amVjdF9mdW5jcyIpCj4gaW50cm9kdWNlZCBhIEdFTSBvYmplY3QgbW1hcCgpIGhvb2sgd2hpY2gg
aXMgZXhwZWN0ZWQgdG8gc3VidHJhY3QgdGhlCj4gZmFrZSBvZmZzZXQgZnJvbSB2bV9wZ29mZi4K
CkxvbmctdGVybSBpdCBpcyBwcm9iYWJseSBhIGdvb2QgaWRlYSB0byBqdXN0IHJlbW92ZSB0aGUg
ZmFrZSBvZmZzZXQKaGFuZGxpbmcgZnJvbSBkcml2ZXJzLiAgQnV0IHRoYXQnbGwgb25seSB3b3Jr
IG9uY2UgYWxsIGRyaXZlcnMgc3dpdGNoZWQKYXdheSBmcm9tIGN1c3RvbSBmb3BzLT5tbWFwIGhh
bmRsZXJzIHNvIHdlIGNhbiBoYW5kbGUgdGhlIG9mZnNldCAtPiBvYmoKbG9va3VwIGluIHRoZSBk
cm0gY29yZSBmb3IgZXZlcnlib2R5LgoKU28gbGV0J3MgZ28gdGhpcyB3YXkgZm9yIG5vdy4KCkFj
a2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCj4gSG93ZXZlciwgZm9y
IG1tYXAoKSBvbiBkbWFidWZzLCB0aGVyZSBpcyBub3QKPiBhIGZha2Ugb2Zmc2V0LiBUbyBmaXgg
dGhpcywgd2UgbmVlZCB0byBhZGQgdGhlIGZha2Ugb2Zmc2V0IGp1c3QgbGlrZSB0aGUKPiBkcml2
ZXItPmZvcHMtPm1tYXAoKSBjb2RlIHBhdGguCj4gCj4gRml4ZXM6IGM0MDA2OWNiN2JkNiAoImRy
bTogYWRkIG1tYXAoKSB0byBkcm1fZ2VtX29iamVjdF9mdW5jcyIpCj4gQ2M6IEdlcmQgSG9mZm1h
bm4gPGtyYXhlbEByZWRoYXQuY29tPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
Cj4gLS0tCj4gSSByYW4gaW50byB0aGlzIHdoaWxlIHdvcmtpbmcgb24gY29udmVydGluZyB2Z2Vt
IHRvIHNobWVtIGhlbHBlcnMgYW5kCj4gdGhlIElHVCB2Z2VtX2Jhc2ljIGRtYWJ1Zi1tbWFwIHRl
c3QgZmFpbGVkLiBUaGlzIGZpeGVzIHNobWVtLCBidXQgSQo+IGhhdmUgY2hlY2tlZCBhbnkgb3Ro
ZXIgdXNlcnMgb2YgdGhlIG5ldyBtbWFwIGhvb2suCj4gUm9iCj4gCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fcHJpbWUuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3By
aW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPiBpbmRleCAwODE0MjExYjBmM2Yu
LjVkMDY2OTBhMmU5ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPiBAQCAtNzEzLDYgKzcxMyw4IEBA
IGludCBkcm1fZ2VtX3ByaW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICAJc3RydWN0IGZpbGUgKmZpbDsKPiAgCWludCByZXQ7
Cj4gIAo+ICsJdm1hLT52bV9wZ29mZiArPSBkcm1fdm1hX25vZGVfc3RhcnQoJm9iai0+dm1hX25v
ZGUpOwo+ICsKPiAgCWlmIChvYmotPmZ1bmNzICYmIG9iai0+ZnVuY3MtPm1tYXApIHsKPiAgCQly
ZXQgPSBvYmotPmZ1bmNzLT5tbWFwKG9iaiwgdm1hKTsKPiAgCQlpZiAocmV0KQo+IEBAIC03Mzcs
OCArNzM5LDYgQEAgaW50IGRybV9nZW1fcHJpbWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Km9iaiwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gIAlpZiAocmV0KQo+ICAJCWdvdG8g
b3V0Owo+ICAKPiAtCXZtYS0+dm1fcGdvZmYgKz0gZHJtX3ZtYV9ub2RlX3N0YXJ0KCZvYmotPnZt
YV9ub2RlKTsKPiAtCj4gIAlyZXQgPSBvYmotPmRldi0+ZHJpdmVyLT5mb3BzLT5tbWFwKGZpbCwg
dm1hKTsKPiAgCj4gIAlkcm1fdm1hX25vZGVfcmV2b2tlKCZvYmotPnZtYV9ub2RlLCBwcml2KTsK
PiAtLSAKPiAyLjIwLjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
