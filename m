Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA82C8C6D42
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 22:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C377510E9D7;
	Wed, 15 May 2024 20:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="FqpW3DFX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1D610E9D7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 20:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1715805061; x=1716409861; i=markus.elfring@web.de;
 bh=sdz3zA2QNS5KCDlhoi4KnGrlOMS53U2mLcRDwFndvR8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=FqpW3DFXXs5vAJKozBUsPL4DoO4zJGPM16PnuQ5u5kKvv7/tlmXxH+wNabhzD5u0
 eCerLP1Zvbqc0Aji7VrDAAkyxREcDACRsvvUCCTyhjEfFFBniqo2q9w2tHK4yn06W
 me+EO1+rqk27Bu1dH6VnfklPh2rpYQ4qzr50zsqaoMT1bRyzEaC+TDQkSEq7175U3
 jP/JqrAE1vLmPLcgyNIMlXK93B8RrvjmOsGMvVBHu6PDI9fKf1UUImqfXqRVQqrsH
 TxGf7GBsLPbx/grWmLQtUWxkO1xI3DSEVqYEw85N39iTKbTjPvfuRWs9fGpr5fjRn
 UzaAgwMV9d+1ypf0Uw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MElV3-1sN1Pa1w5b-00GH4W; Wed, 15
 May 2024 22:31:01 +0200
Message-ID: <fe55ddf4-b86f-4d9f-aac4-373c5f2a46ac@web.de>
Date: Wed, 15 May 2024 22:30:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>
References: <20240513001243.1739336-2-sui.jingfeng@linux.dev>
Subject: Re: [PATCH 1/3] drm/loongson: Add helpers for creating subdevice
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240513001243.1739336-2-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w0F7NCoqBz6nd2t2/BLUjMjeh0EdR38pQr4i8RHXlrv9MsVW1ym
 eqfZd01UP6inoqqkFcXgoH6gV/kkoOD3LH0MRqjuHlwCpBYBn7cicw663GLcGCNRF0rdXqT
 +hxNNKu9EN0qhOLuFCH6Fglo8Hl0YuPoOPDcD+q3Kjkx9Q5H45n8E3ubw5YIyT5LLfcIe2b
 Ib6t4olqGEvLcz9rwxHWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6SvpGfh4qBQ=;4b/DOPwnftr3FIGYxF7lXtHs+xu
 jtqEw1nP+pEy73zau7GHinucKKbl8PeO6rbYLelA6JbmX2o3xVS67G1Ehsx4nYB2wAdJo+mbi
 MP5MwFN9OIXw+EsFDX/K+X5DjdyyslqyuHwM4HQQUtt+xTDRlOO4GtnkSGk42p0eGkcgdX71U
 IXxrBPBSWdKQMqeicf+RxPvxOPQdhA/zi2OTGBwXFFI6GZu0yVf8eMWXSVW0Qq6WumLSv8bdb
 Wto1+gJqMgTzOGgx93pS5k5fkzFTKiVAOVFs/h6CzQ4ee1OjKGEjc+FL9//Q8SLPHGfqOB5vf
 w/wChn6o6SrJz/e/R/7VX2nRljWo+Ho02HhKkLsbesSFrsuVv2ShSuEbI4B62W42Vk0PuAiYi
 WRllqcE1owue7a8cu76wS+89OE3mh8o8OOodCJGj6Vp5ED4OkipaUHYVklEzHpbvZqFvwQ7tk
 kv1m4hxGxKecScCSbfovCFdHIhxxI6VOxS56Mdu1kilDMb+p8h12C/4YUAa0ZVY1qriV+n3N0
 sOuE/nBSGdg4XlpCIcvWActVbJ56NS6ttGonGd8OekkbVz+cyRXuePUPpK75DWT/+yPXNY/ED
 H8oa65v5anO2+iYmuAopRebUs7PmnCESYr7wiwepvVQlNO87jJJa4B25XGET/7AHa5UmnltcL
 DdgBMTY2bD31UNUrvpsMH8yd9oSygiebP7JpPAPymSlj2+COz/1NtXPM80Z2ZYN5PfwkGIqIC
 xHXl0EGICzMgNvt2KPdW4sd0ZLwCnzuudj5ZkYG9Ud4JljbyMwigXMY3d8miOz3hNmASVja6O
 m99XN7GpMP2nHDuo7r9Ya2NcRIw5UUAxgmvGON1M54xxc=
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

> In some display subsystems, the functionality of a PCI(e) device may too
=E2=80=A6
> of the functionality into child devices can helps to achieve better
> modularity, eaiser for understand and maintain.
>
> Add the loongson_create_platform_device() function to pove the way =E2=
=80=A6

Please avoid typos in such a change description.

Regards,
Markus
