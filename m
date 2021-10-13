Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A7142C168
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 15:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FED6EA2E;
	Wed, 13 Oct 2021 13:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13ADA6EA2E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 13:28:39 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id y3so8507172wrl.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 06:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=z4ZgAEAoTVMxOnqXiiyeRIDWz4tBxSDa2F9/fHVX7dk=;
 b=DzXQqLIypsAO7Y2v4IlvMvd/IIrb+Jq3fE/S6+d/+aKgVXaHxU07tfh0xPrilaesQ7
 KQbuzMMFqTt61Ue3HaKDG37bPFdPKBaFJzuuGEfK2wQNneLlNNe1pLqmFGv8+lb1qc7f
 H8UBMpudDWNbyo/Ta3uHT3Ia+CK60LcDOygV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z4ZgAEAoTVMxOnqXiiyeRIDWz4tBxSDa2F9/fHVX7dk=;
 b=sEVqFmu15iotDVenUMjvKo31aUZ0jcuo3PGBpQSSzI0tUUIAT9E30sq90/WdnaoAo5
 WdAInrTqCvWThMVV1cmspDOtkoA9wWbSChIYw7l0Fn5+MtM5YaJdJbWtigbn7VudbNe9
 aGGTe5h7V6kjQYInBRmrzugqtFal+Yzh8TO9sYHEvFxcISMVPlfB6PMRUocW3iVpx8Fo
 rrvP+1PrZArTkmIKXvFaoyGtRom1ySlyF978/g494YzyMQALfBqe4acdgPaHO7FtcmUF
 7A5+BPYcQK3igZ2q+g5JT0jKPLaoGsCeN22yRYI4tc03YHlfpoZ6Kjf4JiEugh7E+Dzz
 rjvw==
X-Gm-Message-State: AOAM532rqCz8BIj0L4bOa+EIURlcsPsRHRPiPAF776uKXYUq/sGGgP8D
 NOyEq/QxpaKQrVPlM18f5B5Ag7nk/NlU1g==
X-Google-Smtp-Source: ABdhPJzYu1OTr65sgaIYoPS84bMN9GmHZvHkaOp5Jet3Jpk2nZWF29LGzYCzhyDbivtlzOJXU5wJLg==
X-Received: by 2002:a05:600c:17ca:: with SMTP id
 y10mr13132804wmo.62.1634131717595; 
 Wed, 13 Oct 2021 06:28:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j1sm16647610wrb.56.2021.10.13.06.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 06:28:37 -0700 (PDT)
Date: Wed, 13 Oct 2021 15:28:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: John Cox <jc@kynesim.co.uk>
Cc: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Subject: Re: Should multiple PRIME_FD_TO_HANDLE ioctls on the same fd require
 multiple GEM_CLOSE?
Message-ID: <YWbfA+8tp5FuKh2s@phenom.ffwll.local>
References: <mg3bmgt12b5s7qlqn1gkc5q8f75dgfu91m@4ax.com>
 <nxaw17TpxhjASmae6VSj_yGM78BHFZF6RXy7s7LFJ3C7mmbDfGaafJ9umB5_08Xlf7X8SKAKhEEGOa-WFiv-jLkYDi_Yjn6Hdhn76YgrTuI=@emersion.fr>
 <oalbmg9okjpuieqo8fl8b890h1a7sflv94@4ax.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <oalbmg9okjpuieqo8fl8b890h1a7sflv94@4ax.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Tue, Oct 12, 2021 at 07:37:11PM +0100, John Cox wrote:
> On Tue, 12 Oct 2021 17:33:18 +0000, you wrote:
> 
> >Yes, this is expected behavior, even if it's not intuitive. For more
> >details, see:
> >
> >https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/110
> 
> Thanks - as noted in that discussion the behaviour is a bit unhelpful
> but just knowing that it is expected means I can deal with it.

kerneldoc in that uapi header to explain precisely what and why is going
on would be good too.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
