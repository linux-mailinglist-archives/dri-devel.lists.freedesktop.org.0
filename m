Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19968507AFB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 22:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A5110E92F;
	Tue, 19 Apr 2022 20:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2AF10E6D0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 20:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650400264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=be6VP4VL+z444uHhPHKMJh9PH6wDtAablx8mg5VMxYw=;
 b=cGSHDlSCAKOJvA7meram2okhf1Z9IWqZgn1tuGcENIW62ESkhcqw6IDPnvAh/boKESXvBC
 FN6cORlHlA3/TTcqr5jjqWwY8gf6QTIzPuo4mhEGWe4nvHyQIkuxeX57mvRcR4/RHeQo04
 5+JX6Q4GdQUXLhtxMDYmJ9mydKVG0KQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-o7IGqaEwP-2PP-plLnUbLA-1; Tue, 19 Apr 2022 16:31:02 -0400
X-MC-Unique: o7IGqaEwP-2PP-plLnUbLA-1
Received: by mail-qk1-f197.google.com with SMTP id
 u6-20020a05620a430600b0069c0f5ad4e2so13271705qko.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=be6VP4VL+z444uHhPHKMJh9PH6wDtAablx8mg5VMxYw=;
 b=XfyNh17lEn182wWX1dfTD+roypidkYD5OMRZM0fgJLJf0ppT+JkqZmYU/AEgiXAylv
 zFv/kw/8wb+y2tWNxeuVaYO8TN3vuH563TdllpXuxyON4cDAHn1lV0UivKFwzdpPmTjf
 LtVEggvTaaZsJrrn44VV+2h1LbqeWOm15mt3ToOhw648sxNPMo9kFI4bAv42W1x//UGD
 /LZheC5GReCFNY9SFMPG63qO0VWS8c2rxIJ5/o1pAW461bghw9a624NTp7M0Rhrg93MF
 XO0d1Ob/qQFDBAarxKOZmYD8y8XjJqpD1QJwBViEVrvdr52VSGUc+Va7Ux6tocF6FrsX
 ii8Q==
X-Gm-Message-State: AOAM5304wQxowuhz8B0vocmzOewzrhxpP67gBI6vSkBNHyVpI4lp+0NW
 E2lCH1DvKK9E0V6eCVh/oYWe6KGM7Wi9GQ65H9S07p2UMq92kZ+vexOq37L0UHcsDfKhHMGDma4
 MC1Axv7Yk5u1F9AbSiQM47m3yjT5V
X-Received: by 2002:a37:510:0:b0:69e:8868:c691 with SMTP id
 16-20020a370510000000b0069e8868c691mr8634585qkf.731.1650400261758; 
 Tue, 19 Apr 2022 13:31:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/S5ftop0ghBWPqC6VcdbCKk2EHMRpvcn+OOjAta4APIO+s/kcOllMhR+W7PX4+MaicfOv5Q==
X-Received: by 2002:a37:510:0:b0:69e:8868:c691 with SMTP id
 16-20020a370510000000b0069e8868c691mr8634569qkf.731.1650400261514; 
 Tue, 19 Apr 2022 13:31:01 -0700 (PDT)
Received: from [192.168.8.138] (pool-71-126-244-162.bstnma.fios.verizon.net.
 [71.126.244.162]) by smtp.gmail.com with ESMTPSA id
 f16-20020a05622a105000b002ed4688f116sm612817qte.86.2022.04.19.13.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 13:31:00 -0700 (PDT)
Message-ID: <55713be81efe8d2b9d19f6e4ad8d64a88087289f.camel@redhat.com>
Subject: 2022 X.Org Foundation Election vote results
From: Lyude Paul <lyude@redhat.com>
To: elections@foundation.x.org, events@lists.x.org, 
 xorg-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, libre-soc-dev@lists.libre-soc.org, 
 members@x.org
Date: Tue, 19 Apr 2022 16:30:59 -0400
In-Reply-To: <b75862cc1cb0a05b02c9249bb4858e8d9013be30.camel@redhat.com>
References: <b75862cc1cb0a05b02c9249bb4858e8d9013be30.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Board of Directors election and the vote on the By-laws concluded at
23:59 UTC on 18 April 2022. There are 80 current Members of the X.Org
Foundation, and 52 Members cast votes. This is a 65.0% turn out.

In the election of the Directors to the Board of the X.Org Foundation,
the results were that Emma Anholt, Alyssa Rosenzweig, Mark Filion and
Ricardo Garcia were elected for two year terms.

The old full board is: Emma Anholt, Samuel Iglesias Gonsálvez, Mark
Filion, Manasi D Navare, Keith Packard, Lyude Paul, Daniel Vetter, Harry
Wentland

The new full board is: Emma Anholt, Samuel Iglesias Gonsálvez, Mark
Filion, Manasi D Navare, Alyssa Rosenzweig, Lyude Paul, Daniel Vetter,
and Ricardo Garcia

The full election results were as follows:

           Option | Rank 1 | Rank 2 | Rank 3 | Rank 4 | Rank 5 | Rank 6 | Final Score
      Emma Anholt |     21 |     16 |      4 |      1 |      5 |      5 |         240
Alyssa Rosenzweig |      4 |     10 |     17 |      7 |     11 |      3 |         188
      Mark Filion |      8 |     12 |      7 |     10 |      5 |     10 |         186
   Ricardo Garcia |      9 |      4 |      5 |     17 |     10 |      7 |         172
      Lucas Stach |      4 |      5 |     14 |      9 |     11 |      9 |         163
  Shashank Sharma |      6 |      5 |      5 |      8 |     10 |     18 |         143

Lyude Paul, on behalf of the X.Org elections committee

