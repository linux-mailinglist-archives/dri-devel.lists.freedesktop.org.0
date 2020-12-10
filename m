Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8032D604E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 16:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BB56EABA;
	Thu, 10 Dec 2020 15:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8F16EABA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:47:36 +0000 (UTC)
Date: Thu, 10 Dec 2020 15:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607615254;
 bh=0NcXHMVGlYF9ZZ5Q6Qv5F8sN5CW4QQqoW6q8FWdhrtk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=lMTiehm6eGQOsEvmQGA0ijGP6eDLS8MYctfnk9/xLS38ZzsBxhehutNsjxoEDhNBj
 HpcPGsTpalVEJYYMO+O84Dr54SMNBn9VfcJdedij8plEfIf88h8/YGTn7KMO4qiW6q
 VXzRJnhoNXFqUx8moj2SM8Td+btshcd2R6ERmuvYDQPgP61vZWMa8+vIlGIi3en2fj
 tNKkdrp+FfULLp7rmWhdloy5OZaOw+KSNM2xiTCr8p0vBeogC1fZvM9ED6HfvyoX4y
 WQrXUAiYG0tpi2JRHz/gb/67kaHDDMZDWQtZ93WWsXo4uAntDw2BM1G2rUSI/6MErI
 b1/Rz/efVumSA==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: rework description of primary and cursor planes
Message-ID: <JKb2cbQDVUXFFXnJGgJ1dh5vr_UhsEnBKIn7f3C3e8ekU_z3rzatSwFMbWQTWDU8VLnnIsTVPcgce5_F5_ocDz3sIPvEDGPDPhGxiGzwUws=@emersion.fr>
In-Reply-To: <iId0AQqxwalIhTMk-efVSEskNIuLA_pP5h4loD4Mbu17dJF83zbUXu5HZnSekjM73tghP2kE5MNXdMT3D5lus2e-s66PX4V0a_mDka695FY=@emersion.fr>
References: <wrDqxEGdxtotWKrfQH8W8tl2Z8JgdHzUs3wuTth4@cp4-web-027.plabs.ch>
 <20201209004223.GL401619@phenom.ffwll.local>
 <0zedd9O9Bp0DfEH26xBTGvZtqA5bdE2EJDN3z5TXiDIyiwfTnRapgDy69MjAlhMWrzqKTzoYwovpGANNhp1PmneSCrm-xzw9DIeauv1SkgM=@emersion.fr>
 <20201209160223.GT401619@phenom.ffwll.local>
 <W7ZhvStaUaGjlhYSldWxC93V0-tjSEwm-ldyPBpmvkJ9xRw1krfB1TNd5X4hEjkamaEhH1ASD0yiFzMCh72oG8vCeg-HeOt5dRN5U5v_q34=@emersion.fr>
 <20201209194030.GV401619@phenom.ffwll.local>
 <iId0AQqxwalIhTMk-efVSEskNIuLA_pP5h4loD4Mbu17dJF83zbUXu5HZnSekjM73tghP2kE5MNXdMT3D5lus2e-s66PX4V0a_mDka695FY=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Additional note, I don't really want to add the same check for cursor
planes, because I don't want to forbid a driver from having the CRTC
without a cursor plane and the second CRTC with a cursor plane. I don't
know if such heterogeneous hardware exists, but it sounds like
something we should be able to support.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
