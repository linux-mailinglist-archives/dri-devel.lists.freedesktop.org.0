Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7688512E1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 13:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E50F10EB95;
	Mon, 12 Feb 2024 12:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE3510EB95
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 12:02:02 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-363d6348a07so27207715ab.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 04:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707739322; x=1708344122;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NLUFqJUUCUHl1oVTrSfdDrjpp0Ws316qkyNpeMA1VKE=;
 b=IiL1RDEd3mNhWUw+8wqlroJVYwmg0OmXwk6ubzAl2z4+BnVrlvOoJt4Tt7NBS5dPmB
 MD3HnaxSd5tSqduIRjoU4sKpOAOW/xckmwj0uMz77OquSMTT1i6efWY5ISrIMBya5VJU
 zxP+hYf9viSnom4lrcFnnphKDn7Dy1W0PPoaCAqKCw64lb8uSP68BnFFZGOt3sa+TkfX
 f35t7XbYl3DHi2aS5BhzBLrKEo1SBRcDGMtmTdq1KPWmcHWKCqCU139sMedVEl4LWF0d
 OmHzdfgQ+ijmw7uMBjHQYSi6MptArIta4fAMQOIsBXZeVfRg8Y6soOmdFsAlNTf1zWsT
 XuNg==
X-Gm-Message-State: AOJu0YwCOwikLLldbA0/OgZSdLN7zjAbdFXP+RlhgDsk5MvnyQ6MURs1
 Y6cem5mloTTl5Q39qY0Qsm7os4MzKICj/k+/Fz93/cd490qNGXa02LedEnfOF1TnTFANaROxYvr
 RyVRQkRxZFRRnLfjE8Ng+ZHaxGcTWmmhwAdM3SxWM3sUMfRnWiLfKOI0=
X-Google-Smtp-Source: AGHT+IHXNYJgEF/AkDrtNb4kEIJByyoDwS+sF0q5AaLNeXuHqiIVd7G2w0RQ/jasVfBEFBbzDTRHIZoeDChkMqb1iXDan+dzO6sS
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2162:b0:363:cc38:db1c with SMTP id
 s2-20020a056e02216200b00363cc38db1cmr474241ilv.6.1707739322012; Mon, 12 Feb
 2024 04:02:02 -0800 (PST)
Date: Mon, 12 Feb 2024 04:02:01 -0800
In-Reply-To: <000000000000587e0f06112cd973@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a8616906112e0b4b@google.com>
Subject: Re: [syzbot] [dri?] divide error in drm_mode_convert_to_umode
From: syzbot <syzbot+0d7a3627fb6a42cf0863@syzkaller.appspotmail.com>
To: airlied@gmail.com, airlied@linux.ie, daniel.vetter@ffwll.ch, 
 daniel.vetter@intel.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 melissa.srw@gmail.com, mripard@kernel.org, syzkaller-bugs@googlegroups.com, 
 tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
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

syzbot has bisected this issue to:

commit ea40d7857d5250e5400f38c69ef9e17321e9c4a2
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri Oct 9 23:21:56 2020 +0000

    drm/vkms: fbdev emulation support

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14426df4180000
start commit:   445a555e0623 Add linux-next specific files for 20240209
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16426df4180000
console output: https://syzkaller.appspot.com/x/log.txt?x=12426df4180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85aa3388229f9ea9
dashboard link: https://syzkaller.appspot.com/bug?extid=0d7a3627fb6a42cf0863
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17d4bd48180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=106ae642180000

Reported-by: syzbot+0d7a3627fb6a42cf0863@syzkaller.appspotmail.com
Fixes: ea40d7857d52 ("drm/vkms: fbdev emulation support")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
