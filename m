Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 173B1766F59
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 16:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD2610E6FA;
	Fri, 28 Jul 2023 14:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FE410E6FA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 14:22:34 +0000 (UTC)
Date: Fri, 28 Jul 2023 14:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1690554152; x=1690813352;
 bh=qUTyVGmY+SUpg3/1PHbpdRRzD/ZAMSvRleoyIi8Jdus=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Jy7+jRZ+kBFwVXICl01cgJ2HPRNBr8O9uTX2knZ+VspFsWH62GRPqefxbMJcQs4Wq
 YEzXZ8Gi30qX/hFqn3lMyt7LIosgfuefoRUMF1RmfJMGL83E4JyVxXOgTF4UoqMVJe
 5ThuUBDvZHIHqoi3Et+FWWjSizGr9WQ3u8sbbhWph2c9MNquS32xySuWAbttDS8JjJ
 07LCgwla0VsDSOpt7iYab7F1GLY0xtdsATmgGXiLsrzPxmrISXAlHNHZbAuBkk0Em7
 3vuKneYBaIlhrVCfHl/7zMIYpCJPun3+zrDYPsv/HQiLTaWL1Mh/s5j08QJufnDb5F
 W5zzuNdH3sMEw==
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 3/4] drm: Expand max DRM device number to full MINORBITS
Message-ID: <TAdBP5BOy3cy7VnUb4t7ZkDOMK6wI_gPCjXanItN3TOsA1TbSk_6yrlcPTqvk3AZjamo96yHlEhjpfNUPFF6tA_9K8iRoie3h_z5Jf6zNtc=@emersion.fr>
In-Reply-To: <69801f61-37b0-3e46-cbef-31ff80ae9a34@amd.com>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <20230724211428.3831636-4-michal.winiarski@intel.com>
 <83s0YPWEdYE6C2a8pa6UAa3EaWZ2zG-q7IL9M-y6W1ucF9V54VnZtigKj3BGKUA2FZpIrs0VVxmpHO2RAhs_FdOnss9vNLQNSHySY8uH7YA=@emersion.fr>
 <69801f61-37b0-3e46-cbef-31ff80ae9a34@amd.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Matthew Wilcox <willy@infradead.org>,
 =?utf-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Emil Velikov <emil.l.velikov@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, James Zhu <James.Zhu@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, July 27th, 2023 at 14:01, Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:

> > We do need patches to stop trying to infer the node type from the minor
> > in libdrm, though. Emil has suggested using sysfs, which we already do
> > in a few places in libdrm.
>=20
> That sounds like a really good idea to me as well.
>=20
> But what do we do with DRM_MAX_MINOR? Change it or keep it and say apps
> should use drmGetDevices2() like Emil suggested?

DRM_MAX_MINOR has been bumped to 64 now.

With the new minor allocation scheme, DRM_MAX_MINOR is meaningless
because there is no "max minor per type" concept anymore: the minor no
longer contains the type.

So I'd suggest leaving it as-is (so that old apps still continue to
work on systems with < 64 devices like they do today) and mark it as
deprecated.
