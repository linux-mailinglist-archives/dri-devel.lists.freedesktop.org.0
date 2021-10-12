Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA07842ABFF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 20:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561986E83A;
	Tue, 12 Oct 2021 18:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480356E83A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 18:37:14 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e3so190235wrc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 11:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:references:in-reply-to
 :user-agent:mime-version:content-transfer-encoding;
 bh=bLuzqnDm2EHxi6V2DKw/7cpt0YhOvlzBbb3MZz0Zd9M=;
 b=cEskER9Wjq1/1+A/QLH2iwbgaFernyb2wjrJsrfVXmdC0bUSVtTLf61fpuNSRvCTSh
 rLUQizIP4PqzWLiFRPz7Dy57usjlceaAxk0PoRVO1HRGDIFPlp/mNtNDkXc/ZaXPiDut
 BlcZ/SYB6Rt2j0X1gUyOQIn6v9qKWBqHauRU2EyKDY3Ya8rd7ZL/cQ6XKOYYrVMR8Iip
 OXICLzXn5txvfocXJDN/TjILWfPRnskuun+4tmvtNeDQ744bau8V7O3dkG1xQAgUMSOR
 OXdhTXsaiadWItQsoKEKiuojXchKm/b7akcrSoEOz2bVs1J5O49ODJ1ToxlHvYn+SvQA
 tDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:references
 :in-reply-to:user-agent:mime-version:content-transfer-encoding;
 bh=bLuzqnDm2EHxi6V2DKw/7cpt0YhOvlzBbb3MZz0Zd9M=;
 b=XBfB4HGUboMUQNCld/cwmjdZi5iT3dqfssnFIhHDhxKRNBNL6aN+5nVKJ/JbOTsCUK
 ZOCDIa5bqdnZ2eVjKd0nJ3kj1ON2YRd3keIOH6IazoYBAnzL/VHZSgzJhhbLbV0K7jPe
 Jc61/9AsImTVIjqaX1nC6dcL5TkHrTeQuE+2b9vSx7yH0fUNQPgvXB3fdW3dxe/oBzSn
 BafTT5mZwZ1HyayzbASxYsaaVEK2WAIbXt9m8xm9S9c2c2oFSntdU/h2n/LN1byCZZdU
 Yb8wyHXWxmfKPjNiqU/pYGo1c1a7DXQKtKN0SUSMDG9KR0S0XM82mPXtGMQ6GlA5AhH8
 6fJw==
X-Gm-Message-State: AOAM530l5lqgqs5ig1QFlMZW5zmatuc4y2R3yiDezNhe0paM+Dy9oD2V
 IP3SReOeumcr8T1fUmB6UNc4NA==
X-Google-Smtp-Source: ABdhPJyLGE+Y3X2St+CdwP+4GiW55M5de5KNQgee9s9tLMjEMclgV+Z1WOHRrzdCncSoW3qHHNKbYg==
X-Received: by 2002:a1c:21d5:: with SMTP id h204mr7436705wmh.9.1634063832531; 
 Tue, 12 Oct 2021 11:37:12 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net
 (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
 by smtp.gmail.com with ESMTPSA id o26sm3242078wmc.17.2021.10.12.11.37.11
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Tue, 12 Oct 2021 11:37:12 -0700 (PDT)
From: John Cox <jc@kynesim.co.uk>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: Should multiple PRIME_FD_TO_HANDLE ioctls on the same fd require
 multiple GEM_CLOSE?
Date: Tue, 12 Oct 2021 19:37:11 +0100
Message-ID: <oalbmg9okjpuieqo8fl8b890h1a7sflv94@4ax.com>
References: <mg3bmgt12b5s7qlqn1gkc5q8f75dgfu91m@4ax.com>
 <nxaw17TpxhjASmae6VSj_yGM78BHFZF6RXy7s7LFJ3C7mmbDfGaafJ9umB5_08Xlf7X8SKAKhEEGOa-WFiv-jLkYDi_Yjn6Hdhn76YgrTuI=@emersion.fr>
In-Reply-To: <nxaw17TpxhjASmae6VSj_yGM78BHFZF6RXy7s7LFJ3C7mmbDfGaafJ9umB5_08Xlf7X8SKAKhEEGOa-WFiv-jLkYDi_Yjn6Hdhn76YgrTuI=@emersion.fr>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

On Tue, 12 Oct 2021 17:33:18 +0000, you wrote:

>Yes, this is expected behavior, even if it's not intuitive. For more
>details, see:
>
>https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/110

Thanks - as noted in that discussion the behaviour is a bit unhelpful
but just knowing that it is expected means I can deal with it.

JC
