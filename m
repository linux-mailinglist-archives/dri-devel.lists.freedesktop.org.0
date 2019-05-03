Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 054A712999
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 10:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376818987A;
	Fri,  3 May 2019 08:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272C58987A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 08:13:09 +0000 (UTC)
X-Originating-IP: 90.88.149.145
Received: from localhost.localdomain
 (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr [90.88.149.145])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E4CB220007;
 Fri,  3 May 2019 08:13:04 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/4] drm/vc4: Binner BO management improvements
Date: Fri,  3 May 2019 10:12:38 +0200
Message-Id: <20190503081242.29039-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Eben Upton <eben@raspberrypi.org>, David Airlie <airlied@linux.ie>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hhbmdlcyBzaW5jZSB2NzoKKiBNb3ZlZCB0aGUgdXNlZCBib29sIHRvIHZjNF92M2RfYmluX2Jv
X2dldCBpbiBvcmRlciB0byBjaGVjayBpdCBsb2NrZWQgYW5kCiAgYXZvaWQgYSBwb3NzaWJsZSBy
YWNlIGNvbmRpdGlvbjsKCkNoYW5nZXMgc2luY2UgdjY6CiogUmVtb3ZlZCB2YzRfdjNkX2Jpbl9i
b19wdXQgZnJvbSBlcnJvciBwYXRoczsKKiBBZGRlZCBXQVJOX09OX09OQ0Ugd2hlbiBubyBiaW4g
Qk8gYXQgcmVmY291bnQgcmVsZWFzZS4KCkNoYW5nZXMgc2luY2UgdjU6CiogRml4IG1vcmUgbG9j
a2luZyBtaXN0YWtlczsKKiBJbnRyb2R1Y2UgZ2V0L3B1dCBoZWxwZXJzOwoqIEdyYWJiZWQgYSBy
ZWZlcmVuY2Ugd2hlbiBzdWJtaXR0aW5nIGFuIGV4ZWMgam9iIHdpdGggYSBiaW5uZXIgc2xvdC4K
KiBBZGRyZXNzZWQgbWlzYyBjb21tZW50cy4KCkNoYW5nZXMgc2luY2UgdjQ6CiogVXNlZCBhIGty
ZWYgb24gdGhlIGJpbm5lciBibyBpbnN0ZWFkIG9mIGZpcnN0b3Blbi9sYXN0Y2xvc2U7CiogQWRk
ZWQgYSBtdXRleCB0byBwcmV2ZW50IHJhY2UgY29uZGl0aW9uczsKKiBUb29rIGNhcmUgb2YgZW5h
YmxpbmcgdGhlIE9PTSBpbnRlcnJ1cHQgd2hlbiB3ZSBoYXZlIGEgYmlubmVyIEJPIGFsbG9jYXRl
ZC4KCkNoYW5nZXMgc2luY2UgdjM6CiogU3BsaXQgY2hhbmdlcyBpbnRvIG1vcmUgY29tbWl0cyB3
aGVuIHBvc3NpYmxlOwoqIFJld29ya2VkIGJpbm5lciBibyBhbGxvYyBjb25kaXRpb24gYXMgZGlz
Y3Vzc2VkLgoKQ2hhbmdlcyBzaW5jZSB2MjoKKiBSZW1vdmVkIGRlcHJlY2F0ZWQgc2VudGVuY2Ug
YWJvdXQgZnJpc3RvcGVuOwoqIEFkZGVkIGNvbGxlY3RlZCBSZXZpZXdlZC1CeSB0YWdzLgoKQ2hh
bmdlcyBzaW5jZSB2MToKKiBTcXVhc2hlZCB0aGUgdHdvIGZpbmFsIHBhdGNoZXMgaW50byBvbmUu
CgpQYXVsIEtvY2lhbGtvd3NraSAoNCk6CiAgZHJtL3ZjNDogUmVmb3JtYXQgYW5kIHRoZSBiaW5u
ZXIgYm8gYWxsb2NhdGlvbiBoZWxwZXIKICBkcm0vdmM0OiBDaGVjayBmb3IgVjNEIGJlZm9yZSBi
aW5uZXIgYm8gYWxsb2MKICBkcm0vdmM0OiBDaGVjayBmb3IgdGhlIGJpbm5lciBibyBiZWZvcmUg
aGFuZGxpbmcgT09NIGludGVycnVwdAogIGRybS92YzQ6IEFsbG9jYXRlIGJpbm5lciBibyB3aGVu
IHN0YXJ0aW5nIHRvIHVzZSB0aGUgVjNECgogZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfYm8uYyAg
fCAzMSArKysrKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2Rydi5jIHwgIDYg
KysrCiBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kcnYuaCB8IDE0ICsrKysrKysKIGRyaXZlcnMv
Z3B1L2RybS92YzQvdmM0X2dlbS5jIHwgMTEgKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vdmM0L3Zj
NF9pcnEuYyB8IDIwICsrKysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3YzZC5jIHwg
NzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KIDYgZmlsZXMgY2hhbmdlZCwg
MTM0IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
