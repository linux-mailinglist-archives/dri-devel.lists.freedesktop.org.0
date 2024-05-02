Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE038B9EC4
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 18:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CB31125AC;
	Thu,  2 May 2024 16:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gBZ1bPnz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE861125A8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 16:40:41 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3c750fd1202so4772911b6e.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 09:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714668036; x=1715272836;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AEnee6ah2poDn5i64PbPAXVhct8y7uUBex4L7IT1hm0=;
 b=gBZ1bPnzpyWyjdOumpC1VPD/mZ6GcrQuYFf3RHy5hXYXGkJxY9Vqb7dQFL23MuBgEV
 iudDBBvXfpyu866aHdm0IOxTp2QxBNojPH/tiByfjiD7dXyWaEYcKX8ynrLN6Q8nkmtu
 +Y0NcjArJEcNydjJUXJbVDDyobEoc5e0k17+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714668036; x=1715272836;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AEnee6ah2poDn5i64PbPAXVhct8y7uUBex4L7IT1hm0=;
 b=mVcvOcRXfB30F4ig52vOHs+CWX8HbyZgK48RuLBJhTs2hahuLYlq/YcHR6loXJgkPf
 JxZC804t7If0UidTm12dJ4mAKMIehyCqLqhZ0cDwTyojCvR3lcnS/tBpJb4NBct6fSnP
 xzXPG3s1WNiwKpX18wdYVqMoEq3k6+S4bOk0YqyxHxkIkX8LIO5k54KKsB92ptxsaH88
 tKiepVlO/xKrlt4WjAWoS9XcntpqGAiVauGNZWQWrhNKLebBuqvoBA0G5LRVsp38OpRu
 fhbWnbvYk8hMR6V3A8KOvRRUPeSzdXd1lyvF8PfTkVY0QeXwiFtD67qT+UUeRnCzwIq0
 51Zg==
X-Gm-Message-State: AOJu0YzqN4AGCJ5ELdN1k6GrZKhFgTAyt6F3hB0okwPs/2SYiDLA9WdC
 XrbCFijp7+RRINIJ7H79MdXAQOM+s8Vwvsb/VPRUj64zmvNnu1NS5KpR4l50HqC1LgengAe6J1k
 =
X-Google-Smtp-Source: AGHT+IF8BckCPPnJLHbYfTR2HWH87wVM+5SH9NzaQa4yLHvArHFYGxUgzrMatg7iqXQucIikAuQvIA==
X-Received: by 2002:a05:6808:1816:b0:3c8:6551:8125 with SMTP id
 bh22-20020a056808181600b003c865518125mr570833oib.6.1714668035965; 
 Thu, 02 May 2024 09:40:35 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 s22-20020ac87596000000b0043ad7ddda16sm605353qtq.97.2024.05.02.09.40.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 09:40:34 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-43ae23431fbso3581cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 09:40:32 -0700 (PDT)
X-Received: by 2002:a05:622a:190d:b0:437:b631:b8fb with SMTP id
 d75a77b69052e-43caa5b67b6mr4063341cf.26.1714668032250; Thu, 02 May 2024
 09:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240501154251.3302887-1-dianders@chromium.org>
 <20240501084109.v3.7.Ib5030ab5cd41b4e08b1958bd7e51571725723008@changeid>
 <CACRpkdYiND3uLAbFqyGEYgi5+ycOTYoncmSYGTsYtTZ7Ox=4DQ@mail.gmail.com>
In-Reply-To: <CACRpkdYiND3uLAbFqyGEYgi5+ycOTYoncmSYGTsYtTZ7Ox=4DQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 May 2024 09:40:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U59+au4Sfi5xdxmCAEaAVq7YguM2FjkyF+OYX16ydW4w@mail.gmail.com>
Message-ID: <CAD=FV=U59+au4Sfi5xdxmCAEaAVq7YguM2FjkyF+OYX16ydW4w@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] drm/panel: boe-tv101wum-nl6: Don't use a table for
 initting panels
To: Linus Walleij <linus.walleij@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>, 
 Brian Norris <briannorris@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Joel Selvaraj <jo@jsfamily.in>, lvzhaoxiong@huaqin.corp-partner.google.com, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Thu, May 2, 2024 at 6:42=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Wed, May 1, 2024 at 5:43=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> > Consensus on the mailing lists is that panels shouldn't use a table of
