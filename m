Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57371107B34
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 00:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2106E35F;
	Fri, 22 Nov 2019 23:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30636E297
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 23:16:45 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-gx-aRPNWOvqCwVNXY1ysdA-1; Fri, 22 Nov 2019 18:16:43 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C97EB80268F;
 Fri, 22 Nov 2019 23:16:41 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B52F819C4F;
 Fri, 22 Nov 2019 23:16:38 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915: Assume 100% brightness when not in DPCD control
 mode
Date: Fri, 22 Nov 2019 18:16:00 -0500
Message-Id: <20191122231616.2574-3-lyude@redhat.com>
In-Reply-To: <20191122231616.2574-1-lyude@redhat.com>
References: <20191122231616.2574-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: gx-aRPNWOvqCwVNXY1ysdA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574464604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=da6B5wryqdm0pwrGQUg8GuLhSMwcGO0NU0zcKvLukpU=;
 b=gAGEpBKWF50HkReA/gloCJf98AJcDhMHs03rEuY461BNC+aHHRoLwe4zttqcCXtPiI9XVd
 QGIAZEw8H8RWdwsYnPYWrOWo+U5RPyfQphFPXLbupQhs+WlHU+7QveGpH0nA4zWuQy5h+R
 FC++Z92/AdgjK+/DhgsvbuNc24gBX9g=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5IHdlIGFsd2F5cyBkZXRlcm1pbmUgdGhlIGluaXRpYWwgcGFuZWwgYnJpZ2h0bmVz
