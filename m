Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F4030A30F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 09:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1D56E43D;
	Mon,  1 Feb 2021 08:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 534 seconds by postgrey-1.36 at gabe;
 Sun, 31 Jan 2021 23:15:04 UTC
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467E86E134;
 Sun, 31 Jan 2021 23:15:04 +0000 (UTC)
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
 id 6E05EC1BE5; Sun, 31 Jan 2021 23:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1612134368; bh=ZcNE+YqUbFE7ilb2fMS+PExd3K0uSxm8CKC9+sqOxqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=nqigVK+ACcfP6sHau6sKVzu/t3JOyrt4Mt6eSSF478B6kaM4hbdGj0cO6fjIEvoCt
 dwVDvVxwJYxnu4sE59NQeUdFCNmhtqw/Psw/Yi6CDpLjUJX0GGZiIsSbKfM0wWO29R
 dosaZpjq+JyC2QbEJHjJPOLSa2hZdN78rGBkfArw=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
 PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.4
Received: from g550jk.localnet (80-110-106-213.cgn.dynamic.surfer.at
 [80.110.106.213])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 29673C1BDD;
 Sun, 31 Jan 2021 23:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1612134362; bh=ZcNE+YqUbFE7ilb2fMS+PExd3K0uSxm8CKC9+sqOxqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=P+jxQO2i9OTmHF2los3Da52AJ1CD+bg6SSnGdH4SsZ7unxE0cYr9VPx01GTKErHab
 aByOXK/nI9vwnyZ+Hqquf6uc3rFWN9KRL1aAdve6ef7FfzchB+GsRuZX0QT6yVTTGS
 YmiozrIwJnxsZ/30GSXRkXNPAajuYnuJqEATRi6o=
From: Luca Weiss <luca@z3ntu.xyz>
To: Rob Clark <robdclark@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] drm/msm/mdp5: Fix wait-for-commit for cmd panels
Date: Mon, 01 Feb 2021 00:06:01 +0100
Message-ID: <2117852.HdQyuLfLX8@g550jk>
In-Reply-To: <20210127152442.533468-1-iskren.chernev@gmail.com>
References: <20210127152442.533468-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 01 Feb 2021 08:11:06 +0000
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
Cc: freedreno@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org, Brian Masney <masneyb@onstation.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-kernel@vger.kernel.org,
 Iskren Chernev <iskren.chernev@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Emil Velikov <emil.velikov@collabora.com>, Sean Paul <sean@poorly.run>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Iskren,

On Mittwoch, 27. J=E4nner 2021 16:24:40 CET Iskren Chernev wrote:
> Before the offending commit in msm_atomic_commit_tail wait_flush was
> called once per frame, after the commit was submitted. After it
> wait_flush is also called at the beginning to ensure previous
> potentially async commits are done.
> =

> For cmd panels the source of wait_flush is a ping-pong irq notifying
> a completion. The completion needs to be notified with complete_all so
> multiple waiting parties (new async committers) can proceed.
> =

> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Fixes: 2d99ced787e3d ("drm/msm: async commit support")
> ---

I've tested this now on fairphone-fp2 and lge-nexus5-hammerhead, works grea=
t!

Tested-by: Luca Weiss <luca@z3ntu.xyz>

Regards
Luca


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
