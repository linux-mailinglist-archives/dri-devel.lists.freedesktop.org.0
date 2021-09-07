Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB946402704
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 12:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF7E89DBC;
	Tue,  7 Sep 2021 10:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E97889DBC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 10:19:08 +0000 (UTC)
Date: Tue, 07 Sep 2021 10:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1631009945;
 bh=bFfvke7Eo85dv0zGzdaATTjtLzFdrzIM8qrpbP/LdrE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=NjsvTjMLEFq6si/69gFED52yGLBSaOPWkNIXS4vCEXFVXIEeagCySHn7OrLTFy3O3
 PWktZTejdb0TUbD0tHmw3sWppO2yeEsrWS3NrXherqq4QkbASXIZMUYxq9SJw8w7UN
 falxF0uRTLS9lZagupnsZ7DzzEm77YW9aTRbawoMKnk4zEV2uzHdmQ+D/1aseXX+pn
 f5mS2m+p7lmI3Q9y3WdrxCd4qJMRdVI+4aRO2I3qfVkB1+GjRZbuuvuH4ksV9FKCKL
 +KDDsD73CIc4N3qAbWiuuEFnnl3AKytndJKxJNu5qCzbTXUWAPD5riCVOveLfzaNAJ
 cuxZW/x+wnbkQ==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: Dennis Filder <d.filder@web.de>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>
Subject: Re: Handling DRM master transitions cooperatively
Message-ID: <Kh2hM9odvPcbqNUxhSEwQbnUCLt6nyrAzGhxnQ0JO1CcAzI6y31enf8_AmgAynFxWo3E1QUlW1m8UvKPDAq0gFLQi2CF1b3FFNMRfiUzOAI=@emersion.fr>
In-Reply-To: <20210907130746.7b667dac@eldfell>
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FWIW, I've just hit a case where a compositor leaves a "rotation" KMS
prop set behind, then Xorg tries to startup and fails because it doesn't
reset this prop. So none of this is theoretical.

I still think a "reset all KMS props to an arbitrary default value" flag
in drmModeAtomicCommit is the best way forward. I'm not sure a user-space
protocol would help too much.