cyBsZXZlbCBieQpzaW1wbHkgcmVhZGluZyB0aGUgdmFsdWUgZnJvbSBEUF9FRFBfQkFDS0xJR0hU
X0JSSUdIVE5FU1NfTVNCL0xTQi4gVGhpcwpzZWVtcyB3cm9uZyB0aG91Z2gsIGJlY2F1c2UgaWYg
dGhlIHBhbmVsIGlzIG5vdCBjdXJyZW50bHkgaW4gRFBDRApjb250cm9sIG1vZGUgdGhlcmUncyBu
b3QgcmVhbGx5IGFueSByZWFzb24gd2h5IHRoZXJlIHdvdWxkIGJlIGFueQpicmlnaHRuZXNzIHZh
bHVlIHByb2dyYW1tZWQgaW4gdGhlIGZpcnN0IHBsYWNlLgoKVGhpcyBhcHBlYXJzIHRvIGJlIHRo
ZSBjYXNlIG9uIHRoZSBMZW5vdm8gVGhpbmtQYWQgWDEgRXh0cmVtZSAybmQKR2VuZXJhdGlvbiwg
d2hlcmUgdGhlIGRlZmF1bHQgdmFsdWUgaW4gdGhlc2UgcmVnaXN0ZXJzIGlzIGFsd2F5cyAwIG9u
CmJvb3QgZGVzcGl0ZSB0aGUgZmFjdCB0aGUgcGFuZWwgcnVucyBhdCBtYXggYnJpZ2h0bmVzcyBi
eSBkZWZhdWx0LgpHZXR0aW5nIHRoZSBpbml0aWFsIGJyaWdodG5lc3MgdmFsdWUgY29ycmVjdCBo
ZXJlIGlzIGltcG9ydGFudCBhcyB3ZWxsLApzaW5jZSB0aGUgcGFuZWwgb24gdGhpcyBsYXB0b3Ag
ZG9lc24ndCBiZWhhdmUgd2VsbCBpZiBpdCdzIGV2ZXIgcHV0IGludG8KRFBDRCBjb250cm9sIG1v
ZGUgd2hpbGUgdGhlIGJyaWdodG5lc3MgbGV2ZWwgaXMgcHJvZ3JhbW1lZCB0byAwLgoKU28sIGxl
dCdzIGZpeCB0aGlzIGJ5IGNoZWNraW5nIHdoYXQgdGhlIGN1cnJlbnQgYmFja2xpZ2h0IGNvbnRy
b2wgbW9kZQppcyBiZWZvcmUgcmVhZGluZyB0aGUgYnJpZ2h0bmVzcyBsZXZlbC4gSWYgaXQncyBp
biBEUENEIGNvbnRyb2wgbW9kZSwgd2UKcmV0dXJuIHRoZSBwcm9ncmFtbWVkIGJyaWdodG5lc3Mg
bGV2ZWwuIE90aGVyd2lzZSB3ZSBhc3N1bWUgMTAwJQpicmlnaHRuZXNzIGFuZCByZXR1cm4gdGhl
IGhpZ2hlc3QgcG9zc2libGUgYnJpZ2h0bmVzcyBsZXZlbC4gVGhpcyBhbHNvCnByZXZlbnRzIHVz
IGZyb20gYWNjaWRlbnRhbGx5IHByb2dyYW1taW5nIGEgYnJpZ2h0bmVzcyBsZXZlbCBvZiAwLgoK
VGhpcyBpcyBvbmUgb2YgdGhlIG1hbnkgZml4ZXMgdGhhdCBnZXRzIGJhY2tsaWdodCBjb250cm9s
cyB3b3JraW5nIG9uCnRoZSBUaGlua1BhZCBYMSBFeHRyZW1lIDJuZCBHZW5lcmF0aW9uIHdpdGgg
b3B0aW9uYWwgNEsgQU1PTEVEIHNjcmVlbi4KClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5
dWRlQHJlZGhhdC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2F1
eF9iYWNrbGlnaHQuYyB8IDE1ICsrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwX2F1eF9iYWNrbGlnaHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHBfYXV4X2JhY2tsaWdodC5jCmluZGV4IGZhZDQ3MDU1M2NmOS4uMGJmODc3MmJjN2JiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2F1eF9iYWNr
bGlnaHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2F1eF9i
YWNrbGlnaHQuYwpAQCAtNTksOCArNTksMjMgQEAgc3RhdGljIHUzMiBpbnRlbF9kcF9hdXhfZ2V0
X2JhY2tsaWdodChzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3IpCiB7CiAJc3RydWN0
IGludGVsX2RwICppbnRlbF9kcCA9IGVuY190b19pbnRlbF9kcCgmY29ubmVjdG9yLT5lbmNvZGVy
LT5iYXNlKTsKIAl1OCByZWFkX3ZhbFsyXSA9IHsgMHgwIH07CisJdTggY29udHJvbF9yZWc7CiAJ
dTE2IGxldmVsID0gMDsKIAorCWlmIChkcm1fZHBfZHBjZF9yZWFkYigmaW50ZWxfZHAtPmF1eCwg
RFBfRURQX0RJU1BMQVlfQ09OVFJPTF9SRUdJU1RFUiwKKwkJCSAgICAgICZjb250cm9sX3JlZykg
IT0gMSkgeworCQlEUk1fREVCVUdfS01TKCJGYWlsZWQgdG8gcmVhZCB0aGUgRFBDRCByZWdpc3Rl
ciAweCV4XG4iLAorCQkJICAgICAgRFBfRURQX0RJU1BMQVlfQ09OVFJPTF9SRUdJU1RFUik7CisJ
CXJldHVybiAwOworCX0KKworCS8qCisJICogSWYgd2UncmUgbm90IGluIERQQ0QgY29udHJvbCBt
b2RlIHlldCwgdGhlIHByb2dyYW1tZWQgYnJpZ2h0bmVzcworCSAqIHZhbHVlIGlzIG1lYW5pbmds
ZXNzIGFuZCB3ZSBzaG91bGQgYXNzdW1lIG1heCBicmlnaHRuZXNzCisJICovCisJaWYgKCEoY29u
dHJvbF9yZWcgJiBEUF9FRFBfQkFDS0xJR0hUX0NPTlRST0xfTU9ERV9EUENEKSkKKwkJcmV0dXJu
IGNvbm5lY3Rvci0+cGFuZWwuYmFja2xpZ2h0Lm1heDsKKwogCWlmIChkcm1fZHBfZHBjZF9yZWFk
KCZpbnRlbF9kcC0+YXV4LCBEUF9FRFBfQkFDS0xJR0hUX0JSSUdIVE5FU1NfTVNCLAogCQkJICAg
ICAmcmVhZF92YWwsIHNpemVvZihyZWFkX3ZhbCkpIDwgMCkgewogCQlEUk1fREVCVUdfS01TKCJG
YWlsZWQgdG8gcmVhZCBEUENEIHJlZ2lzdGVyIDB4JXhcbiIsCi0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
