Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD144B33C7
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 09:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C368410E2B9;
	Sat, 12 Feb 2022 08:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74AA10E2B9;
 Sat, 12 Feb 2022 08:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=XH4dFPiX5OoR9zNtWoY972SsBoh28piIfTnd7x3AM1k=; 
 t=1644654300; x=1645863900; b=XQO9V+sBo1jSQSEEGvEx0PErYLBuB5MO7473fWkmhHs7EP9
 JPRLMlbcgi4WS7kgnwtH6cpxH96hHZNEcnPvjSvwn1Qzp0KuYmVN8/tQqWM10jQ/ENbz4Bb0sSmw+
 0udyP8L0c4pSHL61TkqMohUq9GE01WXMT5xHPA+FQyPgaIcatM8IWOnakub/MQ4sY9bw6C2PhckMx
 KPy3VLsrJ0nJvG8V3lcOV0yE2+I7A6babKcA2ACeLV4SYcjMM9vysPOUew9MKvdKd0Id7tHVpWN8f
 vbzkCniojVD9Gr1+8R0chYk1Dvl2gpb9PgMbUkwRrxqEomPY8R+LRRi6zyHJifJA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nIni7-000C5h-6u; Sat, 12 Feb 2022 09:24:51 +0100
Message-ID: <7db7d01fcf5a3edce61161769c0e6eb1541237bf.camel@sipsolutions.net>
Subject: Re: [PATCH] devcoredump: increase the device delete timeout to 10 mins
From: Johannes Berg <johannes@sipsolutions.net>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Greg KH
 <gregkh@linuxfoundation.org>
Date: Sat, 12 Feb 2022 09:24:50 +0100
In-Reply-To: <b9156bde-137c-2fac-19e0-b205ab4d6016@quicinc.com>
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
 <YgZD8vPqB7ISpRpZ@kroah.com>
 <654d620b-9e14-c47f-b48c-762dc0bd32a1@quicinc.com>
 <Ygdb63FrorUsX/Hg@kroah.com>
 <b9156bde-137c-2fac-19e0-b205ab4d6016@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
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
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-02-11 at 23:52 -0800, Abhinav Kumar wrote:
> 
> The thread is writing the data to a file in local storage. From our 
> profiling, the read is the one taking the time not the write.
> 

That seems kind of hard to believe, let's say it's a 4/3 split (4
minutes reading, 3 minutes writing, to make read > write as you say),
and 3MiB size, that'd mean you get 12.8KiB/sec? That seems implausibly
low, unless you're reading with really tiny buffers?

Can you strace this somehow? (with timestamp info)

> Just doubling what we have currently. I am not sure how the current 5 
> mins timeout came from.
> 

To be honest it came out of thin air, and wasn't really meant as a limit
on how fast you can read (feels like even if it's tens of MiB you should
read it in milliseconds into userspace), but more of a maximum time that
we're willing to waste kernel memory if nobody is around to read the
data.

I thought it'd be better if we could somehow pin it while the userspace
is reading it, but OTOH maybe that's actually bad, since that means
userspace (though suitably privileged) could pin this kernel memory
indefinitely.

johannes
