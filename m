Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C2AEF9DB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 10:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DC36E97E;
	Tue,  5 Nov 2019 09:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E2A6E97E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 09:45:39 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-hGa26RoLOyKMkEb1TjOuPQ-1; Tue, 05 Nov 2019 04:45:34 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 698DB8017DD;
 Tue,  5 Nov 2019 09:45:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05CC25D9C9;
 Tue,  5 Nov 2019 09:45:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1F4AA17535; Tue,  5 Nov 2019 10:45:32 +0100 (CET)
Date: Tue, 5 Nov 2019 10:45:32 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/9] drm/ast: Split ast_set_ext_reg() into color and
 threshold function
Message-ID: <20191105094532.wxb7wzd7zi525cdo@sirius.home.kraxel.org>
References: <20191028154928.4058-1-tzimmermann@suse.de>
 <20191028154928.4058-5-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191028154928.4058-5-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: hGa26RoLOyKMkEb1TjOuPQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572947139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lTIShV79ydOPWMLPrQWYgdJNuVJ2tZbYrLGV/QELicg=;
 b=fExvGcpv9uBp6UWmDnvA8uEEP/cmLP7axvC6+/JlRd+Gyp/F+EBKbQSCtfXgHqThyvtp9p
 GBTAaOmA6ECTs3QwW2u88kRM84uQb40FYoLwDNObJ4Hu9489lggoCcIqNmE2GCYQwqQuNC
 3fSDqsExrLCsUt14fgoL3H49I9UV764=
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
Cc: airlied@redhat.com, chen@aspeedtech.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMDQ6NDk6MjNQTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSW4gYXN0X3NldF9leHRfcmVnKCkgc2V0cyBzZXZlcmFsIGZyYW1lYnVmZmVy
IG9wdGlvbnMgYW5kIENSVCB0aHJlc2hvbGQKPiBwYXJhbWV0ZXJzLiBUaGUgZm9ybWVyIGlzIG1v
c3RseSBzdGF0ZSBvZiB0aGUgcHJpbWFyeSBwbGFuZTsgdGhlIGxhdHRlcgo+IGlzIGNvbnN0YW50
LiBIZW5jZSwgc3BsaXQgdGhlIGZ1bmN0aW9uIGluIHR3byBhbmQgbWFrZSBpdCB3b3JrIHdpdGgK
PiBhdG9taWMgbW9kZXNldHRpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CgpBY2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVs
QHJlZGhhdC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCAx
NSArKysrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21v
ZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYwo+IGluZGV4IGIzZjgyYzJkMjc0
ZC4uNWZlYjY4NzE5MWUwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21v
ZGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYwo+IEBAIC00MTksMTEg
KzQxOSwxMCBAQCBzdGF0aWMgdm9pZCBhc3Rfc2V0X2RjbGtfcmVnKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptbwo+ICAJCQkgICAgICAgKChjbGtfaW5m
by0+cGFyYW0zICYgMHgzKSA8PCA0KSk7Cj4gIH0KPiAgCj4gLXN0YXRpYyB2b2lkIGFzdF9zZXRf
ZXh0X3JlZyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpt
b2RlLAo+IC0JCQkgICAgIHN0cnVjdCBhc3RfdmJpb3NfbW9kZV9pbmZvICp2Ymlvc19tb2RlKQo+
ICtzdGF0aWMgdm9pZCBhc3Rfc2V0X2NvbG9yX3JlZyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4g
KwkJCSAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiKQo+ICB7Cj4gIAlzdHJ1
Y3QgYXN0X3ByaXZhdGUgKmFzdCA9IGNydGMtPmRldi0+ZGV2X3ByaXZhdGU7Cj4gLQljb25zdCBz
dHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9IGNydGMtPnByaW1hcnktPmZiOwo+ICAJdTgganJl
Z0EwID0gMCwganJlZ0EzID0gMCwganJlZ0E4ID0gMDsKPiAgCj4gIAlzd2l0Y2ggKGZiLT5mb3Jt
YXQtPmNwcFswXSAqIDgpIHsKPiBAQCAtNDQ4LDYgKzQ0NywxMSBAQCBzdGF0aWMgdm9pZCBhc3Rf
c2V0X2V4dF9yZWcoc3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9k
ZSAqbW9kZQo+ICAJYXN0X3NldF9pbmRleF9yZWdfbWFzayhhc3QsIEFTVF9JT19DUlRDX1BPUlQs
IDB4YTAsIDB4OGYsIGpyZWdBMCk7Cj4gIAlhc3Rfc2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNU
X0lPX0NSVENfUE9SVCwgMHhhMywgMHhmMCwganJlZ0EzKTsKPiAgCWFzdF9zZXRfaW5kZXhfcmVn
X21hc2soYXN0LCBBU1RfSU9fQ1JUQ19QT1JULCAweGE4LCAweGZkLCBqcmVnQTgpOwo+ICt9Cj4g
Kwo+ICtzdGF0aWMgdm9pZCBhc3Rfc2V0X2NydHRoZF9yZWcoc3RydWN0IGRybV9jcnRjICpjcnRj
KQo+ICt7Cj4gKwlzdHJ1Y3QgYXN0X3ByaXZhdGUgKmFzdCA9IGNydGMtPmRldi0+ZGV2X3ByaXZh
dGU7Cj4gIAo+ICAJLyogU2V0IFRocmVzaG9sZCAqLwo+ICAJaWYgKGFzdC0+Y2hpcCA9PSBBU1Qy
MzAwIHx8IGFzdC0+Y2hpcCA9PSBBU1QyNDAwIHx8Cj4gQEAgLTQ2Nyw3ICs0NzEsNyBAQCBzdGF0
aWMgdm9pZCBhc3Rfc2V0X2V4dF9yZWcoc3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJt
X2Rpc3BsYXlfbW9kZSAqbW9kZQo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBhc3Rfc2V0X3N5bmNf
cmVnKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2Rl
LAo+IC0JCSAgICAgIHN0cnVjdCBhc3RfdmJpb3NfbW9kZV9pbmZvICp2Ymlvc19tb2RlKQo+ICsJ
CQkgICAgIHN0cnVjdCBhc3RfdmJpb3NfbW9kZV9pbmZvICp2Ymlvc19tb2RlKQo+ICB7Cj4gIAlz
dHJ1Y3QgYXN0X3ByaXZhdGUgKmFzdCA9IGRldi0+ZGV2X3ByaXZhdGU7Cj4gIAl1OCBqcmVnOwo+
IEBAIC01OTUsNyArNTk5LDggQEAgc3RhdGljIGludCBhc3RfY3J0Y19tb2RlX3NldChzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMsCj4gIAlhc3Rfc2V0X2NydGNfcmVnKGNydGMsIGFkanVzdGVkX21vZGUs
ICZ2Ymlvc19tb2RlKTsKPiAgCWFzdF9zZXRfb2Zmc2V0X3JlZyhjcnRjKTsKPiAgCWFzdF9zZXRf
ZGNsa19yZWcoZGV2LCBhZGp1c3RlZF9tb2RlLCAmdmJpb3NfbW9kZSk7Cj4gLQlhc3Rfc2V0X2V4
dF9yZWcoY3J0YywgYWRqdXN0ZWRfbW9kZSwgJnZiaW9zX21vZGUpOwo+ICsJYXN0X3NldF9jb2xv
cl9yZWcoY3J0YywgZmIpOwo+ICsJYXN0X3NldF9jcnR0aGRfcmVnKGNydGMpOwo+ICAJYXN0X3Nl
dF9zeW5jX3JlZyhkZXYsIGFkanVzdGVkX21vZGUsICZ2Ymlvc19tb2RlKTsKPiAgCWFzdF9zZXRf
ZGFjX3JlZyhjcnRjLCBhZGp1c3RlZF9tb2RlLCAmdmJpb3NfbW9kZSk7Cj4gIAo+IC0tIAo+IDIu
MjMuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
