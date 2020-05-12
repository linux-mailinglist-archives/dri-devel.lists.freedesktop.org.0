Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3531CEFF5
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2FB6E8AB;
	Tue, 12 May 2020 09:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C006E89F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:00:01 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f134so8674514wmf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 02:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NZNungkfzjrpX3wvUKHqphES4AQA2BjvgdkrK2cjuiE=;
 b=CLBPuhz5g03xplqY3Lp/3c6jCI7cBpGlK2yI20bsQjZlk+Y0DSRAAzM7Uk0yJ/74fT
 qODjSJnOacCEhx0BQuKhrp9xCJljtl7WlTp/enOv9Yf5zmkcwWAQwPHdsOTS6iInjswc
 E2mZfpyZhXG3pjjGV03WLfeasYqdUTvXYUfyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NZNungkfzjrpX3wvUKHqphES4AQA2BjvgdkrK2cjuiE=;
 b=kmlVn4/31cIDDBRiQSpwos0CDA1oVuCKqlhmx0oLdpJgD91mEDoBlwouKawzSnmYW4
 pKi5q9MzZkwB7l1h27PPrjdqOhuDvkw7Dl7+BPCMExfQSdvYamp5C6CiisI4jckf3oYR
 QlrSQSvVmc6pf4rhtg21YKet7yGprWI5jD7vnHn8NGmX2gNGpy7yJTxruy069F7A4PYB
 J+HCJkvmZLRk1wB1p2pMQxn/Bkjxi55t0pxDlgxTsZWEnJv4bVqEHr8a/Tetv/+CQxIb
 fqQXuL3KnB87d6hpNzDhcXMLpskrn+/6pennJAwB5D2AfXfY5rVepFqx8/rCO9ssfJ5g
 nznQ==
X-Gm-Message-State: AGi0PuY2E/Ge+mQJdMR/buJ86EcTlNScaJF5vh2Tvka1dvEt5zVrKQcw
 9HV7VAalikZiZfafIB+qxDCzq56Nh1w=
X-Google-Smtp-Source: APiQypKft08OoGrIYtbiSYRYQwvgFtVy2fvk5tEE2SUvyg8qKyVKerp+e40UsbcgCmUWXpSeXbccUQ==
X-Received: by 2002:a05:600c:2055:: with SMTP id
 p21mr13223418wmg.127.1589273999661; 
 Tue, 12 May 2020 01:59:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y10sm18845457wrd.95.2020.05.12.01.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 01:59:59 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [RFC 03/17] dma-fence: prime lockdep annotations
