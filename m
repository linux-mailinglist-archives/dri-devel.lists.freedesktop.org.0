Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5B378EE2A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 15:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3242B10E04C;
	Thu, 31 Aug 2023 13:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106E110E04C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 13:10:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D39D63FF8
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 13:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B44C433CB
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 13:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693487414;
 bh=Tx7w8FI/pLlA3uFq5GwLia/GR2hgOf2fgjsGhZzl+sk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iGIOjWFaoc2o3+D9pAiu+tKS35mKl+S0jaHg8kypiV3yFq21+2GVITjISQhWfpAdv
 bCcRVTXC++Bq4bS/DAS9XrufWeAlZf2Z50hk/OFSA35ImHW9DBOmxOEwrl/m/BmpkM
 9JveujHt2tgFXJjAiqLHHXP5lvXIKa+o6txV7VcCQN8qEnP6WAMnbiUlfU9KjpZ5tr
 YCKbxu71rqllAEenrYcz/5UKmN2n+DVJm0UHlFflCh5sIdP4j7KIOCfHFVJ+XdfFTD
 rDByGBAUoq+TwyJkqDDPbYuC+W2PsII4MlqFItMcYoshcRexmdKL+gG55NqyXn8W1X
 h9Ot5ry6gTl+w==
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6bcac140aaaso677074a34.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 06:10:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YxpcHQb1kVZYgUZgyC2mUVIXfJiHt2XJRC0yH8oHRliO2SBcH0K
 NPL0lR3ddC7mcnsN1vP4Dm0CncsF2JGs53QBlS4=
X-Google-Smtp-Source: AGHT+IG8i3WbP148tu9tcR8zh6tpPXpF5XXUrFtO3K953V/IifgX01VT9BiDyttjPL/yAvgZZMXCRFBxgo8FSTUsb7I=
X-Received: by 2002:a05:6830:606:b0:6bd:bba9:2d63 with SMTP id
 w6-20020a056830060600b006bdbba92d63mr5298073oti.9.1693487413878; Thu, 31 Aug
 2023 06:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230825-strncpy-habanalabs-combined-v1-1-daa05a89b7e3@google.com>
 <202308251513.0F6BF9FEE6@keescook>
In-Reply-To: <202308251513.0F6BF9FEE6@keescook>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 31 Aug 2023 16:09:47 +0300
X-Gmail-Original-Message-ID: <CAFCwf12yWnz6wP+3Th=QiTkeMhiPjn6c4sg2b3-2fE55w3pyEQ@mail.gmail.com>
Message-ID: <CAFCwf12yWnz6wP+3Th=QiTkeMhiPjn6c4sg2b3-2fE55w3pyEQ@mail.gmail.com>
Subject: Re: [PATCH] accel/habanalabs: refactor deprecated strncpy to
 strscpy_pad
To: Kees Cook <keescook@chromium.org>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 26, 2023 at 1:13=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Fri, Aug 25, 2023 at 10:09:51PM +0000, Justin Stitt wrote:
> > `strncpy` is deprecated for use on NUL-terminated destination strings [=
1].
> >
> > We see that `prop->cpucp_info.card_name` is supposed to be
> > NUL-terminated based on its usage within `__hwmon_device_register()`
> > (wherein it's called "name"):
> > |     if (name && (!strlen(name) || strpbrk(name, "-* \t\n")))
> > |             dev_warn(dev,
> > |                      "hwmon: '%s' is not a valid name attribute, plea=
se fix\n",
> > |                      name);
> >
> > A suitable replacement is `strscpy_pad` [2] due to the fact that it
> > guarantees both NUL-termination and NUL-padding on its destination
> > buffer.
> >
> > NUL-padding on `prop->cpucp_info.card_name` is not strictly necessary a=
s
> > `hdev->prop` is explicitly zero-initialized but should be used
> > regardless as it gets copied out to userspace directly -- as per Kees' =
suggestion.
> >
> > Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on=
-nul-terminated-strings[1]
> > Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en=
.html [2]
> > Link: https://github.com/KSPP/linux/issues/90
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
>
> Thanks for the consolidation and refresh. :)
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook
Pushed to habanalabs-next-6.7

Thanks for the patch,
Oded.
