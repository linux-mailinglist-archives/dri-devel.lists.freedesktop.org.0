Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4F5516F19
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 13:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA60C10E995;
	Mon,  2 May 2022 11:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E3C10E995;
 Mon,  2 May 2022 11:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651492190; x=1683028190;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=ahcGSVFBbDw+47hsgxMhBh6EUdikBk/3EyASncuqTcM=;
 b=ZeL02RUfkdRg453mNO1Ax+mF5KlyugT4tnulyv3SEZaprwOHSLUh9Dz8
 5H9P+PR6TRvOE9gT9MP3e+bJX/RZpNVIvafuSVbheeqkcbfM9afpNn2P4
 lrU11Ifivz/0sKybKAPGYeoTltPchVZBLN2ERuHRFnKivlpT867M6STer
 WiSAjPcE9mhj/E2yP3FSseHREoFYokFFYiRNt0uInDM8uDn0mKtohgrhP
 BD5DXFlikpE5boC8YcIgRHcxJcm9lmOi7xMGjRJG7ity8QJ1ZnHYsmgkm
 5eZ9ezr6d2qKuh9ic4BRGQLJJWIb4b6b1Xw1oYi+1Zok0Cri7YAUuRY+S Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="266038786"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="266038786"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 04:49:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="583658713"
Received: from wagoleb-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.155.30])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 04:49:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [Intel-gfx] [V2 1/3] drm/debug: Expose connector's max
 supported bpc via debugfs
In-Reply-To: <DM6PR11MB31778E7D4B07EC0B429EA593BAFC9@DM6PR11MB3177.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
 <20220411095129.1652096-2-bhanuprakash.modem@intel.com>
 <DM6PR11MB31778E7D4B07EC0B429EA593BAFC9@DM6PR11MB3177.namprd11.prod.outlook.com>
Date: Mon, 02 May 2022 14:49:44 +0300
Message-ID: <877d74rw6f.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 Apr 2022, "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
>> +static int output_bpc_show(struct seq_file *m, void *data) {
>
> Can we have a meaningful name instead of 'm' ?
> Upon changing this parameter name, you can have my
> Reviewed-By: Arun R Murthy <arun.r.murthy@intel.com>

Please keep 'm'. It's by far the most common name for struct seq_file *
in the kernel:

$ git grep -o "struct seq_file \*[a-zA-Z0-9_]\+" | sed 's/^.*:struct seq_file \*//' | sort | uniq -c | sort -rn | head -5
   2212 m
   1219 seq
   1126 s
    135 sf
    121 file


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
