Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D299965AAF7
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jan 2023 19:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D8610E04D;
	Sun,  1 Jan 2023 18:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AA110E04D;
 Sun,  1 Jan 2023 18:29:39 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id p4so27928455pjk.2;
 Sun, 01 Jan 2023 10:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SYT/VHSXBwe4cHOdr34H+ecaXKxhJH5amYlLg+BefpI=;
 b=KWF+O3vWomeAIdDzKeZHx3RBhco/fHa/hWqcWsohgjlAuP/qv5smNVZ1WVJKvbXMAO
 JnLlK+Et7QoH6c1c6SuGKjeeWsf+H7BstrDwv0EaskyLQ5VmWPRbU96hDvilO8tthjvY
 8wJb80/GRa2ltR8BZdC3Fj5qcxHu006I8OQKEkYDkSaTZmCvu5RMLf0+whdYg6GcPD/R
 ThCAVnP2Se9i8MIyhhgildQgq7s4RHekTrTNQ1lh3SZykR2HfnIhKIVZFmLWz12csEBX
 4dF0SpiwAVnJ5AD745QXFegquNzUG5sN/egI4eyoLfwXcwneOrFNWvSOZckytPQUxcRO
 70hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SYT/VHSXBwe4cHOdr34H+ecaXKxhJH5amYlLg+BefpI=;
 b=e8KYyLI91NFGN/0m6csxf+yfYf7BS5F2zE91/6zG7EBq6cCluggxxUEdX6eK7z7y0A
 SEfdM2iaWYuO/UJH+1QBjzaqb3G8WHMfAvO+mmsFvPTUjx14zWJ61wlunSonASzQdthQ
 H032DGfRT5yzUZ0zTnCfV35M/rxrlm82wMbJto9QFoGB78zEQJkJgtNjXY0BBTmR+FG9
 Biufn6PufGYjpmt679T7D2AqojVeq/Q2fJJ2tf/c9IiU7Tp+Ts3+aQh8jnDCBtqpDteC
 KWTe1pNB8HYkjG127K7UiXwxMwrh04k1Ir6DHM9uhY5kea+HWnAUM1JS3EJ1+jot8Kao
 160Q==
X-Gm-Message-State: AFqh2kpvawklRHEXxeZFod5pMFDpXngpL13DTLYchBhxqbui7mar1uo6
 jbOp9BdYHJy1HlNayMJRjjI=
X-Google-Smtp-Source: AMrXdXuaueNFSatXy0BX7BE+nWzKpnZ7GpAB5JnJ8J8+8QhKzhI1nCqNMKxTcjhOd0UZ4HotW8cAIg==
X-Received: by 2002:a17:903:3284:b0:188:82fc:e277 with SMTP id
 jh4-20020a170903328400b0018882fce277mr45477382plb.12.1672597779150; 
 Sun, 01 Jan 2023 10:29:39 -0800 (PST)
Received: from localhost.localdomain ([173.82.232.27])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a170902d58d00b0017f48a9e2d6sm3362787plh.292.2023.01.01.10.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 10:29:38 -0800 (PST)
From: youling257 <youling257@gmail.com>
To: robdclark@gmail.com
Subject: Re: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
Date: Mon,  2 Jan 2023 02:29:07 +0800
Message-Id: <20230101182907.1662-1-youling257@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <CAF6AEGv=GJm5Hyea7a0oDgWDYXw72HwTB4sreeppYVEKCsw0Ew@mail.gmail.com>
References: <CAF6AEGv=GJm5Hyea7a0oDgWDYXw72HwTB4sreeppYVEKCsw0Ew@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: jonathan@marek.ca, ckoenig.leichtzumerken@gmail.com,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org, dmitry.osipenko@collabora.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Linux 6.2-rc1 has memory leak on amdgpu, git bisect bad commit is "drm/scheduler: rework entity flush, kill and fini".
git bisect start
# status: waiting for both good and bad commits
# good: [eb7081409f94a9a8608593d0fb63a1aa3d6f95d8] Linux 6.1-rc6
git bisect good eb7081409f94a9a8608593d0fb63a1aa3d6f95d8
# status: waiting for bad commit, 1 good commit known
# bad: [66efff515a6500d4b4976fbab3bee8b92a1137fb] Merge tag 'amd-drm-next-6.2-2022-12-07' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
git bisect bad 66efff515a6500d4b4976fbab3bee8b92a1137fb
# good: [49e8e6343df688d68b12c2af50791ca37520f0b7] Merge tag 'amd-drm-next-6.2-2022-11-04' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
git bisect good 49e8e6343df688d68b12c2af50791ca37520f0b7
# bad: [fc58764bbf602b65a6f63c53e5fd6feae76c510c] Merge tag 'amd-drm-next-6.2-2022-11-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
git bisect bad fc58764bbf602b65a6f63c53e5fd6feae76c510c
# bad: [4e291f2f585313efa5200cce655e17c94906e50a] Merge tag 'drm-misc-next-2022-11-10-1' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
git bisect bad 4e291f2f585313efa5200cce655e17c94906e50a
# good: [78a43c7e3b2ff5aed1809f93b4f87a418355789e] drm/nouveau/gr/gf100-: make global attrib_cb actually global
git bisect good 78a43c7e3b2ff5aed1809f93b4f87a418355789e
# bad: [611fc22c9e5e13276c819a7f7a7d19b794bbed1a] drm/arm/hdlcd: remove calls to drm_mode_config_cleanup()
git bisect bad 611fc22c9e5e13276c819a7f7a7d19b794bbed1a
# bad: [a8d9621b9fc67957b3de334cc1b5f47570fb90a0] drm/ingenic: Don't set struct drm_driver.output_poll_changed
git bisect bad a8d9621b9fc67957b3de334cc1b5f47570fb90a0
# good: [2cf9886e281678ae9ee57e24a656749071d543bb] drm/scheduler: remove drm_sched_dependency_optimized
git bisect good 2cf9886e281678ae9ee57e24a656749071d543bb
# bad: [8e4e4c2f53ffcb0ef746dc3b87ce1a57c5c94c7d] Merge drm/drm-next into drm-misc-next
git bisect bad 8e4e4c2f53ffcb0ef746dc3b87ce1a57c5c94c7d
# bad: [47078311b8efebdefd5b3b2f87e2b02b14f49c66] drm/ingenic: Fix missing platform_driver_unregister() call in ingenic_drm_init()
git bisect bad 47078311b8efebdefd5b3b2f87e2b02b14f49c66
# bad: [a82f30b04c6aaefe62cbbfd297e1bb23435b6b3a] drm/scheduler: rename dependency callback into prepare_job
git bisect bad a82f30b04c6aaefe62cbbfd297e1bb23435b6b3a
# bad: [2fdb8a8f07c2f1353770a324fd19b8114e4329ac] drm/scheduler: rework entity flush, kill and fini
git bisect bad 2fdb8a8f07c2f1353770a324fd19b8114e4329ac
# first bad commit: [2fdb8a8f07c2f1353770a324fd19b8114e4329ac] drm/scheduler: rework entity flush, kill and fini

@Rob Clark, i test your patch fixed my problem.
