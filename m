Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781D8B1B5E6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 16:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F2110E359;
	Tue,  5 Aug 2025 14:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="RSx1ldD1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A3510E22D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 14:09:28 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4ab63f8fb91so31881411cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 07:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1754402967; x=1755007767; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uzAYIR/shPSYacUrOQJo0K9+jh4P0UFNjUkTluGngLM=;
 b=RSx1ldD1zI2ZDlYuF6Ugnz0fGbwUYM3adITZFVEiU9lekvpprDe0OypwTwKOv92AC6
 +fzAbOMRIoRjPdH8t+1cUIem5XbQdUxIBiB1mVZ4003znfGi9QR9nFrgS96/wkmV7ufO
 wCuWAH6qPqiDBdJULrHfaXuUoPd7nPSdVdzsoyzWM7DcEh2crS+YYEuUVNQf4lUPIt+a
 lVKZZbNIpfwk3YkTCtGUEbv+pmyYc31vo9/+jGXPrywDKlul8Wy7V4mHrT1qJxYHZcqv
 pWYJxFJYcCLlwdhVNKm+1rGJ+Mn2MutJrb0nceaGy14ECdaLnSGaFXRHved1kuJcOgKW
 78OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754402967; x=1755007767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uzAYIR/shPSYacUrOQJo0K9+jh4P0UFNjUkTluGngLM=;
 b=GgrxrFusgDjgurPrsT1ULtaeML0UnyGUcQh1MlsMz2XEeNWwHipD8gqFE7D+uhn9wn
 xQU16yE5wDwi08xc4/kp8T6G+c69SqivMoo3VQA2TwtCIeZrl7DzV1k2UH7bK9GD6Ao3
 dr8sskb3QxWNHtFJVZwJXSz7XaDMPlhWyhR33GHUZqUzkg2LRapDKfLzE3WUcoWc7IaI
 sjg8+WX3y9VW06U1fzh4438gWOrsu7LMkX4k59egq3f0ZvojWehd2z+Fly6KuxGuP8rB
 ZIZCl2uxj36LTb2E73GgUM1TWcT12O5lveSqdtHkbqsLVRgcG6zELRie6kEkHskKgTm7
 kPcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQy0+EIkk0RGaFp94cOQXR/0Sb5gO6E7kQ/P+BVfWiZk4H7XUGdJgrOJq1UzbwD/ezUjJcolIqajY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywfp9cRGaIQb7D0TZOwAGGqzaQVvPFEu5w4Xqz/e+4RXPyRx5VC
 pkHyDMKNt3ziq8kzGGbWfG7vxaG8MrKXfxHqGdzv/HtjWEIDaCHHw4xX+B3HE3NaOQc=
X-Gm-Gg: ASbGncscGtHnTRMxxEOdYfyRqWCrU82hV5EobxVv9ZcM1+3gGGuYZn9XQlE5tC4q7Jg
 rQZ6ynoUBGaeiiwS5hStq8NdsYr94wtDqc1emcVgxb/EWZWhYKwlIW7FNaezNhmjqx8WDZiwyWv
 FJwtlgLQhF9XSS7A1i6UZnb159A8NdBW/1Aq/ug6BgHd4fYkSJE4jo4XXgQuMc/DJUvefnIihAp
 RiOXG49INg45caYtJ5lRlVSlv5j7z0IcDPxO7lWSkSnXxB8frmRLBADh0m5vofVB6FmsjtMKEf+
 Pe/l4zFB4Q6Ah7pXydz0fxr3rVZKRcxmDGmu6RwHwO5Vr3BiHq2KtR4E/AgMODNxMxyTG9FEe3e
 mkP5m8x5rvCyltc7B0mkDt1uZCou3HLMwpUnM2YIHYymq7oAFIKcXxdnxCcLNthzbeuBoP4hyoi
 nmTaA=
X-Google-Smtp-Source: AGHT+IHL+J4sqP2SxcyYA/bm344OksrCpi3leJPwTfOOG1s5eCheuA6YOXSpbD6tw1CHk8ksExeFwQ==
X-Received: by 2002:a05:622a:4a14:b0:4a9:a3ff:28bb with SMTP id
 d75a77b69052e-4af10a1abd0mr240543491cf.25.1754402967223; 
 Tue, 05 Aug 2025 07:09:27 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4aeeed669c0sm65687951cf.33.2025.08.05.07.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 07:09:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1ujIM1-00000001XVj-3WEg;
 Tue, 05 Aug 2025 11:09:25 -0300
Date: Tue, 5 Aug 2025 11:09:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Yonatan Maman <ymaman@nvidia.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@nvidia.com>, Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
Message-ID: <20250805140925.GO26511@ziepe.ca>
References: <aH4_QaNtIJMrPqOw@casper.infradead.org>
 <7lvduvov3rvfsgixbkyyinnzz3plpp3szxam46ccgjmh6v5d7q@zoz4k723vs3d>
 <aIBcTpC9Te7YIe4J@ziepe.ca>
 <cn7hcxskr5prkc3jnd4vzzeau5weevzumcspzfayeiwdexkkfe@ovvgraqo7svh>
 <a3f1af02-ef3f-40f8-be79-4c3929a59bb7@redhat.com>
 <i5ya3n7bhhufpczprtp2ndg7bxtykoyjtsfae6dfdqk2rfz6ix@nzwnhqfwh6rq>
 <20250801164058.GD26511@ziepe.ca>
 <b8009500-8b0b-4bb9-ae5e-6d2135adbfdd@redhat.com>
 <20250801165749.GF26511@ziepe.ca>
 <vscps6igy42u5limiigiok6y35mjx6acawi3qmvzbrpvltp4qp@mkydml7lz6fu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vscps6igy42u5limiigiok6y35mjx6acawi3qmvzbrpvltp4qp@mkydml7lz6fu>
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

On Mon, Aug 04, 2025 at 11:51:38AM +1000, Alistair Popple wrote:
> On Fri, Aug 01, 2025 at 01:57:49PM -0300, Jason Gunthorpe wrote:
> > On Fri, Aug 01, 2025 at 06:50:18PM +0200, David Hildenbrand wrote:
> > > On 01.08.25 18:40, Jason Gunthorpe wrote:
> > > > On Fri, Jul 25, 2025 at 10:31:25AM +1000, Alistair Popple wrote:
> > > > 
> > > > > The only issue would be if there were generic code paths that somehow have a
> > > > > raw pfn obtained from neither a page-table walk or struct page. My assumption
> > > > > (yet to be proven/tested) is that these paths don't exist.
> > > > 
> > > > hmm does it, it encodes the device private into a pfn and expects the
> > > > caller to do pfn to page.
> 
> What callers need to do pfn to page when finding a device private pfn via
> hmm_range_fault()? GPU drivers don't, they tend just to use the pfn as an offset
> from the start of the pgmap to find whatever data structure they are using to
> track device memory allocations.

All drivers today must. You have no idea if the PFN returned is a
private or CPU page. The only way to know is to check the struct page
type, by looking inside the struct page.

> So other than adding a HMM_PFN flag to say this is really a device index I don't
> see too many issues here.

Christoph suggested exactly this, and it would solve the issue. Seems
quite easy too. Let's do it.

Jason
