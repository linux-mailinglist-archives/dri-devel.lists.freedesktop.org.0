Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18143E7175
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 13:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC9B6E821;
	Mon, 28 Oct 2019 12:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E296E827
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 12:37:24 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w9so8950729wmm.5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 05:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bg9aLkLfUTKxfTeyqBBqYQUC6FBcU6JFCGZpsj7ndqo=;
 b=DHwuMt3YIlWo3MD3xm4pzyUlZx7nBK1Z+zqtjDquDAW2VcuDsBdWmMRf02CxTz7R3o
 3A6ziu5oBd2OWJaOyK89QkC/fQytzY9upac83MxO6GlW0Q0gFIOLwTd6+x2jUBzNntlR
 nt4yYWDP23jiq71g1wxhmo3ydd8z/eAe/tMDdWucDfcqPUG1ITrjsms4DmNI6CdKBALt
 RhjcXIvtuX9onYkC1WSIi0li0edYNtUz3fB0ZCGM/7vLaKIvhMRt5XJhE1A4nlK59c6p
 d7j8ZAWALf8GZe9PIzuaRfbhZyRZXeo3JVEkA+o+8bv/CjW/6qpe/c/WrsMC7jsEvbIk
 ePJQ==
X-Gm-Message-State: APjAAAWXOnxIKunesKlticopLONJf1n5p2zDChzudSWFp/tMqdRG0b0O
 z60DlZKEOXhXYYP92MS/2xN7H2QT
X-Google-Smtp-Source: APXvYqxpcT29LVgI0DeFwPxEVNHmlij5DXWLor/hWFeN/TxAmFIMyCHnv/wteFbMeZzEJoUhBzKEYQ==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr14331126wmc.134.1572266243371; 
 Mon, 28 Oct 2019 05:37:23 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id s5sm6636457wmj.37.2019.10.28.05.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 05:37:22 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 01/12] memory: tegra: Add gr2d and gr3d to DRM IOMMU group
Date: Mon, 28 Oct 2019 13:37:07 +0100
Message-Id: <20191028123718.3890217-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028123718.3890217-1-thierry.reding@gmail.com>
References: <20191028123718.3890217-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bg9aLkLfUTKxfTeyqBBqYQUC6FBcU6JFCGZpsj7ndqo=;
 b=MuwMV2cBGxuqCseG0mrSuo2oEvO+qF05OvTD8L+6lNTugvzPzoiKT+VY9diDTdYKG8
 acfPCvEoUa9+cFd0RDm2Lw4lyQCNTAmY/zlOUrU+IbaMfpKN19jayd4th1nY6KvNTAD4
 ADRVRtQ21cB6xqaHotOeynOJUsLGOMEQis5E6HOvf69sIbLOPmXgz4V68rl6PZRNTLIy
 XnfDvtD+YT8iT+c2ABJjzJcgiGpBCUtTwx9Su9y/famXUIvv4sksw7ze1towVxWUHaBF
 vUukp4WxovOCCi8WVyEM2LLZqADbaFzfaKmYfScJYqba4qlkw5LKfRsz3VKn52kbB7JQ
 tQcg==
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
Cc: linux-tegra@vger.kernel.org, Sachin Nikam <snikam@nvidia.com>,
 dri-devel@lists.freedesktop.org, Puneet Saxena <puneets@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkFsbCBvZiB0aGUgZGV2
