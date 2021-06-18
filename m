Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5253AC8C4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 12:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC8A6E9E6;
	Fri, 18 Jun 2021 10:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E698F6E9EB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 10:26:08 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1luBhO-0001OS-Mn; Fri, 18 Jun 2021 10:26:07 +0000
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Colin Ian King <colin.king@canonical.com>
Subject: gma500: issue with continue statement not doing anything useful
Message-ID: <9eff854f-92ed-3f09-997f-f81c78a8b5a3@canonical.com>
Date: Fri, 18 Jun 2021 11:26:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Static analysis with Coverity has found a rather old issue in
drivers/gpu/drm/gma500/oaktrail_crtc.c with the following commit:

commit 9bd81acdb648509dbbc32d4da0477c9fae0d6a73
Author: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date:   Mon Dec 19 21:41:33 2011 +0000

    gma500: Convert Oaktrail to work with new output handling

The analysis is as follows:

114        /* Find the connector we're trying to set up */
115        list_for_each_entry(connector, &mode_config->connector_list,
head) {
116                if (!connector->encoder || connector->encoder->crtc
!= crtc)

   Continue has no effect (NO_EFFECT)useless_continue: Statement
continue does not have any effect.

117                        continue;
118        }
119
120        if (!connector) {
121                DRM_ERROR("Couldn't find connector when setting mode");
122                gma_power_end(dev);
123                return;
124        }

Currently it appears the loop just iterates to the end of the list
without doing anything useful. I'm not sure what the original intent
was, so I'm not sure how this should be fixed.

Colin
