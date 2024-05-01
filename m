Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E7D8B8E73
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 18:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2989F112395;
	Wed,  1 May 2024 16:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiTNaz2X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED17112395
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 16:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714582019; x=1746118019;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=L+6UPKw7xznMKUVCS/aFXdAnwYxxoaXDdYZ1rBT0n2U=;
 b=MiTNaz2XZMZlWDAwmZtPK+ZnK2AeIJQnDpZ1QkpsmuNBTBdi1+Oq+oZY
 Gq9e7XG5nz9MlTQTLhXX0dUalwWzTxum5Bc/3W5VPrf5y0FpGVJA2NNSY
 yH903HfNaHmdd8LASQoVPJfrlsmd7vSo/ZwChpMYCylgwFAvoHs0zg14+
 J6vvYRE9FM8cpCJ6sK2aCNQfC28237sZEz3vU40lkNeC7yipZXPM2ZvDw
 pzOBf3f4KRQTctWlctA38kP2aZ4FV/mQ8PrvnqGebSljq8ZbF7d3zDWBK
 y3GOgtbKXYey+Sz07M6GgMxR/tgaLqeS6gZ0J94SwR2x3qvmJPMxl76pn A==;
X-CSE-ConnectionGUID: jLDqnA3MREe28y4s+Q+DbA==
X-CSE-MsgGUID: IxjSLrqzSKKxty0YPQTzwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10443537"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="10443537"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 09:46:58 -0700
X-CSE-ConnectionGUID: nWbvDOhcRfGcvMoMfViNOA==
X-CSE-MsgGUID: rM5vpp2aS+iAYdDfBm7xnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="26692240"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 May 2024 09:46:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 09:46:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 09:46:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 1 May 2024 09:46:56 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 1 May 2024 09:46:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krOUqvW2tXYlbX1ZPgRaqiKE9h558nCTjlC+f3ctCLSmLNFgOeH0tLJfygkgD0VE/3uIBlvMn9ZGFjIIuAD5dsV3BhuxU6+K4/z6ekIggrx0lWWHBLWpOonxYT8tgIM99pdDrwKgttKMGYVGhuxpiC8/tIrTdEC5qKkvtnW7OlvTvE/k25RRgphNIw2yE4hWdtQhNCXtNn12AvzhuAqqx0cb0dik/Yu32/x/RAeHbh0qpvFwTtyFMpsTBjJVzsI8KBvvYf2gKvyNneD17iT/gZkulzh08iE+PjhRucjTMi7jpuAJutsa8VdHg+SgH3OIpd5mjNJVbQqg1HkGjTyNXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaPuwEYmutcWzq7YBAtZHOpyovpBQNDb1OkxxukiMf4=;
 b=M6Y2rXpCNbp6aKLZjLxgyClQms2AG2zuTDQgtYObnAjXO7p8lIZtKnuUdbIIuPBlavkbfo1dMfQxtWY2AZxQAhhgQSmVtcjK2R/DjqQrvsvAB1rr0Dv5S8CVUauOkPlp6ZmBz3dEvHArl7DH6htDEmHR3HshDwebSQ40Nm9vMcg+8t6anFWW8wTyWmVTnp1Y5Fmhh9pFqVBWh8zuJxHtCS07jmamZZljpavFZwrP+1AsZuXGQcC4bQAXNPjsL69cvNy8ZJ2sig+wa4NlJe+busO9KM2JEb+kn8f4OC+C7vIAlRrd95doY47UkM65DhhkttmHfvey36w/KQs5H3ddsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5195.namprd11.prod.outlook.com (2603:10b6:806:11a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Wed, 1 May
 2024 16:46:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Wed, 1 May 2024
 16:46:53 +0000
Date: Wed, 1 May 2024 11:46:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rob Clark <robdclark@gmail.com>
CC: Tvrtko Ursulin <tursulin@ursulin.net>, =?utf-8?Q?Adri=C3=A1n?= Larumbe
 <adrian.larumbe@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 <kernel@collabora.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/sysfs: Add drm class-wide attribute to get active
 device clients
Message-ID: <twot3k7225ruatdwl4tylq4d3ofe73nlcc7xychwdveziuycvh@5ar6qqrl3tuc>
References: <20240403182951.724488-1-adrian.larumbe@collabora.com>
 <CAF6AEGsWtJs2xcZx59P9_maxn1RqCO6-4GwEp2fL31bZtTyuoA@mail.gmail.com>
 <e6500d5b-0151-4c31-9032-3a23157b3126@ursulin.net>
 <4btlparspmb47v3nq3mip6cjr2adwejepnglvh6q5nlbmdzwvt@74gg6tjpngbv>
 <54ebd0a0-dc9d-43d7-b530-065832cda160@ursulin.net>
 <zz7tsf5ozqh24br7qgnslwmhgtgazeceif6ih22rjkl3bjfws4@u5bvmdjddzj6>
 <CAF6AEGu84At4V2GZvouOXkAKiKpA9jfxMtgxg=3hEai1iAqv+A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGu84At4V2GZvouOXkAKiKpA9jfxMtgxg=3hEai1iAqv+A@mail.gmail.com>
X-ClientProxiedBy: MW4PR04CA0192.namprd04.prod.outlook.com
 (2603:10b6:303:86::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5195:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c31a152-fbb5-447c-0f2c-08dc69fe4e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|7416005|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkFDeTFJb3dHbjhOT05xYlM1TzV1WnBQaFlTU3Z1eWdrUkUzM3JYbjJJenJL?=
 =?utf-8?B?Z3A1dzhBc3E5cHpiTG9XTktKUjd5dUZjSXhmYTBGU05adkU0N3plTzllVmhp?=
 =?utf-8?B?MndXS2xRYUVFRm5mRTlYczcvaW1VWnRRVHRRdkIyNkt3cXFIM211M0REanhL?=
 =?utf-8?B?b01aK1NUdWtGZEVnakV3WUlxUDNVd2JhZW5IMXlwQWpackUyYitKZmQvUGcw?=
 =?utf-8?B?bXQ0bFlwV3FCZ0E3TGMxNFNmUkpSSU1BMDRxNXZMSm0zbU5CZVRrMTVMNzRx?=
 =?utf-8?B?M2dWdzRlSTl0R2JHV0kyZ3g2T0JTZkR1R3J5V09pMnphUmFOOXgxOUhBa2pU?=
 =?utf-8?B?NzlRMG1NZHNBeFNPRTFpN0Q5TTBFdUF1NVpQeGNCbVQyWnpRaU1LNmNLUXdn?=
 =?utf-8?B?QWpiUjN2NklTZDJIRkxodGdHRXhzVVVtUkNKMTVOQkFZSDY2dlI4YzJWU3o0?=
 =?utf-8?B?disvUno4NUZkTXdZYUdSUUFoWjhXTSt4SytvQVY0Rlk0RmJTSVVmaStpUUtQ?=
 =?utf-8?B?bGNzZUdwQnhMTGM0cVVNbmttbDNhN1dnOFNKckp1cUhWbENUT3ZKckdLLzla?=
 =?utf-8?B?RWdhUFZoV0hsbFprZFp2NzNiYnRsTnlEL2tnaFpLUVJIVWdYZ3E1QTB3Z3hu?=
 =?utf-8?B?d3hReWdHbXl1S1F6S1R6U0N0SDhlUHoxN09USGZZZlNJbzhyRThiSkpBb0pB?=
 =?utf-8?B?bDYxbERjUnBqUHl0cmVSaVpCUlF3SVNjQmVsRnVoaWtyNDI3TFpsWldzNmNB?=
 =?utf-8?B?Nk0vcThRRVlYaUYzaTNRWkV2RDU1UE9WSnJzYSswTGZ4N1VzODJjR2dhM1dk?=
 =?utf-8?B?dFoyajk0Nks2TXRMQlRNZk9nalRmRXZETGpubXpUbGtoNUNoS05PaVNnRXVS?=
 =?utf-8?B?N1ZqQmJhNnlQQzRZeUZ3Q00va1d4K20zUFhhYThqWTdWVDIyTFBpb3RKdHBF?=
 =?utf-8?B?TEl6NlN1QVNOZTRLNjJLSEJaUHk4SW9lNVhtc2xlNzhyeUROZE9TVXh3S1BE?=
 =?utf-8?B?bDY0cXBjUmdVUURtNFBNT0lZVUNBYTlOT2RGeHdUNEtTbjBkRW84M2xJZ2h1?=
 =?utf-8?B?dWZNdFZIS2xIelBFUEpqVlByUFY0Yi9yM0RPRUZ5UVVuTUtGOUpRUDhHRHJR?=
 =?utf-8?B?cHpEVGNhY1lNN21KL08velZ3ZlUrYi9oZXIvVXBNMkFPa0wweXgwcnNleDdG?=
 =?utf-8?B?cTZEbFd4YTYybGZRLzUyaW5yNkxOQkF3RlJKQm9KVk1LaHBNQVN5UEs3MHJz?=
 =?utf-8?B?ODJyREFCaGNoRXJwR09taEtsVVRkSTBkRnQ3em02eWZnTnJVYkxiN1NZb0tp?=
 =?utf-8?B?OHdNUnRiSnlkVDU0ZVF1VDU0VnJqV0dVNTk1TDRVeWdoU09PSEFDSnRtL3Vy?=
 =?utf-8?B?NFBuVXk0TnV4NC9XaDFCN0FjZ1daUGFRRWtTOGdQYkp2dXNWalJmMTRVWWp3?=
 =?utf-8?B?QVdWREFsdlZiS21GSHR0OWt0QjVZek5ZZXkvVHRIdjMzR1pHOEFGRVVQc0po?=
 =?utf-8?B?TlZSYlhITHRGOHBhbCsycXpBeW1GZW5TVElUcC9Zc1QvWFNDQVpaRlF1WnI1?=
 =?utf-8?B?VUlFa0xoZlA5R2QydExwZVJteUxwcGJWdUQ5OHRLYUdZRnRwQUx5NTBoZThx?=
 =?utf-8?B?YXcxckJYY29oeXlUYS9iMXpUYUNUYzBWcVFTYnB4M2V0bHBSSk94TzJndFNh?=
 =?utf-8?B?ZUkzRWZ0aU5qZCs3VlZ1VzBRenBmc3pEZEM0VGVtNWRYU1FYQlJCSzZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVpMVngwck91TkM1bHdKWUZxZTJRU2JQZm8wUkw3VC9ySUlvRnFjMEV6MzBr?=
 =?utf-8?B?TWdiNThtK2FKMzl3U1pGN2ttWENDandWZi96QXVEblhoOTU4UTc1QytMOVl2?=
 =?utf-8?B?d2k0cUoyVGJrbVB0K05VMnJxbnNrNDFyOFNFZ0x2MWZPM3hxMldidXVTVStx?=
 =?utf-8?B?QU1Kc1ZnTU9FKzMyT3BDeWJGY05oWGUxZjVkRCtkblVvRWdHRW5pS05JOE9L?=
 =?utf-8?B?UFBiTTRFMk1lYytRQitnZ09wUGJqa1drZWxJVDNrYUpzRFVydmJWREhFRTVC?=
 =?utf-8?B?NlBNdDlTMHlFTFdac29vM29aRXR1d2dUcjU2NkJrUmZyb3FNN2tYUjEyb3Zx?=
 =?utf-8?B?YWJUZzBkQ0pqQWFRaVBDenI4RS9ML0dsN3YvcTJ3VVA2TkcrMGtBaGxsUW1X?=
 =?utf-8?B?NFlrdkIxY0tkU1NXWlc3Ri85VXVZR1JrOGl2MWtWdldlQWtpYkVPUHR3Yklx?=
 =?utf-8?B?cXh1b3dPTHFQdnlHa04vVDU5YkxJUnJjVSt6NDl5SC93ZktacWZIb1pHbFpp?=
 =?utf-8?B?WHZnWmVkc2ZZZkZWRW9CSU9MKzNic3Zzem1VdFlUKzg2aDR2dkRwL3R3cXZW?=
 =?utf-8?B?akRoUytsVWFvY1hCZ0xMZjhjbjlvU01XbWtjeE10aWsrUHVrTStvRmVDMWZw?=
 =?utf-8?B?alR4L1VHeCs4NkdQK0dCVCtHTWszMGc3NHlMQlJsY2Zxa2RNdExKUU1oKzhC?=
 =?utf-8?B?c3EvMFJ1dGFTd0VlOVZESElhc0lzQlUwSjJPZTkzZEdDUmQrOTFEWDhsTlNG?=
 =?utf-8?B?UnJyeVZCQ0kvb2VHWGNiZEd4dFp0Z2lSbGtqd3J5c0JiRXNWSzVRNmNBbDN0?=
 =?utf-8?B?anNsZ0o0NjM5VXBTckdaRHpiREhibnFkN3R2Q0ZPYTBSYWl1VnZqNWpGRE1V?=
 =?utf-8?B?eGltZnVhSE10WU1ieVdNdktvQVFGZy96RE5RQ3ZVK3RnVk1uYms2b1o4TEJl?=
 =?utf-8?B?cmhQSHRqa0J1ZkFicUNqZXo3UmVOamhuWEhaUE1ud05la1o3QS9sU0kreCtL?=
 =?utf-8?B?YnBSTkg5V3U5S3hiank4ajExeWhrOVZ3dXhlS0ZPd2o1T2kvQmlJS2sxL1lZ?=
 =?utf-8?B?Ykw5QWpBOUpqZlUwd2ZyM0dPb1RReU5HT01QRmZOWVAzd2UrQWFETkRrWDdu?=
 =?utf-8?B?UDBHQTl0TU0vemRrY3RGWjI4bVlJdExWc00zQnBuZE1zd3ZJWlJQOVhlTDFi?=
 =?utf-8?B?Ump6OG0zOE5idkh5YnRFd0NYZk5zQXFkdEFuSEVQYy9PWXhJUzVEK3IzRlht?=
 =?utf-8?B?bE9WU1gxWUdMTDJOY0d2SEwzM0huSTBzUGYrVjdjTjBNU283TWtBYVJ4WFM3?=
 =?utf-8?B?WStVd0FVdndNSDMxYVIvU3FkNFFVYUZza0xNNkVxaGkrK2dSVm4ySkY1QjFP?=
 =?utf-8?B?ZlhPbzFjYUlEWCtCRGZGbmtPYW5zbXJQaUNTcFpSSHZZYnhNcFowLy9jeUE3?=
 =?utf-8?B?K0VIVmhnWTl1WDh2QUZnNktVL0F4bWpKWWtXQzJEcVdxdnJCMVpPTnZjNWdV?=
 =?utf-8?B?YURScDg3Y09RcWpJUmFjcVRYVjdpbFJFVkZpTVpkVVo2RVpJVGtUWDZOUGxN?=
 =?utf-8?B?QkNRM1N1V1U0dVZubFFxeU5oNXZjVGVKSzFBbDFhNnVpQUUvcFpYbFFjTFlj?=
 =?utf-8?B?bmJxbGJIK0F5U242L243TzVsS1R2ZnlDMXlYaGd6QzVqd3g1cmx1SXpQZmFX?=
 =?utf-8?B?Tkk5bjE1Q2d0anRTdjNJdmtiVnowNVQ5U2JERnlPd1hwVFM5eWF0eVpQYnNH?=
 =?utf-8?B?djloV0FjZGdDQzVlWklnbTRpaitXOERteWgvZXFWZnFvdHIrTWh5WjgvOThQ?=
 =?utf-8?B?SjJXV3FmNHdBbU9OeFNsOW1XVmJjTG1LZnc2TFNLVzhWY1k2UGx0bnRMNC82?=
 =?utf-8?B?ZWZOcmJ6VFkyUmZoYUtFSFZBUzJjN0JGY2M5NXhMbTRhbWpjSzBrWE5aZjZj?=
 =?utf-8?B?QkVzaEcvRTVWZzFGMFhBWmZodEh1alBJZWVTSDdVVWdPOGsxZWk1My82L3ox?=
 =?utf-8?B?bWF4N0E1WlozQTZ3ektHbEZZQ05IREZROXVvQkcxMzQ4ZWZXQ05pMVhpQzJo?=
 =?utf-8?B?WFlLdlZmMEpmQlNheVBGRkdkcGlkeGJyc1E0Slk0ZkhLMW9QMFlyRWY4bmRm?=
 =?utf-8?B?WCtkM0FyQWtDRlJYTU52eWZaRWFUSFBrbnhtTlJiVENNNEE2d2Q2QVQ5NU50?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c31a152-fbb5-447c-0f2c-08dc69fe4e59
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 16:46:53.8683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7q7xiNIhiTRdPO28SQUC9BAK1XvS2wQmaWigCufp6aIsykNJKlGVNaVJE9/cmoiy/kYeIh/PsJoEWzhLBQHngJWRMz9RNcxzA2EwWV2DUlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5195
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

On Wed, May 01, 2024 at 09:25:01AM GMT, Rob Clark wrote:
>On Wed, May 1, 2024 at 9:19 AM Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>> On Wed, May 01, 2024 at 04:58:05PM GMT, Tvrtko Ursulin wrote:
>> >
>> >Hi,
>> >
>> >On 24/04/2024 15:48, Adrián Larumbe wrote:
>> >>Hi Tvrtko,
>> >>
>> >>On 15.04.2024 13:50, Tvrtko Ursulin wrote:
>> >>>
>> >>>On 05/04/2024 18:59, Rob Clark wrote:
>> >>>>On Wed, Apr 3, 2024 at 11:37 AM Adrián Larumbe
>> >>>><adrian.larumbe@collabora.com> wrote:
>> >>>>>
>> >>>>>Up to this day, all fdinfo-based GPU profilers must traverse the entire
>> >>>>>/proc directory structure to find open DRM clients with fdinfo file
>> >>>>>descriptors. This is inefficient and time-consuming.
>> >>>>>
>> >>>>>This patch adds a new device class attribute that will install a sysfs file
>> >>>>>per DRM device, which can be queried by profilers to get a list of PIDs for
>> >>>>>their open clients. This file isn't human-readable, and it's meant to be
>> >>>>>queried only by GPU profilers like gputop and nvtop.
>> >>>>>
>> >>>>>Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> >>>>>Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>> >>>>>Cc: Christopher Healy <healych@amazon.com>
>> >>>>>Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> >>>>
>> >>>>It does seem like a good idea.. idk if there is some precedent to
>> >>>>prefer binary vs ascii in sysfs, but having a way to avoid walking
>> >>>>_all_ processes is a good idea.
>> >>>
>> >>>I naturally second that it is a needed feature, but I do not think binary
>> >>>format is justified. AFAIR it should be used for things like hw/fw
>> >>>standardised tables or firmware images, not when exporting a simple list of
>> >>>PIDs. It also precludes easy shell/script access and the benefit of avoiding
>> >>>parsing a short list is I suspect completely dwarfed by needing to parse all
>> >>>the related fdinfo etc.
>> >>
>> >>I'd rather keep it as a binary file for the sake of easily parsing the number
>> >>list on the client side, in gputop or nvtop. For textual access, there's already
>> >>a debugfs file that presents the same information, so I thought it was best not
>> >>to duplicate that functionality and restrict sysfs to serving the very specific
>> >>use case of UM profilers having to access the DRM client list.
>> >>
>> >>I should mention I did something controversial here, which is a semantically
>> >>binary attribute through the regular attribute interface. I guess if I keep it
>> >>as a binary attribute in the end, I should switch over to the binary attribute
>> >>API.
>> >>
>> >>Another reason why I implemented it as a binary file is that we can only send
>> >>back at most a whole page. If a PID takes 4 bytes, that's usually 1024 clients
>> >>at most, which is probably enough for any UM profiler, but will decrease even
>> >>more if we turn it into an ASCII readable file.
>> >
>> >I'm afraid I still think there is no reason for a binary file, even
>> >less so artificially limited to 1024 clients. Any consumer will have
>> >to parse text fdinfo so a binary list of pids is not adding any real
>> >cost.
>>
>> yeah, I don't really understand why you'd want the binary number that
>> you'd then have to turn into a string to open the /proc/<pid>/. To me it
>> sounds more like we want a text output and that output to be:
>>
>> <pid>/fdinfo/<fd>
>>
>> So gputop could just read this file to know where the info is.
>> Too bad we can't symlink cross fs, otherwise we could just add symlinks
>> to e.g. /sys/class/drm/card<N>/clients/*, which then nicely separate it
>> per gpu too.
>>
>> But see below.
>>
>> >
>> >>I did some research into sysfs binary attributes, and while some sources mention that
>> >>it's often used for dumping or loading of driver FW, none of them claim it cannot
>> >>be used for other purposes.
>> >>
>> >>>>>---
>> >>>>>   drivers/gpu/drm/drm_internal.h       |  2 +-
>> >>>>>   drivers/gpu/drm/drm_privacy_screen.c |  2 +-
>> >>>>>   drivers/gpu/drm/drm_sysfs.c          | 89 ++++++++++++++++++++++------
>> >>>>>   3 files changed, 74 insertions(+), 19 deletions(-)
>> >>>>>
>> >>>>>diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>> >>>>>index 2215baef9a3e..9a399b03d11c 100644
>> >>>>>--- a/drivers/gpu/drm/drm_internal.h
>> >>>>>+++ b/drivers/gpu/drm/drm_internal.h
>> >>>>>@@ -145,7 +145,7 @@ bool drm_master_internal_acquire(struct drm_device *dev);
>> >>>>>   void drm_master_internal_release(struct drm_device *dev);
>> >>>>>
>> >>>>>   /* drm_sysfs.c */
>> >>>>>-extern struct class *drm_class;
>> >>>>>+extern struct class drm_class;
>> >>>>>
>> >>>>>   int drm_sysfs_init(void);
>> >>>>>   void drm_sysfs_destroy(void);
>> >>>>>diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
>> >>>>>index 6cc39e30781f..2fbd24ba5818 100644
>> >>>>>--- a/drivers/gpu/drm/drm_privacy_screen.c
>> >>>>>+++ b/drivers/gpu/drm/drm_privacy_screen.c
>> >>>>>@@ -401,7 +401,7 @@ struct drm_privacy_screen *drm_privacy_screen_register(
>> >>>>>          mutex_init(&priv->lock);
>> >>>>>          BLOCKING_INIT_NOTIFIER_HEAD(&priv->notifier_head);
>> >>>>>
>> >>>>>-       priv->dev.class = drm_class;
>> >>>>>+       priv->dev.class = &drm_class;
>> >>>>>          priv->dev.type = &drm_privacy_screen_type;
>> >>>>>          priv->dev.parent = parent;
>> >>>>>          priv->dev.release = drm_privacy_screen_device_release;
>> >>>>>diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
>> >>>>>index a953f69a34b6..56ca9e22c720 100644
>> >>>>>--- a/drivers/gpu/drm/drm_sysfs.c
>> >>>>>+++ b/drivers/gpu/drm/drm_sysfs.c
>> >>>>>@@ -58,8 +58,6 @@ static struct device_type drm_sysfs_device_connector = {
>> >>>>>          .name = "drm_connector",
>> >>>>>   };
>> >>>>>
>> >>>>>-struct class *drm_class;
>> >>>>>-
>> >>>>>   #ifdef CONFIG_ACPI
>> >>>>>   static bool drm_connector_acpi_bus_match(struct device *dev)
>> >>>>>   {
>> >>>>>@@ -128,6 +126,62 @@ static const struct component_ops typec_connector_ops = {
>> >>>>>
>> >>>>>   static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
>> >>>>>
>> >>>>>+static ssize_t clients_show(struct device *cd, struct device_attribute *attr, char *buf)
>> >>>>>+{
>> >>>>>+       struct drm_minor *minor = cd->driver_data;
>> >>>>>+       struct drm_device *ddev = minor->dev;
>> >>>>>+       struct drm_file *priv;
>> >>>>>+       ssize_t offset = 0;
>> >>>>>+       void *pid_buf;
>> >>>>>+
>> >>>>>+       if (minor->type != DRM_MINOR_RENDER)
>> >>>>>+               return 0;
>> >>>
>> >>>Why this?
>> >>
>> >>I return nothing in case of a non-render node because we don't want display drivers
>> >>to confuse UM GPU profilers.
>> >
>> >Feels to arbitrary to me. Let them handle it.
>> >
>> >>>>>+
>> >>>>>+       pid_buf = kvmalloc(PAGE_SIZE, GFP_KERNEL);
>> >>>
>> >>>I don't quite get the kvmalloc for just one page (or why even a temporay
>> >>>buffer and not write into buf directly?).
>> >>
>> >>Should've used kmalloc, you're right. Or else I could just write everything straight into 'buf'.
>> >>
>> >>>>>+       if (!pid_buf)
>> >>>>>+               return 0;
>> >>>>>+
>> >>>>>+       mutex_lock(&ddev->filelist_mutex);
>> >>>>>+       list_for_each_entry_reverse(priv, &ddev->filelist, lhead) {
>> >>>>>+               struct pid *pid;
>> >>>>>+
>> >>>>>+               if (drm_WARN_ON(ddev, (PAGE_SIZE - offset) < sizeof(pid_t)))
>> >>>>>+                       break;
>> >>>
>> >>>Feels bad.. I would suggest exploring implementing a read callback (instead of
>> >>>show) and handling arbitrary size output.
>> >>
>> >>I think regular class attributes can only implement show() and set(). For a more complex
>> >>interface, I would have to turn it into an actual binary attribute, and that would be the only
>> >>choice if we want the list of clients to be of arbitrary size.
>> >
>> >Yeah, i915 uses that to dump the error capture file which can be huge
>> >and is text so it is doable.
>> >
>> >>>>>+
>> >>>>>+               rcu_read_lock();
>> >>>>>+               pid = rcu_dereference(priv->pid);
>> >>>>>+               (*(pid_t *)(pid_buf + offset)) = pid_vnr(pid);
>> >>>>>+               rcu_read_unlock();
>> >>>>>+
>> >>>>>+               offset += sizeof(pid_t);
>> >>>>>+       }
>> >>>>>+       mutex_unlock(&ddev->filelist_mutex);
>> >>>>>+
>> >>>>>+       if (offset < PAGE_SIZE)
>> >>>>>+               (*(pid_t *)(pid_buf + offset)) = 0;
>> >>>
>> >>>Either NULL terminated or PAGE_SIZE/sizeof(pid) entries and not NULL
>> >>>terminated feels weird. If I got that right.
>> >>>
>> >>>For me everything points towards going for text output.
>> >>
>> >>Yes, I know it might sound weird, but my reasoning was: either there are PAGE_SIZE/sizeof(pid) entries
>> >>and the file isn't NULL terminated (which should be picked up by clients as being one page worth
>> >>of data, the sysfs attribute maximum transfer unit), or else there aren't enough entries to fill
>> >>a page and after the last one there's a NULL entry.
>> >>
>> >>
>> >>>>>+
>> >>>>>+       memcpy(buf, pid_buf, offset);
>> >>>>>+
>> >>>>>+       kvfree(pid_buf);
>> >>>>>+
>> >>>>>+       return offset;
>> >>>>>+
>> >>>>>+}
>> >>>>>+static DEVICE_ATTR_RO(clients);
>>
>>
>> /proc/<pid>/fdinfo/ is only readable by the owner. if we report what are
>> the open fds (or even what are the pids with a drm fd), we are
>> leaking that info. So we should probably make this
>> DEVICE_ATTR_ADMIN_RO.
>
>I think this is an argument for _only_ listing the PID and not full
>paths.  I have a use-case where I'd prefer it not to be
>DEVICE_ATTR_ADMIN_RO

maybe... today you still can't get the pids that have a file open, even if you
don't get the exact fd number. And it must have some good reasons because the
dir is S_IRUGO|S_IXUGO, yet kernel refuses to let me see what is inside.
This is interesting and possibly relevant to the discussion:

7bc3fa0172a4 ("procfs: allow reading fdinfo with PTRACE_MODE_READ")

>
>That said, I think I do prefer txt rather than binary.  If nothing
>else, it makes it easier to deal with for scripting, which is also
>useful sometimes.

agreed. Even if it's only pid, just make it text and the app will use it
as is to open the fdinfo path.

Lucas De Marchi

>
>BR,
>-R
>
>> Lucas De Marchi
>>
>> >>>
>> >>>Shouldn't BIN_ATTR_RO be used for binary files in sysfs?
>> >>
>> >>Like I said above, I sort of faked a binary attribute through the regular sysfs attr API,
>> >>which is most likely a bad idea.
>> >>
>> >>>Regards,
>> >>>
>> >>>Tvrtko
>> >>>
>> >>>P.S. Or maybe it is time for drmfs? Where each client gets a directory and
>> >>>drivers can populate files. Such as per client logging streams and whatnot.
>> >>
>> >>Yes, but maybe this is something we can discuss in depth in an RFC at a later time?
>> >
>> >Yes of course, it is just a long standing idea for flexible per client
>> >stuff.
>> >
>> >Regards,
>> >
>> >Tvrtko
>> >
>> >>
>> >>>>>+
>> >>>>>+static struct attribute *drm_device_attrs[] = {
>> >>>>>+       &dev_attr_clients.attr,
>> >>>>>+       NULL,
>> >>>>>+};
>> >>>>>+ATTRIBUTE_GROUPS(drm_device);
>> >>>>>+
>> >>>>>+struct class drm_class = {
>> >>>>>+       .name           = "drm",
>> >>>>>+       .dev_groups     = drm_device_groups,
>> >>>>>+};
>> >>>>>+
>> >>>>>+static bool drm_class_initialised;
>> >>>>>+
>> >>>>>   /**
>> >>>>>    * drm_sysfs_init - initialize sysfs helpers
>> >>>>>    *
>> >>>>>@@ -142,18 +196,19 @@ int drm_sysfs_init(void)
>> >>>>>   {
>> >>>>>          int err;
>> >>>>>
>> >>>>>-       drm_class = class_create("drm");
>> >>>>>-       if (IS_ERR(drm_class))
>> >>>>>-               return PTR_ERR(drm_class);
>> >>>>>+       err = class_register(&drm_class);
>> >>>>>+       if (err)
>> >>>>>+               return err;
>> >>>>>
>> >>>>>-       err = class_create_file(drm_class, &class_attr_version.attr);
>> >>>>>+       err = class_create_file(&drm_class, &class_attr_version.attr);
>> >>>>>          if (err) {
>> >>>>>-               class_destroy(drm_class);
>> >>>>>-               drm_class = NULL;
>> >>>>>+               class_destroy(&drm_class);
>> >>>>>                  return err;
>> >>>>>          }
>> >>>>>
>> >>>>>-       drm_class->devnode = drm_devnode;
>> >>>>>+       drm_class.devnode = drm_devnode;
>> >>>>>+
>> >>>>>+       drm_class_initialised = true;
>> >>>>>
>> >>>>>          drm_sysfs_acpi_register();
>> >>>>>          return 0;
>> >>>>>@@ -166,12 +221,12 @@ int drm_sysfs_init(void)
>> >>>>>    */
>> >>>>>   void drm_sysfs_destroy(void)
>> >>>>>   {
>> >>>>>-       if (IS_ERR_OR_NULL(drm_class))
>> >>>>>+       if (!drm_class_initialised)
>> >>>>>                  return;
>> >>>>>          drm_sysfs_acpi_unregister();
>> >>>>>-       class_remove_file(drm_class, &class_attr_version.attr);
>> >>>>>-       class_destroy(drm_class);
>> >>>>>-       drm_class = NULL;
>> >>>>>+       class_remove_file(&drm_class, &class_attr_version.attr);
>> >>>>>+       class_destroy(&drm_class);
>> >>>>>+       drm_class_initialised = false;
>> >>>>>   }
>> >>>>>
>> >>>>>   static void drm_sysfs_release(struct device *dev)
>> >>>>>@@ -372,7 +427,7 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
>> >>>>>                  return -ENOMEM;
>> >>>>>
>> >>>>>          device_initialize(kdev);
>> >>>>>-       kdev->class = drm_class;
>> >>>>>+       kdev->class = &drm_class;
>> >>>>>          kdev->type = &drm_sysfs_device_connector;
>> >>>>>          kdev->parent = dev->primary->kdev;
>> >>>>>          kdev->groups = connector_dev_groups;
>> >>>>>@@ -550,7 +605,7 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
>> >>>>>                          minor_str = "card%d";
>> >>>>>
>> >>>>>                  kdev->devt = MKDEV(DRM_MAJOR, minor->index);
>> >>>>>-               kdev->class = drm_class;
>> >>>>>+               kdev->class = &drm_class;
>> >>>>>                  kdev->type = &drm_sysfs_device_minor;
>> >>>>>          }
>> >>>>>
>> >>>>>@@ -579,10 +634,10 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
>> >>>>>    */
>> >>>>>   int drm_class_device_register(struct device *dev)
>> >>>>>   {
>> >>>>>-       if (!drm_class || IS_ERR(drm_class))
>> >>>>>+       if (!drm_class_initialised)
>> >>>>>                  return -ENOENT;
>> >>>>>
>> >>>>>-       dev->class = drm_class;
>> >>>>>+       dev->class = &drm_class;
>> >>>>>          return device_register(dev);
>> >>>>>   }
>> >>>>>   EXPORT_SYMBOL_GPL(drm_class_device_register);
>> >>>>>
>> >>>>>base-commit: 45c734fdd43db14444025910b4c59dd2b8be714a
>> >>>>>--
>> >>>>>2.44.0
>> >>>>>
>> >>
>> >>Adrian Larumbe
