Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0E21F0DAE
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 20:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7424C6E150;
	Sun,  7 Jun 2020 18:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94DB6E152
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591553932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cJE9WpsWIYaefFqDw9M6q2LMC2iTAF6HMuSwUDyFG3o=;
 b=bmxHu1LpqX9fgngQwyrN5MmaEL/c0u1Aw0dFVG3tzXYvM/xPM6a3Jps9D9AZ6WzeFA3tGK
 vkODcVEavTTrdjt0FaWcFXTPQeZ9Ho0csKQc9nUQcv2y/UF5UrqQ5tl6CAAW7mTw7lRX7S
 8xX6M+2gbESnNqfrmI2Zbx6EFN89D4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-MKpyfNo1N_q132TGKo2s_Q-1; Sun, 07 Jun 2020 14:18:48 -0400
X-MC-Unique: MKpyfNo1N_q132TGKo2s_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE9278014D4;
 Sun,  7 Jun 2020 18:18:46 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-92.ams2.redhat.com [10.36.112.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA57D5C1BD;
 Sun,  7 Jun 2020 18:18:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v2 00/15] pwm/i915: Convert pwm-crc and i915 driver's PWM code
 to use the atomic PWM API
Date: Sun,  7 Jun 2020 20:18:25 +0200
Message-Id: <20200607181840.13536-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: linux-pwm@vger.kernel.org, linux-acpi@vger.kernel.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Here is v2 dropping a debugging-patch which I accidentally kept for v1
and addressing a minor review remark from Andy for the 2nd patch.

This patch series converts the i915 driver's code for controlling the
panel's backlight with an external PWM controller to use the atomic PWM API.

Initially the plan was for this series to consist of 2 parts:
1. convert the pwm-crc driver to support the atomic PWM API and
2. convert the i915 driver's PWM code to use the atomic PWM API.

But during testing I've found a number of bugs in the pwm-lpss and I
found that the acpi_lpss code needs some special handling because of
some ugliness found in most Cherry Trail DSDTs.

So now this series has grown somewhat large and consists of 4 parts:

1. acpi_lpss fixes workarounds for Cherry Trail DSTD nastiness
2. various fixes to the pwm-lpss driver
3. convert the pwm-crc driver to support the atomic PWM API and
4. convert the i915 driver's PWM code to use the atomic PWM API

So we need to discuss how to merge this (once it passes review).
Although the inter-dependencies are only runtime I still think we should
make sure that 1-3 are in the drm-intel-next-queued (dinq) tree before
merging the i915 changes. Both to make sure that the intel-gfx CI system
does not become unhappy and for bisecting reasons.

The involved acpi_lpss and pwm drivers do not see a whole lot of churn,
so we could just merge everything through dinq, or we could use immutable
branch and merge those into dinq.

So Rafael and Thierry, can I either get your Acked-by for directly merging
this into dinq, or can you provide an immutable branch with these patches?

This series has been tested (and re-tested after adding various bug-fixes)
extensively. It has been tested on the following devices:

-Asus T100TA  BYT + CRC-PMIC PWM
-Toshiba WT8-A  BYT + CRC-PMIC PWM
-Thundersoft TS178 BYT + CRC-PMIC PWM, inverse PWM
-Asus T100HA  CHT + CRC-PMIC PWM
-Terra Pad 1061  BYT + LPSS PWM
-Trekstor Twin 10.1 BYT + LPSS PWM
-Asus T101HA  CHT + CRC-PMIC PWM
-GPD Pocket  CHT + CRC-PMIC PWM

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
