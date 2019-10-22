Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3613BE0047
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 11:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EBB6E4A6;
	Tue, 22 Oct 2019 09:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C28C6E4A6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 09:06:26 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l10so16689329wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 02:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=PyGCvO7yvNngDSlKne/jPIBQIOZ8tTLnmw0W5bAjlwU=;
 b=LiIG1TiELHQDGKkTBN1S8khpr+pdqd+jit50vqD5dhGd7aev1DsDtbqFOIcNMb54CR
 hYiGVyJyjM54w0vxVIC5doqGQc9lhW4kNe5RQ7GG12H/6aHQ3H2m87o0ZQhm7RgjhjQj
 sEi6vWjqAcwhmfrDhMi7esIdRvKgMLGm8WOkSCgs96QAFjTpaLeylaD8udeyURhYqjo9
 ZeApeShA0HWOuk8uXC9oxrVLofaGhgTha7Oaz74jyLqXRhkIG2eQj9pLU/peAhveUCxW
 mKsTUzDhuZ/4E0hWa9yYdPRbr2/u52A56e7HXh7z4gn3Ilx8VygOrsia2YcEXvuk5qBU
 yBIQ==
X-Gm-Message-State: APjAAAXqXD1uYd062juAbNNNJZ5Tu9ZalwUmXN6KufRgR5+rf7tdBQKD
 lo0pw/R3cZHjlfRJKn1oFwYOGA==
X-Google-Smtp-Source: APXvYqy2fd1mENqTQBbR51G8er0W9sr/MDy2gD3lxGrfLEDYlBc17QL0TksiwYQJ7DnJdB6ruwOSZw==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr677053wrn.307.1571735184750;
 Tue, 22 Oct 2019 02:06:24 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id o4sm29085790wre.91.2019.10.22.02.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 02:06:23 -0700 (PDT)
Date: Tue, 22 Oct 2019 11:06:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/virtio: move byteorder handling into
 virtio_gpu_cmd_transfer_to_host_2d function
