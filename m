Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF14874A85
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 10:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B47F10F331;
	Thu,  7 Mar 2024 09:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="rXx4gzSc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1171 seconds by postgrey-1.36 at gabe;
 Thu, 07 Mar 2024 08:29:09 UTC
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8E610F207
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 08:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=To:Cc:Date:Message-Id:Subject:Mime-Version:
 Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=UUbdPQi8tG7j606NaIsa+PxrC44yru1slUYi6vgAvWc=; b=rXx4gzScL9TlEerwK7bUz3UESy
 useBo4N1NgbBcwNd5D7hfZ7Si86D0TDkQqNiwHHYyl39LKz8bIM9yN0nXd+4/G8uXHg1uz/wgdzOS
 DeoImm5gEgzNKra7EkgGTWjfPzyRoVHxkhBJWDmFglObPc/5Sv6oG4tSjecoJYUTp6Nx24l8qcc0m
 wSSQalleQ6i/LsO9nfn8KatYS9I4Wj3k6o7dlSliariM9xiiDZn58FXNzohLLT/Z2YqCL1+JT02hy
 SRxQaQwvJbRs1tCppw70hMLuRxKh0Zz3M5aZ/zRpd8FXSepBi8Q8iiBP9482Ke8hAi/kcWCoRmGB5
 rXyZiTRQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1ri8oo-0008a3-Uk; Thu, 07 Mar 2024 09:09:34 +0100
Received: from [185.17.218.86] (helo=smtpclient.apple)
 by sslproxy07.your-server.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <sean@geanix.com>) id 1ri8oo-0002Bl-1T;
 Thu, 07 Mar 2024 09:09:34 +0100
From: Sean Nyekjaer <sean@geanix.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: sn65dsi83: dsi burst mode
Message-Id: <E35054BA-FBE5-4CEE-905C-1F5D20140590@geanix.com>
Date: Thu, 7 Mar 2024 09:09:23 +0100
Cc: dri-devel@lists.freedesktop.org
To: marex@denx.de, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com
X-Mailer: Apple Mail (2.3774.400.31)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27206/Wed Mar  6 10:25:15 2024)
X-Mailman-Approved-At: Thu, 07 Mar 2024 09:17:20 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

We are using the stm32mp1 together with the sn65dsi83 bridge.
The ti,sn65dsi83 driver is (hard) enabling MIPI_DSI_MODE_VIDEO_BURST, =
then the st,stm32-dsi driver is adding +20% to the clock speed.

That means our LVDS is +20% higher than expected.

Any proposals for a fix? Could we add a devicetree option to opt out of =
the burst mode?

/Sean=
