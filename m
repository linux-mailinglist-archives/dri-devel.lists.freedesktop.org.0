Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A14DBEAC30
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC666EDDF;
	Thu, 31 Oct 2019 09:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3F26EAB7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 20:12:05 +0000 (UTC)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <andrea.righi@canonical.com>) id 1iPuK3-00049Q-VM
 for dri-devel@lists.freedesktop.org; Wed, 30 Oct 2019 20:12:03 +0000
Received: by mail-wr1-f69.google.com with SMTP id f4so1948499wrj.12
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 13:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AVK3dTX5VeGMLnBzR7G4n82XaLQo9FRcTOWzPDhXKnM=;
 b=MwOItp8s0GuDFHP96whQGn8NP/qLDS/50JfqaENtFQDEUblNizHnb3l2wVziCtZUeu
 5UNl9r0qtT9fkDcuU3FcmdvR77YGHeVL4vb2BbwnHwwQ7kUmzWUylwCVMHyXr3J9tJ1i
 vtMQ7VwfTRFeesvT2M7RjQTORvuw252/A44ybh4VsPcXMe0ypldzVgWyTOHmVS2vd2V0
 g+MGNuRlM/Ww0Tq22YCCp7tnrPFtjBIjgBwZc9v/o21wtj+RkSMBVBDE91R9BT31osPE
 1q9dF6sd6aNwMQ7fBZbb85F1Weeu2aX/+tbJYuCjRfGYZ4spG0BVNzs2CrQylqdTs3fD
 jNsg==
X-Gm-Message-State: APjAAAV4r4NSTgWsvF4gSe0U18nwuSoqjHUQ51G+7I/3/Yj0Wmxfjl+D
 3I95bADQ5QuxDVEuw7da6fpxfThsiFN3VKBRcrBzEqKOJKLBrLt27T9f2fb4Ceu4GzwEkjlXEGA
 /109SjDwvVEN6qQCAebpiFTl5ROkUzVEfScjyc2kZgKw9NA==
X-Received: by 2002:a5d:678e:: with SMTP id v14mr1517130wru.393.1572466323595; 
 Wed, 30 Oct 2019 13:12:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxlH3NbfJNwZ+iH3vOzPj9s1eHdaXQjgrBiVlMVrAzQAGIq2J05NZ48ryoa5j1osqZbWvhIHw==
X-Received: by 2002:a5d:678e:: with SMTP id v14mr1517106wru.393.1572466323277; 
 Wed, 30 Oct 2019 13:12:03 -0700 (PDT)
Received: from localhost ([178.18.58.186])
 by smtp.gmail.com with ESMTPSA id j22sm1733453wrd.41.2019.10.30.13.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 13:12:02 -0700 (PDT)
Date: Wed, 30 Oct 2019 21:12:01 +0100
From: Andrea Righi <andrea.righi@canonical.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH] fbdev: potential information leak in do_fb_ioctl()
Message-ID: <20191030201201.GA3209@xps-13>
References: <20191029182320.GA17569@mwanda>
 <87zhhjjryk.fsf@x220.int.ebiederm.org>
 <20191030074321.GD2656@xps-13>
 <87r22ujaqq.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r22ujaqq.fsf@x220.int.ebiederm.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
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
Cc: linux-fbdev@vger.kernel.org, security@kernel.org,
 Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Julia Lawall <Julia.Lawall@lip6.fr>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Peter Rosin <peda@axentia.se>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMDI6MjY6MjFQTSAtMDUwMCwgRXJpYyBXLiBCaWVkZXJt
