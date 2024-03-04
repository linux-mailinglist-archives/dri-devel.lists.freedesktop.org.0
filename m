Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9222386F8C2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 04:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2311410FB26;
	Mon,  4 Mar 2024 03:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UksjCd1W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B2810FB25;
 Mon,  4 Mar 2024 03:03:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B665A602FA;
 Mon,  4 Mar 2024 03:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7ABC433F1;
 Mon,  4 Mar 2024 03:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709521390;
 bh=qw4NTha07yO8OXxY5DryR/Df1qykKh7rgNuoMQa8woU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UksjCd1WShioQl1ydEQDIgqJiksNETrmUKTvjQBRCQBOInBP/57XAAFJPytnzwVEo
 +8aStMsnvcisREJBGp64iiGyu3KlIOpmsaJ199tWX7dwLkP4dkmSC8vcxisH7k96CW
 sKsHSmJILvZZWS5zERBxfB26wRWzRRcan2QrTitBYELLktmA6N9K1idaLKd+8YULTm
 s4EGQ3C9uJ+/do+glf9/c+8IVeoEhdP3ZCNHObhgIS345JS+PKzdkY9G0vvRI0DVqr
 b6HmjR5zvV/snYlfAWpj0X499/DmZ4Y852th/urXAlgwOhlQ3GXeyIw1uq/hzTqrcO
 oXApG1vC+M0lQ==
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a4554d4cb62so36277566b.2; 
 Sun, 03 Mar 2024 19:03:10 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV9/+hKVUEo6svaGj1SeU0zRWSXSot2c/PZWGFV1zxsqnkx3n/cLeE4dlLseprRb0N2/US+jg1tbzSQSGRbfdmpyseRsQbQXHUUPfEVWHQj
X-Gm-Message-State: AOJu0Yx9A23+kTZj7XNU3+TIR63XDGckjL9klxVTLnUuEmWq4GaA0Tw5
 Y3CHCQbfAo6nWrS4t/RdbOzb9z/40npC8E8MqcvCfG+cNznN2VzJ6Z5Za6mUnhyubRlRRLKDtKj
 /IHo2+MCaVx8EI+sm13rVrgzm+Js=
X-Google-Smtp-Source: AGHT+IGfA7qFClRnZaa3hlQIfQnVKwgKJc+HOwvSJacvX1L7QULKO9WaR9WuKWvGawC2lOPW65eHH4op77JHipLOnis=
X-Received: by 2002:a17:906:a18d:b0:a3e:7a8f:27dc with SMTP id
 s13-20020a170906a18d00b00a3e7a8f27dcmr5133135ejy.49.1709521388851; Sun, 03
 Mar 2024 19:03:08 -0800 (PST)
MIME-Version: 1.0
References: <20240303081330.61091-1-duoming@zju.edu.cn>
In-Reply-To: <20240303081330.61091-1-duoming@zju.edu.cn>
From: Timur Tabi <timur@kernel.org>
Date: Sun, 3 Mar 2024 21:02:32 -0600
X-Gmail-Original-Message-ID: <CAOZdJXUebAScPBjJdCbdzzA_Hmotk11bd7MvLLxe+pqS5-upHQ@mail.gmail.com>
Message-ID: <CAOZdJXUebAScPBjJdCbdzzA_Hmotk11bd7MvLLxe+pqS5-upHQ@mail.gmail.com>
Subject: Re: [PATCH] nouveau/dmem: handle kcalloc() allocation failure
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Sun, Mar 3, 2024 at 4:46=E2=80=AFAM Duoming Zhou <duoming@zju.edu.cn> wr=
ote:
>
> The kcalloc() in nouveau_dmem_evict_chunk() will return null if
> the physical memory has run out. As a result, if we dereference
> src_pfns, dst_pfns or dma_addrs, the null pointer dereference bugs
> will happen.
>
> This patch uses stack variables to replace the kcalloc().

Won't this blow the stack?  And why not just test the return value of kcall=
oc?
