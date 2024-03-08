Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083A2876675
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 15:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5A41138D2;
	Fri,  8 Mar 2024 14:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Mj8Hziac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3859D10E4F8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 14:38:38 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-42ef17b4021so4529861cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Mar 2024 06:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709908716; x=1710513516;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rfUzWRFLFY+rkoyDqY8l5et5GO0+hQpyzOAN51RCdxI=;
 b=Mj8HziacvEFgoEIbZEyUrMUu4bcY5Va6ja5XU8NPU1DeZIO0M3fgdRUeVqgAKyYVv6
 deZrA8avYVmMekfs31KPUPsjQVtaDDdjCz2ch4VnSulO0jsYB4CqeX2NthHAHRWEllHI
 HCfmfWJ8Dz7mZ2IAvqUsiOly7g/w8kreXZULE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709908716; x=1710513516;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rfUzWRFLFY+rkoyDqY8l5et5GO0+hQpyzOAN51RCdxI=;
 b=rotwlEHnrfXFkmpQVkT1DJN7z1BBt5ZQbPUu3zN86J9mJEB7td0jPib2hFyRpZTEZW
 PAqY3SQEKSEsdhCTu2eXHA8sh7Gzx9G55oAseIZl9vw+1cibTvFmxQxcjcM6B/wOLHDU
 aiJGdJQ+Q3UtkeROPstlB7Tl5ovm1VQY/TiROhnXUFuHynsk+RrVXIKTmFCKIrX4DnZ+
 a+Ng3f0lDHoopxv4IWnBTGqlnRTOruEaWEd5+hK6LC2bPh6qtUjYFlN/JmbValcapJzN
 6t5RXHfxYV/0SFrnyPeL+NrhECRzTs20Upji6uj8D2xGtUjGQiq/A5KSZ8hpzf3L9vLV
 RDuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP2Kq5KL6iv+oiSMDCtAJYaTPaDRrfuyoHL6fM2tuLQgD0VgFjIdIFuD8XLOwy4lISNTzwgkl55jNcHimj5Uo8WoDUG35Bd8D5VlU37mEb
X-Gm-Message-State: AOJu0YwXQ4ZCcEWO42TxIsI3bVcDvBHlrNou5+FwkfO7ois2opHw+V9e
 hMNQRTvJiXshldUjO4WDYRLVWCrWJo7TNdoOJu1WV1X1bGOAB0bGx9SYKsg1jcGPFDyssdaqojs
 =
X-Google-Smtp-Source: AGHT+IFyfr514MK7EjcJn60osg5p2BT8Aq3YgoGhvE1qERZKy+52x0Fn7fmzTXYm7J5/tbsE8mNFNA==
X-Received: by 2002:ac8:5815:0:b0:42e:e489:ad31 with SMTP id
 g21-20020ac85815000000b0042ee489ad31mr152924qtg.51.1709908715968; 
 Fri, 08 Mar 2024 06:38:35 -0800 (PST)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 b17-20020ac86bd1000000b0042f192bced9sm1945577qtt.64.2024.03.08.06.38.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 06:38:34 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-42ef8193ae6so257071cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Mar 2024 06:38:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW6FOt9FGjeOXcWpw4a7kPUJeqS/+CmUne5EX/NE0fOqihvLE4TAeajXWEjSqbwC9s6HhDYc8NoaSTCozIcJAQ+R30cxjB9TfC8aknaQY/0
X-Received: by 2002:a05:622a:1a25:b0:42e:b6df:819d with SMTP id
 f37-20020a05622a1a2500b0042eb6df819dmr680036qtb.24.1709908714154; Fri, 08 Mar
 2024 06:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20240307230653.1807557-1-hsinyi@chromium.org>
 <20240307230653.1807557-3-hsinyi@chromium.org>
 <87jzmduoy8.fsf@intel.com>
In-Reply-To: <87jzmduoy8.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 8 Mar 2024 06:38:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VsTq_Yy14n5Ygbxqn4pnguG3wC2AQforP8vdX-Wgn0Dw@mail.gmail.com>
Message-ID: <CAD=FV=VsTq_Yy14n5Ygbxqn4pnguG3wC2AQforP8vdX-Wgn0Dw@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] drm/edid: Add a function to match EDID with
 identity
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Fri, Mar 8, 2024 at 12:07=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Thu, 07 Mar 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > Create a type drm_edid_ident as the identity of an EDID. Currently it
> > contains panel id and monitor name.
> >
> > Create a function that can match a given EDID and an identity:
> > 1. Reject if the panel id doesn't match.
> > 2. If name is not null in identity, try to match it in the detailed tim=
ing
> >    blocks. Note that some panel vendors put the monitor name after
> >    EDID_DETAIL_MONITOR_STRING.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
> The series seems good to go. Thanks Hsin-Yi and Douglas for the
> constructive collaboration! I believe the end result is better now.

Thanks! Unless there are any objections in the meantime, I'll plan to
apply the whole series to drm-misc-next late next week.

-Doug