aWNlcyBtYWtpbmcgdXAgdGhlIFRlZ3JhIERSTSBkZXZpY2Ugd2FudCB0byBzaGFyZSBhIHNpbmds
ZQpJT01NVSBkb21haW4uIFB1dCB0aGVtIGludG8gYSBzaW5nbGUgZ3JvdXAgdG8gYWxsb3cgdGhl
bSB0byBkbyB0aGF0LgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZp
ZGlhLmNvbT4KLS0tCiBkcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTExNC5jIHwgMTAgKysrKysr
LS0tLQogZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmExMjQuYyB8ICA4ICsrKysrLS0tCiBkcml2
ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTMwLmMgIHwgMTEgKysrKysrKy0tLS0KIDMgZmlsZXMgY2hh
bmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tZW1vcnkvdGVncmEvdGVncmExMTQuYyBiL2RyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3Jh
MTE0LmMKaW5kZXggYWM4MzUxYjViZWViLi40OGVmMDFjM2ZmOTAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMTE0LmMKKysrIGIvZHJpdmVycy9tZW1vcnkvdGVncmEvdGVn
cmExMTQuYwpAQCAtOTA5LDE2ICs5MDksMTggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB0ZWdyYV9z
bW11X3N3Z3JvdXAgdGVncmExMTRfc3dncm91cHNbXSA9IHsKIAl7IC5uYW1lID0gInRzZWMiLCAg
ICAgIC5zd2dyb3VwID0gVEVHUkFfU1dHUk9VUF9UU0VDLCAgICAgIC5yZWcgPSAweDI5NCB9LAog
fTsKIAotc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCB0ZWdyYTExNF9ncm91cF9kaXNwbGF5W10g
PSB7CitzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHRlZ3JhMTE0X2dyb3VwX2RybVtdID0gewog
CVRFR1JBX1NXR1JPVVBfREMsCiAJVEVHUkFfU1dHUk9VUF9EQ0IsCisJVEVHUkFfU1dHUk9VUF9H
MiwKKwlURUdSQV9TV0dST1VQX05WLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCB0ZWdyYV9z
bW11X2dyb3VwX3NvYyB0ZWdyYTExNF9ncm91cHNbXSA9IHsKIAl7Ci0JCS5uYW1lID0gImRpc3Bs
YXkiLAotCQkuc3dncm91cHMgPSB0ZWdyYTExNF9ncm91cF9kaXNwbGF5LAotCQkubnVtX3N3Z3Jv
dXBzID0gQVJSQVlfU0laRSh0ZWdyYTExNF9ncm91cF9kaXNwbGF5KSwKKwkJLm5hbWUgPSAiZHJt
IiwKKwkJLnN3Z3JvdXBzID0gdGVncmExMTRfZ3JvdXBfZHJtLAorCQkubnVtX3N3Z3JvdXBzID0g
QVJSQVlfU0laRSh0ZWdyYTExNF9ncm91cF9kcm0pLAogCX0sCiB9OwogCmRpZmYgLS1naXQgYS9k
cml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTEyNC5jIGIvZHJpdmVycy9tZW1vcnkvdGVncmEvdGVn
cmExMjQuYwppbmRleCA1ZDBjY2IyYmUyMDYuLjYyYjMwYjFiOTY3NyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tZW1vcnkvdGVncmEvdGVncmExMjQuYworKysgYi9kcml2ZXJzL21lbW9yeS90ZWdyYS90
ZWdyYTEyNC5jCkBAIC05NzQsMTYgKzk3NCwxOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHRlZ3Jh
X3NtbXVfc3dncm91cCB0ZWdyYTEyNF9zd2dyb3Vwc1tdID0gewogCXsgLm5hbWUgPSAidmkiLCAg
ICAgICAgLnN3Z3JvdXAgPSBURUdSQV9TV0dST1VQX1ZJLCAgICAgICAgLnJlZyA9IDB4MjgwIH0s
CiB9OwogCi1zdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHRlZ3JhMTI0X2dyb3VwX2Rpc3BsYXlb
XSA9IHsKK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgdGVncmExMjRfZ3JvdXBfZHJtW10gPSB7
CiAJVEVHUkFfU1dHUk9VUF9EQywKIAlURUdSQV9TV0dST1VQX0RDQiwKKwlURUdSQV9TV0dST1VQ
X0dQVSwKKwlURUdSQV9TV0dST1VQX1ZJQywKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdGVn
cmFfc21tdV9ncm91cF9zb2MgdGVncmExMjRfZ3JvdXBzW10gPSB7CiAJewogCQkubmFtZSA9ICJk
aXNwbGF5IiwKLQkJLnN3Z3JvdXBzID0gdGVncmExMjRfZ3JvdXBfZGlzcGxheSwKLQkJLm51bV9z
d2dyb3VwcyA9IEFSUkFZX1NJWkUodGVncmExMjRfZ3JvdXBfZGlzcGxheSksCisJCS5zd2dyb3Vw
cyA9IHRlZ3JhMTI0X2dyb3VwX2RybSwKKwkJLm51bV9zd2dyb3VwcyA9IEFSUkFZX1NJWkUodGVn
cmExMjRfZ3JvdXBfZHJtKSwKIAl9LAogfTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZW1vcnkv
dGVncmEvdGVncmEzMC5jIGIvZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmEzMC5jCmluZGV4IDE0
Nzg4ZmMyZjllOC4uODk0N2JlZTZkMDMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lbW9yeS90ZWdy
YS90ZWdyYTMwLmMKKysrIGIvZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmEzMC5jCkBAIC05MzEs
MTYgKzkzMSwxOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHRlZ3JhX3NtbXVfc3dncm91cCB0ZWdy
YTMwX3N3Z3JvdXBzW10gPSB7CiAJeyAubmFtZSA9ICJpc3AiLCAgLnN3Z3JvdXAgPSBURUdSQV9T
V0dST1VQX0lTUCwgIC5yZWcgPSAweDI1OCB9LAogfTsKIAotc3RhdGljIGNvbnN0IHVuc2lnbmVk
IGludCB0ZWdyYTMwX2dyb3VwX2Rpc3BsYXlbXSA9IHsKK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBp
bnQgdGVncmEzMF9ncm91cF9kcm1bXSA9IHsKIAlURUdSQV9TV0dST1VQX0RDLAogCVRFR1JBX1NX
R1JPVVBfRENCLAorCVRFR1JBX1NXR1JPVVBfRzIsCisJVEVHUkFfU1dHUk9VUF9OViwKKwlURUdS
QV9TV0dST1VQX05WMiwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdGVncmFfc21tdV9ncm91
cF9zb2MgdGVncmEzMF9ncm91cHNbXSA9IHsKIAl7Ci0JCS5uYW1lID0gImRpc3BsYXkiLAotCQku
c3dncm91cHMgPSB0ZWdyYTMwX2dyb3VwX2Rpc3BsYXksCi0JCS5udW1fc3dncm91cHMgPSBBUlJB
WV9TSVpFKHRlZ3JhMzBfZ3JvdXBfZGlzcGxheSksCisJCS5uYW1lID0gImRybSIsCisJCS5zd2dy
b3VwcyA9IHRlZ3JhMzBfZ3JvdXBfZHJtLAorCQkubnVtX3N3Z3JvdXBzID0gQVJSQVlfU0laRSh0
ZWdyYTMwX2dyb3VwX2RybSksCiAJfSwKIH07CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
