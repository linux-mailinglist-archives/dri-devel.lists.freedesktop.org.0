Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9A630D63F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 10:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D29F6E3F2;
	Wed,  3 Feb 2021 09:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF19A89D7F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 09:27:18 +0000 (UTC)
Date: Wed, 03 Feb 2021 09:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1612344437;
 bh=wDmGfcNaRQ02D+Bbx4KZhGu1gWdYBGhDe+kndLG5HCg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=YbB98T5ojA5Ae6kPzhBHgrTO5+Fe4xMg46m6uaLRRtM8ITxEncUcYaFjItNRVPrDN
 Cqu0yJ5cjCNdKY6icB8Zb7vIbtpnFdlNQc5FcLA/XJcz4EiakyUGW2AnmHI6LNveHM
 Xq6SUae+uM4NkSbbi1h3vYXqmiIlU8lgh1mcoTWC7PpT2bexwx0wSHERnZCeJ6w6vY
 pL4diXdNLQ+8jjP9ZYjXxh4lYv8/6QHENSWBTrpLDwAAVTAOJq4dXvGvyzIGnbRBUM
 ooYC7C5QGmLiLG1rlY1mAnSZMhkvGSI6VHCC/RIFBCgy3EERTqT1Gr8NQ6iQkj/jyt
 WwEEsKcxdn/pg==
To: Emil Velikov <emil.l.velikov@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
Message-ID: <1eXnpBNSePW1qsq6q5BR3IEa6Q4DGeWBmJ23QArM9eGt12sN9W2Mhpk2OkUwZj-fhRjAtf9XNne5vxJ-7_JjPl549Ml3wxwMo0hhKsojL_4=@emersion.fr>
In-Reply-To: <KZZVYm0Qza351oOJ53ZX0pUcEa6NRh2sJJiq5OR2IjRlmJsdCZXRusR3ZuiiL5dqUgpR_STva8ySdYIJAUnSHVkU5HnNLzC68pNSEcuYdcA=@emersion.fr>
References: <20210202224704.2794318-1-emil.l.velikov@gmail.com>
 <CABjik9dde-HCWBsfwxjD+jTKaoy-YxDeSObmH7X5rSzNHoA_qA@mail.gmail.com>
 <CACvgo53wJ2XrLRBy4ysOBfU5TFo7nBwDS_CyrPkB1rotJXW5Nw@mail.gmail.com>
 <KZZVYm0Qza351oOJ53ZX0pUcEa6NRh2sJJiq5OR2IjRlmJsdCZXRusR3ZuiiL5dqUgpR_STva8ySdYIJAUnSHVkU5HnNLzC68pNSEcuYdcA=@emersion.fr>
MIME-Version: 1.0
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <james.park@lagfreegames.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, February 3rd, 2021 at 1:56 AM, Emil Velikov emil.l.velikov@gmail.com wrote:

> As summed in the commit message the burden is only applicable when all
> of the following are set:
>  - non-linux
>  - force DRM_FOURCC_STANDALONE
>  - c99 -pedantic

Oh, and FWIW, this is not a theoretical situation at all. All of these
conditions happen to be true on my compositor. It has FreeBSD CI,
-Werror, and will use DRM_FOURCC_STANDALONE when available.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
