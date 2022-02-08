Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D06F4AE2D1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AE810E21C;
	Tue,  8 Feb 2022 21:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1948 seconds by postgrey-1.36 at gabe;
 Tue, 08 Feb 2022 21:07:51 UTC
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F237310E21C;
 Tue,  8 Feb 2022 21:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=jFMUOxkl3kB2j+Wo2GSKdxNzPGRMQ7XpF5gBMuNYOTk=; 
 t=1644354471; x=1645564071; b=fBdFWbFpgZ9GRkbaXJVYBWZHzLRG/10dbETiZ9c9rvvKBk7
 0VP3LBcpjeKF0cMnwrOfxbhxum/s2XovdGOPu2cPktXdvubq+CmBiLoeixQj3bvCVRkp8tga+00AX
 5naSh+uSQzg9fM9i18xAK2McRMKykQUVWq9MBYNAV+2ihAj3SZewAuM6/vSukZUxq0Dr8m1vY9kb3
 IFEoCG23b1os3q1NnmINrFpZqpL9h8uApReK1QH0igFVm023NM8kFDG3o03J9Dbj1WKZADu6XhK2K
 9TV99bmwBcUQ3BH1L7uUOmomCzqA/hAtB6F1frL3ZvEGegyRy1c0RmnH+gb53adw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nHXCj-00GB3n-Oo; Tue, 08 Feb 2022 21:35:13 +0100
Message-ID: <8d67484c7e4b9fb4560d2eca1f71c75fde8bae0d.camel@sipsolutions.net>
Subject: Re: [PATCH] devcoredump: increase the device delete timeout to 10 mins
From: Johannes Berg <johannes@sipsolutions.net>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org
Date: Tue, 08 Feb 2022 21:35:11 +0100
In-Reply-To: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
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
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, khsieh@codeaurora.org,
 nganji@codeaurora.org, seanpaul@chromium.org, gregkh@linuxfoundation.org,
 dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-02-08 at 11:44 -0800, Abhinav Kumar wrote:
> There are cases where depending on the size of the devcoredump and the speed
> at which the usermode reads the dump, it can take longer than the current 5 mins
> timeout.
> 
> This can lead to incomplete dumps as the device is deleted once the timeout expires.
> 
> One example is below where it took 6 mins for the devcoredump to be completely read.
> 
> 04:22:24.668 23916 23994 I HWDeviceDRM::DumpDebugData: Opening /sys/class/devcoredump/devcd6/data
> 04:28:35.377 23916 23994 W HWDeviceDRM::DumpDebugData: Freeing devcoredump node
> 
> Increase the timeout to 10 mins to accommodate system delays and large coredump
> sizes.
> 

No real objection, I guess, but can the data actually disappear *while*
the sysfs file is open?!

Or did it take 5 minutes to open the file?

If the former, maybe we should fix that too (or instead)?

johannes
