Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16AA8C214B
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 11:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4293A10E7D3;
	Fri, 10 May 2024 09:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q0dgsQ8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5D210E7D3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 09:49:52 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51fc01b6fe7so1875119e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715334591; x=1715939391; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8kejXjU7NtMflI94b0gV8g2qi50Wy/WZEOfDbw8gB8k=;
 b=Q0dgsQ8FB1U5JFMbxOp5c4MtO5zR2l4lorloowrBarmpBY3CAIL49Ls3CxQU4H7BO2
 eCgIayFOf4ZuX5T5A9ozOZLlXT8cpPtygFst9oaeDms/5e8n2HgkficTJs4JLORPU7qP
 VI07pjqH+1/96Popp8Awd3+0BhU2/tOYH+V2/fmXsVV8N9ZxYjqUliqpUgTDozQPp8Lx
 btPiEc1vyvcU1Ad5aoKclC9zSfUkUg/azjzJBlr4XM16au/UnBQCyTI4Uq9QsZPtFnn2
 IQ5NSR88SIpUnri4G0oMTZRGeE0GCDDds4bAqlBu/8OUBeObGegYZv8IxGZMgx3oql9T
 3KpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715334591; x=1715939391;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8kejXjU7NtMflI94b0gV8g2qi50Wy/WZEOfDbw8gB8k=;
 b=O+2E34flh3GbpgbRJoNh4tjv4bFG0P1Ni45qZWH41VkFaUqY7CGuUfn5EhoUDzYvii
 5AYHYEAh+Y7ONeJH2YxnZjMjDfkvQ4YHZmkrssuwMlzNHCZpgB7QUuQK2aDA6JrwZIjw
 qx1RTI5TY0OBQUfvzPDKGIfDIUIfgI0dhDgtsOJ2TYFawkndxrm0Bpj4GWxFL4kb+/Ab
 s7nDNFGVerr+fWWzuNAWy2Kz45nYu7D8Ksd2zHIl4vpx3CPE5sy4cCATHd86d+qhGqQ4
 BDvoMbS37bJ2Sy4S36PVttL6RFDb7vQWXr4PIN3utRJJ1lH8/wldqUcd4Z9q2RYHpjL6
 HJ5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4mydXNqCnHN0W1rSJd8BgBsrEeku5/swWmOS+LrneRs9qIhayalb8t9yJ0/q2wewZUzO4bpEsBHlKXqp5pbt94h/t4CLGxhn0KWvZWVmB
X-Gm-Message-State: AOJu0YxlodG21LmobnO3WE5AjKoCvyUouwwhbCi3GO+HMy9lXNGez5y3
 G7Y9ZzJFNMN3rJbOZOBFjGzgYFiSkGViJbPW3kmgNDIo/RT5QOpt
X-Google-Smtp-Source: AGHT+IHcw5DK2C4vIz7qxBseM/a5qW4yMYfhNGT4GIOurqe51vwjmKCreziJLPrH7cRBtQ3dsqL5YA==
X-Received: by 2002:a05:6512:230a:b0:51c:c2c1:6f58 with SMTP id
 2adb3069b0e04-522105792e0mr1540231e87.55.1715334590298; 
 Fri, 10 May 2024 02:49:50 -0700 (PDT)
