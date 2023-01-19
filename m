Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21560673235
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 08:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A15A10E8B4;
	Thu, 19 Jan 2023 07:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [46.30.211.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADDC10E8B4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 07:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=RlajkAGLHHL3Oe4E2DuduVY0n/IKsX1RAqtwIkCDmfs=;
 b=Oasw9Ofl5K3CXDRcsiUEVUXL46ciEzVqtrAzQg4ErwlcxEwGcUIll/oFC9kMNlK7m/dwZM9HjTpJ2
 qEcsDfc49zG3uy1QOAJs0DUMrI3jqkomnjXtEy2WIIUh+0jWaSu30eS52t4wodqECnDOopdOyQgwvJ
 730Cz+7XQfVzu5Z23oQle+HgGHSnKAkVNfipzu6/jNoeGdpBeicnaX4/DUc+tKahiFkWmSApErmXna
 9wdJautTQlFSDI6XIXKeRAku7Dmmt385chGzhNRUqIi7vfFok3nSkOa1CxiA9rVuTrc1UjnOLOO02s
 PJKel5lFbS9xWpLDQFcVNotkDNP9zEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=RlajkAGLHHL3Oe4E2DuduVY0n/IKsX1RAqtwIkCDmfs=;
 b=NUSB8JZedqrcI0kjtit1ygo0qCxpxVUoHhaz+KLztMHdfl41rU6XEhW+XvimamGFIAKqEZjiv9lHJ
 WZMN2mbDA==
X-HalOne-ID: d884b2c6-97c8-11ed-9cfc-11abd97b9443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id d884b2c6-97c8-11ed-9cfc-11abd97b9443;
 Thu, 19 Jan 2023 07:14:03 +0000 (UTC)
Date: Thu, 19 Jan 2023 08:14:01 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Richard Acayan <mailingradian@gmail.com>
Subject: Re: [RFC PATCH v3 0/3] drm/mipi-dsi: 16-bit Brightness Endianness Fix
Message-ID: <Y8jtucG3MMk8Oqk8@ravnborg.org>
References: <20230116224909.23884-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116224909.23884-1-mailingradian@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Caleb Connolly <caleb@connolly.tech>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Vinay Simha BN <simhavcs@gmail.com>, Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Richard.
On Mon, Jan 16, 2023 at 05:49:06PM -0500, Richard Acayan wrote:
> Changes since v2 (20230114010006.50471-1-mailingradian@gmail.com):
>  - patch vtdr6130 to use _large (3/3)
>  - remove Change-Id again (1/3)
>  - change patch subject (1-2/3)
>  - correct function name in patch description (2/3)
>  - add Tested-by tags (1-2/3)
> 
> Changes since v1 (20230113041848.200704-1-mailingradian@gmail.com):
>  - move 16-bit brightness handling to new functions and revert API
>    change (1/2)
>  - remove Change-Id in compliance with checkpatch.pl (1/2)
>  - separate panel driver changes (2/2)
> 
> This series adds proper support for 16-bit MIPI DSI brightness and
> cleans up existing panel drivers with 16-bit brightness.

The series is:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Neil - I hope you can land this in drm-misc.

	Sam
