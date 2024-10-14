Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3D399D7F6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 22:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CF110E4CC;
	Mon, 14 Oct 2024 20:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfW8pToC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BE110E4BE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 20:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728936765; x=1760472765;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=scWb2h0RHXn0che5028xR1ViVJmOlg2VjFhpNF2A3Lc=;
 b=gfW8pToCl1IPyegFPDwFsGD5cnF7t+7umxFczzJzQoG70B81JNevbHG+
 al8lowickA5hcRlTeNhxD5DDvnZpOp2OpPn+hFe44GaL1V5+O3atss+lR
 AQvlhX24AvfGa8GJeNKPvL1B/USP6k6RU9yrqFxUJ0C1f7wi/5GMFa8NH
 qgs9VBnSIIcItPZ2FsQuEDZPDMPVny2VZwAK9ti45Lzle8Ui+ksWnT5Yh
 RX2kQ0xeVKP3niVLlyz/3SXWmEGmkqYe1q16g7F/edoHakEDdD+d79/jr
 NcQfsfNW7STStAW0JfkZnRK3rfNGO8HTJbuAV2Qj29wof1Esm1kCYjcR3 g==;
X-CSE-ConnectionGUID: mWbjXIKtT/GxkCWtFHUq9A==
X-CSE-MsgGUID: 53f8hIjsTsSVxbN3poIl4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28257746"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28257746"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 13:12:44 -0700
X-CSE-ConnectionGUID: IrX2+oHsSfadbRUqMVgDkw==
X-CSE-MsgGUID: TpwnpirhRYGi8UQZy4kmoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="82297142"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 13:12:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 13:12:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 13:12:42 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 13:12:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGgPUc5M1uuC/DlSlnIzetxBAy4jiJNE9iflZlvugVgRfS6xapd8XgitA73Glc6uDz114GVscer1U2icRI9E8FaCMJdT6tfURcIZyInbk5050ZnQAD+CawlDZeax+tqWyRBznHIUbUN8noYb3y8yqBYZpGFEOhm/LFhxktYP3gFIPHYc8+MGhATt9emSs+OzEdvbAJ+uGX1Grv2uFzZv6gUjWtRzIu3sfbrObUhf8eVWVkMuGYu9im5NJKSUjdT+MpnB+EwirG7hBCz2jqNjJUHRkB7RjPxWd4WGoa3GW13IYNniykZpUiRo0uhvUrExew9iXmcQJzID0rbAJPCNjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHl61kP+53coDEScWTfFau9EBUvwztufvourbMoar8M=;
 b=A1tGeNuDpxZfRxzOvXrBdwb10QOddQPXl1yFTqVjZfuGg25OrD9RzySQcQGfpY6QNSv5oBJKMfOrwyVgtDqikFS2+8t2WbCyt2rI0Uv9pUzOeWXFjT9SbfoguU+5aaACpZD2TSc1IaEolL3CCjW2y+ueosPaEGudBpDHDIBoh+qWotR6sk0p4/+yJbu0tzH+YbDceZR20rk+gnDQ41CsjkQcIBN00Wa+AkFXtW0wqWuIrr4qWxMjOsk1gZXopWO9/qZwpWk01ZYRbHsvx+ROxjiGa6h3hpofQoW21zJ9QlHqY3RHpInYvJbTigaIaJKvlYIYwlM7pGVUHc2AszyF0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8064.namprd11.prod.outlook.com (2603:10b6:510:253::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Mon, 14 Oct
 2024 20:12:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 20:12:40 +0000
Date: Mon, 14 Oct 2024 15:12:36 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Ingo
 Molnar" <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>, Ian Rogers
 <irogers@google.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 3/5] perf: Add pmu get/put
