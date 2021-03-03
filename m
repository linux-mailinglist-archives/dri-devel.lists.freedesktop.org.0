Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C991132B8D0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 16:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF826E99A;
	Wed,  3 Mar 2021 15:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B386E99A;
 Wed,  3 Mar 2021 15:04:58 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id d9so23787647ote.12;
 Wed, 03 Mar 2021 07:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=awzIJukxIn3496jKn3aKkaMrZCk6YH4VW3bDiugzALY=;
 b=RvRlGkNcFhWi7u1KmBynlduvXvAvc5OgEvxiJvS8PkXgDfg5eLyypszajtTEC3vJcT
 g+M4/ctfXdbDVaf8d2jFcnHfHSWvEj770ZYER3fDS8ZqspeBmhnyCqerqOnTROD8Kmyv
 FGC5mJ414a341MXNhLGFui63z4U8M27ryMOYVGqbAyfpRTfrc2k65TcW/eWR2nB5OF1i
 zE0viYtCfNdF5ZmLuBKaPRCj5g5bg7zHsoAqcciTUEs0nyEQ96k1tVCb2UDiHUm66baO
 +cyAectTSxRsmkOMK9NTlCGwqJijr91TYjvbLEi9ySDKzYKjsbNdBjzRB61RDlYvzxKE
 ktDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=awzIJukxIn3496jKn3aKkaMrZCk6YH4VW3bDiugzALY=;
 b=O8Oz7TeFW5ngptkwLfp3vYeIOmb95EEVyn6IY6xSskRisfQ5YDyeI+qrXBc9bo9aX1
 zcjJQRxYY/0XG/HkeDMnkJD0JfNZbjPaCgXvLkVXqruQWY1XFq3S1ZZ6rbFFEwEX7cSu
 ULXyzYnqCRqOrAgrldauMMxcOJMgZiY6xmRGVgHr1ApRVfwd/7Ofg05SW9w6dldlHFZX
 wYK5U/u8FN2LgzHJPWUPlNyA36DrQV9KX2al5pZq1rRMbAc6oymPhz5w7WVursLUs2+6
 TA7+JGiM756YsRTYCLFuMU7Tk17NVs5g45heKKAJ32HSUIpayX/bjEgdDW+cw8mpZlGl
 5/EQ==
X-Gm-Message-State: AOAM532JCZscoxc661IoTE6q/PrDuHDLGPglFYYUpkRjBwPsF4YPx56K
 +S2uRaGqkdHiKrY/b5Mv4gTua62VewJ3da7oC1Y=
X-Google-Smtp-Source: ABdhPJzjEtQEJOeMzY2F5sci2j3avEqTW+zAuyAP1IMbYxRCWx1YIw/nrcT+hm+hR+SpmGexRmYpr1qyraOIoTWIEv4=
X-Received: by 2002:a9d:20c3:: with SMTP id x61mr11841920ota.311.1614783897805; 
 Wed, 03 Mar 2021 07:04:57 -0800 (PST)
MIME-Version: 1.0
References: <YD4eZLCFU+fbTGIp@mwanda>
 <MW3PR12MB45540A69909BB5556C6E1C11F9999@MW3PR12MB4554.namprd12.prod.outlook.com>
In-Reply-To: <MW3PR12MB45540A69909BB5556C6E1C11F9999@MW3PR12MB4554.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 3 Mar 2021 10:04:46 -0500
Message-ID: <CADnq5_NsD2qkoTK9mJhhTLGi4hSP4b+MNMcg6=6xPYYCfWG4rA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix off by one in
 hdmi_14_process_transaction()
