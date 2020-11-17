Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B83F2B6F88
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 21:04:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7256289A7A;
	Tue, 17 Nov 2020 20:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE90589A7A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 20:04:28 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id r9so31855478lfn.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 12:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tQkFGL0XDFRfUFUn+hfgyMvSdBv+O+SQSvUfUOZsWGc=;
 b=j9v1QVq5imwxYgPbp8Ohc1CbtdxQOUcbqbnPp9806Kh42QMTEFGhoXSEV1yz6rZoW1
 yuKZH9xjnzULdpb0vqerCV7xUqnV7KIUvSgooQjmY+wSn4BKMm+ISRuYpXE3UaCVkAxv
 qhbQpvUz15qGv/WB8a9+7Q2QqU9MdblhS3SA3RB0OeMrwb3l+JIqGRlohrtxjqj6/ql4
 Uv+UtucdgpLjWe2jW92468oZverdsEOxiqTUW+nRBRF39CLso9btz7N5/TdZZqkeSmQW
 ZBis7fEQQqK4/k+rbuU24Wil+iXr6WzEQIf7igT+Ddcdlg+t2be8sdisnksjrTU7BUOu
 SmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tQkFGL0XDFRfUFUn+hfgyMvSdBv+O+SQSvUfUOZsWGc=;
 b=JyywFwajNFNVuGqHsQjoZ3cVe+rAjafz3eSvbATGceBuN01SDPVpZOyorJqkZeok4s
 J7XVq3EGU8+Ry5AroSDJ2ijjnE9ZBa3i0ZN0FkD2K3yP/FsPL/4JvoBpxDxkDrg6K+Du
 IV9N4OD4R26s+t8yCwbA2akmc2NHM2JAIOfDYxDoxXglthVLu/8HvOevqetFCn/csA5P
 mhTCVbHhpCrF3rhHOSQRoC1g4kDC4vlwU/dUQl1P50MGcqueRhqI3tovN1fnU8tv09TY
 x0nq7lsfPTb/H/zsDBR+iKkNQQzKOErNjuKO3KJEw9yAu4k10LFL6Yy/QkdCQl6Upccn
 Bvbg==
X-Gm-Message-State: AOAM532Q4JfVKrm4Nni46OkBFwBHf33txyqL0voMgwQ16TnO9jdMBZv2
 X+d0BGBruiMWNv6v7KADrItpX3aNKYL9EunqHc/gqA==
X-Google-Smtp-Source: ABdhPJxFcnxMsym+ODrdjo/sAR80MZBssvUBZYTC1Ydoe4+uK74fFf8Juxfuz6bcr46XzPf965ATqBLRvXSIoSwyenA=
X-Received: by 2002:a05:6512:3e7:: with SMTP id
 n7mr2218700lfq.585.1605643467292; 
 Tue, 17 Nov 2020 12:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20201117175413.869871-1-linus.walleij@linaro.org>
 <20201117192414.GA15239@ravnborg.org>
In-Reply-To: <20201117192414.GA15239@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Nov 2020 21:04:16 +0100
Message-ID: <CACRpkdbNeqTfTme9jygtdRnZuB=_3JN5HGr=LcrO94By-G7UHA@mail.gmail.com>
Subject: Re: [PATCH] drm/mcde: Fix RGB/BGR bug
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Stephan Gerhold <stephan@gerhold.net>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 phone-devel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 8:24 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> > Cc: phone-devel@vger.kernel.org
> > Cc: Stephan Gerhold <stephan@gerhold.net>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

> Fixes: ??

It's no regression actually: for the current hardware we just
invert the buffers twice and it looks OK. Buffers are declared
BGR and then BGR-switched again by the DSI formatter.

But when adding DPI (I have some two other patches on the
list) this needs to be corrected.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
