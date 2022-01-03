Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A4C482FE9
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 11:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED4A10E12B;
	Mon,  3 Jan 2022 10:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F10010E12B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 10:30:47 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id s1so28290916pga.5
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 02:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
 b=K5BEbt9OjKO+nuqxpvzbIOlXKc6txbVTj2xfbbvgeXff1lHQfcdfbFdinIBNEq0EyO
 Y1aCWLAj4I6N5aIbVrp02f36dabPmFWQ8BiKUWjxqHdsE1oXmAmDB33rNVwT2RaiAGS2
 nDMYYHPmDL4PfdBErgwWs8EHct2Z3Z+uDPY9KZ/+H+TJncxI2Pexcrtxgj/DbqOXEIVt
 PCegKTkSznNwgTdolMRZLUIKw/hxyb2wMSN8XWJT8egb0H8fLooQPDX5yVhfIahzMBJa
 23cSUeyaczkJ+xdjSYMP8Rzg70cKqDcxOZKBvM2STQF2+CH+UcTBs3UsOswcrji9OpBm
 hKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
 b=B8eqUlmVGhJDkiYspxZ+WpwxH6eJfw5Jv2FbuB92MCwSid1+y27zs8M9gbdkKI4Rbi
 Jz0ptkco/0akborDprdHgGOvi3qwI//jQnlLmxN6bXiLC6urwFoeFuDyp4iDloSQSrIV
 gHg9iI7K+PazDcJy8if5lKN1pssK9gzXdSnuBp3sW87WMxet4fkwcAcs/0wG11nqa7NZ
 ARHImXYH6DzAPghRiswcw2vZUR6wOnzAGuYOGfNKnEK6bppxzptSI7BuDlwLPzK+tMxI
 P3w6qE/0TKk2l7ha3oloXR5ukvo47AI+JimEYM7KACXMehtoBRqEpzQdCtNeRF2s7lLW
 19pg==
X-Gm-Message-State: AOAM530dzuQBHmd5Kvhl5PPmMMWMet817f6glXLGnnNb7AdUM9ywJI6c
 1ZA4eTPwvgkxOXb05a8KA9TFmkX+LBJ/3thidHJNnw==
X-Google-Smtp-Source: ABdhPJzjmfkMpGxFmUpkFi1mKbOuAv2LnaShqmU2K2ivWzs/UE9RKuPtNoD834Rh8/Elsaluwf7Y0D03nF5Me2CLMTg=
X-Received: by 2002:a63:6d3:: with SMTP id 202mr38562627pgg.324.1641205846920; 
 Mon, 03 Jan 2022 02:30:46 -0800 (PST)
MIME-Version: 1.0
References: <4bc21aed4b60d3d5ac4b28d8b07a6fdd8da6a536.1640768126.git.christophe.jaillet@wanadoo.fr>
 <YcyIidlnW4Sh6CGm@pendragon.ideasonboard.com>
In-Reply-To: <YcyIidlnW4Sh6CGm@pendragon.ideasonboard.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 3 Jan 2022 11:30:35 +0100
Message-ID: <CAG3jFys8i+D32BSmsLnSG2ArP+wwf-q7DtxoateX8Ln-5V5RtA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: sn65dsi83: Fix an error handling path in
 sn65dsi83_probe()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: marex@denx.de, dri-devel@lists.freedesktop.org, jonas@kwiboo.se,
 airlied@linux.ie, narmstrong@baylibre.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 frieder.schrempf@kontron.de, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next
