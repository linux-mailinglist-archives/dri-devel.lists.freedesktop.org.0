Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A260012DB8
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8506489E65;
	Fri,  3 May 2019 12:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DCE89E65
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:35:09 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t76so6946720wmt.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2019 05:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=b7bzcRpq6iQaFYnlRWIHwOcIOhGEB2LMUCjRpfHIEsY=;
 b=nFs5hIO7lc/2eefDWP4DwY8s1I//xPDGyjmnSPaPRROlQkrvrYlbvaDDC4pCnWymo9
 t7K8WtB7qtWKJt/ZQCEW46App/FaZSzphTGMPQwnIO+Hjr+6TMVESMvw/8nHUSuIjmPW
 QtBR6mBhVKFHyH6ZzifIJEm4pHyQvCj7XTh42JYRINeHrNCMlEv5ybHwCxji5LyCQFg9
 G0d2Px4dW91Zd/Q5I1O/vlOWB+muQlKdsGX1ovbTWbWp9g/z/tVJynYO+fK3yKp6aTMi
 c5Yu4TjK/aPoXTymBpdryBhzMEqKV0ex7luZmkXsPHZkAfIFPC/r4o+H158bA0vdGldt
 UPuA==
X-Gm-Message-State: APjAAAUDmc5wsRUvBvBU7ebSA6IkWMvzM5hFrbbKyt84MVzEMZ7OVToC
 KDZcLXKEP2OEy8nM3ME7NsX7ZxWJ
X-Google-Smtp-Source: APXvYqxSQ9qKsK1feVRmHh3ut1oNydlVz+c7/oPAaaRLDbhEwdmvjqYjwdr3mj5CSkDaUCwq5KzMAQ==
X-Received: by 2002:a1c:35c3:: with SMTP id c186mr6469623wma.135.1556886908153; 
 Fri, 03 May 2019 05:35:08 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b184sm2861292wmh.17.2019.05.03.05.35.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 05:35:07 -0700 (PDT)
Subject: Re: [PATCH 10/12] drm/amdgpu: add independent DMA-buf export v3
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190426123638.40221-1-christian.koenig@amd.com>
 <20190426123638.40221-10-christian.koenig@amd.com>
 <20190430141638.GT3271@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <09619fce-fa36-2bbc-ad24-7814748a84e0@gmail.com>
