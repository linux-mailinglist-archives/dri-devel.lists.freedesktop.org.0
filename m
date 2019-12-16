Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A197811FFCC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:31:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032EB6E443;
	Mon, 16 Dec 2019 08:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923546E149
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 06:21:49 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id o42so1671438uad.10
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 22:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZzSSLvKw9mNTLZvvUymHPcl2WV9SW+lzlm9fmtBxmYc=;
 b=fBj4J6yUXDe8Q7ukkqq7VWntkh2taw39rMdzEQf8DPvJHKgT3N3qe12hxR8Y4q3oIJ
 NwQ1fAbvrfGX5aa0RzRw9clVksy77pDo2gBxnh5Pm4MdZ2vQe9ygx0mE4kFi7f3Y3yj0
 Q/MKGGpffnAMj5BnejG4qTh+TEPnxEciZA7E7EMwJR77I03PM6gHlPugawDBQDZcqvWl
 LkFzfZ4stfF3Ec+RU9Qm4lf3jo0gBTKyuz80qEUVzmG9sonjWwbPy57/gwikGLHrkOyO
 u0TjhI///jC9jGsL78KFLtdoUrWMkbhCwWR1JPC75jNUZWh2XXNxLUUI0utoGGAJIuro
 MUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZzSSLvKw9mNTLZvvUymHPcl2WV9SW+lzlm9fmtBxmYc=;
 b=aq8Tq7fDkHNRI7i/z4Li36SSHPNSMvpDYqdetZ9ZqVtG9FfhPLjCgEcDpVMY/zkft1
 Z3smka2OQxZ+gf8hLdlkVzoFYNBM3FPTGDSTdQB5ZcycnrUorY1FQGdVOJsPPyzi3ODz
 ylvO2RQZM1gjyeKufsGhvDqFOBPVdqlAcKFK3dGDNuNjKY2xkzbgJf/y1PoMEK8+4b6B
 Fmy8gd+gGLDZax+me7A13pgcN8w/6Y7kKPUyxZqc+tmh7vjkbvAv4pxuDfc/nJtHNudY
 46dH2WGOfsAkKtKWaW4VhKol1KfF4Y8lbF6Xp7XuQZzpm3LDPFU5A+wB+j8Nc81J1swo
 TZYw==
X-Gm-Message-State: APjAAAXOxLCrdffQ/R14eSpFGsfTLYGV/4jYwabbUZKAIqVD/dkY4f31
 zED0ja0KSPLy72ZaAVnCQv84/AE7OLRw0dkM2T5JBOAO
X-Google-Smtp-Source: APXvYqzHYig/kAVRTk5SMKuJMtxdjczHGT+ToX6wgBjY7rdplbt2xAKAiKhrRWczTG9yoMIKKwcJ81DRkbcZ2eCoEg8=
X-Received: by 2002:ab0:30c2:: with SMTP id c2mr21623960uam.8.1576477308622;
 Sun, 15 Dec 2019 22:21:48 -0800 (PST)
MIME-Version: 1.0
References: <CAMz9Wg9tNjYbRyHKRazu8LTSo2AvEn38zxHzkNJxJw9XmjxwqA@mail.gmail.com>
 <87pngs1c8z.fsf@intel.com>
In-Reply-To: <87pngs1c8z.fsf@intel.com>
From: AceLan Kao <acelan@gmail.com>
Date: Mon, 16 Dec 2019 14:21:37 +0800
Message-ID: <CAMz9Wg-EjX=CL9mm0JDuT6BGnB3PcSDwNmKpQy_KRnhni29Q-Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/i915: Fix eDP DPCD aux max backlight calculations
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Approved-At: Mon, 16 Dec 2019 08:30:48 +0000
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

SSB0cmllZCB0byByZXBseSB0aGUgcGF0Y2ggZnJvbSB0aGUgbWFpbGluZyBsaXN0IGFyY2hpdmUg
YnkgY2xpY2tpbmcKdGhlIGF1dGhvciBuYW1lCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LU5vdmVtYmVyLzI0NjI3OC5odG1sCgptYWlsdG86ZHJp
LWRldmVsJTQwbGlzdHMuZnJlZWRlc2t0b3Aub3JnP1N1YmplY3Q9UmUlM0ElMjAlNUJQQVRDSCUy
MDEvNSU1RCUyMGRybS9pOTE1JTNBJTIwRml4JTIwZURQJTIwRFBDRCUyMGF1eCUyMG1heCUyMGJh
Y2tsaWdodCUyMGNhbGN1bGF0aW9ucyZJbi1SZXBseS1Ubz0lM0MyMDE5MTEyMjIzMTYxNi4yNTc0
LTItbHl1ZGUlNDByZWRoYXQuY29tJTNFCgpJdCBsb29rcyBsaWtlIGl0IGNvbnRhaW5zIHRoZSBz
dWJqZWN0IGFuZCBpbi1yZXBseS10bywgSSB0aG91Z2h0IGl0CnNob3VsZCByZXBseSB0byB0aGUg
Y29ycmVjdCB0aHJlYWQuCk90aGVyIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgc2VlbSB3b3JrLCBi
dXQgdGhpcyBvbmUgZG9lc24ndC4KCkphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRl
bC5jb20+IOaWvCAyMDE55bm0MTLmnIgxM+aXpSDpgLHkupQg5LiL5Y2IMTE6MjLlr6vpgZPvvJoK
Cj4KPiBPbiBUaHUsIDEyIERlYyAyMDE5LCBBY2VMYW4gS2FvIDxhY2VsYW5AZ21haWwuY29tPiB3
cm90ZToKPiA+IFRoaXMgc2VyaWVzIG9mIHBhdGNoZXMgd29ya3Mgd2VsbCBvbiBhIG5ldyBwbGF0
Zm9ybSB3aGljaCBoYXMgYSBwYW5lbAo+ID4gb25seSBjb250cm9scyBieSBEUENEIGF1eCBicmln
aHRuZXNzLgo+ID4KPiA+IFRlc3RlZC1ieTogQWNlTGFuIEthbyA8YWNlbGFuLmthb0BjYW5vbmlj
YWwuY29tPgo+Cj4gUGxlYXNlIGZpeCB5b3VyIG1haWwgY2xpZW50IHRvIGFjdHVhbGx5IHJlcGx5
IHRvIHRoZSB0aHJlYWQsIGFuZCByZXRhaW4KPiBhbGwgdGhlIHJlY2lwaWVudHMuIEFzIGl0IGlz
LCB5b3VyIHJlcGxpZXMgYXJlIGRpc2Nvbm5lY3RlZCBmcm9tIHRoZQo+IGFjdHVhbCBwYXRjaGVz
Lgo+Cj4gQlIsCj4gSmFuaS4KPgo+Cj4gLS0KPiBKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3Vy
Y2UgR3JhcGhpY3MgQ2VudGVyCgoKCi0tCkNoaWEtTGluIEthbyhBY2VMYW4pCmh0dHA6Ly9ibG9n
LmFjZWxhbi5pZHYudHcvCkUtTWFpbDogYWNlbGFuLmthb0FUY2Fub25pY2FsLmNvbSAocy9BVC9A
LykKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
