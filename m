Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F08C4B23F8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B7C10EAB9;
	Fri, 11 Feb 2022 11:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7DE10EABE
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 11:10:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1C71ACE28ED;
 Fri, 11 Feb 2022 11:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC18C340E9;
 Fri, 11 Feb 2022 11:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644577801;
 bh=33FdS46stfzSs/sG/CxUDAEbJjCWo6GD2sOd4EcXOk0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vn+Huk6YEfMew3bvWssowMlIcmOA7tf8jOwQ31FhgmXiFSouMARkQeAMHVJam4X1S
 09ykEZLx8MmWMycmtIynxtrXvIk+jIZGxSykk1Mr7fMeletbxxDqnSO2DNqnJEvQaU
 LnadcQl3M76G9ujUWirc9m8fPYwC/pOchdqElDFk=
Date: Fri, 11 Feb 2022 12:09:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH] devcoredump: increase the device delete timeout to 10 mins
Message-ID: <YgZEBrgG4rIZsfxN@kroah.com>
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
 <8d67484c7e4b9fb4560d2eca1f71c75fde8bae0d.camel@sipsolutions.net>
 <ebd340e4-2a02-d484-2ed0-9ee738d5b5c5@quicinc.com>
 <c59bc1af9974484075091333a3c98a2088251321.camel@sipsolutions.net>
 <a280fec2-754a-88ec-acc7-337e069e9148@quicinc.com>
 <c2a6e29063793eecc5c65d32af9d826544404ecc.camel@sipsolutions.net>
 <b60d30cf-e435-49c4-a251-b910bc2e94ae@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b60d30cf-e435-49c4-a251-b910bc2e94ae@quicinc.com>
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
Cc: rafael@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, khsieh@codeaurora.org, nganji@codeaurora.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 Johannes Berg <johannes@sipsolutions.net>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 08, 2022 at 05:55:18PM -0800, Abhinav Kumar wrote:
> Hi Johannes
> 
> On 2/8/2022 1:54 PM, Johannes Berg wrote:
> > On Tue, 2022-02-08 at 13:40 -0800, Abhinav Kumar wrote:
> > > > 
> > > I am checking what usermode sees and will get back ( I didnt see an
> > > error do most likely it was EOF ). I didnt follow the second part.
> > 
> > I think probably it got -ENODEV, looking at kernfs_file_read_iter().
> > 
> > > If the file descriptor read returns EOF, even if we consider them
> > > separate how will it resolve this issue?
> > > 
> > > My earlier questions were related to fixing it in devcoredump to detect
> > > and fix it there. Are you suggesting to fix in usermode instead? How?
> > > 
> > 
> > Yeah, no, you cannot fix it in userspace.
> > 
> > But I just followed the rabbit hole down kernfs and all, and it looks
> > like indeed the read would be cut short with -ENODEV, sorry.
> > 
> > It doesn't look like there's good API for this, but it seems at least
> > from the underlying kernfs POV it should be possible to get_device() in
> > open and put_device() in release, so that the device sticks around while
> > somebody has the file open? It's entirely virtual, so this should be OK?
> > 
> > johannes
> 
> Are you suggesting something like below?
> 
> diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> index 42dcf96..14203d0 100644
> --- a/fs/sysfs/file.c
> +++ b/fs/sysfs/file.c
> @@ -32,6 +32,22 @@ static const struct sysfs_ops *sysfs_file_ops(struct
> kernfs_node *kn)
>         return kobj->ktype ? kobj->ktype->sysfs_ops : NULL;
>  }
> 
> +static int sysfs_kf_open(struct kernfs_open_file *of)
> +{
> +       struct kobject *kobj = of->kn->parent->priv;
> +       struct device *dev = kobj_to_dev(kobj);
> +
> +       get_device(dev);
> +}
> +
> +static void sysfs_kf_release(struct kernfs_open_file *of)
> +{
> +       struct kobject *kobj = of->kn->parent->priv;
> +       struct device *dev = kobj_to_dev(kobj);
> +
> +       put_device(dev);
> +}


That obviously does not work as not everything in sysfs is a struct
device :(

