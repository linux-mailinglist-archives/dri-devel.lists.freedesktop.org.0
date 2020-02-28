Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7003174613
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 11:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455046E1CD;
	Sat, 29 Feb 2020 10:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657B16F478
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 16:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1582907688;
 bh=YcG6r7F3VVt7DQsFNhV4JbQ/Bh6aKNh0DkfRxFndYAA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=M893la1WZgDW7/xWaBckbU4Odje3StaE2YcrGjt7TLxyK3pbX/Ea23pa9tN/cHEH7
 joHd8VOqO6RSYD0a0SS6Ty3j2XCMW2ucMF+AzxWLxQmzVPStkZStnqrxLMH4lEZRAD
 CzydVU3Wqs7ndlgvC4LH1dlsW2OpHQHQinHzZuGU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.53.40.15] ([185.53.40.15]) by web-mail.gmx.net
 (3c-app-gmx-bap21.server.lan [172.19.172.91]) (via HTTP); Fri, 28 Feb 2020
 17:34:47 +0100
MIME-Version: 1.0
Message-ID: <trinity-1aeda07b-567b-4a31-a709-36199975894b-1582907687950@3c-app-gmx-bap21>
From: "Frank Wunderlich" <frank-w@public-files.de>
To: "Bibby Hsieh" <bibby.hsieh@mediatek.com>
Subject: [BUG] [PATCH v5 3/7] drm/mediatek: update cursors by using async
 atomic update
Date: Fri, 28 Feb 2020 17:34:47 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20191210050526.4437-4-bibby.hsieh@mediatek.com>
References: <20191210050526.4437-1-bibby.hsieh@mediatek.com>
 <20191210050526.4437-4-bibby.hsieh@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:2wHSXETBujv7ubTGIwZ5VrMFtJmoX/njL13MkH8s5eovSX+Y+sTe0+BByPkiM5mY2rzQm
 gKpnl5HTR1TX8ZwimXy747VbCYUysGQw+GdtehRIGT5il+WUm2aG81V2Bu0Dpft2U3SY51brmqYE
 H0JgZOtLaL0+tXa8kZMGxWwyoVLkjFO5i3HFnIccGF/d2ihL7iTlHuSy3H9axD1B76whc67PrgRz
 VBlEsXrblvHd0UmCQ6WWGJeRXN83aG2f7ScyhV9hAm1fz/xBSUnehkXcTmbnfvD6ndAjICp0ek9M
 Rc=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K7AD3qghSCg=:KDuvUtyqh0IxQhZ8dH9kvu
 UkMiaACx+8TarnVTvKLAKYfLysNr+9tfMvPZLRxVtUh1T0O1DBm4Rko4sdLxfCcUGMflBCrDF
 ciX4YIyA6kuUTwucfzx22ITRFECEbD2yoh1WgJbxUXd9NJYwXopioXyMMrwaM6xnYz/nLIr7o
 mUGZMog7Dou+NeR5Em4TB8BEgRtUTLT6+nfdjLNz4ShGizgdYRFKt+/vHZk/V1IW+aFci1vsg
 LHvupXQWPTqlYNA3JS0Km5lF3zWjBdUJIGrdIGympZEuHb5mAtd4vGX9XsCeZH3p1WjQ/MpQY
 4acYwTHnCUAyGf7pGu2tzR8WsBvTvBOIW4Q8I03JkR+4har3qSWjIcdqgk2ff+6RSbEXVjquZ
 C7mZBt3pEMeZjKM+Z1HkvLnv2XrRM8CB/s3gUG3quARYuumwpA7BH7F7fOTjduxgqWlhv3YVO
 mhEDvNNyn9mge3Vz9N5MalwRkGJ5FJFlPEG9tEBlGoHxehlLMAMYcXVl4oE5ffpiFOpSG15y4
 rm2LvOfG+tHze6Pl5a18bTr459tAbHXJYVUGnvmhov147zK1eBq3bFk9JHKV0fMl5up+E2is1
 +YOSmDnrCG2i9TqD76kwDIFdZnprjEY1f1rR8oEq2QgrAsYW0byi74bJRq34xclYgmkooSZsk
 eGfDPVeomp5G0jsWbOdU4oBMCEo7ol8LkDiWjXMdSbjZUOrU62FolI9j7z62bk/OQrp0=
X-Mailman-Approved-At: Sat, 29 Feb 2020 10:13:17 +0000
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
Cc: drinkcat@chromium.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tfiga@chromium.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

as talked to Bibby directly, this Patch seems to create a bug with touchscreens. Cursor is displayed on old position if changing its position. e.g. Cursor was on X1,Y1 and i touch to new position X2,Y2 the "click" is recognized on right position (i try to ), but cursor is displayed on X1,Y1

have made a small video and uploaded to my gdrive [1]...

here i use lightdm login manager and selecting the username/password-fields alternately. Focus follows, but cursor is always displayed on prior position

tried to revert this commit [2], but there are many depencies failing the revert, have not yet got all depending commits reverted

regards Frank

[1] https://drive.google.com/open?id=1Qy0tYnbO9zNGdjCWY18O-dMYbFuPrq_i
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=920fffcc891276a855cb3ce1e7361d2e9cb72581
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
