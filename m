Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D28524B33CE
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 09:29:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECF410E37C;
	Sat, 12 Feb 2022 08:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972BA10E37C;
 Sat, 12 Feb 2022 08:29:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B1D5A60AFD;
 Sat, 12 Feb 2022 08:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AD5C340E7;
 Sat, 12 Feb 2022 08:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644654582;
 bh=y4KilKYc89ZHuBcR1jvfFk+I6XfG+CjqzU/QMhQZ+yc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b9gRUd33jl/AJjhmHvTRwaLBmckC8XgQRDibEr6ug0oIECg3KkeYKOFTPMqRSR8nD
 3e4CMbC9LD0JkGo8xuhFMvO54wXeQStWswhhgGpUIn6ksZf4/HCrf63oivlTcx6CXp
 OfltroUw3K0qSh64+8aZy6sSJxmzEOWXPyQSIPYU=
Date: Sat, 12 Feb 2022 09:29:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH] devcoredump: increase the device delete timeout to 10 mins
Message-ID: <Ygdv7wc6v90L7xSp@kroah.com>
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
 <YgZD8vPqB7ISpRpZ@kroah.com>
 <654d620b-9e14-c47f-b48c-762dc0bd32a1@quicinc.com>
 <Ygdb63FrorUsX/Hg@kroah.com>
 <b9156bde-137c-2fac-19e0-b205ab4d6016@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9156bde-137c-2fac-19e0-b205ab4d6016@quicinc.com>
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
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, johannes@sipsolutions.net,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 11:52:41PM -0800, Abhinav Kumar wrote:
> Hi Greg
> 
> On 2/11/2022 11:04 PM, Greg KH wrote:
> > On Fri, Feb 11, 2022 at 10:59:39AM -0800, Abhinav Kumar wrote:
> > > Hi Greg
> > > 
> > > Thanks for the response.
> > > 
> > > On 2/11/2022 3:09 AM, Greg KH wrote:
> > > > On Tue, Feb 08, 2022 at 11:44:32AM -0800, Abhinav Kumar wrote:
> > > > > There are cases where depending on the size of the devcoredump and the speed
> > > > > at which the usermode reads the dump, it can take longer than the current 5 mins
> > > > > timeout.
> > > > > 
> > > > > This can lead to incomplete dumps as the device is deleted once the timeout expires.
> > > > > 
> > > > > One example is below where it took 6 mins for the devcoredump to be completely read.
> > > > > 
> > > > > 04:22:24.668 23916 23994 I HWDeviceDRM::DumpDebugData: Opening /sys/class/devcoredump/devcd6/data
> > > > > 04:28:35.377 23916 23994 W HWDeviceDRM::DumpDebugData: Freeing devcoredump node
> > > > 
> > > > What makes this so slow?  Reading from the kernel shouldn't be the
> > > > limit, is it where the data is being sent to?
> > > 
> > > We are still checking this. We are seeing better read times when we bump up
> > > the thread priority of the thread which was reading this.
> > 
> > Where is the thread sending the data to?
> 
> The thread is writing the data to a file in local storage. From our
> profiling, the read is the one taking the time not the write.

The read is coming directly from memory, there should not be any
slowdown at all here.  How can that be the delay?  Have a trace
somewhere?

thanks,

greg k-h