Message-ID: <jrjfdolkg5rfw2xtngqt2bc6ugssxralaqw4q6gyijlkuhyecm@kvyb3fkwngrr>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
 <20241008183501.1354695-4-lucas.demarchi@intel.com>
 <20241014173246.GI16066@noisy.programming.kicks-ass.net>
 <lunkl4llip7aafnyctwztggum37wsiznktb7z3ly73batmt6bu@m75kow4b4u6y>
 <20241014192519.GN16066@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241014192519.GN16066@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: MW4PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:303:b7::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 0750a947-b90a-46d0-aded-08dcec8c8dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DTYjcJDycKpB9aXPHcNfsVPD777I2vYyWM1hhph4ZLItodSquWaUIuDoQpRQ?=
 =?us-ascii?Q?l6gVieR8iZOcA6BQP2s5YPf4pjGjB0Ua6Ud/dsca3C+MK+qDxtq0BvpAkntB?=
 =?us-ascii?Q?YPPad5ZL6DMy+k/zwxGCv1zKzfrxZL2zIdTGktDGJ4+zYEk4UcNUWXFHOalx?=
 =?us-ascii?Q?GpD28nXYqSZ196ZgABgYal4C5oUqXk6QwEX05+mjyyFxtirg/TTm9DuORvj8?=
 =?us-ascii?Q?f6gZDxZVRZgYY4hEm5rxx25xpe08E0ur+0wzCtw4qAm5+ZdUjh/O2M/1DNzf?=
 =?us-ascii?Q?47qwb/3ZcngADeAUsD+5nzJ7ZUVnuNwfcXHprgMfE+TG4vnnbXaWaThlceBX?=
 =?us-ascii?Q?Hc7xZ06Bui0WrrtnprHUBDuDmIC0i/Va3w2qCtQTFjpaBeBiWLHj6tgj/+GI?=
 =?us-ascii?Q?aWNTPfaxpov48mczv+uVttYozH5HurKRlJpYdHbveU0JHdCuC82XyIa899bg?=
 =?us-ascii?Q?OP9u0F+GRSvp3R5iJ6YiLV+GE6JZnb9JXn5TG405I5EuP0/gw+WnD69xLwqJ?=
 =?us-ascii?Q?ysPxWv7yF3iPC5VhegL5omYSgWybt7ibna8gYS5Q60LBTOfIAhuQTDrychHX?=
 =?us-ascii?Q?JgrItcDr6rRSyZV1CdpgfpBfK0yw3HVE1m0k/KGfcxzVbU/70vVPnU2T5XHr?=
 =?us-ascii?Q?wwiAkjXyl/TN5wn9IOT8DShR7FX/3nFHuEl6eXuUZ97FLIdtByOEucSQNWFw?=
 =?us-ascii?Q?7vVUcs1v0H1nvCuQhTnelm25fRftoeBMn+UnPRaqNIblLp2DMuzVhas6NA67?=
 =?us-ascii?Q?mw68+6d5KqLrepmo4PgqMSmwn4C1kK/HP9FDHn6rVkxvvNSXuNb64PKAgx7T?=
 =?us-ascii?Q?Xtvl9LtSR8TAPOdram0+LN5a14gcbv7h7ZdfriHGb1U/7hG2sCUmLwz8CIgy?=
 =?us-ascii?Q?5pHs3I2qzhHxQRkN7AChITnyyZgfBUQME5GudXvwqWK6GZSizAuTTH7aRI7f?=
 =?us-ascii?Q?I8OYVxfFvEWhHktePzje6U/IQ9bkkuJqaoKjYGJ7rq3frUnTCqjJtMipiFBR?=
 =?us-ascii?Q?Y+PbTpZu0zRPuUc5GSIfiO9bifeHTH6j1iVUXapYzWCM5VviqnIVoaVY+0ho?=
 =?us-ascii?Q?GgaszMYsyp/LIO7hMOOtsh/VscjusMPiN8M5WnNEt0suqmjdH1F29EUeIZo/?=
 =?us-ascii?Q?0cZK/BEKDAZfcvcx39MdhwiNxGp9g34MDlBCOtgvhMpfR9b81WP7PKgNStSF?=
 =?us-ascii?Q?aBFVDDyqehnsqBdOJAvdx1XSK1QZiEC5yC/HJXoXPDLyg7ffNWq9MfArAhzi?=
 =?us-ascii?Q?753EYvfhubkznrCDANbd3KmWTt12hkiWO40jZTRX/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4gScBC6Hp4NO76KvHoPm5PE5/V/mlKUqTY660UhaUzdSEifZ4cvUkzeNuQ3Q?=
 =?us-ascii?Q?/OYvfT+MeA+JxlgRKmttXTTgKia81NUMvSNXdtz7qiBOW5W41o/mEWxc3Hs7?=
 =?us-ascii?Q?YqxF5ahSI0P4B/tfeeyMXyrxk0PuC77fo/i1Gptb2dMfTNRAgzRMVtDuhYo4?=
 =?us-ascii?Q?eFE+BTpm974jk2G53VNoux1Cz0QdHPom2cc87rgtnPsL33ypFOZ9QkPlhkux?=
 =?us-ascii?Q?+eUihlK6QwyCJuCG9DIFETYER7w4zb7GQc+GMMVqZtaiEIOzNK6sFGAkXZka?=
 =?us-ascii?Q?27DtyTS8u1T1YbvhFruUS5EAYemw9Qthfn1Px9FH1Lhm1zN/PFNh42gXjU2x?=
 =?us-ascii?Q?OwefYT2XodKEgmtkRHN0TKXpEmqRKxZux37858GV/Je/TyUDkvtDOd1kOEVo?=
 =?us-ascii?Q?UxvEVxm9mrJVaBuKgZI6w+vYlEVHt1SFoxJ6KBWLrcA/CiT97UX0Ie8d/CVY?=
 =?us-ascii?Q?3lq2JEjjCS3B45A9cN9CZzVyaZPp69cDqGhy1JSHio/1aMwOvv4bvUwafKHW?=
 =?us-ascii?Q?f+WHmvRD/xMg846YoRzBgAY1FzCa+lb4Q8gFxuLUFGL1lYnN1KNprPhogsWR?=
 =?us-ascii?Q?W772FCmcp5EBTN/yw6DGHioSkz76LlQ0kpJhF1Mu4rD6JxyyzZW/rLG235c9?=
 =?us-ascii?Q?2MHN0vnbOp7CDFyOKoPReD3qQa8oxxPN2fGBMk6uSZW//rL6Om8GABqtzeXR?=
 =?us-ascii?Q?K4nvebj1ESkb8foZFGos7AGQaR29wFsb3QXUndQ8FmaEjLairZCdgTjCCuOb?=
 =?us-ascii?Q?fSKHBYge9HfzrWeusep9SoeD7C3Xq7MemAkM7lPexTGHp3KmCo9qQ2Is05fI?=
 =?us-ascii?Q?T0NLSN2GwADSjnBjkrTVXL8NxXB6v7NFrUHztMwhN8BkamOcbfWtUeUYb3yD?=
 =?us-ascii?Q?6dzSQAUP5jHyYhdDkn6gAX0UHLHm+OMxv4B69JlV9eLcHkw/JyR8vUBSawMi?=
 =?us-ascii?Q?m+w0Xfncl1/XZwLz3AzoWjj7oS96+wFyhaO967u7Lv408Nfni+57NNaLO4IY?=
 =?us-ascii?Q?9AGuP5OYMBsxREZ4AyFMp1/uWU5gZrC2qn6AwABLOiTxKUqwu+PLjvyPkhbX?=
 =?us-ascii?Q?kFg6II7m0wBJqQKMhV2Y5eWdDssvMDOmLBToD5Wg1lOlEdzYAPMlJuvrI2W0?=
 =?us-ascii?Q?Ux/y/CIU7KRg1SilGJvfS/NwPgqobL3NFOEWBO7jTpyR6PvifkAx5vuOQW2H?=
 =?us-ascii?Q?oR2HAydWZmB0+4kdJlocGJjGrTcOGNBkHz31iB4yVkM8u+tXiSm+etBTB+AS?=
 =?us-ascii?Q?Aa0thcWLKQD0MuJgpbUdD/7MACLrIRdfFsnLKFEzCx8CpJAPkgmEt4WgPGcj?=
 =?us-ascii?Q?Eo9ja9BsxDLT/7dSaec/x0ZTW4Ny9XIzc46j09XyNne5CEpE5kdvQo7NrxWT?=
 =?us-ascii?Q?CWAAYpRIOVjEHxa2iZduLlh1IC/QQfZ5vH59qA1QYwh8xPk6JsA94UJSrUaV?=
 =?us-ascii?Q?LGkbj46tWXado1aO/7n4FD2E8hMbWPgD0r/9V/sS4I2uVhshO6Wji81uVtva?=
 =?us-ascii?Q?vTHSNQxnUG7nFk1TZO9uJw5q959kjZOzd+XqYH6IUceXi9TMbaZ4COcpIVjB?=
 =?us-ascii?Q?nbbkP9Lzx/lkzgozWik+9B+2pYDCAvJiL0r6uXYG9tPHg2Oi1lfIwv1LY+6a?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0750a947-b90a-46d0-aded-08dcec8c8dc8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 20:12:40.0116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5QuEI/Ekz7C3RkuDu1z/ApE6/esa4ynlLw03NXntHtX2rxIsN9iTzCG7KjWnjFb8LuJ4ucnclUvXZakRmNh/B4HZ0ivhkA8k0bLiac4myE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8064
