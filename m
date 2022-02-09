Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C9F4AEB6D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 08:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8808810E3C9;
	Wed,  9 Feb 2022 07:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F5310E16E;
 Wed,  9 Feb 2022 07:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=ddsD2phgZUdtg2qpp+HrVXJ99MqUCSgUVEdA7iCALpQ=; 
 t=1644393032; x=1645602632; b=NjphsG/TRAggz67Or2tYC/kX+989K0zz6WLkm45iS3JBdtV
 JL2nALHlNst03daZuMw7V4Kf6ODpnm0005+ytD2SI8Yg0TkVTKUbsHvWX6kyza64nnD+0dsiOOv4V
 XK0WcHs9HrARMKsMPaObBF+4MB+fvPCJB6frl/jKulV1RCC3soB+u+kDtRaesqVUy3ey+MyFWslE7
 rJuv4deAmvuQZ9cTRZ9t2r3Fl/sbAq+BGnB5sx3B+3iZmBP8B31CYMBDlQIr7ZDZq+ujy4PEG4zzH
 vTt91z8Jh1BrM+CB3cNyQ2jFnyYOXjpXXF91+FYtcspoD1CjyItwo5YuN28H8Irw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nHhk5-00GWm6-2O; Wed, 09 Feb 2022 08:50:21 +0100
Message-ID: <2d71a9c0d2cd0b0c82a627b0585040c81a4523fa.camel@sipsolutions.net>
Subject: Re: [PATCH] devcoredump: increase the device delete timeout to 10 mins
From: Johannes Berg <johannes@sipsolutions.net>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org
Date: Wed, 09 Feb 2022 08:50:19 +0100
In-Reply-To: <b60d30cf-e435-49c4-a251-b910bc2e94ae@quicinc.com>
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
 <8d67484c7e4b9fb4560d2eca1f71c75fde8bae0d.camel@sipsolutions.net>
 <ebd340e4-2a02-d484-2ed0-9ee738d5b5c5@quicinc.com>
 <c59bc1af9974484075091333a3c98a2088251321.camel@sipsolutions.net>
 <a280fec2-754a-88ec-acc7-337e069e9148@quicinc.com>
 <c2a6e29063793eecc5c65d32af9d826544404ecc.camel@sipsolutions.net>
 <b60d30cf-e435-49c4-a251-b910bc2e94ae@quicinc.com>
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

On Tue, 2022-02-08 at 17:55 -0800, Abhinav Kumar wrote:
> 
> Are you suggesting something like below?
> 
> diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> index 42dcf96..14203d0 100644
> --- a/fs/sysfs/file.c
> 

No, for sure not, but I guess from the looks of this patch there's no
way to do something like that for just an individual attribute...

Oh well.

johannes
