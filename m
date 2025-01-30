Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8B6A231C2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 17:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F92F10E9AF;
	Thu, 30 Jan 2025 16:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDGQZ0aG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630B010E9AE;
 Thu, 30 Jan 2025 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738254474; x=1769790474;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=baD0DH3QLEjChKFvl5P2l4KlwX0KdoFdeWWeLGuPVDg=;
 b=eDGQZ0aGg4GGq4vEdMUvfNLOQzUezunxzVRmDoW8gRp7vvlAKdyJi8Vq
 C00Syz7xvU7wpOB/UcFnmJOlIRf/lfpOB8y3skvoi4i/FNya9sHsC9p70
 NK2Sze62ZPniFyG45ua0b7J4qAgTnrNOCj70+bgZ1ibJdzJ4fRbv5HHki
 qjOl3dq3Kxxr5/F4HiUPaxxfiwNwGQlPg0TSOKdBHJS6jnupS4/z5tkx7
 JW9jjQSS6NYMkNdIuZaCLoPfXsLXyIcyzOGNmOvsmmyKcpWqOXzDhXNd9
 HIYmxhsBOtgLpTUM/lyKFV6U7gO1cEtAWF9nHEfkbNhHrhU2HN/JJjkmN w==;
X-CSE-ConnectionGUID: C2bQ/yUgSX2P8hjEe6QQ5w==
X-CSE-MsgGUID: LRt02xs4Q8i32b5Zx0IDXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="26412362"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="26412362"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 08:27:53 -0800
X-CSE-ConnectionGUID: fP4PBXBrQymWMcNj42xqXQ==
X-CSE-MsgGUID: J93op8lUSA2Lsbw/WVTPGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114526537"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 08:27:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 08:27:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 08:27:52 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 08:27:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GM/8TXel/30rouYWBv/YaKlpVlmLmOQ2tqMWWz4Nb4UV22nXRLK+UGkWaYVtuHUBrxXQCTUzIVWcgM+34T9YiHQfKwbwC0RAihhxxNlQOnMc7LalPayYtz5+UeUM4jISnEAovqMI8rPcb9JIbXG1D/NAO/kqEqK3XqqsImjFJmx8eZYEovtJWjUurTWA+boDjcbvY6CwpU/WC+mXK3v1aVpro33ayVj/jPL0/jXLvJggBBxz6A6ZoYFYTuJiq9BmJWmqfsHihy8F9ezVLA+jecJ8dpb1Nti2xkM7Ps4Rw84aver3eY1EuDadfdhK5ZV2mTy+rZwNh/OzkzI6RaCsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Il3aDomzr/jGHIQNCKCczHY4juXGSPclIIvzjhaAJ+o=;
 b=SXJJYjV3JMuqV3DpNjbulIfzAz9AHKHKKoTGEsBdWnjceOeKaYeCw3wCzHSPBjbxUOYlsFe2ixrE4VHkiFFjafV9szxTB5x9/NNZanL9xc6fvevA7LCe4eKkDQP0934wLGqsr8fM2QzT67FZJHBN4/0hykbmUd7BU2HK0gVgbGiSBBdzZ02DHvihQGtM1DpHfovGGG411NIDxqNJPMizJf27M7wPoW67EhBVTqRFpt0paMlyzVhq7xl2I+mje6Nync1+XIe+bpHJE4popTCIqycbekoeIH5SoxR5uqx4noOTmzf8JChRRZFH2BERXYOED1PE+/tTPPEn/p9r4yLU0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7482.namprd11.prod.outlook.com (2603:10b6:8:14a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 16:27:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 16:27:35 +0000
Date: Thu, 30 Jan 2025 08:28:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 11/33] drm/xe: Nuke VM's mapping upon close
Message-ID: <Z5uor4+gs/yQoDzc@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-12-matthew.brost@intel.com>
 <3b539bf7-0294-45ef-9a1d-289b4932a1dc@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3b539bf7-0294-45ef-9a1d-289b4932a1dc@intel.com>
