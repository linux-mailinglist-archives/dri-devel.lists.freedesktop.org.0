Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBD6947EC9
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 17:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84BA10E243;
	Mon,  5 Aug 2024 15:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HhfULDWW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED0A10E243
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 15:56:30 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7a1df0a9281so655819685a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1722873386; x=1723478186;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GhxCvF/bdB7ARkocogWvdOYN1EHnCsxdnqmhWsHwq2A=;
 b=HhfULDWWtN9c3yzoGY7a0QmfrtUilrqwwYoYUua681CLnPZDKcuxRV+CfRkbIAvion
 4HzZ3Lw+xpfV3Lq5bn46Pi6z4L0NN2WOVa4dBqbHoJfhJ8VwaEM0rG01uStp0LMeBPGH
 94MJGItLSsm9DetJjlvLkkvRFhl11diDpsUeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722873386; x=1723478186;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GhxCvF/bdB7ARkocogWvdOYN1EHnCsxdnqmhWsHwq2A=;
 b=kENl8ZDdSKxZwiW5Ft9hnmLeFbwxns2Z4D5eVIZQZY7VzwI0cSiYWPpT0lGxEr0GUP
 +npbN8ZijAQDkzAmF6uG9ThrD7/o9TmPa1/4Vqy0xpDdZZhbvVVMMdQk4LyFApCb7C1r
 Uhu8s4giVyqvFE3V2LcJ29wxjrsIv8aGvCxVsztTh+MQYzJAL5arlNmZEYxfXzcubtJC
 /aVDSx/QzET5m78+spERXVo0rLNOx5vRniu4+dSrAjvMglc6kCRdBVuJ8JkTmzoG8jbL
 nnuF3HCjJjydF1LyOjVoU5MRPIL4NWeceLdr9PYofjNGNFnQcpVGpJ8r5J8zzV0Tq8m6
 EYxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVHr/b96n7m+Ar5pD6rmmYV5UJpESF1iVHMxE58b1nF41aedL3gPL87uzNLrBr/RtLnoLEV6xOdD8FMhsIqkhSXTXZHrex8mn9jTr6llTs
X-Gm-Message-State: AOJu0YzLiWO5nVpsWctXe5LobupyLP4PasGSb/EwuLdQrn5wb2FTK69h
 A+azAeo5mO7FnUPdkQs3V07Csz/8lEpHYbGyc/CD5oYRT3rjAZEM+rG3ZFXBJLZFtBHY0xGoxzU
 =
X-Google-Smtp-Source: AGHT+IGsUeDCWfxhwG3o/uZo7c+90LOMt1yZ5PlVG74BMwvrqk+Bn75JbTxXy3LH89ggScbdqRjwTw==
X-Received: by 2002:a05:620a:3902:b0:79d:69b5:aaf7 with SMTP id
 af79cd13be357-7a34eec2e63mr1542520685a.11.1722873386043; 
 Mon, 05 Aug 2024 08:56:26 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a34f77257csm364996185a.78.2024.08.05.08.56.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 08:56:25 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-44fee2bfd28so466591cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 08:56:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVUtLO4V2mFuoWI3XSbW8Xj7NCJvuqoiB21fYQYSCfIpDbxtZA/o751FXRV65QZutzwumHr1uyLEBY6a8LshSlw50IjfZhW/qw1SQd+Xusk
X-Received: by 2002:a05:622a:13cc:b0:447:eeb1:3d2 with SMTP id
 d75a77b69052e-4519b760378mr4844061cf.27.1722873384362; Mon, 05 Aug 2024
 08:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240725083245.12253-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240725083245.12253-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <gq5fcttutomphgfrwrtloqzczia3uc5qpont3lrowocan2xjc5@ubfabhsh3mfl>
 <CA+6=WdQuFYbADjG0i_zWMGYmw95H1U_McqCw4CLW0+Gate50YA@mail.gmail.com>
 <CAA8EJppoj1Y2675UOp=JH=-HLdYuuzfr2Sxy1zzkvLosmrRQNw@mail.gmail.com>
 <CA+6=WdQ6q=Zmji8KxCPYK17pFY4UAUBOykd5Tx4N_RZ1MfgOdg@mail.gmail.com>
In-Reply-To: <CA+6=WdQ6q=Zmji8KxCPYK17pFY4UAUBOykd5Tx4N_RZ1MfgOdg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Aug 2024 08:56:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V+bKW7aeD9hSkSE=pAOUpGyvhGqLhLmL6_z=+iBU8Urw@mail.gmail.com>
Message-ID: <CAD=FV=V+bKW7aeD9hSkSE=pAOUpGyvhGqLhLmL6_z=+iBU8Urw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/panel: jd9365da: Move the sending location of
 the 11/29 command
To: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, hsinyi@google.com, airlied@gmail.com, 
 daniel@ffwll.ch, jagan@edgeble.ai, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Sun, Aug 4, 2024 at 7:38=E2=80=AFPM zhaoxiong lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> Hi all
>
> Do you have any other suggestions for this patch?
> Looking forward to your reply, thank you

Please make sure not to "top post". Folks on the mailing lists
generally frown on this and it's a good way to get your email ignored
by some people.

At this point I think folks are waiting for you to post the next
version addressing comments. Specifically, things you'd want to change
for the next version:

* In the commit message (and subject), "refer to the commands with
their names" (Jani)

* In the commit message, address Dmitry's concern. In other words, say
something about the fact that this doesn't cause garbage being
displayed on the panel during startup and why not.


When sending v2, don't forget to include Jessica's "Ack" on patch #2.
