Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1497D322AD8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 13:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A316E832;
	Tue, 23 Feb 2021 12:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A016E832
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 12:54:51 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id d9so1261674ote.12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 04:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ryEuLkNTnPoILcea8gCJJ8lUMdqGNb3u7NT/Wg7Raoo=;
 b=Pxid7KNAMqO92r8CSsaN9Hz/UVoUaG7JEZ1LLml2ev9frJVKdOZzR2wkCjPeUJwI3y
 PfoiszCzQVN/OCksi999kkkcmG3rGWrXWtujbZfMZ2eGsqoqluZteXXn6h9pnJSTnG7x
 5kAd3KIvoZ+YhHEnR5EbDwt1HB7sD4hxEMeMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ryEuLkNTnPoILcea8gCJJ8lUMdqGNb3u7NT/Wg7Raoo=;
 b=rM/Tuhz6n6/TCz0EjKeE5bcSZO2JYYsNaTp3AeIemVpCOypejGlnvxzSElWalQ+vu5
 ti6P8Xbq3kDKzsSokCdgmmueXUj7zaK0MaeVX6NY1TXZk7cmKpwH+n4VZ/6lVKDiWbzB
 Y63a/FPDAaDrOBG3MN1IrrzcKvJSw6cz6EvIjyfZcJWTdrm0UNftHBXTMRAnh5G2Mp09
 6j2j5VdLISeK4OAQgexZghjmiwsctDIxJ7AMW1TaXu+gYnD8uyFIQqwwy8embBc1L8Dz
 ZqioqZU/RtEPZN+nrG+a9nZkUpxUr6UmkPin/9NbjPyOhjlwl6oOQP8F5e8lHosNm7yY
 RnJQ==
X-Gm-Message-State: AOAM531n/CxQrAE84zGm5kORxwv8C7r4nYYlAgrTmyBNcuDYBm3pjDAn
 1LqcrLUhGYvUlh0M+SxpkSvUajMw4p3/prCvhXgchA==
X-Google-Smtp-Source: ABdhPJzWF1xuo/JECrjOEzkn9Cr1qQLe0C+FJo9KXen+vhxyIpXvUYNMXuWm43SUN0WXMaAzXESK2CBg0oYP3wXvS7g=
X-Received: by 2002:a9d:2265:: with SMTP id o92mr20226423ota.188.1614084891322; 
 Tue, 23 Feb 2021 04:54:51 -0800 (PST)
MIME-Version: 1.0
References: <20210217165910.3820374-1-nroberts@igalia.com>
 <7f80b184-7277-0f6c-1108-cf41189626df@arm.com>
 <CAKMK7uHPk1G-S6EMRZ8grZU8W6iij_DJR+V2eBGP+79Te6k76A@mail.gmail.com>
 <87lfbfc5w2.fsf@yahoo.co.uk>
In-Reply-To: <87lfbfc5w2.fsf@yahoo.co.uk>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 23 Feb 2021 13:54:40 +0100
Message-ID: <CAKMK7uFs7z6fAXOntWwBNPBq26PBOkHJ09atv_cYeJCpk4FwjQ@mail.gmail.com>
Subject: Re: [PATCH] drm/shmem-helper: Don't remove the offset in
 vm_area_struct pgoff
To: Neil Roberts <nroberts@igalia.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBGZWIgMjMsIDIwMjEgYXQgMTo0MiBQTSBOZWlsIFJvYmVydHMgPG5yb2JlcnRzQGln
YWxpYS5jb20+IHdyb3RlOgo+Cj4gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cml0
ZXM6Cj4KPiA+IFllYWggcGx1cyBDYzogc3RhYmxlIGZvciBiYWNrcG9ydGluZyBhbmQgSSB0aGlu
ayBhbiBpZ3Qgb3Igc2ltaWxhciBmb3IKPiA+IHBhbmZyb3N0IHRvIGNoZWNrIHRoaXMgd29ya3Mg
Y29ycmVjdGx5IHdvdWxkIGJlIHByZXR0eSBnb29kIHRvby4gU2luY2UKPiA+IGlmIGl0IHRvb2sg
dXMgb3ZlciAxIHllYXIgdG8gbm90aWNlIHRoaXMgYnVnIGl0J3MgcHJldHR5IGNsZWFyIHRoYXQK
PiA+IG5vcm1hbCB0ZXN0aW5nIGRvZXNuJ3QgY2F0Y2ggdGhpcy4gU28gdmVyeSBsaWtlbHkgd2Un
bGwgYnJlYWsgdGhpcwo+ID4gYWdhaW4uCj4KPiBJIG1hZGUgdGhlIElHVCB0ZXN0IGJlbG93IHdo
aWNoIHNlZW1zIHRvIHJlcHJvZHVjZSB0aGUgYnVnLiBIb3dldmVyLCB0aGUKPiBrZXJuZWwgcGF0
Y2ggZG9lc27igJl0IGZpeCBpdCwgc28gbWF5YmUgdGhlcmUgaXMgc29tZXRoaW5nIG1vcmUgc3Vi
dGxlCj4gZ29pbmcgb24uCj4KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbnJvYmVy
dHMvaWd0LWdwdS10b29scy8tL2NvbW1pdHMvcGFuZnJvc3QtcHVyZ2VtYXAvCgpkcm1fZ2VtX3No
bWVtX2ZhdWx0KCkgZG9lcyBub3Qgc2VlbSB0byBjaGVjayBmb3IgcHVyZ2VkIG9iamVjdHMgYXQg
YWxsLgoKTm8gaWRlYSBob3cgdGhpcyB3b3Jrcywgb3IgaWYgaXQgZXZlciB3b3JrZWQsIGJ1dCB5
ZWFoIHNvbWV0aGluZyBpcwpjbGVhcmx5IHN0aWxsIGJ1c3RlZC4KCkRlZmluaXRlbHkgYSBnb29k
IGlkYWUgdG8gaGF2ZSBhbiBpZ3QuIGJ0dyB0byBtYWtlIHRoYXQgZmFzdGVyIHlvdSBjYW4KZWl0
aGVyIHVzZSB0aGUgdm1fZHJvcF9jYWNoZXMgZmlsZSBmcm9tIHByb2MgKGl0J3MgYSBiaXQgYSBo
YW1tZXIpLCBvcgp3aGF0IEkgcmVjb21tZW5kOiBIYXZlIGEgZGVkaWNhdGVkIGRlYnVnZnMgZmls
ZSB0byBvbmx5IGRyb3AKZXZlcnl0aGluZyBmcm9tIHlvdXIgc2hyaW5rZXIuIFRoYXQncyBtdWNo
IHF1aWNrZXIgYW5kICBjb250cm9sbGVkLgpTZWUgZS5nLiB0dG1fdHRfZGVidWdmc19zaHJpbmsg
ZnJvbSBkNGJkNzc3NmE3YWMgKCJkcm0vdHRtOiByZXdvcmsKdHRtX3R0IHBhZ2UgbGltaXQgdjQi
KSB3aGljaCByZWNlbnRseSBsYW5kZWQgaW4gZHJtLW1pc2MtbmV4dC4KLURhbmllbAotLSAKRGFu
aWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
