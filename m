Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A29FC7384E6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71E010E476;
	Wed, 21 Jun 2023 13:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBAA10E476;
 Wed, 21 Jun 2023 13:24:34 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3111547c8f9so6869781f8f.1; 
 Wed, 21 Jun 2023 06:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687353872; x=1689945872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mF/025lHMkEmRtTPFqKcm0Vi5RzrrdiwBpzJM5RkWZ8=;
 b=Jr9bfIAKQrvaxFa4rQoB4iHF8uY03ENM5OyAxuR6kuc6ipsREZE/7ifr74zl2QfhV+
 C9Bcwu0EnxVmK8drtToETGjGveagQG5FXv70MzTefjuuFPtdhfWxCA2lDDrKQA1yZofb
 kSBXaBmGEGzUIRJzxYBGmUpqpHqOIFESvXFyXTUD9onvIMxL9uKbZs4qaC4bRJtMoAYE
 pk0lTzJDWf1lJlfxPc/fjr+E8Ipck1Ni1m7Db8Zgt1/3cotxRD/p/5B3q+hzeMBrTOb9
 E7g8MvoLZdGIpZQBDNGe+04yNACmz8mvjxAgJOhfvK6NE1C6PjeEI0EXcCvd/ZgWR7TC
 16KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687353872; x=1689945872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mF/025lHMkEmRtTPFqKcm0Vi5RzrrdiwBpzJM5RkWZ8=;
 b=gtFcyxMGhmI+q7I5r6tn9WaK8fOx/YLKWwPv/BHrz1ipblqVVMW8SSubXEg9fTg+RS
 P0BUVh9f0QgADkSHyiSSnUQhoUWkiPcERcI0vwnBBitsQIGXAIrmrdXi3JyVyKqyyi5h
 BEsm/ExO70d/6jtF5Mcw1B2bwM/ZLHkVuewlkBrs/Miq3EEQuW75F7IGZ6yt0sKUjGcR
 YgLYMFF4Eg6/w9XB0L0WW04E4+QMebvpCjZye3oZdv1gmOJ7jZIwiWV1eSmXTl1ladBz
 4XNSyzrbpUR9hFwitjTU9IGXQ/CXU7eXSZPIF5PAtoR1OKizuhR8wuoGfEyoQuqS734o
 ipmw==
X-Gm-Message-State: AC+VfDxQEcGEQd4FHqlWdY0b1bTyWszdK2tOSpbO80ZqWMMx1nfv2PNn
 HbwvhhKgEa0bghnKbUrzRf4=
X-Google-Smtp-Source: ACHHUZ7BkaCdarEza9XZkyLaO/bP6fh/v4JDjRWZbX+bMSH9YMPiGIo4DpyCzRVH8akPG23G65oX/w==
X-Received: by 2002:a5d:4643:0:b0:30e:4a21:808b with SMTP id
 j3-20020a5d4643000000b0030e4a21808bmr12971936wrs.55.1687353871739; 
 Wed, 21 Jun 2023 06:24:31 -0700 (PDT)
Received: from suse.localnet (host-79-50-220-240.retail.telecomitalia.it.
 [79.50.220.240]) by smtp.gmail.com with ESMTPSA id
 w18-20020a5d4b52000000b003127a21e986sm4447046wrs.104.2023.06.21.06.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 06:24:31 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>, Ira Weiny <ira.weiny@intel.com>, 
 Thomas =?ISO-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v2] drm/i915: Replace kmap() with kmap_local_page()
Date: Wed, 21 Jun 2023 15:24:29 +0200
Message-ID: <13316568.uLZWGnKmhe@suse>
In-Reply-To: <79e1f37f-3ffa-0195-860b-08cc890d810e@shipmail.org>
References: <20230620180759.GA419158@sumitra.com>
 <79e1f37f-3ffa-0195-860b-08cc890d810e@shipmail.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Deepak R Varma <drv@mailo.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On mercoled=EC 21 giugno 2023 11:06:51 CEST Thomas Hellstr=F6m (Intel) wrot=
e:
>=20
> I think one thing worth mentioning in the context of this patch is that
> IIRC kmap_local_page() will block offlining of the mapping CPU until
> kunmap_local(),

Migration is disabled.

> so while I haven't seen any guidelines around the usage
> of this api for long-held mappings,

It would be advisable to not use it for long term mappings, if possible. Th=
ese=20
"local" mappings should better be help for not too long duration.=20

> I figure it's wise to keep the
> mapping duration short, or at least avoid sleeping with a
> kmap_local_page() map active.

Nothing prevents a call of preempt_disable() around the section of code=20
between kmap_local_page() / kunmap_local(). If it is needed, local mappings=
=20
could also be acquired under spinlocks and/or with disabled interrupts.

I don't know the code, however, everything cited above could be the subject=
 of=20
a subsequent patch.

Regards,

=46abio

> I figured, while page compression is probably to be considered "slow"
> it's probably not slow enough to motivate kmap() instead of
> kmap_local_page(), but if anyone feels differently, perhaps it should be
> considered.
>=20
> With that said, my Reviewed-by: still stands.
>=20
> /Thomas
>=20



