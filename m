Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 733321EB65D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 09:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1829A6E0BA;
	Tue,  2 Jun 2020 07:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7086E095;
 Sun, 31 May 2020 08:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1590914285;
 bh=qcluvF288V7xnocU4TEm/CGh6CM8v94eGnBDCTNmS30=;
 h=X-UI-Sender-Class:Subject:Cc:References:To:From:Date:In-Reply-To;
 b=MM4UEzDmv1DUpgN4HkOL3CqwDEK3KekI0UOCgfc4U9m+BbosKoT3sjEwVjPcfUeCm
 6Xe7gmUZbOInY0WctGkk57WRfoxc0yFhyZbRTPeK1U5CdiqkYpotIkHSGGDRpID7cD
 /xKSt0qql62kz9vxCPs7rjX1Sg31B2BOVrSnLZ34=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.19.10]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MQedF-1jZQIa14UX-00U2i2; Sun, 31
 May 2020 10:38:05 +0200
Subject: Re: drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new()
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <74977dc6-7ace-6ef7-4fcd-3f6c89a3eb5f@web.de>
Date: Sun, 31 May 2020 10:38:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
Content-Language: en-GB
X-Provags-ID: V03:K1:y1LJYPs1Iq18L+/DAFeD2LDUvWpuxmckDphyA08FWMyUA+fuBN9
 K5qx6q+Olg7M0ajYWgZMW5z2kJ+Cuo5G6ugqlorglO7y9ivn8A/0/npYd4Hn8rgZp1/cVXK
 OfQZsRYZz9FsiV6zPCRFEdbqaMe/S+jRgt7iiQYuvx+4puln7sSZie6KghoFicBxiRUOj7h
 cvpbKyhLklnhABV1Zwv9A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LNBjC4PMbDs=:zUez5xyZYSjv/YGQOBDmCg
 mIq/MNdx+X19JCc4kZvcoEdy2DGLFDd4HXBJiAIMS5tvhTCUCe6j3C9mLMZJ4moPPdmUnWRLe
 m0jjRcE3DSWIGhE/gt5Oi4BQf55QVU0UYH1d22R5OZNN9tSZQebYe1r86G9DLbnN8n/rWev1w
 9ucfnYUsGkeDX/++7mplW0K8LVulTqJmEhReWvwMG+YhIVkPupkEZmB+hk2M7uNU9wZ4zGEy7
 TZ8mDbHco5JERAPsGA2U7bkkmcmx1a25bSk5MMmvaEfUXgxZkTildRaS/H5n8LmPll5GyCOLL
 0X9j8BbgcTDvzJ+HqTZ5T3MOQYLHWpMi5wEzNi02vavWy0ODFNVUdtw4ylccLiSXvbL7wtG/Y
 y68VZStMDNntaEvMdF/VvZgv5mBliW6qaoN/lvp4cVV2vJel/MlHT+vlricD4a1g55QIS8yX6
 Ry8FBPZJHZ9FsnvQYUtJwdVeNPbAKn8H9Vb9leGLneUA6Rj9VmgeGlQfHb1FHRzZFER+L41y0
 6LVDyUfyEVmlYD5TQP4W+1s+sUMr91lgLRcwVHX4wofKPr8/ssTTb3WVwL0CLUf6CRjblDtzW
 puOLouLIln9nJkvWDihpsCBUX8K0QgsN86o+jeoLdylLEczMqr7gSubtrK3TOdWUpPjsqfgC0
 4Y+gBpSfzQ4AeuWmKBCaNgK7RYFOfuxlJWcwz0ywDhrLhtGyPnZEVxueRqRhwh0gPq5bIu0lt
 z25aWqlMHfKgc1/GvcAGYfUdn6ZK8YMPY14HIeZ5U8R9SNm7TxcUntM+idcHlH8AGDTgcq5EF
 Jko3fV3mxKdjIkATgQQVOz1FU9Iqymj2IeBg+zj2metYHCXgiy3g5okutYJJe449hM3SxJVmd
 ezIy1MQePb9oGqFgLmEpiO7Bv2p7WbYSwTbGAxtOugTCJ1zm474xrw3xydvMw8B9IugR/ddSO
 ii3F0AjaPCADmqJWJm0y/RXfuQDF72PLImd988hy18mlAisscP7Q1FyNxDWhysYXKMWce9C0b
 ZMr0hASueX9vn/R2uV5+vzCNPPdu68rqw7fIy67NVcPB4+EB7cqBh0/f4m7qcL9I6d8e06+BU
 TM7xMMO/5ddqm/m6uBXyIdYONNEq6R9EI6IriOOtFsfuaXaTskmhih/0IIp0He2lTBu+4HAwB
 CFfxKVYjxUSk6NrYEmm2bkOlS0mFENQcSZxc3PVheySViiADJg8iYNbQy45bo/5tz1Zqa6hH1
 X15vPxMJke/IekFMR
X-Mailman-Approved-At: Tue, 02 Jun 2020 07:16:26 +0000
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
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> It's possible that we expect an usable clk pointer, though I could not find
> the exact usage yet.

I am curious if another developer would like to add helpful background information.


> For security, I will release this pointer only on error paths in this function.

Do you tend to release objects (which are referenced by pointers)?

Regards,
Markus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
