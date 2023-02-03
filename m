Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6AE689E57
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 16:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020DA10E093;
	Fri,  3 Feb 2023 15:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AC910E093
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 15:33:53 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B0DC890;
 Fri,  3 Feb 2023 16:33:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1675438432;
 bh=fJkl9CAORGIkT6BIuLDLkQQjolu5v1t/zilLrJLaP30=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HqtQazw4SA8pN0X8rhRqgkmYms1LGmxOCFvxtSrqNLsng7CuCXgspzf0cxDpfZT2x
 6KU1QEjZlBqGjkI9XxR/0FpkBNoIrPd4DLBw/JeDxaOrPQQdnnpGnZUSpkjma3X/TI
 6H/IEXKWyXima/RvUUMy8MKZEALHgzMTZzREkD0A=
Message-ID: <ab6f52bb-a3f5-afda-c037-f009153a0bb6@ideasonboard.com>
Date: Fri, 3 Feb 2023 17:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 3/6] drm/tidss: Add support for AM625 DSS
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230125113529.13952-1-a-bhatia1@ti.com>
 <20230125113529.13952-4-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230125113529.13952-4-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2023 13:35, Aradhya Bhatia wrote:
> Add support for the DSS controller on TI's new AM625 SoC in the tidss
> driver.
> 
> The first video port (VP0) in am625-dss can output OLDI signals through
> 2 OLDI TXes. A 3rd output port has been added with "DISPC_PORT_OLDI" bus
> type.

Not a big thing here as you add support for a new SoC, but the ordering 
of the patches is not optimal. Here you add the AM625 DSS support, but 
then you continue actually adding the DSS support (well, mainly OLDI) in 
the following patches.

I think patch 6 could be before this patch. Parts of patch 4 could also 
be before this patch. The AM65X renames from patch 5 could be before 
this patch.

I'm mainly thinking of a case where someone uses AM625 and is bisecting 
a problem. What happens if his board uses OLDI, and he happens to hit 
one of these patches during bisect? If the display just stays black, but 
otherwise everything works fine, then no problem. But if it crashes or 
starts spamming sync losts or such or gives errors, it's not so nice.

  Tomi

