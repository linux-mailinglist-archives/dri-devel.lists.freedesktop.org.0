Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B39326E816
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 00:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307726E3D2;
	Thu, 17 Sep 2020 22:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219C86E2B8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 16:39:10 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id d20so2895074qka.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 09:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+pVCxdlOuttO0x9cQvyDQMtVpumybNdFktYswl2oQtg=;
 b=adzEyNZLe2lQX5kpuTuGY7FirDTdklycKFQYwPubA75xbgb5j6TD8ugrCI9bf7/dzt
 eiHHohZO+AnHSbJDTAvNMn2jBQ6JDcjLQMk3PWJV1eYz6vegb9MVG6Vqa7rp+RbSNba8
 foT0asL3W+B3RxnKV3BG/TZaQkkZydfwK38tce+3QLd4GgBxkdix9rlthBQRsvulbuhr
 znE6bDJ7PC7wrhL7/rCJimbDdwTHZl2Smzt4CuMu660WrRCrToNnF9RBP8oGf4nH0kEJ
 oNpDAzQj7uDJ0JzjGo+G3JuPYol20PLqQ1hak18E+tQ23TdfG63HPVeD5B0NtaY5P4oD
 TA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+pVCxdlOuttO0x9cQvyDQMtVpumybNdFktYswl2oQtg=;
 b=hI8jx/JxZ2tt7eY2a3aVbTPqW3C5nyIrywQdKpP4e+AuxFj01s33PaHZ9WIbODMnML
 pDa8iGtAbaFX8ZuMthdoLI48cZNaKxVv4OXE7KIW2p1BOp+KaM0XGpvLy9L88yGj1na4
 XtCNSi3XvSNi6ADQMNajboZeCABpTCwtJZcvIcGn/r40WtGp6LKzVpXRbXhcFn0CI3nw
 pkkC2wJrJaTSPWx+IGTo5a9fYuamah24C+Ff5GA4b56S4BRkYgVdUJpYm4Ouga2UrXaa
 pig2aAO+ZC5EtcxAasGJFPswsXBLGA8WgJQwSwFhNolY2eb5FxTxPFrR0HAvMtBgbNB0
 /ohQ==
X-Gm-Message-State: AOAM5303qCLeiAuxIjQAYbJvuCbKbfVm8okhVwtGY03mGgP8XW7X5WtJ
 /IWeSi5Avf6fy8toglEDPkTtAg==
X-Google-Smtp-Source: ABdhPJzXIO0eWNvXRiCeMQQ1VpPTu2QRRGdP2RU1h44X5j1zQ/qFh5iONStmiiT0w4aqZdD7WTkmUw==
X-Received: by 2002:a37:5145:: with SMTP id f66mr17238436qkb.299.1600360749095; 
 Thu, 17 Sep 2020 09:39:09 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id 8sm207979qkd.47.2020.09.17.09.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 09:39:08 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kIww7-000WtZ-PQ; Thu, 17 Sep 2020 13:39:07 -0300
Date: Thu, 17 Sep 2020 13:39:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
Message-ID: <20200917163907.GI8409@ziepe.ca>
References: <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca>
 <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
 <20200917143551.GG8409@ziepe.ca>
 <5b330920-c789-fac7-e9b1-49f3bc1097a8@gmail.com>
 <20200917152456.GH8409@ziepe.ca>
 <CAKMK7uHQLAHXC_aBZZco0e3tbAqnNuW8QdJk=-V-yM2khw5e=Q@mail.gmail.com>
 <b9e65f47-b5c8-db09-117a-a8e22a5b6c71@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b9e65f47-b5c8-db09-117a-a8e22a5b6c71@amd.com>
X-Mailman-Approved-At: Thu, 17 Sep 2020 22:17:03 +0000
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTcsIDIwMjAgYXQgMDY6MDY6MTRQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiA+ID4gSWYgaXQgaXMgYWxyZWFkeSB0YWtpbmcgYSBwYWdlIGZhdWx0IEknbSBu
b3Qgc3VyZSB0aGUgZXh0cmEgZnVuY3Rpb24KPiA+ID4gY2FsbCBpbmRpcmVjdGlvbiBpcyBnb2lu
ZyB0byBiZSBhIGJpZyBkZWFsLiBIYXZpbmcgYSB1bmlmb3JtIFZNQQo+ID4gPiBzb3VuZHMgc2Fu
ZXIgdGhhbiBldmVyeSBkcml2ZXIgY3VzdG9tIHJvbGxpbmcgc29tZXRoaW5nLgo+ID4gPiAKPiA+
ID4gV2hlbiBJIHVud291bmQgYSBzaW1pbGFyIG1lc3MgaW4gUkRNQSBhbGwgdGhlIGN1c3RvbSBW
TUEgc3R1ZmYgaW4gdGhlCj4gPiA+IGRyaXZlcnMgdHVybmVkIG91dCB0byBiZSBnZW5lcmFsbHkg
YnVnZ3ksIGF0IGxlYXN0Lgo+ID4gPiAKPiA+ID4gSXMgdm1hLT52bV9maWxlLT5wcml2YXRlX2Rh
dGEgdW5pdmVyc2FsbHkgYSBkbWFfYnVmIHBvaW50ZXIgYXQgbGVhc3Q/Cj4gPiBOb3BlLiBJIHRo
aW5rIGlmIHlvdSB3YW50IHRoaXMgd2l0aG91dCBzb21lIGxhcmdlIHNjYWxlIHJld3JpdGUgb2Yg
YQo+ID4gbG90IG9mIGNvZGUgd2UnZCBuZWVkIGEgdm1vcHMtPmdldF9kbWFidWYgb3Igc2ltaWxh
ci4gTm90IHByZXR0eSwgYnV0Cj4gPiB3b3VsZCBnZXQgdGhlIGpvYiBkb25lLgo+IAo+IFllYWgs
IGFncmVlIHRoYXQgc291bmRzIGxpa2UgdGhlIHNpbXBsZXN0IGFwcHJvYWNoLgoKSSBkb24ndCB0
aGluayB0aGF0IHdpbGwgZmx5LCBpdCBpcyBjbGVhcmx5IG9ubHkgcGFwZXJpbmcgb3ZlciBhIG1l
c3MKaW5zaWRlIERSTS9kbWEgYnVmIDpcCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
