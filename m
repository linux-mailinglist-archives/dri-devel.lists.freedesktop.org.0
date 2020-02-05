Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F90153FD3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DA86F9DF;
	Thu,  6 Feb 2020 08:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726A96F8DF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 17:29:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id z7so3715745wrl.13
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 09:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZbbVXu4SMR7d0kvLiQS3/WRJNZMT3pLKeUkPSOah+pw=;
 b=TjTCzDElpVqRK0mbmDJrFQQI6dOnqTXa+gzoY8mELNCoPb48hh/vJW0wHBe4Fqcb57
 An3mGJVxLOYtrxusYQaCDV6w0CyMgtMMrAex28DrF7U/y43lnKVAQNSLDdKITVftQdBz
 DH2MUpbqQTKmr4ASjC+f/KAnhdgXWMpNLT6mxiHf22/hjIpv4+vOJjD0dEceMQPkx+DZ
 nnPqYZILwsqPFgatCjZrXhXumi0zu65As9DEz+1giXHuM2+BHLNezWoC/yv2UIMVcVE8
 n8xo9Zib4X7SrhylbJRzef6CYd1JhGTu5B9ERQunrLNtA5oJ7sMwJaFU5c95FCjm2PEq
 HTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZbbVXu4SMR7d0kvLiQS3/WRJNZMT3pLKeUkPSOah+pw=;
 b=Fnv0ekLfh+ZlGiSZP7kmfjwiiu80MEli1ecZf3w9+c/FFdfswcmLmYo1zuAscbs5fj
 szXR4BhN5vb9kQLyUyAKGK8AB83ffS+TmcmO24n1oy0cHyAqORvH/Ro4hibBmGe90Hcc
 4ZF5QJw/dT2VsSvQ0UZWIblsoYLoZML0sSgNWvuKF+Bi+ZciR3uykONu+Ssm4mAmopiD
 5wQpk8fsf+TibCJ+4x2sBLH+j9SMqXKLld0oVYCnXj/PGHySr6mjB2Y67u4VEOvrNAFr
 86x/ZLKcg4VW8/XwUOft8fZsfduJUOi//69BmMpvltbNpqG4bEfBp4YSmo4rfdHCqb/V
 KkvA==
X-Gm-Message-State: APjAAAWpQjnw2dxKqUNYsHU7if64GisZVNyncmrGla3RRl9WUQ7pCgBw
 hmTyyLeVB+Vbh+IATCwWRn0Uv1FO
X-Google-Smtp-Source: APXvYqydiYwvC0cS3GL1m4tH/oop1je+OBYgSQlVdms6CmkC/IHHYZdm9bKmu9knw+jPVtTJt/fArw==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr31502155wrn.254.1580923774984; 
 Wed, 05 Feb 2020 09:29:34 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id q10sm312198wme.16.2020.02.05.09.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 09:29:34 -0800 (PST)
Subject: Re: [PATCH 2/3] drm/tegra: Reuse IOVA mapping where possible
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-3-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <af7c156e-937b-e8fd-2a84-2e54671b7ed8@gmail.com>
Date: Wed, 5 Feb 2020 20:29:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200204135926.1156340-3-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDQuMDIuMjAyMCAxNjo1OSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiAtCQlzZ3QgPSBo
b3N0MXhfYm9fcGluKGhvc3QtPmRldiwgZy0+Ym8sIE5VTEwpOwo+ICsJCS8qKgogICAgICAgICAg
ICAgICAgICBeCkFsdGhvdWdoIG9uZSBuaXQ6IF4gdGhlIHNlY29uZCBhc3RlcmlzayBpc24ndCBu
ZWVkZWQgOikKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
