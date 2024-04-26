Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6218C8B2ED0
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 05:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A670310EC35;
	Fri, 26 Apr 2024 03:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z1Q00K4o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10CA10EC35
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 03:03:11 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-51ae2e37a87so1904776e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 20:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714100590; x=1714705390; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eerUw8HV77CQtEM68opKn2k+UEnTk4gJflML9gefhwE=;
 b=Z1Q00K4o47HYRY2grqrLgUklUCXW52HLpgg/PX9FjgwSBwoDNIDfFbDJNpu1DGfkof
 C4ZkC7B946sFXIKbl2vxRLmtwCyyZnoQCfuFjZKh0azQkC1VtcETkohc/lL/5slRNvN+
 9ensbgQBBVdmUUa8FaiNMFa6/MPvq6nlUPPdJQlzwKYaiALkhINFr3U6z24HgIG1oAgr
 OCC834QUuo23x4deONHG5SvXQRwljSe52EKYm4Gan4x7letxEKbsR/ppu4H/xQOw3kdo
 TAFpX0Yoi6PyNWP4DBjBYIH69fZ2dImvrFZ8RhnqucE92bJY/snkF+rYva2lyKsHbXv0
 190Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714100590; x=1714705390;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eerUw8HV77CQtEM68opKn2k+UEnTk4gJflML9gefhwE=;
 b=LvFWSYG62WGR5yMsgi6sDctalN8wcD+8JX++zPIlS52Wif+6IW7sRs6vD6knUnKuVj
 aOCzsSJagA3ZLBxWpUSnfMN0lJQwzbIf83GqAPtEVT5FTrrRR82HEWujpfsaGS0nAb3j
 3Uto81oyudQQTtatsvTRQ8luAvAV9toMu84Pbys+X4szLxIohdKV5onuEqeIbFuJ8eKg
 HnNIpeqwWJhpzAmrMsdQLzCvkb1FydUkROW6vWyH8S3xt7pSBej+S3ogGIHe79HPF/M9
 LM3XLF3imfoHMAk6PmqovJto7/k/WXtbPqyA2B+0o4mgnEEV8ZuEtBghxJ80jHKTyPob
 M0fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPfbeNCF7FmkkAycDeVtPwLUNIKVlrnuFtZDAawmoeo/gWfol+BpcVzxo64D+YTs2oQ3UAl7xpcRimh9MKdLWVOPnAUG7zmqsSSNgpREsf
X-Gm-Message-State: AOJu0YyrwUaVMRE4rzL99YEE+J2GyAdByPtqmMGZtE4WyozrprJJmQ1C
 QRKMSx2omYy+J0v9oQtem5MRhDpXN/RBvMRZmWbNGEPQdbZDoynnEw0EYGSqLnQ=
X-Google-Smtp-Source: AGHT+IF7fC3rK4d2pUEe78+3175lW5ei7plG847JDb4Ai7SjzrmEwSTqyN+4QmSXUWusfc3etJMfTQ==
X-Received: by 2002:ac2:4e03:0:b0:516:cf0a:9799 with SMTP id
 e3-20020ac24e03000000b00516cf0a9799mr800810lfr.64.1714100589585; 
 Thu, 25 Apr 2024 20:03:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a13-20020ac2520d000000b00516b07d95c0sm2980341lfl.217.2024.04.25.20.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 20:03:08 -0700 (PDT)
Date: Fri, 26 Apr 2024 06:03:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linus.walleij@linaro.org, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 lvzhaoxiong@huaqin.corp-partner.google.com, 
 Hsin-Yi Wang <hsinyi@google.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/mipi-dsi: Reduce driver bloat of
 mipi_dsi_*_write_seq()
Message-ID: <beqsovvdkvn63prt3c6b3epb6tachff35vpaf62dfkwof7kwht@u3p7bkv7owro>
References: <20240424172017.1.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
 <87pludq2g0.fsf@intel.com>
 <CAD=FV=W+Pcr+voBkcfeE_UC+ukN_hLXgoqMk0watROWRXe_2dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=W+Pcr+voBkcfeE_UC+ukN_hLXgoqMk0watROWRXe_2dg@mail.gmail.com>
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

