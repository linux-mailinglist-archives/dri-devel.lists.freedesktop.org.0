Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D579CC04AF1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 09:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3239B10E9EA;
	Fri, 24 Oct 2025 07:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mBJtgOWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93D610E9E0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:56:11 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-63e0dd765a0so1721155d50.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 23:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761288970; x=1761893770; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=EnMPc7GyLpnggTRqyDCqIuoqTPnFNrDWKh++vNXuaoE=;
 b=mBJtgOWpPzcwq+BfNVwoTl2RCOLXak5wt2rcJ2c11ug6F7Ft2mTeoFjKTckO0tMafh
 7c+YFUPMxxCzQBiEblsIZsYWORARyF3pbbotFbG2fbJAjKUbZ/Owj5wbC2l0t9baI/My
 NdXKP+18ktLdxr9NmxynYJJagjpnMgPaCflNxIZYijZ8mhmBI61gLX8d9OPLaAJ2kEnN
 gwUhXcJmTmoJb4LZTyjS4s2v841AHZk8biczD+iyAA4hTh8d9c7bseaAk2MNdwOh8Xh/
 /b+KVVmzfcKPMK0ZLzB1Sgv/WR61POVSiy3PRBwBqsc1dN3lQ4jeuu6/ffohexi2sjqc
 wcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761288970; x=1761893770;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EnMPc7GyLpnggTRqyDCqIuoqTPnFNrDWKh++vNXuaoE=;
 b=OKFGBYPxTAMTj1TS6XxKNf4ojzVgt0zlTzKB4gjXdPgni9/lxYb+bd66gqvMbKo7+Q
 JAgQbNEiAjGtAYhseIMvgOuv8GXZ2cnRz0O2ioYOhLkVJpmpgA8D4oqH2cajskzQcxd2
 VHjG1vLDZ6tqYK+Edd8Uypa0UshdgydD37ENMbTPqA4YEc1pus9z6CUIYfBrb93Usu4F
 00xPiSeAm3RSrA+jThCLyFewKO6xdBKOWbAnblxGwQev+lJ9LT3AVuXFoaNlcRNYCRQ0
 FZdSjzeb6wpYjS76Uaeo7OOouREWXKtVqUeu4FYSy+TTfDuTBgv8++QJF1indjc+k0b6
 thzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBOYWI08uNtfmagM/NWITa+fo7FdQmAR2eZRTN0qw5WJ6zTj6qYHDb7pR3SXS1BFzoRuUhAhKfH5w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5r7YrFRHxOuNdW/Ia/d93xyl0QrSkhSIOChvJkQUiXtEYIG8O
 x0SqQYo3E7vu+VtbPhihIJHv3nqQ5Xa9z6WJ7Ud4fvPSADnNGl1QiYYs
X-Gm-Gg: ASbGncveTNjq2hb6vziybQMfXBBx2YTSv4MOTtpLjn3G03/kkeg3cx2XgTPMooFw7sS
 rDAt8H4kGHPyb1uep4PTM8F5zwlc58ATkibKZ/JrO5l6PHpvOx/CB9KXJ0KykTgg6RbRReCMshE
 um9nO+bhtmQ7gxVwoA6AXxaULb75gjp9FeE4ttA1zBdJXU34NmYrMrBkCaeRhMBSqziOJSGUF3V
 4FasDtPHqaVFKL/YGdNpuVMCJt8ZsMu/+EqLBMiAikh9oF/7YMGvRCPEIrb+/fzEUl2P6RXL7V/
 dpRnKrlywfjm9NKBgTqcZPfy2Fgw6mnjiNA0ZLhprCyaZJ5PrdKcDIViaJgzS3d+/up8AZDC7i+
 ivEO8xeDKfdSz3xWbG9ewMDBL6g4f8QLS8m99z4SUvHJ8iUkDG03SIAlBBPx01Clr2rApRSf4Tm
 ZrZgsohDE+oxg=
X-Google-Smtp-Source: AGHT+IGaO64whWfgi7ej0DT2Sa/HLiSjIz2GeQuUeokZCAtrzQ3ySNsQidcKfHEOIN9LKetFWMosJg==
X-Received: by 2002:a05:690c:670b:b0:781:64f:2b15 with SMTP id
 00721157ae682-7836d341ecdmr437476897b3.55.1761288969981; 
 Thu, 23 Oct 2025 23:56:09 -0700 (PDT)
Received: from vps.qemfd.net (vps.qemfd.net. [173.230.130.29])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-785cd70a030sm11319527b3.58.2025.10.23.23.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 23:56:08 -0700 (PDT)
Received: from schwarzgerat.orthanc (schwarzgerat.danknet [192.168.128.2])
 by vps.qemfd.net (Postfix) with ESMTP id 9A5A52B0F8;
 Fri, 24 Oct 2025 02:56:07 -0400 (EDT)
Received: by schwarzgerat.orthanc (Postfix, from userid 1000)
 id 8D8EA600F3F; Fri, 24 Oct 2025 02:56:07 -0400 (EDT)
Date: Fri, 24 Oct 2025 02:56:07 -0400
From: nick black <nickblack@linux.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: Adding EDID support to simpledrm on top of the EFI sysfb ?
Message-ID: <20251024065607.GB3324796@schwarzgerat.orthanc>
References: <301d7da1-5101-4f16-90cd-5bb4ac41c87b@kernel.org>
 <b99e3a32-6d3e-48a0-9936-a67999354a44@suse.de>
 <9eb60fce-b235-4dad-8672-1cc4e61309c5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9eb60fce-b235-4dad-8672-1cc4e61309c5@kernel.org>
X-Mailman-Approved-At: Fri, 24 Oct 2025 07:21:29 +0000
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

Hans de Goede left as an exercise for the reader:
> Some distros are actively trying to move away from grub since
> grub is quite a complex beast and they are trying to move to
> something simpler like systemd-boot. As such it would be a good
> idea IMHO if efidrm could directly get the EDID from EFI itself.

I haven't used grub since at least 2019, preferring EFI boot 
stub managed with efibootmgr (possibly moving to systemd-boot).

-- 
nick black -=- https://nick-black.com
to make an apple pie from scratch,
you need first invent a universe.
