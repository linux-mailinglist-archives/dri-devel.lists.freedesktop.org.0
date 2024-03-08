Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B2E875FA0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 09:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3231611344E;
	Fri,  8 Mar 2024 08:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="Dqj2kPWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDFE11344E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 08:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=To:Cc:Date:Message-Id:Subject:Mime-Version:
 Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=EO0ldGpg9O+GJgqLq48vxSR6sHl0Gsnt3qgnSOjRNcw=; b=Dqj2kPWH+1uvSc3F08BZqW7Iwt
 eSSXbNkzmmFxNkDeLkZ0MX/88B1HHt5tQ5RNdWdn9FgNJ1piKAttxtCotKcI8SHXbt/Dj2wAlUvd7
 gzAlxP5Xkq28g/XsH/uSphzF/yM3GeUZujirRONm9Oj6q/s7pCTQV3P16f9SeKhalBkO7+vYYL6OY
 qS8BFuE4d9fxfPJmYSpy6t6TWKFRT7sxLALV9zc/n56NDl0J2ABZTFNIqWTQW20ZsqP3ddsOsolM6
 ytrc9s3zfn+5wCcVkt1XlXmcr1lwtBP5s0pgKnnhfBlMUjzQ7xZnCBsbaW/xnINF3CFs2uaDaUzfr
 Du4BJaSA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1riVhb-000Ion-1k; Fri, 08 Mar 2024 09:35:39 +0100
Received: from [2a06:4004:10df:0:a93a:6c75:8ef3:361d] (helo=smtpclient.apple)
 by sslproxy04.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <sean@geanix.com>)
 id 1riVha-000Htc-Iu; Fri, 08 Mar 2024 09:35:38 +0100
From: Sean Nyekjaer <sean@geanix.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: STM32 DSI controller driver: mode_valid clock tolerance
Message-Id: <4A53A669-C3AF-4D29-B5A5-0F7FEBA79045@geanix.com>
Date: Fri, 8 Mar 2024 09:35:27 +0100
Cc: =?utf-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
To: yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: Apple Mail (2.3774.400.31)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27207/Thu Mar  7 10:27:12 2024)
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

I=E2=80=99m using a stm32mp157 with a sn65dsi83 DSI2LVDS bridge.
The LVDS display is having a minimum clock of 25.2 MHz, typical of 27,2 =
MHz and a max of 30,5 MHz.

I will fail the mode_valid check with MODE_CLOCK_RANGE.
It will request 27200000 Hz, but is getting 27250000. Guess the display =
is fine with this :)

In this case it seems a bit harsh to fail if the output clock isn=E2=80=99=
t within 50 Hz of the requested clock.

If HDMI is requiring a tolerance of 50 Hz, would it be better to do the =
check in the HDMI bridge driver?

/Sean=
