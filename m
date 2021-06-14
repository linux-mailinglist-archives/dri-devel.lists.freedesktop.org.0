Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF203A6C5F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 18:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0755389AC2;
	Mon, 14 Jun 2021 16:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6A489AC2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 16:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IYjeZaaWSz2tVd1s8laf9op5KsPHc/ytqQ8oys3X80g=; b=LAup1kj/aXVkVoNEGu8BXMo+LG
 WS4RWb/nCZI8FidPMva1AZCXeAKCYAvzIv74kN6w8iBCbiD0NXw9qxWtCH+fuo9TWJOVKiqAQlTNr
 QGoHG9eF2UOPFDxaA4voP1BqLGpNH5YP1Nqh1IAE+k7MgGUgOeNkJhoF9srWQed1J5l1WvYKAem05
 v0zMcANX/N0PCBiZgrxQKfVzVh4MXcNETZ35JAGlYpCf5n6J/jMFXmYWs+7AjoA+138Olg31yyNxi
 BQ8zuy4nKeCLRB9CHqjDDxTccaM1hIDo2VwS62H+ESR90v418AOfVed0flLWD9/51vBtBRCqJiJ63
 AdqzCD1g==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=62226)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lspli-0005sE-Lj; Mon, 14 Jun 2021 18:48:58 +0200
Subject: Re: [PATCH 1/2] drm/dbi: Support DBI typec1 read operations
To: Doug Anderson <dianders@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20210611212736.668563-1-linus.walleij@linaro.org>
 <CAD=FV=VZbamOOKCkvyOzy_4-xKwkMpp=eLaaAGDv4xv=eEQigw@mail.gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <a1de9956-40d6-221a-2ff7-9fac72d67d27@tronnes.org>
Date: Mon, 14 Jun 2021 18:48:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VZbamOOKCkvyOzy_4-xKwkMpp=eLaaAGDv4xv=eEQigw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 14.06.2021 17.49, skrev Doug Anderson:
> Hi,
> 
> On Fri, Jun 11, 2021 at 2:29 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>> +static int mipi_dbi_typec1_command_read(struct mipi_dbi *dbi, u8 *cmd,
>> +                                       u8 *data, size_t len)
>> +{
>> +       struct spi_device *spi = dbi->spi;
>> +       u32 speed_hz = min_t(u32, MIPI_DBI_MAX_SPI_READ_SPEED,
>> +                            spi->max_speed_hz / 2);
> 
> I'm kinda curious why "max_speed_hz / 2", but you match the "typec3"
> version of this so I guess it's right?
> 

That's a good question, I can't remember the reason now, but I guess the
reasoning in something like: most MIPI DBI compatible controllers I've
seen is spec'ed at max 10MHz write speed and 2MHz read speed. I suppose
I have tried to match that read is slower than write. So I have probably
tried to play safe here. Not dividing by 2 is also fine by me.
The reason for allowing max_speed out of spec is that most controllers
can receive pixel data way above the nominal speed, often 4-6x, with the
occasional pixel glitch. We can't allow commands to glitch so must run
at nominal speed. mipi_dbi_spi_cmd_max_speed() is the one that caps the
write speed.

> 
>> +       struct spi_transfer tr[2] = {
>> +               {
>> +                       .speed_hz = speed_hz,
>> +                       .bits_per_word = 9,
>> +                       .tx_buf = dbi->tx_buf9,
>> +                       .len = 2,
>> +               }, {
>> +                       .speed_hz = speed_hz,
>> +                       .bits_per_word = 8,
>> +                       .len = len,
>> +                       .rx_buf = data,
>> +               },
>> +       };
>> +       struct spi_message m;
>> +       u16 *dst16;
>> +       int ret;
>> +
>> +       if (!len)
>> +               return -EINVAL;
>> +
>> +       if (!spi_is_bpw_supported(spi, 9)) {
>> +               /*
>> +                * FIXME: implement something like mipi_dbi_spi1e_transfer() but
>> +                * for reads using emulation.
>> +                */
>> +               dev_err(&spi->dev,
>> +                       "reading on host not supporting 9 bpw not yet implemented\n");
>> +               return -EOPNOTSUPP;
>> +       }
>> +
>> +       /*
>> +        * Turn the 8bit command into a 16bit version of the command in the
>> +        * buffer. Only 9 bits of this will be used when executing the actual
>> +        * transfer.
>> +        */
>> +       dst16 = dbi->tx_buf9;
>> +       dst16[0] = *cmd;
>> +
>> +       spi_message_init_with_transfers(&m, tr, ARRAY_SIZE(tr));
>> +       ret = spi_sync(spi, &m);
>> +
>> +       MIPI_DBI_DEBUG_COMMAND(*cmd, data, len);
> 
> nit: Only call MIPI_DBI_DEBUG_COMMAND() if !ret? Otherwise on an error
> you're just going to output whatever random data was already in the
> buffer that the user passed you. I suppose that same bug is present in
> mipi_dbi_typec3_command_read().
> 
> Other than that, this seems OK based on my feeble understanding of
> MIPI DBI (I couldn't even find the docs that I dug up before, sadly).

I have checked and the code lines up with Figure 26 Type C Interface
Read Sequence – Option 1 in the MIPI DBI v2.0 standard.

Noralf.

> Luckily Noralf is also here to review that part! :-) I'm happy with:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
