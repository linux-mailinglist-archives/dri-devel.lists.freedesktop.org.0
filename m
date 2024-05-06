Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EBF8BD1E6
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 17:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D2310F0F9;
	Mon,  6 May 2024 15:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="EZznhXN8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2788C112180
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 15:55:03 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-79291262dc2so221823885a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715010900; x=1715615700;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jP99ie8/JjeXfuXOZy5e1iJKvfjTb7kt+yA1100I5K0=;
 b=EZznhXN8CxVHVxTkkrzWACS8I1bgPSNV+Uc4Y/dfwen7CWsFO1E1yRGHnv+ujikke5
 WXTr3EPlsgSer4hzPy0VhfjdrRYvoI7Kv7elf3klTr2zng3bnpgqnob9QZu5nmqFEnIG
 aJPd7bBNrXaJsvXuR/o096npUFr8+H6yinISc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715010900; x=1715615700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jP99ie8/JjeXfuXOZy5e1iJKvfjTb7kt+yA1100I5K0=;
 b=dhEu45LGu5vFXczIVC34cw8SLauBa7dPpAWsafhxfrf22RWYqHekasZv5uCRBAgxK3
 ZkdSxrbE7Z2l0SEEBX+21wCwyyKVzEhBVkD3jFCSqTcdshvm+LNm1JoxieBBOaE8HQp1
 jVvvH/cSF2DVbi6oDPgYSGPIQhe0n5s5pN/W6wkL1v+r0PRUPh+Af1vTfOy01ZyD/OT4
 ZWcFQSU6JNA/hid390yBgY6xmlZjB9eRz3JggdlReR8n+BNHINoM/CYvRrp/MqN782GQ
 MEHDbD7o/DgoocxexvNT1xsPRRRcbwEsPo0ZZpMhc31CvBpFzXSISSZm/PqXsZY1460Q
 Cpdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqskSPabFS8ygycdzyiklMq8HcUTONdPtIWEM831J/VN4RTGWsdpuvDLIHZa+Pua2yaEq/Q/mPEebf89neX5KzAlVUMNTXNrTO8dG29q3u
X-Gm-Message-State: AOJu0YxwInhKgKKYgPMnINvQix+MUon4U/Gs+3NQanwuFoZoV97RIxgj
 98btpv/8GYKT4y35zkVhQ32nbTPJwR23D98Tbblbei/8plZ44LP/PgjNxtcvOSCh5/EPbMkUWOU
 =
X-Google-Smtp-Source: AGHT+IE2Uv4VT6PkxyjqhfzM2idFLQoUHeCpHp5vo7Ubd9JstBMTLiWPhuv9Z/bzOA6UKEU2hcoFfQ==
X-Received: by 2002:a05:620a:4085:b0:792:8d92:35a4 with SMTP id
 f5-20020a05620a408500b007928d9235a4mr7479434qko.60.1715010899986; 
 Mon, 06 May 2024 08:54:59 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 cx23-20020a05620a51d700b007929bbc4b8dsm869485qkb.62.2024.05.06.08.54.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 08:54:58 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-439b1c72676so687211cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 08:54:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVY61msu8bNHXaD3M4sYFmGb6JAjlAj22h5R34/aYwoZVW9msMbnLwkMoqw2opw4Q4viOukvYPaPCvmY00Igy+jMtX3oBbS1uheAWPcEGJ9
X-Received: by 2002:a05:622a:514:b0:437:c89e:245b with SMTP id
 d75a77b69052e-43d087971dfmr4116421cf.15.1715010898305; Mon, 06 May 2024
 08:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240422060811.670693-1-xuxinxiong@huaqin.corp-partner.google.com>
 <CAD=FV=WRLLuOkCJeM6RdAb6xLN-cPH+hfWbOv9-LujB-WMGEFw@mail.gmail.com>
 <CAGoogDB-mj8_xu04w3V2ZxOBTWoXcPKrVR1NRt6BFcpjHX3-7Q@mail.gmail.com>
 <CAD=FV=WwsR9e-ZXJRY11FvdUZ66YPy9vqmY_=sGDw5Wqk1eV3w@mail.gmail.com>
 <CAGoogDBCzfKwkAA-VAs3_Cdw_4oFO94mt7yjy47Sp2RAtqtPxA@mail.gmail.com>
In-Reply-To: <CAGoogDBCzfKwkAA-VAs3_Cdw_4oFO94mt7yjy47Sp2RAtqtPxA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 May 2024 08:54:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WYiD-BUpksBnZrkWvORepZqtaAvm5645X-_oJPea0s0w@mail.gmail.com>
Message-ID: <CAD=FV=WYiD-BUpksBnZrkWvORepZqtaAvm5645X-_oJPea0s0w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add panel CSOT MNB601LS1-1
To: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@google.com, dri-devel@lists.freedesktop.org, 
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

On Tue, Apr 23, 2024 at 6:55=E2=80=AFPM Xuxin Xiong
<xuxinxiong@huaqin.corp-partner.google.com> wrote:
>
> Hi Doug, thank you!
> We had reported this info to the CSOT to correct the vendor id.
> If they confirm to fix this with the same product ID, we will submit a
> patch to fix this.

FYI, "top posting" like this is generally frowned upon on kernel
mailing lists. One such reference about this is [1]. Some folks are
very passionate about this topic, so please keep it in mind to avoid
upsetting people in the community.

In any case: did you get any response from CSOT about the improper EDID?

[1] https://subspace.kernel.org/etiquette.html

-Doug
