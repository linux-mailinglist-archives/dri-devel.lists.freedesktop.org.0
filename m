Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B69588AC43
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 18:49:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1038610EA1E;
	Mon, 25 Mar 2024 17:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ioLsnaDE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B6910EA1C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 17:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711388945; x=1742924945;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aIhh5GPuRiyY82xcXHcX71qIVBqjcx+kYA9ogWq5Qks=;
 b=ioLsnaDEaG0qYUBxadssosnV58rt6mUnuOc/y27ryXU2tB4Nx/fMvzh5
 vfF1EkSKj0EQr311rAGcfJqE1Leloc3tifO4N6XsXeBAmVloRuUjshnrg
 IcOlg5ApAZR2x1ns16aFT0oSMsBoEi6zI7VnST2EU4Pi6TXTBSKVkPIfd
 3LQDiV5RSrxOZ52WLxc32Cf5V8hNIMG1JoDpz6UPa2W5V3sWMCgDgOQYh
 JnTZpMIMyyapOupFydaZK9tgBh5/JE2zlOTS9Bpcyszuy2+U6RMsUJQov
 6dfkE+f7cy2+xChiU2K3x2JgWcE77HDQoVU5zHuH1b4C7IfsIzV6TNa26 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="9372847"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="9372847"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 10:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="38812759"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 10:49:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 10:49:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 10:49:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 10:49:02 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 10:49:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tzbr0Z8FJOpC7jV8Hi7O+fi4xf+uNS/B0p/G/0HVSG3JQINkn/cHH641End6ggKWU+/Z0qLRhrx4FC7HTLvataWS7IfDtSwMv6A3ktr04ww1/h5oowcI67H096FvXM1dJdV62FGNyyqS5T6Dh6XLB5AaLCu7DZLRTH22ifh5rCIGt8FZfGo/0DrwTj7EIWJ/ghLNdFY9dfKZ+jdFNOlRL1AQ3a7WIaf5M1W8UDkBCyt5CsDMGtBSYHRsRQOBbcJdt8ZpepZbsk6XqU7pl9bsjbwwoRhlI5ydrRC1jJaB5yOGukfW6Hu2z/ZYYt6cJfAFMBSLXDN3Bo8QJpXOhEo8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+lKMhR1bqhYZazFyxYwvVeS3OyYRjY5ByqSRhXwedo=;
 b=d4uH4+22wDBYDxTZQuDAwL1U9GIpDBccOdCIj65YvWi7Xj0gGtKLvjBLehgBhsuzAnk4dZdyyIwl51pKfo/imT8N7CJnqRQSZpjwIJSn4PTFvGHUPGuuPq2NO+VNy8nUXARzycqxxSoZsgP7dexskh+cEosmw7ue/afSsAVGi3iCPY2qhQil/x35LaJmjy/t06Y/XieACuXkAWHELATRAU0l0O0WU+zp8DPZKBAo7qKZOmMjFdrLw0zsWFy55FyJfkqtj2FKwqxREn3mj7yIBZ9mmEvCFkwM4OaEFVjZRgjqcU13M4nNKp+gXGilN6mD3xqFldSNKVLxEf2sfP4jMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYXPR11MB8663.namprd11.prod.outlook.com (2603:10b6:930:da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 17:49:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 17:49:00 +0000
Date: Mon, 25 Mar 2024 12:48:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 03/12] drm/display: Make DisplayPort AUX Chardev Kconfig
 name consistent
