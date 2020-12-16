Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF9E2DBD17
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7476E054;
	Wed, 16 Dec 2020 08:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D0589D53
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 05:22:52 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id lj6so868376pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 21:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WYKEVZawJ7vm+napiANrAzGeTasmgoFDEm5LAhyGxFM=;
 b=XPkJXHkaqQ+LNds9xcRhHOiZ3Iizr63B6iQNeiZ0n09SmRO7C39+/dtzYDGsDy0RTS
 KsFdLDFyAsI7C2CzRqEkH1+l5jEDk/NJdWI2PaIeHk2byBKvpzcUGaVxwRgWHL6+tlVC
 7u3EKJ5M7zI8/2TJv1p89+uRqJ4Bn8nR4XaB7HEQ9uLVLvhAvZXSdmAXuBrjosjKkI2C
 nckAo67Cxysgum8BHLIHPqD8a5/CSaaDoO0dNvGCHWjWsah9Kz5vOp/LATqJJ8r+DbK+
 aIoVGqfIDT8x0WpwuJu+FBTRk2jhkabWe0EQq6dg0x/nW1JnjUPK0lJG4wXBEmHtwENw
 7kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WYKEVZawJ7vm+napiANrAzGeTasmgoFDEm5LAhyGxFM=;
 b=K7/OF+TOvFeyoSFleUdSgu0ijZ/w74Q6OzSXsEe170q1Kr2WRfmhXVpMhi3tc1niYU
 uu6aZWGkhGX+NyXlOm9VmkXh6/9eBHJs6ea9NpDgkMNiZF6bFB3K9vOBMiemH8oqN9ho
 mV30a8fsi/L41tU6qsSqwcfExCLgL4MSg6DE1bS72ANY3AKA5pmX04wNfQL+5I6SiL1+
 j5nsmdIglY/nmmpoiYS5HOfiT3mXdFGGE37SAaOyIcoSLSQA7LpPaqOf3IDRh2xylz2F
 Jf46nsFt2xq+ztPdPWpR1wJbQXcXwDtYdZOQsGAaRyyHlXHuyXG9w75qoDNAjZIa+Uuj
 djdw==
X-Gm-Message-State: AOAM5337wOmptaM3y8QeSkYXdQYF+FpklivvZlXIJDRQoJl0u+REuoeI
 W9ElZxpPO3EGFBGk2Ysp2z++wQ==
X-Google-Smtp-Source: ABdhPJyD1jRSGwcY6EF73cOOfS9VcklHkc4/nDf4NupmbLV/BMOgfKQcwqBFjSVCoyJpu1WksiQ3cw==
X-Received: by 2002:a17:902:fe95:b029:da:fa53:666 with SMTP id
 x21-20020a170902fe95b02900dafa530666mr3161164plm.72.1608096172276; 
 Tue, 15 Dec 2020 21:22:52 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id y5sm634786pjt.42.2020.12.15.21.22.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Dec 2020 21:22:51 -0800 (PST)
Date: Wed, 16 Dec 2020 10:52:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
Message-ID: <20201216052248.qi6fbo2dh6shw4rt@vireshk-i7>
References: <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
 <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
 <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
 <CAF6AEGv215ixcAWmaOWs7UKAqmbMs=aFyTBBYLU-bt8XBnWb7g@mail.gmail.com>
 <20201106071621.j732gt4nqifjrccd@vireshk-i7>
 <CAF6AEGt_wbWuQA7gBw4yn4f2x0SVbfub4eRDX59PCvnd_0uFxg@mail.gmail.com>
 <20201118052829.ugt7i7ac6eqsj4l6@vireshk-i7>
 <CAF6AEGv=-h7GFj5LR97FkeBBn+gk6TNS5hZkwBwufpE4yO7GyA@mail.gmail.com>
 <20201119060528.qscedvc4jlmxakqo@vireshk-i7>
 <20201207061654.btlgobmsljdqbb2u@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207061654.btlgobmsljdqbb2u@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, "Menon, Nishanth" <nm@ti.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07-12-20, 11:46, Viresh Kumar wrote:
> On 19-11-20, 11:35, Viresh Kumar wrote:
> > On 18-11-20, 08:53, Rob Clark wrote:
> > > On Tue, Nov 17, 2020 at 9:28 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > >
> > > > On 17-11-20, 09:02, Rob Clark wrote:
> > > > > With that on top of the previous patch,
> > > >
> > > > Don't you still have this ? Which fixed the lockdep in the remove path.
> > > >
> > > > https://lore.kernel.org/lkml/20201022080644.2ck4okrxygmkuatn@vireshk-i7/
> > > >
> > > > To make it clear you need these patches to fix the OPP stuff:
> > > >
> > > > //From 5.10-rc3 (the one from the above link).
> > > > commit e0df59de670b ("opp: Reduce the size of critical section in _opp_table_kref_release()")
> > 
> > This fixes debugfs stuff while the OPP table is removed.
> > 
> > > > //Below two from linux-next
> > > > commit ef43f01ac069 ("opp: Always add entries in dev_list with opp_table->lock held")
> > > > commit 27c09484dd3d ("opp: Allocate the OPP table outside of opp_table_lock")
> > 
> > This fixes debugfs stuff while the OPP table is added.
> > 
> > > > This matches the diff I gave you earlier.
> > > >
> > > 
> > > no, I did not have all three, only "opp: Allocate the OPP table
> > > outside of opp_table_lock" plus the fixup.  But with all three:
> > 
> > And looking at the lockdep you gave now, it looks like we have a
> > problem with OPP table's internal lock (opp_table->lock) as well apart
> > from the global opp_table_lock.
> > 
> > I wish there was a way for me to reproduce the lockdep :(
> > 
> > I know this is exhausting for both of us and I really want to be over
> > with it as soon as possible, this really should be the last patch
> > here, please try this along with other two. This fixes the debugfs
> > thing while the OPPs in the OPP table are removed (they are already
> > added without a lock around debugfs stuff).
> > 
> > AFAIU, there is no further debugfs stuff that happens from within the
> > locks and so this really should be the last patch unless I missed
> > something.
> 
> Rob, were you able to test this patch ?

FWIW, this patch and everything else I had is merged into Linus's
master. You can test 5.11-rc1 to see if you still see a lockdep or
not.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
