Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A039422F7
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 00:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B6010E59A;
	Tue, 30 Jul 2024 22:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WQHXdtX7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801EC10E344;
 Tue, 30 Jul 2024 22:34:10 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-70d1cbbeeaeso3663024b3a.0; 
 Tue, 30 Jul 2024 15:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722378850; x=1722983650; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=fGVgOlNgOT878PCHFDWA1bgAufTRCTw9AMRW+Zn7Z0E=;
 b=WQHXdtX76BT5jR0Sp4aaRwhVykwgPC0KhIuP25krwlbqRIwbj4iylfykWzTvRUjOvZ
 +vlvUbs2P4nXz6slPAJdSnP22IDu8kWFye/NUQ51K2yPVF3fSZ55Bvfb8ZayChxOFvSh
 6VvI+28YQcM5MX0xf3m7VQEKszPmemTfqBvfYSAzPoCJzosVlctJL9MF68osmDFORSom
 XMMM0KRCFhmKTOg46rw6AO+yG4qkZwUq/RjfwvHQtmE7K5Wl0+Tl1v0zlpt4HWQcqdpO
 hgPj2Y4M/J8HWM/vU7QsORAJkg8CV1o4l84iw90+4tjQg8T3lrwEuZVqXvQAB6oKTcve
 GVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722378850; x=1722983650;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fGVgOlNgOT878PCHFDWA1bgAufTRCTw9AMRW+Zn7Z0E=;
 b=w8HuVqsZCFmIB6r9BwRACqjKtyqEM7DqOG/5lXqovVyZagz+2Eerau+b53NO0xoR7w
 GL6jEb91j3TR9mUraKwfdQ5MdVrMNv6T7Dnvefd+mJIZzg1dcY9y5JDlTb+2kk/9hWjC
 f77C/ducwCk2VcdhDdW2fF7nJtU2V5UJQjBmCr9pW9TlEoFk7H1ZbxyxM/S7AeEYcf9N
 dUMjxOo2mFG5JiKVIPQkpCWFiUrHoTN+Ai7tP4Re4E7pFdyzlgeJwAKr2Ny8BFmGhLs/
 p4ATC/cqk3srGEFXCnnCHwN/2jWBgiOwaZpO6rc75XKzcVXMx0ocej2Z0oAnyo/fe7K5
 KgqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOkgaFMH69P/rnZbDNRYA6kIB1L9LLTr0Db2UCSF+RImje0ZHtzVKw+OIxGmgc/tbWqJtFoi7HX0oqmgTk+i6nWQkgTWXoKZlXxoKLIn3G
X-Gm-Message-State: AOJu0YxNL8fIWSYpD30Ci4bBqMH+nDngyS33q8cJw/V0fUwMjtd3ZEgK
 EekW+PnPsxe4UFovJy8zKelXOJgqfOKOKLa6Maa9H8I86cEqdJougTIcaQ==
X-Google-Smtp-Source: AGHT+IHLMghuz0GXRqifWQUr2fqTNJGM+/BW5td2jxBxhYkXrbaXvteLwK2lMQMAN2FE+UH0wfVdxw==
X-Received: by 2002:a05:6a00:1389:b0:70d:3337:7820 with SMTP id
 d2e1a72fcca58-70ecea0e6e0mr12366446b3a.8.1722378849828; 
 Tue, 30 Jul 2024 15:34:09 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net.
 [141.239.149.160]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead8a39d8sm8934759b3a.213.2024.07.30.15.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 15:34:09 -0700 (PDT)
Date: Tue, 30 Jul 2024 12:34:08 -1000
From: Tejun Heo <tj@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangshanlai@gmail.com,
 christian.koenig@amd.com, ltuikov89@gmail.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 1/3] workqueue: Add interface for user-defined
 workqueue lockdep map
Message-ID: <ZqlqYLZWCiLKhVJf@slm.duckdns.org>
References: <20240730221742.2248527-1-matthew.brost@intel.com>
 <20240730221742.2248527-2-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730221742.2248527-2-matthew.brost@intel.com>
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

Hello, Matthew.

On Tue, Jul 30, 2024 at 03:17:40PM -0700, Matthew Brost wrote:
> +/**
> + * wq_init_user_lockdep_map - init user lockdep map for workqueue
> + * @wq: workqueue to init lockdep map for
> + * @lockdep_map: lockdep map to use for workqueue
> + *
> + * Initialize workqueue with a user defined lockdep map. WQ_USER_OWNED_LOCKDEP
> + * must be set for workqueue.
> + */
> +void wq_init_user_lockdep_map(struct workqueue_struct *wq,
> +			      struct lockdep_map *lockdep_map)
> +{
> +	if (WARN_ON_ONCE(!(wq->flags & WQ_USER_OWNED_LOCKDEP)))
> +		return;
> +
> +	wq->lockdep_map = lockdep_map;
> +}
> +EXPORT_SYMBOL_GPL(wq_init_user_lockdep_map);

Would it be possible to make it a one-piece interface - ie. add
alloc_workqueue_lockdep_map() which takes an external lockdep map rather
than splitting it over two calls?

Thanks.

-- 
tejun
