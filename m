Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35377AC4521
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 00:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A82010E39A;
	Mon, 26 May 2025 22:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="Qjt616Fv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF8510E39A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 22:08:23 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-742caef5896so1776485b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 15:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1748297303; x=1748902103;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zrlu1EYkm5Lm5UOqAiS9rPpe+betSsNtlD0P8ut0Ydg=;
 b=Qjt616FvEzb2VqSXOOna/9cbWeOEB0JfS/sQEe0sm+mFWBelfac6W/6u2Vuq8h5Xf4
 1/70/Au/ND/zzB536sTXPrRnbB72xESeNc4OcveyJODXUwEXmj8LxTBYkTZI7ZwcYUjp
 R9j8up31bIOTf8oHVSRNY/eDedX7/jQDGX91m8jo1cJU1s20zJrjBWurjSu6zVPmOm26
 m6vMr+6XMHbG5a5V3i8nk7vE4pumgP5Hzt3pu/3f7KFQWprEtDtZaZhAHy1PjvLe9L7a
 HBrLWkvlbGv57CDOyxRxo94/zah5EP0OyiLyuxIY+PbeKFi1Qw6gMJ2/rhgnXdRoalEb
 5xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748297303; x=1748902103;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zrlu1EYkm5Lm5UOqAiS9rPpe+betSsNtlD0P8ut0Ydg=;
 b=o8FH8zi0WsuQDFxSrJXn88L0HA93uXM1uL182PuBloR/0IHuxqrWi8SvSRkrskt20o
 0yNqaRE7+WlLiuIS5XkvLmpEieypjzRmtXYNrqcCh5CeNeCtkmihG4UjnB7fUYGy9Dsb
 z0OrD/9+fVx9wI3nEPsVaeoiGOAJ2m/2K+tm5Xbk6zo+7ehvEdukjILaAOl5+EKmVQyn
 ZJ/lx7ARi+vyDLfveh8gTedck1WMbgVC/+xpzAoLwyVe44vS/pVZCrE3yvlB5STR4QOd
 kZBK7iVQ4gVG7OzKtGnIH4vsHdFcdCtzBebMV917FFUoA0/YUuPCZG8cWaNFV58AFuDc
 Ghvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm5OX6+GofYFkQhNqa2jhW84G6nPhZNg3pt4c2wWue7crDhW7NEcT6/VEWu7Aem0cmchR3lBzOh/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZZLjXLjaxVvjTWdrGNG+3FW2DrNgy7DQNfNb3GivXiNeeKsY9
 4fZBlUnWcNrIFnPw6UshNGZi67vkTWdjuDT/PKXUyR4hYZGbyeUrwRxBl2yoxU0kYb0=
X-Gm-Gg: ASbGncu0BuEqCvJXuhQvbVKsiMOz7/Ozly2TPCGDKaC842rL2vOS3tM4lmo8tzD6kA6
 uV+iFxo/l/Fc1AL19JP7A2CBwWIvN9n598HwhcGB3RT2RpHIWGpBxxm+p9L7HiLGI8XLoNtflSF
 gWPIJEBnXNH9jJ2Vru0DG9nQ4cFgdlKKWs/us9j79Fd7RoKByL1aX8xeZkMI4SwDMmNY61454BY
 hPXeJ4b+zqkbzVFB3fvKfnWXMAC7Nr1UdTb4Ks0ucFQWegaZc8qNmSZF2f5Nj0vn20MxnJ31QxH
 lY94or+acsJbOLTInxNx537A6glP20C/hwBSVtCoAzxZnNwGVTSJ7TbisH9hnoAtWEhGY2goCNp
 xQ2mANeVVv8qp+8npT38Vo/wWYNA=
X-Google-Smtp-Source: AGHT+IF2FfLXk1Tga240D+CTfPb7KAJqM0J0xtX2rD2dyJAs0sbdih/XtPTYgxwMqcKRiGIdz9CS7w==
X-Received: by 2002:a05:6300:668b:b0:1f3:194b:30b0 with SMTP id
 adf61e73a8af0-2188c192c3emr13791070637.5.1748297303030; 
 Mon, 26 May 2025 15:08:23 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-184-88.pa.nsw.optusnet.com.au.
 [49.180.184.88]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eaf8de24sm17662711a12.36.2025.05.26.15.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 15:08:22 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
 (envelope-from <david@fromorbit.com>) id 1uJfzX-00000008Y3X-2KOv;
 Tue, 27 May 2025 08:08:19 +1000
Date: Tue, 27 May 2025 08:08:19 +1000
From: Dave Chinner <david@fromorbit.com>
To: Dave Airlie <airlied@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, kasong@tencent.com,
 nphamcs@gmail.com
Subject: Re: list_lru operation for new child memcg?
Message-ID: <aDTmUw-CQYuZ1THd@dread.disaster.area>
References: <CAPM=9tyJgHPp5N6XpauFRL1hZDLCG8L+9Gmi7RCLRaK4BN4tzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9tyJgHPp5N6XpauFRL1hZDLCG8L+9Gmi7RCLRaK4BN4tzA@mail.gmail.com>
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

On Tue, May 27, 2025 at 06:32:30AM +1000, Dave Airlie wrote:
> Hey all,
> 
> Hope someone here can help me work this out, I've been studying
> list_lru a bit this week for possible use in the GPU driver memory
> pool code.
> 
> I understand that when a cgroup goes away, it's lru resources get
> reparented into the parent resource, however I'm wondering about
> operation in the opposite direction and whether this is possible or
> something we'd like to add.

It's possible, but you need to write the code yourself.

You might want to look at the zswap code, it has a memcg-aware
global object LRU that charges individual entries to the memcg that
use space in the pool.

> Scenario:
> 1. Toplevel cgroup - empty LRU
> 2. Child cgroup A created, adds a bunch of special pages to the LRU
> 3. Child cgroup A dies, pages in lru list get reparented to toplevel cgroup
> 4. Child cgroup B created. Now if B wants to get special pages from
> the pool, is it possible for B to get access to the LRU from the
> toplevel cgroup automatically?
>
> Ideally B would takes pages from the
> parent LRU, and put them back into it's LRU, and then reuse the ones
> from it's LRU, and only finally allocate new special pages once it has
> none and the parent cgroup has none as well.

The list_lru has nothing to do with what context gets a new
reference to the objects on the LRU. This is something that your
pool object lookup/allocation interface would do.

If your lookup interface is cgroup aware, it can look up the parent,
search it's pool and dequeue from the LRU via:

	parent_memcg = parent_mem_cgroup(child_memcg);
	<lookup object>
	list_lru_del(<object> ..., parent_memcg);

parent_memcg). When the child is done with it, it can add it back to
it's own LRU via:

	list_lru_add(...., child_memcg).

> I'm just not seeing where the code for 4 happens, but I'm not fully
> across this all yet either,

You won't find it, because it doesn't do 4) at all - that's consumer
side functionality, not generic functionality. If you want to have a
pool that is owned by a parent memcg and charge/track it to a child
memcg on allocation, then you need to write the pool management code
that performs this management. The APIs are there to build this sort
of thing, but it's not generic functionality the list_lru provides.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
