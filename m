Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E56A35D59
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 14:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90A589336;
	Wed,  5 Jun 2019 12:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841D089336;
 Wed,  5 Jun 2019 12:57:31 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id h10so5619557edi.13;
 Wed, 05 Jun 2019 05:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mNwmQAhzOwQjP+3QJ9Qyx716sV+MvZek24hV7EIWuEc=;
 b=pVdNrUAatsz2HrC8rwPi3xLdlyU0poxGL27ihZe7IkmBMAJy55zwAksF6D1CIV5qRR
 vWa06YCrm7vots/XfP9Xp4SyO/+x5lDB0dLNG+RerAagpnX+a6YqPuDvIFrfDzsMLJGZ
 EuO6VikW1rjL2w1FI0pC9bqch1nuMRaxAEc5oKeNP+On5TYz9G/tYOdmPatc9GLZ8ipa
 tvkyFaGF1GloO0b4f/PrHbCB0RNOKNvLHsO0HvicNJDe/CbjFbDinOTIG3UTHhKQy/zY
 Qdx8C2r3TvRMmnJDDkHpzzcQFc16SM0wi1xq2t+Iq95T9yTed8G6DOIXU6aajCfUaUBh
 CivQ==
X-Gm-Message-State: APjAAAWefS9NyOcMh3Xa72Zh6Vta7Ci7I7VwqwTQdF96ijp/13174wRs
 e2eAiDm00jGgpcjft85J6NvYnqwGdQ5r9WmAsdxX0vzTdeU=
X-Google-Smtp-Source: APXvYqz1vxq2jyAjvwPKAI30zCoOlIgNefzBtyYxFxTl0wx0mcMOz/q43eVDTS2eLaVvoero3Qx6Gl/7d2TUyTJ/Pns=
X-Received: by 2002:a17:906:85d4:: with SMTP id
 i20mr20270754ejy.256.1559739450124; 
 Wed, 05 Jun 2019 05:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20181201165348.24140-1-robdclark@gmail.com>
 <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
 <CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
 <CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
 <CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
 <CAF6AEGtj+kyXqKeJK2-0e1jw_A4wz-yBEyv5zhf5Vfoi2_p2CA@mail.gmail.com>
 <CAAFQd5Dmr+xyd4dyc_44vJFpNpwK6+MgG+ensoey59HgbxXV6g@mail.gmail.com>
In-Reply-To: <CAAFQd5Dmr+xyd4dyc_44vJFpNpwK6+MgG+ensoey59HgbxXV6g@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Jun 2019 05:57:16 -0700
Message-ID: <CAF6AEGuj=QmEWZVzHMtoDgO0M0t-W9+tay5F4AKYThZqy=nkdA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] of/device: add blacklist for iommu dma_ops
To: Tomasz Figa <tfiga@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mNwmQAhzOwQjP+3QJ9Qyx716sV+MvZek24hV7EIWuEc=;
 b=MQwC6cZRlpJp8S8gEeUy0yt/YY6pRXiNx3qhhdxZz9mLO9tFistVEu7HCQyTCKskfV
 QpilpgNDrSsy0SJeh+jsSnNea/tjgHTWFNws8h4ueQKU5kh1xYGg9Q1gyK3vv6zxAnHw
 sU97TDHpfGjxnf2hgH7zC8Dfg2zLXJcMhil+tT/laN5pH5eVwjNqHpydN74VC65OcIlw
 L9iWQeysiJXDLU7R9xRH0J9WW7JcL5/NzkTplwLoLIL+Gsgnwi27Fh8B4Fb74VRhZPAc
 I5l9I4aOJVWnaQQ8y39Ju17r1ll91KBxJFYq3FZblaRbSz0Nr10NIb77Pp/mAXG0FHCq
 9YUA==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gNCwgMjAxOSBhdCAxMTo1OCBQTSBUb21hc3ogRmlnYSA8dGZpZ2FAY2hyb21p
dW0ub3JnPiB3cm90ZToKPgo+IEJ1dCBmaXJzdCBvZiBhbGwsIEkgcmVtZW1iZXIgTWFyZWsgYWxy
ZWFkeSBzdWJtaXR0ZWQgc29tZSBwYXRjaGVzIGxvbmcKPiBhZ28gdGhhdCBleHRlbmRlZCBzdHJ1
Y3QgZHJpdmVyIHdpdGggc29tZSBmbGFnIHRoYXQgbWVhbnMgdGhhdCB0aGUKPiBkcml2ZXIgZG9l
c24ndCB3YW50IHRoZSBJT01NVSB0byBiZSBhdHRhY2hlZCBiZWZvcmUgcHJvYmUuIFdoeQo+IHdv
dWxkbid0IHRoYXQgd29yaz8gU291bmRzIGxpa2UgYSBwZXJmZWN0IG9wdC1vdXQgc29sdXRpb24u
CgpBY3R1YWxseSwgeWVhaC4uIHdlIHNob3VsZCBkbyB0aGF0LiAgVGhhdCBpcyB0aGUgc2ltcGxl
c3Qgc29sdXRpb24uCgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
