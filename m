Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFC74E9C5C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 18:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A55A10E70E;
	Mon, 28 Mar 2022 16:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from steinadler.informatik.uni-kiel.de
 (steinadler.informatik.uni-kiel.de [134.245.248.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8D710E70E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 16:36:20 +0000 (UTC)
Received: from turmfalke.informatik.uni-kiel.de
 (turmfalke.informatik.uni-kiel.de [134.245.248.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by steinadler.informatik.uni-kiel.de (Postfix) with ESMTPS id 5CB8C23849;
 Mon, 28 Mar 2022 18:36:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=informatik.uni-kiel.de; s=ifi-20210612; t=1648485377;
 bh=WUtLbL1FZEIs5EYA1Dy4bN8TnSIoaHzLSnp3RlXqifA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=AhyDu7luZPMAdp9M86PkFVffZnclfCbS5FeU00jQaTJdO4GJBqDhfks3LivkUPYWf
 8hOrPFSDNGF+nFIUdbWwi3miDqLMA4MkIk1yjAvxWoQKiOSyjqjuiDG8o6Cz83lNeX
 Uqo8zOwMYQ20uU3x/B5anvJG3Ye5hM873rQS4CuV5ij921JkFd3Cixn98rSUqqlO+N
 uN+WYtTAO+PA3P+ctMSo2mMEHN90v/nb3L/tYgNJ0M2AXcTCfDKw+4/34V3Y6ZonBf
 M1qUkLfC4Yf0NX5LDBe3mN1AiiR9Ik3Am6jUtmjQFxhmsYrPXtjW6q5XWsycW48inD
 wsvuGAxKF7Mww==
Received: from localhost (p54ad5b1d.dip0.t-ipconnect.de [84.173.91.29])
 (authenticated bits=0)
 by turmfalke.informatik.uni-kiel.de (8.17.1/8.16.1) with ESMTPSA id
 22SGaEq9084264
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 28 Mar 2022 18:36:17 +0200 (CEST)
 (envelope-from psi@informatik.uni-kiel.de)
X-Authentication-Warning: turmfalke.informatik.uni-kiel.de: Host
 p54ad5b1d.dip0.t-ipconnect.de [84.173.91.29] claimed to be localhost
From: Philipp Sieweck <psi@informatik.uni-kiel.de>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH] drm/vmwgfx: Propagate error on failed ioctl
In-Reply-To: <b9922ee93a6561212c956ea4acb391183f71b75b.camel@vmware.com>
References: <20220313050655.52199-1-psi@informatik.uni-kiel.de>
 <b9922ee93a6561212c956ea4acb391183f71b75b.camel@vmware.com>
Date: Mon, 28 Mar 2022 18:36:14 +0200
Message-ID: <87sfr2hw5d.fsf@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zack!

>
> I'd just break apart the condition above rather than have two if ret !=
> 0. What apps do you see glitches in as a result of this? Can you
> reproduce it?
>

There are many apps I can use to trigger this drm error. It occurs more
often on a Wayland-based desktop than on X11. While looking into this,
the most reliable way to trigger it was to open the "About" dialog
window in KeePassXC, then to select the contributors tab, and then to
scroll a bit. The content of the scrolling area is often only partially
updated, which makes the text unreadable.

I tested this on a Windows 10 host with an Intel Iris GPU running the
latest VMware Workstation 16.2. The virtual machine contains a current
Manjaro Linux GNOME desktop with Wayland enabled. 3d acceleration is
active. However, this behavior has been there for quite some time, but
for some reason it is more disruptive today.

Philipp
