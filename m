Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CB36344A9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 20:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C1610E452;
	Tue, 22 Nov 2022 19:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F26110E455
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 19:34:06 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id a27so9945648qtw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 11:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gK4Hv+hqSXYYQhPJs2BourCuWSPOf2CqiS0ROx9Lxc8=;
 b=CPzftK7vuA/xYmMuEz95P61nJcTJe12hw3MBpezd1074VzPH8xTgyqV0FUaxEEJksa
 76E8WmyHAbWkclqEsxLZyw2K028d+6oeTL/GrVbXvbaep1xle3bCI/IIXbt14Y0jSeae
 hwFxUpR331wfRKiGtv00NJCgbCSjlwlkaG0f+J1hdhZjyqfzc8T5JlYUGLtO5RVxeXRt
 1uZY0cRWubIqaMorhSYTMqS9yvP45WenKnS+Ug0bOR3i2oIV+EV4Zeh/dcqaRWE8XTev
 /Fdlk5XmoTs+Ej2i8M3uHFhC0B7/BkSvQSjlFsw6fF+5LmOoJQmP6i77iWjxk70IJ0t1
 pZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gK4Hv+hqSXYYQhPJs2BourCuWSPOf2CqiS0ROx9Lxc8=;
 b=Pn6kML1g7SdSuOoYz7/i+PnCMClGkgm9hRSoeaP4q81hCl7DwvcPB4VHLxny2zuLIk
 jdFyTamlFcAHFYvSTeJe2MMhJ/syZjQJFzoHhmG77XpZKRdqM9qUQA9Tvo/fZ8w9CbfQ
 B+Z7rkJg0YBCCZs/4j/PHqfMiyqa/euyfGAfY30fNikizwbzBulQvzERnpQR+9CLgeXH
 m87wEtghH2yxvQDG7z7L+1N+mTJVl8rMNauMMa548n6SfbY3XvNCtKHcV1FyCAQJ6DKy
 T20V9+In0sJLbPXk32r+K9CHePA5EZhQaRiMNhtOD1ru5nzR0rBz8qfOyAXHk28+sZLo
 rRJg==
X-Gm-Message-State: ANoB5pkk5ECFq6GPx5imOlO5PyLTqwDPyIWpCZu97xptyq8xbQ2td206
 G/mXMgTk4CsjcXR5qHhEUO7cTA==
X-Google-Smtp-Source: AA0mqf6itFyBYcobfUpRF0+IzeljS0J+Jfi+RUYvR39ErLilLCE/4r/HMIncmxqXwEdfvSrcmm2y1g==
X-Received: by 2002:ac8:1019:0:b0:3a5:42b9:d7aa with SMTP id
 z25-20020ac81019000000b003a542b9d7aamr23027660qti.58.1669145645365; 
 Tue, 22 Nov 2022 11:34:05 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 ay20-20020a05620a179400b006faa88ba2b5sm10743137qkb.7.2022.11.22.11.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 11:34:04 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oxZ1v-009xu2-IB;
 Tue, 22 Nov 2022 15:34:03 -0400
Date: Tue, 22 Nov 2022 15:34:03 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
Message-ID: <Y30kK6dsssSLJVgp@ziepe.ca>
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
 <Y30PDdsvHIJo5YHR@ziepe.ca>
 <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
 <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 08:29:05PM +0100, Daniel Vetter wrote:

> You nuke all the ptes. Drivers that move have slightly more than a
> bare struct file, they also have a struct address_space so that
> invalidate_mapping_range() works.

Okay, this is one of the ways that this can be made to work correctly,
as long as you never allow GUP/GUP_fast to succeed on the PTEs. (this
was the DAX mistake)

Jason
