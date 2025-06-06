Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF1CACFC38
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 07:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD9810E359;
	Fri,  6 Jun 2025 05:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z9rHZrvX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3D710E359;
 Fri,  6 Jun 2025 05:31:41 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-235ea292956so17804655ad.1; 
 Thu, 05 Jun 2025 22:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749187901; x=1749792701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dzlXgy5IGuV11bydpJNOntnZHJEgtC/+n57kSppntuY=;
 b=Z9rHZrvX1eKp49FCXznwDiekkJTVSo7fHOs0nnUffM7HjbzoMPXgwaoMh8JguVEvMy
 kfz2lBC7k3W/+xdNuofVOPaHGmSNy1k58Ym5Ecr+lUgj8zVPJpDbFAgWuBNnPhaQpGPD
 O+usNZnlgUshlJmeaxMqADjlHILUQH1S2dYIvzwas5YGmFmTRLA6H4wEzd/uXkyZep/z
 coPBvgsxlHhTM09H//gAGzLtUT/7nAVNqTDFjNev0CSl7eaDLYMAihzu9zY+l37ZF/UN
 4ztLB4AfnQEz9txlFLFjRtyr6uRnbBbv9pkyjEcJ3lM/xluDAwqsIDAWSqII5HUekZiX
 45SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749187901; x=1749792701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dzlXgy5IGuV11bydpJNOntnZHJEgtC/+n57kSppntuY=;
 b=GM59jQe9v6GnM0bplbMSzeCl9mGCLxRPfAek4pa7TqyOY0V7l+o9q+K1RnO87cxeQy
 vr8drPVnQgVFplvsqfWwjFhvQNN0g3KfTA3aoF6rBoeYgOcbp8R4Z8eZ916BTo/Ku0jx
 7W0s6PqbFmbM/Pnn9LXYKVNJMX/pe7sUvTIHkApeTnrQuPND9clHkjR84F+qkCmE7J+1
 Bq+InajaoQPqUVKek1aAI2GYg5YsZLSs0hKMFH857cDoUGkRonP6SPBvqLmWVXyYJ2kS
 YozIqhSA3T9n6iuxCHCQDTOc2WYyw4wqIwWuiQlTie3RN3bN4gSgX8KzlRpa1cC0qVGr
 LJlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPEpeuwBWgVYE8pM1XSxW31skUBx2+SqSBa9nPMTnvFZvUyUd+/3wVsIS3Iu9GOynxfAEUkpOFBz4d@lists.freedesktop.org,
 AJvYcCWxX81yWwgHciuLaRzo2cOI43kFZv7pZMdxcXFaAtl68lJj1u0jOrmIT7MFK6gV/jntDUnJxUSb4W4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDQS8DuDqg+5juHJTRol6M3+hYtinYxO5wYIPlWshbJ9Kw86L8
 2k8EwC29c2ja/ft2KsVd0hIBMdFTd3QUxbMdBtBHZYOuoASc/BAgCLlk
X-Gm-Gg: ASbGnctFN/c0peFBQkmKEJJ3UC6c9J31X1QH3MeAMpEiIvQa3wWseN9PvdPZkppFjzn
 NF3j4BZa5OZUxnLYvlqgmWy2ga4bBOp+9F3gX9lFyaMsG0mcUmk9l5b3DwzqpJdLSRJaN7j2mn0
 ouyuV1dkA5+rkzr7D8DCm9oCKeb/PCTEkeRVPWM8QEiNQuuMHud8TDOAObxaLrTTVPqn1ax+VZl
 z72BShCMvyambH2LnoZpF2dN8HElNd1PeGOR3PKr2WoL6Rx/xzXHJSc2UP8S322VG/KFODwk28M
 kvfs687VDUGMz/1xvGgmdmo/my21wwqS6WvoengiknCJLE6QKxfH8nK6lDuO
X-Google-Smtp-Source: AGHT+IHm9V8MInY7eid9ZjIu/qmANGOMoaeiN5kAiiPpPU+C0cJpEdUtkuzqSwl6yjJEnE728bmZPg==
X-Received: by 2002:a17:903:41c9:b0:235:6e7:8df2 with SMTP id
 d9443c01a7336-23601d975acmr29530675ad.41.1749187901230; 
 Thu, 05 Jun 2025 22:31:41 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236034109cfsm4765675ad.200.2025.06.05.22.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 22:31:40 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: quic_amakhija@quicinc.com
Cc: Laurent.pinchart@ideasonboard.com, andersson@kernel.org,
 andrzej.hajda@intel.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org, quic_abhinavk@quicinc.com,
 quic_jesszhan@quicinc.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, rfoss@kernel.org, robdclark@gmail.com,
 robh+dt@kernel.org, robh@kernel.org, sean@poorly.run
Subject: Re: [PATCH v8 RESEND 0/2] Add DSI display support for SA8775P target
Date: Fri,  6 Jun 2025 13:31:22 +0800
Message-ID: <20250606053122.523651-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604071851.1438612-1-quic_amakhija@quicinc.com>
References: <20250604071851.1438612-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wed,  4 Jun 2025 12:48:49 +0530 Ayushi Makhija <quic_amakhija@quicinc.com> wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
>
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> Since I am just an amateur, so I followed some applied examples, like [1]
> If you mind this, I will describe in next version.

Hi, Ayushi. I think this series had been verified to work. Do you have
any idea in my case? According to the public information, SA8775P is
equipped with Adreno DPU1199, SA8295P(almost identical to SC8280XP) too.
And SC8280XP has the same dsi version and dsi phy. And my device tree
nodes for the DSI0 and DSI1 are almost same as yours. I got
`dsi_err_worker: status=4` only with a blanking screen.

Best wishes,
Pengyu
