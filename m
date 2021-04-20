Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2815366135
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 22:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577FD6E8DC;
	Tue, 20 Apr 2021 20:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F60A6E8D6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 20:54:02 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 5-20020a9d09050000b029029432d8d8c5so11106009otp.11
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 13:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+9CzNNo6qK0a1HlYtEKpNdFwMAjOkB4iTQg21q+R7WM=;
 b=M5OqeXLSGbs0qLCBnUQlDT7EKkVC6IVdKYnsavsRAjSQpS6unWZZ5Lw/Z+YOVVuPMM
 2vh3sIx6OicI3o1+i2v0Jzs/HY6zeNSb9Rc/uTIPsJbLJ4T1q36erMS4k063B9T4ISBd
 +/yeUf2u2jWgIq5w35bYOJAze8TTx38AMkAXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+9CzNNo6qK0a1HlYtEKpNdFwMAjOkB4iTQg21q+R7WM=;
 b=YooqJ86YL4qH29Q1Plliw6C/q/Rsb/0EHfAsT6rBwXMfi18xE5UFqfu/wvdXFHQbpu
 gNW3t04EO1Acdapyvk3VbSUmPS+iWSsBjJBbfIfYSK6iWbPaQl26auoHiHhgunNSJL3K
 aBRWL66nqmyPnJ776Bcle9F1dfQy6FGeRHFDavppKO4eZ0bLuqxnTGZOEvZnErfhzxZ5
 Q+9vk3azwK84Xs1Q0uzbhR985gugyNMmep0mRi+ORzOI14q2EtpDXig3H9ystIlaMVJj
 KuSP3eT6NVK7+BZjT8uU+pNc8HkSUOJkFaymtyuqKvWjE1WYZ12NqYJyLi3kd1Umqziz
 gRuw==
X-Gm-Message-State: AOAM531DaJucflnQ5JJsZMGXqLWbVTFUUPvmJ318mXrRBuW7CWVlGyyn
 Kq92oFWataDBRvd84SEfb/vJs0QTLcxj5+K9n7T9Dg==
X-Google-Smtp-Source: ABdhPJyrlQs0cmBULqtDtVBa+uZ4Nh42mhpyBDtmuX2s2RBgQeDtV1C9YydrikuGmRegoZJX6KgDX4zN9n0FDdgVmkE=
X-Received: by 2002:a05:6830:2103:: with SMTP id
 i3mr1493179otc.303.1618952041398; 
 Tue, 20 Apr 2021 13:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210416133146.24825-1-tzimmermann@suse.de>
 <20210416133146.24825-6-tzimmermann@suse.de>
 <b7008944-fbe5-bd59-d2a9-ff62bea38237@gmail.com>
 <80012c09-6975-f694-420f-72b2236dcf4e@amd.com>
 <52403618-62f5-2085-c245-e1e98762cccb@suse.de>
 <YH6WJ0p2jGd3Q5Xw@phenom.ffwll.local>
 <a76b44d2-d894-ab4e-ef37-f0feb4326297@amd.com>
