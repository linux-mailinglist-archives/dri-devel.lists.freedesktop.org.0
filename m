Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA267AAC14
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 10:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EA710E63C;
	Fri, 22 Sep 2023 08:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C61F10E606;
 Thu, 21 Sep 2023 19:41:27 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-503012f4e71so3083253e87.0; 
 Thu, 21 Sep 2023 12:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695325285; x=1695930085; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PjlD8L8cTLdUG0+w/e4Ua8C5VRk26uNi+6g6QFMuvGA=;
 b=gjUZdmvdKaaasJoDrVjdSRyVI+/pHB92YfYta7VGTBXhvZTyycYxMTmw04Vk/vQfKH
 9piASzUN/sJmvt8rOtnfNXvuNwKJg8C+Aq+q3stPMU7fO1jBAo36lgebtiqboHAq9Fuf
 m8ph69chWlzECCxavCCqg3/VolPGwqjgFI+mVpNeSgCHeTuVKC7OipG3nzwPBHD1egFE
 pHanC3HlmM1jsyayiU+a6M9Cj4mz0rTHOH5LJ2eobHAR4ukEFLuiNPfzqU//GDDNVKBn
 NGWKPFV8ibJOeIRjoY75vCIOM+TkgNJVI/jl28v2fiio3NWm1iE7Ll1BZM1glHtXItXN
 wTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695325285; x=1695930085;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PjlD8L8cTLdUG0+w/e4Ua8C5VRk26uNi+6g6QFMuvGA=;
 b=GpHlWHLuSngLO9VK9rPsqtopDqqLBPE4EjuEXY811tbC6Fzv5B6hzMOZGcSEotBspa
 7ZgLL5n5Tw5NTQe+yFs3fFk+8gncyhD2VOXm4LTVAjRDuU6s1k7anWyFYcBKqNV2a6n2
 Mu2bhJxSlN6Txg3bBgXmy6RLFQmMdcquUG6ps5vDuWIosnQuTQSokqyvgvjKY1gti353
 0Wr/367yLJxTJUBJhV8ndXaKFWiLmPh8k1I9xZK+Wo2rZuw1wggQYrbGqxwVJ2WFYHRQ
 Y/Y5dFS2vzin5MJM+gtgEU5upaFtu3XmmY2ErO+8BPFDhpmMyoiai/ymkR24h3qQP8DH
 wByw==
X-Gm-Message-State: AOJu0Yy8KLCAkENQH2p0h4Oxjq+01vgPhd4DDYP3V0OK6UIMVHli/V84
 Zi8UNyvuqVTNLj+ZLHq9QDpk9hykqV2h11oplVMJYWd/150=
X-Google-Smtp-Source: AGHT+IHVw/NQAMmXY19LOUO9t/hmOB1a1iIMdElTIh8JV1uvAi7IVvRJ24mccR/HmjjnPYXeAS6P8ZjbxYLQED0RMGA=
X-Received: by 2002:a05:6512:3d15:b0:502:d973:3206 with SMTP id
 d21-20020a0565123d1500b00502d9733206mr235846lfv.6.1695325284922; Thu, 21 Sep
 2023 12:41:24 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Thu, 21 Sep 2023 21:41:13 +0200
Message-ID: <CACna6rxtaHG6QTinuHyNyA7rck_aEBiMHtxSCLktArU1OoqxLg@mail.gmail.com>
Subject: WARNING in amdgpu_sync_keep_later / dma_fence_is_later should be rate
 limited
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Pan Xinhui <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel <dri-devel@lists.freedesktop.org>, Lang Yu <Lang.Yu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 22 Sep 2023 08:12:16 +0000
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

backporting commit 187916e6ed9d ("drm/amdgpu: install stub fence into
potential unused fence pointers") to stable kernels resulted in lots
of WARNINGs on some devices. In my case I was getting 3 WARNINGs per
second (~150 lines logged every second). Commit ended up being
reverted for stable but it exposed a potential problem. My messages
log size was reaching gigabytes and was running my /tmp/ out of space.

Could someone take a look at amdgpu_sync_keep_later /
dma_fence_is_later and make sure its logging is rate limited to avoid
such situations in the future, please?

Revert in linux-5.15.x:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dlinux-5.15.y&id=3Dfae2d591f3cb31f722c7f065acf586830eab8c2a

openSUSE bug report:
https://bugzilla.opensuse.org/show_bug.cgi?id=3D1215523

--=20
Rafa=C5=82
