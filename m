Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A5BF8CC3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 11:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F596EAFD;
	Tue, 12 Nov 2019 10:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50B26EAFD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 10:25:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b3so17831520wrs.13
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 02:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=Mk6dFb9/pJd0UP5k0AF2KbHaDFy6ZxNbIkbNhhv4vzA=;
 b=Y4sfJWelNKHmSQ9SWrZoKWOXS1clm26TjE1AtA1/cP2Fp9J325kYjTGm5PBvdA0Trj
 MUhgjENhfHePD8zuivdomRMmo/Dslo1qPFpCBpQfoEJM38QH5Zs0l2FchzsTNpN4kWlK
 p2qpBSuEWP3JCH4X7/OchlX6X70fMJlisvGKPyNyPO5aIe/dWda8p656vsmHto6XjQoc
 DqAqut+wrhLQ9QzTc8Q5bPj+YK25N4Hk545CqyvwkHT2yHZJjhI9IKIn/1sPDHp2uPNS
 oAeM6FVckLk59qhkLuYjbaOpqFBinnUdqFL+Sm2KUTwdSXCK5P9YBrnAbSVfVLOOEZJR
 rRaw==
X-Gm-Message-State: APjAAAXpFmpSIJf05OARP8nQLCo9Hlxo3v3MIth0BBH0MrMbqU/DLZmq
 cxMn0atCfijliCtAOPxcqX4u4g==
X-Google-Smtp-Source: APXvYqz7n1u7/NVrftcrdHatXUEakeJUwfaVv4vvwsCLQjU5aRKh4GyPqffrJGIIQj7nSNlCy4B6yQ==
X-Received: by 2002:adf:cf10:: with SMTP id o16mr11791046wrj.334.1573554320362; 
 Tue, 12 Nov 2019 02:25:20 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id m25sm2186392wmi.46.2019.11.12.02.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 02:25:19 -0800 (PST)
Date: Tue, 12 Nov 2019 11:25:17 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/4] drm/ttm: refine ghost BO resv criteria
Message-ID: <20191112102517.GI23790@phenom.ffwll.local>
References: <20191111145832.37320-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191111145832.37320-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Mk6dFb9/pJd0UP5k0AF2KbHaDFy6ZxNbIkbNhhv4vzA=;
 b=VSLjAbBEC/revxRGe/X6ZP80Yfeenq0fbAYdsEe0Ia4b432gbA1JfFXBSJqjnptST5
 fqcJjOqwkPNwKpSV0wopskHHUXj9jbeMdjxJuCsNnH9jEFPd0EgCoNBmXba2DDBg1+dg
 HeecFAVS5fxjUWXGhPCQbkusj9cbXYaUSfITQ=
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
Cc: Kevin1.Wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMDM6NTg6MjlQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBHaG9zdCBCT3MgbmVlZCB0byBzdGljayB3aXRoIHRoZSByZXN2IG9iamVjdCBv
bmx5IHdoZW4gdGhlIG9yaWdpbiBpcyBpbXBvcnRlZC4KPiAKPiBUaGlzIGlzIGEgbG93IGhhbmdp
bmcgZnJ1aXQgdG8gYXZvaWQgT09NIHNpdHVhdGlvbnMgb24gZXZpY3Rpb25zLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCkkg
Z3Vlc3MgSSBzdGlsbCBkb24ndCBnZXQgd2hhdCBnaG9zdCBvYmplY3RzIGFsbCBkbyBhbmQgY2F1
c2UgLi4uIEhvdyBkb2VzCnRoaXMgbGVhZCB0byBPT00gY2FzZXMgd2hlcmUgdGhlIGV2aWN0aW9u
IGNhbid0IGZpbmQgbWVtb3J5IGFueW1vcmU/Ci1EYW5pZWwKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvX3V0aWwuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvX3V0aWwuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+IGlu
ZGV4IDJiMGU1YTA4OGRhMC4uODZkMTUyNDcyZjM4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3V0aWwuYwo+IEBAIC01MTEsNyArNTExLDcgQEAgc3RhdGljIGludCB0dG1fYnVmZmVyX29iamVj
dF90cmFuc2ZlcihzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAJa3JlZl9pbml0KCZm
Ym8tPmJhc2Uua3JlZik7Cj4gIAlmYm8tPmJhc2UuZGVzdHJveSA9ICZ0dG1fdHJhbnNmZXJlZF9k
ZXN0cm95Owo+ICAJZmJvLT5iYXNlLmFjY19zaXplID0gMDsKPiAtCWlmIChiby0+YmFzZS5yZXN2
ID09ICZiby0+YmFzZS5fcmVzdikKPiArCWlmIChiby0+dHlwZSAhPSB0dG1fYm9fdHlwZV9zZykK
PiAgCQlmYm8tPmJhc2UuYmFzZS5yZXN2ID0gJmZiby0+YmFzZS5iYXNlLl9yZXN2Owo+ICAKPiAg
CWRtYV9yZXN2X2luaXQoJmZiby0+YmFzZS5iYXNlLl9yZXN2KTsKPiAtLSAKPiAyLjE3LjEKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
