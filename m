Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2442918BAB2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 16:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B81C6E169;
	Thu, 19 Mar 2020 15:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CD56E169
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 15:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584630721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2jTNInS2u0iUBq6Q5x+rQ0cEuaKmz4XIPiV/qSDM6M=;
 b=CFntSb0Q6irDvaPtA3gE2w8fAFtXMY62Zbbbm7FkM2e+we6CFv57uLi+xbhPA7PqAJz0kT
 7xmZLCb5iPci1aN6lTke06rZlExZbol+h08TB8tan6T1mhtlY1WaKEkKO6479yc/H6APXV
 h5v7BhxBOoxRtIGNYONvPLZZVrlwku4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-78gCMsL4Pma1tgKZJlMkeQ-1; Thu, 19 Mar 2020 11:12:00 -0400
X-MC-Unique: 78gCMsL4Pma1tgKZJlMkeQ-1
Received: by mail-qt1-f198.google.com with SMTP id r3so1595640qtp.21
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 08:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=R2jTNInS2u0iUBq6Q5x+rQ0cEuaKmz4XIPiV/qSDM6M=;
 b=GwyTrouQ+Hj0qv3iZlwdg6pPIUPSrxBfej/4WA5vqyNr8txnL85zokRSSLmF0nobWE
 KFIa+qsZF1kDJDnnseGTYmQmRDWrTtc5kiRhk7iJ1PZhbZbmwfsK4JQ1nnz9/34JIg2w
 L/6cJ563xvDCrEUK0EPwv2CDKXZs3MpnDwd48Du4oU70ey8U2VApW5uHMwQJssajd98Y
 vTapTADMsG6h/mMMuXHjFYb53VnqLhVLBH0W/Y8ZsOY+BYnSBiL2qHZhKFDgwPBOrk07
 k2OQ4eBb/zd7HXl6K6stmEvXOvqe15kQrjtNebUAewkVjYgT/8QvkTAVeCL8dU3umiXL
 aqcQ==
X-Gm-Message-State: ANhLgQ1MuSvrn+PIzwARU98ve3vYxMAMOigf40eTC0Un2RKOUcOP3fTi
 YPCaK5GWYS9lDFO4St39p0zIEmgxfIghUiZY7ccK/d6gBCpfMLu5oIJuRtFxreMuhU7mSnafVcL
 wdQ2smvmKZna8B77MdOqZh1XLKXFY
X-Received: by 2002:a0c:c20f:: with SMTP id l15mr3472527qvh.157.1584630719876; 
 Thu, 19 Mar 2020 08:11:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtWyyFTM7c6F2PBhol2nJKTi+PMnQgJ9jZcYCF24ti4c0gD/3/efnbIOTEpnLhtnrRCBx6Uyw==
X-Received: by 2002:a0c:c20f:: with SMTP id l15mr3472499qvh.157.1584630719561; 
 Thu, 19 Mar 2020 08:11:59 -0700 (PDT)
Received: from desoxy (c-24-61-245-152.hsd1.ma.comcast.net. [24.61.245.152])
 by smtp.gmail.com with ESMTPSA id s11sm1251750qke.97.2020.03.19.08.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 08:11:58 -0700 (PDT)
Message-ID: <ca9b54f4f79324fe2880d34b0ab7c40f2e5fed66.camel@redhat.com>
Subject: Re: [PATCH] drm: rework SET_MASTER and DROP_MASTER perm handling
From: Adam Jackson <ajax@redhat.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Date: Thu, 19 Mar 2020 11:11:56 -0400
In-Reply-To: <20200219132728.64083-1-emil.l.velikov@gmail.com>
References: <20200219132728.64083-1-emil.l.velikov@gmail.com>
User-Agent: Evolution 3.34.0 (3.34.0-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-02-19 at 13:27 +0000, Emil Velikov wrote:

> + * As some point systemd-logind was introduced to orchestrate and delegate
> + * master as applicable. It does so by opening the fd and passing it to users
> + * while in itself logind a) does the set/drop master per users' request and
> + * b)  * implicitly drops master on VT switch.
> + *
> + * Even though logind looks like the future, there are a few issues:
> + *  - using it is not possible on some platforms
> + *  - applications may not be updated to use it,
> + *  - any client which fails to drop master* can DoS the application using
> + * logind, to a varying degree.

I'm not super worried. Everything about VTs is a pile of DoS scenarios
that userspace has to dance to avoid. It sounds like this is only
introducing new DoS scenarios for cases that previously simply did not
work.

> + * As a result this fixes, the following when using root-less build w/o logind

Nitpick: no comma here.

>  int drm_setmaster_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file_priv)
>  {
>  	int ret = 0;
>  
>  	mutex_lock(&dev->master_mutex);
> +
> +	ret = drm_master_check_perm(dev, file_priv);
> +	if (ret)
> +		goto out_unlock;
> +
>  	if (drm_is_current_master(file_priv))
>  		goto out_unlock;

I'd mentioned this on IRC, and it doesn't need to be changed with this
patch, but it would be cool if the "does the device already have a
master" check just below here would return -EBUSY instead of -EINVAL so
userspace diagnostics have a chance of saying something useful. A quick
audit of the X drivers and weston shows no cases where we care about
the generated errno value beyond feeding it into strerror() so that
should also be safe.

Looks good otherwise, and these are definitely more reasonable
semantics. Thanks for taking this on!

Reviewed-by: Adam Jackson <ajax@redhat.com>

- ajax

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