> > init commands but should instead use init functions. With the recently
> > introduced mipi_dsi_dcs_write_seq_multi() this is not only clean/easy
> > but also saves space. Measuring before/after this change:
> >
> > $ scripts/bloat-o-meter \
> >   .../before/panel-boe-tv101wum-nl6.ko \
> >   .../after/panel-boe-tv101wum-nl6.ko
> > add/remove: 14/8 grow/shrink: 0/1 up/down: 27062/-31433 (-4371)
> > Function                                     old     new   delta
> > inx_hj110iz_init                               -    7040   +7040
> > boe_tv110c9m_init                              -    6440   +6440
> > boe_init                                       -    5916   +5916
> > starry_qfh032011_53g_init                      -    1944   +1944
> > starry_himax83102_j02_init                     -    1228   +1228
> > inx_hj110iz_init.d                             -    1040   +1040
> > boe_tv110c9m_init.d                            -     982    +982
> > auo_b101uan08_3_init                           -     944    +944
> > boe_init.d                                     -     580    +580
> > starry_himax83102_j02_init.d                   -     512    +512
> > starry_qfh032011_53g_init.d                    -     180    +180
> > auo_kd101n80_45na_init                         -     172    +172
> > auo_b101uan08_3_init.d                         -      82     +82
> > auo_kd101n80_45na_init.d                       -       2      +2
> > auo_kd101n80_45na_init_cmd                   144       -    -144
> > boe_panel_prepare                            592     440    -152
> > auo_b101uan08_3_init_cmd                    1056       -   -1056
> > starry_himax83102_j02_init_cmd              1392       -   -1392
> > starry_qfh032011_53g_init_cmd               2256       -   -2256
> > .compoundliteral                            3393       -   -3393
> > boe_init_cmd                                7008       -   -7008
> > boe_tv110c9m_init_cmd                       7656       -   -7656
> > inx_hj110iz_init_cmd                        8376       -   -8376
> > Total: Before=3D37297, After=3D32926, chg -11.72%
> >
> > Let's do the conversion.
> >
> > Since we're touching all the tables, let's also convert hex numbers to
> > lower case as per kernel conventions.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Wow that's a *VERY* nice patch.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!


> The metrics surprisingly reports more compact object code,
> I wasn't expecting this, but it's nice.

I think it has to do with the design of the table structure in this
driver. Each "struct panel_init_cmd" was 24-bytes big. That means that
to represent one 1-byte sequence we needed 24 bytes + 1 bytes cmd + 1
byte seq =3D 26 bytes. Lots of overhead for 2 bytes of content. The old
table stuff could certainly have been made _a lot_ less overhead, but
since it wasn't then it also wasn't hard to be better than it with it
via the new style.

FWIW, it also wouldn't be terribly hard to save a tiny bit more space
with the new style if we wanted. It gets a little ugly, but it doesn't
affect callers of the macro. Specifically, if you assume people aren't
going to pass more than 256-byte sequences, you could stuff the length
in the data:

 #define mipi_dsi_dcs_write_seq_multi(ctx, cmd, seq...)                  \
-       do {                                                            \
-               static const u8 d[] =3D { cmd, seq };                     \
-               mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
+       do { \
+               static const u8 d[] =3D { \
+                       (sizeof((u8[]){seq})/sizeof(u8)) + 1, cmd, seq }; \
+               mipi_dsi_dcs_write_buffer_multi(ctx, d); \
        } while (0)


...and then snag the length out of the first byte of the data in
mipi_dsi_dcs_write_buffer_multi(). If you do this, you actually get
another 10% space savings on this driver. :-P

add/remove: 0/0 grow/shrink: 7/7 up/down: 1140/-4560 (-3420)
Function                                     old     new   delta
inx_hj110iz_init.d                          1040    1385    +345
boe_tv110c9m_init.d                          982    1297    +315
boe_init.d                                   580     870    +290
starry_qfh032011_53g_init.d                  180     271     +91
starry_himax83102_j02_init.d                 512     568     +56
auo_b101uan08_3_init.d                        82     123     +41
auo_kd101n80_45na_init.d                       2       4      +2
auo_kd101n80_45na_init                       172     164      -8
auo_b101uan08_3_init                         944     780    -164
starry_himax83102_j02_init                  1228    1004    -224
starry_qfh032011_53g_init                   1944    1580    -364
boe_init                                    5916    4756   -1160
boe_tv110c9m_init                           6440    5180   -1260
inx_hj110iz_init                            7040    5660   -1380
Total: Before=3D32906, After=3D29486, chg -10.39%

I feel like people would balk at that, though...

-Doug
