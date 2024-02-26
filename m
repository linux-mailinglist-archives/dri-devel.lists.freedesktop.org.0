Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE14B86756B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B7610E5EB;
	Mon, 26 Feb 2024 12:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="qnD5zU/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A375C10E5EB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:44:07 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7c3e4290f5fso142588339f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 04:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708951446; x=1709556246;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q+35+P4r2JIren/LNJaaaherP1wCOAvB2HpC0DyEeMg=;
 b=qnD5zU/lkjdgFhzuOY1zgMlwJoN39NYtyBnTdFguKOFpv3xI5iQfeFPKFNSG5UWZBb
 nMQrnOFZJURvxTld5stEAv+Id/Lg/4VHq3fTZyUsWrzLratF1HfWOgxItCgDnGprdx/w
 p5lGFZ9tRsv0hNzWHCHFcuvULwYD+rxR8zsPC7czwXaqjhUOk/Em+3Md/gu+eqwtlPBN
 5m5KT4itIesi7D0IK0O0vnx6GWdbfXNjsAxfAQkg7+/PbYLDvjEKkPdoI+BM3dkrdVDf
 gPtnSDbUmDGEuhyEho0HTA0Hvtor+w/I52OLqUly6sYhvKpNQ5zdK98sJi4y7XAnEla2
 9+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708951446; x=1709556246;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q+35+P4r2JIren/LNJaaaherP1wCOAvB2HpC0DyEeMg=;
 b=JZ6gOtgGfA38GrVb7Ox8NtpVj35WQaFZNEHrR9P1byKza9FS0NKjM8ZDwbWgSECFs6
 evyOc9OKxqG7ze23d36DsBQc86arjQWsG/ke2+v5WyH7hqLJsnHy5uwDqpJn2bTHVqNC
 NcN+ZU8sc5bjsWcuzY3dOKsRi79x+Q/7PFAOz0RLJNJ2UMXbtXxhV3DZ66OIHHZEm3qa
 hk5hvkS4vRkQt6/027yoVAltFBLlGKGtDHwQz/woefMU9eELo9d5c0T3hLeEB2KVDnPZ
 /HYOdHIC/tQP78ZBHXebsVSlgxrVmQr5BWrnxCdyL7VKujrzzLwD4z7EKc/esrlejWIF
 UTGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqt3K3kyLsEbUul4VlbiXjT4o8WGUqYnGAI6to+tGI4v+UdAUGFf4+E+WHSl2mXh0Krs6UvrbqJfO64bi4QxAp00FlfZWwyXwzlOIMSYyf
X-Gm-Message-State: AOJu0YwLtBrnTZgcSVPm05oQ/vOERwJw8L+LESnea05BfZr0hYs38BJc
 LopK9g/eck3as7uwpp+xmQt5HERq8b6YKFxI70XRH6cY+PDPB/bN2OnOTbkvESKI8LyDIPQbJGN
 CIfS5Yg7vQSM8oJcBJSEMqify3l20fXtwjUf9
X-Google-Smtp-Source: AGHT+IHcQ49ya8fWuFRYRtaEwX1j4GO+9eoCIEgu+RmTzs9mIQP4CSt0k7FW7/FiUFuNkGHC/QwN3dkzwfDTaAEIpSg=
X-Received: by 2002:a6b:c8d8:0:b0:7c7:9646:827b with SMTP id
 y207-20020a6bc8d8000000b007c79646827bmr7806606iof.18.1708951446529; Mon, 26
 Feb 2024 04:44:06 -0800 (PST)
MIME-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-9-panikiel@google.com>
 <13aeb2ff-72f4-49d9-b65e-ddc31569a936@linaro.org>
 <CAM5zL5q0oKoTMR0jSwYVAChCOJ9iKYPRFiU1vH4qDqhHALKz4w@mail.gmail.com>
 <e1fd8cbd-060b-4d15-8256-6d8dbba545da@linaro.org>
In-Reply-To: <e1fd8cbd-060b-4d15-8256-6d8dbba545da@linaro.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Mon, 26 Feb 2024 13:43:55 +0100
Message-ID: <CAM5zL5qxBM1xQ__t86gxUKMy8O3BzoCe_vTFxxsqFq7mw4-8EQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] media: dt-bindings: Add Intel Displayport RX IP
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
 ribalda@chromium.org
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

On Mon, Feb 26, 2024 at 1:06=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/02/2024 11:59, Pawe=C5=82 Anikiel wrote:
> >>> +properties:
> >>> +  compatible:
> >>> +    const: intel,dprx-20.0.1
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +
> >>> +  intel,max-link-rate:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Max link rate configuration parameter
> >>
> >> Please do not duplicate property name in description. It's useless.
> >> Instead explain what is this responsible for.
> >>
> >> Why max-link-rate would differ for the same dprx-20.0.1? And why
> >> standard properties cannot be used?
> >>
> >> Same for all questions below.
> >
> > These four properties are the IP configuration parameters mentioned in
> > the device description. When generating the IP core you can set these
> > parameters, which could make them differ for the same dprx-20.0.1.
> > They are documented in the user guide, for which I also put a link in
> > the description. Is that enough? Or should I also document these
> > parameters here?
>
> user-guide is something for users, like user-space programmers or
> end-users. I would never open it to look for any information related to
> hardware.
>
> Anyway, external resources are a no-go. We have it clearly in submitting
> patches:
>
> https://elixir.bootlin.com/linux/v6.8-rc6/source/Documentation/process/su=
bmitting-patches.rst#L130

Okay, I will describe these properties in the bindings as well.

>
> >
> >>
> >>> +
> >>> +  intel,max-lane-count:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Max lane count configuration parameter
> >>> +
> >>> +  intel,multi-stream-support:
> >>> +    type: boolean
> >>> +    description: Multi-Stream Transport support configuration parame=
ter
> >>> +
> >>> +  intel,max-stream-count:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Max stream count configuration parameter
> >>> +
> >>> +  port:
> >>> +    $ref: /schemas/graph.yaml#/properties/port
> >>> +    description: SST main link
> >>
> >> I don't understand why you have both port and ports. Shouldn't this be
> >> under ports?
> >
> > I put both so that you can use the shorter port property when the
> > device only has one port (i.e. no MST support). It would work fine
> > without it. If you think that's unnecessary, I can remove it (and use
> > the ports property even if there is only one).
>
> No, it is fine, but then you need allOf: which will restrict to only one
> of them: either port or ports.

There already is an allOf below that says that ports is required for
MST support and port is required otherwise. Isn't this enough?
