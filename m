Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 859377AE710
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 09:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A096E10E35E;
	Tue, 26 Sep 2023 07:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9356D10E35D;
 Tue, 26 Sep 2023 07:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695714268; x=1727250268;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FgG1KY5ZAcKGmpGkHLr3kBgobBPcTYLfeCJ7S7PzGhs=;
 b=AXFUHGX03K/pRipWtf7Iif3mEtLCO+cp0sJqDsdan/cjfb0J0Kj4zIpz
 J/WbCyamjCRfVA5J5wpAwOLZYSxCU9ISGj3v+gqiAgYxjcFvG638XQ4F/
 jakZJ2S2MyCXQ4Xjd1zPWplw2tmM93BbHSBXbxSpZi6am+y0Oy/ITzDeH
 bPIOwKIiNCulWDLBL+2XszcBOa09J5q1F6tsH598Zr07rnXXveZd1V96w
 dZtT7W1RKDcOyBLd296v9E3JR49wuL9m6SY98t+amaizs3YVBFJfWoLxf
 aFkJyoxbiRh4UHbF37+M1FXCyVfahkaYbT9Rin1++cVMUcz3d33Cnv08o A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="448006652"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="448006652"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 00:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="752066130"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="752066130"
Received: from wagnert-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 00:44:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 4/6] drm/edid: use a temp variable for sads to drop one
 level of dereferences
In-Reply-To: <IA1PR11MB63480D7CC408A0340BB2C777B2FCA@IA1PR11MB6348.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1694078430.git.jani.nikula@intel.com>
 <6692fbce07fbc03ad8785e6e6fe81fad4354e657.1694078430.git.jani.nikula@intel.com>
 <IA1PR11MB63480D7CC408A0340BB2C777B2FCA@IA1PR11MB6348.namprd11.prod.outlook.com>
Date: Tue, 26 Sep 2023 10:44:23 +0300
Message-ID: <871qelml9k.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Sep 2023, "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com> wrote:
> Hi Jani,
>
> added comments in-line.
>
>> -----Original Message-----
>> From: Nikula, Jani <jani.nikula@intel.com>
>> Sent: Thursday, September 7, 2023 2:58 PM
>> To: dri-devel@lists.freedesktop.org
>> Cc: intel-gfx@lists.freedesktop.org; Nikula, Jani <jani.nikula@intel.com>;
>> Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>
>> Subject: [PATCH 4/6] drm/edid: use a temp variable for sads to drop one level
>> of dereferences
>>
>> It's arguably easier on the eyes, and drops a set of parenthesis too.
>
> Please consider providing a bit more context in the commit message for better clarity.
>
>>
>> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 16 +++++++++-------
>>  1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c index
>> 2025970816c9..fcdc2c314cde 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -5583,7 +5583,7 @@ static void drm_edid_to_eld(struct drm_connector
>> *connector,  }
>>
>>  static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
>> -                         struct cea_sad **sads)
>> +                         struct cea_sad **psads)
>>  {
>>       const struct cea_db *db;
>>       struct cea_db_iter iter;
>> @@ -5592,19 +5592,21 @@ static int _drm_edid_to_sad(const struct
>> drm_edid *drm_edid,
>>       cea_db_iter_edid_begin(drm_edid, &iter);
>>       cea_db_iter_for_each(db, &iter) {
>>               if (cea_db_tag(db) == CTA_DB_AUDIO) {
>> +                     struct cea_sad *sads;
>>                       int j;
>>
>>                       count = cea_db_payload_len(db) / 3; /* SAD is 3B */
>> -                     *sads = kcalloc(count, sizeof(**sads), GFP_KERNEL);
>> -                     if (!*sads)
>> +                     sads = kcalloc(count, sizeof(*sads), GFP_KERNEL);
>> +                     *psads = sads;
>> +                     if (!sads)
>>                               return -ENOMEM;
>>                       for (j = 0; j < count; j++) {
>>                               const u8 *sad = &db->data[j * 3];
>>
>> -                             (*sads)[j].format = (sad[0] & 0x78) >> 3;
>> -                             (*sads)[j].channels = sad[0] & 0x7;
>> -                             (*sads)[j].freq = sad[1] & 0x7F;
>> -                             (*sads)[j].byte2 = sad[2];
>> +                             sads[j].format = (sad[0] & 0x78) >> 3;
>> +                             sads[j].channels = sad[0] & 0x7;
>> +                             sads[j].freq = sad[1] & 0x7F;
>> +                             sads[j].byte2 = sad[2];
>
> Thanks for the code update. I noticed the use of magic values in this section, which can make the code less clear
> and harder to maintain. Would it be possible to define constants or use descriptive names instead of these magic
> values?

Yes, but that would be for a separate patch. The magic values aren't
added here.

BR,
Jani.

>
> Regards,
> Mitul
>>                       }
>>                       break;
>>               }
>> --
>> 2.39.2
>

-- 
Jani Nikula, Intel
