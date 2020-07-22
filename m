Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8833228F26
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 06:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1906E2BC;
	Wed, 22 Jul 2020 04:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73136E2BC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 04:28:07 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B77B980608;
 Wed, 22 Jul 2020 06:28:03 +0200 (CEST)
Date: Wed, 22 Jul 2020 06:28:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Bernard <bernard@vivo.com>
Subject: Re: drm/panel: remove return value of function drm_panel_add which
 always return true.
Message-ID: <20200722042802.GA376181@ravnborg.org>
References: <AMsAqwD5DbRmX6UN6RCXi4qz.1.1595334245532.Hmail.bernard@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AMsAqwD5DbRmX6UN6RCXi4qz.1.1595334245532.Hmail.bernard@vivo.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=gafcukPdFjcCkLBVqo8A:9 a=CjuIK1q_8ugA:10
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bernard,
On Tue, Jul 21, 2020 at 08:24:05PM +0800, Bernard wrote:
> 
> Hi:
> 
> The function "int drm_panel_add(struct drm_panel *panel)" always returns true, this return value is meaningless.
> So I am planning to optimize this function to a non-return implementation, "void drm_panel_add(struct drm_panel *panel)".
> 
> In order to achieve this optimization, I need to submit a patch series: 
> First, modify the code of each submodule that depends on the return value of this function;
> And last, replace the declaration in the drm_panel.h file and implementation in the drm_panel.c file;
> 
> Do you mind this optimization?
> Looking forward to your reply and suggestions!

First of all, thanks for reaching out.

And yes, please implement this simplification.

To avoid this ends up in too much small patches then I advise you to
divide it up like this:

- One patch to convert all panel drivers in drm/panel/*
  Or if you think this is too much to handle in one patch then split
  it in a few patches.
  We do not want one patch for each panel driver.
- Then a final patch to remove the return value from drm/drm_panel.c

Patches should be made on top of drm-misc-next.

This will make the number of patches manageable, easier to give good
names and easiest to review.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
