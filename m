Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0818014AB3A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 21:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4956EA3A;
	Mon, 27 Jan 2020 20:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6896EA3A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 20:42:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580157730; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2EI+f/oRnZvvny3CsdIHCj9B4pK5NA/3rDlv8CkcF0Y=;
 b=fnNMc6OrWnMwwS3q4jDjwB9mwFLKQbhFWwYQEOlOP0tx3L6Z+BRDW+uSg+knKiiXgiQ+Q+qy
 ykBaowElBm3nIDpmtvcJme3fg369lloqVcTlTT/+i6XGHLo1IMOnBDvfaIP5NHDq8Jqs4A0i
 TWzr8TlHVn1t1n4tpdrwup3Epio=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2f4b1c.7f9dd1b6a688-smtp-out-n01;
 Mon, 27 Jan 2020 20:42:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0DF2DC447A1; Mon, 27 Jan 2020 20:42:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E2B0C43383;
 Mon, 27 Jan 2020 20:42:03 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 27 Jan 2020 12:42:03 -0800
From: abhinavk@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm: Parse Colorimetry data block from EDID
In-Reply-To: <5e2f2fe9.1c69fb81.6d20f.a6b4@mx.google.com>
References: <1579819245-21913-1-git-send-email-abhinavk@codeaurora.org>
 <5e2f2fe9.1c69fb81.6d20f.a6b4@mx.google.com>
Message-ID: <875bf9de01b7cd0107aee6f70badcbc5@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: adelva@google.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm-owner@vger.kernel.org,
 seanpaul@chromium.org, aravindh@codeaurora.org,
 Uma Shankar <uma.shankar@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen

On 2020-01-27 10:46, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2020-01-23 14:40:45)
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 99769d6..148bfa4 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -4199,6 +4200,57 @@ static void 
>> fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
>>         mode->clock = clock;
>>  }
>> 
>> +static bool cea_db_is_hdmi_colorimetry_data_block(const u8 *db)
>> +{
>> +       if (cea_db_tag(db) != USE_EXTENDED_TAG)
>> +               return false;
>> +
>> +       if (db[1] != COLORIMETRY_DATA_BLOCK)
>> +               return false;
>> +
>> +       if (cea_db_payload_len(db) < 2)
>> +               return false;
>> +
>> +       return true;
>> +}
>> +
>> +static void
>> +drm_parse_colorimetry_data_block(struct drm_connector *connector, 
>> const u8 *db)
>> +{
>> +       struct drm_hdmi_info *info = &connector->display_info.hdmi;
>> +
>> +       /* As per CEA 861-G spec */
>> +       /* Byte 3 Bit 0: xvYCC_601 */
>> +       if (db[2] & BIT(0))
> 
> Why not use the defines added in drm_edid.h in this patch? Then the
> comments can be removed because the code would look like
> 
> 	if (db[2] & DRM_EDID_CLRMETRY_xvYCC_601)
[Abhinav] Sure, will make the change and upload a v2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
