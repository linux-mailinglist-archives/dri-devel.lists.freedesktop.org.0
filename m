Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652AC824190
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 13:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAF010E19A;
	Thu,  4 Jan 2024 12:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCE610E459
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 12:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1704370908; x=1704975708; i=markus.elfring@web.de;
 bh=CM2cef1ckyh3aeLZ3H3C8Q/8Yfvaf5jJIOf1Yk9mDyk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=wZUB/1KU+78EYC/8EnDNvkEjklcLnvniJUTGUDD4aFzGf1N9j7iiSinLs/FYS+mu
 2LK3ACiE4XYGcnLDUxxRCLKcRNleq/3I9OHWK25fK/hNTmSLnzcMEauoraIeuQv0l
 b16Ese/qS3BCzT6FhP/ASwrlosR0NhtTOY26otnHGAM6yhaLplMwR7l7z1wTQ4Vu0
 whUTl+h80i1YQIaai0kU/IZxRcMpU3YXXehGVBRADu9yVSYnnE81wXKmxkGk4vIgy
 G9RKHN8IWrAGCmWBceNarCzHVezG2u5QECnjld6jMD+76yOb0Uk/Jp1kwwRgMpwmF
 EnxeJkg5zrV74ty6eQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M5j1q-1rIdhW330c-007bL1; Thu, 04
 Jan 2024 13:21:48 +0100
Message-ID: <1ab4ea7c-731a-4b8d-8f6f-c9bf5f0f02e4@web.de>
Date: Thu, 4 Jan 2024 13:21:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [1/3] drm: property: One function call less in
 drm_property_create() after error detection
Content-Language: en-GB
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <ff7ce5d0-59fa-470c-8dd6-68dbe65c18e5@web.de>
 <9b1e7330-f4f6-47f8-a568-eaea1624bb6f@web.de>
 <37647c33-7f9d-4763-8bf4-cfc5c9a811de@mailbox.org>
 <c5f1a7bf-b444-4934-a205-3c2b3a045ff7@web.de>
 <dd300771-851f-4cfb-b9a2-d87d2b4399aa@mailbox.org>
 <93cfabee-9692-491c-8d38-dec142e90252@web.de>
 <ff58a489-105c-4fdc-9af5-59efb9d05ec0@mailbox.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ff58a489-105c-4fdc-9af5-59efb9d05ec0@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZjA7m6hOg2b8XD2dDwIjNKbIX/BJ0afrZlGsqq4t3Ue5m7p2Fa2
 V7m4gj+Xi7klUcvwxAOVrLpBSjsrWkN8GgRSJzGL1Dp0nH07N9gDbcH7v/jBCb8uJIwys+a
 hcrZLKDMOfoMe0vkZXVTjLQTE5GllV7biwODL+RNsaPAGN6tinfT3Kqw5FP5YIZzDLIlAmL
 g4TJvVzeychmg1OCQWOtA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dAMZO8I92jE=;vhF3KLbYbyO37AA1WXmmtroYNT+
 /v6UKA7rNB9/QFdyhcjMEEi8gv4m32E6+zup+9VIDT+Dro24JCnFMvbdJBOy/nv2XTKhO5H9z
 0AJeBGsyF16sZgipQ57Fk8QFNC3me/suULDgpuwvG9iRUonwTOnLfXNkykxwlKw2OY9T/0XDz
 fAj8FTvyYsCK07SsdDMGO5ga+jn+zB3pYATssmTw2RRIzbhXpwgVmc4yLk5DIXzyTevEcdQKg
 8cX74pnZTdJrGITmHXeqcvIO3mHhRFgl4vVZfcBIjKeZZvtEkoLGtlpVfHpbo7BjnUp11O4Ln
 s0cscoxC/GNpElPFLQzSQPG+wClcWbr/j59DpNpKjeYc2Rv40W9IwsURCfQnSSc6W2lyotvuC
 QTcWIIhbxxDCB9J0h4o9xSNoO+ygSZHRwNQDPN/KPOe5h80luPrA4DhRy3TWeFoht6A7FNJHB
 LN7IDqYJ+AP8iTvlvZ81a19jR1tD6loIPukQm6Lv/BNmyscsrT2XvI+bXJEbB2uvldk1ofMTy
 OC7vEeJh4vmAQBfeYAngjQOpuMaVxBHF3MgAxcoGapTQ2c3wNeucs5+w02OiQPCBSHXRTUujQ
 fJQAme8l9kEwoojmDcMmXBE7uFSPTZf1yrXilsR+D/qNNbF9HF3oPG0IGqM16Uwt9ITnHdfIF
 FYVJoUsT4vaeb5gvz62SHlFr40GCtNQSrAR0MZuqJuTd/l9PlUkBPj7mh4txvJpN9aelP6Pk7
 UsSgTLoqg6Acpum/7vjJRaAu/jTXU8EIQ96kzx2xvPPwR4u2mzmgSIsOmlpY7HRtecbofZMaJ
 FFq/wY2wTA+PV8PXrxjyrPUSs7r0u4u9FjnsYS2G4Qrp8F/NYqLoP/wZ7k5V1cKg30wnXkLrj
 PMivYoYYNFIOvoQwwevbvVobFVWqeOZV2SLBKg/HeR284z5zugh5po5E6htW4scAJbzBTikMv
 0mPmId4bSJLqDYcGTVZk1fVDnPeQo1CD15WnUpYGuFe8YXWaAz/GTUATl0IoNKtAaPxsPw==
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> The commit log says:
>
>  This issue was detected by using the Coccinelle software.
>
> Either that's inaccurate then,

No.


> or you should be able to provide the corresponding output from Coccinell=
e.

Do you find data (like the following) more helpful for the adjustment
of affected implementation details?


Markus_Elfring@Sonne:=E2=80=A6/Projekte/Linux/next-analyses> LANG=3DC git =
status && spatch =E2=80=A6/Projekte/Coccinelle/janitor/show_jumps_to_kfree=
_with_null_pointer.cocci drivers/gpu/drm/drm_property.c
HEAD detached at next-20240104
=E2=80=A6
@@ -114,9 +114,6 @@ struct drm_property *drm_property_create
        property->dev =3D dev;

        if (num_values) {
-               property->values =3D kcalloc(num_values, sizeof(uint64_t),
-                                          GFP_KERNEL);
-               if (!property->values)
                        goto fail;
        }

@@ -133,8 +130,6 @@ struct drm_property *drm_property_create
        list_add_tail(&property->head, &dev->mode_config.property_list);

        return property;
-fail:
-       kfree(property->values);
        kfree(property);
        return NULL;
 }


How do you think about to extend the application of script variants
for the semantic patch language?

Regards,
Markus
