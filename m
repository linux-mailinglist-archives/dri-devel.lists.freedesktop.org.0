Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6181047CD2F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 07:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B76D10E6D8;
	Wed, 22 Dec 2021 06:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C1110E405;
 Wed, 22 Dec 2021 06:57:08 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id y13so4610094edd.13;
 Tue, 21 Dec 2021 22:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9CeDy0cY/8LVebjCd2we3QhNWuf9arYWuiSUf5Pgs4M=;
 b=FdUVRNrVSbSuJ7MChDz1b5Xs+JISpPF2e4HUJeFtrVGjFTbg4d6HUkqzm9StWpFlIG
 W48U2Wg0B9X0gKtTaIBZGELQ7CXwgCvf4Do4++NO/YFwzNuE1n0bIrT9jHepCePcTwPK
 Oi8tdstp22V9vpOklILVJwXIrug9B5X8MxGbzL0WWNkmL3QYirgHHMXBt6M0vfkGipED
 11xIY1eC24gkxu5PnRVFqPnikl4m2rSv7vTgV3b8pZy3re6QFK+AIA7SiXUW5TtDl7wW
 H0SD9zVKtsFsuYrkhFQF76xb1zl+9jClWtnT6OsiEa4mLaNzdOj9NNMXCWXxqNeUtZw7
 FTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9CeDy0cY/8LVebjCd2we3QhNWuf9arYWuiSUf5Pgs4M=;
 b=vriDJ1wNMLLREn9H1mve994IPUBi+AC46ykVOyF6YhtvGMKFxf5+8viFH1a+sSIoC5
 FMvpODEzLJwSmwsyphyiEBlqt1XBQsWsIQr3KL8e7p5TPXYKrpZgi/C2pQtCYgo5Uphc
 U2XHpzTXDejb3yQBryeVIlqsJ5/x39eAst54v/hNP5YaItFLLyWXpFRO0uRGSkoeivgW
 d3UkR4pAbHB/v8lW6l8emvRItmyJKZ6M4G1fT/0OwCIFBqwPcUyTDa83Kmq/o5UqJFSu
 u4KIixCi6OK+gRzh/b52gKBhnMu2B9+BXF0KTUM/HwIZ9JGE5VndcO1XPAcwEP9qp7I3
 rtUg==
X-Gm-Message-State: AOAM53020oaLA8rmBRL8vvJhYPhDch5atpn7K/E7ultc1u1Is17vEvfj
 5cSUu8n2H1lm6FUw46MzSqqJ5PS++BL7r+K+Oyc=
X-Google-Smtp-Source: ABdhPJzoCcBIV1hcRi8QZ/n41b9BeW2xWL1HgkCr0XN36iAmdtt2bD7yok8pPS5sz1qquLs2rPvVugBf6IaB7COh144=
X-Received: by 2002:a17:906:1643:: with SMTP id
 n3mr1317723ejd.733.1640156226632; 
 Tue, 21 Dec 2021 22:57:06 -0800 (PST)
MIME-Version: 1.0
References: <20211222001728.2514705-1-l.stach@pengutronix.de>
In-Reply-To: <20211222001728.2514705-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 22 Dec 2021 07:56:55 +0100
Message-ID: <CAH9NwWffjXG0M14R=5PEmf9hnpH15xpk2BmtNdE7qp3Q_R87_w@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: consider completed fence seqno in hang check
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Joerg Albert <joerg.albert@iav.de>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mi., 22. Dez. 2021 um 01:17 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> Some GPU heavy test programs manage to trigger the hangcheck quite often.
> If there are no other GPU users in the system and the test program
> exhibits a very regular structure in the commandstreams that are being
> submitted, we can end up with two distinct submits managing to trigger
> the hangcheck with the FE in a very similar address range. This leads
> the hangcheck to believe that the GPU is stuck, while in reality the GPU
> is already busy working on a different job. To avoid those spurious
> GPU resets, also remember and consider the last completed fence seqno
> in the hang check.
>
> Reported-by: Joerg Albert <joerg.albert@iav.de>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
