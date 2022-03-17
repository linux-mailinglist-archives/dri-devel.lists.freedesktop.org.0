Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6364DC9AA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 16:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43DF10E7E0;
	Thu, 17 Mar 2022 15:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDB010E7CD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 15:13:11 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id p26so2143210wma.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 08:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nQqbWtH5pfKnl7ntBQnMna6KGgKeLVbC9temYzdbrVk=;
 b=jmPQuC0gcd7cVIo3rSP/TX3nT+TeQj+v9JPsb3+HNkEXYNGVZawetow5Z2hnZIlwz1
 enueRIfh+3xPAy+wyBjmg6HTmAnGRTS3UNFVvjEzNOFZlbbcZIWJYIMWNfrAAiV18x1u
 B04ZhhSUezK2Y6L6opNRDOzvXt3b8Zrp+G/nVdxhrldjtCvUcdT43gXRxBKtJSR6Fe2i
 0GcLQmp/1a55cGSKTLClpOwxBvyHtdXqe31s0Zpm0GmUCGQejjSJnsXl49RplKJN086R
 l0NlPTW8n9kOxKEUG5tBfu09d3hlUdyDsWjb/QEQPNEZVY+TBbECzQplDjsvwgPZ2Zam
 APNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nQqbWtH5pfKnl7ntBQnMna6KGgKeLVbC9temYzdbrVk=;
 b=pofxYpg1YMSZn/BAc5PQcNpFsya6raNxJFnlpuMaJ8kD7zWilE69jq210msaQfObWb
 gImEzkQN7xvlpDPB6yNkaNxxSiY830UrB200dBfGUSqDiGTLvrLuXY5UbheM6VrpwaOf
 oWdgeCCa3WudLieD71aG+HzSHAzBzQpcxAu1noER9dEB6aoC80bJdV3zFNwihLyfuyxv
 N7RnyyD3R/L+mozvKBh9Pgsz6HY2cGjxqUDd+i0W7AjnQxooeEkr3D7t6L6UOpsCkFPN
 yl6FWAEqSkwAyFR2Pgq9df2AxImC56nli+Y1zwrt/1O14tojM7sZEZHikg/s/jBFvMVS
 VWGQ==
X-Gm-Message-State: AOAM5300oglKHJu37CGod+iCmRi0cFJCoDMe1JLGZ9LdW5ByM/GTiJrL
 uOutWYGJV86oJy4YYJn+fY5FTg==
X-Google-Smtp-Source: ABdhPJzqUVa6RciYrP1Fyl38aF2HC6O1bKNmreDFYFmrsonBxUtm8n/rju3WMT43L8SJZFzSztNf3Q==
X-Received: by 2002:a05:600c:27d0:b0:38c:6c01:9668 with SMTP id
 l16-20020a05600c27d000b0038c6c019668mr8492847wmb.59.1647529989621; 
 Thu, 17 Mar 2022 08:13:09 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 f7-20020a0560001a8700b00203c23e55e0sm4405777wry.78.2022.03.17.08.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 08:13:09 -0700 (PDT)
Date: Thu, 17 Mar 2022 15:13:07 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH 1/1] drm/amdkfd: Protect the Client whilst it is being
 operated on
Message-ID: <YjNQA80wkWpy+AmA@google.com>
References: <20220317131610.554347-1-lee.jones@linaro.org>
 <8702f8a5-62a1-c07e-c7b7-e9378be069b6@amd.com>
 <YjNNCXc8harOvwqe@google.com>
 <1f003356-3cf9-7237-501e-950d0aa124d1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f003356-3cf9-7237-501e-950d0aa124d1@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Mar 2022, Felix Kuehling wrote:

> 
> Am 2022-03-17 um 11:00 schrieb Lee Jones:
> > Good afternoon Felix,
> > 
> > Thanks for your review.
> > 
> > > Am 2022-03-17 um 09:16 schrieb Lee Jones:
> > > > Presently the Client can be freed whilst still in use.
> > > > 
> > > > Use the already provided lock to prevent this.
> > > > 
> > > > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > Cc: "Christian König" <christian.koenig@amd.com>
> > > > Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > > > Cc: David Airlie <airlied@linux.ie>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: amd-gfx@lists.freedesktop.org
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 6 ++++++
> > > >    1 file changed, 6 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> > > > index e4beebb1c80a2..3b9ac1e87231f 100644
> > > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> > > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> > > > @@ -145,8 +145,11 @@ static int kfd_smi_ev_release(struct inode *inode, struct file *filep)
> > > >    	spin_unlock(&dev->smi_lock);
> > > >    	synchronize_rcu();
> > > > +
> > > > +	spin_lock(&client->lock);
> > > >    	kfifo_free(&client->fifo);
> > > >    	kfree(client);
> > > > +	spin_unlock(&client->lock);
> > > The spin_unlock is after the spinlock data structure has been freed.
> > Good point.
> > 
> > If we go forward with this approach the unlock should perhaps be moved
> > to just before the kfree().
> > 
> > > There
> > > should be no concurrent users here, since we are freeing the data structure.
> > > If there still are concurrent users at this point, they will crash anyway.
> > > So the locking is unnecessary.
> > The users may well crash, as does the kernel unfortunately.
> We only get to kfd_smi_ev_release when the file descriptor is closed. User
> mode has no way to use the client any more at this point. This function also
> removes the client from the dev->smi_cllients list. So no more events will
> be added to the client. Therefore it is safe to free the client.
> 
> If any of the above were not true, it would not be safe to kfree(client).
> 
> But if it is safe to kfree(client), then there is no need for the locking.

I'm not keen to go into too much detail until it's been patched.

However, there is a way to free the client while it is still in use.

Remember we are multi-threaded.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
