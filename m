Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8D14E5274
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 13:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DCF10E1B9;
	Wed, 23 Mar 2022 12:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D462A10E6C7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 12:46:59 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j18so1962781wrd.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 05:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QrnKrN1J0be5aGhbUhpBdOm3mgQtzJ3AbarAe1cgyz4=;
 b=PNp6vqLvvi186d7HmPfAqbvJGTx7NW1Fx8uwCXWK6FDJi8hDa0A4Obyl0BJlO5+1lB
 vMizD2ozDTrd1SWvW6k6EbB7UdNw60K8M08R7jTHpovxIB7hs0FOgMsE6ChIt7QkfrIk
 bTGHkOg+xnrkgrIEahmcKVKPCqZRSxCqwzYZUfEPQXRZLytNNrKHkdlH6ytPTaCbezNf
 6KqsyEBPIYlSSPXBmqKdIRnKAWl5fyQw0hqv/fail0P9VB0VcVBOKzUv2UrSnseSFA4P
 4qliOHKw8/ytu9CL4ol6/j71Mf3nRJBkXmqtRzicETMnTCLQtXImq4sJeK616gwzDtE4
 tvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QrnKrN1J0be5aGhbUhpBdOm3mgQtzJ3AbarAe1cgyz4=;
 b=mrUiLXfEp1sRP/AjHVz3n7A7xUuaGQ+Y/r45PSc4w2NU4msVq3YoLNPfGQqq0qIBiM
 sxN+9Euv20vgcBTo5TjrbcjObDr6hjKqo8W6/QReqZW3bN1jt0SrvN+08Su9OkmUfN7U
 Y4VhHiWuBnKTMP5qdHICyaoRB3wdvTz6geMcbZtSxGrWXTOBlvlK/eLlFbV5Cr/Djhjx
 Ra1a8vse1K2vy3QnUucXBIpcZyAbupDB73ZMuqzYdROhk3A3PkX2cZvw/OhZGwu1Xg70
 fVo+sLGYSjPu6ku8B3gjILiq7Ls7GbLUWOt4/ajXhnyOLYLyq+hjMXrbsblRNy7aTXp0
 eKaw==
X-Gm-Message-State: AOAM532WGRvhLC5ZVfL8dweTuZZY/1FaDBWCZpJAPZZb+eYyvcuyHG0h
 RyHV1+89XYaPTDeHHJV7b8kPGw==
X-Google-Smtp-Source: ABdhPJzSkUmPOcaKtIxHaouVgmm319CJF0UXHX2JHBimkzdShZYdJ/tai3elVkeKWEBvyUS26e35pw==
X-Received: by 2002:a5d:64e7:0:b0:205:8cc7:aa82 with SMTP id
 g7-20020a5d64e7000000b002058cc7aa82mr1486949wri.247.1648039618247; 
 Wed, 23 Mar 2022 05:46:58 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 o8-20020a5d6488000000b002051f1028f6sm4375837wri.111.2022.03.23.05.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 05:46:57 -0700 (PDT)
Date: Wed, 23 Mar 2022 12:46:55 +0000
From: Lee Jones <lee.jones@linaro.org>
To: philip yang <yangp@amd.com>
Subject: Re: [PATCH 1/1] drm/amdkfd: Protect the Client whilst it is being
 operated on
Message-ID: <YjsWvy8cT2eOw618@google.com>
References: <20220317131610.554347-1-lee.jones@linaro.org>
 <8702f8a5-62a1-c07e-c7b7-e9378be069b6@amd.com>
 <YjNNCXc8harOvwqe@google.com>
 <1f003356-3cf9-7237-501e-950d0aa124d1@amd.com>
 <YjNQA80wkWpy+AmA@google.com>
 <b65db51e-f1ba-3a9b-0ac1-0b8ae51c5eee@amd.com>
 <YjNh/Ajxgp3mjvWV@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YjNh/Ajxgp3mjvWV@google.com>
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <felix.kuehling@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Mar 2022, Lee Jones wrote:

> On Thu, 17 Mar 2022, philip yang wrote:
> 
> >    On 2022-03-17 11:13 a.m., Lee Jones wrote:
> > 
> > On Thu, 17 Mar 2022, Felix Kuehling wrote:
> > 
> > 
> > Am 2022-03-17 um 11:00 schrieb Lee Jones:
> > 
> > Good afternoon Felix,
> > 
> > Thanks for your review.
> > 
> > 
> > Am 2022-03-17 um 09:16 schrieb Lee Jones:
> > 
> > Presently the Client can be freed whilst still in use.
> > 
> > Use the already provided lock to prevent this.
> > 
> > Cc: Felix Kuehling [1]<Felix.Kuehling@amd.com>
> > Cc: Alex Deucher [2]<alexander.deucher@amd.com>
> > Cc: "Christian König" [3]<christian.koenig@amd.com>
> > Cc: "Pan, Xinhui" [4]<Xinhui.Pan@amd.com>
> > Cc: David Airlie [5]<airlied@linux.ie>
> > Cc: Daniel Vetter [6]<daniel@ffwll.ch>
> > Cc: [7]amd-gfx@lists.freedesktop.org
> > Cc: [8]dri-devel@lists.freedesktop.org
> > Signed-off-by: Lee Jones [9]<lee.jones@linaro.org>
> > ---
> >    drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 6 ++++++
> >    1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/a
> > mdkfd/kfd_smi_events.c
> > index e4beebb1c80a2..3b9ac1e87231f 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> > @@ -145,8 +145,11 @@ static int kfd_smi_ev_release(struct inode *inode, struct f
> > ile *filep)
> >         spin_unlock(&dev->smi_lock);
> >         synchronize_rcu();
> > +
> > +       spin_lock(&client->lock);
> >         kfifo_free(&client->fifo);
> >         kfree(client);
> > +       spin_unlock(&client->lock);
> > 
> > The spin_unlock is after the spinlock data structure has been freed.
> > 
> > Good point.
> > 
> > If we go forward with this approach the unlock should perhaps be moved
> > to just before the kfree().
> > 
> > 
> > There
> > should be no concurrent users here, since we are freeing the data structure.
> > If there still are concurrent users at this point, they will crash anyway.
> > So the locking is unnecessary.
> > 
> > The users may well crash, as does the kernel unfortunately.
> > 
> > We only get to kfd_smi_ev_release when the file descriptor is closed. User
> > mode has no way to use the client any more at this point. This function also
> > removes the client from the dev->smi_cllients list. So no more events will
> > be added to the client. Therefore it is safe to free the client.
> > 
> > If any of the above were not true, it would not be safe to kfree(client).
> > 
> > But if it is safe to kfree(client), then there is no need for the locking.
> > 
> > I'm not keen to go into too much detail until it's been patched.
> > 
> > However, there is a way to free the client while it is still in use.
> > 
> > Remember we are multi-threaded.
> > 
> >    files_struct->count refcount is used to handle this race, as
> >    vfs_read/vfs_write takes file refcount and fput calls release only if
> >    refcount is 1, to guarantee that read/write from user space is finished
> >    here.
> > 
> >    Another race is driver add_event_to_kfifo while closing the handler. We
> >    use rcu_read_lock in add_event_to_kfifo, and kfd_smi_ev_release calls
> >    synchronize_rcu to wait for all rcu_read done. So it is safe to call
> >    kfifo_free(&client->fifo) and kfree(client).
> 
> Philip, please reach out to Felix.

Philip, Felix, are you receiving my direct messages?

I have a feeling they're being filtered out by AMD's mail server.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
