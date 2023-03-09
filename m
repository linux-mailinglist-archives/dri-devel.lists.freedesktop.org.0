Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1266B1FF7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 10:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFE110E7C4;
	Thu,  9 Mar 2023 09:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC64410E7C4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 09:26:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE6A5589;
 Thu,  9 Mar 2023 10:26:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1678354004;
 bh=985r8IrokRF8amPQ6ZhYBq5GHVrxwHEK3rPc1CLk8JQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hYKR2646XK6LX7lKXgP/Xm8sIkfzIq+oALiZHzh0WLFG4BtfOijbBEgITrR8+FswQ
 okl5Wnq1UteTzxOvoQ/B0CaX52fxVFZPo4IJZWZEeCtRm72JPtiiLAFYMGz9aP+teR
 r+gP22YF88zE3CR+7vTN8CbVLxzn5dzeigvkZRGs=
Date: Thu, 9 Mar 2023 11:26:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Binderman <dcb314@hotmail.com>
Subject: Re: drivers/gpu/drm/bridge/fsl-ldb.c:101: possible loss of
 information.
Message-ID: <20230309092647.GM31765@pendragon.ideasonboard.com>
References: <DB6P189MB0568FCA97758B820EAC036989CB79@DB6P189MB0568.EURP189.PROD.OUTLOOK.COM>
 <20230308232224.GG31765@pendragon.ideasonboard.com>
 <DB6P189MB056810B266B656706ECF7EAB9CB59@DB6P189MB0568.EURP189.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DB6P189MB056810B266B656706ECF7EAB9CB59@DB6P189MB0568.EURP189.PROD.OUTLOOK.COM>
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David,

On Thu, Mar 09, 2023 at 07:59:34AM +0000, David Binderman wrote:
> Hello there Laurent,
> 
> >We could, but I don't think it will make any difference in practice as
> >the maximum pixel clock frequency supported by the SoC is 80MHz (per
> >LVDS channel). That would result in a 560MHz frequency returned by this
> >function, well below the 31 bits limit.
> 
> Thanks for your explanation. I have a couple of suggestions for possible improvements:
> 
> 1. Your explanatory text in a comment nearby. This helps all readers of the code.
> 
> 2. Might the frequency go up to 300 MHz anytime soon ? The code will stop working then. 
> In this case, I would suggest to put in a run time sanity check to make sure no 31 bit overflow. 

As it's a hardware limit of the SoC, I wouldn't expect so.

This being said, I think adding a UL suffix to the constants would be
better than a comment as it will please static checkers and serve as
documentation to humans. Would you be able to send a patch to fix this ?

> Just a couple of ideas for the code.

Thanks for taking the time to share those.

-- 
Regards,

Laurent Pinchart
