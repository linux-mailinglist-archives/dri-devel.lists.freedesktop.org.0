Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA12723B269
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 03:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2256E170;
	Tue,  4 Aug 2020 01:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3846E170
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 01:42:32 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id qc22so25852692ejb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 18:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oezN9XqeDZTraFAD0gVgXVE9vNGaOT6syLa3bn8zEwg=;
 b=rLXmiHGaBgItXJZ36Cu56cErxBry5hi6RyfzvEUEW9gRIX0CuVhK0do5f1r8V1yy5N
 ugN+i3HuZU2pd01jv2FAXyEvHZazEHyD1BB2gf0f0+DvF5Lcrm18dq1ZmFHQENPnChq8
 hTaKEL/NeAqS5saUaRIe+OR2vbRlIKMJW3GzoqUiWNk/xWUM2Ug3e2Ue8ZwavkfhPLNr
 yPy2KMqzmflGxREyoa+aUbZ0iAXPGuKp5pxMIjByhZ/88wawiAdQBb3rSJMq+y/k8EoC
 CBALAAMNPrrr/gnzzqjZeYodaUvAFzDbAx/vWdtV80uJXPT0g/6m1a7LnCFFb6h5lqFU
 kZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oezN9XqeDZTraFAD0gVgXVE9vNGaOT6syLa3bn8zEwg=;
 b=cT2WfN4HiPqcpIqhvwm4EMjo9LvDjDh2dIdZe5IsNY0omvIcDPfI2ynSsaLyv4+sOs
 J35spdgGcMQASmymXMfYiAJqyKJO3h/7SAEVmBvtkNZVAys6eIjIrjPcC1AvoeHcIfYL
 b6B4gjmSrijEyoTarRhhpt5//XdRTyOiMbUT+rIZf76cG5C8M2YBLQ5JyEng5xFDTrTk
 Zd4oVFujaE7iYsmcvpG7EnUJNk9NWTnct3d2Z6O9MCc6sKwGQEE2mEewT2ye6Dn++P5B
 a5v+VXH8kMjx4OJFfcODRlqTV0dJQoUqtYuu9vacEzE4oSxCfevsKdVIrnfuantnos0a
 0L7Q==
X-Gm-Message-State: AOAM5315EVMpKyr7YbiRf9BOwGQZEncez01W+Aw484d5Q+z6v0DeEfEk
 iT+1rp/8Nah4+zaIu3HIxvyecv+WU6EoaIQIFvI=
X-Google-Smtp-Source: ABdhPJw5WuIoYga87FJxPZ1+a7Pr4RYGC4NI2AO/lizieGIc+VptX/KQnhall8tt8ylqysdW0r7KiUigISR29w3Qle0=
X-Received: by 2002:a17:906:b6c3:: with SMTP id
 ec3mr18801217ejb.101.1596505350704; 
 Mon, 03 Aug 2020 18:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-40-airlied@gmail.com>
 <ed4f79bc-d01e-bc78-77ef-5120ae70a64f@amd.com>
In-Reply-To: <ed4f79bc-d01e-bc78-77ef-5120ae70a64f@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 4 Aug 2020 11:42:18 +1000
Message-ID: <CAPM=9tydAjSwOWf_CRUYqM5HzuhWPH8HUYOmn0P1ufGFCB=Gvg@mail.gmail.com>
Subject: Re: [PATCH 39/49] drm/ttm: make ttm_bo_man_init/takedown take type +
 args
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Roland Scheidegger <sroland@vmware.com>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAzMSBKdWwgMjAyMCBhdCAyMzozMiwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDMxLjA3LjIwIHVtIDA2OjA1IHNjaHJpZWIg
RGF2ZSBBaXJsaWU6Cj4gPiBGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+
ID4KPiA+IFRoaXMgbWFrZXMgaXQgZWFzaWVyIHRvIG1vdmUgdGhlc2UgdG8gYSBkcml2ZXIgYWxs
b2NhdGVkIHN5c3RlbQo+Cj4gTm8sIHNvcnJ5IHRoYXQgbG9va3MgbGlrZSBnb2luZyBpbnRvIHRo
ZSB3cm9uZyBkaXJlY3Rpb24gdG8gbWUuCj4KPiBJIGFscmVhZHkgd2FudGVkIHRvIHN1Z2dlc3Qg
dG8gZ2V0IHJpZCBvZiB0aGUgc2l6ZSBhcmd1bWVudCBpbnN0ZWFkLgoKSSdtIG5vdCBzdXJlIGhv
dyBpdCBzaG91bGQgbG9vayB0aGVuLCBJIGRvbid0IHdhbnQgdGhlIGRyaXZlciBwb2tpbmcKYXJv
dW5kIGluc2lkZSB0aGUgcmFuZ2UgbWFuYWdlciBjb2RlLCB0aGUgcmFuZ2UgbWFuYWdlciBzaG91
bGQgYmUgYQpnZW5lcmljIG9iamVjdCB0aGF0IGRyaXZlciBpbml0cyBhbmQgbGVhdmVzIGFsb25l
LAoKSSBkZWZpbml0ZWx5IGRvbid0IHdhbnQgdGhlIGRyaXZlciB0byBiZSBwb2tpbmcgY2FjaGlu
ZyBhbmQgc2l6ZQp2YWx1ZXMgaW50byB0aGUgbWFuIG9iamVjdHMgZm9yIGl0LCBzaW5jZSBpdCBp
c24ndCBhIGRyaXZlciBvYmplY3QuCgpEbyB5b3UgaGF2ZSBzb21lIG90aGVyIHZpZXcgb24gaG93
IHRoZSBnZW5lcmljIHJhbmdlIG1hbmFnZXIgc2hvdWxkIHdvcms/CgpEYXZlLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
