Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60204AEE2DC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E3D10E497;
	Mon, 30 Jun 2025 15:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="REpdW+gM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E89B10E496
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:41:22 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so16897565e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751298081; x=1751902881; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4E/kjT2ltjbIwc2t5rBywTAc8OGpGOaC4vFH3C1Q88o=;
 b=REpdW+gMLdZsRRjGRutqotmoKbFidHrTT60W2MJpbIojkuDKymHBAiEVp/pFaaYy+6
 4zTPC+P1rRFJdTB6KU0J01KfqhVQD5RNJLgqQPdUtmR9rURubtPWWEu7k/drQ4QWT6la
 kmINcEZf19DJpdclTVaGc91kaEfJx85S1YN94WoGhIAZXKk/kzEVnIIp4Fh2QNeAch9u
 0N+nGS36Fa1yTc6XfmbpGNGkBA/CqEFscZqItdZpc5Y6DvdOhrnRrtCWU/x/PuWmH0QI
 8ns62kxhthUhzHLGW+sNKXKS37HbgO4hsMt4oBsSmbDRF+5cxxSyutzcsui4YacMGjgb
 rzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751298081; x=1751902881;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4E/kjT2ltjbIwc2t5rBywTAc8OGpGOaC4vFH3C1Q88o=;
 b=bxTV30RyHKUMt+YVUVBOBU8aGt+qSJf4OhQh533bwOUFLiDBVCH7XjEhUKB5O1K/da
 NkhmAC4XpmBtpipGQGpBkWLtUHYb9TnMEeHDtEjFLNzqLiqqV20PRjuZKDeIG5cpjAPC
 sQ1xU1OJioeEZaiw4KEv6LIO+ayblpKhG/2qGtPVSoXfX1KheXVjf9JSUfhlOVftSQ8g
 QeiBAI5VJ/1vddY4vedCI/c4SI3SUbLw05/GqUQSi0A3JtuuloAfB6O3uCOX4dR1La9H
 WV+MlYfWtfsYE6hWcxVE7cbuHcaDLUkYIE1M+aa1je+TML4hbaB7PUa4Yp02WKa18tos
 /Edg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7wDePTfW6s7s6DO98oYAC6ZblGLIMItl1nkuJy5MqG9Tf1VC1NEGtoysW0BAZdflSQfGorTSsKMI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQCiCLIX4qeW+vRWHhp2s0A++xbJNzSuB5BzVQOc+qbO9KNS2z
 lJFR0/gczzYJzK9Gbm2uk4/QZ3RAAvu28rhjGRZHUtql3yYNm1VP5CiEZuTIoRdXZvQ=
X-Gm-Gg: ASbGnct5zjkVuKbfrfd3UNzqeg3t4gjZf8fiI4itrICD0qOgH6VIjFmwj1eBvhjxF98
 He8vg5/pITmANlfz1npVTgM5btXMdj2pO4df1SNnCWoeqkDTnJH55kl9Lh2A0yVp65tCc1TUF4k
 lkOBj5vl4nviaIJRXbfVDw4ePqhSrI7fGNrO7dF+oI/u/TZwL3hkk/d/m2zE3Patq4j7ejJaJs1
 LOLAcR3N8Lf7iYzZucLLlJuYUt+NKtw0GKj9ncO3qUJO+W0UviLbJ3errnzMOLJDC/SdrsRluK8
 vu1t4hFXC7z7qDdU+lMJihMRVs/j4pqUuM4j60etcP3erJRdhhSKQj/h7O+ag7pJIzMToGjs6/3
 q88QQKaA=
X-Google-Smtp-Source: AGHT+IEuT9/EiUwKESon6ClV7CJktQo+yFrFWhG+bJtZTumFOvoppPXGadHx2JbaoBOarca6MzKDRA==
X-Received: by 2002:a05:600c:1913:b0:453:8ab5:17f3 with SMTP id
 5b1f17b1804b1-4538ee837e3mr128984475e9.22.1751298080673; 
 Mon, 30 Jun 2025 08:41:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823ad01csm170270975e9.22.2025.06.30.08.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 08:41:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: conor+dt@kernel.org, quic_jesszhan@quicinc.com, krzk+dt@kernel.org, 
 robh@kernel.org, sebastian.reichel@collabora.com, tzimmermann@suse.de, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20250616070536.670519-1-andyshrk@163.com>
References: <20250616070536.670519-1-andyshrk@163.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Make reset-gpio as
 optional for Raydium RM67200
Message-Id: <175129808011.2286551.3854555524045172494.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 17:41:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Mon, 16 Jun 2025 15:05:16 +0800, Andy Yan wrote:
> Although the datasheet of the panel module describes that it has a
> reset pin, in the actual hardware design, we often use an RC circuit
> to control the reset, and rarely use GPIO to control the reset. This
> is the way it is done on our numerous development boards (such as RK3568,
> RK3576 EVB).
> So make the reset-gpio optional.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Make reset-gpio as optional for Raydium RM67200
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7513437b42d3ea682967e8fab113e20e558ecbc8
[2/2] drivers/panel: raydium-rm67200: Make reset-gpio optional
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/941461216c8d96b2c8b91233ba71483e011f78a3

-- 
Neil