Message-ID: <7dcukqqefq7g6rsk7cr7hehhkpfx7nqucrvlww4vbmrai2eidl@hg7p3prk55c4>
References: <20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org>
 <20240325-kms-kconfig-helpers-v1-3-bfec6949d9c3@kernel.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240325-kms-kconfig-helpers-v1-3-bfec6949d9c3@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYXPR11MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: 61dda7cb-099e-4e32-f0cd-08dc4cf3da7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YRWJ/0YTkzvcztn9SWxGJA5OcEHoUm9V3/moHq1oMt+Fr02eCymilqn+Tmt3XrwNcGSLKNiLpWGQB6+bqJESYGF5lTeNN/09dLeYWVL5LZ0zEKrQ46mjWX2gCkgY04UK1XzcgYf7Qa6YvfYKsZ6UgvCTdq+dt42oxa+YQPia0eloyjGJ/W/KDVfJdxkbnV8pmtMdo11fMFJEyOd/hUWlnOZvpfV9gO6rMKGymQaUK/afrqzh0qmpL11hL3cJDOma3RTB0O6heBAv6RD8nc8mx7zJ17W+QRQ8ezwDD6BL/pBn9AxENJcDANnl8VNxYahB/R6IYMJgq56ilh0IWafL20EXlJ2HRXblNspT7gk3ugCt/ssAyxLis+P7r/t9DmqbmNnYj4oCjMW39fhao3Q4+aLJaJQJy9l6c2W7l1f+ChEYCfUZbx2E5cp/7iXHPErvdJI4yYPChNJcxmVPNZPQSgIpqPgmSdc4ImomGv6CDTfpTy4vfWWOStIQ1Hr8y79i/7AE+xdrc0yrCRYtXsIXDjssSjCRK6NQ+3aQGWgWGcZTBO1x8zuFk+WJK/AAoRBrwKExb0+kJAS6UxDp9YSxflyddIvGZNSVLfrZknwZk68YjIMXEuC+XJUM2Z/ug4G1+3SjSJoPCE2NVh8CBwJZSwKMX84CtnlswS+c72BCL6g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mDnc4J6kgsWEBPArMHt9Mk8yZakGGj6aTPqZYpuZg0VTLYqd2CnK9CaODXIB?=
 =?us-ascii?Q?FZNBeseyrS1Z2fTSrSnPsnkgpeQcKNbsf4BWaS94FJxU3UaSwYqYwpq/sONv?=
 =?us-ascii?Q?qyAhbCrWRG+HdK29VMIjIQymeU80Xlsk7H9CfnvAxvfBk1NYwmrp0OrRcPPQ?=
 =?us-ascii?Q?XFcEtGq6SEYECo5+1lDW+VxDwxt17k3i/RhF7yZNiCM/uZdJYDr8UbtHHxjE?=
 =?us-ascii?Q?yfAH3RrRRAfgSXRadbNj/LYxMh5kNA5rHBbmnr4LTSPhhEmvSv8QgVGPQF47?=
 =?us-ascii?Q?wN6byJ1z4HGqKu6XIJYrkWTpR8IGMQuZOmMt3NCM5MSoBRU6LFOl6pkqkHWt?=
 =?us-ascii?Q?XxPUAVY/Z+4OQQwD5Kat+4EPNFdJt2DOgMQa3wIDJWh5TDPRJBy9QJN26r6r?=
 =?us-ascii?Q?PIMtWVjJXrVKnYpUqKsNJCmXRNtgh2w4iGfxG8+2GV9AlV6vmyf5WJGucAz3?=
 =?us-ascii?Q?TSBjn+/nR2mbwWcvN3oAXlLDnsZCpOPUCMCvoK4zrIjw520e5hbPwMWJy2sd?=
 =?us-ascii?Q?ud2+ZSuv3pu2E41guFAY/ULRevZrLMhmCUWNhZtKgy0jtuMHbByodNfAvKir?=
 =?us-ascii?Q?0BHF4Ty8WSEUZqrrZCciL/kzpeDMJJV8jcPNvWZdv/z+yiEbG+GuD4Lkmmcg?=
 =?us-ascii?Q?/Um6J4cv0+sV1JWgKLr4/xaezIieisF0phES5HRgXwfIbE7OvI5DOAXHGhJl?=
 =?us-ascii?Q?t/W6u1cF1UMZ3GmO4CtPYsvKkyq9xkEIVvZUd68JrkmIsGfxTRX2gtg5ruG1?=
 =?us-ascii?Q?CzjAFiAGnn9htXz1pnGRdMyoIGrqXIBmqFx9XIjTRWhxiVRjDajt6XERGpO3?=
 =?us-ascii?Q?eoi4d0SI6y0P6cZMwNNtV4CC/cRIy7M3k6JjHrSgzaXADa52gPAsmzGxqBP2?=
 =?us-ascii?Q?SV+87DhqP/xalajtEEqYDSuQ8MmEYQagtcd5HbR5ycDf2EsAo1Ux1V55yEx5?=
 =?us-ascii?Q?rdZkdr0aGB8r9NCOiZLFJfEkE4kHtJU0eAwhpGC5yb57GQ7mC/qV5NiyMd/T?=
 =?us-ascii?Q?h5MpGD/kDjajZg9bPubCSt7IV6bUGSfHJ1vAovN490mDpB8p5OlwN4AgaHHe?=
 =?us-ascii?Q?fFfWss56ILbhiAf2FOnn4Bdl3zZD7zdRDxuH1nDeEapfTYiQYY8lTgaOlHpy?=
 =?us-ascii?Q?KwcNr3QCaLCgjYxkPiSIvAuErmwFP2qE9/4qTJoby3emqiLEjX1Ny2uMIHH9?=
 =?us-ascii?Q?+2gz5xIwmehK038Pn7SRhz/tEHig5obV4JodoAXtau+p9azmaLYW6oCYgJGz?=
 =?us-ascii?Q?duO0Pg9ZwCxrRHWBW6VgrYEI7dt9NUEF8h2Ewqg6qGsoofMSR3wZoYH72X/P?=
 =?us-ascii?Q?54F5S1zcHHWmIItE8oejz46aAFyx1I8CkE+YnNYVkcJFjghlHuCii1DydweN?=
 =?us-ascii?Q?I/rnEHPhah3R2q03vcRBi85fiGpZ8rUMg0Dd1QwaXgxrS2bdl8UpOj+Z16Xw?=
 =?us-ascii?Q?5jWiySBmtktccY3qyb+UFZbJnPl71RJjAkZSB1KxkzquIB8d9un4jDjVA7db?=
 =?us-ascii?Q?7MNs2sDVCJm0/LChoP02bevhKXPMXdpFN5F0CXLWwu2ss48EDQqQJsKR7p46?=
 =?us-ascii?Q?qCNGRxoa2VQEZzRxsS4kP5RNWGGPFKfQ3jLa4MdL4f7msbfqKWg4xLBp2Wvg?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61dda7cb-099e-4e32-f0cd-08dc4cf3da7c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 17:49:00.7364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehy1InyjE0Eq9m2Nj8AK1YkFNMQ9fkwhKI4at7eq/s8hOf8O/5Xuf0waACsKH/FoJrPHA+owWVQYkGAztIKbs271G4xyXxW2ZHxZPoS4FcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8663
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

On Mon, Mar 25, 2024 at 01:52:05PM +0100, Maxime Ripard wrote:
>While most display helpers Kconfig symbols have the DRM_DISPLAY prefix,
>the DisplayPort-AUX chardev interface uses DRM_DP_AUX_BUS.

					    ^^^wrong copy & paste here,

Otherwise for patches 1-5: Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
