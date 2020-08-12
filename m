Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301E32423C7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 03:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9A46E889;
	Wed, 12 Aug 2020 01:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF256E88A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 01:33:48 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 93so729072otx.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 18:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OOPEDXgtktX+STOhnXLIGFgUbz2AXCn5XtOhUs7FFWI=;
 b=qSkeLFvVCBeyPkmdkgo9OCu5OWH5Dw6+0Twq6g7pWRUKkrgMSI2z7oY5mGZviazadc
 spoPzCobAhW7sEDx1xtNZWsQ/0F5j9CvS7EzK+4CW832Mnin/Tfo74DU3bVJJmh1Dw+u
 12je9qrMQ19aLS/Ik6iyA4QMhSdyMq16Q2Wk0lYS7xTu0JEVkE/wofm+Ov+w029jUpR5
 lELK88tQ8d/m445rIjFhk4LKCQ/rYg6C2Xur4Da8IfMcqe85B6YdRVQRj4d5QPCbhkIU
 RCK17RLFpRllpJN4hkBKlEYHX7P6xA7j56ZedLQjmPHHtCOzIyZ6joZ7irT53PcAqEqZ
 OdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OOPEDXgtktX+STOhnXLIGFgUbz2AXCn5XtOhUs7FFWI=;
 b=H7gy8Llt9ITDIKUuVZ77JAkxa3GSWTOGvRXeZHB9QomK+eReHiIveYrRA2poKyn75F
 kX6QoKaTBY2CD+6Wbgez58bnO9ssgjRCViIXhE3eD7u6fmxniepRzm7YcerbZ8UUaYc4
 PKak85Tjg4fUKlUeL5wMMP0Y3iGJHtcuEYuvojWbUNi5Z8y4f/QByIE2d6EJiQzPGGDX
 GaQyAZjF7aSI9zQPSEtp3z6yBpl2gWl2QMYK7lawNjUveCp++N9HsgPYwdkcYzLmb+ur
 0i7uTiebFWCBEK7mxa/j5UEdNiUfD3QbLtvJ/SPD7IVDb8vX1P7C1NzbQ81RXxWZRX5F
 g0sA==
X-Gm-Message-State: AOAM532XTIqAg8a04y19T90AyEEPTZPuiZCq5kMri8q8qHxtn2OFOeCg
 4bdeGJ+1CxbBl5IlV/0Jl2Q9y3uVw3z/x/3VPQu+3A==
X-Google-Smtp-Source: ABdhPJxLxPaIzKvPWsnNCzFrhyTFYZetvE3df4QriA+UBfu0xBdgDZG7G/eP+D69kfw+gwQ/XsFyZuhoDhcuSqY1Mvw=
X-Received: by 2002:a9d:6f8f:: with SMTP id h15mr7099143otq.221.1597196027730; 
 Tue, 11 Aug 2020 18:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-4-rnayak@codeaurora.org>
 <CALAqxLV2TBk9ScUM6MeJMCkL8kJnCihjQ7ac5fLzcqOg1rREVQ@mail.gmail.com>
In-Reply-To: <CALAqxLV2TBk9ScUM6MeJMCkL8kJnCihjQ7ac5fLzcqOg1rREVQ@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 11 Aug 2020 18:33:36 -0700
Message-ID: <CALAqxLWg3jJKJFLnnne-mrQEnH=m7R_9azCGaGnEmFYR4EMh=A@mail.gmail.com>
Subject: Re: [RFC v2 03/11] tty: serial: qcom_geni_serial: Use OPP API to set
 clk/perf state
To: Rajendra Nayak <rnayak@codeaurora.org>
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
Cc: Amit Pundir <amit.pundir@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-scsi@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Linux PM list <linux-pm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-serial@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 11, 2020 at 4:11 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Wed, Mar 20, 2019 at 2:49 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
> >
> > geni serial needs to express a perforamnce state requirement on CX
> > depending on the frequency of the clock rates. Use OPP table from
> > DT to register with OPP framework and use dev_pm_opp_set_rate() to
> > set the clk/perf state.
> >
> > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  drivers/tty/serial/qcom_geni_serial.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> >
>
> Hey,
>   I just wanted to follow up on this patch, as I've bisected it
> (a5819b548af0) down as having broken qca bluetooth on the Dragonboard
> 845c.
>
> I haven't yet had time to debug it yet, but wanted to raise the issue
> in case anyone else has seen similar trouble.

So I dug in a bit further, and this chunk seems to be causing the issue:
> @@ -961,7 +963,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>                 goto out_restart_rx;
>
>         uport->uartclk = clk_rate;
> -       clk_set_rate(port->se.clk, clk_rate);
> +       dev_pm_opp_set_rate(port->dev, clk_rate);
>         ser_clk_cfg = SER_CLK_EN;
>         ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>


With that applied, I see the following errors in dmesg and bluetooth
fails to function:
[    4.763467] qcom_geni_serial 898000.serial: dev_pm_opp_set_rate:
failed to find OPP for freq 102400000 (-34)
[    4.773493] qcom_geni_serial 898000.serial: dev_pm_opp_set_rate:
failed to find OPP for freq 102400000 (-34)

With just that chunk reverted on linus/HEAD, bluetooth seems to work ok.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