To: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Wenjing" <Wenjing.Liu@amd.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Mar 2, 2021 at 2:26 PM Lakha, Bhawanpreet
<Bhawanpreet.Lakha@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
>
> Thanks
>
> Reviewed-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> ________________________________
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: March 2, 2021 6:15 AM
> To: Wentland, Harry <Harry.Wentland@amd.com>; Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>
> Cc: Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Dan Carpenter <dan.carpenter@oracle.com>; Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Liu, Wenjing <Wenjing.Liu@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; kernel-janitors@vger.kernel.org <kernel-janitors@vger.kernel.org>
> Subject: [PATCH] drm/amd/display: Fix off by one in hdmi_14_process_transaction()
>
> The hdcp_i2c_offsets[] array did not have an entry for
> HDCP_MESSAGE_ID_WRITE_CONTENT_STREAM_TYPE so it led to an off by one
> read overflow.  I added an entry and copied the 0x0 value for the offset
> from similar code in drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c.
>
> I also declared several of these arrays as having HDCP_MESSAGE_ID_MAX
> entries.  This doesn't change the code, but it's just a belt and
> suspenders approach to try future proof the code.
>
> Fixes: 4c283fdac08a ("drm/amd/display: Add HDCP module")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis, as mentioned in the commit message the offset
> is basically an educated guess.
>
> I reported this bug on Apr 16, 2020 but I guess we lost take of it.
>
>  drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c b/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c
> index 5e384a8a83dc..51855a2624cf 100644
> --- a/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c
> +++ b/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c
> @@ -39,7 +39,7 @@
>  #define HDCP14_KSV_SIZE 5
>  #define HDCP14_MAX_KSV_FIFO_SIZE 127*HDCP14_KSV_SIZE
>
> -static const bool hdcp_cmd_is_read[] = {
> +static const bool hdcp_cmd_is_read[HDCP_MESSAGE_ID_MAX] = {
>          [HDCP_MESSAGE_ID_READ_BKSV] = true,
>          [HDCP_MESSAGE_ID_READ_RI_R0] = true,
>          [HDCP_MESSAGE_ID_READ_PJ] = true,
> @@ -75,7 +75,7 @@ static const bool hdcp_cmd_is_read[] = {
>          [HDCP_MESSAGE_ID_WRITE_CONTENT_STREAM_TYPE] = false
>  };
>
> -static const uint8_t hdcp_i2c_offsets[] = {
> +static const uint8_t hdcp_i2c_offsets[HDCP_MESSAGE_ID_MAX] = {
>          [HDCP_MESSAGE_ID_READ_BKSV] = 0x0,
>          [HDCP_MESSAGE_ID_READ_RI_R0] = 0x8,
>          [HDCP_MESSAGE_ID_READ_PJ] = 0xA,
> @@ -106,7 +106,8 @@ static const uint8_t hdcp_i2c_offsets[] = {
>          [HDCP_MESSAGE_ID_WRITE_REPEATER_AUTH_SEND_ACK] = 0x60,
>          [HDCP_MESSAGE_ID_WRITE_REPEATER_AUTH_STREAM_MANAGE] = 0x60,
>          [HDCP_MESSAGE_ID_READ_REPEATER_AUTH_STREAM_READY] = 0x80,
> -       [HDCP_MESSAGE_ID_READ_RXSTATUS] = 0x70
> +       [HDCP_MESSAGE_ID_READ_RXSTATUS] = 0x70,
> +       [HDCP_MESSAGE_ID_WRITE_CONTENT_STREAM_TYPE] = 0x0,
>  };
>
>  struct protection_properties {
> @@ -184,7 +185,7 @@ static const struct protection_properties hdmi_14_protection = {
>          .process_transaction = hdmi_14_process_transaction
>  };
>
> -static const uint32_t hdcp_dpcd_addrs[] = {
> +static const uint32_t hdcp_dpcd_addrs[HDCP_MESSAGE_ID_MAX] = {
>          [HDCP_MESSAGE_ID_READ_BKSV] = 0x68000,
>          [HDCP_MESSAGE_ID_READ_RI_R0] = 0x68005,
>          [HDCP_MESSAGE_ID_READ_PJ] = 0xFFFFFFFF,
> --
> 2.30.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
