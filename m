Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB0027D5C5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 20:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D0F8991A;
	Tue, 29 Sep 2020 18:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875488991A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 18:29:14 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601404153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TYAfSXWrazU7UOyNHROcvFceLCopxTS9CzVEpwGiPwc=;
 b=MzBZMDAT0IGbK06uM5jfWQbECL9cHUvLM1ah+1cl5GYm7I7m4KMUZ8IcMYf4nMbFAHIov5
 nQnCus+m/8eDDcatG/Z9TnajLYx4DlCeUShHTtXj18p3QBnH2SanRDTmkzzu+BtE0nHqj8
 JAIIQ7DHvklv60ey71OrNtnBJbCyPG0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-9XYmOe96M6SegAyFreDO-Q-1; Tue, 29 Sep 2020 14:29:09 -0400
X-MC-Unique: 9XYmOe96M6SegAyFreDO-Q-1
Received: by mail-qv1-f72.google.com with SMTP id y2so3072171qvs.14
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 11:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=TYAfSXWrazU7UOyNHROcvFceLCopxTS9CzVEpwGiPwc=;
 b=M1zDqC7AsCj21DNlE6g9vWWq/IcSR8EKnmyiNbCD1jDy6tz+Sf31pfazKBsBViLWy9
 gjwUIfcuJR8CvIt8nUVLtUdVc/QdvVR5SMTBDSd0jDUHAVTLwsRWXRHuEJl2fFzLVb4V
 xu2DsMEBXldNL60U3ZsgCVpCqg0msIxPpB2msNPTTbMZQ44wFFdvnh+kRqFu6GUJnZOT
 siV8K1lmOGGOljRwcK17/jyIVZ2H5n+NnVotbtZSKALAVwQurFs6iEFA1Z55P97XMTYg
 lTKkeunrGzbZwRpR2+OqU80r5NnhqGWAmYYkeflLvNn3utBtWOlotngRgZdGigaU/XKg
 Bx5Q==
X-Gm-Message-State: AOAM533V0LsIFVsdmJU44utEpggms0JLuLi+bDfVqhczGkZY5MgsrjtI
 MPhKAXfDYSL1GpGscpKoUG6HsIjBC9biZvP4NPCDR5XWX9bI3j96ogsIE3m1DKpBy+d82ZBoyYp
 mG4j+iCdsrJYwTo/rAsaqeHSpMySC
X-Received: by 2002:ac8:1763:: with SMTP id u32mr4772924qtk.14.1601404148581; 
 Tue, 29 Sep 2020 11:29:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZw2jlokC2NUPyXPDvs/gntWcgD+mmqIi6CX3P+uxJl2tTcMPV+nWWiY1DFs96ewi6/MDXQw==
X-Received: by 2002:ac8:1763:: with SMTP id u32mr4772892qtk.14.1601404148323; 
 Tue, 29 Sep 2020 11:29:08 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id z29sm6631580qtj.79.2020.09.29.11.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 11:29:07 -0700 (PDT)
Message-ID: <cc403d8fa9811e57694507213f95d6461b4b1d34.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: Fix clock checking algorithm in
 nv50_dp_mode_valid()
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Tue, 29 Sep 2020 14:29:06 -0400
In-Reply-To: <20200929180912.GG6112@intel.com>
References: <20200922210510.156220-1-lyude@redhat.com>
 <20200928130141.GV6112@intel.com>
 <9e12d6c091d18be6253717f33f4c09013361e532.camel@redhat.com>
 <20200929180912.GG6112@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, "open list:DRM
 DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTA5LTI5IGF0IDIxOjA5ICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gT24gVHVlLCBTZXAgMjksIDIwMjAgYXQgMDE6NTQ6MTNQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3
