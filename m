Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D82BDAA2F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 18:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCF510E65F;
	Tue, 14 Oct 2025 16:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Gp/aS5Nn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDBE10E63D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:10:11 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-46e3e16d7fbso8961605e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1760454610; x=1761059410; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+9sQqZFGj6pjO2HmOLKtnRlFSVSp+ASbakb0jxv6v+E=;
 b=Gp/aS5Nnj9HR3qziH65vci48EKrDNvcsUy6lhrrOwYfwOu2uippVQyoYGBtFZf/BS+
 kd0aMzRtMbd1auAXQSTJb1aOwMezY0GxRBk36GLVbeGLHnJlVGh0tro2y/yfTiN6UQ2z
 YvohX2+4/nThEhiKuONstOFZDO4ZGRaAwQEHHroWNiENodmF5X7oYftKvpWy7XUR6LL/
 2ujh+hwQ9vjflRCwhXtbbvHzIblTlkpCgrJFwDZ6slkOt+nazvJr1X5Y6VhvJbilCGN1
 qr+6v793eh1PWWtOE4q6d0EeKgQC48Gg9iQ6PaTYfbtIoq/vKhWOe9081Lut/aUWF76a
 xfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760454610; x=1761059410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+9sQqZFGj6pjO2HmOLKtnRlFSVSp+ASbakb0jxv6v+E=;
 b=IsYLdfixhS8cpT0b0v8wEGz9Etz3nNXCsbFkKZW78glthUUrLMPjvRPmnmG2/NM74C
 z36JaYkcAmevIRAYMj5K0/n+CcLHkZ2KuHOYNIFFMimFE+HD30f3RPnmmRAbuV6GLiew
 RaDuYdJatyeR2vHeO60JGz11w4uDJavPPCn7Q6qFodVU+LH/0E6nkNnFMOnH8lqBrhX9
 cU/+F7rm0RU/YR7LShUoPSLCM3uPjgXWiPthptKBQ8NF4KiTpHTb3i6fKO6mKCWlMesz
 N4WRABj0JoE+mLIaWMZJKuG8z7rLGvPxSJ83PNg9O6Esu+JzPMCohatXFG892li7YcNB
 goig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCWJL1ec2Vzg/gWk6OWR3KuNibEL8YydLtj/uJhQdUY4BY3z4vLaVk0fVPZ6qhb319LbSYOdvjvUM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yycszi8qh8GerlbU/UbLlViHiCfPHHgiUq2rL5mQyxlFhqrjLFF
 0aCmwRJqFrKYor7LKeABrffifaGh9t9D98YOq+OybxlArfBrFw3PCtNcbYeFYZyDwT4=
X-Gm-Gg: ASbGncsmq9I3x4q+TSHGedVrjxj8N0tcQuzSZZ8C/k5V14aV3ggPqIu5DihYuG/TgO3
 gxV7zd9ZIWl4xTD9ASZY9zP5vUaADzY2JIcVVASHhhdWyM7bLt5cQOv/MFqTs6iwinUmlJitWNU
 A1tyTWYYm0Gi/VEFM+YMyLI79NHniZ/6si3TV7HsxYLlS9FrC62UTNfJErSPVzCb3uvj0NBn9rt
 Ktt3hFaPTfV8U247qfAxC0e3urOAH07WmaSlJb0Z8CbWxvjIxg7Wba0lLVCCdA5RHgaBafciogj
 tbKAX0/qXp1pwxjQotqlWknwDDQ8htgQWTi7ySMmH6iFT8PrLXeFC7icGyEM8YP+G60dt9FLSYw
 rp28aHG83RURVOdIkTefLShc=
X-Google-Smtp-Source: AGHT+IGAXLObLFqWvdrlT8jNvhDt4TeOuL5i0Y/T3RwGkmTWxiheZJLoRR4en+J0WUHha4o/PPCBLQ==
X-Received: by 2002:a05:600c:4e93:b0:45f:2919:5e9c with SMTP id
 5b1f17b1804b1-46fa9a8ae60mr100424145e9.2.1760454609668; 
 Tue, 14 Oct 2025 08:10:09 -0700 (PDT)
Received: from mordecai.tesarici.cz ([213.235.133.42])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb489194dsm244369755e9.12.2025.10.14.08.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 08:10:09 -0700 (PDT)
Date: Tue, 14 Oct 2025 17:10:03 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Zhaoyang Huang <huangzhaoyang@gmail.com>, "zhaoyang.huang"
 <zhaoyang.huang@unisoc.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Mel Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, steve.kang@unisoc.com
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
Message-ID: <20251014171003.57bbfd63@mordecai.tesarici.cz>
In-Reply-To: <ecba7133-699c-4f3e-927c-bad5bd4c36a3@amd.com>
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
 <20251014083230.1181072-3-zhaoyang.huang@unisoc.com>
 <87953097-a105-4775-88a5-9b3a676ff139@amd.com>
 <CAGWkznGN7W-txq_G+xpZ6DtH_1DNorYc=CxqUjebo7qfB4Sxsw@mail.gmail.com>
 <ecba7133-699c-4f3e-927c-bad5bd4c36a3@amd.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 14 Oct 2025 16:36:49 +0000
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

On Tue, 14 Oct 2025 15:04:14 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 14.10.25 14:44, Zhaoyang Huang wrote:
> > On Tue, Oct 14, 2025 at 7:59=E2=80=AFPM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote: =20
> >>
> >> On 14.10.25 10:32, zhaoyang.huang wrote: =20
> >>> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> >>>
> >>> The size of once dma-buf allocation could be dozens MB or much more
> >>> which introduce a loop of allocating several thousands of order-0 pag=
es.
> >>> Furthermore, the concurrent allocation could have dma-buf allocation =
enter
> >>> direct-reclaim during the loop. This commit would like to eliminate t=
he
> >>> above two affections by introducing alloc_pages_bulk_list in dma-buf's
> >>> order-0 allocation. This patch is proved to be conditionally helpful
> >>> in 18MB allocation as decreasing the time from 24604us to 6555us and =
no
> >>> harm when bulk allocation can't be done(fallback to single page
> >>> allocation) =20
> >>
> >> Well that sounds like an absolutely horrible idea.
> >>
> >> See the handling of allocating only from specific order is *exactly* t=
here to avoid the behavior of bulk allocation.
> >>
> >> What you seem to do with this patch here is to add on top of the behav=
ior to avoid allocating large chunks from the buddy the behavior to allocat=
e large chunks from the buddy because that is faster. =20
> > emm, this patch doesn't change order-8 and order-4's allocation
> > behaviour but just to replace the loop of order-0 allocations into
> > once bulk allocation in the fallback way. What is your concern about
> > this? =20
>=20
> As far as I know the bulk allocation favors splitting large pages into sm=
aller ones instead of allocating smaller pages first. That's where the perf=
ormance benefit comes from.
>=20
> But that is exactly what we try to avoid here by allocating only certain =
order of pages.

This is a good question, actually. Yes, bulk alloc will split large
pages if there are insufficient pages on the pcp free list. But is
dma-buf indeed trying to avoid it, or is it merely using an inefficient
API? And does it need the extra speed? Even if it leads to increased
fragmentation?

Petr T
