Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A525AEF1DD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF0C10E53A;
	Tue,  1 Jul 2025 08:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jRVmTHFE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC5B10E53A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 08:52:04 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-747ef5996edso2705044b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 01:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751359924; x=1751964724; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=88KwzuOUdx+VhG7N8ukidarGnCXzhZ74KKnQWyukHXo=;
 b=jRVmTHFEgmjfJiCpUUtizfPhy1z5RA2pAXfiTf03Fm5W1mLLGC5pBc4MJGbGX98yqX
 RohCxghYDNtVDHHw9ELUl382Q61xBnD8nW0WPZ2cz3ce19e81vVZIgdR+/us7QWx9y/y
 +zh+F6F7CDgwnviEedVTbFefMHkxGKY11WpaMiSziC11KtdcjIuGE4fJ0TeM5MATYsVY
 kGLnP3kBNGTrnp/i/58EoHMP7x0Z9JmXdowPpemduhfWA1cwQImjmEAbb4t53L0Oc9wl
 R16BCxbIcH/TOXhFEr+EOnznQAx2VW+8nj9bAezk4VbHh3bzFnNqiRvippgBlsVOdn1K
 +jiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751359924; x=1751964724;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=88KwzuOUdx+VhG7N8ukidarGnCXzhZ74KKnQWyukHXo=;
 b=goWVr0aBSRJvk3rg1fCTyCiOAP9xCN2xj4fM2ez5njerENiFM1CIh9Dv+eJ4jSKmu5
 r354ygvw8yljHFtTNVUYiXZAFwYCuS1h9CgWsV0IUNNmWrkAAz1iSOg7BQsuUxNDu7Sp
 ZL5L72e6f1Qt7RFk9fZP9P9vNfiU00ahNMXpgnsMg7Kn9YXYPplgI3LM/Ywfu6doLbGl
 pev5+2N1mSJhJ6vxlQmNrRqmIVWXvLCB132vq54B9Wbea7pqBs36AxhvPSiP4enfHP3i
 /+ZJcj32iz43WDHfujyx+y6OrXAKmWG9xBqpn3UUwKbuQig5e/UFTSYaMmz8U0fbNv65
 Rm5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYnjcelo114AVYCVgvhnrHyIOIjvrNt/C9frAjinTrYDYP6c89/3APuJTzFg/y85WBDvTBpEeIp4s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMiuzEtF74nD9n3G5MGK+3SC2RoOYyV2X1Bk5S7I377yv9ANoF
 C4ECKEK2xrDF1JqqxPW6faFcLIrvaHlSTL0O6pY2AU2ic1/MjWRkougL
X-Gm-Gg: ASbGncuqBROxDosoKAXRW95fVwojD7a455m6Fei8xuKt/mK1Ux9QvZV8z2tQjlSCWHF
 55hWRRQoUGvAOGwY5Gvck5+8mCN/Bsc1pbOk8UT9dCEBoP8tEPSmpilWU/6gaAFW/Vu8LkGEbfN
 TObp/bO+oWKudyvJwXKVPk5nJJrOX5IWbJuI6hYeryUDyL85IaDOKzXVghPEcgT9EZNLoK46FwN
 6D/qi3LhnclLxdFNOkwNTop8QC/QMZGjeGGzrBjLh5+y7XtNa/CkHWYXizIUzuND5CVrnr7WrJL
 U8c45MFC0T1f8ZFEXpS23A93yhObqKtWBH1RJcVEnWpbHTY1XMnuCbA=
X-Google-Smtp-Source: AGHT+IHxISR9hyQ+YgkO2UyVgvCjizdx9FY+4l1HiTDD+Xq2hunYsnuQWOfVSy1cXwISnEW95/tslg==
X-Received: by 2002:a05:6a20:9e47:b0:21f:568c:713a with SMTP id
 adf61e73a8af0-220a12e597emr22598713637.17.1751359924244; 
 Tue, 01 Jul 2025 01:52:04 -0700 (PDT)
Received: from essd ([49.37.221.186]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e3200f13sm10050149a12.72.2025.07.01.01.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 01:52:03 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:21:55 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, andy@kernel.org, 
 dan.carpenter@linaro.org, lorenzo.stoakes@oracle.com, tzimmermann@suse.de, 
 riyandhiman14@gmail.com, willy@infradead.org, notro@tronnes.org, 
 thomas.petazzoni@free-electrons.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3 2/2] staging: fbtft: cleanup error handling in
 fbtft_framebuffer_alloc()
Message-ID: <cofo3z2thcwxaiec7ko74vqtczzavqtyxv6k67yxngv5647tpg@rsnzb3jhcb6f>
References: <cover.1751207100.git.abdun.nihaal@gmail.com>
 <4e062d040806dc29d6124ac0309e741c63f13ac0.1751207100.git.abdun.nihaal@gmail.com>
 <2025063022-chump-pointless-6580@gregkh>
 <ezkfonpaubsmw6gr4tutgnjmbhvsuwkhaiya7xozl2szfqi4f3@zmde3sfybyzi>
 <2025070128-amplifier-hyphen-cb09@gregkh>
 <CAHp75Vev8r7KZ79=CoUtt0wbx0x3O0ZckesWtQrxs-MBpiBz_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vev8r7KZ79=CoUtt0wbx0x3O0ZckesWtQrxs-MBpiBz_Q@mail.gmail.com>
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

On Tue, Jul 01, 2025 at 10:03:50AM +0300, Andy Shevchenko wrote:
> On Tue, Jul 1, 2025 at 8:14 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > I can't "drop" patches as my tree can not be rebased.  Can you send a
> > fix-up patch instead, OR a revert?
> 
> I think the cleaner solution will be revert and v3 patches together as
> v4. Abdun, can you do that?

Sure, I'll send a revert in v4.

Regards,
Nihaal
