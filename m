Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 953664AE324
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA7F10E2F8;
	Tue,  8 Feb 2022 21:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3F810E2F8;
 Tue,  8 Feb 2022 21:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=A+S/j9icHeYwdxH49eBPZ83QO48LwLkJGGxnQOH8gC8=; 
 t=1644357283; x=1645566883; b=IxW0iB075aM0Zh09nOp2hqJvG5mpBjCibnB8Vy9w4U7dK5U
 heyd9kAbsRRb0o5zSFENUPLq8Cpd3bH5yJAT/fl8ds37N3B+sWWeQ3MWdUa0ikqOYcLS1V4RvPFPS
 Ucg+38xnDDbs2QoTFt0O6WFjuYAvz8BQGFkYLTqEQgF5vbksyhs3zNmudehdLdsLyXTFXACc3f75H
 jDD6WG0MMSdwzDrxJWMdmP/ax6ThI6QXo/HnbxZNf1qxoci04SSGwhtWaJnACVfE9TGGcMr3WXl6h
 9R1xJt9N6L53zHHPGBScEvgQOUyBacVsPI0QYLunN/+A8+dimPiKR/yOl+H5zf5A==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nHYRX-00GDjC-9O; Tue, 08 Feb 2022 22:54:35 +0100
Message-ID: <c2a6e29063793eecc5c65d32af9d826544404ecc.camel@sipsolutions.net>
Subject: Re: [PATCH] devcoredump: increase the device delete timeout to 10 mins
From: Johannes Berg <johannes@sipsolutions.net>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org
Date: Tue, 08 Feb 2022 22:54:34 +0100
In-Reply-To: <a280fec2-754a-88ec-acc7-337e069e9148@quicinc.com>
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
 <8d67484c7e4b9fb4560d2eca1f71c75fde8bae0d.camel@sipsolutions.net>
 <ebd340e4-2a02-d484-2ed0-9ee738d5b5c5@quicinc.com>
 <c59bc1af9974484075091333a3c98a2088251321.camel@sipsolutions.net>
 <a280fec2-754a-88ec-acc7-337e069e9148@quicinc.com>
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

On Tue, 2022-02-08 at 13:40 -0800, Abhinav Kumar wrote:
> > 
> I am checking what usermode sees and will get back ( I didnt see an 
> error do most likely it was EOF ). I didnt follow the second part.

I think probably it got -ENODEV, looking at kernfs_file_read_iter().

> If the file descriptor read returns EOF, even if we consider them 
> separate how will it resolve this issue?
> 
> My earlier questions were related to fixing it in devcoredump to detect
> and fix it there. Are you suggesting to fix in usermode instead? How?
> 

Yeah, no, you cannot fix it in userspace.

But I just followed the rabbit hole down kernfs and all, and it looks
like indeed the read would be cut short with -ENODEV, sorry.

It doesn't look like there's good API for this, but it seems at least
from the underlying kernfs POV it should be possible to get_device() in
open and put_device() in release, so that the device sticks around while
somebody has the file open? It's entirely virtual, so this should be OK?

johannes
