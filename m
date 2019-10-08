Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BE7CF60E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 11:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8D96E2B8;
	Tue,  8 Oct 2019 09:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4E86E2B8
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 09:32:14 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id w67so11426267lff.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 02:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S/DcKGHgmjGCozcL7dFbAZavCT/2uDOca/9s+OVTtes=;
 b=R2ON4Rzn7lu8tPMi4CkInrtiW/Q0u5dWuuszb+yalUCGrRIb8scmzEORXLn+OCKrKd
 snoAZvrJLEZ0245ktlupqDh1F5Bjl5lQ6zdlltRgbXwVwxwjnyU+Oqm5CzRUKFRLQCye
 ZXQop4rwEbNbGBg+NhEI3jLd4GgVne+brC6r1DGH/O8FlQfDjDkwcgu+8RNv/APWo6EO
 bkWcaVwCsxWkiJ8aZsbC4aZS0Z2g51l/zbNsmLME36/rzwz+143JeA6nALsXrz9dOpSI
 i6OC1sGA8J7MqTIcRKmiRGnw+mhW9W2P9FpStHlLhfS0xk6U4oLjCkCzotjLvXhDD1Gt
 umJg==
X-Gm-Message-State: APjAAAVjwNhDTzbS63rfmfmh2LL0cisaGXvJpNIoeHup3Z9+9hz1a9SX
 T6ziw2945r5HxurCFI+Up+PbcHdxsMJx12R+20EBVA==
X-Google-Smtp-Source: APXvYqwy9PRuNtsfuBju/kvKUgvHWurostjkIWwma+4zm9QjVYw/a6Zmg5QkNlB6DZ2f+2hgHf9UGI8qNGSGTVXGuM8=
X-Received: by 2002:ac2:4a89:: with SMTP id l9mr12889784lfp.122.1570527132175; 
 Tue, 08 Oct 2019 02:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <87y2xzqimw.fsf@keithp.com>
 <CAPj87rM5f1v9ETPJ3KhA7gQKKQoxhqbUx3at5Xi75+5nFQ79Sg@mail.gmail.com>
 <871rvopgjj.fsf@keithp.com>
