Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F7497A030
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 13:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18FF10E03D;
	Mon, 16 Sep 2024 11:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lPNg/UZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9278810E03D;
 Mon, 16 Sep 2024 11:25:30 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42cb1e623d1so42915035e9.0; 
 Mon, 16 Sep 2024 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726485929; x=1727090729; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PGdarhuWk372yU46OMujXzMe51cIwvNwh9ENl2oBve0=;
 b=lPNg/UZfChS+xjsn+2GXmD1eYKRMzh2KCerx9g1y3ELsPwmlizD1X7KUhqMTT8ZclJ
 kzWXQc9c7MRmQrVzuLHCIJxRP3RFnLqSGNRML+6O1bZDyAE9dJbkMAclV2fcXO9R337T
 5w1usXXdgu4qsXsA+R0rWETStCAS8MxK1x83GlVOORjKLypj6FfRngAgFYbngUAMlDSm
 TyUxu49f9Hp45B0NBYRXbI3mWlOn0AYd/+Obl8M4RYNPiQ/evRI2QjRndkvwnWkGdFFc
 v7grESc/P0T5UBUWYJ7aUgCFy42hQ2Zxqupv+JHUMEQUZTT3UUuONbgZNX2wM0lWdnpP
 bmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726485929; x=1727090729;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PGdarhuWk372yU46OMujXzMe51cIwvNwh9ENl2oBve0=;
 b=SAlqYX3UDVG1ZBTcagz+2awQL5MXizjDofkw7hmXBh1V6fzb793b2+QRm29Y+sNBR5
 vuBFcgxmvzoQgt7y53v07kMpwoJnwNvMTIMPRUD6JoMREPZpwTObapDrWMVgti/U7lZJ
 9kTSv3NdH/YbuXu7ExUVEht8xT3fCwbOxBSaLHSunLLD8sSPRNB9wgO3Skb5GK9noMA7
 VodtnfA+hyHGrXLWKN9Cu/4UhJd1NX7H3d8SXbM/Wcc9HQ6eAWB9yXZ+GB48WREQPM5q
 GjhxW2Z/9b8yJkHS7YCGei0zbztxfWzvp2WkMyWvFQRR+aKoyEe7S7AoZHPeiHuYE9N1
 6lFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC5wQnEhbf1QsVrPdaBeI44xM0FL7iSdRPRnYMNgRpt1EKcDp7M3Z6oB28lxa742E4xm9tPvyuOWcx@lists.freedesktop.org,
 AJvYcCWH2qsSMk1B+HyDWGG/fMBeA3LWeqLwtIlJRoBdFmfOqUHRr2b5rE4VpxaS3lhKbjeeHCSWQseFQkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2b4+kmkg1Vl2NbQCZSzAZRZxq4O6xUfv1YlmVay9sgjOaV5SL
 zQ3PKZPugqNjAjJEft5znMDbdr4DAQKJYecRFg5HBAx0InNG0lHHhBomGki2
X-Google-Smtp-Source: AGHT+IERYiVEgQ0g8zwBFA2shXp2w0/8MGWnZSEIObYVfBnxT16DBarjV9m0+t1M/1O9HWrZZeyVZg==
X-Received: by 2002:a5d:42c7:0:b0:373:54c:26a4 with SMTP id
 ffacd0b85a97d-378c2d5782bmr7669963f8f.54.1726485928241; 
 Mon, 16 Sep 2024 04:25:28 -0700 (PDT)
Received: from void.void ([141.226.169.200]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e78044dfsm6942863f8f.94.2024.09.16.04.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 04:25:27 -0700 (PDT)
Date: Mon, 16 Sep 2024 14:25:24 +0300
From: Andrew Kreimer <algonell@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] drm/i915: Fix typos
Message-ID: <ZugVpInvVElgJhym@void.void>
References: <20240915120155.101395-1-algonell@gmail.com>
 <gamwfgmreryzvy6fazduxs4z3sfjxck7xmsho4elpemcf7llpl@epzlqmudvrzx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gamwfgmreryzvy6fazduxs4z3sfjxck7xmsho4elpemcf7llpl@epzlqmudvrzx>
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

On Mon, Sep 16, 2024 at 12:15:32PM +0200, Andi Shyti wrote:
> Hi Andrew,
> 
> On Sun, Sep 15, 2024 at 03:01:55PM GMT, Andrew Kreimer wrote:
> > Fix typos in documentation.
> > 
> > Reported-by: Matthew Wilcox <willy@infradead.org>
> > Signed-off-by: Andrew Kreimer <algonell@gmail.com>
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Because we are receiving lots of typos patches in this period,
> it's nice to have the context written in the subject, e.g., in
> this case, Fix "bellow" -> "below" typo.
> 

Noted.

> Don't worry, I will take care of it.
> 
> Thanks,
> Andi

Thank you!
