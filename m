Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DE13A8BC1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 00:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716A389C9B;
	Tue, 15 Jun 2021 22:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6323689C9B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 22:24:30 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bp38so862127lfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 15:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nhjOizUTbckzYteuZLHk6CVgBEQfJtYD7kitJqqzHBQ=;
 b=sD5qq9tYIelkWooFfX83VvAnGZlQrJ1mLo7UjV7IwGP6B+N9LvHIDaBgcCXc5vOdbu
 nZ3gkpLjGSjdtN1lu5EF6hLoh07Z5Jfdxg3dS2hbxkfGWKiG3vjZIJ6v++SO5vtvO88i
 osxWStClApdxIYy3SkAIUp/nDDNfpp1iCRMGQcItUlqAVgSrpVKwMdb3qLzu3X647ZXc
 zCEBztBzKGwlPFsPPYgWd3eKdlAN4Sw7uGjniXOc9Qmik34WYutXcAnDijgrTsuiNZIA
 83xx5N1G0WKXhVco87L0zNsGoqvx6IqrMl+b5g9ig5+XoY2I0UbBFU0g/Ey1AiK5vp9g
 sfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nhjOizUTbckzYteuZLHk6CVgBEQfJtYD7kitJqqzHBQ=;
 b=mnjGCAhKV00KeMxt20OX2ojlNkucHispGsW+J/zGttp/i07YurZb9snL46y1wjBu2H
 9qQYXGQqXQBmU8z3jD2Lvu+r1zV7SXoobEJhG3vthjdwjE4pxoOu9SZ0FlG86dylugZ0
 Dt+C2fU3aCp+IE+6k54tUsRieX9ae436VN3Fd6ImzyKjs83cd2Q9q+ZY1NJvkAiwww9/
 oCG6hIzj7RbtKjXutFPWbYg10KG5cWcCfNUQnoI0BrEGfb0EBUa6jnU/fm5v93avKOHk
 S+kyMBz02aEhPzzrwY3ptJcEusyn9G8EAA20qhT8uIgrUMCZu6PRZBZ/ICv5fG4MRc1a
 SIFA==
X-Gm-Message-State: AOAM532cOZ/GFOx7KNJ5O3jV7eVBbE8nMJy+1Lcv2it7xgKWbOmG8jJ/
 3qsU9vLZbQbrHL0z+MuEcnI=
X-Google-Smtp-Source: ABdhPJzqIuvzdDhYKwforGWpDUyz9K1lKGQJDQFjTUi+Vy02YbelkVv3YZ47tpiXpNCfltmIu6EWzA==
X-Received: by 2002:ac2:44c2:: with SMTP id d2mr1132422lfm.337.1623795868885; 
 Tue, 15 Jun 2021 15:24:28 -0700 (PDT)
Received: from [192.168.2.145] (94-29-31-25.dynamic.spd-mgts.ru. [94.29.31.25])
 by smtp.googlemail.com with ESMTPSA id c9sm14361ljb.22.2021.06.15.15.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 15:24:28 -0700 (PDT)
Subject: Re: [PATCH v7 13/15] drm/tegra: Implement job submission part of new
 UAPI
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
 <20210610110456.3692391-14-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f6651a3e-1e63-16a9-570a-1b8b09062f03@gmail.com>
Date: Wed, 16 Jun 2021 01:24:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610110456.3692391-14-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

10.06.2021 14:04, Mikko Perttunen пишет:
> +drop_refs:
> +	for (;;) {
> +		if (i-- == 0)
> +			break;
> +

while(i--) ?