cm90ZToKPiA+IE9uIE1vbiwgMjAyMC0wOS0yOCBhdCAxNjowMSArMDMwMCwgVmlsbGUgU3lyasOk
bMOkIHdyb3RlOgo+ID4gPiBPbiBUdWUsIFNlcCAyMiwgMjAyMCBhdCAwNTowNToxMFBNIC0wNDAw
LCBMeXVkZSBQYXVsIHdyb3RlOgo+ID4gPiA+IFdoaWxlIEkgdGhvdWdodCBJIGhhZCB0aGlzIGNv
cnJlY3QgKHNpbmNlIGl0IGFjdHVhbGx5IGRpZCByZWplY3QgbW9kZXMKPiA+ID4gPiBsaWtlIEkg
ZXhwZWN0ZWQgZHVyaW5nIHRlc3RpbmcpLCBWaWxsZSBTeXJqYWxhIGZyb20gSW50ZWwgcG9pbnRl
ZCBvdXQKPiA+ID4gPiB0aGF0IHRoZSBsb2dpYyBoZXJlIGlzbid0IGNvcnJlY3QuIG1heF9jbG9j
ayByZWZlcnMgdG8gdGhlIG1heCBzeW1ib2wKPiA+ID4gPiByYXRlIHN1cHBvcnRlZCBieSB0aGUg
ZW5jb2Rlciwgc28gbGltaXRpbmcgY2xvY2sgdG8gZHNfY2xvY2sgdXNpbmcKPiA+ID4gPiBtYXgo
KQo+ID4gPiA+IGRvZXNuJ3QgbWFrZSBzZW5zZS4gQWRkaXRpb25hbGx5LCB3ZSB3YW50IHRvIGNo
ZWNrIGFnYWluc3QgNmJwYyBmb3IKPiA+ID4gPiB0aGUKPiA+ID4gPiB0aW1lIGJlaW5nIHNpbmNl
IHRoYXQncyB0aGUgbWluaW11bSBwb3NzaWJsZSBicGMgaGVyZSwgbm90IHRoZQo+ID4gPiA+IHJl
cG9ydGVkCj4gPiA+ID4gYnBjIGZyb20gdGhlIGNvbm5lY3Rvci4gU2VlOgo+ID4gPiA+IAo+ID4g
PiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDIw
LVNlcHRlbWJlci8yODAyNzYuaHRtbAo+ID4gPiA+IAo+ID4gPiA+IEZvciBtb3JlIGluZm8uCj4g
PiA+ID4gCj4gPiA+ID4gU28sIGxldCdzIHJld3JpdGUgdGhpcyB1c2luZyBWaWxsZSdzIGFkdmlj
ZS4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPgo+ID4gPiA+IEZpeGVzOiA0MDlkMzgxMzliNDIgKCJkcm0vbm91dmVhdS9rbXMvbnY1
MC06IFVzZSBkb3duc3RyZWFtIERQIGNsb2NrCj4gPiA+ID4gbGltaXRzIGZvciBtb2RlIHZhbGlk
YXRpb24iKQo+ID4gPiA+IENjOiBWaWxsZSBTeXJqw4PGksOCwqRsw4PGksOCwqQgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gPiA+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPgo+ID4gPiA+IENjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+Cj4gPiA+
ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHAuYyB8IDIz
ICsrKysrKysrKysrKystLS0tLS0tLS0tCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcC5jCj4gPiA+ID4gYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RwLmMKPiA+ID4gPiBpbmRleCA3YjY0MGUwNWJkNGNkLi4y
NGM4MWU0MjNkMzQ5IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfZHAuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfZHAuYwo+ID4gPiA+IEBAIC0yMzEsMjMgKzIzMSwyNiBAQCBudjUwX2RwX21vZGVfdmFsaWQo
c3RydWN0IGRybV9jb25uZWN0b3IKPiA+ID4gPiAqY29ubmVjdG9yLAo+ID4gPiA+ICAJCSAgIGNv
bnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLAo+ID4gPiA+ICAJCSAgIHVuc2lnbmVk
ICpvdXRfY2xvY2spCj4gPiA+ID4gIHsKPiA+ID4gPiAtCWNvbnN0IHVuc2lnbmVkIG1pbl9jbG9j
ayA9IDI1MDAwOwo+ID4gPiA+IC0JdW5zaWduZWQgbWF4X2Nsb2NrLCBkc19jbG9jaywgY2xvY2s7
Cj4gPiA+ID4gKwljb25zdCB1bnNpZ25lZCBpbnQgbWluX2Nsb2NrID0gMjUwMDA7Cj4gPiA+ID4g
Kwl1bnNpZ25lZCBpbnQgbWF4X2Nsb2NrLCBkc19jbG9jaywgY2xvY2s7Cj4gPiA+ID4gKwljb25z
dCB1OCBicHAgPSAxODsgLyogNiBicGMgKi8KPiA+ID4gCj4gPiA+IEFGQUlDUyBudjUwX291dHBf
YXRvbWljX2NoZWNrKCkgYW5kIG52NTBfbXN0b19hdG9taWNfY2hlY2soKQo+ID4gPiBqdXN0IGJs
aW5kbHkgdXNlIGNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLmJwYyB3aXRob3V0IGFueSBmYWxsYmFj
awo+ID4gPiBsb2dpYyB0byBsb3dlciB0aGUgYnBjLiBTbyBJbGlhJ3MgY29uY2VybnMgc2VlbSB3
ZWxsIGZvdW5kZWQuCj4gPiA+IFdpdGhvdXQgdGhhdCBsb2dpYyBJIGd1ZXNzIHlvdSBzaG91bGQg
anVzdCB1c2UKPiA+ID4gY29ubmVjdG9yLT5kaXNwbGF5X2luZm8uYnBjIGhlcmUgYXMgd2VsbC4K
PiA+ID4gCj4gPiA+ID4gIAllbnVtIGRybV9tb2RlX3N0YXR1cyByZXQ7Cj4gPiA+ID4gIAo+ID4g
PiA+ICAJaWYgKG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxBR19JTlRFUkxBQ0UgJiYgIW91dHAt
Cj4gPiA+ID4gPmNhcHMuZHBfaW50ZXJsYWNlKQo+ID4gPiA+ICAJCXJldHVybiBNT0RFX05PX0lO
VEVSTEFDRTsKPiA+ID4gPiAgCj4gPiA+ID4gIAltYXhfY2xvY2sgPSBvdXRwLT5kcC5saW5rX25y
ICogb3V0cC0+ZHAubGlua19idzsKPiA+ID4gPiAtCWRzX2Nsb2NrID0gZHJtX2RwX2Rvd25zdHJl
YW1fbWF4X2RvdGNsb2NrKG91dHAtPmRwLmRwY2QsCj4gPiA+ID4gLQkJCQkJCSAgb3V0cC0KPiA+
ID4gPiA+ZHAuZG93bnN0cmVhbV9wb3J0cyk7Cj4gPiA+ID4gLQlpZiAoZHNfY2xvY2spCj4gPiA+
ID4gLQkJbWF4X2Nsb2NrID0gbWluKG1heF9jbG9jaywgZHNfY2xvY2spOwo+ID4gPiA+IC0KPiA+
ID4gPiAtCWNsb2NrID0gbW9kZS0+Y2xvY2sgKiAoY29ubmVjdG9yLT5kaXNwbGF5X2luZm8uYnBj
ICogMykgLyAxMDsKPiA+ID4gPiAtCXJldCA9IG5vdXZlYXVfY29ubl9tb2RlX2Nsb2NrX3ZhbGlk
KG1vZGUsIG1pbl9jbG9jaywKPiA+ID4gPiBtYXhfY2xvY2ssCj4gPiA+ID4gLQkJCQkJICAgICZj
bG9jayk7Cj4gPiA+ID4gKwljbG9jayA9IG1vZGUtPmNsb2NrICogYnBwIC8gODsKPiA+ID4gPiAr
CWlmIChjbG9jayA+IG1heF9jbG9jaykKPiA+ID4gPiArCQlyZXR1cm4gTU9ERV9DTE9DS19ISUdI
Owo+ID4gPiAKPiA+ID4gVGhpcyBzdHVmZiB2cy4gbm91dmVhdV9jb25uX21vZGVfY2xvY2tfdmFs
aWQoKSBzdGlsbCBzZWVtcyBhIGJpdCBtZXNzeS4KPiA+ID4gVGhlIG1heF9jbG9jayB5b3UgcGFz
cyB0byBub3V2ZWF1X2Nvbm5fbW9kZV9jbG9ja192YWxpZCgpIGlzIHRoZSBtYXgKPiA+ID4gc3lt
Ym9sIGNsb2NrLCBidXQgbm91dmVhdV9jb25uX21vZGVfY2xvY2tfdmFsaWQoKSBjaGVja3MgaXQg
YWdhaW5zdCB0aGUKPiA+ID4gZG90Y2xvY2suIEFsc28gb25seSBub3V2ZWF1X2Nvbm5fbW9kZV9j
bG9ja192YWxpZCgpIGhhcyBhbnkga2luZCBvZgo+ID4gPiBzdGVyZW8gM0QgaGFuZGxpbmcsIGJ1
dCBBRkFJQ1Mgc3RlcmVvX2FsbG93ZWQgaXMgYWxzbyBzZXQgZm9yIERQPwo+ID4gCj4gPiAuLi5u
b3Qgc3VyZSBJJ20gZm9sbG93aW5nIHlvdSBoZXJlLCBpdCdzIHNldCB0byB0cnVlIGZvciBEUCBz
byBkb24ndCB3ZQo+ID4gd2FudAo+ID4gdG8gY2hlY2sgaXQgYW5kIGFkanVzdCB0aGUgcGl4ZWwg
Y2xvY2sgd2Ugb3V0cHV0IGFjY29yZGluZ2x5Pwo+IAo+IFllcywgYnV0IHRoZW4geW91IG5lZWQg
dG8gYWxzbyBkb3VibGUgeW91ciB5b3VyIHBpeGVsIGNsb2NrCj4gZGVyaXZlZCB2YWx1ZXMgaW4g
dGhpcyBmdW5jdGlvbi4gSWUuIGFsbCB0aGUgbW9kZS0+Y2xvY2sKPiBuZWVkcyB0byBiZWNvbWUg
bW9kZS0+Y2xvY2sqMiB3aGVuIGRlYWxpbmcgd2l0aCBhIDNEIGZyYW1lCj4gcGFja2luZyBtb2Rl
LgoKb2ggdGhpcyBpcyBhIGdvb2QgcG9pbnQsIHRoYW5rcyBmb3Igbm90aWNpbmcuIEkgZ3Vlc3Mg
SSdsbCBnZXQgdG8gY2hhbmdpbmcKdGhpcyBhcm91bmQgb25jZSBJIHN0YXJ0IHdvcmtpbmcgb24g
dGhlIHJlc3Qgb2YgdGhlIGJwcCBzdHVmZiwgc2luY2UgSSdkCnJhdGhlciBnZXQgdGhpcyBmaXhl
ZCBmaXJzdCAoSSBkb3VidCBtYW55IGZvbGtzIGFyZSB1c2luZyBub3V2ZWF1IGZvciAzRCByaWdo
dApub3csIGJ1dCBpZiBvdGhlciBub3V2ZWF1IGZvbGtzIGRpc2FncmVlIGknbSBoYXBweSB0byBj
aGFuZ2UgbXkgbWluZCkKPiAKPiA+ID4gPiArCj4gPiA+ID4gKwlkc19jbG9jayA9IGRybV9kcF9k
b3duc3RyZWFtX21heF9kb3RjbG9jayhvdXRwLT5kcC5kcGNkLCBvdXRwLQo+ID4gPiA+ID4gZHAu
ZG93bnN0cmVhbV9wb3J0cyk7Cj4gPiA+ID4gKwlpZiAoZHNfY2xvY2sgJiYgbW9kZS0+Y2xvY2sg
PiBkc19jbG9jaykKPiA+ID4gPiArCQlyZXR1cm4gTU9ERV9DTE9DS19ISUdIOwo+ID4gPiA+ICsK
PiA+ID4gPiArCXJldCA9IG5vdXZlYXVfY29ubl9tb2RlX2Nsb2NrX3ZhbGlkKG1vZGUsIG1pbl9j
bG9jaywKPiA+ID4gPiBtYXhfY2xvY2ssCj4gPiA+ID4gJmNsb2NrKTsKPiA+ID4gPiAgCWlmIChv
dXRfY2xvY2spCj4gPiA+ID4gIAkJKm91dF9jbG9jayA9IGNsb2NrOwo+ID4gPiA+ICsKPiA+ID4g
PiAgCXJldHVybiByZXQ7Cj4gPiA+ID4gIH0KPiA+ID4gPiAtLSAKPiA+ID4gPiAyLjI2LjIKPiA+
IC0tIAo+ID4gQ2hlZXJzLAo+ID4gCUx5dWRlIFBhdWwgKHNoZS9oZXIpCj4gPiAJU29mdHdhcmUg
RW5naW5lZXIgYXQgUmVkIEhhdAotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bCAoc2hlL2hlcikKCVNv
ZnR3YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
