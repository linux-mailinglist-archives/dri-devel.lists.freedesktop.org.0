Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA7999A46C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 15:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38ADB10EAE2;
	Fri, 11 Oct 2024 13:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cQfdx2Ot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE26710EAE2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 13:06:50 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a997736106fso260794766b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 06:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728652009; x=1729256809; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tkbEDziZ/ZDgy3PW7wlM+6buWKEuqwUhvBUdoxjonFU=;
 b=cQfdx2Ot8fMC9v8FIUxqbEhvhb3YnLSwvQwBjIgkmCTXJfPewKvTVZco/iBjhmWzzb
 6qwOlLK9H1kwY4EL0aAyQGVPYAShycdmtmWUDiYfAo8R8sC0SmtZDHTP0bMfHpcgiudG
 62UbHiBZlImmG5DuYsB/zK8AsT5SMgVAqJMymiLmibYwgdKhBTzOIgUNiwv2yXEZUQH0
 Q37V/s9L2nOl19mPGh4ssUIhBXVM/ymX/84QdrHtIMZTMJtVQ1SaivcQD9TzDoob4VwQ
 qztsIpN+VtqPARD7k+kPY59W6tIp/vfRjWaRGvh9hFAqCfWmpCxAuzYZFScYWqACw0R0
 aLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728652009; x=1729256809;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tkbEDziZ/ZDgy3PW7wlM+6buWKEuqwUhvBUdoxjonFU=;
 b=SeRT6bEF5eGpv3yV2NiVPENiTsvuLbRBHBqncSXInvj6vFYz/UHptDKAKgQiFoUoVu
 4DVzxX8TGBpHJpSilnGhTD8bPWdTERoSCl4VhNw9Kz3HMOu2YQJSp+Cx/gul47Ne0EEs
 re03O01C+MvBycaEvGsG8rsL8z8gChv1goa8G1W4iiQYPkF3ZeQhpTiLr+OuySld3h0h
 3XagmcP/nrmUOAJhYKDbOtXFDI5/1bimLu8aeRcZivmyn2y5EE4Sl5l/iAHhUh6YFEa0
 hMWJ+2fxldMac/fOV+2nIEUrnIBW6ABncpjDRWsoZkgnXNq29umoSTfRej9ke0E2j9tl
 21iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4RasO0u89nymZosT8SnpkCTClcSfGTwIFRlyD+fY7eyHjKahd9fREjHyq3PFRs80ttALU6ouTGs4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkOaRa2Odqj1E+kILVv2LjVCeefYJe/lnHRvQhbmJf9eP9AZqv
 Lkdymj5Z3cl7olcjJOyJFGlRwB3bJM3c2ybeX4P9a8xp0Aiu89XI
X-Google-Smtp-Source: AGHT+IGEF4uRBen/CEubOYBZjPs0NT7x/gbFOaP3tvZ71aP7jtVN5aWU34Fo2/mQxXUedHpaZiVz8A==
X-Received: by 2002:a17:907:f752:b0:a86:b85d:9470 with SMTP id
 a640c23a62f3a-a99b95a7e09mr210833966b.59.1728652008944; 
 Fri, 11 Oct 2024 06:06:48 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a7f2c1f4sm211008766b.87.2024.10.11.06.06.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2024 06:06:48 -0700 (PDT)
Message-ID: <fbaefd5b-8677-4af1-8ace-206018bd9265@gmail.com>
Date: Fri, 11 Oct 2024 15:06:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm: logicvc: switch to
 for_each_child_of_node_scoped()
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241011-logicvc_layer_of_node_put-v1-0-1ec36bdca74f@gmail.com>
 <20241011-logicvc_layer_of_node_put-v1-2-1ec36bdca74f@gmail.com>
 <Zwkhuyq39LQSZCIN@louis-chauvet-laptop>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <Zwkhuyq39LQSZCIN@louis-chauvet-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 11/10/2024 15:01, Louis Chauvet wrote:
> Hi,
> 
> I think you can squash this commit with the prvious one, I don't think 
> this is needed to add of_node_put and remove it just after.
> 
> Thanks,
> Louis Chauvet
> 

Hi Louis,

Thanks for your review. I did not squash them because the first one
would apply to stable patches (note the Cc: tag) that are older than the
scoped macro, which was introduced this year.

Best regards,
Javier Carrasco

