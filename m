Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D21B1E7627
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 08:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B216E868;
	Fri, 29 May 2020 06:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E231D6E854
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 02:05:46 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id c8so702459iob.6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 19:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hg2xZZDA50cERmSkTxSoHv3dA+YITOjdmA9J6PIxcak=;
 b=r+TxZPv09RwzrnBomOTTI4Ilcx1rr9w3lDfgHl0OvkTyVr123QujwovUz2RMAkf3E0
 dVebJWpFVh1oCuLdRitJAgD0Sp57RQ1U2vrcMrYAlu+T6yDHQw9Vh9ZkD77SJCeP4t+Q
 hwF61KwrumFGdXh1kSXP6zuoGyeUgpSv7OeOhmdT12uzgx9cPovxKBmzhm7akNDzTbXG
 qYcGFvgkjwvRFD5fwG0hChkORI9Lbp8TBQiuu08v0PBts7aZqgWUxMV34JuituXFYADU
 SH+TiV1jdUZbv0tme3lo7ERSk3+Thzq/7GdeU1ZCbPSdw1rfwsKvuYFDRTPiFR05Tloz
 Llzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hg2xZZDA50cERmSkTxSoHv3dA+YITOjdmA9J6PIxcak=;
 b=kc/Rfj9ehPspcpEqORPYiREyUcnaIeXQIU7phOJRAf5Fnzb3G+yPH5GV81ytiFRw+R
 n7spXl0wRt7ygB5DR0p9MHTBl1g9aMEbozbSjtAP4uW/BIGoom6qQdtZzlqk49bw9DJ0
 Y9SPAqbG/SAGVYBPenOApjO2njH/vSnet732fhgTRoc+uB4+VLyrwX9+/M4p4yZ6oyFG
 aRgriw9zaHEOGn9dAo2re/kvIecpv7UQAiPO7PgXJZZfcnypbNbfP1WwC//kAN/ti1lV
 6dZlVSjVr3kcmKWiTxHAGvRB8meqHj1q1ZiZiUavMioEYyY49219B49FWLT0T68Ct0jv
 PTBw==
X-Gm-Message-State: AOAM530TiwPR3+9h2bROeZcZGNzSdqY2kOMJb3CpQNd8sr2jKLkWab8m
 g2VWDLBudikveFepQO47nDMfavhU5G67LYk+3xwH1bdF
X-Google-Smtp-Source: ABdhPJzMFUtNL5M8jUBpQQdImvq1Xtx/p3vmJ7XtgwaoW/qqwyrix87NbylGAyV7H7UauLs/KQ/X2ZdXtP8NQoXGFMU=
X-Received: by 2002:a05:6602:153:: with SMTP id
 v19mr2858664iot.127.1590717946068; 
 Thu, 28 May 2020 19:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAFSR4ctYjWc8LSqb96Suwprv9=Gd0+vVPZ5pLn+5u1CV7wTq9Q@mail.gmail.com>
 <20200528082523.mvurcvr6ohbziad5@sirius.home.kraxel.org>
In-Reply-To: <20200528082523.mvurcvr6ohbziad5@sirius.home.kraxel.org>
From: Dongyang Zhan <zdyzztq@gmail.com>
Date: Fri, 29 May 2020 10:05:35 +0800
Message-ID: <CAFSR4cu5eg-bkbSqBug5xZeVVinkB0AcLgPp0WnqYxbKxvbM7g@mail.gmail.com>
Subject: Re: Potential Memory Leak Bugs in drivers/gpu/drm/virtio/virtgpu_vq.c
 (Linux 5.6).
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Approved-At: Fri, 29 May 2020 06:46:56 +0000
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T2ssIHRoYW5rcyEKCkdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPiDkuo4yMDIw5bm0
NeaciDI45pel5ZGo5ZubIOS4i+WNiDQ6MjXlhpnpgZPvvJoKPgo+IE9uIFRodSwgTWF5IDI4LCAy
MDIwIGF0IDAzOjU3OjA1UE0gKzA4MDAsIERvbmd5YW5nIFpoYW4gd3JvdGU6Cj4gPiBIaSwKPiA+
IE15IG5hbWUgaXMgRG9uZ3lhbmcgWmhhbiwgSSBhbSBhIHNlY3VyaXR5IHJlc2VhcmNoZXIuCj4g
PiBDdXJyZW50bHksIEkgZm91bmQgdHdvIHBvc3NpYmxlIG1lbW9yeSBidWdzIGluCj4gPiBkcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYyAoTGludXggNS42KS4KPiA+IEkgaG9wZSB5
b3UgY2FuIGhlbHAgbWUgdG8gY29uZmlybSB0aGVtLiBUaGFuayB5b3UuCj4KPiBTb3JyeS4gIE5v
dCBjb25maXJtZWQuICBZb3Ugc2hvdWxkIGRvIGEgYmV0dGVyIGpvYiB2ZXJpZnlpbmcgeW91cgo+
IGNsYWltcyBiZWZvcmUgYnVnZ2luZyBwZW9wbGUuCj4KPiA+IFRoZSBmaXJzdCBvbmUgaXMgcmVz
cF9idWYgd2lsbCBub3QgYmUgcmVsZWFzZSBpbgo+ID4gdmlydGlvX2dwdV9jbWRfZ2V0X2Rpc3Bs
YXlfaW5mbygpIHdpdGggdGhlIGNvbmRpdGlvbgo+ID4gKHJlc3Bfc2l6ZSA8PSBNQVhfSU5MSU5F
X1JFU1BfU0laRSkgaW4gdmlydGlvX2dwdV9hbGxvY19jbWRfcmVzcCgpLgo+Cj4gSW4gdGhhdCBj
b2RlIHBhdGggcmVzcF9zaXplIGVxdWFscyBzaXplb2Yoc3RydWN0Cj4gdmlydGlvX2dwdV9yZXNw
X2Rpc3BsYXlfaW5mbykgd2hpY2ggaXMgbGFyZ2VyIHRoYW4gTUFYX0lOTElORV9SRVNQX1NJWkUK
PiBzbyB0aGUgY29uZGl0aW9uIGlzIG5ldmVyIHRydWUgYW5kIG5vIGxlYWsgaGFwcGVucy4KPgo+
IHRha2UgY2FyZSwKPiAgIEdlcmQKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
