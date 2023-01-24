Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A032F67B24F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 13:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEB310E7B3;
	Wed, 25 Jan 2023 12:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC7610E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 17:23:51 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id s67so11744230pgs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 09:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+0nNRfjCiY62cIhTLLxOILNdEmv43GkeGwDLJSgq+54=;
 b=KERHFJmysDcwQBNOAlN+gp+2jnAw1CcO6J+pAe7fa0lKM6lW7VtVXnn4RZvxq0fiS0
 0rtGgZP32STP5sXxbA2Vsy/jF1jcF1aDH0vWlP3WvE90aQyvLVtiAMo7Pzrx8osxm7fk
 9JRWfI+N4FVB3ogvKeivLJbrht/WgeO13d93xTmHNm3vXsBQIN3cYlOQXjcI1zBIBUvT
 p3cis2Kf8ytsKJgZhjlBRTSbLxhw4qBIPgIgfTtNi9Ncs0b/zOaAWatfRhggXrydj5sg
 1JB7vPwGLEyY/OzQb+3nbtuNVKo6qamJNPS6Zj3QrVHUd5DTQg6DkWgF20IONQk12qM0
 L6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+0nNRfjCiY62cIhTLLxOILNdEmv43GkeGwDLJSgq+54=;
 b=Cwnz3iislDZVeR3Iyyv+Qs8KlAetsEtTj1KY/KXJ82abn2CUGvb3gYgwiTvm5fSx6S
 O9gqaje0r8i2tXnX5jmxUH9OdLAGGxMNZFBF4kARppDrWRy7p2yHkxAiYjt6vMe4Ey9M
 N4GLGXozHYVilCB5JCeUcw2bTve4bzL0SVf/fsGYIhYny+szAq+m4utjZWGQ+5SbDh3B
 CHhJ1qlzSnhzKoTtAcuxqVNQVW4FBjzf5BstDtjM7oH69kzSx+2wDtEX3w/MNcUxaaIM
 77FZtqBtgQDHEWSfTRt3wt5w2SN/iQDy3MTgBqt7saYsTmJuf7mwqgXkq4rMNSaIeMn0
 fCjg==
X-Gm-Message-State: AFqh2krsl2uty/YG9xa5hhxDlIp/PaOHqrvWxRnjuljbipkEByVnz7L8
 B6oU/Zjp6SykSCrq55BKrjzufz/njBnZx6Pp83w=
X-Received: by 2002:a05:6a00:b96:b0:58d:b8f6:6f6d with SMTP id
 g22-20020a056a000b9600b0058db8f66f6dmt4962858pfj.32.1674581031297; Tue, 24
 Jan 2023 09:23:51 -0800 (PST)
MIME-Version: 1.0
From: novenary <streetwalkermc@gmail.com>
Date: Tue, 24 Jan 2023 19:23:40 +0200
Message-ID: <CANnEQ3Ef5-XRSVL=RCBuKKhR0oZF+SO2BSSiBigZOyjMeQ7f_g@mail.gmail.com>
Subject: fbcon font is reset after GPU is loaded
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 25 Jan 2023 12:06:41 +0000
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This appears to be a pretty common problem. systemd includes a udev
rule[1] which loads a console font from userspace, using setfont from
the kbd package, when a vtcon device is added. According to udev debug
logs, this event only fires once.

This actually works fine all the way until the GPU driver is loaded,
after which the console is reverted to the default kernel font. My
understanding from skimming the code in fbcon.c is that fonts should
be persisted from one instance to the next.

I can reproduce this on both of my machines, one with an AMD Polaris
GPU, and one with Intel integrated graphics (Kaby Lake R).

As discussed in [2], it seems the only reliable way to change the
console font at the moment is to ensure that the graphics driver is
loaded before udev starts, but I don't believe this is an acceptable
or even correct solution.

Am I missing something? It would be really helpful if someone could
shed light on why this is happening.

[1] https://github.com/systemd/systemd/blob/main/rules.d/90-vconsole.rules.in
[2] https://github.com/NixOS/nixpkgs/issues/202846

Thanks in advance,
novenary
