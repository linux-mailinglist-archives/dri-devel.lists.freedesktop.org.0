Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C74C6478922
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 11:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F2210FFCD;
	Fri, 17 Dec 2021 10:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1259710FFCA;
 Fri, 17 Dec 2021 10:44:31 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id d2so1612760qki.12;
 Fri, 17 Dec 2021 02:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hGXTp3LMVBIEry9rVrZHu1bEaAmmpjfRK8toRUzDPQ4=;
 b=WunsHCKEAqp2g5ANZgh3comiK2udE2f8Hljt+mS2MfWOVCYYExWXE6DatZpJDCuk83
 59+qBhR/Ss6t01Sg3hqUPIgW5KU2KSGnqXIgMf4MrLpXlzwYt2DEiYdgn4FFxg3ptuBS
 1LD3ENbxKuZE7IjrGk2TiJOioZNQGlsIOMYrnKq8pQzW7HLl4HbqABoA2W/PAQpCHkic
 LFNYLKbXHtbmrEQZEuY30hrAR96OhmCNXBbWL/otEWYGQmTg7hjPMPEIrTYYvIga+fm6
 fO14lOLly1VeIo7MJ3MyTgLgLwdlNit7i1Xli8kaELjbCvOqGTtflZq/flRQ0q2KJuaD
 VYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hGXTp3LMVBIEry9rVrZHu1bEaAmmpjfRK8toRUzDPQ4=;
 b=K4AE3amy0hVl3cJevbkJ4C5fYKa/sVy7Dc+XOXZfY+6itoFrE5/lIX2s7+TRL51l7n
 vmpg1306pTPAnbXgv+BDHUyhY0kRjXF21woUvmwmnbSG7Yfz0iKTw6sHUElolRQZqaFN
 rq+aEkUp3ZHtzlo38C6Zw8SqJQcc1QWIJVtSBWP9shEKCtfVIMRSRfpj8hN9ztyVnfCX
 ML3zR9O1vTIz4kuORQ2vVAeCoFYhajrSjKsuy264rH+NtqsJY6e55XLwZHkbhnGngaLO
 XW0Dn3dfoe5jnyVFjrvz9JBDViXdn6bxkFNEttKfQYlNartM/lDVwAmcgkrcUWbRlP4u
 6/Wg==
X-Gm-Message-State: AOAM530huIbRZfkGXxDfb3ogy8sSMBvtPz0l7EpgHnxbNE9HVh8Vt29+
 J0owHvlKFJsBIVfo5wMNQm0aPk7LZwBhB4nduzBYk+MnGEY=
X-Google-Smtp-Source: ABdhPJyEU2+MEa1Hr6BbHDvdTjJL93WIq4rKPswxj3JuHX7rbwtl5ZQklaIS5Pc4bTKUodGkQL6fA0kzlMOmV19qlWw=
X-Received: by 2002:a37:a353:: with SMTP id m80mr1223391qke.7.1639737870993;
 Fri, 17 Dec 2021 02:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
 <20211216142749.1966107-5-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211216142749.1966107-5-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 17 Dec 2021 10:44:04 +0000
Message-ID: <CAM0jSHOhD5Rm2665woZU31640V3Gxd5ZRLL0-GEfuPuM4f1AYA@mail.gmail.com>
Subject: Re: [PATCH v3 04/17] drm/i915: Take object lock in i915_ggtt_pin if
 ww is not set
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Dec 2021 at 14:28, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> i915_vma_wait_for_bind needs the vma lock held, fix the caller.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
