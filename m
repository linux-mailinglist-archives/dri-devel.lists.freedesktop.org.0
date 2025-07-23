Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4632B0E967
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 06:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9790910E0FE;
	Wed, 23 Jul 2025 04:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="UcVA4eNT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A1D10E0FE
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 04:03:50 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-74801bc6dc5so460668b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1753243430; x=1753848230; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xA745yoKZM+y1Z9ywfes2QtRwxYl5/Ynbkdt1hGqcxM=;
 b=UcVA4eNTNdaAuu1Yef4d8uKlMz23MZZO9HUC8MJpNfj84SD7iHFotPHQE8q/KTRcvR
 wR5HOloeisBNHfQazG9dzOJ9a8zyrZzh4Fn4L5FhWfzzfevnXcCetqEggJe4pKye8T1a
 oJKpCBrfLhfrtT4UG7E5IDNCpOkkNQCtdWCGC6cQ2lzlUSOmGJBDwEOnxabCg1LN0Z/S
 v8bCIeuPP2AvGEM2vteYpoSg6aBbRBDE9uZR7ixRjBIX/NgYqvwTwV9UbjDo8/U/qy2C
 wLCnBJaMCm7S2ua4dgARQPIFP6L67g1YXOboCWyoa2Sp6ZTF7/5D8vO8ELv0KquIihf+
 T3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753243430; x=1753848230;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xA745yoKZM+y1Z9ywfes2QtRwxYl5/Ynbkdt1hGqcxM=;
 b=j1W1J+deBG+Ui9A5U+5mb1HatvdIcfC2P1HrUNOe6qZkpE9mvc2IdeOAlDS7/t3EQj
 UxnM16Z8EFBQ1Aa4C/uaOWCR6dCSlxRz+60rTEZtHH3n+6qFYnMYrTcRNW1rjF8/vf/9
 Hz+yZS5mh2msMr9HU5h5aEWBUflcXAa7rIckhqbyu4y2ZA1uILh4Q4TLuEYSPpMScr4m
 U3UMHZQ8cOCvjoJWkayY62KcwiycMxAYJhtXwIEUqBUr5NwtbYGhPHqmG74D6lblqgIZ
 1xq2HP0zyX4ZeTbAe60XEBw3e1ust9o/UNcBP4IxyZPuvVwomIqYcewehF3rpqbasMWK
 0zWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5AFMRFXjvcpk+JoCBmjrtbpzM0782YZipQJRJ6CjdMcvbP5LB3fhybsnHki5I6QeXkXGvyXOLa0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8dUZmFA1lwf28k9Rdh9OaCNnAy2IUvH9nhFOhEIs3/oy4IWDI
 8hcdxILpAVH7anUnyq0rX4a3D3nCDAdmj7LvIgxLN++r7h7wOQ94MOLL3CwhhMqZg5I=
X-Gm-Gg: ASbGncuunnsm/g0sXaNQY8FdvRBLQ9RO8KAEbjPbkMF1V0FhXUiJvKFivrDVXS3ZkqD
 Jq7HUB3Pe8xqhwQP0NY/USsvsL0F5WOuxVV/Yn6UJ2GbLLw96eusOh034TI70Kb8ZEH70kX566y
 eUjyHkGXPmT0yhpvrGw15FFM9ajvygyMmdGdFHhpZHa1DI75ovjctk4avm5usmRbrZeRAmQqYBT
 pdZsuct/UphKe0DYeAibL9cazmXzAkeu93xPV5HJlnn4pW7sxKIHM8/VulbLm2C9WLp752Rw018
 3282KXr5EpyM9Mq9JqLh5dQpcyqgqNXRsPb3OG8DN6ohcx6fOdOu8Fi08ugW94NcGoSg8mhlt3g
 aWXxJhu3NwDIKWgMp5CKpeUKkmlOsyokbq+A=
X-Google-Smtp-Source: AGHT+IHWWupLuqc8e5GXXzUXDSlEt7hhxnTZrQ9aJK/Vr+sC9tvcbfe/C8gT9skU6Vf1zOtykYPZzQ==
X-Received: by 2002:a05:6a00:4b56:b0:744:a240:fb1b with SMTP id
 d2e1a72fcca58-7604b947a05mr2140480b3a.5.1753243429711; 
 Tue, 22 Jul 2025 21:03:49 -0700 (PDT)
Received: from ziepe.ca (S010670037e345dea.cg.shawcable.net. [68.146.128.183])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2ff62789sm6731701a12.44.2025.07.22.21.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 21:03:48 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1ueQhn-0003Ip-M3;
 Wed, 23 Jul 2025 01:03:47 -0300
Date: Wed, 23 Jul 2025 01:03:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Yonatan Maman <ymaman@nvidia.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] *** GPU Direct RDMA (P2P DMA) for Device Private
 Pages ***
Message-ID: <aIBfIxVBR/3ig/O/@ziepe.ca>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250720103003.GH402218@unreal>
 <35ff6080-9cb8-43cf-b77a-9ef3afd2ae59@nvidia.com>
 <20250721064904.GK402218@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721064904.GK402218@unreal>
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

On Mon, Jul 21, 2025 at 09:49:04AM +0300, Leon Romanovsky wrote:
> > In fact, hmm_range_fault doesn't have information about the destination
> > device that will perform the DMA mapping.
> 
> So probably you need to teach HMM to perform page_faults on specific device.

That isn't how the HMM side is supposed to work, this API is just
giving the one and only P2P page that is backing the device private.

The providing driver shouldn't be doing any p2pdma operations to check
feasibility.

Otherwise we are doing p2p operations twice on every page, doesn't
make sense.

We've consistently been saying the P2P is done during the DMA mapping
side only, I think we should stick with that. Failing P2P is an
exception case, and the fix is to trigger page migration which the
general hmm code knows how to do. So calling hmm range fault again
makes sense to me. I wouldn't want drivers open coding the migration
logic in the new callback.

Jason
