Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E068B5DE2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 17:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40BE10E4C7;
	Mon, 29 Apr 2024 15:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4kUOyiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D6C10E6A7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 15:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714405168; x=1745941168;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=h9MGGwKZVRUgN0bDFdFcodYM4/Bv2gUDW4BQmK4V7rk=;
 b=H4kUOyiUqX0GynofenalJU333BmU9+MREeMZ+t6deRiptsHgthOrtvso
 jcSZ4ZJE4/ZmB5fsL4jzFKDUwXq+/6ol3EroYgoiVWibw7gvZHcUoPGjq
 Dzi8aqGk5u5xHwDRcgRg+kmJlNWU6BqN52HbMYPJLF56iuWCHnSBfAtnL
 JX64CowOucAcSC6BL3W+mM845oKQqHKw+p1yw+8JMXrxTFUu/ovKzts5M
 XMK0C6nYD1qiS1P/yQPRu3glLAZXaXOrptO8j4+kxKhkqm0/iqT/QavXC
 qCXl4K+WBoEluQu+9CveliHA5Wg85xSNMAIvxwUDeEHEL5WNRPo2QQDdC w==;
X-CSE-ConnectionGUID: BKsmPuvDQviupOLFxrXpwg==
X-CSE-MsgGUID: TLgmuAqtQbqVW57qvpdwJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="35464155"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="35464155"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 08:39:27 -0700
X-CSE-ConnectionGUID: 3jPk27OrSBajaLlKSBR73g==
X-CSE-MsgGUID: 4IAmxJ5xSk6hssnGCt8dsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26762827"
Received: from aantonov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.167])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 08:39:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>, neil.armstrong@linaro.org
Cc: dri-devel@lists.freedesktop.org, Linus Walleij
 <linus.walleij@linaro.org>, lvzhaoxiong@huaqin.corp-partner.google.com,
 Hsin-Yi Wang <hsinyi@google.com>, Javier Martinez Canillas
 <javierm@redhat.com>, Joel Selvaraj <jo@jsfamily.in>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Cong Yang
 <yangcong5@huaqin.corp-partner.google.com>, Sam Ravnborg
 <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] drm/mipi-dsi: Introduce
 mipi_dsi_*_write_seq_multi()
In-Reply-To: <CAD=FV=V=EvEGp4tGDd-UQ1R=XkAwDn04ftd8oWU=UE=3Gi7SLQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240426235857.3870424-1-dianders@chromium.org>
 <20240426165839.v2.4.Ie94246c30fe95101e0e26dd5f96e976dbeb8f242@changeid>
 <2af446d3-7834-4a6b-897b-b14c6bccff65@linaro.org>
 <CAD=FV=V=EvEGp4tGDd-UQ1R=XkAwDn04ftd8oWU=UE=3Gi7SLQ@mail.gmail.com>
Date: Mon, 29 Apr 2024 18:39:18 +0300
Message-ID: <87y18w2n6h.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Mon, 29 Apr 2024, Doug Anderson <dianders@chromium.org> wrote:
> Hi,
>
> On Mon, Apr 29, 2024 at 2:38=E2=80=AFAM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> > +/**
>> > + * struct mipi_dsi_multi_context - Context to call multiple MIPI DSI =
funcs in a row
>> > + * @dsi: Pointer to the MIPI DSI device
>> > + * @accum_err: Storage for the accumulated error over the multiple ca=
lls. Init
>> > + *   to 0. If a function encounters an error then the error code will=
 be
>> > + *   stored here. If you call a function and this points to a non-zero
>> > + *   value then the function will be a noop. This allows calling a fu=
nction
>> > + *   many times in a row and just checking the error at the end to se=
e if
>> > + *   any of them failed.
>> > + */
>> > +
>> > +struct mipi_dsi_multi_context {
>> > +     struct mipi_dsi_device *dsi;
>> > +     int accum_err;
>> > +};
>>
>> I like the design, but having a context struct seems over-engineered whi=
le we could pass
>> a single int over without encapsulating it with mipi_dsi_multi_context.
>>
>> void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
>>                                      const void *data, size_t len);
>> vs
>> void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_device *dsi, int *a=
ccum_err,
>>                                      const void *data, size_t len);
>>
>> is the same, and it avoids having to declare a mipi_dsi_multi_context an=
d set ctx->dsi,
>> and I'll find it much easier to migrate, just add a &ret and make sure r=
et is initialized to 0.
>
> Yeah, I had the same reaction when Jani suggested the context style
> [1] and I actually coded it up exactly as you suggest above. I then
> changed my mind and went with the context. My motivation was that when
> I tested it I found that using the context produced smaller code.
> Specifically, from the description of this patch we see we end up
> with:
>
> Total: Before=3D10651, After=3D9663, chg -9.28%
>
> ...when I didn't have the context and I had the accum_err then instead
> of getting ~9% smaller I believe it actually got ~0.5% bigger. This
> makes some sense as the caller has to pass 4 parameters to each call
> instead of 3.
>
> It's not a giant size difference but it was at least some motivation
> that helped push me in this direction. I'd also say that when I looked
> at the code in the end the style grew on me. It's really not too
> terrible to have one line in your functions that looks like:
>
> struct mipi_dsi_multi_context ctx =3D { .dsi =3D boe->dsi };
>
> ...and if that becomes the canonical way to do it then it's really
> hard to accidentally forget to initialize the error value. With the
> other API it's _very_ easy to forget to initialize the error value and
> the compiler won't yell at you. It also makes it very obvious to the
> caller that this function is doing something a little different than
> most Linux APIs with that error return.
>
> So I guess I'd say that I ended up being pretty happy with the
> "context" even if it does feel a little over engineered and I'd argue
> to keep it that way. That being said, if you feel strongly about it
> then we can perhaps get others to chime in to see which style they
> prefer? Let me know what you think.
>
>
> [1] https://lore.kernel.org/r/8734r85tcf.fsf@intel.com

FWIW, I don't feel strongly about this, and I could be persuaded either
way, but I've got this gut feeling that an extensible context parameter
might be benefitial future proofing in this case.

BR,
Jani.


--=20
Jani Nikula, Intel
