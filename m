Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7DA875F65
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 09:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E602110F09C;
	Fri,  8 Mar 2024 08:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YofEHaf1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5623210EFB1;
 Fri,  8 Mar 2024 01:12:16 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-33d118a181fso896936f8f.1; 
 Thu, 07 Mar 2024 17:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709860334; x=1710465134; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9rYDwFy7vdGfEU3AYQcMyBM3b1/hHXEUCIhC7owEbTA=;
 b=YofEHaf14bQwVITW8J8Ybb9KyfzIemfk2xxhs5NVLB0k3muRaSZSIYVSXGSVEFJ4zC
 WS73HYCKBJj3lmnANHpDGreZHTLZr3+wf1BhbREWnnFSKcFeotAp2WZaY8yaRwNuPFz/
 QI5hI8Xtno2QZB476v83RD79GwdZ/inSPUcBjJAc37svzV7VQZtPuoP1Xi7VVADVzEZc
 9xXsLz4FNBWW2Fa6RvBxmTfhYFbmpAHtHvmnjJihflol5cGZIl2InpoM3MjC6Ukqn637
 zr4qsbqsI8T1IdNXZdqjaIZDxErk8WftQbMwT7JsiYnXXwPtqFnxK6ymzg2IaeOsnU10
 Endg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709860334; x=1710465134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9rYDwFy7vdGfEU3AYQcMyBM3b1/hHXEUCIhC7owEbTA=;
 b=LNq1tyD93RRPnYYPAPkl6DAFU10JXoDVZEmFbqkOLFTR3WEEwNgNSH4MVnB04AGoye
 LPoP78wrM1OD+B0XFcSBoqbAVRL8BDTlY410NE7Ox48O8Uw8KbcBeiHJSZfNoRL5bgy6
 8f/5t9rFC8SZcxF7sAxQBPGZy3eimRE/RfHxTvAUPy6f0uNHH3XvyZY1LS/POekrOH2u
 w2wySx54XQu9w5U35yVjCKL0ploTTheNVF1CU2KEZMhhgn/1oQ+hUG5B0UD8LABhQ6Zn
 QOvVWLupBIExq4gu3v9PGTd7ZVxB1lWQWeu+7dLkhz4sQNQcINUoYIBfEWMh5yUA24UY
 +rQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB9v14Y5MEFLJv4IkFmuhjAKJU49DvVxYVHPYyptLfQDgeomcZeHgEattgxHDBgDLsEwjCcOVH4sk0kw0XAfacg5Mk/S9Q3io1uqJtBhTMsxtKdm/GJHLlC5ak1IT8DmZn/0L3GFKTpq6cZcJrzHN7O+8=
X-Gm-Message-State: AOJu0YylWOblKTS2m1A+3XIypn9e3BRD1o2UJmszOlUHPPvwi3hSs6Ad
 z6k7+zvSq44DOSqAr4GX9zSp61ILGkNuoN9faKH7QAksZnlaxmxF
X-Google-Smtp-Source: AGHT+IGKMlg7G8idiMgtUIW7KsMqQOgjBUReKZbtn1HelBvnmw950hTkhxqpW8un5mj/gRLn/HuyMA==
X-Received: by 2002:adf:f7d2:0:b0:33d:6ede:1149 with SMTP id
 a18-20020adff7d2000000b0033d6ede1149mr13774269wrq.35.1709860334120; 
 Thu, 07 Mar 2024 17:12:14 -0800 (PST)
Received: from localhost (ec2-18-169-47-158.eu-west-2.compute.amazonaws.com.
 [18.169.47.158]) by smtp.gmail.com with ESMTPSA id
 w15-20020adfec4f000000b0033e767cac6csm298769wrn.115.2024.03.07.17.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 17:12:13 -0800 (PST)
From: Alex Constantino <dreaming.about.electric.sheep@gmail.com>
To: regressions@leemhuis.info
Cc: 1054514@bugs.debian.org, airlied@redhat.com, carnil@debian.org,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 spice-devel@lists.freedesktop.org, timo.lindfors@iki.fi,
 tzimmermann@suse.de, virtualization@lists.linux-foundation.org,
 Alex Constantino <dreaming.about.electric.sheep@gmail.com>
