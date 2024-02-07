Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780E184C544
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 07:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF386113121;
	Wed,  7 Feb 2024 06:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q2qHDSv2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58ADC113121
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 06:57:06 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so35290866b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 22:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707289024; x=1707893824; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iiIPVxNjDQdmzDhGmlblPxzeuCQp4bIfbYZ0O2Dls6g=;
 b=Q2qHDSv2axPePJUeD6dsRR9HEBZjf/p1G4JiwejUvZy6UyVwoJZRe/RO35OVFP1j3q
 XRcn7hS4pT4KVz/IVTxvn8MCsPRxHHCUrrKMr1kkoHKA2+4/1MW/EGBfyhUtC9GlsXdh
 wixXnoY2SKJGIjcftFg2uV72X1rZkU73QVbNBo1r7LfAfwPFpRvQAYOqax+cuJzed4W/
 dFFWF5oFvYKtmVv8a6svzQ+5wIjm6lgmjE3qs10gRU7vX8NBm/3vBctscg36u4wTSNbW
 sRtvSWvv68kBiPJuK9h0YddRjX0aYeezjX4ANnh5OqIVzxggMYx4adnwyn68vGP2mJTb
 vjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707289024; x=1707893824;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iiIPVxNjDQdmzDhGmlblPxzeuCQp4bIfbYZ0O2Dls6g=;
 b=Q924WPsyYd3M+Ezbji3pH+8bVad9tMOFMkMo8WOExvdsyWd3MxdlFclP0vrsEZ4cMD
 tslCLddmuPDp5QeqU0AbvnlpPS6kBo7RegVO5yRsw7PYQs4YpIpELTWVNmASBUb+5ZDU
 RgkUgEQ65WGaUdAU+lXZetn1bVgV0hGGGHtwSTEM/JOLSY+2KgK09+Otyh8ZxnlDTi/B
 +z1lRqx7tW9wayTw5VSaPMCRulK1A53qkSgGlgCQhRbtnDiHVoufGSMbYz2b2g5dZtHM
 KP5+Tx7bNcsUHDXTG9ZreSKc1NNzO/yQCFA6ZdAswnFNPhDU0TkBDjCFoXCVyPFsVhru
 YhlQ==
X-Gm-Message-State: AOJu0YwdInyXc054b5LbrQjvxYVLdVIJfDJjhi/55XQe3QyiGuUhrkHJ
 e2MYsmkxMcNaBfg/AIFC9/uan/PTi/Bw3DQjXcJBQcmY3Y+6q7CyOrevjcmgTVxWKRlMJJtDrna
 Ezdp5wNGNffbiY+38pFyi5nHAC1saSp8wirM=
X-Google-Smtp-Source: AGHT+IFSkBqcveGf74WHaHoHF42Rc9QC3bkzNF3i5pQpypqJjKtqDRp5wgxB29REz50Y9Wnt4wJgFC3/xE/i0Zcgwfw=
X-Received: by 2002:a17:906:2f11:b0:a36:7189:af7f with SMTP id
 v17-20020a1709062f1100b00a367189af7fmr3705896eji.50.1707289024283; Tue, 06
 Feb 2024 22:57:04 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 7 Feb 2024 16:56:52 +1000
Message-ID: <CAPM=9twPgn+fpbkig0Vhjt=cJdHQFbNH_Z=sRhSZwuvLKhavbA@mail.gmail.com>
Subject: xe vs amdgpu userptr handling
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm just looking over the userptr handling in both drivers, and of
course they've chosen different ways to represent things. Again this
is a divergence that is just going to get more annoying over time and
eventually I'd like to make hmm/userptr driver independent as much as
possible, so we get consistent semantics in userspace.

AFAICS the main difference is that amdgpu builds the userptr handling
inside a GEM object in the kernel, whereas xe doesn't bother creating
a holding object and just handles things directly in the VM binding
code.

Is this just different thinking at different times here?
like since we have VM BIND in xe, it made sense not to bother creating
a gem object for userptrs?
or is there some other advantages to going one way or the other?

Dave.