X-OriginatorOrg: intel.com
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

On Mon, Oct 14, 2024 at 09:25:19PM +0200, Peter Zijlstra wrote:
>On Mon, Oct 14, 2024 at 01:20:34PM -0500, Lucas De Marchi wrote:
>> On Mon, Oct 14, 2024 at 07:32:46PM +0200, Peter Zijlstra wrote:
>
>> > I'm confused.. probably because I still don't have any clue about
>> > drivers and the above isn't really telling me much either.
>> >
>> > I don't see how you get rid of the try_module_get() we do per event;
>> > without that you can't unload the module.
>>
>> I don't get rid of the try_module_get(). They serve diffeerent purposes.
>> Having a reference to the module prevents the _module_ going away (and
>> hence the function pointers we call into from perf). It doesn't prevent
>> the module unbinding from the HW.  A module may have N instances if it's
>> bound to N devices.
>>
>> This can be done today to unbind the HW (integrated graphics) from the
>> i915 module:
>>
>> 	# echo 0000:00:02.0 > /sys/bus/pci/drivers/i915/unbind
>>
>> The ref taken by these new get()/put() are related to preventing the
>> data going away - the driver can use that to take a ref on something
>> that will survive the unbind.
>
>OK, for some reason I thought to remember that you wanted to be able to
>unload the module too.

