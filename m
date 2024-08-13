Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1D5950C8C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 20:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423BC10E3D0;
	Tue, 13 Aug 2024 18:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F3rvZ628";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBD010E3D0;
 Tue, 13 Aug 2024 18:52:28 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-201d5af11a4so1862845ad.3; 
 Tue, 13 Aug 2024 11:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723575148; x=1724179948; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=/xQzhhJbIGKfeDQrho3uQSrEp/8CKApl6FnGtjvV1Gk=;
 b=F3rvZ628VROBrIX5p2rHMkR0h1yhFWo4cyv9XuHsDstjVcL6JvNBLb7KxdbXuHXN8M
 b5uPasaE7aiXv1oEgzqVnTvIno1gHjqyyfkY4D8pLL7/AEWhzMXOmF9McTKtWh1P/M7R
 1NQzWt3bGTveDOFPnIVG3emAyjfDx+C1YHiJQWl2qaSK1WoGguvYamyXa0Aa+hHTEEwB
 lfO5IXvEtjCD8f8wwfi11TUqBHcUdsAYgJOoWIaq2LlCplN896i358IAuhKWz7lCU82m
 Po5TWvpEcUKcUCOT+VKcYRJ9qKam3faPm+ubsYslIY8JTFYzATQsKXBIiVCGWul36Aez
 bR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723575148; x=1724179948;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xQzhhJbIGKfeDQrho3uQSrEp/8CKApl6FnGtjvV1Gk=;
 b=oyfWuX3YBpTQtAmt5QTyPBUB328bgt0ZOYz5Xe8IPIuj0Fv0IBSm0G133toOASLjbi
 Ka94y81J32bkHVWMOGDcqy3gNfBCQUGszr1t/jyPnVlOljTkaCRR+nXJT1Talh8jOQ7p
 u3NnUmP/UFMa8Omg0BvkdB3ZtOJ0B3WYz6tMPJj3ELIFYBHBx9mszdINDLkyc4xCFR1A
 684BGAs483XW1Yj/Dz/bFsKlDI8x+hg5RLxzM9V86RHdTOyu+m6eXpx7Ckm6ovXGwawb
 rAR8ym0n0ayreVjYodsMyfp2Mzw+Kgd9PFvGowocLkf/Qz4L/uX0C4Nzg06nZKdoYPlR
 n/PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/4oLF+kT1b2T1wdUAh4IT81YDXzIpc8nR/PQW2QGpKXibhp8OhJr2tbfEDTuhcGl2i+lV8C0dnJPdMdAESZEjzvtLh6FQui58WGaIsKbC
X-Gm-Message-State: AOJu0YzRukgif/Hn9i/DZpf6JoYSky9zQXZV2eb8CYSNEr5vSekPmv8J
 gXH1tJ7Nei9rjWfk3dqMP86d+bK/OAz+wV5ri+mrpDFvJLKpnuJe
X-Google-Smtp-Source: AGHT+IExqAikqPzCWcTNT8iAUkHKEahJn51m0lDKY6dhJd0tvI/DDNDXfZMw0pBnodwAk3R7pX8juA==
X-Received: by 2002:a17:902:c943:b0:1fd:6c5b:afd4 with SMTP id
 d9443c01a7336-201d64d1d6emr5866675ad.64.1723575147917; 
 Tue, 13 Aug 2024 11:52:27 -0700 (PDT)
Received: from localhost (dhcp-72-235-129-167.hawaiiantel.net.
 [72.235.129.167]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201cd1cfe71sm16718505ad.285.2024.08.13.11.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 11:52:27 -0700 (PDT)
Date: Tue, 13 Aug 2024 08:52:26 -1000
From: Tejun Heo <tj@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangshanlai@gmail.com,
 christian.koenig@amd.com, ltuikov89@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH v3 3/5] workqueue: Add interface for user-defined
 workqueue lockdep map
Message-ID: <ZruraicqNAvPWGJ1@slm.duckdns.org>
References: <20240809222827.3211998-1-matthew.brost@intel.com>
 <20240809222827.3211998-4-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809222827.3211998-4-matthew.brost@intel.com>
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

On Fri, Aug 09, 2024 at 03:28:25PM -0700, Matthew Brost wrote:
> Add an interface for a user-defined workqueue lockdep map, which is
> helpful when multiple workqueues are created for the same purpose. This
> also helps avoid leaking lockdep maps on each workqueue creation.
> 
> v2:
>  - Add alloc_workqueue_lockdep_map (Tejun)
> v3:
>  - Drop __WQ_USER_OWNED_LOCKDEP (Tejun)
>  - static inline alloc_ordered_workqueue_lockdep_map (Tejun)
> 
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

1-3 look fine to me. Would applying them to wq/for-6.12 and pulling them
from the dri tree work?

Thanks.

-- 
tejun
