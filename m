Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B0B6BF002
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 18:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9F110EF54;
	Fri, 17 Mar 2023 17:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91E210EF60
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 17:43:04 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id eh3so23315756edb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 10:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1679074983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=juFDL1t+0yx3APjFMS4e9m1CxbDK324iou62xX9HrZ0=;
 b=bTlHBdyzTfOqjPOxk1tGF9VZcv8a9f6bQWnOymVjGeKDoIbFPWqa+rqgLXv1rwDC/r
 QkWwX/vOzr0gayxIvtdNJurapc5tYVJb5+o8rdh71kyTyKvxNkcnxXNrYMopTFe4jXU6
 iyIY3FXhXSNbwbMSsHk9IZ2eKXTC/mpojVJ7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679074983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=juFDL1t+0yx3APjFMS4e9m1CxbDK324iou62xX9HrZ0=;
 b=FkHCTSbGyvxU2uGqEC7VlTBcs+IQY7MUeB3wwCiQSO9EDpPU2S+wpivTBThMmVVsCz
 KxEWHWBJZUSe8rW89eSc8lmLEDLyxqpADEla9qsotEBaHlOGIr0bUeAZ3uZt7lTwkz2r
 RIkrQJTVGa2B729q5Z3os9GDYTB6JJHowauTODXzL6PRu7WWUcEb4SwwCiRlIEBFGRPm
 0+VOdyRWsjhK8rKCmw2nCtvChaOXSukIYKWKa0Ohl59F7jcJtYsXWjVBhGuGK983SYDp
 cIbA75b+4QbieCoD0GqmKS8stXxWHnpT12F0oHWWscdB0j4uLdUdDmZVCiBTU21TxCMb
 kafQ==
X-Gm-Message-State: AO0yUKU79BRw2U8k2p68om8OU2s4n3otSesL+0zyKuL+DxHF2fGqeaJb
 xQHOVJuWrqKAACR1lmAst6bGAF1lXFikY6YqPCNftA==
X-Google-Smtp-Source: AK7set8U4qkINKHic17mMYSYBvPU5AzgNM8duh1AwHoeBMs6qi3ZVYB0b1UXPS+ibSHMXmxyRg8rOA==
X-Received: by 2002:a17:906:1858:b0:92f:9fee:522 with SMTP id
 w24-20020a170906185800b0092f9fee0522mr164924eje.27.1679074982950; 
 Fri, 17 Mar 2023 10:43:02 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 i20-20020a508714000000b004fc649481basm1364747edb.58.2023.03.17.10.42.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 10:42:58 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id z21so23428686edb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 10:42:55 -0700 (PDT)
X-Received: by 2002:a50:ce54:0:b0:4fa:794a:c0cc with SMTP id
 k20-20020a50ce54000000b004fa794ac0ccmr2222273edj.2.1679074975032; Fri, 17 Mar
 2023 10:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230307212223.7e49384a@gandalf.local.home>
 <20230307212615.7a099103@gandalf.local.home>
 <b919b550-6da8-f9f0-a0eb-0fd8af513817@amd.com>
 <20230308074333.49546088@gandalf.local.home>
 <980021d5-09f7-9fc3-2726-44884a57822f@gmail.com>
 <CAM0jSHPf5u4=GGWm6x-zVkLA_LScAxq371ny2NoozuNjHfQefQ@mail.gmail.com>
 <2b7fe203-82f5-2726-cd64-01c7421560d3@amd.com>
 <20230315162011.351d0f71@gandalf.local.home>
 <20230315202133.7cb1a0fe@gandalf.local.home>
 <20230315202242.581c67bf@gandalf.local.home>
In-Reply-To: <20230315202242.581c67bf@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 Mar 2023 10:42:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjH83GOhjDaVnTUYfSf0XOLp-jpFACLSd8Uc59GzaCZug@mail.gmail.com>
Message-ID: <CAHk-=wjH83GOhjDaVnTUYfSf0XOLp-jpFACLSd8Uc59GzaCZug@mail.gmail.com>
Subject: Re: [Intel-gfx] [BUG 6.3-rc1] Bad lock in ttm_bo_delayed_delete()
To: Steven Rostedt <rostedt@goodmis.org>
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
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.william.auld@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 15, 2023 at 5:22=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> I hope that this gets in by -rc3, as I want to start basing my next branc=
h
> on that tag.

My tree should have it now as commit c00133a9e87e ("drm/ttm: drop
extra ttm_bo_put in ttm_bo_cleanup_refs").

                Linus
