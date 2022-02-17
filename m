Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28FF4BAC47
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 23:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC5510E63E;
	Thu, 17 Feb 2022 22:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF3210E85A;
 Thu, 17 Feb 2022 22:07:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E4ABEB82486;
 Thu, 17 Feb 2022 22:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B94EC340E8;
 Thu, 17 Feb 2022 22:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645135621;
 bh=+aPKJYM7vg0EYwrtq2Hsglc06uQwtSfGjhDhOzVSNnI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=QVW8paqsPqBFZzhIbIlJ/AhIhgxVIlPq6jD35Q5A/7cgKpNKxksfdXTJJ7HZJqIGj
 ASdgIDTnkvXHo/mgGAODjhX19wht2j3tAGbF0ygUawuMEQ9OrRsyXZiXi16wcV/BLS
 Yjv5yr65inaOE4CKpbTRdi5j7GnOcSMiwNUHlXZ1PqagQkcgQD62Jdwu3FvW1sEqKs
 c2BQPNY7y8LZwy84K6zyI7TlFLHUtTUqX8yZfegx2OOgobj7VDCo03aZFoHGicE+gq
 B3XegwM5u6P4IxPo+KZKOKoAZfkILHX6DcO6i6N2oE+tkrt/fUL4Dp4lJlTp7iImXC
 89aFzHU4050oQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1644890154-64915-3-git-send-email-wangqing@vivo.com>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
 <1644890154-64915-3-git-send-email-wangqing@vivo.com>
Subject: Re: [PATCH V3 2/13] clk: mvebu: use time_is_before_eq_jiffies()
 instead of open coding it
From: Stephen Boyd <sboyd@kernel.org>
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
	Alasdair Kergon <agk@redhat.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Jens Axboe <axboe@kernel.dk>, Jiri Kosina <jikos@kernel.org>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Mike Snitzer <snitzer@redhat.com>, Qing Wang <wangqing@vivo.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Roger Pau =?utf-8?q?Monn=C3=A9?= <roger.pau@citrix.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	amd-gfx@lists.freedesktop.org, dm-devel@redhat.com,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesk,
	top.org@freedesktop.org, linux-block@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	xen-devel@lists.xenproject.org
Date: Thu, 17 Feb 2022 14:06:58 -0800
User-Agent: alot/0.10
Message-Id: <20220217220701.9B94EC340E8@smtp.kernel.org>
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Qing Wang (2022-02-14 17:55:39)
> From: Wang Qing <wangqing@vivo.com>
>=20
> Use the helper function time_is_{before,after}_jiffies() to improve
> code readability.
>=20
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---

Applied to clk-next
