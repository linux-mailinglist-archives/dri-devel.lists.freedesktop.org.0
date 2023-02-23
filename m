Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C10C6A0B5A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 14:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7299B10E4C7;
	Thu, 23 Feb 2023 13:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A3910E4C7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 13:58:47 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 886BC496;
 Thu, 23 Feb 2023 14:58:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1677160725;
 bh=gBXGYHXhEytxkHfNGZN1xmGc9Z/trKuM5hcQ+0W8LUc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TD/XnR1//v9VChL78qIRNoOkW2nyS8VuQkRBBZWdHLIuHx0qRd0dznbcQzQTdqWhR
 xQIVvlVeuc+L3pyr7Y54ePsS9g4Vjc3Z8AkcyUMcr0kzXV1xGTVW+Imy2vldFHGUF3
 I2iDLFLrAUNq/3N25SmGq9csCAxbMw3rA3BCZhqw=
Message-ID: <78629f03-4e2e-a3bc-c9d4-7a4b73ad4551@ideasonboard.com>
Date: Thu, 23 Feb 2023 15:58:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] drm: rcar-du: Write correct values in DORCR
 reserved fields
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20230222234212.5461-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230222234212.5461-3-laurent.pinchart+renesas@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230222234212.5461-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2023 01:42, Laurent Pinchart wrote:
> The DORCR register controls the routing of clocks and data between DU
> channels within a group. For groups that contain a single channel,
> there's no routing option to control, and some fields of the register
> are then reserved. On Gen2 those reserved fields are documented as
> required to be set to 0, while on Gen3 and newer the PG1T, DK1S and PG1D
> reserved fields must be set to 1.
> 
> The DU driver initializes the DORCR register in rcar_du_group_setup(),
> where it ignores the PG1T, DK1S and PG1D, and then configures those
> fields to the correct value in rcar_du_group_set_routing(). This hasn't
> been shown to cause any issue, but prevents certifying that the driver
> complies with the documentation in safety-critical use cases.
> 
> As there is no reasonable change that the documentation will be updated
> to clarify that those reserved fields can be written to 0 temporarily
> before starting the hardware, make sure that the registers are always
> set to valid values.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/rcar-du/rcar_du_group.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

