Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E18286CEAE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 17:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2B210E507;
	Thu, 29 Feb 2024 16:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fT/bP9uT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667F210E500
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 16:20:26 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3657dbe2008so5329745ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709223625; x=1709828425;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g8Qq8yPD2u9VlGqCnCi7K91emb+vPhb1JZTph4xZca0=;
 b=fT/bP9uT3yqYYHEb9PTfk8xbwMbs2k+kmZXH5Qwq8IxMhmPzn4aDEhkqpHAMl5azsY
 tQOM1DUlM/660xK8cckeAVjhWZO+c43ANUYQoTG2ue7iXSGKSkBQPIM8cTqmxENGmpTy
 E6zoSuyQCs0eQl/0sQBrO90uQ616v9SkvqQ1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709223625; x=1709828425;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g8Qq8yPD2u9VlGqCnCi7K91emb+vPhb1JZTph4xZca0=;
 b=w9U4+NvG4UDbdwn2cHTdZF1soWVYWB4J7ew5HFIax2jso46hXTos2+TPl9ubl1cifD
 nVrjb/L5t8Ox/3L0FFCQbP+ttqpBA8wjsI84dyw/iiwhYwE/yf/L+yL0sWLdogjPnfac
 UUE1yXZV+QcRbl0t/mAufZYagZ80+6CZ9kU2WvIYY4YpDG8LzDpDpCLsRJ3YsHQSIn43
 /9q7BccpQCbVZWpQwAQ0ut8sRI68mzUgwgdYfPvBLrQ9VGgmFN4WENf4cbciAf3OEJ2j
 g6IGN5cJwvhjtlUYTfyW265rdBFZgIcTaEtdo9ZT6me70P4Wb8SdiGkwD1pGmCV6ZQ9x
 Ikqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIuDEVzZb1swQSzBHMrMgpjnpxYhYhnRRg/yeY0cJPambocfaPBOx1vPR/kydbAZcQbIA8QFtbnXKNFrfy4t3ZkIqT6bx61KiH4RVXaZDp
X-Gm-Message-State: AOJu0YygoT8OFb9kWJfgnNY+XhY4PZ7XcN5qIeEDVvDxFoj1dbBFvGO2
 ckcteMrwRkN7uE5eCz/iQAaDMxA5up5sBa3qUyqGruL4FgKr2ppLhOic6ozXBw==
X-Google-Smtp-Source: AGHT+IFreo0hr/9MzkZCTngz7lMqfGeDlbi8HZb7O7X2LxBPXUVABjMPoOBmX8meMjGxInCXYjaVSw==
X-Received: by 2002:a92:c7d1:0:b0:365:1749:cae0 with SMTP id
 g17-20020a92c7d1000000b003651749cae0mr2946229ilk.7.1709223625514; 
 Thu, 29 Feb 2024 08:20:25 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com.
 [35.222.57.144]) by smtp.gmail.com with UTF8SMTPSA id
 s17-20020a92cb11000000b00363d8ee8cf7sm393454ilo.48.2024.02.29.08.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 08:20:25 -0800 (PST)
Date: Thu, 29 Feb 2024 16:20:24 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/9] usb: misc: onboard_hub: use device supply names
Message-ID: <ZeCuyLeC9SBNBkk_@google.com>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
 <20240229-onboard_xvf3500-v6-2-a0aff2947040@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229-onboard_xvf3500-v6-2-a0aff2947040@wolfvision.net>
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

On Thu, Feb 29, 2024 at 09:34:45AM +0100, Javier Carrasco wrote:
> The current implementation uses generic names for the power supplies,
> which conflicts with proper name definitions in the device bindings.
> 
> Add a per-device property to include real supply names and keep generic
> names for existing devices to keep backward compatibility.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Acked-by: Matthias Kaehlcke <mka@chromium.org>
