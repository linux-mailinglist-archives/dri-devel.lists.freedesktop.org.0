Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E22527BDB9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D02D6E0BA;
	Tue, 29 Sep 2020 07:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEE389F27;
 Mon, 28 Sep 2020 10:22:55 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa829d39;
 Mon, 28 Sep 2020 09:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=wTAhT9EYxTkHdUEgSfGeOhslmQ8=; b=lAblRJ
 I0VxgjLuhvHrMmvpKN/6dpPSVtG3oWVHQGKKCZzFG779KRafrpi5AB4vRvMrcsVz
 SlJwSS82Byw84Ewy4npsCvqIZk5h3tFrWUc1kwLUiWCvT0kT0o76w2hnY7stVwGh
 wr0lARQSXHVrh3/1/qXUBClb/K/1aa+I3UdBpspjx5sXGqSRXV/rQte1v27fP3he
 y8WMx7hmIA4chBGr/RXcxRfC8etKwCRTlXzHJKsd1euHQNYTiyCfOn6t1FxUDl5+
 9B4XsBK7Errr4y+9CHJ31d3L+xdynZjvO+woDImwuPO85Lqa2FyBRPaew/UUMagC
 InGEjzoGBoOQQvcw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5b612ff7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 28 Sep 2020 09:51:27 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id f15so663545ilj.2;
 Mon, 28 Sep 2020 03:22:54 -0700 (PDT)
X-Gm-Message-State: AOAM531gug4QME6sMboRwGijlvLAnr/nLs/rwYZnmMhYBSpyOCmM22WQ
 vmCtg/RfpIz9RXAITx0f8fjeul/2PDfybrIoIPU=
X-Google-Smtp-Source: ABdhPJyZRzG1bbGT6XpASR1fpR2gx9TmJTgCyZ7QIBzrdzJrmTojXadzf89yA17ovlLpgM+2msLgC+ayvNRMnU0GABs=
X-Received: by 2002:a92:988c:: with SMTP id a12mr548508ill.38.1601288573296;
 Mon, 28 Sep 2020 03:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9odvKzyAG7HgzSE-1gLOfiU=HL1MB5w4z=AwOsjz9WJPA@mail.gmail.com>
 <CAHmME9qPo_MNrVioY=qgOVNxYBVY1_i_eep5wzP-7Akq5fH1Xg@mail.gmail.com>
 <CAHmME9qBtUuOSEU3Cb9rL7SHaBAwk862VEPdmYcisnSHDERtvQ@mail.gmail.com>
In-Reply-To: <CAHmME9qBtUuOSEU3Cb9rL7SHaBAwk862VEPdmYcisnSHDERtvQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 28 Sep 2020 12:22:42 +0200
X-Gmail-Original-Message-ID: <CAHmME9ppPhLLtS4Vd5g-Yz9dZUUc7V_yjA8qOkYs4HsnGWtpcQ@mail.gmail.com>
Message-ID: <CAHmME9ppPhLLtS4Vd5g-Yz9dZUUc7V_yjA8qOkYs4HsnGWtpcQ@mail.gmail.com>
Subject: Re: 5.9-rc7 null ptr deref in __i915_gem_userptr_get_pages_worker
To: Jason Gunthorpe <jgg@ziepe.ca>, Peter Xu <peterx@redhat.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Linux-MM <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Oh, this is just a copy and paste error, when the code was originally
pasted from internal_get_user_pages_fast, which assumes a current.
I'll fix this up and send a patch shortly.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
