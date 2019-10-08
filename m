Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 406E0D03D1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 01:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABD56E8AB;
	Tue,  8 Oct 2019 23:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6009E6E8AA;
 Tue,  8 Oct 2019 23:08:18 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r9so282150edl.10;
 Tue, 08 Oct 2019 16:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m05pDGZbsmhzbNGDVdoCCzYWm/2mMB34A9buFwlNp74=;
 b=X73qoMfFj/RPEXlaZv+XfqiwXlikGn/cgCSD8BYgcxAPGzMoyuHGpIbOEPuLQWEI5Z
 XhNmtmZwGvz4LZlZPDsIVNZY11zohkbU23I+q2nDeiol6TQbA1v8zbSSzMdnYpX+zQnm
 pBy1a/acWoenNW9D6eFyo9vO8OD34/MUssn2ulsCqsattAsOGm5V1PbICLbBm5zZWwj2
 Ti8qXL9KuKJnHOkxIha6R2RdkLyPce8OxumxSlHadzvAtPoj/fFyIfSM19y71bWuVNAP
 KUYyWsQBnbCtXgORLuQteBsOdbahunIR+xXPErNGqbtmbx+CnG3GtfX+Owjk2kJtYH1Y
 L/9g==
X-Gm-Message-State: APjAAAXN5/zwo6mEqn/0fYDPh+V6tfvxrNmRZ9Yd6ZI+9xSHEYLr00YB
 Wjm/+Dj2Cg6FRey6u1+NNR6RUMt90BQcd759nPIkdQSe
X-Google-Smtp-Source: APXvYqzfJEUClDx5VkmVpottFYGdPrGDGEyJc9nTTMrE1y2oto+PY6SOncAVBcyPn5xQTMvrJXn8EaSZxX2RzN0PHDc=
X-Received: by 2002:a05:6402:557:: with SMTP id
 i23mr399826edx.71.1570576096925; 
 Tue, 08 Oct 2019 16:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190904171723.2956-1-robdclark@gmail.com>
 <CAOMZO5DgnB0kuSTxg1=ngJYiRvbq6bqBC4K-R5nQMzEinBYq7A@mail.gmail.com>
In-Reply-To: <CAOMZO5DgnB0kuSTxg1=ngJYiRvbq6bqBC4K-R5nQMzEinBYq7A@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 8 Oct 2019 16:08:05 -0700
Message-ID: <CAF6AEGtTt4Em=7GJiuqhAdvJ-cB8hp=iOuT7egoVr3vW=VMN5w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Use the correct dma_sync calls harder
To: Fabio Estevam <festevam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=m05pDGZbsmhzbNGDVdoCCzYWm/2mMB34A9buFwlNp74=;
 b=PCGM6guQKhDbaOQdYY6yu/4FRo9KFErdzinvSJkD/xR34bkT83TUTqzx86ts6dUBIY
 Nqgf5WKWb6yQO9x3LUq1zENOssXQWqFYeZZ03ylWwN0vqyoMBrZc0SiDhE1mNMGGtRn2
 imNB6637YBRg/Jsw9usqT2MgtBeR2EJ9w2vPMz+4uljvly8BPXW8nt16RFhBVw78KneW
 4fkCuNLxd5BuDStS2/Y0N96jHHXmgOucs0AEs2P+XFkXUnf3qbhdNaTCgCY4q2prPFnO
 7+32tqKT9otZjZTB0S5GtWQ52BaI4a1D22bvIh2vk6mcDz0hcARptsXrqvCo12AZqb/Y
 aAoA==
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

