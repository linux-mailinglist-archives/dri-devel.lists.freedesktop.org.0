Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5C8A23527
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 21:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF71A10E9CA;
	Thu, 30 Jan 2025 20:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="USTpPeW/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8682710E9CB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 20:39:33 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9a88793so1911841a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 12:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738269572; x=1738874372;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zjc/ukGYviU6e9aVM8L8Zjtty0hNQpOZXKBc9NxwJp0=;
 b=USTpPeW/z94sM1TSi4YH1YyxHNlvi/Lr0i/FT8e6dP8szhZAkDmPaKQS5vNh5Ix/bF
 PtySFbu2vjKkUKj0hchPPyLHNUMDdv5hKmOHunnrOCP9t3+hOTQwnPIHPcWlSTjq8t2z
 0F6x3BfqspwHfdp0npFbrUpouu/vSLVoQ0Wwy1bbRPAkrU7NWXmEE5dOGh4skcrp+jwy
 EdbAhVK+j8Y5hP1gpx79r9/wglI4yhroi8+uAhM7PC6Etf0F8IAJei7UaOo9K1T/jolA
 dxonL/sNgyZZM4iKwc2UHnoAtL3KTbmrXJzYSjiYMdfMf1ISbZXtmCdu/AIVuJYkNKi3
 rk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738269572; x=1738874372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zjc/ukGYviU6e9aVM8L8Zjtty0hNQpOZXKBc9NxwJp0=;
 b=QnZYKV6w2oB20b3cD9fkx+xHmoIS/fjZIl/d6qHqT1eNd9JAoXGku5FNSpHDT08i7s
 r7h17ZbKaEX1SyM3z5sVNVp5PJ+vXLHM71zisCVz3bV1DuqsYXuzirYj8ddSO0CE5NfS
 pPr92QiYQRSEwSeStalN8Rc6JNsr6NJAtZ3rzDN4SHbw3Y70LK30RdySv2l4RSOr80CS
 8ogf4bQXdENfJnB3v+jJabyaCvwz6wIWegsMEeKAvgSg8slCYMiXvpegVke1bLXFwvym
 mOTNb4xzfb/eo5/Hzg1I8tJ22Os6n+oC2YpINh/1Nv+Fh3I0wZC0QxzM9FatQlmN5mFw
 Waaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0ixC65iG49ptVCk+c5Uw36of8swsVYlEcm7oAh4GNSijhbe992/fZhmOIa3q/ihV0nOl5ZrcVNS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBsPfWhBFhdM908yiKd9i6tamt1XMcTU2VlawequWBo2C9G5Da
 ZfjO2wFqAT0E+VVk5uwhwZJAD8wPhW4rC/ZTP7mHA4RpvxDxkiJj2nSK3t7KZp4Vt8G99NOeIf9
 rV38aRZapX5UAGLl2TtQLMQ3r1DpMv4qacvBa
X-Gm-Gg: ASbGnctfxCRCZ3rVg6XGLxqEt/MrMnKvm1YnFEoW7b9j6GgdQI91vzmod81HzGeJnpf
 mSDYhJnjX6Ox+qdG9qj9YNtI/td3Muqj7oZgWeKH+35dOkdsOj12NTnOOMqC4l5PQisBd1XlzAg
 QK52jToeeF9bO/jFaP4K8uPZrHWYoXRQ==
X-Google-Smtp-Source: AGHT+IGrgFfO/K+h4P6zJOggzHtL/MGdhzkU7jyuReGUYiXkVzMuxOLtpvutFaZEw44utsgnrxP3JQA41Hof3U2VRwU=
X-Received: by 2002:a17:906:f74a:b0:ab6:d688:257c with SMTP id
 a640c23a62f3a-ab6d68826e5mr639571966b.43.1738269571901; Thu, 30 Jan 2025
 12:39:31 -0800 (PST)
MIME-Version: 1.0
References: <20250130100050.1868208-1-kirill.shutemov@linux.intel.com>
 <20250130100050.1868208-12-kirill.shutemov@linux.intel.com>
In-Reply-To: <20250130100050.1868208-12-kirill.shutemov@linux.intel.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 30 Jan 2025 13:38:55 -0700
X-Gm-Features: AWEUYZk2YQUyps1dQbKiaYF6w_rV2K1IgcShMby4WAMvmMJrPU_zLRbp4lsvUNA
Message-ID: <CAOUHufa9VWCsVyAdgtdJ-5cgCUkot+tdD9huU1NAAmDSKzi6tQ@mail.gmail.com>
Subject: Re: [PATCHv3 11/11] mm: Rename PG_dropbehind to PG_reclaim
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Christian Brauner <brauner@kernel.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dan Carpenter <dan.carpenter@linaro.org>, 
 David Airlie <airlied@gmail.com>, David Hildenbrand <david@redhat.com>,
 Hao Ge <gehao@kylinos.cn>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Josef Bacik <josef@toxicpanda.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Nhat Pham <nphamcs@gmail.com>, 
 Oscar Salvador <osalvador@suse.de>, Ran Xiaokai <ran.xiaokai@zte.com.cn>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, 
 Steven Rostedt <rostedt@goodmis.org>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Vlastimil Babka <vbabka@suse.cz>, Yosry Ahmed <yosryahmed@google.com>,
 intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jan 30, 2025 at 3:01=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> Now as PG_reclaim is gone, its name can be reclaimed for better
> use :)
>
> Rename PG_dropbehind to PG_reclaim and rename all helpers around it.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Acked-by: Yu Zhao <yuzhao@google.com>
