Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D69366069
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 21:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D95A6E8C0;
	Tue, 20 Apr 2021 19:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD846E8C0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 19:48:53 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id e7so29967955wrs.11
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 12:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a0ukk8PsmQlwN+Rn5D2gQhIuSsA6BZpFzPg9NcEGXp4=;
 b=cVZn7IGo989i7xUSg+rXp68iLOK7CgyQQM1NAyXGf3Rm5NsGkpLnShh6CCB8Jd5b9p
 G/P6mLrZ25hwBLom0lu6XVSL5hod5Z6LDP7F5Q8ofb0LmKDBE5lqMS6Ls9c8AsVQXJ1P
 hDKtIokHP8dNmGYM1ahRLxDUGnH1BDzUPHIBHEapXq48H+km2Qzhjt4gkjROxlfO2u3E
 fDQ2vRBQxvRzF84f5ET/yHJEGE/sqKSyTsV2JciSxJ5eOTltHY072pdeFo8/9HAhVdKL
 cNBCbiDDQFM51PTtHSyGDK5XeQ0eZWRFCjMuSGTtlHRt8SfhJTZA4r/tECpvpvnAbHDv
 SBSQ==
X-Gm-Message-State: AOAM533QRAK6cZXnIvrJJGlhPvzb2XkyXuxMC/q7WBa4P0NiAqEaX87v
 jOZFBnszooru3/AgoiRjXB0=
X-Google-Smtp-Source: ABdhPJy0ZocLxNBmT+3nxOoxl9PzGDN9xmxdB2RMLTGXFgEvNocM1baf8kWI66gQWw/s/BQ9T+mPiA==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr22203180wrm.327.1618948131851; 
 Tue, 20 Apr 2021 12:48:51 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id d2sm10485wrs.10.2021.04.20.12.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 12:48:51 -0700 (PDT)
Date: Tue, 20 Apr 2021 19:48:50 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Michael Kelley <mikelley@microsoft.com>
Subject: Re: [PATCH 1/1] video: hyperv_fb: Add ratelimit on error message
Message-ID: <20210420194850.ykxb3yy75zvzqfun@liuwe-devbox-debian-v2>
References: <1618933459-10585-1-git-send-email-mikelley@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1618933459-10585-1-git-send-email-mikelley@microsoft.com>
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
Cc: wei.liu@kernel.org, sthemmin@microsoft.com, haiyangz@microsoft.com,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, kys@microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 08:44:19AM -0700, Michael Kelley wrote:
> Due to a full ring buffer, the driver may be unable to send updates to
> the Hyper-V host.  But outputing the error message can make the problem
> worse because console output is also typically written to the frame
> buffer.  As a result, in some circumstances the error message is output
> continuously.
> 
> Break the cycle by rate limiting the error message.  Also output
> the error code for additional diagnosability.
> 
> Signed-off-by: Michael Kelley <mikelley@microsoft.com>

Applied to hyperv-next. Thanks.

> ---
>  drivers/video/fbdev/hyperv_fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
> index 4dc9077..a7e6eea 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -308,7 +308,7 @@ static inline int synthvid_send(struct hv_device *hdev,
>  			       VM_PKT_DATA_INBAND, 0);
>  
>  	if (ret)
> -		pr_err("Unable to send packet via vmbus\n");
> +		pr_err_ratelimited("Unable to send packet via vmbus; error %d\n", ret);
>  
>  	return ret;
>  }
> -- 
> 1.8.3.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
