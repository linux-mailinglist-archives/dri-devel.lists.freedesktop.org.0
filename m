Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBCBD0403
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 01:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851896E8B1;
	Tue,  8 Oct 2019 23:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D046E8B1;
 Tue,  8 Oct 2019 23:20:04 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y23so508430lje.9;
 Tue, 08 Oct 2019 16:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VQzXIoav405TT6dTemcqRuBgqHl3Y5FGjDgTpEh2AX0=;
 b=bkm2lsvJ0QTZ/DDTO8ZigVQgjIT/f1xwcreUb1RkxT6i5DG7gtqMhlhGBPJdC3Na7+
 Ogwr7VV2t9DZZ4XWSjl0E0NHxvCJEDOuPSC7Yre6uBs0tED8ln29WmJ0Dhrx2v1JQ9dC
 vg+nzRu7wJtXYDD3v0V5po5Ly3wfj/KrnnAjmOgQRgqX6pBPHRpa9i3fYI1+czmnChKl
 dFVbSjnzpNtOJW7hSD/wIRCfvmlJKSLMtqLoLXOSiwUqGI77+kB2qfXCvmmMmuT+NIXn
 KiieRCfJ9yN8QKFr4ZzikghLgvaXah/bZg1ViFuFqzycypquV6Cyt+Tt0A9Ffhoei/F4
 v/VQ==
X-Gm-Message-State: APjAAAVL5fezng8vtp9U9kDfm0nm+uednXRohfGL+z5sIjRLMdP4wr1q
 CoLBf97n6uggwUGzNS9/wWDPRNmPYUpqTxfQ8jw=
X-Google-Smtp-Source: APXvYqxLEPTdWz9wY2BNYg2D/fGr1ZoSwp7v6UJ6zTFGxpZDHfwhwhNsXbpzW6XanOG3N9z/9eFE9mT18ZQ+jABUNCc=
X-Received: by 2002:a2e:86cd:: with SMTP id n13mr371368ljj.239.1570576803225; 
 Tue, 08 Oct 2019 16:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190904171723.2956-1-robdclark@gmail.com>
 <CAOMZO5DgnB0kuSTxg1=ngJYiRvbq6bqBC4K-R5nQMzEinBYq7A@mail.gmail.com>
 <CAF6AEGtTt4Em=7GJiuqhAdvJ-cB8hp=iOuT7egoVr3vW=VMN5w@mail.gmail.com>
In-Reply-To: <CAF6AEGtTt4Em=7GJiuqhAdvJ-cB8hp=iOuT7egoVr3vW=VMN5w@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 8 Oct 2019 20:19:52 -0300
Message-ID: <CAOMZO5DLp+EqMgJg4x8dBXFAPbZ4toKVBdnXdD9EA0b19Zv6yQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Use the correct dma_sync calls harder
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VQzXIoav405TT6dTemcqRuBgqHl3Y5FGjDgTpEh2AX0=;
 b=P0GQwFclyAzgyHYeMi6w5wApIanM9xSKPtF53wBOKuxv8w/yL27B5CqMv7U5ZihRTO
 jnJx3PhjSh0jIlehA8TnA+zuRwVYCoGm9pC+wl/jEz3LhAozEXuXQbNQQNtY4DSxMoMt
 n8Vl+0XqJtr00HaeChLQ6ExT1ZW652aRWesfadjpPZl1H/vEu6Ei1JFfFPiniqxo3BGz
 iA7jpAP+3diAjxhmyMr/bVdlYiXIsCdmCEFAkey+Vz9hAcIU5mKwcQsI5gqK8Wc5OsWO
 FbTFbDTUeOdNnVGoJeWwp9PzGuHryS3jYq0BUQqlzaDFjcYq0f9HGtzBgmJ9rgcvCVaJ
 E1bA==
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gVHVlLCBPY3QgOCwgMjAxOSBhdCA4OjA4IFBNIFJvYiBDbGFyayA8cm9iZGNs
YXJrQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IGFmYWljdCB0aGlzIHNob3VsZCBiZSBhdCBsZWFzdCBp
biB2NS40LXJjMi4uIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/CgpZb3UgYXJlIHJpZ2h0LCBpdCBp
cyBpbiA1LjQtcmMgaW5kZWVkLCBzb3JyeS4KCkl0IGlzIDUuMy54IHN0YWJsZSB0aGF0IGhhcyB0
aGlzIGNvbW1pdCBtaXNzaW5nLCBidXQgSSBndWVzcyBpdCB3aWxsCmJlIGJhY2twb3J0ZWQgYXQg
c29tZSBwb2ludC4KClRoYW5rcyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
