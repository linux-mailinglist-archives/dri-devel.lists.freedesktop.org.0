Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C29E3B0AAFC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 22:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDA010EA3F;
	Fri, 18 Jul 2025 20:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jngbgT31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C28A10EA3D;
 Fri, 18 Jul 2025 20:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752869485; x=1784405485;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oBjfSivY+wd8TS+64sFHchErxydnlcNAVJCadPleds4=;
 b=jngbgT31Ng1/rFqeQ/I9OlfV8ACXFWDWDdy2XM0IiBl+yMA4Pd5tdERh
 XIG7ie/vZN40RVNjL+DVdh+mp+g3Oc6zFbV9P2yeFuggTQRwvxYEVB0rJ
 urCFf82IUxaBTpon5viwA2oP6qTxtbvnVL9VhUD5sknGsdrXUkSnXB3R7
 1PNgfdCRvbTeLAwrc02gkksLD/bfaj36pqhsBIR8T34f2V1hmAw7IUk1o
 cu6T/MHScGE/VBD1SgIJ9bO4NBf7fLQfzE2WMQYEpgB3dKk67WaexWQTT
 jPA9pzxg3WfmaD/Kxgm15n8noBLKzRShoaNYV58Vx9kNViC0vYcmPvAxf w==;
X-CSE-ConnectionGUID: WxsPK+RTRPCkOH3FeFF2IQ==
X-CSE-MsgGUID: yMO/lvPcRLeJMdNMiOE0YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54274002"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="54274002"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 13:11:25 -0700
X-CSE-ConnectionGUID: 8Ii+WhHtTjeqCN3FpIVtRw==
X-CSE-MsgGUID: VWnOk87IQKe4JGcV2hX5Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="162433748"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 13:11:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 13:11:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 13:11:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 13:11:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJnqu6z0CsuBiavmdDeJtf8X9M/nbHLEPx+h3GsCpuZq4rII8Q5d5qiAX467Oie0Thq/k9zfr48Kt7nFw/nlDW6rP1u+4wkWrUhy/jLRqV0En8LzPi+2m5uU2rXHNn/fksMHNK/BJDzz7tpBfDX1vZceW2WEoevHFcBXDvX2Fc+2v/dqwYvZWGDY+D6dJlslndqjLL+G5amYcR7dG770rr3yO4de1DPCcKhRMTN4DHeNpKqkjpF+C2/l1W1jOKjw/LQSqjiRSB8WObqcv0f841TGEB2/bhcCM5M+t+Gan3YZYAKJBNpkCNSLWeyLoTbmNPIYIzuhiMP0ZDfLOwXbFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MangcARDEPlLMW4HBDr1wizLYY6JT+cFbvFaDJidpg=;
 b=vePx5Dt7uDYLHBPiPZKzT/qvn8PIbDA3IUTb3M0cGzn33rKDDnnBto6Y9zE/Xu8TflKoSpUPPlFLxCwla6NIxb66zx1bh1V3uVwhcS6gtiKlMhfLbuGSBKVEllPBRCt42sg4oaed/KgI3K12Ney7zkMr21+DB8nRSpGI6lYnXVjTuwjyWLL9A8rGOfRsE92OPKXhQ4H4r9P2LQEkNqISPvftjgHCM0+lxisWM7ktkYZ7EOOFjYCmre0smVq1WGZtVxsTT69gM6+GNVgwK/8AdraSoAs7MEmLcrSgqP9F5udVLXRk0SOc2s8Jwv730cSl89BxXSGuI715AptQKU454g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BY1PR11MB8031.namprd11.prod.outlook.com (2603:10b6:a03:529::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 20:10:54 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 20:10:54 +0000
Date: Fri, 18 Jul 2025 16:10:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
CC: <airlied@gmail.com>, <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <mairacanal@riseup.net>
Subject: Re: [PATCH] [PATCH v2] drm/i915: move struct_mutex from drm_device
 to drm_i915_private
Message-ID: <aHqqSpWk71VTKi5u@intel.com>
References: <20250718163413.291909-1-luiz.mello@estudante.ufscar.br>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250718163413.291909-1-luiz.mello@estudante.ufscar.br>
X-ClientProxiedBy: SJ0PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BY1PR11MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: adfb69af-cd5a-4130-e2dd-08ddc6373331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JEb/YsHFsqqEz2s0vYTuINM1YEeLSfIIjIz7TeW3z2EjNodOHEhFT3P0MNwj?=
 =?us-ascii?Q?dmMs6RdyKDFZXQn9cJ7L5f73s+k4AeutYfVP+InlsrhZbHkwnh2YD8C5mGBO?=
 =?us-ascii?Q?SlyJK9Aj3o1u9GssHvq66Q8ZTLod8ByVpsglKpdgPH7SuO3KahHa22SN+Nvj?=
 =?us-ascii?Q?LWYE8ftMn5jd8aadl/3gS78Ne+IyLV5fiUsejVVtQO9TtLb9LGE3Lssvj2As?=
 =?us-ascii?Q?NAzJfcxLTaku78kn+hfby2/TNUZ5XCupqsF1CupS45B3+1FukWZgHjW/nxbL?=
 =?us-ascii?Q?cohZT8VOlkF7awtEv89Zfp5oop0drdGcOOs9D/EGiFeS3qE7qyBhlmLoEFVO?=
 =?us-ascii?Q?9LMo4wsmlrs3DK6kYYtqtU1q4nzE52ZpGuHblxvCMi4N4PvwJFj3Xx//SjgL?=
 =?us-ascii?Q?6yOUgRTY/GJ9CgF+parMGOgGjCSf2aS5hkvYmat/1xOqwNcYuJI1sB5lzNUk?=
 =?us-ascii?Q?Uuot3zSJ10uHtdZRUn/G3jganNPD/KQG5lEGgIjGUD/MJnamjEePt57aRnAl?=
 =?us-ascii?Q?IxTkQTRYyzJioALumSHhNfXuDe4MqyTWS9fccBlT+asM0Su4Rea4nignjtNY?=
 =?us-ascii?Q?NwiZozz765nD5I0my3fkbVTQAtR87OSrL1GDcfxHtcE9MqB1eI2NefmVuUo/?=
 =?us-ascii?Q?26rPD1bzpf4c/t/g9poKqaGlwNrk3/WfH3YdnZT17gONi42yqAtPkaaGqKEw?=
 =?us-ascii?Q?62dbh4SLDrQzsPccTxxL+T33CQDGxZIWY0RMZcRkjd5zSYhdCqDCHmGwAnCl?=
 =?us-ascii?Q?pVqHaFH4bdWeoI7oiFjIHxkU8pcfanQaEQaBVd6+lJdvwvVDXNP1+Oo+WwM+?=
 =?us-ascii?Q?lrDrSlvq6DW32L9PG6zr+bV3xJAtAKOxZ4clF8r9ghKEEUEGcAuzyKEh2Zjx?=
 =?us-ascii?Q?Ow7eKumco+mGle6x6kz+jwdl6/Qb5tXNmfJry92KOe8G/tq2qfoljSbSBDQR?=
 =?us-ascii?Q?5qMithioH8E+RO0i6eGoi0/J3VVZOawCfhG5DwKNC02kSfy/nZYvURO7DEEk?=
 =?us-ascii?Q?qqZYDe7AitHs7qP4XUgXAkOANa/hl4cSY1Rq73BlvmHd5an05SuoLjL3Xb/m?=
 =?us-ascii?Q?e0kh+DikTlULtC40ibx9SIX/nmx90mISbJnzA1l/LnH8ggmsICia6uZTERsw?=
 =?us-ascii?Q?3LiQx8m2+Eps1RieEBYZnRFzpeKS7uzXfiRDZXDkwv+7CNh7QYAvNjGVw/pz?=
 =?us-ascii?Q?Fhhg2my6Ok97sRfV9cmoOZmjBMWnTo1VQCgEBZcLZz/UO6iP/psH1W9k5edL?=
 =?us-ascii?Q?o6vsUeT2zOw1TucMS3MaxDfowX1KR98jLprUACalmUZGKIgwlL13qEjooybe?=
 =?us-ascii?Q?2NJCfzkqDUqb2bN3q1AOsQlvek2BhkSl+Upn4qor0/aHhbRtvGZY1EWWePmE?=
 =?us-ascii?Q?QEgttPTKvREuJMj4n6b4gt1mKD4wbpA2C5ed++lHOkW4M/flMad+XqCb/rTE?=
 =?us-ascii?Q?espKbNU9OyA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jruw93uc9uV5Bs7tlbqtFcxq9xrAG893jFTK3Ye6lMqHONvNkLa9k8imeqDc?=
 =?us-ascii?Q?l+hRI5LqAI0KJlVZ6FrivmY5C+POQyDRaOhv9gmtxHy9eIw9GxzYG3Jfcu7M?=
 =?us-ascii?Q?rozh7fMeIuMwyyfXjWEwclOE1zF78THG+5FIJxszZ5YBqJz/HyNuWym7eauB?=
 =?us-ascii?Q?FN1O6VYlKG8gABL+4VVtTLfTZE9Q7ABCyz+TMHGKLLbahf1aALi85SzCV1LI?=
 =?us-ascii?Q?RC2VKvxzrshKW6oGWKZ+yE1tTP4MKNqYszVc6/kBb7BE9qEU/mU0BVPQ1R1I?=
 =?us-ascii?Q?H5y9KE4GBoVxuaWIyZv92jIDSOE8ozrB+MbpfTRUekoi/MrZ2KIPDlswjPAB?=
 =?us-ascii?Q?rZ5kept8Q0EK3R898cdcxtWcRv+/W53V9BsYIFENTW2kZNoXw41SgeszTZ9n?=
 =?us-ascii?Q?q5qPF4IAAYQxK6Fr4njlJMjpeZ7VmXxxTlWf4WzodeeufGBaXWk/dXaxdmJs?=
 =?us-ascii?Q?QZSuNxmNK0JvnX9FnydUwKY0Ud4CxllrIj7lvQ9hRJLzyqXwK5p8vkhkJFbx?=
 =?us-ascii?Q?j0DWVYLX8mlS62v3PgF2dlng3L5/F23yhdgeg4qPY6g35JTvyH0EFe1BYSSx?=
 =?us-ascii?Q?PlH3Xkh3BViF+xzqP/OJzpTOz1FvCpea0psHyITR2EeH9el02R8fd4tq3SSk?=
 =?us-ascii?Q?tqcjQ7Y+mf5DGodXLj82hb9IJeq2SsD2qMDkm5uAIoSt6REm14NGTgKwOWPl?=
 =?us-ascii?Q?XB4VyLMbQIvsTN2LiaMfa/4WohqdHz9mt63G7qN2fFtyXG9YTKfj8fLhzTiG?=
 =?us-ascii?Q?u7q5Fw2jEW0kscEHzmkfxgUAUzquY8h2E461RXo3o1xwt9J0PkHgS0oI5Nwf?=
 =?us-ascii?Q?qFb1lcpOjmwsudm/++qGgVrDIMgtmAwbPxiRk3gToFu5djdhhi+HR0FPeiPX?=
 =?us-ascii?Q?fI2FkwzPhkkG+TwVWhbDXkjKny2MSw3Q5oOluyUk+iehdFeGeTuiVjB1UEc0?=
 =?us-ascii?Q?kcTwCk5v/s6A/ZmHeVCgSQGC/eZKgyzFCWcFW6hDTPvLGwz3g+mz/KG6Geii?=
 =?us-ascii?Q?zE+NiY0+WbzcDHhS53TYQg6CZBqr78P3ce5gM+p3ORN+GrFGd6rFMHILgSqt?=
 =?us-ascii?Q?bG6kGQLnz6mxzBCUOFtC9YvyWcoMKr69APcqyuXGpaZNmSiNpGw6tRhPR9u/?=
 =?us-ascii?Q?UfH3onw8H5U71grlA6GEH8G5XckMoipO2PbyX6BF9cgsq5acw+usPlnzFEWE?=
 =?us-ascii?Q?qgY6H5EMvzRzUSUwGINJx/WVCq1Bdzi2puqkRfTH4JXxjnO/n6ArqVWhoX+l?=
 =?us-ascii?Q?3VowLZT9sFSy6ypEP7XmCtEFAHOaUf1c4aNtdAiIXJZ1/xF5jypcsgbHY3F4?=
 =?us-ascii?Q?25Xhs58+7UNf34seOkd9MlerzUHtJ/p12Zdarwx5QVmItcU8UTtKa9NtOZQz?=
 =?us-ascii?Q?8371W47iD1+ZRXfZgTbcwIvqyu7UsKQ8/n6FelF9OShdpULjUZ5sxpFhjSAT?=
 =?us-ascii?Q?Ow28ipPeqJ06HcTJLXBjg9Q8XH4WEghHnJ7DFxmzVMi8aq75A7RywsJQailj?=
 =?us-ascii?Q?95FyoSrOGfzaeMBKQQkvoLd8gO06/9EFuzi0lnFuo7TVJixZ/LwBCmNpnNKg?=
 =?us-ascii?Q?biJlS3RLJLiLbjC1nr0vN3GXBEB1L8+bSGdr9lwD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adfb69af-cd5a-4130-e2dd-08ddc6373331
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 20:10:54.4370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5sLb7tcoSfJFor6qWIcVqRnwG4M7tGeIK39W7oFtgr2X7cALw2eFDl7ljGcYXjMdF1nyhRJrc+uEHg5giKiKEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8031
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

On Fri, Jul 18, 2025 at 01:34:13PM -0300, Luiz Otavio Mello wrote:

Oi Luiz! :)

