Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978F934912E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 12:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B886ED0D;
	Thu, 25 Mar 2021 11:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FE16ED09
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 11:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616672912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fdb6gIONW8kUMlhDAqzxhobcaqn6vxE6B3ns/VvHK2I=;
 b=QYZuiYTuWg48iCo5iJ+85anOCT1vJD9gO5Su+uuf3Fm+a/kbbeu+Z3v/F2OSEEr0te/td2
 Fg1gS7VOibBygS/JYoF4xI2wCwd5A46yl9IPlMZx7pvhUNwzmbLl3iou7fR05dcJeo10ZE
 jQliS48OVEGnOfYV8wRqOyEM/PAmiXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-KJ4WIojJPZ-SAEtYxxTYsQ-1; Thu, 25 Mar 2021 07:48:29 -0400
X-MC-Unique: KJ4WIojJPZ-SAEtYxxTYsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E13D5180FCA9;
 Thu, 25 Mar 2021 11:48:27 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE06D5D9DE;
 Thu, 25 Mar 2021 11:48:25 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/i915/display/vlv_dsi: Do not skip
 panel_pwr_cycle_delay when disabling the panel
Date: Thu, 25 Mar 2021 12:48:22 +0100
Message-Id: <20210325114823.44922-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWZ0ZXIgdGhlIHJlY2VudGx5IGFkZGVkIGNvbW1pdCBmZTBmMWUzYmZkZmUgKCJkcm0vaTkxNTog
U2h1dCBkb3duCmRpc3BsYXlzIGdyYWNlZnVsbHkgb24gcmVib290IiksIHRoZSBEU0kgcGFuZWwg
b24gYSBDaGVycnkgVHJhaWwgYmFzZWQKUHJlZGlhIEJhc2ljIHRhYmxldCB3b3VsZCBubyBsb25n
ZXIgcHJvcGVybHkgbGlnaHQgdXAgYWZ0ZXIgcmVib290LgoKSSd2ZSBtYW5hZ2VkIHRvIHJlcHJv
ZHVjZSB0aGlzIHdpdGhvdXQgcmVib290aW5nIGJ5IGRvaW5nOgpjaHZ0IDM7IGVjaG8gMSA+IC9z
eXMvY2xhc3MvZ3JhcGhpY3MvZmIwL2JsYW5rO1wKZWNobyAwID4gL3N5cy9jbGFzcy9ncmFwaGlj
cy9mYjAvYmxhbmsKCldoaWNoIHJhcGlkbHkgdHVybnMgdGhlIHBhbmVsIG9mZiBhbmQgYmFjayBv
biBhZ2Fpbi4KClRoZSB2bHZfZHNpLmMgY29kZSB1c2VzIGFuIGludGVsX2RzaV9tc2xlZXAoKSBo
ZWxwZXIgZm9yIHRoZSB2YXJpb3VzIGRlbGF5cwp1c2VkIGZvciBwYW5lbCBvbi9vZmYsIHNpbmNl
IHN0YXJ0aW5nIHdpdGggTUlQSS1zZXF1ZW5jZXMgdmVyc2lvbiA+PSAzIHRoZQpkZWxheXMgYXJl
IGFscmVhZHkgaW5jbHVkZWQgaW5zaWRlIHRoZSBNSVBJLXNlcXVlbmNlcy4KClRoZSBwcm9ibGVt
cyBleHBvc2VkIGJ5IHRoZSAiU2h1dCBkb3duIGRpc3BsYXlzIGdyYWNlZnVsbHkgb24gcmVib290
IgpjaGFuZ2UsIHNob3cgdGhhdCB1c2luZyB0aGlzIGhlbHBlciBmb3IgdGhlIHBhbmVsX3B3cl9j
eWNsZV9kZWxheSBpcwpub3QgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLiBUaGlzIGhhcyBub3QgYmVl
biBub3RpY2VkIHVudGlsIG5vdyBiZWNhdXNlCm5vcm1hbGx5IHRoZSBwYW5lbCBuZXZlciBpcyBj
eWNsZWQgb2ZmIGFuZCBkaXJlY3RseSBvbiBhZ2FpbiBpbiBxdWljawpzdWNjZXNzaW9uLgoKQ2hh
bmdlIHRoZSBtc2xlZXAgZm9yIHRoZSBwYW5lbF9wd3JfY3ljbGVfZGVsYXkgdG8gYSBub3JtYWwg
bXNsZWVwKCkKY2FsbCB0byBhdm9pZCB0aGUgcGFuZWwgc3RheWluZyBibGFjayBhZnRlciBhIHF1
aWNrIG9mZiArIG9uIGN5Y2xlLgoKQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+CkZpeGVzOiBmZTBmMWUzYmZkZmUgKCJkcm0vaTkxNTogU2h1dCBkb3du
IGRpc3BsYXlzIGdyYWNlZnVsbHkgb24gcmVib290IikKU2lnbmVkLW9mZi1ieTogSGFucyBkZSBH
b2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L3Zsdl9kc2kuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L3Zsdl9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvdmx2X2RzaS5jCmluZGV4
IGQ1YTNmNjljNWRmMy4uMzhkNWExZjNkZWQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L3Zsdl9kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L3Zsdl9kc2kuYwpAQCAtOTk2LDE0ICs5OTYsMTQgQEAgc3RhdGljIHZvaWQgaW50ZWxfZHNpX3Bv
c3RfZGlzYWJsZShzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwKIAkgKiBGSVhNRSBB
cyB3ZSBkbyB3aXRoIGVEUCwganVzdCBtYWtlIGEgbm90ZSBvZiB0aGUgdGltZSBoZXJlCiAJICog
YW5kIHBlcmZvcm0gdGhlIHdhaXQgYmVmb3JlIHRoZSBuZXh0IHBhbmVsIHBvd2VyIG9uLgogCSAq
LwotCWludGVsX2RzaV9tc2xlZXAoaW50ZWxfZHNpLCBpbnRlbF9kc2ktPnBhbmVsX3B3cl9jeWNs
ZV9kZWxheSk7CisJbXNsZWVwKGludGVsX2RzaS0+cGFuZWxfcHdyX2N5Y2xlX2RlbGF5KTsKIH0K
IAogc3RhdGljIHZvaWQgaW50ZWxfZHNpX3NodXRkb3duKHN0cnVjdCBpbnRlbF9lbmNvZGVyICpl
bmNvZGVyKQogewogCXN0cnVjdCBpbnRlbF9kc2kgKmludGVsX2RzaSA9IGVuY190b19pbnRlbF9k
c2koZW5jb2Rlcik7CiAKLQlpbnRlbF9kc2lfbXNsZWVwKGludGVsX2RzaSwgaW50ZWxfZHNpLT5w
YW5lbF9wd3JfY3ljbGVfZGVsYXkpOworCW1zbGVlcChpbnRlbF9kc2ktPnBhbmVsX3B3cl9jeWNs
ZV9kZWxheSk7CiB9CiAKIHN0YXRpYyBib29sIGludGVsX2RzaV9nZXRfaHdfc3RhdGUoc3RydWN0
IGludGVsX2VuY29kZXIgKmVuY29kZXIsCi0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