Received: from gmail.com (host-90-235-80-216.mobileonline.telia.com.
 [90.235.80.216]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d8af5sm626396e87.234.2024.05.10.02.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 02:49:49 -0700 (PDT)
Date: Fri, 10 May 2024 11:49:48 +0200
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: nerdopolis <bluescreen_avenger@verizon.net>,
 dri-devel@lists.freedesktop.org
Subject: Re: simpledrm, running display servers, and drivers replacing
 simpledrm while the display server is running
Message-ID: <Zj3tvKayXdn2_JMq@gmail.com>
References: <9215788.EvYhyI6sBW.ref@nerdopolis2>
 <9215788.EvYhyI6sBW@nerdopolis2>
 <d8822317-db81-4179-93b8-18629a95af73@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8822317-db81-4179-93b8-18629a95af73@suse.de>
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

On Fri, May 10, 2024 at 09:32:02AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.05.24 um 15:06 schrieb nerdopolis:
> > 
> > Hi
> > 
> > 
> > So I have been made aware of an apparent race condition of some drivers
> > taking a bit longer to load, which could lead to a possible race
> > condition of display servers/greeters using the simpledrm device, and
> > then experiencing problems once the real driver loads, the simpledrm
> > device that the display servers are using as their primary GPU goes
> > away.
> > 
> > 
> > For example Weston crashes, Xorg crashes, wlroots seems to stay running,
> > but doesn't draw anything on the screen, kwin aborts,
> > 
> > This is if you boot on a QEMU machine with the virtio card, with
> > modprobe.blacklist=virtio_gpu, and then, when the display server is
> > running, run sudo modprobe virtio-gpu
> > 
> > 
> > Namely, it's been recently reported here:
> > https://github.com/sddm/sddm/issues/1917 and here
> > https://github.com/systemd/systemd/issues/32509
> > 
> > 
> > My thinking: Instead of simpledrm's /dev/dri/card0 device going away
> > when the real driver loads, is it possible for simpledrm to instead
> > simulate an unplug of the fake display/CRTC?
> > 
> 
> To my knowledge, there's no hotplugging for CRTCs.
> 
> > That way in theory, the simpledrm device will now be useless for drawing
> > for drawing to the screen at that point, since the real driver is now
> > taken over, but this way here, at least the display server doesn't lose
> > its handles to the /dev/dri/card0 device, (and then maybe only remove
> > itself once the final handle to it closes?)
> > 
> > 
> > Is something like this possible to do with the way simpledrm works with
> > the low level video memory? Or is this not possible?
> > 
> 
> Userspace needs to be prepared that graphics devices can do hotplugging. The
> correct solution is to make compositors work without graphics devices.

(This was discussed on #dri-devel, but I'll reiterate here as well).

There are two problems at hand; one is the race condition during boot
when the login screen (or whatever display server appears first) is
launched with simpledrm, only some moments later having the real GPU
driver appear.

The other is general purpose GPU hotplugging, including the unplugging
the GPU decided by the compositor to be the primary one.

The latter is something that should be handled in userspace, by
compositors, etc, I agree.

The former, however, is not properly solved by userspace learning how to
deal with primary GPU unplugging and switching to using a real GPU
driver, as it'd break the booting and login experience.

When it works, i.e. the race condition is not hit, is this:

 * System boots
 * Plymouth shows a "splash" screen
 * The login screen display server is launched with the real GPU driver
 * The login screen interface is smoothly animating using hardware
   accelerating, presenting "advanced" graphical content depending on
   hardware capabilities (e.g. high color bit depth, HDR, and so on)

If the race condition is hit, with a compositor supporting primary GPU
hotplugging, it'll work like this:

 * System boots
 * Plymouth shows a "splash" screen
 * The login screen display server is launched with simpledrm
 * Due to using simpldrm, the login screen interface is not animated and
   just plops up, and no "advanced" graphical content is enabled due to
   apparent missing hardware capabilities
 * The real GPU driver appears, the login screen now starts to become
   animated, and may suddenly change appearance due to capabilties
   having changed

Thus, by just supporting hotplugging the primary GPU in userspace, we'll
still end up with a glitchy boot experience, and it forces userspace to
add things like sleep(10) to work around this.

In other words, fixing userspace is *not* a correct solution to the
problem, it's a work around (albeit a behaivor we want for other
reasons) for the race condition.

Arguably, the only place a more educated guess about whether to wait or
not, and if so how long, is the kernel.


Jonas

> 
> The next best solution is to keep the final DRM device open until a new one
> shows up. All DRM graphics drivers with hotplugging support are required to
> accept commands after their hardware has been unplugged. They simply won't
> display anything.
> 
> Best regards
> Thomas
> 
> 
> > 
> > Thanks
> > 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 
