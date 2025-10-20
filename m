Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF49BBF20C6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A70410E29E;
	Mon, 20 Oct 2025 15:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EvSu3ho1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B5610E29E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:17:00 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-426f1574a14so3330421f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760973419; x=1761578219; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDTK735AtuvvXpuAH2jZcOxzUM5aYc0QEvIl8NwZbRs=;
 b=EvSu3ho1EhQm/cJ+Pgc/1k1b/xi1w/NNnqizvqDASvbI/VA/QjpFTOVEebs7KaxhNL
 a50Wccj+b0gC5/FSvIo7rfPle6ShtP1Jmk5FuawSvEL6qXNlUrfjP0aXgjT7kU/tuFbH
 R+AGTJdAadOWD9cO7vUDNwiOpvt5hXArwMst1D3FPzmHM6u0MnWzxh/8pVQniiMIpegC
 sAWAEGP6gvTW+Qbf4M35GMPPE4aKsCrvE2Zf/lM3nxe2YfPCG6sXysKNeMi6X3mM/+DI
 xcLkumwBLQVIqXQtYqC32AmoEmjZx5j0fR3uJlsUj/nr55UpuH0z64Ll3IBhCnrEHFnK
 MVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760973419; x=1761578219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WDTK735AtuvvXpuAH2jZcOxzUM5aYc0QEvIl8NwZbRs=;
 b=pdEN4gPl9I/wO00/ieMUUvxG+t1zBcy3XGpdwXVavWXCR4ygJpINGT26OsqqkfMkwV
 QCzrVA8XH0lkU/FFwzcCsAVko6d/Y54uUXgMUKPDNBVusyexO4V3E/1iGhLYMVOYhcpb
 UGEvUKg14sBKSjLEjNvYvRA0BtLMHmvb37D3zglmCVSsefC01fBokQtJAXNKemMIc3yE
 JhgyUr0RFYhpAh+qFNA89/NxKzAUO71d1Q+q3o9cO16xQ6a726q/ZWj6BnfLM7yy2ixn
 C8lkD2cbv330MmzmbIKyNyofYGaU5gKAjFQW9FLJIvWTNEkeV63Zmzp3TbptNyvkicaa
 UzVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFt3VMzcA8NRSI3Q7y/m31D3sbg4pQ1rOqdw7TmeklyN9a70hdI7+FBE6v/PYbS+FuriWVDjxsAqI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe7D6laXMoobQvpJ5UKfUVz4o/3RQD2L7XKIy40VLGMV8ZSYy/
 WmkWPQJ+89vDHJF0NwqL0dbxwwDOXmInmtPNUyTSsyHcJ+Bt94WTQ3XM
X-Gm-Gg: ASbGncsbvYlXwqh8M1QemwH1ufcjnU6qcPrGmDTpovGTV+dvBB+NUyhZlOrlvGMRINs
 Fv+k4cujx3k/esD+suMoprDQSvju731gstopNSqPCJtfsZ66It/pF4mv7zkxgRWyHmGGxf3v3t8
 0sfQKDjqGcBgAkxkghztyyNmtus2QkRRxTPSQLvqT/tC0FcTXPLPywk9aBE5u0biTA/9ytBFqYS
 R+96pP/9bFD/4tPfQYj9KBrRKqBjHXrv7SX0e1BHDc5DbfPABrwiI5wWxriXwwiv3WpyHfAk8dl
 s0bfKTfZUhwj1bTOpOeGB9SYvv9ckF+KFOaTAdHk3j2+kil27aFcGS2Fdfu9O8C/QB72el9MzWC
 hMpwMZj5sapXgPUAb1awHl8ZcCgmuICSD+yCmxcURSMYVZ6uwm3cXVmUZzK/gw/O8ZHxwF7vWzP
 c87ruvpDg9vg49+j9oaUu2rt8SOVja4RBsWJKREV78WyrBJwKqxLegMck1J3y+kPFTPkePVB/T/
 +8wRw==
X-Google-Smtp-Source: AGHT+IHuatsA0TU0EmQKM+VXdnR7vrkcGarcXxG+sRi8D6g2SyDjbiauw6mlCHoTUL7foxjJl83n3g==
X-Received: by 2002:a05:6000:400a:b0:405:ed47:b22b with SMTP id
 ffacd0b85a97d-42704d8352cmr9048390f8f.10.1760973419140; 
 Mon, 20 Oct 2025 08:16:59 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce56csm15655444f8f.50.2025.10.20.08.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:16:58 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] MAINTAINERS: Update Chen-Yu's email address
Date: Mon, 20 Oct 2025 17:16:57 +0200
Message-ID: <2801089.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20251020045603.2573544-1-wens@kernel.org>
References: <20251020045603.2573544-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Dne ponedeljek, 20. oktober 2025 ob 06:56:02 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The email forwarder I'm using has run into severe problems with Gmail
> lately. Switch over to my kernel.org address for kernel development.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


