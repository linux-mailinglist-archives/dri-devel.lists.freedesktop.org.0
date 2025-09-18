Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA883B84FF6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 16:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B0F10E136;
	Thu, 18 Sep 2025 14:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="svjrO1Th";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1FB10E136
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 14:06:47 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-45b9c35bc0aso10379235e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758204406; x=1758809206; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Qwyr/Q/DO684tqA5E2UFLoEcNHQATu4w24pIRPlXIs=;
 b=svjrO1ThHM2YusMi8QcAblU6nRR4tKpZxV22HNcV3zattjjbP33AvY3NrPC3fk5QaY
 CpwA3PmP6m+KjBDgmHusdHb7fGUymfo7xO8XXRieg8ydjlWSqFvWCy4nIhP45rloLgJD
 GqUXlMwUVrecXffdhLFJvbF6XzlKxXG2B75JRid3Sl9yuQ8KPPGgqn8l8iMEcodqXhS5
 Lj5wdzoYtzw+5o6oqpWUWSwoZKNqOJG6nxrm6JzTAkdAZ27Ds4ZmCnX8Vl1FgIjh6xDJ
 GMNKEx/gtNyVBwm+yUoqUD375bqyZZYZjrzNcm3Z2+aVoon1w3fwNKXxL0sizamtjOMb
 3IyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758204406; x=1758809206;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+Qwyr/Q/DO684tqA5E2UFLoEcNHQATu4w24pIRPlXIs=;
 b=gY+kjJjBBMrYaui3ZlMM0pK231SHqrw4ArAKlEuayrw80LCRpzEFSAGUF+xjBaQ2mv
 1LH8ZZfdGsyWM3T2om0QZpEqkmcGTlbjyIpQk0qqjLebne7bY868lnTqCzHfvY7bAKIa
 XlbNJOKkp/2HN1PLa4T4H2FeOVSjZU8REDiyQX5q3DRmyqMqyiFzGk4xyXfsVcT5bsRh
 eTkN25XzgtOF/LRwo6BjTO3t+D2IHRcrRUJ/HNp3NwTRknoIDEa0WlEM6i9HkKkIyEX6
 LCwrF6+SxJ4esv6+2VWLTLxXGgBxfU1xpRvFg+dhEmjhLfP+b6O5bYRnSd5aa/ZHk72C
 mn4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY6B4c+wgoEuQxKCfWeZOhCSJ/lmqeaksf3nxfknrgePH/45UqZKzazmfSeobKzCcpVVkM6PYVuBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZZUrN+1uE7Z859Y8Cuq4GjTdHvcwWZbcIgtcOky7nxamT7xmN
 aruQKVeNDWTzsdxzOEMwIHX0LtNN/KR07UHzVR3+aV5UMjO/G4Fs6RDmmfkp5+yWLeI=
X-Gm-Gg: ASbGnctpMxzSigJpMtTt5OJDUAVqODmFPLo3pXdO+16tDS2htl0S+rGXcseccbz00Pa
 lnYvEjUvqPPTyam3+scfAFSGBqxqtnSiFr0cTyHfulFQo596N0s18seqFO04PrF0tTAihOID3Az
 eGy8gXt6qmKNvniQcfQZa32xTxbEBqCVjbyWO6Uhru3I6GHBXUu4izlXbgjH2Y5DF4OzLMJ5eDJ
 GFbRxSx3mBWtJEO1XFVY6NA1HElaP091bVyoKtgTr4DtZF3jY6up1OZ5BBJAzr6dMcqW71TYE1n
 KlwgMCMdVbclnNPRMbrQdV6aBllEW7LITrqdDXZDLcg4wGSYT4vldT1tzS+ZhzPX2yWRO1K5oka
 Td6BJOh5NGa2Nz6iXMnUiGkpCWmcYO7wAm8YFaSxAct7DUvM=
X-Google-Smtp-Source: AGHT+IERljH7jdoxo2opn/uBJwfRgd6NXD2EBQPVMIWYZg2WmEP7Evl3akNrhDu4Phe9l2VQFkR+sA==
X-Received: by 2002:a05:600c:42c1:b0:45c:b6fa:352e with SMTP id
 5b1f17b1804b1-462d4ca0573mr40002205e9.18.1758204405811; 
 Thu, 18 Sep 2025 07:06:45 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbf286dsm3713795f8f.56.2025.09.18.07.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Sep 2025 07:06:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Sep 2025 15:06:42 +0100
Message-Id: <DCVZFZQUBDLU.ZKUOLCK5HWSW@linaro.org>
Cc: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v10 2/5] arm64: dts: qcom: lemans: add GDSP
 fastrpc-compute-cb nodes
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Ling Xu" <quic_lxu5@quicinc.com>, <srini@kernel.org>,
 <amahesh@qti.qualcomm.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>,
 <arnd@arndb.de>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1
References: <20250813030638.1075-1-quic_lxu5@quicinc.com>
 <20250813030638.1075-3-quic_lxu5@quicinc.com>
In-Reply-To: <20250813030638.1075-3-quic_lxu5@quicinc.com>
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

On Wed Aug 13, 2025 at 4:06 AM BST, Ling Xu wrote:
> Add GDSP0 and GDSP1 fastrpc compute-cb nodes for lemans SoC.

How was it tested?
Does it actually work or was constructed from downstream files?


> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 58 ++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 322abd0294be..a4c79194cee9 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi

[...]

Best regards,
Alexey
