Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F591D7BBF
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 16:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313B7893A8;
	Mon, 18 May 2020 14:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936D989613
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 14:47:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id u188so10778939wmu.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 07:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UkZ44/lQexaiAuqk8DxjUrCVRK+zf/xnIVyGH73ABs4=;
 b=OTe63lCWPV6FMz6eVN1kyYNVLCZtWamdWqtq3pVc6grCatGFUQxVxV2JdlUr1FbAmn
 Axyx8O0a+KO8jzkwzoHY2wDJBVdw7dAnR53oIpKnluH/uT9MZIaeMJHtlS3KDPz3siXo
 P+WE1El4/mgpXkB3/w5Ac4mz9GHxj9BtDWDpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UkZ44/lQexaiAuqk8DxjUrCVRK+zf/xnIVyGH73ABs4=;
 b=VOqb9YgrBTuWZgxAyDK/9uamw84xX51YnEDjeRvs+pgvmyG5EqhZRoeU64BNdHc+4+
 YY4d0pwxOVfinFE5/TW3zyENViuX+qfW9jAOj2ceYSiz8jJlzHwBFlRNX8zdThcIj1R4
 jjMmNrwSNpHH5zN/FJS8UOEdajO3IqPzR0mjNx0xbyxPtKweRi+xM6o7HrKnxtW9IdV0
 vlFWALeLQqHYFlyvyrGn4bsTj8zJz8p0bDs62mIWwhfX+hIfZiJWF2hJi6+167oaVehB
 vAJLDKFAYyAL1tCyjC4Ll42+k44OZJtX2LBaw2KHStkFImQkYmdWAWd+o+RkUvrLnZOD
 NS4g==
X-Gm-Message-State: AOAM533P0ynkoN3fNZy/RiEGe3KFAUsLI9O8WcidEbmSWwaqKwDgUhO2
 yFnlMeNmL8xvTrs4lsf6Lc2ojTZK2yQ=
X-Google-Smtp-Source: ABdhPJyImGeCy/iHnIJSy6xA1dB4PluNZXoR3lInjvpWursPdjPpQmEp/PxCIWlxOZ2wxX3P61sToA==
X-Received: by 2002:a1c:1dd8:: with SMTP id
 d207mr19221629wmd.125.1589813267255; 
 Mon, 18 May 2020 07:47:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p9sm17148643wrj.29.2020.05.18.07.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 07:47:46 -0700 (PDT)
Date: Mon, 18 May 2020 16:47:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 2/4] drm: Help unconfuse gcc, avoid accidental impossible
 unsigned comparisons
Message-ID: <20200518144744.GP206103@phenom.ffwll.local>
References: <20200516212330.13633-1-chris@chris-wilson.co.uk>
 <20200516212330.13633-2-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200516212330.13633-2-chris@chris-wilson.co.uk>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBNYXkgMTYsIDIwMjAgYXQgMTA6MjM6MjhQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYzogSW4gZnVuY3Rpb24g
4oCYZHJtX2NsaWVudF9maXJtd2FyZV9jb25maWfigJk6Cj4gLi9pbmNsdWRlL2xpbnV4L2JpdHMu
aDoyNjoyODogd2FybmluZzogY29tcGFyaXNvbiBvZiB1bnNpZ25lZCBleHByZXNzaW9uIDwgMCBp
cyBhbHdheXMgZmFsc2UgWy1XdHlwZS1saW1pdHNdCj4gICAgX19idWlsdGluX2NvbnN0YW50X3Ao
KGwpID4gKGgpKSwgKGwpID4gKGgpLCAwKSkpCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2ls
c29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpUb29rIG1lIGEgd2hpbGUgdG8gc3BvdCB3
aGVyZSB0aGlzIGdvZXMgYm9vbSwga2luZGEgd29uZGVyIHdoZXRoZXIgd2UKc2hvdWxkIGhhdmUg
YW4KCglpZiAoV0FSTl9PTighY29ubmVjdG9yX2NvdW50KSkKCQlyZXR1cm4gLUVJTlZBTDsKCnNv
bWV3aGVyZSBpbiBoZXJlLiBKdXN0IGZvciBiZWx0cyZzdXNwZW5kZXJzIGFwcHJvYWNoLgoKQW55
d2F5IHRoaXMgbG9va3MgZ29vZC4KClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9k
ZXNldC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNl
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCj4gaW5kZXggNzQ0MzEx
NGJkNzEzLi42ZTk1MzBkZjA3MzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9j
bGllbnRfbW9kZXNldC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNl
dC5jCj4gQEAgLTU2Myw3ICs1NjMsNyBAQCBzdGF0aWMgYm9vbCBkcm1fY2xpZW50X2Zpcm13YXJl
X2NvbmZpZyhzdHJ1Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCwKPiAgCQkJCSAgICAgICBzdHJ1
Y3QgZHJtX2NsaWVudF9vZmZzZXQgKm9mZnNldHMsCj4gIAkJCQkgICAgICAgYm9vbCAqZW5hYmxl
ZCwgaW50IHdpZHRoLCBpbnQgaGVpZ2h0KQo+ICB7Cj4gLQl1bnNpZ25lZCBpbnQgY291bnQgPSBt
aW5fdCh1bnNpZ25lZCBpbnQsIGNvbm5lY3Rvcl9jb3VudCwgQklUU19QRVJfTE9ORyk7Cj4gKwlj
b25zdCBpbnQgY291bnQgPSBtaW5fdCh1bnNpZ25lZCBpbnQsIGNvbm5lY3Rvcl9jb3VudCwgQklU
U19QRVJfTE9ORyk7Cj4gIAl1bnNpZ25lZCBsb25nIGNvbm5fY29uZmlndXJlZCwgY29ubl9zZXEs
IG1hc2s7Cj4gIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gY2xpZW50LT5kZXY7Cj4gIAlpbnQg
aSwgajsKPiAtLSAKPiAyLjIwLjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVy
LCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
