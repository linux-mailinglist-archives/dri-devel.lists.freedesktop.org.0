Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68018116EFC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF9C6E463;
	Mon,  9 Dec 2019 14:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3559D6E466
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:32:34 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1ieK58-0000zC-N0; Mon, 09 Dec 2019 15:32:14 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: a.hajda@samsung.com
Subject: [PATCH v5 2/6] drm/bridge/synopsys: dsi: move phy_ops callbacks
 around panel enablement
Date: Mon,  9 Dec 2019 15:31:26 +0100
Message-Id: <20191209143130.4553-3-heiko@sntech.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209143130.4553-1-heiko@sntech.de>
References: <20191209143130.4553-1-heiko@sntech.de>
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
Cc: bivvy.bi@rock-chips.com, jernej.skrabec@siol.net, xzy.xu@rock-chips.com,
 kuninori.morimoto.gx@renesas.com, jonas@kwiboo.se, sean@poorly.run,
 narmstrong@baylibre.com, philippe.cornu@st.com,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com, yannick.fertre@st.com,
 linux-rockchip@lists.infradead.org, nickey.yang@rock-chips.com,
 eddie.cai@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>, sam@ravnborg.org,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHRoZW9icm9tYS1zeXN0ZW1zLmNv
bT4KCklmIGltcGxlbWVudGF0aW9uLXNwZWNpZmljIHBoeV9vcHMgbmVlZCB0byBiZSBkZWZpbmVk
IHRoZXkgcHJvYmFibHkKc2hvdWxkIGJlIGVuYWJsZWQgYmVmb3JlIHRyeWluZyB0byB0YWxrIHRv
IHRoZSBwYW5lbCBhbmQgZGlzYWJsZWQgb25seQphZnRlciB0aGUgcGFuZWwgd2FzIGRpc2FibGVk
LgoKUmlnaHQgbm93IHRoZXkgYXJlIGVuYWJsZWQgbGFzdCBhbmQgZGlzYWJsZWQgZmlyc3QsIHNv
IG1pZ2h0IG1ha2UgaXQKaW1wb3NzaWJsZSB0byB0YWxrIHRvIHNvbWUgcGFuZWxzIC0gZXhhbXBs
ZSBmb3IgdGhpcyBiZWluZyB0aGUgcHgzMAp3aXRoIGFuIGV4dGVybmFsIElubm9zaWxpY29uIGRw
aHkgdGhhdCBuZWVkcyB0aGUgcGh5IHRvIGJlIGVuYWJsZWQKdG8gdHJhbnNmZXIgY29tbWFuZHMg
dG8gdGhlIHBhbmVsLgoKU28gbW92ZSB0aGUgY2FsbHMgYXBwcm9wcmlhdGVseS4KCmNoYW5nZWQg
aW4gdjU6Ci0gcmViYXNlZCBvbiB0b3Agb2YgNS41LXJjMQotIG1lcmdlZCB3aXRoIGRzaSB0aW1p
bmcgY2hhbmdlIHRvIHByZXZlbnQgb3JkZXJpbmcgY29uZmxpY3RzCgpTaWduZWQtb2ZmLWJ5OiBI
ZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAdGhlb2Jyb21hLXN5c3RlbXMuY29tPgpSZXZp
ZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgpUZXN0ZWQt
Ynk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+ClJldmlld2VkLWJ5OiBQ
aGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyB8IDEzICsrKysrKy0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jCmluZGV4IGJmZTAwNjFlNTRhMi4u
YjE4MzUxYjY3NjBhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LW1pcGktZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1t
aXBpLWRzaS5jCkBAIC04MTAsOSArODEwLDYgQEAgc3RhdGljIHZvaWQgZHdfbWlwaV9kc2lfYnJp
ZGdlX3Bvc3RfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogCXN0cnVjdCBkd19t
aXBpX2RzaSAqZHNpID0gYnJpZGdlX3RvX2RzaShicmlkZ2UpOwogCWNvbnN0IHN0cnVjdCBkd19t
aXBpX2RzaV9waHlfb3BzICpwaHlfb3BzID0gZHNpLT5wbGF0X2RhdGEtPnBoeV9vcHM7CiAKLQlp
ZiAocGh5X29wcy0+cG93ZXJfb2ZmKQotCQlwaHlfb3BzLT5wb3dlcl9vZmYoZHNpLT5wbGF0X2Rh
dGEtPnByaXZfZGF0YSk7Ci0KIAkvKgogCSAqIFN3aXRjaCB0byBjb21tYW5kIG1vZGUgYmVmb3Jl
IHBhbmVsLWJyaWRnZSBwb3N0X2Rpc2FibGUgJgogCSAqIHBhbmVsIHVucHJlcGFyZS4KQEAgLTgy
OSw2ICs4MjYsOSBAQCBzdGF0aWMgdm9pZCBkd19taXBpX2RzaV9icmlkZ2VfcG9zdF9kaXNhYmxl
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCiAJICovCiAJZHNpLT5wYW5lbF9icmlkZ2UtPmZ1
bmNzLT5wb3N0X2Rpc2FibGUoZHNpLT5wYW5lbF9icmlkZ2UpOwogCisJaWYgKHBoeV9vcHMtPnBv
d2VyX29mZikKKwkJcGh5X29wcy0+cG93ZXJfb2ZmKGRzaS0+cGxhdF9kYXRhLT5wcml2X2RhdGEp
OworCiAJaWYgKGRzaS0+c2xhdmUpIHsKIAkJZHdfbWlwaV9kc2lfZGlzYWJsZShkc2ktPnNsYXZl
KTsKIAkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRzaS0+c2xhdmUtPnBjbGspOwpAQCAtODk1LDYg
Kzg5NSw5IEBAIHN0YXRpYyB2b2lkIGR3X21pcGlfZHNpX21vZGVfc2V0KHN0cnVjdCBkd19taXBp
X2RzaSAqZHNpLAogCiAJLyogU3dpdGNoIHRvIGNtZCBtb2RlIGZvciBwYW5lbC1icmlkZ2UgcHJl
X2VuYWJsZSAmIHBhbmVsIHByZXBhcmUgKi8KIAlkd19taXBpX2RzaV9zZXRfbW9kZShkc2ksIDAp
OworCisJaWYgKHBoeV9vcHMtPnBvd2VyX29uKQorCQlwaHlfb3BzLT5wb3dlcl9vbihkc2ktPnBs
YXRfZGF0YS0+cHJpdl9kYXRhKTsKIH0KIAogc3RhdGljIHZvaWQgZHdfbWlwaV9kc2lfYnJpZGdl
X21vZGVfc2V0KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCkBAIC05MTEsMTUgKzkxNCwxMSBA
QCBzdGF0aWMgdm9pZCBkd19taXBpX2RzaV9icmlkZ2VfbW9kZV9zZXQoc3RydWN0IGRybV9icmlk
Z2UgKmJyaWRnZSwKIHN0YXRpYyB2b2lkIGR3X21pcGlfZHNpX2JyaWRnZV9lbmFibGUoc3RydWN0
IGRybV9icmlkZ2UgKmJyaWRnZSkKIHsKIAlzdHJ1Y3QgZHdfbWlwaV9kc2kgKmRzaSA9IGJyaWRn
ZV90b19kc2koYnJpZGdlKTsKLQljb25zdCBzdHJ1Y3QgZHdfbWlwaV9kc2lfcGh5X29wcyAqcGh5
X29wcyA9IGRzaS0+cGxhdF9kYXRhLT5waHlfb3BzOwogCiAJLyogU3dpdGNoIHRvIHZpZGVvIG1v
ZGUgZm9yIHBhbmVsLWJyaWRnZSBlbmFibGUgJiBwYW5lbCBlbmFibGUgKi8KIAlkd19taXBpX2Rz
aV9zZXRfbW9kZShkc2ksIE1JUElfRFNJX01PREVfVklERU8pOwogCWlmIChkc2ktPnNsYXZlKQog
CQlkd19taXBpX2RzaV9zZXRfbW9kZShkc2ktPnNsYXZlLCBNSVBJX0RTSV9NT0RFX1ZJREVPKTsK
LQotCWlmIChwaHlfb3BzLT5wb3dlcl9vbikKLQkJcGh5X29wcy0+cG93ZXJfb24oZHNpLT5wbGF0
X2RhdGEtPnByaXZfZGF0YSk7CiB9CiAKIHN0YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cwotLSAK
Mi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
