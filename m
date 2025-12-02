Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715F4C9D1E1
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 22:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CDD10E6E5;
	Tue,  2 Dec 2025 21:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fbLUgFzM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F9B10E6E5;
 Tue,  2 Dec 2025 21:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764712286; x=1796248286;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4gfWwt2aloQ7g3+nI+ThyanTTDfKVCGQsdyP6CP4vqM=;
 b=fbLUgFzMfpepCr/9HH+dI5AcTorIDSIBDR6QtgXjHvcuiAcVGvZjQG9D
 cs8qbS1hqcxTHYLTeBhgXWazngPbUdw5EQ9O/TmnMdDzd1KLP8NAdPfuY
 QAloReDkJNYaMb3ERhKLZEgoQSYdIIlLgQl0fqY48pD+StClq9/bMbV43
 RSY/+8/d7xTlsP5Jwaoi7KJun7B+Dg/iYJN0p/f9m8pzUd+o33PS5NHA9
 f/dIKXBKmgc/Sg3lyI+tcKDejCrsf+Prmn/yZ18SPZwOwaGlP29dfDeSQ
 7qdFXmLOhFQWYWbfc8dWoy3J3floweKCrvzNpz5jydmC2+C/tmBvOJfIM g==;
X-CSE-ConnectionGUID: xbr8kNZ7Tg+sFtgq9K0g/Q==
X-CSE-MsgGUID: czu3x3YvRAKXAKE4WJtvcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70314758"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="70314758"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:51:21 -0800
X-CSE-ConnectionGUID: By0LCpYiSaOUGbVmfDS2Mw==
X-CSE-MsgGUID: N9rj39v7QAilOizgTQgHkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="231833089"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:51:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:51:20 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:51:20 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:51:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=on0hpJmLLSllKRQ+xHwHL9qCmsIbFGagc/93zse+7CYLPxl7IF9KZythXBCH6iH7ItAxMAgZedzM9nSgI+OtCEJOFWFxE4Cvnj7/gO2lBu32qaaibYDVNYdpMBts/CX+JGnMmyKaPArApOUCh/pBv8xgnK/3FLgVAqN8yzaM7F7oJXX8pmQrkBQk5W/kNMfTYsrZnB90xbImmD3V36+iSbLHqY3qnBa5VAVZLLzZp4JHUDVr0218wWcS6Z9qTonfKGHKC6weVlmPHlgAnL1DY6AFxdw30JSIQKIAYYN5nZx1NzuxBDUwvF7NNSGPGCO5LSgby9xd/ppKxEtoRcWB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3yvp3vvVgKOjMXrFlBbTYXtV6IQDYWGfAi60svqHVQ=;
 b=MiWAuY55dgkHZQnoNJ/ofn453xmJAiXUKy9tLlyZzLXE1S2hISRSsOLsoiXMqdObYJKZrYyBXvadx1vrpF1lOP7d7Q2F2IMte0GT3HQlCJBXl+HcIjKQD5aDVt8XntHYF4HGpCAgIPFy0pOk1HSz4txfbE9CLmZ7AYjgnLRzNjAxb4+AHx48UnbJC7NwDiA39oArj2LlABLG8vhpcrzTSUUNGJIpIBAMfRr66jsgmzJwMOH25OJNkxDdcWt17Q9HXRwLAJebiv9jY6G+gp+A30j16L7A7tF3LaBHe2MbYcHGfPeazD7v4x5Pzl+Y9l0FHhi9oluvDQisvIbp52aatQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7290.namprd11.prod.outlook.com (2603:10b6:930:9a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 21:51:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 21:51:11 +0000
Date: Tue, 2 Dec 2025 13:51:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>, <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v29 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <aS9fTA8q4N5gyBEN@lstrano-desk.jf.intel.com>
References: <20251202184636.96142-7-jonathan.cavitt@intel.com>
 <20251202184636.96142-12-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251202184636.96142-12-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR04CA0186.namprd04.prod.outlook.com
 (2603:10b6:303:86::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: e8757e31-8a58-4574-db80-08de31ece890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?unX3hJQNx0L+UvlGVllpTWqZzXU34/7RMUXQlm6qNuAZ1cRwi2HOp4UYRv/3?=
 =?us-ascii?Q?arI4RsWiMD9NS3xzZRHH33/4maERl3fLf8Tsv61psBtPQQj84o8QQsasEKdm?=
 =?us-ascii?Q?G9FLWELzR8TUOvgylCaOXPg+j2kQyN0peNk0yk1ig/ZomfaEd2pxHj+2Hx/B?=
 =?us-ascii?Q?x0OPqq8SAtOrwDdzAd+nRGzjaCXYfUQTFDSJsvn1DP7+sXloMdxmmdh1gDn0?=
 =?us-ascii?Q?RsCfF8GdpYGtDzXTloV4JGhnue35qaoQyAmEuP3ZWJQKtDhQPYkqwqqOYEQw?=
 =?us-ascii?Q?/c4UAePjH5L8fK3porw37752Kq+k7n5/aMOZu4OQjfim11tQ7epBQtT5zDy4?=
 =?us-ascii?Q?wlkAL2sbBb2NMtiHdPDJm+P024XSKmMjGSRWOJC6tEMCe82+BtS1bEmCyw+Y?=
 =?us-ascii?Q?M52yJLxdDMJfPbdEuIBe0HWTx3+306lJJD/OP52hqB8JGpMDt/VoNptyvgGS?=
 =?us-ascii?Q?qsdeaJ7rY2qc/EUZ1W7CgO7li9Srt8Hz6LMUiY0GZcr1ktvR3ILax5VWTPcD?=
 =?us-ascii?Q?NB/WsEdqoB3gdnF9CGyBACYxN981+A2qzrLPHAwSSONqN8DwS9zrKIJnEqaS?=
 =?us-ascii?Q?3aREuGx9cgMp2hvsnZbbmhaozjDNBqUnZ7aOe4MsFVrpXV0ATIuqOy4JBUbB?=
 =?us-ascii?Q?Mkzq51yY6D3rs2uYgCuh6LrY8G/LyyZchlM8QWsj/jv/ZkV819obebqE/4dZ?=
 =?us-ascii?Q?vK1jB1JJYnJC9rdYy/vV9NZEaj8zpA+gMcWM9/ZVZd6RwNPf66XWb7qkwuVW?=
 =?us-ascii?Q?h7TVTLrXRv0Sm79ubbu3Caik07oblAkfHBX8sW/71EhXyz5PFXcfQkIlpx5x?=
 =?us-ascii?Q?Bw3Ch90CRAmimfDYPgVM/45+0PVW5juwsCGjw+0J9Vjg3HeqR0EZh0zs9Zpg?=
 =?us-ascii?Q?uD2G9oLrc/+dXmTPtN9nb9r1a9UrgjDNXe894Fn85XzGlR9MiS1w0VKM0Diz?=
 =?us-ascii?Q?zK58TYQbxvjBUY7LZEGaZ09x1bR8U/JbFsTv+HEmb1S+++O5ziTcCqQpnasP?=
 =?us-ascii?Q?K/sbLiNO515TfBPlqmjuv5KXlbnurBpk6DkdW86uA+KOTG7lUoO7qOgJJ2Cy?=
 =?us-ascii?Q?fW0cTFggPKW5OwwSXYEYz9Lf76vXxfSm7jFeIllnP2RfSTG0x/mnx4RQP0I6?=
 =?us-ascii?Q?7kUaZjaxEmhbel4W5FvUE9dFxM+0GP8UIn3zaCzGF/E/HGykmQRJqcqpWNwD?=
 =?us-ascii?Q?FCdtMGyOD40LHVD2zghjBxNSnebyEhOKSqDHn+/aK+RIcdEpU9ROOqn8aPI9?=
 =?us-ascii?Q?ngMz8hrqzbUfgOeGkCY74W2aFTn7wvs7pj41w7A3HlcvwUoi6TP2FLBnzZof?=
 =?us-ascii?Q?v4jQefqdTPcsKWnKI6eSGNjD6oiFAHAFTDqwXvVoP6wF3cONlXe1K0bYfeoP?=
 =?us-ascii?Q?bcxcHp6pkQyxaHguy9lThrcSipEcq09VHeJQdG+W3puEmfSlaEd/P6bBXklW?=
 =?us-ascii?Q?s/ZGjeuBdgx6rHpVX8bS/ibzsVwTDtjX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wIkMmwJakFzvpDBUOqlTuRUmXv8Nb6/fBhm0LP75g5XLe6LXJMVhrpQ7t9pB?=
 =?us-ascii?Q?C2hmD2/5nDnyVbvVakZ6Lb5hQkvbtuDw//YnGBohzbsnBc5mUgDQsx4HUb3h?=
 =?us-ascii?Q?hEL6zdoRsfAYGslODlyYj2WkzuFgCcV4IfDKr8kUjZl0qyl5lCNuwr5qwIZu?=
 =?us-ascii?Q?XIjBs4Udd824cnHZ+iTQkHL3AN1/YEUDzO2rtAcLtXmvztyvvmKfZhqkrRNy?=
 =?us-ascii?Q?VcmOS0w6wyPmMz4KJzfzGz92zM1YGMjaxY18vSp6TAdtgI0lrRXQKYCLS/oR?=
 =?us-ascii?Q?ppBFxtoA7lpYNL7gdomvLmravIml0iWbGK2Tei2d/+LjNuLv7Yq9ZiWtGr4o?=
 =?us-ascii?Q?pKwNOQwI600hvaWlmDOsMNz2stEXhq3dLTSMTUqaiKaVSIxTQKqGJvDdcc1z?=
 =?us-ascii?Q?iCX9mzE+prw6u+Sm02IwoE2mYnMC1CMVlHLIUW/G+u4vhNFVZtYrl9jUtOEx?=
 =?us-ascii?Q?AoTfolbEvUsBpbLr8MgQlTMvV8vcRqeyMydGZHUehldzeSD7uiXXwzW61qxF?=
 =?us-ascii?Q?C5VQzZv79VNlm6VHUHQd7zqrbXOrAt7rB4ky6LkKzE6DbDv9HK/K1xUK+dBs?=
 =?us-ascii?Q?LpHr4JEirEMFj1g9QyIA5sX7dzmEj6Xv6CFRtLBwBu/QW6hLWsjwfRonwi3u?=
 =?us-ascii?Q?GEa2SFIfpOw5FSrDIwv+lzwSJK1WWpOtj6j4AfCQ85LOfJV4MqALaUYPLwPa?=
 =?us-ascii?Q?e9td72LQ+Zs+mr76s55ywn/rWVv0546+WmS+1eN6ldH+cHVx8d/apBoKDpU5?=
 =?us-ascii?Q?MS6RFXxuj2+/n4pPkmw1HNm0i2/EAPdmU4Fwyx9zEl9iRVJGslbNdoGK2IX2?=
 =?us-ascii?Q?B3wVJPuWfAUVAj9IXPHO72ckJeskgC6KUMVsaC0FU/1Zn5t+yh8q/5FZxNDz?=
 =?us-ascii?Q?bUcVnoJ2hfHUakU1ul8tUY+2Q+kXGT73eK0cJetfPXxJB/w/34FtyLQ7dAsK?=
 =?us-ascii?Q?h3nj8UJzr+Z/agAuXsGCdaXdXFhG0jT+DCyYA5X8HUYCvd9dWymfvfBugUJw?=
 =?us-ascii?Q?RZJLnAQXJ94dShLrNryFT8BrnakHd7BCqAgZfhpe1beyCYhR47POz2RBoCHv?=
 =?us-ascii?Q?2QolCX24hTYKzEcWWkPnCk5YvMDt7kaPZTr/XPrxY/B8nQCqcDqL3KzzGces?=
 =?us-ascii?Q?3TzTVLndGFOkd7uwyVojWwsDV5bGVismERwYqRYjnAwz5A+mFel0NvHMsXih?=
 =?us-ascii?Q?Gj7lkk0WJMok3Sizom0ghCNTOLrQz7d2IDbv+pAe0AjWeBgLU7d5NSL3XVfw?=
 =?us-ascii?Q?SVZN9RLvhlW8mofbX7AfpucjtQAY+HD/To4c5QvGXt/h+VuggK+i10QjcTe4?=
 =?us-ascii?Q?RZgIPeDChftPpFO61gRsSuY0JRTfMbfsF2awvmqZoC9zeoBuvgRysyW3FXzO?=
 =?us-ascii?Q?tpJfwW2uyneJOt5SAIJwpB6SXfU6Y+XpIw2fg3FIDrwUCHAX+t4P5rVHfl0r?=
 =?us-ascii?Q?gtXO0i7YmW9tqYgDTo+PNoF9KWHGnBEPFwCpyufozX1ki4xt5WMsvVLGJgx5?=
 =?us-ascii?Q?jC25fpcgovbLP6VKrZRy/RDJBk+yUpo1PKtn3IfGpAiwm655qUvJXyAELjcv?=
 =?us-ascii?Q?JvQu9gei726BzdZk9e6uu9WE4HSoxZ6t04VM15g5eNu8NUOlTZ1zwFWrxi9X?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8757e31-8a58-4574-db80-08de31ece890
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:51:11.8440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KjDPC9AeT2DgsU12aRW0k/a8CFfiMY25BGv18S0lvz7caEbWZg3c85pFC79awd5InOm+tZ79IR0IrIjcFgRgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7290
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

On Tue, Dec 02, 2025 at 06:46:42PM +0000, Jonathan Cavitt wrote:
> Add support for userspace to request a list of observed faults
> from a specified VM.
> 
> v2:
> - Only allow querying of failed pagefaults (Matt Brost)
> 
> v3:
> - Remove unnecessary size parameter from helper function, as it
>   is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>   purposes.  Total memory usage is reported separately.
> 
> v4:
> - Return int from xe_vm_get_property_size (Shuicheng)
> - Fix memory leak (Shuicheng)
> - Remove unnecessary size variable (jcavitt)
> 
> v5:
> - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
> - Update fill_property_pfs to eliminate need for kzalloc (Jianxun)
> 
> v6:
> - Repair and move fill_faults break condition (Dan Carpenter)
> - Free vm after use (jcavitt)
> - Combine assertions (jcavitt)
> - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> - Remove return mask from fill_faults, as return is already -EFAULT or 0
>   (jcavitt)
> 
> v7:
> - Revert back to using xe_vm_get_property_ioctl
> - Apply better copy_to_user logic (jcavitt)
> 
> v8:
> - Fix and clean up error value handling in ioctl (jcavitt)
> - Reapply return mask for fill_faults (jcavitt)
> 
> v9:
> - Future-proof size logic for zero-size properties (jcavitt)
> - Add access and fault types (Jianxun)
> - Remove address type (Jianxun)
> 
> v10:
> - Remove unnecessary switch case logic (Raag)
> - Compress size get, size validation, and property fill functions into a
>   single helper function (jcavitt)
> - Assert valid size (jcavitt)
> 
> v11:
> - Remove unnecessary else condition
> - Correct backwards helper function size logic (jcavitt)
> 
> v12:
> - Use size_t instead of int (Raag)
> 
> v13:
> - Remove engine class and instance (Ivan)
> 
> v14:
> - Map access type, fault type, and fault level to user macros (Matt
>   Brost, Ivan)
> 
> v15:
> - Remove unnecessary size assertion (jcavitt)
> 
> v16:
> - Nit fixes (Matt Brost)
> 
> v17:
> - Rebase and refactor (jcavitt)
> 
> v18:
> - Do not copy_to_user in critical section (Matt Brost)
> - Assert args->size is multiple of sizeof(struct xe_vm_fault) (Matt
>   Brost)
> 
> v19:
> - Remove unnecessary memset (Matt Brost)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Jainxun Zhang <jianxun.zhang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |   2 +
>  drivers/gpu/drm/xe/xe_vm.c     | 117 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |   3 +
>  3 files changed, 122 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1197f914ef77..69baf01f008a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -207,6 +207,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS, xe_vm_query_vmas_attrs_ioctl,
>  			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
> +			  DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 41fd352dcfb2..eb293c7b7c0c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3850,6 +3850,123 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	return err;
>  }
>  
> +/*
> + * Map access type, fault type, and fault level from current bspec
> + * specification to user spec abstraction.  The current mapping is
> + * 1-to-1, but if there is ever a hardware change, we will need
> + * this abstraction layer to maintain API stability through the
> + * hardware change.
> + */
> +static u8 xe_to_user_access_type(u8 access_type)
> +{
> +	return access_type;
> +}
> +
> +static u8 xe_to_user_fault_type(u8 fault_type)
> +{
> +	return fault_type;
> +}
> +
> +static u8 xe_to_user_fault_level(u8 fault_level)
> +{
> +	return fault_level;
> +}
> +
> +static int fill_faults(struct xe_vm *vm,
> +		       struct drm_xe_vm_get_property *args)
> +{
> +	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->data);
> +	struct xe_vm_fault *fault_list, fault_entry = { 0 };
> +	struct xe_vm_fault_entry *entry;
> +	int ret = 0, i = 0, count, entry_size;
> +
> +	entry_size = sizeof(struct xe_vm_fault);
> +	count = args->size / entry_size;
> +
> +	fault_list = kcalloc(count, sizeof(struct xe_vm_fault), GFP_KERNEL);
> +	if (!fault_list)
> +		return -ENOMEM;
> +
> +	spin_lock(&vm->faults.lock);
> +	list_for_each_entry(entry, &vm->faults.list, list) {
> +		if (i == count)
> +			break;
> +
> +		fault_entry.address = entry->address;
> +		fault_entry.address_precision = entry->address_precision;
> +
> +		fault_entry.access_type = xe_to_user_access_type(entry->access_type);
> +		fault_entry.fault_type = xe_to_user_fault_type(entry->fault_type);
> +		fault_entry.fault_level = xe_to_user_fault_level(entry->fault_level);
> +
> +		memcpy(&fault_list[i], &fault_entry, entry_size);
> +
> +		i++;
> +	}
> +	spin_unlock(&vm->faults.lock);
> +
> +	ret = copy_to_user(usr_ptr, fault_list, args->size);
> +
> +	kfree(fault_list);
> +	return ret ? -EFAULT : 0;
> +}
> +
> +static int xe_vm_get_property_helper(struct xe_vm *vm,
> +				     struct drm_xe_vm_get_property *args)
> +{
> +	size_t size;
> +
> +	switch (args->property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		spin_lock(&vm->faults.lock);
> +		size = size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
> +		spin_unlock(&vm->faults.lock);
> +
> +		if (!args->size) {
> +			args->size = size;
> +			return 0;
> +		}
> +
> +		/*
> +		 * Number of faults may increase between calls to
> +		 * xe_vm_get_property_ioctl, so just report the number of
> +		 * faults the user requests if it's less than or equal to
> +		 * the number of faults in the VM fault array.
> +		 *
> +		 * We should also at least assert that the args->size value
> +		 * is a multiple of the xe_vm_fault struct size.
> +		 */
> +		if (args->size > size || args->size % sizeof(struct xe_vm_fault))
> +			return -EINVAL;
> +
> +		return fill_faults(vm, args);
> +	}
> +	return -EINVAL;
> +}
> +
> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(drm);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vm_get_property *args = data;
> +	struct xe_vm *vm;
> +	int ret = 0;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1] ||
> +			     args->reserved[2]))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -ENOENT;
> +
> +	ret = xe_vm_get_property_helper(vm, args);
> +
> +	xe_vm_put(vm);
> +	return ret;
> +}
> +
>  /**
>   * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
>   * @vm: VM to bind the BO to
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index e9f2de4189e0..f2675ec9e8c4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -210,6 +210,9 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
>  int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
> +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
> +
>  void xe_vm_close_and_put(struct xe_vm *vm);
>  
>  static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
> -- 
> 2.43.0
> 
