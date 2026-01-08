Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C76D0316A
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 14:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77F610E72B;
	Thu,  8 Jan 2026 13:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b="DWk6kMk7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC78310E72B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 13:39:39 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2a2bff5f774so8615785ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 05:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shenghaoyang.info; s=google; t=1767879579; x=1768484379;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/GHhYdpR7V8zZlwM3eTsC01NbGzT6JFmZY6i1ixPREY=;
 b=DWk6kMk7+ks3338iZ4rssyAcubPfK3WsswXGVN/ChWaXzPEpWNAtyJMLomUo1quQtk
 K3aJxw4dUhziA1QyWQ2IzLO3e94HuYEOvpm5Iv+F1VYr73TPvr98qERWOcSjAZzQ5sQs
 cHogytjyOsaNq89fUM/g0gCN39tRqKlotvDfPSFYZjZIabWgjx6V6lz/FKAd+L7CYAnt
 Es8b8KdfeKew4G/qllGmhQD/9o7kecXlNQ0usGqNNsgYj+L6ei/u0zR/4nfIYxBXmMza
 uL6UCAimLTnrnEThA3HjYqtcguAHFdPRG3EK8fOr1zFDK3WVfanLV70koVKP5Hz+U8EO
 33lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767879579; x=1768484379;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/GHhYdpR7V8zZlwM3eTsC01NbGzT6JFmZY6i1ixPREY=;
 b=MENwYXNTjw2PagM8ah8qOnDGzLar03/KWZ6UDcFUc0SQohTYcwSd0ve3cMzhVnbOdH
 yYkLbyIBCOCqcyxui2WerTqZBjmjYJL/gmJ2dnXzCGjyDriouVGMaR052FelN/mQwJVJ
 bIAD53jXd6xHdDE9qYBl9eJIJlwjop0iXP+3iYbps+IC7Hs9aTc66N1VG8I+Svpt3Ki9
 51mZxHtNZEjq1tW7Hx6tvmWVxFVTb2q7Hpk5HkEzusciLxm2TyMWQbHeAlNB3BzIz10O
 Kh89hsF00Wj/X2fYdgzv94Zdc/WOdNLbyZ8aSet1C2Z0O+j+mz2iCFfWlvPlyDHCyv4i
 w7Gg==
X-Gm-Message-State: AOJu0YynqKM2NHtEFflD4IoRm5vsJHytKskJI/RdWua2UlY5E88jXS/L
 a1/dJUFEK8RSCs0j+4bp7+arsxQd3EeZom+hgHbLVtsK2HqBWB2txUFB8h1tocaEoVO7xG/e4YY
 sjlQ0zFY=
X-Gm-Gg: AY/fxX7+oRZyyvzuJoft1mhEqp1ljYhazAmDRfBUGHTDWSJyejB5ZBpH7Kn1qCvgJEA
 Eap7pntUkMf023f/jHuvQY2hihRmQMaT/dD6jw/8G6EhnqJ5poZX0rs4d08UPoQbPCMoBprPnvv
 Gs6tWJVmn+3eWJJZsvhK6G3azzD/P5k99OpqyXVjRIdpUKzWPAAnqvHLL22w33UXHyeZ7Da3miv
 wncMjP2cRnq3hKkEOaBFsqk8X3cPweihwdMMnAdrdd8BBooUDvMDuAIiLGl61dnSM61ARcLQzF+
 qL27Z5JJoVqJWgVwRdXnm7tZKpB9LHME67zHBM/FQQA3FNgLY6z8pj41Go0p1XU/e2fhveVqlvU
 8j3C2t+XLxsxDRAtZ4VDVEry4NkJ5bzqK2ekmgtbbgjnUochbsTYBvvVwVsVle1IgjotiWcP+YZ
 5NXlcQAqonxxox
X-Google-Smtp-Source: AGHT+IFY5CMv9JNbTut+rJZkqAvSsXhd9YTo4o2zYmRo3eELWLHqTa8Gz4ZgjeXAHX7j+60ZKHIcsA==
X-Received: by 2002:a17:903:4b24:b0:295:745a:800a with SMTP id
 d9443c01a7336-2a3ee42589amr43889185ad.2.1767879579058; 
 Thu, 08 Jan 2026 05:39:39 -0800 (PST)
Received: from [10.0.0.178] ([132.147.84.99]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c47390sm80110855ad.25.2026.01.08.05.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 05:39:38 -0800 (PST)
Message-ID: <65110c51-1f47-4382-ac92-518c7f157a06@shenghaoyang.info>
Date: Thu, 8 Jan 2026 21:39:27 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] drm/gud: fix NULL fb and crtc dereferences on USB
 disconnect
To: Thomas Zimmermann <tzimmermann@suse.de>, Ruben Wauters
 <rubenru09@aol.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251231055039.44266-1-me@shenghaoyang.info>
 <28c39f1979452b24ddde4de97e60ca721334eb49.camel@aol.com>
 <938b5e8e-b849-4d12-8ee2-98312094fc1e@shenghaoyang.info>
 <571d40f4d3150e61dfb5d2beccdf5c40f3b5be2c.camel@aol.com>
 <c6324a66-5886-4fbb-ba7b-fc7782c0f790@suse.de>
 <229b5608222595bc69e7ca86509086a14501b2f7.camel@aol.com>
 <8929ff0f-c2e0-49e6-a0ce-c4b0dcebae99@suse.de>
Content-Language: en-US
From: Shenghao Yang <me@shenghaoyang.info>
In-Reply-To: <8929ff0f-c2e0-49e6-a0ce-c4b0dcebae99@suse.de>
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

Hi Ruben, Thomas,

On 7/1/26 23:56, Thomas Zimmermann wrote:

> 
> No worries, DRM semantics can be murky. This is one of the cases that is impossible to know unless you came across a patch like this one.
> 
> Best regards
> Thomas
> 
>>> I think the patch is fine and IIRC we have similar logic in other drivers.
>> Reviewed-by: Ruben Wauters <rubenru09@aol.com>
>>
>> I believe Shenghao mentioned another oops that is present? if so it may
>> be best to submit that in a separate patch rather than a v2 of this
>> one.
>>
>> Ruben


Thanks both! I'll split the patch for the second oops.

Shenghao
