Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 478D5563FE1
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 13:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45FF113D8F;
	Sat,  2 Jul 2022 11:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FF410FDD5
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 11:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656762537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kBzEfGWVygyiM8W1L6ivraoo44EoMnZSdZ7RWUgjnqY=;
 b=g3JAbkomZPLx8vst9ye1bafNMitfBXaPUYd23QzMkhTNYMHMMHWHiXx5rCmYlDgdPzQM/d
 GhrLjvqrT6edxlvyiCIEEmB4BuRcYUydSjMKA4fwRfwHXzjg40qqr3fTABwFKeOkY9jG5+
 XAiXm/SaNI5NBsekP+N9p744TmPQg5I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-0pL1OaRoN6OmiXcuJlxktA-1; Sat, 02 Jul 2022 07:48:56 -0400
X-MC-Unique: 0pL1OaRoN6OmiXcuJlxktA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c185-20020a1c35c2000000b0039db3e56c39so4391536wma.5
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 04:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kBzEfGWVygyiM8W1L6ivraoo44EoMnZSdZ7RWUgjnqY=;
 b=4SC95Yc/25uBnWt5nruV1jJP1axuNppuBVgC55ax53lwq/Lj/WoUcbxN45zj0hSzNl
 N0zJXHKRioLTuQtRkcUauJ1RSFOv6MltDy6py8+VIzVzycHAciky12m4ykFuM9OgjSH1
 Jxkpa2gIAGddNlkWMIkFF1Tgg8FHx7U6DaPn6YK9IVMrPT5aERBJ6xv/uWrFXHTCt31a
 a0n9tTZFZllWYZbKKJbZb8a3x33v83E+h2zpnA3TT1NcqmTAnFm89/AEwtxYNuDrkhQ+
 oU/vkLluzOsiPIO56HgCitwI/UcOgtTFglVMjc98nyii3yHcCzgtS7u+D2O15RFaHtjK
 mKWw==
X-Gm-Message-State: AJIora/ui8NEQcKzISnBXpmKidjdbhrMcxO/c7d+/WHnzhw5V5iM2QIH
 uiErsyfloHXoeCziOvYbQciLOS5Th9e4N6kcy6OCTlR9IGfPfRbjFUHcTN34elg5aSSvEN7z4VZ
 lvLy5SkQcGAbmP4/+g3Edt8oLCpAx
X-Received: by 2002:a05:600c:4fc8:b0:3a1:987c:82d4 with SMTP id
 o8-20020a05600c4fc800b003a1987c82d4mr1515600wmq.26.1656762535556; 
 Sat, 02 Jul 2022 04:48:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1swi8yT8lpV7nvJfPgVektW9uU61vfUOnnidEB+Xc2gOSrZeoWzU44iyITMmphx0FKxo3RADw==
X-Received: by 2002:a05:600c:4fc8:b0:3a1:987c:82d4 with SMTP id
 o8-20020a05600c4fc800b003a1987c82d4mr1515575wmq.26.1656762535333; 
 Sat, 02 Jul 2022 04:48:55 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e3-20020adfef03000000b0021bbd525b8esm25724496wro.45.2022.07.02.04.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 04:48:54 -0700 (PDT)
Message-ID: <5e612797-3506-527c-46c5-cae9045c69e4@redhat.com>
Date: Sat, 2 Jul 2022 13:48:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 6/9] drm: selftest: convert drm_dp_mst_helper selftest
 to KUnit
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>,
 Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 siqueirajordao@riseup.net, Trevor Woerner <twoerner@gmail.com>,
 leandro.ribeiro@collabora.com, n@nfraprado.net,
 Daniel Vetter <daniel@ffwll.ch>, Shuah Khan <skhan@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, michal.winiarski@intel.com,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com
References: <20220630004611.114441-1-maira.canal@usp.br>
 <20220630004611.114441-7-maira.canal@usp.br>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220630004611.114441-7-maira.canal@usp.br>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, Rubens Gomes Neto <rubens.gomes.neto@usp.br>,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/30/22 02:46, Maíra Canal wrote:
> Considering the current adoption of the KUnit framework, convert the
> DRM DP MST helper selftest to the KUnit API.
> 
> Acked-by: Daniel Latypov <dlatypov@google.com>
> Tested-by: David Gow <davidgow@google.com>
> Co-developed-by: Rubens Gomes Neto <rubens.gomes.neto@usp.br>
> Signed-off-by: Rubens Gomes Neto <rubens.gomes.neto@usp.br>
> Signed-off-by: Maíra Canal <maira.canal@usp.br>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

