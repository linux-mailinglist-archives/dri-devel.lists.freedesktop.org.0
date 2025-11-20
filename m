Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF36C71A8C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 02:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B1010E284;
	Thu, 20 Nov 2025 01:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="T9fhBlWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC9710E284
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 01:10:57 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-64312565c10so421629a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 17:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1763601055; x=1764205855;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HNKStvuc0XB3JshjhPWn5gZkIa6YpjmT/QSv6jmE+eg=;
 b=T9fhBlWIHdjKT8wsB0nSWicEGQ7Yf7O+bMvmj8q6mgUub6JGP4x5TcZEDaYN3OlhP6
 riOy+IkYkgt/+2MpjsLhF8gfT4wR56h0rvJUpLxLIjciJ8Pbffm+WvDlEKCHktMbwDaH
 SYBc7RyNZSc+pC1ma2nO/YlIr7HO9Gprc9i54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763601055; x=1764205855;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HNKStvuc0XB3JshjhPWn5gZkIa6YpjmT/QSv6jmE+eg=;
 b=RftbyNg/iS2T0vIL+1U5v0JNptrO3c7XPpmWR/A0YxHcpZn8UYHfWbn9NFhz/F4QSJ
 jn6TgWPC28LkJInj5VQ6BJ7spH/skOlIAa5Tn+kcjswpLVIE63KX5WUPSs6k9GM0zogV
 oUqO2Pwtq3+1KU6Egu+Pn3aJDtbdNSFrlMNTLW14r7mw6z6+UvVSIsxErW6EnJG1J+fi
 rpEOU/jObX6YPMpmzUnK+OcqM1DcMcoyX4wAdfD1aQu9D94vPiHOW5rCyHrEn/gqqA0z
 Jjxv6+/eNhoCsSO/T8fawJPX7yIG49v8ewmy+XQA6kXQrrjs6Z0zGMhc1cWs3iwNryWS
 4Hbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFjl5h8h85plxSjPzuSLsXl3q+Xo2ff7j8RJe0UidT3a5WGsqifloJP3yP6jJMVUIB2vKb14IyVWw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9nXYZZHrUgKBrcPQkLWhBgjBAuRe6NFvBOEd3dCfgX/iySYxZ
 EVIhcjZN9H9SIALGCTZzDYH4bCtPd6BMjcj0CfUxYd199xp4NwSC3+falWZ1yk+1239oei3XBKH
 AVm5YCqBy
X-Gm-Gg: ASbGncuk3137C/BziLsIQ4KietT+NrV6mzfVh7eD8vSVldKKDpW8nTniKW9wU5tX8R/
 QziswZLirXei/EdWXNvGP35ZIxR8oZRdXIclRyVKexe0wn8u2vzw5+9m8nnPIgd41b1s5EhrQSl
 XBLUItolQK6HnQfjPEe5uqBK6t616Re8BJwuRoaiyz+zYxHLWQ/k9Df0KplHoCYpT9WcsWDyIYH
 2t9UQh6HcUw62EXWD0Q8SFiknTzYGY4z7yAw6sOZW8VzkLSK7ehhHs2keRIAlYAnUPiojLE4pRZ
 1La+Rapy9yIm8SXLj9LxLkImCrbWjzUOjYmCVbiW6lKt+qEjHE/hMcLnfcSbehNXCPoiYnDmSQC
 6UaJx/lGEOxh8IGit3eOnhNG59FZAT+e7R+bhaF5VclckPHBJFna19oXS3sr3RJUTz7InWo0yPC
 bUd8hBpUijNWr4PjE41bCVhLUCF3BdkokYtAjh/BrTir58XMpckmm7AqmK0Xo2
X-Google-Smtp-Source: AGHT+IE9Jm3X/7nkUW569e6UW7LJeBLkixX7A+8ktkBka+DPUTRiYDJyhascgP+8/j/xHOi7zLqirw==
X-Received: by 2002:a17:906:c14a:b0:b0e:d477:4972 with SMTP id
 a640c23a62f3a-b7654e4198emr128457066b.25.1763601055448; 
 Wed, 19 Nov 2025 17:10:55 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d502cfsm76866166b.19.2025.11.19.17.10.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 17:10:55 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b71397df721so66632166b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 17:10:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVd6nW9lco7Ey10oN4ds1Tbi6Nt2OD89ZkMbewY1XhxFkj+4Yv3HWT2XWB0Y3eB8XBAf4x5S7Fn7Ak=@lists.freedesktop.org
X-Received: by 2002:a05:600c:3ba8:b0:475:dd7f:f6cd with SMTP id
 5b1f17b1804b1-477b8d8eec1mr10748455e9.35.1763600661833; Wed, 19 Nov 2025
 17:04:21 -0800 (PST)
MIME-Version: 1.0
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-8-317a2b400d8a@ixit.cz>
 <d81b0e70-5e3f-4e33-a268-e8b903904e9b@oss.qualcomm.com>
 <d9c91625-a829-474f-9fda-5e39342bb4af@ixit.cz>
 <96673da0-d8be-4b82-9e8c-2263f752881c@oss.qualcomm.com>
In-Reply-To: <96673da0-d8be-4b82-9e8c-2263f752881c@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Nov 2025 17:04:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VrB8FycxF+SFpP0-LBuRh00q6ecQ14fJj5fBKcFqsdCA@mail.gmail.com>
X-Gm-Features: AWmQ_bmyj5sGx4tyY9L7h2oSdpAiPgC3_696WJh5bzTVt6VHuCNSI8LWrwUfgrE
Message-ID: <CAD=FV=VrB8FycxF+SFpP0-LBuRh00q6ecQ14fJj5fBKcFqsdCA@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>, 
 Joel Selvaraj <foss@joelselvaraj.com>, Vinod Koul <vkoul@kernel.org>
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

On Tue, Nov 18, 2025 at 5:41=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> > Yes, there is only one firmware, which crosshatch has different, but al=
l listed in the initial bringup are used for both.
> >
> > To add, crosshatch was somehow not that popular device, so as I've been=
 suggested in u-boot discussion, I would love to keep blueline everywhere.
> >
> > One exception is LineageOS kernels, where they go by name crosshatch, b=
ut again for the both phones.
>
> Google seems to suggest crosshatch is the 'base'
>
> https://android.googlesource.com/device/google/crosshatch/+/refs/heads/ma=
in
>
> Ultimately if none of the Googlers (hello +Doug) care that much, it's up
> to you to choose

I haven't dug into this patch series and don't personally know a lot
of the history of older Pixel code names before ~Pixel 6, but in
general I wouldn't expect Google to have much of an opinion about
Pixel 3 support upstream. I'd say leaving it up to the people doing
the work sounds good to me. :-)

-Doug