First of all thank you so much for the patch. A few comments below:

> Includes the missing file drm_device.h, which was unintentionally
> omitted in v1.

This version comment should be below, not in the beginning of the
commit message.

Most of Linux subsystems prefers version mentions to added to a place
that doesn't even appears in the merged commit later.
for that you git --format-patch
then open the file and add the revision mention below the '---' that
goes below the sign-off block.

Here in drm we are fine with the version history in the commit message
itself, but it needs to be below. between the commit message and your
sign-off.

> 
> i915 is the only remaining user of struct_mutex lock.
> 
> Move it from drm_device to drm_i915_private so it is only used within
> the i915 driver.
> 
> Also update intel_guc_log.c to use the new location of struct_mutex.


something like this and here:

v2: Includes the missing file drm_device.h, which was unintentionally
    omitted in v1.

> 
> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>

Cc: John Harrison <John.C.Harrison@Intel.com>

Let me also cc John here since this is locking thing around GuC...
more below...

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  4 ++--
>  drivers/gpu/drm/i915/i915_drv.h            |  8 ++++++++
>  include/drm/drm_device.h                   | 10 ----------
>  3 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index e8a04e476c57..7135fdb0ebb4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -678,7 +678,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>  	if (level < GUC_LOG_LEVEL_DISABLED || level > GUC_LOG_LEVEL_MAX)
>  		return -EINVAL;
>  
> -	mutex_lock(&i915->drm.struct_mutex);
> +	mutex_lock(&i915->struct_mutex);
>  
>  	if (log->level == level)