YW4gd3JvdGU6Cj4gQW5kcmVhIFJpZ2hpIDxhbmRyZWEucmlnaGlAY2Fub25pY2FsLmNvbT4gd3Jp
dGVzOgo+IAo+ID4gT24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMDI6MDI6MTFQTSAtMDUwMCwgRXJp
YyBXLiBCaWVkZXJtYW4gd3JvdGU6Cj4gPj4gRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBv
cmFjbGUuY29tPiB3cml0ZXM6Cj4gPj4gCj4gPj4gPiBUaGUgImZpeCIgc3RydWN0IGhhcyBhIDIg
Ynl0ZSBob2xlIGFmdGVyIC0+eXdyYXBzdGVwIGFuZCB0aGUKPiA+PiA+ICJmaXggPSBpbmZvLT5m
aXg7IiBhc3NpZ25tZW50IGRvZXNuJ3QgbmVjZXNzYXJpbHkgY2xlYXIgaXQuICBJdCBkZXBlbmRz
Cj4gPj4gPiBvbiB0aGUgY29tcGlsZXIuCj4gPj4gPgo+ID4+ID4gRml4ZXM6IDFmNWUzMWQ3ZTU1
YSAoImZibWVtOiBkb24ndCBjYWxsIGNvcHlfZnJvbS90b191c2VyKCkgd2l0aCBtdXRleCBoZWxk
IikKPiA+PiA+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3Jh
Y2xlLmNvbT4KPiA+PiA+IC0tLQo+ID4+ID4gSSBoYXZlIDEzIG1vcmUgc2ltaWxhciBwbGFjZXMg
dG8gcGF0Y2guLi4gIEknbSBub3QgdG90YWxseSBzdXJlIEkKPiA+PiA+IHVuZGVyc3RhbmQgYWxs
IHRoZSBpc3N1ZXMgaW52b2x2ZWQuCj4gPj4gCj4gPj4gV2hhdCBJIGhhdmUgZG9uZSBpbiBhIHNp
bWlsYXIgc2l0dWF0aW9uIHdpdGggc3RydWN0IHNpZ2luZm8sIGlzIHRoYXQKPiA+PiB3aGVyZSB0
aGUgc3RydWN0dXJlIGZpcnN0IGFwcGVhcnMgSSBoYXZlIGluaXRpYWxpemVkIGl0IHdpdGggbWVt
c2V0LAo+ID4+IGFuZCB0aGVuIGZpZWxkIGJ5IGZpZWxkLgo+ID4+IAo+ID4+IFRoZW4gd2hlbiB0
aGUgc3RydWN0dXJlIGlzIGNvcGllZCBJIGNvcHkgdGhlIHN0cnVjdHVyZSB3aXRoIG1lbWNweS4K
PiA+PiAKPiA+PiBUaGF0IGVuc3VyZXMgYWxsIG9mIHRoZSBieXRlcyBpbiB0aGUgb3JpZ2luYWwg
c3RydWN0dXJlIGFyZSBpbml0aWFsaXplZAo+ID4+IGFuZCB0aGF0IGFsbCBvZiB0aGUgYnl0ZXMg
YXJlIGNvcGllZC4KPiA+PiAKPiA+PiBUaGUgZ29hbCBpcyB0byBhdm9pZCBtZW1vcnkgdGhhdCBo
YXMgdmFsdWVzIG9mIHRoZSBwcmV2aW91cyB1c2VycyBvZgo+ID4+IHRoYXQgbWVtb3J5IHJlZ2lv
biBmcm9tIGxlYWtpbmcgdG8gdXNlcnNwYWNlLiAgV2hpY2ggZGVwZW5kaW5nIG9uIHdobwo+ID4+
IHRoZSBwcmV2aW91cyB1c2VyIG9mIHRoYXQgbWVtb3J5IHJlZ2lvbiBpcyBjb3VsZCB0ZWxsIHVz
ZXJzcGFjZQo+ID4+IGluZm9ybWF0aW9uIGFib3V0IHdoYXQgdGhlIGtlcm5lbCBpcyBkb2luZyB0
aGF0IGl0IHNob3VsZCBub3QgYmUgYWxsb3dlZAo+ID4+IHRvIGZpbmQgb3V0Lgo+ID4+IAo+ID4+
IEkgdHJpZWQgdG8gdHJhY2UgdGhyb3VnaCB3aGVyZSAiaW5mbyIgYW5kIHRodXMgcHJlc3VtYWJs
eSAiaW5mby0+Zml4IiBpcwo+ID4+IGNvbWluZyBmcm9tIGFuZCBvbmx5IG1hZGUgaXQgYXMgZmFy
IGFzICByZWdpc3Rlcl9mcmFtZWJ1ZmZlci4gIEdpdmVuCj4gPj4gdGhhdCBJIHN1c3BlY3QgYSBs
b2NhbCBtZW1zZXQsIGFuZCB0aGVuIGEgZmllbGQgYnkgZmllbGQgY29weSByaWdodAo+ID4+IGJl
Zm9yZSBjb3B5X3RvX3VzZXIgbWlnaHQgYmUgYSBzb3VuZCBzb2x1dGlvbi4gIEJ1dCBpY2suICBU
aGF0IGlzIGEgbG90Cj4gPj4gb2YgZmllbGRzIHRvIGNvcHkuCj4gPgo+ID4gSSBrbm93IGl0IG1p
Z2h0IHNvdW5kIHF1aXRlIGluZWZmaWNpZW50LCBidXQgd2hhdCBhYm91dCBtYWtpbmcgc3RydWN0
Cj4gPiBmYl9maXhfc2NyZWVuaW5mbyBfX3BhY2tlZD8KPiA+Cj4gPiBUaGlzIGRvZXNuJ3Qgc29s
dmUgb3RoZXIgcG90ZW50aWFsIHNpbWlsYXIgaXNzdWVzLCBidXQgZm9yIHRoaXMKPiA+IHBhcnRp
Y3VsYXIgY2FzZSBpdCBjb3VsZCBiZSBhIHJlYXNvbmFibGUgYW5kIHNpbXBsZSBmaXguCj4gCj4g
SXQgaXMgcGFydCBvZiB0aGUgdXNlciBzcGFjZSBBQkkuICBBcyBzdWNoIHlvdSBjYW4ndCBtb3Zl
IHRoZSBmaWVsZHMuCj4gCj4gRXJpYwoKT2gsIHRoYXQncyByaWdodCEgVGhlbiBtZW1zZXQoKSAr
IG1lbWNweSgpIGlzIHByb2JhYmx5IHRoZSBiZXN0IG9wdGlvbiwKc2luY2UgY29weWluZyBhbGwg
dGhvc2UgZmllbGRzIG9uZSBieSBvbmUgbG9va3MgcXVpdGUgdWdseSB0byBtZS4uLgoKLUFuZHJl
YQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
