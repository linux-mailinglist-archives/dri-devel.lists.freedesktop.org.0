Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A70897457B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 00:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CCD10E910;
	Tue, 10 Sep 2024 22:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QzuHiKux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE7E10E8F0;
 Tue, 10 Sep 2024 22:16:17 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6c524b4a3aeso34989706d6.3; 
 Tue, 10 Sep 2024 15:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726006576; x=1726611376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHIg8i0gS3Bf6sinh0WN3XoEPUmj8P+7fJP2LdbCtG0=;
 b=QzuHiKuxfcRy4N10vLpbt5b+n+wvK3tSKyF/6vU83v4Qws2aJu3zPWdbuuHk4b5+u9
 PoivuPBvG9yObiUPKoVuavA8ZkSagV1ldSG2oq+/LTmnNApuU5VUipX4v5/zOsxR6LzH
 jo7AKve4sz+7nqhaZdNBRrUblbNNbcJM8BBEyyw6MQAohhGisYwoGt5XDT7VkldutpAM
 Bu374Lwn5uFhPNRGa/q2aUaBqkCAwz8hqYIh56H45Jwe6CvMM6Xgb1rY/OsTQcz5UCSG
 5LYXFS6qqnFdHmZcerK2JLFKPBOQwtUyuvwha8ZyHQMr6ezc0R7BySL6ynddIy3FceU2
 e0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726006576; x=1726611376;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHIg8i0gS3Bf6sinh0WN3XoEPUmj8P+7fJP2LdbCtG0=;
 b=vRcEjd/agHbSljiRfb0BnsJ5NMOSMlE71MumPZbexX7x2ZOSEwL8aZSdoj5rtJFa8S
 iOSpUrzwKrApMkLolR+A5/9Z3GKTo0bWNuewZ2RDUxk0GomqGlWRgGaT45Q3MjycgZzM
 m5hF6gZxdE/f/h3iCx/7O32HzXAIXiYsbp/SHGOND6XhgJ83hvTG5Kbb6a4st5Qk04Sf
 UQJ+SixTBk8/YGsk0Ip4qL4cNKQzZQL6pXKlR2tsmvkiydq3wncINVbgmP5UzNbQjO3c
 iiuJAJ6ks46oYoMMAGQDY5HBIglvG44iF87i/PJmSVUxdyX3XaIP6/t1G+p14/ULuDLv
 m7Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdlz72mbZQ/zkm1Dcx0F/61V4SUx8wEBxRUdgDzbbIM4IHpRcwuTLo+TPMVeQd0A1v2ZuDmYFP@lists.freedesktop.org,
 AJvYcCUu0Hp4cOd8O3Py8y9WZBxRJKEeT2IybLDC5UvLMxSGQ1EfY/+bBDyD5f/A/AE+AlALHjqvnnSJ4eAl@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw4H9X2whs3GtnKBWjowEsDWmDVuBWK7VgsCRcw/EIX+5DI19Z
 3oMc0PrU4fDTj+0MsANG4RgTdfm8pY3gnzSCq7Ijur+pwg5dXK3ifvdguLXMV36gJE5KRFSqmZ+
 t9q7ZEgB6rIB6vT74NSJQkh23iLE=
X-Google-Smtp-Source: AGHT+IH6j1CjcbCzXOH1/LDwJczOXPOc2Hu+rc7nUbxX9+q+uyt7yEQs7pN/cUoLVtxP6duCgszTtKHpKX9DYMGhazM=
X-Received: by 2002:a05:6214:3d08:b0:6c1:6b4c:6ba4 with SMTP id
 6a1803df08f44-6c5282fd494mr199592026d6.8.1726006576325; Tue, 10 Sep 2024
 15:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
 <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
 <CABXGCsMdxHJ-MLkS0pm51Sk8g0PTghsuZxmowvj5t44bVN4ndA@mail.gmail.com>
 <ffd2c40c-1c2e-4465-b26f-88d5e08a80d9@amd.com>
 <CABXGCsOoL5vD0+FRALFQFr3ZBpb2z5mpGKzAD5RHoW9_sb5yaQ@mail.gmail.com>
 <f68020a3-c413-482d-beb2-5432d98a1d3e@amd.com>
 <CABXGCsMSTsBFW=OirDszPFVOiNgyOBSh3qyzAw-Coi-McnicAQ@mail.gmail.com>
 <04d3755d-f295-46d7-b35d-008b888b39ae@amd.com>
 <CABXGCsMDk59-P0Nr1v7KajKsoQh2966mykLPWQxajPtq=OGgXg@mail.gmail.com>
 <eeab54b4-c055-4992-9ca4-f9e382db68c4@amd.com>
 <6db472e4-cd90-4ba6-8368-725b10ba5b4a@amd.com>
In-Reply-To: <6db472e4-cd90-4ba6-8368-725b10ba5b4a@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 11 Sep 2024 03:16:05 +0500
Message-ID: <CABXGCsMaXUjHyySQqw7fPmoyDHSJ0yc0f6NPfOU2BRd_Hvj8TA@mail.gmail.com>
Subject: Re: 6.11/regression/bisected - after commit 1b04dcca4fb1, launching
 some RenPy games causes computer hang
To: Leo Li <sunpeng.li@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, zaeem.mohamed@amd.com, 
 pekka.paalanen@collabora.com, "Wheeler, Daniel" <daniel.wheeler@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
 Linux regressions mailing list <regressions@lists.linux.dev>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 10, 2024 at 8:47=E2=80=AFPM Leo Li <sunpeng.li@amd.com> wrote:
>
> Thanks Mikhail, I think I know what's going on now.
>
> The `scale-monitor-framebuffer` experimental setting is what puts us down=
 the
> bad code path. It seems VRR has nothing to do with this issue, just setti=
ng
> `scale-monitor-framebuffer` is enough to reproduce.

I ran some additional tests:

1)
$ gsettings set org.gnome.mutter experimental-features
"['variable-refresh-rate']"
Symptoms: No

2)
$ gsettings set org.gnome.mutter experimental-features
"['scale-monitor-framebuffer']"
Symptoms: Screen flickers happening when moving cursor.

3)
$ gsettings set org.gnome.mutter experimental-features
"['variable-refresh-rate', 'scale-monitor-framebuffer']"
But Variable Refresh Rate is disabled in the display settings.
Symptoms: As previous - Screen flickers happening when moving cursor.

4)
$ gsettings set org.gnome.mutter experimental-features
"['variable-refresh-rate', 'scale-monitor-framebuffer']"
And Variable Refresh Rate is enabled in the display settings.
Symptoms: On Radeon 7900XTX hardware computer completely hangs without
any messages in kernel logs.

On Wed, Sep 11, 2024 at 2:11=E2=80=AFAM Leo Li <sunpeng.li@amd.com> wrote:
>
> Hi Mikhail,
>
> Can you give this patch a try to see if it helps?
> https://gist.github.com/leeonadoh/3271e90ec95d768424c572c970ada743
>

Thanks, with this patch, the issue is not reproduced anymore.
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

The only thing that worries me is the thought that the problem with
hang is now hidden.
It's one thing when the GPU hangs but the system continues to work,
another thing when the system hangs completely and even
Alt+SysRq+REISUB does not help to reboot the system. It shouldn't be
like this...

--=20
Best Regards,
Mike Gavrilov.
