Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C94981BBE02
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBF06E3E5;
	Tue, 28 Apr 2020 12:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275226E120
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 23:58:25 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id r16so15086890edw.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 16:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=iKafzK1KWKY3gjFwQlfSWX5DiBzI9kQ0okAq6MCAjd4=;
 b=qRwb1MIxtEl/jqzf6/X/fGHx99pXTpWDRIVQqZKKHw0mT4vEDaByrnrROFJ2FC6EoG
 96+zZgfUwQLnhdMEvL9/taB00BWFe2aKHfsWdiV7iOsfRRwTf81KHVhvfd1T91D/sZdE
 Pc8iUaLCwRK7QR6DFxNiIN6UMXawHyEtI4d8hSnafHhPSp2VqAotw0MEAKJsBRJ7qukS
 2B52SzQNLzFyvTxc9bRNFIswpGhBERNWKwHeGGVj88XXZ1v/qPeeP+xWknesbsdEvmz/
 TSnOz1E/u7mP1sFPOEwXTuQURH7KqKc9evBzKtSXWb7U7+Bj5YUa3eR4ZNVt6bRCwZZY
 cShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=iKafzK1KWKY3gjFwQlfSWX5DiBzI9kQ0okAq6MCAjd4=;
 b=AYKppp6xcBXOti9J5blGf8+KRIQWx+Q6pmd7M6iOQBErJQ3PBjisT1X0OlHMAzfDp/
 r5PXKLJuo2ZdO6Czs9SaD6Edz2s5Qm/9kuVpVnc/ec5xoLc2jWuhce3qhc44GNmLlg4s
 PKUKZlrzUoKytCU89FDzWcvM1lbJ+gMTEtO7I1QqcZ5HNrI9PIvwuiMPXoSfZhKDcjt0
 Hoc0QIXvT+w5NcvaPZ9rZcRSllgX8UL8ZA7SGPeEyy8VlUt9Vcknui7HrSVpuNcSVWUY
 7jlhpWCC4NYDwBbx+twY6Vqvnxrc6pezvhT5HvdB3j5NvBjuyqrxeg/uN8lRNGbhTD9d
 uw7w==
X-Gm-Message-State: AGi0PuaKBzGD0XD0U9uGKDNJnbzK8dxsLjZe/g5fbdP903btLy7+1juZ
 HDF/UiIW8bnTo49HpX4mHPt4lH8o0pSfQSD69zkwlE84hQU=
X-Google-Smtp-Source: APiQypJXncjHqlqAomgqnWkds8Gz6oY2AK2fVOOeNcT03arT3SeW1+rbe5TsLgH5rtn4dHPWVr02iYYE7AfdxyKR96A=
X-Received: by 2002:aa7:c608:: with SMTP id h8mr21261393edq.232.1588031903332; 
 Mon, 27 Apr 2020 16:58:23 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?David_Santamar=C3=ADa_Rogado?= <howl.nsp@gmail.com>
Date: Tue, 28 Apr 2020 01:58:11 +0200
Message-ID: <CAD4j4=CYvr8nAZ8H4U=-XP125oOWJdO1bsxdsYpoJya0RrtB6Q@mail.gmail.com>
Subject: Linux GOP initialization is wrong
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, 
 Hans de Goede <hdegoede@redhat.com>
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is related to the issues at least on some devices for panel
orientation quirks where added.

My tests have been done over a Lenovo ideapad D330.

This devices like the other ones that need panel orientation quirks,
shows the initramfs with wrong stride and x and y swapped. By applying
the panel orientation quirks this gets solved but many parts of the
systems components needs to be patched. Hans has done a great job with
plymouth, mutter... but always appears a new problem derived as for
example vnc desktop sharing with this devices doesn't work and the
output is send messed up.

The strange thing is that bootloaders like GRUB or rEFInd seems to be
able to handle this and they paint themselves right, despite when
booting Windows directly Windows paints itself right and booted with
GRUB or rEFInd the first second also paint itself wrong. Haven't
tested this too much but the interesting thing is in the next
paragraph.

I decided to get the UEFI GOP video modes and found that the D330 have
these ones:
Mode 0: 1200x1920
Mode 1: 640x480
Mode 2: 800x600
Mode 3: 1024x768
Mode 4: 1920x1200 (this is the default one started by the firmware)
Mode 5: 480x640
Mode 6: 600x800
Mode 7: 768x1024

So I thought that Linux is taking the first mode despite is not the
active one and that's why the display is messed up.

Playing a little I could modify the GOP video mode before booting with
the UEFI Shell by simple using the mode 150 101. This causes GOP video
mode 5 to be switched to video mode 0, the first one. Booting now
makes initramfs messages to be correctly rendered but in the wrong
orientation.

A look at drivers/firmware/efi/libstub/gop.c seems to be what is
happening, the first available video mode is used despite it could not
be the active one in GOP and the active mode is not switched to the
discovered one by Linux. Both GRUB and rEFInd are able to respect the
video mode that GOP has active so it's possible to boot them landscape
and portrait while being correctly rendered.

I think the video mode should not be the first discovered one but the
active one, or at least, the highest resolution video mode that
respects the orientation.

I still have to test what Windows do if I try to boot it with the
video mode 0 active instead the default firmware mode 5, but I guess
it just select the highest resolution available where the x > y, and I
don't think this is the perfect approach, if some manufacturer wants
to make a portrait booting device it only will be possible by
respecting when the resolution is portrait or landscape while
searching the highest of them.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