Date: Tue, 12 May 2020 10:59:30 +0200
Message-Id: <20200512085944.222637-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VHdvIGluIG9uZSBnbzoKLSBpdCBpcyBhbGxvd2VkIHRvIGNhbGwgZG1hX2ZlbmNlX3dhaXQoKSB3
aGlsZSBob2xkaW5nIGEKICBkbWFfcmVzdl9sb2NrKCkuIFRoaXMgaXMgZnVuZGFtZW50YWwgdG8g
aG93IGV2aWN0aW9uIHdvcmtzIHdpdGggdHRtLAogIHNvIHJlcXVpcmVkLgoKLSBpdCBpcyBhbGxv
d2VkIHRvIGNhbGwgZG1hX2ZlbmNlX3dhaXQoKSBmcm9tIG1lbW9yeSByZWNsYWltIGNvbnRleHRz
LAogIHNwZWNpZmljYWxseSBmcm9tIHNocmlua2VyIGNhbGxiYWNrcyAod2hpY2ggaTkxNSBkb2Vz
KSwgYW5kIGZyb20gbW11CiAgbm90aWZpZXIgY2FsbGJhY2tzICh3aGljaCBhbWRncHUgZG9lcywg
YW5kIHdoaWNoIGk5MTUgc29tZXRpbWVzIGFsc28KICBkb2VzLCBhbmQgcHJvYmFibHkgYWx3YXlz
IHNob3VsZCwgYnV0IHRoYXQncyBraW5kYSBhIGRlYmF0ZSkuIEFsc28KICBmb3Igc3R1ZmYgbGlr
ZSBITU0gd2UgcmVhbGx5IG5lZWQgdG8gYmUgYWJsZSB0byBkbyB0aGlzLCBvciB0aGluZ3MKICBn
ZXQgcmVhbCBkaWNleS4KCkNvbnNlcXVlbmNlIGlzIHRoYXQgYW55IGNyaXRpY2FsIHBhdGggbmVj
ZXNzYXJ5IHRvIGdldCB0byBhCmRtYV9mZW5jZV9zaWduYWwgZm9yIGEgZmVuY2UgbXVzdCBuZXZl
ciBhKSBjYWxsIGRtYV9yZXN2X2xvY2sgbm9yIGIpCmFsbG9jYXRlIG1lbW9yeSB3aXRoIEdGUF9L
RVJORUwuIEFsc28gYnkgaW1wbGljYXRpb24gb2YKZG1hX3Jlc3ZfbG9jaygpLCBubyB1c2Vyc3Bh
Y2UgZmF1bHRpbmcgYWxsb3dlZC4gVGhhdCdzIHNvbWUgc3VwcmVtZWx5Cm9ibm94aW91cyBsaW1p
dGF0aW9ucywgd2hpY2ggaXMgd2h5IHdlIG5lZWQgdG8gc3ByaW5rbGUgdGhlIHJpZ2h0CmFubm90
YXRpb25zIHRvIGFsbCByZWxldmFudCBwYXRocy4KClRoZSBvbmUgYmlnIGxvY2tpbmcgY29udGV4
dCB3ZSdyZSBsZWF2aW5nIG91dCBoZXJlIGlzIG1tdSBub3RpZmllcnMsCmFkZGVkIGluCgpjb21t
aXQgMjNiNjgzOTVjN2M3OGE3NjRlODk2M2ZjMTVhN2NmZDMxOGJmMTg3ZgpBdXRob3I6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkRhdGU6ICAgTW9uIEF1ZyAyNiAyMjox
NDoyMSAyMDE5ICswMjAwCgogICAgbW0vbW11X25vdGlmaWVyczogYWRkIGEgbG9ja2RlcCBtYXAg
Zm9yIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQvZW5kCgp0aGF0IG9uZSBjb3ZlcnMgYSBsb3Qgb2Yg
b3RoZXIgY2FsbHNpdGVzLCBhbmQgaXQncyBhbHNvIGFsbG93ZWQgdG8Kd2FpdCBvbiBkbWEtZmVu
Y2VzIGZyb20gbW11IG5vdGlmaWVycy4gQnV0IHRoZXJlJ3Mgbm8gcmVhZHktbWFkZQpmdW5jdGlv
bnMgZXhwb3NlZCB0byBwcmltZSB0aGlzLCBzbyBJJ3ZlIGxlZnQgaXQgb3V0IGZvciBub3cuCgpD
YzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxp
bmFyby5vcmcKQ2M6IGxpbnV4LXJkbWFAdmdlci5rZXJuZWwub3JnCkNjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzog
Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2RtYS1idWYvZG1hLXJl
c3YuYyB8IDEgKwogaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaCAgfCAxICsKIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1y
ZXN2LmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYwppbmRleCA5OWMwYTMzYzkxOGQuLjM5
MmMzMzZmMDczMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKKysrIGIv
ZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKQEAgLTExNSw2ICsxMTUsNyBAQCBzdGF0aWMgaW50
IF9faW5pdCBkbWFfcmVzdl9sb2NrZGVwKHZvaWQpCiAJaWYgKHJldCA9PSAtRURFQURMSykKIAkJ
ZG1hX3Jlc3ZfbG9ja19zbG93KCZvYmosICZjdHgpOwogCWZzX3JlY2xhaW1fYWNxdWlyZShHRlBf
S0VSTkVMKTsKKwlfX2RtYV9mZW5jZV9taWdodF93YWl0KCk7CiAJZnNfcmVjbGFpbV9yZWxlYXNl
KEdGUF9LRVJORUwpOwogCXd3X211dGV4X3VubG9jaygmb2JqLmxvY2spOwogCXd3X2FjcXVpcmVf
ZmluaSgmY3R4KTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLmggYi9pbmNs
dWRlL2xpbnV4L2RtYS1mZW5jZS5oCmluZGV4IDNmMjg4ZjdkYjJlZi4uMDllMjNhZGIzNTFkIDEw
MDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oCisrKyBiL2luY2x1ZGUvbGludXgv
ZG1hLWZlbmNlLmgKQEAgLTM2MCw2ICszNjAsNyBAQCBkbWFfZmVuY2VfZ2V0X3JjdV9zYWZlKHN0
cnVjdCBkbWFfZmVuY2UgX19yY3UgKipmZW5jZXApCiAjaWZkZWYgQ09ORklHX0xPQ0tERVAKIGJv
b2wgZG1hX2ZlbmNlX2JlZ2luX3NpZ25hbGxpbmcodm9pZCk7CiB2b2lkIGRtYV9mZW5jZV9lbmRf
c2lnbmFsbGluZyhib29sIGNvb2tpZSk7Cit2b2lkIF9fZG1hX2ZlbmNlX21pZ2h0X3dhaXQodm9p
ZCk7CiAjZWxzZQogc3RhdGljIGlubGluZSBib29sIGRtYV9mZW5jZV9iZWdpbl9zaWduYWxsaW5n
KHZvaWQpCiB7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
