Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7177E7C38
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 13:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D0910E9AD;
	Fri, 10 Nov 2023 12:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297F410E951
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 09:02:05 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c5087d19a6so22694641fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 01:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flowbird.group; s=google; t=1699606924; x=1700211724;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MCXdazgSYvqPl2HnV63Ne5UUddFUVdbkuhwm7oP1KdM=;
 b=FQ3HyKfpFtAZMHItRe3zNUz9MtQegWt/HPhLCqPQWMr153Oyd9vg/cGFp+1MP2c8nh
 +9ruCHT8bkSZRVYSJYyq3sdCyNkg0Snpn5Tjf6/cWXcDwjf0rP+fyADCCtlZzs313KFf
 cguW+QlmNXmiAFs+B6azWzMDG6BVWKfnJVNzJ5F5xPens5UYIHh0qixyjfnWmzEAm2BC
 wn4/KFj8zihVvd5Wr5S2GJUB/2cinJh1Ds+b5A6+m84tpAnnh11hbT/T5KCAH5+xkZpA
 mwVTg607ceyDmRsxJS1KvrdspSKrnzsMU7VAGXVGgQqyk/gDKZhvysojoIwtFs3eDgmW
 xn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699606924; x=1700211724;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MCXdazgSYvqPl2HnV63Ne5UUddFUVdbkuhwm7oP1KdM=;
 b=kETolecED2X7jbRy8wu0fE0Piqyr4xzOn4CxZXap9fhObpCpID68St4tkrHgBoDZ3I
 n3VBJwzf5LjQQvoAlLL/PzDKyajepVWbgO23LBCpSKm6nfFlFPTMBORAY1qIqtGiXVHh
 X29XWbMSxeFg745OYM3SPS7dhM3AcuJDtBQJKiQqVYohd7N5ca0g52ZmbvBB9KIlW2Gm
 qf0MIFu3YpPrPOMkpE+Xwz7prLKhAO0KTbis7om3NHbtn/TqHRBL162mWAQNOysZ5VbO
 HqtVKmE/KCpeXaffqybZ4nJtdcOHsNYxPh4iQdEAz3AFflTDi1YcmzYlkNQUf5rCfbca
 XbsQ==
X-Gm-Message-State: AOJu0Yzug6KyChYfDBQ/FWq+SzmU/usmuxxZU7+iiYHHJixBKwDZELAS
 RY/k7ktQMnbYn7AgVQ8cwMQ/TKESMICw/UfYeFamL4i++e6ZJYjk
X-Google-Smtp-Source: AGHT+IFfofDsyg1RtDrGE4tTWIgqbBcnypxq8aG7RRGviRU9U703R0Ypia9X83RZHMIH0ZK2asM9G9+H82BfBWy+5aY=
X-Received: by 2002:a2e:9c97:0:b0:2c6:fba4:2daa with SMTP id
 x23-20020a2e9c97000000b002c6fba42daamr6424148lji.5.1699606923621; Fri, 10 Nov
 2023 01:02:03 -0800 (PST)
MIME-Version: 1.0
From: "Fuzzey, Martin" <martin.fuzzey@flowbird.group>
Date: Fri, 10 Nov 2023 10:01:52 +0100
Message-ID: <CANh8QzxddLw-vkE1n1jTAsuLO6CNO0xAJ4NoKWaQJCuYdx-fvQ@mail.gmail.com>
Subject: Design question backlight controller powered by bridge
To: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 10 Nov 2023 12:39:25 +0000
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
Reply-To: martin.fuzzey@flowbird.group
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I have a design problem I'm not sure how to solve cleanly.

I have a board using a PTN3460  eDP => LVDS bridge and a LP8556
backlight controller.
Both of these are already supported by the kernel.

The PTN3460 has an electrical output signal (PVCGEN) that is intended
to control power to the panel and goes high once valid video data is
received on the eDP link.
However on this board this signal actually switches the power to the LP8556.

The consequences of this are
* Until the video link is up it is not possible to communicate with
the LP8556 over I2C (indeed the driver fails to probe due to this)
* If the video link goes down the LP8556 loses all its state

The LP8556 can either control the backlight via I2C or by an external
PWM input signal (which is connected to the PTN3460)
So I could *mostly* solve the problem of getting a backlight control
by not using I2C communication with the LP8556 and controlling the
backlight using the PWM.
Currently the PTN3460 driver does not implement PWM control but it
would be fairly easy to add and there is already a precedent in the
parade-ps8622 driver that implements a backlight control.

However that does not solve the I2C communications issue, just avoids
the need for it for setting the backlight brightness.
So if I need to do other things with the LP8556 (like tuning the drive
strengths etc it's back to the same problem).

What seems to be needed is a way of expressing that the PTN3460
supplies power to the LP8556 but the LP8556 does not control it.
A normal regulator relationship doesn't work because there it is
expected that the consumer (LP8556) controls the regulator.

Any ideas appreciated.

Martin
