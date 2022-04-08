Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43324F9273
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371E910F175;
	Fri,  8 Apr 2022 10:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B8A10F172
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 10:01:38 +0000 (UTC)
Date: Fri, 08 Apr 2022 10:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1649412095;
 bh=rusAaDnliVYRoqaWx3ZseyT0eG4DdEtRKyDQafUunhY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=tCALG0eT8UMW1BL26yI62yvZGYqUvlm4cJp6HVttJFU/Vw68LIV2BjpljM4Yk2N/m
 9UtMFeHqgbxq+W96l7dk+GGUmAYcK0bn3EcansddIBYaWYzPr+LLEEnrCaGDY+qy6w
 pHlaUS8CftUwPOTrMy7Thhm0tVPnPavcVt+CmrMIBIvuP3UVa9k3k3MmL1HiJUPo7B
 dOqYSAD8APV/Ov8RDlIWtgDmk/9hRVQZyxgzwK9I7mKsi+N5A3WOW42VePahZWg1+a
 6FVKiuDXihKa28jw/k3QxoLUiwRaQ/3KwPY0t4id0qJEudzImEtrFZ5lC1hfPeTFsj
 JOhcK2hBuHjGA==
To: Grigory Vasilyev <h0tc0d3@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/amdgpu: Fix NULL pointer dereference
Message-ID: <4o2YD5id7zhK5g__CUK3Yf-6Dj459XQ0qsydW6wKHdco3YYtl78BqGUfXvQ9UO0AZoAsMPfhFB0jw1BFldiFDcbZXmGgsobuAoTMWmoDqmE=@emersion.fr>
In-Reply-To: <20220408092803.3188-1-h0tc0d3@gmail.com>
References: <20220408092803.3188-1-h0tc0d3@gmail.com>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: David Airlie <airlied@linux.ie>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Is amdgpu_display_get_fb_info ever called with NULL tiling_flags/tmz_surfac=
e?
If not, there's no point in adding NULL checks.
