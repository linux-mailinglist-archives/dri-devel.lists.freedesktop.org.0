Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7D8651F0A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B75B10E386;
	Tue, 20 Dec 2022 10:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E515910E2A0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 13:49:52 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 530F3825;
 Mon, 19 Dec 2022 14:49:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671457791;
 bh=bs4Jq4jA6Yl7yQf9XjEEFntSKvqBgZhuzWvPyqJ+/q8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QO8ZmKOa5axsP/27qXe7ftd5vdBZMHZ9RXkijypcu/m2m1/FeqYhDyOhRAasHoP+3
 g2klrvB/KXQv8NCF9dGN087JMQvZOMp1nviBvfssHPDEvhfpF+8VHIlvEhJq2odtKj
 emaj5JqheromatffVybx/IYonzDKFi85F8L7G42I=
Message-ID: <dbcaa576-27d4-c555-87e3-cd3c9cfb72a7@ideasonboard.com>
Date: Mon, 19 Dec 2022 15:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/7] media: renesas: vsp1: Add new formats (2-10-10-10
 ARGB, Y210)
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221206133954.397098-6-tomi.valkeinen+renesas@ideasonboard.com>
 <CAMuHMdWVXCy_CEjv2c_ke6x+HNfndNci1c3m1Tn5ROy_mvNhmw@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAMuHMdWVXCy_CEjv2c_ke6x+HNfndNci1c3m1Tn5ROy_mvNhmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 20 Dec 2022 10:39:50 +0000
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/12/2022 16:38, Geert Uytterhoeven wrote:
> Hi Tomi,
> 
> On Tue, Dec 6, 2022 at 2:44 PM Tomi Valkeinen
> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
>> Add new pixel formats: XBGR2101010, ABGR2101010, BGRA1010102 and Y210.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
>> @@ -109,6 +109,56 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>>          vsp1_rpf_write(rpf, dlb, VI6_RPF_INFMT, infmt);
>>          vsp1_rpf_write(rpf, dlb, VI6_RPF_DSWAP, fmtinfo->swap);
>>
>> +       if ((entity->vsp1->version & VI6_IP_VERSION_MODEL_MASK) == VI6_IP_VERSION_MODEL_VSPD_GEN4) {
>> +               u32 ext_infmt0;
>> +               u32 ext_infmt1;
>> +               u32 ext_infmt2;
>> +
>> +               switch (fmtinfo->fourcc) {
>> +               case V4L2_PIX_FMT_XBGR2101010:
>> +                       ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
>> +                       ext_infmt1 = (0 << 24)  | (10 << 16) |
>> +                                    (20 << 8)  | (30 << 0);
> 
> Introducing PACK_CPOS(a, b, c, d)...
> 
>> +                       ext_infmt2 = (10 << 24) | (10 << 16) |
>> +                                    (10 << 8)  | (0 << 0);
> 
> ... and PACK_CLEN(a, b, c, d) macros (or a single PACK4() macro)
> can make this less error-prone.

Thanks. It does, and I found an error in V4L2_PIX_FMT_BGRA1010102 =).

  Tomi

