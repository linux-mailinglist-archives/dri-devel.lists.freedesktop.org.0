Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC840D113B3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 09:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC3510E262;
	Mon, 12 Jan 2026 08:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FKNuU499";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4955610E316
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 08:15:11 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b553412a19bso2800452a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 00:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768205711; x=1768810511; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5iyGrD6t4jKVWo1soh2XCJ43j2Qzm08eL5ZkM2bIbFI=;
 b=FKNuU499Ev9CTWZEL/m6BnJOn6J91cTqYn9oa0RV8hadQelaRgcs4HhqgqpBt46xJa
 3NFs2szK3o4FiNduhYLqtidstEp6++dYnLOpKeL/EnBaDjW7BL6jpYEzRA2Fp/LKom97
 xqJ6tAmSjurprLShayHEvVqWYsTpq2Zy2aUYLP/5CcSJBsdVz5U6+Sz6SWzuAe2LtMN8
 vUJj5UvhRD18f8KtrSbrctw0+ljncygvH/qNBOTbdbEIZXKMHomXu/41SSzLEKsZXSSM
 H7mAqLUv95IMLr7rqNxyHkX1gzxhkAgjkKkgynZOeaEa2KO6fjcxnI+SuBO8rijh+lP3
 lAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768205711; x=1768810511;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5iyGrD6t4jKVWo1soh2XCJ43j2Qzm08eL5ZkM2bIbFI=;
 b=o6bySJeneBhruF0aIi0O07DUj8ykemQJKx6J8adxEKMoOX4Elve2HZxVjmYLLOQZTB
 ntl7z2x/1WvXXuiVmE7/Vzrx6Fpg6BBeDW7F1E/89PlwpUiT3VvwyrbUWM05zblpm0k7
 p8uh5Gg1UnbcCPmGcwfkJBjB5cjfAKKuutFnsmNWuU2ZaPQRIjt1DFxzQKsS9fhhVHel
 LDjgENM0s5L+Zc7y0q7PaasjL8fb9ezL9pBLxc53eC6ciGzau4LFzFLk0eSCbYGBfKY0
 zmIf46ohvyjeE8qcWt8SuY4hdKo9ucmfGvxL5XISvrC4bAIVpXlFBZPZpUme9hZcyFZ5
 KAng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgcQGnDSHELVX6qmfZJ4QMorccqKz0IQtDRgSVIx1n7iK5130UZlK2IZZguSDIMxD8sGZ4/dwV/PI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywh9uLsIqDwhE7lEDX9FIF+6wJ4CC/FZ9bPgLTIt6+4HCkc6ZZx
 xresld8vTwVlKL10b4rnVklHh24hKme2CNSV3fNX+b+zMo/xwqKQ50v3rhXbddTm+GbZQVchWYL
 7aG843CKAfm2+qdzHr5+L4NbbtYaQ/QY=
X-Gm-Gg: AY/fxX6DGHGaadmMuSamu+J5zplVNY5Q52Waab4LtRYQbgBHSS1bdwdBE+BVQMtciEy
 RdTaH7H+tVGpBkjTK1dj3nTPtWlHF4gePTTgxhCEjWXXuL0CAFjCA1rmgWtfwCrqkyBgtwlAQdh
 T2HkUl8N4TG9j9fPcxhXK1iycN+XgMx8ViMQkOAWF2as7OxjQXeKsk2QMA2FhInKpVOPFZ6SFWx
 zKxiqFaPIwV9MfnVKAtLufCO9MNbqd0RmTfT6gToyRCP0TrJMw3JBnlHy+7BADBc0VMpt0VkL3C
 vkcQujc=
X-Google-Smtp-Source: AGHT+IEO6LjtBiiTakABt83pr8vBjMWsli6acZVk0wkTf7Od07uEXvjAYcspCT/ZRXWJY1wLF7d5BoH0Kph9pg0c/zw=
X-Received: by 2002:a17:90b:2741:b0:341:88c9:aefb with SMTP id
 98e67ed59e1d1-34f68c0241cmr13310625a91.5.1768205710536; Mon, 12 Jan 2026
 00:15:10 -0800 (PST)
MIME-Version: 1.0
From: Xingjing Deng <micro6947@gmail.com>
Date: Mon, 12 Jan 2026 16:15:01 +0800
X-Gm-Features: AZwV_Qg4Brt-nf3YdMPJ1efWhynaAQd8e05kQhY2LdIZ369g5-5ixvAbos9jnQA
Message-ID: <CAK+ZN9rJypDknnR0b5UVme6x9ABx_hCVtveTyJQT-x0ROpU1vw@mail.gmail.com>
Subject: [BUG] misc: fastrpc: possible double-free of cctx->remote_heap
To: stable@vger.kernel.org
Cc: srini@kernel.org, amahesh@gti.qualcomm.com, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 12 Jan 2026 08:31:58 +0000
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
Reply-To: micro6947@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While reviewing drivers/misc/fastrpc.c, I noticed a potential lifetime
issue around struct fastrpc_buf *remote_heap;
In fastrpc_init_create_static_process(), the error path err_map: frees
fl->cctx->remote_heap but does not clear the pointer(set to NULL).
Later, in fastrpc_rpmsg_remove(), the code frees cctx->remote_heap
again if it is non-NULL.

Call paths (as I understand them)

1) First free (ioctl error path):

fastrpc_fops.unlocked_ioctl =E2=86=92 fastrpc_device_ioctl()
FASTRPC_IOCTL_INIT_CREATE_STATIC =E2=86=92 fastrpc_init_create_static_proce=
ss()
err_map: =E2=86=92 fastrpc_buf_free(fl->cctx->remote_heap) (pointer not cle=
ared)

2) Second free (rpmsg remove path):

rpmsg driver .remove =E2=86=92 fastrpc_rpmsg_remove()
if (cctx->remote_heap) fastrpc_buf_free(cctx->remote_heap);