humn... maybe because in the first version we were talking about
shortcutting all the function calls. If made by the driver, it'd allow
to remove the ugly `if (pmu->closed)`, and if made by perf itself, it
would  allow to drop the module ref since we would guarantee we are not
calling into the module anymore.

But I think that's orthogonal to what we really care about: once the HW
vanishes underneath us, stop accessing it and unregister the PMU in a
way that if the HW shows up again we can still register it and nothing
explodes.

>
>> > And I don't see how you think it is safe to free a pmu while there are
>> > still events around.
>>
>> so, we don't actually free it - the pmu is unregistered but the
>> `struct pmu` and (possibly) its container are still around after unregister.
>> When the get/put are used, the driver can keep the data around, which is
>> then free'd when the last reference is put.
>
>Aaaaah, okay. So the implementation knows to nop out all device
>interaction when it gets unbound, but the events and pmu data stick
>around until they're naturally killed off?
>
>Ah, reading the below patches that is indeed what i915 does. pmu->closed
>makes this so.

yes. Without these patches it doesn't work well though, particuarly
because

a) even if we protected the methods with pmu->closed(), the data is
freed when we call perf_pmu_unregister(), making the whole pmu pointer
invalid
b) kernel/core/events.c still accesss the pmu after calling
event->destroy() - we can't really hook on that to destroy the pmu like
is done today.

>
>The dummy thing you posted in this thread, does perf_event_disable() on

that's optional and I think we could live without. The main issue is
completely crashing the kernel if we do:

	# perf stat -e i915/rc6-residency/ -I1000 &
	# echo 0000:00:02.0 > /sys/bus/pci/drivers/i915/unbind

... which these patches are fixing regardless of calling
perf_event_disable().

>all previously created events, and this is not sound. Userspace can do
>PERF_EVENT_IOC_ENABLE on them and then things will go side-ways fast.
>And I was afraid i915 was doing this same.

For the i915 series, that would be "[PATCH 8/8] drm/i915/pmu: Release
open events when unregistering". See release_active_events()

I was just wanting a smoke signal/hint for userspace that "something
went wrong" with this counter.

>
>> - Subject: [PATCH 3/8] drm/i915/pmu: Fix crash due to use-after-free
>
>So reading that Changelog, you would like a replacement for pmu->closed
>as well.
>
>I suppose, one way to go about doing this is to have
>perf_pmu_unregister() replace a bunch of methods. Notably you have
>pmu->closed in:
>
>  - event_init()
>  - read()
>  - start()
>  - stop()
>  - add()
>
>Having perf_pmu_unregister() overwrite those function pointers with
>something akin to your pmu->closed would go a long way, right? It would

it would help if we want to unload the module, to make it work for
other drivers without having to add similar flag and to make those
drivers less ugly with those checks. However grepping the
kernel for calls to perf_pmu_register(), it seems there are only 3
candidates, all in drm: i915, amdgpu and xe (the xe is a pending patch
series waiting on the resolution of this issue).  There is
drivers/powercap/intel_rapl_common.c with its `bool registered` flag,
but that is basically doing multiple register/unregister to replace the pmu
rather than working with HW that can be removed.

>require using READ_ONCE() for calling the methods, which would make
>things a little ugly :/
>
>But I also think we want to force all the events into STATE_ERROR, and

yeah...  When I was looking for the smoke signal I mentioned, I wanted
something to move the event into that state, but couldn't find one. The
best I found was to disable it.

>I'm not immediately sure how best to go about doing that. Adding better
>return value handling to ->add() is trivial enough, and perhaps calling
>perf_pmu_resched() is sufficient to cycle everything.
>
>Let me ponder that a little bit.

thanks for the help

Lucas De Marchi

>
