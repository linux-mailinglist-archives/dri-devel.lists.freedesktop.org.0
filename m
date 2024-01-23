Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23022837DB6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 02:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A6710F294;
	Tue, 23 Jan 2024 01:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75A910F294
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 01:27:16 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40ea5653f6bso32437805e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 17:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1705973175; x=1706577975;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=br9E5KI+nUh9y1ENUcsXEpHmHOk92uTJMp6hh/0UfzM=;
 b=CEpX/mWj0TmiJTkOrtDV2xtLyeFsSLloQh5HkPgv0kRUbXk4e7EROhG4iw+qKaAPUC
 Xx6bjsHUvPiWYhSejYPy2/HbgdSUnbqY1bD2qq5dCTQ0gS9a/h/PKbD5DxIWQzD8mIzp
 tZIcZkndRpJ2isjoNMljq4hz1KF+dfsWv5o6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705973175; x=1706577975;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=br9E5KI+nUh9y1ENUcsXEpHmHOk92uTJMp6hh/0UfzM=;
 b=BM6qdUbZ8RUUukF6vDRV9rGEaM7xZoCrpQdKEVPLRzr+RxMk44h0pHKrqHn1Dq4ht2
 S0BJCuc4lTq/BM17xKuLAdA/cz+czgalAOXu191zKSdM+9X+KUsp1BH6qLU6/mkycWsQ
 GyLMIGaKtLQdEPGS2UmPItkBgIDgR+30Ld8yJnY+iBGVh6LRli2aN1jATOFzir4iUL6E
 YgJz2Hb20WKyFD+jJBTHTrVhqGyvOS7jTkyjBe1902vnAzsDRzWhRJZcMcuRiuWW7Nww
 tFvVCJE/G/a803zwn8RgyBosPEpkdkfnqpbmuHlmi4icUL9LFHlPYAWkVMYflZSZX3/k
 fUHA==
X-Gm-Message-State: AOJu0YwnevjNGSect3IeqRaJayaPnMlp4MkKxMvs6WCpi5FtDHX7DZ2r
 ytMdTof9AdBsxmIeDqlsGZJrDLML4lJhzzN0sMOnCAyWFTy2/bS/O+uHP2o8mmwIujE1zvo63Au
 pLUlN5Q==
X-Google-Smtp-Source: AGHT+IEmEQ1a62y+LN/C7616/AsafX90/68rgD5tSu5ZW6YndDiiV+jpjihMZKSzmbifkMKM8MEwqw==
X-Received: by 2002:a05:600c:4e09:b0:40e:ab7f:3442 with SMTP id
 b9-20020a05600c4e0900b0040eab7f3442mr54519wmq.85.1705973174973; 
 Mon, 22 Jan 2024 17:26:14 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 r5-20020aa7cb85000000b0055974a2a2d4sm9492168edt.39.2024.01.22.17.26.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 17:26:14 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-55c33773c0aso1552735a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 17:26:14 -0800 (PST)
X-Received: by 2002:aa7:c887:0:b0:55c:6df8:e18b with SMTP id
 p7-20020aa7c887000000b0055c6df8e18bmr400918eds.12.1705973174033; Mon, 22 Jan
 2024 17:26:14 -0800 (PST)
MIME-Version: 1.0
References: <20240122180605.28daf23a@gandalf.local.home>
 <20240122181547.16b029d6@gandalf.local.home>
 <20240122181901.05a3b9ab@gandalf.local.home>
 <CAHk-=whry+-JUDiiCkDkDn2TDg7SA5OvZpPbcQ_jkM_J5=ySdA@mail.gmail.com>
 <27c3d1e9-5933-47a9-9c33-ff8ec13f40d3@amd.com>
In-Reply-To: <27c3d1e9-5933-47a9-9c33-ff8ec13f40d3@amd.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 22 Jan 2024 17:25:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi9XK=TQ7tk6+2ymx8Upm6r36vY6wF9REpt1sho2ySteg@mail.gmail.com>
Message-ID: <CAHk-=wi9XK=TQ7tk6+2ymx8Upm6r36vY6wF9REpt1sho2ySteg@mail.gmail.com>
Subject: Re: [BUG] BUG: kernel NULL pointer dereference at ttm_device_init+0xb4
To: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Jan 2024 at 16:56, Bhardwaj, Rajneesh
<rajneesh.bhardwaj@amd.com> wrote:
>
> I think a fix might already be in flight. Please see  Linux-Kernel Archive: Re: [PATCH] drm/ttm: fix ttm pool initialization for no-dma-device drivers (iu.edu)

Please use lore.kernel.org that doesn't corrupt whitespace in patches
or lose header information:

  https://lore.kernel.org/lkml/20240113213347.9562-1-pchelkin@ispras.ru/

although that seems to be a strange definition of "in flight". It was
sent out 8 days ago, and apparently nobody thought to include it in
the drm fixes pile that came in last Friday.

So it made it into rc1, even though it was reported a week before.

It also looks like some mailing list there is mangling emails - if you
use 'all' instead of 'lkml', lore reports multiple emails with the
same message-id, and it all looks messier as a result.

I assume it's dri-devel@lists.freedesktop.org that messes up, mainly
because I don't tend to see this behaviour when only the usual
kernel.org mailing lists are involved.

              Linus
