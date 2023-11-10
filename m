Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C298B7E7921
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 07:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3762E10E697;
	Fri, 10 Nov 2023 06:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 568 seconds by postgrey-1.36 at gabe;
 Fri, 10 Nov 2023 06:19:15 UTC
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0356410E697
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 06:19:15 +0000 (UTC)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 87E853F129
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 06:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1699596585;
 bh=dbMwBXBmEotT6dk1rDXulRhL3RKiFgxFvFzDuEEcJx8=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=KZM9uTxedJKiGXsELffIS/EpGGq5PCy6sEcg7yGMzuYDs7q2U3LhdT0a2xYjwo4Q0
 qysXrhOCgaDgXqyVAOM3oonLI5lCPq2Q/Zr6c5DLdHv15OnvFmEEmxTfGJlj3RVCt1
 UCeb7chPeGX4ugVH1xtOmr+sIfevvV4QOtsJjxcIAteoiEHZA8e1tPFUQwD2Bvd/Sg
 9QS5EE/NpPOY3jlf02EdiSNYk43mLJQJIwIaFACL9LOrjRVsiARyUurdPCo8nrvSdC
 LRozsIJGj16Ay1HdAr8eraT6N/v0Kv/d8dQPw6zsTRWmArDVOgHbVLfDf1iRLgZkj1
 WlOrssekXx8pA==
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-280997b23eeso1684144a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 22:09:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699596584; x=1700201384;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dbMwBXBmEotT6dk1rDXulRhL3RKiFgxFvFzDuEEcJx8=;
 b=Pf50mK35tYWXKXrupZrkWrt8G62o/WscxafCjSNSvSGycry8ESDJ/b9U162lBvuufV
 hEhhGdX5uCvp/jEqtxP1Fbey++HLnvK424YD9C9EQjMoB/yKibkTeD7LhiG57ac/ShKz
 GN1vA+QaLn3ZQXgnQRuN5NltLWOs//CyEPdxeV89xXTobxDAFv7qn049uA/DaGZqkIe2
 IkLoz/BCWAaesPvn561LNpD6d1JzLTY7SI4WO/vaCU1Q0ZdbLSS4Csj9kyoboHRMKE9a
 VzMYOrlk37JJX7MhE8zQ98AMU2FYP12KrGU3tcWYLJfwc7XKRe/EOscfoYbJCrsu8v7G
 g6Pw==
X-Gm-Message-State: AOJu0Ywv6NsudD1sPZzHTT2gER/Iq8tuZxhQXgQEdmYdy968XDhgjGD9
 7CLRKXEsgeJ8Om3Zde0JgiZMRlz4TI0K4pH8LV0g4X1ou+wYDea1wU2pmsr488b8K6U0FaydA0p
 856Vx2yTWBRmo/bwbp7K9yJh70Uvn2fwRujlD78o6TFFiKRblfhW/wEGtBYVxTg==
X-Received: by 2002:a17:90b:4c85:b0:280:6296:3d96 with SMTP id
 my5-20020a17090b4c8500b0028062963d96mr3622952pjb.41.1699596583961; 
 Thu, 09 Nov 2023 22:09:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1wROyFVtufgqw/ZeSGGAbm8xifOocKozGCKWAhapxnMtc++Zwn+hYm7Zub9ci/y6pKeOOqpv3+EKkV4NfDoY=
X-Received: by 2002:a17:90b:4c85:b0:280:6296:3d96 with SMTP id
 my5-20020a17090b4c8500b0028062963d96mr3622942pjb.41.1699596583634; Thu, 09
 Nov 2023 22:09:43 -0800 (PST)
MIME-Version: 1.0
References: <9f36fb06-64c4-4264-aaeb-4e1289e764c4@owenh.net>
In-Reply-To: <9f36fb06-64c4-4264-aaeb-4e1289e764c4@owenh.net>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 10 Nov 2023 08:09:11 +0200
Message-ID: <CAAd53p7BSesx=a1igTohoSkxrW+Hq8O7ArONFCK7uoDi12-T4A@mail.gmail.com>
Subject: Re: [REGRESSION]: acpi/nouveau: Hardware unavailable upon resume or
 suspend fails
To: "Owen T. Heisler" <writer@owenh.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: regressions@lists.linux.dev, Karol Herbst <kherbst@redhat.com>,
 nouveau@lists.freedesktop.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, stable@vger.kernel.org,
 linux-acpi@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Owen,

On Fri, Nov 10, 2023 at 5:55=E2=80=AFAM Owen T. Heisler <writer@owenh.net> =
wrote:
>
> #regzbot introduced: 89c290ea758911e660878e26270e084d862c03b0
> #regzbot link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/273
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218124

Thanks for the bug report. Do you prefer to continue the discussion
here, on gitlab or on bugzilla?

>
> ## Reproducing
>
> 1. Boot system to framebuffer console.
> 2. Run `systemctl suspend`. If undocked without secondary display,
> suspend fails. If docked with secondary display, suspend succeeds.
> 3. Resume from suspend if applicable.
> 4. System is now in a broken state.

So I guess we need to put those devices to ACPI D3 for suspend. Let's
discuss this on your preferred platform.

Kai-Heng

>
> ## Testing
>
> - culprit commit is 89c290ea758911e660878e26270e084d862c03b0
> - v6.6 fails
> - v6.6 with culprit commit reverted does not fail
> - Compiled with
> <https://gitlab.freedesktop.org/drm/nouveau/uploads/788d7faf22ba2884dcc09=
d7be931e813/v6.6-config1>
>
> ## Hardware
>
> - ThinkPad W530 2438-52U
> - Dock with Nvidia-connected DVI ports
> - Secondary display connected via DVI
> - Nvidia Optimus GPU switching system
>
> ```console
> $ lspci | grep -i vga
> 00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core
> processor Graphics Controller (rev 09)
> 01:00.0 VGA compatible controller: NVIDIA Corporation GK107GLM [Quadro
> K2000M] (rev a1)
> ```
>
> ## Decoded logs from v6.6
>
> - System is not docked and fails to suspend:
> <https://gitlab.freedesktop.org/drm/nouveau/uploads/fb8fdf5a6bed1b1491d25=
44ab67fa257/undocked.log>
> - System is docked and fails after resume:
> <https://gitlab.freedesktop.org/drm/nouveau/uploads/cb3d5ac55c01f663cd80f=
a000cd6a3b5/docked.log>
