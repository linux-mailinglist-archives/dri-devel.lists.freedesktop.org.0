Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E2C2F20D7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 21:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DEB89B11;
	Mon, 11 Jan 2021 20:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B1A89B11
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 20:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610397106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2kB21kABqOOu7gOcB3+o+ykSXSkI5oDu8DPYbkJeBA=;
 b=Q2FhOvtZmlkKqLeVc2iVxIsvQcuZQmDbk14ExwkvkSwxyCVYEU20/hNffuE9w8O9OdCOE9
 BqAQNYXJg3GHEIsOwYVGYZEyH2nn/rnMA8WVCXmmfNvsrnLsKD5ypWBK7ynjrq129XRfYo
 VY0xQHVHboY2Uwi5wI5cnxEmcSpobNw=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-NN1oAui_O6CPYcEAYqaoYg-1; Mon, 11 Jan 2021 15:31:45 -0500
X-MC-Unique: NN1oAui_O6CPYcEAYqaoYg-1
Received: by mail-il1-f200.google.com with SMTP id l14so449550ilq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 12:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+2kB21kABqOOu7gOcB3+o+ykSXSkI5oDu8DPYbkJeBA=;
 b=AbLQeG3NZpTIpWdnQuMRDVuPmFjkWD4T51ulz0Il7P1ytxlT9STMt4/Fd6TejRrpLr
 UUsabjVz20rnBRkyjeG7weSP98jPD8zl2dXPYHb9AJcJCv0W8vqC1TfmTytCqtd1ZOJ9
 eCtKk3DimGLVpUq9YevXpvY6ry0PoKO86wjknFTXPAG8ztLBYEsQLZUfaB1zU8vNoW7v
 dcoSEXFGKG7FZwWJxWhGbH7Fln3CNCZgH4Dagt8//210fpoHfmRRVSfXlgfQy3Pk9em+
 ftuA0Wtay1HgQlUQjPbmxiDfZ4xLDneypEcJtrathPp1LDP83avLR+sB2oSj01Qzp/fl
 QxVg==
X-Gm-Message-State: AOAM532mgeG/dyYsc1iUJhHxf2/6iavQA9hsC3IRLBaJ71TbV6VuC/Wh
 41v0zWBmFjk2uoyvMsnh9fFssQwqt9LuBkIWTTMwUcZ5zEbVrrwnK4ujNLX1XtiN1MF4ajy7Zkj
 PhjzDSoiQ0e0e57E8F46nUxsOXadI
X-Received: by 2002:a02:c9cc:: with SMTP id c12mr1326492jap.116.1610397104444; 
 Mon, 11 Jan 2021 12:31:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKhDndwsOo2nRD5VZRaC8ko0qBQPThQauo77lSvQeu/a6IRHRXlNcv8N/azwv1N1MAovUXww==
X-Received: by 2002:a02:c9cc:: with SMTP id c12mr1326478jap.116.1610397104214; 
 Mon, 11 Jan 2021 12:31:44 -0800 (PST)
Received: from xps13 ([2605:a601:a63a:4d01:c3c1:7008:ba35:96])
 by smtp.gmail.com with ESMTPSA id w3sm494775ilk.17.2021.01.11.12.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 12:31:43 -0800 (PST)
Date: Mon, 11 Jan 2021 15:31:42 -0500
From: Jeremy Cline <jcline@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/ttm: Fix address passed to dma_mapping_error() in
 ttm_pool_map()
Message-ID: <20210111203142.GA51463@xps13>
References: <20210111164033.695968-1-jcline@redhat.com>
 <cbd76108-a7c4-119b-b045-eb857a84fcab@amd.com>
MIME-Version: 1.0
In-Reply-To: <cbd76108-a7c4-119b-b045-eb857a84fcab@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMDk6MjE6NDhQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAxMS4wMS4yMSB1bSAxNzo0MCBzY2hyaWViIEplcmVteSBDbGluZToKPiA+
IGNoZWNrX3VubWFwKCkgaXMgcHJvZHVjaW5nIGEgd2FybmluZyBhYm91dCBhIG1pc3NpbmcgbWFw
IGVycm9yIGNoZWNrLgo+ID4gVGhlIHJldHVybiB2YWx1ZSBmcm9tIGRtYV9tYXBfcGFnZSgpIHNo
b3VsZCBiZSBjaGVja2VkIGZvciBhbiBlcnJvciwgbm90Cj4gPiB0aGUgY2FsbGVyLXByb3ZpZGVk
IGRtYV9hZGRyLgo+ID4gCj4gPiBGaXhlczogZDA5OWZjOGY1NDBhICgiZHJtL3R0bTogbmV3IFRU
IGJhY2tlbmQgYWxsb2NhdGlvbiBwb29sIHYzIikKPiA+IFNpZ25lZC1vZmYtYnk6IEplcmVteSBD
bGluZSA8amNsaW5lQHJlZGhhdC5jb20+Cj4gCj4gR29vZCBjYXRjaC4gUmV2aWV3ZWQgYW5kIHB1
c2hlZCB0byBkcm0tbWlzYy1maXhlcywgc2hvdWxkIGJlIGluIHRoZSAtcmMgYnkKPiB0aGUgd2Vl
a2VuZC4KPiAKCkdyZWF0LCBtYW55IHRoYW5rcyEKCi0gSmVyZW15CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