On Thu, Apr 25, 2024 at 10:04:49AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Apr 25, 2024 at 1:19 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >
> > > @@ -279,6 +281,8 @@ enum mipi_dsi_dcs_tear_mode {
> > >
> > >  ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
> > >                                 const void *data, size_t len);
> > > +ssize_t mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
> > > +                                      const void *data, size_t len);
> > >  ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
> > >                          const void *data, size_t len);
> > >  ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *data,
> > > @@ -317,14 +321,10 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
> > >  #define mipi_dsi_generic_write_seq(dsi, seq...)                                \
> > >       do {                                                                   \
> > >               static const u8 d[] = { seq };                                 \
> > > -             struct device *dev = &dsi->dev;                                \
> > >               int ret;                                                       \
> > > -             ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));           \
> > > -             if (ret < 0) {                                                 \
> > > -                     dev_err_ratelimited(dev, "transmit data failed: %d\n", \
> > > -                                         ret);                              \
> > > +             ret = mipi_dsi_generic_write_chatty(dsi, d, ARRAY_SIZE(d));    \
> > > +             if (ret < 0)                                                   \
> > >                       return ret;                                            \
> > > -             }                                                              \
> > >       } while (0)


Reading the thread makes me wonder whether we should be going into
slightly other direction:

Add __must_check() to mipi_dsi_ writing functions,

#define mipi_dsi_dcs_whatever_write(dsi, cmd, seq...)	\
	({						\
		static const u8 d[] = { cmd, seq };     \
                mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));    \
	})

Then in panel drivers we actually have to explicitly handle the return
code (either by dropping to the error label or by just returning an
error).


> >
> > The one thing that I've always disliked about these macros (even if I've
> > never actually used them myself) is that they hide control flow from the
> > caller, i.e. return directly. You don't see that in the code, it's not
> > documented, and if you wanted to do better error handling yourself,
> > you're out of luck.
> 
> Yeah, I agree that it's not the cleanest. That being said, it is
> existing code and making the existing code less bloated seems worth
> doing.
> 
> I'd also say that it feels worth it to have _some_ solution so that
> the caller doesn't need to write error handling after every single cmd
> sent. If we get rid of / discourage these macros that's either going
> to end us up with ugly/verbose code or it's going to encourage people
> to totally skip error handling. IMO neither of those are wonderful
> solutions.
> 
> While thinking about this there were a few ideas I came up with. None
> of them are amazing, but probably they are better than the hidden
> "return" like this. Perhaps we could mark the current function as
> "deprecated" and pick one of these depending on what others opinions
> are:
> 
> 1. Use "goto" and force the caller to give a goto target for error handling.
> 
> This is based on an idea that Dmitry came up with, but made a little
> more explicit. Example usage:
> 
> int ret;
> 
> ret = 0;
> mipi_dsi_dcs_write_seq_goto(dsi, &ret, HX83102_SETSPCCMD, 0xcd,
>                             some_cmd_failed);
> mipi_dsi_dcs_write_seq_goto(dsi, &ret, HX83102_SETMIPI, 0x84,
>                             some_cmd_failed);
> mipi_dsi_dcs_write_seq_goto(dsi, &ret, HX83102_SETSPCCMD, 0x3f,
>                             some_cmd_failed);
> mipi_dsi_dcs_write_seq_goto(dsi, &ret, HX83102_SETVDC, 0x1b, 0x04,
>                             some_cmd_failed);
> 
> ...
> 
> some_cmd_failed:
>   pr_err("Commands failed to write: %d", ret);
>   return ret;
> }
> 
> One downside here is that you can't easily tell which command failed
> to put it in the error message. A variant of this idea (1a?) could be
> to hoist the print back into the write command. I'd want to pick one
> or the other. I guess my preference would be to hoist the print into
> the write command and if someone really doesn't want the print then
> they call mipi_dsi_dcs_write_buffer() directly.

Do we really care, which command has failed? I mean, usually either all
DSI transfers work, or we have an issue with the DSI host.

