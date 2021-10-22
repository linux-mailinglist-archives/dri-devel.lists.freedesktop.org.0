Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC25A4375DE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 13:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E376ED0F;
	Fri, 22 Oct 2021 11:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C0E6ED09;
 Fri, 22 Oct 2021 11:10:45 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id 77so4225822qkh.6;
 Fri, 22 Oct 2021 04:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aiVwXv+tmTTQpkoNl9l5qG7n7E+c1M/GVJBi2XD6EdA=;
 b=DtXYnkFhkImQTXaaObvqj9DsmfRBI2I0pQ/P8QwJBKFffjlPzaWPnA0nyPTFj2g2JK
 UrurRHvOPzNU+Jd0C39o3CTq1cQr3JhnKfOMzRaqtRHcr2St4Rb4Y+n0Zcl/0ILrt9EQ
 Ht1uM1NlZ5epWYHxfPm+p8qIUzDYUSvr7WbioDnp7T6HP/N7LQ0oPZoVbmghT+exmr4q
 oDf7eWYIofl75eWk6x2oqqwT8YNk2rgsYYfv+LXiLb8LQZR7KzLNDlKkxlA7sE7Ilz41
 mCUkkB2O8xz2Glvfycg/NrSsJmktoPcIMppX/Cph3MoAtUYzfah7reJxyd4vIz/HA4MA
 aLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aiVwXv+tmTTQpkoNl9l5qG7n7E+c1M/GVJBi2XD6EdA=;
 b=jp3eVn7iDMO4aW/5mkWmU8DSJb6VT0pNvoDwUj1MZPD7Pb2AslamHQp09HJdrFOECg
 5qLGDu8zmrYDhQFXOa0Hb401dcvJwyLoSLOEUUIQJe8dyFG7imwdlPnQafKz9S+kIV3G
 2+YplDNALSrtGvzwwwAqcKN42TaDFsw2lVstoQHtik6IeWgaVis8vybUz3oRL3Mfwg+/
 dJPWL7r2NdhQPV5bfCNk3VV3/SCNaNxxFjfdRnDJeRSUMMSlnBpKxeIGnAHorX3MyeCL
 vQ7RMb/BnVBKA+8m6/796IwFw9i4/eE5Ntk8wjQJ5I8bZrlrHS0DXyB4VeAT8b6OiVpk
 IWTg==
X-Gm-Message-State: AOAM531iZllzi1TVY0rgHriiA4bWeu4Pu6sd5VijrCmpY1nSrQ5QmFMg
 zXVNmJdworuVJt9fbedvxGxMhpbNqZjp1vq0IcuLcsbXRoA=
X-Google-Smtp-Source: ABdhPJz96wspPMBUFWrai6yTSDuTrgUbrZlpHnmUbp8ZnqSqcUZCpEluQl4gXmvpHYBb/o3zVNVsPRFLBuziH/Br3Bk=
X-Received: by 2002:a37:bb85:: with SMTP id l127mr9481371qkf.223.1634901043676; 
 Fri, 22 Oct 2021 04:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-25-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211021103605.735002-25-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 22 Oct 2021 12:10:16 +0100
Message-ID: <CAM0jSHOoqOHEsE4SWr0QJ_CXWGCaQGBjksWB7Ky8hfW2UC+c+A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 25/28] drm/i915: Require object lock when
 freeing pages during destruction
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
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

On Thu, 21 Oct 2021 at 11:37, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> TTM already requires this, and we require it for delayed destroy.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
