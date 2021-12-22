Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD8C47D944
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 23:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135A410E117;
	Wed, 22 Dec 2021 22:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F39710E117
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 22:17:47 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id j21so13942951edt.9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 14:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ofS9l2qebwP/4iVIsemnUHzvM6pKNrDlGzoJ6fIi4zg=;
 b=GnhmZe1h6FTTH2nJh32MPELKTW7ojgKXikumoF92vVm8XujNXZdnZN0/d4zrgpJj/l
 jcI54ELsP9vg3li/ZgE4WKFEzI71oupPrTMs0+vIDhUe0qCtfleux6ZM3z+21hzn7zQr
 zujEh5K11y9nfS2dzepGCDKqUaEAtPDC1R1+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ofS9l2qebwP/4iVIsemnUHzvM6pKNrDlGzoJ6fIi4zg=;
 b=2Lvk3982ji8PSVZKtf4axwO6ls8ze0sZQcZRI0tDD4oX/TYGB7t5DI3My36szwSWAi
 23Y7f/lEGsqapusnabI85mkbNMf/9sUJebsULfsJlMydfxbx966AFXQ3sB6oJ0FyGpD6
 me02EWKohwlW6EJVJLEW042PdMl4ps4l+t0Tux1O6da+HkSgmMPM+72A7uIfnKwkKh6J
 pmj47R9rIKuvEeDHhF06X3u7rNvcVqXmkFRHBcVjc7gFlxDF4KSvx4MHkOusgQ1em1oQ
 NI9yeo2LEdZp+EvCw8BG5dU5y0rgMVRlDjN3fi6DKVSFE4kN1CxOxaDgGWJTD2s6eHwF
 /cEA==
X-Gm-Message-State: AOAM532dzpPsT9Ycmo5B6Nl8DWZ4QRed0ZI3ZSnvOmnxnn/OIgEeE+Fk
 MrpTdMXhOBUws1+Sj43uiDkF3Q==
X-Google-Smtp-Source: ABdhPJyKQZiPqbmCmMmzckiH9gys1Mq4AY8wyy4rqynP1muKZHFdKlWttPT4i3NqFoj/nb0zYSrwYg==
X-Received: by 2002:a17:906:580a:: with SMTP id
 m10mr3807993ejq.213.1640211465721; 
 Wed, 22 Dec 2021 14:17:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i6sm1305577edx.46.2021.12.22.14.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 14:17:45 -0800 (PST)
Date: Wed, 22 Dec 2021 23:17:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: completely rework the dma_resv semantic
Message-ID: <YcOkB0Jlc5KsHnEN@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <e8c7284f-e18e-0dcc-f0a2-3a1ad6222fd4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8c7284f-e18e-0dcc-f0a2-3a1ad6222fd4@gmail.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 17, 2021 at 03:39:52PM +0100, Christian König wrote:
> Hi Daniel,
> 
> looks like this is going nowhere and you don't seem to have time to review.
> 
> What can we do?

cc more people, you didn't cc any of the driver folks :-)

Also I did find some review before I disappeared, back on 10th Jan.

Cheers, Daniel

> 
> Thanks,
> Christian.
> 
> Am 07.12.21 um 13:33 schrieb Christian König:
> > Hi Daniel,
> > 
> > just a gentle ping that you wanted to take a look at this.
> > 
> > Not much changed compared to the last version, only a minor bugfix in
> > the dma_resv_get_singleton error handling.
> > 
> > Regards,
> > Christian.
> > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
