Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0C012E927
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 18:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213296E11A;
	Thu,  2 Jan 2020 17:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FEA6E11C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 17:12:24 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 18860215A4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 17:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577985144;
 bh=dIq2enHfn035JWxqGNTizyqe3d+P+AAp9zDOlaNOECA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=W4YT7s4ksMhxhllREBYlfWo+SkISlyHy0/s1uYsWPmXzlaDLUG/JFSr5UnsYHuBX+
 xwE8nCkEtYIHbW8DJygccsDR6X806VmficxaMLdlntXC+Zflrgxj7S1i/MlbcJLJZ1
 2HtNwBJMWMZ6+UZjJCpXRP7dFrqljmgxCcJVz8AI=
Received: by mail-qk1-f173.google.com with SMTP id 21so31874527qky.4
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2020 09:12:24 -0800 (PST)
X-Gm-Message-State: APjAAAWHcPS9fYKVZY6VzpcF1vUI32tLX7TLGnG2jNxbi5pwH5X1PfUf
 gNXh1uQc/jNzFRs5i7Bn+ks961agrhrKlC9/1w==
X-Google-Smtp-Source: APXvYqyRh/kYGJmLrw4lgU0NGysmlV0J1/XKZ+mTTMzGUruPxDHGf3p4UBRuvBbrQrjV4ZFFJspxo9Z9x/MVtuRHxpA=
X-Received: by 2002:a37:a70b:: with SMTP id q11mr66939358qke.393.1577985143243; 
 Thu, 02 Jan 2020 09:12:23 -0800 (PST)
MIME-Version: 1.0
References: <20200102152605.71117-1-maxime@cerno.tech>
In-Reply-To: <20200102152605.71117-1-maxime@cerno.tech>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 2 Jan 2020 10:12:10 -0700
X-Gmail-Original-Message-ID: <CAL_JsqKh1YKmj8T6x80fhn8YmnDC+qBdvSrNHwXte2CPPncqNA@mail.gmail.com>
Message-ID: <CAL_JsqKh1YKmj8T6x80fhn8YmnDC+qBdvSrNHwXte2CPPncqNA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: Convert Allwinner display
 pipeline to schemas
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Sean Paul <seanpaul@chromium.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 2, 2020 at 8:26 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The Allwinner SoCs have a display engine composed of several controllers
> assembled differently depending on the SoC, the number and type of output
> they have, and the additional features they provide. A number of those are
> supported in Linux, with the matching bindings.
>
> Now that we have the DT validation in place, let's split into separate file
> and convert the device tree bindings for those controllers to schemas.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> ---
>
> Changes from v1:
>   - Declare the ports in the bindings

What about my comment on using minItems rather than maxItems?

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