X-ClientProxiedBy: MW4PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:303:b5::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: a1580bd6-c5f5-4e47-2617-08dd414b00ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MU/LugqIPOQezjkjPaZHUopO09z6awQDK6TmHlX+QlhfpSfKiq4Dh2HrNoPs?=
 =?us-ascii?Q?4m3AYt9JR/+8mG5WOEhwN7OkMEHCtpiOyijqwIsaYj3F6XO6BB3PfoqlEmic?=
 =?us-ascii?Q?nivBjZdZjUeMUQYTypJEy7rzY6Hn46yFym1sm5IAk1OlAJUHaWK4Qx2IqgaS?=
 =?us-ascii?Q?somDFPayfUQKrQ194VyWF5/iVGpumxMKJZSslpPxymX4HKimyE+T2NGgkzNL?=
 =?us-ascii?Q?p4MkJz9N6rdRB8WE1DbE0mU+owKfo6mhEjN/J+dLSiyZxDQA6f7Y9LCrpvDy?=
 =?us-ascii?Q?DQPuUanFPIlkUqYOiINfrht2bOElzwHfDHHuzcbkoACS7/K3e7TqVdlp0BT8?=
 =?us-ascii?Q?yZi4/xHz3ItqOcqrcaKZDoKXgzptnz+/iHMoTECtfJQq9zw6MtIXVj+GUISL?=
 =?us-ascii?Q?dTfcT/MpqnqeZkKoCxuzp5YFENVSHxbBwJ7JF2oFWiQOms8GoZqfD7mNMCcx?=
 =?us-ascii?Q?omGIF2752ajAjWjfA9fnwk2xeTARF5SPAxiZYdK8MegH0nhqKm4JRKbcsKJg?=
 =?us-ascii?Q?v4vOdzdXeZu3LkJ9Dg37OjSV7J4mr4UKslKzyKPOB/0qkp33ynkahe5Z8gX7?=
 =?us-ascii?Q?7UJJc+Fp7LayNA5bpwEAJ4J21Efcd3f1Ct/BqY3NEjjjqsfC/e3Aca5gUqDx?=
 =?us-ascii?Q?JG9fBfPt6Kqx0mJp6tkjnEd+CLDMkVNh4TRW266QZp9SjtcORSpriy4vkXnf?=
 =?us-ascii?Q?aZKujabHc9KiUWcv7lOVFJdLweDGiRfbonctYwmExj1abdsJvIXtGuslAJQI?=
 =?us-ascii?Q?Wo7nsXbvhYHjsXHhelLhvemzM4a1Bc01HLfVHIjUyHIsiQBiShHWYuZDuXwh?=
 =?us-ascii?Q?mdoq5pmyyQgqZIduXRd9WU0VjKLVIbKDqmqtclrIwiXJ8euzhp1NPdVNo997?=
 =?us-ascii?Q?VecAfgTrFV4bi6ynbZGMJsO+dBJPJZd25gIF/ZIGKYSYSSViiUyVBI2ildW9?=
 =?us-ascii?Q?tEMevg4pQEi1LnlVNH37GJ3c9OmghkEd2x2Qq4OWQf9k+/QR9XzBW7/N9Ccg?=
 =?us-ascii?Q?ZR1hd93669pqzA18o7nBeoNbv93lPWXd314o1j+MCWCpmiZK6zfYAC79zPS0?=
 =?us-ascii?Q?dTsP/qWAfjEgQ/qp0jcUnYy5lv2YBMp6YWVDEa3sLZzunHR9hnrIj1K6hJGc?=
 =?us-ascii?Q?cRsqAJuUKwuzunecksY1PVnbxV444hINo8oeKUjxvFrQJZPWnr4fQoLHsJQK?=
 =?us-ascii?Q?IAwfrWyl1jeNDYWxPpLkPo4XL9DfQm3cceu3yv+I8RaxC3zS8Dp5bWEi3YyQ?=
 =?us-ascii?Q?TUm7qfQ/KlxMm9fZB5f/JJqiFQ56csqsgbZRjD4rhNo/Usji5eirOOBzuZ4D?=
 =?us-ascii?Q?CwMx4YlRJNCn8ER1scNuHa0YgIrF8aJ5JDZbWLJfYMEKJEtRyvWbbLlDoOVx?=
 =?us-ascii?Q?wktAa3GPj8L89h0FIZWWpZ08C9q2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FlB/gya8EDX/5ekix8t9N1tiB2tF9kxkElP9I2Ct+mD3wAGrmLs1uhRFP1+a?=
 =?us-ascii?Q?nVnhYU9pTMxY08tIBlcZdVNipv88xz50Y1oe9tZkVaSA/d8iSfe/yKxxih2B?=
 =?us-ascii?Q?wfDNUQ7Ol2WvTyDjwt1H1orOe0kP7RSAjjx9uBqd1temmRXBc6Y9Qq8v768r?=
 =?us-ascii?Q?yIqy8itgq6H1U00iWdRmJGlxQWHQLTSWQU1ksIge5dBUw+Wp7iuW2SlM1E0Y?=
 =?us-ascii?Q?VZ6lMKFPNvzT1xyz3ooNQBuXT+j4xETVQWZrIIn3xS+FR4+tu7deesUi2fO+?=
 =?us-ascii?Q?n/w2CAoN+U1xFqD2GLIH2+97rCmTI4vbO5WVz4u9/QOfT5yVTzk6+Ts7vz9t?=
 =?us-ascii?Q?z/LV1gDjlF2Mx7XEs/KILeLwK6VONbmYAmuevf6qof03OgvxaAnzPCkWZe1q?=
 =?us-ascii?Q?4AmvficZc6Jl6dsFDNi/XCQSYJoxRGBi9It5EnpowtT6xFmwp/pcPDSVA6MH?=
 =?us-ascii?Q?Ro/WUK7fqs0LF/l44WoRqiB2uOdZn5JBJc1gtZsH+JUiWu5N4VftXI+ZR/0E?=
 =?us-ascii?Q?gOEZz+0e4u7mOq3GPwJflYjfx5t/7malyTuQpYX+zdB/QbeNQUtMCq4yYlou?=
 =?us-ascii?Q?EEBDKBaQnUn7uCaEOxvh2bR1u05rT+/PYexba577y+mdzZUL9wZTheIHkL4S?=
 =?us-ascii?Q?PUuH20rCSOwp3yfvS3Zv0qfybxg+99BhCQ1Q/coCywlajauYgPaVPWT/qUNf?=
 =?us-ascii?Q?7YY47ClKck5OQ1eoJH5kKhyZc/g5Ht1P0OAXLSohPJIIeiVxz8Ufh6/7R+zE?=
 =?us-ascii?Q?bPwHYG37YzyCujjnewjgCfv0SnLpfxDubwWuwPvFFBmnOAX+dy18cg3Sv6HF?=
 =?us-ascii?Q?kBiy/ngWap546+OPab/fo6gvNZTPzeChdUUzYlw0Qm7GdZUcPHzl6nFj7C1v?=
 =?us-ascii?Q?Y1ZTTkRY8KDnqVY7OBmUIQnF55+gfqmpeC41rxW+3/t9S+9iCUEh2kh2WmdY?=
 =?us-ascii?Q?9S8LxN78pU2jBtQD8paMB3xTn2EppuiwkXWqIvdOHoqNNuIu0nkjnHZ6ZR6R?=
 =?us-ascii?Q?StHNUCtOk3VL3P9zmDmGPlQ7P1SWU0SLzI+OsRgTZM4O0kBPh//h47Xc8I/b?=
 =?us-ascii?Q?cmDuSQjer7/PeW4Lasf/Lkc3qAdNcX50ngl6eREynujvegA3H1sz5AnE/x80?=
 =?us-ascii?Q?yUk5n9fqOKdE09NC1BrMp4p8Cm5lGU+EeA/st1qwXmxoHgEpbzxKJC5Sm6iH?=
 =?us-ascii?Q?nNCOokTVG30f3UEiBDxyBmZntrd+6pxCTnx9ByiT+p2Otf1jtXwYA5XF3qrD?=
 =?us-ascii?Q?3+VN3gPmS72a31piTOHuZOw1KA9KnaS8LM5Pzqy8AB/vorI5vOqv0IhNA41I?=
 =?us-ascii?Q?gfmRpDWR22kCGuOhpEovjeBpCyOwlZ5zVUwjX+GAuBEOt/Q5YoPb+grk628A?=
 =?us-ascii?Q?My1yPh9FYbYaSlAWchNLmGaakVKLX8bLdMXk5umlYO3/3EHUkS5q0KwjOx2y?=
 =?us-ascii?Q?ws4tGct9gQ1EOMqMaR29IzXzAM6PQRi0FELjE2yQqSr+hqEWRUOG0oRFzhJM?=
 =?us-ascii?Q?gA3+zZ1DHQ+WFPZG7Oli+xyCVbgx9UUgCU0sFMhOfhTxkUWF4FPpMsHP4wBf?=
 =?us-ascii?Q?MqTN+txLKacMeL/8Br3DDJ93t3Gwlpatd7c4i2XGO290O/CwFxiJDhzyzblI?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1580bd6-c5f5-4e47-2617-08dd414b00ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 16:27:35.2569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lsLbG7YqHk+je69NACAA8Kf5iLY5HWDf8EKfcZL72CRTaJZf9KJlJs2l/RLmBCPeeFWowKJ6qKSV5wvgl5Kew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7482
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

