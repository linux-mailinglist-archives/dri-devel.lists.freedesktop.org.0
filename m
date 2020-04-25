Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDC31B82B1
	for <lists+dri-devel@lfdr.de>; Sat, 25 Apr 2020 02:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B326E059;
	Sat, 25 Apr 2020 00:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C9B6E059
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 00:24:03 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 72so15727082otu.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 17:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8DtbY+hrvIraJrx4Nh9U+69i+KyeK5TrEPRbni5wx1U=;
 b=Cwn2nxgafnzJF/zCWg2DNC9ZfZrTBn7wZMWmYaeOXMf+TZo60c2RS1u9xDCyfl5VaF
 JlUzgkkfZgLZjzcza5nL29ZhDfNruiABWTxH+GQX/GXDu+wOtzrGJpdH+Sr0Oiax9D/x
 aUVwJ9OfflXHPZDAVmcqpBU+oxLXWGFMcf6pJicEa0Ukr9VBeJmxKWINQrzys0LpzFQn
 nVdEN+5aq5aWQnCGxJx2rqfRwg4M40812PmwbopQOYfi/hTrAq8qnd5XA57iSiONl53o
 Z4oeQijaD111i8OLac4kXu7FiHhNatFqjM4CR3XkD9mpF49PZUTW+4kC+HsO3uSBdaUO
 l6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8DtbY+hrvIraJrx4Nh9U+69i+KyeK5TrEPRbni5wx1U=;
 b=stIdjIgkK+Slv/u6jxR0VEIFR+ey9vgzFINgFCAFoa9aKftGFwsFS7NHy/+k9z1ZoO
 t0ZFM31Ymax1YTmBULP0P5dH+qBQwb3dWS+ET7eqsheTqEv24WnU+oZbgMfQz8/oZ1T+
 9AfGCopR2JrBCxQipeydAnBdARqju0QVmf5+IqknhJVZBwQylHqs/gqJ3p6PvQC58lGr
 uuHuYyHurzltqCwy3ak+wFb7wRccBppKTIaaIa2DFHP45BgoK5hP5AygDj5+fuRTxAHK
 6XEYVFKE/XwwEQxxuK6EpX0sUl9z79L8V/CyhUeIkpASYKaKTQ9JyWelgx4yk1LTv4sP
 el7g==
X-Gm-Message-State: AGi0PubaMl9ySb+19hDFTtb2htfLUwkkAP/DCqeHXMk5gOdL15sOthRs
 bEXCimwOUFdXoRF3a4r6Z69f2pBAhs9snnaO6+e4/g==
X-Google-Smtp-Source: APiQypI/oJ4eCDe/btPQXd2AND4zdGuWptjwylIaEjXOjM6KEi0hiu1hDHJSpsf2xW+KNi6jMm70KD4ysHR+K4zMdK4=
X-Received: by 2002:a9d:3988:: with SMTP id y8mr9388729otb.352.1587774242725; 
 Fri, 24 Apr 2020 17:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200424221758.15984-1-afd@ti.com>
In-Reply-To: <20200424221758.15984-1-afd@ti.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 24 Apr 2020 17:23:50 -0700
Message-ID: <CALAqxLUHYUkyCR7cFoLH89X_yrC3BMqc64iQoUiPyN5UqnYnvA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Initialize during core instead of subsys
To: "Andrew F. Davis" <afd@ti.com>
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
Cc: lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 3:18 PM Andrew F. Davis <afd@ti.com> wrote:
>
> Some clients of DMA-Heaps probe earlier than subsys_initcall(), this
> can cause issues when these clients call dma_heap_add() before the
> core DMA-Heaps framework has initialized. DMA-Heaps should initialize
> during core startup to get ahead of all users.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>

No objection from me right off.

Acked-by: John Stultz <john.stultz@linaro.org>

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
