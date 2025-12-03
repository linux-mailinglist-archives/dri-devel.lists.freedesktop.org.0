Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCB9CA0E55
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 19:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C9D10E80E;
	Wed,  3 Dec 2025 18:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ntxr8hBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CEF10E7F8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 18:20:00 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b7355f6ef12so5188266b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 10:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1764785997; x=1765390797;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o99uhCORWh/UFDqgDvKdfjHOH8a6cDuqoxB8tGN+bLc=;
 b=Ntxr8hBoriXGCvVW+r/ZbFKSJDBgnOvWkTf2p6dFIz5gA1mGaXpAgt8ZACYbf0TmrN
 DtG+7hyNTvKdq/e2VvvQhEAmjOWZlMshm1kzvtZzLpQ1sjvdb6edp46wgh9uLuX9W5XF
 SLXdphpBGadlUlIlm44HA97u4X3SDBRQjPxQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764785997; x=1765390797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o99uhCORWh/UFDqgDvKdfjHOH8a6cDuqoxB8tGN+bLc=;
 b=Tf45HdePXH2Gu/Qtdtz3ZuC8lYuvyACEHIA1+wAZL10RVlMySWUnmy/oIMDq+IXkfq
 KSV1fipOdkkhaVnYvaThw6Gdokvoz3SYa6ZPhXLrkrjbma1IAcdXtL22DUjxVK1FXbpf
 v7G8KI0bH0VmwUugbDifNtOpQzz5npZcuIwevrcSDGgx9FF7Dgp+TwDuBRZi9u3wWmn7
 kw1V145ZDqveAvwtsqtDPROhOzeOeAkRcwi11iq7nnzq/IRq3iKbEgAL75NmWdZq+zP2
 IwKuS2b18fVSh3ZvOj54rDqnguQTXlo1jxVJEReLcQgDqHO6YQpuZxU41r0e5ZyHUcCi
 domA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8eU8y8bUL5jS+7+TPfyK3Bu5yWFrIBAfh0IX/MnXWgJ5sqVbTWhVTVduCvjR3VNM2XsWKvaA9owQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFzZH0fz75QqmVornQg6lK68DMmFZ/DrYwNHvpY46leZ/6jyZ3
 naw0zSvqULQOgJsCwxTrjnnviaRvdDEenO8iKAH6u2coHl06Y3NVDdXpATfCYi4gmSOcwu/DKwM
 QY3Ki9wYI
X-Gm-Gg: ASbGnctcNe9s8Mn5rYtHLbZgO7q4rDp0n1drFib6AOAFOYWFNytiBZtfi4AGyZyDrLP
 0pfHjuYwY6kaXToOFfPQCQs8/EA/FhgrkY9iiv5oQE/9lVUVOouUqb7ixs9/igQCh24LI/tyE1D
 w5m0m+Pxry99EwOD9PDGsPYul5qq4a9ssYISLzReKAkaiSDO3EoLnQ2nYEMir4Pgy2BBdM1I2qb
 G5T5s6FhtZwvZf254gNkypgJ7MxiIO8WNCnlgLzwmjsPe8LcY89XLMHPPNjJtGFT9N39c3hoyoK
 7St26yEVNHleRKkoUPg2DwLBzsMc0Hl/FMzdbJ2cCiUsPtWTNoCqUQnjUVxPeI432hi6sjqTwHu
 lV0h5vgnWoOvGMtD0+hz7Tuu9ukPue8msKxy+kggvHXmaE3e9GJenOqGk30/mdWGWFb7RxSOfXg
 DMejqXebIp4rrxaj78jYVU1W0FOU5LVODYk1u8n8InYXw9yu9CTIot0VF+50dM
X-Google-Smtp-Source: AGHT+IHTwpAAnd4Uqe5892mVmfiYbnKStGn5+5xoLOqnzAG8+/btfEQuHqgcDYmDfBxYb3C19V/uug==
X-Received: by 2002:a17:907:d8e:b0:b73:1baa:6424 with SMTP id
 a640c23a62f3a-b79dc7c29b5mr432022266b.55.1764785997528; 
 Wed, 03 Dec 2025 10:19:57 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f51c6c12sm1845997866b.29.2025.12.03.10.19.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 10:19:56 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-42e2e08b27eso52004f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 10:19:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV+L1ePAeR/s06kX4QsOhut4MySvf/dtHqVj+s7ynMb784SsAY6015LTv/SvtKZ22ypfpz576HZWt4=@lists.freedesktop.org
X-Received: by 2002:a05:6000:2503:b0:42b:3bfc:d5cb with SMTP id
 ffacd0b85a97d-42f731d0475mr3346216f8f.51.1764785995967; Wed, 03 Dec 2025
 10:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20251203074555.690613-1-alexey.klimov@linaro.org>
In-Reply-To: <20251203074555.690613-1-alexey.klimov@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 3 Dec 2025 10:19:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wv7cBmLkVS688HOwemDvzyvjVDjXj=pfdrgjYpA0GtSw@mail.gmail.com>
X-Gm-Features: AWmQ_bky44Z4LDCK7KCL0i5nEFoSAhZRvLedqlkONzgJXUwW3vMGse6NdNy_cbA
Message-ID: <CAD=FV=Wv7cBmLkVS688HOwemDvzyvjVDjXj=pfdrgjYpA0GtSw@mail.gmail.com>
Subject: Re: [PATCH] gpu/panel-edp: add AUO panel entry for B140HAN06.4
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 vkoul@kernel.org, andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Dec 2, 2025 at 11:46=E2=80=AFPM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> Add an eDP panel entry for AUO B140HAN06.4 that is also used in
> some variants of Lenovo Flex 5G with Qcom SC8180 SoC.
>
> The raw edid of the panel is:
>
> 00 ff ff ff ff ff ff 00 06 af 3d 64 00 00 00 00
> 2b 1d 01 04 a5 1f 11 78 03 b8 1a a6 54 4a 9b 26
> 0e 52 55 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 14 37 80 b8 70 38 24 40 10 10
> 3e 00 35 ae 10 00 00 18 10 2c 80 b8 70 38 24 40
> 10 10 3e 00 35 ae 10 00 00 18 00 00 00 fe 00 41
> 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 42 31 34 30 48 41 4e 30 36 2e 34 20 0a 00 eb
>
> I do not have access to the datasheet and but it is tested on above
> mentioned laptop for a few weeks and seems to work just fine with
> timing info of similar panels.
>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] gpu/panel-edp: add AUO panel entry for B140HAN06.4
      commit: 2976aeb0de77da599ad37691963efbdcb07435ce
