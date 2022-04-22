Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7875950BFE1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 20:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425D610E5C7;
	Fri, 22 Apr 2022 18:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8932310E5C4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 18:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=ifYueXE1Rt7TUAHo5Ea+p9vQL6CvB8q5glESMyP1yQo=;
 b=iLQa3GjtybkoSYsHY83kLaoCm5p9wYigIZbkuFbtfLZdzrqpEiYv7V9I3oMQVmgQBa5xV0yka9tPE
 s5KLFNmTFj+PhSTSzVwemyKgfaJ0IxLg2IMxvkjl5ZShU8tPtA0c5bVonk8JPTV6uXDT5mB1whnLp6
 WFz5bd9j9SY28KHBXF93UQHk1g3AfZuWDNesvVkccK9Q9viNNZRg+0QXGfhgP5s8bXgR1l+PL9+zmW
 peoZVbVMZWe73EDMw1V9lJLHJwV/yrP6DLZAp3WYFU9pZFDUr/GvZhfgh+/H2BB9QiOEkj2Q4/gUqb
 zXVQzVlY3J/GaRvCEW5ntw7j5fqD8Gw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=ifYueXE1Rt7TUAHo5Ea+p9vQL6CvB8q5glESMyP1yQo=;
 b=RCuhFNyJiViM88bOpgBBlmULbDIRvJc/ZSt+vJuXVRxZ0tSdkffOCBhUxnz87BrDHIwvVpI3is2HX
 H9VpVdCDA==
X-HalOne-Cookie: 7ce01dd846091c9762b9a0cf8c39d044bb6709e9
X-HalOne-ID: 85c511da-c26b-11ec-be69-d0431ea8bb03
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 85c511da-c26b-11ec-be69-d0431ea8bb03;
 Fri, 22 Apr 2022 18:39:20 +0000 (UTC)
Date: Fri, 22 Apr 2022 20:39:18 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v3 1/4] drm: mxsfb: Wrap FIFO reset and comments into
 mxsfb_reset_block()
Message-ID: <YmL2Vmpq1FhZDaV4@ravnborg.org>
References: <20220417020800.336675-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220417020800.336675-1-marex@denx.de>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 17, 2022 at 04:07:57AM +0200, Marek Vasut wrote:
> Wrap FIFO reset and comments into mxsfb_reset_block(), this is a clean up.
> No functional change.
> 
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
