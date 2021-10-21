Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9EE4369FC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 20:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFC86ECEC;
	Thu, 21 Oct 2021 18:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1626ECEC;
 Thu, 21 Oct 2021 18:03:34 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id j12so925166qvk.12;
 Thu, 21 Oct 2021 11:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ahTjhG+0XwGPXkuz4VcTp647x3q9itqEoH0Ed4qOqpY=;
 b=gIQA320e8ybJjLG0nEu/Fs1KOwJll4Z3Mt9w3d6s5J9lQls3OplWxMgmyUcoQpeR4Y
 LR5n9HVlh/gubHMnLV6x6pxVB1PdhVGFV/pydvyrfJ68bewjmPGhZc0D26CusWnFWpWt
 i7Y2Qdg/V4SJXbTzRSXtn7qtcfP3FvlfvT+aTQ6JoCoq8QNPr9ciC4sVcnpJFp27uHmz
 iXszzsiNyDwfyoPc8vvS+FJ+10Iwa7M0O/HuBCMsYA5PMWmW8Dd5ME4a5J0ujSjF2LwG
 SC9LiYN+QvOSNvTwWG7CcV+m2/39US5m9MNAqiwbXKCskN1F3qSaFr1unKJHbXLFNOM6
 tGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ahTjhG+0XwGPXkuz4VcTp647x3q9itqEoH0Ed4qOqpY=;
 b=neZerAyEc/Un9L6SLok/QS82EXZoPELc8g1rairlQUNU5YxO4x2d8iOcUAKJHSTx53
 WixWjiR7lXMYL2PNF41ACrtDq41x8Ndv6COThPlTtv6m86fzggoKMsRCjedLKqQ7d2zs
 AYPBlmUmP5dAG6cZM/xZF9S3mSSTC2zkCh4pkuTKF8tBBt9JAH2HUGSn1ODS/O1vZ1Bf
 cm/0Xyzl0fNxKapz5jBZWKLEta4jaODW1w8uPXh7wS4a6PkF/qYHO+5qxNU2WQvozIxe
 cO8pY1my2raS2jbBBlp/3zBGDpwQoFhnaOYmdotNxesS+TVmc0LX4Gou4ScBBotNfwj1
 2wCA==
X-Gm-Message-State: AOAM5327XBSoyYJ2S5gAmZD/7Fg5hBhM9qU51oThs96U8UrJpSDgYqG3
 QUs03J+M509VbggKtHXMaOYqYp2Qi+jhK2It0r60240rHFI=
X-Google-Smtp-Source: ABdhPJzjgYwM7qnBZefaxcv1Izkb0kpr0dH9Oi1yk0tkrhL0/IiLAeX26bO7FrNQdyHPHg/prAiearqWkjj0HQ5atkA=
X-Received: by 2002:ad4:5948:: with SMTP id eo8mr6995705qvb.1.1634839413379;
 Thu, 21 Oct 2021 11:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-19-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211021103605.735002-19-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 21 Oct 2021 19:03:05 +0100
Message-ID: <CAM0jSHO1qugMmDtgJLsQaPvOnynPZaAb9xNNdZV87Nd2SsS11w@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 19/28] drm/i915: Pass trylock context to
 callers
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Oct 2021 at 11:37, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Needs a proper commit message.