> 
> ---
> 
> 2. Accept that a slightly less efficient handling of the error case
> and perhaps a less intuitive API, but avoid the goto.
> 
> Essentially you could pass in "ret" and have the function be a no-op
> if an error is already present. Something like this:
> 
> void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_device *dsi,
> const void *data, size_t len, int *accum_ret)
> {
>   if (*accum_ret)
>     return;
> 
>   *accum_ret = mipi_dsi_dcs_write_buffer(dsi, data, len);
> }
> 
> ...and then the caller:
> 
> int ret;
> 
> ret = 0;
> mipi_dsi_dcs_write_seq_multi(dsi, HX83102_SETSPCCMD, 0xcd, &ret);
> mipi_dsi_dcs_write_seq_multi(dsi, HX83102_SETMIPI, 0x84, &ret);
> mipi_dsi_dcs_write_seq_multi(dsi, HX83102_SETSPCCMD, 0x3f, &ret);
> mipi_dsi_dcs_write_seq_multi(dsi, HX83102_SETVDC, 0x1b, 0x04, &ret);
> if (ret)
>   goto some_cmd_failed;
> 
> This has similar properties to solution #1.
> 
> ---
> 
> 3. Accept that callers don't want to error handling but just need a print.
> 
> I'm not 100% sure we want to encourage this. On the one hand it's
> unlikely anyone is really going to be able to reliably recover super
> properly from an error midway through a big long command sequence. On
> the other hand, this means we can't pass the error back to the caller.
> In theory the caller _could_ try to handle errors by resetting / power
> cycling things, so that's a real downside.
> 
> Example usage:
> 
> mipi_dsi_dcs_write_seq_chatty(dsi, HX83102_SETSPCCMD, 0xcd);
> mipi_dsi_dcs_write_seq_chatty(dsi, HX83102_SETMIPI, 0x84);
> mipi_dsi_dcs_write_seq_chatty(dsi, HX83102_SETSPCCMD, 0x3f);
> mipi_dsi_dcs_write_seq_chatty(dsi, HX83102_SETVDC, 0x1b, 0x04);
> 
> ---
> 
> I think I'd lean towards #1a (user passes goto label and we include
> the error print in the helper), but I'd personally be happy with any
> of #1 or #2. I don't love #3.
> 
> > Be that as it may, the combo of ratelimited error printing and return on
> > errors does not make much sense to me. If there's something to print,
> > you bail out, that's it. I suspect we never hit the ratelimit.
> 
> Yeah, I'm in favor of removing the ratelimit.
> 
> 
> > You might even want to try *only* changing the ratelimited printing to a
> > regular error message, and see if the compiler can combine the logging
> > to a single exit point in the callers. Ratelimited it obviously can't
> > because every single one of them is unique.
> 
> It wasn't quite as good. Comparing the "after" solution (AKA applying
> $SUBJECT patch) vs. _not_ taking $SUBJECT patch and instead changing
> dev_err_ratelimited() to dev_err().
> 
> $ scripts/bloat-o-meter \
>    .../after/panel-novatek-nt36672e.ko \
>   .../noratelimit/panel-novatek-nt36672e.ko
> add/remove: 0/0 grow/shrink: 1/0 up/down: 3404/0 (3404)
> Function                                     old     new   delta
> nt36672e_1080x2408_60hz_init                7260   10664   +3404
> Total: Before=11669, After=15073, chg +29.17%
> 
> ...so $SUBJECT patch is still better.
> 
> ---
> 
> Where does that leave us? IMO:
> 
> a) If others agree, we should land $SUBJECT patch. It doesn't change
> the behavior at all and gives big savings. It adds an extra function
> hop, but presumably the fact that we have to fetch _a lot_ less stuff
> from RAM might mean we still get better performance (likely it doesn't
> matter anyway since this is not hotpath code).
> 
> b) Atop this patch, we should consider changing dev_err_ratelimited()
> to dev_err(). It doesn't seem to make lots of sense to me to ratelimit
> this error.
> 
> c) Atop this patch, we should consider making the two existing macros
> "deprecated" in favor of a new macro that makes the control flow more
> obvious.
> 
> How does that sound to folks?
> 
> -Doug

-- 
With best wishes
Dmitry