In-Reply-To: <a76b44d2-d894-ab4e-ef37-f0feb4326297@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 20 Apr 2021 22:53:50 +0200
Message-ID: <CAKMK7uGmR_US-fy1GTWF4jCnCiRofyDrrJP1qFrE2CKLWbTXBA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>, Dave Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Roland Scheidegger <sroland@vmware.com>, Nirmoy Das <nirmoy.das@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMjAsIDIwMjEgYXQgMTA6MjMgUE0gRmVsaXggS3VlaGxpbmcgPGZlbGl4Lmt1
ZWhsaW5nQGFtZC5jb20+IHdyb3RlOgo+Cj4KPiBBbSAyMDIxLTA0LTIwIHVtIDQ6NTEgYS5tLiBz
Y2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPj4+IFdob2xlIHNlcmllcyBpcyBSZXZpZXdlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4+IFRoYW5rcyBh
IGxvdC4gSWYgSSdtIG5vdCBtaXN0YWtlbiwgdGhlIHBhdGNoZXMgYXQgWzFdIG5lZWQgdG8gZ28g
aW4gZmlyc3QuCj4gPj4gU28gaXQgY291bGQgdGFrZSBhIGEgYml0IHVudGlsIHRoaXMgbGFuZHMu
Cj4gPj4KPiA+PiBPdGhlcndpc2UsIHRoaXMgc2VyaWVzIGNvdWxkIGdvIHRocm91Z2ggdGhlIHNh
bWUgdHJlZSBhcyBbMV0gaWYgbm91dmVhdSBhbmQKPiA+PiB2bXdnZnggZGV2cyBkb24ndCBtaW5k
Lgo+ID4gSSB3b3VsZCBsYW5kIGl0IGFsbCB0aHJvdWdoIGRybS1taXNjLW5leHQuIE1heWJlIGNo
ZWNrIHdpdGggQWxleCBvbiBpcmMKPiA+IGZvciBhbiBhY2sgZm9yIG1lcmdpbmcgdGhhdCB3YXks
IGJ1dCBJIGRvbid0IHRoaW5rIHRoaXMgd2lsbCBjYXVzZSBpc3N1ZXMKPiA+IGFnYWluc3QgdGhl
IGFtZGdwdSB0cmVlLiBMb3RzIG9mIHR0bSBjbGVhbnVwIGhhcyBsYW5kZWQgdGhpcyB3YXkgYWxy
ZWFkeQo+ID4gcGFzdCBmZXcgbW9udGhzLiBPdGhlcndpc2UgeW91IGNvdWxkIGNyZWF0ZSBhIHNt
YWxsIHRvcGljIGJyYW5jaCB3aXRoCj4gPiB0aGVzZSBwYXRjaGVzIGhlcmUgYW5kIHNlbmQgdGhh
dCB0byBBbGV4LCBhbmQgaGUgY2FuIHNvcnQgb3V0IHRoZQo+ID4gaW50ZXJhY3Rpb24gd2l0aCBG
ZWxpeCcgc2VyaWVzLgo+ID4gLURhbmllbAo+Cj4gTXkgcGF0Y2ggc2VyaWVzIGludm9sdmVkIHNv
bWUgcHJldHR5IGZhci1yZWFjaGluZyBjaGFuZ2VzIGluIEtGRAo+IChyZW5hbWluZyBzb21lIHZh
cmlhYmxlcyBpbiBLRkQgYW5kIGFtZGdwdSwgY2hhbmdpbmcgdGhlIEtGRC0+YW1kZ3B1Cj4gaW50
ZXJmYWNlKS4gV2UgYWxyZWFkeSBzdWJtaXR0ZWQgb3RoZXIgcGF0Y2hlcyBvbiB0b3Agb2YgaXQg
dGhhdCBoYXZlCj4gZGVwZW5kZW5jaWVzIG9uIGl0LiBJZiB3ZSBkZWNpZGUgdG8gZGVsaXZlciB0
aGlzIHRocm91Z2ggYSBkaWZmZXJlbnQKPiB0cmVlIGFuZCByZW1vdmUgaXQgZnJvbSBhbWQtc3Rh
Z2luZy1kcm0tbmV4dCwgdGhlcmUgd2lsbCBiZSBjb25mbGljdHMgdG8KPiByZXNvbHZlIHdoZW4g
cmVtb3ZpbmcgaXQgZnJvbSBhbWQtc3RhZ2luZy1kcm0tbmV4dCwgYW5kIGFnYWluIHRoZSBuZXh0
Cj4gdGltZSB5b3UgbWVyZ2Ugd2l0aCBhbWQtc3RhZ2luZy1kcm0tbmV4dC4KCkFoIHRoZW4gdGhl
IHVzdWFsIHdheSBpcyBmb3IgQWxleCB0byBhc3NlbWJsZSBhIHRvcGljIHB1bGwgcmVxdWVzdAoo
c3RhYmxlLCBub24tcmViYXNpbmcpIHdpdGggdGhvc2Ugc2VsZWN0IHBhdGNoZXMsIHdoaWNoIHRo
ZW4gZ2V0cwptZXJnZWQgaW50byBkcm0tbWlzYy1uZXh0LiBPciB3ZSBzbWFzaCBpdCBhbGwgaW50
byBhbWRncHUtbmV4dC4gT3Igd2UKanVzdCB3YWl0IHVudGlsIC1yYzIgd2hlbiBkcm0tbmV4dCBp
cyBiYWNrIG9wZW4gZm9yIGJ1c2luZXNzLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