Date: Fri, 3 May 2019 14:35:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430141638.GT3271@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=b7bzcRpq6iQaFYnlRWIHwOcIOhGEB2LMUCjRpfHIEsY=;
 b=IeN5qPUDrWcgz48lyMt/XG++aiMyB3Gh/AdQ/1WOwcSlUyARtOpezvPiEvRUElm3rK
 Z/g7tyJIG8vKJoeeNg+D/LuEY3AUIruAa++TVoxfBAljaVwFu6g1nIRKeKg3sIDx49Cy
 PknpyLteYiCQSAeKZG8OVL5qcmaLZuqrbfvJqOl1gIz+84jGnWbBcG/p85vl7OLPBrQH
 Jms+WDJwQZF3lmAJ2LbX+DjP8elAL4z8XAW/oHR7a7Z4QMiaSOdAoDxOrNAl+rTe4BRI
 7nlKm7STwKwYTzfdIakUaDpHyheence7P87PHk7kLgsXxxR2N893NKSIPEbZUCp70xi8
 jPOQ==
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
Reply-To: christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDQuMTkgdW0gMTY6MTYgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IFtTTklQXQo+PiAg
IC8qKgo+PiAtICogYW1kZ3B1X2dlbV9tYXBfYXR0YWNoIC0gJmRtYV9idWZfb3BzLmF0dGFjaCBp
bXBsZW1lbnRhdGlvbgo+PiAtICogQGRtYV9idWY6IFNoYXJlZCBETUEgYnVmZmVyCj4+ICsgKiBh
bWRncHVfZ2VtX3Bpbl9kbWFfYnVmIC0gJmRtYV9idWZfb3BzLnBpbl9kbWFfYnVmIGltcGxlbWVu
dGF0aW9uCj4+ICsgKgo+PiArICogQGRtYV9idWY6IERNQS1idWYgdG8gcGluIGluIG1lbW9yeQo+
PiArICoKPj4gKyAqIFBpbiB0aGUgQk8gd2hpY2ggaXMgYmFja2luZyB0aGUgRE1BLWJ1ZiBzbyB0
aGF0IGl0IGNhbid0IG1vdmUgYW55IG1vcmUuCj4+ICsgKi8KPj4gK3N0YXRpYyBpbnQgYW1kZ3B1
X2dlbV9waW5fZG1hX2J1ZihzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZikKPj4gK3sKPj4gKwlzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiA9IGRtYV9idWYtPnByaXY7Cj4+ICsJc3RydWN0IGFtZGdw
dV9ibyAqYm8gPSBnZW1fdG9fYW1kZ3B1X2JvKG9iaik7Cj4+ICsKPj4gKwkvKiBwaW4gYnVmZmVy
IGludG8gR1RUICovCj4+ICsJcmV0dXJuIGFtZGdwdV9ib19waW4oYm8sIEFNREdQVV9HRU1fRE9N
QUlOX0dUVCk7Cj4gVGhpcyBpcyBraW5kYSB3aGF0IEkgbWVhbiB3aXRoICJzaG91bGRuJ3Qgd2Ug
cGluIHRoZSBhdHRhY2htZW50IiAtIGFmYWl1aQo+IHRoaXMgY2FuIGZhaWwgaXMgc29tZW9uZSBh
bHJlYWR5IHBpbm5lZCB0aGUgYnVmZmVyIGludG8gdnJhbS4gQW5kIHRoYXQKPiBraW5kIG9mIGNo
ZWNraW5nIGlzIHN1cHBvc2VkIHRvIGhhcHBlbiBpbiB0aGUgYnVmZmVyIGF0dGFjaG1lbnQuCgpX
aHkgaXMgdGhhdCBzdXBwb3NlZCB0byBoYXBwZW4gb24gdGhlIGF0dGFjaG1lbnQ/IEkgbWVhbiBp
dCBjb3VsZCBiZSAKbmljZSB0byBoYXZlIGZvciBkZWJ1Z2dpbmcsIGJ1dCBJIHN0aWxsIGRvbid0
IHNlZSBhbnkgcHJhY3RpY2FsIHJlYXNvbiAKZm9yIHRoaXMuCgo+IEFsc28gd2lsbCBwMnAgcGlu
IGludG8gVlJBTSBpZiBhbGwgYXR0YWNobWVudHMgYXJlIHAycCBjYXBhYmxlPyBPciBpcyB5b3Vy
Cj4gcGxhbiB0byByZXF1aXJlIGR5bmFtaWMgaW52YWxpZGF0ZSB0byBhdm9pZCBmcmFnbWVudGlu
ZyB2cmFtIGJhZGx5IHdpdGgKPiBwaW5uZWQgc3R1ZmYgeW91IGNhbid0IG1vdmU/CgpNeSBwbGFu
IHdhcyB0byBtYWtlIGR5bmFtaWMgaW52YWxpZGF0aW9uIGEgbXVzdCBoYXZlIGZvciBQMlAsIGV4
YWN0bHkgCmZvciB0aGUgcmVhc29uIHlvdSBub3RlZC4KCj4gKy8qKgo+ICsgKiBhbWRncHVfZ2Vt
X2RtYV9idWZfYXR0YWNoIC0gJmRtYV9idWZfb3BzLmF0dGFjaCBpbXBsZW1lbnRhdGlvbgo+ICsg
Kgo+ICsgKiBAZG1hX2J1ZjogRE1BLWJ1ZiB3ZSBhdHRhY2ggdG8KPiAgICAqIEBhdHRhY2g6IERN
QS1idWYgYXR0YWNobWVudAo+ICAgICoKPiArICogUmV0dXJuczoKPiArICogQWx3YXlzIHplcm8g
Zm9yIHN1Y2Nlc3MuCj4gKyAqLwo+ICtzdGF0aWMgaW50IGFtZGdwdV9nZW1fZG1hX2J1Zl9hdHRh
Y2goc3RydWN0IGRtYV9idWYgKmRtYV9idWYsCj4gKwkJCQkgICAgIHN0cnVjdCBkbWFfYnVmX2F0
dGFjaG1lbnQgKmF0dGFjaCkKPiArewo+ICsJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSBk
bWFfYnVmLT5wcml2Owo+ICsJc3RydWN0IGFtZGdwdV9ibyAqYm8gPSBnZW1fdG9fYW1kZ3B1X2Jv
KG9iaik7Cj4gKwo+ICsJLyogTWFrZSBzdXJlIHRoZSBidWZmZXIgaXMgcGlubmVkIHdoZW4gdXNl
cnNwYWNlIGRpZG4ndCBzZXQgR1RUIGFzCj4gKwkgKiBwcmVmZXJyZWQgZG9tYWluLiBUaGlzIGF2
b2lkIHBpbmcvcG9uZyBzaXR1YXRpb25zIHdpdGggc2NhbiBvdXQgQk9zLgo+ICsJICovCj4gKwlp
ZiAoIShiby0+cHJlZmVycmVkX2RvbWFpbnMgJiBBTURHUFVfR0VNX0RPTUFJTl9HVFQpKQo+ICsJ
CWF0dGFjaC0+aW52YWxpZGF0ZSA9IE5VTEw7Cj4gTm90IGZvbGxvd2luZyBoZXJlIGF0IGFsbC4g
SWYgdGhlIEJPIGNhbid0IGJlIGluIEdUVCBJJ2QgZ3Vlc3MgeW91IHNob3VsZAo+IHJlamVjdCB0
aGUgYXR0YWNoIG91dHJpZ2h0LCBzaW5jZSB0aGUgcGlubmluZy9tYXAgbGF0ZXIgb24gd2lsbCBm
YWlsIEkKPiBndWVzcz8gQXQgbGVhc3QgSSdtIG5vdCBtYWtpbmcgdGhlIGNvbm5lY3Rpb24gd2l0
aCB3aHkgZHluYW1pYyBkbWEtYnVmCj4gd29uJ3Qgd29yayBhbnltb3JlLCBzaW5jZSBkeW5hbWlj
IGRtYS1idWYgaXMgdG8gbWFrZSBwMnAgb2YgYm8gaW4gdnJhbQo+IHdvcmsgYmV0dGVyLCB3aGlj
aCBpcyBleGFjdGx5IHdoYXQgdGhpcyBoZXJlIHNlZW1zIHRvIGNoZWNrIGZvci4KPgo+IE9yIGlz
IHRoaXMganVzdCBhIHF1aWNrIGNoZWNrIHVudGlsIHlvdSBhZGQgZnVsbCBwMnAgc3VwcG9ydD8K
Pgo+IENvdW50IG1lIGNvbmZ1c2VkIC4uLgoKV2VsbCBjb21wbGV0ZWx5IGFtZGdwdSBpbnRlcm5h
bCBoYW5kbGluZyBoZXJlLiBLZXkgcG9pbnQgaXMgd2UgaGF2ZSBib3RoIApwcmVmZXJyZWRfZG9t
YWlucyBhcyB3ZWxsIGFzIGFsbG93ZWRfZG9tYWlucy4KCkR1cmluZyBjb21tYW5kIHN1Ym1pc3Np
b24gd2UgYWx3YXlzIHRyeSB0byBtb3ZlIGEgQk8gdG8gdGhlIApwcmVmZXJyZWRfZG9tYWlucyBh
Z2Fpbi4KCk5vdyB3aGF0IGNvdWxkIGhhcHBlbiBpZiB3ZSBkb24ndCBoYXZlIHRoaXMgY2hlY2sg
aXMgdGhlIGZvbGxvd2luZzoKCjEuIEJPIGlzIGFsbG9jYXRlIGluIFZSQU0uIEFuZCBwcmVmZXJy
ZWRfZG9tYWlucyBzYXlzIG9ubHkgVlJBTSBwbGVhc2UsIApidXQgYWxsb3dlZF9kb21haW5zIHNh
eXMgVlJBTSBvciBHVFQuCgoyLiBETUEtYnVmIEltcG9ydGVyIGNvbWVzIGFsb25nIGFuZCBtb3Zl
cyB0aGUgQk8gdG8gR1RULCB3aGljaCBpcyAKcGVyZmVjdGx5IHZhbGlkIGJlY2F1c2Ugb2YgdGhl
IGFsbG93ZWRfZG9tYWlucy4KCjMuIENvbW1hbmQgc3VibWlzc2lvbiBpcyBtYWRlIGFuZCBtb3Zl
cyB0aGUgQk8gdG8gVlJBTSBhZ2Fpbi4KCjQuIEltcG9ydGVyIGNvbWVzIGFsb25nIGFuZCBtb3Zl
cyB0aGUgQk8gdG8gR1RULgouLi4uCgpFLmcuIGEgbmljZSBwaW5nL3Bvbmcgc2l0dWF0aW9uIHdo
aWNoIGp1c3QgZWF0cyB1cCBtZW1vcnkgYmFuZHdpZHRoLgoKQ2hyaXN0aWFuLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
