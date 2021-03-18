Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3544E34103B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 23:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06656E1A7;
	Thu, 18 Mar 2021 22:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98AD6E19A;
 Thu, 18 Mar 2021 22:13:30 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id n198so3992691iod.0;
 Thu, 18 Mar 2021 15:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0HaptGymR4HUOwxLozKPr7kvb5gQ52Lg7qMvwGbqUcM=;
 b=NZnEcrBEh3xXsPf2eQXnpiftQWYKTe+upp98a48uzRmgIzEqYy4SVxdiTuwVwepi0Q
 cRo40dP5kvc6R8V0rGiR2o3+V14AwFIUgb0yluZ2M2tQTKi5yyIBdFoRvCMpMBVO7Bnq
 as2gVu4lz/8FUVcdAb1a7CRz7zxVftdpF+2fqtCRRBwB2IXGBeWGcBh0PIr2UmtPyfYL
 +5kvuOW8wGOOAEFEG8GFnzXm5F9lmkpN84Ivz33hI3t/1onMfwSpqiEZrCDHRXEbZvsf
 lHNBLU89oWLn3RVce0AW+B1X9OUPGj8QGV2z4f6N51CF8VUXuNqeNn1gHcHBzGFXISD/
 /V6Q==
X-Gm-Message-State: AOAM533nh0S5V6TnnqjW7qaHzfacvc7gSWK00zoV5+GZR2HvNRdnNoJR
 dsoEIHUhBkdJIBenEexM62XA4NBuPkPCjbU0Alk=
X-Google-Smtp-Source: ABdhPJzimODivNmwJaUshkKgqrcjmqOF6+4Kx/whpZFqBBwNy4oMZMDvYwBQF1nFpKOUPKPriy9wpbI7GKUegZDKJZs=
X-Received: by 2002:a05:6638:635:: with SMTP id
 h21mr8593715jar.97.1616105610156; 
 Thu, 18 Mar 2021 15:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210318215545.901756-1-lyude@redhat.com>
In-Reply-To: <20210318215545.901756-1-lyude@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 18 Mar 2021 18:13:19 -0400
Message-ID: <CAKb7UviTpAva-kc4-=1oCV_CxHJrZE7mWec0rNrgQ4r-RG8e7w@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nv50-: Check plane size for
 cursors, not fb size
To: Lyude Paul <lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Martin Peres <martin.peres@mupuf.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 5:56 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Found this while trying to make some changes to the kms_cursor_crc test.
> curs507a_acquire checks that the width and height of the cursor framebuffer
> are equal (asyw->image.{w,h}). This is actually wrong though, as we only
> want to be concerned that the actual width/height of the plane are the
> same. It's fine if we scan out from an fb that's slightly larger than the
> cursor plane (in fact, some igt tests actually do this).

How so? The scanout engine expects the data to be packed. Height can
be larger, but width has to match.

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