Subject: [PATCH 0/1] drm/qxl: fixes qxl_fence_wait
Date: Fri,  8 Mar 2024 01:08:50 +0000
Message-Id: <20240308010851.17104-1-dreaming.about.electric.sheep@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <fb0fda6a-3750-4e1b-893f-97a3e402b9af@leemhuis.info>
References: <fb0fda6a-3750-4e1b-893f-97a3e402b9af@leemhuis.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 08 Mar 2024 08:24:25 +0000
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
As initially reported by Timo in the QXL driver will crash given enough
workload:
https://lore.kernel.org/regressions/fb0fda6a-3750-4e1b-893f-97a3e402b9af@leemhuis.info/
I initially came across this problem when migrating Debian VMs from Bullseye
to Bookworm. This bug will somewhat randomly but consistently happen, even
just by using neovim with plugins or playing a video. This exception would
then cascade and make Xorg crash too.

The error log from dmesg would have `[TTM] Buffer eviction failed` followed
by either a `failed to allocate VRAM BO` or `failed to allocate GEM object`.
And the error log from Xorg would have `qxl(0): error doing QXL_ALLOC`
followed by a backtrace and segmentation fault.

I can confirm the problem still exists in latest kernel versions:
https://gitlab.freedesktop.org/drm/kernel @ c6d6a82d8a9f
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git @ 1870cdc0e8de

When I was investigating this issue I ended up creating a script which
triggers the issue in just a couple of minutes when executed under uxterm.
YMMV according to your system, for example when using urxvt crashes were
not as consistent, likely due to it being more efficient and having less
video memory allocations.
For me this is the fastest way to trigger the bug. Here follows:
```
#!/bin/bash
print_gradient_with_awk() {
    local arg="$1"
    if [[ -n $arg ]]; then
        arg=" ($arg)"
    fi
    awk -v arg="$arg" 'BEGIN{
        s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
        for (colnum = 0; colnum<77; colnum++) {
            r = 255-(colnum*255/76);
            g = (colnum*510/76);
            b = (colnum*255/76);
            if (g>255) g = 510-g;
            printf "\033[48;2;%d;%d;%dm", r,g,b;
            printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
            printf "%s\033[0m", substr(s,colnum+1,1);
        }
        printf "%s\n", arg;
    }'
}
for i in {1..10000}; do
    print_gradient_with_awk $i
done
```

Timo initially reported:
commit 5f6c871fe919 ("drm/qxl: properly free qxl releases") as working fine
commit 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait") introducing the bug

The bug occurs whenever a timeout is reached in wait_event_timeout.
To fix this issue I updated the code to include a busy wait logic, which
was how the last working version operated. That fixes this bug while still
keeping the code simple (which I suspect was the motivation for the
5a838e5d5825 commit in the first place), as opposed to just reverting to
the last working version at 5f6c871fe919
The choice for the use of HZ as a scaling factor for the loop was that it
is also used by ttm_bo_wait_ctx which is one of the indirect callers of
qxl_fence_wait, with the other being ttm_bo_delayed_delete

To confirm the problem no longer manifests I have:
- executed my own test case pasted above
- executed Timo's test case pasted below
- played a video stream in mplayer for 3h (no audio stream because
  apparently pulseaudio and/or alsa have memory leaks that make the
  system run out of memory)

For quick reference here is Timo's script:
```
#!/bin/bash
chvt 3
for j in $(seq 80); do
    echo "$(date) starting round $j"
    if [ "$(journalctl --boot | grep "failed to allocate VRAM BO")" != "" ]; then
        echo "bug was reproduced after $j tries"
        exit 1
    fi
    for i in $(seq 100); do
        dmesg > /dev/tty3
    done
done
echo "bug could not be reproduced"
exit 0
```

From what I could find online it seems that users that have been affected
by this problem just tend to move from QXL to VirtIO, that is why this bug
has been hidding for over 3 years now.
This issue was initially reported by Timo 4 months ago but the discussion
seems to have stalled.
It would be great if this could be addressed and avoid it falling through
the cracks.

Thank you for your time.


---

Alex Constantino (1):
  drm/qxl: fixes qxl_fence_wait

 drivers/gpu/drm/qxl/qxl_release.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)


base-commit: 1870cdc0e8dee32e3c221704a2977898ba4c10e8
-- 
2.39.2