In-Reply-To: <871rvopgjj.fsf@keithp.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 8 Oct 2019 10:31:56 +0100
Message-ID: <CAPj87rPe2oLXSU8cLsCPJZG6JXRsijZtpaeSWJy5ZfFbr3i1KA@mail.gmail.com>
Subject: Re: liboutput: thoughts about shared library on top of DRM/KMS
To: Keith Packard <keithp@keithp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=S/DcKGHgmjGCozcL7dFbAZavCT/2uDOca/9s+OVTtes=;
 b=w8xg59J3vAD0wf9kpQx0wmGb2EIl0ltSkfrAne7i9t9BeO5s7TR4gPFU1xnE/uWJ56
 ZjIWWdoJ7VZ5lOZhivmo6pbTKG/i7QDB+ngC5S1bvwyRd0xLVbez9T59oFlMZUS0qcNd
 G9RrJxYnMw4MV2/6dXCCrbVltVIOEVXQwGTyxcjHxTdQmLDa33fRVGBX7YGD//U1Dxzf
 HYWKtlcXOeyl+QXcKmi9EFfRcpTDgJbCKCSde9yy23DwWxxzCsH0uF+2ZQPOEawMjnzo
 9LgUp6cSOv1mCxYEF8baOF3dnw9mL/LyJwc2KVSpBkOKHRdlvfPWJbsjwPezagQSJLkW
 /UqA==
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBNb24sIDcgT2N0IDIwMTkgYXQgMTk6MTYsIEtlaXRoIFBhY2thcmQgPGtlaXRocEBr
ZWl0aHAuY29tPiB3cm90ZToKPiBEYW5pZWwgU3RvbmUgPGRhbmllbEBmb29pc2hiYXIub3JnPiB3
cml0ZXM6Cj4gPiBJIHRoaW5rIHRoZXJlIHdvdWxkIGJlIGEgbG9hZCBvZiB2YWx1ZSBpbiBzdGFy
dGluZyB3aXRoIHNpbXBsZSBoZWxwZXJzCj4gPiB3aGljaCBjYW4gYmUgdXNlZCBpbmRlcGVuZGVu
dGx5IG9mIGFueSBsYXJnZXIgc2NoZW1lLCB0YWNrbGluZyB0aGF0Cj4gPiBsaXN0IGFib3ZlLgo+
Cj4gWWVhaCwgYSBoZWxwZXIgbGlicmFyeSB0aGF0IGRpZG4ndCBlbmZvcmNlIGF0IHRvbm5lIG9m
IHBvbGljeSBhbmQganVzdAo+IGxldCB0aGUgdXNlciBnbHVlIHRoaW5ncyB0b2dldGhlciBvbiB0
aGVpciBvd24gaXMgcHJvYmFibHkgZ29pbmcgdG8gYmUKPiBtb3JlIGdlbmVyYWxseSB1c2FibGUg
YnkgZXhpc3RpbmcgYW5kIG5ldyBzeXN0ZW1zLgoKVG8gZWxhYm9yYXRlIGEgbGl0dGxlIGJpdCwg
b25lIG9mIHRoZSByZWFzb25zIEknbSBsb2F0aCB0byBoaWRlCmNvbXBsZXhpdHkgbGlrZSB0cmFu
c2Zvcm1zLCBjb2xvdXIgbWFuYWdlbWVudCwgYW5kIHRpbWluZyBhd2F5IGluIGFuCmVuY2Fwc3Vs
YXRlZCBsb3dlciBsYXllciwgaXMgYmVjYXVzZSBJIGhhdmUgdG8gZXhwb3NlIGFsbCB0aG9zZQpk
ZXRhaWxzIGFueXdheS4gVWx0aW1hdGVseSB0byBtYWtlIHRob3NlIHdvcmsgcHJvcGVybHksIHdl
J2xsIHJlcXVpcmUKYXdhcmVuZXNzIG5vdCBqdXN0IGluIHRoZSBjb21wb3NpdG9yIGl0c2VsZiwg
YnV0IHB1c2hlZCB0aHJvdWdoIHRvCmNsaWVudHMuCgpXYXlsYW5kIGFscmVhZHkgaGFzIGZhY2ls
aXR5IGZvciBpbmZvcm1pbmcgY2xpZW50cyBhYm91dCBvdXRwdXQKdHJhbnNmb3JtcyBzbyB0aGV5
IGNhbiByZW5kZXIgcHJlLXJvdGF0ZWQgYW5kIGF2b2lkIHRoZQpjb21wb3NpdG9yLXNpZGUgdHJh
bnNmb3JtOyBpbiBvcmRlciB0byBtYWtlIEhEUiBhbmQgb3RoZXIgY29sb3VyCm1hbmFnZW1lbnQg
KGUuZy4ganVzdCBzaW1wbGUgY2FsaWJyYXRpb24pIHByb3Blcmx5IHdlIG5lZWQgdG8gaGF2ZQpm
dWxsIHBsdW1iaW5nIGJhY2sgdGhyb3VnaCB0byBjbGllbnRzOyBkb2luZyB0aW1pbmcgcHJvcGVy
bHksCnBhcnRpY3VsYXJseSBmb3IgbXVsdGlwbGUgc2ltdWx0YW5lb3VzIGNsaWVudHMsIGFsc28g
cmVxdWlyZXMgYSBmYWlyCmJpdCBvZiBtZWNoYW5pY3MgYW5kIGJhY2stYW5kLWZvcnRoLgoKVGhl
cmUncyBhIGxvdCB0aGF0IHdlIGNvdWxkIHVzZWZ1bGx5IHNoYXJlIGJldHdlZW4gYWxsIHRoZSB1
c2VycywgYW5kCmhhdmluZyBhIHNoYXJlZCBsaWJyYXJ5IHRvIGhlbHAgd2l0aCB0aGF0IHdvdWxk
IGJlIGdyZWF0LiBCdXQgdGhlCnRob3VnaHQgb2YgdHVja2luZyBpdCBhbGwgYXdheSBpbiBhbiBv
cGFxdWUgbGF5ZXIgd2hpY2ggKCp3YXZlcwpoYW5kcyopIGp1c3QgZG9lcyBpdCwgZ2l2ZXMgbWUg
Y29sZCBFR0xTdHJlYW1zIHN3ZWF0cy4KCk1heWJlIGEgZ29vZCBwbGFjZSB0byBzdGFydCBpcyBp
ZiB3ZSBhbGwgbGlzdGVkIHRoZSBiaXRzIG9mIGNvZGUgd2hpY2gKd2UnZCBiZSBkZWxpZ2h0ZWQg
dG8gamV0dGlzb24/CgpDaGVlcnMsCkRhbmllbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