T24gVHVlLCBPY3QgOCwgMjAxOSBhdCA5OjExIEFNIEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBSb2IsCj4KPiBPbiBXZWQsIFNlcCA0LCAyMDE5IGF0IDI6
MTkgUE0gUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBGcm9t
OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gPgo+ID4gTG9va3MgbGlrZSB0
aGUgZG1hX3N5bmMgY2FsbHMgZG9uJ3QgZG8gd2hhdCB3ZSB3YW50IG9uIGFybXY3IGVpdGhlci4K
PiA+IEZpeGVzOgo+ID4KPiA+ICAgVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVl
c3QgYXQgdmlydHVhbCBhZGRyZXNzIDUwMDAxMDAwCj4gPiAgIHBnZCA9IChwdHJ2YWwpCj4gPiAg
IFs1MDAwMTAwMF0gKnBnZD0wMDAwMDAwMAo+ID4gICBJbnRlcm5hbCBlcnJvcjogT29wczogODA1
IFsjMV0gU01QIEFSTQo+ID4gICBNb2R1bGVzIGxpbmtlZCBpbjoKPiA+ICAgQ1BVOiAwIFBJRDog
MSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQgNS4zLjAtcmM2LTAwMjcxLWc5ZjE1OWFlMDdm
MDcgIzQKPiA+ICAgSGFyZHdhcmUgbmFtZTogRnJlZXNjYWxlIGkuTVg1MyAoRGV2aWNlIFRyZWUg
U3VwcG9ydCkKPiA+ICAgUEMgaXMgYXQgdjdfZG1hX2NsZWFuX3JhbmdlKzB4MjAvMHgzOAo+ID4g
ICBMUiBpcyBhdCBfX2RtYV9wYWdlX2NwdV90b19kZXYrMHgyOC8weDkwCj4gPiAgIHBjIDogWzxj
MDExYzc2Yz5dICAgIGxyIDogWzxjMDExODFjND5dICAgIHBzcjogMjAwMDAwMTMKPiA+ICAgc3Ag
OiBkODBiNWE4OCAgaXAgOiBkZTk2YzAwMCAgZnAgOiBkODQwY2U2Ywo+ID4gICByMTA6IDAwMDAw
MDAwICByOSA6IDAwMDAwMDAxICByOCA6IGQ4NDNlMDEwCj4gPiAgIHI3IDogMDAwMDAwMDAgIHI2
IDogMDAwMDgwMDAgIHI1IDogZGRiNmMwMDAgIHI0IDogMDAwMDAwMDAKPiA+ICAgcjMgOiAwMDAw
MDAzZiAgcjIgOiAwMDAwMDA0MCAgcjEgOiA1MDAwODAwMCAgcjAgOiA1MDAwMTAwMAo+ID4gICBG
bGFnczogbnpDdiAgSVJRcyBvbiAgRklRcyBvbiAgTW9kZSBTVkNfMzIgIElTQSBBUk0gIFNlZ21l
bnQgbm9uZQo+ID4gICBDb250cm9sOiAxMGM1Mzg3ZCAgVGFibGU6IDcwMDA0MDE5ICBEQUM6IDAw
MDAwMDUxCj4gPiAgIFByb2Nlc3Mgc3dhcHBlci8wIChwaWQ6IDEsIHN0YWNrIGxpbWl0ID0gMHgo
cHRydmFsKSkKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJv
bWl1bS5vcmc+Cj4gPiBGaXhlczogM2RlNDMzYzViMzhhICgiZHJtL21zbTogVXNlIHRoZSBjb3Jy
ZWN0IGRtYV9zeW5jIGNhbGxzIGluIG1zbV9nZW0iKQo+ID4gVGVzdGVkLWJ5OiBGYWJpbyBFc3Rl
dmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Cj4KPiBJIHNlZSB0aGlzIG9uZSBnb3QgYXBwbGllZCBp
biBsaW51eC1uZXh0IGFscmVhZHkuCj4gQ291bGQgaXQgYmUgc2VudCB0byA1LjQtcmMsIHBsZWFz
ZT8KCmFmYWljdCB0aGlzIHNob3VsZCBiZSBhdCBsZWFzdCBpbiB2NS40LXJjMi4uIGFtIEkgbWlz
c2luZyBzb21ldGhpbmc/CgpCUiwKLVIKCj4KPiBteDUzIGJvYXJkcyBjYW5ub3QgYm9vdCBpbiBt
YWlubGluZSBiZWNhdXNlIG9mIHRoaXMuCj4KPiBUaGFua3MKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