it looks to me that this lock here is trying to protect the log->level
against races on the unlikely event of multiple callers.

so, to me the best place to have this locker is inside struct intel_guc_log.

>  		goto out_unlock;
> @@ -696,7 +696,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>  	log->level = level;
>  
>  out_unlock:
> -	mutex_unlock(&i915->drm.struct_mutex);
> +	mutex_unlock(&i915->struct_mutex);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index d0e1980dcba2..c585569b6036 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -224,6 +224,14 @@ struct drm_i915_private {
>  
>  	bool irqs_enabled;
>  
> +	/*
> +	 * Currently, struct_mutex is only used by the i915 driver as a replacement
> +	 * for BLK. 
> +	 * 
> +	 * For this reason, it is no longer part of struct drm_device.
> +	*/
> +	struct mutex struct_mutex;
> +
>  	/* LPT/WPT IOSF sideband protection */
>  	struct mutex sbi_lock;
>  
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index e2f894f1b90a..c374c58fb975 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -177,16 +177,6 @@ struct drm_device {
>  	/** @unique: Unique name of the device */
>  	char *unique;
>  
> -	/**
> -	 * @struct_mutex:
> -	 *
> -	 * Lock for others (not &drm_minor.master and &drm_file.is_master)
> -	 *
> -	 * TODO: This lock used to be the BKL of the DRM subsystem. Move the
> -	 *       lock into i915, which is the only remaining user.
> -	 */

not so fast! :)
You also need to remove the other user:

drivers/gpu/drm/i915/i915_irq.c:        mutex_lock(&dev_priv->drm.struct_mutex);
drivers/gpu/drm/i915/i915_irq.c:        mutex_unlock(&dev_priv->drm.struct_mutex);

Honestly, for this one here I would go with a separate patch that simply removes
this at all. I don't see that protecting anything.

But if someone insists we need to keep that, then we need to create a new specific
lock likely:

dev_priv->l3_parity.lock

But again, I fail to see why we would need that... we are in a work queue that
is not going to be paralelized with itself.

> -	struct mutex struct_mutex;
> -
>  	/**
>  	 * @master_mutex:
>  	 *
> -- 
> 2.50.1
> 

And this is not all, you also need to remove the init and destroy for the old one
and create new init and destroy for the new one... or use the drm managed locks
instead.

Also, please take a look to all code comments mentioning struct_mutex. Those
probably deserves some clean-up as well.

I'd say that this is a series of patches:

patch 1 - Remove struct_mutex usage in the l3parity wq
patch 2 - Create a specific guc log level lock
patch 3 - Clean up on struct_mutex outdated comments
patch 4 - Kill drm.struct_mutex for good

or something like that.

Obrigado,
Rodrigo.
