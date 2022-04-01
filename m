Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 036714EFBB4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 22:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D7610E0B5;
	Fri,  1 Apr 2022 20:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751F610E0B5
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 20:36:34 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 23BE68428C;
 Fri,  1 Apr 2022 22:36:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648845392;
 bh=i+KWy4qDX7bCrAOl/rOMbkxLO75xz0UBbrARoMX7Bnc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HixoDvQhlon5d0o/HXLD2rIa+0Cuasp7O6XdeznZBkIO0OgECl2XEvC/Zyel2TPl+
 vF5a775S/3iC1zZSIUZrzs6dVnbuJuyyb3amsGJRyP1EJyUSSOAthQHT+7gvki0VvC
 kWdiVyP5+ikgQwnQkfRoxVlYNHg3EOKOkg4NN2frAyJ4vGkJV+Wz9Zu2hcNcRC29tA
 tJvrGmW0qIxXhnjYAH+J2rQV7suupPDM99pGUsoYDqP9VrWz9OI9D2JtIV4PtcwYfh
 ehX5fCTU9gghGPAlArUOKJo6QoK7vdpJixO5ac6MOz8Md0l+GM3w+mijpCWlQBdy0O
 DeInkcCRb9+Cg==
Message-ID: <efaa195a-bbdc-ca24-eccc-271995dfd27f@denx.de>
Date: Fri, 1 Apr 2022 22:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC][PATCH 2/3] drm/modes: Make width-mm/height-mm mandatory in
 of_get_drm_panel_display_mode()
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220401163755.302548-1-marex@denx.de>
 <20220401163755.302548-2-marex@denx.de>
 <YkdImJRIRkaqeGDl@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YkdImJRIRkaqeGDl@pendragon.ideasonboard.com>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 robert.foss@linaro.org, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <digetx@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/1/22 20:46, Laurent Pinchart wrote:

Hi,

> On Fri, Apr 01, 2022 at 06:37:54PM +0200, Marek Vasut wrote:
>> Make the width-mm/height-mm panel properties mandatory in
>> of_get_drm_panel_display_mode(), print error message and
>> return -ve in case these DT properties are not present.
>> This is needed to correctly report panel dimensions.
> 
> Can we guarantee this won't cause a regression ?

For the upstream DTs, I think we can.
For downstream DTs, we cannot know.