Message-ID: <20191022090621.GC11828@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20191018122352.17019-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018122352.17019-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=PyGCvO7yvNngDSlKne/jPIBQIOZ8tTLnmw0W5bAjlwU=;
 b=SayvGCoATdUpVcqC5Nwb/Sou7TjKYsh9ojvvGVV8K5ekqJw8hWQYFqk7ccV1PNxCQm
 7RFUnb4kYlZLQeKaquDcdN0QFyIwzCtEJnVox4MWShZG/G8g6OgjccKLMwZB3jasR0Sm
 Y5botJm/1SEJuXUrc8F6mqZOcBhUqth2/0Bqg=
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDI6MjM6NTJQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBCZSBjb25zaXN0ZW50IHdpdGggdGhlIHJlc3Qgb2YgdGhlIGNvZGUgYmFzZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCkFzc3Vt
aW5nIHNwYXJzZSBpcyBhbGwgc3RpbGwgcGxlYXNlZDoKClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X2Rydi5oICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9wbGFuZS5jIHwgMTIgKysrKysrLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV92cS5jICAgIHwgMTIgKysrKysrLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9kcnYuaAo+IGluZGV4IDMxNGUwMmY5NGQ5Yy4uMGI1NmJhMDA1ZTI1IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaAo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaAo+IEBAIC0yNjcsOCArMjY3LDggQEAgdm9p
ZCB2aXJ0aW9fZ3B1X2NtZF91bnJlZl9yZXNvdXJjZShzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2Ug
KnZnZGV2LAo+ICAJCQkJICAgdWludDMyX3QgcmVzb3VyY2VfaWQpOwo+ICB2b2lkIHZpcnRpb19n
cHVfY21kX3RyYW5zZmVyX3RvX2hvc3RfMmQoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2Rl
diwKPiAgCQkJCQl1aW50NjRfdCBvZmZzZXQsCj4gLQkJCQkJX19sZTMyIHdpZHRoLCBfX2xlMzIg
aGVpZ2h0LAo+IC0JCQkJCV9fbGUzMiB4LCBfX2xlMzIgeSwKPiArCQkJCQl1aW50MzJfdCB3aWR0
aCwgdWludDMyX3QgaGVpZ2h0LAo+ICsJCQkJCXVpbnQzMl90IHgsIHVpbnQzMl90IHksCj4gIAkJ
CQkJc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0X2FycmF5ICpvYmpzLAo+ICAJCQkJCXN0cnVjdCB2
aXJ0aW9fZ3B1X2ZlbmNlICpmZW5jZSk7Cj4gIHZvaWQgdmlydGlvX2dwdV9jbWRfcmVzb3VyY2Vf
Zmx1c2goc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfcGxhbmUuYwo+IGluZGV4IGY0YjczNjAyODJjZS4uMzkwNTI0MTQzMTM5IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMKPiBAQCAtMTMyLDEwICsx
MzIsMTAgQEAgc3RhdGljIHZvaWQgdmlydGlvX2dwdV9wcmltYXJ5X3BsYW5lX3VwZGF0ZShzdHJ1
Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiAgCQkJdmlydGlvX2dwdV9hcnJheV9hZGRfb2JqKG9ianMs
IHZnZmItPmJhc2Uub2JqWzBdKTsKPiAgCQkJdmlydGlvX2dwdV9jbWRfdHJhbnNmZXJfdG9faG9z
dF8yZAo+ICAJCQkJKHZnZGV2LCAwLAo+IC0JCQkJIGNwdV90b19sZTMyKHBsYW5lLT5zdGF0ZS0+
c3JjX3cgPj4gMTYpLAo+IC0JCQkJIGNwdV90b19sZTMyKHBsYW5lLT5zdGF0ZS0+c3JjX2ggPj4g
MTYpLAo+IC0JCQkJIGNwdV90b19sZTMyKHBsYW5lLT5zdGF0ZS0+c3JjX3ggPj4gMTYpLAo+IC0J
CQkJIGNwdV90b19sZTMyKHBsYW5lLT5zdGF0ZS0+c3JjX3kgPj4gMTYpLAo+ICsJCQkJIHBsYW5l
LT5zdGF0ZS0+c3JjX3cgPj4gMTYsCj4gKwkJCQkgcGxhbmUtPnN0YXRlLT5zcmNfaCA+PiAxNiwK
PiArCQkJCSBwbGFuZS0+c3RhdGUtPnNyY194ID4+IDE2LAo+ICsJCQkJIHBsYW5lLT5zdGF0ZS0+
c3JjX3kgPj4gMTYsCj4gIAkJCQkgb2JqcywgTlVMTCk7Cj4gIAkJfQo+ICAJfSBlbHNlIHsKPiBA
QCAtMjM0LDggKzIzNCw4IEBAIHN0YXRpYyB2b2lkIHZpcnRpb19ncHVfY3Vyc29yX3BsYW5lX3Vw
ZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiAgCQl2aXJ0aW9fZ3B1X2FycmF5X2FkZF9v
Ymoob2JqcywgdmdmYi0+YmFzZS5vYmpbMF0pOwo+ICAJCXZpcnRpb19ncHVfY21kX3RyYW5zZmVy
X3RvX2hvc3RfMmQKPiAgCQkJKHZnZGV2LCAwLAo+IC0JCQkgY3B1X3RvX2xlMzIocGxhbmUtPnN0
YXRlLT5jcnRjX3cpLAo+IC0JCQkgY3B1X3RvX2xlMzIocGxhbmUtPnN0YXRlLT5jcnRjX2gpLAo+
ICsJCQkgcGxhbmUtPnN0YXRlLT5jcnRjX3csCj4gKwkJCSBwbGFuZS0+c3RhdGUtPmNydGNfaCwK
PiAgCQkJIDAsIDAsIG9ianMsIHZnZmItPmZlbmNlKTsKPiAgCQlkbWFfZmVuY2Vfd2FpdCgmdmdm
Yi0+ZmVuY2UtPmYsIHRydWUpOwo+ICAJCWRtYV9mZW5jZV9wdXQoJnZnZmItPmZlbmNlLT5mKTsK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYwo+IGluZGV4IDgwMTc2ZjM3OWFkNS4uNzRh
ZDNiYzNlYmU4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92
cS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMKPiBAQCAtNTQ5
LDggKzU0OSw4IEBAIHZvaWQgdmlydGlvX2dwdV9jbWRfcmVzb3VyY2VfZmx1c2goc3RydWN0IHZp
cnRpb19ncHVfZGV2aWNlICp2Z2RldiwKPiAgCj4gIHZvaWQgdmlydGlvX2dwdV9jbWRfdHJhbnNm
ZXJfdG9faG9zdF8yZChzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LAo+ICAJCQkJCXVp
bnQ2NF90IG9mZnNldCwKPiAtCQkJCQlfX2xlMzIgd2lkdGgsIF9fbGUzMiBoZWlnaHQsCj4gLQkJ
CQkJX19sZTMyIHgsIF9fbGUzMiB5LAo+ICsJCQkJCXVpbnQzMl90IHdpZHRoLCB1aW50MzJfdCBo
ZWlnaHQsCj4gKwkJCQkJdWludDMyX3QgeCwgdWludDMyX3QgeSwKPiAgCQkJCQlzdHJ1Y3Qgdmly
dGlvX2dwdV9vYmplY3RfYXJyYXkgKm9ianMsCj4gIAkJCQkJc3RydWN0IHZpcnRpb19ncHVfZmVu
Y2UgKmZlbmNlKQo+ICB7Cj4gQEAgLTU3MSwxMCArNTcxLDEwIEBAIHZvaWQgdmlydGlvX2dwdV9j
bWRfdHJhbnNmZXJfdG9faG9zdF8yZChzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LAo+
ICAJY21kX3AtPmhkci50eXBlID0gY3B1X3RvX2xlMzIoVklSVElPX0dQVV9DTURfVFJBTlNGRVJf
VE9fSE9TVF8yRCk7Cj4gIAljbWRfcC0+cmVzb3VyY2VfaWQgPSBjcHVfdG9fbGUzMihiby0+aHdf
cmVzX2hhbmRsZSk7Cj4gIAljbWRfcC0+b2Zmc2V0ID0gY3B1X3RvX2xlNjQob2Zmc2V0KTsKPiAt
CWNtZF9wLT5yLndpZHRoID0gd2lkdGg7Cj4gLQljbWRfcC0+ci5oZWlnaHQgPSBoZWlnaHQ7Cj4g
LQljbWRfcC0+ci54ID0geDsKPiAtCWNtZF9wLT5yLnkgPSB5Owo+ICsJY21kX3AtPnIud2lkdGgg
PSBjcHVfdG9fbGUzMih3aWR0aCk7Cj4gKwljbWRfcC0+ci5oZWlnaHQgPSBjcHVfdG9fbGUzMiho
ZWlnaHQpOwo+ICsJY21kX3AtPnIueCA9IGNwdV90b19sZTMyKHgpOwo+ICsJY21kX3AtPnIueSA9
IGNwdV90b19sZTMyKHkpOwo+ICAKPiAgCXZpcnRpb19ncHVfcXVldWVfZmVuY2VkX2N0cmxfYnVm
ZmVyKHZnZGV2LCB2YnVmLCAmY21kX3AtPmhkciwgZmVuY2UpOwo+ICB9Cj4gLS0gCj4gMi4xOC4x
Cj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
