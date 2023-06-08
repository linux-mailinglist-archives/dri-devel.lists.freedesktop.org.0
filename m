Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA5A72834D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 17:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1629B10E021;
	Thu,  8 Jun 2023 15:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D051010E021
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 15:11:14 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-75d461874f4so65068885a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 08:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686237073; x=1688829073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XKYIY8lnLeesFrrYGM6yGBBcxp2DdDvQNqXJ/GPrn+0=;
 b=BmAm0rXM4KZbTYym0HXYlOClgT/zGWm4ze6fwFqXwAqD1ItkmTYBl/+afhC3UDFEZl
 uuRCKPD6RgfoUkFKIWZwzbDtBFAA1JCrB8QIqhbKWGVLgphLs9tCNZ4dqqMrQJ95EdDS
 +7AZci3CA88AqfAQL6mijMM679CIZt98Z/tco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686237073; x=1688829073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XKYIY8lnLeesFrrYGM6yGBBcxp2DdDvQNqXJ/GPrn+0=;
 b=LC+rz/NR61R0xtAvrcvDucJmKmM7530C8GgG7tZMk7LUzxq4ddnevT23B3IlhRl5hS
 qhKkc5kBWROQWjZSCBILklru3wg0cPpAWBSkhqrJ/IbtINAg0V9+MgqdvrWfcNfZM1w7
 YdjtvUEK3WQ09ab3QCuiu0IpTGsQc7JzBKJ6zaD9gP5nI3WDe4LVjrIuZ38pPg+3SUc4
 q3LAFvTksLandQ6EvHGF7eatx0PYkLtbBGaPBARjljhMlSxnwCUg6oCn1P7MKNUuXWZL
 KqRalZfVZ6b3D51g+nBh54THQZMO5MdEeVtRFL34vAXGpMSD28vf5H/YMRQwSmsp4qNq
 jRZQ==
X-Gm-Message-State: AC+VfDzAJ23Wx7nMC10XZJPsPXnRCCOtx1z0EtHgj5I/GzvTmevoJoP5
 fskvZW2up2/YAgNedoiV8JyL5oJiLChXTUeJyrU=
X-Google-Smtp-Source: ACHHUZ4758YwvCBeUTui3hSUZyXtj8CYLxNDY2Jx6NSol+SSrp7tadw1hzZLWKZKbng5Mdu1Kjtxhg==
X-Received: by 2002:a05:620a:2a14:b0:75e:c960:9205 with SMTP id
 o20-20020a05620a2a1400b0075ec9609205mr7772422qkp.16.1686237072691; 
 Thu, 08 Jun 2023 08:11:12 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 z17-20020a05620a101100b0075eca73737asm383684qkj.60.2023.06.08.08.11.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jun 2023 08:11:12 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-3f9b7de94e7so218671cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 08:11:12 -0700 (PDT)
X-Received: by 2002:a92:c549:0:b0:33d:929c:af67 with SMTP id
 a9-20020a92c549000000b0033d929caf67mr120694ilj.17.1686237051541; Thu, 08 Jun
 2023 08:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
 <202306081419.Dzz0T4iW-lkp@intel.com>
In-Reply-To: <202306081419.Dzz0T4iW-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jun 2023 08:10:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UMryHK+8j9FCKtSxykB8Tc-tU_B7MXMQPxpkdP2h8mJA@mail.gmail.com>
Message-ID: <CAD=FV=UMryHK+8j9FCKtSxykB8Tc-tU_B7MXMQPxpkdP2h8mJA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] HID: i2c-hid: Support being a panel follower
To: kernel test robot <lkp@intel.com>
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org,
 hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, oe-kbuild-all@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 8, 2023 at 12:15=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Douglas,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on hid/for-next dtor-input/next dtor-input/for-lin=
us drm-misc/drm-misc-next linus/master v6.4-rc5 next-20230607]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Douglas-Anderson/d=
t-bindings-HID-i2c-hid-Add-panel-property-to-i2c-hid-backed-touchscreens/20=
230608-055515
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git fo=
r-next
> patch link:    https://lore.kernel.org/r/20230607144931.v2.8.Ib1a98309c45=
5cd7e26b931c69993d4fba33bbe15%40changeid
> patch subject: [PATCH v2 08/10] HID: i2c-hid: Support being a panel follo=
wer
> config: i386-randconfig-i003-20230607 (https://download.01.org/0day-ci/ar=
chive/20230608/202306081419.Dzz0T4iW-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git =
8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=3D1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git remote add robh https://git.kernel.org/pub/scm/linux/kernel/g=
it/robh/linux.git
>         git fetch robh for-next
>         git checkout robh/for-next
>         b4 shazam https://lore.kernel.org/r/20230607144931.v2.8.Ib1a98309=
c455cd7e26b931c69993d4fba33bbe15@changeid
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.cr=
oss W=3D1 O=3Dbuild_dir ARCH=3Di386 olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.cr=
oss W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306081419.Dzz0T4iW-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: drm_panel_add_follower
>    >>> referenced by i2c-hid-core.c:1159 (drivers/hid/i2c-hid/i2c-hid-cor=
e.c:1159)
>    >>>               drivers/hid/i2c-hid/i2c-hid-core.o:(i2c_hid_core_pro=
be) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: drm_panel_remove_follower
>    >>> referenced by i2c-hid-core.c:1218 (drivers/hid/i2c-hid/i2c-hid-cor=
e.c:1218)
>    >>>               drivers/hid/i2c-hid/i2c-hid-core.o:(i2c_hid_core_rem=
ove) in archive vmlinux.a

Thanks for the report! Ugh, I guess I forgot that even though
DRM_PANEL is bool, it gets bundled up into all of DRM which can be a
module. Assuming that this series looks mostly the same in the next
version, I'll plan to add this:

depends on DRM || !DRM # if DRM=3Dm, this can't be 'y'

...to each of the i2c-hid subclasses.

-Doug
