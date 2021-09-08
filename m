Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38787403F5C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 21:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8056E2A3;
	Wed,  8 Sep 2021 19:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B6B6E28B;
 Wed,  8 Sep 2021 19:04:51 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1631127427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ja6UVY/K51tXsi/XK0upPS/i2C7NG+UnVxqjbfVoGk4=;
 b=dHHaZQKqI2XbPRdwg09l8XmX2++tSCWJ/STqtynlVm9FvHiYw2Jtloj/xZIXxXDBwZGwDl
 MPXqnOt0Vgt3EhaZ208fFDJ2O9LYs+beJCgEHIS/wG1i9GNqHtsCtExiOsotjgULdl/WJK
 97gqGYLR2ll5lcuH5ELCgen57GSK4EiOYXpwN5nBxYucntCHHjuRKKE7UXUNVJLhhvk8d4
 eB+/XWdL5Ofgi8t5LpqdAYi+tLVRj2uu+4EHjnl9PK/ctDUN7I/9tIyWENWlZwmK5mPEWt
 eKc9t5twN4pUnv0BXsH08Ax2YfdwsUTx9JYm6nseApR8dShHzFOLuIDXOqCGZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1631127427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ja6UVY/K51tXsi/XK0upPS/i2C7NG+UnVxqjbfVoGk4=;
 b=QQzOpSv7gV3E4Yhh0WCZStnU34gClc1Xft1BQ4pEZW8t1B2mfnoQ7pSSQOh0AMZAJADqZM
 QQrEMqNgIBCau3Dw==
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Clark Williams <williams@redhat.com>
Subject: [PATCH 0/2] drm/i915/gt: Locking splats PREEMPT_RT
Date: Wed,  8 Sep 2021 20:57:01 +0200
Message-Id: <20210908185703.2989414-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Clark Williams reported two issues with the i915 driver running on
PREEMPT_RT. While #1 looks simple I have no idea about #2 thus the RFC.

Sebastian

