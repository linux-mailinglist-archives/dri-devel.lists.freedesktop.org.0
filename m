Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5B41A791F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 13:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F7B6E086;
	Tue, 14 Apr 2020 11:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6148E6E086
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:08:54 +0000 (UTC)
IronPort-SDR: /c+kgJwOAd9CyM/0IptFrW8hLlSUv2NxtX2Kna6gDJeWKCGLTjUon4Z+Vh939ObgfnpdGVoU7r
 lQ8PfLw5Z6iw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 04:08:54 -0700
IronPort-SDR: L9wwlBfNleH1/PNFWLrfG8Jz/cNseahXJi07CLOpQvdthm6csrngaZnL+xYYyhWKxND8O6vUIl
 /JKfUAQ1HUJQ==
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; d="scan'208";a="427025903"
Received: from mdoerbec-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 04:08:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>,
 Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] drm/dp_mst: Fix drm_dp_mst_topology.c selftest
 compilation warning
In-Reply-To: <CADnq5_MD6LkOEJC-hKKQSAmFAHY7LMZ2WU_ER-ttNrP20AxoQA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200411141740.14584-1-tangbin@cmss.chinamobile.com>
 <CADnq5_MD6LkOEJC-hKKQSAmFAHY7LMZ2WU_ER-ttNrP20AxoQA@mail.gmail.com>
Date: Tue, 14 Apr 2020 14:08:48 +0300
Message-ID: <87imi2miin.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Apr 2020, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Mon, Apr 13, 2020 at 5:29 AM Tang Bin <tangbin@cmss.chinamobile.com> wrote:
>>
>> The struct drm_dp_desc contains struct drm_dp_dpcd_ident, and the struct
>> drm_dp_dpcd_ident contains the array, so zero-initialization requires a
>> more couple of braces. In the ARM compiler environment, the compile
>> warning pointing it out:
>>     drivers/gpu/drm/drm_dp_mst_topology.c: In function 'drm_dp_mst_dsc_aux_for_port':
>>     drivers/gpu/drm/drm_dp_mst_topology.c:5494:9: warning: missing braces around initializer [-Wmissing-braces]
>>       struct drm_dp_desc desc = { 0 };
>>
>
> This seems to vary based on compilers.  Maybe a memset would be better.

= {}; will do the trick.

BR,
Jani.


>
> Alex
>
>> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
>> Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
>> ---
>>  drivers/gpu/drm/drm_dp_mst_topology.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
>> index 70c4b7a..4d8d1fd 100644
>> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
>> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
>> @@ -5494,7 +5494,7 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
>>  {
>>         struct drm_dp_mst_port *immediate_upstream_port;
>>         struct drm_dp_mst_port *fec_port;
>> -       struct drm_dp_desc desc = { 0 };
>> +       struct drm_dp_desc desc = { { { 0 } } };
>>         u8 endpoint_fec;
>>         u8 endpoint_dsc;
>>
>> --
>> 2.7.4
>>
>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
