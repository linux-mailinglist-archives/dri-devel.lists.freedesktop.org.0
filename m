Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E14B880110
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 16:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEDF10FBAD;
	Tue, 19 Mar 2024 15:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MvIaHoHr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918CF10FBAB
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 15:49:15 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-41413f7b2dfso14251275e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863354; x=1711468154; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ADtjyGn0eFpMcL5tcHRmk098Oppmok1FxnjO4slrBOM=;
 b=MvIaHoHrrqAOGkMy6L7YDrdWC3SYz/xwIL4ncFGe/r/MqzsawPp3zIBhUYkE5/dnF8
 ewHxKxk9dKAF/zrhHpcJl7GAbyOS++9ANPbQ12TQ9CR0dWa8iuDdNapW+euO1B7pJDGW
 BdhyHNwkp3yut7tFYONuiNio2e9sXl/WxGEk8ywZsb83oD/C8mYUTmUbUf2BNh3CoR88
 97LO/eEN3Sr+r5rTWI3OIPIyHc37gAOKQcRiSWCczN24Lyf6CvpV+E/ISFHCCbuAp7zL
 AbHwgtH2sBz6U179Np+hiYhJYMm8qfwv3Nyed8WFYfNnkBPK6MCeVFs7/jjlV8lwdYrl
 gDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863354; x=1711468154;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ADtjyGn0eFpMcL5tcHRmk098Oppmok1FxnjO4slrBOM=;
 b=XgQLO/vjnlZ+83shswl9AQtUvCaTHUFia/PRN8wgMBqNUeMJWyctjIuXYsHHbcs1cR
 eZQVeUOek5gZc7bmib1RTfybW7npj6XGOHfIErX57pO80hT7c6xy32dV2VaznG3ZVFd1
 Z8rfM7HvjIyaZgkPgpfO1OXakKxLquQC9zGz3DxR0bFQZJutqls/wqzoq9zO2pmT/wFK
 /seGcJ2QH4Ynq8NyH2oYfQGyXD90ET+OryvyL6cMIbxJaF/DvBZ+FuNEp96L00tVen+d
 1+b4pQL3QfGweNpSozqxu+eGUZBUF9L9Kx27YNerHNrVZCGneAZpSV6BYZSe25qBEhM8
 rtPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy1Ludf4IA0j964SwssS4ZL8/g9OdTHcKT8TGgtIN46uRY6IseBEiiBHBSMKOSlJZDPQAesZCjT2HPEibRKpz9B4JW40tf1vA/+bLR7+C2
X-Gm-Message-State: AOJu0YzffKTQw5th3puxVCJ0ZxolmYO0EoxnLxW1yj+ZzEN7eoO3NhFi
 P58BEX7Yoq3qRfIyvl+OiclN6gGJT97s6l8G0pBnHK3NjJyXoNTkO3alBCT/kRI=
X-Google-Smtp-Source: AGHT+IHrOnj4CaHghcEG+9l8AS5c9AIXpcElhpR8lUv76uiBOgUiYCWAhhNkUgilfTUHBoAMu3DNnA==
X-Received: by 2002:a05:600c:82c9:b0:413:e956:6893 with SMTP id
 eo9-20020a05600c82c900b00413e9566893mr14388206wmb.41.1710863353717; 
 Tue, 19 Mar 2024 08:49:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c3b0900b00413ebaf0055sm18742915wms.7.2024.03.19.08.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 08:49:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 thierry.reding@gmail.com, Nathan Morrisson <nmorrisson@phytec.com>
Cc: w.egorov@phytec.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 upstream@lists.phytec.de
In-Reply-To: <20240318161708.1415484-1-nmorrisson@phytec.com>
References: <20240318161708.1415484-1-nmorrisson@phytec.com>
Subject: Re: [PATCH 0/2] Add POWERTIP PH128800T006-ZHC01 panel
Message-Id: <171086335278.3926836.15356889496427917031.b4-ty@linaro.org>
Date: Tue, 19 Mar 2024 16:49:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

On Mon, 18 Mar 2024 09:17:06 -0700, Nathan Morrisson wrote:
> Add the device tree bindings, timings, and compatible string for the
> POWERTIP PH128800T006-ZHC01 panel.
> 
> Nathan Morrisson (2):
>   dt-bindings: display: simple: Add POWERTIP PH128800T-006-ZHC01 panel
>   drm/panel: simple: Add POWERTIP PH128800T006-ZHC01 panel entry
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add POWERTIP PH128800T-006-ZHC01 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3b2304cfeddd141523cb50cc1a3ba7624b865011
[2/2] drm/panel: simple: Add POWERTIP PH128800T006-ZHC01 panel entry
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/fd6aa8f2dcb7236e511c1a58d82c2a178170e6ff

-- 
Neil