On Thu, Jan 30, 2025 at 10:50:49AM +0000, Matthew Auld wrote:
> On 29/01/2025 19:51, Matthew Brost wrote:
> > Clear root PT entry and invalidate entire VM's address space when
> > closing the VM. Will prevent the GPU from accessing any of the VM's
> > memory after closing.
> > 
> > v2:
> >   - s/vma/vm in kernel doc (CI)
> >   - Don't nuke migration VM as this occur at driver unload (CI)
> > v3:
> >   - Rebase and pull into SVM series (Thomas)
> >   - Wait for pending binds (Thomas)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 24 +++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 ++
> >   drivers/gpu/drm/xe/xe_pt.c                  | 14 ++++++++++++
> >   drivers/gpu/drm/xe/xe_pt.h                  |  3 +++
> >   drivers/gpu/drm/xe/xe_vm.c                  | 22 +++++++++++++++++++
> >   5 files changed, 65 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 0a93831c0a02..1ef21ed01d1b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -410,6 +410,30 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> >   	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
> >   }
> > +/**
> > + * xe_gt_tlb_invalidation_vm - Issue a TLB invalidation on this GT for a VM
> > + * @gt: graphics tile
> > + * @vm: VM to invalidate
> > + *
> > + * Invalidate entire VM's address space
> > + */
> > +void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm)
> > +{
> > +	struct xe_gt_tlb_invalidation_fence fence;
> > +	u64 range = 1ull << vm->xe->info.va_bits;
> > +	int ret;
> > +
> > +	xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
> > +
> > +	ret = xe_gt_tlb_invalidation_range(gt, &fence, 0, range, vm->usm.asid);
> > +	if (ret < 0) {
> > +		xe_gt_tlb_invalidation_fence_fini(&fence);
> 
> IIRC we changed the tlb inval flow to do the fini() in the error case, so
> this will lead to double fini() I think?
> 

Indeed, good catch. Will fixup.

Thanks,
Matt

> > +		return;
> > +	}
> > +
> > +	xe_gt_tlb_invalidation_fence_wait(&fence);
> > +}
> > +
> >   /**
> >    * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
> >    * @gt: GT structure
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > index 672acfcdf0d7..abe9b03d543e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > @@ -12,6 +12,7 @@
> >   struct xe_gt;
> >   struct xe_guc;
> > +struct xe_vm;
> >   struct xe_vma;
> >   int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
> > @@ -21,6 +22,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
> >   int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> >   			       struct xe_gt_tlb_invalidation_fence *fence,
> >   			       struct xe_vma *vma);
> > +void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm);
> >   int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> >   				 struct xe_gt_tlb_invalidation_fence *fence,
> >   				 u64 start, u64 end, u32 asid);
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 99b97bf37c05..c5060011ad43 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -214,6 +214,20 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
> >   	xe_pt_free(pt);
> >   }
> > +/**
> > + * xe_pt_clear() - Clear a page-table.
> > + * @xe: xe device.
> > + * @pt: The page-table.
> > + *
> > + * Clears page-table by setting to zero.
> > + */
> > +void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
> > +{
> > +	struct iosys_map *map = &pt->bo->vmap;
> > +
> > +	xe_map_memset(xe, map, 0, 0, SZ_4K);
> > +}
> > +
> >   /**
> >    * DOC: Pagetable building
> >    *
> > diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> > index 9ab386431cad..8e43912ae8e9 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.h
> > +++ b/drivers/gpu/drm/xe/xe_pt.h
> > @@ -13,6 +13,7 @@ struct dma_fence;
> >   struct xe_bo;
> >   struct xe_device;
> >   struct xe_exec_queue;
> > +struct xe_svm_range;
> >   struct xe_sync_entry;
> >   struct xe_tile;
> >   struct xe_vm;
> > @@ -35,6 +36,8 @@ void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
> >   void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred);
> > +void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt);
> > +
> >   int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops);
> >   struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
> >   				       struct xe_vma_ops *vops);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index bc34e6738c8c..82026c5a154d 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1537,8 +1537,30 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> >   static void xe_vm_close(struct xe_vm *vm)
> >   {
> > +	bool migration = (vm->flags & XE_VM_FLAG_MIGRATION);
> > +
> >   	down_write(&vm->lock);
> > +
> >   	vm->size = 0;
> > +
> > +	if (!migration) {
> > +		struct xe_tile *tile;
> > +		struct xe_gt *gt;
> > +		u8 id;
> > +
> > +		/* Wait for pending binds */
> > +		dma_resv_wait_timeout(xe_vm_resv(vm),
> > +				      DMA_RESV_USAGE_BOOKKEEP,
> > +				      false, MAX_SCHEDULE_TIMEOUT);
> > +
> > +		for_each_tile(tile, vm->xe, id)
> > +			if (vm->pt_root[id])
> > +				xe_pt_clear(vm->xe, vm->pt_root[id]);
> > +
> > +		for_each_gt(gt, vm->xe, id)
> > +			xe_gt_tlb_invalidation_vm(gt, vm);
> > +	}
> > +
> >   	up_write(&vm->lock);
> >   }
> 
