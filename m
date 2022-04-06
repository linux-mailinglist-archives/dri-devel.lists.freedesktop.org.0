Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ABE4F6EEF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 02:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661DA10E0CC;
	Thu,  7 Apr 2022 00:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1006F10E0CC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 00:00:10 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D3E1183E3B;
 Thu,  7 Apr 2022 02:00:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649289608;
 bh=kqw0qCSQXO/BxGfe9asnozlpK8r+IqrAcvfPqNQ4pVo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AYv31KVXeqvXla2h3OKcLyrDEUIQ65XyrRj0TbTOrnzHsiH01zHgd08MySY+wmdTA
 HoU7MpBRpBLmtxqSxC3GPR14mI7DagWnRRO03eRgAiS6EO9eo57Qk45ZxNsmae+EkQ
 Pc5hr6F482WoFiZZPXJ6IiONh6KF2nCoIGgC/1VNydtB00GA+iGo896qwFNPEriOuV
 qMGnadfLEtiSUIV0xdfqg9H/poGgNoqJ6dF1iqhlAig804iajtol94MFc5cQAend3V
 rXMswq3ro0SGyMLC4JnbqKOXnLxmOvG2apfES2XUIQp9c3FOUmwdQ46SYK+9uqC4T6
 S0HBT4KsofS0w==
Message-ID: <d9cc8e58-7ae6-923e-fef8-34fdfe32d65d@denx.de>
Date: Thu, 7 Apr 2022 00:06:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 5/7] drm: mxsfb: Factor out mxsfb_set_mode()
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220311170601.50995-1-marex@denx.de>
 <20220311170601.50995-5-marex@denx.de>
 <840ceb028f4cb6b0a22f9fb5409bd674a849ed3c.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <840ceb028f4cb6b0a22f9fb5409bd674a849ed3c.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/6/22 21:47, Lucas Stach wrote:
> Am Freitag, dem 11.03.2022 um 18:05 +0100 schrieb Marek Vasut:
>> Pull mode registers programming from mxsfb_enable_controller() into
>> dedicated function mxsfb_set_mode(). This is a clean up. No functional
>> change.
> 
> This one however looks like over-factorization to me. Why pull out a
> mode_set function out of a mode_set function?

The entire point of this series is to clean up the mxsfb and isolate 
lcdif (the original lcdif) from any of the common code. Then I can just 
replace those functions with lcdif mx8mp variant ones in the other lcdif 
driver, while keeping the common code in sync (until deduplication happens).
