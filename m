Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F7F652DFD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 09:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E22510E43E;
	Wed, 21 Dec 2022 08:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A506089954
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 02:23:59 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id tz12so33577070ejc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 18:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+3RdRpYZ4z8FJbFrM7sXD/xVbMsmepV+i3Zb28NO31o=;
 b=esIVJW4WKii7HQTSRNxbcmhwcMFWfaYEjrLeBTEgpRjunNdD+G+WPFIKAQsfm7YnGi
 prnfDJYbjQo6wOG5HaLyCbyRVzKPjT9WlmZ/Q6P8T+MAYJuML8Cnrgesv3mwRlQKkX1V
 njj9+lbvBW56vqYyllksAQpb59h6bKGSyEIUKIRgjvwkpDQo79iiVAYTd0sTaRboRMfX
 8XiuhWVbxgZ411eIOGgdLkn7/eQBWkFqa+PF8nGv3IRziB7+oVK7JaDXVLIow/DeJBnE
 usYi0oPM669MZAaVAJAPHKVBzlRJ/B3hYwkONCZ8oBdMavvei2Xg+KU7jOZPhv0z0+rd
 hbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+3RdRpYZ4z8FJbFrM7sXD/xVbMsmepV+i3Zb28NO31o=;
 b=uZhLOF8Gw2wsp/OL+mYo2PViEEIb/H0ZzrZQIRm0h142J46NIbO6LDpBZPyRkfgmCZ
 habIqqLbdetYY1hW2vECYA9hX18WkE0U7ZCwUKXsXcCA6fvQE/+lbJvqohrwKCcTLqjo
 ktBAkHL2EwFzCz1OgRjl3D60LGmCLGWa8YO7eX6HdLAZxJQl3jqqqcvkrvuqZszpQHmy
 wWycoHN7EIRVPKXulH0l45xoJo8fs+ew9OrPyFxUZDJpcRmQzjX0Hde2yhf/t7HNG+mC
 RAejKLoknVB4l5ZYoi5K7ein0RMpkuXLM0XUpq+DNsIBnhFLo3LyDffVm4GlBFLrAW0h
 aDWA==
X-Gm-Message-State: AFqh2kp2MuHmM4gp4ZilSsDpb+JWlQDC6sYZGJGm0SyuP/Sfz/NkhC32
 MptkrLUX7OdKzQKkUXJuUcX92p5ornqdSdd+CO0=
X-Google-Smtp-Source: AMrXdXsX9gl9lsHZpGBBYXhDSg9uekVojjQtzYsBsXhpOwepHcCVrcmFhDqRqMFjDyhqwcb3RKjuWathNY6unE8UNO8=
X-Received: by 2002:a17:907:8b97:b0:82d:e2a6:4d38 with SMTP id
 tb23-20020a1709078b9700b0082de2a64d38mr602966ejc.729.1671589437920; Tue, 20
 Dec 2022 18:23:57 -0800 (PST)
MIME-Version: 1.0
From: Kaiwan N Billimoria <kaiwan.billimoria@gmail.com>
Date: Wed, 21 Dec 2022 07:53:41 +0530
Message-ID: <CAPDLWs_7331QyD_Mnb9k1LrBsYopeVVbd9zDM_2R-xCoG272PA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix passing partly uninitialized
 drm_mode_fb_cmd2 struct
To: zackr@vmware.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 21 Dec 2022 08:29:21 +0000
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
Cc: airlied@linux.ie, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com, regressions@leemhuis.info,
 Linux-graphics-maintainer@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[REGRESSION] ?
Hi,
Testing with 6.1, I find the same issue - VirtualBox VMs seem to hang
on boot, though the kernel has this patch applied of course...
Am running VirtualBox 7.0.4 on an x86_64 Linux (Ubuntu 22.04.1) host;
the system hangs on boot with the screen
going blank.
Passing 'nomodeset' via GRUB fixes it..

Thanks,
Kaiwan.
