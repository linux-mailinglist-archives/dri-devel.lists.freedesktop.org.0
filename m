Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C2FA678B2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 17:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7C010E4AC;
	Tue, 18 Mar 2025 16:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HZzYOqSi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2417A10E4B0;
 Tue, 18 Mar 2025 16:06:27 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2255003f4c6so104785235ad.0; 
 Tue, 18 Mar 2025 09:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742313986; x=1742918786; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=z6e2c0Qk/BdFEUgDNlLPZ7gWsKGT2P7lxLRmr+kXCn0=;
 b=HZzYOqSiglw4m6J3srkCqHDGTH7Np6ydI9VbwR4QXmjcFDrzR4Qfps+2UMT3ZRKlNq
 U8BkbI7uGHrqUVtZqklU3HSF/rJiLmwxemqWD9UPz3xmV5ZqmmUHu2BOAxgQt5/MBDPJ
 umTgAu73XgX/BcRKmPnYVF5fcOigzMVb7ni71qlmVAkwRzQNJhzhTgiGbWZlx6ZGEDCs
 Qfta+Dj4TbLy1AI3AEEX718NI219HYuipi9eiG4l0lehwmT/pZ7qH9MPSACsx1MuPgGN
 ee1BuK5s6jKNvDV/RlxkqDcrS5TSE0GUBTmi2LHT6MgrNB/H9oszIuse/Zdkb1fxkNzA
 Vh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742313986; x=1742918786;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z6e2c0Qk/BdFEUgDNlLPZ7gWsKGT2P7lxLRmr+kXCn0=;
 b=nZ34FpAy4CvatwTX1A6I1x89LFfDtmMoGXxqVmo/eYRkpCR5gg2XBpD6rMPKVgQ0Ac
 YBuZjKcL891wobObJgtl80cKeBtnZvH7cqQLM5HmTsHQoQnbtfE0ZYIYLszg1qUFItxo
 EuAw/fVh2JsfuomTl7mO6rM0kFZxQhx1S86GlE1nScTRroC4ZamLOS1QHji5PyAlt7sN
 hKJaYIhe57igfVVrDuClazKxWFK4ry8uWChLcYxVcHR9iGmSTEHep86uTlGI/8esqfyc
 CFAMSeQp5ggmqsSPBf5sTJXviqOygxpsRDY6I0/ITQXwM128DnRDyDBCnqjGPe+DcmtG
 NIcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV38R1Ld5zk1h3P+j4x1iABKksZOUJVivzVtwRL1VPeuPqrFpRzmUnBssYUYOqJ7Sa7avt4mzfCyAAs@lists.freedesktop.org,
 AJvYcCVbycmKmxICj6JAx1wjygxiDcNpioj4xboEiMtQQU3yx8OiEUOzvPbn0PgjP7+YRV5Tl37qG0bI4JM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRJI0jmfkSiBiZzaXFKDtKgYgxxcsMJsPvbYl0yzS8K/bPuBdY
 WoIR90t3ulbkGTtzYHQ4bWCpARrKC6ly3LEd9Dyw4qoERaLLGOy3
X-Gm-Gg: ASbGnctIMU+qpelU/LANlXS7nQlMOL0lMSV3W/LmAuwOAMNTiOOwCGIapKEgG7TYe/A
 lPN5gp49qnOOOLds/QWCDDOFAXOMggHRBy2ZGDx6MMorh9l4qtJu3LJTWuB/aLI0OTioWVZIgOx
 L9ScxXlDxsrg/1m8FjCHzmKqvyO5Muvr8RFHkPACwe7xWUw1dxDFvzUaYgWuxbSE1ZkAM01tf4+
 qGc67FKTf/tSoCRtnpl7TlPLij76Cj0R+MT+cI6orm8Ro3lzRPCeNT09OrNYO4KZkgLLXwZy9Va
 F5eHiRXYbdzXp1f3ToAThw+AVdxuz7+qOi4mMGxEbawKobIDR48NZms/kPQWgWfrOXMc
X-Google-Smtp-Source: AGHT+IGW5/tNqjQ0xTitfPIj7GeM/eN4Wy3Jsl0PgukZG9i0xnTDK3BvONiq3fuytb5V/HKrSq4TFQ==
X-Received: by 2002:a05:6a21:9006:b0:1f3:40a9:2c36 with SMTP id
 adf61e73a8af0-1f5c118107emr24562658637.10.1742313986538; 
 Tue, 18 Mar 2025 09:06:26 -0700 (PDT)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-737116b102fsm9758563b3a.166.2025.03.18.09.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 09:06:25 -0700 (PDT)
Date: Tue, 18 Mar 2025 12:06:23 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 1/7] bits: split the definition of the asm and non-asm
 GENMASK()
Message-ID: <Z9mZ_xIMyqUg2Vs9@thinkpad>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <20250308-fixed-type-genmasks-v6-1-f59315e73c29@wanadoo.fr>
 <Z8swIt7fqpVAp2P8@smile.fi.intel.com>
 <85639227-68ed-4a8a-8084-1ae0ffcaa638@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85639227-68ed-4a8a-8084-1ae0ffcaa638@wanadoo.fr>
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

On Sat, Mar 08, 2025 at 06:10:25PM +0900, Vincent Mailhol wrote:
> On 08/03/2025 at 02:42, Andy Shevchenko wrote:
> > On Sat, Mar 08, 2025 at 01:48:48AM +0900, Vincent Mailhol via B4 Relay wrote:
> >> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> >>
> >> In an upcoming change, GENMASK() and its friends will indirectly
> >> depend on sizeof() which is not available in asm.
> >>
> >> Instead of adding further complexity to __GENMASK() to make it work
> >> for both asm and non asm, just split the definition of the two
> >> variants.
> > 
> > ...
> > 
> >> -/*
> >> - * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
> >> - * disable the input check if that is the case.
> >> - */
> > 
> >> +/*
> >> + * BUILD_BUG_ON_ZERO() is not available in h files included from asm files, so
> >> + * no input checks in assembly.
> >> + */
> > 
> > In case of a new version I would reformat this as
> > 
> > /*
> >  * BUILD_BUG_ON_ZERO() is not available in h files included from asm files,
> >  * so no input checks in assembly.
> >  */
> > 
> > It makes easier to review the changes and see that the first line is kept
> > the same.
> 
> Not fully convinced, but why not. I staged this change locally, it will
> be in v7.

I don't understand why this change is needed at all. The comment
states the same thing before and after, but the history gets wiped.
Maybe just don't touch it?
